---
title: "Coupled Wave-Surge Model Validation: Hurricane Ike (SCHISM-WWM)"
date: 2026-01-01
description: "A nested Gulf-of-Mexico-to-Galveston SCHISM-WWM hindcast of Hurricane Ike (2008): wave, wind, current, and datum-corrected storm-surge validation at Gulf buoys and Galveston gauges, a wind-forcing bug whose fix repaired the storm's structure but not its intensity, and an offshore-boundary fix that recovered lost wave energy."
challenge: "Ike was a much larger, more intense storm than Harvey, and reusing wind-forcing and boundary settings tuned for Harvey without re-checking them against a storm of a very different character risked quietly wrong results rather than an obvious crash."
approach: "Ran the same nested-domain strategy used for Harvey — a Gulf-of-Mexico regional SCHISM-WWM hindcast feeding a high-resolution local Galveston domain — against Hurricane Ike, and checked every stage against eight Gulf NDBC buoys, NDBC buoy 42035 and the local CO-OPS water-level network. ADCIRC-SWAN is not included here: that companion run has not yet completed successfully for Ike."
result: "Found a real wind-forcing bug (a safety cap tuned for Harvey applied to a very different storm). The fix restores the eye lull and the timing of the wind maximum, but modeled winds near the storm core are still about 1.7–1.9x too strong. Across eight Gulf buoys the wave field is well captured in timing and shape (correlation 0.93–0.99 at seven), with peaks close on the shelf and slope but 40–47% too high at the two open-ocean buoys nearest the core. Wind speed and direction, peak wave period and mean wave direction at the Gulf buoys are also captured well (wind and Tp correlation mostly 0.85–0.98, direction errors of roughly 10–30°), but the 2D barotropic model cannot reproduce the observed deep-water current at 42002. Local-domain wave height at buoy 42035 correlates well with observations (r=0.88), and storm-surge bias drops substantially once corrected for a bathymetric datum mismatch, reaching about 88% of the recorded peak at Galveston Pier 21. Tidal current at the Bay Entrance is only about half of NOAA's predicted speed — the same shortfall found for Harvey, on a different mesh. The local domain's own simulation still needs to be relaunched with the corrected wind before these numbers reflect that fix too."
tags: ["SCHISM", "WWM", "storm surge", "wave modeling", "current validation", "Hurricane Ike", "deep-water wave validation", "wind validation", "nested modeling", "GAHM wind forcing"]
link: ""
image: "/img/portfolio/hurricane-ike-schism-wwm/ike_mesh_nested.png"
weight: 16
---

Hurricane Ike made landfall near Galveston in September 2008 — a much larger, more intense storm than Harvey (2017), and a useful stress test for a modeling pipeline originally built and tuned around Harvey's very different wind field. This write-up covers a SCHISM-WWM-only nested hindcast of Ike, run through the same Gulf-of-Mexico-to-Galveston pipeline as the [companion Harvey inter-comparison](/portfolio/independent-projects/wave-surge-model-intercomparison/). ADCIRC-SWAN isn't part of this one: that Ike setup hasn't yet completed a successful run.

