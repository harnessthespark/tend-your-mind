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

---

## Cast lane — 2026-06-16 update DONE (garden.html session)
Worked through actions 1–7; 8–9 stay deferred (blocked on Lisa). Verified in a real browser over http, all 6 weathers at intensity endpoints `--i:0` and `--i:1`, no console errors. Preserved option A, the `garden.weather` save, and the rain contrast fix.

- **1 · `haze` (disgust) added** — thick yellow/humid radial, `mix-blend-mode:multiply`, opacity = thickness. Distinct from fear's grey fog. ✅
- **2 · rain "fireworks" fixed** — the stutter was `translateY(118%)` (relative to the drop's own box, ~66px of travel then snap). Now fixed pixel-distance fall (`translateY(460px)`), shorter (18px) · more (40) · lower-opacity drops. Continuous. Kept your greyed-sky + pale-streak contrast fix. ✅
- **3 · visibility sweep** — endpoints retuned for all of `fog · storm · sun · haze · flash` to read over `calm-garden.png`. ✅
- **4 · `fog` tuned for fear** — grey `#d6dad7`, blurred, `opacity = .12 + .78·i` (thin mist → can't-see). ✅
- **5 · surprise fork — renderers only** (per advisor): `flash` = brief neutral break, **auto-passes** (no "move on", clears regardless of motion pref so it never sits stuck); plus `sunbreak` (good) and `hail` (hard) renderers keyed by `d.kind`. **I did NOT build a good/bad decision UI in the garden** — MODEL §4/§52 put the appraisal on the dial. ⚠️ **DECISION NEEDED:** who drives the fork — does the dial do the appraisal and send `kind:'sunbreak'|'hail'`, or should the garden present it? I assumed the former. If the dial won't, tell me and I'll add an interim affordance.
- **6 · intensity scaling** — every weather scales mild→intense by opacity/density via `--i` on `.weather-cast`. `cast()` reads `d.intensity` (0–1), **defaults 0.5** until the dial sends it. Sun grows a rainbow only past `i>.62`; storm adds a slow non-strobe bolt only past `i>.6`. Technique mirrors `intensity-demo.html`. ✅
- **7 · climate retired** — `w-seeking`/`w-care` CSS + `CAST.climate` removed; `cast()` ignores stray `mode:'climate'` picks; `cold` kind removed. Six weathers only. ✅
- **8 · gardener fade** — deferred until Lisa's first-person redraw lands (coordinate then).
- **9 · sensation→place map** — still NEEDS LISA; place-glows remain placeholder in the `CAST.place` config.

Contract now: `kind ∈ storm|fog|rain|sun|haze|flash` (+ `sunbreak|hail` if the dial resolves surprise); optional `intensity` 0–1; `mode` effectively always `weather`.

---

## 2026-06-18 update — for the cast/garden lane

`MODEL.md` is the source of truth (esp. **§7 Perspective**, **§8 decisions**). Big changes since last time:

### Scenes reworked + aligned (matters for your cast)
- The two-state scene is now **`calmstate.png` + `negativestate.png`** — NOT `calm-garden`/`anxiety-garden` (removed). Both **1801×900, fully opaque, pixel-aligned** (built on ONE 1800×900 artboard, layers toggled — fixes the old size-mismatch + white-border + see-through bugs). `garden-scene.svg` references them; `#stormscene` = negativestate. **Alarm trip cross-fades cleanly now.**
- **Scene hotspots re-aligned** to the new art: `data-wall` (boundary close-up) + `data-go="6"` (sundial → today's weather).
- ⚠️ **Mobile crash FIXED — keep exports ≤ ~1800px.** Images were 8514–17067px (36–160 MP → ~145 MB+ decode RAM each → mobile Safari rendered blank). All resized. *Pixel dimensions matter as much as file size on mobile.*

### Surprise fork — your DECISION NEEDED is ANSWERED
The **dial owns the appraisal**: surprise asks good/bad and re-dispatches `kind:'sunbreak'|'hail'`. Your renderers land it. **Drop the interim garden-side affordance plan.**

### NEW big direction: two ways to experience weather (perspective)
The weather now has **two modes, tied to where you stand**:
- **Outside, in the garden** → falling rain *on the scene* (iOS-Weather feel: layered depth near+far, slow drifting clouds, cool desaturated sky). You're *in* it.
- **Inside the shed, at the window** (`inside-shed.png`) → **rain on the glass** — rivulets down the panes, garden blurred behind, clouds drifting beyond. You're *watching* it. This is the **"step into the shed = take perspective"** regulation move.
- **Rules:** positive weather (sun/joy) is experienced **outside** (you don't shelter from joy). Hard weather is a **choice** (tend through, or step into the shed when overwhelmed). **NOT** all-in-the-shed (that's dissociation; the shed is to move between, not live in).
- **Moving clouds** wanted in both — slow drifting layer is the "alive" feel.
- **Prototype:** `rain-shed.html` — Canvas rain-on-glass (condensation + running drops + drifting clouds) over the shed windows, calm + reduced-motion-aware. Starting point for the real build.

### Other
- **Gardener = ambiguous avatar** (kept; identity-unreadable: low brim, long gloves, neutral) for wide scenes. **First-person hands** for action scenes, with a **user-settable skin tone** (`hands-picker.html` — CSS filter on the hands PNG + localStorage).
- **Sundial walk is complete**: notice → narrow → pick → read → tell-apart → express (+ surprise fork). Now loads Caveat + Atkinson (was falling back to serif).

### Open for the cast/garden lane
1. **Rain-on-glass shed view** for real (from `rain-shed.html`) + the **outside falling-rain** (iOS-style, layered) for the in-garden cast.
2. **Moving clouds** layer in the cast (drifting, slow).
3. **Intensity handshake** still open: dial → send `detail.intensity` (your cast already reads it; defaults 0.5).
4. Build the **action screens** (blooms/weeds/bucket) with first-person hands + the skin-tone picker.

**Do NOT undo:** the new scenes/hotspots, the sundial font load, the completed walk, option A.
