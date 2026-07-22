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

/-- Exact pass-5 source assertion `h1664` (kalmanson). -/
theorem directSource_h1664 :
    ((!((rankAtom (directSourceRanks P) 52 == rankAtom (directSourceRanks P) 37)) || ((rankAtom (directSourceRanks P) 51).ult (rankAtom (directSourceRanks P) 36)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (36 : Fin 78) (52 : Fin 78)
    (51 : Fin 78) (37 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (5 : Fin 13) (7 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (51 : Fin 78) (37 : Fin 78) (36 : Fin 78)
    (52 : Fin 78) (34 : Fin 78) (63 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1665` (kalmanson). -/
theorem directSource_h1665 :
    ((!((rankAtom (directSourceRanks P) 52 == rankAtom (directSourceRanks P) 51)) || ((rankAtom (directSourceRanks P) 37).ult (rankAtom (directSourceRanks P) 36)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (36 : Fin 78) (52 : Fin 78)
    (37 : Fin 78) (51 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (5 : Fin 13) (7 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (51 : Fin 78) (37 : Fin 78) (36 : Fin 78)
    (52 : Fin 78) (34 : Fin 78) (63 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1666` (kalmanson). -/
theorem directSource_h1666 :
    ((!((rankAtom (directSourceRanks P) 53 == rankAtom (directSourceRanks P) 51)) || ((rankAtom (directSourceRanks P) 38).ult (rankAtom (directSourceRanks P) 36)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (36 : Fin 78) (53 : Fin 78)
    (38 : Fin 78) (51 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (5 : Fin 13) (7 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (51 : Fin 78) (38 : Fin 78) (36 : Fin 78)
    (53 : Fin 78) (34 : Fin 78) (64 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1667` (kalmanson). -/
theorem directSource_h1667 :
    ((!((rankAtom (directSourceRanks P) 54 == rankAtom (directSourceRanks P) 34)) || ((rankAtom (directSourceRanks P) 65).ult (rankAtom (directSourceRanks P) 36)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (36 : Fin 78) (54 : Fin 78)
    (65 : Fin 78) (34 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (5 : Fin 13) (7 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (51 : Fin 78) (39 : Fin 78) (36 : Fin 78)
    (54 : Fin 78) (34 : Fin 78) (65 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1668` (kalmanson). -/
theorem directSource_h1668 :
    ((!((rankAtom (directSourceRanks P) 54 == rankAtom (directSourceRanks P) 51)) || ((rankAtom (directSourceRanks P) 39).ult (rankAtom (directSourceRanks P) 36)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (36 : Fin 78) (54 : Fin 78)
    (39 : Fin 78) (51 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (5 : Fin 13) (7 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (51 : Fin 78) (39 : Fin 78) (36 : Fin 78)
    (54 : Fin 78) (34 : Fin 78) (65 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1669` (kalmanson). -/
theorem directSource_h1669 :
    ((!((rankAtom (directSourceRanks P) 55 == rankAtom (directSourceRanks P) 34)) || ((rankAtom (directSourceRanks P) 66).ult (rankAtom (directSourceRanks P) 36)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (36 : Fin 78) (55 : Fin 78)
    (66 : Fin 78) (34 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (5 : Fin 13) (7 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (51 : Fin 78) (40 : Fin 78) (36 : Fin 78)
    (55 : Fin 78) (34 : Fin 78) (66 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1670` (kalmanson). -/
theorem directSource_h1670 :
    ((!((rankAtom (directSourceRanks P) 55 == rankAtom (directSourceRanks P) 51)) || ((rankAtom (directSourceRanks P) 40).ult (rankAtom (directSourceRanks P) 36)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (36 : Fin 78) (55 : Fin 78)
    (40 : Fin 78) (51 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (5 : Fin 13) (7 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (51 : Fin 78) (40 : Fin 78) (36 : Fin 78)
    (55 : Fin 78) (34 : Fin 78) (66 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1671` (kalmanson). -/
theorem directSource_h1671 :
    ((!((rankAtom (directSourceRanks P) 56 == rankAtom (directSourceRanks P) 34)) || ((rankAtom (directSourceRanks P) 67).ult (rankAtom (directSourceRanks P) 36)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (36 : Fin 78) (56 : Fin 78)
    (67 : Fin 78) (34 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (5 : Fin 13) (7 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (51 : Fin 78) (41 : Fin 78) (36 : Fin 78)
    (56 : Fin 78) (34 : Fin 78) (67 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1672` (kalmanson). -/
theorem directSource_h1672 :
    ((!((rankAtom (directSourceRanks P) 56 == rankAtom (directSourceRanks P) 51)) || ((rankAtom (directSourceRanks P) 41).ult (rankAtom (directSourceRanks P) 36)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (36 : Fin 78) (56 : Fin 78)
    (41 : Fin 78) (51 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (5 : Fin 13) (7 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (51 : Fin 78) (41 : Fin 78) (36 : Fin 78)
    (56 : Fin 78) (34 : Fin 78) (67 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1673` (kalmanson). -/
theorem directSource_h1673 :
    ((!((rankAtom (directSourceRanks P) 37 == rankAtom (directSourceRanks P) 68)) || ((rankAtom (directSourceRanks P) 34).ult (rankAtom (directSourceRanks P) 53)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (53 : Fin 78) (37 : Fin 78)
    (34 : Fin 78) (68 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (5 : Fin 13) (8 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (52 : Fin 78) (38 : Fin 78) (37 : Fin 78)
    (53 : Fin 78) (34 : Fin 78) (68 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1674` (kalmanson). -/
theorem directSource_h1674 :
    ((!((rankAtom (directSourceRanks P) 37 == rankAtom (directSourceRanks P) 52)) || ((rankAtom (directSourceRanks P) 38).ult (rankAtom (directSourceRanks P) 53)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (53 : Fin 78) (37 : Fin 78)
    (38 : Fin 78) (52 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (5 : Fin 13) (8 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (52 : Fin 78) (38 : Fin 78) (37 : Fin 78)
    (53 : Fin 78) (34 : Fin 78) (68 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1675` (kalmanson). -/
theorem directSource_h1675 :
    ((!((rankAtom (directSourceRanks P) 53 == rankAtom (directSourceRanks P) 52)) || ((rankAtom (directSourceRanks P) 38).ult (rankAtom (directSourceRanks P) 37)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (37 : Fin 78) (53 : Fin 78)
    (38 : Fin 78) (52 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (5 : Fin 13) (8 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (52 : Fin 78) (38 : Fin 78) (37 : Fin 78)
    (53 : Fin 78) (34 : Fin 78) (68 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1676` (kalmanson). -/
theorem directSource_h1676 :
    ((!((rankAtom (directSourceRanks P) 37 == rankAtom (directSourceRanks P) 69)) || ((rankAtom (directSourceRanks P) 34).ult (rankAtom (directSourceRanks P) 54)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (54 : Fin 78) (37 : Fin 78)
    (34 : Fin 78) (69 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (5 : Fin 13) (8 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (52 : Fin 78) (39 : Fin 78) (37 : Fin 78)
    (54 : Fin 78) (34 : Fin 78) (69 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1677` (kalmanson). -/
theorem directSource_h1677 :
    ((!((rankAtom (directSourceRanks P) 37 == rankAtom (directSourceRanks P) 52)) || ((rankAtom (directSourceRanks P) 39).ult (rankAtom (directSourceRanks P) 54)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (54 : Fin 78) (37 : Fin 78)
    (39 : Fin 78) (52 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (5 : Fin 13) (8 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (52 : Fin 78) (39 : Fin 78) (37 : Fin 78)
    (54 : Fin 78) (34 : Fin 78) (69 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1678` (kalmanson). -/
theorem directSource_h1678 :
    ((!((rankAtom (directSourceRanks P) 54 == rankAtom (directSourceRanks P) 52)) || ((rankAtom (directSourceRanks P) 39).ult (rankAtom (directSourceRanks P) 37)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (37 : Fin 78) (54 : Fin 78)
    (39 : Fin 78) (52 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (5 : Fin 13) (8 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (52 : Fin 78) (39 : Fin 78) (37 : Fin 78)
    (54 : Fin 78) (34 : Fin 78) (69 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1679` (kalmanson). -/
theorem directSource_h1679 :
    ((!((rankAtom (directSourceRanks P) 37 == rankAtom (directSourceRanks P) 70)) || ((rankAtom (directSourceRanks P) 34).ult (rankAtom (directSourceRanks P) 55)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (55 : Fin 78) (37 : Fin 78)
    (34 : Fin 78) (70 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (5 : Fin 13) (8 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (52 : Fin 78) (40 : Fin 78) (37 : Fin 78)
    (55 : Fin 78) (34 : Fin 78) (70 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1680` (kalmanson). -/
theorem directSource_h1680 :
    ((!((rankAtom (directSourceRanks P) 37 == rankAtom (directSourceRanks P) 52)) || ((rankAtom (directSourceRanks P) 40).ult (rankAtom (directSourceRanks P) 55)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (55 : Fin 78) (37 : Fin 78)
    (40 : Fin 78) (52 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (5 : Fin 13) (8 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (52 : Fin 78) (40 : Fin 78) (37 : Fin 78)
    (55 : Fin 78) (34 : Fin 78) (70 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1681` (kalmanson). -/
theorem directSource_h1681 :
    ((!((rankAtom (directSourceRanks P) 55 == rankAtom (directSourceRanks P) 52)) || ((rankAtom (directSourceRanks P) 40).ult (rankAtom (directSourceRanks P) 37)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (37 : Fin 78) (55 : Fin 78)
    (40 : Fin 78) (52 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (5 : Fin 13) (8 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (52 : Fin 78) (40 : Fin 78) (37 : Fin 78)
    (55 : Fin 78) (34 : Fin 78) (70 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1682` (kalmanson). -/
theorem directSource_h1682 :
    ((!((rankAtom (directSourceRanks P) 37 == rankAtom (directSourceRanks P) 71)) || ((rankAtom (directSourceRanks P) 34).ult (rankAtom (directSourceRanks P) 56)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (56 : Fin 78) (37 : Fin 78)
    (34 : Fin 78) (71 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (5 : Fin 13) (8 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (52 : Fin 78) (41 : Fin 78) (37 : Fin 78)
    (56 : Fin 78) (34 : Fin 78) (71 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1683` (kalmanson). -/
theorem directSource_h1683 :
    ((!((rankAtom (directSourceRanks P) 37 == rankAtom (directSourceRanks P) 52)) || ((rankAtom (directSourceRanks P) 41).ult (rankAtom (directSourceRanks P) 56)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (56 : Fin 78) (37 : Fin 78)
    (41 : Fin 78) (52 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (5 : Fin 13) (8 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (52 : Fin 78) (41 : Fin 78) (37 : Fin 78)
    (56 : Fin 78) (34 : Fin 78) (71 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1684` (kalmanson). -/
theorem directSource_h1684 :
    ((!((rankAtom (directSourceRanks P) 56 == rankAtom (directSourceRanks P) 52)) || ((rankAtom (directSourceRanks P) 41).ult (rankAtom (directSourceRanks P) 37)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (37 : Fin 78) (56 : Fin 78)
    (41 : Fin 78) (52 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (5 : Fin 13) (8 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (52 : Fin 78) (41 : Fin 78) (37 : Fin 78)
    (56 : Fin 78) (34 : Fin 78) (71 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1685` (kalmanson). -/
theorem directSource_h1685 :
    ((!((rankAtom (directSourceRanks P) 58 == rankAtom (directSourceRanks P) 35)) || ((rankAtom (directSourceRanks P) 63).ult (rankAtom (directSourceRanks P) 36)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (36 : Fin 78) (58 : Fin 78)
    (63 : Fin 78) (35 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (6 : Fin 13) (7 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (37 : Fin 78) (36 : Fin 78)
    (58 : Fin 78) (35 : Fin 78) (63 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1686` (kalmanson). -/
theorem directSource_h1686 :
    ((!((rankAtom (directSourceRanks P) 58 == rankAtom (directSourceRanks P) 37)) || ((rankAtom (directSourceRanks P) 57).ult (rankAtom (directSourceRanks P) 36)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (36 : Fin 78) (58 : Fin 78)
    (57 : Fin 78) (37 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (6 : Fin 13) (7 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (37 : Fin 78) (36 : Fin 78)
    (58 : Fin 78) (35 : Fin 78) (63 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1687` (kalmanson). -/
theorem directSource_h1687 :
    ((!((rankAtom (directSourceRanks P) 58 == rankAtom (directSourceRanks P) 57)) || ((rankAtom (directSourceRanks P) 37).ult (rankAtom (directSourceRanks P) 36)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (36 : Fin 78) (58 : Fin 78)
    (37 : Fin 78) (57 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (6 : Fin 13) (7 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (37 : Fin 78) (36 : Fin 78)
    (58 : Fin 78) (35 : Fin 78) (63 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1688` (kalmanson). -/
theorem directSource_h1688 :
    ((!((rankAtom (directSourceRanks P) 59 == rankAtom (directSourceRanks P) 35)) || ((rankAtom (directSourceRanks P) 64).ult (rankAtom (directSourceRanks P) 36)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (36 : Fin 78) (59 : Fin 78)
    (64 : Fin 78) (35 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (6 : Fin 13) (7 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (38 : Fin 78) (36 : Fin 78)
    (59 : Fin 78) (35 : Fin 78) (64 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1689` (kalmanson). -/
theorem directSource_h1689 :
    ((!((rankAtom (directSourceRanks P) 59 == rankAtom (directSourceRanks P) 57)) || ((rankAtom (directSourceRanks P) 38).ult (rankAtom (directSourceRanks P) 36)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (36 : Fin 78) (59 : Fin 78)
    (38 : Fin 78) (57 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (6 : Fin 13) (7 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (38 : Fin 78) (36 : Fin 78)
    (59 : Fin 78) (35 : Fin 78) (64 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1690` (kalmanson). -/
theorem directSource_h1690 :
    ((!((rankAtom (directSourceRanks P) 60 == rankAtom (directSourceRanks P) 35)) || ((rankAtom (directSourceRanks P) 65).ult (rankAtom (directSourceRanks P) 36)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (36 : Fin 78) (60 : Fin 78)
    (65 : Fin 78) (35 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (6 : Fin 13) (7 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (39 : Fin 78) (36 : Fin 78)
    (60 : Fin 78) (35 : Fin 78) (65 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1691` (kalmanson). -/
theorem directSource_h1691 :
    ((!((rankAtom (directSourceRanks P) 60 == rankAtom (directSourceRanks P) 57)) || ((rankAtom (directSourceRanks P) 39).ult (rankAtom (directSourceRanks P) 36)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (36 : Fin 78) (60 : Fin 78)
    (39 : Fin 78) (57 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (6 : Fin 13) (7 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (39 : Fin 78) (36 : Fin 78)
    (60 : Fin 78) (35 : Fin 78) (65 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1692` (kalmanson). -/
theorem directSource_h1692 :
    ((!((rankAtom (directSourceRanks P) 61 == rankAtom (directSourceRanks P) 35)) || ((rankAtom (directSourceRanks P) 66).ult (rankAtom (directSourceRanks P) 36)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (36 : Fin 78) (61 : Fin 78)
    (66 : Fin 78) (35 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (6 : Fin 13) (7 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (40 : Fin 78) (36 : Fin 78)
    (61 : Fin 78) (35 : Fin 78) (66 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1693` (kalmanson). -/
theorem directSource_h1693 :
    ((!((rankAtom (directSourceRanks P) 61 == rankAtom (directSourceRanks P) 57)) || ((rankAtom (directSourceRanks P) 40).ult (rankAtom (directSourceRanks P) 36)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (36 : Fin 78) (61 : Fin 78)
    (40 : Fin 78) (57 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (6 : Fin 13) (7 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (40 : Fin 78) (36 : Fin 78)
    (61 : Fin 78) (35 : Fin 78) (66 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1694` (kalmanson). -/
theorem directSource_h1694 :
    ((!((rankAtom (directSourceRanks P) 62 == rankAtom (directSourceRanks P) 35)) || ((rankAtom (directSourceRanks P) 67).ult (rankAtom (directSourceRanks P) 36)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (36 : Fin 78) (62 : Fin 78)
    (67 : Fin 78) (35 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (6 : Fin 13) (7 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (41 : Fin 78) (36 : Fin 78)
    (62 : Fin 78) (35 : Fin 78) (67 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1695` (kalmanson). -/
theorem directSource_h1695 :
    ((!((rankAtom (directSourceRanks P) 62 == rankAtom (directSourceRanks P) 57)) || ((rankAtom (directSourceRanks P) 41).ult (rankAtom (directSourceRanks P) 36)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (36 : Fin 78) (62 : Fin 78)
    (41 : Fin 78) (57 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (6 : Fin 13) (7 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (41 : Fin 78) (36 : Fin 78)
    (62 : Fin 78) (35 : Fin 78) (67 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1696` (kalmanson). -/
theorem directSource_h1696 :
    ((!((rankAtom (directSourceRanks P) 37 == rankAtom (directSourceRanks P) 68)) || ((rankAtom (directSourceRanks P) 35).ult (rankAtom (directSourceRanks P) 59)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (59 : Fin 78) (37 : Fin 78)
    (35 : Fin 78) (68 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (6 : Fin 13) (8 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (58 : Fin 78) (38 : Fin 78) (37 : Fin 78)
    (59 : Fin 78) (35 : Fin 78) (68 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1697` (kalmanson). -/
theorem directSource_h1697 :
    ((!((rankAtom (directSourceRanks P) 37 == rankAtom (directSourceRanks P) 58)) || ((rankAtom (directSourceRanks P) 38).ult (rankAtom (directSourceRanks P) 59)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (59 : Fin 78) (37 : Fin 78)
    (38 : Fin 78) (58 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (6 : Fin 13) (8 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (58 : Fin 78) (38 : Fin 78) (37 : Fin 78)
    (59 : Fin 78) (35 : Fin 78) (68 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1698` (kalmanson). -/
theorem directSource_h1698 :
    ((!((rankAtom (directSourceRanks P) 59 == rankAtom (directSourceRanks P) 58)) || ((rankAtom (directSourceRanks P) 38).ult (rankAtom (directSourceRanks P) 37)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (37 : Fin 78) (59 : Fin 78)
    (38 : Fin 78) (58 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (6 : Fin 13) (8 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (58 : Fin 78) (38 : Fin 78) (37 : Fin 78)
    (59 : Fin 78) (35 : Fin 78) (68 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1699` (kalmanson). -/
theorem directSource_h1699 :
    ((!((rankAtom (directSourceRanks P) 37 == rankAtom (directSourceRanks P) 69)) || ((rankAtom (directSourceRanks P) 35).ult (rankAtom (directSourceRanks P) 60)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (60 : Fin 78) (37 : Fin 78)
    (35 : Fin 78) (69 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (6 : Fin 13) (8 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (58 : Fin 78) (39 : Fin 78) (37 : Fin 78)
    (60 : Fin 78) (35 : Fin 78) (69 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1700` (kalmanson). -/
theorem directSource_h1700 :
    ((!((rankAtom (directSourceRanks P) 37 == rankAtom (directSourceRanks P) 58)) || ((rankAtom (directSourceRanks P) 39).ult (rankAtom (directSourceRanks P) 60)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (60 : Fin 78) (37 : Fin 78)
    (39 : Fin 78) (58 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (6 : Fin 13) (8 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (58 : Fin 78) (39 : Fin 78) (37 : Fin 78)
    (60 : Fin 78) (35 : Fin 78) (69 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1701` (kalmanson). -/
theorem directSource_h1701 :
    ((!((rankAtom (directSourceRanks P) 60 == rankAtom (directSourceRanks P) 58)) || ((rankAtom (directSourceRanks P) 39).ult (rankAtom (directSourceRanks P) 37)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (37 : Fin 78) (60 : Fin 78)
    (39 : Fin 78) (58 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (6 : Fin 13) (8 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (58 : Fin 78) (39 : Fin 78) (37 : Fin 78)
    (60 : Fin 78) (35 : Fin 78) (69 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1702` (kalmanson). -/
theorem directSource_h1702 :
    ((!((rankAtom (directSourceRanks P) 37 == rankAtom (directSourceRanks P) 70)) || ((rankAtom (directSourceRanks P) 35).ult (rankAtom (directSourceRanks P) 61)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (61 : Fin 78) (37 : Fin 78)
    (35 : Fin 78) (70 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (6 : Fin 13) (8 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (58 : Fin 78) (40 : Fin 78) (37 : Fin 78)
    (61 : Fin 78) (35 : Fin 78) (70 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1703` (kalmanson). -/
theorem directSource_h1703 :
    ((!((rankAtom (directSourceRanks P) 37 == rankAtom (directSourceRanks P) 58)) || ((rankAtom (directSourceRanks P) 40).ult (rankAtom (directSourceRanks P) 61)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (61 : Fin 78) (37 : Fin 78)
    (40 : Fin 78) (58 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (6 : Fin 13) (8 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (58 : Fin 78) (40 : Fin 78) (37 : Fin 78)
    (61 : Fin 78) (35 : Fin 78) (70 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1704` (kalmanson). -/
theorem directSource_h1704 :
    ((!((rankAtom (directSourceRanks P) 61 == rankAtom (directSourceRanks P) 58)) || ((rankAtom (directSourceRanks P) 40).ult (rankAtom (directSourceRanks P) 37)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (37 : Fin 78) (61 : Fin 78)
    (40 : Fin 78) (58 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (6 : Fin 13) (8 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (58 : Fin 78) (40 : Fin 78) (37 : Fin 78)
    (61 : Fin 78) (35 : Fin 78) (70 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1705` (kalmanson). -/
theorem directSource_h1705 :
    ((!((rankAtom (directSourceRanks P) 37 == rankAtom (directSourceRanks P) 71)) || ((rankAtom (directSourceRanks P) 35).ult (rankAtom (directSourceRanks P) 62)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (62 : Fin 78) (37 : Fin 78)
    (35 : Fin 78) (71 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (6 : Fin 13) (8 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (58 : Fin 78) (41 : Fin 78) (37 : Fin 78)
    (62 : Fin 78) (35 : Fin 78) (71 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1706` (kalmanson). -/
theorem directSource_h1706 :
    ((!((rankAtom (directSourceRanks P) 37 == rankAtom (directSourceRanks P) 58)) || ((rankAtom (directSourceRanks P) 41).ult (rankAtom (directSourceRanks P) 62)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (62 : Fin 78) (37 : Fin 78)
    (41 : Fin 78) (58 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (6 : Fin 13) (8 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (58 : Fin 78) (41 : Fin 78) (37 : Fin 78)
    (62 : Fin 78) (35 : Fin 78) (71 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1707` (kalmanson). -/
theorem directSource_h1707 :
    ((!((rankAtom (directSourceRanks P) 62 == rankAtom (directSourceRanks P) 58)) || ((rankAtom (directSourceRanks P) 41).ult (rankAtom (directSourceRanks P) 37)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (37 : Fin 78) (62 : Fin 78)
    (41 : Fin 78) (58 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (6 : Fin 13) (8 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (58 : Fin 78) (41 : Fin 78) (37 : Fin 78)
    (62 : Fin 78) (35 : Fin 78) (71 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1708` (kalmanson). -/
theorem directSource_h1708 :
    ((!((rankAtom (directSourceRanks P) 37 == rankAtom (directSourceRanks P) 68)) || ((rankAtom (directSourceRanks P) 36).ult (rankAtom (directSourceRanks P) 64)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (64 : Fin 78) (37 : Fin 78)
    (36 : Fin 78) (68 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (7 : Fin 13) (8 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (63 : Fin 78) (38 : Fin 78) (37 : Fin 78)
    (64 : Fin 78) (36 : Fin 78) (68 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1709` (kalmanson). -/
theorem directSource_h1709 :
    ((!((rankAtom (directSourceRanks P) 37 == rankAtom (directSourceRanks P) 63)) || ((rankAtom (directSourceRanks P) 38).ult (rankAtom (directSourceRanks P) 64)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (64 : Fin 78) (37 : Fin 78)
    (38 : Fin 78) (63 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (7 : Fin 13) (8 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (63 : Fin 78) (38 : Fin 78) (37 : Fin 78)
    (64 : Fin 78) (36 : Fin 78) (68 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1710` (kalmanson). -/
theorem directSource_h1710 :
    ((!((rankAtom (directSourceRanks P) 37 == rankAtom (directSourceRanks P) 63)) || ((rankAtom (directSourceRanks P) 39).ult (rankAtom (directSourceRanks P) 65)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (65 : Fin 78) (37 : Fin 78)
    (39 : Fin 78) (63 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (7 : Fin 13) (8 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (63 : Fin 78) (39 : Fin 78) (37 : Fin 78)
    (65 : Fin 78) (36 : Fin 78) (69 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1711` (kalmanson). -/
theorem directSource_h1711 :
    ((!((rankAtom (directSourceRanks P) 37 == rankAtom (directSourceRanks P) 70)) || ((rankAtom (directSourceRanks P) 36).ult (rankAtom (directSourceRanks P) 66)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (66 : Fin 78) (37 : Fin 78)
    (36 : Fin 78) (70 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (7 : Fin 13) (8 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (63 : Fin 78) (40 : Fin 78) (37 : Fin 78)
    (66 : Fin 78) (36 : Fin 78) (70 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1712` (kalmanson). -/
theorem directSource_h1712 :
    ((!((rankAtom (directSourceRanks P) 37 == rankAtom (directSourceRanks P) 63)) || ((rankAtom (directSourceRanks P) 40).ult (rankAtom (directSourceRanks P) 66)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (66 : Fin 78) (37 : Fin 78)
    (40 : Fin 78) (63 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (7 : Fin 13) (8 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (63 : Fin 78) (40 : Fin 78) (37 : Fin 78)
    (66 : Fin 78) (36 : Fin 78) (70 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1713` (kalmanson). -/
theorem directSource_h1713 :
    ((!((rankAtom (directSourceRanks P) 37 == rankAtom (directSourceRanks P) 71)) || ((rankAtom (directSourceRanks P) 36).ult (rankAtom (directSourceRanks P) 67)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (67 : Fin 78) (37 : Fin 78)
    (36 : Fin 78) (71 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (7 : Fin 13) (8 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (63 : Fin 78) (41 : Fin 78) (37 : Fin 78)
    (67 : Fin 78) (36 : Fin 78) (71 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1714` (kalmanson). -/
theorem directSource_h1714 :
    ((!((rankAtom (directSourceRanks P) 37 == rankAtom (directSourceRanks P) 63)) || ((rankAtom (directSourceRanks P) 41).ult (rankAtom (directSourceRanks P) 67)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (67 : Fin 78) (37 : Fin 78)
    (41 : Fin 78) (63 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (3 : Fin 13) (7 : Fin 13) (8 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (63 : Fin 78) (41 : Fin 78) (37 : Fin 78)
    (67 : Fin 78) (36 : Fin 78) (71 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1715` (kalmanson). -/
theorem directSource_h1715 :
    ((!((rankAtom (directSourceRanks P) 43 == rankAtom (directSourceRanks P) 42)) || ((rankAtom (directSourceRanks P) 57).ult (rankAtom (directSourceRanks P) 51)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (51 : Fin 78) (43 : Fin 78)
    (57 : Fin 78) (42 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (5 : Fin 13) (6 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (44 : Fin 78) (43 : Fin 78)
    (51 : Fin 78) (42 : Fin 78) (57 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1716` (kalmanson). -/
theorem directSource_h1716 :
    ((!((rankAtom (directSourceRanks P) 43 == rankAtom (directSourceRanks P) 57)) || ((rankAtom (directSourceRanks P) 42).ult (rankAtom (directSourceRanks P) 51)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (51 : Fin 78) (43 : Fin 78)
    (42 : Fin 78) (57 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (5 : Fin 13) (6 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (44 : Fin 78) (43 : Fin 78)
    (51 : Fin 78) (42 : Fin 78) (57 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1717` (kalmanson). -/
theorem directSource_h1717 :
    ((!((rankAtom (directSourceRanks P) 51 == rankAtom (directSourceRanks P) 42)) || ((rankAtom (directSourceRanks P) 57).ult (rankAtom (directSourceRanks P) 43)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (43 : Fin 78) (51 : Fin 78)
    (57 : Fin 78) (42 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (5 : Fin 13) (6 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (44 : Fin 78) (43 : Fin 78)
    (51 : Fin 78) (42 : Fin 78) (57 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1718` (kalmanson). -/
theorem directSource_h1718 :
    ((!((rankAtom (directSourceRanks P) 43 == rankAtom (directSourceRanks P) 44)) || ((rankAtom (directSourceRanks P) 50).ult (rankAtom (directSourceRanks P) 51)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (51 : Fin 78) (43 : Fin 78)
    (50 : Fin 78) (44 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (5 : Fin 13) (6 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (44 : Fin 78) (43 : Fin 78)
    (51 : Fin 78) (42 : Fin 78) (57 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1719` (kalmanson). -/
theorem directSource_h1719 :
    ((!((rankAtom (directSourceRanks P) 43 == rankAtom (directSourceRanks P) 50)) || ((rankAtom (directSourceRanks P) 44).ult (rankAtom (directSourceRanks P) 51)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (51 : Fin 78) (43 : Fin 78)
    (44 : Fin 78) (50 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (5 : Fin 13) (6 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (44 : Fin 78) (43 : Fin 78)
    (51 : Fin 78) (42 : Fin 78) (57 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1720` (kalmanson). -/
theorem directSource_h1720 :
    ((!((rankAtom (directSourceRanks P) 51 == rankAtom (directSourceRanks P) 50)) || ((rankAtom (directSourceRanks P) 44).ult (rankAtom (directSourceRanks P) 43)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (43 : Fin 78) (51 : Fin 78)
    (44 : Fin 78) (50 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (5 : Fin 13) (6 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (44 : Fin 78) (43 : Fin 78)
    (51 : Fin 78) (42 : Fin 78) (57 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1721` (kalmanson). -/
theorem directSource_h1721 :
    ((!((rankAtom (directSourceRanks P) 43 == rankAtom (directSourceRanks P) 42)) || ((rankAtom (directSourceRanks P) 58).ult (rankAtom (directSourceRanks P) 52)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (52 : Fin 78) (43 : Fin 78)
    (58 : Fin 78) (42 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (5 : Fin 13) (6 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (45 : Fin 78) (43 : Fin 78)
    (52 : Fin 78) (42 : Fin 78) (58 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1722` (kalmanson). -/
theorem directSource_h1722 :
    ((!((rankAtom (directSourceRanks P) 43 == rankAtom (directSourceRanks P) 58)) || ((rankAtom (directSourceRanks P) 42).ult (rankAtom (directSourceRanks P) 52)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (52 : Fin 78) (43 : Fin 78)
    (42 : Fin 78) (58 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (5 : Fin 13) (6 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (45 : Fin 78) (43 : Fin 78)
    (52 : Fin 78) (42 : Fin 78) (58 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1723` (kalmanson). -/
theorem directSource_h1723 :
    ((!((rankAtom (directSourceRanks P) 52 == rankAtom (directSourceRanks P) 42)) || ((rankAtom (directSourceRanks P) 58).ult (rankAtom (directSourceRanks P) 43)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (43 : Fin 78) (52 : Fin 78)
    (58 : Fin 78) (42 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (5 : Fin 13) (6 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (45 : Fin 78) (43 : Fin 78)
    (52 : Fin 78) (42 : Fin 78) (58 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h1724` (kalmanson). -/
theorem directSource_h1724 :
    ((!((rankAtom (directSourceRanks P) 43 == rankAtom (directSourceRanks P) 45)) || ((rankAtom (directSourceRanks P) 50).ult (rankAtom (directSourceRanks P) 52)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (52 : Fin 78) (43 : Fin 78)
    (50 : Fin 78) (45 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (5 : Fin 13) (6 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (45 : Fin 78) (43 : Fin 78)
    (52 : Fin 78) (42 : Fin 78) (58 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1725` (kalmanson). -/
theorem directSource_h1725 :
    ((!((rankAtom (directSourceRanks P) 43 == rankAtom (directSourceRanks P) 50)) || ((rankAtom (directSourceRanks P) 45).ult (rankAtom (directSourceRanks P) 52)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (52 : Fin 78) (43 : Fin 78)
    (45 : Fin 78) (50 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (5 : Fin 13) (6 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (45 : Fin 78) (43 : Fin 78)
    (52 : Fin 78) (42 : Fin 78) (58 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1726` (kalmanson). -/
theorem directSource_h1726 :
    ((!((rankAtom (directSourceRanks P) 52 == rankAtom (directSourceRanks P) 50)) || ((rankAtom (directSourceRanks P) 45).ult (rankAtom (directSourceRanks P) 43)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (43 : Fin 78) (52 : Fin 78)
    (45 : Fin 78) (50 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (5 : Fin 13) (6 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (45 : Fin 78) (43 : Fin 78)
    (52 : Fin 78) (42 : Fin 78) (58 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h1727` (kalmanson). -/
theorem directSource_h1727 :
    ((!((rankAtom (directSourceRanks P) 43 == rankAtom (directSourceRanks P) 42)) || ((rankAtom (directSourceRanks P) 59).ult (rankAtom (directSourceRanks P) 53)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (53 : Fin 78) (43 : Fin 78)
    (59 : Fin 78) (42 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (5 : Fin 13) (6 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (50 : Fin 78) (46 : Fin 78) (43 : Fin 78)
    (53 : Fin 78) (42 : Fin 78) (59 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

end

end ATailExactFiveCard13CnfIngressScratch
end Problem97
