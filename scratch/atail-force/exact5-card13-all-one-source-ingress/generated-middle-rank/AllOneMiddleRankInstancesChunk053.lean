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

/-- Candidate middle source assertion `h3392` (kalmanson). -/
theorem middleSource_h3392 :
    ((!((allOneRankAtom (sourceRanks P) 6 == allOneRankAtom (sourceRanks P) 7)) || ((allOneRankAtom (sourceRanks P) 27).ult (allOneRankAtom (sourceRanks P) 28)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (28 : Fin 78) (6 : Fin 78)
    (27 : Fin 78) (7 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (7 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (27 : Fin 78) (7 : Fin 78) (6 : Fin 78)
    (28 : Fin 78) (1 : Fin 78) (63 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3393` (kalmanson). -/
theorem middleSource_h3393 :
    ((!((allOneRankAtom (sourceRanks P) 6 == allOneRankAtom (sourceRanks P) 27)) || ((allOneRankAtom (sourceRanks P) 7).ult (allOneRankAtom (sourceRanks P) 28)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (28 : Fin 78) (6 : Fin 78)
    (7 : Fin 78) (27 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (7 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (27 : Fin 78) (7 : Fin 78) (6 : Fin 78)
    (28 : Fin 78) (1 : Fin 78) (63 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3394` (kalmanson). -/
theorem middleSource_h3394 :
    ((!((allOneRankAtom (sourceRanks P) 28 == allOneRankAtom (sourceRanks P) 7)) || ((allOneRankAtom (sourceRanks P) 27).ult (allOneRankAtom (sourceRanks P) 6)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (6 : Fin 78) (28 : Fin 78)
    (27 : Fin 78) (7 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (7 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (27 : Fin 78) (7 : Fin 78) (6 : Fin 78)
    (28 : Fin 78) (1 : Fin 78) (63 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3395` (kalmanson). -/
theorem middleSource_h3395 :
    ((!((allOneRankAtom (sourceRanks P) 28 == allOneRankAtom (sourceRanks P) 27)) || ((allOneRankAtom (sourceRanks P) 7).ult (allOneRankAtom (sourceRanks P) 6)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (6 : Fin 78) (28 : Fin 78)
    (7 : Fin 78) (27 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (7 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (27 : Fin 78) (7 : Fin 78) (6 : Fin 78)
    (28 : Fin 78) (1 : Fin 78) (63 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3396` (kalmanson). -/
theorem middleSource_h3396 :
    ((!((allOneRankAtom (sourceRanks P) 6 == allOneRankAtom (sourceRanks P) 1)) || ((allOneRankAtom (sourceRanks P) 64).ult (allOneRankAtom (sourceRanks P) 29)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (29 : Fin 78) (6 : Fin 78)
    (64 : Fin 78) (1 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (7 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (27 : Fin 78) (8 : Fin 78) (6 : Fin 78)
    (29 : Fin 78) (1 : Fin 78) (64 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3397` (kalmanson). -/
theorem middleSource_h3397 :
    ((!((allOneRankAtom (sourceRanks P) 29 == allOneRankAtom (sourceRanks P) 1)) || ((allOneRankAtom (sourceRanks P) 64).ult (allOneRankAtom (sourceRanks P) 6)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (6 : Fin 78) (29 : Fin 78)
    (64 : Fin 78) (1 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (7 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (27 : Fin 78) (8 : Fin 78) (6 : Fin 78)
    (29 : Fin 78) (1 : Fin 78) (64 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3398` (kalmanson). -/
theorem middleSource_h3398 :
    ((!((allOneRankAtom (sourceRanks P) 29 == allOneRankAtom (sourceRanks P) 64)) || ((allOneRankAtom (sourceRanks P) 1).ult (allOneRankAtom (sourceRanks P) 6)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (6 : Fin 78) (29 : Fin 78)
    (1 : Fin 78) (64 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (7 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (27 : Fin 78) (8 : Fin 78) (6 : Fin 78)
    (29 : Fin 78) (1 : Fin 78) (64 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3399` (kalmanson). -/
theorem middleSource_h3399 :
    ((!((allOneRankAtom (sourceRanks P) 6 == allOneRankAtom (sourceRanks P) 8)) || ((allOneRankAtom (sourceRanks P) 27).ult (allOneRankAtom (sourceRanks P) 29)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (29 : Fin 78) (6 : Fin 78)
    (27 : Fin 78) (8 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (7 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (27 : Fin 78) (8 : Fin 78) (6 : Fin 78)
    (29 : Fin 78) (1 : Fin 78) (64 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3400` (kalmanson). -/
theorem middleSource_h3400 :
    ((!((allOneRankAtom (sourceRanks P) 29 == allOneRankAtom (sourceRanks P) 8)) || ((allOneRankAtom (sourceRanks P) 27).ult (allOneRankAtom (sourceRanks P) 6)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (6 : Fin 78) (29 : Fin 78)
    (27 : Fin 78) (8 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (7 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (27 : Fin 78) (8 : Fin 78) (6 : Fin 78)
    (29 : Fin 78) (1 : Fin 78) (64 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3401` (kalmanson). -/
theorem middleSource_h3401 :
    ((!((allOneRankAtom (sourceRanks P) 29 == allOneRankAtom (sourceRanks P) 27)) || ((allOneRankAtom (sourceRanks P) 8).ult (allOneRankAtom (sourceRanks P) 6)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (6 : Fin 78) (29 : Fin 78)
    (8 : Fin 78) (27 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (7 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (27 : Fin 78) (8 : Fin 78) (6 : Fin 78)
    (29 : Fin 78) (1 : Fin 78) (64 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3402` (kalmanson). -/
theorem middleSource_h3402 :
    ((!((allOneRankAtom (sourceRanks P) 6 == allOneRankAtom (sourceRanks P) 1)) || ((allOneRankAtom (sourceRanks P) 65).ult (allOneRankAtom (sourceRanks P) 30)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (30 : Fin 78) (6 : Fin 78)
    (65 : Fin 78) (1 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (7 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (27 : Fin 78) (9 : Fin 78) (6 : Fin 78)
    (30 : Fin 78) (1 : Fin 78) (65 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3403` (kalmanson). -/
theorem middleSource_h3403 :
    ((!((allOneRankAtom (sourceRanks P) 30 == allOneRankAtom (sourceRanks P) 1)) || ((allOneRankAtom (sourceRanks P) 65).ult (allOneRankAtom (sourceRanks P) 6)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (6 : Fin 78) (30 : Fin 78)
    (65 : Fin 78) (1 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (7 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (27 : Fin 78) (9 : Fin 78) (6 : Fin 78)
    (30 : Fin 78) (1 : Fin 78) (65 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3404` (kalmanson). -/
theorem middleSource_h3404 :
    ((!((allOneRankAtom (sourceRanks P) 30 == allOneRankAtom (sourceRanks P) 65)) || ((allOneRankAtom (sourceRanks P) 1).ult (allOneRankAtom (sourceRanks P) 6)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (6 : Fin 78) (30 : Fin 78)
    (1 : Fin 78) (65 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (7 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (27 : Fin 78) (9 : Fin 78) (6 : Fin 78)
    (30 : Fin 78) (1 : Fin 78) (65 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3405` (kalmanson). -/
theorem middleSource_h3405 :
    ((!((allOneRankAtom (sourceRanks P) 6 == allOneRankAtom (sourceRanks P) 9)) || ((allOneRankAtom (sourceRanks P) 27).ult (allOneRankAtom (sourceRanks P) 30)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (30 : Fin 78) (6 : Fin 78)
    (27 : Fin 78) (9 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (7 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (27 : Fin 78) (9 : Fin 78) (6 : Fin 78)
    (30 : Fin 78) (1 : Fin 78) (65 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3406` (kalmanson). -/
theorem middleSource_h3406 :
    ((!((allOneRankAtom (sourceRanks P) 30 == allOneRankAtom (sourceRanks P) 9)) || ((allOneRankAtom (sourceRanks P) 27).ult (allOneRankAtom (sourceRanks P) 6)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (6 : Fin 78) (30 : Fin 78)
    (27 : Fin 78) (9 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (7 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (27 : Fin 78) (9 : Fin 78) (6 : Fin 78)
    (30 : Fin 78) (1 : Fin 78) (65 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3407` (kalmanson). -/
theorem middleSource_h3407 :
    ((!((allOneRankAtom (sourceRanks P) 30 == allOneRankAtom (sourceRanks P) 27)) || ((allOneRankAtom (sourceRanks P) 9).ult (allOneRankAtom (sourceRanks P) 6)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (6 : Fin 78) (30 : Fin 78)
    (9 : Fin 78) (27 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (7 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (27 : Fin 78) (9 : Fin 78) (6 : Fin 78)
    (30 : Fin 78) (1 : Fin 78) (65 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3408` (kalmanson). -/
theorem middleSource_h3408 :
    ((!((allOneRankAtom (sourceRanks P) 6 == allOneRankAtom (sourceRanks P) 1)) || ((allOneRankAtom (sourceRanks P) 66).ult (allOneRankAtom (sourceRanks P) 31)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (31 : Fin 78) (6 : Fin 78)
    (66 : Fin 78) (1 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (7 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (27 : Fin 78) (10 : Fin 78) (6 : Fin 78)
    (31 : Fin 78) (1 : Fin 78) (66 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3409` (kalmanson). -/
theorem middleSource_h3409 :
    ((!((allOneRankAtom (sourceRanks P) 6 == allOneRankAtom (sourceRanks P) 66)) || ((allOneRankAtom (sourceRanks P) 1).ult (allOneRankAtom (sourceRanks P) 31)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (31 : Fin 78) (6 : Fin 78)
    (1 : Fin 78) (66 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (7 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (27 : Fin 78) (10 : Fin 78) (6 : Fin 78)
    (31 : Fin 78) (1 : Fin 78) (66 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3410` (kalmanson). -/
theorem middleSource_h3410 :
    ((!((allOneRankAtom (sourceRanks P) 31 == allOneRankAtom (sourceRanks P) 1)) || ((allOneRankAtom (sourceRanks P) 66).ult (allOneRankAtom (sourceRanks P) 6)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (6 : Fin 78) (31 : Fin 78)
    (66 : Fin 78) (1 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (7 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (27 : Fin 78) (10 : Fin 78) (6 : Fin 78)
    (31 : Fin 78) (1 : Fin 78) (66 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3411` (kalmanson). -/
theorem middleSource_h3411 :
    ((!((allOneRankAtom (sourceRanks P) 31 == allOneRankAtom (sourceRanks P) 66)) || ((allOneRankAtom (sourceRanks P) 1).ult (allOneRankAtom (sourceRanks P) 6)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (6 : Fin 78) (31 : Fin 78)
    (1 : Fin 78) (66 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (7 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (27 : Fin 78) (10 : Fin 78) (6 : Fin 78)
    (31 : Fin 78) (1 : Fin 78) (66 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3412` (kalmanson). -/
theorem middleSource_h3412 :
    ((!((allOneRankAtom (sourceRanks P) 6 == allOneRankAtom (sourceRanks P) 10)) || ((allOneRankAtom (sourceRanks P) 27).ult (allOneRankAtom (sourceRanks P) 31)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (31 : Fin 78) (6 : Fin 78)
    (27 : Fin 78) (10 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (7 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (27 : Fin 78) (10 : Fin 78) (6 : Fin 78)
    (31 : Fin 78) (1 : Fin 78) (66 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3413` (kalmanson). -/
theorem middleSource_h3413 :
    ((!((allOneRankAtom (sourceRanks P) 31 == allOneRankAtom (sourceRanks P) 10)) || ((allOneRankAtom (sourceRanks P) 27).ult (allOneRankAtom (sourceRanks P) 6)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (6 : Fin 78) (31 : Fin 78)
    (27 : Fin 78) (10 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (7 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (27 : Fin 78) (10 : Fin 78) (6 : Fin 78)
    (31 : Fin 78) (1 : Fin 78) (66 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3414` (kalmanson). -/
theorem middleSource_h3414 :
    ((!((allOneRankAtom (sourceRanks P) 31 == allOneRankAtom (sourceRanks P) 27)) || ((allOneRankAtom (sourceRanks P) 10).ult (allOneRankAtom (sourceRanks P) 6)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (6 : Fin 78) (31 : Fin 78)
    (10 : Fin 78) (27 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (7 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (27 : Fin 78) (10 : Fin 78) (6 : Fin 78)
    (31 : Fin 78) (1 : Fin 78) (66 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3415` (kalmanson). -/
theorem middleSource_h3415 :
    ((!((allOneRankAtom (sourceRanks P) 6 == allOneRankAtom (sourceRanks P) 1)) || ((allOneRankAtom (sourceRanks P) 67).ult (allOneRankAtom (sourceRanks P) 32)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (32 : Fin 78) (6 : Fin 78)
    (67 : Fin 78) (1 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (7 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (27 : Fin 78) (11 : Fin 78) (6 : Fin 78)
    (32 : Fin 78) (1 : Fin 78) (67 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3416` (kalmanson). -/
theorem middleSource_h3416 :
    ((!((allOneRankAtom (sourceRanks P) 32 == allOneRankAtom (sourceRanks P) 1)) || ((allOneRankAtom (sourceRanks P) 67).ult (allOneRankAtom (sourceRanks P) 6)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (6 : Fin 78) (32 : Fin 78)
    (67 : Fin 78) (1 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (7 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (27 : Fin 78) (11 : Fin 78) (6 : Fin 78)
    (32 : Fin 78) (1 : Fin 78) (67 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3417` (kalmanson). -/
theorem middleSource_h3417 :
    ((!((allOneRankAtom (sourceRanks P) 6 == allOneRankAtom (sourceRanks P) 11)) || ((allOneRankAtom (sourceRanks P) 27).ult (allOneRankAtom (sourceRanks P) 32)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (32 : Fin 78) (6 : Fin 78)
    (27 : Fin 78) (11 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (7 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (27 : Fin 78) (11 : Fin 78) (6 : Fin 78)
    (32 : Fin 78) (1 : Fin 78) (67 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3418` (kalmanson). -/
theorem middleSource_h3418 :
    ((!((allOneRankAtom (sourceRanks P) 32 == allOneRankAtom (sourceRanks P) 27)) || ((allOneRankAtom (sourceRanks P) 11).ult (allOneRankAtom (sourceRanks P) 6)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (6 : Fin 78) (32 : Fin 78)
    (11 : Fin 78) (27 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (7 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (27 : Fin 78) (11 : Fin 78) (6 : Fin 78)
    (32 : Fin 78) (1 : Fin 78) (67 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3419` (kalmanson). -/
theorem middleSource_h3419 :
    ((!((allOneRankAtom (sourceRanks P) 7 == allOneRankAtom (sourceRanks P) 1)) || ((allOneRankAtom (sourceRanks P) 68).ult (allOneRankAtom (sourceRanks P) 29)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (29 : Fin 78) (7 : Fin 78)
    (68 : Fin 78) (1 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (8 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (28 : Fin 78) (8 : Fin 78) (7 : Fin 78)
    (29 : Fin 78) (1 : Fin 78) (68 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3420` (kalmanson). -/
theorem middleSource_h3420 :
    ((!((allOneRankAtom (sourceRanks P) 29 == allOneRankAtom (sourceRanks P) 1)) || ((allOneRankAtom (sourceRanks P) 68).ult (allOneRankAtom (sourceRanks P) 7)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (7 : Fin 78) (29 : Fin 78)
    (68 : Fin 78) (1 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (8 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (28 : Fin 78) (8 : Fin 78) (7 : Fin 78)
    (29 : Fin 78) (1 : Fin 78) (68 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3421` (kalmanson). -/
theorem middleSource_h3421 :
    ((!((allOneRankAtom (sourceRanks P) 29 == allOneRankAtom (sourceRanks P) 68)) || ((allOneRankAtom (sourceRanks P) 1).ult (allOneRankAtom (sourceRanks P) 7)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (7 : Fin 78) (29 : Fin 78)
    (1 : Fin 78) (68 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (8 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (28 : Fin 78) (8 : Fin 78) (7 : Fin 78)
    (29 : Fin 78) (1 : Fin 78) (68 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3422` (kalmanson). -/
theorem middleSource_h3422 :
    ((!((allOneRankAtom (sourceRanks P) 7 == allOneRankAtom (sourceRanks P) 8)) || ((allOneRankAtom (sourceRanks P) 28).ult (allOneRankAtom (sourceRanks P) 29)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (29 : Fin 78) (7 : Fin 78)
    (28 : Fin 78) (8 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (8 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (28 : Fin 78) (8 : Fin 78) (7 : Fin 78)
    (29 : Fin 78) (1 : Fin 78) (68 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3423` (kalmanson). -/
theorem middleSource_h3423 :
    ((!((allOneRankAtom (sourceRanks P) 7 == allOneRankAtom (sourceRanks P) 28)) || ((allOneRankAtom (sourceRanks P) 8).ult (allOneRankAtom (sourceRanks P) 29)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (29 : Fin 78) (7 : Fin 78)
    (8 : Fin 78) (28 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (8 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (28 : Fin 78) (8 : Fin 78) (7 : Fin 78)
    (29 : Fin 78) (1 : Fin 78) (68 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3424` (kalmanson). -/
theorem middleSource_h3424 :
    ((!((allOneRankAtom (sourceRanks P) 29 == allOneRankAtom (sourceRanks P) 8)) || ((allOneRankAtom (sourceRanks P) 28).ult (allOneRankAtom (sourceRanks P) 7)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (7 : Fin 78) (29 : Fin 78)
    (28 : Fin 78) (8 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (8 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (28 : Fin 78) (8 : Fin 78) (7 : Fin 78)
    (29 : Fin 78) (1 : Fin 78) (68 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3425` (kalmanson). -/
theorem middleSource_h3425 :
    ((!((allOneRankAtom (sourceRanks P) 29 == allOneRankAtom (sourceRanks P) 28)) || ((allOneRankAtom (sourceRanks P) 8).ult (allOneRankAtom (sourceRanks P) 7)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (7 : Fin 78) (29 : Fin 78)
    (8 : Fin 78) (28 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (8 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (28 : Fin 78) (8 : Fin 78) (7 : Fin 78)
    (29 : Fin 78) (1 : Fin 78) (68 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3426` (kalmanson). -/
theorem middleSource_h3426 :
    ((!((allOneRankAtom (sourceRanks P) 7 == allOneRankAtom (sourceRanks P) 1)) || ((allOneRankAtom (sourceRanks P) 69).ult (allOneRankAtom (sourceRanks P) 30)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (30 : Fin 78) (7 : Fin 78)
    (69 : Fin 78) (1 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (8 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (28 : Fin 78) (9 : Fin 78) (7 : Fin 78)
    (30 : Fin 78) (1 : Fin 78) (69 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3427` (kalmanson). -/
theorem middleSource_h3427 :
    ((!((allOneRankAtom (sourceRanks P) 30 == allOneRankAtom (sourceRanks P) 1)) || ((allOneRankAtom (sourceRanks P) 69).ult (allOneRankAtom (sourceRanks P) 7)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (7 : Fin 78) (30 : Fin 78)
    (69 : Fin 78) (1 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (8 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (28 : Fin 78) (9 : Fin 78) (7 : Fin 78)
    (30 : Fin 78) (1 : Fin 78) (69 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3428` (kalmanson). -/
theorem middleSource_h3428 :
    ((!((allOneRankAtom (sourceRanks P) 30 == allOneRankAtom (sourceRanks P) 69)) || ((allOneRankAtom (sourceRanks P) 1).ult (allOneRankAtom (sourceRanks P) 7)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (7 : Fin 78) (30 : Fin 78)
    (1 : Fin 78) (69 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (8 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (28 : Fin 78) (9 : Fin 78) (7 : Fin 78)
    (30 : Fin 78) (1 : Fin 78) (69 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3429` (kalmanson). -/
theorem middleSource_h3429 :
    ((!((allOneRankAtom (sourceRanks P) 7 == allOneRankAtom (sourceRanks P) 9)) || ((allOneRankAtom (sourceRanks P) 28).ult (allOneRankAtom (sourceRanks P) 30)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (30 : Fin 78) (7 : Fin 78)
    (28 : Fin 78) (9 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (8 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (28 : Fin 78) (9 : Fin 78) (7 : Fin 78)
    (30 : Fin 78) (1 : Fin 78) (69 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3430` (kalmanson). -/
theorem middleSource_h3430 :
    ((!((allOneRankAtom (sourceRanks P) 7 == allOneRankAtom (sourceRanks P) 28)) || ((allOneRankAtom (sourceRanks P) 9).ult (allOneRankAtom (sourceRanks P) 30)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (30 : Fin 78) (7 : Fin 78)
    (9 : Fin 78) (28 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (8 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (28 : Fin 78) (9 : Fin 78) (7 : Fin 78)
    (30 : Fin 78) (1 : Fin 78) (69 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3431` (kalmanson). -/
theorem middleSource_h3431 :
    ((!((allOneRankAtom (sourceRanks P) 30 == allOneRankAtom (sourceRanks P) 9)) || ((allOneRankAtom (sourceRanks P) 28).ult (allOneRankAtom (sourceRanks P) 7)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (7 : Fin 78) (30 : Fin 78)
    (28 : Fin 78) (9 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (8 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (28 : Fin 78) (9 : Fin 78) (7 : Fin 78)
    (30 : Fin 78) (1 : Fin 78) (69 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3432` (kalmanson). -/
theorem middleSource_h3432 :
    ((!((allOneRankAtom (sourceRanks P) 30 == allOneRankAtom (sourceRanks P) 28)) || ((allOneRankAtom (sourceRanks P) 9).ult (allOneRankAtom (sourceRanks P) 7)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (7 : Fin 78) (30 : Fin 78)
    (9 : Fin 78) (28 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (8 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (28 : Fin 78) (9 : Fin 78) (7 : Fin 78)
    (30 : Fin 78) (1 : Fin 78) (69 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3433` (kalmanson). -/
theorem middleSource_h3433 :
    ((!((allOneRankAtom (sourceRanks P) 7 == allOneRankAtom (sourceRanks P) 1)) || ((allOneRankAtom (sourceRanks P) 70).ult (allOneRankAtom (sourceRanks P) 31)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (31 : Fin 78) (7 : Fin 78)
    (70 : Fin 78) (1 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (8 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (28 : Fin 78) (10 : Fin 78) (7 : Fin 78)
    (31 : Fin 78) (1 : Fin 78) (70 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3434` (kalmanson). -/
theorem middleSource_h3434 :
    ((!((allOneRankAtom (sourceRanks P) 31 == allOneRankAtom (sourceRanks P) 1)) || ((allOneRankAtom (sourceRanks P) 70).ult (allOneRankAtom (sourceRanks P) 7)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (7 : Fin 78) (31 : Fin 78)
    (70 : Fin 78) (1 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (8 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (28 : Fin 78) (10 : Fin 78) (7 : Fin 78)
    (31 : Fin 78) (1 : Fin 78) (70 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3435` (kalmanson). -/
theorem middleSource_h3435 :
    ((!((allOneRankAtom (sourceRanks P) 31 == allOneRankAtom (sourceRanks P) 70)) || ((allOneRankAtom (sourceRanks P) 1).ult (allOneRankAtom (sourceRanks P) 7)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (7 : Fin 78) (31 : Fin 78)
    (1 : Fin 78) (70 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (8 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (28 : Fin 78) (10 : Fin 78) (7 : Fin 78)
    (31 : Fin 78) (1 : Fin 78) (70 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3436` (kalmanson). -/
theorem middleSource_h3436 :
    ((!((allOneRankAtom (sourceRanks P) 7 == allOneRankAtom (sourceRanks P) 28)) || ((allOneRankAtom (sourceRanks P) 10).ult (allOneRankAtom (sourceRanks P) 31)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (31 : Fin 78) (7 : Fin 78)
    (10 : Fin 78) (28 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (8 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (28 : Fin 78) (10 : Fin 78) (7 : Fin 78)
    (31 : Fin 78) (1 : Fin 78) (70 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3437` (kalmanson). -/
theorem middleSource_h3437 :
    ((!((allOneRankAtom (sourceRanks P) 31 == allOneRankAtom (sourceRanks P) 10)) || ((allOneRankAtom (sourceRanks P) 28).ult (allOneRankAtom (sourceRanks P) 7)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (7 : Fin 78) (31 : Fin 78)
    (28 : Fin 78) (10 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (8 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (28 : Fin 78) (10 : Fin 78) (7 : Fin 78)
    (31 : Fin 78) (1 : Fin 78) (70 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3438` (kalmanson). -/
theorem middleSource_h3438 :
    ((!((allOneRankAtom (sourceRanks P) 31 == allOneRankAtom (sourceRanks P) 28)) || ((allOneRankAtom (sourceRanks P) 10).ult (allOneRankAtom (sourceRanks P) 7)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (7 : Fin 78) (31 : Fin 78)
    (10 : Fin 78) (28 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (8 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (28 : Fin 78) (10 : Fin 78) (7 : Fin 78)
    (31 : Fin 78) (1 : Fin 78) (70 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3439` (kalmanson). -/
theorem middleSource_h3439 :
    ((!((allOneRankAtom (sourceRanks P) 7 == allOneRankAtom (sourceRanks P) 1)) || ((allOneRankAtom (sourceRanks P) 71).ult (allOneRankAtom (sourceRanks P) 32)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (32 : Fin 78) (7 : Fin 78)
    (71 : Fin 78) (1 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (8 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (28 : Fin 78) (11 : Fin 78) (7 : Fin 78)
    (32 : Fin 78) (1 : Fin 78) (71 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3440` (kalmanson). -/
theorem middleSource_h3440 :
    ((!((allOneRankAtom (sourceRanks P) 32 == allOneRankAtom (sourceRanks P) 1)) || ((allOneRankAtom (sourceRanks P) 71).ult (allOneRankAtom (sourceRanks P) 7)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (7 : Fin 78) (32 : Fin 78)
    (71 : Fin 78) (1 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (8 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (28 : Fin 78) (11 : Fin 78) (7 : Fin 78)
    (32 : Fin 78) (1 : Fin 78) (71 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3441` (kalmanson). -/
theorem middleSource_h3441 :
    ((!((allOneRankAtom (sourceRanks P) 7 == allOneRankAtom (sourceRanks P) 28)) || ((allOneRankAtom (sourceRanks P) 11).ult (allOneRankAtom (sourceRanks P) 32)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (32 : Fin 78) (7 : Fin 78)
    (11 : Fin 78) (28 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (8 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (28 : Fin 78) (11 : Fin 78) (7 : Fin 78)
    (32 : Fin 78) (1 : Fin 78) (71 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3442` (kalmanson). -/
theorem middleSource_h3442 :
    ((!((allOneRankAtom (sourceRanks P) 32 == allOneRankAtom (sourceRanks P) 11)) || ((allOneRankAtom (sourceRanks P) 28).ult (allOneRankAtom (sourceRanks P) 7)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (7 : Fin 78) (32 : Fin 78)
    (28 : Fin 78) (11 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (8 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (28 : Fin 78) (11 : Fin 78) (7 : Fin 78)
    (32 : Fin 78) (1 : Fin 78) (71 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3443` (kalmanson). -/
theorem middleSource_h3443 :
    ((!((allOneRankAtom (sourceRanks P) 32 == allOneRankAtom (sourceRanks P) 28)) || ((allOneRankAtom (sourceRanks P) 11).ult (allOneRankAtom (sourceRanks P) 7)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (7 : Fin 78) (32 : Fin 78)
    (11 : Fin 78) (28 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (8 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (28 : Fin 78) (11 : Fin 78) (7 : Fin 78)
    (32 : Fin 78) (1 : Fin 78) (71 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3444` (kalmanson). -/
theorem middleSource_h3444 :
    ((!((allOneRankAtom (sourceRanks P) 8 == allOneRankAtom (sourceRanks P) 1)) || ((allOneRankAtom (sourceRanks P) 72).ult (allOneRankAtom (sourceRanks P) 30)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (30 : Fin 78) (8 : Fin 78)
    (72 : Fin 78) (1 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (9 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (29 : Fin 78) (9 : Fin 78) (8 : Fin 78)
    (30 : Fin 78) (1 : Fin 78) (72 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3445` (kalmanson). -/
theorem middleSource_h3445 :
    ((!((allOneRankAtom (sourceRanks P) 8 == allOneRankAtom (sourceRanks P) 72)) || ((allOneRankAtom (sourceRanks P) 1).ult (allOneRankAtom (sourceRanks P) 30)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (30 : Fin 78) (8 : Fin 78)
    (1 : Fin 78) (72 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (9 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (29 : Fin 78) (9 : Fin 78) (8 : Fin 78)
    (30 : Fin 78) (1 : Fin 78) (72 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3446` (kalmanson). -/
theorem middleSource_h3446 :
    ((!((allOneRankAtom (sourceRanks P) 30 == allOneRankAtom (sourceRanks P) 1)) || ((allOneRankAtom (sourceRanks P) 72).ult (allOneRankAtom (sourceRanks P) 8)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (8 : Fin 78) (30 : Fin 78)
    (72 : Fin 78) (1 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (9 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (29 : Fin 78) (9 : Fin 78) (8 : Fin 78)
    (30 : Fin 78) (1 : Fin 78) (72 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3447` (kalmanson). -/
theorem middleSource_h3447 :
    ((!((allOneRankAtom (sourceRanks P) 30 == allOneRankAtom (sourceRanks P) 72)) || ((allOneRankAtom (sourceRanks P) 1).ult (allOneRankAtom (sourceRanks P) 8)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (8 : Fin 78) (30 : Fin 78)
    (1 : Fin 78) (72 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (9 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (29 : Fin 78) (9 : Fin 78) (8 : Fin 78)
    (30 : Fin 78) (1 : Fin 78) (72 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3448` (kalmanson). -/
theorem middleSource_h3448 :
    ((!((allOneRankAtom (sourceRanks P) 8 == allOneRankAtom (sourceRanks P) 29)) || ((allOneRankAtom (sourceRanks P) 9).ult (allOneRankAtom (sourceRanks P) 30)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (30 : Fin 78) (8 : Fin 78)
    (9 : Fin 78) (29 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (9 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (29 : Fin 78) (9 : Fin 78) (8 : Fin 78)
    (30 : Fin 78) (1 : Fin 78) (72 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3449` (kalmanson). -/
theorem middleSource_h3449 :
    ((!((allOneRankAtom (sourceRanks P) 30 == allOneRankAtom (sourceRanks P) 9)) || ((allOneRankAtom (sourceRanks P) 29).ult (allOneRankAtom (sourceRanks P) 8)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (8 : Fin 78) (30 : Fin 78)
    (29 : Fin 78) (9 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (9 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (29 : Fin 78) (9 : Fin 78) (8 : Fin 78)
    (30 : Fin 78) (1 : Fin 78) (72 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3450` (kalmanson). -/
theorem middleSource_h3450 :
    ((!((allOneRankAtom (sourceRanks P) 30 == allOneRankAtom (sourceRanks P) 29)) || ((allOneRankAtom (sourceRanks P) 9).ult (allOneRankAtom (sourceRanks P) 8)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (8 : Fin 78) (30 : Fin 78)
    (9 : Fin 78) (29 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (9 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (29 : Fin 78) (9 : Fin 78) (8 : Fin 78)
    (30 : Fin 78) (1 : Fin 78) (72 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3451` (kalmanson). -/
theorem middleSource_h3451 :
    ((!((allOneRankAtom (sourceRanks P) 8 == allOneRankAtom (sourceRanks P) 1)) || ((allOneRankAtom (sourceRanks P) 73).ult (allOneRankAtom (sourceRanks P) 31)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (31 : Fin 78) (8 : Fin 78)
    (73 : Fin 78) (1 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (9 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (29 : Fin 78) (10 : Fin 78) (8 : Fin 78)
    (31 : Fin 78) (1 : Fin 78) (73 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3452` (kalmanson). -/
theorem middleSource_h3452 :
    ((!((allOneRankAtom (sourceRanks P) 8 == allOneRankAtom (sourceRanks P) 73)) || ((allOneRankAtom (sourceRanks P) 1).ult (allOneRankAtom (sourceRanks P) 31)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (31 : Fin 78) (8 : Fin 78)
    (1 : Fin 78) (73 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (9 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (29 : Fin 78) (10 : Fin 78) (8 : Fin 78)
    (31 : Fin 78) (1 : Fin 78) (73 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3453` (kalmanson). -/
theorem middleSource_h3453 :
    ((!((allOneRankAtom (sourceRanks P) 31 == allOneRankAtom (sourceRanks P) 1)) || ((allOneRankAtom (sourceRanks P) 73).ult (allOneRankAtom (sourceRanks P) 8)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (8 : Fin 78) (31 : Fin 78)
    (73 : Fin 78) (1 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (9 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (29 : Fin 78) (10 : Fin 78) (8 : Fin 78)
    (31 : Fin 78) (1 : Fin 78) (73 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3454` (kalmanson). -/
theorem middleSource_h3454 :
    ((!((allOneRankAtom (sourceRanks P) 31 == allOneRankAtom (sourceRanks P) 73)) || ((allOneRankAtom (sourceRanks P) 1).ult (allOneRankAtom (sourceRanks P) 8)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (8 : Fin 78) (31 : Fin 78)
    (1 : Fin 78) (73 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (9 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (29 : Fin 78) (10 : Fin 78) (8 : Fin 78)
    (31 : Fin 78) (1 : Fin 78) (73 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3455` (kalmanson). -/
theorem middleSource_h3455 :
    ((!((allOneRankAtom (sourceRanks P) 8 == allOneRankAtom (sourceRanks P) 29)) || ((allOneRankAtom (sourceRanks P) 10).ult (allOneRankAtom (sourceRanks P) 31)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (31 : Fin 78) (8 : Fin 78)
    (10 : Fin 78) (29 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (9 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (29 : Fin 78) (10 : Fin 78) (8 : Fin 78)
    (31 : Fin 78) (1 : Fin 78) (73 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

end

end ATailExactFiveCard13AllOneSourceIngressScratch
end Problem97
