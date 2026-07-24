/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BiApexRobustCapBounds
import Erdos9796Proof.P97.Census554.GeometryBridge

/-!
# A canonical `(5,6,5)` subcarrier and its minimality escape

This scratch module tests the strongest direct use of
`FaithfulCarrierPattern.exists_row_escape_of_proper_subset` on the exact-five
second-cap branch above card thirteen.

The chosen subcarrier contains all three Moser vertices, three strict points
from the surplus cap, four strict points from the first opposite cap, and all
three strict points from the exact-five second opposite cap.  Thus it has
thirteen points and the induced closed-cap counts are `(5,6,5)`.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailCardGe14FaithfulCarrierEscapeScratch

open ATailBiApexRobustCapBounds
open ATailCapApexRadiusRigidity
open ATailCriticalPairFrontier
open ATailOrientedPhysicalApexIngress
open ATailPhysicalSecondApexCommonDeletion
open Census554
open U1LargeCapRouteBTailMetricResidualTarget

attribute [local instance] Classical.propDecidable

private theorem capInteriorByIndex_eq_capInteriorAt
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) :
    S.capInteriorByIndex i = capInteriorAt S.partition i := by
  fin_cases i <;> rfl

private theorem capInteriorByIndex_not_mem_verts
    {A : Finset ℝ²} (S : SurplusCapPacket A) {i : Fin 3} {x : ℝ²}
    (hx : x ∈ S.capInteriorByIndex i) :
    x ∉ S.triangle.verts := by
  rw [capInteriorByIndex_eq_capInteriorAt] at hx
  exact Card11Labeling.not_mem_verts_of_mem_capInteriorAt S.partition hx

private theorem capInteriorByIndex_disjoint_of_ne
    {A : Finset ℝ²} (S : SurplusCapPacket A) {i j : Fin 3}
    (hij : i ≠ j) :
    Disjoint (S.capInteriorByIndex i) (S.capInteriorByIndex j) := by
  rw [capInteriorByIndex_eq_capInteriorAt,
    capInteriorByIndex_eq_capInteriorAt]
  exact Card11Labeling.capInteriorAt_disjoint_of_ne S.partition hij

private theorem capByIndex_surplusIdx_eq_surplusCap
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.capByIndex S.surplusIdx = S.surplusCap := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.capByIndex, SurplusCapPacket.surplusCap, hi]

private theorem capByIndex_oppIndex1_eq_oppCap1
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.capByIndex S.oppIndex1 = S.oppCap1 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.capByIndex, SurplusCapPacket.oppIndex1,
      SurplusCapPacket.oppCap1, hi]

private theorem capByIndex_oppIndex2_eq_oppCap2
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.capByIndex S.oppIndex2 = S.oppCap2 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.capByIndex, SurplusCapPacket.oppIndex2,
      SurplusCapPacket.oppCap2, hi]

/-- The source-faithful data of a thirteen-point `(5,6,5)` cap skeleton.
The three stored sets contain only strict cap-interior points; the three
Moser vertices are added by `carrier`. -/
structure Canonical565Skeleton {A : Finset ℝ²}
    (S : SurplusCapPacket A) where
  surplusInterior : Finset ℝ²
  firstInterior : Finset ℝ²
  secondInterior : Finset ℝ²
  surplusInterior_subset :
    surplusInterior ⊆ S.capInteriorByIndex S.surplusIdx
  firstInterior_subset :
    firstInterior ⊆ S.capInteriorByIndex S.oppIndex1
  secondInterior_subset :
    secondInterior ⊆ S.capInteriorByIndex S.oppIndex2
  secondInterior_eq :
    secondInterior = S.capInteriorByIndex S.oppIndex2
  surplusInterior_card : surplusInterior.card = 3
  firstInterior_card : firstInterior.card = 4
  secondInterior_card : secondInterior.card = 3

namespace Canonical565Skeleton

/-- The thirteen-point carrier underlying the canonical `(5,6,5)` skeleton. -/
noncomputable def carrier {A : Finset ℝ²} {S : SurplusCapPacket A}
    (K : Canonical565Skeleton S) : Finset ℝ² :=
  S.triangle.verts ∪ K.surplusInterior ∪ K.firstInterior ∪ K.secondInterior

