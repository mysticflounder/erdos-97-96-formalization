/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import DirectFlatSourceIngress

/-!
# Source proofs for the first direct card-thirteen certificate block

This module proves the source assertions `h0000` through `h0144` used by the
direct flat certificate.  The proofs stay at the semantic-row boundary: the
only finite computation below checks Boolean counting identities on thirteen
bits, while every row incidence and geometric exclusion is derived from the
source objects.
-/

namespace Problem97
namespace ATailExactFiveCard13CnfIngressScratch

open scoped EuclideanGeometry

open ATailCriticalPairFrontier
open ATailBiApexRobustCapBounds
open ATailCapApexRadiusRigidity
open ATailExactFiveCard13CommonLabelTransportScratch
open ATailExactFiveGlobalCrossDeletionPair
open ATailExactFiveGlobalCoverStarGeometry
open ATailExactFiveMutualOneHitGeometry
open ATailFirstApexShellRole
open ATailLargeCapUniqueFive
open ATailLargeCapUniqueFivePhysicalOmissionCycle
open ATailLargeCapUniqueFivePhysicalOmissionTransitionGlobal
open ATailOrientedPhysicalApexIngress
open ATailParentExactFiveSecondCap
open ATailPhysicalSecondApexCommonDeletion
open CanonicalAsymmetricSemanticRowTable

attribute [local instance] Classical.propDecidable

noncomputable section

