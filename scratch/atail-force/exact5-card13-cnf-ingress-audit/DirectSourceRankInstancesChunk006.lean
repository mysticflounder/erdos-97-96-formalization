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

/-- Exact pass-5 source assertion `h0384` (row). -/
theorem directSource_h0384 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 1 6 2 && rowBit (directSourceRows C) 1 6 9)) || ((rankAtom (directSourceRanks P) 26 == rankAtom (directSourceRanks P) 59)))) = true := by
  exact directSource_row_rank_guard C
    (1 : Fin 3) (6 : Fin 13)
    (2 : Fin 13) (9 : Fin 13)
    (26 : Fin 78) (59 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (26 : Fin 78) (6 : Fin 13) (2 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (59 : Fin 78) (6 : Fin 13) (9 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0385` (row). -/
theorem directSource_h0385 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 1 6 2 && rowBit (directSourceRows C) 1 6 10)) || ((rankAtom (directSourceRanks P) 26 == rankAtom (directSourceRanks P) 60)))) = true := by
  exact directSource_row_rank_guard C
    (1 : Fin 3) (6 : Fin 13)
    (2 : Fin 13) (10 : Fin 13)
    (26 : Fin 78) (60 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (26 : Fin 78) (6 : Fin 13) (2 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (60 : Fin 78) (6 : Fin 13) (10 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0386` (row). -/
theorem directSource_h0386 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 1 6 2 && rowBit (directSourceRows C) 1 6 11)) || ((rankAtom (directSourceRanks P) 26 == rankAtom (directSourceRanks P) 61)))) = true := by
  exact directSource_row_rank_guard C
    (1 : Fin 3) (6 : Fin 13)
    (2 : Fin 13) (11 : Fin 13)
    (26 : Fin 78) (61 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (26 : Fin 78) (6 : Fin 13) (2 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (61 : Fin 78) (6 : Fin 13) (11 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0387` (row). -/
theorem directSource_h0387 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 1 6 2 && rowBit (directSourceRows C) 1 6 12)) || ((rankAtom (directSourceRanks P) 26 == rankAtom (directSourceRanks P) 62)))) = true := by
  exact directSource_row_rank_guard C
    (1 : Fin 3) (6 : Fin 13)
    (2 : Fin 13) (12 : Fin 13)
    (26 : Fin 78) (62 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (26 : Fin 78) (6 : Fin 13) (2 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (62 : Fin 78) (6 : Fin 13) (12 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0388` (row). -/
theorem directSource_h0388 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 1 6 3 && rowBit (directSourceRows C) 1 6 4)) || ((rankAtom (directSourceRanks P) 35 == rankAtom (directSourceRanks P) 43)))) = true := by
  exact directSource_row_rank_guard C
    (1 : Fin 3) (6 : Fin 13)
    (3 : Fin 13) (4 : Fin 13)
    (35 : Fin 78) (43 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (35 : Fin 78) (6 : Fin 13) (3 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (43 : Fin 78) (6 : Fin 13) (4 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0389` (row). -/
theorem directSource_h0389 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 1 6 3 && rowBit (directSourceRows C) 1 6 5)) || ((rankAtom (directSourceRanks P) 35 == rankAtom (directSourceRanks P) 50)))) = true := by
  exact directSource_row_rank_guard C
    (1 : Fin 3) (6 : Fin 13)
    (3 : Fin 13) (5 : Fin 13)
    (35 : Fin 78) (50 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (35 : Fin 78) (6 : Fin 13) (3 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (50 : Fin 78) (6 : Fin 13) (5 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0390` (row). -/
theorem directSource_h0390 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 1 6 3 && rowBit (directSourceRows C) 1 6 7)) || ((rankAtom (directSourceRanks P) 35 == rankAtom (directSourceRanks P) 57)))) = true := by
  exact directSource_row_rank_guard C
    (1 : Fin 3) (6 : Fin 13)
    (3 : Fin 13) (7 : Fin 13)
    (35 : Fin 78) (57 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (35 : Fin 78) (6 : Fin 13) (3 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (57 : Fin 78) (6 : Fin 13) (7 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0391` (row). -/
theorem directSource_h0391 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 1 6 3 && rowBit (directSourceRows C) 1 6 8)) || ((rankAtom (directSourceRanks P) 35 == rankAtom (directSourceRanks P) 58)))) = true := by
  exact directSource_row_rank_guard C
    (1 : Fin 3) (6 : Fin 13)
    (3 : Fin 13) (8 : Fin 13)
    (35 : Fin 78) (58 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (35 : Fin 78) (6 : Fin 13) (3 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (58 : Fin 78) (6 : Fin 13) (8 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0392` (row). -/
theorem directSource_h0392 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 1 6 3 && rowBit (directSourceRows C) 1 6 9)) || ((rankAtom (directSourceRanks P) 35 == rankAtom (directSourceRanks P) 59)))) = true := by
  exact directSource_row_rank_guard C
    (1 : Fin 3) (6 : Fin 13)
    (3 : Fin 13) (9 : Fin 13)
    (35 : Fin 78) (59 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (35 : Fin 78) (6 : Fin 13) (3 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (59 : Fin 78) (6 : Fin 13) (9 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0393` (row). -/
theorem directSource_h0393 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 1 6 3 && rowBit (directSourceRows C) 1 6 10)) || ((rankAtom (directSourceRanks P) 35 == rankAtom (directSourceRanks P) 60)))) = true := by
  exact directSource_row_rank_guard C
    (1 : Fin 3) (6 : Fin 13)
    (3 : Fin 13) (10 : Fin 13)
    (35 : Fin 78) (60 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (35 : Fin 78) (6 : Fin 13) (3 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (60 : Fin 78) (6 : Fin 13) (10 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0394` (row). -/
theorem directSource_h0394 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 1 6 3 && rowBit (directSourceRows C) 1 6 11)) || ((rankAtom (directSourceRanks P) 35 == rankAtom (directSourceRanks P) 61)))) = true := by
  exact directSource_row_rank_guard C
    (1 : Fin 3) (6 : Fin 13)
    (3 : Fin 13) (11 : Fin 13)
    (35 : Fin 78) (61 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (35 : Fin 78) (6 : Fin 13) (3 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (61 : Fin 78) (6 : Fin 13) (11 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0395` (row). -/
theorem directSource_h0395 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 1 6 3 && rowBit (directSourceRows C) 1 6 12)) || ((rankAtom (directSourceRanks P) 35 == rankAtom (directSourceRanks P) 62)))) = true := by
  exact directSource_row_rank_guard C
    (1 : Fin 3) (6 : Fin 13)
    (3 : Fin 13) (12 : Fin 13)
    (35 : Fin 78) (62 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (35 : Fin 78) (6 : Fin 13) (3 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (62 : Fin 78) (6 : Fin 13) (12 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0396` (row). -/
theorem directSource_h0396 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 1 6 4 && rowBit (directSourceRows C) 1 6 5)) || ((rankAtom (directSourceRanks P) 43 == rankAtom (directSourceRanks P) 50)))) = true := by
  exact directSource_row_rank_guard C
    (1 : Fin 3) (6 : Fin 13)
    (4 : Fin 13) (5 : Fin 13)
    (43 : Fin 78) (50 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (43 : Fin 78) (6 : Fin 13) (4 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (50 : Fin 78) (6 : Fin 13) (5 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0397` (row). -/
theorem directSource_h0397 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 1 6 4 && rowBit (directSourceRows C) 1 6 7)) || ((rankAtom (directSourceRanks P) 43 == rankAtom (directSourceRanks P) 57)))) = true := by
  exact directSource_row_rank_guard C
    (1 : Fin 3) (6 : Fin 13)
    (4 : Fin 13) (7 : Fin 13)
    (43 : Fin 78) (57 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (43 : Fin 78) (6 : Fin 13) (4 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (57 : Fin 78) (6 : Fin 13) (7 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0398` (row). -/
theorem directSource_h0398 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 1 6 4 && rowBit (directSourceRows C) 1 6 8)) || ((rankAtom (directSourceRanks P) 43 == rankAtom (directSourceRanks P) 58)))) = true := by
  exact directSource_row_rank_guard C
    (1 : Fin 3) (6 : Fin 13)
    (4 : Fin 13) (8 : Fin 13)
    (43 : Fin 78) (58 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (43 : Fin 78) (6 : Fin 13) (4 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (58 : Fin 78) (6 : Fin 13) (8 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0399` (row). -/
theorem directSource_h0399 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 1 6 4 && rowBit (directSourceRows C) 1 6 9)) || ((rankAtom (directSourceRanks P) 43 == rankAtom (directSourceRanks P) 59)))) = true := by
  exact directSource_row_rank_guard C
    (1 : Fin 3) (6 : Fin 13)
    (4 : Fin 13) (9 : Fin 13)
    (43 : Fin 78) (59 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (43 : Fin 78) (6 : Fin 13) (4 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (59 : Fin 78) (6 : Fin 13) (9 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0400` (row). -/
theorem directSource_h0400 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 1 6 4 && rowBit (directSourceRows C) 1 6 10)) || ((rankAtom (directSourceRanks P) 43 == rankAtom (directSourceRanks P) 60)))) = true := by
  exact directSource_row_rank_guard C
    (1 : Fin 3) (6 : Fin 13)
    (4 : Fin 13) (10 : Fin 13)
    (43 : Fin 78) (60 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (43 : Fin 78) (6 : Fin 13) (4 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (60 : Fin 78) (6 : Fin 13) (10 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0401` (row). -/
theorem directSource_h0401 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 1 6 4 && rowBit (directSourceRows C) 1 6 11)) || ((rankAtom (directSourceRanks P) 43 == rankAtom (directSourceRanks P) 61)))) = true := by
  exact directSource_row_rank_guard C
    (1 : Fin 3) (6 : Fin 13)
    (4 : Fin 13) (11 : Fin 13)
    (43 : Fin 78) (61 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (43 : Fin 78) (6 : Fin 13) (4 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (61 : Fin 78) (6 : Fin 13) (11 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0402` (row). -/
theorem directSource_h0402 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 1 6 4 && rowBit (directSourceRows C) 1 6 12)) || ((rankAtom (directSourceRanks P) 43 == rankAtom (directSourceRanks P) 62)))) = true := by
  exact directSource_row_rank_guard C
    (1 : Fin 3) (6 : Fin 13)
    (4 : Fin 13) (12 : Fin 13)
    (43 : Fin 78) (62 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (43 : Fin 78) (6 : Fin 13) (4 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (62 : Fin 78) (6 : Fin 13) (12 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0403` (row). -/
theorem directSource_h0403 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 1 6 5 && rowBit (directSourceRows C) 1 6 7)) || ((rankAtom (directSourceRanks P) 50 == rankAtom (directSourceRanks P) 57)))) = true := by
  exact directSource_row_rank_guard C
    (1 : Fin 3) (6 : Fin 13)
    (5 : Fin 13) (7 : Fin 13)
    (50 : Fin 78) (57 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (50 : Fin 78) (6 : Fin 13) (5 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (57 : Fin 78) (6 : Fin 13) (7 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0404` (row). -/
theorem directSource_h0404 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 1 6 5 && rowBit (directSourceRows C) 1 6 8)) || ((rankAtom (directSourceRanks P) 50 == rankAtom (directSourceRanks P) 58)))) = true := by
  exact directSource_row_rank_guard C
    (1 : Fin 3) (6 : Fin 13)
    (5 : Fin 13) (8 : Fin 13)
    (50 : Fin 78) (58 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (50 : Fin 78) (6 : Fin 13) (5 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (58 : Fin 78) (6 : Fin 13) (8 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0405` (row). -/
theorem directSource_h0405 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 1 6 5 && rowBit (directSourceRows C) 1 6 9)) || ((rankAtom (directSourceRanks P) 50 == rankAtom (directSourceRanks P) 59)))) = true := by
  exact directSource_row_rank_guard C
    (1 : Fin 3) (6 : Fin 13)
    (5 : Fin 13) (9 : Fin 13)
    (50 : Fin 78) (59 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (50 : Fin 78) (6 : Fin 13) (5 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (59 : Fin 78) (6 : Fin 13) (9 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0406` (row). -/
theorem directSource_h0406 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 1 6 5 && rowBit (directSourceRows C) 1 6 10)) || ((rankAtom (directSourceRanks P) 50 == rankAtom (directSourceRanks P) 60)))) = true := by
  exact directSource_row_rank_guard C
    (1 : Fin 3) (6 : Fin 13)
    (5 : Fin 13) (10 : Fin 13)
    (50 : Fin 78) (60 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (50 : Fin 78) (6 : Fin 13) (5 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (60 : Fin 78) (6 : Fin 13) (10 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0407` (row). -/
theorem directSource_h0407 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 1 6 5 && rowBit (directSourceRows C) 1 6 11)) || ((rankAtom (directSourceRanks P) 50 == rankAtom (directSourceRanks P) 61)))) = true := by
  exact directSource_row_rank_guard C
    (1 : Fin 3) (6 : Fin 13)
    (5 : Fin 13) (11 : Fin 13)
    (50 : Fin 78) (61 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (50 : Fin 78) (6 : Fin 13) (5 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (61 : Fin 78) (6 : Fin 13) (11 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0408` (row). -/
theorem directSource_h0408 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 1 6 5 && rowBit (directSourceRows C) 1 6 12)) || ((rankAtom (directSourceRanks P) 50 == rankAtom (directSourceRanks P) 62)))) = true := by
  exact directSource_row_rank_guard C
    (1 : Fin 3) (6 : Fin 13)
    (5 : Fin 13) (12 : Fin 13)
    (50 : Fin 78) (62 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (50 : Fin 78) (6 : Fin 13) (5 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (62 : Fin 78) (6 : Fin 13) (12 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0409` (row). -/
theorem directSource_h0409 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 1 6 7 && rowBit (directSourceRows C) 1 6 8)) || ((rankAtom (directSourceRanks P) 57 == rankAtom (directSourceRanks P) 58)))) = true := by
  exact directSource_row_rank_guard C
    (1 : Fin 3) (6 : Fin 13)
    (7 : Fin 13) (8 : Fin 13)
    (57 : Fin 78) (58 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (57 : Fin 78) (6 : Fin 13) (7 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (58 : Fin 78) (6 : Fin 13) (8 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0410` (row). -/
theorem directSource_h0410 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 1 6 7 && rowBit (directSourceRows C) 1 6 9)) || ((rankAtom (directSourceRanks P) 57 == rankAtom (directSourceRanks P) 59)))) = true := by
  exact directSource_row_rank_guard C
    (1 : Fin 3) (6 : Fin 13)
    (7 : Fin 13) (9 : Fin 13)
    (57 : Fin 78) (59 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (57 : Fin 78) (6 : Fin 13) (7 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (59 : Fin 78) (6 : Fin 13) (9 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0411` (row). -/
theorem directSource_h0411 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 1 6 7 && rowBit (directSourceRows C) 1 6 10)) || ((rankAtom (directSourceRanks P) 57 == rankAtom (directSourceRanks P) 60)))) = true := by
  exact directSource_row_rank_guard C
    (1 : Fin 3) (6 : Fin 13)
    (7 : Fin 13) (10 : Fin 13)
    (57 : Fin 78) (60 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (57 : Fin 78) (6 : Fin 13) (7 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (60 : Fin 78) (6 : Fin 13) (10 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0412` (row). -/
theorem directSource_h0412 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 1 6 7 && rowBit (directSourceRows C) 1 6 11)) || ((rankAtom (directSourceRanks P) 57 == rankAtom (directSourceRanks P) 61)))) = true := by
  exact directSource_row_rank_guard C
    (1 : Fin 3) (6 : Fin 13)
    (7 : Fin 13) (11 : Fin 13)
    (57 : Fin 78) (61 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (57 : Fin 78) (6 : Fin 13) (7 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (61 : Fin 78) (6 : Fin 13) (11 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0413` (row). -/
theorem directSource_h0413 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 1 6 7 && rowBit (directSourceRows C) 1 6 12)) || ((rankAtom (directSourceRanks P) 57 == rankAtom (directSourceRanks P) 62)))) = true := by
  exact directSource_row_rank_guard C
    (1 : Fin 3) (6 : Fin 13)
    (7 : Fin 13) (12 : Fin 13)
    (57 : Fin 78) (62 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (57 : Fin 78) (6 : Fin 13) (7 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (62 : Fin 78) (6 : Fin 13) (12 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0414` (row). -/
theorem directSource_h0414 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 1 6 8 && rowBit (directSourceRows C) 1 6 9)) || ((rankAtom (directSourceRanks P) 58 == rankAtom (directSourceRanks P) 59)))) = true := by
  exact directSource_row_rank_guard C
    (1 : Fin 3) (6 : Fin 13)
    (8 : Fin 13) (9 : Fin 13)
    (58 : Fin 78) (59 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (58 : Fin 78) (6 : Fin 13) (8 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (59 : Fin 78) (6 : Fin 13) (9 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0415` (row). -/
theorem directSource_h0415 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 1 6 8 && rowBit (directSourceRows C) 1 6 10)) || ((rankAtom (directSourceRanks P) 58 == rankAtom (directSourceRanks P) 60)))) = true := by
  exact directSource_row_rank_guard C
    (1 : Fin 3) (6 : Fin 13)
    (8 : Fin 13) (10 : Fin 13)
    (58 : Fin 78) (60 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (58 : Fin 78) (6 : Fin 13) (8 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (60 : Fin 78) (6 : Fin 13) (10 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0416` (row). -/
theorem directSource_h0416 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 1 6 8 && rowBit (directSourceRows C) 1 6 11)) || ((rankAtom (directSourceRanks P) 58 == rankAtom (directSourceRanks P) 61)))) = true := by
  exact directSource_row_rank_guard C
    (1 : Fin 3) (6 : Fin 13)
    (8 : Fin 13) (11 : Fin 13)
    (58 : Fin 78) (61 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (58 : Fin 78) (6 : Fin 13) (8 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (61 : Fin 78) (6 : Fin 13) (11 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0417` (row). -/
theorem directSource_h0417 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 1 6 8 && rowBit (directSourceRows C) 1 6 12)) || ((rankAtom (directSourceRanks P) 58 == rankAtom (directSourceRanks P) 62)))) = true := by
  exact directSource_row_rank_guard C
    (1 : Fin 3) (6 : Fin 13)
    (8 : Fin 13) (12 : Fin 13)
    (58 : Fin 78) (62 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (58 : Fin 78) (6 : Fin 13) (8 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (62 : Fin 78) (6 : Fin 13) (12 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0418` (row). -/
theorem directSource_h0418 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 1 6 9 && rowBit (directSourceRows C) 1 6 10)) || ((rankAtom (directSourceRanks P) 59 == rankAtom (directSourceRanks P) 60)))) = true := by
  exact directSource_row_rank_guard C
    (1 : Fin 3) (6 : Fin 13)
    (9 : Fin 13) (10 : Fin 13)
    (59 : Fin 78) (60 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (59 : Fin 78) (6 : Fin 13) (9 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (60 : Fin 78) (6 : Fin 13) (10 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0419` (row). -/
theorem directSource_h0419 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 1 6 9 && rowBit (directSourceRows C) 1 6 11)) || ((rankAtom (directSourceRanks P) 59 == rankAtom (directSourceRanks P) 61)))) = true := by
  exact directSource_row_rank_guard C
    (1 : Fin 3) (6 : Fin 13)
    (9 : Fin 13) (11 : Fin 13)
    (59 : Fin 78) (61 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (59 : Fin 78) (6 : Fin 13) (9 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (61 : Fin 78) (6 : Fin 13) (11 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0420` (row). -/
theorem directSource_h0420 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 1 6 9 && rowBit (directSourceRows C) 1 6 12)) || ((rankAtom (directSourceRanks P) 59 == rankAtom (directSourceRanks P) 62)))) = true := by
  exact directSource_row_rank_guard C
    (1 : Fin 3) (6 : Fin 13)
    (9 : Fin 13) (12 : Fin 13)
    (59 : Fin 78) (62 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (59 : Fin 78) (6 : Fin 13) (9 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (62 : Fin 78) (6 : Fin 13) (12 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0421` (row). -/
theorem directSource_h0421 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 1 6 10 && rowBit (directSourceRows C) 1 6 11)) || ((rankAtom (directSourceRanks P) 60 == rankAtom (directSourceRanks P) 61)))) = true := by
  exact directSource_row_rank_guard C
    (1 : Fin 3) (6 : Fin 13)
    (10 : Fin 13) (11 : Fin 13)
    (60 : Fin 78) (61 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (60 : Fin 78) (6 : Fin 13) (10 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (61 : Fin 78) (6 : Fin 13) (11 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0422` (row). -/
theorem directSource_h0422 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 1 6 10 && rowBit (directSourceRows C) 1 6 12)) || ((rankAtom (directSourceRanks P) 60 == rankAtom (directSourceRanks P) 62)))) = true := by
  exact directSource_row_rank_guard C
    (1 : Fin 3) (6 : Fin 13)
    (10 : Fin 13) (12 : Fin 13)
    (60 : Fin 78) (62 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (60 : Fin 78) (6 : Fin 13) (10 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (62 : Fin 78) (6 : Fin 13) (12 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0423` (row). -/
theorem directSource_h0423 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 1 6 11 && rowBit (directSourceRows C) 1 6 12)) || ((rankAtom (directSourceRanks P) 61 == rankAtom (directSourceRanks P) 62)))) = true := by
  exact directSource_row_rank_guard C
    (1 : Fin 3) (6 : Fin 13)
    (11 : Fin 13) (12 : Fin 13)
    (61 : Fin 78) (62 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (61 : Fin 78) (6 : Fin 13) (11 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (62 : Fin 78) (6 : Fin 13) (12 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0424` (row). -/
theorem directSource_h0424 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 2 5 0 && rowBit (directSourceRows C) 2 5 1)) || ((rankAtom (directSourceRanks P) 4 == rankAtom (directSourceRanks P) 15)))) = true := by
  exact directSource_row_rank_guard C
    (2 : Fin 3) (5 : Fin 13)
    (0 : Fin 13) (1 : Fin 13)
    (4 : Fin 78) (15 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (4 : Fin 78) (5 : Fin 13) (0 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (15 : Fin 78) (5 : Fin 13) (1 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0425` (row). -/
theorem directSource_h0425 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 2 5 0 && rowBit (directSourceRows C) 2 5 2)) || ((rankAtom (directSourceRanks P) 4 == rankAtom (directSourceRanks P) 25)))) = true := by
  exact directSource_row_rank_guard C
    (2 : Fin 3) (5 : Fin 13)
    (0 : Fin 13) (2 : Fin 13)
    (4 : Fin 78) (25 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (4 : Fin 78) (5 : Fin 13) (0 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (25 : Fin 78) (5 : Fin 13) (2 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0426` (row). -/
theorem directSource_h0426 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 2 5 0 && rowBit (directSourceRows C) 2 5 3)) || ((rankAtom (directSourceRanks P) 4 == rankAtom (directSourceRanks P) 34)))) = true := by
  exact directSource_row_rank_guard C
    (2 : Fin 3) (5 : Fin 13)
    (0 : Fin 13) (3 : Fin 13)
    (4 : Fin 78) (34 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (4 : Fin 78) (5 : Fin 13) (0 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (34 : Fin 78) (5 : Fin 13) (3 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0427` (row). -/
theorem directSource_h0427 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 2 5 0 && rowBit (directSourceRows C) 2 5 4)) || ((rankAtom (directSourceRanks P) 4 == rankAtom (directSourceRanks P) 42)))) = true := by
  exact directSource_row_rank_guard C
    (2 : Fin 3) (5 : Fin 13)
    (0 : Fin 13) (4 : Fin 13)
    (4 : Fin 78) (42 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (4 : Fin 78) (5 : Fin 13) (0 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (42 : Fin 78) (5 : Fin 13) (4 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0428` (row). -/
theorem directSource_h0428 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 2 5 0 && rowBit (directSourceRows C) 2 5 6)) || ((rankAtom (directSourceRanks P) 4 == rankAtom (directSourceRanks P) 50)))) = true := by
  exact directSource_row_rank_guard C
    (2 : Fin 3) (5 : Fin 13)
    (0 : Fin 13) (6 : Fin 13)
    (4 : Fin 78) (50 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (4 : Fin 78) (5 : Fin 13) (0 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (50 : Fin 78) (5 : Fin 13) (6 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0429` (row). -/
theorem directSource_h0429 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 2 5 0 && rowBit (directSourceRows C) 2 5 7)) || ((rankAtom (directSourceRanks P) 4 == rankAtom (directSourceRanks P) 51)))) = true := by
  exact directSource_row_rank_guard C
    (2 : Fin 3) (5 : Fin 13)
    (0 : Fin 13) (7 : Fin 13)
    (4 : Fin 78) (51 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (4 : Fin 78) (5 : Fin 13) (0 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (51 : Fin 78) (5 : Fin 13) (7 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0430` (row). -/
theorem directSource_h0430 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 2 5 0 && rowBit (directSourceRows C) 2 5 8)) || ((rankAtom (directSourceRanks P) 4 == rankAtom (directSourceRanks P) 52)))) = true := by
  exact directSource_row_rank_guard C
    (2 : Fin 3) (5 : Fin 13)
    (0 : Fin 13) (8 : Fin 13)
    (4 : Fin 78) (52 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (4 : Fin 78) (5 : Fin 13) (0 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (52 : Fin 78) (5 : Fin 13) (8 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0431` (row). -/
theorem directSource_h0431 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 2 5 0 && rowBit (directSourceRows C) 2 5 9)) || ((rankAtom (directSourceRanks P) 4 == rankAtom (directSourceRanks P) 53)))) = true := by
  exact directSource_row_rank_guard C
    (2 : Fin 3) (5 : Fin 13)
    (0 : Fin 13) (9 : Fin 13)
    (4 : Fin 78) (53 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (4 : Fin 78) (5 : Fin 13) (0 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (53 : Fin 78) (5 : Fin 13) (9 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0432` (row). -/
theorem directSource_h0432 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 2 5 0 && rowBit (directSourceRows C) 2 5 10)) || ((rankAtom (directSourceRanks P) 4 == rankAtom (directSourceRanks P) 54)))) = true := by
  exact directSource_row_rank_guard C
    (2 : Fin 3) (5 : Fin 13)
    (0 : Fin 13) (10 : Fin 13)
    (4 : Fin 78) (54 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (4 : Fin 78) (5 : Fin 13) (0 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (54 : Fin 78) (5 : Fin 13) (10 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0433` (row). -/
theorem directSource_h0433 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 2 5 0 && rowBit (directSourceRows C) 2 5 11)) || ((rankAtom (directSourceRanks P) 4 == rankAtom (directSourceRanks P) 55)))) = true := by
  exact directSource_row_rank_guard C
    (2 : Fin 3) (5 : Fin 13)
    (0 : Fin 13) (11 : Fin 13)
    (4 : Fin 78) (55 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (4 : Fin 78) (5 : Fin 13) (0 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (55 : Fin 78) (5 : Fin 13) (11 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0434` (row). -/
theorem directSource_h0434 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 2 5 0 && rowBit (directSourceRows C) 2 5 12)) || ((rankAtom (directSourceRanks P) 4 == rankAtom (directSourceRanks P) 56)))) = true := by
  exact directSource_row_rank_guard C
    (2 : Fin 3) (5 : Fin 13)
    (0 : Fin 13) (12 : Fin 13)
    (4 : Fin 78) (56 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (4 : Fin 78) (5 : Fin 13) (0 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (56 : Fin 78) (5 : Fin 13) (12 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0435` (row). -/
theorem directSource_h0435 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 2 5 1 && rowBit (directSourceRows C) 2 5 2)) || ((rankAtom (directSourceRanks P) 15 == rankAtom (directSourceRanks P) 25)))) = true := by
  exact directSource_row_rank_guard C
    (2 : Fin 3) (5 : Fin 13)
    (1 : Fin 13) (2 : Fin 13)
    (15 : Fin 78) (25 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (15 : Fin 78) (5 : Fin 13) (1 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (25 : Fin 78) (5 : Fin 13) (2 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0436` (row). -/
theorem directSource_h0436 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 2 5 1 && rowBit (directSourceRows C) 2 5 3)) || ((rankAtom (directSourceRanks P) 15 == rankAtom (directSourceRanks P) 34)))) = true := by
  exact directSource_row_rank_guard C
    (2 : Fin 3) (5 : Fin 13)
    (1 : Fin 13) (3 : Fin 13)
    (15 : Fin 78) (34 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (15 : Fin 78) (5 : Fin 13) (1 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (34 : Fin 78) (5 : Fin 13) (3 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0437` (row). -/
theorem directSource_h0437 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 2 5 1 && rowBit (directSourceRows C) 2 5 4)) || ((rankAtom (directSourceRanks P) 15 == rankAtom (directSourceRanks P) 42)))) = true := by
  exact directSource_row_rank_guard C
    (2 : Fin 3) (5 : Fin 13)
    (1 : Fin 13) (4 : Fin 13)
    (15 : Fin 78) (42 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (15 : Fin 78) (5 : Fin 13) (1 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (42 : Fin 78) (5 : Fin 13) (4 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0438` (row). -/
theorem directSource_h0438 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 2 5 1 && rowBit (directSourceRows C) 2 5 6)) || ((rankAtom (directSourceRanks P) 15 == rankAtom (directSourceRanks P) 50)))) = true := by
  exact directSource_row_rank_guard C
    (2 : Fin 3) (5 : Fin 13)
    (1 : Fin 13) (6 : Fin 13)
    (15 : Fin 78) (50 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (15 : Fin 78) (5 : Fin 13) (1 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (50 : Fin 78) (5 : Fin 13) (6 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0439` (row). -/
theorem directSource_h0439 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 2 5 1 && rowBit (directSourceRows C) 2 5 7)) || ((rankAtom (directSourceRanks P) 15 == rankAtom (directSourceRanks P) 51)))) = true := by
  exact directSource_row_rank_guard C
    (2 : Fin 3) (5 : Fin 13)
    (1 : Fin 13) (7 : Fin 13)
    (15 : Fin 78) (51 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (15 : Fin 78) (5 : Fin 13) (1 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (51 : Fin 78) (5 : Fin 13) (7 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0440` (row). -/
theorem directSource_h0440 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 2 5 1 && rowBit (directSourceRows C) 2 5 8)) || ((rankAtom (directSourceRanks P) 15 == rankAtom (directSourceRanks P) 52)))) = true := by
  exact directSource_row_rank_guard C
    (2 : Fin 3) (5 : Fin 13)
    (1 : Fin 13) (8 : Fin 13)
    (15 : Fin 78) (52 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (15 : Fin 78) (5 : Fin 13) (1 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (52 : Fin 78) (5 : Fin 13) (8 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0441` (row). -/
theorem directSource_h0441 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 2 5 1 && rowBit (directSourceRows C) 2 5 9)) || ((rankAtom (directSourceRanks P) 15 == rankAtom (directSourceRanks P) 53)))) = true := by
  exact directSource_row_rank_guard C
    (2 : Fin 3) (5 : Fin 13)
    (1 : Fin 13) (9 : Fin 13)
    (15 : Fin 78) (53 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (15 : Fin 78) (5 : Fin 13) (1 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (53 : Fin 78) (5 : Fin 13) (9 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0442` (row). -/
theorem directSource_h0442 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 2 5 1 && rowBit (directSourceRows C) 2 5 10)) || ((rankAtom (directSourceRanks P) 15 == rankAtom (directSourceRanks P) 54)))) = true := by
  exact directSource_row_rank_guard C
    (2 : Fin 3) (5 : Fin 13)
    (1 : Fin 13) (10 : Fin 13)
    (15 : Fin 78) (54 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (15 : Fin 78) (5 : Fin 13) (1 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (54 : Fin 78) (5 : Fin 13) (10 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0443` (row). -/
theorem directSource_h0443 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 2 5 1 && rowBit (directSourceRows C) 2 5 11)) || ((rankAtom (directSourceRanks P) 15 == rankAtom (directSourceRanks P) 55)))) = true := by
  exact directSource_row_rank_guard C
    (2 : Fin 3) (5 : Fin 13)
    (1 : Fin 13) (11 : Fin 13)
    (15 : Fin 78) (55 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (15 : Fin 78) (5 : Fin 13) (1 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (55 : Fin 78) (5 : Fin 13) (11 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0444` (row). -/
theorem directSource_h0444 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 2 5 1 && rowBit (directSourceRows C) 2 5 12)) || ((rankAtom (directSourceRanks P) 15 == rankAtom (directSourceRanks P) 56)))) = true := by
  exact directSource_row_rank_guard C
    (2 : Fin 3) (5 : Fin 13)
    (1 : Fin 13) (12 : Fin 13)
    (15 : Fin 78) (56 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (15 : Fin 78) (5 : Fin 13) (1 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (56 : Fin 78) (5 : Fin 13) (12 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0445` (row). -/
theorem directSource_h0445 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 2 5 2 && rowBit (directSourceRows C) 2 5 4)) || ((rankAtom (directSourceRanks P) 25 == rankAtom (directSourceRanks P) 42)))) = true := by
  exact directSource_row_rank_guard C
    (2 : Fin 3) (5 : Fin 13)
    (2 : Fin 13) (4 : Fin 13)
    (25 : Fin 78) (42 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (25 : Fin 78) (5 : Fin 13) (2 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (42 : Fin 78) (5 : Fin 13) (4 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0446` (row). -/
theorem directSource_h0446 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 2 5 2 && rowBit (directSourceRows C) 2 5 6)) || ((rankAtom (directSourceRanks P) 25 == rankAtom (directSourceRanks P) 50)))) = true := by
  exact directSource_row_rank_guard C
    (2 : Fin 3) (5 : Fin 13)
    (2 : Fin 13) (6 : Fin 13)
    (25 : Fin 78) (50 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (25 : Fin 78) (5 : Fin 13) (2 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (50 : Fin 78) (5 : Fin 13) (6 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0447` (row). -/
theorem directSource_h0447 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 2 5 2 && rowBit (directSourceRows C) 2 5 7)) || ((rankAtom (directSourceRanks P) 25 == rankAtom (directSourceRanks P) 51)))) = true := by
  exact directSource_row_rank_guard C
    (2 : Fin 3) (5 : Fin 13)
    (2 : Fin 13) (7 : Fin 13)
    (25 : Fin 78) (51 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (25 : Fin 78) (5 : Fin 13) (2 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (51 : Fin 78) (5 : Fin 13) (7 : Fin 13) (by decide))

end

end ATailExactFiveCard13CnfIngressScratch
end Problem97
