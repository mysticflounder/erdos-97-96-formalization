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

/-- Exact pass-5 source assertion `h1472` (kalmanson). -/
theorem directSource_h1472 :
    ((!((rankAtom (directSourceRanks P) 55 == rankAtom (directSourceRanks P) 50)) || ((rankAtom (directSourceRanks P) 31).ult (rankAtom (directSourceRanks P) 26)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (26 : Fin 78) (55 : Fin 78)
    (31 : Fin 78) (50 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (5 : Fin 13) (6 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (31 : Fin 78) (26 : Fin 78)
    (55 : Fin 78) (25 : Fin 78) (61 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1473` (kalmanson). -/
theorem directSource_h1473 :
    ((!((rankAtom (directSourceRanks P) 26 == rankAtom (directSourceRanks P) 25)) || ((rankAtom (directSourceRanks P) 62).ult (rankAtom (directSourceRanks P) 56)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (56 : Fin 78) (26 : Fin 78)
    (62 : Fin 78) (25 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (5 : Fin 13) (6 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (32 : Fin 78) (26 : Fin 78)
    (56 : Fin 78) (25 : Fin 78) (62 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1474` (kalmanson). -/
theorem directSource_h1474 :
    ((!((rankAtom (directSourceRanks P) 26 == rankAtom (directSourceRanks P) 62)) || ((rankAtom (directSourceRanks P) 25).ult (rankAtom (directSourceRanks P) 56)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (56 : Fin 78) (26 : Fin 78)
    (25 : Fin 78) (62 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (5 : Fin 13) (6 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (32 : Fin 78) (26 : Fin 78)
    (56 : Fin 78) (25 : Fin 78) (62 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1475` (kalmanson). -/
theorem directSource_h1475 :
    ((!((rankAtom (directSourceRanks P) 56 == rankAtom (directSourceRanks P) 25)) || ((rankAtom (directSourceRanks P) 62).ult (rankAtom (directSourceRanks P) 26)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (26 : Fin 78) (56 : Fin 78)
    (62 : Fin 78) (25 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (5 : Fin 13) (6 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (32 : Fin 78) (26 : Fin 78)
    (56 : Fin 78) (25 : Fin 78) (62 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1476` (kalmanson). -/
theorem directSource_h1476 :
    ((!((rankAtom (directSourceRanks P) 26 == rankAtom (directSourceRanks P) 50)) || ((rankAtom (directSourceRanks P) 32).ult (rankAtom (directSourceRanks P) 56)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (56 : Fin 78) (26 : Fin 78)
    (32 : Fin 78) (50 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (5 : Fin 13) (6 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (32 : Fin 78) (26 : Fin 78)
    (56 : Fin 78) (25 : Fin 78) (62 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1477` (kalmanson). -/
theorem directSource_h1477 :
    ((!((rankAtom (directSourceRanks P) 56 == rankAtom (directSourceRanks P) 50)) || ((rankAtom (directSourceRanks P) 32).ult (rankAtom (directSourceRanks P) 26)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (26 : Fin 78) (56 : Fin 78)
    (32 : Fin 78) (50 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (5 : Fin 13) (6 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (32 : Fin 78) (26 : Fin 78)
    (56 : Fin 78) (25 : Fin 78) (62 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1478` (kalmanson). -/
theorem directSource_h1478 :
    ((!((rankAtom (directSourceRanks P) 52 == rankAtom (directSourceRanks P) 25)) || ((rankAtom (directSourceRanks P) 63).ult (rankAtom (directSourceRanks P) 27)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (27 : Fin 78) (52 : Fin 78)
    (63 : Fin 78) (25 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (5 : Fin 13) (7 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (51 : Fin 78) (28 : Fin 78) (27 : Fin 78)
    (52 : Fin 78) (25 : Fin 78) (63 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1479` (kalmanson). -/
theorem directSource_h1479 :
    ((!((rankAtom (directSourceRanks P) 52 == rankAtom (directSourceRanks P) 63)) || ((rankAtom (directSourceRanks P) 25).ult (rankAtom (directSourceRanks P) 27)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (27 : Fin 78) (52 : Fin 78)
    (25 : Fin 78) (63 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (5 : Fin 13) (7 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (51 : Fin 78) (28 : Fin 78) (27 : Fin 78)
    (52 : Fin 78) (25 : Fin 78) (63 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1480` (kalmanson). -/
theorem directSource_h1480 :
    ((!((rankAtom (directSourceRanks P) 27 == rankAtom (directSourceRanks P) 28)) || ((rankAtom (directSourceRanks P) 51).ult (rankAtom (directSourceRanks P) 52)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (52 : Fin 78) (27 : Fin 78)
    (51 : Fin 78) (28 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (5 : Fin 13) (7 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (51 : Fin 78) (28 : Fin 78) (27 : Fin 78)
    (52 : Fin 78) (25 : Fin 78) (63 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1481` (kalmanson). -/
theorem directSource_h1481 :
    ((!((rankAtom (directSourceRanks P) 52 == rankAtom (directSourceRanks P) 28)) || ((rankAtom (directSourceRanks P) 51).ult (rankAtom (directSourceRanks P) 27)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (27 : Fin 78) (52 : Fin 78)
    (51 : Fin 78) (28 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (5 : Fin 13) (7 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (51 : Fin 78) (28 : Fin 78) (27 : Fin 78)
    (52 : Fin 78) (25 : Fin 78) (63 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1482` (kalmanson). -/
theorem directSource_h1482 :
    ((!((rankAtom (directSourceRanks P) 52 == rankAtom (directSourceRanks P) 51)) || ((rankAtom (directSourceRanks P) 28).ult (rankAtom (directSourceRanks P) 27)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (27 : Fin 78) (52 : Fin 78)
    (28 : Fin 78) (51 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (5 : Fin 13) (7 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (51 : Fin 78) (28 : Fin 78) (27 : Fin 78)
    (52 : Fin 78) (25 : Fin 78) (63 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1483` (kalmanson). -/
theorem directSource_h1483 :
    ((!((rankAtom (directSourceRanks P) 27 == rankAtom (directSourceRanks P) 25)) || ((rankAtom (directSourceRanks P) 64).ult (rankAtom (directSourceRanks P) 53)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (53 : Fin 78) (27 : Fin 78)
    (64 : Fin 78) (25 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (5 : Fin 13) (7 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (51 : Fin 78) (29 : Fin 78) (27 : Fin 78)
    (53 : Fin 78) (25 : Fin 78) (64 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1484` (kalmanson). -/
theorem directSource_h1484 :
    ((!((rankAtom (directSourceRanks P) 53 == rankAtom (directSourceRanks P) 25)) || ((rankAtom (directSourceRanks P) 64).ult (rankAtom (directSourceRanks P) 27)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (27 : Fin 78) (53 : Fin 78)
    (64 : Fin 78) (25 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (5 : Fin 13) (7 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (51 : Fin 78) (29 : Fin 78) (27 : Fin 78)
    (53 : Fin 78) (25 : Fin 78) (64 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1485` (kalmanson). -/
theorem directSource_h1485 :
    ((!((rankAtom (directSourceRanks P) 27 == rankAtom (directSourceRanks P) 29)) || ((rankAtom (directSourceRanks P) 51).ult (rankAtom (directSourceRanks P) 53)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (53 : Fin 78) (27 : Fin 78)
    (51 : Fin 78) (29 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (5 : Fin 13) (7 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (51 : Fin 78) (29 : Fin 78) (27 : Fin 78)
    (53 : Fin 78) (25 : Fin 78) (64 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1486` (kalmanson). -/
theorem directSource_h1486 :
    ((!((rankAtom (directSourceRanks P) 53 == rankAtom (directSourceRanks P) 51)) || ((rankAtom (directSourceRanks P) 29).ult (rankAtom (directSourceRanks P) 27)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (27 : Fin 78) (53 : Fin 78)
    (29 : Fin 78) (51 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (5 : Fin 13) (7 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (51 : Fin 78) (29 : Fin 78) (27 : Fin 78)
    (53 : Fin 78) (25 : Fin 78) (64 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1487` (kalmanson). -/
theorem directSource_h1487 :
    ((!((rankAtom (directSourceRanks P) 27 == rankAtom (directSourceRanks P) 25)) || ((rankAtom (directSourceRanks P) 65).ult (rankAtom (directSourceRanks P) 54)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (54 : Fin 78) (27 : Fin 78)
    (65 : Fin 78) (25 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (5 : Fin 13) (7 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (51 : Fin 78) (30 : Fin 78) (27 : Fin 78)
    (54 : Fin 78) (25 : Fin 78) (65 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1488` (kalmanson). -/
theorem directSource_h1488 :
    ((!((rankAtom (directSourceRanks P) 54 == rankAtom (directSourceRanks P) 25)) || ((rankAtom (directSourceRanks P) 65).ult (rankAtom (directSourceRanks P) 27)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (27 : Fin 78) (54 : Fin 78)
    (65 : Fin 78) (25 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (5 : Fin 13) (7 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (51 : Fin 78) (30 : Fin 78) (27 : Fin 78)
    (54 : Fin 78) (25 : Fin 78) (65 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1489` (kalmanson). -/
theorem directSource_h1489 :
    ((!((rankAtom (directSourceRanks P) 27 == rankAtom (directSourceRanks P) 30)) || ((rankAtom (directSourceRanks P) 51).ult (rankAtom (directSourceRanks P) 54)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (54 : Fin 78) (27 : Fin 78)
    (51 : Fin 78) (30 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (5 : Fin 13) (7 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (51 : Fin 78) (30 : Fin 78) (27 : Fin 78)
    (54 : Fin 78) (25 : Fin 78) (65 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1490` (kalmanson). -/
theorem directSource_h1490 :
    ((!((rankAtom (directSourceRanks P) 54 == rankAtom (directSourceRanks P) 51)) || ((rankAtom (directSourceRanks P) 30).ult (rankAtom (directSourceRanks P) 27)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (27 : Fin 78) (54 : Fin 78)
    (30 : Fin 78) (51 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (5 : Fin 13) (7 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (51 : Fin 78) (30 : Fin 78) (27 : Fin 78)
    (54 : Fin 78) (25 : Fin 78) (65 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1491` (kalmanson). -/
theorem directSource_h1491 :
    ((!((rankAtom (directSourceRanks P) 27 == rankAtom (directSourceRanks P) 25)) || ((rankAtom (directSourceRanks P) 66).ult (rankAtom (directSourceRanks P) 55)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (55 : Fin 78) (27 : Fin 78)
    (66 : Fin 78) (25 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (5 : Fin 13) (7 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (51 : Fin 78) (31 : Fin 78) (27 : Fin 78)
    (55 : Fin 78) (25 : Fin 78) (66 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1492` (kalmanson). -/
theorem directSource_h1492 :
    ((!((rankAtom (directSourceRanks P) 55 == rankAtom (directSourceRanks P) 25)) || ((rankAtom (directSourceRanks P) 66).ult (rankAtom (directSourceRanks P) 27)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (27 : Fin 78) (55 : Fin 78)
    (66 : Fin 78) (25 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (5 : Fin 13) (7 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (51 : Fin 78) (31 : Fin 78) (27 : Fin 78)
    (55 : Fin 78) (25 : Fin 78) (66 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1493` (kalmanson). -/
theorem directSource_h1493 :
    ((!((rankAtom (directSourceRanks P) 27 == rankAtom (directSourceRanks P) 31)) || ((rankAtom (directSourceRanks P) 51).ult (rankAtom (directSourceRanks P) 55)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (55 : Fin 78) (27 : Fin 78)
    (51 : Fin 78) (31 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (5 : Fin 13) (7 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (51 : Fin 78) (31 : Fin 78) (27 : Fin 78)
    (55 : Fin 78) (25 : Fin 78) (66 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1494` (kalmanson). -/
theorem directSource_h1494 :
    ((!((rankAtom (directSourceRanks P) 55 == rankAtom (directSourceRanks P) 51)) || ((rankAtom (directSourceRanks P) 31).ult (rankAtom (directSourceRanks P) 27)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (27 : Fin 78) (55 : Fin 78)
    (31 : Fin 78) (51 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (5 : Fin 13) (7 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (51 : Fin 78) (31 : Fin 78) (27 : Fin 78)
    (55 : Fin 78) (25 : Fin 78) (66 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1495` (kalmanson). -/
theorem directSource_h1495 :
    ((!((rankAtom (directSourceRanks P) 27 == rankAtom (directSourceRanks P) 25)) || ((rankAtom (directSourceRanks P) 67).ult (rankAtom (directSourceRanks P) 56)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (56 : Fin 78) (27 : Fin 78)
    (67 : Fin 78) (25 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (5 : Fin 13) (7 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (51 : Fin 78) (32 : Fin 78) (27 : Fin 78)
    (56 : Fin 78) (25 : Fin 78) (67 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1496` (kalmanson). -/
theorem directSource_h1496 :
    ((!((rankAtom (directSourceRanks P) 56 == rankAtom (directSourceRanks P) 25)) || ((rankAtom (directSourceRanks P) 67).ult (rankAtom (directSourceRanks P) 27)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (27 : Fin 78) (56 : Fin 78)
    (67 : Fin 78) (25 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (5 : Fin 13) (7 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (51 : Fin 78) (32 : Fin 78) (27 : Fin 78)
    (56 : Fin 78) (25 : Fin 78) (67 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1497` (kalmanson). -/
theorem directSource_h1497 :
    ((!((rankAtom (directSourceRanks P) 27 == rankAtom (directSourceRanks P) 32)) || ((rankAtom (directSourceRanks P) 51).ult (rankAtom (directSourceRanks P) 56)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (56 : Fin 78) (27 : Fin 78)
    (51 : Fin 78) (32 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (5 : Fin 13) (7 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (51 : Fin 78) (32 : Fin 78) (27 : Fin 78)
    (56 : Fin 78) (25 : Fin 78) (67 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1498` (kalmanson). -/
theorem directSource_h1498 :
    ((!((rankAtom (directSourceRanks P) 56 == rankAtom (directSourceRanks P) 51)) || ((rankAtom (directSourceRanks P) 32).ult (rankAtom (directSourceRanks P) 27)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (27 : Fin 78) (56 : Fin 78)
    (32 : Fin 78) (51 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (5 : Fin 13) (7 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (51 : Fin 78) (32 : Fin 78) (27 : Fin 78)
    (56 : Fin 78) (25 : Fin 78) (67 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1499` (kalmanson). -/
theorem directSource_h1499 :
    ((!((rankAtom (directSourceRanks P) 28 == rankAtom (directSourceRanks P) 25)) || ((rankAtom (directSourceRanks P) 68).ult (rankAtom (directSourceRanks P) 53)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (53 : Fin 78) (28 : Fin 78)
    (68 : Fin 78) (25 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (5 : Fin 13) (8 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (52 : Fin 78) (29 : Fin 78) (28 : Fin 78)
    (53 : Fin 78) (25 : Fin 78) (68 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1500` (kalmanson). -/
theorem directSource_h1500 :
    ((!((rankAtom (directSourceRanks P) 28 == rankAtom (directSourceRanks P) 68)) || ((rankAtom (directSourceRanks P) 25).ult (rankAtom (directSourceRanks P) 53)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (53 : Fin 78) (28 : Fin 78)
    (25 : Fin 78) (68 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (5 : Fin 13) (8 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (52 : Fin 78) (29 : Fin 78) (28 : Fin 78)
    (53 : Fin 78) (25 : Fin 78) (68 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1501` (kalmanson). -/
theorem directSource_h1501 :
    ((!((rankAtom (directSourceRanks P) 28 == rankAtom (directSourceRanks P) 29)) || ((rankAtom (directSourceRanks P) 52).ult (rankAtom (directSourceRanks P) 53)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (53 : Fin 78) (28 : Fin 78)
    (52 : Fin 78) (29 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (5 : Fin 13) (8 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (52 : Fin 78) (29 : Fin 78) (28 : Fin 78)
    (53 : Fin 78) (25 : Fin 78) (68 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1502` (kalmanson). -/
theorem directSource_h1502 :
    ((!((rankAtom (directSourceRanks P) 28 == rankAtom (directSourceRanks P) 52)) || ((rankAtom (directSourceRanks P) 29).ult (rankAtom (directSourceRanks P) 53)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (53 : Fin 78) (28 : Fin 78)
    (29 : Fin 78) (52 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (5 : Fin 13) (8 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (52 : Fin 78) (29 : Fin 78) (28 : Fin 78)
    (53 : Fin 78) (25 : Fin 78) (68 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1503` (kalmanson). -/
theorem directSource_h1503 :
    ((!((rankAtom (directSourceRanks P) 53 == rankAtom (directSourceRanks P) 52)) || ((rankAtom (directSourceRanks P) 29).ult (rankAtom (directSourceRanks P) 28)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (28 : Fin 78) (53 : Fin 78)
    (29 : Fin 78) (52 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (5 : Fin 13) (8 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (52 : Fin 78) (29 : Fin 78) (28 : Fin 78)
    (53 : Fin 78) (25 : Fin 78) (68 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1504` (kalmanson). -/
theorem directSource_h1504 :
    ((!((rankAtom (directSourceRanks P) 28 == rankAtom (directSourceRanks P) 25)) || ((rankAtom (directSourceRanks P) 69).ult (rankAtom (directSourceRanks P) 54)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (54 : Fin 78) (28 : Fin 78)
    (69 : Fin 78) (25 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (5 : Fin 13) (8 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (52 : Fin 78) (30 : Fin 78) (28 : Fin 78)
    (54 : Fin 78) (25 : Fin 78) (69 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1505` (kalmanson). -/
theorem directSource_h1505 :
    ((!((rankAtom (directSourceRanks P) 28 == rankAtom (directSourceRanks P) 69)) || ((rankAtom (directSourceRanks P) 25).ult (rankAtom (directSourceRanks P) 54)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (54 : Fin 78) (28 : Fin 78)
    (25 : Fin 78) (69 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (5 : Fin 13) (8 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (52 : Fin 78) (30 : Fin 78) (28 : Fin 78)
    (54 : Fin 78) (25 : Fin 78) (69 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1506` (kalmanson). -/
theorem directSource_h1506 :
    ((!((rankAtom (directSourceRanks P) 28 == rankAtom (directSourceRanks P) 30)) || ((rankAtom (directSourceRanks P) 52).ult (rankAtom (directSourceRanks P) 54)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (54 : Fin 78) (28 : Fin 78)
    (52 : Fin 78) (30 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (5 : Fin 13) (8 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (52 : Fin 78) (30 : Fin 78) (28 : Fin 78)
    (54 : Fin 78) (25 : Fin 78) (69 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1507` (kalmanson). -/
theorem directSource_h1507 :
    ((!((rankAtom (directSourceRanks P) 28 == rankAtom (directSourceRanks P) 52)) || ((rankAtom (directSourceRanks P) 30).ult (rankAtom (directSourceRanks P) 54)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (54 : Fin 78) (28 : Fin 78)
    (30 : Fin 78) (52 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (5 : Fin 13) (8 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (52 : Fin 78) (30 : Fin 78) (28 : Fin 78)
    (54 : Fin 78) (25 : Fin 78) (69 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1508` (kalmanson). -/
theorem directSource_h1508 :
    ((!((rankAtom (directSourceRanks P) 54 == rankAtom (directSourceRanks P) 52)) || ((rankAtom (directSourceRanks P) 30).ult (rankAtom (directSourceRanks P) 28)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (28 : Fin 78) (54 : Fin 78)
    (30 : Fin 78) (52 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (5 : Fin 13) (8 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (52 : Fin 78) (30 : Fin 78) (28 : Fin 78)
    (54 : Fin 78) (25 : Fin 78) (69 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1509` (kalmanson). -/
theorem directSource_h1509 :
    ((!((rankAtom (directSourceRanks P) 28 == rankAtom (directSourceRanks P) 25)) || ((rankAtom (directSourceRanks P) 70).ult (rankAtom (directSourceRanks P) 55)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (55 : Fin 78) (28 : Fin 78)
    (70 : Fin 78) (25 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (5 : Fin 13) (8 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (52 : Fin 78) (31 : Fin 78) (28 : Fin 78)
    (55 : Fin 78) (25 : Fin 78) (70 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1510` (kalmanson). -/
theorem directSource_h1510 :
    ((!((rankAtom (directSourceRanks P) 28 == rankAtom (directSourceRanks P) 70)) || ((rankAtom (directSourceRanks P) 25).ult (rankAtom (directSourceRanks P) 55)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (55 : Fin 78) (28 : Fin 78)
    (25 : Fin 78) (70 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (5 : Fin 13) (8 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (52 : Fin 78) (31 : Fin 78) (28 : Fin 78)
    (55 : Fin 78) (25 : Fin 78) (70 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1511` (kalmanson). -/
theorem directSource_h1511 :
    ((!((rankAtom (directSourceRanks P) 28 == rankAtom (directSourceRanks P) 31)) || ((rankAtom (directSourceRanks P) 52).ult (rankAtom (directSourceRanks P) 55)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (55 : Fin 78) (28 : Fin 78)
    (52 : Fin 78) (31 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (5 : Fin 13) (8 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (52 : Fin 78) (31 : Fin 78) (28 : Fin 78)
    (55 : Fin 78) (25 : Fin 78) (70 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1512` (kalmanson). -/
theorem directSource_h1512 :
    ((!((rankAtom (directSourceRanks P) 28 == rankAtom (directSourceRanks P) 52)) || ((rankAtom (directSourceRanks P) 31).ult (rankAtom (directSourceRanks P) 55)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (55 : Fin 78) (28 : Fin 78)
    (31 : Fin 78) (52 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (5 : Fin 13) (8 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (52 : Fin 78) (31 : Fin 78) (28 : Fin 78)
    (55 : Fin 78) (25 : Fin 78) (70 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1513` (kalmanson). -/
theorem directSource_h1513 :
    ((!((rankAtom (directSourceRanks P) 55 == rankAtom (directSourceRanks P) 52)) || ((rankAtom (directSourceRanks P) 31).ult (rankAtom (directSourceRanks P) 28)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (28 : Fin 78) (55 : Fin 78)
    (31 : Fin 78) (52 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (5 : Fin 13) (8 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (52 : Fin 78) (31 : Fin 78) (28 : Fin 78)
    (55 : Fin 78) (25 : Fin 78) (70 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1514` (kalmanson). -/
theorem directSource_h1514 :
    ((!((rankAtom (directSourceRanks P) 28 == rankAtom (directSourceRanks P) 25)) || ((rankAtom (directSourceRanks P) 71).ult (rankAtom (directSourceRanks P) 56)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (56 : Fin 78) (28 : Fin 78)
    (71 : Fin 78) (25 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (5 : Fin 13) (8 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (52 : Fin 78) (32 : Fin 78) (28 : Fin 78)
    (56 : Fin 78) (25 : Fin 78) (71 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1515` (kalmanson). -/
theorem directSource_h1515 :
    ((!((rankAtom (directSourceRanks P) 28 == rankAtom (directSourceRanks P) 71)) || ((rankAtom (directSourceRanks P) 25).ult (rankAtom (directSourceRanks P) 56)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (56 : Fin 78) (28 : Fin 78)
    (25 : Fin 78) (71 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (5 : Fin 13) (8 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (52 : Fin 78) (32 : Fin 78) (28 : Fin 78)
    (56 : Fin 78) (25 : Fin 78) (71 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1516` (kalmanson). -/
theorem directSource_h1516 :
    ((!((rankAtom (directSourceRanks P) 28 == rankAtom (directSourceRanks P) 32)) || ((rankAtom (directSourceRanks P) 52).ult (rankAtom (directSourceRanks P) 56)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (56 : Fin 78) (28 : Fin 78)
    (52 : Fin 78) (32 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (5 : Fin 13) (8 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (52 : Fin 78) (32 : Fin 78) (28 : Fin 78)
    (56 : Fin 78) (25 : Fin 78) (71 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1517` (kalmanson). -/
theorem directSource_h1517 :
    ((!((rankAtom (directSourceRanks P) 27 == rankAtom (directSourceRanks P) 26)) || ((rankAtom (directSourceRanks P) 63).ult (rankAtom (directSourceRanks P) 58)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (58 : Fin 78) (27 : Fin 78)
    (63 : Fin 78) (26 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (6 : Fin 13) (7 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (28 : Fin 78) (27 : Fin 78)
    (58 : Fin 78) (26 : Fin 78) (63 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1518` (kalmanson). -/
theorem directSource_h1518 :
    ((!((rankAtom (directSourceRanks P) 58 == rankAtom (directSourceRanks P) 26)) || ((rankAtom (directSourceRanks P) 63).ult (rankAtom (directSourceRanks P) 27)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (27 : Fin 78) (58 : Fin 78)
    (63 : Fin 78) (26 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (6 : Fin 13) (7 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (28 : Fin 78) (27 : Fin 78)
    (58 : Fin 78) (26 : Fin 78) (63 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1519` (kalmanson). -/
theorem directSource_h1519 :
    ((!((rankAtom (directSourceRanks P) 27 == rankAtom (directSourceRanks P) 28)) || ((rankAtom (directSourceRanks P) 57).ult (rankAtom (directSourceRanks P) 58)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (58 : Fin 78) (27 : Fin 78)
    (57 : Fin 78) (28 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (6 : Fin 13) (7 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (28 : Fin 78) (27 : Fin 78)
    (58 : Fin 78) (26 : Fin 78) (63 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1520` (kalmanson). -/
theorem directSource_h1520 :
    ((!((rankAtom (directSourceRanks P) 27 == rankAtom (directSourceRanks P) 57)) || ((rankAtom (directSourceRanks P) 28).ult (rankAtom (directSourceRanks P) 58)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (58 : Fin 78) (27 : Fin 78)
    (28 : Fin 78) (57 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (6 : Fin 13) (7 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (28 : Fin 78) (27 : Fin 78)
    (58 : Fin 78) (26 : Fin 78) (63 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1521` (kalmanson). -/
theorem directSource_h1521 :
    ((!((rankAtom (directSourceRanks P) 58 == rankAtom (directSourceRanks P) 28)) || ((rankAtom (directSourceRanks P) 57).ult (rankAtom (directSourceRanks P) 27)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (27 : Fin 78) (58 : Fin 78)
    (57 : Fin 78) (28 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (6 : Fin 13) (7 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (28 : Fin 78) (27 : Fin 78)
    (58 : Fin 78) (26 : Fin 78) (63 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1522` (kalmanson). -/
theorem directSource_h1522 :
    ((!((rankAtom (directSourceRanks P) 58 == rankAtom (directSourceRanks P) 57)) || ((rankAtom (directSourceRanks P) 28).ult (rankAtom (directSourceRanks P) 27)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (27 : Fin 78) (58 : Fin 78)
    (28 : Fin 78) (57 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (6 : Fin 13) (7 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (28 : Fin 78) (27 : Fin 78)
    (58 : Fin 78) (26 : Fin 78) (63 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1523` (kalmanson). -/
theorem directSource_h1523 :
    ((!((rankAtom (directSourceRanks P) 27 == rankAtom (directSourceRanks P) 26)) || ((rankAtom (directSourceRanks P) 64).ult (rankAtom (directSourceRanks P) 59)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (59 : Fin 78) (27 : Fin 78)
    (64 : Fin 78) (26 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (6 : Fin 13) (7 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (29 : Fin 78) (27 : Fin 78)
    (59 : Fin 78) (26 : Fin 78) (64 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1524` (kalmanson). -/
theorem directSource_h1524 :
    ((!((rankAtom (directSourceRanks P) 59 == rankAtom (directSourceRanks P) 26)) || ((rankAtom (directSourceRanks P) 64).ult (rankAtom (directSourceRanks P) 27)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (27 : Fin 78) (59 : Fin 78)
    (64 : Fin 78) (26 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (6 : Fin 13) (7 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (29 : Fin 78) (27 : Fin 78)
    (59 : Fin 78) (26 : Fin 78) (64 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1525` (kalmanson). -/
theorem directSource_h1525 :
    ((!((rankAtom (directSourceRanks P) 27 == rankAtom (directSourceRanks P) 29)) || ((rankAtom (directSourceRanks P) 57).ult (rankAtom (directSourceRanks P) 59)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (59 : Fin 78) (27 : Fin 78)
    (57 : Fin 78) (29 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (6 : Fin 13) (7 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (29 : Fin 78) (27 : Fin 78)
    (59 : Fin 78) (26 : Fin 78) (64 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1526` (kalmanson). -/
theorem directSource_h1526 :
    ((!((rankAtom (directSourceRanks P) 59 == rankAtom (directSourceRanks P) 57)) || ((rankAtom (directSourceRanks P) 29).ult (rankAtom (directSourceRanks P) 27)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (27 : Fin 78) (59 : Fin 78)
    (29 : Fin 78) (57 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (6 : Fin 13) (7 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (29 : Fin 78) (27 : Fin 78)
    (59 : Fin 78) (26 : Fin 78) (64 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1527` (kalmanson). -/
theorem directSource_h1527 :
    ((!((rankAtom (directSourceRanks P) 27 == rankAtom (directSourceRanks P) 26)) || ((rankAtom (directSourceRanks P) 65).ult (rankAtom (directSourceRanks P) 60)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (60 : Fin 78) (27 : Fin 78)
    (65 : Fin 78) (26 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (6 : Fin 13) (7 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (30 : Fin 78) (27 : Fin 78)
    (60 : Fin 78) (26 : Fin 78) (65 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1528` (kalmanson). -/
theorem directSource_h1528 :
    ((!((rankAtom (directSourceRanks P) 60 == rankAtom (directSourceRanks P) 26)) || ((rankAtom (directSourceRanks P) 65).ult (rankAtom (directSourceRanks P) 27)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (27 : Fin 78) (60 : Fin 78)
    (65 : Fin 78) (26 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (6 : Fin 13) (7 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (30 : Fin 78) (27 : Fin 78)
    (60 : Fin 78) (26 : Fin 78) (65 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1529` (kalmanson). -/
theorem directSource_h1529 :
    ((!((rankAtom (directSourceRanks P) 27 == rankAtom (directSourceRanks P) 30)) || ((rankAtom (directSourceRanks P) 57).ult (rankAtom (directSourceRanks P) 60)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (60 : Fin 78) (27 : Fin 78)
    (57 : Fin 78) (30 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (6 : Fin 13) (7 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (30 : Fin 78) (27 : Fin 78)
    (60 : Fin 78) (26 : Fin 78) (65 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1530` (kalmanson). -/
theorem directSource_h1530 :
    ((!((rankAtom (directSourceRanks P) 60 == rankAtom (directSourceRanks P) 57)) || ((rankAtom (directSourceRanks P) 30).ult (rankAtom (directSourceRanks P) 27)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (27 : Fin 78) (60 : Fin 78)
    (30 : Fin 78) (57 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (6 : Fin 13) (7 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (30 : Fin 78) (27 : Fin 78)
    (60 : Fin 78) (26 : Fin 78) (65 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1531` (kalmanson). -/
theorem directSource_h1531 :
    ((!((rankAtom (directSourceRanks P) 27 == rankAtom (directSourceRanks P) 26)) || ((rankAtom (directSourceRanks P) 66).ult (rankAtom (directSourceRanks P) 61)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (61 : Fin 78) (27 : Fin 78)
    (66 : Fin 78) (26 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (6 : Fin 13) (7 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (31 : Fin 78) (27 : Fin 78)
    (61 : Fin 78) (26 : Fin 78) (66 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1532` (kalmanson). -/
theorem directSource_h1532 :
    ((!((rankAtom (directSourceRanks P) 61 == rankAtom (directSourceRanks P) 26)) || ((rankAtom (directSourceRanks P) 66).ult (rankAtom (directSourceRanks P) 27)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (27 : Fin 78) (61 : Fin 78)
    (66 : Fin 78) (26 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (6 : Fin 13) (7 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (31 : Fin 78) (27 : Fin 78)
    (61 : Fin 78) (26 : Fin 78) (66 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1533` (kalmanson). -/
theorem directSource_h1533 :
    ((!((rankAtom (directSourceRanks P) 27 == rankAtom (directSourceRanks P) 31)) || ((rankAtom (directSourceRanks P) 57).ult (rankAtom (directSourceRanks P) 61)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (61 : Fin 78) (27 : Fin 78)
    (57 : Fin 78) (31 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (6 : Fin 13) (7 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (31 : Fin 78) (27 : Fin 78)
    (61 : Fin 78) (26 : Fin 78) (66 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1534` (kalmanson). -/
theorem directSource_h1534 :
    ((!((rankAtom (directSourceRanks P) 61 == rankAtom (directSourceRanks P) 57)) || ((rankAtom (directSourceRanks P) 31).ult (rankAtom (directSourceRanks P) 27)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (27 : Fin 78) (61 : Fin 78)
    (31 : Fin 78) (57 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (6 : Fin 13) (7 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (31 : Fin 78) (27 : Fin 78)
    (61 : Fin 78) (26 : Fin 78) (66 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1535` (kalmanson). -/
theorem directSource_h1535 :
    ((!((rankAtom (directSourceRanks P) 27 == rankAtom (directSourceRanks P) 26)) || ((rankAtom (directSourceRanks P) 67).ult (rankAtom (directSourceRanks P) 62)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (62 : Fin 78) (27 : Fin 78)
    (67 : Fin 78) (26 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (6 : Fin 13) (7 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (32 : Fin 78) (27 : Fin 78)
    (62 : Fin 78) (26 : Fin 78) (67 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

end

end ATailExactFiveCard13CnfIngressScratch
end Problem97
