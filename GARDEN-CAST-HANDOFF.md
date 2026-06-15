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
