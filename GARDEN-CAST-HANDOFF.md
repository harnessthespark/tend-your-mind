# Handoff — "cast the weather onto the garden" + sensation→place map

**For:** the other Claude (garden.html session)
**From:** the sundial session
**Date:** 2026-06-15
**Lisa's call:** she explicitly handed this piece to you ("hand them that piece").

## The piece you own

In `garden.html`, when a feeling is chosen on the sundial:
1. **Cast that weather over the garden scene** — slow, soft, AuDHD-calm (§7: no flashing/fast motion, 3–8s, soft opacity, `prefers-reduced-motion`-gated).
2. **Light the sensation→garden-place zones** for that feeling.

Plus build the **sensation→garden-place map** itself (brief §6) — which is **NEEDS LISA**. Use the §6 starter proposal, flag `TODO: confirm sensation→place map`, don't hardwire.

## The integration contract (how our halves meet)

`sundial.html` is **done and is mine** — please don't edit it. It already dispatches, on every pick, a DOM event you listen for:

```js
document.addEventListener('sundial:select', function (e) {
  var d = e.detail;
  // d.key     'anger' | 'seeking' | 'joy' | 'disgust' | 'care' | 'sadness' | 'fear' | 'surprise'
  // d.label   display label
  // d.mode    'weather'  → it passes (cast + let it move)
  //           'climate'  → it does NOT pass (steady condition; see below)
  // d.kind    'sun'|'rain'|'cold'|'storm'|'fog'|'flash'  (weather picks)  |  null (climate picks)
  // d.regions ['chest','throat','gut','face','hands','limbs']  or ['full']
  // d.color   the segment's rainbow hue (matches the dial — Lisa: "keep rainbow on the dial")
});
```

We meet **only** at this event. You own `garden.html`; I own `sundial.html`. No shared-file edits.

### weather picks (`mode:'weather'`) — cast `d.kind`, then let it pass
Reuse the Layer-5 weather visuals already prototyped in `emotion-model.html` (`skyHTML()` + the `drift`/`breathe`/`fall` keyframes) as a starting point — they're already calm and reduced-motion-gated:
`sun` (joy) · `rain` (sadness) · `cold` (fear) · `storm` (anger) · `fog` (disgust) · `flash` (surprise, briefest).