theorem carrier_subset {A : Finset ℝ²} {S : SurplusCapPacket A}
    (K : Canonical565Skeleton S) :
    K.carrier ⊆ A := by
  apply Finset.union_subset
  · apply Finset.union_subset
    · apply Finset.union_subset
      · exact S.triangle.verts_subset
      · exact K.surplusInterior_subset.trans
          (S.capInteriorByIndex_subset S.surplusIdx)
    · exact K.firstInterior_subset.trans
        (S.capInteriorByIndex_subset S.oppIndex1)
  · exact K.secondInterior_subset.trans
      (S.capInteriorByIndex_subset S.oppIndex2)

theorem carrier_nonempty {A : Finset ℝ²} {S : SurplusCapPacket A}
    (K : Canonical565Skeleton S) :
    K.carrier.Nonempty := by
  refine ⟨S.triangle.v1, ?_⟩
  simp [carrier, MoserTriangle.verts]

theorem carrier_card {A : Finset ℝ²} {S : SurplusCapPacket A}
    (K : Canonical565Skeleton S) :
    K.carrier.card = 13 := by
  have hVS : Disjoint S.triangle.verts K.surplusInterior := by
    rw [Finset.disjoint_left]
    intro x hxV hxS
    exact (capInteriorByIndex_not_mem_verts S
      (K.surplusInterior_subset hxS)) hxV
  have hSF : Disjoint K.surplusInterior K.firstInterior := by
    exact (capInteriorByIndex_disjoint_of_ne S
      S.surplusIdx_ne_oppIndex1).mono K.surplusInterior_subset
        K.firstInterior_subset
  have hSSecond : Disjoint K.surplusInterior K.secondInterior := by
    exact (capInteriorByIndex_disjoint_of_ne S
      S.surplusIdx_ne_oppIndex2).mono K.surplusInterior_subset
        K.secondInterior_subset
  have hFSecond : Disjoint K.firstInterior K.secondInterior := by
    exact (capInteriorByIndex_disjoint_of_ne S
      S.oppIndex1_ne_oppIndex2).mono K.firstInterior_subset
        K.secondInterior_subset
  have hVSF : Disjoint
      (S.triangle.verts ∪ K.surplusInterior) K.firstInterior := by
    rw [Finset.disjoint_left]
    intro x hx hxF
    rcases Finset.mem_union.mp hx with hxV | hxS
    · exact (capInteriorByIndex_not_mem_verts S
        (K.firstInterior_subset hxF)) hxV
    · exact Finset.disjoint_left.mp hSF hxS hxF
  have hVSFSecond : Disjoint
      (S.triangle.verts ∪ K.surplusInterior ∪ K.firstInterior)
        K.secondInterior := by
    rw [Finset.disjoint_left]
    intro x hx hxSecond
    rcases Finset.mem_union.mp hx with hxVS | hxF
    · rcases Finset.mem_union.mp hxVS with hxV | hxS
      · exact (capInteriorByIndex_not_mem_verts S
          (K.secondInterior_subset hxSecond)) hxV
      · exact Finset.disjoint_left.mp hSSecond hxS hxSecond
    · exact Finset.disjoint_left.mp hFSecond hxF hxSecond
  rw [carrier, Finset.card_union_of_disjoint hVSFSecond,
    Finset.card_union_of_disjoint hVSF,
    Finset.card_union_of_disjoint hVS, S.triangle.verts_card,
    K.surplusInterior_card, K.firstInterior_card,
    K.secondInterior_card]

end Canonical565Skeleton