![The local Galveston mesh (v7) with CO-OPS stations and NDBC 42035 marked, inset with the full Gulf-of-Mexico parent domain and the local domain's footprint highlighted](/img/portfolio/hurricane-ike-schism-wwm/ike_mesh_nested.png)
*Fig. 1 — The nested domain structure: a local, high-resolution Galveston mesh sitting inside the same Gulf-of-Mexico parent mesh used for Harvey.*

## A wind-forcing bug: structure fixed, intensity still too high

The Gulf-of-Mexico run surfaced a real wind-forcing bug: the GAHM vortex model's radius-of-maximum-winds fit was being clamped by a safety cap tuned for Harvey's weak, broad, post-landfall-stall wind field — the wrong cap for Ike, a much larger and more intense storm, which drove modeled wind at buoy 42035 to about 51 m/s at closest approach against ~28 m/s observed, and left no lull as the eye passed.

The fix makes the cap intensity-aware: when HURDAT2 reports both r50 and r64 wind radii for a quadrant (real evidence of organized hurricane-force structure, which Harvey's stall phase never had), the cap follows an r64-anchored profile fit instead of a flat multiplier — never tighter than the original cap, so Harvey's case is unaffected. Rerunning the Gulf-of-Mexico domain with the fix reproduces the wind lull as Ike's eye passed almost directly over the buoy — confirmed independently by the buoy's own barometric pressure nearly matching HURDAT2's official central pressure at that time — and puts the second wind maximum at the right hour (09:00 UTC against 08:50 observed). It does not fix the intensity. Checked against the forcing files themselves, the modeled peak at 42035 is still about 53 m/s against 27.9 m/s observed, and winds on either side of the lull remain roughly twice the observed values; the same overestimate appears at buoy 42001 (about 52 m/s against 30 m/s), and it is the likely reason the deep-water waves there come out too high, below. So the fix repaired the *structure* of the wind field, not its strength.

The local Galveston domain's own wind field has been regenerated with this same fix, but the local simulation itself hasn't been relaunched yet — so the wave, current, and storm-surge results below all still reflect the pre-fix wind. They're shown as the best currently-available local-domain results, not final validated numbers.

## Deep-water wave validation across the Gulf

The Gulf-of-Mexico parent run — the domain that feeds the local Galveston mesh — can be checked against NDBC buoys from the open ocean to the shelf. Nine of the ten buoys in the model's station list have 2008 records (42012 doesn't); 42035 is only 15 m deep and is covered by the local-domain validation below. That leaves eight: three in deep water (3,100–3,600 m), two on the continental slope (180–300 m) and three on the shelf (50–85 m). Two versions of the Gulf run are shown, one with the original wind field and one with the wind fix described above. The configuration is otherwise the same, apart from a regenerated wave-boundary file.

![Significant wave height at eight Gulf of Mexico buoys through Hurricane Ike, ordered from deep water to shelf: observed vs SCHISM-WWM with the original and the wind-fixed wind field](/img/portfolio/hurricane-ike-schism-wwm/ike_gulf_hs_buoys.png)
*Fig. 2 — Significant wave height at eight Gulf buoys, deepest first: observed (black), original-wind run (dashed), wind-fixed run (blue). The statistics in each panel are for the wind-fixed run over Sept 7–17.*

| Buoy | Depth | Correlation | Bias | RMSE (original-wind run) | Peak Hs, observed → model |
|---|---|---|---|---|---|
| 42001 Mid Gulf | 3,160 m | 0.94 | +0.45 m | 1.28 m (1.10 m) | 9.2 → 12.9 m |
| 42002 West Gulf | 3,122 m | 0.93 | +0.32 m | 0.97 m (0.77 m) | 6.0 → 8.8 m |
| 42055 Bay of Campeche | 3,597 m | 0.73 | +0.17 m | 0.61 m (0.54 m) | 2.6 → 3.0 m |
| 42039 Pensacola | 296 m | 0.99 | −0.23 m | 0.41 m (0.49 m) | 8.0 → 6.3 m |
| 42040 S. Dauphin Island | 178 m | 0.99 | +0.01 m | 0.35 m (0.41 m) | 8.6 → 7.9 m |
| 42019 Freeport, TX | 84 m | 0.96 | +0.24 m | 0.64 m (0.59 m) | 6.3 → 6.5 m |
| 42020 Corpus Christi, TX | 85 m | 0.96 | +0.05 m | 0.59 m (0.49 m) | 6.9 → 7.0 m |
| 42036 West Tampa | 50 m | 0.99 | −0.23 m | 0.31 m (0.33 m) | 4.5 → 4.0 m |

The timing and shape of the storm's wave field are captured well: correlation is 0.93–0.99 at seven of the eight buoys. The exception, Bay of Campeche, is far from the storm, with waves under 3 m. On the slope and shelf the peaks are close — within about 5% at Freeport and Corpus Christi, 8–11% low at Dauphin Island and West Tampa, and 21% low at Pensacola — though the peaks at Dauphin Island and West Tampa arrive 6–7 hours late in the model.

**In deep water the model is too high.** Peak Hs is 12.9 m against 9.2 m observed at 42001 (about 40% high) and 8.8 m against 6.0 m at 42002 (about 47% high). The wind explains part of this. At 42001 the modeled peak wind is about 52 m/s against 30 m/s observed — the same core-region overestimate as at 42035 — while at six of the other seven buoys it is within about 13% of the observation (at Bay of Campeche it is low, 9.9 against 15.5 m/s). At 42002 the local wind is fine (20.8 vs. 22.3 m/s), so its excess wave height is probably swell generated closer to the storm core and carried there, though I haven't verified that. The 42001 record also shows a sharp drop right after the peak, consistent with the storm center passing close by, which the model smooths over.

**The wind fix did not help in deep water.** Comparing the two runs, the fix reduces RMSE at the three slope and shelf buoys where the wind was already reasonable (Pensacola 0.49 → 0.41 m, Dauphin Island 0.41 → 0.35 m, West Tampa 0.33 → 0.31 m), but slightly increases it at the deep buoys (42001 from 1.10 to 1.28 m, 42002 from 0.77 to 0.97 m) and at Freeport and Corpus Christi. That fits the picture above: the fix changed the wind field's structure, and the wind near the storm core is still too strong. These Gulf-scale errors are also what reaches the local Galveston domain through its open boundary.

### Wind speed and direction

![Wind speed and direction at eight Gulf of Mexico buoys through Hurricane Ike: observed vs SCHISM 10-m wind with the original and the wind-fixed forcing](/img/portfolio/hurricane-ike-schism-wwm/ike_gulf_wind.png)
*Fig. 3 — Wind speed (upper panel of each pair) and the direction the wind comes from (lower panel; only where the wind exceeds 3 m/s). Model values are the 10-m wind at the nearest mesh node, compared with the buoy anemometers (about 5 m above the sea; adjusting to 10 m would raise the observations by roughly 5–10%, which doesn't change the picture).*

Away from the storm core the wind is captured closely: correlation is 0.91–0.98 at six of the eight buoys (0.78 at Bay of Campeche and 0.82 at Corpus Christi, where the wind is light and gusty), biases are within about ±0.7 m/s, and the wind direction is right to within about 8–15° on average (20° at Freeport, where the model runs about 16° too far clockwise). The wind-fixed and original forcings are nearly identical at every buoy except 42001, the one closest to the storm core. There the model produces two sharp spikes of about 50 m/s either side of a lull, where the buoy recorded a single broad maximum of about 30 m/s — a much stronger, narrower eyewall than was observed.

### Peak wave period and mean wave direction

![Peak wave period at eight Gulf of Mexico buoys through Hurricane Ike: observed dominant period vs SCHISM-WWM](/img/portfolio/hurricane-ike-schism-wwm/ike_gulf_tp.png)
*Fig. 4 — Peak wave period. The observed values are NDBC's dominant period, which is quantized by the buoy's spectral bins. The model starts from calm on Sept 7, so its first day is spin-up and is included in the statistics.*

![Mean wave direction at eight Gulf of Mexico buoys through Hurricane Ike: observed vs SCHISM-WWM, where the wave height exceeds 1 m](/img/portfolio/hurricane-ike-schism-wwm/ike_gulf_mwd.png)
*Fig. 5 — Mean wave direction, as the direction the waves come from, shown while the wave height exceeds 1 m. Three of the eight buoys (42001, 42039, 42040) don't measure wave direction, so only the model is shown there. Statistics are for the wind-fixed run.*

The model reproduces the abrupt arrival of long-period swell (about 14 s) ahead of the storm at most buoys, and the following decay. Correlation is 0.85–0.94, and the model runs about 0.3–0.7 s long at seven buoys (about 5%, which is the resolution of the wave model's frequency grid) and 0.3 s short at West Tampa. It overshoots the peak period by 1–3 s at the buoys nearest the core (42001, 42002, 42019, 42020) and stays high on the decay at Freeport and Corpus Christi, where the observed period drops as the sea becomes mixed.

Wave direction is captured in both shape and sense: the model follows the rotation of the wave direction as the storm passes, with a mean error of 17–29° where it can be checked. I confirmed the model's direction convention against the observations rather than assuming it (the model matches as a "coming from" direction; flipping it by 180° makes the error about 150–160°). Two caveats: the buoy reports the direction of the dominant waves while the model gives the mean over the whole spectrum, so some systematic offset is expected, and the largest bias, −22° at West Tampa, is a consistent under-rotation late in the storm.

| Buoy | Wind speed: r | bias | peak, obs → model | Wind direction: mean error | Tp: r | bias | Mean wave direction: mean error (bias) |
|---|---|---|---|---|---|---|---|
| 42001 Mid Gulf | 0.91 | +0.7 m/s | 30 → 52 m/s | 8° | 0.92 | +0.4 s | no directional obs |
| 42002 West Gulf | 0.93 | -0.3 m/s | 22 → 21 m/s | 11° | 0.90 | +0.5 s | 29° (-3°) |
| 42055 Bay of Campeche | 0.78 | +0.1 m/s | 16 → 10 m/s | 15° | 0.87 | +0.5 s | 22° (-10°) |
| 42039 Pensacola | 0.97 | +0.2 m/s | 16 → 16 m/s | 7° | 0.90 | +0.3 s | no directional obs |
| 42040 S. Dauphin Island | 0.98 | +0.1 m/s | 17 → 18 m/s | 12° | 0.94 | +0.5 s | no directional obs |
| 42019 Freeport, TX | 0.94 | +0.6 m/s | 22 → 24 m/s | 20° | 0.86 | +0.4 s | 17° (+9°) |
| 42020 Corpus Christi, TX | 0.82 | +0.4 m/s | 14 → 12 m/s | 12° | 0.90 | +0.7 s | 25° (-2°) |
| 42036 West Tampa | 0.98 | +0.1 m/s | 15 → 15 m/s | 8° | 0.85 | -0.3 s | 26° (-22°) |

Statistics are for the wind-fixed run over Sept 7–17; wind direction is scored only while the observed wind exceeds 5 m/s, and wave direction only while the observed wave height exceeds 1 m.

### Current

Only one of the eight buoys, 42002 (West Gulf), had a current meter in 2008; NDBC's current-profiler archive has no 2008 record for the other seven. So this is a single comparison, and the result is a limitation of the model configuration, not a tuning problem.

![Current speed and direction at NDBC buoy 42002 through Hurricane Ike: observed current meter at 41 m and mean of the upper 200 m vs the 2D depth-averaged SCHISM current](/img/portfolio/hurricane-ike-schism-wwm/ike_gulf_current_42002.png)
*Fig. 6 — Current at 42002 (3,122 m deep). The observations are from the current meter's 41-m bin and the mean of its bins down to 200 m; direction is the direction the current flows toward, as NDBC defines it. The model is the depth-averaged velocity of the 2D run.*

The observed current is a steady 0.15–0.3 m/s flowing toward the east-southeast (about 100–130°) both before and after the storm, with a peak of 0.43 m/s on Sept 12, as the wind at that buoy neared its peak, and little other obvious storm signature. That is the Gulf's ambient upper-ocean circulation: an independent ocean reanalysis (HYCOM) for the same days shows an eddy field around 42002, with currents of 0.4–0.5 m/s that change direction from one degree of latitude or longitude to the next. The model gives 0.03–0.05 m/s toward the west (about 270°) before the storm, and its current then rises to 0.24 m/s on Sept 13, still flowing west, while the observed current that day is 0.1–0.18 m/s toward the east-southeast — the storm-time pulse is not in the record. Averaged over the period, the model current is 0.07 m/s against 0.17 m/s observed.

A disagreement of nearly 180° can also come from a sign or convention error, so I checked both sides. On the model side, the velocity output is the depth-average, as intended, and its flow follows the model's own sea-level slope the way Coriolis physics requires: it correlates +0.79 (east) and +0.75 (north) with the geostrophic velocity implied by that slope, where a reversed frame would give negative values. The westward flow is a geostrophic response to the storm's sea-level pattern, with the high water on its right. On the observation side, NDBC documents the current-meter direction as the direction the current flows toward, which is how it is plotted, and a year-long test of how the measured current turns relative to the wind agrees with that reading; but that test is weak, so I could not verify the 2008 file's convention independently, and the reanalysis value at the buoy (toward about 30°) matches neither reading, as eddies vary from place to place. The most likely explanation is that the observed flow is ambient circulation the model does not have: the run is 2D and barotropic, with no stratification and no ocean-model boundary condition, so its current in a 3,000-m basin is only the depth-averaged sea-level, wind and tide response, and it overstates the storm-time part of that. Validating deep-water currents would need a 3D baroclinic run with ocean boundary data.

## Wave validation: the local domain

![Significant wave height time series at NDBC buoy 42035 through Hurricane Ike landfall: observed vs SCHISM-WWM local domain run](/img/portfolio/hurricane-ike-schism-wwm/ike_wave_42035_local.png)
*Fig. 7 — Wave height at buoy 42035 (r=0.88, RMSE 0.82 m, bias −0.27 m). The model tracks the storm's wave buildup and decay well; how the pending wind-fix rerun will change these numbers isn't yet known.*

## Current at the Bay Entrance

No current-meter record exists near Galveston for Ike. I checked all seven CO-OPS current stations near Galveston, including the Bay Entrance Channel meter used for the Harvey comparison, and none has data for September 2008 (that meter dates from 2011). What does exist is NOAA's harmonic, tide-only current prediction for the same station. Predictions aren't observations, but they can be checked: on Harvey's tide-only days (Aug 21–24, 2017) the prediction matches the real current-meter record closely — mean speed 0.38 m/s predicted against 0.42 m/s observed, correlation 0.93. That makes it a fair benchmark for Ike's own tide-only days, Sept 7–10, before the storm's effects reach the coast.

![Current speed at the Galveston Bay Entrance Channel through Hurricane Ike: SCHISM-WWM local domain vs NOAA's tide-only prediction, with the model's tide-averaged flow along the channel below](/img/portfolio/hurricane-ike-schism-wwm/ike_current_entrance.png)
*Fig. 8 — Current at the Bay Entrance Channel. Top: SCHISM-WWM (2D, depth-averaged) against NOAA's tide-only prediction. Bottom: the model's tide-averaged flow along the channel, positive out of the bay (model only). Over the tide-only days (shaded) the model's mean speed is 0.23 m/s against 0.47 m/s predicted — half — with a correlation of 0.77.*

That is the same shortfall found on the [Harvey page](/portfolio/independent-projects/wave-surge-model-intercomparison/) (0.48 of the observed speed there), and it appears here on a different local mesh. Short reruns of the Harvey setup point to the model's smoothing settings (a Shapiro filter and horizontal viscosity) as the main cause, and this run uses the same settings. Once the storm arrives there is nothing to score the model against. It shows the bay filling before landfall (tide-averaged flow reaching about 0.28 m/s into the bay), a brief speed spike near 1.0 m/s at landfall, and a drain of about 0.45 m/s out of the bay on Sept 14. The run has no river or rainfall inflow — the term that was largely missing for Harvey's storm-time outflow — and how large it would be for Ike is unknown, so those storm-time magnitudes are model-only numbers, not validated ones.

## Storm surge: correcting the reference level

The raw model-vs-observed water-level comparison carried a substantial negative bias at every station — up to 0.87 m at the worst one. Part of that traces to a genuine bathymetric datum mismatch: NOAA's Coastal Relief Model, despite being labeled MSL/EGM2008, retains its original bathymetric source data referenced to MLLW/MLW instead. Pulling each station's own MSL−MLLW offset from CO-OPS's datum API (0.18–0.30 m depending on station) and applying it to the model's output — shifting it onto the same MSL reference the observations use — recovers a substantial share of that bias.

![Bar chart comparing storm-surge bias before and after the bathymetric-datum correction, 5 Galveston-area CO-OPS stations, Hurricane Ike](/img/portfolio/hurricane-ike-schism-wwm/ike_wlev_bias_correction.png)
*Fig. 9 — Storm-surge bias before and after the datum correction, all 5 available stations. The correction cuts bias by roughly 25–50% (about 45–48% at Morgans Point, the Bay Entrance and Pier 21, 26% at Rollover Pass and Eagle Point) — a real, mechanical fix, not a tuning knob — though a negative bias remains at every station.*

| Station | Offset applied | Bias (raw → corrected) | RMSE (raw → corrected) | Corr |
|---|---|---|---|---|
| Morgans Point | +0.22 m | −0.46 → −0.24 m | 0.63 → 0.49 m | 0.80 |
| Rollover Pass | +0.23 m | −0.87 → −0.65 m | 1.17 → 1.01 m | 0.04 |
| Eagle Point | +0.18 m | −0.72 → −0.53 m | 0.83 → 0.68 m | 0.90 |
| Bay Entrance (N. Jetty) | +0.30 m | −0.62 → −0.32 m | 0.70 → 0.46 m | 0.87 |
| Galveston Pier 21 | +0.25 m | −0.56 → −0.31 m | 0.64 → 0.43 m | 0.93 |

Correlation only measures timing, and two of these gauges show why that isn't enough. At Morgans Point the model's peak is only +0.12 m against 2.55 m observed, so its 0.80 correlation is the timing of a tiny signal. Rollover Pass barely responds at all — the same station that barely responds in the Harvey local run (see the [companion write-up](/portfolio/independent-projects/wave-surge-model-intercomparison/)), which suggests, though it hasn't been confirmed, that the cause is how the mesh represents these bay-head locations rather than the storm. The peak water levels show the rest:

| Station | Observed peak (MSL) | Model peak, raw → datum-corrected | Peak captured | Peak timing (model − obs) |
|---|---|---|---|---|
| Galveston Pier 21 | 2.86 m (Sep 13, 03:00; 5-hour gap in the record around it) | 2.27 → 2.52 m | 88% | +5 h |
| Eagle Point | 3.33 m (Sep 13, 06:00) | 1.71 → 1.89 m | 57% | +1 h |
| Morgans Point | 2.55 m (Sep 13, 07:00) | 0.12 → 0.34 m | 13% | +2 h |
| Bay Entrance (N. Jetty) | gauge failed around 02:00 on Sep 13, before the peak | 2.60 → 2.90 m | not scorable | — |
| Rollover Pass | record incomplete (156 of 240 hours); its recorded maximum falls on Sep 16, after the storm | −0.29 → −0.06 m | not scorable | — |

Observed peaks at gauges that failed or have gaps near the peak are lower bounds, so the captured fractions for Pier 21 in particular are, if anything, generous. At the open-coast gauge with a nearly complete record, Pier 21, the corrected model reaches most of the surge; on the bay's own shore at Eagle Point it reaches a little over half, against about 83% at the same gauge for Harvey. The two bay-head gauges fail in both storms.

![Storm-surge water-level time series at Galveston Pier 21 through Hurricane Ike, datum-corrected: observed vs. SCHISM-WWM local domain run](/img/portfolio/hurricane-ike-schism-wwm/ike_wlev_pier21_corrected.png)
*Fig. 10 — Storm-surge water level at Galveston Pier 21, datum-corrected (r=0.93). The corrected model reaches about 88% of the recorded peak (2.52 vs. 2.86 m), about five hours late, though the gauge has a five-hour gap around the peak. Whether the pending wind-fix rerun raises or lowers this is not yet known: the old wind bug overestimated wind at the offshore buoy, which would push surge up, not down.*

## Fixing the offshore boundary

An earlier version of the local mesh (v6) placed its open boundary too close to the continental shelf, costing real wave energy right at the boundary itself: 9.1 percentage points of retention lost in the first hop alone. Moving the boundary further offshore (v7, the mesh used throughout this write-up) cut that loss to 1.3 points.

![Deep-water hop-by-hop wave-energy retention at each storm's own peak, comparing the original (v6) and offshore-moved (v7) open boundary](/img/portfolio/hurricane-ike-schism-wwm/ike_hop_profile.png)
*Fig. 11 — Deep-water retention, hop-by-hop, old vs. new boundary. The gap that opens at hop0→hop1 for the old boundary persists through hop12 (84.0% vs. 95.6%); moving the boundary offshore all but closes it.*

Diagnosing this also surfaced a separate, genuine finding, not a bug: raw retention figures near the coast looked alarmingly low until split by depth. The shallow subset is breaking-limited — real physics — while the deep-water subset alone tells the true story of how well the boundary itself preserves energy.

![Deep-water vs. shallow-water wave-energy retention at the storm peak, both Ike and Harvey, at the same ring of nodes 12 hops from the open boundary](/img/portfolio/hurricane-ike-schism-wwm/ike_retention_split.png)
*Fig. 12 — Retention split by depth, both storms, same node ring. Deep water clusters tightly at 84–89% for both storms; the low "all hop12" figure that first raised concern was diluted by shallow, physically breaking-limited nodes.*

![Every shallow node's significant wave height at the storm peak plotted against its own local depth, with the 0.6x-depth breaking-limit line overlaid](/img/portfolio/hurricane-ike-schism-wwm/ike_hs_vs_depth.png)
*Fig. 13 — Wave height vs. depth at the shallow nodes: the 0.6x-depth breaking limit (Miche/Battjes–Janssen) predicts the ceiling almost exactly (corr(depth, Hs) = 0.945).*

## Where this leaves the project

The wind-forcing fix has repaired the *structure* of the Gulf-scale wind field (the eye lull and the timing of the second maximum), but winds near the storm core are still about 1.7–1.9x too strong, which shows up as too-high waves at the deep buoys. The offshore-boundary fix has already been carried into the mesh used throughout, and the datum correction resolves a real, mechanical share of the surge bias. What remains: correcting the wind intensity near the core, relaunching the local Galveston domain against the corrected wind field so wave, current, and storm-surge numbers all reflect it, and getting ADCIRC-SWAN's Ike setup past its current instability so a full two-model comparison — like the one already done for Harvey — becomes possible for this storm too. Two problems shared with the Harvey local run also remain open: tidal currents at the Bay Entrance are about half of the predicted speed, and the bay-head gauges at Morgans Point and Rollover Pass barely respond. In deep water, the 2D barotropic run cannot reproduce the observed ambient current at all (checked at 42002), so any deep-water current validation would need a 3D baroclinic run with ocean boundary data.

*Model: [SCHISM](https://www.schism-dev.org/)+[WWM](https://wwm-model.org/). Forcing: GAHM-parametric wind field from HURDAT2 best-track data. Validation: NOAA CO-OPS water-level stations and NDBC buoys.*
