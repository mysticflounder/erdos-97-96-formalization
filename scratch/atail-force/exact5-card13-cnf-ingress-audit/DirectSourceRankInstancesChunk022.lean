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

/-- Exact pass-5 source assertion `h1408` (kalmanson). -/
theorem directSource_h1408 :
    ((!((rankAtom (directSourceRanks P) 27 == rankAtom (directSourceRanks P) 28)) || ((rankAtom (directSourceRanks P) 44).ult (rankAtom (directSourceRanks P) 45)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (45 : Fin 78) (27 : Fin 78)
    (44 : Fin 78) (28 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (4 : Fin 13) (7 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (44 : Fin 78) (28 : Fin 78) (27 : Fin 78)
    (45 : Fin 78) (24 : Fin 78) (63 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1409` (kalmanson). -/
theorem directSource_h1409 :
    ((!((rankAtom (directSourceRanks P) 45 == rankAtom (directSourceRanks P) 28)) || ((rankAtom (directSourceRanks P) 44).ult (rankAtom (directSourceRanks P) 27)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (27 : Fin 78) (45 : Fin 78)
    (44 : Fin 78) (28 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (4 : Fin 13) (7 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (44 : Fin 78) (28 : Fin 78) (27 : Fin 78)
    (45 : Fin 78) (24 : Fin 78) (63 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1410` (kalmanson). -/
theorem directSource_h1410 :
    ((!((rankAtom (directSourceRanks P) 46 == rankAtom (directSourceRanks P) 24)) || ((rankAtom (directSourceRanks P) 64).ult (rankAtom (directSourceRanks P) 27)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (27 : Fin 78) (46 : Fin 78)
    (64 : Fin 78) (24 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (4 : Fin 13) (7 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (44 : Fin 78) (29 : Fin 78) (27 : Fin 78)
    (46 : Fin 78) (24 : Fin 78) (64 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1411` (kalmanson). -/
theorem directSource_h1411 :
    ((!((rankAtom (directSourceRanks P) 46 == rankAtom (directSourceRanks P) 44)) || ((rankAtom (directSourceRanks P) 29).ult (rankAtom (directSourceRanks P) 27)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (27 : Fin 78) (46 : Fin 78)
    (29 : Fin 78) (44 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (4 : Fin 13) (7 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (44 : Fin 78) (29 : Fin 78) (27 : Fin 78)
    (46 : Fin 78) (24 : Fin 78) (64 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1412` (kalmanson). -/
theorem directSource_h1412 :
    ((!((rankAtom (directSourceRanks P) 47 == rankAtom (directSourceRanks P) 24)) || ((rankAtom (directSourceRanks P) 65).ult (rankAtom (directSourceRanks P) 27)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (27 : Fin 78) (47 : Fin 78)
    (65 : Fin 78) (24 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (4 : Fin 13) (7 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (44 : Fin 78) (30 : Fin 78) (27 : Fin 78)
    (47 : Fin 78) (24 : Fin 78) (65 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1413` (kalmanson). -/
theorem directSource_h1413 :
    ((!((rankAtom (directSourceRanks P) 47 == rankAtom (directSourceRanks P) 44)) || ((rankAtom (directSourceRanks P) 30).ult (rankAtom (directSourceRanks P) 27)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (27 : Fin 78) (47 : Fin 78)
    (30 : Fin 78) (44 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (4 : Fin 13) (7 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (44 : Fin 78) (30 : Fin 78) (27 : Fin 78)
    (47 : Fin 78) (24 : Fin 78) (65 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1414` (kalmanson). -/
theorem directSource_h1414 :
    ((!((rankAtom (directSourceRanks P) 48 == rankAtom (directSourceRanks P) 24)) || ((rankAtom (directSourceRanks P) 66).ult (rankAtom (directSourceRanks P) 27)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (27 : Fin 78) (48 : Fin 78)
    (66 : Fin 78) (24 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (4 : Fin 13) (7 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (44 : Fin 78) (31 : Fin 78) (27 : Fin 78)
    (48 : Fin 78) (24 : Fin 78) (66 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1415` (kalmanson). -/
theorem directSource_h1415 :
    ((!((rankAtom (directSourceRanks P) 27 == rankAtom (directSourceRanks P) 31)) || ((rankAtom (directSourceRanks P) 44).ult (rankAtom (directSourceRanks P) 48)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (48 : Fin 78) (27 : Fin 78)
    (44 : Fin 78) (31 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (4 : Fin 13) (7 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (44 : Fin 78) (31 : Fin 78) (27 : Fin 78)
    (48 : Fin 78) (24 : Fin 78) (66 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1416` (kalmanson). -/
theorem directSource_h1416 :
    ((!((rankAtom (directSourceRanks P) 48 == rankAtom (directSourceRanks P) 44)) || ((rankAtom (directSourceRanks P) 31).ult (rankAtom (directSourceRanks P) 27)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (27 : Fin 78) (48 : Fin 78)
    (31 : Fin 78) (44 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (4 : Fin 13) (7 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (44 : Fin 78) (31 : Fin 78) (27 : Fin 78)
    (48 : Fin 78) (24 : Fin 78) (66 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1417` (kalmanson). -/
theorem directSource_h1417 :
    ((!((rankAtom (directSourceRanks P) 49 == rankAtom (directSourceRanks P) 24)) || ((rankAtom (directSourceRanks P) 67).ult (rankAtom (directSourceRanks P) 27)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (27 : Fin 78) (49 : Fin 78)
    (67 : Fin 78) (24 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (4 : Fin 13) (7 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (44 : Fin 78) (32 : Fin 78) (27 : Fin 78)
    (49 : Fin 78) (24 : Fin 78) (67 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1418` (kalmanson). -/
theorem directSource_h1418 :
    ((!((rankAtom (directSourceRanks P) 27 == rankAtom (directSourceRanks P) 32)) || ((rankAtom (directSourceRanks P) 44).ult (rankAtom (directSourceRanks P) 49)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (49 : Fin 78) (27 : Fin 78)
    (44 : Fin 78) (32 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (4 : Fin 13) (7 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (44 : Fin 78) (32 : Fin 78) (27 : Fin 78)
    (49 : Fin 78) (24 : Fin 78) (67 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1419` (kalmanson). -/
theorem directSource_h1419 :
    ((!((rankAtom (directSourceRanks P) 49 == rankAtom (directSourceRanks P) 44)) || ((rankAtom (directSourceRanks P) 32).ult (rankAtom (directSourceRanks P) 27)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (27 : Fin 78) (49 : Fin 78)
    (32 : Fin 78) (44 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (4 : Fin 13) (7 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (44 : Fin 78) (32 : Fin 78) (27 : Fin 78)
    (49 : Fin 78) (24 : Fin 78) (67 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1420` (kalmanson). -/
theorem directSource_h1420 :
    ((!((rankAtom (directSourceRanks P) 28 == rankAtom (directSourceRanks P) 29)) || ((rankAtom (directSourceRanks P) 45).ult (rankAtom (directSourceRanks P) 46)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (46 : Fin 78) (28 : Fin 78)
    (45 : Fin 78) (29 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (4 : Fin 13) (8 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (45 : Fin 78) (29 : Fin 78) (28 : Fin 78)
    (46 : Fin 78) (24 : Fin 78) (68 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1421` (kalmanson). -/
theorem directSource_h1421 :
    ((!((rankAtom (directSourceRanks P) 28 == rankAtom (directSourceRanks P) 45)) || ((rankAtom (directSourceRanks P) 29).ult (rankAtom (directSourceRanks P) 46)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (46 : Fin 78) (28 : Fin 78)
    (29 : Fin 78) (45 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (4 : Fin 13) (8 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (45 : Fin 78) (29 : Fin 78) (28 : Fin 78)
    (46 : Fin 78) (24 : Fin 78) (68 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1422` (kalmanson). -/
theorem directSource_h1422 :
    ((!((rankAtom (directSourceRanks P) 46 == rankAtom (directSourceRanks P) 45)) || ((rankAtom (directSourceRanks P) 29).ult (rankAtom (directSourceRanks P) 28)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (28 : Fin 78) (46 : Fin 78)
    (29 : Fin 78) (45 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (4 : Fin 13) (8 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (45 : Fin 78) (29 : Fin 78) (28 : Fin 78)
    (46 : Fin 78) (24 : Fin 78) (68 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1423` (kalmanson). -/
theorem directSource_h1423 :
    ((!((rankAtom (directSourceRanks P) 47 == rankAtom (directSourceRanks P) 24)) || ((rankAtom (directSourceRanks P) 69).ult (rankAtom (directSourceRanks P) 28)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (28 : Fin 78) (47 : Fin 78)
    (69 : Fin 78) (24 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (4 : Fin 13) (8 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (45 : Fin 78) (30 : Fin 78) (28 : Fin 78)
    (47 : Fin 78) (24 : Fin 78) (69 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1424` (kalmanson). -/
theorem directSource_h1424 :
    ((!((rankAtom (directSourceRanks P) 28 == rankAtom (directSourceRanks P) 30)) || ((rankAtom (directSourceRanks P) 45).ult (rankAtom (directSourceRanks P) 47)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (47 : Fin 78) (28 : Fin 78)
    (45 : Fin 78) (30 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (4 : Fin 13) (8 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (45 : Fin 78) (30 : Fin 78) (28 : Fin 78)
    (47 : Fin 78) (24 : Fin 78) (69 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1425` (kalmanson). -/
theorem directSource_h1425 :
    ((!((rankAtom (directSourceRanks P) 28 == rankAtom (directSourceRanks P) 45)) || ((rankAtom (directSourceRanks P) 30).ult (rankAtom (directSourceRanks P) 47)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (47 : Fin 78) (28 : Fin 78)
    (30 : Fin 78) (45 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (4 : Fin 13) (8 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (45 : Fin 78) (30 : Fin 78) (28 : Fin 78)
    (47 : Fin 78) (24 : Fin 78) (69 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1426` (kalmanson). -/
theorem directSource_h1426 :
    ((!((rankAtom (directSourceRanks P) 47 == rankAtom (directSourceRanks P) 45)) || ((rankAtom (directSourceRanks P) 30).ult (rankAtom (directSourceRanks P) 28)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (28 : Fin 78) (47 : Fin 78)
    (30 : Fin 78) (45 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (4 : Fin 13) (8 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (45 : Fin 78) (30 : Fin 78) (28 : Fin 78)
    (47 : Fin 78) (24 : Fin 78) (69 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1427` (kalmanson). -/
theorem directSource_h1427 :
    ((!((rankAtom (directSourceRanks P) 48 == rankAtom (directSourceRanks P) 24)) || ((rankAtom (directSourceRanks P) 70).ult (rankAtom (directSourceRanks P) 28)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (28 : Fin 78) (48 : Fin 78)
    (70 : Fin 78) (24 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (4 : Fin 13) (8 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (45 : Fin 78) (31 : Fin 78) (28 : Fin 78)
    (48 : Fin 78) (24 : Fin 78) (70 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1428` (kalmanson). -/
theorem directSource_h1428 :
    ((!((rankAtom (directSourceRanks P) 28 == rankAtom (directSourceRanks P) 31)) || ((rankAtom (directSourceRanks P) 45).ult (rankAtom (directSourceRanks P) 48)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (48 : Fin 78) (28 : Fin 78)
    (45 : Fin 78) (31 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (4 : Fin 13) (8 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (45 : Fin 78) (31 : Fin 78) (28 : Fin 78)
    (48 : Fin 78) (24 : Fin 78) (70 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1429` (kalmanson). -/
theorem directSource_h1429 :
    ((!((rankAtom (directSourceRanks P) 28 == rankAtom (directSourceRanks P) 45)) || ((rankAtom (directSourceRanks P) 31).ult (rankAtom (directSourceRanks P) 48)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (48 : Fin 78) (28 : Fin 78)
    (31 : Fin 78) (45 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (4 : Fin 13) (8 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (45 : Fin 78) (31 : Fin 78) (28 : Fin 78)
    (48 : Fin 78) (24 : Fin 78) (70 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1430` (kalmanson). -/
theorem directSource_h1430 :
    ((!((rankAtom (directSourceRanks P) 48 == rankAtom (directSourceRanks P) 45)) || ((rankAtom (directSourceRanks P) 31).ult (rankAtom (directSourceRanks P) 28)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (28 : Fin 78) (48 : Fin 78)
    (31 : Fin 78) (45 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (4 : Fin 13) (8 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (45 : Fin 78) (31 : Fin 78) (28 : Fin 78)
    (48 : Fin 78) (24 : Fin 78) (70 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1431` (kalmanson). -/
theorem directSource_h1431 :
    ((!((rankAtom (directSourceRanks P) 49 == rankAtom (directSourceRanks P) 24)) || ((rankAtom (directSourceRanks P) 71).ult (rankAtom (directSourceRanks P) 28)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (28 : Fin 78) (49 : Fin 78)
    (71 : Fin 78) (24 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (4 : Fin 13) (8 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (45 : Fin 78) (32 : Fin 78) (28 : Fin 78)
    (49 : Fin 78) (24 : Fin 78) (71 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1432` (kalmanson). -/
theorem directSource_h1432 :
    ((!((rankAtom (directSourceRanks P) 28 == rankAtom (directSourceRanks P) 45)) || ((rankAtom (directSourceRanks P) 32).ult (rankAtom (directSourceRanks P) 49)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (49 : Fin 78) (28 : Fin 78)
    (32 : Fin 78) (45 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (4 : Fin 13) (8 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (45 : Fin 78) (32 : Fin 78) (28 : Fin 78)
    (49 : Fin 78) (24 : Fin 78) (71 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1433` (kalmanson). -/
theorem directSource_h1433 :
    ((!((rankAtom (directSourceRanks P) 49 == rankAtom (directSourceRanks P) 45)) || ((rankAtom (directSourceRanks P) 32).ult (rankAtom (directSourceRanks P) 28)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (28 : Fin 78) (49 : Fin 78)
    (32 : Fin 78) (45 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (4 : Fin 13) (8 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (45 : Fin 78) (32 : Fin 78) (28 : Fin 78)
    (49 : Fin 78) (24 : Fin 78) (71 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1434` (kalmanson). -/
theorem directSource_h1434 :
    ((!((rankAtom (directSourceRanks P) 47 == rankAtom (directSourceRanks P) 46)) || ((rankAtom (directSourceRanks P) 30).ult (rankAtom (directSourceRanks P) 29)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (29 : Fin 78) (47 : Fin 78)
    (30 : Fin 78) (46 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (4 : Fin 13) (9 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (46 : Fin 78) (30 : Fin 78) (29 : Fin 78)
    (47 : Fin 78) (24 : Fin 78) (72 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1435` (kalmanson). -/
theorem directSource_h1435 :
    ((!((rankAtom (directSourceRanks P) 48 == rankAtom (directSourceRanks P) 46)) || ((rankAtom (directSourceRanks P) 31).ult (rankAtom (directSourceRanks P) 29)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (29 : Fin 78) (48 : Fin 78)
    (31 : Fin 78) (46 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (4 : Fin 13) (9 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (46 : Fin 78) (31 : Fin 78) (29 : Fin 78)
    (48 : Fin 78) (24 : Fin 78) (73 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1436` (kalmanson). -/
theorem directSource_h1436 :
    ((!((rankAtom (directSourceRanks P) 49 == rankAtom (directSourceRanks P) 46)) || ((rankAtom (directSourceRanks P) 32).ult (rankAtom (directSourceRanks P) 29)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (29 : Fin 78) (49 : Fin 78)
    (32 : Fin 78) (46 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (4 : Fin 13) (9 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (46 : Fin 78) (32 : Fin 78) (29 : Fin 78)
    (49 : Fin 78) (24 : Fin 78) (74 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1437` (kalmanson). -/
theorem directSource_h1437 :
    ((!((rankAtom (directSourceRanks P) 48 == rankAtom (directSourceRanks P) 47)) || ((rankAtom (directSourceRanks P) 31).ult (rankAtom (directSourceRanks P) 30)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (30 : Fin 78) (48 : Fin 78)
    (31 : Fin 78) (47 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (4 : Fin 13) (10 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (47 : Fin 78) (31 : Fin 78) (30 : Fin 78)
    (48 : Fin 78) (24 : Fin 78) (75 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1438` (kalmanson). -/
theorem directSource_h1438 :
    ((!((rankAtom (directSourceRanks P) 49 == rankAtom (directSourceRanks P) 47)) || ((rankAtom (directSourceRanks P) 32).ult (rankAtom (directSourceRanks P) 30)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (30 : Fin 78) (49 : Fin 78)
    (32 : Fin 78) (47 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (4 : Fin 13) (10 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (47 : Fin 78) (32 : Fin 78) (30 : Fin 78)
    (49 : Fin 78) (24 : Fin 78) (76 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1439` (kalmanson). -/
theorem directSource_h1439 :
    ((!((rankAtom (directSourceRanks P) 49 == rankAtom (directSourceRanks P) 48)) || ((rankAtom (directSourceRanks P) 32).ult (rankAtom (directSourceRanks P) 31)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (31 : Fin 78) (49 : Fin 78)
    (32 : Fin 78) (48 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (4 : Fin 13) (11 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (48 : Fin 78) (32 : Fin 78) (31 : Fin 78)
    (49 : Fin 78) (24 : Fin 78) (77 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1440` (kalmanson). -/
theorem directSource_h1440 :
    ((!((rankAtom (directSourceRanks P) 26 == rankAtom (directSourceRanks P) 25)) || ((rankAtom (directSourceRanks P) 57).ult (rankAtom (directSourceRanks P) 51)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (51 : Fin 78) (26 : Fin 78)
    (57 : Fin 78) (25 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (5 : Fin 13) (6 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (27 : Fin 78) (26 : Fin 78)
    (51 : Fin 78) (25 : Fin 78) (57 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1441` (kalmanson). -/
theorem directSource_h1441 :
    ((!((rankAtom (directSourceRanks P) 26 == rankAtom (directSourceRanks P) 57)) || ((rankAtom (directSourceRanks P) 25).ult (rankAtom (directSourceRanks P) 51)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (51 : Fin 78) (26 : Fin 78)
    (25 : Fin 78) (57 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (5 : Fin 13) (6 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (27 : Fin 78) (26 : Fin 78)
    (51 : Fin 78) (25 : Fin 78) (57 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1442` (kalmanson). -/
theorem directSource_h1442 :
    ((!((rankAtom (directSourceRanks P) 51 == rankAtom (directSourceRanks P) 25)) || ((rankAtom (directSourceRanks P) 57).ult (rankAtom (directSourceRanks P) 26)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (26 : Fin 78) (51 : Fin 78)
    (57 : Fin 78) (25 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (5 : Fin 13) (6 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (27 : Fin 78) (26 : Fin 78)
    (51 : Fin 78) (25 : Fin 78) (57 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1443` (kalmanson). -/
theorem directSource_h1443 :
    ((!((rankAtom (directSourceRanks P) 51 == rankAtom (directSourceRanks P) 57)) || ((rankAtom (directSourceRanks P) 25).ult (rankAtom (directSourceRanks P) 26)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (26 : Fin 78) (51 : Fin 78)
    (25 : Fin 78) (57 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (5 : Fin 13) (6 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (27 : Fin 78) (26 : Fin 78)
    (51 : Fin 78) (25 : Fin 78) (57 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1444` (kalmanson). -/
theorem directSource_h1444 :
    ((!((rankAtom (directSourceRanks P) 26 == rankAtom (directSourceRanks P) 27)) || ((rankAtom (directSourceRanks P) 50).ult (rankAtom (directSourceRanks P) 51)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (51 : Fin 78) (26 : Fin 78)
    (50 : Fin 78) (27 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (5 : Fin 13) (6 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (27 : Fin 78) (26 : Fin 78)
    (51 : Fin 78) (25 : Fin 78) (57 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1445` (kalmanson). -/
theorem directSource_h1445 :
    ((!((rankAtom (directSourceRanks P) 26 == rankAtom (directSourceRanks P) 50)) || ((rankAtom (directSourceRanks P) 27).ult (rankAtom (directSourceRanks P) 51)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (51 : Fin 78) (26 : Fin 78)
    (27 : Fin 78) (50 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (5 : Fin 13) (6 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (27 : Fin 78) (26 : Fin 78)
    (51 : Fin 78) (25 : Fin 78) (57 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1446` (kalmanson). -/
theorem directSource_h1446 :
    ((!((rankAtom (directSourceRanks P) 51 == rankAtom (directSourceRanks P) 50)) || ((rankAtom (directSourceRanks P) 27).ult (rankAtom (directSourceRanks P) 26)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (26 : Fin 78) (51 : Fin 78)
    (27 : Fin 78) (50 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (5 : Fin 13) (6 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (27 : Fin 78) (26 : Fin 78)
    (51 : Fin 78) (25 : Fin 78) (57 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1447` (kalmanson). -/
theorem directSource_h1447 :
    ((!((rankAtom (directSourceRanks P) 26 == rankAtom (directSourceRanks P) 25)) || ((rankAtom (directSourceRanks P) 58).ult (rankAtom (directSourceRanks P) 52)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (52 : Fin 78) (26 : Fin 78)
    (58 : Fin 78) (25 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (5 : Fin 13) (6 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (28 : Fin 78) (26 : Fin 78)
    (52 : Fin 78) (25 : Fin 78) (58 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1448` (kalmanson). -/
theorem directSource_h1448 :
    ((!((rankAtom (directSourceRanks P) 26 == rankAtom (directSourceRanks P) 58)) || ((rankAtom (directSourceRanks P) 25).ult (rankAtom (directSourceRanks P) 52)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (52 : Fin 78) (26 : Fin 78)
    (25 : Fin 78) (58 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (5 : Fin 13) (6 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (28 : Fin 78) (26 : Fin 78)
    (52 : Fin 78) (25 : Fin 78) (58 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1449` (kalmanson). -/
theorem directSource_h1449 :
    ((!((rankAtom (directSourceRanks P) 52 == rankAtom (directSourceRanks P) 25)) || ((rankAtom (directSourceRanks P) 58).ult (rankAtom (directSourceRanks P) 26)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (26 : Fin 78) (52 : Fin 78)
    (58 : Fin 78) (25 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (5 : Fin 13) (6 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (28 : Fin 78) (26 : Fin 78)
    (52 : Fin 78) (25 : Fin 78) (58 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1450` (kalmanson). -/
theorem directSource_h1450 :
    ((!((rankAtom (directSourceRanks P) 52 == rankAtom (directSourceRanks P) 58)) || ((rankAtom (directSourceRanks P) 25).ult (rankAtom (directSourceRanks P) 26)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (26 : Fin 78) (52 : Fin 78)
    (25 : Fin 78) (58 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (5 : Fin 13) (6 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (28 : Fin 78) (26 : Fin 78)
    (52 : Fin 78) (25 : Fin 78) (58 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1451` (kalmanson). -/
theorem directSource_h1451 :
    ((!((rankAtom (directSourceRanks P) 26 == rankAtom (directSourceRanks P) 28)) || ((rankAtom (directSourceRanks P) 50).ult (rankAtom (directSourceRanks P) 52)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (52 : Fin 78) (26 : Fin 78)
    (50 : Fin 78) (28 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (5 : Fin 13) (6 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (28 : Fin 78) (26 : Fin 78)
    (52 : Fin 78) (25 : Fin 78) (58 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1452` (kalmanson). -/
theorem directSource_h1452 :
    ((!((rankAtom (directSourceRanks P) 26 == rankAtom (directSourceRanks P) 50)) || ((rankAtom (directSourceRanks P) 28).ult (rankAtom (directSourceRanks P) 52)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (52 : Fin 78) (26 : Fin 78)
    (28 : Fin 78) (50 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (5 : Fin 13) (6 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (28 : Fin 78) (26 : Fin 78)
    (52 : Fin 78) (25 : Fin 78) (58 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1453` (kalmanson). -/
theorem directSource_h1453 :
    ((!((rankAtom (directSourceRanks P) 52 == rankAtom (directSourceRanks P) 28)) || ((rankAtom (directSourceRanks P) 50).ult (rankAtom (directSourceRanks P) 26)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (26 : Fin 78) (52 : Fin 78)
    (50 : Fin 78) (28 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (5 : Fin 13) (6 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (28 : Fin 78) (26 : Fin 78)
    (52 : Fin 78) (25 : Fin 78) (58 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1454` (kalmanson). -/
theorem directSource_h1454 :
    ((!((rankAtom (directSourceRanks P) 52 == rankAtom (directSourceRanks P) 50)) || ((rankAtom (directSourceRanks P) 28).ult (rankAtom (directSourceRanks P) 26)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (26 : Fin 78) (52 : Fin 78)
    (28 : Fin 78) (50 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (5 : Fin 13) (6 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (28 : Fin 78) (26 : Fin 78)
    (52 : Fin 78) (25 : Fin 78) (58 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1455` (kalmanson). -/
theorem directSource_h1455 :
    ((!((rankAtom (directSourceRanks P) 26 == rankAtom (directSourceRanks P) 25)) || ((rankAtom (directSourceRanks P) 59).ult (rankAtom (directSourceRanks P) 53)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (53 : Fin 78) (26 : Fin 78)
    (59 : Fin 78) (25 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (5 : Fin 13) (6 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (29 : Fin 78) (26 : Fin 78)
    (53 : Fin 78) (25 : Fin 78) (59 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1456` (kalmanson). -/
theorem directSource_h1456 :
    ((!((rankAtom (directSourceRanks P) 26 == rankAtom (directSourceRanks P) 59)) || ((rankAtom (directSourceRanks P) 25).ult (rankAtom (directSourceRanks P) 53)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (53 : Fin 78) (26 : Fin 78)
    (25 : Fin 78) (59 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (5 : Fin 13) (6 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (29 : Fin 78) (26 : Fin 78)
    (53 : Fin 78) (25 : Fin 78) (59 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1457` (kalmanson). -/
theorem directSource_h1457 :
    ((!((rankAtom (directSourceRanks P) 53 == rankAtom (directSourceRanks P) 25)) || ((rankAtom (directSourceRanks P) 59).ult (rankAtom (directSourceRanks P) 26)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (26 : Fin 78) (53 : Fin 78)
    (59 : Fin 78) (25 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (5 : Fin 13) (6 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (29 : Fin 78) (26 : Fin 78)
    (53 : Fin 78) (25 : Fin 78) (59 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1458` (kalmanson). -/
theorem directSource_h1458 :
    ((!((rankAtom (directSourceRanks P) 26 == rankAtom (directSourceRanks P) 29)) || ((rankAtom (directSourceRanks P) 50).ult (rankAtom (directSourceRanks P) 53)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (53 : Fin 78) (26 : Fin 78)
    (50 : Fin 78) (29 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (5 : Fin 13) (6 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (29 : Fin 78) (26 : Fin 78)
    (53 : Fin 78) (25 : Fin 78) (59 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1459` (kalmanson). -/
theorem directSource_h1459 :
    ((!((rankAtom (directSourceRanks P) 26 == rankAtom (directSourceRanks P) 50)) || ((rankAtom (directSourceRanks P) 29).ult (rankAtom (directSourceRanks P) 53)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (53 : Fin 78) (26 : Fin 78)
    (29 : Fin 78) (50 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (5 : Fin 13) (6 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (29 : Fin 78) (26 : Fin 78)
    (53 : Fin 78) (25 : Fin 78) (59 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1460` (kalmanson). -/
theorem directSource_h1460 :
    ((!((rankAtom (directSourceRanks P) 53 == rankAtom (directSourceRanks P) 50)) || ((rankAtom (directSourceRanks P) 29).ult (rankAtom (directSourceRanks P) 26)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (26 : Fin 78) (53 : Fin 78)
    (29 : Fin 78) (50 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (5 : Fin 13) (6 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (29 : Fin 78) (26 : Fin 78)
    (53 : Fin 78) (25 : Fin 78) (59 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1461` (kalmanson). -/
theorem directSource_h1461 :
    ((!((rankAtom (directSourceRanks P) 26 == rankAtom (directSourceRanks P) 25)) || ((rankAtom (directSourceRanks P) 60).ult (rankAtom (directSourceRanks P) 54)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (54 : Fin 78) (26 : Fin 78)
    (60 : Fin 78) (25 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (5 : Fin 13) (6 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (30 : Fin 78) (26 : Fin 78)
    (54 : Fin 78) (25 : Fin 78) (60 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1462` (kalmanson). -/
theorem directSource_h1462 :
    ((!((rankAtom (directSourceRanks P) 26 == rankAtom (directSourceRanks P) 60)) || ((rankAtom (directSourceRanks P) 25).ult (rankAtom (directSourceRanks P) 54)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (54 : Fin 78) (26 : Fin 78)
    (25 : Fin 78) (60 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (5 : Fin 13) (6 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (30 : Fin 78) (26 : Fin 78)
    (54 : Fin 78) (25 : Fin 78) (60 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1463` (kalmanson). -/
theorem directSource_h1463 :
    ((!((rankAtom (directSourceRanks P) 54 == rankAtom (directSourceRanks P) 25)) || ((rankAtom (directSourceRanks P) 60).ult (rankAtom (directSourceRanks P) 26)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (26 : Fin 78) (54 : Fin 78)
    (60 : Fin 78) (25 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (5 : Fin 13) (6 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (30 : Fin 78) (26 : Fin 78)
    (54 : Fin 78) (25 : Fin 78) (60 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1464` (kalmanson). -/
theorem directSource_h1464 :
    ((!((rankAtom (directSourceRanks P) 26 == rankAtom (directSourceRanks P) 30)) || ((rankAtom (directSourceRanks P) 50).ult (rankAtom (directSourceRanks P) 54)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (54 : Fin 78) (26 : Fin 78)
    (50 : Fin 78) (30 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (5 : Fin 13) (6 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (30 : Fin 78) (26 : Fin 78)
    (54 : Fin 78) (25 : Fin 78) (60 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1465` (kalmanson). -/
theorem directSource_h1465 :
    ((!((rankAtom (directSourceRanks P) 26 == rankAtom (directSourceRanks P) 50)) || ((rankAtom (directSourceRanks P) 30).ult (rankAtom (directSourceRanks P) 54)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (54 : Fin 78) (26 : Fin 78)
    (30 : Fin 78) (50 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (5 : Fin 13) (6 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (30 : Fin 78) (26 : Fin 78)
    (54 : Fin 78) (25 : Fin 78) (60 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1466` (kalmanson). -/
theorem directSource_h1466 :
    ((!((rankAtom (directSourceRanks P) 54 == rankAtom (directSourceRanks P) 50)) || ((rankAtom (directSourceRanks P) 30).ult (rankAtom (directSourceRanks P) 26)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (26 : Fin 78) (54 : Fin 78)
    (30 : Fin 78) (50 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (5 : Fin 13) (6 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (30 : Fin 78) (26 : Fin 78)
    (54 : Fin 78) (25 : Fin 78) (60 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1467` (kalmanson). -/
theorem directSource_h1467 :
    ((!((rankAtom (directSourceRanks P) 26 == rankAtom (directSourceRanks P) 25)) || ((rankAtom (directSourceRanks P) 61).ult (rankAtom (directSourceRanks P) 55)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (55 : Fin 78) (26 : Fin 78)
    (61 : Fin 78) (25 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (5 : Fin 13) (6 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (31 : Fin 78) (26 : Fin 78)
    (55 : Fin 78) (25 : Fin 78) (61 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1468` (kalmanson). -/
theorem directSource_h1468 :
    ((!((rankAtom (directSourceRanks P) 26 == rankAtom (directSourceRanks P) 61)) || ((rankAtom (directSourceRanks P) 25).ult (rankAtom (directSourceRanks P) 55)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (55 : Fin 78) (26 : Fin 78)
    (25 : Fin 78) (61 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (5 : Fin 13) (6 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (31 : Fin 78) (26 : Fin 78)
    (55 : Fin 78) (25 : Fin 78) (61 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1469` (kalmanson). -/
theorem directSource_h1469 :
    ((!((rankAtom (directSourceRanks P) 55 == rankAtom (directSourceRanks P) 25)) || ((rankAtom (directSourceRanks P) 61).ult (rankAtom (directSourceRanks P) 26)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (26 : Fin 78) (55 : Fin 78)
    (61 : Fin 78) (25 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (5 : Fin 13) (6 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (31 : Fin 78) (26 : Fin 78)
    (55 : Fin 78) (25 : Fin 78) (61 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1470` (kalmanson). -/
theorem directSource_h1470 :
    ((!((rankAtom (directSourceRanks P) 26 == rankAtom (directSourceRanks P) 31)) || ((rankAtom (directSourceRanks P) 50).ult (rankAtom (directSourceRanks P) 55)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (55 : Fin 78) (26 : Fin 78)
    (50 : Fin 78) (31 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (5 : Fin 13) (6 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (31 : Fin 78) (26 : Fin 78)
    (55 : Fin 78) (25 : Fin 78) (61 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1471` (kalmanson). -/
theorem directSource_h1471 :
    ((!((rankAtom (directSourceRanks P) 26 == rankAtom (directSourceRanks P) 50)) || ((rankAtom (directSourceRanks P) 31).ult (rankAtom (directSourceRanks P) 55)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (55 : Fin 78) (26 : Fin 78)
    (31 : Fin 78) (50 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (5 : Fin 13) (6 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (31 : Fin 78) (26 : Fin 78)
    (55 : Fin 78) (25 : Fin 78) (61 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

end

end ATailExactFiveCard13CnfIngressScratch
end Problem97
