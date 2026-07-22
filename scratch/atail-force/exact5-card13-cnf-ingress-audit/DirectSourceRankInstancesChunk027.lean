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

/-- Exact pass-5 source assertion `h1728` (kalmanson). -/
theorem directSource_h1728 :
    ((!((rankAtom (directSourceRanks P) 43 == rankAtom (directSourceRanks P) 59)) || ((rankAtom (directSourceRanks P) 42).ult (rankAtom (directSourceRanks P) 53)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (53 : Fin 78) (43 : Fin 78)
    (42 : Fin 78) (59 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (5 : Fin 13) (6 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (46 : Fin 78) (43 : Fin 78)
    (53 : Fin 78) (42 : Fin 78) (59 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1729` (kalmanson). -/
theorem directSource_h1729 :
    ((!((rankAtom (directSourceRanks P) 53 == rankAtom (directSourceRanks P) 42)) || ((rankAtom (directSourceRanks P) 59).ult (rankAtom (directSourceRanks P) 43)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (43 : Fin 78) (53 : Fin 78)
    (59 : Fin 78) (42 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (5 : Fin 13) (6 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (46 : Fin 78) (43 : Fin 78)
    (53 : Fin 78) (42 : Fin 78) (59 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1730` (kalmanson). -/
theorem directSource_h1730 :
    ((!((rankAtom (directSourceRanks P) 43 == rankAtom (directSourceRanks P) 46)) || ((rankAtom (directSourceRanks P) 50).ult (rankAtom (directSourceRanks P) 53)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (53 : Fin 78) (43 : Fin 78)
    (50 : Fin 78) (46 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (5 : Fin 13) (6 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (46 : Fin 78) (43 : Fin 78)
    (53 : Fin 78) (42 : Fin 78) (59 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1731` (kalmanson). -/
theorem directSource_h1731 :
    ((!((rankAtom (directSourceRanks P) 43 == rankAtom (directSourceRanks P) 50)) || ((rankAtom (directSourceRanks P) 46).ult (rankAtom (directSourceRanks P) 53)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (53 : Fin 78) (43 : Fin 78)
    (46 : Fin 78) (50 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (5 : Fin 13) (6 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (46 : Fin 78) (43 : Fin 78)
    (53 : Fin 78) (42 : Fin 78) (59 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1732` (kalmanson). -/
theorem directSource_h1732 :
    ((!((rankAtom (directSourceRanks P) 53 == rankAtom (directSourceRanks P) 46)) || ((rankAtom (directSourceRanks P) 50).ult (rankAtom (directSourceRanks P) 43)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (43 : Fin 78) (53 : Fin 78)
    (50 : Fin 78) (46 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (5 : Fin 13) (6 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (46 : Fin 78) (43 : Fin 78)
    (53 : Fin 78) (42 : Fin 78) (59 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1733` (kalmanson). -/
theorem directSource_h1733 :
    ((!((rankAtom (directSourceRanks P) 53 == rankAtom (directSourceRanks P) 50)) || ((rankAtom (directSourceRanks P) 46).ult (rankAtom (directSourceRanks P) 43)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (43 : Fin 78) (53 : Fin 78)
    (46 : Fin 78) (50 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (5 : Fin 13) (6 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (46 : Fin 78) (43 : Fin 78)
    (53 : Fin 78) (42 : Fin 78) (59 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1734` (kalmanson). -/
theorem directSource_h1734 :
    ((!((rankAtom (directSourceRanks P) 43 == rankAtom (directSourceRanks P) 42)) || ((rankAtom (directSourceRanks P) 60).ult (rankAtom (directSourceRanks P) 54)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (54 : Fin 78) (43 : Fin 78)
    (60 : Fin 78) (42 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (5 : Fin 13) (6 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (47 : Fin 78) (43 : Fin 78)
    (54 : Fin 78) (42 : Fin 78) (60 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1735` (kalmanson). -/
theorem directSource_h1735 :
    ((!((rankAtom (directSourceRanks P) 43 == rankAtom (directSourceRanks P) 60)) || ((rankAtom (directSourceRanks P) 42).ult (rankAtom (directSourceRanks P) 54)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (54 : Fin 78) (43 : Fin 78)
    (42 : Fin 78) (60 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (5 : Fin 13) (6 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (47 : Fin 78) (43 : Fin 78)
    (54 : Fin 78) (42 : Fin 78) (60 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1736` (kalmanson). -/
theorem directSource_h1736 :
    ((!((rankAtom (directSourceRanks P) 54 == rankAtom (directSourceRanks P) 42)) || ((rankAtom (directSourceRanks P) 60).ult (rankAtom (directSourceRanks P) 43)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (43 : Fin 78) (54 : Fin 78)
    (60 : Fin 78) (42 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (5 : Fin 13) (6 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (47 : Fin 78) (43 : Fin 78)
    (54 : Fin 78) (42 : Fin 78) (60 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1737` (kalmanson). -/
theorem directSource_h1737 :
    ((!((rankAtom (directSourceRanks P) 43 == rankAtom (directSourceRanks P) 47)) || ((rankAtom (directSourceRanks P) 50).ult (rankAtom (directSourceRanks P) 54)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (54 : Fin 78) (43 : Fin 78)
    (50 : Fin 78) (47 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (5 : Fin 13) (6 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (47 : Fin 78) (43 : Fin 78)
    (54 : Fin 78) (42 : Fin 78) (60 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1738` (kalmanson). -/
theorem directSource_h1738 :
    ((!((rankAtom (directSourceRanks P) 43 == rankAtom (directSourceRanks P) 50)) || ((rankAtom (directSourceRanks P) 47).ult (rankAtom (directSourceRanks P) 54)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (54 : Fin 78) (43 : Fin 78)
    (47 : Fin 78) (50 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (5 : Fin 13) (6 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (47 : Fin 78) (43 : Fin 78)
    (54 : Fin 78) (42 : Fin 78) (60 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1739` (kalmanson). -/
theorem directSource_h1739 :
    ((!((rankAtom (directSourceRanks P) 54 == rankAtom (directSourceRanks P) 47)) || ((rankAtom (directSourceRanks P) 50).ult (rankAtom (directSourceRanks P) 43)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (43 : Fin 78) (54 : Fin 78)
    (50 : Fin 78) (47 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (5 : Fin 13) (6 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (47 : Fin 78) (43 : Fin 78)
    (54 : Fin 78) (42 : Fin 78) (60 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1740` (kalmanson). -/
theorem directSource_h1740 :
    ((!((rankAtom (directSourceRanks P) 54 == rankAtom (directSourceRanks P) 50)) || ((rankAtom (directSourceRanks P) 47).ult (rankAtom (directSourceRanks P) 43)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (43 : Fin 78) (54 : Fin 78)
    (47 : Fin 78) (50 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (5 : Fin 13) (6 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (47 : Fin 78) (43 : Fin 78)
    (54 : Fin 78) (42 : Fin 78) (60 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1741` (kalmanson). -/
theorem directSource_h1741 :
    ((!((rankAtom (directSourceRanks P) 43 == rankAtom (directSourceRanks P) 42)) || ((rankAtom (directSourceRanks P) 61).ult (rankAtom (directSourceRanks P) 55)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (55 : Fin 78) (43 : Fin 78)
    (61 : Fin 78) (42 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (5 : Fin 13) (6 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (48 : Fin 78) (43 : Fin 78)
    (55 : Fin 78) (42 : Fin 78) (61 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1742` (kalmanson). -/
theorem directSource_h1742 :
    ((!((rankAtom (directSourceRanks P) 43 == rankAtom (directSourceRanks P) 61)) || ((rankAtom (directSourceRanks P) 42).ult (rankAtom (directSourceRanks P) 55)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (55 : Fin 78) (43 : Fin 78)
    (42 : Fin 78) (61 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (5 : Fin 13) (6 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (48 : Fin 78) (43 : Fin 78)
    (55 : Fin 78) (42 : Fin 78) (61 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1743` (kalmanson). -/
theorem directSource_h1743 :
    ((!((rankAtom (directSourceRanks P) 55 == rankAtom (directSourceRanks P) 42)) || ((rankAtom (directSourceRanks P) 61).ult (rankAtom (directSourceRanks P) 43)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (43 : Fin 78) (55 : Fin 78)
    (61 : Fin 78) (42 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (5 : Fin 13) (6 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (48 : Fin 78) (43 : Fin 78)
    (55 : Fin 78) (42 : Fin 78) (61 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1744` (kalmanson). -/
theorem directSource_h1744 :
    ((!((rankAtom (directSourceRanks P) 43 == rankAtom (directSourceRanks P) 48)) || ((rankAtom (directSourceRanks P) 50).ult (rankAtom (directSourceRanks P) 55)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (55 : Fin 78) (43 : Fin 78)
    (50 : Fin 78) (48 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (5 : Fin 13) (6 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (48 : Fin 78) (43 : Fin 78)
    (55 : Fin 78) (42 : Fin 78) (61 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1745` (kalmanson). -/
theorem directSource_h1745 :
    ((!((rankAtom (directSourceRanks P) 43 == rankAtom (directSourceRanks P) 50)) || ((rankAtom (directSourceRanks P) 48).ult (rankAtom (directSourceRanks P) 55)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (55 : Fin 78) (43 : Fin 78)
    (48 : Fin 78) (50 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (5 : Fin 13) (6 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (48 : Fin 78) (43 : Fin 78)
    (55 : Fin 78) (42 : Fin 78) (61 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1746` (kalmanson). -/
theorem directSource_h1746 :
    ((!((rankAtom (directSourceRanks P) 55 == rankAtom (directSourceRanks P) 48)) || ((rankAtom (directSourceRanks P) 50).ult (rankAtom (directSourceRanks P) 43)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (43 : Fin 78) (55 : Fin 78)
    (50 : Fin 78) (48 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (5 : Fin 13) (6 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (48 : Fin 78) (43 : Fin 78)
    (55 : Fin 78) (42 : Fin 78) (61 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1747` (kalmanson). -/
theorem directSource_h1747 :
    ((!((rankAtom (directSourceRanks P) 55 == rankAtom (directSourceRanks P) 50)) || ((rankAtom (directSourceRanks P) 48).ult (rankAtom (directSourceRanks P) 43)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (43 : Fin 78) (55 : Fin 78)
    (48 : Fin 78) (50 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (5 : Fin 13) (6 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (48 : Fin 78) (43 : Fin 78)
    (55 : Fin 78) (42 : Fin 78) (61 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1748` (kalmanson). -/
theorem directSource_h1748 :
    ((!((rankAtom (directSourceRanks P) 43 == rankAtom (directSourceRanks P) 42)) || ((rankAtom (directSourceRanks P) 62).ult (rankAtom (directSourceRanks P) 56)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (56 : Fin 78) (43 : Fin 78)
    (62 : Fin 78) (42 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (5 : Fin 13) (6 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (49 : Fin 78) (43 : Fin 78)
    (56 : Fin 78) (42 : Fin 78) (62 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1749` (kalmanson). -/
theorem directSource_h1749 :
    ((!((rankAtom (directSourceRanks P) 43 == rankAtom (directSourceRanks P) 62)) || ((rankAtom (directSourceRanks P) 42).ult (rankAtom (directSourceRanks P) 56)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (56 : Fin 78) (43 : Fin 78)
    (42 : Fin 78) (62 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (5 : Fin 13) (6 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (49 : Fin 78) (43 : Fin 78)
    (56 : Fin 78) (42 : Fin 78) (62 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1750` (kalmanson). -/
theorem directSource_h1750 :
    ((!((rankAtom (directSourceRanks P) 56 == rankAtom (directSourceRanks P) 42)) || ((rankAtom (directSourceRanks P) 62).ult (rankAtom (directSourceRanks P) 43)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (43 : Fin 78) (56 : Fin 78)
    (62 : Fin 78) (42 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (5 : Fin 13) (6 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (49 : Fin 78) (43 : Fin 78)
    (56 : Fin 78) (42 : Fin 78) (62 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1751` (kalmanson). -/
theorem directSource_h1751 :
    ((!((rankAtom (directSourceRanks P) 43 == rankAtom (directSourceRanks P) 49)) || ((rankAtom (directSourceRanks P) 50).ult (rankAtom (directSourceRanks P) 56)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (56 : Fin 78) (43 : Fin 78)
    (50 : Fin 78) (49 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (5 : Fin 13) (6 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (49 : Fin 78) (43 : Fin 78)
    (56 : Fin 78) (42 : Fin 78) (62 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1752` (kalmanson). -/
theorem directSource_h1752 :
    ((!((rankAtom (directSourceRanks P) 43 == rankAtom (directSourceRanks P) 50)) || ((rankAtom (directSourceRanks P) 49).ult (rankAtom (directSourceRanks P) 56)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (56 : Fin 78) (43 : Fin 78)
    (49 : Fin 78) (50 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (5 : Fin 13) (6 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (49 : Fin 78) (43 : Fin 78)
    (56 : Fin 78) (42 : Fin 78) (62 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1753` (kalmanson). -/
theorem directSource_h1753 :
    ((!((rankAtom (directSourceRanks P) 56 == rankAtom (directSourceRanks P) 49)) || ((rankAtom (directSourceRanks P) 50).ult (rankAtom (directSourceRanks P) 43)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (43 : Fin 78) (56 : Fin 78)
    (50 : Fin 78) (49 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (5 : Fin 13) (6 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (49 : Fin 78) (43 : Fin 78)
    (56 : Fin 78) (42 : Fin 78) (62 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1754` (kalmanson). -/
theorem directSource_h1754 :
    ((!((rankAtom (directSourceRanks P) 56 == rankAtom (directSourceRanks P) 50)) || ((rankAtom (directSourceRanks P) 49).ult (rankAtom (directSourceRanks P) 43)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (43 : Fin 78) (56 : Fin 78)
    (49 : Fin 78) (50 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (5 : Fin 13) (6 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (49 : Fin 78) (43 : Fin 78)
    (56 : Fin 78) (42 : Fin 78) (62 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1755` (kalmanson). -/
theorem directSource_h1755 :
    ((!((rankAtom (directSourceRanks P) 44 == rankAtom (directSourceRanks P) 45)) || ((rankAtom (directSourceRanks P) 51).ult (rankAtom (directSourceRanks P) 52)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (52 : Fin 78) (44 : Fin 78)
    (51 : Fin 78) (45 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (5 : Fin 13) (7 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (51 : Fin 78) (45 : Fin 78) (44 : Fin 78)
    (52 : Fin 78) (42 : Fin 78) (63 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1756` (kalmanson). -/
theorem directSource_h1756 :
    ((!((rankAtom (directSourceRanks P) 52 == rankAtom (directSourceRanks P) 51)) || ((rankAtom (directSourceRanks P) 45).ult (rankAtom (directSourceRanks P) 44)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (44 : Fin 78) (52 : Fin 78)
    (45 : Fin 78) (51 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (5 : Fin 13) (7 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (51 : Fin 78) (45 : Fin 78) (44 : Fin 78)
    (52 : Fin 78) (42 : Fin 78) (63 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1757` (kalmanson). -/
theorem directSource_h1757 :
    ((!((rankAtom (directSourceRanks P) 44 == rankAtom (directSourceRanks P) 42)) || ((rankAtom (directSourceRanks P) 64).ult (rankAtom (directSourceRanks P) 53)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (53 : Fin 78) (44 : Fin 78)
    (64 : Fin 78) (42 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (5 : Fin 13) (7 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (51 : Fin 78) (46 : Fin 78) (44 : Fin 78)
    (53 : Fin 78) (42 : Fin 78) (64 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1758` (kalmanson). -/
theorem directSource_h1758 :
    ((!((rankAtom (directSourceRanks P) 44 == rankAtom (directSourceRanks P) 46)) || ((rankAtom (directSourceRanks P) 51).ult (rankAtom (directSourceRanks P) 53)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (53 : Fin 78) (44 : Fin 78)
    (51 : Fin 78) (46 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (5 : Fin 13) (7 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (51 : Fin 78) (46 : Fin 78) (44 : Fin 78)
    (53 : Fin 78) (42 : Fin 78) (64 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1759` (kalmanson). -/
theorem directSource_h1759 :
    ((!((rankAtom (directSourceRanks P) 53 == rankAtom (directSourceRanks P) 51)) || ((rankAtom (directSourceRanks P) 46).ult (rankAtom (directSourceRanks P) 44)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (44 : Fin 78) (53 : Fin 78)
    (46 : Fin 78) (51 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (5 : Fin 13) (7 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (51 : Fin 78) (46 : Fin 78) (44 : Fin 78)
    (53 : Fin 78) (42 : Fin 78) (64 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1760` (kalmanson). -/
theorem directSource_h1760 :
    ((!((rankAtom (directSourceRanks P) 44 == rankAtom (directSourceRanks P) 47)) || ((rankAtom (directSourceRanks P) 51).ult (rankAtom (directSourceRanks P) 54)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (54 : Fin 78) (44 : Fin 78)
    (51 : Fin 78) (47 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (5 : Fin 13) (7 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (51 : Fin 78) (47 : Fin 78) (44 : Fin 78)
    (54 : Fin 78) (42 : Fin 78) (65 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1761` (kalmanson). -/
theorem directSource_h1761 :
    ((!((rankAtom (directSourceRanks P) 54 == rankAtom (directSourceRanks P) 51)) || ((rankAtom (directSourceRanks P) 47).ult (rankAtom (directSourceRanks P) 44)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (44 : Fin 78) (54 : Fin 78)
    (47 : Fin 78) (51 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (5 : Fin 13) (7 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (51 : Fin 78) (47 : Fin 78) (44 : Fin 78)
    (54 : Fin 78) (42 : Fin 78) (65 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1762` (kalmanson). -/
theorem directSource_h1762 :
    ((!((rankAtom (directSourceRanks P) 44 == rankAtom (directSourceRanks P) 48)) || ((rankAtom (directSourceRanks P) 51).ult (rankAtom (directSourceRanks P) 55)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (55 : Fin 78) (44 : Fin 78)
    (51 : Fin 78) (48 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (5 : Fin 13) (7 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (51 : Fin 78) (48 : Fin 78) (44 : Fin 78)
    (55 : Fin 78) (42 : Fin 78) (66 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1763` (kalmanson). -/
theorem directSource_h1763 :
    ((!((rankAtom (directSourceRanks P) 55 == rankAtom (directSourceRanks P) 51)) || ((rankAtom (directSourceRanks P) 48).ult (rankAtom (directSourceRanks P) 44)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (44 : Fin 78) (55 : Fin 78)
    (48 : Fin 78) (51 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (5 : Fin 13) (7 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (51 : Fin 78) (48 : Fin 78) (44 : Fin 78)
    (55 : Fin 78) (42 : Fin 78) (66 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1764` (kalmanson). -/
theorem directSource_h1764 :
    ((!((rankAtom (directSourceRanks P) 44 == rankAtom (directSourceRanks P) 49)) || ((rankAtom (directSourceRanks P) 51).ult (rankAtom (directSourceRanks P) 56)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (56 : Fin 78) (44 : Fin 78)
    (51 : Fin 78) (49 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (5 : Fin 13) (7 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (51 : Fin 78) (49 : Fin 78) (44 : Fin 78)
    (56 : Fin 78) (42 : Fin 78) (67 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1765` (kalmanson). -/
theorem directSource_h1765 :
    ((!((rankAtom (directSourceRanks P) 56 == rankAtom (directSourceRanks P) 49)) || ((rankAtom (directSourceRanks P) 51).ult (rankAtom (directSourceRanks P) 44)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (44 : Fin 78) (56 : Fin 78)
    (51 : Fin 78) (49 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (5 : Fin 13) (7 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (51 : Fin 78) (49 : Fin 78) (44 : Fin 78)
    (56 : Fin 78) (42 : Fin 78) (67 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1766` (kalmanson). -/
theorem directSource_h1766 :
    ((!((rankAtom (directSourceRanks P) 56 == rankAtom (directSourceRanks P) 51)) || ((rankAtom (directSourceRanks P) 49).ult (rankAtom (directSourceRanks P) 44)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (44 : Fin 78) (56 : Fin 78)
    (49 : Fin 78) (51 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (5 : Fin 13) (7 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (51 : Fin 78) (49 : Fin 78) (44 : Fin 78)
    (56 : Fin 78) (42 : Fin 78) (67 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1767` (kalmanson). -/
theorem directSource_h1767 :
    ((!((rankAtom (directSourceRanks P) 45 == rankAtom (directSourceRanks P) 46)) || ((rankAtom (directSourceRanks P) 52).ult (rankAtom (directSourceRanks P) 53)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (53 : Fin 78) (45 : Fin 78)
    (52 : Fin 78) (46 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (5 : Fin 13) (8 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (52 : Fin 78) (46 : Fin 78) (45 : Fin 78)
    (53 : Fin 78) (42 : Fin 78) (68 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1768` (kalmanson). -/
theorem directSource_h1768 :
    ((!((rankAtom (directSourceRanks P) 53 == rankAtom (directSourceRanks P) 46)) || ((rankAtom (directSourceRanks P) 52).ult (rankAtom (directSourceRanks P) 45)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (45 : Fin 78) (53 : Fin 78)
    (52 : Fin 78) (46 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (5 : Fin 13) (8 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (52 : Fin 78) (46 : Fin 78) (45 : Fin 78)
    (53 : Fin 78) (42 : Fin 78) (68 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1769` (kalmanson). -/
theorem directSource_h1769 :
    ((!((rankAtom (directSourceRanks P) 53 == rankAtom (directSourceRanks P) 52)) || ((rankAtom (directSourceRanks P) 46).ult (rankAtom (directSourceRanks P) 45)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (45 : Fin 78) (53 : Fin 78)
    (46 : Fin 78) (52 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (5 : Fin 13) (8 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (52 : Fin 78) (46 : Fin 78) (45 : Fin 78)
    (53 : Fin 78) (42 : Fin 78) (68 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1770` (kalmanson). -/
theorem directSource_h1770 :
    ((!((rankAtom (directSourceRanks P) 45 == rankAtom (directSourceRanks P) 47)) || ((rankAtom (directSourceRanks P) 52).ult (rankAtom (directSourceRanks P) 54)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (54 : Fin 78) (45 : Fin 78)
    (52 : Fin 78) (47 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (5 : Fin 13) (8 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (52 : Fin 78) (47 : Fin 78) (45 : Fin 78)
    (54 : Fin 78) (42 : Fin 78) (69 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1771` (kalmanson). -/
theorem directSource_h1771 :
    ((!((rankAtom (directSourceRanks P) 54 == rankAtom (directSourceRanks P) 47)) || ((rankAtom (directSourceRanks P) 52).ult (rankAtom (directSourceRanks P) 45)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (45 : Fin 78) (54 : Fin 78)
    (52 : Fin 78) (47 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (5 : Fin 13) (8 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (52 : Fin 78) (47 : Fin 78) (45 : Fin 78)
    (54 : Fin 78) (42 : Fin 78) (69 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1772` (kalmanson). -/
theorem directSource_h1772 :
    ((!((rankAtom (directSourceRanks P) 54 == rankAtom (directSourceRanks P) 52)) || ((rankAtom (directSourceRanks P) 47).ult (rankAtom (directSourceRanks P) 45)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (45 : Fin 78) (54 : Fin 78)
    (47 : Fin 78) (52 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (5 : Fin 13) (8 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (52 : Fin 78) (47 : Fin 78) (45 : Fin 78)
    (54 : Fin 78) (42 : Fin 78) (69 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1773` (kalmanson). -/
theorem directSource_h1773 :
    ((!((rankAtom (directSourceRanks P) 45 == rankAtom (directSourceRanks P) 48)) || ((rankAtom (directSourceRanks P) 52).ult (rankAtom (directSourceRanks P) 55)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (55 : Fin 78) (45 : Fin 78)
    (52 : Fin 78) (48 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (5 : Fin 13) (8 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (52 : Fin 78) (48 : Fin 78) (45 : Fin 78)
    (55 : Fin 78) (42 : Fin 78) (70 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1774` (kalmanson). -/
theorem directSource_h1774 :
    ((!((rankAtom (directSourceRanks P) 55 == rankAtom (directSourceRanks P) 48)) || ((rankAtom (directSourceRanks P) 52).ult (rankAtom (directSourceRanks P) 45)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (45 : Fin 78) (55 : Fin 78)
    (52 : Fin 78) (48 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (5 : Fin 13) (8 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (52 : Fin 78) (48 : Fin 78) (45 : Fin 78)
    (55 : Fin 78) (42 : Fin 78) (70 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1775` (kalmanson). -/
theorem directSource_h1775 :
    ((!((rankAtom (directSourceRanks P) 55 == rankAtom (directSourceRanks P) 52)) || ((rankAtom (directSourceRanks P) 48).ult (rankAtom (directSourceRanks P) 45)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (45 : Fin 78) (55 : Fin 78)
    (48 : Fin 78) (52 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (5 : Fin 13) (8 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (52 : Fin 78) (48 : Fin 78) (45 : Fin 78)
    (55 : Fin 78) (42 : Fin 78) (70 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1776` (kalmanson). -/
theorem directSource_h1776 :
    ((!((rankAtom (directSourceRanks P) 45 == rankAtom (directSourceRanks P) 49)) || ((rankAtom (directSourceRanks P) 52).ult (rankAtom (directSourceRanks P) 56)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (56 : Fin 78) (45 : Fin 78)
    (52 : Fin 78) (49 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (5 : Fin 13) (8 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (52 : Fin 78) (49 : Fin 78) (45 : Fin 78)
    (56 : Fin 78) (42 : Fin 78) (71 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1777` (kalmanson). -/
theorem directSource_h1777 :
    ((!((rankAtom (directSourceRanks P) 56 == rankAtom (directSourceRanks P) 49)) || ((rankAtom (directSourceRanks P) 52).ult (rankAtom (directSourceRanks P) 45)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (45 : Fin 78) (56 : Fin 78)
    (52 : Fin 78) (49 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (5 : Fin 13) (8 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (52 : Fin 78) (49 : Fin 78) (45 : Fin 78)
    (56 : Fin 78) (42 : Fin 78) (71 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1778` (kalmanson). -/
theorem directSource_h1778 :
    ((!((rankAtom (directSourceRanks P) 56 == rankAtom (directSourceRanks P) 52)) || ((rankAtom (directSourceRanks P) 49).ult (rankAtom (directSourceRanks P) 45)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (45 : Fin 78) (56 : Fin 78)
    (49 : Fin 78) (52 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (5 : Fin 13) (8 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (52 : Fin 78) (49 : Fin 78) (45 : Fin 78)
    (56 : Fin 78) (42 : Fin 78) (71 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1779` (kalmanson). -/
theorem directSource_h1779 :
    ((!((rankAtom (directSourceRanks P) 46 == rankAtom (directSourceRanks P) 47)) || ((rankAtom (directSourceRanks P) 53).ult (rankAtom (directSourceRanks P) 54)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (54 : Fin 78) (46 : Fin 78)
    (53 : Fin 78) (47 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (5 : Fin 13) (9 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (53 : Fin 78) (47 : Fin 78) (46 : Fin 78)
    (54 : Fin 78) (42 : Fin 78) (72 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1780` (kalmanson). -/
theorem directSource_h1780 :
    ((!((rankAtom (directSourceRanks P) 46 == rankAtom (directSourceRanks P) 48)) || ((rankAtom (directSourceRanks P) 53).ult (rankAtom (directSourceRanks P) 55)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (55 : Fin 78) (46 : Fin 78)
    (53 : Fin 78) (48 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (5 : Fin 13) (9 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (53 : Fin 78) (48 : Fin 78) (46 : Fin 78)
    (55 : Fin 78) (42 : Fin 78) (73 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1781` (kalmanson). -/
theorem directSource_h1781 :
    ((!((rankAtom (directSourceRanks P) 46 == rankAtom (directSourceRanks P) 49)) || ((rankAtom (directSourceRanks P) 53).ult (rankAtom (directSourceRanks P) 56)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (56 : Fin 78) (46 : Fin 78)
    (53 : Fin 78) (49 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (5 : Fin 13) (9 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (53 : Fin 78) (49 : Fin 78) (46 : Fin 78)
    (56 : Fin 78) (42 : Fin 78) (74 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1782` (kalmanson). -/
theorem directSource_h1782 :
    ((!((rankAtom (directSourceRanks P) 46 == rankAtom (directSourceRanks P) 53)) || ((rankAtom (directSourceRanks P) 49).ult (rankAtom (directSourceRanks P) 56)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (56 : Fin 78) (46 : Fin 78)
    (49 : Fin 78) (53 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (5 : Fin 13) (9 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (53 : Fin 78) (49 : Fin 78) (46 : Fin 78)
    (56 : Fin 78) (42 : Fin 78) (74 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1783` (kalmanson). -/
theorem directSource_h1783 :
    ((!((rankAtom (directSourceRanks P) 56 == rankAtom (directSourceRanks P) 49)) || ((rankAtom (directSourceRanks P) 53).ult (rankAtom (directSourceRanks P) 46)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (46 : Fin 78) (56 : Fin 78)
    (53 : Fin 78) (49 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (5 : Fin 13) (9 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (53 : Fin 78) (49 : Fin 78) (46 : Fin 78)
    (56 : Fin 78) (42 : Fin 78) (74 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1784` (kalmanson). -/
theorem directSource_h1784 :
    ((!((rankAtom (directSourceRanks P) 47 == rankAtom (directSourceRanks P) 48)) || ((rankAtom (directSourceRanks P) 54).ult (rankAtom (directSourceRanks P) 55)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (55 : Fin 78) (47 : Fin 78)
    (54 : Fin 78) (48 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (5 : Fin 13) (10 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (54 : Fin 78) (48 : Fin 78) (47 : Fin 78)
    (55 : Fin 78) (42 : Fin 78) (75 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1785` (kalmanson). -/
theorem directSource_h1785 :
    ((!((rankAtom (directSourceRanks P) 47 == rankAtom (directSourceRanks P) 49)) || ((rankAtom (directSourceRanks P) 54).ult (rankAtom (directSourceRanks P) 56)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (56 : Fin 78) (47 : Fin 78)
    (54 : Fin 78) (49 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (5 : Fin 13) (10 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (54 : Fin 78) (49 : Fin 78) (47 : Fin 78)
    (56 : Fin 78) (42 : Fin 78) (76 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1786` (kalmanson). -/
theorem directSource_h1786 :
    ((!((rankAtom (directSourceRanks P) 47 == rankAtom (directSourceRanks P) 54)) || ((rankAtom (directSourceRanks P) 49).ult (rankAtom (directSourceRanks P) 56)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (56 : Fin 78) (47 : Fin 78)
    (49 : Fin 78) (54 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (5 : Fin 13) (10 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (54 : Fin 78) (49 : Fin 78) (47 : Fin 78)
    (56 : Fin 78) (42 : Fin 78) (76 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1787` (kalmanson). -/
theorem directSource_h1787 :
    ((!((rankAtom (directSourceRanks P) 48 == rankAtom (directSourceRanks P) 49)) || ((rankAtom (directSourceRanks P) 55).ult (rankAtom (directSourceRanks P) 56)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (56 : Fin 78) (48 : Fin 78)
    (55 : Fin 78) (49 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (5 : Fin 13) (11 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (55 : Fin 78) (49 : Fin 78) (48 : Fin 78)
    (56 : Fin 78) (42 : Fin 78) (77 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1788` (kalmanson). -/
theorem directSource_h1788 :
    ((!((rankAtom (directSourceRanks P) 48 == rankAtom (directSourceRanks P) 55)) || ((rankAtom (directSourceRanks P) 49).ult (rankAtom (directSourceRanks P) 56)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (56 : Fin 78) (48 : Fin 78)
    (49 : Fin 78) (55 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (5 : Fin 13) (11 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (55 : Fin 78) (49 : Fin 78) (48 : Fin 78)
    (56 : Fin 78) (42 : Fin 78) (77 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1789` (kalmanson). -/
theorem directSource_h1789 :
    ((!((rankAtom (directSourceRanks P) 58 == rankAtom (directSourceRanks P) 43)) || ((rankAtom (directSourceRanks P) 63).ult (rankAtom (directSourceRanks P) 44)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (44 : Fin 78) (58 : Fin 78)
    (63 : Fin 78) (43 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (6 : Fin 13) (7 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (45 : Fin 78) (44 : Fin 78)
    (58 : Fin 78) (43 : Fin 78) (63 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1790` (kalmanson). -/
theorem directSource_h1790 :
    ((!((rankAtom (directSourceRanks P) 58 == rankAtom (directSourceRanks P) 57)) || ((rankAtom (directSourceRanks P) 45).ult (rankAtom (directSourceRanks P) 44)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (44 : Fin 78) (58 : Fin 78)
    (45 : Fin 78) (57 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (6 : Fin 13) (7 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (45 : Fin 78) (44 : Fin 78)
    (58 : Fin 78) (43 : Fin 78) (63 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1791` (kalmanson). -/
theorem directSource_h1791 :
    ((!((rankAtom (directSourceRanks P) 44 == rankAtom (directSourceRanks P) 43)) || ((rankAtom (directSourceRanks P) 64).ult (rankAtom (directSourceRanks P) 59)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (59 : Fin 78) (44 : Fin 78)
    (64 : Fin 78) (43 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (6 : Fin 13) (7 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (46 : Fin 78) (44 : Fin 78)
    (59 : Fin 78) (43 : Fin 78) (64 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

end

end ATailExactFiveCard13CnfIngressScratch
end Problem97
