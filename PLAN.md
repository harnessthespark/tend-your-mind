# The Garden — build & art production plan

Living checklist. **BRIEF.md** = the design bible; this = "what's done, what's next, who does what."
Two roles: **Lisa draws** the art → **Claude wires** it into `garden.html`.

---

## Where we are

| # | Screen | Art | Build | Status |
|---|--------|-----|-------|--------|
| 1 | Welcome | `hero-garden.png` ✓ | wired ✓ | **Done** (optional: swap photo for an illustrated hero later) |
| 2 | Meet your garden | **re-illustrated, layered** ✓ | rebuilt as thin layered SVG ✓ | **Done** — now a thin `garden-scene.svg` referencing **separate per-layer PNGs** (see Scene v2 below). Calm/storm toggle, tap-to-meet, gardener fade, clouds drift. ⏳ Lisa to save clean `shed.png` + `water-tools.png` |
| 3 | The alarm | `bear.svg` ✓ wired | chips + bear done | **Done** (open: more threat images, or bear + chips? — TBD) |
| 4 | Blooms | `flower1–4.svg` ✓ | clean CSS bed + plant loop ✓ | **Done** |
| 5 | Weeds | `weed1–3.svg` ✓ | plant + pull/live-with/let-it-turn ✓ | **Done** (let-it-turn blossoms a weed into one of your flowers) |
| 6 | Bucket | CSS bucket (art later) | **built ✓** | Fill it (loads) → name pours → **Tip the watering can** drains it onto the bed. `bucket.svg`/`watering-can.svg` slot in later |
| 7 | Seasons | — | stub | One garden, 5 moods — feelings-wheel → season (still TODO; needs wheel + 5-season art) |
| 8 | Tending plan | emoji icons (art later) | **built ✓** | 7 tending cards, pick **one**, rest dim; `tending-tool-*.svg` slot in later |
| 9 | Garden map | CSS frame (art later) | **built ✓** | Assembles alarm/blooms/weeds/bucket/season/tending from state; prints clean B&W |

---

## The wall — the container (added 2026-06-05)

Not a screen — the **boundary that frames the garden**, behind the plants. You don't tend it directly; it's the psyche-as-wall, *ancient and held-together, not damaged*. **The cracks / holes = trauma** (Lisa, 2026-06-10) — the wall still stands and still holds the garden; the cracks are where it was hurt, not where it's broken. You never attack or "fix" them directly — they soften *passively* as you tend everything else (you tend the conditions, the wall heals itself). It drifts toward "more whole" across sessions — **never announced, never a score, never a goal.** The dry-stone walls already in the scene art ARE this wall.

