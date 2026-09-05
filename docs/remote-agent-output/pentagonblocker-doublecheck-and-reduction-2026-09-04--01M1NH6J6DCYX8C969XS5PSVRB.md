# PentagonBlocker deleted-branch double-check and reduction checkpoint

**Project:** Erdős 97–96 formalization  
**Date:** 2026-09-04  
**Primary target:**  
`Problem97.ATailFrontierLiveClosure.false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonBlockerDeleted`

**Current target status:** still open (`sorry`).  
**Purpose of this checkpoint:** record the independently rechecked facts, the source-clean Lean reductions already landed, the exact boundary of the local geometry, and the next refactor target.

---

## 1. Corrected conclusion of the double-check

The tempting equality

```text
dist deleted xv = dist deleted xu
```

is not merely unavailable. The live target hypotheses prove its negation.

Let `Kxv` be the selected four-shell at source `xv`. The target provides:

- `centerAt xv = deleted`;
- `xv ∈ Kxv.support`;
- every physical-class point in `Kxv.support` is either `xv` or `u`;
- `xu` is a physical-class point distinct from both `xv` and `u`.

Hence `xu ∉ Kxv.support`. If the displayed distance equality held, then
`Kxv.q_mem_support`, the center rewrite, `hxuA`, and
`CriticalFourShell.support_eq` would put `xu` back in `Kxv.support`, a
contradiction.

This reasoning was independently source-audited three times before
formalization.

---

## 2. Landed source-clean Lean reductions

The following declarations were added to
`lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/Rigid221SourceHeavy.lean`:

1. `exactFourRigid221_sourceHeavy_pentagon_deleted_dist_ne_xv_xu`
2. `exactFourRigid221_sourceHeavy_pentagon_v_center_ne_deleted`
3. `exactFourRigid221_sourceHeavy_pentagon_v_center_class_reduction`

The focused Lean check passed. The new declarations print only:

```text
propext
Classical.choice
Quot.sound
```

No new `sorry`, `admit`, `axiom`, `native_decide`, or `unsafe` marker occurs
in the new region.

The associated repository checkpoint is in commit ancestry through
`30393754d` / `c9786aefc`.

These lemmas establish, in particular:

- `dist deleted xv ≠ dist deleted xu`;
- `centerAt v ≠ deleted`;
- if `centerAt v` lies in the five-point physical class, it is one of the
  sharply enumerated surviving named roles, with the corresponding
  strict-second-cap localization.

The main `False` theorem is not closed by these three reductions.

---

## 3. Exact four-point order already follows from source

The deleted branch source-entitles the strict second-cap order

```text
u < deleted < xv < xu
```

or its reflection.

The proof uses:

- `dist xv u = dist xv xu`, from the source `u` row and `centerAt u = xv`;
- `dist deleted u = dist deleted xv`, from the `xv` row and
  `centerAt xv = deleted`;
- strict-cap membership of `u`, `deleted`, `xv`, and `xu`;
- two applications of
  `CGN.index_strictly_between_of_equidistant`;
- a finite `omega` combination of the two betweenness disjunctions.

A direct source-clean adapter is being formalized. It deliberately makes no
claim about the position of `v`, which is not initially known to be in the
strict second cap.

---

## 4. Rejected consumer routes

### 4.1 Three-point equal-distance cap terminal

`false_of_capInterior_center_equidistant_three_points` cannot be used:
its missing equality is contradicted by the live row trace, as proved above.

### 4.2 Later V-row circle-wedge theorem

The source-clean theorem

```text
false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_
  pentagonBlockerV_vRowCircleWedge
```

takes an `ExactFourRigid221PentagonBlockerVResidual` whose essential field is

```text
centerAt xv = v.
```

The current branch assumes

```text
centerAt xv = deleted,
```

and `deleted ≠ v`. The packet is therefore definitionally and logically
incompatible. Neither the early leaf nor its sole live caller can bypass
through that theorem.

### 4.3 Existing A3/A4 clearance consumers

Up to relabeling, the imported A3/A4 consumers require equality graphs of
the forms

```text
A3: v:{u,x}, d:{v,x}, c:{v,d}
A4: x:{u,y}, v:{u,x}, c:{v,x}.
```

The deleted branch currently has

