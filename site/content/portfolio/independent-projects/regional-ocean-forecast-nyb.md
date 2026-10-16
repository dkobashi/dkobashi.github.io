---
title: "Regional Ocean Forecast for New York Bight (Prototype)"
date: 2026-01-01
description: "A prototype ROMS regional ocean forecast system for the New York Bight, run on a local workstation, producing 5-day forecasts of surface currents, water level, temperature, and salinity, with skill checked against NOAA CO-OPS and NDBC observations."
challenge: "Operating a forecast system is a different test than building the model itself. Each forecast cycle — forcing data ingestion, model execution, quality checks, and report generation — has to run reliably end to end, and the forecasts have to be checked against what the ocean actually did, not just judged as plausible-looking."
approach: "Run a ROMS configuration for the New York Bight (Long Island Sound through the New York/New Jersey shelf) on a rolling 5-day forecast cycle, ingesting atmospheric forcing and open-boundary/tidal conditions to generate forecasts of surface currents, water level, temperature, and salinity, and checking each cycle's water-level forecast against NOAA CO-OPS tide gauge observations at Sandy Hook, NJ and Montauk, NY."
result: "In this prototype, water-level forecasts track the CO-OPS tide gauge record closely — correlation of 0.95 at Sandy Hook and 0.87 at Montauk — with somewhat weaker current skill (R of 0.76 against an NDBC buoy at Barnegat, NJ), more mixed sea-surface temperature skill (R of 0.42-0.79 across five stations), and 10 m wind skill (R of 0.64-0.92 across three stations), all tracked in the report below."
tags: ["ROMS", "operational forecasting", "New York Bight"]
link: ""
image: "/img/portfolio/nyb-forecast/cur_speed_snapshots.png"
weight: 5
---

Same underlying capability as the [Regional Ocean Forecast System (ROMS)](/products/modeling-products/regional-forecast-system-roms/) product, now configured for the New York Bight and run independently as a self-directed prototype on a local workstation.

## Forecast Report

Each forecast cycle runs a 5-day forecast on a curvilinear ROMS grid (200×85 rho points) spanning Long Island Sound through the New York/New Jersey shelf, and compiles the results into a report covering:

![NYB ROMS grid, 200 by 85 rho points, spanning Long Island Sound through the New York/New Jersey shelf, with station output locations marked](/img/portfolio/nyb-forecast/grid_mesh.png)
*Model domain and grid — the curvilinear ROMS mesh used for the forecast, with output station locations marked.*

![Six-panel forecast of surface current speed and direction across the domain at 24-hour intervals from +0h to +120h](/img/portfolio/nyb-forecast/cur_speed_snapshots.png)
*Surface current speed and direction, forecast out to 120 hours (5 days) in 24-hour steps.*

![Six-panel forecast of sea-surface temperature across the domain at 24-hour intervals from +0h to +120h](/img/portfolio/nyb-forecast/sst_snapshots.png)
*Sea-surface temperature over the same 5-day forecast window.*

![Six-panel forecast of sea-surface salinity across the domain at 24-hour intervals from +0h to +120h](/img/portfolio/nyb-forecast/sss_snapshots.png)
*Sea-surface salinity over the same 5-day forecast window.*

![Six-panel forecast of 10 m wind speed and direction across the domain at 24-hour intervals from +0h to +120h](/img/portfolio/nyb-forecast/wind_speed_snapshots.png)
*10 m wind speed and direction (GFS forcing) over the same 5-day forecast window.*

![Time series of surface current speed and direction, wind speed and direction, sea-surface temperature, and sea-surface salinity at a mid-shelf point forecast location](/img/portfolio/nyb-forecast/point_timeseries.png)
*Point forecast time series at a mid-shelf location — currents, wind, temperature, and salinity through the forecast window.*

![Modeled versus observed water level at NOAA CO-OPS tide gauges Sandy Hook, NJ and Montauk, NY, with skill statistics](/img/portfolio/nyb-forecast/validation_zeta_timeseries.png)
*Skill check — modeled water level against NOAA CO-OPS tide gauge observations at Sandy Hook, NJ and Montauk, NY.*

![Modeled versus observed eastward surface current component at an NDBC buoy at Barnegat, NJ, with skill statistics](/img/portfolio/nyb-forecast/validation_cur_u_timeseries.png)
*Skill check — modeled surface current (eastward component) against an NDBC buoy at Barnegat, NJ: R = 0.76, RMSE = 0.09 m/s.*

![Modeled versus observed northward surface current component at an NDBC buoy at Barnegat, NJ, with skill statistics](/img/portfolio/nyb-forecast/validation_cur_v_timeseries.png)
*Skill check — modeled surface current (northward component), same station: R = 0.76, RMSE = 0.09 m/s.*

![Modeled versus observed sea-surface temperature at five NDBC and NOAA CO-OPS stations, with skill statistics](/img/portfolio/nyb-forecast/validation_sst_timeseries.png)
*Skill check — modeled sea-surface temperature against five NDBC/CO-OPS stations. Correlation ranges from 0.42 to 0.79 — weaker than the water-level skill, and an area tracked for ongoing improvement.*

![Modeled versus observed eastward 10 m wind component at three NDBC and NOAA CO-OPS stations, with skill statistics](/img/portfolio/nyb-forecast/validation_wind_u_timeseries.png)
*Skill check — modeled 10 m wind (eastward component, GFS forcing) against three NDBC/CO-OPS stations. Correlation ranges from 0.83 to 0.92.*

![Modeled versus observed northward 10 m wind component at three NDBC and NOAA CO-OPS stations, with skill statistics](/img/portfolio/nyb-forecast/validation_wind_v_timeseries.png)
*Skill check — modeled 10 m wind (northward component), same stations. Correlation ranges from 0.64 to 0.89 — weakest at the New York Harbor Entrance buoy, strongest at Sandy Hook and Montauk.*

No wave forecasting is included in this system — ROMS runs circulation only, without a coupled wave model.
