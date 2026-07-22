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

/-- Exact pass-5 source assertion `h0448` (row). -/
theorem directSource_h0448 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 2 5 2 && rowBit (directSourceRows C) 2 5 8)) || ((rankAtom (directSourceRanks P) 25 == rankAtom (directSourceRanks P) 52)))) = true := by
  exact directSource_row_rank_guard C
    (2 : Fin 3) (5 : Fin 13)
    (2 : Fin 13) (8 : Fin 13)
    (25 : Fin 78) (52 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (25 : Fin 78) (5 : Fin 13) (2 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (52 : Fin 78) (5 : Fin 13) (8 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0449` (row). -/
theorem directSource_h0449 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 2 5 2 && rowBit (directSourceRows C) 2 5 9)) || ((rankAtom (directSourceRanks P) 25 == rankAtom (directSourceRanks P) 53)))) = true := by
  exact directSource_row_rank_guard C
    (2 : Fin 3) (5 : Fin 13)
    (2 : Fin 13) (9 : Fin 13)
    (25 : Fin 78) (53 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (25 : Fin 78) (5 : Fin 13) (2 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (53 : Fin 78) (5 : Fin 13) (9 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0450` (row). -/
theorem directSource_h0450 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 2 5 2 && rowBit (directSourceRows C) 2 5 10)) || ((rankAtom (directSourceRanks P) 25 == rankAtom (directSourceRanks P) 54)))) = true := by
  exact directSource_row_rank_guard C
    (2 : Fin 3) (5 : Fin 13)
    (2 : Fin 13) (10 : Fin 13)
    (25 : Fin 78) (54 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (25 : Fin 78) (5 : Fin 13) (2 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (54 : Fin 78) (5 : Fin 13) (10 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0451` (row). -/
theorem directSource_h0451 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 2 5 2 && rowBit (directSourceRows C) 2 5 11)) || ((rankAtom (directSourceRanks P) 25 == rankAtom (directSourceRanks P) 55)))) = true := by
  exact directSource_row_rank_guard C
    (2 : Fin 3) (5 : Fin 13)
    (2 : Fin 13) (11 : Fin 13)
    (25 : Fin 78) (55 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (25 : Fin 78) (5 : Fin 13) (2 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (55 : Fin 78) (5 : Fin 13) (11 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0452` (row). -/
theorem directSource_h0452 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 2 5 2 && rowBit (directSourceRows C) 2 5 12)) || ((rankAtom (directSourceRanks P) 25 == rankAtom (directSourceRanks P) 56)))) = true := by
  exact directSource_row_rank_guard C
    (2 : Fin 3) (5 : Fin 13)
    (2 : Fin 13) (12 : Fin 13)
    (25 : Fin 78) (56 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (25 : Fin 78) (5 : Fin 13) (2 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (56 : Fin 78) (5 : Fin 13) (12 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0453` (row). -/
theorem directSource_h0453 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 2 5 3 && rowBit (directSourceRows C) 2 5 4)) || ((rankAtom (directSourceRanks P) 34 == rankAtom (directSourceRanks P) 42)))) = true := by
  exact directSource_row_rank_guard C
    (2 : Fin 3) (5 : Fin 13)
    (3 : Fin 13) (4 : Fin 13)
    (34 : Fin 78) (42 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (34 : Fin 78) (5 : Fin 13) (3 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (42 : Fin 78) (5 : Fin 13) (4 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0454` (row). -/
theorem directSource_h0454 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 2 5 3 && rowBit (directSourceRows C) 2 5 6)) || ((rankAtom (directSourceRanks P) 34 == rankAtom (directSourceRanks P) 50)))) = true := by
  exact directSource_row_rank_guard C
    (2 : Fin 3) (5 : Fin 13)
    (3 : Fin 13) (6 : Fin 13)
    (34 : Fin 78) (50 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (34 : Fin 78) (5 : Fin 13) (3 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (50 : Fin 78) (5 : Fin 13) (6 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0455` (row). -/
theorem directSource_h0455 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 2 5 3 && rowBit (directSourceRows C) 2 5 7)) || ((rankAtom (directSourceRanks P) 34 == rankAtom (directSourceRanks P) 51)))) = true := by
  exact directSource_row_rank_guard C
    (2 : Fin 3) (5 : Fin 13)
    (3 : Fin 13) (7 : Fin 13)
    (34 : Fin 78) (51 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (34 : Fin 78) (5 : Fin 13) (3 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (51 : Fin 78) (5 : Fin 13) (7 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0456` (row). -/
theorem directSource_h0456 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 2 5 3 && rowBit (directSourceRows C) 2 5 8)) || ((rankAtom (directSourceRanks P) 34 == rankAtom (directSourceRanks P) 52)))) = true := by
  exact directSource_row_rank_guard C
    (2 : Fin 3) (5 : Fin 13)
    (3 : Fin 13) (8 : Fin 13)
    (34 : Fin 78) (52 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (34 : Fin 78) (5 : Fin 13) (3 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (52 : Fin 78) (5 : Fin 13) (8 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0457` (row). -/
theorem directSource_h0457 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 2 5 3 && rowBit (directSourceRows C) 2 5 9)) || ((rankAtom (directSourceRanks P) 34 == rankAtom (directSourceRanks P) 53)))) = true := by
  exact directSource_row_rank_guard C
    (2 : Fin 3) (5 : Fin 13)
    (3 : Fin 13) (9 : Fin 13)
    (34 : Fin 78) (53 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (34 : Fin 78) (5 : Fin 13) (3 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (53 : Fin 78) (5 : Fin 13) (9 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0458` (row). -/
theorem directSource_h0458 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 2 5 3 && rowBit (directSourceRows C) 2 5 10)) || ((rankAtom (directSourceRanks P) 34 == rankAtom (directSourceRanks P) 54)))) = true := by
  exact directSource_row_rank_guard C
    (2 : Fin 3) (5 : Fin 13)
    (3 : Fin 13) (10 : Fin 13)
    (34 : Fin 78) (54 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (34 : Fin 78) (5 : Fin 13) (3 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (54 : Fin 78) (5 : Fin 13) (10 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0459` (row). -/
theorem directSource_h0459 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 2 5 3 && rowBit (directSourceRows C) 2 5 11)) || ((rankAtom (directSourceRanks P) 34 == rankAtom (directSourceRanks P) 55)))) = true := by
  exact directSource_row_rank_guard C
    (2 : Fin 3) (5 : Fin 13)
    (3 : Fin 13) (11 : Fin 13)
    (34 : Fin 78) (55 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (34 : Fin 78) (5 : Fin 13) (3 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (55 : Fin 78) (5 : Fin 13) (11 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0460` (row). -/
theorem directSource_h0460 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 2 5 3 && rowBit (directSourceRows C) 2 5 12)) || ((rankAtom (directSourceRanks P) 34 == rankAtom (directSourceRanks P) 56)))) = true := by
  exact directSource_row_rank_guard C
    (2 : Fin 3) (5 : Fin 13)
    (3 : Fin 13) (12 : Fin 13)
    (34 : Fin 78) (56 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (34 : Fin 78) (5 : Fin 13) (3 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (56 : Fin 78) (5 : Fin 13) (12 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0461` (row). -/
theorem directSource_h0461 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 2 5 4 && rowBit (directSourceRows C) 2 5 6)) || ((rankAtom (directSourceRanks P) 42 == rankAtom (directSourceRanks P) 50)))) = true := by
  exact directSource_row_rank_guard C
    (2 : Fin 3) (5 : Fin 13)
    (4 : Fin 13) (6 : Fin 13)
    (42 : Fin 78) (50 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (42 : Fin 78) (5 : Fin 13) (4 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (50 : Fin 78) (5 : Fin 13) (6 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0462` (row). -/
theorem directSource_h0462 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 2 5 4 && rowBit (directSourceRows C) 2 5 7)) || ((rankAtom (directSourceRanks P) 42 == rankAtom (directSourceRanks P) 51)))) = true := by
  exact directSource_row_rank_guard C
    (2 : Fin 3) (5 : Fin 13)
    (4 : Fin 13) (7 : Fin 13)
    (42 : Fin 78) (51 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (42 : Fin 78) (5 : Fin 13) (4 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (51 : Fin 78) (5 : Fin 13) (7 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0463` (row). -/
theorem directSource_h0463 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 2 5 4 && rowBit (directSourceRows C) 2 5 8)) || ((rankAtom (directSourceRanks P) 42 == rankAtom (directSourceRanks P) 52)))) = true := by
  exact directSource_row_rank_guard C
    (2 : Fin 3) (5 : Fin 13)
    (4 : Fin 13) (8 : Fin 13)
    (42 : Fin 78) (52 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (42 : Fin 78) (5 : Fin 13) (4 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (52 : Fin 78) (5 : Fin 13) (8 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0464` (row). -/
theorem directSource_h0464 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 2 5 4 && rowBit (directSourceRows C) 2 5 9)) || ((rankAtom (directSourceRanks P) 42 == rankAtom (directSourceRanks P) 53)))) = true := by
  exact directSource_row_rank_guard C
    (2 : Fin 3) (5 : Fin 13)
    (4 : Fin 13) (9 : Fin 13)
    (42 : Fin 78) (53 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (42 : Fin 78) (5 : Fin 13) (4 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (53 : Fin 78) (5 : Fin 13) (9 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0465` (row). -/
theorem directSource_h0465 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 2 5 4 && rowBit (directSourceRows C) 2 5 10)) || ((rankAtom (directSourceRanks P) 42 == rankAtom (directSourceRanks P) 54)))) = true := by
  exact directSource_row_rank_guard C
    (2 : Fin 3) (5 : Fin 13)
    (4 : Fin 13) (10 : Fin 13)
    (42 : Fin 78) (54 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (42 : Fin 78) (5 : Fin 13) (4 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (54 : Fin 78) (5 : Fin 13) (10 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0466` (row). -/
theorem directSource_h0466 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 2 5 4 && rowBit (directSourceRows C) 2 5 11)) || ((rankAtom (directSourceRanks P) 42 == rankAtom (directSourceRanks P) 55)))) = true := by
  exact directSource_row_rank_guard C
    (2 : Fin 3) (5 : Fin 13)
    (4 : Fin 13) (11 : Fin 13)
    (42 : Fin 78) (55 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (42 : Fin 78) (5 : Fin 13) (4 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (55 : Fin 78) (5 : Fin 13) (11 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0467` (row). -/
theorem directSource_h0467 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 2 5 4 && rowBit (directSourceRows C) 2 5 12)) || ((rankAtom (directSourceRanks P) 42 == rankAtom (directSourceRanks P) 56)))) = true := by
  exact directSource_row_rank_guard C
    (2 : Fin 3) (5 : Fin 13)
    (4 : Fin 13) (12 : Fin 13)
    (42 : Fin 78) (56 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (42 : Fin 78) (5 : Fin 13) (4 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (56 : Fin 78) (5 : Fin 13) (12 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0468` (row). -/
theorem directSource_h0468 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 2 5 6 && rowBit (directSourceRows C) 2 5 7)) || ((rankAtom (directSourceRanks P) 50 == rankAtom (directSourceRanks P) 51)))) = true := by
  exact directSource_row_rank_guard C
    (2 : Fin 3) (5 : Fin 13)
    (6 : Fin 13) (7 : Fin 13)
    (50 : Fin 78) (51 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (50 : Fin 78) (5 : Fin 13) (6 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (51 : Fin 78) (5 : Fin 13) (7 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0469` (row). -/
theorem directSource_h0469 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 2 5 6 && rowBit (directSourceRows C) 2 5 8)) || ((rankAtom (directSourceRanks P) 50 == rankAtom (directSourceRanks P) 52)))) = true := by
  exact directSource_row_rank_guard C
    (2 : Fin 3) (5 : Fin 13)
    (6 : Fin 13) (8 : Fin 13)
    (50 : Fin 78) (52 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (50 : Fin 78) (5 : Fin 13) (6 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (52 : Fin 78) (5 : Fin 13) (8 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0470` (row). -/
theorem directSource_h0470 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 2 5 6 && rowBit (directSourceRows C) 2 5 9)) || ((rankAtom (directSourceRanks P) 50 == rankAtom (directSourceRanks P) 53)))) = true := by
  exact directSource_row_rank_guard C
    (2 : Fin 3) (5 : Fin 13)
    (6 : Fin 13) (9 : Fin 13)
    (50 : Fin 78) (53 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (50 : Fin 78) (5 : Fin 13) (6 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (53 : Fin 78) (5 : Fin 13) (9 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0471` (row). -/
theorem directSource_h0471 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 2 5 6 && rowBit (directSourceRows C) 2 5 10)) || ((rankAtom (directSourceRanks P) 50 == rankAtom (directSourceRanks P) 54)))) = true := by
  exact directSource_row_rank_guard C
    (2 : Fin 3) (5 : Fin 13)
    (6 : Fin 13) (10 : Fin 13)
    (50 : Fin 78) (54 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (50 : Fin 78) (5 : Fin 13) (6 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (54 : Fin 78) (5 : Fin 13) (10 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0472` (row). -/
theorem directSource_h0472 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 2 5 6 && rowBit (directSourceRows C) 2 5 11)) || ((rankAtom (directSourceRanks P) 50 == rankAtom (directSourceRanks P) 55)))) = true := by
  exact directSource_row_rank_guard C
    (2 : Fin 3) (5 : Fin 13)
    (6 : Fin 13) (11 : Fin 13)
    (50 : Fin 78) (55 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (50 : Fin 78) (5 : Fin 13) (6 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (55 : Fin 78) (5 : Fin 13) (11 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0473` (row). -/
theorem directSource_h0473 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 2 5 6 && rowBit (directSourceRows C) 2 5 12)) || ((rankAtom (directSourceRanks P) 50 == rankAtom (directSourceRanks P) 56)))) = true := by
  exact directSource_row_rank_guard C
    (2 : Fin 3) (5 : Fin 13)
    (6 : Fin 13) (12 : Fin 13)
    (50 : Fin 78) (56 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (50 : Fin 78) (5 : Fin 13) (6 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (56 : Fin 78) (5 : Fin 13) (12 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0474` (row). -/
theorem directSource_h0474 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 2 5 7 && rowBit (directSourceRows C) 2 5 8)) || ((rankAtom (directSourceRanks P) 51 == rankAtom (directSourceRanks P) 52)))) = true := by
  exact directSource_row_rank_guard C
    (2 : Fin 3) (5 : Fin 13)
    (7 : Fin 13) (8 : Fin 13)
    (51 : Fin 78) (52 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (51 : Fin 78) (5 : Fin 13) (7 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (52 : Fin 78) (5 : Fin 13) (8 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0475` (row). -/
theorem directSource_h0475 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 2 5 7 && rowBit (directSourceRows C) 2 5 9)) || ((rankAtom (directSourceRanks P) 51 == rankAtom (directSourceRanks P) 53)))) = true := by
  exact directSource_row_rank_guard C
    (2 : Fin 3) (5 : Fin 13)
    (7 : Fin 13) (9 : Fin 13)
    (51 : Fin 78) (53 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (51 : Fin 78) (5 : Fin 13) (7 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (53 : Fin 78) (5 : Fin 13) (9 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0476` (row). -/
theorem directSource_h0476 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 2 5 7 && rowBit (directSourceRows C) 2 5 10)) || ((rankAtom (directSourceRanks P) 51 == rankAtom (directSourceRanks P) 54)))) = true := by
  exact directSource_row_rank_guard C
    (2 : Fin 3) (5 : Fin 13)
    (7 : Fin 13) (10 : Fin 13)
    (51 : Fin 78) (54 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (51 : Fin 78) (5 : Fin 13) (7 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (54 : Fin 78) (5 : Fin 13) (10 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0477` (row). -/
theorem directSource_h0477 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 2 5 7 && rowBit (directSourceRows C) 2 5 11)) || ((rankAtom (directSourceRanks P) 51 == rankAtom (directSourceRanks P) 55)))) = true := by
  exact directSource_row_rank_guard C
    (2 : Fin 3) (5 : Fin 13)
    (7 : Fin 13) (11 : Fin 13)
    (51 : Fin 78) (55 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (51 : Fin 78) (5 : Fin 13) (7 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (55 : Fin 78) (5 : Fin 13) (11 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0478` (row). -/
theorem directSource_h0478 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 2 5 7 && rowBit (directSourceRows C) 2 5 12)) || ((rankAtom (directSourceRanks P) 51 == rankAtom (directSourceRanks P) 56)))) = true := by
  exact directSource_row_rank_guard C
    (2 : Fin 3) (5 : Fin 13)
    (7 : Fin 13) (12 : Fin 13)
    (51 : Fin 78) (56 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (51 : Fin 78) (5 : Fin 13) (7 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (56 : Fin 78) (5 : Fin 13) (12 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0479` (row). -/
theorem directSource_h0479 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 2 5 8 && rowBit (directSourceRows C) 2 5 9)) || ((rankAtom (directSourceRanks P) 52 == rankAtom (directSourceRanks P) 53)))) = true := by
  exact directSource_row_rank_guard C
    (2 : Fin 3) (5 : Fin 13)
    (8 : Fin 13) (9 : Fin 13)
    (52 : Fin 78) (53 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (52 : Fin 78) (5 : Fin 13) (8 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (53 : Fin 78) (5 : Fin 13) (9 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0480` (row). -/
theorem directSource_h0480 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 2 5 8 && rowBit (directSourceRows C) 2 5 10)) || ((rankAtom (directSourceRanks P) 52 == rankAtom (directSourceRanks P) 54)))) = true := by
  exact directSource_row_rank_guard C
    (2 : Fin 3) (5 : Fin 13)
    (8 : Fin 13) (10 : Fin 13)
    (52 : Fin 78) (54 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (52 : Fin 78) (5 : Fin 13) (8 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (54 : Fin 78) (5 : Fin 13) (10 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0481` (row). -/
theorem directSource_h0481 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 2 5 8 && rowBit (directSourceRows C) 2 5 11)) || ((rankAtom (directSourceRanks P) 52 == rankAtom (directSourceRanks P) 55)))) = true := by
  exact directSource_row_rank_guard C
    (2 : Fin 3) (5 : Fin 13)
    (8 : Fin 13) (11 : Fin 13)
    (52 : Fin 78) (55 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (52 : Fin 78) (5 : Fin 13) (8 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (55 : Fin 78) (5 : Fin 13) (11 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0482` (row). -/
theorem directSource_h0482 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 2 5 8 && rowBit (directSourceRows C) 2 5 12)) || ((rankAtom (directSourceRanks P) 52 == rankAtom (directSourceRanks P) 56)))) = true := by
  exact directSource_row_rank_guard C
    (2 : Fin 3) (5 : Fin 13)
    (8 : Fin 13) (12 : Fin 13)
    (52 : Fin 78) (56 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (52 : Fin 78) (5 : Fin 13) (8 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (56 : Fin 78) (5 : Fin 13) (12 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0483` (row). -/
theorem directSource_h0483 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 2 5 9 && rowBit (directSourceRows C) 2 5 10)) || ((rankAtom (directSourceRanks P) 53 == rankAtom (directSourceRanks P) 54)))) = true := by
  exact directSource_row_rank_guard C
    (2 : Fin 3) (5 : Fin 13)
    (9 : Fin 13) (10 : Fin 13)
    (53 : Fin 78) (54 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (53 : Fin 78) (5 : Fin 13) (9 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (54 : Fin 78) (5 : Fin 13) (10 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0484` (row). -/
theorem directSource_h0484 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 2 5 9 && rowBit (directSourceRows C) 2 5 11)) || ((rankAtom (directSourceRanks P) 53 == rankAtom (directSourceRanks P) 55)))) = true := by
  exact directSource_row_rank_guard C
    (2 : Fin 3) (5 : Fin 13)
    (9 : Fin 13) (11 : Fin 13)
    (53 : Fin 78) (55 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (53 : Fin 78) (5 : Fin 13) (9 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (55 : Fin 78) (5 : Fin 13) (11 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0485` (row). -/
theorem directSource_h0485 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 2 5 9 && rowBit (directSourceRows C) 2 5 12)) || ((rankAtom (directSourceRanks P) 53 == rankAtom (directSourceRanks P) 56)))) = true := by
  exact directSource_row_rank_guard C
    (2 : Fin 3) (5 : Fin 13)
    (9 : Fin 13) (12 : Fin 13)
    (53 : Fin 78) (56 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (53 : Fin 78) (5 : Fin 13) (9 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (56 : Fin 78) (5 : Fin 13) (12 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0486` (row). -/
theorem directSource_h0486 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 2 5 10 && rowBit (directSourceRows C) 2 5 11)) || ((rankAtom (directSourceRanks P) 54 == rankAtom (directSourceRanks P) 55)))) = true := by
  exact directSource_row_rank_guard C
    (2 : Fin 3) (5 : Fin 13)
    (10 : Fin 13) (11 : Fin 13)
    (54 : Fin 78) (55 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (54 : Fin 78) (5 : Fin 13) (10 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (55 : Fin 78) (5 : Fin 13) (11 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0487` (row). -/
theorem directSource_h0487 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 2 5 10 && rowBit (directSourceRows C) 2 5 12)) || ((rankAtom (directSourceRanks P) 54 == rankAtom (directSourceRanks P) 56)))) = true := by
  exact directSource_row_rank_guard C
    (2 : Fin 3) (5 : Fin 13)
    (10 : Fin 13) (12 : Fin 13)
    (54 : Fin 78) (56 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (54 : Fin 78) (5 : Fin 13) (10 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (56 : Fin 78) (5 : Fin 13) (12 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0488` (row). -/
theorem directSource_h0488 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 2 5 11 && rowBit (directSourceRows C) 2 5 12)) || ((rankAtom (directSourceRanks P) 55 == rankAtom (directSourceRanks P) 56)))) = true := by
  exact directSource_row_rank_guard C
    (2 : Fin 3) (5 : Fin 13)
    (11 : Fin 13) (12 : Fin 13)
    (55 : Fin 78) (56 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (55 : Fin 78) (5 : Fin 13) (11 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (56 : Fin 78) (5 : Fin 13) (12 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0489` (first). -/
theorem directSource_h0489 :
    ((!((firstRowBit (directSourceFirstRow T) 0 && firstRowBit (directSourceFirstRow T) 9)) || ((rankAtom (directSourceRanks P) 3 == rankAtom (directSourceRanks P) 46)))) = true := by
  exact directSource_firstRow_rank_guard
    (0 : Fin 13) (9 : Fin 13)
    (3 : Fin 78) (46 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (3 : Fin 78) (4 : Fin 13) (0 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (46 : Fin 78) (4 : Fin 13) (9 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0490` (first). -/
theorem directSource_h0490 :
    ((!((firstRowBit (directSourceFirstRow T) 0 && firstRowBit (directSourceFirstRow T) 10)) || ((rankAtom (directSourceRanks P) 3 == rankAtom (directSourceRanks P) 47)))) = true := by
  exact directSource_firstRow_rank_guard
    (0 : Fin 13) (10 : Fin 13)
    (3 : Fin 78) (47 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (3 : Fin 78) (4 : Fin 13) (0 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (47 : Fin 78) (4 : Fin 13) (10 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0491` (first). -/
theorem directSource_h0491 :
    ((!((firstRowBit (directSourceFirstRow T) 0 && firstRowBit (directSourceFirstRow T) 11)) || ((rankAtom (directSourceRanks P) 3 == rankAtom (directSourceRanks P) 48)))) = true := by
  exact directSource_firstRow_rank_guard
    (0 : Fin 13) (11 : Fin 13)
    (3 : Fin 78) (48 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (3 : Fin 78) (4 : Fin 13) (0 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (48 : Fin 78) (4 : Fin 13) (11 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0492` (first). -/
theorem directSource_h0492 :
    ((!((firstRowBit (directSourceFirstRow T) 0 && firstRowBit (directSourceFirstRow T) 12)) || ((rankAtom (directSourceRanks P) 3 == rankAtom (directSourceRanks P) 49)))) = true := by
  exact directSource_firstRow_rank_guard
    (0 : Fin 13) (12 : Fin 13)
    (3 : Fin 78) (49 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (3 : Fin 78) (4 : Fin 13) (0 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (49 : Fin 78) (4 : Fin 13) (12 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0493` (first). -/
theorem directSource_h0493 :
    ((!((firstRowBit (directSourceFirstRow T) 1 && firstRowBit (directSourceFirstRow T) 9)) || ((rankAtom (directSourceRanks P) 14 == rankAtom (directSourceRanks P) 46)))) = true := by
  exact directSource_firstRow_rank_guard
    (1 : Fin 13) (9 : Fin 13)
    (14 : Fin 78) (46 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (14 : Fin 78) (4 : Fin 13) (1 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (46 : Fin 78) (4 : Fin 13) (9 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0494` (first). -/
theorem directSource_h0494 :
    ((!((firstRowBit (directSourceFirstRow T) 1 && firstRowBit (directSourceFirstRow T) 10)) || ((rankAtom (directSourceRanks P) 14 == rankAtom (directSourceRanks P) 47)))) = true := by
  exact directSource_firstRow_rank_guard
    (1 : Fin 13) (10 : Fin 13)
    (14 : Fin 78) (47 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (14 : Fin 78) (4 : Fin 13) (1 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (47 : Fin 78) (4 : Fin 13) (10 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0495` (first). -/
theorem directSource_h0495 :
    ((!((firstRowBit (directSourceFirstRow T) 1 && firstRowBit (directSourceFirstRow T) 11)) || ((rankAtom (directSourceRanks P) 14 == rankAtom (directSourceRanks P) 48)))) = true := by
  exact directSource_firstRow_rank_guard
    (1 : Fin 13) (11 : Fin 13)
    (14 : Fin 78) (48 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (14 : Fin 78) (4 : Fin 13) (1 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (48 : Fin 78) (4 : Fin 13) (11 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0496` (first). -/
theorem directSource_h0496 :
    ((!((firstRowBit (directSourceFirstRow T) 1 && firstRowBit (directSourceFirstRow T) 12)) || ((rankAtom (directSourceRanks P) 14 == rankAtom (directSourceRanks P) 49)))) = true := by
  exact directSource_firstRow_rank_guard
    (1 : Fin 13) (12 : Fin 13)
    (14 : Fin 78) (49 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (14 : Fin 78) (4 : Fin 13) (1 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (49 : Fin 78) (4 : Fin 13) (12 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0497` (first). -/
theorem directSource_h0497 :
    ((!((firstRowBit (directSourceFirstRow T) 2 && firstRowBit (directSourceFirstRow T) 6)) || ((rankAtom (directSourceRanks P) 24 == rankAtom (directSourceRanks P) 43)))) = true := by
  exact directSource_firstRow_rank_guard
    (2 : Fin 13) (6 : Fin 13)
    (24 : Fin 78) (43 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (24 : Fin 78) (4 : Fin 13) (2 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (43 : Fin 78) (4 : Fin 13) (6 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0498` (first). -/
theorem directSource_h0498 :
    ((!((firstRowBit (directSourceFirstRow T) 2 && firstRowBit (directSourceFirstRow T) 9)) || ((rankAtom (directSourceRanks P) 24 == rankAtom (directSourceRanks P) 46)))) = true := by
  exact directSource_firstRow_rank_guard
    (2 : Fin 13) (9 : Fin 13)
    (24 : Fin 78) (46 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (24 : Fin 78) (4 : Fin 13) (2 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (46 : Fin 78) (4 : Fin 13) (9 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0499` (first). -/
theorem directSource_h0499 :
    ((!((firstRowBit (directSourceFirstRow T) 2 && firstRowBit (directSourceFirstRow T) 10)) || ((rankAtom (directSourceRanks P) 24 == rankAtom (directSourceRanks P) 47)))) = true := by
  exact directSource_firstRow_rank_guard
    (2 : Fin 13) (10 : Fin 13)
    (24 : Fin 78) (47 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (24 : Fin 78) (4 : Fin 13) (2 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (47 : Fin 78) (4 : Fin 13) (10 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0500` (first). -/
theorem directSource_h0500 :
    ((!((firstRowBit (directSourceFirstRow T) 2 && firstRowBit (directSourceFirstRow T) 11)) || ((rankAtom (directSourceRanks P) 24 == rankAtom (directSourceRanks P) 48)))) = true := by
  exact directSource_firstRow_rank_guard
    (2 : Fin 13) (11 : Fin 13)
    (24 : Fin 78) (48 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (24 : Fin 78) (4 : Fin 13) (2 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (48 : Fin 78) (4 : Fin 13) (11 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0501` (first). -/
theorem directSource_h0501 :
    ((!((firstRowBit (directSourceFirstRow T) 2 && firstRowBit (directSourceFirstRow T) 12)) || ((rankAtom (directSourceRanks P) 24 == rankAtom (directSourceRanks P) 49)))) = true := by
  exact directSource_firstRow_rank_guard
    (2 : Fin 13) (12 : Fin 13)
    (24 : Fin 78) (49 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (24 : Fin 78) (4 : Fin 13) (2 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (49 : Fin 78) (4 : Fin 13) (12 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0502` (first). -/
theorem directSource_h0502 :
    ((!((firstRowBit (directSourceFirstRow T) 3 && firstRowBit (directSourceFirstRow T) 9)) || ((rankAtom (directSourceRanks P) 33 == rankAtom (directSourceRanks P) 46)))) = true := by
  exact directSource_firstRow_rank_guard
    (3 : Fin 13) (9 : Fin 13)
    (33 : Fin 78) (46 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (33 : Fin 78) (4 : Fin 13) (3 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (46 : Fin 78) (4 : Fin 13) (9 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0503` (first). -/
theorem directSource_h0503 :
    ((!((firstRowBit (directSourceFirstRow T) 3 && firstRowBit (directSourceFirstRow T) 10)) || ((rankAtom (directSourceRanks P) 33 == rankAtom (directSourceRanks P) 47)))) = true := by
  exact directSource_firstRow_rank_guard
    (3 : Fin 13) (10 : Fin 13)
    (33 : Fin 78) (47 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (33 : Fin 78) (4 : Fin 13) (3 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (47 : Fin 78) (4 : Fin 13) (10 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0504` (first). -/
theorem directSource_h0504 :
    ((!((firstRowBit (directSourceFirstRow T) 3 && firstRowBit (directSourceFirstRow T) 11)) || ((rankAtom (directSourceRanks P) 33 == rankAtom (directSourceRanks P) 48)))) = true := by
  exact directSource_firstRow_rank_guard
    (3 : Fin 13) (11 : Fin 13)
    (33 : Fin 78) (48 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (33 : Fin 78) (4 : Fin 13) (3 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (48 : Fin 78) (4 : Fin 13) (11 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0505` (first). -/
theorem directSource_h0505 :
    ((!((firstRowBit (directSourceFirstRow T) 3 && firstRowBit (directSourceFirstRow T) 12)) || ((rankAtom (directSourceRanks P) 33 == rankAtom (directSourceRanks P) 49)))) = true := by
  exact directSource_firstRow_rank_guard
    (3 : Fin 13) (12 : Fin 13)
    (33 : Fin 78) (49 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (33 : Fin 78) (4 : Fin 13) (3 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (49 : Fin 78) (4 : Fin 13) (12 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0506` (first). -/
theorem directSource_h0506 :
    ((!((firstRowBit (directSourceFirstRow T) 5 && firstRowBit (directSourceFirstRow T) 9)) || ((rankAtom (directSourceRanks P) 42 == rankAtom (directSourceRanks P) 46)))) = true := by
  exact directSource_firstRow_rank_guard
    (5 : Fin 13) (9 : Fin 13)
    (42 : Fin 78) (46 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (42 : Fin 78) (4 : Fin 13) (5 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (46 : Fin 78) (4 : Fin 13) (9 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0507` (first). -/
theorem directSource_h0507 :
    ((!((firstRowBit (directSourceFirstRow T) 5 && firstRowBit (directSourceFirstRow T) 10)) || ((rankAtom (directSourceRanks P) 42 == rankAtom (directSourceRanks P) 47)))) = true := by
  exact directSource_firstRow_rank_guard
    (5 : Fin 13) (10 : Fin 13)
    (42 : Fin 78) (47 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (42 : Fin 78) (4 : Fin 13) (5 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (47 : Fin 78) (4 : Fin 13) (10 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0508` (first). -/
theorem directSource_h0508 :
    ((!((firstRowBit (directSourceFirstRow T) 5 && firstRowBit (directSourceFirstRow T) 11)) || ((rankAtom (directSourceRanks P) 42 == rankAtom (directSourceRanks P) 48)))) = true := by
  exact directSource_firstRow_rank_guard
    (5 : Fin 13) (11 : Fin 13)
    (42 : Fin 78) (48 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (42 : Fin 78) (4 : Fin 13) (5 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (48 : Fin 78) (4 : Fin 13) (11 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0509` (first). -/
theorem directSource_h0509 :
    ((!((firstRowBit (directSourceFirstRow T) 5 && firstRowBit (directSourceFirstRow T) 12)) || ((rankAtom (directSourceRanks P) 42 == rankAtom (directSourceRanks P) 49)))) = true := by
  exact directSource_firstRow_rank_guard
    (5 : Fin 13) (12 : Fin 13)
    (42 : Fin 78) (49 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (42 : Fin 78) (4 : Fin 13) (5 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (49 : Fin 78) (4 : Fin 13) (12 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0510` (first). -/
theorem directSource_h0510 :
    ((!((firstRowBit (directSourceFirstRow T) 6 && firstRowBit (directSourceFirstRow T) 9)) || ((rankAtom (directSourceRanks P) 43 == rankAtom (directSourceRanks P) 46)))) = true := by
  exact directSource_firstRow_rank_guard
    (6 : Fin 13) (9 : Fin 13)
    (43 : Fin 78) (46 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (43 : Fin 78) (4 : Fin 13) (6 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (46 : Fin 78) (4 : Fin 13) (9 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0511` (first). -/
theorem directSource_h0511 :
    ((!((firstRowBit (directSourceFirstRow T) 6 && firstRowBit (directSourceFirstRow T) 10)) || ((rankAtom (directSourceRanks P) 43 == rankAtom (directSourceRanks P) 47)))) = true := by
  exact directSource_firstRow_rank_guard
    (6 : Fin 13) (10 : Fin 13)
    (43 : Fin 78) (47 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (43 : Fin 78) (4 : Fin 13) (6 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (47 : Fin 78) (4 : Fin 13) (10 : Fin 13) (by decide))

end

end ATailExactFiveCard13CnfIngressScratch
end Problem97
