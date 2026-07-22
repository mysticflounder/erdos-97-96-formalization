/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import AllOneRankFacts

/-!
# Base row geometry for the exact-card-thirteen all-one ingress

This module proves the uniform selected-row facts used by the candidate
middle source core: exact support size, center exclusion, two-circle
intersection bounds, and every nonalternating shared-pair exclusion forced by
the fixed cyclic boundary order.  It is independent of any SAT certificate.
-/

namespace Problem97
namespace ATailExactFiveCard13AllOneSourceIngressScratch

open scoped EuclideanGeometry

open ATailBiApexRobustCapBounds
open ATailCriticalPairFrontier
open ATailExactFiveCard13CnfIngressScratch
open ATailExactFiveGlobalCrossDeletionPair
open ATailExactFiveMutualOneHitGeometry
open ATailFirstApexShellRole
open ATailLargeCapUniqueFive
open ATailLargeCapUniqueFivePhysicalOmissionCycle
open ATailLargeCapUniqueFivePhysicalOmissionTransitionGlobal
open ATailOrientedPhysicalApexIngress
open ATailParentExactFiveSecondCap
open ATailPhysicalSecondApexCommonDeletion
open CanonicalAllOneSourceOrbitIngress

attribute [local instance] Classical.propDecidable

noncomputable section

