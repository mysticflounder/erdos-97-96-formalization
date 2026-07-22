/-
Generated from the middle source core whose original Lean-emitted CNF and
LRAT endpoint have been kernel checked.  These source-faithful adapters prove
the individual ordinal-rank assertions consumed by that verified endpoint.
-/
import AllOneRankFacts

/-!
# Candidate middle-orbit rank instances

Generated specializations of the source-faithful rank assertion schemas.
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

/-- Candidate middle source assertion `h3584` (kalmanson). -/
theorem middleSource_h3584 :
    ((!((allOneRankAtom (sourceRanks P) 5 == allOneRankAtom (sourceRanks P) 8)) || ((allOneRankAtom (sourceRanks P) 35).ult (allOneRankAtom (sourceRanks P) 38)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (38 : Fin 78) (5 : Fin 78)
    (35 : Fin 78) (8 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (6 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (35 : Fin 78) (8 : Fin 78) (5 : Fin 78)
    (38 : Fin 78) (2 : Fin 78) (59 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3585` (kalmanson). -/
theorem middleSource_h3585 :
    ((!((allOneRankAtom (sourceRanks P) 5 == allOneRankAtom (sourceRanks P) 35)) || ((allOneRankAtom (sourceRanks P) 8).ult (allOneRankAtom (sourceRanks P) 38)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (38 : Fin 78) (5 : Fin 78)
    (8 : Fin 78) (35 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (6 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (35 : Fin 78) (8 : Fin 78) (5 : Fin 78)
    (38 : Fin 78) (2 : Fin 78) (59 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3586` (kalmanson). -/
theorem middleSource_h3586 :
    ((!((allOneRankAtom (sourceRanks P) 38 == allOneRankAtom (sourceRanks P) 8)) || ((allOneRankAtom (sourceRanks P) 35).ult (allOneRankAtom (sourceRanks P) 5)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (5 : Fin 78) (38 : Fin 78)
    (35 : Fin 78) (8 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (6 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (35 : Fin 78) (8 : Fin 78) (5 : Fin 78)
    (38 : Fin 78) (2 : Fin 78) (59 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3587` (kalmanson). -/
theorem middleSource_h3587 :
    ((!((allOneRankAtom (sourceRanks P) 38 == allOneRankAtom (sourceRanks P) 35)) || ((allOneRankAtom (sourceRanks P) 8).ult (allOneRankAtom (sourceRanks P) 5)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (5 : Fin 78) (38 : Fin 78)
    (8 : Fin 78) (35 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (6 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (35 : Fin 78) (8 : Fin 78) (5 : Fin 78)
    (38 : Fin 78) (2 : Fin 78) (59 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3588` (kalmanson). -/
theorem middleSource_h3588 :
    ((!((allOneRankAtom (sourceRanks P) 5 == allOneRankAtom (sourceRanks P) 2)) || ((allOneRankAtom (sourceRanks P) 60).ult (allOneRankAtom (sourceRanks P) 39)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (39 : Fin 78) (5 : Fin 78)
    (60 : Fin 78) (2 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (6 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (35 : Fin 78) (9 : Fin 78) (5 : Fin 78)
    (39 : Fin 78) (2 : Fin 78) (60 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3589` (kalmanson). -/
theorem middleSource_h3589 :
    ((!((allOneRankAtom (sourceRanks P) 5 == allOneRankAtom (sourceRanks P) 60)) || ((allOneRankAtom (sourceRanks P) 2).ult (allOneRankAtom (sourceRanks P) 39)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (39 : Fin 78) (5 : Fin 78)
    (2 : Fin 78) (60 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (6 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (35 : Fin 78) (9 : Fin 78) (5 : Fin 78)
    (39 : Fin 78) (2 : Fin 78) (60 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3590` (kalmanson). -/
theorem middleSource_h3590 :
    ((!((allOneRankAtom (sourceRanks P) 39 == allOneRankAtom (sourceRanks P) 2)) || ((allOneRankAtom (sourceRanks P) 60).ult (allOneRankAtom (sourceRanks P) 5)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (5 : Fin 78) (39 : Fin 78)
    (60 : Fin 78) (2 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (6 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (35 : Fin 78) (9 : Fin 78) (5 : Fin 78)
    (39 : Fin 78) (2 : Fin 78) (60 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3591` (kalmanson). -/
theorem middleSource_h3591 :
    ((!((allOneRankAtom (sourceRanks P) 39 == allOneRankAtom (sourceRanks P) 60)) || ((allOneRankAtom (sourceRanks P) 2).ult (allOneRankAtom (sourceRanks P) 5)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (5 : Fin 78) (39 : Fin 78)
    (2 : Fin 78) (60 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (6 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (35 : Fin 78) (9 : Fin 78) (5 : Fin 78)
    (39 : Fin 78) (2 : Fin 78) (60 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3592` (kalmanson). -/
theorem middleSource_h3592 :
    ((!((allOneRankAtom (sourceRanks P) 5 == allOneRankAtom (sourceRanks P) 9)) || ((allOneRankAtom (sourceRanks P) 35).ult (allOneRankAtom (sourceRanks P) 39)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (39 : Fin 78) (5 : Fin 78)
    (35 : Fin 78) (9 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (6 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (35 : Fin 78) (9 : Fin 78) (5 : Fin 78)
    (39 : Fin 78) (2 : Fin 78) (60 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3593` (kalmanson). -/
theorem middleSource_h3593 :
    ((!((allOneRankAtom (sourceRanks P) 5 == allOneRankAtom (sourceRanks P) 35)) || ((allOneRankAtom (sourceRanks P) 9).ult (allOneRankAtom (sourceRanks P) 39)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (39 : Fin 78) (5 : Fin 78)
    (9 : Fin 78) (35 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (6 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (35 : Fin 78) (9 : Fin 78) (5 : Fin 78)
    (39 : Fin 78) (2 : Fin 78) (60 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3594` (kalmanson). -/
theorem middleSource_h3594 :
    ((!((allOneRankAtom (sourceRanks P) 39 == allOneRankAtom (sourceRanks P) 9)) || ((allOneRankAtom (sourceRanks P) 35).ult (allOneRankAtom (sourceRanks P) 5)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (5 : Fin 78) (39 : Fin 78)
    (35 : Fin 78) (9 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (6 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (35 : Fin 78) (9 : Fin 78) (5 : Fin 78)
    (39 : Fin 78) (2 : Fin 78) (60 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3595` (kalmanson). -/
theorem middleSource_h3595 :
    ((!((allOneRankAtom (sourceRanks P) 39 == allOneRankAtom (sourceRanks P) 35)) || ((allOneRankAtom (sourceRanks P) 9).ult (allOneRankAtom (sourceRanks P) 5)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (5 : Fin 78) (39 : Fin 78)
    (9 : Fin 78) (35 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (6 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (35 : Fin 78) (9 : Fin 78) (5 : Fin 78)
    (39 : Fin 78) (2 : Fin 78) (60 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3596` (kalmanson). -/
theorem middleSource_h3596 :
    ((!((allOneRankAtom (sourceRanks P) 5 == allOneRankAtom (sourceRanks P) 2)) || ((allOneRankAtom (sourceRanks P) 61).ult (allOneRankAtom (sourceRanks P) 40)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (40 : Fin 78) (5 : Fin 78)
    (61 : Fin 78) (2 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (6 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (35 : Fin 78) (10 : Fin 78) (5 : Fin 78)
    (40 : Fin 78) (2 : Fin 78) (61 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3597` (kalmanson). -/
theorem middleSource_h3597 :
    ((!((allOneRankAtom (sourceRanks P) 5 == allOneRankAtom (sourceRanks P) 61)) || ((allOneRankAtom (sourceRanks P) 2).ult (allOneRankAtom (sourceRanks P) 40)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (40 : Fin 78) (5 : Fin 78)
    (2 : Fin 78) (61 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (6 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (35 : Fin 78) (10 : Fin 78) (5 : Fin 78)
    (40 : Fin 78) (2 : Fin 78) (61 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3598` (kalmanson). -/
theorem middleSource_h3598 :
    ((!((allOneRankAtom (sourceRanks P) 40 == allOneRankAtom (sourceRanks P) 2)) || ((allOneRankAtom (sourceRanks P) 61).ult (allOneRankAtom (sourceRanks P) 5)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (5 : Fin 78) (40 : Fin 78)
    (61 : Fin 78) (2 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (6 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (35 : Fin 78) (10 : Fin 78) (5 : Fin 78)
    (40 : Fin 78) (2 : Fin 78) (61 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3599` (kalmanson). -/
theorem middleSource_h3599 :
    ((!((allOneRankAtom (sourceRanks P) 40 == allOneRankAtom (sourceRanks P) 61)) || ((allOneRankAtom (sourceRanks P) 2).ult (allOneRankAtom (sourceRanks P) 5)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (5 : Fin 78) (40 : Fin 78)
    (2 : Fin 78) (61 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (6 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (35 : Fin 78) (10 : Fin 78) (5 : Fin 78)
    (40 : Fin 78) (2 : Fin 78) (61 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3600` (kalmanson). -/
theorem middleSource_h3600 :
    ((!((allOneRankAtom (sourceRanks P) 5 == allOneRankAtom (sourceRanks P) 10)) || ((allOneRankAtom (sourceRanks P) 35).ult (allOneRankAtom (sourceRanks P) 40)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (40 : Fin 78) (5 : Fin 78)
    (35 : Fin 78) (10 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (6 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (35 : Fin 78) (10 : Fin 78) (5 : Fin 78)
    (40 : Fin 78) (2 : Fin 78) (61 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3601` (kalmanson). -/
theorem middleSource_h3601 :
    ((!((allOneRankAtom (sourceRanks P) 5 == allOneRankAtom (sourceRanks P) 35)) || ((allOneRankAtom (sourceRanks P) 10).ult (allOneRankAtom (sourceRanks P) 40)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (40 : Fin 78) (5 : Fin 78)
    (10 : Fin 78) (35 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (6 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (35 : Fin 78) (10 : Fin 78) (5 : Fin 78)
    (40 : Fin 78) (2 : Fin 78) (61 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3602` (kalmanson). -/
theorem middleSource_h3602 :
    ((!((allOneRankAtom (sourceRanks P) 40 == allOneRankAtom (sourceRanks P) 10)) || ((allOneRankAtom (sourceRanks P) 35).ult (allOneRankAtom (sourceRanks P) 5)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (5 : Fin 78) (40 : Fin 78)
    (35 : Fin 78) (10 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (6 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (35 : Fin 78) (10 : Fin 78) (5 : Fin 78)
    (40 : Fin 78) (2 : Fin 78) (61 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3603` (kalmanson). -/
theorem middleSource_h3603 :
    ((!((allOneRankAtom (sourceRanks P) 40 == allOneRankAtom (sourceRanks P) 35)) || ((allOneRankAtom (sourceRanks P) 10).ult (allOneRankAtom (sourceRanks P) 5)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (5 : Fin 78) (40 : Fin 78)
    (10 : Fin 78) (35 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (6 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (35 : Fin 78) (10 : Fin 78) (5 : Fin 78)
    (40 : Fin 78) (2 : Fin 78) (61 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3604` (kalmanson). -/
theorem middleSource_h3604 :
    ((!((allOneRankAtom (sourceRanks P) 5 == allOneRankAtom (sourceRanks P) 2)) || ((allOneRankAtom (sourceRanks P) 62).ult (allOneRankAtom (sourceRanks P) 41)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (41 : Fin 78) (5 : Fin 78)
    (62 : Fin 78) (2 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (6 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (35 : Fin 78) (11 : Fin 78) (5 : Fin 78)
    (41 : Fin 78) (2 : Fin 78) (62 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3605` (kalmanson). -/
theorem middleSource_h3605 :
    ((!((allOneRankAtom (sourceRanks P) 5 == allOneRankAtom (sourceRanks P) 62)) || ((allOneRankAtom (sourceRanks P) 2).ult (allOneRankAtom (sourceRanks P) 41)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (41 : Fin 78) (5 : Fin 78)
    (2 : Fin 78) (62 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (6 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (35 : Fin 78) (11 : Fin 78) (5 : Fin 78)
    (41 : Fin 78) (2 : Fin 78) (62 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3606` (kalmanson). -/
theorem middleSource_h3606 :
    ((!((allOneRankAtom (sourceRanks P) 41 == allOneRankAtom (sourceRanks P) 2)) || ((allOneRankAtom (sourceRanks P) 62).ult (allOneRankAtom (sourceRanks P) 5)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (5 : Fin 78) (41 : Fin 78)
    (62 : Fin 78) (2 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (6 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (35 : Fin 78) (11 : Fin 78) (5 : Fin 78)
    (41 : Fin 78) (2 : Fin 78) (62 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3607` (kalmanson). -/
theorem middleSource_h3607 :
    ((!((allOneRankAtom (sourceRanks P) 5 == allOneRankAtom (sourceRanks P) 11)) || ((allOneRankAtom (sourceRanks P) 35).ult (allOneRankAtom (sourceRanks P) 41)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (41 : Fin 78) (5 : Fin 78)
    (35 : Fin 78) (11 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (6 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (35 : Fin 78) (11 : Fin 78) (5 : Fin 78)
    (41 : Fin 78) (2 : Fin 78) (62 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3608` (kalmanson). -/
theorem middleSource_h3608 :
    ((!((allOneRankAtom (sourceRanks P) 5 == allOneRankAtom (sourceRanks P) 35)) || ((allOneRankAtom (sourceRanks P) 11).ult (allOneRankAtom (sourceRanks P) 41)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (41 : Fin 78) (5 : Fin 78)
    (11 : Fin 78) (35 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (6 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (35 : Fin 78) (11 : Fin 78) (5 : Fin 78)
    (41 : Fin 78) (2 : Fin 78) (62 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3609` (kalmanson). -/
theorem middleSource_h3609 :
    ((!((allOneRankAtom (sourceRanks P) 6 == allOneRankAtom (sourceRanks P) 2)) || ((allOneRankAtom (sourceRanks P) 63).ult (allOneRankAtom (sourceRanks P) 37)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (37 : Fin 78) (6 : Fin 78)
    (63 : Fin 78) (2 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (7 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (36 : Fin 78) (7 : Fin 78) (6 : Fin 78)
    (37 : Fin 78) (2 : Fin 78) (63 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3610` (kalmanson). -/
theorem middleSource_h3610 :
    ((!((allOneRankAtom (sourceRanks P) 37 == allOneRankAtom (sourceRanks P) 63)) || ((allOneRankAtom (sourceRanks P) 2).ult (allOneRankAtom (sourceRanks P) 6)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (6 : Fin 78) (37 : Fin 78)
    (2 : Fin 78) (63 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (7 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (36 : Fin 78) (7 : Fin 78) (6 : Fin 78)
    (37 : Fin 78) (2 : Fin 78) (63 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3611` (kalmanson). -/
theorem middleSource_h3611 :
    ((!((allOneRankAtom (sourceRanks P) 6 == allOneRankAtom (sourceRanks P) 7)) || ((allOneRankAtom (sourceRanks P) 36).ult (allOneRankAtom (sourceRanks P) 37)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (37 : Fin 78) (6 : Fin 78)
    (36 : Fin 78) (7 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (7 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (36 : Fin 78) (7 : Fin 78) (6 : Fin 78)
    (37 : Fin 78) (2 : Fin 78) (63 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3612` (kalmanson). -/
theorem middleSource_h3612 :
    ((!((allOneRankAtom (sourceRanks P) 6 == allOneRankAtom (sourceRanks P) 36)) || ((allOneRankAtom (sourceRanks P) 7).ult (allOneRankAtom (sourceRanks P) 37)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (37 : Fin 78) (6 : Fin 78)
    (7 : Fin 78) (36 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (7 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (36 : Fin 78) (7 : Fin 78) (6 : Fin 78)
    (37 : Fin 78) (2 : Fin 78) (63 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3613` (kalmanson). -/
theorem middleSource_h3613 :
    ((!((allOneRankAtom (sourceRanks P) 37 == allOneRankAtom (sourceRanks P) 7)) || ((allOneRankAtom (sourceRanks P) 36).ult (allOneRankAtom (sourceRanks P) 6)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (6 : Fin 78) (37 : Fin 78)
    (36 : Fin 78) (7 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (7 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (36 : Fin 78) (7 : Fin 78) (6 : Fin 78)
    (37 : Fin 78) (2 : Fin 78) (63 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3614` (kalmanson). -/
theorem middleSource_h3614 :
    ((!((allOneRankAtom (sourceRanks P) 37 == allOneRankAtom (sourceRanks P) 36)) || ((allOneRankAtom (sourceRanks P) 7).ult (allOneRankAtom (sourceRanks P) 6)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (6 : Fin 78) (37 : Fin 78)
    (7 : Fin 78) (36 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (7 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (36 : Fin 78) (7 : Fin 78) (6 : Fin 78)
    (37 : Fin 78) (2 : Fin 78) (63 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3615` (kalmanson). -/
theorem middleSource_h3615 :
    ((!((allOneRankAtom (sourceRanks P) 6 == allOneRankAtom (sourceRanks P) 2)) || ((allOneRankAtom (sourceRanks P) 64).ult (allOneRankAtom (sourceRanks P) 38)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (38 : Fin 78) (6 : Fin 78)
    (64 : Fin 78) (2 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (7 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (36 : Fin 78) (8 : Fin 78) (6 : Fin 78)
    (38 : Fin 78) (2 : Fin 78) (64 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3616` (kalmanson). -/
theorem middleSource_h3616 :
    ((!((allOneRankAtom (sourceRanks P) 38 == allOneRankAtom (sourceRanks P) 64)) || ((allOneRankAtom (sourceRanks P) 2).ult (allOneRankAtom (sourceRanks P) 6)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (6 : Fin 78) (38 : Fin 78)
    (2 : Fin 78) (64 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (7 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (36 : Fin 78) (8 : Fin 78) (6 : Fin 78)
    (38 : Fin 78) (2 : Fin 78) (64 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3617` (kalmanson). -/
theorem middleSource_h3617 :
    ((!((allOneRankAtom (sourceRanks P) 6 == allOneRankAtom (sourceRanks P) 8)) || ((allOneRankAtom (sourceRanks P) 36).ult (allOneRankAtom (sourceRanks P) 38)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (38 : Fin 78) (6 : Fin 78)
    (36 : Fin 78) (8 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (7 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (36 : Fin 78) (8 : Fin 78) (6 : Fin 78)
    (38 : Fin 78) (2 : Fin 78) (64 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3618` (kalmanson). -/
theorem middleSource_h3618 :
    ((!((allOneRankAtom (sourceRanks P) 38 == allOneRankAtom (sourceRanks P) 8)) || ((allOneRankAtom (sourceRanks P) 36).ult (allOneRankAtom (sourceRanks P) 6)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (6 : Fin 78) (38 : Fin 78)
    (36 : Fin 78) (8 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (7 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (36 : Fin 78) (8 : Fin 78) (6 : Fin 78)
    (38 : Fin 78) (2 : Fin 78) (64 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3619` (kalmanson). -/
theorem middleSource_h3619 :
    ((!((allOneRankAtom (sourceRanks P) 38 == allOneRankAtom (sourceRanks P) 36)) || ((allOneRankAtom (sourceRanks P) 8).ult (allOneRankAtom (sourceRanks P) 6)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (6 : Fin 78) (38 : Fin 78)
    (8 : Fin 78) (36 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (7 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (36 : Fin 78) (8 : Fin 78) (6 : Fin 78)
    (38 : Fin 78) (2 : Fin 78) (64 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3620` (kalmanson). -/
theorem middleSource_h3620 :
    ((!((allOneRankAtom (sourceRanks P) 6 == allOneRankAtom (sourceRanks P) 2)) || ((allOneRankAtom (sourceRanks P) 65).ult (allOneRankAtom (sourceRanks P) 39)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (39 : Fin 78) (6 : Fin 78)
    (65 : Fin 78) (2 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (7 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (36 : Fin 78) (9 : Fin 78) (6 : Fin 78)
    (39 : Fin 78) (2 : Fin 78) (65 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3621` (kalmanson). -/
theorem middleSource_h3621 :
    ((!((allOneRankAtom (sourceRanks P) 6 == allOneRankAtom (sourceRanks P) 65)) || ((allOneRankAtom (sourceRanks P) 2).ult (allOneRankAtom (sourceRanks P) 39)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (39 : Fin 78) (6 : Fin 78)
    (2 : Fin 78) (65 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (7 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (36 : Fin 78) (9 : Fin 78) (6 : Fin 78)
    (39 : Fin 78) (2 : Fin 78) (65 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3622` (kalmanson). -/
theorem middleSource_h3622 :
    ((!((allOneRankAtom (sourceRanks P) 39 == allOneRankAtom (sourceRanks P) 2)) || ((allOneRankAtom (sourceRanks P) 65).ult (allOneRankAtom (sourceRanks P) 6)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (6 : Fin 78) (39 : Fin 78)
    (65 : Fin 78) (2 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (7 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (36 : Fin 78) (9 : Fin 78) (6 : Fin 78)
    (39 : Fin 78) (2 : Fin 78) (65 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3623` (kalmanson). -/
theorem middleSource_h3623 :
    ((!((allOneRankAtom (sourceRanks P) 39 == allOneRankAtom (sourceRanks P) 65)) || ((allOneRankAtom (sourceRanks P) 2).ult (allOneRankAtom (sourceRanks P) 6)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (6 : Fin 78) (39 : Fin 78)
    (2 : Fin 78) (65 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (7 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (36 : Fin 78) (9 : Fin 78) (6 : Fin 78)
    (39 : Fin 78) (2 : Fin 78) (65 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3624` (kalmanson). -/
theorem middleSource_h3624 :
    ((!((allOneRankAtom (sourceRanks P) 6 == allOneRankAtom (sourceRanks P) 9)) || ((allOneRankAtom (sourceRanks P) 36).ult (allOneRankAtom (sourceRanks P) 39)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (39 : Fin 78) (6 : Fin 78)
    (36 : Fin 78) (9 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (7 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (36 : Fin 78) (9 : Fin 78) (6 : Fin 78)
    (39 : Fin 78) (2 : Fin 78) (65 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3625` (kalmanson). -/
theorem middleSource_h3625 :
    ((!((allOneRankAtom (sourceRanks P) 39 == allOneRankAtom (sourceRanks P) 9)) || ((allOneRankAtom (sourceRanks P) 36).ult (allOneRankAtom (sourceRanks P) 6)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (6 : Fin 78) (39 : Fin 78)
    (36 : Fin 78) (9 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (7 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (36 : Fin 78) (9 : Fin 78) (6 : Fin 78)
    (39 : Fin 78) (2 : Fin 78) (65 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3626` (kalmanson). -/
theorem middleSource_h3626 :
    ((!((allOneRankAtom (sourceRanks P) 39 == allOneRankAtom (sourceRanks P) 36)) || ((allOneRankAtom (sourceRanks P) 9).ult (allOneRankAtom (sourceRanks P) 6)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (6 : Fin 78) (39 : Fin 78)
    (9 : Fin 78) (36 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (7 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (36 : Fin 78) (9 : Fin 78) (6 : Fin 78)
    (39 : Fin 78) (2 : Fin 78) (65 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3627` (kalmanson). -/
theorem middleSource_h3627 :
    ((!((allOneRankAtom (sourceRanks P) 6 == allOneRankAtom (sourceRanks P) 2)) || ((allOneRankAtom (sourceRanks P) 66).ult (allOneRankAtom (sourceRanks P) 40)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (40 : Fin 78) (6 : Fin 78)
    (66 : Fin 78) (2 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (7 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (36 : Fin 78) (10 : Fin 78) (6 : Fin 78)
    (40 : Fin 78) (2 : Fin 78) (66 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3628` (kalmanson). -/
theorem middleSource_h3628 :
    ((!((allOneRankAtom (sourceRanks P) 6 == allOneRankAtom (sourceRanks P) 66)) || ((allOneRankAtom (sourceRanks P) 2).ult (allOneRankAtom (sourceRanks P) 40)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (40 : Fin 78) (6 : Fin 78)
    (2 : Fin 78) (66 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (7 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (36 : Fin 78) (10 : Fin 78) (6 : Fin 78)
    (40 : Fin 78) (2 : Fin 78) (66 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3629` (kalmanson). -/
theorem middleSource_h3629 :
    ((!((allOneRankAtom (sourceRanks P) 40 == allOneRankAtom (sourceRanks P) 66)) || ((allOneRankAtom (sourceRanks P) 2).ult (allOneRankAtom (sourceRanks P) 6)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (6 : Fin 78) (40 : Fin 78)
    (2 : Fin 78) (66 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (7 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (36 : Fin 78) (10 : Fin 78) (6 : Fin 78)
    (40 : Fin 78) (2 : Fin 78) (66 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3630` (kalmanson). -/
theorem middleSource_h3630 :
    ((!((allOneRankAtom (sourceRanks P) 6 == allOneRankAtom (sourceRanks P) 10)) || ((allOneRankAtom (sourceRanks P) 36).ult (allOneRankAtom (sourceRanks P) 40)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (40 : Fin 78) (6 : Fin 78)
    (36 : Fin 78) (10 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (7 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (36 : Fin 78) (10 : Fin 78) (6 : Fin 78)
    (40 : Fin 78) (2 : Fin 78) (66 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3631` (kalmanson). -/
theorem middleSource_h3631 :
    ((!((allOneRankAtom (sourceRanks P) 40 == allOneRankAtom (sourceRanks P) 10)) || ((allOneRankAtom (sourceRanks P) 36).ult (allOneRankAtom (sourceRanks P) 6)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (6 : Fin 78) (40 : Fin 78)
    (36 : Fin 78) (10 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (7 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (36 : Fin 78) (10 : Fin 78) (6 : Fin 78)
    (40 : Fin 78) (2 : Fin 78) (66 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3632` (kalmanson). -/
theorem middleSource_h3632 :
    ((!((allOneRankAtom (sourceRanks P) 40 == allOneRankAtom (sourceRanks P) 36)) || ((allOneRankAtom (sourceRanks P) 10).ult (allOneRankAtom (sourceRanks P) 6)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (6 : Fin 78) (40 : Fin 78)
    (10 : Fin 78) (36 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (7 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (36 : Fin 78) (10 : Fin 78) (6 : Fin 78)
    (40 : Fin 78) (2 : Fin 78) (66 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3633` (kalmanson). -/
theorem middleSource_h3633 :
    ((!((allOneRankAtom (sourceRanks P) 6 == allOneRankAtom (sourceRanks P) 2)) || ((allOneRankAtom (sourceRanks P) 67).ult (allOneRankAtom (sourceRanks P) 41)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (41 : Fin 78) (6 : Fin 78)
    (67 : Fin 78) (2 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (7 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (36 : Fin 78) (11 : Fin 78) (6 : Fin 78)
    (41 : Fin 78) (2 : Fin 78) (67 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3634` (kalmanson). -/
theorem middleSource_h3634 :
    ((!((allOneRankAtom (sourceRanks P) 41 == allOneRankAtom (sourceRanks P) 2)) || ((allOneRankAtom (sourceRanks P) 67).ult (allOneRankAtom (sourceRanks P) 6)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (6 : Fin 78) (41 : Fin 78)
    (67 : Fin 78) (2 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (7 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (36 : Fin 78) (11 : Fin 78) (6 : Fin 78)
    (41 : Fin 78) (2 : Fin 78) (67 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3635` (kalmanson). -/
theorem middleSource_h3635 :
    ((!((allOneRankAtom (sourceRanks P) 6 == allOneRankAtom (sourceRanks P) 11)) || ((allOneRankAtom (sourceRanks P) 36).ult (allOneRankAtom (sourceRanks P) 41)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (41 : Fin 78) (6 : Fin 78)
    (36 : Fin 78) (11 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (7 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (36 : Fin 78) (11 : Fin 78) (6 : Fin 78)
    (41 : Fin 78) (2 : Fin 78) (67 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3636` (kalmanson). -/
theorem middleSource_h3636 :
    ((!((allOneRankAtom (sourceRanks P) 7 == allOneRankAtom (sourceRanks P) 2)) || ((allOneRankAtom (sourceRanks P) 68).ult (allOneRankAtom (sourceRanks P) 38)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (38 : Fin 78) (7 : Fin 78)
    (68 : Fin 78) (2 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (8 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (37 : Fin 78) (8 : Fin 78) (7 : Fin 78)
    (38 : Fin 78) (2 : Fin 78) (68 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3637` (kalmanson). -/
theorem middleSource_h3637 :
    ((!((allOneRankAtom (sourceRanks P) 38 == allOneRankAtom (sourceRanks P) 2)) || ((allOneRankAtom (sourceRanks P) 68).ult (allOneRankAtom (sourceRanks P) 7)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (7 : Fin 78) (38 : Fin 78)
    (68 : Fin 78) (2 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (8 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (37 : Fin 78) (8 : Fin 78) (7 : Fin 78)
    (38 : Fin 78) (2 : Fin 78) (68 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3638` (kalmanson). -/
theorem middleSource_h3638 :
    ((!((allOneRankAtom (sourceRanks P) 38 == allOneRankAtom (sourceRanks P) 68)) || ((allOneRankAtom (sourceRanks P) 2).ult (allOneRankAtom (sourceRanks P) 7)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (7 : Fin 78) (38 : Fin 78)
    (2 : Fin 78) (68 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (8 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (37 : Fin 78) (8 : Fin 78) (7 : Fin 78)
    (38 : Fin 78) (2 : Fin 78) (68 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3639` (kalmanson). -/
theorem middleSource_h3639 :
    ((!((allOneRankAtom (sourceRanks P) 7 == allOneRankAtom (sourceRanks P) 37)) || ((allOneRankAtom (sourceRanks P) 8).ult (allOneRankAtom (sourceRanks P) 38)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (38 : Fin 78) (7 : Fin 78)
    (8 : Fin 78) (37 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (8 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (37 : Fin 78) (8 : Fin 78) (7 : Fin 78)
    (38 : Fin 78) (2 : Fin 78) (68 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3640` (kalmanson). -/
theorem middleSource_h3640 :
    ((!((allOneRankAtom (sourceRanks P) 38 == allOneRankAtom (sourceRanks P) 8)) || ((allOneRankAtom (sourceRanks P) 37).ult (allOneRankAtom (sourceRanks P) 7)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (7 : Fin 78) (38 : Fin 78)
    (37 : Fin 78) (8 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (8 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (37 : Fin 78) (8 : Fin 78) (7 : Fin 78)
    (38 : Fin 78) (2 : Fin 78) (68 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3641` (kalmanson). -/
theorem middleSource_h3641 :
    ((!((allOneRankAtom (sourceRanks P) 38 == allOneRankAtom (sourceRanks P) 37)) || ((allOneRankAtom (sourceRanks P) 8).ult (allOneRankAtom (sourceRanks P) 7)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (7 : Fin 78) (38 : Fin 78)
    (8 : Fin 78) (37 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (8 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (37 : Fin 78) (8 : Fin 78) (7 : Fin 78)
    (38 : Fin 78) (2 : Fin 78) (68 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3642` (kalmanson). -/
theorem middleSource_h3642 :
    ((!((allOneRankAtom (sourceRanks P) 7 == allOneRankAtom (sourceRanks P) 2)) || ((allOneRankAtom (sourceRanks P) 69).ult (allOneRankAtom (sourceRanks P) 39)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (39 : Fin 78) (7 : Fin 78)
    (69 : Fin 78) (2 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (8 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (37 : Fin 78) (9 : Fin 78) (7 : Fin 78)
    (39 : Fin 78) (2 : Fin 78) (69 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3643` (kalmanson). -/
theorem middleSource_h3643 :
    ((!((allOneRankAtom (sourceRanks P) 39 == allOneRankAtom (sourceRanks P) 2)) || ((allOneRankAtom (sourceRanks P) 69).ult (allOneRankAtom (sourceRanks P) 7)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (7 : Fin 78) (39 : Fin 78)
    (69 : Fin 78) (2 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (8 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (37 : Fin 78) (9 : Fin 78) (7 : Fin 78)
    (39 : Fin 78) (2 : Fin 78) (69 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3644` (kalmanson). -/
theorem middleSource_h3644 :
    ((!((allOneRankAtom (sourceRanks P) 39 == allOneRankAtom (sourceRanks P) 69)) || ((allOneRankAtom (sourceRanks P) 2).ult (allOneRankAtom (sourceRanks P) 7)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (7 : Fin 78) (39 : Fin 78)
    (2 : Fin 78) (69 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (8 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (37 : Fin 78) (9 : Fin 78) (7 : Fin 78)
    (39 : Fin 78) (2 : Fin 78) (69 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3645` (kalmanson). -/
theorem middleSource_h3645 :
    ((!((allOneRankAtom (sourceRanks P) 7 == allOneRankAtom (sourceRanks P) 37)) || ((allOneRankAtom (sourceRanks P) 9).ult (allOneRankAtom (sourceRanks P) 39)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (39 : Fin 78) (7 : Fin 78)
    (9 : Fin 78) (37 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (8 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (37 : Fin 78) (9 : Fin 78) (7 : Fin 78)
    (39 : Fin 78) (2 : Fin 78) (69 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3646` (kalmanson). -/
theorem middleSource_h3646 :
    ((!((allOneRankAtom (sourceRanks P) 39 == allOneRankAtom (sourceRanks P) 9)) || ((allOneRankAtom (sourceRanks P) 37).ult (allOneRankAtom (sourceRanks P) 7)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (7 : Fin 78) (39 : Fin 78)
    (37 : Fin 78) (9 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (8 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (37 : Fin 78) (9 : Fin 78) (7 : Fin 78)
    (39 : Fin 78) (2 : Fin 78) (69 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3647` (kalmanson). -/
theorem middleSource_h3647 :
    ((!((allOneRankAtom (sourceRanks P) 39 == allOneRankAtom (sourceRanks P) 37)) || ((allOneRankAtom (sourceRanks P) 9).ult (allOneRankAtom (sourceRanks P) 7)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (7 : Fin 78) (39 : Fin 78)
    (9 : Fin 78) (37 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (8 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (37 : Fin 78) (9 : Fin 78) (7 : Fin 78)
    (39 : Fin 78) (2 : Fin 78) (69 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

end

end ATailExactFiveCard13AllOneSourceIngressScratch
end Problem97
