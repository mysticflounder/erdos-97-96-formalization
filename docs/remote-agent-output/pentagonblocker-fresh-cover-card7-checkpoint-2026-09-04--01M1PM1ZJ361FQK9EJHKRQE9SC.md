# PentagonBlocker fresh-survivor / five-row-cover / card-7 checkpoint

**Project:** Erdős 97–96 formalization  
**Date:** 2026-09-04  
**Primary open theorem:**

```lean
Problem97.ATailFrontierLiveClosure.
  false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonBlockerDeleted
```

The theorem remains open. This checkpoint records the strongest currently source-checked reduction, eliminates a circular shortcut, and isolates the remaining exact-cap-7 and finite-cover work.

## 1. Live notation

Write

```text
d  = jointDeletion.deleted
O  = S.oppApex2
cx = centerAt xu
cd = centerAt d
cv = centerAt v
C  = SelectedClass D.A O rho = {u,xu,d,v,xv}
```

The five canonical selected-four rows have physical-class traces

```text
Ku   @ xv : {u,xu}
Kxu  @ cx : {xu,d}
Kd   @ cd : {d,v}
Kv   @ cv : {v,xv}
Kxv  @ d  : {xv,u}
```

and the blocker-deleted branch has `centerAt xv = d`.

The target supplies `7 ≤ S.oppCap2.card`.

## 2. Circular `fiveCycle` shortcut rejected

The later theorem

```lean
false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_fiveCycle
```

cannot directly close the target. Its branch with no sixth strict-second-cap point calls the parent `pentagon` theorem; that theorem dispatches through the blocker-center split back to the same open blocker-deleted theorem. Consequently the declaration's axiom cone contains `sorryAx` despite its local body having no literal `sorry`.

Any useful reuse must extract only the present-sixth-point arm below that recursive call. An active audit is testing whether `8 ≤ S.oppCap2.card` makes this arm unconditional and source-clean, thereby reducing the primary theorem to exact `S.oppCap2.card = 7`.

## 3. Strong source-clean trichotomy from the full target

The full target hypotheses instantiate

```lean
ATailTwoPointRowFreshSurvivorOrSupportCover.
  two_point_row_fresh_survivor_or_support_cover
```

at source `xu`, endpoints `(xu,d)`, and row `Kxu`.

### Erase-`xu` named survivor quad

```text
{O, cv, d, cd}
```

All four centers survive deletion of `xu` and are pairwise distinct.

### Erase-`d` named survivor quad

```text
{O, xv, cv, d}
```

All four centers survive deletion of `d` and are pairwise distinct.

### Alias-to-cover transport

For any source `t ∈ D.A \ Kxu.support`, robust deletion at `O` rules out `beta(t)=O`: equality would contradict `no_qfree_at t`.

The remaining blocker aliases transport the source into one of the four other cycle rows through
`ATailSurvivalCover.selectedSupports_eq_of_actualBlockers_eq` and source membership:

```text
beta(t)=cv  -> t∈Kv.support
beta(t)=d   -> t∈Kxv.support
beta(t)=cd  -> t∈Kd.support
beta(t)=xv  -> t∈Ku.support.
```

Hence the source-clean conclusion is one of:

1. a source `t` outside `Kxu` whose blocker is fresh from `{O,cv,d,cd}`, with that blocker surviving erase `xu`;
2. a source `t` outside `Kxu` whose blocker is fresh from `{O,xv,cv,d}`, with that blocker surviving erase `d`;
3. the exact carrier cover

```text
D.A ⊆ Ku.support ∪ Kxu.support ∪ Kd.support ∪ Kv.support ∪ Kxv.support.
```

The rich fresh-source/blocker witness must be retained. Passing immediately to the existing `FiveSurvivorExactRowsBoundary` corollary loses the freshness field needed for distinct-center continuation.

## 4. Cardinality consequence of the cover arm

The four-row union

```text
Ku ∪ Kxv ∪ Kv ∪ Kd
```

has cardinality at most `13`: successive rows have the forced distinct overlap points `u`, `xv`, and `v`.

Adding `Kxu` contributes at most two new points because it contains the two distinct points `xu` and `d`, already lying in the cycle union. Therefore

```text
card (Ku ∪ Kxu ∪ Kd ∪ Kv ∪ Kxv) ≤ 15.
```

Together with the target cap bound and the cap-cardinality identity, the cover arm gives

```text
13 ≤ D.A.card ∧ D.A.card ≤ 15.
```

This is stronger and more source-faithful than the earlier arbitrary-pair reduction.

## 5. Fresh-survivor arms: exact downstream boundary

Each rich fresh arm gives five pairwise-distinct surviving centers: the relevant named survivor quad plus the fresh blocker. It therefore reaches source-cleanly:

```lean
ATailFirstFiberOverlapDescent.FiveCenterDeletionSurvival
ATailFiveCenterDeletionBoundary.fiveSurvivorExactRowsBoundary
ATailFiveCenterDeletionBoundary.exists_faithfulCarrierPattern_with_fiveSurvivorClasses
```

The next six-center constructor

```lean
ATailFirstFiberAcyclicFaithfulIngress.
  collisionFiveCenterDeletion_to_sixCenterAcyclicFaithfulResidual
```

still needs a separate collision/row witness and returns a disjunction rather than `False`.

The first clean contradiction consumer identified is

```lean
FirstFiberMetricCoreConsumer.false_of_firstFiberExactRows_metricCoreCoverage
```

but it requires an independent `MetricCoreAlternative`. No current source-clean producer from
`FiveSurvivorExactRowsBoundary`, `FaithfulCarrierPattern`, or the six-center residual supplies that alternative.