### climate picks (`mode:'climate'`, `kind:null`) — NOT a passing weather
- `seeking` → steady warm light / growth-drive over the **whole** garden (it's the sun/source itself — plants leaning to the light). Doesn't roll through and leave.
- `care` → a mild warm-front warmth between beds (relational; oxytocin = the bond it builds is the bond that aches when lost).

This climate-vs-weather split is the resolved model spine — please preserve it (don't render Seeking/Care as passing fronts).

## sensation → garden-place (brief §6 — NEEDS LISA, use as starter only)

`d.regions` carries the body zones; map each to a garden place and light it when cast:

| region | §6 starter place |
|---|---|
| `chest` | the greenhouse (warm centre) |
| `throat` | the gate / narrow path |
| `gut` | the soil & roots |
| `face` | the sky & canopy |
| `hands` | the tools & the beds |
| `limbs` | the paths & fences |
| `full` | the whole garden lit at once |

⚠️ `TODO: confirm sensation→place map` — flag in code, do not ship without Lisa's mapping.

## Constraints
- AuDHD sensory-calm throughout (§7). Slow, soft, opacity-only; full `prefers-reduced-motion` support.
- Rainbow hues on anything tied to the dial (Lisa's decision); §8 family hues are fine elsewhere.
- Nothing ever "dies"; states not labels; traits not identities (house rules in `BRIEF.md`).

## Status of my side (for your reference)
- `sundial.html` — built: ambient tilted disc → engage → flat 8-segment wheel (single-ring face per Lisa), gnomon swings to the pick, weather picks open body-map + arousal + granular pair, climate picks (Seeking/Care) open their own framing, accessible + reduced-motion. Dispatches `sundial:select`.
- Open on my side: Lisa to confirm the 8-segment line-up (one editable `SEGMENTS` block); colours sampled from her disc.

## Status of the GARDEN side — DONE (2026-06-15, garden.html session)
Built + verified in `garden.html` (my lane; `sundial.html` untouched). We still meet only at `sundial:select`.
- Listener `document.addEventListener('sundial:select', e => cast(e.detail))` casts a calm weather/climate overlay over `#sceneStage`.
- **Weather** picks (`mode:'weather'`): `sun/rain/cold/fog/storm/flash` rendered opacity-only, slow (3–8s). `flash` auto-passes (~2.6s, "the briefest weather"); the rest show a **"let it move on"** affordance that fades them (embodies "it passes"). Storm is a calm darkening swell — **no strobe**.
- **Climate** picks (`mode:'climate'`, Seeking/Care): steady, persistent, **no "move on"** button — they don't roll through. Seeking = whole-garden growth glow; Care = warm band between beds. Climate-vs-weather spine preserved.
- **Sensation→place**: `d.regions` → soft positional glows + a named caption, tinted with `d.color` (rainbow, kept continuous with the dial). ⚠️ The §6 map + glow x/y are **placeholder** — flagged `TODO: confirm sensation→place map` in one editable `CAST` config object. The scene SVG has no greenhouse/gate/canopy layers, so this is a positional overlay, not SVG-layer lighting — **needs Lisa's real geography.**
- a11y: caption is `role="status" aria-live="polite"` (announces each cast); overlay particles `aria-hidden`; full `prefers-reduced-motion` support (animations off, static soft tint + the words carry it); hidden in print.
- **Integration note:** the contract event only crosses if the dial dispatches into the *same document* as `garden.html`. If `sundial.html` ends up a separate page/iframe, we'll need a postMessage bridge → re-dispatch as `sundial:select`. For verification without the dial, garden.html exposes `window.__sundialCast(detail)`.
- **Still NEEDS LISA:** the sensation→garden-place map (§6).

---

## Updates 2026-06-16 — for the cast lane (from the sundial session)

`MODEL.md` is now the source of truth for the whole emotion model — **read it first.** Key changes that land in *your* lane (`garden.html` cast + scene):

### What I changed in garden.html (don't undo)
- **Option A**: the sundial is now embedded in **screen 6** as "today's weather" (an `<iframe src="sundial.html?embed=1">`) + a small **postMessage bridge** that re-dispatches `sundial:select` onto garden's document — so your cast listener fires. Verified end-to-end.
- The `sundial:select` listener now also does `garden.weather = e.detail; save()`. Screen-8 map zone shows today's weather (was season).
- **Rain cast fixed**: streaks were blue on blue sky (invisible). Now `.w-rain` greys the sky to overcast + near-white streaks, 28 not 14. ⚠️ Still reads a bit "fireworks" — see TODO (make it a continuous fall, or use the even repeating-gradient technique in `intensity-demo.html`).

### New weather set (MODEL §2) — update the cast to match
The dial now dispatches these `kind`s: `storm`(anger) · `fog`(**fear**, was cold) · `rain`(sadness) · `sun`(joy/enjoyment) · `haze`(**disgust**, NEW) · `flash`(surprise).
- ⚠️ **`haze` has no renderer yet** — disgust currently casts nothing. Add it: a **thick, yellow, humid, reeking** layer (opacity = thickness). Distinct from fear's grey fog.
- **fear = fog** now (not cold): worry = thin mist → panic = heavy fog (fog-thickness = how distorted the read is). Tune the existing fog for this gradient.
- **surprise = a fork**, not one weather: good → sun-through-cloud, bad → **hail**. Brief, then hands on.
- Seeking/Care climate casts are now **dead** (both came off the wheel — it's 6 weathers only). Their cast branches can stay dormant or be removed.

### Cross-cutting work waiting in your lane
1. **Visibility sweep** — do the rain contrast pass for **fog, storm, sun, haze, flash** too, so each reads over the bright `calm-garden.png`.
2. **Intensity = how much weather** (MODEL §2) — scale each cast by intensity (opacity/density), mild→intense. `intensity-demo.html` shows the technique + endpoints.
3. **First-person decision** (MODEL §8): the user is the gardener — **hands, not an avatar**. The third-person **gardener figure is coming out of the scene** (Lisa's redraw). Your storm/calm `#gardner` fade handling will change when the scene's redrawn — coordinate then.
4. **Sensation→place map** (§6) — still NEEDS LISA; place-glows stay placeholder until then.

### ✅ Actions (do these, in order)
1. **Add a `haze` renderer** (disgust) — thick yellow, humid, reeking; opacity = thickness. *Highest: disgust casts nothing right now.*
2. **Fix rain "fireworks"** — make it a continuous fall (thinner · more · lower-opacity · full-height), or swap to the even repeating-gradient technique in `intensity-demo.html`.
3. **Visibility sweep** — make `fog · storm · sun · flash` (+ the new `haze`) each read clearly over the bright `calm-garden.png`, same pass as rain.
4. **Tune `fog` for fear** — worry = thin mist → panic = heavy fog (thickness = how distorted the read is).
5. **Rework `flash`/surprise as a fork** — good → sun-through-cloud, bad → **hail**; brief, then hands on.
6. **Add intensity scaling** — every weather scales mild→intense by opacity/density (MODEL §2). Technique + endpoints in `intensity-demo.html`. (Dial can pass an intensity value later; default mid for now.)
7. **Retire the dead `w-seeking` / `w-care` climate branches** — the wheel is 6 weathers only now.
8. **(After Lisa's first-person redraw)** update the `#gardner` present/stepped-back fade — the third-person figure is leaving the scene.
9. **(Blocked on Lisa)** wire the real **sensation→place map** (§6) into the `CAST` config when she supplies the geography.

**Do NOT undo:** option A (the screen-6 sundial iframe + postMessage bridge), the `garden.weather` save on cast, or the rain contrast fix.