/-- Interpret a generated family index as its source selected four-class. -/
def directSourceClass
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    {Q : FrontierBiApexRobustExactFiveSecondCapResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {M : PhysicalActualCriticalMutualOmissionPair H profile}
    {N : SourceTwoHitNormalForm Q profile M}
    {P : CanonicalAsymmetricRolePrepacket N}
    {star : PhysicalGlobalCrossDeletionStar profile}
    {first : FirstApexShellRolePacket F R}
    {T : CanonicalAsymmetricSemanticRowTable P star first}
    (C : CanonicalCoverFamilies T) (family : Fin 3) (center : Fin 13) :
    SelectedFourClass D.A (P.point center) :=
  if family = 0 then T.main center
  else if family = 1 then C.left center
  else C.right center

@[simp] theorem directSourceRowMember_eq_decide_mem
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    {Q : FrontierBiApexRobustExactFiveSecondCapResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {M : PhysicalActualCriticalMutualOmissionPair H profile}
    {N : SourceTwoHitNormalForm Q profile M}
    {P : CanonicalAsymmetricRolePrepacket N}
    {star : PhysicalGlobalCrossDeletionStar profile}
    {first : FirstApexShellRolePacket F R}
    {T : CanonicalAsymmetricSemanticRowTable P star first}
    (C : CanonicalCoverFamilies T) (family : Fin 3) (center point : Fin 13) :
    directSourceRowMember C family center point =
      decide (P.point point ∈ (directSourceClass C family center).support) := by
  fin_cases family <;> simp [directSourceRowMember, directSourceClass]

/-- The generated left-associated four-bit population count on thirteen bits. -/
def bitCount13 (member : Fin 13 → Bool) : BitVec 4 :=
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

/-- Finite Boolean bridge for exact-four source rows. -/
private theorem bitCount13_eq_four_of_filter_card_eq_four
    (member : Fin 13 → Bool)
    (hcard : (Finset.univ.filter fun i ↦ member i = true).card = 4) :
    (bitCount13 member == 4#4) = true := by
  native_decide +revert

/-- Finite Boolean bridge for the exact-five ambient shell. -/
private theorem bitCount13_eq_five_of_filter_card_eq_five
    (member : Fin 13 → Bool)
    (hcard : (Finset.univ.filter fun i ↦ member i = true).card = 5) :
    (bitCount13 member == 5#4) = true := by
  native_decide +revert

/-- Finite Boolean bridge for at-most-one subfamilies. -/
private theorem bitCount13_ule_one_of_filter_card_le_one
    (member : Fin 13 → Bool)
    (hcard : (Finset.univ.filter fun i ↦ member i = true).card ≤ 1) :
    (bitCount13 member).ule 1#4 = true := by
  native_decide +revert

/-- Finite Boolean bridge for at-most-two subfamilies. -/
private theorem bitCount13_ule_two_of_filter_card_le_two
    (member : Fin 13 → Bool)
    (hcard : (Finset.univ.filter fun i ↦ member i = true).card ≤ 2) :
    (bitCount13 member).ule 2#4 = true := by
  native_decide +revert

/-- Pulling a selected support back through the canonical bijection preserves
its cardinality. -/
private theorem supportIndexFilter_card
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    {Q : FrontierBiApexRobustExactFiveSecondCapResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {M : PhysicalActualCriticalMutualOmissionPair H profile}
    {N : SourceTwoHitNormalForm Q profile M}
    (P : CanonicalAsymmetricRolePrepacket N) {center : Fin 13}
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
theorem directSource_row_card_eq_four
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    {Q : FrontierBiApexRobustExactFiveSecondCapResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {M : PhysicalActualCriticalMutualOmissionPair H profile}
    {N : SourceTwoHitNormalForm Q profile M}
    {P : CanonicalAsymmetricRolePrepacket N}
    {star : PhysicalGlobalCrossDeletionStar profile}
    {first : FirstApexShellRolePacket F R}
    {T : CanonicalAsymmetricSemanticRowTable P star first}
    (C : CanonicalCoverFamilies T) (family : Fin 3) (center : Fin 13) :
    ((bitCount13 fun point ↦
      rowBit (directSourceRows C) family.val center.val point.val) == 4#4) = true := by
  rw [show (fun point : Fin 13 ↦
      rowBit (directSourceRows C) family.val center.val point.val) =
      (fun point ↦ decide
        (P.point point ∈ (directSourceClass C family center).support)) by
    funext point
    simp]
  apply bitCount13_eq_four_of_filter_card_eq_four
  rw [supportIndexFilter_card P (directSourceClass C family center)]
  exact (directSourceClass C family center).support_card

/-- Every packed source row omits its own center. -/
theorem directSource_row_center_excluded
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    {Q : FrontierBiApexRobustExactFiveSecondCapResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {M : PhysicalActualCriticalMutualOmissionPair H profile}
    {N : SourceTwoHitNormalForm Q profile M}
    {P : CanonicalAsymmetricRolePrepacket N}
    {star : PhysicalGlobalCrossDeletionStar profile}
    {first : FirstApexShellRolePacket F R}
    {T : CanonicalAsymmetricSemanticRowTable P star first}
    (C : CanonicalCoverFamilies T) (family : Fin 3) (center : Fin 13) :
    (!(rowBit (directSourceRows C) family.val center.val center.val)) = true := by
  simp only [rowBit_directSourceRows, directSourceRowMember_eq_decide_mem]
  rw [decide_eq_false_iff_not.mpr (directSourceClass C family center).center_not_mem]
  rfl

/-- A source row turns membership of two support points into the two
equal-radius equations used by cyclic nonalternation. -/
private theorem directSource_sharedPair_false_of_strict
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    {Q : FrontierBiApexRobustExactFiveSecondCapResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {M : PhysicalActualCriticalMutualOmissionPair H profile}
    {N : SourceTwoHitNormalForm Q profile M}
    {P : CanonicalAsymmetricRolePrepacket N}
    {star : PhysicalGlobalCrossDeletionStar profile}
    {first : FirstApexShellRolePacket F R}
    {T : CanonicalAsymmetricSemanticRowTable P star first}
    (C : CanonicalCoverFamilies T)
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
    (!((rowBit (directSourceRows C) family₁.val center₁.val point₁.val &&
        rowBit (directSourceRows C) family₁.val center₁.val point₂.val &&
        rowBit (directSourceRows C) family₂.val center₂.val point₁.val &&
        rowBit (directSourceRows C) family₂.val center₂.val point₂.val))) = true := by
  rw [Bool.not_eq_true_eq_eq_false, Bool.eq_false_iff]
  intro hall
  have hleft := (Bool.and_eq_true_iff.mp hall).1
  have h₂₂ := (Bool.and_eq_true_iff.mp hall).2
  have h₂₁ := (Bool.and_eq_true_iff.mp hleft).2
  have hfirst := (Bool.and_eq_true_iff.mp hleft).1
  have h₁₁ := (Bool.and_eq_true_iff.mp hfirst).1
  have h₁₂ := (Bool.and_eq_true_iff.mp hfirst).2
  simp only [rowBit_directSourceRows, directSourceRowMember_eq_decide_mem,
    decide_eq_true_eq] at h₁₁ h₁₂ h₂₁ h₂₂
  have hradius₁ :=
    (directSourceClass C family₁ center₁).support_eq_radius
      (P.point point₁) h₁₁
  have hradius₁' :=
    (directSourceClass C family₁ center₁).support_eq_radius
      (P.point point₂) h₁₂
  have hradius₂ :=
    (directSourceClass C family₂ center₂).support_eq_radius
      (P.point point₁) h₂₁
  have hradius₂' :=
    (directSourceClass C family₂ center₂).support_eq_radius
      (P.point point₂) h₂₂
  rcases hstrict with hstrict | hstrict <;> linarith

/-- Cyclic exclusion when the two centers precede the two shared points. -/
theorem directSource_sharedPair_centersBeforePoints
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    {Q : FrontierBiApexRobustExactFiveSecondCapResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {M : PhysicalActualCriticalMutualOmissionPair H profile}
    {N : SourceTwoHitNormalForm Q profile M}
    {P : CanonicalAsymmetricRolePrepacket N}
    {star : PhysicalGlobalCrossDeletionStar profile}
    {first : FirstApexShellRolePacket F R}
    {T : CanonicalAsymmetricSemanticRowTable P star first}
    (C : CanonicalCoverFamilies T)
    (family₁ family₂ : Fin 3) (center₁ center₂ point₁ point₂ : Fin 13)
    (h₁ : center₁ < center₂) (h₂ : center₂ < point₁) (h₃ : point₁ < point₂) :
    (!((rowBit (directSourceRows C) family₁.val center₁.val point₁.val &&
        rowBit (directSourceRows C) family₁.val center₁.val point₂.val &&
        rowBit (directSourceRows C) family₂.val center₂.val point₁.val &&
        rowBit (directSourceRows C) family₂.val center₂.val point₂.val))) = true := by
  apply directSource_sharedPair_false_of_strict C
  exact Or.inl (P.strictKalmanson h₁ h₂ h₃).1

/-- Cyclic exclusion when the two shared points precede the two centers. -/
theorem directSource_sharedPair_pointsBeforeCenters
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    {Q : FrontierBiApexRobustExactFiveSecondCapResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {M : PhysicalActualCriticalMutualOmissionPair H profile}
    {N : SourceTwoHitNormalForm Q profile M}
    {P : CanonicalAsymmetricRolePrepacket N}
    {star : PhysicalGlobalCrossDeletionStar profile}
    {first : FirstApexShellRolePacket F R}
    {T : CanonicalAsymmetricSemanticRowTable P star first}
    (C : CanonicalCoverFamilies T)
    (family₁ family₂ : Fin 3) (center₁ center₂ point₁ point₂ : Fin 13)
    (h₁ : point₁ < point₂) (h₂ : point₂ < center₁) (h₃ : center₁ < center₂) :
    (!((rowBit (directSourceRows C) family₁.val center₁.val point₁.val &&
        rowBit (directSourceRows C) family₁.val center₁.val point₂.val &&
        rowBit (directSourceRows C) family₂.val center₂.val point₁.val &&
        rowBit (directSourceRows C) family₂.val center₂.val point₂.val))) = true := by
  apply directSource_sharedPair_false_of_strict C
  have hk := P.strictKalmanson h₁ h₂ h₃
  exact Or.inl (by simpa [dist_comm, add_comm] using hk.1)

/-- Cyclic exclusion when the centers surround the two shared points. -/
theorem directSource_sharedPair_centersAroundPoints
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    {Q : FrontierBiApexRobustExactFiveSecondCapResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {M : PhysicalActualCriticalMutualOmissionPair H profile}
    {N : SourceTwoHitNormalForm Q profile M}
    {P : CanonicalAsymmetricRolePrepacket N}
    {star : PhysicalGlobalCrossDeletionStar profile}
    {first : FirstApexShellRolePacket F R}
    {T : CanonicalAsymmetricSemanticRowTable P star first}
    (C : CanonicalCoverFamilies T)
    (family₁ family₂ : Fin 3) (center₁ center₂ point₁ point₂ : Fin 13)
    (h₁ : center₁ < point₁) (h₂ : point₁ < point₂) (h₃ : point₂ < center₂) :
    (!((rowBit (directSourceRows C) family₁.val center₁.val point₁.val &&
        rowBit (directSourceRows C) family₁.val center₁.val point₂.val &&
        rowBit (directSourceRows C) family₂.val center₂.val point₁.val &&
        rowBit (directSourceRows C) family₂.val center₂.val point₂.val))) = true := by
  apply directSource_sharedPair_false_of_strict C
  have hk := P.strictKalmanson h₁ h₂ h₃
  exact Or.inr (by simpa [dist_comm, add_comm] using hk.2)

/-- Cyclic exclusion when the two shared points surround the centers. -/
theorem directSource_sharedPair_pointsAroundCenters
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    {Q : FrontierBiApexRobustExactFiveSecondCapResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {M : PhysicalActualCriticalMutualOmissionPair H profile}
    {N : SourceTwoHitNormalForm Q profile M}
    {P : CanonicalAsymmetricRolePrepacket N}
    {star : PhysicalGlobalCrossDeletionStar profile}
    {first : FirstApexShellRolePacket F R}
    {T : CanonicalAsymmetricSemanticRowTable P star first}
    (C : CanonicalCoverFamilies T)
    (family₁ family₂ : Fin 3) (center₁ center₂ point₁ point₂ : Fin 13)
    (h₁ : point₁ < center₁) (h₂ : center₁ < center₂) (h₃ : center₂ < point₂) :
    (!((rowBit (directSourceRows C) family₁.val center₁.val point₁.val &&
        rowBit (directSourceRows C) family₁.val center₁.val point₂.val &&
        rowBit (directSourceRows C) family₂.val center₂.val point₁.val &&
        rowBit (directSourceRows C) family₂.val center₂.val point₂.val))) = true := by
  apply directSource_sharedPair_false_of_strict C
  have hk := P.strictKalmanson h₁ h₂ h₃
  exact Or.inr (by simpa [dist_comm, add_comm] using hk.2)

/-- Pulling back the intersection of two selected supports through the
canonical bijection preserves its cardinality. -/
private theorem supportIntersectionIndexFilter_card
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    {Q : FrontierBiApexRobustExactFiveSecondCapResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {M : PhysicalActualCriticalMutualOmissionPair H profile}
    {N : SourceTwoHitNormalForm Q profile M}
    (P : CanonicalAsymmetricRolePrepacket N) {center₁ center₂ : Fin 13}
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

/-- The generated population count of an intersection of rows at distinct
centers is at most two. -/
theorem directSource_row_inter_card_le_two
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    {Q : FrontierBiApexRobustExactFiveSecondCapResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {M : PhysicalActualCriticalMutualOmissionPair H profile}
    {N : SourceTwoHitNormalForm Q profile M}
    {P : CanonicalAsymmetricRolePrepacket N}
    {star : PhysicalGlobalCrossDeletionStar profile}
    {first : FirstApexShellRolePacket F R}
    {T : CanonicalAsymmetricSemanticRowTable P star first}
    (C : CanonicalCoverFamilies T)
    (family₁ family₂ : Fin 3) (center₁ center₂ : Fin 13)
    (hne : center₁ ≠ center₂) :
    (bitCount13 fun point ↦
      rowBit (directSourceRows C) family₁.val center₁.val point.val &&
        rowBit (directSourceRows C) family₂.val center₂.val point.val).ule 2#4 = true := by
  rw [show (fun point : Fin 13 ↦
      rowBit (directSourceRows C) family₁.val center₁.val point.val &&
        rowBit (directSourceRows C) family₂.val center₂.val point.val) =
      (fun point ↦
        decide (P.point point ∈ (directSourceClass C family₁ center₁).support) &&
          decide (P.point point ∈ (directSourceClass C family₂ center₂).support)) by
    funext point
    simp]
  apply bitCount13_ule_two_of_filter_card_le_two
  rw [supportIntersectionIndexFilter_card P]
  exact SelectedFourClass.inter_card_le_two
    (directSourceClass C family₁ center₁)
    (directSourceClass C family₂ center₂)
    (fun h ↦ hne (P.point_injective h))

/-- The three canonical strict second-cap indices are exactly the physical
three-set. -/
private theorem physicalVertices_eq_indexOneTwoThree
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    {Q : FrontierBiApexRobustExactFiveSecondCapResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {M : PhysicalActualCriticalMutualOmissionPair H profile}
    {N : SourceTwoHitNormalForm Q profile M}
    (P : CanonicalAsymmetricRolePrepacket N) :
    physicalVertices profile =
      ({P.point 1, P.point 2, P.point 3} : Finset ℝ²) := by
  rw [N.physicalVertices_eq]
  rcases P.source_role_orbits with hforward | hreverse
  · rcases hforward with ⟨hsource, hblocker, hthird⟩
    rw [← P.source_point, ← P.blocker_point, ← P.third_point,
      hsource, hblocker, hthird]
  · rcases hreverse with ⟨hsource, hblocker, hthird⟩
    rw [← P.source_point, ← P.blocker_point, ← P.third_point,
      hsource, hblocker, hthird]
    ext x
    simp only [Finset.mem_insert, Finset.mem_singleton]
    aesop

/-- Canonical indices `1,2,3` are exactly the strict second-cap interior. -/
private theorem secondCapInterior_mem_iff
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    {Q : FrontierBiApexRobustExactFiveSecondCapResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {M : PhysicalActualCriticalMutualOmissionPair H profile}
    {N : SourceTwoHitNormalForm Q profile M}
    (P : CanonicalAsymmetricRolePrepacket N) (i : Fin 13) :
    P.point i ∈ S.capInteriorByIndex S.oppIndex2 ↔
      i = 1 ∨ i = 2 ∨ i = 3 := by
  rw [← physicalVertices_eq_capInterior_of_exactFiveSecondCap Q profile,
    physicalVertices_eq_indexOneTwoThree P]
  simp only [Finset.mem_insert, Finset.mem_singleton]
  constructor
  · intro h
    rcases h with h | h | h
    · exact Or.inl (P.point_injective h)
    · exact Or.inr (Or.inl (P.point_injective h))
    · exact Or.inr (Or.inr (P.point_injective h))
  · intro h
    rcases h with rfl | rfl | rfl <;> simp

/-- Every non-apex canonical index not belonging to either opposite-cap
interior belongs to the surplus-cap interior. -/
private theorem middleIndex_mem_surplusCapInterior
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    {Q : FrontierBiApexRobustExactFiveSecondCapResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {M : PhysicalActualCriticalMutualOmissionPair H profile}
    {N : SourceTwoHitNormalForm Q profile M}
    (P : CanonicalAsymmetricRolePrepacket N) (i : Fin 13)
    (hi4 : (4 : Fin 13) < i) (hi8 : i < (8 : Fin 13)) :
    P.point i ∈ S.capInteriorByIndex S.surplusIdx := by
  have hiA : P.point i ∈ D.A := by
    rw [← P.point_image]
    exact Finset.mem_image.mpr ⟨i, Finset.mem_univ _, rfl⟩
  have hiTriangle : P.point i ∉ S.triangle.verts := by
    intro h
    rcases S.mem_triangle_verts_oppositeVertexByIndex_cases h with h | h | h
    · have h0 : P.point i = P.point 0 := by
        simpa [P.surplusOpposite_at_zero] using h
      exact (by omega : i ≠ 0) (P.point_injective h0)
    · have h4 : P.point i = P.point 4 := by
        simpa [P.firstApex_at_four,
          S.triangleByIndex_surplusIdx_v2_eq_oppositeVertexByIndex_oppIndex1]
          using h
      exact (by omega : i ≠ 4) (P.point_injective h4)
    · have h8 : P.point i = P.point 8 := by
        simpa [P.secondApex_at_eight,
          S.triangleByIndex_surplusIdx_v3_eq_oppositeVertexByIndex_oppIndex2]
          using h
      exact (by omega : i ≠ 8) (P.point_injective h8)
  rcases S.mem_triangle_verts_or_exists_capInteriorByIndex_of_mem hiA with
    htriangle | ⟨j, hj⟩
  · exact False.elim (hiTriangle htriangle)
  · rcases S.index_eq_surplusIdx_or_oppIndex1_or_oppIndex2 j with
      rfl | rfl | rfl
    · exact hj
    · have hgt := (P.capInterior_mem_iff_index_gt_eight i).mp hj
      omega
    · rcases (secondCapInterior_mem_iff P i).mp hj with h | h | h
      all_goals omega

/-- The vertex opposite one indexed cap belongs to every other indexed cap. -/
private theorem oppositeVertexByIndex_mem_capByIndex_of_ne
    {A : Finset ℝ²} (S : SurplusCapPacket A) {i j : Fin 3}
    (hij : i ≠ j) :
    S.oppositeVertexByIndex i ∈ S.capByIndex j := by
  fin_cases i <;> fin_cases j
  · exact False.elim (hij rfl)
  · simpa [SurplusCapPacket.oppositeVertexByIndex,
      SurplusCapPacket.capByIndex] using S.partition.v1_mem_C2
  · simpa [SurplusCapPacket.oppositeVertexByIndex,
      SurplusCapPacket.capByIndex] using S.partition.v1_mem_C3
  · simpa [SurplusCapPacket.oppositeVertexByIndex,
      SurplusCapPacket.capByIndex] using S.partition.v2_mem_C1
  · exact False.elim (hij rfl)
  · simpa [SurplusCapPacket.oppositeVertexByIndex,
      SurplusCapPacket.capByIndex] using S.partition.v2_mem_C3
  · simpa [SurplusCapPacket.oppositeVertexByIndex,
      SurplusCapPacket.capByIndex] using S.partition.v3_mem_C1
  · simpa [SurplusCapPacket.oppositeVertexByIndex,
      SurplusCapPacket.capByIndex] using S.partition.v3_mem_C2
  · exact False.elim (hij rfl)

/-- The canonical block `0,1,2,3,4` lies in the closed second-opposite cap. -/
private theorem point_mem_secondCap_of_le_four
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    {Q : FrontierBiApexRobustExactFiveSecondCapResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {M : PhysicalActualCriticalMutualOmissionPair H profile}
    {N : SourceTwoHitNormalForm Q profile M}
    (P : CanonicalAsymmetricRolePrepacket N) (i : Fin 13)
    (hi : i ≤ (4 : Fin 13)) :
    P.point i ∈ S.capByIndex S.oppIndex2 := by
  have hzero : P.point 0 ∈ S.capByIndex S.oppIndex2 := by
    rw [P.surplusOpposite_at_zero]
    exact oppositeVertexByIndex_mem_capByIndex_of_ne S S.surplusIdx_ne_oppIndex2
  have hfour : P.point 4 ∈ S.capByIndex S.oppIndex2 := by
    rw [P.firstApex_at_four]
    exact oppositeVertexByIndex_mem_capByIndex_of_ne S S.oppIndex1_ne_oppIndex2
  have hinterior (j : Fin 13) (hj : j = 1 ∨ j = 2 ∨ j = 3) :
      P.point j ∈ S.capByIndex S.oppIndex2 :=
    S.capInteriorByIndex_subset_capByIndex S.oppIndex2
      ((secondCapInterior_mem_iff P j).2 hj)
  have hiVal : i.val ≤ 4 := hi
  fin_cases i
  · exact hzero
  · exact hinterior 1 (by simp)
  · exact hinterior 2 (by simp)
  · exact hinterior 3 (by simp)
  · exact hfour
  all_goals norm_num at hiVal

/-- The canonical wrap block `8,9,10,11,12,0` lies in the closed
first-opposite cap. -/
private theorem point_mem_firstCap_of_wrap
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    {Q : FrontierBiApexRobustExactFiveSecondCapResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {M : PhysicalActualCriticalMutualOmissionPair H profile}
    {N : SourceTwoHitNormalForm Q profile M}
    (P : CanonicalAsymmetricRolePrepacket N) (i : Fin 13)
    (hi : i = 0 ∨ (8 : Fin 13) ≤ i) :
    P.point i ∈ S.capByIndex S.oppIndex1 := by
  rcases hi with rfl | hi
  · rw [P.surplusOpposite_at_zero]
    exact oppositeVertexByIndex_mem_capByIndex_of_ne S
      S.surplusIdx_ne_oppIndex1
  · by_cases hi8 : i = 8
    · subst i
      rw [P.secondApex_at_eight]
      exact oppositeVertexByIndex_mem_capByIndex_of_ne S
        S.oppIndex1_ne_oppIndex2.symm
    · exact S.capInteriorByIndex_subset_capByIndex S.oppIndex1
        ((P.capInterior_mem_iff_index_gt_eight i).2 (by omega))

/-- The canonical middle block `4,5,6,7,8` lies in the closed surplus cap. -/
private theorem point_mem_surplusCap_of_middle
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    {Q : FrontierBiApexRobustExactFiveSecondCapResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {M : PhysicalActualCriticalMutualOmissionPair H profile}
    {N : SourceTwoHitNormalForm Q profile M}
    (P : CanonicalAsymmetricRolePrepacket N) (i : Fin 13)
    (hi4 : (4 : Fin 13) ≤ i) (hi8 : i ≤ (8 : Fin 13)) :
    P.point i ∈ S.capByIndex S.surplusIdx := by
  by_cases h4 : i = 4
  · subst i
    rw [P.firstApex_at_four]
    exact oppositeVertexByIndex_mem_capByIndex_of_ne S
      S.surplusIdx_ne_oppIndex1.symm
  by_cases h8 : i = 8
  · subst i
    rw [P.secondApex_at_eight]
    exact oppositeVertexByIndex_mem_capByIndex_of_ne S
      S.surplusIdx_ne_oppIndex2.symm
  exact S.capInteriorByIndex_subset_capByIndex S.surplusIdx
    (middleIndex_mem_surplusCapInterior P i (by omega) (by omega))

/-- Restricting a support to canonical indices whose images lie in a cap
cannot have larger cardinality than the corresponding geometric
intersection. -/
private theorem restrictedSupportIndexFilter_card_le_inter
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    {Q : FrontierBiApexRobustExactFiveSecondCapResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {M : PhysicalActualCriticalMutualOmissionPair H profile}
    {N : SourceTwoHitNormalForm Q profile M}
    (P : CanonicalAsymmetricRolePrepacket N) {center : Fin 13}
    (K : SelectedFourClass D.A (P.point center))
    (indices : Finset (Fin 13)) (cap : Finset ℝ²)
    (hindices : ∀ i ∈ indices, P.point i ∈ cap) :
    (indices.filter fun i ↦ decide (P.point i ∈ K.support) = true).card ≤
      (K.support ∩ cap).card := by
  let hits := indices.filter fun i ↦ decide (P.point i ∈ K.support) = true
  have himageCard : hits.card = (hits.image P.point).card :=
    (Finset.card_image_of_injective _ P.point_injective).symm
  rw [himageCard]
  apply Finset.card_le_card
  intro x hx
  rcases Finset.mem_image.mp hx with ⟨i, hi, rfl⟩
  rcases Finset.mem_filter.mp hi with ⟨hiIndices, hiSupport⟩
  exact Finset.mem_inter.mpr
    ⟨of_decide_eq_true hiSupport, hindices i hiIndices⟩

/-- A selected support at either endpoint of an indexed cap has at most one
point in that cap. -/
private theorem selectedFourClass_inter_cap_card_le_one_of_endpoint
    {D : CounterexampleData} (S : SurplusCapPacket D.A) (i : Fin 3)
    {center : ℝ²} (K : SelectedFourClass D.A center)
    (hcenter : center = (S.triangleByIndex i).v2 ∨
      center = (S.triangleByIndex i).v3) :
    (K.support ∩ S.capByIndex i).card ≤ 1 := by
  have hsub : K.support ∩ S.capByIndex i ⊆
      SelectedClass D.A center K.radius ∩ S.capByIndex i := by
    intro x hx
    exact Finset.mem_inter.mpr
      ⟨mem_selectedClass.mpr
        ⟨K.support_subset_A (Finset.mem_inter.mp hx).1,
          K.support_eq_radius x (Finset.mem_inter.mp hx).1⟩,
        (Finset.mem_inter.mp hx).2⟩
  apply (Finset.card_le_card hsub).trans
  rcases hcenter with hcenter | hcenter
  · subst center
    exact S.capByIndex_sameRadius_at_v2_card_le_one_of_convexIndep
      D.convex i K.radius
  · subst center
    exact S.capByIndex_sameRadius_at_v3_card_le_one_of_convexIndep
      D.convex i K.radius

/-- Generated population count for the canonical surplus-cap block. -/
def bitCountMiddleFive (member : Fin 13 → Bool) : BitVec 4 :=
  (bif member 4 then 1#4 else 0#4) +
  (bif member 5 then 1#4 else 0#4) +
  (bif member 6 then 1#4 else 0#4) +
  (bif member 7 then 1#4 else 0#4) +
  (bif member 8 then 1#4 else 0#4)

/-- Generated population count for the canonical first-opposite wrap block. -/
def bitCountFirstWrapSix (member : Fin 13 → Bool) : BitVec 4 :=
  (bif member 0 then 1#4 else 0#4) +
  (bif member 8 then 1#4 else 0#4) +
  (bif member 9 then 1#4 else 0#4) +
  (bif member 10 then 1#4 else 0#4) +
  (bif member 11 then 1#4 else 0#4) +
  (bif member 12 then 1#4 else 0#4)

/-- Generated population count for the canonical second-opposite block. -/
def bitCountSecondFive (member : Fin 13 → Bool) : BitVec 4 :=
  (bif member 0 then 1#4 else 0#4) +
  (bif member 1 then 1#4 else 0#4) +
  (bif member 2 then 1#4 else 0#4) +
  (bif member 3 then 1#4 else 0#4) +
  (bif member 4 then 1#4 else 0#4)

private theorem bitCountMiddleFive_ule_one_of_filter_card_le_one
    (member : Fin 13 → Bool)
    (hcard : (({4, 5, 6, 7, 8} : Finset (Fin 13)).filter fun i ↦
      member i = true).card ≤ 1) :
    (bitCountMiddleFive member).ule 1#4 = true := by
  native_decide +revert

private theorem bitCountMiddleFive_ule_two_of_filter_card_le_two
    (member : Fin 13 → Bool)
    (hcard : (({4, 5, 6, 7, 8} : Finset (Fin 13)).filter fun i ↦
      member i = true).card ≤ 2) :
    (bitCountMiddleFive member).ule 2#4 = true := by
  native_decide +revert

private theorem bitCountFirstWrapSix_ule_one_of_filter_card_le_one
    (member : Fin 13 → Bool)
    (hcard : (({0, 8, 9, 10, 11, 12} : Finset (Fin 13)).filter fun i ↦
      member i = true).card ≤ 1) :
    (bitCountFirstWrapSix member).ule 1#4 = true := by
  native_decide +revert

private theorem bitCountSecondFive_ule_one_of_filter_card_le_one
    (member : Fin 13 → Bool)
    (hcard : (({0, 1, 2, 3, 4} : Finset (Fin 13)).filter fun i ↦
      member i = true).card ≤ 1) :
    (bitCountSecondFive member).ule 1#4 = true := by
  native_decide +revert

/-- The retained first-apex row has at most one point in the surplus cap. -/
theorem directSource_mainFour_middle_card_le_one
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    {Q : FrontierBiApexRobustExactFiveSecondCapResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {M : PhysicalActualCriticalMutualOmissionPair H profile}
    {N : SourceTwoHitNormalForm Q profile M}
    {P : CanonicalAsymmetricRolePrepacket N}
    {star : PhysicalGlobalCrossDeletionStar profile}
    {first : FirstApexShellRolePacket F R}
    {T : CanonicalAsymmetricSemanticRowTable P star first}
    (C : CanonicalCoverFamilies T) :
    (bitCountMiddleFive fun point ↦
      rowBit (directSourceRows C) 0 4 point.val).ule 1#4 = true := by
  apply bitCountMiddleFive_ule_one_of_filter_card_le_one
  have hsource := restrictedSupportIndexFilter_card_le_inter P (T.main 4)
    {4, 5, 6, 7, 8} (S.capByIndex S.surplusIdx) (by
      intro i hi
      simp only [Finset.mem_insert, Finset.mem_singleton] at hi
      rcases hi with rfl | rfl | rfl | rfl | rfl <;>
        exact point_mem_surplusCap_of_middle P _ (by decide) (by decide))
  have hgeometry := selectedFourClass_inter_cap_card_le_one_of_endpoint S
      S.surplusIdx (T.main 4) (Or.inl (by
        rw [P.firstApex_at_four]
        exact S.triangleByIndex_surplusIdx_v2_eq_oppositeVertexByIndex_oppIndex1.symm))
  have hrow (i : Fin 13) :
      rowBit (directSourceRows C) 0 4 i.val =
        decide (P.point i ∈ (T.main 4).support) := by
    calc
      rowBit (directSourceRows C) 0 4 i.val =
          directSourceRowMember C 0 4 i :=
        rowBit_directSourceRows C (0 : Fin 3) (4 : Fin 13) i
      _ = decide (P.point i ∈ (T.main 4).support) := by
        simp [directSourceClass]
  simpa only [hrow, decide_eq_true_eq] using hsource.trans hgeometry

/-- The center-zero row has at most one point in the first-opposite wrap cap. -/
theorem directSource_mainZero_firstWrap_card_le_one
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    {Q : FrontierBiApexRobustExactFiveSecondCapResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {M : PhysicalActualCriticalMutualOmissionPair H profile}
    {N : SourceTwoHitNormalForm Q profile M}
    {P : CanonicalAsymmetricRolePrepacket N}
    {star : PhysicalGlobalCrossDeletionStar profile}
    {first : FirstApexShellRolePacket F R}
    {T : CanonicalAsymmetricSemanticRowTable P star first}
    (C : CanonicalCoverFamilies T) :
    (bitCountFirstWrapSix fun point ↦
      rowBit (directSourceRows C) 0 0 point.val).ule 1#4 = true := by
  apply bitCountFirstWrapSix_ule_one_of_filter_card_le_one
  have hsource := restrictedSupportIndexFilter_card_le_inter P (T.main 0)
    {0, 8, 9, 10, 11, 12} (S.capByIndex S.oppIndex1) (by
      intro i hi
      simp only [Finset.mem_insert, Finset.mem_singleton] at hi
      rcases hi with rfl | rfl | rfl | rfl | rfl | rfl <;>
        exact point_mem_firstCap_of_wrap P _ (by simp))
  have hgeometry := selectedFourClass_inter_cap_card_le_one_of_endpoint S
      S.oppIndex1 (T.main 0) (Or.inr (by
        rw [P.surplusOpposite_at_zero]
        exact S.triangleByIndex_oppIndex1_v3_eq_oppositeVertexByIndex_surplusIdx.symm))
  have hrow (i : Fin 13) :
      rowBit (directSourceRows C) 0 0 i.val =
        decide (P.point i ∈ (T.main 0).support) := by
    calc
      rowBit (directSourceRows C) 0 0 i.val =
          directSourceRowMember C 0 0 i :=
        rowBit_directSourceRows C (0 : Fin 3) (0 : Fin 13) i
      _ = decide (P.point i ∈ (T.main 0).support) := by
        simp [directSourceClass]
  simpa only [hrow, decide_eq_true_eq] using hsource.trans hgeometry

/-- The center-zero row has at most one point in the second-opposite cap. -/
theorem directSource_mainZero_second_card_le_one
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    {Q : FrontierBiApexRobustExactFiveSecondCapResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {M : PhysicalActualCriticalMutualOmissionPair H profile}
    {N : SourceTwoHitNormalForm Q profile M}
    {P : CanonicalAsymmetricRolePrepacket N}
    {star : PhysicalGlobalCrossDeletionStar profile}
    {first : FirstApexShellRolePacket F R}
    {T : CanonicalAsymmetricSemanticRowTable P star first}
    (C : CanonicalCoverFamilies T) :
    (bitCountSecondFive fun point ↦
      rowBit (directSourceRows C) 0 0 point.val).ule 1#4 = true := by
  apply bitCountSecondFive_ule_one_of_filter_card_le_one
  have hsource := restrictedSupportIndexFilter_card_le_inter P (T.main 0)
    {0, 1, 2, 3, 4} (S.capByIndex S.oppIndex2) (by
      intro i hi
      simp only [Finset.mem_insert, Finset.mem_singleton] at hi
      rcases hi with rfl | rfl | rfl | rfl | rfl <;>
        exact point_mem_secondCap_of_le_four P _ (by decide))
  have hgeometry := selectedFourClass_inter_cap_card_le_one_of_endpoint S
      S.oppIndex2 (T.main 0) (Or.inl (by
        rw [P.surplusOpposite_at_zero]
        exact S.triangleByIndex_oppIndex2_v2_eq_oppositeVertexByIndex_surplusIdx.symm))
  have hrow (i : Fin 13) :
      rowBit (directSourceRows C) 0 0 i.val =
        decide (P.point i ∈ (T.main 0).support) := by
    calc
      rowBit (directSourceRows C) 0 0 i.val =
          directSourceRowMember C 0 0 i :=
        rowBit_directSourceRows C (0 : Fin 3) (0 : Fin 13) i
      _ = decide (P.point i ∈ (T.main 0).support) := by
        simp [directSourceClass]
  simpa only [hrow, decide_eq_true_eq] using hsource.trans hgeometry

/-- The retained first-apex row has at most one point in the second-opposite
cap. -/
theorem directSource_mainFour_second_card_le_one
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    {Q : FrontierBiApexRobustExactFiveSecondCapResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {M : PhysicalActualCriticalMutualOmissionPair H profile}
    {N : SourceTwoHitNormalForm Q profile M}
    {P : CanonicalAsymmetricRolePrepacket N}
    {star : PhysicalGlobalCrossDeletionStar profile}
    {first : FirstApexShellRolePacket F R}
    {T : CanonicalAsymmetricSemanticRowTable P star first}
    (C : CanonicalCoverFamilies T) :
    (bitCountSecondFive fun point ↦
      rowBit (directSourceRows C) 0 4 point.val).ule 1#4 = true := by
  apply bitCountSecondFive_ule_one_of_filter_card_le_one
  have hsource := restrictedSupportIndexFilter_card_le_inter P (T.main 4)
    {0, 1, 2, 3, 4} (S.capByIndex S.oppIndex2) (by
      intro i hi
      simp only [Finset.mem_insert, Finset.mem_singleton] at hi
      rcases hi with rfl | rfl | rfl | rfl | rfl <;>
        exact point_mem_secondCap_of_le_four P _ (by decide))
  have hgeometry := selectedFourClass_inter_cap_card_le_one_of_endpoint S
      S.oppIndex2 (T.main 4) (Or.inr (by
        rw [P.firstApex_at_four]
        exact S.triangleByIndex_oppIndex2_v3_eq_oppositeVertexByIndex_oppIndex1.symm))
  have hrow (i : Fin 13) :
      rowBit (directSourceRows C) 0 4 i.val =
        decide (P.point i ∈ (T.main 4).support) := by
    calc
      rowBit (directSourceRows C) 0 4 i.val =
          directSourceRowMember C 0 4 i :=
        rowBit_directSourceRows C (0 : Fin 3) (4 : Fin 13) i
      _ = decide (P.point i ∈ (T.main 4).support) := by
        simp [directSourceClass]
  simpa only [hrow, decide_eq_true_eq] using hsource.trans hgeometry

/-- Any packed row centered in the canonical surplus block has at most two
points in that block. -/
theorem directSource_middle_card_le_two
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    {Q : FrontierBiApexRobustExactFiveSecondCapResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {M : PhysicalActualCriticalMutualOmissionPair H profile}
    {N : SourceTwoHitNormalForm Q profile M}
    {P : CanonicalAsymmetricRolePrepacket N}
    {star : PhysicalGlobalCrossDeletionStar profile}
    {first : FirstApexShellRolePacket F R}
    {T : CanonicalAsymmetricSemanticRowTable P star first}
    (C : CanonicalCoverFamilies T) (family : Fin 3) (center : Fin 13)
    (hcenter4 : (4 : Fin 13) ≤ center) (hcenter8 : center ≤ (8 : Fin 13)) :
    (bitCountMiddleFive fun point ↦
      rowBit (directSourceRows C) family.val center.val point.val).ule 2#4 = true := by
  apply bitCountMiddleFive_ule_two_of_filter_card_le_two
  have hsource := restrictedSupportIndexFilter_card_le_inter P
    (directSourceClass C family center) {4, 5, 6, 7, 8}
      (S.capByIndex S.surplusIdx) (by
        intro i hi
        simp only [Finset.mem_insert, Finset.mem_singleton] at hi
        rcases hi with rfl | rfl | rfl | rfl | rfl <;>
          exact point_mem_surplusCap_of_middle P _ (by decide) (by decide))
  have hgeometry :=
    CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two
      S D.convex S.surplusIdx (directSourceClass C family center)
      (point_mem_surplusCap_of_middle P center hcenter4 hcenter8)
  simpa using hsource.trans hgeometry

/-- Generated population count for the surplus-adjacent part of the
exact-five shell (the second apex itself is omitted). -/
def bitCountMiddleFour (member : Fin 13 → Bool) : BitVec 4 :=
  (bif member 4 then 1#4 else 0#4) +
  (bif member 5 then 1#4 else 0#4) +
  (bif member 6 then 1#4 else 0#4) +
  (bif member 7 then 1#4 else 0#4)

/-- Generated population count for the first-opposite adjacent part of the
exact-five shell (the second apex itself is omitted). -/
def bitCountFirstWrapFive (member : Fin 13 → Bool) : BitVec 4 :=
  (bif member 0 then 1#4 else 0#4) +
  (bif member 9 then 1#4 else 0#4) +
  (bif member 10 then 1#4 else 0#4) +
  (bif member 11 then 1#4 else 0#4) +
  (bif member 12 then 1#4 else 0#4)

private theorem bitCountMiddleFour_ule_one_of_filter_card_le_one
    (member : Fin 13 → Bool)
    (hcard : (({4, 5, 6, 7} : Finset (Fin 13)).filter fun i ↦
      member i = true).card ≤ 1) :
    (bitCountMiddleFour member).ule 1#4 = true := by
  native_decide +revert

private theorem bitCountFirstWrapFive_ule_one_of_filter_card_le_one
    (member : Fin 13 → Bool)
    (hcard : (({0, 9, 10, 11, 12} : Finset (Fin 13)).filter fun i ↦
      member i = true).card ≤ 1) :
    (bitCountFirstWrapFive member).ule 1#4 = true := by
  native_decide +revert

/-- Finite bookkeeping for the `3+1+1` exact-five shell split. -/
private theorem exact_one_each_adjacent_block_of_shell_facts
    (member : Fin 13 → Bool)
    (htotal : (bitCount13 member == 5#4) = true)
    (h1 : member 1 = true) (h2 : member 2 = true) (h3 : member 3 = true)
    (h8 : member 8 = false)
    (hmiddle : (bitCountMiddleFour member).ule 1#4 = true)
    (hwrap : (bitCountFirstWrapFive member).ule 1#4 = true) :
    (bitCountMiddleFour member == 1#4) = true ∧
      (bitCountFirstWrapFive member == 1#4) = true := by
  native_decide +revert

/-- Restricting the pullback of an arbitrary finite point set to indices
whose images lie in a cap is bounded by its geometric cap intersection. -/
private theorem restrictedIndexFilter_card_le_inter
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    {Q : FrontierBiApexRobustExactFiveSecondCapResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {M : PhysicalActualCriticalMutualOmissionPair H profile}
    {N : SourceTwoHitNormalForm Q profile M}
    (P : CanonicalAsymmetricRolePrepacket N)
    (points : Finset ℝ²) (indices : Finset (Fin 13)) (cap : Finset ℝ²)
    (hindices : ∀ i ∈ indices, P.point i ∈ cap) :
    (indices.filter fun i ↦ decide (P.point i ∈ points) = true).card ≤
      (points ∩ cap).card := by
  let hits := indices.filter fun i ↦ decide (P.point i ∈ points) = true
  have himageCard : hits.card = (hits.image P.point).card :=
    (Finset.card_image_of_injective _ P.point_injective).symm
  rw [himageCard]
  apply Finset.card_le_card
  intro x hx
  rcases Finset.mem_image.mp hx with ⟨i, hi, rfl⟩
  rcases Finset.mem_filter.mp hi with ⟨hiIndices, hiPoints⟩
  exact Finset.mem_inter.mpr
    ⟨of_decide_eq_true hiPoints, hindices i hiIndices⟩

private theorem leftAdjacentCap_oppIndex2_eq_surplusCap
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.leftAdjacentCapByIndex S.oppIndex2 = S.capByIndex S.surplusIdx := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.leftAdjacentCapByIndex,
      SurplusCapPacket.capByIndex, SurplusCapPacket.oppIndex2, hi]

private theorem pointEight_eq_secondApex
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    {Q : FrontierBiApexRobustExactFiveSecondCapResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {M : PhysicalActualCriticalMutualOmissionPair H profile}
    {N : SourceTwoHitNormalForm Q profile M}
    (P : CanonicalAsymmetricRolePrepacket N) :
    P.point 8 = S.oppApex2 := by
  rw [P.secondApex_at_eight]
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.oppApex2, SurplusCapPacket.oppIndex2,
      SurplusCapPacket.oppositeVertexByIndex, hi]

/-- The direct shell assignment has exact population five. -/
theorem directSource_shell_card_eq_five
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    {Q : FrontierBiApexRobustExactFiveSecondCapResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {M : PhysicalActualCriticalMutualOmissionPair H profile}
    {N : SourceTwoHitNormalForm Q profile M}
    {P : CanonicalAsymmetricRolePrepacket N}
    {star : PhysicalGlobalCrossDeletionStar profile}
    {first : FirstApexShellRolePacket F R}
    (T : CanonicalAsymmetricSemanticRowTable P star first) :
    ((bitCount13 fun point ↦ shellBit (directSourceShell T) point.val) == 5#4) =
      true := by
  apply bitCount13_eq_five_of_filter_card_eq_five
  simpa only [shellBit_directSourceShell, decide_eq_true_eq,
    Finset.filter_mem_eq_inter, Finset.univ_inter] using T.exactFiveShell_card

/-- Canonical strict second-cap indices `1,2,3` all belong to the exact-five
shell. -/
theorem directSource_shell_mem_one_two_three
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    {Q : FrontierBiApexRobustExactFiveSecondCapResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {M : PhysicalActualCriticalMutualOmissionPair H profile}
    {N : SourceTwoHitNormalForm Q profile M}
    {P : CanonicalAsymmetricRolePrepacket N}
    {star : PhysicalGlobalCrossDeletionStar profile}
    {first : FirstApexShellRolePacket F R}
    (T : CanonicalAsymmetricSemanticRowTable P star first) (i : Fin 13)
    (hi : i = 1 ∨ i = 2 ∨ i = 3) :
    shellBit (directSourceShell T) i.val = true := by
  rw [shellBit_directSourceShell, decide_eq_true_eq, T.exactFiveShell_mem_iff]
  have hiInterior := (secondCapInterior_mem_iff P i).2 hi
  rw [← physicalVertices_eq_capInterior_of_exactFiveSecondCap Q profile] at hiInterior
  exact (Finset.mem_inter.mp hiInterior).1

/-- The second apex is absent from its positive-radius exact-five shell. -/
private theorem directSource_shell_eight_eq_false
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    {Q : FrontierBiApexRobustExactFiveSecondCapResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {M : PhysicalActualCriticalMutualOmissionPair H profile}
    {N : SourceTwoHitNormalForm Q profile M}
    {P : CanonicalAsymmetricRolePrepacket N}
    {star : PhysicalGlobalCrossDeletionStar profile}
    {first : FirstApexShellRolePacket F R}
    (T : CanonicalAsymmetricSemanticRowTable P star first) :
    shellBit (directSourceShell T) 8 = false := by
  rw [show shellBit (directSourceShell T) 8 =
      decide ((8 : Fin 13) ∈ T.exactFiveShell) by
    exact shellBit_directSourceShell T (8 : Fin 13)]
  apply decide_eq_false_iff_not.mpr
  rw [T.exactFiveShell_mem_iff, pointEight_eq_secondApex P]
  intro h
  have hdist := (mem_selectedClass.mp h).2
  simp only [dist_self] at hdist
  linarith [profile.radius_pos]

/-- Each adjacent block contributes exactly one member to the exact-five
shell. -/
theorem directSource_shell_adjacent_blocks_eq_one
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    {Q : FrontierBiApexRobustExactFiveSecondCapResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {M : PhysicalActualCriticalMutualOmissionPair H profile}
    {N : SourceTwoHitNormalForm Q profile M}
    {P : CanonicalAsymmetricRolePrepacket N}
    {star : PhysicalGlobalCrossDeletionStar profile}
    {first : FirstApexShellRolePacket F R}
    (T : CanonicalAsymmetricSemanticRowTable P star first) :
    ((bitCountMiddleFour fun point ↦
        shellBit (directSourceShell T) point.val) == 1#4) = true ∧
      ((bitCountFirstWrapFive fun point ↦
        shellBit (directSourceShell T) point.val) == 1#4) = true := by
  let member : Fin 13 → Bool := fun point ↦
    shellBit (directSourceShell T) point.val
  apply exact_one_each_adjacent_block_of_shell_facts member
  · exact directSource_shell_card_eq_five T
  · exact directSource_shell_mem_one_two_three T 1 (by simp)
  · exact directSource_shell_mem_one_two_three T 2 (by simp)
  · exact directSource_shell_mem_one_two_three T 3 (by simp)
  · exact directSource_shell_eight_eq_false T
  · apply bitCountMiddleFour_ule_one_of_filter_card_le_one
    have hsource := restrictedIndexFilter_card_le_inter P
      (SelectedClass D.A S.oppApex2 profile.radius)
      {4, 5, 6, 7} (S.capByIndex S.surplusIdx) (by
        intro i hi
        simp only [Finset.mem_insert, Finset.mem_singleton] at hi
        rcases hi with rfl | rfl | rfl | rfl <;>
          exact point_mem_surplusCap_of_middle P _ (by decide) (by decide))
    have hgeometry :
        (SelectedClass D.A S.oppApex2 profile.radius ∩
          S.capByIndex S.surplusIdx).card ≤ 1 := by
      rw [← leftAdjacentCap_oppIndex2_eq_surplusCap S]
      have hcenter : S.oppApex2 =
          S.oppositeVertexByIndex S.oppIndex2 := by
        calc
          S.oppApex2 = P.point 8 := (pointEight_eq_secondApex P).symm
          _ = S.oppositeVertexByIndex S.oppIndex2 := P.secondApex_at_eight
      rw [hcenter]
      exact S.leftAdjacentCap_at_opposite_card_le_one_of_convexIndep
        D.convex S.oppIndex2 profile.radius
    have hshell (i : Fin 13) :
        shellBit (directSourceShell T) i.val =
          decide (P.point i ∈ SelectedClass D.A S.oppApex2 profile.radius) := by
      calc
        shellBit (directSourceShell T) i.val =
            decide (i ∈ T.exactFiveShell) := shellBit_directSourceShell T i
        _ = decide (P.point i ∈
            SelectedClass D.A S.oppApex2 profile.radius) := by
          simp only [T.exactFiveShell_mem_iff]
    simpa only [member, hshell, decide_eq_true_eq] using hsource.trans hgeometry
  · apply bitCountFirstWrapFive_ule_one_of_filter_card_le_one
    have hsource := restrictedIndexFilter_card_le_inter P
      (SelectedClass D.A S.oppApex2 profile.radius)
      {0, 9, 10, 11, 12} (S.capByIndex S.oppIndex1) (by
        intro i hi
        simp only [Finset.mem_insert, Finset.mem_singleton] at hi
        rcases hi with rfl | rfl | rfl | rfl | rfl <;>
          exact point_mem_firstCap_of_wrap P _ (by simp))
    have hgeometry :
        (SelectedClass D.A S.oppApex2 profile.radius ∩
          S.capByIndex S.oppIndex1).card ≤ 1 := by
      rw [← S.rightAdjacentCapByIndex_oppIndex2_eq_capByIndex_oppIndex1]
      have hcenter : S.oppApex2 =
          S.oppositeVertexByIndex S.oppIndex2 := by
        calc
          S.oppApex2 = P.point 8 := (pointEight_eq_secondApex P).symm
          _ = S.oppositeVertexByIndex S.oppIndex2 := P.secondApex_at_eight
      rw [hcenter]
      exact S.rightAdjacentCap_at_opposite_card_le_one_of_convexIndep
        D.convex S.oppIndex2 profile.radius
    have hshell (i : Fin 13) :
        shellBit (directSourceShell T) i.val =
          decide (P.point i ∈ SelectedClass D.A S.oppApex2 profile.radius) := by
      calc
        shellBit (directSourceShell T) i.val =
            decide (i ∈ T.exactFiveShell) := shellBit_directSourceShell T i
        _ = decide (P.point i ∈
            SelectedClass D.A S.oppApex2 profile.radius) := by
          simp only [T.exactFiveShell_mem_iff]
    simpa only [member, hshell, decide_eq_true_eq] using hsource.trans hgeometry

/-- The canonical left-cover row at center two agrees pointwise with the
main row there.  The center is the actual blocker image of the distinguished
source, so criticality synchronizes the complete supports. -/
theorem directSource_leftTwo_eq_mainTwo
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    {Q : FrontierBiApexRobustExactFiveSecondCapResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {M : PhysicalActualCriticalMutualOmissionPair H profile}
    {N : SourceTwoHitNormalForm Q profile M}
    {P : CanonicalAsymmetricRolePrepacket N}
    {star : PhysicalGlobalCrossDeletionStar profile}
    {first : FirstApexShellRolePacket F R}
    {T : CanonicalAsymmetricSemanticRowTable P star first}
    (C : CanonicalCoverFamilies T) (point : Fin 13) :
    rowBit (directSourceRows C) 1 2 point.val =
      rowBit (directSourceRows C) 0 2 point.val := by
  have hsourceA : P.point P.sourceIndex ∈ D.A := by
    rw [← P.point_image]
    exact Finset.mem_image.mpr ⟨P.sourceIndex, Finset.mem_univ _, rfl⟩
  have hblockerPoint :
      P.point (T.blockerIndex P.sourceIndex) = P.point P.blockerIndex := by
    calc
      P.point (T.blockerIndex P.sourceIndex) =
          H.centerAt (P.point P.sourceIndex) hsourceA :=
        T.blocker_point P.sourceIndex
      _ = M.target.1 := by
        simpa [P.source_point] using P.actualCenter_eq_blocker
      _ = P.point P.blockerIndex := P.blocker_point.symm
  have hblocker : T.blockerIndex P.sourceIndex = (2 : Fin 13) := by
    exact (P.point_injective hblockerPoint).trans P.blockerIndex_eq_two
  have hsupports := (C.blocker_supports_eq_main P.sourceIndex).1
  rw [hblocker] at hsupports
  calc
    rowBit (directSourceRows C) 1 2 point.val =
        directSourceRowMember C 1 2 point :=
      rowBit_directSourceRows C (1 : Fin 3) (2 : Fin 13) point
    _ = decide (P.point point ∈ (C.left 2).support) := by
      simp [directSourceRowMember]
    _ = decide (P.point point ∈ (T.main 2).support) := by rw [hsupports]
    _ = directSourceRowMember C 0 2 point := by
      simp [directSourceRowMember]
    _ = rowBit (directSourceRows C) 0 2 point.val :=
      (rowBit_directSourceRows C (0 : Fin 3) (2 : Fin 13) point).symm

/-- The packed first-apex double-deletion row has population four. -/
theorem directSource_firstRow_card_eq_four
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    {Q : FrontierBiApexRobustExactFiveSecondCapResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {M : PhysicalActualCriticalMutualOmissionPair H profile}
    {N : SourceTwoHitNormalForm Q profile M}
    {P : CanonicalAsymmetricRolePrepacket N}
    {star : PhysicalGlobalCrossDeletionStar profile}
    {first : FirstApexShellRolePacket F R}
    (T : CanonicalAsymmetricSemanticRowTable P star first) :
    ((bitCount13 fun point ↦
      firstRowBit (directSourceFirstRow T) point.val) == 4#4) = true := by
  apply bitCount13_eq_four_of_filter_card_eq_four
  rw [show (Finset.univ.filter fun i : Fin 13 ↦
      firstRowBit (directSourceFirstRow T) i.val = true) =
      Finset.univ.filter fun i : Fin 13 ↦
        decide (P.point i ∈ T.firstApexDoubleRow.support) = true by
    apply Finset.filter_congr
    intro i _hi
    rw [firstRowBit_directSourceFirstRow]]
  rw [supportIndexFilter_card P T.firstApexDoubleRow]
  exact T.firstApexDoubleRow.support_card

/-- The packed first-apex double-deletion row omits its center at index four. -/
theorem directSource_firstRow_four_excluded
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    {Q : FrontierBiApexRobustExactFiveSecondCapResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {M : PhysicalActualCriticalMutualOmissionPair H profile}
    {N : SourceTwoHitNormalForm Q profile M}
    {P : CanonicalAsymmetricRolePrepacket N}
    {star : PhysicalGlobalCrossDeletionStar profile}
    {first : FirstApexShellRolePacket F R}
    (T : CanonicalAsymmetricSemanticRowTable P star first) :
    (!(firstRowBit (directSourceFirstRow T) 4)) = true := by
  rw [show firstRowBit (directSourceFirstRow T) 4 =
      decide (P.point 4 ∈ T.firstApexDoubleRow.support) by
    exact firstRowBit_directSourceFirstRow T (4 : Fin 13)]
  rw [decide_eq_false_iff_not.mpr T.firstApexDoubleRow.center_not_mem]
  rfl

/-- Exact generated source assertions `h0000`–`h0144`, packaged at the
flat bit-vector boundary consumed by the verified certificate chunks. -/
structure DirectSourceBaseAssertions
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (b1 : FirstRowBits) : Prop where
  h0000 : (!(rowBit rows 0 0 0)) = true
  h0001 : ((((bif rowBit rows 0 0 0 then 1#4 else 0#4) + (bif rowBit rows 0 0 1 then 1#4 else 0#4) + (bif rowBit rows 0 0 2 then 1#4 else 0#4) + (bif rowBit rows 0 0 3 then 1#4 else 0#4) + (bif rowBit rows 0 0 4 then 1#4 else 0#4) + (bif rowBit rows 0 0 5 then 1#4 else 0#4) + (bif rowBit rows 0 0 6 then 1#4 else 0#4) + (bif rowBit rows 0 0 7 then 1#4 else 0#4) + (bif rowBit rows 0 0 8 then 1#4 else 0#4) + (bif rowBit rows 0 0 9 then 1#4 else 0#4) + (bif rowBit rows 0 0 10 then 1#4 else 0#4) + (bif rowBit rows 0 0 11 then 1#4 else 0#4) + (bif rowBit rows 0 0 12 then 1#4 else 0#4)) == 4#4)) = true
  h0002 : (!(rowBit rows 0 2 2)) = true
  h0003 : ((((bif rowBit rows 0 2 0 then 1#4 else 0#4) + (bif rowBit rows 0 2 1 then 1#4 else 0#4) + (bif rowBit rows 0 2 2 then 1#4 else 0#4) + (bif rowBit rows 0 2 3 then 1#4 else 0#4) + (bif rowBit rows 0 2 4 then 1#4 else 0#4) + (bif rowBit rows 0 2 5 then 1#4 else 0#4) + (bif rowBit rows 0 2 6 then 1#4 else 0#4) + (bif rowBit rows 0 2 7 then 1#4 else 0#4) + (bif rowBit rows 0 2 8 then 1#4 else 0#4) + (bif rowBit rows 0 2 9 then 1#4 else 0#4) + (bif rowBit rows 0 2 10 then 1#4 else 0#4) + (bif rowBit rows 0 2 11 then 1#4 else 0#4) + (bif rowBit rows 0 2 12 then 1#4 else 0#4)) == 4#4)) = true
  h0004 : (!(rowBit rows 0 4 4)) = true
  h0005 : ((((bif rowBit rows 0 4 0 then 1#4 else 0#4) + (bif rowBit rows 0 4 1 then 1#4 else 0#4) + (bif rowBit rows 0 4 2 then 1#4 else 0#4) + (bif rowBit rows 0 4 3 then 1#4 else 0#4) + (bif rowBit rows 0 4 4 then 1#4 else 0#4) + (bif rowBit rows 0 4 5 then 1#4 else 0#4) + (bif rowBit rows 0 4 6 then 1#4 else 0#4) + (bif rowBit rows 0 4 7 then 1#4 else 0#4) + (bif rowBit rows 0 4 8 then 1#4 else 0#4) + (bif rowBit rows 0 4 9 then 1#4 else 0#4) + (bif rowBit rows 0 4 10 then 1#4 else 0#4) + (bif rowBit rows 0 4 11 then 1#4 else 0#4) + (bif rowBit rows 0 4 12 then 1#4 else 0#4)) == 4#4)) = true
  h0006 : (!((rowBit rows 0 0 3 && rowBit rows 0 0 5 && rowBit rows 0 2 3 && rowBit rows 0 2 5))) = true
  h0007 : (!((rowBit rows 0 0 3 && rowBit rows 0 0 6 && rowBit rows 0 2 3 && rowBit rows 0 2 6))) = true
  h0008 : (!((rowBit rows 0 0 3 && rowBit rows 0 0 7 && rowBit rows 0 2 3 && rowBit rows 0 2 7))) = true
  h0009 : (!((rowBit rows 0 0 3 && rowBit rows 0 0 8 && rowBit rows 0 2 3 && rowBit rows 0 2 8))) = true
  h0010 : (!((rowBit rows 0 0 5 && rowBit rows 0 0 6 && rowBit rows 0 2 5 && rowBit rows 0 2 6))) = true
  h0011 : (!((rowBit rows 0 0 5 && rowBit rows 0 0 7 && rowBit rows 0 2 5 && rowBit rows 0 2 7))) = true
  h0012 : (!((rowBit rows 0 0 5 && rowBit rows 0 0 8 && rowBit rows 0 2 5 && rowBit rows 0 2 8))) = true
  h0013 : (!((rowBit rows 0 0 5 && rowBit rows 0 0 9 && rowBit rows 0 2 5 && rowBit rows 0 2 9))) = true
  h0014 : (!((rowBit rows 0 0 5 && rowBit rows 0 0 10 && rowBit rows 0 2 5 && rowBit rows 0 2 10))) = true
  h0015 : (!((rowBit rows 0 0 5 && rowBit rows 0 0 12 && rowBit rows 0 2 5 && rowBit rows 0 2 12))) = true
  h0016 : (!((rowBit rows 0 0 6 && rowBit rows 0 0 7 && rowBit rows 0 2 6 && rowBit rows 0 2 7))) = true
  h0017 : (!((rowBit rows 0 0 6 && rowBit rows 0 0 8 && rowBit rows 0 2 6 && rowBit rows 0 2 8))) = true
  h0018 : (!((rowBit rows 0 0 6 && rowBit rows 0 0 9 && rowBit rows 0 2 6 && rowBit rows 0 2 9))) = true
  h0019 : (!((rowBit rows 0 0 6 && rowBit rows 0 0 10 && rowBit rows 0 2 6 && rowBit rows 0 2 10))) = true
  h0020 : (!((rowBit rows 0 0 6 && rowBit rows 0 0 11 && rowBit rows 0 2 6 && rowBit rows 0 2 11))) = true
  h0021 : (!((rowBit rows 0 0 6 && rowBit rows 0 0 12 && rowBit rows 0 2 6 && rowBit rows 0 2 12))) = true
  h0022 : (!((rowBit rows 0 0 7 && rowBit rows 0 0 8 && rowBit rows 0 2 7 && rowBit rows 0 2 8))) = true
  h0023 : (!((rowBit rows 0 0 7 && rowBit rows 0 0 9 && rowBit rows 0 2 7 && rowBit rows 0 2 9))) = true
  h0024 : (!((rowBit rows 0 0 7 && rowBit rows 0 0 10 && rowBit rows 0 2 7 && rowBit rows 0 2 10))) = true
  h0025 : (!((rowBit rows 0 0 7 && rowBit rows 0 0 11 && rowBit rows 0 2 7 && rowBit rows 0 2 11))) = true
  h0026 : (!((rowBit rows 0 0 7 && rowBit rows 0 0 12 && rowBit rows 0 2 7 && rowBit rows 0 2 12))) = true
  h0027 : ((((bif rowBit rows 0 4 4 then 1#4 else 0#4) + (bif rowBit rows 0 4 5 then 1#4 else 0#4) + (bif rowBit rows 0 4 6 then 1#4 else 0#4) + (bif rowBit rows 0 4 7 then 1#4 else 0#4) + (bif rowBit rows 0 4 8 then 1#4 else 0#4))).ule 1#4) = true
  h0028 : ((((bif rowBit rows 0 0 0 then 1#4 else 0#4) + (bif rowBit rows 0 0 8 then 1#4 else 0#4) + (bif rowBit rows 0 0 9 then 1#4 else 0#4) + (bif rowBit rows 0 0 10 then 1#4 else 0#4) + (bif rowBit rows 0 0 11 then 1#4 else 0#4) + (bif rowBit rows 0 0 12 then 1#4 else 0#4))).ule 1#4) = true
  h0029 : ((((bif rowBit rows 0 0 0 then 1#4 else 0#4) + (bif rowBit rows 0 0 1 then 1#4 else 0#4) + (bif rowBit rows 0 0 2 then 1#4 else 0#4) + (bif rowBit rows 0 0 3 then 1#4 else 0#4) + (bif rowBit rows 0 0 4 then 1#4 else 0#4))).ule 1#4) = true
  h0030 : ((((bif rowBit rows 0 4 0 then 1#4 else 0#4) + (bif rowBit rows 0 4 1 then 1#4 else 0#4) + (bif rowBit rows 0 4 2 then 1#4 else 0#4) + (bif rowBit rows 0 4 3 then 1#4 else 0#4) + (bif rowBit rows 0 4 4 then 1#4 else 0#4))).ule 1#4) = true
  h0031 : (!(rowBit rows 1 2 2)) = true
  h0032 : ((((bif rowBit rows 1 2 0 then 1#4 else 0#4) + (bif rowBit rows 1 2 1 then 1#4 else 0#4) + (bif rowBit rows 1 2 2 then 1#4 else 0#4) + (bif rowBit rows 1 2 3 then 1#4 else 0#4) + (bif rowBit rows 1 2 4 then 1#4 else 0#4) + (bif rowBit rows 1 2 5 then 1#4 else 0#4) + (bif rowBit rows 1 2 6 then 1#4 else 0#4) + (bif rowBit rows 1 2 7 then 1#4 else 0#4) + (bif rowBit rows 1 2 8 then 1#4 else 0#4) + (bif rowBit rows 1 2 9 then 1#4 else 0#4) + (bif rowBit rows 1 2 10 then 1#4 else 0#4) + (bif rowBit rows 1 2 11 then 1#4 else 0#4) + (bif rowBit rows 1 2 12 then 1#4 else 0#4)) == 4#4)) = true
  h0033 : (!(rowBit rows 1 6 6)) = true
  h0034 : ((((bif rowBit rows 1 6 0 then 1#4 else 0#4) + (bif rowBit rows 1 6 1 then 1#4 else 0#4) + (bif rowBit rows 1 6 2 then 1#4 else 0#4) + (bif rowBit rows 1 6 3 then 1#4 else 0#4) + (bif rowBit rows 1 6 4 then 1#4 else 0#4) + (bif rowBit rows 1 6 5 then 1#4 else 0#4) + (bif rowBit rows 1 6 6 then 1#4 else 0#4) + (bif rowBit rows 1 6 7 then 1#4 else 0#4) + (bif rowBit rows 1 6 8 then 1#4 else 0#4) + (bif rowBit rows 1 6 9 then 1#4 else 0#4) + (bif rowBit rows 1 6 10 then 1#4 else 0#4) + (bif rowBit rows 1 6 11 then 1#4 else 0#4) + (bif rowBit rows 1 6 12 then 1#4 else 0#4)) == 4#4)) = true
  h0035 : (!((rowBit rows 1 2 1 && rowBit rows 1 2 7 && rowBit rows 1 6 1 && rowBit rows 1 6 7))) = true
  h0036 : ((((bif rowBit rows 1 6 4 then 1#4 else 0#4) + (bif rowBit rows 1 6 5 then 1#4 else 0#4) + (bif rowBit rows 1 6 6 then 1#4 else 0#4) + (bif rowBit rows 1 6 7 then 1#4 else 0#4) + (bif rowBit rows 1 6 8 then 1#4 else 0#4))).ule 2#4) = true
  h0037 : (!(rowBit rows 2 5 5)) = true
  h0038 : ((((bif rowBit rows 2 5 0 then 1#4 else 0#4) + (bif rowBit rows 2 5 1 then 1#4 else 0#4) + (bif rowBit rows 2 5 2 then 1#4 else 0#4) + (bif rowBit rows 2 5 3 then 1#4 else 0#4) + (bif rowBit rows 2 5 4 then 1#4 else 0#4) + (bif rowBit rows 2 5 5 then 1#4 else 0#4) + (bif rowBit rows 2 5 6 then 1#4 else 0#4) + (bif rowBit rows 2 5 7 then 1#4 else 0#4) + (bif rowBit rows 2 5 8 then 1#4 else 0#4) + (bif rowBit rows 2 5 9 then 1#4 else 0#4) + (bif rowBit rows 2 5 10 then 1#4 else 0#4) + (bif rowBit rows 2 5 11 then 1#4 else 0#4) + (bif rowBit rows 2 5 12 then 1#4 else 0#4)) == 4#4)) = true
  h0039 : ((((bif rowBit rows 2 5 4 then 1#4 else 0#4) + (bif rowBit rows 2 5 5 then 1#4 else 0#4) + (bif rowBit rows 2 5 6 then 1#4 else 0#4) + (bif rowBit rows 2 5 7 then 1#4 else 0#4) + (bif rowBit rows 2 5 8 then 1#4 else 0#4))).ule 2#4) = true
  h0040 : (!((rowBit rows 0 0 1 && rowBit rows 0 0 5 && rowBit rows 1 6 1 && rowBit rows 1 6 5))) = true
  h0041 : (!((rowBit rows 0 0 2 && rowBit rows 0 0 5 && rowBit rows 1 6 2 && rowBit rows 1 6 5))) = true
  h0042 : (!((rowBit rows 0 0 3 && rowBit rows 0 0 5 && rowBit rows 1 6 3 && rowBit rows 1 6 5))) = true
  h0043 : (!((rowBit rows 0 0 4 && rowBit rows 0 0 5 && rowBit rows 1 6 4 && rowBit rows 1 6 5))) = true
  h0044 : (!((rowBit rows 0 0 7 && rowBit rows 0 0 8 && rowBit rows 1 6 7 && rowBit rows 1 6 8))) = true
  h0045 : (!((rowBit rows 0 0 7 && rowBit rows 0 0 9 && rowBit rows 1 6 7 && rowBit rows 1 6 9))) = true
  h0046 : (!((rowBit rows 0 0 7 && rowBit rows 0 0 10 && rowBit rows 1 6 7 && rowBit rows 1 6 10))) = true
  h0047 : (!((rowBit rows 0 0 7 && rowBit rows 0 0 11 && rowBit rows 1 6 7 && rowBit rows 1 6 11))) = true
  h0048 : (!((rowBit rows 0 0 7 && rowBit rows 0 0 12 && rowBit rows 1 6 7 && rowBit rows 1 6 12))) = true
  h0049 : ((((bif (rowBit rows 0 2 0 && rowBit rows 1 6 0) then 1#4 else 0#4) + (bif (rowBit rows 0 2 1 && rowBit rows 1 6 1) then 1#4 else 0#4) + (bif (rowBit rows 0 2 2 && rowBit rows 1 6 2) then 1#4 else 0#4) + (bif (rowBit rows 0 2 3 && rowBit rows 1 6 3) then 1#4 else 0#4) + (bif (rowBit rows 0 2 4 && rowBit rows 1 6 4) then 1#4 else 0#4) + (bif (rowBit rows 0 2 5 && rowBit rows 1 6 5) then 1#4 else 0#4) + (bif (rowBit rows 0 2 6 && rowBit rows 1 6 6) then 1#4 else 0#4) + (bif (rowBit rows 0 2 7 && rowBit rows 1 6 7) then 1#4 else 0#4) + (bif (rowBit rows 0 2 8 && rowBit rows 1 6 8) then 1#4 else 0#4) + (bif (rowBit rows 0 2 9 && rowBit rows 1 6 9) then 1#4 else 0#4) + (bif (rowBit rows 0 2 10 && rowBit rows 1 6 10) then 1#4 else 0#4) + (bif (rowBit rows 0 2 11 && rowBit rows 1 6 11) then 1#4 else 0#4) + (bif (rowBit rows 0 2 12 && rowBit rows 1 6 12) then 1#4 else 0#4))).ule 2#4) = true
  h0050 : (!((rowBit rows 0 2 1 && rowBit rows 0 2 7 && rowBit rows 1 6 1 && rowBit rows 1 6 7))) = true
  h0051 : (!((rowBit rows 0 2 1 && rowBit rows 0 2 8 && rowBit rows 1 6 1 && rowBit rows 1 6 8))) = true
  h0052 : (!((rowBit rows 0 2 1 && rowBit rows 0 2 9 && rowBit rows 1 6 1 && rowBit rows 1 6 9))) = true
  h0053 : (!((rowBit rows 0 2 1 && rowBit rows 0 2 10 && rowBit rows 1 6 1 && rowBit rows 1 6 10))) = true
  h0054 : (!((rowBit rows 0 2 1 && rowBit rows 0 2 11 && rowBit rows 1 6 1 && rowBit rows 1 6 11))) = true
  h0055 : (!((rowBit rows 0 2 1 && rowBit rows 0 2 12 && rowBit rows 1 6 1 && rowBit rows 1 6 12))) = true
  h0056 : (!((rowBit rows 0 2 3 && rowBit rows 0 2 5 && rowBit rows 1 6 3 && rowBit rows 1 6 5))) = true
  h0057 : (!((rowBit rows 0 2 7 && rowBit rows 0 2 8 && rowBit rows 1 6 7 && rowBit rows 1 6 8))) = true
  h0058 : (!((rowBit rows 0 2 7 && rowBit rows 0 2 10 && rowBit rows 1 6 7 && rowBit rows 1 6 10))) = true
  h0059 : (!((rowBit rows 0 2 7 && rowBit rows 0 2 11 && rowBit rows 1 6 7 && rowBit rows 1 6 11))) = true
  h0060 : (!((rowBit rows 0 2 7 && rowBit rows 0 2 12 && rowBit rows 1 6 7 && rowBit rows 1 6 12))) = true
  h0061 : (!((rowBit rows 0 2 8 && rowBit rows 0 2 9 && rowBit rows 1 6 8 && rowBit rows 1 6 9))) = true
  h0062 : (!((rowBit rows 0 2 8 && rowBit rows 0 2 10 && rowBit rows 1 6 8 && rowBit rows 1 6 10))) = true
  h0063 : (!((rowBit rows 0 2 8 && rowBit rows 0 2 11 && rowBit rows 1 6 8 && rowBit rows 1 6 11))) = true
  h0064 : (!((rowBit rows 0 2 8 && rowBit rows 0 2 12 && rowBit rows 1 6 8 && rowBit rows 1 6 12))) = true
  h0065 : (!((rowBit rows 0 0 6 && rowBit rows 0 0 7 && rowBit rows 2 5 6 && rowBit rows 2 5 7))) = true
  h0066 : (!((rowBit rows 0 0 6 && rowBit rows 0 0 8 && rowBit rows 2 5 6 && rowBit rows 2 5 8))) = true
  h0067 : (!((rowBit rows 0 0 6 && rowBit rows 0 0 9 && rowBit rows 2 5 6 && rowBit rows 2 5 9))) = true
  h0068 : (!((rowBit rows 0 0 6 && rowBit rows 0 0 10 && rowBit rows 2 5 6 && rowBit rows 2 5 10))) = true
  h0069 : (!((rowBit rows 0 0 6 && rowBit rows 0 0 11 && rowBit rows 2 5 6 && rowBit rows 2 5 11))) = true
  h0070 : (!((rowBit rows 0 0 6 && rowBit rows 0 0 12 && rowBit rows 2 5 6 && rowBit rows 2 5 12))) = true
  h0071 : (!((rowBit rows 0 0 7 && rowBit rows 0 0 8 && rowBit rows 2 5 7 && rowBit rows 2 5 8))) = true
  h0072 : (!((rowBit rows 0 0 7 && rowBit rows 0 0 9 && rowBit rows 2 5 7 && rowBit rows 2 5 9))) = true
  h0073 : (!((rowBit rows 0 0 7 && rowBit rows 0 0 10 && rowBit rows 2 5 7 && rowBit rows 2 5 10))) = true
  h0074 : (!((rowBit rows 0 0 7 && rowBit rows 0 0 11 && rowBit rows 2 5 7 && rowBit rows 2 5 11))) = true
  h0075 : (!((rowBit rows 0 0 7 && rowBit rows 0 0 12 && rowBit rows 2 5 7 && rowBit rows 2 5 12))) = true
  h0076 : ((((bif (rowBit rows 0 2 0 && rowBit rows 2 5 0) then 1#4 else 0#4) + (bif (rowBit rows 0 2 1 && rowBit rows 2 5 1) then 1#4 else 0#4) + (bif (rowBit rows 0 2 2 && rowBit rows 2 5 2) then 1#4 else 0#4) + (bif (rowBit rows 0 2 3 && rowBit rows 2 5 3) then 1#4 else 0#4) + (bif (rowBit rows 0 2 4 && rowBit rows 2 5 4) then 1#4 else 0#4) + (bif (rowBit rows 0 2 5 && rowBit rows 2 5 5) then 1#4 else 0#4) + (bif (rowBit rows 0 2 6 && rowBit rows 2 5 6) then 1#4 else 0#4) + (bif (rowBit rows 0 2 7 && rowBit rows 2 5 7) then 1#4 else 0#4) + (bif (rowBit rows 0 2 8 && rowBit rows 2 5 8) then 1#4 else 0#4) + (bif (rowBit rows 0 2 9 && rowBit rows 2 5 9) then 1#4 else 0#4) + (bif (rowBit rows 0 2 10 && rowBit rows 2 5 10) then 1#4 else 0#4) + (bif (rowBit rows 0 2 11 && rowBit rows 2 5 11) then 1#4 else 0#4) + (bif (rowBit rows 0 2 12 && rowBit rows 2 5 12) then 1#4 else 0#4))).ule 2#4) = true
  h0077 : (!((rowBit rows 0 2 1 && rowBit rows 0 2 6 && rowBit rows 2 5 1 && rowBit rows 2 5 6))) = true
  h0078 : (!((rowBit rows 0 2 1 && rowBit rows 0 2 7 && rowBit rows 2 5 1 && rowBit rows 2 5 7))) = true
  h0079 : (!((rowBit rows 0 2 1 && rowBit rows 0 2 8 && rowBit rows 2 5 1 && rowBit rows 2 5 8))) = true
  h0080 : (!((rowBit rows 0 2 1 && rowBit rows 0 2 10 && rowBit rows 2 5 1 && rowBit rows 2 5 10))) = true
  h0081 : (!((rowBit rows 0 2 1 && rowBit rows 0 2 11 && rowBit rows 2 5 1 && rowBit rows 2 5 11))) = true
  h0082 : (!((rowBit rows 0 2 1 && rowBit rows 0 2 12 && rowBit rows 2 5 1 && rowBit rows 2 5 12))) = true
  h0083 : (!((rowBit rows 0 2 6 && rowBit rows 0 2 7 && rowBit rows 2 5 6 && rowBit rows 2 5 7))) = true
  h0084 : (!((rowBit rows 0 2 6 && rowBit rows 0 2 8 && rowBit rows 2 5 6 && rowBit rows 2 5 8))) = true
  h0085 : (!((rowBit rows 0 2 6 && rowBit rows 0 2 9 && rowBit rows 2 5 6 && rowBit rows 2 5 9))) = true
  h0086 : (!((rowBit rows 0 2 6 && rowBit rows 0 2 12 && rowBit rows 2 5 6 && rowBit rows 2 5 12))) = true
  h0087 : (!((rowBit rows 0 2 7 && rowBit rows 0 2 8 && rowBit rows 2 5 7 && rowBit rows 2 5 8))) = true
  h0088 : (!((rowBit rows 0 2 7 && rowBit rows 0 2 9 && rowBit rows 2 5 7 && rowBit rows 2 5 9))) = true
  h0089 : (!((rowBit rows 0 2 7 && rowBit rows 0 2 10 && rowBit rows 2 5 7 && rowBit rows 2 5 10))) = true
  h0090 : (!((rowBit rows 0 2 7 && rowBit rows 0 2 11 && rowBit rows 2 5 7 && rowBit rows 2 5 11))) = true
  h0091 : (!((rowBit rows 0 2 7 && rowBit rows 0 2 12 && rowBit rows 2 5 7 && rowBit rows 2 5 12))) = true
  h0092 : (!((rowBit rows 0 2 8 && rowBit rows 0 2 9 && rowBit rows 2 5 8 && rowBit rows 2 5 9))) = true
  h0093 : (!((rowBit rows 0 2 8 && rowBit rows 0 2 10 && rowBit rows 2 5 8 && rowBit rows 2 5 10))) = true
  h0094 : (!((rowBit rows 0 2 8 && rowBit rows 0 2 11 && rowBit rows 2 5 8 && rowBit rows 2 5 11))) = true
  h0095 : (!((rowBit rows 0 2 8 && rowBit rows 0 2 12 && rowBit rows 2 5 8 && rowBit rows 2 5 12))) = true
  h0096 : (!((rowBit rows 2 5 0 && rowBit rows 2 5 4 && rowBit rows 1 6 0 && rowBit rows 1 6 4))) = true
  h0097 : (!((rowBit rows 2 5 0 && rowBit rows 2 5 7 && rowBit rows 1 6 0 && rowBit rows 1 6 7))) = true
  h0098 : (!((rowBit rows 2 5 0 && rowBit rows 2 5 8 && rowBit rows 1 6 0 && rowBit rows 1 6 8))) = true
  h0099 : (!((rowBit rows 2 5 1 && rowBit rows 2 5 4 && rowBit rows 1 6 1 && rowBit rows 1 6 4))) = true
  h0100 : (!((rowBit rows 2 5 1 && rowBit rows 2 5 7 && rowBit rows 1 6 1 && rowBit rows 1 6 7))) = true
  h0101 : (!((rowBit rows 2 5 1 && rowBit rows 2 5 8 && rowBit rows 1 6 1 && rowBit rows 1 6 8))) = true
  h0102 : (!((rowBit rows 2 5 2 && rowBit rows 2 5 4 && rowBit rows 1 6 2 && rowBit rows 1 6 4))) = true
  h0103 : (!((rowBit rows 2 5 2 && rowBit rows 2 5 7 && rowBit rows 1 6 2 && rowBit rows 1 6 7))) = true
  h0104 : (!((rowBit rows 2 5 2 && rowBit rows 2 5 8 && rowBit rows 1 6 2 && rowBit rows 1 6 8))) = true
  h0105 : (!((rowBit rows 2 5 2 && rowBit rows 2 5 11 && rowBit rows 1 6 2 && rowBit rows 1 6 11))) = true
  h0106 : (!((rowBit rows 2 5 2 && rowBit rows 2 5 12 && rowBit rows 1 6 2 && rowBit rows 1 6 12))) = true
  h0107 : (!((rowBit rows 2 5 3 && rowBit rows 2 5 4 && rowBit rows 1 6 3 && rowBit rows 1 6 4))) = true
  h0108 : (!((rowBit rows 2 5 3 && rowBit rows 2 5 7 && rowBit rows 1 6 3 && rowBit rows 1 6 7))) = true
  h0109 : (!((rowBit rows 2 5 3 && rowBit rows 2 5 8 && rowBit rows 1 6 3 && rowBit rows 1 6 8))) = true
  h0110 : (!((rowBit rows 2 5 3 && rowBit rows 2 5 9 && rowBit rows 1 6 3 && rowBit rows 1 6 9))) = true
  h0111 : (!((rowBit rows 2 5 3 && rowBit rows 2 5 10 && rowBit rows 1 6 3 && rowBit rows 1 6 10))) = true
  h0112 : (!((rowBit rows 2 5 3 && rowBit rows 2 5 11 && rowBit rows 1 6 3 && rowBit rows 1 6 11))) = true
  h0113 : (!((rowBit rows 2 5 3 && rowBit rows 2 5 12 && rowBit rows 1 6 3 && rowBit rows 1 6 12))) = true
  h0114 : (!((rowBit rows 2 5 4 && rowBit rows 2 5 7 && rowBit rows 1 6 4 && rowBit rows 1 6 7))) = true
  h0115 : (!((rowBit rows 2 5 4 && rowBit rows 2 5 8 && rowBit rows 1 6 4 && rowBit rows 1 6 8))) = true
  h0116 : (!((rowBit rows 2 5 4 && rowBit rows 2 5 9 && rowBit rows 1 6 4 && rowBit rows 1 6 9))) = true
  h0117 : (!((rowBit rows 2 5 4 && rowBit rows 2 5 10 && rowBit rows 1 6 4 && rowBit rows 1 6 10))) = true
  h0118 : (!((rowBit rows 2 5 4 && rowBit rows 2 5 11 && rowBit rows 1 6 4 && rowBit rows 1 6 11))) = true
  h0119 : (!((rowBit rows 2 5 4 && rowBit rows 2 5 12 && rowBit rows 1 6 4 && rowBit rows 1 6 12))) = true
  h0120 : (!((rowBit rows 2 5 7 && rowBit rows 2 5 8 && rowBit rows 1 6 7 && rowBit rows 1 6 8))) = true
  h0121 : (!((rowBit rows 2 5 7 && rowBit rows 2 5 9 && rowBit rows 1 6 7 && rowBit rows 1 6 9))) = true
  h0122 : (!((rowBit rows 2 5 7 && rowBit rows 2 5 10 && rowBit rows 1 6 7 && rowBit rows 1 6 10))) = true
  h0123 : (!((rowBit rows 2 5 7 && rowBit rows 2 5 11 && rowBit rows 1 6 7 && rowBit rows 1 6 11))) = true
  h0124 : (!((rowBit rows 2 5 7 && rowBit rows 2 5 12 && rowBit rows 1 6 7 && rowBit rows 1 6 12))) = true
  h0125 : (!((rowBit rows 2 5 8 && rowBit rows 2 5 10 && rowBit rows 1 6 8 && rowBit rows 1 6 10))) = true
  h0126 : (!((rowBit rows 2 5 8 && rowBit rows 2 5 11 && rowBit rows 1 6 8 && rowBit rows 1 6 11))) = true
  h0127 : (!((rowBit rows 2 5 8 && rowBit rows 2 5 12 && rowBit rows 1 6 8 && rowBit rows 1 6 12))) = true
  h0128 : ((((bif shellBit shell 0 then 1#4 else 0#4) + (bif shellBit shell 1 then 1#4 else 0#4) + (bif shellBit shell 2 then 1#4 else 0#4) + (bif shellBit shell 3 then 1#4 else 0#4) + (bif shellBit shell 4 then 1#4 else 0#4) + (bif shellBit shell 5 then 1#4 else 0#4) + (bif shellBit shell 6 then 1#4 else 0#4) + (bif shellBit shell 7 then 1#4 else 0#4) + (bif shellBit shell 8 then 1#4 else 0#4) + (bif shellBit shell 9 then 1#4 else 0#4) + (bif shellBit shell 10 then 1#4 else 0#4) + (bif shellBit shell 11 then 1#4 else 0#4) + (bif shellBit shell 12 then 1#4 else 0#4)) == 5#4)) = true
  h0129 : (shellBit shell 1) = true
  h0130 : (shellBit shell 2) = true
  h0131 : (shellBit shell 3) = true
  h0132 : ((((bif shellBit shell 4 then 1#4 else 0#4) + (bif shellBit shell 5 then 1#4 else 0#4) + (bif shellBit shell 6 then 1#4 else 0#4) + (bif shellBit shell 7 then 1#4 else 0#4)) == 1#4)) = true
  h0133 : ((((bif shellBit shell 0 then 1#4 else 0#4) + (bif shellBit shell 9 then 1#4 else 0#4) + (bif shellBit shell 10 then 1#4 else 0#4) + (bif shellBit shell 11 then 1#4 else 0#4) + (bif shellBit shell 12 then 1#4 else 0#4)) == 1#4)) = true
  h0134 : ((!(((blockerAt blockers 0 == 2#4) || (blockerAt blockers 1 == 2#4) || (blockerAt blockers 2 == 2#4) || (blockerAt blockers 3 == 2#4) || (blockerAt blockers 4 == 2#4) || (blockerAt blockers 5 == 2#4) || (blockerAt blockers 6 == 2#4) || (blockerAt blockers 7 == 2#4) || (blockerAt blockers 8 == 2#4) || (blockerAt blockers 9 == 2#4) || (blockerAt blockers 10 == 2#4) || (blockerAt blockers 11 == 2#4) || (blockerAt blockers 12 == 2#4))) || ((rowBit rows 1 2 0 == rowBit rows 0 2 0)))) = true
  h0135 : ((!(((blockerAt blockers 0 == 2#4) || (blockerAt blockers 1 == 2#4) || (blockerAt blockers 2 == 2#4) || (blockerAt blockers 3 == 2#4) || (blockerAt blockers 4 == 2#4) || (blockerAt blockers 5 == 2#4) || (blockerAt blockers 6 == 2#4) || (blockerAt blockers 7 == 2#4) || (blockerAt blockers 8 == 2#4) || (blockerAt blockers 9 == 2#4) || (blockerAt blockers 10 == 2#4) || (blockerAt blockers 11 == 2#4) || (blockerAt blockers 12 == 2#4))) || ((rowBit rows 1 2 1 == rowBit rows 0 2 1)))) = true
  h0136 : ((!(((blockerAt blockers 0 == 2#4) || (blockerAt blockers 1 == 2#4) || (blockerAt blockers 2 == 2#4) || (blockerAt blockers 3 == 2#4) || (blockerAt blockers 4 == 2#4) || (blockerAt blockers 5 == 2#4) || (blockerAt blockers 6 == 2#4) || (blockerAt blockers 7 == 2#4) || (blockerAt blockers 8 == 2#4) || (blockerAt blockers 9 == 2#4) || (blockerAt blockers 10 == 2#4) || (blockerAt blockers 11 == 2#4) || (blockerAt blockers 12 == 2#4))) || ((rowBit rows 1 2 3 == rowBit rows 0 2 3)))) = true
  h0137 : ((!(((blockerAt blockers 0 == 2#4) || (blockerAt blockers 1 == 2#4) || (blockerAt blockers 2 == 2#4) || (blockerAt blockers 3 == 2#4) || (blockerAt blockers 4 == 2#4) || (blockerAt blockers 5 == 2#4) || (blockerAt blockers 6 == 2#4) || (blockerAt blockers 7 == 2#4) || (blockerAt blockers 8 == 2#4) || (blockerAt blockers 9 == 2#4) || (blockerAt blockers 10 == 2#4) || (blockerAt blockers 11 == 2#4) || (blockerAt blockers 12 == 2#4))) || ((rowBit rows 1 2 4 == rowBit rows 0 2 4)))) = true
  h0138 : ((!(((blockerAt blockers 0 == 2#4) || (blockerAt blockers 1 == 2#4) || (blockerAt blockers 2 == 2#4) || (blockerAt blockers 3 == 2#4) || (blockerAt blockers 4 == 2#4) || (blockerAt blockers 5 == 2#4) || (blockerAt blockers 6 == 2#4) || (blockerAt blockers 7 == 2#4) || (blockerAt blockers 8 == 2#4) || (blockerAt blockers 9 == 2#4) || (blockerAt blockers 10 == 2#4) || (blockerAt blockers 11 == 2#4) || (blockerAt blockers 12 == 2#4))) || ((rowBit rows 1 2 6 == rowBit rows 0 2 6)))) = true
  h0139 : ((!(((blockerAt blockers 0 == 2#4) || (blockerAt blockers 1 == 2#4) || (blockerAt blockers 2 == 2#4) || (blockerAt blockers 3 == 2#4) || (blockerAt blockers 4 == 2#4) || (blockerAt blockers 5 == 2#4) || (blockerAt blockers 6 == 2#4) || (blockerAt blockers 7 == 2#4) || (blockerAt blockers 8 == 2#4) || (blockerAt blockers 9 == 2#4) || (blockerAt blockers 10 == 2#4) || (blockerAt blockers 11 == 2#4) || (blockerAt blockers 12 == 2#4))) || ((rowBit rows 1 2 8 == rowBit rows 0 2 8)))) = true
  h0140 : ((!(((blockerAt blockers 0 == 2#4) || (blockerAt blockers 1 == 2#4) || (blockerAt blockers 2 == 2#4) || (blockerAt blockers 3 == 2#4) || (blockerAt blockers 4 == 2#4) || (blockerAt blockers 5 == 2#4) || (blockerAt blockers 6 == 2#4) || (blockerAt blockers 7 == 2#4) || (blockerAt blockers 8 == 2#4) || (blockerAt blockers 9 == 2#4) || (blockerAt blockers 10 == 2#4) || (blockerAt blockers 11 == 2#4) || (blockerAt blockers 12 == 2#4))) || ((rowBit rows 1 2 10 == rowBit rows 0 2 10)))) = true
  h0141 : ((!(((blockerAt blockers 0 == 2#4) || (blockerAt blockers 1 == 2#4) || (blockerAt blockers 2 == 2#4) || (blockerAt blockers 3 == 2#4) || (blockerAt blockers 4 == 2#4) || (blockerAt blockers 5 == 2#4) || (blockerAt blockers 6 == 2#4) || (blockerAt blockers 7 == 2#4) || (blockerAt blockers 8 == 2#4) || (blockerAt blockers 9 == 2#4) || (blockerAt blockers 10 == 2#4) || (blockerAt blockers 11 == 2#4) || (blockerAt blockers 12 == 2#4))) || ((rowBit rows 1 2 11 == rowBit rows 0 2 11)))) = true
  h0142 : ((!(((blockerAt blockers 0 == 2#4) || (blockerAt blockers 1 == 2#4) || (blockerAt blockers 2 == 2#4) || (blockerAt blockers 3 == 2#4) || (blockerAt blockers 4 == 2#4) || (blockerAt blockers 5 == 2#4) || (blockerAt blockers 6 == 2#4) || (blockerAt blockers 7 == 2#4) || (blockerAt blockers 8 == 2#4) || (blockerAt blockers 9 == 2#4) || (blockerAt blockers 10 == 2#4) || (blockerAt blockers 11 == 2#4) || (blockerAt blockers 12 == 2#4))) || ((rowBit rows 1 2 12 == rowBit rows 0 2 12)))) = true
  h0143 : ((((bif firstRowBit b1 0 then 1#4 else 0#4) + (bif firstRowBit b1 1 then 1#4 else 0#4) + (bif firstRowBit b1 2 then 1#4 else 0#4) + (bif firstRowBit b1 3 then 1#4 else 0#4) + (bif firstRowBit b1 4 then 1#4 else 0#4) + (bif firstRowBit b1 5 then 1#4 else 0#4) + (bif firstRowBit b1 6 then 1#4 else 0#4) + (bif firstRowBit b1 7 then 1#4 else 0#4) + (bif firstRowBit b1 8 then 1#4 else 0#4) + (bif firstRowBit b1 9 then 1#4 else 0#4) + (bif firstRowBit b1 10 then 1#4 else 0#4) + (bif firstRowBit b1 11 then 1#4 else 0#4) + (bif firstRowBit b1 12 then 1#4 else 0#4)) == 4#4)) = true
  h0144 : (!(firstRowBit b1 4)) = true

/-- All source assertions in the first three verified certificate chunks,
through generated assertion `h0144`. -/
theorem directSource_baseAssertions
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    {Q : FrontierBiApexRobustExactFiveSecondCapResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {M : PhysicalActualCriticalMutualOmissionPair H profile}
    {N : SourceTwoHitNormalForm Q profile M}
    {P : CanonicalAsymmetricRolePrepacket N}
    {star : PhysicalGlobalCrossDeletionStar profile}
    {first : FirstApexShellRolePacket F R}
    {T : CanonicalAsymmetricSemanticRowTable P star first}
    (C : CanonicalCoverFamilies T) :
    DirectSourceBaseAssertions
      (directSourceRows C) (directSourceBlockers T)
      (directSourceShell T) (directSourceFirstRow T) := by
  exact {
    h0000 := directSource_row_center_excluded C 0 0
    h0001 := by simpa [bitCount13] using directSource_row_card_eq_four C (0 : Fin 3) (0 : Fin 13)
    h0002 := directSource_row_center_excluded C 0 2
    h0003 := by simpa [bitCount13] using directSource_row_card_eq_four C (0 : Fin 3) (2 : Fin 13)
    h0004 := directSource_row_center_excluded C 0 4
    h0005 := by simpa [bitCount13] using directSource_row_card_eq_four C (0 : Fin 3) (4 : Fin 13)
    h0006 := directSource_sharedPair_centersBeforePoints C 0 0 0 2 3 5 (by decide) (by decide) (by decide)
    h0007 := directSource_sharedPair_centersBeforePoints C 0 0 0 2 3 6 (by decide) (by decide) (by decide)
    h0008 := directSource_sharedPair_centersBeforePoints C 0 0 0 2 3 7 (by decide) (by decide) (by decide)
    h0009 := directSource_sharedPair_centersBeforePoints C 0 0 0 2 3 8 (by decide) (by decide) (by decide)
    h0010 := directSource_sharedPair_centersBeforePoints C 0 0 0 2 5 6 (by decide) (by decide) (by decide)
    h0011 := directSource_sharedPair_centersBeforePoints C 0 0 0 2 5 7 (by decide) (by decide) (by decide)
    h0012 := directSource_sharedPair_centersBeforePoints C 0 0 0 2 5 8 (by decide) (by decide) (by decide)
    h0013 := directSource_sharedPair_centersBeforePoints C 0 0 0 2 5 9 (by decide) (by decide) (by decide)
    h0014 := directSource_sharedPair_centersBeforePoints C 0 0 0 2 5 10 (by decide) (by decide) (by decide)
    h0015 := directSource_sharedPair_centersBeforePoints C 0 0 0 2 5 12 (by decide) (by decide) (by decide)
    h0016 := directSource_sharedPair_centersBeforePoints C 0 0 0 2 6 7 (by decide) (by decide) (by decide)
    h0017 := directSource_sharedPair_centersBeforePoints C 0 0 0 2 6 8 (by decide) (by decide) (by decide)
    h0018 := directSource_sharedPair_centersBeforePoints C 0 0 0 2 6 9 (by decide) (by decide) (by decide)
    h0019 := directSource_sharedPair_centersBeforePoints C 0 0 0 2 6 10 (by decide) (by decide) (by decide)
    h0020 := directSource_sharedPair_centersBeforePoints C 0 0 0 2 6 11 (by decide) (by decide) (by decide)
    h0021 := directSource_sharedPair_centersBeforePoints C 0 0 0 2 6 12 (by decide) (by decide) (by decide)
    h0022 := directSource_sharedPair_centersBeforePoints C 0 0 0 2 7 8 (by decide) (by decide) (by decide)
    h0023 := directSource_sharedPair_centersBeforePoints C 0 0 0 2 7 9 (by decide) (by decide) (by decide)
    h0024 := directSource_sharedPair_centersBeforePoints C 0 0 0 2 7 10 (by decide) (by decide) (by decide)
    h0025 := directSource_sharedPair_centersBeforePoints C 0 0 0 2 7 11 (by decide) (by decide) (by decide)
    h0026 := directSource_sharedPair_centersBeforePoints C 0 0 0 2 7 12 (by decide) (by decide) (by decide)
    h0027 := by simpa [bitCountMiddleFive] using directSource_mainFour_middle_card_le_one C
    h0028 := by simpa [bitCountFirstWrapSix] using directSource_mainZero_firstWrap_card_le_one C
    h0029 := by simpa [bitCountSecondFive] using directSource_mainZero_second_card_le_one C
    h0030 := by simpa [bitCountSecondFive] using directSource_mainFour_second_card_le_one C
    h0031 := directSource_row_center_excluded C 1 2
    h0032 := by simpa [bitCount13] using directSource_row_card_eq_four C (1 : Fin 3) (2 : Fin 13)
    h0033 := directSource_row_center_excluded C 1 6
    h0034 := by simpa [bitCount13] using directSource_row_card_eq_four C (1 : Fin 3) (6 : Fin 13)
    h0035 := directSource_sharedPair_pointsAroundCenters C 1 1 2 6 1 7 (by decide) (by decide) (by decide)
    h0036 := by simpa [bitCountMiddleFive] using directSource_middle_card_le_two C (1 : Fin 3) (6 : Fin 13) (by decide) (by decide)
    h0037 := directSource_row_center_excluded C 2 5
    h0038 := by simpa [bitCount13] using directSource_row_card_eq_four C (2 : Fin 3) (5 : Fin 13)
    h0039 := by simpa [bitCountMiddleFive] using directSource_middle_card_le_two C (2 : Fin 3) (5 : Fin 13) (by decide) (by decide)
    h0040 := directSource_sharedPair_centersAroundPoints C 0 1 0 6 1 5 (by decide) (by decide) (by decide)
    h0041 := directSource_sharedPair_centersAroundPoints C 0 1 0 6 2 5 (by decide) (by decide) (by decide)
    h0042 := directSource_sharedPair_centersAroundPoints C 0 1 0 6 3 5 (by decide) (by decide) (by decide)
    h0043 := directSource_sharedPair_centersAroundPoints C 0 1 0 6 4 5 (by decide) (by decide) (by decide)
    h0044 := directSource_sharedPair_centersBeforePoints C 0 1 0 6 7 8 (by decide) (by decide) (by decide)
    h0045 := directSource_sharedPair_centersBeforePoints C 0 1 0 6 7 9 (by decide) (by decide) (by decide)
    h0046 := directSource_sharedPair_centersBeforePoints C 0 1 0 6 7 10 (by decide) (by decide) (by decide)
    h0047 := directSource_sharedPair_centersBeforePoints C 0 1 0 6 7 11 (by decide) (by decide) (by decide)
    h0048 := directSource_sharedPair_centersBeforePoints C 0 1 0 6 7 12 (by decide) (by decide) (by decide)
    h0049 := by simpa [bitCount13] using directSource_row_inter_card_le_two C (0 : Fin 3) (1 : Fin 3) (2 : Fin 13) (6 : Fin 13) (by decide)
    h0050 := directSource_sharedPair_pointsAroundCenters C 0 1 2 6 1 7 (by decide) (by decide) (by decide)
    h0051 := directSource_sharedPair_pointsAroundCenters C 0 1 2 6 1 8 (by decide) (by decide) (by decide)
    h0052 := directSource_sharedPair_pointsAroundCenters C 0 1 2 6 1 9 (by decide) (by decide) (by decide)
    h0053 := directSource_sharedPair_pointsAroundCenters C 0 1 2 6 1 10 (by decide) (by decide) (by decide)
    h0054 := directSource_sharedPair_pointsAroundCenters C 0 1 2 6 1 11 (by decide) (by decide) (by decide)
    h0055 := directSource_sharedPair_pointsAroundCenters C 0 1 2 6 1 12 (by decide) (by decide) (by decide)
    h0056 := directSource_sharedPair_centersAroundPoints C 0 1 2 6 3 5 (by decide) (by decide) (by decide)
    h0057 := directSource_sharedPair_centersBeforePoints C 0 1 2 6 7 8 (by decide) (by decide) (by decide)
    h0058 := directSource_sharedPair_centersBeforePoints C 0 1 2 6 7 10 (by decide) (by decide) (by decide)
    h0059 := directSource_sharedPair_centersBeforePoints C 0 1 2 6 7 11 (by decide) (by decide) (by decide)
    h0060 := directSource_sharedPair_centersBeforePoints C 0 1 2 6 7 12 (by decide) (by decide) (by decide)
    h0061 := directSource_sharedPair_centersBeforePoints C 0 1 2 6 8 9 (by decide) (by decide) (by decide)
    h0062 := directSource_sharedPair_centersBeforePoints C 0 1 2 6 8 10 (by decide) (by decide) (by decide)
    h0063 := directSource_sharedPair_centersBeforePoints C 0 1 2 6 8 11 (by decide) (by decide) (by decide)
    h0064 := directSource_sharedPair_centersBeforePoints C 0 1 2 6 8 12 (by decide) (by decide) (by decide)
    h0065 := directSource_sharedPair_centersBeforePoints C 0 2 0 5 6 7 (by decide) (by decide) (by decide)
    h0066 := directSource_sharedPair_centersBeforePoints C 0 2 0 5 6 8 (by decide) (by decide) (by decide)
    h0067 := directSource_sharedPair_centersBeforePoints C 0 2 0 5 6 9 (by decide) (by decide) (by decide)
    h0068 := directSource_sharedPair_centersBeforePoints C 0 2 0 5 6 10 (by decide) (by decide) (by decide)
    h0069 := directSource_sharedPair_centersBeforePoints C 0 2 0 5 6 11 (by decide) (by decide) (by decide)
    h0070 := directSource_sharedPair_centersBeforePoints C 0 2 0 5 6 12 (by decide) (by decide) (by decide)
    h0071 := directSource_sharedPair_centersBeforePoints C 0 2 0 5 7 8 (by decide) (by decide) (by decide)
    h0072 := directSource_sharedPair_centersBeforePoints C 0 2 0 5 7 9 (by decide) (by decide) (by decide)
    h0073 := directSource_sharedPair_centersBeforePoints C 0 2 0 5 7 10 (by decide) (by decide) (by decide)
    h0074 := directSource_sharedPair_centersBeforePoints C 0 2 0 5 7 11 (by decide) (by decide) (by decide)
    h0075 := directSource_sharedPair_centersBeforePoints C 0 2 0 5 7 12 (by decide) (by decide) (by decide)
    h0076 := by simpa [bitCount13] using directSource_row_inter_card_le_two C (0 : Fin 3) (2 : Fin 3) (2 : Fin 13) (5 : Fin 13) (by decide)
    h0077 := directSource_sharedPair_pointsAroundCenters C 0 2 2 5 1 6 (by decide) (by decide) (by decide)
    h0078 := directSource_sharedPair_pointsAroundCenters C 0 2 2 5 1 7 (by decide) (by decide) (by decide)
    h0079 := directSource_sharedPair_pointsAroundCenters C 0 2 2 5 1 8 (by decide) (by decide) (by decide)
    h0080 := directSource_sharedPair_pointsAroundCenters C 0 2 2 5 1 10 (by decide) (by decide) (by decide)
    h0081 := directSource_sharedPair_pointsAroundCenters C 0 2 2 5 1 11 (by decide) (by decide) (by decide)
    h0082 := directSource_sharedPair_pointsAroundCenters C 0 2 2 5 1 12 (by decide) (by decide) (by decide)
    h0083 := directSource_sharedPair_centersBeforePoints C 0 2 2 5 6 7 (by decide) (by decide) (by decide)
    h0084 := directSource_sharedPair_centersBeforePoints C 0 2 2 5 6 8 (by decide) (by decide) (by decide)
    h0085 := directSource_sharedPair_centersBeforePoints C 0 2 2 5 6 9 (by decide) (by decide) (by decide)
    h0086 := directSource_sharedPair_centersBeforePoints C 0 2 2 5 6 12 (by decide) (by decide) (by decide)
    h0087 := directSource_sharedPair_centersBeforePoints C 0 2 2 5 7 8 (by decide) (by decide) (by decide)
    h0088 := directSource_sharedPair_centersBeforePoints C 0 2 2 5 7 9 (by decide) (by decide) (by decide)
    h0089 := directSource_sharedPair_centersBeforePoints C 0 2 2 5 7 10 (by decide) (by decide) (by decide)
    h0090 := directSource_sharedPair_centersBeforePoints C 0 2 2 5 7 11 (by decide) (by decide) (by decide)
    h0091 := directSource_sharedPair_centersBeforePoints C 0 2 2 5 7 12 (by decide) (by decide) (by decide)
    h0092 := directSource_sharedPair_centersBeforePoints C 0 2 2 5 8 9 (by decide) (by decide) (by decide)
    h0093 := directSource_sharedPair_centersBeforePoints C 0 2 2 5 8 10 (by decide) (by decide) (by decide)
    h0094 := directSource_sharedPair_centersBeforePoints C 0 2 2 5 8 11 (by decide) (by decide) (by decide)
    h0095 := directSource_sharedPair_centersBeforePoints C 0 2 2 5 8 12 (by decide) (by decide) (by decide)
    h0096 := directSource_sharedPair_pointsBeforeCenters C 2 1 5 6 0 4 (by decide) (by decide) (by decide)
    h0097 := directSource_sharedPair_pointsAroundCenters C 2 1 5 6 0 7 (by decide) (by decide) (by decide)
    h0098 := directSource_sharedPair_pointsAroundCenters C 2 1 5 6 0 8 (by decide) (by decide) (by decide)
    h0099 := directSource_sharedPair_pointsBeforeCenters C 2 1 5 6 1 4 (by decide) (by decide) (by decide)
    h0100 := directSource_sharedPair_pointsAroundCenters C 2 1 5 6 1 7 (by decide) (by decide) (by decide)
    h0101 := directSource_sharedPair_pointsAroundCenters C 2 1 5 6 1 8 (by decide) (by decide) (by decide)
    h0102 := directSource_sharedPair_pointsBeforeCenters C 2 1 5 6 2 4 (by decide) (by decide) (by decide)
    h0103 := directSource_sharedPair_pointsAroundCenters C 2 1 5 6 2 7 (by decide) (by decide) (by decide)
    h0104 := directSource_sharedPair_pointsAroundCenters C 2 1 5 6 2 8 (by decide) (by decide) (by decide)
    h0105 := directSource_sharedPair_pointsAroundCenters C 2 1 5 6 2 11 (by decide) (by decide) (by decide)
    h0106 := directSource_sharedPair_pointsAroundCenters C 2 1 5 6 2 12 (by decide) (by decide) (by decide)
    h0107 := directSource_sharedPair_pointsBeforeCenters C 2 1 5 6 3 4 (by decide) (by decide) (by decide)
    h0108 := directSource_sharedPair_pointsAroundCenters C 2 1 5 6 3 7 (by decide) (by decide) (by decide)
    h0109 := directSource_sharedPair_pointsAroundCenters C 2 1 5 6 3 8 (by decide) (by decide) (by decide)
    h0110 := directSource_sharedPair_pointsAroundCenters C 2 1 5 6 3 9 (by decide) (by decide) (by decide)
    h0111 := directSource_sharedPair_pointsAroundCenters C 2 1 5 6 3 10 (by decide) (by decide) (by decide)
    h0112 := directSource_sharedPair_pointsAroundCenters C 2 1 5 6 3 11 (by decide) (by decide) (by decide)
    h0113 := directSource_sharedPair_pointsAroundCenters C 2 1 5 6 3 12 (by decide) (by decide) (by decide)
    h0114 := directSource_sharedPair_pointsAroundCenters C 2 1 5 6 4 7 (by decide) (by decide) (by decide)
    h0115 := directSource_sharedPair_pointsAroundCenters C 2 1 5 6 4 8 (by decide) (by decide) (by decide)
    h0116 := directSource_sharedPair_pointsAroundCenters C 2 1 5 6 4 9 (by decide) (by decide) (by decide)
    h0117 := directSource_sharedPair_pointsAroundCenters C 2 1 5 6 4 10 (by decide) (by decide) (by decide)
    h0118 := directSource_sharedPair_pointsAroundCenters C 2 1 5 6 4 11 (by decide) (by decide) (by decide)
    h0119 := directSource_sharedPair_pointsAroundCenters C 2 1 5 6 4 12 (by decide) (by decide) (by decide)
    h0120 := directSource_sharedPair_centersBeforePoints C 2 1 5 6 7 8 (by decide) (by decide) (by decide)
    h0121 := directSource_sharedPair_centersBeforePoints C 2 1 5 6 7 9 (by decide) (by decide) (by decide)
    h0122 := directSource_sharedPair_centersBeforePoints C 2 1 5 6 7 10 (by decide) (by decide) (by decide)
    h0123 := directSource_sharedPair_centersBeforePoints C 2 1 5 6 7 11 (by decide) (by decide) (by decide)
    h0124 := directSource_sharedPair_centersBeforePoints C 2 1 5 6 7 12 (by decide) (by decide) (by decide)
    h0125 := directSource_sharedPair_centersBeforePoints C 2 1 5 6 8 10 (by decide) (by decide) (by decide)
    h0126 := directSource_sharedPair_centersBeforePoints C 2 1 5 6 8 11 (by decide) (by decide) (by decide)
    h0127 := directSource_sharedPair_centersBeforePoints C 2 1 5 6 8 12 (by decide) (by decide) (by decide)
    h0128 := by simpa [bitCount13] using directSource_shell_card_eq_five T
    h0129 := directSource_shell_mem_one_two_three T 1 (by simp)
    h0130 := directSource_shell_mem_one_two_three T 2 (by simp)
    h0131 := directSource_shell_mem_one_two_three T 3 (by simp)
    h0132 := by simpa [bitCountMiddleFour] using (directSource_shell_adjacent_blocks_eq_one T).1
    h0133 := by simpa [bitCountFirstWrapFive] using (directSource_shell_adjacent_blocks_eq_one T).2
    h0134 := by
      apply (Bool.or_eq_true_eq_eq_true_or_eq_true _ _).mpr
      exact Or.inr (beq_iff_eq.mpr (directSource_leftTwo_eq_mainTwo C 0))
    h0135 := by
      apply (Bool.or_eq_true_eq_eq_true_or_eq_true _ _).mpr
      exact Or.inr (beq_iff_eq.mpr (directSource_leftTwo_eq_mainTwo C 1))
    h0136 := by
      apply (Bool.or_eq_true_eq_eq_true_or_eq_true _ _).mpr
      exact Or.inr (beq_iff_eq.mpr (directSource_leftTwo_eq_mainTwo C 3))
    h0137 := by
      apply (Bool.or_eq_true_eq_eq_true_or_eq_true _ _).mpr
      exact Or.inr (beq_iff_eq.mpr (directSource_leftTwo_eq_mainTwo C 4))
    h0138 := by
      apply (Bool.or_eq_true_eq_eq_true_or_eq_true _ _).mpr
      exact Or.inr (beq_iff_eq.mpr (directSource_leftTwo_eq_mainTwo C 6))
    h0139 := by
      apply (Bool.or_eq_true_eq_eq_true_or_eq_true _ _).mpr
      exact Or.inr (beq_iff_eq.mpr (directSource_leftTwo_eq_mainTwo C 8))
    h0140 := by
      apply (Bool.or_eq_true_eq_eq_true_or_eq_true _ _).mpr
      exact Or.inr (beq_iff_eq.mpr (directSource_leftTwo_eq_mainTwo C 10))
    h0141 := by
      apply (Bool.or_eq_true_eq_eq_true_or_eq_true _ _).mpr
      exact Or.inr (beq_iff_eq.mpr (directSource_leftTwo_eq_mainTwo C 11))
    h0142 := by
      apply (Bool.or_eq_true_eq_eq_true_or_eq_true _ _).mpr
      exact Or.inr (beq_iff_eq.mpr (directSource_leftTwo_eq_mainTwo C 12))
    h0143 := by simpa [bitCount13] using directSource_firstRow_card_eq_four T
    h0144 := directSource_firstRow_four_excluded T
  }

#print axioms directSource_baseAssertions

end

end ATailExactFiveCard13CnfIngressScratch
end Problem97
