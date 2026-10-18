#include <Geode/modify/IDManager.hpp>

using namespace geode;

NodeIDs* NodeIDs::get() {
    static auto inst = new NodeIDs;
    return inst;
}

#include <Geode/Bindings.hpp>
#include <Geode/loader/Log.hpp>
#include <cstdlib>

static void dumpNode2011(cocos2d::CCNode* node, int depth, int index, std::string& out) {
    auto pos = node->getPosition();
    auto size = node->getContentSize();
    out += fmt::format(
        "{}[{}] {} z={} tag={} pos=({:.1f},{:.1f}) size=({:.1f},{:.1f}) scale={:.2f}{}",
        std::string(depth * 2, ' '), index, typeid(*node).name(), node->getZOrder(), node->getTag(),
        pos.x, pos.y, size.width, size.height, node->getScale(), node->isVisible() ? "" : " hidden"
    );
    if (auto label = dynamic_cast<cocos2d::CCLabelBMFont*>(node)) {
        out += fmt::format(" \"{}\"", label->getString());
    }
    out += "\n";
    if (depth > 4) return;
    int i = 0;
    if (auto children = node->getChildren()) {
        for (auto child : geode::cocos::CCArrayExt<cocos2d::CCNode*>(children)) {
            dumpNode2011(child, depth + 1, i++, out);
        }
    }
}

bool NodeIDs::dumpVanilla2011(cocos2d::CCNode* layer, char const* name) {
    static bool on = std::getenv("GEODE_2011_DUMP_IDS") != nullptr;
    if (!on) return false;
    std::string out;
    dumpNode2011(layer, 0, 0, out);
    log::info("vanilla tree of {}:\n{}", name, out);
    // Geode's own MenuLayer hook needs that layer's IDs
    return std::string_view(name) != "MenuLayer";
}

namespace {
    struct Placement2011 {
        geode::Ref<cocos2d::CCNode> node;
        cocos2d::CCPoint world;
        cocos2d::CCSize size;
        float scaleX, scaleY;
    };

    void collect2011(cocos2d::CCNode* node, std::vector<Placement2011>& out) {
        if (auto parent = node->getParent()) {
            out.push_back({
                node, parent->convertToWorldSpace(node->getPosition()),
                node->getContentSize(), node->getScaleX(), node->getScaleY()
            });
        }
        if (auto children = node->getChildren()) {
            for (auto child : geode::cocos::CCArrayExt<cocos2d::CCNode*>(children)) {
                collect2011(child, out);
            }
        }
    }
}

namespace {
    struct Snapshot2011 {
        geode::Ref<cocos2d::CCNode> layer;
        std::vector<Placement2011> nodes;
    };

    // keepContainers: leave layout containers where calibrate2011 moved them
    void apply2011(std::vector<Placement2011> const& list, bool keepContainers = false) {
        // parents first (collected in tree order), so each child converts against a restored parent
        for (auto& p : list) {
            auto parent = p.node->getParent();
            if (!parent) continue;
            if (keepContainers && p.node->getLayout()) continue;
            p.node->setScaleX(p.scaleX);
            p.node->setScaleY(p.scaleY);
            // AxisLayout auto-scale also rewrites a button's press-animation base scale
            if (auto btn = geode::cast::typeinfo_cast<CCMenuItemSpriteExtra*>(p.node.data())) {
                btn->m_baseScale = p.scaleX;
            }
            // a layout container keeps the size its provider gave it, so a mod's later
            // updateLayout() (e.g. MenuLayer's Geode button) lays out within the intended bounds
            if (!p.node->getLayout()) {
                p.node->setContentSize(p.size);
            }
            p.node->setPosition(parent->convertToNodeSpace(p.world));
        }
    }

    void collectLayouts2011(cocos2d::CCNode* node, std::vector<cocos2d::CCNode*>& out) {
        if (node->getLayout()) out.push_back(node);
        if (auto children = node->getChildren()) {
            for (auto child : geode::cocos::CCArrayExt<cocos2d::CCNode*>(children)) {
                collectLayouts2011(child, out);
            }
        }
    }

    std::string name2011(cocos2d::CCNode* node) {
        if (!node) return "null";
        if (!node->getID().empty()) return node->getID();
        auto parent = node->getParent();
        return fmt::format(
            "{}[{}]", name2011(parent),
            parent ? parent->getChildren()->indexOfObject(node) : 0
        );
    }

