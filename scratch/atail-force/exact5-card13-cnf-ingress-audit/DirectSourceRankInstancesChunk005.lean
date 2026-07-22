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

/-- Exact pass-5 source assertion `h0320` (row). -/
theorem directSource_h0320 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 0 4 0 && rowBit (directSourceRows C) 0 4 9)) || ((rankAtom (directSourceRanks P) 3 == rankAtom (directSourceRanks P) 46)))) = true := by
  exact directSource_row_rank_guard C
    (0 : Fin 3) (4 : Fin 13)
    (0 : Fin 13) (9 : Fin 13)
    (3 : Fin 78) (46 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (3 : Fin 78) (4 : Fin 13) (0 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (46 : Fin 78) (4 : Fin 13) (9 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0321` (row). -/
theorem directSource_h0321 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 0 4 0 && rowBit (directSourceRows C) 0 4 10)) || ((rankAtom (directSourceRanks P) 3 == rankAtom (directSourceRanks P) 47)))) = true := by
  exact directSource_row_rank_guard C
    (0 : Fin 3) (4 : Fin 13)
    (0 : Fin 13) (10 : Fin 13)
    (3 : Fin 78) (47 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (3 : Fin 78) (4 : Fin 13) (0 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (47 : Fin 78) (4 : Fin 13) (10 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0322` (row). -/
theorem directSource_h0322 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 0 4 0 && rowBit (directSourceRows C) 0 4 11)) || ((rankAtom (directSourceRanks P) 3 == rankAtom (directSourceRanks P) 48)))) = true := by
  exact directSource_row_rank_guard C
    (0 : Fin 3) (4 : Fin 13)
    (0 : Fin 13) (11 : Fin 13)
    (3 : Fin 78) (48 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (3 : Fin 78) (4 : Fin 13) (0 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (48 : Fin 78) (4 : Fin 13) (11 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0323` (row). -/
theorem directSource_h0323 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 0 4 0 && rowBit (directSourceRows C) 0 4 12)) || ((rankAtom (directSourceRanks P) 3 == rankAtom (directSourceRanks P) 49)))) = true := by
  exact directSource_row_rank_guard C
    (0 : Fin 3) (4 : Fin 13)
    (0 : Fin 13) (12 : Fin 13)
    (3 : Fin 78) (49 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (3 : Fin 78) (4 : Fin 13) (0 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (49 : Fin 78) (4 : Fin 13) (12 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0324` (row). -/
theorem directSource_h0324 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 0 4 1 && rowBit (directSourceRows C) 0 4 9)) || ((rankAtom (directSourceRanks P) 14 == rankAtom (directSourceRanks P) 46)))) = true := by
  exact directSource_row_rank_guard C
    (0 : Fin 3) (4 : Fin 13)
    (1 : Fin 13) (9 : Fin 13)
    (14 : Fin 78) (46 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (14 : Fin 78) (4 : Fin 13) (1 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (46 : Fin 78) (4 : Fin 13) (9 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0325` (row). -/
theorem directSource_h0325 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 0 4 1 && rowBit (directSourceRows C) 0 4 10)) || ((rankAtom (directSourceRanks P) 14 == rankAtom (directSourceRanks P) 47)))) = true := by
  exact directSource_row_rank_guard C
    (0 : Fin 3) (4 : Fin 13)
    (1 : Fin 13) (10 : Fin 13)
    (14 : Fin 78) (47 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (14 : Fin 78) (4 : Fin 13) (1 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (47 : Fin 78) (4 : Fin 13) (10 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0326` (row). -/
theorem directSource_h0326 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 0 4 1 && rowBit (directSourceRows C) 0 4 11)) || ((rankAtom (directSourceRanks P) 14 == rankAtom (directSourceRanks P) 48)))) = true := by
  exact directSource_row_rank_guard C
    (0 : Fin 3) (4 : Fin 13)
    (1 : Fin 13) (11 : Fin 13)
    (14 : Fin 78) (48 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (14 : Fin 78) (4 : Fin 13) (1 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (48 : Fin 78) (4 : Fin 13) (11 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0327` (row). -/
theorem directSource_h0327 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 0 4 1 && rowBit (directSourceRows C) 0 4 12)) || ((rankAtom (directSourceRanks P) 14 == rankAtom (directSourceRanks P) 49)))) = true := by
  exact directSource_row_rank_guard C
    (0 : Fin 3) (4 : Fin 13)
    (1 : Fin 13) (12 : Fin 13)
    (14 : Fin 78) (49 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (14 : Fin 78) (4 : Fin 13) (1 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (49 : Fin 78) (4 : Fin 13) (12 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0328` (row). -/
theorem directSource_h0328 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 0 4 2 && rowBit (directSourceRows C) 0 4 9)) || ((rankAtom (directSourceRanks P) 24 == rankAtom (directSourceRanks P) 46)))) = true := by
  exact directSource_row_rank_guard C
    (0 : Fin 3) (4 : Fin 13)
    (2 : Fin 13) (9 : Fin 13)
    (24 : Fin 78) (46 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (24 : Fin 78) (4 : Fin 13) (2 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (46 : Fin 78) (4 : Fin 13) (9 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0329` (row). -/
theorem directSource_h0329 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 0 4 2 && rowBit (directSourceRows C) 0 4 10)) || ((rankAtom (directSourceRanks P) 24 == rankAtom (directSourceRanks P) 47)))) = true := by
  exact directSource_row_rank_guard C
    (0 : Fin 3) (4 : Fin 13)
    (2 : Fin 13) (10 : Fin 13)
    (24 : Fin 78) (47 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (24 : Fin 78) (4 : Fin 13) (2 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (47 : Fin 78) (4 : Fin 13) (10 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0330` (row). -/
theorem directSource_h0330 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 0 4 2 && rowBit (directSourceRows C) 0 4 11)) || ((rankAtom (directSourceRanks P) 24 == rankAtom (directSourceRanks P) 48)))) = true := by
  exact directSource_row_rank_guard C
    (0 : Fin 3) (4 : Fin 13)
    (2 : Fin 13) (11 : Fin 13)
    (24 : Fin 78) (48 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (24 : Fin 78) (4 : Fin 13) (2 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (48 : Fin 78) (4 : Fin 13) (11 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0331` (row). -/
theorem directSource_h0331 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 0 4 2 && rowBit (directSourceRows C) 0 4 12)) || ((rankAtom (directSourceRanks P) 24 == rankAtom (directSourceRanks P) 49)))) = true := by
  exact directSource_row_rank_guard C
    (0 : Fin 3) (4 : Fin 13)
    (2 : Fin 13) (12 : Fin 13)
    (24 : Fin 78) (49 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (24 : Fin 78) (4 : Fin 13) (2 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (49 : Fin 78) (4 : Fin 13) (12 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0332` (row). -/
theorem directSource_h0332 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 0 4 3 && rowBit (directSourceRows C) 0 4 10)) || ((rankAtom (directSourceRanks P) 33 == rankAtom (directSourceRanks P) 47)))) = true := by
  exact directSource_row_rank_guard C
    (0 : Fin 3) (4 : Fin 13)
    (3 : Fin 13) (10 : Fin 13)
    (33 : Fin 78) (47 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (33 : Fin 78) (4 : Fin 13) (3 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (47 : Fin 78) (4 : Fin 13) (10 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0333` (row). -/
theorem directSource_h0333 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 0 4 3 && rowBit (directSourceRows C) 0 4 11)) || ((rankAtom (directSourceRanks P) 33 == rankAtom (directSourceRanks P) 48)))) = true := by
  exact directSource_row_rank_guard C
    (0 : Fin 3) (4 : Fin 13)
    (3 : Fin 13) (11 : Fin 13)
    (33 : Fin 78) (48 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (33 : Fin 78) (4 : Fin 13) (3 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (48 : Fin 78) (4 : Fin 13) (11 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0334` (row). -/
theorem directSource_h0334 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 0 4 3 && rowBit (directSourceRows C) 0 4 12)) || ((rankAtom (directSourceRanks P) 33 == rankAtom (directSourceRanks P) 49)))) = true := by
  exact directSource_row_rank_guard C
    (0 : Fin 3) (4 : Fin 13)
    (3 : Fin 13) (12 : Fin 13)
    (33 : Fin 78) (49 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (33 : Fin 78) (4 : Fin 13) (3 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (49 : Fin 78) (4 : Fin 13) (12 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0335` (row). -/
theorem directSource_h0335 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 0 4 5 && rowBit (directSourceRows C) 0 4 9)) || ((rankAtom (directSourceRanks P) 42 == rankAtom (directSourceRanks P) 46)))) = true := by
  exact directSource_row_rank_guard C
    (0 : Fin 3) (4 : Fin 13)
    (5 : Fin 13) (9 : Fin 13)
    (42 : Fin 78) (46 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (42 : Fin 78) (4 : Fin 13) (5 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (46 : Fin 78) (4 : Fin 13) (9 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0336` (row). -/
theorem directSource_h0336 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 0 4 5 && rowBit (directSourceRows C) 0 4 10)) || ((rankAtom (directSourceRanks P) 42 == rankAtom (directSourceRanks P) 47)))) = true := by
  exact directSource_row_rank_guard C
    (0 : Fin 3) (4 : Fin 13)
    (5 : Fin 13) (10 : Fin 13)
    (42 : Fin 78) (47 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (42 : Fin 78) (4 : Fin 13) (5 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (47 : Fin 78) (4 : Fin 13) (10 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0337` (row). -/
theorem directSource_h0337 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 0 4 5 && rowBit (directSourceRows C) 0 4 11)) || ((rankAtom (directSourceRanks P) 42 == rankAtom (directSourceRanks P) 48)))) = true := by
  exact directSource_row_rank_guard C
    (0 : Fin 3) (4 : Fin 13)
    (5 : Fin 13) (11 : Fin 13)
    (42 : Fin 78) (48 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (42 : Fin 78) (4 : Fin 13) (5 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (48 : Fin 78) (4 : Fin 13) (11 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0338` (row). -/
theorem directSource_h0338 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 0 4 5 && rowBit (directSourceRows C) 0 4 12)) || ((rankAtom (directSourceRanks P) 42 == rankAtom (directSourceRanks P) 49)))) = true := by
  exact directSource_row_rank_guard C
    (0 : Fin 3) (4 : Fin 13)
    (5 : Fin 13) (12 : Fin 13)
    (42 : Fin 78) (49 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (42 : Fin 78) (4 : Fin 13) (5 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (49 : Fin 78) (4 : Fin 13) (12 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0339` (row). -/
theorem directSource_h0339 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 0 4 6 && rowBit (directSourceRows C) 0 4 9)) || ((rankAtom (directSourceRanks P) 43 == rankAtom (directSourceRanks P) 46)))) = true := by
  exact directSource_row_rank_guard C
    (0 : Fin 3) (4 : Fin 13)
    (6 : Fin 13) (9 : Fin 13)
    (43 : Fin 78) (46 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (43 : Fin 78) (4 : Fin 13) (6 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (46 : Fin 78) (4 : Fin 13) (9 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0340` (row). -/
theorem directSource_h0340 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 0 4 6 && rowBit (directSourceRows C) 0 4 10)) || ((rankAtom (directSourceRanks P) 43 == rankAtom (directSourceRanks P) 47)))) = true := by
  exact directSource_row_rank_guard C
    (0 : Fin 3) (4 : Fin 13)
    (6 : Fin 13) (10 : Fin 13)
    (43 : Fin 78) (47 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (43 : Fin 78) (4 : Fin 13) (6 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (47 : Fin 78) (4 : Fin 13) (10 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0341` (row). -/
theorem directSource_h0341 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 0 4 6 && rowBit (directSourceRows C) 0 4 11)) || ((rankAtom (directSourceRanks P) 43 == rankAtom (directSourceRanks P) 48)))) = true := by
  exact directSource_row_rank_guard C
    (0 : Fin 3) (4 : Fin 13)
    (6 : Fin 13) (11 : Fin 13)
    (43 : Fin 78) (48 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (43 : Fin 78) (4 : Fin 13) (6 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (48 : Fin 78) (4 : Fin 13) (11 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0342` (row). -/
theorem directSource_h0342 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 0 4 6 && rowBit (directSourceRows C) 0 4 12)) || ((rankAtom (directSourceRanks P) 43 == rankAtom (directSourceRanks P) 49)))) = true := by
  exact directSource_row_rank_guard C
    (0 : Fin 3) (4 : Fin 13)
    (6 : Fin 13) (12 : Fin 13)
    (43 : Fin 78) (49 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (43 : Fin 78) (4 : Fin 13) (6 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (49 : Fin 78) (4 : Fin 13) (12 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0343` (row). -/
theorem directSource_h0343 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 0 4 7 && rowBit (directSourceRows C) 0 4 9)) || ((rankAtom (directSourceRanks P) 44 == rankAtom (directSourceRanks P) 46)))) = true := by
  exact directSource_row_rank_guard C
    (0 : Fin 3) (4 : Fin 13)
    (7 : Fin 13) (9 : Fin 13)
    (44 : Fin 78) (46 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (44 : Fin 78) (4 : Fin 13) (7 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (46 : Fin 78) (4 : Fin 13) (9 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0344` (row). -/
theorem directSource_h0344 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 0 4 7 && rowBit (directSourceRows C) 0 4 10)) || ((rankAtom (directSourceRanks P) 44 == rankAtom (directSourceRanks P) 47)))) = true := by
  exact directSource_row_rank_guard C
    (0 : Fin 3) (4 : Fin 13)
    (7 : Fin 13) (10 : Fin 13)
    (44 : Fin 78) (47 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (44 : Fin 78) (4 : Fin 13) (7 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (47 : Fin 78) (4 : Fin 13) (10 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0345` (row). -/
theorem directSource_h0345 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 0 4 7 && rowBit (directSourceRows C) 0 4 11)) || ((rankAtom (directSourceRanks P) 44 == rankAtom (directSourceRanks P) 48)))) = true := by
  exact directSource_row_rank_guard C
    (0 : Fin 3) (4 : Fin 13)
    (7 : Fin 13) (11 : Fin 13)
    (44 : Fin 78) (48 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (44 : Fin 78) (4 : Fin 13) (7 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (48 : Fin 78) (4 : Fin 13) (11 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0346` (row). -/
theorem directSource_h0346 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 0 4 7 && rowBit (directSourceRows C) 0 4 12)) || ((rankAtom (directSourceRanks P) 44 == rankAtom (directSourceRanks P) 49)))) = true := by
  exact directSource_row_rank_guard C
    (0 : Fin 3) (4 : Fin 13)
    (7 : Fin 13) (12 : Fin 13)
    (44 : Fin 78) (49 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (44 : Fin 78) (4 : Fin 13) (7 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (49 : Fin 78) (4 : Fin 13) (12 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0347` (row). -/
theorem directSource_h0347 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 0 4 8 && rowBit (directSourceRows C) 0 4 9)) || ((rankAtom (directSourceRanks P) 45 == rankAtom (directSourceRanks P) 46)))) = true := by
  exact directSource_row_rank_guard C
    (0 : Fin 3) (4 : Fin 13)
    (8 : Fin 13) (9 : Fin 13)
    (45 : Fin 78) (46 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (45 : Fin 78) (4 : Fin 13) (8 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (46 : Fin 78) (4 : Fin 13) (9 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0348` (row). -/
theorem directSource_h0348 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 0 4 8 && rowBit (directSourceRows C) 0 4 10)) || ((rankAtom (directSourceRanks P) 45 == rankAtom (directSourceRanks P) 47)))) = true := by
  exact directSource_row_rank_guard C
    (0 : Fin 3) (4 : Fin 13)
    (8 : Fin 13) (10 : Fin 13)
    (45 : Fin 78) (47 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (45 : Fin 78) (4 : Fin 13) (8 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (47 : Fin 78) (4 : Fin 13) (10 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0349` (row). -/
theorem directSource_h0349 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 0 4 8 && rowBit (directSourceRows C) 0 4 11)) || ((rankAtom (directSourceRanks P) 45 == rankAtom (directSourceRanks P) 48)))) = true := by
  exact directSource_row_rank_guard C
    (0 : Fin 3) (4 : Fin 13)
    (8 : Fin 13) (11 : Fin 13)
    (45 : Fin 78) (48 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (45 : Fin 78) (4 : Fin 13) (8 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (48 : Fin 78) (4 : Fin 13) (11 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0350` (row). -/
theorem directSource_h0350 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 0 4 8 && rowBit (directSourceRows C) 0 4 12)) || ((rankAtom (directSourceRanks P) 45 == rankAtom (directSourceRanks P) 49)))) = true := by
  exact directSource_row_rank_guard C
    (0 : Fin 3) (4 : Fin 13)
    (8 : Fin 13) (12 : Fin 13)
    (45 : Fin 78) (49 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (45 : Fin 78) (4 : Fin 13) (8 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (49 : Fin 78) (4 : Fin 13) (12 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0351` (row). -/
theorem directSource_h0351 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 0 4 9 && rowBit (directSourceRows C) 0 4 10)) || ((rankAtom (directSourceRanks P) 46 == rankAtom (directSourceRanks P) 47)))) = true := by
  exact directSource_row_rank_guard C
    (0 : Fin 3) (4 : Fin 13)
    (9 : Fin 13) (10 : Fin 13)
    (46 : Fin 78) (47 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (46 : Fin 78) (4 : Fin 13) (9 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (47 : Fin 78) (4 : Fin 13) (10 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0352` (row). -/
theorem directSource_h0352 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 0 4 9 && rowBit (directSourceRows C) 0 4 11)) || ((rankAtom (directSourceRanks P) 46 == rankAtom (directSourceRanks P) 48)))) = true := by
  exact directSource_row_rank_guard C
    (0 : Fin 3) (4 : Fin 13)
    (9 : Fin 13) (11 : Fin 13)
    (46 : Fin 78) (48 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (46 : Fin 78) (4 : Fin 13) (9 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (48 : Fin 78) (4 : Fin 13) (11 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0353` (row). -/
theorem directSource_h0353 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 0 4 9 && rowBit (directSourceRows C) 0 4 12)) || ((rankAtom (directSourceRanks P) 46 == rankAtom (directSourceRanks P) 49)))) = true := by
  exact directSource_row_rank_guard C
    (0 : Fin 3) (4 : Fin 13)
    (9 : Fin 13) (12 : Fin 13)
    (46 : Fin 78) (49 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (46 : Fin 78) (4 : Fin 13) (9 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (49 : Fin 78) (4 : Fin 13) (12 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0354` (row). -/
theorem directSource_h0354 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 0 4 10 && rowBit (directSourceRows C) 0 4 11)) || ((rankAtom (directSourceRanks P) 47 == rankAtom (directSourceRanks P) 48)))) = true := by
  exact directSource_row_rank_guard C
    (0 : Fin 3) (4 : Fin 13)
    (10 : Fin 13) (11 : Fin 13)
    (47 : Fin 78) (48 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (47 : Fin 78) (4 : Fin 13) (10 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (48 : Fin 78) (4 : Fin 13) (11 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0355` (row). -/
theorem directSource_h0355 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 0 4 10 && rowBit (directSourceRows C) 0 4 12)) || ((rankAtom (directSourceRanks P) 47 == rankAtom (directSourceRanks P) 49)))) = true := by
  exact directSource_row_rank_guard C
    (0 : Fin 3) (4 : Fin 13)
    (10 : Fin 13) (12 : Fin 13)
    (47 : Fin 78) (49 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (47 : Fin 78) (4 : Fin 13) (10 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (49 : Fin 78) (4 : Fin 13) (12 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0356` (row). -/
theorem directSource_h0356 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 0 4 11 && rowBit (directSourceRows C) 0 4 12)) || ((rankAtom (directSourceRanks P) 48 == rankAtom (directSourceRanks P) 49)))) = true := by
  exact directSource_row_rank_guard C
    (0 : Fin 3) (4 : Fin 13)
    (11 : Fin 13) (12 : Fin 13)
    (48 : Fin 78) (49 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (48 : Fin 78) (4 : Fin 13) (11 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (49 : Fin 78) (4 : Fin 13) (12 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0357` (row). -/
theorem directSource_h0357 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 1 2 1 && rowBit (directSourceRows C) 1 2 9)) || ((rankAtom (directSourceRanks P) 12 == rankAtom (directSourceRanks P) 29)))) = true := by
  exact directSource_row_rank_guard C
    (1 : Fin 3) (2 : Fin 13)
    (1 : Fin 13) (9 : Fin 13)
    (12 : Fin 78) (29 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (12 : Fin 78) (2 : Fin 13) (1 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (29 : Fin 78) (2 : Fin 13) (9 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0358` (row). -/
theorem directSource_h0358 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 1 2 3 && rowBit (directSourceRows C) 1 2 5)) || ((rankAtom (directSourceRanks P) 23 == rankAtom (directSourceRanks P) 25)))) = true := by
  exact directSource_row_rank_guard C
    (1 : Fin 3) (2 : Fin 13)
    (3 : Fin 13) (5 : Fin 13)
    (23 : Fin 78) (25 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (23 : Fin 78) (2 : Fin 13) (3 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (25 : Fin 78) (2 : Fin 13) (5 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0359` (row). -/
theorem directSource_h0359 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 1 6 0 && rowBit (directSourceRows C) 1 6 1)) || ((rankAtom (directSourceRanks P) 5 == rankAtom (directSourceRanks P) 16)))) = true := by
  exact directSource_row_rank_guard C
    (1 : Fin 3) (6 : Fin 13)
    (0 : Fin 13) (1 : Fin 13)
    (5 : Fin 78) (16 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (5 : Fin 78) (6 : Fin 13) (0 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (16 : Fin 78) (6 : Fin 13) (1 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0360` (row). -/
theorem directSource_h0360 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 1 6 0 && rowBit (directSourceRows C) 1 6 2)) || ((rankAtom (directSourceRanks P) 5 == rankAtom (directSourceRanks P) 26)))) = true := by
  exact directSource_row_rank_guard C
    (1 : Fin 3) (6 : Fin 13)
    (0 : Fin 13) (2 : Fin 13)
    (5 : Fin 78) (26 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (5 : Fin 78) (6 : Fin 13) (0 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (26 : Fin 78) (6 : Fin 13) (2 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0361` (row). -/
theorem directSource_h0361 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 1 6 0 && rowBit (directSourceRows C) 1 6 3)) || ((rankAtom (directSourceRanks P) 5 == rankAtom (directSourceRanks P) 35)))) = true := by
  exact directSource_row_rank_guard C
    (1 : Fin 3) (6 : Fin 13)
    (0 : Fin 13) (3 : Fin 13)
    (5 : Fin 78) (35 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (5 : Fin 78) (6 : Fin 13) (0 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (35 : Fin 78) (6 : Fin 13) (3 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0362` (row). -/
theorem directSource_h0362 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 1 6 0 && rowBit (directSourceRows C) 1 6 4)) || ((rankAtom (directSourceRanks P) 5 == rankAtom (directSourceRanks P) 43)))) = true := by
  exact directSource_row_rank_guard C
    (1 : Fin 3) (6 : Fin 13)
    (0 : Fin 13) (4 : Fin 13)
    (5 : Fin 78) (43 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (5 : Fin 78) (6 : Fin 13) (0 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (43 : Fin 78) (6 : Fin 13) (4 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0363` (row). -/
theorem directSource_h0363 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 1 6 0 && rowBit (directSourceRows C) 1 6 5)) || ((rankAtom (directSourceRanks P) 5 == rankAtom (directSourceRanks P) 50)))) = true := by
  exact directSource_row_rank_guard C
    (1 : Fin 3) (6 : Fin 13)
    (0 : Fin 13) (5 : Fin 13)
    (5 : Fin 78) (50 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (5 : Fin 78) (6 : Fin 13) (0 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (50 : Fin 78) (6 : Fin 13) (5 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0364` (row). -/
theorem directSource_h0364 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 1 6 0 && rowBit (directSourceRows C) 1 6 7)) || ((rankAtom (directSourceRanks P) 5 == rankAtom (directSourceRanks P) 57)))) = true := by
  exact directSource_row_rank_guard C
    (1 : Fin 3) (6 : Fin 13)
    (0 : Fin 13) (7 : Fin 13)
    (5 : Fin 78) (57 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (5 : Fin 78) (6 : Fin 13) (0 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (57 : Fin 78) (6 : Fin 13) (7 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0365` (row). -/
theorem directSource_h0365 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 1 6 0 && rowBit (directSourceRows C) 1 6 8)) || ((rankAtom (directSourceRanks P) 5 == rankAtom (directSourceRanks P) 58)))) = true := by
  exact directSource_row_rank_guard C
    (1 : Fin 3) (6 : Fin 13)
    (0 : Fin 13) (8 : Fin 13)
    (5 : Fin 78) (58 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (5 : Fin 78) (6 : Fin 13) (0 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (58 : Fin 78) (6 : Fin 13) (8 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0366` (row). -/
theorem directSource_h0366 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 1 6 0 && rowBit (directSourceRows C) 1 6 9)) || ((rankAtom (directSourceRanks P) 5 == rankAtom (directSourceRanks P) 59)))) = true := by
  exact directSource_row_rank_guard C
    (1 : Fin 3) (6 : Fin 13)
    (0 : Fin 13) (9 : Fin 13)
    (5 : Fin 78) (59 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (5 : Fin 78) (6 : Fin 13) (0 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (59 : Fin 78) (6 : Fin 13) (9 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0367` (row). -/
theorem directSource_h0367 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 1 6 0 && rowBit (directSourceRows C) 1 6 10)) || ((rankAtom (directSourceRanks P) 5 == rankAtom (directSourceRanks P) 60)))) = true := by
  exact directSource_row_rank_guard C
    (1 : Fin 3) (6 : Fin 13)
    (0 : Fin 13) (10 : Fin 13)
    (5 : Fin 78) (60 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (5 : Fin 78) (6 : Fin 13) (0 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (60 : Fin 78) (6 : Fin 13) (10 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0368` (row). -/
theorem directSource_h0368 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 1 6 0 && rowBit (directSourceRows C) 1 6 11)) || ((rankAtom (directSourceRanks P) 5 == rankAtom (directSourceRanks P) 61)))) = true := by
  exact directSource_row_rank_guard C
    (1 : Fin 3) (6 : Fin 13)
    (0 : Fin 13) (11 : Fin 13)
    (5 : Fin 78) (61 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (5 : Fin 78) (6 : Fin 13) (0 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (61 : Fin 78) (6 : Fin 13) (11 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0369` (row). -/
theorem directSource_h0369 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 1 6 0 && rowBit (directSourceRows C) 1 6 12)) || ((rankAtom (directSourceRanks P) 5 == rankAtom (directSourceRanks P) 62)))) = true := by
  exact directSource_row_rank_guard C
    (1 : Fin 3) (6 : Fin 13)
    (0 : Fin 13) (12 : Fin 13)
    (5 : Fin 78) (62 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (5 : Fin 78) (6 : Fin 13) (0 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (62 : Fin 78) (6 : Fin 13) (12 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0370` (row). -/
theorem directSource_h0370 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 1 6 1 && rowBit (directSourceRows C) 1 6 3)) || ((rankAtom (directSourceRanks P) 16 == rankAtom (directSourceRanks P) 35)))) = true := by
  exact directSource_row_rank_guard C
    (1 : Fin 3) (6 : Fin 13)
    (1 : Fin 13) (3 : Fin 13)
    (16 : Fin 78) (35 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (16 : Fin 78) (6 : Fin 13) (1 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (35 : Fin 78) (6 : Fin 13) (3 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0371` (row). -/
theorem directSource_h0371 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 1 6 1 && rowBit (directSourceRows C) 1 6 4)) || ((rankAtom (directSourceRanks P) 16 == rankAtom (directSourceRanks P) 43)))) = true := by
  exact directSource_row_rank_guard C
    (1 : Fin 3) (6 : Fin 13)
    (1 : Fin 13) (4 : Fin 13)
    (16 : Fin 78) (43 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (16 : Fin 78) (6 : Fin 13) (1 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (43 : Fin 78) (6 : Fin 13) (4 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0372` (row). -/
theorem directSource_h0372 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 1 6 1 && rowBit (directSourceRows C) 1 6 5)) || ((rankAtom (directSourceRanks P) 16 == rankAtom (directSourceRanks P) 50)))) = true := by
  exact directSource_row_rank_guard C
    (1 : Fin 3) (6 : Fin 13)
    (1 : Fin 13) (5 : Fin 13)
    (16 : Fin 78) (50 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (16 : Fin 78) (6 : Fin 13) (1 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (50 : Fin 78) (6 : Fin 13) (5 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0373` (row). -/
theorem directSource_h0373 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 1 6 1 && rowBit (directSourceRows C) 1 6 7)) || ((rankAtom (directSourceRanks P) 16 == rankAtom (directSourceRanks P) 57)))) = true := by
  exact directSource_row_rank_guard C
    (1 : Fin 3) (6 : Fin 13)
    (1 : Fin 13) (7 : Fin 13)
    (16 : Fin 78) (57 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (16 : Fin 78) (6 : Fin 13) (1 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (57 : Fin 78) (6 : Fin 13) (7 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0374` (row). -/
theorem directSource_h0374 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 1 6 1 && rowBit (directSourceRows C) 1 6 8)) || ((rankAtom (directSourceRanks P) 16 == rankAtom (directSourceRanks P) 58)))) = true := by
  exact directSource_row_rank_guard C
    (1 : Fin 3) (6 : Fin 13)
    (1 : Fin 13) (8 : Fin 13)
    (16 : Fin 78) (58 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (16 : Fin 78) (6 : Fin 13) (1 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (58 : Fin 78) (6 : Fin 13) (8 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0375` (row). -/
theorem directSource_h0375 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 1 6 1 && rowBit (directSourceRows C) 1 6 9)) || ((rankAtom (directSourceRanks P) 16 == rankAtom (directSourceRanks P) 59)))) = true := by
  exact directSource_row_rank_guard C
    (1 : Fin 3) (6 : Fin 13)
    (1 : Fin 13) (9 : Fin 13)
    (16 : Fin 78) (59 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (16 : Fin 78) (6 : Fin 13) (1 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (59 : Fin 78) (6 : Fin 13) (9 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0376` (row). -/
theorem directSource_h0376 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 1 6 1 && rowBit (directSourceRows C) 1 6 10)) || ((rankAtom (directSourceRanks P) 16 == rankAtom (directSourceRanks P) 60)))) = true := by
  exact directSource_row_rank_guard C
    (1 : Fin 3) (6 : Fin 13)
    (1 : Fin 13) (10 : Fin 13)
    (16 : Fin 78) (60 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (16 : Fin 78) (6 : Fin 13) (1 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (60 : Fin 78) (6 : Fin 13) (10 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0377` (row). -/
theorem directSource_h0377 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 1 6 1 && rowBit (directSourceRows C) 1 6 11)) || ((rankAtom (directSourceRanks P) 16 == rankAtom (directSourceRanks P) 61)))) = true := by
  exact directSource_row_rank_guard C
    (1 : Fin 3) (6 : Fin 13)
    (1 : Fin 13) (11 : Fin 13)
    (16 : Fin 78) (61 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (16 : Fin 78) (6 : Fin 13) (1 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (61 : Fin 78) (6 : Fin 13) (11 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0378` (row). -/
theorem directSource_h0378 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 1 6 1 && rowBit (directSourceRows C) 1 6 12)) || ((rankAtom (directSourceRanks P) 16 == rankAtom (directSourceRanks P) 62)))) = true := by
  exact directSource_row_rank_guard C
    (1 : Fin 3) (6 : Fin 13)
    (1 : Fin 13) (12 : Fin 13)
    (16 : Fin 78) (62 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (16 : Fin 78) (6 : Fin 13) (1 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (62 : Fin 78) (6 : Fin 13) (12 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0379` (row). -/
theorem directSource_h0379 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 1 6 2 && rowBit (directSourceRows C) 1 6 3)) || ((rankAtom (directSourceRanks P) 26 == rankAtom (directSourceRanks P) 35)))) = true := by
  exact directSource_row_rank_guard C
    (1 : Fin 3) (6 : Fin 13)
    (2 : Fin 13) (3 : Fin 13)
    (26 : Fin 78) (35 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (26 : Fin 78) (6 : Fin 13) (2 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (35 : Fin 78) (6 : Fin 13) (3 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0380` (row). -/
theorem directSource_h0380 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 1 6 2 && rowBit (directSourceRows C) 1 6 4)) || ((rankAtom (directSourceRanks P) 26 == rankAtom (directSourceRanks P) 43)))) = true := by
  exact directSource_row_rank_guard C
    (1 : Fin 3) (6 : Fin 13)
    (2 : Fin 13) (4 : Fin 13)
    (26 : Fin 78) (43 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (26 : Fin 78) (6 : Fin 13) (2 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (43 : Fin 78) (6 : Fin 13) (4 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0381` (row). -/
theorem directSource_h0381 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 1 6 2 && rowBit (directSourceRows C) 1 6 5)) || ((rankAtom (directSourceRanks P) 26 == rankAtom (directSourceRanks P) 50)))) = true := by
  exact directSource_row_rank_guard C
    (1 : Fin 3) (6 : Fin 13)
    (2 : Fin 13) (5 : Fin 13)
    (26 : Fin 78) (50 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (26 : Fin 78) (6 : Fin 13) (2 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (50 : Fin 78) (6 : Fin 13) (5 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0382` (row). -/
theorem directSource_h0382 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 1 6 2 && rowBit (directSourceRows C) 1 6 7)) || ((rankAtom (directSourceRanks P) 26 == rankAtom (directSourceRanks P) 57)))) = true := by
  exact directSource_row_rank_guard C
    (1 : Fin 3) (6 : Fin 13)
    (2 : Fin 13) (7 : Fin 13)
    (26 : Fin 78) (57 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (26 : Fin 78) (6 : Fin 13) (2 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (57 : Fin 78) (6 : Fin 13) (7 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0383` (row). -/
theorem directSource_h0383 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 1 6 2 && rowBit (directSourceRows C) 1 6 8)) || ((rankAtom (directSourceRanks P) 26 == rankAtom (directSourceRanks P) 58)))) = true := by
  exact directSource_row_rank_guard C
    (1 : Fin 3) (6 : Fin 13)
    (2 : Fin 13) (8 : Fin 13)
    (26 : Fin 78) (58 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (26 : Fin 78) (6 : Fin 13) (2 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (58 : Fin 78) (6 : Fin 13) (8 : Fin 13) (by decide))

end

end ATailExactFiveCard13CnfIngressScratch
end Problem97
