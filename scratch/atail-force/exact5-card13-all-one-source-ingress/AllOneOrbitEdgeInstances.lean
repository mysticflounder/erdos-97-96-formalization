/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import AllOneOrbitEdgeFacts

/-!
# Left and right orbit-specific source adapters

The six assertions are the only source terms not shared verbatim with the
verified middle-orbit core.
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

variable
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

theorem leftSource_h1947
    (C : CanonicalAlignedCoverFamilies T 1 2 3) :
    (!((rowBit (CanonicalAllOneSourceOrbitIngress.left C).sourceRows 1 8 1 &&
      rowBit (CanonicalAllOneSourceOrbitIngress.left C).sourceRows 1 8 2))) =
      true := by
  exact allOne_left_left_edge_omission C (8 : Fin 13)

theorem leftSource_h1948
    (C : CanonicalAlignedCoverFamilies T 1 2 3) :
    (!((rowBit (CanonicalAllOneSourceOrbitIngress.left C).sourceRows 2 8 1 &&
      rowBit (CanonicalAllOneSourceOrbitIngress.left C).sourceRows 2 8 3))) =
      true := by
  exact allOne_left_right_edge_omission C (8 : Fin 13)

theorem leftSource_h1949
    (C : CanonicalAlignedCoverFamilies T 1 2 3) :
    (!((rowBit (CanonicalAllOneSourceOrbitIngress.left C).sourceRows 2 9 1 &&
      rowBit (CanonicalAllOneSourceOrbitIngress.left C).sourceRows 2 9 3))) =
      true := by
  exact allOne_left_right_edge_omission C (9 : Fin 13)

theorem rightSource_h1947
    (C : CanonicalAlignedCoverFamilies T 3 1 2) :
    (!((rowBit (CanonicalAllOneSourceOrbitIngress.right C).sourceRows 1 8 3 &&
      rowBit (CanonicalAllOneSourceOrbitIngress.right C).sourceRows 1 8 1))) =
      true := by
  exact allOne_right_left_edge_omission C (8 : Fin 13)

theorem rightSource_h1948
    (C : CanonicalAlignedCoverFamilies T 3 1 2) :
    (!((rowBit (CanonicalAllOneSourceOrbitIngress.right C).sourceRows 2 8 3 &&
      rowBit (CanonicalAllOneSourceOrbitIngress.right C).sourceRows 2 8 2))) =
      true := by
  exact allOne_right_right_edge_omission C (8 : Fin 13)

theorem rightSource_h1949
    (C : CanonicalAlignedCoverFamilies T 3 1 2) :
    (!((rowBit (CanonicalAllOneSourceOrbitIngress.right C).sourceRows 2 9 3 &&
      rowBit (CanonicalAllOneSourceOrbitIngress.right C).sourceRows 2 9 2))) =
      true := by
  exact allOne_right_right_edge_omission C (9 : Fin 13)

#print axioms leftSource_h1947
#print axioms leftSource_h1948
#print axioms leftSource_h1949
#print axioms rightSource_h1947
#print axioms rightSource_h1948
#print axioms rightSource_h1949

end


end ATailExactFiveCard13AllOneSourceIngressScratch
end Problem97
