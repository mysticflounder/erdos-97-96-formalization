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

/-- Exact pass-5 source assertion `h0768` (kalmanson). -/
theorem directSource_h0768 :
    ((!((rankAtom (directSourceRanks P) 4 == rankAtom (directSourceRanks P) 2)) || ((rankAtom (directSourceRanks P) 53).ult (rankAtom (directSourceRanks P) 38)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (38 : Fin 78) (4 : Fin 78)
    (53 : Fin 78) (2 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (5 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (34 : Fin 78) (8 : Fin 78) (4 : Fin 78)
    (38 : Fin 78) (2 : Fin 78) (53 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0769` (kalmanson). -/
theorem directSource_h0769 :
    ((!((rankAtom (directSourceRanks P) 4 == rankAtom (directSourceRanks P) 53)) || ((rankAtom (directSourceRanks P) 2).ult (rankAtom (directSourceRanks P) 38)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (38 : Fin 78) (4 : Fin 78)
    (2 : Fin 78) (53 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (5 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (34 : Fin 78) (8 : Fin 78) (4 : Fin 78)
    (38 : Fin 78) (2 : Fin 78) (53 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0770` (kalmanson). -/
theorem directSource_h0770 :
    ((!((rankAtom (directSourceRanks P) 4 == rankAtom (directSourceRanks P) 8)) || ((rankAtom (directSourceRanks P) 34).ult (rankAtom (directSourceRanks P) 38)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (38 : Fin 78) (4 : Fin 78)
    (34 : Fin 78) (8 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (5 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (34 : Fin 78) (8 : Fin 78) (4 : Fin 78)
    (38 : Fin 78) (2 : Fin 78) (53 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0771` (kalmanson). -/
theorem directSource_h0771 :
    ((!((rankAtom (directSourceRanks P) 4 == rankAtom (directSourceRanks P) 2)) || ((rankAtom (directSourceRanks P) 54).ult (rankAtom (directSourceRanks P) 39)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (39 : Fin 78) (4 : Fin 78)
    (54 : Fin 78) (2 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (5 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (34 : Fin 78) (9 : Fin 78) (4 : Fin 78)
    (39 : Fin 78) (2 : Fin 78) (54 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0772` (kalmanson). -/
theorem directSource_h0772 :
    ((!((rankAtom (directSourceRanks P) 4 == rankAtom (directSourceRanks P) 54)) || ((rankAtom (directSourceRanks P) 2).ult (rankAtom (directSourceRanks P) 39)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (39 : Fin 78) (4 : Fin 78)
    (2 : Fin 78) (54 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (5 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (34 : Fin 78) (9 : Fin 78) (4 : Fin 78)
    (39 : Fin 78) (2 : Fin 78) (54 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0773` (kalmanson). -/
theorem directSource_h0773 :
    ((!((rankAtom (directSourceRanks P) 4 == rankAtom (directSourceRanks P) 9)) || ((rankAtom (directSourceRanks P) 34).ult (rankAtom (directSourceRanks P) 39)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (39 : Fin 78) (4 : Fin 78)
    (34 : Fin 78) (9 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (5 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (34 : Fin 78) (9 : Fin 78) (4 : Fin 78)
    (39 : Fin 78) (2 : Fin 78) (54 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0774` (kalmanson). -/
theorem directSource_h0774 :
    ((!((rankAtom (directSourceRanks P) 4 == rankAtom (directSourceRanks P) 2)) || ((rankAtom (directSourceRanks P) 55).ult (rankAtom (directSourceRanks P) 40)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (40 : Fin 78) (4 : Fin 78)
    (55 : Fin 78) (2 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (5 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (34 : Fin 78) (10 : Fin 78) (4 : Fin 78)
    (40 : Fin 78) (2 : Fin 78) (55 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0775` (kalmanson). -/
theorem directSource_h0775 :
    ((!((rankAtom (directSourceRanks P) 4 == rankAtom (directSourceRanks P) 55)) || ((rankAtom (directSourceRanks P) 2).ult (rankAtom (directSourceRanks P) 40)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (40 : Fin 78) (4 : Fin 78)
    (2 : Fin 78) (55 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (5 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (34 : Fin 78) (10 : Fin 78) (4 : Fin 78)
    (40 : Fin 78) (2 : Fin 78) (55 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0776` (kalmanson). -/
theorem directSource_h0776 :
    ((!((rankAtom (directSourceRanks P) 4 == rankAtom (directSourceRanks P) 10)) || ((rankAtom (directSourceRanks P) 34).ult (rankAtom (directSourceRanks P) 40)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (40 : Fin 78) (4 : Fin 78)
    (34 : Fin 78) (10 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (5 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (34 : Fin 78) (10 : Fin 78) (4 : Fin 78)
    (40 : Fin 78) (2 : Fin 78) (55 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0777` (kalmanson). -/
theorem directSource_h0777 :
    ((!((rankAtom (directSourceRanks P) 4 == rankAtom (directSourceRanks P) 2)) || ((rankAtom (directSourceRanks P) 56).ult (rankAtom (directSourceRanks P) 41)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (41 : Fin 78) (4 : Fin 78)
    (56 : Fin 78) (2 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (5 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (34 : Fin 78) (11 : Fin 78) (4 : Fin 78)
    (41 : Fin 78) (2 : Fin 78) (56 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0778` (kalmanson). -/
theorem directSource_h0778 :
    ((!((rankAtom (directSourceRanks P) 4 == rankAtom (directSourceRanks P) 56)) || ((rankAtom (directSourceRanks P) 2).ult (rankAtom (directSourceRanks P) 41)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (41 : Fin 78) (4 : Fin 78)
    (2 : Fin 78) (56 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (5 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (34 : Fin 78) (11 : Fin 78) (4 : Fin 78)
    (41 : Fin 78) (2 : Fin 78) (56 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0779` (kalmanson). -/
theorem directSource_h0779 :
    ((!((rankAtom (directSourceRanks P) 4 == rankAtom (directSourceRanks P) 11)) || ((rankAtom (directSourceRanks P) 34).ult (rankAtom (directSourceRanks P) 41)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (41 : Fin 78) (4 : Fin 78)
    (34 : Fin 78) (11 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (5 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (34 : Fin 78) (11 : Fin 78) (4 : Fin 78)
    (41 : Fin 78) (2 : Fin 78) (56 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0780` (kalmanson). -/
theorem directSource_h0780 :
    ((!((rankAtom (directSourceRanks P) 5 == rankAtom (directSourceRanks P) 2)) || ((rankAtom (directSourceRanks P) 57).ult (rankAtom (directSourceRanks P) 36)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (36 : Fin 78) (5 : Fin 78)
    (57 : Fin 78) (2 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (6 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (35 : Fin 78) (6 : Fin 78) (5 : Fin 78)
    (36 : Fin 78) (2 : Fin 78) (57 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0781` (kalmanson). -/
theorem directSource_h0781 :
    ((!((rankAtom (directSourceRanks P) 5 == rankAtom (directSourceRanks P) 57)) || ((rankAtom (directSourceRanks P) 2).ult (rankAtom (directSourceRanks P) 36)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (36 : Fin 78) (5 : Fin 78)
    (2 : Fin 78) (57 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (6 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (35 : Fin 78) (6 : Fin 78) (5 : Fin 78)
    (36 : Fin 78) (2 : Fin 78) (57 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0782` (kalmanson). -/
theorem directSource_h0782 :
    ((!((rankAtom (directSourceRanks P) 5 == rankAtom (directSourceRanks P) 6)) || ((rankAtom (directSourceRanks P) 35).ult (rankAtom (directSourceRanks P) 36)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (36 : Fin 78) (5 : Fin 78)
    (35 : Fin 78) (6 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (6 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (35 : Fin 78) (6 : Fin 78) (5 : Fin 78)
    (36 : Fin 78) (2 : Fin 78) (57 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0783` (kalmanson). -/
theorem directSource_h0783 :
    ((!((rankAtom (directSourceRanks P) 5 == rankAtom (directSourceRanks P) 35)) || ((rankAtom (directSourceRanks P) 6).ult (rankAtom (directSourceRanks P) 36)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (36 : Fin 78) (5 : Fin 78)
    (6 : Fin 78) (35 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (6 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (35 : Fin 78) (6 : Fin 78) (5 : Fin 78)
    (36 : Fin 78) (2 : Fin 78) (57 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0784` (kalmanson). -/
theorem directSource_h0784 :
    ((!((rankAtom (directSourceRanks P) 5 == rankAtom (directSourceRanks P) 2)) || ((rankAtom (directSourceRanks P) 58).ult (rankAtom (directSourceRanks P) 37)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (37 : Fin 78) (5 : Fin 78)
    (58 : Fin 78) (2 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (6 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (35 : Fin 78) (7 : Fin 78) (5 : Fin 78)
    (37 : Fin 78) (2 : Fin 78) (58 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0785` (kalmanson). -/
theorem directSource_h0785 :
    ((!((rankAtom (directSourceRanks P) 5 == rankAtom (directSourceRanks P) 58)) || ((rankAtom (directSourceRanks P) 2).ult (rankAtom (directSourceRanks P) 37)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (37 : Fin 78) (5 : Fin 78)
    (2 : Fin 78) (58 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (6 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (35 : Fin 78) (7 : Fin 78) (5 : Fin 78)
    (37 : Fin 78) (2 : Fin 78) (58 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0786` (kalmanson). -/
theorem directSource_h0786 :
    ((!((rankAtom (directSourceRanks P) 37 == rankAtom (directSourceRanks P) 58)) || ((rankAtom (directSourceRanks P) 2).ult (rankAtom (directSourceRanks P) 5)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (5 : Fin 78) (37 : Fin 78)
    (2 : Fin 78) (58 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (6 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (35 : Fin 78) (7 : Fin 78) (5 : Fin 78)
    (37 : Fin 78) (2 : Fin 78) (58 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0787` (kalmanson). -/
theorem directSource_h0787 :
    ((!((rankAtom (directSourceRanks P) 5 == rankAtom (directSourceRanks P) 7)) || ((rankAtom (directSourceRanks P) 35).ult (rankAtom (directSourceRanks P) 37)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (37 : Fin 78) (5 : Fin 78)
    (35 : Fin 78) (7 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (6 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (35 : Fin 78) (7 : Fin 78) (5 : Fin 78)
    (37 : Fin 78) (2 : Fin 78) (58 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0788` (kalmanson). -/
theorem directSource_h0788 :
    ((!((rankAtom (directSourceRanks P) 37 == rankAtom (directSourceRanks P) 7)) || ((rankAtom (directSourceRanks P) 35).ult (rankAtom (directSourceRanks P) 5)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (5 : Fin 78) (37 : Fin 78)
    (35 : Fin 78) (7 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (6 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (35 : Fin 78) (7 : Fin 78) (5 : Fin 78)
    (37 : Fin 78) (2 : Fin 78) (58 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0789` (kalmanson). -/
theorem directSource_h0789 :
    ((!((rankAtom (directSourceRanks P) 5 == rankAtom (directSourceRanks P) 2)) || ((rankAtom (directSourceRanks P) 59).ult (rankAtom (directSourceRanks P) 38)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (38 : Fin 78) (5 : Fin 78)
    (59 : Fin 78) (2 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (6 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (35 : Fin 78) (8 : Fin 78) (5 : Fin 78)
    (38 : Fin 78) (2 : Fin 78) (59 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0790` (kalmanson). -/
theorem directSource_h0790 :
    ((!((rankAtom (directSourceRanks P) 5 == rankAtom (directSourceRanks P) 59)) || ((rankAtom (directSourceRanks P) 2).ult (rankAtom (directSourceRanks P) 38)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (38 : Fin 78) (5 : Fin 78)
    (2 : Fin 78) (59 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (6 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (35 : Fin 78) (8 : Fin 78) (5 : Fin 78)
    (38 : Fin 78) (2 : Fin 78) (59 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0791` (kalmanson). -/
theorem directSource_h0791 :
    ((!((rankAtom (directSourceRanks P) 5 == rankAtom (directSourceRanks P) 8)) || ((rankAtom (directSourceRanks P) 35).ult (rankAtom (directSourceRanks P) 38)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (38 : Fin 78) (5 : Fin 78)
    (35 : Fin 78) (8 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (6 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (35 : Fin 78) (8 : Fin 78) (5 : Fin 78)
    (38 : Fin 78) (2 : Fin 78) (59 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0792` (kalmanson). -/
theorem directSource_h0792 :
    ((!((rankAtom (directSourceRanks P) 5 == rankAtom (directSourceRanks P) 2)) || ((rankAtom (directSourceRanks P) 60).ult (rankAtom (directSourceRanks P) 39)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (39 : Fin 78) (5 : Fin 78)
    (60 : Fin 78) (2 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (6 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (35 : Fin 78) (9 : Fin 78) (5 : Fin 78)
    (39 : Fin 78) (2 : Fin 78) (60 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0793` (kalmanson). -/
theorem directSource_h0793 :
    ((!((rankAtom (directSourceRanks P) 5 == rankAtom (directSourceRanks P) 60)) || ((rankAtom (directSourceRanks P) 2).ult (rankAtom (directSourceRanks P) 39)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (39 : Fin 78) (5 : Fin 78)
    (2 : Fin 78) (60 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (6 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (35 : Fin 78) (9 : Fin 78) (5 : Fin 78)
    (39 : Fin 78) (2 : Fin 78) (60 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0794` (kalmanson). -/
theorem directSource_h0794 :
    ((!((rankAtom (directSourceRanks P) 5 == rankAtom (directSourceRanks P) 9)) || ((rankAtom (directSourceRanks P) 35).ult (rankAtom (directSourceRanks P) 39)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (39 : Fin 78) (5 : Fin 78)
    (35 : Fin 78) (9 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (6 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (35 : Fin 78) (9 : Fin 78) (5 : Fin 78)
    (39 : Fin 78) (2 : Fin 78) (60 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0795` (kalmanson). -/
theorem directSource_h0795 :
    ((!((rankAtom (directSourceRanks P) 5 == rankAtom (directSourceRanks P) 2)) || ((rankAtom (directSourceRanks P) 61).ult (rankAtom (directSourceRanks P) 40)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (40 : Fin 78) (5 : Fin 78)
    (61 : Fin 78) (2 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (6 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (35 : Fin 78) (10 : Fin 78) (5 : Fin 78)
    (40 : Fin 78) (2 : Fin 78) (61 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0796` (kalmanson). -/
theorem directSource_h0796 :
    ((!((rankAtom (directSourceRanks P) 5 == rankAtom (directSourceRanks P) 61)) || ((rankAtom (directSourceRanks P) 2).ult (rankAtom (directSourceRanks P) 40)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (40 : Fin 78) (5 : Fin 78)
    (2 : Fin 78) (61 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (6 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (35 : Fin 78) (10 : Fin 78) (5 : Fin 78)
    (40 : Fin 78) (2 : Fin 78) (61 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0797` (kalmanson). -/
theorem directSource_h0797 :
    ((!((rankAtom (directSourceRanks P) 5 == rankAtom (directSourceRanks P) 10)) || ((rankAtom (directSourceRanks P) 35).ult (rankAtom (directSourceRanks P) 40)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (40 : Fin 78) (5 : Fin 78)
    (35 : Fin 78) (10 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (6 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (35 : Fin 78) (10 : Fin 78) (5 : Fin 78)
    (40 : Fin 78) (2 : Fin 78) (61 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0798` (kalmanson). -/
theorem directSource_h0798 :
    ((!((rankAtom (directSourceRanks P) 5 == rankAtom (directSourceRanks P) 2)) || ((rankAtom (directSourceRanks P) 62).ult (rankAtom (directSourceRanks P) 41)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (41 : Fin 78) (5 : Fin 78)
    (62 : Fin 78) (2 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (6 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (35 : Fin 78) (11 : Fin 78) (5 : Fin 78)
    (41 : Fin 78) (2 : Fin 78) (62 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0799` (kalmanson). -/
theorem directSource_h0799 :
    ((!((rankAtom (directSourceRanks P) 5 == rankAtom (directSourceRanks P) 62)) || ((rankAtom (directSourceRanks P) 2).ult (rankAtom (directSourceRanks P) 41)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (41 : Fin 78) (5 : Fin 78)
    (2 : Fin 78) (62 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (6 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (35 : Fin 78) (11 : Fin 78) (5 : Fin 78)
    (41 : Fin 78) (2 : Fin 78) (62 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0800` (kalmanson). -/
theorem directSource_h0800 :
    ((!((rankAtom (directSourceRanks P) 5 == rankAtom (directSourceRanks P) 11)) || ((rankAtom (directSourceRanks P) 35).ult (rankAtom (directSourceRanks P) 41)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (41 : Fin 78) (5 : Fin 78)
    (35 : Fin 78) (11 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (6 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (35 : Fin 78) (11 : Fin 78) (5 : Fin 78)
    (41 : Fin 78) (2 : Fin 78) (62 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0801` (kalmanson). -/
theorem directSource_h0801 :
    ((!((rankAtom (directSourceRanks P) 6 == rankAtom (directSourceRanks P) 63)) || ((rankAtom (directSourceRanks P) 2).ult (rankAtom (directSourceRanks P) 37)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (37 : Fin 78) (6 : Fin 78)
    (2 : Fin 78) (63 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (7 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (36 : Fin 78) (7 : Fin 78) (6 : Fin 78)
    (37 : Fin 78) (2 : Fin 78) (63 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0802` (kalmanson). -/
theorem directSource_h0802 :
    ((!((rankAtom (directSourceRanks P) 37 == rankAtom (directSourceRanks P) 63)) || ((rankAtom (directSourceRanks P) 2).ult (rankAtom (directSourceRanks P) 6)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (6 : Fin 78) (37 : Fin 78)
    (2 : Fin 78) (63 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (7 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (36 : Fin 78) (7 : Fin 78) (6 : Fin 78)
    (37 : Fin 78) (2 : Fin 78) (63 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0803` (kalmanson). -/
theorem directSource_h0803 :
    ((!((rankAtom (directSourceRanks P) 6 == rankAtom (directSourceRanks P) 7)) || ((rankAtom (directSourceRanks P) 36).ult (rankAtom (directSourceRanks P) 37)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (37 : Fin 78) (6 : Fin 78)
    (36 : Fin 78) (7 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (7 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (36 : Fin 78) (7 : Fin 78) (6 : Fin 78)
    (37 : Fin 78) (2 : Fin 78) (63 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0804` (kalmanson). -/
theorem directSource_h0804 :
    ((!((rankAtom (directSourceRanks P) 37 == rankAtom (directSourceRanks P) 7)) || ((rankAtom (directSourceRanks P) 36).ult (rankAtom (directSourceRanks P) 6)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (6 : Fin 78) (37 : Fin 78)
    (36 : Fin 78) (7 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (7 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (36 : Fin 78) (7 : Fin 78) (6 : Fin 78)
    (37 : Fin 78) (2 : Fin 78) (63 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0805` (kalmanson). -/
theorem directSource_h0805 :
    ((!((rankAtom (directSourceRanks P) 6 == rankAtom (directSourceRanks P) 2)) || ((rankAtom (directSourceRanks P) 64).ult (rankAtom (directSourceRanks P) 38)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (38 : Fin 78) (6 : Fin 78)
    (64 : Fin 78) (2 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (7 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (36 : Fin 78) (8 : Fin 78) (6 : Fin 78)
    (38 : Fin 78) (2 : Fin 78) (64 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0806` (kalmanson). -/
theorem directSource_h0806 :
    ((!((rankAtom (directSourceRanks P) 6 == rankAtom (directSourceRanks P) 8)) || ((rankAtom (directSourceRanks P) 36).ult (rankAtom (directSourceRanks P) 38)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (38 : Fin 78) (6 : Fin 78)
    (36 : Fin 78) (8 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (7 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (36 : Fin 78) (8 : Fin 78) (6 : Fin 78)
    (38 : Fin 78) (2 : Fin 78) (64 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0807` (kalmanson). -/
theorem directSource_h0807 :
    ((!((rankAtom (directSourceRanks P) 6 == rankAtom (directSourceRanks P) 9)) || ((rankAtom (directSourceRanks P) 36).ult (rankAtom (directSourceRanks P) 39)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (39 : Fin 78) (6 : Fin 78)
    (36 : Fin 78) (9 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (7 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (36 : Fin 78) (9 : Fin 78) (6 : Fin 78)
    (39 : Fin 78) (2 : Fin 78) (65 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0808` (kalmanson). -/
theorem directSource_h0808 :
    ((!((rankAtom (directSourceRanks P) 6 == rankAtom (directSourceRanks P) 2)) || ((rankAtom (directSourceRanks P) 66).ult (rankAtom (directSourceRanks P) 40)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (40 : Fin 78) (6 : Fin 78)
    (66 : Fin 78) (2 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (7 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (36 : Fin 78) (10 : Fin 78) (6 : Fin 78)
    (40 : Fin 78) (2 : Fin 78) (66 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0809` (kalmanson). -/
theorem directSource_h0809 :
    ((!((rankAtom (directSourceRanks P) 6 == rankAtom (directSourceRanks P) 10)) || ((rankAtom (directSourceRanks P) 36).ult (rankAtom (directSourceRanks P) 40)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (40 : Fin 78) (6 : Fin 78)
    (36 : Fin 78) (10 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (7 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (36 : Fin 78) (10 : Fin 78) (6 : Fin 78)
    (40 : Fin 78) (2 : Fin 78) (66 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0810` (kalmanson). -/
theorem directSource_h0810 :
    ((!((rankAtom (directSourceRanks P) 6 == rankAtom (directSourceRanks P) 2)) || ((rankAtom (directSourceRanks P) 67).ult (rankAtom (directSourceRanks P) 41)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (41 : Fin 78) (6 : Fin 78)
    (67 : Fin 78) (2 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (7 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (36 : Fin 78) (11 : Fin 78) (6 : Fin 78)
    (41 : Fin 78) (2 : Fin 78) (67 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0811` (kalmanson). -/
theorem directSource_h0811 :
    ((!((rankAtom (directSourceRanks P) 6 == rankAtom (directSourceRanks P) 11)) || ((rankAtom (directSourceRanks P) 36).ult (rankAtom (directSourceRanks P) 41)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (41 : Fin 78) (6 : Fin 78)
    (36 : Fin 78) (11 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (7 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (36 : Fin 78) (11 : Fin 78) (6 : Fin 78)
    (41 : Fin 78) (2 : Fin 78) (67 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0812` (kalmanson). -/
theorem directSource_h0812 :
    ((!((rankAtom (directSourceRanks P) 7 == rankAtom (directSourceRanks P) 37)) || ((rankAtom (directSourceRanks P) 8).ult (rankAtom (directSourceRanks P) 38)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (38 : Fin 78) (7 : Fin 78)
    (8 : Fin 78) (37 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (8 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (37 : Fin 78) (8 : Fin 78) (7 : Fin 78)
    (38 : Fin 78) (2 : Fin 78) (68 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0813` (kalmanson). -/
theorem directSource_h0813 :
    ((!((rankAtom (directSourceRanks P) 7 == rankAtom (directSourceRanks P) 37)) || ((rankAtom (directSourceRanks P) 9).ult (rankAtom (directSourceRanks P) 39)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (39 : Fin 78) (7 : Fin 78)
    (9 : Fin 78) (37 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (8 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (37 : Fin 78) (9 : Fin 78) (7 : Fin 78)
    (39 : Fin 78) (2 : Fin 78) (69 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0814` (kalmanson). -/
theorem directSource_h0814 :
    ((!((rankAtom (directSourceRanks P) 7 == rankAtom (directSourceRanks P) 37)) || ((rankAtom (directSourceRanks P) 10).ult (rankAtom (directSourceRanks P) 40)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (40 : Fin 78) (7 : Fin 78)
    (10 : Fin 78) (37 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (8 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (37 : Fin 78) (10 : Fin 78) (7 : Fin 78)
    (40 : Fin 78) (2 : Fin 78) (70 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0815` (kalmanson). -/
theorem directSource_h0815 :
    ((!((rankAtom (directSourceRanks P) 7 == rankAtom (directSourceRanks P) 37)) || ((rankAtom (directSourceRanks P) 11).ult (rankAtom (directSourceRanks P) 41)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (41 : Fin 78) (7 : Fin 78)
    (11 : Fin 78) (37 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (8 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (37 : Fin 78) (11 : Fin 78) (7 : Fin 78)
    (41 : Fin 78) (2 : Fin 78) (71 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0816` (kalmanson). -/
theorem directSource_h0816 :
    ((!((rankAtom (directSourceRanks P) 8 == rankAtom (directSourceRanks P) 9)) || ((rankAtom (directSourceRanks P) 38).ult (rankAtom (directSourceRanks P) 39)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (39 : Fin 78) (8 : Fin 78)
    (38 : Fin 78) (9 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (9 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (38 : Fin 78) (9 : Fin 78) (8 : Fin 78)
    (39 : Fin 78) (2 : Fin 78) (72 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0817` (kalmanson). -/
theorem directSource_h0817 :
    ((!((rankAtom (directSourceRanks P) 8 == rankAtom (directSourceRanks P) 10)) || ((rankAtom (directSourceRanks P) 38).ult (rankAtom (directSourceRanks P) 40)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (40 : Fin 78) (8 : Fin 78)
    (38 : Fin 78) (10 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (9 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (38 : Fin 78) (10 : Fin 78) (8 : Fin 78)
    (40 : Fin 78) (2 : Fin 78) (73 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0818` (kalmanson). -/
theorem directSource_h0818 :
    ((!((rankAtom (directSourceRanks P) 9 == rankAtom (directSourceRanks P) 10)) || ((rankAtom (directSourceRanks P) 39).ult (rankAtom (directSourceRanks P) 40)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (40 : Fin 78) (9 : Fin 78)
    (39 : Fin 78) (10 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (10 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (39 : Fin 78) (10 : Fin 78) (9 : Fin 78)
    (40 : Fin 78) (2 : Fin 78) (75 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0819` (kalmanson). -/
theorem directSource_h0819 :
    ((!((rankAtom (directSourceRanks P) 9 == rankAtom (directSourceRanks P) 11)) || ((rankAtom (directSourceRanks P) 39).ult (rankAtom (directSourceRanks P) 41)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (41 : Fin 78) (9 : Fin 78)
    (39 : Fin 78) (11 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (10 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (39 : Fin 78) (11 : Fin 78) (9 : Fin 78)
    (41 : Fin 78) (2 : Fin 78) (76 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0820` (kalmanson). -/
theorem directSource_h0820 :
    ((!((rankAtom (directSourceRanks P) 10 == rankAtom (directSourceRanks P) 11)) || ((rankAtom (directSourceRanks P) 40).ult (rankAtom (directSourceRanks P) 41)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (41 : Fin 78) (10 : Fin 78)
    (40 : Fin 78) (11 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (3 : Fin 13) (11 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (40 : Fin 78) (11 : Fin 78) (10 : Fin 78)
    (41 : Fin 78) (2 : Fin 78) (77 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0821` (kalmanson). -/
theorem directSource_h0821 :
    ((!((rankAtom (directSourceRanks P) 4 == rankAtom (directSourceRanks P) 3)) || ((rankAtom (directSourceRanks P) 50).ult (rankAtom (directSourceRanks P) 43)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (43 : Fin 78) (4 : Fin 78)
    (50 : Fin 78) (3 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (5 : Fin 13) (6 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (5 : Fin 78) (4 : Fin 78)
    (43 : Fin 78) (3 : Fin 78) (50 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0822` (kalmanson). -/
theorem directSource_h0822 :
    ((!((rankAtom (directSourceRanks P) 4 == rankAtom (directSourceRanks P) 50)) || ((rankAtom (directSourceRanks P) 3).ult (rankAtom (directSourceRanks P) 43)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (43 : Fin 78) (4 : Fin 78)
    (3 : Fin 78) (50 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (5 : Fin 13) (6 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (5 : Fin 78) (4 : Fin 78)
    (43 : Fin 78) (3 : Fin 78) (50 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0823` (kalmanson). -/
theorem directSource_h0823 :
    ((!((rankAtom (directSourceRanks P) 43 == rankAtom (directSourceRanks P) 50)) || ((rankAtom (directSourceRanks P) 3).ult (rankAtom (directSourceRanks P) 4)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (4 : Fin 78) (43 : Fin 78)
    (3 : Fin 78) (50 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (5 : Fin 13) (6 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (5 : Fin 78) (4 : Fin 78)
    (43 : Fin 78) (3 : Fin 78) (50 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0824` (kalmanson). -/
theorem directSource_h0824 :
    ((!((rankAtom (directSourceRanks P) 4 == rankAtom (directSourceRanks P) 5)) || ((rankAtom (directSourceRanks P) 42).ult (rankAtom (directSourceRanks P) 43)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (43 : Fin 78) (4 : Fin 78)
    (42 : Fin 78) (5 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (5 : Fin 13) (6 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (5 : Fin 78) (4 : Fin 78)
    (43 : Fin 78) (3 : Fin 78) (50 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0825` (kalmanson). -/
theorem directSource_h0825 :
    ((!((rankAtom (directSourceRanks P) 4 == rankAtom (directSourceRanks P) 42)) || ((rankAtom (directSourceRanks P) 5).ult (rankAtom (directSourceRanks P) 43)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (43 : Fin 78) (4 : Fin 78)
    (5 : Fin 78) (42 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (5 : Fin 13) (6 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (5 : Fin 78) (4 : Fin 78)
    (43 : Fin 78) (3 : Fin 78) (50 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0826` (kalmanson). -/
theorem directSource_h0826 :
    ((!((rankAtom (directSourceRanks P) 43 == rankAtom (directSourceRanks P) 5)) || ((rankAtom (directSourceRanks P) 42).ult (rankAtom (directSourceRanks P) 4)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (4 : Fin 78) (43 : Fin 78)
    (42 : Fin 78) (5 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (5 : Fin 13) (6 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (5 : Fin 78) (4 : Fin 78)
    (43 : Fin 78) (3 : Fin 78) (50 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0827` (kalmanson). -/
theorem directSource_h0827 :
    ((!((rankAtom (directSourceRanks P) 43 == rankAtom (directSourceRanks P) 42)) || ((rankAtom (directSourceRanks P) 5).ult (rankAtom (directSourceRanks P) 4)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (4 : Fin 78) (43 : Fin 78)
    (5 : Fin 78) (42 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (5 : Fin 13) (6 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (5 : Fin 78) (4 : Fin 78)
    (43 : Fin 78) (3 : Fin 78) (50 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0828` (kalmanson). -/
theorem directSource_h0828 :
    ((!((rankAtom (directSourceRanks P) 4 == rankAtom (directSourceRanks P) 3)) || ((rankAtom (directSourceRanks P) 51).ult (rankAtom (directSourceRanks P) 44)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (44 : Fin 78) (4 : Fin 78)
    (51 : Fin 78) (3 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (5 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (6 : Fin 78) (4 : Fin 78)
    (44 : Fin 78) (3 : Fin 78) (51 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0829` (kalmanson). -/
theorem directSource_h0829 :
    ((!((rankAtom (directSourceRanks P) 4 == rankAtom (directSourceRanks P) 51)) || ((rankAtom (directSourceRanks P) 3).ult (rankAtom (directSourceRanks P) 44)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (44 : Fin 78) (4 : Fin 78)
    (3 : Fin 78) (51 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (5 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (6 : Fin 78) (4 : Fin 78)
    (44 : Fin 78) (3 : Fin 78) (51 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0830` (kalmanson). -/
theorem directSource_h0830 :
    ((!((rankAtom (directSourceRanks P) 4 == rankAtom (directSourceRanks P) 6)) || ((rankAtom (directSourceRanks P) 42).ult (rankAtom (directSourceRanks P) 44)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (44 : Fin 78) (4 : Fin 78)
    (42 : Fin 78) (6 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (5 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (6 : Fin 78) (4 : Fin 78)
    (44 : Fin 78) (3 : Fin 78) (51 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0831` (kalmanson). -/
theorem directSource_h0831 :
    ((!((rankAtom (directSourceRanks P) 4 == rankAtom (directSourceRanks P) 42)) || ((rankAtom (directSourceRanks P) 6).ult (rankAtom (directSourceRanks P) 44)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (44 : Fin 78) (4 : Fin 78)
    (6 : Fin 78) (42 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (4 : Fin 13) (5 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (42 : Fin 78) (6 : Fin 78) (4 : Fin 78)
    (44 : Fin 78) (3 : Fin 78) (51 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

end

end ATailExactFiveCard13CnfIngressScratch
end Problem97
