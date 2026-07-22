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

/-- Exact pass-5 source assertion `h0960` (kalmanson). -/
theorem directSource_h0960 :
    ((!((rankAtom (directSourceRanks P) 6 == rankAtom (directSourceRanks P) 51)) || ((rankAtom (directSourceRanks P) 8).ult (rankAtom (directSourceRanks P) 53)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (53 : Fin 78) (6 : Fin 78)
    (8 : Fin 78) (51 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (5 : Fin 13) (7 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (51 : Fin 78) (8 : Fin 78) (6 : Fin 78)
    (53 : Fin 78) (4 : Fin 78) (64 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0961` (kalmanson). -/
theorem directSource_h0961 :
    ((!((rankAtom (directSourceRanks P) 6 == rankAtom (directSourceRanks P) 4)) || ((rankAtom (directSourceRanks P) 65).ult (rankAtom (directSourceRanks P) 54)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (54 : Fin 78) (6 : Fin 78)
    (65 : Fin 78) (4 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (5 : Fin 13) (7 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (51 : Fin 78) (9 : Fin 78) (6 : Fin 78)
    (54 : Fin 78) (4 : Fin 78) (65 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0962` (kalmanson). -/
theorem directSource_h0962 :
    ((!((rankAtom (directSourceRanks P) 54 == rankAtom (directSourceRanks P) 4)) || ((rankAtom (directSourceRanks P) 65).ult (rankAtom (directSourceRanks P) 6)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (6 : Fin 78) (54 : Fin 78)
    (65 : Fin 78) (4 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (5 : Fin 13) (7 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (51 : Fin 78) (9 : Fin 78) (6 : Fin 78)
    (54 : Fin 78) (4 : Fin 78) (65 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0963` (kalmanson). -/
theorem directSource_h0963 :
    ((!((rankAtom (directSourceRanks P) 6 == rankAtom (directSourceRanks P) 9)) || ((rankAtom (directSourceRanks P) 51).ult (rankAtom (directSourceRanks P) 54)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (54 : Fin 78) (6 : Fin 78)
    (51 : Fin 78) (9 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (5 : Fin 13) (7 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (51 : Fin 78) (9 : Fin 78) (6 : Fin 78)
    (54 : Fin 78) (4 : Fin 78) (65 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0964` (kalmanson). -/
theorem directSource_h0964 :
    ((!((rankAtom (directSourceRanks P) 6 == rankAtom (directSourceRanks P) 4)) || ((rankAtom (directSourceRanks P) 66).ult (rankAtom (directSourceRanks P) 55)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (55 : Fin 78) (6 : Fin 78)
    (66 : Fin 78) (4 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (5 : Fin 13) (7 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (51 : Fin 78) (10 : Fin 78) (6 : Fin 78)
    (55 : Fin 78) (4 : Fin 78) (66 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0965` (kalmanson). -/
theorem directSource_h0965 :
    ((!((rankAtom (directSourceRanks P) 6 == rankAtom (directSourceRanks P) 10)) || ((rankAtom (directSourceRanks P) 51).ult (rankAtom (directSourceRanks P) 55)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (55 : Fin 78) (6 : Fin 78)
    (51 : Fin 78) (10 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (5 : Fin 13) (7 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (51 : Fin 78) (10 : Fin 78) (6 : Fin 78)
    (55 : Fin 78) (4 : Fin 78) (66 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0966` (kalmanson). -/
theorem directSource_h0966 :
    ((!((rankAtom (directSourceRanks P) 6 == rankAtom (directSourceRanks P) 4)) || ((rankAtom (directSourceRanks P) 67).ult (rankAtom (directSourceRanks P) 56)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (56 : Fin 78) (6 : Fin 78)
    (67 : Fin 78) (4 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (5 : Fin 13) (7 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (51 : Fin 78) (11 : Fin 78) (6 : Fin 78)
    (56 : Fin 78) (4 : Fin 78) (67 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0967` (kalmanson). -/
theorem directSource_h0967 :
    ((!((rankAtom (directSourceRanks P) 56 == rankAtom (directSourceRanks P) 4)) || ((rankAtom (directSourceRanks P) 67).ult (rankAtom (directSourceRanks P) 6)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (6 : Fin 78) (56 : Fin 78)
    (67 : Fin 78) (4 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (5 : Fin 13) (7 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (51 : Fin 78) (11 : Fin 78) (6 : Fin 78)
    (56 : Fin 78) (4 : Fin 78) (67 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0968` (kalmanson). -/
theorem directSource_h0968 :
    ((!((rankAtom (directSourceRanks P) 6 == rankAtom (directSourceRanks P) 11)) || ((rankAtom (directSourceRanks P) 51).ult (rankAtom (directSourceRanks P) 56)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (56 : Fin 78) (6 : Fin 78)
    (51 : Fin 78) (11 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (5 : Fin 13) (7 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (51 : Fin 78) (11 : Fin 78) (6 : Fin 78)
    (56 : Fin 78) (4 : Fin 78) (67 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0969` (kalmanson). -/
theorem directSource_h0969 :
    ((!((rankAtom (directSourceRanks P) 7 == rankAtom (directSourceRanks P) 4)) || ((rankAtom (directSourceRanks P) 68).ult (rankAtom (directSourceRanks P) 53)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (53 : Fin 78) (7 : Fin 78)
    (68 : Fin 78) (4 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (5 : Fin 13) (8 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (52 : Fin 78) (8 : Fin 78) (7 : Fin 78)
    (53 : Fin 78) (4 : Fin 78) (68 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0970` (kalmanson). -/
theorem directSource_h0970 :
    ((!((rankAtom (directSourceRanks P) 7 == rankAtom (directSourceRanks P) 52)) || ((rankAtom (directSourceRanks P) 8).ult (rankAtom (directSourceRanks P) 53)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (53 : Fin 78) (7 : Fin 78)
    (8 : Fin 78) (52 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (5 : Fin 13) (8 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (52 : Fin 78) (8 : Fin 78) (7 : Fin 78)
    (53 : Fin 78) (4 : Fin 78) (68 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0971` (kalmanson). -/
theorem directSource_h0971 :
    ((!((rankAtom (directSourceRanks P) 7 == rankAtom (directSourceRanks P) 4)) || ((rankAtom (directSourceRanks P) 71).ult (rankAtom (directSourceRanks P) 56)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (56 : Fin 78) (7 : Fin 78)
    (71 : Fin 78) (4 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (5 : Fin 13) (8 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (52 : Fin 78) (11 : Fin 78) (7 : Fin 78)
    (56 : Fin 78) (4 : Fin 78) (71 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0972` (kalmanson). -/
theorem directSource_h0972 :
    ((!((rankAtom (directSourceRanks P) 6 == rankAtom (directSourceRanks P) 5)) || ((rankAtom (directSourceRanks P) 63).ult (rankAtom (directSourceRanks P) 58)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (58 : Fin 78) (6 : Fin 78)
    (63 : Fin 78) (5 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (6 : Fin 13) (7 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (7 : Fin 78) (6 : Fin 78)
    (58 : Fin 78) (5 : Fin 78) (63 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0973` (kalmanson). -/
theorem directSource_h0973 :
    ((!((rankAtom (directSourceRanks P) 6 == rankAtom (directSourceRanks P) 63)) || ((rankAtom (directSourceRanks P) 5).ult (rankAtom (directSourceRanks P) 58)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (58 : Fin 78) (6 : Fin 78)
    (5 : Fin 78) (63 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (6 : Fin 13) (7 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (7 : Fin 78) (6 : Fin 78)
    (58 : Fin 78) (5 : Fin 78) (63 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0974` (kalmanson). -/
theorem directSource_h0974 :
    ((!((rankAtom (directSourceRanks P) 58 == rankAtom (directSourceRanks P) 5)) || ((rankAtom (directSourceRanks P) 63).ult (rankAtom (directSourceRanks P) 6)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (6 : Fin 78) (58 : Fin 78)
    (63 : Fin 78) (5 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (6 : Fin 13) (7 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (7 : Fin 78) (6 : Fin 78)
    (58 : Fin 78) (5 : Fin 78) (63 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0975` (kalmanson). -/
theorem directSource_h0975 :
    ((!((rankAtom (directSourceRanks P) 6 == rankAtom (directSourceRanks P) 7)) || ((rankAtom (directSourceRanks P) 57).ult (rankAtom (directSourceRanks P) 58)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (58 : Fin 78) (6 : Fin 78)
    (57 : Fin 78) (7 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (6 : Fin 13) (7 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (7 : Fin 78) (6 : Fin 78)
    (58 : Fin 78) (5 : Fin 78) (63 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0976` (kalmanson). -/
theorem directSource_h0976 :
    ((!((rankAtom (directSourceRanks P) 6 == rankAtom (directSourceRanks P) 57)) || ((rankAtom (directSourceRanks P) 7).ult (rankAtom (directSourceRanks P) 58)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (58 : Fin 78) (6 : Fin 78)
    (7 : Fin 78) (57 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (6 : Fin 13) (7 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (7 : Fin 78) (6 : Fin 78)
    (58 : Fin 78) (5 : Fin 78) (63 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0977` (kalmanson). -/
theorem directSource_h0977 :
    ((!((rankAtom (directSourceRanks P) 58 == rankAtom (directSourceRanks P) 7)) || ((rankAtom (directSourceRanks P) 57).ult (rankAtom (directSourceRanks P) 6)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (6 : Fin 78) (58 : Fin 78)
    (57 : Fin 78) (7 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (6 : Fin 13) (7 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (7 : Fin 78) (6 : Fin 78)
    (58 : Fin 78) (5 : Fin 78) (63 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0978` (kalmanson). -/
theorem directSource_h0978 :
    ((!((rankAtom (directSourceRanks P) 58 == rankAtom (directSourceRanks P) 57)) || ((rankAtom (directSourceRanks P) 7).ult (rankAtom (directSourceRanks P) 6)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (6 : Fin 78) (58 : Fin 78)
    (7 : Fin 78) (57 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (6 : Fin 13) (7 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (7 : Fin 78) (6 : Fin 78)
    (58 : Fin 78) (5 : Fin 78) (63 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0979` (kalmanson). -/
theorem directSource_h0979 :
    ((!((rankAtom (directSourceRanks P) 6 == rankAtom (directSourceRanks P) 5)) || ((rankAtom (directSourceRanks P) 64).ult (rankAtom (directSourceRanks P) 59)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (59 : Fin 78) (6 : Fin 78)
    (64 : Fin 78) (5 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (6 : Fin 13) (7 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (8 : Fin 78) (6 : Fin 78)
    (59 : Fin 78) (5 : Fin 78) (64 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0980` (kalmanson). -/
theorem directSource_h0980 :
    ((!((rankAtom (directSourceRanks P) 6 == rankAtom (directSourceRanks P) 8)) || ((rankAtom (directSourceRanks P) 57).ult (rankAtom (directSourceRanks P) 59)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (59 : Fin 78) (6 : Fin 78)
    (57 : Fin 78) (8 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (6 : Fin 13) (7 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (8 : Fin 78) (6 : Fin 78)
    (59 : Fin 78) (5 : Fin 78) (64 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0981` (kalmanson). -/
theorem directSource_h0981 :
    ((!((rankAtom (directSourceRanks P) 6 == rankAtom (directSourceRanks P) 57)) || ((rankAtom (directSourceRanks P) 8).ult (rankAtom (directSourceRanks P) 59)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (59 : Fin 78) (6 : Fin 78)
    (8 : Fin 78) (57 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (6 : Fin 13) (7 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (8 : Fin 78) (6 : Fin 78)
    (59 : Fin 78) (5 : Fin 78) (64 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0982` (kalmanson). -/
theorem directSource_h0982 :
    ((!((rankAtom (directSourceRanks P) 6 == rankAtom (directSourceRanks P) 5)) || ((rankAtom (directSourceRanks P) 65).ult (rankAtom (directSourceRanks P) 60)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (60 : Fin 78) (6 : Fin 78)
    (65 : Fin 78) (5 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (6 : Fin 13) (7 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (9 : Fin 78) (6 : Fin 78)
    (60 : Fin 78) (5 : Fin 78) (65 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0983` (kalmanson). -/
theorem directSource_h0983 :
    ((!((rankAtom (directSourceRanks P) 6 == rankAtom (directSourceRanks P) 9)) || ((rankAtom (directSourceRanks P) 57).ult (rankAtom (directSourceRanks P) 60)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (60 : Fin 78) (6 : Fin 78)
    (57 : Fin 78) (9 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (6 : Fin 13) (7 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (9 : Fin 78) (6 : Fin 78)
    (60 : Fin 78) (5 : Fin 78) (65 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0984` (kalmanson). -/
theorem directSource_h0984 :
    ((!((rankAtom (directSourceRanks P) 6 == rankAtom (directSourceRanks P) 57)) || ((rankAtom (directSourceRanks P) 9).ult (rankAtom (directSourceRanks P) 60)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (60 : Fin 78) (6 : Fin 78)
    (9 : Fin 78) (57 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (6 : Fin 13) (7 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (9 : Fin 78) (6 : Fin 78)
    (60 : Fin 78) (5 : Fin 78) (65 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0985` (kalmanson). -/
theorem directSource_h0985 :
    ((!((rankAtom (directSourceRanks P) 6 == rankAtom (directSourceRanks P) 5)) || ((rankAtom (directSourceRanks P) 66).ult (rankAtom (directSourceRanks P) 61)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (61 : Fin 78) (6 : Fin 78)
    (66 : Fin 78) (5 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (6 : Fin 13) (7 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (10 : Fin 78) (6 : Fin 78)
    (61 : Fin 78) (5 : Fin 78) (66 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0986` (kalmanson). -/
theorem directSource_h0986 :
    ((!((rankAtom (directSourceRanks P) 61 == rankAtom (directSourceRanks P) 5)) || ((rankAtom (directSourceRanks P) 66).ult (rankAtom (directSourceRanks P) 6)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (6 : Fin 78) (61 : Fin 78)
    (66 : Fin 78) (5 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (6 : Fin 13) (7 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (10 : Fin 78) (6 : Fin 78)
    (61 : Fin 78) (5 : Fin 78) (66 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0987` (kalmanson). -/
theorem directSource_h0987 :
    ((!((rankAtom (directSourceRanks P) 6 == rankAtom (directSourceRanks P) 10)) || ((rankAtom (directSourceRanks P) 57).ult (rankAtom (directSourceRanks P) 61)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (61 : Fin 78) (6 : Fin 78)
    (57 : Fin 78) (10 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (6 : Fin 13) (7 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (10 : Fin 78) (6 : Fin 78)
    (61 : Fin 78) (5 : Fin 78) (66 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0988` (kalmanson). -/
theorem directSource_h0988 :
    ((!((rankAtom (directSourceRanks P) 6 == rankAtom (directSourceRanks P) 5)) || ((rankAtom (directSourceRanks P) 67).ult (rankAtom (directSourceRanks P) 62)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (62 : Fin 78) (6 : Fin 78)
    (67 : Fin 78) (5 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (6 : Fin 13) (7 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (11 : Fin 78) (6 : Fin 78)
    (62 : Fin 78) (5 : Fin 78) (67 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0989` (kalmanson). -/
theorem directSource_h0989 :
    ((!((rankAtom (directSourceRanks P) 62 == rankAtom (directSourceRanks P) 5)) || ((rankAtom (directSourceRanks P) 67).ult (rankAtom (directSourceRanks P) 6)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (6 : Fin 78) (62 : Fin 78)
    (67 : Fin 78) (5 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (6 : Fin 13) (7 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (11 : Fin 78) (6 : Fin 78)
    (62 : Fin 78) (5 : Fin 78) (67 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0990` (kalmanson). -/
theorem directSource_h0990 :
    ((!((rankAtom (directSourceRanks P) 6 == rankAtom (directSourceRanks P) 11)) || ((rankAtom (directSourceRanks P) 57).ult (rankAtom (directSourceRanks P) 62)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (62 : Fin 78) (6 : Fin 78)
    (57 : Fin 78) (11 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (6 : Fin 13) (7 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (11 : Fin 78) (6 : Fin 78)
    (62 : Fin 78) (5 : Fin 78) (67 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0991` (kalmanson). -/
theorem directSource_h0991 :
    ((!((rankAtom (directSourceRanks P) 7 == rankAtom (directSourceRanks P) 5)) || ((rankAtom (directSourceRanks P) 68).ult (rankAtom (directSourceRanks P) 59)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (59 : Fin 78) (7 : Fin 78)
    (68 : Fin 78) (5 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (6 : Fin 13) (8 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (58 : Fin 78) (8 : Fin 78) (7 : Fin 78)
    (59 : Fin 78) (5 : Fin 78) (68 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0992` (kalmanson). -/
theorem directSource_h0992 :
    ((!((rankAtom (directSourceRanks P) 7 == rankAtom (directSourceRanks P) 5)) || ((rankAtom (directSourceRanks P) 69).ult (rankAtom (directSourceRanks P) 60)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (60 : Fin 78) (7 : Fin 78)
    (69 : Fin 78) (5 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (6 : Fin 13) (8 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (58 : Fin 78) (9 : Fin 78) (7 : Fin 78)
    (60 : Fin 78) (5 : Fin 78) (69 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0993` (kalmanson). -/
theorem directSource_h0993 :
    ((!((rankAtom (directSourceRanks P) 7 == rankAtom (directSourceRanks P) 5)) || ((rankAtom (directSourceRanks P) 70).ult (rankAtom (directSourceRanks P) 61)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (61 : Fin 78) (7 : Fin 78)
    (70 : Fin 78) (5 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (6 : Fin 13) (8 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (58 : Fin 78) (10 : Fin 78) (7 : Fin 78)
    (61 : Fin 78) (5 : Fin 78) (70 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0994` (kalmanson). -/
theorem directSource_h0994 :
    ((!((rankAtom (directSourceRanks P) 61 == rankAtom (directSourceRanks P) 58)) || ((rankAtom (directSourceRanks P) 10).ult (rankAtom (directSourceRanks P) 7)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (7 : Fin 78) (61 : Fin 78)
    (10 : Fin 78) (58 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (6 : Fin 13) (8 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (58 : Fin 78) (10 : Fin 78) (7 : Fin 78)
    (61 : Fin 78) (5 : Fin 78) (70 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0995` (kalmanson). -/
theorem directSource_h0995 :
    ((!((rankAtom (directSourceRanks P) 7 == rankAtom (directSourceRanks P) 5)) || ((rankAtom (directSourceRanks P) 71).ult (rankAtom (directSourceRanks P) 62)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (62 : Fin 78) (7 : Fin 78)
    (71 : Fin 78) (5 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (6 : Fin 13) (8 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (58 : Fin 78) (11 : Fin 78) (7 : Fin 78)
    (62 : Fin 78) (5 : Fin 78) (71 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0996` (kalmanson). -/
theorem directSource_h0996 :
    ((!((rankAtom (directSourceRanks P) 62 == rankAtom (directSourceRanks P) 5)) || ((rankAtom (directSourceRanks P) 71).ult (rankAtom (directSourceRanks P) 7)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (7 : Fin 78) (62 : Fin 78)
    (71 : Fin 78) (5 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (6 : Fin 13) (8 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (58 : Fin 78) (11 : Fin 78) (7 : Fin 78)
    (62 : Fin 78) (5 : Fin 78) (71 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0997` (kalmanson). -/
theorem directSource_h0997 :
    ((!((rankAtom (directSourceRanks P) 7 == rankAtom (directSourceRanks P) 6)) || ((rankAtom (directSourceRanks P) 68).ult (rankAtom (directSourceRanks P) 64)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (64 : Fin 78) (7 : Fin 78)
    (68 : Fin 78) (6 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (7 : Fin 13) (8 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (63 : Fin 78) (8 : Fin 78) (7 : Fin 78)
    (64 : Fin 78) (6 : Fin 78) (68 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0998` (kalmanson). -/
theorem directSource_h0998 :
    ((!((rankAtom (directSourceRanks P) 7 == rankAtom (directSourceRanks P) 6)) || ((rankAtom (directSourceRanks P) 70).ult (rankAtom (directSourceRanks P) 66)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (66 : Fin 78) (7 : Fin 78)
    (70 : Fin 78) (6 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (7 : Fin 13) (8 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (63 : Fin 78) (10 : Fin 78) (7 : Fin 78)
    (66 : Fin 78) (6 : Fin 78) (70 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0999` (kalmanson). -/
theorem directSource_h0999 :
    ((!((rankAtom (directSourceRanks P) 7 == rankAtom (directSourceRanks P) 6)) || ((rankAtom (directSourceRanks P) 71).ult (rankAtom (directSourceRanks P) 67)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (67 : Fin 78) (7 : Fin 78)
    (71 : Fin 78) (6 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (7 : Fin 13) (8 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (63 : Fin 78) (11 : Fin 78) (7 : Fin 78)
    (67 : Fin 78) (6 : Fin 78) (71 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1000` (kalmanson). -/
theorem directSource_h1000 :
    ((!((rankAtom (directSourceRanks P) 25 == rankAtom (directSourceRanks P) 12)) || ((rankAtom (directSourceRanks P) 34).ult (rankAtom (directSourceRanks P) 13)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (13 : Fin 78) (25 : Fin 78)
    (34 : Fin 78) (12 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (3 : Fin 13) (5 : Fin 13)
    (by decide) (by decide) (by decide)
    (23 : Fin 78) (15 : Fin 78) (13 : Fin 78)
    (25 : Fin 78) (12 : Fin 78) (34 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1001` (kalmanson). -/
theorem directSource_h1001 :
    ((!((rankAtom (directSourceRanks P) 25 == rankAtom (directSourceRanks P) 23)) || ((rankAtom (directSourceRanks P) 15).ult (rankAtom (directSourceRanks P) 13)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (13 : Fin 78) (25 : Fin 78)
    (15 : Fin 78) (23 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (3 : Fin 13) (5 : Fin 13)
    (by decide) (by decide) (by decide)
    (23 : Fin 78) (15 : Fin 78) (13 : Fin 78)
    (25 : Fin 78) (12 : Fin 78) (34 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1002` (kalmanson). -/
theorem directSource_h1002 :
    ((!((rankAtom (directSourceRanks P) 26 == rankAtom (directSourceRanks P) 12)) || ((rankAtom (directSourceRanks P) 35).ult (rankAtom (directSourceRanks P) 13)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (13 : Fin 78) (26 : Fin 78)
    (35 : Fin 78) (12 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (3 : Fin 13) (6 : Fin 13)
    (by decide) (by decide) (by decide)
    (23 : Fin 78) (16 : Fin 78) (13 : Fin 78)
    (26 : Fin 78) (12 : Fin 78) (35 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1003` (kalmanson). -/
theorem directSource_h1003 :
    ((!((rankAtom (directSourceRanks P) 26 == rankAtom (directSourceRanks P) 23)) || ((rankAtom (directSourceRanks P) 16).ult (rankAtom (directSourceRanks P) 13)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (13 : Fin 78) (26 : Fin 78)
    (16 : Fin 78) (23 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (3 : Fin 13) (6 : Fin 13)
    (by decide) (by decide) (by decide)
    (23 : Fin 78) (16 : Fin 78) (13 : Fin 78)
    (26 : Fin 78) (12 : Fin 78) (35 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1004` (kalmanson). -/
theorem directSource_h1004 :
    ((!((rankAtom (directSourceRanks P) 27 == rankAtom (directSourceRanks P) 12)) || ((rankAtom (directSourceRanks P) 36).ult (rankAtom (directSourceRanks P) 13)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (13 : Fin 78) (27 : Fin 78)
    (36 : Fin 78) (12 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (3 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (23 : Fin 78) (17 : Fin 78) (13 : Fin 78)
    (27 : Fin 78) (12 : Fin 78) (36 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1005` (kalmanson). -/
theorem directSource_h1005 :
    ((!((rankAtom (directSourceRanks P) 27 == rankAtom (directSourceRanks P) 23)) || ((rankAtom (directSourceRanks P) 17).ult (rankAtom (directSourceRanks P) 13)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (13 : Fin 78) (27 : Fin 78)
    (17 : Fin 78) (23 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (3 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (23 : Fin 78) (17 : Fin 78) (13 : Fin 78)
    (27 : Fin 78) (12 : Fin 78) (36 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1006` (kalmanson). -/
theorem directSource_h1006 :
    ((!((rankAtom (directSourceRanks P) 28 == rankAtom (directSourceRanks P) 12)) || ((rankAtom (directSourceRanks P) 37).ult (rankAtom (directSourceRanks P) 13)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (13 : Fin 78) (28 : Fin 78)
    (37 : Fin 78) (12 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (3 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (23 : Fin 78) (18 : Fin 78) (13 : Fin 78)
    (28 : Fin 78) (12 : Fin 78) (37 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1007` (kalmanson). -/
theorem directSource_h1007 :
    ((!((rankAtom (directSourceRanks P) 28 == rankAtom (directSourceRanks P) 37)) || ((rankAtom (directSourceRanks P) 12).ult (rankAtom (directSourceRanks P) 13)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (13 : Fin 78) (28 : Fin 78)
    (12 : Fin 78) (37 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (3 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (23 : Fin 78) (18 : Fin 78) (13 : Fin 78)
    (28 : Fin 78) (12 : Fin 78) (37 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1008` (kalmanson). -/
theorem directSource_h1008 :
    ((!((rankAtom (directSourceRanks P) 28 == rankAtom (directSourceRanks P) 18)) || ((rankAtom (directSourceRanks P) 23).ult (rankAtom (directSourceRanks P) 13)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (13 : Fin 78) (28 : Fin 78)
    (23 : Fin 78) (18 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (3 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (23 : Fin 78) (18 : Fin 78) (13 : Fin 78)
    (28 : Fin 78) (12 : Fin 78) (37 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1009` (kalmanson). -/
theorem directSource_h1009 :
    ((!((rankAtom (directSourceRanks P) 28 == rankAtom (directSourceRanks P) 23)) || ((rankAtom (directSourceRanks P) 18).ult (rankAtom (directSourceRanks P) 13)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (13 : Fin 78) (28 : Fin 78)
    (18 : Fin 78) (23 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (3 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (23 : Fin 78) (18 : Fin 78) (13 : Fin 78)
    (28 : Fin 78) (12 : Fin 78) (37 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1010` (kalmanson). -/
theorem directSource_h1010 :
    ((!((rankAtom (directSourceRanks P) 29 == rankAtom (directSourceRanks P) 12)) || ((rankAtom (directSourceRanks P) 38).ult (rankAtom (directSourceRanks P) 13)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (13 : Fin 78) (29 : Fin 78)
    (38 : Fin 78) (12 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (3 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (23 : Fin 78) (19 : Fin 78) (13 : Fin 78)
    (29 : Fin 78) (12 : Fin 78) (38 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1011` (kalmanson). -/
theorem directSource_h1011 :
    ((!((rankAtom (directSourceRanks P) 30 == rankAtom (directSourceRanks P) 12)) || ((rankAtom (directSourceRanks P) 39).ult (rankAtom (directSourceRanks P) 13)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (13 : Fin 78) (30 : Fin 78)
    (39 : Fin 78) (12 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (3 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (23 : Fin 78) (20 : Fin 78) (13 : Fin 78)
    (30 : Fin 78) (12 : Fin 78) (39 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1012` (kalmanson). -/
theorem directSource_h1012 :
    ((!((rankAtom (directSourceRanks P) 31 == rankAtom (directSourceRanks P) 12)) || ((rankAtom (directSourceRanks P) 40).ult (rankAtom (directSourceRanks P) 13)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (13 : Fin 78) (31 : Fin 78)
    (40 : Fin 78) (12 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (3 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (23 : Fin 78) (21 : Fin 78) (13 : Fin 78)
    (31 : Fin 78) (12 : Fin 78) (40 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1013` (kalmanson). -/
theorem directSource_h1013 :
    ((!((rankAtom (directSourceRanks P) 32 == rankAtom (directSourceRanks P) 12)) || ((rankAtom (directSourceRanks P) 41).ult (rankAtom (directSourceRanks P) 13)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (13 : Fin 78) (32 : Fin 78)
    (41 : Fin 78) (12 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (3 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (23 : Fin 78) (22 : Fin 78) (13 : Fin 78)
    (32 : Fin 78) (12 : Fin 78) (41 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1014` (kalmanson). -/
theorem directSource_h1014 :
    ((!((rankAtom (directSourceRanks P) 25 == rankAtom (directSourceRanks P) 12)) || ((rankAtom (directSourceRanks P) 42).ult (rankAtom (directSourceRanks P) 14)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (14 : Fin 78) (25 : Fin 78)
    (42 : Fin 78) (12 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (4 : Fin 13) (5 : Fin 13)
    (by decide) (by decide) (by decide)
    (24 : Fin 78) (15 : Fin 78) (14 : Fin 78)
    (25 : Fin 78) (12 : Fin 78) (42 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1015` (kalmanson). -/
theorem directSource_h1015 :
    ((!((rankAtom (directSourceRanks P) 25 == rankAtom (directSourceRanks P) 42)) || ((rankAtom (directSourceRanks P) 12).ult (rankAtom (directSourceRanks P) 14)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (14 : Fin 78) (25 : Fin 78)
    (12 : Fin 78) (42 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (4 : Fin 13) (5 : Fin 13)
    (by decide) (by decide) (by decide)
    (24 : Fin 78) (15 : Fin 78) (14 : Fin 78)
    (25 : Fin 78) (12 : Fin 78) (42 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1016` (kalmanson). -/
theorem directSource_h1016 :
    ((!((rankAtom (directSourceRanks P) 26 == rankAtom (directSourceRanks P) 12)) || ((rankAtom (directSourceRanks P) 43).ult (rankAtom (directSourceRanks P) 14)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (14 : Fin 78) (26 : Fin 78)
    (43 : Fin 78) (12 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (4 : Fin 13) (6 : Fin 13)
    (by decide) (by decide) (by decide)
    (24 : Fin 78) (16 : Fin 78) (14 : Fin 78)
    (26 : Fin 78) (12 : Fin 78) (43 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1017` (kalmanson). -/
theorem directSource_h1017 :
    ((!((rankAtom (directSourceRanks P) 26 == rankAtom (directSourceRanks P) 43)) || ((rankAtom (directSourceRanks P) 12).ult (rankAtom (directSourceRanks P) 14)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (14 : Fin 78) (26 : Fin 78)
    (12 : Fin 78) (43 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (4 : Fin 13) (6 : Fin 13)
    (by decide) (by decide) (by decide)
    (24 : Fin 78) (16 : Fin 78) (14 : Fin 78)
    (26 : Fin 78) (12 : Fin 78) (43 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1018` (kalmanson). -/
theorem directSource_h1018 :
    ((!((rankAtom (directSourceRanks P) 27 == rankAtom (directSourceRanks P) 12)) || ((rankAtom (directSourceRanks P) 44).ult (rankAtom (directSourceRanks P) 14)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (14 : Fin 78) (27 : Fin 78)
    (44 : Fin 78) (12 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (4 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (24 : Fin 78) (17 : Fin 78) (14 : Fin 78)
    (27 : Fin 78) (12 : Fin 78) (44 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1019` (kalmanson). -/
theorem directSource_h1019 :
    ((!((rankAtom (directSourceRanks P) 28 == rankAtom (directSourceRanks P) 12)) || ((rankAtom (directSourceRanks P) 45).ult (rankAtom (directSourceRanks P) 14)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (14 : Fin 78) (28 : Fin 78)
    (45 : Fin 78) (12 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (4 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (24 : Fin 78) (18 : Fin 78) (14 : Fin 78)
    (28 : Fin 78) (12 : Fin 78) (45 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1020` (kalmanson). -/
theorem directSource_h1020 :
    ((!((rankAtom (directSourceRanks P) 28 == rankAtom (directSourceRanks P) 45)) || ((rankAtom (directSourceRanks P) 12).ult (rankAtom (directSourceRanks P) 14)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (14 : Fin 78) (28 : Fin 78)
    (12 : Fin 78) (45 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (4 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (24 : Fin 78) (18 : Fin 78) (14 : Fin 78)
    (28 : Fin 78) (12 : Fin 78) (45 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1021` (kalmanson). -/
theorem directSource_h1021 :
    ((!((rankAtom (directSourceRanks P) 28 == rankAtom (directSourceRanks P) 18)) || ((rankAtom (directSourceRanks P) 24).ult (rankAtom (directSourceRanks P) 14)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (14 : Fin 78) (28 : Fin 78)
    (24 : Fin 78) (18 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (4 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (24 : Fin 78) (18 : Fin 78) (14 : Fin 78)
    (28 : Fin 78) (12 : Fin 78) (45 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1022` (kalmanson). -/
theorem directSource_h1022 :
    ((!((rankAtom (directSourceRanks P) 28 == rankAtom (directSourceRanks P) 24)) || ((rankAtom (directSourceRanks P) 18).ult (rankAtom (directSourceRanks P) 14)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (14 : Fin 78) (28 : Fin 78)
    (18 : Fin 78) (24 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (4 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (24 : Fin 78) (18 : Fin 78) (14 : Fin 78)
    (28 : Fin 78) (12 : Fin 78) (45 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1023` (kalmanson). -/
theorem directSource_h1023 :
    ((!((rankAtom (directSourceRanks P) 14 == rankAtom (directSourceRanks P) 46)) || ((rankAtom (directSourceRanks P) 12).ult (rankAtom (directSourceRanks P) 29)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (29 : Fin 78) (14 : Fin 78)
    (12 : Fin 78) (46 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (4 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (24 : Fin 78) (19 : Fin 78) (14 : Fin 78)
    (29 : Fin 78) (12 : Fin 78) (46 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

end

end ATailExactFiveCard13CnfIngressScratch
end Problem97
