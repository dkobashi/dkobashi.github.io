---
title: "Hurricane Wave and Storm Surge Modeling (SCHISM-WWM; ADCIRC-SWAN)"
date: 2026-01-01
description: "Coupled wave and storm surge simulations for hurricane events, producing flood and wave-height forecasts/hindcasts for coastal risk and emergency-response planning."
tags: []
link: ""
image: "/img/products/hurricane-wave-storm-surge.jpg"
weight: 18
---

## Description
A coupled ADCIRC-SWAN or SCHISM-WWM modeling setup for the Gulf of Mexico coast, simulating wind-driven waves and storm surge together through landfalling hurricanes to capture wave setup, surge, and inundation extent. Built using a nested-domain approach — a Gulf-wide regional run providing boundary conditions to a higher-resolution local-area domain — and run in either forecast mode ahead of an approaching storm or hindcast mode for post-event analysis.

Storms are forced with a parametric GAHM vortex wind field built from HURDAT2 best-track data, fit to each storm's own size and intensity rather than a single generic profile. Every run is checked against real observations — NOAA CO-OPS water-level gauges, NDBC buoys, and NOAA PORTS current meters where available — rather than judged as physically plausible on appearance alone. That validation has caught genuine, fixable issues: a wind-forcing radius-of-maximum-winds bug that overestimated peak winds by nearly 2x for an intense storm, a bathymetric datum mismatch that biased modeled storm surge until corrected station-by-station, and an offshore-boundary placement that was quietly losing wave energy before it reached the coast.

Running both model pairs against the same storm also surfaces real tradeoffs between them: for Hurricane Harvey, SCHISM-WWM matched observed wave heights better than ADCIRC-SWAN at the regional Gulf-of-Mexico scale and finished in roughly a third of the total compute, while at the local Galveston scale storm-surge skill was comparable between the two, with both sharing the same weak spot at shallow, bay-interior gauges.

## Example
- [Hurricean wave and storm surge inter-comparison for Hurricane Harvey](/portfolio/independent-projects/wave-surge-model-intercomparison/)
- [Hurricean wave and storm surge modeling for Hurricane Ike](/portfolio/independent-projects/hurricane-ike-schism-wwm-nested-validation/)

*Thumbnail: Hurricane Harvey approaching Texas, MODIS/Terra — public domain (NASA Earth Observatory).*
