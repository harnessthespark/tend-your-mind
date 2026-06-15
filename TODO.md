# Anxiety Garden — To-Do

_Last updated 2026-06-15._

## 🔴 Needs Lisa (decisions / clinical / design)
- [ ] **Redline the `SIGNATURE` map** in `sundial.html` — which body qualities point to which feeling (e.g. fear = fluttery/cold/tight, anger = hot/tight). The body-first narrow's accuracy rides on this. Also the `REGIONS` / `QUALITIES` wording.
- [ ] **Flat 6-disc art** — draw a faceted, top-down 6-segment disc that matches the tilted one (same palette + white dividers), so turning the dial keeps the craft. (Or: I warm up the code wheel as a stopgap.)
- [ ] **Body figure** in the drill-down — keep & soften, swap for a calmer outline, or drop and use words.
- [ ] **Confirm the 6 weather colours** — anger red · joy amber · disgust green · sadness blue · fear purple · surprise pink.
- [ ] **Sensation→garden-place map** (§6) — for the cast's place-glows (currently placeholder in the garden's `CAST` config).
- [ ] **Redeploy in Coolify** to see the latest (alarm fix, 6-wheel, body-first walk). Push doesn't auto-deploy.

## 🟡 Finish the guided walk (sundial)
- [ ] **Coarse step** — pleasant/unpleasant × calm/charged, between *notice* and *narrow* (easiest rung for severe alexithymia; `valence` is already seeded in the data).
- [ ] **Tell-apart beat** — promote the granular pair (anxiety vs excitement) to its own step after the pick, not buried in the drill-down.
- [ ] **Express beat** — "what's it asking for / how would you say it"; needs one `ask` line per feeling.

## 🟢 Seeking & Care homes (off the wheel)
- [ ] **Seeking = the sun** — the always-there light/drive that casts the shadow (present in the whole instrument, not a slice).
- [ ] **Care = the nurturing pour + a between-gardens beat** — the watering can as nurture; relational warmth across the fence.

## 🔵 Garden / integration polish
- [ ] Optional: weather cast *behind the dial on screen 6* too (currently casts on the screen-1 scene).
- [ ] Minor: `bear-at-treeline.svg` is missing (the bear falls back to `bear-trim.png`) — pre-existing.

## ✅ Done (recent)
- 6-segment weather wheel (Seeking & Care taken off)
- Alarm fixed — `anxiety-garden.png` (storm image, SVG-only ref) had been gitignored → restored
- Body-first walk keystone: *notice → narrow* (the interoception → feeling translation)
- Cosmetic: removed the stray "0" rim markers + the blue rectangular focus box
- Sundial embedded in garden screen 6 as "today's weather" + verified cast bridge
- Docker deploy on Coolify; lean repo (394 MB → 21 MB)
