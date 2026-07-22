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

/-- Candidate middle source assertion `h6464` (kalmanson). -/
theorem middleSource_h6464 :
    ((!((allOneRankAtom (sourceRanks P) 43 == allOneRankAtom (sourceRanks P) 44)) || ((allOneRankAtom (sourceRanks P) 50).ult (allOneRankAtom (sourceRanks P) 51)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (51 : Fin 78) (43 : Fin 78)
    (50 : Fin 78) (44 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (5 : Fin 13) (6 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (44 : Fin 78) (43 : Fin 78)
    (51 : Fin 78) (42 : Fin 78) (57 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6465` (kalmanson). -/
theorem middleSource_h6465 :
    ((!((allOneRankAtom (sourceRanks P) 43 == allOneRankAtom (sourceRanks P) 50)) || ((allOneRankAtom (sourceRanks P) 44).ult (allOneRankAtom (sourceRanks P) 51)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (51 : Fin 78) (43 : Fin 78)
    (44 : Fin 78) (50 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (5 : Fin 13) (6 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (44 : Fin 78) (43 : Fin 78)
    (51 : Fin 78) (42 : Fin 78) (57 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6466` (kalmanson). -/
theorem middleSource_h6466 :
    ((!((allOneRankAtom (sourceRanks P) 51 == allOneRankAtom (sourceRanks P) 50)) || ((allOneRankAtom (sourceRanks P) 44).ult (allOneRankAtom (sourceRanks P) 43)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (43 : Fin 78) (51 : Fin 78)
    (44 : Fin 78) (50 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (5 : Fin 13) (6 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (44 : Fin 78) (43 : Fin 78)
    (51 : Fin 78) (42 : Fin 78) (57 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6467` (kalmanson). -/
theorem middleSource_h6467 :
    ((!((allOneRankAtom (sourceRanks P) 43 == allOneRankAtom (sourceRanks P) 42)) || ((allOneRankAtom (sourceRanks P) 58).ult (allOneRankAtom (sourceRanks P) 52)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (52 : Fin 78) (43 : Fin 78)
    (58 : Fin 78) (42 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (5 : Fin 13) (6 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (45 : Fin 78) (43 : Fin 78)
    (52 : Fin 78) (42 : Fin 78) (58 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6468` (kalmanson). -/
theorem middleSource_h6468 :
    ((!((allOneRankAtom (sourceRanks P) 43 == allOneRankAtom (sourceRanks P) 58)) || ((allOneRankAtom (sourceRanks P) 42).ult (allOneRankAtom (sourceRanks P) 52)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (52 : Fin 78) (43 : Fin 78)
    (42 : Fin 78) (58 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (5 : Fin 13) (6 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (45 : Fin 78) (43 : Fin 78)
    (52 : Fin 78) (42 : Fin 78) (58 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6469` (kalmanson). -/
theorem middleSource_h6469 :
    ((!((allOneRankAtom (sourceRanks P) 52 == allOneRankAtom (sourceRanks P) 42)) || ((allOneRankAtom (sourceRanks P) 58).ult (allOneRankAtom (sourceRanks P) 43)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (43 : Fin 78) (52 : Fin 78)
    (58 : Fin 78) (42 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (5 : Fin 13) (6 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (45 : Fin 78) (43 : Fin 78)
    (52 : Fin 78) (42 : Fin 78) (58 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6470` (kalmanson). -/
theorem middleSource_h6470 :
    ((!((allOneRankAtom (sourceRanks P) 43 == allOneRankAtom (sourceRanks P) 45)) || ((allOneRankAtom (sourceRanks P) 50).ult (allOneRankAtom (sourceRanks P) 52)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (52 : Fin 78) (43 : Fin 78)
    (50 : Fin 78) (45 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (5 : Fin 13) (6 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (45 : Fin 78) (43 : Fin 78)
    (52 : Fin 78) (42 : Fin 78) (58 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6471` (kalmanson). -/
theorem middleSource_h6471 :
    ((!((allOneRankAtom (sourceRanks P) 43 == allOneRankAtom (sourceRanks P) 50)) || ((allOneRankAtom (sourceRanks P) 45).ult (allOneRankAtom (sourceRanks P) 52)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (52 : Fin 78) (43 : Fin 78)
    (45 : Fin 78) (50 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (5 : Fin 13) (6 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (45 : Fin 78) (43 : Fin 78)
    (52 : Fin 78) (42 : Fin 78) (58 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6472` (kalmanson). -/
theorem middleSource_h6472 :
    ((!((allOneRankAtom (sourceRanks P) 52 == allOneRankAtom (sourceRanks P) 45)) || ((allOneRankAtom (sourceRanks P) 50).ult (allOneRankAtom (sourceRanks P) 43)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (43 : Fin 78) (52 : Fin 78)
    (50 : Fin 78) (45 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (5 : Fin 13) (6 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (45 : Fin 78) (43 : Fin 78)
    (52 : Fin 78) (42 : Fin 78) (58 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6473` (kalmanson). -/
theorem middleSource_h6473 :
    ((!((allOneRankAtom (sourceRanks P) 52 == allOneRankAtom (sourceRanks P) 50)) || ((allOneRankAtom (sourceRanks P) 45).ult (allOneRankAtom (sourceRanks P) 43)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (43 : Fin 78) (52 : Fin 78)
    (45 : Fin 78) (50 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (5 : Fin 13) (6 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (45 : Fin 78) (43 : Fin 78)
    (52 : Fin 78) (42 : Fin 78) (58 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6474` (kalmanson). -/
theorem middleSource_h6474 :
    ((!((allOneRankAtom (sourceRanks P) 43 == allOneRankAtom (sourceRanks P) 42)) || ((allOneRankAtom (sourceRanks P) 59).ult (allOneRankAtom (sourceRanks P) 53)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (53 : Fin 78) (43 : Fin 78)
    (59 : Fin 78) (42 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (5 : Fin 13) (6 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (46 : Fin 78) (43 : Fin 78)
    (53 : Fin 78) (42 : Fin 78) (59 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6475` (kalmanson). -/
theorem middleSource_h6475 :
    ((!((allOneRankAtom (sourceRanks P) 43 == allOneRankAtom (sourceRanks P) 59)) || ((allOneRankAtom (sourceRanks P) 42).ult (allOneRankAtom (sourceRanks P) 53)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (53 : Fin 78) (43 : Fin 78)
    (42 : Fin 78) (59 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (5 : Fin 13) (6 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (46 : Fin 78) (43 : Fin 78)
    (53 : Fin 78) (42 : Fin 78) (59 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6476` (kalmanson). -/
theorem middleSource_h6476 :
    ((!((allOneRankAtom (sourceRanks P) 53 == allOneRankAtom (sourceRanks P) 42)) || ((allOneRankAtom (sourceRanks P) 59).ult (allOneRankAtom (sourceRanks P) 43)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (43 : Fin 78) (53 : Fin 78)
    (59 : Fin 78) (42 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (5 : Fin 13) (6 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (46 : Fin 78) (43 : Fin 78)
    (53 : Fin 78) (42 : Fin 78) (59 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6477` (kalmanson). -/
theorem middleSource_h6477 :
    ((!((allOneRankAtom (sourceRanks P) 53 == allOneRankAtom (sourceRanks P) 59)) || ((allOneRankAtom (sourceRanks P) 42).ult (allOneRankAtom (sourceRanks P) 43)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (43 : Fin 78) (53 : Fin 78)
    (42 : Fin 78) (59 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (5 : Fin 13) (6 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (46 : Fin 78) (43 : Fin 78)
    (53 : Fin 78) (42 : Fin 78) (59 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6478` (kalmanson). -/
theorem middleSource_h6478 :
    ((!((allOneRankAtom (sourceRanks P) 43 == allOneRankAtom (sourceRanks P) 46)) || ((allOneRankAtom (sourceRanks P) 50).ult (allOneRankAtom (sourceRanks P) 53)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (53 : Fin 78) (43 : Fin 78)
    (50 : Fin 78) (46 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (5 : Fin 13) (6 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (46 : Fin 78) (43 : Fin 78)
    (53 : Fin 78) (42 : Fin 78) (59 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6479` (kalmanson). -/
theorem middleSource_h6479 :
    ((!((allOneRankAtom (sourceRanks P) 43 == allOneRankAtom (sourceRanks P) 50)) || ((allOneRankAtom (sourceRanks P) 46).ult (allOneRankAtom (sourceRanks P) 53)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (53 : Fin 78) (43 : Fin 78)
    (46 : Fin 78) (50 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (5 : Fin 13) (6 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (46 : Fin 78) (43 : Fin 78)
    (53 : Fin 78) (42 : Fin 78) (59 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6480` (kalmanson). -/
theorem middleSource_h6480 :
    ((!((allOneRankAtom (sourceRanks P) 53 == allOneRankAtom (sourceRanks P) 46)) || ((allOneRankAtom (sourceRanks P) 50).ult (allOneRankAtom (sourceRanks P) 43)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (43 : Fin 78) (53 : Fin 78)
    (50 : Fin 78) (46 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (5 : Fin 13) (6 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (46 : Fin 78) (43 : Fin 78)
    (53 : Fin 78) (42 : Fin 78) (59 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6481` (kalmanson). -/
theorem middleSource_h6481 :
    ((!((allOneRankAtom (sourceRanks P) 53 == allOneRankAtom (sourceRanks P) 50)) || ((allOneRankAtom (sourceRanks P) 46).ult (allOneRankAtom (sourceRanks P) 43)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (43 : Fin 78) (53 : Fin 78)
    (46 : Fin 78) (50 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (5 : Fin 13) (6 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (46 : Fin 78) (43 : Fin 78)
    (53 : Fin 78) (42 : Fin 78) (59 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6482` (kalmanson). -/
theorem middleSource_h6482 :
    ((!((allOneRankAtom (sourceRanks P) 43 == allOneRankAtom (sourceRanks P) 42)) || ((allOneRankAtom (sourceRanks P) 60).ult (allOneRankAtom (sourceRanks P) 54)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (54 : Fin 78) (43 : Fin 78)
    (60 : Fin 78) (42 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (5 : Fin 13) (6 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (47 : Fin 78) (43 : Fin 78)
    (54 : Fin 78) (42 : Fin 78) (60 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6483` (kalmanson). -/
theorem middleSource_h6483 :
    ((!((allOneRankAtom (sourceRanks P) 43 == allOneRankAtom (sourceRanks P) 60)) || ((allOneRankAtom (sourceRanks P) 42).ult (allOneRankAtom (sourceRanks P) 54)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (54 : Fin 78) (43 : Fin 78)
    (42 : Fin 78) (60 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (5 : Fin 13) (6 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (47 : Fin 78) (43 : Fin 78)
    (54 : Fin 78) (42 : Fin 78) (60 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6484` (kalmanson). -/
theorem middleSource_h6484 :
    ((!((allOneRankAtom (sourceRanks P) 54 == allOneRankAtom (sourceRanks P) 42)) || ((allOneRankAtom (sourceRanks P) 60).ult (allOneRankAtom (sourceRanks P) 43)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (43 : Fin 78) (54 : Fin 78)
    (60 : Fin 78) (42 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (5 : Fin 13) (6 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (47 : Fin 78) (43 : Fin 78)
    (54 : Fin 78) (42 : Fin 78) (60 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6485` (kalmanson). -/
theorem middleSource_h6485 :
    ((!((allOneRankAtom (sourceRanks P) 54 == allOneRankAtom (sourceRanks P) 60)) || ((allOneRankAtom (sourceRanks P) 42).ult (allOneRankAtom (sourceRanks P) 43)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (43 : Fin 78) (54 : Fin 78)
    (42 : Fin 78) (60 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (5 : Fin 13) (6 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (47 : Fin 78) (43 : Fin 78)
    (54 : Fin 78) (42 : Fin 78) (60 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6486` (kalmanson). -/
theorem middleSource_h6486 :
    ((!((allOneRankAtom (sourceRanks P) 43 == allOneRankAtom (sourceRanks P) 47)) || ((allOneRankAtom (sourceRanks P) 50).ult (allOneRankAtom (sourceRanks P) 54)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (54 : Fin 78) (43 : Fin 78)
    (50 : Fin 78) (47 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (5 : Fin 13) (6 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (47 : Fin 78) (43 : Fin 78)
    (54 : Fin 78) (42 : Fin 78) (60 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6487` (kalmanson). -/
theorem middleSource_h6487 :
    ((!((allOneRankAtom (sourceRanks P) 43 == allOneRankAtom (sourceRanks P) 50)) || ((allOneRankAtom (sourceRanks P) 47).ult (allOneRankAtom (sourceRanks P) 54)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (54 : Fin 78) (43 : Fin 78)
    (47 : Fin 78) (50 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (5 : Fin 13) (6 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (47 : Fin 78) (43 : Fin 78)
    (54 : Fin 78) (42 : Fin 78) (60 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6488` (kalmanson). -/
theorem middleSource_h6488 :
    ((!((allOneRankAtom (sourceRanks P) 54 == allOneRankAtom (sourceRanks P) 47)) || ((allOneRankAtom (sourceRanks P) 50).ult (allOneRankAtom (sourceRanks P) 43)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (43 : Fin 78) (54 : Fin 78)
    (50 : Fin 78) (47 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (5 : Fin 13) (6 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (47 : Fin 78) (43 : Fin 78)
    (54 : Fin 78) (42 : Fin 78) (60 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6489` (kalmanson). -/
theorem middleSource_h6489 :
    ((!((allOneRankAtom (sourceRanks P) 54 == allOneRankAtom (sourceRanks P) 50)) || ((allOneRankAtom (sourceRanks P) 47).ult (allOneRankAtom (sourceRanks P) 43)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (43 : Fin 78) (54 : Fin 78)
    (47 : Fin 78) (50 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (5 : Fin 13) (6 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (47 : Fin 78) (43 : Fin 78)
    (54 : Fin 78) (42 : Fin 78) (60 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6490` (kalmanson). -/
theorem middleSource_h6490 :
    ((!((allOneRankAtom (sourceRanks P) 43 == allOneRankAtom (sourceRanks P) 42)) || ((allOneRankAtom (sourceRanks P) 61).ult (allOneRankAtom (sourceRanks P) 55)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (55 : Fin 78) (43 : Fin 78)
    (61 : Fin 78) (42 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (5 : Fin 13) (6 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (48 : Fin 78) (43 : Fin 78)
    (55 : Fin 78) (42 : Fin 78) (61 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6491` (kalmanson). -/
theorem middleSource_h6491 :
    ((!((allOneRankAtom (sourceRanks P) 43 == allOneRankAtom (sourceRanks P) 61)) || ((allOneRankAtom (sourceRanks P) 42).ult (allOneRankAtom (sourceRanks P) 55)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (55 : Fin 78) (43 : Fin 78)
    (42 : Fin 78) (61 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (5 : Fin 13) (6 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (48 : Fin 78) (43 : Fin 78)
    (55 : Fin 78) (42 : Fin 78) (61 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6492` (kalmanson). -/
theorem middleSource_h6492 :
    ((!((allOneRankAtom (sourceRanks P) 55 == allOneRankAtom (sourceRanks P) 42)) || ((allOneRankAtom (sourceRanks P) 61).ult (allOneRankAtom (sourceRanks P) 43)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (43 : Fin 78) (55 : Fin 78)
    (61 : Fin 78) (42 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (5 : Fin 13) (6 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (48 : Fin 78) (43 : Fin 78)
    (55 : Fin 78) (42 : Fin 78) (61 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6493` (kalmanson). -/
theorem middleSource_h6493 :
    ((!((allOneRankAtom (sourceRanks P) 55 == allOneRankAtom (sourceRanks P) 61)) || ((allOneRankAtom (sourceRanks P) 42).ult (allOneRankAtom (sourceRanks P) 43)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (43 : Fin 78) (55 : Fin 78)
    (42 : Fin 78) (61 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (5 : Fin 13) (6 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (48 : Fin 78) (43 : Fin 78)
    (55 : Fin 78) (42 : Fin 78) (61 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6494` (kalmanson). -/
theorem middleSource_h6494 :
    ((!((allOneRankAtom (sourceRanks P) 43 == allOneRankAtom (sourceRanks P) 48)) || ((allOneRankAtom (sourceRanks P) 50).ult (allOneRankAtom (sourceRanks P) 55)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (55 : Fin 78) (43 : Fin 78)
    (50 : Fin 78) (48 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (5 : Fin 13) (6 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (48 : Fin 78) (43 : Fin 78)
    (55 : Fin 78) (42 : Fin 78) (61 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6495` (kalmanson). -/
theorem middleSource_h6495 :
    ((!((allOneRankAtom (sourceRanks P) 43 == allOneRankAtom (sourceRanks P) 50)) || ((allOneRankAtom (sourceRanks P) 48).ult (allOneRankAtom (sourceRanks P) 55)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (55 : Fin 78) (43 : Fin 78)
    (48 : Fin 78) (50 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (5 : Fin 13) (6 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (48 : Fin 78) (43 : Fin 78)
    (55 : Fin 78) (42 : Fin 78) (61 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6496` (kalmanson). -/
theorem middleSource_h6496 :
    ((!((allOneRankAtom (sourceRanks P) 55 == allOneRankAtom (sourceRanks P) 48)) || ((allOneRankAtom (sourceRanks P) 50).ult (allOneRankAtom (sourceRanks P) 43)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (43 : Fin 78) (55 : Fin 78)
    (50 : Fin 78) (48 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (5 : Fin 13) (6 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (48 : Fin 78) (43 : Fin 78)
    (55 : Fin 78) (42 : Fin 78) (61 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6497` (kalmanson). -/
theorem middleSource_h6497 :
    ((!((allOneRankAtom (sourceRanks P) 55 == allOneRankAtom (sourceRanks P) 50)) || ((allOneRankAtom (sourceRanks P) 48).ult (allOneRankAtom (sourceRanks P) 43)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (43 : Fin 78) (55 : Fin 78)
    (48 : Fin 78) (50 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (5 : Fin 13) (6 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (48 : Fin 78) (43 : Fin 78)
    (55 : Fin 78) (42 : Fin 78) (61 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6498` (kalmanson). -/
theorem middleSource_h6498 :
    ((!((allOneRankAtom (sourceRanks P) 43 == allOneRankAtom (sourceRanks P) 42)) || ((allOneRankAtom (sourceRanks P) 62).ult (allOneRankAtom (sourceRanks P) 56)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (56 : Fin 78) (43 : Fin 78)
    (62 : Fin 78) (42 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (5 : Fin 13) (6 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (49 : Fin 78) (43 : Fin 78)
    (56 : Fin 78) (42 : Fin 78) (62 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6499` (kalmanson). -/
theorem middleSource_h6499 :
    ((!((allOneRankAtom (sourceRanks P) 43 == allOneRankAtom (sourceRanks P) 62)) || ((allOneRankAtom (sourceRanks P) 42).ult (allOneRankAtom (sourceRanks P) 56)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (56 : Fin 78) (43 : Fin 78)
    (42 : Fin 78) (62 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (5 : Fin 13) (6 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (49 : Fin 78) (43 : Fin 78)
    (56 : Fin 78) (42 : Fin 78) (62 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6500` (kalmanson). -/
theorem middleSource_h6500 :
    ((!((allOneRankAtom (sourceRanks P) 56 == allOneRankAtom (sourceRanks P) 42)) || ((allOneRankAtom (sourceRanks P) 62).ult (allOneRankAtom (sourceRanks P) 43)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (43 : Fin 78) (56 : Fin 78)
    (62 : Fin 78) (42 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (5 : Fin 13) (6 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (49 : Fin 78) (43 : Fin 78)
    (56 : Fin 78) (42 : Fin 78) (62 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6501` (kalmanson). -/
theorem middleSource_h6501 :
    ((!((allOneRankAtom (sourceRanks P) 56 == allOneRankAtom (sourceRanks P) 62)) || ((allOneRankAtom (sourceRanks P) 42).ult (allOneRankAtom (sourceRanks P) 43)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (43 : Fin 78) (56 : Fin 78)
    (42 : Fin 78) (62 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (5 : Fin 13) (6 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (49 : Fin 78) (43 : Fin 78)
    (56 : Fin 78) (42 : Fin 78) (62 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6502` (kalmanson). -/
theorem middleSource_h6502 :
    ((!((allOneRankAtom (sourceRanks P) 43 == allOneRankAtom (sourceRanks P) 49)) || ((allOneRankAtom (sourceRanks P) 50).ult (allOneRankAtom (sourceRanks P) 56)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (56 : Fin 78) (43 : Fin 78)
    (50 : Fin 78) (49 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (5 : Fin 13) (6 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (49 : Fin 78) (43 : Fin 78)
    (56 : Fin 78) (42 : Fin 78) (62 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6503` (kalmanson). -/
theorem middleSource_h6503 :
    ((!((allOneRankAtom (sourceRanks P) 43 == allOneRankAtom (sourceRanks P) 50)) || ((allOneRankAtom (sourceRanks P) 49).ult (allOneRankAtom (sourceRanks P) 56)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (56 : Fin 78) (43 : Fin 78)
    (49 : Fin 78) (50 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (5 : Fin 13) (6 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (49 : Fin 78) (43 : Fin 78)
    (56 : Fin 78) (42 : Fin 78) (62 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6504` (kalmanson). -/
theorem middleSource_h6504 :
    ((!((allOneRankAtom (sourceRanks P) 56 == allOneRankAtom (sourceRanks P) 49)) || ((allOneRankAtom (sourceRanks P) 50).ult (allOneRankAtom (sourceRanks P) 43)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (43 : Fin 78) (56 : Fin 78)
    (50 : Fin 78) (49 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (5 : Fin 13) (6 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (49 : Fin 78) (43 : Fin 78)
    (56 : Fin 78) (42 : Fin 78) (62 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6505` (kalmanson). -/
theorem middleSource_h6505 :
    ((!((allOneRankAtom (sourceRanks P) 56 == allOneRankAtom (sourceRanks P) 50)) || ((allOneRankAtom (sourceRanks P) 49).ult (allOneRankAtom (sourceRanks P) 43)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (43 : Fin 78) (56 : Fin 78)
    (49 : Fin 78) (50 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (5 : Fin 13) (6 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (49 : Fin 78) (43 : Fin 78)
    (56 : Fin 78) (42 : Fin 78) (62 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6506` (kalmanson). -/
theorem middleSource_h6506 :
    ((!((allOneRankAtom (sourceRanks P) 44 == allOneRankAtom (sourceRanks P) 42)) || ((allOneRankAtom (sourceRanks P) 63).ult (allOneRankAtom (sourceRanks P) 52)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (52 : Fin 78) (44 : Fin 78)
    (63 : Fin 78) (42 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (5 : Fin 13) (7 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (51 : Fin 78) (45 : Fin 78) (44 : Fin 78)
    (52 : Fin 78) (42 : Fin 78) (63 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6507` (kalmanson). -/
theorem middleSource_h6507 :
    ((!((allOneRankAtom (sourceRanks P) 52 == allOneRankAtom (sourceRanks P) 42)) || ((allOneRankAtom (sourceRanks P) 63).ult (allOneRankAtom (sourceRanks P) 44)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (44 : Fin 78) (52 : Fin 78)
    (63 : Fin 78) (42 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (5 : Fin 13) (7 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (51 : Fin 78) (45 : Fin 78) (44 : Fin 78)
    (52 : Fin 78) (42 : Fin 78) (63 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6508` (kalmanson). -/
theorem middleSource_h6508 :
    ((!((allOneRankAtom (sourceRanks P) 44 == allOneRankAtom (sourceRanks P) 45)) || ((allOneRankAtom (sourceRanks P) 51).ult (allOneRankAtom (sourceRanks P) 52)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (52 : Fin 78) (44 : Fin 78)
    (51 : Fin 78) (45 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (5 : Fin 13) (7 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (51 : Fin 78) (45 : Fin 78) (44 : Fin 78)
    (52 : Fin 78) (42 : Fin 78) (63 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6509` (kalmanson). -/
theorem middleSource_h6509 :
    ((!((allOneRankAtom (sourceRanks P) 44 == allOneRankAtom (sourceRanks P) 51)) || ((allOneRankAtom (sourceRanks P) 45).ult (allOneRankAtom (sourceRanks P) 52)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (52 : Fin 78) (44 : Fin 78)
    (45 : Fin 78) (51 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (5 : Fin 13) (7 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (51 : Fin 78) (45 : Fin 78) (44 : Fin 78)
    (52 : Fin 78) (42 : Fin 78) (63 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6510` (kalmanson). -/
theorem middleSource_h6510 :
    ((!((allOneRankAtom (sourceRanks P) 52 == allOneRankAtom (sourceRanks P) 45)) || ((allOneRankAtom (sourceRanks P) 51).ult (allOneRankAtom (sourceRanks P) 44)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (44 : Fin 78) (52 : Fin 78)
    (51 : Fin 78) (45 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (5 : Fin 13) (7 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (51 : Fin 78) (45 : Fin 78) (44 : Fin 78)
    (52 : Fin 78) (42 : Fin 78) (63 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6511` (kalmanson). -/
theorem middleSource_h6511 :
    ((!((allOneRankAtom (sourceRanks P) 52 == allOneRankAtom (sourceRanks P) 51)) || ((allOneRankAtom (sourceRanks P) 45).ult (allOneRankAtom (sourceRanks P) 44)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (44 : Fin 78) (52 : Fin 78)
    (45 : Fin 78) (51 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (5 : Fin 13) (7 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (51 : Fin 78) (45 : Fin 78) (44 : Fin 78)
    (52 : Fin 78) (42 : Fin 78) (63 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6512` (kalmanson). -/
theorem middleSource_h6512 :
    ((!((allOneRankAtom (sourceRanks P) 44 == allOneRankAtom (sourceRanks P) 42)) || ((allOneRankAtom (sourceRanks P) 64).ult (allOneRankAtom (sourceRanks P) 53)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (53 : Fin 78) (44 : Fin 78)
    (64 : Fin 78) (42 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (5 : Fin 13) (7 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (51 : Fin 78) (46 : Fin 78) (44 : Fin 78)
    (53 : Fin 78) (42 : Fin 78) (64 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6513` (kalmanson). -/
theorem middleSource_h6513 :
    ((!((allOneRankAtom (sourceRanks P) 44 == allOneRankAtom (sourceRanks P) 64)) || ((allOneRankAtom (sourceRanks P) 42).ult (allOneRankAtom (sourceRanks P) 53)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (53 : Fin 78) (44 : Fin 78)
    (42 : Fin 78) (64 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (5 : Fin 13) (7 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (51 : Fin 78) (46 : Fin 78) (44 : Fin 78)
    (53 : Fin 78) (42 : Fin 78) (64 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6514` (kalmanson). -/
theorem middleSource_h6514 :
    ((!((allOneRankAtom (sourceRanks P) 53 == allOneRankAtom (sourceRanks P) 42)) || ((allOneRankAtom (sourceRanks P) 64).ult (allOneRankAtom (sourceRanks P) 44)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (44 : Fin 78) (53 : Fin 78)
    (64 : Fin 78) (42 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (5 : Fin 13) (7 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (51 : Fin 78) (46 : Fin 78) (44 : Fin 78)
    (53 : Fin 78) (42 : Fin 78) (64 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6515` (kalmanson). -/
theorem middleSource_h6515 :
    ((!((allOneRankAtom (sourceRanks P) 53 == allOneRankAtom (sourceRanks P) 64)) || ((allOneRankAtom (sourceRanks P) 42).ult (allOneRankAtom (sourceRanks P) 44)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (44 : Fin 78) (53 : Fin 78)
    (42 : Fin 78) (64 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (5 : Fin 13) (7 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (51 : Fin 78) (46 : Fin 78) (44 : Fin 78)
    (53 : Fin 78) (42 : Fin 78) (64 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6516` (kalmanson). -/
theorem middleSource_h6516 :
    ((!((allOneRankAtom (sourceRanks P) 44 == allOneRankAtom (sourceRanks P) 46)) || ((allOneRankAtom (sourceRanks P) 51).ult (allOneRankAtom (sourceRanks P) 53)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (53 : Fin 78) (44 : Fin 78)
    (51 : Fin 78) (46 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (5 : Fin 13) (7 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (51 : Fin 78) (46 : Fin 78) (44 : Fin 78)
    (53 : Fin 78) (42 : Fin 78) (64 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6517` (kalmanson). -/
theorem middleSource_h6517 :
    ((!((allOneRankAtom (sourceRanks P) 44 == allOneRankAtom (sourceRanks P) 51)) || ((allOneRankAtom (sourceRanks P) 46).ult (allOneRankAtom (sourceRanks P) 53)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (53 : Fin 78) (44 : Fin 78)
    (46 : Fin 78) (51 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (5 : Fin 13) (7 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (51 : Fin 78) (46 : Fin 78) (44 : Fin 78)
    (53 : Fin 78) (42 : Fin 78) (64 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6518` (kalmanson). -/
theorem middleSource_h6518 :
    ((!((allOneRankAtom (sourceRanks P) 53 == allOneRankAtom (sourceRanks P) 46)) || ((allOneRankAtom (sourceRanks P) 51).ult (allOneRankAtom (sourceRanks P) 44)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (44 : Fin 78) (53 : Fin 78)
    (51 : Fin 78) (46 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (5 : Fin 13) (7 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (51 : Fin 78) (46 : Fin 78) (44 : Fin 78)
    (53 : Fin 78) (42 : Fin 78) (64 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6519` (kalmanson). -/
theorem middleSource_h6519 :
    ((!((allOneRankAtom (sourceRanks P) 53 == allOneRankAtom (sourceRanks P) 51)) || ((allOneRankAtom (sourceRanks P) 46).ult (allOneRankAtom (sourceRanks P) 44)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (44 : Fin 78) (53 : Fin 78)
    (46 : Fin 78) (51 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (5 : Fin 13) (7 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (51 : Fin 78) (46 : Fin 78) (44 : Fin 78)
    (53 : Fin 78) (42 : Fin 78) (64 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6520` (kalmanson). -/
theorem middleSource_h6520 :
    ((!((allOneRankAtom (sourceRanks P) 44 == allOneRankAtom (sourceRanks P) 42)) || ((allOneRankAtom (sourceRanks P) 65).ult (allOneRankAtom (sourceRanks P) 54)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (54 : Fin 78) (44 : Fin 78)
    (65 : Fin 78) (42 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (5 : Fin 13) (7 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (51 : Fin 78) (47 : Fin 78) (44 : Fin 78)
    (54 : Fin 78) (42 : Fin 78) (65 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6521` (kalmanson). -/
theorem middleSource_h6521 :
    ((!((allOneRankAtom (sourceRanks P) 54 == allOneRankAtom (sourceRanks P) 42)) || ((allOneRankAtom (sourceRanks P) 65).ult (allOneRankAtom (sourceRanks P) 44)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (44 : Fin 78) (54 : Fin 78)
    (65 : Fin 78) (42 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (5 : Fin 13) (7 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (51 : Fin 78) (47 : Fin 78) (44 : Fin 78)
    (54 : Fin 78) (42 : Fin 78) (65 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6522` (kalmanson). -/
theorem middleSource_h6522 :
    ((!((allOneRankAtom (sourceRanks P) 54 == allOneRankAtom (sourceRanks P) 65)) || ((allOneRankAtom (sourceRanks P) 42).ult (allOneRankAtom (sourceRanks P) 44)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (44 : Fin 78) (54 : Fin 78)
    (42 : Fin 78) (65 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (5 : Fin 13) (7 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (51 : Fin 78) (47 : Fin 78) (44 : Fin 78)
    (54 : Fin 78) (42 : Fin 78) (65 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6523` (kalmanson). -/
theorem middleSource_h6523 :
    ((!((allOneRankAtom (sourceRanks P) 44 == allOneRankAtom (sourceRanks P) 47)) || ((allOneRankAtom (sourceRanks P) 51).ult (allOneRankAtom (sourceRanks P) 54)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (54 : Fin 78) (44 : Fin 78)
    (51 : Fin 78) (47 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (5 : Fin 13) (7 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (51 : Fin 78) (47 : Fin 78) (44 : Fin 78)
    (54 : Fin 78) (42 : Fin 78) (65 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6524` (kalmanson). -/
theorem middleSource_h6524 :
    ((!((allOneRankAtom (sourceRanks P) 44 == allOneRankAtom (sourceRanks P) 51)) || ((allOneRankAtom (sourceRanks P) 47).ult (allOneRankAtom (sourceRanks P) 54)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (54 : Fin 78) (44 : Fin 78)
    (47 : Fin 78) (51 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (5 : Fin 13) (7 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (51 : Fin 78) (47 : Fin 78) (44 : Fin 78)
    (54 : Fin 78) (42 : Fin 78) (65 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6525` (kalmanson). -/
theorem middleSource_h6525 :
    ((!((allOneRankAtom (sourceRanks P) 54 == allOneRankAtom (sourceRanks P) 47)) || ((allOneRankAtom (sourceRanks P) 51).ult (allOneRankAtom (sourceRanks P) 44)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (44 : Fin 78) (54 : Fin 78)
    (51 : Fin 78) (47 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (5 : Fin 13) (7 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (51 : Fin 78) (47 : Fin 78) (44 : Fin 78)
    (54 : Fin 78) (42 : Fin 78) (65 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6526` (kalmanson). -/
theorem middleSource_h6526 :
    ((!((allOneRankAtom (sourceRanks P) 54 == allOneRankAtom (sourceRanks P) 51)) || ((allOneRankAtom (sourceRanks P) 47).ult (allOneRankAtom (sourceRanks P) 44)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (44 : Fin 78) (54 : Fin 78)
    (47 : Fin 78) (51 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (5 : Fin 13) (7 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (51 : Fin 78) (47 : Fin 78) (44 : Fin 78)
    (54 : Fin 78) (42 : Fin 78) (65 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6527` (kalmanson). -/
theorem middleSource_h6527 :
    ((!((allOneRankAtom (sourceRanks P) 44 == allOneRankAtom (sourceRanks P) 42)) || ((allOneRankAtom (sourceRanks P) 66).ult (allOneRankAtom (sourceRanks P) 55)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (55 : Fin 78) (44 : Fin 78)
    (66 : Fin 78) (42 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (5 : Fin 13) (7 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (51 : Fin 78) (48 : Fin 78) (44 : Fin 78)
    (55 : Fin 78) (42 : Fin 78) (66 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

end

end ATailExactFiveCard13AllOneSourceIngressScratch
end Problem97
