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

/-- Candidate middle source assertion `h6976` (kalmanson). -/
theorem middleSource_h6976 :
    ((!((allOneRankAtom (sourceRanks P) 53 == allOneRankAtom (sourceRanks P) 64)) || ((allOneRankAtom (sourceRanks P) 54).ult (allOneRankAtom (sourceRanks P) 65)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (65 : Fin 78) (53 : Fin 78)
    (54 : Fin 78) (64 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (7 : Fin 13) (9 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (64 : Fin 78) (54 : Fin 78) (53 : Fin 78)
    (65 : Fin 78) (51 : Fin 78) (72 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6977` (kalmanson). -/
theorem middleSource_h6977 :
    ((!((allOneRankAtom (sourceRanks P) 65 == allOneRankAtom (sourceRanks P) 54)) || ((allOneRankAtom (sourceRanks P) 64).ult (allOneRankAtom (sourceRanks P) 53)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (53 : Fin 78) (65 : Fin 78)
    (64 : Fin 78) (54 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (7 : Fin 13) (9 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (64 : Fin 78) (54 : Fin 78) (53 : Fin 78)
    (65 : Fin 78) (51 : Fin 78) (72 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6978` (kalmanson). -/
theorem middleSource_h6978 :
    ((!((allOneRankAtom (sourceRanks P) 65 == allOneRankAtom (sourceRanks P) 64)) || ((allOneRankAtom (sourceRanks P) 54).ult (allOneRankAtom (sourceRanks P) 53)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (53 : Fin 78) (65 : Fin 78)
    (54 : Fin 78) (64 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (7 : Fin 13) (9 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (64 : Fin 78) (54 : Fin 78) (53 : Fin 78)
    (65 : Fin 78) (51 : Fin 78) (72 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6979` (kalmanson). -/
theorem middleSource_h6979 :
    ((!((allOneRankAtom (sourceRanks P) 53 == allOneRankAtom (sourceRanks P) 51)) || ((allOneRankAtom (sourceRanks P) 73).ult (allOneRankAtom (sourceRanks P) 66)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (66 : Fin 78) (53 : Fin 78)
    (73 : Fin 78) (51 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (7 : Fin 13) (9 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (64 : Fin 78) (55 : Fin 78) (53 : Fin 78)
    (66 : Fin 78) (51 : Fin 78) (73 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6980` (kalmanson). -/
theorem middleSource_h6980 :
    ((!((allOneRankAtom (sourceRanks P) 53 == allOneRankAtom (sourceRanks P) 73)) || ((allOneRankAtom (sourceRanks P) 51).ult (allOneRankAtom (sourceRanks P) 66)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (66 : Fin 78) (53 : Fin 78)
    (51 : Fin 78) (73 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (7 : Fin 13) (9 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (64 : Fin 78) (55 : Fin 78) (53 : Fin 78)
    (66 : Fin 78) (51 : Fin 78) (73 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6981` (kalmanson). -/
theorem middleSource_h6981 :
    ((!((allOneRankAtom (sourceRanks P) 66 == allOneRankAtom (sourceRanks P) 73)) || ((allOneRankAtom (sourceRanks P) 51).ult (allOneRankAtom (sourceRanks P) 53)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (53 : Fin 78) (66 : Fin 78)
    (51 : Fin 78) (73 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (7 : Fin 13) (9 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (64 : Fin 78) (55 : Fin 78) (53 : Fin 78)
    (66 : Fin 78) (51 : Fin 78) (73 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6982` (kalmanson). -/
theorem middleSource_h6982 :
    ((!((allOneRankAtom (sourceRanks P) 53 == allOneRankAtom (sourceRanks P) 55)) || ((allOneRankAtom (sourceRanks P) 64).ult (allOneRankAtom (sourceRanks P) 66)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (66 : Fin 78) (53 : Fin 78)
    (64 : Fin 78) (55 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (7 : Fin 13) (9 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (64 : Fin 78) (55 : Fin 78) (53 : Fin 78)
    (66 : Fin 78) (51 : Fin 78) (73 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6983` (kalmanson). -/
theorem middleSource_h6983 :
    ((!((allOneRankAtom (sourceRanks P) 53 == allOneRankAtom (sourceRanks P) 64)) || ((allOneRankAtom (sourceRanks P) 55).ult (allOneRankAtom (sourceRanks P) 66)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (66 : Fin 78) (53 : Fin 78)
    (55 : Fin 78) (64 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (7 : Fin 13) (9 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (64 : Fin 78) (55 : Fin 78) (53 : Fin 78)
    (66 : Fin 78) (51 : Fin 78) (73 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6984` (kalmanson). -/
theorem middleSource_h6984 :
    ((!((allOneRankAtom (sourceRanks P) 66 == allOneRankAtom (sourceRanks P) 55)) || ((allOneRankAtom (sourceRanks P) 64).ult (allOneRankAtom (sourceRanks P) 53)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (53 : Fin 78) (66 : Fin 78)
    (64 : Fin 78) (55 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (7 : Fin 13) (9 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (64 : Fin 78) (55 : Fin 78) (53 : Fin 78)
    (66 : Fin 78) (51 : Fin 78) (73 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6985` (kalmanson). -/
theorem middleSource_h6985 :
    ((!((allOneRankAtom (sourceRanks P) 53 == allOneRankAtom (sourceRanks P) 51)) || ((allOneRankAtom (sourceRanks P) 74).ult (allOneRankAtom (sourceRanks P) 67)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (67 : Fin 78) (53 : Fin 78)
    (74 : Fin 78) (51 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (7 : Fin 13) (9 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (64 : Fin 78) (56 : Fin 78) (53 : Fin 78)
    (67 : Fin 78) (51 : Fin 78) (74 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6986` (kalmanson). -/
theorem middleSource_h6986 :
    ((!((allOneRankAtom (sourceRanks P) 53 == allOneRankAtom (sourceRanks P) 74)) || ((allOneRankAtom (sourceRanks P) 51).ult (allOneRankAtom (sourceRanks P) 67)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (67 : Fin 78) (53 : Fin 78)
    (51 : Fin 78) (74 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (7 : Fin 13) (9 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (64 : Fin 78) (56 : Fin 78) (53 : Fin 78)
    (67 : Fin 78) (51 : Fin 78) (74 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6987` (kalmanson). -/
theorem middleSource_h6987 :
    ((!((allOneRankAtom (sourceRanks P) 53 == allOneRankAtom (sourceRanks P) 56)) || ((allOneRankAtom (sourceRanks P) 64).ult (allOneRankAtom (sourceRanks P) 67)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (67 : Fin 78) (53 : Fin 78)
    (64 : Fin 78) (56 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (7 : Fin 13) (9 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (64 : Fin 78) (56 : Fin 78) (53 : Fin 78)
    (67 : Fin 78) (51 : Fin 78) (74 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6988` (kalmanson). -/
theorem middleSource_h6988 :
    ((!((allOneRankAtom (sourceRanks P) 53 == allOneRankAtom (sourceRanks P) 64)) || ((allOneRankAtom (sourceRanks P) 56).ult (allOneRankAtom (sourceRanks P) 67)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (67 : Fin 78) (53 : Fin 78)
    (56 : Fin 78) (64 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (7 : Fin 13) (9 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (64 : Fin 78) (56 : Fin 78) (53 : Fin 78)
    (67 : Fin 78) (51 : Fin 78) (74 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6989` (kalmanson). -/
theorem middleSource_h6989 :
    ((!((allOneRankAtom (sourceRanks P) 67 == allOneRankAtom (sourceRanks P) 56)) || ((allOneRankAtom (sourceRanks P) 64).ult (allOneRankAtom (sourceRanks P) 53)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (53 : Fin 78) (67 : Fin 78)
    (64 : Fin 78) (56 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (7 : Fin 13) (9 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (64 : Fin 78) (56 : Fin 78) (53 : Fin 78)
    (67 : Fin 78) (51 : Fin 78) (74 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6990` (kalmanson). -/
theorem middleSource_h6990 :
    ((!((allOneRankAtom (sourceRanks P) 54 == allOneRankAtom (sourceRanks P) 51)) || ((allOneRankAtom (sourceRanks P) 75).ult (allOneRankAtom (sourceRanks P) 66)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (66 : Fin 78) (54 : Fin 78)
    (75 : Fin 78) (51 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (7 : Fin 13) (10 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (65 : Fin 78) (55 : Fin 78) (54 : Fin 78)
    (66 : Fin 78) (51 : Fin 78) (75 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6991` (kalmanson). -/
theorem middleSource_h6991 :
    ((!((allOneRankAtom (sourceRanks P) 54 == allOneRankAtom (sourceRanks P) 75)) || ((allOneRankAtom (sourceRanks P) 51).ult (allOneRankAtom (sourceRanks P) 66)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (66 : Fin 78) (54 : Fin 78)
    (51 : Fin 78) (75 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (7 : Fin 13) (10 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (65 : Fin 78) (55 : Fin 78) (54 : Fin 78)
    (66 : Fin 78) (51 : Fin 78) (75 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6992` (kalmanson). -/
theorem middleSource_h6992 :
    ((!((allOneRankAtom (sourceRanks P) 66 == allOneRankAtom (sourceRanks P) 75)) || ((allOneRankAtom (sourceRanks P) 51).ult (allOneRankAtom (sourceRanks P) 54)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (54 : Fin 78) (66 : Fin 78)
    (51 : Fin 78) (75 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (7 : Fin 13) (10 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (65 : Fin 78) (55 : Fin 78) (54 : Fin 78)
    (66 : Fin 78) (51 : Fin 78) (75 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6993` (kalmanson). -/
theorem middleSource_h6993 :
    ((!((allOneRankAtom (sourceRanks P) 54 == allOneRankAtom (sourceRanks P) 55)) || ((allOneRankAtom (sourceRanks P) 65).ult (allOneRankAtom (sourceRanks P) 66)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (66 : Fin 78) (54 : Fin 78)
    (65 : Fin 78) (55 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (7 : Fin 13) (10 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (65 : Fin 78) (55 : Fin 78) (54 : Fin 78)
    (66 : Fin 78) (51 : Fin 78) (75 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6994` (kalmanson). -/
theorem middleSource_h6994 :
    ((!((allOneRankAtom (sourceRanks P) 54 == allOneRankAtom (sourceRanks P) 65)) || ((allOneRankAtom (sourceRanks P) 55).ult (allOneRankAtom (sourceRanks P) 66)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (66 : Fin 78) (54 : Fin 78)
    (55 : Fin 78) (65 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (7 : Fin 13) (10 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (65 : Fin 78) (55 : Fin 78) (54 : Fin 78)
    (66 : Fin 78) (51 : Fin 78) (75 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6995` (kalmanson). -/
theorem middleSource_h6995 :
    ((!((allOneRankAtom (sourceRanks P) 66 == allOneRankAtom (sourceRanks P) 55)) || ((allOneRankAtom (sourceRanks P) 65).ult (allOneRankAtom (sourceRanks P) 54)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (54 : Fin 78) (66 : Fin 78)
    (65 : Fin 78) (55 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (7 : Fin 13) (10 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (65 : Fin 78) (55 : Fin 78) (54 : Fin 78)
    (66 : Fin 78) (51 : Fin 78) (75 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6996` (kalmanson). -/
theorem middleSource_h6996 :
    ((!((allOneRankAtom (sourceRanks P) 66 == allOneRankAtom (sourceRanks P) 65)) || ((allOneRankAtom (sourceRanks P) 55).ult (allOneRankAtom (sourceRanks P) 54)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (54 : Fin 78) (66 : Fin 78)
    (55 : Fin 78) (65 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (7 : Fin 13) (10 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (65 : Fin 78) (55 : Fin 78) (54 : Fin 78)
    (66 : Fin 78) (51 : Fin 78) (75 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6997` (kalmanson). -/
theorem middleSource_h6997 :
    ((!((allOneRankAtom (sourceRanks P) 54 == allOneRankAtom (sourceRanks P) 51)) || ((allOneRankAtom (sourceRanks P) 76).ult (allOneRankAtom (sourceRanks P) 67)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (67 : Fin 78) (54 : Fin 78)
    (76 : Fin 78) (51 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (7 : Fin 13) (10 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (65 : Fin 78) (56 : Fin 78) (54 : Fin 78)
    (67 : Fin 78) (51 : Fin 78) (76 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6998` (kalmanson). -/
theorem middleSource_h6998 :
    ((!((allOneRankAtom (sourceRanks P) 54 == allOneRankAtom (sourceRanks P) 76)) || ((allOneRankAtom (sourceRanks P) 51).ult (allOneRankAtom (sourceRanks P) 67)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (67 : Fin 78) (54 : Fin 78)
    (51 : Fin 78) (76 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (7 : Fin 13) (10 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (65 : Fin 78) (56 : Fin 78) (54 : Fin 78)
    (67 : Fin 78) (51 : Fin 78) (76 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6999` (kalmanson). -/
theorem middleSource_h6999 :
    ((!((allOneRankAtom (sourceRanks P) 54 == allOneRankAtom (sourceRanks P) 56)) || ((allOneRankAtom (sourceRanks P) 65).ult (allOneRankAtom (sourceRanks P) 67)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (67 : Fin 78) (54 : Fin 78)
    (65 : Fin 78) (56 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (7 : Fin 13) (10 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (65 : Fin 78) (56 : Fin 78) (54 : Fin 78)
    (67 : Fin 78) (51 : Fin 78) (76 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h7000` (kalmanson). -/
theorem middleSource_h7000 :
    ((!((allOneRankAtom (sourceRanks P) 54 == allOneRankAtom (sourceRanks P) 65)) || ((allOneRankAtom (sourceRanks P) 56).ult (allOneRankAtom (sourceRanks P) 67)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (67 : Fin 78) (54 : Fin 78)
    (56 : Fin 78) (65 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (7 : Fin 13) (10 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (65 : Fin 78) (56 : Fin 78) (54 : Fin 78)
    (67 : Fin 78) (51 : Fin 78) (76 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h7001` (kalmanson). -/
theorem middleSource_h7001 :
    ((!((allOneRankAtom (sourceRanks P) 55 == allOneRankAtom (sourceRanks P) 51)) || ((allOneRankAtom (sourceRanks P) 77).ult (allOneRankAtom (sourceRanks P) 67)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (67 : Fin 78) (55 : Fin 78)
    (77 : Fin 78) (51 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (7 : Fin 13) (11 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (66 : Fin 78) (56 : Fin 78) (55 : Fin 78)
    (67 : Fin 78) (51 : Fin 78) (77 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h7002` (kalmanson). -/
theorem middleSource_h7002 :
    ((!((allOneRankAtom (sourceRanks P) 55 == allOneRankAtom (sourceRanks P) 77)) || ((allOneRankAtom (sourceRanks P) 51).ult (allOneRankAtom (sourceRanks P) 67)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (67 : Fin 78) (55 : Fin 78)
    (51 : Fin 78) (77 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (7 : Fin 13) (11 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (66 : Fin 78) (56 : Fin 78) (55 : Fin 78)
    (67 : Fin 78) (51 : Fin 78) (77 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h7003` (kalmanson). -/
theorem middleSource_h7003 :
    ((!((allOneRankAtom (sourceRanks P) 55 == allOneRankAtom (sourceRanks P) 56)) || ((allOneRankAtom (sourceRanks P) 66).ult (allOneRankAtom (sourceRanks P) 67)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (67 : Fin 78) (55 : Fin 78)
    (66 : Fin 78) (56 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (7 : Fin 13) (11 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (66 : Fin 78) (56 : Fin 78) (55 : Fin 78)
    (67 : Fin 78) (51 : Fin 78) (77 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h7004` (kalmanson). -/
theorem middleSource_h7004 :
    ((!((allOneRankAtom (sourceRanks P) 55 == allOneRankAtom (sourceRanks P) 66)) || ((allOneRankAtom (sourceRanks P) 56).ult (allOneRankAtom (sourceRanks P) 67)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (67 : Fin 78) (55 : Fin 78)
    (56 : Fin 78) (66 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (7 : Fin 13) (11 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (66 : Fin 78) (56 : Fin 78) (55 : Fin 78)
    (67 : Fin 78) (51 : Fin 78) (77 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h7005` (kalmanson). -/
theorem middleSource_h7005 :
    ((!((allOneRankAtom (sourceRanks P) 53 == allOneRankAtom (sourceRanks P) 52)) || ((allOneRankAtom (sourceRanks P) 72).ult (allOneRankAtom (sourceRanks P) 69)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (69 : Fin 78) (53 : Fin 78)
    (72 : Fin 78) (52 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (8 : Fin 13) (9 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (68 : Fin 78) (54 : Fin 78) (53 : Fin 78)
    (69 : Fin 78) (52 : Fin 78) (72 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h7006` (kalmanson). -/
theorem middleSource_h7006 :
    ((!((allOneRankAtom (sourceRanks P) 53 == allOneRankAtom (sourceRanks P) 72)) || ((allOneRankAtom (sourceRanks P) 52).ult (allOneRankAtom (sourceRanks P) 69)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (69 : Fin 78) (53 : Fin 78)
    (52 : Fin 78) (72 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (8 : Fin 13) (9 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (68 : Fin 78) (54 : Fin 78) (53 : Fin 78)
    (69 : Fin 78) (52 : Fin 78) (72 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h7007` (kalmanson). -/
theorem middleSource_h7007 :
    ((!((allOneRankAtom (sourceRanks P) 69 == allOneRankAtom (sourceRanks P) 52)) || ((allOneRankAtom (sourceRanks P) 72).ult (allOneRankAtom (sourceRanks P) 53)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (53 : Fin 78) (69 : Fin 78)
    (72 : Fin 78) (52 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (8 : Fin 13) (9 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (68 : Fin 78) (54 : Fin 78) (53 : Fin 78)
    (69 : Fin 78) (52 : Fin 78) (72 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h7008` (kalmanson). -/
theorem middleSource_h7008 :
    ((!((allOneRankAtom (sourceRanks P) 69 == allOneRankAtom (sourceRanks P) 72)) || ((allOneRankAtom (sourceRanks P) 52).ult (allOneRankAtom (sourceRanks P) 53)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (53 : Fin 78) (69 : Fin 78)
    (52 : Fin 78) (72 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (8 : Fin 13) (9 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (68 : Fin 78) (54 : Fin 78) (53 : Fin 78)
    (69 : Fin 78) (52 : Fin 78) (72 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h7009` (kalmanson). -/
theorem middleSource_h7009 :
    ((!((allOneRankAtom (sourceRanks P) 53 == allOneRankAtom (sourceRanks P) 54)) || ((allOneRankAtom (sourceRanks P) 68).ult (allOneRankAtom (sourceRanks P) 69)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (69 : Fin 78) (53 : Fin 78)
    (68 : Fin 78) (54 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (8 : Fin 13) (9 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (68 : Fin 78) (54 : Fin 78) (53 : Fin 78)
    (69 : Fin 78) (52 : Fin 78) (72 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h7010` (kalmanson). -/
theorem middleSource_h7010 :
    ((!((allOneRankAtom (sourceRanks P) 53 == allOneRankAtom (sourceRanks P) 68)) || ((allOneRankAtom (sourceRanks P) 54).ult (allOneRankAtom (sourceRanks P) 69)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (69 : Fin 78) (53 : Fin 78)
    (54 : Fin 78) (68 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (8 : Fin 13) (9 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (68 : Fin 78) (54 : Fin 78) (53 : Fin 78)
    (69 : Fin 78) (52 : Fin 78) (72 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h7011` (kalmanson). -/
theorem middleSource_h7011 :
    ((!((allOneRankAtom (sourceRanks P) 69 == allOneRankAtom (sourceRanks P) 54)) || ((allOneRankAtom (sourceRanks P) 68).ult (allOneRankAtom (sourceRanks P) 53)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (53 : Fin 78) (69 : Fin 78)
    (68 : Fin 78) (54 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (8 : Fin 13) (9 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (68 : Fin 78) (54 : Fin 78) (53 : Fin 78)
    (69 : Fin 78) (52 : Fin 78) (72 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h7012` (kalmanson). -/
theorem middleSource_h7012 :
    ((!((allOneRankAtom (sourceRanks P) 69 == allOneRankAtom (sourceRanks P) 68)) || ((allOneRankAtom (sourceRanks P) 54).ult (allOneRankAtom (sourceRanks P) 53)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (53 : Fin 78) (69 : Fin 78)
    (54 : Fin 78) (68 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (8 : Fin 13) (9 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (68 : Fin 78) (54 : Fin 78) (53 : Fin 78)
    (69 : Fin 78) (52 : Fin 78) (72 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h7013` (kalmanson). -/
theorem middleSource_h7013 :
    ((!((allOneRankAtom (sourceRanks P) 53 == allOneRankAtom (sourceRanks P) 52)) || ((allOneRankAtom (sourceRanks P) 73).ult (allOneRankAtom (sourceRanks P) 70)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (70 : Fin 78) (53 : Fin 78)
    (73 : Fin 78) (52 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (8 : Fin 13) (9 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (68 : Fin 78) (55 : Fin 78) (53 : Fin 78)
    (70 : Fin 78) (52 : Fin 78) (73 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h7014` (kalmanson). -/
theorem middleSource_h7014 :
    ((!((allOneRankAtom (sourceRanks P) 53 == allOneRankAtom (sourceRanks P) 73)) || ((allOneRankAtom (sourceRanks P) 52).ult (allOneRankAtom (sourceRanks P) 70)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (70 : Fin 78) (53 : Fin 78)
    (52 : Fin 78) (73 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (8 : Fin 13) (9 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (68 : Fin 78) (55 : Fin 78) (53 : Fin 78)
    (70 : Fin 78) (52 : Fin 78) (73 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h7015` (kalmanson). -/
theorem middleSource_h7015 :
    ((!((allOneRankAtom (sourceRanks P) 70 == allOneRankAtom (sourceRanks P) 52)) || ((allOneRankAtom (sourceRanks P) 73).ult (allOneRankAtom (sourceRanks P) 53)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (53 : Fin 78) (70 : Fin 78)
    (73 : Fin 78) (52 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (8 : Fin 13) (9 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (68 : Fin 78) (55 : Fin 78) (53 : Fin 78)
    (70 : Fin 78) (52 : Fin 78) (73 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h7016` (kalmanson). -/
theorem middleSource_h7016 :
    ((!((allOneRankAtom (sourceRanks P) 70 == allOneRankAtom (sourceRanks P) 73)) || ((allOneRankAtom (sourceRanks P) 52).ult (allOneRankAtom (sourceRanks P) 53)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (53 : Fin 78) (70 : Fin 78)
    (52 : Fin 78) (73 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (8 : Fin 13) (9 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (68 : Fin 78) (55 : Fin 78) (53 : Fin 78)
    (70 : Fin 78) (52 : Fin 78) (73 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h7017` (kalmanson). -/
theorem middleSource_h7017 :
    ((!((allOneRankAtom (sourceRanks P) 53 == allOneRankAtom (sourceRanks P) 55)) || ((allOneRankAtom (sourceRanks P) 68).ult (allOneRankAtom (sourceRanks P) 70)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (70 : Fin 78) (53 : Fin 78)
    (68 : Fin 78) (55 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (8 : Fin 13) (9 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (68 : Fin 78) (55 : Fin 78) (53 : Fin 78)
    (70 : Fin 78) (52 : Fin 78) (73 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h7018` (kalmanson). -/
theorem middleSource_h7018 :
    ((!((allOneRankAtom (sourceRanks P) 53 == allOneRankAtom (sourceRanks P) 68)) || ((allOneRankAtom (sourceRanks P) 55).ult (allOneRankAtom (sourceRanks P) 70)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (70 : Fin 78) (53 : Fin 78)
    (55 : Fin 78) (68 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (8 : Fin 13) (9 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (68 : Fin 78) (55 : Fin 78) (53 : Fin 78)
    (70 : Fin 78) (52 : Fin 78) (73 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h7019` (kalmanson). -/
theorem middleSource_h7019 :
    ((!((allOneRankAtom (sourceRanks P) 70 == allOneRankAtom (sourceRanks P) 55)) || ((allOneRankAtom (sourceRanks P) 68).ult (allOneRankAtom (sourceRanks P) 53)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (53 : Fin 78) (70 : Fin 78)
    (68 : Fin 78) (55 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (8 : Fin 13) (9 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (68 : Fin 78) (55 : Fin 78) (53 : Fin 78)
    (70 : Fin 78) (52 : Fin 78) (73 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h7020` (kalmanson). -/
theorem middleSource_h7020 :
    ((!((allOneRankAtom (sourceRanks P) 53 == allOneRankAtom (sourceRanks P) 52)) || ((allOneRankAtom (sourceRanks P) 74).ult (allOneRankAtom (sourceRanks P) 71)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (71 : Fin 78) (53 : Fin 78)
    (74 : Fin 78) (52 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (8 : Fin 13) (9 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (68 : Fin 78) (56 : Fin 78) (53 : Fin 78)
    (71 : Fin 78) (52 : Fin 78) (74 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h7021` (kalmanson). -/
theorem middleSource_h7021 :
    ((!((allOneRankAtom (sourceRanks P) 53 == allOneRankAtom (sourceRanks P) 74)) || ((allOneRankAtom (sourceRanks P) 52).ult (allOneRankAtom (sourceRanks P) 71)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (71 : Fin 78) (53 : Fin 78)
    (52 : Fin 78) (74 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (8 : Fin 13) (9 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (68 : Fin 78) (56 : Fin 78) (53 : Fin 78)
    (71 : Fin 78) (52 : Fin 78) (74 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h7022` (kalmanson). -/
theorem middleSource_h7022 :
    ((!((allOneRankAtom (sourceRanks P) 71 == allOneRankAtom (sourceRanks P) 52)) || ((allOneRankAtom (sourceRanks P) 74).ult (allOneRankAtom (sourceRanks P) 53)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (53 : Fin 78) (71 : Fin 78)
    (74 : Fin 78) (52 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (8 : Fin 13) (9 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (68 : Fin 78) (56 : Fin 78) (53 : Fin 78)
    (71 : Fin 78) (52 : Fin 78) (74 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h7023` (kalmanson). -/
theorem middleSource_h7023 :
    ((!((allOneRankAtom (sourceRanks P) 53 == allOneRankAtom (sourceRanks P) 56)) || ((allOneRankAtom (sourceRanks P) 68).ult (allOneRankAtom (sourceRanks P) 71)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (71 : Fin 78) (53 : Fin 78)
    (68 : Fin 78) (56 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (8 : Fin 13) (9 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (68 : Fin 78) (56 : Fin 78) (53 : Fin 78)
    (71 : Fin 78) (52 : Fin 78) (74 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h7024` (kalmanson). -/
theorem middleSource_h7024 :
    ((!((allOneRankAtom (sourceRanks P) 53 == allOneRankAtom (sourceRanks P) 68)) || ((allOneRankAtom (sourceRanks P) 56).ult (allOneRankAtom (sourceRanks P) 71)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (71 : Fin 78) (53 : Fin 78)
    (56 : Fin 78) (68 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (8 : Fin 13) (9 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (68 : Fin 78) (56 : Fin 78) (53 : Fin 78)
    (71 : Fin 78) (52 : Fin 78) (74 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h7025` (kalmanson). -/
theorem middleSource_h7025 :
    ((!((allOneRankAtom (sourceRanks P) 54 == allOneRankAtom (sourceRanks P) 52)) || ((allOneRankAtom (sourceRanks P) 75).ult (allOneRankAtom (sourceRanks P) 70)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (70 : Fin 78) (54 : Fin 78)
    (75 : Fin 78) (52 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (8 : Fin 13) (10 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (69 : Fin 78) (55 : Fin 78) (54 : Fin 78)
    (70 : Fin 78) (52 : Fin 78) (75 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h7026` (kalmanson). -/
theorem middleSource_h7026 :
    ((!((allOneRankAtom (sourceRanks P) 54 == allOneRankAtom (sourceRanks P) 75)) || ((allOneRankAtom (sourceRanks P) 52).ult (allOneRankAtom (sourceRanks P) 70)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (70 : Fin 78) (54 : Fin 78)
    (52 : Fin 78) (75 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (8 : Fin 13) (10 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (69 : Fin 78) (55 : Fin 78) (54 : Fin 78)
    (70 : Fin 78) (52 : Fin 78) (75 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h7027` (kalmanson). -/
theorem middleSource_h7027 :
    ((!((allOneRankAtom (sourceRanks P) 70 == allOneRankAtom (sourceRanks P) 52)) || ((allOneRankAtom (sourceRanks P) 75).ult (allOneRankAtom (sourceRanks P) 54)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (54 : Fin 78) (70 : Fin 78)
    (75 : Fin 78) (52 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (8 : Fin 13) (10 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (69 : Fin 78) (55 : Fin 78) (54 : Fin 78)
    (70 : Fin 78) (52 : Fin 78) (75 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h7028` (kalmanson). -/
theorem middleSource_h7028 :
    ((!((allOneRankAtom (sourceRanks P) 70 == allOneRankAtom (sourceRanks P) 75)) || ((allOneRankAtom (sourceRanks P) 52).ult (allOneRankAtom (sourceRanks P) 54)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (54 : Fin 78) (70 : Fin 78)
    (52 : Fin 78) (75 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (8 : Fin 13) (10 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (69 : Fin 78) (55 : Fin 78) (54 : Fin 78)
    (70 : Fin 78) (52 : Fin 78) (75 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h7029` (kalmanson). -/
theorem middleSource_h7029 :
    ((!((allOneRankAtom (sourceRanks P) 54 == allOneRankAtom (sourceRanks P) 55)) || ((allOneRankAtom (sourceRanks P) 69).ult (allOneRankAtom (sourceRanks P) 70)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (70 : Fin 78) (54 : Fin 78)
    (69 : Fin 78) (55 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (8 : Fin 13) (10 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (69 : Fin 78) (55 : Fin 78) (54 : Fin 78)
    (70 : Fin 78) (52 : Fin 78) (75 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h7030` (kalmanson). -/
theorem middleSource_h7030 :
    ((!((allOneRankAtom (sourceRanks P) 54 == allOneRankAtom (sourceRanks P) 69)) || ((allOneRankAtom (sourceRanks P) 55).ult (allOneRankAtom (sourceRanks P) 70)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (70 : Fin 78) (54 : Fin 78)
    (55 : Fin 78) (69 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (8 : Fin 13) (10 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (69 : Fin 78) (55 : Fin 78) (54 : Fin 78)
    (70 : Fin 78) (52 : Fin 78) (75 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h7031` (kalmanson). -/
theorem middleSource_h7031 :
    ((!((allOneRankAtom (sourceRanks P) 70 == allOneRankAtom (sourceRanks P) 55)) || ((allOneRankAtom (sourceRanks P) 69).ult (allOneRankAtom (sourceRanks P) 54)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (54 : Fin 78) (70 : Fin 78)
    (69 : Fin 78) (55 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (8 : Fin 13) (10 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (69 : Fin 78) (55 : Fin 78) (54 : Fin 78)
    (70 : Fin 78) (52 : Fin 78) (75 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h7032` (kalmanson). -/
theorem middleSource_h7032 :
    ((!((allOneRankAtom (sourceRanks P) 54 == allOneRankAtom (sourceRanks P) 52)) || ((allOneRankAtom (sourceRanks P) 76).ult (allOneRankAtom (sourceRanks P) 71)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (71 : Fin 78) (54 : Fin 78)
    (76 : Fin 78) (52 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (8 : Fin 13) (10 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (69 : Fin 78) (56 : Fin 78) (54 : Fin 78)
    (71 : Fin 78) (52 : Fin 78) (76 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h7033` (kalmanson). -/
theorem middleSource_h7033 :
    ((!((allOneRankAtom (sourceRanks P) 54 == allOneRankAtom (sourceRanks P) 76)) || ((allOneRankAtom (sourceRanks P) 52).ult (allOneRankAtom (sourceRanks P) 71)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (71 : Fin 78) (54 : Fin 78)
    (52 : Fin 78) (76 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (8 : Fin 13) (10 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (69 : Fin 78) (56 : Fin 78) (54 : Fin 78)
    (71 : Fin 78) (52 : Fin 78) (76 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h7034` (kalmanson). -/
theorem middleSource_h7034 :
    ((!((allOneRankAtom (sourceRanks P) 71 == allOneRankAtom (sourceRanks P) 52)) || ((allOneRankAtom (sourceRanks P) 76).ult (allOneRankAtom (sourceRanks P) 54)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (54 : Fin 78) (71 : Fin 78)
    (76 : Fin 78) (52 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (8 : Fin 13) (10 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (69 : Fin 78) (56 : Fin 78) (54 : Fin 78)
    (71 : Fin 78) (52 : Fin 78) (76 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h7035` (kalmanson). -/
theorem middleSource_h7035 :
    ((!((allOneRankAtom (sourceRanks P) 54 == allOneRankAtom (sourceRanks P) 56)) || ((allOneRankAtom (sourceRanks P) 69).ult (allOneRankAtom (sourceRanks P) 71)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (71 : Fin 78) (54 : Fin 78)
    (69 : Fin 78) (56 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (8 : Fin 13) (10 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (69 : Fin 78) (56 : Fin 78) (54 : Fin 78)
    (71 : Fin 78) (52 : Fin 78) (76 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h7036` (kalmanson). -/
theorem middleSource_h7036 :
    ((!((allOneRankAtom (sourceRanks P) 54 == allOneRankAtom (sourceRanks P) 69)) || ((allOneRankAtom (sourceRanks P) 56).ult (allOneRankAtom (sourceRanks P) 71)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (71 : Fin 78) (54 : Fin 78)
    (56 : Fin 78) (69 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (8 : Fin 13) (10 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (69 : Fin 78) (56 : Fin 78) (54 : Fin 78)
    (71 : Fin 78) (52 : Fin 78) (76 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h7037` (kalmanson). -/
theorem middleSource_h7037 :
    ((!((allOneRankAtom (sourceRanks P) 55 == allOneRankAtom (sourceRanks P) 52)) || ((allOneRankAtom (sourceRanks P) 77).ult (allOneRankAtom (sourceRanks P) 71)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (71 : Fin 78) (55 : Fin 78)
    (77 : Fin 78) (52 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (8 : Fin 13) (11 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (70 : Fin 78) (56 : Fin 78) (55 : Fin 78)
    (71 : Fin 78) (52 : Fin 78) (77 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h7038` (kalmanson). -/
theorem middleSource_h7038 :
    ((!((allOneRankAtom (sourceRanks P) 55 == allOneRankAtom (sourceRanks P) 77)) || ((allOneRankAtom (sourceRanks P) 52).ult (allOneRankAtom (sourceRanks P) 71)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (71 : Fin 78) (55 : Fin 78)
    (52 : Fin 78) (77 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (8 : Fin 13) (11 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (70 : Fin 78) (56 : Fin 78) (55 : Fin 78)
    (71 : Fin 78) (52 : Fin 78) (77 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h7039` (kalmanson). -/
theorem middleSource_h7039 :
    ((!((allOneRankAtom (sourceRanks P) 55 == allOneRankAtom (sourceRanks P) 56)) || ((allOneRankAtom (sourceRanks P) 70).ult (allOneRankAtom (sourceRanks P) 71)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (71 : Fin 78) (55 : Fin 78)
    (70 : Fin 78) (56 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (8 : Fin 13) (11 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (70 : Fin 78) (56 : Fin 78) (55 : Fin 78)
    (71 : Fin 78) (52 : Fin 78) (77 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

end

end ATailExactFiveCard13AllOneSourceIngressScratch
end Problem97
