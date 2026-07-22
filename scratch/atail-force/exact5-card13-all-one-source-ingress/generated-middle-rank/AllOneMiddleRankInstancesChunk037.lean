/-
Generated from the middle source core whose original Lean-emitted CNF and
LRAT endpoint have been kernel checked.  These source-faithful adapters prove
the individual ordinal-rank assertions consumed by that verified endpoint.
-/
import AllOneRankFacts

/-!
# Candidate middle-orbit rank instances

Generated specializations of the source-faithful rank assertion schemas.
-/

namespace Problem97
namespace ATailExactFiveCard13AllOneSourceIngressScratch

open ATailBiApexRobustCapBounds
open ATailCriticalPairFrontier
open ATailExactFiveCard13CnfIngressScratch
open ATailExactFiveGlobalCrossDeletionPair
open ATailExactFiveMutualOneHitGeometry
open ATailFirstApexShellRole
open ATailLargeCapUniqueFive
open ATailLargeCapUniqueFivePhysicalOmissionCycle
open ATailLargeCapUniqueFivePhysicalOmissionTransitionGlobal
open ATailOrientedPhysicalApexIngress
open ATailParentExactFiveSecondCap
open ATailPhysicalSecondApexCommonDeletion
open CanonicalAllOneSourceOrbitIngress

attribute [local instance] Classical.propDecidable

set_option maxHeartbeats 0
set_option maxRecDepth 1000000

noncomputable section

variable
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {P : CanonicalCard13Frame profile}
    {star : PhysicalGlobalCrossDeletionStar profile}
    {hall : AllPhysicalActualCriticalRowsOneHit H profile}
    {first : FirstApexShellRolePacket F R}
    {T : CanonicalAllOneSemanticRowTable P star hall first}
    (I : CanonicalAllOneSourceOrbitIngress T)

