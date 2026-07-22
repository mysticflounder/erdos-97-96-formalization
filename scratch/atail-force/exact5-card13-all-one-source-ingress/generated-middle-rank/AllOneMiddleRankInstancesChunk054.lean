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

/-- Candidate middle source assertion `h3456` (kalmanson). -/
theorem middleSource_h3456 :
    ((!((allOneRankAtom (sourceRanks P) 31 == allOneRankAtom (sourceRanks P) 10)) || ((allOneRankAtom (sourceRanks P) 29).ult (allOneRankAtom (sourceRanks P) 8)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (8 : Fin 78) (31 : Fin 78)
    (29 : Fin 78) (10 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (9 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (29 : Fin 78) (10 : Fin 78) (8 : Fin 78)
    (31 : Fin 78) (1 : Fin 78) (73 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3457` (kalmanson). -/
theorem middleSource_h3457 :
    ((!((allOneRankAtom (sourceRanks P) 31 == allOneRankAtom (sourceRanks P) 29)) || ((allOneRankAtom (sourceRanks P) 10).ult (allOneRankAtom (sourceRanks P) 8)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (8 : Fin 78) (31 : Fin 78)
    (10 : Fin 78) (29 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (9 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (29 : Fin 78) (10 : Fin 78) (8 : Fin 78)
    (31 : Fin 78) (1 : Fin 78) (73 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3458` (kalmanson). -/
theorem middleSource_h3458 :
    ((!((allOneRankAtom (sourceRanks P) 8 == allOneRankAtom (sourceRanks P) 1)) || ((allOneRankAtom (sourceRanks P) 74).ult (allOneRankAtom (sourceRanks P) 32)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (32 : Fin 78) (8 : Fin 78)
    (74 : Fin 78) (1 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (9 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (29 : Fin 78) (11 : Fin 78) (8 : Fin 78)
    (32 : Fin 78) (1 : Fin 78) (74 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3459` (kalmanson). -/
theorem middleSource_h3459 :
    ((!((allOneRankAtom (sourceRanks P) 8 == allOneRankAtom (sourceRanks P) 74)) || ((allOneRankAtom (sourceRanks P) 1).ult (allOneRankAtom (sourceRanks P) 32)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (32 : Fin 78) (8 : Fin 78)
    (1 : Fin 78) (74 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (9 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (29 : Fin 78) (11 : Fin 78) (8 : Fin 78)
    (32 : Fin 78) (1 : Fin 78) (74 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3460` (kalmanson). -/
theorem middleSource_h3460 :
    ((!((allOneRankAtom (sourceRanks P) 32 == allOneRankAtom (sourceRanks P) 1)) || ((allOneRankAtom (sourceRanks P) 74).ult (allOneRankAtom (sourceRanks P) 8)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (8 : Fin 78) (32 : Fin 78)
    (74 : Fin 78) (1 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (9 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (29 : Fin 78) (11 : Fin 78) (8 : Fin 78)
    (32 : Fin 78) (1 : Fin 78) (74 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3461` (kalmanson). -/
theorem middleSource_h3461 :
    ((!((allOneRankAtom (sourceRanks P) 8 == allOneRankAtom (sourceRanks P) 11)) || ((allOneRankAtom (sourceRanks P) 29).ult (allOneRankAtom (sourceRanks P) 32)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (32 : Fin 78) (8 : Fin 78)
    (29 : Fin 78) (11 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (9 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (29 : Fin 78) (11 : Fin 78) (8 : Fin 78)
    (32 : Fin 78) (1 : Fin 78) (74 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3462` (kalmanson). -/
theorem middleSource_h3462 :
    ((!((allOneRankAtom (sourceRanks P) 8 == allOneRankAtom (sourceRanks P) 29)) || ((allOneRankAtom (sourceRanks P) 11).ult (allOneRankAtom (sourceRanks P) 32)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (32 : Fin 78) (8 : Fin 78)
    (11 : Fin 78) (29 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (9 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (29 : Fin 78) (11 : Fin 78) (8 : Fin 78)
    (32 : Fin 78) (1 : Fin 78) (74 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3463` (kalmanson). -/
theorem middleSource_h3463 :
    ((!((allOneRankAtom (sourceRanks P) 32 == allOneRankAtom (sourceRanks P) 29)) || ((allOneRankAtom (sourceRanks P) 11).ult (allOneRankAtom (sourceRanks P) 8)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (8 : Fin 78) (32 : Fin 78)
    (11 : Fin 78) (29 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (9 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (29 : Fin 78) (11 : Fin 78) (8 : Fin 78)
    (32 : Fin 78) (1 : Fin 78) (74 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3464` (kalmanson). -/
theorem middleSource_h3464 :
    ((!((allOneRankAtom (sourceRanks P) 9 == allOneRankAtom (sourceRanks P) 1)) || ((allOneRankAtom (sourceRanks P) 75).ult (allOneRankAtom (sourceRanks P) 31)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (31 : Fin 78) (9 : Fin 78)
    (75 : Fin 78) (1 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (10 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (30 : Fin 78) (10 : Fin 78) (9 : Fin 78)
    (31 : Fin 78) (1 : Fin 78) (75 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3465` (kalmanson). -/
theorem middleSource_h3465 :
    ((!((allOneRankAtom (sourceRanks P) 9 == allOneRankAtom (sourceRanks P) 75)) || ((allOneRankAtom (sourceRanks P) 1).ult (allOneRankAtom (sourceRanks P) 31)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (31 : Fin 78) (9 : Fin 78)
    (1 : Fin 78) (75 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (10 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (30 : Fin 78) (10 : Fin 78) (9 : Fin 78)
    (31 : Fin 78) (1 : Fin 78) (75 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3466` (kalmanson). -/
theorem middleSource_h3466 :
    ((!((allOneRankAtom (sourceRanks P) 31 == allOneRankAtom (sourceRanks P) 1)) || ((allOneRankAtom (sourceRanks P) 75).ult (allOneRankAtom (sourceRanks P) 9)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (9 : Fin 78) (31 : Fin 78)
    (75 : Fin 78) (1 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (10 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (30 : Fin 78) (10 : Fin 78) (9 : Fin 78)
    (31 : Fin 78) (1 : Fin 78) (75 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3467` (kalmanson). -/
theorem middleSource_h3467 :
    ((!((allOneRankAtom (sourceRanks P) 31 == allOneRankAtom (sourceRanks P) 75)) || ((allOneRankAtom (sourceRanks P) 1).ult (allOneRankAtom (sourceRanks P) 9)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (9 : Fin 78) (31 : Fin 78)
    (1 : Fin 78) (75 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (10 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (30 : Fin 78) (10 : Fin 78) (9 : Fin 78)
    (31 : Fin 78) (1 : Fin 78) (75 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3468` (kalmanson). -/
theorem middleSource_h3468 :
    ((!((allOneRankAtom (sourceRanks P) 9 == allOneRankAtom (sourceRanks P) 30)) || ((allOneRankAtom (sourceRanks P) 10).ult (allOneRankAtom (sourceRanks P) 31)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (31 : Fin 78) (9 : Fin 78)
    (10 : Fin 78) (30 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (10 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (30 : Fin 78) (10 : Fin 78) (9 : Fin 78)
    (31 : Fin 78) (1 : Fin 78) (75 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3469` (kalmanson). -/
theorem middleSource_h3469 :
    ((!((allOneRankAtom (sourceRanks P) 31 == allOneRankAtom (sourceRanks P) 10)) || ((allOneRankAtom (sourceRanks P) 30).ult (allOneRankAtom (sourceRanks P) 9)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (9 : Fin 78) (31 : Fin 78)
    (30 : Fin 78) (10 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (10 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (30 : Fin 78) (10 : Fin 78) (9 : Fin 78)
    (31 : Fin 78) (1 : Fin 78) (75 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3470` (kalmanson). -/
theorem middleSource_h3470 :
    ((!((allOneRankAtom (sourceRanks P) 31 == allOneRankAtom (sourceRanks P) 30)) || ((allOneRankAtom (sourceRanks P) 10).ult (allOneRankAtom (sourceRanks P) 9)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (9 : Fin 78) (31 : Fin 78)
    (10 : Fin 78) (30 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (10 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (30 : Fin 78) (10 : Fin 78) (9 : Fin 78)
    (31 : Fin 78) (1 : Fin 78) (75 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3471` (kalmanson). -/
theorem middleSource_h3471 :
    ((!((allOneRankAtom (sourceRanks P) 9 == allOneRankAtom (sourceRanks P) 1)) || ((allOneRankAtom (sourceRanks P) 76).ult (allOneRankAtom (sourceRanks P) 32)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (32 : Fin 78) (9 : Fin 78)
    (76 : Fin 78) (1 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (10 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (30 : Fin 78) (11 : Fin 78) (9 : Fin 78)
    (32 : Fin 78) (1 : Fin 78) (76 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3472` (kalmanson). -/
theorem middleSource_h3472 :
    ((!((allOneRankAtom (sourceRanks P) 9 == allOneRankAtom (sourceRanks P) 76)) || ((allOneRankAtom (sourceRanks P) 1).ult (allOneRankAtom (sourceRanks P) 32)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (32 : Fin 78) (9 : Fin 78)
    (1 : Fin 78) (76 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (10 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (30 : Fin 78) (11 : Fin 78) (9 : Fin 78)
    (32 : Fin 78) (1 : Fin 78) (76 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3473` (kalmanson). -/
theorem middleSource_h3473 :
    ((!((allOneRankAtom (sourceRanks P) 32 == allOneRankAtom (sourceRanks P) 1)) || ((allOneRankAtom (sourceRanks P) 76).ult (allOneRankAtom (sourceRanks P) 9)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (9 : Fin 78) (32 : Fin 78)
    (76 : Fin 78) (1 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (10 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (30 : Fin 78) (11 : Fin 78) (9 : Fin 78)
    (32 : Fin 78) (1 : Fin 78) (76 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3474` (kalmanson). -/
theorem middleSource_h3474 :
    ((!((allOneRankAtom (sourceRanks P) 9 == allOneRankAtom (sourceRanks P) 30)) || ((allOneRankAtom (sourceRanks P) 11).ult (allOneRankAtom (sourceRanks P) 32)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (32 : Fin 78) (9 : Fin 78)
    (11 : Fin 78) (30 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (10 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (30 : Fin 78) (11 : Fin 78) (9 : Fin 78)
    (32 : Fin 78) (1 : Fin 78) (76 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3475` (kalmanson). -/
theorem middleSource_h3475 :
    ((!((allOneRankAtom (sourceRanks P) 32 == allOneRankAtom (sourceRanks P) 30)) || ((allOneRankAtom (sourceRanks P) 11).ult (allOneRankAtom (sourceRanks P) 9)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (9 : Fin 78) (32 : Fin 78)
    (11 : Fin 78) (30 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (10 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (30 : Fin 78) (11 : Fin 78) (9 : Fin 78)
    (32 : Fin 78) (1 : Fin 78) (76 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3476` (kalmanson). -/
theorem middleSource_h3476 :
    ((!((allOneRankAtom (sourceRanks P) 10 == allOneRankAtom (sourceRanks P) 1)) || ((allOneRankAtom (sourceRanks P) 77).ult (allOneRankAtom (sourceRanks P) 32)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (32 : Fin 78) (10 : Fin 78)
    (77 : Fin 78) (1 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (11 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (31 : Fin 78) (11 : Fin 78) (10 : Fin 78)
    (32 : Fin 78) (1 : Fin 78) (77 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3477` (kalmanson). -/
theorem middleSource_h3477 :
    ((!((allOneRankAtom (sourceRanks P) 10 == allOneRankAtom (sourceRanks P) 77)) || ((allOneRankAtom (sourceRanks P) 1).ult (allOneRankAtom (sourceRanks P) 32)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (32 : Fin 78) (10 : Fin 78)
    (1 : Fin 78) (77 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (11 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (31 : Fin 78) (11 : Fin 78) (10 : Fin 78)
    (32 : Fin 78) (1 : Fin 78) (77 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3478` (kalmanson). -/
theorem middleSource_h3478 :
    ((!((allOneRankAtom (sourceRanks P) 32 == allOneRankAtom (sourceRanks P) 1)) || ((allOneRankAtom (sourceRanks P) 77).ult (allOneRankAtom (sourceRanks P) 10)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (10 : Fin 78) (32 : Fin 78)
    (77 : Fin 78) (1 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (11 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (31 : Fin 78) (11 : Fin 78) (10 : Fin 78)
    (32 : Fin 78) (1 : Fin 78) (77 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3479` (kalmanson). -/
theorem middleSource_h3479 :
    ((!((allOneRankAtom (sourceRanks P) 10 == allOneRankAtom (sourceRanks P) 31)) || ((allOneRankAtom (sourceRanks P) 11).ult (allOneRankAtom (sourceRanks P) 32)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (32 : Fin 78) (10 : Fin 78)
    (11 : Fin 78) (31 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (11 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (31 : Fin 78) (11 : Fin 78) (10 : Fin 78)
    (32 : Fin 78) (1 : Fin 78) (77 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3480` (kalmanson). -/
theorem middleSource_h3480 :
    ((!((allOneRankAtom (sourceRanks P) 32 == allOneRankAtom (sourceRanks P) 31)) || ((allOneRankAtom (sourceRanks P) 11).ult (allOneRankAtom (sourceRanks P) 10)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (10 : Fin 78) (32 : Fin 78)
    (11 : Fin 78) (31 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (11 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (31 : Fin 78) (11 : Fin 78) (10 : Fin 78)
    (32 : Fin 78) (1 : Fin 78) (77 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3481` (kalmanson). -/
theorem middleSource_h3481 :
    ((!((allOneRankAtom (sourceRanks P) 3 == allOneRankAtom (sourceRanks P) 2)) || ((allOneRankAtom (sourceRanks P) 42).ult (allOneRankAtom (sourceRanks P) 34)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (34 : Fin 78) (3 : Fin 78)
    (42 : Fin 78) (2 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (4 : Fin 13) (5 : Fin 13)
    (by decide) (by decide) (by decide)
    (33 : Fin 78) (4 : Fin 78) (3 : Fin 78)
    (34 : Fin 78) (2 : Fin 78) (42 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3482` (kalmanson). -/
theorem middleSource_h3482 :
    ((!((allOneRankAtom (sourceRanks P) 3 == allOneRankAtom (sourceRanks P) 42)) || ((allOneRankAtom (sourceRanks P) 2).ult (allOneRankAtom (sourceRanks P) 34)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (34 : Fin 78) (3 : Fin 78)
    (2 : Fin 78) (42 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (4 : Fin 13) (5 : Fin 13)
    (by decide) (by decide) (by decide)
    (33 : Fin 78) (4 : Fin 78) (3 : Fin 78)
    (34 : Fin 78) (2 : Fin 78) (42 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3483` (kalmanson). -/
theorem middleSource_h3483 :
    ((!((allOneRankAtom (sourceRanks P) 34 == allOneRankAtom (sourceRanks P) 2)) || ((allOneRankAtom (sourceRanks P) 42).ult (allOneRankAtom (sourceRanks P) 3)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (3 : Fin 78) (34 : Fin 78)
    (42 : Fin 78) (2 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (4 : Fin 13) (5 : Fin 13)
    (by decide) (by decide) (by decide)
    (33 : Fin 78) (4 : Fin 78) (3 : Fin 78)
    (34 : Fin 78) (2 : Fin 78) (42 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3484` (kalmanson). -/
theorem middleSource_h3484 :
    ((!((allOneRankAtom (sourceRanks P) 34 == allOneRankAtom (sourceRanks P) 42)) || ((allOneRankAtom (sourceRanks P) 2).ult (allOneRankAtom (sourceRanks P) 3)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (3 : Fin 78) (34 : Fin 78)
    (2 : Fin 78) (42 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (4 : Fin 13) (5 : Fin 13)
    (by decide) (by decide) (by decide)
    (33 : Fin 78) (4 : Fin 78) (3 : Fin 78)
    (34 : Fin 78) (2 : Fin 78) (42 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3485` (kalmanson). -/
theorem middleSource_h3485 :
    ((!((allOneRankAtom (sourceRanks P) 3 == allOneRankAtom (sourceRanks P) 4)) || ((allOneRankAtom (sourceRanks P) 33).ult (allOneRankAtom (sourceRanks P) 34)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (34 : Fin 78) (3 : Fin 78)
    (33 : Fin 78) (4 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (4 : Fin 13) (5 : Fin 13)
    (by decide) (by decide) (by decide)
    (33 : Fin 78) (4 : Fin 78) (3 : Fin 78)
    (34 : Fin 78) (2 : Fin 78) (42 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3486` (kalmanson). -/
theorem middleSource_h3486 :
    ((!((allOneRankAtom (sourceRanks P) 3 == allOneRankAtom (sourceRanks P) 33)) || ((allOneRankAtom (sourceRanks P) 4).ult (allOneRankAtom (sourceRanks P) 34)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (34 : Fin 78) (3 : Fin 78)
    (4 : Fin 78) (33 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (4 : Fin 13) (5 : Fin 13)
    (by decide) (by decide) (by decide)
    (33 : Fin 78) (4 : Fin 78) (3 : Fin 78)
    (34 : Fin 78) (2 : Fin 78) (42 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3487` (kalmanson). -/
theorem middleSource_h3487 :
    ((!((allOneRankAtom (sourceRanks P) 34 == allOneRankAtom (sourceRanks P) 4)) || ((allOneRankAtom (sourceRanks P) 33).ult (allOneRankAtom (sourceRanks P) 3)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (3 : Fin 78) (34 : Fin 78)
    (33 : Fin 78) (4 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (4 : Fin 13) (5 : Fin 13)
    (by decide) (by decide) (by decide)
    (33 : Fin 78) (4 : Fin 78) (3 : Fin 78)
    (34 : Fin 78) (2 : Fin 78) (42 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3488` (kalmanson). -/
theorem middleSource_h3488 :
    ((!((allOneRankAtom (sourceRanks P) 3 == allOneRankAtom (sourceRanks P) 43)) || ((allOneRankAtom (sourceRanks P) 2).ult (allOneRankAtom (sourceRanks P) 35)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (35 : Fin 78) (3 : Fin 78)
    (2 : Fin 78) (43 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (4 : Fin 13) (6 : Fin 13)
    (by decide) (by decide) (by decide)
    (33 : Fin 78) (5 : Fin 78) (3 : Fin 78)
    (35 : Fin 78) (2 : Fin 78) (43 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3489` (kalmanson). -/
theorem middleSource_h3489 :
    ((!((allOneRankAtom (sourceRanks P) 35 == allOneRankAtom (sourceRanks P) 2)) || ((allOneRankAtom (sourceRanks P) 43).ult (allOneRankAtom (sourceRanks P) 3)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (3 : Fin 78) (35 : Fin 78)
    (43 : Fin 78) (2 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (4 : Fin 13) (6 : Fin 13)
    (by decide) (by decide) (by decide)
    (33 : Fin 78) (5 : Fin 78) (3 : Fin 78)
    (35 : Fin 78) (2 : Fin 78) (43 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3490` (kalmanson). -/
theorem middleSource_h3490 :
    ((!((allOneRankAtom (sourceRanks P) 35 == allOneRankAtom (sourceRanks P) 43)) || ((allOneRankAtom (sourceRanks P) 2).ult (allOneRankAtom (sourceRanks P) 3)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (3 : Fin 78) (35 : Fin 78)
    (2 : Fin 78) (43 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (4 : Fin 13) (6 : Fin 13)
    (by decide) (by decide) (by decide)
    (33 : Fin 78) (5 : Fin 78) (3 : Fin 78)
    (35 : Fin 78) (2 : Fin 78) (43 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3491` (kalmanson). -/
theorem middleSource_h3491 :
    ((!((allOneRankAtom (sourceRanks P) 3 == allOneRankAtom (sourceRanks P) 5)) || ((allOneRankAtom (sourceRanks P) 33).ult (allOneRankAtom (sourceRanks P) 35)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (35 : Fin 78) (3 : Fin 78)
    (33 : Fin 78) (5 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (4 : Fin 13) (6 : Fin 13)
    (by decide) (by decide) (by decide)
    (33 : Fin 78) (5 : Fin 78) (3 : Fin 78)
    (35 : Fin 78) (2 : Fin 78) (43 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3492` (kalmanson). -/
theorem middleSource_h3492 :
    ((!((allOneRankAtom (sourceRanks P) 3 == allOneRankAtom (sourceRanks P) 33)) || ((allOneRankAtom (sourceRanks P) 5).ult (allOneRankAtom (sourceRanks P) 35)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (35 : Fin 78) (3 : Fin 78)
    (5 : Fin 78) (33 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (4 : Fin 13) (6 : Fin 13)
    (by decide) (by decide) (by decide)
    (33 : Fin 78) (5 : Fin 78) (3 : Fin 78)
    (35 : Fin 78) (2 : Fin 78) (43 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3493` (kalmanson). -/
theorem middleSource_h3493 :
    ((!((allOneRankAtom (sourceRanks P) 35 == allOneRankAtom (sourceRanks P) 5)) || ((allOneRankAtom (sourceRanks P) 33).ult (allOneRankAtom (sourceRanks P) 3)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (3 : Fin 78) (35 : Fin 78)
    (33 : Fin 78) (5 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (4 : Fin 13) (6 : Fin 13)
    (by decide) (by decide) (by decide)
    (33 : Fin 78) (5 : Fin 78) (3 : Fin 78)
    (35 : Fin 78) (2 : Fin 78) (43 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3494` (kalmanson). -/
theorem middleSource_h3494 :
    ((!((allOneRankAtom (sourceRanks P) 3 == allOneRankAtom (sourceRanks P) 2)) || ((allOneRankAtom (sourceRanks P) 44).ult (allOneRankAtom (sourceRanks P) 36)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (36 : Fin 78) (3 : Fin 78)
    (44 : Fin 78) (2 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (4 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (33 : Fin 78) (6 : Fin 78) (3 : Fin 78)
    (36 : Fin 78) (2 : Fin 78) (44 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3495` (kalmanson). -/
theorem middleSource_h3495 :
    ((!((allOneRankAtom (sourceRanks P) 3 == allOneRankAtom (sourceRanks P) 44)) || ((allOneRankAtom (sourceRanks P) 2).ult (allOneRankAtom (sourceRanks P) 36)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (36 : Fin 78) (3 : Fin 78)
    (2 : Fin 78) (44 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (4 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (33 : Fin 78) (6 : Fin 78) (3 : Fin 78)
    (36 : Fin 78) (2 : Fin 78) (44 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3496` (kalmanson). -/
theorem middleSource_h3496 :
    ((!((allOneRankAtom (sourceRanks P) 36 == allOneRankAtom (sourceRanks P) 2)) || ((allOneRankAtom (sourceRanks P) 44).ult (allOneRankAtom (sourceRanks P) 3)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (3 : Fin 78) (36 : Fin 78)
    (44 : Fin 78) (2 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (4 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (33 : Fin 78) (6 : Fin 78) (3 : Fin 78)
    (36 : Fin 78) (2 : Fin 78) (44 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3497` (kalmanson). -/
theorem middleSource_h3497 :
    ((!((allOneRankAtom (sourceRanks P) 36 == allOneRankAtom (sourceRanks P) 44)) || ((allOneRankAtom (sourceRanks P) 2).ult (allOneRankAtom (sourceRanks P) 3)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (3 : Fin 78) (36 : Fin 78)
    (2 : Fin 78) (44 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (4 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (33 : Fin 78) (6 : Fin 78) (3 : Fin 78)
    (36 : Fin 78) (2 : Fin 78) (44 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3498` (kalmanson). -/
theorem middleSource_h3498 :
    ((!((allOneRankAtom (sourceRanks P) 3 == allOneRankAtom (sourceRanks P) 6)) || ((allOneRankAtom (sourceRanks P) 33).ult (allOneRankAtom (sourceRanks P) 36)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (36 : Fin 78) (3 : Fin 78)
    (33 : Fin 78) (6 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (4 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (33 : Fin 78) (6 : Fin 78) (3 : Fin 78)
    (36 : Fin 78) (2 : Fin 78) (44 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3499` (kalmanson). -/
theorem middleSource_h3499 :
    ((!((allOneRankAtom (sourceRanks P) 3 == allOneRankAtom (sourceRanks P) 33)) || ((allOneRankAtom (sourceRanks P) 6).ult (allOneRankAtom (sourceRanks P) 36)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (36 : Fin 78) (3 : Fin 78)
    (6 : Fin 78) (33 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (4 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (33 : Fin 78) (6 : Fin 78) (3 : Fin 78)
    (36 : Fin 78) (2 : Fin 78) (44 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3500` (kalmanson). -/
theorem middleSource_h3500 :
    ((!((allOneRankAtom (sourceRanks P) 36 == allOneRankAtom (sourceRanks P) 33)) || ((allOneRankAtom (sourceRanks P) 6).ult (allOneRankAtom (sourceRanks P) 3)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (3 : Fin 78) (36 : Fin 78)
    (6 : Fin 78) (33 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (4 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (33 : Fin 78) (6 : Fin 78) (3 : Fin 78)
    (36 : Fin 78) (2 : Fin 78) (44 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3501` (kalmanson). -/
theorem middleSource_h3501 :
    ((!((allOneRankAtom (sourceRanks P) 3 == allOneRankAtom (sourceRanks P) 2)) || ((allOneRankAtom (sourceRanks P) 45).ult (allOneRankAtom (sourceRanks P) 37)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (37 : Fin 78) (3 : Fin 78)
    (45 : Fin 78) (2 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (4 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (33 : Fin 78) (7 : Fin 78) (3 : Fin 78)
    (37 : Fin 78) (2 : Fin 78) (45 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3502` (kalmanson). -/
theorem middleSource_h3502 :
    ((!((allOneRankAtom (sourceRanks P) 3 == allOneRankAtom (sourceRanks P) 45)) || ((allOneRankAtom (sourceRanks P) 2).ult (allOneRankAtom (sourceRanks P) 37)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (37 : Fin 78) (3 : Fin 78)
    (2 : Fin 78) (45 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (4 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (33 : Fin 78) (7 : Fin 78) (3 : Fin 78)
    (37 : Fin 78) (2 : Fin 78) (45 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3503` (kalmanson). -/
theorem middleSource_h3503 :
    ((!((allOneRankAtom (sourceRanks P) 37 == allOneRankAtom (sourceRanks P) 2)) || ((allOneRankAtom (sourceRanks P) 45).ult (allOneRankAtom (sourceRanks P) 3)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (3 : Fin 78) (37 : Fin 78)
    (45 : Fin 78) (2 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (4 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (33 : Fin 78) (7 : Fin 78) (3 : Fin 78)
    (37 : Fin 78) (2 : Fin 78) (45 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3504` (kalmanson). -/
theorem middleSource_h3504 :
    ((!((allOneRankAtom (sourceRanks P) 37 == allOneRankAtom (sourceRanks P) 45)) || ((allOneRankAtom (sourceRanks P) 2).ult (allOneRankAtom (sourceRanks P) 3)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (3 : Fin 78) (37 : Fin 78)
    (2 : Fin 78) (45 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (4 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (33 : Fin 78) (7 : Fin 78) (3 : Fin 78)
    (37 : Fin 78) (2 : Fin 78) (45 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3505` (kalmanson). -/
theorem middleSource_h3505 :
    ((!((allOneRankAtom (sourceRanks P) 3 == allOneRankAtom (sourceRanks P) 7)) || ((allOneRankAtom (sourceRanks P) 33).ult (allOneRankAtom (sourceRanks P) 37)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (37 : Fin 78) (3 : Fin 78)
    (33 : Fin 78) (7 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (4 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (33 : Fin 78) (7 : Fin 78) (3 : Fin 78)
    (37 : Fin 78) (2 : Fin 78) (45 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3506` (kalmanson). -/
theorem middleSource_h3506 :
    ((!((allOneRankAtom (sourceRanks P) 3 == allOneRankAtom (sourceRanks P) 33)) || ((allOneRankAtom (sourceRanks P) 7).ult (allOneRankAtom (sourceRanks P) 37)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (37 : Fin 78) (3 : Fin 78)
    (7 : Fin 78) (33 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (4 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (33 : Fin 78) (7 : Fin 78) (3 : Fin 78)
    (37 : Fin 78) (2 : Fin 78) (45 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3507` (kalmanson). -/
theorem middleSource_h3507 :
    ((!((allOneRankAtom (sourceRanks P) 37 == allOneRankAtom (sourceRanks P) 7)) || ((allOneRankAtom (sourceRanks P) 33).ult (allOneRankAtom (sourceRanks P) 3)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (3 : Fin 78) (37 : Fin 78)
    (33 : Fin 78) (7 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (4 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (33 : Fin 78) (7 : Fin 78) (3 : Fin 78)
    (37 : Fin 78) (2 : Fin 78) (45 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3508` (kalmanson). -/
theorem middleSource_h3508 :
    ((!((allOneRankAtom (sourceRanks P) 37 == allOneRankAtom (sourceRanks P) 33)) || ((allOneRankAtom (sourceRanks P) 7).ult (allOneRankAtom (sourceRanks P) 3)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (3 : Fin 78) (37 : Fin 78)
    (7 : Fin 78) (33 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (4 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (33 : Fin 78) (7 : Fin 78) (3 : Fin 78)
    (37 : Fin 78) (2 : Fin 78) (45 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3509` (kalmanson). -/
theorem middleSource_h3509 :
    ((!((allOneRankAtom (sourceRanks P) 3 == allOneRankAtom (sourceRanks P) 46)) || ((allOneRankAtom (sourceRanks P) 2).ult (allOneRankAtom (sourceRanks P) 38)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (38 : Fin 78) (3 : Fin 78)
    (2 : Fin 78) (46 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (4 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (33 : Fin 78) (8 : Fin 78) (3 : Fin 78)
    (38 : Fin 78) (2 : Fin 78) (46 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3510` (kalmanson). -/
theorem middleSource_h3510 :
    ((!((allOneRankAtom (sourceRanks P) 38 == allOneRankAtom (sourceRanks P) 2)) || ((allOneRankAtom (sourceRanks P) 46).ult (allOneRankAtom (sourceRanks P) 3)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (3 : Fin 78) (38 : Fin 78)
    (46 : Fin 78) (2 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (4 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (33 : Fin 78) (8 : Fin 78) (3 : Fin 78)
    (38 : Fin 78) (2 : Fin 78) (46 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3511` (kalmanson). -/
theorem middleSource_h3511 :
    ((!((allOneRankAtom (sourceRanks P) 38 == allOneRankAtom (sourceRanks P) 46)) || ((allOneRankAtom (sourceRanks P) 2).ult (allOneRankAtom (sourceRanks P) 3)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (3 : Fin 78) (38 : Fin 78)
    (2 : Fin 78) (46 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (4 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (33 : Fin 78) (8 : Fin 78) (3 : Fin 78)
    (38 : Fin 78) (2 : Fin 78) (46 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3512` (kalmanson). -/
theorem middleSource_h3512 :
    ((!((allOneRankAtom (sourceRanks P) 3 == allOneRankAtom (sourceRanks P) 33)) || ((allOneRankAtom (sourceRanks P) 8).ult (allOneRankAtom (sourceRanks P) 38)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (38 : Fin 78) (3 : Fin 78)
    (8 : Fin 78) (33 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (4 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (33 : Fin 78) (8 : Fin 78) (3 : Fin 78)
    (38 : Fin 78) (2 : Fin 78) (46 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3513` (kalmanson). -/
theorem middleSource_h3513 :
    ((!((allOneRankAtom (sourceRanks P) 38 == allOneRankAtom (sourceRanks P) 8)) || ((allOneRankAtom (sourceRanks P) 33).ult (allOneRankAtom (sourceRanks P) 3)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (3 : Fin 78) (38 : Fin 78)
    (33 : Fin 78) (8 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (4 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (33 : Fin 78) (8 : Fin 78) (3 : Fin 78)
    (38 : Fin 78) (2 : Fin 78) (46 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3514` (kalmanson). -/
theorem middleSource_h3514 :
    ((!((allOneRankAtom (sourceRanks P) 3 == allOneRankAtom (sourceRanks P) 47)) || ((allOneRankAtom (sourceRanks P) 2).ult (allOneRankAtom (sourceRanks P) 39)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (39 : Fin 78) (3 : Fin 78)
    (2 : Fin 78) (47 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (4 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (33 : Fin 78) (9 : Fin 78) (3 : Fin 78)
    (39 : Fin 78) (2 : Fin 78) (47 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3515` (kalmanson). -/
theorem middleSource_h3515 :
    ((!((allOneRankAtom (sourceRanks P) 39 == allOneRankAtom (sourceRanks P) 2)) || ((allOneRankAtom (sourceRanks P) 47).ult (allOneRankAtom (sourceRanks P) 3)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (3 : Fin 78) (39 : Fin 78)
    (47 : Fin 78) (2 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (4 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (33 : Fin 78) (9 : Fin 78) (3 : Fin 78)
    (39 : Fin 78) (2 : Fin 78) (47 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3516` (kalmanson). -/
theorem middleSource_h3516 :
    ((!((allOneRankAtom (sourceRanks P) 39 == allOneRankAtom (sourceRanks P) 47)) || ((allOneRankAtom (sourceRanks P) 2).ult (allOneRankAtom (sourceRanks P) 3)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (3 : Fin 78) (39 : Fin 78)
    (2 : Fin 78) (47 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (4 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (33 : Fin 78) (9 : Fin 78) (3 : Fin 78)
    (39 : Fin 78) (2 : Fin 78) (47 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3517` (kalmanson). -/
theorem middleSource_h3517 :
    ((!((allOneRankAtom (sourceRanks P) 39 == allOneRankAtom (sourceRanks P) 9)) || ((allOneRankAtom (sourceRanks P) 33).ult (allOneRankAtom (sourceRanks P) 3)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (3 : Fin 78) (39 : Fin 78)
    (33 : Fin 78) (9 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (4 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (33 : Fin 78) (9 : Fin 78) (3 : Fin 78)
    (39 : Fin 78) (2 : Fin 78) (47 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3518` (kalmanson). -/
theorem middleSource_h3518 :
    ((!((allOneRankAtom (sourceRanks P) 3 == allOneRankAtom (sourceRanks P) 48)) || ((allOneRankAtom (sourceRanks P) 2).ult (allOneRankAtom (sourceRanks P) 40)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (40 : Fin 78) (3 : Fin 78)
    (2 : Fin 78) (48 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (4 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (33 : Fin 78) (10 : Fin 78) (3 : Fin 78)
    (40 : Fin 78) (2 : Fin 78) (48 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3519` (kalmanson). -/
theorem middleSource_h3519 :
    ((!((allOneRankAtom (sourceRanks P) 40 == allOneRankAtom (sourceRanks P) 48)) || ((allOneRankAtom (sourceRanks P) 2).ult (allOneRankAtom (sourceRanks P) 3)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (3 : Fin 78) (40 : Fin 78)
    (2 : Fin 78) (48 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (4 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (33 : Fin 78) (10 : Fin 78) (3 : Fin 78)
    (40 : Fin 78) (2 : Fin 78) (48 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

end

end ATailExactFiveCard13AllOneSourceIngressScratch
end Problem97
