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

/-- Candidate middle source assertion `h1880` (shell_card). -/
theorem middleSource_h1880 :
    ((((bif shellBit (sourceShell T) 0 then 1#4 else 0#4) + (bif shellBit (sourceShell T) 1 then 1#4 else 0#4) + (bif shellBit (sourceShell T) 2 then 1#4 else 0#4) + (bif shellBit (sourceShell T) 3 then 1#4 else 0#4) + (bif shellBit (sourceShell T) 4 then 1#4 else 0#4) + (bif shellBit (sourceShell T) 5 then 1#4 else 0#4) + (bif shellBit (sourceShell T) 6 then 1#4 else 0#4) + (bif shellBit (sourceShell T) 7 then 1#4 else 0#4) + (bif shellBit (sourceShell T) 8 then 1#4 else 0#4) + (bif shellBit (sourceShell T) 9 then 1#4 else 0#4) + (bif shellBit (sourceShell T) 10 then 1#4 else 0#4) + (bif shellBit (sourceShell T) 11 then 1#4 else 0#4) + (bif shellBit (sourceShell T) 12 then 1#4 else 0#4)) == 5#4)) = true := by
  simpa only [allOneBitCount13] using
    allOne_shell_card_eq_five T

end

end ATailExactFiveCard13AllOneSourceIngressScratch
end Problem97
