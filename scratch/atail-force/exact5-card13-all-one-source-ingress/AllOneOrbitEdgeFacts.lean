/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import AllOnePacketFacts

/-!
# Left and right orbit edge facts

Source-faithful Boolean omission clauses for the two non-middle aligned-cover
orbits.  The cover rows and their original frame are unchanged.
-/

namespace Problem97
namespace ATailExactFiveCard13AllOneSourceIngressScratch

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

@[simp] theorem sourceClass_left_one
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {P : CanonicalCard13Frame profile}
    {star : PhysicalGlobalCrossDeletionStar profile}
    {hall : AllPhysicalActualCriticalRowsOneHit H profile}
    {first : FirstApexShellRolePacket F R}
    {T : CanonicalAllOneSemanticRowTable P star hall first}
    (C : CanonicalAlignedCoverFamilies T 1 2 3) (center : Fin 13) :
    (CanonicalAllOneSourceOrbitIngress.left C).sourceClass 1 center =
      C.leftRow center := by
  rfl

@[simp] theorem sourceClass_left_two
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {P : CanonicalCard13Frame profile}
    {star : PhysicalGlobalCrossDeletionStar profile}
    {hall : AllPhysicalActualCriticalRowsOneHit H profile}
    {first : FirstApexShellRolePacket F R}
    {T : CanonicalAllOneSemanticRowTable P star hall first}
    (C : CanonicalAlignedCoverFamilies T 1 2 3) (center : Fin 13) :
    (CanonicalAllOneSourceOrbitIngress.left C).sourceClass 2 center =
      C.rightRow center := by
  rfl

@[simp] theorem sourceClass_right_one
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {P : CanonicalCard13Frame profile}
    {star : PhysicalGlobalCrossDeletionStar profile}
    {hall : AllPhysicalActualCriticalRowsOneHit H profile}
    {first : FirstApexShellRolePacket F R}
    {T : CanonicalAllOneSemanticRowTable P star hall first}
    (C : CanonicalAlignedCoverFamilies T 3 1 2) (center : Fin 13) :
    (CanonicalAllOneSourceOrbitIngress.right C).sourceClass 1 center =
      C.leftRow center := by
  rfl

@[simp] theorem sourceClass_right_two
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {P : CanonicalCard13Frame profile}
    {star : PhysicalGlobalCrossDeletionStar profile}
    {hall : AllPhysicalActualCriticalRowsOneHit H profile}
    {first : FirstApexShellRolePacket F R}
    {T : CanonicalAllOneSemanticRowTable P star hall first}
    (C : CanonicalAlignedCoverFamilies T 3 1 2) (center : Fin 13) :
    (CanonicalAllOneSourceOrbitIngress.right C).sourceClass 2 center =
      C.rightRow center := by
  rfl

/-- In the hub-left orbit, the left cover family omits the physical edge
`(1,2)` at every center. -/
theorem allOne_left_left_edge_omission
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {P : CanonicalCard13Frame profile}
    {star : PhysicalGlobalCrossDeletionStar profile}
    {hall : AllPhysicalActualCriticalRowsOneHit H profile}
    {first : FirstApexShellRolePacket F R}
    {T : CanonicalAllOneSemanticRowTable P star hall first}
    (C : CanonicalAlignedCoverFamilies T 1 2 3) (center : Fin 13) :
    (!((rowBit (CanonicalAllOneSourceOrbitIngress.left C).sourceRows
          1 center.val 1) &&
        rowBit (CanonicalAllOneSourceOrbitIngress.left C).sourceRows
          1 center.val 2)) = true := by
  change (!((rowBit (CanonicalAllOneSourceOrbitIngress.left C).sourceRows
      (1 : Fin 3).val center.val (1 : Fin 13).val) &&
    rowBit (CanonicalAllOneSourceOrbitIngress.left C).sourceRows
      (1 : Fin 3).val center.val (2 : Fin 13).val)) = true
  rw [rowBit_sourceRows, rowBit_sourceRows]
  simp only [sourceRowMember, sourceClass_left_one,
    Bool.not_eq_true_eq_eq_false, Bool.and_eq_false_iff,
    decide_eq_false_iff_not]
  exact C.left_omits center

