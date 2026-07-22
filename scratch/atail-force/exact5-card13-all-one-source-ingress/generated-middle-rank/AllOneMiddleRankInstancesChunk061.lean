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

/-- Candidate middle source assertion `h3904` (kalmanson). -/
theorem middleSource_h3904 :
    ((!((allOneRankAtom (sourceRanks P) 49 == allOneRankAtom (sourceRanks P) 3)) || ((allOneRankAtom (sourceRanks P) 77).ult (allOneRankAtom (sourceRanks P) 10)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (10 : Fin 78) (49 : Fin 78)
    (77 : Fin 78) (3 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (11 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (48 : Fin 78) (11 : Fin 78) (10 : Fin 78)
    (49 : Fin 78) (3 : Fin 78) (77 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3905` (kalmanson). -/
theorem middleSource_h3905 :
    ((!((allOneRankAtom (sourceRanks P) 10 == allOneRankAtom (sourceRanks P) 11)) || ((allOneRankAtom (sourceRanks P) 48).ult (allOneRankAtom (sourceRanks P) 49)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (49 : Fin 78) (10 : Fin 78)
    (48 : Fin 78) (11 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (11 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (48 : Fin 78) (11 : Fin 78) (10 : Fin 78)
    (49 : Fin 78) (3 : Fin 78) (77 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3906` (kalmanson). -/
theorem middleSource_h3906 :
    ((!((allOneRankAtom (sourceRanks P) 10 == allOneRankAtom (sourceRanks P) 48)) || ((allOneRankAtom (sourceRanks P) 11).ult (allOneRankAtom (sourceRanks P) 49)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (49 : Fin 78) (10 : Fin 78)
    (11 : Fin 78) (48 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (11 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (48 : Fin 78) (11 : Fin 78) (10 : Fin 78)
    (49 : Fin 78) (3 : Fin 78) (77 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3907` (kalmanson). -/
theorem middleSource_h3907 :
    ((!((allOneRankAtom (sourceRanks P) 49 == allOneRankAtom (sourceRanks P) 11)) || ((allOneRankAtom (sourceRanks P) 48).ult (allOneRankAtom (sourceRanks P) 10)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (10 : Fin 78) (49 : Fin 78)
    (48 : Fin 78) (11 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (11 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (48 : Fin 78) (11 : Fin 78) (10 : Fin 78)
    (49 : Fin 78) (3 : Fin 78) (77 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3908` (kalmanson). -/
theorem middleSource_h3908 :
    ((!((allOneRankAtom (sourceRanks P) 49 == allOneRankAtom (sourceRanks P) 48)) || ((allOneRankAtom (sourceRanks P) 11).ult (allOneRankAtom (sourceRanks P) 10)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (10 : Fin 78) (49 : Fin 78)
    (11 : Fin 78) (48 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (11 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (48 : Fin 78) (11 : Fin 78) (10 : Fin 78)
    (49 : Fin 78) (3 : Fin 78) (77 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3909` (kalmanson). -/
theorem middleSource_h3909 :
    ((!((allOneRankAtom (sourceRanks P) 5 == allOneRankAtom (sourceRanks P) 4)) || ((allOneRankAtom (sourceRanks P) 57).ult (allOneRankAtom (sourceRanks P) 51)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (51 : Fin 78) (5 : Fin 78)
    (57 : Fin 78) (4 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (5 : Fin 13) (6 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (6 : Fin 78) (5 : Fin 78)
    (51 : Fin 78) (4 : Fin 78) (57 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3910` (kalmanson). -/
theorem middleSource_h3910 :
    ((!((allOneRankAtom (sourceRanks P) 5 == allOneRankAtom (sourceRanks P) 57)) || ((allOneRankAtom (sourceRanks P) 4).ult (allOneRankAtom (sourceRanks P) 51)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (51 : Fin 78) (5 : Fin 78)
    (4 : Fin 78) (57 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (5 : Fin 13) (6 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (6 : Fin 78) (5 : Fin 78)
    (51 : Fin 78) (4 : Fin 78) (57 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3911` (kalmanson). -/
theorem middleSource_h3911 :
    ((!((allOneRankAtom (sourceRanks P) 51 == allOneRankAtom (sourceRanks P) 4)) || ((allOneRankAtom (sourceRanks P) 57).ult (allOneRankAtom (sourceRanks P) 5)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (5 : Fin 78) (51 : Fin 78)
    (57 : Fin 78) (4 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (5 : Fin 13) (6 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (6 : Fin 78) (5 : Fin 78)
    (51 : Fin 78) (4 : Fin 78) (57 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3912` (kalmanson). -/
theorem middleSource_h3912 :
    ((!((allOneRankAtom (sourceRanks P) 51 == allOneRankAtom (sourceRanks P) 57)) || ((allOneRankAtom (sourceRanks P) 4).ult (allOneRankAtom (sourceRanks P) 5)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (5 : Fin 78) (51 : Fin 78)
    (4 : Fin 78) (57 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (5 : Fin 13) (6 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (6 : Fin 78) (5 : Fin 78)
    (51 : Fin 78) (4 : Fin 78) (57 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3913` (kalmanson). -/
theorem middleSource_h3913 :
    ((!((allOneRankAtom (sourceRanks P) 5 == allOneRankAtom (sourceRanks P) 6)) || ((allOneRankAtom (sourceRanks P) 50).ult (allOneRankAtom (sourceRanks P) 51)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (51 : Fin 78) (5 : Fin 78)
    (50 : Fin 78) (6 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (5 : Fin 13) (6 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (6 : Fin 78) (5 : Fin 78)
    (51 : Fin 78) (4 : Fin 78) (57 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3914` (kalmanson). -/
theorem middleSource_h3914 :
    ((!((allOneRankAtom (sourceRanks P) 5 == allOneRankAtom (sourceRanks P) 50)) || ((allOneRankAtom (sourceRanks P) 6).ult (allOneRankAtom (sourceRanks P) 51)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (51 : Fin 78) (5 : Fin 78)
    (6 : Fin 78) (50 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (5 : Fin 13) (6 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (6 : Fin 78) (5 : Fin 78)
    (51 : Fin 78) (4 : Fin 78) (57 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3915` (kalmanson). -/
theorem middleSource_h3915 :
    ((!((allOneRankAtom (sourceRanks P) 51 == allOneRankAtom (sourceRanks P) 6)) || ((allOneRankAtom (sourceRanks P) 50).ult (allOneRankAtom (sourceRanks P) 5)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (5 : Fin 78) (51 : Fin 78)
    (50 : Fin 78) (6 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (5 : Fin 13) (6 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (6 : Fin 78) (5 : Fin 78)
    (51 : Fin 78) (4 : Fin 78) (57 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3916` (kalmanson). -/
theorem middleSource_h3916 :
    ((!((allOneRankAtom (sourceRanks P) 51 == allOneRankAtom (sourceRanks P) 50)) || ((allOneRankAtom (sourceRanks P) 6).ult (allOneRankAtom (sourceRanks P) 5)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (5 : Fin 78) (51 : Fin 78)
    (6 : Fin 78) (50 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (5 : Fin 13) (6 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (6 : Fin 78) (5 : Fin 78)
    (51 : Fin 78) (4 : Fin 78) (57 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3917` (kalmanson). -/
theorem middleSource_h3917 :
    ((!((allOneRankAtom (sourceRanks P) 5 == allOneRankAtom (sourceRanks P) 4)) || ((allOneRankAtom (sourceRanks P) 58).ult (allOneRankAtom (sourceRanks P) 52)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (52 : Fin 78) (5 : Fin 78)
    (58 : Fin 78) (4 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (5 : Fin 13) (6 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (7 : Fin 78) (5 : Fin 78)
    (52 : Fin 78) (4 : Fin 78) (58 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3918` (kalmanson). -/
theorem middleSource_h3918 :
    ((!((allOneRankAtom (sourceRanks P) 5 == allOneRankAtom (sourceRanks P) 58)) || ((allOneRankAtom (sourceRanks P) 4).ult (allOneRankAtom (sourceRanks P) 52)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (52 : Fin 78) (5 : Fin 78)
    (4 : Fin 78) (58 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (5 : Fin 13) (6 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (7 : Fin 78) (5 : Fin 78)
    (52 : Fin 78) (4 : Fin 78) (58 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3919` (kalmanson). -/
theorem middleSource_h3919 :
    ((!((allOneRankAtom (sourceRanks P) 52 == allOneRankAtom (sourceRanks P) 4)) || ((allOneRankAtom (sourceRanks P) 58).ult (allOneRankAtom (sourceRanks P) 5)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (5 : Fin 78) (52 : Fin 78)
    (58 : Fin 78) (4 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (5 : Fin 13) (6 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (7 : Fin 78) (5 : Fin 78)
    (52 : Fin 78) (4 : Fin 78) (58 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3920` (kalmanson). -/
theorem middleSource_h3920 :
    ((!((allOneRankAtom (sourceRanks P) 5 == allOneRankAtom (sourceRanks P) 7)) || ((allOneRankAtom (sourceRanks P) 50).ult (allOneRankAtom (sourceRanks P) 52)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (52 : Fin 78) (5 : Fin 78)
    (50 : Fin 78) (7 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (5 : Fin 13) (6 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (7 : Fin 78) (5 : Fin 78)
    (52 : Fin 78) (4 : Fin 78) (58 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3921` (kalmanson). -/
theorem middleSource_h3921 :
    ((!((allOneRankAtom (sourceRanks P) 5 == allOneRankAtom (sourceRanks P) 50)) || ((allOneRankAtom (sourceRanks P) 7).ult (allOneRankAtom (sourceRanks P) 52)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (52 : Fin 78) (5 : Fin 78)
    (7 : Fin 78) (50 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (5 : Fin 13) (6 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (7 : Fin 78) (5 : Fin 78)
    (52 : Fin 78) (4 : Fin 78) (58 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3922` (kalmanson). -/
theorem middleSource_h3922 :
    ((!((allOneRankAtom (sourceRanks P) 52 == allOneRankAtom (sourceRanks P) 7)) || ((allOneRankAtom (sourceRanks P) 50).ult (allOneRankAtom (sourceRanks P) 5)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (5 : Fin 78) (52 : Fin 78)
    (50 : Fin 78) (7 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (5 : Fin 13) (6 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (7 : Fin 78) (5 : Fin 78)
    (52 : Fin 78) (4 : Fin 78) (58 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3923` (kalmanson). -/
theorem middleSource_h3923 :
    ((!((allOneRankAtom (sourceRanks P) 52 == allOneRankAtom (sourceRanks P) 50)) || ((allOneRankAtom (sourceRanks P) 7).ult (allOneRankAtom (sourceRanks P) 5)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (5 : Fin 78) (52 : Fin 78)
    (7 : Fin 78) (50 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (5 : Fin 13) (6 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (7 : Fin 78) (5 : Fin 78)
    (52 : Fin 78) (4 : Fin 78) (58 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3924` (kalmanson). -/
theorem middleSource_h3924 :
    ((!((allOneRankAtom (sourceRanks P) 5 == allOneRankAtom (sourceRanks P) 4)) || ((allOneRankAtom (sourceRanks P) 59).ult (allOneRankAtom (sourceRanks P) 53)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (53 : Fin 78) (5 : Fin 78)
    (59 : Fin 78) (4 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (5 : Fin 13) (6 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (8 : Fin 78) (5 : Fin 78)
    (53 : Fin 78) (4 : Fin 78) (59 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3925` (kalmanson). -/
theorem middleSource_h3925 :
    ((!((allOneRankAtom (sourceRanks P) 5 == allOneRankAtom (sourceRanks P) 59)) || ((allOneRankAtom (sourceRanks P) 4).ult (allOneRankAtom (sourceRanks P) 53)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (53 : Fin 78) (5 : Fin 78)
    (4 : Fin 78) (59 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (5 : Fin 13) (6 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (8 : Fin 78) (5 : Fin 78)
    (53 : Fin 78) (4 : Fin 78) (59 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3926` (kalmanson). -/
theorem middleSource_h3926 :
    ((!((allOneRankAtom (sourceRanks P) 53 == allOneRankAtom (sourceRanks P) 4)) || ((allOneRankAtom (sourceRanks P) 59).ult (allOneRankAtom (sourceRanks P) 5)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (5 : Fin 78) (53 : Fin 78)
    (59 : Fin 78) (4 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (5 : Fin 13) (6 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (8 : Fin 78) (5 : Fin 78)
    (53 : Fin 78) (4 : Fin 78) (59 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3927` (kalmanson). -/
theorem middleSource_h3927 :
    ((!((allOneRankAtom (sourceRanks P) 53 == allOneRankAtom (sourceRanks P) 59)) || ((allOneRankAtom (sourceRanks P) 4).ult (allOneRankAtom (sourceRanks P) 5)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (5 : Fin 78) (53 : Fin 78)
    (4 : Fin 78) (59 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (5 : Fin 13) (6 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (8 : Fin 78) (5 : Fin 78)
    (53 : Fin 78) (4 : Fin 78) (59 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3928` (kalmanson). -/
theorem middleSource_h3928 :
    ((!((allOneRankAtom (sourceRanks P) 5 == allOneRankAtom (sourceRanks P) 8)) || ((allOneRankAtom (sourceRanks P) 50).ult (allOneRankAtom (sourceRanks P) 53)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (53 : Fin 78) (5 : Fin 78)
    (50 : Fin 78) (8 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (5 : Fin 13) (6 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (8 : Fin 78) (5 : Fin 78)
    (53 : Fin 78) (4 : Fin 78) (59 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3929` (kalmanson). -/
theorem middleSource_h3929 :
    ((!((allOneRankAtom (sourceRanks P) 5 == allOneRankAtom (sourceRanks P) 50)) || ((allOneRankAtom (sourceRanks P) 8).ult (allOneRankAtom (sourceRanks P) 53)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (53 : Fin 78) (5 : Fin 78)
    (8 : Fin 78) (50 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (5 : Fin 13) (6 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (8 : Fin 78) (5 : Fin 78)
    (53 : Fin 78) (4 : Fin 78) (59 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3930` (kalmanson). -/
theorem middleSource_h3930 :
    ((!((allOneRankAtom (sourceRanks P) 53 == allOneRankAtom (sourceRanks P) 8)) || ((allOneRankAtom (sourceRanks P) 50).ult (allOneRankAtom (sourceRanks P) 5)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (5 : Fin 78) (53 : Fin 78)
    (50 : Fin 78) (8 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (5 : Fin 13) (6 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (8 : Fin 78) (5 : Fin 78)
    (53 : Fin 78) (4 : Fin 78) (59 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3931` (kalmanson). -/
theorem middleSource_h3931 :
    ((!((allOneRankAtom (sourceRanks P) 53 == allOneRankAtom (sourceRanks P) 50)) || ((allOneRankAtom (sourceRanks P) 8).ult (allOneRankAtom (sourceRanks P) 5)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (5 : Fin 78) (53 : Fin 78)
    (8 : Fin 78) (50 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (5 : Fin 13) (6 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (8 : Fin 78) (5 : Fin 78)
    (53 : Fin 78) (4 : Fin 78) (59 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3932` (kalmanson). -/
theorem middleSource_h3932 :
    ((!((allOneRankAtom (sourceRanks P) 5 == allOneRankAtom (sourceRanks P) 4)) || ((allOneRankAtom (sourceRanks P) 60).ult (allOneRankAtom (sourceRanks P) 54)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (54 : Fin 78) (5 : Fin 78)
    (60 : Fin 78) (4 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (5 : Fin 13) (6 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (9 : Fin 78) (5 : Fin 78)
    (54 : Fin 78) (4 : Fin 78) (60 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3933` (kalmanson). -/
theorem middleSource_h3933 :
    ((!((allOneRankAtom (sourceRanks P) 5 == allOneRankAtom (sourceRanks P) 60)) || ((allOneRankAtom (sourceRanks P) 4).ult (allOneRankAtom (sourceRanks P) 54)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (54 : Fin 78) (5 : Fin 78)
    (4 : Fin 78) (60 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (5 : Fin 13) (6 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (9 : Fin 78) (5 : Fin 78)
    (54 : Fin 78) (4 : Fin 78) (60 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3934` (kalmanson). -/
theorem middleSource_h3934 :
    ((!((allOneRankAtom (sourceRanks P) 54 == allOneRankAtom (sourceRanks P) 4)) || ((allOneRankAtom (sourceRanks P) 60).ult (allOneRankAtom (sourceRanks P) 5)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (5 : Fin 78) (54 : Fin 78)
    (60 : Fin 78) (4 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (5 : Fin 13) (6 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (9 : Fin 78) (5 : Fin 78)
    (54 : Fin 78) (4 : Fin 78) (60 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3935` (kalmanson). -/
theorem middleSource_h3935 :
    ((!((allOneRankAtom (sourceRanks P) 54 == allOneRankAtom (sourceRanks P) 60)) || ((allOneRankAtom (sourceRanks P) 4).ult (allOneRankAtom (sourceRanks P) 5)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (5 : Fin 78) (54 : Fin 78)
    (4 : Fin 78) (60 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (5 : Fin 13) (6 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (9 : Fin 78) (5 : Fin 78)
    (54 : Fin 78) (4 : Fin 78) (60 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3936` (kalmanson). -/
theorem middleSource_h3936 :
    ((!((allOneRankAtom (sourceRanks P) 5 == allOneRankAtom (sourceRanks P) 9)) || ((allOneRankAtom (sourceRanks P) 50).ult (allOneRankAtom (sourceRanks P) 54)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (54 : Fin 78) (5 : Fin 78)
    (50 : Fin 78) (9 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (5 : Fin 13) (6 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (9 : Fin 78) (5 : Fin 78)
    (54 : Fin 78) (4 : Fin 78) (60 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3937` (kalmanson). -/
theorem middleSource_h3937 :
    ((!((allOneRankAtom (sourceRanks P) 5 == allOneRankAtom (sourceRanks P) 50)) || ((allOneRankAtom (sourceRanks P) 9).ult (allOneRankAtom (sourceRanks P) 54)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (54 : Fin 78) (5 : Fin 78)
    (9 : Fin 78) (50 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (5 : Fin 13) (6 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (9 : Fin 78) (5 : Fin 78)
    (54 : Fin 78) (4 : Fin 78) (60 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3938` (kalmanson). -/
theorem middleSource_h3938 :
    ((!((allOneRankAtom (sourceRanks P) 54 == allOneRankAtom (sourceRanks P) 9)) || ((allOneRankAtom (sourceRanks P) 50).ult (allOneRankAtom (sourceRanks P) 5)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (5 : Fin 78) (54 : Fin 78)
    (50 : Fin 78) (9 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (5 : Fin 13) (6 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (9 : Fin 78) (5 : Fin 78)
    (54 : Fin 78) (4 : Fin 78) (60 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3939` (kalmanson). -/
theorem middleSource_h3939 :
    ((!((allOneRankAtom (sourceRanks P) 54 == allOneRankAtom (sourceRanks P) 50)) || ((allOneRankAtom (sourceRanks P) 9).ult (allOneRankAtom (sourceRanks P) 5)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (5 : Fin 78) (54 : Fin 78)
    (9 : Fin 78) (50 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (5 : Fin 13) (6 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (9 : Fin 78) (5 : Fin 78)
    (54 : Fin 78) (4 : Fin 78) (60 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3940` (kalmanson). -/
theorem middleSource_h3940 :
    ((!((allOneRankAtom (sourceRanks P) 5 == allOneRankAtom (sourceRanks P) 4)) || ((allOneRankAtom (sourceRanks P) 61).ult (allOneRankAtom (sourceRanks P) 55)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (55 : Fin 78) (5 : Fin 78)
    (61 : Fin 78) (4 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (5 : Fin 13) (6 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (10 : Fin 78) (5 : Fin 78)
    (55 : Fin 78) (4 : Fin 78) (61 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3941` (kalmanson). -/
theorem middleSource_h3941 :
    ((!((allOneRankAtom (sourceRanks P) 5 == allOneRankAtom (sourceRanks P) 61)) || ((allOneRankAtom (sourceRanks P) 4).ult (allOneRankAtom (sourceRanks P) 55)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (55 : Fin 78) (5 : Fin 78)
    (4 : Fin 78) (61 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (5 : Fin 13) (6 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (10 : Fin 78) (5 : Fin 78)
    (55 : Fin 78) (4 : Fin 78) (61 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3942` (kalmanson). -/
theorem middleSource_h3942 :
    ((!((allOneRankAtom (sourceRanks P) 55 == allOneRankAtom (sourceRanks P) 4)) || ((allOneRankAtom (sourceRanks P) 61).ult (allOneRankAtom (sourceRanks P) 5)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (5 : Fin 78) (55 : Fin 78)
    (61 : Fin 78) (4 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (5 : Fin 13) (6 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (10 : Fin 78) (5 : Fin 78)
    (55 : Fin 78) (4 : Fin 78) (61 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3943` (kalmanson). -/
theorem middleSource_h3943 :
    ((!((allOneRankAtom (sourceRanks P) 55 == allOneRankAtom (sourceRanks P) 61)) || ((allOneRankAtom (sourceRanks P) 4).ult (allOneRankAtom (sourceRanks P) 5)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (5 : Fin 78) (55 : Fin 78)
    (4 : Fin 78) (61 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (5 : Fin 13) (6 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (10 : Fin 78) (5 : Fin 78)
    (55 : Fin 78) (4 : Fin 78) (61 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3944` (kalmanson). -/
theorem middleSource_h3944 :
    ((!((allOneRankAtom (sourceRanks P) 5 == allOneRankAtom (sourceRanks P) 10)) || ((allOneRankAtom (sourceRanks P) 50).ult (allOneRankAtom (sourceRanks P) 55)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (55 : Fin 78) (5 : Fin 78)
    (50 : Fin 78) (10 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (5 : Fin 13) (6 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (10 : Fin 78) (5 : Fin 78)
    (55 : Fin 78) (4 : Fin 78) (61 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3945` (kalmanson). -/
theorem middleSource_h3945 :
    ((!((allOneRankAtom (sourceRanks P) 5 == allOneRankAtom (sourceRanks P) 50)) || ((allOneRankAtom (sourceRanks P) 10).ult (allOneRankAtom (sourceRanks P) 55)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (55 : Fin 78) (5 : Fin 78)
    (10 : Fin 78) (50 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (5 : Fin 13) (6 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (10 : Fin 78) (5 : Fin 78)
    (55 : Fin 78) (4 : Fin 78) (61 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3946` (kalmanson). -/
theorem middleSource_h3946 :
    ((!((allOneRankAtom (sourceRanks P) 55 == allOneRankAtom (sourceRanks P) 10)) || ((allOneRankAtom (sourceRanks P) 50).ult (allOneRankAtom (sourceRanks P) 5)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (5 : Fin 78) (55 : Fin 78)
    (50 : Fin 78) (10 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (5 : Fin 13) (6 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (10 : Fin 78) (5 : Fin 78)
    (55 : Fin 78) (4 : Fin 78) (61 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3947` (kalmanson). -/
theorem middleSource_h3947 :
    ((!((allOneRankAtom (sourceRanks P) 55 == allOneRankAtom (sourceRanks P) 50)) || ((allOneRankAtom (sourceRanks P) 10).ult (allOneRankAtom (sourceRanks P) 5)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (5 : Fin 78) (55 : Fin 78)
    (10 : Fin 78) (50 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (5 : Fin 13) (6 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (10 : Fin 78) (5 : Fin 78)
    (55 : Fin 78) (4 : Fin 78) (61 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3948` (kalmanson). -/
theorem middleSource_h3948 :
    ((!((allOneRankAtom (sourceRanks P) 5 == allOneRankAtom (sourceRanks P) 4)) || ((allOneRankAtom (sourceRanks P) 62).ult (allOneRankAtom (sourceRanks P) 56)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (56 : Fin 78) (5 : Fin 78)
    (62 : Fin 78) (4 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (5 : Fin 13) (6 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (11 : Fin 78) (5 : Fin 78)
    (56 : Fin 78) (4 : Fin 78) (62 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3949` (kalmanson). -/
theorem middleSource_h3949 :
    ((!((allOneRankAtom (sourceRanks P) 5 == allOneRankAtom (sourceRanks P) 62)) || ((allOneRankAtom (sourceRanks P) 4).ult (allOneRankAtom (sourceRanks P) 56)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (56 : Fin 78) (5 : Fin 78)
    (4 : Fin 78) (62 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (5 : Fin 13) (6 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (11 : Fin 78) (5 : Fin 78)
    (56 : Fin 78) (4 : Fin 78) (62 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3950` (kalmanson). -/
theorem middleSource_h3950 :
    ((!((allOneRankAtom (sourceRanks P) 56 == allOneRankAtom (sourceRanks P) 4)) || ((allOneRankAtom (sourceRanks P) 62).ult (allOneRankAtom (sourceRanks P) 5)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (5 : Fin 78) (56 : Fin 78)
    (62 : Fin 78) (4 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (5 : Fin 13) (6 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (11 : Fin 78) (5 : Fin 78)
    (56 : Fin 78) (4 : Fin 78) (62 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3951` (kalmanson). -/
theorem middleSource_h3951 :
    ((!((allOneRankAtom (sourceRanks P) 56 == allOneRankAtom (sourceRanks P) 62)) || ((allOneRankAtom (sourceRanks P) 4).ult (allOneRankAtom (sourceRanks P) 5)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (5 : Fin 78) (56 : Fin 78)
    (4 : Fin 78) (62 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (5 : Fin 13) (6 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (11 : Fin 78) (5 : Fin 78)
    (56 : Fin 78) (4 : Fin 78) (62 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3952` (kalmanson). -/
theorem middleSource_h3952 :
    ((!((allOneRankAtom (sourceRanks P) 5 == allOneRankAtom (sourceRanks P) 11)) || ((allOneRankAtom (sourceRanks P) 50).ult (allOneRankAtom (sourceRanks P) 56)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (56 : Fin 78) (5 : Fin 78)
    (50 : Fin 78) (11 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (5 : Fin 13) (6 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (11 : Fin 78) (5 : Fin 78)
    (56 : Fin 78) (4 : Fin 78) (62 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3953` (kalmanson). -/
theorem middleSource_h3953 :
    ((!((allOneRankAtom (sourceRanks P) 5 == allOneRankAtom (sourceRanks P) 50)) || ((allOneRankAtom (sourceRanks P) 11).ult (allOneRankAtom (sourceRanks P) 56)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (56 : Fin 78) (5 : Fin 78)
    (11 : Fin 78) (50 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (5 : Fin 13) (6 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (11 : Fin 78) (5 : Fin 78)
    (56 : Fin 78) (4 : Fin 78) (62 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3954` (kalmanson). -/
theorem middleSource_h3954 :
    ((!((allOneRankAtom (sourceRanks P) 56 == allOneRankAtom (sourceRanks P) 11)) || ((allOneRankAtom (sourceRanks P) 50).ult (allOneRankAtom (sourceRanks P) 5)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (5 : Fin 78) (56 : Fin 78)
    (50 : Fin 78) (11 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (5 : Fin 13) (6 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (11 : Fin 78) (5 : Fin 78)
    (56 : Fin 78) (4 : Fin 78) (62 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3955` (kalmanson). -/
theorem middleSource_h3955 :
    ((!((allOneRankAtom (sourceRanks P) 56 == allOneRankAtom (sourceRanks P) 50)) || ((allOneRankAtom (sourceRanks P) 11).ult (allOneRankAtom (sourceRanks P) 5)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (5 : Fin 78) (56 : Fin 78)
    (11 : Fin 78) (50 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (5 : Fin 13) (6 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (11 : Fin 78) (5 : Fin 78)
    (56 : Fin 78) (4 : Fin 78) (62 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3956` (kalmanson). -/
theorem middleSource_h3956 :
    ((!((allOneRankAtom (sourceRanks P) 6 == allOneRankAtom (sourceRanks P) 4)) || ((allOneRankAtom (sourceRanks P) 63).ult (allOneRankAtom (sourceRanks P) 52)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (52 : Fin 78) (6 : Fin 78)
    (63 : Fin 78) (4 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (5 : Fin 13) (7 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (51 : Fin 78) (7 : Fin 78) (6 : Fin 78)
    (52 : Fin 78) (4 : Fin 78) (63 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3957` (kalmanson). -/
theorem middleSource_h3957 :
    ((!((allOneRankAtom (sourceRanks P) 52 == allOneRankAtom (sourceRanks P) 4)) || ((allOneRankAtom (sourceRanks P) 63).ult (allOneRankAtom (sourceRanks P) 6)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (6 : Fin 78) (52 : Fin 78)
    (63 : Fin 78) (4 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (5 : Fin 13) (7 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (51 : Fin 78) (7 : Fin 78) (6 : Fin 78)
    (52 : Fin 78) (4 : Fin 78) (63 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3958` (kalmanson). -/
theorem middleSource_h3958 :
    ((!((allOneRankAtom (sourceRanks P) 52 == allOneRankAtom (sourceRanks P) 63)) || ((allOneRankAtom (sourceRanks P) 4).ult (allOneRankAtom (sourceRanks P) 6)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (6 : Fin 78) (52 : Fin 78)
    (4 : Fin 78) (63 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (5 : Fin 13) (7 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (51 : Fin 78) (7 : Fin 78) (6 : Fin 78)
    (52 : Fin 78) (4 : Fin 78) (63 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3959` (kalmanson). -/
theorem middleSource_h3959 :
    ((!((allOneRankAtom (sourceRanks P) 6 == allOneRankAtom (sourceRanks P) 7)) || ((allOneRankAtom (sourceRanks P) 51).ult (allOneRankAtom (sourceRanks P) 52)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (52 : Fin 78) (6 : Fin 78)
    (51 : Fin 78) (7 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (5 : Fin 13) (7 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (51 : Fin 78) (7 : Fin 78) (6 : Fin 78)
    (52 : Fin 78) (4 : Fin 78) (63 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3960` (kalmanson). -/
theorem middleSource_h3960 :
    ((!((allOneRankAtom (sourceRanks P) 6 == allOneRankAtom (sourceRanks P) 51)) || ((allOneRankAtom (sourceRanks P) 7).ult (allOneRankAtom (sourceRanks P) 52)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (52 : Fin 78) (6 : Fin 78)
    (7 : Fin 78) (51 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (5 : Fin 13) (7 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (51 : Fin 78) (7 : Fin 78) (6 : Fin 78)
    (52 : Fin 78) (4 : Fin 78) (63 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3961` (kalmanson). -/
theorem middleSource_h3961 :
    ((!((allOneRankAtom (sourceRanks P) 52 == allOneRankAtom (sourceRanks P) 7)) || ((allOneRankAtom (sourceRanks P) 51).ult (allOneRankAtom (sourceRanks P) 6)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (6 : Fin 78) (52 : Fin 78)
    (51 : Fin 78) (7 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (5 : Fin 13) (7 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (51 : Fin 78) (7 : Fin 78) (6 : Fin 78)
    (52 : Fin 78) (4 : Fin 78) (63 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3962` (kalmanson). -/
theorem middleSource_h3962 :
    ((!((allOneRankAtom (sourceRanks P) 52 == allOneRankAtom (sourceRanks P) 51)) || ((allOneRankAtom (sourceRanks P) 7).ult (allOneRankAtom (sourceRanks P) 6)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (6 : Fin 78) (52 : Fin 78)
    (7 : Fin 78) (51 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (5 : Fin 13) (7 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (51 : Fin 78) (7 : Fin 78) (6 : Fin 78)
    (52 : Fin 78) (4 : Fin 78) (63 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3963` (kalmanson). -/
theorem middleSource_h3963 :
    ((!((allOneRankAtom (sourceRanks P) 6 == allOneRankAtom (sourceRanks P) 4)) || ((allOneRankAtom (sourceRanks P) 64).ult (allOneRankAtom (sourceRanks P) 53)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (53 : Fin 78) (6 : Fin 78)
    (64 : Fin 78) (4 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (5 : Fin 13) (7 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (51 : Fin 78) (8 : Fin 78) (6 : Fin 78)
    (53 : Fin 78) (4 : Fin 78) (64 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3964` (kalmanson). -/
theorem middleSource_h3964 :
    ((!((allOneRankAtom (sourceRanks P) 53 == allOneRankAtom (sourceRanks P) 4)) || ((allOneRankAtom (sourceRanks P) 64).ult (allOneRankAtom (sourceRanks P) 6)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (6 : Fin 78) (53 : Fin 78)
    (64 : Fin 78) (4 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (5 : Fin 13) (7 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (51 : Fin 78) (8 : Fin 78) (6 : Fin 78)
    (53 : Fin 78) (4 : Fin 78) (64 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3965` (kalmanson). -/
theorem middleSource_h3965 :
    ((!((allOneRankAtom (sourceRanks P) 53 == allOneRankAtom (sourceRanks P) 64)) || ((allOneRankAtom (sourceRanks P) 4).ult (allOneRankAtom (sourceRanks P) 6)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (6 : Fin 78) (53 : Fin 78)
    (4 : Fin 78) (64 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (5 : Fin 13) (7 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (51 : Fin 78) (8 : Fin 78) (6 : Fin 78)
    (53 : Fin 78) (4 : Fin 78) (64 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3966` (kalmanson). -/
theorem middleSource_h3966 :
    ((!((allOneRankAtom (sourceRanks P) 6 == allOneRankAtom (sourceRanks P) 8)) || ((allOneRankAtom (sourceRanks P) 51).ult (allOneRankAtom (sourceRanks P) 53)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (53 : Fin 78) (6 : Fin 78)
    (51 : Fin 78) (8 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (5 : Fin 13) (7 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (51 : Fin 78) (8 : Fin 78) (6 : Fin 78)
    (53 : Fin 78) (4 : Fin 78) (64 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3967` (kalmanson). -/
theorem middleSource_h3967 :
    ((!((allOneRankAtom (sourceRanks P) 6 == allOneRankAtom (sourceRanks P) 51)) || ((allOneRankAtom (sourceRanks P) 8).ult (allOneRankAtom (sourceRanks P) 53)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (53 : Fin 78) (6 : Fin 78)
    (8 : Fin 78) (51 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (5 : Fin 13) (7 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (51 : Fin 78) (8 : Fin 78) (6 : Fin 78)
    (53 : Fin 78) (4 : Fin 78) (64 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

end

end ATailExactFiveCard13AllOneSourceIngressScratch
end Problem97
