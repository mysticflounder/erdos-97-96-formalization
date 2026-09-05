# Pentagon blocker-deleted reduction checkpoint — 2026-09-04 v2

## Live target

`Problem97.ATailFrontierLiveClosure.false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonBlockerDeleted`

Current audited source HEAD for the cap-seven normal form: `3a5bd8ea2915d26a309231c85b7965216edf6c78`.

This checkpoint records reductions only. The target remains an open `sorry`.

## 1. The tempting `fiveCycle` call is circular

The later theorem

`false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_fiveCycle`

accepts the first twelve target binders, but its no-sixth-point branch calls

`...fiveCycle -> ...pentagon -> ...pentagon_blockerCenterSplit -> ...pentagonBlockerDeleted`.

Both the later theorem and the live target therefore have `sorryAx` in their transitive axiom footprints. It cannot replace the target body or be moved downward without extracting a genuinely acyclic core.

## 2. Cap size at least eight does not activate the noncircular branch

The present-sixth branch of `fiveCycle` seeks a sixth member of

`C := SelectedClass D.A S.oppApex2 P.rho`

outside the five named physical points. The blocker-deleted target carries `hclassFive : C.card = 5`. Hence the present-sixth branch is impossible for every value of `S.oppCap2.card`; larger cap cardinality or larger `D.A.card` does not help.

The compatible `fiveCycle` branch is exactly the no-sixth exact-five branch, which is the circular branch above.

## 3. Full-target two-point fresh/support reduction

After importing `TwoPointRowFreshSurvivorOrSupportCover`, the generic theorem can be instantiated at:

- source `xu`;
- endpoints `(xu, deleted)`;
- selected row `Kxu`.

Named erase-`xu` survivor centers:

`{S.oppApex2, centerAt v, deleted = centerAt xv, centerAt deleted}`.

Named erase-`deleted` survivor centers:

`{S.oppApex2, xv = centerAt u, centerAt v, deleted = centerAt xv}`.

Survival is furnished by the robust second apex or by the exact five-cycle support omissions. Equal-blocker support transport gives the alias-to-row implications for blockers `xv`, `centerAt deleted`, `centerAt v`, and `deleted`; blocker `S.oppApex2` is excluded by robust deletion survival versus `no_qfree_at`.

The resulting honest conditional trichotomy is:

1. a `FiveSurvivorExactRowsBoundary` after deleting `xu`; or
2. a `FiveSurvivorExactRowsBoundary` after deleting `deleted`; or
3. the five-row cover

```text
D.A subset
  Ku.support union Kxu.support union Kdeleted.support union
  Kv.support union Kxv.support.
```

The cover implies `13 <= D.A.card <= 15`. No source-clean terminal currently consumes either fresh branch or the cover.

## 4. Exact cap-seven normal form

Assume `S.oppCap2.card = 7`. The checked theorem

`exactFourRigid221_sourceHeavy_pentagonBlockerDeleted_card_eq_seven_normal_form`

returns, with

`cx := (lateFirstApexSystem R).centerAt xu`,

- `(S.capInteriorByIndex S.oppIndex2).card = 5`;
- `cx` is outside the physical class;
- `cx` belongs to the strict second-cap interior;
- `v` does not belong to that strict interior;
- the exact interior identity

```text
S.capInteriorByIndex S.oppIndex2 = {u, deleted, xv, xu, cx};
```

- the `xu`-row physical-class trace is exactly `{xu, deleted}`;
- the physical class is still the five-point set

```text
{deleted} union ({u,xu} union {v,xv}).
```

Thus `cx` is the unique strict-interior point outside the physical class.

The tagged off-class/strict-cap trichotomy can tag `cx`, `cd := centerAt deleted`, or `cv := centerAt v`. In cap seven, an off-class strict-interior `cd` or `cv` must equal the unique point `cx`; blocker injectivity is the mechanism used by the normal-form reduction to isolate the `cx` branch. It does not identify all three centers.

