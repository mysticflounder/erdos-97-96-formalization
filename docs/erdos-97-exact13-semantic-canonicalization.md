# Semantic canonicalization in the exact-thirteen cover

**Status:** PROVEN pen-and-paper under the source hypotheses below; independently
audited. The Lean draft below is uncompiled and is not a formalization receipt.

**Authority:** [the atomic proof](erdos-97-descent-prose-proof-atomic.md) records
current project status. This note supplies the detailed argument for its
exact-thirteen restriction, not a terminal contradiction.

**Source:** the September 5 literature/semantic handoff, SHA-256
`bdcf9d5960482793a4edd26681ee382f13f3d59b2c9e797e3848e6fe3662595b`,
sections 3–6; [independent handoff audit](skeptic-97-96-literature-semantic-adapter-full-handoff-2026-09-05-2026-09-05.md).
Source-facing bridge checked September 6 against the packet declarations at
`4f8f2f5fa9360c94dd512779bafbff48bdae2bc9`.

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

## Source and consumer contract

The [active two-radius plan](plans/2026-09-01-dr-two-radius-branch-closure.md),
phase 4, covers the exact-thirteen member of the four-way source dispatcher.
The named residual is
`false_of_exactFourPostCardElevenTwoRadiusBranch_cardGeThirteen`, with final
consumer `Problem97.erdos97_rhs`. Canonicalization is intended to constrain
the rows supplied to the exact-thirteen source-order/finite-classifier lane.
It does not by itself decrease the plan's count of uncovered terminal cases.
This note introduces no new Lean obligation and claims no removed `sorry`.

The bounded project-corpus reuse search used the key “exact thirteen semantic
cover apex member blocker row canonicalization,” indexed at `098475811`.
It surfaced the existing three-row tight-cover and provider adapters, with
no already assembled canonicalization theorem in those results. The audited
current declarations supplying the proof are:

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

Paths in the table are relative to `lean/Erdos9796Proof/`.
The missing terminal remains a source-produced contradiction, for example
joint survival for a pair `(z,w)` killed by the theorem. Existing survival
for a differently named pair cannot supply that hypothesis without proving
the required point identities.

## Lean draft and validation boundary

The following draft is intended for the existing `slice-ingress` implementation
lane after coordinated source release. It uses the pinned Lean 4.27.0 APIs.
It has not been elaborated. The shared reconciliation build was running while
this note was written; no file in its Lean source graph was changed.
Validate the selected module with the governed workflow, then inspect the
exported declarations' axioms and the actual consumer path before making a
formalization or closure claim.

The complete draft follows.

