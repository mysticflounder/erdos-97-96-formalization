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

/-- Candidate middle source assertion `h7232` (kalmanson). -/
theorem middleSource_h7232 :
    ((!((allOneRankAtom (sourceRanks P) 69 == allOneRankAtom (sourceRanks P) 75)) || ((allOneRankAtom (sourceRanks P) 68).ult (allOneRankAtom (sourceRanks P) 73)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (73 : Fin 78) (69 : Fin 78)
    (68 : Fin 78) (75 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (8 : Fin 13) (9 : Fin 13) (10 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (72 : Fin 78) (70 : Fin 78) (69 : Fin 78)
    (73 : Fin 78) (68 : Fin 78) (75 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h7233` (kalmanson). -/
theorem middleSource_h7233 :
    ((!((allOneRankAtom (sourceRanks P) 73 == allOneRankAtom (sourceRanks P) 68)) || ((allOneRankAtom (sourceRanks P) 75).ult (allOneRankAtom (sourceRanks P) 69)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (69 : Fin 78) (73 : Fin 78)
    (75 : Fin 78) (68 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (8 : Fin 13) (9 : Fin 13) (10 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (72 : Fin 78) (70 : Fin 78) (69 : Fin 78)
    (73 : Fin 78) (68 : Fin 78) (75 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h7234` (kalmanson). -/
theorem middleSource_h7234 :
    ((!((allOneRankAtom (sourceRanks P) 73 == allOneRankAtom (sourceRanks P) 75)) || ((allOneRankAtom (sourceRanks P) 68).ult (allOneRankAtom (sourceRanks P) 69)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (69 : Fin 78) (73 : Fin 78)
    (68 : Fin 78) (75 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (8 : Fin 13) (9 : Fin 13) (10 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (72 : Fin 78) (70 : Fin 78) (69 : Fin 78)
    (73 : Fin 78) (68 : Fin 78) (75 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h7235` (kalmanson). -/
theorem middleSource_h7235 :
    ((!((allOneRankAtom (sourceRanks P) 69 == allOneRankAtom (sourceRanks P) 72)) || ((allOneRankAtom (sourceRanks P) 70).ult (allOneRankAtom (sourceRanks P) 73)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (73 : Fin 78) (69 : Fin 78)
    (70 : Fin 78) (72 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (8 : Fin 13) (9 : Fin 13) (10 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (72 : Fin 78) (70 : Fin 78) (69 : Fin 78)
    (73 : Fin 78) (68 : Fin 78) (75 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h7236` (kalmanson). -/
theorem middleSource_h7236 :
    ((!((allOneRankAtom (sourceRanks P) 73 == allOneRankAtom (sourceRanks P) 70)) || ((allOneRankAtom (sourceRanks P) 72).ult (allOneRankAtom (sourceRanks P) 69)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (69 : Fin 78) (73 : Fin 78)
    (72 : Fin 78) (70 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (8 : Fin 13) (9 : Fin 13) (10 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (72 : Fin 78) (70 : Fin 78) (69 : Fin 78)
    (73 : Fin 78) (68 : Fin 78) (75 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h7237` (kalmanson). -/
theorem middleSource_h7237 :
    ((!((allOneRankAtom (sourceRanks P) 73 == allOneRankAtom (sourceRanks P) 72)) || ((allOneRankAtom (sourceRanks P) 70).ult (allOneRankAtom (sourceRanks P) 69)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (69 : Fin 78) (73 : Fin 78)
    (70 : Fin 78) (72 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (8 : Fin 13) (9 : Fin 13) (10 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (72 : Fin 78) (70 : Fin 78) (69 : Fin 78)
    (73 : Fin 78) (68 : Fin 78) (75 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h7238` (kalmanson). -/
theorem middleSource_h7238 :
    ((!((allOneRankAtom (sourceRanks P) 69 == allOneRankAtom (sourceRanks P) 76)) || ((allOneRankAtom (sourceRanks P) 68).ult (allOneRankAtom (sourceRanks P) 74)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (74 : Fin 78) (69 : Fin 78)
    (68 : Fin 78) (76 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (8 : Fin 13) (9 : Fin 13) (10 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (72 : Fin 78) (71 : Fin 78) (69 : Fin 78)
    (74 : Fin 78) (68 : Fin 78) (76 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h7239` (kalmanson). -/
theorem middleSource_h7239 :
    ((!((allOneRankAtom (sourceRanks P) 74 == allOneRankAtom (sourceRanks P) 68)) || ((allOneRankAtom (sourceRanks P) 76).ult (allOneRankAtom (sourceRanks P) 69)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (69 : Fin 78) (74 : Fin 78)
    (76 : Fin 78) (68 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (8 : Fin 13) (9 : Fin 13) (10 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (72 : Fin 78) (71 : Fin 78) (69 : Fin 78)
    (74 : Fin 78) (68 : Fin 78) (76 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h7240` (kalmanson). -/
theorem middleSource_h7240 :
    ((!((allOneRankAtom (sourceRanks P) 69 == allOneRankAtom (sourceRanks P) 72)) || ((allOneRankAtom (sourceRanks P) 71).ult (allOneRankAtom (sourceRanks P) 74)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (74 : Fin 78) (69 : Fin 78)
    (71 : Fin 78) (72 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (8 : Fin 13) (9 : Fin 13) (10 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (72 : Fin 78) (71 : Fin 78) (69 : Fin 78)
    (74 : Fin 78) (68 : Fin 78) (76 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h7241` (kalmanson). -/
theorem middleSource_h7241 :
    ((!((allOneRankAtom (sourceRanks P) 74 == allOneRankAtom (sourceRanks P) 72)) || ((allOneRankAtom (sourceRanks P) 71).ult (allOneRankAtom (sourceRanks P) 69)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (69 : Fin 78) (74 : Fin 78)
    (71 : Fin 78) (72 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (8 : Fin 13) (9 : Fin 13) (10 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (72 : Fin 78) (71 : Fin 78) (69 : Fin 78)
    (74 : Fin 78) (68 : Fin 78) (76 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h7242` (kalmanson). -/
theorem middleSource_h7242 :
    ((!((allOneRankAtom (sourceRanks P) 70 == allOneRankAtom (sourceRanks P) 77)) || ((allOneRankAtom (sourceRanks P) 68).ult (allOneRankAtom (sourceRanks P) 74)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (74 : Fin 78) (70 : Fin 78)
    (68 : Fin 78) (77 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (8 : Fin 13) (9 : Fin 13) (11 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (73 : Fin 78) (71 : Fin 78) (70 : Fin 78)
    (74 : Fin 78) (68 : Fin 78) (77 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h7243` (kalmanson). -/
theorem middleSource_h7243 :
    ((!((allOneRankAtom (sourceRanks P) 74 == allOneRankAtom (sourceRanks P) 68)) || ((allOneRankAtom (sourceRanks P) 77).ult (allOneRankAtom (sourceRanks P) 70)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (70 : Fin 78) (74 : Fin 78)
    (77 : Fin 78) (68 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (8 : Fin 13) (9 : Fin 13) (11 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (73 : Fin 78) (71 : Fin 78) (70 : Fin 78)
    (74 : Fin 78) (68 : Fin 78) (77 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h7244` (kalmanson). -/
theorem middleSource_h7244 :
    ((!((allOneRankAtom (sourceRanks P) 70 == allOneRankAtom (sourceRanks P) 73)) || ((allOneRankAtom (sourceRanks P) 71).ult (allOneRankAtom (sourceRanks P) 74)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (74 : Fin 78) (70 : Fin 78)
    (71 : Fin 78) (73 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (8 : Fin 13) (9 : Fin 13) (11 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (73 : Fin 78) (71 : Fin 78) (70 : Fin 78)
    (74 : Fin 78) (68 : Fin 78) (77 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h7245` (kalmanson). -/
theorem middleSource_h7245 :
    ((!((allOneRankAtom (sourceRanks P) 74 == allOneRankAtom (sourceRanks P) 73)) || ((allOneRankAtom (sourceRanks P) 71).ult (allOneRankAtom (sourceRanks P) 70)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (70 : Fin 78) (74 : Fin 78)
    (71 : Fin 78) (73 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (8 : Fin 13) (9 : Fin 13) (11 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (73 : Fin 78) (71 : Fin 78) (70 : Fin 78)
    (74 : Fin 78) (68 : Fin 78) (77 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h7246` (kalmanson). -/
theorem middleSource_h7246 :
    ((!((allOneRankAtom (sourceRanks P) 70 == allOneRankAtom (sourceRanks P) 77)) || ((allOneRankAtom (sourceRanks P) 69).ult (allOneRankAtom (sourceRanks P) 76)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (76 : Fin 78) (70 : Fin 78)
    (69 : Fin 78) (77 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (8 : Fin 13) (10 : Fin 13) (11 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (75 : Fin 78) (71 : Fin 78) (70 : Fin 78)
    (76 : Fin 78) (69 : Fin 78) (77 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h7247` (kalmanson). -/
theorem middleSource_h7247 :
    ((!((allOneRankAtom (sourceRanks P) 76 == allOneRankAtom (sourceRanks P) 69)) || ((allOneRankAtom (sourceRanks P) 77).ult (allOneRankAtom (sourceRanks P) 70)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (70 : Fin 78) (76 : Fin 78)
    (77 : Fin 78) (69 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (8 : Fin 13) (10 : Fin 13) (11 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (75 : Fin 78) (71 : Fin 78) (70 : Fin 78)
    (76 : Fin 78) (69 : Fin 78) (77 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h7248` (kalmanson). -/
theorem middleSource_h7248 :
    ((!((allOneRankAtom (sourceRanks P) 70 == allOneRankAtom (sourceRanks P) 75)) || ((allOneRankAtom (sourceRanks P) 71).ult (allOneRankAtom (sourceRanks P) 76)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (76 : Fin 78) (70 : Fin 78)
    (71 : Fin 78) (75 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (8 : Fin 13) (10 : Fin 13) (11 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (75 : Fin 78) (71 : Fin 78) (70 : Fin 78)
    (76 : Fin 78) (69 : Fin 78) (77 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h7249` (kalmanson). -/
theorem middleSource_h7249 :
    ((!((allOneRankAtom (sourceRanks P) 76 == allOneRankAtom (sourceRanks P) 75)) || ((allOneRankAtom (sourceRanks P) 71).ult (allOneRankAtom (sourceRanks P) 70)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (70 : Fin 78) (76 : Fin 78)
    (71 : Fin 78) (75 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (8 : Fin 13) (10 : Fin 13) (11 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (75 : Fin 78) (71 : Fin 78) (70 : Fin 78)
    (76 : Fin 78) (69 : Fin 78) (77 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h7250` (kalmanson). -/
theorem middleSource_h7250 :
    ((!((allOneRankAtom (sourceRanks P) 73 == allOneRankAtom (sourceRanks P) 72)) || ((allOneRankAtom (sourceRanks P) 77).ult (allOneRankAtom (sourceRanks P) 76)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (76 : Fin 78) (73 : Fin 78)
    (77 : Fin 78) (72 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (9 : Fin 13) (10 : Fin 13) (11 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (75 : Fin 78) (74 : Fin 78) (73 : Fin 78)
    (76 : Fin 78) (72 : Fin 78) (77 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h7251` (kalmanson). -/
theorem middleSource_h7251 :
    ((!((allOneRankAtom (sourceRanks P) 73 == allOneRankAtom (sourceRanks P) 77)) || ((allOneRankAtom (sourceRanks P) 72).ult (allOneRankAtom (sourceRanks P) 76)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (76 : Fin 78) (73 : Fin 78)
    (72 : Fin 78) (77 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (9 : Fin 13) (10 : Fin 13) (11 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (75 : Fin 78) (74 : Fin 78) (73 : Fin 78)
    (76 : Fin 78) (72 : Fin 78) (77 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h7252` (kalmanson). -/
theorem middleSource_h7252 :
    ((!((allOneRankAtom (sourceRanks P) 76 == allOneRankAtom (sourceRanks P) 72)) || ((allOneRankAtom (sourceRanks P) 77).ult (allOneRankAtom (sourceRanks P) 73)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (73 : Fin 78) (76 : Fin 78)
    (77 : Fin 78) (72 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (9 : Fin 13) (10 : Fin 13) (11 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (75 : Fin 78) (74 : Fin 78) (73 : Fin 78)
    (76 : Fin 78) (72 : Fin 78) (77 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h7253` (kalmanson). -/
theorem middleSource_h7253 :
    ((!((allOneRankAtom (sourceRanks P) 73 == allOneRankAtom (sourceRanks P) 74)) || ((allOneRankAtom (sourceRanks P) 75).ult (allOneRankAtom (sourceRanks P) 76)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (76 : Fin 78) (73 : Fin 78)
    (75 : Fin 78) (74 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (9 : Fin 13) (10 : Fin 13) (11 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (75 : Fin 78) (74 : Fin 78) (73 : Fin 78)
    (76 : Fin 78) (72 : Fin 78) (77 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h7254` (kalmanson). -/
theorem middleSource_h7254 :
    ((!((allOneRankAtom (sourceRanks P) 73 == allOneRankAtom (sourceRanks P) 75)) || ((allOneRankAtom (sourceRanks P) 74).ult (allOneRankAtom (sourceRanks P) 76)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (76 : Fin 78) (73 : Fin 78)
    (74 : Fin 78) (75 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (9 : Fin 13) (10 : Fin 13) (11 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (75 : Fin 78) (74 : Fin 78) (73 : Fin 78)
    (76 : Fin 78) (72 : Fin 78) (77 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h7255` (kalmanson). -/
theorem middleSource_h7255 :
    ((!((allOneRankAtom (sourceRanks P) 76 == allOneRankAtom (sourceRanks P) 75)) || ((allOneRankAtom (sourceRanks P) 74).ult (allOneRankAtom (sourceRanks P) 73)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (73 : Fin 78) (76 : Fin 78)
    (74 : Fin 78) (75 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (9 : Fin 13) (10 : Fin 13) (11 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (75 : Fin 78) (74 : Fin 78) (73 : Fin 78)
    (76 : Fin 78) (72 : Fin 78) (77 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

end

end ATailExactFiveCard13AllOneSourceIngressScratch
end Problem97
