/-
Generated from the middle source core whose original Lean-emitted CNF and
LRAT endpoint have been kernel checked.  These source-faithful adapters prove
the individual Boolean assertions consumed by that verified endpoint.
-/
import AllOneAnyPairPackedFacts

/-!
# Candidate middle-orbit base geometry instances

Generated specializations of source-faithful finite row geometry schemas.
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

set_option maxHeartbeats 0
set_option maxRecDepth 1000000

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
    (I : CanonicalAllOneSourceOrbitIngress T)

/-- Candidate middle source assertion `h1815` (first_shared_pair). -/
theorem middleSource_h1815 :
    (!((firstRowBit (sourceFirstApexRow T) 0 && firstRowBit (sourceFirstApexRow T) 11 && rowBit (I.sourceRows) 2 9 0 && rowBit (I.sourceRows) 2 9 11))) = true := by
  apply allOne_firstRow_sharedPair_false_of_strict I
    (2 : Fin 3) (9 : Fin 13)
    (0 : Fin 13) (11 : Fin 13)
  have hk := P.strictKalmanson
    (a := (0 : Fin 13)) (b := (4 : Fin 13))
    (c := (9 : Fin 13)) (d := (11 : Fin 13))
    (by decide) (by decide) (by decide)
  exact Or.inr (by simpa only [dist_comm, add_comm] using hk.2)

end

end ATailExactFiveCard13AllOneSourceIngressScratch
end Problem97
