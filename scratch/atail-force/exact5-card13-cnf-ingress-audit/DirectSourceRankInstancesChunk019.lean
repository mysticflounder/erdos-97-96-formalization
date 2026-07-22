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

/-- Exact pass-5 source assertion `h1216` (kalmanson). -/
theorem directSource_h1216 :
    ((!((rankAtom (directSourceRanks P) 56 == rankAtom (directSourceRanks P) 15)) || ((rankAtom (directSourceRanks P) 62).ult (rankAtom (directSourceRanks P) 16)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (16 : Fin 78) (56 : Fin 78)
    (62 : Fin 78) (15 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (5 : Fin 13) (6 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (22 : Fin 78) (16 : Fin 78)
    (56 : Fin 78) (15 : Fin 78) (62 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1217` (kalmanson). -/
theorem directSource_h1217 :
    ((!((rankAtom (directSourceRanks P) 52 == rankAtom (directSourceRanks P) 63)) || ((rankAtom (directSourceRanks P) 15).ult (rankAtom (directSourceRanks P) 17)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (17 : Fin 78) (52 : Fin 78)
    (15 : Fin 78) (63 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (5 : Fin 13) (7 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (51 : Fin 78) (18 : Fin 78) (17 : Fin 78)
    (52 : Fin 78) (15 : Fin 78) (63 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1218` (kalmanson). -/
theorem directSource_h1218 :
    ((!((rankAtom (directSourceRanks P) 52 == rankAtom (directSourceRanks P) 18)) || ((rankAtom (directSourceRanks P) 51).ult (rankAtom (directSourceRanks P) 17)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (17 : Fin 78) (52 : Fin 78)
    (51 : Fin 78) (18 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (5 : Fin 13) (7 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (51 : Fin 78) (18 : Fin 78) (17 : Fin 78)
    (52 : Fin 78) (15 : Fin 78) (63 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1219` (kalmanson). -/
theorem directSource_h1219 :
    ((!((rankAtom (directSourceRanks P) 52 == rankAtom (directSourceRanks P) 51)) || ((rankAtom (directSourceRanks P) 18).ult (rankAtom (directSourceRanks P) 17)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (17 : Fin 78) (52 : Fin 78)
    (18 : Fin 78) (51 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (5 : Fin 13) (7 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (51 : Fin 78) (18 : Fin 78) (17 : Fin 78)
    (52 : Fin 78) (15 : Fin 78) (63 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1220` (kalmanson). -/
theorem directSource_h1220 :
    ((!((rankAtom (directSourceRanks P) 53 == rankAtom (directSourceRanks P) 51)) || ((rankAtom (directSourceRanks P) 19).ult (rankAtom (directSourceRanks P) 17)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (17 : Fin 78) (53 : Fin 78)
    (19 : Fin 78) (51 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (5 : Fin 13) (7 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (51 : Fin 78) (19 : Fin 78) (17 : Fin 78)
    (53 : Fin 78) (15 : Fin 78) (64 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1221` (kalmanson). -/
theorem directSource_h1221 :
    ((!((rankAtom (directSourceRanks P) 54 == rankAtom (directSourceRanks P) 15)) || ((rankAtom (directSourceRanks P) 65).ult (rankAtom (directSourceRanks P) 17)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (17 : Fin 78) (54 : Fin 78)
    (65 : Fin 78) (15 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (5 : Fin 13) (7 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (51 : Fin 78) (20 : Fin 78) (17 : Fin 78)
    (54 : Fin 78) (15 : Fin 78) (65 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1222` (kalmanson). -/
theorem directSource_h1222 :
    ((!((rankAtom (directSourceRanks P) 56 == rankAtom (directSourceRanks P) 15)) || ((rankAtom (directSourceRanks P) 67).ult (rankAtom (directSourceRanks P) 17)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (17 : Fin 78) (56 : Fin 78)
    (67 : Fin 78) (15 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (5 : Fin 13) (7 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (51 : Fin 78) (22 : Fin 78) (17 : Fin 78)
    (56 : Fin 78) (15 : Fin 78) (67 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1223` (kalmanson). -/
theorem directSource_h1223 :
    ((!((rankAtom (directSourceRanks P) 18 == rankAtom (directSourceRanks P) 68)) || ((rankAtom (directSourceRanks P) 15).ult (rankAtom (directSourceRanks P) 53)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (53 : Fin 78) (18 : Fin 78)
    (15 : Fin 78) (68 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (5 : Fin 13) (8 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (52 : Fin 78) (19 : Fin 78) (18 : Fin 78)
    (53 : Fin 78) (15 : Fin 78) (68 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1224` (kalmanson). -/
theorem directSource_h1224 :
    ((!((rankAtom (directSourceRanks P) 18 == rankAtom (directSourceRanks P) 52)) || ((rankAtom (directSourceRanks P) 19).ult (rankAtom (directSourceRanks P) 53)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (53 : Fin 78) (18 : Fin 78)
    (19 : Fin 78) (52 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (5 : Fin 13) (8 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (52 : Fin 78) (19 : Fin 78) (18 : Fin 78)
    (53 : Fin 78) (15 : Fin 78) (68 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1225` (kalmanson). -/
theorem directSource_h1225 :
    ((!((rankAtom (directSourceRanks P) 53 == rankAtom (directSourceRanks P) 52)) || ((rankAtom (directSourceRanks P) 19).ult (rankAtom (directSourceRanks P) 18)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (18 : Fin 78) (53 : Fin 78)
    (19 : Fin 78) (52 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (5 : Fin 13) (8 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (52 : Fin 78) (19 : Fin 78) (18 : Fin 78)
    (53 : Fin 78) (15 : Fin 78) (68 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1226` (kalmanson). -/
theorem directSource_h1226 :
    ((!((rankAtom (directSourceRanks P) 18 == rankAtom (directSourceRanks P) 69)) || ((rankAtom (directSourceRanks P) 15).ult (rankAtom (directSourceRanks P) 54)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (54 : Fin 78) (18 : Fin 78)
    (15 : Fin 78) (69 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (5 : Fin 13) (8 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (52 : Fin 78) (20 : Fin 78) (18 : Fin 78)
    (54 : Fin 78) (15 : Fin 78) (69 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1227` (kalmanson). -/
theorem directSource_h1227 :
    ((!((rankAtom (directSourceRanks P) 18 == rankAtom (directSourceRanks P) 52)) || ((rankAtom (directSourceRanks P) 20).ult (rankAtom (directSourceRanks P) 54)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (54 : Fin 78) (18 : Fin 78)
    (20 : Fin 78) (52 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (5 : Fin 13) (8 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (52 : Fin 78) (20 : Fin 78) (18 : Fin 78)
    (54 : Fin 78) (15 : Fin 78) (69 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1228` (kalmanson). -/
theorem directSource_h1228 :
    ((!((rankAtom (directSourceRanks P) 54 == rankAtom (directSourceRanks P) 52)) || ((rankAtom (directSourceRanks P) 20).ult (rankAtom (directSourceRanks P) 18)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (18 : Fin 78) (54 : Fin 78)
    (20 : Fin 78) (52 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (5 : Fin 13) (8 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (52 : Fin 78) (20 : Fin 78) (18 : Fin 78)
    (54 : Fin 78) (15 : Fin 78) (69 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1229` (kalmanson). -/
theorem directSource_h1229 :
    ((!((rankAtom (directSourceRanks P) 18 == rankAtom (directSourceRanks P) 70)) || ((rankAtom (directSourceRanks P) 15).ult (rankAtom (directSourceRanks P) 55)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (55 : Fin 78) (18 : Fin 78)
    (15 : Fin 78) (70 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (5 : Fin 13) (8 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (52 : Fin 78) (21 : Fin 78) (18 : Fin 78)
    (55 : Fin 78) (15 : Fin 78) (70 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1230` (kalmanson). -/
theorem directSource_h1230 :
    ((!((rankAtom (directSourceRanks P) 18 == rankAtom (directSourceRanks P) 71)) || ((rankAtom (directSourceRanks P) 15).ult (rankAtom (directSourceRanks P) 56)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (56 : Fin 78) (18 : Fin 78)
    (15 : Fin 78) (71 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (5 : Fin 13) (8 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (52 : Fin 78) (22 : Fin 78) (18 : Fin 78)
    (56 : Fin 78) (15 : Fin 78) (71 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1231` (kalmanson). -/
theorem directSource_h1231 :
    ((!((rankAtom (directSourceRanks P) 58 == rankAtom (directSourceRanks P) 63)) || ((rankAtom (directSourceRanks P) 16).ult (rankAtom (directSourceRanks P) 17)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (17 : Fin 78) (58 : Fin 78)
    (16 : Fin 78) (63 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (6 : Fin 13) (7 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (18 : Fin 78) (17 : Fin 78)
    (58 : Fin 78) (16 : Fin 78) (63 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1232` (kalmanson). -/
theorem directSource_h1232 :
    ((!((rankAtom (directSourceRanks P) 58 == rankAtom (directSourceRanks P) 18)) || ((rankAtom (directSourceRanks P) 57).ult (rankAtom (directSourceRanks P) 17)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (17 : Fin 78) (58 : Fin 78)
    (57 : Fin 78) (18 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (6 : Fin 13) (7 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (18 : Fin 78) (17 : Fin 78)
    (58 : Fin 78) (16 : Fin 78) (63 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1233` (kalmanson). -/
theorem directSource_h1233 :
    ((!((rankAtom (directSourceRanks P) 58 == rankAtom (directSourceRanks P) 57)) || ((rankAtom (directSourceRanks P) 18).ult (rankAtom (directSourceRanks P) 17)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (17 : Fin 78) (58 : Fin 78)
    (18 : Fin 78) (57 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (6 : Fin 13) (7 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (18 : Fin 78) (17 : Fin 78)
    (58 : Fin 78) (16 : Fin 78) (63 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1234` (kalmanson). -/
theorem directSource_h1234 :
    ((!((rankAtom (directSourceRanks P) 59 == rankAtom (directSourceRanks P) 16)) || ((rankAtom (directSourceRanks P) 64).ult (rankAtom (directSourceRanks P) 17)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (17 : Fin 78) (59 : Fin 78)
    (64 : Fin 78) (16 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (6 : Fin 13) (7 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (19 : Fin 78) (17 : Fin 78)
    (59 : Fin 78) (16 : Fin 78) (64 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1235` (kalmanson). -/
theorem directSource_h1235 :
    ((!((rankAtom (directSourceRanks P) 59 == rankAtom (directSourceRanks P) 57)) || ((rankAtom (directSourceRanks P) 19).ult (rankAtom (directSourceRanks P) 17)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (17 : Fin 78) (59 : Fin 78)
    (19 : Fin 78) (57 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (6 : Fin 13) (7 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (19 : Fin 78) (17 : Fin 78)
    (59 : Fin 78) (16 : Fin 78) (64 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1236` (kalmanson). -/
theorem directSource_h1236 :
    ((!((rankAtom (directSourceRanks P) 60 == rankAtom (directSourceRanks P) 16)) || ((rankAtom (directSourceRanks P) 65).ult (rankAtom (directSourceRanks P) 17)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (17 : Fin 78) (60 : Fin 78)
    (65 : Fin 78) (16 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (6 : Fin 13) (7 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (20 : Fin 78) (17 : Fin 78)
    (60 : Fin 78) (16 : Fin 78) (65 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1237` (kalmanson). -/
theorem directSource_h1237 :
    ((!((rankAtom (directSourceRanks P) 60 == rankAtom (directSourceRanks P) 57)) || ((rankAtom (directSourceRanks P) 20).ult (rankAtom (directSourceRanks P) 17)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (17 : Fin 78) (60 : Fin 78)
    (20 : Fin 78) (57 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (6 : Fin 13) (7 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (20 : Fin 78) (17 : Fin 78)
    (60 : Fin 78) (16 : Fin 78) (65 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1238` (kalmanson). -/
theorem directSource_h1238 :
    ((!((rankAtom (directSourceRanks P) 61 == rankAtom (directSourceRanks P) 16)) || ((rankAtom (directSourceRanks P) 66).ult (rankAtom (directSourceRanks P) 17)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (17 : Fin 78) (61 : Fin 78)
    (66 : Fin 78) (16 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (6 : Fin 13) (7 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (21 : Fin 78) (17 : Fin 78)
    (61 : Fin 78) (16 : Fin 78) (66 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1239` (kalmanson). -/
theorem directSource_h1239 :
    ((!((rankAtom (directSourceRanks P) 62 == rankAtom (directSourceRanks P) 16)) || ((rankAtom (directSourceRanks P) 67).ult (rankAtom (directSourceRanks P) 17)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (17 : Fin 78) (62 : Fin 78)
    (67 : Fin 78) (16 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (6 : Fin 13) (7 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (22 : Fin 78) (17 : Fin 78)
    (62 : Fin 78) (16 : Fin 78) (67 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1240` (kalmanson). -/
theorem directSource_h1240 :
    ((!((rankAtom (directSourceRanks P) 18 == rankAtom (directSourceRanks P) 68)) || ((rankAtom (directSourceRanks P) 16).ult (rankAtom (directSourceRanks P) 59)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (59 : Fin 78) (18 : Fin 78)
    (16 : Fin 78) (68 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (6 : Fin 13) (8 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (58 : Fin 78) (19 : Fin 78) (18 : Fin 78)
    (59 : Fin 78) (16 : Fin 78) (68 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1241` (kalmanson). -/
theorem directSource_h1241 :
    ((!((rankAtom (directSourceRanks P) 18 == rankAtom (directSourceRanks P) 58)) || ((rankAtom (directSourceRanks P) 19).ult (rankAtom (directSourceRanks P) 59)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (59 : Fin 78) (18 : Fin 78)
    (19 : Fin 78) (58 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (6 : Fin 13) (8 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (58 : Fin 78) (19 : Fin 78) (18 : Fin 78)
    (59 : Fin 78) (16 : Fin 78) (68 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1242` (kalmanson). -/
theorem directSource_h1242 :
    ((!((rankAtom (directSourceRanks P) 18 == rankAtom (directSourceRanks P) 69)) || ((rankAtom (directSourceRanks P) 16).ult (rankAtom (directSourceRanks P) 60)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (60 : Fin 78) (18 : Fin 78)
    (16 : Fin 78) (69 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (6 : Fin 13) (8 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (58 : Fin 78) (20 : Fin 78) (18 : Fin 78)
    (60 : Fin 78) (16 : Fin 78) (69 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1243` (kalmanson). -/
theorem directSource_h1243 :
    ((!((rankAtom (directSourceRanks P) 18 == rankAtom (directSourceRanks P) 58)) || ((rankAtom (directSourceRanks P) 20).ult (rankAtom (directSourceRanks P) 60)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (60 : Fin 78) (18 : Fin 78)
    (20 : Fin 78) (58 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (6 : Fin 13) (8 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (58 : Fin 78) (20 : Fin 78) (18 : Fin 78)
    (60 : Fin 78) (16 : Fin 78) (69 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1244` (kalmanson). -/
theorem directSource_h1244 :
    ((!((rankAtom (directSourceRanks P) 18 == rankAtom (directSourceRanks P) 70)) || ((rankAtom (directSourceRanks P) 16).ult (rankAtom (directSourceRanks P) 61)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (61 : Fin 78) (18 : Fin 78)
    (16 : Fin 78) (70 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (6 : Fin 13) (8 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (58 : Fin 78) (21 : Fin 78) (18 : Fin 78)
    (61 : Fin 78) (16 : Fin 78) (70 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1245` (kalmanson). -/
theorem directSource_h1245 :
    ((!((rankAtom (directSourceRanks P) 18 == rankAtom (directSourceRanks P) 58)) || ((rankAtom (directSourceRanks P) 21).ult (rankAtom (directSourceRanks P) 61)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (61 : Fin 78) (18 : Fin 78)
    (21 : Fin 78) (58 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (6 : Fin 13) (8 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (58 : Fin 78) (21 : Fin 78) (18 : Fin 78)
    (61 : Fin 78) (16 : Fin 78) (70 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1246` (kalmanson). -/
theorem directSource_h1246 :
    ((!((rankAtom (directSourceRanks P) 61 == rankAtom (directSourceRanks P) 58)) || ((rankAtom (directSourceRanks P) 21).ult (rankAtom (directSourceRanks P) 18)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (18 : Fin 78) (61 : Fin 78)
    (21 : Fin 78) (58 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (6 : Fin 13) (8 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (58 : Fin 78) (21 : Fin 78) (18 : Fin 78)
    (61 : Fin 78) (16 : Fin 78) (70 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1247` (kalmanson). -/
theorem directSource_h1247 :
    ((!((rankAtom (directSourceRanks P) 18 == rankAtom (directSourceRanks P) 71)) || ((rankAtom (directSourceRanks P) 16).ult (rankAtom (directSourceRanks P) 62)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (62 : Fin 78) (18 : Fin 78)
    (16 : Fin 78) (71 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (6 : Fin 13) (8 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (58 : Fin 78) (22 : Fin 78) (18 : Fin 78)
    (62 : Fin 78) (16 : Fin 78) (71 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1248` (kalmanson). -/
theorem directSource_h1248 :
    ((!((rankAtom (directSourceRanks P) 18 == rankAtom (directSourceRanks P) 68)) || ((rankAtom (directSourceRanks P) 17).ult (rankAtom (directSourceRanks P) 64)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (64 : Fin 78) (18 : Fin 78)
    (17 : Fin 78) (68 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (7 : Fin 13) (8 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (63 : Fin 78) (19 : Fin 78) (18 : Fin 78)
    (64 : Fin 78) (17 : Fin 78) (68 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1249` (kalmanson). -/
theorem directSource_h1249 :
    ((!((rankAtom (directSourceRanks P) 18 == rankAtom (directSourceRanks P) 63)) || ((rankAtom (directSourceRanks P) 19).ult (rankAtom (directSourceRanks P) 64)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (64 : Fin 78) (18 : Fin 78)
    (19 : Fin 78) (63 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (7 : Fin 13) (8 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (63 : Fin 78) (19 : Fin 78) (18 : Fin 78)
    (64 : Fin 78) (17 : Fin 78) (68 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1250` (kalmanson). -/
theorem directSource_h1250 :
    ((!((rankAtom (directSourceRanks P) 18 == rankAtom (directSourceRanks P) 69)) || ((rankAtom (directSourceRanks P) 17).ult (rankAtom (directSourceRanks P) 65)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (65 : Fin 78) (18 : Fin 78)
    (17 : Fin 78) (69 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (7 : Fin 13) (8 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (63 : Fin 78) (20 : Fin 78) (18 : Fin 78)
    (65 : Fin 78) (17 : Fin 78) (69 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1251` (kalmanson). -/
theorem directSource_h1251 :
    ((!((rankAtom (directSourceRanks P) 18 == rankAtom (directSourceRanks P) 63)) || ((rankAtom (directSourceRanks P) 20).ult (rankAtom (directSourceRanks P) 65)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (65 : Fin 78) (18 : Fin 78)
    (20 : Fin 78) (63 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (7 : Fin 13) (8 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (63 : Fin 78) (20 : Fin 78) (18 : Fin 78)
    (65 : Fin 78) (17 : Fin 78) (69 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1252` (kalmanson). -/
theorem directSource_h1252 :
    ((!((rankAtom (directSourceRanks P) 18 == rankAtom (directSourceRanks P) 70)) || ((rankAtom (directSourceRanks P) 17).ult (rankAtom (directSourceRanks P) 66)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (66 : Fin 78) (18 : Fin 78)
    (17 : Fin 78) (70 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (7 : Fin 13) (8 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (63 : Fin 78) (21 : Fin 78) (18 : Fin 78)
    (66 : Fin 78) (17 : Fin 78) (70 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1253` (kalmanson). -/
theorem directSource_h1253 :
    ((!((rankAtom (directSourceRanks P) 18 == rankAtom (directSourceRanks P) 63)) || ((rankAtom (directSourceRanks P) 21).ult (rankAtom (directSourceRanks P) 66)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (66 : Fin 78) (18 : Fin 78)
    (21 : Fin 78) (63 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (7 : Fin 13) (8 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (63 : Fin 78) (21 : Fin 78) (18 : Fin 78)
    (66 : Fin 78) (17 : Fin 78) (70 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1254` (kalmanson). -/
theorem directSource_h1254 :
    ((!((rankAtom (directSourceRanks P) 18 == rankAtom (directSourceRanks P) 71)) || ((rankAtom (directSourceRanks P) 17).ult (rankAtom (directSourceRanks P) 67)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (67 : Fin 78) (18 : Fin 78)
    (17 : Fin 78) (71 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (7 : Fin 13) (8 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (63 : Fin 78) (22 : Fin 78) (18 : Fin 78)
    (67 : Fin 78) (17 : Fin 78) (71 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1255` (kalmanson). -/
theorem directSource_h1255 :
    ((!((rankAtom (directSourceRanks P) 24 == rankAtom (directSourceRanks P) 42)) || ((rankAtom (directSourceRanks P) 23).ult (rankAtom (directSourceRanks P) 34)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (34 : Fin 78) (24 : Fin 78)
    (23 : Fin 78) (42 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (4 : Fin 13) (5 : Fin 13)
    (by decide) (by decide) (by decide)
    (33 : Fin 78) (25 : Fin 78) (24 : Fin 78)
    (34 : Fin 78) (23 : Fin 78) (42 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1256` (kalmanson). -/
theorem directSource_h1256 :
    ((!((rankAtom (directSourceRanks P) 34 == rankAtom (directSourceRanks P) 42)) || ((rankAtom (directSourceRanks P) 23).ult (rankAtom (directSourceRanks P) 24)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (24 : Fin 78) (34 : Fin 78)
    (23 : Fin 78) (42 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (4 : Fin 13) (5 : Fin 13)
    (by decide) (by decide) (by decide)
    (33 : Fin 78) (25 : Fin 78) (24 : Fin 78)
    (34 : Fin 78) (23 : Fin 78) (42 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1257` (kalmanson). -/
theorem directSource_h1257 :
    ((!((rankAtom (directSourceRanks P) 24 == rankAtom (directSourceRanks P) 23)) || ((rankAtom (directSourceRanks P) 43).ult (rankAtom (directSourceRanks P) 35)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (35 : Fin 78) (24 : Fin 78)
    (43 : Fin 78) (23 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (4 : Fin 13) (6 : Fin 13)
    (by decide) (by decide) (by decide)
    (33 : Fin 78) (26 : Fin 78) (24 : Fin 78)
    (35 : Fin 78) (23 : Fin 78) (43 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1258` (kalmanson). -/
theorem directSource_h1258 :
    ((!((rankAtom (directSourceRanks P) 35 == rankAtom (directSourceRanks P) 23)) || ((rankAtom (directSourceRanks P) 43).ult (rankAtom (directSourceRanks P) 24)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (24 : Fin 78) (35 : Fin 78)
    (43 : Fin 78) (23 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (4 : Fin 13) (6 : Fin 13)
    (by decide) (by decide) (by decide)
    (33 : Fin 78) (26 : Fin 78) (24 : Fin 78)
    (35 : Fin 78) (23 : Fin 78) (43 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1259` (kalmanson). -/
theorem directSource_h1259 :
    ((!((rankAtom (directSourceRanks P) 35 == rankAtom (directSourceRanks P) 43)) || ((rankAtom (directSourceRanks P) 23).ult (rankAtom (directSourceRanks P) 24)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (24 : Fin 78) (35 : Fin 78)
    (23 : Fin 78) (43 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (4 : Fin 13) (6 : Fin 13)
    (by decide) (by decide) (by decide)
    (33 : Fin 78) (26 : Fin 78) (24 : Fin 78)
    (35 : Fin 78) (23 : Fin 78) (43 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1260` (kalmanson). -/
theorem directSource_h1260 :
    ((!((rankAtom (directSourceRanks P) 24 == rankAtom (directSourceRanks P) 44)) || ((rankAtom (directSourceRanks P) 23).ult (rankAtom (directSourceRanks P) 36)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (36 : Fin 78) (24 : Fin 78)
    (23 : Fin 78) (44 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (4 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (33 : Fin 78) (27 : Fin 78) (24 : Fin 78)
    (36 : Fin 78) (23 : Fin 78) (44 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1261` (kalmanson). -/
theorem directSource_h1261 :
    ((!((rankAtom (directSourceRanks P) 37 == rankAtom (directSourceRanks P) 23)) || ((rankAtom (directSourceRanks P) 45).ult (rankAtom (directSourceRanks P) 24)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (24 : Fin 78) (37 : Fin 78)
    (45 : Fin 78) (23 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (4 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (33 : Fin 78) (28 : Fin 78) (24 : Fin 78)
    (37 : Fin 78) (23 : Fin 78) (45 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1262` (kalmanson). -/
theorem directSource_h1262 :
    ((!((rankAtom (directSourceRanks P) 37 == rankAtom (directSourceRanks P) 45)) || ((rankAtom (directSourceRanks P) 23).ult (rankAtom (directSourceRanks P) 24)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (24 : Fin 78) (37 : Fin 78)
    (23 : Fin 78) (45 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (4 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (33 : Fin 78) (28 : Fin 78) (24 : Fin 78)
    (37 : Fin 78) (23 : Fin 78) (45 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1263` (kalmanson). -/
theorem directSource_h1263 :
    ((!((rankAtom (directSourceRanks P) 37 == rankAtom (directSourceRanks P) 28)) || ((rankAtom (directSourceRanks P) 33).ult (rankAtom (directSourceRanks P) 24)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (24 : Fin 78) (37 : Fin 78)
    (33 : Fin 78) (28 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (4 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (33 : Fin 78) (28 : Fin 78) (24 : Fin 78)
    (37 : Fin 78) (23 : Fin 78) (45 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1264` (kalmanson). -/
theorem directSource_h1264 :
    ((!((rankAtom (directSourceRanks P) 24 == rankAtom (directSourceRanks P) 46)) || ((rankAtom (directSourceRanks P) 23).ult (rankAtom (directSourceRanks P) 38)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (38 : Fin 78) (24 : Fin 78)
    (23 : Fin 78) (46 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (4 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (33 : Fin 78) (29 : Fin 78) (24 : Fin 78)
    (38 : Fin 78) (23 : Fin 78) (46 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1265` (kalmanson). -/
theorem directSource_h1265 :
    ((!((rankAtom (directSourceRanks P) 24 == rankAtom (directSourceRanks P) 47)) || ((rankAtom (directSourceRanks P) 23).ult (rankAtom (directSourceRanks P) 39)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (39 : Fin 78) (24 : Fin 78)
    (23 : Fin 78) (47 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (4 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (33 : Fin 78) (30 : Fin 78) (24 : Fin 78)
    (39 : Fin 78) (23 : Fin 78) (47 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1266` (kalmanson). -/
theorem directSource_h1266 :
    ((!((rankAtom (directSourceRanks P) 24 == rankAtom (directSourceRanks P) 48)) || ((rankAtom (directSourceRanks P) 23).ult (rankAtom (directSourceRanks P) 40)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (40 : Fin 78) (24 : Fin 78)
    (23 : Fin 78) (48 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (4 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (33 : Fin 78) (31 : Fin 78) (24 : Fin 78)
    (40 : Fin 78) (23 : Fin 78) (48 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1267` (kalmanson). -/
theorem directSource_h1267 :
    ((!((rankAtom (directSourceRanks P) 24 == rankAtom (directSourceRanks P) 49)) || ((rankAtom (directSourceRanks P) 23).ult (rankAtom (directSourceRanks P) 41)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (41 : Fin 78) (24 : Fin 78)
    (23 : Fin 78) (49 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (4 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (33 : Fin 78) (32 : Fin 78) (24 : Fin 78)
    (41 : Fin 78) (23 : Fin 78) (49 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1268` (kalmanson). -/
theorem directSource_h1268 :
    ((!((rankAtom (directSourceRanks P) 25 == rankAtom (directSourceRanks P) 23)) || ((rankAtom (directSourceRanks P) 50).ult (rankAtom (directSourceRanks P) 35)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (35 : Fin 78) (25 : Fin 78)
    (50 : Fin 78) (23 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (5 : Fin 13) (6 : Fin 13)
    (by decide) (by decide) (by decide)
    (34 : Fin 78) (26 : Fin 78) (25 : Fin 78)
    (35 : Fin 78) (23 : Fin 78) (50 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1269` (kalmanson). -/
theorem directSource_h1269 :
    ((!((rankAtom (directSourceRanks P) 25 == rankAtom (directSourceRanks P) 50)) || ((rankAtom (directSourceRanks P) 23).ult (rankAtom (directSourceRanks P) 35)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (35 : Fin 78) (25 : Fin 78)
    (23 : Fin 78) (50 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (5 : Fin 13) (6 : Fin 13)
    (by decide) (by decide) (by decide)
    (34 : Fin 78) (26 : Fin 78) (25 : Fin 78)
    (35 : Fin 78) (23 : Fin 78) (50 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1270` (kalmanson). -/
theorem directSource_h1270 :
    ((!((rankAtom (directSourceRanks P) 35 == rankAtom (directSourceRanks P) 23)) || ((rankAtom (directSourceRanks P) 50).ult (rankAtom (directSourceRanks P) 25)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (25 : Fin 78) (35 : Fin 78)
    (50 : Fin 78) (23 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (5 : Fin 13) (6 : Fin 13)
    (by decide) (by decide) (by decide)
    (34 : Fin 78) (26 : Fin 78) (25 : Fin 78)
    (35 : Fin 78) (23 : Fin 78) (50 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1271` (kalmanson). -/
theorem directSource_h1271 :
    ((!((rankAtom (directSourceRanks P) 35 == rankAtom (directSourceRanks P) 50)) || ((rankAtom (directSourceRanks P) 23).ult (rankAtom (directSourceRanks P) 25)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (25 : Fin 78) (35 : Fin 78)
    (23 : Fin 78) (50 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (5 : Fin 13) (6 : Fin 13)
    (by decide) (by decide) (by decide)
    (34 : Fin 78) (26 : Fin 78) (25 : Fin 78)
    (35 : Fin 78) (23 : Fin 78) (50 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1272` (kalmanson). -/
theorem directSource_h1272 :
    ((!((rankAtom (directSourceRanks P) 25 == rankAtom (directSourceRanks P) 26)) || ((rankAtom (directSourceRanks P) 34).ult (rankAtom (directSourceRanks P) 35)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (35 : Fin 78) (25 : Fin 78)
    (34 : Fin 78) (26 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (5 : Fin 13) (6 : Fin 13)
    (by decide) (by decide) (by decide)
    (34 : Fin 78) (26 : Fin 78) (25 : Fin 78)
    (35 : Fin 78) (23 : Fin 78) (50 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1273` (kalmanson). -/
theorem directSource_h1273 :
    ((!((rankAtom (directSourceRanks P) 35 == rankAtom (directSourceRanks P) 34)) || ((rankAtom (directSourceRanks P) 26).ult (rankAtom (directSourceRanks P) 25)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (25 : Fin 78) (35 : Fin 78)
    (26 : Fin 78) (34 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (5 : Fin 13) (6 : Fin 13)
    (by decide) (by decide) (by decide)
    (34 : Fin 78) (26 : Fin 78) (25 : Fin 78)
    (35 : Fin 78) (23 : Fin 78) (50 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1274` (kalmanson). -/
theorem directSource_h1274 :
    ((!((rankAtom (directSourceRanks P) 25 == rankAtom (directSourceRanks P) 23)) || ((rankAtom (directSourceRanks P) 51).ult (rankAtom (directSourceRanks P) 36)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (36 : Fin 78) (25 : Fin 78)
    (51 : Fin 78) (23 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (5 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (34 : Fin 78) (27 : Fin 78) (25 : Fin 78)
    (36 : Fin 78) (23 : Fin 78) (51 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1275` (kalmanson). -/
theorem directSource_h1275 :
    ((!((rankAtom (directSourceRanks P) 25 == rankAtom (directSourceRanks P) 51)) || ((rankAtom (directSourceRanks P) 23).ult (rankAtom (directSourceRanks P) 36)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (36 : Fin 78) (25 : Fin 78)
    (23 : Fin 78) (51 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (5 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (34 : Fin 78) (27 : Fin 78) (25 : Fin 78)
    (36 : Fin 78) (23 : Fin 78) (51 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1276` (kalmanson). -/
theorem directSource_h1276 :
    ((!((rankAtom (directSourceRanks P) 25 == rankAtom (directSourceRanks P) 27)) || ((rankAtom (directSourceRanks P) 34).ult (rankAtom (directSourceRanks P) 36)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (36 : Fin 78) (25 : Fin 78)
    (34 : Fin 78) (27 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (5 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (34 : Fin 78) (27 : Fin 78) (25 : Fin 78)
    (36 : Fin 78) (23 : Fin 78) (51 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1277` (kalmanson). -/
theorem directSource_h1277 :
    ((!((rankAtom (directSourceRanks P) 25 == rankAtom (directSourceRanks P) 23)) || ((rankAtom (directSourceRanks P) 52).ult (rankAtom (directSourceRanks P) 37)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (37 : Fin 78) (25 : Fin 78)
    (52 : Fin 78) (23 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (5 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (34 : Fin 78) (28 : Fin 78) (25 : Fin 78)
    (37 : Fin 78) (23 : Fin 78) (52 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1278` (kalmanson). -/
theorem directSource_h1278 :
    ((!((rankAtom (directSourceRanks P) 25 == rankAtom (directSourceRanks P) 52)) || ((rankAtom (directSourceRanks P) 23).ult (rankAtom (directSourceRanks P) 37)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (37 : Fin 78) (25 : Fin 78)
    (23 : Fin 78) (52 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (5 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (34 : Fin 78) (28 : Fin 78) (25 : Fin 78)
    (37 : Fin 78) (23 : Fin 78) (52 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1279` (kalmanson). -/
theorem directSource_h1279 :
    ((!((rankAtom (directSourceRanks P) 37 == rankAtom (directSourceRanks P) 23)) || ((rankAtom (directSourceRanks P) 52).ult (rankAtom (directSourceRanks P) 25)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (25 : Fin 78) (37 : Fin 78)
    (52 : Fin 78) (23 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (5 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (34 : Fin 78) (28 : Fin 78) (25 : Fin 78)
    (37 : Fin 78) (23 : Fin 78) (52 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

end

end ATailExactFiveCard13CnfIngressScratch
end Problem97
