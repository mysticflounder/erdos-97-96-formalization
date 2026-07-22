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

/-- Exact pass-5 source assertion `h1344` (kalmanson). -/
theorem directSource_h1344 :
    ((!((rankAtom (directSourceRanks P) 29 == rankAtom (directSourceRanks P) 30)) || ((rankAtom (directSourceRanks P) 38).ult (rankAtom (directSourceRanks P) 39)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (39 : Fin 78) (29 : Fin 78)
    (38 : Fin 78) (30 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (9 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (38 : Fin 78) (30 : Fin 78) (29 : Fin 78)
    (39 : Fin 78) (23 : Fin 78) (72 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1345` (kalmanson). -/
theorem directSource_h1345 :
    ((!((rankAtom (directSourceRanks P) 29 == rankAtom (directSourceRanks P) 31)) || ((rankAtom (directSourceRanks P) 38).ult (rankAtom (directSourceRanks P) 40)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (40 : Fin 78) (29 : Fin 78)
    (38 : Fin 78) (31 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (9 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (38 : Fin 78) (31 : Fin 78) (29 : Fin 78)
    (40 : Fin 78) (23 : Fin 78) (73 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1346` (kalmanson). -/
theorem directSource_h1346 :
    ((!((rankAtom (directSourceRanks P) 29 == rankAtom (directSourceRanks P) 32)) || ((rankAtom (directSourceRanks P) 38).ult (rankAtom (directSourceRanks P) 41)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (41 : Fin 78) (29 : Fin 78)
    (38 : Fin 78) (32 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (9 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (38 : Fin 78) (32 : Fin 78) (29 : Fin 78)
    (41 : Fin 78) (23 : Fin 78) (74 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1347` (kalmanson). -/
theorem directSource_h1347 :
    ((!((rankAtom (directSourceRanks P) 30 == rankAtom (directSourceRanks P) 31)) || ((rankAtom (directSourceRanks P) 39).ult (rankAtom (directSourceRanks P) 40)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (40 : Fin 78) (30 : Fin 78)
    (39 : Fin 78) (31 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (10 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (39 : Fin 78) (31 : Fin 78) (30 : Fin 78)
    (40 : Fin 78) (23 : Fin 78) (75 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1348` (kalmanson). -/
theorem directSource_h1348 :
    ((!((rankAtom (directSourceRanks P) 30 == rankAtom (directSourceRanks P) 32)) || ((rankAtom (directSourceRanks P) 39).ult (rankAtom (directSourceRanks P) 41)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (41 : Fin 78) (30 : Fin 78)
    (39 : Fin 78) (32 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (10 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (39 : Fin 78) (32 : Fin 78) (30 : Fin 78)
    (41 : Fin 78) (23 : Fin 78) (76 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1349` (kalmanson). -/
theorem directSource_h1349 :
    ((!((rankAtom (directSourceRanks P) 31 == rankAtom (directSourceRanks P) 32)) || ((rankAtom (directSourceRanks P) 40).ult (rankAtom (directSourceRanks P) 41)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (41 : Fin 78) (31 : Fin 78)
    (40 : Fin 78) (32 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (11 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (40 : Fin 78) (32 : Fin 78) (31 : Fin 78)
    (41 : Fin 78) (23 : Fin 78) (77 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1350` (kalmanson). -/
theorem directSource_h1350 :
    ((!((rankAtom (directSourceRanks P) 25 == rankAtom (directSourceRanks P) 50)) || ((rankAtom (directSourceRanks P) 24).ult (rankAtom (directSourceRanks P) 43)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (43 : Fin 78) (25 : Fin 78)
    (24 : Fin 78) (50 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (4 : Fin 13) (5 : Fin 13) (6 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (26 : Fin 78) (25 : Fin 78)
    (43 : Fin 78) (24 : Fin 78) (50 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1351` (kalmanson). -/
theorem directSource_h1351 :
    ((!((rankAtom (directSourceRanks P) 43 == rankAtom (directSourceRanks P) 24)) || ((rankAtom (directSourceRanks P) 50).ult (rankAtom (directSourceRanks P) 25)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (25 : Fin 78) (43 : Fin 78)
    (50 : Fin 78) (24 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (4 : Fin 13) (5 : Fin 13) (6 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (26 : Fin 78) (25 : Fin 78)
    (43 : Fin 78) (24 : Fin 78) (50 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1352` (kalmanson). -/
theorem directSource_h1352 :
    ((!((rankAtom (directSourceRanks P) 43 == rankAtom (directSourceRanks P) 50)) || ((rankAtom (directSourceRanks P) 24).ult (rankAtom (directSourceRanks P) 25)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (25 : Fin 78) (43 : Fin 78)
    (24 : Fin 78) (50 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (4 : Fin 13) (5 : Fin 13) (6 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (26 : Fin 78) (25 : Fin 78)
    (43 : Fin 78) (24 : Fin 78) (50 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1353` (kalmanson). -/
theorem directSource_h1353 :
    ((!((rankAtom (directSourceRanks P) 25 == rankAtom (directSourceRanks P) 26)) || ((rankAtom (directSourceRanks P) 42).ult (rankAtom (directSourceRanks P) 43)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (43 : Fin 78) (25 : Fin 78)
    (42 : Fin 78) (26 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (4 : Fin 13) (5 : Fin 13) (6 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (26 : Fin 78) (25 : Fin 78)
    (43 : Fin 78) (24 : Fin 78) (50 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1354` (kalmanson). -/
theorem directSource_h1354 :
    ((!((rankAtom (directSourceRanks P) 25 == rankAtom (directSourceRanks P) 42)) || ((rankAtom (directSourceRanks P) 26).ult (rankAtom (directSourceRanks P) 43)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (43 : Fin 78) (25 : Fin 78)
    (26 : Fin 78) (42 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (4 : Fin 13) (5 : Fin 13) (6 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (26 : Fin 78) (25 : Fin 78)
    (43 : Fin 78) (24 : Fin 78) (50 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1355` (kalmanson). -/
theorem directSource_h1355 :
    ((!((rankAtom (directSourceRanks P) 43 == rankAtom (directSourceRanks P) 26)) || ((rankAtom (directSourceRanks P) 42).ult (rankAtom (directSourceRanks P) 25)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (25 : Fin 78) (43 : Fin 78)
    (42 : Fin 78) (26 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (4 : Fin 13) (5 : Fin 13) (6 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (26 : Fin 78) (25 : Fin 78)
    (43 : Fin 78) (24 : Fin 78) (50 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1356` (kalmanson). -/
theorem directSource_h1356 :
    ((!((rankAtom (directSourceRanks P) 43 == rankAtom (directSourceRanks P) 42)) || ((rankAtom (directSourceRanks P) 26).ult (rankAtom (directSourceRanks P) 25)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (25 : Fin 78) (43 : Fin 78)
    (26 : Fin 78) (42 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (4 : Fin 13) (5 : Fin 13) (6 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (26 : Fin 78) (25 : Fin 78)
    (43 : Fin 78) (24 : Fin 78) (50 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1357` (kalmanson). -/
theorem directSource_h1357 :
    ((!((rankAtom (directSourceRanks P) 25 == rankAtom (directSourceRanks P) 51)) || ((rankAtom (directSourceRanks P) 24).ult (rankAtom (directSourceRanks P) 44)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (44 : Fin 78) (25 : Fin 78)
    (24 : Fin 78) (51 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (4 : Fin 13) (5 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (27 : Fin 78) (25 : Fin 78)
    (44 : Fin 78) (24 : Fin 78) (51 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1358` (kalmanson). -/
theorem directSource_h1358 :
    ((!((rankAtom (directSourceRanks P) 44 == rankAtom (directSourceRanks P) 51)) || ((rankAtom (directSourceRanks P) 24).ult (rankAtom (directSourceRanks P) 25)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (25 : Fin 78) (44 : Fin 78)
    (24 : Fin 78) (51 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (4 : Fin 13) (5 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (27 : Fin 78) (25 : Fin 78)
    (44 : Fin 78) (24 : Fin 78) (51 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1359` (kalmanson). -/
theorem directSource_h1359 :
    ((!((rankAtom (directSourceRanks P) 25 == rankAtom (directSourceRanks P) 27)) || ((rankAtom (directSourceRanks P) 42).ult (rankAtom (directSourceRanks P) 44)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (44 : Fin 78) (25 : Fin 78)
    (42 : Fin 78) (27 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (4 : Fin 13) (5 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (27 : Fin 78) (25 : Fin 78)
    (44 : Fin 78) (24 : Fin 78) (51 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1360` (kalmanson). -/
theorem directSource_h1360 :
    ((!((rankAtom (directSourceRanks P) 25 == rankAtom (directSourceRanks P) 42)) || ((rankAtom (directSourceRanks P) 27).ult (rankAtom (directSourceRanks P) 44)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (44 : Fin 78) (25 : Fin 78)
    (27 : Fin 78) (42 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (4 : Fin 13) (5 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (27 : Fin 78) (25 : Fin 78)
    (44 : Fin 78) (24 : Fin 78) (51 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1361` (kalmanson). -/
theorem directSource_h1361 :
    ((!((rankAtom (directSourceRanks P) 25 == rankAtom (directSourceRanks P) 52)) || ((rankAtom (directSourceRanks P) 24).ult (rankAtom (directSourceRanks P) 45)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (45 : Fin 78) (25 : Fin 78)
    (24 : Fin 78) (52 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (4 : Fin 13) (5 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (28 : Fin 78) (25 : Fin 78)
    (45 : Fin 78) (24 : Fin 78) (52 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1362` (kalmanson). -/
theorem directSource_h1362 :
    ((!((rankAtom (directSourceRanks P) 25 == rankAtom (directSourceRanks P) 28)) || ((rankAtom (directSourceRanks P) 42).ult (rankAtom (directSourceRanks P) 45)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (45 : Fin 78) (25 : Fin 78)
    (42 : Fin 78) (28 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (4 : Fin 13) (5 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (28 : Fin 78) (25 : Fin 78)
    (45 : Fin 78) (24 : Fin 78) (52 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1363` (kalmanson). -/
theorem directSource_h1363 :
    ((!((rankAtom (directSourceRanks P) 25 == rankAtom (directSourceRanks P) 42)) || ((rankAtom (directSourceRanks P) 28).ult (rankAtom (directSourceRanks P) 45)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (45 : Fin 78) (25 : Fin 78)
    (28 : Fin 78) (42 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (4 : Fin 13) (5 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (28 : Fin 78) (25 : Fin 78)
    (45 : Fin 78) (24 : Fin 78) (52 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1364` (kalmanson). -/
theorem directSource_h1364 :
    ((!((rankAtom (directSourceRanks P) 45 == rankAtom (directSourceRanks P) 28)) || ((rankAtom (directSourceRanks P) 42).ult (rankAtom (directSourceRanks P) 25)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (25 : Fin 78) (45 : Fin 78)
    (42 : Fin 78) (28 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (4 : Fin 13) (5 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (28 : Fin 78) (25 : Fin 78)
    (45 : Fin 78) (24 : Fin 78) (52 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1365` (kalmanson). -/
theorem directSource_h1365 :
    ((!((rankAtom (directSourceRanks P) 46 == rankAtom (directSourceRanks P) 24)) || ((rankAtom (directSourceRanks P) 53).ult (rankAtom (directSourceRanks P) 25)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (25 : Fin 78) (46 : Fin 78)
    (53 : Fin 78) (24 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (4 : Fin 13) (5 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (29 : Fin 78) (25 : Fin 78)
    (46 : Fin 78) (24 : Fin 78) (53 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1366` (kalmanson). -/
theorem directSource_h1366 :
    ((!((rankAtom (directSourceRanks P) 46 == rankAtom (directSourceRanks P) 53)) || ((rankAtom (directSourceRanks P) 24).ult (rankAtom (directSourceRanks P) 25)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (25 : Fin 78) (46 : Fin 78)
    (24 : Fin 78) (53 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (4 : Fin 13) (5 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (29 : Fin 78) (25 : Fin 78)
    (46 : Fin 78) (24 : Fin 78) (53 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1367` (kalmanson). -/
theorem directSource_h1367 :
    ((!((rankAtom (directSourceRanks P) 25 == rankAtom (directSourceRanks P) 42)) || ((rankAtom (directSourceRanks P) 29).ult (rankAtom (directSourceRanks P) 46)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (46 : Fin 78) (25 : Fin 78)
    (29 : Fin 78) (42 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (4 : Fin 13) (5 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (29 : Fin 78) (25 : Fin 78)
    (46 : Fin 78) (24 : Fin 78) (53 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1368` (kalmanson). -/
theorem directSource_h1368 :
    ((!((rankAtom (directSourceRanks P) 46 == rankAtom (directSourceRanks P) 42)) || ((rankAtom (directSourceRanks P) 29).ult (rankAtom (directSourceRanks P) 25)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (25 : Fin 78) (46 : Fin 78)
    (29 : Fin 78) (42 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (4 : Fin 13) (5 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (29 : Fin 78) (25 : Fin 78)
    (46 : Fin 78) (24 : Fin 78) (53 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1369` (kalmanson). -/
theorem directSource_h1369 :
    ((!((rankAtom (directSourceRanks P) 25 == rankAtom (directSourceRanks P) 54)) || ((rankAtom (directSourceRanks P) 24).ult (rankAtom (directSourceRanks P) 47)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (47 : Fin 78) (25 : Fin 78)
    (24 : Fin 78) (54 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (4 : Fin 13) (5 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (30 : Fin 78) (25 : Fin 78)
    (47 : Fin 78) (24 : Fin 78) (54 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1370` (kalmanson). -/
theorem directSource_h1370 :
    ((!((rankAtom (directSourceRanks P) 47 == rankAtom (directSourceRanks P) 24)) || ((rankAtom (directSourceRanks P) 54).ult (rankAtom (directSourceRanks P) 25)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (25 : Fin 78) (47 : Fin 78)
    (54 : Fin 78) (24 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (4 : Fin 13) (5 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (30 : Fin 78) (25 : Fin 78)
    (47 : Fin 78) (24 : Fin 78) (54 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1371` (kalmanson). -/
theorem directSource_h1371 :
    ((!((rankAtom (directSourceRanks P) 47 == rankAtom (directSourceRanks P) 54)) || ((rankAtom (directSourceRanks P) 24).ult (rankAtom (directSourceRanks P) 25)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (25 : Fin 78) (47 : Fin 78)
    (24 : Fin 78) (54 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (4 : Fin 13) (5 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (30 : Fin 78) (25 : Fin 78)
    (47 : Fin 78) (24 : Fin 78) (54 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1372` (kalmanson). -/
theorem directSource_h1372 :
    ((!((rankAtom (directSourceRanks P) 25 == rankAtom (directSourceRanks P) 42)) || ((rankAtom (directSourceRanks P) 30).ult (rankAtom (directSourceRanks P) 47)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (47 : Fin 78) (25 : Fin 78)
    (30 : Fin 78) (42 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (4 : Fin 13) (5 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (30 : Fin 78) (25 : Fin 78)
    (47 : Fin 78) (24 : Fin 78) (54 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1373` (kalmanson). -/
theorem directSource_h1373 :
    ((!((rankAtom (directSourceRanks P) 47 == rankAtom (directSourceRanks P) 42)) || ((rankAtom (directSourceRanks P) 30).ult (rankAtom (directSourceRanks P) 25)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (25 : Fin 78) (47 : Fin 78)
    (30 : Fin 78) (42 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (4 : Fin 13) (5 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (30 : Fin 78) (25 : Fin 78)
    (47 : Fin 78) (24 : Fin 78) (54 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1374` (kalmanson). -/
theorem directSource_h1374 :
    ((!((rankAtom (directSourceRanks P) 25 == rankAtom (directSourceRanks P) 55)) || ((rankAtom (directSourceRanks P) 24).ult (rankAtom (directSourceRanks P) 48)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (48 : Fin 78) (25 : Fin 78)
    (24 : Fin 78) (55 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (4 : Fin 13) (5 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (31 : Fin 78) (25 : Fin 78)
    (48 : Fin 78) (24 : Fin 78) (55 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1375` (kalmanson). -/
theorem directSource_h1375 :
    ((!((rankAtom (directSourceRanks P) 48 == rankAtom (directSourceRanks P) 24)) || ((rankAtom (directSourceRanks P) 55).ult (rankAtom (directSourceRanks P) 25)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (25 : Fin 78) (48 : Fin 78)
    (55 : Fin 78) (24 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (4 : Fin 13) (5 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (31 : Fin 78) (25 : Fin 78)
    (48 : Fin 78) (24 : Fin 78) (55 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1376` (kalmanson). -/
theorem directSource_h1376 :
    ((!((rankAtom (directSourceRanks P) 48 == rankAtom (directSourceRanks P) 55)) || ((rankAtom (directSourceRanks P) 24).ult (rankAtom (directSourceRanks P) 25)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (25 : Fin 78) (48 : Fin 78)
    (24 : Fin 78) (55 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (4 : Fin 13) (5 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (31 : Fin 78) (25 : Fin 78)
    (48 : Fin 78) (24 : Fin 78) (55 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1377` (kalmanson). -/
theorem directSource_h1377 :
    ((!((rankAtom (directSourceRanks P) 48 == rankAtom (directSourceRanks P) 42)) || ((rankAtom (directSourceRanks P) 31).ult (rankAtom (directSourceRanks P) 25)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (25 : Fin 78) (48 : Fin 78)
    (31 : Fin 78) (42 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (4 : Fin 13) (5 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (31 : Fin 78) (25 : Fin 78)
    (48 : Fin 78) (24 : Fin 78) (55 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1378` (kalmanson). -/
theorem directSource_h1378 :
    ((!((rankAtom (directSourceRanks P) 25 == rankAtom (directSourceRanks P) 56)) || ((rankAtom (directSourceRanks P) 24).ult (rankAtom (directSourceRanks P) 49)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (49 : Fin 78) (25 : Fin 78)
    (24 : Fin 78) (56 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (4 : Fin 13) (5 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (32 : Fin 78) (25 : Fin 78)
    (49 : Fin 78) (24 : Fin 78) (56 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1379` (kalmanson). -/
theorem directSource_h1379 :
    ((!((rankAtom (directSourceRanks P) 49 == rankAtom (directSourceRanks P) 24)) || ((rankAtom (directSourceRanks P) 56).ult (rankAtom (directSourceRanks P) 25)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (25 : Fin 78) (49 : Fin 78)
    (56 : Fin 78) (24 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (4 : Fin 13) (5 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (32 : Fin 78) (25 : Fin 78)
    (49 : Fin 78) (24 : Fin 78) (56 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1380` (kalmanson). -/
theorem directSource_h1380 :
    ((!((rankAtom (directSourceRanks P) 49 == rankAtom (directSourceRanks P) 56)) || ((rankAtom (directSourceRanks P) 24).ult (rankAtom (directSourceRanks P) 25)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (25 : Fin 78) (49 : Fin 78)
    (24 : Fin 78) (56 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (4 : Fin 13) (5 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (32 : Fin 78) (25 : Fin 78)
    (49 : Fin 78) (24 : Fin 78) (56 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1381` (kalmanson). -/
theorem directSource_h1381 :
    ((!((rankAtom (directSourceRanks P) 49 == rankAtom (directSourceRanks P) 42)) || ((rankAtom (directSourceRanks P) 32).ult (rankAtom (directSourceRanks P) 25)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (25 : Fin 78) (49 : Fin 78)
    (32 : Fin 78) (42 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (4 : Fin 13) (5 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (32 : Fin 78) (25 : Fin 78)
    (49 : Fin 78) (24 : Fin 78) (56 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1382` (kalmanson). -/
theorem directSource_h1382 :
    ((!((rankAtom (directSourceRanks P) 26 == rankAtom (directSourceRanks P) 57)) || ((rankAtom (directSourceRanks P) 24).ult (rankAtom (directSourceRanks P) 44)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (44 : Fin 78) (26 : Fin 78)
    (24 : Fin 78) (57 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (4 : Fin 13) (6 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (43 : Fin 78) (27 : Fin 78) (26 : Fin 78)
    (44 : Fin 78) (24 : Fin 78) (57 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1383` (kalmanson). -/
theorem directSource_h1383 :
    ((!((rankAtom (directSourceRanks P) 26 == rankAtom (directSourceRanks P) 27)) || ((rankAtom (directSourceRanks P) 43).ult (rankAtom (directSourceRanks P) 44)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (44 : Fin 78) (26 : Fin 78)
    (43 : Fin 78) (27 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (4 : Fin 13) (6 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (43 : Fin 78) (27 : Fin 78) (26 : Fin 78)
    (44 : Fin 78) (24 : Fin 78) (57 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1384` (kalmanson). -/
theorem directSource_h1384 :
    ((!((rankAtom (directSourceRanks P) 26 == rankAtom (directSourceRanks P) 43)) || ((rankAtom (directSourceRanks P) 27).ult (rankAtom (directSourceRanks P) 44)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (44 : Fin 78) (26 : Fin 78)
    (27 : Fin 78) (43 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (4 : Fin 13) (6 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (43 : Fin 78) (27 : Fin 78) (26 : Fin 78)
    (44 : Fin 78) (24 : Fin 78) (57 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1385` (kalmanson). -/
theorem directSource_h1385 :
    ((!((rankAtom (directSourceRanks P) 26 == rankAtom (directSourceRanks P) 58)) || ((rankAtom (directSourceRanks P) 24).ult (rankAtom (directSourceRanks P) 45)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (45 : Fin 78) (26 : Fin 78)
    (24 : Fin 78) (58 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (4 : Fin 13) (6 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (43 : Fin 78) (28 : Fin 78) (26 : Fin 78)
    (45 : Fin 78) (24 : Fin 78) (58 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1386` (kalmanson). -/
theorem directSource_h1386 :
    ((!((rankAtom (directSourceRanks P) 26 == rankAtom (directSourceRanks P) 28)) || ((rankAtom (directSourceRanks P) 43).ult (rankAtom (directSourceRanks P) 45)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (45 : Fin 78) (26 : Fin 78)
    (43 : Fin 78) (28 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (4 : Fin 13) (6 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (43 : Fin 78) (28 : Fin 78) (26 : Fin 78)
    (45 : Fin 78) (24 : Fin 78) (58 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1387` (kalmanson). -/
theorem directSource_h1387 :
    ((!((rankAtom (directSourceRanks P) 26 == rankAtom (directSourceRanks P) 43)) || ((rankAtom (directSourceRanks P) 28).ult (rankAtom (directSourceRanks P) 45)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (45 : Fin 78) (26 : Fin 78)
    (28 : Fin 78) (43 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (4 : Fin 13) (6 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (43 : Fin 78) (28 : Fin 78) (26 : Fin 78)
    (45 : Fin 78) (24 : Fin 78) (58 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1388` (kalmanson). -/
theorem directSource_h1388 :
    ((!((rankAtom (directSourceRanks P) 45 == rankAtom (directSourceRanks P) 28)) || ((rankAtom (directSourceRanks P) 43).ult (rankAtom (directSourceRanks P) 26)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (26 : Fin 78) (45 : Fin 78)
    (43 : Fin 78) (28 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (4 : Fin 13) (6 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (43 : Fin 78) (28 : Fin 78) (26 : Fin 78)
    (45 : Fin 78) (24 : Fin 78) (58 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1389` (kalmanson). -/
theorem directSource_h1389 :
    ((!((rankAtom (directSourceRanks P) 46 == rankAtom (directSourceRanks P) 24)) || ((rankAtom (directSourceRanks P) 59).ult (rankAtom (directSourceRanks P) 26)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (26 : Fin 78) (46 : Fin 78)
    (59 : Fin 78) (24 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (4 : Fin 13) (6 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (43 : Fin 78) (29 : Fin 78) (26 : Fin 78)
    (46 : Fin 78) (24 : Fin 78) (59 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1390` (kalmanson). -/
theorem directSource_h1390 :
    ((!((rankAtom (directSourceRanks P) 46 == rankAtom (directSourceRanks P) 59)) || ((rankAtom (directSourceRanks P) 24).ult (rankAtom (directSourceRanks P) 26)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (26 : Fin 78) (46 : Fin 78)
    (24 : Fin 78) (59 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (4 : Fin 13) (6 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (43 : Fin 78) (29 : Fin 78) (26 : Fin 78)
    (46 : Fin 78) (24 : Fin 78) (59 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1391` (kalmanson). -/
theorem directSource_h1391 :
    ((!((rankAtom (directSourceRanks P) 26 == rankAtom (directSourceRanks P) 29)) || ((rankAtom (directSourceRanks P) 43).ult (rankAtom (directSourceRanks P) 46)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (46 : Fin 78) (26 : Fin 78)
    (43 : Fin 78) (29 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (4 : Fin 13) (6 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (43 : Fin 78) (29 : Fin 78) (26 : Fin 78)
    (46 : Fin 78) (24 : Fin 78) (59 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1392` (kalmanson). -/
theorem directSource_h1392 :
    ((!((rankAtom (directSourceRanks P) 26 == rankAtom (directSourceRanks P) 43)) || ((rankAtom (directSourceRanks P) 29).ult (rankAtom (directSourceRanks P) 46)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (46 : Fin 78) (26 : Fin 78)
    (29 : Fin 78) (43 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (4 : Fin 13) (6 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (43 : Fin 78) (29 : Fin 78) (26 : Fin 78)
    (46 : Fin 78) (24 : Fin 78) (59 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1393` (kalmanson). -/
theorem directSource_h1393 :
    ((!((rankAtom (directSourceRanks P) 46 == rankAtom (directSourceRanks P) 43)) || ((rankAtom (directSourceRanks P) 29).ult (rankAtom (directSourceRanks P) 26)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (26 : Fin 78) (46 : Fin 78)
    (29 : Fin 78) (43 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (4 : Fin 13) (6 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (43 : Fin 78) (29 : Fin 78) (26 : Fin 78)
    (46 : Fin 78) (24 : Fin 78) (59 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1394` (kalmanson). -/
theorem directSource_h1394 :
    ((!((rankAtom (directSourceRanks P) 47 == rankAtom (directSourceRanks P) 24)) || ((rankAtom (directSourceRanks P) 60).ult (rankAtom (directSourceRanks P) 26)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (26 : Fin 78) (47 : Fin 78)
    (60 : Fin 78) (24 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (4 : Fin 13) (6 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (43 : Fin 78) (30 : Fin 78) (26 : Fin 78)
    (47 : Fin 78) (24 : Fin 78) (60 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1395` (kalmanson). -/
theorem directSource_h1395 :
    ((!((rankAtom (directSourceRanks P) 47 == rankAtom (directSourceRanks P) 60)) || ((rankAtom (directSourceRanks P) 24).ult (rankAtom (directSourceRanks P) 26)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (26 : Fin 78) (47 : Fin 78)
    (24 : Fin 78) (60 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (4 : Fin 13) (6 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (43 : Fin 78) (30 : Fin 78) (26 : Fin 78)
    (47 : Fin 78) (24 : Fin 78) (60 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1396` (kalmanson). -/
theorem directSource_h1396 :
    ((!((rankAtom (directSourceRanks P) 26 == rankAtom (directSourceRanks P) 30)) || ((rankAtom (directSourceRanks P) 43).ult (rankAtom (directSourceRanks P) 47)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (47 : Fin 78) (26 : Fin 78)
    (43 : Fin 78) (30 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (4 : Fin 13) (6 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (43 : Fin 78) (30 : Fin 78) (26 : Fin 78)
    (47 : Fin 78) (24 : Fin 78) (60 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1397` (kalmanson). -/
theorem directSource_h1397 :
    ((!((rankAtom (directSourceRanks P) 26 == rankAtom (directSourceRanks P) 43)) || ((rankAtom (directSourceRanks P) 30).ult (rankAtom (directSourceRanks P) 47)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (47 : Fin 78) (26 : Fin 78)
    (30 : Fin 78) (43 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (4 : Fin 13) (6 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (43 : Fin 78) (30 : Fin 78) (26 : Fin 78)
    (47 : Fin 78) (24 : Fin 78) (60 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1398` (kalmanson). -/
theorem directSource_h1398 :
    ((!((rankAtom (directSourceRanks P) 47 == rankAtom (directSourceRanks P) 43)) || ((rankAtom (directSourceRanks P) 30).ult (rankAtom (directSourceRanks P) 26)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (26 : Fin 78) (47 : Fin 78)
    (30 : Fin 78) (43 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (4 : Fin 13) (6 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (43 : Fin 78) (30 : Fin 78) (26 : Fin 78)
    (47 : Fin 78) (24 : Fin 78) (60 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1399` (kalmanson). -/
theorem directSource_h1399 :
    ((!((rankAtom (directSourceRanks P) 48 == rankAtom (directSourceRanks P) 24)) || ((rankAtom (directSourceRanks P) 61).ult (rankAtom (directSourceRanks P) 26)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (26 : Fin 78) (48 : Fin 78)
    (61 : Fin 78) (24 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (4 : Fin 13) (6 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (43 : Fin 78) (31 : Fin 78) (26 : Fin 78)
    (48 : Fin 78) (24 : Fin 78) (61 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1400` (kalmanson). -/
theorem directSource_h1400 :
    ((!((rankAtom (directSourceRanks P) 26 == rankAtom (directSourceRanks P) 31)) || ((rankAtom (directSourceRanks P) 43).ult (rankAtom (directSourceRanks P) 48)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (48 : Fin 78) (26 : Fin 78)
    (43 : Fin 78) (31 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (4 : Fin 13) (6 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (43 : Fin 78) (31 : Fin 78) (26 : Fin 78)
    (48 : Fin 78) (24 : Fin 78) (61 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1401` (kalmanson). -/
theorem directSource_h1401 :
    ((!((rankAtom (directSourceRanks P) 26 == rankAtom (directSourceRanks P) 43)) || ((rankAtom (directSourceRanks P) 31).ult (rankAtom (directSourceRanks P) 48)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (48 : Fin 78) (26 : Fin 78)
    (31 : Fin 78) (43 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (4 : Fin 13) (6 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (43 : Fin 78) (31 : Fin 78) (26 : Fin 78)
    (48 : Fin 78) (24 : Fin 78) (61 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1402` (kalmanson). -/
theorem directSource_h1402 :
    ((!((rankAtom (directSourceRanks P) 48 == rankAtom (directSourceRanks P) 43)) || ((rankAtom (directSourceRanks P) 31).ult (rankAtom (directSourceRanks P) 26)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (26 : Fin 78) (48 : Fin 78)
    (31 : Fin 78) (43 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (4 : Fin 13) (6 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (43 : Fin 78) (31 : Fin 78) (26 : Fin 78)
    (48 : Fin 78) (24 : Fin 78) (61 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1403` (kalmanson). -/
theorem directSource_h1403 :
    ((!((rankAtom (directSourceRanks P) 26 == rankAtom (directSourceRanks P) 62)) || ((rankAtom (directSourceRanks P) 24).ult (rankAtom (directSourceRanks P) 49)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (49 : Fin 78) (26 : Fin 78)
    (24 : Fin 78) (62 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (4 : Fin 13) (6 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (43 : Fin 78) (32 : Fin 78) (26 : Fin 78)
    (49 : Fin 78) (24 : Fin 78) (62 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1404` (kalmanson). -/
theorem directSource_h1404 :
    ((!((rankAtom (directSourceRanks P) 49 == rankAtom (directSourceRanks P) 24)) || ((rankAtom (directSourceRanks P) 62).ult (rankAtom (directSourceRanks P) 26)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (26 : Fin 78) (49 : Fin 78)
    (62 : Fin 78) (24 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (4 : Fin 13) (6 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (43 : Fin 78) (32 : Fin 78) (26 : Fin 78)
    (49 : Fin 78) (24 : Fin 78) (62 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1405` (kalmanson). -/
theorem directSource_h1405 :
    ((!((rankAtom (directSourceRanks P) 26 == rankAtom (directSourceRanks P) 32)) || ((rankAtom (directSourceRanks P) 43).ult (rankAtom (directSourceRanks P) 49)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (49 : Fin 78) (26 : Fin 78)
    (43 : Fin 78) (32 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (4 : Fin 13) (6 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (43 : Fin 78) (32 : Fin 78) (26 : Fin 78)
    (49 : Fin 78) (24 : Fin 78) (62 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1406` (kalmanson). -/
theorem directSource_h1406 :
    ((!((rankAtom (directSourceRanks P) 26 == rankAtom (directSourceRanks P) 43)) || ((rankAtom (directSourceRanks P) 32).ult (rankAtom (directSourceRanks P) 49)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (49 : Fin 78) (26 : Fin 78)
    (32 : Fin 78) (43 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (4 : Fin 13) (6 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (43 : Fin 78) (32 : Fin 78) (26 : Fin 78)
    (49 : Fin 78) (24 : Fin 78) (62 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1407` (kalmanson). -/
theorem directSource_h1407 :
    ((!((rankAtom (directSourceRanks P) 49 == rankAtom (directSourceRanks P) 43)) || ((rankAtom (directSourceRanks P) 32).ult (rankAtom (directSourceRanks P) 26)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (26 : Fin 78) (49 : Fin 78)
    (32 : Fin 78) (43 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (4 : Fin 13) (6 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (43 : Fin 78) (32 : Fin 78) (26 : Fin 78)
    (49 : Fin 78) (24 : Fin 78) (62 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

end

end ATailExactFiveCard13CnfIngressScratch
end Problem97
