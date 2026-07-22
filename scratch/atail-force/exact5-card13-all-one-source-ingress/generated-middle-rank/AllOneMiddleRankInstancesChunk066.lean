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

/-- Candidate middle source assertion `h4224` (kalmanson). -/
theorem middleSource_h4224 :
    ((!((allOneRankAtom (sourceRanks P) 9 == allOneRankAtom (sourceRanks P) 75)) || ((allOneRankAtom (sourceRanks P) 7).ult (allOneRankAtom (sourceRanks P) 70)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (70 : Fin 78) (9 : Fin 78)
    (7 : Fin 78) (75 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (8 : Fin 13) (10 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (69 : Fin 78) (10 : Fin 78) (9 : Fin 78)
    (70 : Fin 78) (7 : Fin 78) (75 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4225` (kalmanson). -/
theorem middleSource_h4225 :
    ((!((allOneRankAtom (sourceRanks P) 70 == allOneRankAtom (sourceRanks P) 75)) || ((allOneRankAtom (sourceRanks P) 7).ult (allOneRankAtom (sourceRanks P) 9)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (9 : Fin 78) (70 : Fin 78)
    (7 : Fin 78) (75 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (8 : Fin 13) (10 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (69 : Fin 78) (10 : Fin 78) (9 : Fin 78)
    (70 : Fin 78) (7 : Fin 78) (75 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4226` (kalmanson). -/
theorem middleSource_h4226 :
    ((!((allOneRankAtom (sourceRanks P) 9 == allOneRankAtom (sourceRanks P) 10)) || ((allOneRankAtom (sourceRanks P) 69).ult (allOneRankAtom (sourceRanks P) 70)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (70 : Fin 78) (9 : Fin 78)
    (69 : Fin 78) (10 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (8 : Fin 13) (10 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (69 : Fin 78) (10 : Fin 78) (9 : Fin 78)
    (70 : Fin 78) (7 : Fin 78) (75 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4227` (kalmanson). -/
theorem middleSource_h4227 :
    ((!((allOneRankAtom (sourceRanks P) 9 == allOneRankAtom (sourceRanks P) 69)) || ((allOneRankAtom (sourceRanks P) 10).ult (allOneRankAtom (sourceRanks P) 70)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (70 : Fin 78) (9 : Fin 78)
    (10 : Fin 78) (69 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (8 : Fin 13) (10 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (69 : Fin 78) (10 : Fin 78) (9 : Fin 78)
    (70 : Fin 78) (7 : Fin 78) (75 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4228` (kalmanson). -/
theorem middleSource_h4228 :
    ((!((allOneRankAtom (sourceRanks P) 70 == allOneRankAtom (sourceRanks P) 10)) || ((allOneRankAtom (sourceRanks P) 69).ult (allOneRankAtom (sourceRanks P) 9)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (9 : Fin 78) (70 : Fin 78)
    (69 : Fin 78) (10 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (8 : Fin 13) (10 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (69 : Fin 78) (10 : Fin 78) (9 : Fin 78)
    (70 : Fin 78) (7 : Fin 78) (75 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4229` (kalmanson). -/
theorem middleSource_h4229 :
    ((!((allOneRankAtom (sourceRanks P) 9 == allOneRankAtom (sourceRanks P) 76)) || ((allOneRankAtom (sourceRanks P) 7).ult (allOneRankAtom (sourceRanks P) 71)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (71 : Fin 78) (9 : Fin 78)
    (7 : Fin 78) (76 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (8 : Fin 13) (10 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (69 : Fin 78) (11 : Fin 78) (9 : Fin 78)
    (71 : Fin 78) (7 : Fin 78) (76 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4230` (kalmanson). -/
theorem middleSource_h4230 :
    ((!((allOneRankAtom (sourceRanks P) 9 == allOneRankAtom (sourceRanks P) 11)) || ((allOneRankAtom (sourceRanks P) 69).ult (allOneRankAtom (sourceRanks P) 71)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (71 : Fin 78) (9 : Fin 78)
    (69 : Fin 78) (11 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (8 : Fin 13) (10 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (69 : Fin 78) (11 : Fin 78) (9 : Fin 78)
    (71 : Fin 78) (7 : Fin 78) (76 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4231` (kalmanson). -/
theorem middleSource_h4231 :
    ((!((allOneRankAtom (sourceRanks P) 9 == allOneRankAtom (sourceRanks P) 69)) || ((allOneRankAtom (sourceRanks P) 11).ult (allOneRankAtom (sourceRanks P) 71)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (71 : Fin 78) (9 : Fin 78)
    (11 : Fin 78) (69 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (8 : Fin 13) (10 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (69 : Fin 78) (11 : Fin 78) (9 : Fin 78)
    (71 : Fin 78) (7 : Fin 78) (76 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4232` (kalmanson). -/
theorem middleSource_h4232 :
    ((!((allOneRankAtom (sourceRanks P) 10 == allOneRankAtom (sourceRanks P) 77)) || ((allOneRankAtom (sourceRanks P) 7).ult (allOneRankAtom (sourceRanks P) 71)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (71 : Fin 78) (10 : Fin 78)
    (7 : Fin 78) (77 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (8 : Fin 13) (11 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (70 : Fin 78) (11 : Fin 78) (10 : Fin 78)
    (71 : Fin 78) (7 : Fin 78) (77 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4233` (kalmanson). -/
theorem middleSource_h4233 :
    ((!((allOneRankAtom (sourceRanks P) 10 == allOneRankAtom (sourceRanks P) 11)) || ((allOneRankAtom (sourceRanks P) 70).ult (allOneRankAtom (sourceRanks P) 71)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (71 : Fin 78) (10 : Fin 78)
    (70 : Fin 78) (11 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (8 : Fin 13) (11 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (70 : Fin 78) (11 : Fin 78) (10 : Fin 78)
    (71 : Fin 78) (7 : Fin 78) (77 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4234` (kalmanson). -/
theorem middleSource_h4234 :
    ((!((allOneRankAtom (sourceRanks P) 10 == allOneRankAtom (sourceRanks P) 70)) || ((allOneRankAtom (sourceRanks P) 11).ult (allOneRankAtom (sourceRanks P) 71)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (71 : Fin 78) (10 : Fin 78)
    (11 : Fin 78) (70 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (8 : Fin 13) (11 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (70 : Fin 78) (11 : Fin 78) (10 : Fin 78)
    (71 : Fin 78) (7 : Fin 78) (77 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4235` (kalmanson). -/
theorem middleSource_h4235 :
    ((!((allOneRankAtom (sourceRanks P) 9 == allOneRankAtom (sourceRanks P) 75)) || ((allOneRankAtom (sourceRanks P) 8).ult (allOneRankAtom (sourceRanks P) 73)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (73 : Fin 78) (9 : Fin 78)
    (8 : Fin 78) (75 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (9 : Fin 13) (10 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (72 : Fin 78) (10 : Fin 78) (9 : Fin 78)
    (73 : Fin 78) (8 : Fin 78) (75 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4236` (kalmanson). -/
theorem middleSource_h4236 :
    ((!((allOneRankAtom (sourceRanks P) 73 == allOneRankAtom (sourceRanks P) 8)) || ((allOneRankAtom (sourceRanks P) 75).ult (allOneRankAtom (sourceRanks P) 9)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (9 : Fin 78) (73 : Fin 78)
    (75 : Fin 78) (8 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (9 : Fin 13) (10 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (72 : Fin 78) (10 : Fin 78) (9 : Fin 78)
    (73 : Fin 78) (8 : Fin 78) (75 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4237` (kalmanson). -/
theorem middleSource_h4237 :
    ((!((allOneRankAtom (sourceRanks P) 73 == allOneRankAtom (sourceRanks P) 75)) || ((allOneRankAtom (sourceRanks P) 8).ult (allOneRankAtom (sourceRanks P) 9)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (9 : Fin 78) (73 : Fin 78)
    (8 : Fin 78) (75 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (9 : Fin 13) (10 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (72 : Fin 78) (10 : Fin 78) (9 : Fin 78)
    (73 : Fin 78) (8 : Fin 78) (75 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4238` (kalmanson). -/
theorem middleSource_h4238 :
    ((!((allOneRankAtom (sourceRanks P) 9 == allOneRankAtom (sourceRanks P) 10)) || ((allOneRankAtom (sourceRanks P) 72).ult (allOneRankAtom (sourceRanks P) 73)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (73 : Fin 78) (9 : Fin 78)
    (72 : Fin 78) (10 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (9 : Fin 13) (10 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (72 : Fin 78) (10 : Fin 78) (9 : Fin 78)
    (73 : Fin 78) (8 : Fin 78) (75 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4239` (kalmanson). -/
theorem middleSource_h4239 :
    ((!((allOneRankAtom (sourceRanks P) 9 == allOneRankAtom (sourceRanks P) 72)) || ((allOneRankAtom (sourceRanks P) 10).ult (allOneRankAtom (sourceRanks P) 73)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (73 : Fin 78) (9 : Fin 78)
    (10 : Fin 78) (72 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (9 : Fin 13) (10 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (72 : Fin 78) (10 : Fin 78) (9 : Fin 78)
    (73 : Fin 78) (8 : Fin 78) (75 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4240` (kalmanson). -/
theorem middleSource_h4240 :
    ((!((allOneRankAtom (sourceRanks P) 73 == allOneRankAtom (sourceRanks P) 10)) || ((allOneRankAtom (sourceRanks P) 72).ult (allOneRankAtom (sourceRanks P) 9)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (9 : Fin 78) (73 : Fin 78)
    (72 : Fin 78) (10 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (9 : Fin 13) (10 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (72 : Fin 78) (10 : Fin 78) (9 : Fin 78)
    (73 : Fin 78) (8 : Fin 78) (75 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4241` (kalmanson). -/
theorem middleSource_h4241 :
    ((!((allOneRankAtom (sourceRanks P) 73 == allOneRankAtom (sourceRanks P) 72)) || ((allOneRankAtom (sourceRanks P) 10).ult (allOneRankAtom (sourceRanks P) 9)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (9 : Fin 78) (73 : Fin 78)
    (10 : Fin 78) (72 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (9 : Fin 13) (10 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (72 : Fin 78) (10 : Fin 78) (9 : Fin 78)
    (73 : Fin 78) (8 : Fin 78) (75 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4242` (kalmanson). -/
theorem middleSource_h4242 :
    ((!((allOneRankAtom (sourceRanks P) 9 == allOneRankAtom (sourceRanks P) 76)) || ((allOneRankAtom (sourceRanks P) 8).ult (allOneRankAtom (sourceRanks P) 74)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (74 : Fin 78) (9 : Fin 78)
    (8 : Fin 78) (76 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (9 : Fin 13) (10 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (72 : Fin 78) (11 : Fin 78) (9 : Fin 78)
    (74 : Fin 78) (8 : Fin 78) (76 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4243` (kalmanson). -/
theorem middleSource_h4243 :
    ((!((allOneRankAtom (sourceRanks P) 74 == allOneRankAtom (sourceRanks P) 8)) || ((allOneRankAtom (sourceRanks P) 76).ult (allOneRankAtom (sourceRanks P) 9)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (9 : Fin 78) (74 : Fin 78)
    (76 : Fin 78) (8 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (9 : Fin 13) (10 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (72 : Fin 78) (11 : Fin 78) (9 : Fin 78)
    (74 : Fin 78) (8 : Fin 78) (76 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4244` (kalmanson). -/
theorem middleSource_h4244 :
    ((!((allOneRankAtom (sourceRanks P) 9 == allOneRankAtom (sourceRanks P) 11)) || ((allOneRankAtom (sourceRanks P) 72).ult (allOneRankAtom (sourceRanks P) 74)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (74 : Fin 78) (9 : Fin 78)
    (72 : Fin 78) (11 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (9 : Fin 13) (10 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (72 : Fin 78) (11 : Fin 78) (9 : Fin 78)
    (74 : Fin 78) (8 : Fin 78) (76 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4245` (kalmanson). -/
theorem middleSource_h4245 :
    ((!((allOneRankAtom (sourceRanks P) 9 == allOneRankAtom (sourceRanks P) 72)) || ((allOneRankAtom (sourceRanks P) 11).ult (allOneRankAtom (sourceRanks P) 74)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (74 : Fin 78) (9 : Fin 78)
    (11 : Fin 78) (72 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (9 : Fin 13) (10 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (72 : Fin 78) (11 : Fin 78) (9 : Fin 78)
    (74 : Fin 78) (8 : Fin 78) (76 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4246` (kalmanson). -/
theorem middleSource_h4246 :
    ((!((allOneRankAtom (sourceRanks P) 74 == allOneRankAtom (sourceRanks P) 72)) || ((allOneRankAtom (sourceRanks P) 11).ult (allOneRankAtom (sourceRanks P) 9)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (9 : Fin 78) (74 : Fin 78)
    (11 : Fin 78) (72 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (9 : Fin 13) (10 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (72 : Fin 78) (11 : Fin 78) (9 : Fin 78)
    (74 : Fin 78) (8 : Fin 78) (76 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4247` (kalmanson). -/
theorem middleSource_h4247 :
    ((!((allOneRankAtom (sourceRanks P) 10 == allOneRankAtom (sourceRanks P) 77)) || ((allOneRankAtom (sourceRanks P) 8).ult (allOneRankAtom (sourceRanks P) 74)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (74 : Fin 78) (10 : Fin 78)
    (8 : Fin 78) (77 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (9 : Fin 13) (11 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (73 : Fin 78) (11 : Fin 78) (10 : Fin 78)
    (74 : Fin 78) (8 : Fin 78) (77 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4248` (kalmanson). -/
theorem middleSource_h4248 :
    ((!((allOneRankAtom (sourceRanks P) 74 == allOneRankAtom (sourceRanks P) 8)) || ((allOneRankAtom (sourceRanks P) 77).ult (allOneRankAtom (sourceRanks P) 10)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (10 : Fin 78) (74 : Fin 78)
    (77 : Fin 78) (8 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (9 : Fin 13) (11 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (73 : Fin 78) (11 : Fin 78) (10 : Fin 78)
    (74 : Fin 78) (8 : Fin 78) (77 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4249` (kalmanson). -/
theorem middleSource_h4249 :
    ((!((allOneRankAtom (sourceRanks P) 10 == allOneRankAtom (sourceRanks P) 11)) || ((allOneRankAtom (sourceRanks P) 73).ult (allOneRankAtom (sourceRanks P) 74)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (74 : Fin 78) (10 : Fin 78)
    (73 : Fin 78) (11 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (9 : Fin 13) (11 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (73 : Fin 78) (11 : Fin 78) (10 : Fin 78)
    (74 : Fin 78) (8 : Fin 78) (77 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4250` (kalmanson). -/
theorem middleSource_h4250 :
    ((!((allOneRankAtom (sourceRanks P) 10 == allOneRankAtom (sourceRanks P) 73)) || ((allOneRankAtom (sourceRanks P) 11).ult (allOneRankAtom (sourceRanks P) 74)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (74 : Fin 78) (10 : Fin 78)
    (11 : Fin 78) (73 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (9 : Fin 13) (11 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (73 : Fin 78) (11 : Fin 78) (10 : Fin 78)
    (74 : Fin 78) (8 : Fin 78) (77 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4251` (kalmanson). -/
theorem middleSource_h4251 :
    ((!((allOneRankAtom (sourceRanks P) 74 == allOneRankAtom (sourceRanks P) 73)) || ((allOneRankAtom (sourceRanks P) 11).ult (allOneRankAtom (sourceRanks P) 10)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (10 : Fin 78) (74 : Fin 78)
    (11 : Fin 78) (73 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (9 : Fin 13) (11 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (73 : Fin 78) (11 : Fin 78) (10 : Fin 78)
    (74 : Fin 78) (8 : Fin 78) (77 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4252` (kalmanson). -/
theorem middleSource_h4252 :
    ((!((allOneRankAtom (sourceRanks P) 10 == allOneRankAtom (sourceRanks P) 77)) || ((allOneRankAtom (sourceRanks P) 9).ult (allOneRankAtom (sourceRanks P) 76)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (76 : Fin 78) (10 : Fin 78)
    (9 : Fin 78) (77 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (10 : Fin 13) (11 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (75 : Fin 78) (11 : Fin 78) (10 : Fin 78)
    (76 : Fin 78) (9 : Fin 78) (77 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4253` (kalmanson). -/
theorem middleSource_h4253 :
    ((!((allOneRankAtom (sourceRanks P) 76 == allOneRankAtom (sourceRanks P) 9)) || ((allOneRankAtom (sourceRanks P) 77).ult (allOneRankAtom (sourceRanks P) 10)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (10 : Fin 78) (76 : Fin 78)
    (77 : Fin 78) (9 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (10 : Fin 13) (11 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (75 : Fin 78) (11 : Fin 78) (10 : Fin 78)
    (76 : Fin 78) (9 : Fin 78) (77 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4254` (kalmanson). -/
theorem middleSource_h4254 :
    ((!((allOneRankAtom (sourceRanks P) 10 == allOneRankAtom (sourceRanks P) 75)) || ((allOneRankAtom (sourceRanks P) 11).ult (allOneRankAtom (sourceRanks P) 76)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (76 : Fin 78) (10 : Fin 78)
    (11 : Fin 78) (75 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (10 : Fin 13) (11 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (75 : Fin 78) (11 : Fin 78) (10 : Fin 78)
    (76 : Fin 78) (9 : Fin 78) (77 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4255` (kalmanson). -/
theorem middleSource_h4255 :
    ((!((allOneRankAtom (sourceRanks P) 76 == allOneRankAtom (sourceRanks P) 75)) || ((allOneRankAtom (sourceRanks P) 11).ult (allOneRankAtom (sourceRanks P) 10)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (10 : Fin 78) (76 : Fin 78)
    (11 : Fin 78) (75 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (10 : Fin 13) (11 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (75 : Fin 78) (11 : Fin 78) (10 : Fin 78)
    (76 : Fin 78) (9 : Fin 78) (77 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4256` (kalmanson). -/
theorem middleSource_h4256 :
    ((!((allOneRankAtom (sourceRanks P) 24 == allOneRankAtom (sourceRanks P) 12)) || ((allOneRankAtom (sourceRanks P) 33).ult (allOneRankAtom (sourceRanks P) 13)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (13 : Fin 78) (24 : Fin 78)
    (33 : Fin 78) (12 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (3 : Fin 13) (4 : Fin 13)
    (by decide) (by decide) (by decide)
    (23 : Fin 78) (14 : Fin 78) (13 : Fin 78)
    (24 : Fin 78) (12 : Fin 78) (33 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4257` (kalmanson). -/
theorem middleSource_h4257 :
    ((!((allOneRankAtom (sourceRanks P) 13 == allOneRankAtom (sourceRanks P) 14)) || ((allOneRankAtom (sourceRanks P) 23).ult (allOneRankAtom (sourceRanks P) 24)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (24 : Fin 78) (13 : Fin 78)
    (23 : Fin 78) (14 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (3 : Fin 13) (4 : Fin 13)
    (by decide) (by decide) (by decide)
    (23 : Fin 78) (14 : Fin 78) (13 : Fin 78)
    (24 : Fin 78) (12 : Fin 78) (33 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4258` (kalmanson). -/
theorem middleSource_h4258 :
    ((!((allOneRankAtom (sourceRanks P) 24 == allOneRankAtom (sourceRanks P) 23)) || ((allOneRankAtom (sourceRanks P) 14).ult (allOneRankAtom (sourceRanks P) 13)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (13 : Fin 78) (24 : Fin 78)
    (14 : Fin 78) (23 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (3 : Fin 13) (4 : Fin 13)
    (by decide) (by decide) (by decide)
    (23 : Fin 78) (14 : Fin 78) (13 : Fin 78)
    (24 : Fin 78) (12 : Fin 78) (33 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4259` (kalmanson). -/
theorem middleSource_h4259 :
    ((!((allOneRankAtom (sourceRanks P) 25 == allOneRankAtom (sourceRanks P) 12)) || ((allOneRankAtom (sourceRanks P) 34).ult (allOneRankAtom (sourceRanks P) 13)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (13 : Fin 78) (25 : Fin 78)
    (34 : Fin 78) (12 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (3 : Fin 13) (5 : Fin 13)
    (by decide) (by decide) (by decide)
    (23 : Fin 78) (15 : Fin 78) (13 : Fin 78)
    (25 : Fin 78) (12 : Fin 78) (34 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4260` (kalmanson). -/
theorem middleSource_h4260 :
    ((!((allOneRankAtom (sourceRanks P) 13 == allOneRankAtom (sourceRanks P) 15)) || ((allOneRankAtom (sourceRanks P) 23).ult (allOneRankAtom (sourceRanks P) 25)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (25 : Fin 78) (13 : Fin 78)
    (23 : Fin 78) (15 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (3 : Fin 13) (5 : Fin 13)
    (by decide) (by decide) (by decide)
    (23 : Fin 78) (15 : Fin 78) (13 : Fin 78)
    (25 : Fin 78) (12 : Fin 78) (34 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4261` (kalmanson). -/
theorem middleSource_h4261 :
    ((!((allOneRankAtom (sourceRanks P) 25 == allOneRankAtom (sourceRanks P) 23)) || ((allOneRankAtom (sourceRanks P) 15).ult (allOneRankAtom (sourceRanks P) 13)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (13 : Fin 78) (25 : Fin 78)
    (15 : Fin 78) (23 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (3 : Fin 13) (5 : Fin 13)
    (by decide) (by decide) (by decide)
    (23 : Fin 78) (15 : Fin 78) (13 : Fin 78)
    (25 : Fin 78) (12 : Fin 78) (34 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4262` (kalmanson). -/
theorem middleSource_h4262 :
    ((!((allOneRankAtom (sourceRanks P) 26 == allOneRankAtom (sourceRanks P) 12)) || ((allOneRankAtom (sourceRanks P) 35).ult (allOneRankAtom (sourceRanks P) 13)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (13 : Fin 78) (26 : Fin 78)
    (35 : Fin 78) (12 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (3 : Fin 13) (6 : Fin 13)
    (by decide) (by decide) (by decide)
    (23 : Fin 78) (16 : Fin 78) (13 : Fin 78)
    (26 : Fin 78) (12 : Fin 78) (35 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4263` (kalmanson). -/
theorem middleSource_h4263 :
    ((!((allOneRankAtom (sourceRanks P) 13 == allOneRankAtom (sourceRanks P) 16)) || ((allOneRankAtom (sourceRanks P) 23).ult (allOneRankAtom (sourceRanks P) 26)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (26 : Fin 78) (13 : Fin 78)
    (23 : Fin 78) (16 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (3 : Fin 13) (6 : Fin 13)
    (by decide) (by decide) (by decide)
    (23 : Fin 78) (16 : Fin 78) (13 : Fin 78)
    (26 : Fin 78) (12 : Fin 78) (35 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4264` (kalmanson). -/
theorem middleSource_h4264 :
    ((!((allOneRankAtom (sourceRanks P) 26 == allOneRankAtom (sourceRanks P) 23)) || ((allOneRankAtom (sourceRanks P) 16).ult (allOneRankAtom (sourceRanks P) 13)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (13 : Fin 78) (26 : Fin 78)
    (16 : Fin 78) (23 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (3 : Fin 13) (6 : Fin 13)
    (by decide) (by decide) (by decide)
    (23 : Fin 78) (16 : Fin 78) (13 : Fin 78)
    (26 : Fin 78) (12 : Fin 78) (35 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4265` (kalmanson). -/
theorem middleSource_h4265 :
    ((!((allOneRankAtom (sourceRanks P) 13 == allOneRankAtom (sourceRanks P) 17)) || ((allOneRankAtom (sourceRanks P) 23).ult (allOneRankAtom (sourceRanks P) 27)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (27 : Fin 78) (13 : Fin 78)
    (23 : Fin 78) (17 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (3 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (23 : Fin 78) (17 : Fin 78) (13 : Fin 78)
    (27 : Fin 78) (12 : Fin 78) (36 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4266` (kalmanson). -/
theorem middleSource_h4266 :
    ((!((allOneRankAtom (sourceRanks P) 27 == allOneRankAtom (sourceRanks P) 23)) || ((allOneRankAtom (sourceRanks P) 17).ult (allOneRankAtom (sourceRanks P) 13)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (13 : Fin 78) (27 : Fin 78)
    (17 : Fin 78) (23 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (3 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (23 : Fin 78) (17 : Fin 78) (13 : Fin 78)
    (27 : Fin 78) (12 : Fin 78) (36 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4267` (kalmanson). -/
theorem middleSource_h4267 :
    ((!((allOneRankAtom (sourceRanks P) 13 == allOneRankAtom (sourceRanks P) 12)) || ((allOneRankAtom (sourceRanks P) 37).ult (allOneRankAtom (sourceRanks P) 28)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (28 : Fin 78) (13 : Fin 78)
    (37 : Fin 78) (12 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (3 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (23 : Fin 78) (18 : Fin 78) (13 : Fin 78)
    (28 : Fin 78) (12 : Fin 78) (37 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4268` (kalmanson). -/
theorem middleSource_h4268 :
    ((!((allOneRankAtom (sourceRanks P) 13 == allOneRankAtom (sourceRanks P) 37)) || ((allOneRankAtom (sourceRanks P) 12).ult (allOneRankAtom (sourceRanks P) 28)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (28 : Fin 78) (13 : Fin 78)
    (12 : Fin 78) (37 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (3 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (23 : Fin 78) (18 : Fin 78) (13 : Fin 78)
    (28 : Fin 78) (12 : Fin 78) (37 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4269` (kalmanson). -/
theorem middleSource_h4269 :
    ((!((allOneRankAtom (sourceRanks P) 28 == allOneRankAtom (sourceRanks P) 12)) || ((allOneRankAtom (sourceRanks P) 37).ult (allOneRankAtom (sourceRanks P) 13)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (13 : Fin 78) (28 : Fin 78)
    (37 : Fin 78) (12 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (3 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (23 : Fin 78) (18 : Fin 78) (13 : Fin 78)
    (28 : Fin 78) (12 : Fin 78) (37 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4270` (kalmanson). -/
theorem middleSource_h4270 :
    ((!((allOneRankAtom (sourceRanks P) 28 == allOneRankAtom (sourceRanks P) 37)) || ((allOneRankAtom (sourceRanks P) 12).ult (allOneRankAtom (sourceRanks P) 13)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (13 : Fin 78) (28 : Fin 78)
    (12 : Fin 78) (37 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (3 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (23 : Fin 78) (18 : Fin 78) (13 : Fin 78)
    (28 : Fin 78) (12 : Fin 78) (37 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4271` (kalmanson). -/
theorem middleSource_h4271 :
    ((!((allOneRankAtom (sourceRanks P) 13 == allOneRankAtom (sourceRanks P) 23)) || ((allOneRankAtom (sourceRanks P) 18).ult (allOneRankAtom (sourceRanks P) 28)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (28 : Fin 78) (13 : Fin 78)
    (18 : Fin 78) (23 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (3 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (23 : Fin 78) (18 : Fin 78) (13 : Fin 78)
    (28 : Fin 78) (12 : Fin 78) (37 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4272` (kalmanson). -/
theorem middleSource_h4272 :
    ((!((allOneRankAtom (sourceRanks P) 28 == allOneRankAtom (sourceRanks P) 18)) || ((allOneRankAtom (sourceRanks P) 23).ult (allOneRankAtom (sourceRanks P) 13)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (13 : Fin 78) (28 : Fin 78)
    (23 : Fin 78) (18 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (3 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (23 : Fin 78) (18 : Fin 78) (13 : Fin 78)
    (28 : Fin 78) (12 : Fin 78) (37 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4273` (kalmanson). -/
theorem middleSource_h4273 :
    ((!((allOneRankAtom (sourceRanks P) 28 == allOneRankAtom (sourceRanks P) 23)) || ((allOneRankAtom (sourceRanks P) 18).ult (allOneRankAtom (sourceRanks P) 13)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (13 : Fin 78) (28 : Fin 78)
    (18 : Fin 78) (23 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (3 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (23 : Fin 78) (18 : Fin 78) (13 : Fin 78)
    (28 : Fin 78) (12 : Fin 78) (37 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4274` (kalmanson). -/
theorem middleSource_h4274 :
    ((!((allOneRankAtom (sourceRanks P) 29 == allOneRankAtom (sourceRanks P) 12)) || ((allOneRankAtom (sourceRanks P) 38).ult (allOneRankAtom (sourceRanks P) 13)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (13 : Fin 78) (29 : Fin 78)
    (38 : Fin 78) (12 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (3 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (23 : Fin 78) (19 : Fin 78) (13 : Fin 78)
    (29 : Fin 78) (12 : Fin 78) (38 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4275` (kalmanson). -/
theorem middleSource_h4275 :
    ((!((allOneRankAtom (sourceRanks P) 13 == allOneRankAtom (sourceRanks P) 19)) || ((allOneRankAtom (sourceRanks P) 23).ult (allOneRankAtom (sourceRanks P) 29)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (29 : Fin 78) (13 : Fin 78)
    (23 : Fin 78) (19 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (3 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (23 : Fin 78) (19 : Fin 78) (13 : Fin 78)
    (29 : Fin 78) (12 : Fin 78) (38 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4276` (kalmanson). -/
theorem middleSource_h4276 :
    ((!((allOneRankAtom (sourceRanks P) 29 == allOneRankAtom (sourceRanks P) 23)) || ((allOneRankAtom (sourceRanks P) 19).ult (allOneRankAtom (sourceRanks P) 13)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (13 : Fin 78) (29 : Fin 78)
    (19 : Fin 78) (23 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (3 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (23 : Fin 78) (19 : Fin 78) (13 : Fin 78)
    (29 : Fin 78) (12 : Fin 78) (38 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4277` (kalmanson). -/
theorem middleSource_h4277 :
    ((!((allOneRankAtom (sourceRanks P) 30 == allOneRankAtom (sourceRanks P) 12)) || ((allOneRankAtom (sourceRanks P) 39).ult (allOneRankAtom (sourceRanks P) 13)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (13 : Fin 78) (30 : Fin 78)
    (39 : Fin 78) (12 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (3 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (23 : Fin 78) (20 : Fin 78) (13 : Fin 78)
    (30 : Fin 78) (12 : Fin 78) (39 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4278` (kalmanson). -/
theorem middleSource_h4278 :
    ((!((allOneRankAtom (sourceRanks P) 13 == allOneRankAtom (sourceRanks P) 20)) || ((allOneRankAtom (sourceRanks P) 23).ult (allOneRankAtom (sourceRanks P) 30)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (30 : Fin 78) (13 : Fin 78)
    (23 : Fin 78) (20 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (3 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (23 : Fin 78) (20 : Fin 78) (13 : Fin 78)
    (30 : Fin 78) (12 : Fin 78) (39 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4279` (kalmanson). -/
theorem middleSource_h4279 :
    ((!((allOneRankAtom (sourceRanks P) 30 == allOneRankAtom (sourceRanks P) 23)) || ((allOneRankAtom (sourceRanks P) 20).ult (allOneRankAtom (sourceRanks P) 13)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (13 : Fin 78) (30 : Fin 78)
    (20 : Fin 78) (23 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (3 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (23 : Fin 78) (20 : Fin 78) (13 : Fin 78)
    (30 : Fin 78) (12 : Fin 78) (39 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4280` (kalmanson). -/
theorem middleSource_h4280 :
    ((!((allOneRankAtom (sourceRanks P) 31 == allOneRankAtom (sourceRanks P) 12)) || ((allOneRankAtom (sourceRanks P) 40).ult (allOneRankAtom (sourceRanks P) 13)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (13 : Fin 78) (31 : Fin 78)
    (40 : Fin 78) (12 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (3 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (23 : Fin 78) (21 : Fin 78) (13 : Fin 78)
    (31 : Fin 78) (12 : Fin 78) (40 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4281` (kalmanson). -/
theorem middleSource_h4281 :
    ((!((allOneRankAtom (sourceRanks P) 13 == allOneRankAtom (sourceRanks P) 21)) || ((allOneRankAtom (sourceRanks P) 23).ult (allOneRankAtom (sourceRanks P) 31)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (31 : Fin 78) (13 : Fin 78)
    (23 : Fin 78) (21 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (3 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (23 : Fin 78) (21 : Fin 78) (13 : Fin 78)
    (31 : Fin 78) (12 : Fin 78) (40 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4282` (kalmanson). -/
theorem middleSource_h4282 :
    ((!((allOneRankAtom (sourceRanks P) 31 == allOneRankAtom (sourceRanks P) 23)) || ((allOneRankAtom (sourceRanks P) 21).ult (allOneRankAtom (sourceRanks P) 13)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (13 : Fin 78) (31 : Fin 78)
    (21 : Fin 78) (23 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (3 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (23 : Fin 78) (21 : Fin 78) (13 : Fin 78)
    (31 : Fin 78) (12 : Fin 78) (40 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4283` (kalmanson). -/
theorem middleSource_h4283 :
    ((!((allOneRankAtom (sourceRanks P) 13 == allOneRankAtom (sourceRanks P) 41)) || ((allOneRankAtom (sourceRanks P) 12).ult (allOneRankAtom (sourceRanks P) 32)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (32 : Fin 78) (13 : Fin 78)
    (12 : Fin 78) (41 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (3 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (23 : Fin 78) (22 : Fin 78) (13 : Fin 78)
    (32 : Fin 78) (12 : Fin 78) (41 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4284` (kalmanson). -/
theorem middleSource_h4284 :
    ((!((allOneRankAtom (sourceRanks P) 32 == allOneRankAtom (sourceRanks P) 12)) || ((allOneRankAtom (sourceRanks P) 41).ult (allOneRankAtom (sourceRanks P) 13)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (13 : Fin 78) (32 : Fin 78)
    (41 : Fin 78) (12 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (3 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (23 : Fin 78) (22 : Fin 78) (13 : Fin 78)
    (32 : Fin 78) (12 : Fin 78) (41 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4285` (kalmanson). -/
theorem middleSource_h4285 :
    ((!((allOneRankAtom (sourceRanks P) 13 == allOneRankAtom (sourceRanks P) 22)) || ((allOneRankAtom (sourceRanks P) 23).ult (allOneRankAtom (sourceRanks P) 32)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (32 : Fin 78) (13 : Fin 78)
    (23 : Fin 78) (22 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (3 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (23 : Fin 78) (22 : Fin 78) (13 : Fin 78)
    (32 : Fin 78) (12 : Fin 78) (41 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4286` (kalmanson). -/
theorem middleSource_h4286 :
    ((!((allOneRankAtom (sourceRanks P) 14 == allOneRankAtom (sourceRanks P) 12)) || ((allOneRankAtom (sourceRanks P) 42).ult (allOneRankAtom (sourceRanks P) 25)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (25 : Fin 78) (14 : Fin 78)
    (42 : Fin 78) (12 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (4 : Fin 13) (5 : Fin 13)
    (by decide) (by decide) (by decide)
    (24 : Fin 78) (15 : Fin 78) (14 : Fin 78)
    (25 : Fin 78) (12 : Fin 78) (42 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4287` (kalmanson). -/
theorem middleSource_h4287 :
    ((!((allOneRankAtom (sourceRanks P) 25 == allOneRankAtom (sourceRanks P) 12)) || ((allOneRankAtom (sourceRanks P) 42).ult (allOneRankAtom (sourceRanks P) 14)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (14 : Fin 78) (25 : Fin 78)
    (42 : Fin 78) (12 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (4 : Fin 13) (5 : Fin 13)
    (by decide) (by decide) (by decide)
    (24 : Fin 78) (15 : Fin 78) (14 : Fin 78)
    (25 : Fin 78) (12 : Fin 78) (42 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

end

end ATailExactFiveCard13AllOneSourceIngressScratch
end Problem97
