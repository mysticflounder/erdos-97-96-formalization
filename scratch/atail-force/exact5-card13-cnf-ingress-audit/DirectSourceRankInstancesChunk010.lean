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

/-- Exact pass-5 source assertion `h0640` (kalmanson). -/
theorem directSource_h0640 :
    ((!((rankAtom (directSourceRanks P) 7 == rankAtom (directSourceRanks P) 18)) || ((rankAtom (directSourceRanks P) 11).ult (rankAtom (directSourceRanks P) 22)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (22 : Fin 78) (7 : Fin 78)
    (11 : Fin 78) (18 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (8 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (18 : Fin 78) (11 : Fin 78) (7 : Fin 78)
    (22 : Fin 78) (0 : Fin 78) (71 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0641` (kalmanson). -/
theorem directSource_h0641 :
    ((!((rankAtom (directSourceRanks P) 2 == rankAtom (directSourceRanks P) 4)) || ((rankAtom (directSourceRanks P) 23).ult (rankAtom (directSourceRanks P) 25)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (25 : Fin 78) (2 : Fin 78)
    (23 : Fin 78) (4 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (3 : Fin 13) (5 : Fin 13)
    (by decide) (by decide) (by decide)
    (23 : Fin 78) (4 : Fin 78) (2 : Fin 78)
    (25 : Fin 78) (1 : Fin 78) (34 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0642` (kalmanson). -/
theorem directSource_h0642 :
    ((!((rankAtom (directSourceRanks P) 25 == rankAtom (directSourceRanks P) 4)) || ((rankAtom (directSourceRanks P) 23).ult (rankAtom (directSourceRanks P) 2)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (2 : Fin 78) (25 : Fin 78)
    (23 : Fin 78) (4 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (3 : Fin 13) (5 : Fin 13)
    (by decide) (by decide) (by decide)
    (23 : Fin 78) (4 : Fin 78) (2 : Fin 78)
    (25 : Fin 78) (1 : Fin 78) (34 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0643` (kalmanson). -/
theorem directSource_h0643 :
    ((!((rankAtom (directSourceRanks P) 25 == rankAtom (directSourceRanks P) 23)) || ((rankAtom (directSourceRanks P) 4).ult (rankAtom (directSourceRanks P) 2)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (2 : Fin 78) (25 : Fin 78)
    (4 : Fin 78) (23 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (3 : Fin 13) (5 : Fin 13)
    (by decide) (by decide) (by decide)
    (23 : Fin 78) (4 : Fin 78) (2 : Fin 78)
    (25 : Fin 78) (1 : Fin 78) (34 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0644` (kalmanson). -/
theorem directSource_h0644 :
    ((!((rankAtom (directSourceRanks P) 2 == rankAtom (directSourceRanks P) 5)) || ((rankAtom (directSourceRanks P) 23).ult (rankAtom (directSourceRanks P) 26)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (26 : Fin 78) (2 : Fin 78)
    (23 : Fin 78) (5 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (3 : Fin 13) (6 : Fin 13)
    (by decide) (by decide) (by decide)
    (23 : Fin 78) (5 : Fin 78) (2 : Fin 78)
    (26 : Fin 78) (1 : Fin 78) (35 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0645` (kalmanson). -/
theorem directSource_h0645 :
    ((!((rankAtom (directSourceRanks P) 26 == rankAtom (directSourceRanks P) 23)) || ((rankAtom (directSourceRanks P) 5).ult (rankAtom (directSourceRanks P) 2)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (2 : Fin 78) (26 : Fin 78)
    (5 : Fin 78) (23 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (3 : Fin 13) (6 : Fin 13)
    (by decide) (by decide) (by decide)
    (23 : Fin 78) (5 : Fin 78) (2 : Fin 78)
    (26 : Fin 78) (1 : Fin 78) (35 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0646` (kalmanson). -/
theorem directSource_h0646 :
    ((!((rankAtom (directSourceRanks P) 2 == rankAtom (directSourceRanks P) 6)) || ((rankAtom (directSourceRanks P) 23).ult (rankAtom (directSourceRanks P) 27)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (27 : Fin 78) (2 : Fin 78)
    (23 : Fin 78) (6 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (3 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (23 : Fin 78) (6 : Fin 78) (2 : Fin 78)
    (27 : Fin 78) (1 : Fin 78) (36 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0647` (kalmanson). -/
theorem directSource_h0647 :
    ((!((rankAtom (directSourceRanks P) 27 == rankAtom (directSourceRanks P) 23)) || ((rankAtom (directSourceRanks P) 6).ult (rankAtom (directSourceRanks P) 2)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (2 : Fin 78) (27 : Fin 78)
    (6 : Fin 78) (23 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (3 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (23 : Fin 78) (6 : Fin 78) (2 : Fin 78)
    (27 : Fin 78) (1 : Fin 78) (36 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0648` (kalmanson). -/
theorem directSource_h0648 :
    ((!((rankAtom (directSourceRanks P) 28 == rankAtom (directSourceRanks P) 1)) || ((rankAtom (directSourceRanks P) 37).ult (rankAtom (directSourceRanks P) 2)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (2 : Fin 78) (28 : Fin 78)
    (37 : Fin 78) (1 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (3 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (23 : Fin 78) (7 : Fin 78) (2 : Fin 78)
    (28 : Fin 78) (1 : Fin 78) (37 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0649` (kalmanson). -/
theorem directSource_h0649 :
    ((!((rankAtom (directSourceRanks P) 28 == rankAtom (directSourceRanks P) 37)) || ((rankAtom (directSourceRanks P) 1).ult (rankAtom (directSourceRanks P) 2)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (2 : Fin 78) (28 : Fin 78)
    (1 : Fin 78) (37 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (3 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (23 : Fin 78) (7 : Fin 78) (2 : Fin 78)
    (28 : Fin 78) (1 : Fin 78) (37 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0650` (kalmanson). -/
theorem directSource_h0650 :
    ((!((rankAtom (directSourceRanks P) 2 == rankAtom (directSourceRanks P) 23)) || ((rankAtom (directSourceRanks P) 7).ult (rankAtom (directSourceRanks P) 28)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (28 : Fin 78) (2 : Fin 78)
    (7 : Fin 78) (23 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (3 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (23 : Fin 78) (7 : Fin 78) (2 : Fin 78)
    (28 : Fin 78) (1 : Fin 78) (37 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0651` (kalmanson). -/
theorem directSource_h0651 :
    ((!((rankAtom (directSourceRanks P) 28 == rankAtom (directSourceRanks P) 7)) || ((rankAtom (directSourceRanks P) 23).ult (rankAtom (directSourceRanks P) 2)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (2 : Fin 78) (28 : Fin 78)
    (23 : Fin 78) (7 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (3 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (23 : Fin 78) (7 : Fin 78) (2 : Fin 78)
    (28 : Fin 78) (1 : Fin 78) (37 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0652` (kalmanson). -/
theorem directSource_h0652 :
    ((!((rankAtom (directSourceRanks P) 28 == rankAtom (directSourceRanks P) 23)) || ((rankAtom (directSourceRanks P) 7).ult (rankAtom (directSourceRanks P) 2)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (2 : Fin 78) (28 : Fin 78)
    (7 : Fin 78) (23 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (3 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (23 : Fin 78) (7 : Fin 78) (2 : Fin 78)
    (28 : Fin 78) (1 : Fin 78) (37 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0653` (kalmanson). -/
theorem directSource_h0653 :
    ((!((rankAtom (directSourceRanks P) 3 == rankAtom (directSourceRanks P) 42)) || ((rankAtom (directSourceRanks P) 1).ult (rankAtom (directSourceRanks P) 25)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (25 : Fin 78) (3 : Fin 78)
    (1 : Fin 78) (42 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (4 : Fin 13) (5 : Fin 13)
    (by decide) (by decide) (by decide)
    (24 : Fin 78) (4 : Fin 78) (3 : Fin 78)
    (25 : Fin 78) (1 : Fin 78) (42 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0654` (kalmanson). -/
theorem directSource_h0654 :
    ((!((rankAtom (directSourceRanks P) 3 == rankAtom (directSourceRanks P) 4)) || ((rankAtom (directSourceRanks P) 24).ult (rankAtom (directSourceRanks P) 25)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (25 : Fin 78) (3 : Fin 78)
    (24 : Fin 78) (4 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (4 : Fin 13) (5 : Fin 13)
    (by decide) (by decide) (by decide)
    (24 : Fin 78) (4 : Fin 78) (3 : Fin 78)
    (25 : Fin 78) (1 : Fin 78) (42 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0655` (kalmanson). -/
theorem directSource_h0655 :
    ((!((rankAtom (directSourceRanks P) 26 == rankAtom (directSourceRanks P) 43)) || ((rankAtom (directSourceRanks P) 1).ult (rankAtom (directSourceRanks P) 3)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (3 : Fin 78) (26 : Fin 78)
    (1 : Fin 78) (43 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (4 : Fin 13) (6 : Fin 13)
    (by decide) (by decide) (by decide)
    (24 : Fin 78) (5 : Fin 78) (3 : Fin 78)
    (26 : Fin 78) (1 : Fin 78) (43 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0656` (kalmanson). -/
theorem directSource_h0656 :
    ((!((rankAtom (directSourceRanks P) 3 == rankAtom (directSourceRanks P) 5)) || ((rankAtom (directSourceRanks P) 24).ult (rankAtom (directSourceRanks P) 26)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (26 : Fin 78) (3 : Fin 78)
    (24 : Fin 78) (5 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (4 : Fin 13) (6 : Fin 13)
    (by decide) (by decide) (by decide)
    (24 : Fin 78) (5 : Fin 78) (3 : Fin 78)
    (26 : Fin 78) (1 : Fin 78) (43 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0657` (kalmanson). -/
theorem directSource_h0657 :
    ((!((rankAtom (directSourceRanks P) 3 == rankAtom (directSourceRanks P) 6)) || ((rankAtom (directSourceRanks P) 24).ult (rankAtom (directSourceRanks P) 27)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (27 : Fin 78) (3 : Fin 78)
    (24 : Fin 78) (6 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (4 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (24 : Fin 78) (6 : Fin 78) (3 : Fin 78)
    (27 : Fin 78) (1 : Fin 78) (44 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0658` (kalmanson). -/
theorem directSource_h0658 :
    ((!((rankAtom (directSourceRanks P) 28 == rankAtom (directSourceRanks P) 45)) || ((rankAtom (directSourceRanks P) 1).ult (rankAtom (directSourceRanks P) 3)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (3 : Fin 78) (28 : Fin 78)
    (1 : Fin 78) (45 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (4 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (24 : Fin 78) (7 : Fin 78) (3 : Fin 78)
    (28 : Fin 78) (1 : Fin 78) (45 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0659` (kalmanson). -/
theorem directSource_h0659 :
    ((!((rankAtom (directSourceRanks P) 3 == rankAtom (directSourceRanks P) 7)) || ((rankAtom (directSourceRanks P) 24).ult (rankAtom (directSourceRanks P) 28)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (28 : Fin 78) (3 : Fin 78)
    (24 : Fin 78) (7 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (4 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (24 : Fin 78) (7 : Fin 78) (3 : Fin 78)
    (28 : Fin 78) (1 : Fin 78) (45 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0660` (kalmanson). -/
theorem directSource_h0660 :
    ((!((rankAtom (directSourceRanks P) 3 == rankAtom (directSourceRanks P) 24)) || ((rankAtom (directSourceRanks P) 7).ult (rankAtom (directSourceRanks P) 28)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (28 : Fin 78) (3 : Fin 78)
    (7 : Fin 78) (24 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (4 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (24 : Fin 78) (7 : Fin 78) (3 : Fin 78)
    (28 : Fin 78) (1 : Fin 78) (45 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0661` (kalmanson). -/
theorem directSource_h0661 :
    ((!((rankAtom (directSourceRanks P) 28 == rankAtom (directSourceRanks P) 7)) || ((rankAtom (directSourceRanks P) 24).ult (rankAtom (directSourceRanks P) 3)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (3 : Fin 78) (28 : Fin 78)
    (24 : Fin 78) (7 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (4 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (24 : Fin 78) (7 : Fin 78) (3 : Fin 78)
    (28 : Fin 78) (1 : Fin 78) (45 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0662` (kalmanson). -/
theorem directSource_h0662 :
    ((!((rankAtom (directSourceRanks P) 3 == rankAtom (directSourceRanks P) 46)) || ((rankAtom (directSourceRanks P) 1).ult (rankAtom (directSourceRanks P) 29)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (29 : Fin 78) (3 : Fin 78)
    (1 : Fin 78) (46 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (4 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (24 : Fin 78) (8 : Fin 78) (3 : Fin 78)
    (29 : Fin 78) (1 : Fin 78) (46 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0663` (kalmanson). -/
theorem directSource_h0663 :
    ((!((rankAtom (directSourceRanks P) 3 == rankAtom (directSourceRanks P) 8)) || ((rankAtom (directSourceRanks P) 24).ult (rankAtom (directSourceRanks P) 29)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (29 : Fin 78) (3 : Fin 78)
    (24 : Fin 78) (8 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (4 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (24 : Fin 78) (8 : Fin 78) (3 : Fin 78)
    (29 : Fin 78) (1 : Fin 78) (46 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0664` (kalmanson). -/
theorem directSource_h0664 :
    ((!((rankAtom (directSourceRanks P) 3 == rankAtom (directSourceRanks P) 47)) || ((rankAtom (directSourceRanks P) 1).ult (rankAtom (directSourceRanks P) 30)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (30 : Fin 78) (3 : Fin 78)
    (1 : Fin 78) (47 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (4 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (24 : Fin 78) (9 : Fin 78) (3 : Fin 78)
    (30 : Fin 78) (1 : Fin 78) (47 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0665` (kalmanson). -/
theorem directSource_h0665 :
    ((!((rankAtom (directSourceRanks P) 3 == rankAtom (directSourceRanks P) 48)) || ((rankAtom (directSourceRanks P) 1).ult (rankAtom (directSourceRanks P) 31)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (31 : Fin 78) (3 : Fin 78)
    (1 : Fin 78) (48 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (4 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (24 : Fin 78) (10 : Fin 78) (3 : Fin 78)
    (31 : Fin 78) (1 : Fin 78) (48 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0666` (kalmanson). -/
theorem directSource_h0666 :
    ((!((rankAtom (directSourceRanks P) 3 == rankAtom (directSourceRanks P) 10)) || ((rankAtom (directSourceRanks P) 24).ult (rankAtom (directSourceRanks P) 31)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (31 : Fin 78) (3 : Fin 78)
    (24 : Fin 78) (10 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (4 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (24 : Fin 78) (10 : Fin 78) (3 : Fin 78)
    (31 : Fin 78) (1 : Fin 78) (48 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0667` (kalmanson). -/
theorem directSource_h0667 :
    ((!((rankAtom (directSourceRanks P) 3 == rankAtom (directSourceRanks P) 49)) || ((rankAtom (directSourceRanks P) 1).ult (rankAtom (directSourceRanks P) 32)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (32 : Fin 78) (3 : Fin 78)
    (1 : Fin 78) (49 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (4 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (24 : Fin 78) (11 : Fin 78) (3 : Fin 78)
    (32 : Fin 78) (1 : Fin 78) (49 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0668` (kalmanson). -/
theorem directSource_h0668 :
    ((!((rankAtom (directSourceRanks P) 3 == rankAtom (directSourceRanks P) 11)) || ((rankAtom (directSourceRanks P) 24).ult (rankAtom (directSourceRanks P) 32)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (32 : Fin 78) (3 : Fin 78)
    (24 : Fin 78) (11 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (4 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (24 : Fin 78) (11 : Fin 78) (3 : Fin 78)
    (32 : Fin 78) (1 : Fin 78) (49 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0669` (kalmanson). -/
theorem directSource_h0669 :
    ((!((rankAtom (directSourceRanks P) 4 == rankAtom (directSourceRanks P) 1)) || ((rankAtom (directSourceRanks P) 50).ult (rankAtom (directSourceRanks P) 26)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (26 : Fin 78) (4 : Fin 78)
    (50 : Fin 78) (1 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (5 : Fin 13) (6 : Fin 13)
    (by decide) (by decide) (by decide)
    (25 : Fin 78) (5 : Fin 78) (4 : Fin 78)
    (26 : Fin 78) (1 : Fin 78) (50 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0670` (kalmanson). -/
theorem directSource_h0670 :
    ((!((rankAtom (directSourceRanks P) 4 == rankAtom (directSourceRanks P) 50)) || ((rankAtom (directSourceRanks P) 1).ult (rankAtom (directSourceRanks P) 26)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (26 : Fin 78) (4 : Fin 78)
    (1 : Fin 78) (50 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (5 : Fin 13) (6 : Fin 13)
    (by decide) (by decide) (by decide)
    (25 : Fin 78) (5 : Fin 78) (4 : Fin 78)
    (26 : Fin 78) (1 : Fin 78) (50 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0671` (kalmanson). -/
theorem directSource_h0671 :
    ((!((rankAtom (directSourceRanks P) 26 == rankAtom (directSourceRanks P) 50)) || ((rankAtom (directSourceRanks P) 1).ult (rankAtom (directSourceRanks P) 4)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (4 : Fin 78) (26 : Fin 78)
    (1 : Fin 78) (50 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (5 : Fin 13) (6 : Fin 13)
    (by decide) (by decide) (by decide)
    (25 : Fin 78) (5 : Fin 78) (4 : Fin 78)
    (26 : Fin 78) (1 : Fin 78) (50 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0672` (kalmanson). -/
theorem directSource_h0672 :
    ((!((rankAtom (directSourceRanks P) 4 == rankAtom (directSourceRanks P) 5)) || ((rankAtom (directSourceRanks P) 25).ult (rankAtom (directSourceRanks P) 26)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (26 : Fin 78) (4 : Fin 78)
    (25 : Fin 78) (5 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (5 : Fin 13) (6 : Fin 13)
    (by decide) (by decide) (by decide)
    (25 : Fin 78) (5 : Fin 78) (4 : Fin 78)
    (26 : Fin 78) (1 : Fin 78) (50 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0673` (kalmanson). -/
theorem directSource_h0673 :
    ((!((rankAtom (directSourceRanks P) 4 == rankAtom (directSourceRanks P) 25)) || ((rankAtom (directSourceRanks P) 5).ult (rankAtom (directSourceRanks P) 26)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (26 : Fin 78) (4 : Fin 78)
    (5 : Fin 78) (25 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (5 : Fin 13) (6 : Fin 13)
    (by decide) (by decide) (by decide)
    (25 : Fin 78) (5 : Fin 78) (4 : Fin 78)
    (26 : Fin 78) (1 : Fin 78) (50 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0674` (kalmanson). -/
theorem directSource_h0674 :
    ((!((rankAtom (directSourceRanks P) 26 == rankAtom (directSourceRanks P) 25)) || ((rankAtom (directSourceRanks P) 5).ult (rankAtom (directSourceRanks P) 4)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (4 : Fin 78) (26 : Fin 78)
    (5 : Fin 78) (25 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (5 : Fin 13) (6 : Fin 13)
    (by decide) (by decide) (by decide)
    (25 : Fin 78) (5 : Fin 78) (4 : Fin 78)
    (26 : Fin 78) (1 : Fin 78) (50 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0675` (kalmanson). -/
theorem directSource_h0675 :
    ((!((rankAtom (directSourceRanks P) 4 == rankAtom (directSourceRanks P) 1)) || ((rankAtom (directSourceRanks P) 51).ult (rankAtom (directSourceRanks P) 27)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (27 : Fin 78) (4 : Fin 78)
    (51 : Fin 78) (1 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (5 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (25 : Fin 78) (6 : Fin 78) (4 : Fin 78)
    (27 : Fin 78) (1 : Fin 78) (51 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0676` (kalmanson). -/
theorem directSource_h0676 :
    ((!((rankAtom (directSourceRanks P) 4 == rankAtom (directSourceRanks P) 51)) || ((rankAtom (directSourceRanks P) 1).ult (rankAtom (directSourceRanks P) 27)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (27 : Fin 78) (4 : Fin 78)
    (1 : Fin 78) (51 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (5 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (25 : Fin 78) (6 : Fin 78) (4 : Fin 78)
    (27 : Fin 78) (1 : Fin 78) (51 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0677` (kalmanson). -/
theorem directSource_h0677 :
    ((!((rankAtom (directSourceRanks P) 4 == rankAtom (directSourceRanks P) 6)) || ((rankAtom (directSourceRanks P) 25).ult (rankAtom (directSourceRanks P) 27)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (27 : Fin 78) (4 : Fin 78)
    (25 : Fin 78) (6 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (5 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (25 : Fin 78) (6 : Fin 78) (4 : Fin 78)
    (27 : Fin 78) (1 : Fin 78) (51 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0678` (kalmanson). -/
theorem directSource_h0678 :
    ((!((rankAtom (directSourceRanks P) 4 == rankAtom (directSourceRanks P) 25)) || ((rankAtom (directSourceRanks P) 6).ult (rankAtom (directSourceRanks P) 27)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (27 : Fin 78) (4 : Fin 78)
    (6 : Fin 78) (25 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (5 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (25 : Fin 78) (6 : Fin 78) (4 : Fin 78)
    (27 : Fin 78) (1 : Fin 78) (51 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0679` (kalmanson). -/
theorem directSource_h0679 :
    ((!((rankAtom (directSourceRanks P) 27 == rankAtom (directSourceRanks P) 25)) || ((rankAtom (directSourceRanks P) 6).ult (rankAtom (directSourceRanks P) 4)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (4 : Fin 78) (27 : Fin 78)
    (6 : Fin 78) (25 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (5 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (25 : Fin 78) (6 : Fin 78) (4 : Fin 78)
    (27 : Fin 78) (1 : Fin 78) (51 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0680` (kalmanson). -/
theorem directSource_h0680 :
    ((!((rankAtom (directSourceRanks P) 4 == rankAtom (directSourceRanks P) 1)) || ((rankAtom (directSourceRanks P) 52).ult (rankAtom (directSourceRanks P) 28)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (28 : Fin 78) (4 : Fin 78)
    (52 : Fin 78) (1 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (5 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (25 : Fin 78) (7 : Fin 78) (4 : Fin 78)
    (28 : Fin 78) (1 : Fin 78) (52 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0681` (kalmanson). -/
theorem directSource_h0681 :
    ((!((rankAtom (directSourceRanks P) 4 == rankAtom (directSourceRanks P) 52)) || ((rankAtom (directSourceRanks P) 1).ult (rankAtom (directSourceRanks P) 28)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (28 : Fin 78) (4 : Fin 78)
    (1 : Fin 78) (52 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (5 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (25 : Fin 78) (7 : Fin 78) (4 : Fin 78)
    (28 : Fin 78) (1 : Fin 78) (52 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0682` (kalmanson). -/
theorem directSource_h0682 :
    ((!((rankAtom (directSourceRanks P) 28 == rankAtom (directSourceRanks P) 52)) || ((rankAtom (directSourceRanks P) 1).ult (rankAtom (directSourceRanks P) 4)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (4 : Fin 78) (28 : Fin 78)
    (1 : Fin 78) (52 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (5 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (25 : Fin 78) (7 : Fin 78) (4 : Fin 78)
    (28 : Fin 78) (1 : Fin 78) (52 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0683` (kalmanson). -/
theorem directSource_h0683 :
    ((!((rankAtom (directSourceRanks P) 4 == rankAtom (directSourceRanks P) 7)) || ((rankAtom (directSourceRanks P) 25).ult (rankAtom (directSourceRanks P) 28)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (28 : Fin 78) (4 : Fin 78)
    (25 : Fin 78) (7 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (5 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (25 : Fin 78) (7 : Fin 78) (4 : Fin 78)
    (28 : Fin 78) (1 : Fin 78) (52 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0684` (kalmanson). -/
theorem directSource_h0684 :
    ((!((rankAtom (directSourceRanks P) 4 == rankAtom (directSourceRanks P) 25)) || ((rankAtom (directSourceRanks P) 7).ult (rankAtom (directSourceRanks P) 28)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (28 : Fin 78) (4 : Fin 78)
    (7 : Fin 78) (25 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (5 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (25 : Fin 78) (7 : Fin 78) (4 : Fin 78)
    (28 : Fin 78) (1 : Fin 78) (52 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0685` (kalmanson). -/
theorem directSource_h0685 :
    ((!((rankAtom (directSourceRanks P) 28 == rankAtom (directSourceRanks P) 7)) || ((rankAtom (directSourceRanks P) 25).ult (rankAtom (directSourceRanks P) 4)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (4 : Fin 78) (28 : Fin 78)
    (25 : Fin 78) (7 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (5 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (25 : Fin 78) (7 : Fin 78) (4 : Fin 78)
    (28 : Fin 78) (1 : Fin 78) (52 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0686` (kalmanson). -/
theorem directSource_h0686 :
    ((!((rankAtom (directSourceRanks P) 28 == rankAtom (directSourceRanks P) 25)) || ((rankAtom (directSourceRanks P) 7).ult (rankAtom (directSourceRanks P) 4)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (4 : Fin 78) (28 : Fin 78)
    (7 : Fin 78) (25 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (5 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (25 : Fin 78) (7 : Fin 78) (4 : Fin 78)
    (28 : Fin 78) (1 : Fin 78) (52 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0687` (kalmanson). -/
theorem directSource_h0687 :
    ((!((rankAtom (directSourceRanks P) 4 == rankAtom (directSourceRanks P) 1)) || ((rankAtom (directSourceRanks P) 53).ult (rankAtom (directSourceRanks P) 29)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (29 : Fin 78) (4 : Fin 78)
    (53 : Fin 78) (1 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (5 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (25 : Fin 78) (8 : Fin 78) (4 : Fin 78)
    (29 : Fin 78) (1 : Fin 78) (53 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0688` (kalmanson). -/
theorem directSource_h0688 :
    ((!((rankAtom (directSourceRanks P) 4 == rankAtom (directSourceRanks P) 53)) || ((rankAtom (directSourceRanks P) 1).ult (rankAtom (directSourceRanks P) 29)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (29 : Fin 78) (4 : Fin 78)
    (1 : Fin 78) (53 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (5 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (25 : Fin 78) (8 : Fin 78) (4 : Fin 78)
    (29 : Fin 78) (1 : Fin 78) (53 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0689` (kalmanson). -/
theorem directSource_h0689 :
    ((!((rankAtom (directSourceRanks P) 4 == rankAtom (directSourceRanks P) 8)) || ((rankAtom (directSourceRanks P) 25).ult (rankAtom (directSourceRanks P) 29)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (29 : Fin 78) (4 : Fin 78)
    (25 : Fin 78) (8 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (5 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (25 : Fin 78) (8 : Fin 78) (4 : Fin 78)
    (29 : Fin 78) (1 : Fin 78) (53 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0690` (kalmanson). -/
theorem directSource_h0690 :
    ((!((rankAtom (directSourceRanks P) 4 == rankAtom (directSourceRanks P) 1)) || ((rankAtom (directSourceRanks P) 54).ult (rankAtom (directSourceRanks P) 30)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (30 : Fin 78) (4 : Fin 78)
    (54 : Fin 78) (1 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (5 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (25 : Fin 78) (9 : Fin 78) (4 : Fin 78)
    (30 : Fin 78) (1 : Fin 78) (54 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0691` (kalmanson). -/
theorem directSource_h0691 :
    ((!((rankAtom (directSourceRanks P) 4 == rankAtom (directSourceRanks P) 54)) || ((rankAtom (directSourceRanks P) 1).ult (rankAtom (directSourceRanks P) 30)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (30 : Fin 78) (4 : Fin 78)
    (1 : Fin 78) (54 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (5 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (25 : Fin 78) (9 : Fin 78) (4 : Fin 78)
    (30 : Fin 78) (1 : Fin 78) (54 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0692` (kalmanson). -/
theorem directSource_h0692 :
    ((!((rankAtom (directSourceRanks P) 4 == rankAtom (directSourceRanks P) 9)) || ((rankAtom (directSourceRanks P) 25).ult (rankAtom (directSourceRanks P) 30)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (30 : Fin 78) (4 : Fin 78)
    (25 : Fin 78) (9 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (5 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (25 : Fin 78) (9 : Fin 78) (4 : Fin 78)
    (30 : Fin 78) (1 : Fin 78) (54 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0693` (kalmanson). -/
theorem directSource_h0693 :
    ((!((rankAtom (directSourceRanks P) 4 == rankAtom (directSourceRanks P) 1)) || ((rankAtom (directSourceRanks P) 55).ult (rankAtom (directSourceRanks P) 31)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (31 : Fin 78) (4 : Fin 78)
    (55 : Fin 78) (1 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (5 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (25 : Fin 78) (10 : Fin 78) (4 : Fin 78)
    (31 : Fin 78) (1 : Fin 78) (55 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0694` (kalmanson). -/
theorem directSource_h0694 :
    ((!((rankAtom (directSourceRanks P) 4 == rankAtom (directSourceRanks P) 55)) || ((rankAtom (directSourceRanks P) 1).ult (rankAtom (directSourceRanks P) 31)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (31 : Fin 78) (4 : Fin 78)
    (1 : Fin 78) (55 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (5 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (25 : Fin 78) (10 : Fin 78) (4 : Fin 78)
    (31 : Fin 78) (1 : Fin 78) (55 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0695` (kalmanson). -/
theorem directSource_h0695 :
    ((!((rankAtom (directSourceRanks P) 4 == rankAtom (directSourceRanks P) 10)) || ((rankAtom (directSourceRanks P) 25).ult (rankAtom (directSourceRanks P) 31)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (31 : Fin 78) (4 : Fin 78)
    (25 : Fin 78) (10 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (5 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (25 : Fin 78) (10 : Fin 78) (4 : Fin 78)
    (31 : Fin 78) (1 : Fin 78) (55 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0696` (kalmanson). -/
theorem directSource_h0696 :
    ((!((rankAtom (directSourceRanks P) 4 == rankAtom (directSourceRanks P) 1)) || ((rankAtom (directSourceRanks P) 56).ult (rankAtom (directSourceRanks P) 32)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (32 : Fin 78) (4 : Fin 78)
    (56 : Fin 78) (1 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (5 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (25 : Fin 78) (11 : Fin 78) (4 : Fin 78)
    (32 : Fin 78) (1 : Fin 78) (56 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0697` (kalmanson). -/
theorem directSource_h0697 :
    ((!((rankAtom (directSourceRanks P) 4 == rankAtom (directSourceRanks P) 56)) || ((rankAtom (directSourceRanks P) 1).ult (rankAtom (directSourceRanks P) 32)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (32 : Fin 78) (4 : Fin 78)
    (1 : Fin 78) (56 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (5 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (25 : Fin 78) (11 : Fin 78) (4 : Fin 78)
    (32 : Fin 78) (1 : Fin 78) (56 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0698` (kalmanson). -/
theorem directSource_h0698 :
    ((!((rankAtom (directSourceRanks P) 4 == rankAtom (directSourceRanks P) 11)) || ((rankAtom (directSourceRanks P) 25).ult (rankAtom (directSourceRanks P) 32)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (32 : Fin 78) (4 : Fin 78)
    (25 : Fin 78) (11 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (5 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (25 : Fin 78) (11 : Fin 78) (4 : Fin 78)
    (32 : Fin 78) (1 : Fin 78) (56 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0699` (kalmanson). -/
theorem directSource_h0699 :
    ((!((rankAtom (directSourceRanks P) 5 == rankAtom (directSourceRanks P) 57)) || ((rankAtom (directSourceRanks P) 1).ult (rankAtom (directSourceRanks P) 27)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (27 : Fin 78) (5 : Fin 78)
    (1 : Fin 78) (57 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (6 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (26 : Fin 78) (6 : Fin 78) (5 : Fin 78)
    (27 : Fin 78) (1 : Fin 78) (57 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0700` (kalmanson). -/
theorem directSource_h0700 :
    ((!((rankAtom (directSourceRanks P) 5 == rankAtom (directSourceRanks P) 6)) || ((rankAtom (directSourceRanks P) 26).ult (rankAtom (directSourceRanks P) 27)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (27 : Fin 78) (5 : Fin 78)
    (26 : Fin 78) (6 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (6 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (26 : Fin 78) (6 : Fin 78) (5 : Fin 78)
    (27 : Fin 78) (1 : Fin 78) (57 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0701` (kalmanson). -/
theorem directSource_h0701 :
    ((!((rankAtom (directSourceRanks P) 27 == rankAtom (directSourceRanks P) 26)) || ((rankAtom (directSourceRanks P) 6).ult (rankAtom (directSourceRanks P) 5)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (5 : Fin 78) (27 : Fin 78)
    (6 : Fin 78) (26 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (6 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (26 : Fin 78) (6 : Fin 78) (5 : Fin 78)
    (27 : Fin 78) (1 : Fin 78) (57 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0702` (kalmanson). -/
theorem directSource_h0702 :
    ((!((rankAtom (directSourceRanks P) 5 == rankAtom (directSourceRanks P) 1)) || ((rankAtom (directSourceRanks P) 58).ult (rankAtom (directSourceRanks P) 28)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (28 : Fin 78) (5 : Fin 78)
    (58 : Fin 78) (1 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (6 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (26 : Fin 78) (7 : Fin 78) (5 : Fin 78)
    (28 : Fin 78) (1 : Fin 78) (58 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0703` (kalmanson). -/
theorem directSource_h0703 :
    ((!((rankAtom (directSourceRanks P) 5 == rankAtom (directSourceRanks P) 58)) || ((rankAtom (directSourceRanks P) 1).ult (rankAtom (directSourceRanks P) 28)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (28 : Fin 78) (5 : Fin 78)
    (1 : Fin 78) (58 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (6 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (26 : Fin 78) (7 : Fin 78) (5 : Fin 78)
    (28 : Fin 78) (1 : Fin 78) (58 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

end

end ATailExactFiveCard13CnfIngressScratch
end Problem97