/-- The left-associated four-bit population count used by the source CNF. -/
def allOneBitCount13 (member : Fin 13 → Bool) : BitVec 4 :=
  (bif member 0 then 1#4 else 0#4) +
  (bif member 1 then 1#4 else 0#4) +
  (bif member 2 then 1#4 else 0#4) +
  (bif member 3 then 1#4 else 0#4) +
  (bif member 4 then 1#4 else 0#4) +
  (bif member 5 then 1#4 else 0#4) +
  (bif member 6 then 1#4 else 0#4) +
  (bif member 7 then 1#4 else 0#4) +
  (bif member 8 then 1#4 else 0#4) +
  (bif member 9 then 1#4 else 0#4) +
  (bif member 10 then 1#4 else 0#4) +
  (bif member 11 then 1#4 else 0#4) +
  (bif member 12 then 1#4 else 0#4)

theorem allOneBitCount13_eq_four_of_filter_card_eq_four
    (member : Fin 13 → Bool)
    (hcard : (Finset.univ.filter fun i ↦ member i = true).card = 4) :
    (allOneBitCount13 member == 4#4) = true := by
  native_decide +revert

private theorem allOneBitCount13_ule_two_of_filter_card_le_two
    (member : Fin 13 → Bool)
    (hcard : (Finset.univ.filter fun i ↦ member i = true).card ≤ 2) :
    (allOneBitCount13 member).ule 2#4 = true := by
  native_decide +revert

theorem supportIndexFilter_card
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (P : CanonicalCard13Frame profile) {center : Fin 13}
    (K : SelectedFourClass D.A (P.point center)) :
    (Finset.univ.filter fun i : Fin 13 ↦
      decide (P.point i ∈ K.support) = true).card = K.support.card := by
  let indices := Finset.univ.filter fun i : Fin 13 ↦
    decide (P.point i ∈ K.support) = true
  have himage : indices.image P.point = K.support := by
    ext x
    constructor
    · intro hx
      rcases Finset.mem_image.mp hx with ⟨i, hi, rfl⟩
      exact of_decide_eq_true (Finset.mem_filter.mp hi).2
    · intro hx
      have hxA : x ∈ D.A := K.support_subset_A hx
      rw [← P.point_image] at hxA
      rcases Finset.mem_image.mp hxA with ⟨i, _hi, rfl⟩
      exact Finset.mem_image.mpr
        ⟨i, Finset.mem_filter.mpr ⟨Finset.mem_univ _, by simp [hx]⟩, rfl⟩
  calc
    indices.card = (indices.image P.point).card :=
      (Finset.card_image_of_injective _ P.point_injective).symm
    _ = K.support.card := by rw [himage]

/-- Every packed source row has Boolean population count four. -/
theorem allOne_row_card_eq_four
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {P : CanonicalCard13Frame profile}
    {star : PhysicalGlobalCrossDeletionStar profile}
    {hall : AllPhysicalActualCriticalRowsOneHit H profile}
    {first : FirstApexShellRolePacket F R}
    {T : CanonicalAllOneSemanticRowTable P star hall first}
    (I : CanonicalAllOneSourceOrbitIngress T)
    (family : Fin 3) (center : Fin 13) :
    ((allOneBitCount13 fun point ↦
      rowBit I.sourceRows family.val center.val point.val) == 4#4) = true := by
  rw [show (fun point : Fin 13 ↦
      rowBit I.sourceRows family.val center.val point.val) =
      (fun point ↦ decide
        (P.point point ∈ (I.sourceClass family center).support)) by
    funext point
    simp [sourceRowMember]]
  apply allOneBitCount13_eq_four_of_filter_card_eq_four
  rw [supportIndexFilter_card P (I.sourceClass family center)]
  exact (I.sourceClass family center).support_card

/-- Every packed source row omits its own center. -/
theorem allOne_row_center_excluded
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {P : CanonicalCard13Frame profile}
    {star : PhysicalGlobalCrossDeletionStar profile}
    {hall : AllPhysicalActualCriticalRowsOneHit H profile}
    {first : FirstApexShellRolePacket F R}
    {T : CanonicalAllOneSemanticRowTable P star hall first}
    (I : CanonicalAllOneSourceOrbitIngress T)
    (family : Fin 3) (center : Fin 13) :
    (!(rowBit I.sourceRows family.val center.val center.val)) = true := by
  simp only [rowBit_sourceRows, sourceRowMember]
  rw [decide_eq_false_iff_not.mpr (I.sourceClass family center).center_not_mem]
  rfl

private theorem allOne_sharedPair_false_of_strict
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {P : CanonicalCard13Frame profile}
    {star : PhysicalGlobalCrossDeletionStar profile}
    {hall : AllPhysicalActualCriticalRowsOneHit H profile}
    {first : FirstApexShellRolePacket F R}
    {T : CanonicalAllOneSemanticRowTable P star hall first}
    (I : CanonicalAllOneSourceOrbitIngress T)
    (family₁ family₂ : Fin 3) (center₁ center₂ point₁ point₂ : Fin 13)
    (hstrict :
      (dist (P.point center₂) (P.point point₁) +
          dist (P.point center₁) (P.point point₂) <
        dist (P.point center₁) (P.point point₁) +
          dist (P.point center₂) (P.point point₂)) ∨
      (dist (P.point center₁) (P.point point₁) +
          dist (P.point center₂) (P.point point₂) <
        dist (P.point center₂) (P.point point₁) +
          dist (P.point center₁) (P.point point₂))) :
    (!((rowBit I.sourceRows family₁.val center₁.val point₁.val &&
        rowBit I.sourceRows family₁.val center₁.val point₂.val &&
        rowBit I.sourceRows family₂.val center₂.val point₁.val &&
        rowBit I.sourceRows family₂.val center₂.val point₂.val))) = true := by
  rw [Bool.not_eq_true_eq_eq_false, Bool.eq_false_iff]
  intro hallBits
  have hleft := (Bool.and_eq_true_iff.mp hallBits).1
  have h₂₂ := (Bool.and_eq_true_iff.mp hallBits).2
  have h₂₁ := (Bool.and_eq_true_iff.mp hleft).2
  have hfirst := (Bool.and_eq_true_iff.mp hleft).1
  have h₁₁ := (Bool.and_eq_true_iff.mp hfirst).1
  have h₁₂ := (Bool.and_eq_true_iff.mp hfirst).2
  simp only [rowBit_sourceRows, sourceRowMember, decide_eq_true_eq] at h₁₁ h₁₂ h₂₁ h₂₂
  have hradius₁ := (I.sourceClass family₁ center₁).support_eq_radius _ h₁₁
  have hradius₁' := (I.sourceClass family₁ center₁).support_eq_radius _ h₁₂
  have hradius₂ := (I.sourceClass family₂ center₂).support_eq_radius _ h₂₁
  have hradius₂' := (I.sourceClass family₂ center₂).support_eq_radius _ h₂₂
  rcases hstrict with hstrict | hstrict <;> linarith

theorem allOne_sharedPair_centersBeforePoints
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {P : CanonicalCard13Frame profile}
    {star : PhysicalGlobalCrossDeletionStar profile}
    {hall : AllPhysicalActualCriticalRowsOneHit H profile}
    {first : FirstApexShellRolePacket F R}
    {T : CanonicalAllOneSemanticRowTable P star hall first}
    (I : CanonicalAllOneSourceOrbitIngress T)
    (family₁ family₂ : Fin 3) (center₁ center₂ point₁ point₂ : Fin 13)
    (h₁ : center₁ < center₂) (h₂ : center₂ < point₁) (h₃ : point₁ < point₂) :
    (!((rowBit I.sourceRows family₁.val center₁.val point₁.val &&
        rowBit I.sourceRows family₁.val center₁.val point₂.val &&
        rowBit I.sourceRows family₂.val center₂.val point₁.val &&
        rowBit I.sourceRows family₂.val center₂.val point₂.val))) = true := by
  apply allOne_sharedPair_false_of_strict I
  exact Or.inl (P.strictKalmanson h₁ h₂ h₃).1

theorem allOne_sharedPair_pointsBeforeCenters
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {P : CanonicalCard13Frame profile}
    {star : PhysicalGlobalCrossDeletionStar profile}
    {hall : AllPhysicalActualCriticalRowsOneHit H profile}
    {first : FirstApexShellRolePacket F R}
    {T : CanonicalAllOneSemanticRowTable P star hall first}
    (I : CanonicalAllOneSourceOrbitIngress T)
    (family₁ family₂ : Fin 3) (center₁ center₂ point₁ point₂ : Fin 13)
    (h₁ : point₁ < point₂) (h₂ : point₂ < center₁) (h₃ : center₁ < center₂) :
    (!((rowBit I.sourceRows family₁.val center₁.val point₁.val &&
        rowBit I.sourceRows family₁.val center₁.val point₂.val &&
        rowBit I.sourceRows family₂.val center₂.val point₁.val &&
        rowBit I.sourceRows family₂.val center₂.val point₂.val))) = true := by
  apply allOne_sharedPair_false_of_strict I
  exact Or.inl (by simpa [dist_comm, add_comm] using (P.strictKalmanson h₁ h₂ h₃).1)

theorem allOne_sharedPair_centersAroundPoints
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {P : CanonicalCard13Frame profile}
    {star : PhysicalGlobalCrossDeletionStar profile}
    {hall : AllPhysicalActualCriticalRowsOneHit H profile}
    {first : FirstApexShellRolePacket F R}
    {T : CanonicalAllOneSemanticRowTable P star hall first}
    (I : CanonicalAllOneSourceOrbitIngress T)
    (family₁ family₂ : Fin 3) (center₁ center₂ point₁ point₂ : Fin 13)
    (h₁ : center₁ < point₁) (h₂ : point₁ < point₂) (h₃ : point₂ < center₂) :
    (!((rowBit I.sourceRows family₁.val center₁.val point₁.val &&
        rowBit I.sourceRows family₁.val center₁.val point₂.val &&
        rowBit I.sourceRows family₂.val center₂.val point₁.val &&
        rowBit I.sourceRows family₂.val center₂.val point₂.val))) = true := by
  apply allOne_sharedPair_false_of_strict I
  exact Or.inr (by simpa [dist_comm, add_comm] using (P.strictKalmanson h₁ h₂ h₃).2)

theorem allOne_sharedPair_pointsAroundCenters
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {P : CanonicalCard13Frame profile}
    {star : PhysicalGlobalCrossDeletionStar profile}
    {hall : AllPhysicalActualCriticalRowsOneHit H profile}
    {first : FirstApexShellRolePacket F R}
    {T : CanonicalAllOneSemanticRowTable P star hall first}
    (I : CanonicalAllOneSourceOrbitIngress T)
    (family₁ family₂ : Fin 3) (center₁ center₂ point₁ point₂ : Fin 13)
    (h₁ : point₁ < center₁) (h₂ : center₁ < center₂) (h₃ : center₂ < point₂) :
    (!((rowBit I.sourceRows family₁.val center₁.val point₁.val &&
        rowBit I.sourceRows family₁.val center₁.val point₂.val &&
        rowBit I.sourceRows family₂.val center₂.val point₁.val &&
        rowBit I.sourceRows family₂.val center₂.val point₂.val))) = true := by
  apply allOne_sharedPair_false_of_strict I
  exact Or.inr (by simpa [dist_comm, add_comm] using (P.strictKalmanson h₁ h₂ h₃).2)

/-- A source row and the retained first-apex row cannot contain the same
nonalternating pair.  The strict inequality is kept explicit so generated
instances can select the correct cyclic-order orientation without changing
the original boundary frame. -/
theorem allOne_firstRow_sharedPair_false_of_strict
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {P : CanonicalCard13Frame profile}
    {star : PhysicalGlobalCrossDeletionStar profile}
    {hall : AllPhysicalActualCriticalRowsOneHit H profile}
    {first : FirstApexShellRolePacket F R}
    {T : CanonicalAllOneSemanticRowTable P star hall first}
    (I : CanonicalAllOneSourceOrbitIngress T)
    (family : Fin 3) (center point₁ point₂ : Fin 13)
    (hstrict :
      (dist (P.point center) (P.point point₁) +
          dist (P.point 4) (P.point point₂) <
        dist (P.point 4) (P.point point₁) +
          dist (P.point center) (P.point point₂)) ∨
      (dist (P.point 4) (P.point point₁) +
          dist (P.point center) (P.point point₂) <
        dist (P.point center) (P.point point₁) +
          dist (P.point 4) (P.point point₂))) :
    (!((firstRowBit (sourceFirstApexRow T) point₁.val &&
        firstRowBit (sourceFirstApexRow T) point₂.val &&
        rowBit I.sourceRows family.val center.val point₁.val &&
        rowBit I.sourceRows family.val center.val point₂.val))) = true := by
  rw [Bool.not_eq_true_eq_eq_false, Bool.eq_false_iff]
  intro hallBits
  have hleft := (Bool.and_eq_true_iff.mp hallBits).1
  have h₂₂ := (Bool.and_eq_true_iff.mp hallBits).2
  have h₂₁ := (Bool.and_eq_true_iff.mp hleft).2
  have hfirst := (Bool.and_eq_true_iff.mp hleft).1
  have h₁₁ := (Bool.and_eq_true_iff.mp hfirst).1
  have h₁₂ := (Bool.and_eq_true_iff.mp hfirst).2
  simp only [firstRowBit_sourceFirstApexRow, rowBit_sourceRows,
    sourceRowMember, decide_eq_true_eq] at h₁₁ h₁₂ h₂₁ h₂₂
  have hradius₁ := T.firstApexDoubleRow.support_eq_radius _ h₁₁
  have hradius₁' := T.firstApexDoubleRow.support_eq_radius _ h₁₂
  have hradius₂ := (I.sourceClass family center).support_eq_radius _ h₂₁
  have hradius₂' := (I.sourceClass family center).support_eq_radius _ h₂₂
  rcases hstrict with hstrict | hstrict <;> linarith

private theorem supportIntersectionIndexFilter_card
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (P : CanonicalCard13Frame profile) {center₁ center₂ : Fin 13}
    (K₁ : SelectedFourClass D.A (P.point center₁))
    (K₂ : SelectedFourClass D.A (P.point center₂)) :
    (Finset.univ.filter fun i : Fin 13 ↦
      (decide (P.point i ∈ K₁.support) &&
        decide (P.point i ∈ K₂.support)) = true).card =
      (K₁.support ∩ K₂.support).card := by
  let indices := Finset.univ.filter fun i : Fin 13 ↦
    (decide (P.point i ∈ K₁.support) &&
      decide (P.point i ∈ K₂.support)) = true
  have himage : indices.image P.point = K₁.support ∩ K₂.support := by
    ext x
    constructor
    · intro hx
      rcases Finset.mem_image.mp hx with ⟨i, hi, rfl⟩
      have hi' := (Finset.mem_filter.mp hi).2
      rw [Bool.and_eq_true] at hi'
      exact Finset.mem_inter.mpr
        ⟨of_decide_eq_true hi'.1, of_decide_eq_true hi'.2⟩
    · intro hx
      rcases Finset.mem_inter.mp hx with ⟨hx₁, hx₂⟩
      have hxA : x ∈ D.A := K₁.support_subset_A hx₁
      rw [← P.point_image] at hxA
      rcases Finset.mem_image.mp hxA with ⟨i, _hi, rfl⟩
      exact Finset.mem_image.mpr
        ⟨i, Finset.mem_filter.mpr ⟨Finset.mem_univ _, by simp [hx₁, hx₂]⟩, rfl⟩
  calc
    indices.card = (indices.image P.point).card :=
      (Finset.card_image_of_injective _ P.point_injective).symm
    _ = (K₁.support ∩ K₂.support).card := by rw [himage]

/-- The population count of an intersection of rows at distinct centers is
at most two. -/
theorem allOne_row_inter_card_le_two
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {P : CanonicalCard13Frame profile}
    {star : PhysicalGlobalCrossDeletionStar profile}
    {hall : AllPhysicalActualCriticalRowsOneHit H profile}
    {first : FirstApexShellRolePacket F R}
    {T : CanonicalAllOneSemanticRowTable P star hall first}
    (I : CanonicalAllOneSourceOrbitIngress T)
    (family₁ family₂ : Fin 3) (center₁ center₂ : Fin 13)
    (hne : center₁ ≠ center₂) :
    (allOneBitCount13 fun point ↦
      rowBit I.sourceRows family₁.val center₁.val point.val &&
        rowBit I.sourceRows family₂.val center₂.val point.val).ule 2#4 = true := by
  rw [show (fun point : Fin 13 ↦
      rowBit I.sourceRows family₁.val center₁.val point.val &&
        rowBit I.sourceRows family₂.val center₂.val point.val) =
      (fun point ↦
        decide (P.point point ∈ (I.sourceClass family₁ center₁).support) &&
          decide (P.point point ∈ (I.sourceClass family₂ center₂).support)) by
    funext point
    simp [sourceRowMember]]
  apply allOneBitCount13_ule_two_of_filter_card_le_two
  rw [supportIntersectionIndexFilter_card P]
  exact SelectedFourClass.inter_card_le_two
    (I.sourceClass family₁ center₁) (I.sourceClass family₂ center₂)
    (fun h ↦ hne (P.point_injective h))

private theorem pairCenterIndexFilter_card_le_two
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (P : CanonicalCard13Frame profile) (left right : Fin 13)
    (hne : left ≠ right) (member : Fin 13 → Bool)
    (hmember : ∀ center, member center = true →
      dist (P.point center) (P.point left) =
        dist (P.point center) (P.point right)) :
    (Finset.univ.filter fun center ↦ member center = true).card ≤ 2 := by
  let indices := Finset.univ.filter fun center ↦ member center = true
  let bisectors := D.A.filter fun center ↦
    dist center (P.point left) = dist center (P.point right)
  have hsub : indices.image P.point ⊆ bisectors := by
    intro center hcenter
    rcases Finset.mem_image.mp hcenter with ⟨index, hindex, rfl⟩
    exact Finset.mem_filter.mpr
      ⟨P.point_mem_A index, hmember index (Finset.mem_filter.mp hindex).2⟩
  calc
    indices.card = (indices.image P.point).card :=
      (Finset.card_image_of_injective _ P.point_injective).symm
    _ ≤ bisectors.card := Finset.card_le_card hsub
    _ ≤ 2 := Dumitrescu.perpBisector_apex_bound D.convex
      (P.point_mem_A left) (P.point_mem_A right) (P.point_injective.ne hne)

/-- A fixed carrier pair can occur in one selected family at at most two
carrier centers. -/
theorem allOne_family_pair_center_count_le_two
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {P : CanonicalCard13Frame profile}
    {star : PhysicalGlobalCrossDeletionStar profile}
    {hall : AllPhysicalActualCriticalRowsOneHit H profile}
    {first : FirstApexShellRolePacket F R}
    {T : CanonicalAllOneSemanticRowTable P star hall first}
    (I : CanonicalAllOneSourceOrbitIngress T)
    (family : Fin 3) (left right : Fin 13) (hne : left ≠ right) :
    (allOneBitCount13 fun center ↦
      rowBit I.sourceRows family.val center.val left.val &&
        rowBit I.sourceRows family.val center.val right.val).ule 2#4 = true := by
  apply allOneBitCount13_ule_two_of_filter_card_le_two
  apply pairCenterIndexFilter_card_le_two P left right hne
  intro center hcenter
  rw [Bool.and_eq_true] at hcenter
  simp only [rowBit_sourceRows, sourceRowMember, decide_eq_true_eq] at hcenter
  exact (I.sourceClass family center).support_eq_radius _ hcenter.1 |>.trans
    ((I.sourceClass family center).support_eq_radius _ hcenter.2).symm

/-- Boolean occurrence of a fixed pair at a carrier center in any of the
three source families, or in the retained first-apex row at index four. -/
def allOneAnyPairCenterBit
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {P : CanonicalCard13Frame profile}
    {star : PhysicalGlobalCrossDeletionStar profile}
    {hall : AllPhysicalActualCriticalRowsOneHit H profile}
    {first : FirstApexShellRolePacket F R}
    {T : CanonicalAllOneSemanticRowTable P star hall first}
    (I : CanonicalAllOneSourceOrbitIngress T)
    (left right center : Fin 13) : Bool :=
  (I.sourceRowMember 0 center left && I.sourceRowMember 0 center right) ||
    (I.sourceRowMember 1 center left && I.sourceRowMember 1 center right) ||
    (I.sourceRowMember 2 center left && I.sourceRowMember 2 center right) ||
    (decide (center = (4 : Fin 13)) &&
      firstRowBit (sourceFirstApexRow T) left.val &&
      firstRowBit (sourceFirstApexRow T) right.val)

/-- Counting centers rather than row-table instances, a fixed carrier pair
occurs at at most two centers across all source families and the retained
first-apex row. -/
theorem allOne_any_pair_center_count_le_two
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {P : CanonicalCard13Frame profile}
    {star : PhysicalGlobalCrossDeletionStar profile}
    {hall : AllPhysicalActualCriticalRowsOneHit H profile}
    {first : FirstApexShellRolePacket F R}
    {T : CanonicalAllOneSemanticRowTable P star hall first}
    (I : CanonicalAllOneSourceOrbitIngress T)
    (left right : Fin 13) (hne : left ≠ right) :
    (allOneBitCount13 fun center ↦
      allOneAnyPairCenterBit I left right center).ule 2#4 = true := by
  apply allOneBitCount13_ule_two_of_filter_card_le_two
  apply pairCenterIndexFilter_card_le_two P left right hne
  intro center hcenter
  simp only [allOneAnyPairCenterBit, Bool.or_eq_true, Bool.and_eq_true,
    decide_eq_true_eq, sourceRowMember,
    firstRowBit_sourceFirstApexRow] at hcenter
  rcases hcenter with ((hcenter | hcenter) | hcenter) |
      ⟨⟨hfour, hleft⟩, hright⟩
  · exact (I.sourceClass 0 center).support_eq_radius _ hcenter.1 |>.trans
      ((I.sourceClass 0 center).support_eq_radius _ hcenter.2).symm
  · exact (I.sourceClass 1 center).support_eq_radius _ hcenter.1 |>.trans
      ((I.sourceClass 1 center).support_eq_radius _ hcenter.2).symm
  · exact (I.sourceClass 2 center).support_eq_radius _ hcenter.1 |>.trans
      ((I.sourceClass 2 center).support_eq_radius _ hcenter.2).symm
  · subst center
    exact T.firstApexDoubleRow.support_eq_radius _ hleft |>.trans
      (T.firstApexDoubleRow.support_eq_radius _ hright).symm

#print axioms allOne_row_card_eq_four
#print axioms allOne_row_center_excluded
#print axioms allOne_sharedPair_centersBeforePoints
#print axioms allOne_row_inter_card_le_two
#print axioms allOne_any_pair_center_count_le_two

end

end ATailExactFiveCard13AllOneSourceIngressScratch
end Problem97
