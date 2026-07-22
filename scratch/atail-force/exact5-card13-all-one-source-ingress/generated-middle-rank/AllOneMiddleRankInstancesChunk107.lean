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

/-- Candidate middle source assertion `h6848` (kalmanson). -/
theorem middleSource_h6848 :
    ((!((allOneRankAtom (sourceRanks P) 48 == allOneRankAtom (sourceRanks P) 77)) || ((allOneRankAtom (sourceRanks P) 47).ult (allOneRankAtom (sourceRanks P) 76)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (76 : Fin 78) (48 : Fin 78)
    (47 : Fin 78) (77 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (10 : Fin 13) (11 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (75 : Fin 78) (49 : Fin 78) (48 : Fin 78)
    (76 : Fin 78) (47 : Fin 78) (77 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6849` (kalmanson). -/
theorem middleSource_h6849 :
    ((!((allOneRankAtom (sourceRanks P) 76 == allOneRankAtom (sourceRanks P) 47)) || ((allOneRankAtom (sourceRanks P) 77).ult (allOneRankAtom (sourceRanks P) 48)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (48 : Fin 78) (76 : Fin 78)
    (77 : Fin 78) (47 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (10 : Fin 13) (11 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (75 : Fin 78) (49 : Fin 78) (48 : Fin 78)
    (76 : Fin 78) (47 : Fin 78) (77 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6850` (kalmanson). -/
theorem middleSource_h6850 :
    ((!((allOneRankAtom (sourceRanks P) 48 == allOneRankAtom (sourceRanks P) 49)) || ((allOneRankAtom (sourceRanks P) 75).ult (allOneRankAtom (sourceRanks P) 76)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (76 : Fin 78) (48 : Fin 78)
    (75 : Fin 78) (49 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (10 : Fin 13) (11 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (75 : Fin 78) (49 : Fin 78) (48 : Fin 78)
    (76 : Fin 78) (47 : Fin 78) (77 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6851` (kalmanson). -/
theorem middleSource_h6851 :
    ((!((allOneRankAtom (sourceRanks P) 48 == allOneRankAtom (sourceRanks P) 75)) || ((allOneRankAtom (sourceRanks P) 49).ult (allOneRankAtom (sourceRanks P) 76)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (76 : Fin 78) (48 : Fin 78)
    (49 : Fin 78) (75 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (10 : Fin 13) (11 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (75 : Fin 78) (49 : Fin 78) (48 : Fin 78)
    (76 : Fin 78) (47 : Fin 78) (77 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6852` (kalmanson). -/
theorem middleSource_h6852 :
    ((!((allOneRankAtom (sourceRanks P) 76 == allOneRankAtom (sourceRanks P) 75)) || ((allOneRankAtom (sourceRanks P) 49).ult (allOneRankAtom (sourceRanks P) 48)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (48 : Fin 78) (76 : Fin 78)
    (49 : Fin 78) (75 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (10 : Fin 13) (11 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (75 : Fin 78) (49 : Fin 78) (48 : Fin 78)
    (76 : Fin 78) (47 : Fin 78) (77 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6853` (kalmanson). -/
theorem middleSource_h6853 :
    ((!((allOneRankAtom (sourceRanks P) 51 == allOneRankAtom (sourceRanks P) 50)) || ((allOneRankAtom (sourceRanks P) 63).ult (allOneRankAtom (sourceRanks P) 58)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (58 : Fin 78) (51 : Fin 78)
    (63 : Fin 78) (50 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (6 : Fin 13) (7 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (52 : Fin 78) (51 : Fin 78)
    (58 : Fin 78) (50 : Fin 78) (63 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6854` (kalmanson). -/
theorem middleSource_h6854 :
    ((!((allOneRankAtom (sourceRanks P) 58 == allOneRankAtom (sourceRanks P) 50)) || ((allOneRankAtom (sourceRanks P) 63).ult (allOneRankAtom (sourceRanks P) 51)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (51 : Fin 78) (58 : Fin 78)
    (63 : Fin 78) (50 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (6 : Fin 13) (7 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (52 : Fin 78) (51 : Fin 78)
    (58 : Fin 78) (50 : Fin 78) (63 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6855` (kalmanson). -/
theorem middleSource_h6855 :
    ((!((allOneRankAtom (sourceRanks P) 51 == allOneRankAtom (sourceRanks P) 52)) || ((allOneRankAtom (sourceRanks P) 57).ult (allOneRankAtom (sourceRanks P) 58)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (58 : Fin 78) (51 : Fin 78)
    (57 : Fin 78) (52 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (6 : Fin 13) (7 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (52 : Fin 78) (51 : Fin 78)
    (58 : Fin 78) (50 : Fin 78) (63 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6856` (kalmanson). -/
theorem middleSource_h6856 :
    ((!((allOneRankAtom (sourceRanks P) 58 == allOneRankAtom (sourceRanks P) 57)) || ((allOneRankAtom (sourceRanks P) 52).ult (allOneRankAtom (sourceRanks P) 51)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (51 : Fin 78) (58 : Fin 78)
    (52 : Fin 78) (57 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (6 : Fin 13) (7 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (52 : Fin 78) (51 : Fin 78)
    (58 : Fin 78) (50 : Fin 78) (63 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6857` (kalmanson). -/
theorem middleSource_h6857 :
    ((!((allOneRankAtom (sourceRanks P) 51 == allOneRankAtom (sourceRanks P) 50)) || ((allOneRankAtom (sourceRanks P) 64).ult (allOneRankAtom (sourceRanks P) 59)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (59 : Fin 78) (51 : Fin 78)
    (64 : Fin 78) (50 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (6 : Fin 13) (7 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (53 : Fin 78) (51 : Fin 78)
    (59 : Fin 78) (50 : Fin 78) (64 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6858` (kalmanson). -/
theorem middleSource_h6858 :
    ((!((allOneRankAtom (sourceRanks P) 59 == allOneRankAtom (sourceRanks P) 50)) || ((allOneRankAtom (sourceRanks P) 64).ult (allOneRankAtom (sourceRanks P) 51)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (51 : Fin 78) (59 : Fin 78)
    (64 : Fin 78) (50 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (6 : Fin 13) (7 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (53 : Fin 78) (51 : Fin 78)
    (59 : Fin 78) (50 : Fin 78) (64 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6859` (kalmanson). -/
theorem middleSource_h6859 :
    ((!((allOneRankAtom (sourceRanks P) 59 == allOneRankAtom (sourceRanks P) 64)) || ((allOneRankAtom (sourceRanks P) 50).ult (allOneRankAtom (sourceRanks P) 51)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (51 : Fin 78) (59 : Fin 78)
    (50 : Fin 78) (64 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (6 : Fin 13) (7 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (53 : Fin 78) (51 : Fin 78)
    (59 : Fin 78) (50 : Fin 78) (64 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6860` (kalmanson). -/
theorem middleSource_h6860 :
    ((!((allOneRankAtom (sourceRanks P) 51 == allOneRankAtom (sourceRanks P) 53)) || ((allOneRankAtom (sourceRanks P) 57).ult (allOneRankAtom (sourceRanks P) 59)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (59 : Fin 78) (51 : Fin 78)
    (57 : Fin 78) (53 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (6 : Fin 13) (7 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (53 : Fin 78) (51 : Fin 78)
    (59 : Fin 78) (50 : Fin 78) (64 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6861` (kalmanson). -/
theorem middleSource_h6861 :
    ((!((allOneRankAtom (sourceRanks P) 59 == allOneRankAtom (sourceRanks P) 53)) || ((allOneRankAtom (sourceRanks P) 57).ult (allOneRankAtom (sourceRanks P) 51)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (51 : Fin 78) (59 : Fin 78)
    (57 : Fin 78) (53 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (6 : Fin 13) (7 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (53 : Fin 78) (51 : Fin 78)
    (59 : Fin 78) (50 : Fin 78) (64 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6862` (kalmanson). -/
theorem middleSource_h6862 :
    ((!((allOneRankAtom (sourceRanks P) 59 == allOneRankAtom (sourceRanks P) 57)) || ((allOneRankAtom (sourceRanks P) 53).ult (allOneRankAtom (sourceRanks P) 51)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (51 : Fin 78) (59 : Fin 78)
    (53 : Fin 78) (57 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (6 : Fin 13) (7 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (53 : Fin 78) (51 : Fin 78)
    (59 : Fin 78) (50 : Fin 78) (64 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6863` (kalmanson). -/
theorem middleSource_h6863 :
    ((!((allOneRankAtom (sourceRanks P) 51 == allOneRankAtom (sourceRanks P) 50)) || ((allOneRankAtom (sourceRanks P) 65).ult (allOneRankAtom (sourceRanks P) 60)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (60 : Fin 78) (51 : Fin 78)
    (65 : Fin 78) (50 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (6 : Fin 13) (7 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (54 : Fin 78) (51 : Fin 78)
    (60 : Fin 78) (50 : Fin 78) (65 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6864` (kalmanson). -/
theorem middleSource_h6864 :
    ((!((allOneRankAtom (sourceRanks P) 60 == allOneRankAtom (sourceRanks P) 50)) || ((allOneRankAtom (sourceRanks P) 65).ult (allOneRankAtom (sourceRanks P) 51)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (51 : Fin 78) (60 : Fin 78)
    (65 : Fin 78) (50 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (6 : Fin 13) (7 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (54 : Fin 78) (51 : Fin 78)
    (60 : Fin 78) (50 : Fin 78) (65 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6865` (kalmanson). -/
theorem middleSource_h6865 :
    ((!((allOneRankAtom (sourceRanks P) 60 == allOneRankAtom (sourceRanks P) 65)) || ((allOneRankAtom (sourceRanks P) 50).ult (allOneRankAtom (sourceRanks P) 51)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (51 : Fin 78) (60 : Fin 78)
    (50 : Fin 78) (65 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (6 : Fin 13) (7 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (54 : Fin 78) (51 : Fin 78)
    (60 : Fin 78) (50 : Fin 78) (65 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6866` (kalmanson). -/
theorem middleSource_h6866 :
    ((!((allOneRankAtom (sourceRanks P) 51 == allOneRankAtom (sourceRanks P) 54)) || ((allOneRankAtom (sourceRanks P) 57).ult (allOneRankAtom (sourceRanks P) 60)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (60 : Fin 78) (51 : Fin 78)
    (57 : Fin 78) (54 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (6 : Fin 13) (7 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (54 : Fin 78) (51 : Fin 78)
    (60 : Fin 78) (50 : Fin 78) (65 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6867` (kalmanson). -/
theorem middleSource_h6867 :
    ((!((allOneRankAtom (sourceRanks P) 60 == allOneRankAtom (sourceRanks P) 54)) || ((allOneRankAtom (sourceRanks P) 57).ult (allOneRankAtom (sourceRanks P) 51)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (51 : Fin 78) (60 : Fin 78)
    (57 : Fin 78) (54 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (6 : Fin 13) (7 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (54 : Fin 78) (51 : Fin 78)
    (60 : Fin 78) (50 : Fin 78) (65 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6868` (kalmanson). -/
theorem middleSource_h6868 :
    ((!((allOneRankAtom (sourceRanks P) 60 == allOneRankAtom (sourceRanks P) 57)) || ((allOneRankAtom (sourceRanks P) 54).ult (allOneRankAtom (sourceRanks P) 51)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (51 : Fin 78) (60 : Fin 78)
    (54 : Fin 78) (57 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (6 : Fin 13) (7 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (54 : Fin 78) (51 : Fin 78)
    (60 : Fin 78) (50 : Fin 78) (65 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6869` (kalmanson). -/
theorem middleSource_h6869 :
    ((!((allOneRankAtom (sourceRanks P) 51 == allOneRankAtom (sourceRanks P) 50)) || ((allOneRankAtom (sourceRanks P) 66).ult (allOneRankAtom (sourceRanks P) 61)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (61 : Fin 78) (51 : Fin 78)
    (66 : Fin 78) (50 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (6 : Fin 13) (7 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (55 : Fin 78) (51 : Fin 78)
    (61 : Fin 78) (50 : Fin 78) (66 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6870` (kalmanson). -/
theorem middleSource_h6870 :
    ((!((allOneRankAtom (sourceRanks P) 61 == allOneRankAtom (sourceRanks P) 50)) || ((allOneRankAtom (sourceRanks P) 66).ult (allOneRankAtom (sourceRanks P) 51)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (51 : Fin 78) (61 : Fin 78)
    (66 : Fin 78) (50 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (6 : Fin 13) (7 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (55 : Fin 78) (51 : Fin 78)
    (61 : Fin 78) (50 : Fin 78) (66 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6871` (kalmanson). -/
theorem middleSource_h6871 :
    ((!((allOneRankAtom (sourceRanks P) 61 == allOneRankAtom (sourceRanks P) 66)) || ((allOneRankAtom (sourceRanks P) 50).ult (allOneRankAtom (sourceRanks P) 51)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (51 : Fin 78) (61 : Fin 78)
    (50 : Fin 78) (66 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (6 : Fin 13) (7 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (55 : Fin 78) (51 : Fin 78)
    (61 : Fin 78) (50 : Fin 78) (66 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6872` (kalmanson). -/
theorem middleSource_h6872 :
    ((!((allOneRankAtom (sourceRanks P) 51 == allOneRankAtom (sourceRanks P) 55)) || ((allOneRankAtom (sourceRanks P) 57).ult (allOneRankAtom (sourceRanks P) 61)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (61 : Fin 78) (51 : Fin 78)
    (57 : Fin 78) (55 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (6 : Fin 13) (7 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (55 : Fin 78) (51 : Fin 78)
    (61 : Fin 78) (50 : Fin 78) (66 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6873` (kalmanson). -/
theorem middleSource_h6873 :
    ((!((allOneRankAtom (sourceRanks P) 61 == allOneRankAtom (sourceRanks P) 55)) || ((allOneRankAtom (sourceRanks P) 57).ult (allOneRankAtom (sourceRanks P) 51)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (51 : Fin 78) (61 : Fin 78)
    (57 : Fin 78) (55 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (6 : Fin 13) (7 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (55 : Fin 78) (51 : Fin 78)
    (61 : Fin 78) (50 : Fin 78) (66 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6874` (kalmanson). -/
theorem middleSource_h6874 :
    ((!((allOneRankAtom (sourceRanks P) 61 == allOneRankAtom (sourceRanks P) 57)) || ((allOneRankAtom (sourceRanks P) 55).ult (allOneRankAtom (sourceRanks P) 51)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (51 : Fin 78) (61 : Fin 78)
    (55 : Fin 78) (57 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (6 : Fin 13) (7 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (55 : Fin 78) (51 : Fin 78)
    (61 : Fin 78) (50 : Fin 78) (66 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6875` (kalmanson). -/
theorem middleSource_h6875 :
    ((!((allOneRankAtom (sourceRanks P) 51 == allOneRankAtom (sourceRanks P) 50)) || ((allOneRankAtom (sourceRanks P) 67).ult (allOneRankAtom (sourceRanks P) 62)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (62 : Fin 78) (51 : Fin 78)
    (67 : Fin 78) (50 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (6 : Fin 13) (7 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (56 : Fin 78) (51 : Fin 78)
    (62 : Fin 78) (50 : Fin 78) (67 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6876` (kalmanson). -/
theorem middleSource_h6876 :
    ((!((allOneRankAtom (sourceRanks P) 62 == allOneRankAtom (sourceRanks P) 50)) || ((allOneRankAtom (sourceRanks P) 67).ult (allOneRankAtom (sourceRanks P) 51)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (51 : Fin 78) (62 : Fin 78)
    (67 : Fin 78) (50 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (6 : Fin 13) (7 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (56 : Fin 78) (51 : Fin 78)
    (62 : Fin 78) (50 : Fin 78) (67 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6877` (kalmanson). -/
theorem middleSource_h6877 :
    ((!((allOneRankAtom (sourceRanks P) 51 == allOneRankAtom (sourceRanks P) 56)) || ((allOneRankAtom (sourceRanks P) 57).ult (allOneRankAtom (sourceRanks P) 62)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (62 : Fin 78) (51 : Fin 78)
    (57 : Fin 78) (56 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (6 : Fin 13) (7 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (56 : Fin 78) (51 : Fin 78)
    (62 : Fin 78) (50 : Fin 78) (67 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6878` (kalmanson). -/
theorem middleSource_h6878 :
    ((!((allOneRankAtom (sourceRanks P) 51 == allOneRankAtom (sourceRanks P) 57)) || ((allOneRankAtom (sourceRanks P) 56).ult (allOneRankAtom (sourceRanks P) 62)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (62 : Fin 78) (51 : Fin 78)
    (56 : Fin 78) (57 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (6 : Fin 13) (7 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (56 : Fin 78) (51 : Fin 78)
    (62 : Fin 78) (50 : Fin 78) (67 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6879` (kalmanson). -/
theorem middleSource_h6879 :
    ((!((allOneRankAtom (sourceRanks P) 62 == allOneRankAtom (sourceRanks P) 56)) || ((allOneRankAtom (sourceRanks P) 57).ult (allOneRankAtom (sourceRanks P) 51)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (51 : Fin 78) (62 : Fin 78)
    (57 : Fin 78) (56 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (6 : Fin 13) (7 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (56 : Fin 78) (51 : Fin 78)
    (62 : Fin 78) (50 : Fin 78) (67 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6880` (kalmanson). -/
theorem middleSource_h6880 :
    ((!((allOneRankAtom (sourceRanks P) 62 == allOneRankAtom (sourceRanks P) 57)) || ((allOneRankAtom (sourceRanks P) 56).ult (allOneRankAtom (sourceRanks P) 51)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (51 : Fin 78) (62 : Fin 78)
    (56 : Fin 78) (57 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (6 : Fin 13) (7 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (56 : Fin 78) (51 : Fin 78)
    (62 : Fin 78) (50 : Fin 78) (67 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6881` (kalmanson). -/
theorem middleSource_h6881 :
    ((!((allOneRankAtom (sourceRanks P) 52 == allOneRankAtom (sourceRanks P) 50)) || ((allOneRankAtom (sourceRanks P) 68).ult (allOneRankAtom (sourceRanks P) 59)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (59 : Fin 78) (52 : Fin 78)
    (68 : Fin 78) (50 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (6 : Fin 13) (8 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (58 : Fin 78) (53 : Fin 78) (52 : Fin 78)
    (59 : Fin 78) (50 : Fin 78) (68 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6882` (kalmanson). -/
theorem middleSource_h6882 :
    ((!((allOneRankAtom (sourceRanks P) 52 == allOneRankAtom (sourceRanks P) 68)) || ((allOneRankAtom (sourceRanks P) 50).ult (allOneRankAtom (sourceRanks P) 59)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (59 : Fin 78) (52 : Fin 78)
    (50 : Fin 78) (68 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (6 : Fin 13) (8 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (58 : Fin 78) (53 : Fin 78) (52 : Fin 78)
    (59 : Fin 78) (50 : Fin 78) (68 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6883` (kalmanson). -/
theorem middleSource_h6883 :
    ((!((allOneRankAtom (sourceRanks P) 59 == allOneRankAtom (sourceRanks P) 50)) || ((allOneRankAtom (sourceRanks P) 68).ult (allOneRankAtom (sourceRanks P) 52)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (52 : Fin 78) (59 : Fin 78)
    (68 : Fin 78) (50 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (6 : Fin 13) (8 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (58 : Fin 78) (53 : Fin 78) (52 : Fin 78)
    (59 : Fin 78) (50 : Fin 78) (68 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6884` (kalmanson). -/
theorem middleSource_h6884 :
    ((!((allOneRankAtom (sourceRanks P) 59 == allOneRankAtom (sourceRanks P) 68)) || ((allOneRankAtom (sourceRanks P) 50).ult (allOneRankAtom (sourceRanks P) 52)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (52 : Fin 78) (59 : Fin 78)
    (50 : Fin 78) (68 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (6 : Fin 13) (8 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (58 : Fin 78) (53 : Fin 78) (52 : Fin 78)
    (59 : Fin 78) (50 : Fin 78) (68 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6885` (kalmanson). -/
theorem middleSource_h6885 :
    ((!((allOneRankAtom (sourceRanks P) 52 == allOneRankAtom (sourceRanks P) 53)) || ((allOneRankAtom (sourceRanks P) 58).ult (allOneRankAtom (sourceRanks P) 59)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (59 : Fin 78) (52 : Fin 78)
    (58 : Fin 78) (53 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (6 : Fin 13) (8 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (58 : Fin 78) (53 : Fin 78) (52 : Fin 78)
    (59 : Fin 78) (50 : Fin 78) (68 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6886` (kalmanson). -/
theorem middleSource_h6886 :
    ((!((allOneRankAtom (sourceRanks P) 59 == allOneRankAtom (sourceRanks P) 53)) || ((allOneRankAtom (sourceRanks P) 58).ult (allOneRankAtom (sourceRanks P) 52)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (52 : Fin 78) (59 : Fin 78)
    (58 : Fin 78) (53 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (6 : Fin 13) (8 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (58 : Fin 78) (53 : Fin 78) (52 : Fin 78)
    (59 : Fin 78) (50 : Fin 78) (68 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6887` (kalmanson). -/
theorem middleSource_h6887 :
    ((!((allOneRankAtom (sourceRanks P) 59 == allOneRankAtom (sourceRanks P) 58)) || ((allOneRankAtom (sourceRanks P) 53).ult (allOneRankAtom (sourceRanks P) 52)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (52 : Fin 78) (59 : Fin 78)
    (53 : Fin 78) (58 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (6 : Fin 13) (8 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (58 : Fin 78) (53 : Fin 78) (52 : Fin 78)
    (59 : Fin 78) (50 : Fin 78) (68 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6888` (kalmanson). -/
theorem middleSource_h6888 :
    ((!((allOneRankAtom (sourceRanks P) 52 == allOneRankAtom (sourceRanks P) 50)) || ((allOneRankAtom (sourceRanks P) 69).ult (allOneRankAtom (sourceRanks P) 60)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (60 : Fin 78) (52 : Fin 78)
    (69 : Fin 78) (50 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (6 : Fin 13) (8 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (58 : Fin 78) (54 : Fin 78) (52 : Fin 78)
    (60 : Fin 78) (50 : Fin 78) (69 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6889` (kalmanson). -/
theorem middleSource_h6889 :
    ((!((allOneRankAtom (sourceRanks P) 52 == allOneRankAtom (sourceRanks P) 69)) || ((allOneRankAtom (sourceRanks P) 50).ult (allOneRankAtom (sourceRanks P) 60)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (60 : Fin 78) (52 : Fin 78)
    (50 : Fin 78) (69 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (6 : Fin 13) (8 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (58 : Fin 78) (54 : Fin 78) (52 : Fin 78)
    (60 : Fin 78) (50 : Fin 78) (69 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6890` (kalmanson). -/
theorem middleSource_h6890 :
    ((!((allOneRankAtom (sourceRanks P) 60 == allOneRankAtom (sourceRanks P) 50)) || ((allOneRankAtom (sourceRanks P) 69).ult (allOneRankAtom (sourceRanks P) 52)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (52 : Fin 78) (60 : Fin 78)
    (69 : Fin 78) (50 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (6 : Fin 13) (8 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (58 : Fin 78) (54 : Fin 78) (52 : Fin 78)
    (60 : Fin 78) (50 : Fin 78) (69 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6891` (kalmanson). -/
theorem middleSource_h6891 :
    ((!((allOneRankAtom (sourceRanks P) 60 == allOneRankAtom (sourceRanks P) 69)) || ((allOneRankAtom (sourceRanks P) 50).ult (allOneRankAtom (sourceRanks P) 52)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (52 : Fin 78) (60 : Fin 78)
    (50 : Fin 78) (69 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (6 : Fin 13) (8 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (58 : Fin 78) (54 : Fin 78) (52 : Fin 78)
    (60 : Fin 78) (50 : Fin 78) (69 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6892` (kalmanson). -/
theorem middleSource_h6892 :
    ((!((allOneRankAtom (sourceRanks P) 52 == allOneRankAtom (sourceRanks P) 54)) || ((allOneRankAtom (sourceRanks P) 58).ult (allOneRankAtom (sourceRanks P) 60)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (60 : Fin 78) (52 : Fin 78)
    (58 : Fin 78) (54 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (6 : Fin 13) (8 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (58 : Fin 78) (54 : Fin 78) (52 : Fin 78)
    (60 : Fin 78) (50 : Fin 78) (69 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6893` (kalmanson). -/
theorem middleSource_h6893 :
    ((!((allOneRankAtom (sourceRanks P) 60 == allOneRankAtom (sourceRanks P) 54)) || ((allOneRankAtom (sourceRanks P) 58).ult (allOneRankAtom (sourceRanks P) 52)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (52 : Fin 78) (60 : Fin 78)
    (58 : Fin 78) (54 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (6 : Fin 13) (8 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (58 : Fin 78) (54 : Fin 78) (52 : Fin 78)
    (60 : Fin 78) (50 : Fin 78) (69 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6894` (kalmanson). -/
theorem middleSource_h6894 :
    ((!((allOneRankAtom (sourceRanks P) 60 == allOneRankAtom (sourceRanks P) 58)) || ((allOneRankAtom (sourceRanks P) 54).ult (allOneRankAtom (sourceRanks P) 52)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (52 : Fin 78) (60 : Fin 78)
    (54 : Fin 78) (58 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (6 : Fin 13) (8 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (58 : Fin 78) (54 : Fin 78) (52 : Fin 78)
    (60 : Fin 78) (50 : Fin 78) (69 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6895` (kalmanson). -/
theorem middleSource_h6895 :
    ((!((allOneRankAtom (sourceRanks P) 52 == allOneRankAtom (sourceRanks P) 50)) || ((allOneRankAtom (sourceRanks P) 70).ult (allOneRankAtom (sourceRanks P) 61)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (61 : Fin 78) (52 : Fin 78)
    (70 : Fin 78) (50 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (6 : Fin 13) (8 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (58 : Fin 78) (55 : Fin 78) (52 : Fin 78)
    (61 : Fin 78) (50 : Fin 78) (70 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6896` (kalmanson). -/
theorem middleSource_h6896 :
    ((!((allOneRankAtom (sourceRanks P) 52 == allOneRankAtom (sourceRanks P) 70)) || ((allOneRankAtom (sourceRanks P) 50).ult (allOneRankAtom (sourceRanks P) 61)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (61 : Fin 78) (52 : Fin 78)
    (50 : Fin 78) (70 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (6 : Fin 13) (8 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (58 : Fin 78) (55 : Fin 78) (52 : Fin 78)
    (61 : Fin 78) (50 : Fin 78) (70 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6897` (kalmanson). -/
theorem middleSource_h6897 :
    ((!((allOneRankAtom (sourceRanks P) 61 == allOneRankAtom (sourceRanks P) 50)) || ((allOneRankAtom (sourceRanks P) 70).ult (allOneRankAtom (sourceRanks P) 52)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (52 : Fin 78) (61 : Fin 78)
    (70 : Fin 78) (50 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (6 : Fin 13) (8 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (58 : Fin 78) (55 : Fin 78) (52 : Fin 78)
    (61 : Fin 78) (50 : Fin 78) (70 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6898` (kalmanson). -/
theorem middleSource_h6898 :
    ((!((allOneRankAtom (sourceRanks P) 61 == allOneRankAtom (sourceRanks P) 70)) || ((allOneRankAtom (sourceRanks P) 50).ult (allOneRankAtom (sourceRanks P) 52)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (52 : Fin 78) (61 : Fin 78)
    (50 : Fin 78) (70 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (6 : Fin 13) (8 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (58 : Fin 78) (55 : Fin 78) (52 : Fin 78)
    (61 : Fin 78) (50 : Fin 78) (70 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6899` (kalmanson). -/
theorem middleSource_h6899 :
    ((!((allOneRankAtom (sourceRanks P) 52 == allOneRankAtom (sourceRanks P) 55)) || ((allOneRankAtom (sourceRanks P) 58).ult (allOneRankAtom (sourceRanks P) 61)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (61 : Fin 78) (52 : Fin 78)
    (58 : Fin 78) (55 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (6 : Fin 13) (8 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (58 : Fin 78) (55 : Fin 78) (52 : Fin 78)
    (61 : Fin 78) (50 : Fin 78) (70 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6900` (kalmanson). -/
theorem middleSource_h6900 :
    ((!((allOneRankAtom (sourceRanks P) 61 == allOneRankAtom (sourceRanks P) 55)) || ((allOneRankAtom (sourceRanks P) 58).ult (allOneRankAtom (sourceRanks P) 52)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (52 : Fin 78) (61 : Fin 78)
    (58 : Fin 78) (55 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (6 : Fin 13) (8 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (58 : Fin 78) (55 : Fin 78) (52 : Fin 78)
    (61 : Fin 78) (50 : Fin 78) (70 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6901` (kalmanson). -/
theorem middleSource_h6901 :
    ((!((allOneRankAtom (sourceRanks P) 61 == allOneRankAtom (sourceRanks P) 58)) || ((allOneRankAtom (sourceRanks P) 55).ult (allOneRankAtom (sourceRanks P) 52)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (52 : Fin 78) (61 : Fin 78)
    (55 : Fin 78) (58 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (6 : Fin 13) (8 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (58 : Fin 78) (55 : Fin 78) (52 : Fin 78)
    (61 : Fin 78) (50 : Fin 78) (70 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6902` (kalmanson). -/
theorem middleSource_h6902 :
    ((!((allOneRankAtom (sourceRanks P) 52 == allOneRankAtom (sourceRanks P) 50)) || ((allOneRankAtom (sourceRanks P) 71).ult (allOneRankAtom (sourceRanks P) 62)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (62 : Fin 78) (52 : Fin 78)
    (71 : Fin 78) (50 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (6 : Fin 13) (8 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (58 : Fin 78) (56 : Fin 78) (52 : Fin 78)
    (62 : Fin 78) (50 : Fin 78) (71 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6903` (kalmanson). -/
theorem middleSource_h6903 :
    ((!((allOneRankAtom (sourceRanks P) 52 == allOneRankAtom (sourceRanks P) 71)) || ((allOneRankAtom (sourceRanks P) 50).ult (allOneRankAtom (sourceRanks P) 62)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (62 : Fin 78) (52 : Fin 78)
    (50 : Fin 78) (71 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (6 : Fin 13) (8 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (58 : Fin 78) (56 : Fin 78) (52 : Fin 78)
    (62 : Fin 78) (50 : Fin 78) (71 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6904` (kalmanson). -/
theorem middleSource_h6904 :
    ((!((allOneRankAtom (sourceRanks P) 62 == allOneRankAtom (sourceRanks P) 50)) || ((allOneRankAtom (sourceRanks P) 71).ult (allOneRankAtom (sourceRanks P) 52)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (52 : Fin 78) (62 : Fin 78)
    (71 : Fin 78) (50 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (6 : Fin 13) (8 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (58 : Fin 78) (56 : Fin 78) (52 : Fin 78)
    (62 : Fin 78) (50 : Fin 78) (71 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6905` (kalmanson). -/
theorem middleSource_h6905 :
    ((!((allOneRankAtom (sourceRanks P) 52 == allOneRankAtom (sourceRanks P) 56)) || ((allOneRankAtom (sourceRanks P) 58).ult (allOneRankAtom (sourceRanks P) 62)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (62 : Fin 78) (52 : Fin 78)
    (58 : Fin 78) (56 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (6 : Fin 13) (8 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (58 : Fin 78) (56 : Fin 78) (52 : Fin 78)
    (62 : Fin 78) (50 : Fin 78) (71 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6906` (kalmanson). -/
theorem middleSource_h6906 :
    ((!((allOneRankAtom (sourceRanks P) 62 == allOneRankAtom (sourceRanks P) 56)) || ((allOneRankAtom (sourceRanks P) 58).ult (allOneRankAtom (sourceRanks P) 52)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (52 : Fin 78) (62 : Fin 78)
    (58 : Fin 78) (56 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (6 : Fin 13) (8 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (58 : Fin 78) (56 : Fin 78) (52 : Fin 78)
    (62 : Fin 78) (50 : Fin 78) (71 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6907` (kalmanson). -/
theorem middleSource_h6907 :
    ((!((allOneRankAtom (sourceRanks P) 62 == allOneRankAtom (sourceRanks P) 58)) || ((allOneRankAtom (sourceRanks P) 56).ult (allOneRankAtom (sourceRanks P) 52)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (52 : Fin 78) (62 : Fin 78)
    (56 : Fin 78) (58 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (6 : Fin 13) (8 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (58 : Fin 78) (56 : Fin 78) (52 : Fin 78)
    (62 : Fin 78) (50 : Fin 78) (71 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6908` (kalmanson). -/
theorem middleSource_h6908 :
    ((!((allOneRankAtom (sourceRanks P) 53 == allOneRankAtom (sourceRanks P) 50)) || ((allOneRankAtom (sourceRanks P) 72).ult (allOneRankAtom (sourceRanks P) 60)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (60 : Fin 78) (53 : Fin 78)
    (72 : Fin 78) (50 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (6 : Fin 13) (9 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (59 : Fin 78) (54 : Fin 78) (53 : Fin 78)
    (60 : Fin 78) (50 : Fin 78) (72 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6909` (kalmanson). -/
theorem middleSource_h6909 :
    ((!((allOneRankAtom (sourceRanks P) 53 == allOneRankAtom (sourceRanks P) 72)) || ((allOneRankAtom (sourceRanks P) 50).ult (allOneRankAtom (sourceRanks P) 60)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (60 : Fin 78) (53 : Fin 78)
    (50 : Fin 78) (72 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (6 : Fin 13) (9 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (59 : Fin 78) (54 : Fin 78) (53 : Fin 78)
    (60 : Fin 78) (50 : Fin 78) (72 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6910` (kalmanson). -/
theorem middleSource_h6910 :
    ((!((allOneRankAtom (sourceRanks P) 60 == allOneRankAtom (sourceRanks P) 50)) || ((allOneRankAtom (sourceRanks P) 72).ult (allOneRankAtom (sourceRanks P) 53)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (53 : Fin 78) (60 : Fin 78)
    (72 : Fin 78) (50 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (6 : Fin 13) (9 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (59 : Fin 78) (54 : Fin 78) (53 : Fin 78)
    (60 : Fin 78) (50 : Fin 78) (72 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6911` (kalmanson). -/
theorem middleSource_h6911 :
    ((!((allOneRankAtom (sourceRanks P) 60 == allOneRankAtom (sourceRanks P) 72)) || ((allOneRankAtom (sourceRanks P) 50).ult (allOneRankAtom (sourceRanks P) 53)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (53 : Fin 78) (60 : Fin 78)
    (50 : Fin 78) (72 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (6 : Fin 13) (9 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (59 : Fin 78) (54 : Fin 78) (53 : Fin 78)
    (60 : Fin 78) (50 : Fin 78) (72 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

end

end ATailExactFiveCard13AllOneSourceIngressScratch
end Problem97
