# The Garden — design & build brief

> **The spine:** *You tend the conditions, not the thoughts.*
> The brain structure IS the garden — never tell a client to control their mind, only to read and tend their garden.

This is the single canonical brief: what's built, what each screen *does*, what to *draw*, and the rules that hold it together.

---

## The brain → garden mapping
*(The teaching layer — source panel 1 of the original anxiety-brain illustration.)*

- **Gardener = prefrontal cortex** — plans, prunes, holds the long view; the only part that tends on purpose.
- **Alarm = amygdala** — trips on threat, can't tell real from imagined, flips everything to survival. *(Visual: a red alert octagon in the garden — muted when calm, ringing with rays when tripped. Renamed from "frost alarm" 2026-06-02.)*
- **Climate & water = hypothalamus** — the physical conditions; regulation lives here.
- **Seed store = hippocampus** — record of seasons; memory of what survived which winter.

**Key dynamic:** when the alarm fires, *the gardener gets locked out.* You can't prune with the alarm blaring. So we don't fight the alarm — we calm the weather first, and *then* the gardener gets back in.

## The verbs the gardener uses
**Enter · Explore · Name · Plant / sow · Pull · Live with · Let it turn · Fill · Drain (open taps) · Water · Protect (cover from frost) · Rest (fallow) · Choose / commit · Keep / print**

Every screen offers one (or two) of these as the user's action.

## Three modes — one build
- **Self-guided** — the default client experience.
- **Live session** — a coach-mode toggle reveals an inline facilitator prompt at each step. Off by default; opens gently (no layout jolt). Persistent ribbon makes the mode obvious.
- **Worksheet** — a print stylesheet exports the garden cleanly with the client's answers filled in.

---

## Cross-cutting (read first)

### Style — confirmed: **(A) ILLUSTRATED THROUGHOUT** *(locked 2026-05-30)*
Warm, hand-drawn, storybook. Cohesive with the calm / accessible brief and the bear; gentlest for anxious users. Every screen's art is illustrated — no mixing with photography.

> `hero-garden.png` is now Lisa's **illustrated** hero (baked 2026-06-04 from `hero-garden.svg` → a light 2 MB PNG via headless Chrome; the heavy SVG stays as source only). Auto-swap is wired — replace the file at the same path and it appears on refresh.

### Palette (CSS variables — art can lean on these)
paper `#f5efe2` · card `#fbf7ee` · ink `#3b4136` · moss `#6f8f5e` · moss-deep `#54713e` · sage `#cdd8bf` · soil `#8a6f51` · bloom/terracotta `#d98c5f` · frost/cool `#8fb0c4` · alarm `#cf7a52`.
Warm, low-saturation, calm.

### Dimensions & format
- Full-width scenes: **720×360** (2:1) or 720×300, exported **@2x (1440×720)** for retina. PNG (painterly) or SVG.
- Interactive / animated pieces: **SVG with named layers** — the layer name becomes the `#id` the code hooks to — or separate PNGs.
- Icons / flowers / tools: ~120–200px, transparent background.

### Tone & rules (hard)
- Calm, uncluttered, generous space; never alarming or graphic.
- **Storm = motion / urgency.** Used for the hyperarousal / alarm edge.
- **Fallow & winter = stillness.** No bubbling, rising, or busy motion. *(Hypoarousal rule — non-negotiable.)*
- **Nothing ever dies.** Plants rest, go dormant, revive when tended — never failure.
- **Traits, not labels.** No diagnosis, no identity claims; describe states, never people.
- Accessibility is the *actual* brief — Atkinson Hyperlegible body, good contrast, full `prefers-reduced-motion` support.

### Asset workflow
- Drop finished files into `assets/` using the exact filenames in each brief.
- Auto-load is wired (`<img>` + placeholder fallback) — drop a file, refresh, it appears.
- `ASSETS.md` is the filename quick-reference.

---

## The 9 screens
For each: what the user *does*, what to *draw*, and how the art has to *behave*.

### 1 · Welcome — **ENTER**
- **You do:** tap to step onto the path / open the gate → you enter the garden.
- **Asset:** `hero-garden.png` ✓ *(placed)* · 720×360 @2x · PNG/painterly.
- **Mood:** invitation, calm — "a place to tend." A path that draws the eye in.
- **Optional layer:** a gate or path-entry that can "open" on Enter.

