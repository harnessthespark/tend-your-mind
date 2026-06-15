# Sundial — handoff / shared context

**For:** the other Claude working the Anxiety Garden sundial
**From:** the session that initialised the repo + analysed Lisa's dial art
**Date:** 2026-06-15

## Repo state (NEW — heads-up)
- `git init` was run in `/Users/lisagills/anxiety-tool` (branch `master`, one commit `fe49bd6`).
- `.gitignore` excludes the 2.4 GB Unity cache (`Library/`, `Logs/`, `UserSettings/`, etc.) and `_scene_preview.png`. HTML + `assets/` are tracked.
- **Uncommitted:** two web-ready crops I generated — `assets/sun-dial-web.png` (988×1400 pedestal), `assets/sun-dial-face.png` (1024² face). Commit or discard as you like.
- ⚠️ **Coordinate before editing shared files** (`emotion-model.html`, `garden.html`, `index.html`, `assets/`) — we're two sessions on one tree.

## The brief
`emotion-model-brief.md` (in the session outputs dir) is authoritative. Key points for the sundial (§4):
- Sundial = the garden's instrument. **Inner ring = 6 cores; outer ring = the Layer-4 granular pairs.**
- Pairs (§98): Joy→Contentment/Joy · Fear→Anxiety/Excitement · Anger→Frustration/Anger · Sadness→Grief/Depression · Disgust→Guilt/Shame (label honestly — self-conscious, "parked here"). **Surprise is single, no pair** → 11 outer segments over 6 inner, NOT a uniform 12.
- Selecting a feeling **swings the gnomon**, lights the body-sensation zones, and **casts that emotion's Layer-5 weather** over the garden.
- §7 aesthetic: AuDHD sensory-calm — **no flashing/fast motion**, slow weather (3–8s), soft opacity, `prefers-reduced-motion`-gated. House style in `emotion-model.html` is explicitly *no gradients/shadows/glow*.
- §6: the wheel **is** the front-line SEL self-awareness practice (daily emotion labelling on a visual wheel) — make it the core loop.
- §9: fold §3/§4/§5/§8 into **one config object**; `localStorage` for last state.
- §6 sensation→garden-place map is **`NEEDS LISA`** — flag `TODO: confirm sensation→place map`, don't hardwire.

## Existing code to reuse (don't reinvent)
- `emotion-model.html` — tabbed explainer of all 5 layers. Has the full data already as JS objects: `PANKSEPP`, `EKMAN`, `CORES` (with body regions + arousal + pair), `PAIRS`, `WEATHER`, plus `COLORS`/`hue()` using §8 CSS vars (`--joy --sad --fear --anger --disgust --surprise --seeking --care`). The sundial naturally upgrades its Layer-3 "Six cores" tab.
- `index.html:748–755` — working SVG `pt()` + `wedgePath()` ring-wedge math; reuse for both rings.
- `index.html:710+` — an existing flat 6-core feelings wheel with drill-down + breadcrumbs (good interaction reference).

## Lisa's dial art — what it is (important)
`assets/sun-dial.png` (17067×9600, ~5 MB) = low-poly **stone pedestal** + **rainbow colour-wheel face tilted in 3D perspective** (face aspect h/w ≈ 0.84). `sun-dial.svg` is a generative export — **no semantic layers** (`Layer_1` + ~200 gradients), not hookable by `#id`.

Three tensions with the brief:
1. Single ring of ~8–12 **rainbow** wedges, not the inner-6 + outer-pairs structure.
2. Hues are **spectral (ROYGBIV)**, not the §8 emotion palette.
3. **Perspective ellipse** → a flat radial gnomon / precise concentric ring overlays don't sit pixel-true on it.
→ It reads as a beautiful **hero illustration of the sundial-as-object**, not a flat technical instrument face.

## The open design fork (waiting on Lisa)
- **Path A (recommended):** her pedestal+dial is the hero you walk up to; engaging it presents a **clean flat top-down dial** that carries the real interaction (6 inner / 11 outer / swinging gnomon / body-zone light / weather cast).
- **Path B:** make her art itself the surface — invisible angled hotspots + CSS-perspective gnomon; accept her rainbow segments, drop the two-ring structure.
- If A: **rainbow hues (match her art)** vs **§8 palette (match `emotion-model.html`)** — also Lisa's call.

**Do not build past this fork until Lisa picks A/B + palette.**
