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

/-- Candidate middle source assertion `h4800` (kalmanson). -/
theorem middleSource_h4800 :
    ((!((allOneRankAtom (sourceRanks P) 18 == allOneRankAtom (sourceRanks P) 19)) || ((allOneRankAtom (sourceRanks P) 45).ult (allOneRankAtom (sourceRanks P) 46)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (46 : Fin 78) (18 : Fin 78)
    (45 : Fin 78) (19 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (8 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (45 : Fin 78) (19 : Fin 78) (18 : Fin 78)
    (46 : Fin 78) (14 : Fin 78) (68 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4801` (kalmanson). -/
theorem middleSource_h4801 :
    ((!((allOneRankAtom (sourceRanks P) 18 == allOneRankAtom (sourceRanks P) 45)) || ((allOneRankAtom (sourceRanks P) 19).ult (allOneRankAtom (sourceRanks P) 46)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (46 : Fin 78) (18 : Fin 78)
    (19 : Fin 78) (45 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (8 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (45 : Fin 78) (19 : Fin 78) (18 : Fin 78)
    (46 : Fin 78) (14 : Fin 78) (68 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4802` (kalmanson). -/
theorem middleSource_h4802 :
    ((!((allOneRankAtom (sourceRanks P) 46 == allOneRankAtom (sourceRanks P) 19)) || ((allOneRankAtom (sourceRanks P) 45).ult (allOneRankAtom (sourceRanks P) 18)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (18 : Fin 78) (46 : Fin 78)
    (45 : Fin 78) (19 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (8 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (45 : Fin 78) (19 : Fin 78) (18 : Fin 78)
    (46 : Fin 78) (14 : Fin 78) (68 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4803` (kalmanson). -/
theorem middleSource_h4803 :
    ((!((allOneRankAtom (sourceRanks P) 46 == allOneRankAtom (sourceRanks P) 45)) || ((allOneRankAtom (sourceRanks P) 19).ult (allOneRankAtom (sourceRanks P) 18)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (18 : Fin 78) (46 : Fin 78)
    (19 : Fin 78) (45 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (8 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (45 : Fin 78) (19 : Fin 78) (18 : Fin 78)
    (46 : Fin 78) (14 : Fin 78) (68 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4804` (kalmanson). -/
theorem middleSource_h4804 :
    ((!((allOneRankAtom (sourceRanks P) 18 == allOneRankAtom (sourceRanks P) 14)) || ((allOneRankAtom (sourceRanks P) 69).ult (allOneRankAtom (sourceRanks P) 47)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (47 : Fin 78) (18 : Fin 78)
    (69 : Fin 78) (14 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (8 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (45 : Fin 78) (20 : Fin 78) (18 : Fin 78)
    (47 : Fin 78) (14 : Fin 78) (69 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4805` (kalmanson). -/
theorem middleSource_h4805 :
    ((!((allOneRankAtom (sourceRanks P) 18 == allOneRankAtom (sourceRanks P) 69)) || ((allOneRankAtom (sourceRanks P) 14).ult (allOneRankAtom (sourceRanks P) 47)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (47 : Fin 78) (18 : Fin 78)
    (14 : Fin 78) (69 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (8 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (45 : Fin 78) (20 : Fin 78) (18 : Fin 78)
    (47 : Fin 78) (14 : Fin 78) (69 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4806` (kalmanson). -/
theorem middleSource_h4806 :
    ((!((allOneRankAtom (sourceRanks P) 47 == allOneRankAtom (sourceRanks P) 14)) || ((allOneRankAtom (sourceRanks P) 69).ult (allOneRankAtom (sourceRanks P) 18)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (18 : Fin 78) (47 : Fin 78)
    (69 : Fin 78) (14 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (8 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (45 : Fin 78) (20 : Fin 78) (18 : Fin 78)
    (47 : Fin 78) (14 : Fin 78) (69 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4807` (kalmanson). -/
theorem middleSource_h4807 :
    ((!((allOneRankAtom (sourceRanks P) 47 == allOneRankAtom (sourceRanks P) 69)) || ((allOneRankAtom (sourceRanks P) 14).ult (allOneRankAtom (sourceRanks P) 18)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (18 : Fin 78) (47 : Fin 78)
    (14 : Fin 78) (69 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (8 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (45 : Fin 78) (20 : Fin 78) (18 : Fin 78)
    (47 : Fin 78) (14 : Fin 78) (69 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4808` (kalmanson). -/
theorem middleSource_h4808 :
    ((!((allOneRankAtom (sourceRanks P) 18 == allOneRankAtom (sourceRanks P) 20)) || ((allOneRankAtom (sourceRanks P) 45).ult (allOneRankAtom (sourceRanks P) 47)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (47 : Fin 78) (18 : Fin 78)
    (45 : Fin 78) (20 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (8 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (45 : Fin 78) (20 : Fin 78) (18 : Fin 78)
    (47 : Fin 78) (14 : Fin 78) (69 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4809` (kalmanson). -/
theorem middleSource_h4809 :
    ((!((allOneRankAtom (sourceRanks P) 18 == allOneRankAtom (sourceRanks P) 45)) || ((allOneRankAtom (sourceRanks P) 20).ult (allOneRankAtom (sourceRanks P) 47)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (47 : Fin 78) (18 : Fin 78)
    (20 : Fin 78) (45 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (8 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (45 : Fin 78) (20 : Fin 78) (18 : Fin 78)
    (47 : Fin 78) (14 : Fin 78) (69 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4810` (kalmanson). -/
theorem middleSource_h4810 :
    ((!((allOneRankAtom (sourceRanks P) 47 == allOneRankAtom (sourceRanks P) 20)) || ((allOneRankAtom (sourceRanks P) 45).ult (allOneRankAtom (sourceRanks P) 18)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (18 : Fin 78) (47 : Fin 78)
    (45 : Fin 78) (20 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (8 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (45 : Fin 78) (20 : Fin 78) (18 : Fin 78)
    (47 : Fin 78) (14 : Fin 78) (69 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4811` (kalmanson). -/
theorem middleSource_h4811 :
    ((!((allOneRankAtom (sourceRanks P) 47 == allOneRankAtom (sourceRanks P) 45)) || ((allOneRankAtom (sourceRanks P) 20).ult (allOneRankAtom (sourceRanks P) 18)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (18 : Fin 78) (47 : Fin 78)
    (20 : Fin 78) (45 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (8 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (45 : Fin 78) (20 : Fin 78) (18 : Fin 78)
    (47 : Fin 78) (14 : Fin 78) (69 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4812` (kalmanson). -/
theorem middleSource_h4812 :
    ((!((allOneRankAtom (sourceRanks P) 18 == allOneRankAtom (sourceRanks P) 14)) || ((allOneRankAtom (sourceRanks P) 70).ult (allOneRankAtom (sourceRanks P) 48)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (48 : Fin 78) (18 : Fin 78)
    (70 : Fin 78) (14 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (8 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (45 : Fin 78) (21 : Fin 78) (18 : Fin 78)
    (48 : Fin 78) (14 : Fin 78) (70 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4813` (kalmanson). -/
theorem middleSource_h4813 :
    ((!((allOneRankAtom (sourceRanks P) 18 == allOneRankAtom (sourceRanks P) 70)) || ((allOneRankAtom (sourceRanks P) 14).ult (allOneRankAtom (sourceRanks P) 48)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (48 : Fin 78) (18 : Fin 78)
    (14 : Fin 78) (70 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (8 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (45 : Fin 78) (21 : Fin 78) (18 : Fin 78)
    (48 : Fin 78) (14 : Fin 78) (70 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4814` (kalmanson). -/
theorem middleSource_h4814 :
    ((!((allOneRankAtom (sourceRanks P) 48 == allOneRankAtom (sourceRanks P) 14)) || ((allOneRankAtom (sourceRanks P) 70).ult (allOneRankAtom (sourceRanks P) 18)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (18 : Fin 78) (48 : Fin 78)
    (70 : Fin 78) (14 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (8 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (45 : Fin 78) (21 : Fin 78) (18 : Fin 78)
    (48 : Fin 78) (14 : Fin 78) (70 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4815` (kalmanson). -/
theorem middleSource_h4815 :
    ((!((allOneRankAtom (sourceRanks P) 48 == allOneRankAtom (sourceRanks P) 70)) || ((allOneRankAtom (sourceRanks P) 14).ult (allOneRankAtom (sourceRanks P) 18)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (18 : Fin 78) (48 : Fin 78)
    (14 : Fin 78) (70 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (8 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (45 : Fin 78) (21 : Fin 78) (18 : Fin 78)
    (48 : Fin 78) (14 : Fin 78) (70 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4816` (kalmanson). -/
theorem middleSource_h4816 :
    ((!((allOneRankAtom (sourceRanks P) 18 == allOneRankAtom (sourceRanks P) 21)) || ((allOneRankAtom (sourceRanks P) 45).ult (allOneRankAtom (sourceRanks P) 48)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (48 : Fin 78) (18 : Fin 78)
    (45 : Fin 78) (21 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (8 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (45 : Fin 78) (21 : Fin 78) (18 : Fin 78)
    (48 : Fin 78) (14 : Fin 78) (70 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4817` (kalmanson). -/
theorem middleSource_h4817 :
    ((!((allOneRankAtom (sourceRanks P) 18 == allOneRankAtom (sourceRanks P) 45)) || ((allOneRankAtom (sourceRanks P) 21).ult (allOneRankAtom (sourceRanks P) 48)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (48 : Fin 78) (18 : Fin 78)
    (21 : Fin 78) (45 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (8 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (45 : Fin 78) (21 : Fin 78) (18 : Fin 78)
    (48 : Fin 78) (14 : Fin 78) (70 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4818` (kalmanson). -/
theorem middleSource_h4818 :
    ((!((allOneRankAtom (sourceRanks P) 48 == allOneRankAtom (sourceRanks P) 21)) || ((allOneRankAtom (sourceRanks P) 45).ult (allOneRankAtom (sourceRanks P) 18)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (18 : Fin 78) (48 : Fin 78)
    (45 : Fin 78) (21 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (8 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (45 : Fin 78) (21 : Fin 78) (18 : Fin 78)
    (48 : Fin 78) (14 : Fin 78) (70 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4819` (kalmanson). -/
theorem middleSource_h4819 :
    ((!((allOneRankAtom (sourceRanks P) 48 == allOneRankAtom (sourceRanks P) 45)) || ((allOneRankAtom (sourceRanks P) 21).ult (allOneRankAtom (sourceRanks P) 18)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (18 : Fin 78) (48 : Fin 78)
    (21 : Fin 78) (45 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (8 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (45 : Fin 78) (21 : Fin 78) (18 : Fin 78)
    (48 : Fin 78) (14 : Fin 78) (70 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4820` (kalmanson). -/
theorem middleSource_h4820 :
    ((!((allOneRankAtom (sourceRanks P) 18 == allOneRankAtom (sourceRanks P) 14)) || ((allOneRankAtom (sourceRanks P) 71).ult (allOneRankAtom (sourceRanks P) 49)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (49 : Fin 78) (18 : Fin 78)
    (71 : Fin 78) (14 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (8 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (45 : Fin 78) (22 : Fin 78) (18 : Fin 78)
    (49 : Fin 78) (14 : Fin 78) (71 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4821` (kalmanson). -/
theorem middleSource_h4821 :
    ((!((allOneRankAtom (sourceRanks P) 18 == allOneRankAtom (sourceRanks P) 71)) || ((allOneRankAtom (sourceRanks P) 14).ult (allOneRankAtom (sourceRanks P) 49)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (49 : Fin 78) (18 : Fin 78)
    (14 : Fin 78) (71 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (8 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (45 : Fin 78) (22 : Fin 78) (18 : Fin 78)
    (49 : Fin 78) (14 : Fin 78) (71 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4822` (kalmanson). -/
theorem middleSource_h4822 :
    ((!((allOneRankAtom (sourceRanks P) 49 == allOneRankAtom (sourceRanks P) 14)) || ((allOneRankAtom (sourceRanks P) 71).ult (allOneRankAtom (sourceRanks P) 18)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (18 : Fin 78) (49 : Fin 78)
    (71 : Fin 78) (14 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (8 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (45 : Fin 78) (22 : Fin 78) (18 : Fin 78)
    (49 : Fin 78) (14 : Fin 78) (71 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4823` (kalmanson). -/
theorem middleSource_h4823 :
    ((!((allOneRankAtom (sourceRanks P) 18 == allOneRankAtom (sourceRanks P) 22)) || ((allOneRankAtom (sourceRanks P) 45).ult (allOneRankAtom (sourceRanks P) 49)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (49 : Fin 78) (18 : Fin 78)
    (45 : Fin 78) (22 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (8 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (45 : Fin 78) (22 : Fin 78) (18 : Fin 78)
    (49 : Fin 78) (14 : Fin 78) (71 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4824` (kalmanson). -/
theorem middleSource_h4824 :
    ((!((allOneRankAtom (sourceRanks P) 18 == allOneRankAtom (sourceRanks P) 45)) || ((allOneRankAtom (sourceRanks P) 22).ult (allOneRankAtom (sourceRanks P) 49)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (49 : Fin 78) (18 : Fin 78)
    (22 : Fin 78) (45 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (8 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (45 : Fin 78) (22 : Fin 78) (18 : Fin 78)
    (49 : Fin 78) (14 : Fin 78) (71 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4825` (kalmanson). -/
theorem middleSource_h4825 :
    ((!((allOneRankAtom (sourceRanks P) 49 == allOneRankAtom (sourceRanks P) 45)) || ((allOneRankAtom (sourceRanks P) 22).ult (allOneRankAtom (sourceRanks P) 18)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (18 : Fin 78) (49 : Fin 78)
    (22 : Fin 78) (45 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (8 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (45 : Fin 78) (22 : Fin 78) (18 : Fin 78)
    (49 : Fin 78) (14 : Fin 78) (71 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4826` (kalmanson). -/
theorem middleSource_h4826 :
    ((!((allOneRankAtom (sourceRanks P) 19 == allOneRankAtom (sourceRanks P) 14)) || ((allOneRankAtom (sourceRanks P) 72).ult (allOneRankAtom (sourceRanks P) 47)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (47 : Fin 78) (19 : Fin 78)
    (72 : Fin 78) (14 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (9 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (46 : Fin 78) (20 : Fin 78) (19 : Fin 78)
    (47 : Fin 78) (14 : Fin 78) (72 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4827` (kalmanson). -/
theorem middleSource_h4827 :
    ((!((allOneRankAtom (sourceRanks P) 19 == allOneRankAtom (sourceRanks P) 72)) || ((allOneRankAtom (sourceRanks P) 14).ult (allOneRankAtom (sourceRanks P) 47)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (47 : Fin 78) (19 : Fin 78)
    (14 : Fin 78) (72 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (9 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (46 : Fin 78) (20 : Fin 78) (19 : Fin 78)
    (47 : Fin 78) (14 : Fin 78) (72 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4828` (kalmanson). -/
theorem middleSource_h4828 :
    ((!((allOneRankAtom (sourceRanks P) 47 == allOneRankAtom (sourceRanks P) 14)) || ((allOneRankAtom (sourceRanks P) 72).ult (allOneRankAtom (sourceRanks P) 19)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (19 : Fin 78) (47 : Fin 78)
    (72 : Fin 78) (14 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (9 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (46 : Fin 78) (20 : Fin 78) (19 : Fin 78)
    (47 : Fin 78) (14 : Fin 78) (72 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4829` (kalmanson). -/
theorem middleSource_h4829 :
    ((!((allOneRankAtom (sourceRanks P) 47 == allOneRankAtom (sourceRanks P) 72)) || ((allOneRankAtom (sourceRanks P) 14).ult (allOneRankAtom (sourceRanks P) 19)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (19 : Fin 78) (47 : Fin 78)
    (14 : Fin 78) (72 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (9 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (46 : Fin 78) (20 : Fin 78) (19 : Fin 78)
    (47 : Fin 78) (14 : Fin 78) (72 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4830` (kalmanson). -/
theorem middleSource_h4830 :
    ((!((allOneRankAtom (sourceRanks P) 19 == allOneRankAtom (sourceRanks P) 20)) || ((allOneRankAtom (sourceRanks P) 46).ult (allOneRankAtom (sourceRanks P) 47)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (47 : Fin 78) (19 : Fin 78)
    (46 : Fin 78) (20 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (9 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (46 : Fin 78) (20 : Fin 78) (19 : Fin 78)
    (47 : Fin 78) (14 : Fin 78) (72 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4831` (kalmanson). -/
theorem middleSource_h4831 :
    ((!((allOneRankAtom (sourceRanks P) 19 == allOneRankAtom (sourceRanks P) 46)) || ((allOneRankAtom (sourceRanks P) 20).ult (allOneRankAtom (sourceRanks P) 47)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (47 : Fin 78) (19 : Fin 78)
    (20 : Fin 78) (46 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (9 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (46 : Fin 78) (20 : Fin 78) (19 : Fin 78)
    (47 : Fin 78) (14 : Fin 78) (72 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4832` (kalmanson). -/
theorem middleSource_h4832 :
    ((!((allOneRankAtom (sourceRanks P) 47 == allOneRankAtom (sourceRanks P) 20)) || ((allOneRankAtom (sourceRanks P) 46).ult (allOneRankAtom (sourceRanks P) 19)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (19 : Fin 78) (47 : Fin 78)
    (46 : Fin 78) (20 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (9 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (46 : Fin 78) (20 : Fin 78) (19 : Fin 78)
    (47 : Fin 78) (14 : Fin 78) (72 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4833` (kalmanson). -/
theorem middleSource_h4833 :
    ((!((allOneRankAtom (sourceRanks P) 47 == allOneRankAtom (sourceRanks P) 46)) || ((allOneRankAtom (sourceRanks P) 20).ult (allOneRankAtom (sourceRanks P) 19)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (19 : Fin 78) (47 : Fin 78)
    (20 : Fin 78) (46 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (9 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (46 : Fin 78) (20 : Fin 78) (19 : Fin 78)
    (47 : Fin 78) (14 : Fin 78) (72 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4834` (kalmanson). -/
theorem middleSource_h4834 :
    ((!((allOneRankAtom (sourceRanks P) 19 == allOneRankAtom (sourceRanks P) 14)) || ((allOneRankAtom (sourceRanks P) 73).ult (allOneRankAtom (sourceRanks P) 48)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (48 : Fin 78) (19 : Fin 78)
    (73 : Fin 78) (14 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (9 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (46 : Fin 78) (21 : Fin 78) (19 : Fin 78)
    (48 : Fin 78) (14 : Fin 78) (73 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4835` (kalmanson). -/
theorem middleSource_h4835 :
    ((!((allOneRankAtom (sourceRanks P) 19 == allOneRankAtom (sourceRanks P) 73)) || ((allOneRankAtom (sourceRanks P) 14).ult (allOneRankAtom (sourceRanks P) 48)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (48 : Fin 78) (19 : Fin 78)
    (14 : Fin 78) (73 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (9 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (46 : Fin 78) (21 : Fin 78) (19 : Fin 78)
    (48 : Fin 78) (14 : Fin 78) (73 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4836` (kalmanson). -/
theorem middleSource_h4836 :
    ((!((allOneRankAtom (sourceRanks P) 48 == allOneRankAtom (sourceRanks P) 14)) || ((allOneRankAtom (sourceRanks P) 73).ult (allOneRankAtom (sourceRanks P) 19)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (19 : Fin 78) (48 : Fin 78)
    (73 : Fin 78) (14 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (9 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (46 : Fin 78) (21 : Fin 78) (19 : Fin 78)
    (48 : Fin 78) (14 : Fin 78) (73 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4837` (kalmanson). -/
theorem middleSource_h4837 :
    ((!((allOneRankAtom (sourceRanks P) 48 == allOneRankAtom (sourceRanks P) 73)) || ((allOneRankAtom (sourceRanks P) 14).ult (allOneRankAtom (sourceRanks P) 19)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (19 : Fin 78) (48 : Fin 78)
    (14 : Fin 78) (73 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (9 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (46 : Fin 78) (21 : Fin 78) (19 : Fin 78)
    (48 : Fin 78) (14 : Fin 78) (73 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4838` (kalmanson). -/
theorem middleSource_h4838 :
    ((!((allOneRankAtom (sourceRanks P) 19 == allOneRankAtom (sourceRanks P) 21)) || ((allOneRankAtom (sourceRanks P) 46).ult (allOneRankAtom (sourceRanks P) 48)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (48 : Fin 78) (19 : Fin 78)
    (46 : Fin 78) (21 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (9 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (46 : Fin 78) (21 : Fin 78) (19 : Fin 78)
    (48 : Fin 78) (14 : Fin 78) (73 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4839` (kalmanson). -/
theorem middleSource_h4839 :
    ((!((allOneRankAtom (sourceRanks P) 19 == allOneRankAtom (sourceRanks P) 46)) || ((allOneRankAtom (sourceRanks P) 21).ult (allOneRankAtom (sourceRanks P) 48)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (48 : Fin 78) (19 : Fin 78)
    (21 : Fin 78) (46 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (9 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (46 : Fin 78) (21 : Fin 78) (19 : Fin 78)
    (48 : Fin 78) (14 : Fin 78) (73 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4840` (kalmanson). -/
theorem middleSource_h4840 :
    ((!((allOneRankAtom (sourceRanks P) 48 == allOneRankAtom (sourceRanks P) 21)) || ((allOneRankAtom (sourceRanks P) 46).ult (allOneRankAtom (sourceRanks P) 19)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (19 : Fin 78) (48 : Fin 78)
    (46 : Fin 78) (21 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (9 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (46 : Fin 78) (21 : Fin 78) (19 : Fin 78)
    (48 : Fin 78) (14 : Fin 78) (73 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4841` (kalmanson). -/
theorem middleSource_h4841 :
    ((!((allOneRankAtom (sourceRanks P) 48 == allOneRankAtom (sourceRanks P) 46)) || ((allOneRankAtom (sourceRanks P) 21).ult (allOneRankAtom (sourceRanks P) 19)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (19 : Fin 78) (48 : Fin 78)
    (21 : Fin 78) (46 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (9 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (46 : Fin 78) (21 : Fin 78) (19 : Fin 78)
    (48 : Fin 78) (14 : Fin 78) (73 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4842` (kalmanson). -/
theorem middleSource_h4842 :
    ((!((allOneRankAtom (sourceRanks P) 19 == allOneRankAtom (sourceRanks P) 14)) || ((allOneRankAtom (sourceRanks P) 74).ult (allOneRankAtom (sourceRanks P) 49)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (49 : Fin 78) (19 : Fin 78)
    (74 : Fin 78) (14 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (9 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (46 : Fin 78) (22 : Fin 78) (19 : Fin 78)
    (49 : Fin 78) (14 : Fin 78) (74 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4843` (kalmanson). -/
theorem middleSource_h4843 :
    ((!((allOneRankAtom (sourceRanks P) 19 == allOneRankAtom (sourceRanks P) 74)) || ((allOneRankAtom (sourceRanks P) 14).ult (allOneRankAtom (sourceRanks P) 49)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (49 : Fin 78) (19 : Fin 78)
    (14 : Fin 78) (74 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (9 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (46 : Fin 78) (22 : Fin 78) (19 : Fin 78)
    (49 : Fin 78) (14 : Fin 78) (74 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4844` (kalmanson). -/
theorem middleSource_h4844 :
    ((!((allOneRankAtom (sourceRanks P) 49 == allOneRankAtom (sourceRanks P) 14)) || ((allOneRankAtom (sourceRanks P) 74).ult (allOneRankAtom (sourceRanks P) 19)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (19 : Fin 78) (49 : Fin 78)
    (74 : Fin 78) (14 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (9 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (46 : Fin 78) (22 : Fin 78) (19 : Fin 78)
    (49 : Fin 78) (14 : Fin 78) (74 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4845` (kalmanson). -/
theorem middleSource_h4845 :
    ((!((allOneRankAtom (sourceRanks P) 49 == allOneRankAtom (sourceRanks P) 74)) || ((allOneRankAtom (sourceRanks P) 14).ult (allOneRankAtom (sourceRanks P) 19)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (19 : Fin 78) (49 : Fin 78)
    (14 : Fin 78) (74 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (9 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (46 : Fin 78) (22 : Fin 78) (19 : Fin 78)
    (49 : Fin 78) (14 : Fin 78) (74 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4846` (kalmanson). -/
theorem middleSource_h4846 :
    ((!((allOneRankAtom (sourceRanks P) 19 == allOneRankAtom (sourceRanks P) 22)) || ((allOneRankAtom (sourceRanks P) 46).ult (allOneRankAtom (sourceRanks P) 49)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (49 : Fin 78) (19 : Fin 78)
    (46 : Fin 78) (22 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (9 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (46 : Fin 78) (22 : Fin 78) (19 : Fin 78)
    (49 : Fin 78) (14 : Fin 78) (74 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4847` (kalmanson). -/
theorem middleSource_h4847 :
    ((!((allOneRankAtom (sourceRanks P) 19 == allOneRankAtom (sourceRanks P) 46)) || ((allOneRankAtom (sourceRanks P) 22).ult (allOneRankAtom (sourceRanks P) 49)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (49 : Fin 78) (19 : Fin 78)
    (22 : Fin 78) (46 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (9 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (46 : Fin 78) (22 : Fin 78) (19 : Fin 78)
    (49 : Fin 78) (14 : Fin 78) (74 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4848` (kalmanson). -/
theorem middleSource_h4848 :
    ((!((allOneRankAtom (sourceRanks P) 49 == allOneRankAtom (sourceRanks P) 46)) || ((allOneRankAtom (sourceRanks P) 22).ult (allOneRankAtom (sourceRanks P) 19)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (19 : Fin 78) (49 : Fin 78)
    (22 : Fin 78) (46 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (9 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (46 : Fin 78) (22 : Fin 78) (19 : Fin 78)
    (49 : Fin 78) (14 : Fin 78) (74 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4849` (kalmanson). -/
theorem middleSource_h4849 :
    ((!((allOneRankAtom (sourceRanks P) 20 == allOneRankAtom (sourceRanks P) 14)) || ((allOneRankAtom (sourceRanks P) 75).ult (allOneRankAtom (sourceRanks P) 48)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (48 : Fin 78) (20 : Fin 78)
    (75 : Fin 78) (14 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (10 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (47 : Fin 78) (21 : Fin 78) (20 : Fin 78)
    (48 : Fin 78) (14 : Fin 78) (75 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4850` (kalmanson). -/
theorem middleSource_h4850 :
    ((!((allOneRankAtom (sourceRanks P) 20 == allOneRankAtom (sourceRanks P) 75)) || ((allOneRankAtom (sourceRanks P) 14).ult (allOneRankAtom (sourceRanks P) 48)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (48 : Fin 78) (20 : Fin 78)
    (14 : Fin 78) (75 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (10 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (47 : Fin 78) (21 : Fin 78) (20 : Fin 78)
    (48 : Fin 78) (14 : Fin 78) (75 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4851` (kalmanson). -/
theorem middleSource_h4851 :
    ((!((allOneRankAtom (sourceRanks P) 48 == allOneRankAtom (sourceRanks P) 14)) || ((allOneRankAtom (sourceRanks P) 75).ult (allOneRankAtom (sourceRanks P) 20)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (20 : Fin 78) (48 : Fin 78)
    (75 : Fin 78) (14 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (10 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (47 : Fin 78) (21 : Fin 78) (20 : Fin 78)
    (48 : Fin 78) (14 : Fin 78) (75 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4852` (kalmanson). -/
theorem middleSource_h4852 :
    ((!((allOneRankAtom (sourceRanks P) 48 == allOneRankAtom (sourceRanks P) 75)) || ((allOneRankAtom (sourceRanks P) 14).ult (allOneRankAtom (sourceRanks P) 20)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (20 : Fin 78) (48 : Fin 78)
    (14 : Fin 78) (75 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (10 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (47 : Fin 78) (21 : Fin 78) (20 : Fin 78)
    (48 : Fin 78) (14 : Fin 78) (75 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4853` (kalmanson). -/
theorem middleSource_h4853 :
    ((!((allOneRankAtom (sourceRanks P) 20 == allOneRankAtom (sourceRanks P) 21)) || ((allOneRankAtom (sourceRanks P) 47).ult (allOneRankAtom (sourceRanks P) 48)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (48 : Fin 78) (20 : Fin 78)
    (47 : Fin 78) (21 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (10 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (47 : Fin 78) (21 : Fin 78) (20 : Fin 78)
    (48 : Fin 78) (14 : Fin 78) (75 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4854` (kalmanson). -/
theorem middleSource_h4854 :
    ((!((allOneRankAtom (sourceRanks P) 20 == allOneRankAtom (sourceRanks P) 47)) || ((allOneRankAtom (sourceRanks P) 21).ult (allOneRankAtom (sourceRanks P) 48)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (48 : Fin 78) (20 : Fin 78)
    (21 : Fin 78) (47 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (10 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (47 : Fin 78) (21 : Fin 78) (20 : Fin 78)
    (48 : Fin 78) (14 : Fin 78) (75 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4855` (kalmanson). -/
theorem middleSource_h4855 :
    ((!((allOneRankAtom (sourceRanks P) 48 == allOneRankAtom (sourceRanks P) 21)) || ((allOneRankAtom (sourceRanks P) 47).ult (allOneRankAtom (sourceRanks P) 20)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (20 : Fin 78) (48 : Fin 78)
    (47 : Fin 78) (21 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (10 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (47 : Fin 78) (21 : Fin 78) (20 : Fin 78)
    (48 : Fin 78) (14 : Fin 78) (75 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4856` (kalmanson). -/
theorem middleSource_h4856 :
    ((!((allOneRankAtom (sourceRanks P) 48 == allOneRankAtom (sourceRanks P) 47)) || ((allOneRankAtom (sourceRanks P) 21).ult (allOneRankAtom (sourceRanks P) 20)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (20 : Fin 78) (48 : Fin 78)
    (21 : Fin 78) (47 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (10 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (47 : Fin 78) (21 : Fin 78) (20 : Fin 78)
    (48 : Fin 78) (14 : Fin 78) (75 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4857` (kalmanson). -/
theorem middleSource_h4857 :
    ((!((allOneRankAtom (sourceRanks P) 20 == allOneRankAtom (sourceRanks P) 14)) || ((allOneRankAtom (sourceRanks P) 76).ult (allOneRankAtom (sourceRanks P) 49)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (49 : Fin 78) (20 : Fin 78)
    (76 : Fin 78) (14 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (10 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (47 : Fin 78) (22 : Fin 78) (20 : Fin 78)
    (49 : Fin 78) (14 : Fin 78) (76 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4858` (kalmanson). -/
theorem middleSource_h4858 :
    ((!((allOneRankAtom (sourceRanks P) 20 == allOneRankAtom (sourceRanks P) 76)) || ((allOneRankAtom (sourceRanks P) 14).ult (allOneRankAtom (sourceRanks P) 49)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (49 : Fin 78) (20 : Fin 78)
    (14 : Fin 78) (76 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (10 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (47 : Fin 78) (22 : Fin 78) (20 : Fin 78)
    (49 : Fin 78) (14 : Fin 78) (76 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4859` (kalmanson). -/
theorem middleSource_h4859 :
    ((!((allOneRankAtom (sourceRanks P) 49 == allOneRankAtom (sourceRanks P) 14)) || ((allOneRankAtom (sourceRanks P) 76).ult (allOneRankAtom (sourceRanks P) 20)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (20 : Fin 78) (49 : Fin 78)
    (76 : Fin 78) (14 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (10 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (47 : Fin 78) (22 : Fin 78) (20 : Fin 78)
    (49 : Fin 78) (14 : Fin 78) (76 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4860` (kalmanson). -/
theorem middleSource_h4860 :
    ((!((allOneRankAtom (sourceRanks P) 49 == allOneRankAtom (sourceRanks P) 76)) || ((allOneRankAtom (sourceRanks P) 14).ult (allOneRankAtom (sourceRanks P) 20)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (20 : Fin 78) (49 : Fin 78)
    (14 : Fin 78) (76 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (10 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (47 : Fin 78) (22 : Fin 78) (20 : Fin 78)
    (49 : Fin 78) (14 : Fin 78) (76 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4861` (kalmanson). -/
theorem middleSource_h4861 :
    ((!((allOneRankAtom (sourceRanks P) 20 == allOneRankAtom (sourceRanks P) 22)) || ((allOneRankAtom (sourceRanks P) 47).ult (allOneRankAtom (sourceRanks P) 49)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (49 : Fin 78) (20 : Fin 78)
    (47 : Fin 78) (22 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (10 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (47 : Fin 78) (22 : Fin 78) (20 : Fin 78)
    (49 : Fin 78) (14 : Fin 78) (76 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4862` (kalmanson). -/
theorem middleSource_h4862 :
    ((!((allOneRankAtom (sourceRanks P) 20 == allOneRankAtom (sourceRanks P) 47)) || ((allOneRankAtom (sourceRanks P) 22).ult (allOneRankAtom (sourceRanks P) 49)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (49 : Fin 78) (20 : Fin 78)
    (22 : Fin 78) (47 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (10 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (47 : Fin 78) (22 : Fin 78) (20 : Fin 78)
    (49 : Fin 78) (14 : Fin 78) (76 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4863` (kalmanson). -/
theorem middleSource_h4863 :
    ((!((allOneRankAtom (sourceRanks P) 49 == allOneRankAtom (sourceRanks P) 47)) || ((allOneRankAtom (sourceRanks P) 22).ult (allOneRankAtom (sourceRanks P) 20)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (20 : Fin 78) (49 : Fin 78)
    (22 : Fin 78) (47 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (10 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (47 : Fin 78) (22 : Fin 78) (20 : Fin 78)
    (49 : Fin 78) (14 : Fin 78) (76 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

end

end ATailExactFiveCard13AllOneSourceIngressScratch
end Problem97
