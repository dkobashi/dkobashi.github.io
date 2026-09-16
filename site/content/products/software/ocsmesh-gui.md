---
title: "OCSmesh GUI"
date: 2026-01-01
description: "A graphical interface for OCSmesh, streamlining the creation and QA/QC of unstructured coastal-ocean model meshes without requiring users to script the underlying workflow."
tags: []
link: ""
image: "/img/products/OCSmesh-GUI.png"
weight: 20
---

Wraps the OCSmesh mesh-generation library in a GUI so users can build, refine, and QA/QC unstructured meshes for coastal/ocean models (SCHISM, ADCIRC, etc.) interactively — setting resolution criteria, previewing mesh quality, and iterating without hand-writing scripts each time.

## What OCSmesh-GUI is
I build GUI tooling around specialized scientific libraries when a team needs something faster than hand-scripting, without the cost or overhead of a full commercial package. OCSmesh GUI is one example: a graphical interface over [OCSmesh](https://github.com/noaa-ocs-modeling/OCSMesh), a mesh-generation tool built primarily for the [SCHISM](https://github.com/schism-dev/schism) model. It's not as comprehensive as SMS (Surface Modeling System), but the goal is to create unstructured triangular mesh grids quickly.

## What OCSmesh-GUI does
OCSmesh GUI can create mesh grid for SCHISM, but it can also create mesh grids for other modeling systems such as ADCIRC and Delft3D-FM. SCHISM and Delft3D-FM can use quadlateral as well as triangular meshes, but OCSmesh GUI is only for triangular mesh grids for now. It can use most of OCSmesh built-in functions in an easier way. It creates triangular meshes, refinements, generate open boundaries, and checks mesh quality and modify. OCSmesh GUI can use various shape of open boundaries e.g. arcs, or rectangles. OCSmesh GUI has built-in mesh quality tool based on [NiceGrid2](https://adcirc.org/home/related-software/adcirc-utility-programs/).

## Example grids created by OCSmesh GUI
- [SCHISM-WWM and ADCIRC-SWAN for Hurricane Harvey](/portfolio/independent-projects/wave-surge-model-intercomparison/)
- [SCHISM-WWM for Hurricane Ike](http://localhost:1313/portfolio/independent-projects/hurricane-ike-schism-wwm-nested-validation/)

## Screenshots
![OCSmesh GUI](/img/products/OCSmesh-GUI.png)
