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

/-- Exact pass-5 source assertion `h1088` (kalmanson). -/
theorem directSource_h1088 :
    ((!((rankAtom (directSourceRanks P) 18 == rankAtom (directSourceRanks P) 28)) || ((rankAtom (directSourceRanks P) 22).ult (rankAtom (directSourceRanks P) 32)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (32 : Fin 78) (18 : Fin 78)
    (22 : Fin 78) (28 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (8 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (28 : Fin 78) (22 : Fin 78) (18 : Fin 78)
    (32 : Fin 78) (12 : Fin 78) (71 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1089` (kalmanson). -/
theorem directSource_h1089 :
    ((!((rankAtom (directSourceRanks P) 34 == rankAtom (directSourceRanks P) 42)) || ((rankAtom (directSourceRanks P) 13).ult (rankAtom (directSourceRanks P) 14)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (14 : Fin 78) (34 : Fin 78)
    (13 : Fin 78) (42 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (3 : Fin 13) (4 : Fin 13) (5 : Fin 13)
    (by decide) (by decide) (by decide)
    (33 : Fin 78) (15 : Fin 78) (14 : Fin 78)
    (34 : Fin 78) (13 : Fin 78) (42 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1090` (kalmanson). -/
theorem directSource_h1090 :
    ((!((rankAtom (directSourceRanks P) 35 == rankAtom (directSourceRanks P) 43)) || ((rankAtom (directSourceRanks P) 13).ult (rankAtom (directSourceRanks P) 14)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (14 : Fin 78) (35 : Fin 78)
    (13 : Fin 78) (43 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (3 : Fin 13) (4 : Fin 13) (6 : Fin 13)
    (by decide) (by decide) (by decide)
    (33 : Fin 78) (16 : Fin 78) (14 : Fin 78)
    (35 : Fin 78) (13 : Fin 78) (43 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1091` (kalmanson). -/
theorem directSource_h1091 :
    ((!((rankAtom (directSourceRanks P) 37 == rankAtom (directSourceRanks P) 45)) || ((rankAtom (directSourceRanks P) 13).ult (rankAtom (directSourceRanks P) 14)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (14 : Fin 78) (37 : Fin 78)
    (13 : Fin 78) (45 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (3 : Fin 13) (4 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (33 : Fin 78) (18 : Fin 78) (14 : Fin 78)
    (37 : Fin 78) (13 : Fin 78) (45 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1092` (kalmanson). -/
theorem directSource_h1092 :
    ((!((rankAtom (directSourceRanks P) 37 == rankAtom (directSourceRanks P) 18)) || ((rankAtom (directSourceRanks P) 33).ult (rankAtom (directSourceRanks P) 14)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (14 : Fin 78) (37 : Fin 78)
    (33 : Fin 78) (18 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (3 : Fin 13) (4 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (33 : Fin 78) (18 : Fin 78) (14 : Fin 78)
    (37 : Fin 78) (13 : Fin 78) (45 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1093` (kalmanson). -/
theorem directSource_h1093 :
    ((!((rankAtom (directSourceRanks P) 14 == rankAtom (directSourceRanks P) 46)) || ((rankAtom (directSourceRanks P) 13).ult (rankAtom (directSourceRanks P) 38)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (38 : Fin 78) (14 : Fin 78)
    (13 : Fin 78) (46 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (3 : Fin 13) (4 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (33 : Fin 78) (19 : Fin 78) (14 : Fin 78)
    (38 : Fin 78) (13 : Fin 78) (46 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1094` (kalmanson). -/
theorem directSource_h1094 :
    ((!((rankAtom (directSourceRanks P) 14 == rankAtom (directSourceRanks P) 47)) || ((rankAtom (directSourceRanks P) 13).ult (rankAtom (directSourceRanks P) 39)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (39 : Fin 78) (14 : Fin 78)
    (13 : Fin 78) (47 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (3 : Fin 13) (4 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (33 : Fin 78) (20 : Fin 78) (14 : Fin 78)
    (39 : Fin 78) (13 : Fin 78) (47 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1095` (kalmanson). -/
theorem directSource_h1095 :
    ((!((rankAtom (directSourceRanks P) 14 == rankAtom (directSourceRanks P) 48)) || ((rankAtom (directSourceRanks P) 13).ult (rankAtom (directSourceRanks P) 40)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (40 : Fin 78) (14 : Fin 78)
    (13 : Fin 78) (48 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (3 : Fin 13) (4 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (33 : Fin 78) (21 : Fin 78) (14 : Fin 78)
    (40 : Fin 78) (13 : Fin 78) (48 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1096` (kalmanson). -/
theorem directSource_h1096 :
    ((!((rankAtom (directSourceRanks P) 14 == rankAtom (directSourceRanks P) 49)) || ((rankAtom (directSourceRanks P) 13).ult (rankAtom (directSourceRanks P) 41)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (41 : Fin 78) (14 : Fin 78)
    (13 : Fin 78) (49 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (3 : Fin 13) (4 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (33 : Fin 78) (22 : Fin 78) (14 : Fin 78)
    (41 : Fin 78) (13 : Fin 78) (49 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1097` (kalmanson). -/
theorem directSource_h1097 :
    ((!((rankAtom (directSourceRanks P) 15 == rankAtom (directSourceRanks P) 50)) || ((rankAtom (directSourceRanks P) 13).ult (rankAtom (directSourceRanks P) 35)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (35 : Fin 78) (15 : Fin 78)
    (13 : Fin 78) (50 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (3 : Fin 13) (5 : Fin 13) (6 : Fin 13)
    (by decide) (by decide) (by decide)
    (34 : Fin 78) (16 : Fin 78) (15 : Fin 78)
    (35 : Fin 78) (13 : Fin 78) (50 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1098` (kalmanson). -/
theorem directSource_h1098 :
    ((!((rankAtom (directSourceRanks P) 35 == rankAtom (directSourceRanks P) 50)) || ((rankAtom (directSourceRanks P) 13).ult (rankAtom (directSourceRanks P) 15)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (15 : Fin 78) (35 : Fin 78)
    (13 : Fin 78) (50 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (3 : Fin 13) (5 : Fin 13) (6 : Fin 13)
    (by decide) (by decide) (by decide)
    (34 : Fin 78) (16 : Fin 78) (15 : Fin 78)
    (35 : Fin 78) (13 : Fin 78) (50 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1099` (kalmanson). -/
theorem directSource_h1099 :
    ((!((rankAtom (directSourceRanks P) 35 == rankAtom (directSourceRanks P) 34)) || ((rankAtom (directSourceRanks P) 16).ult (rankAtom (directSourceRanks P) 15)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (15 : Fin 78) (35 : Fin 78)
    (16 : Fin 78) (34 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (3 : Fin 13) (5 : Fin 13) (6 : Fin 13)
    (by decide) (by decide) (by decide)
    (34 : Fin 78) (16 : Fin 78) (15 : Fin 78)
    (35 : Fin 78) (13 : Fin 78) (50 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1100` (kalmanson). -/
theorem directSource_h1100 :
    ((!((rankAtom (directSourceRanks P) 15 == rankAtom (directSourceRanks P) 51)) || ((rankAtom (directSourceRanks P) 13).ult (rankAtom (directSourceRanks P) 36)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (36 : Fin 78) (15 : Fin 78)
    (13 : Fin 78) (51 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (3 : Fin 13) (5 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (34 : Fin 78) (17 : Fin 78) (15 : Fin 78)
    (36 : Fin 78) (13 : Fin 78) (51 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1101` (kalmanson). -/
theorem directSource_h1101 :
    ((!((rankAtom (directSourceRanks P) 15 == rankAtom (directSourceRanks P) 52)) || ((rankAtom (directSourceRanks P) 13).ult (rankAtom (directSourceRanks P) 37)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (37 : Fin 78) (15 : Fin 78)
    (13 : Fin 78) (52 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (3 : Fin 13) (5 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (34 : Fin 78) (18 : Fin 78) (15 : Fin 78)
    (37 : Fin 78) (13 : Fin 78) (52 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1102` (kalmanson). -/
theorem directSource_h1102 :
    ((!((rankAtom (directSourceRanks P) 37 == rankAtom (directSourceRanks P) 52)) || ((rankAtom (directSourceRanks P) 13).ult (rankAtom (directSourceRanks P) 15)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (15 : Fin 78) (37 : Fin 78)
    (13 : Fin 78) (52 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (3 : Fin 13) (5 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (34 : Fin 78) (18 : Fin 78) (15 : Fin 78)
    (37 : Fin 78) (13 : Fin 78) (52 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1103` (kalmanson). -/
theorem directSource_h1103 :
    ((!((rankAtom (directSourceRanks P) 37 == rankAtom (directSourceRanks P) 18)) || ((rankAtom (directSourceRanks P) 34).ult (rankAtom (directSourceRanks P) 15)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (15 : Fin 78) (37 : Fin 78)
    (34 : Fin 78) (18 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (3 : Fin 13) (5 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (34 : Fin 78) (18 : Fin 78) (15 : Fin 78)
    (37 : Fin 78) (13 : Fin 78) (52 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1104` (kalmanson). -/
theorem directSource_h1104 :
    ((!((rankAtom (directSourceRanks P) 15 == rankAtom (directSourceRanks P) 53)) || ((rankAtom (directSourceRanks P) 13).ult (rankAtom (directSourceRanks P) 38)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (38 : Fin 78) (15 : Fin 78)
    (13 : Fin 78) (53 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (3 : Fin 13) (5 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (34 : Fin 78) (19 : Fin 78) (15 : Fin 78)
    (38 : Fin 78) (13 : Fin 78) (53 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1105` (kalmanson). -/
theorem directSource_h1105 :
    ((!((rankAtom (directSourceRanks P) 15 == rankAtom (directSourceRanks P) 54)) || ((rankAtom (directSourceRanks P) 13).ult (rankAtom (directSourceRanks P) 39)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (39 : Fin 78) (15 : Fin 78)
    (13 : Fin 78) (54 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (3 : Fin 13) (5 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (34 : Fin 78) (20 : Fin 78) (15 : Fin 78)
    (39 : Fin 78) (13 : Fin 78) (54 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1106` (kalmanson). -/
theorem directSource_h1106 :
    ((!((rankAtom (directSourceRanks P) 15 == rankAtom (directSourceRanks P) 55)) || ((rankAtom (directSourceRanks P) 13).ult (rankAtom (directSourceRanks P) 40)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (40 : Fin 78) (15 : Fin 78)
    (13 : Fin 78) (55 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (3 : Fin 13) (5 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (34 : Fin 78) (21 : Fin 78) (15 : Fin 78)
    (40 : Fin 78) (13 : Fin 78) (55 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1107` (kalmanson). -/
theorem directSource_h1107 :
    ((!((rankAtom (directSourceRanks P) 15 == rankAtom (directSourceRanks P) 56)) || ((rankAtom (directSourceRanks P) 13).ult (rankAtom (directSourceRanks P) 41)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (41 : Fin 78) (15 : Fin 78)
    (13 : Fin 78) (56 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (3 : Fin 13) (5 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (34 : Fin 78) (22 : Fin 78) (15 : Fin 78)
    (41 : Fin 78) (13 : Fin 78) (56 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1108` (kalmanson). -/
theorem directSource_h1108 :
    ((!((rankAtom (directSourceRanks P) 16 == rankAtom (directSourceRanks P) 57)) || ((rankAtom (directSourceRanks P) 13).ult (rankAtom (directSourceRanks P) 36)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (36 : Fin 78) (16 : Fin 78)
    (13 : Fin 78) (57 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (3 : Fin 13) (6 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (35 : Fin 78) (17 : Fin 78) (16 : Fin 78)
    (36 : Fin 78) (13 : Fin 78) (57 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1109` (kalmanson). -/
theorem directSource_h1109 :
    ((!((rankAtom (directSourceRanks P) 16 == rankAtom (directSourceRanks P) 58)) || ((rankAtom (directSourceRanks P) 13).ult (rankAtom (directSourceRanks P) 37)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (37 : Fin 78) (16 : Fin 78)
    (13 : Fin 78) (58 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (3 : Fin 13) (6 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (35 : Fin 78) (18 : Fin 78) (16 : Fin 78)
    (37 : Fin 78) (13 : Fin 78) (58 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1110` (kalmanson). -/
theorem directSource_h1110 :
    ((!((rankAtom (directSourceRanks P) 37 == rankAtom (directSourceRanks P) 58)) || ((rankAtom (directSourceRanks P) 13).ult (rankAtom (directSourceRanks P) 16)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (16 : Fin 78) (37 : Fin 78)
    (13 : Fin 78) (58 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (3 : Fin 13) (6 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (35 : Fin 78) (18 : Fin 78) (16 : Fin 78)
    (37 : Fin 78) (13 : Fin 78) (58 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1111` (kalmanson). -/
theorem directSource_h1111 :
    ((!((rankAtom (directSourceRanks P) 37 == rankAtom (directSourceRanks P) 18)) || ((rankAtom (directSourceRanks P) 35).ult (rankAtom (directSourceRanks P) 16)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (16 : Fin 78) (37 : Fin 78)
    (35 : Fin 78) (18 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (3 : Fin 13) (6 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (35 : Fin 78) (18 : Fin 78) (16 : Fin 78)
    (37 : Fin 78) (13 : Fin 78) (58 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1112` (kalmanson). -/
theorem directSource_h1112 :
    ((!((rankAtom (directSourceRanks P) 37 == rankAtom (directSourceRanks P) 35)) || ((rankAtom (directSourceRanks P) 18).ult (rankAtom (directSourceRanks P) 16)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (16 : Fin 78) (37 : Fin 78)
    (18 : Fin 78) (35 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (3 : Fin 13) (6 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (35 : Fin 78) (18 : Fin 78) (16 : Fin 78)
    (37 : Fin 78) (13 : Fin 78) (58 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1113` (kalmanson). -/
theorem directSource_h1113 :
    ((!((rankAtom (directSourceRanks P) 16 == rankAtom (directSourceRanks P) 59)) || ((rankAtom (directSourceRanks P) 13).ult (rankAtom (directSourceRanks P) 38)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (38 : Fin 78) (16 : Fin 78)
    (13 : Fin 78) (59 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (3 : Fin 13) (6 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (35 : Fin 78) (19 : Fin 78) (16 : Fin 78)
    (38 : Fin 78) (13 : Fin 78) (59 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1114` (kalmanson). -/
theorem directSource_h1114 :
    ((!((rankAtom (directSourceRanks P) 16 == rankAtom (directSourceRanks P) 60)) || ((rankAtom (directSourceRanks P) 13).ult (rankAtom (directSourceRanks P) 39)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (39 : Fin 78) (16 : Fin 78)
    (13 : Fin 78) (60 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (3 : Fin 13) (6 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (35 : Fin 78) (20 : Fin 78) (16 : Fin 78)
    (39 : Fin 78) (13 : Fin 78) (60 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1115` (kalmanson). -/
theorem directSource_h1115 :
    ((!((rankAtom (directSourceRanks P) 16 == rankAtom (directSourceRanks P) 61)) || ((rankAtom (directSourceRanks P) 13).ult (rankAtom (directSourceRanks P) 40)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (40 : Fin 78) (16 : Fin 78)
    (13 : Fin 78) (61 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (3 : Fin 13) (6 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (35 : Fin 78) (21 : Fin 78) (16 : Fin 78)
    (40 : Fin 78) (13 : Fin 78) (61 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1116` (kalmanson). -/
theorem directSource_h1116 :
    ((!((rankAtom (directSourceRanks P) 16 == rankAtom (directSourceRanks P) 62)) || ((rankAtom (directSourceRanks P) 13).ult (rankAtom (directSourceRanks P) 41)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (41 : Fin 78) (16 : Fin 78)
    (13 : Fin 78) (62 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (3 : Fin 13) (6 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (35 : Fin 78) (22 : Fin 78) (16 : Fin 78)
    (41 : Fin 78) (13 : Fin 78) (62 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1117` (kalmanson). -/
theorem directSource_h1117 :
    ((!((rankAtom (directSourceRanks P) 37 == rankAtom (directSourceRanks P) 63)) || ((rankAtom (directSourceRanks P) 13).ult (rankAtom (directSourceRanks P) 17)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (17 : Fin 78) (37 : Fin 78)
    (13 : Fin 78) (63 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (3 : Fin 13) (7 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (36 : Fin 78) (18 : Fin 78) (17 : Fin 78)
    (37 : Fin 78) (13 : Fin 78) (63 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1118` (kalmanson). -/
theorem directSource_h1118 :
    ((!((rankAtom (directSourceRanks P) 37 == rankAtom (directSourceRanks P) 18)) || ((rankAtom (directSourceRanks P) 36).ult (rankAtom (directSourceRanks P) 17)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (17 : Fin 78) (37 : Fin 78)
    (36 : Fin 78) (18 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (3 : Fin 13) (7 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (36 : Fin 78) (18 : Fin 78) (17 : Fin 78)
    (37 : Fin 78) (13 : Fin 78) (63 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1119` (kalmanson). -/
theorem directSource_h1119 :
    ((!((rankAtom (directSourceRanks P) 18 == rankAtom (directSourceRanks P) 68)) || ((rankAtom (directSourceRanks P) 13).ult (rankAtom (directSourceRanks P) 38)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (38 : Fin 78) (18 : Fin 78)
    (13 : Fin 78) (68 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (3 : Fin 13) (8 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (37 : Fin 78) (19 : Fin 78) (18 : Fin 78)
    (38 : Fin 78) (13 : Fin 78) (68 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1120` (kalmanson). -/
theorem directSource_h1120 :
    ((!((rankAtom (directSourceRanks P) 18 == rankAtom (directSourceRanks P) 37)) || ((rankAtom (directSourceRanks P) 19).ult (rankAtom (directSourceRanks P) 38)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (38 : Fin 78) (18 : Fin 78)
    (19 : Fin 78) (37 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (3 : Fin 13) (8 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (37 : Fin 78) (19 : Fin 78) (18 : Fin 78)
    (38 : Fin 78) (13 : Fin 78) (68 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1121` (kalmanson). -/
theorem directSource_h1121 :
    ((!((rankAtom (directSourceRanks P) 18 == rankAtom (directSourceRanks P) 69)) || ((rankAtom (directSourceRanks P) 13).ult (rankAtom (directSourceRanks P) 39)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (39 : Fin 78) (18 : Fin 78)
    (13 : Fin 78) (69 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (3 : Fin 13) (8 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (37 : Fin 78) (20 : Fin 78) (18 : Fin 78)
    (39 : Fin 78) (13 : Fin 78) (69 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1122` (kalmanson). -/
theorem directSource_h1122 :
    ((!((rankAtom (directSourceRanks P) 18 == rankAtom (directSourceRanks P) 37)) || ((rankAtom (directSourceRanks P) 20).ult (rankAtom (directSourceRanks P) 39)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (39 : Fin 78) (18 : Fin 78)
    (20 : Fin 78) (37 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (3 : Fin 13) (8 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (37 : Fin 78) (20 : Fin 78) (18 : Fin 78)
    (39 : Fin 78) (13 : Fin 78) (69 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1123` (kalmanson). -/
theorem directSource_h1123 :
    ((!((rankAtom (directSourceRanks P) 18 == rankAtom (directSourceRanks P) 70)) || ((rankAtom (directSourceRanks P) 13).ult (rankAtom (directSourceRanks P) 40)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (40 : Fin 78) (18 : Fin 78)
    (13 : Fin 78) (70 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (3 : Fin 13) (8 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (37 : Fin 78) (21 : Fin 78) (18 : Fin 78)
    (40 : Fin 78) (13 : Fin 78) (70 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1124` (kalmanson). -/
theorem directSource_h1124 :
    ((!((rankAtom (directSourceRanks P) 18 == rankAtom (directSourceRanks P) 37)) || ((rankAtom (directSourceRanks P) 21).ult (rankAtom (directSourceRanks P) 40)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (40 : Fin 78) (18 : Fin 78)
    (21 : Fin 78) (37 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (3 : Fin 13) (8 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (37 : Fin 78) (21 : Fin 78) (18 : Fin 78)
    (40 : Fin 78) (13 : Fin 78) (70 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1125` (kalmanson). -/
theorem directSource_h1125 :
    ((!((rankAtom (directSourceRanks P) 18 == rankAtom (directSourceRanks P) 71)) || ((rankAtom (directSourceRanks P) 13).ult (rankAtom (directSourceRanks P) 41)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (41 : Fin 78) (18 : Fin 78)
    (13 : Fin 78) (71 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (3 : Fin 13) (8 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (37 : Fin 78) (22 : Fin 78) (18 : Fin 78)
    (41 : Fin 78) (13 : Fin 78) (71 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1126` (kalmanson). -/
theorem directSource_h1126 :
    ((!((rankAtom (directSourceRanks P) 18 == rankAtom (directSourceRanks P) 37)) || ((rankAtom (directSourceRanks P) 22).ult (rankAtom (directSourceRanks P) 41)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (41 : Fin 78) (18 : Fin 78)
    (22 : Fin 78) (37 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (3 : Fin 13) (8 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (37 : Fin 78) (22 : Fin 78) (18 : Fin 78)
    (41 : Fin 78) (13 : Fin 78) (71 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1127` (kalmanson). -/
theorem directSource_h1127 :
    ((!((rankAtom (directSourceRanks P) 15 == rankAtom (directSourceRanks P) 50)) || ((rankAtom (directSourceRanks P) 14).ult (rankAtom (directSourceRanks P) 43)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (43 : Fin 78) (15 : Fin 78)
    (14 : Fin 78) (50 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (5 : Fin 13) (6 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (16 : Fin 78) (15 : Fin 78)
    (43 : Fin 78) (14 : Fin 78) (50 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1128` (kalmanson). -/
theorem directSource_h1128 :
    ((!((rankAtom (directSourceRanks P) 43 == rankAtom (directSourceRanks P) 50)) || ((rankAtom (directSourceRanks P) 14).ult (rankAtom (directSourceRanks P) 15)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (15 : Fin 78) (43 : Fin 78)
    (14 : Fin 78) (50 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (5 : Fin 13) (6 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (16 : Fin 78) (15 : Fin 78)
    (43 : Fin 78) (14 : Fin 78) (50 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1129` (kalmanson). -/
theorem directSource_h1129 :
    ((!((rankAtom (directSourceRanks P) 15 == rankAtom (directSourceRanks P) 42)) || ((rankAtom (directSourceRanks P) 16).ult (rankAtom (directSourceRanks P) 43)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (43 : Fin 78) (15 : Fin 78)
    (16 : Fin 78) (42 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (5 : Fin 13) (6 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (16 : Fin 78) (15 : Fin 78)
    (43 : Fin 78) (14 : Fin 78) (50 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1130` (kalmanson). -/
theorem directSource_h1130 :
    ((!((rankAtom (directSourceRanks P) 43 == rankAtom (directSourceRanks P) 16)) || ((rankAtom (directSourceRanks P) 42).ult (rankAtom (directSourceRanks P) 15)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (15 : Fin 78) (43 : Fin 78)
    (42 : Fin 78) (16 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (5 : Fin 13) (6 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (16 : Fin 78) (15 : Fin 78)
    (43 : Fin 78) (14 : Fin 78) (50 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1131` (kalmanson). -/
theorem directSource_h1131 :
    ((!((rankAtom (directSourceRanks P) 43 == rankAtom (directSourceRanks P) 42)) || ((rankAtom (directSourceRanks P) 16).ult (rankAtom (directSourceRanks P) 15)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (15 : Fin 78) (43 : Fin 78)
    (16 : Fin 78) (42 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (5 : Fin 13) (6 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (16 : Fin 78) (15 : Fin 78)
    (43 : Fin 78) (14 : Fin 78) (50 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1132` (kalmanson). -/
theorem directSource_h1132 :
    ((!((rankAtom (directSourceRanks P) 15 == rankAtom (directSourceRanks P) 51)) || ((rankAtom (directSourceRanks P) 14).ult (rankAtom (directSourceRanks P) 44)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (44 : Fin 78) (15 : Fin 78)
    (14 : Fin 78) (51 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (5 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (17 : Fin 78) (15 : Fin 78)
    (44 : Fin 78) (14 : Fin 78) (51 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1133` (kalmanson). -/
theorem directSource_h1133 :
    ((!((rankAtom (directSourceRanks P) 15 == rankAtom (directSourceRanks P) 42)) || ((rankAtom (directSourceRanks P) 17).ult (rankAtom (directSourceRanks P) 44)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (44 : Fin 78) (15 : Fin 78)
    (17 : Fin 78) (42 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (5 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (17 : Fin 78) (15 : Fin 78)
    (44 : Fin 78) (14 : Fin 78) (51 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1134` (kalmanson). -/
theorem directSource_h1134 :
    ((!((rankAtom (directSourceRanks P) 15 == rankAtom (directSourceRanks P) 52)) || ((rankAtom (directSourceRanks P) 14).ult (rankAtom (directSourceRanks P) 45)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (45 : Fin 78) (15 : Fin 78)
    (14 : Fin 78) (52 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (5 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (18 : Fin 78) (15 : Fin 78)
    (45 : Fin 78) (14 : Fin 78) (52 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1135` (kalmanson). -/
theorem directSource_h1135 :
    ((!((rankAtom (directSourceRanks P) 15 == rankAtom (directSourceRanks P) 42)) || ((rankAtom (directSourceRanks P) 18).ult (rankAtom (directSourceRanks P) 45)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (45 : Fin 78) (15 : Fin 78)
    (18 : Fin 78) (42 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (5 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (18 : Fin 78) (15 : Fin 78)
    (45 : Fin 78) (14 : Fin 78) (52 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1136` (kalmanson). -/
theorem directSource_h1136 :
    ((!((rankAtom (directSourceRanks P) 45 == rankAtom (directSourceRanks P) 18)) || ((rankAtom (directSourceRanks P) 42).ult (rankAtom (directSourceRanks P) 15)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (15 : Fin 78) (45 : Fin 78)
    (42 : Fin 78) (18 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (5 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (18 : Fin 78) (15 : Fin 78)
    (45 : Fin 78) (14 : Fin 78) (52 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1137` (kalmanson). -/
theorem directSource_h1137 :
    ((!((rankAtom (directSourceRanks P) 46 == rankAtom (directSourceRanks P) 14)) || ((rankAtom (directSourceRanks P) 53).ult (rankAtom (directSourceRanks P) 15)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (15 : Fin 78) (46 : Fin 78)
    (53 : Fin 78) (14 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (5 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (19 : Fin 78) (15 : Fin 78)
    (46 : Fin 78) (14 : Fin 78) (53 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1138` (kalmanson). -/
theorem directSource_h1138 :
    ((!((rankAtom (directSourceRanks P) 46 == rankAtom (directSourceRanks P) 53)) || ((rankAtom (directSourceRanks P) 14).ult (rankAtom (directSourceRanks P) 15)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (15 : Fin 78) (46 : Fin 78)
    (14 : Fin 78) (53 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (5 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (19 : Fin 78) (15 : Fin 78)
    (46 : Fin 78) (14 : Fin 78) (53 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1139` (kalmanson). -/
theorem directSource_h1139 :
    ((!((rankAtom (directSourceRanks P) 15 == rankAtom (directSourceRanks P) 42)) || ((rankAtom (directSourceRanks P) 19).ult (rankAtom (directSourceRanks P) 46)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (46 : Fin 78) (15 : Fin 78)
    (19 : Fin 78) (42 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (5 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (19 : Fin 78) (15 : Fin 78)
    (46 : Fin 78) (14 : Fin 78) (53 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1140` (kalmanson). -/
theorem directSource_h1140 :
    ((!((rankAtom (directSourceRanks P) 46 == rankAtom (directSourceRanks P) 42)) || ((rankAtom (directSourceRanks P) 19).ult (rankAtom (directSourceRanks P) 15)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (15 : Fin 78) (46 : Fin 78)
    (19 : Fin 78) (42 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (5 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (19 : Fin 78) (15 : Fin 78)
    (46 : Fin 78) (14 : Fin 78) (53 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1141` (kalmanson). -/
theorem directSource_h1141 :
    ((!((rankAtom (directSourceRanks P) 47 == rankAtom (directSourceRanks P) 14)) || ((rankAtom (directSourceRanks P) 54).ult (rankAtom (directSourceRanks P) 15)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (15 : Fin 78) (47 : Fin 78)
    (54 : Fin 78) (14 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (5 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (20 : Fin 78) (15 : Fin 78)
    (47 : Fin 78) (14 : Fin 78) (54 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1142` (kalmanson). -/
theorem directSource_h1142 :
    ((!((rankAtom (directSourceRanks P) 47 == rankAtom (directSourceRanks P) 54)) || ((rankAtom (directSourceRanks P) 14).ult (rankAtom (directSourceRanks P) 15)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (15 : Fin 78) (47 : Fin 78)
    (14 : Fin 78) (54 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (5 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (20 : Fin 78) (15 : Fin 78)
    (47 : Fin 78) (14 : Fin 78) (54 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1143` (kalmanson). -/
theorem directSource_h1143 :
    ((!((rankAtom (directSourceRanks P) 47 == rankAtom (directSourceRanks P) 42)) || ((rankAtom (directSourceRanks P) 20).ult (rankAtom (directSourceRanks P) 15)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (15 : Fin 78) (47 : Fin 78)
    (20 : Fin 78) (42 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (5 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (20 : Fin 78) (15 : Fin 78)
    (47 : Fin 78) (14 : Fin 78) (54 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1144` (kalmanson). -/
theorem directSource_h1144 :
    ((!((rankAtom (directSourceRanks P) 48 == rankAtom (directSourceRanks P) 14)) || ((rankAtom (directSourceRanks P) 55).ult (rankAtom (directSourceRanks P) 15)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (15 : Fin 78) (48 : Fin 78)
    (55 : Fin 78) (14 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (5 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (21 : Fin 78) (15 : Fin 78)
    (48 : Fin 78) (14 : Fin 78) (55 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1145` (kalmanson). -/
theorem directSource_h1145 :
    ((!((rankAtom (directSourceRanks P) 48 == rankAtom (directSourceRanks P) 55)) || ((rankAtom (directSourceRanks P) 14).ult (rankAtom (directSourceRanks P) 15)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (15 : Fin 78) (48 : Fin 78)
    (14 : Fin 78) (55 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (5 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (21 : Fin 78) (15 : Fin 78)
    (48 : Fin 78) (14 : Fin 78) (55 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1146` (kalmanson). -/
theorem directSource_h1146 :
    ((!((rankAtom (directSourceRanks P) 48 == rankAtom (directSourceRanks P) 42)) || ((rankAtom (directSourceRanks P) 21).ult (rankAtom (directSourceRanks P) 15)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (15 : Fin 78) (48 : Fin 78)
    (21 : Fin 78) (42 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (5 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (21 : Fin 78) (15 : Fin 78)
    (48 : Fin 78) (14 : Fin 78) (55 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1147` (kalmanson). -/
theorem directSource_h1147 :
    ((!((rankAtom (directSourceRanks P) 15 == rankAtom (directSourceRanks P) 56)) || ((rankAtom (directSourceRanks P) 14).ult (rankAtom (directSourceRanks P) 49)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (49 : Fin 78) (15 : Fin 78)
    (14 : Fin 78) (56 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (5 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (22 : Fin 78) (15 : Fin 78)
    (49 : Fin 78) (14 : Fin 78) (56 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1148` (kalmanson). -/
theorem directSource_h1148 :
    ((!((rankAtom (directSourceRanks P) 49 == rankAtom (directSourceRanks P) 14)) || ((rankAtom (directSourceRanks P) 56).ult (rankAtom (directSourceRanks P) 15)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (15 : Fin 78) (49 : Fin 78)
    (56 : Fin 78) (14 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (5 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (22 : Fin 78) (15 : Fin 78)
    (49 : Fin 78) (14 : Fin 78) (56 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1149` (kalmanson). -/
theorem directSource_h1149 :
    ((!((rankAtom (directSourceRanks P) 49 == rankAtom (directSourceRanks P) 56)) || ((rankAtom (directSourceRanks P) 14).ult (rankAtom (directSourceRanks P) 15)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (15 : Fin 78) (49 : Fin 78)
    (14 : Fin 78) (56 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (5 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (22 : Fin 78) (15 : Fin 78)
    (49 : Fin 78) (14 : Fin 78) (56 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1150` (kalmanson). -/
theorem directSource_h1150 :
    ((!((rankAtom (directSourceRanks P) 49 == rankAtom (directSourceRanks P) 42)) || ((rankAtom (directSourceRanks P) 22).ult (rankAtom (directSourceRanks P) 15)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (15 : Fin 78) (49 : Fin 78)
    (22 : Fin 78) (42 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (5 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (22 : Fin 78) (15 : Fin 78)
    (49 : Fin 78) (14 : Fin 78) (56 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1151` (kalmanson). -/
theorem directSource_h1151 :
    ((!((rankAtom (directSourceRanks P) 16 == rankAtom (directSourceRanks P) 57)) || ((rankAtom (directSourceRanks P) 14).ult (rankAtom (directSourceRanks P) 44)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (44 : Fin 78) (16 : Fin 78)
    (14 : Fin 78) (57 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (6 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (43 : Fin 78) (17 : Fin 78) (16 : Fin 78)
    (44 : Fin 78) (14 : Fin 78) (57 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

end

end ATailExactFiveCard13CnfIngressScratch
end Problem97
