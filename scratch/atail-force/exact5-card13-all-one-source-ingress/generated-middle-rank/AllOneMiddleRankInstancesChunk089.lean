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

/-- Candidate middle source assertion `h5696` (kalmanson). -/
theorem middleSource_h5696 :
    ((!((allOneRankAtom (sourceRanks P) 29 == allOneRankAtom (sourceRanks P) 72)) || ((allOneRankAtom (sourceRanks P) 25).ult (allOneRankAtom (sourceRanks P) 54)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (54 : Fin 78) (29 : Fin 78)
    (25 : Fin 78) (72 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (5 : Fin 13) (9 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (53 : Fin 78) (30 : Fin 78) (29 : Fin 78)
    (54 : Fin 78) (25 : Fin 78) (72 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5697` (kalmanson). -/
theorem middleSource_h5697 :
    ((!((allOneRankAtom (sourceRanks P) 54 == allOneRankAtom (sourceRanks P) 25)) || ((allOneRankAtom (sourceRanks P) 72).ult (allOneRankAtom (sourceRanks P) 29)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (29 : Fin 78) (54 : Fin 78)
    (72 : Fin 78) (25 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (5 : Fin 13) (9 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (53 : Fin 78) (30 : Fin 78) (29 : Fin 78)
    (54 : Fin 78) (25 : Fin 78) (72 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5698` (kalmanson). -/
theorem middleSource_h5698 :
    ((!((allOneRankAtom (sourceRanks P) 54 == allOneRankAtom (sourceRanks P) 72)) || ((allOneRankAtom (sourceRanks P) 25).ult (allOneRankAtom (sourceRanks P) 29)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (29 : Fin 78) (54 : Fin 78)
    (25 : Fin 78) (72 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (5 : Fin 13) (9 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (53 : Fin 78) (30 : Fin 78) (29 : Fin 78)
    (54 : Fin 78) (25 : Fin 78) (72 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5699` (kalmanson). -/
theorem middleSource_h5699 :
    ((!((allOneRankAtom (sourceRanks P) 29 == allOneRankAtom (sourceRanks P) 30)) || ((allOneRankAtom (sourceRanks P) 53).ult (allOneRankAtom (sourceRanks P) 54)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (54 : Fin 78) (29 : Fin 78)
    (53 : Fin 78) (30 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (5 : Fin 13) (9 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (53 : Fin 78) (30 : Fin 78) (29 : Fin 78)
    (54 : Fin 78) (25 : Fin 78) (72 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5700` (kalmanson). -/
theorem middleSource_h5700 :
    ((!((allOneRankAtom (sourceRanks P) 29 == allOneRankAtom (sourceRanks P) 53)) || ((allOneRankAtom (sourceRanks P) 30).ult (allOneRankAtom (sourceRanks P) 54)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (54 : Fin 78) (29 : Fin 78)
    (30 : Fin 78) (53 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (5 : Fin 13) (9 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (53 : Fin 78) (30 : Fin 78) (29 : Fin 78)
    (54 : Fin 78) (25 : Fin 78) (72 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5701` (kalmanson). -/
theorem middleSource_h5701 :
    ((!((allOneRankAtom (sourceRanks P) 54 == allOneRankAtom (sourceRanks P) 30)) || ((allOneRankAtom (sourceRanks P) 53).ult (allOneRankAtom (sourceRanks P) 29)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (29 : Fin 78) (54 : Fin 78)
    (53 : Fin 78) (30 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (5 : Fin 13) (9 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (53 : Fin 78) (30 : Fin 78) (29 : Fin 78)
    (54 : Fin 78) (25 : Fin 78) (72 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5702` (kalmanson). -/
theorem middleSource_h5702 :
    ((!((allOneRankAtom (sourceRanks P) 54 == allOneRankAtom (sourceRanks P) 53)) || ((allOneRankAtom (sourceRanks P) 30).ult (allOneRankAtom (sourceRanks P) 29)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (29 : Fin 78) (54 : Fin 78)
    (30 : Fin 78) (53 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (5 : Fin 13) (9 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (53 : Fin 78) (30 : Fin 78) (29 : Fin 78)
    (54 : Fin 78) (25 : Fin 78) (72 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5703` (kalmanson). -/
theorem middleSource_h5703 :
    ((!((allOneRankAtom (sourceRanks P) 29 == allOneRankAtom (sourceRanks P) 25)) || ((allOneRankAtom (sourceRanks P) 73).ult (allOneRankAtom (sourceRanks P) 55)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (55 : Fin 78) (29 : Fin 78)
    (73 : Fin 78) (25 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (5 : Fin 13) (9 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (53 : Fin 78) (31 : Fin 78) (29 : Fin 78)
    (55 : Fin 78) (25 : Fin 78) (73 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5704` (kalmanson). -/
theorem middleSource_h5704 :
    ((!((allOneRankAtom (sourceRanks P) 29 == allOneRankAtom (sourceRanks P) 73)) || ((allOneRankAtom (sourceRanks P) 25).ult (allOneRankAtom (sourceRanks P) 55)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (55 : Fin 78) (29 : Fin 78)
    (25 : Fin 78) (73 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (5 : Fin 13) (9 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (53 : Fin 78) (31 : Fin 78) (29 : Fin 78)
    (55 : Fin 78) (25 : Fin 78) (73 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5705` (kalmanson). -/
theorem middleSource_h5705 :
    ((!((allOneRankAtom (sourceRanks P) 55 == allOneRankAtom (sourceRanks P) 25)) || ((allOneRankAtom (sourceRanks P) 73).ult (allOneRankAtom (sourceRanks P) 29)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (29 : Fin 78) (55 : Fin 78)
    (73 : Fin 78) (25 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (5 : Fin 13) (9 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (53 : Fin 78) (31 : Fin 78) (29 : Fin 78)
    (55 : Fin 78) (25 : Fin 78) (73 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5706` (kalmanson). -/
theorem middleSource_h5706 :
    ((!((allOneRankAtom (sourceRanks P) 55 == allOneRankAtom (sourceRanks P) 73)) || ((allOneRankAtom (sourceRanks P) 25).ult (allOneRankAtom (sourceRanks P) 29)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (29 : Fin 78) (55 : Fin 78)
    (25 : Fin 78) (73 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (5 : Fin 13) (9 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (53 : Fin 78) (31 : Fin 78) (29 : Fin 78)
    (55 : Fin 78) (25 : Fin 78) (73 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5707` (kalmanson). -/
theorem middleSource_h5707 :
    ((!((allOneRankAtom (sourceRanks P) 29 == allOneRankAtom (sourceRanks P) 31)) || ((allOneRankAtom (sourceRanks P) 53).ult (allOneRankAtom (sourceRanks P) 55)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (55 : Fin 78) (29 : Fin 78)
    (53 : Fin 78) (31 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (5 : Fin 13) (9 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (53 : Fin 78) (31 : Fin 78) (29 : Fin 78)
    (55 : Fin 78) (25 : Fin 78) (73 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5708` (kalmanson). -/
theorem middleSource_h5708 :
    ((!((allOneRankAtom (sourceRanks P) 29 == allOneRankAtom (sourceRanks P) 53)) || ((allOneRankAtom (sourceRanks P) 31).ult (allOneRankAtom (sourceRanks P) 55)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (55 : Fin 78) (29 : Fin 78)
    (31 : Fin 78) (53 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (5 : Fin 13) (9 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (53 : Fin 78) (31 : Fin 78) (29 : Fin 78)
    (55 : Fin 78) (25 : Fin 78) (73 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5709` (kalmanson). -/
theorem middleSource_h5709 :
    ((!((allOneRankAtom (sourceRanks P) 55 == allOneRankAtom (sourceRanks P) 31)) || ((allOneRankAtom (sourceRanks P) 53).ult (allOneRankAtom (sourceRanks P) 29)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (29 : Fin 78) (55 : Fin 78)
    (53 : Fin 78) (31 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (5 : Fin 13) (9 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (53 : Fin 78) (31 : Fin 78) (29 : Fin 78)
    (55 : Fin 78) (25 : Fin 78) (73 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5710` (kalmanson). -/
theorem middleSource_h5710 :
    ((!((allOneRankAtom (sourceRanks P) 55 == allOneRankAtom (sourceRanks P) 53)) || ((allOneRankAtom (sourceRanks P) 31).ult (allOneRankAtom (sourceRanks P) 29)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (29 : Fin 78) (55 : Fin 78)
    (31 : Fin 78) (53 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (5 : Fin 13) (9 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (53 : Fin 78) (31 : Fin 78) (29 : Fin 78)
    (55 : Fin 78) (25 : Fin 78) (73 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5711` (kalmanson). -/
theorem middleSource_h5711 :
    ((!((allOneRankAtom (sourceRanks P) 29 == allOneRankAtom (sourceRanks P) 25)) || ((allOneRankAtom (sourceRanks P) 74).ult (allOneRankAtom (sourceRanks P) 56)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (56 : Fin 78) (29 : Fin 78)
    (74 : Fin 78) (25 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (5 : Fin 13) (9 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (53 : Fin 78) (32 : Fin 78) (29 : Fin 78)
    (56 : Fin 78) (25 : Fin 78) (74 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5712` (kalmanson). -/
theorem middleSource_h5712 :
    ((!((allOneRankAtom (sourceRanks P) 29 == allOneRankAtom (sourceRanks P) 74)) || ((allOneRankAtom (sourceRanks P) 25).ult (allOneRankAtom (sourceRanks P) 56)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (56 : Fin 78) (29 : Fin 78)
    (25 : Fin 78) (74 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (5 : Fin 13) (9 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (53 : Fin 78) (32 : Fin 78) (29 : Fin 78)
    (56 : Fin 78) (25 : Fin 78) (74 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5713` (kalmanson). -/
theorem middleSource_h5713 :
    ((!((allOneRankAtom (sourceRanks P) 56 == allOneRankAtom (sourceRanks P) 25)) || ((allOneRankAtom (sourceRanks P) 74).ult (allOneRankAtom (sourceRanks P) 29)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (29 : Fin 78) (56 : Fin 78)
    (74 : Fin 78) (25 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (5 : Fin 13) (9 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (53 : Fin 78) (32 : Fin 78) (29 : Fin 78)
    (56 : Fin 78) (25 : Fin 78) (74 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5714` (kalmanson). -/
theorem middleSource_h5714 :
    ((!((allOneRankAtom (sourceRanks P) 29 == allOneRankAtom (sourceRanks P) 32)) || ((allOneRankAtom (sourceRanks P) 53).ult (allOneRankAtom (sourceRanks P) 56)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (56 : Fin 78) (29 : Fin 78)
    (53 : Fin 78) (32 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (5 : Fin 13) (9 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (53 : Fin 78) (32 : Fin 78) (29 : Fin 78)
    (56 : Fin 78) (25 : Fin 78) (74 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5715` (kalmanson). -/
theorem middleSource_h5715 :
    ((!((allOneRankAtom (sourceRanks P) 29 == allOneRankAtom (sourceRanks P) 53)) || ((allOneRankAtom (sourceRanks P) 32).ult (allOneRankAtom (sourceRanks P) 56)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (56 : Fin 78) (29 : Fin 78)
    (32 : Fin 78) (53 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (5 : Fin 13) (9 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (53 : Fin 78) (32 : Fin 78) (29 : Fin 78)
    (56 : Fin 78) (25 : Fin 78) (74 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5716` (kalmanson). -/
theorem middleSource_h5716 :
    ((!((allOneRankAtom (sourceRanks P) 56 == allOneRankAtom (sourceRanks P) 53)) || ((allOneRankAtom (sourceRanks P) 32).ult (allOneRankAtom (sourceRanks P) 29)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (29 : Fin 78) (56 : Fin 78)
    (32 : Fin 78) (53 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (5 : Fin 13) (9 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (53 : Fin 78) (32 : Fin 78) (29 : Fin 78)
    (56 : Fin 78) (25 : Fin 78) (74 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5717` (kalmanson). -/
theorem middleSource_h5717 :
    ((!((allOneRankAtom (sourceRanks P) 30 == allOneRankAtom (sourceRanks P) 25)) || ((allOneRankAtom (sourceRanks P) 75).ult (allOneRankAtom (sourceRanks P) 55)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (55 : Fin 78) (30 : Fin 78)
    (75 : Fin 78) (25 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (5 : Fin 13) (10 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (54 : Fin 78) (31 : Fin 78) (30 : Fin 78)
    (55 : Fin 78) (25 : Fin 78) (75 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5718` (kalmanson). -/
theorem middleSource_h5718 :
    ((!((allOneRankAtom (sourceRanks P) 30 == allOneRankAtom (sourceRanks P) 75)) || ((allOneRankAtom (sourceRanks P) 25).ult (allOneRankAtom (sourceRanks P) 55)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (55 : Fin 78) (30 : Fin 78)
    (25 : Fin 78) (75 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (5 : Fin 13) (10 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (54 : Fin 78) (31 : Fin 78) (30 : Fin 78)
    (55 : Fin 78) (25 : Fin 78) (75 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5719` (kalmanson). -/
theorem middleSource_h5719 :
    ((!((allOneRankAtom (sourceRanks P) 55 == allOneRankAtom (sourceRanks P) 25)) || ((allOneRankAtom (sourceRanks P) 75).ult (allOneRankAtom (sourceRanks P) 30)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (30 : Fin 78) (55 : Fin 78)
    (75 : Fin 78) (25 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (5 : Fin 13) (10 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (54 : Fin 78) (31 : Fin 78) (30 : Fin 78)
    (55 : Fin 78) (25 : Fin 78) (75 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5720` (kalmanson). -/
theorem middleSource_h5720 :
    ((!((allOneRankAtom (sourceRanks P) 55 == allOneRankAtom (sourceRanks P) 75)) || ((allOneRankAtom (sourceRanks P) 25).ult (allOneRankAtom (sourceRanks P) 30)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (30 : Fin 78) (55 : Fin 78)
    (25 : Fin 78) (75 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (5 : Fin 13) (10 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (54 : Fin 78) (31 : Fin 78) (30 : Fin 78)
    (55 : Fin 78) (25 : Fin 78) (75 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5721` (kalmanson). -/
theorem middleSource_h5721 :
    ((!((allOneRankAtom (sourceRanks P) 30 == allOneRankAtom (sourceRanks P) 31)) || ((allOneRankAtom (sourceRanks P) 54).ult (allOneRankAtom (sourceRanks P) 55)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (55 : Fin 78) (30 : Fin 78)
    (54 : Fin 78) (31 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (5 : Fin 13) (10 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (54 : Fin 78) (31 : Fin 78) (30 : Fin 78)
    (55 : Fin 78) (25 : Fin 78) (75 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5722` (kalmanson). -/
theorem middleSource_h5722 :
    ((!((allOneRankAtom (sourceRanks P) 30 == allOneRankAtom (sourceRanks P) 54)) || ((allOneRankAtom (sourceRanks P) 31).ult (allOneRankAtom (sourceRanks P) 55)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (55 : Fin 78) (30 : Fin 78)
    (31 : Fin 78) (54 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (5 : Fin 13) (10 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (54 : Fin 78) (31 : Fin 78) (30 : Fin 78)
    (55 : Fin 78) (25 : Fin 78) (75 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5723` (kalmanson). -/
theorem middleSource_h5723 :
    ((!((allOneRankAtom (sourceRanks P) 55 == allOneRankAtom (sourceRanks P) 31)) || ((allOneRankAtom (sourceRanks P) 54).ult (allOneRankAtom (sourceRanks P) 30)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (30 : Fin 78) (55 : Fin 78)
    (54 : Fin 78) (31 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (5 : Fin 13) (10 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (54 : Fin 78) (31 : Fin 78) (30 : Fin 78)
    (55 : Fin 78) (25 : Fin 78) (75 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5724` (kalmanson). -/
theorem middleSource_h5724 :
    ((!((allOneRankAtom (sourceRanks P) 55 == allOneRankAtom (sourceRanks P) 54)) || ((allOneRankAtom (sourceRanks P) 31).ult (allOneRankAtom (sourceRanks P) 30)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (30 : Fin 78) (55 : Fin 78)
    (31 : Fin 78) (54 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (5 : Fin 13) (10 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (54 : Fin 78) (31 : Fin 78) (30 : Fin 78)
    (55 : Fin 78) (25 : Fin 78) (75 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5725` (kalmanson). -/
theorem middleSource_h5725 :
    ((!((allOneRankAtom (sourceRanks P) 30 == allOneRankAtom (sourceRanks P) 25)) || ((allOneRankAtom (sourceRanks P) 76).ult (allOneRankAtom (sourceRanks P) 56)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (56 : Fin 78) (30 : Fin 78)
    (76 : Fin 78) (25 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (5 : Fin 13) (10 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (54 : Fin 78) (32 : Fin 78) (30 : Fin 78)
    (56 : Fin 78) (25 : Fin 78) (76 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5726` (kalmanson). -/
theorem middleSource_h5726 :
    ((!((allOneRankAtom (sourceRanks P) 30 == allOneRankAtom (sourceRanks P) 76)) || ((allOneRankAtom (sourceRanks P) 25).ult (allOneRankAtom (sourceRanks P) 56)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (56 : Fin 78) (30 : Fin 78)
    (25 : Fin 78) (76 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (5 : Fin 13) (10 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (54 : Fin 78) (32 : Fin 78) (30 : Fin 78)
    (56 : Fin 78) (25 : Fin 78) (76 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5727` (kalmanson). -/
theorem middleSource_h5727 :
    ((!((allOneRankAtom (sourceRanks P) 56 == allOneRankAtom (sourceRanks P) 25)) || ((allOneRankAtom (sourceRanks P) 76).ult (allOneRankAtom (sourceRanks P) 30)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (30 : Fin 78) (56 : Fin 78)
    (76 : Fin 78) (25 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (5 : Fin 13) (10 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (54 : Fin 78) (32 : Fin 78) (30 : Fin 78)
    (56 : Fin 78) (25 : Fin 78) (76 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5728` (kalmanson). -/
theorem middleSource_h5728 :
    ((!((allOneRankAtom (sourceRanks P) 30 == allOneRankAtom (sourceRanks P) 32)) || ((allOneRankAtom (sourceRanks P) 54).ult (allOneRankAtom (sourceRanks P) 56)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (56 : Fin 78) (30 : Fin 78)
    (54 : Fin 78) (32 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (5 : Fin 13) (10 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (54 : Fin 78) (32 : Fin 78) (30 : Fin 78)
    (56 : Fin 78) (25 : Fin 78) (76 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5729` (kalmanson). -/
theorem middleSource_h5729 :
    ((!((allOneRankAtom (sourceRanks P) 30 == allOneRankAtom (sourceRanks P) 54)) || ((allOneRankAtom (sourceRanks P) 32).ult (allOneRankAtom (sourceRanks P) 56)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (56 : Fin 78) (30 : Fin 78)
    (32 : Fin 78) (54 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (5 : Fin 13) (10 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (54 : Fin 78) (32 : Fin 78) (30 : Fin 78)
    (56 : Fin 78) (25 : Fin 78) (76 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5730` (kalmanson). -/
theorem middleSource_h5730 :
    ((!((allOneRankAtom (sourceRanks P) 56 == allOneRankAtom (sourceRanks P) 54)) || ((allOneRankAtom (sourceRanks P) 32).ult (allOneRankAtom (sourceRanks P) 30)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (30 : Fin 78) (56 : Fin 78)
    (32 : Fin 78) (54 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (5 : Fin 13) (10 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (54 : Fin 78) (32 : Fin 78) (30 : Fin 78)
    (56 : Fin 78) (25 : Fin 78) (76 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5731` (kalmanson). -/
theorem middleSource_h5731 :
    ((!((allOneRankAtom (sourceRanks P) 31 == allOneRankAtom (sourceRanks P) 25)) || ((allOneRankAtom (sourceRanks P) 77).ult (allOneRankAtom (sourceRanks P) 56)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (56 : Fin 78) (31 : Fin 78)
    (77 : Fin 78) (25 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (5 : Fin 13) (11 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (55 : Fin 78) (32 : Fin 78) (31 : Fin 78)
    (56 : Fin 78) (25 : Fin 78) (77 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5732` (kalmanson). -/
theorem middleSource_h5732 :
    ((!((allOneRankAtom (sourceRanks P) 31 == allOneRankAtom (sourceRanks P) 77)) || ((allOneRankAtom (sourceRanks P) 25).ult (allOneRankAtom (sourceRanks P) 56)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (56 : Fin 78) (31 : Fin 78)
    (25 : Fin 78) (77 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (5 : Fin 13) (11 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (55 : Fin 78) (32 : Fin 78) (31 : Fin 78)
    (56 : Fin 78) (25 : Fin 78) (77 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5733` (kalmanson). -/
theorem middleSource_h5733 :
    ((!((allOneRankAtom (sourceRanks P) 56 == allOneRankAtom (sourceRanks P) 25)) || ((allOneRankAtom (sourceRanks P) 77).ult (allOneRankAtom (sourceRanks P) 31)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (31 : Fin 78) (56 : Fin 78)
    (77 : Fin 78) (25 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (5 : Fin 13) (11 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (55 : Fin 78) (32 : Fin 78) (31 : Fin 78)
    (56 : Fin 78) (25 : Fin 78) (77 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5734` (kalmanson). -/
theorem middleSource_h5734 :
    ((!((allOneRankAtom (sourceRanks P) 31 == allOneRankAtom (sourceRanks P) 32)) || ((allOneRankAtom (sourceRanks P) 55).ult (allOneRankAtom (sourceRanks P) 56)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (56 : Fin 78) (31 : Fin 78)
    (55 : Fin 78) (32 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (5 : Fin 13) (11 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (55 : Fin 78) (32 : Fin 78) (31 : Fin 78)
    (56 : Fin 78) (25 : Fin 78) (77 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5735` (kalmanson). -/
theorem middleSource_h5735 :
    ((!((allOneRankAtom (sourceRanks P) 31 == allOneRankAtom (sourceRanks P) 55)) || ((allOneRankAtom (sourceRanks P) 32).ult (allOneRankAtom (sourceRanks P) 56)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (56 : Fin 78) (31 : Fin 78)
    (32 : Fin 78) (55 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (5 : Fin 13) (11 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (55 : Fin 78) (32 : Fin 78) (31 : Fin 78)
    (56 : Fin 78) (25 : Fin 78) (77 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5736` (kalmanson). -/
theorem middleSource_h5736 :
    ((!((allOneRankAtom (sourceRanks P) 56 == allOneRankAtom (sourceRanks P) 55)) || ((allOneRankAtom (sourceRanks P) 32).ult (allOneRankAtom (sourceRanks P) 31)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (31 : Fin 78) (56 : Fin 78)
    (32 : Fin 78) (55 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (5 : Fin 13) (11 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (55 : Fin 78) (32 : Fin 78) (31 : Fin 78)
    (56 : Fin 78) (25 : Fin 78) (77 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5737` (kalmanson). -/
theorem middleSource_h5737 :
    ((!((allOneRankAtom (sourceRanks P) 27 == allOneRankAtom (sourceRanks P) 26)) || ((allOneRankAtom (sourceRanks P) 63).ult (allOneRankAtom (sourceRanks P) 58)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (58 : Fin 78) (27 : Fin 78)
    (63 : Fin 78) (26 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (6 : Fin 13) (7 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (28 : Fin 78) (27 : Fin 78)
    (58 : Fin 78) (26 : Fin 78) (63 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5738` (kalmanson). -/
theorem middleSource_h5738 :
    ((!((allOneRankAtom (sourceRanks P) 27 == allOneRankAtom (sourceRanks P) 63)) || ((allOneRankAtom (sourceRanks P) 26).ult (allOneRankAtom (sourceRanks P) 58)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (58 : Fin 78) (27 : Fin 78)
    (26 : Fin 78) (63 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (6 : Fin 13) (7 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (28 : Fin 78) (27 : Fin 78)
    (58 : Fin 78) (26 : Fin 78) (63 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5739` (kalmanson). -/
theorem middleSource_h5739 :
    ((!((allOneRankAtom (sourceRanks P) 58 == allOneRankAtom (sourceRanks P) 26)) || ((allOneRankAtom (sourceRanks P) 63).ult (allOneRankAtom (sourceRanks P) 27)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (27 : Fin 78) (58 : Fin 78)
    (63 : Fin 78) (26 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (6 : Fin 13) (7 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (28 : Fin 78) (27 : Fin 78)
    (58 : Fin 78) (26 : Fin 78) (63 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5740` (kalmanson). -/
theorem middleSource_h5740 :
    ((!((allOneRankAtom (sourceRanks P) 27 == allOneRankAtom (sourceRanks P) 28)) || ((allOneRankAtom (sourceRanks P) 57).ult (allOneRankAtom (sourceRanks P) 58)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (58 : Fin 78) (27 : Fin 78)
    (57 : Fin 78) (28 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (6 : Fin 13) (7 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (28 : Fin 78) (27 : Fin 78)
    (58 : Fin 78) (26 : Fin 78) (63 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5741` (kalmanson). -/
theorem middleSource_h5741 :
    ((!((allOneRankAtom (sourceRanks P) 27 == allOneRankAtom (sourceRanks P) 57)) || ((allOneRankAtom (sourceRanks P) 28).ult (allOneRankAtom (sourceRanks P) 58)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (58 : Fin 78) (27 : Fin 78)
    (28 : Fin 78) (57 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (6 : Fin 13) (7 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (28 : Fin 78) (27 : Fin 78)
    (58 : Fin 78) (26 : Fin 78) (63 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5742` (kalmanson). -/
theorem middleSource_h5742 :
    ((!((allOneRankAtom (sourceRanks P) 58 == allOneRankAtom (sourceRanks P) 28)) || ((allOneRankAtom (sourceRanks P) 57).ult (allOneRankAtom (sourceRanks P) 27)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (27 : Fin 78) (58 : Fin 78)
    (57 : Fin 78) (28 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (6 : Fin 13) (7 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (28 : Fin 78) (27 : Fin 78)
    (58 : Fin 78) (26 : Fin 78) (63 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5743` (kalmanson). -/
theorem middleSource_h5743 :
    ((!((allOneRankAtom (sourceRanks P) 58 == allOneRankAtom (sourceRanks P) 57)) || ((allOneRankAtom (sourceRanks P) 28).ult (allOneRankAtom (sourceRanks P) 27)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (27 : Fin 78) (58 : Fin 78)
    (28 : Fin 78) (57 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (6 : Fin 13) (7 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (28 : Fin 78) (27 : Fin 78)
    (58 : Fin 78) (26 : Fin 78) (63 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5744` (kalmanson). -/
theorem middleSource_h5744 :
    ((!((allOneRankAtom (sourceRanks P) 27 == allOneRankAtom (sourceRanks P) 26)) || ((allOneRankAtom (sourceRanks P) 64).ult (allOneRankAtom (sourceRanks P) 59)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (59 : Fin 78) (27 : Fin 78)
    (64 : Fin 78) (26 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (6 : Fin 13) (7 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (29 : Fin 78) (27 : Fin 78)
    (59 : Fin 78) (26 : Fin 78) (64 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5745` (kalmanson). -/
theorem middleSource_h5745 :
    ((!((allOneRankAtom (sourceRanks P) 27 == allOneRankAtom (sourceRanks P) 64)) || ((allOneRankAtom (sourceRanks P) 26).ult (allOneRankAtom (sourceRanks P) 59)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (59 : Fin 78) (27 : Fin 78)
    (26 : Fin 78) (64 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (6 : Fin 13) (7 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (29 : Fin 78) (27 : Fin 78)
    (59 : Fin 78) (26 : Fin 78) (64 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5746` (kalmanson). -/
theorem middleSource_h5746 :
    ((!((allOneRankAtom (sourceRanks P) 59 == allOneRankAtom (sourceRanks P) 26)) || ((allOneRankAtom (sourceRanks P) 64).ult (allOneRankAtom (sourceRanks P) 27)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (27 : Fin 78) (59 : Fin 78)
    (64 : Fin 78) (26 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (6 : Fin 13) (7 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (29 : Fin 78) (27 : Fin 78)
    (59 : Fin 78) (26 : Fin 78) (64 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5747` (kalmanson). -/
theorem middleSource_h5747 :
    ((!((allOneRankAtom (sourceRanks P) 59 == allOneRankAtom (sourceRanks P) 64)) || ((allOneRankAtom (sourceRanks P) 26).ult (allOneRankAtom (sourceRanks P) 27)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (27 : Fin 78) (59 : Fin 78)
    (26 : Fin 78) (64 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (6 : Fin 13) (7 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (29 : Fin 78) (27 : Fin 78)
    (59 : Fin 78) (26 : Fin 78) (64 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5748` (kalmanson). -/
theorem middleSource_h5748 :
    ((!((allOneRankAtom (sourceRanks P) 27 == allOneRankAtom (sourceRanks P) 29)) || ((allOneRankAtom (sourceRanks P) 57).ult (allOneRankAtom (sourceRanks P) 59)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (59 : Fin 78) (27 : Fin 78)
    (57 : Fin 78) (29 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (6 : Fin 13) (7 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (29 : Fin 78) (27 : Fin 78)
    (59 : Fin 78) (26 : Fin 78) (64 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5749` (kalmanson). -/
theorem middleSource_h5749 :
    ((!((allOneRankAtom (sourceRanks P) 59 == allOneRankAtom (sourceRanks P) 29)) || ((allOneRankAtom (sourceRanks P) 57).ult (allOneRankAtom (sourceRanks P) 27)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (27 : Fin 78) (59 : Fin 78)
    (57 : Fin 78) (29 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (6 : Fin 13) (7 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (29 : Fin 78) (27 : Fin 78)
    (59 : Fin 78) (26 : Fin 78) (64 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5750` (kalmanson). -/
theorem middleSource_h5750 :
    ((!((allOneRankAtom (sourceRanks P) 59 == allOneRankAtom (sourceRanks P) 57)) || ((allOneRankAtom (sourceRanks P) 29).ult (allOneRankAtom (sourceRanks P) 27)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (27 : Fin 78) (59 : Fin 78)
    (29 : Fin 78) (57 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (6 : Fin 13) (7 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (29 : Fin 78) (27 : Fin 78)
    (59 : Fin 78) (26 : Fin 78) (64 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5751` (kalmanson). -/
theorem middleSource_h5751 :
    ((!((allOneRankAtom (sourceRanks P) 27 == allOneRankAtom (sourceRanks P) 26)) || ((allOneRankAtom (sourceRanks P) 65).ult (allOneRankAtom (sourceRanks P) 60)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (60 : Fin 78) (27 : Fin 78)
    (65 : Fin 78) (26 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (6 : Fin 13) (7 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (30 : Fin 78) (27 : Fin 78)
    (60 : Fin 78) (26 : Fin 78) (65 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5752` (kalmanson). -/
theorem middleSource_h5752 :
    ((!((allOneRankAtom (sourceRanks P) 27 == allOneRankAtom (sourceRanks P) 65)) || ((allOneRankAtom (sourceRanks P) 26).ult (allOneRankAtom (sourceRanks P) 60)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (60 : Fin 78) (27 : Fin 78)
    (26 : Fin 78) (65 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (6 : Fin 13) (7 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (30 : Fin 78) (27 : Fin 78)
    (60 : Fin 78) (26 : Fin 78) (65 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5753` (kalmanson). -/
theorem middleSource_h5753 :
    ((!((allOneRankAtom (sourceRanks P) 60 == allOneRankAtom (sourceRanks P) 26)) || ((allOneRankAtom (sourceRanks P) 65).ult (allOneRankAtom (sourceRanks P) 27)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (27 : Fin 78) (60 : Fin 78)
    (65 : Fin 78) (26 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (6 : Fin 13) (7 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (30 : Fin 78) (27 : Fin 78)
    (60 : Fin 78) (26 : Fin 78) (65 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5754` (kalmanson). -/
theorem middleSource_h5754 :
    ((!((allOneRankAtom (sourceRanks P) 60 == allOneRankAtom (sourceRanks P) 65)) || ((allOneRankAtom (sourceRanks P) 26).ult (allOneRankAtom (sourceRanks P) 27)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (27 : Fin 78) (60 : Fin 78)
    (26 : Fin 78) (65 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (6 : Fin 13) (7 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (30 : Fin 78) (27 : Fin 78)
    (60 : Fin 78) (26 : Fin 78) (65 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5755` (kalmanson). -/
theorem middleSource_h5755 :
    ((!((allOneRankAtom (sourceRanks P) 27 == allOneRankAtom (sourceRanks P) 30)) || ((allOneRankAtom (sourceRanks P) 57).ult (allOneRankAtom (sourceRanks P) 60)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (60 : Fin 78) (27 : Fin 78)
    (57 : Fin 78) (30 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (6 : Fin 13) (7 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (30 : Fin 78) (27 : Fin 78)
    (60 : Fin 78) (26 : Fin 78) (65 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5756` (kalmanson). -/
theorem middleSource_h5756 :
    ((!((allOneRankAtom (sourceRanks P) 60 == allOneRankAtom (sourceRanks P) 30)) || ((allOneRankAtom (sourceRanks P) 57).ult (allOneRankAtom (sourceRanks P) 27)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (27 : Fin 78) (60 : Fin 78)
    (57 : Fin 78) (30 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (6 : Fin 13) (7 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (30 : Fin 78) (27 : Fin 78)
    (60 : Fin 78) (26 : Fin 78) (65 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5757` (kalmanson). -/
theorem middleSource_h5757 :
    ((!((allOneRankAtom (sourceRanks P) 60 == allOneRankAtom (sourceRanks P) 57)) || ((allOneRankAtom (sourceRanks P) 30).ult (allOneRankAtom (sourceRanks P) 27)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (27 : Fin 78) (60 : Fin 78)
    (30 : Fin 78) (57 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (6 : Fin 13) (7 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (30 : Fin 78) (27 : Fin 78)
    (60 : Fin 78) (26 : Fin 78) (65 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5758` (kalmanson). -/
theorem middleSource_h5758 :
    ((!((allOneRankAtom (sourceRanks P) 27 == allOneRankAtom (sourceRanks P) 26)) || ((allOneRankAtom (sourceRanks P) 66).ult (allOneRankAtom (sourceRanks P) 61)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (61 : Fin 78) (27 : Fin 78)
    (66 : Fin 78) (26 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (6 : Fin 13) (7 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (31 : Fin 78) (27 : Fin 78)
    (61 : Fin 78) (26 : Fin 78) (66 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5759` (kalmanson). -/
theorem middleSource_h5759 :
    ((!((allOneRankAtom (sourceRanks P) 61 == allOneRankAtom (sourceRanks P) 26)) || ((allOneRankAtom (sourceRanks P) 66).ult (allOneRankAtom (sourceRanks P) 27)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (27 : Fin 78) (61 : Fin 78)
    (66 : Fin 78) (26 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (6 : Fin 13) (7 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (31 : Fin 78) (27 : Fin 78)
    (61 : Fin 78) (26 : Fin 78) (66 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

end

end ATailExactFiveCard13AllOneSourceIngressScratch
end Problem97
