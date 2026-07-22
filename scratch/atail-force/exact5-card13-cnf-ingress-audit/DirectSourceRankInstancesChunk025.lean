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

/-- Exact pass-5 source assertion `h1600` (kalmanson). -/
theorem directSource_h1600 :
    ((!((rankAtom (directSourceRanks P) 47 == rankAtom (directSourceRanks P) 43)) || ((rankAtom (directSourceRanks P) 39).ult (rankAtom (directSourceRanks P) 35)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (35 : Fin 78) (47 : Fin 78)
    (39 : Fin 78) (43 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (4 : Fin 13) (6 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (43 : Fin 78) (39 : Fin 78) (35 : Fin 78)
    (47 : Fin 78) (33 : Fin 78) (60 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1601` (kalmanson). -/
theorem directSource_h1601 :
    ((!((rankAtom (directSourceRanks P) 48 == rankAtom (directSourceRanks P) 33)) || ((rankAtom (directSourceRanks P) 61).ult (rankAtom (directSourceRanks P) 35)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (35 : Fin 78) (48 : Fin 78)
    (61 : Fin 78) (33 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (4 : Fin 13) (6 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (43 : Fin 78) (40 : Fin 78) (35 : Fin 78)
    (48 : Fin 78) (33 : Fin 78) (61 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1602` (kalmanson). -/
theorem directSource_h1602 :
    ((!((rankAtom (directSourceRanks P) 35 == rankAtom (directSourceRanks P) 43)) || ((rankAtom (directSourceRanks P) 40).ult (rankAtom (directSourceRanks P) 48)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (48 : Fin 78) (35 : Fin 78)
    (40 : Fin 78) (43 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (4 : Fin 13) (6 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (43 : Fin 78) (40 : Fin 78) (35 : Fin 78)
    (48 : Fin 78) (33 : Fin 78) (61 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1603` (kalmanson). -/
theorem directSource_h1603 :
    ((!((rankAtom (directSourceRanks P) 48 == rankAtom (directSourceRanks P) 43)) || ((rankAtom (directSourceRanks P) 40).ult (rankAtom (directSourceRanks P) 35)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (35 : Fin 78) (48 : Fin 78)
    (40 : Fin 78) (43 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (4 : Fin 13) (6 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (43 : Fin 78) (40 : Fin 78) (35 : Fin 78)
    (48 : Fin 78) (33 : Fin 78) (61 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1604` (kalmanson). -/
theorem directSource_h1604 :
    ((!((rankAtom (directSourceRanks P) 49 == rankAtom (directSourceRanks P) 33)) || ((rankAtom (directSourceRanks P) 62).ult (rankAtom (directSourceRanks P) 35)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (35 : Fin 78) (49 : Fin 78)
    (62 : Fin 78) (33 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (4 : Fin 13) (6 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (43 : Fin 78) (41 : Fin 78) (35 : Fin 78)
    (49 : Fin 78) (33 : Fin 78) (62 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1605` (kalmanson). -/
theorem directSource_h1605 :
    ((!((rankAtom (directSourceRanks P) 35 == rankAtom (directSourceRanks P) 43)) || ((rankAtom (directSourceRanks P) 41).ult (rankAtom (directSourceRanks P) 49)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (49 : Fin 78) (35 : Fin 78)
    (41 : Fin 78) (43 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (4 : Fin 13) (6 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (43 : Fin 78) (41 : Fin 78) (35 : Fin 78)
    (49 : Fin 78) (33 : Fin 78) (62 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1606` (kalmanson). -/
theorem directSource_h1606 :
    ((!((rankAtom (directSourceRanks P) 49 == rankAtom (directSourceRanks P) 43)) || ((rankAtom (directSourceRanks P) 41).ult (rankAtom (directSourceRanks P) 35)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (35 : Fin 78) (49 : Fin 78)
    (41 : Fin 78) (43 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (4 : Fin 13) (6 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (43 : Fin 78) (41 : Fin 78) (35 : Fin 78)
    (49 : Fin 78) (33 : Fin 78) (62 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1607` (kalmanson). -/
theorem directSource_h1607 :
    ((!((rankAtom (directSourceRanks P) 45 == rankAtom (directSourceRanks P) 37)) || ((rankAtom (directSourceRanks P) 44).ult (rankAtom (directSourceRanks P) 36)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (36 : Fin 78) (45 : Fin 78)
    (44 : Fin 78) (37 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (4 : Fin 13) (7 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (44 : Fin 78) (37 : Fin 78) (36 : Fin 78)
    (45 : Fin 78) (33 : Fin 78) (63 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1608` (kalmanson). -/
theorem directSource_h1608 :
    ((!((rankAtom (directSourceRanks P) 46 == rankAtom (directSourceRanks P) 33)) || ((rankAtom (directSourceRanks P) 64).ult (rankAtom (directSourceRanks P) 36)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (36 : Fin 78) (46 : Fin 78)
    (64 : Fin 78) (33 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (4 : Fin 13) (7 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (44 : Fin 78) (38 : Fin 78) (36 : Fin 78)
    (46 : Fin 78) (33 : Fin 78) (64 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1609` (kalmanson). -/
theorem directSource_h1609 :
    ((!((rankAtom (directSourceRanks P) 46 == rankAtom (directSourceRanks P) 44)) || ((rankAtom (directSourceRanks P) 38).ult (rankAtom (directSourceRanks P) 36)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (36 : Fin 78) (46 : Fin 78)
    (38 : Fin 78) (44 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (4 : Fin 13) (7 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (44 : Fin 78) (38 : Fin 78) (36 : Fin 78)
    (46 : Fin 78) (33 : Fin 78) (64 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1610` (kalmanson). -/
theorem directSource_h1610 :
    ((!((rankAtom (directSourceRanks P) 47 == rankAtom (directSourceRanks P) 33)) || ((rankAtom (directSourceRanks P) 65).ult (rankAtom (directSourceRanks P) 36)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (36 : Fin 78) (47 : Fin 78)
    (65 : Fin 78) (33 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (4 : Fin 13) (7 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (44 : Fin 78) (39 : Fin 78) (36 : Fin 78)
    (47 : Fin 78) (33 : Fin 78) (65 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1611` (kalmanson). -/
theorem directSource_h1611 :
    ((!((rankAtom (directSourceRanks P) 47 == rankAtom (directSourceRanks P) 44)) || ((rankAtom (directSourceRanks P) 39).ult (rankAtom (directSourceRanks P) 36)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (36 : Fin 78) (47 : Fin 78)
    (39 : Fin 78) (44 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (4 : Fin 13) (7 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (44 : Fin 78) (39 : Fin 78) (36 : Fin 78)
    (47 : Fin 78) (33 : Fin 78) (65 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1612` (kalmanson). -/
theorem directSource_h1612 :
    ((!((rankAtom (directSourceRanks P) 48 == rankAtom (directSourceRanks P) 33)) || ((rankAtom (directSourceRanks P) 66).ult (rankAtom (directSourceRanks P) 36)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (36 : Fin 78) (48 : Fin 78)
    (66 : Fin 78) (33 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (4 : Fin 13) (7 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (44 : Fin 78) (40 : Fin 78) (36 : Fin 78)
    (48 : Fin 78) (33 : Fin 78) (66 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1613` (kalmanson). -/
theorem directSource_h1613 :
    ((!((rankAtom (directSourceRanks P) 48 == rankAtom (directSourceRanks P) 44)) || ((rankAtom (directSourceRanks P) 40).ult (rankAtom (directSourceRanks P) 36)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (36 : Fin 78) (48 : Fin 78)
    (40 : Fin 78) (44 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (4 : Fin 13) (7 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (44 : Fin 78) (40 : Fin 78) (36 : Fin 78)
    (48 : Fin 78) (33 : Fin 78) (66 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1614` (kalmanson). -/
theorem directSource_h1614 :
    ((!((rankAtom (directSourceRanks P) 49 == rankAtom (directSourceRanks P) 33)) || ((rankAtom (directSourceRanks P) 67).ult (rankAtom (directSourceRanks P) 36)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (36 : Fin 78) (49 : Fin 78)
    (67 : Fin 78) (33 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (4 : Fin 13) (7 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (44 : Fin 78) (41 : Fin 78) (36 : Fin 78)
    (49 : Fin 78) (33 : Fin 78) (67 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1615` (kalmanson). -/
theorem directSource_h1615 :
    ((!((rankAtom (directSourceRanks P) 49 == rankAtom (directSourceRanks P) 44)) || ((rankAtom (directSourceRanks P) 41).ult (rankAtom (directSourceRanks P) 36)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (36 : Fin 78) (49 : Fin 78)
    (41 : Fin 78) (44 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (4 : Fin 13) (7 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (44 : Fin 78) (41 : Fin 78) (36 : Fin 78)
    (49 : Fin 78) (33 : Fin 78) (67 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1616` (kalmanson). -/
theorem directSource_h1616 :
    ((!((rankAtom (directSourceRanks P) 37 == rankAtom (directSourceRanks P) 45)) || ((rankAtom (directSourceRanks P) 38).ult (rankAtom (directSourceRanks P) 46)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (46 : Fin 78) (37 : Fin 78)
    (38 : Fin 78) (45 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (4 : Fin 13) (8 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (45 : Fin 78) (38 : Fin 78) (37 : Fin 78)
    (46 : Fin 78) (33 : Fin 78) (68 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1617` (kalmanson). -/
theorem directSource_h1617 :
    ((!((rankAtom (directSourceRanks P) 46 == rankAtom (directSourceRanks P) 45)) || ((rankAtom (directSourceRanks P) 38).ult (rankAtom (directSourceRanks P) 37)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (37 : Fin 78) (46 : Fin 78)
    (38 : Fin 78) (45 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (4 : Fin 13) (8 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (45 : Fin 78) (38 : Fin 78) (37 : Fin 78)
    (46 : Fin 78) (33 : Fin 78) (68 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1618` (kalmanson). -/
theorem directSource_h1618 :
    ((!((rankAtom (directSourceRanks P) 37 == rankAtom (directSourceRanks P) 45)) || ((rankAtom (directSourceRanks P) 39).ult (rankAtom (directSourceRanks P) 47)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (47 : Fin 78) (37 : Fin 78)
    (39 : Fin 78) (45 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (4 : Fin 13) (8 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (45 : Fin 78) (39 : Fin 78) (37 : Fin 78)
    (47 : Fin 78) (33 : Fin 78) (69 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1619` (kalmanson). -/
theorem directSource_h1619 :
    ((!((rankAtom (directSourceRanks P) 47 == rankAtom (directSourceRanks P) 45)) || ((rankAtom (directSourceRanks P) 39).ult (rankAtom (directSourceRanks P) 37)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (37 : Fin 78) (47 : Fin 78)
    (39 : Fin 78) (45 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (4 : Fin 13) (8 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (45 : Fin 78) (39 : Fin 78) (37 : Fin 78)
    (47 : Fin 78) (33 : Fin 78) (69 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1620` (kalmanson). -/
theorem directSource_h1620 :
    ((!((rankAtom (directSourceRanks P) 37 == rankAtom (directSourceRanks P) 45)) || ((rankAtom (directSourceRanks P) 40).ult (rankAtom (directSourceRanks P) 48)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (48 : Fin 78) (37 : Fin 78)
    (40 : Fin 78) (45 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (4 : Fin 13) (8 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (45 : Fin 78) (40 : Fin 78) (37 : Fin 78)
    (48 : Fin 78) (33 : Fin 78) (70 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1621` (kalmanson). -/
theorem directSource_h1621 :
    ((!((rankAtom (directSourceRanks P) 48 == rankAtom (directSourceRanks P) 45)) || ((rankAtom (directSourceRanks P) 40).ult (rankAtom (directSourceRanks P) 37)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (37 : Fin 78) (48 : Fin 78)
    (40 : Fin 78) (45 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (4 : Fin 13) (8 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (45 : Fin 78) (40 : Fin 78) (37 : Fin 78)
    (48 : Fin 78) (33 : Fin 78) (70 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1622` (kalmanson). -/
theorem directSource_h1622 :
    ((!((rankAtom (directSourceRanks P) 49 == rankAtom (directSourceRanks P) 33)) || ((rankAtom (directSourceRanks P) 71).ult (rankAtom (directSourceRanks P) 37)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (37 : Fin 78) (49 : Fin 78)
    (71 : Fin 78) (33 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (4 : Fin 13) (8 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (45 : Fin 78) (41 : Fin 78) (37 : Fin 78)
    (49 : Fin 78) (33 : Fin 78) (71 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1623` (kalmanson). -/
theorem directSource_h1623 :
    ((!((rankAtom (directSourceRanks P) 37 == rankAtom (directSourceRanks P) 45)) || ((rankAtom (directSourceRanks P) 41).ult (rankAtom (directSourceRanks P) 49)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (49 : Fin 78) (37 : Fin 78)
    (41 : Fin 78) (45 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (4 : Fin 13) (8 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (45 : Fin 78) (41 : Fin 78) (37 : Fin 78)
    (49 : Fin 78) (33 : Fin 78) (71 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1624` (kalmanson). -/
theorem directSource_h1624 :
    ((!((rankAtom (directSourceRanks P) 49 == rankAtom (directSourceRanks P) 45)) || ((rankAtom (directSourceRanks P) 41).ult (rankAtom (directSourceRanks P) 37)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (37 : Fin 78) (49 : Fin 78)
    (41 : Fin 78) (45 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (4 : Fin 13) (8 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (45 : Fin 78) (41 : Fin 78) (37 : Fin 78)
    (49 : Fin 78) (33 : Fin 78) (71 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1625` (kalmanson). -/
theorem directSource_h1625 :
    ((!((rankAtom (directSourceRanks P) 47 == rankAtom (directSourceRanks P) 46)) || ((rankAtom (directSourceRanks P) 39).ult (rankAtom (directSourceRanks P) 38)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (38 : Fin 78) (47 : Fin 78)
    (39 : Fin 78) (46 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (4 : Fin 13) (9 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (46 : Fin 78) (39 : Fin 78) (38 : Fin 78)
    (47 : Fin 78) (33 : Fin 78) (72 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1626` (kalmanson). -/
theorem directSource_h1626 :
    ((!((rankAtom (directSourceRanks P) 48 == rankAtom (directSourceRanks P) 46)) || ((rankAtom (directSourceRanks P) 40).ult (rankAtom (directSourceRanks P) 38)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (38 : Fin 78) (48 : Fin 78)
    (40 : Fin 78) (46 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (4 : Fin 13) (9 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (46 : Fin 78) (40 : Fin 78) (38 : Fin 78)
    (48 : Fin 78) (33 : Fin 78) (73 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1627` (kalmanson). -/
theorem directSource_h1627 :
    ((!((rankAtom (directSourceRanks P) 49 == rankAtom (directSourceRanks P) 46)) || ((rankAtom (directSourceRanks P) 41).ult (rankAtom (directSourceRanks P) 38)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (38 : Fin 78) (49 : Fin 78)
    (41 : Fin 78) (46 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (4 : Fin 13) (9 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (46 : Fin 78) (41 : Fin 78) (38 : Fin 78)
    (49 : Fin 78) (33 : Fin 78) (74 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1628` (kalmanson). -/
theorem directSource_h1628 :
    ((!((rankAtom (directSourceRanks P) 48 == rankAtom (directSourceRanks P) 47)) || ((rankAtom (directSourceRanks P) 40).ult (rankAtom (directSourceRanks P) 39)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (39 : Fin 78) (48 : Fin 78)
    (40 : Fin 78) (47 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (4 : Fin 13) (10 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (47 : Fin 78) (40 : Fin 78) (39 : Fin 78)
    (48 : Fin 78) (33 : Fin 78) (75 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1629` (kalmanson). -/
theorem directSource_h1629 :
    ((!((rankAtom (directSourceRanks P) 49 == rankAtom (directSourceRanks P) 47)) || ((rankAtom (directSourceRanks P) 41).ult (rankAtom (directSourceRanks P) 39)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (39 : Fin 78) (49 : Fin 78)
    (41 : Fin 78) (47 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (4 : Fin 13) (10 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (47 : Fin 78) (41 : Fin 78) (39 : Fin 78)
    (49 : Fin 78) (33 : Fin 78) (76 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1630` (kalmanson). -/
theorem directSource_h1630 :
    ((!((rankAtom (directSourceRanks P) 49 == rankAtom (directSourceRanks P) 48)) || ((rankAtom (directSourceRanks P) 41).ult (rankAtom (directSourceRanks P) 40)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (40 : Fin 78) (49 : Fin 78)
    (41 : Fin 78) (48 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (4 : Fin 13) (11 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (48 : Fin 78) (41 : Fin 78) (40 : Fin 78)
    (49 : Fin 78) (33 : Fin 78) (77 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1631` (kalmanson). -/
theorem directSource_h1631 :
    ((!((rankAtom (directSourceRanks P) 35 == rankAtom (directSourceRanks P) 57)) || ((rankAtom (directSourceRanks P) 34).ult (rankAtom (directSourceRanks P) 51)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (51 : Fin 78) (35 : Fin 78)
    (34 : Fin 78) (57 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (5 : Fin 13) (6 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (36 : Fin 78) (35 : Fin 78)
    (51 : Fin 78) (34 : Fin 78) (57 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1632` (kalmanson). -/
theorem directSource_h1632 :
    ((!((rankAtom (directSourceRanks P) 51 == rankAtom (directSourceRanks P) 34)) || ((rankAtom (directSourceRanks P) 57).ult (rankAtom (directSourceRanks P) 35)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (35 : Fin 78) (51 : Fin 78)
    (57 : Fin 78) (34 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (5 : Fin 13) (6 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (36 : Fin 78) (35 : Fin 78)
    (51 : Fin 78) (34 : Fin 78) (57 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1633` (kalmanson). -/
theorem directSource_h1633 :
    ((!((rankAtom (directSourceRanks P) 35 == rankAtom (directSourceRanks P) 50)) || ((rankAtom (directSourceRanks P) 36).ult (rankAtom (directSourceRanks P) 51)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (51 : Fin 78) (35 : Fin 78)
    (36 : Fin 78) (50 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (5 : Fin 13) (6 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (36 : Fin 78) (35 : Fin 78)
    (51 : Fin 78) (34 : Fin 78) (57 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1634` (kalmanson). -/
theorem directSource_h1634 :
    ((!((rankAtom (directSourceRanks P) 51 == rankAtom (directSourceRanks P) 50)) || ((rankAtom (directSourceRanks P) 36).ult (rankAtom (directSourceRanks P) 35)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (35 : Fin 78) (51 : Fin 78)
    (36 : Fin 78) (50 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (5 : Fin 13) (6 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (36 : Fin 78) (35 : Fin 78)
    (51 : Fin 78) (34 : Fin 78) (57 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1635` (kalmanson). -/
theorem directSource_h1635 :
    ((!((rankAtom (directSourceRanks P) 35 == rankAtom (directSourceRanks P) 34)) || ((rankAtom (directSourceRanks P) 58).ult (rankAtom (directSourceRanks P) 52)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (52 : Fin 78) (35 : Fin 78)
    (58 : Fin 78) (34 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (5 : Fin 13) (6 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (37 : Fin 78) (35 : Fin 78)
    (52 : Fin 78) (34 : Fin 78) (58 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1636` (kalmanson). -/
theorem directSource_h1636 :
    ((!((rankAtom (directSourceRanks P) 35 == rankAtom (directSourceRanks P) 58)) || ((rankAtom (directSourceRanks P) 34).ult (rankAtom (directSourceRanks P) 52)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (52 : Fin 78) (35 : Fin 78)
    (34 : Fin 78) (58 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (5 : Fin 13) (6 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (37 : Fin 78) (35 : Fin 78)
    (52 : Fin 78) (34 : Fin 78) (58 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1637` (kalmanson). -/
theorem directSource_h1637 :
    ((!((rankAtom (directSourceRanks P) 52 == rankAtom (directSourceRanks P) 34)) || ((rankAtom (directSourceRanks P) 58).ult (rankAtom (directSourceRanks P) 35)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (35 : Fin 78) (52 : Fin 78)
    (58 : Fin 78) (34 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (5 : Fin 13) (6 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (37 : Fin 78) (35 : Fin 78)
    (52 : Fin 78) (34 : Fin 78) (58 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1638` (kalmanson). -/
theorem directSource_h1638 :
    ((!((rankAtom (directSourceRanks P) 52 == rankAtom (directSourceRanks P) 58)) || ((rankAtom (directSourceRanks P) 34).ult (rankAtom (directSourceRanks P) 35)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (35 : Fin 78) (52 : Fin 78)
    (34 : Fin 78) (58 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (5 : Fin 13) (6 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (37 : Fin 78) (35 : Fin 78)
    (52 : Fin 78) (34 : Fin 78) (58 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1639` (kalmanson). -/
theorem directSource_h1639 :
    ((!((rankAtom (directSourceRanks P) 35 == rankAtom (directSourceRanks P) 37)) || ((rankAtom (directSourceRanks P) 50).ult (rankAtom (directSourceRanks P) 52)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (52 : Fin 78) (35 : Fin 78)
    (50 : Fin 78) (37 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (5 : Fin 13) (6 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (37 : Fin 78) (35 : Fin 78)
    (52 : Fin 78) (34 : Fin 78) (58 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1640` (kalmanson). -/
theorem directSource_h1640 :
    ((!((rankAtom (directSourceRanks P) 35 == rankAtom (directSourceRanks P) 50)) || ((rankAtom (directSourceRanks P) 37).ult (rankAtom (directSourceRanks P) 52)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (52 : Fin 78) (35 : Fin 78)
    (37 : Fin 78) (50 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (5 : Fin 13) (6 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (37 : Fin 78) (35 : Fin 78)
    (52 : Fin 78) (34 : Fin 78) (58 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1641` (kalmanson). -/
theorem directSource_h1641 :
    ((!((rankAtom (directSourceRanks P) 52 == rankAtom (directSourceRanks P) 37)) || ((rankAtom (directSourceRanks P) 50).ult (rankAtom (directSourceRanks P) 35)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (35 : Fin 78) (52 : Fin 78)
    (50 : Fin 78) (37 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (5 : Fin 13) (6 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (37 : Fin 78) (35 : Fin 78)
    (52 : Fin 78) (34 : Fin 78) (58 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1642` (kalmanson). -/
theorem directSource_h1642 :
    ((!((rankAtom (directSourceRanks P) 52 == rankAtom (directSourceRanks P) 50)) || ((rankAtom (directSourceRanks P) 37).ult (rankAtom (directSourceRanks P) 35)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (35 : Fin 78) (52 : Fin 78)
    (37 : Fin 78) (50 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (5 : Fin 13) (6 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (37 : Fin 78) (35 : Fin 78)
    (52 : Fin 78) (34 : Fin 78) (58 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1643` (kalmanson). -/
theorem directSource_h1643 :
    ((!((rankAtom (directSourceRanks P) 35 == rankAtom (directSourceRanks P) 59)) || ((rankAtom (directSourceRanks P) 34).ult (rankAtom (directSourceRanks P) 53)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (53 : Fin 78) (35 : Fin 78)
    (34 : Fin 78) (59 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (5 : Fin 13) (6 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (38 : Fin 78) (35 : Fin 78)
    (53 : Fin 78) (34 : Fin 78) (59 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1644` (kalmanson). -/
theorem directSource_h1644 :
    ((!((rankAtom (directSourceRanks P) 53 == rankAtom (directSourceRanks P) 34)) || ((rankAtom (directSourceRanks P) 59).ult (rankAtom (directSourceRanks P) 35)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (35 : Fin 78) (53 : Fin 78)
    (59 : Fin 78) (34 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (5 : Fin 13) (6 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (38 : Fin 78) (35 : Fin 78)
    (53 : Fin 78) (34 : Fin 78) (59 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1645` (kalmanson). -/
theorem directSource_h1645 :
    ((!((rankAtom (directSourceRanks P) 35 == rankAtom (directSourceRanks P) 50)) || ((rankAtom (directSourceRanks P) 38).ult (rankAtom (directSourceRanks P) 53)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (53 : Fin 78) (35 : Fin 78)
    (38 : Fin 78) (50 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (5 : Fin 13) (6 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (38 : Fin 78) (35 : Fin 78)
    (53 : Fin 78) (34 : Fin 78) (59 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1646` (kalmanson). -/
theorem directSource_h1646 :
    ((!((rankAtom (directSourceRanks P) 53 == rankAtom (directSourceRanks P) 50)) || ((rankAtom (directSourceRanks P) 38).ult (rankAtom (directSourceRanks P) 35)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (35 : Fin 78) (53 : Fin 78)
    (38 : Fin 78) (50 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (5 : Fin 13) (6 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (38 : Fin 78) (35 : Fin 78)
    (53 : Fin 78) (34 : Fin 78) (59 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1647` (kalmanson). -/
theorem directSource_h1647 :
    ((!((rankAtom (directSourceRanks P) 35 == rankAtom (directSourceRanks P) 34)) || ((rankAtom (directSourceRanks P) 60).ult (rankAtom (directSourceRanks P) 54)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (54 : Fin 78) (35 : Fin 78)
    (60 : Fin 78) (34 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (5 : Fin 13) (6 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (39 : Fin 78) (35 : Fin 78)
    (54 : Fin 78) (34 : Fin 78) (60 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1648` (kalmanson). -/
theorem directSource_h1648 :
    ((!((rankAtom (directSourceRanks P) 35 == rankAtom (directSourceRanks P) 60)) || ((rankAtom (directSourceRanks P) 34).ult (rankAtom (directSourceRanks P) 54)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (54 : Fin 78) (35 : Fin 78)
    (34 : Fin 78) (60 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (5 : Fin 13) (6 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (39 : Fin 78) (35 : Fin 78)
    (54 : Fin 78) (34 : Fin 78) (60 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1649` (kalmanson). -/
theorem directSource_h1649 :
    ((!((rankAtom (directSourceRanks P) 54 == rankAtom (directSourceRanks P) 34)) || ((rankAtom (directSourceRanks P) 60).ult (rankAtom (directSourceRanks P) 35)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (35 : Fin 78) (54 : Fin 78)
    (60 : Fin 78) (34 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (5 : Fin 13) (6 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (39 : Fin 78) (35 : Fin 78)
    (54 : Fin 78) (34 : Fin 78) (60 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1650` (kalmanson). -/
theorem directSource_h1650 :
    ((!((rankAtom (directSourceRanks P) 35 == rankAtom (directSourceRanks P) 50)) || ((rankAtom (directSourceRanks P) 39).ult (rankAtom (directSourceRanks P) 54)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (54 : Fin 78) (35 : Fin 78)
    (39 : Fin 78) (50 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (5 : Fin 13) (6 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (39 : Fin 78) (35 : Fin 78)
    (54 : Fin 78) (34 : Fin 78) (60 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1651` (kalmanson). -/
theorem directSource_h1651 :
    ((!((rankAtom (directSourceRanks P) 54 == rankAtom (directSourceRanks P) 50)) || ((rankAtom (directSourceRanks P) 39).ult (rankAtom (directSourceRanks P) 35)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (35 : Fin 78) (54 : Fin 78)
    (39 : Fin 78) (50 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (5 : Fin 13) (6 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (39 : Fin 78) (35 : Fin 78)
    (54 : Fin 78) (34 : Fin 78) (60 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1652` (kalmanson). -/
theorem directSource_h1652 :
    ((!((rankAtom (directSourceRanks P) 35 == rankAtom (directSourceRanks P) 34)) || ((rankAtom (directSourceRanks P) 61).ult (rankAtom (directSourceRanks P) 55)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (55 : Fin 78) (35 : Fin 78)
    (61 : Fin 78) (34 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (5 : Fin 13) (6 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (40 : Fin 78) (35 : Fin 78)
    (55 : Fin 78) (34 : Fin 78) (61 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1653` (kalmanson). -/
theorem directSource_h1653 :
    ((!((rankAtom (directSourceRanks P) 35 == rankAtom (directSourceRanks P) 61)) || ((rankAtom (directSourceRanks P) 34).ult (rankAtom (directSourceRanks P) 55)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (55 : Fin 78) (35 : Fin 78)
    (34 : Fin 78) (61 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (5 : Fin 13) (6 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (40 : Fin 78) (35 : Fin 78)
    (55 : Fin 78) (34 : Fin 78) (61 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1654` (kalmanson). -/
theorem directSource_h1654 :
    ((!((rankAtom (directSourceRanks P) 55 == rankAtom (directSourceRanks P) 34)) || ((rankAtom (directSourceRanks P) 61).ult (rankAtom (directSourceRanks P) 35)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (35 : Fin 78) (55 : Fin 78)
    (61 : Fin 78) (34 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (5 : Fin 13) (6 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (40 : Fin 78) (35 : Fin 78)
    (55 : Fin 78) (34 : Fin 78) (61 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1655` (kalmanson). -/
theorem directSource_h1655 :
    ((!((rankAtom (directSourceRanks P) 35 == rankAtom (directSourceRanks P) 50)) || ((rankAtom (directSourceRanks P) 40).ult (rankAtom (directSourceRanks P) 55)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (55 : Fin 78) (35 : Fin 78)
    (40 : Fin 78) (50 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (5 : Fin 13) (6 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (40 : Fin 78) (35 : Fin 78)
    (55 : Fin 78) (34 : Fin 78) (61 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1656` (kalmanson). -/
theorem directSource_h1656 :
    ((!((rankAtom (directSourceRanks P) 55 == rankAtom (directSourceRanks P) 50)) || ((rankAtom (directSourceRanks P) 40).ult (rankAtom (directSourceRanks P) 35)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (35 : Fin 78) (55 : Fin 78)
    (40 : Fin 78) (50 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (5 : Fin 13) (6 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (40 : Fin 78) (35 : Fin 78)
    (55 : Fin 78) (34 : Fin 78) (61 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1657` (kalmanson). -/
theorem directSource_h1657 :
    ((!((rankAtom (directSourceRanks P) 35 == rankAtom (directSourceRanks P) 34)) || ((rankAtom (directSourceRanks P) 62).ult (rankAtom (directSourceRanks P) 56)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (56 : Fin 78) (35 : Fin 78)
    (62 : Fin 78) (34 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (5 : Fin 13) (6 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (41 : Fin 78) (35 : Fin 78)
    (56 : Fin 78) (34 : Fin 78) (62 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1658` (kalmanson). -/
theorem directSource_h1658 :
    ((!((rankAtom (directSourceRanks P) 35 == rankAtom (directSourceRanks P) 62)) || ((rankAtom (directSourceRanks P) 34).ult (rankAtom (directSourceRanks P) 56)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (56 : Fin 78) (35 : Fin 78)
    (34 : Fin 78) (62 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (5 : Fin 13) (6 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (41 : Fin 78) (35 : Fin 78)
    (56 : Fin 78) (34 : Fin 78) (62 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1659` (kalmanson). -/
theorem directSource_h1659 :
    ((!((rankAtom (directSourceRanks P) 56 == rankAtom (directSourceRanks P) 34)) || ((rankAtom (directSourceRanks P) 62).ult (rankAtom (directSourceRanks P) 35)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (35 : Fin 78) (56 : Fin 78)
    (62 : Fin 78) (34 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (5 : Fin 13) (6 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (41 : Fin 78) (35 : Fin 78)
    (56 : Fin 78) (34 : Fin 78) (62 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1660` (kalmanson). -/
theorem directSource_h1660 :
    ((!((rankAtom (directSourceRanks P) 35 == rankAtom (directSourceRanks P) 50)) || ((rankAtom (directSourceRanks P) 41).ult (rankAtom (directSourceRanks P) 56)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (56 : Fin 78) (35 : Fin 78)
    (41 : Fin 78) (50 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (5 : Fin 13) (6 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (41 : Fin 78) (35 : Fin 78)
    (56 : Fin 78) (34 : Fin 78) (62 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1661` (kalmanson). -/
theorem directSource_h1661 :
    ((!((rankAtom (directSourceRanks P) 56 == rankAtom (directSourceRanks P) 50)) || ((rankAtom (directSourceRanks P) 41).ult (rankAtom (directSourceRanks P) 35)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (35 : Fin 78) (56 : Fin 78)
    (41 : Fin 78) (50 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (5 : Fin 13) (6 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (41 : Fin 78) (35 : Fin 78)
    (56 : Fin 78) (34 : Fin 78) (62 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1662` (kalmanson). -/
theorem directSource_h1662 :
    ((!((rankAtom (directSourceRanks P) 52 == rankAtom (directSourceRanks P) 34)) || ((rankAtom (directSourceRanks P) 63).ult (rankAtom (directSourceRanks P) 36)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (36 : Fin 78) (52 : Fin 78)
    (63 : Fin 78) (34 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (5 : Fin 13) (7 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (51 : Fin 78) (37 : Fin 78) (36 : Fin 78)
    (52 : Fin 78) (34 : Fin 78) (63 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1663` (kalmanson). -/
theorem directSource_h1663 :
    ((!((rankAtom (directSourceRanks P) 52 == rankAtom (directSourceRanks P) 63)) || ((rankAtom (directSourceRanks P) 34).ult (rankAtom (directSourceRanks P) 36)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (36 : Fin 78) (52 : Fin 78)
    (34 : Fin 78) (63 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (5 : Fin 13) (7 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (51 : Fin 78) (37 : Fin 78) (36 : Fin 78)
    (52 : Fin 78) (34 : Fin 78) (63 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

end

end ATailExactFiveCard13CnfIngressScratch
end Problem97
