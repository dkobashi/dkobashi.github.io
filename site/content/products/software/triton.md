---
title: "TRITON (TRIangular mesh Tool for Ocean Numerical models)"
date: 2026-01-01
description: "TRITON, a graphical tool for generating and QA/QC-ing unstructured triangular meshes for ocean numerical models such as SCHISM, ADCIRC, Delft3D-FM, SWAN and WW3, without scripting the underlying workflow."
tags: []
link: ""
image: "/img/products/TRITON-GUI.png"
weight: 20
aliases:
  - /products/software/ocsmesh-gui/
---

TRITON is a graphical tool for building, refining, and QA/QC'ing unstructured triangular meshes for ocean numerical models (SCHISM, ADCIRC, Delft3D-FM, SWAN, WW3), interactively — setting resolution criteria, previewing mesh quality, and iterating without hand-writing scripts each time.

> TRITON is built on [OCSmesh](https://github.com/noaa-ocs-modeling/OCSMesh), an open-source mesh-generation library developed by the NOAA Office of Coastal Survey (OCS). I am not affiliated with NOAA or the Office of Coastal Survey, and TRITON is not endorsed by them.

## What TRITON is
I build GUI tooling around specialized scientific libraries when a team needs something faster than hand-scripting, without the cost or overhead of a full commercial package. TRITON is one example: a graphical interface over OCSmesh, a mesh-generation tool built primarily for the [SCHISM](https://github.com/schism-dev/schism) model. It's not as comprehensive as SMS (Surface Modeling System), but the goal is to create unstructured triangular mesh grids quickly.

## What TRITON does
TRITON can create mesh grids for SCHISM, and also for other modeling systems such as ADCIRC, Delft3D-FM, SWAN and WW3. SCHISM and Delft3D-FM can use quadrilateral as well as triangular meshes, but TRITON is only for triangular mesh grids for now. It makes most of OCSmesh's built-in functions easier to use: it creates triangular meshes, applies refinements, generates open boundaries, and checks and modifies mesh quality. TRITON can use various shapes of open boundaries, e.g. arcs or rectangles, and has a built-in mesh quality tool based on [NiceGrid2](https://adcirc.org/home/related-software/adcirc-utility-programs/).

## Example grids created by TRITON
- [SCHISM-WWM and ADCIRC-SWAN for Hurricane Harvey](/portfolio/independent-projects/wave-surge-model-intercomparison/)
- [SCHISM-WWM for Hurricane Ike](/portfolio/independent-projects/hurricane-ike-schism-wwm-nested-validation/)

## Screenshots
![TRITON](/img/products/TRITON-GUI.png)
