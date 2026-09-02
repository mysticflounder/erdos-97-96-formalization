/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.ApexRichClassStructure
import Erdos9796Proof.P97.ATail.ExactFiveDistinctThreeCenterTightCover
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveCarrierIngress
import Erdos9796Proof.P97.Census554.ZeroCutBoundaryIndexing

/-!
# Balanced `(5, 5, 5)` boundary ingress

The balanced tight-cover invariant fixes all three strict Moser-cap interiors at
cardinality three.  Cutting a convex boundary enumeration at the surplus apex
therefore leaves three saturated three-point blocks, in either direct or mirror
order.  This module packages the resulting boundary-compatible labeling of the
twelve-point carrier.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailFrontierLiveClosure

open ATailApexRichClassStructure
open ATailCapApexRadiusRigidity
open ATailCommonDeletionTwoCenter
open ATailCriticalPairFrontier
open Census554.CapSelectedGeometry
open Census554.GeneralCarrierBridge
open ExactFiveDistinctThreeCenterTightCover
open ExactFiveDistinctThreeCenterContinuation
open ExactTwelveCarrierIngress
open FirstApexUniqueRadiusResidual

attribute [local instance] Classical.propDecidable

/-- The two possible orders of the three strict-interior blocks after cutting
the boundary at the surplus apex. -/
inductive Balanced555Orientation
  | direct
  | mirror
  deriving DecidableEq

/-- A boundary-compatible exact-twelve labeling for the balanced `(5, 5, 5)`
cap profile. -/
structure Balanced555BoundaryLabeling
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F)
    {deleted blocker : ℝ²}
    (C : CommonDeletionTwoCenterPacket D H deleted blocker S.oppApex2)
    (N : ExactFiveDistinctThreeCenterNormalForm R C)
    (_I : BalancedTightCoverInvariant R C N) : Type where
  orientation : Balanced555Orientation
  labels : CarrierLabel D.A ≃ Fin 12
  pointOf_injective : Function.Injective (fun i ↦ (labels.symm i).1)
  pointOf_image : Finset.univ.image (fun i ↦ (labels.symm i).1) = D.A
  pointOf_ccw : EuclideanGeometry.IsCcwConvexPolygon (fun i ↦ (labels.symm i).1)
  surplusApex_label : ∀ h : S.surplusApex ∈ D.A, labels ⟨S.surplusApex, h⟩ = 0
  firstApex_label : ∀ h : S.oppApex1 ∈ D.A, labels ⟨S.oppApex1, h⟩ =
    match orientation with
    | .direct => 4
    | .mirror => 8
  secondApex_label : ∀ h : S.oppApex2 ∈ D.A, labels ⟨S.oppApex2, h⟩ =
    match orientation with
    | .direct => 8
    | .mirror => 4
  secondInterior_labels :
    labelsOf labels (S.capInteriorByIndex S.oppIndex2) =
      match orientation with
      | .direct => {1, 2, 3}
      | .mirror => {9, 10, 11}
  surplusInterior_labels :
    labelsOf labels (S.capInteriorByIndex S.surplusIdx) = {5, 6, 7}
  firstInterior_labels :
    labelsOf labels (S.capInteriorByIndex S.oppIndex1) =
      match orientation with
      | .direct => {9, 10, 11}
      | .mirror => {1, 2, 3}

/-- Interpret a balanced boundary label as its carrier point. -/
def Balanced555BoundaryLabeling.pointOf
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F}
    {deleted blocker : ℝ²}
    {C : CommonDeletionTwoCenterPacket D H deleted blocker S.oppApex2}
    {N : ExactFiveDistinctThreeCenterNormalForm R C}
    {I : BalancedTightCoverInvariant R C N}
    (L : Balanced555BoundaryLabeling R C N I) : Fin 12 → ℝ² :=
  fun i ↦ (L.labels.symm i).1

private theorem capByIndex_surplusIdx_eq_surplusCap
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.capByIndex S.surplusIdx = S.surplusCap := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.capByIndex, SurplusCapPacket.surplusCap, hi]

