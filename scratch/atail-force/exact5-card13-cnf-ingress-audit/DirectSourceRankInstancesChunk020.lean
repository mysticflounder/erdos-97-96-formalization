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

/-- Exact pass-5 source assertion `h1280` (kalmanson). -/
theorem directSource_h1280 :
    ((!((rankAtom (directSourceRanks P) 37 == rankAtom (directSourceRanks P) 52)) || ((rankAtom (directSourceRanks P) 23).ult (rankAtom (directSourceRanks P) 25)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (25 : Fin 78) (37 : Fin 78)
    (23 : Fin 78) (52 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (5 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (34 : Fin 78) (28 : Fin 78) (25 : Fin 78)
    (37 : Fin 78) (23 : Fin 78) (52 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1281` (kalmanson). -/
theorem directSource_h1281 :
    ((!((rankAtom (directSourceRanks P) 25 == rankAtom (directSourceRanks P) 28)) || ((rankAtom (directSourceRanks P) 34).ult (rankAtom (directSourceRanks P) 37)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (37 : Fin 78) (25 : Fin 78)
    (34 : Fin 78) (28 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (5 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (34 : Fin 78) (28 : Fin 78) (25 : Fin 78)
    (37 : Fin 78) (23 : Fin 78) (52 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1282` (kalmanson). -/
theorem directSource_h1282 :
    ((!((rankAtom (directSourceRanks P) 37 == rankAtom (directSourceRanks P) 28)) || ((rankAtom (directSourceRanks P) 34).ult (rankAtom (directSourceRanks P) 25)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (25 : Fin 78) (37 : Fin 78)
    (34 : Fin 78) (28 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (5 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (34 : Fin 78) (28 : Fin 78) (25 : Fin 78)
    (37 : Fin 78) (23 : Fin 78) (52 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1283` (kalmanson). -/
theorem directSource_h1283 :
    ((!((rankAtom (directSourceRanks P) 25 == rankAtom (directSourceRanks P) 23)) || ((rankAtom (directSourceRanks P) 53).ult (rankAtom (directSourceRanks P) 38)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (38 : Fin 78) (25 : Fin 78)
    (53 : Fin 78) (23 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (5 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (34 : Fin 78) (29 : Fin 78) (25 : Fin 78)
    (38 : Fin 78) (23 : Fin 78) (53 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1284` (kalmanson). -/
theorem directSource_h1284 :
    ((!((rankAtom (directSourceRanks P) 25 == rankAtom (directSourceRanks P) 53)) || ((rankAtom (directSourceRanks P) 23).ult (rankAtom (directSourceRanks P) 38)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (38 : Fin 78) (25 : Fin 78)
    (23 : Fin 78) (53 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (5 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (34 : Fin 78) (29 : Fin 78) (25 : Fin 78)
    (38 : Fin 78) (23 : Fin 78) (53 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1285` (kalmanson). -/
theorem directSource_h1285 :
    ((!((rankAtom (directSourceRanks P) 25 == rankAtom (directSourceRanks P) 29)) || ((rankAtom (directSourceRanks P) 34).ult (rankAtom (directSourceRanks P) 38)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (38 : Fin 78) (25 : Fin 78)
    (34 : Fin 78) (29 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (5 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (34 : Fin 78) (29 : Fin 78) (25 : Fin 78)
    (38 : Fin 78) (23 : Fin 78) (53 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1286` (kalmanson). -/
theorem directSource_h1286 :
    ((!((rankAtom (directSourceRanks P) 25 == rankAtom (directSourceRanks P) 23)) || ((rankAtom (directSourceRanks P) 54).ult (rankAtom (directSourceRanks P) 39)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (39 : Fin 78) (25 : Fin 78)
    (54 : Fin 78) (23 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (5 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (34 : Fin 78) (30 : Fin 78) (25 : Fin 78)
    (39 : Fin 78) (23 : Fin 78) (54 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1287` (kalmanson). -/
theorem directSource_h1287 :
    ((!((rankAtom (directSourceRanks P) 25 == rankAtom (directSourceRanks P) 54)) || ((rankAtom (directSourceRanks P) 23).ult (rankAtom (directSourceRanks P) 39)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (39 : Fin 78) (25 : Fin 78)
    (23 : Fin 78) (54 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (5 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (34 : Fin 78) (30 : Fin 78) (25 : Fin 78)
    (39 : Fin 78) (23 : Fin 78) (54 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1288` (kalmanson). -/
theorem directSource_h1288 :
    ((!((rankAtom (directSourceRanks P) 25 == rankAtom (directSourceRanks P) 23)) || ((rankAtom (directSourceRanks P) 55).ult (rankAtom (directSourceRanks P) 40)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (40 : Fin 78) (25 : Fin 78)
    (55 : Fin 78) (23 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (5 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (34 : Fin 78) (31 : Fin 78) (25 : Fin 78)
    (40 : Fin 78) (23 : Fin 78) (55 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1289` (kalmanson). -/
theorem directSource_h1289 :
    ((!((rankAtom (directSourceRanks P) 25 == rankAtom (directSourceRanks P) 55)) || ((rankAtom (directSourceRanks P) 23).ult (rankAtom (directSourceRanks P) 40)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (40 : Fin 78) (25 : Fin 78)
    (23 : Fin 78) (55 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (5 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (34 : Fin 78) (31 : Fin 78) (25 : Fin 78)
    (40 : Fin 78) (23 : Fin 78) (55 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1290` (kalmanson). -/
theorem directSource_h1290 :
    ((!((rankAtom (directSourceRanks P) 25 == rankAtom (directSourceRanks P) 23)) || ((rankAtom (directSourceRanks P) 56).ult (rankAtom (directSourceRanks P) 41)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (41 : Fin 78) (25 : Fin 78)
    (56 : Fin 78) (23 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (5 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (34 : Fin 78) (32 : Fin 78) (25 : Fin 78)
    (41 : Fin 78) (23 : Fin 78) (56 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1291` (kalmanson). -/
theorem directSource_h1291 :
    ((!((rankAtom (directSourceRanks P) 25 == rankAtom (directSourceRanks P) 56)) || ((rankAtom (directSourceRanks P) 23).ult (rankAtom (directSourceRanks P) 41)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (41 : Fin 78) (25 : Fin 78)
    (23 : Fin 78) (56 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (5 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (34 : Fin 78) (32 : Fin 78) (25 : Fin 78)
    (41 : Fin 78) (23 : Fin 78) (56 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1292` (kalmanson). -/
theorem directSource_h1292 :
    ((!((rankAtom (directSourceRanks P) 25 == rankAtom (directSourceRanks P) 32)) || ((rankAtom (directSourceRanks P) 34).ult (rankAtom (directSourceRanks P) 41)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (41 : Fin 78) (25 : Fin 78)
    (34 : Fin 78) (32 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (5 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (34 : Fin 78) (32 : Fin 78) (25 : Fin 78)
    (41 : Fin 78) (23 : Fin 78) (56 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1293` (kalmanson). -/
theorem directSource_h1293 :
    ((!((rankAtom (directSourceRanks P) 26 == rankAtom (directSourceRanks P) 23)) || ((rankAtom (directSourceRanks P) 57).ult (rankAtom (directSourceRanks P) 36)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (36 : Fin 78) (26 : Fin 78)
    (57 : Fin 78) (23 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (6 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (35 : Fin 78) (27 : Fin 78) (26 : Fin 78)
    (36 : Fin 78) (23 : Fin 78) (57 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1294` (kalmanson). -/
theorem directSource_h1294 :
    ((!((rankAtom (directSourceRanks P) 26 == rankAtom (directSourceRanks P) 57)) || ((rankAtom (directSourceRanks P) 23).ult (rankAtom (directSourceRanks P) 36)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (36 : Fin 78) (26 : Fin 78)
    (23 : Fin 78) (57 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (6 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (35 : Fin 78) (27 : Fin 78) (26 : Fin 78)
    (36 : Fin 78) (23 : Fin 78) (57 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1295` (kalmanson). -/
theorem directSource_h1295 :
    ((!((rankAtom (directSourceRanks P) 26 == rankAtom (directSourceRanks P) 27)) || ((rankAtom (directSourceRanks P) 35).ult (rankAtom (directSourceRanks P) 36)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (36 : Fin 78) (26 : Fin 78)
    (35 : Fin 78) (27 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (6 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (35 : Fin 78) (27 : Fin 78) (26 : Fin 78)
    (36 : Fin 78) (23 : Fin 78) (57 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1296` (kalmanson). -/
theorem directSource_h1296 :
    ((!((rankAtom (directSourceRanks P) 26 == rankAtom (directSourceRanks P) 23)) || ((rankAtom (directSourceRanks P) 58).ult (rankAtom (directSourceRanks P) 37)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (37 : Fin 78) (26 : Fin 78)
    (58 : Fin 78) (23 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (6 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (35 : Fin 78) (28 : Fin 78) (26 : Fin 78)
    (37 : Fin 78) (23 : Fin 78) (58 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1297` (kalmanson). -/
theorem directSource_h1297 :
    ((!((rankAtom (directSourceRanks P) 26 == rankAtom (directSourceRanks P) 58)) || ((rankAtom (directSourceRanks P) 23).ult (rankAtom (directSourceRanks P) 37)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (37 : Fin 78) (26 : Fin 78)
    (23 : Fin 78) (58 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (6 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (35 : Fin 78) (28 : Fin 78) (26 : Fin 78)
    (37 : Fin 78) (23 : Fin 78) (58 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1298` (kalmanson). -/
theorem directSource_h1298 :
    ((!((rankAtom (directSourceRanks P) 37 == rankAtom (directSourceRanks P) 23)) || ((rankAtom (directSourceRanks P) 58).ult (rankAtom (directSourceRanks P) 26)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (26 : Fin 78) (37 : Fin 78)
    (58 : Fin 78) (23 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (6 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (35 : Fin 78) (28 : Fin 78) (26 : Fin 78)
    (37 : Fin 78) (23 : Fin 78) (58 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1299` (kalmanson). -/
theorem directSource_h1299 :
    ((!((rankAtom (directSourceRanks P) 37 == rankAtom (directSourceRanks P) 58)) || ((rankAtom (directSourceRanks P) 23).ult (rankAtom (directSourceRanks P) 26)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (26 : Fin 78) (37 : Fin 78)
    (23 : Fin 78) (58 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (6 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (35 : Fin 78) (28 : Fin 78) (26 : Fin 78)
    (37 : Fin 78) (23 : Fin 78) (58 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1300` (kalmanson). -/
theorem directSource_h1300 :
    ((!((rankAtom (directSourceRanks P) 26 == rankAtom (directSourceRanks P) 28)) || ((rankAtom (directSourceRanks P) 35).ult (rankAtom (directSourceRanks P) 37)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (37 : Fin 78) (26 : Fin 78)
    (35 : Fin 78) (28 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (6 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (35 : Fin 78) (28 : Fin 78) (26 : Fin 78)
    (37 : Fin 78) (23 : Fin 78) (58 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1301` (kalmanson). -/
theorem directSource_h1301 :
    ((!((rankAtom (directSourceRanks P) 37 == rankAtom (directSourceRanks P) 28)) || ((rankAtom (directSourceRanks P) 35).ult (rankAtom (directSourceRanks P) 26)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (26 : Fin 78) (37 : Fin 78)
    (35 : Fin 78) (28 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (6 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (35 : Fin 78) (28 : Fin 78) (26 : Fin 78)
    (37 : Fin 78) (23 : Fin 78) (58 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1302` (kalmanson). -/
theorem directSource_h1302 :
    ((!((rankAtom (directSourceRanks P) 37 == rankAtom (directSourceRanks P) 35)) || ((rankAtom (directSourceRanks P) 28).ult (rankAtom (directSourceRanks P) 26)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (26 : Fin 78) (37 : Fin 78)
    (28 : Fin 78) (35 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (6 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (35 : Fin 78) (28 : Fin 78) (26 : Fin 78)
    (37 : Fin 78) (23 : Fin 78) (58 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1303` (kalmanson). -/
theorem directSource_h1303 :
    ((!((rankAtom (directSourceRanks P) 26 == rankAtom (directSourceRanks P) 23)) || ((rankAtom (directSourceRanks P) 59).ult (rankAtom (directSourceRanks P) 38)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (38 : Fin 78) (26 : Fin 78)
    (59 : Fin 78) (23 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (6 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (35 : Fin 78) (29 : Fin 78) (26 : Fin 78)
    (38 : Fin 78) (23 : Fin 78) (59 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1304` (kalmanson). -/
theorem directSource_h1304 :
    ((!((rankAtom (directSourceRanks P) 26 == rankAtom (directSourceRanks P) 59)) || ((rankAtom (directSourceRanks P) 23).ult (rankAtom (directSourceRanks P) 38)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (38 : Fin 78) (26 : Fin 78)
    (23 : Fin 78) (59 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (6 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (35 : Fin 78) (29 : Fin 78) (26 : Fin 78)
    (38 : Fin 78) (23 : Fin 78) (59 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1305` (kalmanson). -/
theorem directSource_h1305 :
    ((!((rankAtom (directSourceRanks P) 26 == rankAtom (directSourceRanks P) 29)) || ((rankAtom (directSourceRanks P) 35).ult (rankAtom (directSourceRanks P) 38)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (38 : Fin 78) (26 : Fin 78)
    (35 : Fin 78) (29 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (6 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (35 : Fin 78) (29 : Fin 78) (26 : Fin 78)
    (38 : Fin 78) (23 : Fin 78) (59 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1306` (kalmanson). -/
theorem directSource_h1306 :
    ((!((rankAtom (directSourceRanks P) 26 == rankAtom (directSourceRanks P) 23)) || ((rankAtom (directSourceRanks P) 60).ult (rankAtom (directSourceRanks P) 39)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (39 : Fin 78) (26 : Fin 78)
    (60 : Fin 78) (23 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (6 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (35 : Fin 78) (30 : Fin 78) (26 : Fin 78)
    (39 : Fin 78) (23 : Fin 78) (60 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1307` (kalmanson). -/
theorem directSource_h1307 :
    ((!((rankAtom (directSourceRanks P) 26 == rankAtom (directSourceRanks P) 60)) || ((rankAtom (directSourceRanks P) 23).ult (rankAtom (directSourceRanks P) 39)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (39 : Fin 78) (26 : Fin 78)
    (23 : Fin 78) (60 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (6 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (35 : Fin 78) (30 : Fin 78) (26 : Fin 78)
    (39 : Fin 78) (23 : Fin 78) (60 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1308` (kalmanson). -/
theorem directSource_h1308 :
    ((!((rankAtom (directSourceRanks P) 26 == rankAtom (directSourceRanks P) 30)) || ((rankAtom (directSourceRanks P) 35).ult (rankAtom (directSourceRanks P) 39)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (39 : Fin 78) (26 : Fin 78)
    (35 : Fin 78) (30 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (6 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (35 : Fin 78) (30 : Fin 78) (26 : Fin 78)
    (39 : Fin 78) (23 : Fin 78) (60 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1309` (kalmanson). -/
theorem directSource_h1309 :
    ((!((rankAtom (directSourceRanks P) 26 == rankAtom (directSourceRanks P) 23)) || ((rankAtom (directSourceRanks P) 61).ult (rankAtom (directSourceRanks P) 40)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (40 : Fin 78) (26 : Fin 78)
    (61 : Fin 78) (23 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (6 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (35 : Fin 78) (31 : Fin 78) (26 : Fin 78)
    (40 : Fin 78) (23 : Fin 78) (61 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1310` (kalmanson). -/
theorem directSource_h1310 :
    ((!((rankAtom (directSourceRanks P) 26 == rankAtom (directSourceRanks P) 61)) || ((rankAtom (directSourceRanks P) 23).ult (rankAtom (directSourceRanks P) 40)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (40 : Fin 78) (26 : Fin 78)
    (23 : Fin 78) (61 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (6 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (35 : Fin 78) (31 : Fin 78) (26 : Fin 78)
    (40 : Fin 78) (23 : Fin 78) (61 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1311` (kalmanson). -/
theorem directSource_h1311 :
    ((!((rankAtom (directSourceRanks P) 26 == rankAtom (directSourceRanks P) 31)) || ((rankAtom (directSourceRanks P) 35).ult (rankAtom (directSourceRanks P) 40)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (40 : Fin 78) (26 : Fin 78)
    (35 : Fin 78) (31 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (6 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (35 : Fin 78) (31 : Fin 78) (26 : Fin 78)
    (40 : Fin 78) (23 : Fin 78) (61 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1312` (kalmanson). -/
theorem directSource_h1312 :
    ((!((rankAtom (directSourceRanks P) 26 == rankAtom (directSourceRanks P) 23)) || ((rankAtom (directSourceRanks P) 62).ult (rankAtom (directSourceRanks P) 41)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (41 : Fin 78) (26 : Fin 78)
    (62 : Fin 78) (23 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (6 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (35 : Fin 78) (32 : Fin 78) (26 : Fin 78)
    (41 : Fin 78) (23 : Fin 78) (62 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1313` (kalmanson). -/
theorem directSource_h1313 :
    ((!((rankAtom (directSourceRanks P) 26 == rankAtom (directSourceRanks P) 62)) || ((rankAtom (directSourceRanks P) 23).ult (rankAtom (directSourceRanks P) 41)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (41 : Fin 78) (26 : Fin 78)
    (23 : Fin 78) (62 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (6 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (35 : Fin 78) (32 : Fin 78) (26 : Fin 78)
    (41 : Fin 78) (23 : Fin 78) (62 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1314` (kalmanson). -/
theorem directSource_h1314 :
    ((!((rankAtom (directSourceRanks P) 26 == rankAtom (directSourceRanks P) 32)) || ((rankAtom (directSourceRanks P) 35).ult (rankAtom (directSourceRanks P) 41)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (41 : Fin 78) (26 : Fin 78)
    (35 : Fin 78) (32 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (6 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (35 : Fin 78) (32 : Fin 78) (26 : Fin 78)
    (41 : Fin 78) (23 : Fin 78) (62 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1315` (kalmanson). -/
theorem directSource_h1315 :
    ((!((rankAtom (directSourceRanks P) 27 == rankAtom (directSourceRanks P) 23)) || ((rankAtom (directSourceRanks P) 63).ult (rankAtom (directSourceRanks P) 37)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (37 : Fin 78) (27 : Fin 78)
    (63 : Fin 78) (23 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (7 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (36 : Fin 78) (28 : Fin 78) (27 : Fin 78)
    (37 : Fin 78) (23 : Fin 78) (63 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1316` (kalmanson). -/
theorem directSource_h1316 :
    ((!((rankAtom (directSourceRanks P) 37 == rankAtom (directSourceRanks P) 23)) || ((rankAtom (directSourceRanks P) 63).ult (rankAtom (directSourceRanks P) 27)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (27 : Fin 78) (37 : Fin 78)
    (63 : Fin 78) (23 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (7 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (36 : Fin 78) (28 : Fin 78) (27 : Fin 78)
    (37 : Fin 78) (23 : Fin 78) (63 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1317` (kalmanson). -/
theorem directSource_h1317 :
    ((!((rankAtom (directSourceRanks P) 37 == rankAtom (directSourceRanks P) 63)) || ((rankAtom (directSourceRanks P) 23).ult (rankAtom (directSourceRanks P) 27)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (27 : Fin 78) (37 : Fin 78)
    (23 : Fin 78) (63 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (7 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (36 : Fin 78) (28 : Fin 78) (27 : Fin 78)
    (37 : Fin 78) (23 : Fin 78) (63 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1318` (kalmanson). -/
theorem directSource_h1318 :
    ((!((rankAtom (directSourceRanks P) 27 == rankAtom (directSourceRanks P) 28)) || ((rankAtom (directSourceRanks P) 36).ult (rankAtom (directSourceRanks P) 37)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (37 : Fin 78) (27 : Fin 78)
    (36 : Fin 78) (28 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (7 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (36 : Fin 78) (28 : Fin 78) (27 : Fin 78)
    (37 : Fin 78) (23 : Fin 78) (63 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1319` (kalmanson). -/
theorem directSource_h1319 :
    ((!((rankAtom (directSourceRanks P) 37 == rankAtom (directSourceRanks P) 28)) || ((rankAtom (directSourceRanks P) 36).ult (rankAtom (directSourceRanks P) 27)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (27 : Fin 78) (37 : Fin 78)
    (36 : Fin 78) (28 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (7 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (36 : Fin 78) (28 : Fin 78) (27 : Fin 78)
    (37 : Fin 78) (23 : Fin 78) (63 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1320` (kalmanson). -/
theorem directSource_h1320 :
    ((!((rankAtom (directSourceRanks P) 27 == rankAtom (directSourceRanks P) 23)) || ((rankAtom (directSourceRanks P) 64).ult (rankAtom (directSourceRanks P) 38)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (38 : Fin 78) (27 : Fin 78)
    (64 : Fin 78) (23 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (7 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (36 : Fin 78) (29 : Fin 78) (27 : Fin 78)
    (38 : Fin 78) (23 : Fin 78) (64 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1321` (kalmanson). -/
theorem directSource_h1321 :
    ((!((rankAtom (directSourceRanks P) 27 == rankAtom (directSourceRanks P) 29)) || ((rankAtom (directSourceRanks P) 36).ult (rankAtom (directSourceRanks P) 38)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (38 : Fin 78) (27 : Fin 78)
    (36 : Fin 78) (29 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (7 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (36 : Fin 78) (29 : Fin 78) (27 : Fin 78)
    (38 : Fin 78) (23 : Fin 78) (64 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1322` (kalmanson). -/
theorem directSource_h1322 :
    ((!((rankAtom (directSourceRanks P) 27 == rankAtom (directSourceRanks P) 23)) || ((rankAtom (directSourceRanks P) 65).ult (rankAtom (directSourceRanks P) 39)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (39 : Fin 78) (27 : Fin 78)
    (65 : Fin 78) (23 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (7 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (36 : Fin 78) (30 : Fin 78) (27 : Fin 78)
    (39 : Fin 78) (23 : Fin 78) (65 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1323` (kalmanson). -/
theorem directSource_h1323 :
    ((!((rankAtom (directSourceRanks P) 27 == rankAtom (directSourceRanks P) 30)) || ((rankAtom (directSourceRanks P) 36).ult (rankAtom (directSourceRanks P) 39)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (39 : Fin 78) (27 : Fin 78)
    (36 : Fin 78) (30 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (7 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (36 : Fin 78) (30 : Fin 78) (27 : Fin 78)
    (39 : Fin 78) (23 : Fin 78) (65 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1324` (kalmanson). -/
theorem directSource_h1324 :
    ((!((rankAtom (directSourceRanks P) 27 == rankAtom (directSourceRanks P) 23)) || ((rankAtom (directSourceRanks P) 66).ult (rankAtom (directSourceRanks P) 40)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (40 : Fin 78) (27 : Fin 78)
    (66 : Fin 78) (23 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (7 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (36 : Fin 78) (31 : Fin 78) (27 : Fin 78)
    (40 : Fin 78) (23 : Fin 78) (66 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1325` (kalmanson). -/
theorem directSource_h1325 :
    ((!((rankAtom (directSourceRanks P) 27 == rankAtom (directSourceRanks P) 31)) || ((rankAtom (directSourceRanks P) 36).ult (rankAtom (directSourceRanks P) 40)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (40 : Fin 78) (27 : Fin 78)
    (36 : Fin 78) (31 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (7 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (36 : Fin 78) (31 : Fin 78) (27 : Fin 78)
    (40 : Fin 78) (23 : Fin 78) (66 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1326` (kalmanson). -/
theorem directSource_h1326 :
    ((!((rankAtom (directSourceRanks P) 27 == rankAtom (directSourceRanks P) 23)) || ((rankAtom (directSourceRanks P) 67).ult (rankAtom (directSourceRanks P) 41)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (41 : Fin 78) (27 : Fin 78)
    (67 : Fin 78) (23 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (7 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (36 : Fin 78) (32 : Fin 78) (27 : Fin 78)
    (41 : Fin 78) (23 : Fin 78) (67 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1327` (kalmanson). -/
theorem directSource_h1327 :
    ((!((rankAtom (directSourceRanks P) 27 == rankAtom (directSourceRanks P) 32)) || ((rankAtom (directSourceRanks P) 36).ult (rankAtom (directSourceRanks P) 41)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (41 : Fin 78) (27 : Fin 78)
    (36 : Fin 78) (32 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (7 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (36 : Fin 78) (32 : Fin 78) (27 : Fin 78)
    (41 : Fin 78) (23 : Fin 78) (67 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1328` (kalmanson). -/
theorem directSource_h1328 :
    ((!((rankAtom (directSourceRanks P) 28 == rankAtom (directSourceRanks P) 23)) || ((rankAtom (directSourceRanks P) 68).ult (rankAtom (directSourceRanks P) 38)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (38 : Fin 78) (28 : Fin 78)
    (68 : Fin 78) (23 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (8 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (37 : Fin 78) (29 : Fin 78) (28 : Fin 78)
    (38 : Fin 78) (23 : Fin 78) (68 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1329` (kalmanson). -/
theorem directSource_h1329 :
    ((!((rankAtom (directSourceRanks P) 28 == rankAtom (directSourceRanks P) 68)) || ((rankAtom (directSourceRanks P) 23).ult (rankAtom (directSourceRanks P) 38)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (38 : Fin 78) (28 : Fin 78)
    (23 : Fin 78) (68 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (8 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (37 : Fin 78) (29 : Fin 78) (28 : Fin 78)
    (38 : Fin 78) (23 : Fin 78) (68 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1330` (kalmanson). -/
theorem directSource_h1330 :
    ((!((rankAtom (directSourceRanks P) 28 == rankAtom (directSourceRanks P) 29)) || ((rankAtom (directSourceRanks P) 37).ult (rankAtom (directSourceRanks P) 38)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (38 : Fin 78) (28 : Fin 78)
    (37 : Fin 78) (29 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (8 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (37 : Fin 78) (29 : Fin 78) (28 : Fin 78)
    (38 : Fin 78) (23 : Fin 78) (68 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1331` (kalmanson). -/
theorem directSource_h1331 :
    ((!((rankAtom (directSourceRanks P) 28 == rankAtom (directSourceRanks P) 37)) || ((rankAtom (directSourceRanks P) 29).ult (rankAtom (directSourceRanks P) 38)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (38 : Fin 78) (28 : Fin 78)
    (29 : Fin 78) (37 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (8 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (37 : Fin 78) (29 : Fin 78) (28 : Fin 78)
    (38 : Fin 78) (23 : Fin 78) (68 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1332` (kalmanson). -/
theorem directSource_h1332 :
    ((!((rankAtom (directSourceRanks P) 28 == rankAtom (directSourceRanks P) 23)) || ((rankAtom (directSourceRanks P) 69).ult (rankAtom (directSourceRanks P) 39)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (39 : Fin 78) (28 : Fin 78)
    (69 : Fin 78) (23 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (8 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (37 : Fin 78) (30 : Fin 78) (28 : Fin 78)
    (39 : Fin 78) (23 : Fin 78) (69 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1333` (kalmanson). -/
theorem directSource_h1333 :
    ((!((rankAtom (directSourceRanks P) 28 == rankAtom (directSourceRanks P) 69)) || ((rankAtom (directSourceRanks P) 23).ult (rankAtom (directSourceRanks P) 39)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (39 : Fin 78) (28 : Fin 78)
    (23 : Fin 78) (69 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (8 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (37 : Fin 78) (30 : Fin 78) (28 : Fin 78)
    (39 : Fin 78) (23 : Fin 78) (69 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1334` (kalmanson). -/
theorem directSource_h1334 :
    ((!((rankAtom (directSourceRanks P) 28 == rankAtom (directSourceRanks P) 30)) || ((rankAtom (directSourceRanks P) 37).ult (rankAtom (directSourceRanks P) 39)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (39 : Fin 78) (28 : Fin 78)
    (37 : Fin 78) (30 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (8 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (37 : Fin 78) (30 : Fin 78) (28 : Fin 78)
    (39 : Fin 78) (23 : Fin 78) (69 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1335` (kalmanson). -/
theorem directSource_h1335 :
    ((!((rankAtom (directSourceRanks P) 28 == rankAtom (directSourceRanks P) 37)) || ((rankAtom (directSourceRanks P) 30).ult (rankAtom (directSourceRanks P) 39)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (39 : Fin 78) (28 : Fin 78)
    (30 : Fin 78) (37 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (8 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (37 : Fin 78) (30 : Fin 78) (28 : Fin 78)
    (39 : Fin 78) (23 : Fin 78) (69 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1336` (kalmanson). -/
theorem directSource_h1336 :
    ((!((rankAtom (directSourceRanks P) 28 == rankAtom (directSourceRanks P) 23)) || ((rankAtom (directSourceRanks P) 70).ult (rankAtom (directSourceRanks P) 40)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (40 : Fin 78) (28 : Fin 78)
    (70 : Fin 78) (23 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (8 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (37 : Fin 78) (31 : Fin 78) (28 : Fin 78)
    (40 : Fin 78) (23 : Fin 78) (70 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1337` (kalmanson). -/
theorem directSource_h1337 :
    ((!((rankAtom (directSourceRanks P) 28 == rankAtom (directSourceRanks P) 70)) || ((rankAtom (directSourceRanks P) 23).ult (rankAtom (directSourceRanks P) 40)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (40 : Fin 78) (28 : Fin 78)
    (23 : Fin 78) (70 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (8 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (37 : Fin 78) (31 : Fin 78) (28 : Fin 78)
    (40 : Fin 78) (23 : Fin 78) (70 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1338` (kalmanson). -/
theorem directSource_h1338 :
    ((!((rankAtom (directSourceRanks P) 28 == rankAtom (directSourceRanks P) 31)) || ((rankAtom (directSourceRanks P) 37).ult (rankAtom (directSourceRanks P) 40)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (40 : Fin 78) (28 : Fin 78)
    (37 : Fin 78) (31 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (8 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (37 : Fin 78) (31 : Fin 78) (28 : Fin 78)
    (40 : Fin 78) (23 : Fin 78) (70 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1339` (kalmanson). -/
theorem directSource_h1339 :
    ((!((rankAtom (directSourceRanks P) 28 == rankAtom (directSourceRanks P) 37)) || ((rankAtom (directSourceRanks P) 31).ult (rankAtom (directSourceRanks P) 40)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (40 : Fin 78) (28 : Fin 78)
    (31 : Fin 78) (37 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (8 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (37 : Fin 78) (31 : Fin 78) (28 : Fin 78)
    (40 : Fin 78) (23 : Fin 78) (70 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1340` (kalmanson). -/
theorem directSource_h1340 :
    ((!((rankAtom (directSourceRanks P) 28 == rankAtom (directSourceRanks P) 23)) || ((rankAtom (directSourceRanks P) 71).ult (rankAtom (directSourceRanks P) 41)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (41 : Fin 78) (28 : Fin 78)
    (71 : Fin 78) (23 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (8 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (37 : Fin 78) (32 : Fin 78) (28 : Fin 78)
    (41 : Fin 78) (23 : Fin 78) (71 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1341` (kalmanson). -/
theorem directSource_h1341 :
    ((!((rankAtom (directSourceRanks P) 28 == rankAtom (directSourceRanks P) 71)) || ((rankAtom (directSourceRanks P) 23).ult (rankAtom (directSourceRanks P) 41)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (41 : Fin 78) (28 : Fin 78)
    (23 : Fin 78) (71 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (8 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (37 : Fin 78) (32 : Fin 78) (28 : Fin 78)
    (41 : Fin 78) (23 : Fin 78) (71 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1342` (kalmanson). -/
theorem directSource_h1342 :
    ((!((rankAtom (directSourceRanks P) 28 == rankAtom (directSourceRanks P) 32)) || ((rankAtom (directSourceRanks P) 37).ult (rankAtom (directSourceRanks P) 41)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (41 : Fin 78) (28 : Fin 78)
    (37 : Fin 78) (32 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (8 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (37 : Fin 78) (32 : Fin 78) (28 : Fin 78)
    (41 : Fin 78) (23 : Fin 78) (71 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1343` (kalmanson). -/
theorem directSource_h1343 :
    ((!((rankAtom (directSourceRanks P) 28 == rankAtom (directSourceRanks P) 37)) || ((rankAtom (directSourceRanks P) 32).ult (rankAtom (directSourceRanks P) 41)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (41 : Fin 78) (28 : Fin 78)
    (32 : Fin 78) (37 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (8 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (37 : Fin 78) (32 : Fin 78) (28 : Fin 78)
    (41 : Fin 78) (23 : Fin 78) (71 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

end

end ATailExactFiveCard13CnfIngressScratch
end Problem97
