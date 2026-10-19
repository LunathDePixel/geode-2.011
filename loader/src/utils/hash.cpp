#include <Geode/utils/hash.hpp>
#ifdef GEODE_IS_WINDOWS32
#include <Windows.h>
#include <bcrypt.h>
#else
#include <openssl/sha.h>
#include <openssl/evp.h>
#endif
#include <Geode/loader/Log.hpp>
#include <Geode/utils/terminate.hpp>
#include <Geode/utils/general.hpp>
#include <Geode/utils/file.hpp>

namespace geode {

#ifdef GEODE_IS_WINDOWS32
// GD 2.011 port: no OpenSSL on 32-bit Windows (geode-sdk/net_libs has no Win32 build);
// SHA-256 through Windows CNG instead
namespace {
    struct CngSha256 {
        BCRYPT_ALG_HANDLE alg = nullptr;
        BCRYPT_HASH_HANDLE hash = nullptr;
    };
}

Sha256Hasher::Sha256Hasher() {
    auto state = new CngSha256();
    if (!BCRYPT_SUCCESS(BCryptOpenAlgorithmProvider(&state->alg, BCRYPT_SHA256_ALGORITHM, nullptr, 0))) {
        utils::terminate("BCryptOpenAlgorithmProvider failed");
    }
    m_state = state;
    this->reset();
}

void Sha256Hasher::reset() {
    auto state = static_cast<CngSha256*>(m_state);
    if (state->hash) BCryptDestroyHash(state->hash);
    state->hash = nullptr;
    if (!BCRYPT_SUCCESS(BCryptCreateHash(state->alg, &state->hash, nullptr, 0, nullptr, 0, 0))) {
        utils::terminate("BCryptCreateHash failed");
    }
}

Sha256Hasher::~Sha256Hasher() {
    if (auto state = static_cast<CngSha256*>(m_state)) {
        if (state->hash) BCryptDestroyHash(state->hash);
        if (state->alg) BCryptCloseAlgorithmProvider(state->alg, 0);
        delete state;
    }
}

Sha256Hasher::Sha256Hasher(Sha256Hasher&& other) noexcept {
    *this = std::move(other);
}

Sha256Hasher& Sha256Hasher::operator=(Sha256Hasher&& other) noexcept {
    if (this != &other) {
        this->~Sha256Hasher();
        m_state = other.m_state;
        other.m_state = nullptr;
    }
    return *this;
}

void Sha256Hasher::update(std::span<uint8_t const> data) {
    update(data.data(), data.size());
}

void Sha256Hasher::update(void const* data, size_t bytes) {
    auto state = static_cast<CngSha256*>(m_state);
    BCryptHashData(state->hash, static_cast<PUCHAR>(const_cast<void*>(data)), static_cast<ULONG>(bytes), 0);
}

void Sha256Hasher::update(std::string_view data) {
    update(data.data(), data.size());
}

Sha256 Sha256Hasher::finish() const {
    // finish a copy so the hasher itself stays usable, like EVP_DigestFinal_ex's callers expect
    auto state = static_cast<CngSha256*>(m_state);
    Sha256 hash;
    BCRYPT_HASH_HANDLE copy = nullptr;
    BCryptDuplicateHash(state->hash, &copy, nullptr, 0, 0);
    BCryptFinishHash(copy, hash.data.data(), static_cast<ULONG>(hash.data.size()), 0);
    BCryptDestroyHash(copy);
    return hash;
}
#else
Sha256Hasher::Sha256Hasher() {
    // In theory, this should never fail unless out of memory, in which case there's little we can do anyway
    m_state = EVP_MD_CTX_new();
    if (!m_state) {
        utils::terminate("EVP_MD_CTX_new failed");
    }

    this->reset();
}

void Sha256Hasher::reset() {
    EVP_DigestInit_ex(static_cast<EVP_MD_CTX*>(m_state), EVP_sha256(), nullptr);
}

Sha256Hasher::~Sha256Hasher() {
    EVP_MD_CTX_free(static_cast<EVP_MD_CTX*>(m_state));
}

Sha256Hasher::Sha256Hasher(Sha256Hasher&& other) noexcept {
    *this = std::move(other);
}

Sha256Hasher& Sha256Hasher::operator=(Sha256Hasher&& other) noexcept {
    if (this != &other) {
        EVP_MD_CTX_free(static_cast<EVP_MD_CTX*>(m_state));
        m_state = other.m_state;
        other.m_state = nullptr;
    }
    return *this;
}

void Sha256Hasher::update(std::span<uint8_t const> data) {
    update(data.data(), data.size());
}

void Sha256Hasher::update(void const* data, size_t bytes) {
    EVP_DigestUpdate(static_cast<EVP_MD_CTX*>(m_state), data, bytes);
}

void Sha256Hasher::update(std::string_view data) {
    update(data.data(), data.size());
}

Sha256 Sha256Hasher::finish() const {
    Sha256 hash;
    EVP_DigestFinal_ex(static_cast<EVP_MD_CTX*>(m_state), hash.data.data(), nullptr);
    return hash;
}

#endif

Result<Sha256> sha256File(std::filesystem::path const& path) {
    Sha256Hasher hasher;

    std::ifstream file(path, std::ios::binary);
    if (!file.is_open()) {
        return Err("Failed to open file '{}' for reading", path);
    }

    uint8_t buf[4096];
    while (file.good()) {
        file.read(reinterpret_cast<char*>(buf), sizeof(buf));
        auto read = file.gcount();

        if (read > 0) {
            hasher.update(buf, read);
        }
    }

    return Ok(hasher.finish());
}

Sha256 sha256(std::span<uint8_t const> data) {
    Sha256Hasher hasher;
    hasher.update(data);
    return hasher.finish();
}

Sha256 sha256(std::string_view data) {
    return sha256(std::span{reinterpret_cast<const uint8_t*>(data.data()), data.size()});
}

}
