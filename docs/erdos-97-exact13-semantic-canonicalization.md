# Semantic canonicalization in the exact-thirteen cover

**Status:** PROVEN pen-and-paper under the source hypotheses below, with focused
Lean validation of the source adapters recorded on September 6. The validation
scope and remaining finite-coverage obligation are stated below.

**Authority:** [the atomic proof](erdos-97-descent-prose-proof-atomic.md) records
current project status. This note supplies the detailed argument for its
exact-thirteen restriction, not a terminal contradiction.

**Source:** the September 5 literature/semantic handoff, SHA-256
`bdcf9d5960482793a4edd26681ee382f13f3d59b2c9e797e3848e6fe3662595b`,
sections 3–6; [independent handoff audit](skeptic-97-96-literature-semantic-adapter-full-handoff-2026-09-05-2026-09-05.md).
The paper argument was checked against the packet declarations at
`4f8f2f5fa9360c94dd512779bafbff48bdae2bc9`. The subsequent source implementations
and their validation receipts are linked below.

## Exact statement

Use the source packet
`Q : CardGeThirteenUncoveredStrictInteriorPacket R firstRow secondRow`.
Write `A = D.A`, `P = S.oppApex2`, `z = Q.base.z`,
`C₀ = Q.base.W.row₁.support`, `C₁ = Q.base.W.row₂.support`, and
`K = Q.base.thirdRow.support`. The blocker centers are the two actual centers
in `lateFirstApexSystem R` named by `Q.base.W.source₁` and `source₂`.
Assume the retained cover

```text
A = {z} ∪ C₀ ∪ C₁ ∪ K.
```

For every `T : SelectedFourClass (A.erase z) P`,

```text
T.support = K.
```

Consequently, for every `w ∈ K`,

```text
¬ HasNEquidistantPointsAt 4 ((A.erase z).erase w) P.
```

These statements use the stored completeness of the named rows. They require
no additional `hnoFive`, disjoint-cover assumption, fixed boundary labels, or
joint-survival hypothesis. The exact-thirteen constructor supplies this cover;
the proof itself does not use the cardinality thirteen separately.

## Complete source argument

Choose `E` from `Q.base.exactRows`. Its fields supply `P ∈ A`, both blocker
centers in `A`, and each blocker center distinct from `P`.
`Q.base.z_mem_rows` puts `z` in one of the named rows centered at `P`.
A selected row omits its center, so `z ≠ P`. The same fact gives `P ∉ K`.
Apply the cover to **`P ∈ A`**. Eliminating the singleton and third-row arms gives

```text
P ∈ C₀ or P ∈ C₁.
```

This step uses no membership of `P` in the queried row `T`; such membership
would contradict `T.center_not_mem`. Name a blocker row containing `P` by
`Srow`, with center `b`, and name the other blocker row `Drow`, with center `d`.
Membership of `P` in `Srow.support` supplies

```text
dist b P = Srow.radius.
```

Take `T` as in the statement and lift its ambient support inclusion into `A`
without changing its support or radius. Suppose its radius differs from the
third row's radius. Both rows have center `P`, so their supports are disjoint.
The cover and omission of `z` now give

```text
T.support ⊆ Srow.support ∪ Drow.support.
```

Use the original carrier's MEC, whose center lies in the convex hull of its
boundary carriers. `P` is a Moser vertex and lies on that circle. The boundary
fields are on `S.triangleNonObtuse.toMoserTriangle`; `S.triangle` is the
structural projection, which preserves the vertices but drops those fields.
Split `S.surplusIdx` to select `v3_boundary`, `v1_boundary`, or `v2_boundary`.
If `X,Y` belong to both `T.support` and `Srow.support`, the row equations give

```text
dist b P = dist b X = dist b Y,
dist P X = dist P Y.
```

The existing theorem
`Erdos9796Proof.Geometry.eq_of_one_boundary_same_radius_pair` gives `X = Y`.
Thus the `Srow` trace has cardinality at most one. Since `d ≠ P`, the existing
distinct-center circle-intersection theorem bounds the `Drow` trace by two.
Therefore

