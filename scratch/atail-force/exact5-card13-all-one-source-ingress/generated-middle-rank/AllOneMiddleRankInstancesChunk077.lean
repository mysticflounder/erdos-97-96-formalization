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

/-- Candidate middle source assertion `h4928` (kalmanson). -/
theorem middleSource_h4928 :
    ((!((allOneRankAtom (sourceRanks P) 17 == allOneRankAtom (sourceRanks P) 15)) || ((allOneRankAtom (sourceRanks P) 65).ult (allOneRankAtom (sourceRanks P) 54)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (54 : Fin 78) (17 : Fin 78)
    (65 : Fin 78) (15 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (5 : Fin 13) (7 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (51 : Fin 78) (20 : Fin 78) (17 : Fin 78)
    (54 : Fin 78) (15 : Fin 78) (65 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4929` (kalmanson). -/
theorem middleSource_h4929 :
    ((!((allOneRankAtom (sourceRanks P) 54 == allOneRankAtom (sourceRanks P) 15)) || ((allOneRankAtom (sourceRanks P) 65).ult (allOneRankAtom (sourceRanks P) 17)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (17 : Fin 78) (54 : Fin 78)
    (65 : Fin 78) (15 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (5 : Fin 13) (7 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (51 : Fin 78) (20 : Fin 78) (17 : Fin 78)
    (54 : Fin 78) (15 : Fin 78) (65 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4930` (kalmanson). -/
theorem middleSource_h4930 :
    ((!((allOneRankAtom (sourceRanks P) 54 == allOneRankAtom (sourceRanks P) 65)) || ((allOneRankAtom (sourceRanks P) 15).ult (allOneRankAtom (sourceRanks P) 17)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (17 : Fin 78) (54 : Fin 78)
    (15 : Fin 78) (65 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (5 : Fin 13) (7 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (51 : Fin 78) (20 : Fin 78) (17 : Fin 78)
    (54 : Fin 78) (15 : Fin 78) (65 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4931` (kalmanson). -/
theorem middleSource_h4931 :
    ((!((allOneRankAtom (sourceRanks P) 17 == allOneRankAtom (sourceRanks P) 20)) || ((allOneRankAtom (sourceRanks P) 51).ult (allOneRankAtom (sourceRanks P) 54)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (54 : Fin 78) (17 : Fin 78)
    (51 : Fin 78) (20 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (5 : Fin 13) (7 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (51 : Fin 78) (20 : Fin 78) (17 : Fin 78)
    (54 : Fin 78) (15 : Fin 78) (65 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4932` (kalmanson). -/
theorem middleSource_h4932 :
    ((!((allOneRankAtom (sourceRanks P) 54 == allOneRankAtom (sourceRanks P) 20)) || ((allOneRankAtom (sourceRanks P) 51).ult (allOneRankAtom (sourceRanks P) 17)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (17 : Fin 78) (54 : Fin 78)
    (51 : Fin 78) (20 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (5 : Fin 13) (7 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (51 : Fin 78) (20 : Fin 78) (17 : Fin 78)
    (54 : Fin 78) (15 : Fin 78) (65 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4933` (kalmanson). -/
theorem middleSource_h4933 :
    ((!((allOneRankAtom (sourceRanks P) 54 == allOneRankAtom (sourceRanks P) 51)) || ((allOneRankAtom (sourceRanks P) 20).ult (allOneRankAtom (sourceRanks P) 17)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (17 : Fin 78) (54 : Fin 78)
    (20 : Fin 78) (51 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (5 : Fin 13) (7 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (51 : Fin 78) (20 : Fin 78) (17 : Fin 78)
    (54 : Fin 78) (15 : Fin 78) (65 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4934` (kalmanson). -/
theorem middleSource_h4934 :
    ((!((allOneRankAtom (sourceRanks P) 17 == allOneRankAtom (sourceRanks P) 15)) || ((allOneRankAtom (sourceRanks P) 66).ult (allOneRankAtom (sourceRanks P) 55)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (55 : Fin 78) (17 : Fin 78)
    (66 : Fin 78) (15 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (5 : Fin 13) (7 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (51 : Fin 78) (21 : Fin 78) (17 : Fin 78)
    (55 : Fin 78) (15 : Fin 78) (66 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4935` (kalmanson). -/
theorem middleSource_h4935 :
    ((!((allOneRankAtom (sourceRanks P) 55 == allOneRankAtom (sourceRanks P) 15)) || ((allOneRankAtom (sourceRanks P) 66).ult (allOneRankAtom (sourceRanks P) 17)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (17 : Fin 78) (55 : Fin 78)
    (66 : Fin 78) (15 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (5 : Fin 13) (7 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (51 : Fin 78) (21 : Fin 78) (17 : Fin 78)
    (55 : Fin 78) (15 : Fin 78) (66 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4936` (kalmanson). -/
theorem middleSource_h4936 :
    ((!((allOneRankAtom (sourceRanks P) 55 == allOneRankAtom (sourceRanks P) 66)) || ((allOneRankAtom (sourceRanks P) 15).ult (allOneRankAtom (sourceRanks P) 17)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (17 : Fin 78) (55 : Fin 78)
    (15 : Fin 78) (66 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (5 : Fin 13) (7 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (51 : Fin 78) (21 : Fin 78) (17 : Fin 78)
    (55 : Fin 78) (15 : Fin 78) (66 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4937` (kalmanson). -/
theorem middleSource_h4937 :
    ((!((allOneRankAtom (sourceRanks P) 17 == allOneRankAtom (sourceRanks P) 21)) || ((allOneRankAtom (sourceRanks P) 51).ult (allOneRankAtom (sourceRanks P) 55)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (55 : Fin 78) (17 : Fin 78)
    (51 : Fin 78) (21 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (5 : Fin 13) (7 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (51 : Fin 78) (21 : Fin 78) (17 : Fin 78)
    (55 : Fin 78) (15 : Fin 78) (66 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4938` (kalmanson). -/
theorem middleSource_h4938 :
    ((!((allOneRankAtom (sourceRanks P) 55 == allOneRankAtom (sourceRanks P) 21)) || ((allOneRankAtom (sourceRanks P) 51).ult (allOneRankAtom (sourceRanks P) 17)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (17 : Fin 78) (55 : Fin 78)
    (51 : Fin 78) (21 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (5 : Fin 13) (7 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (51 : Fin 78) (21 : Fin 78) (17 : Fin 78)
    (55 : Fin 78) (15 : Fin 78) (66 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4939` (kalmanson). -/
theorem middleSource_h4939 :
    ((!((allOneRankAtom (sourceRanks P) 55 == allOneRankAtom (sourceRanks P) 51)) || ((allOneRankAtom (sourceRanks P) 21).ult (allOneRankAtom (sourceRanks P) 17)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (17 : Fin 78) (55 : Fin 78)
    (21 : Fin 78) (51 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (5 : Fin 13) (7 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (51 : Fin 78) (21 : Fin 78) (17 : Fin 78)
    (55 : Fin 78) (15 : Fin 78) (66 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4940` (kalmanson). -/
theorem middleSource_h4940 :
    ((!((allOneRankAtom (sourceRanks P) 17 == allOneRankAtom (sourceRanks P) 15)) || ((allOneRankAtom (sourceRanks P) 67).ult (allOneRankAtom (sourceRanks P) 56)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (56 : Fin 78) (17 : Fin 78)
    (67 : Fin 78) (15 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (5 : Fin 13) (7 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (51 : Fin 78) (22 : Fin 78) (17 : Fin 78)
    (56 : Fin 78) (15 : Fin 78) (67 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4941` (kalmanson). -/
theorem middleSource_h4941 :
    ((!((allOneRankAtom (sourceRanks P) 56 == allOneRankAtom (sourceRanks P) 15)) || ((allOneRankAtom (sourceRanks P) 67).ult (allOneRankAtom (sourceRanks P) 17)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (17 : Fin 78) (56 : Fin 78)
    (67 : Fin 78) (15 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (5 : Fin 13) (7 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (51 : Fin 78) (22 : Fin 78) (17 : Fin 78)
    (56 : Fin 78) (15 : Fin 78) (67 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4942` (kalmanson). -/
theorem middleSource_h4942 :
    ((!((allOneRankAtom (sourceRanks P) 17 == allOneRankAtom (sourceRanks P) 22)) || ((allOneRankAtom (sourceRanks P) 51).ult (allOneRankAtom (sourceRanks P) 56)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (56 : Fin 78) (17 : Fin 78)
    (51 : Fin 78) (22 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (5 : Fin 13) (7 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (51 : Fin 78) (22 : Fin 78) (17 : Fin 78)
    (56 : Fin 78) (15 : Fin 78) (67 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4943` (kalmanson). -/
theorem middleSource_h4943 :
    ((!((allOneRankAtom (sourceRanks P) 56 == allOneRankAtom (sourceRanks P) 51)) || ((allOneRankAtom (sourceRanks P) 22).ult (allOneRankAtom (sourceRanks P) 17)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (17 : Fin 78) (56 : Fin 78)
    (22 : Fin 78) (51 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (5 : Fin 13) (7 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (51 : Fin 78) (22 : Fin 78) (17 : Fin 78)
    (56 : Fin 78) (15 : Fin 78) (67 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4944` (kalmanson). -/
theorem middleSource_h4944 :
    ((!((allOneRankAtom (sourceRanks P) 18 == allOneRankAtom (sourceRanks P) 15)) || ((allOneRankAtom (sourceRanks P) 68).ult (allOneRankAtom (sourceRanks P) 53)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (53 : Fin 78) (18 : Fin 78)
    (68 : Fin 78) (15 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (5 : Fin 13) (8 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (52 : Fin 78) (19 : Fin 78) (18 : Fin 78)
    (53 : Fin 78) (15 : Fin 78) (68 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4945` (kalmanson). -/
theorem middleSource_h4945 :
    ((!((allOneRankAtom (sourceRanks P) 18 == allOneRankAtom (sourceRanks P) 68)) || ((allOneRankAtom (sourceRanks P) 15).ult (allOneRankAtom (sourceRanks P) 53)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (53 : Fin 78) (18 : Fin 78)
    (15 : Fin 78) (68 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (5 : Fin 13) (8 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (52 : Fin 78) (19 : Fin 78) (18 : Fin 78)
    (53 : Fin 78) (15 : Fin 78) (68 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4946` (kalmanson). -/
theorem middleSource_h4946 :
    ((!((allOneRankAtom (sourceRanks P) 53 == allOneRankAtom (sourceRanks P) 15)) || ((allOneRankAtom (sourceRanks P) 68).ult (allOneRankAtom (sourceRanks P) 18)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (18 : Fin 78) (53 : Fin 78)
    (68 : Fin 78) (15 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (5 : Fin 13) (8 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (52 : Fin 78) (19 : Fin 78) (18 : Fin 78)
    (53 : Fin 78) (15 : Fin 78) (68 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4947` (kalmanson). -/
theorem middleSource_h4947 :
    ((!((allOneRankAtom (sourceRanks P) 53 == allOneRankAtom (sourceRanks P) 68)) || ((allOneRankAtom (sourceRanks P) 15).ult (allOneRankAtom (sourceRanks P) 18)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (18 : Fin 78) (53 : Fin 78)
    (15 : Fin 78) (68 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (5 : Fin 13) (8 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (52 : Fin 78) (19 : Fin 78) (18 : Fin 78)
    (53 : Fin 78) (15 : Fin 78) (68 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4948` (kalmanson). -/
theorem middleSource_h4948 :
    ((!((allOneRankAtom (sourceRanks P) 18 == allOneRankAtom (sourceRanks P) 19)) || ((allOneRankAtom (sourceRanks P) 52).ult (allOneRankAtom (sourceRanks P) 53)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (53 : Fin 78) (18 : Fin 78)
    (52 : Fin 78) (19 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (5 : Fin 13) (8 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (52 : Fin 78) (19 : Fin 78) (18 : Fin 78)
    (53 : Fin 78) (15 : Fin 78) (68 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4949` (kalmanson). -/
theorem middleSource_h4949 :
    ((!((allOneRankAtom (sourceRanks P) 18 == allOneRankAtom (sourceRanks P) 52)) || ((allOneRankAtom (sourceRanks P) 19).ult (allOneRankAtom (sourceRanks P) 53)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (53 : Fin 78) (18 : Fin 78)
    (19 : Fin 78) (52 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (5 : Fin 13) (8 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (52 : Fin 78) (19 : Fin 78) (18 : Fin 78)
    (53 : Fin 78) (15 : Fin 78) (68 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4950` (kalmanson). -/
theorem middleSource_h4950 :
    ((!((allOneRankAtom (sourceRanks P) 53 == allOneRankAtom (sourceRanks P) 19)) || ((allOneRankAtom (sourceRanks P) 52).ult (allOneRankAtom (sourceRanks P) 18)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (18 : Fin 78) (53 : Fin 78)
    (52 : Fin 78) (19 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (5 : Fin 13) (8 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (52 : Fin 78) (19 : Fin 78) (18 : Fin 78)
    (53 : Fin 78) (15 : Fin 78) (68 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4951` (kalmanson). -/
theorem middleSource_h4951 :
    ((!((allOneRankAtom (sourceRanks P) 53 == allOneRankAtom (sourceRanks P) 52)) || ((allOneRankAtom (sourceRanks P) 19).ult (allOneRankAtom (sourceRanks P) 18)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (18 : Fin 78) (53 : Fin 78)
    (19 : Fin 78) (52 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (5 : Fin 13) (8 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (52 : Fin 78) (19 : Fin 78) (18 : Fin 78)
    (53 : Fin 78) (15 : Fin 78) (68 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4952` (kalmanson). -/
theorem middleSource_h4952 :
    ((!((allOneRankAtom (sourceRanks P) 18 == allOneRankAtom (sourceRanks P) 15)) || ((allOneRankAtom (sourceRanks P) 69).ult (allOneRankAtom (sourceRanks P) 54)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (54 : Fin 78) (18 : Fin 78)
    (69 : Fin 78) (15 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (5 : Fin 13) (8 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (52 : Fin 78) (20 : Fin 78) (18 : Fin 78)
    (54 : Fin 78) (15 : Fin 78) (69 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4953` (kalmanson). -/
theorem middleSource_h4953 :
    ((!((allOneRankAtom (sourceRanks P) 18 == allOneRankAtom (sourceRanks P) 69)) || ((allOneRankAtom (sourceRanks P) 15).ult (allOneRankAtom (sourceRanks P) 54)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (54 : Fin 78) (18 : Fin 78)
    (15 : Fin 78) (69 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (5 : Fin 13) (8 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (52 : Fin 78) (20 : Fin 78) (18 : Fin 78)
    (54 : Fin 78) (15 : Fin 78) (69 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4954` (kalmanson). -/
theorem middleSource_h4954 :
    ((!((allOneRankAtom (sourceRanks P) 54 == allOneRankAtom (sourceRanks P) 15)) || ((allOneRankAtom (sourceRanks P) 69).ult (allOneRankAtom (sourceRanks P) 18)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (18 : Fin 78) (54 : Fin 78)
    (69 : Fin 78) (15 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (5 : Fin 13) (8 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (52 : Fin 78) (20 : Fin 78) (18 : Fin 78)
    (54 : Fin 78) (15 : Fin 78) (69 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4955` (kalmanson). -/
theorem middleSource_h4955 :
    ((!((allOneRankAtom (sourceRanks P) 54 == allOneRankAtom (sourceRanks P) 69)) || ((allOneRankAtom (sourceRanks P) 15).ult (allOneRankAtom (sourceRanks P) 18)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (18 : Fin 78) (54 : Fin 78)
    (15 : Fin 78) (69 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (5 : Fin 13) (8 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (52 : Fin 78) (20 : Fin 78) (18 : Fin 78)
    (54 : Fin 78) (15 : Fin 78) (69 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4956` (kalmanson). -/
theorem middleSource_h4956 :
    ((!((allOneRankAtom (sourceRanks P) 18 == allOneRankAtom (sourceRanks P) 20)) || ((allOneRankAtom (sourceRanks P) 52).ult (allOneRankAtom (sourceRanks P) 54)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (54 : Fin 78) (18 : Fin 78)
    (52 : Fin 78) (20 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (5 : Fin 13) (8 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (52 : Fin 78) (20 : Fin 78) (18 : Fin 78)
    (54 : Fin 78) (15 : Fin 78) (69 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4957` (kalmanson). -/
theorem middleSource_h4957 :
    ((!((allOneRankAtom (sourceRanks P) 18 == allOneRankAtom (sourceRanks P) 52)) || ((allOneRankAtom (sourceRanks P) 20).ult (allOneRankAtom (sourceRanks P) 54)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (54 : Fin 78) (18 : Fin 78)
    (20 : Fin 78) (52 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (5 : Fin 13) (8 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (52 : Fin 78) (20 : Fin 78) (18 : Fin 78)
    (54 : Fin 78) (15 : Fin 78) (69 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4958` (kalmanson). -/
theorem middleSource_h4958 :
    ((!((allOneRankAtom (sourceRanks P) 54 == allOneRankAtom (sourceRanks P) 20)) || ((allOneRankAtom (sourceRanks P) 52).ult (allOneRankAtom (sourceRanks P) 18)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (18 : Fin 78) (54 : Fin 78)
    (52 : Fin 78) (20 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (5 : Fin 13) (8 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (52 : Fin 78) (20 : Fin 78) (18 : Fin 78)
    (54 : Fin 78) (15 : Fin 78) (69 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4959` (kalmanson). -/
theorem middleSource_h4959 :
    ((!((allOneRankAtom (sourceRanks P) 54 == allOneRankAtom (sourceRanks P) 52)) || ((allOneRankAtom (sourceRanks P) 20).ult (allOneRankAtom (sourceRanks P) 18)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (18 : Fin 78) (54 : Fin 78)
    (20 : Fin 78) (52 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (5 : Fin 13) (8 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (52 : Fin 78) (20 : Fin 78) (18 : Fin 78)
    (54 : Fin 78) (15 : Fin 78) (69 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4960` (kalmanson). -/
theorem middleSource_h4960 :
    ((!((allOneRankAtom (sourceRanks P) 18 == allOneRankAtom (sourceRanks P) 15)) || ((allOneRankAtom (sourceRanks P) 70).ult (allOneRankAtom (sourceRanks P) 55)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (55 : Fin 78) (18 : Fin 78)
    (70 : Fin 78) (15 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (5 : Fin 13) (8 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (52 : Fin 78) (21 : Fin 78) (18 : Fin 78)
    (55 : Fin 78) (15 : Fin 78) (70 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4961` (kalmanson). -/
theorem middleSource_h4961 :
    ((!((allOneRankAtom (sourceRanks P) 18 == allOneRankAtom (sourceRanks P) 70)) || ((allOneRankAtom (sourceRanks P) 15).ult (allOneRankAtom (sourceRanks P) 55)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (55 : Fin 78) (18 : Fin 78)
    (15 : Fin 78) (70 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (5 : Fin 13) (8 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (52 : Fin 78) (21 : Fin 78) (18 : Fin 78)
    (55 : Fin 78) (15 : Fin 78) (70 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4962` (kalmanson). -/
theorem middleSource_h4962 :
    ((!((allOneRankAtom (sourceRanks P) 55 == allOneRankAtom (sourceRanks P) 15)) || ((allOneRankAtom (sourceRanks P) 70).ult (allOneRankAtom (sourceRanks P) 18)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (18 : Fin 78) (55 : Fin 78)
    (70 : Fin 78) (15 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (5 : Fin 13) (8 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (52 : Fin 78) (21 : Fin 78) (18 : Fin 78)
    (55 : Fin 78) (15 : Fin 78) (70 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4963` (kalmanson). -/
theorem middleSource_h4963 :
    ((!((allOneRankAtom (sourceRanks P) 55 == allOneRankAtom (sourceRanks P) 70)) || ((allOneRankAtom (sourceRanks P) 15).ult (allOneRankAtom (sourceRanks P) 18)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (18 : Fin 78) (55 : Fin 78)
    (15 : Fin 78) (70 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (5 : Fin 13) (8 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (52 : Fin 78) (21 : Fin 78) (18 : Fin 78)
    (55 : Fin 78) (15 : Fin 78) (70 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4964` (kalmanson). -/
theorem middleSource_h4964 :
    ((!((allOneRankAtom (sourceRanks P) 18 == allOneRankAtom (sourceRanks P) 21)) || ((allOneRankAtom (sourceRanks P) 52).ult (allOneRankAtom (sourceRanks P) 55)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (55 : Fin 78) (18 : Fin 78)
    (52 : Fin 78) (21 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (5 : Fin 13) (8 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (52 : Fin 78) (21 : Fin 78) (18 : Fin 78)
    (55 : Fin 78) (15 : Fin 78) (70 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4965` (kalmanson). -/
theorem middleSource_h4965 :
    ((!((allOneRankAtom (sourceRanks P) 18 == allOneRankAtom (sourceRanks P) 52)) || ((allOneRankAtom (sourceRanks P) 21).ult (allOneRankAtom (sourceRanks P) 55)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (55 : Fin 78) (18 : Fin 78)
    (21 : Fin 78) (52 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (5 : Fin 13) (8 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (52 : Fin 78) (21 : Fin 78) (18 : Fin 78)
    (55 : Fin 78) (15 : Fin 78) (70 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4966` (kalmanson). -/
theorem middleSource_h4966 :
    ((!((allOneRankAtom (sourceRanks P) 55 == allOneRankAtom (sourceRanks P) 21)) || ((allOneRankAtom (sourceRanks P) 52).ult (allOneRankAtom (sourceRanks P) 18)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (18 : Fin 78) (55 : Fin 78)
    (52 : Fin 78) (21 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (5 : Fin 13) (8 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (52 : Fin 78) (21 : Fin 78) (18 : Fin 78)
    (55 : Fin 78) (15 : Fin 78) (70 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4967` (kalmanson). -/
theorem middleSource_h4967 :
    ((!((allOneRankAtom (sourceRanks P) 55 == allOneRankAtom (sourceRanks P) 52)) || ((allOneRankAtom (sourceRanks P) 21).ult (allOneRankAtom (sourceRanks P) 18)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (18 : Fin 78) (55 : Fin 78)
    (21 : Fin 78) (52 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (5 : Fin 13) (8 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (52 : Fin 78) (21 : Fin 78) (18 : Fin 78)
    (55 : Fin 78) (15 : Fin 78) (70 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4968` (kalmanson). -/
theorem middleSource_h4968 :
    ((!((allOneRankAtom (sourceRanks P) 18 == allOneRankAtom (sourceRanks P) 15)) || ((allOneRankAtom (sourceRanks P) 71).ult (allOneRankAtom (sourceRanks P) 56)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (56 : Fin 78) (18 : Fin 78)
    (71 : Fin 78) (15 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (5 : Fin 13) (8 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (52 : Fin 78) (22 : Fin 78) (18 : Fin 78)
    (56 : Fin 78) (15 : Fin 78) (71 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4969` (kalmanson). -/
theorem middleSource_h4969 :
    ((!((allOneRankAtom (sourceRanks P) 18 == allOneRankAtom (sourceRanks P) 71)) || ((allOneRankAtom (sourceRanks P) 15).ult (allOneRankAtom (sourceRanks P) 56)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (56 : Fin 78) (18 : Fin 78)
    (15 : Fin 78) (71 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (5 : Fin 13) (8 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (52 : Fin 78) (22 : Fin 78) (18 : Fin 78)
    (56 : Fin 78) (15 : Fin 78) (71 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4970` (kalmanson). -/
theorem middleSource_h4970 :
    ((!((allOneRankAtom (sourceRanks P) 56 == allOneRankAtom (sourceRanks P) 15)) || ((allOneRankAtom (sourceRanks P) 71).ult (allOneRankAtom (sourceRanks P) 18)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (18 : Fin 78) (56 : Fin 78)
    (71 : Fin 78) (15 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (5 : Fin 13) (8 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (52 : Fin 78) (22 : Fin 78) (18 : Fin 78)
    (56 : Fin 78) (15 : Fin 78) (71 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4971` (kalmanson). -/
theorem middleSource_h4971 :
    ((!((allOneRankAtom (sourceRanks P) 56 == allOneRankAtom (sourceRanks P) 71)) || ((allOneRankAtom (sourceRanks P) 15).ult (allOneRankAtom (sourceRanks P) 18)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (18 : Fin 78) (56 : Fin 78)
    (15 : Fin 78) (71 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (5 : Fin 13) (8 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (52 : Fin 78) (22 : Fin 78) (18 : Fin 78)
    (56 : Fin 78) (15 : Fin 78) (71 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4972` (kalmanson). -/
theorem middleSource_h4972 :
    ((!((allOneRankAtom (sourceRanks P) 18 == allOneRankAtom (sourceRanks P) 22)) || ((allOneRankAtom (sourceRanks P) 52).ult (allOneRankAtom (sourceRanks P) 56)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (56 : Fin 78) (18 : Fin 78)
    (52 : Fin 78) (22 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (5 : Fin 13) (8 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (52 : Fin 78) (22 : Fin 78) (18 : Fin 78)
    (56 : Fin 78) (15 : Fin 78) (71 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4973` (kalmanson). -/
theorem middleSource_h4973 :
    ((!((allOneRankAtom (sourceRanks P) 18 == allOneRankAtom (sourceRanks P) 52)) || ((allOneRankAtom (sourceRanks P) 22).ult (allOneRankAtom (sourceRanks P) 56)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (56 : Fin 78) (18 : Fin 78)
    (22 : Fin 78) (52 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (5 : Fin 13) (8 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (52 : Fin 78) (22 : Fin 78) (18 : Fin 78)
    (56 : Fin 78) (15 : Fin 78) (71 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4974` (kalmanson). -/
theorem middleSource_h4974 :
    ((!((allOneRankAtom (sourceRanks P) 56 == allOneRankAtom (sourceRanks P) 52)) || ((allOneRankAtom (sourceRanks P) 22).ult (allOneRankAtom (sourceRanks P) 18)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (18 : Fin 78) (56 : Fin 78)
    (22 : Fin 78) (52 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (5 : Fin 13) (8 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (52 : Fin 78) (22 : Fin 78) (18 : Fin 78)
    (56 : Fin 78) (15 : Fin 78) (71 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4975` (kalmanson). -/
theorem middleSource_h4975 :
    ((!((allOneRankAtom (sourceRanks P) 19 == allOneRankAtom (sourceRanks P) 15)) || ((allOneRankAtom (sourceRanks P) 72).ult (allOneRankAtom (sourceRanks P) 54)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (54 : Fin 78) (19 : Fin 78)
    (72 : Fin 78) (15 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (5 : Fin 13) (9 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (53 : Fin 78) (20 : Fin 78) (19 : Fin 78)
    (54 : Fin 78) (15 : Fin 78) (72 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4976` (kalmanson). -/
theorem middleSource_h4976 :
    ((!((allOneRankAtom (sourceRanks P) 19 == allOneRankAtom (sourceRanks P) 72)) || ((allOneRankAtom (sourceRanks P) 15).ult (allOneRankAtom (sourceRanks P) 54)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (54 : Fin 78) (19 : Fin 78)
    (15 : Fin 78) (72 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (5 : Fin 13) (9 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (53 : Fin 78) (20 : Fin 78) (19 : Fin 78)
    (54 : Fin 78) (15 : Fin 78) (72 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4977` (kalmanson). -/
theorem middleSource_h4977 :
    ((!((allOneRankAtom (sourceRanks P) 54 == allOneRankAtom (sourceRanks P) 15)) || ((allOneRankAtom (sourceRanks P) 72).ult (allOneRankAtom (sourceRanks P) 19)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (19 : Fin 78) (54 : Fin 78)
    (72 : Fin 78) (15 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (5 : Fin 13) (9 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (53 : Fin 78) (20 : Fin 78) (19 : Fin 78)
    (54 : Fin 78) (15 : Fin 78) (72 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4978` (kalmanson). -/
theorem middleSource_h4978 :
    ((!((allOneRankAtom (sourceRanks P) 54 == allOneRankAtom (sourceRanks P) 72)) || ((allOneRankAtom (sourceRanks P) 15).ult (allOneRankAtom (sourceRanks P) 19)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (19 : Fin 78) (54 : Fin 78)
    (15 : Fin 78) (72 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (5 : Fin 13) (9 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (53 : Fin 78) (20 : Fin 78) (19 : Fin 78)
    (54 : Fin 78) (15 : Fin 78) (72 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4979` (kalmanson). -/
theorem middleSource_h4979 :
    ((!((allOneRankAtom (sourceRanks P) 19 == allOneRankAtom (sourceRanks P) 20)) || ((allOneRankAtom (sourceRanks P) 53).ult (allOneRankAtom (sourceRanks P) 54)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (54 : Fin 78) (19 : Fin 78)
    (53 : Fin 78) (20 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (5 : Fin 13) (9 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (53 : Fin 78) (20 : Fin 78) (19 : Fin 78)
    (54 : Fin 78) (15 : Fin 78) (72 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4980` (kalmanson). -/
theorem middleSource_h4980 :
    ((!((allOneRankAtom (sourceRanks P) 19 == allOneRankAtom (sourceRanks P) 53)) || ((allOneRankAtom (sourceRanks P) 20).ult (allOneRankAtom (sourceRanks P) 54)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (54 : Fin 78) (19 : Fin 78)
    (20 : Fin 78) (53 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (5 : Fin 13) (9 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (53 : Fin 78) (20 : Fin 78) (19 : Fin 78)
    (54 : Fin 78) (15 : Fin 78) (72 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4981` (kalmanson). -/
theorem middleSource_h4981 :
    ((!((allOneRankAtom (sourceRanks P) 54 == allOneRankAtom (sourceRanks P) 20)) || ((allOneRankAtom (sourceRanks P) 53).ult (allOneRankAtom (sourceRanks P) 19)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (19 : Fin 78) (54 : Fin 78)
    (53 : Fin 78) (20 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (5 : Fin 13) (9 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (53 : Fin 78) (20 : Fin 78) (19 : Fin 78)
    (54 : Fin 78) (15 : Fin 78) (72 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4982` (kalmanson). -/
theorem middleSource_h4982 :
    ((!((allOneRankAtom (sourceRanks P) 54 == allOneRankAtom (sourceRanks P) 53)) || ((allOneRankAtom (sourceRanks P) 20).ult (allOneRankAtom (sourceRanks P) 19)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (19 : Fin 78) (54 : Fin 78)
    (20 : Fin 78) (53 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (5 : Fin 13) (9 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (53 : Fin 78) (20 : Fin 78) (19 : Fin 78)
    (54 : Fin 78) (15 : Fin 78) (72 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4983` (kalmanson). -/
theorem middleSource_h4983 :
    ((!((allOneRankAtom (sourceRanks P) 19 == allOneRankAtom (sourceRanks P) 15)) || ((allOneRankAtom (sourceRanks P) 73).ult (allOneRankAtom (sourceRanks P) 55)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (55 : Fin 78) (19 : Fin 78)
    (73 : Fin 78) (15 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (5 : Fin 13) (9 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (53 : Fin 78) (21 : Fin 78) (19 : Fin 78)
    (55 : Fin 78) (15 : Fin 78) (73 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4984` (kalmanson). -/
theorem middleSource_h4984 :
    ((!((allOneRankAtom (sourceRanks P) 19 == allOneRankAtom (sourceRanks P) 73)) || ((allOneRankAtom (sourceRanks P) 15).ult (allOneRankAtom (sourceRanks P) 55)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (55 : Fin 78) (19 : Fin 78)
    (15 : Fin 78) (73 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (5 : Fin 13) (9 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (53 : Fin 78) (21 : Fin 78) (19 : Fin 78)
    (55 : Fin 78) (15 : Fin 78) (73 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4985` (kalmanson). -/
theorem middleSource_h4985 :
    ((!((allOneRankAtom (sourceRanks P) 55 == allOneRankAtom (sourceRanks P) 15)) || ((allOneRankAtom (sourceRanks P) 73).ult (allOneRankAtom (sourceRanks P) 19)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (19 : Fin 78) (55 : Fin 78)
    (73 : Fin 78) (15 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (5 : Fin 13) (9 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (53 : Fin 78) (21 : Fin 78) (19 : Fin 78)
    (55 : Fin 78) (15 : Fin 78) (73 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4986` (kalmanson). -/
theorem middleSource_h4986 :
    ((!((allOneRankAtom (sourceRanks P) 55 == allOneRankAtom (sourceRanks P) 73)) || ((allOneRankAtom (sourceRanks P) 15).ult (allOneRankAtom (sourceRanks P) 19)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (19 : Fin 78) (55 : Fin 78)
    (15 : Fin 78) (73 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (5 : Fin 13) (9 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (53 : Fin 78) (21 : Fin 78) (19 : Fin 78)
    (55 : Fin 78) (15 : Fin 78) (73 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4987` (kalmanson). -/
theorem middleSource_h4987 :
    ((!((allOneRankAtom (sourceRanks P) 19 == allOneRankAtom (sourceRanks P) 21)) || ((allOneRankAtom (sourceRanks P) 53).ult (allOneRankAtom (sourceRanks P) 55)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (55 : Fin 78) (19 : Fin 78)
    (53 : Fin 78) (21 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (5 : Fin 13) (9 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (53 : Fin 78) (21 : Fin 78) (19 : Fin 78)
    (55 : Fin 78) (15 : Fin 78) (73 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4988` (kalmanson). -/
theorem middleSource_h4988 :
    ((!((allOneRankAtom (sourceRanks P) 19 == allOneRankAtom (sourceRanks P) 53)) || ((allOneRankAtom (sourceRanks P) 21).ult (allOneRankAtom (sourceRanks P) 55)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (55 : Fin 78) (19 : Fin 78)
    (21 : Fin 78) (53 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (5 : Fin 13) (9 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (53 : Fin 78) (21 : Fin 78) (19 : Fin 78)
    (55 : Fin 78) (15 : Fin 78) (73 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4989` (kalmanson). -/
theorem middleSource_h4989 :
    ((!((allOneRankAtom (sourceRanks P) 55 == allOneRankAtom (sourceRanks P) 21)) || ((allOneRankAtom (sourceRanks P) 53).ult (allOneRankAtom (sourceRanks P) 19)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (19 : Fin 78) (55 : Fin 78)
    (53 : Fin 78) (21 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (5 : Fin 13) (9 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (53 : Fin 78) (21 : Fin 78) (19 : Fin 78)
    (55 : Fin 78) (15 : Fin 78) (73 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4990` (kalmanson). -/
theorem middleSource_h4990 :
    ((!((allOneRankAtom (sourceRanks P) 55 == allOneRankAtom (sourceRanks P) 53)) || ((allOneRankAtom (sourceRanks P) 21).ult (allOneRankAtom (sourceRanks P) 19)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (19 : Fin 78) (55 : Fin 78)
    (21 : Fin 78) (53 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (5 : Fin 13) (9 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (53 : Fin 78) (21 : Fin 78) (19 : Fin 78)
    (55 : Fin 78) (15 : Fin 78) (73 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4991` (kalmanson). -/
theorem middleSource_h4991 :
    ((!((allOneRankAtom (sourceRanks P) 19 == allOneRankAtom (sourceRanks P) 15)) || ((allOneRankAtom (sourceRanks P) 74).ult (allOneRankAtom (sourceRanks P) 56)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (56 : Fin 78) (19 : Fin 78)
    (74 : Fin 78) (15 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (5 : Fin 13) (9 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (53 : Fin 78) (22 : Fin 78) (19 : Fin 78)
    (56 : Fin 78) (15 : Fin 78) (74 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

end

end ATailExactFiveCard13AllOneSourceIngressScratch
end Problem97
