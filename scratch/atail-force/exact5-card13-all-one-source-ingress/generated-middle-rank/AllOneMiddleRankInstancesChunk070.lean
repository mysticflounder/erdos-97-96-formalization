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

/-- Candidate middle source assertion `h4480` (kalmanson). -/
theorem middleSource_h4480 :
    ((!((allOneRankAtom (sourceRanks P) 32 == allOneRankAtom (sourceRanks P) 29)) || ((allOneRankAtom (sourceRanks P) 22).ult (allOneRankAtom (sourceRanks P) 19)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (19 : Fin 78) (32 : Fin 78)
    (22 : Fin 78) (29 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (9 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (29 : Fin 78) (22 : Fin 78) (19 : Fin 78)
    (32 : Fin 78) (12 : Fin 78) (74 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4481` (kalmanson). -/
theorem middleSource_h4481 :
    ((!((allOneRankAtom (sourceRanks P) 20 == allOneRankAtom (sourceRanks P) 12)) || ((allOneRankAtom (sourceRanks P) 75).ult (allOneRankAtom (sourceRanks P) 31)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (31 : Fin 78) (20 : Fin 78)
    (75 : Fin 78) (12 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (10 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (30 : Fin 78) (21 : Fin 78) (20 : Fin 78)
    (31 : Fin 78) (12 : Fin 78) (75 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4482` (kalmanson). -/
theorem middleSource_h4482 :
    ((!((allOneRankAtom (sourceRanks P) 20 == allOneRankAtom (sourceRanks P) 75)) || ((allOneRankAtom (sourceRanks P) 12).ult (allOneRankAtom (sourceRanks P) 31)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (31 : Fin 78) (20 : Fin 78)
    (12 : Fin 78) (75 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (10 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (30 : Fin 78) (21 : Fin 78) (20 : Fin 78)
    (31 : Fin 78) (12 : Fin 78) (75 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4483` (kalmanson). -/
theorem middleSource_h4483 :
    ((!((allOneRankAtom (sourceRanks P) 31 == allOneRankAtom (sourceRanks P) 12)) || ((allOneRankAtom (sourceRanks P) 75).ult (allOneRankAtom (sourceRanks P) 20)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (20 : Fin 78) (31 : Fin 78)
    (75 : Fin 78) (12 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (10 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (30 : Fin 78) (21 : Fin 78) (20 : Fin 78)
    (31 : Fin 78) (12 : Fin 78) (75 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4484` (kalmanson). -/
theorem middleSource_h4484 :
    ((!((allOneRankAtom (sourceRanks P) 31 == allOneRankAtom (sourceRanks P) 75)) || ((allOneRankAtom (sourceRanks P) 12).ult (allOneRankAtom (sourceRanks P) 20)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (20 : Fin 78) (31 : Fin 78)
    (12 : Fin 78) (75 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (10 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (30 : Fin 78) (21 : Fin 78) (20 : Fin 78)
    (31 : Fin 78) (12 : Fin 78) (75 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4485` (kalmanson). -/
theorem middleSource_h4485 :
    ((!((allOneRankAtom (sourceRanks P) 20 == allOneRankAtom (sourceRanks P) 21)) || ((allOneRankAtom (sourceRanks P) 30).ult (allOneRankAtom (sourceRanks P) 31)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (31 : Fin 78) (20 : Fin 78)
    (30 : Fin 78) (21 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (10 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (30 : Fin 78) (21 : Fin 78) (20 : Fin 78)
    (31 : Fin 78) (12 : Fin 78) (75 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4486` (kalmanson). -/
theorem middleSource_h4486 :
    ((!((allOneRankAtom (sourceRanks P) 31 == allOneRankAtom (sourceRanks P) 30)) || ((allOneRankAtom (sourceRanks P) 21).ult (allOneRankAtom (sourceRanks P) 20)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (20 : Fin 78) (31 : Fin 78)
    (21 : Fin 78) (30 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (10 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (30 : Fin 78) (21 : Fin 78) (20 : Fin 78)
    (31 : Fin 78) (12 : Fin 78) (75 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4487` (kalmanson). -/
theorem middleSource_h4487 :
    ((!((allOneRankAtom (sourceRanks P) 20 == allOneRankAtom (sourceRanks P) 12)) || ((allOneRankAtom (sourceRanks P) 76).ult (allOneRankAtom (sourceRanks P) 32)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (32 : Fin 78) (20 : Fin 78)
    (76 : Fin 78) (12 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (10 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (30 : Fin 78) (22 : Fin 78) (20 : Fin 78)
    (32 : Fin 78) (12 : Fin 78) (76 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4488` (kalmanson). -/
theorem middleSource_h4488 :
    ((!((allOneRankAtom (sourceRanks P) 20 == allOneRankAtom (sourceRanks P) 76)) || ((allOneRankAtom (sourceRanks P) 12).ult (allOneRankAtom (sourceRanks P) 32)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (32 : Fin 78) (20 : Fin 78)
    (12 : Fin 78) (76 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (10 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (30 : Fin 78) (22 : Fin 78) (20 : Fin 78)
    (32 : Fin 78) (12 : Fin 78) (76 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4489` (kalmanson). -/
theorem middleSource_h4489 :
    ((!((allOneRankAtom (sourceRanks P) 32 == allOneRankAtom (sourceRanks P) 12)) || ((allOneRankAtom (sourceRanks P) 76).ult (allOneRankAtom (sourceRanks P) 20)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (20 : Fin 78) (32 : Fin 78)
    (76 : Fin 78) (12 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (10 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (30 : Fin 78) (22 : Fin 78) (20 : Fin 78)
    (32 : Fin 78) (12 : Fin 78) (76 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4490` (kalmanson). -/
theorem middleSource_h4490 :
    ((!((allOneRankAtom (sourceRanks P) 20 == allOneRankAtom (sourceRanks P) 22)) || ((allOneRankAtom (sourceRanks P) 30).ult (allOneRankAtom (sourceRanks P) 32)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (32 : Fin 78) (20 : Fin 78)
    (30 : Fin 78) (22 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (10 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (30 : Fin 78) (22 : Fin 78) (20 : Fin 78)
    (32 : Fin 78) (12 : Fin 78) (76 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4491` (kalmanson). -/
theorem middleSource_h4491 :
    ((!((allOneRankAtom (sourceRanks P) 32 == allOneRankAtom (sourceRanks P) 30)) || ((allOneRankAtom (sourceRanks P) 22).ult (allOneRankAtom (sourceRanks P) 20)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (20 : Fin 78) (32 : Fin 78)
    (22 : Fin 78) (30 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (10 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (30 : Fin 78) (22 : Fin 78) (20 : Fin 78)
    (32 : Fin 78) (12 : Fin 78) (76 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4492` (kalmanson). -/
theorem middleSource_h4492 :
    ((!((allOneRankAtom (sourceRanks P) 21 == allOneRankAtom (sourceRanks P) 12)) || ((allOneRankAtom (sourceRanks P) 77).ult (allOneRankAtom (sourceRanks P) 32)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (32 : Fin 78) (21 : Fin 78)
    (77 : Fin 78) (12 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (11 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (31 : Fin 78) (22 : Fin 78) (21 : Fin 78)
    (32 : Fin 78) (12 : Fin 78) (77 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4493` (kalmanson). -/
theorem middleSource_h4493 :
    ((!((allOneRankAtom (sourceRanks P) 21 == allOneRankAtom (sourceRanks P) 77)) || ((allOneRankAtom (sourceRanks P) 12).ult (allOneRankAtom (sourceRanks P) 32)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (32 : Fin 78) (21 : Fin 78)
    (12 : Fin 78) (77 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (11 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (31 : Fin 78) (22 : Fin 78) (21 : Fin 78)
    (32 : Fin 78) (12 : Fin 78) (77 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4494` (kalmanson). -/
theorem middleSource_h4494 :
    ((!((allOneRankAtom (sourceRanks P) 32 == allOneRankAtom (sourceRanks P) 12)) || ((allOneRankAtom (sourceRanks P) 77).ult (allOneRankAtom (sourceRanks P) 21)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (21 : Fin 78) (32 : Fin 78)
    (77 : Fin 78) (12 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (11 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (31 : Fin 78) (22 : Fin 78) (21 : Fin 78)
    (32 : Fin 78) (12 : Fin 78) (77 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4495` (kalmanson). -/
theorem middleSource_h4495 :
    ((!((allOneRankAtom (sourceRanks P) 21 == allOneRankAtom (sourceRanks P) 22)) || ((allOneRankAtom (sourceRanks P) 31).ult (allOneRankAtom (sourceRanks P) 32)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (32 : Fin 78) (21 : Fin 78)
    (31 : Fin 78) (22 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (11 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (31 : Fin 78) (22 : Fin 78) (21 : Fin 78)
    (32 : Fin 78) (12 : Fin 78) (77 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4496` (kalmanson). -/
theorem middleSource_h4496 :
    ((!((allOneRankAtom (sourceRanks P) 32 == allOneRankAtom (sourceRanks P) 31)) || ((allOneRankAtom (sourceRanks P) 22).ult (allOneRankAtom (sourceRanks P) 21)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (21 : Fin 78) (32 : Fin 78)
    (22 : Fin 78) (31 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (11 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (31 : Fin 78) (22 : Fin 78) (21 : Fin 78)
    (32 : Fin 78) (12 : Fin 78) (77 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4497` (kalmanson). -/
theorem middleSource_h4497 :
    ((!((allOneRankAtom (sourceRanks P) 14 == allOneRankAtom (sourceRanks P) 13)) || ((allOneRankAtom (sourceRanks P) 42).ult (allOneRankAtom (sourceRanks P) 34)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (34 : Fin 78) (14 : Fin 78)
    (42 : Fin 78) (13 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (3 : Fin 13) (4 : Fin 13) (5 : Fin 13)
    (by decide) (by decide) (by decide)
    (33 : Fin 78) (15 : Fin 78) (14 : Fin 78)
    (34 : Fin 78) (13 : Fin 78) (42 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4498` (kalmanson). -/
theorem middleSource_h4498 :
    ((!((allOneRankAtom (sourceRanks P) 14 == allOneRankAtom (sourceRanks P) 42)) || ((allOneRankAtom (sourceRanks P) 13).ult (allOneRankAtom (sourceRanks P) 34)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (34 : Fin 78) (14 : Fin 78)
    (13 : Fin 78) (42 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (3 : Fin 13) (4 : Fin 13) (5 : Fin 13)
    (by decide) (by decide) (by decide)
    (33 : Fin 78) (15 : Fin 78) (14 : Fin 78)
    (34 : Fin 78) (13 : Fin 78) (42 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4499` (kalmanson). -/
theorem middleSource_h4499 :
    ((!((allOneRankAtom (sourceRanks P) 34 == allOneRankAtom (sourceRanks P) 42)) || ((allOneRankAtom (sourceRanks P) 13).ult (allOneRankAtom (sourceRanks P) 14)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (14 : Fin 78) (34 : Fin 78)
    (13 : Fin 78) (42 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (3 : Fin 13) (4 : Fin 13) (5 : Fin 13)
    (by decide) (by decide) (by decide)
    (33 : Fin 78) (15 : Fin 78) (14 : Fin 78)
    (34 : Fin 78) (13 : Fin 78) (42 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4500` (kalmanson). -/
theorem middleSource_h4500 :
    ((!((allOneRankAtom (sourceRanks P) 14 == allOneRankAtom (sourceRanks P) 15)) || ((allOneRankAtom (sourceRanks P) 33).ult (allOneRankAtom (sourceRanks P) 34)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (34 : Fin 78) (14 : Fin 78)
    (33 : Fin 78) (15 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (3 : Fin 13) (4 : Fin 13) (5 : Fin 13)
    (by decide) (by decide) (by decide)
    (33 : Fin 78) (15 : Fin 78) (14 : Fin 78)
    (34 : Fin 78) (13 : Fin 78) (42 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4501` (kalmanson). -/
theorem middleSource_h4501 :
    ((!((allOneRankAtom (sourceRanks P) 14 == allOneRankAtom (sourceRanks P) 13)) || ((allOneRankAtom (sourceRanks P) 43).ult (allOneRankAtom (sourceRanks P) 35)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (35 : Fin 78) (14 : Fin 78)
    (43 : Fin 78) (13 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (3 : Fin 13) (4 : Fin 13) (6 : Fin 13)
    (by decide) (by decide) (by decide)
    (33 : Fin 78) (16 : Fin 78) (14 : Fin 78)
    (35 : Fin 78) (13 : Fin 78) (43 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4502` (kalmanson). -/
theorem middleSource_h4502 :
    ((!((allOneRankAtom (sourceRanks P) 14 == allOneRankAtom (sourceRanks P) 43)) || ((allOneRankAtom (sourceRanks P) 13).ult (allOneRankAtom (sourceRanks P) 35)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (35 : Fin 78) (14 : Fin 78)
    (13 : Fin 78) (43 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (3 : Fin 13) (4 : Fin 13) (6 : Fin 13)
    (by decide) (by decide) (by decide)
    (33 : Fin 78) (16 : Fin 78) (14 : Fin 78)
    (35 : Fin 78) (13 : Fin 78) (43 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4503` (kalmanson). -/
theorem middleSource_h4503 :
    ((!((allOneRankAtom (sourceRanks P) 35 == allOneRankAtom (sourceRanks P) 43)) || ((allOneRankAtom (sourceRanks P) 13).ult (allOneRankAtom (sourceRanks P) 14)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (14 : Fin 78) (35 : Fin 78)
    (13 : Fin 78) (43 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (3 : Fin 13) (4 : Fin 13) (6 : Fin 13)
    (by decide) (by decide) (by decide)
    (33 : Fin 78) (16 : Fin 78) (14 : Fin 78)
    (35 : Fin 78) (13 : Fin 78) (43 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4504` (kalmanson). -/
theorem middleSource_h4504 :
    ((!((allOneRankAtom (sourceRanks P) 14 == allOneRankAtom (sourceRanks P) 16)) || ((allOneRankAtom (sourceRanks P) 33).ult (allOneRankAtom (sourceRanks P) 35)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (35 : Fin 78) (14 : Fin 78)
    (33 : Fin 78) (16 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (3 : Fin 13) (4 : Fin 13) (6 : Fin 13)
    (by decide) (by decide) (by decide)
    (33 : Fin 78) (16 : Fin 78) (14 : Fin 78)
    (35 : Fin 78) (13 : Fin 78) (43 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4505` (kalmanson). -/
theorem middleSource_h4505 :
    ((!((allOneRankAtom (sourceRanks P) 35 == allOneRankAtom (sourceRanks P) 33)) || ((allOneRankAtom (sourceRanks P) 16).ult (allOneRankAtom (sourceRanks P) 14)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (14 : Fin 78) (35 : Fin 78)
    (16 : Fin 78) (33 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (3 : Fin 13) (4 : Fin 13) (6 : Fin 13)
    (by decide) (by decide) (by decide)
    (33 : Fin 78) (16 : Fin 78) (14 : Fin 78)
    (35 : Fin 78) (13 : Fin 78) (43 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4506` (kalmanson). -/
theorem middleSource_h4506 :
    ((!((allOneRankAtom (sourceRanks P) 14 == allOneRankAtom (sourceRanks P) 13)) || ((allOneRankAtom (sourceRanks P) 44).ult (allOneRankAtom (sourceRanks P) 36)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (36 : Fin 78) (14 : Fin 78)
    (44 : Fin 78) (13 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (3 : Fin 13) (4 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (33 : Fin 78) (17 : Fin 78) (14 : Fin 78)
    (36 : Fin 78) (13 : Fin 78) (44 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4507` (kalmanson). -/
theorem middleSource_h4507 :
    ((!((allOneRankAtom (sourceRanks P) 14 == allOneRankAtom (sourceRanks P) 44)) || ((allOneRankAtom (sourceRanks P) 13).ult (allOneRankAtom (sourceRanks P) 36)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (36 : Fin 78) (14 : Fin 78)
    (13 : Fin 78) (44 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (3 : Fin 13) (4 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (33 : Fin 78) (17 : Fin 78) (14 : Fin 78)
    (36 : Fin 78) (13 : Fin 78) (44 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4508` (kalmanson). -/
theorem middleSource_h4508 :
    ((!((allOneRankAtom (sourceRanks P) 36 == allOneRankAtom (sourceRanks P) 44)) || ((allOneRankAtom (sourceRanks P) 13).ult (allOneRankAtom (sourceRanks P) 14)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (14 : Fin 78) (36 : Fin 78)
    (13 : Fin 78) (44 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (3 : Fin 13) (4 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (33 : Fin 78) (17 : Fin 78) (14 : Fin 78)
    (36 : Fin 78) (13 : Fin 78) (44 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4509` (kalmanson). -/
theorem middleSource_h4509 :
    ((!((allOneRankAtom (sourceRanks P) 14 == allOneRankAtom (sourceRanks P) 17)) || ((allOneRankAtom (sourceRanks P) 33).ult (allOneRankAtom (sourceRanks P) 36)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (36 : Fin 78) (14 : Fin 78)
    (33 : Fin 78) (17 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (3 : Fin 13) (4 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (33 : Fin 78) (17 : Fin 78) (14 : Fin 78)
    (36 : Fin 78) (13 : Fin 78) (44 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4510` (kalmanson). -/
theorem middleSource_h4510 :
    ((!((allOneRankAtom (sourceRanks P) 36 == allOneRankAtom (sourceRanks P) 33)) || ((allOneRankAtom (sourceRanks P) 17).ult (allOneRankAtom (sourceRanks P) 14)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (14 : Fin 78) (36 : Fin 78)
    (17 : Fin 78) (33 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (3 : Fin 13) (4 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (33 : Fin 78) (17 : Fin 78) (14 : Fin 78)
    (36 : Fin 78) (13 : Fin 78) (44 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4511` (kalmanson). -/
theorem middleSource_h4511 :
    ((!((allOneRankAtom (sourceRanks P) 14 == allOneRankAtom (sourceRanks P) 13)) || ((allOneRankAtom (sourceRanks P) 45).ult (allOneRankAtom (sourceRanks P) 37)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (37 : Fin 78) (14 : Fin 78)
    (45 : Fin 78) (13 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (3 : Fin 13) (4 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (33 : Fin 78) (18 : Fin 78) (14 : Fin 78)
    (37 : Fin 78) (13 : Fin 78) (45 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4512` (kalmanson). -/
theorem middleSource_h4512 :
    ((!((allOneRankAtom (sourceRanks P) 14 == allOneRankAtom (sourceRanks P) 45)) || ((allOneRankAtom (sourceRanks P) 13).ult (allOneRankAtom (sourceRanks P) 37)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (37 : Fin 78) (14 : Fin 78)
    (13 : Fin 78) (45 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (3 : Fin 13) (4 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (33 : Fin 78) (18 : Fin 78) (14 : Fin 78)
    (37 : Fin 78) (13 : Fin 78) (45 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4513` (kalmanson). -/
theorem middleSource_h4513 :
    ((!((allOneRankAtom (sourceRanks P) 37 == allOneRankAtom (sourceRanks P) 13)) || ((allOneRankAtom (sourceRanks P) 45).ult (allOneRankAtom (sourceRanks P) 14)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (14 : Fin 78) (37 : Fin 78)
    (45 : Fin 78) (13 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (3 : Fin 13) (4 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (33 : Fin 78) (18 : Fin 78) (14 : Fin 78)
    (37 : Fin 78) (13 : Fin 78) (45 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4514` (kalmanson). -/
theorem middleSource_h4514 :
    ((!((allOneRankAtom (sourceRanks P) 37 == allOneRankAtom (sourceRanks P) 45)) || ((allOneRankAtom (sourceRanks P) 13).ult (allOneRankAtom (sourceRanks P) 14)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (14 : Fin 78) (37 : Fin 78)
    (13 : Fin 78) (45 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (3 : Fin 13) (4 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (33 : Fin 78) (18 : Fin 78) (14 : Fin 78)
    (37 : Fin 78) (13 : Fin 78) (45 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4515` (kalmanson). -/
theorem middleSource_h4515 :
    ((!((allOneRankAtom (sourceRanks P) 37 == allOneRankAtom (sourceRanks P) 18)) || ((allOneRankAtom (sourceRanks P) 33).ult (allOneRankAtom (sourceRanks P) 14)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (14 : Fin 78) (37 : Fin 78)
    (33 : Fin 78) (18 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (3 : Fin 13) (4 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (33 : Fin 78) (18 : Fin 78) (14 : Fin 78)
    (37 : Fin 78) (13 : Fin 78) (45 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4516` (kalmanson). -/
theorem middleSource_h4516 :
    ((!((allOneRankAtom (sourceRanks P) 14 == allOneRankAtom (sourceRanks P) 13)) || ((allOneRankAtom (sourceRanks P) 46).ult (allOneRankAtom (sourceRanks P) 38)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (38 : Fin 78) (14 : Fin 78)
    (46 : Fin 78) (13 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (3 : Fin 13) (4 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (33 : Fin 78) (19 : Fin 78) (14 : Fin 78)
    (38 : Fin 78) (13 : Fin 78) (46 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4517` (kalmanson). -/
theorem middleSource_h4517 :
    ((!((allOneRankAtom (sourceRanks P) 14 == allOneRankAtom (sourceRanks P) 46)) || ((allOneRankAtom (sourceRanks P) 13).ult (allOneRankAtom (sourceRanks P) 38)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (38 : Fin 78) (14 : Fin 78)
    (13 : Fin 78) (46 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (3 : Fin 13) (4 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (33 : Fin 78) (19 : Fin 78) (14 : Fin 78)
    (38 : Fin 78) (13 : Fin 78) (46 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4518` (kalmanson). -/
theorem middleSource_h4518 :
    ((!((allOneRankAtom (sourceRanks P) 38 == allOneRankAtom (sourceRanks P) 46)) || ((allOneRankAtom (sourceRanks P) 13).ult (allOneRankAtom (sourceRanks P) 14)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (14 : Fin 78) (38 : Fin 78)
    (13 : Fin 78) (46 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (3 : Fin 13) (4 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (33 : Fin 78) (19 : Fin 78) (14 : Fin 78)
    (38 : Fin 78) (13 : Fin 78) (46 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4519` (kalmanson). -/
theorem middleSource_h4519 :
    ((!((allOneRankAtom (sourceRanks P) 14 == allOneRankAtom (sourceRanks P) 19)) || ((allOneRankAtom (sourceRanks P) 33).ult (allOneRankAtom (sourceRanks P) 38)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (38 : Fin 78) (14 : Fin 78)
    (33 : Fin 78) (19 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (3 : Fin 13) (4 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (33 : Fin 78) (19 : Fin 78) (14 : Fin 78)
    (38 : Fin 78) (13 : Fin 78) (46 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4520` (kalmanson). -/
theorem middleSource_h4520 :
    ((!((allOneRankAtom (sourceRanks P) 14 == allOneRankAtom (sourceRanks P) 13)) || ((allOneRankAtom (sourceRanks P) 47).ult (allOneRankAtom (sourceRanks P) 39)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (39 : Fin 78) (14 : Fin 78)
    (47 : Fin 78) (13 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (3 : Fin 13) (4 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (33 : Fin 78) (20 : Fin 78) (14 : Fin 78)
    (39 : Fin 78) (13 : Fin 78) (47 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4521` (kalmanson). -/
theorem middleSource_h4521 :
    ((!((allOneRankAtom (sourceRanks P) 14 == allOneRankAtom (sourceRanks P) 47)) || ((allOneRankAtom (sourceRanks P) 13).ult (allOneRankAtom (sourceRanks P) 39)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (39 : Fin 78) (14 : Fin 78)
    (13 : Fin 78) (47 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (3 : Fin 13) (4 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (33 : Fin 78) (20 : Fin 78) (14 : Fin 78)
    (39 : Fin 78) (13 : Fin 78) (47 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4522` (kalmanson). -/
theorem middleSource_h4522 :
    ((!((allOneRankAtom (sourceRanks P) 39 == allOneRankAtom (sourceRanks P) 47)) || ((allOneRankAtom (sourceRanks P) 13).ult (allOneRankAtom (sourceRanks P) 14)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (14 : Fin 78) (39 : Fin 78)
    (13 : Fin 78) (47 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (3 : Fin 13) (4 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (33 : Fin 78) (20 : Fin 78) (14 : Fin 78)
    (39 : Fin 78) (13 : Fin 78) (47 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4523` (kalmanson). -/
theorem middleSource_h4523 :
    ((!((allOneRankAtom (sourceRanks P) 14 == allOneRankAtom (sourceRanks P) 13)) || ((allOneRankAtom (sourceRanks P) 48).ult (allOneRankAtom (sourceRanks P) 40)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (40 : Fin 78) (14 : Fin 78)
    (48 : Fin 78) (13 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (3 : Fin 13) (4 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (33 : Fin 78) (21 : Fin 78) (14 : Fin 78)
    (40 : Fin 78) (13 : Fin 78) (48 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4524` (kalmanson). -/
theorem middleSource_h4524 :
    ((!((allOneRankAtom (sourceRanks P) 14 == allOneRankAtom (sourceRanks P) 48)) || ((allOneRankAtom (sourceRanks P) 13).ult (allOneRankAtom (sourceRanks P) 40)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (40 : Fin 78) (14 : Fin 78)
    (13 : Fin 78) (48 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (3 : Fin 13) (4 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (33 : Fin 78) (21 : Fin 78) (14 : Fin 78)
    (40 : Fin 78) (13 : Fin 78) (48 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4525` (kalmanson). -/
theorem middleSource_h4525 :
    ((!((allOneRankAtom (sourceRanks P) 40 == allOneRankAtom (sourceRanks P) 13)) || ((allOneRankAtom (sourceRanks P) 48).ult (allOneRankAtom (sourceRanks P) 14)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (14 : Fin 78) (40 : Fin 78)
    (48 : Fin 78) (13 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (3 : Fin 13) (4 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (33 : Fin 78) (21 : Fin 78) (14 : Fin 78)
    (40 : Fin 78) (13 : Fin 78) (48 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4526` (kalmanson). -/
theorem middleSource_h4526 :
    ((!((allOneRankAtom (sourceRanks P) 40 == allOneRankAtom (sourceRanks P) 48)) || ((allOneRankAtom (sourceRanks P) 13).ult (allOneRankAtom (sourceRanks P) 14)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (14 : Fin 78) (40 : Fin 78)
    (13 : Fin 78) (48 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (3 : Fin 13) (4 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (33 : Fin 78) (21 : Fin 78) (14 : Fin 78)
    (40 : Fin 78) (13 : Fin 78) (48 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4527` (kalmanson). -/
theorem middleSource_h4527 :
    ((!((allOneRankAtom (sourceRanks P) 14 == allOneRankAtom (sourceRanks P) 13)) || ((allOneRankAtom (sourceRanks P) 49).ult (allOneRankAtom (sourceRanks P) 41)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (41 : Fin 78) (14 : Fin 78)
    (49 : Fin 78) (13 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (3 : Fin 13) (4 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (33 : Fin 78) (22 : Fin 78) (14 : Fin 78)
    (41 : Fin 78) (13 : Fin 78) (49 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4528` (kalmanson). -/
theorem middleSource_h4528 :
    ((!((allOneRankAtom (sourceRanks P) 14 == allOneRankAtom (sourceRanks P) 49)) || ((allOneRankAtom (sourceRanks P) 13).ult (allOneRankAtom (sourceRanks P) 41)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (41 : Fin 78) (14 : Fin 78)
    (13 : Fin 78) (49 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (3 : Fin 13) (4 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (33 : Fin 78) (22 : Fin 78) (14 : Fin 78)
    (41 : Fin 78) (13 : Fin 78) (49 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4529` (kalmanson). -/
theorem middleSource_h4529 :
    ((!((allOneRankAtom (sourceRanks P) 15 == allOneRankAtom (sourceRanks P) 13)) || ((allOneRankAtom (sourceRanks P) 50).ult (allOneRankAtom (sourceRanks P) 35)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (35 : Fin 78) (15 : Fin 78)
    (50 : Fin 78) (13 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (3 : Fin 13) (5 : Fin 13) (6 : Fin 13)
    (by decide) (by decide) (by decide)
    (34 : Fin 78) (16 : Fin 78) (15 : Fin 78)
    (35 : Fin 78) (13 : Fin 78) (50 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4530` (kalmanson). -/
theorem middleSource_h4530 :
    ((!((allOneRankAtom (sourceRanks P) 15 == allOneRankAtom (sourceRanks P) 50)) || ((allOneRankAtom (sourceRanks P) 13).ult (allOneRankAtom (sourceRanks P) 35)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (35 : Fin 78) (15 : Fin 78)
    (13 : Fin 78) (50 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (3 : Fin 13) (5 : Fin 13) (6 : Fin 13)
    (by decide) (by decide) (by decide)
    (34 : Fin 78) (16 : Fin 78) (15 : Fin 78)
    (35 : Fin 78) (13 : Fin 78) (50 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4531` (kalmanson). -/
theorem middleSource_h4531 :
    ((!((allOneRankAtom (sourceRanks P) 35 == allOneRankAtom (sourceRanks P) 50)) || ((allOneRankAtom (sourceRanks P) 13).ult (allOneRankAtom (sourceRanks P) 15)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (15 : Fin 78) (35 : Fin 78)
    (13 : Fin 78) (50 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (3 : Fin 13) (5 : Fin 13) (6 : Fin 13)
    (by decide) (by decide) (by decide)
    (34 : Fin 78) (16 : Fin 78) (15 : Fin 78)
    (35 : Fin 78) (13 : Fin 78) (50 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4532` (kalmanson). -/
theorem middleSource_h4532 :
    ((!((allOneRankAtom (sourceRanks P) 15 == allOneRankAtom (sourceRanks P) 16)) || ((allOneRankAtom (sourceRanks P) 34).ult (allOneRankAtom (sourceRanks P) 35)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (35 : Fin 78) (15 : Fin 78)
    (34 : Fin 78) (16 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (3 : Fin 13) (5 : Fin 13) (6 : Fin 13)
    (by decide) (by decide) (by decide)
    (34 : Fin 78) (16 : Fin 78) (15 : Fin 78)
    (35 : Fin 78) (13 : Fin 78) (50 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4533` (kalmanson). -/
theorem middleSource_h4533 :
    ((!((allOneRankAtom (sourceRanks P) 35 == allOneRankAtom (sourceRanks P) 34)) || ((allOneRankAtom (sourceRanks P) 16).ult (allOneRankAtom (sourceRanks P) 15)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (15 : Fin 78) (35 : Fin 78)
    (16 : Fin 78) (34 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (3 : Fin 13) (5 : Fin 13) (6 : Fin 13)
    (by decide) (by decide) (by decide)
    (34 : Fin 78) (16 : Fin 78) (15 : Fin 78)
    (35 : Fin 78) (13 : Fin 78) (50 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4534` (kalmanson). -/
theorem middleSource_h4534 :
    ((!((allOneRankAtom (sourceRanks P) 15 == allOneRankAtom (sourceRanks P) 13)) || ((allOneRankAtom (sourceRanks P) 51).ult (allOneRankAtom (sourceRanks P) 36)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (36 : Fin 78) (15 : Fin 78)
    (51 : Fin 78) (13 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (3 : Fin 13) (5 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (34 : Fin 78) (17 : Fin 78) (15 : Fin 78)
    (36 : Fin 78) (13 : Fin 78) (51 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4535` (kalmanson). -/
theorem middleSource_h4535 :
    ((!((allOneRankAtom (sourceRanks P) 15 == allOneRankAtom (sourceRanks P) 51)) || ((allOneRankAtom (sourceRanks P) 13).ult (allOneRankAtom (sourceRanks P) 36)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (36 : Fin 78) (15 : Fin 78)
    (13 : Fin 78) (51 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (3 : Fin 13) (5 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (34 : Fin 78) (17 : Fin 78) (15 : Fin 78)
    (36 : Fin 78) (13 : Fin 78) (51 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4536` (kalmanson). -/
theorem middleSource_h4536 :
    ((!((allOneRankAtom (sourceRanks P) 36 == allOneRankAtom (sourceRanks P) 51)) || ((allOneRankAtom (sourceRanks P) 13).ult (allOneRankAtom (sourceRanks P) 15)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (15 : Fin 78) (36 : Fin 78)
    (13 : Fin 78) (51 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (3 : Fin 13) (5 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (34 : Fin 78) (17 : Fin 78) (15 : Fin 78)
    (36 : Fin 78) (13 : Fin 78) (51 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4537` (kalmanson). -/
theorem middleSource_h4537 :
    ((!((allOneRankAtom (sourceRanks P) 15 == allOneRankAtom (sourceRanks P) 17)) || ((allOneRankAtom (sourceRanks P) 34).ult (allOneRankAtom (sourceRanks P) 36)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (36 : Fin 78) (15 : Fin 78)
    (34 : Fin 78) (17 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (3 : Fin 13) (5 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (34 : Fin 78) (17 : Fin 78) (15 : Fin 78)
    (36 : Fin 78) (13 : Fin 78) (51 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4538` (kalmanson). -/
theorem middleSource_h4538 :
    ((!((allOneRankAtom (sourceRanks P) 15 == allOneRankAtom (sourceRanks P) 13)) || ((allOneRankAtom (sourceRanks P) 52).ult (allOneRankAtom (sourceRanks P) 37)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (37 : Fin 78) (15 : Fin 78)
    (52 : Fin 78) (13 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (3 : Fin 13) (5 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (34 : Fin 78) (18 : Fin 78) (15 : Fin 78)
    (37 : Fin 78) (13 : Fin 78) (52 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4539` (kalmanson). -/
theorem middleSource_h4539 :
    ((!((allOneRankAtom (sourceRanks P) 15 == allOneRankAtom (sourceRanks P) 52)) || ((allOneRankAtom (sourceRanks P) 13).ult (allOneRankAtom (sourceRanks P) 37)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (37 : Fin 78) (15 : Fin 78)
    (13 : Fin 78) (52 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (3 : Fin 13) (5 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (34 : Fin 78) (18 : Fin 78) (15 : Fin 78)
    (37 : Fin 78) (13 : Fin 78) (52 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4540` (kalmanson). -/
theorem middleSource_h4540 :
    ((!((allOneRankAtom (sourceRanks P) 37 == allOneRankAtom (sourceRanks P) 13)) || ((allOneRankAtom (sourceRanks P) 52).ult (allOneRankAtom (sourceRanks P) 15)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (15 : Fin 78) (37 : Fin 78)
    (52 : Fin 78) (13 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (3 : Fin 13) (5 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (34 : Fin 78) (18 : Fin 78) (15 : Fin 78)
    (37 : Fin 78) (13 : Fin 78) (52 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4541` (kalmanson). -/
theorem middleSource_h4541 :
    ((!((allOneRankAtom (sourceRanks P) 37 == allOneRankAtom (sourceRanks P) 52)) || ((allOneRankAtom (sourceRanks P) 13).ult (allOneRankAtom (sourceRanks P) 15)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (15 : Fin 78) (37 : Fin 78)
    (13 : Fin 78) (52 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (3 : Fin 13) (5 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (34 : Fin 78) (18 : Fin 78) (15 : Fin 78)
    (37 : Fin 78) (13 : Fin 78) (52 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4542` (kalmanson). -/
theorem middleSource_h4542 :
    ((!((allOneRankAtom (sourceRanks P) 15 == allOneRankAtom (sourceRanks P) 18)) || ((allOneRankAtom (sourceRanks P) 34).ult (allOneRankAtom (sourceRanks P) 37)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (37 : Fin 78) (15 : Fin 78)
    (34 : Fin 78) (18 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (3 : Fin 13) (5 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (34 : Fin 78) (18 : Fin 78) (15 : Fin 78)
    (37 : Fin 78) (13 : Fin 78) (52 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4543` (kalmanson). -/
theorem middleSource_h4543 :
    ((!((allOneRankAtom (sourceRanks P) 15 == allOneRankAtom (sourceRanks P) 34)) || ((allOneRankAtom (sourceRanks P) 18).ult (allOneRankAtom (sourceRanks P) 37)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (37 : Fin 78) (15 : Fin 78)
    (18 : Fin 78) (34 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (3 : Fin 13) (5 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (34 : Fin 78) (18 : Fin 78) (15 : Fin 78)
    (37 : Fin 78) (13 : Fin 78) (52 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

end

end ATailExactFiveCard13AllOneSourceIngressScratch
end Problem97