## 5. Current cap-seven no-fresh boundary

The bare support-cover conclusion plus carrier membership and own-center omission gives only

```text
cx in Ku.support or
cx in Kxv.support or
cx in Kdeleted.support or
cx in Kv.support.
```

A pending audit is checking whether existing one-cap two-hit bounds exclude `Ku` and `Kxv`, sharpening this to

```text
cx in Kdeleted.support or cx in Kv.support.
```

A second pending audit is checking whether a strengthened colored/blocker-cover output would then give

```text
centerAt cx = centerAt deleted or centerAt cx = centerAt v,
```

with exact selected-support equality.

No existing affine-nine-hit, five-role/two-Kalmanson, or tetrahedron terminal is currently instantiated by the four-way cover alone. The first missing datum is an additional cross-row support membership and, for Kalmanson, a compatible full boundary order.

## 6. Cap/card arithmetic under the cover

Using `SurplusCapPacket.capSum`, surplus-card at least five, first-opposite cap at least four, and second-opposite cap at least seven, the possible cap-card triples `(oppCap2, oppCap1, surplus)` are:

```text
n=13: (7,4,5)
n=14: (8,4,5), (7,5,5), (7,4,6)
n=15: (9,4,5), (8,5,5), (7,6,5),
      (8,4,6), (7,5,6), (7,4,7)
```

The corresponding strict-interior triples subtract two from each cap.

A prior slot-count report mislabeled the blocker-interior physical point. The live target has `hblockerEqDeleted`; therefore `deleted`, not `v`, is the target point obtained from blocker-interior equality. The cap-seven normal form explicitly has `v` outside the strict second-cap interior. Completion-slot formulas must use the indicator of `v`-membership, not `deleted`-membership. That correction is pending confirmation in the source audit.

## 7. Completion-overlap profiles under the five-row cover

There are ten completion incidences, two per exact row. With `n = 13,14,15`, the number of distinct completion points is `n-5`, so the overlap excess is `15-n`.

Up to the preliminary dihedral quotient there are thirteen profiles:

- `n=15`: all ten completions distinct;
- `n=14`: one repeated completion, adjacent or nonadjacent row pair;
- `n=13`: ten profiles, consisting of either one degree-three shared completion or two degree-two repetitions.

These are only combinatorial support profiles. Source labels, center placements, blocker fibers, cap membership, Euclidean realizability, and full `CounterexampleData` remain to be imposed.

## 8. Blocker-fiber strengthening under audit

For `T := D.A \ Kxu.support`, the intended colored no-fresh conclusion classifies every actual blocker in

`{xv, centerAt deleted, centerAt v, deleted}`.

The sharp proposed fiber capacities are `3,2,3,3`, summing to eleven. If verified, `D.A.card = 15` forces saturation and exact row-residue identities; cards fourteen and thirteen give total fiber deficits one and two. The present generic bridge only returns a support cover, so retaining the pointwise blocker color may require a strengthened source-neutral theorem or a source-specific proof.

## 9. New reusable affine terminal

Commit `0d985145c` adds `AffineNineHitCircleKernel.lean` with:

- `equal_radius_two_circle_opposite_sum`;
- `false_of_nine_hit_affine_pattern`;
- `false_of_nine_selected_four_classes_affine_pattern`.

All have the standard axiom footprint only. No current source occurrence has been established in the blocker-deleted rows.

## 10. Immediate next checks

1. Decide whether one-cap selected-row intersection bounds sharpen the cap-seven cover from four rows to `Kdeleted or Kv`.
2. Test the three known cap-ordered equalities against `false_of_orderedCap_three_equidistant_betweenness_cycle`.
3. Test the resulting three-point row in the geometric core used by the proved blocker-V circle-wedge theorem.
4. Correct and complete the blocker-fiber saturation audit.
5. If no terminal follows, freeze a cap-seven colored residual and enumerate its source-valid center/fiber/support profiles before QF_NRA.