```lean
/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.CardGeThirteenUncoveredStrictInterior
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.FreshThirdCrossDeletionRows
import Erdos9796Proof.Geometry.TwoInteriorSameBoundaryRadius
import Erdos9796Proof.P97.Moser.TriangleNonObtuse

/-!
# Selected-row canonicalization from the semantic three-row cover

UNCOMPILED DRAFT. The proof uses the actual original-carrier MEC and the
one-plus-two blocker trace bound. It proves a double-deletion obstruction,
without asserting that the source supplies incompatible joint survival.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailFrontierLiveClosure

open ATailCriticalPairFrontier ATailDeletionRobustness
open ATailSevenGoodSourceDistinctBlockerCommonDeletion
open ATailUniqueArmRouteAuditScratch ATailUniqueFourLateChoiceTerminalScratch

/-- A row through the boundary apex contributes at most one point, and the
other blocker contributes at most two, to a different-radius apex row. -/
private theorem radius_eq_of_cover
    {A : Finset ℝ²} {C P z b d : ℝ²} {r : ℝ}
    (hconv : EuclideanGeometry.ConvexIndep (A : Set ℝ²))
    (hcontain : ∀ q ∈ A, dist q C ≤ r)
    (hcenter : C ∈ convexHull ℝ {q : ℝ² | q ∈ A ∧ dist q C = r})
    (hPmem : P ∈ A) (hbmem : b ∈ A)
    (hPboundary : dist P C = r)
    (Srow : SelectedFourClass A b) (Drow : SelectedFourClass A d)
    (K T : SelectedFourClass A P)
    (hPS : P ∈ Srow.support) (hPd : P ≠ d)
    (hcover : A ⊆ insert z ((Srow.support ∪ Drow.support) ∪ K.support))
    (hzT : z ∉ T.support) : T.radius = K.radius := by
  classical
  by_contra hrne
  have hTK : Disjoint T.support K.support := by
    apply Finset.disjoint_left.mpr
    intro x hxT hxK
    exact hrne ((T.support_eq_radius x hxT).symm.trans
      (K.support_eq_radius x hxK))
  have hSle : (T.support ∩ Srow.support).card ≤ 1 := by
    apply Finset.card_le_one.mpr
    intro x hx y hy
    have hxT := (Finset.mem_inter.mp hx).1
    have hxS := (Finset.mem_inter.mp hx).2
    have hyT := (Finset.mem_inter.mp hy).1
    have hyS := (Finset.mem_inter.mp hy).2
    exact Erdos9796Proof.Geometry.eq_of_one_boundary_same_radius_pair
      (A := A) (C := C) (B := b) (P := P) (X := x) (Y := y) (R := r)
      hconv hcontain hcenter hbmem hPmem
      (T.support_subset_A hxT) (T.support_subset_A hyT) hPboundary
      ((Srow.support_eq_radius P hPS).trans (Srow.support_eq_radius x hxS).symm)
      ((Srow.support_eq_radius P hPS).trans (Srow.support_eq_radius y hyS).symm)
      ((T.support_eq_radius x hxT).trans (T.support_eq_radius y hyT).symm)
  have hDle : (T.support ∩ Drow.support).card ≤ 2 :=
    SelectedFourClass.inter_card_le_two T Drow hPd
  have hSD : T.support ⊆ Srow.support ∪ Drow.support := by
    intro x hx
    rcases Finset.mem_insert.mp (hcover (T.support_subset_A hx)) with rfl | hU
    · exact (hzT hx).elim
    · rcases Finset.mem_union.mp hU with hSD | hK
      · exact hSD
      · exact (Finset.disjoint_left.mp hTK hx hK).elim
  have htraces : T.support ⊆
      (T.support ∩ Srow.support) ∪ (T.support ∩ Drow.support) := by
    intro x hx
    rcases Finset.mem_union.mp (hSD hx) with hS | hD
    · exact Finset.mem_union.mpr (Or.inl (Finset.mem_inter.mpr ⟨hx, hS⟩))
    · exact Finset.mem_union.mpr (Or.inr (Finset.mem_inter.mpr ⟨hx, hD⟩))
  have hcard : T.support.card ≤ 1 + 2 := by
    calc
      T.support.card ≤
          ((T.support ∩ Srow.support) ∪ (T.support ∩ Drow.support)).card :=
        Finset.card_le_card htraces
      _ ≤ (T.support ∩ Srow.support).card + (T.support ∩ Drow.support).card :=
        Finset.card_union_le _ _
      _ ≤ 1 + 2 := Nat.add_le_add hSle hDle
  rw [T.support_card] at hcard
  omega

/-- Under the semantic three-row cover, every selected four-row surviving
deletion of the uncovered point has exactly the stored third-row support. -/
theorem selectedFourRow_on_erase_z_support_eq_third
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F)
    {firstRow secondRow : SelectedFourClass D.A S.oppApex2}
    (Q : CardGeThirteenUncoveredStrictInteriorPacket R firstRow secondRow)
    (hcover : D.A = insert Q.base.z
      ((Q.base.W.row₁.support ∪ Q.base.W.row₂.support) ∪ Q.base.thirdRow.support))
    (T : SelectedFourClass (D.A.erase Q.base.z) S.oppApex2) :
    T.support = Q.base.thirdRow.support := by
  classical
  rcases Q.base.exactRows with ⟨E⟩
  have hzP : Q.base.z ≠ S.oppApex2 := by
    intro h
    rcases Q.base.z_mem_rows with hzF | hzS
    · exact firstRow.center_not_mem (h ▸ hzF)
    · exact secondRow.center_not_mem (h ▸ hzS)
  have hcoverSub : D.A ⊆ insert Q.base.z
      ((Q.base.W.row₁.support ∪ Q.base.W.row₂.support) ∪
        Q.base.thirdRow.support) := by
    intro x hx
    rw [← hcover]
    exact hx
  have hPblock : S.oppApex2 ∈ Q.base.W.row₁.support ∨
      S.oppApex2 ∈ Q.base.W.row₂.support := by
    rcases Finset.mem_insert.mp (hcoverSub E.center₂_mem_A) with hPz | hU
    · exact (hzP hPz.symm).elim
    · rcases Finset.mem_union.mp hU with h01 | hK
      · exact Finset.mem_union.mp h01
      · exact (Q.base.thirdRow.center_not_mem hK).elim
  -- M is the global MEC, independent of the two blocker-circle radii.
  let M := MEC.mec D.A S.hA
  have hboundarySet : (MEC.boundary D.A S.hA : Set ℝ²) =
      {q : ℝ² | q ∈ D.A ∧ dist q M.center = M.radius} := by
    ext q
    exact MEC.mem_boundary_iff S.hA
  have hcenter : M.center ∈
      convexHull ℝ {q : ℝ² | q ∈ D.A ∧ dist q M.center = M.radius} := by
    rw [← hboundarySet]
    exact MEC.mec_center_mem_convexHull_boundary S.hA S.hncol
  have hPboundary : dist S.oppApex2 M.center = M.radius := by
    change dist S.oppApex2 (MEC.mec D.A S.hA).center =
      (MEC.mec D.A S.hA).radius
    unfold SurplusCapPacket.oppApex2
    split
    · exact S.triangleNonObtuse.toMoserTriangle.v3_boundary
    · exact S.triangleNonObtuse.toMoserTriangle.v1_boundary
    · exact S.triangleNonObtuse.toMoserTriangle.v2_boundary
  let TA : SelectedFourClass D.A S.oppApex2 :=
    { support := T.support
      support_subset_A := fun x hx ↦ (Finset.mem_erase.mp (T.support_subset_A hx)).2
      support_card := T.support_card
      radius := T.radius
      radius_pos := T.radius_pos
      support_eq_radius := T.support_eq_radius
      center_not_mem := T.center_not_mem }
  have hzTA : Q.base.z ∉ TA.support := by
    intro hz
    exact (Finset.mem_erase.mp (T.support_subset_A hz)).1 rfl
  have hrad : TA.radius = Q.base.thirdRow.radius := by
    rcases hPblock with hP0 | hP1
    · exact radius_eq_of_cover D.convex M.enclosing hcenter
        E.center₂_mem_A E.center₀_mem_A hPboundary
        Q.base.W.row₁ Q.base.W.row₂ Q.base.thirdRow TA
        hP0 E.center₁_ne_center₂.symm hcoverSub hzTA
    · have hcoverSwap : D.A ⊆ insert Q.base.z
          ((Q.base.W.row₂.support ∪ Q.base.W.row₁.support) ∪
            Q.base.thirdRow.support) := by
        intro x hx
        simpa only [Finset.union_comm Q.base.W.row₁.support Q.base.W.row₂.support]
          using hcoverSub hx
      exact radius_eq_of_cover D.convex M.enclosing hcenter
        E.center₂_mem_A E.center₁_mem_A hPboundary
        Q.base.W.row₂ Q.base.W.row₁ Q.base.thirdRow TA
        hP1 E.center₀_ne_center₂.symm hcoverSwap hzTA
  have hfull : Q.base.thirdRow.support =
      SelectedClass D.A S.oppApex2 Q.base.thirdRow.radius := by
    rcases Q.base.thirdRow_named with ⟨_, hK⟩ | ⟨_, hK⟩
    · simpa only [hK] using Q.secondRow_support_eq_selectedClass
    · simpa only [hK] using Q.firstRow_support_eq_selectedClass
  have hsub : TA.support ⊆ Q.base.thirdRow.support := by
    intro x hx
    rw [hfull]
    exact mem_selectedClass.mpr
      ⟨TA.support_subset_A hx, (TA.support_eq_radius x hx).trans hrad⟩
  have heq : TA.support = Q.base.thirdRow.support :=
    Finset.eq_of_subset_of_card_le hsub (by
      simp only [TA.support_card, Q.base.thirdRow.support_card, le_refl])
  exact heq

/-- Erasing the uncovered point and a point of the third row destroys every
four-equidistant witness at the second physical apex. -/
theorem not_four_survives_double_erase_of_mem_third
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F)
    {firstRow secondRow : SelectedFourClass D.A S.oppApex2}
    (Q : CardGeThirteenUncoveredStrictInteriorPacket R firstRow secondRow)
    (hcover : D.A = insert Q.base.z
      ((Q.base.W.row₁.support ∪ Q.base.W.row₂.support) ∪ Q.base.thirdRow.support))
    {w : ℝ²} (hw : w ∈ Q.base.thirdRow.support) :
    ¬ HasNEquidistantPointsAt 4 ((D.A.erase Q.base.z).erase w) S.oppApex2 := by
  classical
  intro hsurvives
  obtain ⟨U⟩ := exists_selectedFourClass_in_erase_of_deletion_survives hsurvives
  let Tlift : SelectedFourClass (D.A.erase Q.base.z) S.oppApex2 :=
    { support := U.support
      support_subset_A := fun x hx ↦ (Finset.mem_erase.mp (U.support_subset_A hx)).2
      support_card := U.support_card
      radius := U.radius
      radius_pos := U.radius_pos
      support_eq_radius := U.support_eq_radius
      center_not_mem := U.center_not_mem }
  have hcanon := selectedFourRow_on_erase_z_support_eq_third R Q hcover Tlift
  have hwU : w ∈ U.support := by
    change w ∈ Tlift.support
    rw [hcanon]
    exact hw
  exact (Finset.mem_erase.mp (U.support_subset_A hwU)).1 rfl

end ATailFrontierLiveClosure
end Problem97
```
