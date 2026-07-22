/-
Generated deterministically from `direct.source-core.pass5.json`.

Each theorem concludes one literal packed-source assertion from h0170--h1898
and proves it through the generic source facts in `DirectSourceRankFacts`.
-/
import DirectSourceRankFacts

/-!
# Exact pass-5 rank-source instances

This generated module specializes the generic source lemmas to the literal
packed assertions `h0170`--`h1898` selected by the direct pass-5 core.
-/

namespace Problem97
namespace ATailExactFiveCard13CnfIngressScratch

open ATailCriticalPairFrontier
open ATailBiApexRobustCapBounds
open ATailExactFiveCard13CommonLabelTransportScratch
open ATailExactFiveGlobalCrossDeletionPair
open ATailExactFiveGlobalCoverStarGeometry
open ATailExactFiveMutualOneHitGeometry
open ATailFirstApexShellRole
open ATailKalmansonParentOrderScratch
open ATailLargeCapUniqueFive
open ATailLargeCapUniqueFivePhysicalOmissionCycle
open ATailLargeCapUniqueFivePhysicalOmissionTransitionGlobal
open ATailOrientedPhysicalApexIngress
open ATailParentExactFiveSecondCap
open ATailPhysicalSecondApexCommonDeletion
open CanonicalAsymmetricSemanticRowTable

attribute [local instance] Classical.propDecidable

set_option maxHeartbeats 0
set_option maxRecDepth 1000000

noncomputable section

