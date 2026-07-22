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

/-- Candidate middle source assertion `h1918` (frontier_second_omission). -/
theorem middleSource_h1918 :
    (!(((((sourceW T) == 0#4) && rowBit (I.sourceRows) 0 8 0) || (((sourceW T) == 1#4) && rowBit (I.sourceRows) 0 8 1) || (((sourceW T) == 2#4) && rowBit (I.sourceRows) 0 8 2) || (((sourceW T) == 3#4) && rowBit (I.sourceRows) 0 8 3) || (((sourceW T) == 4#4) && rowBit (I.sourceRows) 0 8 4) || (((sourceW T) == 5#4) && rowBit (I.sourceRows) 0 8 5) || (((sourceW T) == 6#4) && rowBit (I.sourceRows) 0 8 6) || (((sourceW T) == 7#4) && rowBit (I.sourceRows) 0 8 7) || (((sourceW T) == 8#4) && rowBit (I.sourceRows) 0 8 8) || (((sourceW T) == 9#4) && rowBit (I.sourceRows) 0 8 9) || (((sourceW T) == 10#4) && rowBit (I.sourceRows) 0 8 10) || (((sourceW T) == 11#4) && rowBit (I.sourceRows) 0 8 11) || (((sourceW T) == 12#4) && rowBit (I.sourceRows) 0 8 12)))) = true := by
  simpa only [allOneIndexLookupBit, Bool.not_eq_true_eq_eq_false] using
    allOne_frontierW_main_secondApex_lookup_false I

end

end ATailExactFiveCard13AllOneSourceIngressScratch
end Problem97