```text
4 = |T.support| ≤ |T.support ∩ Srow.support|
                   + |T.support ∩ Drow.support| ≤ 1 + 2 = 3,
```

a contradiction. The two radii are equal.

Split `Q.base.thirdRow_named`. In either arm, one of
`Q.firstRow_support_eq_selectedClass` and
`Q.secondRow_support_eq_selectedClass` says that `K` is the complete original
radius class. Every point of `T.support` therefore lies in `K`. Both supports
have cardinality four, so they are equal.

For the double-deletion consequence, the existing generic
`ATailFrontierLiveClosure.exists_selectedFourClass_in_erase_of_deletion_survives`
extracts a selected row directly in `(A.erase z).erase w`: instantiate its
`A` with `A.erase z` and its `deleted` with `w`. Lift that same support to
`A.erase z`. Canonicalization identifies it with `K`, which contains `w`,
while its original support inclusion omits `w`. This is a contradiction.

The two blocker branches use bounds **one plus two**, in either order.
Nothing here requires both blocker traces to have cardinality at most one.

## The raw packet supplies the cover

Let `J : ExactThirteenBranchIngress S` and let
`T : CardGeThirteenExact13RawTightSupport R surface firstRow secondRow Q.base J`.
The existing packet supplies

```text
(T.C0raw ∪ T.C1raw) ∪ T.Kraw = univ.erase T.zraw.
```

Insert `T.zraw` on both sides and apply the finset image under `J.pt`.
Images preserve insertion and union. The packet's four stored image equalities
identify the singleton and three supports, while `J.labelMap.image_eq`
identifies the image of `univ` with `D.A`. This proves exactly the physical
cover used above. This transport needs no injectivity, cardinality, or
disjointness argument; those additional packet fields are not used.
For a dispatch packet `X`, its existing field `X.tightSupport` supplies `T`.
Thus the source consumer need not acquire an additional cover field.

The raw packet also determines which blocker contains the apex. Let `p` be
the raw label `DRExactThirteenValuation.secondApex`.
The label map gives `J.pt p = P`. Since `z ≠ P`, the stored equality
`J.pt T.zraw = z` gives `p ≠ T.zraw`. If `p ∈ T.Kraw`, its image would put
`P` in `K`, contradicting the third row's center exclusion. Apply the raw
cover to `p ∈ univ.erase T.zraw`: it follows that `p ∈ T.C0raw` or
`p ∈ T.C1raw`. The stored `raw_disjoint_C0_C1` rules out membership in both.
This proves exclusive blocker membership directly in raw labels. It does
not yet count or classify the later eighteen-choice source configurations.

Both deductions were independently checked against the source packet and
local finset APIs. They are now implemented in the RawCover and ExclusiveApex18
source modules linked below.

## Source and consumer contract

The [active two-radius plan](plans/2026-09-01-dr-two-radius-branch-closure.md),
phase 4, covers the exact-thirteen member of the four-way source dispatcher.
The named residual is
`false_of_exactFourPostCardElevenTwoRadiusBranch_cardGeThirteen`, with final
consumer `Problem97.erdos97_rhs`. Canonicalization is intended to constrain
the rows supplied to the exact-thirteen source-order/finite-classifier lane.
It does not by itself decrease the plan's count of uncovered terminal cases.
This note introduces no new Lean obligation and claims no removed `sorry`.

The source declarations supplying the proof are:

