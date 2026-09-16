---
title: "Coastal Wave Model (SWAN; WW3)"
date: 2026-01-01
description: "A multi-model coastal and shelf hydrodynamics capability, matched to the region and physics needed — ROMS for 3D shelf circulation, SCHISM-WWM for general-purpose coastal/estuarine circulation, and ADCIRC for storm surge and inundation modeling."
tags: []
link: ""
image: ""
weight: 30
hidden: true
---

I match the model to the domain and physics rather than defaulting to one system:

- **ROMS** — 3D shelf circulation, currently configured for the Texas-Louisiana shelf (the same domain used in [Regional Forecast System](/products/modeling-products/regional-forecast-system-roms/)).
- **SCHISM-WWM** — general-purpose coastal and estuarine circulation on an unstructured grid, configured for the New York Bight.
- **ADCIRC** — storm surge and inundation modeling; see [Hurricane Wave and Storm Surge Modeling](/products/modeling-products/hurricane-wave-storm-surge-modeling/) for the coupled ADCIRC-SWAN storm-surge setup for Galveston Bay.

The same toolkit extends to standalone wave modeling with SWAN (nearshore/shelf) and WaveWatch III (global/regional) when a project needs wave fields without a coupled circulation run.

<!-- [Add: grid resolution per configuration, forcing/boundary data sources, validation results.] -->
