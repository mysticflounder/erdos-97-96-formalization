/-
Generated from a pinned complete source-core cover.  Each theorem is a
source-faithful semantic adapter for one literal assertion in the rebuilt
direct or mirror source stream.
-/
import BaseRetainedGeometryFacts

/-!
# Generated distinct-radius base/retained source adapters

Manifest-selected specializations of source-faithful semantic schemas.
-/

namespace Problem97
namespace ATailExactFiveCard13DistinctBaseRetainedIngressScratch

open ATailBiApexRobustCapBounds
open ATailCriticalPairFrontier
open ATailExactFiveCard13CnfIngressScratch
open ATailExactFiveCard13CommonLabelTransportScratch
open ATailExactFiveCard13DistinctRadiusSourceIngressCoordinatorScratch
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

set_option maxHeartbeats 0
set_option maxRecDepth 1000000
set_option linter.unusedVariables false

noncomputable section

/-- Manifest-selected source assertion `h37390`. -/
theorem directSource_h37390
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
    (T : CanonicalAsymmetricSemanticRowTable P star first)
    (C : CanonicalCoverFamilies T)
    (hroles :
      P.sourceIndex = (1 : Fin 13) ∧
        P.blockerIndex = (2 : Fin 13) ∧
        P.thirdIndex = (3 : Fin 13))
    (_hcard : D.A.card = 13) (_hdistinct : first.doubleRadius ≠ radius) :
    ((2#4).ule ((bif firstRowBit (directSourceFirstRow T) 9 then 1#4 else 0#4) + (bif firstRowBit (directSourceFirstRow T) 10 then 1#4 else 0#4) + (bif firstRowBit (directSourceFirstRow T) 11 then 1#4 else 0#4) + (bif firstRowBit (directSourceFirstRow T) 12 then 1#4 else 0#4))) = true := by
  have h9 : parentRowBit (directSourceParentFirst P) 9 =
      firstRowBit (directSourceFirstRow T) 9 := by
    simpa using directSource_parentFirst_eq_firstRow T _hcard _hdistinct (9 : Fin 13)
  have h10 : parentRowBit (directSourceParentFirst P) 10 =
      firstRowBit (directSourceFirstRow T) 10 := by
    simpa using directSource_parentFirst_eq_firstRow T _hcard _hdistinct (10 : Fin 13)
  have h11 : parentRowBit (directSourceParentFirst P) 11 =
      firstRowBit (directSourceFirstRow T) 11 := by
    simpa using directSource_parentFirst_eq_firstRow T _hcard _hdistinct (11 : Fin 13)
  have h12 : parentRowBit (directSourceParentFirst P) 12 =
      firstRowBit (directSourceFirstRow T) 12 := by
    simpa using directSource_parentFirst_eq_firstRow T _hcard _hdistinct (12 : Fin 13)
  rw [← h9, ← h10, ← h11, ← h12]
  exact directSource_parentFirst_firstStrict_card_ge_two T _hcard _hdistinct

end

end ATailExactFiveCard13DistinctBaseRetainedIngressScratch
end Problem97