```text
xv:{u,xu}
deleted:{xv,u}
cx:{xu,deleted}
cd:{deleted,v}
cv:{v,xv}.
```

No three-edge subgraph matches an imported A3/A4 terminal. Every match needs
one additional selected-row equality, and the most obvious V-row completion
is precisely the incompatible sibling condition `centerAt xv = v`.

---

## 5. Current structural reduction

Write

```text
cx = centerAt xu
cd = centerAt deleted
cv = centerAt v
C  = SelectedClass A oppApex2 rho
I  = strict interior of the second opposite cap.
```

Source auditing gives the following class reductions:

```text
cx ∈ C -> cx = u or cx = v
cd ∈ C -> cd = u or cd = xu
cv ∈ C -> cv = u or cv = xu.
```

The `cx = u` arm is excluded by the checked ordered-cap
three-betweenness-cycle theorem. Thus:

```text
cx ∈ C -> cx = v.
```

If all three unnamed centers are in `C`, pairwise center distinctness leaves
only two finite assignments. Both contradict the strict-cap betweenness
relations: every one of the five physical-class roles becomes the strict
middle point of one of the five row chords, which is impossible for the
least cap index.

Consequently the intended next source-clean output is a tagged disjunction:

```text
cx ∉ C, with cx ∈ I and row pair {xu, deleted}
or
cd ∉ C, with cd ∈ I and row pair {deleted, v}
or
cv ∉ C, with cv ∈ I and row pair {v, xv}.
```

The exact order adapter, `cx` sharpening, and this tagged residual are in the
active Luna formalization lane.

No current theorem accepts this exact three-way residual.

---

## 6. Authenticated named-metric-core computation

The governed run

```text
scratch/runs/pentagon-blocker-deleted-named-metric-core-20260904/run-0001/
```

returned `SAT_BOTH_ORIENTATIONS` for the reduced named metric core.

It includes:

- the five distinct physical-circle points;
- the two pinned blockers;
- all five directed pair equalities;
- all 15 physical trace exclusions;
- a six-point convex separator;
- the direct/reflected four-point order.

It intentionally omits the anonymous support completions, global K4,
minimality, MEC/surplus-cap realization, robust-surface data, and Lean
ingress.

Recorded hashes before the metadata-only correction:

```text
query SHA-256:
5ff842d6cf600c63a8eb07bbea6a18b2d2acb0d86f439b9a628392de73f0f998

result-file SHA-256:
0faf3378cf903207b6a075c18c6e1cdb7c7d8e0c28448cb615d531fb21c95d86

semantic self-hash:
e57756d504517cd5b723d6ac505b33d38e032ccb9bbccaefd70f7fc7468c18ff
```

An independent audit replayed both 52-condition exact witnesses. It found one
metadata typo only: the negative-control certificate wrote
`8c^3 - 6c - 1 = 0`, while both the SMT and replay correctly used
`8c^3 - 6c + 1 = 0`. The metadata correction and hash refresh were requested.

This computation is a boundary result, not a countermodel to the Lean leaf.

---

## 7. Exact rational local positive control with five complete rows

A stronger positive control was constructed with exact rational arithmetic.

Define

```text
circle(t) = ((1 - t^2)/(1 + t^2), 2t/(1 + t^2))
double(t) = 2t/(1 - t^2).
```

Physical-circle points:

```text
O       = (0, 0)
u       = (1, 0)
deleted = circle(13/35)
        = (528/697, 455/697)
xv      = circle(double(13/35))
        = (71759/485809, 480480/485809)
xu      = circle(double(double(13/35)))
        = (-225711676319/236010384481,
            68957528640/236010384481)
v       = circle(73/2)
        = (-5325/5333, 292/5333).
```

Unnamed row centers:

```text
cx = (567/500) * (deleted + xu)
cd = (757/500) * (deleted + v)
cv = (373/500) * (v + xv).
```

Thus each center lies on the perpendicular bisector of its prescribed
physical pair, but none is the pair midpoint. All three are off the physical
circle and are strict hull vertices.

For each row circle, start with the first named endpoint and apply a rational
rotation

```text
rot(t) = ((1 - t^2)/(1 + t^2), 2t/(1 + t^2))
```

to the endpoint-minus-center vector. Use these two parameters per row:

