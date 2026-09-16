---
title: "Coupled Wave-Surge Model Validation: Hurricane Ike (SCHISM-WWM)"
date: 2026-01-01
description: "A nested Gulf-of-Mexico-to-Galveston SCHISM-WWM hindcast of Hurricane Ike (2008): wave, current, and datum-corrected storm-surge validation, a wind-forcing bug found and fixed at landfall, and an offshore-boundary fix that recovered lost wave energy."
challenge: "Ike was a much larger, more intense storm than Harvey, and reusing wind-forcing and boundary settings tuned for Harvey without re-checking them against a storm of a very different character risked quietly wrong results rather than an obvious crash."
approach: "Ran the same nested-domain strategy used for Harvey — a Gulf-of-Mexico regional SCHISM-WWM hindcast feeding a high-resolution local Galveston domain — against Hurricane Ike, and checked every stage against NDBC buoy 42035 and the local CO-OPS water-level network. ADCIRC-SWAN is not included here: that companion run has not yet completed successfully for Ike."
result: "Found and fixed a real wind-forcing bug that had overestimated peak wind speed at buoy 42035 by nearly 2x, and an offshore-boundary placement issue that was costing real wave energy at the local domain's edge. Wave height at the buoy correlates well with observations (r=0.88); storm-surge bias drops substantially once corrected for a bathymetric datum mismatch on the local mesh. The local domain's own simulation still needs to be relaunched with the corrected wind before these numbers reflect that fix too."
tags: ["SCHISM", "WWM", "storm surge", "wave modeling", "current validation", "Hurricane Ike", "nested modeling", "GAHM wind forcing"]
link: ""
image: "/img/portfolio/hurricane-ike-schism-wwm/ike_mesh_nested.png"
weight: 16
---

Hurricane Ike made landfall near Galveston in September 2008 — a much larger, more intense storm than Harvey (2017), and a useful stress test for a modeling pipeline originally built and tuned around Harvey's very different wind field. This write-up covers a SCHISM-WWM-only nested hindcast of Ike, run through the same Gulf-of-Mexico-to-Galveston pipeline as the [companion Harvey inter-comparison](/portfolio/independent-projects/wave-surge-model-intercomparison/). ADCIRC-SWAN isn't part of this one: that Ike setup hasn't yet completed a successful run.

