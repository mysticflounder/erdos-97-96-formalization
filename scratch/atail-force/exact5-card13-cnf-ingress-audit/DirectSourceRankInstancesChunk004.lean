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

/-- Exact pass-5 source assertion `h0256` (row). -/
theorem directSource_h0256 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 0 0 5 && rowBit (directSourceRows C) 0 0 7)) || ((rankAtom (directSourceRanks P) 4 == rankAtom (directSourceRanks P) 6)))) = true := by
  exact directSource_row_rank_guard C
    (0 : Fin 3) (0 : Fin 13)
    (5 : Fin 13) (7 : Fin 13)
    (4 : Fin 78) (6 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (4 : Fin 78) (0 : Fin 13) (5 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (6 : Fin 78) (0 : Fin 13) (7 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0257` (row). -/
theorem directSource_h0257 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 0 0 5 && rowBit (directSourceRows C) 0 0 8)) || ((rankAtom (directSourceRanks P) 4 == rankAtom (directSourceRanks P) 7)))) = true := by
  exact directSource_row_rank_guard C
    (0 : Fin 3) (0 : Fin 13)
    (5 : Fin 13) (8 : Fin 13)
    (4 : Fin 78) (7 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (4 : Fin 78) (0 : Fin 13) (5 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (7 : Fin 78) (0 : Fin 13) (8 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0258` (row). -/
theorem directSource_h0258 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 0 0 5 && rowBit (directSourceRows C) 0 0 9)) || ((rankAtom (directSourceRanks P) 4 == rankAtom (directSourceRanks P) 8)))) = true := by
  exact directSource_row_rank_guard C
    (0 : Fin 3) (0 : Fin 13)
    (5 : Fin 13) (9 : Fin 13)
    (4 : Fin 78) (8 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (4 : Fin 78) (0 : Fin 13) (5 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (8 : Fin 78) (0 : Fin 13) (9 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0259` (row). -/
theorem directSource_h0259 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 0 0 5 && rowBit (directSourceRows C) 0 0 10)) || ((rankAtom (directSourceRanks P) 4 == rankAtom (directSourceRanks P) 9)))) = true := by
  exact directSource_row_rank_guard C
    (0 : Fin 3) (0 : Fin 13)
    (5 : Fin 13) (10 : Fin 13)
    (4 : Fin 78) (9 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (4 : Fin 78) (0 : Fin 13) (5 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (9 : Fin 78) (0 : Fin 13) (10 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0260` (row). -/
theorem directSource_h0260 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 0 0 5 && rowBit (directSourceRows C) 0 0 11)) || ((rankAtom (directSourceRanks P) 4 == rankAtom (directSourceRanks P) 10)))) = true := by
  exact directSource_row_rank_guard C
    (0 : Fin 3) (0 : Fin 13)
    (5 : Fin 13) (11 : Fin 13)
    (4 : Fin 78) (10 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (4 : Fin 78) (0 : Fin 13) (5 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (10 : Fin 78) (0 : Fin 13) (11 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0261` (row). -/
theorem directSource_h0261 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 0 0 5 && rowBit (directSourceRows C) 0 0 12)) || ((rankAtom (directSourceRanks P) 4 == rankAtom (directSourceRanks P) 11)))) = true := by
  exact directSource_row_rank_guard C
    (0 : Fin 3) (0 : Fin 13)
    (5 : Fin 13) (12 : Fin 13)
    (4 : Fin 78) (11 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (4 : Fin 78) (0 : Fin 13) (5 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (11 : Fin 78) (0 : Fin 13) (12 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0262` (row). -/
theorem directSource_h0262 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 0 0 6 && rowBit (directSourceRows C) 0 0 7)) || ((rankAtom (directSourceRanks P) 5 == rankAtom (directSourceRanks P) 6)))) = true := by
  exact directSource_row_rank_guard C
    (0 : Fin 3) (0 : Fin 13)
    (6 : Fin 13) (7 : Fin 13)
    (5 : Fin 78) (6 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (5 : Fin 78) (0 : Fin 13) (6 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (6 : Fin 78) (0 : Fin 13) (7 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0263` (row). -/
theorem directSource_h0263 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 0 0 6 && rowBit (directSourceRows C) 0 0 8)) || ((rankAtom (directSourceRanks P) 5 == rankAtom (directSourceRanks P) 7)))) = true := by
  exact directSource_row_rank_guard C
    (0 : Fin 3) (0 : Fin 13)
    (6 : Fin 13) (8 : Fin 13)
    (5 : Fin 78) (7 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (5 : Fin 78) (0 : Fin 13) (6 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (7 : Fin 78) (0 : Fin 13) (8 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0264` (row). -/
theorem directSource_h0264 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 0 0 6 && rowBit (directSourceRows C) 0 0 9)) || ((rankAtom (directSourceRanks P) 5 == rankAtom (directSourceRanks P) 8)))) = true := by
  exact directSource_row_rank_guard C
    (0 : Fin 3) (0 : Fin 13)
    (6 : Fin 13) (9 : Fin 13)
    (5 : Fin 78) (8 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (5 : Fin 78) (0 : Fin 13) (6 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (8 : Fin 78) (0 : Fin 13) (9 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0265` (row). -/
theorem directSource_h0265 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 0 0 6 && rowBit (directSourceRows C) 0 0 10)) || ((rankAtom (directSourceRanks P) 5 == rankAtom (directSourceRanks P) 9)))) = true := by
  exact directSource_row_rank_guard C
    (0 : Fin 3) (0 : Fin 13)
    (6 : Fin 13) (10 : Fin 13)
    (5 : Fin 78) (9 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (5 : Fin 78) (0 : Fin 13) (6 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (9 : Fin 78) (0 : Fin 13) (10 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0266` (row). -/
theorem directSource_h0266 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 0 0 6 && rowBit (directSourceRows C) 0 0 11)) || ((rankAtom (directSourceRanks P) 5 == rankAtom (directSourceRanks P) 10)))) = true := by
  exact directSource_row_rank_guard C
    (0 : Fin 3) (0 : Fin 13)
    (6 : Fin 13) (11 : Fin 13)
    (5 : Fin 78) (10 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (5 : Fin 78) (0 : Fin 13) (6 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (10 : Fin 78) (0 : Fin 13) (11 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0267` (row). -/
theorem directSource_h0267 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 0 0 6 && rowBit (directSourceRows C) 0 0 12)) || ((rankAtom (directSourceRanks P) 5 == rankAtom (directSourceRanks P) 11)))) = true := by
  exact directSource_row_rank_guard C
    (0 : Fin 3) (0 : Fin 13)
    (6 : Fin 13) (12 : Fin 13)
    (5 : Fin 78) (11 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (5 : Fin 78) (0 : Fin 13) (6 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (11 : Fin 78) (0 : Fin 13) (12 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0268` (row). -/
theorem directSource_h0268 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 0 0 7 && rowBit (directSourceRows C) 0 0 8)) || ((rankAtom (directSourceRanks P) 6 == rankAtom (directSourceRanks P) 7)))) = true := by
  exact directSource_row_rank_guard C
    (0 : Fin 3) (0 : Fin 13)
    (7 : Fin 13) (8 : Fin 13)
    (6 : Fin 78) (7 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (6 : Fin 78) (0 : Fin 13) (7 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (7 : Fin 78) (0 : Fin 13) (8 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0269` (row). -/
theorem directSource_h0269 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 0 0 7 && rowBit (directSourceRows C) 0 0 9)) || ((rankAtom (directSourceRanks P) 6 == rankAtom (directSourceRanks P) 8)))) = true := by
  exact directSource_row_rank_guard C
    (0 : Fin 3) (0 : Fin 13)
    (7 : Fin 13) (9 : Fin 13)
    (6 : Fin 78) (8 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (6 : Fin 78) (0 : Fin 13) (7 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (8 : Fin 78) (0 : Fin 13) (9 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0270` (row). -/
theorem directSource_h0270 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 0 0 7 && rowBit (directSourceRows C) 0 0 10)) || ((rankAtom (directSourceRanks P) 6 == rankAtom (directSourceRanks P) 9)))) = true := by
  exact directSource_row_rank_guard C
    (0 : Fin 3) (0 : Fin 13)
    (7 : Fin 13) (10 : Fin 13)
    (6 : Fin 78) (9 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (6 : Fin 78) (0 : Fin 13) (7 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (9 : Fin 78) (0 : Fin 13) (10 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0271` (row). -/
theorem directSource_h0271 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 0 0 7 && rowBit (directSourceRows C) 0 0 11)) || ((rankAtom (directSourceRanks P) 6 == rankAtom (directSourceRanks P) 10)))) = true := by
  exact directSource_row_rank_guard C
    (0 : Fin 3) (0 : Fin 13)
    (7 : Fin 13) (11 : Fin 13)
    (6 : Fin 78) (10 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (6 : Fin 78) (0 : Fin 13) (7 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (10 : Fin 78) (0 : Fin 13) (11 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0272` (row). -/
theorem directSource_h0272 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 0 0 7 && rowBit (directSourceRows C) 0 0 12)) || ((rankAtom (directSourceRanks P) 6 == rankAtom (directSourceRanks P) 11)))) = true := by
  exact directSource_row_rank_guard C
    (0 : Fin 3) (0 : Fin 13)
    (7 : Fin 13) (12 : Fin 13)
    (6 : Fin 78) (11 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (6 : Fin 78) (0 : Fin 13) (7 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (11 : Fin 78) (0 : Fin 13) (12 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0273` (row). -/
theorem directSource_h0273 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 0 0 9 && rowBit (directSourceRows C) 0 0 10)) || ((rankAtom (directSourceRanks P) 8 == rankAtom (directSourceRanks P) 9)))) = true := by
  exact directSource_row_rank_guard C
    (0 : Fin 3) (0 : Fin 13)
    (9 : Fin 13) (10 : Fin 13)
    (8 : Fin 78) (9 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (8 : Fin 78) (0 : Fin 13) (9 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (9 : Fin 78) (0 : Fin 13) (10 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0274` (row). -/
theorem directSource_h0274 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 0 0 9 && rowBit (directSourceRows C) 0 0 11)) || ((rankAtom (directSourceRanks P) 8 == rankAtom (directSourceRanks P) 10)))) = true := by
  exact directSource_row_rank_guard C
    (0 : Fin 3) (0 : Fin 13)
    (9 : Fin 13) (11 : Fin 13)
    (8 : Fin 78) (10 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (8 : Fin 78) (0 : Fin 13) (9 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (10 : Fin 78) (0 : Fin 13) (11 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0275` (row). -/
theorem directSource_h0275 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 0 0 10 && rowBit (directSourceRows C) 0 0 11)) || ((rankAtom (directSourceRanks P) 9 == rankAtom (directSourceRanks P) 10)))) = true := by
  exact directSource_row_rank_guard C
    (0 : Fin 3) (0 : Fin 13)
    (10 : Fin 13) (11 : Fin 13)
    (9 : Fin 78) (10 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (9 : Fin 78) (0 : Fin 13) (10 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (10 : Fin 78) (0 : Fin 13) (11 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0276` (row). -/
theorem directSource_h0276 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 0 0 10 && rowBit (directSourceRows C) 0 0 12)) || ((rankAtom (directSourceRanks P) 9 == rankAtom (directSourceRanks P) 11)))) = true := by
  exact directSource_row_rank_guard C
    (0 : Fin 3) (0 : Fin 13)
    (10 : Fin 13) (12 : Fin 13)
    (9 : Fin 78) (11 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (9 : Fin 78) (0 : Fin 13) (10 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (11 : Fin 78) (0 : Fin 13) (12 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0277` (row). -/
theorem directSource_h0277 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 0 0 11 && rowBit (directSourceRows C) 0 0 12)) || ((rankAtom (directSourceRanks P) 10 == rankAtom (directSourceRanks P) 11)))) = true := by
  exact directSource_row_rank_guard C
    (0 : Fin 3) (0 : Fin 13)
    (11 : Fin 13) (12 : Fin 13)
    (10 : Fin 78) (11 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (10 : Fin 78) (0 : Fin 13) (11 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (11 : Fin 78) (0 : Fin 13) (12 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0278` (row). -/
theorem directSource_h0278 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 0 2 1 && rowBit (directSourceRows C) 0 2 3)) || ((rankAtom (directSourceRanks P) 12 == rankAtom (directSourceRanks P) 23)))) = true := by
  exact directSource_row_rank_guard C
    (0 : Fin 3) (2 : Fin 13)
    (1 : Fin 13) (3 : Fin 13)
    (12 : Fin 78) (23 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (12 : Fin 78) (2 : Fin 13) (1 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (23 : Fin 78) (2 : Fin 13) (3 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0279` (row). -/
theorem directSource_h0279 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 0 2 1 && rowBit (directSourceRows C) 0 2 5)) || ((rankAtom (directSourceRanks P) 12 == rankAtom (directSourceRanks P) 25)))) = true := by
  exact directSource_row_rank_guard C
    (0 : Fin 3) (2 : Fin 13)
    (1 : Fin 13) (5 : Fin 13)
    (12 : Fin 78) (25 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (12 : Fin 78) (2 : Fin 13) (1 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (25 : Fin 78) (2 : Fin 13) (5 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0280` (row). -/
theorem directSource_h0280 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 0 2 1 && rowBit (directSourceRows C) 0 2 6)) || ((rankAtom (directSourceRanks P) 12 == rankAtom (directSourceRanks P) 26)))) = true := by
  exact directSource_row_rank_guard C
    (0 : Fin 3) (2 : Fin 13)
    (1 : Fin 13) (6 : Fin 13)
    (12 : Fin 78) (26 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (12 : Fin 78) (2 : Fin 13) (1 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (26 : Fin 78) (2 : Fin 13) (6 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0281` (row). -/
theorem directSource_h0281 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 0 2 1 && rowBit (directSourceRows C) 0 2 7)) || ((rankAtom (directSourceRanks P) 12 == rankAtom (directSourceRanks P) 27)))) = true := by
  exact directSource_row_rank_guard C
    (0 : Fin 3) (2 : Fin 13)
    (1 : Fin 13) (7 : Fin 13)
    (12 : Fin 78) (27 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (12 : Fin 78) (2 : Fin 13) (1 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (27 : Fin 78) (2 : Fin 13) (7 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0282` (row). -/
theorem directSource_h0282 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 0 2 1 && rowBit (directSourceRows C) 0 2 8)) || ((rankAtom (directSourceRanks P) 12 == rankAtom (directSourceRanks P) 28)))) = true := by
  exact directSource_row_rank_guard C
    (0 : Fin 3) (2 : Fin 13)
    (1 : Fin 13) (8 : Fin 13)
    (12 : Fin 78) (28 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (12 : Fin 78) (2 : Fin 13) (1 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (28 : Fin 78) (2 : Fin 13) (8 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0283` (row). -/
theorem directSource_h0283 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 0 2 1 && rowBit (directSourceRows C) 0 2 9)) || ((rankAtom (directSourceRanks P) 12 == rankAtom (directSourceRanks P) 29)))) = true := by
  exact directSource_row_rank_guard C
    (0 : Fin 3) (2 : Fin 13)
    (1 : Fin 13) (9 : Fin 13)
    (12 : Fin 78) (29 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (12 : Fin 78) (2 : Fin 13) (1 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (29 : Fin 78) (2 : Fin 13) (9 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0284` (row). -/
theorem directSource_h0284 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 0 2 1 && rowBit (directSourceRows C) 0 2 10)) || ((rankAtom (directSourceRanks P) 12 == rankAtom (directSourceRanks P) 30)))) = true := by
  exact directSource_row_rank_guard C
    (0 : Fin 3) (2 : Fin 13)
    (1 : Fin 13) (10 : Fin 13)
    (12 : Fin 78) (30 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (12 : Fin 78) (2 : Fin 13) (1 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (30 : Fin 78) (2 : Fin 13) (10 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0285` (row). -/
theorem directSource_h0285 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 0 2 1 && rowBit (directSourceRows C) 0 2 11)) || ((rankAtom (directSourceRanks P) 12 == rankAtom (directSourceRanks P) 31)))) = true := by
  exact directSource_row_rank_guard C
    (0 : Fin 3) (2 : Fin 13)
    (1 : Fin 13) (11 : Fin 13)
    (12 : Fin 78) (31 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (12 : Fin 78) (2 : Fin 13) (1 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (31 : Fin 78) (2 : Fin 13) (11 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0286` (row). -/
theorem directSource_h0286 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 0 2 1 && rowBit (directSourceRows C) 0 2 12)) || ((rankAtom (directSourceRanks P) 12 == rankAtom (directSourceRanks P) 32)))) = true := by
  exact directSource_row_rank_guard C
    (0 : Fin 3) (2 : Fin 13)
    (1 : Fin 13) (12 : Fin 13)
    (12 : Fin 78) (32 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (12 : Fin 78) (2 : Fin 13) (1 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (32 : Fin 78) (2 : Fin 13) (12 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0287` (row). -/
theorem directSource_h0287 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 0 2 3 && rowBit (directSourceRows C) 0 2 5)) || ((rankAtom (directSourceRanks P) 23 == rankAtom (directSourceRanks P) 25)))) = true := by
  exact directSource_row_rank_guard C
    (0 : Fin 3) (2 : Fin 13)
    (3 : Fin 13) (5 : Fin 13)
    (23 : Fin 78) (25 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (23 : Fin 78) (2 : Fin 13) (3 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (25 : Fin 78) (2 : Fin 13) (5 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0288` (row). -/
theorem directSource_h0288 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 0 2 3 && rowBit (directSourceRows C) 0 2 6)) || ((rankAtom (directSourceRanks P) 23 == rankAtom (directSourceRanks P) 26)))) = true := by
  exact directSource_row_rank_guard C
    (0 : Fin 3) (2 : Fin 13)
    (3 : Fin 13) (6 : Fin 13)
    (23 : Fin 78) (26 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (23 : Fin 78) (2 : Fin 13) (3 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (26 : Fin 78) (2 : Fin 13) (6 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0289` (row). -/
theorem directSource_h0289 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 0 2 3 && rowBit (directSourceRows C) 0 2 7)) || ((rankAtom (directSourceRanks P) 23 == rankAtom (directSourceRanks P) 27)))) = true := by
  exact directSource_row_rank_guard C
    (0 : Fin 3) (2 : Fin 13)
    (3 : Fin 13) (7 : Fin 13)
    (23 : Fin 78) (27 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (23 : Fin 78) (2 : Fin 13) (3 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (27 : Fin 78) (2 : Fin 13) (7 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0290` (row). -/
theorem directSource_h0290 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 0 2 3 && rowBit (directSourceRows C) 0 2 8)) || ((rankAtom (directSourceRanks P) 23 == rankAtom (directSourceRanks P) 28)))) = true := by
  exact directSource_row_rank_guard C
    (0 : Fin 3) (2 : Fin 13)
    (3 : Fin 13) (8 : Fin 13)
    (23 : Fin 78) (28 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (23 : Fin 78) (2 : Fin 13) (3 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (28 : Fin 78) (2 : Fin 13) (8 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0291` (row). -/
theorem directSource_h0291 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 0 2 3 && rowBit (directSourceRows C) 0 2 9)) || ((rankAtom (directSourceRanks P) 23 == rankAtom (directSourceRanks P) 29)))) = true := by
  exact directSource_row_rank_guard C
    (0 : Fin 3) (2 : Fin 13)
    (3 : Fin 13) (9 : Fin 13)
    (23 : Fin 78) (29 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (23 : Fin 78) (2 : Fin 13) (3 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (29 : Fin 78) (2 : Fin 13) (9 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0292` (row). -/
theorem directSource_h0292 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 0 2 3 && rowBit (directSourceRows C) 0 2 10)) || ((rankAtom (directSourceRanks P) 23 == rankAtom (directSourceRanks P) 30)))) = true := by
  exact directSource_row_rank_guard C
    (0 : Fin 3) (2 : Fin 13)
    (3 : Fin 13) (10 : Fin 13)
    (23 : Fin 78) (30 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (23 : Fin 78) (2 : Fin 13) (3 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (30 : Fin 78) (2 : Fin 13) (10 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0293` (row). -/
theorem directSource_h0293 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 0 2 3 && rowBit (directSourceRows C) 0 2 11)) || ((rankAtom (directSourceRanks P) 23 == rankAtom (directSourceRanks P) 31)))) = true := by
  exact directSource_row_rank_guard C
    (0 : Fin 3) (2 : Fin 13)
    (3 : Fin 13) (11 : Fin 13)
    (23 : Fin 78) (31 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (23 : Fin 78) (2 : Fin 13) (3 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (31 : Fin 78) (2 : Fin 13) (11 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0294` (row). -/
theorem directSource_h0294 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 0 2 5 && rowBit (directSourceRows C) 0 2 6)) || ((rankAtom (directSourceRanks P) 25 == rankAtom (directSourceRanks P) 26)))) = true := by
  exact directSource_row_rank_guard C
    (0 : Fin 3) (2 : Fin 13)
    (5 : Fin 13) (6 : Fin 13)
    (25 : Fin 78) (26 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (25 : Fin 78) (2 : Fin 13) (5 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (26 : Fin 78) (2 : Fin 13) (6 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0295` (row). -/
theorem directSource_h0295 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 0 2 5 && rowBit (directSourceRows C) 0 2 7)) || ((rankAtom (directSourceRanks P) 25 == rankAtom (directSourceRanks P) 27)))) = true := by
  exact directSource_row_rank_guard C
    (0 : Fin 3) (2 : Fin 13)
    (5 : Fin 13) (7 : Fin 13)
    (25 : Fin 78) (27 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (25 : Fin 78) (2 : Fin 13) (5 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (27 : Fin 78) (2 : Fin 13) (7 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0296` (row). -/
theorem directSource_h0296 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 0 2 5 && rowBit (directSourceRows C) 0 2 8)) || ((rankAtom (directSourceRanks P) 25 == rankAtom (directSourceRanks P) 28)))) = true := by
  exact directSource_row_rank_guard C
    (0 : Fin 3) (2 : Fin 13)
    (5 : Fin 13) (8 : Fin 13)
    (25 : Fin 78) (28 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (25 : Fin 78) (2 : Fin 13) (5 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (28 : Fin 78) (2 : Fin 13) (8 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0297` (row). -/
theorem directSource_h0297 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 0 2 5 && rowBit (directSourceRows C) 0 2 9)) || ((rankAtom (directSourceRanks P) 25 == rankAtom (directSourceRanks P) 29)))) = true := by
  exact directSource_row_rank_guard C
    (0 : Fin 3) (2 : Fin 13)
    (5 : Fin 13) (9 : Fin 13)
    (25 : Fin 78) (29 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (25 : Fin 78) (2 : Fin 13) (5 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (29 : Fin 78) (2 : Fin 13) (9 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0298` (row). -/
theorem directSource_h0298 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 0 2 5 && rowBit (directSourceRows C) 0 2 12)) || ((rankAtom (directSourceRanks P) 25 == rankAtom (directSourceRanks P) 32)))) = true := by
  exact directSource_row_rank_guard C
    (0 : Fin 3) (2 : Fin 13)
    (5 : Fin 13) (12 : Fin 13)
    (25 : Fin 78) (32 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (25 : Fin 78) (2 : Fin 13) (5 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (32 : Fin 78) (2 : Fin 13) (12 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0299` (row). -/
theorem directSource_h0299 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 0 2 6 && rowBit (directSourceRows C) 0 2 7)) || ((rankAtom (directSourceRanks P) 26 == rankAtom (directSourceRanks P) 27)))) = true := by
  exact directSource_row_rank_guard C
    (0 : Fin 3) (2 : Fin 13)
    (6 : Fin 13) (7 : Fin 13)
    (26 : Fin 78) (27 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (26 : Fin 78) (2 : Fin 13) (6 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (27 : Fin 78) (2 : Fin 13) (7 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0300` (row). -/
theorem directSource_h0300 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 0 2 6 && rowBit (directSourceRows C) 0 2 8)) || ((rankAtom (directSourceRanks P) 26 == rankAtom (directSourceRanks P) 28)))) = true := by
  exact directSource_row_rank_guard C
    (0 : Fin 3) (2 : Fin 13)
    (6 : Fin 13) (8 : Fin 13)
    (26 : Fin 78) (28 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (26 : Fin 78) (2 : Fin 13) (6 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (28 : Fin 78) (2 : Fin 13) (8 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0301` (row). -/
theorem directSource_h0301 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 0 2 6 && rowBit (directSourceRows C) 0 2 9)) || ((rankAtom (directSourceRanks P) 26 == rankAtom (directSourceRanks P) 29)))) = true := by
  exact directSource_row_rank_guard C
    (0 : Fin 3) (2 : Fin 13)
    (6 : Fin 13) (9 : Fin 13)
    (26 : Fin 78) (29 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (26 : Fin 78) (2 : Fin 13) (6 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (29 : Fin 78) (2 : Fin 13) (9 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0302` (row). -/
theorem directSource_h0302 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 0 2 6 && rowBit (directSourceRows C) 0 2 10)) || ((rankAtom (directSourceRanks P) 26 == rankAtom (directSourceRanks P) 30)))) = true := by
  exact directSource_row_rank_guard C
    (0 : Fin 3) (2 : Fin 13)
    (6 : Fin 13) (10 : Fin 13)
    (26 : Fin 78) (30 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (26 : Fin 78) (2 : Fin 13) (6 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (30 : Fin 78) (2 : Fin 13) (10 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0303` (row). -/
theorem directSource_h0303 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 0 2 6 && rowBit (directSourceRows C) 0 2 11)) || ((rankAtom (directSourceRanks P) 26 == rankAtom (directSourceRanks P) 31)))) = true := by
  exact directSource_row_rank_guard C
    (0 : Fin 3) (2 : Fin 13)
    (6 : Fin 13) (11 : Fin 13)
    (26 : Fin 78) (31 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (26 : Fin 78) (2 : Fin 13) (6 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (31 : Fin 78) (2 : Fin 13) (11 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0304` (row). -/
theorem directSource_h0304 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 0 2 6 && rowBit (directSourceRows C) 0 2 12)) || ((rankAtom (directSourceRanks P) 26 == rankAtom (directSourceRanks P) 32)))) = true := by
  exact directSource_row_rank_guard C
    (0 : Fin 3) (2 : Fin 13)
    (6 : Fin 13) (12 : Fin 13)
    (26 : Fin 78) (32 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (26 : Fin 78) (2 : Fin 13) (6 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (32 : Fin 78) (2 : Fin 13) (12 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0305` (row). -/
theorem directSource_h0305 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 0 2 7 && rowBit (directSourceRows C) 0 2 8)) || ((rankAtom (directSourceRanks P) 27 == rankAtom (directSourceRanks P) 28)))) = true := by
  exact directSource_row_rank_guard C
    (0 : Fin 3) (2 : Fin 13)
    (7 : Fin 13) (8 : Fin 13)
    (27 : Fin 78) (28 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (27 : Fin 78) (2 : Fin 13) (7 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (28 : Fin 78) (2 : Fin 13) (8 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0306` (row). -/
theorem directSource_h0306 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 0 2 7 && rowBit (directSourceRows C) 0 2 9)) || ((rankAtom (directSourceRanks P) 27 == rankAtom (directSourceRanks P) 29)))) = true := by
  exact directSource_row_rank_guard C
    (0 : Fin 3) (2 : Fin 13)
    (7 : Fin 13) (9 : Fin 13)
    (27 : Fin 78) (29 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (27 : Fin 78) (2 : Fin 13) (7 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (29 : Fin 78) (2 : Fin 13) (9 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0307` (row). -/
theorem directSource_h0307 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 0 2 7 && rowBit (directSourceRows C) 0 2 10)) || ((rankAtom (directSourceRanks P) 27 == rankAtom (directSourceRanks P) 30)))) = true := by
  exact directSource_row_rank_guard C
    (0 : Fin 3) (2 : Fin 13)
    (7 : Fin 13) (10 : Fin 13)
    (27 : Fin 78) (30 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (27 : Fin 78) (2 : Fin 13) (7 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (30 : Fin 78) (2 : Fin 13) (10 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0308` (row). -/
theorem directSource_h0308 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 0 2 7 && rowBit (directSourceRows C) 0 2 11)) || ((rankAtom (directSourceRanks P) 27 == rankAtom (directSourceRanks P) 31)))) = true := by
  exact directSource_row_rank_guard C
    (0 : Fin 3) (2 : Fin 13)
    (7 : Fin 13) (11 : Fin 13)
    (27 : Fin 78) (31 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (27 : Fin 78) (2 : Fin 13) (7 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (31 : Fin 78) (2 : Fin 13) (11 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0309` (row). -/
theorem directSource_h0309 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 0 2 7 && rowBit (directSourceRows C) 0 2 12)) || ((rankAtom (directSourceRanks P) 27 == rankAtom (directSourceRanks P) 32)))) = true := by
  exact directSource_row_rank_guard C
    (0 : Fin 3) (2 : Fin 13)
    (7 : Fin 13) (12 : Fin 13)
    (27 : Fin 78) (32 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (27 : Fin 78) (2 : Fin 13) (7 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (32 : Fin 78) (2 : Fin 13) (12 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0310` (row). -/
theorem directSource_h0310 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 0 2 8 && rowBit (directSourceRows C) 0 2 9)) || ((rankAtom (directSourceRanks P) 28 == rankAtom (directSourceRanks P) 29)))) = true := by
  exact directSource_row_rank_guard C
    (0 : Fin 3) (2 : Fin 13)
    (8 : Fin 13) (9 : Fin 13)
    (28 : Fin 78) (29 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (28 : Fin 78) (2 : Fin 13) (8 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (29 : Fin 78) (2 : Fin 13) (9 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0311` (row). -/
theorem directSource_h0311 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 0 2 8 && rowBit (directSourceRows C) 0 2 10)) || ((rankAtom (directSourceRanks P) 28 == rankAtom (directSourceRanks P) 30)))) = true := by
  exact directSource_row_rank_guard C
    (0 : Fin 3) (2 : Fin 13)
    (8 : Fin 13) (10 : Fin 13)
    (28 : Fin 78) (30 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (28 : Fin 78) (2 : Fin 13) (8 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (30 : Fin 78) (2 : Fin 13) (10 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0312` (row). -/
theorem directSource_h0312 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 0 2 8 && rowBit (directSourceRows C) 0 2 11)) || ((rankAtom (directSourceRanks P) 28 == rankAtom (directSourceRanks P) 31)))) = true := by
  exact directSource_row_rank_guard C
    (0 : Fin 3) (2 : Fin 13)
    (8 : Fin 13) (11 : Fin 13)
    (28 : Fin 78) (31 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (28 : Fin 78) (2 : Fin 13) (8 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (31 : Fin 78) (2 : Fin 13) (11 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0313` (row). -/
theorem directSource_h0313 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 0 2 8 && rowBit (directSourceRows C) 0 2 12)) || ((rankAtom (directSourceRanks P) 28 == rankAtom (directSourceRanks P) 32)))) = true := by
  exact directSource_row_rank_guard C
    (0 : Fin 3) (2 : Fin 13)
    (8 : Fin 13) (12 : Fin 13)
    (28 : Fin 78) (32 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (28 : Fin 78) (2 : Fin 13) (8 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (32 : Fin 78) (2 : Fin 13) (12 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0314` (row). -/
theorem directSource_h0314 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 0 2 9 && rowBit (directSourceRows C) 0 2 10)) || ((rankAtom (directSourceRanks P) 29 == rankAtom (directSourceRanks P) 30)))) = true := by
  exact directSource_row_rank_guard C
    (0 : Fin 3) (2 : Fin 13)
    (9 : Fin 13) (10 : Fin 13)
    (29 : Fin 78) (30 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (29 : Fin 78) (2 : Fin 13) (9 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (30 : Fin 78) (2 : Fin 13) (10 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0315` (row). -/
theorem directSource_h0315 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 0 2 9 && rowBit (directSourceRows C) 0 2 11)) || ((rankAtom (directSourceRanks P) 29 == rankAtom (directSourceRanks P) 31)))) = true := by
  exact directSource_row_rank_guard C
    (0 : Fin 3) (2 : Fin 13)
    (9 : Fin 13) (11 : Fin 13)
    (29 : Fin 78) (31 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (29 : Fin 78) (2 : Fin 13) (9 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (31 : Fin 78) (2 : Fin 13) (11 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0316` (row). -/
theorem directSource_h0316 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 0 2 9 && rowBit (directSourceRows C) 0 2 12)) || ((rankAtom (directSourceRanks P) 29 == rankAtom (directSourceRanks P) 32)))) = true := by
  exact directSource_row_rank_guard C
    (0 : Fin 3) (2 : Fin 13)
    (9 : Fin 13) (12 : Fin 13)
    (29 : Fin 78) (32 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (29 : Fin 78) (2 : Fin 13) (9 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (32 : Fin 78) (2 : Fin 13) (12 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0317` (row). -/
theorem directSource_h0317 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 0 2 10 && rowBit (directSourceRows C) 0 2 11)) || ((rankAtom (directSourceRanks P) 30 == rankAtom (directSourceRanks P) 31)))) = true := by
  exact directSource_row_rank_guard C
    (0 : Fin 3) (2 : Fin 13)
    (10 : Fin 13) (11 : Fin 13)
    (30 : Fin 78) (31 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (30 : Fin 78) (2 : Fin 13) (10 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (31 : Fin 78) (2 : Fin 13) (11 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0318` (row). -/
theorem directSource_h0318 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 0 2 10 && rowBit (directSourceRows C) 0 2 12)) || ((rankAtom (directSourceRanks P) 30 == rankAtom (directSourceRanks P) 32)))) = true := by
  exact directSource_row_rank_guard C
    (0 : Fin 3) (2 : Fin 13)
    (10 : Fin 13) (12 : Fin 13)
    (30 : Fin 78) (32 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (30 : Fin 78) (2 : Fin 13) (10 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (32 : Fin 78) (2 : Fin 13) (12 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0319` (row). -/
theorem directSource_h0319 (C : CanonicalCoverFamilies T) :
    ((!((rowBit (directSourceRows C) 0 2 11 && rowBit (directSourceRows C) 0 2 12)) || ((rankAtom (directSourceRanks P) 31 == rankAtom (directSourceRanks P) 32)))) = true := by
  exact directSource_row_rank_guard C
    (0 : Fin 3) (2 : Fin 13)
    (11 : Fin 13) (12 : Fin 13)
    (31 : Fin 78) (32 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (31 : Fin 78) (2 : Fin 13) (11 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (32 : Fin 78) (2 : Fin 13) (12 : Fin 13) (by decide))

end

end ATailExactFiveCard13CnfIngressScratch
end Problem97