```text
xu row:      3/10,      87/200
deleted row: -263/200, -259/200
v row:       -1/200,     1/200
u row:       -3/200,    -1/200
xv row:      251/200,   56/25.
```

This creates ten additional rational points. The 19 points are distinct,
strictly convex, and have hull order

```text
dE1, dE2, vE1, v, vE2, xuE1, xuE2, O,
xvE1, xvE2, uE1, uE2, u, deleted, xv, cx, cd, cv, xu.
```

Each selected row has exactly four specified support points, and its
intersection with the five-point physical class is exactly:

```text
u row:       {u, xu}
xu row:      {xu, deleted}
deleted row: {deleted, v}
v row:       {v, xv}
xv row:      {xv, u}.
```

### Exact cap-block extension

Insert two rational outward hull vertices:

```text
eL =
(7437368867/7474171465,
 -12814557/2989668586)

eR =
(-6960246266714286049611399/6870241959947286961850000,
  1356109900731583774256559/6870241959947286961850000).
```

All 21 points remain strict hull vertices. The consecutive block

```text
{eL, u, deleted, xv, cx, cd, cv, xu, eR}
```

has cardinality nine. Its strict interior contains
`u, deleted, xv, cx, cd, cv, xu`, while `v` lies outside.

The five row intersections with that block have sizes at most two:

```text
u row:       {u, xu}
xu row:      {xu, deleted}
deleted row: {deleted}
v row:       {xv}
xv row:      {xv, u}.
```

An exact `Fraction` checker verifies:

- 21 pairwise-distinct points;
- all 21 points occur in the strict convex-hull cycle;
- positive consecutive determinants;
- all five physical points have squared norm one;
- `cx`, `cd`, and `cv` have squared norm different from one;
- every row has four distinct equidistant support points;
- every physical trace is exactly the prescribed pair;
- no row center lies in its own support;
- the displayed cap block and row-cap intersection counts.

Canonical serialization SHA-256:

```text
e01d9bb494846c26f2f6e38976c05a5c8cb0c42a77c6b9d0551df337de528d85
```

### Scope of the positive control

This is an exact local realization of:

- strict convexity;
- the physical five-cycle;
- all five complete card-four local rows;
- both pinned blockers;
- all physical trace omissions;
- the relevant consecutive cap block and local at-most-two cap-hit bounds.

It does **not** construct:

- a `CounterexampleData`;
- global K4 everywhere;
- minimality;
- the exact `SurplusCapPacket`/MEC triangle;
- robust-surface and deletion provenance;
- selected-row compatibility for every other carrier source.

Therefore it refutes geometry-only terminal proposals but does not refute the
live theorem.

---

## 8. Historical exact-12-or-three-center split

The historical source-clean scratch theorem was:

```text
pentagonOffClass_exactTwelveSecondOpposite_or_threeCenterDeletion_probe
```

The current source-backed replacement is:

```text
pentagonOffClassBlocker_threeCenterDeletion_or_card_eq_twelve.
```

It produces

```text
card A = 12
or
(card A >= 13 and a three-center common-deletion configuration).
```

It is source-clean, but it is specialized to the blocker of the `xv` row.
It cannot be applied by relabeling to `cx`, `cd`, or `cv`.

The exact-card and three-center downstream `False` consumers are currently
`sorryAx`-dependent. Thus the historical split is useful architecture but
not closure.

The next refactor audit is testing whether the counting/deletion proof can be
factored generically for an arbitrary selected row with a known physical
pair, then instantiated for the three tagged off-class centers above.

---

## 9. Next proof architecture

The recommended next architecture is now evidence-driven:

1. Land the exact four-point cap-order adapter and tagged off-class
   strict-cap row-center disjunction.
2. Do **not** add another local Kalmanson/circle terminal: the exact 21-point
   control satisfies that entire local layer.
3. Factor the source-clean part of the historical
   exact-12-or-three-center proof into a generic selected-row continuation,
   if its actual proof dependencies permit this.
4. Preserve the tag identifying which row produced the off-class center.
5. Dispatch:
   - the exact-12 arm to the existing exact-12 campaign;
   - the common-deletion arm to a neutral three-center/two-deletion packet.
6. Measure success by publication-root `sorryAx` reachability. A new packet
   without a checked consumer is not closure.

The first genuinely missing mathematics now lies in global K4/minimality or
deletion continuation—not in the five-point circle geometry.