/-- Candidate middle source assertion `h2368` (row). -/
theorem middleSource_h2368 :
    ((!((rowBit (I.sourceRows) 0 5 4 && rowBit (I.sourceRows) 0 5 9)) || ((allOneRankAtom (sourceRanks P) 42 == allOneRankAtom (sourceRanks P) 53)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (5 : Fin 13)
    (4 : Fin 13) (9 : Fin 13)
    (42 : Fin 78) (53 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (42 : Fin 78) (5 : Fin 13) (4 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (53 : Fin 78) (5 : Fin 13) (9 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2369` (row). -/
theorem middleSource_h2369 :
    ((!((rowBit (I.sourceRows) 0 5 4 && rowBit (I.sourceRows) 0 5 10)) || ((allOneRankAtom (sourceRanks P) 42 == allOneRankAtom (sourceRanks P) 54)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (5 : Fin 13)
    (4 : Fin 13) (10 : Fin 13)
    (42 : Fin 78) (54 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (42 : Fin 78) (5 : Fin 13) (4 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (54 : Fin 78) (5 : Fin 13) (10 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2370` (row). -/
theorem middleSource_h2370 :
    ((!((rowBit (I.sourceRows) 0 5 4 && rowBit (I.sourceRows) 0 5 11)) || ((allOneRankAtom (sourceRanks P) 42 == allOneRankAtom (sourceRanks P) 55)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (5 : Fin 13)
    (4 : Fin 13) (11 : Fin 13)
    (42 : Fin 78) (55 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (42 : Fin 78) (5 : Fin 13) (4 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (55 : Fin 78) (5 : Fin 13) (11 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2371` (row). -/
theorem middleSource_h2371 :
    ((!((rowBit (I.sourceRows) 0 5 4 && rowBit (I.sourceRows) 0 5 12)) || ((allOneRankAtom (sourceRanks P) 42 == allOneRankAtom (sourceRanks P) 56)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (5 : Fin 13)
    (4 : Fin 13) (12 : Fin 13)
    (42 : Fin 78) (56 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (42 : Fin 78) (5 : Fin 13) (4 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (56 : Fin 78) (5 : Fin 13) (12 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2372` (row). -/
theorem middleSource_h2372 :
    ((!((rowBit (I.sourceRows) 0 5 6 && rowBit (I.sourceRows) 0 5 7)) || ((allOneRankAtom (sourceRanks P) 50 == allOneRankAtom (sourceRanks P) 51)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (5 : Fin 13)
    (6 : Fin 13) (7 : Fin 13)
    (50 : Fin 78) (51 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (50 : Fin 78) (5 : Fin 13) (6 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (51 : Fin 78) (5 : Fin 13) (7 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2373` (row). -/
theorem middleSource_h2373 :
    ((!((rowBit (I.sourceRows) 0 5 6 && rowBit (I.sourceRows) 0 5 8)) || ((allOneRankAtom (sourceRanks P) 50 == allOneRankAtom (sourceRanks P) 52)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (5 : Fin 13)
    (6 : Fin 13) (8 : Fin 13)
    (50 : Fin 78) (52 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (50 : Fin 78) (5 : Fin 13) (6 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (52 : Fin 78) (5 : Fin 13) (8 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2374` (row). -/
theorem middleSource_h2374 :
    ((!((rowBit (I.sourceRows) 0 5 6 && rowBit (I.sourceRows) 0 5 9)) || ((allOneRankAtom (sourceRanks P) 50 == allOneRankAtom (sourceRanks P) 53)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (5 : Fin 13)
    (6 : Fin 13) (9 : Fin 13)
    (50 : Fin 78) (53 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (50 : Fin 78) (5 : Fin 13) (6 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (53 : Fin 78) (5 : Fin 13) (9 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2375` (row). -/
theorem middleSource_h2375 :
    ((!((rowBit (I.sourceRows) 0 5 6 && rowBit (I.sourceRows) 0 5 10)) || ((allOneRankAtom (sourceRanks P) 50 == allOneRankAtom (sourceRanks P) 54)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (5 : Fin 13)
    (6 : Fin 13) (10 : Fin 13)
    (50 : Fin 78) (54 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (50 : Fin 78) (5 : Fin 13) (6 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (54 : Fin 78) (5 : Fin 13) (10 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2376` (row). -/
theorem middleSource_h2376 :
    ((!((rowBit (I.sourceRows) 0 5 6 && rowBit (I.sourceRows) 0 5 11)) || ((allOneRankAtom (sourceRanks P) 50 == allOneRankAtom (sourceRanks P) 55)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (5 : Fin 13)
    (6 : Fin 13) (11 : Fin 13)
    (50 : Fin 78) (55 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (50 : Fin 78) (5 : Fin 13) (6 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (55 : Fin 78) (5 : Fin 13) (11 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2377` (row). -/
theorem middleSource_h2377 :
    ((!((rowBit (I.sourceRows) 0 5 6 && rowBit (I.sourceRows) 0 5 12)) || ((allOneRankAtom (sourceRanks P) 50 == allOneRankAtom (sourceRanks P) 56)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (5 : Fin 13)
    (6 : Fin 13) (12 : Fin 13)
    (50 : Fin 78) (56 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (50 : Fin 78) (5 : Fin 13) (6 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (56 : Fin 78) (5 : Fin 13) (12 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2378` (row). -/
theorem middleSource_h2378 :
    ((!((rowBit (I.sourceRows) 0 5 7 && rowBit (I.sourceRows) 0 5 8)) || ((allOneRankAtom (sourceRanks P) 51 == allOneRankAtom (sourceRanks P) 52)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (5 : Fin 13)
    (7 : Fin 13) (8 : Fin 13)
    (51 : Fin 78) (52 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (51 : Fin 78) (5 : Fin 13) (7 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (52 : Fin 78) (5 : Fin 13) (8 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2379` (row). -/
theorem middleSource_h2379 :
    ((!((rowBit (I.sourceRows) 0 5 7 && rowBit (I.sourceRows) 0 5 9)) || ((allOneRankAtom (sourceRanks P) 51 == allOneRankAtom (sourceRanks P) 53)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (5 : Fin 13)
    (7 : Fin 13) (9 : Fin 13)
    (51 : Fin 78) (53 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (51 : Fin 78) (5 : Fin 13) (7 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (53 : Fin 78) (5 : Fin 13) (9 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2380` (row). -/
theorem middleSource_h2380 :
    ((!((rowBit (I.sourceRows) 0 5 7 && rowBit (I.sourceRows) 0 5 10)) || ((allOneRankAtom (sourceRanks P) 51 == allOneRankAtom (sourceRanks P) 54)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (5 : Fin 13)
    (7 : Fin 13) (10 : Fin 13)
    (51 : Fin 78) (54 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (51 : Fin 78) (5 : Fin 13) (7 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (54 : Fin 78) (5 : Fin 13) (10 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2381` (row). -/
theorem middleSource_h2381 :
    ((!((rowBit (I.sourceRows) 0 5 7 && rowBit (I.sourceRows) 0 5 11)) || ((allOneRankAtom (sourceRanks P) 51 == allOneRankAtom (sourceRanks P) 55)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (5 : Fin 13)
    (7 : Fin 13) (11 : Fin 13)
    (51 : Fin 78) (55 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (51 : Fin 78) (5 : Fin 13) (7 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (55 : Fin 78) (5 : Fin 13) (11 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2382` (row). -/
theorem middleSource_h2382 :
    ((!((rowBit (I.sourceRows) 0 5 7 && rowBit (I.sourceRows) 0 5 12)) || ((allOneRankAtom (sourceRanks P) 51 == allOneRankAtom (sourceRanks P) 56)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (5 : Fin 13)
    (7 : Fin 13) (12 : Fin 13)
    (51 : Fin 78) (56 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (51 : Fin 78) (5 : Fin 13) (7 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (56 : Fin 78) (5 : Fin 13) (12 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2383` (row). -/
theorem middleSource_h2383 :
    ((!((rowBit (I.sourceRows) 0 5 8 && rowBit (I.sourceRows) 0 5 9)) || ((allOneRankAtom (sourceRanks P) 52 == allOneRankAtom (sourceRanks P) 53)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (5 : Fin 13)
    (8 : Fin 13) (9 : Fin 13)
    (52 : Fin 78) (53 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (52 : Fin 78) (5 : Fin 13) (8 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (53 : Fin 78) (5 : Fin 13) (9 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2384` (row). -/
theorem middleSource_h2384 :
    ((!((rowBit (I.sourceRows) 0 5 8 && rowBit (I.sourceRows) 0 5 10)) || ((allOneRankAtom (sourceRanks P) 52 == allOneRankAtom (sourceRanks P) 54)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (5 : Fin 13)
    (8 : Fin 13) (10 : Fin 13)
    (52 : Fin 78) (54 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (52 : Fin 78) (5 : Fin 13) (8 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (54 : Fin 78) (5 : Fin 13) (10 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2385` (row). -/
theorem middleSource_h2385 :
    ((!((rowBit (I.sourceRows) 0 5 8 && rowBit (I.sourceRows) 0 5 11)) || ((allOneRankAtom (sourceRanks P) 52 == allOneRankAtom (sourceRanks P) 55)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (5 : Fin 13)
    (8 : Fin 13) (11 : Fin 13)
    (52 : Fin 78) (55 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (52 : Fin 78) (5 : Fin 13) (8 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (55 : Fin 78) (5 : Fin 13) (11 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2386` (row). -/
theorem middleSource_h2386 :
    ((!((rowBit (I.sourceRows) 0 5 8 && rowBit (I.sourceRows) 0 5 12)) || ((allOneRankAtom (sourceRanks P) 52 == allOneRankAtom (sourceRanks P) 56)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (5 : Fin 13)
    (8 : Fin 13) (12 : Fin 13)
    (52 : Fin 78) (56 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (52 : Fin 78) (5 : Fin 13) (8 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (56 : Fin 78) (5 : Fin 13) (12 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2387` (row). -/
theorem middleSource_h2387 :
    ((!((rowBit (I.sourceRows) 0 5 9 && rowBit (I.sourceRows) 0 5 10)) || ((allOneRankAtom (sourceRanks P) 53 == allOneRankAtom (sourceRanks P) 54)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (5 : Fin 13)
    (9 : Fin 13) (10 : Fin 13)
    (53 : Fin 78) (54 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (53 : Fin 78) (5 : Fin 13) (9 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (54 : Fin 78) (5 : Fin 13) (10 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2388` (row). -/
theorem middleSource_h2388 :
    ((!((rowBit (I.sourceRows) 0 5 9 && rowBit (I.sourceRows) 0 5 11)) || ((allOneRankAtom (sourceRanks P) 53 == allOneRankAtom (sourceRanks P) 55)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (5 : Fin 13)
    (9 : Fin 13) (11 : Fin 13)
    (53 : Fin 78) (55 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (53 : Fin 78) (5 : Fin 13) (9 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (55 : Fin 78) (5 : Fin 13) (11 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2389` (row). -/
theorem middleSource_h2389 :
    ((!((rowBit (I.sourceRows) 0 5 9 && rowBit (I.sourceRows) 0 5 12)) || ((allOneRankAtom (sourceRanks P) 53 == allOneRankAtom (sourceRanks P) 56)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (5 : Fin 13)
    (9 : Fin 13) (12 : Fin 13)
    (53 : Fin 78) (56 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (53 : Fin 78) (5 : Fin 13) (9 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (56 : Fin 78) (5 : Fin 13) (12 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2390` (row). -/
theorem middleSource_h2390 :
    ((!((rowBit (I.sourceRows) 0 5 10 && rowBit (I.sourceRows) 0 5 11)) || ((allOneRankAtom (sourceRanks P) 54 == allOneRankAtom (sourceRanks P) 55)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (5 : Fin 13)
    (10 : Fin 13) (11 : Fin 13)
    (54 : Fin 78) (55 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (54 : Fin 78) (5 : Fin 13) (10 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (55 : Fin 78) (5 : Fin 13) (11 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2391` (row). -/
theorem middleSource_h2391 :
    ((!((rowBit (I.sourceRows) 0 5 10 && rowBit (I.sourceRows) 0 5 12)) || ((allOneRankAtom (sourceRanks P) 54 == allOneRankAtom (sourceRanks P) 56)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (5 : Fin 13)
    (10 : Fin 13) (12 : Fin 13)
    (54 : Fin 78) (56 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (54 : Fin 78) (5 : Fin 13) (10 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (56 : Fin 78) (5 : Fin 13) (12 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2392` (row). -/
theorem middleSource_h2392 :
    ((!((rowBit (I.sourceRows) 0 5 11 && rowBit (I.sourceRows) 0 5 12)) || ((allOneRankAtom (sourceRanks P) 55 == allOneRankAtom (sourceRanks P) 56)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (5 : Fin 13)
    (11 : Fin 13) (12 : Fin 13)
    (55 : Fin 78) (56 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (55 : Fin 78) (5 : Fin 13) (11 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (56 : Fin 78) (5 : Fin 13) (12 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2393` (row). -/
theorem middleSource_h2393 :
    ((!((rowBit (I.sourceRows) 0 6 0 && rowBit (I.sourceRows) 0 6 1)) || ((allOneRankAtom (sourceRanks P) 5 == allOneRankAtom (sourceRanks P) 16)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (6 : Fin 13)
    (0 : Fin 13) (1 : Fin 13)
    (5 : Fin 78) (16 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (5 : Fin 78) (6 : Fin 13) (0 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (16 : Fin 78) (6 : Fin 13) (1 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2394` (row). -/
theorem middleSource_h2394 :
    ((!((rowBit (I.sourceRows) 0 6 0 && rowBit (I.sourceRows) 0 6 2)) || ((allOneRankAtom (sourceRanks P) 5 == allOneRankAtom (sourceRanks P) 26)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (6 : Fin 13)
    (0 : Fin 13) (2 : Fin 13)
    (5 : Fin 78) (26 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (5 : Fin 78) (6 : Fin 13) (0 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (26 : Fin 78) (6 : Fin 13) (2 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2395` (row). -/
theorem middleSource_h2395 :
    ((!((rowBit (I.sourceRows) 0 6 0 && rowBit (I.sourceRows) 0 6 3)) || ((allOneRankAtom (sourceRanks P) 5 == allOneRankAtom (sourceRanks P) 35)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (6 : Fin 13)
    (0 : Fin 13) (3 : Fin 13)
    (5 : Fin 78) (35 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (5 : Fin 78) (6 : Fin 13) (0 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (35 : Fin 78) (6 : Fin 13) (3 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2396` (row). -/
theorem middleSource_h2396 :
    ((!((rowBit (I.sourceRows) 0 6 0 && rowBit (I.sourceRows) 0 6 4)) || ((allOneRankAtom (sourceRanks P) 5 == allOneRankAtom (sourceRanks P) 43)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (6 : Fin 13)
    (0 : Fin 13) (4 : Fin 13)
    (5 : Fin 78) (43 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (5 : Fin 78) (6 : Fin 13) (0 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (43 : Fin 78) (6 : Fin 13) (4 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2397` (row). -/
theorem middleSource_h2397 :
    ((!((rowBit (I.sourceRows) 0 6 0 && rowBit (I.sourceRows) 0 6 5)) || ((allOneRankAtom (sourceRanks P) 5 == allOneRankAtom (sourceRanks P) 50)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (6 : Fin 13)
    (0 : Fin 13) (5 : Fin 13)
    (5 : Fin 78) (50 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (5 : Fin 78) (6 : Fin 13) (0 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (50 : Fin 78) (6 : Fin 13) (5 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2398` (row). -/
theorem middleSource_h2398 :
    ((!((rowBit (I.sourceRows) 0 6 0 && rowBit (I.sourceRows) 0 6 7)) || ((allOneRankAtom (sourceRanks P) 5 == allOneRankAtom (sourceRanks P) 57)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (6 : Fin 13)
    (0 : Fin 13) (7 : Fin 13)
    (5 : Fin 78) (57 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (5 : Fin 78) (6 : Fin 13) (0 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (57 : Fin 78) (6 : Fin 13) (7 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2399` (row). -/
theorem middleSource_h2399 :
    ((!((rowBit (I.sourceRows) 0 6 0 && rowBit (I.sourceRows) 0 6 8)) || ((allOneRankAtom (sourceRanks P) 5 == allOneRankAtom (sourceRanks P) 58)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (6 : Fin 13)
    (0 : Fin 13) (8 : Fin 13)
    (5 : Fin 78) (58 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (5 : Fin 78) (6 : Fin 13) (0 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (58 : Fin 78) (6 : Fin 13) (8 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2400` (row). -/
theorem middleSource_h2400 :
    ((!((rowBit (I.sourceRows) 0 6 0 && rowBit (I.sourceRows) 0 6 9)) || ((allOneRankAtom (sourceRanks P) 5 == allOneRankAtom (sourceRanks P) 59)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (6 : Fin 13)
    (0 : Fin 13) (9 : Fin 13)
    (5 : Fin 78) (59 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (5 : Fin 78) (6 : Fin 13) (0 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (59 : Fin 78) (6 : Fin 13) (9 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2401` (row). -/
theorem middleSource_h2401 :
    ((!((rowBit (I.sourceRows) 0 6 0 && rowBit (I.sourceRows) 0 6 10)) || ((allOneRankAtom (sourceRanks P) 5 == allOneRankAtom (sourceRanks P) 60)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (6 : Fin 13)
    (0 : Fin 13) (10 : Fin 13)
    (5 : Fin 78) (60 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (5 : Fin 78) (6 : Fin 13) (0 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (60 : Fin 78) (6 : Fin 13) (10 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2402` (row). -/
theorem middleSource_h2402 :
    ((!((rowBit (I.sourceRows) 0 6 0 && rowBit (I.sourceRows) 0 6 11)) || ((allOneRankAtom (sourceRanks P) 5 == allOneRankAtom (sourceRanks P) 61)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (6 : Fin 13)
    (0 : Fin 13) (11 : Fin 13)
    (5 : Fin 78) (61 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (5 : Fin 78) (6 : Fin 13) (0 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (61 : Fin 78) (6 : Fin 13) (11 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2403` (row). -/
theorem middleSource_h2403 :
    ((!((rowBit (I.sourceRows) 0 6 0 && rowBit (I.sourceRows) 0 6 12)) || ((allOneRankAtom (sourceRanks P) 5 == allOneRankAtom (sourceRanks P) 62)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (6 : Fin 13)
    (0 : Fin 13) (12 : Fin 13)
    (5 : Fin 78) (62 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (5 : Fin 78) (6 : Fin 13) (0 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (62 : Fin 78) (6 : Fin 13) (12 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2404` (row). -/
theorem middleSource_h2404 :
    ((!((rowBit (I.sourceRows) 0 6 1 && rowBit (I.sourceRows) 0 6 2)) || ((allOneRankAtom (sourceRanks P) 16 == allOneRankAtom (sourceRanks P) 26)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (6 : Fin 13)
    (1 : Fin 13) (2 : Fin 13)
    (16 : Fin 78) (26 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (16 : Fin 78) (6 : Fin 13) (1 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (26 : Fin 78) (6 : Fin 13) (2 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2405` (row). -/
theorem middleSource_h2405 :
    ((!((rowBit (I.sourceRows) 0 6 1 && rowBit (I.sourceRows) 0 6 3)) || ((allOneRankAtom (sourceRanks P) 16 == allOneRankAtom (sourceRanks P) 35)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (6 : Fin 13)
    (1 : Fin 13) (3 : Fin 13)
    (16 : Fin 78) (35 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (16 : Fin 78) (6 : Fin 13) (1 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (35 : Fin 78) (6 : Fin 13) (3 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2406` (row). -/
theorem middleSource_h2406 :
    ((!((rowBit (I.sourceRows) 0 6 1 && rowBit (I.sourceRows) 0 6 4)) || ((allOneRankAtom (sourceRanks P) 16 == allOneRankAtom (sourceRanks P) 43)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (6 : Fin 13)
    (1 : Fin 13) (4 : Fin 13)
    (16 : Fin 78) (43 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (16 : Fin 78) (6 : Fin 13) (1 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (43 : Fin 78) (6 : Fin 13) (4 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2407` (row). -/
theorem middleSource_h2407 :
    ((!((rowBit (I.sourceRows) 0 6 1 && rowBit (I.sourceRows) 0 6 5)) || ((allOneRankAtom (sourceRanks P) 16 == allOneRankAtom (sourceRanks P) 50)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (6 : Fin 13)
    (1 : Fin 13) (5 : Fin 13)
    (16 : Fin 78) (50 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (16 : Fin 78) (6 : Fin 13) (1 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (50 : Fin 78) (6 : Fin 13) (5 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2408` (row). -/
theorem middleSource_h2408 :
    ((!((rowBit (I.sourceRows) 0 6 1 && rowBit (I.sourceRows) 0 6 7)) || ((allOneRankAtom (sourceRanks P) 16 == allOneRankAtom (sourceRanks P) 57)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (6 : Fin 13)
    (1 : Fin 13) (7 : Fin 13)
    (16 : Fin 78) (57 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (16 : Fin 78) (6 : Fin 13) (1 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (57 : Fin 78) (6 : Fin 13) (7 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2409` (row). -/
theorem middleSource_h2409 :
    ((!((rowBit (I.sourceRows) 0 6 1 && rowBit (I.sourceRows) 0 6 8)) || ((allOneRankAtom (sourceRanks P) 16 == allOneRankAtom (sourceRanks P) 58)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (6 : Fin 13)
    (1 : Fin 13) (8 : Fin 13)
    (16 : Fin 78) (58 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (16 : Fin 78) (6 : Fin 13) (1 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (58 : Fin 78) (6 : Fin 13) (8 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2410` (row). -/
theorem middleSource_h2410 :
    ((!((rowBit (I.sourceRows) 0 6 1 && rowBit (I.sourceRows) 0 6 9)) || ((allOneRankAtom (sourceRanks P) 16 == allOneRankAtom (sourceRanks P) 59)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (6 : Fin 13)
    (1 : Fin 13) (9 : Fin 13)
    (16 : Fin 78) (59 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (16 : Fin 78) (6 : Fin 13) (1 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (59 : Fin 78) (6 : Fin 13) (9 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2411` (row). -/
theorem middleSource_h2411 :
    ((!((rowBit (I.sourceRows) 0 6 1 && rowBit (I.sourceRows) 0 6 10)) || ((allOneRankAtom (sourceRanks P) 16 == allOneRankAtom (sourceRanks P) 60)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (6 : Fin 13)
    (1 : Fin 13) (10 : Fin 13)
    (16 : Fin 78) (60 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (16 : Fin 78) (6 : Fin 13) (1 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (60 : Fin 78) (6 : Fin 13) (10 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2412` (row). -/
theorem middleSource_h2412 :
    ((!((rowBit (I.sourceRows) 0 6 1 && rowBit (I.sourceRows) 0 6 11)) || ((allOneRankAtom (sourceRanks P) 16 == allOneRankAtom (sourceRanks P) 61)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (6 : Fin 13)
    (1 : Fin 13) (11 : Fin 13)
    (16 : Fin 78) (61 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (16 : Fin 78) (6 : Fin 13) (1 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (61 : Fin 78) (6 : Fin 13) (11 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2413` (row). -/
theorem middleSource_h2413 :
    ((!((rowBit (I.sourceRows) 0 6 1 && rowBit (I.sourceRows) 0 6 12)) || ((allOneRankAtom (sourceRanks P) 16 == allOneRankAtom (sourceRanks P) 62)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (6 : Fin 13)
    (1 : Fin 13) (12 : Fin 13)
    (16 : Fin 78) (62 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (16 : Fin 78) (6 : Fin 13) (1 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (62 : Fin 78) (6 : Fin 13) (12 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2414` (row). -/
theorem middleSource_h2414 :
    ((!((rowBit (I.sourceRows) 0 6 2 && rowBit (I.sourceRows) 0 6 3)) || ((allOneRankAtom (sourceRanks P) 26 == allOneRankAtom (sourceRanks P) 35)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (6 : Fin 13)
    (2 : Fin 13) (3 : Fin 13)
    (26 : Fin 78) (35 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (26 : Fin 78) (6 : Fin 13) (2 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (35 : Fin 78) (6 : Fin 13) (3 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2415` (row). -/
theorem middleSource_h2415 :
    ((!((rowBit (I.sourceRows) 0 6 2 && rowBit (I.sourceRows) 0 6 4)) || ((allOneRankAtom (sourceRanks P) 26 == allOneRankAtom (sourceRanks P) 43)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (6 : Fin 13)
    (2 : Fin 13) (4 : Fin 13)
    (26 : Fin 78) (43 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (26 : Fin 78) (6 : Fin 13) (2 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (43 : Fin 78) (6 : Fin 13) (4 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2416` (row). -/
theorem middleSource_h2416 :
    ((!((rowBit (I.sourceRows) 0 6 2 && rowBit (I.sourceRows) 0 6 5)) || ((allOneRankAtom (sourceRanks P) 26 == allOneRankAtom (sourceRanks P) 50)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (6 : Fin 13)
    (2 : Fin 13) (5 : Fin 13)
    (26 : Fin 78) (50 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (26 : Fin 78) (6 : Fin 13) (2 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (50 : Fin 78) (6 : Fin 13) (5 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2417` (row). -/
theorem middleSource_h2417 :
    ((!((rowBit (I.sourceRows) 0 6 2 && rowBit (I.sourceRows) 0 6 7)) || ((allOneRankAtom (sourceRanks P) 26 == allOneRankAtom (sourceRanks P) 57)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (6 : Fin 13)
    (2 : Fin 13) (7 : Fin 13)
    (26 : Fin 78) (57 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (26 : Fin 78) (6 : Fin 13) (2 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (57 : Fin 78) (6 : Fin 13) (7 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2418` (row). -/
theorem middleSource_h2418 :
    ((!((rowBit (I.sourceRows) 0 6 2 && rowBit (I.sourceRows) 0 6 8)) || ((allOneRankAtom (sourceRanks P) 26 == allOneRankAtom (sourceRanks P) 58)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (6 : Fin 13)
    (2 : Fin 13) (8 : Fin 13)
    (26 : Fin 78) (58 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (26 : Fin 78) (6 : Fin 13) (2 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (58 : Fin 78) (6 : Fin 13) (8 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2419` (row). -/
theorem middleSource_h2419 :
    ((!((rowBit (I.sourceRows) 0 6 2 && rowBit (I.sourceRows) 0 6 9)) || ((allOneRankAtom (sourceRanks P) 26 == allOneRankAtom (sourceRanks P) 59)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (6 : Fin 13)
    (2 : Fin 13) (9 : Fin 13)
    (26 : Fin 78) (59 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (26 : Fin 78) (6 : Fin 13) (2 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (59 : Fin 78) (6 : Fin 13) (9 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2420` (row). -/
theorem middleSource_h2420 :
    ((!((rowBit (I.sourceRows) 0 6 2 && rowBit (I.sourceRows) 0 6 10)) || ((allOneRankAtom (sourceRanks P) 26 == allOneRankAtom (sourceRanks P) 60)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (6 : Fin 13)
    (2 : Fin 13) (10 : Fin 13)
    (26 : Fin 78) (60 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (26 : Fin 78) (6 : Fin 13) (2 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (60 : Fin 78) (6 : Fin 13) (10 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2421` (row). -/
theorem middleSource_h2421 :
    ((!((rowBit (I.sourceRows) 0 6 2 && rowBit (I.sourceRows) 0 6 11)) || ((allOneRankAtom (sourceRanks P) 26 == allOneRankAtom (sourceRanks P) 61)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (6 : Fin 13)
    (2 : Fin 13) (11 : Fin 13)
    (26 : Fin 78) (61 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (26 : Fin 78) (6 : Fin 13) (2 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (61 : Fin 78) (6 : Fin 13) (11 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2422` (row). -/
theorem middleSource_h2422 :
    ((!((rowBit (I.sourceRows) 0 6 2 && rowBit (I.sourceRows) 0 6 12)) || ((allOneRankAtom (sourceRanks P) 26 == allOneRankAtom (sourceRanks P) 62)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (6 : Fin 13)
    (2 : Fin 13) (12 : Fin 13)
    (26 : Fin 78) (62 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (26 : Fin 78) (6 : Fin 13) (2 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (62 : Fin 78) (6 : Fin 13) (12 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2423` (row). -/
theorem middleSource_h2423 :
    ((!((rowBit (I.sourceRows) 0 6 3 && rowBit (I.sourceRows) 0 6 4)) || ((allOneRankAtom (sourceRanks P) 35 == allOneRankAtom (sourceRanks P) 43)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (6 : Fin 13)
    (3 : Fin 13) (4 : Fin 13)
    (35 : Fin 78) (43 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (35 : Fin 78) (6 : Fin 13) (3 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (43 : Fin 78) (6 : Fin 13) (4 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2424` (row). -/
theorem middleSource_h2424 :
    ((!((rowBit (I.sourceRows) 0 6 3 && rowBit (I.sourceRows) 0 6 5)) || ((allOneRankAtom (sourceRanks P) 35 == allOneRankAtom (sourceRanks P) 50)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (6 : Fin 13)
    (3 : Fin 13) (5 : Fin 13)
    (35 : Fin 78) (50 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (35 : Fin 78) (6 : Fin 13) (3 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (50 : Fin 78) (6 : Fin 13) (5 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2425` (row). -/
theorem middleSource_h2425 :
    ((!((rowBit (I.sourceRows) 0 6 3 && rowBit (I.sourceRows) 0 6 7)) || ((allOneRankAtom (sourceRanks P) 35 == allOneRankAtom (sourceRanks P) 57)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (6 : Fin 13)
    (3 : Fin 13) (7 : Fin 13)
    (35 : Fin 78) (57 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (35 : Fin 78) (6 : Fin 13) (3 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (57 : Fin 78) (6 : Fin 13) (7 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2426` (row). -/
theorem middleSource_h2426 :
    ((!((rowBit (I.sourceRows) 0 6 3 && rowBit (I.sourceRows) 0 6 8)) || ((allOneRankAtom (sourceRanks P) 35 == allOneRankAtom (sourceRanks P) 58)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (6 : Fin 13)
    (3 : Fin 13) (8 : Fin 13)
    (35 : Fin 78) (58 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (35 : Fin 78) (6 : Fin 13) (3 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (58 : Fin 78) (6 : Fin 13) (8 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2427` (row). -/
theorem middleSource_h2427 :
    ((!((rowBit (I.sourceRows) 0 6 3 && rowBit (I.sourceRows) 0 6 9)) || ((allOneRankAtom (sourceRanks P) 35 == allOneRankAtom (sourceRanks P) 59)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (6 : Fin 13)
    (3 : Fin 13) (9 : Fin 13)
    (35 : Fin 78) (59 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (35 : Fin 78) (6 : Fin 13) (3 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (59 : Fin 78) (6 : Fin 13) (9 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2428` (row). -/
theorem middleSource_h2428 :
    ((!((rowBit (I.sourceRows) 0 6 3 && rowBit (I.sourceRows) 0 6 10)) || ((allOneRankAtom (sourceRanks P) 35 == allOneRankAtom (sourceRanks P) 60)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (6 : Fin 13)
    (3 : Fin 13) (10 : Fin 13)
    (35 : Fin 78) (60 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (35 : Fin 78) (6 : Fin 13) (3 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (60 : Fin 78) (6 : Fin 13) (10 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2429` (row). -/
theorem middleSource_h2429 :
    ((!((rowBit (I.sourceRows) 0 6 3 && rowBit (I.sourceRows) 0 6 11)) || ((allOneRankAtom (sourceRanks P) 35 == allOneRankAtom (sourceRanks P) 61)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (6 : Fin 13)
    (3 : Fin 13) (11 : Fin 13)
    (35 : Fin 78) (61 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (35 : Fin 78) (6 : Fin 13) (3 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (61 : Fin 78) (6 : Fin 13) (11 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2430` (row). -/
theorem middleSource_h2430 :
    ((!((rowBit (I.sourceRows) 0 6 3 && rowBit (I.sourceRows) 0 6 12)) || ((allOneRankAtom (sourceRanks P) 35 == allOneRankAtom (sourceRanks P) 62)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (6 : Fin 13)
    (3 : Fin 13) (12 : Fin 13)
    (35 : Fin 78) (62 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (35 : Fin 78) (6 : Fin 13) (3 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (62 : Fin 78) (6 : Fin 13) (12 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2431` (row). -/
theorem middleSource_h2431 :
    ((!((rowBit (I.sourceRows) 0 6 4 && rowBit (I.sourceRows) 0 6 5)) || ((allOneRankAtom (sourceRanks P) 43 == allOneRankAtom (sourceRanks P) 50)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (6 : Fin 13)
    (4 : Fin 13) (5 : Fin 13)
    (43 : Fin 78) (50 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (43 : Fin 78) (6 : Fin 13) (4 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (50 : Fin 78) (6 : Fin 13) (5 : Fin 13) (by decide))

end

end ATailExactFiveCard13AllOneSourceIngressScratch
end Problem97
