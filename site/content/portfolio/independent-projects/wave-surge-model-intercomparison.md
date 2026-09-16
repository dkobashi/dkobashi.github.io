---
title: "Coupled Wave-Surge Model Inter-comparison: Hurricane Harvey (ADCIRC-SWAN vs. SCHISM-WWM)"
date: 2026-01-01
description: "Comparing coupled ADCIRC-SWAN and SCHISM-WWM storm surge and wave models for the Galveston, Texas coast, nested from a Gulf of Mexico regional domain, against Hurricane Harvey (2017)."
challenge: "Coupled wave-surge models differ in mesh type, coupling approach, and computational cost, and it's often unclear which setup best fits a specific coastal application without actually running both against the same storm, the same nesting strategy, and the same observation network."
approach: "Set up both ADCIRC-SWAN and SCHISM-WWM for the Galveston, Texas coast using a nested-domain approach: running each model first over a Gulf of Mexico regional domain, then nesting a local Galveston-area domain driven by boundary conditions from that Gulf-wide run. Checked every result against the same eight NOAA CO-OPS water-level gauges and the NDBC buoy at 42035."
result: "At the regional Gulf-of-Mexico scale, SCHISM-WWM matched observed wave heights better than ADCIRC-SWAN and finished in roughly a third of the total compute. At the local Galveston scale — validated for ADCIRC-SWAN for the first time as part of this project — storm-surge skill was comparable between the two models, with both sharing the same weak spot at three shallow, bay-interior gauges."
tags: ["SCHISM", "WWM", "ADCIRC", "SWAN", "storm surge", "wave modeling", "Hurricane Harvey", "nested modeling", "model inter-comparison"]
link: ""
image: "/img/portfolio/wave-surge-intercompare/spectra_compare.png"
weight: 15
---

