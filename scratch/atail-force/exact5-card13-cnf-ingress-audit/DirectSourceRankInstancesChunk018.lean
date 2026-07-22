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

/-- Exact pass-5 source assertion `h1152` (kalmanson). -/
theorem directSource_h1152 :
    ((!((rankAtom (directSourceRanks P) 16 == rankAtom (directSourceRanks P) 43)) || ((rankAtom (directSourceRanks P) 17).ult (rankAtom (directSourceRanks P) 44)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (44 : Fin 78) (16 : Fin 78)
    (17 : Fin 78) (43 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (6 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (43 : Fin 78) (17 : Fin 78) (16 : Fin 78)
    (44 : Fin 78) (14 : Fin 78) (57 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1153` (kalmanson). -/
theorem directSource_h1153 :
    ((!((rankAtom (directSourceRanks P) 16 == rankAtom (directSourceRanks P) 58)) || ((rankAtom (directSourceRanks P) 14).ult (rankAtom (directSourceRanks P) 45)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (45 : Fin 78) (16 : Fin 78)
    (14 : Fin 78) (58 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (6 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (43 : Fin 78) (18 : Fin 78) (16 : Fin 78)
    (45 : Fin 78) (14 : Fin 78) (58 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1154` (kalmanson). -/
theorem directSource_h1154 :
    ((!((rankAtom (directSourceRanks P) 16 == rankAtom (directSourceRanks P) 43)) || ((rankAtom (directSourceRanks P) 18).ult (rankAtom (directSourceRanks P) 45)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (45 : Fin 78) (16 : Fin 78)
    (18 : Fin 78) (43 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (6 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (43 : Fin 78) (18 : Fin 78) (16 : Fin 78)
    (45 : Fin 78) (14 : Fin 78) (58 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1155` (kalmanson). -/
theorem directSource_h1155 :
    ((!((rankAtom (directSourceRanks P) 45 == rankAtom (directSourceRanks P) 18)) || ((rankAtom (directSourceRanks P) 43).ult (rankAtom (directSourceRanks P) 16)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (16 : Fin 78) (45 : Fin 78)
    (43 : Fin 78) (18 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (6 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (43 : Fin 78) (18 : Fin 78) (16 : Fin 78)
    (45 : Fin 78) (14 : Fin 78) (58 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1156` (kalmanson). -/
theorem directSource_h1156 :
    ((!((rankAtom (directSourceRanks P) 46 == rankAtom (directSourceRanks P) 14)) || ((rankAtom (directSourceRanks P) 59).ult (rankAtom (directSourceRanks P) 16)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (16 : Fin 78) (46 : Fin 78)
    (59 : Fin 78) (14 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (6 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (43 : Fin 78) (19 : Fin 78) (16 : Fin 78)
    (46 : Fin 78) (14 : Fin 78) (59 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1157` (kalmanson). -/
theorem directSource_h1157 :
    ((!((rankAtom (directSourceRanks P) 16 == rankAtom (directSourceRanks P) 43)) || ((rankAtom (directSourceRanks P) 19).ult (rankAtom (directSourceRanks P) 46)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (46 : Fin 78) (16 : Fin 78)
    (19 : Fin 78) (43 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (6 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (43 : Fin 78) (19 : Fin 78) (16 : Fin 78)
    (46 : Fin 78) (14 : Fin 78) (59 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1158` (kalmanson). -/
theorem directSource_h1158 :
    ((!((rankAtom (directSourceRanks P) 46 == rankAtom (directSourceRanks P) 43)) || ((rankAtom (directSourceRanks P) 19).ult (rankAtom (directSourceRanks P) 16)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (16 : Fin 78) (46 : Fin 78)
    (19 : Fin 78) (43 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (6 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (43 : Fin 78) (19 : Fin 78) (16 : Fin 78)
    (46 : Fin 78) (14 : Fin 78) (59 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1159` (kalmanson). -/
theorem directSource_h1159 :
    ((!((rankAtom (directSourceRanks P) 16 == rankAtom (directSourceRanks P) 60)) || ((rankAtom (directSourceRanks P) 14).ult (rankAtom (directSourceRanks P) 47)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (47 : Fin 78) (16 : Fin 78)
    (14 : Fin 78) (60 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (6 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (43 : Fin 78) (20 : Fin 78) (16 : Fin 78)
    (47 : Fin 78) (14 : Fin 78) (60 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1160` (kalmanson). -/
theorem directSource_h1160 :
    ((!((rankAtom (directSourceRanks P) 47 == rankAtom (directSourceRanks P) 14)) || ((rankAtom (directSourceRanks P) 60).ult (rankAtom (directSourceRanks P) 16)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (16 : Fin 78) (47 : Fin 78)
    (60 : Fin 78) (14 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (6 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (43 : Fin 78) (20 : Fin 78) (16 : Fin 78)
    (47 : Fin 78) (14 : Fin 78) (60 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1161` (kalmanson). -/
theorem directSource_h1161 :
    ((!((rankAtom (directSourceRanks P) 47 == rankAtom (directSourceRanks P) 43)) || ((rankAtom (directSourceRanks P) 20).ult (rankAtom (directSourceRanks P) 16)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (16 : Fin 78) (47 : Fin 78)
    (20 : Fin 78) (43 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (6 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (43 : Fin 78) (20 : Fin 78) (16 : Fin 78)
    (47 : Fin 78) (14 : Fin 78) (60 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1162` (kalmanson). -/
theorem directSource_h1162 :
    ((!((rankAtom (directSourceRanks P) 16 == rankAtom (directSourceRanks P) 61)) || ((rankAtom (directSourceRanks P) 14).ult (rankAtom (directSourceRanks P) 48)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (48 : Fin 78) (16 : Fin 78)
    (14 : Fin 78) (61 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (6 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (43 : Fin 78) (21 : Fin 78) (16 : Fin 78)
    (48 : Fin 78) (14 : Fin 78) (61 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1163` (kalmanson). -/
theorem directSource_h1163 :
    ((!((rankAtom (directSourceRanks P) 48 == rankAtom (directSourceRanks P) 14)) || ((rankAtom (directSourceRanks P) 61).ult (rankAtom (directSourceRanks P) 16)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (16 : Fin 78) (48 : Fin 78)
    (61 : Fin 78) (14 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (6 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (43 : Fin 78) (21 : Fin 78) (16 : Fin 78)
    (48 : Fin 78) (14 : Fin 78) (61 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1164` (kalmanson). -/
theorem directSource_h1164 :
    ((!((rankAtom (directSourceRanks P) 48 == rankAtom (directSourceRanks P) 61)) || ((rankAtom (directSourceRanks P) 14).ult (rankAtom (directSourceRanks P) 16)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (16 : Fin 78) (48 : Fin 78)
    (14 : Fin 78) (61 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (6 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (43 : Fin 78) (21 : Fin 78) (16 : Fin 78)
    (48 : Fin 78) (14 : Fin 78) (61 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1165` (kalmanson). -/
theorem directSource_h1165 :
    ((!((rankAtom (directSourceRanks P) 48 == rankAtom (directSourceRanks P) 43)) || ((rankAtom (directSourceRanks P) 21).ult (rankAtom (directSourceRanks P) 16)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (16 : Fin 78) (48 : Fin 78)
    (21 : Fin 78) (43 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (6 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (43 : Fin 78) (21 : Fin 78) (16 : Fin 78)
    (48 : Fin 78) (14 : Fin 78) (61 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1166` (kalmanson). -/
theorem directSource_h1166 :
    ((!((rankAtom (directSourceRanks P) 16 == rankAtom (directSourceRanks P) 62)) || ((rankAtom (directSourceRanks P) 14).ult (rankAtom (directSourceRanks P) 49)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (49 : Fin 78) (16 : Fin 78)
    (14 : Fin 78) (62 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (6 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (43 : Fin 78) (22 : Fin 78) (16 : Fin 78)
    (49 : Fin 78) (14 : Fin 78) (62 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1167` (kalmanson). -/
theorem directSource_h1167 :
    ((!((rankAtom (directSourceRanks P) 49 == rankAtom (directSourceRanks P) 14)) || ((rankAtom (directSourceRanks P) 62).ult (rankAtom (directSourceRanks P) 16)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (16 : Fin 78) (49 : Fin 78)
    (62 : Fin 78) (14 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (6 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (43 : Fin 78) (22 : Fin 78) (16 : Fin 78)
    (49 : Fin 78) (14 : Fin 78) (62 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1168` (kalmanson). -/
theorem directSource_h1168 :
    ((!((rankAtom (directSourceRanks P) 49 == rankAtom (directSourceRanks P) 43)) || ((rankAtom (directSourceRanks P) 22).ult (rankAtom (directSourceRanks P) 16)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (16 : Fin 78) (49 : Fin 78)
    (22 : Fin 78) (43 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (6 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (43 : Fin 78) (22 : Fin 78) (16 : Fin 78)
    (49 : Fin 78) (14 : Fin 78) (62 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1169` (kalmanson). -/
theorem directSource_h1169 :
    ((!((rankAtom (directSourceRanks P) 45 == rankAtom (directSourceRanks P) 18)) || ((rankAtom (directSourceRanks P) 44).ult (rankAtom (directSourceRanks P) 17)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (17 : Fin 78) (45 : Fin 78)
    (44 : Fin 78) (18 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (7 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (44 : Fin 78) (18 : Fin 78) (17 : Fin 78)
    (45 : Fin 78) (14 : Fin 78) (63 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1170` (kalmanson). -/
theorem directSource_h1170 :
    ((!((rankAtom (directSourceRanks P) 46 == rankAtom (directSourceRanks P) 14)) || ((rankAtom (directSourceRanks P) 64).ult (rankAtom (directSourceRanks P) 17)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (17 : Fin 78) (46 : Fin 78)
    (64 : Fin 78) (14 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (7 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (44 : Fin 78) (19 : Fin 78) (17 : Fin 78)
    (46 : Fin 78) (14 : Fin 78) (64 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1171` (kalmanson). -/
theorem directSource_h1171 :
    ((!((rankAtom (directSourceRanks P) 46 == rankAtom (directSourceRanks P) 44)) || ((rankAtom (directSourceRanks P) 19).ult (rankAtom (directSourceRanks P) 17)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (17 : Fin 78) (46 : Fin 78)
    (19 : Fin 78) (44 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (7 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (44 : Fin 78) (19 : Fin 78) (17 : Fin 78)
    (46 : Fin 78) (14 : Fin 78) (64 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1172` (kalmanson). -/
theorem directSource_h1172 :
    ((!((rankAtom (directSourceRanks P) 47 == rankAtom (directSourceRanks P) 14)) || ((rankAtom (directSourceRanks P) 65).ult (rankAtom (directSourceRanks P) 17)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (17 : Fin 78) (47 : Fin 78)
    (65 : Fin 78) (14 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (7 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (44 : Fin 78) (20 : Fin 78) (17 : Fin 78)
    (47 : Fin 78) (14 : Fin 78) (65 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1173` (kalmanson). -/
theorem directSource_h1173 :
    ((!((rankAtom (directSourceRanks P) 47 == rankAtom (directSourceRanks P) 44)) || ((rankAtom (directSourceRanks P) 20).ult (rankAtom (directSourceRanks P) 17)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (17 : Fin 78) (47 : Fin 78)
    (20 : Fin 78) (44 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (7 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (44 : Fin 78) (20 : Fin 78) (17 : Fin 78)
    (47 : Fin 78) (14 : Fin 78) (65 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1174` (kalmanson). -/
theorem directSource_h1174 :
    ((!((rankAtom (directSourceRanks P) 48 == rankAtom (directSourceRanks P) 14)) || ((rankAtom (directSourceRanks P) 66).ult (rankAtom (directSourceRanks P) 17)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (17 : Fin 78) (48 : Fin 78)
    (66 : Fin 78) (14 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (7 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (44 : Fin 78) (21 : Fin 78) (17 : Fin 78)
    (48 : Fin 78) (14 : Fin 78) (66 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1175` (kalmanson). -/
theorem directSource_h1175 :
    ((!((rankAtom (directSourceRanks P) 48 == rankAtom (directSourceRanks P) 44)) || ((rankAtom (directSourceRanks P) 21).ult (rankAtom (directSourceRanks P) 17)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (17 : Fin 78) (48 : Fin 78)
    (21 : Fin 78) (44 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (7 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (44 : Fin 78) (21 : Fin 78) (17 : Fin 78)
    (48 : Fin 78) (14 : Fin 78) (66 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1176` (kalmanson). -/
theorem directSource_h1176 :
    ((!((rankAtom (directSourceRanks P) 49 == rankAtom (directSourceRanks P) 14)) || ((rankAtom (directSourceRanks P) 67).ult (rankAtom (directSourceRanks P) 17)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (17 : Fin 78) (49 : Fin 78)
    (67 : Fin 78) (14 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (7 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (44 : Fin 78) (22 : Fin 78) (17 : Fin 78)
    (49 : Fin 78) (14 : Fin 78) (67 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1177` (kalmanson). -/
theorem directSource_h1177 :
    ((!((rankAtom (directSourceRanks P) 18 == rankAtom (directSourceRanks P) 45)) || ((rankAtom (directSourceRanks P) 19).ult (rankAtom (directSourceRanks P) 46)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (46 : Fin 78) (18 : Fin 78)
    (19 : Fin 78) (45 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (8 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (45 : Fin 78) (19 : Fin 78) (18 : Fin 78)
    (46 : Fin 78) (14 : Fin 78) (68 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1178` (kalmanson). -/
theorem directSource_h1178 :
    ((!((rankAtom (directSourceRanks P) 46 == rankAtom (directSourceRanks P) 45)) || ((rankAtom (directSourceRanks P) 19).ult (rankAtom (directSourceRanks P) 18)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (18 : Fin 78) (46 : Fin 78)
    (19 : Fin 78) (45 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (8 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (45 : Fin 78) (19 : Fin 78) (18 : Fin 78)
    (46 : Fin 78) (14 : Fin 78) (68 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1179` (kalmanson). -/
theorem directSource_h1179 :
    ((!((rankAtom (directSourceRanks P) 47 == rankAtom (directSourceRanks P) 14)) || ((rankAtom (directSourceRanks P) 69).ult (rankAtom (directSourceRanks P) 18)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (18 : Fin 78) (47 : Fin 78)
    (69 : Fin 78) (14 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (8 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (45 : Fin 78) (20 : Fin 78) (18 : Fin 78)
    (47 : Fin 78) (14 : Fin 78) (69 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1180` (kalmanson). -/
theorem directSource_h1180 :
    ((!((rankAtom (directSourceRanks P) 18 == rankAtom (directSourceRanks P) 45)) || ((rankAtom (directSourceRanks P) 20).ult (rankAtom (directSourceRanks P) 47)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (47 : Fin 78) (18 : Fin 78)
    (20 : Fin 78) (45 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (8 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (45 : Fin 78) (20 : Fin 78) (18 : Fin 78)
    (47 : Fin 78) (14 : Fin 78) (69 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1181` (kalmanson). -/
theorem directSource_h1181 :
    ((!((rankAtom (directSourceRanks P) 47 == rankAtom (directSourceRanks P) 45)) || ((rankAtom (directSourceRanks P) 20).ult (rankAtom (directSourceRanks P) 18)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (18 : Fin 78) (47 : Fin 78)
    (20 : Fin 78) (45 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (8 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (45 : Fin 78) (20 : Fin 78) (18 : Fin 78)
    (47 : Fin 78) (14 : Fin 78) (69 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1182` (kalmanson). -/
theorem directSource_h1182 :
    ((!((rankAtom (directSourceRanks P) 48 == rankAtom (directSourceRanks P) 14)) || ((rankAtom (directSourceRanks P) 70).ult (rankAtom (directSourceRanks P) 18)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (18 : Fin 78) (48 : Fin 78)
    (70 : Fin 78) (14 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (8 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (45 : Fin 78) (21 : Fin 78) (18 : Fin 78)
    (48 : Fin 78) (14 : Fin 78) (70 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1183` (kalmanson). -/
theorem directSource_h1183 :
    ((!((rankAtom (directSourceRanks P) 18 == rankAtom (directSourceRanks P) 45)) || ((rankAtom (directSourceRanks P) 21).ult (rankAtom (directSourceRanks P) 48)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (48 : Fin 78) (18 : Fin 78)
    (21 : Fin 78) (45 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (8 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (45 : Fin 78) (21 : Fin 78) (18 : Fin 78)
    (48 : Fin 78) (14 : Fin 78) (70 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1184` (kalmanson). -/
theorem directSource_h1184 :
    ((!((rankAtom (directSourceRanks P) 48 == rankAtom (directSourceRanks P) 45)) || ((rankAtom (directSourceRanks P) 21).ult (rankAtom (directSourceRanks P) 18)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (18 : Fin 78) (48 : Fin 78)
    (21 : Fin 78) (45 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (8 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (45 : Fin 78) (21 : Fin 78) (18 : Fin 78)
    (48 : Fin 78) (14 : Fin 78) (70 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1185` (kalmanson). -/
theorem directSource_h1185 :
    ((!((rankAtom (directSourceRanks P) 18 == rankAtom (directSourceRanks P) 71)) || ((rankAtom (directSourceRanks P) 14).ult (rankAtom (directSourceRanks P) 49)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (49 : Fin 78) (18 : Fin 78)
    (14 : Fin 78) (71 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (8 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (45 : Fin 78) (22 : Fin 78) (18 : Fin 78)
    (49 : Fin 78) (14 : Fin 78) (71 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1186` (kalmanson). -/
theorem directSource_h1186 :
    ((!((rankAtom (directSourceRanks P) 49 == rankAtom (directSourceRanks P) 14)) || ((rankAtom (directSourceRanks P) 71).ult (rankAtom (directSourceRanks P) 18)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (18 : Fin 78) (49 : Fin 78)
    (71 : Fin 78) (14 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (8 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (45 : Fin 78) (22 : Fin 78) (18 : Fin 78)
    (49 : Fin 78) (14 : Fin 78) (71 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1187` (kalmanson). -/
theorem directSource_h1187 :
    ((!((rankAtom (directSourceRanks P) 18 == rankAtom (directSourceRanks P) 45)) || ((rankAtom (directSourceRanks P) 22).ult (rankAtom (directSourceRanks P) 49)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (49 : Fin 78) (18 : Fin 78)
    (22 : Fin 78) (45 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (8 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (45 : Fin 78) (22 : Fin 78) (18 : Fin 78)
    (49 : Fin 78) (14 : Fin 78) (71 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1188` (kalmanson). -/
theorem directSource_h1188 :
    ((!((rankAtom (directSourceRanks P) 49 == rankAtom (directSourceRanks P) 45)) || ((rankAtom (directSourceRanks P) 22).ult (rankAtom (directSourceRanks P) 18)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (18 : Fin 78) (49 : Fin 78)
    (22 : Fin 78) (45 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (8 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (45 : Fin 78) (22 : Fin 78) (18 : Fin 78)
    (49 : Fin 78) (14 : Fin 78) (71 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1189` (kalmanson). -/
theorem directSource_h1189 :
    ((!((rankAtom (directSourceRanks P) 47 == rankAtom (directSourceRanks P) 46)) || ((rankAtom (directSourceRanks P) 20).ult (rankAtom (directSourceRanks P) 19)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (19 : Fin 78) (47 : Fin 78)
    (20 : Fin 78) (46 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (9 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (46 : Fin 78) (20 : Fin 78) (19 : Fin 78)
    (47 : Fin 78) (14 : Fin 78) (72 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1190` (kalmanson). -/
theorem directSource_h1190 :
    ((!((rankAtom (directSourceRanks P) 48 == rankAtom (directSourceRanks P) 46)) || ((rankAtom (directSourceRanks P) 21).ult (rankAtom (directSourceRanks P) 19)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (19 : Fin 78) (48 : Fin 78)
    (21 : Fin 78) (46 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (9 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (46 : Fin 78) (21 : Fin 78) (19 : Fin 78)
    (48 : Fin 78) (14 : Fin 78) (73 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1191` (kalmanson). -/
theorem directSource_h1191 :
    ((!((rankAtom (directSourceRanks P) 49 == rankAtom (directSourceRanks P) 46)) || ((rankAtom (directSourceRanks P) 22).ult (rankAtom (directSourceRanks P) 19)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (19 : Fin 78) (49 : Fin 78)
    (22 : Fin 78) (46 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (9 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (46 : Fin 78) (22 : Fin 78) (19 : Fin 78)
    (49 : Fin 78) (14 : Fin 78) (74 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1192` (kalmanson). -/
theorem directSource_h1192 :
    ((!((rankAtom (directSourceRanks P) 48 == rankAtom (directSourceRanks P) 47)) || ((rankAtom (directSourceRanks P) 21).ult (rankAtom (directSourceRanks P) 20)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (20 : Fin 78) (48 : Fin 78)
    (21 : Fin 78) (47 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (10 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (47 : Fin 78) (21 : Fin 78) (20 : Fin 78)
    (48 : Fin 78) (14 : Fin 78) (75 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1193` (kalmanson). -/
theorem directSource_h1193 :
    ((!((rankAtom (directSourceRanks P) 49 == rankAtom (directSourceRanks P) 47)) || ((rankAtom (directSourceRanks P) 22).ult (rankAtom (directSourceRanks P) 20)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (20 : Fin 78) (49 : Fin 78)
    (22 : Fin 78) (47 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (10 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (47 : Fin 78) (22 : Fin 78) (20 : Fin 78)
    (49 : Fin 78) (14 : Fin 78) (76 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1194` (kalmanson). -/
theorem directSource_h1194 :
    ((!((rankAtom (directSourceRanks P) 49 == rankAtom (directSourceRanks P) 48)) || ((rankAtom (directSourceRanks P) 22).ult (rankAtom (directSourceRanks P) 21)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (21 : Fin 78) (49 : Fin 78)
    (22 : Fin 78) (48 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (11 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (48 : Fin 78) (22 : Fin 78) (21 : Fin 78)
    (49 : Fin 78) (14 : Fin 78) (77 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1195` (kalmanson). -/
theorem directSource_h1195 :
    ((!((rankAtom (directSourceRanks P) 16 == rankAtom (directSourceRanks P) 57)) || ((rankAtom (directSourceRanks P) 15).ult (rankAtom (directSourceRanks P) 51)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (51 : Fin 78) (16 : Fin 78)
    (15 : Fin 78) (57 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (5 : Fin 13) (6 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (17 : Fin 78) (16 : Fin 78)
    (51 : Fin 78) (15 : Fin 78) (57 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1196` (kalmanson). -/
theorem directSource_h1196 :
    ((!((rankAtom (directSourceRanks P) 51 == rankAtom (directSourceRanks P) 15)) || ((rankAtom (directSourceRanks P) 57).ult (rankAtom (directSourceRanks P) 16)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (16 : Fin 78) (51 : Fin 78)
    (57 : Fin 78) (15 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (5 : Fin 13) (6 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (17 : Fin 78) (16 : Fin 78)
    (51 : Fin 78) (15 : Fin 78) (57 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1197` (kalmanson). -/
theorem directSource_h1197 :
    ((!((rankAtom (directSourceRanks P) 16 == rankAtom (directSourceRanks P) 50)) || ((rankAtom (directSourceRanks P) 17).ult (rankAtom (directSourceRanks P) 51)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (51 : Fin 78) (16 : Fin 78)
    (17 : Fin 78) (50 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (5 : Fin 13) (6 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (17 : Fin 78) (16 : Fin 78)
    (51 : Fin 78) (15 : Fin 78) (57 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1198` (kalmanson). -/
theorem directSource_h1198 :
    ((!((rankAtom (directSourceRanks P) 51 == rankAtom (directSourceRanks P) 50)) || ((rankAtom (directSourceRanks P) 17).ult (rankAtom (directSourceRanks P) 16)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (16 : Fin 78) (51 : Fin 78)
    (17 : Fin 78) (50 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (5 : Fin 13) (6 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (17 : Fin 78) (16 : Fin 78)
    (51 : Fin 78) (15 : Fin 78) (57 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1199` (kalmanson). -/
theorem directSource_h1199 :
    ((!((rankAtom (directSourceRanks P) 16 == rankAtom (directSourceRanks P) 58)) || ((rankAtom (directSourceRanks P) 15).ult (rankAtom (directSourceRanks P) 52)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (52 : Fin 78) (16 : Fin 78)
    (15 : Fin 78) (58 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (5 : Fin 13) (6 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (18 : Fin 78) (16 : Fin 78)
    (52 : Fin 78) (15 : Fin 78) (58 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1200` (kalmanson). -/
theorem directSource_h1200 :
    ((!((rankAtom (directSourceRanks P) 52 == rankAtom (directSourceRanks P) 58)) || ((rankAtom (directSourceRanks P) 15).ult (rankAtom (directSourceRanks P) 16)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (16 : Fin 78) (52 : Fin 78)
    (15 : Fin 78) (58 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (5 : Fin 13) (6 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (18 : Fin 78) (16 : Fin 78)
    (52 : Fin 78) (15 : Fin 78) (58 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1201` (kalmanson). -/
theorem directSource_h1201 :
    ((!((rankAtom (directSourceRanks P) 16 == rankAtom (directSourceRanks P) 18)) || ((rankAtom (directSourceRanks P) 50).ult (rankAtom (directSourceRanks P) 52)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (52 : Fin 78) (16 : Fin 78)
    (50 : Fin 78) (18 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (5 : Fin 13) (6 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (18 : Fin 78) (16 : Fin 78)
    (52 : Fin 78) (15 : Fin 78) (58 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1202` (kalmanson). -/
theorem directSource_h1202 :
    ((!((rankAtom (directSourceRanks P) 16 == rankAtom (directSourceRanks P) 50)) || ((rankAtom (directSourceRanks P) 18).ult (rankAtom (directSourceRanks P) 52)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (52 : Fin 78) (16 : Fin 78)
    (18 : Fin 78) (50 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (5 : Fin 13) (6 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (18 : Fin 78) (16 : Fin 78)
    (52 : Fin 78) (15 : Fin 78) (58 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1203` (kalmanson). -/
theorem directSource_h1203 :
    ((!((rankAtom (directSourceRanks P) 52 == rankAtom (directSourceRanks P) 18)) || ((rankAtom (directSourceRanks P) 50).ult (rankAtom (directSourceRanks P) 16)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (16 : Fin 78) (52 : Fin 78)
    (50 : Fin 78) (18 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (5 : Fin 13) (6 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (18 : Fin 78) (16 : Fin 78)
    (52 : Fin 78) (15 : Fin 78) (58 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1204` (kalmanson). -/
theorem directSource_h1204 :
    ((!((rankAtom (directSourceRanks P) 52 == rankAtom (directSourceRanks P) 50)) || ((rankAtom (directSourceRanks P) 18).ult (rankAtom (directSourceRanks P) 16)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (16 : Fin 78) (52 : Fin 78)
    (18 : Fin 78) (50 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (5 : Fin 13) (6 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (18 : Fin 78) (16 : Fin 78)
    (52 : Fin 78) (15 : Fin 78) (58 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1205` (kalmanson). -/
theorem directSource_h1205 :
    ((!((rankAtom (directSourceRanks P) 16 == rankAtom (directSourceRanks P) 59)) || ((rankAtom (directSourceRanks P) 15).ult (rankAtom (directSourceRanks P) 53)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (53 : Fin 78) (16 : Fin 78)
    (15 : Fin 78) (59 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (5 : Fin 13) (6 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (19 : Fin 78) (16 : Fin 78)
    (53 : Fin 78) (15 : Fin 78) (59 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1206` (kalmanson). -/
theorem directSource_h1206 :
    ((!((rankAtom (directSourceRanks P) 53 == rankAtom (directSourceRanks P) 15)) || ((rankAtom (directSourceRanks P) 59).ult (rankAtom (directSourceRanks P) 16)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (16 : Fin 78) (53 : Fin 78)
    (59 : Fin 78) (15 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (5 : Fin 13) (6 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (19 : Fin 78) (16 : Fin 78)
    (53 : Fin 78) (15 : Fin 78) (59 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1207` (kalmanson). -/
theorem directSource_h1207 :
    ((!((rankAtom (directSourceRanks P) 16 == rankAtom (directSourceRanks P) 50)) || ((rankAtom (directSourceRanks P) 19).ult (rankAtom (directSourceRanks P) 53)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (53 : Fin 78) (16 : Fin 78)
    (19 : Fin 78) (50 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (5 : Fin 13) (6 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (19 : Fin 78) (16 : Fin 78)
    (53 : Fin 78) (15 : Fin 78) (59 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1208` (kalmanson). -/
theorem directSource_h1208 :
    ((!((rankAtom (directSourceRanks P) 53 == rankAtom (directSourceRanks P) 50)) || ((rankAtom (directSourceRanks P) 19).ult (rankAtom (directSourceRanks P) 16)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (16 : Fin 78) (53 : Fin 78)
    (19 : Fin 78) (50 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (5 : Fin 13) (6 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (19 : Fin 78) (16 : Fin 78)
    (53 : Fin 78) (15 : Fin 78) (59 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1209` (kalmanson). -/
theorem directSource_h1209 :
    ((!((rankAtom (directSourceRanks P) 16 == rankAtom (directSourceRanks P) 60)) || ((rankAtom (directSourceRanks P) 15).ult (rankAtom (directSourceRanks P) 54)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (54 : Fin 78) (16 : Fin 78)
    (15 : Fin 78) (60 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (5 : Fin 13) (6 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (20 : Fin 78) (16 : Fin 78)
    (54 : Fin 78) (15 : Fin 78) (60 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1210` (kalmanson). -/
theorem directSource_h1210 :
    ((!((rankAtom (directSourceRanks P) 54 == rankAtom (directSourceRanks P) 15)) || ((rankAtom (directSourceRanks P) 60).ult (rankAtom (directSourceRanks P) 16)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (16 : Fin 78) (54 : Fin 78)
    (60 : Fin 78) (15 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (5 : Fin 13) (6 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (20 : Fin 78) (16 : Fin 78)
    (54 : Fin 78) (15 : Fin 78) (60 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1211` (kalmanson). -/
theorem directSource_h1211 :
    ((!((rankAtom (directSourceRanks P) 16 == rankAtom (directSourceRanks P) 50)) || ((rankAtom (directSourceRanks P) 20).ult (rankAtom (directSourceRanks P) 54)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (54 : Fin 78) (16 : Fin 78)
    (20 : Fin 78) (50 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (5 : Fin 13) (6 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (20 : Fin 78) (16 : Fin 78)
    (54 : Fin 78) (15 : Fin 78) (60 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1212` (kalmanson). -/
theorem directSource_h1212 :
    ((!((rankAtom (directSourceRanks P) 16 == rankAtom (directSourceRanks P) 61)) || ((rankAtom (directSourceRanks P) 15).ult (rankAtom (directSourceRanks P) 55)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (55 : Fin 78) (16 : Fin 78)
    (15 : Fin 78) (61 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (5 : Fin 13) (6 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (21 : Fin 78) (16 : Fin 78)
    (55 : Fin 78) (15 : Fin 78) (61 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1213` (kalmanson). -/
theorem directSource_h1213 :
    ((!((rankAtom (directSourceRanks P) 55 == rankAtom (directSourceRanks P) 15)) || ((rankAtom (directSourceRanks P) 61).ult (rankAtom (directSourceRanks P) 16)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (16 : Fin 78) (55 : Fin 78)
    (61 : Fin 78) (15 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (5 : Fin 13) (6 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (21 : Fin 78) (16 : Fin 78)
    (55 : Fin 78) (15 : Fin 78) (61 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1214` (kalmanson). -/
theorem directSource_h1214 :
    ((!((rankAtom (directSourceRanks P) 16 == rankAtom (directSourceRanks P) 50)) || ((rankAtom (directSourceRanks P) 21).ult (rankAtom (directSourceRanks P) 55)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (55 : Fin 78) (16 : Fin 78)
    (21 : Fin 78) (50 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (5 : Fin 13) (6 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (21 : Fin 78) (16 : Fin 78)
    (55 : Fin 78) (15 : Fin 78) (61 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1215` (kalmanson). -/
theorem directSource_h1215 :
    ((!((rankAtom (directSourceRanks P) 16 == rankAtom (directSourceRanks P) 62)) || ((rankAtom (directSourceRanks P) 15).ult (rankAtom (directSourceRanks P) 56)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (56 : Fin 78) (16 : Fin 78)
    (15 : Fin 78) (62 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (5 : Fin 13) (6 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (22 : Fin 78) (16 : Fin 78)
    (56 : Fin 78) (15 : Fin 78) (62 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

end

end ATailExactFiveCard13CnfIngressScratch
end Problem97
