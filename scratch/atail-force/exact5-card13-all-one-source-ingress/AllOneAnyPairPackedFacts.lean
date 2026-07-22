import AllOnePacketFacts

/-!
# Packed any-pair source facts

The pointwise bridge from packed row bits to the semantic any-pair bit is
proved once, avoiding repeated reduction of the complete row pack in every
generated source assertion.
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

noncomputable section

def allOneAnyPairPackedCenterBit
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
  (rowBit I.sourceRows 0 center.val left.val &&
      rowBit I.sourceRows 0 center.val right.val) ||
    (rowBit I.sourceRows 1 center.val left.val &&
      rowBit I.sourceRows 1 center.val right.val) ||
    (rowBit I.sourceRows 2 center.val left.val &&
      rowBit I.sourceRows 2 center.val right.val) ||
    (decide (center = (4 : Fin 13)) &&
      firstRowBit (sourceFirstApexRow T) left.val &&
      firstRowBit (sourceFirstApexRow T) right.val)

theorem allOneAnyPairPackedCenterBit_eq
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
    (left right center : Fin 13) :
    allOneAnyPairPackedCenterBit I left right center =
      allOneAnyPairCenterBit I left right center := by
  unfold allOneAnyPairPackedCenterBit allOneAnyPairCenterBit
  have h0l : rowBit I.sourceRows 0 center.val left.val =
      I.sourceRowMember 0 center left := by
    simpa using rowBit_sourceRows I (0 : Fin 3) center left
  have h0r : rowBit I.sourceRows 0 center.val right.val =
      I.sourceRowMember 0 center right := by
    simpa using rowBit_sourceRows I (0 : Fin 3) center right
  have h1l : rowBit I.sourceRows 1 center.val left.val =
      I.sourceRowMember 1 center left := by
    simpa using rowBit_sourceRows I (1 : Fin 3) center left
  have h1r : rowBit I.sourceRows 1 center.val right.val =
      I.sourceRowMember 1 center right := by
    simpa using rowBit_sourceRows I (1 : Fin 3) center right
  have h2l : rowBit I.sourceRows 2 center.val left.val =
      I.sourceRowMember 2 center left := by
    simpa using rowBit_sourceRows I (2 : Fin 3) center left
  have h2r : rowBit I.sourceRows 2 center.val right.val =
      I.sourceRowMember 2 center right := by
    simpa using rowBit_sourceRows I (2 : Fin 3) center right
  rw [h0l, h0r, h1l, h1r, h2l, h2r]

theorem allOne_any_pair_packed_center_count_le_two
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
      allOneAnyPairPackedCenterBit I left right center).ule 2#4 = true := by
  rw [show
    (fun center ↦ allOneAnyPairPackedCenterBit I left right center) =
        (fun center ↦ allOneAnyPairCenterBit I left right center) by
      funext center
      exact allOneAnyPairPackedCenterBit_eq I left right center]
  exact allOne_any_pair_center_count_le_two I left right hne

#print axioms allOne_any_pair_packed_center_count_le_two

end

end ATailExactFiveCard13AllOneSourceIngressScratch
end Problem97
