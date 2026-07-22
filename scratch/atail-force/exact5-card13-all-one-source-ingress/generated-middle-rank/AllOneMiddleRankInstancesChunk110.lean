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

/-- Candidate middle source assertion `h7040` (kalmanson). -/
theorem middleSource_h7040 :
    ((!((allOneRankAtom (sourceRanks P) 55 == allOneRankAtom (sourceRanks P) 70)) || ((allOneRankAtom (sourceRanks P) 56).ult (allOneRankAtom (sourceRanks P) 71)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (71 : Fin 78) (55 : Fin 78)
    (56 : Fin 78) (70 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (8 : Fin 13) (11 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (70 : Fin 78) (56 : Fin 78) (55 : Fin 78)
    (71 : Fin 78) (52 : Fin 78) (77 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h7041` (kalmanson). -/
theorem middleSource_h7041 :
    ((!((allOneRankAtom (sourceRanks P) 71 == allOneRankAtom (sourceRanks P) 56)) || ((allOneRankAtom (sourceRanks P) 70).ult (allOneRankAtom (sourceRanks P) 55)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (55 : Fin 78) (71 : Fin 78)
    (70 : Fin 78) (56 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (8 : Fin 13) (11 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (70 : Fin 78) (56 : Fin 78) (55 : Fin 78)
    (71 : Fin 78) (52 : Fin 78) (77 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h7042` (kalmanson). -/
theorem middleSource_h7042 :
    ((!((allOneRankAtom (sourceRanks P) 54 == allOneRankAtom (sourceRanks P) 53)) || ((allOneRankAtom (sourceRanks P) 75).ult (allOneRankAtom (sourceRanks P) 73)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (73 : Fin 78) (54 : Fin 78)
    (75 : Fin 78) (53 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (9 : Fin 13) (10 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (72 : Fin 78) (55 : Fin 78) (54 : Fin 78)
    (73 : Fin 78) (53 : Fin 78) (75 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h7043` (kalmanson). -/
theorem middleSource_h7043 :
    ((!((allOneRankAtom (sourceRanks P) 54 == allOneRankAtom (sourceRanks P) 75)) || ((allOneRankAtom (sourceRanks P) 53).ult (allOneRankAtom (sourceRanks P) 73)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (73 : Fin 78) (54 : Fin 78)
    (53 : Fin 78) (75 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (9 : Fin 13) (10 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (72 : Fin 78) (55 : Fin 78) (54 : Fin 78)
    (73 : Fin 78) (53 : Fin 78) (75 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h7044` (kalmanson). -/
theorem middleSource_h7044 :
    ((!((allOneRankAtom (sourceRanks P) 73 == allOneRankAtom (sourceRanks P) 53)) || ((allOneRankAtom (sourceRanks P) 75).ult (allOneRankAtom (sourceRanks P) 54)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (54 : Fin 78) (73 : Fin 78)
    (75 : Fin 78) (53 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (9 : Fin 13) (10 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (72 : Fin 78) (55 : Fin 78) (54 : Fin 78)
    (73 : Fin 78) (53 : Fin 78) (75 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h7045` (kalmanson). -/
theorem middleSource_h7045 :
    ((!((allOneRankAtom (sourceRanks P) 73 == allOneRankAtom (sourceRanks P) 75)) || ((allOneRankAtom (sourceRanks P) 53).ult (allOneRankAtom (sourceRanks P) 54)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (54 : Fin 78) (73 : Fin 78)
    (53 : Fin 78) (75 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (9 : Fin 13) (10 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (72 : Fin 78) (55 : Fin 78) (54 : Fin 78)
    (73 : Fin 78) (53 : Fin 78) (75 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h7046` (kalmanson). -/
theorem middleSource_h7046 :
    ((!((allOneRankAtom (sourceRanks P) 54 == allOneRankAtom (sourceRanks P) 55)) || ((allOneRankAtom (sourceRanks P) 72).ult (allOneRankAtom (sourceRanks P) 73)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (73 : Fin 78) (54 : Fin 78)
    (72 : Fin 78) (55 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (9 : Fin 13) (10 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (72 : Fin 78) (55 : Fin 78) (54 : Fin 78)
    (73 : Fin 78) (53 : Fin 78) (75 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h7047` (kalmanson). -/
theorem middleSource_h7047 :
    ((!((allOneRankAtom (sourceRanks P) 54 == allOneRankAtom (sourceRanks P) 72)) || ((allOneRankAtom (sourceRanks P) 55).ult (allOneRankAtom (sourceRanks P) 73)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (73 : Fin 78) (54 : Fin 78)
    (55 : Fin 78) (72 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (9 : Fin 13) (10 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (72 : Fin 78) (55 : Fin 78) (54 : Fin 78)
    (73 : Fin 78) (53 : Fin 78) (75 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h7048` (kalmanson). -/
theorem middleSource_h7048 :
    ((!((allOneRankAtom (sourceRanks P) 73 == allOneRankAtom (sourceRanks P) 55)) || ((allOneRankAtom (sourceRanks P) 72).ult (allOneRankAtom (sourceRanks P) 54)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (54 : Fin 78) (73 : Fin 78)
    (72 : Fin 78) (55 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (9 : Fin 13) (10 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (72 : Fin 78) (55 : Fin 78) (54 : Fin 78)
    (73 : Fin 78) (53 : Fin 78) (75 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h7049` (kalmanson). -/
theorem middleSource_h7049 :
    ((!((allOneRankAtom (sourceRanks P) 73 == allOneRankAtom (sourceRanks P) 72)) || ((allOneRankAtom (sourceRanks P) 55).ult (allOneRankAtom (sourceRanks P) 54)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (54 : Fin 78) (73 : Fin 78)
    (55 : Fin 78) (72 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (9 : Fin 13) (10 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (72 : Fin 78) (55 : Fin 78) (54 : Fin 78)
    (73 : Fin 78) (53 : Fin 78) (75 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h7050` (kalmanson). -/
theorem middleSource_h7050 :
    ((!((allOneRankAtom (sourceRanks P) 54 == allOneRankAtom (sourceRanks P) 53)) || ((allOneRankAtom (sourceRanks P) 76).ult (allOneRankAtom (sourceRanks P) 74)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (74 : Fin 78) (54 : Fin 78)
    (76 : Fin 78) (53 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (9 : Fin 13) (10 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (72 : Fin 78) (56 : Fin 78) (54 : Fin 78)
    (74 : Fin 78) (53 : Fin 78) (76 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h7051` (kalmanson). -/
theorem middleSource_h7051 :
    ((!((allOneRankAtom (sourceRanks P) 54 == allOneRankAtom (sourceRanks P) 76)) || ((allOneRankAtom (sourceRanks P) 53).ult (allOneRankAtom (sourceRanks P) 74)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (74 : Fin 78) (54 : Fin 78)
    (53 : Fin 78) (76 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (9 : Fin 13) (10 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (72 : Fin 78) (56 : Fin 78) (54 : Fin 78)
    (74 : Fin 78) (53 : Fin 78) (76 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h7052` (kalmanson). -/
theorem middleSource_h7052 :
    ((!((allOneRankAtom (sourceRanks P) 74 == allOneRankAtom (sourceRanks P) 53)) || ((allOneRankAtom (sourceRanks P) 76).ult (allOneRankAtom (sourceRanks P) 54)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (54 : Fin 78) (74 : Fin 78)
    (76 : Fin 78) (53 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (9 : Fin 13) (10 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (72 : Fin 78) (56 : Fin 78) (54 : Fin 78)
    (74 : Fin 78) (53 : Fin 78) (76 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h7053` (kalmanson). -/
theorem middleSource_h7053 :
    ((!((allOneRankAtom (sourceRanks P) 54 == allOneRankAtom (sourceRanks P) 56)) || ((allOneRankAtom (sourceRanks P) 72).ult (allOneRankAtom (sourceRanks P) 74)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (74 : Fin 78) (54 : Fin 78)
    (72 : Fin 78) (56 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (9 : Fin 13) (10 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (72 : Fin 78) (56 : Fin 78) (54 : Fin 78)
    (74 : Fin 78) (53 : Fin 78) (76 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h7054` (kalmanson). -/
theorem middleSource_h7054 :
    ((!((allOneRankAtom (sourceRanks P) 54 == allOneRankAtom (sourceRanks P) 72)) || ((allOneRankAtom (sourceRanks P) 56).ult (allOneRankAtom (sourceRanks P) 74)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (74 : Fin 78) (54 : Fin 78)
    (56 : Fin 78) (72 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (9 : Fin 13) (10 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (72 : Fin 78) (56 : Fin 78) (54 : Fin 78)
    (74 : Fin 78) (53 : Fin 78) (76 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h7055` (kalmanson). -/
theorem middleSource_h7055 :
    ((!((allOneRankAtom (sourceRanks P) 74 == allOneRankAtom (sourceRanks P) 72)) || ((allOneRankAtom (sourceRanks P) 56).ult (allOneRankAtom (sourceRanks P) 54)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (54 : Fin 78) (74 : Fin 78)
    (56 : Fin 78) (72 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (9 : Fin 13) (10 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (72 : Fin 78) (56 : Fin 78) (54 : Fin 78)
    (74 : Fin 78) (53 : Fin 78) (76 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h7056` (kalmanson). -/
theorem middleSource_h7056 :
    ((!((allOneRankAtom (sourceRanks P) 55 == allOneRankAtom (sourceRanks P) 53)) || ((allOneRankAtom (sourceRanks P) 77).ult (allOneRankAtom (sourceRanks P) 74)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (74 : Fin 78) (55 : Fin 78)
    (77 : Fin 78) (53 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (9 : Fin 13) (11 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (73 : Fin 78) (56 : Fin 78) (55 : Fin 78)
    (74 : Fin 78) (53 : Fin 78) (77 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h7057` (kalmanson). -/
theorem middleSource_h7057 :
    ((!((allOneRankAtom (sourceRanks P) 55 == allOneRankAtom (sourceRanks P) 77)) || ((allOneRankAtom (sourceRanks P) 53).ult (allOneRankAtom (sourceRanks P) 74)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (74 : Fin 78) (55 : Fin 78)
    (53 : Fin 78) (77 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (9 : Fin 13) (11 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (73 : Fin 78) (56 : Fin 78) (55 : Fin 78)
    (74 : Fin 78) (53 : Fin 78) (77 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h7058` (kalmanson). -/
theorem middleSource_h7058 :
    ((!((allOneRankAtom (sourceRanks P) 74 == allOneRankAtom (sourceRanks P) 53)) || ((allOneRankAtom (sourceRanks P) 77).ult (allOneRankAtom (sourceRanks P) 55)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (55 : Fin 78) (74 : Fin 78)
    (77 : Fin 78) (53 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (9 : Fin 13) (11 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (73 : Fin 78) (56 : Fin 78) (55 : Fin 78)
    (74 : Fin 78) (53 : Fin 78) (77 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h7059` (kalmanson). -/
theorem middleSource_h7059 :
    ((!((allOneRankAtom (sourceRanks P) 55 == allOneRankAtom (sourceRanks P) 56)) || ((allOneRankAtom (sourceRanks P) 73).ult (allOneRankAtom (sourceRanks P) 74)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (74 : Fin 78) (55 : Fin 78)
    (73 : Fin 78) (56 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (9 : Fin 13) (11 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (73 : Fin 78) (56 : Fin 78) (55 : Fin 78)
    (74 : Fin 78) (53 : Fin 78) (77 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h7060` (kalmanson). -/
theorem middleSource_h7060 :
    ((!((allOneRankAtom (sourceRanks P) 55 == allOneRankAtom (sourceRanks P) 73)) || ((allOneRankAtom (sourceRanks P) 56).ult (allOneRankAtom (sourceRanks P) 74)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (74 : Fin 78) (55 : Fin 78)
    (56 : Fin 78) (73 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (9 : Fin 13) (11 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (73 : Fin 78) (56 : Fin 78) (55 : Fin 78)
    (74 : Fin 78) (53 : Fin 78) (77 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h7061` (kalmanson). -/
theorem middleSource_h7061 :
    ((!((allOneRankAtom (sourceRanks P) 74 == allOneRankAtom (sourceRanks P) 56)) || ((allOneRankAtom (sourceRanks P) 73).ult (allOneRankAtom (sourceRanks P) 55)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (55 : Fin 78) (74 : Fin 78)
    (73 : Fin 78) (56 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (9 : Fin 13) (11 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (73 : Fin 78) (56 : Fin 78) (55 : Fin 78)
    (74 : Fin 78) (53 : Fin 78) (77 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h7062` (kalmanson). -/
theorem middleSource_h7062 :
    ((!((allOneRankAtom (sourceRanks P) 74 == allOneRankAtom (sourceRanks P) 73)) || ((allOneRankAtom (sourceRanks P) 56).ult (allOneRankAtom (sourceRanks P) 55)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (55 : Fin 78) (74 : Fin 78)
    (56 : Fin 78) (73 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (9 : Fin 13) (11 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (73 : Fin 78) (56 : Fin 78) (55 : Fin 78)
    (74 : Fin 78) (53 : Fin 78) (77 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h7063` (kalmanson). -/
theorem middleSource_h7063 :
    ((!((allOneRankAtom (sourceRanks P) 55 == allOneRankAtom (sourceRanks P) 54)) || ((allOneRankAtom (sourceRanks P) 77).ult (allOneRankAtom (sourceRanks P) 76)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (76 : Fin 78) (55 : Fin 78)
    (77 : Fin 78) (54 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (10 : Fin 13) (11 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (75 : Fin 78) (56 : Fin 78) (55 : Fin 78)
    (76 : Fin 78) (54 : Fin 78) (77 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h7064` (kalmanson). -/
theorem middleSource_h7064 :
    ((!((allOneRankAtom (sourceRanks P) 55 == allOneRankAtom (sourceRanks P) 77)) || ((allOneRankAtom (sourceRanks P) 54).ult (allOneRankAtom (sourceRanks P) 76)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (76 : Fin 78) (55 : Fin 78)
    (54 : Fin 78) (77 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (10 : Fin 13) (11 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (75 : Fin 78) (56 : Fin 78) (55 : Fin 78)
    (76 : Fin 78) (54 : Fin 78) (77 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h7065` (kalmanson). -/
theorem middleSource_h7065 :
    ((!((allOneRankAtom (sourceRanks P) 76 == allOneRankAtom (sourceRanks P) 54)) || ((allOneRankAtom (sourceRanks P) 77).ult (allOneRankAtom (sourceRanks P) 55)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (55 : Fin 78) (76 : Fin 78)
    (77 : Fin 78) (54 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (10 : Fin 13) (11 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (75 : Fin 78) (56 : Fin 78) (55 : Fin 78)
    (76 : Fin 78) (54 : Fin 78) (77 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h7066` (kalmanson). -/
theorem middleSource_h7066 :
    ((!((allOneRankAtom (sourceRanks P) 55 == allOneRankAtom (sourceRanks P) 56)) || ((allOneRankAtom (sourceRanks P) 75).ult (allOneRankAtom (sourceRanks P) 76)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (76 : Fin 78) (55 : Fin 78)
    (75 : Fin 78) (56 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (10 : Fin 13) (11 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (75 : Fin 78) (56 : Fin 78) (55 : Fin 78)
    (76 : Fin 78) (54 : Fin 78) (77 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h7067` (kalmanson). -/
theorem middleSource_h7067 :
    ((!((allOneRankAtom (sourceRanks P) 55 == allOneRankAtom (sourceRanks P) 75)) || ((allOneRankAtom (sourceRanks P) 56).ult (allOneRankAtom (sourceRanks P) 76)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (76 : Fin 78) (55 : Fin 78)
    (56 : Fin 78) (75 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (10 : Fin 13) (11 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (75 : Fin 78) (56 : Fin 78) (55 : Fin 78)
    (76 : Fin 78) (54 : Fin 78) (77 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h7068` (kalmanson). -/
theorem middleSource_h7068 :
    ((!((allOneRankAtom (sourceRanks P) 76 == allOneRankAtom (sourceRanks P) 75)) || ((allOneRankAtom (sourceRanks P) 56).ult (allOneRankAtom (sourceRanks P) 55)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (55 : Fin 78) (76 : Fin 78)
    (56 : Fin 78) (75 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (10 : Fin 13) (11 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (75 : Fin 78) (56 : Fin 78) (55 : Fin 78)
    (76 : Fin 78) (54 : Fin 78) (77 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h7069` (kalmanson). -/
theorem middleSource_h7069 :
    ((!((allOneRankAtom (sourceRanks P) 58 == allOneRankAtom (sourceRanks P) 57)) || ((allOneRankAtom (sourceRanks P) 68).ult (allOneRankAtom (sourceRanks P) 64)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (64 : Fin 78) (58 : Fin 78)
    (68 : Fin 78) (57 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (6 : Fin 13) (7 : Fin 13) (8 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (63 : Fin 78) (59 : Fin 78) (58 : Fin 78)
    (64 : Fin 78) (57 : Fin 78) (68 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h7070` (kalmanson). -/
theorem middleSource_h7070 :
    ((!((allOneRankAtom (sourceRanks P) 58 == allOneRankAtom (sourceRanks P) 68)) || ((allOneRankAtom (sourceRanks P) 57).ult (allOneRankAtom (sourceRanks P) 64)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (64 : Fin 78) (58 : Fin 78)
    (57 : Fin 78) (68 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (6 : Fin 13) (7 : Fin 13) (8 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (63 : Fin 78) (59 : Fin 78) (58 : Fin 78)
    (64 : Fin 78) (57 : Fin 78) (68 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h7071` (kalmanson). -/
theorem middleSource_h7071 :
    ((!((allOneRankAtom (sourceRanks P) 64 == allOneRankAtom (sourceRanks P) 68)) || ((allOneRankAtom (sourceRanks P) 57).ult (allOneRankAtom (sourceRanks P) 58)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (58 : Fin 78) (64 : Fin 78)
    (57 : Fin 78) (68 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (6 : Fin 13) (7 : Fin 13) (8 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (63 : Fin 78) (59 : Fin 78) (58 : Fin 78)
    (64 : Fin 78) (57 : Fin 78) (68 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h7072` (kalmanson). -/
theorem middleSource_h7072 :
    ((!((allOneRankAtom (sourceRanks P) 58 == allOneRankAtom (sourceRanks P) 59)) || ((allOneRankAtom (sourceRanks P) 63).ult (allOneRankAtom (sourceRanks P) 64)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (64 : Fin 78) (58 : Fin 78)
    (63 : Fin 78) (59 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (6 : Fin 13) (7 : Fin 13) (8 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (63 : Fin 78) (59 : Fin 78) (58 : Fin 78)
    (64 : Fin 78) (57 : Fin 78) (68 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h7073` (kalmanson). -/
theorem middleSource_h7073 :
    ((!((allOneRankAtom (sourceRanks P) 64 == allOneRankAtom (sourceRanks P) 59)) || ((allOneRankAtom (sourceRanks P) 63).ult (allOneRankAtom (sourceRanks P) 58)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (58 : Fin 78) (64 : Fin 78)
    (63 : Fin 78) (59 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (6 : Fin 13) (7 : Fin 13) (8 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (63 : Fin 78) (59 : Fin 78) (58 : Fin 78)
    (64 : Fin 78) (57 : Fin 78) (68 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h7074` (kalmanson). -/
theorem middleSource_h7074 :
    ((!((allOneRankAtom (sourceRanks P) 58 == allOneRankAtom (sourceRanks P) 57)) || ((allOneRankAtom (sourceRanks P) 69).ult (allOneRankAtom (sourceRanks P) 65)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (65 : Fin 78) (58 : Fin 78)
    (69 : Fin 78) (57 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (6 : Fin 13) (7 : Fin 13) (8 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (63 : Fin 78) (60 : Fin 78) (58 : Fin 78)
    (65 : Fin 78) (57 : Fin 78) (69 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h7075` (kalmanson). -/
theorem middleSource_h7075 :
    ((!((allOneRankAtom (sourceRanks P) 58 == allOneRankAtom (sourceRanks P) 69)) || ((allOneRankAtom (sourceRanks P) 57).ult (allOneRankAtom (sourceRanks P) 65)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (65 : Fin 78) (58 : Fin 78)
    (57 : Fin 78) (69 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (6 : Fin 13) (7 : Fin 13) (8 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (63 : Fin 78) (60 : Fin 78) (58 : Fin 78)
    (65 : Fin 78) (57 : Fin 78) (69 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h7076` (kalmanson). -/
theorem middleSource_h7076 :
    ((!((allOneRankAtom (sourceRanks P) 65 == allOneRankAtom (sourceRanks P) 69)) || ((allOneRankAtom (sourceRanks P) 57).ult (allOneRankAtom (sourceRanks P) 58)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (58 : Fin 78) (65 : Fin 78)
    (57 : Fin 78) (69 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (6 : Fin 13) (7 : Fin 13) (8 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (63 : Fin 78) (60 : Fin 78) (58 : Fin 78)
    (65 : Fin 78) (57 : Fin 78) (69 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h7077` (kalmanson). -/
theorem middleSource_h7077 :
    ((!((allOneRankAtom (sourceRanks P) 58 == allOneRankAtom (sourceRanks P) 60)) || ((allOneRankAtom (sourceRanks P) 63).ult (allOneRankAtom (sourceRanks P) 65)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (65 : Fin 78) (58 : Fin 78)
    (63 : Fin 78) (60 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (6 : Fin 13) (7 : Fin 13) (8 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (63 : Fin 78) (60 : Fin 78) (58 : Fin 78)
    (65 : Fin 78) (57 : Fin 78) (69 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h7078` (kalmanson). -/
theorem middleSource_h7078 :
    ((!((allOneRankAtom (sourceRanks P) 65 == allOneRankAtom (sourceRanks P) 60)) || ((allOneRankAtom (sourceRanks P) 63).ult (allOneRankAtom (sourceRanks P) 58)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (58 : Fin 78) (65 : Fin 78)
    (63 : Fin 78) (60 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (6 : Fin 13) (7 : Fin 13) (8 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (63 : Fin 78) (60 : Fin 78) (58 : Fin 78)
    (65 : Fin 78) (57 : Fin 78) (69 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h7079` (kalmanson). -/
theorem middleSource_h7079 :
    ((!((allOneRankAtom (sourceRanks P) 58 == allOneRankAtom (sourceRanks P) 57)) || ((allOneRankAtom (sourceRanks P) 70).ult (allOneRankAtom (sourceRanks P) 66)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (66 : Fin 78) (58 : Fin 78)
    (70 : Fin 78) (57 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (6 : Fin 13) (7 : Fin 13) (8 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (63 : Fin 78) (61 : Fin 78) (58 : Fin 78)
    (66 : Fin 78) (57 : Fin 78) (70 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h7080` (kalmanson). -/
theorem middleSource_h7080 :
    ((!((allOneRankAtom (sourceRanks P) 58 == allOneRankAtom (sourceRanks P) 70)) || ((allOneRankAtom (sourceRanks P) 57).ult (allOneRankAtom (sourceRanks P) 66)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (66 : Fin 78) (58 : Fin 78)
    (57 : Fin 78) (70 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (6 : Fin 13) (7 : Fin 13) (8 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (63 : Fin 78) (61 : Fin 78) (58 : Fin 78)
    (66 : Fin 78) (57 : Fin 78) (70 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h7081` (kalmanson). -/
theorem middleSource_h7081 :
    ((!((allOneRankAtom (sourceRanks P) 66 == allOneRankAtom (sourceRanks P) 70)) || ((allOneRankAtom (sourceRanks P) 57).ult (allOneRankAtom (sourceRanks P) 58)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (58 : Fin 78) (66 : Fin 78)
    (57 : Fin 78) (70 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (6 : Fin 13) (7 : Fin 13) (8 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (63 : Fin 78) (61 : Fin 78) (58 : Fin 78)
    (66 : Fin 78) (57 : Fin 78) (70 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h7082` (kalmanson). -/
theorem middleSource_h7082 :
    ((!((allOneRankAtom (sourceRanks P) 58 == allOneRankAtom (sourceRanks P) 61)) || ((allOneRankAtom (sourceRanks P) 63).ult (allOneRankAtom (sourceRanks P) 66)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (66 : Fin 78) (58 : Fin 78)
    (63 : Fin 78) (61 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (6 : Fin 13) (7 : Fin 13) (8 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (63 : Fin 78) (61 : Fin 78) (58 : Fin 78)
    (66 : Fin 78) (57 : Fin 78) (70 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h7083` (kalmanson). -/
theorem middleSource_h7083 :
    ((!((allOneRankAtom (sourceRanks P) 66 == allOneRankAtom (sourceRanks P) 61)) || ((allOneRankAtom (sourceRanks P) 63).ult (allOneRankAtom (sourceRanks P) 58)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (58 : Fin 78) (66 : Fin 78)
    (63 : Fin 78) (61 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (6 : Fin 13) (7 : Fin 13) (8 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (63 : Fin 78) (61 : Fin 78) (58 : Fin 78)
    (66 : Fin 78) (57 : Fin 78) (70 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h7084` (kalmanson). -/
theorem middleSource_h7084 :
    ((!((allOneRankAtom (sourceRanks P) 58 == allOneRankAtom (sourceRanks P) 57)) || ((allOneRankAtom (sourceRanks P) 71).ult (allOneRankAtom (sourceRanks P) 67)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (67 : Fin 78) (58 : Fin 78)
    (71 : Fin 78) (57 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (6 : Fin 13) (7 : Fin 13) (8 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (63 : Fin 78) (62 : Fin 78) (58 : Fin 78)
    (67 : Fin 78) (57 : Fin 78) (71 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h7085` (kalmanson). -/
theorem middleSource_h7085 :
    ((!((allOneRankAtom (sourceRanks P) 58 == allOneRankAtom (sourceRanks P) 71)) || ((allOneRankAtom (sourceRanks P) 57).ult (allOneRankAtom (sourceRanks P) 67)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (67 : Fin 78) (58 : Fin 78)
    (57 : Fin 78) (71 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (6 : Fin 13) (7 : Fin 13) (8 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (63 : Fin 78) (62 : Fin 78) (58 : Fin 78)
    (67 : Fin 78) (57 : Fin 78) (71 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h7086` (kalmanson). -/
theorem middleSource_h7086 :
    ((!((allOneRankAtom (sourceRanks P) 58 == allOneRankAtom (sourceRanks P) 62)) || ((allOneRankAtom (sourceRanks P) 63).ult (allOneRankAtom (sourceRanks P) 67)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (67 : Fin 78) (58 : Fin 78)
    (63 : Fin 78) (62 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (6 : Fin 13) (7 : Fin 13) (8 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (63 : Fin 78) (62 : Fin 78) (58 : Fin 78)
    (67 : Fin 78) (57 : Fin 78) (71 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h7087` (kalmanson). -/
theorem middleSource_h7087 :
    ((!((allOneRankAtom (sourceRanks P) 59 == allOneRankAtom (sourceRanks P) 57)) || ((allOneRankAtom (sourceRanks P) 72).ult (allOneRankAtom (sourceRanks P) 65)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (65 : Fin 78) (59 : Fin 78)
    (72 : Fin 78) (57 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (6 : Fin 13) (7 : Fin 13) (9 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (64 : Fin 78) (60 : Fin 78) (59 : Fin 78)
    (65 : Fin 78) (57 : Fin 78) (72 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h7088` (kalmanson). -/
theorem middleSource_h7088 :
    ((!((allOneRankAtom (sourceRanks P) 59 == allOneRankAtom (sourceRanks P) 72)) || ((allOneRankAtom (sourceRanks P) 57).ult (allOneRankAtom (sourceRanks P) 65)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (65 : Fin 78) (59 : Fin 78)
    (57 : Fin 78) (72 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (6 : Fin 13) (7 : Fin 13) (9 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (64 : Fin 78) (60 : Fin 78) (59 : Fin 78)
    (65 : Fin 78) (57 : Fin 78) (72 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h7089` (kalmanson). -/
theorem middleSource_h7089 :
    ((!((allOneRankAtom (sourceRanks P) 65 == allOneRankAtom (sourceRanks P) 72)) || ((allOneRankAtom (sourceRanks P) 57).ult (allOneRankAtom (sourceRanks P) 59)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (59 : Fin 78) (65 : Fin 78)
    (57 : Fin 78) (72 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (6 : Fin 13) (7 : Fin 13) (9 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (64 : Fin 78) (60 : Fin 78) (59 : Fin 78)
    (65 : Fin 78) (57 : Fin 78) (72 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h7090` (kalmanson). -/
theorem middleSource_h7090 :
    ((!((allOneRankAtom (sourceRanks P) 59 == allOneRankAtom (sourceRanks P) 60)) || ((allOneRankAtom (sourceRanks P) 64).ult (allOneRankAtom (sourceRanks P) 65)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (65 : Fin 78) (59 : Fin 78)
    (64 : Fin 78) (60 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (6 : Fin 13) (7 : Fin 13) (9 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (64 : Fin 78) (60 : Fin 78) (59 : Fin 78)
    (65 : Fin 78) (57 : Fin 78) (72 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h7091` (kalmanson). -/
theorem middleSource_h7091 :
    ((!((allOneRankAtom (sourceRanks P) 59 == allOneRankAtom (sourceRanks P) 64)) || ((allOneRankAtom (sourceRanks P) 60).ult (allOneRankAtom (sourceRanks P) 65)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (65 : Fin 78) (59 : Fin 78)
    (60 : Fin 78) (64 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (6 : Fin 13) (7 : Fin 13) (9 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (64 : Fin 78) (60 : Fin 78) (59 : Fin 78)
    (65 : Fin 78) (57 : Fin 78) (72 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h7092` (kalmanson). -/
theorem middleSource_h7092 :
    ((!((allOneRankAtom (sourceRanks P) 65 == allOneRankAtom (sourceRanks P) 60)) || ((allOneRankAtom (sourceRanks P) 64).ult (allOneRankAtom (sourceRanks P) 59)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (59 : Fin 78) (65 : Fin 78)
    (64 : Fin 78) (60 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (6 : Fin 13) (7 : Fin 13) (9 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (64 : Fin 78) (60 : Fin 78) (59 : Fin 78)
    (65 : Fin 78) (57 : Fin 78) (72 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h7093` (kalmanson). -/
theorem middleSource_h7093 :
    ((!((allOneRankAtom (sourceRanks P) 59 == allOneRankAtom (sourceRanks P) 57)) || ((allOneRankAtom (sourceRanks P) 73).ult (allOneRankAtom (sourceRanks P) 66)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (66 : Fin 78) (59 : Fin 78)
    (73 : Fin 78) (57 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (6 : Fin 13) (7 : Fin 13) (9 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (64 : Fin 78) (61 : Fin 78) (59 : Fin 78)
    (66 : Fin 78) (57 : Fin 78) (73 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h7094` (kalmanson). -/
theorem middleSource_h7094 :
    ((!((allOneRankAtom (sourceRanks P) 59 == allOneRankAtom (sourceRanks P) 73)) || ((allOneRankAtom (sourceRanks P) 57).ult (allOneRankAtom (sourceRanks P) 66)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (66 : Fin 78) (59 : Fin 78)
    (57 : Fin 78) (73 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (6 : Fin 13) (7 : Fin 13) (9 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (64 : Fin 78) (61 : Fin 78) (59 : Fin 78)
    (66 : Fin 78) (57 : Fin 78) (73 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h7095` (kalmanson). -/
theorem middleSource_h7095 :
    ((!((allOneRankAtom (sourceRanks P) 66 == allOneRankAtom (sourceRanks P) 73)) || ((allOneRankAtom (sourceRanks P) 57).ult (allOneRankAtom (sourceRanks P) 59)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (59 : Fin 78) (66 : Fin 78)
    (57 : Fin 78) (73 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (6 : Fin 13) (7 : Fin 13) (9 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (64 : Fin 78) (61 : Fin 78) (59 : Fin 78)
    (66 : Fin 78) (57 : Fin 78) (73 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h7096` (kalmanson). -/
theorem middleSource_h7096 :
    ((!((allOneRankAtom (sourceRanks P) 59 == allOneRankAtom (sourceRanks P) 61)) || ((allOneRankAtom (sourceRanks P) 64).ult (allOneRankAtom (sourceRanks P) 66)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (66 : Fin 78) (59 : Fin 78)
    (64 : Fin 78) (61 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (6 : Fin 13) (7 : Fin 13) (9 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (64 : Fin 78) (61 : Fin 78) (59 : Fin 78)
    (66 : Fin 78) (57 : Fin 78) (73 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h7097` (kalmanson). -/
theorem middleSource_h7097 :
    ((!((allOneRankAtom (sourceRanks P) 59 == allOneRankAtom (sourceRanks P) 64)) || ((allOneRankAtom (sourceRanks P) 61).ult (allOneRankAtom (sourceRanks P) 66)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (66 : Fin 78) (59 : Fin 78)
    (61 : Fin 78) (64 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (6 : Fin 13) (7 : Fin 13) (9 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (64 : Fin 78) (61 : Fin 78) (59 : Fin 78)
    (66 : Fin 78) (57 : Fin 78) (73 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h7098` (kalmanson). -/
theorem middleSource_h7098 :
    ((!((allOneRankAtom (sourceRanks P) 66 == allOneRankAtom (sourceRanks P) 61)) || ((allOneRankAtom (sourceRanks P) 64).ult (allOneRankAtom (sourceRanks P) 59)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (59 : Fin 78) (66 : Fin 78)
    (64 : Fin 78) (61 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (6 : Fin 13) (7 : Fin 13) (9 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (64 : Fin 78) (61 : Fin 78) (59 : Fin 78)
    (66 : Fin 78) (57 : Fin 78) (73 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h7099` (kalmanson). -/
theorem middleSource_h7099 :
    ((!((allOneRankAtom (sourceRanks P) 59 == allOneRankAtom (sourceRanks P) 57)) || ((allOneRankAtom (sourceRanks P) 74).ult (allOneRankAtom (sourceRanks P) 67)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (67 : Fin 78) (59 : Fin 78)
    (74 : Fin 78) (57 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (6 : Fin 13) (7 : Fin 13) (9 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (64 : Fin 78) (62 : Fin 78) (59 : Fin 78)
    (67 : Fin 78) (57 : Fin 78) (74 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h7100` (kalmanson). -/
theorem middleSource_h7100 :
    ((!((allOneRankAtom (sourceRanks P) 59 == allOneRankAtom (sourceRanks P) 74)) || ((allOneRankAtom (sourceRanks P) 57).ult (allOneRankAtom (sourceRanks P) 67)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (67 : Fin 78) (59 : Fin 78)
    (57 : Fin 78) (74 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (6 : Fin 13) (7 : Fin 13) (9 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (64 : Fin 78) (62 : Fin 78) (59 : Fin 78)
    (67 : Fin 78) (57 : Fin 78) (74 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h7101` (kalmanson). -/
theorem middleSource_h7101 :
    ((!((allOneRankAtom (sourceRanks P) 59 == allOneRankAtom (sourceRanks P) 62)) || ((allOneRankAtom (sourceRanks P) 64).ult (allOneRankAtom (sourceRanks P) 67)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (67 : Fin 78) (59 : Fin 78)
    (64 : Fin 78) (62 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (6 : Fin 13) (7 : Fin 13) (9 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (64 : Fin 78) (62 : Fin 78) (59 : Fin 78)
    (67 : Fin 78) (57 : Fin 78) (74 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h7102` (kalmanson). -/
theorem middleSource_h7102 :
    ((!((allOneRankAtom (sourceRanks P) 59 == allOneRankAtom (sourceRanks P) 64)) || ((allOneRankAtom (sourceRanks P) 62).ult (allOneRankAtom (sourceRanks P) 67)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (67 : Fin 78) (59 : Fin 78)
    (62 : Fin 78) (64 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (6 : Fin 13) (7 : Fin 13) (9 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (64 : Fin 78) (62 : Fin 78) (59 : Fin 78)
    (67 : Fin 78) (57 : Fin 78) (74 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h7103` (kalmanson). -/
theorem middleSource_h7103 :
    ((!((allOneRankAtom (sourceRanks P) 60 == allOneRankAtom (sourceRanks P) 57)) || ((allOneRankAtom (sourceRanks P) 75).ult (allOneRankAtom (sourceRanks P) 66)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (66 : Fin 78) (60 : Fin 78)
    (75 : Fin 78) (57 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (6 : Fin 13) (7 : Fin 13) (10 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (65 : Fin 78) (61 : Fin 78) (60 : Fin 78)
    (66 : Fin 78) (57 : Fin 78) (75 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

end

end ATailExactFiveCard13AllOneSourceIngressScratch
end Problem97
