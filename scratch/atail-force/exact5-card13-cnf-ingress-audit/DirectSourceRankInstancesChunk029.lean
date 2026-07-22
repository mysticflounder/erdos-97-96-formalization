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

/-- Exact pass-5 source assertion `h1856` (kalmanson). -/
theorem directSource_h1856 :
    ((!((rankAtom (directSourceRanks P) 61 == rankAtom (directSourceRanks P) 50)) || ((rankAtom (directSourceRanks P) 66).ult (rankAtom (directSourceRanks P) 51)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (51 : Fin 78) (61 : Fin 78)
    (66 : Fin 78) (50 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (6 : Fin 13) (7 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (55 : Fin 78) (51 : Fin 78)
    (61 : Fin 78) (50 : Fin 78) (66 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1857` (kalmanson). -/
theorem directSource_h1857 :
    ((!((rankAtom (directSourceRanks P) 51 == rankAtom (directSourceRanks P) 55)) || ((rankAtom (directSourceRanks P) 57).ult (rankAtom (directSourceRanks P) 61)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (61 : Fin 78) (51 : Fin 78)
    (57 : Fin 78) (55 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (6 : Fin 13) (7 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (55 : Fin 78) (51 : Fin 78)
    (61 : Fin 78) (50 : Fin 78) (66 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1858` (kalmanson). -/
theorem directSource_h1858 :
    ((!((rankAtom (directSourceRanks P) 61 == rankAtom (directSourceRanks P) 57)) || ((rankAtom (directSourceRanks P) 55).ult (rankAtom (directSourceRanks P) 51)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (51 : Fin 78) (61 : Fin 78)
    (55 : Fin 78) (57 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (6 : Fin 13) (7 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (55 : Fin 78) (51 : Fin 78)
    (61 : Fin 78) (50 : Fin 78) (66 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1859` (kalmanson). -/
theorem directSource_h1859 :
    ((!((rankAtom (directSourceRanks P) 51 == rankAtom (directSourceRanks P) 50)) || ((rankAtom (directSourceRanks P) 67).ult (rankAtom (directSourceRanks P) 62)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (62 : Fin 78) (51 : Fin 78)
    (67 : Fin 78) (50 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (6 : Fin 13) (7 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (56 : Fin 78) (51 : Fin 78)
    (62 : Fin 78) (50 : Fin 78) (67 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1860` (kalmanson). -/
theorem directSource_h1860 :
    ((!((rankAtom (directSourceRanks P) 62 == rankAtom (directSourceRanks P) 50)) || ((rankAtom (directSourceRanks P) 67).ult (rankAtom (directSourceRanks P) 51)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (51 : Fin 78) (62 : Fin 78)
    (67 : Fin 78) (50 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (6 : Fin 13) (7 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (56 : Fin 78) (51 : Fin 78)
    (62 : Fin 78) (50 : Fin 78) (67 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1861` (kalmanson). -/
theorem directSource_h1861 :
    ((!((rankAtom (directSourceRanks P) 51 == rankAtom (directSourceRanks P) 56)) || ((rankAtom (directSourceRanks P) 57).ult (rankAtom (directSourceRanks P) 62)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (62 : Fin 78) (51 : Fin 78)
    (57 : Fin 78) (56 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (6 : Fin 13) (7 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (56 : Fin 78) (51 : Fin 78)
    (62 : Fin 78) (50 : Fin 78) (67 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1862` (kalmanson). -/
theorem directSource_h1862 :
    ((!((rankAtom (directSourceRanks P) 51 == rankAtom (directSourceRanks P) 57)) || ((rankAtom (directSourceRanks P) 56).ult (rankAtom (directSourceRanks P) 62)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (62 : Fin 78) (51 : Fin 78)
    (56 : Fin 78) (57 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (6 : Fin 13) (7 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (56 : Fin 78) (51 : Fin 78)
    (62 : Fin 78) (50 : Fin 78) (67 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1863` (kalmanson). -/
theorem directSource_h1863 :
    ((!((rankAtom (directSourceRanks P) 62 == rankAtom (directSourceRanks P) 57)) || ((rankAtom (directSourceRanks P) 56).ult (rankAtom (directSourceRanks P) 51)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (51 : Fin 78) (62 : Fin 78)
    (56 : Fin 78) (57 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (6 : Fin 13) (7 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (56 : Fin 78) (51 : Fin 78)
    (62 : Fin 78) (50 : Fin 78) (67 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1864` (kalmanson). -/
theorem directSource_h1864 :
    ((!((rankAtom (directSourceRanks P) 52 == rankAtom (directSourceRanks P) 50)) || ((rankAtom (directSourceRanks P) 68).ult (rankAtom (directSourceRanks P) 59)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (59 : Fin 78) (52 : Fin 78)
    (68 : Fin 78) (50 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (6 : Fin 13) (8 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (58 : Fin 78) (53 : Fin 78) (52 : Fin 78)
    (59 : Fin 78) (50 : Fin 78) (68 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1865` (kalmanson). -/
theorem directSource_h1865 :
    ((!((rankAtom (directSourceRanks P) 52 == rankAtom (directSourceRanks P) 53)) || ((rankAtom (directSourceRanks P) 58).ult (rankAtom (directSourceRanks P) 59)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (59 : Fin 78) (52 : Fin 78)
    (58 : Fin 78) (53 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (6 : Fin 13) (8 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (58 : Fin 78) (53 : Fin 78) (52 : Fin 78)
    (59 : Fin 78) (50 : Fin 78) (68 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1866` (kalmanson). -/
theorem directSource_h1866 :
    ((!((rankAtom (directSourceRanks P) 52 == rankAtom (directSourceRanks P) 58)) || ((rankAtom (directSourceRanks P) 53).ult (rankAtom (directSourceRanks P) 59)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (59 : Fin 78) (52 : Fin 78)
    (53 : Fin 78) (58 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (6 : Fin 13) (8 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (58 : Fin 78) (53 : Fin 78) (52 : Fin 78)
    (59 : Fin 78) (50 : Fin 78) (68 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1867` (kalmanson). -/
theorem directSource_h1867 :
    ((!((rankAtom (directSourceRanks P) 59 == rankAtom (directSourceRanks P) 58)) || ((rankAtom (directSourceRanks P) 53).ult (rankAtom (directSourceRanks P) 52)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (52 : Fin 78) (59 : Fin 78)
    (53 : Fin 78) (58 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (6 : Fin 13) (8 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (58 : Fin 78) (53 : Fin 78) (52 : Fin 78)
    (59 : Fin 78) (50 : Fin 78) (68 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1868` (kalmanson). -/
theorem directSource_h1868 :
    ((!((rankAtom (directSourceRanks P) 52 == rankAtom (directSourceRanks P) 54)) || ((rankAtom (directSourceRanks P) 58).ult (rankAtom (directSourceRanks P) 60)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (60 : Fin 78) (52 : Fin 78)
    (58 : Fin 78) (54 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (6 : Fin 13) (8 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (58 : Fin 78) (54 : Fin 78) (52 : Fin 78)
    (60 : Fin 78) (50 : Fin 78) (69 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1869` (kalmanson). -/
theorem directSource_h1869 :
    ((!((rankAtom (directSourceRanks P) 60 == rankAtom (directSourceRanks P) 58)) || ((rankAtom (directSourceRanks P) 54).ult (rankAtom (directSourceRanks P) 52)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (52 : Fin 78) (60 : Fin 78)
    (54 : Fin 78) (58 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (6 : Fin 13) (8 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (58 : Fin 78) (54 : Fin 78) (52 : Fin 78)
    (60 : Fin 78) (50 : Fin 78) (69 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1870` (kalmanson). -/
theorem directSource_h1870 :
    ((!((rankAtom (directSourceRanks P) 61 == rankAtom (directSourceRanks P) 50)) || ((rankAtom (directSourceRanks P) 70).ult (rankAtom (directSourceRanks P) 52)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (52 : Fin 78) (61 : Fin 78)
    (70 : Fin 78) (50 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (6 : Fin 13) (8 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (58 : Fin 78) (55 : Fin 78) (52 : Fin 78)
    (61 : Fin 78) (50 : Fin 78) (70 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1871` (kalmanson). -/
theorem directSource_h1871 :
    ((!((rankAtom (directSourceRanks P) 52 == rankAtom (directSourceRanks P) 55)) || ((rankAtom (directSourceRanks P) 58).ult (rankAtom (directSourceRanks P) 61)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (61 : Fin 78) (52 : Fin 78)
    (58 : Fin 78) (55 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (6 : Fin 13) (8 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (58 : Fin 78) (55 : Fin 78) (52 : Fin 78)
    (61 : Fin 78) (50 : Fin 78) (70 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1872` (kalmanson). -/
theorem directSource_h1872 :
    ((!((rankAtom (directSourceRanks P) 61 == rankAtom (directSourceRanks P) 58)) || ((rankAtom (directSourceRanks P) 55).ult (rankAtom (directSourceRanks P) 52)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (52 : Fin 78) (61 : Fin 78)
    (55 : Fin 78) (58 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (6 : Fin 13) (8 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (58 : Fin 78) (55 : Fin 78) (52 : Fin 78)
    (61 : Fin 78) (50 : Fin 78) (70 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1873` (kalmanson). -/
theorem directSource_h1873 :
    ((!((rankAtom (directSourceRanks P) 52 == rankAtom (directSourceRanks P) 56)) || ((rankAtom (directSourceRanks P) 58).ult (rankAtom (directSourceRanks P) 62)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (62 : Fin 78) (52 : Fin 78)
    (58 : Fin 78) (56 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (6 : Fin 13) (8 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (58 : Fin 78) (56 : Fin 78) (52 : Fin 78)
    (62 : Fin 78) (50 : Fin 78) (71 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1874` (kalmanson). -/
theorem directSource_h1874 :
    ((!((rankAtom (directSourceRanks P) 52 == rankAtom (directSourceRanks P) 58)) || ((rankAtom (directSourceRanks P) 56).ult (rankAtom (directSourceRanks P) 62)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (62 : Fin 78) (52 : Fin 78)
    (56 : Fin 78) (58 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (6 : Fin 13) (8 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (58 : Fin 78) (56 : Fin 78) (52 : Fin 78)
    (62 : Fin 78) (50 : Fin 78) (71 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1875` (kalmanson). -/
theorem directSource_h1875 :
    ((!((rankAtom (directSourceRanks P) 62 == rankAtom (directSourceRanks P) 58)) || ((rankAtom (directSourceRanks P) 56).ult (rankAtom (directSourceRanks P) 52)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (52 : Fin 78) (62 : Fin 78)
    (56 : Fin 78) (58 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (6 : Fin 13) (8 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (58 : Fin 78) (56 : Fin 78) (52 : Fin 78)
    (62 : Fin 78) (50 : Fin 78) (71 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1876` (kalmanson). -/
theorem directSource_h1876 :
    ((!((rankAtom (directSourceRanks P) 52 == rankAtom (directSourceRanks P) 51)) || ((rankAtom (directSourceRanks P) 68).ult (rankAtom (directSourceRanks P) 64)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (64 : Fin 78) (52 : Fin 78)
    (68 : Fin 78) (51 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (7 : Fin 13) (8 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (63 : Fin 78) (53 : Fin 78) (52 : Fin 78)
    (64 : Fin 78) (51 : Fin 78) (68 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1877` (kalmanson). -/
theorem directSource_h1877 :
    ((!((rankAtom (directSourceRanks P) 52 == rankAtom (directSourceRanks P) 68)) || ((rankAtom (directSourceRanks P) 51).ult (rankAtom (directSourceRanks P) 64)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (64 : Fin 78) (52 : Fin 78)
    (51 : Fin 78) (68 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (7 : Fin 13) (8 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (63 : Fin 78) (53 : Fin 78) (52 : Fin 78)
    (64 : Fin 78) (51 : Fin 78) (68 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1878` (kalmanson). -/
theorem directSource_h1878 :
    ((!((rankAtom (directSourceRanks P) 52 == rankAtom (directSourceRanks P) 53)) || ((rankAtom (directSourceRanks P) 63).ult (rankAtom (directSourceRanks P) 64)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (64 : Fin 78) (52 : Fin 78)
    (63 : Fin 78) (53 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (7 : Fin 13) (8 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (63 : Fin 78) (53 : Fin 78) (52 : Fin 78)
    (64 : Fin 78) (51 : Fin 78) (68 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1879` (kalmanson). -/
theorem directSource_h1879 :
    ((!((rankAtom (directSourceRanks P) 52 == rankAtom (directSourceRanks P) 63)) || ((rankAtom (directSourceRanks P) 53).ult (rankAtom (directSourceRanks P) 64)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (64 : Fin 78) (52 : Fin 78)
    (53 : Fin 78) (63 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (7 : Fin 13) (8 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (63 : Fin 78) (53 : Fin 78) (52 : Fin 78)
    (64 : Fin 78) (51 : Fin 78) (68 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1880` (kalmanson). -/
theorem directSource_h1880 :
    ((!((rankAtom (directSourceRanks P) 52 == rankAtom (directSourceRanks P) 51)) || ((rankAtom (directSourceRanks P) 69).ult (rankAtom (directSourceRanks P) 65)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (65 : Fin 78) (52 : Fin 78)
    (69 : Fin 78) (51 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (7 : Fin 13) (8 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (63 : Fin 78) (54 : Fin 78) (52 : Fin 78)
    (65 : Fin 78) (51 : Fin 78) (69 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1881` (kalmanson). -/
theorem directSource_h1881 :
    ((!((rankAtom (directSourceRanks P) 52 == rankAtom (directSourceRanks P) 69)) || ((rankAtom (directSourceRanks P) 51).ult (rankAtom (directSourceRanks P) 65)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (65 : Fin 78) (52 : Fin 78)
    (51 : Fin 78) (69 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (7 : Fin 13) (8 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (63 : Fin 78) (54 : Fin 78) (52 : Fin 78)
    (65 : Fin 78) (51 : Fin 78) (69 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1882` (kalmanson). -/
theorem directSource_h1882 :
    ((!((rankAtom (directSourceRanks P) 52 == rankAtom (directSourceRanks P) 54)) || ((rankAtom (directSourceRanks P) 63).ult (rankAtom (directSourceRanks P) 65)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (65 : Fin 78) (52 : Fin 78)
    (63 : Fin 78) (54 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (7 : Fin 13) (8 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (63 : Fin 78) (54 : Fin 78) (52 : Fin 78)
    (65 : Fin 78) (51 : Fin 78) (69 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1883` (kalmanson). -/
theorem directSource_h1883 :
    ((!((rankAtom (directSourceRanks P) 52 == rankAtom (directSourceRanks P) 51)) || ((rankAtom (directSourceRanks P) 70).ult (rankAtom (directSourceRanks P) 66)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (66 : Fin 78) (52 : Fin 78)
    (70 : Fin 78) (51 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (7 : Fin 13) (8 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (63 : Fin 78) (55 : Fin 78) (52 : Fin 78)
    (66 : Fin 78) (51 : Fin 78) (70 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1884` (kalmanson). -/
theorem directSource_h1884 :
    ((!((rankAtom (directSourceRanks P) 52 == rankAtom (directSourceRanks P) 70)) || ((rankAtom (directSourceRanks P) 51).ult (rankAtom (directSourceRanks P) 66)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (66 : Fin 78) (52 : Fin 78)
    (51 : Fin 78) (70 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (7 : Fin 13) (8 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (63 : Fin 78) (55 : Fin 78) (52 : Fin 78)
    (66 : Fin 78) (51 : Fin 78) (70 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1885` (kalmanson). -/
theorem directSource_h1885 :
    ((!((rankAtom (directSourceRanks P) 52 == rankAtom (directSourceRanks P) 55)) || ((rankAtom (directSourceRanks P) 63).ult (rankAtom (directSourceRanks P) 66)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (66 : Fin 78) (52 : Fin 78)
    (63 : Fin 78) (55 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (7 : Fin 13) (8 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (63 : Fin 78) (55 : Fin 78) (52 : Fin 78)
    (66 : Fin 78) (51 : Fin 78) (70 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1886` (kalmanson). -/
theorem directSource_h1886 :
    ((!((rankAtom (directSourceRanks P) 52 == rankAtom (directSourceRanks P) 51)) || ((rankAtom (directSourceRanks P) 71).ult (rankAtom (directSourceRanks P) 67)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (67 : Fin 78) (52 : Fin 78)
    (71 : Fin 78) (51 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (7 : Fin 13) (8 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (63 : Fin 78) (56 : Fin 78) (52 : Fin 78)
    (67 : Fin 78) (51 : Fin 78) (71 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1887` (kalmanson). -/
theorem directSource_h1887 :
    ((!((rankAtom (directSourceRanks P) 52 == rankAtom (directSourceRanks P) 71)) || ((rankAtom (directSourceRanks P) 51).ult (rankAtom (directSourceRanks P) 67)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (67 : Fin 78) (52 : Fin 78)
    (51 : Fin 78) (71 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (7 : Fin 13) (8 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (63 : Fin 78) (56 : Fin 78) (52 : Fin 78)
    (67 : Fin 78) (51 : Fin 78) (71 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1888` (kalmanson). -/
theorem directSource_h1888 :
    ((!((rankAtom (directSourceRanks P) 52 == rankAtom (directSourceRanks P) 56)) || ((rankAtom (directSourceRanks P) 63).ult (rankAtom (directSourceRanks P) 67)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (67 : Fin 78) (52 : Fin 78)
    (63 : Fin 78) (56 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (7 : Fin 13) (8 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (63 : Fin 78) (56 : Fin 78) (52 : Fin 78)
    (67 : Fin 78) (51 : Fin 78) (71 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1889` (kalmanson). -/
theorem directSource_h1889 :
    ((!((rankAtom (directSourceRanks P) 52 == rankAtom (directSourceRanks P) 63)) || ((rankAtom (directSourceRanks P) 56).ult (rankAtom (directSourceRanks P) 67)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (67 : Fin 78) (52 : Fin 78)
    (56 : Fin 78) (63 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (7 : Fin 13) (8 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (63 : Fin 78) (56 : Fin 78) (52 : Fin 78)
    (67 : Fin 78) (51 : Fin 78) (71 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1890` (kalmanson). -/
theorem directSource_h1890 :
    ((!((rankAtom (directSourceRanks P) 58 == rankAtom (directSourceRanks P) 57)) || ((rankAtom (directSourceRanks P) 68).ult (rankAtom (directSourceRanks P) 64)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (64 : Fin 78) (58 : Fin 78)
    (68 : Fin 78) (57 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (6 : Fin 13) (7 : Fin 13) (8 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (63 : Fin 78) (59 : Fin 78) (58 : Fin 78)
    (64 : Fin 78) (57 : Fin 78) (68 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1891` (kalmanson). -/
theorem directSource_h1891 :
    ((!((rankAtom (directSourceRanks P) 58 == rankAtom (directSourceRanks P) 59)) || ((rankAtom (directSourceRanks P) 63).ult (rankAtom (directSourceRanks P) 64)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (64 : Fin 78) (58 : Fin 78)
    (63 : Fin 78) (59 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (6 : Fin 13) (7 : Fin 13) (8 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (63 : Fin 78) (59 : Fin 78) (58 : Fin 78)
    (64 : Fin 78) (57 : Fin 78) (68 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1892` (kalmanson). -/
theorem directSource_h1892 :
    ((!((rankAtom (directSourceRanks P) 58 == rankAtom (directSourceRanks P) 57)) || ((rankAtom (directSourceRanks P) 69).ult (rankAtom (directSourceRanks P) 65)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (65 : Fin 78) (58 : Fin 78)
    (69 : Fin 78) (57 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (6 : Fin 13) (7 : Fin 13) (8 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (63 : Fin 78) (60 : Fin 78) (58 : Fin 78)
    (65 : Fin 78) (57 : Fin 78) (69 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1893` (kalmanson). -/
theorem directSource_h1893 :
    ((!((rankAtom (directSourceRanks P) 58 == rankAtom (directSourceRanks P) 60)) || ((rankAtom (directSourceRanks P) 63).ult (rankAtom (directSourceRanks P) 65)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (65 : Fin 78) (58 : Fin 78)
    (63 : Fin 78) (60 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (6 : Fin 13) (7 : Fin 13) (8 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (63 : Fin 78) (60 : Fin 78) (58 : Fin 78)
    (65 : Fin 78) (57 : Fin 78) (69 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1894` (kalmanson). -/
theorem directSource_h1894 :
    ((!((rankAtom (directSourceRanks P) 58 == rankAtom (directSourceRanks P) 57)) || ((rankAtom (directSourceRanks P) 70).ult (rankAtom (directSourceRanks P) 66)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (66 : Fin 78) (58 : Fin 78)
    (70 : Fin 78) (57 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (6 : Fin 13) (7 : Fin 13) (8 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (63 : Fin 78) (61 : Fin 78) (58 : Fin 78)
    (66 : Fin 78) (57 : Fin 78) (70 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1895` (kalmanson). -/
theorem directSource_h1895 :
    ((!((rankAtom (directSourceRanks P) 58 == rankAtom (directSourceRanks P) 61)) || ((rankAtom (directSourceRanks P) 63).ult (rankAtom (directSourceRanks P) 66)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (66 : Fin 78) (58 : Fin 78)
    (63 : Fin 78) (61 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (6 : Fin 13) (7 : Fin 13) (8 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (63 : Fin 78) (61 : Fin 78) (58 : Fin 78)
    (66 : Fin 78) (57 : Fin 78) (70 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1896` (kalmanson). -/
theorem directSource_h1896 :
    ((!((rankAtom (directSourceRanks P) 58 == rankAtom (directSourceRanks P) 57)) || ((rankAtom (directSourceRanks P) 71).ult (rankAtom (directSourceRanks P) 67)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (67 : Fin 78) (58 : Fin 78)
    (71 : Fin 78) (57 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (6 : Fin 13) (7 : Fin 13) (8 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (63 : Fin 78) (62 : Fin 78) (58 : Fin 78)
    (67 : Fin 78) (57 : Fin 78) (71 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1897` (kalmanson). -/
theorem directSource_h1897 :
    ((!((rankAtom (directSourceRanks P) 58 == rankAtom (directSourceRanks P) 62)) || ((rankAtom (directSourceRanks P) 63).ult (rankAtom (directSourceRanks P) 67)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (67 : Fin 78) (58 : Fin 78)
    (63 : Fin 78) (62 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (6 : Fin 13) (7 : Fin 13) (8 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (63 : Fin 78) (62 : Fin 78) (58 : Fin 78)
    (67 : Fin 78) (57 : Fin 78) (71 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1898` (kalmanson). -/
theorem directSource_h1898 :
    ((!((rankAtom (directSourceRanks P) 64 == rankAtom (directSourceRanks P) 68)) || ((rankAtom (directSourceRanks P) 65).ult (rankAtom (directSourceRanks P) 69)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (69 : Fin 78) (64 : Fin 78)
    (65 : Fin 78) (68 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (7 : Fin 13) (8 : Fin 13) (9 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (68 : Fin 78) (65 : Fin 78) (64 : Fin 78)
    (69 : Fin 78) (63 : Fin 78) (72 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

end

end ATailExactFiveCard13CnfIngressScratch
end Problem97