- **State:** `garden.wall.integrity` (0→1) added to the state object ✓. Nudges up a hair each tended session → cracks acquire moss, ivy/wildflowers fill the gaps, the light-shaft softens.
- **Integration (TBD — Lisa's call):** wall as **named layers inside the re-exported `garden-scene.svg`** (cleanest — hooks by `#id` like everything else, auto-reuses in screen 9) **vs.** a separate `wall.svg`.
- **Open art calls:** back-band only vs. wraps the sides · cracks heal shut vs. stay open-but-greened.

---

## Art queue (Lisa) — suggested order

- [x] **Screen 4 flowers** — `flower1–3.svg` done. *Three is enough* (I rotate + recolour). Add 1–2 more only if you fancy it.
- [ ] **Screen 3 triggers** — decide: a few different *threat* images, or just the one bear + word-chips? (You've got `bear.svg`.)
- [ ] **Screen 5 weed** — one `weed.svg`, **4 named layers**: `weed-base` / `weed-pulling` / `weed-staying` / `weed-bloom`. Suggested: a **dandelion** (shared weed↔flower silhouette).
- [ ] **Screen 6 bucket** — scale up the scene's bucket + can. Bucket needs a named `water-level` layer inside; can optionally a `can-pour` state.
- [ ] **Screen 8 tools** — 5–7 icons ~160px: watering can, cloche/blanket, secateurs, bench, trowel+seeds, gloves, sun.
- [ ] **Screen 7 seasons** — one garden in spring/summer/autumn/winter/fallow (swappable layers). Fallow + winter = **still**, never busy motion.
- [ ] **Screen 9 map** — a decorative plot/frame; I fill the zones from saved answers.

## Build queue (Claude) — as art lands

- [ ] **Screen 4** — frame onto `Flowerbed`, plant `flower1–3` as strengths are named (ready now)
- [ ] **Screen 3** — replace stand-in bear with `bear.svg`
- [ ] Screens 5 → 6 → 8 → 7 → 9, each wired + verified as its art arrives

---

## Conventions (the stuff that keeps biting)

- **Two workflows now:**
  - **One combined SVG** (old way, still fine): Export As → SVG · Images: Embed · Object IDs: Layer Names · **every eye ON**. Code hooks layers by `#id`.
  - **Separate per-layer PNGs** (Scene v2 way): **Export As → PNG → ✅ Use Artboards → Transparent**, **⌥-click the eye to SOLO each layer** before each export. ⌥-solo is the trick that keeps each file isolated; **Use Artboards** keeps it full-canvas + aligned; **Transparent** avoids a background to cut.
- **Pitfalls that bit us:** ⚠️ *Export for Screens → Assets* trims to art (loses position) — avoid. ⚠️ forgetting Transparent → solid bg; Claude can flood-fill a uniform bg, **but it bleeds into same-coloured art** (ate the green watering can) — so export transparent. ⚠️ leaving other layers' eyes on → contaminated/doubled exports.
- Draw on any canvas/size — **Claude auto-crops** each asset to the art (whole-SVG bbox).
- Naming: lowercase, no spaces (`flower1.svg`, `weed.svg`, layer `water-level`…).
- State lives in one object `{ alarm, blooms, weeds, bucket, season, tending }`; `localStorage` for now, Postgres if it moves into the portal.

## Before Hetzner (cleanup, later)

- [ ] Delete 27 orphan `flowerbed-N.png` slices + stray `flowerbed.svg` dup + heavy `hero-garden.svg`.
- [ ] Slim embedded raster — the 36 MB scenes are fine for prototyping, too heavy for live.
- [ ] Serve check: scene `fetch`es over http (already required); confirm on the server.

---

## Scene v2 — screen 2 rebuilt as a layered scene (2026-06-09/10)

The 36 MB single-SVG scene was **replaced** with a **thin `garden-scene.svg`** (viewBox `0 0 2080 1037`) that just `<image>`-references **separate per-layer PNGs**. The JS (`applyScene`, `PART_TO_ROLE`, `ensureCardIcons`) is unchanged — it still hooks every layer by `#id`. Layers, back→front:

| `#id` | file | role / behaviour |
|---|---|---|
| `clouds` | `clouds-only.png` | weather; hidden in calm, CSS `.storm #clouds` **drifts + fades in** (opacity+translate, garden.html CSS) |
| *(none)* | `garden-bg.png` | scenery (tree/walls/path/grass) on **transparent sky**; white sky knocked out by flood-fill |
| `tap` | `water-tools.png` | role 2 (water) — tap+basin+2 buckets+can as one tappable layer |
| `seedshed` | `shed.png` | role 3 (seed store) |
| `calmalarm` | `alarm-calm.png` | role 1, shown in calm (quiet octagon) |
| `alarmsounds` | `alarm-alert.png` | role 1, shown in storm (octagon + rays) |
| `gardner` | `gardener.png` | role 0, fades to opacity 0 ("locked out") in storm |

Sky = a **CSS gradient** on `.scene-stage` (behind the transparent-sky scene), not baked art. Storm dimming = CSS `filter` on `svg.storm`. Old monster SVG saved as `_garden-scene-sunny-backup.svg`; flat-clouds one as `_garden-scene-cloudy-flat-backup.svg`.

**⏳ ONLY OPEN ITEM:** Lisa to save her **clean** `shed.png` + `water-tools.png` (soloed, transparent, full-artboard) over the assets — the ones on disk are stale contaminated exports that I flood-filled (the flood-fill ate part of the green watering can + punched holes). Everything else (bg, clouds, both alarms, gardener) is clean & wired.

---

## ⏸ RESUME HERE (updated 2026-06-10)

**Done & verified:** screens 1–5 + **screen 2 rebuilt as layered scene** (see Scene v2 above).

**Also fixed this session — flower/weed giant-bloom bug:** `preloadFlowers`/`preloadWeeds` cropped each art to `svg.querySelector('g')` (the *first* `<g>`). `flower3.svg`'s first group is only its pink blobs, so it cropped to the disc and ballooned. Now crops to `svg` (whole-art bbox / union of all groups). Both call sites fixed.

**Art-export recipe (hard-won — see Conventions):** **Export As → PNG → ✅ Use Artboards → Transparent**, with **⌥-click the eye to solo each layer** before each export. Keeps every file full-artboard + aligned + isolated. Lisa nailed this for alarm-calm/alarm-alert/clouds-only.

**Server note:** harness background servers get reaped — run preview in Lisa's own Terminal: `cd /Users/lisagills/anxiety-tool && python3 -m http.server 8770` (8770 used this session).

**NEXT (in progress): build screens 6 / 8 / 9** — none need scene art; build functional with CSS + chips pattern, slot real art later:
- **6 · Bucket** — fill it (name what fills you → level rises) → tip the can → water pours onto the bed. CSS bucket + `water-level` for now.
- **8 · Tending plan** — choose **one** condition to tend this week; rest dim. Emoji/CSS tool icons now.
- **9 · Garden map** — assemble state (`alarm`/triggers, blooms, weeds, bucket, season, tending) into a print-clean keepsake.
- **7 · Seasons** — feelings-wheel → season; interim CSS tint, 5-season art + hand-drawn wheel later.

**Cleanup pending:** 27 orphan `flowerbed-N.png`, stray `flowerbed.svg`, heavy `hero-garden.svg`; old 36 MB scene backups (`_garden-scene-*-backup.svg`) can go once Scene v2 is signed off.