private theorem subset_image_Ioo {boundary : Fin 12 → ℝ²} {T : Finset ℝ²}
    {a b : Fin 12}
    (h : ∀ x ∈ T, ∃ q : Fin 12, a < q ∧ q < b ∧ boundary q = x) :
    T ⊆ (Finset.Ioo a b).image boundary := by
  intro x hx
  obtain ⟨q, hq1, hq2, rfl⟩ := h x hx
  exact Finset.mem_image_of_mem _ (Finset.mem_Ioo.mpr ⟨hq1, hq2⟩)

private theorem subset_image_Ioi {boundary : Fin 12 → ℝ²} {T : Finset ℝ²}
    {a : Fin 12} (h : ∀ x ∈ T, ∃ q : Fin 12, a < q ∧ boundary q = x) :
    T ⊆ (Finset.Ioi a).image boundary := by
  intro x hx
  obtain ⟨q, hq, rfl⟩ := h x hx
  exact Finset.mem_image_of_mem _ (Finset.mem_Ioi.mpr hq)

private theorem card_le_of_Ioo {boundary : Fin 12 → ℝ²} {T : Finset ℝ²}
    {a b : Fin 12}
    (h : ∀ x ∈ T, ∃ q : Fin 12, a < q ∧ q < b ∧ boundary q = x) :
    T.card ≤ (b : ℕ) - a - 1 := by
  calc
    T.card ≤ ((Finset.Ioo a b).image boundary).card :=
      Finset.card_le_card (subset_image_Ioo h)
    _ ≤ (Finset.Ioo a b).card := Finset.card_image_le
    _ = (b : ℕ) - a - 1 := Fin.card_Ioo a b

private theorem card_le_of_Ioi {boundary : Fin 12 → ℝ²} {T : Finset ℝ²}
    {a : Fin 12} (h : ∀ x ∈ T, ∃ q : Fin 12, a < q ∧ boundary q = x) :
    T.card ≤ 12 - 1 - (a : ℕ) := by
  calc
    T.card ≤ ((Finset.Ioi a).image boundary).card :=
      Finset.card_le_card (subset_image_Ioi h)
    _ ≤ (Finset.Ioi a).card := Finset.card_image_le
    _ = 12 - 1 - (a : ℕ) := Fin.card_Ioi a

private theorem labelsOf_eq_of_exact_block
    {A T : Finset ℝ²} {boundary : Fin 12 → ℝ²}
    (labels : CarrierLabel A ≃ Fin 12)
    (hinjective : Function.Injective boundary)
    (hpoint : ∀ i, (labels.symm i).1 = boundary i)
    {Q : Finset (Fin 12)}
    (hblock : ∀ x ∈ T, ∃ q ∈ Q, boundary q = x)
    (hcard : Q.card ≤ T.card) : labelsOf labels T = Q := by
  have hsubset : T ⊆ Q.image boundary := by
    intro x hx
    obtain ⟨q, hq, rfl⟩ := hblock x hx
    exact Finset.mem_image_of_mem _ hq
  have heq : T = Q.image boundary :=
    Finset.eq_of_subset_of_card_le hsubset (by
      rw [Finset.card_image_of_injective _ hinjective]
      exact hcard)
  ext i
  rw [mem_labelsOf_iff]
  constructor
  · intro hi
    rw [heq] at hi
    obtain ⟨q, hq, hqi⟩ := Finset.mem_image.mp hi
    have : q = i := hinjective (hqi.trans (hpoint i))
    simpa [this] using hq
  · intro hi
    rw [heq]
    exact Finset.mem_image.mpr ⟨i, hi, (hpoint i).symm⟩

