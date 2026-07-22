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

/-- Exact pass-5 source assertion `h0896` (kalmanson). -/
theorem directSource_h0896 :
    ((!((rankAtom (directSourceRanks P) 6 == rankAtom (directSourceRanks P) 9)) || ((rankAtom (directSourceRanks P) 44).ult (rankAtom (directSourceRanks P) 47)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (47 : Fin 78) (6 : Fin 78)
    (44 : Fin 78) (9 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (7 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (44 : Fin 78) (9 : Fin 78) (6 : Fin 78)
    (47 : Fin 78) (3 : Fin 78) (65 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0897` (kalmanson). -/
theorem directSource_h0897 :
    ((!((rankAtom (directSourceRanks P) 47 == rankAtom (directSourceRanks P) 44)) || ((rankAtom (directSourceRanks P) 9).ult (rankAtom (directSourceRanks P) 6)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (6 : Fin 78) (47 : Fin 78)
    (9 : Fin 78) (44 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (7 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (44 : Fin 78) (9 : Fin 78) (6 : Fin 78)
    (47 : Fin 78) (3 : Fin 78) (65 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0898` (kalmanson). -/
theorem directSource_h0898 :
    ((!((rankAtom (directSourceRanks P) 6 == rankAtom (directSourceRanks P) 3)) || ((rankAtom (directSourceRanks P) 66).ult (rankAtom (directSourceRanks P) 48)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (48 : Fin 78) (6 : Fin 78)
    (66 : Fin 78) (3 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (7 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (44 : Fin 78) (10 : Fin 78) (6 : Fin 78)
    (48 : Fin 78) (3 : Fin 78) (66 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0899` (kalmanson). -/
theorem directSource_h0899 :
    ((!((rankAtom (directSourceRanks P) 48 == rankAtom (directSourceRanks P) 3)) || ((rankAtom (directSourceRanks P) 66).ult (rankAtom (directSourceRanks P) 6)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (6 : Fin 78) (48 : Fin 78)
    (66 : Fin 78) (3 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (7 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (44 : Fin 78) (10 : Fin 78) (6 : Fin 78)
    (48 : Fin 78) (3 : Fin 78) (66 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0900` (kalmanson). -/
theorem directSource_h0900 :
    ((!((rankAtom (directSourceRanks P) 6 == rankAtom (directSourceRanks P) 10)) || ((rankAtom (directSourceRanks P) 44).ult (rankAtom (directSourceRanks P) 48)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (48 : Fin 78) (6 : Fin 78)
    (44 : Fin 78) (10 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (7 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (44 : Fin 78) (10 : Fin 78) (6 : Fin 78)
    (48 : Fin 78) (3 : Fin 78) (66 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0901` (kalmanson). -/
theorem directSource_h0901 :
    ((!((rankAtom (directSourceRanks P) 6 == rankAtom (directSourceRanks P) 3)) || ((rankAtom (directSourceRanks P) 67).ult (rankAtom (directSourceRanks P) 49)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (49 : Fin 78) (6 : Fin 78)
    (67 : Fin 78) (3 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (7 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (44 : Fin 78) (11 : Fin 78) (6 : Fin 78)
    (49 : Fin 78) (3 : Fin 78) (67 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0902` (kalmanson). -/
theorem directSource_h0902 :
    ((!((rankAtom (directSourceRanks P) 49 == rankAtom (directSourceRanks P) 3)) || ((rankAtom (directSourceRanks P) 67).ult (rankAtom (directSourceRanks P) 6)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (6 : Fin 78) (49 : Fin 78)
    (67 : Fin 78) (3 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (7 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (44 : Fin 78) (11 : Fin 78) (6 : Fin 78)
    (49 : Fin 78) (3 : Fin 78) (67 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0903` (kalmanson). -/
theorem directSource_h0903 :
    ((!((rankAtom (directSourceRanks P) 6 == rankAtom (directSourceRanks P) 11)) || ((rankAtom (directSourceRanks P) 44).ult (rankAtom (directSourceRanks P) 49)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (49 : Fin 78) (6 : Fin 78)
    (44 : Fin 78) (11 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (7 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (44 : Fin 78) (11 : Fin 78) (6 : Fin 78)
    (49 : Fin 78) (3 : Fin 78) (67 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0904` (kalmanson). -/
theorem directSource_h0904 :
    ((!((rankAtom (directSourceRanks P) 46 == rankAtom (directSourceRanks P) 3)) || ((rankAtom (directSourceRanks P) 68).ult (rankAtom (directSourceRanks P) 7)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (7 : Fin 78) (46 : Fin 78)
    (68 : Fin 78) (3 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (8 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (45 : Fin 78) (8 : Fin 78) (7 : Fin 78)
    (46 : Fin 78) (3 : Fin 78) (68 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0905` (kalmanson). -/
theorem directSource_h0905 :
    ((!((rankAtom (directSourceRanks P) 46 == rankAtom (directSourceRanks P) 8)) || ((rankAtom (directSourceRanks P) 45).ult (rankAtom (directSourceRanks P) 7)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (7 : Fin 78) (46 : Fin 78)
    (45 : Fin 78) (8 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (8 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (45 : Fin 78) (8 : Fin 78) (7 : Fin 78)
    (46 : Fin 78) (3 : Fin 78) (68 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0906` (kalmanson). -/
theorem directSource_h0906 :
    ((!((rankAtom (directSourceRanks P) 46 == rankAtom (directSourceRanks P) 45)) || ((rankAtom (directSourceRanks P) 8).ult (rankAtom (directSourceRanks P) 7)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (7 : Fin 78) (46 : Fin 78)
    (8 : Fin 78) (45 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (8 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (45 : Fin 78) (8 : Fin 78) (7 : Fin 78)
    (46 : Fin 78) (3 : Fin 78) (68 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0907` (kalmanson). -/
theorem directSource_h0907 :
    ((!((rankAtom (directSourceRanks P) 47 == rankAtom (directSourceRanks P) 3)) || ((rankAtom (directSourceRanks P) 69).ult (rankAtom (directSourceRanks P) 7)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (7 : Fin 78) (47 : Fin 78)
    (69 : Fin 78) (3 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (8 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (45 : Fin 78) (9 : Fin 78) (7 : Fin 78)
    (47 : Fin 78) (3 : Fin 78) (69 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0908` (kalmanson). -/
theorem directSource_h0908 :
    ((!((rankAtom (directSourceRanks P) 47 == rankAtom (directSourceRanks P) 9)) || ((rankAtom (directSourceRanks P) 45).ult (rankAtom (directSourceRanks P) 7)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (7 : Fin 78) (47 : Fin 78)
    (45 : Fin 78) (9 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (8 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (45 : Fin 78) (9 : Fin 78) (7 : Fin 78)
    (47 : Fin 78) (3 : Fin 78) (69 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0909` (kalmanson). -/
theorem directSource_h0909 :
    ((!((rankAtom (directSourceRanks P) 47 == rankAtom (directSourceRanks P) 45)) || ((rankAtom (directSourceRanks P) 9).ult (rankAtom (directSourceRanks P) 7)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (7 : Fin 78) (47 : Fin 78)
    (9 : Fin 78) (45 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (8 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (45 : Fin 78) (9 : Fin 78) (7 : Fin 78)
    (47 : Fin 78) (3 : Fin 78) (69 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0910` (kalmanson). -/
theorem directSource_h0910 :
    ((!((rankAtom (directSourceRanks P) 48 == rankAtom (directSourceRanks P) 3)) || ((rankAtom (directSourceRanks P) 70).ult (rankAtom (directSourceRanks P) 7)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (7 : Fin 78) (48 : Fin 78)
    (70 : Fin 78) (3 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (8 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (45 : Fin 78) (10 : Fin 78) (7 : Fin 78)
    (48 : Fin 78) (3 : Fin 78) (70 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0911` (kalmanson). -/
theorem directSource_h0911 :
    ((!((rankAtom (directSourceRanks P) 48 == rankAtom (directSourceRanks P) 10)) || ((rankAtom (directSourceRanks P) 45).ult (rankAtom (directSourceRanks P) 7)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (7 : Fin 78) (48 : Fin 78)
    (45 : Fin 78) (10 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (8 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (45 : Fin 78) (10 : Fin 78) (7 : Fin 78)
    (48 : Fin 78) (3 : Fin 78) (70 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0912` (kalmanson). -/
theorem directSource_h0912 :
    ((!((rankAtom (directSourceRanks P) 49 == rankAtom (directSourceRanks P) 3)) || ((rankAtom (directSourceRanks P) 71).ult (rankAtom (directSourceRanks P) 7)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (7 : Fin 78) (49 : Fin 78)
    (71 : Fin 78) (3 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (8 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (45 : Fin 78) (11 : Fin 78) (7 : Fin 78)
    (49 : Fin 78) (3 : Fin 78) (71 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0913` (kalmanson). -/
theorem directSource_h0913 :
    ((!((rankAtom (directSourceRanks P) 49 == rankAtom (directSourceRanks P) 45)) || ((rankAtom (directSourceRanks P) 11).ult (rankAtom (directSourceRanks P) 7)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (7 : Fin 78) (49 : Fin 78)
    (11 : Fin 78) (45 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (8 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (45 : Fin 78) (11 : Fin 78) (7 : Fin 78)
    (49 : Fin 78) (3 : Fin 78) (71 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0914` (kalmanson). -/
theorem directSource_h0914 :
    ((!((rankAtom (directSourceRanks P) 47 == rankAtom (directSourceRanks P) 46)) || ((rankAtom (directSourceRanks P) 9).ult (rankAtom (directSourceRanks P) 8)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (8 : Fin 78) (47 : Fin 78)
    (9 : Fin 78) (46 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (9 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (46 : Fin 78) (9 : Fin 78) (8 : Fin 78)
    (47 : Fin 78) (3 : Fin 78) (72 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0915` (kalmanson). -/
theorem directSource_h0915 :
    ((!((rankAtom (directSourceRanks P) 48 == rankAtom (directSourceRanks P) 46)) || ((rankAtom (directSourceRanks P) 10).ult (rankAtom (directSourceRanks P) 8)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (8 : Fin 78) (48 : Fin 78)
    (10 : Fin 78) (46 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (9 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (46 : Fin 78) (10 : Fin 78) (8 : Fin 78)
    (48 : Fin 78) (3 : Fin 78) (73 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0916` (kalmanson). -/
theorem directSource_h0916 :
    ((!((rankAtom (directSourceRanks P) 49 == rankAtom (directSourceRanks P) 46)) || ((rankAtom (directSourceRanks P) 11).ult (rankAtom (directSourceRanks P) 8)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (8 : Fin 78) (49 : Fin 78)
    (11 : Fin 78) (46 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (9 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (46 : Fin 78) (11 : Fin 78) (8 : Fin 78)
    (49 : Fin 78) (3 : Fin 78) (74 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0917` (kalmanson). -/
theorem directSource_h0917 :
    ((!((rankAtom (directSourceRanks P) 48 == rankAtom (directSourceRanks P) 10)) || ((rankAtom (directSourceRanks P) 47).ult (rankAtom (directSourceRanks P) 9)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (9 : Fin 78) (48 : Fin 78)
    (47 : Fin 78) (10 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (10 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (47 : Fin 78) (10 : Fin 78) (9 : Fin 78)
    (48 : Fin 78) (3 : Fin 78) (75 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0918` (kalmanson). -/
theorem directSource_h0918 :
    ((!((rankAtom (directSourceRanks P) 48 == rankAtom (directSourceRanks P) 47)) || ((rankAtom (directSourceRanks P) 10).ult (rankAtom (directSourceRanks P) 9)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (9 : Fin 78) (48 : Fin 78)
    (10 : Fin 78) (47 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (10 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (47 : Fin 78) (10 : Fin 78) (9 : Fin 78)
    (48 : Fin 78) (3 : Fin 78) (75 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0919` (kalmanson). -/
theorem directSource_h0919 :
    ((!((rankAtom (directSourceRanks P) 49 == rankAtom (directSourceRanks P) 47)) || ((rankAtom (directSourceRanks P) 11).ult (rankAtom (directSourceRanks P) 9)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (9 : Fin 78) (49 : Fin 78)
    (11 : Fin 78) (47 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (10 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (47 : Fin 78) (11 : Fin 78) (9 : Fin 78)
    (49 : Fin 78) (3 : Fin 78) (76 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0920` (kalmanson). -/
theorem directSource_h0920 :
    ((!((rankAtom (directSourceRanks P) 49 == rankAtom (directSourceRanks P) 48)) || ((rankAtom (directSourceRanks P) 11).ult (rankAtom (directSourceRanks P) 10)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (10 : Fin 78) (49 : Fin 78)
    (11 : Fin 78) (48 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (11 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (48 : Fin 78) (11 : Fin 78) (10 : Fin 78)
    (49 : Fin 78) (3 : Fin 78) (77 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0921` (kalmanson). -/
theorem directSource_h0921 :
    ((!((rankAtom (directSourceRanks P) 5 == rankAtom (directSourceRanks P) 4)) || ((rankAtom (directSourceRanks P) 57).ult (rankAtom (directSourceRanks P) 51)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (51 : Fin 78) (5 : Fin 78)
    (57 : Fin 78) (4 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (5 : Fin 13) (6 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (6 : Fin 78) (5 : Fin 78)
    (51 : Fin 78) (4 : Fin 78) (57 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0922` (kalmanson). -/
theorem directSource_h0922 :
    ((!((rankAtom (directSourceRanks P) 5 == rankAtom (directSourceRanks P) 57)) || ((rankAtom (directSourceRanks P) 4).ult (rankAtom (directSourceRanks P) 51)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (51 : Fin 78) (5 : Fin 78)
    (4 : Fin 78) (57 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (5 : Fin 13) (6 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (6 : Fin 78) (5 : Fin 78)
    (51 : Fin 78) (4 : Fin 78) (57 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0923` (kalmanson). -/
theorem directSource_h0923 :
    ((!((rankAtom (directSourceRanks P) 5 == rankAtom (directSourceRanks P) 6)) || ((rankAtom (directSourceRanks P) 50).ult (rankAtom (directSourceRanks P) 51)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (51 : Fin 78) (5 : Fin 78)
    (50 : Fin 78) (6 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (5 : Fin 13) (6 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (6 : Fin 78) (5 : Fin 78)
    (51 : Fin 78) (4 : Fin 78) (57 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0924` (kalmanson). -/
theorem directSource_h0924 :
    ((!((rankAtom (directSourceRanks P) 5 == rankAtom (directSourceRanks P) 50)) || ((rankAtom (directSourceRanks P) 6).ult (rankAtom (directSourceRanks P) 51)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (51 : Fin 78) (5 : Fin 78)
    (6 : Fin 78) (50 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (5 : Fin 13) (6 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (6 : Fin 78) (5 : Fin 78)
    (51 : Fin 78) (4 : Fin 78) (57 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0925` (kalmanson). -/
theorem directSource_h0925 :
    ((!((rankAtom (directSourceRanks P) 51 == rankAtom (directSourceRanks P) 6)) || ((rankAtom (directSourceRanks P) 50).ult (rankAtom (directSourceRanks P) 5)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (5 : Fin 78) (51 : Fin 78)
    (50 : Fin 78) (6 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (5 : Fin 13) (6 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (6 : Fin 78) (5 : Fin 78)
    (51 : Fin 78) (4 : Fin 78) (57 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0926` (kalmanson). -/
theorem directSource_h0926 :
    ((!((rankAtom (directSourceRanks P) 51 == rankAtom (directSourceRanks P) 50)) || ((rankAtom (directSourceRanks P) 6).ult (rankAtom (directSourceRanks P) 5)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (5 : Fin 78) (51 : Fin 78)
    (6 : Fin 78) (50 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (5 : Fin 13) (6 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (6 : Fin 78) (5 : Fin 78)
    (51 : Fin 78) (4 : Fin 78) (57 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0927` (kalmanson). -/
theorem directSource_h0927 :
    ((!((rankAtom (directSourceRanks P) 5 == rankAtom (directSourceRanks P) 4)) || ((rankAtom (directSourceRanks P) 58).ult (rankAtom (directSourceRanks P) 52)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (52 : Fin 78) (5 : Fin 78)
    (58 : Fin 78) (4 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (5 : Fin 13) (6 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (7 : Fin 78) (5 : Fin 78)
    (52 : Fin 78) (4 : Fin 78) (58 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0928` (kalmanson). -/
theorem directSource_h0928 :
    ((!((rankAtom (directSourceRanks P) 5 == rankAtom (directSourceRanks P) 58)) || ((rankAtom (directSourceRanks P) 4).ult (rankAtom (directSourceRanks P) 52)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (52 : Fin 78) (5 : Fin 78)
    (4 : Fin 78) (58 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (5 : Fin 13) (6 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (7 : Fin 78) (5 : Fin 78)
    (52 : Fin 78) (4 : Fin 78) (58 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0929` (kalmanson). -/
theorem directSource_h0929 :
    ((!((rankAtom (directSourceRanks P) 5 == rankAtom (directSourceRanks P) 7)) || ((rankAtom (directSourceRanks P) 50).ult (rankAtom (directSourceRanks P) 52)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (52 : Fin 78) (5 : Fin 78)
    (50 : Fin 78) (7 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (5 : Fin 13) (6 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (7 : Fin 78) (5 : Fin 78)
    (52 : Fin 78) (4 : Fin 78) (58 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0930` (kalmanson). -/
theorem directSource_h0930 :
    ((!((rankAtom (directSourceRanks P) 5 == rankAtom (directSourceRanks P) 50)) || ((rankAtom (directSourceRanks P) 7).ult (rankAtom (directSourceRanks P) 52)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (52 : Fin 78) (5 : Fin 78)
    (7 : Fin 78) (50 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (5 : Fin 13) (6 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (7 : Fin 78) (5 : Fin 78)
    (52 : Fin 78) (4 : Fin 78) (58 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0931` (kalmanson). -/
theorem directSource_h0931 :
    ((!((rankAtom (directSourceRanks P) 52 == rankAtom (directSourceRanks P) 7)) || ((rankAtom (directSourceRanks P) 50).ult (rankAtom (directSourceRanks P) 5)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (5 : Fin 78) (52 : Fin 78)
    (50 : Fin 78) (7 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (5 : Fin 13) (6 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (7 : Fin 78) (5 : Fin 78)
    (52 : Fin 78) (4 : Fin 78) (58 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0932` (kalmanson). -/
theorem directSource_h0932 :
    ((!((rankAtom (directSourceRanks P) 52 == rankAtom (directSourceRanks P) 50)) || ((rankAtom (directSourceRanks P) 7).ult (rankAtom (directSourceRanks P) 5)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (5 : Fin 78) (52 : Fin 78)
    (7 : Fin 78) (50 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (5 : Fin 13) (6 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (7 : Fin 78) (5 : Fin 78)
    (52 : Fin 78) (4 : Fin 78) (58 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0933` (kalmanson). -/
theorem directSource_h0933 :
    ((!((rankAtom (directSourceRanks P) 5 == rankAtom (directSourceRanks P) 4)) || ((rankAtom (directSourceRanks P) 59).ult (rankAtom (directSourceRanks P) 53)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (53 : Fin 78) (5 : Fin 78)
    (59 : Fin 78) (4 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (5 : Fin 13) (6 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (8 : Fin 78) (5 : Fin 78)
    (53 : Fin 78) (4 : Fin 78) (59 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0934` (kalmanson). -/
theorem directSource_h0934 :
    ((!((rankAtom (directSourceRanks P) 5 == rankAtom (directSourceRanks P) 59)) || ((rankAtom (directSourceRanks P) 4).ult (rankAtom (directSourceRanks P) 53)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (53 : Fin 78) (5 : Fin 78)
    (4 : Fin 78) (59 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (5 : Fin 13) (6 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (8 : Fin 78) (5 : Fin 78)
    (53 : Fin 78) (4 : Fin 78) (59 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0935` (kalmanson). -/
theorem directSource_h0935 :
    ((!((rankAtom (directSourceRanks P) 5 == rankAtom (directSourceRanks P) 8)) || ((rankAtom (directSourceRanks P) 50).ult (rankAtom (directSourceRanks P) 53)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (53 : Fin 78) (5 : Fin 78)
    (50 : Fin 78) (8 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (5 : Fin 13) (6 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (8 : Fin 78) (5 : Fin 78)
    (53 : Fin 78) (4 : Fin 78) (59 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0936` (kalmanson). -/
theorem directSource_h0936 :
    ((!((rankAtom (directSourceRanks P) 5 == rankAtom (directSourceRanks P) 50)) || ((rankAtom (directSourceRanks P) 8).ult (rankAtom (directSourceRanks P) 53)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (53 : Fin 78) (5 : Fin 78)
    (8 : Fin 78) (50 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (5 : Fin 13) (6 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (8 : Fin 78) (5 : Fin 78)
    (53 : Fin 78) (4 : Fin 78) (59 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0937` (kalmanson). -/
theorem directSource_h0937 :
    ((!((rankAtom (directSourceRanks P) 5 == rankAtom (directSourceRanks P) 4)) || ((rankAtom (directSourceRanks P) 60).ult (rankAtom (directSourceRanks P) 54)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (54 : Fin 78) (5 : Fin 78)
    (60 : Fin 78) (4 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (5 : Fin 13) (6 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (9 : Fin 78) (5 : Fin 78)
    (54 : Fin 78) (4 : Fin 78) (60 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0938` (kalmanson). -/
theorem directSource_h0938 :
    ((!((rankAtom (directSourceRanks P) 5 == rankAtom (directSourceRanks P) 60)) || ((rankAtom (directSourceRanks P) 4).ult (rankAtom (directSourceRanks P) 54)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (54 : Fin 78) (5 : Fin 78)
    (4 : Fin 78) (60 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (5 : Fin 13) (6 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (9 : Fin 78) (5 : Fin 78)
    (54 : Fin 78) (4 : Fin 78) (60 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0939` (kalmanson). -/
theorem directSource_h0939 :
    ((!((rankAtom (directSourceRanks P) 54 == rankAtom (directSourceRanks P) 4)) || ((rankAtom (directSourceRanks P) 60).ult (rankAtom (directSourceRanks P) 5)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (5 : Fin 78) (54 : Fin 78)
    (60 : Fin 78) (4 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (5 : Fin 13) (6 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (9 : Fin 78) (5 : Fin 78)
    (54 : Fin 78) (4 : Fin 78) (60 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0940` (kalmanson). -/
theorem directSource_h0940 :
    ((!((rankAtom (directSourceRanks P) 5 == rankAtom (directSourceRanks P) 9)) || ((rankAtom (directSourceRanks P) 50).ult (rankAtom (directSourceRanks P) 54)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (54 : Fin 78) (5 : Fin 78)
    (50 : Fin 78) (9 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (5 : Fin 13) (6 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (9 : Fin 78) (5 : Fin 78)
    (54 : Fin 78) (4 : Fin 78) (60 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0941` (kalmanson). -/
theorem directSource_h0941 :
    ((!((rankAtom (directSourceRanks P) 5 == rankAtom (directSourceRanks P) 50)) || ((rankAtom (directSourceRanks P) 9).ult (rankAtom (directSourceRanks P) 54)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (54 : Fin 78) (5 : Fin 78)
    (9 : Fin 78) (50 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (5 : Fin 13) (6 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (9 : Fin 78) (5 : Fin 78)
    (54 : Fin 78) (4 : Fin 78) (60 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0942` (kalmanson). -/
theorem directSource_h0942 :
    ((!((rankAtom (directSourceRanks P) 5 == rankAtom (directSourceRanks P) 4)) || ((rankAtom (directSourceRanks P) 61).ult (rankAtom (directSourceRanks P) 55)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (55 : Fin 78) (5 : Fin 78)
    (61 : Fin 78) (4 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (5 : Fin 13) (6 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (10 : Fin 78) (5 : Fin 78)
    (55 : Fin 78) (4 : Fin 78) (61 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0943` (kalmanson). -/
theorem directSource_h0943 :
    ((!((rankAtom (directSourceRanks P) 5 == rankAtom (directSourceRanks P) 61)) || ((rankAtom (directSourceRanks P) 4).ult (rankAtom (directSourceRanks P) 55)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (55 : Fin 78) (5 : Fin 78)
    (4 : Fin 78) (61 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (5 : Fin 13) (6 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (10 : Fin 78) (5 : Fin 78)
    (55 : Fin 78) (4 : Fin 78) (61 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0944` (kalmanson). -/
theorem directSource_h0944 :
    ((!((rankAtom (directSourceRanks P) 55 == rankAtom (directSourceRanks P) 4)) || ((rankAtom (directSourceRanks P) 61).ult (rankAtom (directSourceRanks P) 5)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (5 : Fin 78) (55 : Fin 78)
    (61 : Fin 78) (4 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (5 : Fin 13) (6 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (10 : Fin 78) (5 : Fin 78)
    (55 : Fin 78) (4 : Fin 78) (61 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0945` (kalmanson). -/
theorem directSource_h0945 :
    ((!((rankAtom (directSourceRanks P) 5 == rankAtom (directSourceRanks P) 10)) || ((rankAtom (directSourceRanks P) 50).ult (rankAtom (directSourceRanks P) 55)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (55 : Fin 78) (5 : Fin 78)
    (50 : Fin 78) (10 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (5 : Fin 13) (6 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (10 : Fin 78) (5 : Fin 78)
    (55 : Fin 78) (4 : Fin 78) (61 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0946` (kalmanson). -/
theorem directSource_h0946 :
    ((!((rankAtom (directSourceRanks P) 5 == rankAtom (directSourceRanks P) 50)) || ((rankAtom (directSourceRanks P) 10).ult (rankAtom (directSourceRanks P) 55)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (55 : Fin 78) (5 : Fin 78)
    (10 : Fin 78) (50 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (5 : Fin 13) (6 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (10 : Fin 78) (5 : Fin 78)
    (55 : Fin 78) (4 : Fin 78) (61 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0947` (kalmanson). -/
theorem directSource_h0947 :
    ((!((rankAtom (directSourceRanks P) 5 == rankAtom (directSourceRanks P) 4)) || ((rankAtom (directSourceRanks P) 62).ult (rankAtom (directSourceRanks P) 56)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (56 : Fin 78) (5 : Fin 78)
    (62 : Fin 78) (4 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (5 : Fin 13) (6 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (11 : Fin 78) (5 : Fin 78)
    (56 : Fin 78) (4 : Fin 78) (62 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0948` (kalmanson). -/
theorem directSource_h0948 :
    ((!((rankAtom (directSourceRanks P) 5 == rankAtom (directSourceRanks P) 62)) || ((rankAtom (directSourceRanks P) 4).ult (rankAtom (directSourceRanks P) 56)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (56 : Fin 78) (5 : Fin 78)
    (4 : Fin 78) (62 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (5 : Fin 13) (6 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (11 : Fin 78) (5 : Fin 78)
    (56 : Fin 78) (4 : Fin 78) (62 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0949` (kalmanson). -/
theorem directSource_h0949 :
    ((!((rankAtom (directSourceRanks P) 56 == rankAtom (directSourceRanks P) 4)) || ((rankAtom (directSourceRanks P) 62).ult (rankAtom (directSourceRanks P) 5)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (5 : Fin 78) (56 : Fin 78)
    (62 : Fin 78) (4 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (5 : Fin 13) (6 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (11 : Fin 78) (5 : Fin 78)
    (56 : Fin 78) (4 : Fin 78) (62 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0950` (kalmanson). -/
theorem directSource_h0950 :
    ((!((rankAtom (directSourceRanks P) 5 == rankAtom (directSourceRanks P) 11)) || ((rankAtom (directSourceRanks P) 50).ult (rankAtom (directSourceRanks P) 56)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (56 : Fin 78) (5 : Fin 78)
    (50 : Fin 78) (11 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (5 : Fin 13) (6 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (11 : Fin 78) (5 : Fin 78)
    (56 : Fin 78) (4 : Fin 78) (62 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0951` (kalmanson). -/
theorem directSource_h0951 :
    ((!((rankAtom (directSourceRanks P) 6 == rankAtom (directSourceRanks P) 4)) || ((rankAtom (directSourceRanks P) 63).ult (rankAtom (directSourceRanks P) 52)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (52 : Fin 78) (6 : Fin 78)
    (63 : Fin 78) (4 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (5 : Fin 13) (7 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (51 : Fin 78) (7 : Fin 78) (6 : Fin 78)
    (52 : Fin 78) (4 : Fin 78) (63 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0952` (kalmanson). -/
theorem directSource_h0952 :
    ((!((rankAtom (directSourceRanks P) 6 == rankAtom (directSourceRanks P) 63)) || ((rankAtom (directSourceRanks P) 4).ult (rankAtom (directSourceRanks P) 52)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (52 : Fin 78) (6 : Fin 78)
    (4 : Fin 78) (63 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (5 : Fin 13) (7 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (51 : Fin 78) (7 : Fin 78) (6 : Fin 78)
    (52 : Fin 78) (4 : Fin 78) (63 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0953` (kalmanson). -/
theorem directSource_h0953 :
    ((!((rankAtom (directSourceRanks P) 52 == rankAtom (directSourceRanks P) 4)) || ((rankAtom (directSourceRanks P) 63).ult (rankAtom (directSourceRanks P) 6)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (6 : Fin 78) (52 : Fin 78)
    (63 : Fin 78) (4 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (5 : Fin 13) (7 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (51 : Fin 78) (7 : Fin 78) (6 : Fin 78)
    (52 : Fin 78) (4 : Fin 78) (63 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0954` (kalmanson). -/
theorem directSource_h0954 :
    ((!((rankAtom (directSourceRanks P) 6 == rankAtom (directSourceRanks P) 7)) || ((rankAtom (directSourceRanks P) 51).ult (rankAtom (directSourceRanks P) 52)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (52 : Fin 78) (6 : Fin 78)
    (51 : Fin 78) (7 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (5 : Fin 13) (7 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (51 : Fin 78) (7 : Fin 78) (6 : Fin 78)
    (52 : Fin 78) (4 : Fin 78) (63 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0955` (kalmanson). -/
theorem directSource_h0955 :
    ((!((rankAtom (directSourceRanks P) 6 == rankAtom (directSourceRanks P) 51)) || ((rankAtom (directSourceRanks P) 7).ult (rankAtom (directSourceRanks P) 52)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (52 : Fin 78) (6 : Fin 78)
    (7 : Fin 78) (51 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (5 : Fin 13) (7 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (51 : Fin 78) (7 : Fin 78) (6 : Fin 78)
    (52 : Fin 78) (4 : Fin 78) (63 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0956` (kalmanson). -/
theorem directSource_h0956 :
    ((!((rankAtom (directSourceRanks P) 52 == rankAtom (directSourceRanks P) 7)) || ((rankAtom (directSourceRanks P) 51).ult (rankAtom (directSourceRanks P) 6)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (6 : Fin 78) (52 : Fin 78)
    (51 : Fin 78) (7 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (5 : Fin 13) (7 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (51 : Fin 78) (7 : Fin 78) (6 : Fin 78)
    (52 : Fin 78) (4 : Fin 78) (63 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0957` (kalmanson). -/
theorem directSource_h0957 :
    ((!((rankAtom (directSourceRanks P) 52 == rankAtom (directSourceRanks P) 51)) || ((rankAtom (directSourceRanks P) 7).ult (rankAtom (directSourceRanks P) 6)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (6 : Fin 78) (52 : Fin 78)
    (7 : Fin 78) (51 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (5 : Fin 13) (7 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (51 : Fin 78) (7 : Fin 78) (6 : Fin 78)
    (52 : Fin 78) (4 : Fin 78) (63 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0958` (kalmanson). -/
theorem directSource_h0958 :
    ((!((rankAtom (directSourceRanks P) 6 == rankAtom (directSourceRanks P) 4)) || ((rankAtom (directSourceRanks P) 64).ult (rankAtom (directSourceRanks P) 53)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (53 : Fin 78) (6 : Fin 78)
    (64 : Fin 78) (4 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (5 : Fin 13) (7 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (51 : Fin 78) (8 : Fin 78) (6 : Fin 78)
    (53 : Fin 78) (4 : Fin 78) (64 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0959` (kalmanson). -/
theorem directSource_h0959 :
    ((!((rankAtom (directSourceRanks P) 6 == rankAtom (directSourceRanks P) 8)) || ((rankAtom (directSourceRanks P) 51).ult (rankAtom (directSourceRanks P) 53)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (53 : Fin 78) (6 : Fin 78)
    (51 : Fin 78) (8 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (5 : Fin 13) (7 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (51 : Fin 78) (8 : Fin 78) (6 : Fin 78)
    (53 : Fin 78) (4 : Fin 78) (64 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

end

end ATailExactFiveCard13CnfIngressScratch
end Problem97
