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

/-- Candidate middle source assertion `h3648` (kalmanson). -/
theorem middleSource_h3648 :
    ((!((allOneRankAtom (sourceRanks P) 7 == allOneRankAtom (sourceRanks P) 2)) || ((allOneRankAtom (sourceRanks P) 70).ult (allOneRankAtom (sourceRanks P) 40)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (40 : Fin 78) (7 : Fin 78)
    (70 : Fin 78) (2 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (8 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (37 : Fin 78) (10 : Fin 78) (7 : Fin 78)
    (40 : Fin 78) (2 : Fin 78) (70 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3649` (kalmanson). -/
theorem middleSource_h3649 :
    ((!((allOneRankAtom (sourceRanks P) 40 == allOneRankAtom (sourceRanks P) 2)) || ((allOneRankAtom (sourceRanks P) 70).ult (allOneRankAtom (sourceRanks P) 7)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (7 : Fin 78) (40 : Fin 78)
    (70 : Fin 78) (2 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (8 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (37 : Fin 78) (10 : Fin 78) (7 : Fin 78)
    (40 : Fin 78) (2 : Fin 78) (70 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3650` (kalmanson). -/
theorem middleSource_h3650 :
    ((!((allOneRankAtom (sourceRanks P) 7 == allOneRankAtom (sourceRanks P) 37)) || ((allOneRankAtom (sourceRanks P) 10).ult (allOneRankAtom (sourceRanks P) 40)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (40 : Fin 78) (7 : Fin 78)
    (10 : Fin 78) (37 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (8 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (37 : Fin 78) (10 : Fin 78) (7 : Fin 78)
    (40 : Fin 78) (2 : Fin 78) (70 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3651` (kalmanson). -/
theorem middleSource_h3651 :
    ((!((allOneRankAtom (sourceRanks P) 40 == allOneRankAtom (sourceRanks P) 10)) || ((allOneRankAtom (sourceRanks P) 37).ult (allOneRankAtom (sourceRanks P) 7)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (7 : Fin 78) (40 : Fin 78)
    (37 : Fin 78) (10 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (8 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (37 : Fin 78) (10 : Fin 78) (7 : Fin 78)
    (40 : Fin 78) (2 : Fin 78) (70 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3652` (kalmanson). -/
theorem middleSource_h3652 :
    ((!((allOneRankAtom (sourceRanks P) 40 == allOneRankAtom (sourceRanks P) 37)) || ((allOneRankAtom (sourceRanks P) 10).ult (allOneRankAtom (sourceRanks P) 7)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (7 : Fin 78) (40 : Fin 78)
    (10 : Fin 78) (37 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (8 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (37 : Fin 78) (10 : Fin 78) (7 : Fin 78)
    (40 : Fin 78) (2 : Fin 78) (70 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3653` (kalmanson). -/
theorem middleSource_h3653 :
    ((!((allOneRankAtom (sourceRanks P) 7 == allOneRankAtom (sourceRanks P) 2)) || ((allOneRankAtom (sourceRanks P) 71).ult (allOneRankAtom (sourceRanks P) 41)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (41 : Fin 78) (7 : Fin 78)
    (71 : Fin 78) (2 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (8 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (37 : Fin 78) (11 : Fin 78) (7 : Fin 78)
    (41 : Fin 78) (2 : Fin 78) (71 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3654` (kalmanson). -/
theorem middleSource_h3654 :
    ((!((allOneRankAtom (sourceRanks P) 41 == allOneRankAtom (sourceRanks P) 2)) || ((allOneRankAtom (sourceRanks P) 71).ult (allOneRankAtom (sourceRanks P) 7)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (7 : Fin 78) (41 : Fin 78)
    (71 : Fin 78) (2 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (8 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (37 : Fin 78) (11 : Fin 78) (7 : Fin 78)
    (41 : Fin 78) (2 : Fin 78) (71 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3655` (kalmanson). -/
theorem middleSource_h3655 :
    ((!((allOneRankAtom (sourceRanks P) 7 == allOneRankAtom (sourceRanks P) 37)) || ((allOneRankAtom (sourceRanks P) 11).ult (allOneRankAtom (sourceRanks P) 41)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (41 : Fin 78) (7 : Fin 78)
    (11 : Fin 78) (37 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (8 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (37 : Fin 78) (11 : Fin 78) (7 : Fin 78)
    (41 : Fin 78) (2 : Fin 78) (71 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3656` (kalmanson). -/
theorem middleSource_h3656 :
    ((!((allOneRankAtom (sourceRanks P) 41 == allOneRankAtom (sourceRanks P) 11)) || ((allOneRankAtom (sourceRanks P) 37).ult (allOneRankAtom (sourceRanks P) 7)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (7 : Fin 78) (41 : Fin 78)
    (37 : Fin 78) (11 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (8 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (37 : Fin 78) (11 : Fin 78) (7 : Fin 78)
    (41 : Fin 78) (2 : Fin 78) (71 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3657` (kalmanson). -/
theorem middleSource_h3657 :
    ((!((allOneRankAtom (sourceRanks P) 41 == allOneRankAtom (sourceRanks P) 37)) || ((allOneRankAtom (sourceRanks P) 11).ult (allOneRankAtom (sourceRanks P) 7)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (7 : Fin 78) (41 : Fin 78)
    (11 : Fin 78) (37 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (8 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (37 : Fin 78) (11 : Fin 78) (7 : Fin 78)
    (41 : Fin 78) (2 : Fin 78) (71 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3658` (kalmanson). -/
theorem middleSource_h3658 :
    ((!((allOneRankAtom (sourceRanks P) 8 == allOneRankAtom (sourceRanks P) 2)) || ((allOneRankAtom (sourceRanks P) 72).ult (allOneRankAtom (sourceRanks P) 39)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (39 : Fin 78) (8 : Fin 78)
    (72 : Fin 78) (2 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (9 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (38 : Fin 78) (9 : Fin 78) (8 : Fin 78)
    (39 : Fin 78) (2 : Fin 78) (72 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3659` (kalmanson). -/
theorem middleSource_h3659 :
    ((!((allOneRankAtom (sourceRanks P) 8 == allOneRankAtom (sourceRanks P) 72)) || ((allOneRankAtom (sourceRanks P) 2).ult (allOneRankAtom (sourceRanks P) 39)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (39 : Fin 78) (8 : Fin 78)
    (2 : Fin 78) (72 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (9 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (38 : Fin 78) (9 : Fin 78) (8 : Fin 78)
    (39 : Fin 78) (2 : Fin 78) (72 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3660` (kalmanson). -/
theorem middleSource_h3660 :
    ((!((allOneRankAtom (sourceRanks P) 39 == allOneRankAtom (sourceRanks P) 72)) || ((allOneRankAtom (sourceRanks P) 2).ult (allOneRankAtom (sourceRanks P) 8)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (8 : Fin 78) (39 : Fin 78)
    (2 : Fin 78) (72 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (9 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (38 : Fin 78) (9 : Fin 78) (8 : Fin 78)
    (39 : Fin 78) (2 : Fin 78) (72 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3661` (kalmanson). -/
theorem middleSource_h3661 :
    ((!((allOneRankAtom (sourceRanks P) 8 == allOneRankAtom (sourceRanks P) 38)) || ((allOneRankAtom (sourceRanks P) 9).ult (allOneRankAtom (sourceRanks P) 39)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (39 : Fin 78) (8 : Fin 78)
    (9 : Fin 78) (38 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (9 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (38 : Fin 78) (9 : Fin 78) (8 : Fin 78)
    (39 : Fin 78) (2 : Fin 78) (72 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3662` (kalmanson). -/
theorem middleSource_h3662 :
    ((!((allOneRankAtom (sourceRanks P) 39 == allOneRankAtom (sourceRanks P) 9)) || ((allOneRankAtom (sourceRanks P) 38).ult (allOneRankAtom (sourceRanks P) 8)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (8 : Fin 78) (39 : Fin 78)
    (38 : Fin 78) (9 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (9 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (38 : Fin 78) (9 : Fin 78) (8 : Fin 78)
    (39 : Fin 78) (2 : Fin 78) (72 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3663` (kalmanson). -/
theorem middleSource_h3663 :
    ((!((allOneRankAtom (sourceRanks P) 39 == allOneRankAtom (sourceRanks P) 38)) || ((allOneRankAtom (sourceRanks P) 9).ult (allOneRankAtom (sourceRanks P) 8)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (8 : Fin 78) (39 : Fin 78)
    (9 : Fin 78) (38 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (9 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (38 : Fin 78) (9 : Fin 78) (8 : Fin 78)
    (39 : Fin 78) (2 : Fin 78) (72 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3664` (kalmanson). -/
theorem middleSource_h3664 :
    ((!((allOneRankAtom (sourceRanks P) 8 == allOneRankAtom (sourceRanks P) 2)) || ((allOneRankAtom (sourceRanks P) 73).ult (allOneRankAtom (sourceRanks P) 40)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (40 : Fin 78) (8 : Fin 78)
    (73 : Fin 78) (2 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (9 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (38 : Fin 78) (10 : Fin 78) (8 : Fin 78)
    (40 : Fin 78) (2 : Fin 78) (73 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3665` (kalmanson). -/
theorem middleSource_h3665 :
    ((!((allOneRankAtom (sourceRanks P) 8 == allOneRankAtom (sourceRanks P) 73)) || ((allOneRankAtom (sourceRanks P) 2).ult (allOneRankAtom (sourceRanks P) 40)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (40 : Fin 78) (8 : Fin 78)
    (2 : Fin 78) (73 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (9 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (38 : Fin 78) (10 : Fin 78) (8 : Fin 78)
    (40 : Fin 78) (2 : Fin 78) (73 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3666` (kalmanson). -/
theorem middleSource_h3666 :
    ((!((allOneRankAtom (sourceRanks P) 40 == allOneRankAtom (sourceRanks P) 2)) || ((allOneRankAtom (sourceRanks P) 73).ult (allOneRankAtom (sourceRanks P) 8)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (8 : Fin 78) (40 : Fin 78)
    (73 : Fin 78) (2 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (9 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (38 : Fin 78) (10 : Fin 78) (8 : Fin 78)
    (40 : Fin 78) (2 : Fin 78) (73 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3667` (kalmanson). -/
theorem middleSource_h3667 :
    ((!((allOneRankAtom (sourceRanks P) 40 == allOneRankAtom (sourceRanks P) 73)) || ((allOneRankAtom (sourceRanks P) 2).ult (allOneRankAtom (sourceRanks P) 8)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (8 : Fin 78) (40 : Fin 78)
    (2 : Fin 78) (73 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (9 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (38 : Fin 78) (10 : Fin 78) (8 : Fin 78)
    (40 : Fin 78) (2 : Fin 78) (73 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3668` (kalmanson). -/
theorem middleSource_h3668 :
    ((!((allOneRankAtom (sourceRanks P) 8 == allOneRankAtom (sourceRanks P) 38)) || ((allOneRankAtom (sourceRanks P) 10).ult (allOneRankAtom (sourceRanks P) 40)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (40 : Fin 78) (8 : Fin 78)
    (10 : Fin 78) (38 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (9 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (38 : Fin 78) (10 : Fin 78) (8 : Fin 78)
    (40 : Fin 78) (2 : Fin 78) (73 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3669` (kalmanson). -/
theorem middleSource_h3669 :
    ((!((allOneRankAtom (sourceRanks P) 40 == allOneRankAtom (sourceRanks P) 10)) || ((allOneRankAtom (sourceRanks P) 38).ult (allOneRankAtom (sourceRanks P) 8)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (8 : Fin 78) (40 : Fin 78)
    (38 : Fin 78) (10 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (9 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (38 : Fin 78) (10 : Fin 78) (8 : Fin 78)
    (40 : Fin 78) (2 : Fin 78) (73 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3670` (kalmanson). -/
theorem middleSource_h3670 :
    ((!((allOneRankAtom (sourceRanks P) 40 == allOneRankAtom (sourceRanks P) 38)) || ((allOneRankAtom (sourceRanks P) 10).ult (allOneRankAtom (sourceRanks P) 8)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (8 : Fin 78) (40 : Fin 78)
    (10 : Fin 78) (38 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (9 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (38 : Fin 78) (10 : Fin 78) (8 : Fin 78)
    (40 : Fin 78) (2 : Fin 78) (73 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3671` (kalmanson). -/
theorem middleSource_h3671 :
    ((!((allOneRankAtom (sourceRanks P) 8 == allOneRankAtom (sourceRanks P) 2)) || ((allOneRankAtom (sourceRanks P) 74).ult (allOneRankAtom (sourceRanks P) 41)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (41 : Fin 78) (8 : Fin 78)
    (74 : Fin 78) (2 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (9 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (38 : Fin 78) (11 : Fin 78) (8 : Fin 78)
    (41 : Fin 78) (2 : Fin 78) (74 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3672` (kalmanson). -/
theorem middleSource_h3672 :
    ((!((allOneRankAtom (sourceRanks P) 8 == allOneRankAtom (sourceRanks P) 74)) || ((allOneRankAtom (sourceRanks P) 2).ult (allOneRankAtom (sourceRanks P) 41)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (41 : Fin 78) (8 : Fin 78)
    (2 : Fin 78) (74 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (9 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (38 : Fin 78) (11 : Fin 78) (8 : Fin 78)
    (41 : Fin 78) (2 : Fin 78) (74 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3673` (kalmanson). -/
theorem middleSource_h3673 :
    ((!((allOneRankAtom (sourceRanks P) 41 == allOneRankAtom (sourceRanks P) 2)) || ((allOneRankAtom (sourceRanks P) 74).ult (allOneRankAtom (sourceRanks P) 8)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (8 : Fin 78) (41 : Fin 78)
    (74 : Fin 78) (2 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (9 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (38 : Fin 78) (11 : Fin 78) (8 : Fin 78)
    (41 : Fin 78) (2 : Fin 78) (74 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3674` (kalmanson). -/
theorem middleSource_h3674 :
    ((!((allOneRankAtom (sourceRanks P) 8 == allOneRankAtom (sourceRanks P) 11)) || ((allOneRankAtom (sourceRanks P) 38).ult (allOneRankAtom (sourceRanks P) 41)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (41 : Fin 78) (8 : Fin 78)
    (38 : Fin 78) (11 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (9 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (38 : Fin 78) (11 : Fin 78) (8 : Fin 78)
    (41 : Fin 78) (2 : Fin 78) (74 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3675` (kalmanson). -/
theorem middleSource_h3675 :
    ((!((allOneRankAtom (sourceRanks P) 8 == allOneRankAtom (sourceRanks P) 38)) || ((allOneRankAtom (sourceRanks P) 11).ult (allOneRankAtom (sourceRanks P) 41)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (41 : Fin 78) (8 : Fin 78)
    (11 : Fin 78) (38 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (9 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (38 : Fin 78) (11 : Fin 78) (8 : Fin 78)
    (41 : Fin 78) (2 : Fin 78) (74 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3676` (kalmanson). -/
theorem middleSource_h3676 :
    ((!((allOneRankAtom (sourceRanks P) 41 == allOneRankAtom (sourceRanks P) 38)) || ((allOneRankAtom (sourceRanks P) 11).ult (allOneRankAtom (sourceRanks P) 8)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (8 : Fin 78) (41 : Fin 78)
    (11 : Fin 78) (38 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (9 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (38 : Fin 78) (11 : Fin 78) (8 : Fin 78)
    (41 : Fin 78) (2 : Fin 78) (74 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3677` (kalmanson). -/
theorem middleSource_h3677 :
    ((!((allOneRankAtom (sourceRanks P) 9 == allOneRankAtom (sourceRanks P) 2)) || ((allOneRankAtom (sourceRanks P) 75).ult (allOneRankAtom (sourceRanks P) 40)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (40 : Fin 78) (9 : Fin 78)
    (75 : Fin 78) (2 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (10 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (39 : Fin 78) (10 : Fin 78) (9 : Fin 78)
    (40 : Fin 78) (2 : Fin 78) (75 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3678` (kalmanson). -/
theorem middleSource_h3678 :
    ((!((allOneRankAtom (sourceRanks P) 9 == allOneRankAtom (sourceRanks P) 75)) || ((allOneRankAtom (sourceRanks P) 2).ult (allOneRankAtom (sourceRanks P) 40)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (40 : Fin 78) (9 : Fin 78)
    (2 : Fin 78) (75 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (10 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (39 : Fin 78) (10 : Fin 78) (9 : Fin 78)
    (40 : Fin 78) (2 : Fin 78) (75 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3679` (kalmanson). -/
theorem middleSource_h3679 :
    ((!((allOneRankAtom (sourceRanks P) 40 == allOneRankAtom (sourceRanks P) 75)) || ((allOneRankAtom (sourceRanks P) 2).ult (allOneRankAtom (sourceRanks P) 9)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (9 : Fin 78) (40 : Fin 78)
    (2 : Fin 78) (75 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (10 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (39 : Fin 78) (10 : Fin 78) (9 : Fin 78)
    (40 : Fin 78) (2 : Fin 78) (75 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3680` (kalmanson). -/
theorem middleSource_h3680 :
    ((!((allOneRankAtom (sourceRanks P) 9 == allOneRankAtom (sourceRanks P) 10)) || ((allOneRankAtom (sourceRanks P) 39).ult (allOneRankAtom (sourceRanks P) 40)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (40 : Fin 78) (9 : Fin 78)
    (39 : Fin 78) (10 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (10 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (39 : Fin 78) (10 : Fin 78) (9 : Fin 78)
    (40 : Fin 78) (2 : Fin 78) (75 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3681` (kalmanson). -/
theorem middleSource_h3681 :
    ((!((allOneRankAtom (sourceRanks P) 9 == allOneRankAtom (sourceRanks P) 39)) || ((allOneRankAtom (sourceRanks P) 10).ult (allOneRankAtom (sourceRanks P) 40)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (40 : Fin 78) (9 : Fin 78)
    (10 : Fin 78) (39 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (10 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (39 : Fin 78) (10 : Fin 78) (9 : Fin 78)
    (40 : Fin 78) (2 : Fin 78) (75 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3682` (kalmanson). -/
theorem middleSource_h3682 :
    ((!((allOneRankAtom (sourceRanks P) 40 == allOneRankAtom (sourceRanks P) 10)) || ((allOneRankAtom (sourceRanks P) 39).ult (allOneRankAtom (sourceRanks P) 9)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (9 : Fin 78) (40 : Fin 78)
    (39 : Fin 78) (10 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (10 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (39 : Fin 78) (10 : Fin 78) (9 : Fin 78)
    (40 : Fin 78) (2 : Fin 78) (75 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3683` (kalmanson). -/
theorem middleSource_h3683 :
    ((!((allOneRankAtom (sourceRanks P) 40 == allOneRankAtom (sourceRanks P) 39)) || ((allOneRankAtom (sourceRanks P) 10).ult (allOneRankAtom (sourceRanks P) 9)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (9 : Fin 78) (40 : Fin 78)
    (10 : Fin 78) (39 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (10 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (39 : Fin 78) (10 : Fin 78) (9 : Fin 78)
    (40 : Fin 78) (2 : Fin 78) (75 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3684` (kalmanson). -/
theorem middleSource_h3684 :
    ((!((allOneRankAtom (sourceRanks P) 9 == allOneRankAtom (sourceRanks P) 2)) || ((allOneRankAtom (sourceRanks P) 76).ult (allOneRankAtom (sourceRanks P) 41)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (41 : Fin 78) (9 : Fin 78)
    (76 : Fin 78) (2 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (10 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (39 : Fin 78) (11 : Fin 78) (9 : Fin 78)
    (41 : Fin 78) (2 : Fin 78) (76 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3685` (kalmanson). -/
theorem middleSource_h3685 :
    ((!((allOneRankAtom (sourceRanks P) 9 == allOneRankAtom (sourceRanks P) 76)) || ((allOneRankAtom (sourceRanks P) 2).ult (allOneRankAtom (sourceRanks P) 41)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (41 : Fin 78) (9 : Fin 78)
    (2 : Fin 78) (76 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (10 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (39 : Fin 78) (11 : Fin 78) (9 : Fin 78)
    (41 : Fin 78) (2 : Fin 78) (76 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3686` (kalmanson). -/
theorem middleSource_h3686 :
    ((!((allOneRankAtom (sourceRanks P) 41 == allOneRankAtom (sourceRanks P) 2)) || ((allOneRankAtom (sourceRanks P) 76).ult (allOneRankAtom (sourceRanks P) 9)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (9 : Fin 78) (41 : Fin 78)
    (76 : Fin 78) (2 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (10 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (39 : Fin 78) (11 : Fin 78) (9 : Fin 78)
    (41 : Fin 78) (2 : Fin 78) (76 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3687` (kalmanson). -/
theorem middleSource_h3687 :
    ((!((allOneRankAtom (sourceRanks P) 9 == allOneRankAtom (sourceRanks P) 39)) || ((allOneRankAtom (sourceRanks P) 11).ult (allOneRankAtom (sourceRanks P) 41)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (41 : Fin 78) (9 : Fin 78)
    (11 : Fin 78) (39 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (10 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (39 : Fin 78) (11 : Fin 78) (9 : Fin 78)
    (41 : Fin 78) (2 : Fin 78) (76 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3688` (kalmanson). -/
theorem middleSource_h3688 :
    ((!((allOneRankAtom (sourceRanks P) 41 == allOneRankAtom (sourceRanks P) 39)) || ((allOneRankAtom (sourceRanks P) 11).ult (allOneRankAtom (sourceRanks P) 9)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (9 : Fin 78) (41 : Fin 78)
    (11 : Fin 78) (39 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (10 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (39 : Fin 78) (11 : Fin 78) (9 : Fin 78)
    (41 : Fin 78) (2 : Fin 78) (76 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3689` (kalmanson). -/
theorem middleSource_h3689 :
    ((!((allOneRankAtom (sourceRanks P) 10 == allOneRankAtom (sourceRanks P) 2)) || ((allOneRankAtom (sourceRanks P) 77).ult (allOneRankAtom (sourceRanks P) 41)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (41 : Fin 78) (10 : Fin 78)
    (77 : Fin 78) (2 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (11 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (40 : Fin 78) (11 : Fin 78) (10 : Fin 78)
    (41 : Fin 78) (2 : Fin 78) (77 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3690` (kalmanson). -/
theorem middleSource_h3690 :
    ((!((allOneRankAtom (sourceRanks P) 10 == allOneRankAtom (sourceRanks P) 77)) || ((allOneRankAtom (sourceRanks P) 2).ult (allOneRankAtom (sourceRanks P) 41)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (41 : Fin 78) (10 : Fin 78)
    (2 : Fin 78) (77 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (11 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (40 : Fin 78) (11 : Fin 78) (10 : Fin 78)
    (41 : Fin 78) (2 : Fin 78) (77 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3691` (kalmanson). -/
theorem middleSource_h3691 :
    ((!((allOneRankAtom (sourceRanks P) 41 == allOneRankAtom (sourceRanks P) 2)) || ((allOneRankAtom (sourceRanks P) 77).ult (allOneRankAtom (sourceRanks P) 10)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (10 : Fin 78) (41 : Fin 78)
    (77 : Fin 78) (2 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (11 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (40 : Fin 78) (11 : Fin 78) (10 : Fin 78)
    (41 : Fin 78) (2 : Fin 78) (77 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3692` (kalmanson). -/
theorem middleSource_h3692 :
    ((!((allOneRankAtom (sourceRanks P) 10 == allOneRankAtom (sourceRanks P) 40)) || ((allOneRankAtom (sourceRanks P) 11).ult (allOneRankAtom (sourceRanks P) 41)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (41 : Fin 78) (10 : Fin 78)
    (11 : Fin 78) (40 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (11 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (40 : Fin 78) (11 : Fin 78) (10 : Fin 78)
    (41 : Fin 78) (2 : Fin 78) (77 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3693` (kalmanson). -/
theorem middleSource_h3693 :
    ((!((allOneRankAtom (sourceRanks P) 41 == allOneRankAtom (sourceRanks P) 40)) || ((allOneRankAtom (sourceRanks P) 11).ult (allOneRankAtom (sourceRanks P) 10)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (10 : Fin 78) (41 : Fin 78)
    (11 : Fin 78) (40 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (11 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (40 : Fin 78) (11 : Fin 78) (10 : Fin 78)
    (41 : Fin 78) (2 : Fin 78) (77 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3694` (kalmanson). -/
theorem middleSource_h3694 :
    ((!((allOneRankAtom (sourceRanks P) 4 == allOneRankAtom (sourceRanks P) 3)) || ((allOneRankAtom (sourceRanks P) 50).ult (allOneRankAtom (sourceRanks P) 43)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (43 : Fin 78) (4 : Fin 78)
    (50 : Fin 78) (3 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (5 : Fin 13) (6 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (5 : Fin 78) (4 : Fin 78)
    (43 : Fin 78) (3 : Fin 78) (50 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3695` (kalmanson). -/
theorem middleSource_h3695 :
    ((!((allOneRankAtom (sourceRanks P) 4 == allOneRankAtom (sourceRanks P) 50)) || ((allOneRankAtom (sourceRanks P) 3).ult (allOneRankAtom (sourceRanks P) 43)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (43 : Fin 78) (4 : Fin 78)
    (3 : Fin 78) (50 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (5 : Fin 13) (6 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (5 : Fin 78) (4 : Fin 78)
    (43 : Fin 78) (3 : Fin 78) (50 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3696` (kalmanson). -/
theorem middleSource_h3696 :
    ((!((allOneRankAtom (sourceRanks P) 43 == allOneRankAtom (sourceRanks P) 3)) || ((allOneRankAtom (sourceRanks P) 50).ult (allOneRankAtom (sourceRanks P) 4)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (4 : Fin 78) (43 : Fin 78)
    (50 : Fin 78) (3 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (5 : Fin 13) (6 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (5 : Fin 78) (4 : Fin 78)
    (43 : Fin 78) (3 : Fin 78) (50 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3697` (kalmanson). -/
theorem middleSource_h3697 :
    ((!((allOneRankAtom (sourceRanks P) 43 == allOneRankAtom (sourceRanks P) 50)) || ((allOneRankAtom (sourceRanks P) 3).ult (allOneRankAtom (sourceRanks P) 4)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (4 : Fin 78) (43 : Fin 78)
    (3 : Fin 78) (50 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (5 : Fin 13) (6 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (5 : Fin 78) (4 : Fin 78)
    (43 : Fin 78) (3 : Fin 78) (50 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3698` (kalmanson). -/
theorem middleSource_h3698 :
    ((!((allOneRankAtom (sourceRanks P) 4 == allOneRankAtom (sourceRanks P) 5)) || ((allOneRankAtom (sourceRanks P) 42).ult (allOneRankAtom (sourceRanks P) 43)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (43 : Fin 78) (4 : Fin 78)
    (42 : Fin 78) (5 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (5 : Fin 13) (6 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (5 : Fin 78) (4 : Fin 78)
    (43 : Fin 78) (3 : Fin 78) (50 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3699` (kalmanson). -/
theorem middleSource_h3699 :
    ((!((allOneRankAtom (sourceRanks P) 4 == allOneRankAtom (sourceRanks P) 42)) || ((allOneRankAtom (sourceRanks P) 5).ult (allOneRankAtom (sourceRanks P) 43)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (43 : Fin 78) (4 : Fin 78)
    (5 : Fin 78) (42 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (5 : Fin 13) (6 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (5 : Fin 78) (4 : Fin 78)
    (43 : Fin 78) (3 : Fin 78) (50 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3700` (kalmanson). -/
theorem middleSource_h3700 :
    ((!((allOneRankAtom (sourceRanks P) 43 == allOneRankAtom (sourceRanks P) 5)) || ((allOneRankAtom (sourceRanks P) 42).ult (allOneRankAtom (sourceRanks P) 4)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (4 : Fin 78) (43 : Fin 78)
    (42 : Fin 78) (5 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (5 : Fin 13) (6 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (5 : Fin 78) (4 : Fin 78)
    (43 : Fin 78) (3 : Fin 78) (50 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3701` (kalmanson). -/
theorem middleSource_h3701 :
    ((!((allOneRankAtom (sourceRanks P) 43 == allOneRankAtom (sourceRanks P) 42)) || ((allOneRankAtom (sourceRanks P) 5).ult (allOneRankAtom (sourceRanks P) 4)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (4 : Fin 78) (43 : Fin 78)
    (5 : Fin 78) (42 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (5 : Fin 13) (6 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (5 : Fin 78) (4 : Fin 78)
    (43 : Fin 78) (3 : Fin 78) (50 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3702` (kalmanson). -/
theorem middleSource_h3702 :
    ((!((allOneRankAtom (sourceRanks P) 4 == allOneRankAtom (sourceRanks P) 3)) || ((allOneRankAtom (sourceRanks P) 51).ult (allOneRankAtom (sourceRanks P) 44)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (44 : Fin 78) (4 : Fin 78)
    (51 : Fin 78) (3 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (5 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (6 : Fin 78) (4 : Fin 78)
    (44 : Fin 78) (3 : Fin 78) (51 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3703` (kalmanson). -/
theorem middleSource_h3703 :
    ((!((allOneRankAtom (sourceRanks P) 4 == allOneRankAtom (sourceRanks P) 51)) || ((allOneRankAtom (sourceRanks P) 3).ult (allOneRankAtom (sourceRanks P) 44)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (44 : Fin 78) (4 : Fin 78)
    (3 : Fin 78) (51 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (5 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (6 : Fin 78) (4 : Fin 78)
    (44 : Fin 78) (3 : Fin 78) (51 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3704` (kalmanson). -/
theorem middleSource_h3704 :
    ((!((allOneRankAtom (sourceRanks P) 44 == allOneRankAtom (sourceRanks P) 3)) || ((allOneRankAtom (sourceRanks P) 51).ult (allOneRankAtom (sourceRanks P) 4)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (4 : Fin 78) (44 : Fin 78)
    (51 : Fin 78) (3 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (5 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (6 : Fin 78) (4 : Fin 78)
    (44 : Fin 78) (3 : Fin 78) (51 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3705` (kalmanson). -/
theorem middleSource_h3705 :
    ((!((allOneRankAtom (sourceRanks P) 44 == allOneRankAtom (sourceRanks P) 51)) || ((allOneRankAtom (sourceRanks P) 3).ult (allOneRankAtom (sourceRanks P) 4)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (4 : Fin 78) (44 : Fin 78)
    (3 : Fin 78) (51 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (5 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (6 : Fin 78) (4 : Fin 78)
    (44 : Fin 78) (3 : Fin 78) (51 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3706` (kalmanson). -/
theorem middleSource_h3706 :
    ((!((allOneRankAtom (sourceRanks P) 4 == allOneRankAtom (sourceRanks P) 6)) || ((allOneRankAtom (sourceRanks P) 42).ult (allOneRankAtom (sourceRanks P) 44)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (44 : Fin 78) (4 : Fin 78)
    (42 : Fin 78) (6 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (5 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (6 : Fin 78) (4 : Fin 78)
    (44 : Fin 78) (3 : Fin 78) (51 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3707` (kalmanson). -/
theorem middleSource_h3707 :
    ((!((allOneRankAtom (sourceRanks P) 4 == allOneRankAtom (sourceRanks P) 42)) || ((allOneRankAtom (sourceRanks P) 6).ult (allOneRankAtom (sourceRanks P) 44)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (44 : Fin 78) (4 : Fin 78)
    (6 : Fin 78) (42 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (5 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (6 : Fin 78) (4 : Fin 78)
    (44 : Fin 78) (3 : Fin 78) (51 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3708` (kalmanson). -/
theorem middleSource_h3708 :
    ((!((allOneRankAtom (sourceRanks P) 44 == allOneRankAtom (sourceRanks P) 6)) || ((allOneRankAtom (sourceRanks P) 42).ult (allOneRankAtom (sourceRanks P) 4)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (4 : Fin 78) (44 : Fin 78)
    (42 : Fin 78) (6 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (5 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (6 : Fin 78) (4 : Fin 78)
    (44 : Fin 78) (3 : Fin 78) (51 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3709` (kalmanson). -/
theorem middleSource_h3709 :
    ((!((allOneRankAtom (sourceRanks P) 44 == allOneRankAtom (sourceRanks P) 42)) || ((allOneRankAtom (sourceRanks P) 6).ult (allOneRankAtom (sourceRanks P) 4)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (4 : Fin 78) (44 : Fin 78)
    (6 : Fin 78) (42 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (5 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (6 : Fin 78) (4 : Fin 78)
    (44 : Fin 78) (3 : Fin 78) (51 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3710` (kalmanson). -/
theorem middleSource_h3710 :
    ((!((allOneRankAtom (sourceRanks P) 4 == allOneRankAtom (sourceRanks P) 3)) || ((allOneRankAtom (sourceRanks P) 52).ult (allOneRankAtom (sourceRanks P) 45)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (45 : Fin 78) (4 : Fin 78)
    (52 : Fin 78) (3 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (5 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (7 : Fin 78) (4 : Fin 78)
    (45 : Fin 78) (3 : Fin 78) (52 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3711` (kalmanson). -/
theorem middleSource_h3711 :
    ((!((allOneRankAtom (sourceRanks P) 4 == allOneRankAtom (sourceRanks P) 52)) || ((allOneRankAtom (sourceRanks P) 3).ult (allOneRankAtom (sourceRanks P) 45)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (45 : Fin 78) (4 : Fin 78)
    (3 : Fin 78) (52 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (5 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (7 : Fin 78) (4 : Fin 78)
    (45 : Fin 78) (3 : Fin 78) (52 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

end

end ATailExactFiveCard13AllOneSourceIngressScratch
end Problem97