/-- In the hub-left orbit, the right cover family omits the physical edge
`(1,3)` at every center. -/
theorem allOne_left_right_edge_omission
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {P : CanonicalCard13Frame profile}
    {star : PhysicalGlobalCrossDeletionStar profile}
    {hall : AllPhysicalActualCriticalRowsOneHit H profile}
    {first : FirstApexShellRolePacket F R}
    {T : CanonicalAllOneSemanticRowTable P star hall first}
    (C : CanonicalAlignedCoverFamilies T 1 2 3) (center : Fin 13) :
    (!((rowBit (CanonicalAllOneSourceOrbitIngress.left C).sourceRows
          2 center.val 1) &&
        rowBit (CanonicalAllOneSourceOrbitIngress.left C).sourceRows
          2 center.val 3)) = true := by
  change (!((rowBit (CanonicalAllOneSourceOrbitIngress.left C).sourceRows
      (2 : Fin 3).val center.val (1 : Fin 13).val) &&
    rowBit (CanonicalAllOneSourceOrbitIngress.left C).sourceRows
      (2 : Fin 3).val center.val (3 : Fin 13).val)) = true
  rw [rowBit_sourceRows, rowBit_sourceRows]
  simp only [sourceRowMember, sourceClass_left_two,
    Bool.not_eq_true_eq_eq_false, Bool.and_eq_false_iff,
    decide_eq_false_iff_not]
  exact C.right_omits center

/-- In the hub-right orbit, the left cover family omits the physical edge
`(3,1)` at every center. -/
theorem allOne_right_left_edge_omission
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {P : CanonicalCard13Frame profile}
    {star : PhysicalGlobalCrossDeletionStar profile}
    {hall : AllPhysicalActualCriticalRowsOneHit H profile}
    {first : FirstApexShellRolePacket F R}
    {T : CanonicalAllOneSemanticRowTable P star hall first}
    (C : CanonicalAlignedCoverFamilies T 3 1 2) (center : Fin 13) :
    (!((rowBit (CanonicalAllOneSourceOrbitIngress.right C).sourceRows
          1 center.val 3) &&
        rowBit (CanonicalAllOneSourceOrbitIngress.right C).sourceRows
          1 center.val 1)) = true := by
  change (!((rowBit (CanonicalAllOneSourceOrbitIngress.right C).sourceRows
      (1 : Fin 3).val center.val (3 : Fin 13).val) &&
    rowBit (CanonicalAllOneSourceOrbitIngress.right C).sourceRows
      (1 : Fin 3).val center.val (1 : Fin 13).val)) = true
  rw [rowBit_sourceRows, rowBit_sourceRows]
  simp only [sourceRowMember, sourceClass_right_one,
    Bool.not_eq_true_eq_eq_false, Bool.and_eq_false_iff,
    decide_eq_false_iff_not]
  exact C.left_omits center

/-- In the hub-right orbit, the right cover family omits the physical edge
`(3,2)` at every center. -/
theorem allOne_right_right_edge_omission
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {P : CanonicalCard13Frame profile}
    {star : PhysicalGlobalCrossDeletionStar profile}
    {hall : AllPhysicalActualCriticalRowsOneHit H profile}
    {first : FirstApexShellRolePacket F R}
    {T : CanonicalAllOneSemanticRowTable P star hall first}
    (C : CanonicalAlignedCoverFamilies T 3 1 2) (center : Fin 13) :
    (!((rowBit (CanonicalAllOneSourceOrbitIngress.right C).sourceRows
          2 center.val 3) &&
        rowBit (CanonicalAllOneSourceOrbitIngress.right C).sourceRows
          2 center.val 2)) = true := by
  change (!((rowBit (CanonicalAllOneSourceOrbitIngress.right C).sourceRows
      (2 : Fin 3).val center.val (3 : Fin 13).val) &&
    rowBit (CanonicalAllOneSourceOrbitIngress.right C).sourceRows
      (2 : Fin 3).val center.val (2 : Fin 13).val)) = true
  rw [rowBit_sourceRows, rowBit_sourceRows]
  simp only [sourceRowMember, sourceClass_right_two,
    Bool.not_eq_true_eq_eq_false, Bool.and_eq_false_iff,
    decide_eq_false_iff_not]
  exact C.right_omits center

#print axioms allOne_left_left_edge_omission
#print axioms allOne_left_right_edge_omission
#print axioms allOne_right_left_edge_omission
#print axioms allOne_right_right_edge_omission

end

end ATailExactFiveCard13AllOneSourceIngressScratch
end Problem97
