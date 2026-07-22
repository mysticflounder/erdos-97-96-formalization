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

/-- Exact pass-5 source assertion `h1792` (kalmanson). -/
theorem directSource_h1792 :
    ((!((rankAtom (directSourceRanks P) 44 == rankAtom (directSourceRanks P) 46)) || ((rankAtom (directSourceRanks P) 57).ult (rankAtom (directSourceRanks P) 59)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (59 : Fin 78) (44 : Fin 78)
    (57 : Fin 78) (46 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (6 : Fin 13) (7 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (46 : Fin 78) (44 : Fin 78)
    (59 : Fin 78) (43 : Fin 78) (64 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1793` (kalmanson). -/
theorem directSource_h1793 :
    ((!((rankAtom (directSourceRanks P) 59 == rankAtom (directSourceRanks P) 57)) || ((rankAtom (directSourceRanks P) 46).ult (rankAtom (directSourceRanks P) 44)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (44 : Fin 78) (59 : Fin 78)
    (46 : Fin 78) (57 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (6 : Fin 13) (7 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (46 : Fin 78) (44 : Fin 78)
    (59 : Fin 78) (43 : Fin 78) (64 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1794` (kalmanson). -/
theorem directSource_h1794 :
    ((!((rankAtom (directSourceRanks P) 44 == rankAtom (directSourceRanks P) 47)) || ((rankAtom (directSourceRanks P) 57).ult (rankAtom (directSourceRanks P) 60)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (60 : Fin 78) (44 : Fin 78)
    (57 : Fin 78) (47 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (6 : Fin 13) (7 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (47 : Fin 78) (44 : Fin 78)
    (60 : Fin 78) (43 : Fin 78) (65 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1795` (kalmanson). -/
theorem directSource_h1795 :
    ((!((rankAtom (directSourceRanks P) 60 == rankAtom (directSourceRanks P) 57)) || ((rankAtom (directSourceRanks P) 47).ult (rankAtom (directSourceRanks P) 44)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (44 : Fin 78) (60 : Fin 78)
    (47 : Fin 78) (57 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (6 : Fin 13) (7 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (47 : Fin 78) (44 : Fin 78)
    (60 : Fin 78) (43 : Fin 78) (65 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1796` (kalmanson). -/
theorem directSource_h1796 :
    ((!((rankAtom (directSourceRanks P) 44 == rankAtom (directSourceRanks P) 48)) || ((rankAtom (directSourceRanks P) 57).ult (rankAtom (directSourceRanks P) 61)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (61 : Fin 78) (44 : Fin 78)
    (57 : Fin 78) (48 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (6 : Fin 13) (7 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (48 : Fin 78) (44 : Fin 78)
    (61 : Fin 78) (43 : Fin 78) (66 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1797` (kalmanson). -/
theorem directSource_h1797 :
    ((!((rankAtom (directSourceRanks P) 61 == rankAtom (directSourceRanks P) 57)) || ((rankAtom (directSourceRanks P) 48).ult (rankAtom (directSourceRanks P) 44)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (44 : Fin 78) (61 : Fin 78)
    (48 : Fin 78) (57 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (6 : Fin 13) (7 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (48 : Fin 78) (44 : Fin 78)
    (61 : Fin 78) (43 : Fin 78) (66 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1798` (kalmanson). -/
theorem directSource_h1798 :
    ((!((rankAtom (directSourceRanks P) 62 == rankAtom (directSourceRanks P) 43)) || ((rankAtom (directSourceRanks P) 67).ult (rankAtom (directSourceRanks P) 44)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (44 : Fin 78) (62 : Fin 78)
    (67 : Fin 78) (43 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (6 : Fin 13) (7 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (49 : Fin 78) (44 : Fin 78)
    (62 : Fin 78) (43 : Fin 78) (67 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1799` (kalmanson). -/
theorem directSource_h1799 :
    ((!((rankAtom (directSourceRanks P) 44 == rankAtom (directSourceRanks P) 49)) || ((rankAtom (directSourceRanks P) 57).ult (rankAtom (directSourceRanks P) 62)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (62 : Fin 78) (44 : Fin 78)
    (57 : Fin 78) (49 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (6 : Fin 13) (7 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (49 : Fin 78) (44 : Fin 78)
    (62 : Fin 78) (43 : Fin 78) (67 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1800` (kalmanson). -/
theorem directSource_h1800 :
    ((!((rankAtom (directSourceRanks P) 62 == rankAtom (directSourceRanks P) 57)) || ((rankAtom (directSourceRanks P) 49).ult (rankAtom (directSourceRanks P) 44)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (44 : Fin 78) (62 : Fin 78)
    (49 : Fin 78) (57 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (6 : Fin 13) (7 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (49 : Fin 78) (44 : Fin 78)
    (62 : Fin 78) (43 : Fin 78) (67 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1801` (kalmanson). -/
theorem directSource_h1801 :
    ((!((rankAtom (directSourceRanks P) 45 == rankAtom (directSourceRanks P) 68)) || ((rankAtom (directSourceRanks P) 43).ult (rankAtom (directSourceRanks P) 59)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (59 : Fin 78) (45 : Fin 78)
    (43 : Fin 78) (68 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (6 : Fin 13) (8 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (58 : Fin 78) (46 : Fin 78) (45 : Fin 78)
    (59 : Fin 78) (43 : Fin 78) (68 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1802` (kalmanson). -/
theorem directSource_h1802 :
    ((!((rankAtom (directSourceRanks P) 45 == rankAtom (directSourceRanks P) 46)) || ((rankAtom (directSourceRanks P) 58).ult (rankAtom (directSourceRanks P) 59)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (59 : Fin 78) (45 : Fin 78)
    (58 : Fin 78) (46 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (6 : Fin 13) (8 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (58 : Fin 78) (46 : Fin 78) (45 : Fin 78)
    (59 : Fin 78) (43 : Fin 78) (68 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1803` (kalmanson). -/
theorem directSource_h1803 :
    ((!((rankAtom (directSourceRanks P) 59 == rankAtom (directSourceRanks P) 58)) || ((rankAtom (directSourceRanks P) 46).ult (rankAtom (directSourceRanks P) 45)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (45 : Fin 78) (59 : Fin 78)
    (46 : Fin 78) (58 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (6 : Fin 13) (8 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (58 : Fin 78) (46 : Fin 78) (45 : Fin 78)
    (59 : Fin 78) (43 : Fin 78) (68 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1804` (kalmanson). -/
theorem directSource_h1804 :
    ((!((rankAtom (directSourceRanks P) 45 == rankAtom (directSourceRanks P) 47)) || ((rankAtom (directSourceRanks P) 58).ult (rankAtom (directSourceRanks P) 60)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (60 : Fin 78) (45 : Fin 78)
    (58 : Fin 78) (47 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (6 : Fin 13) (8 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (58 : Fin 78) (47 : Fin 78) (45 : Fin 78)
    (60 : Fin 78) (43 : Fin 78) (69 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1805` (kalmanson). -/
theorem directSource_h1805 :
    ((!((rankAtom (directSourceRanks P) 60 == rankAtom (directSourceRanks P) 58)) || ((rankAtom (directSourceRanks P) 47).ult (rankAtom (directSourceRanks P) 45)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (45 : Fin 78) (60 : Fin 78)
    (47 : Fin 78) (58 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (6 : Fin 13) (8 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (58 : Fin 78) (47 : Fin 78) (45 : Fin 78)
    (60 : Fin 78) (43 : Fin 78) (69 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1806` (kalmanson). -/
theorem directSource_h1806 :
    ((!((rankAtom (directSourceRanks P) 45 == rankAtom (directSourceRanks P) 70)) || ((rankAtom (directSourceRanks P) 43).ult (rankAtom (directSourceRanks P) 61)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (61 : Fin 78) (45 : Fin 78)
    (43 : Fin 78) (70 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (6 : Fin 13) (8 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (58 : Fin 78) (48 : Fin 78) (45 : Fin 78)
    (61 : Fin 78) (43 : Fin 78) (70 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1807` (kalmanson). -/
theorem directSource_h1807 :
    ((!((rankAtom (directSourceRanks P) 45 == rankAtom (directSourceRanks P) 48)) || ((rankAtom (directSourceRanks P) 58).ult (rankAtom (directSourceRanks P) 61)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (61 : Fin 78) (45 : Fin 78)
    (58 : Fin 78) (48 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (6 : Fin 13) (8 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (58 : Fin 78) (48 : Fin 78) (45 : Fin 78)
    (61 : Fin 78) (43 : Fin 78) (70 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1808` (kalmanson). -/
theorem directSource_h1808 :
    ((!((rankAtom (directSourceRanks P) 61 == rankAtom (directSourceRanks P) 58)) || ((rankAtom (directSourceRanks P) 48).ult (rankAtom (directSourceRanks P) 45)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (45 : Fin 78) (61 : Fin 78)
    (48 : Fin 78) (58 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (6 : Fin 13) (8 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (58 : Fin 78) (48 : Fin 78) (45 : Fin 78)
    (61 : Fin 78) (43 : Fin 78) (70 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1809` (kalmanson). -/
theorem directSource_h1809 :
    ((!((rankAtom (directSourceRanks P) 45 == rankAtom (directSourceRanks P) 71)) || ((rankAtom (directSourceRanks P) 43).ult (rankAtom (directSourceRanks P) 62)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (62 : Fin 78) (45 : Fin 78)
    (43 : Fin 78) (71 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (6 : Fin 13) (8 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (58 : Fin 78) (49 : Fin 78) (45 : Fin 78)
    (62 : Fin 78) (43 : Fin 78) (71 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1810` (kalmanson). -/
theorem directSource_h1810 :
    ((!((rankAtom (directSourceRanks P) 45 == rankAtom (directSourceRanks P) 49)) || ((rankAtom (directSourceRanks P) 58).ult (rankAtom (directSourceRanks P) 62)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (62 : Fin 78) (45 : Fin 78)
    (58 : Fin 78) (49 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (6 : Fin 13) (8 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (58 : Fin 78) (49 : Fin 78) (45 : Fin 78)
    (62 : Fin 78) (43 : Fin 78) (71 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1811` (kalmanson). -/
theorem directSource_h1811 :
    ((!((rankAtom (directSourceRanks P) 62 == rankAtom (directSourceRanks P) 58)) || ((rankAtom (directSourceRanks P) 49).ult (rankAtom (directSourceRanks P) 45)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (45 : Fin 78) (62 : Fin 78)
    (49 : Fin 78) (58 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (6 : Fin 13) (8 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (58 : Fin 78) (49 : Fin 78) (45 : Fin 78)
    (62 : Fin 78) (43 : Fin 78) (71 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1812` (kalmanson). -/
theorem directSource_h1812 :
    ((!((rankAtom (directSourceRanks P) 46 == rankAtom (directSourceRanks P) 47)) || ((rankAtom (directSourceRanks P) 59).ult (rankAtom (directSourceRanks P) 60)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (60 : Fin 78) (46 : Fin 78)
    (59 : Fin 78) (47 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (6 : Fin 13) (9 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (59 : Fin 78) (47 : Fin 78) (46 : Fin 78)
    (60 : Fin 78) (43 : Fin 78) (72 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1813` (kalmanson). -/
theorem directSource_h1813 :
    ((!((rankAtom (directSourceRanks P) 46 == rankAtom (directSourceRanks P) 48)) || ((rankAtom (directSourceRanks P) 59).ult (rankAtom (directSourceRanks P) 61)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (61 : Fin 78) (46 : Fin 78)
    (59 : Fin 78) (48 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (6 : Fin 13) (9 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (59 : Fin 78) (48 : Fin 78) (46 : Fin 78)
    (61 : Fin 78) (43 : Fin 78) (73 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1814` (kalmanson). -/
theorem directSource_h1814 :
    ((!((rankAtom (directSourceRanks P) 46 == rankAtom (directSourceRanks P) 49)) || ((rankAtom (directSourceRanks P) 59).ult (rankAtom (directSourceRanks P) 62)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (62 : Fin 78) (46 : Fin 78)
    (59 : Fin 78) (49 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (6 : Fin 13) (9 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (59 : Fin 78) (49 : Fin 78) (46 : Fin 78)
    (62 : Fin 78) (43 : Fin 78) (74 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1815` (kalmanson). -/
theorem directSource_h1815 :
    ((!((rankAtom (directSourceRanks P) 46 == rankAtom (directSourceRanks P) 59)) || ((rankAtom (directSourceRanks P) 49).ult (rankAtom (directSourceRanks P) 62)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (62 : Fin 78) (46 : Fin 78)
    (49 : Fin 78) (59 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (6 : Fin 13) (9 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (59 : Fin 78) (49 : Fin 78) (46 : Fin 78)
    (62 : Fin 78) (43 : Fin 78) (74 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1816` (kalmanson). -/
theorem directSource_h1816 :
    ((!((rankAtom (directSourceRanks P) 47 == rankAtom (directSourceRanks P) 48)) || ((rankAtom (directSourceRanks P) 60).ult (rankAtom (directSourceRanks P) 61)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (61 : Fin 78) (47 : Fin 78)
    (60 : Fin 78) (48 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (6 : Fin 13) (10 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (60 : Fin 78) (48 : Fin 78) (47 : Fin 78)
    (61 : Fin 78) (43 : Fin 78) (75 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1817` (kalmanson). -/
theorem directSource_h1817 :
    ((!((rankAtom (directSourceRanks P) 47 == rankAtom (directSourceRanks P) 49)) || ((rankAtom (directSourceRanks P) 60).ult (rankAtom (directSourceRanks P) 62)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (62 : Fin 78) (47 : Fin 78)
    (60 : Fin 78) (49 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (6 : Fin 13) (10 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (60 : Fin 78) (49 : Fin 78) (47 : Fin 78)
    (62 : Fin 78) (43 : Fin 78) (76 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1818` (kalmanson). -/
theorem directSource_h1818 :
    ((!((rankAtom (directSourceRanks P) 47 == rankAtom (directSourceRanks P) 60)) || ((rankAtom (directSourceRanks P) 49).ult (rankAtom (directSourceRanks P) 62)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (62 : Fin 78) (47 : Fin 78)
    (49 : Fin 78) (60 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (6 : Fin 13) (10 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (60 : Fin 78) (49 : Fin 78) (47 : Fin 78)
    (62 : Fin 78) (43 : Fin 78) (76 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1819` (kalmanson). -/
theorem directSource_h1819 :
    ((!((rankAtom (directSourceRanks P) 48 == rankAtom (directSourceRanks P) 49)) || ((rankAtom (directSourceRanks P) 61).ult (rankAtom (directSourceRanks P) 62)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (62 : Fin 78) (48 : Fin 78)
    (61 : Fin 78) (49 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (6 : Fin 13) (11 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (61 : Fin 78) (49 : Fin 78) (48 : Fin 78)
    (62 : Fin 78) (43 : Fin 78) (77 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1820` (kalmanson). -/
theorem directSource_h1820 :
    ((!((rankAtom (directSourceRanks P) 48 == rankAtom (directSourceRanks P) 61)) || ((rankAtom (directSourceRanks P) 49).ult (rankAtom (directSourceRanks P) 62)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (62 : Fin 78) (48 : Fin 78)
    (49 : Fin 78) (61 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (6 : Fin 13) (11 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (61 : Fin 78) (49 : Fin 78) (48 : Fin 78)
    (62 : Fin 78) (43 : Fin 78) (77 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1821` (kalmanson). -/
theorem directSource_h1821 :
    ((!((rankAtom (directSourceRanks P) 45 == rankAtom (directSourceRanks P) 68)) || ((rankAtom (directSourceRanks P) 44).ult (rankAtom (directSourceRanks P) 64)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (64 : Fin 78) (45 : Fin 78)
    (44 : Fin 78) (68 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (7 : Fin 13) (8 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (63 : Fin 78) (46 : Fin 78) (45 : Fin 78)
    (64 : Fin 78) (44 : Fin 78) (68 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1822` (kalmanson). -/
theorem directSource_h1822 :
    ((!((rankAtom (directSourceRanks P) 45 == rankAtom (directSourceRanks P) 46)) || ((rankAtom (directSourceRanks P) 63).ult (rankAtom (directSourceRanks P) 64)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (64 : Fin 78) (45 : Fin 78)
    (63 : Fin 78) (46 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (7 : Fin 13) (8 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (63 : Fin 78) (46 : Fin 78) (45 : Fin 78)
    (64 : Fin 78) (44 : Fin 78) (68 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1823` (kalmanson). -/
theorem directSource_h1823 :
    ((!((rankAtom (directSourceRanks P) 45 == rankAtom (directSourceRanks P) 47)) || ((rankAtom (directSourceRanks P) 63).ult (rankAtom (directSourceRanks P) 65)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (65 : Fin 78) (45 : Fin 78)
    (63 : Fin 78) (47 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (7 : Fin 13) (8 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (63 : Fin 78) (47 : Fin 78) (45 : Fin 78)
    (65 : Fin 78) (44 : Fin 78) (69 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1824` (kalmanson). -/
theorem directSource_h1824 :
    ((!((rankAtom (directSourceRanks P) 45 == rankAtom (directSourceRanks P) 48)) || ((rankAtom (directSourceRanks P) 63).ult (rankAtom (directSourceRanks P) 66)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (66 : Fin 78) (45 : Fin 78)
    (63 : Fin 78) (48 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (7 : Fin 13) (8 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (63 : Fin 78) (48 : Fin 78) (45 : Fin 78)
    (66 : Fin 78) (44 : Fin 78) (70 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1825` (kalmanson). -/
theorem directSource_h1825 :
    ((!((rankAtom (directSourceRanks P) 45 == rankAtom (directSourceRanks P) 71)) || ((rankAtom (directSourceRanks P) 44).ult (rankAtom (directSourceRanks P) 67)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (67 : Fin 78) (45 : Fin 78)
    (44 : Fin 78) (71 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (7 : Fin 13) (8 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (63 : Fin 78) (49 : Fin 78) (45 : Fin 78)
    (67 : Fin 78) (44 : Fin 78) (71 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1826` (kalmanson). -/
theorem directSource_h1826 :
    ((!((rankAtom (directSourceRanks P) 45 == rankAtom (directSourceRanks P) 49)) || ((rankAtom (directSourceRanks P) 63).ult (rankAtom (directSourceRanks P) 67)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (67 : Fin 78) (45 : Fin 78)
    (63 : Fin 78) (49 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (7 : Fin 13) (8 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (63 : Fin 78) (49 : Fin 78) (45 : Fin 78)
    (67 : Fin 78) (44 : Fin 78) (71 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1827` (kalmanson). -/
theorem directSource_h1827 :
    ((!((rankAtom (directSourceRanks P) 46 == rankAtom (directSourceRanks P) 47)) || ((rankAtom (directSourceRanks P) 64).ult (rankAtom (directSourceRanks P) 65)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (65 : Fin 78) (46 : Fin 78)
    (64 : Fin 78) (47 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (7 : Fin 13) (9 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (64 : Fin 78) (47 : Fin 78) (46 : Fin 78)
    (65 : Fin 78) (44 : Fin 78) (72 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1828` (kalmanson). -/
theorem directSource_h1828 :
    ((!((rankAtom (directSourceRanks P) 46 == rankAtom (directSourceRanks P) 48)) || ((rankAtom (directSourceRanks P) 64).ult (rankAtom (directSourceRanks P) 66)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (66 : Fin 78) (46 : Fin 78)
    (64 : Fin 78) (48 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (7 : Fin 13) (9 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (64 : Fin 78) (48 : Fin 78) (46 : Fin 78)
    (66 : Fin 78) (44 : Fin 78) (73 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1829` (kalmanson). -/
theorem directSource_h1829 :
    ((!((rankAtom (directSourceRanks P) 46 == rankAtom (directSourceRanks P) 49)) || ((rankAtom (directSourceRanks P) 64).ult (rankAtom (directSourceRanks P) 67)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (67 : Fin 78) (46 : Fin 78)
    (64 : Fin 78) (49 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (7 : Fin 13) (9 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (64 : Fin 78) (49 : Fin 78) (46 : Fin 78)
    (67 : Fin 78) (44 : Fin 78) (74 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1830` (kalmanson). -/
theorem directSource_h1830 :
    ((!((rankAtom (directSourceRanks P) 47 == rankAtom (directSourceRanks P) 48)) || ((rankAtom (directSourceRanks P) 65).ult (rankAtom (directSourceRanks P) 66)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (66 : Fin 78) (47 : Fin 78)
    (65 : Fin 78) (48 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (7 : Fin 13) (10 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (65 : Fin 78) (48 : Fin 78) (47 : Fin 78)
    (66 : Fin 78) (44 : Fin 78) (75 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1831` (kalmanson). -/
theorem directSource_h1831 :
    ((!((rankAtom (directSourceRanks P) 47 == rankAtom (directSourceRanks P) 49)) || ((rankAtom (directSourceRanks P) 65).ult (rankAtom (directSourceRanks P) 67)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (67 : Fin 78) (47 : Fin 78)
    (65 : Fin 78) (49 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (7 : Fin 13) (10 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (65 : Fin 78) (49 : Fin 78) (47 : Fin 78)
    (67 : Fin 78) (44 : Fin 78) (76 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1832` (kalmanson). -/
theorem directSource_h1832 :
    ((!((rankAtom (directSourceRanks P) 48 == rankAtom (directSourceRanks P) 49)) || ((rankAtom (directSourceRanks P) 66).ult (rankAtom (directSourceRanks P) 67)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (67 : Fin 78) (48 : Fin 78)
    (66 : Fin 78) (49 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (7 : Fin 13) (11 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (66 : Fin 78) (49 : Fin 78) (48 : Fin 78)
    (67 : Fin 78) (44 : Fin 78) (77 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1833` (kalmanson). -/
theorem directSource_h1833 :
    ((!((rankAtom (directSourceRanks P) 46 == rankAtom (directSourceRanks P) 47)) || ((rankAtom (directSourceRanks P) 68).ult (rankAtom (directSourceRanks P) 69)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (69 : Fin 78) (46 : Fin 78)
    (68 : Fin 78) (47 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (8 : Fin 13) (9 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (68 : Fin 78) (47 : Fin 78) (46 : Fin 78)
    (69 : Fin 78) (45 : Fin 78) (72 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1834` (kalmanson). -/
theorem directSource_h1834 :
    ((!((rankAtom (directSourceRanks P) 46 == rankAtom (directSourceRanks P) 48)) || ((rankAtom (directSourceRanks P) 68).ult (rankAtom (directSourceRanks P) 70)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (70 : Fin 78) (46 : Fin 78)
    (68 : Fin 78) (48 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (8 : Fin 13) (9 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (68 : Fin 78) (48 : Fin 78) (46 : Fin 78)
    (70 : Fin 78) (45 : Fin 78) (73 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1835` (kalmanson). -/
theorem directSource_h1835 :
    ((!((rankAtom (directSourceRanks P) 46 == rankAtom (directSourceRanks P) 49)) || ((rankAtom (directSourceRanks P) 68).ult (rankAtom (directSourceRanks P) 71)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (71 : Fin 78) (46 : Fin 78)
    (68 : Fin 78) (49 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (8 : Fin 13) (9 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (68 : Fin 78) (49 : Fin 78) (46 : Fin 78)
    (71 : Fin 78) (45 : Fin 78) (74 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1836` (kalmanson). -/
theorem directSource_h1836 :
    ((!((rankAtom (directSourceRanks P) 46 == rankAtom (directSourceRanks P) 68)) || ((rankAtom (directSourceRanks P) 49).ult (rankAtom (directSourceRanks P) 71)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (71 : Fin 78) (46 : Fin 78)
    (49 : Fin 78) (68 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (8 : Fin 13) (9 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (68 : Fin 78) (49 : Fin 78) (46 : Fin 78)
    (71 : Fin 78) (45 : Fin 78) (74 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1837` (kalmanson). -/
theorem directSource_h1837 :
    ((!((rankAtom (directSourceRanks P) 47 == rankAtom (directSourceRanks P) 48)) || ((rankAtom (directSourceRanks P) 69).ult (rankAtom (directSourceRanks P) 70)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (70 : Fin 78) (47 : Fin 78)
    (69 : Fin 78) (48 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (8 : Fin 13) (10 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (69 : Fin 78) (48 : Fin 78) (47 : Fin 78)
    (70 : Fin 78) (45 : Fin 78) (75 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1838` (kalmanson). -/
theorem directSource_h1838 :
    ((!((rankAtom (directSourceRanks P) 47 == rankAtom (directSourceRanks P) 49)) || ((rankAtom (directSourceRanks P) 69).ult (rankAtom (directSourceRanks P) 71)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (71 : Fin 78) (47 : Fin 78)
    (69 : Fin 78) (49 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (8 : Fin 13) (10 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (69 : Fin 78) (49 : Fin 78) (47 : Fin 78)
    (71 : Fin 78) (45 : Fin 78) (76 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1839` (kalmanson). -/
theorem directSource_h1839 :
    ((!((rankAtom (directSourceRanks P) 48 == rankAtom (directSourceRanks P) 49)) || ((rankAtom (directSourceRanks P) 70).ult (rankAtom (directSourceRanks P) 71)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (71 : Fin 78) (48 : Fin 78)
    (70 : Fin 78) (49 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (8 : Fin 13) (11 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (70 : Fin 78) (49 : Fin 78) (48 : Fin 78)
    (71 : Fin 78) (45 : Fin 78) (77 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1840` (kalmanson). -/
theorem directSource_h1840 :
    ((!((rankAtom (directSourceRanks P) 51 == rankAtom (directSourceRanks P) 50)) || ((rankAtom (directSourceRanks P) 63).ult (rankAtom (directSourceRanks P) 58)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (58 : Fin 78) (51 : Fin 78)
    (63 : Fin 78) (50 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (6 : Fin 13) (7 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (52 : Fin 78) (51 : Fin 78)
    (58 : Fin 78) (50 : Fin 78) (63 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1841` (kalmanson). -/
theorem directSource_h1841 :
    ((!((rankAtom (directSourceRanks P) 58 == rankAtom (directSourceRanks P) 50)) || ((rankAtom (directSourceRanks P) 63).ult (rankAtom (directSourceRanks P) 51)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (51 : Fin 78) (58 : Fin 78)
    (63 : Fin 78) (50 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (6 : Fin 13) (7 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (52 : Fin 78) (51 : Fin 78)
    (58 : Fin 78) (50 : Fin 78) (63 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1842` (kalmanson). -/
theorem directSource_h1842 :
    ((!((rankAtom (directSourceRanks P) 51 == rankAtom (directSourceRanks P) 52)) || ((rankAtom (directSourceRanks P) 57).ult (rankAtom (directSourceRanks P) 58)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (58 : Fin 78) (51 : Fin 78)
    (57 : Fin 78) (52 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (6 : Fin 13) (7 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (52 : Fin 78) (51 : Fin 78)
    (58 : Fin 78) (50 : Fin 78) (63 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1843` (kalmanson). -/
theorem directSource_h1843 :
    ((!((rankAtom (directSourceRanks P) 51 == rankAtom (directSourceRanks P) 57)) || ((rankAtom (directSourceRanks P) 52).ult (rankAtom (directSourceRanks P) 58)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (58 : Fin 78) (51 : Fin 78)
    (52 : Fin 78) (57 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (6 : Fin 13) (7 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (52 : Fin 78) (51 : Fin 78)
    (58 : Fin 78) (50 : Fin 78) (63 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1844` (kalmanson). -/
theorem directSource_h1844 :
    ((!((rankAtom (directSourceRanks P) 58 == rankAtom (directSourceRanks P) 57)) || ((rankAtom (directSourceRanks P) 52).ult (rankAtom (directSourceRanks P) 51)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (51 : Fin 78) (58 : Fin 78)
    (52 : Fin 78) (57 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (6 : Fin 13) (7 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (52 : Fin 78) (51 : Fin 78)
    (58 : Fin 78) (50 : Fin 78) (63 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1845` (kalmanson). -/
theorem directSource_h1845 :
    ((!((rankAtom (directSourceRanks P) 51 == rankAtom (directSourceRanks P) 50)) || ((rankAtom (directSourceRanks P) 64).ult (rankAtom (directSourceRanks P) 59)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (59 : Fin 78) (51 : Fin 78)
    (64 : Fin 78) (50 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (6 : Fin 13) (7 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (53 : Fin 78) (51 : Fin 78)
    (59 : Fin 78) (50 : Fin 78) (64 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1846` (kalmanson). -/
theorem directSource_h1846 :
    ((!((rankAtom (directSourceRanks P) 59 == rankAtom (directSourceRanks P) 50)) || ((rankAtom (directSourceRanks P) 64).ult (rankAtom (directSourceRanks P) 51)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (51 : Fin 78) (59 : Fin 78)
    (64 : Fin 78) (50 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (6 : Fin 13) (7 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (53 : Fin 78) (51 : Fin 78)
    (59 : Fin 78) (50 : Fin 78) (64 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1847` (kalmanson). -/
theorem directSource_h1847 :
    ((!((rankAtom (directSourceRanks P) 51 == rankAtom (directSourceRanks P) 53)) || ((rankAtom (directSourceRanks P) 57).ult (rankAtom (directSourceRanks P) 59)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (59 : Fin 78) (51 : Fin 78)
    (57 : Fin 78) (53 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (6 : Fin 13) (7 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (53 : Fin 78) (51 : Fin 78)
    (59 : Fin 78) (50 : Fin 78) (64 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1848` (kalmanson). -/
theorem directSource_h1848 :
    ((!((rankAtom (directSourceRanks P) 51 == rankAtom (directSourceRanks P) 57)) || ((rankAtom (directSourceRanks P) 53).ult (rankAtom (directSourceRanks P) 59)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (59 : Fin 78) (51 : Fin 78)
    (53 : Fin 78) (57 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (6 : Fin 13) (7 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (53 : Fin 78) (51 : Fin 78)
    (59 : Fin 78) (50 : Fin 78) (64 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1849` (kalmanson). -/
theorem directSource_h1849 :
    ((!((rankAtom (directSourceRanks P) 59 == rankAtom (directSourceRanks P) 57)) || ((rankAtom (directSourceRanks P) 53).ult (rankAtom (directSourceRanks P) 51)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (51 : Fin 78) (59 : Fin 78)
    (53 : Fin 78) (57 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (6 : Fin 13) (7 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (53 : Fin 78) (51 : Fin 78)
    (59 : Fin 78) (50 : Fin 78) (64 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1850` (kalmanson). -/
theorem directSource_h1850 :
    ((!((rankAtom (directSourceRanks P) 51 == rankAtom (directSourceRanks P) 50)) || ((rankAtom (directSourceRanks P) 65).ult (rankAtom (directSourceRanks P) 60)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (60 : Fin 78) (51 : Fin 78)
    (65 : Fin 78) (50 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (6 : Fin 13) (7 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (54 : Fin 78) (51 : Fin 78)
    (60 : Fin 78) (50 : Fin 78) (65 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1851` (kalmanson). -/
theorem directSource_h1851 :
    ((!((rankAtom (directSourceRanks P) 60 == rankAtom (directSourceRanks P) 50)) || ((rankAtom (directSourceRanks P) 65).ult (rankAtom (directSourceRanks P) 51)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (51 : Fin 78) (60 : Fin 78)
    (65 : Fin 78) (50 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (6 : Fin 13) (7 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (54 : Fin 78) (51 : Fin 78)
    (60 : Fin 78) (50 : Fin 78) (65 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1852` (kalmanson). -/
theorem directSource_h1852 :
    ((!((rankAtom (directSourceRanks P) 51 == rankAtom (directSourceRanks P) 54)) || ((rankAtom (directSourceRanks P) 57).ult (rankAtom (directSourceRanks P) 60)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (60 : Fin 78) (51 : Fin 78)
    (57 : Fin 78) (54 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (6 : Fin 13) (7 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (54 : Fin 78) (51 : Fin 78)
    (60 : Fin 78) (50 : Fin 78) (65 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1853` (kalmanson). -/
theorem directSource_h1853 :
    ((!((rankAtom (directSourceRanks P) 51 == rankAtom (directSourceRanks P) 57)) || ((rankAtom (directSourceRanks P) 54).ult (rankAtom (directSourceRanks P) 60)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (60 : Fin 78) (51 : Fin 78)
    (54 : Fin 78) (57 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (6 : Fin 13) (7 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (54 : Fin 78) (51 : Fin 78)
    (60 : Fin 78) (50 : Fin 78) (65 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1854` (kalmanson). -/
theorem directSource_h1854 :
    ((!((rankAtom (directSourceRanks P) 60 == rankAtom (directSourceRanks P) 57)) || ((rankAtom (directSourceRanks P) 54).ult (rankAtom (directSourceRanks P) 51)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (51 : Fin 78) (60 : Fin 78)
    (54 : Fin 78) (57 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (6 : Fin 13) (7 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (54 : Fin 78) (51 : Fin 78)
    (60 : Fin 78) (50 : Fin 78) (65 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1855` (kalmanson). -/
theorem directSource_h1855 :
    ((!((rankAtom (directSourceRanks P) 51 == rankAtom (directSourceRanks P) 50)) || ((rankAtom (directSourceRanks P) 66).ult (rankAtom (directSourceRanks P) 61)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (61 : Fin 78) (51 : Fin 78)
    (66 : Fin 78) (50 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (5 : Fin 13) (6 : Fin 13) (7 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (55 : Fin 78) (51 : Fin 78)
    (61 : Fin 78) (50 : Fin 78) (66 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

end

end ATailExactFiveCard13CnfIngressScratch
end Problem97
