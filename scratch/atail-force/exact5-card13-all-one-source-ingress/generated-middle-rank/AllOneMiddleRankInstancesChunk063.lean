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

/-- Candidate middle source assertion `h4032` (kalmanson). -/
theorem middleSource_h4032 :
    ((!((allOneRankAtom (sourceRanks P) 8 == allOneRankAtom (sourceRanks P) 4)) || ((allOneRankAtom (sourceRanks P) 74).ult (allOneRankAtom (sourceRanks P) 56)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (56 : Fin 78) (8 : Fin 78)
    (74 : Fin 78) (4 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (5 : Fin 13) (9 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (53 : Fin 78) (11 : Fin 78) (8 : Fin 78)
    (56 : Fin 78) (4 : Fin 78) (74 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4033` (kalmanson). -/
theorem middleSource_h4033 :
    ((!((allOneRankAtom (sourceRanks P) 8 == allOneRankAtom (sourceRanks P) 74)) || ((allOneRankAtom (sourceRanks P) 4).ult (allOneRankAtom (sourceRanks P) 56)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (56 : Fin 78) (8 : Fin 78)
    (4 : Fin 78) (74 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (5 : Fin 13) (9 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (53 : Fin 78) (11 : Fin 78) (8 : Fin 78)
    (56 : Fin 78) (4 : Fin 78) (74 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4034` (kalmanson). -/
theorem middleSource_h4034 :
    ((!((allOneRankAtom (sourceRanks P) 56 == allOneRankAtom (sourceRanks P) 4)) || ((allOneRankAtom (sourceRanks P) 74).ult (allOneRankAtom (sourceRanks P) 8)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (8 : Fin 78) (56 : Fin 78)
    (74 : Fin 78) (4 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (5 : Fin 13) (9 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (53 : Fin 78) (11 : Fin 78) (8 : Fin 78)
    (56 : Fin 78) (4 : Fin 78) (74 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4035` (kalmanson). -/
theorem middleSource_h4035 :
    ((!((allOneRankAtom (sourceRanks P) 56 == allOneRankAtom (sourceRanks P) 74)) || ((allOneRankAtom (sourceRanks P) 4).ult (allOneRankAtom (sourceRanks P) 8)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (8 : Fin 78) (56 : Fin 78)
    (4 : Fin 78) (74 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (5 : Fin 13) (9 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (53 : Fin 78) (11 : Fin 78) (8 : Fin 78)
    (56 : Fin 78) (4 : Fin 78) (74 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4036` (kalmanson). -/
theorem middleSource_h4036 :
    ((!((allOneRankAtom (sourceRanks P) 8 == allOneRankAtom (sourceRanks P) 11)) || ((allOneRankAtom (sourceRanks P) 53).ult (allOneRankAtom (sourceRanks P) 56)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (56 : Fin 78) (8 : Fin 78)
    (53 : Fin 78) (11 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (5 : Fin 13) (9 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (53 : Fin 78) (11 : Fin 78) (8 : Fin 78)
    (56 : Fin 78) (4 : Fin 78) (74 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4037` (kalmanson). -/
theorem middleSource_h4037 :
    ((!((allOneRankAtom (sourceRanks P) 8 == allOneRankAtom (sourceRanks P) 53)) || ((allOneRankAtom (sourceRanks P) 11).ult (allOneRankAtom (sourceRanks P) 56)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (56 : Fin 78) (8 : Fin 78)
    (11 : Fin 78) (53 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (5 : Fin 13) (9 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (53 : Fin 78) (11 : Fin 78) (8 : Fin 78)
    (56 : Fin 78) (4 : Fin 78) (74 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4038` (kalmanson). -/
theorem middleSource_h4038 :
    ((!((allOneRankAtom (sourceRanks P) 56 == allOneRankAtom (sourceRanks P) 53)) || ((allOneRankAtom (sourceRanks P) 11).ult (allOneRankAtom (sourceRanks P) 8)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (8 : Fin 78) (56 : Fin 78)
    (11 : Fin 78) (53 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (5 : Fin 13) (9 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (53 : Fin 78) (11 : Fin 78) (8 : Fin 78)
    (56 : Fin 78) (4 : Fin 78) (74 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4039` (kalmanson). -/
theorem middleSource_h4039 :
    ((!((allOneRankAtom (sourceRanks P) 9 == allOneRankAtom (sourceRanks P) 4)) || ((allOneRankAtom (sourceRanks P) 75).ult (allOneRankAtom (sourceRanks P) 55)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (55 : Fin 78) (9 : Fin 78)
    (75 : Fin 78) (4 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (5 : Fin 13) (10 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (54 : Fin 78) (10 : Fin 78) (9 : Fin 78)
    (55 : Fin 78) (4 : Fin 78) (75 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4040` (kalmanson). -/
theorem middleSource_h4040 :
    ((!((allOneRankAtom (sourceRanks P) 9 == allOneRankAtom (sourceRanks P) 75)) || ((allOneRankAtom (sourceRanks P) 4).ult (allOneRankAtom (sourceRanks P) 55)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (55 : Fin 78) (9 : Fin 78)
    (4 : Fin 78) (75 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (5 : Fin 13) (10 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (54 : Fin 78) (10 : Fin 78) (9 : Fin 78)
    (55 : Fin 78) (4 : Fin 78) (75 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4041` (kalmanson). -/
theorem middleSource_h4041 :
    ((!((allOneRankAtom (sourceRanks P) 55 == allOneRankAtom (sourceRanks P) 4)) || ((allOneRankAtom (sourceRanks P) 75).ult (allOneRankAtom (sourceRanks P) 9)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (9 : Fin 78) (55 : Fin 78)
    (75 : Fin 78) (4 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (5 : Fin 13) (10 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (54 : Fin 78) (10 : Fin 78) (9 : Fin 78)
    (55 : Fin 78) (4 : Fin 78) (75 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4042` (kalmanson). -/
theorem middleSource_h4042 :
    ((!((allOneRankAtom (sourceRanks P) 55 == allOneRankAtom (sourceRanks P) 75)) || ((allOneRankAtom (sourceRanks P) 4).ult (allOneRankAtom (sourceRanks P) 9)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (9 : Fin 78) (55 : Fin 78)
    (4 : Fin 78) (75 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (5 : Fin 13) (10 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (54 : Fin 78) (10 : Fin 78) (9 : Fin 78)
    (55 : Fin 78) (4 : Fin 78) (75 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4043` (kalmanson). -/
theorem middleSource_h4043 :
    ((!((allOneRankAtom (sourceRanks P) 9 == allOneRankAtom (sourceRanks P) 10)) || ((allOneRankAtom (sourceRanks P) 54).ult (allOneRankAtom (sourceRanks P) 55)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (55 : Fin 78) (9 : Fin 78)
    (54 : Fin 78) (10 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (5 : Fin 13) (10 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (54 : Fin 78) (10 : Fin 78) (9 : Fin 78)
    (55 : Fin 78) (4 : Fin 78) (75 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4044` (kalmanson). -/
theorem middleSource_h4044 :
    ((!((allOneRankAtom (sourceRanks P) 9 == allOneRankAtom (sourceRanks P) 54)) || ((allOneRankAtom (sourceRanks P) 10).ult (allOneRankAtom (sourceRanks P) 55)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (55 : Fin 78) (9 : Fin 78)
    (10 : Fin 78) (54 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (5 : Fin 13) (10 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (54 : Fin 78) (10 : Fin 78) (9 : Fin 78)
    (55 : Fin 78) (4 : Fin 78) (75 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4045` (kalmanson). -/
theorem middleSource_h4045 :
    ((!((allOneRankAtom (sourceRanks P) 55 == allOneRankAtom (sourceRanks P) 10)) || ((allOneRankAtom (sourceRanks P) 54).ult (allOneRankAtom (sourceRanks P) 9)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (9 : Fin 78) (55 : Fin 78)
    (54 : Fin 78) (10 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (5 : Fin 13) (10 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (54 : Fin 78) (10 : Fin 78) (9 : Fin 78)
    (55 : Fin 78) (4 : Fin 78) (75 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4046` (kalmanson). -/
theorem middleSource_h4046 :
    ((!((allOneRankAtom (sourceRanks P) 55 == allOneRankAtom (sourceRanks P) 54)) || ((allOneRankAtom (sourceRanks P) 10).ult (allOneRankAtom (sourceRanks P) 9)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (9 : Fin 78) (55 : Fin 78)
    (10 : Fin 78) (54 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (5 : Fin 13) (10 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (54 : Fin 78) (10 : Fin 78) (9 : Fin 78)
    (55 : Fin 78) (4 : Fin 78) (75 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4047` (kalmanson). -/
theorem middleSource_h4047 :
    ((!((allOneRankAtom (sourceRanks P) 9 == allOneRankAtom (sourceRanks P) 4)) || ((allOneRankAtom (sourceRanks P) 76).ult (allOneRankAtom (sourceRanks P) 56)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (56 : Fin 78) (9 : Fin 78)
    (76 : Fin 78) (4 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (5 : Fin 13) (10 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (54 : Fin 78) (11 : Fin 78) (9 : Fin 78)
    (56 : Fin 78) (4 : Fin 78) (76 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4048` (kalmanson). -/
theorem middleSource_h4048 :
    ((!((allOneRankAtom (sourceRanks P) 9 == allOneRankAtom (sourceRanks P) 76)) || ((allOneRankAtom (sourceRanks P) 4).ult (allOneRankAtom (sourceRanks P) 56)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (56 : Fin 78) (9 : Fin 78)
    (4 : Fin 78) (76 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (5 : Fin 13) (10 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (54 : Fin 78) (11 : Fin 78) (9 : Fin 78)
    (56 : Fin 78) (4 : Fin 78) (76 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4049` (kalmanson). -/
theorem middleSource_h4049 :
    ((!((allOneRankAtom (sourceRanks P) 56 == allOneRankAtom (sourceRanks P) 4)) || ((allOneRankAtom (sourceRanks P) 76).ult (allOneRankAtom (sourceRanks P) 9)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (9 : Fin 78) (56 : Fin 78)
    (76 : Fin 78) (4 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (5 : Fin 13) (10 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (54 : Fin 78) (11 : Fin 78) (9 : Fin 78)
    (56 : Fin 78) (4 : Fin 78) (76 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4050` (kalmanson). -/
theorem middleSource_h4050 :
    ((!((allOneRankAtom (sourceRanks P) 56 == allOneRankAtom (sourceRanks P) 76)) || ((allOneRankAtom (sourceRanks P) 4).ult (allOneRankAtom (sourceRanks P) 9)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (9 : Fin 78) (56 : Fin 78)
    (4 : Fin 78) (76 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (5 : Fin 13) (10 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (54 : Fin 78) (11 : Fin 78) (9 : Fin 78)
    (56 : Fin 78) (4 : Fin 78) (76 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4051` (kalmanson). -/
theorem middleSource_h4051 :
    ((!((allOneRankAtom (sourceRanks P) 9 == allOneRankAtom (sourceRanks P) 11)) || ((allOneRankAtom (sourceRanks P) 54).ult (allOneRankAtom (sourceRanks P) 56)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (56 : Fin 78) (9 : Fin 78)
    (54 : Fin 78) (11 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (5 : Fin 13) (10 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (54 : Fin 78) (11 : Fin 78) (9 : Fin 78)
    (56 : Fin 78) (4 : Fin 78) (76 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4052` (kalmanson). -/
theorem middleSource_h4052 :
    ((!((allOneRankAtom (sourceRanks P) 9 == allOneRankAtom (sourceRanks P) 54)) || ((allOneRankAtom (sourceRanks P) 11).ult (allOneRankAtom (sourceRanks P) 56)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (56 : Fin 78) (9 : Fin 78)
    (11 : Fin 78) (54 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (5 : Fin 13) (10 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (54 : Fin 78) (11 : Fin 78) (9 : Fin 78)
    (56 : Fin 78) (4 : Fin 78) (76 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4053` (kalmanson). -/
theorem middleSource_h4053 :
    ((!((allOneRankAtom (sourceRanks P) 56 == allOneRankAtom (sourceRanks P) 54)) || ((allOneRankAtom (sourceRanks P) 11).ult (allOneRankAtom (sourceRanks P) 9)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (9 : Fin 78) (56 : Fin 78)
    (11 : Fin 78) (54 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (5 : Fin 13) (10 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (54 : Fin 78) (11 : Fin 78) (9 : Fin 78)
    (56 : Fin 78) (4 : Fin 78) (76 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4054` (kalmanson). -/
theorem middleSource_h4054 :
    ((!((allOneRankAtom (sourceRanks P) 10 == allOneRankAtom (sourceRanks P) 4)) || ((allOneRankAtom (sourceRanks P) 77).ult (allOneRankAtom (sourceRanks P) 56)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (56 : Fin 78) (10 : Fin 78)
    (77 : Fin 78) (4 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (5 : Fin 13) (11 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (55 : Fin 78) (11 : Fin 78) (10 : Fin 78)
    (56 : Fin 78) (4 : Fin 78) (77 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4055` (kalmanson). -/
theorem middleSource_h4055 :
    ((!((allOneRankAtom (sourceRanks P) 10 == allOneRankAtom (sourceRanks P) 77)) || ((allOneRankAtom (sourceRanks P) 4).ult (allOneRankAtom (sourceRanks P) 56)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (56 : Fin 78) (10 : Fin 78)
    (4 : Fin 78) (77 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (5 : Fin 13) (11 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (55 : Fin 78) (11 : Fin 78) (10 : Fin 78)
    (56 : Fin 78) (4 : Fin 78) (77 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4056` (kalmanson). -/
theorem middleSource_h4056 :
    ((!((allOneRankAtom (sourceRanks P) 56 == allOneRankAtom (sourceRanks P) 4)) || ((allOneRankAtom (sourceRanks P) 77).ult (allOneRankAtom (sourceRanks P) 10)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (10 : Fin 78) (56 : Fin 78)
    (77 : Fin 78) (4 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (5 : Fin 13) (11 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (55 : Fin 78) (11 : Fin 78) (10 : Fin 78)
    (56 : Fin 78) (4 : Fin 78) (77 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4057` (kalmanson). -/
theorem middleSource_h4057 :
    ((!((allOneRankAtom (sourceRanks P) 10 == allOneRankAtom (sourceRanks P) 55)) || ((allOneRankAtom (sourceRanks P) 11).ult (allOneRankAtom (sourceRanks P) 56)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (56 : Fin 78) (10 : Fin 78)
    (11 : Fin 78) (55 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (5 : Fin 13) (11 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (55 : Fin 78) (11 : Fin 78) (10 : Fin 78)
    (56 : Fin 78) (4 : Fin 78) (77 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4058` (kalmanson). -/
theorem middleSource_h4058 :
    ((!((allOneRankAtom (sourceRanks P) 56 == allOneRankAtom (sourceRanks P) 55)) || ((allOneRankAtom (sourceRanks P) 11).ult (allOneRankAtom (sourceRanks P) 10)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (10 : Fin 78) (56 : Fin 78)
    (11 : Fin 78) (55 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (5 : Fin 13) (11 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (55 : Fin 78) (11 : Fin 78) (10 : Fin 78)
    (56 : Fin 78) (4 : Fin 78) (77 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4059` (kalmanson). -/
theorem middleSource_h4059 :
    ((!((allOneRankAtom (sourceRanks P) 6 == allOneRankAtom (sourceRanks P) 5)) || ((allOneRankAtom (sourceRanks P) 63).ult (allOneRankAtom (sourceRanks P) 58)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (58 : Fin 78) (6 : Fin 78)
    (63 : Fin 78) (5 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (6 : Fin 13) (7 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (7 : Fin 78) (6 : Fin 78)
    (58 : Fin 78) (5 : Fin 78) (63 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4060` (kalmanson). -/
theorem middleSource_h4060 :
    ((!((allOneRankAtom (sourceRanks P) 58 == allOneRankAtom (sourceRanks P) 5)) || ((allOneRankAtom (sourceRanks P) 63).ult (allOneRankAtom (sourceRanks P) 6)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (6 : Fin 78) (58 : Fin 78)
    (63 : Fin 78) (5 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (6 : Fin 13) (7 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (7 : Fin 78) (6 : Fin 78)
    (58 : Fin 78) (5 : Fin 78) (63 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4061` (kalmanson). -/
theorem middleSource_h4061 :
    ((!((allOneRankAtom (sourceRanks P) 6 == allOneRankAtom (sourceRanks P) 7)) || ((allOneRankAtom (sourceRanks P) 57).ult (allOneRankAtom (sourceRanks P) 58)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (58 : Fin 78) (6 : Fin 78)
    (57 : Fin 78) (7 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (6 : Fin 13) (7 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (7 : Fin 78) (6 : Fin 78)
    (58 : Fin 78) (5 : Fin 78) (63 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4062` (kalmanson). -/
theorem middleSource_h4062 :
    ((!((allOneRankAtom (sourceRanks P) 6 == allOneRankAtom (sourceRanks P) 57)) || ((allOneRankAtom (sourceRanks P) 7).ult (allOneRankAtom (sourceRanks P) 58)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (58 : Fin 78) (6 : Fin 78)
    (7 : Fin 78) (57 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (6 : Fin 13) (7 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (7 : Fin 78) (6 : Fin 78)
    (58 : Fin 78) (5 : Fin 78) (63 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4063` (kalmanson). -/
theorem middleSource_h4063 :
    ((!((allOneRankAtom (sourceRanks P) 58 == allOneRankAtom (sourceRanks P) 7)) || ((allOneRankAtom (sourceRanks P) 57).ult (allOneRankAtom (sourceRanks P) 6)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (6 : Fin 78) (58 : Fin 78)
    (57 : Fin 78) (7 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (6 : Fin 13) (7 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (7 : Fin 78) (6 : Fin 78)
    (58 : Fin 78) (5 : Fin 78) (63 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4064` (kalmanson). -/
theorem middleSource_h4064 :
    ((!((allOneRankAtom (sourceRanks P) 58 == allOneRankAtom (sourceRanks P) 57)) || ((allOneRankAtom (sourceRanks P) 7).ult (allOneRankAtom (sourceRanks P) 6)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (6 : Fin 78) (58 : Fin 78)
    (7 : Fin 78) (57 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (6 : Fin 13) (7 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (7 : Fin 78) (6 : Fin 78)
    (58 : Fin 78) (5 : Fin 78) (63 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4065` (kalmanson). -/
theorem middleSource_h4065 :
    ((!((allOneRankAtom (sourceRanks P) 6 == allOneRankAtom (sourceRanks P) 5)) || ((allOneRankAtom (sourceRanks P) 64).ult (allOneRankAtom (sourceRanks P) 59)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (59 : Fin 78) (6 : Fin 78)
    (64 : Fin 78) (5 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (6 : Fin 13) (7 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (8 : Fin 78) (6 : Fin 78)
    (59 : Fin 78) (5 : Fin 78) (64 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4066` (kalmanson). -/
theorem middleSource_h4066 :
    ((!((allOneRankAtom (sourceRanks P) 59 == allOneRankAtom (sourceRanks P) 5)) || ((allOneRankAtom (sourceRanks P) 64).ult (allOneRankAtom (sourceRanks P) 6)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (6 : Fin 78) (59 : Fin 78)
    (64 : Fin 78) (5 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (6 : Fin 13) (7 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (8 : Fin 78) (6 : Fin 78)
    (59 : Fin 78) (5 : Fin 78) (64 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4067` (kalmanson). -/
theorem middleSource_h4067 :
    ((!((allOneRankAtom (sourceRanks P) 59 == allOneRankAtom (sourceRanks P) 64)) || ((allOneRankAtom (sourceRanks P) 5).ult (allOneRankAtom (sourceRanks P) 6)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (6 : Fin 78) (59 : Fin 78)
    (5 : Fin 78) (64 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (6 : Fin 13) (7 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (8 : Fin 78) (6 : Fin 78)
    (59 : Fin 78) (5 : Fin 78) (64 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4068` (kalmanson). -/
theorem middleSource_h4068 :
    ((!((allOneRankAtom (sourceRanks P) 6 == allOneRankAtom (sourceRanks P) 8)) || ((allOneRankAtom (sourceRanks P) 57).ult (allOneRankAtom (sourceRanks P) 59)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (59 : Fin 78) (6 : Fin 78)
    (57 : Fin 78) (8 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (6 : Fin 13) (7 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (8 : Fin 78) (6 : Fin 78)
    (59 : Fin 78) (5 : Fin 78) (64 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4069` (kalmanson). -/
theorem middleSource_h4069 :
    ((!((allOneRankAtom (sourceRanks P) 6 == allOneRankAtom (sourceRanks P) 57)) || ((allOneRankAtom (sourceRanks P) 8).ult (allOneRankAtom (sourceRanks P) 59)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (59 : Fin 78) (6 : Fin 78)
    (8 : Fin 78) (57 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (6 : Fin 13) (7 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (8 : Fin 78) (6 : Fin 78)
    (59 : Fin 78) (5 : Fin 78) (64 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4070` (kalmanson). -/
theorem middleSource_h4070 :
    ((!((allOneRankAtom (sourceRanks P) 59 == allOneRankAtom (sourceRanks P) 8)) || ((allOneRankAtom (sourceRanks P) 57).ult (allOneRankAtom (sourceRanks P) 6)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (6 : Fin 78) (59 : Fin 78)
    (57 : Fin 78) (8 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (6 : Fin 13) (7 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (8 : Fin 78) (6 : Fin 78)
    (59 : Fin 78) (5 : Fin 78) (64 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4071` (kalmanson). -/
theorem middleSource_h4071 :
    ((!((allOneRankAtom (sourceRanks P) 59 == allOneRankAtom (sourceRanks P) 57)) || ((allOneRankAtom (sourceRanks P) 8).ult (allOneRankAtom (sourceRanks P) 6)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (6 : Fin 78) (59 : Fin 78)
    (8 : Fin 78) (57 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (6 : Fin 13) (7 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (8 : Fin 78) (6 : Fin 78)
    (59 : Fin 78) (5 : Fin 78) (64 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4072` (kalmanson). -/
theorem middleSource_h4072 :
    ((!((allOneRankAtom (sourceRanks P) 6 == allOneRankAtom (sourceRanks P) 5)) || ((allOneRankAtom (sourceRanks P) 65).ult (allOneRankAtom (sourceRanks P) 60)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (60 : Fin 78) (6 : Fin 78)
    (65 : Fin 78) (5 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (6 : Fin 13) (7 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (9 : Fin 78) (6 : Fin 78)
    (60 : Fin 78) (5 : Fin 78) (65 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4073` (kalmanson). -/
theorem middleSource_h4073 :
    ((!((allOneRankAtom (sourceRanks P) 6 == allOneRankAtom (sourceRanks P) 65)) || ((allOneRankAtom (sourceRanks P) 5).ult (allOneRankAtom (sourceRanks P) 60)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (60 : Fin 78) (6 : Fin 78)
    (5 : Fin 78) (65 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (6 : Fin 13) (7 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (9 : Fin 78) (6 : Fin 78)
    (60 : Fin 78) (5 : Fin 78) (65 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4074` (kalmanson). -/
theorem middleSource_h4074 :
    ((!((allOneRankAtom (sourceRanks P) 60 == allOneRankAtom (sourceRanks P) 5)) || ((allOneRankAtom (sourceRanks P) 65).ult (allOneRankAtom (sourceRanks P) 6)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (6 : Fin 78) (60 : Fin 78)
    (65 : Fin 78) (5 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (6 : Fin 13) (7 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (9 : Fin 78) (6 : Fin 78)
    (60 : Fin 78) (5 : Fin 78) (65 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4075` (kalmanson). -/
theorem middleSource_h4075 :
    ((!((allOneRankAtom (sourceRanks P) 60 == allOneRankAtom (sourceRanks P) 65)) || ((allOneRankAtom (sourceRanks P) 5).ult (allOneRankAtom (sourceRanks P) 6)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (6 : Fin 78) (60 : Fin 78)
    (5 : Fin 78) (65 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (6 : Fin 13) (7 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (9 : Fin 78) (6 : Fin 78)
    (60 : Fin 78) (5 : Fin 78) (65 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4076` (kalmanson). -/
theorem middleSource_h4076 :
    ((!((allOneRankAtom (sourceRanks P) 6 == allOneRankAtom (sourceRanks P) 9)) || ((allOneRankAtom (sourceRanks P) 57).ult (allOneRankAtom (sourceRanks P) 60)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (60 : Fin 78) (6 : Fin 78)
    (57 : Fin 78) (9 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (6 : Fin 13) (7 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (9 : Fin 78) (6 : Fin 78)
    (60 : Fin 78) (5 : Fin 78) (65 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4077` (kalmanson). -/
theorem middleSource_h4077 :
    ((!((allOneRankAtom (sourceRanks P) 6 == allOneRankAtom (sourceRanks P) 57)) || ((allOneRankAtom (sourceRanks P) 9).ult (allOneRankAtom (sourceRanks P) 60)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (60 : Fin 78) (6 : Fin 78)
    (9 : Fin 78) (57 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (6 : Fin 13) (7 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (9 : Fin 78) (6 : Fin 78)
    (60 : Fin 78) (5 : Fin 78) (65 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4078` (kalmanson). -/
theorem middleSource_h4078 :
    ((!((allOneRankAtom (sourceRanks P) 60 == allOneRankAtom (sourceRanks P) 9)) || ((allOneRankAtom (sourceRanks P) 57).ult (allOneRankAtom (sourceRanks P) 6)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (6 : Fin 78) (60 : Fin 78)
    (57 : Fin 78) (9 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (6 : Fin 13) (7 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (9 : Fin 78) (6 : Fin 78)
    (60 : Fin 78) (5 : Fin 78) (65 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4079` (kalmanson). -/
theorem middleSource_h4079 :
    ((!((allOneRankAtom (sourceRanks P) 60 == allOneRankAtom (sourceRanks P) 57)) || ((allOneRankAtom (sourceRanks P) 9).ult (allOneRankAtom (sourceRanks P) 6)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (6 : Fin 78) (60 : Fin 78)
    (9 : Fin 78) (57 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (6 : Fin 13) (7 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (9 : Fin 78) (6 : Fin 78)
    (60 : Fin 78) (5 : Fin 78) (65 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4080` (kalmanson). -/
theorem middleSource_h4080 :
    ((!((allOneRankAtom (sourceRanks P) 6 == allOneRankAtom (sourceRanks P) 5)) || ((allOneRankAtom (sourceRanks P) 66).ult (allOneRankAtom (sourceRanks P) 61)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (61 : Fin 78) (6 : Fin 78)
    (66 : Fin 78) (5 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (6 : Fin 13) (7 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (10 : Fin 78) (6 : Fin 78)
    (61 : Fin 78) (5 : Fin 78) (66 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4081` (kalmanson). -/
theorem middleSource_h4081 :
    ((!((allOneRankAtom (sourceRanks P) 6 == allOneRankAtom (sourceRanks P) 66)) || ((allOneRankAtom (sourceRanks P) 5).ult (allOneRankAtom (sourceRanks P) 61)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (61 : Fin 78) (6 : Fin 78)
    (5 : Fin 78) (66 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (6 : Fin 13) (7 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (10 : Fin 78) (6 : Fin 78)
    (61 : Fin 78) (5 : Fin 78) (66 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4082` (kalmanson). -/
theorem middleSource_h4082 :
    ((!((allOneRankAtom (sourceRanks P) 61 == allOneRankAtom (sourceRanks P) 5)) || ((allOneRankAtom (sourceRanks P) 66).ult (allOneRankAtom (sourceRanks P) 6)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (6 : Fin 78) (61 : Fin 78)
    (66 : Fin 78) (5 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (6 : Fin 13) (7 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (10 : Fin 78) (6 : Fin 78)
    (61 : Fin 78) (5 : Fin 78) (66 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4083` (kalmanson). -/
theorem middleSource_h4083 :
    ((!((allOneRankAtom (sourceRanks P) 61 == allOneRankAtom (sourceRanks P) 66)) || ((allOneRankAtom (sourceRanks P) 5).ult (allOneRankAtom (sourceRanks P) 6)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (6 : Fin 78) (61 : Fin 78)
    (5 : Fin 78) (66 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (6 : Fin 13) (7 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (10 : Fin 78) (6 : Fin 78)
    (61 : Fin 78) (5 : Fin 78) (66 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4084` (kalmanson). -/
theorem middleSource_h4084 :
    ((!((allOneRankAtom (sourceRanks P) 6 == allOneRankAtom (sourceRanks P) 10)) || ((allOneRankAtom (sourceRanks P) 57).ult (allOneRankAtom (sourceRanks P) 61)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (61 : Fin 78) (6 : Fin 78)
    (57 : Fin 78) (10 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (6 : Fin 13) (7 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (10 : Fin 78) (6 : Fin 78)
    (61 : Fin 78) (5 : Fin 78) (66 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4085` (kalmanson). -/
theorem middleSource_h4085 :
    ((!((allOneRankAtom (sourceRanks P) 6 == allOneRankAtom (sourceRanks P) 57)) || ((allOneRankAtom (sourceRanks P) 10).ult (allOneRankAtom (sourceRanks P) 61)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (61 : Fin 78) (6 : Fin 78)
    (10 : Fin 78) (57 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (6 : Fin 13) (7 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (10 : Fin 78) (6 : Fin 78)
    (61 : Fin 78) (5 : Fin 78) (66 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4086` (kalmanson). -/
theorem middleSource_h4086 :
    ((!((allOneRankAtom (sourceRanks P) 61 == allOneRankAtom (sourceRanks P) 10)) || ((allOneRankAtom (sourceRanks P) 57).ult (allOneRankAtom (sourceRanks P) 6)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (6 : Fin 78) (61 : Fin 78)
    (57 : Fin 78) (10 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (6 : Fin 13) (7 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (10 : Fin 78) (6 : Fin 78)
    (61 : Fin 78) (5 : Fin 78) (66 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4087` (kalmanson). -/
theorem middleSource_h4087 :
    ((!((allOneRankAtom (sourceRanks P) 61 == allOneRankAtom (sourceRanks P) 57)) || ((allOneRankAtom (sourceRanks P) 10).ult (allOneRankAtom (sourceRanks P) 6)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (6 : Fin 78) (61 : Fin 78)
    (10 : Fin 78) (57 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (6 : Fin 13) (7 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (10 : Fin 78) (6 : Fin 78)
    (61 : Fin 78) (5 : Fin 78) (66 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4088` (kalmanson). -/
theorem middleSource_h4088 :
    ((!((allOneRankAtom (sourceRanks P) 6 == allOneRankAtom (sourceRanks P) 5)) || ((allOneRankAtom (sourceRanks P) 67).ult (allOneRankAtom (sourceRanks P) 62)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (62 : Fin 78) (6 : Fin 78)
    (67 : Fin 78) (5 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (6 : Fin 13) (7 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (11 : Fin 78) (6 : Fin 78)
    (62 : Fin 78) (5 : Fin 78) (67 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4089` (kalmanson). -/
theorem middleSource_h4089 :
    ((!((allOneRankAtom (sourceRanks P) 62 == allOneRankAtom (sourceRanks P) 5)) || ((allOneRankAtom (sourceRanks P) 67).ult (allOneRankAtom (sourceRanks P) 6)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (6 : Fin 78) (62 : Fin 78)
    (67 : Fin 78) (5 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (6 : Fin 13) (7 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (11 : Fin 78) (6 : Fin 78)
    (62 : Fin 78) (5 : Fin 78) (67 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4090` (kalmanson). -/
theorem middleSource_h4090 :
    ((!((allOneRankAtom (sourceRanks P) 6 == allOneRankAtom (sourceRanks P) 11)) || ((allOneRankAtom (sourceRanks P) 57).ult (allOneRankAtom (sourceRanks P) 62)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (62 : Fin 78) (6 : Fin 78)
    (57 : Fin 78) (11 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (6 : Fin 13) (7 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (11 : Fin 78) (6 : Fin 78)
    (62 : Fin 78) (5 : Fin 78) (67 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4091` (kalmanson). -/
theorem middleSource_h4091 :
    ((!((allOneRankAtom (sourceRanks P) 6 == allOneRankAtom (sourceRanks P) 57)) || ((allOneRankAtom (sourceRanks P) 11).ult (allOneRankAtom (sourceRanks P) 62)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (62 : Fin 78) (6 : Fin 78)
    (11 : Fin 78) (57 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (6 : Fin 13) (7 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (11 : Fin 78) (6 : Fin 78)
    (62 : Fin 78) (5 : Fin 78) (67 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4092` (kalmanson). -/
theorem middleSource_h4092 :
    ((!((allOneRankAtom (sourceRanks P) 62 == allOneRankAtom (sourceRanks P) 57)) || ((allOneRankAtom (sourceRanks P) 11).ult (allOneRankAtom (sourceRanks P) 6)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (6 : Fin 78) (62 : Fin 78)
    (11 : Fin 78) (57 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (6 : Fin 13) (7 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (11 : Fin 78) (6 : Fin 78)
    (62 : Fin 78) (5 : Fin 78) (67 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4093` (kalmanson). -/
theorem middleSource_h4093 :
    ((!((allOneRankAtom (sourceRanks P) 7 == allOneRankAtom (sourceRanks P) 5)) || ((allOneRankAtom (sourceRanks P) 68).ult (allOneRankAtom (sourceRanks P) 59)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (59 : Fin 78) (7 : Fin 78)
    (68 : Fin 78) (5 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (6 : Fin 13) (8 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (58 : Fin 78) (8 : Fin 78) (7 : Fin 78)
    (59 : Fin 78) (5 : Fin 78) (68 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4094` (kalmanson). -/
theorem middleSource_h4094 :
    ((!((allOneRankAtom (sourceRanks P) 59 == allOneRankAtom (sourceRanks P) 5)) || ((allOneRankAtom (sourceRanks P) 68).ult (allOneRankAtom (sourceRanks P) 7)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (7 : Fin 78) (59 : Fin 78)
    (68 : Fin 78) (5 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (6 : Fin 13) (8 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (58 : Fin 78) (8 : Fin 78) (7 : Fin 78)
    (59 : Fin 78) (5 : Fin 78) (68 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4095` (kalmanson). -/
theorem middleSource_h4095 :
    ((!((allOneRankAtom (sourceRanks P) 59 == allOneRankAtom (sourceRanks P) 68)) || ((allOneRankAtom (sourceRanks P) 5).ult (allOneRankAtom (sourceRanks P) 7)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (7 : Fin 78) (59 : Fin 78)
    (5 : Fin 78) (68 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (6 : Fin 13) (8 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (58 : Fin 78) (8 : Fin 78) (7 : Fin 78)
    (59 : Fin 78) (5 : Fin 78) (68 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

end

end ATailExactFiveCard13AllOneSourceIngressScratch
end Problem97
