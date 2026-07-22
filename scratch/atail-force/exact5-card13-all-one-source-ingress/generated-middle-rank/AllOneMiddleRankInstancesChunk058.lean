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

/-- Candidate middle source assertion `h3712` (kalmanson). -/
theorem middleSource_h3712 :
    ((!((allOneRankAtom (sourceRanks P) 45 == allOneRankAtom (sourceRanks P) 3)) || ((allOneRankAtom (sourceRanks P) 52).ult (allOneRankAtom (sourceRanks P) 4)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (4 : Fin 78) (45 : Fin 78)
    (52 : Fin 78) (3 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (5 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (7 : Fin 78) (4 : Fin 78)
    (45 : Fin 78) (3 : Fin 78) (52 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3713` (kalmanson). -/
theorem middleSource_h3713 :
    ((!((allOneRankAtom (sourceRanks P) 45 == allOneRankAtom (sourceRanks P) 52)) || ((allOneRankAtom (sourceRanks P) 3).ult (allOneRankAtom (sourceRanks P) 4)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (4 : Fin 78) (45 : Fin 78)
    (3 : Fin 78) (52 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (5 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (7 : Fin 78) (4 : Fin 78)
    (45 : Fin 78) (3 : Fin 78) (52 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3714` (kalmanson). -/
theorem middleSource_h3714 :
    ((!((allOneRankAtom (sourceRanks P) 4 == allOneRankAtom (sourceRanks P) 7)) || ((allOneRankAtom (sourceRanks P) 42).ult (allOneRankAtom (sourceRanks P) 45)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (45 : Fin 78) (4 : Fin 78)
    (42 : Fin 78) (7 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (5 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (7 : Fin 78) (4 : Fin 78)
    (45 : Fin 78) (3 : Fin 78) (52 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3715` (kalmanson). -/
theorem middleSource_h3715 :
    ((!((allOneRankAtom (sourceRanks P) 4 == allOneRankAtom (sourceRanks P) 42)) || ((allOneRankAtom (sourceRanks P) 7).ult (allOneRankAtom (sourceRanks P) 45)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (45 : Fin 78) (4 : Fin 78)
    (7 : Fin 78) (42 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (5 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (7 : Fin 78) (4 : Fin 78)
    (45 : Fin 78) (3 : Fin 78) (52 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3716` (kalmanson). -/
theorem middleSource_h3716 :
    ((!((allOneRankAtom (sourceRanks P) 45 == allOneRankAtom (sourceRanks P) 7)) || ((allOneRankAtom (sourceRanks P) 42).ult (allOneRankAtom (sourceRanks P) 4)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (4 : Fin 78) (45 : Fin 78)
    (42 : Fin 78) (7 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (5 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (7 : Fin 78) (4 : Fin 78)
    (45 : Fin 78) (3 : Fin 78) (52 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3717` (kalmanson). -/
theorem middleSource_h3717 :
    ((!((allOneRankAtom (sourceRanks P) 45 == allOneRankAtom (sourceRanks P) 42)) || ((allOneRankAtom (sourceRanks P) 7).ult (allOneRankAtom (sourceRanks P) 4)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (4 : Fin 78) (45 : Fin 78)
    (7 : Fin 78) (42 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (5 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (7 : Fin 78) (4 : Fin 78)
    (45 : Fin 78) (3 : Fin 78) (52 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3718` (kalmanson). -/
theorem middleSource_h3718 :
    ((!((allOneRankAtom (sourceRanks P) 4 == allOneRankAtom (sourceRanks P) 3)) || ((allOneRankAtom (sourceRanks P) 53).ult (allOneRankAtom (sourceRanks P) 46)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (46 : Fin 78) (4 : Fin 78)
    (53 : Fin 78) (3 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (5 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (8 : Fin 78) (4 : Fin 78)
    (46 : Fin 78) (3 : Fin 78) (53 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3719` (kalmanson). -/
theorem middleSource_h3719 :
    ((!((allOneRankAtom (sourceRanks P) 4 == allOneRankAtom (sourceRanks P) 53)) || ((allOneRankAtom (sourceRanks P) 3).ult (allOneRankAtom (sourceRanks P) 46)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (46 : Fin 78) (4 : Fin 78)
    (3 : Fin 78) (53 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (5 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (8 : Fin 78) (4 : Fin 78)
    (46 : Fin 78) (3 : Fin 78) (53 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3720` (kalmanson). -/
theorem middleSource_h3720 :
    ((!((allOneRankAtom (sourceRanks P) 46 == allOneRankAtom (sourceRanks P) 3)) || ((allOneRankAtom (sourceRanks P) 53).ult (allOneRankAtom (sourceRanks P) 4)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (4 : Fin 78) (46 : Fin 78)
    (53 : Fin 78) (3 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (5 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (8 : Fin 78) (4 : Fin 78)
    (46 : Fin 78) (3 : Fin 78) (53 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3721` (kalmanson). -/
theorem middleSource_h3721 :
    ((!((allOneRankAtom (sourceRanks P) 46 == allOneRankAtom (sourceRanks P) 53)) || ((allOneRankAtom (sourceRanks P) 3).ult (allOneRankAtom (sourceRanks P) 4)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (4 : Fin 78) (46 : Fin 78)
    (3 : Fin 78) (53 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (5 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (8 : Fin 78) (4 : Fin 78)
    (46 : Fin 78) (3 : Fin 78) (53 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3722` (kalmanson). -/
theorem middleSource_h3722 :
    ((!((allOneRankAtom (sourceRanks P) 4 == allOneRankAtom (sourceRanks P) 8)) || ((allOneRankAtom (sourceRanks P) 42).ult (allOneRankAtom (sourceRanks P) 46)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (46 : Fin 78) (4 : Fin 78)
    (42 : Fin 78) (8 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (5 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (8 : Fin 78) (4 : Fin 78)
    (46 : Fin 78) (3 : Fin 78) (53 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3723` (kalmanson). -/
theorem middleSource_h3723 :
    ((!((allOneRankAtom (sourceRanks P) 4 == allOneRankAtom (sourceRanks P) 42)) || ((allOneRankAtom (sourceRanks P) 8).ult (allOneRankAtom (sourceRanks P) 46)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (46 : Fin 78) (4 : Fin 78)
    (8 : Fin 78) (42 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (5 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (8 : Fin 78) (4 : Fin 78)
    (46 : Fin 78) (3 : Fin 78) (53 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3724` (kalmanson). -/
theorem middleSource_h3724 :
    ((!((allOneRankAtom (sourceRanks P) 46 == allOneRankAtom (sourceRanks P) 8)) || ((allOneRankAtom (sourceRanks P) 42).ult (allOneRankAtom (sourceRanks P) 4)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (4 : Fin 78) (46 : Fin 78)
    (42 : Fin 78) (8 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (5 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (8 : Fin 78) (4 : Fin 78)
    (46 : Fin 78) (3 : Fin 78) (53 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3725` (kalmanson). -/
theorem middleSource_h3725 :
    ((!((allOneRankAtom (sourceRanks P) 46 == allOneRankAtom (sourceRanks P) 42)) || ((allOneRankAtom (sourceRanks P) 8).ult (allOneRankAtom (sourceRanks P) 4)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (4 : Fin 78) (46 : Fin 78)
    (8 : Fin 78) (42 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (5 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (8 : Fin 78) (4 : Fin 78)
    (46 : Fin 78) (3 : Fin 78) (53 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3726` (kalmanson). -/
theorem middleSource_h3726 :
    ((!((allOneRankAtom (sourceRanks P) 4 == allOneRankAtom (sourceRanks P) 3)) || ((allOneRankAtom (sourceRanks P) 54).ult (allOneRankAtom (sourceRanks P) 47)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (47 : Fin 78) (4 : Fin 78)
    (54 : Fin 78) (3 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (5 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (9 : Fin 78) (4 : Fin 78)
    (47 : Fin 78) (3 : Fin 78) (54 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3727` (kalmanson). -/
theorem middleSource_h3727 :
    ((!((allOneRankAtom (sourceRanks P) 4 == allOneRankAtom (sourceRanks P) 54)) || ((allOneRankAtom (sourceRanks P) 3).ult (allOneRankAtom (sourceRanks P) 47)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (47 : Fin 78) (4 : Fin 78)
    (3 : Fin 78) (54 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (5 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (9 : Fin 78) (4 : Fin 78)
    (47 : Fin 78) (3 : Fin 78) (54 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3728` (kalmanson). -/
theorem middleSource_h3728 :
    ((!((allOneRankAtom (sourceRanks P) 47 == allOneRankAtom (sourceRanks P) 3)) || ((allOneRankAtom (sourceRanks P) 54).ult (allOneRankAtom (sourceRanks P) 4)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (4 : Fin 78) (47 : Fin 78)
    (54 : Fin 78) (3 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (5 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (9 : Fin 78) (4 : Fin 78)
    (47 : Fin 78) (3 : Fin 78) (54 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3729` (kalmanson). -/
theorem middleSource_h3729 :
    ((!((allOneRankAtom (sourceRanks P) 47 == allOneRankAtom (sourceRanks P) 54)) || ((allOneRankAtom (sourceRanks P) 3).ult (allOneRankAtom (sourceRanks P) 4)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (4 : Fin 78) (47 : Fin 78)
    (3 : Fin 78) (54 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (5 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (9 : Fin 78) (4 : Fin 78)
    (47 : Fin 78) (3 : Fin 78) (54 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3730` (kalmanson). -/
theorem middleSource_h3730 :
    ((!((allOneRankAtom (sourceRanks P) 4 == allOneRankAtom (sourceRanks P) 9)) || ((allOneRankAtom (sourceRanks P) 42).ult (allOneRankAtom (sourceRanks P) 47)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (47 : Fin 78) (4 : Fin 78)
    (42 : Fin 78) (9 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (5 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (9 : Fin 78) (4 : Fin 78)
    (47 : Fin 78) (3 : Fin 78) (54 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3731` (kalmanson). -/
theorem middleSource_h3731 :
    ((!((allOneRankAtom (sourceRanks P) 4 == allOneRankAtom (sourceRanks P) 42)) || ((allOneRankAtom (sourceRanks P) 9).ult (allOneRankAtom (sourceRanks P) 47)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (47 : Fin 78) (4 : Fin 78)
    (9 : Fin 78) (42 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (5 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (9 : Fin 78) (4 : Fin 78)
    (47 : Fin 78) (3 : Fin 78) (54 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3732` (kalmanson). -/
theorem middleSource_h3732 :
    ((!((allOneRankAtom (sourceRanks P) 47 == allOneRankAtom (sourceRanks P) 9)) || ((allOneRankAtom (sourceRanks P) 42).ult (allOneRankAtom (sourceRanks P) 4)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (4 : Fin 78) (47 : Fin 78)
    (42 : Fin 78) (9 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (5 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (9 : Fin 78) (4 : Fin 78)
    (47 : Fin 78) (3 : Fin 78) (54 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3733` (kalmanson). -/
theorem middleSource_h3733 :
    ((!((allOneRankAtom (sourceRanks P) 47 == allOneRankAtom (sourceRanks P) 42)) || ((allOneRankAtom (sourceRanks P) 9).ult (allOneRankAtom (sourceRanks P) 4)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (4 : Fin 78) (47 : Fin 78)
    (9 : Fin 78) (42 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (5 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (9 : Fin 78) (4 : Fin 78)
    (47 : Fin 78) (3 : Fin 78) (54 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3734` (kalmanson). -/
theorem middleSource_h3734 :
    ((!((allOneRankAtom (sourceRanks P) 4 == allOneRankAtom (sourceRanks P) 3)) || ((allOneRankAtom (sourceRanks P) 55).ult (allOneRankAtom (sourceRanks P) 48)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (48 : Fin 78) (4 : Fin 78)
    (55 : Fin 78) (3 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (5 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (10 : Fin 78) (4 : Fin 78)
    (48 : Fin 78) (3 : Fin 78) (55 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3735` (kalmanson). -/
theorem middleSource_h3735 :
    ((!((allOneRankAtom (sourceRanks P) 4 == allOneRankAtom (sourceRanks P) 55)) || ((allOneRankAtom (sourceRanks P) 3).ult (allOneRankAtom (sourceRanks P) 48)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (48 : Fin 78) (4 : Fin 78)
    (3 : Fin 78) (55 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (5 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (10 : Fin 78) (4 : Fin 78)
    (48 : Fin 78) (3 : Fin 78) (55 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3736` (kalmanson). -/
theorem middleSource_h3736 :
    ((!((allOneRankAtom (sourceRanks P) 48 == allOneRankAtom (sourceRanks P) 3)) || ((allOneRankAtom (sourceRanks P) 55).ult (allOneRankAtom (sourceRanks P) 4)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (4 : Fin 78) (48 : Fin 78)
    (55 : Fin 78) (3 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (5 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (10 : Fin 78) (4 : Fin 78)
    (48 : Fin 78) (3 : Fin 78) (55 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3737` (kalmanson). -/
theorem middleSource_h3737 :
    ((!((allOneRankAtom (sourceRanks P) 48 == allOneRankAtom (sourceRanks P) 55)) || ((allOneRankAtom (sourceRanks P) 3).ult (allOneRankAtom (sourceRanks P) 4)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (4 : Fin 78) (48 : Fin 78)
    (3 : Fin 78) (55 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (5 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (10 : Fin 78) (4 : Fin 78)
    (48 : Fin 78) (3 : Fin 78) (55 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3738` (kalmanson). -/
theorem middleSource_h3738 :
    ((!((allOneRankAtom (sourceRanks P) 4 == allOneRankAtom (sourceRanks P) 10)) || ((allOneRankAtom (sourceRanks P) 42).ult (allOneRankAtom (sourceRanks P) 48)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (48 : Fin 78) (4 : Fin 78)
    (42 : Fin 78) (10 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (5 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (10 : Fin 78) (4 : Fin 78)
    (48 : Fin 78) (3 : Fin 78) (55 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3739` (kalmanson). -/
theorem middleSource_h3739 :
    ((!((allOneRankAtom (sourceRanks P) 4 == allOneRankAtom (sourceRanks P) 42)) || ((allOneRankAtom (sourceRanks P) 10).ult (allOneRankAtom (sourceRanks P) 48)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (48 : Fin 78) (4 : Fin 78)
    (10 : Fin 78) (42 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (5 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (10 : Fin 78) (4 : Fin 78)
    (48 : Fin 78) (3 : Fin 78) (55 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3740` (kalmanson). -/
theorem middleSource_h3740 :
    ((!((allOneRankAtom (sourceRanks P) 48 == allOneRankAtom (sourceRanks P) 10)) || ((allOneRankAtom (sourceRanks P) 42).ult (allOneRankAtom (sourceRanks P) 4)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (4 : Fin 78) (48 : Fin 78)
    (42 : Fin 78) (10 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (5 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (10 : Fin 78) (4 : Fin 78)
    (48 : Fin 78) (3 : Fin 78) (55 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3741` (kalmanson). -/
theorem middleSource_h3741 :
    ((!((allOneRankAtom (sourceRanks P) 48 == allOneRankAtom (sourceRanks P) 42)) || ((allOneRankAtom (sourceRanks P) 10).ult (allOneRankAtom (sourceRanks P) 4)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (4 : Fin 78) (48 : Fin 78)
    (10 : Fin 78) (42 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (5 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (10 : Fin 78) (4 : Fin 78)
    (48 : Fin 78) (3 : Fin 78) (55 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3742` (kalmanson). -/
theorem middleSource_h3742 :
    ((!((allOneRankAtom (sourceRanks P) 4 == allOneRankAtom (sourceRanks P) 3)) || ((allOneRankAtom (sourceRanks P) 56).ult (allOneRankAtom (sourceRanks P) 49)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (49 : Fin 78) (4 : Fin 78)
    (56 : Fin 78) (3 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (5 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (11 : Fin 78) (4 : Fin 78)
    (49 : Fin 78) (3 : Fin 78) (56 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3743` (kalmanson). -/
theorem middleSource_h3743 :
    ((!((allOneRankAtom (sourceRanks P) 4 == allOneRankAtom (sourceRanks P) 56)) || ((allOneRankAtom (sourceRanks P) 3).ult (allOneRankAtom (sourceRanks P) 49)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (49 : Fin 78) (4 : Fin 78)
    (3 : Fin 78) (56 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (5 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (11 : Fin 78) (4 : Fin 78)
    (49 : Fin 78) (3 : Fin 78) (56 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3744` (kalmanson). -/
theorem middleSource_h3744 :
    ((!((allOneRankAtom (sourceRanks P) 49 == allOneRankAtom (sourceRanks P) 3)) || ((allOneRankAtom (sourceRanks P) 56).ult (allOneRankAtom (sourceRanks P) 4)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (4 : Fin 78) (49 : Fin 78)
    (56 : Fin 78) (3 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (5 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (11 : Fin 78) (4 : Fin 78)
    (49 : Fin 78) (3 : Fin 78) (56 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3745` (kalmanson). -/
theorem middleSource_h3745 :
    ((!((allOneRankAtom (sourceRanks P) 49 == allOneRankAtom (sourceRanks P) 56)) || ((allOneRankAtom (sourceRanks P) 3).ult (allOneRankAtom (sourceRanks P) 4)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (4 : Fin 78) (49 : Fin 78)
    (3 : Fin 78) (56 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (5 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (11 : Fin 78) (4 : Fin 78)
    (49 : Fin 78) (3 : Fin 78) (56 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3746` (kalmanson). -/
theorem middleSource_h3746 :
    ((!((allOneRankAtom (sourceRanks P) 4 == allOneRankAtom (sourceRanks P) 11)) || ((allOneRankAtom (sourceRanks P) 42).ult (allOneRankAtom (sourceRanks P) 49)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (49 : Fin 78) (4 : Fin 78)
    (42 : Fin 78) (11 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (5 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (11 : Fin 78) (4 : Fin 78)
    (49 : Fin 78) (3 : Fin 78) (56 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3747` (kalmanson). -/
theorem middleSource_h3747 :
    ((!((allOneRankAtom (sourceRanks P) 4 == allOneRankAtom (sourceRanks P) 42)) || ((allOneRankAtom (sourceRanks P) 11).ult (allOneRankAtom (sourceRanks P) 49)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (49 : Fin 78) (4 : Fin 78)
    (11 : Fin 78) (42 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (5 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (11 : Fin 78) (4 : Fin 78)
    (49 : Fin 78) (3 : Fin 78) (56 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3748` (kalmanson). -/
theorem middleSource_h3748 :
    ((!((allOneRankAtom (sourceRanks P) 49 == allOneRankAtom (sourceRanks P) 11)) || ((allOneRankAtom (sourceRanks P) 42).ult (allOneRankAtom (sourceRanks P) 4)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (4 : Fin 78) (49 : Fin 78)
    (42 : Fin 78) (11 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (5 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (11 : Fin 78) (4 : Fin 78)
    (49 : Fin 78) (3 : Fin 78) (56 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3749` (kalmanson). -/
theorem middleSource_h3749 :
    ((!((allOneRankAtom (sourceRanks P) 49 == allOneRankAtom (sourceRanks P) 42)) || ((allOneRankAtom (sourceRanks P) 11).ult (allOneRankAtom (sourceRanks P) 4)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (4 : Fin 78) (49 : Fin 78)
    (11 : Fin 78) (42 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (5 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (11 : Fin 78) (4 : Fin 78)
    (49 : Fin 78) (3 : Fin 78) (56 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3750` (kalmanson). -/
theorem middleSource_h3750 :
    ((!((allOneRankAtom (sourceRanks P) 5 == allOneRankAtom (sourceRanks P) 3)) || ((allOneRankAtom (sourceRanks P) 57).ult (allOneRankAtom (sourceRanks P) 44)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (44 : Fin 78) (5 : Fin 78)
    (57 : Fin 78) (3 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (6 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (43 : Fin 78) (6 : Fin 78) (5 : Fin 78)
    (44 : Fin 78) (3 : Fin 78) (57 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3751` (kalmanson). -/
theorem middleSource_h3751 :
    ((!((allOneRankAtom (sourceRanks P) 5 == allOneRankAtom (sourceRanks P) 57)) || ((allOneRankAtom (sourceRanks P) 3).ult (allOneRankAtom (sourceRanks P) 44)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (44 : Fin 78) (5 : Fin 78)
    (3 : Fin 78) (57 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (6 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (43 : Fin 78) (6 : Fin 78) (5 : Fin 78)
    (44 : Fin 78) (3 : Fin 78) (57 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3752` (kalmanson). -/
theorem middleSource_h3752 :
    ((!((allOneRankAtom (sourceRanks P) 44 == allOneRankAtom (sourceRanks P) 3)) || ((allOneRankAtom (sourceRanks P) 57).ult (allOneRankAtom (sourceRanks P) 5)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (5 : Fin 78) (44 : Fin 78)
    (57 : Fin 78) (3 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (6 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (43 : Fin 78) (6 : Fin 78) (5 : Fin 78)
    (44 : Fin 78) (3 : Fin 78) (57 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3753` (kalmanson). -/
theorem middleSource_h3753 :
    ((!((allOneRankAtom (sourceRanks P) 5 == allOneRankAtom (sourceRanks P) 6)) || ((allOneRankAtom (sourceRanks P) 43).ult (allOneRankAtom (sourceRanks P) 44)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (44 : Fin 78) (5 : Fin 78)
    (43 : Fin 78) (6 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (6 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (43 : Fin 78) (6 : Fin 78) (5 : Fin 78)
    (44 : Fin 78) (3 : Fin 78) (57 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3754` (kalmanson). -/
theorem middleSource_h3754 :
    ((!((allOneRankAtom (sourceRanks P) 5 == allOneRankAtom (sourceRanks P) 43)) || ((allOneRankAtom (sourceRanks P) 6).ult (allOneRankAtom (sourceRanks P) 44)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (44 : Fin 78) (5 : Fin 78)
    (6 : Fin 78) (43 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (6 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (43 : Fin 78) (6 : Fin 78) (5 : Fin 78)
    (44 : Fin 78) (3 : Fin 78) (57 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3755` (kalmanson). -/
theorem middleSource_h3755 :
    ((!((allOneRankAtom (sourceRanks P) 44 == allOneRankAtom (sourceRanks P) 6)) || ((allOneRankAtom (sourceRanks P) 43).ult (allOneRankAtom (sourceRanks P) 5)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (5 : Fin 78) (44 : Fin 78)
    (43 : Fin 78) (6 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (6 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (43 : Fin 78) (6 : Fin 78) (5 : Fin 78)
    (44 : Fin 78) (3 : Fin 78) (57 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3756` (kalmanson). -/
theorem middleSource_h3756 :
    ((!((allOneRankAtom (sourceRanks P) 44 == allOneRankAtom (sourceRanks P) 43)) || ((allOneRankAtom (sourceRanks P) 6).ult (allOneRankAtom (sourceRanks P) 5)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (5 : Fin 78) (44 : Fin 78)
    (6 : Fin 78) (43 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (6 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (43 : Fin 78) (6 : Fin 78) (5 : Fin 78)
    (44 : Fin 78) (3 : Fin 78) (57 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3757` (kalmanson). -/
theorem middleSource_h3757 :
    ((!((allOneRankAtom (sourceRanks P) 5 == allOneRankAtom (sourceRanks P) 3)) || ((allOneRankAtom (sourceRanks P) 58).ult (allOneRankAtom (sourceRanks P) 45)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (45 : Fin 78) (5 : Fin 78)
    (58 : Fin 78) (3 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (6 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (43 : Fin 78) (7 : Fin 78) (5 : Fin 78)
    (45 : Fin 78) (3 : Fin 78) (58 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3758` (kalmanson). -/
theorem middleSource_h3758 :
    ((!((allOneRankAtom (sourceRanks P) 5 == allOneRankAtom (sourceRanks P) 58)) || ((allOneRankAtom (sourceRanks P) 3).ult (allOneRankAtom (sourceRanks P) 45)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (45 : Fin 78) (5 : Fin 78)
    (3 : Fin 78) (58 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (6 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (43 : Fin 78) (7 : Fin 78) (5 : Fin 78)
    (45 : Fin 78) (3 : Fin 78) (58 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3759` (kalmanson). -/
theorem middleSource_h3759 :
    ((!((allOneRankAtom (sourceRanks P) 45 == allOneRankAtom (sourceRanks P) 3)) || ((allOneRankAtom (sourceRanks P) 58).ult (allOneRankAtom (sourceRanks P) 5)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (5 : Fin 78) (45 : Fin 78)
    (58 : Fin 78) (3 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (6 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (43 : Fin 78) (7 : Fin 78) (5 : Fin 78)
    (45 : Fin 78) (3 : Fin 78) (58 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3760` (kalmanson). -/
theorem middleSource_h3760 :
    ((!((allOneRankAtom (sourceRanks P) 45 == allOneRankAtom (sourceRanks P) 58)) || ((allOneRankAtom (sourceRanks P) 3).ult (allOneRankAtom (sourceRanks P) 5)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (5 : Fin 78) (45 : Fin 78)
    (3 : Fin 78) (58 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (6 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (43 : Fin 78) (7 : Fin 78) (5 : Fin 78)
    (45 : Fin 78) (3 : Fin 78) (58 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3761` (kalmanson). -/
theorem middleSource_h3761 :
    ((!((allOneRankAtom (sourceRanks P) 5 == allOneRankAtom (sourceRanks P) 7)) || ((allOneRankAtom (sourceRanks P) 43).ult (allOneRankAtom (sourceRanks P) 45)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (45 : Fin 78) (5 : Fin 78)
    (43 : Fin 78) (7 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (6 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (43 : Fin 78) (7 : Fin 78) (5 : Fin 78)
    (45 : Fin 78) (3 : Fin 78) (58 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3762` (kalmanson). -/
theorem middleSource_h3762 :
    ((!((allOneRankAtom (sourceRanks P) 5 == allOneRankAtom (sourceRanks P) 43)) || ((allOneRankAtom (sourceRanks P) 7).ult (allOneRankAtom (sourceRanks P) 45)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (45 : Fin 78) (5 : Fin 78)
    (7 : Fin 78) (43 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (6 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (43 : Fin 78) (7 : Fin 78) (5 : Fin 78)
    (45 : Fin 78) (3 : Fin 78) (58 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3763` (kalmanson). -/
theorem middleSource_h3763 :
    ((!((allOneRankAtom (sourceRanks P) 45 == allOneRankAtom (sourceRanks P) 7)) || ((allOneRankAtom (sourceRanks P) 43).ult (allOneRankAtom (sourceRanks P) 5)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (5 : Fin 78) (45 : Fin 78)
    (43 : Fin 78) (7 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (6 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (43 : Fin 78) (7 : Fin 78) (5 : Fin 78)
    (45 : Fin 78) (3 : Fin 78) (58 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3764` (kalmanson). -/
theorem middleSource_h3764 :
    ((!((allOneRankAtom (sourceRanks P) 45 == allOneRankAtom (sourceRanks P) 43)) || ((allOneRankAtom (sourceRanks P) 7).ult (allOneRankAtom (sourceRanks P) 5)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (5 : Fin 78) (45 : Fin 78)
    (7 : Fin 78) (43 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (6 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (43 : Fin 78) (7 : Fin 78) (5 : Fin 78)
    (45 : Fin 78) (3 : Fin 78) (58 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3765` (kalmanson). -/
theorem middleSource_h3765 :
    ((!((allOneRankAtom (sourceRanks P) 5 == allOneRankAtom (sourceRanks P) 3)) || ((allOneRankAtom (sourceRanks P) 59).ult (allOneRankAtom (sourceRanks P) 46)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (46 : Fin 78) (5 : Fin 78)
    (59 : Fin 78) (3 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (6 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (43 : Fin 78) (8 : Fin 78) (5 : Fin 78)
    (46 : Fin 78) (3 : Fin 78) (59 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3766` (kalmanson). -/
theorem middleSource_h3766 :
    ((!((allOneRankAtom (sourceRanks P) 5 == allOneRankAtom (sourceRanks P) 59)) || ((allOneRankAtom (sourceRanks P) 3).ult (allOneRankAtom (sourceRanks P) 46)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (46 : Fin 78) (5 : Fin 78)
    (3 : Fin 78) (59 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (6 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (43 : Fin 78) (8 : Fin 78) (5 : Fin 78)
    (46 : Fin 78) (3 : Fin 78) (59 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3767` (kalmanson). -/
theorem middleSource_h3767 :
    ((!((allOneRankAtom (sourceRanks P) 46 == allOneRankAtom (sourceRanks P) 3)) || ((allOneRankAtom (sourceRanks P) 59).ult (allOneRankAtom (sourceRanks P) 5)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (5 : Fin 78) (46 : Fin 78)
    (59 : Fin 78) (3 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (6 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (43 : Fin 78) (8 : Fin 78) (5 : Fin 78)
    (46 : Fin 78) (3 : Fin 78) (59 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3768` (kalmanson). -/
theorem middleSource_h3768 :
    ((!((allOneRankAtom (sourceRanks P) 46 == allOneRankAtom (sourceRanks P) 59)) || ((allOneRankAtom (sourceRanks P) 3).ult (allOneRankAtom (sourceRanks P) 5)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (5 : Fin 78) (46 : Fin 78)
    (3 : Fin 78) (59 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (6 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (43 : Fin 78) (8 : Fin 78) (5 : Fin 78)
    (46 : Fin 78) (3 : Fin 78) (59 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3769` (kalmanson). -/
theorem middleSource_h3769 :
    ((!((allOneRankAtom (sourceRanks P) 5 == allOneRankAtom (sourceRanks P) 8)) || ((allOneRankAtom (sourceRanks P) 43).ult (allOneRankAtom (sourceRanks P) 46)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (46 : Fin 78) (5 : Fin 78)
    (43 : Fin 78) (8 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (6 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (43 : Fin 78) (8 : Fin 78) (5 : Fin 78)
    (46 : Fin 78) (3 : Fin 78) (59 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3770` (kalmanson). -/
theorem middleSource_h3770 :
    ((!((allOneRankAtom (sourceRanks P) 5 == allOneRankAtom (sourceRanks P) 43)) || ((allOneRankAtom (sourceRanks P) 8).ult (allOneRankAtom (sourceRanks P) 46)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (46 : Fin 78) (5 : Fin 78)
    (8 : Fin 78) (43 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (6 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (43 : Fin 78) (8 : Fin 78) (5 : Fin 78)
    (46 : Fin 78) (3 : Fin 78) (59 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3771` (kalmanson). -/
theorem middleSource_h3771 :
    ((!((allOneRankAtom (sourceRanks P) 46 == allOneRankAtom (sourceRanks P) 8)) || ((allOneRankAtom (sourceRanks P) 43).ult (allOneRankAtom (sourceRanks P) 5)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (5 : Fin 78) (46 : Fin 78)
    (43 : Fin 78) (8 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (6 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (43 : Fin 78) (8 : Fin 78) (5 : Fin 78)
    (46 : Fin 78) (3 : Fin 78) (59 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3772` (kalmanson). -/
theorem middleSource_h3772 :
    ((!((allOneRankAtom (sourceRanks P) 46 == allOneRankAtom (sourceRanks P) 43)) || ((allOneRankAtom (sourceRanks P) 8).ult (allOneRankAtom (sourceRanks P) 5)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (5 : Fin 78) (46 : Fin 78)
    (8 : Fin 78) (43 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (6 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (43 : Fin 78) (8 : Fin 78) (5 : Fin 78)
    (46 : Fin 78) (3 : Fin 78) (59 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3773` (kalmanson). -/
theorem middleSource_h3773 :
    ((!((allOneRankAtom (sourceRanks P) 5 == allOneRankAtom (sourceRanks P) 3)) || ((allOneRankAtom (sourceRanks P) 60).ult (allOneRankAtom (sourceRanks P) 47)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (47 : Fin 78) (5 : Fin 78)
    (60 : Fin 78) (3 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (6 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (43 : Fin 78) (9 : Fin 78) (5 : Fin 78)
    (47 : Fin 78) (3 : Fin 78) (60 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3774` (kalmanson). -/
theorem middleSource_h3774 :
    ((!((allOneRankAtom (sourceRanks P) 5 == allOneRankAtom (sourceRanks P) 60)) || ((allOneRankAtom (sourceRanks P) 3).ult (allOneRankAtom (sourceRanks P) 47)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (47 : Fin 78) (5 : Fin 78)
    (3 : Fin 78) (60 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (6 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (43 : Fin 78) (9 : Fin 78) (5 : Fin 78)
    (47 : Fin 78) (3 : Fin 78) (60 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3775` (kalmanson). -/
theorem middleSource_h3775 :
    ((!((allOneRankAtom (sourceRanks P) 47 == allOneRankAtom (sourceRanks P) 3)) || ((allOneRankAtom (sourceRanks P) 60).ult (allOneRankAtom (sourceRanks P) 5)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (5 : Fin 78) (47 : Fin 78)
    (60 : Fin 78) (3 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (6 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (43 : Fin 78) (9 : Fin 78) (5 : Fin 78)
    (47 : Fin 78) (3 : Fin 78) (60 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

end

end ATailExactFiveCard13AllOneSourceIngressScratch
end Problem97
