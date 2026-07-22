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

/-- Exact pass-5 source assertion `h0576` (kalmanson). -/
theorem directSource_h0576 :
    ((!((rankAtom (directSourceRanks P) 18 == rankAtom (directSourceRanks P) 7)) || ((rankAtom (directSourceRanks P) 12).ult (rankAtom (directSourceRanks P) 1)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (1 : Fin 78) (18 : Fin 78)
    (12 : Fin 78) (7 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (2 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (12 : Fin 78) (7 : Fin 78) (1 : Fin 78)
    (18 : Fin 78) (0 : Fin 78) (28 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0577` (kalmanson). -/
theorem directSource_h0577 :
    ((!((rankAtom (directSourceRanks P) 18 == rankAtom (directSourceRanks P) 12)) || ((rankAtom (directSourceRanks P) 7).ult (rankAtom (directSourceRanks P) 1)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (1 : Fin 78) (18 : Fin 78)
    (7 : Fin 78) (12 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (2 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (12 : Fin 78) (7 : Fin 78) (1 : Fin 78)
    (18 : Fin 78) (0 : Fin 78) (28 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0578` (kalmanson). -/
theorem directSource_h0578 :
    ((!((rankAtom (directSourceRanks P) 2 == rankAtom (directSourceRanks P) 4)) || ((rankAtom (directSourceRanks P) 13).ult (rankAtom (directSourceRanks P) 15)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (15 : Fin 78) (2 : Fin 78)
    (13 : Fin 78) (4 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (3 : Fin 13) (5 : Fin 13)
    (by decide) (by decide) (by decide)
    (13 : Fin 78) (4 : Fin 78) (2 : Fin 78)
    (15 : Fin 78) (0 : Fin 78) (34 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0579` (kalmanson). -/
theorem directSource_h0579 :
    ((!((rankAtom (directSourceRanks P) 2 == rankAtom (directSourceRanks P) 5)) || ((rankAtom (directSourceRanks P) 13).ult (rankAtom (directSourceRanks P) 16)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (16 : Fin 78) (2 : Fin 78)
    (13 : Fin 78) (5 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (3 : Fin 13) (6 : Fin 13)
    (by decide) (by decide) (by decide)
    (13 : Fin 78) (5 : Fin 78) (2 : Fin 78)
    (16 : Fin 78) (0 : Fin 78) (35 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0580` (kalmanson). -/
theorem directSource_h0580 :
    ((!((rankAtom (directSourceRanks P) 2 == rankAtom (directSourceRanks P) 6)) || ((rankAtom (directSourceRanks P) 13).ult (rankAtom (directSourceRanks P) 17)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (17 : Fin 78) (2 : Fin 78)
    (13 : Fin 78) (6 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (3 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (13 : Fin 78) (6 : Fin 78) (2 : Fin 78)
    (17 : Fin 78) (0 : Fin 78) (36 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0581` (kalmanson). -/
theorem directSource_h0581 :
    ((!((rankAtom (directSourceRanks P) 18 == rankAtom (directSourceRanks P) 0)) || ((rankAtom (directSourceRanks P) 37).ult (rankAtom (directSourceRanks P) 2)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (2 : Fin 78) (18 : Fin 78)
    (37 : Fin 78) (0 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (3 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (13 : Fin 78) (7 : Fin 78) (2 : Fin 78)
    (18 : Fin 78) (0 : Fin 78) (37 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0582` (kalmanson). -/
theorem directSource_h0582 :
    ((!((rankAtom (directSourceRanks P) 18 == rankAtom (directSourceRanks P) 37)) || ((rankAtom (directSourceRanks P) 0).ult (rankAtom (directSourceRanks P) 2)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (2 : Fin 78) (18 : Fin 78)
    (0 : Fin 78) (37 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (3 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (13 : Fin 78) (7 : Fin 78) (2 : Fin 78)
    (18 : Fin 78) (0 : Fin 78) (37 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0583` (kalmanson). -/
theorem directSource_h0583 :
    ((!((rankAtom (directSourceRanks P) 18 == rankAtom (directSourceRanks P) 7)) || ((rankAtom (directSourceRanks P) 13).ult (rankAtom (directSourceRanks P) 2)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (2 : Fin 78) (18 : Fin 78)
    (13 : Fin 78) (7 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (3 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (13 : Fin 78) (7 : Fin 78) (2 : Fin 78)
    (18 : Fin 78) (0 : Fin 78) (37 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0584` (kalmanson). -/
theorem directSource_h0584 :
    ((!((rankAtom (directSourceRanks P) 3 == rankAtom (directSourceRanks P) 4)) || ((rankAtom (directSourceRanks P) 14).ult (rankAtom (directSourceRanks P) 15)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (15 : Fin 78) (3 : Fin 78)
    (14 : Fin 78) (4 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (4 : Fin 13) (5 : Fin 13)
    (by decide) (by decide) (by decide)
    (14 : Fin 78) (4 : Fin 78) (3 : Fin 78)
    (15 : Fin 78) (0 : Fin 78) (42 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0585` (kalmanson). -/
theorem directSource_h0585 :
    ((!((rankAtom (directSourceRanks P) 3 == rankAtom (directSourceRanks P) 5)) || ((rankAtom (directSourceRanks P) 14).ult (rankAtom (directSourceRanks P) 16)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (16 : Fin 78) (3 : Fin 78)
    (14 : Fin 78) (5 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (4 : Fin 13) (6 : Fin 13)
    (by decide) (by decide) (by decide)
    (14 : Fin 78) (5 : Fin 78) (3 : Fin 78)
    (16 : Fin 78) (0 : Fin 78) (43 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0586` (kalmanson). -/
theorem directSource_h0586 :
    ((!((rankAtom (directSourceRanks P) 3 == rankAtom (directSourceRanks P) 6)) || ((rankAtom (directSourceRanks P) 14).ult (rankAtom (directSourceRanks P) 17)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (17 : Fin 78) (3 : Fin 78)
    (14 : Fin 78) (6 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (4 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (14 : Fin 78) (6 : Fin 78) (3 : Fin 78)
    (17 : Fin 78) (0 : Fin 78) (44 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0587` (kalmanson). -/
theorem directSource_h0587 :
    ((!((rankAtom (directSourceRanks P) 3 == rankAtom (directSourceRanks P) 7)) || ((rankAtom (directSourceRanks P) 14).ult (rankAtom (directSourceRanks P) 18)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (18 : Fin 78) (3 : Fin 78)
    (14 : Fin 78) (7 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (4 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (14 : Fin 78) (7 : Fin 78) (3 : Fin 78)
    (18 : Fin 78) (0 : Fin 78) (45 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0588` (kalmanson). -/
theorem directSource_h0588 :
    ((!((rankAtom (directSourceRanks P) 18 == rankAtom (directSourceRanks P) 7)) || ((rankAtom (directSourceRanks P) 14).ult (rankAtom (directSourceRanks P) 3)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (3 : Fin 78) (18 : Fin 78)
    (14 : Fin 78) (7 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (4 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (14 : Fin 78) (7 : Fin 78) (3 : Fin 78)
    (18 : Fin 78) (0 : Fin 78) (45 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0589` (kalmanson). -/
theorem directSource_h0589 :
    ((!((rankAtom (directSourceRanks P) 3 == rankAtom (directSourceRanks P) 46)) || ((rankAtom (directSourceRanks P) 0).ult (rankAtom (directSourceRanks P) 19)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (19 : Fin 78) (3 : Fin 78)
    (0 : Fin 78) (46 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (4 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (14 : Fin 78) (8 : Fin 78) (3 : Fin 78)
    (19 : Fin 78) (0 : Fin 78) (46 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0590` (kalmanson). -/
theorem directSource_h0590 :
    ((!((rankAtom (directSourceRanks P) 3 == rankAtom (directSourceRanks P) 8)) || ((rankAtom (directSourceRanks P) 14).ult (rankAtom (directSourceRanks P) 19)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (19 : Fin 78) (3 : Fin 78)
    (14 : Fin 78) (8 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (4 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (14 : Fin 78) (8 : Fin 78) (3 : Fin 78)
    (19 : Fin 78) (0 : Fin 78) (46 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0591` (kalmanson). -/
theorem directSource_h0591 :
    ((!((rankAtom (directSourceRanks P) 3 == rankAtom (directSourceRanks P) 47)) || ((rankAtom (directSourceRanks P) 0).ult (rankAtom (directSourceRanks P) 20)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (20 : Fin 78) (3 : Fin 78)
    (0 : Fin 78) (47 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (4 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (14 : Fin 78) (9 : Fin 78) (3 : Fin 78)
    (20 : Fin 78) (0 : Fin 78) (47 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0592` (kalmanson). -/
theorem directSource_h0592 :
    ((!((rankAtom (directSourceRanks P) 3 == rankAtom (directSourceRanks P) 9)) || ((rankAtom (directSourceRanks P) 14).ult (rankAtom (directSourceRanks P) 20)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (20 : Fin 78) (3 : Fin 78)
    (14 : Fin 78) (9 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (4 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (14 : Fin 78) (9 : Fin 78) (3 : Fin 78)
    (20 : Fin 78) (0 : Fin 78) (47 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0593` (kalmanson). -/
theorem directSource_h0593 :
    ((!((rankAtom (directSourceRanks P) 3 == rankAtom (directSourceRanks P) 48)) || ((rankAtom (directSourceRanks P) 0).ult (rankAtom (directSourceRanks P) 21)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (21 : Fin 78) (3 : Fin 78)
    (0 : Fin 78) (48 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (4 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (14 : Fin 78) (10 : Fin 78) (3 : Fin 78)
    (21 : Fin 78) (0 : Fin 78) (48 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0594` (kalmanson). -/
theorem directSource_h0594 :
    ((!((rankAtom (directSourceRanks P) 3 == rankAtom (directSourceRanks P) 10)) || ((rankAtom (directSourceRanks P) 14).ult (rankAtom (directSourceRanks P) 21)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (21 : Fin 78) (3 : Fin 78)
    (14 : Fin 78) (10 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (4 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (14 : Fin 78) (10 : Fin 78) (3 : Fin 78)
    (21 : Fin 78) (0 : Fin 78) (48 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0595` (kalmanson). -/
theorem directSource_h0595 :
    ((!((rankAtom (directSourceRanks P) 3 == rankAtom (directSourceRanks P) 49)) || ((rankAtom (directSourceRanks P) 0).ult (rankAtom (directSourceRanks P) 22)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (22 : Fin 78) (3 : Fin 78)
    (0 : Fin 78) (49 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (4 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (14 : Fin 78) (11 : Fin 78) (3 : Fin 78)
    (22 : Fin 78) (0 : Fin 78) (49 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0596` (kalmanson). -/
theorem directSource_h0596 :
    ((!((rankAtom (directSourceRanks P) 3 == rankAtom (directSourceRanks P) 11)) || ((rankAtom (directSourceRanks P) 14).ult (rankAtom (directSourceRanks P) 22)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (22 : Fin 78) (3 : Fin 78)
    (14 : Fin 78) (11 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (4 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (14 : Fin 78) (11 : Fin 78) (3 : Fin 78)
    (22 : Fin 78) (0 : Fin 78) (49 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0597` (kalmanson). -/
theorem directSource_h0597 :
    ((!((rankAtom (directSourceRanks P) 4 == rankAtom (directSourceRanks P) 0)) || ((rankAtom (directSourceRanks P) 50).ult (rankAtom (directSourceRanks P) 16)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (16 : Fin 78) (4 : Fin 78)
    (50 : Fin 78) (0 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (5 : Fin 13) (6 : Fin 13)
    (by decide) (by decide) (by decide)
    (15 : Fin 78) (5 : Fin 78) (4 : Fin 78)
    (16 : Fin 78) (0 : Fin 78) (50 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0598` (kalmanson). -/
theorem directSource_h0598 :
    ((!((rankAtom (directSourceRanks P) 4 == rankAtom (directSourceRanks P) 5)) || ((rankAtom (directSourceRanks P) 15).ult (rankAtom (directSourceRanks P) 16)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (16 : Fin 78) (4 : Fin 78)
    (15 : Fin 78) (5 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (5 : Fin 13) (6 : Fin 13)
    (by decide) (by decide) (by decide)
    (15 : Fin 78) (5 : Fin 78) (4 : Fin 78)
    (16 : Fin 78) (0 : Fin 78) (50 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0599` (kalmanson). -/
theorem directSource_h0599 :
    ((!((rankAtom (directSourceRanks P) 4 == rankAtom (directSourceRanks P) 15)) || ((rankAtom (directSourceRanks P) 5).ult (rankAtom (directSourceRanks P) 16)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (16 : Fin 78) (4 : Fin 78)
    (5 : Fin 78) (15 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (5 : Fin 13) (6 : Fin 13)
    (by decide) (by decide) (by decide)
    (15 : Fin 78) (5 : Fin 78) (4 : Fin 78)
    (16 : Fin 78) (0 : Fin 78) (50 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0600` (kalmanson). -/
theorem directSource_h0600 :
    ((!((rankAtom (directSourceRanks P) 4 == rankAtom (directSourceRanks P) 0)) || ((rankAtom (directSourceRanks P) 51).ult (rankAtom (directSourceRanks P) 17)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (17 : Fin 78) (4 : Fin 78)
    (51 : Fin 78) (0 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (5 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (15 : Fin 78) (6 : Fin 78) (4 : Fin 78)
    (17 : Fin 78) (0 : Fin 78) (51 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0601` (kalmanson). -/
theorem directSource_h0601 :
    ((!((rankAtom (directSourceRanks P) 4 == rankAtom (directSourceRanks P) 6)) || ((rankAtom (directSourceRanks P) 15).ult (rankAtom (directSourceRanks P) 17)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (17 : Fin 78) (4 : Fin 78)
    (15 : Fin 78) (6 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (5 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (15 : Fin 78) (6 : Fin 78) (4 : Fin 78)
    (17 : Fin 78) (0 : Fin 78) (51 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0602` (kalmanson). -/
theorem directSource_h0602 :
    ((!((rankAtom (directSourceRanks P) 4 == rankAtom (directSourceRanks P) 15)) || ((rankAtom (directSourceRanks P) 6).ult (rankAtom (directSourceRanks P) 17)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (17 : Fin 78) (4 : Fin 78)
    (6 : Fin 78) (15 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (5 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (15 : Fin 78) (6 : Fin 78) (4 : Fin 78)
    (17 : Fin 78) (0 : Fin 78) (51 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0603` (kalmanson). -/
theorem directSource_h0603 :
    ((!((rankAtom (directSourceRanks P) 4 == rankAtom (directSourceRanks P) 0)) || ((rankAtom (directSourceRanks P) 52).ult (rankAtom (directSourceRanks P) 18)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (18 : Fin 78) (4 : Fin 78)
    (52 : Fin 78) (0 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (5 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (15 : Fin 78) (7 : Fin 78) (4 : Fin 78)
    (18 : Fin 78) (0 : Fin 78) (52 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0604` (kalmanson). -/
theorem directSource_h0604 :
    ((!((rankAtom (directSourceRanks P) 4 == rankAtom (directSourceRanks P) 7)) || ((rankAtom (directSourceRanks P) 15).ult (rankAtom (directSourceRanks P) 18)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (18 : Fin 78) (4 : Fin 78)
    (15 : Fin 78) (7 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (5 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (15 : Fin 78) (7 : Fin 78) (4 : Fin 78)
    (18 : Fin 78) (0 : Fin 78) (52 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0605` (kalmanson). -/
theorem directSource_h0605 :
    ((!((rankAtom (directSourceRanks P) 18 == rankAtom (directSourceRanks P) 7)) || ((rankAtom (directSourceRanks P) 15).ult (rankAtom (directSourceRanks P) 4)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (4 : Fin 78) (18 : Fin 78)
    (15 : Fin 78) (7 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (5 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (15 : Fin 78) (7 : Fin 78) (4 : Fin 78)
    (18 : Fin 78) (0 : Fin 78) (52 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0606` (kalmanson). -/
theorem directSource_h0606 :
    ((!((rankAtom (directSourceRanks P) 4 == rankAtom (directSourceRanks P) 0)) || ((rankAtom (directSourceRanks P) 53).ult (rankAtom (directSourceRanks P) 19)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (19 : Fin 78) (4 : Fin 78)
    (53 : Fin 78) (0 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (5 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (15 : Fin 78) (8 : Fin 78) (4 : Fin 78)
    (19 : Fin 78) (0 : Fin 78) (53 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0607` (kalmanson). -/
theorem directSource_h0607 :
    ((!((rankAtom (directSourceRanks P) 4 == rankAtom (directSourceRanks P) 8)) || ((rankAtom (directSourceRanks P) 15).ult (rankAtom (directSourceRanks P) 19)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (19 : Fin 78) (4 : Fin 78)
    (15 : Fin 78) (8 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (5 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (15 : Fin 78) (8 : Fin 78) (4 : Fin 78)
    (19 : Fin 78) (0 : Fin 78) (53 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0608` (kalmanson). -/
theorem directSource_h0608 :
    ((!((rankAtom (directSourceRanks P) 4 == rankAtom (directSourceRanks P) 0)) || ((rankAtom (directSourceRanks P) 54).ult (rankAtom (directSourceRanks P) 20)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (20 : Fin 78) (4 : Fin 78)
    (54 : Fin 78) (0 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (5 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (15 : Fin 78) (9 : Fin 78) (4 : Fin 78)
    (20 : Fin 78) (0 : Fin 78) (54 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0609` (kalmanson). -/
theorem directSource_h0609 :
    ((!((rankAtom (directSourceRanks P) 4 == rankAtom (directSourceRanks P) 9)) || ((rankAtom (directSourceRanks P) 15).ult (rankAtom (directSourceRanks P) 20)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (20 : Fin 78) (4 : Fin 78)
    (15 : Fin 78) (9 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (5 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (15 : Fin 78) (9 : Fin 78) (4 : Fin 78)
    (20 : Fin 78) (0 : Fin 78) (54 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0610` (kalmanson). -/
theorem directSource_h0610 :
    ((!((rankAtom (directSourceRanks P) 4 == rankAtom (directSourceRanks P) 0)) || ((rankAtom (directSourceRanks P) 55).ult (rankAtom (directSourceRanks P) 21)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (21 : Fin 78) (4 : Fin 78)
    (55 : Fin 78) (0 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (5 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (15 : Fin 78) (10 : Fin 78) (4 : Fin 78)
    (21 : Fin 78) (0 : Fin 78) (55 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0611` (kalmanson). -/
theorem directSource_h0611 :
    ((!((rankAtom (directSourceRanks P) 4 == rankAtom (directSourceRanks P) 10)) || ((rankAtom (directSourceRanks P) 15).ult (rankAtom (directSourceRanks P) 21)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (21 : Fin 78) (4 : Fin 78)
    (15 : Fin 78) (10 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (5 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (15 : Fin 78) (10 : Fin 78) (4 : Fin 78)
    (21 : Fin 78) (0 : Fin 78) (55 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0612` (kalmanson). -/
theorem directSource_h0612 :
    ((!((rankAtom (directSourceRanks P) 4 == rankAtom (directSourceRanks P) 0)) || ((rankAtom (directSourceRanks P) 56).ult (rankAtom (directSourceRanks P) 22)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (22 : Fin 78) (4 : Fin 78)
    (56 : Fin 78) (0 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (5 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (15 : Fin 78) (11 : Fin 78) (4 : Fin 78)
    (22 : Fin 78) (0 : Fin 78) (56 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0613` (kalmanson). -/
theorem directSource_h0613 :
    ((!((rankAtom (directSourceRanks P) 4 == rankAtom (directSourceRanks P) 11)) || ((rankAtom (directSourceRanks P) 15).ult (rankAtom (directSourceRanks P) 22)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (22 : Fin 78) (4 : Fin 78)
    (15 : Fin 78) (11 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (5 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (15 : Fin 78) (11 : Fin 78) (4 : Fin 78)
    (22 : Fin 78) (0 : Fin 78) (56 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0614` (kalmanson). -/
theorem directSource_h0614 :
    ((!((rankAtom (directSourceRanks P) 5 == rankAtom (directSourceRanks P) 6)) || ((rankAtom (directSourceRanks P) 16).ult (rankAtom (directSourceRanks P) 17)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (17 : Fin 78) (5 : Fin 78)
    (16 : Fin 78) (6 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (6 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (16 : Fin 78) (6 : Fin 78) (5 : Fin 78)
    (17 : Fin 78) (0 : Fin 78) (57 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0615` (kalmanson). -/
theorem directSource_h0615 :
    ((!((rankAtom (directSourceRanks P) 5 == rankAtom (directSourceRanks P) 0)) || ((rankAtom (directSourceRanks P) 58).ult (rankAtom (directSourceRanks P) 18)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (18 : Fin 78) (5 : Fin 78)
    (58 : Fin 78) (0 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (6 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (16 : Fin 78) (7 : Fin 78) (5 : Fin 78)
    (18 : Fin 78) (0 : Fin 78) (58 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0616` (kalmanson). -/
theorem directSource_h0616 :
    ((!((rankAtom (directSourceRanks P) 5 == rankAtom (directSourceRanks P) 7)) || ((rankAtom (directSourceRanks P) 16).ult (rankAtom (directSourceRanks P) 18)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (18 : Fin 78) (5 : Fin 78)
    (16 : Fin 78) (7 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (6 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (16 : Fin 78) (7 : Fin 78) (5 : Fin 78)
    (18 : Fin 78) (0 : Fin 78) (58 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0617` (kalmanson). -/
theorem directSource_h0617 :
    ((!((rankAtom (directSourceRanks P) 5 == rankAtom (directSourceRanks P) 16)) || ((rankAtom (directSourceRanks P) 7).ult (rankAtom (directSourceRanks P) 18)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (18 : Fin 78) (5 : Fin 78)
    (7 : Fin 78) (16 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (6 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (16 : Fin 78) (7 : Fin 78) (5 : Fin 78)
    (18 : Fin 78) (0 : Fin 78) (58 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0618` (kalmanson). -/
theorem directSource_h0618 :
    ((!((rankAtom (directSourceRanks P) 18 == rankAtom (directSourceRanks P) 7)) || ((rankAtom (directSourceRanks P) 16).ult (rankAtom (directSourceRanks P) 5)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (5 : Fin 78) (18 : Fin 78)
    (16 : Fin 78) (7 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (6 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (16 : Fin 78) (7 : Fin 78) (5 : Fin 78)
    (18 : Fin 78) (0 : Fin 78) (58 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0619` (kalmanson). -/
theorem directSource_h0619 :
    ((!((rankAtom (directSourceRanks P) 5 == rankAtom (directSourceRanks P) 0)) || ((rankAtom (directSourceRanks P) 59).ult (rankAtom (directSourceRanks P) 19)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (19 : Fin 78) (5 : Fin 78)
    (59 : Fin 78) (0 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (6 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (16 : Fin 78) (8 : Fin 78) (5 : Fin 78)
    (19 : Fin 78) (0 : Fin 78) (59 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0620` (kalmanson). -/
theorem directSource_h0620 :
    ((!((rankAtom (directSourceRanks P) 5 == rankAtom (directSourceRanks P) 8)) || ((rankAtom (directSourceRanks P) 16).ult (rankAtom (directSourceRanks P) 19)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (19 : Fin 78) (5 : Fin 78)
    (16 : Fin 78) (8 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (6 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (16 : Fin 78) (8 : Fin 78) (5 : Fin 78)
    (19 : Fin 78) (0 : Fin 78) (59 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0621` (kalmanson). -/
theorem directSource_h0621 :
    ((!((rankAtom (directSourceRanks P) 5 == rankAtom (directSourceRanks P) 0)) || ((rankAtom (directSourceRanks P) 60).ult (rankAtom (directSourceRanks P) 20)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (20 : Fin 78) (5 : Fin 78)
    (60 : Fin 78) (0 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (6 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (16 : Fin 78) (9 : Fin 78) (5 : Fin 78)
    (20 : Fin 78) (0 : Fin 78) (60 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0622` (kalmanson). -/
theorem directSource_h0622 :
    ((!((rankAtom (directSourceRanks P) 5 == rankAtom (directSourceRanks P) 9)) || ((rankAtom (directSourceRanks P) 16).ult (rankAtom (directSourceRanks P) 20)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (20 : Fin 78) (5 : Fin 78)
    (16 : Fin 78) (9 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (6 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (16 : Fin 78) (9 : Fin 78) (5 : Fin 78)
    (20 : Fin 78) (0 : Fin 78) (60 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0623` (kalmanson). -/
theorem directSource_h0623 :
    ((!((rankAtom (directSourceRanks P) 5 == rankAtom (directSourceRanks P) 0)) || ((rankAtom (directSourceRanks P) 61).ult (rankAtom (directSourceRanks P) 21)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (21 : Fin 78) (5 : Fin 78)
    (61 : Fin 78) (0 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (6 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (16 : Fin 78) (10 : Fin 78) (5 : Fin 78)
    (21 : Fin 78) (0 : Fin 78) (61 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0624` (kalmanson). -/
theorem directSource_h0624 :
    ((!((rankAtom (directSourceRanks P) 5 == rankAtom (directSourceRanks P) 10)) || ((rankAtom (directSourceRanks P) 16).ult (rankAtom (directSourceRanks P) 21)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (21 : Fin 78) (5 : Fin 78)
    (16 : Fin 78) (10 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (6 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (16 : Fin 78) (10 : Fin 78) (5 : Fin 78)
    (21 : Fin 78) (0 : Fin 78) (61 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0625` (kalmanson). -/
theorem directSource_h0625 :
    ((!((rankAtom (directSourceRanks P) 5 == rankAtom (directSourceRanks P) 0)) || ((rankAtom (directSourceRanks P) 62).ult (rankAtom (directSourceRanks P) 22)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (22 : Fin 78) (5 : Fin 78)
    (62 : Fin 78) (0 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (6 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (16 : Fin 78) (11 : Fin 78) (5 : Fin 78)
    (22 : Fin 78) (0 : Fin 78) (62 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0626` (kalmanson). -/
theorem directSource_h0626 :
    ((!((rankAtom (directSourceRanks P) 5 == rankAtom (directSourceRanks P) 62)) || ((rankAtom (directSourceRanks P) 0).ult (rankAtom (directSourceRanks P) 22)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (22 : Fin 78) (5 : Fin 78)
    (0 : Fin 78) (62 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (6 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (16 : Fin 78) (11 : Fin 78) (5 : Fin 78)
    (22 : Fin 78) (0 : Fin 78) (62 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0627` (kalmanson). -/
theorem directSource_h0627 :
    ((!((rankAtom (directSourceRanks P) 5 == rankAtom (directSourceRanks P) 11)) || ((rankAtom (directSourceRanks P) 16).ult (rankAtom (directSourceRanks P) 22)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (22 : Fin 78) (5 : Fin 78)
    (16 : Fin 78) (11 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (6 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (16 : Fin 78) (11 : Fin 78) (5 : Fin 78)
    (22 : Fin 78) (0 : Fin 78) (62 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0628` (kalmanson). -/
theorem directSource_h0628 :
    ((!((rankAtom (directSourceRanks P) 6 == rankAtom (directSourceRanks P) 7)) || ((rankAtom (directSourceRanks P) 17).ult (rankAtom (directSourceRanks P) 18)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (18 : Fin 78) (6 : Fin 78)
    (17 : Fin 78) (7 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (7 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (17 : Fin 78) (7 : Fin 78) (6 : Fin 78)
    (18 : Fin 78) (0 : Fin 78) (63 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0629` (kalmanson). -/
theorem directSource_h0629 :
    ((!((rankAtom (directSourceRanks P) 18 == rankAtom (directSourceRanks P) 7)) || ((rankAtom (directSourceRanks P) 17).ult (rankAtom (directSourceRanks P) 6)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (6 : Fin 78) (18 : Fin 78)
    (17 : Fin 78) (7 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (7 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (17 : Fin 78) (7 : Fin 78) (6 : Fin 78)
    (18 : Fin 78) (0 : Fin 78) (63 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0630` (kalmanson). -/
theorem directSource_h0630 :
    ((!((rankAtom (directSourceRanks P) 6 == rankAtom (directSourceRanks P) 8)) || ((rankAtom (directSourceRanks P) 17).ult (rankAtom (directSourceRanks P) 19)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (19 : Fin 78) (6 : Fin 78)
    (17 : Fin 78) (8 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (7 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (17 : Fin 78) (8 : Fin 78) (6 : Fin 78)
    (19 : Fin 78) (0 : Fin 78) (64 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0631` (kalmanson). -/
theorem directSource_h0631 :
    ((!((rankAtom (directSourceRanks P) 6 == rankAtom (directSourceRanks P) 0)) || ((rankAtom (directSourceRanks P) 65).ult (rankAtom (directSourceRanks P) 20)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (20 : Fin 78) (6 : Fin 78)
    (65 : Fin 78) (0 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (7 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (17 : Fin 78) (9 : Fin 78) (6 : Fin 78)
    (20 : Fin 78) (0 : Fin 78) (65 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0632` (kalmanson). -/
theorem directSource_h0632 :
    ((!((rankAtom (directSourceRanks P) 6 == rankAtom (directSourceRanks P) 9)) || ((rankAtom (directSourceRanks P) 17).ult (rankAtom (directSourceRanks P) 20)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (20 : Fin 78) (6 : Fin 78)
    (17 : Fin 78) (9 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (7 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (17 : Fin 78) (9 : Fin 78) (6 : Fin 78)
    (20 : Fin 78) (0 : Fin 78) (65 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0633` (kalmanson). -/
theorem directSource_h0633 :
    ((!((rankAtom (directSourceRanks P) 6 == rankAtom (directSourceRanks P) 0)) || ((rankAtom (directSourceRanks P) 66).ult (rankAtom (directSourceRanks P) 21)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (21 : Fin 78) (6 : Fin 78)
    (66 : Fin 78) (0 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (7 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (17 : Fin 78) (10 : Fin 78) (6 : Fin 78)
    (21 : Fin 78) (0 : Fin 78) (66 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0634` (kalmanson). -/
theorem directSource_h0634 :
    ((!((rankAtom (directSourceRanks P) 6 == rankAtom (directSourceRanks P) 10)) || ((rankAtom (directSourceRanks P) 17).ult (rankAtom (directSourceRanks P) 21)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (21 : Fin 78) (6 : Fin 78)
    (17 : Fin 78) (10 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (7 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (17 : Fin 78) (10 : Fin 78) (6 : Fin 78)
    (21 : Fin 78) (0 : Fin 78) (66 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0635` (kalmanson). -/
theorem directSource_h0635 :
    ((!((rankAtom (directSourceRanks P) 6 == rankAtom (directSourceRanks P) 0)) || ((rankAtom (directSourceRanks P) 67).ult (rankAtom (directSourceRanks P) 22)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (22 : Fin 78) (6 : Fin 78)
    (67 : Fin 78) (0 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (7 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (17 : Fin 78) (11 : Fin 78) (6 : Fin 78)
    (22 : Fin 78) (0 : Fin 78) (67 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0636` (kalmanson). -/
theorem directSource_h0636 :
    ((!((rankAtom (directSourceRanks P) 6 == rankAtom (directSourceRanks P) 11)) || ((rankAtom (directSourceRanks P) 17).ult (rankAtom (directSourceRanks P) 22)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (22 : Fin 78) (6 : Fin 78)
    (17 : Fin 78) (11 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (7 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (17 : Fin 78) (11 : Fin 78) (6 : Fin 78)
    (22 : Fin 78) (0 : Fin 78) (67 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0637` (kalmanson). -/
theorem directSource_h0637 :
    ((!((rankAtom (directSourceRanks P) 7 == rankAtom (directSourceRanks P) 18)) || ((rankAtom (directSourceRanks P) 8).ult (rankAtom (directSourceRanks P) 19)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (19 : Fin 78) (7 : Fin 78)
    (8 : Fin 78) (18 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (8 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (18 : Fin 78) (8 : Fin 78) (7 : Fin 78)
    (19 : Fin 78) (0 : Fin 78) (68 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0638` (kalmanson). -/
theorem directSource_h0638 :
    ((!((rankAtom (directSourceRanks P) 7 == rankAtom (directSourceRanks P) 18)) || ((rankAtom (directSourceRanks P) 9).ult (rankAtom (directSourceRanks P) 20)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (20 : Fin 78) (7 : Fin 78)
    (9 : Fin 78) (18 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (8 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (18 : Fin 78) (9 : Fin 78) (7 : Fin 78)
    (20 : Fin 78) (0 : Fin 78) (69 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0639` (kalmanson). -/
theorem directSource_h0639 :
    ((!((rankAtom (directSourceRanks P) 7 == rankAtom (directSourceRanks P) 18)) || ((rankAtom (directSourceRanks P) 10).ult (rankAtom (directSourceRanks P) 21)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (21 : Fin 78) (7 : Fin 78)
    (10 : Fin 78) (18 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (8 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (18 : Fin 78) (10 : Fin 78) (7 : Fin 78)
    (21 : Fin 78) (0 : Fin 78) (70 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

end

end ATailExactFiveCard13CnfIngressScratch
end Problem97
