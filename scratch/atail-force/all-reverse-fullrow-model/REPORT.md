# Deformable all-reverse full-row realizability probe

Date: 2026-07-17

Status: **UNKNOWN / NO NUMERIC HIT.  THIS IS NOT UNSAT.**

## Question and faithful local encoding

This lane tests the period-three all-reverse exact-five leaf after correcting
the earlier pinned-core limitation.  The coordinates of the physical cap are
deformable.  Similarity and rotation fix

```text
o = (0,0),  left = (1,0).
```

`right`, `q0`, `q1`, and `q2` are parameterized on the same unit circle about
`o`.  The endpoint angle is strictly below `pi/2`, so the Moser triangle
`(o,left,right)` is nonobtuse.  Its exact circumcenter and circumradius are
computed, and every point is required to lie in that disk.

The blocker centers are fully deformable along the exact perpendicular-
bisector lines:

```text
c0 bisects q0,q1;
c1 bisects q1,q2;
c2 bisects q2,q0.
```

Their radial coordinates vary from the strict physical-cap chord boundary to
the MEC disk boundary.  For each blocker, two targets range over its exact
source radius circle.  A complete candidate must have:

- all six targets distinct and on the side of the endpoint chord opposite
  the physical cap;
- all 15 named points distinct and strict vertices of one convex hull;
- the exact `2+2` row split (the named adjacent source pair and the named
  outside target pair), with every other named point excluded from that
  radius class;
- exact physical `o`-class equalities for the two endpoints and three
  sources, with every blocker and outside target excluded;
- MEC containment and the nonobtuse Moser triangle; and
- therefore distinct/injective outside pairs (the initial six-distinct
  branch requested for this probe).

All equidistance equations are true by parameterization and are independently
substituted again before a candidate may be reported.  The search varies the
source angles and all three blocker radial coordinates, so it does not freeze
or silently repair the existing directed-cycle core.

## Theorem-bank preflight

The parent lane completed the `AGENTS.md` preflight before dispatch.  This
probe records that it is downstream of searches of the four required
certificate-bank registries and indexed Lean.  The closest consumers remain
`outsidePair_unique_capCenter`, the U5 named-incidence terminals, and the
existing exact-five reverse-row reductions; none is imported or rederived
here.

## Bounded replay

```bash
UV_CACHE_DIR=/tmp/p97-uv-cache uv run \
  scratch/atail-force/all-reverse-fullrow-model/search_deformable_fullrow.py \
  --cores 30000 --angles 720 --seed 20260717
```

The bounded run returned:

```json
{
  "angles_per_row": 720,
  "best_min_single_target_extensions": 0,
  "best_single_target_counts_by_row": [0, 0, 0],
  "coverage_complete": false,
  "sampled_cores": 30000,
  "strict_convex_cores": 85,
  "status": "UNKNOWN_NO_HIT"
}
```

The strongest empirical signal is earlier than the six-target conjunction:
among the sampled strict-convex deformable cores, no sampled point on any one
blocker circle was simultaneously on the outside-cap side, inside the Moser
disk, and a new strict hull vertex.  This agrees with the old pinned-core
negative result, but now survives deformation of the source angles and all
three blocker radii.

## Post-audit correction: one-target no-hit was a sampling artifact

The subsequent exact audits refute both the one-row interpretation and the
stronger full-cycle-core interpretation of this run.  The projected audit
gives a rational eight-point one-target model.  More decisively,
`scratch/atail-force/one-row-extension-countermodel/` gives a rational ten-
point strict-convex model retaining all three co-radial sources and all three
cap-straddling blockers together with one outside-cap target inside the
nonobtuse Moser circumdisk.  The zero-extension counts above were therefore a
sampling artifact at one-target strength.

`scratch/atail-force/cycle-one-target-kalmanson/` subsequently adds that second
target exactly.  Its rational eleven-point model preserves the unchanged
period-three core, strict convexity, the nonobtuse Moser disk, cap placement,
and the exact named class `{q0,q1,x,y}` at `c0`.  One complete row is also
realizable.  The smallest local question not refuted by these models is
simultaneous completion of the remaining `c1` and `c2` rows.

## Epistemic boundary and next use

The run is finite angular sampling over a restricted random box, not interval
coverage, CAD, or a Positivstellensatz certificate.  It does not prove even
the one-row extension impossible, and it does not prove the all-reverse leaf
false.  The only correct verdict is `UNKNOWN_NO_HIT`.

The remaining sampled signal concerns all three complete rows rather than one
local row:

> Can the complete period-three co-radial source/cap-straddling-blocker cycle
> carry two distinct outside-cap equal-radius targets for every blocker while
> all points remain convex-hull vertices in the nonobtuse Moser/MEC packet?

Even a proof of that statement closes only the period-three local surface;
periods four and five remain.  The next decisive computational step is an
exact audit of simultaneous three-row completion.  Until such coverage exists,
this artifact is only a regression and route-narrowing result.

No Lean/Lake build was run.  No production, documentation, blueprint,
`ShellCurvature`, `surplusM44`, card-five, or protected 555/654 file was
modified.
