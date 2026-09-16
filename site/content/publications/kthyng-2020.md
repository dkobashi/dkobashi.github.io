---
title: "Performance of offline passive tracer advection in ROMS (v3.6, revision 904)"
date: 2020-12-01
pubtype: "Journal Article"
description: "Thyng, K., Kobashi, D., Ruiz-Xomchuk, V., Qu, L., Chen, X., Hetland, R. — Geoscientific Model Development"
tags: []
link: "https://doi.org/10.5194/gmd-2020-221"
image: ""
weight: 10
---

**Authors:** Kristen Thyng, Daijiro Kobashi, Veronica Ruiz-Xomchuk, Lixin Qu, Xu Chen, Robert Hetland

**Published in:** Geoscientific Model Development (2020)

**Abstract**\
Offline advection schemes allow for low-computational-cost simulations using existing model output. This study presents the approach and assessment for passive offline tracer advection within the Regional Ocean Modeling System (ROMS). An advantage of running the code within ROMS itself is consistency in the numerics on- and offline. We find that the offline tracer model is robust: after about 14 d of simulation (almost 60 units of time normalized by the advection timescale), the skill score comparing offline output to the online simulation using the TS_U3HADVECTION and TS_C4VADVECTION (third-order upstream horizontal advection and fourth-order centered vertical advection) tracer advection schemes is 99.6% accurate for an offline time step 20 times larger than the online time step as well as online output saved with a period below the advection timescale. For the MPDATA tracer advection scheme, accuracy is more variable with the offline time step and forcing input frequency choices, but it is still over 99 % for many reasonable choices. Both schemes are conservative. Important factors for maintaining high offline accuracy are outputting from the online simulation often enough to resolve the advection timescale, forcing offline using realistic vertical salinity diffusivity values from the online simulation, and using double precision to save results.
