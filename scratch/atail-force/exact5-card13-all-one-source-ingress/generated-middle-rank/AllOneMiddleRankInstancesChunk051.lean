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

/-- Candidate middle source assertion `h3264` (kalmanson). -/
theorem middleSource_h3264 :
    ((!((allOneRankAtom (sourceRanks P) 28 == allOneRankAtom (sourceRanks P) 45)) || ((allOneRankAtom (sourceRanks P) 1).ult (allOneRankAtom (sourceRanks P) 3)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (3 : Fin 78) (28 : Fin 78)
    (1 : Fin 78) (45 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (4 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (24 : Fin 78) (7 : Fin 78) (3 : Fin 78)
    (28 : Fin 78) (1 : Fin 78) (45 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3265` (kalmanson). -/
theorem middleSource_h3265 :
    ((!((allOneRankAtom (sourceRanks P) 3 == allOneRankAtom (sourceRanks P) 7)) || ((allOneRankAtom (sourceRanks P) 24).ult (allOneRankAtom (sourceRanks P) 28)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (28 : Fin 78) (3 : Fin 78)
    (24 : Fin 78) (7 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (4 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (24 : Fin 78) (7 : Fin 78) (3 : Fin 78)
    (28 : Fin 78) (1 : Fin 78) (45 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3266` (kalmanson). -/
theorem middleSource_h3266 :
    ((!((allOneRankAtom (sourceRanks P) 3 == allOneRankAtom (sourceRanks P) 24)) || ((allOneRankAtom (sourceRanks P) 7).ult (allOneRankAtom (sourceRanks P) 28)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (28 : Fin 78) (3 : Fin 78)
    (7 : Fin 78) (24 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (4 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (24 : Fin 78) (7 : Fin 78) (3 : Fin 78)
    (28 : Fin 78) (1 : Fin 78) (45 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3267` (kalmanson). -/
theorem middleSource_h3267 :
    ((!((allOneRankAtom (sourceRanks P) 28 == allOneRankAtom (sourceRanks P) 7)) || ((allOneRankAtom (sourceRanks P) 24).ult (allOneRankAtom (sourceRanks P) 3)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (3 : Fin 78) (28 : Fin 78)
    (24 : Fin 78) (7 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (4 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (24 : Fin 78) (7 : Fin 78) (3 : Fin 78)
    (28 : Fin 78) (1 : Fin 78) (45 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3268` (kalmanson). -/
theorem middleSource_h3268 :
    ((!((allOneRankAtom (sourceRanks P) 28 == allOneRankAtom (sourceRanks P) 24)) || ((allOneRankAtom (sourceRanks P) 7).ult (allOneRankAtom (sourceRanks P) 3)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (3 : Fin 78) (28 : Fin 78)
    (7 : Fin 78) (24 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (4 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (24 : Fin 78) (7 : Fin 78) (3 : Fin 78)
    (28 : Fin 78) (1 : Fin 78) (45 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3269` (kalmanson). -/
theorem middleSource_h3269 :
    ((!((allOneRankAtom (sourceRanks P) 3 == allOneRankAtom (sourceRanks P) 46)) || ((allOneRankAtom (sourceRanks P) 1).ult (allOneRankAtom (sourceRanks P) 29)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (29 : Fin 78) (3 : Fin 78)
    (1 : Fin 78) (46 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (4 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (24 : Fin 78) (8 : Fin 78) (3 : Fin 78)
    (29 : Fin 78) (1 : Fin 78) (46 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3270` (kalmanson). -/
theorem middleSource_h3270 :
    ((!((allOneRankAtom (sourceRanks P) 29 == allOneRankAtom (sourceRanks P) 1)) || ((allOneRankAtom (sourceRanks P) 46).ult (allOneRankAtom (sourceRanks P) 3)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (3 : Fin 78) (29 : Fin 78)
    (46 : Fin 78) (1 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (4 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (24 : Fin 78) (8 : Fin 78) (3 : Fin 78)
    (29 : Fin 78) (1 : Fin 78) (46 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3271` (kalmanson). -/
theorem middleSource_h3271 :
    ((!((allOneRankAtom (sourceRanks P) 29 == allOneRankAtom (sourceRanks P) 46)) || ((allOneRankAtom (sourceRanks P) 1).ult (allOneRankAtom (sourceRanks P) 3)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (3 : Fin 78) (29 : Fin 78)
    (1 : Fin 78) (46 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (4 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (24 : Fin 78) (8 : Fin 78) (3 : Fin 78)
    (29 : Fin 78) (1 : Fin 78) (46 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3272` (kalmanson). -/
theorem middleSource_h3272 :
    ((!((allOneRankAtom (sourceRanks P) 3 == allOneRankAtom (sourceRanks P) 8)) || ((allOneRankAtom (sourceRanks P) 24).ult (allOneRankAtom (sourceRanks P) 29)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (29 : Fin 78) (3 : Fin 78)
    (24 : Fin 78) (8 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (4 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (24 : Fin 78) (8 : Fin 78) (3 : Fin 78)
    (29 : Fin 78) (1 : Fin 78) (46 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3273` (kalmanson). -/
theorem middleSource_h3273 :
    ((!((allOneRankAtom (sourceRanks P) 3 == allOneRankAtom (sourceRanks P) 24)) || ((allOneRankAtom (sourceRanks P) 8).ult (allOneRankAtom (sourceRanks P) 29)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (29 : Fin 78) (3 : Fin 78)
    (8 : Fin 78) (24 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (4 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (24 : Fin 78) (8 : Fin 78) (3 : Fin 78)
    (29 : Fin 78) (1 : Fin 78) (46 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3274` (kalmanson). -/
theorem middleSource_h3274 :
    ((!((allOneRankAtom (sourceRanks P) 29 == allOneRankAtom (sourceRanks P) 8)) || ((allOneRankAtom (sourceRanks P) 24).ult (allOneRankAtom (sourceRanks P) 3)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (3 : Fin 78) (29 : Fin 78)
    (24 : Fin 78) (8 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (4 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (24 : Fin 78) (8 : Fin 78) (3 : Fin 78)
    (29 : Fin 78) (1 : Fin 78) (46 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3275` (kalmanson). -/
theorem middleSource_h3275 :
    ((!((allOneRankAtom (sourceRanks P) 29 == allOneRankAtom (sourceRanks P) 24)) || ((allOneRankAtom (sourceRanks P) 8).ult (allOneRankAtom (sourceRanks P) 3)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (3 : Fin 78) (29 : Fin 78)
    (8 : Fin 78) (24 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (4 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (24 : Fin 78) (8 : Fin 78) (3 : Fin 78)
    (29 : Fin 78) (1 : Fin 78) (46 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3276` (kalmanson). -/
theorem middleSource_h3276 :
    ((!((allOneRankAtom (sourceRanks P) 3 == allOneRankAtom (sourceRanks P) 47)) || ((allOneRankAtom (sourceRanks P) 1).ult (allOneRankAtom (sourceRanks P) 30)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (30 : Fin 78) (3 : Fin 78)
    (1 : Fin 78) (47 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (4 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (24 : Fin 78) (9 : Fin 78) (3 : Fin 78)
    (30 : Fin 78) (1 : Fin 78) (47 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3277` (kalmanson). -/
theorem middleSource_h3277 :
    ((!((allOneRankAtom (sourceRanks P) 30 == allOneRankAtom (sourceRanks P) 1)) || ((allOneRankAtom (sourceRanks P) 47).ult (allOneRankAtom (sourceRanks P) 3)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (3 : Fin 78) (30 : Fin 78)
    (47 : Fin 78) (1 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (4 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (24 : Fin 78) (9 : Fin 78) (3 : Fin 78)
    (30 : Fin 78) (1 : Fin 78) (47 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3278` (kalmanson). -/
theorem middleSource_h3278 :
    ((!((allOneRankAtom (sourceRanks P) 30 == allOneRankAtom (sourceRanks P) 47)) || ((allOneRankAtom (sourceRanks P) 1).ult (allOneRankAtom (sourceRanks P) 3)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (3 : Fin 78) (30 : Fin 78)
    (1 : Fin 78) (47 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (4 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (24 : Fin 78) (9 : Fin 78) (3 : Fin 78)
    (30 : Fin 78) (1 : Fin 78) (47 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3279` (kalmanson). -/
theorem middleSource_h3279 :
    ((!((allOneRankAtom (sourceRanks P) 3 == allOneRankAtom (sourceRanks P) 9)) || ((allOneRankAtom (sourceRanks P) 24).ult (allOneRankAtom (sourceRanks P) 30)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (30 : Fin 78) (3 : Fin 78)
    (24 : Fin 78) (9 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (4 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (24 : Fin 78) (9 : Fin 78) (3 : Fin 78)
    (30 : Fin 78) (1 : Fin 78) (47 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3280` (kalmanson). -/
theorem middleSource_h3280 :
    ((!((allOneRankAtom (sourceRanks P) 3 == allOneRankAtom (sourceRanks P) 24)) || ((allOneRankAtom (sourceRanks P) 9).ult (allOneRankAtom (sourceRanks P) 30)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (30 : Fin 78) (3 : Fin 78)
    (9 : Fin 78) (24 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (4 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (24 : Fin 78) (9 : Fin 78) (3 : Fin 78)
    (30 : Fin 78) (1 : Fin 78) (47 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3281` (kalmanson). -/
theorem middleSource_h3281 :
    ((!((allOneRankAtom (sourceRanks P) 30 == allOneRankAtom (sourceRanks P) 9)) || ((allOneRankAtom (sourceRanks P) 24).ult (allOneRankAtom (sourceRanks P) 3)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (3 : Fin 78) (30 : Fin 78)
    (24 : Fin 78) (9 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (4 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (24 : Fin 78) (9 : Fin 78) (3 : Fin 78)
    (30 : Fin 78) (1 : Fin 78) (47 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3282` (kalmanson). -/
theorem middleSource_h3282 :
    ((!((allOneRankAtom (sourceRanks P) 30 == allOneRankAtom (sourceRanks P) 24)) || ((allOneRankAtom (sourceRanks P) 9).ult (allOneRankAtom (sourceRanks P) 3)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (3 : Fin 78) (30 : Fin 78)
    (9 : Fin 78) (24 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (4 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (24 : Fin 78) (9 : Fin 78) (3 : Fin 78)
    (30 : Fin 78) (1 : Fin 78) (47 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3283` (kalmanson). -/
theorem middleSource_h3283 :
    ((!((allOneRankAtom (sourceRanks P) 3 == allOneRankAtom (sourceRanks P) 48)) || ((allOneRankAtom (sourceRanks P) 1).ult (allOneRankAtom (sourceRanks P) 31)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (31 : Fin 78) (3 : Fin 78)
    (1 : Fin 78) (48 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (4 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (24 : Fin 78) (10 : Fin 78) (3 : Fin 78)
    (31 : Fin 78) (1 : Fin 78) (48 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3284` (kalmanson). -/
theorem middleSource_h3284 :
    ((!((allOneRankAtom (sourceRanks P) 31 == allOneRankAtom (sourceRanks P) 1)) || ((allOneRankAtom (sourceRanks P) 48).ult (allOneRankAtom (sourceRanks P) 3)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (3 : Fin 78) (31 : Fin 78)
    (48 : Fin 78) (1 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (4 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (24 : Fin 78) (10 : Fin 78) (3 : Fin 78)
    (31 : Fin 78) (1 : Fin 78) (48 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3285` (kalmanson). -/
theorem middleSource_h3285 :
    ((!((allOneRankAtom (sourceRanks P) 31 == allOneRankAtom (sourceRanks P) 48)) || ((allOneRankAtom (sourceRanks P) 1).ult (allOneRankAtom (sourceRanks P) 3)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (3 : Fin 78) (31 : Fin 78)
    (1 : Fin 78) (48 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (4 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (24 : Fin 78) (10 : Fin 78) (3 : Fin 78)
    (31 : Fin 78) (1 : Fin 78) (48 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3286` (kalmanson). -/
theorem middleSource_h3286 :
    ((!((allOneRankAtom (sourceRanks P) 3 == allOneRankAtom (sourceRanks P) 10)) || ((allOneRankAtom (sourceRanks P) 24).ult (allOneRankAtom (sourceRanks P) 31)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (31 : Fin 78) (3 : Fin 78)
    (24 : Fin 78) (10 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (4 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (24 : Fin 78) (10 : Fin 78) (3 : Fin 78)
    (31 : Fin 78) (1 : Fin 78) (48 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3287` (kalmanson). -/
theorem middleSource_h3287 :
    ((!((allOneRankAtom (sourceRanks P) 3 == allOneRankAtom (sourceRanks P) 24)) || ((allOneRankAtom (sourceRanks P) 10).ult (allOneRankAtom (sourceRanks P) 31)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (31 : Fin 78) (3 : Fin 78)
    (10 : Fin 78) (24 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (4 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (24 : Fin 78) (10 : Fin 78) (3 : Fin 78)
    (31 : Fin 78) (1 : Fin 78) (48 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3288` (kalmanson). -/
theorem middleSource_h3288 :
    ((!((allOneRankAtom (sourceRanks P) 31 == allOneRankAtom (sourceRanks P) 10)) || ((allOneRankAtom (sourceRanks P) 24).ult (allOneRankAtom (sourceRanks P) 3)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (3 : Fin 78) (31 : Fin 78)
    (24 : Fin 78) (10 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (4 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (24 : Fin 78) (10 : Fin 78) (3 : Fin 78)
    (31 : Fin 78) (1 : Fin 78) (48 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3289` (kalmanson). -/
theorem middleSource_h3289 :
    ((!((allOneRankAtom (sourceRanks P) 31 == allOneRankAtom (sourceRanks P) 24)) || ((allOneRankAtom (sourceRanks P) 10).ult (allOneRankAtom (sourceRanks P) 3)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (3 : Fin 78) (31 : Fin 78)
    (10 : Fin 78) (24 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (4 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (24 : Fin 78) (10 : Fin 78) (3 : Fin 78)
    (31 : Fin 78) (1 : Fin 78) (48 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3290` (kalmanson). -/
theorem middleSource_h3290 :
    ((!((allOneRankAtom (sourceRanks P) 3 == allOneRankAtom (sourceRanks P) 49)) || ((allOneRankAtom (sourceRanks P) 1).ult (allOneRankAtom (sourceRanks P) 32)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (32 : Fin 78) (3 : Fin 78)
    (1 : Fin 78) (49 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (4 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (24 : Fin 78) (11 : Fin 78) (3 : Fin 78)
    (32 : Fin 78) (1 : Fin 78) (49 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3291` (kalmanson). -/
theorem middleSource_h3291 :
    ((!((allOneRankAtom (sourceRanks P) 32 == allOneRankAtom (sourceRanks P) 1)) || ((allOneRankAtom (sourceRanks P) 49).ult (allOneRankAtom (sourceRanks P) 3)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (3 : Fin 78) (32 : Fin 78)
    (49 : Fin 78) (1 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (4 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (24 : Fin 78) (11 : Fin 78) (3 : Fin 78)
    (32 : Fin 78) (1 : Fin 78) (49 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3292` (kalmanson). -/
theorem middleSource_h3292 :
    ((!((allOneRankAtom (sourceRanks P) 32 == allOneRankAtom (sourceRanks P) 24)) || ((allOneRankAtom (sourceRanks P) 11).ult (allOneRankAtom (sourceRanks P) 3)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (3 : Fin 78) (32 : Fin 78)
    (11 : Fin 78) (24 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (4 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (24 : Fin 78) (11 : Fin 78) (3 : Fin 78)
    (32 : Fin 78) (1 : Fin 78) (49 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3293` (kalmanson). -/
theorem middleSource_h3293 :
    ((!((allOneRankAtom (sourceRanks P) 4 == allOneRankAtom (sourceRanks P) 1)) || ((allOneRankAtom (sourceRanks P) 50).ult (allOneRankAtom (sourceRanks P) 26)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (26 : Fin 78) (4 : Fin 78)
    (50 : Fin 78) (1 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (5 : Fin 13) (6 : Fin 13)
    (by decide) (by decide) (by decide)
    (25 : Fin 78) (5 : Fin 78) (4 : Fin 78)
    (26 : Fin 78) (1 : Fin 78) (50 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3294` (kalmanson). -/
theorem middleSource_h3294 :
    ((!((allOneRankAtom (sourceRanks P) 4 == allOneRankAtom (sourceRanks P) 50)) || ((allOneRankAtom (sourceRanks P) 1).ult (allOneRankAtom (sourceRanks P) 26)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (26 : Fin 78) (4 : Fin 78)
    (1 : Fin 78) (50 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (5 : Fin 13) (6 : Fin 13)
    (by decide) (by decide) (by decide)
    (25 : Fin 78) (5 : Fin 78) (4 : Fin 78)
    (26 : Fin 78) (1 : Fin 78) (50 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3295` (kalmanson). -/
theorem middleSource_h3295 :
    ((!((allOneRankAtom (sourceRanks P) 26 == allOneRankAtom (sourceRanks P) 1)) || ((allOneRankAtom (sourceRanks P) 50).ult (allOneRankAtom (sourceRanks P) 4)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (4 : Fin 78) (26 : Fin 78)
    (50 : Fin 78) (1 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (5 : Fin 13) (6 : Fin 13)
    (by decide) (by decide) (by decide)
    (25 : Fin 78) (5 : Fin 78) (4 : Fin 78)
    (26 : Fin 78) (1 : Fin 78) (50 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3296` (kalmanson). -/
theorem middleSource_h3296 :
    ((!((allOneRankAtom (sourceRanks P) 26 == allOneRankAtom (sourceRanks P) 50)) || ((allOneRankAtom (sourceRanks P) 1).ult (allOneRankAtom (sourceRanks P) 4)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (4 : Fin 78) (26 : Fin 78)
    (1 : Fin 78) (50 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (5 : Fin 13) (6 : Fin 13)
    (by decide) (by decide) (by decide)
    (25 : Fin 78) (5 : Fin 78) (4 : Fin 78)
    (26 : Fin 78) (1 : Fin 78) (50 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3297` (kalmanson). -/
theorem middleSource_h3297 :
    ((!((allOneRankAtom (sourceRanks P) 4 == allOneRankAtom (sourceRanks P) 5)) || ((allOneRankAtom (sourceRanks P) 25).ult (allOneRankAtom (sourceRanks P) 26)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (26 : Fin 78) (4 : Fin 78)
    (25 : Fin 78) (5 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (5 : Fin 13) (6 : Fin 13)
    (by decide) (by decide) (by decide)
    (25 : Fin 78) (5 : Fin 78) (4 : Fin 78)
    (26 : Fin 78) (1 : Fin 78) (50 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3298` (kalmanson). -/
theorem middleSource_h3298 :
    ((!((allOneRankAtom (sourceRanks P) 4 == allOneRankAtom (sourceRanks P) 25)) || ((allOneRankAtom (sourceRanks P) 5).ult (allOneRankAtom (sourceRanks P) 26)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (26 : Fin 78) (4 : Fin 78)
    (5 : Fin 78) (25 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (5 : Fin 13) (6 : Fin 13)
    (by decide) (by decide) (by decide)
    (25 : Fin 78) (5 : Fin 78) (4 : Fin 78)
    (26 : Fin 78) (1 : Fin 78) (50 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3299` (kalmanson). -/
theorem middleSource_h3299 :
    ((!((allOneRankAtom (sourceRanks P) 26 == allOneRankAtom (sourceRanks P) 5)) || ((allOneRankAtom (sourceRanks P) 25).ult (allOneRankAtom (sourceRanks P) 4)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (4 : Fin 78) (26 : Fin 78)
    (25 : Fin 78) (5 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (5 : Fin 13) (6 : Fin 13)
    (by decide) (by decide) (by decide)
    (25 : Fin 78) (5 : Fin 78) (4 : Fin 78)
    (26 : Fin 78) (1 : Fin 78) (50 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3300` (kalmanson). -/
theorem middleSource_h3300 :
    ((!((allOneRankAtom (sourceRanks P) 26 == allOneRankAtom (sourceRanks P) 25)) || ((allOneRankAtom (sourceRanks P) 5).ult (allOneRankAtom (sourceRanks P) 4)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (4 : Fin 78) (26 : Fin 78)
    (5 : Fin 78) (25 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (5 : Fin 13) (6 : Fin 13)
    (by decide) (by decide) (by decide)
    (25 : Fin 78) (5 : Fin 78) (4 : Fin 78)
    (26 : Fin 78) (1 : Fin 78) (50 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3301` (kalmanson). -/
theorem middleSource_h3301 :
    ((!((allOneRankAtom (sourceRanks P) 4 == allOneRankAtom (sourceRanks P) 1)) || ((allOneRankAtom (sourceRanks P) 51).ult (allOneRankAtom (sourceRanks P) 27)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (27 : Fin 78) (4 : Fin 78)
    (51 : Fin 78) (1 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (5 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (25 : Fin 78) (6 : Fin 78) (4 : Fin 78)
    (27 : Fin 78) (1 : Fin 78) (51 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3302` (kalmanson). -/
theorem middleSource_h3302 :
    ((!((allOneRankAtom (sourceRanks P) 4 == allOneRankAtom (sourceRanks P) 51)) || ((allOneRankAtom (sourceRanks P) 1).ult (allOneRankAtom (sourceRanks P) 27)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (27 : Fin 78) (4 : Fin 78)
    (1 : Fin 78) (51 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (5 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (25 : Fin 78) (6 : Fin 78) (4 : Fin 78)
    (27 : Fin 78) (1 : Fin 78) (51 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3303` (kalmanson). -/
theorem middleSource_h3303 :
    ((!((allOneRankAtom (sourceRanks P) 27 == allOneRankAtom (sourceRanks P) 1)) || ((allOneRankAtom (sourceRanks P) 51).ult (allOneRankAtom (sourceRanks P) 4)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (4 : Fin 78) (27 : Fin 78)
    (51 : Fin 78) (1 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (5 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (25 : Fin 78) (6 : Fin 78) (4 : Fin 78)
    (27 : Fin 78) (1 : Fin 78) (51 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3304` (kalmanson). -/
theorem middleSource_h3304 :
    ((!((allOneRankAtom (sourceRanks P) 4 == allOneRankAtom (sourceRanks P) 6)) || ((allOneRankAtom (sourceRanks P) 25).ult (allOneRankAtom (sourceRanks P) 27)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (27 : Fin 78) (4 : Fin 78)
    (25 : Fin 78) (6 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (5 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (25 : Fin 78) (6 : Fin 78) (4 : Fin 78)
    (27 : Fin 78) (1 : Fin 78) (51 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3305` (kalmanson). -/
theorem middleSource_h3305 :
    ((!((allOneRankAtom (sourceRanks P) 4 == allOneRankAtom (sourceRanks P) 25)) || ((allOneRankAtom (sourceRanks P) 6).ult (allOneRankAtom (sourceRanks P) 27)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (27 : Fin 78) (4 : Fin 78)
    (6 : Fin 78) (25 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (5 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (25 : Fin 78) (6 : Fin 78) (4 : Fin 78)
    (27 : Fin 78) (1 : Fin 78) (51 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3306` (kalmanson). -/
theorem middleSource_h3306 :
    ((!((allOneRankAtom (sourceRanks P) 27 == allOneRankAtom (sourceRanks P) 6)) || ((allOneRankAtom (sourceRanks P) 25).ult (allOneRankAtom (sourceRanks P) 4)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (4 : Fin 78) (27 : Fin 78)
    (25 : Fin 78) (6 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (5 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (25 : Fin 78) (6 : Fin 78) (4 : Fin 78)
    (27 : Fin 78) (1 : Fin 78) (51 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3307` (kalmanson). -/
theorem middleSource_h3307 :
    ((!((allOneRankAtom (sourceRanks P) 27 == allOneRankAtom (sourceRanks P) 25)) || ((allOneRankAtom (sourceRanks P) 6).ult (allOneRankAtom (sourceRanks P) 4)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (4 : Fin 78) (27 : Fin 78)
    (6 : Fin 78) (25 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (5 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (25 : Fin 78) (6 : Fin 78) (4 : Fin 78)
    (27 : Fin 78) (1 : Fin 78) (51 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3308` (kalmanson). -/
theorem middleSource_h3308 :
    ((!((allOneRankAtom (sourceRanks P) 4 == allOneRankAtom (sourceRanks P) 1)) || ((allOneRankAtom (sourceRanks P) 52).ult (allOneRankAtom (sourceRanks P) 28)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (28 : Fin 78) (4 : Fin 78)
    (52 : Fin 78) (1 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (5 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (25 : Fin 78) (7 : Fin 78) (4 : Fin 78)
    (28 : Fin 78) (1 : Fin 78) (52 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3309` (kalmanson). -/
theorem middleSource_h3309 :
    ((!((allOneRankAtom (sourceRanks P) 4 == allOneRankAtom (sourceRanks P) 52)) || ((allOneRankAtom (sourceRanks P) 1).ult (allOneRankAtom (sourceRanks P) 28)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (28 : Fin 78) (4 : Fin 78)
    (1 : Fin 78) (52 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (5 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (25 : Fin 78) (7 : Fin 78) (4 : Fin 78)
    (28 : Fin 78) (1 : Fin 78) (52 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3310` (kalmanson). -/
theorem middleSource_h3310 :
    ((!((allOneRankAtom (sourceRanks P) 28 == allOneRankAtom (sourceRanks P) 1)) || ((allOneRankAtom (sourceRanks P) 52).ult (allOneRankAtom (sourceRanks P) 4)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (4 : Fin 78) (28 : Fin 78)
    (52 : Fin 78) (1 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (5 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (25 : Fin 78) (7 : Fin 78) (4 : Fin 78)
    (28 : Fin 78) (1 : Fin 78) (52 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3311` (kalmanson). -/
theorem middleSource_h3311 :
    ((!((allOneRankAtom (sourceRanks P) 28 == allOneRankAtom (sourceRanks P) 52)) || ((allOneRankAtom (sourceRanks P) 1).ult (allOneRankAtom (sourceRanks P) 4)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (4 : Fin 78) (28 : Fin 78)
    (1 : Fin 78) (52 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (5 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (25 : Fin 78) (7 : Fin 78) (4 : Fin 78)
    (28 : Fin 78) (1 : Fin 78) (52 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3312` (kalmanson). -/
theorem middleSource_h3312 :
    ((!((allOneRankAtom (sourceRanks P) 4 == allOneRankAtom (sourceRanks P) 7)) || ((allOneRankAtom (sourceRanks P) 25).ult (allOneRankAtom (sourceRanks P) 28)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (28 : Fin 78) (4 : Fin 78)
    (25 : Fin 78) (7 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (5 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (25 : Fin 78) (7 : Fin 78) (4 : Fin 78)
    (28 : Fin 78) (1 : Fin 78) (52 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3313` (kalmanson). -/
theorem middleSource_h3313 :
    ((!((allOneRankAtom (sourceRanks P) 4 == allOneRankAtom (sourceRanks P) 25)) || ((allOneRankAtom (sourceRanks P) 7).ult (allOneRankAtom (sourceRanks P) 28)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (28 : Fin 78) (4 : Fin 78)
    (7 : Fin 78) (25 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (5 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (25 : Fin 78) (7 : Fin 78) (4 : Fin 78)
    (28 : Fin 78) (1 : Fin 78) (52 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3314` (kalmanson). -/
theorem middleSource_h3314 :
    ((!((allOneRankAtom (sourceRanks P) 28 == allOneRankAtom (sourceRanks P) 7)) || ((allOneRankAtom (sourceRanks P) 25).ult (allOneRankAtom (sourceRanks P) 4)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (4 : Fin 78) (28 : Fin 78)
    (25 : Fin 78) (7 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (5 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (25 : Fin 78) (7 : Fin 78) (4 : Fin 78)
    (28 : Fin 78) (1 : Fin 78) (52 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3315` (kalmanson). -/
theorem middleSource_h3315 :
    ((!((allOneRankAtom (sourceRanks P) 28 == allOneRankAtom (sourceRanks P) 25)) || ((allOneRankAtom (sourceRanks P) 7).ult (allOneRankAtom (sourceRanks P) 4)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (4 : Fin 78) (28 : Fin 78)
    (7 : Fin 78) (25 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (5 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (25 : Fin 78) (7 : Fin 78) (4 : Fin 78)
    (28 : Fin 78) (1 : Fin 78) (52 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3316` (kalmanson). -/
theorem middleSource_h3316 :
    ((!((allOneRankAtom (sourceRanks P) 4 == allOneRankAtom (sourceRanks P) 1)) || ((allOneRankAtom (sourceRanks P) 53).ult (allOneRankAtom (sourceRanks P) 29)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (29 : Fin 78) (4 : Fin 78)
    (53 : Fin 78) (1 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (5 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (25 : Fin 78) (8 : Fin 78) (4 : Fin 78)
    (29 : Fin 78) (1 : Fin 78) (53 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3317` (kalmanson). -/
theorem middleSource_h3317 :
    ((!((allOneRankAtom (sourceRanks P) 4 == allOneRankAtom (sourceRanks P) 53)) || ((allOneRankAtom (sourceRanks P) 1).ult (allOneRankAtom (sourceRanks P) 29)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (29 : Fin 78) (4 : Fin 78)
    (1 : Fin 78) (53 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (5 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (25 : Fin 78) (8 : Fin 78) (4 : Fin 78)
    (29 : Fin 78) (1 : Fin 78) (53 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3318` (kalmanson). -/
theorem middleSource_h3318 :
    ((!((allOneRankAtom (sourceRanks P) 29 == allOneRankAtom (sourceRanks P) 1)) || ((allOneRankAtom (sourceRanks P) 53).ult (allOneRankAtom (sourceRanks P) 4)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (4 : Fin 78) (29 : Fin 78)
    (53 : Fin 78) (1 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (5 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (25 : Fin 78) (8 : Fin 78) (4 : Fin 78)
    (29 : Fin 78) (1 : Fin 78) (53 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3319` (kalmanson). -/
theorem middleSource_h3319 :
    ((!((allOneRankAtom (sourceRanks P) 29 == allOneRankAtom (sourceRanks P) 53)) || ((allOneRankAtom (sourceRanks P) 1).ult (allOneRankAtom (sourceRanks P) 4)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (4 : Fin 78) (29 : Fin 78)
    (1 : Fin 78) (53 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (5 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (25 : Fin 78) (8 : Fin 78) (4 : Fin 78)
    (29 : Fin 78) (1 : Fin 78) (53 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3320` (kalmanson). -/
theorem middleSource_h3320 :
    ((!((allOneRankAtom (sourceRanks P) 4 == allOneRankAtom (sourceRanks P) 8)) || ((allOneRankAtom (sourceRanks P) 25).ult (allOneRankAtom (sourceRanks P) 29)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (29 : Fin 78) (4 : Fin 78)
    (25 : Fin 78) (8 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (5 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (25 : Fin 78) (8 : Fin 78) (4 : Fin 78)
    (29 : Fin 78) (1 : Fin 78) (53 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3321` (kalmanson). -/
theorem middleSource_h3321 :
    ((!((allOneRankAtom (sourceRanks P) 4 == allOneRankAtom (sourceRanks P) 25)) || ((allOneRankAtom (sourceRanks P) 8).ult (allOneRankAtom (sourceRanks P) 29)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (29 : Fin 78) (4 : Fin 78)
    (8 : Fin 78) (25 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (5 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (25 : Fin 78) (8 : Fin 78) (4 : Fin 78)
    (29 : Fin 78) (1 : Fin 78) (53 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3322` (kalmanson). -/
theorem middleSource_h3322 :
    ((!((allOneRankAtom (sourceRanks P) 29 == allOneRankAtom (sourceRanks P) 8)) || ((allOneRankAtom (sourceRanks P) 25).ult (allOneRankAtom (sourceRanks P) 4)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (4 : Fin 78) (29 : Fin 78)
    (25 : Fin 78) (8 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (5 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (25 : Fin 78) (8 : Fin 78) (4 : Fin 78)
    (29 : Fin 78) (1 : Fin 78) (53 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3323` (kalmanson). -/
theorem middleSource_h3323 :
    ((!((allOneRankAtom (sourceRanks P) 29 == allOneRankAtom (sourceRanks P) 25)) || ((allOneRankAtom (sourceRanks P) 8).ult (allOneRankAtom (sourceRanks P) 4)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (4 : Fin 78) (29 : Fin 78)
    (8 : Fin 78) (25 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (5 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (25 : Fin 78) (8 : Fin 78) (4 : Fin 78)
    (29 : Fin 78) (1 : Fin 78) (53 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3324` (kalmanson). -/
theorem middleSource_h3324 :
    ((!((allOneRankAtom (sourceRanks P) 4 == allOneRankAtom (sourceRanks P) 1)) || ((allOneRankAtom (sourceRanks P) 54).ult (allOneRankAtom (sourceRanks P) 30)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (30 : Fin 78) (4 : Fin 78)
    (54 : Fin 78) (1 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (5 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (25 : Fin 78) (9 : Fin 78) (4 : Fin 78)
    (30 : Fin 78) (1 : Fin 78) (54 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3325` (kalmanson). -/
theorem middleSource_h3325 :
    ((!((allOneRankAtom (sourceRanks P) 4 == allOneRankAtom (sourceRanks P) 54)) || ((allOneRankAtom (sourceRanks P) 1).ult (allOneRankAtom (sourceRanks P) 30)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (30 : Fin 78) (4 : Fin 78)
    (1 : Fin 78) (54 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (5 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (25 : Fin 78) (9 : Fin 78) (4 : Fin 78)
    (30 : Fin 78) (1 : Fin 78) (54 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3326` (kalmanson). -/
theorem middleSource_h3326 :
    ((!((allOneRankAtom (sourceRanks P) 30 == allOneRankAtom (sourceRanks P) 1)) || ((allOneRankAtom (sourceRanks P) 54).ult (allOneRankAtom (sourceRanks P) 4)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (4 : Fin 78) (30 : Fin 78)
    (54 : Fin 78) (1 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (5 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (25 : Fin 78) (9 : Fin 78) (4 : Fin 78)
    (30 : Fin 78) (1 : Fin 78) (54 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3327` (kalmanson). -/
theorem middleSource_h3327 :
    ((!((allOneRankAtom (sourceRanks P) 30 == allOneRankAtom (sourceRanks P) 54)) || ((allOneRankAtom (sourceRanks P) 1).ult (allOneRankAtom (sourceRanks P) 4)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (4 : Fin 78) (30 : Fin 78)
    (1 : Fin 78) (54 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (5 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (25 : Fin 78) (9 : Fin 78) (4 : Fin 78)
    (30 : Fin 78) (1 : Fin 78) (54 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

end

end ATailExactFiveCard13AllOneSourceIngressScratch
end Problem97
