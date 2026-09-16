---
title: "Regional Operational Ocean Forecast for New York Bight"
date: 2026-01-01
description: "A self-operated ROMS regional ocean forecast system for the New York Bight, running a daily 5-day forecast cycle for surface currents, water level, temperature, and salinity, with skill checked against NOAA tide gauges."
challenge: "Operating a forecast system is a different test than building the model itself. The daily cycle — forcing data ingestion, model execution, quality checks, and report generation — has to run reliably every day, and the forecasts have to be checked against what the ocean actually did, not just judged as plausible-looking."
approach: "Run a ROMS configuration for the New York Bight (Long Island Sound through the New York/New Jersey shelf) on a rolling 5-day forecast cycle, ingesting atmospheric forcing and open-boundary/tidal conditions to generate forecasts of surface currents, water level, temperature, and salinity, and checking each cycle's water-level forecast against NOAA CO-OPS tide gauge observations at Sandy Hook, NJ and Montauk, NY."
result: "The system runs a daily operational cycle whose water-level forecasts track the CO-OPS tide gauge record closely — correlation of 0.95 at Sandy Hook and 0.90 at Montauk — with comparable current skill (R of 0.88-0.89 against an NDBC buoy at Barnegat, NJ) and more mixed sea-surface temperature skill (R of 0.12-0.65 across five stations), tracked daily in the report below."
tags: ["ROMS", "operational forecasting", "New York Bight"]
link: ""
image: "/img/portfolio/nyb-forecast/cur_speed_snapshots.png"
weight: 5
---

Same underlying capability as the [Regional Ocean Forecast System (ROMS)](/products/modeling-products/regional-forecast-system-roms/) product, now configured for the New York Bight and run independently as a self-directed operational project.

## Daily Forecast Report

Each daily cycle runs a 5-day forecast on a curvilinear ROMS grid (200×85 rho points) spanning Long Island Sound through the New York/New Jersey shelf, and compiles the results into a report covering:

![NYB ROMS grid, 200 by 85 rho points, spanning Long Island Sound through the New York/New Jersey shelf, with station output locations marked](/img/portfolio/nyb-forecast/grid_mesh.png)
*Model domain and grid — the curvilinear ROMS mesh used for the forecast, with output station locations marked.*

![Six-panel forecast of surface current speed and direction across the domain at 24-hour intervals from +0h to +120h](/img/portfolio/nyb-forecast/cur_speed_snapshots.png)
*Surface current speed and direction, forecast out to 120 hours (5 days) in 24-hour steps.*

![Six-panel forecast of sea-surface temperature across the domain at 24-hour intervals from +0h to +120h](/img/portfolio/nyb-forecast/sst_snapshots.png)
*Sea-surface temperature over the same 5-day forecast window.*

![Six-panel forecast of sea-surface salinity across the domain at 24-hour intervals from +0h to +120h](/img/portfolio/nyb-forecast/sss_snapshots.png)
*Sea-surface salinity over the same 5-day forecast window.*

![Time series of surface current speed and direction, wind speed and direction, sea-surface temperature, and sea-surface salinity at a mid-shelf point forecast location](/img/portfolio/nyb-forecast/point_timeseries.png)
*Point forecast time series at a mid-shelf location — currents, wind, temperature, and salinity through the forecast window.*

![Modeled versus observed water level at NOAA CO-OPS tide gauges Sandy Hook, NJ and Montauk, NY, with skill statistics](/img/portfolio/nyb-forecast/validation_zeta_timeseries.png)
*Daily skill check — modeled water level against NOAA CO-OPS tide gauge observations at Sandy Hook, NJ and Montauk, NY.*

![Modeled versus observed eastward surface current component at an NDBC buoy at Barnegat, NJ, with skill statistics](/img/portfolio/nyb-forecast/validation_cur_u_timeseries.png)
*Daily skill check — modeled surface current (eastward component) against an NDBC buoy at Barnegat, NJ: R = 0.88, RMSE = 0.11 m/s.*

![Modeled versus observed northward surface current component at an NDBC buoy at Barnegat, NJ, with skill statistics](/img/portfolio/nyb-forecast/validation_cur_v_timeseries.png)
*Daily skill check — modeled surface current (northward component), same station: R = 0.89, RMSE = 0.15 m/s.*

![Modeled versus observed sea-surface temperature at five NDBC and NOAA CO-OPS stations, with skill statistics](/img/portfolio/nyb-forecast/validation_sst_timeseries.png)
*Daily skill check — modeled sea-surface temperature against five NDBC/CO-OPS stations. Correlation ranges from 0.12 to 0.65 — noticeably weaker than the water-level and current skill, and an area tracked for ongoing improvement.*

No wave forecasting is included in this system — ROMS runs circulation only, without a coupled wave model.