Two coupled circulation/wave codes — [ADCIRC](https://adcirc.org/)+[SWAN](https://swanmodel.sourceforge.io/) and [SCHISM](https://www.schism-dev.org/)+[WWM](https://wwm-model.org/) — solve the same physics on very different meshes (structured-triangle vs. fully unstructured) with different coupling and numerics. Rather than argue the tradeoffs in the abstract, this project runs both, the same way, against a real hurricane: Harvey's 2017 landfall on the Texas coast.

The comparison uses a nested strategy: a Gulf-of-Mexico-wide regional domain sets the large-scale surge and wave field, and a high-resolution Galveston-area domain nested inside it resolves the bay, the ship channel, and the barrier islands where the observation network actually sits. Both models were carried all the way through both scales, and checked against the same eight CO-OPS water-level stations, NDBC buoy 42035, and the local wave record.

![The SCHISM+WWM Gulf of Mexico mesh, 55,691 nodes and 108,734 elements, node-for-node identical to the ADCIRC-SWAN GoM-v1 mesh, finer near the coast and shelf break, coarser offshore](/img/portfolio/wave-surge-intercompare/harvey_gom_mesh.png)
*Fig. 1 — The shared Gulf-of-Mexico mesh both models ran on: same triangulation, same 10 NDBC buoys, same storm.*

## Gulf-of-Mexico scale: waves and cost

Same mesh, same storm, same wind forcing concept (GAHM+ERA5) — the cleanest comparison available between the two systems.

| | SCHISM-WWM | ADCIRC-SWAN |
|---|---|---|
| Mean Hs correlation (10 buoys) | 0.917 | 0.878 |
| Mean Hs RMSE | 0.415 m | 0.446 m |
| Wall-clock time | 142.8 min (24 ranks) | 638.7 min (16 ranks) |
| Total compute (rank-minutes) | 3,427 | 10,219 |

![Bar chart of significant wave height correlation by NDBC buoy station, SCHISM+WWM vs ADCIRC-SWAN, Gulf of Mexico domain](/img/portfolio/wave-surge-intercompare/harvey_hs_corr_gom.png)
*Fig. 2 — Wave-height correlation by buoy station. SCHISM-WWM leads at most stations.*

![Bar chart of wall-clock time and total compute (wall-clock times MPI ranks) for the identical 10-day run](/img/portfolio/wave-surge-intercompare/harvey_runtime.png)
*Fig. 3 — Wall-clock time and total compute for the identical 10-day, 108,734-element run. SCHISM-WWM finished about 4.5x faster and used roughly a third of the total compute.*

SCHISM-WWM's edge in wave accuracy isn't just numerics — it's traceable to the wind-input physics itself. WWM runs the Ardhuin et al. ST4 source-term package, documented in the wave-modeling literature as a genuine, quantified improvement (roughly 30% RMSE reduction in global validation) over the older Komen-generation physics that SWAN's closest analogue relies on. That shows up directly in the two models' 2D wave spectra at the storm's peak:

![Polar plots comparing the 2D wave energy spectrum from SCHISM+WWM and ADCIRC-SWAN at the peak of Hurricane Harvey, near NDBC buoy 42035](/img/portfolio/wave-surge-intercompare/spectra_compare.png)
*Fig. 4 — 2D wave spectrum at Harvey's landfall peak. SCHISM-WWM (left) produces a broader, more physically realistic spread of energy across direction and frequency; ADCIRC-SWAN (right, nearest SWAN output point, ~19 km from the buoy) is more sharply peaked — the signature of the weaker source-term physics behind it.*

## Local Galveston scale: wind, wave, current, storm surge

No local-domain ADCIRC-SWAN comparison existed before this project — validating it here, against the same eight CO-OPS gauges and buoy 42035 used for SCHISM, was part of the work.

![Wind speed and direction time series at NDBC buoy 42035 through Hurricane Harvey landfall: observed, SCHISM-WWM, and ADCIRC-SWAN](/img/portfolio/wave-surge-intercompare/harvey_wind_42035.png)
*Fig. 5 — Wind speed and direction at 42035 through landfall. Both models track the observed wind speed ramp-up and direction veer closely.*

### Wave validation

![Significant wave height time series at NDBC buoy 42035 through Hurricane Harvey landfall, local Galveston domain: observed vs SCHISM-WWM](/img/portfolio/wave-surge-intercompare/harvey_wave_42035_local.png)
*Fig. 6 — Wave height at buoy 42035, SCHISM-WWM's local (fine-resolution) domain (r=0.93, RMSE 0.37 m, bias +0.03 m) — essentially unbiased, and consistent with the same model's Gulf-of-Mexico-scale skill above.*

### Current validation

Real observed current data is rare for a storm this old, but one nearby NOAA PORTS current-meter station — Galveston Bay Entrance Channel — has a continuous record back to 2017, Harvey's own year, so this is a genuine obs-vs-model check, not a qualitative one.

![Current speed and direction at the Galveston Bay Entrance Channel through Hurricane Harvey: observed (NOAA PORTS g06010) vs SCHISM-WWM local domain](/img/portfolio/wave-surge-intercompare/harvey_current_g06010.png)
*Fig. 7 — Current speed and direction at the Bay Entrance Channel (r=0.61). The model tracks the ebb/flood timing reasonably well but systematically underestimates current speed (model mean 0.22 m/s vs. observed 0.77 m/s) — expected for a depth-averaged 2D model compared against a point current-meter reading near the surface of a sheared tidal channel, where the near-surface current runs faster than the water-column average.*

### Storm surge

![Bar chart of storm-surge correlation with observed water level at 8 Galveston-area CO-OPS stations, SCHISM-WWM vs ADCIRC-SWAN](/img/portfolio/wave-surge-intercompare/harvey_wlev_corr.png)
*Fig. 8 — Storm-surge correlation across all eight local stations. The two models land close together overall (mean r ≈ 0.42–0.43) — and share the same weak spot: three shallow, bay-interior gauges (Morgans Point, High Island, Rollover Pass) where neither model captures the local dynamics well, sometimes even correlating negatively. Restricted to the five open-coast/inlet gauges, both cluster in the 0.55–0.83 range with no consistent winner between them.*

![Storm-surge water-level time series at Galveston Pier 21 through Hurricane Harvey: observed, SCHISM-WWM local run, and ADCIRC-SWAN](/img/portfolio/wave-surge-intercompare/harvey_wlev_pier21.png)
*Fig. 9 — Storm-surge water level at Galveston Pier 21, one of the better-behaved stations: both models reproduce the surge buildup and timing well, though both sit below the observed peak by a similar margin — consistent with the bathymetric-datum offset (0.19–0.30 m depending on station) identified on the Galveston mesh (see the companion Hurricane Ike write-up, which applies the correction directly).*

The honest reading of the local-domain comparison: for storm surge specifically, the choice between these two models matters less than the choice of *station* — three shallow interior-bay gauges are a shared blind spot for both, likely reflecting a genuine limitation of depth-averaged 2D circulation at that scale rather than a model-specific deficiency. The current comparison adds a second, sharper example of the same kind of honest limitation: good phase skill, systematic magnitude bias against a near-surface point sensor.

*Models: [ADCIRC](https://adcirc.org/)+[SWAN](https://swanmodel.sourceforge.io/), [SCHISM](https://www.schism-dev.org/)+[WWM](https://wwm-model.org/). Forcing: GAHM-parametric wind fields from HURDAT2 best-track data. Validation: NOAA CO-OPS water-level stations and NDBC buoy 42035.*

Uses the same coupled modeling capability described in [Hurricane Wave and Storm Surge Modeling](/products/modeling-products/hurricane-wave-storm-surge-modeling/). See also the companion write-up on [Hurricane Ike](/portfolio/independent-projects/hurricane-ike-schism-wwm-nested-validation/), run through the same nested pipeline.