![The local Galveston mesh (v7) with CO-OPS stations and NDBC 42035 marked, inset with the full Gulf-of-Mexico parent domain and the local domain's footprint highlighted](/img/portfolio/hurricane-ike-schism-wwm/ike_mesh_nested.png)
*Fig. 1 — The nested domain structure: a local, high-resolution Galveston mesh sitting inside the same Gulf-of-Mexico parent mesh used for Harvey.*

## A wind-forcing bug, found and fixed

The Gulf-of-Mexico run surfaced a real wind-forcing bug: the GAHM vortex model's radius-of-maximum-winds fit was being clamped by a safety cap tuned for Harvey's weak, broad, post-landfall-stall wind field — the wrong cap for Ike, a much larger and more intense storm, which drove a spurious ~51 m/s wind spike at buoy 42035 during closest approach instead of the observed ~28 m/s.

The fix makes the cap intensity-aware: when HURDAT2 reports both r50 and r64 wind radii for a quadrant (real evidence of organized hurricane-force structure, which Harvey's stall phase never had), the cap follows an r64-anchored profile fit instead of a flat multiplier — never tighter than the original cap, so Harvey's case is unaffected. Rerunning the Gulf-of-Mexico domain with the fix reproduced the correct wind lull as Ike's eye passed almost directly over the buoy — confirmed independently by the buoy's own barometric pressure nearly matching HURDAT2's official central pressure at that time.

The local Galveston domain's own wind field has been regenerated with this same fix, but the local simulation itself hasn't been relaunched yet — so the wave, current, and storm-surge results below all still reflect the pre-fix wind. They're shown as the best currently-available local-domain results, not final validated numbers.

## Wave validation

![Significant wave height time series at NDBC buoy 42035 through Hurricane Ike landfall: observed vs SCHISM-WWM local domain run](/img/portfolio/hurricane-ike-schism-wwm/ike_wave_42035_local.png)
*Fig. 2 — Wave height at buoy 42035 (r=0.88, RMSE 0.82 m, bias −0.27 m). The model tracks the storm's wave buildup and decay well despite the pending wind-fix rerun — Ike's wind overestimate was concentrated at closest approach, and its effect is more visible in the surge and current fields below than in wave height here.*

## Current

No current-meter record survives from Ike at buoy 42035 or anywhere nearby in the CO-OPS current network — the nearest real-time current station (Galveston Bay Entrance Channel, used for the Harvey comparison) wasn't installed until 2011, three years after Ike. What's shown below is the model's own depth-averaged current at the buoy, presented as a physical sanity check rather than a validation: no obs exist to score it against.

![Modeled depth-averaged current speed and direction at NDBC buoy 42035 through Hurricane Ike, SCHISM-WWM local domain, no observations available](/img/portfolio/hurricane-ike-schism-wwm/ike_current_42035_modelonly.png)
*Fig. 3 — Modeled current at 42035 (model only). Speed peaks around 1.3 m/s as the storm passes, with a clear direction swing as the wind field rotates past the buoy — physically the right shape for a storm-driven current, even without an observational record to confirm the magnitude.*

## Storm surge: correcting the reference level

The raw model-vs-observed water-level comparison carried a substantial negative bias at every station — up to 0.87 m at the worst one. Part of that traces to a genuine bathymetric datum mismatch: NOAA's Coastal Relief Model, despite being labeled MSL/EGM2008, retains its original bathymetric source data referenced to MLLW/MLW instead. Pulling each station's own MSL−MLLW offset from CO-OPS's datum API (0.18–0.30 m depending on station) and applying it to the model's output — shifting it onto the same MSL reference the observations use — recovers a substantial share of that bias.

![Bar chart comparing storm-surge bias before and after the bathymetric-datum correction, 5 Galveston-area CO-OPS stations, Hurricane Ike](/img/portfolio/hurricane-ike-schism-wwm/ike_wlev_bias_correction.png)
*Fig. 4 — Storm-surge bias before and after the datum correction, all 5 available stations. The correction cuts bias by roughly 40–45% everywhere it's applied — a real, mechanical fix, not a tuning knob — though a negative bias remains at every station, consistent with the still-pending wind-fix rerun.*

| Station | Offset applied | Bias (raw → corrected) | RMSE (raw → corrected) | Corr |
|---|---|---|---|---|
| Morgans Point | +0.22 m | −0.46 → −0.24 m | 0.63 → 0.49 m | 0.80 |
| Rollover Pass | +0.23 m | −0.87 → −0.65 m | 1.17 → 1.01 m | 0.04 |
| Eagle Point | +0.18 m | −0.72 → −0.53 m | 0.83 → 0.68 m | 0.90 |
| Bay Entrance (N. Jetty) | +0.30 m | −0.62 → −0.32 m | 0.70 → 0.46 m | 0.87 |
| Galveston Pier 21 | +0.25 m | −0.56 → −0.31 m | 0.64 → 0.43 m | 0.93 |

Rollover Pass is the outlier — correlation near zero regardless of the datum fix, echoing the same shallow, bay-interior stations that trip up both models in the Harvey comparison. Everywhere else, correlation is strong (0.80–0.93) and the datum correction meaningfully tightens both bias and RMSE.

![Storm-surge water-level time series at Galveston Pier 21 through Hurricane Ike, datum-corrected: observed vs. SCHISM-WWM local domain run](/img/portfolio/hurricane-ike-schism-wwm/ike_wlev_pier21_corrected.png)
*Fig. 5 — Storm-surge water level at Galveston Pier 21, datum-corrected (r=0.93). The remaining gap is where the pending wind-fix rerun should matter most: Ike's wind overestimate at closest approach would have pushed modeled surge too, not just modeled wind speed.*

## Fixing the offshore boundary

An earlier version of the local mesh (v6) placed its open boundary too close to the continental shelf, costing real wave energy right at the boundary itself: 9.1 percentage points of retention lost in the first hop alone. Moving the boundary further offshore (v7, the mesh used throughout this write-up) cut that loss to 1.3 points.

![Deep-water hop-by-hop wave-energy retention at each storm's own peak, comparing the original (v6) and offshore-moved (v7) open boundary](/img/portfolio/hurricane-ike-schism-wwm/ike_hop_profile.png)
*Fig. 6 — Deep-water retention, hop-by-hop, old vs. new boundary. The gap that opens at hop0→hop1 for the old boundary persists through hop12 (84.0% vs. 95.6%); moving the boundary offshore all but closes it.*

Diagnosing this also surfaced a separate, genuine finding, not a bug: raw retention figures near the coast looked alarmingly low until split by depth. The shallow subset is breaking-limited — real physics — while the deep-water subset alone tells the true story of how well the boundary itself preserves energy.

![Deep-water vs. shallow-water wave-energy retention at the storm peak, both Ike and Harvey, at the same ring of nodes 12 hops from the open boundary](/img/portfolio/hurricane-ike-schism-wwm/ike_retention_split.png)
*Fig. 7 — Retention split by depth, both storms, same node ring. Deep water clusters tightly at 84–89% for both storms; the low "all hop12" figure that first raised concern was diluted by shallow, physically breaking-limited nodes.*

![Every shallow node's significant wave height at the storm peak plotted against its own local depth, with the 0.6x-depth breaking-limit line overlaid](/img/portfolio/hurricane-ike-schism-wwm/ike_hs_vs_depth.png)
*Fig. 8 — Wave height vs. depth at the shallow nodes: the 0.6x-depth breaking limit (Miche/Battjes–Janssen) predicts the ceiling almost exactly (corr(depth, Hs) = 0.945).*

## Where this leaves the project

The wind-forcing bug is fixed and confirmed at the Gulf-of-Mexico scale, the offshore-boundary fix has already been carried into the mesh used throughout, and the datum correction resolves a real, mechanical share of the surge bias. What remains: relaunching the local Galveston domain against its already-corrected wind field so wave, current, and storm-surge numbers all reflect the fix, and getting ADCIRC-SWAN's Ike setup past its current instability so a full two-model comparison — like the one already done for Harvey — becomes possible for this storm too.

*Model: [SCHISM](https://www.schism-dev.org/)+[WWM](https://wwm-model.org/). Forcing: GAHM-parametric wind field from HURDAT2 best-track data. Validation: NOAA CO-OPS water-level stations and NDBC buoy 42035.*
