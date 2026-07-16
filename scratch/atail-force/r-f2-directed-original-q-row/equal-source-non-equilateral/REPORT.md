# Equal-source non-equilateral corrected normal form

Date: 2026-07-16

Status: **KERNEL CHECKED.  THE CURRENT REPOSITORY ALREADY CONTAINS AN
IMPORT-REACHABLE SINK FOR THE THREE-EQUALITY STRICT-WITNESS COMPLETION.  NO
`f = p` ROLE MAP NEEDS FEWER THAN THREE UNPRODUCED EQUALITIES.**

## Scope and route correction

This lane starts after the independently checked correction in
`strict-oppcap1-hit-producer/`:

- the two native supports intersect exactly in `{p}`;
- `p` lies in `oppCap2`; and
- therefore `StrictOppCap1CommonHit` is false, not a realizable intermediate
  producer target.

Those results are imported and not duplicated here.  The honest residual is
the existing support/geometry split:

```text
one native row is surplus-heavy
or
there are exclusive strict-oppCap1 witnesses x,y carrying
StrictWitnessMetricHinge.
```

The first arm still has no terminal.  This report concerns only the exact
bank boundary of the second arm.

## Current-repository sink

The sibling theorem `u1TwoLargeCapObstruction` is not import-reachable in
this worktree.  Its local hypothesis structure is nevertheless already
terminal through the production theorem

```lean
Problem97.u5_equilateral_opposite_point_metric_incompatibility
```

The new checked adapter is:

```lean
false_of_u1TwoLargeCapHypotheses_currentKernel
    (H : U1TwoLargeCapHypotheses a c d e f) : False
```

It uses the U5 roles

```text
(p,a,b,c,x) = (c,f,d,a,e),   r = dist c d.
```

Thus no sibling import or reimplementation of its coordinate proof is
needed.  This is a reachability correction, not a reduction in producer
fields.

## Exact `f = p` interface

For the natural strict-witness roles

```text
(a,c,d,e,f) = (x,z1,z2,y,p),
```

the two native rows and their common point `p` automatically supply the first
four circle equalities.  The new proposition

```lean
LiveCenterReverseEqualities p x z1 z2 y
```

contains exactly:

```text
dist p x = dist p z2
dist p x = dist p y
dist y x = dist y z1.
```

The checked equivalence

```lean
liveCenterReverseEqualities_iff_u1TwoLargeCapHypotheses
```

shows that, on this fixed role map, these are precisely the fields missing
from the complete five-point hypothesis packet.  The checked theorem

```lean
false_of_equalSource_strictWitness_reverseEqualities
```

then sends those fields directly to the current U5 kernel and `False`.

No retained parent theorem produces any of the three equalities.

## Exhaustive fixed-`f` role audit

`check_f_eq_p_role_maps.py` enumerates all `24` bijections from
`{x,z1,z2,y}` to `{a,c,d,e}`, with `f = p`.  It treats the five already-known
chord edges

```text
p-z1, p-z2, z1-z2, x-z1, y-z2
```

as equal, and the two hinge exclusions

```text
x-z2 != chord, y-z1 != chord
```

as certified inequalities.

The result is:

```text
all role maps: 24
not immediately contradicted: 4
minimum missing equalities: 3
```

Exactly two maps attain three: the natural map above and its `x/y`, `z1/z2`
reflection.  The other two non-contradicted maps need five equalities; the
remaining twenty conflict with a certified hinge inequality.

This is exhaustive only for fixed `f = p` bijective role maps in the symbolic
equality graph.  It is not a proof that no different Euclidean argument can
close the branch from fewer hypotheses.

## Bank preflight

The required general-n registries and the sibling, legacy, and older-worktree
JSON inventories were checked.  Focused `nthdegree docs search --lean`
queries covered the five-point obstruction, equal-radius rows with a unique
common point, equilateral-apex metric incompatibilities, and strict opposite
cap geometry.

The closest current hits were the four production equilateral U5 metric
kernels.  `u5_equilateral_opposite_point_metric_incompatibility` matches the
natural role map exactly, but still consumes all three displayed reverse
equalities.  No indexed current or banked consumer matched this surface with
fewer than three new equality fields.

## Remaining mathematics

The corrected non-equilateral work is now:

1. eliminate a surplus-heavy native row; or
2. on the strict-witness arm, produce the three reverse equalities above, or
   prove a direct contradiction from strictly weaker geometric input.

Mining a strict-`oppCap1` common support point is invalid on this branch, and
changing the fixed `f = p` role assignment does not improve the three-field
deficit.

## Validation

`EqualSourceNonEquilateral.lean` was checked directly with Lean 4.27.0 from
`lean/`, using the current scratch olean search path and emitting:

```text
/private/tmp/p97-r-f2-equal-source-non-equilateral-oleans/
  EqualSourceNonEquilateral.olean
```

All three printed declarations depend only on:

```text
propext
Classical.choice
Quot.sound
```

The owned Lean file contains no `sorry`, `admit`, declared axiom,
`native_decide`, or `unsafe`.  No full Lake build was run.

The role audit passes with:

```bash
UV_CACHE_DIR=/tmp/uv-cache uv run python \
  scratch/atail-force/r-f2-directed-original-q-row/\
equal-source-non-equilateral/check_f_eq_p_role_maps.py
```