`MetricCoreAlternative` is a 22-way concrete occurrence/order package; the five-survivor data do not name the completion roles, their support positions, or the required orientations. Thus the fresh arms currently stop at a rich five-/six-center exact-row boundary, not a checked terminal.

## 6. New source-neutral affine obstruction

Commit `0d985145c` adds

```lean
Problem97.AffineNineHitCircleKernel.
  false_of_nine_selected_four_classes_affine_pattern
```

in `P97/ATail/AffineNineHitCircleKernel.lean`.

For five distinct carrier points `A,B,C,D,E`, it assumes:

```text
row at A contains B,C,D,E
row at C contains A,B,D
row at E contains A,D
```

and contradicts convex independence via the affine consequence `2A = B + E`.

The theorem is kernel-clean; its axiom set is exactly `propext`, `Classical.choice`, and `Quot.sound`. An occurrence audit is checking every blocker-deleted packet and the exact-cap-7 center-alias arms. No occurrence has yet been certified.

## 7. Completion-overlap profiles in the cover arm

Let the physical cycle be `p0,...,p4`, let `Ri` be the five card-four rows with

```text
Ri ∩ C = {pi,p(i+1)},
```

and let `Ei = Ri \ C`. Then every `Ei` has cardinality two,

```text
⋃ Ei = D.A \ C,
```

and the total completion incidence count is ten.

Up to the dihedral action on the row cycle, only thirteen completion-overlap profiles occur for cards 13–15.

### `D.A.card = 15`

The completion union has size ten; every completion has row-degree one. The five `Ei` are pairwise disjoint. **One profile.**

### `D.A.card = 14`

The completion union has size nine; exactly one completion has row-degree two. Up to dihedral symmetry:

```text
{0,1}  adjacent-row sharing
{0,2}  nonadjacent-row sharing.
```

**Two profiles.**

### `D.A.card = 13`

The completion union has size eight. Either one completion has degree three, or two completions have degree two.

Degree-three representatives:

```text
{0,1,2}
{0,1,3}.
```

Two-degree-two representatives:

```text
(01,02) (01,03) (01,04) (01,23)
(01,24) (02,02) (02,03) (02,13).
```

A parallel edge on an adjacent row pair is excluded: those rows already share their physical endpoint, and two additional shared completions would violate the two-circle intersection bound. A parallel nonadjacent pair `(02,02)` remains allowed.

Thus the five-row cover has only `1 + 2 + 10 = 13` completion-overlap types before center placement, blocker-fiber, cap, and order refinements. A governed census has been requested on exactly these types.

## 8. Exact-cap-7 geometric boundary

The source-clean theorem

```lean
pentagonBlockerDeleted_card_eq_seven_normal_form
```

reduces the no-sixth-point branch to exact `S.oppCap2.card = 7`, a five-point strict second-cap interior, the direct or reflected order of `u,d,xv,xu`, and `cx` outside the physical class.

The source-clean theorem

```lean
pentagonBlockerDeleted_v_center_dichotomy
```

reduces the remaining `v`-row center to

```text
cv = u ∨ cv = xu.
```

The exact complete field list is under a separate source audit. In particular, no conclusion about the complementary `cd` assignment should be assumed until that audit reports it.

### Pair-geometry negative controls

The three displayed bisector equalities and natural cyclic order are locally realizable in both `cv` branches.

Let

```text
P(t)=((1-t^2)/(1+t^2), 2t/(1+t^2))
u=P(0), d=P(1/10), xv=P(20/99), xu=P(3960/9401).
```

Then

```text
d(d,u)^2  = d(d,xv)^2  = 4/101
d(xv,u)^2 = d(xv,xu)^2 = 1600/10201.
```

For `cv=u`, take `v=P(-20/99)`. The order is

```text
v < u < d < xv < xu
```

and `d(u,v)^2=d(u,xv)^2`.

For `cv=xu`, take `v=P(580060/851499)`. The order is

```text
u < d < xv < xu < v
```

and `d(xu,v)^2=d(xu,xv)^2`.

All five cyclic turns are positive in both controls; the minimum turn is `80/10201`.

Therefore exact-cap-7 closure must use an additional source fact: the exact strict-interior set, completion-support restrictions, MEC/cap provenance, global K4, or deletion minimality. It cannot follow merely from the three visible chord-bisector equalities and cyclic order.

## 9. Current highest-leverage next steps

1. **Extract the noncircular cap-`≥8` arm** from `fiveCycle`. If successful, rewrite the main leaf as an exact-cap-7 problem.
2. **Transcribe the full exact-cap-7 packet** and identify which center/support fields are not represented by the rational pair controls.
3. **Run the thirteen-profile cover census** with source-fixed center aliases, strict cap placement, row exactness, and global-K4 consequences introduced in layers.
4. **Test the affine nine-hit kernel** against every exact-cap-7 and rich fresh-survivor row assignment.
5. Land a rich neutral reduction theorem only if its retained freshness/cover data has an immediate consumer; do not replace the main `sorry` by a lossy wrapper.

## 10. Trust boundary

Nothing in this checkpoint claims the blocker-deleted theorem is proved. The following are currently source-checked:

- the full-target fresh-survivor/five-row-cover trichotomy at the proof-plan level;
- the `13 ≤ card A ≤ 15` cover bound;
- the five-distinct-center continuation in each rich fresh branch;
- the affine nine-hit kernel itself;
- the circularity of the original `fiveCycle` shortcut;
- exact rational negative controls for the visible card-7 pair geometry.

Pending source audits/formalizations remain explicitly pending.
