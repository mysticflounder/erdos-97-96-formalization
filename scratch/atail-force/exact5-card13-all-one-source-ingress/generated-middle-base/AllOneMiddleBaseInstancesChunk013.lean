/-
Generated from the middle source core whose original Lean-emitted CNF and
LRAT endpoint have been kernel checked.  These source-faithful adapters prove
the individual Boolean assertions consumed by that verified endpoint.
-/
import AllOnePacketFacts

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

/-- Candidate middle source assertion `h0832` (shared_pair). -/
theorem middleSource_h0832 :
    (!((rowBit (I.sourceRows) 0 7 2 && rowBit (I.sourceRows) 0 7 6 && rowBit (I.sourceRows) 0 11 2 && rowBit (I.sourceRows) 0 11 6))) = true := by
  exact allOne_sharedPair_pointsBeforeCenters I
      (0 : Fin 3) (0 : Fin 3)
      (7 : Fin 13) (11 : Fin 13)
      (2 : Fin 13) (6 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h0833` (shared_pair). -/
theorem middleSource_h0833 :
    (!((rowBit (I.sourceRows) 0 7 6 && rowBit (I.sourceRows) 0 7 12 && rowBit (I.sourceRows) 0 11 6 && rowBit (I.sourceRows) 0 11 12))) = true := by
  exact allOne_sharedPair_pointsAroundCenters I
      (0 : Fin 3) (0 : Fin 3)
      (7 : Fin 13) (11 : Fin 13)
      (6 : Fin 13) (12 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h0834` (shared_pair). -/
theorem middleSource_h0834 :
    (!((rowBit (I.sourceRows) 0 8 2 && rowBit (I.sourceRows) 0 8 11 && rowBit (I.sourceRows) 0 10 2 && rowBit (I.sourceRows) 0 10 11))) = true := by
  exact allOne_sharedPair_pointsAroundCenters I
      (0 : Fin 3) (0 : Fin 3)
      (8 : Fin 13) (10 : Fin 13)
      (2 : Fin 13) (11 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h0835` (shared_pair). -/
theorem middleSource_h0835 :
    (!((rowBit (I.sourceRows) 0 9 0 && rowBit (I.sourceRows) 0 9 8 && rowBit (I.sourceRows) 0 11 0 && rowBit (I.sourceRows) 0 11 8))) = true := by
  exact allOne_sharedPair_pointsBeforeCenters I
      (0 : Fin 3) (0 : Fin 3)
      (9 : Fin 13) (11 : Fin 13)
      (0 : Fin 13) (8 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h0836` (shared_pair). -/
theorem middleSource_h0836 :
    (!((rowBit (I.sourceRows) 0 10 0 && rowBit (I.sourceRows) 0 10 1 && rowBit (I.sourceRows) 0 11 0 && rowBit (I.sourceRows) 0 11 1))) = true := by
  exact allOne_sharedPair_pointsBeforeCenters I
      (0 : Fin 3) (0 : Fin 3)
      (10 : Fin 13) (11 : Fin 13)
      (0 : Fin 13) (1 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h0837` (shared_pair). -/
theorem middleSource_h0837 :
    (!((rowBit (I.sourceRows) 0 10 0 && rowBit (I.sourceRows) 0 10 2 && rowBit (I.sourceRows) 0 11 0 && rowBit (I.sourceRows) 0 11 2))) = true := by
  exact allOne_sharedPair_pointsBeforeCenters I
      (0 : Fin 3) (0 : Fin 3)
      (10 : Fin 13) (11 : Fin 13)
      (0 : Fin 13) (2 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h0838` (shared_pair). -/
theorem middleSource_h0838 :
    (!((rowBit (I.sourceRows) 0 10 0 && rowBit (I.sourceRows) 0 10 3 && rowBit (I.sourceRows) 0 11 0 && rowBit (I.sourceRows) 0 11 3))) = true := by
  exact allOne_sharedPair_pointsBeforeCenters I
      (0 : Fin 3) (0 : Fin 3)
      (10 : Fin 13) (11 : Fin 13)
      (0 : Fin 13) (3 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h0839` (shared_pair). -/
theorem middleSource_h0839 :
    (!((rowBit (I.sourceRows) 0 10 0 && rowBit (I.sourceRows) 0 10 4 && rowBit (I.sourceRows) 0 11 0 && rowBit (I.sourceRows) 0 11 4))) = true := by
  exact allOne_sharedPair_pointsBeforeCenters I
      (0 : Fin 3) (0 : Fin 3)
      (10 : Fin 13) (11 : Fin 13)
      (0 : Fin 13) (4 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h0840` (shared_pair). -/
theorem middleSource_h0840 :
    (!((rowBit (I.sourceRows) 0 10 0 && rowBit (I.sourceRows) 0 10 5 && rowBit (I.sourceRows) 0 11 0 && rowBit (I.sourceRows) 0 11 5))) = true := by
  exact allOne_sharedPair_pointsBeforeCenters I
      (0 : Fin 3) (0 : Fin 3)
      (10 : Fin 13) (11 : Fin 13)
      (0 : Fin 13) (5 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h0841` (shared_pair). -/
theorem middleSource_h0841 :
    (!((rowBit (I.sourceRows) 0 10 0 && rowBit (I.sourceRows) 0 10 6 && rowBit (I.sourceRows) 0 11 0 && rowBit (I.sourceRows) 0 11 6))) = true := by
  exact allOne_sharedPair_pointsBeforeCenters I
      (0 : Fin 3) (0 : Fin 3)
      (10 : Fin 13) (11 : Fin 13)
      (0 : Fin 13) (6 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h0842` (shared_pair). -/
theorem middleSource_h0842 :
    (!((rowBit (I.sourceRows) 0 10 0 && rowBit (I.sourceRows) 0 10 7 && rowBit (I.sourceRows) 0 11 0 && rowBit (I.sourceRows) 0 11 7))) = true := by
  exact allOne_sharedPair_pointsBeforeCenters I
      (0 : Fin 3) (0 : Fin 3)
      (10 : Fin 13) (11 : Fin 13)
      (0 : Fin 13) (7 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h0843` (shared_pair). -/
theorem middleSource_h0843 :
    (!((rowBit (I.sourceRows) 0 10 0 && rowBit (I.sourceRows) 0 10 8 && rowBit (I.sourceRows) 0 11 0 && rowBit (I.sourceRows) 0 11 8))) = true := by
  exact allOne_sharedPair_pointsBeforeCenters I
      (0 : Fin 3) (0 : Fin 3)
      (10 : Fin 13) (11 : Fin 13)
      (0 : Fin 13) (8 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h0844` (shared_pair). -/
theorem middleSource_h0844 :
    (!((rowBit (I.sourceRows) 0 10 0 && rowBit (I.sourceRows) 0 10 9 && rowBit (I.sourceRows) 0 11 0 && rowBit (I.sourceRows) 0 11 9))) = true := by
  exact allOne_sharedPair_pointsBeforeCenters I
      (0 : Fin 3) (0 : Fin 3)
      (10 : Fin 13) (11 : Fin 13)
      (0 : Fin 13) (9 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h0845` (shared_pair). -/
theorem middleSource_h0845 :
    (!((rowBit (I.sourceRows) 0 10 0 && rowBit (I.sourceRows) 0 10 12 && rowBit (I.sourceRows) 0 11 0 && rowBit (I.sourceRows) 0 11 12))) = true := by
  exact allOne_sharedPair_pointsAroundCenters I
      (0 : Fin 3) (0 : Fin 3)
      (10 : Fin 13) (11 : Fin 13)
      (0 : Fin 13) (12 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h0846` (shared_pair). -/
theorem middleSource_h0846 :
    (!((rowBit (I.sourceRows) 0 10 1 && rowBit (I.sourceRows) 0 10 6 && rowBit (I.sourceRows) 0 11 1 && rowBit (I.sourceRows) 0 11 6))) = true := by
  exact allOne_sharedPair_pointsBeforeCenters I
      (0 : Fin 3) (0 : Fin 3)
      (10 : Fin 13) (11 : Fin 13)
      (1 : Fin 13) (6 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h0847` (shared_pair). -/
theorem middleSource_h0847 :
    (!((rowBit (I.sourceRows) 0 10 1 && rowBit (I.sourceRows) 0 10 8 && rowBit (I.sourceRows) 0 11 1 && rowBit (I.sourceRows) 0 11 8))) = true := by
  exact allOne_sharedPair_pointsBeforeCenters I
      (0 : Fin 3) (0 : Fin 3)
      (10 : Fin 13) (11 : Fin 13)
      (1 : Fin 13) (8 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h0848` (shared_pair). -/
theorem middleSource_h0848 :
    (!((rowBit (I.sourceRows) 0 10 1 && rowBit (I.sourceRows) 0 10 9 && rowBit (I.sourceRows) 0 11 1 && rowBit (I.sourceRows) 0 11 9))) = true := by
  exact allOne_sharedPair_pointsBeforeCenters I
      (0 : Fin 3) (0 : Fin 3)
      (10 : Fin 13) (11 : Fin 13)
      (1 : Fin 13) (9 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h0849` (shared_pair). -/
theorem middleSource_h0849 :
    (!((rowBit (I.sourceRows) 0 10 1 && rowBit (I.sourceRows) 0 10 12 && rowBit (I.sourceRows) 0 11 1 && rowBit (I.sourceRows) 0 11 12))) = true := by
  exact allOne_sharedPair_pointsAroundCenters I
      (0 : Fin 3) (0 : Fin 3)
      (10 : Fin 13) (11 : Fin 13)
      (1 : Fin 13) (12 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h0850` (shared_pair). -/
theorem middleSource_h0850 :
    (!((rowBit (I.sourceRows) 0 10 2 && rowBit (I.sourceRows) 0 10 4 && rowBit (I.sourceRows) 0 11 2 && rowBit (I.sourceRows) 0 11 4))) = true := by
  exact allOne_sharedPair_pointsBeforeCenters I
      (0 : Fin 3) (0 : Fin 3)
      (10 : Fin 13) (11 : Fin 13)
      (2 : Fin 13) (4 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h0851` (shared_pair). -/
theorem middleSource_h0851 :
    (!((rowBit (I.sourceRows) 0 10 2 && rowBit (I.sourceRows) 0 10 6 && rowBit (I.sourceRows) 0 11 2 && rowBit (I.sourceRows) 0 11 6))) = true := by
  exact allOne_sharedPair_pointsBeforeCenters I
      (0 : Fin 3) (0 : Fin 3)
      (10 : Fin 13) (11 : Fin 13)
      (2 : Fin 13) (6 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h0852` (shared_pair). -/
theorem middleSource_h0852 :
    (!((rowBit (I.sourceRows) 0 10 2 && rowBit (I.sourceRows) 0 10 8 && rowBit (I.sourceRows) 0 11 2 && rowBit (I.sourceRows) 0 11 8))) = true := by
  exact allOne_sharedPair_pointsBeforeCenters I
      (0 : Fin 3) (0 : Fin 3)
      (10 : Fin 13) (11 : Fin 13)
      (2 : Fin 13) (8 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h0853` (shared_pair). -/
theorem middleSource_h0853 :
    (!((rowBit (I.sourceRows) 0 10 2 && rowBit (I.sourceRows) 0 10 9 && rowBit (I.sourceRows) 0 11 2 && rowBit (I.sourceRows) 0 11 9))) = true := by
  exact allOne_sharedPair_pointsBeforeCenters I
      (0 : Fin 3) (0 : Fin 3)
      (10 : Fin 13) (11 : Fin 13)
      (2 : Fin 13) (9 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h0854` (shared_pair). -/
theorem middleSource_h0854 :
    (!((rowBit (I.sourceRows) 0 10 2 && rowBit (I.sourceRows) 0 10 12 && rowBit (I.sourceRows) 0 11 2 && rowBit (I.sourceRows) 0 11 12))) = true := by
  exact allOne_sharedPair_pointsAroundCenters I
      (0 : Fin 3) (0 : Fin 3)
      (10 : Fin 13) (11 : Fin 13)
      (2 : Fin 13) (12 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h0855` (shared_pair). -/
theorem middleSource_h0855 :
    (!((rowBit (I.sourceRows) 0 10 3 && rowBit (I.sourceRows) 0 10 6 && rowBit (I.sourceRows) 0 11 3 && rowBit (I.sourceRows) 0 11 6))) = true := by
  exact allOne_sharedPair_pointsBeforeCenters I
      (0 : Fin 3) (0 : Fin 3)
      (10 : Fin 13) (11 : Fin 13)
      (3 : Fin 13) (6 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h0856` (shared_pair). -/
theorem middleSource_h0856 :
    (!((rowBit (I.sourceRows) 0 10 3 && rowBit (I.sourceRows) 0 10 7 && rowBit (I.sourceRows) 0 11 3 && rowBit (I.sourceRows) 0 11 7))) = true := by
  exact allOne_sharedPair_pointsBeforeCenters I
      (0 : Fin 3) (0 : Fin 3)
      (10 : Fin 13) (11 : Fin 13)
      (3 : Fin 13) (7 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h0857` (shared_pair). -/
theorem middleSource_h0857 :
    (!((rowBit (I.sourceRows) 0 10 3 && rowBit (I.sourceRows) 0 10 8 && rowBit (I.sourceRows) 0 11 3 && rowBit (I.sourceRows) 0 11 8))) = true := by
  exact allOne_sharedPair_pointsBeforeCenters I
      (0 : Fin 3) (0 : Fin 3)
      (10 : Fin 13) (11 : Fin 13)
      (3 : Fin 13) (8 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h0858` (shared_pair). -/
theorem middleSource_h0858 :
    (!((rowBit (I.sourceRows) 0 10 3 && rowBit (I.sourceRows) 0 10 9 && rowBit (I.sourceRows) 0 11 3 && rowBit (I.sourceRows) 0 11 9))) = true := by
  exact allOne_sharedPair_pointsBeforeCenters I
      (0 : Fin 3) (0 : Fin 3)
      (10 : Fin 13) (11 : Fin 13)
      (3 : Fin 13) (9 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h0859` (shared_pair). -/
theorem middleSource_h0859 :
    (!((rowBit (I.sourceRows) 0 10 3 && rowBit (I.sourceRows) 0 10 12 && rowBit (I.sourceRows) 0 11 3 && rowBit (I.sourceRows) 0 11 12))) = true := by
  exact allOne_sharedPair_pointsAroundCenters I
      (0 : Fin 3) (0 : Fin 3)
      (10 : Fin 13) (11 : Fin 13)
      (3 : Fin 13) (12 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h0860` (shared_pair). -/
theorem middleSource_h0860 :
    (!((rowBit (I.sourceRows) 0 10 4 && rowBit (I.sourceRows) 0 10 7 && rowBit (I.sourceRows) 0 11 4 && rowBit (I.sourceRows) 0 11 7))) = true := by
  exact allOne_sharedPair_pointsBeforeCenters I
      (0 : Fin 3) (0 : Fin 3)
      (10 : Fin 13) (11 : Fin 13)
      (4 : Fin 13) (7 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h0861` (shared_pair). -/
theorem middleSource_h0861 :
    (!((rowBit (I.sourceRows) 0 10 4 && rowBit (I.sourceRows) 0 10 8 && rowBit (I.sourceRows) 0 11 4 && rowBit (I.sourceRows) 0 11 8))) = true := by
  exact allOne_sharedPair_pointsBeforeCenters I
      (0 : Fin 3) (0 : Fin 3)
      (10 : Fin 13) (11 : Fin 13)
      (4 : Fin 13) (8 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h0862` (shared_pair). -/
theorem middleSource_h0862 :
    (!((rowBit (I.sourceRows) 0 10 4 && rowBit (I.sourceRows) 0 10 9 && rowBit (I.sourceRows) 0 11 4 && rowBit (I.sourceRows) 0 11 9))) = true := by
  exact allOne_sharedPair_pointsBeforeCenters I
      (0 : Fin 3) (0 : Fin 3)
      (10 : Fin 13) (11 : Fin 13)
      (4 : Fin 13) (9 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h0863` (shared_pair). -/
theorem middleSource_h0863 :
    (!((rowBit (I.sourceRows) 0 10 4 && rowBit (I.sourceRows) 0 10 12 && rowBit (I.sourceRows) 0 11 4 && rowBit (I.sourceRows) 0 11 12))) = true := by
  exact allOne_sharedPair_pointsAroundCenters I
      (0 : Fin 3) (0 : Fin 3)
      (10 : Fin 13) (11 : Fin 13)
      (4 : Fin 13) (12 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h0864` (shared_pair). -/
theorem middleSource_h0864 :
    (!((rowBit (I.sourceRows) 0 10 5 && rowBit (I.sourceRows) 0 10 7 && rowBit (I.sourceRows) 0 11 5 && rowBit (I.sourceRows) 0 11 7))) = true := by
  exact allOne_sharedPair_pointsBeforeCenters I
      (0 : Fin 3) (0 : Fin 3)
      (10 : Fin 13) (11 : Fin 13)
      (5 : Fin 13) (7 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h0865` (shared_pair). -/
theorem middleSource_h0865 :
    (!((rowBit (I.sourceRows) 0 10 5 && rowBit (I.sourceRows) 0 10 8 && rowBit (I.sourceRows) 0 11 5 && rowBit (I.sourceRows) 0 11 8))) = true := by
  exact allOne_sharedPair_pointsBeforeCenters I
      (0 : Fin 3) (0 : Fin 3)
      (10 : Fin 13) (11 : Fin 13)
      (5 : Fin 13) (8 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h0866` (shared_pair). -/
theorem middleSource_h0866 :
    (!((rowBit (I.sourceRows) 0 10 5 && rowBit (I.sourceRows) 0 10 9 && rowBit (I.sourceRows) 0 11 5 && rowBit (I.sourceRows) 0 11 9))) = true := by
  exact allOne_sharedPair_pointsBeforeCenters I
      (0 : Fin 3) (0 : Fin 3)
      (10 : Fin 13) (11 : Fin 13)
      (5 : Fin 13) (9 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h0867` (shared_pair). -/
theorem middleSource_h0867 :
    (!((rowBit (I.sourceRows) 0 10 5 && rowBit (I.sourceRows) 0 10 12 && rowBit (I.sourceRows) 0 11 5 && rowBit (I.sourceRows) 0 11 12))) = true := by
  exact allOne_sharedPair_pointsAroundCenters I
      (0 : Fin 3) (0 : Fin 3)
      (10 : Fin 13) (11 : Fin 13)
      (5 : Fin 13) (12 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h0868` (shared_pair). -/
theorem middleSource_h0868 :
    (!((rowBit (I.sourceRows) 0 10 6 && rowBit (I.sourceRows) 0 10 8 && rowBit (I.sourceRows) 0 11 6 && rowBit (I.sourceRows) 0 11 8))) = true := by
  exact allOne_sharedPair_pointsBeforeCenters I
      (0 : Fin 3) (0 : Fin 3)
      (10 : Fin 13) (11 : Fin 13)
      (6 : Fin 13) (8 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h0869` (shared_pair). -/
theorem middleSource_h0869 :
    (!((rowBit (I.sourceRows) 0 10 6 && rowBit (I.sourceRows) 0 10 9 && rowBit (I.sourceRows) 0 11 6 && rowBit (I.sourceRows) 0 11 9))) = true := by
  exact allOne_sharedPair_pointsBeforeCenters I
      (0 : Fin 3) (0 : Fin 3)
      (10 : Fin 13) (11 : Fin 13)
      (6 : Fin 13) (9 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h0870` (shared_pair). -/
theorem middleSource_h0870 :
    (!((rowBit (I.sourceRows) 0 10 6 && rowBit (I.sourceRows) 0 10 12 && rowBit (I.sourceRows) 0 11 6 && rowBit (I.sourceRows) 0 11 12))) = true := by
  exact allOne_sharedPair_pointsAroundCenters I
      (0 : Fin 3) (0 : Fin 3)
      (10 : Fin 13) (11 : Fin 13)
      (6 : Fin 13) (12 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h0871` (shared_pair). -/
theorem middleSource_h0871 :
    (!((rowBit (I.sourceRows) 0 10 7 && rowBit (I.sourceRows) 0 10 8 && rowBit (I.sourceRows) 0 11 7 && rowBit (I.sourceRows) 0 11 8))) = true := by
  exact allOne_sharedPair_pointsBeforeCenters I
      (0 : Fin 3) (0 : Fin 3)
      (10 : Fin 13) (11 : Fin 13)
      (7 : Fin 13) (8 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h0872` (shared_pair). -/
theorem middleSource_h0872 :
    (!((rowBit (I.sourceRows) 0 10 7 && rowBit (I.sourceRows) 0 10 9 && rowBit (I.sourceRows) 0 11 7 && rowBit (I.sourceRows) 0 11 9))) = true := by
  exact allOne_sharedPair_pointsBeforeCenters I
      (0 : Fin 3) (0 : Fin 3)
      (10 : Fin 13) (11 : Fin 13)
      (7 : Fin 13) (9 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h0873` (shared_pair). -/
theorem middleSource_h0873 :
    (!((rowBit (I.sourceRows) 0 10 7 && rowBit (I.sourceRows) 0 10 12 && rowBit (I.sourceRows) 0 11 7 && rowBit (I.sourceRows) 0 11 12))) = true := by
  exact allOne_sharedPair_pointsAroundCenters I
      (0 : Fin 3) (0 : Fin 3)
      (10 : Fin 13) (11 : Fin 13)
      (7 : Fin 13) (12 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h0874` (shared_pair). -/
theorem middleSource_h0874 :
    (!((rowBit (I.sourceRows) 0 10 8 && rowBit (I.sourceRows) 0 10 9 && rowBit (I.sourceRows) 0 11 8 && rowBit (I.sourceRows) 0 11 9))) = true := by
  exact allOne_sharedPair_pointsBeforeCenters I
      (0 : Fin 3) (0 : Fin 3)
      (10 : Fin 13) (11 : Fin 13)
      (8 : Fin 13) (9 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h0875` (shared_pair). -/
theorem middleSource_h0875 :
    (!((rowBit (I.sourceRows) 0 10 8 && rowBit (I.sourceRows) 0 10 12 && rowBit (I.sourceRows) 0 11 8 && rowBit (I.sourceRows) 0 11 12))) = true := by
  exact allOne_sharedPair_pointsAroundCenters I
      (0 : Fin 3) (0 : Fin 3)
      (10 : Fin 13) (11 : Fin 13)
      (8 : Fin 13) (12 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h0876` (shared_pair). -/
theorem middleSource_h0876 :
    (!((rowBit (I.sourceRows) 0 10 9 && rowBit (I.sourceRows) 0 10 12 && rowBit (I.sourceRows) 0 11 9 && rowBit (I.sourceRows) 0 11 12))) = true := by
  exact allOne_sharedPair_pointsAroundCenters I
      (0 : Fin 3) (0 : Fin 3)
      (10 : Fin 13) (11 : Fin 13)
      (9 : Fin 13) (12 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h0877` (shared_pair). -/
theorem middleSource_h0877 :
    (!((rowBit (I.sourceRows) 0 10 1 && rowBit (I.sourceRows) 0 10 4 && rowBit (I.sourceRows) 0 12 1 && rowBit (I.sourceRows) 0 12 4))) = true := by
  exact allOne_sharedPair_pointsBeforeCenters I
      (0 : Fin 3) (0 : Fin 3)
      (10 : Fin 13) (12 : Fin 13)
      (1 : Fin 13) (4 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h0878` (shared_pair). -/
theorem middleSource_h0878 :
    (!((rowBit (I.sourceRows) 0 10 2 && rowBit (I.sourceRows) 0 10 9 && rowBit (I.sourceRows) 0 12 2 && rowBit (I.sourceRows) 0 12 9))) = true := by
  exact allOne_sharedPair_pointsBeforeCenters I
      (0 : Fin 3) (0 : Fin 3)
      (10 : Fin 13) (12 : Fin 13)
      (2 : Fin 13) (9 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h0879` (shared_pair). -/
theorem middleSource_h0879 :
    (!((rowBit (I.sourceRows) 0 10 6 && rowBit (I.sourceRows) 0 10 8 && rowBit (I.sourceRows) 0 12 6 && rowBit (I.sourceRows) 0 12 8))) = true := by
  exact allOne_sharedPair_pointsBeforeCenters I
      (0 : Fin 3) (0 : Fin 3)
      (10 : Fin 13) (12 : Fin 13)
      (6 : Fin 13) (8 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h0880` (shared_pair). -/
theorem middleSource_h0880 :
    (!((rowBit (I.sourceRows) 0 11 1 && rowBit (I.sourceRows) 0 11 4 && rowBit (I.sourceRows) 0 12 1 && rowBit (I.sourceRows) 0 12 4))) = true := by
  exact allOne_sharedPair_pointsBeforeCenters I
      (0 : Fin 3) (0 : Fin 3)
      (11 : Fin 13) (12 : Fin 13)
      (1 : Fin 13) (4 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h0881` (shared_pair). -/
theorem middleSource_h0881 :
    (!((rowBit (I.sourceRows) 0 11 1 && rowBit (I.sourceRows) 0 11 10 && rowBit (I.sourceRows) 0 12 1 && rowBit (I.sourceRows) 0 12 10))) = true := by
  exact allOne_sharedPair_pointsBeforeCenters I
      (0 : Fin 3) (0 : Fin 3)
      (11 : Fin 13) (12 : Fin 13)
      (1 : Fin 13) (10 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h0882` (shared_pair). -/
theorem middleSource_h0882 :
    (!((rowBit (I.sourceRows) 0 11 2 && rowBit (I.sourceRows) 0 11 8 && rowBit (I.sourceRows) 0 12 2 && rowBit (I.sourceRows) 0 12 8))) = true := by
  exact allOne_sharedPair_pointsBeforeCenters I
      (0 : Fin 3) (0 : Fin 3)
      (11 : Fin 13) (12 : Fin 13)
      (2 : Fin 13) (8 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h0883` (shared_pair). -/
theorem middleSource_h0883 :
    (!((rowBit (I.sourceRows) 0 11 2 && rowBit (I.sourceRows) 0 11 9 && rowBit (I.sourceRows) 0 12 2 && rowBit (I.sourceRows) 0 12 9))) = true := by
  exact allOne_sharedPair_pointsBeforeCenters I
      (0 : Fin 3) (0 : Fin 3)
      (11 : Fin 13) (12 : Fin 13)
      (2 : Fin 13) (9 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h0884` (shared_pair). -/
theorem middleSource_h0884 :
    (!((rowBit (I.sourceRows) 0 11 4 && rowBit (I.sourceRows) 0 11 10 && rowBit (I.sourceRows) 0 12 4 && rowBit (I.sourceRows) 0 12 10))) = true := by
  exact allOne_sharedPair_pointsBeforeCenters I
      (0 : Fin 3) (0 : Fin 3)
      (11 : Fin 13) (12 : Fin 13)
      (4 : Fin 13) (10 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h0885` (shared_pair). -/
theorem middleSource_h0885 :
    (!((rowBit (I.sourceRows) 0 11 6 && rowBit (I.sourceRows) 0 11 8 && rowBit (I.sourceRows) 0 12 6 && rowBit (I.sourceRows) 0 12 8))) = true := by
  exact allOne_sharedPair_pointsBeforeCenters I
      (0 : Fin 3) (0 : Fin 3)
      (11 : Fin 13) (12 : Fin 13)
      (6 : Fin 13) (8 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h0886` (row_middleBlock_le2). -/
theorem middleSource_h0886 :
    ((((bif rowBit (I.sourceRows) 0 5 4 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 0 5 5 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 0 5 6 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 0 5 7 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 0 5 8 then 1#4 else 0#4))).ule 2#4) = true := by
  simpa only [allOneMiddleBlockBitCount] using
    allOne_row_middleBlock_count_le_two I
      (0 : Fin 3) (5 : Fin 13) (by decide)

/-- Candidate middle source assertion `h0887` (row_middleBlock_le2). -/
theorem middleSource_h0887 :
    ((((bif rowBit (I.sourceRows) 0 6 4 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 0 6 5 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 0 6 6 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 0 6 7 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 0 6 8 then 1#4 else 0#4))).ule 2#4) = true := by
  simpa only [allOneMiddleBlockBitCount] using
    allOne_row_middleBlock_count_le_two I
      (0 : Fin 3) (6 : Fin 13) (by decide)

/-- Candidate middle source assertion `h0888` (row_middleBlock_le2). -/
theorem middleSource_h0888 :
    ((((bif rowBit (I.sourceRows) 0 7 4 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 0 7 5 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 0 7 6 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 0 7 7 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 0 7 8 then 1#4 else 0#4))).ule 2#4) = true := by
  simpa only [allOneMiddleBlockBitCount] using
    allOne_row_middleBlock_count_le_two I
      (0 : Fin 3) (7 : Fin 13) (by decide)

/-- Candidate middle source assertion `h0889` (row_middleBlock_le1). -/
theorem middleSource_h0889 :
    ((((bif rowBit (I.sourceRows) 0 4 4 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 0 4 5 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 0 4 6 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 0 4 7 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 0 4 8 then 1#4 else 0#4))).ule 1#4) = true := by
  simpa only [allOneMiddleBlockBitCount] using
    allOne_row_middleBlock_count_le_one I
      (0 : Fin 3) (4 : Fin 13) (by decide)

/-- Candidate middle source assertion `h0890` (shared_pair). -/
theorem middleSource_h0890 :
    (!((rowBit (I.sourceRows) 0 4 0 && rowBit (I.sourceRows) 0 4 10 && rowBit (I.sourceRows) 0 5 0 && rowBit (I.sourceRows) 0 5 10))) = true := by
  exact allOne_sharedPair_pointsAroundCenters I
      (0 : Fin 3) (0 : Fin 3)
      (4 : Fin 13) (5 : Fin 13)
      (0 : Fin 13) (10 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h0891` (shared_pair). -/
theorem middleSource_h0891 :
    (!((rowBit (I.sourceRows) 0 4 0 && rowBit (I.sourceRows) 0 4 12 && rowBit (I.sourceRows) 0 5 0 && rowBit (I.sourceRows) 0 5 12))) = true := by
  exact allOne_sharedPair_pointsAroundCenters I
      (0 : Fin 3) (0 : Fin 3)
      (4 : Fin 13) (5 : Fin 13)
      (0 : Fin 13) (12 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h0892` (shared_pair). -/
theorem middleSource_h0892 :
    (!((rowBit (I.sourceRows) 0 4 1 && rowBit (I.sourceRows) 0 4 11 && rowBit (I.sourceRows) 0 5 1 && rowBit (I.sourceRows) 0 5 11))) = true := by
  exact allOne_sharedPair_pointsAroundCenters I
      (0 : Fin 3) (0 : Fin 3)
      (4 : Fin 13) (5 : Fin 13)
      (1 : Fin 13) (11 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h0893` (shared_pair). -/
theorem middleSource_h0893 :
    (!((rowBit (I.sourceRows) 0 4 2 && rowBit (I.sourceRows) 0 4 9 && rowBit (I.sourceRows) 0 5 2 && rowBit (I.sourceRows) 0 5 9))) = true := by
  exact allOne_sharedPair_pointsAroundCenters I
      (0 : Fin 3) (0 : Fin 3)
      (4 : Fin 13) (5 : Fin 13)
      (2 : Fin 13) (9 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h0894` (shared_pair). -/
theorem middleSource_h0894 :
    (!((rowBit (I.sourceRows) 0 4 2 && rowBit (I.sourceRows) 0 4 12 && rowBit (I.sourceRows) 0 5 2 && rowBit (I.sourceRows) 0 5 12))) = true := by
  exact allOne_sharedPair_pointsAroundCenters I
      (0 : Fin 3) (0 : Fin 3)
      (4 : Fin 13) (5 : Fin 13)
      (2 : Fin 13) (12 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h0895` (shared_pair). -/
theorem middleSource_h0895 :
    (!((rowBit (I.sourceRows) 0 4 3 && rowBit (I.sourceRows) 0 4 9 && rowBit (I.sourceRows) 0 5 3 && rowBit (I.sourceRows) 0 5 9))) = true := by
  exact allOne_sharedPair_pointsAroundCenters I
      (0 : Fin 3) (0 : Fin 3)
      (4 : Fin 13) (5 : Fin 13)
      (3 : Fin 13) (9 : Fin 13)
      (by decide) (by decide) (by decide)

end

end ATailExactFiveCard13AllOneSourceIngressScratch
end Problem97