variable
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    {Q : FrontierBiApexRobustExactFiveSecondCapResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {M : PhysicalActualCriticalMutualOmissionPair H profile}
    {N : SourceTwoHitNormalForm Q profile M}
    (P : CanonicalAsymmetricRolePrepacket N)
    {star : PhysicalGlobalCrossDeletionStar profile}
    {first : FirstApexShellRolePacket F R}
    {T : CanonicalAsymmetricSemanticRowTable P star first}

/-- Exact pass-5 source assertion `h0832` (kalmanson). -/
theorem directSource_h0832 :
    ((!((rankAtom (directSourceRanks P) 44 == rankAtom (directSourceRanks P) 42)) || ((rankAtom (directSourceRanks P) 6).ult (rankAtom (directSourceRanks P) 4)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (4 : Fin 78) (44 : Fin 78)
    (6 : Fin 78) (42 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (5 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (6 : Fin 78) (4 : Fin 78)
    (44 : Fin 78) (3 : Fin 78) (51 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0833` (kalmanson). -/
theorem directSource_h0833 :
    ((!((rankAtom (directSourceRanks P) 4 == rankAtom (directSourceRanks P) 3)) || ((rankAtom (directSourceRanks P) 52).ult (rankAtom (directSourceRanks P) 45)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (45 : Fin 78) (4 : Fin 78)
    (52 : Fin 78) (3 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (5 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (7 : Fin 78) (4 : Fin 78)
    (45 : Fin 78) (3 : Fin 78) (52 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0834` (kalmanson). -/
theorem directSource_h0834 :
    ((!((rankAtom (directSourceRanks P) 4 == rankAtom (directSourceRanks P) 52)) || ((rankAtom (directSourceRanks P) 3).ult (rankAtom (directSourceRanks P) 45)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (45 : Fin 78) (4 : Fin 78)
    (3 : Fin 78) (52 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (5 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (7 : Fin 78) (4 : Fin 78)
    (45 : Fin 78) (3 : Fin 78) (52 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0835` (kalmanson). -/
theorem directSource_h0835 :
    ((!((rankAtom (directSourceRanks P) 4 == rankAtom (directSourceRanks P) 7)) || ((rankAtom (directSourceRanks P) 42).ult (rankAtom (directSourceRanks P) 45)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (45 : Fin 78) (4 : Fin 78)
    (42 : Fin 78) (7 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (5 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (7 : Fin 78) (4 : Fin 78)
    (45 : Fin 78) (3 : Fin 78) (52 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0836` (kalmanson). -/
theorem directSource_h0836 :
    ((!((rankAtom (directSourceRanks P) 4 == rankAtom (directSourceRanks P) 42)) || ((rankAtom (directSourceRanks P) 7).ult (rankAtom (directSourceRanks P) 45)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (45 : Fin 78) (4 : Fin 78)
    (7 : Fin 78) (42 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (5 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (7 : Fin 78) (4 : Fin 78)
    (45 : Fin 78) (3 : Fin 78) (52 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0837` (kalmanson). -/
theorem directSource_h0837 :
    ((!((rankAtom (directSourceRanks P) 45 == rankAtom (directSourceRanks P) 7)) || ((rankAtom (directSourceRanks P) 42).ult (rankAtom (directSourceRanks P) 4)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (4 : Fin 78) (45 : Fin 78)
    (42 : Fin 78) (7 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (5 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (7 : Fin 78) (4 : Fin 78)
    (45 : Fin 78) (3 : Fin 78) (52 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0838` (kalmanson). -/
theorem directSource_h0838 :
    ((!((rankAtom (directSourceRanks P) 4 == rankAtom (directSourceRanks P) 3)) || ((rankAtom (directSourceRanks P) 53).ult (rankAtom (directSourceRanks P) 46)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (46 : Fin 78) (4 : Fin 78)
    (53 : Fin 78) (3 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (5 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (8 : Fin 78) (4 : Fin 78)
    (46 : Fin 78) (3 : Fin 78) (53 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0839` (kalmanson). -/
theorem directSource_h0839 :
    ((!((rankAtom (directSourceRanks P) 4 == rankAtom (directSourceRanks P) 53)) || ((rankAtom (directSourceRanks P) 3).ult (rankAtom (directSourceRanks P) 46)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (46 : Fin 78) (4 : Fin 78)
    (3 : Fin 78) (53 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (5 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (8 : Fin 78) (4 : Fin 78)
    (46 : Fin 78) (3 : Fin 78) (53 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0840` (kalmanson). -/
theorem directSource_h0840 :
    ((!((rankAtom (directSourceRanks P) 46 == rankAtom (directSourceRanks P) 3)) || ((rankAtom (directSourceRanks P) 53).ult (rankAtom (directSourceRanks P) 4)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (4 : Fin 78) (46 : Fin 78)
    (53 : Fin 78) (3 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (5 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (8 : Fin 78) (4 : Fin 78)
    (46 : Fin 78) (3 : Fin 78) (53 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0841` (kalmanson). -/
theorem directSource_h0841 :
    ((!((rankAtom (directSourceRanks P) 4 == rankAtom (directSourceRanks P) 42)) || ((rankAtom (directSourceRanks P) 8).ult (rankAtom (directSourceRanks P) 46)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (46 : Fin 78) (4 : Fin 78)
    (8 : Fin 78) (42 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (5 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (8 : Fin 78) (4 : Fin 78)
    (46 : Fin 78) (3 : Fin 78) (53 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0842` (kalmanson). -/
theorem directSource_h0842 :
    ((!((rankAtom (directSourceRanks P) 4 == rankAtom (directSourceRanks P) 3)) || ((rankAtom (directSourceRanks P) 54).ult (rankAtom (directSourceRanks P) 47)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (47 : Fin 78) (4 : Fin 78)
    (54 : Fin 78) (3 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (5 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (9 : Fin 78) (4 : Fin 78)
    (47 : Fin 78) (3 : Fin 78) (54 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0843` (kalmanson). -/
theorem directSource_h0843 :
    ((!((rankAtom (directSourceRanks P) 4 == rankAtom (directSourceRanks P) 54)) || ((rankAtom (directSourceRanks P) 3).ult (rankAtom (directSourceRanks P) 47)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (47 : Fin 78) (4 : Fin 78)
    (3 : Fin 78) (54 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (5 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (9 : Fin 78) (4 : Fin 78)
    (47 : Fin 78) (3 : Fin 78) (54 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0844` (kalmanson). -/
theorem directSource_h0844 :
    ((!((rankAtom (directSourceRanks P) 47 == rankAtom (directSourceRanks P) 3)) || ((rankAtom (directSourceRanks P) 54).ult (rankAtom (directSourceRanks P) 4)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (4 : Fin 78) (47 : Fin 78)
    (54 : Fin 78) (3 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (5 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (9 : Fin 78) (4 : Fin 78)
    (47 : Fin 78) (3 : Fin 78) (54 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0845` (kalmanson). -/
theorem directSource_h0845 :
    ((!((rankAtom (directSourceRanks P) 4 == rankAtom (directSourceRanks P) 9)) || ((rankAtom (directSourceRanks P) 42).ult (rankAtom (directSourceRanks P) 47)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (47 : Fin 78) (4 : Fin 78)
    (42 : Fin 78) (9 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (5 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (9 : Fin 78) (4 : Fin 78)
    (47 : Fin 78) (3 : Fin 78) (54 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0846` (kalmanson). -/
theorem directSource_h0846 :
    ((!((rankAtom (directSourceRanks P) 4 == rankAtom (directSourceRanks P) 42)) || ((rankAtom (directSourceRanks P) 9).ult (rankAtom (directSourceRanks P) 47)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (47 : Fin 78) (4 : Fin 78)
    (9 : Fin 78) (42 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (5 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (9 : Fin 78) (4 : Fin 78)
    (47 : Fin 78) (3 : Fin 78) (54 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0847` (kalmanson). -/
theorem directSource_h0847 :
    ((!((rankAtom (directSourceRanks P) 47 == rankAtom (directSourceRanks P) 42)) || ((rankAtom (directSourceRanks P) 9).ult (rankAtom (directSourceRanks P) 4)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (4 : Fin 78) (47 : Fin 78)
    (9 : Fin 78) (42 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (5 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (9 : Fin 78) (4 : Fin 78)
    (47 : Fin 78) (3 : Fin 78) (54 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0848` (kalmanson). -/
theorem directSource_h0848 :
    ((!((rankAtom (directSourceRanks P) 4 == rankAtom (directSourceRanks P) 3)) || ((rankAtom (directSourceRanks P) 55).ult (rankAtom (directSourceRanks P) 48)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (48 : Fin 78) (4 : Fin 78)
    (55 : Fin 78) (3 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (5 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (10 : Fin 78) (4 : Fin 78)
    (48 : Fin 78) (3 : Fin 78) (55 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0849` (kalmanson). -/
theorem directSource_h0849 :
    ((!((rankAtom (directSourceRanks P) 4 == rankAtom (directSourceRanks P) 55)) || ((rankAtom (directSourceRanks P) 3).ult (rankAtom (directSourceRanks P) 48)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (48 : Fin 78) (4 : Fin 78)
    (3 : Fin 78) (55 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (5 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (10 : Fin 78) (4 : Fin 78)
    (48 : Fin 78) (3 : Fin 78) (55 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0850` (kalmanson). -/
theorem directSource_h0850 :
    ((!((rankAtom (directSourceRanks P) 48 == rankAtom (directSourceRanks P) 3)) || ((rankAtom (directSourceRanks P) 55).ult (rankAtom (directSourceRanks P) 4)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (4 : Fin 78) (48 : Fin 78)
    (55 : Fin 78) (3 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (5 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (10 : Fin 78) (4 : Fin 78)
    (48 : Fin 78) (3 : Fin 78) (55 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0851` (kalmanson). -/
theorem directSource_h0851 :
    ((!((rankAtom (directSourceRanks P) 4 == rankAtom (directSourceRanks P) 10)) || ((rankAtom (directSourceRanks P) 42).ult (rankAtom (directSourceRanks P) 48)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (48 : Fin 78) (4 : Fin 78)
    (42 : Fin 78) (10 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (5 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (10 : Fin 78) (4 : Fin 78)
    (48 : Fin 78) (3 : Fin 78) (55 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0852` (kalmanson). -/
theorem directSource_h0852 :
    ((!((rankAtom (directSourceRanks P) 4 == rankAtom (directSourceRanks P) 3)) || ((rankAtom (directSourceRanks P) 56).ult (rankAtom (directSourceRanks P) 49)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (49 : Fin 78) (4 : Fin 78)
    (56 : Fin 78) (3 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (5 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (11 : Fin 78) (4 : Fin 78)
    (49 : Fin 78) (3 : Fin 78) (56 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0853` (kalmanson). -/
theorem directSource_h0853 :
    ((!((rankAtom (directSourceRanks P) 4 == rankAtom (directSourceRanks P) 56)) || ((rankAtom (directSourceRanks P) 3).ult (rankAtom (directSourceRanks P) 49)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (49 : Fin 78) (4 : Fin 78)
    (3 : Fin 78) (56 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (5 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (11 : Fin 78) (4 : Fin 78)
    (49 : Fin 78) (3 : Fin 78) (56 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0854` (kalmanson). -/
theorem directSource_h0854 :
    ((!((rankAtom (directSourceRanks P) 49 == rankAtom (directSourceRanks P) 3)) || ((rankAtom (directSourceRanks P) 56).ult (rankAtom (directSourceRanks P) 4)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (4 : Fin 78) (49 : Fin 78)
    (56 : Fin 78) (3 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (5 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (11 : Fin 78) (4 : Fin 78)
    (49 : Fin 78) (3 : Fin 78) (56 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0855` (kalmanson). -/
theorem directSource_h0855 :
    ((!((rankAtom (directSourceRanks P) 4 == rankAtom (directSourceRanks P) 11)) || ((rankAtom (directSourceRanks P) 42).ult (rankAtom (directSourceRanks P) 49)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (49 : Fin 78) (4 : Fin 78)
    (42 : Fin 78) (11 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (5 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (11 : Fin 78) (4 : Fin 78)
    (49 : Fin 78) (3 : Fin 78) (56 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0856` (kalmanson). -/
theorem directSource_h0856 :
    ((!((rankAtom (directSourceRanks P) 5 == rankAtom (directSourceRanks P) 3)) || ((rankAtom (directSourceRanks P) 57).ult (rankAtom (directSourceRanks P) 44)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (44 : Fin 78) (5 : Fin 78)
    (57 : Fin 78) (3 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (6 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (43 : Fin 78) (6 : Fin 78) (5 : Fin 78)
    (44 : Fin 78) (3 : Fin 78) (57 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0857` (kalmanson). -/
theorem directSource_h0857 :
    ((!((rankAtom (directSourceRanks P) 5 == rankAtom (directSourceRanks P) 57)) || ((rankAtom (directSourceRanks P) 3).ult (rankAtom (directSourceRanks P) 44)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (44 : Fin 78) (5 : Fin 78)
    (3 : Fin 78) (57 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (6 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (43 : Fin 78) (6 : Fin 78) (5 : Fin 78)
    (44 : Fin 78) (3 : Fin 78) (57 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0858` (kalmanson). -/
theorem directSource_h0858 :
    ((!((rankAtom (directSourceRanks P) 5 == rankAtom (directSourceRanks P) 6)) || ((rankAtom (directSourceRanks P) 43).ult (rankAtom (directSourceRanks P) 44)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (44 : Fin 78) (5 : Fin 78)
    (43 : Fin 78) (6 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (6 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (43 : Fin 78) (6 : Fin 78) (5 : Fin 78)
    (44 : Fin 78) (3 : Fin 78) (57 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0859` (kalmanson). -/
theorem directSource_h0859 :
    ((!((rankAtom (directSourceRanks P) 5 == rankAtom (directSourceRanks P) 43)) || ((rankAtom (directSourceRanks P) 6).ult (rankAtom (directSourceRanks P) 44)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (44 : Fin 78) (5 : Fin 78)
    (6 : Fin 78) (43 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (6 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (43 : Fin 78) (6 : Fin 78) (5 : Fin 78)
    (44 : Fin 78) (3 : Fin 78) (57 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0860` (kalmanson). -/
theorem directSource_h0860 :
    ((!((rankAtom (directSourceRanks P) 44 == rankAtom (directSourceRanks P) 43)) || ((rankAtom (directSourceRanks P) 6).ult (rankAtom (directSourceRanks P) 5)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (5 : Fin 78) (44 : Fin 78)
    (6 : Fin 78) (43 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (6 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (43 : Fin 78) (6 : Fin 78) (5 : Fin 78)
    (44 : Fin 78) (3 : Fin 78) (57 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0861` (kalmanson). -/
theorem directSource_h0861 :
    ((!((rankAtom (directSourceRanks P) 5 == rankAtom (directSourceRanks P) 3)) || ((rankAtom (directSourceRanks P) 58).ult (rankAtom (directSourceRanks P) 45)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (45 : Fin 78) (5 : Fin 78)
    (58 : Fin 78) (3 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (6 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (43 : Fin 78) (7 : Fin 78) (5 : Fin 78)
    (45 : Fin 78) (3 : Fin 78) (58 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0862` (kalmanson). -/
theorem directSource_h0862 :
    ((!((rankAtom (directSourceRanks P) 5 == rankAtom (directSourceRanks P) 58)) || ((rankAtom (directSourceRanks P) 3).ult (rankAtom (directSourceRanks P) 45)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (45 : Fin 78) (5 : Fin 78)
    (3 : Fin 78) (58 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (6 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (43 : Fin 78) (7 : Fin 78) (5 : Fin 78)
    (45 : Fin 78) (3 : Fin 78) (58 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0863` (kalmanson). -/
theorem directSource_h0863 :
    ((!((rankAtom (directSourceRanks P) 5 == rankAtom (directSourceRanks P) 7)) || ((rankAtom (directSourceRanks P) 43).ult (rankAtom (directSourceRanks P) 45)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (45 : Fin 78) (5 : Fin 78)
    (43 : Fin 78) (7 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (6 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (43 : Fin 78) (7 : Fin 78) (5 : Fin 78)
    (45 : Fin 78) (3 : Fin 78) (58 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0864` (kalmanson). -/
theorem directSource_h0864 :
    ((!((rankAtom (directSourceRanks P) 5 == rankAtom (directSourceRanks P) 43)) || ((rankAtom (directSourceRanks P) 7).ult (rankAtom (directSourceRanks P) 45)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (45 : Fin 78) (5 : Fin 78)
    (7 : Fin 78) (43 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (6 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (43 : Fin 78) (7 : Fin 78) (5 : Fin 78)
    (45 : Fin 78) (3 : Fin 78) (58 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0865` (kalmanson). -/
theorem directSource_h0865 :
    ((!((rankAtom (directSourceRanks P) 45 == rankAtom (directSourceRanks P) 7)) || ((rankAtom (directSourceRanks P) 43).ult (rankAtom (directSourceRanks P) 5)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (5 : Fin 78) (45 : Fin 78)
    (43 : Fin 78) (7 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (6 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (43 : Fin 78) (7 : Fin 78) (5 : Fin 78)
    (45 : Fin 78) (3 : Fin 78) (58 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0866` (kalmanson). -/
theorem directSource_h0866 :
    ((!((rankAtom (directSourceRanks P) 5 == rankAtom (directSourceRanks P) 3)) || ((rankAtom (directSourceRanks P) 59).ult (rankAtom (directSourceRanks P) 46)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (46 : Fin 78) (5 : Fin 78)
    (59 : Fin 78) (3 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (6 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (43 : Fin 78) (8 : Fin 78) (5 : Fin 78)
    (46 : Fin 78) (3 : Fin 78) (59 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0867` (kalmanson). -/
theorem directSource_h0867 :
    ((!((rankAtom (directSourceRanks P) 5 == rankAtom (directSourceRanks P) 59)) || ((rankAtom (directSourceRanks P) 3).ult (rankAtom (directSourceRanks P) 46)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (46 : Fin 78) (5 : Fin 78)
    (3 : Fin 78) (59 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (6 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (43 : Fin 78) (8 : Fin 78) (5 : Fin 78)
    (46 : Fin 78) (3 : Fin 78) (59 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0868` (kalmanson). -/
theorem directSource_h0868 :
    ((!((rankAtom (directSourceRanks P) 46 == rankAtom (directSourceRanks P) 3)) || ((rankAtom (directSourceRanks P) 59).ult (rankAtom (directSourceRanks P) 5)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (5 : Fin 78) (46 : Fin 78)
    (59 : Fin 78) (3 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (6 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (43 : Fin 78) (8 : Fin 78) (5 : Fin 78)
    (46 : Fin 78) (3 : Fin 78) (59 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0869` (kalmanson). -/
theorem directSource_h0869 :
    ((!((rankAtom (directSourceRanks P) 5 == rankAtom (directSourceRanks P) 8)) || ((rankAtom (directSourceRanks P) 43).ult (rankAtom (directSourceRanks P) 46)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (46 : Fin 78) (5 : Fin 78)
    (43 : Fin 78) (8 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (6 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (43 : Fin 78) (8 : Fin 78) (5 : Fin 78)
    (46 : Fin 78) (3 : Fin 78) (59 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0870` (kalmanson). -/
theorem directSource_h0870 :
    ((!((rankAtom (directSourceRanks P) 5 == rankAtom (directSourceRanks P) 43)) || ((rankAtom (directSourceRanks P) 8).ult (rankAtom (directSourceRanks P) 46)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (46 : Fin 78) (5 : Fin 78)
    (8 : Fin 78) (43 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (6 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (43 : Fin 78) (8 : Fin 78) (5 : Fin 78)
    (46 : Fin 78) (3 : Fin 78) (59 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0871` (kalmanson). -/
theorem directSource_h0871 :
    ((!((rankAtom (directSourceRanks P) 46 == rankAtom (directSourceRanks P) 43)) || ((rankAtom (directSourceRanks P) 8).ult (rankAtom (directSourceRanks P) 5)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (5 : Fin 78) (46 : Fin 78)
    (8 : Fin 78) (43 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (6 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (43 : Fin 78) (8 : Fin 78) (5 : Fin 78)
    (46 : Fin 78) (3 : Fin 78) (59 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0872` (kalmanson). -/
theorem directSource_h0872 :
    ((!((rankAtom (directSourceRanks P) 5 == rankAtom (directSourceRanks P) 3)) || ((rankAtom (directSourceRanks P) 60).ult (rankAtom (directSourceRanks P) 47)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (47 : Fin 78) (5 : Fin 78)
    (60 : Fin 78) (3 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (6 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (43 : Fin 78) (9 : Fin 78) (5 : Fin 78)
    (47 : Fin 78) (3 : Fin 78) (60 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0873` (kalmanson). -/
theorem directSource_h0873 :
    ((!((rankAtom (directSourceRanks P) 5 == rankAtom (directSourceRanks P) 60)) || ((rankAtom (directSourceRanks P) 3).ult (rankAtom (directSourceRanks P) 47)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (47 : Fin 78) (5 : Fin 78)
    (3 : Fin 78) (60 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (6 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (43 : Fin 78) (9 : Fin 78) (5 : Fin 78)
    (47 : Fin 78) (3 : Fin 78) (60 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0874` (kalmanson). -/
theorem directSource_h0874 :
    ((!((rankAtom (directSourceRanks P) 47 == rankAtom (directSourceRanks P) 3)) || ((rankAtom (directSourceRanks P) 60).ult (rankAtom (directSourceRanks P) 5)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (5 : Fin 78) (47 : Fin 78)
    (60 : Fin 78) (3 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (6 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (43 : Fin 78) (9 : Fin 78) (5 : Fin 78)
    (47 : Fin 78) (3 : Fin 78) (60 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0875` (kalmanson). -/
theorem directSource_h0875 :
    ((!((rankAtom (directSourceRanks P) 5 == rankAtom (directSourceRanks P) 9)) || ((rankAtom (directSourceRanks P) 43).ult (rankAtom (directSourceRanks P) 47)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (47 : Fin 78) (5 : Fin 78)
    (43 : Fin 78) (9 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (6 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (43 : Fin 78) (9 : Fin 78) (5 : Fin 78)
    (47 : Fin 78) (3 : Fin 78) (60 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0876` (kalmanson). -/
theorem directSource_h0876 :
    ((!((rankAtom (directSourceRanks P) 5 == rankAtom (directSourceRanks P) 43)) || ((rankAtom (directSourceRanks P) 9).ult (rankAtom (directSourceRanks P) 47)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (47 : Fin 78) (5 : Fin 78)
    (9 : Fin 78) (43 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (6 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (43 : Fin 78) (9 : Fin 78) (5 : Fin 78)
    (47 : Fin 78) (3 : Fin 78) (60 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0877` (kalmanson). -/
theorem directSource_h0877 :
    ((!((rankAtom (directSourceRanks P) 47 == rankAtom (directSourceRanks P) 43)) || ((rankAtom (directSourceRanks P) 9).ult (rankAtom (directSourceRanks P) 5)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (5 : Fin 78) (47 : Fin 78)
    (9 : Fin 78) (43 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (6 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (43 : Fin 78) (9 : Fin 78) (5 : Fin 78)
    (47 : Fin 78) (3 : Fin 78) (60 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0878` (kalmanson). -/
theorem directSource_h0878 :
    ((!((rankAtom (directSourceRanks P) 5 == rankAtom (directSourceRanks P) 3)) || ((rankAtom (directSourceRanks P) 61).ult (rankAtom (directSourceRanks P) 48)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (48 : Fin 78) (5 : Fin 78)
    (61 : Fin 78) (3 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (6 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (43 : Fin 78) (10 : Fin 78) (5 : Fin 78)
    (48 : Fin 78) (3 : Fin 78) (61 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0879` (kalmanson). -/
theorem directSource_h0879 :
    ((!((rankAtom (directSourceRanks P) 5 == rankAtom (directSourceRanks P) 61)) || ((rankAtom (directSourceRanks P) 3).ult (rankAtom (directSourceRanks P) 48)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (48 : Fin 78) (5 : Fin 78)
    (3 : Fin 78) (61 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (6 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (43 : Fin 78) (10 : Fin 78) (5 : Fin 78)
    (48 : Fin 78) (3 : Fin 78) (61 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0880` (kalmanson). -/
theorem directSource_h0880 :
    ((!((rankAtom (directSourceRanks P) 48 == rankAtom (directSourceRanks P) 3)) || ((rankAtom (directSourceRanks P) 61).ult (rankAtom (directSourceRanks P) 5)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (5 : Fin 78) (48 : Fin 78)
    (61 : Fin 78) (3 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (6 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (43 : Fin 78) (10 : Fin 78) (5 : Fin 78)
    (48 : Fin 78) (3 : Fin 78) (61 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0881` (kalmanson). -/
theorem directSource_h0881 :
    ((!((rankAtom (directSourceRanks P) 5 == rankAtom (directSourceRanks P) 10)) || ((rankAtom (directSourceRanks P) 43).ult (rankAtom (directSourceRanks P) 48)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (48 : Fin 78) (5 : Fin 78)
    (43 : Fin 78) (10 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (6 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (43 : Fin 78) (10 : Fin 78) (5 : Fin 78)
    (48 : Fin 78) (3 : Fin 78) (61 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0882` (kalmanson). -/
theorem directSource_h0882 :
    ((!((rankAtom (directSourceRanks P) 48 == rankAtom (directSourceRanks P) 43)) || ((rankAtom (directSourceRanks P) 10).ult (rankAtom (directSourceRanks P) 5)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (5 : Fin 78) (48 : Fin 78)
    (10 : Fin 78) (43 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (6 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (43 : Fin 78) (10 : Fin 78) (5 : Fin 78)
    (48 : Fin 78) (3 : Fin 78) (61 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0883` (kalmanson). -/
theorem directSource_h0883 :
    ((!((rankAtom (directSourceRanks P) 5 == rankAtom (directSourceRanks P) 3)) || ((rankAtom (directSourceRanks P) 62).ult (rankAtom (directSourceRanks P) 49)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (49 : Fin 78) (5 : Fin 78)
    (62 : Fin 78) (3 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (6 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (43 : Fin 78) (11 : Fin 78) (5 : Fin 78)
    (49 : Fin 78) (3 : Fin 78) (62 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0884` (kalmanson). -/
theorem directSource_h0884 :
    ((!((rankAtom (directSourceRanks P) 5 == rankAtom (directSourceRanks P) 62)) || ((rankAtom (directSourceRanks P) 3).ult (rankAtom (directSourceRanks P) 49)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (49 : Fin 78) (5 : Fin 78)
    (3 : Fin 78) (62 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (6 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (43 : Fin 78) (11 : Fin 78) (5 : Fin 78)
    (49 : Fin 78) (3 : Fin 78) (62 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0885` (kalmanson). -/
theorem directSource_h0885 :
    ((!((rankAtom (directSourceRanks P) 49 == rankAtom (directSourceRanks P) 3)) || ((rankAtom (directSourceRanks P) 62).ult (rankAtom (directSourceRanks P) 5)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (5 : Fin 78) (49 : Fin 78)
    (62 : Fin 78) (3 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (6 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (43 : Fin 78) (11 : Fin 78) (5 : Fin 78)
    (49 : Fin 78) (3 : Fin 78) (62 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0886` (kalmanson). -/
theorem directSource_h0886 :
    ((!((rankAtom (directSourceRanks P) 5 == rankAtom (directSourceRanks P) 11)) || ((rankAtom (directSourceRanks P) 43).ult (rankAtom (directSourceRanks P) 49)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (49 : Fin 78) (5 : Fin 78)
    (43 : Fin 78) (11 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (6 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (43 : Fin 78) (11 : Fin 78) (5 : Fin 78)
    (49 : Fin 78) (3 : Fin 78) (62 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0887` (kalmanson). -/
theorem directSource_h0887 :
    ((!((rankAtom (directSourceRanks P) 49 == rankAtom (directSourceRanks P) 43)) || ((rankAtom (directSourceRanks P) 11).ult (rankAtom (directSourceRanks P) 5)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (5 : Fin 78) (49 : Fin 78)
    (11 : Fin 78) (43 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (6 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (43 : Fin 78) (11 : Fin 78) (5 : Fin 78)
    (49 : Fin 78) (3 : Fin 78) (62 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0888` (kalmanson). -/
theorem directSource_h0888 :
    ((!((rankAtom (directSourceRanks P) 6 == rankAtom (directSourceRanks P) 3)) || ((rankAtom (directSourceRanks P) 63).ult (rankAtom (directSourceRanks P) 45)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (45 : Fin 78) (6 : Fin 78)
    (63 : Fin 78) (3 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (7 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (44 : Fin 78) (7 : Fin 78) (6 : Fin 78)
    (45 : Fin 78) (3 : Fin 78) (63 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0889` (kalmanson). -/
theorem directSource_h0889 :
    ((!((rankAtom (directSourceRanks P) 6 == rankAtom (directSourceRanks P) 7)) || ((rankAtom (directSourceRanks P) 44).ult (rankAtom (directSourceRanks P) 45)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (45 : Fin 78) (6 : Fin 78)
    (44 : Fin 78) (7 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (7 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (44 : Fin 78) (7 : Fin 78) (6 : Fin 78)
    (45 : Fin 78) (3 : Fin 78) (63 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0890` (kalmanson). -/
theorem directSource_h0890 :
    ((!((rankAtom (directSourceRanks P) 45 == rankAtom (directSourceRanks P) 7)) || ((rankAtom (directSourceRanks P) 44).ult (rankAtom (directSourceRanks P) 6)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (6 : Fin 78) (45 : Fin 78)
    (44 : Fin 78) (7 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (7 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (44 : Fin 78) (7 : Fin 78) (6 : Fin 78)
    (45 : Fin 78) (3 : Fin 78) (63 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0891` (kalmanson). -/
theorem directSource_h0891 :
    ((!((rankAtom (directSourceRanks P) 6 == rankAtom (directSourceRanks P) 3)) || ((rankAtom (directSourceRanks P) 64).ult (rankAtom (directSourceRanks P) 46)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (46 : Fin 78) (6 : Fin 78)
    (64 : Fin 78) (3 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (7 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (44 : Fin 78) (8 : Fin 78) (6 : Fin 78)
    (46 : Fin 78) (3 : Fin 78) (64 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0892` (kalmanson). -/
theorem directSource_h0892 :
    ((!((rankAtom (directSourceRanks P) 46 == rankAtom (directSourceRanks P) 3)) || ((rankAtom (directSourceRanks P) 64).ult (rankAtom (directSourceRanks P) 6)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (6 : Fin 78) (46 : Fin 78)
    (64 : Fin 78) (3 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (7 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (44 : Fin 78) (8 : Fin 78) (6 : Fin 78)
    (46 : Fin 78) (3 : Fin 78) (64 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0893` (kalmanson). -/
theorem directSource_h0893 :
    ((!((rankAtom (directSourceRanks P) 6 == rankAtom (directSourceRanks P) 8)) || ((rankAtom (directSourceRanks P) 44).ult (rankAtom (directSourceRanks P) 46)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (46 : Fin 78) (6 : Fin 78)
    (44 : Fin 78) (8 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (7 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (44 : Fin 78) (8 : Fin 78) (6 : Fin 78)
    (46 : Fin 78) (3 : Fin 78) (64 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0894` (kalmanson). -/
theorem directSource_h0894 :
    ((!((rankAtom (directSourceRanks P) 46 == rankAtom (directSourceRanks P) 44)) || ((rankAtom (directSourceRanks P) 8).ult (rankAtom (directSourceRanks P) 6)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (6 : Fin 78) (46 : Fin 78)
    (8 : Fin 78) (44 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (7 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (44 : Fin 78) (8 : Fin 78) (6 : Fin 78)
    (46 : Fin 78) (3 : Fin 78) (64 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0895` (kalmanson). -/
theorem directSource_h0895 :
    ((!((rankAtom (directSourceRanks P) 47 == rankAtom (directSourceRanks P) 3)) || ((rankAtom (directSourceRanks P) 65).ult (rankAtom (directSourceRanks P) 6)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (6 : Fin 78) (47 : Fin 78)
    (65 : Fin 78) (3 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (7 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (44 : Fin 78) (9 : Fin 78) (6 : Fin 78)
    (47 : Fin 78) (3 : Fin 78) (65 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

end

end ATailExactFiveCard13CnfIngressScratch
end Problem97