### 2 · Meet your garden — **EXPLORE + TRIP/CALM**
- **You do:** tap each part to meet it; trip the alarm → the scene *storms* and the gardener is locked out; calm the weather → the gardener returns.
- **Asset:** `garden-scene.svg` · 720×300 @2x · **SVG with named layers**.
- **Mood:** orientation, gentle curiosity. A whole little garden you can point around.
- **Depicts — four clearly distinct, pointable features:**
  - `#gardener` — calm figure tending. Needs **present** *and* **stepped-back/gone** versions.
  - `#alarm` — the red alert octagon, sitting in the garden. Muted (octagon only) when calm; ringing (octagon + rays) when tripped.
  - `#climate-water` — sky + water source (cloud / can / butt) = the conditions.
  - `#seed-store` — shed / seed packets = memory of seasons.
- **States:** **calm** (sunny, gardener present, alarm muted) and **storm/alarm** (cloudy sky, gardener gone, alarm ringing) — swappable sky + alarm + gardener layers.
- **Rule:** storm reads as *too much*, never stillness.

> **AS BUILT (2026-06-02) — `garden-scene.svg` is placed & wired.** Lisa's hand-drawn scene, exported from Illustrator with named layers. The interactivity is live: tapping a part opens its role card, and the demo "See the alarm trip / Calm" buttons drive the layers. Exported layer ids differ from the brief's planned names — the code targets the **actual** ids:
> - gardener → `#gardner` · alarm muted → `#calmalarm` · alarm ringing → `#alarmsounds` *(nested inside `#clouds`)* · seed store → `#seedshed` · water → `#tap` `#bucket` `#watering_can`.
> - **Calm:** `#clouds` hidden, `#calmalarm` shown, `#gardner` opacity 1. **Storm:** `#clouds` shown (brings `#alarmsounds`), `#calmalarm` hidden, `#gardner` fades to 0 (no "gone" art yet — faded out stands in).
> - Sky pair exists (sunny base + grey `#clouds` overlay). **TODO art:** darken the storm sky so it reads "too much," and optionally a proper gardener-gone layer.
> - 36 MB (painterly raster embedded) — must be **served over http** (the page `fetch`es it; `file://` is blocked). Slim the embedded images before Hetzner.

### 3 · The alarm — **NAME (flag)**
- **You do:** name what trips your alarm → each one you name appears as a **shadow at the treeline**, building a picture of what your alarm watches for.
- **Asset:** `bear-at-treeline.svg` ~300×200 + `shadow-marker.svg` ~80×80 (instanced) · SVG/PNG.
- **Mood:** a watchful, **concerned (not menacing)** bear at the garden's edge.
- **Depicts:** the bear at the treeline (the threat the alarm reacts to) + a small shadow marker placed each time the user names a trigger.
- **Rule:** calm-scary, like the current stand-in. Never fanged or charging.

### 4 · What blooms easily — **PLANT / SOW**
- **You do:** name a strength / special interest → **plant a bloom** for it; the bed fills with *your* wildflowers.
- **Asset:** `flowerbed.svg` 720×260 @2x + 5–6 `flower-*.svg` ~140px each, transparent · SVG.
- **Mood:** hopeful, abundant, *yours*.
- **Depicts:** a sparse bed base + 5–6 distinct, characterful wildflowers. Each ideally with a **sprout → bloom** growing state.
- **Rule:** variety of shape/colour so a filled bed feels personal and rich.

### 5 · The weeds — **NAME + SORT (pull / live with / let it turn)**
- **You do:** name a recurring weed-thought, then decide what *kind* it is:
  - **Pull** — some lift right out: you can challenge or let them go.
  - **Live with** — some have deep roots; you can't pull, so you tend *around* them. They stay, but stop choking the garden (acceptance, not eradication).
  - **Let it turn** — over time, some "weeds" were never weeds. Reframed, a weed (over-thinking, sensitivity, intensity) becomes a **wildflower** — something you value. Traits, not labels.
- **Asset:** `weed.svg` ~180px, transparent, **multi-state**.
- **Mood:** gentle, non-shaming. A weed is just a plant in the wrong place — and sometimes not even that.
- **States:**
  - *base weed* (the named thought).
  - *pulling-out* (lifts with a little soil/root).
  - *staying / tended-around* (remains but contained, bed tidy around it).
  - **weed → bloom transform** (opens into a wildflower).
- **Rule:** give weed and bloom a **shared silhouette** so the transform reads. Never depict weeds as ugly or diseased.

