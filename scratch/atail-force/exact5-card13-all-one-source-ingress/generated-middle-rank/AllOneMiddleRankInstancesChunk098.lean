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

/-- Candidate middle source assertion `h6272` (kalmanson). -/
theorem middleSource_h6272 :
    ((!((allOneRankAtom (sourceRanks P) 59 == allOneRankAtom (sourceRanks P) 38)) || ((allOneRankAtom (sourceRanks P) 57).ult (allOneRankAtom (sourceRanks P) 36)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (36 : Fin 78) (59 : Fin 78)
    (57 : Fin 78) (38 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (6 : Fin 13) (7 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (38 : Fin 78) (36 : Fin 78)
    (59 : Fin 78) (35 : Fin 78) (64 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6273` (kalmanson). -/
theorem middleSource_h6273 :
    ((!((allOneRankAtom (sourceRanks P) 59 == allOneRankAtom (sourceRanks P) 57)) || ((allOneRankAtom (sourceRanks P) 38).ult (allOneRankAtom (sourceRanks P) 36)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (36 : Fin 78) (59 : Fin 78)
    (38 : Fin 78) (57 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (6 : Fin 13) (7 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (38 : Fin 78) (36 : Fin 78)
    (59 : Fin 78) (35 : Fin 78) (64 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6274` (kalmanson). -/
theorem middleSource_h6274 :
    ((!((allOneRankAtom (sourceRanks P) 36 == allOneRankAtom (sourceRanks P) 35)) || ((allOneRankAtom (sourceRanks P) 65).ult (allOneRankAtom (sourceRanks P) 60)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (60 : Fin 78) (36 : Fin 78)
    (65 : Fin 78) (35 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (6 : Fin 13) (7 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (39 : Fin 78) (36 : Fin 78)
    (60 : Fin 78) (35 : Fin 78) (65 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6275` (kalmanson). -/
theorem middleSource_h6275 :
    ((!((allOneRankAtom (sourceRanks P) 60 == allOneRankAtom (sourceRanks P) 35)) || ((allOneRankAtom (sourceRanks P) 65).ult (allOneRankAtom (sourceRanks P) 36)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (36 : Fin 78) (60 : Fin 78)
    (65 : Fin 78) (35 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (6 : Fin 13) (7 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (39 : Fin 78) (36 : Fin 78)
    (60 : Fin 78) (35 : Fin 78) (65 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6276` (kalmanson). -/
theorem middleSource_h6276 :
    ((!((allOneRankAtom (sourceRanks P) 60 == allOneRankAtom (sourceRanks P) 65)) || ((allOneRankAtom (sourceRanks P) 35).ult (allOneRankAtom (sourceRanks P) 36)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (36 : Fin 78) (60 : Fin 78)
    (35 : Fin 78) (65 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (6 : Fin 13) (7 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (39 : Fin 78) (36 : Fin 78)
    (60 : Fin 78) (35 : Fin 78) (65 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6277` (kalmanson). -/
theorem middleSource_h6277 :
    ((!((allOneRankAtom (sourceRanks P) 60 == allOneRankAtom (sourceRanks P) 39)) || ((allOneRankAtom (sourceRanks P) 57).ult (allOneRankAtom (sourceRanks P) 36)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (36 : Fin 78) (60 : Fin 78)
    (57 : Fin 78) (39 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (6 : Fin 13) (7 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (39 : Fin 78) (36 : Fin 78)
    (60 : Fin 78) (35 : Fin 78) (65 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6278` (kalmanson). -/
theorem middleSource_h6278 :
    ((!((allOneRankAtom (sourceRanks P) 60 == allOneRankAtom (sourceRanks P) 57)) || ((allOneRankAtom (sourceRanks P) 39).ult (allOneRankAtom (sourceRanks P) 36)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (36 : Fin 78) (60 : Fin 78)
    (39 : Fin 78) (57 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (6 : Fin 13) (7 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (39 : Fin 78) (36 : Fin 78)
    (60 : Fin 78) (35 : Fin 78) (65 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6279` (kalmanson). -/
theorem middleSource_h6279 :
    ((!((allOneRankAtom (sourceRanks P) 36 == allOneRankAtom (sourceRanks P) 35)) || ((allOneRankAtom (sourceRanks P) 66).ult (allOneRankAtom (sourceRanks P) 61)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (61 : Fin 78) (36 : Fin 78)
    (66 : Fin 78) (35 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (6 : Fin 13) (7 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (40 : Fin 78) (36 : Fin 78)
    (61 : Fin 78) (35 : Fin 78) (66 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6280` (kalmanson). -/
theorem middleSource_h6280 :
    ((!((allOneRankAtom (sourceRanks P) 61 == allOneRankAtom (sourceRanks P) 35)) || ((allOneRankAtom (sourceRanks P) 66).ult (allOneRankAtom (sourceRanks P) 36)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (36 : Fin 78) (61 : Fin 78)
    (66 : Fin 78) (35 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (6 : Fin 13) (7 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (40 : Fin 78) (36 : Fin 78)
    (61 : Fin 78) (35 : Fin 78) (66 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6281` (kalmanson). -/
theorem middleSource_h6281 :
    ((!((allOneRankAtom (sourceRanks P) 61 == allOneRankAtom (sourceRanks P) 66)) || ((allOneRankAtom (sourceRanks P) 35).ult (allOneRankAtom (sourceRanks P) 36)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (36 : Fin 78) (61 : Fin 78)
    (35 : Fin 78) (66 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (6 : Fin 13) (7 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (40 : Fin 78) (36 : Fin 78)
    (61 : Fin 78) (35 : Fin 78) (66 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6282` (kalmanson). -/
theorem middleSource_h6282 :
    ((!((allOneRankAtom (sourceRanks P) 36 == allOneRankAtom (sourceRanks P) 40)) || ((allOneRankAtom (sourceRanks P) 57).ult (allOneRankAtom (sourceRanks P) 61)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (61 : Fin 78) (36 : Fin 78)
    (57 : Fin 78) (40 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (6 : Fin 13) (7 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (40 : Fin 78) (36 : Fin 78)
    (61 : Fin 78) (35 : Fin 78) (66 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6283` (kalmanson). -/
theorem middleSource_h6283 :
    ((!((allOneRankAtom (sourceRanks P) 61 == allOneRankAtom (sourceRanks P) 40)) || ((allOneRankAtom (sourceRanks P) 57).ult (allOneRankAtom (sourceRanks P) 36)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (36 : Fin 78) (61 : Fin 78)
    (57 : Fin 78) (40 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (6 : Fin 13) (7 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (40 : Fin 78) (36 : Fin 78)
    (61 : Fin 78) (35 : Fin 78) (66 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6284` (kalmanson). -/
theorem middleSource_h6284 :
    ((!((allOneRankAtom (sourceRanks P) 61 == allOneRankAtom (sourceRanks P) 57)) || ((allOneRankAtom (sourceRanks P) 40).ult (allOneRankAtom (sourceRanks P) 36)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (36 : Fin 78) (61 : Fin 78)
    (40 : Fin 78) (57 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (6 : Fin 13) (7 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (40 : Fin 78) (36 : Fin 78)
    (61 : Fin 78) (35 : Fin 78) (66 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6285` (kalmanson). -/
theorem middleSource_h6285 :
    ((!((allOneRankAtom (sourceRanks P) 36 == allOneRankAtom (sourceRanks P) 35)) || ((allOneRankAtom (sourceRanks P) 67).ult (allOneRankAtom (sourceRanks P) 62)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (62 : Fin 78) (36 : Fin 78)
    (67 : Fin 78) (35 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (6 : Fin 13) (7 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (41 : Fin 78) (36 : Fin 78)
    (62 : Fin 78) (35 : Fin 78) (67 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6286` (kalmanson). -/
theorem middleSource_h6286 :
    ((!((allOneRankAtom (sourceRanks P) 62 == allOneRankAtom (sourceRanks P) 35)) || ((allOneRankAtom (sourceRanks P) 67).ult (allOneRankAtom (sourceRanks P) 36)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (36 : Fin 78) (62 : Fin 78)
    (67 : Fin 78) (35 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (6 : Fin 13) (7 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (41 : Fin 78) (36 : Fin 78)
    (62 : Fin 78) (35 : Fin 78) (67 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6287` (kalmanson). -/
theorem middleSource_h6287 :
    ((!((allOneRankAtom (sourceRanks P) 62 == allOneRankAtom (sourceRanks P) 57)) || ((allOneRankAtom (sourceRanks P) 41).ult (allOneRankAtom (sourceRanks P) 36)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (36 : Fin 78) (62 : Fin 78)
    (41 : Fin 78) (57 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (6 : Fin 13) (7 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (41 : Fin 78) (36 : Fin 78)
    (62 : Fin 78) (35 : Fin 78) (67 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6288` (kalmanson). -/
theorem middleSource_h6288 :
    ((!((allOneRankAtom (sourceRanks P) 37 == allOneRankAtom (sourceRanks P) 35)) || ((allOneRankAtom (sourceRanks P) 68).ult (allOneRankAtom (sourceRanks P) 59)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (59 : Fin 78) (37 : Fin 78)
    (68 : Fin 78) (35 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (6 : Fin 13) (8 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (58 : Fin 78) (38 : Fin 78) (37 : Fin 78)
    (59 : Fin 78) (35 : Fin 78) (68 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6289` (kalmanson). -/
theorem middleSource_h6289 :
    ((!((allOneRankAtom (sourceRanks P) 37 == allOneRankAtom (sourceRanks P) 68)) || ((allOneRankAtom (sourceRanks P) 35).ult (allOneRankAtom (sourceRanks P) 59)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (59 : Fin 78) (37 : Fin 78)
    (35 : Fin 78) (68 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (6 : Fin 13) (8 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (58 : Fin 78) (38 : Fin 78) (37 : Fin 78)
    (59 : Fin 78) (35 : Fin 78) (68 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6290` (kalmanson). -/
theorem middleSource_h6290 :
    ((!((allOneRankAtom (sourceRanks P) 59 == allOneRankAtom (sourceRanks P) 35)) || ((allOneRankAtom (sourceRanks P) 68).ult (allOneRankAtom (sourceRanks P) 37)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (37 : Fin 78) (59 : Fin 78)
    (68 : Fin 78) (35 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (6 : Fin 13) (8 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (58 : Fin 78) (38 : Fin 78) (37 : Fin 78)
    (59 : Fin 78) (35 : Fin 78) (68 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6291` (kalmanson). -/
theorem middleSource_h6291 :
    ((!((allOneRankAtom (sourceRanks P) 59 == allOneRankAtom (sourceRanks P) 68)) || ((allOneRankAtom (sourceRanks P) 35).ult (allOneRankAtom (sourceRanks P) 37)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (37 : Fin 78) (59 : Fin 78)
    (35 : Fin 78) (68 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (6 : Fin 13) (8 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (58 : Fin 78) (38 : Fin 78) (37 : Fin 78)
    (59 : Fin 78) (35 : Fin 78) (68 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6292` (kalmanson). -/
theorem middleSource_h6292 :
    ((!((allOneRankAtom (sourceRanks P) 37 == allOneRankAtom (sourceRanks P) 38)) || ((allOneRankAtom (sourceRanks P) 58).ult (allOneRankAtom (sourceRanks P) 59)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (59 : Fin 78) (37 : Fin 78)
    (58 : Fin 78) (38 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (6 : Fin 13) (8 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (58 : Fin 78) (38 : Fin 78) (37 : Fin 78)
    (59 : Fin 78) (35 : Fin 78) (68 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6293` (kalmanson). -/
theorem middleSource_h6293 :
    ((!((allOneRankAtom (sourceRanks P) 37 == allOneRankAtom (sourceRanks P) 58)) || ((allOneRankAtom (sourceRanks P) 38).ult (allOneRankAtom (sourceRanks P) 59)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (59 : Fin 78) (37 : Fin 78)
    (38 : Fin 78) (58 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (6 : Fin 13) (8 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (58 : Fin 78) (38 : Fin 78) (37 : Fin 78)
    (59 : Fin 78) (35 : Fin 78) (68 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6294` (kalmanson). -/
theorem middleSource_h6294 :
    ((!((allOneRankAtom (sourceRanks P) 59 == allOneRankAtom (sourceRanks P) 38)) || ((allOneRankAtom (sourceRanks P) 58).ult (allOneRankAtom (sourceRanks P) 37)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (37 : Fin 78) (59 : Fin 78)
    (58 : Fin 78) (38 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (6 : Fin 13) (8 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (58 : Fin 78) (38 : Fin 78) (37 : Fin 78)
    (59 : Fin 78) (35 : Fin 78) (68 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6295` (kalmanson). -/
theorem middleSource_h6295 :
    ((!((allOneRankAtom (sourceRanks P) 59 == allOneRankAtom (sourceRanks P) 58)) || ((allOneRankAtom (sourceRanks P) 38).ult (allOneRankAtom (sourceRanks P) 37)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (37 : Fin 78) (59 : Fin 78)
    (38 : Fin 78) (58 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (6 : Fin 13) (8 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (58 : Fin 78) (38 : Fin 78) (37 : Fin 78)
    (59 : Fin 78) (35 : Fin 78) (68 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6296` (kalmanson). -/
theorem middleSource_h6296 :
    ((!((allOneRankAtom (sourceRanks P) 37 == allOneRankAtom (sourceRanks P) 35)) || ((allOneRankAtom (sourceRanks P) 69).ult (allOneRankAtom (sourceRanks P) 60)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (60 : Fin 78) (37 : Fin 78)
    (69 : Fin 78) (35 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (6 : Fin 13) (8 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (58 : Fin 78) (39 : Fin 78) (37 : Fin 78)
    (60 : Fin 78) (35 : Fin 78) (69 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6297` (kalmanson). -/
theorem middleSource_h6297 :
    ((!((allOneRankAtom (sourceRanks P) 37 == allOneRankAtom (sourceRanks P) 69)) || ((allOneRankAtom (sourceRanks P) 35).ult (allOneRankAtom (sourceRanks P) 60)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (60 : Fin 78) (37 : Fin 78)
    (35 : Fin 78) (69 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (6 : Fin 13) (8 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (58 : Fin 78) (39 : Fin 78) (37 : Fin 78)
    (60 : Fin 78) (35 : Fin 78) (69 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6298` (kalmanson). -/
theorem middleSource_h6298 :
    ((!((allOneRankAtom (sourceRanks P) 60 == allOneRankAtom (sourceRanks P) 35)) || ((allOneRankAtom (sourceRanks P) 69).ult (allOneRankAtom (sourceRanks P) 37)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (37 : Fin 78) (60 : Fin 78)
    (69 : Fin 78) (35 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (6 : Fin 13) (8 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (58 : Fin 78) (39 : Fin 78) (37 : Fin 78)
    (60 : Fin 78) (35 : Fin 78) (69 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6299` (kalmanson). -/
theorem middleSource_h6299 :
    ((!((allOneRankAtom (sourceRanks P) 60 == allOneRankAtom (sourceRanks P) 69)) || ((allOneRankAtom (sourceRanks P) 35).ult (allOneRankAtom (sourceRanks P) 37)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (37 : Fin 78) (60 : Fin 78)
    (35 : Fin 78) (69 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (6 : Fin 13) (8 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (58 : Fin 78) (39 : Fin 78) (37 : Fin 78)
    (60 : Fin 78) (35 : Fin 78) (69 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6300` (kalmanson). -/
theorem middleSource_h6300 :
    ((!((allOneRankAtom (sourceRanks P) 37 == allOneRankAtom (sourceRanks P) 39)) || ((allOneRankAtom (sourceRanks P) 58).ult (allOneRankAtom (sourceRanks P) 60)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (60 : Fin 78) (37 : Fin 78)
    (58 : Fin 78) (39 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (6 : Fin 13) (8 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (58 : Fin 78) (39 : Fin 78) (37 : Fin 78)
    (60 : Fin 78) (35 : Fin 78) (69 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6301` (kalmanson). -/
theorem middleSource_h6301 :
    ((!((allOneRankAtom (sourceRanks P) 37 == allOneRankAtom (sourceRanks P) 58)) || ((allOneRankAtom (sourceRanks P) 39).ult (allOneRankAtom (sourceRanks P) 60)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (60 : Fin 78) (37 : Fin 78)
    (39 : Fin 78) (58 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (6 : Fin 13) (8 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (58 : Fin 78) (39 : Fin 78) (37 : Fin 78)
    (60 : Fin 78) (35 : Fin 78) (69 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6302` (kalmanson). -/
theorem middleSource_h6302 :
    ((!((allOneRankAtom (sourceRanks P) 60 == allOneRankAtom (sourceRanks P) 39)) || ((allOneRankAtom (sourceRanks P) 58).ult (allOneRankAtom (sourceRanks P) 37)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (37 : Fin 78) (60 : Fin 78)
    (58 : Fin 78) (39 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (6 : Fin 13) (8 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (58 : Fin 78) (39 : Fin 78) (37 : Fin 78)
    (60 : Fin 78) (35 : Fin 78) (69 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6303` (kalmanson). -/
theorem middleSource_h6303 :
    ((!((allOneRankAtom (sourceRanks P) 60 == allOneRankAtom (sourceRanks P) 58)) || ((allOneRankAtom (sourceRanks P) 39).ult (allOneRankAtom (sourceRanks P) 37)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (37 : Fin 78) (60 : Fin 78)
    (39 : Fin 78) (58 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (6 : Fin 13) (8 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (58 : Fin 78) (39 : Fin 78) (37 : Fin 78)
    (60 : Fin 78) (35 : Fin 78) (69 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6304` (kalmanson). -/
theorem middleSource_h6304 :
    ((!((allOneRankAtom (sourceRanks P) 37 == allOneRankAtom (sourceRanks P) 35)) || ((allOneRankAtom (sourceRanks P) 70).ult (allOneRankAtom (sourceRanks P) 61)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (61 : Fin 78) (37 : Fin 78)
    (70 : Fin 78) (35 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (6 : Fin 13) (8 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (58 : Fin 78) (40 : Fin 78) (37 : Fin 78)
    (61 : Fin 78) (35 : Fin 78) (70 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6305` (kalmanson). -/
theorem middleSource_h6305 :
    ((!((allOneRankAtom (sourceRanks P) 37 == allOneRankAtom (sourceRanks P) 70)) || ((allOneRankAtom (sourceRanks P) 35).ult (allOneRankAtom (sourceRanks P) 61)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (61 : Fin 78) (37 : Fin 78)
    (35 : Fin 78) (70 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (6 : Fin 13) (8 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (58 : Fin 78) (40 : Fin 78) (37 : Fin 78)
    (61 : Fin 78) (35 : Fin 78) (70 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6306` (kalmanson). -/
theorem middleSource_h6306 :
    ((!((allOneRankAtom (sourceRanks P) 61 == allOneRankAtom (sourceRanks P) 35)) || ((allOneRankAtom (sourceRanks P) 70).ult (allOneRankAtom (sourceRanks P) 37)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (37 : Fin 78) (61 : Fin 78)
    (70 : Fin 78) (35 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (6 : Fin 13) (8 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (58 : Fin 78) (40 : Fin 78) (37 : Fin 78)
    (61 : Fin 78) (35 : Fin 78) (70 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6307` (kalmanson). -/
theorem middleSource_h6307 :
    ((!((allOneRankAtom (sourceRanks P) 61 == allOneRankAtom (sourceRanks P) 70)) || ((allOneRankAtom (sourceRanks P) 35).ult (allOneRankAtom (sourceRanks P) 37)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (37 : Fin 78) (61 : Fin 78)
    (35 : Fin 78) (70 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (6 : Fin 13) (8 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (58 : Fin 78) (40 : Fin 78) (37 : Fin 78)
    (61 : Fin 78) (35 : Fin 78) (70 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6308` (kalmanson). -/
theorem middleSource_h6308 :
    ((!((allOneRankAtom (sourceRanks P) 37 == allOneRankAtom (sourceRanks P) 40)) || ((allOneRankAtom (sourceRanks P) 58).ult (allOneRankAtom (sourceRanks P) 61)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (61 : Fin 78) (37 : Fin 78)
    (58 : Fin 78) (40 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (6 : Fin 13) (8 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (58 : Fin 78) (40 : Fin 78) (37 : Fin 78)
    (61 : Fin 78) (35 : Fin 78) (70 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6309` (kalmanson). -/
theorem middleSource_h6309 :
    ((!((allOneRankAtom (sourceRanks P) 37 == allOneRankAtom (sourceRanks P) 58)) || ((allOneRankAtom (sourceRanks P) 40).ult (allOneRankAtom (sourceRanks P) 61)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (61 : Fin 78) (37 : Fin 78)
    (40 : Fin 78) (58 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (6 : Fin 13) (8 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (58 : Fin 78) (40 : Fin 78) (37 : Fin 78)
    (61 : Fin 78) (35 : Fin 78) (70 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6310` (kalmanson). -/
theorem middleSource_h6310 :
    ((!((allOneRankAtom (sourceRanks P) 61 == allOneRankAtom (sourceRanks P) 40)) || ((allOneRankAtom (sourceRanks P) 58).ult (allOneRankAtom (sourceRanks P) 37)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (37 : Fin 78) (61 : Fin 78)
    (58 : Fin 78) (40 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (6 : Fin 13) (8 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (58 : Fin 78) (40 : Fin 78) (37 : Fin 78)
    (61 : Fin 78) (35 : Fin 78) (70 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6311` (kalmanson). -/
theorem middleSource_h6311 :
    ((!((allOneRankAtom (sourceRanks P) 61 == allOneRankAtom (sourceRanks P) 58)) || ((allOneRankAtom (sourceRanks P) 40).ult (allOneRankAtom (sourceRanks P) 37)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (37 : Fin 78) (61 : Fin 78)
    (40 : Fin 78) (58 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (6 : Fin 13) (8 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (58 : Fin 78) (40 : Fin 78) (37 : Fin 78)
    (61 : Fin 78) (35 : Fin 78) (70 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6312` (kalmanson). -/
theorem middleSource_h6312 :
    ((!((allOneRankAtom (sourceRanks P) 37 == allOneRankAtom (sourceRanks P) 35)) || ((allOneRankAtom (sourceRanks P) 71).ult (allOneRankAtom (sourceRanks P) 62)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (62 : Fin 78) (37 : Fin 78)
    (71 : Fin 78) (35 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (6 : Fin 13) (8 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (58 : Fin 78) (41 : Fin 78) (37 : Fin 78)
    (62 : Fin 78) (35 : Fin 78) (71 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6313` (kalmanson). -/
theorem middleSource_h6313 :
    ((!((allOneRankAtom (sourceRanks P) 37 == allOneRankAtom (sourceRanks P) 71)) || ((allOneRankAtom (sourceRanks P) 35).ult (allOneRankAtom (sourceRanks P) 62)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (62 : Fin 78) (37 : Fin 78)
    (35 : Fin 78) (71 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (6 : Fin 13) (8 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (58 : Fin 78) (41 : Fin 78) (37 : Fin 78)
    (62 : Fin 78) (35 : Fin 78) (71 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6314` (kalmanson). -/
theorem middleSource_h6314 :
    ((!((allOneRankAtom (sourceRanks P) 62 == allOneRankAtom (sourceRanks P) 35)) || ((allOneRankAtom (sourceRanks P) 71).ult (allOneRankAtom (sourceRanks P) 37)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (37 : Fin 78) (62 : Fin 78)
    (71 : Fin 78) (35 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (6 : Fin 13) (8 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (58 : Fin 78) (41 : Fin 78) (37 : Fin 78)
    (62 : Fin 78) (35 : Fin 78) (71 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6315` (kalmanson). -/
theorem middleSource_h6315 :
    ((!((allOneRankAtom (sourceRanks P) 37 == allOneRankAtom (sourceRanks P) 58)) || ((allOneRankAtom (sourceRanks P) 41).ult (allOneRankAtom (sourceRanks P) 62)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (62 : Fin 78) (37 : Fin 78)
    (41 : Fin 78) (58 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (6 : Fin 13) (8 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (58 : Fin 78) (41 : Fin 78) (37 : Fin 78)
    (62 : Fin 78) (35 : Fin 78) (71 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6316` (kalmanson). -/
theorem middleSource_h6316 :
    ((!((allOneRankAtom (sourceRanks P) 62 == allOneRankAtom (sourceRanks P) 58)) || ((allOneRankAtom (sourceRanks P) 41).ult (allOneRankAtom (sourceRanks P) 37)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (37 : Fin 78) (62 : Fin 78)
    (41 : Fin 78) (58 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (6 : Fin 13) (8 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (58 : Fin 78) (41 : Fin 78) (37 : Fin 78)
    (62 : Fin 78) (35 : Fin 78) (71 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6317` (kalmanson). -/
theorem middleSource_h6317 :
    ((!((allOneRankAtom (sourceRanks P) 38 == allOneRankAtom (sourceRanks P) 35)) || ((allOneRankAtom (sourceRanks P) 72).ult (allOneRankAtom (sourceRanks P) 60)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (60 : Fin 78) (38 : Fin 78)
    (72 : Fin 78) (35 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (6 : Fin 13) (9 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (59 : Fin 78) (39 : Fin 78) (38 : Fin 78)
    (60 : Fin 78) (35 : Fin 78) (72 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6318` (kalmanson). -/
theorem middleSource_h6318 :
    ((!((allOneRankAtom (sourceRanks P) 38 == allOneRankAtom (sourceRanks P) 72)) || ((allOneRankAtom (sourceRanks P) 35).ult (allOneRankAtom (sourceRanks P) 60)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (60 : Fin 78) (38 : Fin 78)
    (35 : Fin 78) (72 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (6 : Fin 13) (9 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (59 : Fin 78) (39 : Fin 78) (38 : Fin 78)
    (60 : Fin 78) (35 : Fin 78) (72 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6319` (kalmanson). -/
theorem middleSource_h6319 :
    ((!((allOneRankAtom (sourceRanks P) 60 == allOneRankAtom (sourceRanks P) 35)) || ((allOneRankAtom (sourceRanks P) 72).ult (allOneRankAtom (sourceRanks P) 38)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (38 : Fin 78) (60 : Fin 78)
    (72 : Fin 78) (35 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (6 : Fin 13) (9 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (59 : Fin 78) (39 : Fin 78) (38 : Fin 78)
    (60 : Fin 78) (35 : Fin 78) (72 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6320` (kalmanson). -/
theorem middleSource_h6320 :
    ((!((allOneRankAtom (sourceRanks P) 60 == allOneRankAtom (sourceRanks P) 72)) || ((allOneRankAtom (sourceRanks P) 35).ult (allOneRankAtom (sourceRanks P) 38)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (38 : Fin 78) (60 : Fin 78)
    (35 : Fin 78) (72 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (6 : Fin 13) (9 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (59 : Fin 78) (39 : Fin 78) (38 : Fin 78)
    (60 : Fin 78) (35 : Fin 78) (72 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6321` (kalmanson). -/
theorem middleSource_h6321 :
    ((!((allOneRankAtom (sourceRanks P) 38 == allOneRankAtom (sourceRanks P) 59)) || ((allOneRankAtom (sourceRanks P) 39).ult (allOneRankAtom (sourceRanks P) 60)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (60 : Fin 78) (38 : Fin 78)
    (39 : Fin 78) (59 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (6 : Fin 13) (9 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (59 : Fin 78) (39 : Fin 78) (38 : Fin 78)
    (60 : Fin 78) (35 : Fin 78) (72 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6322` (kalmanson). -/
theorem middleSource_h6322 :
    ((!((allOneRankAtom (sourceRanks P) 60 == allOneRankAtom (sourceRanks P) 39)) || ((allOneRankAtom (sourceRanks P) 59).ult (allOneRankAtom (sourceRanks P) 38)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (38 : Fin 78) (60 : Fin 78)
    (59 : Fin 78) (39 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (6 : Fin 13) (9 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (59 : Fin 78) (39 : Fin 78) (38 : Fin 78)
    (60 : Fin 78) (35 : Fin 78) (72 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6323` (kalmanson). -/
theorem middleSource_h6323 :
    ((!((allOneRankAtom (sourceRanks P) 60 == allOneRankAtom (sourceRanks P) 59)) || ((allOneRankAtom (sourceRanks P) 39).ult (allOneRankAtom (sourceRanks P) 38)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (38 : Fin 78) (60 : Fin 78)
    (39 : Fin 78) (59 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (6 : Fin 13) (9 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (59 : Fin 78) (39 : Fin 78) (38 : Fin 78)
    (60 : Fin 78) (35 : Fin 78) (72 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6324` (kalmanson). -/
theorem middleSource_h6324 :
    ((!((allOneRankAtom (sourceRanks P) 38 == allOneRankAtom (sourceRanks P) 35)) || ((allOneRankAtom (sourceRanks P) 73).ult (allOneRankAtom (sourceRanks P) 61)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (61 : Fin 78) (38 : Fin 78)
    (73 : Fin 78) (35 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (6 : Fin 13) (9 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (59 : Fin 78) (40 : Fin 78) (38 : Fin 78)
    (61 : Fin 78) (35 : Fin 78) (73 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6325` (kalmanson). -/
theorem middleSource_h6325 :
    ((!((allOneRankAtom (sourceRanks P) 38 == allOneRankAtom (sourceRanks P) 73)) || ((allOneRankAtom (sourceRanks P) 35).ult (allOneRankAtom (sourceRanks P) 61)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (61 : Fin 78) (38 : Fin 78)
    (35 : Fin 78) (73 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (6 : Fin 13) (9 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (59 : Fin 78) (40 : Fin 78) (38 : Fin 78)
    (61 : Fin 78) (35 : Fin 78) (73 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6326` (kalmanson). -/
theorem middleSource_h6326 :
    ((!((allOneRankAtom (sourceRanks P) 61 == allOneRankAtom (sourceRanks P) 35)) || ((allOneRankAtom (sourceRanks P) 73).ult (allOneRankAtom (sourceRanks P) 38)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (38 : Fin 78) (61 : Fin 78)
    (73 : Fin 78) (35 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (6 : Fin 13) (9 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (59 : Fin 78) (40 : Fin 78) (38 : Fin 78)
    (61 : Fin 78) (35 : Fin 78) (73 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6327` (kalmanson). -/
theorem middleSource_h6327 :
    ((!((allOneRankAtom (sourceRanks P) 61 == allOneRankAtom (sourceRanks P) 73)) || ((allOneRankAtom (sourceRanks P) 35).ult (allOneRankAtom (sourceRanks P) 38)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (38 : Fin 78) (61 : Fin 78)
    (35 : Fin 78) (73 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (6 : Fin 13) (9 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (59 : Fin 78) (40 : Fin 78) (38 : Fin 78)
    (61 : Fin 78) (35 : Fin 78) (73 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6328` (kalmanson). -/
theorem middleSource_h6328 :
    ((!((allOneRankAtom (sourceRanks P) 38 == allOneRankAtom (sourceRanks P) 40)) || ((allOneRankAtom (sourceRanks P) 59).ult (allOneRankAtom (sourceRanks P) 61)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (61 : Fin 78) (38 : Fin 78)
    (59 : Fin 78) (40 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (6 : Fin 13) (9 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (59 : Fin 78) (40 : Fin 78) (38 : Fin 78)
    (61 : Fin 78) (35 : Fin 78) (73 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6329` (kalmanson). -/
theorem middleSource_h6329 :
    ((!((allOneRankAtom (sourceRanks P) 38 == allOneRankAtom (sourceRanks P) 59)) || ((allOneRankAtom (sourceRanks P) 40).ult (allOneRankAtom (sourceRanks P) 61)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (61 : Fin 78) (38 : Fin 78)
    (40 : Fin 78) (59 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (6 : Fin 13) (9 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (59 : Fin 78) (40 : Fin 78) (38 : Fin 78)
    (61 : Fin 78) (35 : Fin 78) (73 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6330` (kalmanson). -/
theorem middleSource_h6330 :
    ((!((allOneRankAtom (sourceRanks P) 61 == allOneRankAtom (sourceRanks P) 40)) || ((allOneRankAtom (sourceRanks P) 59).ult (allOneRankAtom (sourceRanks P) 38)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (38 : Fin 78) (61 : Fin 78)
    (59 : Fin 78) (40 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (6 : Fin 13) (9 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (59 : Fin 78) (40 : Fin 78) (38 : Fin 78)
    (61 : Fin 78) (35 : Fin 78) (73 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6331` (kalmanson). -/
theorem middleSource_h6331 :
    ((!((allOneRankAtom (sourceRanks P) 61 == allOneRankAtom (sourceRanks P) 59)) || ((allOneRankAtom (sourceRanks P) 40).ult (allOneRankAtom (sourceRanks P) 38)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (38 : Fin 78) (61 : Fin 78)
    (40 : Fin 78) (59 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (6 : Fin 13) (9 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (59 : Fin 78) (40 : Fin 78) (38 : Fin 78)
    (61 : Fin 78) (35 : Fin 78) (73 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6332` (kalmanson). -/
theorem middleSource_h6332 :
    ((!((allOneRankAtom (sourceRanks P) 38 == allOneRankAtom (sourceRanks P) 35)) || ((allOneRankAtom (sourceRanks P) 74).ult (allOneRankAtom (sourceRanks P) 62)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (62 : Fin 78) (38 : Fin 78)
    (74 : Fin 78) (35 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (6 : Fin 13) (9 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (59 : Fin 78) (41 : Fin 78) (38 : Fin 78)
    (62 : Fin 78) (35 : Fin 78) (74 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6333` (kalmanson). -/
theorem middleSource_h6333 :
    ((!((allOneRankAtom (sourceRanks P) 38 == allOneRankAtom (sourceRanks P) 74)) || ((allOneRankAtom (sourceRanks P) 35).ult (allOneRankAtom (sourceRanks P) 62)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (62 : Fin 78) (38 : Fin 78)
    (35 : Fin 78) (74 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (6 : Fin 13) (9 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (59 : Fin 78) (41 : Fin 78) (38 : Fin 78)
    (62 : Fin 78) (35 : Fin 78) (74 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6334` (kalmanson). -/
theorem middleSource_h6334 :
    ((!((allOneRankAtom (sourceRanks P) 62 == allOneRankAtom (sourceRanks P) 35)) || ((allOneRankAtom (sourceRanks P) 74).ult (allOneRankAtom (sourceRanks P) 38)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (38 : Fin 78) (62 : Fin 78)
    (74 : Fin 78) (35 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (6 : Fin 13) (9 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (59 : Fin 78) (41 : Fin 78) (38 : Fin 78)
    (62 : Fin 78) (35 : Fin 78) (74 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6335` (kalmanson). -/
theorem middleSource_h6335 :
    ((!((allOneRankAtom (sourceRanks P) 38 == allOneRankAtom (sourceRanks P) 41)) || ((allOneRankAtom (sourceRanks P) 59).ult (allOneRankAtom (sourceRanks P) 62)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (62 : Fin 78) (38 : Fin 78)
    (59 : Fin 78) (41 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (6 : Fin 13) (9 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (59 : Fin 78) (41 : Fin 78) (38 : Fin 78)
    (62 : Fin 78) (35 : Fin 78) (74 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

end

end ATailExactFiveCard13AllOneSourceIngressScratch
end Problem97
