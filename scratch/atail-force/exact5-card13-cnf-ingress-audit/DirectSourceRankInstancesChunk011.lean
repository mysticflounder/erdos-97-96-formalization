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

/-- Exact pass-5 source assertion `h0704` (kalmanson). -/
theorem directSource_h0704 :
    ((!((rankAtom (directSourceRanks P) 28 == rankAtom (directSourceRanks P) 58)) || ((rankAtom (directSourceRanks P) 1).ult (rankAtom (directSourceRanks P) 5)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (5 : Fin 78) (28 : Fin 78)
    (1 : Fin 78) (58 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (6 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (26 : Fin 78) (7 : Fin 78) (5 : Fin 78)
    (28 : Fin 78) (1 : Fin 78) (58 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0705` (kalmanson). -/
theorem directSource_h0705 :
    ((!((rankAtom (directSourceRanks P) 5 == rankAtom (directSourceRanks P) 7)) || ((rankAtom (directSourceRanks P) 26).ult (rankAtom (directSourceRanks P) 28)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (28 : Fin 78) (5 : Fin 78)
    (26 : Fin 78) (7 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (6 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (26 : Fin 78) (7 : Fin 78) (5 : Fin 78)
    (28 : Fin 78) (1 : Fin 78) (58 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0706` (kalmanson). -/
theorem directSource_h0706 :
    ((!((rankAtom (directSourceRanks P) 5 == rankAtom (directSourceRanks P) 26)) || ((rankAtom (directSourceRanks P) 7).ult (rankAtom (directSourceRanks P) 28)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (28 : Fin 78) (5 : Fin 78)
    (7 : Fin 78) (26 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (6 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (26 : Fin 78) (7 : Fin 78) (5 : Fin 78)
    (28 : Fin 78) (1 : Fin 78) (58 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0707` (kalmanson). -/
theorem directSource_h0707 :
    ((!((rankAtom (directSourceRanks P) 28 == rankAtom (directSourceRanks P) 7)) || ((rankAtom (directSourceRanks P) 26).ult (rankAtom (directSourceRanks P) 5)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (5 : Fin 78) (28 : Fin 78)
    (26 : Fin 78) (7 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (6 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (26 : Fin 78) (7 : Fin 78) (5 : Fin 78)
    (28 : Fin 78) (1 : Fin 78) (58 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0708` (kalmanson). -/
theorem directSource_h0708 :
    ((!((rankAtom (directSourceRanks P) 28 == rankAtom (directSourceRanks P) 26)) || ((rankAtom (directSourceRanks P) 7).ult (rankAtom (directSourceRanks P) 5)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (5 : Fin 78) (28 : Fin 78)
    (7 : Fin 78) (26 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (6 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (26 : Fin 78) (7 : Fin 78) (5 : Fin 78)
    (28 : Fin 78) (1 : Fin 78) (58 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0709` (kalmanson). -/
theorem directSource_h0709 :
    ((!((rankAtom (directSourceRanks P) 5 == rankAtom (directSourceRanks P) 1)) || ((rankAtom (directSourceRanks P) 59).ult (rankAtom (directSourceRanks P) 29)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (29 : Fin 78) (5 : Fin 78)
    (59 : Fin 78) (1 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (6 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (26 : Fin 78) (8 : Fin 78) (5 : Fin 78)
    (29 : Fin 78) (1 : Fin 78) (59 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0710` (kalmanson). -/
theorem directSource_h0710 :
    ((!((rankAtom (directSourceRanks P) 5 == rankAtom (directSourceRanks P) 59)) || ((rankAtom (directSourceRanks P) 1).ult (rankAtom (directSourceRanks P) 29)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (29 : Fin 78) (5 : Fin 78)
    (1 : Fin 78) (59 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (6 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (26 : Fin 78) (8 : Fin 78) (5 : Fin 78)
    (29 : Fin 78) (1 : Fin 78) (59 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0711` (kalmanson). -/
theorem directSource_h0711 :
    ((!((rankAtom (directSourceRanks P) 5 == rankAtom (directSourceRanks P) 8)) || ((rankAtom (directSourceRanks P) 26).ult (rankAtom (directSourceRanks P) 29)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (29 : Fin 78) (5 : Fin 78)
    (26 : Fin 78) (8 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (6 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (26 : Fin 78) (8 : Fin 78) (5 : Fin 78)
    (29 : Fin 78) (1 : Fin 78) (59 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0712` (kalmanson). -/
theorem directSource_h0712 :
    ((!((rankAtom (directSourceRanks P) 5 == rankAtom (directSourceRanks P) 1)) || ((rankAtom (directSourceRanks P) 60).ult (rankAtom (directSourceRanks P) 30)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (30 : Fin 78) (5 : Fin 78)
    (60 : Fin 78) (1 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (6 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (26 : Fin 78) (9 : Fin 78) (5 : Fin 78)
    (30 : Fin 78) (1 : Fin 78) (60 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0713` (kalmanson). -/
theorem directSource_h0713 :
    ((!((rankAtom (directSourceRanks P) 5 == rankAtom (directSourceRanks P) 60)) || ((rankAtom (directSourceRanks P) 1).ult (rankAtom (directSourceRanks P) 30)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (30 : Fin 78) (5 : Fin 78)
    (1 : Fin 78) (60 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (6 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (26 : Fin 78) (9 : Fin 78) (5 : Fin 78)
    (30 : Fin 78) (1 : Fin 78) (60 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0714` (kalmanson). -/
theorem directSource_h0714 :
    ((!((rankAtom (directSourceRanks P) 5 == rankAtom (directSourceRanks P) 9)) || ((rankAtom (directSourceRanks P) 26).ult (rankAtom (directSourceRanks P) 30)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (30 : Fin 78) (5 : Fin 78)
    (26 : Fin 78) (9 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (6 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (26 : Fin 78) (9 : Fin 78) (5 : Fin 78)
    (30 : Fin 78) (1 : Fin 78) (60 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0715` (kalmanson). -/
theorem directSource_h0715 :
    ((!((rankAtom (directSourceRanks P) 5 == rankAtom (directSourceRanks P) 1)) || ((rankAtom (directSourceRanks P) 61).ult (rankAtom (directSourceRanks P) 31)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (31 : Fin 78) (5 : Fin 78)
    (61 : Fin 78) (1 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (6 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (26 : Fin 78) (10 : Fin 78) (5 : Fin 78)
    (31 : Fin 78) (1 : Fin 78) (61 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0716` (kalmanson). -/
theorem directSource_h0716 :
    ((!((rankAtom (directSourceRanks P) 5 == rankAtom (directSourceRanks P) 61)) || ((rankAtom (directSourceRanks P) 1).ult (rankAtom (directSourceRanks P) 31)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (31 : Fin 78) (5 : Fin 78)
    (1 : Fin 78) (61 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (6 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (26 : Fin 78) (10 : Fin 78) (5 : Fin 78)
    (31 : Fin 78) (1 : Fin 78) (61 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0717` (kalmanson). -/
theorem directSource_h0717 :
    ((!((rankAtom (directSourceRanks P) 5 == rankAtom (directSourceRanks P) 10)) || ((rankAtom (directSourceRanks P) 26).ult (rankAtom (directSourceRanks P) 31)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (31 : Fin 78) (5 : Fin 78)
    (26 : Fin 78) (10 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (6 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (26 : Fin 78) (10 : Fin 78) (5 : Fin 78)
    (31 : Fin 78) (1 : Fin 78) (61 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0718` (kalmanson). -/
theorem directSource_h0718 :
    ((!((rankAtom (directSourceRanks P) 5 == rankAtom (directSourceRanks P) 1)) || ((rankAtom (directSourceRanks P) 62).ult (rankAtom (directSourceRanks P) 32)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (32 : Fin 78) (5 : Fin 78)
    (62 : Fin 78) (1 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (6 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (26 : Fin 78) (11 : Fin 78) (5 : Fin 78)
    (32 : Fin 78) (1 : Fin 78) (62 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0719` (kalmanson). -/
theorem directSource_h0719 :
    ((!((rankAtom (directSourceRanks P) 5 == rankAtom (directSourceRanks P) 62)) || ((rankAtom (directSourceRanks P) 1).ult (rankAtom (directSourceRanks P) 32)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (32 : Fin 78) (5 : Fin 78)
    (1 : Fin 78) (62 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (6 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (26 : Fin 78) (11 : Fin 78) (5 : Fin 78)
    (32 : Fin 78) (1 : Fin 78) (62 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0720` (kalmanson). -/
theorem directSource_h0720 :
    ((!((rankAtom (directSourceRanks P) 5 == rankAtom (directSourceRanks P) 11)) || ((rankAtom (directSourceRanks P) 26).ult (rankAtom (directSourceRanks P) 32)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (32 : Fin 78) (5 : Fin 78)
    (26 : Fin 78) (11 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (6 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (26 : Fin 78) (11 : Fin 78) (5 : Fin 78)
    (32 : Fin 78) (1 : Fin 78) (62 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0721` (kalmanson). -/
theorem directSource_h0721 :
    ((!((rankAtom (directSourceRanks P) 28 == rankAtom (directSourceRanks P) 63)) || ((rankAtom (directSourceRanks P) 1).ult (rankAtom (directSourceRanks P) 6)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (6 : Fin 78) (28 : Fin 78)
    (1 : Fin 78) (63 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (7 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (27 : Fin 78) (7 : Fin 78) (6 : Fin 78)
    (28 : Fin 78) (1 : Fin 78) (63 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0722` (kalmanson). -/
theorem directSource_h0722 :
    ((!((rankAtom (directSourceRanks P) 6 == rankAtom (directSourceRanks P) 7)) || ((rankAtom (directSourceRanks P) 27).ult (rankAtom (directSourceRanks P) 28)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (28 : Fin 78) (6 : Fin 78)
    (27 : Fin 78) (7 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (7 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (27 : Fin 78) (7 : Fin 78) (6 : Fin 78)
    (28 : Fin 78) (1 : Fin 78) (63 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0723` (kalmanson). -/
theorem directSource_h0723 :
    ((!((rankAtom (directSourceRanks P) 6 == rankAtom (directSourceRanks P) 27)) || ((rankAtom (directSourceRanks P) 7).ult (rankAtom (directSourceRanks P) 28)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (28 : Fin 78) (6 : Fin 78)
    (7 : Fin 78) (27 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (7 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (27 : Fin 78) (7 : Fin 78) (6 : Fin 78)
    (28 : Fin 78) (1 : Fin 78) (63 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0724` (kalmanson). -/
theorem directSource_h0724 :
    ((!((rankAtom (directSourceRanks P) 28 == rankAtom (directSourceRanks P) 7)) || ((rankAtom (directSourceRanks P) 27).ult (rankAtom (directSourceRanks P) 6)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (6 : Fin 78) (28 : Fin 78)
    (27 : Fin 78) (7 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (7 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (27 : Fin 78) (7 : Fin 78) (6 : Fin 78)
    (28 : Fin 78) (1 : Fin 78) (63 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0725` (kalmanson). -/
theorem directSource_h0725 :
    ((!((rankAtom (directSourceRanks P) 28 == rankAtom (directSourceRanks P) 27)) || ((rankAtom (directSourceRanks P) 7).ult (rankAtom (directSourceRanks P) 6)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (6 : Fin 78) (28 : Fin 78)
    (7 : Fin 78) (27 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (7 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (27 : Fin 78) (7 : Fin 78) (6 : Fin 78)
    (28 : Fin 78) (1 : Fin 78) (63 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0726` (kalmanson). -/
theorem directSource_h0726 :
    ((!((rankAtom (directSourceRanks P) 6 == rankAtom (directSourceRanks P) 8)) || ((rankAtom (directSourceRanks P) 27).ult (rankAtom (directSourceRanks P) 29)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (29 : Fin 78) (6 : Fin 78)
    (27 : Fin 78) (8 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (7 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (27 : Fin 78) (8 : Fin 78) (6 : Fin 78)
    (29 : Fin 78) (1 : Fin 78) (64 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0727` (kalmanson). -/
theorem directSource_h0727 :
    ((!((rankAtom (directSourceRanks P) 6 == rankAtom (directSourceRanks P) 1)) || ((rankAtom (directSourceRanks P) 65).ult (rankAtom (directSourceRanks P) 30)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (30 : Fin 78) (6 : Fin 78)
    (65 : Fin 78) (1 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (7 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (27 : Fin 78) (9 : Fin 78) (6 : Fin 78)
    (30 : Fin 78) (1 : Fin 78) (65 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0728` (kalmanson). -/
theorem directSource_h0728 :
    ((!((rankAtom (directSourceRanks P) 6 == rankAtom (directSourceRanks P) 9)) || ((rankAtom (directSourceRanks P) 27).ult (rankAtom (directSourceRanks P) 30)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (30 : Fin 78) (6 : Fin 78)
    (27 : Fin 78) (9 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (7 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (27 : Fin 78) (9 : Fin 78) (6 : Fin 78)
    (30 : Fin 78) (1 : Fin 78) (65 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0729` (kalmanson). -/
theorem directSource_h0729 :
    ((!((rankAtom (directSourceRanks P) 6 == rankAtom (directSourceRanks P) 1)) || ((rankAtom (directSourceRanks P) 66).ult (rankAtom (directSourceRanks P) 31)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (31 : Fin 78) (6 : Fin 78)
    (66 : Fin 78) (1 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (7 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (27 : Fin 78) (10 : Fin 78) (6 : Fin 78)
    (31 : Fin 78) (1 : Fin 78) (66 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0730` (kalmanson). -/
theorem directSource_h0730 :
    ((!((rankAtom (directSourceRanks P) 6 == rankAtom (directSourceRanks P) 10)) || ((rankAtom (directSourceRanks P) 27).ult (rankAtom (directSourceRanks P) 31)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (31 : Fin 78) (6 : Fin 78)
    (27 : Fin 78) (10 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (7 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (27 : Fin 78) (10 : Fin 78) (6 : Fin 78)
    (31 : Fin 78) (1 : Fin 78) (66 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0731` (kalmanson). -/
theorem directSource_h0731 :
    ((!((rankAtom (directSourceRanks P) 6 == rankAtom (directSourceRanks P) 1)) || ((rankAtom (directSourceRanks P) 67).ult (rankAtom (directSourceRanks P) 32)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (32 : Fin 78) (6 : Fin 78)
    (67 : Fin 78) (1 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (7 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (27 : Fin 78) (11 : Fin 78) (6 : Fin 78)
    (32 : Fin 78) (1 : Fin 78) (67 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0732` (kalmanson). -/
theorem directSource_h0732 :
    ((!((rankAtom (directSourceRanks P) 6 == rankAtom (directSourceRanks P) 11)) || ((rankAtom (directSourceRanks P) 27).ult (rankAtom (directSourceRanks P) 32)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (32 : Fin 78) (6 : Fin 78)
    (27 : Fin 78) (11 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (7 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (27 : Fin 78) (11 : Fin 78) (6 : Fin 78)
    (32 : Fin 78) (1 : Fin 78) (67 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0733` (kalmanson). -/
theorem directSource_h0733 :
    ((!((rankAtom (directSourceRanks P) 7 == rankAtom (directSourceRanks P) 28)) || ((rankAtom (directSourceRanks P) 8).ult (rankAtom (directSourceRanks P) 29)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (29 : Fin 78) (7 : Fin 78)
    (8 : Fin 78) (28 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (8 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (28 : Fin 78) (8 : Fin 78) (7 : Fin 78)
    (29 : Fin 78) (1 : Fin 78) (68 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0734` (kalmanson). -/
theorem directSource_h0734 :
    ((!((rankAtom (directSourceRanks P) 7 == rankAtom (directSourceRanks P) 28)) || ((rankAtom (directSourceRanks P) 9).ult (rankAtom (directSourceRanks P) 30)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (30 : Fin 78) (7 : Fin 78)
    (9 : Fin 78) (28 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (8 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (28 : Fin 78) (9 : Fin 78) (7 : Fin 78)
    (30 : Fin 78) (1 : Fin 78) (69 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0735` (kalmanson). -/
theorem directSource_h0735 :
    ((!((rankAtom (directSourceRanks P) 7 == rankAtom (directSourceRanks P) 28)) || ((rankAtom (directSourceRanks P) 10).ult (rankAtom (directSourceRanks P) 31)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (31 : Fin 78) (7 : Fin 78)
    (10 : Fin 78) (28 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (8 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (28 : Fin 78) (10 : Fin 78) (7 : Fin 78)
    (31 : Fin 78) (1 : Fin 78) (70 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0736` (kalmanson). -/
theorem directSource_h0736 :
    ((!((rankAtom (directSourceRanks P) 7 == rankAtom (directSourceRanks P) 28)) || ((rankAtom (directSourceRanks P) 11).ult (rankAtom (directSourceRanks P) 32)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (32 : Fin 78) (7 : Fin 78)
    (11 : Fin 78) (28 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (8 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (28 : Fin 78) (11 : Fin 78) (7 : Fin 78)
    (32 : Fin 78) (1 : Fin 78) (71 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0737` (kalmanson). -/
theorem directSource_h0737 :
    ((!((rankAtom (directSourceRanks P) 3 == rankAtom (directSourceRanks P) 42)) || ((rankAtom (directSourceRanks P) 2).ult (rankAtom (directSourceRanks P) 34)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (34 : Fin 78) (3 : Fin 78)
    (2 : Fin 78) (42 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (4 : Fin 13) (5 : Fin 13)
    (by decide) (by decide) (by decide)
    (33 : Fin 78) (4 : Fin 78) (3 : Fin 78)
    (34 : Fin 78) (2 : Fin 78) (42 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0738` (kalmanson). -/
theorem directSource_h0738 :
    ((!((rankAtom (directSourceRanks P) 34 == rankAtom (directSourceRanks P) 42)) || ((rankAtom (directSourceRanks P) 2).ult (rankAtom (directSourceRanks P) 3)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (3 : Fin 78) (34 : Fin 78)
    (2 : Fin 78) (42 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (4 : Fin 13) (5 : Fin 13)
    (by decide) (by decide) (by decide)
    (33 : Fin 78) (4 : Fin 78) (3 : Fin 78)
    (34 : Fin 78) (2 : Fin 78) (42 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0739` (kalmanson). -/
theorem directSource_h0739 :
    ((!((rankAtom (directSourceRanks P) 3 == rankAtom (directSourceRanks P) 4)) || ((rankAtom (directSourceRanks P) 33).ult (rankAtom (directSourceRanks P) 34)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (34 : Fin 78) (3 : Fin 78)
    (33 : Fin 78) (4 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (4 : Fin 13) (5 : Fin 13)
    (by decide) (by decide) (by decide)
    (33 : Fin 78) (4 : Fin 78) (3 : Fin 78)
    (34 : Fin 78) (2 : Fin 78) (42 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0740` (kalmanson). -/
theorem directSource_h0740 :
    ((!((rankAtom (directSourceRanks P) 3 == rankAtom (directSourceRanks P) 43)) || ((rankAtom (directSourceRanks P) 2).ult (rankAtom (directSourceRanks P) 35)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (35 : Fin 78) (3 : Fin 78)
    (2 : Fin 78) (43 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (4 : Fin 13) (6 : Fin 13)
    (by decide) (by decide) (by decide)
    (33 : Fin 78) (5 : Fin 78) (3 : Fin 78)
    (35 : Fin 78) (2 : Fin 78) (43 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0741` (kalmanson). -/
theorem directSource_h0741 :
    ((!((rankAtom (directSourceRanks P) 35 == rankAtom (directSourceRanks P) 43)) || ((rankAtom (directSourceRanks P) 2).ult (rankAtom (directSourceRanks P) 3)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (3 : Fin 78) (35 : Fin 78)
    (2 : Fin 78) (43 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (4 : Fin 13) (6 : Fin 13)
    (by decide) (by decide) (by decide)
    (33 : Fin 78) (5 : Fin 78) (3 : Fin 78)
    (35 : Fin 78) (2 : Fin 78) (43 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0742` (kalmanson). -/
theorem directSource_h0742 :
    ((!((rankAtom (directSourceRanks P) 3 == rankAtom (directSourceRanks P) 5)) || ((rankAtom (directSourceRanks P) 33).ult (rankAtom (directSourceRanks P) 35)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (35 : Fin 78) (3 : Fin 78)
    (33 : Fin 78) (5 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (4 : Fin 13) (6 : Fin 13)
    (by decide) (by decide) (by decide)
    (33 : Fin 78) (5 : Fin 78) (3 : Fin 78)
    (35 : Fin 78) (2 : Fin 78) (43 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0743` (kalmanson). -/
theorem directSource_h0743 :
    ((!((rankAtom (directSourceRanks P) 3 == rankAtom (directSourceRanks P) 6)) || ((rankAtom (directSourceRanks P) 33).ult (rankAtom (directSourceRanks P) 36)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (36 : Fin 78) (3 : Fin 78)
    (33 : Fin 78) (6 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (4 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (33 : Fin 78) (6 : Fin 78) (3 : Fin 78)
    (36 : Fin 78) (2 : Fin 78) (44 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0744` (kalmanson). -/
theorem directSource_h0744 :
    ((!((rankAtom (directSourceRanks P) 3 == rankAtom (directSourceRanks P) 33)) || ((rankAtom (directSourceRanks P) 6).ult (rankAtom (directSourceRanks P) 36)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (36 : Fin 78) (3 : Fin 78)
    (6 : Fin 78) (33 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (4 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (33 : Fin 78) (6 : Fin 78) (3 : Fin 78)
    (36 : Fin 78) (2 : Fin 78) (44 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0745` (kalmanson). -/
theorem directSource_h0745 :
    ((!((rankAtom (directSourceRanks P) 3 == rankAtom (directSourceRanks P) 45)) || ((rankAtom (directSourceRanks P) 2).ult (rankAtom (directSourceRanks P) 37)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (37 : Fin 78) (3 : Fin 78)
    (2 : Fin 78) (45 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (4 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (33 : Fin 78) (7 : Fin 78) (3 : Fin 78)
    (37 : Fin 78) (2 : Fin 78) (45 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0746` (kalmanson). -/
theorem directSource_h0746 :
    ((!((rankAtom (directSourceRanks P) 37 == rankAtom (directSourceRanks P) 45)) || ((rankAtom (directSourceRanks P) 2).ult (rankAtom (directSourceRanks P) 3)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (3 : Fin 78) (37 : Fin 78)
    (2 : Fin 78) (45 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (4 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (33 : Fin 78) (7 : Fin 78) (3 : Fin 78)
    (37 : Fin 78) (2 : Fin 78) (45 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0747` (kalmanson). -/
theorem directSource_h0747 :
    ((!((rankAtom (directSourceRanks P) 37 == rankAtom (directSourceRanks P) 7)) || ((rankAtom (directSourceRanks P) 33).ult (rankAtom (directSourceRanks P) 3)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (3 : Fin 78) (37 : Fin 78)
    (33 : Fin 78) (7 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (4 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (33 : Fin 78) (7 : Fin 78) (3 : Fin 78)
    (37 : Fin 78) (2 : Fin 78) (45 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0748` (kalmanson). -/
theorem directSource_h0748 :
    ((!((rankAtom (directSourceRanks P) 3 == rankAtom (directSourceRanks P) 46)) || ((rankAtom (directSourceRanks P) 2).ult (rankAtom (directSourceRanks P) 38)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (38 : Fin 78) (3 : Fin 78)
    (2 : Fin 78) (46 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (4 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (33 : Fin 78) (8 : Fin 78) (3 : Fin 78)
    (38 : Fin 78) (2 : Fin 78) (46 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0749` (kalmanson). -/
theorem directSource_h0749 :
    ((!((rankAtom (directSourceRanks P) 3 == rankAtom (directSourceRanks P) 47)) || ((rankAtom (directSourceRanks P) 2).ult (rankAtom (directSourceRanks P) 39)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (39 : Fin 78) (3 : Fin 78)
    (2 : Fin 78) (47 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (4 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (33 : Fin 78) (9 : Fin 78) (3 : Fin 78)
    (39 : Fin 78) (2 : Fin 78) (47 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0750` (kalmanson). -/
theorem directSource_h0750 :
    ((!((rankAtom (directSourceRanks P) 3 == rankAtom (directSourceRanks P) 48)) || ((rankAtom (directSourceRanks P) 2).ult (rankAtom (directSourceRanks P) 40)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (40 : Fin 78) (3 : Fin 78)
    (2 : Fin 78) (48 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (4 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (33 : Fin 78) (10 : Fin 78) (3 : Fin 78)
    (40 : Fin 78) (2 : Fin 78) (48 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0751` (kalmanson). -/
theorem directSource_h0751 :
    ((!((rankAtom (directSourceRanks P) 3 == rankAtom (directSourceRanks P) 49)) || ((rankAtom (directSourceRanks P) 2).ult (rankAtom (directSourceRanks P) 41)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (41 : Fin 78) (3 : Fin 78)
    (2 : Fin 78) (49 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (4 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (33 : Fin 78) (11 : Fin 78) (3 : Fin 78)
    (41 : Fin 78) (2 : Fin 78) (49 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0752` (kalmanson). -/
theorem directSource_h0752 :
    ((!((rankAtom (directSourceRanks P) 4 == rankAtom (directSourceRanks P) 2)) || ((rankAtom (directSourceRanks P) 50).ult (rankAtom (directSourceRanks P) 35)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (35 : Fin 78) (4 : Fin 78)
    (50 : Fin 78) (2 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (5 : Fin 13) (6 : Fin 13)
    (by decide) (by decide) (by decide)
    (34 : Fin 78) (5 : Fin 78) (4 : Fin 78)
    (35 : Fin 78) (2 : Fin 78) (50 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0753` (kalmanson). -/
theorem directSource_h0753 :
    ((!((rankAtom (directSourceRanks P) 4 == rankAtom (directSourceRanks P) 50)) || ((rankAtom (directSourceRanks P) 2).ult (rankAtom (directSourceRanks P) 35)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (35 : Fin 78) (4 : Fin 78)
    (2 : Fin 78) (50 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (5 : Fin 13) (6 : Fin 13)
    (by decide) (by decide) (by decide)
    (34 : Fin 78) (5 : Fin 78) (4 : Fin 78)
    (35 : Fin 78) (2 : Fin 78) (50 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0754` (kalmanson). -/
theorem directSource_h0754 :
    ((!((rankAtom (directSourceRanks P) 35 == rankAtom (directSourceRanks P) 50)) || ((rankAtom (directSourceRanks P) 2).ult (rankAtom (directSourceRanks P) 4)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (4 : Fin 78) (35 : Fin 78)
    (2 : Fin 78) (50 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (5 : Fin 13) (6 : Fin 13)
    (by decide) (by decide) (by decide)
    (34 : Fin 78) (5 : Fin 78) (4 : Fin 78)
    (35 : Fin 78) (2 : Fin 78) (50 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0755` (kalmanson). -/
theorem directSource_h0755 :
    ((!((rankAtom (directSourceRanks P) 4 == rankAtom (directSourceRanks P) 5)) || ((rankAtom (directSourceRanks P) 34).ult (rankAtom (directSourceRanks P) 35)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (35 : Fin 78) (4 : Fin 78)
    (34 : Fin 78) (5 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (5 : Fin 13) (6 : Fin 13)
    (by decide) (by decide) (by decide)
    (34 : Fin 78) (5 : Fin 78) (4 : Fin 78)
    (35 : Fin 78) (2 : Fin 78) (50 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0756` (kalmanson). -/
theorem directSource_h0756 :
    ((!((rankAtom (directSourceRanks P) 4 == rankAtom (directSourceRanks P) 34)) || ((rankAtom (directSourceRanks P) 5).ult (rankAtom (directSourceRanks P) 35)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (35 : Fin 78) (4 : Fin 78)
    (5 : Fin 78) (34 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (5 : Fin 13) (6 : Fin 13)
    (by decide) (by decide) (by decide)
    (34 : Fin 78) (5 : Fin 78) (4 : Fin 78)
    (35 : Fin 78) (2 : Fin 78) (50 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0757` (kalmanson). -/
theorem directSource_h0757 :
    ((!((rankAtom (directSourceRanks P) 35 == rankAtom (directSourceRanks P) 34)) || ((rankAtom (directSourceRanks P) 5).ult (rankAtom (directSourceRanks P) 4)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (4 : Fin 78) (35 : Fin 78)
    (5 : Fin 78) (34 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (5 : Fin 13) (6 : Fin 13)
    (by decide) (by decide) (by decide)
    (34 : Fin 78) (5 : Fin 78) (4 : Fin 78)
    (35 : Fin 78) (2 : Fin 78) (50 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0758` (kalmanson). -/
theorem directSource_h0758 :
    ((!((rankAtom (directSourceRanks P) 4 == rankAtom (directSourceRanks P) 2)) || ((rankAtom (directSourceRanks P) 51).ult (rankAtom (directSourceRanks P) 36)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (36 : Fin 78) (4 : Fin 78)
    (51 : Fin 78) (2 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (5 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (34 : Fin 78) (6 : Fin 78) (4 : Fin 78)
    (36 : Fin 78) (2 : Fin 78) (51 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0759` (kalmanson). -/
theorem directSource_h0759 :
    ((!((rankAtom (directSourceRanks P) 4 == rankAtom (directSourceRanks P) 51)) || ((rankAtom (directSourceRanks P) 2).ult (rankAtom (directSourceRanks P) 36)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (36 : Fin 78) (4 : Fin 78)
    (2 : Fin 78) (51 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (5 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (34 : Fin 78) (6 : Fin 78) (4 : Fin 78)
    (36 : Fin 78) (2 : Fin 78) (51 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0760` (kalmanson). -/
theorem directSource_h0760 :
    ((!((rankAtom (directSourceRanks P) 4 == rankAtom (directSourceRanks P) 6)) || ((rankAtom (directSourceRanks P) 34).ult (rankAtom (directSourceRanks P) 36)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (36 : Fin 78) (4 : Fin 78)
    (34 : Fin 78) (6 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (5 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (34 : Fin 78) (6 : Fin 78) (4 : Fin 78)
    (36 : Fin 78) (2 : Fin 78) (51 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0761` (kalmanson). -/
theorem directSource_h0761 :
    ((!((rankAtom (directSourceRanks P) 4 == rankAtom (directSourceRanks P) 34)) || ((rankAtom (directSourceRanks P) 6).ult (rankAtom (directSourceRanks P) 36)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (36 : Fin 78) (4 : Fin 78)
    (6 : Fin 78) (34 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (5 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (34 : Fin 78) (6 : Fin 78) (4 : Fin 78)
    (36 : Fin 78) (2 : Fin 78) (51 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0762` (kalmanson). -/
theorem directSource_h0762 :
    ((!((rankAtom (directSourceRanks P) 4 == rankAtom (directSourceRanks P) 2)) || ((rankAtom (directSourceRanks P) 52).ult (rankAtom (directSourceRanks P) 37)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (37 : Fin 78) (4 : Fin 78)
    (52 : Fin 78) (2 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (5 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (34 : Fin 78) (7 : Fin 78) (4 : Fin 78)
    (37 : Fin 78) (2 : Fin 78) (52 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0763` (kalmanson). -/
theorem directSource_h0763 :
    ((!((rankAtom (directSourceRanks P) 4 == rankAtom (directSourceRanks P) 52)) || ((rankAtom (directSourceRanks P) 2).ult (rankAtom (directSourceRanks P) 37)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (37 : Fin 78) (4 : Fin 78)
    (2 : Fin 78) (52 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (5 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (34 : Fin 78) (7 : Fin 78) (4 : Fin 78)
    (37 : Fin 78) (2 : Fin 78) (52 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0764` (kalmanson). -/
theorem directSource_h0764 :
    ((!((rankAtom (directSourceRanks P) 37 == rankAtom (directSourceRanks P) 52)) || ((rankAtom (directSourceRanks P) 2).ult (rankAtom (directSourceRanks P) 4)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (4 : Fin 78) (37 : Fin 78)
    (2 : Fin 78) (52 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (5 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (34 : Fin 78) (7 : Fin 78) (4 : Fin 78)
    (37 : Fin 78) (2 : Fin 78) (52 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0765` (kalmanson). -/
theorem directSource_h0765 :
    ((!((rankAtom (directSourceRanks P) 4 == rankAtom (directSourceRanks P) 7)) || ((rankAtom (directSourceRanks P) 34).ult (rankAtom (directSourceRanks P) 37)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (37 : Fin 78) (4 : Fin 78)
    (34 : Fin 78) (7 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (5 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (34 : Fin 78) (7 : Fin 78) (4 : Fin 78)
    (37 : Fin 78) (2 : Fin 78) (52 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0766` (kalmanson). -/
theorem directSource_h0766 :
    ((!((rankAtom (directSourceRanks P) 4 == rankAtom (directSourceRanks P) 34)) || ((rankAtom (directSourceRanks P) 7).ult (rankAtom (directSourceRanks P) 37)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (37 : Fin 78) (4 : Fin 78)
    (7 : Fin 78) (34 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (5 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (34 : Fin 78) (7 : Fin 78) (4 : Fin 78)
    (37 : Fin 78) (2 : Fin 78) (52 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0767` (kalmanson). -/
theorem directSource_h0767 :
    ((!((rankAtom (directSourceRanks P) 37 == rankAtom (directSourceRanks P) 7)) || ((rankAtom (directSourceRanks P) 34).ult (rankAtom (directSourceRanks P) 4)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (4 : Fin 78) (37 : Fin 78)
    (34 : Fin 78) (7 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (5 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (34 : Fin 78) (7 : Fin 78) (4 : Fin 78)
    (37 : Fin 78) (2 : Fin 78) (52 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

end

end ATailExactFiveCard13CnfIngressScratch
end Problem97
