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

/-- Candidate middle source assertion `h3328` (kalmanson). -/
theorem middleSource_h3328 :
    ((!((allOneRankAtom (sourceRanks P) 4 == allOneRankAtom (sourceRanks P) 9)) || ((allOneRankAtom (sourceRanks P) 25).ult (allOneRankAtom (sourceRanks P) 30)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (30 : Fin 78) (4 : Fin 78)
    (25 : Fin 78) (9 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (5 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (25 : Fin 78) (9 : Fin 78) (4 : Fin 78)
    (30 : Fin 78) (1 : Fin 78) (54 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3329` (kalmanson). -/
theorem middleSource_h3329 :
    ((!((allOneRankAtom (sourceRanks P) 4 == allOneRankAtom (sourceRanks P) 25)) || ((allOneRankAtom (sourceRanks P) 9).ult (allOneRankAtom (sourceRanks P) 30)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (30 : Fin 78) (4 : Fin 78)
    (9 : Fin 78) (25 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (5 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (25 : Fin 78) (9 : Fin 78) (4 : Fin 78)
    (30 : Fin 78) (1 : Fin 78) (54 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3330` (kalmanson). -/
theorem middleSource_h3330 :
    ((!((allOneRankAtom (sourceRanks P) 30 == allOneRankAtom (sourceRanks P) 9)) || ((allOneRankAtom (sourceRanks P) 25).ult (allOneRankAtom (sourceRanks P) 4)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (4 : Fin 78) (30 : Fin 78)
    (25 : Fin 78) (9 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (5 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (25 : Fin 78) (9 : Fin 78) (4 : Fin 78)
    (30 : Fin 78) (1 : Fin 78) (54 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3331` (kalmanson). -/
theorem middleSource_h3331 :
    ((!((allOneRankAtom (sourceRanks P) 30 == allOneRankAtom (sourceRanks P) 25)) || ((allOneRankAtom (sourceRanks P) 9).ult (allOneRankAtom (sourceRanks P) 4)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (4 : Fin 78) (30 : Fin 78)
    (9 : Fin 78) (25 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (5 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (25 : Fin 78) (9 : Fin 78) (4 : Fin 78)
    (30 : Fin 78) (1 : Fin 78) (54 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3332` (kalmanson). -/
theorem middleSource_h3332 :
    ((!((allOneRankAtom (sourceRanks P) 4 == allOneRankAtom (sourceRanks P) 1)) || ((allOneRankAtom (sourceRanks P) 55).ult (allOneRankAtom (sourceRanks P) 31)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (31 : Fin 78) (4 : Fin 78)
    (55 : Fin 78) (1 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (5 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (25 : Fin 78) (10 : Fin 78) (4 : Fin 78)
    (31 : Fin 78) (1 : Fin 78) (55 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3333` (kalmanson). -/
theorem middleSource_h3333 :
    ((!((allOneRankAtom (sourceRanks P) 4 == allOneRankAtom (sourceRanks P) 55)) || ((allOneRankAtom (sourceRanks P) 1).ult (allOneRankAtom (sourceRanks P) 31)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (31 : Fin 78) (4 : Fin 78)
    (1 : Fin 78) (55 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (5 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (25 : Fin 78) (10 : Fin 78) (4 : Fin 78)
    (31 : Fin 78) (1 : Fin 78) (55 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3334` (kalmanson). -/
theorem middleSource_h3334 :
    ((!((allOneRankAtom (sourceRanks P) 31 == allOneRankAtom (sourceRanks P) 1)) || ((allOneRankAtom (sourceRanks P) 55).ult (allOneRankAtom (sourceRanks P) 4)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (4 : Fin 78) (31 : Fin 78)
    (55 : Fin 78) (1 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (5 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (25 : Fin 78) (10 : Fin 78) (4 : Fin 78)
    (31 : Fin 78) (1 : Fin 78) (55 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3335` (kalmanson). -/
theorem middleSource_h3335 :
    ((!((allOneRankAtom (sourceRanks P) 31 == allOneRankAtom (sourceRanks P) 55)) || ((allOneRankAtom (sourceRanks P) 1).ult (allOneRankAtom (sourceRanks P) 4)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (4 : Fin 78) (31 : Fin 78)
    (1 : Fin 78) (55 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (5 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (25 : Fin 78) (10 : Fin 78) (4 : Fin 78)
    (31 : Fin 78) (1 : Fin 78) (55 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3336` (kalmanson). -/
theorem middleSource_h3336 :
    ((!((allOneRankAtom (sourceRanks P) 4 == allOneRankAtom (sourceRanks P) 10)) || ((allOneRankAtom (sourceRanks P) 25).ult (allOneRankAtom (sourceRanks P) 31)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (31 : Fin 78) (4 : Fin 78)
    (25 : Fin 78) (10 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (5 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (25 : Fin 78) (10 : Fin 78) (4 : Fin 78)
    (31 : Fin 78) (1 : Fin 78) (55 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3337` (kalmanson). -/
theorem middleSource_h3337 :
    ((!((allOneRankAtom (sourceRanks P) 4 == allOneRankAtom (sourceRanks P) 25)) || ((allOneRankAtom (sourceRanks P) 10).ult (allOneRankAtom (sourceRanks P) 31)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (31 : Fin 78) (4 : Fin 78)
    (10 : Fin 78) (25 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (5 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (25 : Fin 78) (10 : Fin 78) (4 : Fin 78)
    (31 : Fin 78) (1 : Fin 78) (55 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3338` (kalmanson). -/
theorem middleSource_h3338 :
    ((!((allOneRankAtom (sourceRanks P) 31 == allOneRankAtom (sourceRanks P) 10)) || ((allOneRankAtom (sourceRanks P) 25).ult (allOneRankAtom (sourceRanks P) 4)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (4 : Fin 78) (31 : Fin 78)
    (25 : Fin 78) (10 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (5 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (25 : Fin 78) (10 : Fin 78) (4 : Fin 78)
    (31 : Fin 78) (1 : Fin 78) (55 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3339` (kalmanson). -/
theorem middleSource_h3339 :
    ((!((allOneRankAtom (sourceRanks P) 31 == allOneRankAtom (sourceRanks P) 25)) || ((allOneRankAtom (sourceRanks P) 10).ult (allOneRankAtom (sourceRanks P) 4)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (4 : Fin 78) (31 : Fin 78)
    (10 : Fin 78) (25 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (5 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (25 : Fin 78) (10 : Fin 78) (4 : Fin 78)
    (31 : Fin 78) (1 : Fin 78) (55 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3340` (kalmanson). -/
theorem middleSource_h3340 :
    ((!((allOneRankAtom (sourceRanks P) 4 == allOneRankAtom (sourceRanks P) 1)) || ((allOneRankAtom (sourceRanks P) 56).ult (allOneRankAtom (sourceRanks P) 32)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (32 : Fin 78) (4 : Fin 78)
    (56 : Fin 78) (1 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (5 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (25 : Fin 78) (11 : Fin 78) (4 : Fin 78)
    (32 : Fin 78) (1 : Fin 78) (56 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3341` (kalmanson). -/
theorem middleSource_h3341 :
    ((!((allOneRankAtom (sourceRanks P) 4 == allOneRankAtom (sourceRanks P) 56)) || ((allOneRankAtom (sourceRanks P) 1).ult (allOneRankAtom (sourceRanks P) 32)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (32 : Fin 78) (4 : Fin 78)
    (1 : Fin 78) (56 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (5 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (25 : Fin 78) (11 : Fin 78) (4 : Fin 78)
    (32 : Fin 78) (1 : Fin 78) (56 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3342` (kalmanson). -/
theorem middleSource_h3342 :
    ((!((allOneRankAtom (sourceRanks P) 32 == allOneRankAtom (sourceRanks P) 1)) || ((allOneRankAtom (sourceRanks P) 56).ult (allOneRankAtom (sourceRanks P) 4)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (4 : Fin 78) (32 : Fin 78)
    (56 : Fin 78) (1 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (5 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (25 : Fin 78) (11 : Fin 78) (4 : Fin 78)
    (32 : Fin 78) (1 : Fin 78) (56 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3343` (kalmanson). -/
theorem middleSource_h3343 :
    ((!((allOneRankAtom (sourceRanks P) 4 == allOneRankAtom (sourceRanks P) 11)) || ((allOneRankAtom (sourceRanks P) 25).ult (allOneRankAtom (sourceRanks P) 32)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (32 : Fin 78) (4 : Fin 78)
    (25 : Fin 78) (11 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (5 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (25 : Fin 78) (11 : Fin 78) (4 : Fin 78)
    (32 : Fin 78) (1 : Fin 78) (56 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3344` (kalmanson). -/
theorem middleSource_h3344 :
    ((!((allOneRankAtom (sourceRanks P) 4 == allOneRankAtom (sourceRanks P) 25)) || ((allOneRankAtom (sourceRanks P) 11).ult (allOneRankAtom (sourceRanks P) 32)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (32 : Fin 78) (4 : Fin 78)
    (11 : Fin 78) (25 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (5 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (25 : Fin 78) (11 : Fin 78) (4 : Fin 78)
    (32 : Fin 78) (1 : Fin 78) (56 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3345` (kalmanson). -/
theorem middleSource_h3345 :
    ((!((allOneRankAtom (sourceRanks P) 32 == allOneRankAtom (sourceRanks P) 25)) || ((allOneRankAtom (sourceRanks P) 11).ult (allOneRankAtom (sourceRanks P) 4)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (4 : Fin 78) (32 : Fin 78)
    (11 : Fin 78) (25 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (5 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (25 : Fin 78) (11 : Fin 78) (4 : Fin 78)
    (32 : Fin 78) (1 : Fin 78) (56 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3346` (kalmanson). -/
theorem middleSource_h3346 :
    ((!((allOneRankAtom (sourceRanks P) 5 == allOneRankAtom (sourceRanks P) 1)) || ((allOneRankAtom (sourceRanks P) 57).ult (allOneRankAtom (sourceRanks P) 27)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (27 : Fin 78) (5 : Fin 78)
    (57 : Fin 78) (1 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (6 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (26 : Fin 78) (6 : Fin 78) (5 : Fin 78)
    (27 : Fin 78) (1 : Fin 78) (57 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3347` (kalmanson). -/
theorem middleSource_h3347 :
    ((!((allOneRankAtom (sourceRanks P) 5 == allOneRankAtom (sourceRanks P) 57)) || ((allOneRankAtom (sourceRanks P) 1).ult (allOneRankAtom (sourceRanks P) 27)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (27 : Fin 78) (5 : Fin 78)
    (1 : Fin 78) (57 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (6 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (26 : Fin 78) (6 : Fin 78) (5 : Fin 78)
    (27 : Fin 78) (1 : Fin 78) (57 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3348` (kalmanson). -/
theorem middleSource_h3348 :
    ((!((allOneRankAtom (sourceRanks P) 27 == allOneRankAtom (sourceRanks P) 1)) || ((allOneRankAtom (sourceRanks P) 57).ult (allOneRankAtom (sourceRanks P) 5)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (5 : Fin 78) (27 : Fin 78)
    (57 : Fin 78) (1 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (6 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (26 : Fin 78) (6 : Fin 78) (5 : Fin 78)
    (27 : Fin 78) (1 : Fin 78) (57 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3349` (kalmanson). -/
theorem middleSource_h3349 :
    ((!((allOneRankAtom (sourceRanks P) 5 == allOneRankAtom (sourceRanks P) 6)) || ((allOneRankAtom (sourceRanks P) 26).ult (allOneRankAtom (sourceRanks P) 27)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (27 : Fin 78) (5 : Fin 78)
    (26 : Fin 78) (6 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (6 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (26 : Fin 78) (6 : Fin 78) (5 : Fin 78)
    (27 : Fin 78) (1 : Fin 78) (57 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3350` (kalmanson). -/
theorem middleSource_h3350 :
    ((!((allOneRankAtom (sourceRanks P) 5 == allOneRankAtom (sourceRanks P) 26)) || ((allOneRankAtom (sourceRanks P) 6).ult (allOneRankAtom (sourceRanks P) 27)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (27 : Fin 78) (5 : Fin 78)
    (6 : Fin 78) (26 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (6 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (26 : Fin 78) (6 : Fin 78) (5 : Fin 78)
    (27 : Fin 78) (1 : Fin 78) (57 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3351` (kalmanson). -/
theorem middleSource_h3351 :
    ((!((allOneRankAtom (sourceRanks P) 27 == allOneRankAtom (sourceRanks P) 26)) || ((allOneRankAtom (sourceRanks P) 6).ult (allOneRankAtom (sourceRanks P) 5)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (5 : Fin 78) (27 : Fin 78)
    (6 : Fin 78) (26 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (6 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (26 : Fin 78) (6 : Fin 78) (5 : Fin 78)
    (27 : Fin 78) (1 : Fin 78) (57 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3352` (kalmanson). -/
theorem middleSource_h3352 :
    ((!((allOneRankAtom (sourceRanks P) 5 == allOneRankAtom (sourceRanks P) 1)) || ((allOneRankAtom (sourceRanks P) 58).ult (allOneRankAtom (sourceRanks P) 28)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (28 : Fin 78) (5 : Fin 78)
    (58 : Fin 78) (1 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (6 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (26 : Fin 78) (7 : Fin 78) (5 : Fin 78)
    (28 : Fin 78) (1 : Fin 78) (58 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3353` (kalmanson). -/
theorem middleSource_h3353 :
    ((!((allOneRankAtom (sourceRanks P) 5 == allOneRankAtom (sourceRanks P) 58)) || ((allOneRankAtom (sourceRanks P) 1).ult (allOneRankAtom (sourceRanks P) 28)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (28 : Fin 78) (5 : Fin 78)
    (1 : Fin 78) (58 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (6 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (26 : Fin 78) (7 : Fin 78) (5 : Fin 78)
    (28 : Fin 78) (1 : Fin 78) (58 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3354` (kalmanson). -/
theorem middleSource_h3354 :
    ((!((allOneRankAtom (sourceRanks P) 28 == allOneRankAtom (sourceRanks P) 1)) || ((allOneRankAtom (sourceRanks P) 58).ult (allOneRankAtom (sourceRanks P) 5)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (5 : Fin 78) (28 : Fin 78)
    (58 : Fin 78) (1 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (6 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (26 : Fin 78) (7 : Fin 78) (5 : Fin 78)
    (28 : Fin 78) (1 : Fin 78) (58 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3355` (kalmanson). -/
theorem middleSource_h3355 :
    ((!((allOneRankAtom (sourceRanks P) 28 == allOneRankAtom (sourceRanks P) 58)) || ((allOneRankAtom (sourceRanks P) 1).ult (allOneRankAtom (sourceRanks P) 5)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (5 : Fin 78) (28 : Fin 78)
    (1 : Fin 78) (58 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (6 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (26 : Fin 78) (7 : Fin 78) (5 : Fin 78)
    (28 : Fin 78) (1 : Fin 78) (58 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3356` (kalmanson). -/
theorem middleSource_h3356 :
    ((!((allOneRankAtom (sourceRanks P) 5 == allOneRankAtom (sourceRanks P) 7)) || ((allOneRankAtom (sourceRanks P) 26).ult (allOneRankAtom (sourceRanks P) 28)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (28 : Fin 78) (5 : Fin 78)
    (26 : Fin 78) (7 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (6 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (26 : Fin 78) (7 : Fin 78) (5 : Fin 78)
    (28 : Fin 78) (1 : Fin 78) (58 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3357` (kalmanson). -/
theorem middleSource_h3357 :
    ((!((allOneRankAtom (sourceRanks P) 5 == allOneRankAtom (sourceRanks P) 26)) || ((allOneRankAtom (sourceRanks P) 7).ult (allOneRankAtom (sourceRanks P) 28)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (28 : Fin 78) (5 : Fin 78)
    (7 : Fin 78) (26 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (6 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (26 : Fin 78) (7 : Fin 78) (5 : Fin 78)
    (28 : Fin 78) (1 : Fin 78) (58 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3358` (kalmanson). -/
theorem middleSource_h3358 :
    ((!((allOneRankAtom (sourceRanks P) 28 == allOneRankAtom (sourceRanks P) 7)) || ((allOneRankAtom (sourceRanks P) 26).ult (allOneRankAtom (sourceRanks P) 5)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (5 : Fin 78) (28 : Fin 78)
    (26 : Fin 78) (7 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (6 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (26 : Fin 78) (7 : Fin 78) (5 : Fin 78)
    (28 : Fin 78) (1 : Fin 78) (58 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3359` (kalmanson). -/
theorem middleSource_h3359 :
    ((!((allOneRankAtom (sourceRanks P) 28 == allOneRankAtom (sourceRanks P) 26)) || ((allOneRankAtom (sourceRanks P) 7).ult (allOneRankAtom (sourceRanks P) 5)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (5 : Fin 78) (28 : Fin 78)
    (7 : Fin 78) (26 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (6 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (26 : Fin 78) (7 : Fin 78) (5 : Fin 78)
    (28 : Fin 78) (1 : Fin 78) (58 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3360` (kalmanson). -/
theorem middleSource_h3360 :
    ((!((allOneRankAtom (sourceRanks P) 5 == allOneRankAtom (sourceRanks P) 1)) || ((allOneRankAtom (sourceRanks P) 59).ult (allOneRankAtom (sourceRanks P) 29)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (29 : Fin 78) (5 : Fin 78)
    (59 : Fin 78) (1 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (6 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (26 : Fin 78) (8 : Fin 78) (5 : Fin 78)
    (29 : Fin 78) (1 : Fin 78) (59 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3361` (kalmanson). -/
theorem middleSource_h3361 :
    ((!((allOneRankAtom (sourceRanks P) 5 == allOneRankAtom (sourceRanks P) 59)) || ((allOneRankAtom (sourceRanks P) 1).ult (allOneRankAtom (sourceRanks P) 29)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (29 : Fin 78) (5 : Fin 78)
    (1 : Fin 78) (59 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (6 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (26 : Fin 78) (8 : Fin 78) (5 : Fin 78)
    (29 : Fin 78) (1 : Fin 78) (59 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3362` (kalmanson). -/
theorem middleSource_h3362 :
    ((!((allOneRankAtom (sourceRanks P) 29 == allOneRankAtom (sourceRanks P) 1)) || ((allOneRankAtom (sourceRanks P) 59).ult (allOneRankAtom (sourceRanks P) 5)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (5 : Fin 78) (29 : Fin 78)
    (59 : Fin 78) (1 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (6 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (26 : Fin 78) (8 : Fin 78) (5 : Fin 78)
    (29 : Fin 78) (1 : Fin 78) (59 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3363` (kalmanson). -/
theorem middleSource_h3363 :
    ((!((allOneRankAtom (sourceRanks P) 29 == allOneRankAtom (sourceRanks P) 59)) || ((allOneRankAtom (sourceRanks P) 1).ult (allOneRankAtom (sourceRanks P) 5)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (5 : Fin 78) (29 : Fin 78)
    (1 : Fin 78) (59 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (6 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (26 : Fin 78) (8 : Fin 78) (5 : Fin 78)
    (29 : Fin 78) (1 : Fin 78) (59 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3364` (kalmanson). -/
theorem middleSource_h3364 :
    ((!((allOneRankAtom (sourceRanks P) 5 == allOneRankAtom (sourceRanks P) 8)) || ((allOneRankAtom (sourceRanks P) 26).ult (allOneRankAtom (sourceRanks P) 29)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (29 : Fin 78) (5 : Fin 78)
    (26 : Fin 78) (8 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (6 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (26 : Fin 78) (8 : Fin 78) (5 : Fin 78)
    (29 : Fin 78) (1 : Fin 78) (59 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3365` (kalmanson). -/
theorem middleSource_h3365 :
    ((!((allOneRankAtom (sourceRanks P) 5 == allOneRankAtom (sourceRanks P) 26)) || ((allOneRankAtom (sourceRanks P) 8).ult (allOneRankAtom (sourceRanks P) 29)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (29 : Fin 78) (5 : Fin 78)
    (8 : Fin 78) (26 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (6 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (26 : Fin 78) (8 : Fin 78) (5 : Fin 78)
    (29 : Fin 78) (1 : Fin 78) (59 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3366` (kalmanson). -/
theorem middleSource_h3366 :
    ((!((allOneRankAtom (sourceRanks P) 29 == allOneRankAtom (sourceRanks P) 8)) || ((allOneRankAtom (sourceRanks P) 26).ult (allOneRankAtom (sourceRanks P) 5)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (5 : Fin 78) (29 : Fin 78)
    (26 : Fin 78) (8 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (6 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (26 : Fin 78) (8 : Fin 78) (5 : Fin 78)
    (29 : Fin 78) (1 : Fin 78) (59 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3367` (kalmanson). -/
theorem middleSource_h3367 :
    ((!((allOneRankAtom (sourceRanks P) 29 == allOneRankAtom (sourceRanks P) 26)) || ((allOneRankAtom (sourceRanks P) 8).ult (allOneRankAtom (sourceRanks P) 5)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (5 : Fin 78) (29 : Fin 78)
    (8 : Fin 78) (26 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (6 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (26 : Fin 78) (8 : Fin 78) (5 : Fin 78)
    (29 : Fin 78) (1 : Fin 78) (59 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3368` (kalmanson). -/
theorem middleSource_h3368 :
    ((!((allOneRankAtom (sourceRanks P) 5 == allOneRankAtom (sourceRanks P) 1)) || ((allOneRankAtom (sourceRanks P) 60).ult (allOneRankAtom (sourceRanks P) 30)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (30 : Fin 78) (5 : Fin 78)
    (60 : Fin 78) (1 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (6 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (26 : Fin 78) (9 : Fin 78) (5 : Fin 78)
    (30 : Fin 78) (1 : Fin 78) (60 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3369` (kalmanson). -/
theorem middleSource_h3369 :
    ((!((allOneRankAtom (sourceRanks P) 5 == allOneRankAtom (sourceRanks P) 60)) || ((allOneRankAtom (sourceRanks P) 1).ult (allOneRankAtom (sourceRanks P) 30)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (30 : Fin 78) (5 : Fin 78)
    (1 : Fin 78) (60 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (6 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (26 : Fin 78) (9 : Fin 78) (5 : Fin 78)
    (30 : Fin 78) (1 : Fin 78) (60 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3370` (kalmanson). -/
theorem middleSource_h3370 :
    ((!((allOneRankAtom (sourceRanks P) 30 == allOneRankAtom (sourceRanks P) 1)) || ((allOneRankAtom (sourceRanks P) 60).ult (allOneRankAtom (sourceRanks P) 5)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (5 : Fin 78) (30 : Fin 78)
    (60 : Fin 78) (1 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (6 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (26 : Fin 78) (9 : Fin 78) (5 : Fin 78)
    (30 : Fin 78) (1 : Fin 78) (60 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3371` (kalmanson). -/
theorem middleSource_h3371 :
    ((!((allOneRankAtom (sourceRanks P) 30 == allOneRankAtom (sourceRanks P) 60)) || ((allOneRankAtom (sourceRanks P) 1).ult (allOneRankAtom (sourceRanks P) 5)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (5 : Fin 78) (30 : Fin 78)
    (1 : Fin 78) (60 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (6 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (26 : Fin 78) (9 : Fin 78) (5 : Fin 78)
    (30 : Fin 78) (1 : Fin 78) (60 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3372` (kalmanson). -/
theorem middleSource_h3372 :
    ((!((allOneRankAtom (sourceRanks P) 5 == allOneRankAtom (sourceRanks P) 9)) || ((allOneRankAtom (sourceRanks P) 26).ult (allOneRankAtom (sourceRanks P) 30)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (30 : Fin 78) (5 : Fin 78)
    (26 : Fin 78) (9 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (6 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (26 : Fin 78) (9 : Fin 78) (5 : Fin 78)
    (30 : Fin 78) (1 : Fin 78) (60 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3373` (kalmanson). -/
theorem middleSource_h3373 :
    ((!((allOneRankAtom (sourceRanks P) 5 == allOneRankAtom (sourceRanks P) 26)) || ((allOneRankAtom (sourceRanks P) 9).ult (allOneRankAtom (sourceRanks P) 30)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (30 : Fin 78) (5 : Fin 78)
    (9 : Fin 78) (26 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (6 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (26 : Fin 78) (9 : Fin 78) (5 : Fin 78)
    (30 : Fin 78) (1 : Fin 78) (60 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3374` (kalmanson). -/
theorem middleSource_h3374 :
    ((!((allOneRankAtom (sourceRanks P) 30 == allOneRankAtom (sourceRanks P) 9)) || ((allOneRankAtom (sourceRanks P) 26).ult (allOneRankAtom (sourceRanks P) 5)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (5 : Fin 78) (30 : Fin 78)
    (26 : Fin 78) (9 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (6 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (26 : Fin 78) (9 : Fin 78) (5 : Fin 78)
    (30 : Fin 78) (1 : Fin 78) (60 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3375` (kalmanson). -/
theorem middleSource_h3375 :
    ((!((allOneRankAtom (sourceRanks P) 30 == allOneRankAtom (sourceRanks P) 26)) || ((allOneRankAtom (sourceRanks P) 9).ult (allOneRankAtom (sourceRanks P) 5)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (5 : Fin 78) (30 : Fin 78)
    (9 : Fin 78) (26 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (6 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (26 : Fin 78) (9 : Fin 78) (5 : Fin 78)
    (30 : Fin 78) (1 : Fin 78) (60 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3376` (kalmanson). -/
theorem middleSource_h3376 :
    ((!((allOneRankAtom (sourceRanks P) 5 == allOneRankAtom (sourceRanks P) 1)) || ((allOneRankAtom (sourceRanks P) 61).ult (allOneRankAtom (sourceRanks P) 31)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (31 : Fin 78) (5 : Fin 78)
    (61 : Fin 78) (1 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (6 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (26 : Fin 78) (10 : Fin 78) (5 : Fin 78)
    (31 : Fin 78) (1 : Fin 78) (61 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3377` (kalmanson). -/
theorem middleSource_h3377 :
    ((!((allOneRankAtom (sourceRanks P) 5 == allOneRankAtom (sourceRanks P) 61)) || ((allOneRankAtom (sourceRanks P) 1).ult (allOneRankAtom (sourceRanks P) 31)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (31 : Fin 78) (5 : Fin 78)
    (1 : Fin 78) (61 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (6 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (26 : Fin 78) (10 : Fin 78) (5 : Fin 78)
    (31 : Fin 78) (1 : Fin 78) (61 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3378` (kalmanson). -/
theorem middleSource_h3378 :
    ((!((allOneRankAtom (sourceRanks P) 31 == allOneRankAtom (sourceRanks P) 1)) || ((allOneRankAtom (sourceRanks P) 61).ult (allOneRankAtom (sourceRanks P) 5)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (5 : Fin 78) (31 : Fin 78)
    (61 : Fin 78) (1 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (6 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (26 : Fin 78) (10 : Fin 78) (5 : Fin 78)
    (31 : Fin 78) (1 : Fin 78) (61 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3379` (kalmanson). -/
theorem middleSource_h3379 :
    ((!((allOneRankAtom (sourceRanks P) 31 == allOneRankAtom (sourceRanks P) 61)) || ((allOneRankAtom (sourceRanks P) 1).ult (allOneRankAtom (sourceRanks P) 5)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (5 : Fin 78) (31 : Fin 78)
    (1 : Fin 78) (61 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (6 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (26 : Fin 78) (10 : Fin 78) (5 : Fin 78)
    (31 : Fin 78) (1 : Fin 78) (61 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3380` (kalmanson). -/
theorem middleSource_h3380 :
    ((!((allOneRankAtom (sourceRanks P) 5 == allOneRankAtom (sourceRanks P) 10)) || ((allOneRankAtom (sourceRanks P) 26).ult (allOneRankAtom (sourceRanks P) 31)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (31 : Fin 78) (5 : Fin 78)
    (26 : Fin 78) (10 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (6 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (26 : Fin 78) (10 : Fin 78) (5 : Fin 78)
    (31 : Fin 78) (1 : Fin 78) (61 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3381` (kalmanson). -/
theorem middleSource_h3381 :
    ((!((allOneRankAtom (sourceRanks P) 5 == allOneRankAtom (sourceRanks P) 26)) || ((allOneRankAtom (sourceRanks P) 10).ult (allOneRankAtom (sourceRanks P) 31)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (31 : Fin 78) (5 : Fin 78)
    (10 : Fin 78) (26 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (6 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (26 : Fin 78) (10 : Fin 78) (5 : Fin 78)
    (31 : Fin 78) (1 : Fin 78) (61 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3382` (kalmanson). -/
theorem middleSource_h3382 :
    ((!((allOneRankAtom (sourceRanks P) 31 == allOneRankAtom (sourceRanks P) 10)) || ((allOneRankAtom (sourceRanks P) 26).ult (allOneRankAtom (sourceRanks P) 5)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (5 : Fin 78) (31 : Fin 78)
    (26 : Fin 78) (10 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (6 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (26 : Fin 78) (10 : Fin 78) (5 : Fin 78)
    (31 : Fin 78) (1 : Fin 78) (61 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3383` (kalmanson). -/
theorem middleSource_h3383 :
    ((!((allOneRankAtom (sourceRanks P) 31 == allOneRankAtom (sourceRanks P) 26)) || ((allOneRankAtom (sourceRanks P) 10).ult (allOneRankAtom (sourceRanks P) 5)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (5 : Fin 78) (31 : Fin 78)
    (10 : Fin 78) (26 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (6 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (26 : Fin 78) (10 : Fin 78) (5 : Fin 78)
    (31 : Fin 78) (1 : Fin 78) (61 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3384` (kalmanson). -/
theorem middleSource_h3384 :
    ((!((allOneRankAtom (sourceRanks P) 5 == allOneRankAtom (sourceRanks P) 1)) || ((allOneRankAtom (sourceRanks P) 62).ult (allOneRankAtom (sourceRanks P) 32)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (32 : Fin 78) (5 : Fin 78)
    (62 : Fin 78) (1 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (6 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (26 : Fin 78) (11 : Fin 78) (5 : Fin 78)
    (32 : Fin 78) (1 : Fin 78) (62 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3385` (kalmanson). -/
theorem middleSource_h3385 :
    ((!((allOneRankAtom (sourceRanks P) 5 == allOneRankAtom (sourceRanks P) 62)) || ((allOneRankAtom (sourceRanks P) 1).ult (allOneRankAtom (sourceRanks P) 32)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (32 : Fin 78) (5 : Fin 78)
    (1 : Fin 78) (62 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (6 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (26 : Fin 78) (11 : Fin 78) (5 : Fin 78)
    (32 : Fin 78) (1 : Fin 78) (62 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3386` (kalmanson). -/
theorem middleSource_h3386 :
    ((!((allOneRankAtom (sourceRanks P) 32 == allOneRankAtom (sourceRanks P) 1)) || ((allOneRankAtom (sourceRanks P) 62).ult (allOneRankAtom (sourceRanks P) 5)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (5 : Fin 78) (32 : Fin 78)
    (62 : Fin 78) (1 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (6 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (26 : Fin 78) (11 : Fin 78) (5 : Fin 78)
    (32 : Fin 78) (1 : Fin 78) (62 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3387` (kalmanson). -/
theorem middleSource_h3387 :
    ((!((allOneRankAtom (sourceRanks P) 5 == allOneRankAtom (sourceRanks P) 11)) || ((allOneRankAtom (sourceRanks P) 26).ult (allOneRankAtom (sourceRanks P) 32)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (32 : Fin 78) (5 : Fin 78)
    (26 : Fin 78) (11 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (6 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (26 : Fin 78) (11 : Fin 78) (5 : Fin 78)
    (32 : Fin 78) (1 : Fin 78) (62 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3388` (kalmanson). -/
theorem middleSource_h3388 :
    ((!((allOneRankAtom (sourceRanks P) 5 == allOneRankAtom (sourceRanks P) 26)) || ((allOneRankAtom (sourceRanks P) 11).ult (allOneRankAtom (sourceRanks P) 32)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (32 : Fin 78) (5 : Fin 78)
    (11 : Fin 78) (26 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (6 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (26 : Fin 78) (11 : Fin 78) (5 : Fin 78)
    (32 : Fin 78) (1 : Fin 78) (62 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3389` (kalmanson). -/
theorem middleSource_h3389 :
    ((!((allOneRankAtom (sourceRanks P) 32 == allOneRankAtom (sourceRanks P) 26)) || ((allOneRankAtom (sourceRanks P) 11).ult (allOneRankAtom (sourceRanks P) 5)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (5 : Fin 78) (32 : Fin 78)
    (11 : Fin 78) (26 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (6 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (26 : Fin 78) (11 : Fin 78) (5 : Fin 78)
    (32 : Fin 78) (1 : Fin 78) (62 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3390` (kalmanson). -/
theorem middleSource_h3390 :
    ((!((allOneRankAtom (sourceRanks P) 6 == allOneRankAtom (sourceRanks P) 1)) || ((allOneRankAtom (sourceRanks P) 63).ult (allOneRankAtom (sourceRanks P) 28)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (28 : Fin 78) (6 : Fin 78)
    (63 : Fin 78) (1 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (7 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (27 : Fin 78) (7 : Fin 78) (6 : Fin 78)
    (28 : Fin 78) (1 : Fin 78) (63 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3391` (kalmanson). -/
theorem middleSource_h3391 :
    ((!((allOneRankAtom (sourceRanks P) 28 == allOneRankAtom (sourceRanks P) 63)) || ((allOneRankAtom (sourceRanks P) 1).ult (allOneRankAtom (sourceRanks P) 6)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (6 : Fin 78) (28 : Fin 78)
    (1 : Fin 78) (63 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (7 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (27 : Fin 78) (7 : Fin 78) (6 : Fin 78)
    (28 : Fin 78) (1 : Fin 78) (63 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

end

end ATailExactFiveCard13AllOneSourceIngressScratch
end Problem97
