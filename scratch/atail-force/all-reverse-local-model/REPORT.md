# Pinned all-reverse full-row extension probe

Date: 2026-07-17

Status: **EMPIRICAL PINNED-CORE NEGATIVE; GENERAL EXTENSION UNKNOWN.**

The exact rational `DirectedCycleCountermodel` proves that the period-three
fixed-apex source circle and its three distinct cap-straddling bisector centers
are compatible with strict convexity, a nonobtuse Moser triangle, and its MEC
disk. This probe asks a narrower next question: with those nine coordinates
held fixed, can one add even one outside-physical-cap point on one blocker
circle while preserving all old vertices and the new point as vertices of the
convex hull?

`check_pinned_extension.py` deterministically samples 20,000 angles on each
of the three exact blocker circles. It keeps candidates on the side of the
physical-cap endpoint chord opposite the cap and inside the displayed MEC
disk, then checks whether all ten points remain hull vertices.

Replay:

```bash
UV_CACHE_DIR=/tmp/p97-uv-cache uv run \
  scratch/atail-force/all-reverse-local-model/check_pinned_extension.py
```

The recorded result is:

```text
c0:{q0,q1}: samples=20000 eligible=5424 full_hull_extensions=0
c1:{q1,q2}: samples=20000 eligible=5245 full_hull_extensions=0
c2:{q2,q0}: samples=20000 eligible=7241 full_hull_extensions=0
status=EMPIRICAL_PINNED_CORE_ONLY
not an exact UNSAT result; the core coordinates were not deformed
```

This is useful evidence that the existing countermodel does not immediately
extend to the required full critical rows. It is not an exact certificate,
does not deform the nine-point core, does not add two targets simultaneously,
and does not test period four or five. It therefore neither proves nor refutes
the full-parent all-reverse theorem. The current proof target remains direct
`False` using the full two-outside-target rows and global critical-map/parent
data; the fixed-anchor chord layer alone remains refuted by the exact model.

The required theorem-bank and indexed-Lean preflight was completed before this
local-pattern probe. No production, shared docs, generated blueprint,
`ShellCurvature`, `surplusM44`, card-five, or protected 555/654 file was
modified, and no Lean/Lake build was run.