/-- The balanced tight-cover invariant supplies a boundary-compatible exact-twelve
labeling with the three strict-interior blocks at their forced positions. -/
theorem nonempty_balanced555BoundaryLabeling
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F)
    {deleted blocker : ℝ²}
    (C : CommonDeletionTwoCenterPacket D H deleted blocker S.oppApex2)
    (N : ExactFiveDistinctThreeCenterNormalForm R C)
    (I : BalancedTightCoverInvariant R C N) :
    Nonempty (Balanced555BoundaryLabeling R C N I) := by
  classical
  obtain ⟨B, hn, iv, iw, hu, hv, hw, hblocks⟩ :=
    Census554.ZeroCutBoundaryIndexing.exists_with_capBlocks S
  obtain ⟨n, boundary, indexOf, hinj, himage, hccw, hidxinj, hpt⟩ := B
  dsimp only at hn iv iw hu hv hw hblocks
  have hn12 : n = 12 := by
    have h := Finset.card_image_of_injective Finset.univ hinj
    rw [himage, I.carrier_card_eq_twelve, Finset.card_univ, Fintype.card_fin] at h
    exact h.symm
  subst hn12
  rw [oppositeVertexByIndex_surplusIdx] at hu
  rw [oppositeVertexByIndex_oppIndex1] at hv
  rw [oppositeVertexByIndex_oppIndex2] at hw
  rcases I.cap_profile with ⟨hcapS, _hcap1, _hcap2, hI1, hI2⟩
  have hI1' : S.oppInterior1.card = 3 := by
    simpa only [SurplusCapPacket.oppInterior1] using hI1
  have hI2' : S.oppInterior2.card = 3 := by
    simpa only [SurplusCapPacket.oppInterior2] using hI2
  have hISadd := capInteriorByIndex_card_add_two S S.surplusIdx
  rw [capByIndex_surplusIdx_eq_surplusCap, hcapS] at hISadd
  have hIS : (S.capInteriorByIndex S.surplusIdx).card = 3 := by omega
  have hindexBijective : Function.Bijective indexOf :=
    (Fintype.bijective_iff_injective_and_card indexOf).2
      ⟨hidxinj, by simp [I.carrier_card_eq_twelve]⟩
  let labels : CarrierLabel D.A ≃ Fin 12 := Equiv.ofBijective indexOf hindexBijective
  have hlabelPoint (label : CarrierLabel D.A) : boundary (labels label) = label.1 := by
    change boundary (indexOf label) = label.1
    exact hpt label
  have hpoint (i : Fin 12) : (labels.symm i).1 = boundary i := by
    calc
      (labels.symm i).1 = boundary (labels (labels.symm i)) := (hlabelPoint _).symm
      _ = boundary i := by rw [labels.apply_symm_apply]
  have hpointInj : Function.Injective (fun i ↦ (labels.symm i).1) := by
    simpa only [hpoint] using hinj
  have hpointImage : Finset.univ.image (fun i ↦ (labels.symm i).1) = D.A := by
    simpa only [hpoint] using himage
  have hpointCcw : EuclideanGeometry.IsCcwConvexPolygon (fun i ↦ (labels.symm i).1) := by
    simpa only [hpoint] using hccw
  have hsurplus : ∀ h : S.surplusApex ∈ D.A, labels ⟨S.surplusApex, h⟩ = 0 := by
    intro h
    apply hinj
    exact (hlabelPoint ⟨S.surplusApex, h⟩).trans hu.symm
  have hz0 : zeroIndex hn = (0 : Fin 12) := rfl
  rcases hblocks with hd | hm
  · obtain ⟨-, hI2block, hISblock, hI1block⟩ := hd
    rw [hz0] at hI2block
    have c2 := card_le_of_Ioo hI2block
    have cS := card_le_of_Ioo hISblock
    have c1 := card_le_of_Ioi hI1block
    rw [hI2'] at c2
    rw [hIS] at cS
    rw [hI1'] at c1
    have hiv' : (iv : ℕ) = 4 := by omega
    have hiw' : (iw : ℕ) = 8 := by omega
    have hiv : iv = 4 := Fin.ext hiv'
    have hiw : iw = 8 := Fin.ext hiw'
    subst hiv
    subst hiw
    refine ⟨{
      orientation := .direct
      labels := labels
      pointOf_injective := hpointInj
      pointOf_image := hpointImage
      pointOf_ccw := hpointCcw
      surplusApex_label := hsurplus
      firstApex_label := ?_
      secondApex_label := ?_
      secondInterior_labels := ?_
      surplusInterior_labels := ?_
      firstInterior_labels := ?_ }⟩
    · intro h
      apply hinj
      exact (hlabelPoint ⟨S.oppApex1, h⟩).trans hv.symm
    · intro h
      apply hinj
      exact (hlabelPoint ⟨S.oppApex2, h⟩).trans hw.symm
    · calc
        labelsOf labels (S.capInteriorByIndex S.oppIndex2) = Finset.Ioo 0 4 :=
          labelsOf_eq_of_exact_block labels hinj hpoint
            (fun x hx ↦ by
              obtain ⟨q, hq0, hq4, hqx⟩ := hI2block x (by simpa using hx)
              exact ⟨q, Finset.mem_Ioo.mpr ⟨hq0, hq4⟩, hqx⟩)
            (by rw [Fin.card_Ioo, hI2]; decide)
        _ = {1, 2, 3} := by decide
    · calc
        labelsOf labels (S.capInteriorByIndex S.surplusIdx) = Finset.Ioo 4 8 :=
          labelsOf_eq_of_exact_block labels hinj hpoint
            (fun x hx ↦ by
              obtain ⟨q, hq4, hq8, hqx⟩ := hISblock x hx
              exact ⟨q, Finset.mem_Ioo.mpr ⟨hq4, hq8⟩, hqx⟩)
            (by rw [Fin.card_Ioo, hIS]; decide)
        _ = {5, 6, 7} := by decide
    · calc
        labelsOf labels (S.capInteriorByIndex S.oppIndex1) = Finset.Ioi 8 :=
          labelsOf_eq_of_exact_block labels hinj hpoint
            (fun x hx ↦ by
              obtain ⟨q, hq8, hqx⟩ := hI1block x (by simpa using hx)
              exact ⟨q, Finset.mem_Ioi.mpr hq8, hqx⟩)
            (by rw [Fin.card_Ioi, hI1]; decide)
        _ = {9, 10, 11} := by decide
  · obtain ⟨-, hI1block, hISblock, hI2block⟩ := hm
    rw [hz0] at hI1block
    have c1 := card_le_of_Ioo hI1block
    have cS := card_le_of_Ioo hISblock
    have c2 := card_le_of_Ioi hI2block
    rw [hI1'] at c1
    rw [hIS] at cS
    rw [hI2'] at c2
    have hiw' : (iw : ℕ) = 4 := by omega
    have hiv' : (iv : ℕ) = 8 := by omega
    have hiw : iw = 4 := Fin.ext hiw'
    have hiv : iv = 8 := Fin.ext hiv'
    subst hiw
    subst hiv
    refine ⟨{
      orientation := .mirror
      labels := labels
      pointOf_injective := hpointInj
      pointOf_image := hpointImage
      pointOf_ccw := hpointCcw
      surplusApex_label := hsurplus
      firstApex_label := ?_
      secondApex_label := ?_
      secondInterior_labels := ?_
      surplusInterior_labels := ?_
      firstInterior_labels := ?_ }⟩
    · intro h
      apply hinj
      exact (hlabelPoint ⟨S.oppApex1, h⟩).trans hv.symm
    · intro h
      apply hinj
      exact (hlabelPoint ⟨S.oppApex2, h⟩).trans hw.symm
    · calc
        labelsOf labels (S.capInteriorByIndex S.oppIndex2) = Finset.Ioi 8 :=
          labelsOf_eq_of_exact_block labels hinj hpoint
            (fun x hx ↦ by
              obtain ⟨q, hq8, hqx⟩ := hI2block x (by simpa using hx)
              exact ⟨q, Finset.mem_Ioi.mpr hq8, hqx⟩)
            (by rw [Fin.card_Ioi, hI2]; decide)
        _ = {9, 10, 11} := by decide
    · calc
        labelsOf labels (S.capInteriorByIndex S.surplusIdx) = Finset.Ioo 4 8 :=
          labelsOf_eq_of_exact_block labels hinj hpoint
            (fun x hx ↦ by
              obtain ⟨q, hq4, hq8, hqx⟩ := hISblock x hx
              exact ⟨q, Finset.mem_Ioo.mpr ⟨hq4, hq8⟩, hqx⟩)
            (by rw [Fin.card_Ioo, hIS]; decide)
        _ = {5, 6, 7} := by decide
    · calc
        labelsOf labels (S.capInteriorByIndex S.oppIndex1) = Finset.Ioo 0 4 :=
          labelsOf_eq_of_exact_block labels hinj hpoint
            (fun x hx ↦ by
              obtain ⟨q, hq0, hq4, hqx⟩ := hI1block x (by simpa using hx)
              exact ⟨q, Finset.mem_Ioo.mpr ⟨hq0, hq4⟩, hqx⟩)
            (by rw [Fin.card_Ioo, hI1]; decide)
        _ = {1, 2, 3} := by decide

end ATailFrontierLiveClosure
end Problem97
