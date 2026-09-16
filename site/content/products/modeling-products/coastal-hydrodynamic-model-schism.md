---
title: "Coastal Hydrodynamic Model (ROMS; SCHISM; ADCIRC)"
date: 2026-01-01
description: "A multi-model coastal and shelf hydrodynamics capability, matched to the region and physics needed — ROMS for 3D shelf circulation, SCHISM-WWM for general-purpose coastal/estuarine circulation, and ADCIRC for storm surge and inundation modeling."
tags: []
link: ""
image: "/img/products/coastal-hydrodynamic-model.jpg"
weight: 15
---

## Description ##
Coastal and shelf circulation models each make different tradeoffs — grid type, resolution, computational cost, and which physics they resolve well — so I match the model to the domain and the question being asked rather than defaulting to one system:

- **ROMS** — 3D shelf circulation on a structured curvilinear grid, currently configured for the Texas-Louisiana shelf (the same domain used in [Regional Forecast System](/products/modeling-products/regional-forecast-system-roms/)) and for an operational forecast of the New York Bight (see [Regional Operational Ocean Forecast for New York Bight](/portfolio/independent-projects/regional-ocean-forecast-nyb/)). In both cases the model runs on a rolling forecast cycle, forced by NOAA GFS atmospheric data and Copernicus open-boundary conditions with OSU TPXO tides, and checked daily against water-level, current, and temperature observations.
- **SCHISM-WWM** — general-purpose coastal and estuarine circulation on an unstructured grid, which handles complex coastlines and variable resolution (fine nearshore, coarse offshore) more naturally than a structured grid. Configured for the New York Bight, and used as the regional layer in [Rebuilding Hurricane Ike at Rollover Pass](/portfolio/independent-projects/rebuilding-hurricane-ike-at-rollover-pass/) to drive a high-resolution local storm-impact model.
- **ADCIRC** — storm surge and inundation modeling; see [Hurricane Wave and Storm Surge Modeling](/products/modeling-products/hurricane-wave-storm-surge-modeling/) for the coupled ADCIRC-SWAN storm-surge setup for Galveston Bay.

The same toolkit extends to standalone wave modeling with SWAN (nearshore/shelf) and WaveWatch III (global/regional) when a project needs wave fields without a coupled circulation run.

<!-- [Add: grid resolution and validation results for the SCHISM-WWM New York Bight and ADCIRC Galveston Bay configurations.] -->

## Example ##
- [Regional Operational Ocean Forecast for New York Bight](/portfolio/independent-projects/regional-ocean-forecast-nyb/) — ROMS, daily operational forecast cycle
- [Hurricane wave and storm surge modeling for Galveston Bay](/portfolio/independent-projects/hurricane-ike-schism-wwm-nested-validation/) — SCHISM-WWM and ADCIRC-SWAN
- [Rebuilding Hurricane Ike at Rollover Pass](/portfolio/independent-projects/rebuilding-hurricane-ike-at-rollover-pass/) — SCHISM-WWM regional storm hindcast feeding a local XBeach model

*Thumbnail: South Carolina intracoastal waterway — public domain (U.S. Fish & Wildlife Service, Gentry George), via Wikimedia Commons.*
