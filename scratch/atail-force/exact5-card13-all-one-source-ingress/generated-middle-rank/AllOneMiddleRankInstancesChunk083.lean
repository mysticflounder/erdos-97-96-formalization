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

/-- Candidate middle source assertion `h5312` (kalmanson). -/
theorem middleSource_h5312 :
    ((!((allOneRankAtom (sourceRanks P) 26 == allOneRankAtom (sourceRanks P) 23)) || ((allOneRankAtom (sourceRanks P) 58).ult (allOneRankAtom (sourceRanks P) 37)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (37 : Fin 78) (26 : Fin 78)
    (58 : Fin 78) (23 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (6 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (35 : Fin 78) (28 : Fin 78) (26 : Fin 78)
    (37 : Fin 78) (23 : Fin 78) (58 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5313` (kalmanson). -/
theorem middleSource_h5313 :
    ((!((allOneRankAtom (sourceRanks P) 26 == allOneRankAtom (sourceRanks P) 58)) || ((allOneRankAtom (sourceRanks P) 23).ult (allOneRankAtom (sourceRanks P) 37)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (37 : Fin 78) (26 : Fin 78)
    (23 : Fin 78) (58 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (6 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (35 : Fin 78) (28 : Fin 78) (26 : Fin 78)
    (37 : Fin 78) (23 : Fin 78) (58 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5314` (kalmanson). -/
theorem middleSource_h5314 :
    ((!((allOneRankAtom (sourceRanks P) 37 == allOneRankAtom (sourceRanks P) 23)) || ((allOneRankAtom (sourceRanks P) 58).ult (allOneRankAtom (sourceRanks P) 26)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (26 : Fin 78) (37 : Fin 78)
    (58 : Fin 78) (23 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (6 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (35 : Fin 78) (28 : Fin 78) (26 : Fin 78)
    (37 : Fin 78) (23 : Fin 78) (58 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5315` (kalmanson). -/
theorem middleSource_h5315 :
    ((!((allOneRankAtom (sourceRanks P) 37 == allOneRankAtom (sourceRanks P) 58)) || ((allOneRankAtom (sourceRanks P) 23).ult (allOneRankAtom (sourceRanks P) 26)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (26 : Fin 78) (37 : Fin 78)
    (23 : Fin 78) (58 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (6 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (35 : Fin 78) (28 : Fin 78) (26 : Fin 78)
    (37 : Fin 78) (23 : Fin 78) (58 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5316` (kalmanson). -/
theorem middleSource_h5316 :
    ((!((allOneRankAtom (sourceRanks P) 26 == allOneRankAtom (sourceRanks P) 28)) || ((allOneRankAtom (sourceRanks P) 35).ult (allOneRankAtom (sourceRanks P) 37)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (37 : Fin 78) (26 : Fin 78)
    (35 : Fin 78) (28 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (6 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (35 : Fin 78) (28 : Fin 78) (26 : Fin 78)
    (37 : Fin 78) (23 : Fin 78) (58 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5317` (kalmanson). -/
theorem middleSource_h5317 :
    ((!((allOneRankAtom (sourceRanks P) 26 == allOneRankAtom (sourceRanks P) 35)) || ((allOneRankAtom (sourceRanks P) 28).ult (allOneRankAtom (sourceRanks P) 37)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (37 : Fin 78) (26 : Fin 78)
    (28 : Fin 78) (35 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (6 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (35 : Fin 78) (28 : Fin 78) (26 : Fin 78)
    (37 : Fin 78) (23 : Fin 78) (58 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5318` (kalmanson). -/
theorem middleSource_h5318 :
    ((!((allOneRankAtom (sourceRanks P) 37 == allOneRankAtom (sourceRanks P) 28)) || ((allOneRankAtom (sourceRanks P) 35).ult (allOneRankAtom (sourceRanks P) 26)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (26 : Fin 78) (37 : Fin 78)
    (35 : Fin 78) (28 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (6 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (35 : Fin 78) (28 : Fin 78) (26 : Fin 78)
    (37 : Fin 78) (23 : Fin 78) (58 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5319` (kalmanson). -/
theorem middleSource_h5319 :
    ((!((allOneRankAtom (sourceRanks P) 37 == allOneRankAtom (sourceRanks P) 35)) || ((allOneRankAtom (sourceRanks P) 28).ult (allOneRankAtom (sourceRanks P) 26)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (26 : Fin 78) (37 : Fin 78)
    (28 : Fin 78) (35 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (6 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (35 : Fin 78) (28 : Fin 78) (26 : Fin 78)
    (37 : Fin 78) (23 : Fin 78) (58 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5320` (kalmanson). -/
theorem middleSource_h5320 :
    ((!((allOneRankAtom (sourceRanks P) 26 == allOneRankAtom (sourceRanks P) 23)) || ((allOneRankAtom (sourceRanks P) 59).ult (allOneRankAtom (sourceRanks P) 38)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (38 : Fin 78) (26 : Fin 78)
    (59 : Fin 78) (23 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (6 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (35 : Fin 78) (29 : Fin 78) (26 : Fin 78)
    (38 : Fin 78) (23 : Fin 78) (59 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5321` (kalmanson). -/
theorem middleSource_h5321 :
    ((!((allOneRankAtom (sourceRanks P) 26 == allOneRankAtom (sourceRanks P) 59)) || ((allOneRankAtom (sourceRanks P) 23).ult (allOneRankAtom (sourceRanks P) 38)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (38 : Fin 78) (26 : Fin 78)
    (23 : Fin 78) (59 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (6 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (35 : Fin 78) (29 : Fin 78) (26 : Fin 78)
    (38 : Fin 78) (23 : Fin 78) (59 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5322` (kalmanson). -/
theorem middleSource_h5322 :
    ((!((allOneRankAtom (sourceRanks P) 26 == allOneRankAtom (sourceRanks P) 29)) || ((allOneRankAtom (sourceRanks P) 35).ult (allOneRankAtom (sourceRanks P) 38)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (38 : Fin 78) (26 : Fin 78)
    (35 : Fin 78) (29 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (6 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (35 : Fin 78) (29 : Fin 78) (26 : Fin 78)
    (38 : Fin 78) (23 : Fin 78) (59 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5323` (kalmanson). -/
theorem middleSource_h5323 :
    ((!((allOneRankAtom (sourceRanks P) 26 == allOneRankAtom (sourceRanks P) 23)) || ((allOneRankAtom (sourceRanks P) 60).ult (allOneRankAtom (sourceRanks P) 39)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (39 : Fin 78) (26 : Fin 78)
    (60 : Fin 78) (23 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (6 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (35 : Fin 78) (30 : Fin 78) (26 : Fin 78)
    (39 : Fin 78) (23 : Fin 78) (60 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5324` (kalmanson). -/
theorem middleSource_h5324 :
    ((!((allOneRankAtom (sourceRanks P) 26 == allOneRankAtom (sourceRanks P) 60)) || ((allOneRankAtom (sourceRanks P) 23).ult (allOneRankAtom (sourceRanks P) 39)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (39 : Fin 78) (26 : Fin 78)
    (23 : Fin 78) (60 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (6 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (35 : Fin 78) (30 : Fin 78) (26 : Fin 78)
    (39 : Fin 78) (23 : Fin 78) (60 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5325` (kalmanson). -/
theorem middleSource_h5325 :
    ((!((allOneRankAtom (sourceRanks P) 26 == allOneRankAtom (sourceRanks P) 30)) || ((allOneRankAtom (sourceRanks P) 35).ult (allOneRankAtom (sourceRanks P) 39)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (39 : Fin 78) (26 : Fin 78)
    (35 : Fin 78) (30 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (6 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (35 : Fin 78) (30 : Fin 78) (26 : Fin 78)
    (39 : Fin 78) (23 : Fin 78) (60 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5326` (kalmanson). -/
theorem middleSource_h5326 :
    ((!((allOneRankAtom (sourceRanks P) 26 == allOneRankAtom (sourceRanks P) 23)) || ((allOneRankAtom (sourceRanks P) 61).ult (allOneRankAtom (sourceRanks P) 40)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (40 : Fin 78) (26 : Fin 78)
    (61 : Fin 78) (23 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (6 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (35 : Fin 78) (31 : Fin 78) (26 : Fin 78)
    (40 : Fin 78) (23 : Fin 78) (61 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5327` (kalmanson). -/
theorem middleSource_h5327 :
    ((!((allOneRankAtom (sourceRanks P) 26 == allOneRankAtom (sourceRanks P) 61)) || ((allOneRankAtom (sourceRanks P) 23).ult (allOneRankAtom (sourceRanks P) 40)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (40 : Fin 78) (26 : Fin 78)
    (23 : Fin 78) (61 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (6 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (35 : Fin 78) (31 : Fin 78) (26 : Fin 78)
    (40 : Fin 78) (23 : Fin 78) (61 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5328` (kalmanson). -/
theorem middleSource_h5328 :
    ((!((allOneRankAtom (sourceRanks P) 40 == allOneRankAtom (sourceRanks P) 61)) || ((allOneRankAtom (sourceRanks P) 23).ult (allOneRankAtom (sourceRanks P) 26)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (26 : Fin 78) (40 : Fin 78)
    (23 : Fin 78) (61 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (6 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (35 : Fin 78) (31 : Fin 78) (26 : Fin 78)
    (40 : Fin 78) (23 : Fin 78) (61 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5329` (kalmanson). -/
theorem middleSource_h5329 :
    ((!((allOneRankAtom (sourceRanks P) 26 == allOneRankAtom (sourceRanks P) 31)) || ((allOneRankAtom (sourceRanks P) 35).ult (allOneRankAtom (sourceRanks P) 40)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (40 : Fin 78) (26 : Fin 78)
    (35 : Fin 78) (31 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (6 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (35 : Fin 78) (31 : Fin 78) (26 : Fin 78)
    (40 : Fin 78) (23 : Fin 78) (61 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5330` (kalmanson). -/
theorem middleSource_h5330 :
    ((!((allOneRankAtom (sourceRanks P) 40 == allOneRankAtom (sourceRanks P) 35)) || ((allOneRankAtom (sourceRanks P) 31).ult (allOneRankAtom (sourceRanks P) 26)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (26 : Fin 78) (40 : Fin 78)
    (31 : Fin 78) (35 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (6 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (35 : Fin 78) (31 : Fin 78) (26 : Fin 78)
    (40 : Fin 78) (23 : Fin 78) (61 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5331` (kalmanson). -/
theorem middleSource_h5331 :
    ((!((allOneRankAtom (sourceRanks P) 26 == allOneRankAtom (sourceRanks P) 23)) || ((allOneRankAtom (sourceRanks P) 62).ult (allOneRankAtom (sourceRanks P) 41)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (41 : Fin 78) (26 : Fin 78)
    (62 : Fin 78) (23 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (6 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (35 : Fin 78) (32 : Fin 78) (26 : Fin 78)
    (41 : Fin 78) (23 : Fin 78) (62 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5332` (kalmanson). -/
theorem middleSource_h5332 :
    ((!((allOneRankAtom (sourceRanks P) 26 == allOneRankAtom (sourceRanks P) 62)) || ((allOneRankAtom (sourceRanks P) 23).ult (allOneRankAtom (sourceRanks P) 41)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (41 : Fin 78) (26 : Fin 78)
    (23 : Fin 78) (62 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (6 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (35 : Fin 78) (32 : Fin 78) (26 : Fin 78)
    (41 : Fin 78) (23 : Fin 78) (62 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5333` (kalmanson). -/
theorem middleSource_h5333 :
    ((!((allOneRankAtom (sourceRanks P) 26 == allOneRankAtom (sourceRanks P) 32)) || ((allOneRankAtom (sourceRanks P) 35).ult (allOneRankAtom (sourceRanks P) 41)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (41 : Fin 78) (26 : Fin 78)
    (35 : Fin 78) (32 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (6 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (35 : Fin 78) (32 : Fin 78) (26 : Fin 78)
    (41 : Fin 78) (23 : Fin 78) (62 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5334` (kalmanson). -/
theorem middleSource_h5334 :
    ((!((allOneRankAtom (sourceRanks P) 37 == allOneRankAtom (sourceRanks P) 23)) || ((allOneRankAtom (sourceRanks P) 63).ult (allOneRankAtom (sourceRanks P) 27)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (27 : Fin 78) (37 : Fin 78)
    (63 : Fin 78) (23 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (7 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (36 : Fin 78) (28 : Fin 78) (27 : Fin 78)
    (37 : Fin 78) (23 : Fin 78) (63 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5335` (kalmanson). -/
theorem middleSource_h5335 :
    ((!((allOneRankAtom (sourceRanks P) 37 == allOneRankAtom (sourceRanks P) 63)) || ((allOneRankAtom (sourceRanks P) 23).ult (allOneRankAtom (sourceRanks P) 27)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (27 : Fin 78) (37 : Fin 78)
    (23 : Fin 78) (63 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (7 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (36 : Fin 78) (28 : Fin 78) (27 : Fin 78)
    (37 : Fin 78) (23 : Fin 78) (63 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5336` (kalmanson). -/
theorem middleSource_h5336 :
    ((!((allOneRankAtom (sourceRanks P) 27 == allOneRankAtom (sourceRanks P) 28)) || ((allOneRankAtom (sourceRanks P) 36).ult (allOneRankAtom (sourceRanks P) 37)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (37 : Fin 78) (27 : Fin 78)
    (36 : Fin 78) (28 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (7 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (36 : Fin 78) (28 : Fin 78) (27 : Fin 78)
    (37 : Fin 78) (23 : Fin 78) (63 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5337` (kalmanson). -/
theorem middleSource_h5337 :
    ((!((allOneRankAtom (sourceRanks P) 27 == allOneRankAtom (sourceRanks P) 36)) || ((allOneRankAtom (sourceRanks P) 28).ult (allOneRankAtom (sourceRanks P) 37)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (37 : Fin 78) (27 : Fin 78)
    (28 : Fin 78) (36 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (7 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (36 : Fin 78) (28 : Fin 78) (27 : Fin 78)
    (37 : Fin 78) (23 : Fin 78) (63 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5338` (kalmanson). -/
theorem middleSource_h5338 :
    ((!((allOneRankAtom (sourceRanks P) 37 == allOneRankAtom (sourceRanks P) 28)) || ((allOneRankAtom (sourceRanks P) 36).ult (allOneRankAtom (sourceRanks P) 27)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (27 : Fin 78) (37 : Fin 78)
    (36 : Fin 78) (28 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (7 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (36 : Fin 78) (28 : Fin 78) (27 : Fin 78)
    (37 : Fin 78) (23 : Fin 78) (63 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5339` (kalmanson). -/
theorem middleSource_h5339 :
    ((!((allOneRankAtom (sourceRanks P) 27 == allOneRankAtom (sourceRanks P) 23)) || ((allOneRankAtom (sourceRanks P) 64).ult (allOneRankAtom (sourceRanks P) 38)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (38 : Fin 78) (27 : Fin 78)
    (64 : Fin 78) (23 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (7 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (36 : Fin 78) (29 : Fin 78) (27 : Fin 78)
    (38 : Fin 78) (23 : Fin 78) (64 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5340` (kalmanson). -/
theorem middleSource_h5340 :
    ((!((allOneRankAtom (sourceRanks P) 27 == allOneRankAtom (sourceRanks P) 29)) || ((allOneRankAtom (sourceRanks P) 36).ult (allOneRankAtom (sourceRanks P) 38)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (38 : Fin 78) (27 : Fin 78)
    (36 : Fin 78) (29 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (7 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (36 : Fin 78) (29 : Fin 78) (27 : Fin 78)
    (38 : Fin 78) (23 : Fin 78) (64 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5341` (kalmanson). -/
theorem middleSource_h5341 :
    ((!((allOneRankAtom (sourceRanks P) 27 == allOneRankAtom (sourceRanks P) 23)) || ((allOneRankAtom (sourceRanks P) 65).ult (allOneRankAtom (sourceRanks P) 39)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (39 : Fin 78) (27 : Fin 78)
    (65 : Fin 78) (23 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (7 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (36 : Fin 78) (30 : Fin 78) (27 : Fin 78)
    (39 : Fin 78) (23 : Fin 78) (65 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5342` (kalmanson). -/
theorem middleSource_h5342 :
    ((!((allOneRankAtom (sourceRanks P) 39 == allOneRankAtom (sourceRanks P) 65)) || ((allOneRankAtom (sourceRanks P) 23).ult (allOneRankAtom (sourceRanks P) 27)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (27 : Fin 78) (39 : Fin 78)
    (23 : Fin 78) (65 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (7 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (36 : Fin 78) (30 : Fin 78) (27 : Fin 78)
    (39 : Fin 78) (23 : Fin 78) (65 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5343` (kalmanson). -/
theorem middleSource_h5343 :
    ((!((allOneRankAtom (sourceRanks P) 27 == allOneRankAtom (sourceRanks P) 30)) || ((allOneRankAtom (sourceRanks P) 36).ult (allOneRankAtom (sourceRanks P) 39)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (39 : Fin 78) (27 : Fin 78)
    (36 : Fin 78) (30 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (7 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (36 : Fin 78) (30 : Fin 78) (27 : Fin 78)
    (39 : Fin 78) (23 : Fin 78) (65 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5344` (kalmanson). -/
theorem middleSource_h5344 :
    ((!((allOneRankAtom (sourceRanks P) 27 == allOneRankAtom (sourceRanks P) 23)) || ((allOneRankAtom (sourceRanks P) 66).ult (allOneRankAtom (sourceRanks P) 40)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (40 : Fin 78) (27 : Fin 78)
    (66 : Fin 78) (23 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (7 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (36 : Fin 78) (31 : Fin 78) (27 : Fin 78)
    (40 : Fin 78) (23 : Fin 78) (66 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5345` (kalmanson). -/
theorem middleSource_h5345 :
    ((!((allOneRankAtom (sourceRanks P) 40 == allOneRankAtom (sourceRanks P) 66)) || ((allOneRankAtom (sourceRanks P) 23).ult (allOneRankAtom (sourceRanks P) 27)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (27 : Fin 78) (40 : Fin 78)
    (23 : Fin 78) (66 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (7 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (36 : Fin 78) (31 : Fin 78) (27 : Fin 78)
    (40 : Fin 78) (23 : Fin 78) (66 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5346` (kalmanson). -/
theorem middleSource_h5346 :
    ((!((allOneRankAtom (sourceRanks P) 27 == allOneRankAtom (sourceRanks P) 31)) || ((allOneRankAtom (sourceRanks P) 36).ult (allOneRankAtom (sourceRanks P) 40)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (40 : Fin 78) (27 : Fin 78)
    (36 : Fin 78) (31 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (7 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (36 : Fin 78) (31 : Fin 78) (27 : Fin 78)
    (40 : Fin 78) (23 : Fin 78) (66 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5347` (kalmanson). -/
theorem middleSource_h5347 :
    ((!((allOneRankAtom (sourceRanks P) 27 == allOneRankAtom (sourceRanks P) 23)) || ((allOneRankAtom (sourceRanks P) 67).ult (allOneRankAtom (sourceRanks P) 41)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (41 : Fin 78) (27 : Fin 78)
    (67 : Fin 78) (23 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (7 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (36 : Fin 78) (32 : Fin 78) (27 : Fin 78)
    (41 : Fin 78) (23 : Fin 78) (67 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5348` (kalmanson). -/
theorem middleSource_h5348 :
    ((!((allOneRankAtom (sourceRanks P) 27 == allOneRankAtom (sourceRanks P) 32)) || ((allOneRankAtom (sourceRanks P) 36).ult (allOneRankAtom (sourceRanks P) 41)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (41 : Fin 78) (27 : Fin 78)
    (36 : Fin 78) (32 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (7 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (36 : Fin 78) (32 : Fin 78) (27 : Fin 78)
    (41 : Fin 78) (23 : Fin 78) (67 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5349` (kalmanson). -/
theorem middleSource_h5349 :
    ((!((allOneRankAtom (sourceRanks P) 41 == allOneRankAtom (sourceRanks P) 36)) || ((allOneRankAtom (sourceRanks P) 32).ult (allOneRankAtom (sourceRanks P) 27)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (27 : Fin 78) (41 : Fin 78)
    (32 : Fin 78) (36 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (7 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (36 : Fin 78) (32 : Fin 78) (27 : Fin 78)
    (41 : Fin 78) (23 : Fin 78) (67 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5350` (kalmanson). -/
theorem middleSource_h5350 :
    ((!((allOneRankAtom (sourceRanks P) 28 == allOneRankAtom (sourceRanks P) 23)) || ((allOneRankAtom (sourceRanks P) 68).ult (allOneRankAtom (sourceRanks P) 38)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (38 : Fin 78) (28 : Fin 78)
    (68 : Fin 78) (23 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (8 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (37 : Fin 78) (29 : Fin 78) (28 : Fin 78)
    (38 : Fin 78) (23 : Fin 78) (68 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5351` (kalmanson). -/
theorem middleSource_h5351 :
    ((!((allOneRankAtom (sourceRanks P) 28 == allOneRankAtom (sourceRanks P) 68)) || ((allOneRankAtom (sourceRanks P) 23).ult (allOneRankAtom (sourceRanks P) 38)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (38 : Fin 78) (28 : Fin 78)
    (23 : Fin 78) (68 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (8 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (37 : Fin 78) (29 : Fin 78) (28 : Fin 78)
    (38 : Fin 78) (23 : Fin 78) (68 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5352` (kalmanson). -/
theorem middleSource_h5352 :
    ((!((allOneRankAtom (sourceRanks P) 38 == allOneRankAtom (sourceRanks P) 23)) || ((allOneRankAtom (sourceRanks P) 68).ult (allOneRankAtom (sourceRanks P) 28)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (28 : Fin 78) (38 : Fin 78)
    (68 : Fin 78) (23 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (8 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (37 : Fin 78) (29 : Fin 78) (28 : Fin 78)
    (38 : Fin 78) (23 : Fin 78) (68 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5353` (kalmanson). -/
theorem middleSource_h5353 :
    ((!((allOneRankAtom (sourceRanks P) 28 == allOneRankAtom (sourceRanks P) 29)) || ((allOneRankAtom (sourceRanks P) 37).ult (allOneRankAtom (sourceRanks P) 38)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (38 : Fin 78) (28 : Fin 78)
    (37 : Fin 78) (29 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (8 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (37 : Fin 78) (29 : Fin 78) (28 : Fin 78)
    (38 : Fin 78) (23 : Fin 78) (68 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5354` (kalmanson). -/
theorem middleSource_h5354 :
    ((!((allOneRankAtom (sourceRanks P) 28 == allOneRankAtom (sourceRanks P) 37)) || ((allOneRankAtom (sourceRanks P) 29).ult (allOneRankAtom (sourceRanks P) 38)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (38 : Fin 78) (28 : Fin 78)
    (29 : Fin 78) (37 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (8 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (37 : Fin 78) (29 : Fin 78) (28 : Fin 78)
    (38 : Fin 78) (23 : Fin 78) (68 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5355` (kalmanson). -/
theorem middleSource_h5355 :
    ((!((allOneRankAtom (sourceRanks P) 38 == allOneRankAtom (sourceRanks P) 29)) || ((allOneRankAtom (sourceRanks P) 37).ult (allOneRankAtom (sourceRanks P) 28)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (28 : Fin 78) (38 : Fin 78)
    (37 : Fin 78) (29 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (8 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (37 : Fin 78) (29 : Fin 78) (28 : Fin 78)
    (38 : Fin 78) (23 : Fin 78) (68 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5356` (kalmanson). -/
theorem middleSource_h5356 :
    ((!((allOneRankAtom (sourceRanks P) 38 == allOneRankAtom (sourceRanks P) 37)) || ((allOneRankAtom (sourceRanks P) 29).ult (allOneRankAtom (sourceRanks P) 28)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (28 : Fin 78) (38 : Fin 78)
    (29 : Fin 78) (37 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (8 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (37 : Fin 78) (29 : Fin 78) (28 : Fin 78)
    (38 : Fin 78) (23 : Fin 78) (68 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5357` (kalmanson). -/
theorem middleSource_h5357 :
    ((!((allOneRankAtom (sourceRanks P) 28 == allOneRankAtom (sourceRanks P) 23)) || ((allOneRankAtom (sourceRanks P) 69).ult (allOneRankAtom (sourceRanks P) 39)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (39 : Fin 78) (28 : Fin 78)
    (69 : Fin 78) (23 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (8 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (37 : Fin 78) (30 : Fin 78) (28 : Fin 78)
    (39 : Fin 78) (23 : Fin 78) (69 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5358` (kalmanson). -/
theorem middleSource_h5358 :
    ((!((allOneRankAtom (sourceRanks P) 28 == allOneRankAtom (sourceRanks P) 69)) || ((allOneRankAtom (sourceRanks P) 23).ult (allOneRankAtom (sourceRanks P) 39)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (39 : Fin 78) (28 : Fin 78)
    (23 : Fin 78) (69 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (8 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (37 : Fin 78) (30 : Fin 78) (28 : Fin 78)
    (39 : Fin 78) (23 : Fin 78) (69 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5359` (kalmanson). -/
theorem middleSource_h5359 :
    ((!((allOneRankAtom (sourceRanks P) 39 == allOneRankAtom (sourceRanks P) 23)) || ((allOneRankAtom (sourceRanks P) 69).ult (allOneRankAtom (sourceRanks P) 28)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (28 : Fin 78) (39 : Fin 78)
    (69 : Fin 78) (23 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (8 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (37 : Fin 78) (30 : Fin 78) (28 : Fin 78)
    (39 : Fin 78) (23 : Fin 78) (69 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5360` (kalmanson). -/
theorem middleSource_h5360 :
    ((!((allOneRankAtom (sourceRanks P) 39 == allOneRankAtom (sourceRanks P) 69)) || ((allOneRankAtom (sourceRanks P) 23).ult (allOneRankAtom (sourceRanks P) 28)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (28 : Fin 78) (39 : Fin 78)
    (23 : Fin 78) (69 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (8 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (37 : Fin 78) (30 : Fin 78) (28 : Fin 78)
    (39 : Fin 78) (23 : Fin 78) (69 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5361` (kalmanson). -/
theorem middleSource_h5361 :
    ((!((allOneRankAtom (sourceRanks P) 28 == allOneRankAtom (sourceRanks P) 30)) || ((allOneRankAtom (sourceRanks P) 37).ult (allOneRankAtom (sourceRanks P) 39)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (39 : Fin 78) (28 : Fin 78)
    (37 : Fin 78) (30 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (8 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (37 : Fin 78) (30 : Fin 78) (28 : Fin 78)
    (39 : Fin 78) (23 : Fin 78) (69 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5362` (kalmanson). -/
theorem middleSource_h5362 :
    ((!((allOneRankAtom (sourceRanks P) 28 == allOneRankAtom (sourceRanks P) 37)) || ((allOneRankAtom (sourceRanks P) 30).ult (allOneRankAtom (sourceRanks P) 39)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (39 : Fin 78) (28 : Fin 78)
    (30 : Fin 78) (37 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (8 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (37 : Fin 78) (30 : Fin 78) (28 : Fin 78)
    (39 : Fin 78) (23 : Fin 78) (69 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5363` (kalmanson). -/
theorem middleSource_h5363 :
    ((!((allOneRankAtom (sourceRanks P) 39 == allOneRankAtom (sourceRanks P) 30)) || ((allOneRankAtom (sourceRanks P) 37).ult (allOneRankAtom (sourceRanks P) 28)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (28 : Fin 78) (39 : Fin 78)
    (37 : Fin 78) (30 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (8 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (37 : Fin 78) (30 : Fin 78) (28 : Fin 78)
    (39 : Fin 78) (23 : Fin 78) (69 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5364` (kalmanson). -/
theorem middleSource_h5364 :
    ((!((allOneRankAtom (sourceRanks P) 28 == allOneRankAtom (sourceRanks P) 23)) || ((allOneRankAtom (sourceRanks P) 70).ult (allOneRankAtom (sourceRanks P) 40)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (40 : Fin 78) (28 : Fin 78)
    (70 : Fin 78) (23 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (8 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (37 : Fin 78) (31 : Fin 78) (28 : Fin 78)
    (40 : Fin 78) (23 : Fin 78) (70 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5365` (kalmanson). -/
theorem middleSource_h5365 :
    ((!((allOneRankAtom (sourceRanks P) 28 == allOneRankAtom (sourceRanks P) 70)) || ((allOneRankAtom (sourceRanks P) 23).ult (allOneRankAtom (sourceRanks P) 40)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (40 : Fin 78) (28 : Fin 78)
    (23 : Fin 78) (70 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (8 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (37 : Fin 78) (31 : Fin 78) (28 : Fin 78)
    (40 : Fin 78) (23 : Fin 78) (70 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5366` (kalmanson). -/
theorem middleSource_h5366 :
    ((!((allOneRankAtom (sourceRanks P) 40 == allOneRankAtom (sourceRanks P) 23)) || ((allOneRankAtom (sourceRanks P) 70).ult (allOneRankAtom (sourceRanks P) 28)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (28 : Fin 78) (40 : Fin 78)
    (70 : Fin 78) (23 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (8 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (37 : Fin 78) (31 : Fin 78) (28 : Fin 78)
    (40 : Fin 78) (23 : Fin 78) (70 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5367` (kalmanson). -/
theorem middleSource_h5367 :
    ((!((allOneRankAtom (sourceRanks P) 28 == allOneRankAtom (sourceRanks P) 31)) || ((allOneRankAtom (sourceRanks P) 37).ult (allOneRankAtom (sourceRanks P) 40)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (40 : Fin 78) (28 : Fin 78)
    (37 : Fin 78) (31 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (8 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (37 : Fin 78) (31 : Fin 78) (28 : Fin 78)
    (40 : Fin 78) (23 : Fin 78) (70 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5368` (kalmanson). -/
theorem middleSource_h5368 :
    ((!((allOneRankAtom (sourceRanks P) 28 == allOneRankAtom (sourceRanks P) 37)) || ((allOneRankAtom (sourceRanks P) 31).ult (allOneRankAtom (sourceRanks P) 40)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (40 : Fin 78) (28 : Fin 78)
    (31 : Fin 78) (37 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (8 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (37 : Fin 78) (31 : Fin 78) (28 : Fin 78)
    (40 : Fin 78) (23 : Fin 78) (70 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5369` (kalmanson). -/
theorem middleSource_h5369 :
    ((!((allOneRankAtom (sourceRanks P) 40 == allOneRankAtom (sourceRanks P) 31)) || ((allOneRankAtom (sourceRanks P) 37).ult (allOneRankAtom (sourceRanks P) 28)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (28 : Fin 78) (40 : Fin 78)
    (37 : Fin 78) (31 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (8 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (37 : Fin 78) (31 : Fin 78) (28 : Fin 78)
    (40 : Fin 78) (23 : Fin 78) (70 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5370` (kalmanson). -/
theorem middleSource_h5370 :
    ((!((allOneRankAtom (sourceRanks P) 28 == allOneRankAtom (sourceRanks P) 23)) || ((allOneRankAtom (sourceRanks P) 71).ult (allOneRankAtom (sourceRanks P) 41)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (41 : Fin 78) (28 : Fin 78)
    (71 : Fin 78) (23 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (8 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (37 : Fin 78) (32 : Fin 78) (28 : Fin 78)
    (41 : Fin 78) (23 : Fin 78) (71 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5371` (kalmanson). -/
theorem middleSource_h5371 :
    ((!((allOneRankAtom (sourceRanks P) 28 == allOneRankAtom (sourceRanks P) 71)) || ((allOneRankAtom (sourceRanks P) 23).ult (allOneRankAtom (sourceRanks P) 41)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (41 : Fin 78) (28 : Fin 78)
    (23 : Fin 78) (71 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (8 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (37 : Fin 78) (32 : Fin 78) (28 : Fin 78)
    (41 : Fin 78) (23 : Fin 78) (71 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5372` (kalmanson). -/
theorem middleSource_h5372 :
    ((!((allOneRankAtom (sourceRanks P) 41 == allOneRankAtom (sourceRanks P) 23)) || ((allOneRankAtom (sourceRanks P) 71).ult (allOneRankAtom (sourceRanks P) 28)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (28 : Fin 78) (41 : Fin 78)
    (71 : Fin 78) (23 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (8 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (37 : Fin 78) (32 : Fin 78) (28 : Fin 78)
    (41 : Fin 78) (23 : Fin 78) (71 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5373` (kalmanson). -/
theorem middleSource_h5373 :
    ((!((allOneRankAtom (sourceRanks P) 28 == allOneRankAtom (sourceRanks P) 32)) || ((allOneRankAtom (sourceRanks P) 37).ult (allOneRankAtom (sourceRanks P) 41)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (41 : Fin 78) (28 : Fin 78)
    (37 : Fin 78) (32 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (8 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (37 : Fin 78) (32 : Fin 78) (28 : Fin 78)
    (41 : Fin 78) (23 : Fin 78) (71 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5374` (kalmanson). -/
theorem middleSource_h5374 :
    ((!((allOneRankAtom (sourceRanks P) 28 == allOneRankAtom (sourceRanks P) 37)) || ((allOneRankAtom (sourceRanks P) 32).ult (allOneRankAtom (sourceRanks P) 41)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (41 : Fin 78) (28 : Fin 78)
    (32 : Fin 78) (37 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (8 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (37 : Fin 78) (32 : Fin 78) (28 : Fin 78)
    (41 : Fin 78) (23 : Fin 78) (71 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5375` (kalmanson). -/
theorem middleSource_h5375 :
    ((!((allOneRankAtom (sourceRanks P) 41 == allOneRankAtom (sourceRanks P) 32)) || ((allOneRankAtom (sourceRanks P) 37).ult (allOneRankAtom (sourceRanks P) 28)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (28 : Fin 78) (41 : Fin 78)
    (37 : Fin 78) (32 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (8 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (37 : Fin 78) (32 : Fin 78) (28 : Fin 78)
    (41 : Fin 78) (23 : Fin 78) (71 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

end

end ATailExactFiveCard13AllOneSourceIngressScratch
end Problem97
