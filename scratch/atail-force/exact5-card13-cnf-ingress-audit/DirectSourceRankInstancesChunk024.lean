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

/-- Exact pass-5 source assertion `h1536` (kalmanson). -/
theorem directSource_h1536 :
    ((!((rankAtom (directSourceRanks P) 62 == rankAtom (directSourceRanks P) 26)) || ((rankAtom (directSourceRanks P) 67).ult (rankAtom (directSourceRanks P) 27)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (27 : Fin 78) (62 : Fin 78)
    (67 : Fin 78) (26 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (6 : Fin 13) (7 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (32 : Fin 78) (27 : Fin 78)
    (62 : Fin 78) (26 : Fin 78) (67 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1537` (kalmanson). -/
theorem directSource_h1537 :
    ((!((rankAtom (directSourceRanks P) 62 == rankAtom (directSourceRanks P) 57)) || ((rankAtom (directSourceRanks P) 32).ult (rankAtom (directSourceRanks P) 27)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (27 : Fin 78) (62 : Fin 78)
    (32 : Fin 78) (57 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (6 : Fin 13) (7 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (32 : Fin 78) (27 : Fin 78)
    (62 : Fin 78) (26 : Fin 78) (67 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1538` (kalmanson). -/
theorem directSource_h1538 :
    ((!((rankAtom (directSourceRanks P) 28 == rankAtom (directSourceRanks P) 26)) || ((rankAtom (directSourceRanks P) 68).ult (rankAtom (directSourceRanks P) 59)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (59 : Fin 78) (28 : Fin 78)
    (68 : Fin 78) (26 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (6 : Fin 13) (8 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (58 : Fin 78) (29 : Fin 78) (28 : Fin 78)
    (59 : Fin 78) (26 : Fin 78) (68 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1539` (kalmanson). -/
theorem directSource_h1539 :
    ((!((rankAtom (directSourceRanks P) 28 == rankAtom (directSourceRanks P) 68)) || ((rankAtom (directSourceRanks P) 26).ult (rankAtom (directSourceRanks P) 59)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (59 : Fin 78) (28 : Fin 78)
    (26 : Fin 78) (68 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (6 : Fin 13) (8 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (58 : Fin 78) (29 : Fin 78) (28 : Fin 78)
    (59 : Fin 78) (26 : Fin 78) (68 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1540` (kalmanson). -/
theorem directSource_h1540 :
    ((!((rankAtom (directSourceRanks P) 28 == rankAtom (directSourceRanks P) 29)) || ((rankAtom (directSourceRanks P) 58).ult (rankAtom (directSourceRanks P) 59)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (59 : Fin 78) (28 : Fin 78)
    (58 : Fin 78) (29 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (6 : Fin 13) (8 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (58 : Fin 78) (29 : Fin 78) (28 : Fin 78)
    (59 : Fin 78) (26 : Fin 78) (68 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1541` (kalmanson). -/
theorem directSource_h1541 :
    ((!((rankAtom (directSourceRanks P) 28 == rankAtom (directSourceRanks P) 58)) || ((rankAtom (directSourceRanks P) 29).ult (rankAtom (directSourceRanks P) 59)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (59 : Fin 78) (28 : Fin 78)
    (29 : Fin 78) (58 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (6 : Fin 13) (8 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (58 : Fin 78) (29 : Fin 78) (28 : Fin 78)
    (59 : Fin 78) (26 : Fin 78) (68 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1542` (kalmanson). -/
theorem directSource_h1542 :
    ((!((rankAtom (directSourceRanks P) 59 == rankAtom (directSourceRanks P) 58)) || ((rankAtom (directSourceRanks P) 29).ult (rankAtom (directSourceRanks P) 28)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (28 : Fin 78) (59 : Fin 78)
    (29 : Fin 78) (58 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (6 : Fin 13) (8 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (58 : Fin 78) (29 : Fin 78) (28 : Fin 78)
    (59 : Fin 78) (26 : Fin 78) (68 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1543` (kalmanson). -/
theorem directSource_h1543 :
    ((!((rankAtom (directSourceRanks P) 28 == rankAtom (directSourceRanks P) 26)) || ((rankAtom (directSourceRanks P) 69).ult (rankAtom (directSourceRanks P) 60)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (60 : Fin 78) (28 : Fin 78)
    (69 : Fin 78) (26 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (6 : Fin 13) (8 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (58 : Fin 78) (30 : Fin 78) (28 : Fin 78)
    (60 : Fin 78) (26 : Fin 78) (69 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1544` (kalmanson). -/
theorem directSource_h1544 :
    ((!((rankAtom (directSourceRanks P) 28 == rankAtom (directSourceRanks P) 69)) || ((rankAtom (directSourceRanks P) 26).ult (rankAtom (directSourceRanks P) 60)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (60 : Fin 78) (28 : Fin 78)
    (26 : Fin 78) (69 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (6 : Fin 13) (8 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (58 : Fin 78) (30 : Fin 78) (28 : Fin 78)
    (60 : Fin 78) (26 : Fin 78) (69 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1545` (kalmanson). -/
theorem directSource_h1545 :
    ((!((rankAtom (directSourceRanks P) 28 == rankAtom (directSourceRanks P) 30)) || ((rankAtom (directSourceRanks P) 58).ult (rankAtom (directSourceRanks P) 60)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (60 : Fin 78) (28 : Fin 78)
    (58 : Fin 78) (30 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (6 : Fin 13) (8 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (58 : Fin 78) (30 : Fin 78) (28 : Fin 78)
    (60 : Fin 78) (26 : Fin 78) (69 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1546` (kalmanson). -/
theorem directSource_h1546 :
    ((!((rankAtom (directSourceRanks P) 28 == rankAtom (directSourceRanks P) 58)) || ((rankAtom (directSourceRanks P) 30).ult (rankAtom (directSourceRanks P) 60)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (60 : Fin 78) (28 : Fin 78)
    (30 : Fin 78) (58 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (6 : Fin 13) (8 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (58 : Fin 78) (30 : Fin 78) (28 : Fin 78)
    (60 : Fin 78) (26 : Fin 78) (69 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1547` (kalmanson). -/
theorem directSource_h1547 :
    ((!((rankAtom (directSourceRanks P) 60 == rankAtom (directSourceRanks P) 58)) || ((rankAtom (directSourceRanks P) 30).ult (rankAtom (directSourceRanks P) 28)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (28 : Fin 78) (60 : Fin 78)
    (30 : Fin 78) (58 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (6 : Fin 13) (8 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (58 : Fin 78) (30 : Fin 78) (28 : Fin 78)
    (60 : Fin 78) (26 : Fin 78) (69 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1548` (kalmanson). -/
theorem directSource_h1548 :
    ((!((rankAtom (directSourceRanks P) 28 == rankAtom (directSourceRanks P) 26)) || ((rankAtom (directSourceRanks P) 70).ult (rankAtom (directSourceRanks P) 61)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (61 : Fin 78) (28 : Fin 78)
    (70 : Fin 78) (26 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (6 : Fin 13) (8 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (58 : Fin 78) (31 : Fin 78) (28 : Fin 78)
    (61 : Fin 78) (26 : Fin 78) (70 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1549` (kalmanson). -/
theorem directSource_h1549 :
    ((!((rankAtom (directSourceRanks P) 28 == rankAtom (directSourceRanks P) 70)) || ((rankAtom (directSourceRanks P) 26).ult (rankAtom (directSourceRanks P) 61)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (61 : Fin 78) (28 : Fin 78)
    (26 : Fin 78) (70 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (6 : Fin 13) (8 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (58 : Fin 78) (31 : Fin 78) (28 : Fin 78)
    (61 : Fin 78) (26 : Fin 78) (70 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1550` (kalmanson). -/
theorem directSource_h1550 :
    ((!((rankAtom (directSourceRanks P) 28 == rankAtom (directSourceRanks P) 58)) || ((rankAtom (directSourceRanks P) 31).ult (rankAtom (directSourceRanks P) 61)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (61 : Fin 78) (28 : Fin 78)
    (31 : Fin 78) (58 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (6 : Fin 13) (8 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (58 : Fin 78) (31 : Fin 78) (28 : Fin 78)
    (61 : Fin 78) (26 : Fin 78) (70 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1551` (kalmanson). -/
theorem directSource_h1551 :
    ((!((rankAtom (directSourceRanks P) 61 == rankAtom (directSourceRanks P) 58)) || ((rankAtom (directSourceRanks P) 31).ult (rankAtom (directSourceRanks P) 28)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (28 : Fin 78) (61 : Fin 78)
    (31 : Fin 78) (58 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (6 : Fin 13) (8 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (58 : Fin 78) (31 : Fin 78) (28 : Fin 78)
    (61 : Fin 78) (26 : Fin 78) (70 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1552` (kalmanson). -/
theorem directSource_h1552 :
    ((!((rankAtom (directSourceRanks P) 28 == rankAtom (directSourceRanks P) 26)) || ((rankAtom (directSourceRanks P) 71).ult (rankAtom (directSourceRanks P) 62)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (62 : Fin 78) (28 : Fin 78)
    (71 : Fin 78) (26 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (6 : Fin 13) (8 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (58 : Fin 78) (32 : Fin 78) (28 : Fin 78)
    (62 : Fin 78) (26 : Fin 78) (71 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1553` (kalmanson). -/
theorem directSource_h1553 :
    ((!((rankAtom (directSourceRanks P) 28 == rankAtom (directSourceRanks P) 71)) || ((rankAtom (directSourceRanks P) 26).ult (rankAtom (directSourceRanks P) 62)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (62 : Fin 78) (28 : Fin 78)
    (26 : Fin 78) (71 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (6 : Fin 13) (8 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (58 : Fin 78) (32 : Fin 78) (28 : Fin 78)
    (62 : Fin 78) (26 : Fin 78) (71 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1554` (kalmanson). -/
theorem directSource_h1554 :
    ((!((rankAtom (directSourceRanks P) 28 == rankAtom (directSourceRanks P) 58)) || ((rankAtom (directSourceRanks P) 32).ult (rankAtom (directSourceRanks P) 62)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (62 : Fin 78) (28 : Fin 78)
    (32 : Fin 78) (58 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (6 : Fin 13) (8 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (58 : Fin 78) (32 : Fin 78) (28 : Fin 78)
    (62 : Fin 78) (26 : Fin 78) (71 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1555` (kalmanson). -/
theorem directSource_h1555 :
    ((!((rankAtom (directSourceRanks P) 62 == rankAtom (directSourceRanks P) 58)) || ((rankAtom (directSourceRanks P) 32).ult (rankAtom (directSourceRanks P) 28)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (28 : Fin 78) (62 : Fin 78)
    (32 : Fin 78) (58 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (6 : Fin 13) (8 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (58 : Fin 78) (32 : Fin 78) (28 : Fin 78)
    (62 : Fin 78) (26 : Fin 78) (71 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1556` (kalmanson). -/
theorem directSource_h1556 :
    ((!((rankAtom (directSourceRanks P) 28 == rankAtom (directSourceRanks P) 27)) || ((rankAtom (directSourceRanks P) 68).ult (rankAtom (directSourceRanks P) 64)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (64 : Fin 78) (28 : Fin 78)
    (68 : Fin 78) (27 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (7 : Fin 13) (8 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (63 : Fin 78) (29 : Fin 78) (28 : Fin 78)
    (64 : Fin 78) (27 : Fin 78) (68 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1557` (kalmanson). -/
theorem directSource_h1557 :
    ((!((rankAtom (directSourceRanks P) 28 == rankAtom (directSourceRanks P) 68)) || ((rankAtom (directSourceRanks P) 27).ult (rankAtom (directSourceRanks P) 64)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (64 : Fin 78) (28 : Fin 78)
    (27 : Fin 78) (68 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (7 : Fin 13) (8 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (63 : Fin 78) (29 : Fin 78) (28 : Fin 78)
    (64 : Fin 78) (27 : Fin 78) (68 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1558` (kalmanson). -/
theorem directSource_h1558 :
    ((!((rankAtom (directSourceRanks P) 28 == rankAtom (directSourceRanks P) 63)) || ((rankAtom (directSourceRanks P) 29).ult (rankAtom (directSourceRanks P) 64)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (64 : Fin 78) (28 : Fin 78)
    (29 : Fin 78) (63 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (7 : Fin 13) (8 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (63 : Fin 78) (29 : Fin 78) (28 : Fin 78)
    (64 : Fin 78) (27 : Fin 78) (68 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1559` (kalmanson). -/
theorem directSource_h1559 :
    ((!((rankAtom (directSourceRanks P) 28 == rankAtom (directSourceRanks P) 27)) || ((rankAtom (directSourceRanks P) 69).ult (rankAtom (directSourceRanks P) 65)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (65 : Fin 78) (28 : Fin 78)
    (69 : Fin 78) (27 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (7 : Fin 13) (8 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (63 : Fin 78) (30 : Fin 78) (28 : Fin 78)
    (65 : Fin 78) (27 : Fin 78) (69 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1560` (kalmanson). -/
theorem directSource_h1560 :
    ((!((rankAtom (directSourceRanks P) 28 == rankAtom (directSourceRanks P) 69)) || ((rankAtom (directSourceRanks P) 27).ult (rankAtom (directSourceRanks P) 65)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (65 : Fin 78) (28 : Fin 78)
    (27 : Fin 78) (69 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (7 : Fin 13) (8 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (63 : Fin 78) (30 : Fin 78) (28 : Fin 78)
    (65 : Fin 78) (27 : Fin 78) (69 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1561` (kalmanson). -/
theorem directSource_h1561 :
    ((!((rankAtom (directSourceRanks P) 28 == rankAtom (directSourceRanks P) 63)) || ((rankAtom (directSourceRanks P) 30).ult (rankAtom (directSourceRanks P) 65)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (65 : Fin 78) (28 : Fin 78)
    (30 : Fin 78) (63 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (7 : Fin 13) (8 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (63 : Fin 78) (30 : Fin 78) (28 : Fin 78)
    (65 : Fin 78) (27 : Fin 78) (69 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1562` (kalmanson). -/
theorem directSource_h1562 :
    ((!((rankAtom (directSourceRanks P) 28 == rankAtom (directSourceRanks P) 27)) || ((rankAtom (directSourceRanks P) 70).ult (rankAtom (directSourceRanks P) 66)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (66 : Fin 78) (28 : Fin 78)
    (70 : Fin 78) (27 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (7 : Fin 13) (8 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (63 : Fin 78) (31 : Fin 78) (28 : Fin 78)
    (66 : Fin 78) (27 : Fin 78) (70 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1563` (kalmanson). -/
theorem directSource_h1563 :
    ((!((rankAtom (directSourceRanks P) 28 == rankAtom (directSourceRanks P) 70)) || ((rankAtom (directSourceRanks P) 27).ult (rankAtom (directSourceRanks P) 66)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (66 : Fin 78) (28 : Fin 78)
    (27 : Fin 78) (70 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (7 : Fin 13) (8 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (63 : Fin 78) (31 : Fin 78) (28 : Fin 78)
    (66 : Fin 78) (27 : Fin 78) (70 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1564` (kalmanson). -/
theorem directSource_h1564 :
    ((!((rankAtom (directSourceRanks P) 28 == rankAtom (directSourceRanks P) 63)) || ((rankAtom (directSourceRanks P) 31).ult (rankAtom (directSourceRanks P) 66)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (66 : Fin 78) (28 : Fin 78)
    (31 : Fin 78) (63 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (7 : Fin 13) (8 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (63 : Fin 78) (31 : Fin 78) (28 : Fin 78)
    (66 : Fin 78) (27 : Fin 78) (70 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1565` (kalmanson). -/
theorem directSource_h1565 :
    ((!((rankAtom (directSourceRanks P) 28 == rankAtom (directSourceRanks P) 27)) || ((rankAtom (directSourceRanks P) 71).ult (rankAtom (directSourceRanks P) 67)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (67 : Fin 78) (28 : Fin 78)
    (71 : Fin 78) (27 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (7 : Fin 13) (8 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (63 : Fin 78) (32 : Fin 78) (28 : Fin 78)
    (67 : Fin 78) (27 : Fin 78) (71 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1566` (kalmanson). -/
theorem directSource_h1566 :
    ((!((rankAtom (directSourceRanks P) 28 == rankAtom (directSourceRanks P) 71)) || ((rankAtom (directSourceRanks P) 27).ult (rankAtom (directSourceRanks P) 67)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (67 : Fin 78) (28 : Fin 78)
    (27 : Fin 78) (71 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (7 : Fin 13) (8 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (63 : Fin 78) (32 : Fin 78) (28 : Fin 78)
    (67 : Fin 78) (27 : Fin 78) (71 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1567` (kalmanson). -/
theorem directSource_h1567 :
    ((!((rankAtom (directSourceRanks P) 28 == rankAtom (directSourceRanks P) 63)) || ((rankAtom (directSourceRanks P) 32).ult (rankAtom (directSourceRanks P) 67)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (67 : Fin 78) (28 : Fin 78)
    (32 : Fin 78) (63 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (7 : Fin 13) (8 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (63 : Fin 78) (32 : Fin 78) (28 : Fin 78)
    (67 : Fin 78) (27 : Fin 78) (71 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1568` (kalmanson). -/
theorem directSource_h1568 :
    ((!((rankAtom (directSourceRanks P) 43 == rankAtom (directSourceRanks P) 50)) || ((rankAtom (directSourceRanks P) 33).ult (rankAtom (directSourceRanks P) 34)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (34 : Fin 78) (43 : Fin 78)
    (33 : Fin 78) (50 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (4 : Fin 13) (5 : Fin 13) (6 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (35 : Fin 78) (34 : Fin 78)
    (43 : Fin 78) (33 : Fin 78) (50 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1569` (kalmanson). -/
theorem directSource_h1569 :
    ((!((rankAtom (directSourceRanks P) 34 == rankAtom (directSourceRanks P) 42)) || ((rankAtom (directSourceRanks P) 35).ult (rankAtom (directSourceRanks P) 43)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (43 : Fin 78) (34 : Fin 78)
    (35 : Fin 78) (42 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (4 : Fin 13) (5 : Fin 13) (6 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (35 : Fin 78) (34 : Fin 78)
    (43 : Fin 78) (33 : Fin 78) (50 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1570` (kalmanson). -/
theorem directSource_h1570 :
    ((!((rankAtom (directSourceRanks P) 43 == rankAtom (directSourceRanks P) 35)) || ((rankAtom (directSourceRanks P) 42).ult (rankAtom (directSourceRanks P) 34)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (34 : Fin 78) (43 : Fin 78)
    (42 : Fin 78) (35 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (4 : Fin 13) (5 : Fin 13) (6 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (35 : Fin 78) (34 : Fin 78)
    (43 : Fin 78) (33 : Fin 78) (50 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1571` (kalmanson). -/
theorem directSource_h1571 :
    ((!((rankAtom (directSourceRanks P) 43 == rankAtom (directSourceRanks P) 42)) || ((rankAtom (directSourceRanks P) 35).ult (rankAtom (directSourceRanks P) 34)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (34 : Fin 78) (43 : Fin 78)
    (35 : Fin 78) (42 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (4 : Fin 13) (5 : Fin 13) (6 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (35 : Fin 78) (34 : Fin 78)
    (43 : Fin 78) (33 : Fin 78) (50 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1572` (kalmanson). -/
theorem directSource_h1572 :
    ((!((rankAtom (directSourceRanks P) 34 == rankAtom (directSourceRanks P) 42)) || ((rankAtom (directSourceRanks P) 36).ult (rankAtom (directSourceRanks P) 44)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (44 : Fin 78) (34 : Fin 78)
    (36 : Fin 78) (42 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (4 : Fin 13) (5 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (36 : Fin 78) (34 : Fin 78)
    (44 : Fin 78) (33 : Fin 78) (51 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1573` (kalmanson). -/
theorem directSource_h1573 :
    ((!((rankAtom (directSourceRanks P) 44 == rankAtom (directSourceRanks P) 42)) || ((rankAtom (directSourceRanks P) 36).ult (rankAtom (directSourceRanks P) 34)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (34 : Fin 78) (44 : Fin 78)
    (36 : Fin 78) (42 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (4 : Fin 13) (5 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (36 : Fin 78) (34 : Fin 78)
    (44 : Fin 78) (33 : Fin 78) (51 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1574` (kalmanson). -/
theorem directSource_h1574 :
    ((!((rankAtom (directSourceRanks P) 34 == rankAtom (directSourceRanks P) 52)) || ((rankAtom (directSourceRanks P) 33).ult (rankAtom (directSourceRanks P) 45)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (45 : Fin 78) (34 : Fin 78)
    (33 : Fin 78) (52 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (4 : Fin 13) (5 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (37 : Fin 78) (34 : Fin 78)
    (45 : Fin 78) (33 : Fin 78) (52 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1575` (kalmanson). -/
theorem directSource_h1575 :
    ((!((rankAtom (directSourceRanks P) 34 == rankAtom (directSourceRanks P) 42)) || ((rankAtom (directSourceRanks P) 37).ult (rankAtom (directSourceRanks P) 45)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (45 : Fin 78) (34 : Fin 78)
    (37 : Fin 78) (42 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (4 : Fin 13) (5 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (37 : Fin 78) (34 : Fin 78)
    (45 : Fin 78) (33 : Fin 78) (52 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1576` (kalmanson). -/
theorem directSource_h1576 :
    ((!((rankAtom (directSourceRanks P) 45 == rankAtom (directSourceRanks P) 37)) || ((rankAtom (directSourceRanks P) 42).ult (rankAtom (directSourceRanks P) 34)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (34 : Fin 78) (45 : Fin 78)
    (42 : Fin 78) (37 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (4 : Fin 13) (5 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (37 : Fin 78) (34 : Fin 78)
    (45 : Fin 78) (33 : Fin 78) (52 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1577` (kalmanson). -/
theorem directSource_h1577 :
    ((!((rankAtom (directSourceRanks P) 46 == rankAtom (directSourceRanks P) 33)) || ((rankAtom (directSourceRanks P) 53).ult (rankAtom (directSourceRanks P) 34)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (34 : Fin 78) (46 : Fin 78)
    (53 : Fin 78) (33 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (4 : Fin 13) (5 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (38 : Fin 78) (34 : Fin 78)
    (46 : Fin 78) (33 : Fin 78) (53 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1578` (kalmanson). -/
theorem directSource_h1578 :
    ((!((rankAtom (directSourceRanks P) 34 == rankAtom (directSourceRanks P) 42)) || ((rankAtom (directSourceRanks P) 38).ult (rankAtom (directSourceRanks P) 46)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (46 : Fin 78) (34 : Fin 78)
    (38 : Fin 78) (42 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (4 : Fin 13) (5 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (38 : Fin 78) (34 : Fin 78)
    (46 : Fin 78) (33 : Fin 78) (53 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1579` (kalmanson). -/
theorem directSource_h1579 :
    ((!((rankAtom (directSourceRanks P) 46 == rankAtom (directSourceRanks P) 42)) || ((rankAtom (directSourceRanks P) 38).ult (rankAtom (directSourceRanks P) 34)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (34 : Fin 78) (46 : Fin 78)
    (38 : Fin 78) (42 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (4 : Fin 13) (5 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (38 : Fin 78) (34 : Fin 78)
    (46 : Fin 78) (33 : Fin 78) (53 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1580` (kalmanson). -/
theorem directSource_h1580 :
    ((!((rankAtom (directSourceRanks P) 47 == rankAtom (directSourceRanks P) 33)) || ((rankAtom (directSourceRanks P) 54).ult (rankAtom (directSourceRanks P) 34)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (34 : Fin 78) (47 : Fin 78)
    (54 : Fin 78) (33 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (4 : Fin 13) (5 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (39 : Fin 78) (34 : Fin 78)
    (47 : Fin 78) (33 : Fin 78) (54 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1581` (kalmanson). -/
theorem directSource_h1581 :
    ((!((rankAtom (directSourceRanks P) 34 == rankAtom (directSourceRanks P) 42)) || ((rankAtom (directSourceRanks P) 39).ult (rankAtom (directSourceRanks P) 47)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (47 : Fin 78) (34 : Fin 78)
    (39 : Fin 78) (42 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (4 : Fin 13) (5 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (39 : Fin 78) (34 : Fin 78)
    (47 : Fin 78) (33 : Fin 78) (54 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1582` (kalmanson). -/
theorem directSource_h1582 :
    ((!((rankAtom (directSourceRanks P) 47 == rankAtom (directSourceRanks P) 42)) || ((rankAtom (directSourceRanks P) 39).ult (rankAtom (directSourceRanks P) 34)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (34 : Fin 78) (47 : Fin 78)
    (39 : Fin 78) (42 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (4 : Fin 13) (5 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (39 : Fin 78) (34 : Fin 78)
    (47 : Fin 78) (33 : Fin 78) (54 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1583` (kalmanson). -/
theorem directSource_h1583 :
    ((!((rankAtom (directSourceRanks P) 48 == rankAtom (directSourceRanks P) 33)) || ((rankAtom (directSourceRanks P) 55).ult (rankAtom (directSourceRanks P) 34)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (34 : Fin 78) (48 : Fin 78)
    (55 : Fin 78) (33 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (4 : Fin 13) (5 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (40 : Fin 78) (34 : Fin 78)
    (48 : Fin 78) (33 : Fin 78) (55 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1584` (kalmanson). -/
theorem directSource_h1584 :
    ((!((rankAtom (directSourceRanks P) 34 == rankAtom (directSourceRanks P) 42)) || ((rankAtom (directSourceRanks P) 40).ult (rankAtom (directSourceRanks P) 48)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (48 : Fin 78) (34 : Fin 78)
    (40 : Fin 78) (42 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (4 : Fin 13) (5 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (40 : Fin 78) (34 : Fin 78)
    (48 : Fin 78) (33 : Fin 78) (55 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1585` (kalmanson). -/
theorem directSource_h1585 :
    ((!((rankAtom (directSourceRanks P) 48 == rankAtom (directSourceRanks P) 42)) || ((rankAtom (directSourceRanks P) 40).ult (rankAtom (directSourceRanks P) 34)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (34 : Fin 78) (48 : Fin 78)
    (40 : Fin 78) (42 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (4 : Fin 13) (5 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (40 : Fin 78) (34 : Fin 78)
    (48 : Fin 78) (33 : Fin 78) (55 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1586` (kalmanson). -/
theorem directSource_h1586 :
    ((!((rankAtom (directSourceRanks P) 49 == rankAtom (directSourceRanks P) 33)) || ((rankAtom (directSourceRanks P) 56).ult (rankAtom (directSourceRanks P) 34)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (34 : Fin 78) (49 : Fin 78)
    (56 : Fin 78) (33 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (4 : Fin 13) (5 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (41 : Fin 78) (34 : Fin 78)
    (49 : Fin 78) (33 : Fin 78) (56 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1587` (kalmanson). -/
theorem directSource_h1587 :
    ((!((rankAtom (directSourceRanks P) 34 == rankAtom (directSourceRanks P) 42)) || ((rankAtom (directSourceRanks P) 41).ult (rankAtom (directSourceRanks P) 49)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (49 : Fin 78) (34 : Fin 78)
    (41 : Fin 78) (42 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (4 : Fin 13) (5 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (41 : Fin 78) (34 : Fin 78)
    (49 : Fin 78) (33 : Fin 78) (56 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1588` (kalmanson). -/
theorem directSource_h1588 :
    ((!((rankAtom (directSourceRanks P) 49 == rankAtom (directSourceRanks P) 42)) || ((rankAtom (directSourceRanks P) 41).ult (rankAtom (directSourceRanks P) 34)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (34 : Fin 78) (49 : Fin 78)
    (41 : Fin 78) (42 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (4 : Fin 13) (5 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (41 : Fin 78) (34 : Fin 78)
    (49 : Fin 78) (33 : Fin 78) (56 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1589` (kalmanson). -/
theorem directSource_h1589 :
    ((!((rankAtom (directSourceRanks P) 35 == rankAtom (directSourceRanks P) 57)) || ((rankAtom (directSourceRanks P) 33).ult (rankAtom (directSourceRanks P) 44)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (44 : Fin 78) (35 : Fin 78)
    (33 : Fin 78) (57 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (4 : Fin 13) (6 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (43 : Fin 78) (36 : Fin 78) (35 : Fin 78)
    (44 : Fin 78) (33 : Fin 78) (57 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1590` (kalmanson). -/
theorem directSource_h1590 :
    ((!((rankAtom (directSourceRanks P) 35 == rankAtom (directSourceRanks P) 43)) || ((rankAtom (directSourceRanks P) 36).ult (rankAtom (directSourceRanks P) 44)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (44 : Fin 78) (35 : Fin 78)
    (36 : Fin 78) (43 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (4 : Fin 13) (6 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (43 : Fin 78) (36 : Fin 78) (35 : Fin 78)
    (44 : Fin 78) (33 : Fin 78) (57 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1591` (kalmanson). -/
theorem directSource_h1591 :
    ((!((rankAtom (directSourceRanks P) 44 == rankAtom (directSourceRanks P) 43)) || ((rankAtom (directSourceRanks P) 36).ult (rankAtom (directSourceRanks P) 35)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (35 : Fin 78) (44 : Fin 78)
    (36 : Fin 78) (43 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (4 : Fin 13) (6 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (43 : Fin 78) (36 : Fin 78) (35 : Fin 78)
    (44 : Fin 78) (33 : Fin 78) (57 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1592` (kalmanson). -/
theorem directSource_h1592 :
    ((!((rankAtom (directSourceRanks P) 35 == rankAtom (directSourceRanks P) 37)) || ((rankAtom (directSourceRanks P) 43).ult (rankAtom (directSourceRanks P) 45)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (45 : Fin 78) (35 : Fin 78)
    (43 : Fin 78) (37 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (4 : Fin 13) (6 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (43 : Fin 78) (37 : Fin 78) (35 : Fin 78)
    (45 : Fin 78) (33 : Fin 78) (58 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1593` (kalmanson). -/
theorem directSource_h1593 :
    ((!((rankAtom (directSourceRanks P) 35 == rankAtom (directSourceRanks P) 43)) || ((rankAtom (directSourceRanks P) 37).ult (rankAtom (directSourceRanks P) 45)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (45 : Fin 78) (35 : Fin 78)
    (37 : Fin 78) (43 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (4 : Fin 13) (6 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (43 : Fin 78) (37 : Fin 78) (35 : Fin 78)
    (45 : Fin 78) (33 : Fin 78) (58 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1594` (kalmanson). -/
theorem directSource_h1594 :
    ((!((rankAtom (directSourceRanks P) 45 == rankAtom (directSourceRanks P) 37)) || ((rankAtom (directSourceRanks P) 43).ult (rankAtom (directSourceRanks P) 35)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (35 : Fin 78) (45 : Fin 78)
    (43 : Fin 78) (37 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (4 : Fin 13) (6 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (43 : Fin 78) (37 : Fin 78) (35 : Fin 78)
    (45 : Fin 78) (33 : Fin 78) (58 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1595` (kalmanson). -/
theorem directSource_h1595 :
    ((!((rankAtom (directSourceRanks P) 46 == rankAtom (directSourceRanks P) 33)) || ((rankAtom (directSourceRanks P) 59).ult (rankAtom (directSourceRanks P) 35)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (35 : Fin 78) (46 : Fin 78)
    (59 : Fin 78) (33 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (4 : Fin 13) (6 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (43 : Fin 78) (38 : Fin 78) (35 : Fin 78)
    (46 : Fin 78) (33 : Fin 78) (59 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1596` (kalmanson). -/
theorem directSource_h1596 :
    ((!((rankAtom (directSourceRanks P) 35 == rankAtom (directSourceRanks P) 43)) || ((rankAtom (directSourceRanks P) 38).ult (rankAtom (directSourceRanks P) 46)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (46 : Fin 78) (35 : Fin 78)
    (38 : Fin 78) (43 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (4 : Fin 13) (6 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (43 : Fin 78) (38 : Fin 78) (35 : Fin 78)
    (46 : Fin 78) (33 : Fin 78) (59 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1597` (kalmanson). -/
theorem directSource_h1597 :
    ((!((rankAtom (directSourceRanks P) 46 == rankAtom (directSourceRanks P) 43)) || ((rankAtom (directSourceRanks P) 38).ult (rankAtom (directSourceRanks P) 35)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (35 : Fin 78) (46 : Fin 78)
    (38 : Fin 78) (43 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (4 : Fin 13) (6 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (43 : Fin 78) (38 : Fin 78) (35 : Fin 78)
    (46 : Fin 78) (33 : Fin 78) (59 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1598` (kalmanson). -/
theorem directSource_h1598 :
    ((!((rankAtom (directSourceRanks P) 47 == rankAtom (directSourceRanks P) 33)) || ((rankAtom (directSourceRanks P) 60).ult (rankAtom (directSourceRanks P) 35)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (35 : Fin 78) (47 : Fin 78)
    (60 : Fin 78) (33 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (4 : Fin 13) (6 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (43 : Fin 78) (39 : Fin 78) (35 : Fin 78)
    (47 : Fin 78) (33 : Fin 78) (60 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1599` (kalmanson). -/
theorem directSource_h1599 :
    ((!((rankAtom (directSourceRanks P) 35 == rankAtom (directSourceRanks P) 43)) || ((rankAtom (directSourceRanks P) 39).ult (rankAtom (directSourceRanks P) 47)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (47 : Fin 78) (35 : Fin 78)
    (39 : Fin 78) (43 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (4 : Fin 13) (6 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (43 : Fin 78) (39 : Fin 78) (35 : Fin 78)
    (47 : Fin 78) (33 : Fin 78) (60 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

end

end ATailExactFiveCard13CnfIngressScratch
end Problem97
