/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import DirectSourceBaseFacts
import ParentRowIngressAdapters

/-!
# Generic base and retained-row facts for the exact-five distinct-radius ingress

This file supplies source-faithful semantic theorems used by the generated
manifest-selected assertion adapters.  It retains the asymmetric canonical
frame and the actual fixed critical-map blocker assignment.
-/

namespace Problem97
namespace ATailExactFiveCard13DistinctBaseRetainedIngressScratch

open scoped EuclideanGeometry

open ATailBiApexRobustCapBounds
open ATailCriticalPairFrontier
open ATailExactFiveCard13CnfIngressScratch
open ATailExactFiveCard13CommonLabelTransportScratch
open ATailExactFiveCard13DistinctRadiusSourceIngressCoordinatorScratch
open ATailExactFiveFirstApexCard13Scratch
open ATailExactFiveGlobalCrossDeletionPair
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

/-- Finite Boolean bridge for an at-most-two predicate on `Fin 13`. -/
private theorem bitCount13_ule_two_of_filter_card_le_two
    (member : Fin 13 → Bool)
    (hcard : (Finset.univ.filter fun i ↦ member i = true).card ≤ 2) :
    (bitCount13 member).ule 2#4 = true := by
  native_decide +revert

/-- Every canonical point belongs to the carrier. -/
private theorem canonicalPoint_mem
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
    P.point i ∈ D.A := by
  have hmem : P.point i ∈ Finset.univ.image P.point :=
    Finset.mem_image.mpr ⟨i, Finset.mem_univ _, rfl⟩
  simpa only [P.point_image] using hmem

