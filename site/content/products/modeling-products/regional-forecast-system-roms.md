---
title: "Regional Ocean Forecast System (ROMS)"
date: 2026-01-01
description: "An operational ocean forecast system built on ROMS (Regional Ocean Modeling System), producing short-term forecasts of currents, temperature, and sea level for the Texas-Louisiana shelf to support marine operations."
tags: []
image: "/img/products/regional-forecast-system-roms.jpg"
weight: 10
---


## Description 
Runs a regional [ROMS](https://www.myroms.org/) configuration for the Texas-Louisiana shelf on a rolling forecast cycle, ingesting atmospheric forcing and open-boundary/tidal conditions to generate multi-day forecasts of 3D currents, temperature, salinity, and sea surface height. Forecast fields are going to be served live via a THREDDS data server (Under construction).

Regional Ocean Forecast System runs 5-day forecast and 1-day nowcast daily. Atmospheric forcing is from NOAA's Global Forecast System (GFS) and open boundary conditions are obtained from [Copernicus's Forecast and Analysis product](https://data.marine.copernicus.eu/product/GLOBAL_ANALYSISFORECAST_PHY_001_024/description). Tides are prescribed along the open boundaries by [Oregon State University's TPXO](https://www.tpxo.net/global). Forecast output is validated against observations namely water levels, current velocity, and temperature when available. 

## Computer Systems ##
I can use various computer systems to implement operational forecasts depending on client/my resouces. Here is the list of examples. Currently, I am currently using a local workstation for testing ocean models listed on my website.
- Amazon Web Services
- High Performance Computing (HPC)
- Custome-built server
- Local workstation

## Example
- [New York Bight Operational Forecast](/portfolio/independent-projects/regional-ocean-forecast-nyb/) — Prototype operational forecast for NYB
- [Texas-Louisiana Operational Ocean Forecast](https://gcoos5.geos.tamu.edu/thredds/catalog/ROFS_latest/catalog.html) — Operational forecast maintained at Texas A&M University 

*Thumbnail: The Gulf Stream, MODIS/Aqua — public domain (NASA Earth Observatory, Norman Kuring/MODIS Ocean Team).*
