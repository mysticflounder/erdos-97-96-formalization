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

/-- Candidate middle source assertion `h6912` (kalmanson). -/
theorem middleSource_h6912 :
    ((!((allOneRankAtom (sourceRanks P) 53 == allOneRankAtom (sourceRanks P) 54)) || ((allOneRankAtom (sourceRanks P) 59).ult (allOneRankAtom (sourceRanks P) 60)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (60 : Fin 78) (53 : Fin 78)
    (59 : Fin 78) (54 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (6 : Fin 13) (9 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (59 : Fin 78) (54 : Fin 78) (53 : Fin 78)
    (60 : Fin 78) (50 : Fin 78) (72 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6913` (kalmanson). -/
theorem middleSource_h6913 :
    ((!((allOneRankAtom (sourceRanks P) 53 == allOneRankAtom (sourceRanks P) 59)) || ((allOneRankAtom (sourceRanks P) 54).ult (allOneRankAtom (sourceRanks P) 60)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (60 : Fin 78) (53 : Fin 78)
    (54 : Fin 78) (59 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (6 : Fin 13) (9 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (59 : Fin 78) (54 : Fin 78) (53 : Fin 78)
    (60 : Fin 78) (50 : Fin 78) (72 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6914` (kalmanson). -/
theorem middleSource_h6914 :
    ((!((allOneRankAtom (sourceRanks P) 60 == allOneRankAtom (sourceRanks P) 54)) || ((allOneRankAtom (sourceRanks P) 59).ult (allOneRankAtom (sourceRanks P) 53)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (53 : Fin 78) (60 : Fin 78)
    (59 : Fin 78) (54 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (6 : Fin 13) (9 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (59 : Fin 78) (54 : Fin 78) (53 : Fin 78)
    (60 : Fin 78) (50 : Fin 78) (72 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6915` (kalmanson). -/
theorem middleSource_h6915 :
    ((!((allOneRankAtom (sourceRanks P) 60 == allOneRankAtom (sourceRanks P) 59)) || ((allOneRankAtom (sourceRanks P) 54).ult (allOneRankAtom (sourceRanks P) 53)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (53 : Fin 78) (60 : Fin 78)
    (54 : Fin 78) (59 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (6 : Fin 13) (9 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (59 : Fin 78) (54 : Fin 78) (53 : Fin 78)
    (60 : Fin 78) (50 : Fin 78) (72 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6916` (kalmanson). -/
theorem middleSource_h6916 :
    ((!((allOneRankAtom (sourceRanks P) 53 == allOneRankAtom (sourceRanks P) 50)) || ((allOneRankAtom (sourceRanks P) 73).ult (allOneRankAtom (sourceRanks P) 61)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (61 : Fin 78) (53 : Fin 78)
    (73 : Fin 78) (50 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (6 : Fin 13) (9 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (59 : Fin 78) (55 : Fin 78) (53 : Fin 78)
    (61 : Fin 78) (50 : Fin 78) (73 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6917` (kalmanson). -/
theorem middleSource_h6917 :
    ((!((allOneRankAtom (sourceRanks P) 53 == allOneRankAtom (sourceRanks P) 73)) || ((allOneRankAtom (sourceRanks P) 50).ult (allOneRankAtom (sourceRanks P) 61)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (61 : Fin 78) (53 : Fin 78)
    (50 : Fin 78) (73 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (6 : Fin 13) (9 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (59 : Fin 78) (55 : Fin 78) (53 : Fin 78)
    (61 : Fin 78) (50 : Fin 78) (73 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6918` (kalmanson). -/
theorem middleSource_h6918 :
    ((!((allOneRankAtom (sourceRanks P) 61 == allOneRankAtom (sourceRanks P) 50)) || ((allOneRankAtom (sourceRanks P) 73).ult (allOneRankAtom (sourceRanks P) 53)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (53 : Fin 78) (61 : Fin 78)
    (73 : Fin 78) (50 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (6 : Fin 13) (9 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (59 : Fin 78) (55 : Fin 78) (53 : Fin 78)
    (61 : Fin 78) (50 : Fin 78) (73 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6919` (kalmanson). -/
theorem middleSource_h6919 :
    ((!((allOneRankAtom (sourceRanks P) 61 == allOneRankAtom (sourceRanks P) 73)) || ((allOneRankAtom (sourceRanks P) 50).ult (allOneRankAtom (sourceRanks P) 53)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (53 : Fin 78) (61 : Fin 78)
    (50 : Fin 78) (73 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (6 : Fin 13) (9 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (59 : Fin 78) (55 : Fin 78) (53 : Fin 78)
    (61 : Fin 78) (50 : Fin 78) (73 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6920` (kalmanson). -/
theorem middleSource_h6920 :
    ((!((allOneRankAtom (sourceRanks P) 53 == allOneRankAtom (sourceRanks P) 55)) || ((allOneRankAtom (sourceRanks P) 59).ult (allOneRankAtom (sourceRanks P) 61)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (61 : Fin 78) (53 : Fin 78)
    (59 : Fin 78) (55 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (6 : Fin 13) (9 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (59 : Fin 78) (55 : Fin 78) (53 : Fin 78)
    (61 : Fin 78) (50 : Fin 78) (73 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6921` (kalmanson). -/
theorem middleSource_h6921 :
    ((!((allOneRankAtom (sourceRanks P) 53 == allOneRankAtom (sourceRanks P) 59)) || ((allOneRankAtom (sourceRanks P) 55).ult (allOneRankAtom (sourceRanks P) 61)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (61 : Fin 78) (53 : Fin 78)
    (55 : Fin 78) (59 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (6 : Fin 13) (9 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (59 : Fin 78) (55 : Fin 78) (53 : Fin 78)
    (61 : Fin 78) (50 : Fin 78) (73 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6922` (kalmanson). -/
theorem middleSource_h6922 :
    ((!((allOneRankAtom (sourceRanks P) 61 == allOneRankAtom (sourceRanks P) 55)) || ((allOneRankAtom (sourceRanks P) 59).ult (allOneRankAtom (sourceRanks P) 53)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (53 : Fin 78) (61 : Fin 78)
    (59 : Fin 78) (55 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (6 : Fin 13) (9 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (59 : Fin 78) (55 : Fin 78) (53 : Fin 78)
    (61 : Fin 78) (50 : Fin 78) (73 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6923` (kalmanson). -/
theorem middleSource_h6923 :
    ((!((allOneRankAtom (sourceRanks P) 61 == allOneRankAtom (sourceRanks P) 59)) || ((allOneRankAtom (sourceRanks P) 55).ult (allOneRankAtom (sourceRanks P) 53)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (53 : Fin 78) (61 : Fin 78)
    (55 : Fin 78) (59 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (6 : Fin 13) (9 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (59 : Fin 78) (55 : Fin 78) (53 : Fin 78)
    (61 : Fin 78) (50 : Fin 78) (73 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6924` (kalmanson). -/
theorem middleSource_h6924 :
    ((!((allOneRankAtom (sourceRanks P) 53 == allOneRankAtom (sourceRanks P) 50)) || ((allOneRankAtom (sourceRanks P) 74).ult (allOneRankAtom (sourceRanks P) 62)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (62 : Fin 78) (53 : Fin 78)
    (74 : Fin 78) (50 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (6 : Fin 13) (9 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (59 : Fin 78) (56 : Fin 78) (53 : Fin 78)
    (62 : Fin 78) (50 : Fin 78) (74 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6925` (kalmanson). -/
theorem middleSource_h6925 :
    ((!((allOneRankAtom (sourceRanks P) 53 == allOneRankAtom (sourceRanks P) 74)) || ((allOneRankAtom (sourceRanks P) 50).ult (allOneRankAtom (sourceRanks P) 62)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (62 : Fin 78) (53 : Fin 78)
    (50 : Fin 78) (74 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (6 : Fin 13) (9 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (59 : Fin 78) (56 : Fin 78) (53 : Fin 78)
    (62 : Fin 78) (50 : Fin 78) (74 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6926` (kalmanson). -/
theorem middleSource_h6926 :
    ((!((allOneRankAtom (sourceRanks P) 62 == allOneRankAtom (sourceRanks P) 50)) || ((allOneRankAtom (sourceRanks P) 74).ult (allOneRankAtom (sourceRanks P) 53)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (53 : Fin 78) (62 : Fin 78)
    (74 : Fin 78) (50 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (6 : Fin 13) (9 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (59 : Fin 78) (56 : Fin 78) (53 : Fin 78)
    (62 : Fin 78) (50 : Fin 78) (74 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6927` (kalmanson). -/
theorem middleSource_h6927 :
    ((!((allOneRankAtom (sourceRanks P) 53 == allOneRankAtom (sourceRanks P) 56)) || ((allOneRankAtom (sourceRanks P) 59).ult (allOneRankAtom (sourceRanks P) 62)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (62 : Fin 78) (53 : Fin 78)
    (59 : Fin 78) (56 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (6 : Fin 13) (9 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (59 : Fin 78) (56 : Fin 78) (53 : Fin 78)
    (62 : Fin 78) (50 : Fin 78) (74 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6928` (kalmanson). -/
theorem middleSource_h6928 :
    ((!((allOneRankAtom (sourceRanks P) 53 == allOneRankAtom (sourceRanks P) 59)) || ((allOneRankAtom (sourceRanks P) 56).ult (allOneRankAtom (sourceRanks P) 62)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (62 : Fin 78) (53 : Fin 78)
    (56 : Fin 78) (59 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (6 : Fin 13) (9 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (59 : Fin 78) (56 : Fin 78) (53 : Fin 78)
    (62 : Fin 78) (50 : Fin 78) (74 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6929` (kalmanson). -/
theorem middleSource_h6929 :
    ((!((allOneRankAtom (sourceRanks P) 62 == allOneRankAtom (sourceRanks P) 56)) || ((allOneRankAtom (sourceRanks P) 59).ult (allOneRankAtom (sourceRanks P) 53)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (53 : Fin 78) (62 : Fin 78)
    (59 : Fin 78) (56 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (6 : Fin 13) (9 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (59 : Fin 78) (56 : Fin 78) (53 : Fin 78)
    (62 : Fin 78) (50 : Fin 78) (74 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6930` (kalmanson). -/
theorem middleSource_h6930 :
    ((!((allOneRankAtom (sourceRanks P) 62 == allOneRankAtom (sourceRanks P) 59)) || ((allOneRankAtom (sourceRanks P) 56).ult (allOneRankAtom (sourceRanks P) 53)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (53 : Fin 78) (62 : Fin 78)
    (56 : Fin 78) (59 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (6 : Fin 13) (9 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (59 : Fin 78) (56 : Fin 78) (53 : Fin 78)
    (62 : Fin 78) (50 : Fin 78) (74 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6931` (kalmanson). -/
theorem middleSource_h6931 :
    ((!((allOneRankAtom (sourceRanks P) 54 == allOneRankAtom (sourceRanks P) 50)) || ((allOneRankAtom (sourceRanks P) 75).ult (allOneRankAtom (sourceRanks P) 61)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (61 : Fin 78) (54 : Fin 78)
    (75 : Fin 78) (50 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (6 : Fin 13) (10 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (60 : Fin 78) (55 : Fin 78) (54 : Fin 78)
    (61 : Fin 78) (50 : Fin 78) (75 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6932` (kalmanson). -/
theorem middleSource_h6932 :
    ((!((allOneRankAtom (sourceRanks P) 54 == allOneRankAtom (sourceRanks P) 75)) || ((allOneRankAtom (sourceRanks P) 50).ult (allOneRankAtom (sourceRanks P) 61)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (61 : Fin 78) (54 : Fin 78)
    (50 : Fin 78) (75 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (6 : Fin 13) (10 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (60 : Fin 78) (55 : Fin 78) (54 : Fin 78)
    (61 : Fin 78) (50 : Fin 78) (75 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6933` (kalmanson). -/
theorem middleSource_h6933 :
    ((!((allOneRankAtom (sourceRanks P) 61 == allOneRankAtom (sourceRanks P) 50)) || ((allOneRankAtom (sourceRanks P) 75).ult (allOneRankAtom (sourceRanks P) 54)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (54 : Fin 78) (61 : Fin 78)
    (75 : Fin 78) (50 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (6 : Fin 13) (10 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (60 : Fin 78) (55 : Fin 78) (54 : Fin 78)
    (61 : Fin 78) (50 : Fin 78) (75 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6934` (kalmanson). -/
theorem middleSource_h6934 :
    ((!((allOneRankAtom (sourceRanks P) 61 == allOneRankAtom (sourceRanks P) 75)) || ((allOneRankAtom (sourceRanks P) 50).ult (allOneRankAtom (sourceRanks P) 54)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (54 : Fin 78) (61 : Fin 78)
    (50 : Fin 78) (75 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (6 : Fin 13) (10 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (60 : Fin 78) (55 : Fin 78) (54 : Fin 78)
    (61 : Fin 78) (50 : Fin 78) (75 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6935` (kalmanson). -/
theorem middleSource_h6935 :
    ((!((allOneRankAtom (sourceRanks P) 54 == allOneRankAtom (sourceRanks P) 55)) || ((allOneRankAtom (sourceRanks P) 60).ult (allOneRankAtom (sourceRanks P) 61)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (61 : Fin 78) (54 : Fin 78)
    (60 : Fin 78) (55 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (6 : Fin 13) (10 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (60 : Fin 78) (55 : Fin 78) (54 : Fin 78)
    (61 : Fin 78) (50 : Fin 78) (75 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6936` (kalmanson). -/
theorem middleSource_h6936 :
    ((!((allOneRankAtom (sourceRanks P) 54 == allOneRankAtom (sourceRanks P) 60)) || ((allOneRankAtom (sourceRanks P) 55).ult (allOneRankAtom (sourceRanks P) 61)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (61 : Fin 78) (54 : Fin 78)
    (55 : Fin 78) (60 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (6 : Fin 13) (10 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (60 : Fin 78) (55 : Fin 78) (54 : Fin 78)
    (61 : Fin 78) (50 : Fin 78) (75 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6937` (kalmanson). -/
theorem middleSource_h6937 :
    ((!((allOneRankAtom (sourceRanks P) 61 == allOneRankAtom (sourceRanks P) 55)) || ((allOneRankAtom (sourceRanks P) 60).ult (allOneRankAtom (sourceRanks P) 54)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (54 : Fin 78) (61 : Fin 78)
    (60 : Fin 78) (55 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (6 : Fin 13) (10 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (60 : Fin 78) (55 : Fin 78) (54 : Fin 78)
    (61 : Fin 78) (50 : Fin 78) (75 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6938` (kalmanson). -/
theorem middleSource_h6938 :
    ((!((allOneRankAtom (sourceRanks P) 61 == allOneRankAtom (sourceRanks P) 60)) || ((allOneRankAtom (sourceRanks P) 55).ult (allOneRankAtom (sourceRanks P) 54)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (54 : Fin 78) (61 : Fin 78)
    (55 : Fin 78) (60 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (6 : Fin 13) (10 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (60 : Fin 78) (55 : Fin 78) (54 : Fin 78)
    (61 : Fin 78) (50 : Fin 78) (75 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6939` (kalmanson). -/
theorem middleSource_h6939 :
    ((!((allOneRankAtom (sourceRanks P) 54 == allOneRankAtom (sourceRanks P) 50)) || ((allOneRankAtom (sourceRanks P) 76).ult (allOneRankAtom (sourceRanks P) 62)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (62 : Fin 78) (54 : Fin 78)
    (76 : Fin 78) (50 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (6 : Fin 13) (10 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (60 : Fin 78) (56 : Fin 78) (54 : Fin 78)
    (62 : Fin 78) (50 : Fin 78) (76 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6940` (kalmanson). -/
theorem middleSource_h6940 :
    ((!((allOneRankAtom (sourceRanks P) 54 == allOneRankAtom (sourceRanks P) 76)) || ((allOneRankAtom (sourceRanks P) 50).ult (allOneRankAtom (sourceRanks P) 62)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (62 : Fin 78) (54 : Fin 78)
    (50 : Fin 78) (76 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (6 : Fin 13) (10 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (60 : Fin 78) (56 : Fin 78) (54 : Fin 78)
    (62 : Fin 78) (50 : Fin 78) (76 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6941` (kalmanson). -/
theorem middleSource_h6941 :
    ((!((allOneRankAtom (sourceRanks P) 62 == allOneRankAtom (sourceRanks P) 50)) || ((allOneRankAtom (sourceRanks P) 76).ult (allOneRankAtom (sourceRanks P) 54)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (54 : Fin 78) (62 : Fin 78)
    (76 : Fin 78) (50 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (6 : Fin 13) (10 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (60 : Fin 78) (56 : Fin 78) (54 : Fin 78)
    (62 : Fin 78) (50 : Fin 78) (76 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6942` (kalmanson). -/
theorem middleSource_h6942 :
    ((!((allOneRankAtom (sourceRanks P) 54 == allOneRankAtom (sourceRanks P) 56)) || ((allOneRankAtom (sourceRanks P) 60).ult (allOneRankAtom (sourceRanks P) 62)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (62 : Fin 78) (54 : Fin 78)
    (60 : Fin 78) (56 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (6 : Fin 13) (10 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (60 : Fin 78) (56 : Fin 78) (54 : Fin 78)
    (62 : Fin 78) (50 : Fin 78) (76 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6943` (kalmanson). -/
theorem middleSource_h6943 :
    ((!((allOneRankAtom (sourceRanks P) 54 == allOneRankAtom (sourceRanks P) 60)) || ((allOneRankAtom (sourceRanks P) 56).ult (allOneRankAtom (sourceRanks P) 62)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (62 : Fin 78) (54 : Fin 78)
    (56 : Fin 78) (60 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (6 : Fin 13) (10 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (60 : Fin 78) (56 : Fin 78) (54 : Fin 78)
    (62 : Fin 78) (50 : Fin 78) (76 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6944` (kalmanson). -/
theorem middleSource_h6944 :
    ((!((allOneRankAtom (sourceRanks P) 62 == allOneRankAtom (sourceRanks P) 60)) || ((allOneRankAtom (sourceRanks P) 56).ult (allOneRankAtom (sourceRanks P) 54)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (54 : Fin 78) (62 : Fin 78)
    (56 : Fin 78) (60 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (6 : Fin 13) (10 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (60 : Fin 78) (56 : Fin 78) (54 : Fin 78)
    (62 : Fin 78) (50 : Fin 78) (76 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6945` (kalmanson). -/
theorem middleSource_h6945 :
    ((!((allOneRankAtom (sourceRanks P) 55 == allOneRankAtom (sourceRanks P) 50)) || ((allOneRankAtom (sourceRanks P) 77).ult (allOneRankAtom (sourceRanks P) 62)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (62 : Fin 78) (55 : Fin 78)
    (77 : Fin 78) (50 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (6 : Fin 13) (11 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (61 : Fin 78) (56 : Fin 78) (55 : Fin 78)
    (62 : Fin 78) (50 : Fin 78) (77 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6946` (kalmanson). -/
theorem middleSource_h6946 :
    ((!((allOneRankAtom (sourceRanks P) 55 == allOneRankAtom (sourceRanks P) 77)) || ((allOneRankAtom (sourceRanks P) 50).ult (allOneRankAtom (sourceRanks P) 62)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (62 : Fin 78) (55 : Fin 78)
    (50 : Fin 78) (77 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (6 : Fin 13) (11 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (61 : Fin 78) (56 : Fin 78) (55 : Fin 78)
    (62 : Fin 78) (50 : Fin 78) (77 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6947` (kalmanson). -/
theorem middleSource_h6947 :
    ((!((allOneRankAtom (sourceRanks P) 62 == allOneRankAtom (sourceRanks P) 50)) || ((allOneRankAtom (sourceRanks P) 77).ult (allOneRankAtom (sourceRanks P) 55)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (55 : Fin 78) (62 : Fin 78)
    (77 : Fin 78) (50 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (6 : Fin 13) (11 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (61 : Fin 78) (56 : Fin 78) (55 : Fin 78)
    (62 : Fin 78) (50 : Fin 78) (77 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6948` (kalmanson). -/
theorem middleSource_h6948 :
    ((!((allOneRankAtom (sourceRanks P) 55 == allOneRankAtom (sourceRanks P) 56)) || ((allOneRankAtom (sourceRanks P) 61).ult (allOneRankAtom (sourceRanks P) 62)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (62 : Fin 78) (55 : Fin 78)
    (61 : Fin 78) (56 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (6 : Fin 13) (11 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (61 : Fin 78) (56 : Fin 78) (55 : Fin 78)
    (62 : Fin 78) (50 : Fin 78) (77 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6949` (kalmanson). -/
theorem middleSource_h6949 :
    ((!((allOneRankAtom (sourceRanks P) 55 == allOneRankAtom (sourceRanks P) 61)) || ((allOneRankAtom (sourceRanks P) 56).ult (allOneRankAtom (sourceRanks P) 62)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (62 : Fin 78) (55 : Fin 78)
    (56 : Fin 78) (61 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (6 : Fin 13) (11 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (61 : Fin 78) (56 : Fin 78) (55 : Fin 78)
    (62 : Fin 78) (50 : Fin 78) (77 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6950` (kalmanson). -/
theorem middleSource_h6950 :
    ((!((allOneRankAtom (sourceRanks P) 62 == allOneRankAtom (sourceRanks P) 56)) || ((allOneRankAtom (sourceRanks P) 61).ult (allOneRankAtom (sourceRanks P) 55)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (55 : Fin 78) (62 : Fin 78)
    (61 : Fin 78) (56 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (6 : Fin 13) (11 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (61 : Fin 78) (56 : Fin 78) (55 : Fin 78)
    (62 : Fin 78) (50 : Fin 78) (77 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6951` (kalmanson). -/
theorem middleSource_h6951 :
    ((!((allOneRankAtom (sourceRanks P) 62 == allOneRankAtom (sourceRanks P) 61)) || ((allOneRankAtom (sourceRanks P) 56).ult (allOneRankAtom (sourceRanks P) 55)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (55 : Fin 78) (62 : Fin 78)
    (56 : Fin 78) (61 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (6 : Fin 13) (11 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (61 : Fin 78) (56 : Fin 78) (55 : Fin 78)
    (62 : Fin 78) (50 : Fin 78) (77 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6952` (kalmanson). -/
theorem middleSource_h6952 :
    ((!((allOneRankAtom (sourceRanks P) 52 == allOneRankAtom (sourceRanks P) 51)) || ((allOneRankAtom (sourceRanks P) 68).ult (allOneRankAtom (sourceRanks P) 64)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (64 : Fin 78) (52 : Fin 78)
    (68 : Fin 78) (51 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (7 : Fin 13) (8 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (63 : Fin 78) (53 : Fin 78) (52 : Fin 78)
    (64 : Fin 78) (51 : Fin 78) (68 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6953` (kalmanson). -/
theorem middleSource_h6953 :
    ((!((allOneRankAtom (sourceRanks P) 52 == allOneRankAtom (sourceRanks P) 68)) || ((allOneRankAtom (sourceRanks P) 51).ult (allOneRankAtom (sourceRanks P) 64)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (64 : Fin 78) (52 : Fin 78)
    (51 : Fin 78) (68 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (7 : Fin 13) (8 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (63 : Fin 78) (53 : Fin 78) (52 : Fin 78)
    (64 : Fin 78) (51 : Fin 78) (68 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6954` (kalmanson). -/
theorem middleSource_h6954 :
    ((!((allOneRankAtom (sourceRanks P) 64 == allOneRankAtom (sourceRanks P) 68)) || ((allOneRankAtom (sourceRanks P) 51).ult (allOneRankAtom (sourceRanks P) 52)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (52 : Fin 78) (64 : Fin 78)
    (51 : Fin 78) (68 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (7 : Fin 13) (8 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (63 : Fin 78) (53 : Fin 78) (52 : Fin 78)
    (64 : Fin 78) (51 : Fin 78) (68 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6955` (kalmanson). -/
theorem middleSource_h6955 :
    ((!((allOneRankAtom (sourceRanks P) 52 == allOneRankAtom (sourceRanks P) 53)) || ((allOneRankAtom (sourceRanks P) 63).ult (allOneRankAtom (sourceRanks P) 64)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (64 : Fin 78) (52 : Fin 78)
    (63 : Fin 78) (53 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (7 : Fin 13) (8 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (63 : Fin 78) (53 : Fin 78) (52 : Fin 78)
    (64 : Fin 78) (51 : Fin 78) (68 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6956` (kalmanson). -/
theorem middleSource_h6956 :
    ((!((allOneRankAtom (sourceRanks P) 64 == allOneRankAtom (sourceRanks P) 53)) || ((allOneRankAtom (sourceRanks P) 63).ult (allOneRankAtom (sourceRanks P) 52)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (52 : Fin 78) (64 : Fin 78)
    (63 : Fin 78) (53 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (7 : Fin 13) (8 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (63 : Fin 78) (53 : Fin 78) (52 : Fin 78)
    (64 : Fin 78) (51 : Fin 78) (68 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6957` (kalmanson). -/
theorem middleSource_h6957 :
    ((!((allOneRankAtom (sourceRanks P) 52 == allOneRankAtom (sourceRanks P) 51)) || ((allOneRankAtom (sourceRanks P) 69).ult (allOneRankAtom (sourceRanks P) 65)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (65 : Fin 78) (52 : Fin 78)
    (69 : Fin 78) (51 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (7 : Fin 13) (8 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (63 : Fin 78) (54 : Fin 78) (52 : Fin 78)
    (65 : Fin 78) (51 : Fin 78) (69 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6958` (kalmanson). -/
theorem middleSource_h6958 :
    ((!((allOneRankAtom (sourceRanks P) 52 == allOneRankAtom (sourceRanks P) 69)) || ((allOneRankAtom (sourceRanks P) 51).ult (allOneRankAtom (sourceRanks P) 65)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (65 : Fin 78) (52 : Fin 78)
    (51 : Fin 78) (69 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (7 : Fin 13) (8 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (63 : Fin 78) (54 : Fin 78) (52 : Fin 78)
    (65 : Fin 78) (51 : Fin 78) (69 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6959` (kalmanson). -/
theorem middleSource_h6959 :
    ((!((allOneRankAtom (sourceRanks P) 65 == allOneRankAtom (sourceRanks P) 69)) || ((allOneRankAtom (sourceRanks P) 51).ult (allOneRankAtom (sourceRanks P) 52)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (52 : Fin 78) (65 : Fin 78)
    (51 : Fin 78) (69 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (7 : Fin 13) (8 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (63 : Fin 78) (54 : Fin 78) (52 : Fin 78)
    (65 : Fin 78) (51 : Fin 78) (69 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6960` (kalmanson). -/
theorem middleSource_h6960 :
    ((!((allOneRankAtom (sourceRanks P) 52 == allOneRankAtom (sourceRanks P) 54)) || ((allOneRankAtom (sourceRanks P) 63).ult (allOneRankAtom (sourceRanks P) 65)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (65 : Fin 78) (52 : Fin 78)
    (63 : Fin 78) (54 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (7 : Fin 13) (8 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (63 : Fin 78) (54 : Fin 78) (52 : Fin 78)
    (65 : Fin 78) (51 : Fin 78) (69 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6961` (kalmanson). -/
theorem middleSource_h6961 :
    ((!((allOneRankAtom (sourceRanks P) 65 == allOneRankAtom (sourceRanks P) 54)) || ((allOneRankAtom (sourceRanks P) 63).ult (allOneRankAtom (sourceRanks P) 52)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (52 : Fin 78) (65 : Fin 78)
    (63 : Fin 78) (54 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (7 : Fin 13) (8 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (63 : Fin 78) (54 : Fin 78) (52 : Fin 78)
    (65 : Fin 78) (51 : Fin 78) (69 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6962` (kalmanson). -/
theorem middleSource_h6962 :
    ((!((allOneRankAtom (sourceRanks P) 65 == allOneRankAtom (sourceRanks P) 63)) || ((allOneRankAtom (sourceRanks P) 54).ult (allOneRankAtom (sourceRanks P) 52)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (52 : Fin 78) (65 : Fin 78)
    (54 : Fin 78) (63 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (7 : Fin 13) (8 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (63 : Fin 78) (54 : Fin 78) (52 : Fin 78)
    (65 : Fin 78) (51 : Fin 78) (69 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6963` (kalmanson). -/
theorem middleSource_h6963 :
    ((!((allOneRankAtom (sourceRanks P) 52 == allOneRankAtom (sourceRanks P) 51)) || ((allOneRankAtom (sourceRanks P) 70).ult (allOneRankAtom (sourceRanks P) 66)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (66 : Fin 78) (52 : Fin 78)
    (70 : Fin 78) (51 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (7 : Fin 13) (8 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (63 : Fin 78) (55 : Fin 78) (52 : Fin 78)
    (66 : Fin 78) (51 : Fin 78) (70 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6964` (kalmanson). -/
theorem middleSource_h6964 :
    ((!((allOneRankAtom (sourceRanks P) 52 == allOneRankAtom (sourceRanks P) 70)) || ((allOneRankAtom (sourceRanks P) 51).ult (allOneRankAtom (sourceRanks P) 66)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (66 : Fin 78) (52 : Fin 78)
    (51 : Fin 78) (70 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (7 : Fin 13) (8 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (63 : Fin 78) (55 : Fin 78) (52 : Fin 78)
    (66 : Fin 78) (51 : Fin 78) (70 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6965` (kalmanson). -/
theorem middleSource_h6965 :
    ((!((allOneRankAtom (sourceRanks P) 66 == allOneRankAtom (sourceRanks P) 70)) || ((allOneRankAtom (sourceRanks P) 51).ult (allOneRankAtom (sourceRanks P) 52)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (52 : Fin 78) (66 : Fin 78)
    (51 : Fin 78) (70 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (7 : Fin 13) (8 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (63 : Fin 78) (55 : Fin 78) (52 : Fin 78)
    (66 : Fin 78) (51 : Fin 78) (70 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6966` (kalmanson). -/
theorem middleSource_h6966 :
    ((!((allOneRankAtom (sourceRanks P) 52 == allOneRankAtom (sourceRanks P) 55)) || ((allOneRankAtom (sourceRanks P) 63).ult (allOneRankAtom (sourceRanks P) 66)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (66 : Fin 78) (52 : Fin 78)
    (63 : Fin 78) (55 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (7 : Fin 13) (8 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (63 : Fin 78) (55 : Fin 78) (52 : Fin 78)
    (66 : Fin 78) (51 : Fin 78) (70 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6967` (kalmanson). -/
theorem middleSource_h6967 :
    ((!((allOneRankAtom (sourceRanks P) 66 == allOneRankAtom (sourceRanks P) 55)) || ((allOneRankAtom (sourceRanks P) 63).ult (allOneRankAtom (sourceRanks P) 52)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (52 : Fin 78) (66 : Fin 78)
    (63 : Fin 78) (55 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (7 : Fin 13) (8 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (63 : Fin 78) (55 : Fin 78) (52 : Fin 78)
    (66 : Fin 78) (51 : Fin 78) (70 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6968` (kalmanson). -/
theorem middleSource_h6968 :
    ((!((allOneRankAtom (sourceRanks P) 52 == allOneRankAtom (sourceRanks P) 51)) || ((allOneRankAtom (sourceRanks P) 71).ult (allOneRankAtom (sourceRanks P) 67)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (67 : Fin 78) (52 : Fin 78)
    (71 : Fin 78) (51 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (7 : Fin 13) (8 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (63 : Fin 78) (56 : Fin 78) (52 : Fin 78)
    (67 : Fin 78) (51 : Fin 78) (71 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6969` (kalmanson). -/
theorem middleSource_h6969 :
    ((!((allOneRankAtom (sourceRanks P) 52 == allOneRankAtom (sourceRanks P) 71)) || ((allOneRankAtom (sourceRanks P) 51).ult (allOneRankAtom (sourceRanks P) 67)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (67 : Fin 78) (52 : Fin 78)
    (51 : Fin 78) (71 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (7 : Fin 13) (8 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (63 : Fin 78) (56 : Fin 78) (52 : Fin 78)
    (67 : Fin 78) (51 : Fin 78) (71 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6970` (kalmanson). -/
theorem middleSource_h6970 :
    ((!((allOneRankAtom (sourceRanks P) 52 == allOneRankAtom (sourceRanks P) 56)) || ((allOneRankAtom (sourceRanks P) 63).ult (allOneRankAtom (sourceRanks P) 67)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (67 : Fin 78) (52 : Fin 78)
    (63 : Fin 78) (56 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (7 : Fin 13) (8 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (63 : Fin 78) (56 : Fin 78) (52 : Fin 78)
    (67 : Fin 78) (51 : Fin 78) (71 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6971` (kalmanson). -/
theorem middleSource_h6971 :
    ((!((allOneRankAtom (sourceRanks P) 67 == allOneRankAtom (sourceRanks P) 56)) || ((allOneRankAtom (sourceRanks P) 63).ult (allOneRankAtom (sourceRanks P) 52)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (52 : Fin 78) (67 : Fin 78)
    (63 : Fin 78) (56 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (7 : Fin 13) (8 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (63 : Fin 78) (56 : Fin 78) (52 : Fin 78)
    (67 : Fin 78) (51 : Fin 78) (71 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6972` (kalmanson). -/
theorem middleSource_h6972 :
    ((!((allOneRankAtom (sourceRanks P) 53 == allOneRankAtom (sourceRanks P) 51)) || ((allOneRankAtom (sourceRanks P) 72).ult (allOneRankAtom (sourceRanks P) 65)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (65 : Fin 78) (53 : Fin 78)
    (72 : Fin 78) (51 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (7 : Fin 13) (9 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (64 : Fin 78) (54 : Fin 78) (53 : Fin 78)
    (65 : Fin 78) (51 : Fin 78) (72 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6973` (kalmanson). -/
theorem middleSource_h6973 :
    ((!((allOneRankAtom (sourceRanks P) 53 == allOneRankAtom (sourceRanks P) 72)) || ((allOneRankAtom (sourceRanks P) 51).ult (allOneRankAtom (sourceRanks P) 65)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (65 : Fin 78) (53 : Fin 78)
    (51 : Fin 78) (72 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (7 : Fin 13) (9 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (64 : Fin 78) (54 : Fin 78) (53 : Fin 78)
    (65 : Fin 78) (51 : Fin 78) (72 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6974` (kalmanson). -/
theorem middleSource_h6974 :
    ((!((allOneRankAtom (sourceRanks P) 65 == allOneRankAtom (sourceRanks P) 72)) || ((allOneRankAtom (sourceRanks P) 51).ult (allOneRankAtom (sourceRanks P) 53)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (53 : Fin 78) (65 : Fin 78)
    (51 : Fin 78) (72 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (7 : Fin 13) (9 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (64 : Fin 78) (54 : Fin 78) (53 : Fin 78)
    (65 : Fin 78) (51 : Fin 78) (72 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6975` (kalmanson). -/
theorem middleSource_h6975 :
    ((!((allOneRankAtom (sourceRanks P) 53 == allOneRankAtom (sourceRanks P) 54)) || ((allOneRankAtom (sourceRanks P) 64).ult (allOneRankAtom (sourceRanks P) 65)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (65 : Fin 78) (53 : Fin 78)
    (64 : Fin 78) (54 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (7 : Fin 13) (9 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (64 : Fin 78) (54 : Fin 78) (53 : Fin 78)
    (65 : Fin 78) (51 : Fin 78) (72 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

end

end ATailExactFiveCard13AllOneSourceIngressScratch
end Problem97
