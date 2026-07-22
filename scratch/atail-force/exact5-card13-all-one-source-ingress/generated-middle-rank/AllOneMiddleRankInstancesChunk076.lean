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

/-- Candidate middle source assertion `h4864` (kalmanson). -/
theorem middleSource_h4864 :
    ((!((allOneRankAtom (sourceRanks P) 21 == allOneRankAtom (sourceRanks P) 14)) || ((allOneRankAtom (sourceRanks P) 77).ult (allOneRankAtom (sourceRanks P) 49)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (49 : Fin 78) (21 : Fin 78)
    (77 : Fin 78) (14 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (11 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (48 : Fin 78) (22 : Fin 78) (21 : Fin 78)
    (49 : Fin 78) (14 : Fin 78) (77 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4865` (kalmanson). -/
theorem middleSource_h4865 :
    ((!((allOneRankAtom (sourceRanks P) 21 == allOneRankAtom (sourceRanks P) 77)) || ((allOneRankAtom (sourceRanks P) 14).ult (allOneRankAtom (sourceRanks P) 49)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (49 : Fin 78) (21 : Fin 78)
    (14 : Fin 78) (77 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (11 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (48 : Fin 78) (22 : Fin 78) (21 : Fin 78)
    (49 : Fin 78) (14 : Fin 78) (77 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4866` (kalmanson). -/
theorem middleSource_h4866 :
    ((!((allOneRankAtom (sourceRanks P) 49 == allOneRankAtom (sourceRanks P) 14)) || ((allOneRankAtom (sourceRanks P) 77).ult (allOneRankAtom (sourceRanks P) 21)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (21 : Fin 78) (49 : Fin 78)
    (77 : Fin 78) (14 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (11 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (48 : Fin 78) (22 : Fin 78) (21 : Fin 78)
    (49 : Fin 78) (14 : Fin 78) (77 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4867` (kalmanson). -/
theorem middleSource_h4867 :
    ((!((allOneRankAtom (sourceRanks P) 49 == allOneRankAtom (sourceRanks P) 77)) || ((allOneRankAtom (sourceRanks P) 14).ult (allOneRankAtom (sourceRanks P) 21)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (21 : Fin 78) (49 : Fin 78)
    (14 : Fin 78) (77 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (11 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (48 : Fin 78) (22 : Fin 78) (21 : Fin 78)
    (49 : Fin 78) (14 : Fin 78) (77 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4868` (kalmanson). -/
theorem middleSource_h4868 :
    ((!((allOneRankAtom (sourceRanks P) 21 == allOneRankAtom (sourceRanks P) 22)) || ((allOneRankAtom (sourceRanks P) 48).ult (allOneRankAtom (sourceRanks P) 49)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (49 : Fin 78) (21 : Fin 78)
    (48 : Fin 78) (22 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (11 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (48 : Fin 78) (22 : Fin 78) (21 : Fin 78)
    (49 : Fin 78) (14 : Fin 78) (77 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4869` (kalmanson). -/
theorem middleSource_h4869 :
    ((!((allOneRankAtom (sourceRanks P) 21 == allOneRankAtom (sourceRanks P) 48)) || ((allOneRankAtom (sourceRanks P) 22).ult (allOneRankAtom (sourceRanks P) 49)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (49 : Fin 78) (21 : Fin 78)
    (22 : Fin 78) (48 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (11 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (48 : Fin 78) (22 : Fin 78) (21 : Fin 78)
    (49 : Fin 78) (14 : Fin 78) (77 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4870` (kalmanson). -/
theorem middleSource_h4870 :
    ((!((allOneRankAtom (sourceRanks P) 49 == allOneRankAtom (sourceRanks P) 48)) || ((allOneRankAtom (sourceRanks P) 22).ult (allOneRankAtom (sourceRanks P) 21)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (21 : Fin 78) (49 : Fin 78)
    (22 : Fin 78) (48 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (11 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (48 : Fin 78) (22 : Fin 78) (21 : Fin 78)
    (49 : Fin 78) (14 : Fin 78) (77 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4871` (kalmanson). -/
theorem middleSource_h4871 :
    ((!((allOneRankAtom (sourceRanks P) 16 == allOneRankAtom (sourceRanks P) 15)) || ((allOneRankAtom (sourceRanks P) 57).ult (allOneRankAtom (sourceRanks P) 51)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (51 : Fin 78) (16 : Fin 78)
    (57 : Fin 78) (15 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (5 : Fin 13) (6 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (17 : Fin 78) (16 : Fin 78)
    (51 : Fin 78) (15 : Fin 78) (57 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4872` (kalmanson). -/
theorem middleSource_h4872 :
    ((!((allOneRankAtom (sourceRanks P) 16 == allOneRankAtom (sourceRanks P) 57)) || ((allOneRankAtom (sourceRanks P) 15).ult (allOneRankAtom (sourceRanks P) 51)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (51 : Fin 78) (16 : Fin 78)
    (15 : Fin 78) (57 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (5 : Fin 13) (6 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (17 : Fin 78) (16 : Fin 78)
    (51 : Fin 78) (15 : Fin 78) (57 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4873` (kalmanson). -/
theorem middleSource_h4873 :
    ((!((allOneRankAtom (sourceRanks P) 51 == allOneRankAtom (sourceRanks P) 57)) || ((allOneRankAtom (sourceRanks P) 15).ult (allOneRankAtom (sourceRanks P) 16)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (16 : Fin 78) (51 : Fin 78)
    (15 : Fin 78) (57 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (5 : Fin 13) (6 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (17 : Fin 78) (16 : Fin 78)
    (51 : Fin 78) (15 : Fin 78) (57 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4874` (kalmanson). -/
theorem middleSource_h4874 :
    ((!((allOneRankAtom (sourceRanks P) 16 == allOneRankAtom (sourceRanks P) 17)) || ((allOneRankAtom (sourceRanks P) 50).ult (allOneRankAtom (sourceRanks P) 51)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (51 : Fin 78) (16 : Fin 78)
    (50 : Fin 78) (17 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (5 : Fin 13) (6 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (17 : Fin 78) (16 : Fin 78)
    (51 : Fin 78) (15 : Fin 78) (57 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4875` (kalmanson). -/
theorem middleSource_h4875 :
    ((!((allOneRankAtom (sourceRanks P) 16 == allOneRankAtom (sourceRanks P) 50)) || ((allOneRankAtom (sourceRanks P) 17).ult (allOneRankAtom (sourceRanks P) 51)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (51 : Fin 78) (16 : Fin 78)
    (17 : Fin 78) (50 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (5 : Fin 13) (6 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (17 : Fin 78) (16 : Fin 78)
    (51 : Fin 78) (15 : Fin 78) (57 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4876` (kalmanson). -/
theorem middleSource_h4876 :
    ((!((allOneRankAtom (sourceRanks P) 51 == allOneRankAtom (sourceRanks P) 50)) || ((allOneRankAtom (sourceRanks P) 17).ult (allOneRankAtom (sourceRanks P) 16)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (16 : Fin 78) (51 : Fin 78)
    (17 : Fin 78) (50 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (5 : Fin 13) (6 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (17 : Fin 78) (16 : Fin 78)
    (51 : Fin 78) (15 : Fin 78) (57 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4877` (kalmanson). -/
theorem middleSource_h4877 :
    ((!((allOneRankAtom (sourceRanks P) 16 == allOneRankAtom (sourceRanks P) 15)) || ((allOneRankAtom (sourceRanks P) 58).ult (allOneRankAtom (sourceRanks P) 52)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (52 : Fin 78) (16 : Fin 78)
    (58 : Fin 78) (15 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (5 : Fin 13) (6 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (18 : Fin 78) (16 : Fin 78)
    (52 : Fin 78) (15 : Fin 78) (58 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4878` (kalmanson). -/
theorem middleSource_h4878 :
    ((!((allOneRankAtom (sourceRanks P) 16 == allOneRankAtom (sourceRanks P) 58)) || ((allOneRankAtom (sourceRanks P) 15).ult (allOneRankAtom (sourceRanks P) 52)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (52 : Fin 78) (16 : Fin 78)
    (15 : Fin 78) (58 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (5 : Fin 13) (6 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (18 : Fin 78) (16 : Fin 78)
    (52 : Fin 78) (15 : Fin 78) (58 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4879` (kalmanson). -/
theorem middleSource_h4879 :
    ((!((allOneRankAtom (sourceRanks P) 52 == allOneRankAtom (sourceRanks P) 15)) || ((allOneRankAtom (sourceRanks P) 58).ult (allOneRankAtom (sourceRanks P) 16)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (16 : Fin 78) (52 : Fin 78)
    (58 : Fin 78) (15 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (5 : Fin 13) (6 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (18 : Fin 78) (16 : Fin 78)
    (52 : Fin 78) (15 : Fin 78) (58 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4880` (kalmanson). -/
theorem middleSource_h4880 :
    ((!((allOneRankAtom (sourceRanks P) 16 == allOneRankAtom (sourceRanks P) 18)) || ((allOneRankAtom (sourceRanks P) 50).ult (allOneRankAtom (sourceRanks P) 52)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (52 : Fin 78) (16 : Fin 78)
    (50 : Fin 78) (18 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (5 : Fin 13) (6 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (18 : Fin 78) (16 : Fin 78)
    (52 : Fin 78) (15 : Fin 78) (58 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4881` (kalmanson). -/
theorem middleSource_h4881 :
    ((!((allOneRankAtom (sourceRanks P) 16 == allOneRankAtom (sourceRanks P) 50)) || ((allOneRankAtom (sourceRanks P) 18).ult (allOneRankAtom (sourceRanks P) 52)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (52 : Fin 78) (16 : Fin 78)
    (18 : Fin 78) (50 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (5 : Fin 13) (6 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (18 : Fin 78) (16 : Fin 78)
    (52 : Fin 78) (15 : Fin 78) (58 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4882` (kalmanson). -/
theorem middleSource_h4882 :
    ((!((allOneRankAtom (sourceRanks P) 52 == allOneRankAtom (sourceRanks P) 18)) || ((allOneRankAtom (sourceRanks P) 50).ult (allOneRankAtom (sourceRanks P) 16)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (16 : Fin 78) (52 : Fin 78)
    (50 : Fin 78) (18 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (5 : Fin 13) (6 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (18 : Fin 78) (16 : Fin 78)
    (52 : Fin 78) (15 : Fin 78) (58 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4883` (kalmanson). -/
theorem middleSource_h4883 :
    ((!((allOneRankAtom (sourceRanks P) 52 == allOneRankAtom (sourceRanks P) 50)) || ((allOneRankAtom (sourceRanks P) 18).ult (allOneRankAtom (sourceRanks P) 16)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (16 : Fin 78) (52 : Fin 78)
    (18 : Fin 78) (50 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (5 : Fin 13) (6 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (18 : Fin 78) (16 : Fin 78)
    (52 : Fin 78) (15 : Fin 78) (58 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4884` (kalmanson). -/
theorem middleSource_h4884 :
    ((!((allOneRankAtom (sourceRanks P) 16 == allOneRankAtom (sourceRanks P) 15)) || ((allOneRankAtom (sourceRanks P) 59).ult (allOneRankAtom (sourceRanks P) 53)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (53 : Fin 78) (16 : Fin 78)
    (59 : Fin 78) (15 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (5 : Fin 13) (6 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (19 : Fin 78) (16 : Fin 78)
    (53 : Fin 78) (15 : Fin 78) (59 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4885` (kalmanson). -/
theorem middleSource_h4885 :
    ((!((allOneRankAtom (sourceRanks P) 16 == allOneRankAtom (sourceRanks P) 59)) || ((allOneRankAtom (sourceRanks P) 15).ult (allOneRankAtom (sourceRanks P) 53)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (53 : Fin 78) (16 : Fin 78)
    (15 : Fin 78) (59 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (5 : Fin 13) (6 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (19 : Fin 78) (16 : Fin 78)
    (53 : Fin 78) (15 : Fin 78) (59 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4886` (kalmanson). -/
theorem middleSource_h4886 :
    ((!((allOneRankAtom (sourceRanks P) 53 == allOneRankAtom (sourceRanks P) 15)) || ((allOneRankAtom (sourceRanks P) 59).ult (allOneRankAtom (sourceRanks P) 16)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (16 : Fin 78) (53 : Fin 78)
    (59 : Fin 78) (15 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (5 : Fin 13) (6 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (19 : Fin 78) (16 : Fin 78)
    (53 : Fin 78) (15 : Fin 78) (59 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4887` (kalmanson). -/
theorem middleSource_h4887 :
    ((!((allOneRankAtom (sourceRanks P) 53 == allOneRankAtom (sourceRanks P) 59)) || ((allOneRankAtom (sourceRanks P) 15).ult (allOneRankAtom (sourceRanks P) 16)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (16 : Fin 78) (53 : Fin 78)
    (15 : Fin 78) (59 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (5 : Fin 13) (6 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (19 : Fin 78) (16 : Fin 78)
    (53 : Fin 78) (15 : Fin 78) (59 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4888` (kalmanson). -/
theorem middleSource_h4888 :
    ((!((allOneRankAtom (sourceRanks P) 16 == allOneRankAtom (sourceRanks P) 19)) || ((allOneRankAtom (sourceRanks P) 50).ult (allOneRankAtom (sourceRanks P) 53)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (53 : Fin 78) (16 : Fin 78)
    (50 : Fin 78) (19 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (5 : Fin 13) (6 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (19 : Fin 78) (16 : Fin 78)
    (53 : Fin 78) (15 : Fin 78) (59 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4889` (kalmanson). -/
theorem middleSource_h4889 :
    ((!((allOneRankAtom (sourceRanks P) 16 == allOneRankAtom (sourceRanks P) 50)) || ((allOneRankAtom (sourceRanks P) 19).ult (allOneRankAtom (sourceRanks P) 53)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (53 : Fin 78) (16 : Fin 78)
    (19 : Fin 78) (50 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (5 : Fin 13) (6 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (19 : Fin 78) (16 : Fin 78)
    (53 : Fin 78) (15 : Fin 78) (59 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4890` (kalmanson). -/
theorem middleSource_h4890 :
    ((!((allOneRankAtom (sourceRanks P) 53 == allOneRankAtom (sourceRanks P) 19)) || ((allOneRankAtom (sourceRanks P) 50).ult (allOneRankAtom (sourceRanks P) 16)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (16 : Fin 78) (53 : Fin 78)
    (50 : Fin 78) (19 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (5 : Fin 13) (6 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (19 : Fin 78) (16 : Fin 78)
    (53 : Fin 78) (15 : Fin 78) (59 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4891` (kalmanson). -/
theorem middleSource_h4891 :
    ((!((allOneRankAtom (sourceRanks P) 53 == allOneRankAtom (sourceRanks P) 50)) || ((allOneRankAtom (sourceRanks P) 19).ult (allOneRankAtom (sourceRanks P) 16)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (16 : Fin 78) (53 : Fin 78)
    (19 : Fin 78) (50 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (5 : Fin 13) (6 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (19 : Fin 78) (16 : Fin 78)
    (53 : Fin 78) (15 : Fin 78) (59 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4892` (kalmanson). -/
theorem middleSource_h4892 :
    ((!((allOneRankAtom (sourceRanks P) 16 == allOneRankAtom (sourceRanks P) 15)) || ((allOneRankAtom (sourceRanks P) 60).ult (allOneRankAtom (sourceRanks P) 54)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (54 : Fin 78) (16 : Fin 78)
    (60 : Fin 78) (15 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (5 : Fin 13) (6 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (20 : Fin 78) (16 : Fin 78)
    (54 : Fin 78) (15 : Fin 78) (60 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4893` (kalmanson). -/
theorem middleSource_h4893 :
    ((!((allOneRankAtom (sourceRanks P) 16 == allOneRankAtom (sourceRanks P) 60)) || ((allOneRankAtom (sourceRanks P) 15).ult (allOneRankAtom (sourceRanks P) 54)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (54 : Fin 78) (16 : Fin 78)
    (15 : Fin 78) (60 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (5 : Fin 13) (6 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (20 : Fin 78) (16 : Fin 78)
    (54 : Fin 78) (15 : Fin 78) (60 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4894` (kalmanson). -/
theorem middleSource_h4894 :
    ((!((allOneRankAtom (sourceRanks P) 54 == allOneRankAtom (sourceRanks P) 15)) || ((allOneRankAtom (sourceRanks P) 60).ult (allOneRankAtom (sourceRanks P) 16)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (16 : Fin 78) (54 : Fin 78)
    (60 : Fin 78) (15 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (5 : Fin 13) (6 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (20 : Fin 78) (16 : Fin 78)
    (54 : Fin 78) (15 : Fin 78) (60 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4895` (kalmanson). -/
theorem middleSource_h4895 :
    ((!((allOneRankAtom (sourceRanks P) 54 == allOneRankAtom (sourceRanks P) 60)) || ((allOneRankAtom (sourceRanks P) 15).ult (allOneRankAtom (sourceRanks P) 16)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (16 : Fin 78) (54 : Fin 78)
    (15 : Fin 78) (60 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (5 : Fin 13) (6 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (20 : Fin 78) (16 : Fin 78)
    (54 : Fin 78) (15 : Fin 78) (60 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4896` (kalmanson). -/
theorem middleSource_h4896 :
    ((!((allOneRankAtom (sourceRanks P) 16 == allOneRankAtom (sourceRanks P) 20)) || ((allOneRankAtom (sourceRanks P) 50).ult (allOneRankAtom (sourceRanks P) 54)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (54 : Fin 78) (16 : Fin 78)
    (50 : Fin 78) (20 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (5 : Fin 13) (6 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (20 : Fin 78) (16 : Fin 78)
    (54 : Fin 78) (15 : Fin 78) (60 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4897` (kalmanson). -/
theorem middleSource_h4897 :
    ((!((allOneRankAtom (sourceRanks P) 16 == allOneRankAtom (sourceRanks P) 50)) || ((allOneRankAtom (sourceRanks P) 20).ult (allOneRankAtom (sourceRanks P) 54)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (54 : Fin 78) (16 : Fin 78)
    (20 : Fin 78) (50 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (5 : Fin 13) (6 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (20 : Fin 78) (16 : Fin 78)
    (54 : Fin 78) (15 : Fin 78) (60 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4898` (kalmanson). -/
theorem middleSource_h4898 :
    ((!((allOneRankAtom (sourceRanks P) 54 == allOneRankAtom (sourceRanks P) 20)) || ((allOneRankAtom (sourceRanks P) 50).ult (allOneRankAtom (sourceRanks P) 16)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (16 : Fin 78) (54 : Fin 78)
    (50 : Fin 78) (20 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (5 : Fin 13) (6 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (20 : Fin 78) (16 : Fin 78)
    (54 : Fin 78) (15 : Fin 78) (60 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4899` (kalmanson). -/
theorem middleSource_h4899 :
    ((!((allOneRankAtom (sourceRanks P) 54 == allOneRankAtom (sourceRanks P) 50)) || ((allOneRankAtom (sourceRanks P) 20).ult (allOneRankAtom (sourceRanks P) 16)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (16 : Fin 78) (54 : Fin 78)
    (20 : Fin 78) (50 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (5 : Fin 13) (6 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (20 : Fin 78) (16 : Fin 78)
    (54 : Fin 78) (15 : Fin 78) (60 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4900` (kalmanson). -/
theorem middleSource_h4900 :
    ((!((allOneRankAtom (sourceRanks P) 16 == allOneRankAtom (sourceRanks P) 15)) || ((allOneRankAtom (sourceRanks P) 61).ult (allOneRankAtom (sourceRanks P) 55)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (55 : Fin 78) (16 : Fin 78)
    (61 : Fin 78) (15 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (5 : Fin 13) (6 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (21 : Fin 78) (16 : Fin 78)
    (55 : Fin 78) (15 : Fin 78) (61 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4901` (kalmanson). -/
theorem middleSource_h4901 :
    ((!((allOneRankAtom (sourceRanks P) 16 == allOneRankAtom (sourceRanks P) 61)) || ((allOneRankAtom (sourceRanks P) 15).ult (allOneRankAtom (sourceRanks P) 55)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (55 : Fin 78) (16 : Fin 78)
    (15 : Fin 78) (61 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (5 : Fin 13) (6 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (21 : Fin 78) (16 : Fin 78)
    (55 : Fin 78) (15 : Fin 78) (61 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4902` (kalmanson). -/
theorem middleSource_h4902 :
    ((!((allOneRankAtom (sourceRanks P) 55 == allOneRankAtom (sourceRanks P) 15)) || ((allOneRankAtom (sourceRanks P) 61).ult (allOneRankAtom (sourceRanks P) 16)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (16 : Fin 78) (55 : Fin 78)
    (61 : Fin 78) (15 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (5 : Fin 13) (6 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (21 : Fin 78) (16 : Fin 78)
    (55 : Fin 78) (15 : Fin 78) (61 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4903` (kalmanson). -/
theorem middleSource_h4903 :
    ((!((allOneRankAtom (sourceRanks P) 55 == allOneRankAtom (sourceRanks P) 61)) || ((allOneRankAtom (sourceRanks P) 15).ult (allOneRankAtom (sourceRanks P) 16)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (16 : Fin 78) (55 : Fin 78)
    (15 : Fin 78) (61 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (5 : Fin 13) (6 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (21 : Fin 78) (16 : Fin 78)
    (55 : Fin 78) (15 : Fin 78) (61 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4904` (kalmanson). -/
theorem middleSource_h4904 :
    ((!((allOneRankAtom (sourceRanks P) 16 == allOneRankAtom (sourceRanks P) 21)) || ((allOneRankAtom (sourceRanks P) 50).ult (allOneRankAtom (sourceRanks P) 55)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (55 : Fin 78) (16 : Fin 78)
    (50 : Fin 78) (21 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (5 : Fin 13) (6 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (21 : Fin 78) (16 : Fin 78)
    (55 : Fin 78) (15 : Fin 78) (61 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4905` (kalmanson). -/
theorem middleSource_h4905 :
    ((!((allOneRankAtom (sourceRanks P) 16 == allOneRankAtom (sourceRanks P) 50)) || ((allOneRankAtom (sourceRanks P) 21).ult (allOneRankAtom (sourceRanks P) 55)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (55 : Fin 78) (16 : Fin 78)
    (21 : Fin 78) (50 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (5 : Fin 13) (6 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (21 : Fin 78) (16 : Fin 78)
    (55 : Fin 78) (15 : Fin 78) (61 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4906` (kalmanson). -/
theorem middleSource_h4906 :
    ((!((allOneRankAtom (sourceRanks P) 55 == allOneRankAtom (sourceRanks P) 21)) || ((allOneRankAtom (sourceRanks P) 50).ult (allOneRankAtom (sourceRanks P) 16)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (16 : Fin 78) (55 : Fin 78)
    (50 : Fin 78) (21 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (5 : Fin 13) (6 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (21 : Fin 78) (16 : Fin 78)
    (55 : Fin 78) (15 : Fin 78) (61 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4907` (kalmanson). -/
theorem middleSource_h4907 :
    ((!((allOneRankAtom (sourceRanks P) 55 == allOneRankAtom (sourceRanks P) 50)) || ((allOneRankAtom (sourceRanks P) 21).ult (allOneRankAtom (sourceRanks P) 16)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (16 : Fin 78) (55 : Fin 78)
    (21 : Fin 78) (50 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (5 : Fin 13) (6 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (21 : Fin 78) (16 : Fin 78)
    (55 : Fin 78) (15 : Fin 78) (61 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4908` (kalmanson). -/
theorem middleSource_h4908 :
    ((!((allOneRankAtom (sourceRanks P) 16 == allOneRankAtom (sourceRanks P) 15)) || ((allOneRankAtom (sourceRanks P) 62).ult (allOneRankAtom (sourceRanks P) 56)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (56 : Fin 78) (16 : Fin 78)
    (62 : Fin 78) (15 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (5 : Fin 13) (6 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (22 : Fin 78) (16 : Fin 78)
    (56 : Fin 78) (15 : Fin 78) (62 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4909` (kalmanson). -/
theorem middleSource_h4909 :
    ((!((allOneRankAtom (sourceRanks P) 16 == allOneRankAtom (sourceRanks P) 62)) || ((allOneRankAtom (sourceRanks P) 15).ult (allOneRankAtom (sourceRanks P) 56)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (56 : Fin 78) (16 : Fin 78)
    (15 : Fin 78) (62 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (5 : Fin 13) (6 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (22 : Fin 78) (16 : Fin 78)
    (56 : Fin 78) (15 : Fin 78) (62 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4910` (kalmanson). -/
theorem middleSource_h4910 :
    ((!((allOneRankAtom (sourceRanks P) 56 == allOneRankAtom (sourceRanks P) 15)) || ((allOneRankAtom (sourceRanks P) 62).ult (allOneRankAtom (sourceRanks P) 16)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (16 : Fin 78) (56 : Fin 78)
    (62 : Fin 78) (15 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (5 : Fin 13) (6 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (22 : Fin 78) (16 : Fin 78)
    (56 : Fin 78) (15 : Fin 78) (62 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4911` (kalmanson). -/
theorem middleSource_h4911 :
    ((!((allOneRankAtom (sourceRanks P) 56 == allOneRankAtom (sourceRanks P) 62)) || ((allOneRankAtom (sourceRanks P) 15).ult (allOneRankAtom (sourceRanks P) 16)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (16 : Fin 78) (56 : Fin 78)
    (15 : Fin 78) (62 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (5 : Fin 13) (6 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (22 : Fin 78) (16 : Fin 78)
    (56 : Fin 78) (15 : Fin 78) (62 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4912` (kalmanson). -/
theorem middleSource_h4912 :
    ((!((allOneRankAtom (sourceRanks P) 16 == allOneRankAtom (sourceRanks P) 22)) || ((allOneRankAtom (sourceRanks P) 50).ult (allOneRankAtom (sourceRanks P) 56)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (56 : Fin 78) (16 : Fin 78)
    (50 : Fin 78) (22 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (5 : Fin 13) (6 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (22 : Fin 78) (16 : Fin 78)
    (56 : Fin 78) (15 : Fin 78) (62 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4913` (kalmanson). -/
theorem middleSource_h4913 :
    ((!((allOneRankAtom (sourceRanks P) 16 == allOneRankAtom (sourceRanks P) 50)) || ((allOneRankAtom (sourceRanks P) 22).ult (allOneRankAtom (sourceRanks P) 56)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (56 : Fin 78) (16 : Fin 78)
    (22 : Fin 78) (50 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (5 : Fin 13) (6 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (22 : Fin 78) (16 : Fin 78)
    (56 : Fin 78) (15 : Fin 78) (62 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4914` (kalmanson). -/
theorem middleSource_h4914 :
    ((!((allOneRankAtom (sourceRanks P) 56 == allOneRankAtom (sourceRanks P) 50)) || ((allOneRankAtom (sourceRanks P) 22).ult (allOneRankAtom (sourceRanks P) 16)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (16 : Fin 78) (56 : Fin 78)
    (22 : Fin 78) (50 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (5 : Fin 13) (6 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (22 : Fin 78) (16 : Fin 78)
    (56 : Fin 78) (15 : Fin 78) (62 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4915` (kalmanson). -/
theorem middleSource_h4915 :
    ((!((allOneRankAtom (sourceRanks P) 17 == allOneRankAtom (sourceRanks P) 15)) || ((allOneRankAtom (sourceRanks P) 63).ult (allOneRankAtom (sourceRanks P) 52)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (52 : Fin 78) (17 : Fin 78)
    (63 : Fin 78) (15 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (5 : Fin 13) (7 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (51 : Fin 78) (18 : Fin 78) (17 : Fin 78)
    (52 : Fin 78) (15 : Fin 78) (63 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4916` (kalmanson). -/
theorem middleSource_h4916 :
    ((!((allOneRankAtom (sourceRanks P) 17 == allOneRankAtom (sourceRanks P) 63)) || ((allOneRankAtom (sourceRanks P) 15).ult (allOneRankAtom (sourceRanks P) 52)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (52 : Fin 78) (17 : Fin 78)
    (15 : Fin 78) (63 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (5 : Fin 13) (7 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (51 : Fin 78) (18 : Fin 78) (17 : Fin 78)
    (52 : Fin 78) (15 : Fin 78) (63 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4917` (kalmanson). -/
theorem middleSource_h4917 :
    ((!((allOneRankAtom (sourceRanks P) 52 == allOneRankAtom (sourceRanks P) 15)) || ((allOneRankAtom (sourceRanks P) 63).ult (allOneRankAtom (sourceRanks P) 17)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (17 : Fin 78) (52 : Fin 78)
    (63 : Fin 78) (15 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (5 : Fin 13) (7 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (51 : Fin 78) (18 : Fin 78) (17 : Fin 78)
    (52 : Fin 78) (15 : Fin 78) (63 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4918` (kalmanson). -/
theorem middleSource_h4918 :
    ((!((allOneRankAtom (sourceRanks P) 17 == allOneRankAtom (sourceRanks P) 18)) || ((allOneRankAtom (sourceRanks P) 51).ult (allOneRankAtom (sourceRanks P) 52)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (52 : Fin 78) (17 : Fin 78)
    (51 : Fin 78) (18 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (5 : Fin 13) (7 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (51 : Fin 78) (18 : Fin 78) (17 : Fin 78)
    (52 : Fin 78) (15 : Fin 78) (63 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4919` (kalmanson). -/
theorem middleSource_h4919 :
    ((!((allOneRankAtom (sourceRanks P) 52 == allOneRankAtom (sourceRanks P) 18)) || ((allOneRankAtom (sourceRanks P) 51).ult (allOneRankAtom (sourceRanks P) 17)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (17 : Fin 78) (52 : Fin 78)
    (51 : Fin 78) (18 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (5 : Fin 13) (7 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (51 : Fin 78) (18 : Fin 78) (17 : Fin 78)
    (52 : Fin 78) (15 : Fin 78) (63 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4920` (kalmanson). -/
theorem middleSource_h4920 :
    ((!((allOneRankAtom (sourceRanks P) 52 == allOneRankAtom (sourceRanks P) 51)) || ((allOneRankAtom (sourceRanks P) 18).ult (allOneRankAtom (sourceRanks P) 17)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (17 : Fin 78) (52 : Fin 78)
    (18 : Fin 78) (51 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (5 : Fin 13) (7 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (51 : Fin 78) (18 : Fin 78) (17 : Fin 78)
    (52 : Fin 78) (15 : Fin 78) (63 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4921` (kalmanson). -/
theorem middleSource_h4921 :
    ((!((allOneRankAtom (sourceRanks P) 17 == allOneRankAtom (sourceRanks P) 15)) || ((allOneRankAtom (sourceRanks P) 64).ult (allOneRankAtom (sourceRanks P) 53)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (53 : Fin 78) (17 : Fin 78)
    (64 : Fin 78) (15 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (5 : Fin 13) (7 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (51 : Fin 78) (19 : Fin 78) (17 : Fin 78)
    (53 : Fin 78) (15 : Fin 78) (64 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4922` (kalmanson). -/
theorem middleSource_h4922 :
    ((!((allOneRankAtom (sourceRanks P) 17 == allOneRankAtom (sourceRanks P) 64)) || ((allOneRankAtom (sourceRanks P) 15).ult (allOneRankAtom (sourceRanks P) 53)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (53 : Fin 78) (17 : Fin 78)
    (15 : Fin 78) (64 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (5 : Fin 13) (7 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (51 : Fin 78) (19 : Fin 78) (17 : Fin 78)
    (53 : Fin 78) (15 : Fin 78) (64 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4923` (kalmanson). -/
theorem middleSource_h4923 :
    ((!((allOneRankAtom (sourceRanks P) 53 == allOneRankAtom (sourceRanks P) 15)) || ((allOneRankAtom (sourceRanks P) 64).ult (allOneRankAtom (sourceRanks P) 17)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (17 : Fin 78) (53 : Fin 78)
    (64 : Fin 78) (15 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (5 : Fin 13) (7 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (51 : Fin 78) (19 : Fin 78) (17 : Fin 78)
    (53 : Fin 78) (15 : Fin 78) (64 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4924` (kalmanson). -/
theorem middleSource_h4924 :
    ((!((allOneRankAtom (sourceRanks P) 53 == allOneRankAtom (sourceRanks P) 64)) || ((allOneRankAtom (sourceRanks P) 15).ult (allOneRankAtom (sourceRanks P) 17)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (17 : Fin 78) (53 : Fin 78)
    (15 : Fin 78) (64 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (5 : Fin 13) (7 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (51 : Fin 78) (19 : Fin 78) (17 : Fin 78)
    (53 : Fin 78) (15 : Fin 78) (64 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4925` (kalmanson). -/
theorem middleSource_h4925 :
    ((!((allOneRankAtom (sourceRanks P) 17 == allOneRankAtom (sourceRanks P) 19)) || ((allOneRankAtom (sourceRanks P) 51).ult (allOneRankAtom (sourceRanks P) 53)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (53 : Fin 78) (17 : Fin 78)
    (51 : Fin 78) (19 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (5 : Fin 13) (7 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (51 : Fin 78) (19 : Fin 78) (17 : Fin 78)
    (53 : Fin 78) (15 : Fin 78) (64 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4926` (kalmanson). -/
theorem middleSource_h4926 :
    ((!((allOneRankAtom (sourceRanks P) 53 == allOneRankAtom (sourceRanks P) 19)) || ((allOneRankAtom (sourceRanks P) 51).ult (allOneRankAtom (sourceRanks P) 17)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (17 : Fin 78) (53 : Fin 78)
    (51 : Fin 78) (19 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (5 : Fin 13) (7 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (51 : Fin 78) (19 : Fin 78) (17 : Fin 78)
    (53 : Fin 78) (15 : Fin 78) (64 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4927` (kalmanson). -/
theorem middleSource_h4927 :
    ((!((allOneRankAtom (sourceRanks P) 53 == allOneRankAtom (sourceRanks P) 51)) || ((allOneRankAtom (sourceRanks P) 19).ult (allOneRankAtom (sourceRanks P) 17)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (17 : Fin 78) (53 : Fin 78)
    (19 : Fin 78) (51 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (5 : Fin 13) (7 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (51 : Fin 78) (19 : Fin 78) (17 : Fin 78)
    (53 : Fin 78) (15 : Fin 78) (64 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

end

end ATailExactFiveCard13AllOneSourceIngressScratch
end Problem97