/-- Pull back the perpendicular-bisector carrier bound to canonical indices. -/
private theorem pairCenterIndexFilter_card_le_two
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    {Q : FrontierBiApexRobustExactFiveSecondCapResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {M : PhysicalActualCriticalMutualOmissionPair H profile}
    {N : SourceTwoHitNormalForm Q profile M}
    (P : CanonicalAsymmetricRolePrepacket N) (left right : Fin 13)
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
      ⟨canonicalPoint_mem P index,
        hmember index (Finset.mem_filter.mp hindex).2⟩
  calc
    indices.card = (indices.image P.point).card :=
      (Finset.card_image_of_injective _ P.point_injective).symm
    _ ≤ bisectors.card := Finset.card_le_card hsub
    _ ≤ 2 := Dumitrescu.perpBisector_apex_bound D.convex
      (canonicalPoint_mem P left) (canonicalPoint_mem P right)
      (P.point_injective.ne hne)

/-- A fixed pair occurs in one source row family at at most two carrier
centers.  This is the asymmetric source-faithful version of the corresponding
all-one theorem. -/
theorem directSource_family_pair_center_count_le_two
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
    (family : Fin 3) (left right : Fin 13) (hne : left ≠ right) :
    (bitCount13 fun center ↦
      rowBit (directSourceRows C) family.val center.val left.val &&
        rowBit (directSourceRows C) family.val center.val right.val).ule 2#4 = true := by
  apply bitCount13_ule_two_of_filter_card_le_two
  apply pairCenterIndexFilter_card_le_two P left right hne
  intro center hcenter
  rw [Bool.and_eq_true] at hcenter
  simp only [rowBit_directSourceRows,
    directSourceRowMember_eq_decide_mem, decide_eq_true_eq] at hcenter
  exact (directSourceClass C family center).support_eq_radius _ hcenter.1 |>.trans
    ((directSourceClass C family center).support_eq_radius _ hcenter.2).symm

/-- A source row and the retained first-apex row cannot contain the same
nonalternating pair.  Generated instances provide the strict Kalmanson
orientation for the four concrete cyclic indices. -/
theorem directSource_firstRow_sharedPair_false_of_strict
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
    (!((firstRowBit (directSourceFirstRow T) point₁.val &&
        firstRowBit (directSourceFirstRow T) point₂.val &&
        rowBit (directSourceRows C) family.val center.val point₁.val &&
        rowBit (directSourceRows C) family.val center.val point₂.val))) = true := by
  rw [Bool.not_eq_true_eq_eq_false, Bool.eq_false_iff]
  intro hallBits
  have hleft := (Bool.and_eq_true_iff.mp hallBits).1
  have h₂₂ := (Bool.and_eq_true_iff.mp hallBits).2
  have h₂₁ := (Bool.and_eq_true_iff.mp hleft).2
  have hfirst := (Bool.and_eq_true_iff.mp hleft).1
  have h₁₁ := (Bool.and_eq_true_iff.mp hfirst).1
  have h₁₂ := (Bool.and_eq_true_iff.mp hfirst).2
  simp only [firstRowBit_directSourceFirstRow, rowBit_directSourceRows,
    directSourceRowMember_eq_decide_mem, decide_eq_true_eq] at h₁₁ h₁₂ h₂₁ h₂₂
  have hradius₁ := T.firstApexDoubleRow.support_eq_radius _ h₁₁
  have hradius₁' := T.firstApexDoubleRow.support_eq_radius _ h₁₂
  have hradius₂ :=
    (directSourceClass C family center).support_eq_radius _ h₂₁
  have hradius₂' :=
    (directSourceClass C family center).support_eq_radius _ h₂₂
  rcases hstrict with hstrict | hstrict <;> linarith

/-- The same Kalmanson exclusion with the retained parent-first row written
in its source form. -/
theorem directSource_parentFirst_sharedPair_false_of_strict
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
    (C : CanonicalCoverFamilies T) (hcard : D.A.card = 13)
    (hdistinct : first.doubleRadius ≠ radius)
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
    (!((parentRowBit (directSourceParentFirst P) point₁.val &&
        parentRowBit (directSourceParentFirst P) point₂.val &&
        rowBit (directSourceRows C) family.val center.val point₁.val &&
        rowBit (directSourceRows C) family.val center.val point₂.val))) = true := by
  simpa only [directSource_parentFirst_eq_firstRow T hcard hdistinct] using
    directSource_firstRow_sharedPair_false_of_strict C family center
      point₁ point₂ hstrict

/-- A source row and the retained second-apex parent row cannot contain the
same nonalternating pair.  Generated instances provide the strict Kalmanson
orientation for the four concrete cyclic indices. -/
theorem directSource_parentSecond_sharedPair_false_of_strict
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
    (family : Fin 3) (center point₁ point₂ : Fin 13)
    (hstrict :
      (dist (P.point center) (P.point point₁) +
          dist (P.point 8) (P.point point₂) <
        dist (P.point 8) (P.point point₁) +
          dist (P.point center) (P.point point₂)) ∨
      (dist (P.point 8) (P.point point₁) +
          dist (P.point center) (P.point point₂) <
        dist (P.point center) (P.point point₁) +
          dist (P.point 8) (P.point point₂))) :
    (!((parentRowBit (directSourceParentSecond P) point₁.val &&
        parentRowBit (directSourceParentSecond P) point₂.val &&
        rowBit (directSourceRows C) family.val center.val point₁.val &&
        rowBit (directSourceRows C) family.val center.val point₂.val))) = true := by
  rw [Bool.not_eq_true_eq_eq_false, Bool.eq_false_iff]
  intro hallBits
  have hleft := (Bool.and_eq_true_iff.mp hallBits).1
  have h₂₂ := (Bool.and_eq_true_iff.mp hallBits).2
  have h₂₁ := (Bool.and_eq_true_iff.mp hleft).2
  have hparent := (Bool.and_eq_true_iff.mp hleft).1
  have h₁₁ := (Bool.and_eq_true_iff.mp hparent).1
  have h₁₂ := (Bool.and_eq_true_iff.mp hparent).2
  simp only [parentRowBit_directSourceParentSecond, rowBit_directSourceRows,
    directSourceRowMember_eq_decide_mem, decide_eq_true_eq] at h₁₁ h₁₂ h₂₁ h₂₂
  have hpointSecond : P.point 8 = S.oppApex2 := by
    rw [P.secondApex_at_eight]
    rcases hi : S.surplusIdx with ⟨i, hi3⟩
    interval_cases i <;>
      simp [SurplusCapPacket.oppApex2, SurplusCapPacket.oppIndex2,
        SurplusCapPacket.oppositeVertexByIndex, hi]
  have hradius₁ := R.common.packet.row₂.same_radius _ h₁₁
  have hradius₁' := R.common.packet.row₂.same_radius _ h₁₂
  have hradius₂ :=
    (directSourceClass C family center).support_eq_radius _ h₂₁
  have hradius₂' :=
    (directSourceClass C family center).support_eq_radius _ h₂₂
  have hstrict' :
      (dist (P.point center) (P.point point₁) +
          dist S.oppApex2 (P.point point₂) <
        dist S.oppApex2 (P.point point₁) +
          dist (P.point center) (P.point point₂)) ∨
      (dist S.oppApex2 (P.point point₁) +
          dist (P.point center) (P.point point₂) <
        dist (P.point center) (P.point point₁) +
          dist S.oppApex2 (P.point point₂)) := by
    simpa only [hpointSecond] using hstrict
  rcases hstrict' with hstrict' | hstrict' <;> linarith

/-- Packed indication that some canonical source row, or the retained
first-apex row at its actual center `4`, contains a fixed pair. -/
def directSourceAnyPairPackedCenterBit
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
    (C : CanonicalCoverFamilies T) (left right center : Fin 13) : Bool :=
  (rowBit (directSourceRows C) 0 center.val left.val &&
      rowBit (directSourceRows C) 0 center.val right.val) ||
    (rowBit (directSourceRows C) 1 center.val left.val &&
      rowBit (directSourceRows C) 1 center.val right.val) ||
    (rowBit (directSourceRows C) 2 center.val left.val &&
      rowBit (directSourceRows C) 2 center.val right.val) ||
    (decide (center = (4 : Fin 13)) &&
      firstRowBit (directSourceFirstRow T) left.val &&
      firstRowBit (directSourceFirstRow T) right.val)

/-- A fixed pair is co-radial at at most two carrier centers across all three
source families and the retained first-apex row. -/
theorem directSource_any_pair_packed_center_count_le_two
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
    (C : CanonicalCoverFamilies T) (left right : Fin 13) (hne : left ≠ right) :
    (bitCount13 fun center ↦
      directSourceAnyPairPackedCenterBit C left right center).ule 2#4 = true := by
  apply bitCount13_ule_two_of_filter_card_le_two
  apply pairCenterIndexFilter_card_le_two P left right hne
  intro center hmember
  simp only [directSourceAnyPairPackedCenterBit, Bool.or_eq_true,
    Bool.and_eq_true, decide_eq_true_eq] at hmember
  rcases hmember with ((hmain | hleft) | hright) | hfirst
  · have hmainLeft : directSourceRowMember C 0 center left = true := by
      rw [← rowBit_directSourceRows C (0 : Fin 3) center left]
      simpa using hmain.1
    have hmainRight : directSourceRowMember C 0 center right = true := by
      rw [← rowBit_directSourceRows C (0 : Fin 3) center right]
      simpa using hmain.2
    simp only [directSourceRowMember_eq_decide_mem,
      decide_eq_true_eq] at hmainLeft hmainRight
    exact (directSourceClass C 0 center).support_eq_radius _ hmainLeft |>.trans
      ((directSourceClass C 0 center).support_eq_radius _ hmainRight).symm
  · have hleftLeft : directSourceRowMember C 1 center left = true := by
      rw [← rowBit_directSourceRows C (1 : Fin 3) center left]
      simpa using hleft.1
    have hleftRight : directSourceRowMember C 1 center right = true := by
      rw [← rowBit_directSourceRows C (1 : Fin 3) center right]
      simpa using hleft.2
    simp only [directSourceRowMember_eq_decide_mem,
      decide_eq_true_eq] at hleftLeft hleftRight
    exact (directSourceClass C 1 center).support_eq_radius _ hleftLeft |>.trans
      ((directSourceClass C 1 center).support_eq_radius _ hleftRight).symm
  · have hrightLeft : directSourceRowMember C 2 center left = true := by
      rw [← rowBit_directSourceRows C (2 : Fin 3) center left]
      simpa using hright.1
    have hrightRight : directSourceRowMember C 2 center right = true := by
      rw [← rowBit_directSourceRows C (2 : Fin 3) center right]
      simpa using hright.2
    simp only [directSourceRowMember_eq_decide_mem,
      decide_eq_true_eq] at hrightLeft hrightRight
    exact (directSourceClass C 2 center).support_eq_radius _ hrightLeft |>.trans
      ((directSourceClass C 2 center).support_eq_radius _ hrightRight).symm
  · rcases hfirst with ⟨⟨hcenter, hleft⟩, hright⟩
    subst center
    rw [firstRowBit_directSourceFirstRow T left] at hleft
    rw [firstRowBit_directSourceFirstRow T right] at hright
    exact T.firstApexDoubleRow.support_eq_radius _ (of_decide_eq_true hleft) |>.trans
      (T.firstApexDoubleRow.support_eq_radius _
        (of_decide_eq_true hright)).symm

/-- Packed pair occurrence including both retained parent rows.  The
parent-first bit is intentionally retained alongside its equal first-row bit
because this definition mirrors the external source expression exactly. -/
def directSourceExtendedAnyPairPackedCenterBit
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
    (C : CanonicalCoverFamilies T) (left right center : Fin 13) : Bool :=
  (rowBit (directSourceRows C) 0 center.val left.val &&
      rowBit (directSourceRows C) 0 center.val right.val) ||
  (rowBit (directSourceRows C) 1 center.val left.val &&
      rowBit (directSourceRows C) 1 center.val right.val) ||
  (rowBit (directSourceRows C) 2 center.val left.val &&
      rowBit (directSourceRows C) 2 center.val right.val) ||
  (decide (center = (4 : Fin 13)) &&
      firstRowBit (directSourceFirstRow T) left.val &&
      firstRowBit (directSourceFirstRow T) right.val) ||
  (decide (center = (4 : Fin 13)) &&
      parentRowBit (directSourceParentFirst P) left.val &&
      parentRowBit (directSourceParentFirst P) right.val) ||
  (decide (center = (8 : Fin 13)) &&
      parentRowBit (directSourceParentSecond P) left.val &&
      parentRowBit (directSourceParentSecond P) right.val)

/-- A fixed pair is co-radial at at most two carrier centers even after both
retained parent rows are included in the packed source predicate. -/
theorem directSource_extended_any_pair_packed_center_count_le_two
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
    (C : CanonicalCoverFamilies T) (hcard : D.A.card = 13)
    (hdistinct : first.doubleRadius ≠ radius)
    (left right : Fin 13) (hne : left ≠ right) :
    (bitCount13 fun center ↦
      directSourceExtendedAnyPairPackedCenterBit C left right center).ule
        2#4 = true := by
  apply bitCount13_ule_two_of_filter_card_le_two
  apply pairCenterIndexFilter_card_le_two P left right hne
  intro center hmember
  simp only [directSourceExtendedAnyPairPackedCenterBit, Bool.or_eq_true,
    Bool.and_eq_true, decide_eq_true_eq] at hmember
  rcases hmember with ((((hmain | hleft) | hright) | hfirst) |
      hparentFirst) | hparentSecond
  · have hsource (family : Fin 3)
        (hpair : rowBit (directSourceRows C) family.val center.val left.val = true ∧
          rowBit (directSourceRows C) family.val center.val right.val = true) :
        dist (P.point center) (P.point left) =
          dist (P.point center) (P.point right) := by
      have hleft' : directSourceRowMember C family center left = true := by
        rw [← rowBit_directSourceRows C family center left]
        exact hpair.1
      have hright' : directSourceRowMember C family center right = true := by
        rw [← rowBit_directSourceRows C family center right]
        exact hpair.2
      simp only [directSourceRowMember_eq_decide_mem,
        decide_eq_true_eq] at hleft' hright'
      exact (directSourceClass C family center).support_eq_radius _ hleft' |>.trans
        ((directSourceClass C family center).support_eq_radius _ hright').symm
    exact hsource 0 hmain
  · have hsource (family : Fin 3)
        (hpair : rowBit (directSourceRows C) family.val center.val left.val = true ∧
          rowBit (directSourceRows C) family.val center.val right.val = true) :
        dist (P.point center) (P.point left) =
          dist (P.point center) (P.point right) := by
      have hleft' : directSourceRowMember C family center left = true := by
        rw [← rowBit_directSourceRows C family center left]
        exact hpair.1
      have hright' : directSourceRowMember C family center right = true := by
        rw [← rowBit_directSourceRows C family center right]
        exact hpair.2
      simp only [directSourceRowMember_eq_decide_mem,
        decide_eq_true_eq] at hleft' hright'
      exact (directSourceClass C family center).support_eq_radius _ hleft' |>.trans
        ((directSourceClass C family center).support_eq_radius _ hright').symm
    exact hsource 1 hleft
  · have hsource (family : Fin 3)
        (hpair : rowBit (directSourceRows C) family.val center.val left.val = true ∧
          rowBit (directSourceRows C) family.val center.val right.val = true) :
        dist (P.point center) (P.point left) =
          dist (P.point center) (P.point right) := by
      have hleft' : directSourceRowMember C family center left = true := by
        rw [← rowBit_directSourceRows C family center left]
        exact hpair.1
      have hright' : directSourceRowMember C family center right = true := by
        rw [← rowBit_directSourceRows C family center right]
        exact hpair.2
      simp only [directSourceRowMember_eq_decide_mem,
        decide_eq_true_eq] at hleft' hright'
      exact (directSourceClass C family center).support_eq_radius _ hleft' |>.trans
        ((directSourceClass C family center).support_eq_radius _ hright').symm
    exact hsource 2 hright
  · rcases hfirst with ⟨⟨hcenter, hleft⟩, hright⟩
    subst center
    rw [firstRowBit_directSourceFirstRow T left] at hleft
    rw [firstRowBit_directSourceFirstRow T right] at hright
    exact T.firstApexDoubleRow.support_eq_radius _ (of_decide_eq_true hleft) |>.trans
      (T.firstApexDoubleRow.support_eq_radius _
        (of_decide_eq_true hright)).symm
  · rcases hparentFirst with ⟨⟨hcenter, hleft⟩, hright⟩
    subst center
    rw [directSource_parentFirst_eq_firstRow T hcard hdistinct left,
      firstRowBit_directSourceFirstRow T left] at hleft
    rw [directSource_parentFirst_eq_firstRow T hcard hdistinct right,
      firstRowBit_directSourceFirstRow T right] at hright
    exact T.firstApexDoubleRow.support_eq_radius _ (of_decide_eq_true hleft) |>.trans
      (T.firstApexDoubleRow.support_eq_radius _
        (of_decide_eq_true hright)).symm
  · rcases hparentSecond with ⟨⟨hcenter, hleft⟩, hright⟩
    subst center
    rw [parentRowBit_directSourceParentSecond P left] at hleft
    rw [parentRowBit_directSourceParentSecond P right] at hright
    have hpointSecond : P.point 8 = S.oppApex2 := by
      rw [P.secondApex_at_eight]
      rcases hi : S.surplusIdx with ⟨i, hi3⟩
      interval_cases i <;>
        simp [SurplusCapPacket.oppApex2, SurplusCapPacket.oppIndex2,
          SurplusCapPacket.oppositeVertexByIndex, hi]
    rw [hpointSecond]
    exact (R.common.packet.row₂.same_radius _ (of_decide_eq_true hleft)).trans
      (R.common.packet.row₂.same_radius _
        (of_decide_eq_true hright)).symm

/-- The second apex at canonical index `8` is absent from its positive-radius
exact-five shell. -/
theorem directSource_shell_eight_excluded
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
    (!(shellBit (directSourceShell T) 8)) = true := by
  rw [Bool.not_eq_true_eq_eq_false]
  rw [show shellBit (directSourceShell T) 8 =
      decide ((8 : Fin 13) ∈ T.exactFiveShell) by
    exact shellBit_directSourceShell T (8 : Fin 13)]
  apply decide_eq_false_iff_not.mpr
  rw [T.exactFiveShell_mem_iff]
  have hcenter : P.point 8 = S.oppApex2 := by
    rw [P.secondApex_at_eight]
    rcases hi : S.surplusIdx with ⟨i, hi3⟩
    interval_cases i <;>
      simp [SurplusCapPacket.oppApex2, SurplusCapPacket.oppIndex2,
        SurplusCapPacket.oppositeVertexByIndex, hi]
  rw [hcenter]
  intro h
  have hdist := (mem_selectedClass.mp h).2
  simp only [dist_self] at hdist
  linarith [profile.radius_pos]

private theorem selectedFourClass_support_subset_exactFiveClass
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    (profile : LargeCapUniqueFiveSecondApexRadius D S)
    (K : SelectedFourClass D.A S.oppApex2) :
    K.support ⊆ SelectedClass D.A S.oppApex2 profile.radius := by
  have hsub : K.support ⊆ SelectedClass D.A S.oppApex2 K.radius := by
    intro z hz
    exact mem_selectedClass.mpr
      ⟨K.support_subset_A hz, K.support_eq_radius z hz⟩
  have hfour : 4 ≤ (SelectedClass D.A S.oppApex2 K.radius).card := by
    calc
      4 = K.support.card := K.support_card.symm
      _ ≤ (SelectedClass D.A S.oppApex2 K.radius).card :=
        Finset.card_le_card hsub
  have hradius : K.radius = profile.radius :=
    profile.unique_K4_radius K.radius K.radius_pos hfour
  simpa only [hradius] using hsub

private theorem selectedFourClass_support_transport_local
    {A : Finset ℝ²} {center target : ℝ²} (h : center = target)
    (K : SelectedFourClass A center) :
    (h ▸ K).support = K.support := by
  subst target
  rfl

/-- Every selected source row centered at the physical second apex is a
subset of its unique ambient exact-five shell. -/
theorem directSource_secondApex_row_imp_shell
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
    (C : CanonicalCoverFamilies T) (family : Fin 3) (point : Fin 13) :
    (!(rowBit (directSourceRows C) family.val 8 point.val) ||
      shellBit (directSourceShell T) point.val) = true := by
  cases hrow : rowBit (directSourceRows C) family.val 8 point.val
  · simp
  · simp only [Bool.not_true, Bool.false_or]
    rw [shellBit_directSourceShell, decide_eq_true_eq]
    apply (T.exactFiveShell_mem_iff point).2
    have hpointSecond : P.point 8 = S.oppApex2 := by
      rw [P.secondApex_at_eight]
      rcases hi : S.surplusIdx with ⟨i, hi3⟩
      interval_cases i <;>
        simp [SurplusCapPacket.oppApex2, SurplusCapPacket.oppIndex2,
          SurplusCapPacket.oppositeVertexByIndex, hi]
    let K : SelectedFourClass D.A S.oppApex2 :=
      hpointSecond ▸ directSourceClass C family 8
    have htransport : K.support =
        (directSourceClass C family 8).support :=
      selectedFourClass_support_transport_local hpointSecond
        (directSourceClass C family 8)
    apply selectedFourClass_support_subset_exactFiveClass profile K
    rw [htransport]
    have hpacked := rowBit_directSourceRows C family (8 : Fin 13) point
    have hmember : directSourceRowMember C family 8 point = true := by
      rw [← hpacked]
      simpa using hrow
    simp only [directSourceRowMember_eq_decide_mem,
      decide_eq_true_eq] at hmember
    exact hmember

/-- The actual blocker chosen for the distinguished physical source is the
canonical middle strict-cap point.  Orbit-specific generated assertions may
rewrite the source index to `1` or `3`, but the geometric statement itself is
orientation independent. -/
theorem directSource_distinguished_blocker_index_eq_two
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
    T.blockerIndex P.sourceIndex = (2 : Fin 13) := by
  have hsourceA : P.point P.sourceIndex ∈ D.A :=
    canonicalPoint_mem P P.sourceIndex
  have hblockerPoint :
      P.point (T.blockerIndex P.sourceIndex) = P.point P.blockerIndex := by
    calc
      P.point (T.blockerIndex P.sourceIndex) =
          H.centerAt (P.point P.sourceIndex) hsourceA :=
        T.blocker_point P.sourceIndex
      _ = M.target.1 := by
        simpa [P.source_point] using P.actualCenter_eq_blocker
      _ = P.point P.blockerIndex := P.blocker_point.symm
  exact (P.point_injective hblockerPoint).trans P.blockerIndex_eq_two

/-- Packed Boolean form of the distinguished-source blocker identity. -/
theorem directSource_distinguished_blocker_eq_two
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
    (blockerAt (directSourceBlockers T) P.sourceIndex.val == 2#4) = true := by
  rw [blockerAt_directSourceBlockers]
  simp [directSource_distinguished_blocker_index_eq_two T]

private theorem selectedAt_support_congr_local
    {A : Finset ℝ²} (H : CriticalShellSystem A)
    {x y : ℝ²} (hxy : x = y) (hx : x ∈ A) (hy : y ∈ A) :
    (H.selectedAt x hx).toCriticalFourShell.support =
      (H.selectedAt y hy).toCriticalFourShell.support := by
  subst y
  rfl

private theorem oppCap2_eq_capByIndex_oppIndex2_local
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppCap2 = S.capByIndex S.oppIndex2 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.oppCap2, SurplusCapPacket.oppIndex2,
      SurplusCapPacket.capByIndex, hi]

/-- The main row at the distinguished blocker is the actual complete shell
selected by the fixed critical system for the distinguished source. -/
theorem directSource_mainTwo_support_eq_actualSupport
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
    {star : PhysicalGlobalCrossDeletionStar profile}
    {first : FirstApexShellRolePacket F R}
    (T : CanonicalAsymmetricSemanticRowTable P star first) :
    (T.main 2).support =
      (H.selectedAt M.source.1
        (PhysicalVertex.mem_A M.source)).toCriticalFourShell.support := by
  let hsourceA : P.point P.sourceIndex ∈ D.A :=
    canonicalPoint_mem P P.sourceIndex
  have hcenter : P.point 2 =
      H.centerAt (P.point P.sourceIndex) hsourceA := by
    calc
      P.point 2 = P.point P.blockerIndex := by rw [P.blockerIndex_eq_two]
      _ = M.target.1 := P.blocker_point
      _ = H.centerAt M.source.1 (PhysicalVertex.mem_A M.source) :=
        P.actualCenter_eq_blocker.symm
      _ = H.centerAt (P.point P.sourceIndex) hsourceA := by
        simp only [P.source_point]
  let Kmain : SelectedFourClass D.A
      (H.centerAt (P.point P.sourceIndex) hsourceA) :=
    hcenter ▸ T.main 2
  have hmain := H.selectedFourClass_support_eq_shell
    (P.point P.sourceIndex) hsourceA Kmain
  calc
    (T.main 2).support = Kmain.support :=
      (selectedFourClass_support_transport_local hcenter (T.main 2)).symm
    _ = (H.selectedAt (P.point P.sourceIndex)
        hsourceA).toCriticalFourShell.support := hmain
    _ = (H.selectedAt M.source.1
        (PhysicalVertex.mem_A M.source)).toCriticalFourShell.support :=
      selectedAt_support_congr_local H P.source_point hsourceA
        (PhysicalVertex.mem_A M.source)

/-- The distinguished main row contains the source/third pair and omits the
two physical-cap endpoints at canonical indices zero and four. -/
theorem directSource_mainTwo_membership_normal_form
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
    {star : PhysicalGlobalCrossDeletionStar profile}
    {first : FirstApexShellRolePacket F R}
    (T : CanonicalAsymmetricSemanticRowTable P star first) :
    P.point 1 ∈ (T.main 2).support ∧
      P.point 3 ∈ (T.main 2).support ∧
      P.point 0 ∉ (T.main 2).support ∧
      P.point 4 ∉ (T.main 2).support := by
  rw [directSource_mainTwo_support_eq_actualSupport P T]
  have hsource : P.point P.sourceIndex ∈
      (H.selectedAt M.source.1
        (PhysicalVertex.mem_A M.source)).toCriticalFourShell.support := by
    simpa only [P.source_point] using P.source_mem_actualSupport
  have hthird : P.point P.thirdIndex ∈
      (H.selectedAt M.source.1
        (PhysicalVertex.mem_A M.source)).toCriticalFourShell.support := by
    simpa only [P.third_point] using P.third_mem_actualSupport
  have hout (i : Fin 13) (hiCap : P.point i ∈ S.capByIndex S.oppIndex2)
      (hiSource : i ≠ P.sourceIndex) (hiThird : i ≠ P.thirdIndex) :
      P.point i ∉
        (H.selectedAt M.source.1
          (PhysicalVertex.mem_A M.source)).toCriticalFourShell.support := by
    intro hiSupport
    have hiInter : P.point i ∈
        (H.selectedAt M.source.1
          (PhysicalVertex.mem_A M.source)).toCriticalFourShell.support ∩
          S.capByIndex S.oppIndex2 := Finset.mem_inter.mpr ⟨hiSupport, hiCap⟩
    rw [P.actualSupport_inter_physicalCap_eq] at hiInter
    simp only [Finset.mem_insert, Finset.mem_singleton] at hiInter
    rcases hiInter with hi | hi
    · apply hiSource
      apply P.point_injective
      exact hi.trans P.source_point.symm
    · apply hiThird
      apply P.point_injective
      exact hi.trans P.third_point.symm
  have hzeroCap : P.point 0 ∈ S.capByIndex S.oppIndex2 := by
    rw [← oppCap2_eq_capByIndex_oppIndex2_local S]
    exact (P.secondOppCap_mem_iff_initial_block 0).mpr (by decide)
  have hfourCap : P.point 4 ∈ S.capByIndex S.oppIndex2 := by
    rw [← oppCap2_eq_capByIndex_oppIndex2_local S]
    exact (P.secondOppCap_mem_iff_initial_block 4).mpr (by decide)
  rcases P.source_role_orbits with hforward | hreverse
  · refine ⟨?_, ?_, ?_, ?_⟩
    · simpa only [hforward.1] using hsource
    · simpa only [hforward.2.2] using hthird
    · exact hout 0 hzeroCap (by rw [hforward.1]; decide)
        (by rw [hforward.2.2]; decide)
    · exact hout 4 hfourCap (by rw [hforward.1]; decide)
        (by rw [hforward.2.2]; decide)
  · refine ⟨?_, ?_, ?_, ?_⟩
    · simpa only [hreverse.2.2] using hthird
    · simpa only [hreverse.1] using hsource
    · exact hout 0 hzeroCap (by rw [hreverse.1]; decide)
        (by rw [hreverse.2.2]; decide)
    · exact hout 4 hfourCap (by rw [hreverse.1]; decide)
        (by rw [hreverse.2.2]; decide)

private theorem rowBit_main_eq_decide_local
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
    (C : CanonicalCoverFamilies T) (center point : Fin 13) :
    rowBit (directSourceRows C) 0 center.val point.val =
      decide (P.point point ∈ (T.main center).support) := by
  calc
    rowBit (directSourceRows C) 0 center.val point.val =
        directSourceRowMember C (0 : Fin 3) center point :=
      rowBit_directSourceRows C (0 : Fin 3) center point
    _ = decide (P.point point ∈ (T.main center).support) := by
      simp [directSourceRowMember]

/-- Boolean source encoding of the distinguished main-row normal form. -/
theorem directSource_mainTwo_bits_normal_form
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
    rowBit (directSourceRows C) 0 2 1 = true ∧
      rowBit (directSourceRows C) 0 2 3 = true ∧
      (!rowBit (directSourceRows C) 0 2 0) = true ∧
      (!rowBit (directSourceRows C) 0 2 4) = true := by
  have hmain := directSource_mainTwo_membership_normal_form P T
  have hone := rowBit_main_eq_decide_local C (2 : Fin 13) (1 : Fin 13)
  have hthree := rowBit_main_eq_decide_local C (2 : Fin 13) (3 : Fin 13)
  have hzero := rowBit_main_eq_decide_local C (2 : Fin 13) (0 : Fin 13)
  have hfour := rowBit_main_eq_decide_local C (2 : Fin 13) (4 : Fin 13)
  change rowBit (directSourceRows C) 0 (2 : Fin 13).val (1 : Fin 13).val = true ∧
    rowBit (directSourceRows C) 0 (2 : Fin 13).val (3 : Fin 13).val = true ∧
    (!rowBit (directSourceRows C) 0 (2 : Fin 13).val (0 : Fin 13).val) = true ∧
    (!rowBit (directSourceRows C) 0 (2 : Fin 13).val (4 : Fin 13).val) = true
  rw [hone, hthree, hzero, hfour]
  simp [hmain.1, hmain.2.1, hmain.2.2.1, hmain.2.2.2]

/-- Thirteen-way lookup in a packed blocker-indexed Boolean row. -/
def directSourceIndexLookupBit (blocker : BitVec 4)
    (bit : Fin 13 → Bool) : Bool :=
  ((blocker == 0#4) && bit 0) ||
  ((blocker == 1#4) && bit 1) ||
  ((blocker == 2#4) && bit 2) ||
  ((blocker == 3#4) && bit 3) ||
  ((blocker == 4#4) && bit 4) ||
  ((blocker == 5#4) && bit 5) ||
  ((blocker == 6#4) && bit 6) ||
  ((blocker == 7#4) && bit 7) ||
  ((blocker == 8#4) && bit 8) ||
  ((blocker == 9#4) && bit 9) ||
  ((blocker == 10#4) && bit 10) ||
  ((blocker == 11#4) && bit 11) ||
  ((blocker == 12#4) && bit 12)

private theorem directSourceIndexLookupBit_ofNat
    (index : Fin 13) (bit : Fin 13 → Bool) :
    directSourceIndexLookupBit (BitVec.ofNat 4 index.val) bit = bit index := by
  native_decide +revert

/-- The main row at any actual blocker image is the fixed critical shell of
that source. -/
theorem directSource_fixedBlocker_main_support_eq
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
    (T : CanonicalAsymmetricSemanticRowTable P star first)
    (source : Fin 13) :
    (T.main (T.blockerIndex source)).support =
      (H.selectedAt (P.point source)
        (canonicalPoint_mem P source)).toCriticalFourShell.support := by
  let hsourceA : P.point source ∈ D.A := canonicalPoint_mem P source
  let center := H.centerAt (P.point source) hsourceA
  have hcenter : P.point (T.blockerIndex source) = center := by
    simpa [hsourceA, center] using T.blocker_point source
  let Kmain : SelectedFourClass D.A center :=
    hcenter ▸ T.main (T.blockerIndex source)
  calc
    (T.main (T.blockerIndex source)).support = Kmain.support :=
      (selectedFourClass_support_transport_local hcenter
        (T.main (T.blockerIndex source))).symm
    _ = (H.selectedAt (P.point source)
        hsourceA).toCriticalFourShell.support :=
      H.selectedFourClass_support_eq_shell
        (P.point source) hsourceA Kmain
    _ = (H.selectedAt (P.point source)
        (canonicalPoint_mem P source)).toCriticalFourShell.support := by
      congr

/-- The target row of the oriented two-hit mutual-omission normal form has
exactly one physical-cap hit. -/
theorem directSource_target_actualSupport_physical_card_eq_one
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    {Q : FrontierBiApexRobustExactFiveSecondCapResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (M : PhysicalActualCriticalMutualOmissionPair H profile)
    (N : SourceTwoHitNormalForm Q profile M) :
    (physicalVertices profile ∩
      (H.selectedAt M.target.1
        (PhysicalVertex.mem_A M.target)).toCriticalFourShell.support).card = 1 := by
  let Ksource := (H.selectedAt M.source.1
    (PhysicalVertex.mem_A M.source)).toCriticalFourShell
  have hsourceInter : physicalVertices profile ∩ Ksource.support =
      ({M.source.1, N.third.1} : Finset ℝ²) := by
    ext z
    constructor
    · intro hz
      have hzCap : z ∈ S.capByIndex S.oppIndex2 :=
        S.capInteriorByIndex_subset_capByIndex S.oppIndex2
          (PhysicalVertex.mem_capInterior
            (⟨z, (Finset.mem_inter.mp hz).1⟩ : PhysicalVertex profile))
      have hzSourceCap : z ∈ Ksource.support ∩
          S.capByIndex S.oppIndex2 :=
        Finset.mem_inter.mpr ⟨(Finset.mem_inter.mp hz).2, hzCap⟩
      simpa only [Ksource, N.sourceSupport_inter_physicalCap_eq] using
        hzSourceCap
    · intro hz
      simp only [Finset.mem_insert, Finset.mem_singleton] at hz
      rcases hz with rfl | rfl
      · exact Finset.mem_inter.mpr ⟨M.source.2, Ksource.q_mem_support⟩
      · exact Finset.mem_inter.mpr ⟨N.third.2, by
          simpa only [Ksource] using N.third_mem_sourceSupport⟩
  have hsourceCard : (physicalVertices profile ∩ Ksource.support).card = 2 := by
    rw [hsourceInter, Finset.card_pair]
    intro h
    exact N.third_ne_source (Subtype.ext h.symm)
  rcases
      PhysicalActualCriticalMutualOmissionPair.source_hit_eq_one_or_target_hit_eq_one
        Q profile M with hsourceOne | htargetOne
  · have hsourceTwo : (physicalVertices profile ∩
        (H.selectedAt M.source.1
          (PhysicalVertex.mem_A M.source)).toCriticalFourShell.support).card = 2 := by
      simpa only [Ksource] using hsourceCard
    omega
  · exact htargetOne

/-- The one-hit target shell omits the third physical point of the oriented
two-hit normal form. -/
theorem directSource_third_not_mem_target_actualSupport
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    {Q : FrontierBiApexRobustExactFiveSecondCapResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (M : PhysicalActualCriticalMutualOmissionPair H profile)
    (N : SourceTwoHitNormalForm Q profile M) :
    N.third.1 ∉
      (H.selectedAt M.target.1
        (PhysicalVertex.mem_A M.target)).toCriticalFourShell.support := by
  intro hthird
  let Ktarget := (H.selectedAt M.target.1
    (PhysicalVertex.mem_A M.target)).toCriticalFourShell
  have hpairSub : ({M.target.1, N.third.1} : Finset ℝ²) ⊆
      physicalVertices profile ∩ Ktarget.support := by
    intro z hz
    simp only [Finset.mem_insert, Finset.mem_singleton] at hz
    rcases hz with rfl | rfl
    · exact Finset.mem_inter.mpr ⟨M.target.2, Ktarget.q_mem_support⟩
    · exact Finset.mem_inter.mpr ⟨N.third.2, by simpa [Ktarget] using hthird⟩
  have hpairCard : ({M.target.1, N.third.1} : Finset ℝ²).card = 2 := by
    rw [Finset.card_pair]
    intro h
    exact N.third_ne_target (Subtype.ext h.symm)
  have hcard := Finset.card_le_card hpairSub
  rw [hpairCard,
    directSource_target_actualSupport_physical_card_eq_one M N] at hcard
  omega

private theorem directSource_blocker_main_omission_lookup_of_not_mem
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
    (C : CanonicalCoverFamilies T) (source target : Fin 13)
    (homit : P.point target ∉
      (T.main (T.blockerIndex source)).support) :
    (!(directSourceIndexLookupBit
      (blockerAt (directSourceBlockers T) source.val)
      (fun center ↦ rowBit (directSourceRows C) 0 center.val
        target.val))) = true := by
  have hbit : rowBit (directSourceRows C) 0
      (T.blockerIndex source).val target.val = false := by
    rw [rowBit_main_eq_decide_local C]
    exact decide_eq_false_iff_not.mpr homit
  rw [blockerAt_directSourceBlockers, directSourceIndexLookupBit_ofNat]
  simp [hbit]

/-- Packed source form of the reverse mutual omission: the critical shell of
the canonical middle point omits the distinguished source. -/
theorem directSource_distinguished_reverse_omission_lookup
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
    (!(directSourceIndexLookupBit
      (blockerAt (directSourceBlockers T) P.blockerIndex.val)
      (fun center ↦ rowBit (directSourceRows C) 0 center.val
        P.sourceIndex.val))) = true := by
  have homit : P.point P.sourceIndex ∉
      (T.main (T.blockerIndex P.blockerIndex)).support := by
    rw [directSource_fixedBlocker_main_support_eq T P.blockerIndex]
    rw [selectedAt_support_congr_local H P.blocker_point
      (canonicalPoint_mem P P.blockerIndex)
      (PhysicalVertex.mem_A M.target)]
    simpa only [P.source_point] using M.source_not_mem_targetSupport
  exact directSource_blocker_main_omission_lookup_of_not_mem C
    P.blockerIndex P.sourceIndex homit

/-- Packed source form of the same one-hit target row omitting the third
physical point. -/
theorem directSource_distinguished_reverse_third_omission_lookup
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
    (!(directSourceIndexLookupBit
      (blockerAt (directSourceBlockers T) P.blockerIndex.val)
      (fun center ↦ rowBit (directSourceRows C) 0 center.val
        P.thirdIndex.val))) = true := by
  have homit : P.point P.thirdIndex ∉
      (T.main (T.blockerIndex P.blockerIndex)).support := by
    rw [directSource_fixedBlocker_main_support_eq T P.blockerIndex]
    rw [selectedAt_support_congr_local H P.blocker_point
      (canonicalPoint_mem P P.blockerIndex)
      (PhysicalVertex.mem_A M.target)]
    simpa only [P.third_point] using
      directSource_third_not_mem_target_actualSupport M N
  exact directSource_blocker_main_omission_lookup_of_not_mem C
    P.blockerIndex P.thirdIndex homit

/-- The retained first parent row is exactly the packed four-point
double-deletion row in the distinct-radius card-thirteen mode. -/
theorem directSource_parentFirst_card_eq_four
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
    (T : CanonicalAsymmetricSemanticRowTable P star first)
    (hcard : D.A.card = 13) (hdistinct : first.doubleRadius ≠ radius) :
    ((bitCount13 fun point ↦
      parentRowBit (directSourceParentFirst P) point.val) == 4#4) = true := by
  simpa only [bitCount13,
    directSource_parentFirst_eq_firstRow T hcard hdistinct] using
    directSource_firstRow_card_eq_four T

/-- The retained first parent row omits its center at canonical index four. -/
theorem directSource_parentFirst_four_excluded
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
    (T : CanonicalAsymmetricSemanticRowTable P star first)
    (hcard : D.A.card = 13) (hdistinct : first.doubleRadius ≠ radius) :
    (!(parentRowBit (directSourceParentFirst P) 4)) = true := by
  change (!(parentRowBit (directSourceParentFirst P) (4 : Fin 13).val)) = true
  rw [directSource_parentFirst_eq_firstRow T hcard hdistinct (4 : Fin 13)]
  exact directSource_firstRow_four_excluded T

/-- The canonical indices `1,2,3` are exactly the physical strict points of
the exact-five second cap. -/
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

private theorem parentPhysicalThreeCount_ule_one_of_filter_card_le_one
    (member : Fin 13 → Bool)
    (hcard : (({1, 2, 3} : Finset (Fin 13)).filter fun i ↦
      member i = true).card ≤ 1) :
    ((bif member 1 then 1#4 else 0#4) +
      (bif member 2 then 1#4 else 0#4) +
      (bif member 3 then 1#4 else 0#4)).ule 1#4 = true := by
  native_decide +revert

private theorem parentPhysicalThreeCount_uge_two_of_filter_card_ge_two
    (member : Fin 13 → Bool)
    (hcard : 2 ≤ (({1, 2, 3} : Finset (Fin 13)).filter fun i ↦
      member i = true).card) :
    (2#4).ule ((bif member 1 then 1#4 else 0#4) +
      (bif member 2 then 1#4 else 0#4) +
      (bif member 3 then 1#4 else 0#4)) = true := by
  native_decide +revert

private theorem parentPhysicalIndexFilter_card_eq_inter
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    {Q : FrontierBiApexRobustExactFiveSecondCapResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {M : PhysicalActualCriticalMutualOmissionPair H profile}
    {N : SourceTwoHitNormalForm Q profile M}
    (P : CanonicalAsymmetricRolePrepacket N) (support : Finset ℝ²) :
    (({1, 2, 3} : Finset (Fin 13)).filter fun i ↦
      decide (P.point i ∈ support) = true).card =
        (physicalVertices profile ∩ support).card := by
  let indices := ({1, 2, 3} : Finset (Fin 13)).filter fun i ↦
    decide (P.point i ∈ support) = true
  have himage : indices.image P.point = physicalVertices profile ∩ support := by
    ext x
    constructor
    · intro hx
      rcases Finset.mem_image.mp hx with ⟨i, hi, rfl⟩
      rcases Finset.mem_filter.mp hi with ⟨hiPhysical, hiSupport⟩
      refine Finset.mem_inter.mpr ⟨?_, of_decide_eq_true hiSupport⟩
      rw [physicalVertices_eq_indexOneTwoThree P]
      simp only [Finset.mem_insert, Finset.mem_singleton] at hiPhysical ⊢
      rcases hiPhysical with rfl | rfl | rfl <;> simp
    · intro hx
      rcases Finset.mem_inter.mp hx with ⟨hxPhysical, hxSupport⟩
      rw [physicalVertices_eq_indexOneTwoThree P] at hxPhysical
      simp only [Finset.mem_insert, Finset.mem_singleton] at hxPhysical
      rcases hxPhysical with rfl | rfl | rfl
      · exact Finset.mem_image.mpr ⟨1, Finset.mem_filter.mpr ⟨by simp, by simp [hxSupport]⟩, rfl⟩
      · exact Finset.mem_image.mpr ⟨2, Finset.mem_filter.mpr ⟨by simp, by simp [hxSupport]⟩, rfl⟩
      · exact Finset.mem_image.mpr ⟨3, Finset.mem_filter.mpr ⟨by simp, by simp [hxSupport]⟩, rfl⟩
  calc
    indices.card = (indices.image P.point).card :=
      (Finset.card_image_of_injective _ P.point_injective).symm
    _ = (physicalVertices profile ∩ support).card := by rw [himage]

private theorem parentFirstPhysicalIndexFilter_card_le_inter
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
    (({1, 2, 3} : Finset (Fin 13)).filter fun i ↦
      decide (P.point i ∈ R.common.packet.B₁) = true).card ≤
        (physicalVertices profile ∩ R.common.packet.B₁).card := by
  let indices := ({1, 2, 3} : Finset (Fin 13)).filter fun i ↦
    decide (P.point i ∈ R.common.packet.B₁) = true
  have himageCard : indices.card = (indices.image P.point).card :=
    (Finset.card_image_of_injective _ P.point_injective).symm
  rw [himageCard]
  apply Finset.card_le_card
  intro x hx
  rcases Finset.mem_image.mp hx with ⟨i, hi, rfl⟩
  rcases Finset.mem_filter.mp hi with ⟨hiPhysical, hiRow⟩
  refine Finset.mem_inter.mpr ⟨?_, of_decide_eq_true hiRow⟩
  rw [physicalVertices_eq_indexOneTwoThree P]
  simp only [Finset.mem_insert, Finset.mem_singleton] at hiPhysical ⊢
  rcases hiPhysical with rfl | rfl | rfl <;> simp

/-- The retained first-apex parent row contains at most one of the three
physical strict points of the exact-five second cap. -/
theorem directSource_parentFirst_physical_card_le_one
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
    ((bif parentRowBit (directSourceParentFirst P) 1 then 1#4 else 0#4) +
      (bif parentRowBit (directSourceParentFirst P) 2 then 1#4 else 0#4) +
      (bif parentRowBit (directSourceParentFirst P) 3 then 1#4 else 0#4)).ule
        1#4 = true := by
  apply parentPhysicalThreeCount_ule_one_of_filter_card_le_one
    (fun i : Fin 13 ↦ parentRowBit (directSourceParentFirst P) i.val)
  simp only [parentRowBit_directSourceParentFirst]
  exact (parentFirstPhysicalIndexFilter_card_le_inter P).trans
    (physicalVertices_inter_parentFirstRow_card_le_one R profile)

/-- The retained second-apex parent row contains at least two of the three
physical strict points of the exact-five second cap. -/
theorem directSource_parentSecond_physical_card_ge_two
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
    (2#4).ule
      ((bif parentRowBit (directSourceParentSecond P) 1 then 1#4 else 0#4) +
        (bif parentRowBit (directSourceParentSecond P) 2 then 1#4 else 0#4) +
        (bif parentRowBit (directSourceParentSecond P) 3 then 1#4 else 0#4)) = true := by
  apply parentPhysicalThreeCount_uge_two_of_filter_card_ge_two
    (fun i : Fin 13 ↦ parentRowBit (directSourceParentSecond P) i.val)
  simp only [parentRowBit_directSourceParentSecond]
  rw [parentPhysicalIndexFilter_card_eq_inter P R.common.packet.B₂]
  exact two_le_physicalVertices_inter_parentSecondRow_card R profile

/-- The retained first parent row inherits both adjacent-cap one-hit bounds
from the distinct-radius first-apex row. -/
theorem directSource_parentFirst_adjacent_blocks_ule_one
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
    (T : CanonicalAsymmetricSemanticRowTable P star first)
    (hcard : D.A.card = 13) (hdistinct : first.doubleRadius ≠ radius) :
    (bitCountMiddleFive fun point ↦
      parentRowBit (directSourceParentFirst P) point.val).ule 1#4 = true ∧
    (bitCountSecondFive fun point ↦
      parentRowBit (directSourceParentFirst P) point.val).ule 1#4 = true := by
  simpa only [directSource_parentFirst_eq_firstRow T hcard hdistinct] using
    directSource_firstRow_adjacent_blocks_ule_one T

private theorem firstStrictFour_uge_two_of_card_four_and_adjacent_one_hit
    (member : Fin 13 → Bool)
    (htotal : (bitCount13 member == 4#4) = true)
    (hmiddle : (bitCountMiddleFive member).ule 1#4 = true)
    (hsecond : (bitCountSecondFive member).ule 1#4 = true)
    (hcenter : member 4 = false) :
    (2#4).ule
      ((bif member 9 then 1#4 else 0#4) +
        (bif member 10 then 1#4 else 0#4) +
        (bif member 11 then 1#4 else 0#4) +
        (bif member 12 then 1#4 else 0#4)) = true := by
  native_decide +revert

/-- The retained first-apex source row contains at least two strict points of
the first opposite cap. -/
theorem directSource_mainFour_firstStrict_card_ge_two
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
    (2#4).ule
      ((bif rowBit (directSourceRows C) 0 4 9 then 1#4 else 0#4) +
        (bif rowBit (directSourceRows C) 0 4 10 then 1#4 else 0#4) +
        (bif rowBit (directSourceRows C) 0 4 11 then 1#4 else 0#4) +
        (bif rowBit (directSourceRows C) 0 4 12 then 1#4 else 0#4)) = true := by
  apply firstStrictFour_uge_two_of_card_four_and_adjacent_one_hit
    (fun point : Fin 13 ↦ rowBit (directSourceRows C) 0 4 point.val)
  · exact directSource_row_card_eq_four C 0 4
  · exact directSource_mainFour_middle_card_le_one C
  · exact directSource_mainFour_second_card_le_one C
  · simpa using directSource_row_center_excluded C 0 4

/-- The retained first parent row likewise contains at least two strict
points of the first opposite cap. -/
theorem directSource_parentFirst_firstStrict_card_ge_two
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
    (T : CanonicalAsymmetricSemanticRowTable P star first)
    (hcard : D.A.card = 13) (hdistinct : first.doubleRadius ≠ radius) :
    (2#4).ule
      ((bif parentRowBit (directSourceParentFirst P) 9 then 1#4 else 0#4) +
        (bif parentRowBit (directSourceParentFirst P) 10 then 1#4 else 0#4) +
        (bif parentRowBit (directSourceParentFirst P) 11 then 1#4 else 0#4) +
        (bif parentRowBit (directSourceParentFirst P) 12 then 1#4 else 0#4)) = true := by
  apply firstStrictFour_uge_two_of_card_four_and_adjacent_one_hit
    (fun point : Fin 13 ↦
      parentRowBit (directSourceParentFirst P) point.val)
  · exact directSource_parentFirst_card_eq_four T hcard hdistinct
  · exact (directSource_parentFirst_adjacent_blocks_ule_one
      T hcard hdistinct).1
  · exact (directSource_parentFirst_adjacent_blocks_ule_one
      T hcard hdistinct).2
  · simpa using directSource_parentFirst_four_excluded T hcard hdistinct

/-- In the distinct-radius arm, the retained first-apex source row and the
double-deletion first row are pointwise disjoint. -/
theorem directSource_mainFour_firstRow_disjoint
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
    (C : CanonicalCoverFamilies T) (hdistinct : first.doubleRadius ≠ radius)
    (point : Fin 13) :
    (!(rowBit (directSourceRows C) 0 4 point.val &&
      firstRowBit (directSourceFirstRow T) point.val)) = true := by
  rw [Bool.not_eq_true_eq_eq_false]
  apply Bool.and_eq_false_iff.mpr
  by_cases hmain : rowBit (directSourceRows C) 0 4 point.val = false
  · exact Or.inl hmain
  · right
    rw [firstRowBit_directSourceFirstRow]
    apply decide_eq_false_iff_not.mpr
    intro hdouble
    have hmainTrue : rowBit (directSourceRows C) 0 4 point.val = true :=
      Bool.eq_true_of_not_eq_false hmain
    have hmainMem : P.point point ∈ (T.main 4).support := by
      have hpacked := rowBit_main_eq_decide_local C (4 : Fin 13) point
      have hdecide : decide (P.point point ∈ (T.main 4).support) = true := by
        rw [← hpacked]
        simpa using hmainTrue
      exact of_decide_eq_true hdecide
    have hretained : P.point point ∈ first.retainedRow.support := by
      simpa only [T.main_firstApex_support] using hmainMem
    have hdouble' : P.point point ∈ first.doubleRow.support := by
      simpa only [T.firstApexDoubleRow_support] using hdouble
    exact Finset.disjoint_left.mp (first.distinctRadius_disjoint hdistinct)
      hretained hdouble'

/-- Population count for the four strict points of the first opposite cap. -/
def bitCountFirstStrictFour (member : Fin 13 → Bool) : BitVec 4 :=
  (bif member 9 then 1#4 else 0#4) +
  (bif member 10 then 1#4 else 0#4) +
  (bif member 11 then 1#4 else 0#4) +
  (bif member 12 then 1#4 else 0#4)

private theorem firstStrictIndexFilter_card_eq_inter
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    {Q : FrontierBiApexRobustExactFiveSecondCapResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {M : PhysicalActualCriticalMutualOmissionPair H profile}
    {N : SourceTwoHitNormalForm Q profile M}
    (P : CanonicalAsymmetricRolePrepacket N) (support : Finset ℝ²)
    (hsub : support ⊆ D.A) :
    (({9, 10, 11, 12} : Finset (Fin 13)).filter fun point ↦
      decide (P.point point ∈ support) = true).card =
        (support ∩ S.capInteriorByIndex S.oppIndex1).card := by
  let indices := ({9, 10, 11, 12} : Finset (Fin 13)).filter fun point ↦
    decide (P.point point ∈ support) = true
  have himage : indices.image P.point =
      support ∩ S.capInteriorByIndex S.oppIndex1 := by
    ext x
    constructor
    · intro hx
      rcases Finset.mem_image.mp hx with ⟨i, hi, rfl⟩
      rcases Finset.mem_filter.mp hi with ⟨hiBlock, hiSupport⟩
      refine Finset.mem_inter.mpr ⟨of_decide_eq_true hiSupport, ?_⟩
      apply (P.capInterior_mem_iff_index_gt_eight i).2
      simp only [Finset.mem_insert, Finset.mem_singleton] at hiBlock
      rcases hiBlock with rfl | rfl | rfl | rfl <;> decide
    · intro hx
      rcases Finset.mem_inter.mp hx with ⟨hxSupport, hxInterior⟩
      have hxA : x ∈ D.A := hsub hxSupport
      rw [← P.point_image] at hxA
      rcases Finset.mem_image.mp hxA with ⟨i, _hi, rfl⟩
      have hiGt : (8 : Fin 13) < i :=
        (P.capInterior_mem_iff_index_gt_eight i).1 hxInterior
      have hiBlock : i ∈ ({9, 10, 11, 12} : Finset (Fin 13)) := by
        fin_cases i <;> simp_all
      exact Finset.mem_image.mpr
        ⟨i, Finset.mem_filter.mpr ⟨hiBlock, by simp [hxSupport]⟩, rfl⟩
  calc
    indices.card = (indices.image P.point).card :=
      (Finset.card_image_of_injective _ P.point_injective).symm
    _ = (support ∩ S.capInteriorByIndex S.oppIndex1).card := by rw [himage]

private theorem bitCountFirstStrictFour_eq_two_of_filter_card_eq_two
    (member : Fin 13 → Bool)
    (hcard : (({9, 10, 11, 12} : Finset (Fin 13)).filter fun point ↦
      member point = true).card = 2) :
    (bitCountFirstStrictFour member == 2#4) = true := by
  native_decide +revert

/-- The two distinct first-apex rows partition the four strict first-cap
positions into exact two-point supports. -/
theorem directSource_firstApex_strict_exact_two_and_cover
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
    (C : CanonicalCoverFamilies T) (hcard : D.A.card = 13)
    (hdistinct : first.doubleRadius ≠ radius) :
    ((bitCountFirstStrictFour fun point ↦
      rowBit (directSourceRows C) 0 4 point.val) == 2#4) = true ∧
    ((bitCountFirstStrictFour fun point ↦
      firstRowBit (directSourceFirstRow T) point.val) == 2#4) = true ∧
    (rowBit (directSourceRows C) 0 4 9 ||
      firstRowBit (directSourceFirstRow T) 9) = true ∧
    (rowBit (directSourceRows C) 0 4 10 ||
      firstRowBit (directSourceFirstRow T) 10) = true ∧
    (rowBit (directSourceRows C) 0 4 11 ||
      firstRowBit (directSourceFirstRow T) 11) = true ∧
    (rowBit (directSourceRows C) 0 4 12 ||
      firstRowBit (directSourceFirstRow T) 12) = true := by
  let I := S.capInteriorByIndex S.oppIndex1
  have hnormal :
      (first.retainedRow.support ∩ I).card = 2 ∧
      (first.doubleRow.support ∩ I).card = 2 ∧
      (first.retainedRow.support ∩ I) ∪
          (first.doubleRow.support ∩ I) = I := by
    simpa only [I] using
      firstApex_distinctRadius_rows_partition_capInterior
        Q first hcard hdistinct
  have hmainBit (point : Fin 13) :
      rowBit (directSourceRows C) 0 4 point.val =
        decide (P.point point ∈ first.retainedRow.support) := by
    calc
      rowBit (directSourceRows C) 0 4 point.val =
          decide (P.point point ∈ (T.main 4).support) := by
        simpa using rowBit_main_eq_decide_local C (4 : Fin 13) point
      _ = decide (P.point point ∈ first.retainedRow.support) := by
        rw [T.main_firstApex_support]
  have hfirstBit (point : Fin 13) :
      firstRowBit (directSourceFirstRow T) point.val =
        decide (P.point point ∈ first.doubleRow.support) := by
    calc
      firstRowBit (directSourceFirstRow T) point.val =
          decide (P.point point ∈ T.firstApexDoubleRow.support) :=
        firstRowBit_directSourceFirstRow T point
      _ = decide (P.point point ∈ first.doubleRow.support) := by
        rw [T.firstApexDoubleRow_support]
  have hcover (point : Fin 13) (hgt : (8 : Fin 13) < point) :
      (rowBit (directSourceRows C) 0 4 point.val ||
        firstRowBit (directSourceFirstRow T) point.val) = true := by
    have hpointI : P.point point ∈ I :=
      (P.capInterior_mem_iff_index_gt_eight point).2 hgt
    have hpointUnion : P.point point ∈
        (first.retainedRow.support ∩ I) ∪
          (first.doubleRow.support ∩ I) := by
      rw [hnormal.2.2]
      exact hpointI
    rcases Finset.mem_union.mp hpointUnion with hretained | hdouble
    · have hrow : rowBit (directSourceRows C) 0 4 point.val = true := by
        rw [hmainBit]
        exact decide_eq_true (Finset.mem_inter.mp hretained).1
      simp [hrow]
    · have hrow : firstRowBit (directSourceFirstRow T) point.val = true := by
        rw [hfirstBit]
        exact decide_eq_true (Finset.mem_inter.mp hdouble).1
      simp [hrow]
  refine ⟨?_, ?_, hcover 9 (by decide), hcover 10 (by decide),
    hcover 11 (by decide), hcover 12 (by decide)⟩
  · apply bitCountFirstStrictFour_eq_two_of_filter_card_eq_two
    have hindices := firstStrictIndexFilter_card_eq_inter P
      first.retainedRow.support first.retainedRow.support_subset_A
    simpa only [hmainBit, I] using hindices.trans hnormal.1
  · apply bitCountFirstStrictFour_eq_two_of_filter_card_eq_two
    have hindices := firstStrictIndexFilter_card_eq_inter P
      first.doubleRow.support first.doubleRow.support_subset_A
    simpa only [hfirstBit, I] using hindices.trans hnormal.2.1

/-- Whether the retained parent-first row meets the retained main row. -/
def directSourceParentFirstMainFourOverlap
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
    (C : CanonicalCoverFamilies T) : Bool :=
  (parentRowBit (directSourceParentFirst P) 0 && rowBit (directSourceRows C) 0 4 0) ||
  (parentRowBit (directSourceParentFirst P) 1 && rowBit (directSourceRows C) 0 4 1) ||
  (parentRowBit (directSourceParentFirst P) 2 && rowBit (directSourceRows C) 0 4 2) ||
  (parentRowBit (directSourceParentFirst P) 3 && rowBit (directSourceRows C) 0 4 3) ||
  (parentRowBit (directSourceParentFirst P) 4 && rowBit (directSourceRows C) 0 4 4) ||
  (parentRowBit (directSourceParentFirst P) 5 && rowBit (directSourceRows C) 0 4 5) ||
  (parentRowBit (directSourceParentFirst P) 6 && rowBit (directSourceRows C) 0 4 6) ||
  (parentRowBit (directSourceParentFirst P) 7 && rowBit (directSourceRows C) 0 4 7) ||
  (parentRowBit (directSourceParentFirst P) 8 && rowBit (directSourceRows C) 0 4 8) ||
  (parentRowBit (directSourceParentFirst P) 9 && rowBit (directSourceRows C) 0 4 9) ||
  (parentRowBit (directSourceParentFirst P) 10 && rowBit (directSourceRows C) 0 4 10) ||
  (parentRowBit (directSourceParentFirst P) 11 && rowBit (directSourceRows C) 0 4 11) ||
  (parentRowBit (directSourceParentFirst P) 12 && rowBit (directSourceRows C) 0 4 12)

/-- Pointwise equality of the retained parent-first row and retained main row. -/
def directSourceParentFirstMainFourEq
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
    (C : CanonicalCoverFamilies T) : Bool :=
  (parentRowBit (directSourceParentFirst P) 0 == rowBit (directSourceRows C) 0 4 0) &&
  (parentRowBit (directSourceParentFirst P) 1 == rowBit (directSourceRows C) 0 4 1) &&
  (parentRowBit (directSourceParentFirst P) 2 == rowBit (directSourceRows C) 0 4 2) &&
  (parentRowBit (directSourceParentFirst P) 3 == rowBit (directSourceRows C) 0 4 3) &&
  (parentRowBit (directSourceParentFirst P) 4 == rowBit (directSourceRows C) 0 4 4) &&
  (parentRowBit (directSourceParentFirst P) 5 == rowBit (directSourceRows C) 0 4 5) &&
  (parentRowBit (directSourceParentFirst P) 6 == rowBit (directSourceRows C) 0 4 6) &&
  (parentRowBit (directSourceParentFirst P) 7 == rowBit (directSourceRows C) 0 4 7) &&
  (parentRowBit (directSourceParentFirst P) 8 == rowBit (directSourceRows C) 0 4 8) &&
  (parentRowBit (directSourceParentFirst P) 9 == rowBit (directSourceRows C) 0 4 9) &&
  (parentRowBit (directSourceParentFirst P) 10 == rowBit (directSourceRows C) 0 4 10) &&
  (parentRowBit (directSourceParentFirst P) 11 == rowBit (directSourceRows C) 0 4 11) &&
  (parentRowBit (directSourceParentFirst P) 12 == rowBit (directSourceRows C) 0 4 12)

/-- The source's overlap-implies-equality guard is vacuous in the
distinct-radius arm because these two rows are disjoint. -/
theorem directSource_parentFirst_mainFour_overlap_implies_eq
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
    (C : CanonicalCoverFamilies T) (hcard : D.A.card = 13)
    (hdistinct : first.doubleRadius ≠ radius) :
    (!(directSourceParentFirstMainFourOverlap C) ||
      directSourceParentFirstMainFourEq C) = true := by
  have hfalse (point : Fin 13) :
      (parentRowBit (directSourceParentFirst P) point.val &&
        rowBit (directSourceRows C) 0 4 point.val) = false := by
    rw [directSource_parentFirst_eq_firstRow T hcard hdistinct]
    have hdisjoint := directSource_mainFour_firstRow_disjoint
      C hdistinct point
    rw [Bool.not_eq_true_eq_eq_false] at hdisjoint
    simpa only [Bool.and_comm] using hdisjoint
  have hoverlap : directSourceParentFirstMainFourOverlap C = false := by
    have h0 := hfalse (0 : Fin 13)
    have h1 := hfalse (1 : Fin 13)
    have h2 := hfalse (2 : Fin 13)
    have h3 := hfalse (3 : Fin 13)
    have h4 := hfalse (4 : Fin 13)
    have h5 := hfalse (5 : Fin 13)
    have h6 := hfalse (6 : Fin 13)
    have h7 := hfalse (7 : Fin 13)
    have h8 := hfalse (8 : Fin 13)
    have h9 := hfalse (9 : Fin 13)
    have h10 := hfalse (10 : Fin 13)
    have h11 := hfalse (11 : Fin 13)
    have h12 := hfalse (12 : Fin 13)
    simp only [directSourceParentFirstMainFourOverlap]
    simp_all
  simp [hoverlap]

private theorem parentBitCount13_eq_four_of_filter_card_eq_four
    (member : Fin 13 → Bool)
    (hcard : (Finset.univ.filter fun i ↦ member i = true).card = 4) :
    (bitCount13 member == 4#4) = true := by
  native_decide +revert

private theorem parentSupportIndexFilter_card
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    {Q : FrontierBiApexRobustExactFiveSecondCapResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {M : PhysicalActualCriticalMutualOmissionPair H profile}
    {N : SourceTwoHitNormalForm Q profile M}
    (P : CanonicalAsymmetricRolePrepacket N) (support : Finset ℝ²)
    (hsub : support ⊆ D.A) :
    (Finset.univ.filter fun i : Fin 13 ↦
      decide (P.point i ∈ support) = true).card = support.card := by
  let indices := Finset.univ.filter fun i : Fin 13 ↦
    decide (P.point i ∈ support) = true
  have himage : indices.image P.point = support := by
    ext x
    constructor
    · intro hx
      rcases Finset.mem_image.mp hx with ⟨i, hi, rfl⟩
      exact of_decide_eq_true (Finset.mem_filter.mp hi).2
    · intro hx
      have hxA : x ∈ D.A := hsub hx
      rw [← P.point_image] at hxA
      rcases Finset.mem_image.mp hxA with ⟨i, _hi, rfl⟩
      exact Finset.mem_image.mpr
        ⟨i, Finset.mem_filter.mpr ⟨Finset.mem_univ _, by simp [hx]⟩, rfl⟩
  calc
    indices.card = (indices.image P.point).card :=
      (Finset.card_image_of_injective _ P.point_injective).symm
    _ = support.card := by rw [himage]

/-- The retained second-apex parent row has exactly four packed members. -/
theorem directSource_parentSecond_card_eq_four
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
    ((bitCount13 fun point ↦
      parentRowBit (directSourceParentSecond P) point.val) == 4#4) = true := by
  rw [show (fun point : Fin 13 ↦
      parentRowBit (directSourceParentSecond P) point.val) =
      (fun point ↦ decide (P.point point ∈ R.common.packet.B₂)) by
    funext point
    exact parentRowBit_directSourceParentSecond P point]
  apply parentBitCount13_eq_four_of_filter_card_eq_four
  rw [parentSupportIndexFilter_card P R.common.packet.B₂ (by
    intro z hz
    exact (Finset.mem_erase.mp
      (Finset.mem_erase.mp (R.common.packet.row₂.subset hz)).2).2)]
  exact R.common.packet.B₂_card

/-- The retained second-apex parent row omits its center at index eight. -/
theorem directSource_parentSecond_eight_excluded
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
    (!(parentRowBit (directSourceParentSecond P) 8)) = true := by
  change (!(parentRowBit (directSourceParentSecond P) (8 : Fin 13).val)) = true
  rw [parentRowBit_directSourceParentSecond]
  rw [Bool.not_eq_true_eq_eq_false]
  apply decide_eq_false_iff_not.mpr
  have hpointSecond : P.point 8 = S.oppApex2 := by
    rw [P.secondApex_at_eight]
    rcases hi : S.surplusIdx with ⟨i, hi3⟩
    interval_cases i <;>
      simp [SurplusCapPacket.oppApex2, SurplusCapPacket.oppIndex2,
        SurplusCapPacket.oppositeVertexByIndex, hi]
  let K := secondRowSelectedFourClass R.common.packet
  have hcenter : S.oppApex2 ∉ K.support := K.center_not_mem
  simpa only [K, hpointSecond] using hcenter

/-- Membership in the retained second-apex parent row implies membership in
the complete exact-five shell at that apex. -/
theorem directSource_parentSecond_imp_shell
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
    (T : CanonicalAsymmetricSemanticRowTable P star first)
    (point : Fin 13) :
    (!(parentRowBit (directSourceParentSecond P) point.val) ||
      shellBit (directSourceShell T) point.val) = true := by
  cases hrow : parentRowBit (directSourceParentSecond P) point.val
  · simp
  · simp only [Bool.not_true, Bool.false_or]
    rw [shellBit_directSourceShell, decide_eq_true_eq]
    apply (T.exactFiveShell_mem_iff point).2
    let K := secondRowSelectedFourClass R.common.packet
    apply selectedFourClass_support_subset_exactFiveClass profile K
    have hpacked := parentRowBit_directSourceParentSecond P point
    rw [hrow] at hpacked
    simpa only [K, Bool.true_eq] using of_decide_eq_true hpacked.symm

/-- The canonical right-cover row at center two agrees pointwise with the
main row there; center two is the actual blocker of the distinguished source. -/
theorem directSource_rightTwo_eq_mainTwo
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
    rowBit (directSourceRows C) 2 2 point.val =
      rowBit (directSourceRows C) 0 2 point.val := by
  have hsourceA : P.point P.sourceIndex ∈ D.A := canonicalPoint_mem P P.sourceIndex
  have hblockerPoint :
      P.point (T.blockerIndex P.sourceIndex) = P.point P.blockerIndex := by
    calc
      P.point (T.blockerIndex P.sourceIndex) =
          H.centerAt (P.point P.sourceIndex) hsourceA :=
        T.blocker_point P.sourceIndex
      _ = M.target.1 := by
        simpa [P.source_point] using P.actualCenter_eq_blocker
      _ = P.point P.blockerIndex := P.blocker_point.symm
  have hblocker : T.blockerIndex P.sourceIndex = (2 : Fin 13) :=
    (P.point_injective hblockerPoint).trans P.blockerIndex_eq_two
  have hsupports := (C.blocker_supports_eq_main P.sourceIndex).2
  rw [hblocker] at hsupports
  calc
    rowBit (directSourceRows C) 2 2 point.val =
        directSourceRowMember C 2 2 point :=
      rowBit_directSourceRows C (2 : Fin 3) (2 : Fin 13) point
    _ = decide (P.point point ∈ (C.right 2).support) := by
      simp [directSourceRowMember]
    _ = decide (P.point point ∈ (T.main 2).support) := by rw [hsupports]
    _ = directSourceRowMember C 0 2 point := by
      simp [directSourceRowMember]
    _ = rowBit (directSourceRows C) 0 2 point.val :=
      (rowBit_directSourceRows C (0 : Fin 3) (2 : Fin 13) point).symm

/-- Either canonical deletion-cover family agrees with the main row at the
distinguished blocker center two. -/
theorem directSource_coverTwo_eq_mainTwo
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
    (C : CanonicalCoverFamilies T) (family : Fin 3) (point : Fin 13)
    (hfamily : family = 1 ∨ family = 2) :
    rowBit (directSourceRows C) family.val 2 point.val =
      rowBit (directSourceRows C) 0 2 point.val := by
  rcases hfamily with rfl | rfl
  · exact directSource_leftTwo_eq_mainTwo C point
  · exact directSource_rightTwo_eq_mainTwo C point

private theorem rowBit_left_eq_decide_local
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
    (C : CanonicalCoverFamilies T) (center point : Fin 13) :
    rowBit (directSourceRows C) 1 center.val point.val =
      decide (P.point point ∈ (C.left center).support) := by
  calc
    rowBit (directSourceRows C) 1 center.val point.val =
        directSourceRowMember C (1 : Fin 3) center point :=
      rowBit_directSourceRows C (1 : Fin 3) center point
    _ = decide (P.point point ∈ (C.left center).support) := by
      simp [directSourceRowMember]

private theorem rowBit_right_eq_decide_local
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
    (C : CanonicalCoverFamilies T) (center point : Fin 13) :
    rowBit (directSourceRows C) 2 center.val point.val =
      decide (P.point point ∈ (C.right center).support) := by
  calc
    rowBit (directSourceRows C) 2 center.val point.val =
        directSourceRowMember C (2 : Fin 3) center point :=
      rowBit_directSourceRows C (2 : Fin 3) center point
    _ = decide (P.point point ∈ (C.right center).support) := by
      simp [directSourceRowMember]

/-- Every canonical left-cover row omits at least one of its defining pair.
This is the Boolean source encoding of `CanonicalCoverFamilies.left_omits`. -/
theorem directSource_left_cover_pair_omission
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
    (C : CanonicalCoverFamilies T) (center : Fin 13) :
    (!(rowBit (directSourceRows C) 1 center.val 2 &&
      rowBit (directSourceRows C) 1 center.val 1)) = true := by
  have htwo := rowBit_left_eq_decide_local C center (2 : Fin 13)
  have hone := rowBit_left_eq_decide_local C center (1 : Fin 13)
  change (!(rowBit (directSourceRows C) 1 center.val (2 : Fin 13).val &&
    rowBit (directSourceRows C) 1 center.val (1 : Fin 13).val)) = true
  rw [htwo, hone]
  rcases C.left_omits center with htwo | hone
  · simp [htwo]
  · simp [hone]

/-- Every canonical right-cover row omits at least one of its defining pair.
This is the Boolean source encoding of `CanonicalCoverFamilies.right_omits`. -/
theorem directSource_right_cover_pair_omission
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
    (C : CanonicalCoverFamilies T) (center : Fin 13) :
    (!(rowBit (directSourceRows C) 2 center.val 2 &&
      rowBit (directSourceRows C) 2 center.val 3)) = true := by
  have htwo := rowBit_right_eq_decide_local C center (2 : Fin 13)
  have hthree := rowBit_right_eq_decide_local C center (3 : Fin 13)
  change (!(rowBit (directSourceRows C) 2 center.val (2 : Fin 13).val &&
    rowBit (directSourceRows C) 2 center.val (3 : Fin 13).val)) = true
  rw [htwo, hthree]
  rcases C.right_omits center with htwo | hthree
  · simp [htwo]
  · simp [hthree]

private theorem bitCountMiddleFive_ule_one_of_filter_card_le_one
    (member : Fin 13 → Bool)
    (hcard : (({4, 5, 6, 7, 8} : Finset (Fin 13)).filter fun i ↦
      member i = true).card ≤ 1) :
    (bitCountMiddleFive member).ule 1#4 = true := by
  native_decide +revert

private theorem bitCountFirstWrapSix_ule_one_of_filter_card_le_one
    (member : Fin 13 → Bool)
    (hcard : (({0, 8, 9, 10, 11, 12} : Finset (Fin 13)).filter fun i ↦
      member i = true).card ≤ 1) :
    (bitCountFirstWrapSix member).ule 1#4 = true := by
  native_decide +revert

private theorem bitCountFirstWrapSix_ule_two_of_filter_card_le_two
    (member : Fin 13 → Bool)
    (hcard : (({0, 8, 9, 10, 11, 12} : Finset (Fin 13)).filter fun i ↦
      member i = true).card ≤ 2) :
    (bitCountFirstWrapSix member).ule 2#4 = true := by
  native_decide +revert

private theorem bitCountSecondFive_ule_one_of_filter_card_le_one
    (member : Fin 13 → Bool)
    (hcard : (({0, 1, 2, 3, 4} : Finset (Fin 13)).filter fun i ↦
      member i = true).card ≤ 1) :
    (bitCountSecondFive member).ule 1#4 = true := by
  native_decide +revert

private theorem bitCountSecondFive_ule_two_of_filter_card_le_two
    (member : Fin 13 → Bool)
    (hcard : (({0, 1, 2, 3, 4} : Finset (Fin 13)).filter fun i ↦
      member i = true).card ≤ 2) :
    (bitCountSecondFive member).ule 2#4 = true := by
  native_decide +revert

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
    (P : CanonicalAsymmetricRolePrepacket N) {center : ℝ²}
    (K : SelectedFourClass D.A center)
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

private theorem directSource_firstWrap_filter_card_le
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
    (bound : Nat)
    (hgeometry : ((directSourceClass C family center).support ∩
      S.capByIndex S.oppIndex1).card ≤ bound) :
    (({0, 8, 9, 10, 11, 12} : Finset (Fin 13)).filter fun point ↦
      rowBit (directSourceRows C) family.val center.val point.val = true).card ≤
        bound := by
  have hsource := restrictedSupportIndexFilter_card_le_inter P
    (directSourceClass C family center) {0, 8, 9, 10, 11, 12}
      (S.capByIndex S.oppIndex1) (by
        intro i hi
        simp only [Finset.mem_insert, Finset.mem_singleton] at hi
        rcases hi with rfl | rfl | rfl | rfl | rfl | rfl <;>
          exact point_mem_firstCap_of_wrap P _ (by simp))
  simpa using hsource.trans hgeometry

private theorem directSource_second_filter_card_le
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
    (bound : Nat)
    (hgeometry : ((directSourceClass C family center).support ∩
      S.capByIndex S.oppIndex2).card ≤ bound) :
    (({0, 1, 2, 3, 4} : Finset (Fin 13)).filter fun point ↦
      rowBit (directSourceRows C) family.val center.val point.val = true).card ≤
        bound := by
  have hsource := restrictedSupportIndexFilter_card_le_inter P
    (directSourceClass C family center) {0, 1, 2, 3, 4}
      (S.capByIndex S.oppIndex2) (by
        intro i hi
        simp only [Finset.mem_insert, Finset.mem_singleton] at hi
        rw [capByIndex_secondOpp_eq]
        exact (P.secondOppCap_mem_iff_initial_block i).2 (by
          rcases hi with rfl | rfl | rfl | rfl | rfl <;> decide))
  simpa using hsource.trans hgeometry

/-- A row centered on the first-opposite cap has at most two points there. -/
theorem directSource_firstWrap_card_le_two
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
    (hcenter : center = 0 ∨ (8 : Fin 13) ≤ center) :
    (bitCountFirstWrapSix fun point ↦
      rowBit (directSourceRows C) family.val center.val point.val).ule 2#4 = true := by
  apply bitCountFirstWrapSix_ule_two_of_filter_card_le_two
  apply directSource_firstWrap_filter_card_le (P := P) C family center 2
  exact CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two S
    D.convex S.oppIndex1 (directSourceClass C family center)
      (point_mem_firstCap_of_wrap P center hcenter)

/-- A row centered on the second-opposite cap has at most two points there. -/
theorem directSource_second_card_le_two
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
    (hcenter : center ≤ (4 : Fin 13)) :
    (bitCountSecondFive fun point ↦
      rowBit (directSourceRows C) family.val center.val point.val).ule 2#4 = true := by
  apply bitCountSecondFive_ule_two_of_filter_card_le_two
  apply directSource_second_filter_card_le (P := P) C family center 2
  exact CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two S
    D.convex S.oppIndex2 (directSourceClass C family center) (by
      rw [capByIndex_secondOpp_eq]
      exact (P.secondOppCap_mem_iff_initial_block center).2 hcenter)

/-- A row centered at either surplus-cap endpoint has at most one point in
that cap. -/
theorem directSource_middle_card_le_one
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
    (hcenter : center = 4 ∨ center = 8) :
    (bitCountMiddleFive fun point ↦
      rowBit (directSourceRows C) family.val center.val point.val).ule 1#4 = true := by
  apply bitCountMiddleFive_ule_one_of_filter_card_le_one
  have hsource := restrictedSupportIndexFilter_card_le_inter P
    (directSourceClass C family center) {4, 5, 6, 7, 8}
      (S.capByIndex S.surplusIdx) (by
        intro i hi
        rw [capByIndex_surplus_eq]
        exact (P.surplusCap_mem_iff_middle_block i).2 (by
          simp only [Finset.mem_insert, Finset.mem_singleton] at hi
          rcases hi with rfl | rfl | rfl | rfl | rfl <;> decide))
  have hgeometry :=
    selectedFourClass_inter_cap_card_le_one_of_endpoint S S.surplusIdx
      (directSourceClass C family center) (by
        rcases hcenter with rfl | rfl
        · exact Or.inl (P.firstApex_at_four.trans
            S.triangleByIndex_surplusIdx_v2_eq_oppositeVertexByIndex_oppIndex1.symm)
        · exact Or.inr (P.secondApex_at_eight.trans
            S.triangleByIndex_surplusIdx_v3_eq_oppositeVertexByIndex_oppIndex2.symm))
  simpa using hsource.trans hgeometry

/-- A row centered at either first-opposite-cap endpoint has at most one point
in that cap. -/
theorem directSource_firstWrap_card_le_one
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
    (hcenter : center = 8 ∨ center = 0) :
    (bitCountFirstWrapSix fun point ↦
      rowBit (directSourceRows C) family.val center.val point.val).ule 1#4 = true := by
  apply bitCountFirstWrapSix_ule_one_of_filter_card_le_one
  apply directSource_firstWrap_filter_card_le (P := P) C family center 1
  apply selectedFourClass_inter_cap_card_le_one_of_endpoint S S.oppIndex1
  rcases hcenter with rfl | rfl
  · exact Or.inl (P.secondApex_at_eight.trans
      S.triangleByIndex_oppIndex1_v2_eq_oppositeVertexByIndex_oppIndex2.symm)
  · exact Or.inr (P.surplusOpposite_at_zero.trans
      S.triangleByIndex_oppIndex1_v3_eq_oppositeVertexByIndex_surplusIdx.symm)

/-- A row centered at either second-opposite-cap endpoint has at most one
point in that cap. -/
theorem directSource_second_card_le_one
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
    (hcenter : center = 0 ∨ center = 4) :
    (bitCountSecondFive fun point ↦
      rowBit (directSourceRows C) family.val center.val point.val).ule 1#4 = true := by
  apply bitCountSecondFive_ule_one_of_filter_card_le_one
  apply directSource_second_filter_card_le (P := P) C family center 1
  apply selectedFourClass_inter_cap_card_le_one_of_endpoint S S.oppIndex2
  rcases hcenter with rfl | rfl
  · exact Or.inl (P.surplusOpposite_at_zero.trans
      S.triangleByIndex_oppIndex2_v2_eq_oppositeVertexByIndex_surplusIdx.symm)
  · exact Or.inr (P.firstApex_at_four.trans
      S.triangleByIndex_oppIndex2_v3_eq_oppositeVertexByIndex_oppIndex1.symm)

/-- The retained second-apex parent row has the endpoint one-hit bound on
both caps adjacent to its center. -/
theorem directSource_parentSecond_adjacent_blocks_ule_one
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
    (bitCountMiddleFive fun point ↦
      parentRowBit (directSourceParentSecond P) point.val).ule 1#4 = true ∧
    (bitCountFirstWrapSix fun point ↦
      parentRowBit (directSourceParentSecond P) point.val).ule 1#4 = true := by
  let K := secondRowSelectedFourClass R.common.packet
  have hsecond : S.oppApex2 = S.oppositeVertexByIndex S.oppIndex2 := by
    rcases hi : S.surplusIdx with ⟨i, hi3⟩
    interval_cases i <;>
      simp [SurplusCapPacket.oppApex2, SurplusCapPacket.oppIndex2,
        SurplusCapPacket.oppositeVertexByIndex, hi]
  constructor
  · apply bitCountMiddleFive_ule_one_of_filter_card_le_one
    have hsource := restrictedSupportIndexFilter_card_le_inter P K
      {4, 5, 6, 7, 8} (S.capByIndex S.surplusIdx) (by
        intro i hi
        rw [capByIndex_surplus_eq]
        exact (P.surplusCap_mem_iff_middle_block i).2 (by
          simp only [Finset.mem_insert, Finset.mem_singleton] at hi
          rcases hi with rfl | rfl | rfl | rfl | rfl <;> decide))
    have hgeometry :=
      selectedFourClass_inter_cap_card_le_one_of_endpoint S S.surplusIdx K
        (Or.inr (hsecond.trans
          S.triangleByIndex_surplusIdx_v3_eq_oppositeVertexByIndex_oppIndex2.symm))
    simpa only [K, parentRowBit_directSourceParentSecond] using
      hsource.trans hgeometry
  · apply bitCountFirstWrapSix_ule_one_of_filter_card_le_one
    have hsource := restrictedSupportIndexFilter_card_le_inter P K
      {0, 8, 9, 10, 11, 12} (S.capByIndex S.oppIndex1) (by
        intro i hi
        exact point_mem_firstCap_of_wrap P i (by
          simp only [Finset.mem_insert, Finset.mem_singleton] at hi
          rcases hi with rfl | rfl | rfl | rfl | rfl | rfl <;> simp))
    have hgeometry :=
      selectedFourClass_inter_cap_card_le_one_of_endpoint S S.oppIndex1 K
        (Or.inl (hsecond.trans
          S.triangleByIndex_oppIndex1_v2_eq_oppositeVertexByIndex_oppIndex2.symm))
    simpa only [K, parentRowBit_directSourceParentSecond] using
      hsource.trans hgeometry

#print axioms directSource_family_pair_center_count_le_two
#print axioms directSource_left_cover_pair_omission
#print axioms directSource_firstWrap_card_le_two
#print axioms directSource_second_card_le_one
#print axioms directSource_parentSecond_physical_card_ge_two
#print axioms directSource_parentSecond_sharedPair_false_of_strict
#print axioms directSource_firstApex_strict_exact_two_and_cover
#print axioms directSource_extended_any_pair_packed_center_count_le_two

end

end ATailExactFiveCard13DistinctBaseRetainedIngressScratch
end Problem97