/-- The exact-five cap bounds always provide a canonical `(5,6,5)` skeleton.
Only subsets of actual strict cap interiors are selected. -/
theorem nonempty_canonical565Skeleton
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (hfirst : 6 ≤ S.oppCap1.card)
    (hsecond : S.oppCap2.card = 5) :
    Nonempty (Canonical565Skeleton S) := by
  classical
  have hSurplusInterior :
      3 ≤ (S.capInteriorByIndex S.surplusIdx).card := by
    have hcard := capInteriorByIndex_card_add_two S S.surplusIdx
    rw [capByIndex_surplusIdx_eq_surplusCap] at hcard
    have hsurplus := S.surplus_card_gt_four
    omega
  have hFirstInterior :
      4 ≤ (S.capInteriorByIndex S.oppIndex1).card := by
    have hcard := capInteriorByIndex_card_add_two S S.oppIndex1
    rw [capByIndex_oppIndex1_eq_oppCap1] at hcard
    omega
  have hSecondInterior :
      (S.capInteriorByIndex S.oppIndex2).card = 3 := by
    have hcard := capInteriorByIndex_card_add_two S S.oppIndex2
    rw [capByIndex_oppIndex2_eq_oppCap2, hsecond] at hcard
    omega
  obtain ⟨surplusInterior, hSurplusSubset, hSurplusCard⟩ :=
    Finset.exists_subset_card_eq hSurplusInterior
  obtain ⟨firstInterior, hFirstSubset, hFirstCard⟩ :=
    Finset.exists_subset_card_eq hFirstInterior
  exact ⟨{
    surplusInterior := surplusInterior
    firstInterior := firstInterior
    secondInterior := S.capInteriorByIndex S.oppIndex2
    surplusInterior_subset := hSurplusSubset
    firstInterior_subset := hFirstSubset
    secondInterior_subset := Finset.Subset.rfl
    secondInterior_eq := rfl
    surplusInterior_card := hSurplusCard
    firstInterior_card := hFirstCard
    secondInterior_card := hSecondInterior }⟩

/-- Every carrier point is either a Moser vertex or belongs to one of the
three strict cap interiors in the fixed index order `0,1,2`. -/
private theorem mem_verts_or_mem_capInteriorByIndex012
    {A : Finset ℝ²} (S : SurplusCapPacket A) {x : ℝ²} (hxA : x ∈ A) :
    x ∈ S.triangle.verts ∨
      x ∈ S.capInteriorByIndex (0 : Fin 3) ∨
      x ∈ S.capInteriorByIndex (1 : Fin 3) ∨
      x ∈ S.capInteriorByIndex (2 : Fin 3) := by
  by_cases hxV : x ∈ S.triangle.verts
  · exact Or.inl hxV
  have hxv1 : x ≠ S.triangle.v1 := by
    intro h
    apply hxV
    rw [h]
    simp [MoserTriangle.verts]
  have hxv2 : x ≠ S.triangle.v2 := by
    intro h
    apply hxV
    rw [h]
    simp [MoserTriangle.verts]
  have hxv3 : x ≠ S.triangle.v3 := by
    intro h
    apply hxV
    rw [h]
    simp [MoserTriangle.verts]
  have hone := S.partition.nonmoser_in_one x hxA hxV
  by_cases h1 : x ∈ S.partition.C1
  · exact Or.inr (Or.inl (by
      simp only [SurplusCapPacket.capInteriorByIndex, Finset.mem_erase]
      exact ⟨hxv3, hxv2, h1⟩))
  · by_cases h2 : x ∈ S.partition.C2
    · exact Or.inr (Or.inr (Or.inl (by
        simp only [SurplusCapPacket.capInteriorByIndex, Finset.mem_erase]
        exact ⟨hxv1, hxv3, h2⟩)))
    · have h3 : x ∈ S.partition.C3 := by
        by_contra h3
        simp [h1, h2, h3] at hone
      exact Or.inr (Or.inr (Or.inr (by
        simp only [SurplusCapPacket.capInteriorByIndex, Finset.mem_erase]
        exact ⟨hxv2, hxv1, h3⟩)))

/-- Every carrier point is either a Moser vertex or belongs to one of the
three strict cap interiors in surplus/first-opposite/second-opposite order. -/
private theorem mem_verts_or_mem_capInteriorByIndex
    {A : Finset ℝ²} (S : SurplusCapPacket A) {x : ℝ²} (hxA : x ∈ A) :
    x ∈ S.triangle.verts ∨
      x ∈ S.capInteriorByIndex S.surplusIdx ∨
      x ∈ S.capInteriorByIndex S.oppIndex1 ∨
      x ∈ S.capInteriorByIndex S.oppIndex2 := by
  have h := mem_verts_or_mem_capInteriorByIndex012 S hxA
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.oppIndex1, SurplusCapPacket.oppIndex2, hi]
      using h
  · rcases h with hV | h0 | h1 | h2
    · exact Or.inl hV
    · exact Or.inr (Or.inr (Or.inr (by
        simpa [SurplusCapPacket.oppIndex2, hi] using h0)))
    · exact Or.inr (Or.inl (by simpa [hi] using h1))
    · exact Or.inr (Or.inr (Or.inl (by
        simpa [SurplusCapPacket.oppIndex1, hi] using h2)))
  · rcases h with hV | h0 | h1 | h2
    · exact Or.inl hV
    · exact Or.inr (Or.inr (Or.inl (by
        simpa [SurplusCapPacket.oppIndex1, hi] using h0)))
    · exact Or.inr (Or.inr (Or.inr (by
        simpa [SurplusCapPacket.oppIndex2, hi] using h1)))
    · exact Or.inr (Or.inl (by simpa [hi] using h2))

