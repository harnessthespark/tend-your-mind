# Creative assets — drop-in spec

Drop your Adobe artwork into this `assets/` folder using the **exact filenames** below,
and it slots straight into `garden.html`. Until a file exists, a labelled placeholder shows.

**Convention**
- **Flat art** (just a picture) → one PNG or SVG. Trivial swap.
- **Anything that animates or is tappable** → export from Illustrator as **SVG with named layers/objects**
  (the layer name becomes the SVG id the code hooks into), or as **separate files** I assemble.
- Match the rough dimensions / aspect ratio so layout doesn't shift.
- Palette is earth-and-green CSS variables — art can lean on those, or carry its own.

| File | Screen | Size (approx) | Format | Notes |
|------|--------|---------------|--------|-------|
| `hero-garden.png` | 1 · Welcome | 720×360 | PNG or SVG | Wide establishing garden. Single flat image. |
| `garden-scene.svg` ✓ **placed & wired** | 2 · Meet your garden | — | **SVG, named layers** | Lisa's hand-drawn scene. Live ids (differ from old plan): gardener `#gardner` · alarm muted `#calmalarm` · alarm ringing `#alarmsounds` (inside `#clouds`) · seed store `#seedshed` · water `#tap` `#bucket` `#watering_can`. Tap-to-meet + calm/storm toggle wired. **Served over http only** (page fetches it; `file://` blocked). 36 MB — slim before Hetzner. |
| `bear-at-treeline.svg` | 3 · The alarm | 300×200 | SVG or PNG | The bear (the threat the alarm reacts to). A current hand-drawn stand-in is inline in the file. |

### Still to come
- **Screen 2 art TODO:** darken the storm sky (must read "too much"); optional proper *gardener-gone* layer (currently the gardener just fades out for "locked out").
- **Screen 4 — blooms:** `flowerbed.svg` base + 5–6 `flower-*.svg` (each `sprout` → `bloom`). Cottage-border layout.
- **Screen 5 — weeds:** `weed.svg` multi-state (`weed-base` / `weed-pulling` / `weed-staying` / `weed-bloom`). Suggested motif: a **dandelion** (shared weed↔flower silhouette).
- **Screen 6 — bucket:** `bucket.svg` (with named `water-level` inside) + `watering-can.svg` (optional `can-pour` state). Scaled-up versions of the scene's bucket + can.
- `seasons-*` (incl. fallow — **fallow must read as STILL/dormant**, never bubbling motion)
- garden-map summary art

I'll add rows here as each screen is built. The scene auto-loads via `fetch`; flat art still auto-loads via `<img>` fallback — drop a file in and refresh.

I'll add rows here as each screen is built, and wire an `<img>`-with-fallback so dropping a
file in and refreshing just works — say the word and I'll switch that on.
