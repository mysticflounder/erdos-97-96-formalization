/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import AllOneBaseGeometryFacts
import Erdos9796Proof.P97.ATail.SecondApexClassOneHit

/-!
# Packet facts for the exact-card-thirteen all-one ingress

This module connects the source-faithful exact-five shell, retained frontier
pair, fixed critical map, and aligned middle cover packet to the Boolean
layouts used by the verified certificate.  It contains no SAT assumption.
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

/-- The thirteen-way index lookup used by the generated frontier clauses. -/
def allOneIndexLookupBit (index : BitVec 4) (member : Fin 13 → Bool) : Bool :=
  ((index == 0#4) && member 0) ||
  ((index == 1#4) && member 1) ||
  ((index == 2#4) && member 2) ||
  ((index == 3#4) && member 3) ||
  ((index == 4#4) && member 4) ||
  ((index == 5#4) && member 5) ||
  ((index == 6#4) && member 6) ||
  ((index == 7#4) && member 7) ||
  ((index == 8#4) && member 8) ||
  ((index == 9#4) && member 9) ||
  ((index == 10#4) && member 10) ||
  ((index == 11#4) && member 11) ||
  ((index == 12#4) && member 12)

private theorem allOneIndexLookupBit_ofNat
    (index : Fin 13) (member : Fin 13 → Bool) :
    allOneIndexLookupBit (BitVec.ofNat 4 index.val) member = member index := by
  native_decide +revert

private theorem allOneIndexOmissionClause_of_false
    (index point : Fin 13) (member : Fin 13 → Bool)
    (hfalse : member index = false) :
    (!((BitVec.ofNat 4 index.val) == BitVec.ofNat 4 point.val) ||
      !(member point)) = true := by
  native_decide +revert

/-- The eight indices outside the canonical surplus-cap block. -/
def allOneOutsideMiddleBlockBit (index : BitVec 4) : Bool :=
  (index == 0#4) || (index == 1#4) || (index == 2#4) ||
    (index == 3#4) || (index == 9#4) || (index == 10#4) ||
    (index == 11#4) || (index == 12#4)

private theorem allOneOutsideMiddleBlockBit_of_not_mem
    (index : Fin 13) (hindex : ¬ ((4 : Fin 13) ≤ index ∧ index ≤ (8 : Fin 13))) :
    allOneOutsideMiddleBlockBit (BitVec.ofNat 4 index.val) = true := by
  native_decide +revert

private theorem allOneBitCount13_eq_five_of_filter_card_eq_five
    (member : Fin 13 → Bool)
    (hcard : (Finset.univ.filter fun i ↦ member i = true).card = 5) :
    (allOneBitCount13 member == 5#4) = true := by
  native_decide +revert

/-- Population count on the canonical surplus-cap block, indices `4..8`. -/
def allOneMiddleBlockBitCount (member : Fin 13 → Bool) : BitVec 4 :=
  (bif member 4 then 1#4 else 0#4) +
  (bif member 5 then 1#4 else 0#4) +
  (bif member 6 then 1#4 else 0#4) +
  (bif member 7 then 1#4 else 0#4) +
  (bif member 8 then 1#4 else 0#4)

/-- Population count on the canonical first-opposite-cap wrap block. -/
def allOneFinalWrapBlockBitCount (member : Fin 13 → Bool) : BitVec 4 :=
  (bif member 0 then 1#4 else 0#4) +
  (bif member 8 then 1#4 else 0#4) +
  (bif member 9 then 1#4 else 0#4) +
  (bif member 10 then 1#4 else 0#4) +
  (bif member 11 then 1#4 else 0#4) +
  (bif member 12 then 1#4 else 0#4)

/-- Population count on the canonical second-opposite-cap initial block. -/
def allOneInitialBlockBitCount (member : Fin 13 → Bool) : BitVec 4 :=
  (bif member 0 then 1#4 else 0#4) +
  (bif member 1 then 1#4 else 0#4) +
  (bif member 2 then 1#4 else 0#4) +
  (bif member 3 then 1#4 else 0#4) +
  (bif member 4 then 1#4 else 0#4)

/-- The strict portion of the surplus-cap block used by the shell packet. -/
def allOneMiddleStrictBitCount (member : Fin 13 → Bool) : BitVec 4 :=
  (bif member 4 then 1#4 else 0#4) +
  (bif member 5 then 1#4 else 0#4) +
  (bif member 6 then 1#4 else 0#4) +
  (bif member 7 then 1#4 else 0#4)

/-- The strict wrap portion of the first opposite cap used by the shell. -/
def allOneFinalStrictBitCount (member : Fin 13 → Bool) : BitVec 4 :=
  (bif member 0 then 1#4 else 0#4) +
  (bif member 9 then 1#4 else 0#4) +
  (bif member 10 then 1#4 else 0#4) +
  (bif member 11 then 1#4 else 0#4) +
  (bif member 12 then 1#4 else 0#4)

private theorem allOneMiddleBlockBitCount_ule_of_filter_card_le
    (member : Fin 13 → Bool) (bound : Fin 4)
    (hcard : (Finset.univ.filter fun i ↦
      member i = true ∧ (4 : Fin 13) ≤ i ∧ i ≤ (8 : Fin 13)).card ≤ bound.val) :
    (allOneMiddleBlockBitCount member).ule (BitVec.ofNat 4 bound.val) = true := by
  native_decide +revert

private theorem allOneFinalWrapBlockBitCount_ule_of_filter_card_le
    (member : Fin 13 → Bool) (bound : Fin 4)
    (hcard : (Finset.univ.filter fun i ↦
      member i = true ∧ (i = 0 ∨ (8 : Fin 13) ≤ i)).card ≤ bound.val) :
    (allOneFinalWrapBlockBitCount member).ule (BitVec.ofNat 4 bound.val) = true := by
  native_decide +revert

private theorem allOneInitialBlockBitCount_ule_of_filter_card_le
    (member : Fin 13 → Bool) (bound : Fin 4)
    (hcard : (Finset.univ.filter fun i ↦
      member i = true ∧ i ≤ (4 : Fin 13)).card ≤ bound.val) :
    (allOneInitialBlockBitCount member).ule (BitVec.ofNat 4 bound.val) = true := by
  native_decide +revert

private theorem indexBlockFilter_card
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (P : CanonicalCard13Frame profile)
    (objects cap : Finset ℝ²) (member : Fin 13 → Bool)
    (inside : Fin 13 → Prop) [DecidablePred inside]
    (hobjects : objects ⊆ D.A)
    (hmember : ∀ i, member i = true ↔ P.point i ∈ objects)
    (hinside : ∀ i, inside i ↔ P.point i ∈ cap) :
    (Finset.univ.filter fun i ↦ member i = true ∧ inside i).card =
      (objects ∩ cap).card := by
  let indices := Finset.univ.filter fun i ↦ member i = true ∧ inside i
  have himage : indices.image P.point = objects ∩ cap := by
    ext x
    constructor
    · intro hx
      rcases Finset.mem_image.mp hx with ⟨i, hi, rfl⟩
      exact Finset.mem_inter.mpr ⟨
        (hmember i).1 (Finset.mem_filter.mp hi).2.1,
        (hinside i).1 (Finset.mem_filter.mp hi).2.2⟩
    · intro hx
      rcases Finset.mem_inter.mp hx with ⟨hxObjects, hxCap⟩
      have hxA : x ∈ D.A := hobjects hxObjects
      rw [← P.point_image] at hxA
      rcases Finset.mem_image.mp hxA with ⟨i, _hi, rfl⟩
      exact Finset.mem_image.mpr
        ⟨i, Finset.mem_filter.mpr ⟨Finset.mem_univ _,
          (hmember i).2 hxObjects, (hinside i).2 hxCap⟩, rfl⟩
  calc
    indices.card = (indices.image P.point).card :=
      (Finset.card_image_of_injective _ P.point_injective).symm
    _ = (objects ∩ cap).card := by rw [himage]

private theorem capByIndex_surplus_eq
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.capByIndex S.surplusIdx = S.surplusCap := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.capByIndex, SurplusCapPacket.surplusCap, hi]

private theorem capByIndex_firstOpp_eq
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.capByIndex S.oppIndex1 = S.oppCap1 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.capByIndex, SurplusCapPacket.oppIndex1,
      SurplusCapPacket.oppCap1, hi]

private theorem capByIndex_secondOpp_eq
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.capByIndex S.oppIndex2 = S.oppCap2 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.capByIndex, SurplusCapPacket.oppIndex2,
      SurplusCapPacket.oppCap2, hi]

private theorem selectedFourClass_inter_capByIndex_at_v2_card_le_one
    {A : Finset ℝ²} (S : SurplusCapPacket A) (hconv : ConvexIndep A)
    (i : Fin 3) {center : ℝ²} (K : SelectedFourClass A center)
    (hcenter : center = (S.triangleByIndex i).v2) :
    (K.support ∩ S.capByIndex i).card ≤ 1 := by
  have hsub : K.support ∩ S.capByIndex i ⊆
      SelectedClass A (S.triangleByIndex i).v2 K.radius ∩ S.capByIndex i := by
    intro x hx
    exact Finset.mem_inter.mpr ⟨mem_selectedClass.mpr
      ⟨K.support_subset_A (Finset.mem_inter.mp hx).1, by
        rw [← hcenter]
        exact K.support_eq_radius x (Finset.mem_inter.mp hx).1⟩,
      (Finset.mem_inter.mp hx).2⟩
  exact (Finset.card_le_card hsub).trans
    (S.capByIndex_sameRadius_at_v2_card_le_one_of_convexIndep
      hconv i K.radius)

private theorem selectedFourClass_inter_capByIndex_at_v3_card_le_one
    {A : Finset ℝ²} (S : SurplusCapPacket A) (hconv : ConvexIndep A)
    (i : Fin 3) {center : ℝ²} (K : SelectedFourClass A center)
    (hcenter : center = (S.triangleByIndex i).v3) :
    (K.support ∩ S.capByIndex i).card ≤ 1 := by
  have hsub : K.support ∩ S.capByIndex i ⊆
      SelectedClass A (S.triangleByIndex i).v3 K.radius ∩ S.capByIndex i := by
    intro x hx
    exact Finset.mem_inter.mpr ⟨mem_selectedClass.mpr
      ⟨K.support_subset_A (Finset.mem_inter.mp hx).1, by
        rw [← hcenter]
        exact K.support_eq_radius x (Finset.mem_inter.mp hx).1⟩,
      (Finset.mem_inter.mp hx).2⟩
  exact (Finset.card_le_card hsub).trans
    (S.capByIndex_sameRadius_at_v3_card_le_one_of_convexIndep
      hconv i K.radius)

private theorem allOne_row_middleBlock_count_ule
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
    (family : Fin 3) (center : Fin 13) (bound : Fin 4)
    (hbound : ((I.sourceClass family center).support ∩ S.surplusCap).card ≤
      bound.val) :
    (allOneMiddleBlockBitCount fun point ↦
      rowBit I.sourceRows family.val center.val point.val).ule
        (BitVec.ofNat 4 bound.val) = true := by
  apply allOneMiddleBlockBitCount_ule_of_filter_card_le
  rw [indexBlockFilter_card P (I.sourceClass family center).support S.surplusCap
    (fun point ↦ rowBit I.sourceRows family.val center.val point.val)
    (fun i ↦ (4 : Fin 13) ≤ i ∧ i ≤ (8 : Fin 13))
    (I.sourceClass family center).support_subset_A]
  · exact hbound
  · intro i
    simp only [rowBit_sourceRows, sourceRowMember, decide_eq_true_eq]
  · intro i
    exact (P.surplusCap_mem_iff_middle_block i).symm

private theorem allOne_row_finalWrapBlock_count_ule
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
    (family : Fin 3) (center : Fin 13) (bound : Fin 4)
    (hbound : ((I.sourceClass family center).support ∩ S.oppCap1).card ≤
      bound.val) :
    (allOneFinalWrapBlockBitCount fun point ↦
      rowBit I.sourceRows family.val center.val point.val).ule
        (BitVec.ofNat 4 bound.val) = true := by
  apply allOneFinalWrapBlockBitCount_ule_of_filter_card_le
  rw [indexBlockFilter_card P (I.sourceClass family center).support S.oppCap1
    (fun point ↦ rowBit I.sourceRows family.val center.val point.val)
    (fun i ↦ i = 0 ∨ (8 : Fin 13) ≤ i)
    (I.sourceClass family center).support_subset_A]
  · exact hbound
  · intro i
    simp only [rowBit_sourceRows, sourceRowMember, decide_eq_true_eq]
  · intro i
    exact (P.firstOppCap_mem_iff_final_wrap i).symm

private theorem allOne_row_initialBlock_count_ule
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
    (family : Fin 3) (center : Fin 13) (bound : Fin 4)
    (hbound : ((I.sourceClass family center).support ∩ S.oppCap2).card ≤
      bound.val) :
    (allOneInitialBlockBitCount fun point ↦
      rowBit I.sourceRows family.val center.val point.val).ule
        (BitVec.ofNat 4 bound.val) = true := by
  apply allOneInitialBlockBitCount_ule_of_filter_card_le
  rw [indexBlockFilter_card P (I.sourceClass family center).support S.oppCap2
    (fun point ↦ rowBit I.sourceRows family.val center.val point.val)
    (fun i ↦ i ≤ (4 : Fin 13))
    (I.sourceClass family center).support_subset_A]
  · exact hbound
  · intro i
    simp only [rowBit_sourceRows, sourceRowMember, decide_eq_true_eq]
  · intro i
    exact (P.secondOppCap_mem_iff_initial_block i).symm

theorem allOne_row_middleBlock_count_le_two
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
    (family : Fin 3) (center : Fin 13)
    (hcenter : (4 : Fin 13) ≤ center ∧ center ≤ (8 : Fin 13)) :
    (allOneMiddleBlockBitCount fun point ↦
      rowBit I.sourceRows family.val center.val point.val).ule 2#4 = true := by
  apply allOne_row_middleBlock_count_ule I family center 2
  rw [← capByIndex_surplus_eq S]
  have hcenterCap : P.point center ∈ S.capByIndex S.surplusIdx := by
    rw [capByIndex_surplus_eq S]
    exact (P.surplusCap_mem_iff_middle_block center).2 hcenter
  exact CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two
    S D.convex S.surplusIdx (I.sourceClass family center)
    hcenterCap

theorem allOne_row_finalWrapBlock_count_le_two
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
    (family : Fin 3) (center : Fin 13)
    (hcenter : center = 0 ∨ (8 : Fin 13) ≤ center) :
    (allOneFinalWrapBlockBitCount fun point ↦
      rowBit I.sourceRows family.val center.val point.val).ule 2#4 = true := by
  apply allOne_row_finalWrapBlock_count_ule I family center 2
  rw [← capByIndex_firstOpp_eq S]
  have hcenterCap : P.point center ∈ S.capByIndex S.oppIndex1 := by
    rw [capByIndex_firstOpp_eq S]
    exact (P.firstOppCap_mem_iff_final_wrap center).2 hcenter
  exact CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two
    S D.convex S.oppIndex1 (I.sourceClass family center)
    hcenterCap

theorem allOne_row_initialBlock_count_le_two
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
    (family : Fin 3) (center : Fin 13) (hcenter : center ≤ (4 : Fin 13)) :
    (allOneInitialBlockBitCount fun point ↦
      rowBit I.sourceRows family.val center.val point.val).ule 2#4 = true := by
  apply allOne_row_initialBlock_count_ule I family center 2
  rw [← capByIndex_secondOpp_eq S]
  have hcenterCap : P.point center ∈ S.capByIndex S.oppIndex2 := by
    rw [capByIndex_secondOpp_eq S]
    exact (P.secondOppCap_mem_iff_initial_block center).2 hcenter
  exact CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two
    S D.convex S.oppIndex2 (I.sourceClass family center)
    hcenterCap

theorem allOne_row_middleBlock_count_le_one
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
    (family : Fin 3) (center : Fin 13) (hcenter : center = 4 ∨ center = 8) :
    (allOneMiddleBlockBitCount fun point ↦
      rowBit I.sourceRows family.val center.val point.val).ule 1#4 = true := by
  apply allOne_row_middleBlock_count_ule I family center 1
  rw [← capByIndex_surplus_eq S]
  rcases hcenter with rfl | rfl
  · apply selectedFourClass_inter_capByIndex_at_v2_card_le_one S D.convex
    exact P.firstApex_at_four.trans
      (S.triangleByIndex_surplusIdx_v2_eq_oppositeVertexByIndex_oppIndex1).symm
  · apply selectedFourClass_inter_capByIndex_at_v3_card_le_one S D.convex
    exact P.secondApex_at_eight.trans
      (S.triangleByIndex_surplusIdx_v3_eq_oppositeVertexByIndex_oppIndex2).symm

theorem allOne_row_finalWrapBlock_count_le_one
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
    (family : Fin 3) (center : Fin 13) (hcenter : center = 8 ∨ center = 0) :
    (allOneFinalWrapBlockBitCount fun point ↦
      rowBit I.sourceRows family.val center.val point.val).ule 1#4 = true := by
  apply allOne_row_finalWrapBlock_count_ule I family center 1
  rw [← capByIndex_firstOpp_eq S]
  rcases hcenter with rfl | rfl
  · apply selectedFourClass_inter_capByIndex_at_v2_card_le_one S D.convex
    exact P.secondApex_at_eight.trans
      (S.triangleByIndex_oppIndex1_v2_eq_oppositeVertexByIndex_oppIndex2).symm
  · apply selectedFourClass_inter_capByIndex_at_v3_card_le_one S D.convex
    exact P.surplusOpposite_at_zero.trans
      (S.triangleByIndex_oppIndex1_v3_eq_oppositeVertexByIndex_surplusIdx).symm

theorem allOne_row_initialBlock_count_le_one
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
    (family : Fin 3) (center : Fin 13) (hcenter : center = 0 ∨ center = 4) :
    (allOneInitialBlockBitCount fun point ↦
      rowBit I.sourceRows family.val center.val point.val).ule 1#4 = true := by
  apply allOne_row_initialBlock_count_ule I family center 1
  rw [← capByIndex_secondOpp_eq S]
  rcases hcenter with rfl | rfl
  · apply selectedFourClass_inter_capByIndex_at_v2_card_le_one S D.convex
    exact P.surplusOpposite_at_zero.trans
      (S.triangleByIndex_oppIndex2_v2_eq_oppositeVertexByIndex_surplusIdx).symm
  · apply selectedFourClass_inter_capByIndex_at_v3_card_le_one S D.convex
    exact P.firstApex_at_four.trans
      (S.triangleByIndex_oppIndex2_v3_eq_oppositeVertexByIndex_oppIndex1).symm

private theorem allOne_firstRow_middleBlock_count_ule
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {P : CanonicalCard13Frame profile}
    {star : PhysicalGlobalCrossDeletionStar profile}
    {hall : AllPhysicalActualCriticalRowsOneHit H profile}
    {first : FirstApexShellRolePacket F R}
    (T : CanonicalAllOneSemanticRowTable P star hall first)
    (bound : Fin 4)
    (hbound : (T.firstApexDoubleRow.support ∩ S.surplusCap).card ≤
      bound.val) :
    (allOneMiddleBlockBitCount fun point ↦
      firstRowBit (sourceFirstApexRow T) point.val).ule
        (BitVec.ofNat 4 bound.val) = true := by
  apply allOneMiddleBlockBitCount_ule_of_filter_card_le
  rw [indexBlockFilter_card P T.firstApexDoubleRow.support S.surplusCap
    (fun point ↦ firstRowBit (sourceFirstApexRow T) point.val)
    (fun i ↦ (4 : Fin 13) ≤ i ∧ i ≤ (8 : Fin 13))
    T.firstApexDoubleRow.support_subset_A]
  · exact hbound
  · intro i
    simp only [firstRowBit_sourceFirstApexRow, decide_eq_true_eq]
  · intro i
    exact (P.surplusCap_mem_iff_middle_block i).symm

private theorem allOne_firstRow_initialBlock_count_ule
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {P : CanonicalCard13Frame profile}
    {star : PhysicalGlobalCrossDeletionStar profile}
    {hall : AllPhysicalActualCriticalRowsOneHit H profile}
    {first : FirstApexShellRolePacket F R}
    (T : CanonicalAllOneSemanticRowTable P star hall first)
    (bound : Fin 4)
    (hbound : (T.firstApexDoubleRow.support ∩ S.oppCap2).card ≤
      bound.val) :
    (allOneInitialBlockBitCount fun point ↦
      firstRowBit (sourceFirstApexRow T) point.val).ule
        (BitVec.ofNat 4 bound.val) = true := by
  apply allOneInitialBlockBitCount_ule_of_filter_card_le
  rw [indexBlockFilter_card P T.firstApexDoubleRow.support S.oppCap2
    (fun point ↦ firstRowBit (sourceFirstApexRow T) point.val)
    (fun i ↦ i ≤ (4 : Fin 13))
    T.firstApexDoubleRow.support_subset_A]
  · exact hbound
  · intro i
    simp only [firstRowBit_sourceFirstApexRow, decide_eq_true_eq]
  · intro i
    exact (P.secondOppCap_mem_iff_initial_block i).symm

theorem allOne_firstRow_middleBlock_count_le_one
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {P : CanonicalCard13Frame profile}
    {star : PhysicalGlobalCrossDeletionStar profile}
    {hall : AllPhysicalActualCriticalRowsOneHit H profile}
    {first : FirstApexShellRolePacket F R}
    (T : CanonicalAllOneSemanticRowTable P star hall first) :
    (allOneMiddleBlockBitCount fun point ↦
      firstRowBit (sourceFirstApexRow T) point.val).ule 1#4 = true := by
  apply allOne_firstRow_middleBlock_count_ule T 1
  rw [← capByIndex_surplus_eq S]
  apply selectedFourClass_inter_capByIndex_at_v2_card_le_one S D.convex
  exact P.firstApex_at_four.trans
    (S.triangleByIndex_surplusIdx_v2_eq_oppositeVertexByIndex_oppIndex1).symm

theorem allOne_firstRow_initialBlock_count_le_one
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {P : CanonicalCard13Frame profile}
    {star : PhysicalGlobalCrossDeletionStar profile}
    {hall : AllPhysicalActualCriticalRowsOneHit H profile}
    {first : FirstApexShellRolePacket F R}
    (T : CanonicalAllOneSemanticRowTable P star hall first) :
    (allOneInitialBlockBitCount fun point ↦
      firstRowBit (sourceFirstApexRow T) point.val).ule 1#4 = true := by
  apply allOne_firstRow_initialBlock_count_ule T 1
  rw [← capByIndex_secondOpp_eq S]
  apply selectedFourClass_inter_capByIndex_at_v3_card_le_one S D.convex
  exact P.firstApex_at_four.trans
    (S.triangleByIndex_oppIndex2_v3_eq_oppositeVertexByIndex_oppIndex1).symm

private theorem allOne_shell_middleBlock_count_le_one
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {P : CanonicalCard13Frame profile}
    {star : PhysicalGlobalCrossDeletionStar profile}
    {hall : AllPhysicalActualCriticalRowsOneHit H profile}
    {first : FirstApexShellRolePacket F R}
    (T : CanonicalAllOneSemanticRowTable P star hall first) :
    (allOneMiddleBlockBitCount fun point ↦
      shellBit (sourceShell T) point.val).ule 1#4 = true := by
  have hcard : (Finset.univ.filter fun i ↦
      shellBit (sourceShell T) i.val = true ∧
        (4 : Fin 13) ≤ i ∧ i ≤ (8 : Fin 13)).card ≤ 1 := by
    rw [indexBlockFilter_card P
      (SelectedClass D.A S.oppApex2 profile.radius) S.surplusCap
      (fun point ↦ shellBit (sourceShell T) point.val)
      (fun i ↦ (4 : Fin 13) ≤ i ∧ i ≤ (8 : Fin 13))]
    · exact _root_.Problem97.ATailSecondApexClassOneHit.selectedClass_oppApex2_inter_surplusCap_card_le_one
        S profile.radius
    · intro x hx
      exact (mem_selectedClass.mp hx).1
    · intro i
      rw [shellBit_sourceShell]
      simpa only [decide_eq_true_eq] using T.exactFiveShell_mem_iff i
    · intro i
      exact (P.surplusCap_mem_iff_middle_block i).symm
  simpa using allOneMiddleBlockBitCount_ule_of_filter_card_le
    (fun point ↦ shellBit (sourceShell T) point.val) (1 : Fin 4) hcard

private theorem allOne_shell_finalWrapBlock_count_le_one
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {P : CanonicalCard13Frame profile}
    {star : PhysicalGlobalCrossDeletionStar profile}
    {hall : AllPhysicalActualCriticalRowsOneHit H profile}
    {first : FirstApexShellRolePacket F R}
    (T : CanonicalAllOneSemanticRowTable P star hall first) :
    (allOneFinalWrapBlockBitCount fun point ↦
      shellBit (sourceShell T) point.val).ule 1#4 = true := by
  have hcard : (Finset.univ.filter fun i ↦
      shellBit (sourceShell T) i.val = true ∧
        (i = 0 ∨ (8 : Fin 13) ≤ i)).card ≤ 1 := by
    rw [indexBlockFilter_card P
      (SelectedClass D.A S.oppApex2 profile.radius) S.oppCap1
      (fun point ↦ shellBit (sourceShell T) point.val)
      (fun i ↦ i = 0 ∨ (8 : Fin 13) ≤ i)]
    · exact _root_.Problem97.ATailSecondApexClassOneHit.selectedClass_oppApex2_inter_oppCap1_card_le_one
        S profile.radius
    · intro x hx
      exact (mem_selectedClass.mp hx).1
    · intro i
      rw [shellBit_sourceShell]
      simpa only [decide_eq_true_eq] using T.exactFiveShell_mem_iff i
    · intro i
      exact (P.firstOppCap_mem_iff_final_wrap i).symm
  simpa using allOneFinalWrapBlockBitCount_ule_of_filter_card_le
    (fun point ↦ shellBit (sourceShell T) point.val) (1 : Fin 4) hcard

private theorem allOne_shell_strict_counts_eq_one_of_packet
    (member : Fin 13 → Bool)
    (hcard : (allOneBitCount13 member == 5#4) = true)
    (h1 : member 1 = true) (h2 : member 2 = true) (h3 : member 3 = true)
    (h8 : member 8 = false)
    (hmiddle : (allOneMiddleBlockBitCount member).ule 1#4 = true)
    (hfinal : (allOneFinalWrapBlockBitCount member).ule 1#4 = true) :
    (allOneMiddleStrictBitCount member == 1#4) = true ∧
      (allOneFinalStrictBitCount member == 1#4) = true := by
  native_decide +revert

theorem allOne_shell_center_excluded
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {P : CanonicalCard13Frame profile}
    {star : PhysicalGlobalCrossDeletionStar profile}
    {hall : AllPhysicalActualCriticalRowsOneHit H profile}
    {first : FirstApexShellRolePacket F R}
    (T : CanonicalAllOneSemanticRowTable P star hall first) :
    (!(shellBit (sourceShell T) 8)) = true := by
  rw [show shellBit (sourceShell T) 8 =
    decide ((8 : Fin 13) ∈ T.exactFiveShell) from shellBit_sourceShell T 8]
  simp only [Bool.not_eq_true_eq_eq_false, decide_eq_false_iff_not]
  intro height
  have hselected := (T.exactFiveShell_mem_iff 8).1 height
  have hcenter : P.point 8 = S.oppApex2 :=
    P.secondApex_at_eight.trans
      (physicalSecondApex_eq_oppositeVertexByIndex S).symm
  have hdist := (mem_selectedClass.mp hselected).2
  rw [hcenter] at hdist
  rw [dist_self] at hdist
  exact (ne_of_gt profile.radius_pos) hdist.symm

theorem allOne_shell_card_eq_five
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {P : CanonicalCard13Frame profile}
    {star : PhysicalGlobalCrossDeletionStar profile}
    {hall : AllPhysicalActualCriticalRowsOneHit H profile}
    {first : FirstApexShellRolePacket F R}
    (T : CanonicalAllOneSemanticRowTable P star hall first) :
    ((allOneBitCount13 fun point ↦
      shellBit (sourceShell T) point.val) == 5#4) = true := by
  apply allOneBitCount13_eq_five_of_filter_card_eq_five
  simpa only [shellBit_sourceShell, decide_eq_true_eq, Finset.filter_mem_eq_inter,
    Finset.univ_inter] using T.exactFiveShell_card

theorem allOne_physical_shell_mem
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {P : CanonicalCard13Frame profile}
    {star : PhysicalGlobalCrossDeletionStar profile}
    {hall : AllPhysicalActualCriticalRowsOneHit H profile}
    {first : FirstApexShellRolePacket F R}
    (T : CanonicalAllOneSemanticRowTable P star hall first)
    (point : Fin 13) (hpoint : point ∈ strictPhysicalIndices13) :
    shellBit (sourceShell T) point.val = true := by
  simp only [shellBit_sourceShell, decide_eq_true_eq]
  exact T.physical_index_mem_exactFiveShell point hpoint

theorem allOne_shell_strict_counts_eq_one
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {P : CanonicalCard13Frame profile}
    {star : PhysicalGlobalCrossDeletionStar profile}
    {hall : AllPhysicalActualCriticalRowsOneHit H profile}
    {first : FirstApexShellRolePacket F R}
    (T : CanonicalAllOneSemanticRowTable P star hall first) :
    (allOneMiddleStrictBitCount (fun point ↦
      shellBit (sourceShell T) point.val) == 1#4) = true ∧
      (allOneFinalStrictBitCount (fun point ↦
        shellBit (sourceShell T) point.val) == 1#4) = true := by
  apply allOne_shell_strict_counts_eq_one_of_packet
  · exact allOne_shell_card_eq_five T
  · exact allOne_physical_shell_mem T 1 (by decide)
  · exact allOne_physical_shell_mem T 2 (by decide)
  · exact allOne_physical_shell_mem T 3 (by decide)
  · simpa only [Bool.not_eq_true_eq_eq_false] using
      allOne_shell_center_excluded T
  · exact allOne_shell_middleBlock_count_le_one T
  · exact allOne_shell_finalWrapBlock_count_le_one T

theorem allOne_secondApex_row_implies_shell
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
    (family : Fin 3) (point : Fin 13) :
    (!(rowBit I.sourceRows family.val 8 point.val) ||
      shellBit (sourceShell T) point.val) = true := by
  change (!(rowBit I.sourceRows family.val (8 : Fin 13).val point.val) ||
    shellBit (sourceShell T) point.val) = true
  rw [rowBit_sourceRows I family (8 : Fin 13) point,
    shellBit_sourceShell T point]
  rw [Bool.or_eq_true]
  by_cases hpoint : P.point point ∈ (I.sourceClass family 8).support
  · exact Or.inr <| by
      simp only [decide_eq_true_eq]
      exact I.sourceClass_secondApex_mem_exactFiveShell family point hpoint
  · exact Or.inl <| by simp [sourceRowMember, hpoint]

theorem allOne_frontierQ_outside_surplus_block
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {P : CanonicalCard13Frame profile}
    {star : PhysicalGlobalCrossDeletionStar profile}
    {hall : AllPhysicalActualCriticalRowsOneHit H profile}
    {first : FirstApexShellRolePacket F R}
    (T : CanonicalAllOneSemanticRowTable P star hall first) :
    allOneOutsideMiddleBlockBit (sourceQ T) = true := by
  exact allOneOutsideMiddleBlockBit_of_not_mem T.frontierQIndex
    (T.frontier_index_facts.2.1)

theorem allOne_frontierW_outside_surplus_block
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {P : CanonicalCard13Frame profile}
    {star : PhysicalGlobalCrossDeletionStar profile}
    {hall : AllPhysicalActualCriticalRowsOneHit H profile}
    {first : FirstApexShellRolePacket F R}
    (T : CanonicalAllOneSemanticRowTable P star hall first) :
    allOneOutsideMiddleBlockBit (sourceW T) = true := by
  exact allOneOutsideMiddleBlockBit_of_not_mem T.frontierWIndex
    (T.frontier_index_facts.2.2)

theorem allOne_frontierQ_main_firstApex_lookup
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {P : CanonicalCard13Frame profile}
    {star : PhysicalGlobalCrossDeletionStar profile}
    {hall : AllPhysicalActualCriticalRowsOneHit H profile}
    {first : FirstApexShellRolePacket F R}
    {T : CanonicalAllOneSemanticRowTable P star hall first}
    (I : CanonicalAllOneSourceOrbitIngress T) :
    allOneIndexLookupBit (sourceQ T)
      (fun point ↦ rowBit I.sourceRows 0 4 point.val) = true := by
  change allOneIndexLookupBit (BitVec.ofNat 4 T.frontierQIndex.val)
    (fun point ↦ rowBit I.sourceRows 0 4 point.val) = true
  rw [allOneIndexLookupBit_ofNat]
  rw [show rowBit I.sourceRows 0 4 T.frontierQIndex.val =
    I.sourceRowMember 0 4 T.frontierQIndex from
      rowBit_sourceRows I 0 4 T.frontierQIndex]
  simp only [sourceRowMember, sourceClass_zero, decide_eq_true_eq]
  exact T.frontier_parent_row_facts.1

theorem allOne_frontierW_main_firstApex_lookup
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {P : CanonicalCard13Frame profile}
    {star : PhysicalGlobalCrossDeletionStar profile}
    {hall : AllPhysicalActualCriticalRowsOneHit H profile}
    {first : FirstApexShellRolePacket F R}
    {T : CanonicalAllOneSemanticRowTable P star hall first}
    (I : CanonicalAllOneSourceOrbitIngress T) :
    allOneIndexLookupBit (sourceW T)
      (fun point ↦ rowBit I.sourceRows 0 4 point.val) = true := by
  change allOneIndexLookupBit (BitVec.ofNat 4 T.frontierWIndex.val)
    (fun point ↦ rowBit I.sourceRows 0 4 point.val) = true
  rw [allOneIndexLookupBit_ofNat]
  rw [show rowBit I.sourceRows 0 4 T.frontierWIndex.val =
    I.sourceRowMember 0 4 T.frontierWIndex from
      rowBit_sourceRows I 0 4 T.frontierWIndex]
  simp only [sourceRowMember, sourceClass_zero, decide_eq_true_eq]
  exact T.frontier_parent_row_facts.2.1

theorem allOne_frontierQ_main_secondApex_lookup_false
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {P : CanonicalCard13Frame profile}
    {star : PhysicalGlobalCrossDeletionStar profile}
    {hall : AllPhysicalActualCriticalRowsOneHit H profile}
    {first : FirstApexShellRolePacket F R}
    {T : CanonicalAllOneSemanticRowTable P star hall first}
    (I : CanonicalAllOneSourceOrbitIngress T) :
    allOneIndexLookupBit (sourceQ T)
      (fun point ↦ rowBit I.sourceRows 0 8 point.val) = false := by
  change allOneIndexLookupBit (BitVec.ofNat 4 T.frontierQIndex.val)
    (fun point ↦ rowBit I.sourceRows 0 8 point.val) = false
  rw [allOneIndexLookupBit_ofNat]
  rw [show rowBit I.sourceRows 0 8 T.frontierQIndex.val =
    I.sourceRowMember 0 8 T.frontierQIndex from
      rowBit_sourceRows I 0 8 T.frontierQIndex]
  simp only [sourceRowMember, sourceClass_zero, decide_eq_false_iff_not]
  exact T.frontier_parent_row_facts.2.2.1

theorem allOne_frontierW_main_secondApex_lookup_false
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {P : CanonicalCard13Frame profile}
    {star : PhysicalGlobalCrossDeletionStar profile}
    {hall : AllPhysicalActualCriticalRowsOneHit H profile}
    {first : FirstApexShellRolePacket F R}
    {T : CanonicalAllOneSemanticRowTable P star hall first}
    (I : CanonicalAllOneSourceOrbitIngress T) :
    allOneIndexLookupBit (sourceW T)
      (fun point ↦ rowBit I.sourceRows 0 8 point.val) = false := by
  change allOneIndexLookupBit (BitVec.ofNat 4 T.frontierWIndex.val)
    (fun point ↦ rowBit I.sourceRows 0 8 point.val) = false
  rw [allOneIndexLookupBit_ofNat]
  rw [show rowBit I.sourceRows 0 8 T.frontierWIndex.val =
    I.sourceRowMember 0 8 T.frontierWIndex from
      rowBit_sourceRows I 0 8 T.frontierWIndex]
  simp only [sourceRowMember, sourceClass_zero, decide_eq_false_iff_not]
  exact T.frontier_parent_row_facts.2.2.2.1

theorem allOne_firstApexDoubleRow_card_eq_four
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {P : CanonicalCard13Frame profile}
    {star : PhysicalGlobalCrossDeletionStar profile}
    {hall : AllPhysicalActualCriticalRowsOneHit H profile}
    {first : FirstApexShellRolePacket F R}
    (T : CanonicalAllOneSemanticRowTable P star hall first) :
    ((allOneBitCount13 fun point ↦
      firstRowBit (sourceFirstApexRow T) point.val) == 4#4) = true := by
  apply allOneBitCount13_eq_four_of_filter_card_eq_four
  rw [show (Finset.univ.filter fun i : Fin 13 ↦
      firstRowBit (sourceFirstApexRow T) i.val = true).card =
      T.firstApexDoubleRow.support.card by
    simpa only [firstRowBit_sourceFirstApexRow] using
      supportIndexFilter_card P T.firstApexDoubleRow]
  exact T.firstApexDoubleRow.support_card

theorem allOne_firstApexDoubleRow_center_excluded
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {P : CanonicalCard13Frame profile}
    {star : PhysicalGlobalCrossDeletionStar profile}
    {hall : AllPhysicalActualCriticalRowsOneHit H profile}
    {first : FirstApexShellRolePacket F R}
    (T : CanonicalAllOneSemanticRowTable P star hall first) :
    (!(firstRowBit (sourceFirstApexRow T) 4)) = true := by
  rw [show firstRowBit (sourceFirstApexRow T) 4 =
    decide (P.point 4 ∈ T.firstApexDoubleRow.support) from
      firstRowBit_sourceFirstApexRow T 4]
  simp only [Bool.not_eq_true_eq_eq_false, decide_eq_false_iff_not]
  exact T.firstApexDoubleRow.center_not_mem

theorem allOne_frontierQ_firstRow_omission_at
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {P : CanonicalCard13Frame profile}
    {star : PhysicalGlobalCrossDeletionStar profile}
    {hall : AllPhysicalActualCriticalRowsOneHit H profile}
    {first : FirstApexShellRolePacket F R}
    (T : CanonicalAllOneSemanticRowTable P star hall first) (point : Fin 13) :
    (!((sourceQ T) == BitVec.ofNat 4 point.val) ||
      !(firstRowBit (sourceFirstApexRow T) point.val)) = true := by
  apply allOneIndexOmissionClause_of_false T.frontierQIndex point
  simp only [firstRowBit_sourceFirstApexRow, decide_eq_false_iff_not]
  exact T.frontier_parent_row_facts.2.2.2.2.1

theorem allOne_frontierW_firstRow_omission_at
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {P : CanonicalCard13Frame profile}
    {star : PhysicalGlobalCrossDeletionStar profile}
    {hall : AllPhysicalActualCriticalRowsOneHit H profile}
    {first : FirstApexShellRolePacket F R}
    (T : CanonicalAllOneSemanticRowTable P star hall first) (point : Fin 13) :
    (!((sourceW T) == BitVec.ofNat 4 point.val) ||
      !(firstRowBit (sourceFirstApexRow T) point.val)) = true := by
  apply allOneIndexOmissionClause_of_false T.frontierWIndex point
  simp only [firstRowBit_sourceFirstApexRow, decide_eq_false_iff_not]
  exact T.frontier_parent_row_facts.2.2.2.2.2

/-- The middle hub's left source family omits the edge `(2,1)`. -/
theorem allOne_middle_left_edge_omission
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {P : CanonicalCard13Frame profile}
    {star : PhysicalGlobalCrossDeletionStar profile}
    {hall : AllPhysicalActualCriticalRowsOneHit H profile}
    {first : FirstApexShellRolePacket F R}
    {T : CanonicalAllOneSemanticRowTable P star hall first}
    (C : CanonicalAlignedCoverFamilies T 2 1 3) (center : Fin 13) :
    (!((rowBit (CanonicalAllOneSourceOrbitIngress.middle C).sourceRows
          1 center.val 2) &&
        rowBit (CanonicalAllOneSourceOrbitIngress.middle C).sourceRows
          1 center.val 1)) = true := by
  change (!((rowBit (CanonicalAllOneSourceOrbitIngress.middle C).sourceRows
      (1 : Fin 3).val center.val (2 : Fin 13).val) &&
    rowBit (CanonicalAllOneSourceOrbitIngress.middle C).sourceRows
      (1 : Fin 3).val center.val (1 : Fin 13).val)) = true
  rw [rowBit_sourceRows, rowBit_sourceRows]
  simp only [sourceRowMember, sourceClass_middle_one,
    Bool.not_eq_true_eq_eq_false, Bool.and_eq_false_iff,
    decide_eq_false_iff_not]
  exact C.left_omits center

/-- The middle hub's right source family omits the edge `(2,3)`. -/
theorem allOne_middle_right_edge_omission
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {P : CanonicalCard13Frame profile}
    {star : PhysicalGlobalCrossDeletionStar profile}
    {hall : AllPhysicalActualCriticalRowsOneHit H profile}
    {first : FirstApexShellRolePacket F R}
    {T : CanonicalAllOneSemanticRowTable P star hall first}
    (C : CanonicalAlignedCoverFamilies T 2 1 3) (center : Fin 13) :
    (!((rowBit (CanonicalAllOneSourceOrbitIngress.middle C).sourceRows
          2 center.val 2) &&
        rowBit (CanonicalAllOneSourceOrbitIngress.middle C).sourceRows
          2 center.val 3)) = true := by
  change (!((rowBit (CanonicalAllOneSourceOrbitIngress.middle C).sourceRows
      (2 : Fin 3).val center.val (2 : Fin 13).val) &&
    rowBit (CanonicalAllOneSourceOrbitIngress.middle C).sourceRows
      (2 : Fin 3).val center.val (3 : Fin 13).val)) = true
  rw [rowBit_sourceRows, rowBit_sourceRows]
  simp only [sourceRowMember, sourceClass_middle_two,
    Bool.not_eq_true_eq_eq_false, Bool.and_eq_false_iff,
    decide_eq_false_iff_not]
  exact C.right_omits center

/-- The fixed shell for one physical source omits either of the other two
physical vertices, expressed through the packed blocker lookup. -/
theorem allOne_fixedBlocker_main_omission_lookup
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {P : CanonicalCard13Frame profile}
    {star : PhysicalGlobalCrossDeletionStar profile}
    {hall : AllPhysicalActualCriticalRowsOneHit H profile}
    {first : FirstApexShellRolePacket F R}
    {T : CanonicalAllOneSemanticRowTable P star hall first}
    (I : CanonicalAllOneSourceOrbitIngress T) (source target : Fin 13)
    (hsource : source ∈ strictPhysicalIndices13)
    (htarget : target ∈ strictPhysicalIndices13) (hne : source ≠ target) :
    (!(allOneIndexLookupBit (blockerAt (sourceBlockers T) source.val)
      (fun center ↦ rowBit I.sourceRows 0 center.val target.val))) = true := by
  rw [show blockerAt (sourceBlockers T) source.val =
    BitVec.ofNat 4 (T.blockerIndex source).val from
      blockerAt_packThirteenBlockers _ source]
  rw [allOneIndexLookupBit_ofNat]
  rw [show rowBit I.sourceRows 0 (T.blockerIndex source).val target.val =
    I.sourceRowMember 0 (T.blockerIndex source) target from
      rowBit_sourceRows I 0 (T.blockerIndex source) target]
  simp only [sourceRowMember, sourceClass_zero,
    Bool.not_eq_true_eq_eq_false, decide_eq_false_iff_not]
  exact T.fixed_blocker_main_omits_other_physical hsource htarget hne

#print axioms allOne_secondApex_row_implies_shell
#print axioms allOne_frontierQ_main_firstApex_lookup
#print axioms allOne_middle_left_edge_omission
#print axioms allOne_fixedBlocker_main_omission_lookup

end

end ATailExactFiveCard13AllOneSourceIngressScratch
end Problem97