/-- An ambient point outside the canonical skeleton lies in an omitted strict
point of the surplus or first opposite cap.  No second-cap strict point and no
Moser vertex can escape because the skeleton contains all of them. -/
theorem Canonical565Skeleton.outside_carrier_location
    {A : Finset ℝ²} {S : SurplusCapPacket A}
    (K : Canonical565Skeleton S) {z : ℝ²}
    (hzA : z ∈ A) (hzOutside : z ∉ K.carrier) :
    (z ∈ S.capInteriorByIndex S.surplusIdx ∧
        z ∉ K.surplusInterior) ∨
      (z ∈ S.capInteriorByIndex S.oppIndex1 ∧
        z ∉ K.firstInterior) := by
  rcases mem_verts_or_mem_capInteriorByIndex S hzA with
    hzV | hzSurplus | hzFirst | hzSecond
  · exact (hzOutside (by simp [Canonical565Skeleton.carrier, hzV])).elim
  · left
    exact ⟨hzSurplus, fun hzChosen ↦ hzOutside (by
      simp [Canonical565Skeleton.carrier, hzChosen])⟩
  · right
    exact ⟨hzFirst, fun hzChosen ↦ hzOutside (by
      simp [Canonical565Skeleton.carrier, hzChosen])⟩
  · exact (hzOutside (by
      simp [Canonical565Skeleton.carrier, K.secondInterior_eq, hzSecond])).elim

/-- Above card thirteen, minimality makes some actually selected K4 row with
center in the canonical `(5,6,5)` skeleton leave that skeleton.

The result intentionally returns the `FaithfulCarrierPattern`: the escaping
row is one of its globally selected rows, not a row reassigned after seeing
the escape. -/
theorem exists_faithfulRow_escape_from_canonical565_of_card_ge_fourteen
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    (hmin : D.Minimal)
    (Q : FrontierBiApexRobustExactFiveSecondCapResidual B)
    (hcard : 14 ≤ D.A.card) :
    ∃ K : Canonical565Skeleton S,
      ∃ P : FaithfulCarrierPattern D.A,
        ∃ center : ℝ², ∃ hcenter : center ∈ K.carrier, ∃ z : ℝ²,
          z ∈ (P.classAt center (K.carrier_subset hcenter)).support ∧
            z ∈ D.A \ K.carrier ∧
              ((z ∈ S.capInteriorByIndex S.surplusIdx ∧
                  z ∉ K.surplusInterior) ∨
                (z ∈ S.capInteriorByIndex S.oppIndex1 ∧
                  z ∉ K.firstInterior)) := by
  classical
  rcases nonempty_canonical565Skeleton S Q.firstOppCap_card_ge_six
      Q.secondOppCap_card_eq_five with ⟨K⟩
  rcases D.nonempty with ⟨gaugeCenter, hgaugeCenter⟩
  rcases exists_faithfulCarrierPattern_of_globalK4 D.K4 hgaugeCenter with ⟨P⟩
  have hproper : K.carrier ≠ D.A := by
    intro heq
    have hcards := congrArg Finset.card heq
    rw [K.carrier_card] at hcards
    omega
  rcases P.exists_row_escape_of_proper_subset hmin K.carrier_nonempty
      K.carrier_subset hproper with
    ⟨center, hcenter, z, hzSupport, hzOutside⟩
  have hzA :=
    (P.classAt center (K.carrier_subset hcenter)).support_subset_A hzSupport
  exact ⟨K, P, center, hcenter, z, hzSupport,
    Finset.mem_sdiff.mpr
      ⟨(P.classAt center (K.carrier_subset hcenter)).support_subset_A
          hzSupport,
        hzOutside⟩,
    K.outside_carrier_location hzA hzOutside⟩

#print axioms nonempty_canonical565Skeleton
#print axioms exists_faithfulRow_escape_from_canonical565_of_card_ge_fourteen

end ATailCardGe14FaithfulCarrierEscapeScratch
end Problem97