| Ingredient | Source |
|---|---|
| `Q` and named-row completeness | `P97/ATail/FrontierLiveClosure/CardGeThirteenUncoveredStrictInterior.lean:158` |
| `z_mem_rows`, `thirdRow_named`, `exactRows` | `P97/ATail/FrontierLiveClosure/CardGeThirteenTerminalSplitV2.lean:41` |
| Original carrier and blocker/apex inequalities | `P97/ATail/ThreeCenterCommonDeletion.lean:51` |
| Actual selected blocker rows | `P97/ATail/SevenGoodSourceDistinctBlockerCommonDeletion.lean:349` |
| One-point trace kernel | `Geometry/TwoInteriorSameBoundaryRadius.lean:361` |
| Original MEC and boundary support | `P97/MEC/Basic.lean:65`, `P97/Moser/TriangleNonObtuse.lean:100`, `P97/MEC/Boundary.lean:64` |
| Moser boundary data and structural projection | `P97/Moser/Triangle.lean:59`, `P97/Cap/PartitionFromMEC.lean:332` |
| Two-point trace bound | `P97/U1CarrierInjection.lean:474` |
| Support-preserving extraction in an erased carrier | `P97/ATail/FrontierLiveClosure/FreshThirdCrossDeletionRows.lean:40` |
| Raw cover, support images, and blocker disjointness | `P97/ATail/FrontierLiveClosure/CardGeThirteenExact13RawIngress.lean:345` |

Paths in the table are relative to `lean/Erdos9796Proof/`.
The physical cover input is supplied by `physical_cover_of_raw_tight_support`
from the existing `X.tightSupport` field.

## Checked source implementations

| Result | Implementation | Retained validation |
|---|---|---|
| Raw packet supplies physical cover | [RawCover](../lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/CardGeThirteenExact13RawCover.lean), `physical_cover_of_raw_tight_support` | Checked as a dependency of the focused canonicalization check |
| Canonical four-row and double-deletion obstruction | [SemanticCanonicalization](../lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/CardGeThirteenExact13SemanticCanonicalization.lean), `selectedFourRow_on_erase_z_support_eq_third` and `not_four_survives_double_erase_of_mem_third` | [Focused check and public axiom probes](audits/2026-09-06-exact13-semantic-canonicalization.md) |
| Exclusive blocker, support-partition witness, and eighteen choices | [ExclusiveApex18](../lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/CardGeThirteenExact13ExclusiveApex18.lean) | [Independent audit of all fourteen public declarations](skeptic-CardGeThirteenExact13ExclusiveApex18-2026-09-06.md) |

The canonicalization and eighteen-choice public probes report only `propext`,
`Classical.choice`, and `Quot.sound`. These are focused module results against
the checked dependency artifacts. No aggregate-spine reachability, Lean-ingress
promotion, or terminal contradiction is certified by these receipts.

The obsolete code blocks and historical reuse searches are preserved in the
[archived draft snapshot](archive/2026-09-06-exact13-semantic-uncompiled-drafts.md).
Use the source modules above for implementation work.

## Remaining finite-coverage obligation

[StrongSourceCoverage](../lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/CardGeThirteenExact13StrongSourceCoverage.lean)
constructs a key in `strongValidKeys` from each source `Input`, including a
witness of `sourceOrderValid`. Its predicate `StrongValidKeyCover bank` asks for a checked
matching entry for every key in that finite set. Such a proof supplies
`bankCovers_of_strongValidKeyCover`; the weighted bank bridge then has the
conditional contradiction consumer `false_of_bank`.

This is a sufficient finite coverage contract. Membership in `strongValidKeys`
records necessary combinatorial and guarded boundary-intersection conditions;
it does not assert that an arbitrary member is geometrically realized.
The [representative certificate check](audits/2026-09-06-exact13-representative-certificate-20260906.md)
translates one authenticated one-form and one two-form cut. It does not supply
the exhaustive coverage proof.

The [wave5 audit](audits/2026-09-06-exact13-witnessed-key-guarded-cegar-wave5.md)
records 56,000 cuts and a SAT refinement-budget terminal. The
[wave6 closeout](audits/2026-09-06-exact13-witnessed-key-guarded-cegar-wave6.md)
records an interrupted, nonterminal extension to 63,509 cuts, with a one-row
state lag and no completed post-run StrongValid replay. Neither result proves
`StrongValidKeyCover`. Completing checked coverage, or deriving a narrower
source-entitled coverage contract, remains necessary for this finite route.