    // GEODE_2011_TEST_LAYOUTS=1: run every layout once and log each vanilla node it moves or
    // rescales, i.e. where a mod's updateLayout() would break the 2.0 screen
    void testLayouts2011(Snapshot2011 const& snap) {
        std::vector<cocos2d::CCNode*> containers;
        collectLayouts2011(snap.layer, containers);
        for (auto c : containers) c->updateLayout();
        std::string out;
        int moved = 0;
        for (auto& p : snap.nodes) {
            auto parent = p.node->getParent();
            if (!parent || !parent->getLayout()) continue;
            auto world = parent->convertToWorldSpace(p.node->getPosition());
            auto dx = world.x - p.world.x, dy = world.y - p.world.y;
            auto ds = p.node->getScaleX() - p.scaleX;
            if (std::abs(dx) > 0.5f || std::abs(dy) > 0.5f || std::abs(ds) > 0.01f) {
                moved++;
                out += fmt::format(
                    "  {} moved ({:.1f},{:.1f}) scale {:.2f}->{:.2f}\n",
                    name2011(p.node), dx, dy, p.scaleX, p.node->getScaleX()
                );
            }
        }
        log::info("layout test of {}: {} vanilla nodes off\n{}", snap.layer->getID(), moved, out);
        apply2011(snap.nodes);
    }
}

namespace {
    // world position of each vanilla child of container c, keyed by node
    struct Calib2011 {
        cocos2d::CCNode* node;
        cocos2d::CCPoint world;
    };

    // squared error of the current layout against vanilla, after removing the mean offset
    float layoutError2011(std::vector<Calib2011> const& nodes, cocos2d::CCPoint* meanOut) {
        cocos2d::CCPoint mean = { 0, 0 };
        std::vector<cocos2d::CCPoint> deltas;
        for (auto& n : nodes) {
            auto world = n.node->getParent()->convertToWorldSpace(n.node->getPosition());
            deltas.push_back(n.world - world);
            mean = mean + n.world - world;
        }
        mean = mean / static_cast<float>(nodes.size());
        float err = 0;
        for (auto& d : deltas) {
            auto e = d - mean;
            err += e.x * e.x + e.y * e.y;
        }
        if (meanOut) *meanOut = mean;
        return err;
    }

    // Geode's layouts are tuned for 2.2's screens. Fit each AxisLayout to the vanilla 2.0
    // placement that apply2011 just restored: pick the gap that best reproduces the vanilla
    // spacing, then move the container so a later updateLayout() lands on the vanilla positions.
    void calibrate2011(Snapshot2011 const& snap) {
        std::vector<cocos2d::CCNode*> containers;
        collectLayouts2011(snap.layer, containers);
        for (auto c : containers) {
            auto layout = geode::cast::typeinfo_cast<cocos2d::AxisLayout*>(c->getLayout());
            if (!layout) continue;
            std::vector<Calib2011> nodes;
            for (auto& p : snap.nodes) {
                if (p.node->getParent() == c && (!layout->isIgnoreInvisibleChildren() || p.node->isVisible())) {
                    nodes.push_back({ p.node, p.world });
                }
            }
            if (nodes.empty()) continue;

            // auto-scale would grow a vanilla node to its max scale (1, or a label's 0.5);
            // cap each one at its 2.0 scale
            for (auto& n : nodes) {
                auto opts = geode::cast::typeinfo_cast<cocos2d::AxisLayoutOptions*>(n.node->getLayoutOptions());
                if (!opts) {
                    opts = cocos2d::AxisLayoutOptions::create();
                    n.node->setLayoutOptions(opts, false);
                }
                auto scale = n.node->getScale();
                if (opts->getMaxScale() > scale) opts->setMaxScale(scale);
                if (opts->getMinScale() > scale) opts->setMinScale(scale);
            }

            if (nodes.size() >= 2) {
                // coarse scan then refine; the error is piecewise smooth (rows wrap, nodes rescale)
                float best = layout->getGap(), bestErr = INFINITY;
                for (float g = -20.f; g <= 80.f; g += 1.f) {
                    layout->setGap(g);
                    c->updateLayout();
                    auto err = layoutError2011(nodes, nullptr);
                    if (err < bestErr - 0.01f) { bestErr = err; best = g; }
                }
                for (float step : { .5f, .25f, .1f, .05f }) {
                    for (float g : { best - step, best + step }) {
                        layout->setGap(g);
                        c->updateLayout();
                        auto err = layoutError2011(nodes, nullptr);
                        if (err < bestErr - 0.0001f) { bestErr = err; best = g; }
                    }
                }
                layout->setGap(best);
            }
            c->updateLayout();
            cocos2d::CCPoint mean;
            layoutError2011(nodes, &mean);
            if (auto parent = c->getParent()) {
                auto world = parent->convertToWorldSpace(c->getPosition());
                c->setPosition(parent->convertToNodeSpace(world + mean));
            }
        }
    }
}

void* NodeIDs::snapshot2011(cocos2d::CCNode* layer) {
    auto out = new Snapshot2011 { layer, {} };
    if (auto children = layer->getChildren()) {
        for (auto child : geode::cocos::CCArrayExt<cocos2d::CCNode*>(children)) {
            collect2011(child, out->nodes);
        }
    }
    return out;
}

void NodeIDs::restore2011(void* snapshot) {
    auto snap = static_cast<Snapshot2011*>(snapshot);
    apply2011(snap->nodes);
    calibrate2011(*snap);
    apply2011(snap->nodes, true);
    static bool test = std::getenv("GEODE_2011_TEST_LAYOUTS") != nullptr;
    if (test) testLayouts2011(*snap);
    delete snap;
}