### 6 · The bucket — **FILL + TIP OUT**
*(Rebriefed 2026-06-02: no rain-barrel art — Lisa is reusing the **bucket + watering can** from the garden scene, scaled up. Better metaphor: the can literally pours onto the garden, so release nourishes the bed.)*
- **You do:** add what fills the **bucket** (level rises) → **tip the watering can** (healthy release) → the water pours **onto the garden** and the bed drinks. Rumination = a can you never tip; sleep = the overnight pour.
- **Asset:** `bucket.svg` (~scaled-up bucket) + `watering-can.svg` — transparent, **layered SVG**.
- **Mood:** tactile, honest — the load you carry, and the relief of letting it move.
- **Layers:** `bucket` + a named **`water-level`** inside (animatable height) · `watering-can` + optional **`can-pour`** state (tilted, water arc). Code can rotate the upright can if no pour state is drawn.
- **Rule:** water = the load (not stones — accessibility). The poured water visibly **feeds the garden** — the stream can run toward screen 4's bed.

### 7 · Your season — **READ / CHOOSE** (wheel of feelings → season)
*(Approach confirmed 2026-06-03: a feelings-wheel feeds the season, rather than picking one cold.)*
- **You do:** tap a couple of feelings from a **simplified wheel** → the garden gently shifts to the matching season → *"Does that feel right? You can choose a different one."* (Suggest, don't diagnose — the gardener keeps agency.)
- **Why the wheel:** naming feelings is hard (emotional granularity / alexithymia is common in ND). The wheel scaffolds it and does real emotional-literacy work; reading feelings *tells* you the season.
- **Weather vs season (key distinction):** the *alarm/storm* on screen 2 is the **moment** (acute anger/fear lives there). The **season** is the **sustained climate** — the longer tone. The wheel feeds the season, not the moment.
- **Mapping (sustained tone → season):**
  | Wheel family | Season | Garden read |
  |---|---|---|
  | Happy — hopeful, inspired, eager | Spring | new growth |
  | Happy — joyful, confident, powerful | Summer | thriving, full bloom |
  | Sad — grief, disappointed, letting go | Autumn | shedding, turning |
  | Sad — lonely, low, depressed | Winter | withdrawn, alive under the soil |
  | Numb — apathetic, empty, bored, flat | Fallow | depleted, **resting — not failed** |
- **Asset:** `garden-seasons.svg` (ONE garden, swappable spring/summer/autumn/winter/fallow layers) **+** a hand-drawn **feelings wheel** in the garden's storybook style (redraw — don't use the clip-art wheel).
- **Mood:** each season honest and kind — **fallow is restful, not failed.**
- **Rules:** **Fallow & winter = stillness.** No bubbling, rising, or busy motion. Keep the *structure* (path, beds, tree) constant so it's clearly the same garden through the year. Traits/states, never labels.

### 8 · Your tending plan — **COMMIT (choose one)**
- **You do:** choose **one** condition to tend this week. Just one — it's highlighted; the rest set gently aside. (A gardener doesn't do everything at once.)
- **Asset:** `tending-tool-*.svg` set of 5–7 icons ~160px each, transparent.
- **Mood:** simple, doable, warm — one small act of care.
- **Depicts — tools tied to releases:** watering can = water/nourish · cloche/blanket = protect from frost · secateurs = prune / let go · bench = rest · trowel+seeds = plant something new · gloves = hands-on care · sun/lamp = light.
- **Rule:** consistent icon style; the chosen one highlights, the rest dim.

### 9 · Garden map — **KEEP / PRINT**
- **You do:** review the whole garden assembled from your answers → print / save / take it away (worksheet mode).
- **Asset:** `garden-map-frame.svg` 720×900 @2x (portrait, print-friendly) · SVG/PNG.
- **Mood:** a keepsake — "here's my garden, today."
- **Depicts:** a decorative plot/map frame with labelled zones the app fills from saved answers — treeline (alarm triggers), bed (blooms), weed(s), bucket (level), season, tending action.
- **Rule:** must **print cleanly in black-and-white** too.

---

## Data & state
- All answers flow into **one clean state object**: `{ alarm, blooms, weeds, bucket, season, tending }`.
- Within-session resume: silent `localStorage` (try/catch, fails silently). **Not** authoritative.
- Cross-session portability: **deferred** — will be a shareable link / export, or a server record if this lives inside the coaching portal (per the Postgres-as-source-of-truth rule). The state object is shaped so either drops in with no rework.

## Files in this project
- `garden.html` — the build (screens 1–3 fully interactive, incl. the wired `garden-scene.svg`; 4–9 stubs). **Serve over http** (`python3 -m http.server` in this folder) — the scene `fetch`es the SVG and `file://` blocks it.
- `assets/` — drop-in art (auto-loaded). `ASSETS.md` for the filename quick-reference.
- **`BRIEF.md`** — this document (the canonical design + art brief).
- `index.html` — the old brain-journey prototype (superseded).
