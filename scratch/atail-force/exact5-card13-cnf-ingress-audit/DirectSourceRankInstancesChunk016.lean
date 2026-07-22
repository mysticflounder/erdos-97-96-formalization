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

/-- Exact pass-5 source assertion `h1024` (kalmanson). -/
theorem directSource_h1024 :
    ((!((rankAtom (directSourceRanks P) 29 == rankAtom (directSourceRanks P) 12)) || ((rankAtom (directSourceRanks P) 46).ult (rankAtom (directSourceRanks P) 14)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (14 : Fin 78) (29 : Fin 78)
    (46 : Fin 78) (12 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (4 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (24 : Fin 78) (19 : Fin 78) (14 : Fin 78)
    (29 : Fin 78) (12 : Fin 78) (46 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1025` (kalmanson). -/
theorem directSource_h1025 :
    ((!((rankAtom (directSourceRanks P) 14 == rankAtom (directSourceRanks P) 47)) || ((rankAtom (directSourceRanks P) 12).ult (rankAtom (directSourceRanks P) 30)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (30 : Fin 78) (14 : Fin 78)
    (12 : Fin 78) (47 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (4 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (24 : Fin 78) (20 : Fin 78) (14 : Fin 78)
    (30 : Fin 78) (12 : Fin 78) (47 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1026` (kalmanson). -/
theorem directSource_h1026 :
    ((!((rankAtom (directSourceRanks P) 30 == rankAtom (directSourceRanks P) 12)) || ((rankAtom (directSourceRanks P) 47).ult (rankAtom (directSourceRanks P) 14)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (14 : Fin 78) (30 : Fin 78)
    (47 : Fin 78) (12 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (4 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (24 : Fin 78) (20 : Fin 78) (14 : Fin 78)
    (30 : Fin 78) (12 : Fin 78) (47 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1027` (kalmanson). -/
theorem directSource_h1027 :
    ((!((rankAtom (directSourceRanks P) 14 == rankAtom (directSourceRanks P) 48)) || ((rankAtom (directSourceRanks P) 12).ult (rankAtom (directSourceRanks P) 31)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (31 : Fin 78) (14 : Fin 78)
    (12 : Fin 78) (48 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (4 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (24 : Fin 78) (21 : Fin 78) (14 : Fin 78)
    (31 : Fin 78) (12 : Fin 78) (48 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1028` (kalmanson). -/
theorem directSource_h1028 :
    ((!((rankAtom (directSourceRanks P) 31 == rankAtom (directSourceRanks P) 12)) || ((rankAtom (directSourceRanks P) 48).ult (rankAtom (directSourceRanks P) 14)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (14 : Fin 78) (31 : Fin 78)
    (48 : Fin 78) (12 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (4 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (24 : Fin 78) (21 : Fin 78) (14 : Fin 78)
    (31 : Fin 78) (12 : Fin 78) (48 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1029` (kalmanson). -/
theorem directSource_h1029 :
    ((!((rankAtom (directSourceRanks P) 14 == rankAtom (directSourceRanks P) 49)) || ((rankAtom (directSourceRanks P) 12).ult (rankAtom (directSourceRanks P) 32)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (32 : Fin 78) (14 : Fin 78)
    (12 : Fin 78) (49 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (4 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (24 : Fin 78) (22 : Fin 78) (14 : Fin 78)
    (32 : Fin 78) (12 : Fin 78) (49 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1030` (kalmanson). -/
theorem directSource_h1030 :
    ((!((rankAtom (directSourceRanks P) 32 == rankAtom (directSourceRanks P) 12)) || ((rankAtom (directSourceRanks P) 49).ult (rankAtom (directSourceRanks P) 14)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (14 : Fin 78) (32 : Fin 78)
    (49 : Fin 78) (12 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (4 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (24 : Fin 78) (22 : Fin 78) (14 : Fin 78)
    (32 : Fin 78) (12 : Fin 78) (49 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1031` (kalmanson). -/
theorem directSource_h1031 :
    ((!((rankAtom (directSourceRanks P) 15 == rankAtom (directSourceRanks P) 50)) || ((rankAtom (directSourceRanks P) 12).ult (rankAtom (directSourceRanks P) 26)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (26 : Fin 78) (15 : Fin 78)
    (12 : Fin 78) (50 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (5 : Fin 13) (6 : Fin 13)
    (by decide) (by decide) (by decide)
    (25 : Fin 78) (16 : Fin 78) (15 : Fin 78)
    (26 : Fin 78) (12 : Fin 78) (50 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1032` (kalmanson). -/
theorem directSource_h1032 :
    ((!((rankAtom (directSourceRanks P) 26 == rankAtom (directSourceRanks P) 12)) || ((rankAtom (directSourceRanks P) 50).ult (rankAtom (directSourceRanks P) 15)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (15 : Fin 78) (26 : Fin 78)
    (50 : Fin 78) (12 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (5 : Fin 13) (6 : Fin 13)
    (by decide) (by decide) (by decide)
    (25 : Fin 78) (16 : Fin 78) (15 : Fin 78)
    (26 : Fin 78) (12 : Fin 78) (50 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1033` (kalmanson). -/
theorem directSource_h1033 :
    ((!((rankAtom (directSourceRanks P) 26 == rankAtom (directSourceRanks P) 50)) || ((rankAtom (directSourceRanks P) 12).ult (rankAtom (directSourceRanks P) 15)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (15 : Fin 78) (26 : Fin 78)
    (12 : Fin 78) (50 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (5 : Fin 13) (6 : Fin 13)
    (by decide) (by decide) (by decide)
    (25 : Fin 78) (16 : Fin 78) (15 : Fin 78)
    (26 : Fin 78) (12 : Fin 78) (50 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1034` (kalmanson). -/
theorem directSource_h1034 :
    ((!((rankAtom (directSourceRanks P) 26 == rankAtom (directSourceRanks P) 25)) || ((rankAtom (directSourceRanks P) 16).ult (rankAtom (directSourceRanks P) 15)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (15 : Fin 78) (26 : Fin 78)
    (16 : Fin 78) (25 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (5 : Fin 13) (6 : Fin 13)
    (by decide) (by decide) (by decide)
    (25 : Fin 78) (16 : Fin 78) (15 : Fin 78)
    (26 : Fin 78) (12 : Fin 78) (50 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1035` (kalmanson). -/
theorem directSource_h1035 :
    ((!((rankAtom (directSourceRanks P) 15 == rankAtom (directSourceRanks P) 51)) || ((rankAtom (directSourceRanks P) 12).ult (rankAtom (directSourceRanks P) 27)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (27 : Fin 78) (15 : Fin 78)
    (12 : Fin 78) (51 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (5 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (25 : Fin 78) (17 : Fin 78) (15 : Fin 78)
    (27 : Fin 78) (12 : Fin 78) (51 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1036` (kalmanson). -/
theorem directSource_h1036 :
    ((!((rankAtom (directSourceRanks P) 27 == rankAtom (directSourceRanks P) 12)) || ((rankAtom (directSourceRanks P) 51).ult (rankAtom (directSourceRanks P) 15)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (15 : Fin 78) (27 : Fin 78)
    (51 : Fin 78) (12 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (5 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (25 : Fin 78) (17 : Fin 78) (15 : Fin 78)
    (27 : Fin 78) (12 : Fin 78) (51 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1037` (kalmanson). -/
theorem directSource_h1037 :
    ((!((rankAtom (directSourceRanks P) 27 == rankAtom (directSourceRanks P) 25)) || ((rankAtom (directSourceRanks P) 17).ult (rankAtom (directSourceRanks P) 15)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (15 : Fin 78) (27 : Fin 78)
    (17 : Fin 78) (25 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (5 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (25 : Fin 78) (17 : Fin 78) (15 : Fin 78)
    (27 : Fin 78) (12 : Fin 78) (51 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1038` (kalmanson). -/
theorem directSource_h1038 :
    ((!((rankAtom (directSourceRanks P) 15 == rankAtom (directSourceRanks P) 52)) || ((rankAtom (directSourceRanks P) 12).ult (rankAtom (directSourceRanks P) 28)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (28 : Fin 78) (15 : Fin 78)
    (12 : Fin 78) (52 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (5 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (25 : Fin 78) (18 : Fin 78) (15 : Fin 78)
    (28 : Fin 78) (12 : Fin 78) (52 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1039` (kalmanson). -/
theorem directSource_h1039 :
    ((!((rankAtom (directSourceRanks P) 28 == rankAtom (directSourceRanks P) 12)) || ((rankAtom (directSourceRanks P) 52).ult (rankAtom (directSourceRanks P) 15)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (15 : Fin 78) (28 : Fin 78)
    (52 : Fin 78) (12 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (5 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (25 : Fin 78) (18 : Fin 78) (15 : Fin 78)
    (28 : Fin 78) (12 : Fin 78) (52 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1040` (kalmanson). -/
theorem directSource_h1040 :
    ((!((rankAtom (directSourceRanks P) 28 == rankAtom (directSourceRanks P) 52)) || ((rankAtom (directSourceRanks P) 12).ult (rankAtom (directSourceRanks P) 15)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (15 : Fin 78) (28 : Fin 78)
    (12 : Fin 78) (52 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (5 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (25 : Fin 78) (18 : Fin 78) (15 : Fin 78)
    (28 : Fin 78) (12 : Fin 78) (52 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1041` (kalmanson). -/
theorem directSource_h1041 :
    ((!((rankAtom (directSourceRanks P) 28 == rankAtom (directSourceRanks P) 18)) || ((rankAtom (directSourceRanks P) 25).ult (rankAtom (directSourceRanks P) 15)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (15 : Fin 78) (28 : Fin 78)
    (25 : Fin 78) (18 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (5 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (25 : Fin 78) (18 : Fin 78) (15 : Fin 78)
    (28 : Fin 78) (12 : Fin 78) (52 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1042` (kalmanson). -/
theorem directSource_h1042 :
    ((!((rankAtom (directSourceRanks P) 28 == rankAtom (directSourceRanks P) 25)) || ((rankAtom (directSourceRanks P) 18).ult (rankAtom (directSourceRanks P) 15)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (15 : Fin 78) (28 : Fin 78)
    (18 : Fin 78) (25 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (5 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (25 : Fin 78) (18 : Fin 78) (15 : Fin 78)
    (28 : Fin 78) (12 : Fin 78) (52 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1043` (kalmanson). -/
theorem directSource_h1043 :
    ((!((rankAtom (directSourceRanks P) 15 == rankAtom (directSourceRanks P) 53)) || ((rankAtom (directSourceRanks P) 12).ult (rankAtom (directSourceRanks P) 29)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (29 : Fin 78) (15 : Fin 78)
    (12 : Fin 78) (53 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (5 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (25 : Fin 78) (19 : Fin 78) (15 : Fin 78)
    (29 : Fin 78) (12 : Fin 78) (53 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1044` (kalmanson). -/
theorem directSource_h1044 :
    ((!((rankAtom (directSourceRanks P) 29 == rankAtom (directSourceRanks P) 12)) || ((rankAtom (directSourceRanks P) 53).ult (rankAtom (directSourceRanks P) 15)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (15 : Fin 78) (29 : Fin 78)
    (53 : Fin 78) (12 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (5 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (25 : Fin 78) (19 : Fin 78) (15 : Fin 78)
    (29 : Fin 78) (12 : Fin 78) (53 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1045` (kalmanson). -/
theorem directSource_h1045 :
    ((!((rankAtom (directSourceRanks P) 15 == rankAtom (directSourceRanks P) 54)) || ((rankAtom (directSourceRanks P) 12).ult (rankAtom (directSourceRanks P) 30)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (30 : Fin 78) (15 : Fin 78)
    (12 : Fin 78) (54 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (5 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (25 : Fin 78) (20 : Fin 78) (15 : Fin 78)
    (30 : Fin 78) (12 : Fin 78) (54 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1046` (kalmanson). -/
theorem directSource_h1046 :
    ((!((rankAtom (directSourceRanks P) 30 == rankAtom (directSourceRanks P) 12)) || ((rankAtom (directSourceRanks P) 54).ult (rankAtom (directSourceRanks P) 15)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (15 : Fin 78) (30 : Fin 78)
    (54 : Fin 78) (12 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (5 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (25 : Fin 78) (20 : Fin 78) (15 : Fin 78)
    (30 : Fin 78) (12 : Fin 78) (54 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1047` (kalmanson). -/
theorem directSource_h1047 :
    ((!((rankAtom (directSourceRanks P) 15 == rankAtom (directSourceRanks P) 55)) || ((rankAtom (directSourceRanks P) 12).ult (rankAtom (directSourceRanks P) 31)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (31 : Fin 78) (15 : Fin 78)
    (12 : Fin 78) (55 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (5 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (25 : Fin 78) (21 : Fin 78) (15 : Fin 78)
    (31 : Fin 78) (12 : Fin 78) (55 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1048` (kalmanson). -/
theorem directSource_h1048 :
    ((!((rankAtom (directSourceRanks P) 31 == rankAtom (directSourceRanks P) 12)) || ((rankAtom (directSourceRanks P) 55).ult (rankAtom (directSourceRanks P) 15)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (15 : Fin 78) (31 : Fin 78)
    (55 : Fin 78) (12 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (5 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (25 : Fin 78) (21 : Fin 78) (15 : Fin 78)
    (31 : Fin 78) (12 : Fin 78) (55 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1049` (kalmanson). -/
theorem directSource_h1049 :
    ((!((rankAtom (directSourceRanks P) 15 == rankAtom (directSourceRanks P) 12)) || ((rankAtom (directSourceRanks P) 56).ult (rankAtom (directSourceRanks P) 32)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (32 : Fin 78) (15 : Fin 78)
    (56 : Fin 78) (12 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (5 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (25 : Fin 78) (22 : Fin 78) (15 : Fin 78)
    (32 : Fin 78) (12 : Fin 78) (56 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1050` (kalmanson). -/
theorem directSource_h1050 :
    ((!((rankAtom (directSourceRanks P) 15 == rankAtom (directSourceRanks P) 56)) || ((rankAtom (directSourceRanks P) 12).ult (rankAtom (directSourceRanks P) 32)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (32 : Fin 78) (15 : Fin 78)
    (12 : Fin 78) (56 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (5 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (25 : Fin 78) (22 : Fin 78) (15 : Fin 78)
    (32 : Fin 78) (12 : Fin 78) (56 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1051` (kalmanson). -/
theorem directSource_h1051 :
    ((!((rankAtom (directSourceRanks P) 32 == rankAtom (directSourceRanks P) 12)) || ((rankAtom (directSourceRanks P) 56).ult (rankAtom (directSourceRanks P) 15)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (15 : Fin 78) (32 : Fin 78)
    (56 : Fin 78) (12 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (5 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (25 : Fin 78) (22 : Fin 78) (15 : Fin 78)
    (32 : Fin 78) (12 : Fin 78) (56 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1052` (kalmanson). -/
theorem directSource_h1052 :
    ((!((rankAtom (directSourceRanks P) 16 == rankAtom (directSourceRanks P) 57)) || ((rankAtom (directSourceRanks P) 12).ult (rankAtom (directSourceRanks P) 27)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (27 : Fin 78) (16 : Fin 78)
    (12 : Fin 78) (57 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (6 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (26 : Fin 78) (17 : Fin 78) (16 : Fin 78)
    (27 : Fin 78) (12 : Fin 78) (57 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1053` (kalmanson). -/
theorem directSource_h1053 :
    ((!((rankAtom (directSourceRanks P) 27 == rankAtom (directSourceRanks P) 12)) || ((rankAtom (directSourceRanks P) 57).ult (rankAtom (directSourceRanks P) 16)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (16 : Fin 78) (27 : Fin 78)
    (57 : Fin 78) (12 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (6 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (26 : Fin 78) (17 : Fin 78) (16 : Fin 78)
    (27 : Fin 78) (12 : Fin 78) (57 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1054` (kalmanson). -/
theorem directSource_h1054 :
    ((!((rankAtom (directSourceRanks P) 27 == rankAtom (directSourceRanks P) 26)) || ((rankAtom (directSourceRanks P) 17).ult (rankAtom (directSourceRanks P) 16)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (16 : Fin 78) (27 : Fin 78)
    (17 : Fin 78) (26 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (6 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (26 : Fin 78) (17 : Fin 78) (16 : Fin 78)
    (27 : Fin 78) (12 : Fin 78) (57 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1055` (kalmanson). -/
theorem directSource_h1055 :
    ((!((rankAtom (directSourceRanks P) 28 == rankAtom (directSourceRanks P) 12)) || ((rankAtom (directSourceRanks P) 58).ult (rankAtom (directSourceRanks P) 16)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (16 : Fin 78) (28 : Fin 78)
    (58 : Fin 78) (12 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (6 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (26 : Fin 78) (18 : Fin 78) (16 : Fin 78)
    (28 : Fin 78) (12 : Fin 78) (58 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1056` (kalmanson). -/
theorem directSource_h1056 :
    ((!((rankAtom (directSourceRanks P) 28 == rankAtom (directSourceRanks P) 58)) || ((rankAtom (directSourceRanks P) 12).ult (rankAtom (directSourceRanks P) 16)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (16 : Fin 78) (28 : Fin 78)
    (12 : Fin 78) (58 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (6 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (26 : Fin 78) (18 : Fin 78) (16 : Fin 78)
    (28 : Fin 78) (12 : Fin 78) (58 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1057` (kalmanson). -/
theorem directSource_h1057 :
    ((!((rankAtom (directSourceRanks P) 28 == rankAtom (directSourceRanks P) 18)) || ((rankAtom (directSourceRanks P) 26).ult (rankAtom (directSourceRanks P) 16)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (16 : Fin 78) (28 : Fin 78)
    (26 : Fin 78) (18 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (6 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (26 : Fin 78) (18 : Fin 78) (16 : Fin 78)
    (28 : Fin 78) (12 : Fin 78) (58 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1058` (kalmanson). -/
theorem directSource_h1058 :
    ((!((rankAtom (directSourceRanks P) 28 == rankAtom (directSourceRanks P) 26)) || ((rankAtom (directSourceRanks P) 18).ult (rankAtom (directSourceRanks P) 16)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (16 : Fin 78) (28 : Fin 78)
    (18 : Fin 78) (26 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (6 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (26 : Fin 78) (18 : Fin 78) (16 : Fin 78)
    (28 : Fin 78) (12 : Fin 78) (58 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1059` (kalmanson). -/
theorem directSource_h1059 :
    ((!((rankAtom (directSourceRanks P) 16 == rankAtom (directSourceRanks P) 59)) || ((rankAtom (directSourceRanks P) 12).ult (rankAtom (directSourceRanks P) 29)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (29 : Fin 78) (16 : Fin 78)
    (12 : Fin 78) (59 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (6 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (26 : Fin 78) (19 : Fin 78) (16 : Fin 78)
    (29 : Fin 78) (12 : Fin 78) (59 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1060` (kalmanson). -/
theorem directSource_h1060 :
    ((!((rankAtom (directSourceRanks P) 29 == rankAtom (directSourceRanks P) 12)) || ((rankAtom (directSourceRanks P) 59).ult (rankAtom (directSourceRanks P) 16)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (16 : Fin 78) (29 : Fin 78)
    (59 : Fin 78) (12 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (6 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (26 : Fin 78) (19 : Fin 78) (16 : Fin 78)
    (29 : Fin 78) (12 : Fin 78) (59 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1061` (kalmanson). -/
theorem directSource_h1061 :
    ((!((rankAtom (directSourceRanks P) 16 == rankAtom (directSourceRanks P) 60)) || ((rankAtom (directSourceRanks P) 12).ult (rankAtom (directSourceRanks P) 30)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (30 : Fin 78) (16 : Fin 78)
    (12 : Fin 78) (60 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (6 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (26 : Fin 78) (20 : Fin 78) (16 : Fin 78)
    (30 : Fin 78) (12 : Fin 78) (60 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1062` (kalmanson). -/
theorem directSource_h1062 :
    ((!((rankAtom (directSourceRanks P) 30 == rankAtom (directSourceRanks P) 12)) || ((rankAtom (directSourceRanks P) 60).ult (rankAtom (directSourceRanks P) 16)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (16 : Fin 78) (30 : Fin 78)
    (60 : Fin 78) (12 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (6 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (26 : Fin 78) (20 : Fin 78) (16 : Fin 78)
    (30 : Fin 78) (12 : Fin 78) (60 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1063` (kalmanson). -/
theorem directSource_h1063 :
    ((!((rankAtom (directSourceRanks P) 16 == rankAtom (directSourceRanks P) 61)) || ((rankAtom (directSourceRanks P) 12).ult (rankAtom (directSourceRanks P) 31)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (31 : Fin 78) (16 : Fin 78)
    (12 : Fin 78) (61 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (6 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (26 : Fin 78) (21 : Fin 78) (16 : Fin 78)
    (31 : Fin 78) (12 : Fin 78) (61 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1064` (kalmanson). -/
theorem directSource_h1064 :
    ((!((rankAtom (directSourceRanks P) 31 == rankAtom (directSourceRanks P) 12)) || ((rankAtom (directSourceRanks P) 61).ult (rankAtom (directSourceRanks P) 16)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (16 : Fin 78) (31 : Fin 78)
    (61 : Fin 78) (12 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (6 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (26 : Fin 78) (21 : Fin 78) (16 : Fin 78)
    (31 : Fin 78) (12 : Fin 78) (61 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1065` (kalmanson). -/
theorem directSource_h1065 :
    ((!((rankAtom (directSourceRanks P) 16 == rankAtom (directSourceRanks P) 12)) || ((rankAtom (directSourceRanks P) 62).ult (rankAtom (directSourceRanks P) 32)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (32 : Fin 78) (16 : Fin 78)
    (62 : Fin 78) (12 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (6 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (26 : Fin 78) (22 : Fin 78) (16 : Fin 78)
    (32 : Fin 78) (12 : Fin 78) (62 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1066` (kalmanson). -/
theorem directSource_h1066 :
    ((!((rankAtom (directSourceRanks P) 16 == rankAtom (directSourceRanks P) 62)) || ((rankAtom (directSourceRanks P) 12).ult (rankAtom (directSourceRanks P) 32)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (32 : Fin 78) (16 : Fin 78)
    (12 : Fin 78) (62 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (6 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (26 : Fin 78) (22 : Fin 78) (16 : Fin 78)
    (32 : Fin 78) (12 : Fin 78) (62 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1067` (kalmanson). -/
theorem directSource_h1067 :
    ((!((rankAtom (directSourceRanks P) 32 == rankAtom (directSourceRanks P) 12)) || ((rankAtom (directSourceRanks P) 62).ult (rankAtom (directSourceRanks P) 16)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (16 : Fin 78) (32 : Fin 78)
    (62 : Fin 78) (12 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (6 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (26 : Fin 78) (22 : Fin 78) (16 : Fin 78)
    (32 : Fin 78) (12 : Fin 78) (62 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1068` (kalmanson). -/
theorem directSource_h1068 :
    ((!((rankAtom (directSourceRanks P) 28 == rankAtom (directSourceRanks P) 12)) || ((rankAtom (directSourceRanks P) 63).ult (rankAtom (directSourceRanks P) 17)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (17 : Fin 78) (28 : Fin 78)
    (63 : Fin 78) (12 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (7 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (27 : Fin 78) (18 : Fin 78) (17 : Fin 78)
    (28 : Fin 78) (12 : Fin 78) (63 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1069` (kalmanson). -/
theorem directSource_h1069 :
    ((!((rankAtom (directSourceRanks P) 28 == rankAtom (directSourceRanks P) 63)) || ((rankAtom (directSourceRanks P) 12).ult (rankAtom (directSourceRanks P) 17)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (17 : Fin 78) (28 : Fin 78)
    (12 : Fin 78) (63 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (7 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (27 : Fin 78) (18 : Fin 78) (17 : Fin 78)
    (28 : Fin 78) (12 : Fin 78) (63 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1070` (kalmanson). -/
theorem directSource_h1070 :
    ((!((rankAtom (directSourceRanks P) 28 == rankAtom (directSourceRanks P) 18)) || ((rankAtom (directSourceRanks P) 27).ult (rankAtom (directSourceRanks P) 17)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (17 : Fin 78) (28 : Fin 78)
    (27 : Fin 78) (18 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (7 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (27 : Fin 78) (18 : Fin 78) (17 : Fin 78)
    (28 : Fin 78) (12 : Fin 78) (63 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1071` (kalmanson). -/
theorem directSource_h1071 :
    ((!((rankAtom (directSourceRanks P) 28 == rankAtom (directSourceRanks P) 27)) || ((rankAtom (directSourceRanks P) 18).ult (rankAtom (directSourceRanks P) 17)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (17 : Fin 78) (28 : Fin 78)
    (18 : Fin 78) (27 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (7 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (27 : Fin 78) (18 : Fin 78) (17 : Fin 78)
    (28 : Fin 78) (12 : Fin 78) (63 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1072` (kalmanson). -/
theorem directSource_h1072 :
    ((!((rankAtom (directSourceRanks P) 29 == rankAtom (directSourceRanks P) 12)) || ((rankAtom (directSourceRanks P) 64).ult (rankAtom (directSourceRanks P) 17)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (17 : Fin 78) (29 : Fin 78)
    (64 : Fin 78) (12 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (7 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (27 : Fin 78) (19 : Fin 78) (17 : Fin 78)
    (29 : Fin 78) (12 : Fin 78) (64 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1073` (kalmanson). -/
theorem directSource_h1073 :
    ((!((rankAtom (directSourceRanks P) 30 == rankAtom (directSourceRanks P) 12)) || ((rankAtom (directSourceRanks P) 65).ult (rankAtom (directSourceRanks P) 17)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (17 : Fin 78) (30 : Fin 78)
    (65 : Fin 78) (12 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (7 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (27 : Fin 78) (20 : Fin 78) (17 : Fin 78)
    (30 : Fin 78) (12 : Fin 78) (65 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1074` (kalmanson). -/
theorem directSource_h1074 :
    ((!((rankAtom (directSourceRanks P) 31 == rankAtom (directSourceRanks P) 12)) || ((rankAtom (directSourceRanks P) 66).ult (rankAtom (directSourceRanks P) 17)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (17 : Fin 78) (31 : Fin 78)
    (66 : Fin 78) (12 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (7 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (27 : Fin 78) (21 : Fin 78) (17 : Fin 78)
    (31 : Fin 78) (12 : Fin 78) (66 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1075` (kalmanson). -/
theorem directSource_h1075 :
    ((!((rankAtom (directSourceRanks P) 32 == rankAtom (directSourceRanks P) 12)) || ((rankAtom (directSourceRanks P) 67).ult (rankAtom (directSourceRanks P) 17)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (17 : Fin 78) (32 : Fin 78)
    (67 : Fin 78) (12 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (7 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (27 : Fin 78) (22 : Fin 78) (17 : Fin 78)
    (32 : Fin 78) (12 : Fin 78) (67 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1076` (kalmanson). -/
theorem directSource_h1076 :
    ((!((rankAtom (directSourceRanks P) 18 == rankAtom (directSourceRanks P) 12)) || ((rankAtom (directSourceRanks P) 68).ult (rankAtom (directSourceRanks P) 29)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (29 : Fin 78) (18 : Fin 78)
    (68 : Fin 78) (12 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (8 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (28 : Fin 78) (19 : Fin 78) (18 : Fin 78)
    (29 : Fin 78) (12 : Fin 78) (68 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1077` (kalmanson). -/
theorem directSource_h1077 :
    ((!((rankAtom (directSourceRanks P) 18 == rankAtom (directSourceRanks P) 68)) || ((rankAtom (directSourceRanks P) 12).ult (rankAtom (directSourceRanks P) 29)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (29 : Fin 78) (18 : Fin 78)
    (12 : Fin 78) (68 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (8 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (28 : Fin 78) (19 : Fin 78) (18 : Fin 78)
    (29 : Fin 78) (12 : Fin 78) (68 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1078` (kalmanson). -/
theorem directSource_h1078 :
    ((!((rankAtom (directSourceRanks P) 18 == rankAtom (directSourceRanks P) 28)) || ((rankAtom (directSourceRanks P) 19).ult (rankAtom (directSourceRanks P) 29)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (29 : Fin 78) (18 : Fin 78)
    (19 : Fin 78) (28 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (8 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (28 : Fin 78) (19 : Fin 78) (18 : Fin 78)
    (29 : Fin 78) (12 : Fin 78) (68 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1079` (kalmanson). -/
theorem directSource_h1079 :
    ((!((rankAtom (directSourceRanks P) 29 == rankAtom (directSourceRanks P) 28)) || ((rankAtom (directSourceRanks P) 19).ult (rankAtom (directSourceRanks P) 18)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (18 : Fin 78) (29 : Fin 78)
    (19 : Fin 78) (28 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (8 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (28 : Fin 78) (19 : Fin 78) (18 : Fin 78)
    (29 : Fin 78) (12 : Fin 78) (68 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1080` (kalmanson). -/
theorem directSource_h1080 :
    ((!((rankAtom (directSourceRanks P) 18 == rankAtom (directSourceRanks P) 12)) || ((rankAtom (directSourceRanks P) 69).ult (rankAtom (directSourceRanks P) 30)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (30 : Fin 78) (18 : Fin 78)
    (69 : Fin 78) (12 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (8 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (28 : Fin 78) (20 : Fin 78) (18 : Fin 78)
    (30 : Fin 78) (12 : Fin 78) (69 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1081` (kalmanson). -/
theorem directSource_h1081 :
    ((!((rankAtom (directSourceRanks P) 18 == rankAtom (directSourceRanks P) 69)) || ((rankAtom (directSourceRanks P) 12).ult (rankAtom (directSourceRanks P) 30)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (30 : Fin 78) (18 : Fin 78)
    (12 : Fin 78) (69 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (8 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (28 : Fin 78) (20 : Fin 78) (18 : Fin 78)
    (30 : Fin 78) (12 : Fin 78) (69 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1082` (kalmanson). -/
theorem directSource_h1082 :
    ((!((rankAtom (directSourceRanks P) 18 == rankAtom (directSourceRanks P) 28)) || ((rankAtom (directSourceRanks P) 20).ult (rankAtom (directSourceRanks P) 30)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (30 : Fin 78) (18 : Fin 78)
    (20 : Fin 78) (28 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (8 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (28 : Fin 78) (20 : Fin 78) (18 : Fin 78)
    (30 : Fin 78) (12 : Fin 78) (69 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1083` (kalmanson). -/
theorem directSource_h1083 :
    ((!((rankAtom (directSourceRanks P) 18 == rankAtom (directSourceRanks P) 12)) || ((rankAtom (directSourceRanks P) 70).ult (rankAtom (directSourceRanks P) 31)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (31 : Fin 78) (18 : Fin 78)
    (70 : Fin 78) (12 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (8 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (28 : Fin 78) (21 : Fin 78) (18 : Fin 78)
    (31 : Fin 78) (12 : Fin 78) (70 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1084` (kalmanson). -/
theorem directSource_h1084 :
    ((!((rankAtom (directSourceRanks P) 18 == rankAtom (directSourceRanks P) 70)) || ((rankAtom (directSourceRanks P) 12).ult (rankAtom (directSourceRanks P) 31)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (31 : Fin 78) (18 : Fin 78)
    (12 : Fin 78) (70 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (8 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (28 : Fin 78) (21 : Fin 78) (18 : Fin 78)
    (31 : Fin 78) (12 : Fin 78) (70 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1085` (kalmanson). -/
theorem directSource_h1085 :
    ((!((rankAtom (directSourceRanks P) 18 == rankAtom (directSourceRanks P) 28)) || ((rankAtom (directSourceRanks P) 21).ult (rankAtom (directSourceRanks P) 31)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (31 : Fin 78) (18 : Fin 78)
    (21 : Fin 78) (28 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (8 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (28 : Fin 78) (21 : Fin 78) (18 : Fin 78)
    (31 : Fin 78) (12 : Fin 78) (70 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1086` (kalmanson). -/
theorem directSource_h1086 :
    ((!((rankAtom (directSourceRanks P) 18 == rankAtom (directSourceRanks P) 12)) || ((rankAtom (directSourceRanks P) 71).ult (rankAtom (directSourceRanks P) 32)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (32 : Fin 78) (18 : Fin 78)
    (71 : Fin 78) (12 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (8 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (28 : Fin 78) (22 : Fin 78) (18 : Fin 78)
    (32 : Fin 78) (12 : Fin 78) (71 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1087` (kalmanson). -/
theorem directSource_h1087 :
    ((!((rankAtom (directSourceRanks P) 18 == rankAtom (directSourceRanks P) 71)) || ((rankAtom (directSourceRanks P) 12).ult (rankAtom (directSourceRanks P) 32)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (32 : Fin 78) (18 : Fin 78)
    (12 : Fin 78) (71 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (8 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (28 : Fin 78) (22 : Fin 78) (18 : Fin 78)
    (32 : Fin 78) (12 : Fin 78) (71 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

end

end ATailExactFiveCard13CnfIngressScratch
end Problem97
