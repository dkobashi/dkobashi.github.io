---
title: "Regional and Coastal Wave Modeling (SWAN; WW3)"
date: 2026-01-01
description: "High-resolution wave models that predict wave transformation in offshore and nearshore water. A workflow of wave models based on Python have been developed. Offshore waves can be Wave Watch III or SWAN, which nests nearshore water, which is based on SWAN (structured or unstructured)."
tags: []
link: ""
image: "/img/products/regional-coastal-wave-modeling.jpg"
weight: 30
---

## Description ##
A nested wave-modeling workflow that carries waves from deep water to the shoreline. Offshore and regional wave fields come from WaveWatch III (WW3) or SWAN, and a higher-resolution nearshore SWAN domain, on a structured or unstructured mesh, is nested inside to propagate those waves across the shelf and into shallow water, where refraction, shoaling, and depth-induced breaking reshape wave height, period, and direction. A Python-based workflow handles setting up and running the nested domains.

Standalone wave runs like this are the right tool when a project needs wave fields on their own, without a coupled circulation model. For coupled wave and storm-surge simulations, see [Hurricane Wave and Storm Surge Modeling](/products/modeling-products/hurricane-wave-storm-surge-modeling/).


## Examples ##
- [Wave Model Grid Comparison: Hurricane Harvey (WW3 to SWAN, Structured vs. Unstructured)](/portfolio/independent-projects/harvey-ww3-swan-grid-intercomparison/)

*Thumbnail: Breaking ocean wave — public domain (NOAA), via Wikimedia Commons.*
