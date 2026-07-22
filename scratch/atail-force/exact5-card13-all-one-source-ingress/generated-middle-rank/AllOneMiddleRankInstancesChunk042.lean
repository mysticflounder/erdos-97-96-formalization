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

/-- Candidate middle source assertion `h2688` (row). -/
theorem middleSource_h2688 :
    ((!((rowBit (I.sourceRows) 1 8 0 && rowBit (I.sourceRows) 1 8 6)) || ((allOneRankAtom (sourceRanks P) 7 == allOneRankAtom (sourceRanks P) 58)))) = true := by
  exact allOne_row_rank_guard I
    (1 : Fin 3) (8 : Fin 13)
    (0 : Fin 13) (6 : Fin 13)
    (7 : Fin 78) (58 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (7 : Fin 78) (8 : Fin 13) (0 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (58 : Fin 78) (8 : Fin 13) (6 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2689` (row). -/
theorem middleSource_h2689 :
    ((!((rowBit (I.sourceRows) 1 8 0 && rowBit (I.sourceRows) 1 8 7)) || ((allOneRankAtom (sourceRanks P) 7 == allOneRankAtom (sourceRanks P) 63)))) = true := by
  exact allOne_row_rank_guard I
    (1 : Fin 3) (8 : Fin 13)
    (0 : Fin 13) (7 : Fin 13)
    (7 : Fin 78) (63 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (7 : Fin 78) (8 : Fin 13) (0 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (63 : Fin 78) (8 : Fin 13) (7 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2690` (row). -/
theorem middleSource_h2690 :
    ((!((rowBit (I.sourceRows) 1 8 4 && rowBit (I.sourceRows) 1 8 10)) || ((allOneRankAtom (sourceRanks P) 45 == allOneRankAtom (sourceRanks P) 69)))) = true := by
  exact allOne_row_rank_guard I
    (1 : Fin 3) (8 : Fin 13)
    (4 : Fin 13) (10 : Fin 13)
    (45 : Fin 78) (69 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (45 : Fin 78) (8 : Fin 13) (4 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (69 : Fin 78) (8 : Fin 13) (10 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2691` (row). -/
theorem middleSource_h2691 :
    ((!((rowBit (I.sourceRows) 1 8 4 && rowBit (I.sourceRows) 1 8 12)) || ((allOneRankAtom (sourceRanks P) 45 == allOneRankAtom (sourceRanks P) 71)))) = true := by
  exact allOne_row_rank_guard I
    (1 : Fin 3) (8 : Fin 13)
    (4 : Fin 13) (12 : Fin 13)
    (45 : Fin 78) (71 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (45 : Fin 78) (8 : Fin 13) (4 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (71 : Fin 78) (8 : Fin 13) (12 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2692` (row). -/
theorem middleSource_h2692 :
    ((!((rowBit (I.sourceRows) 1 8 6 && rowBit (I.sourceRows) 1 8 9)) || ((allOneRankAtom (sourceRanks P) 58 == allOneRankAtom (sourceRanks P) 68)))) = true := by
  exact allOne_row_rank_guard I
    (1 : Fin 3) (8 : Fin 13)
    (6 : Fin 13) (9 : Fin 13)
    (58 : Fin 78) (68 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (58 : Fin 78) (8 : Fin 13) (6 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (68 : Fin 78) (8 : Fin 13) (9 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2693` (row). -/
theorem middleSource_h2693 :
    ((!((rowBit (I.sourceRows) 1 8 6 && rowBit (I.sourceRows) 1 8 10)) || ((allOneRankAtom (sourceRanks P) 58 == allOneRankAtom (sourceRanks P) 69)))) = true := by
  exact allOne_row_rank_guard I
    (1 : Fin 3) (8 : Fin 13)
    (6 : Fin 13) (10 : Fin 13)
    (58 : Fin 78) (69 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (58 : Fin 78) (8 : Fin 13) (6 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (69 : Fin 78) (8 : Fin 13) (10 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2694` (row). -/
theorem middleSource_h2694 :
    ((!((rowBit (I.sourceRows) 1 8 6 && rowBit (I.sourceRows) 1 8 11)) || ((allOneRankAtom (sourceRanks P) 58 == allOneRankAtom (sourceRanks P) 70)))) = true := by
  exact allOne_row_rank_guard I
    (1 : Fin 3) (8 : Fin 13)
    (6 : Fin 13) (11 : Fin 13)
    (58 : Fin 78) (70 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (58 : Fin 78) (8 : Fin 13) (6 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (70 : Fin 78) (8 : Fin 13) (11 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2695` (row). -/
theorem middleSource_h2695 :
    ((!((rowBit (I.sourceRows) 1 8 6 && rowBit (I.sourceRows) 1 8 12)) || ((allOneRankAtom (sourceRanks P) 58 == allOneRankAtom (sourceRanks P) 71)))) = true := by
  exact allOne_row_rank_guard I
    (1 : Fin 3) (8 : Fin 13)
    (6 : Fin 13) (12 : Fin 13)
    (58 : Fin 78) (71 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (58 : Fin 78) (8 : Fin 13) (6 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (71 : Fin 78) (8 : Fin 13) (12 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2696` (row). -/
theorem middleSource_h2696 :
    ((!((rowBit (I.sourceRows) 1 8 7 && rowBit (I.sourceRows) 1 8 10)) || ((allOneRankAtom (sourceRanks P) 63 == allOneRankAtom (sourceRanks P) 69)))) = true := by
  exact allOne_row_rank_guard I
    (1 : Fin 3) (8 : Fin 13)
    (7 : Fin 13) (10 : Fin 13)
    (63 : Fin 78) (69 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (63 : Fin 78) (8 : Fin 13) (7 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (69 : Fin 78) (8 : Fin 13) (10 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2697` (row). -/
theorem middleSource_h2697 :
    ((!((rowBit (I.sourceRows) 1 8 7 && rowBit (I.sourceRows) 1 8 11)) || ((allOneRankAtom (sourceRanks P) 63 == allOneRankAtom (sourceRanks P) 70)))) = true := by
  exact allOne_row_rank_guard I
    (1 : Fin 3) (8 : Fin 13)
    (7 : Fin 13) (11 : Fin 13)
    (63 : Fin 78) (70 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (63 : Fin 78) (8 : Fin 13) (7 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (70 : Fin 78) (8 : Fin 13) (11 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2698` (row). -/
theorem middleSource_h2698 :
    ((!((rowBit (I.sourceRows) 1 8 7 && rowBit (I.sourceRows) 1 8 12)) || ((allOneRankAtom (sourceRanks P) 63 == allOneRankAtom (sourceRanks P) 71)))) = true := by
  exact allOne_row_rank_guard I
    (1 : Fin 3) (8 : Fin 13)
    (7 : Fin 13) (12 : Fin 13)
    (63 : Fin 78) (71 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (63 : Fin 78) (8 : Fin 13) (7 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (71 : Fin 78) (8 : Fin 13) (12 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2699` (row). -/
theorem middleSource_h2699 :
    ((!((rowBit (I.sourceRows) 2 1 10 && rowBit (I.sourceRows) 2 1 11)) || ((allOneRankAtom (sourceRanks P) 20 == allOneRankAtom (sourceRanks P) 21)))) = true := by
  exact allOne_row_rank_guard I
    (2 : Fin 3) (1 : Fin 13)
    (10 : Fin 13) (11 : Fin 13)
    (20 : Fin 78) (21 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (20 : Fin 78) (1 : Fin 13) (10 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (21 : Fin 78) (1 : Fin 13) (11 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2700` (row). -/
theorem middleSource_h2700 :
    ((!((rowBit (I.sourceRows) 2 2 4 && rowBit (I.sourceRows) 2 2 5)) || ((allOneRankAtom (sourceRanks P) 24 == allOneRankAtom (sourceRanks P) 25)))) = true := by
  exact allOne_row_rank_guard I
    (2 : Fin 3) (2 : Fin 13)
    (4 : Fin 13) (5 : Fin 13)
    (24 : Fin 78) (25 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (24 : Fin 78) (2 : Fin 13) (4 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (25 : Fin 78) (2 : Fin 13) (5 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2701` (row). -/
theorem middleSource_h2701 :
    ((!((rowBit (I.sourceRows) 2 2 10 && rowBit (I.sourceRows) 2 2 11)) || ((allOneRankAtom (sourceRanks P) 30 == allOneRankAtom (sourceRanks P) 31)))) = true := by
  exact allOne_row_rank_guard I
    (2 : Fin 3) (2 : Fin 13)
    (10 : Fin 13) (11 : Fin 13)
    (30 : Fin 78) (31 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (30 : Fin 78) (2 : Fin 13) (10 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (31 : Fin 78) (2 : Fin 13) (11 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2702` (row). -/
theorem middleSource_h2702 :
    ((!((rowBit (I.sourceRows) 2 3 10 && rowBit (I.sourceRows) 2 3 11)) || ((allOneRankAtom (sourceRanks P) 39 == allOneRankAtom (sourceRanks P) 40)))) = true := by
  exact allOne_row_rank_guard I
    (2 : Fin 3) (3 : Fin 13)
    (10 : Fin 13) (11 : Fin 13)
    (39 : Fin 78) (40 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (39 : Fin 78) (3 : Fin 13) (10 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (40 : Fin 78) (3 : Fin 13) (11 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2703` (row). -/
theorem middleSource_h2703 :
    ((!((rowBit (I.sourceRows) 2 3 10 && rowBit (I.sourceRows) 2 3 12)) || ((allOneRankAtom (sourceRanks P) 39 == allOneRankAtom (sourceRanks P) 41)))) = true := by
  exact allOne_row_rank_guard I
    (2 : Fin 3) (3 : Fin 13)
    (10 : Fin 13) (12 : Fin 13)
    (39 : Fin 78) (41 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (39 : Fin 78) (3 : Fin 13) (10 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (41 : Fin 78) (3 : Fin 13) (12 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2704` (row). -/
theorem middleSource_h2704 :
    ((!((rowBit (I.sourceRows) 2 4 10 && rowBit (I.sourceRows) 2 4 11)) || ((allOneRankAtom (sourceRanks P) 47 == allOneRankAtom (sourceRanks P) 48)))) = true := by
  exact allOne_row_rank_guard I
    (2 : Fin 3) (4 : Fin 13)
    (10 : Fin 13) (11 : Fin 13)
    (47 : Fin 78) (48 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (47 : Fin 78) (4 : Fin 13) (10 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (48 : Fin 78) (4 : Fin 13) (11 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2705` (row). -/
theorem middleSource_h2705 :
    ((!((rowBit (I.sourceRows) 2 5 7 && rowBit (I.sourceRows) 2 5 8)) || ((allOneRankAtom (sourceRanks P) 51 == allOneRankAtom (sourceRanks P) 52)))) = true := by
  exact allOne_row_rank_guard I
    (2 : Fin 3) (5 : Fin 13)
    (7 : Fin 13) (8 : Fin 13)
    (51 : Fin 78) (52 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (51 : Fin 78) (5 : Fin 13) (7 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (52 : Fin 78) (5 : Fin 13) (8 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2706` (row). -/
theorem middleSource_h2706 :
    ((!((rowBit (I.sourceRows) 2 5 10 && rowBit (I.sourceRows) 2 5 11)) || ((allOneRankAtom (sourceRanks P) 54 == allOneRankAtom (sourceRanks P) 55)))) = true := by
  exact allOne_row_rank_guard I
    (2 : Fin 3) (5 : Fin 13)
    (10 : Fin 13) (11 : Fin 13)
    (54 : Fin 78) (55 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (54 : Fin 78) (5 : Fin 13) (10 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (55 : Fin 78) (5 : Fin 13) (11 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2707` (row). -/
theorem middleSource_h2707 :
    ((!((rowBit (I.sourceRows) 2 5 10 && rowBit (I.sourceRows) 2 5 12)) || ((allOneRankAtom (sourceRanks P) 54 == allOneRankAtom (sourceRanks P) 56)))) = true := by
  exact allOne_row_rank_guard I
    (2 : Fin 3) (5 : Fin 13)
    (10 : Fin 13) (12 : Fin 13)
    (54 : Fin 78) (56 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (54 : Fin 78) (5 : Fin 13) (10 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (56 : Fin 78) (5 : Fin 13) (12 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2708` (row). -/
theorem middleSource_h2708 :
    ((!((rowBit (I.sourceRows) 2 6 1 && rowBit (I.sourceRows) 2 6 4)) || ((allOneRankAtom (sourceRanks P) 16 == allOneRankAtom (sourceRanks P) 43)))) = true := by
  exact allOne_row_rank_guard I
    (2 : Fin 3) (6 : Fin 13)
    (1 : Fin 13) (4 : Fin 13)
    (16 : Fin 78) (43 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (16 : Fin 78) (6 : Fin 13) (1 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (43 : Fin 78) (6 : Fin 13) (4 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2709` (row). -/
theorem middleSource_h2709 :
    ((!((rowBit (I.sourceRows) 2 6 3 && rowBit (I.sourceRows) 2 6 4)) || ((allOneRankAtom (sourceRanks P) 35 == allOneRankAtom (sourceRanks P) 43)))) = true := by
  exact allOne_row_rank_guard I
    (2 : Fin 3) (6 : Fin 13)
    (3 : Fin 13) (4 : Fin 13)
    (35 : Fin 78) (43 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (35 : Fin 78) (6 : Fin 13) (3 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (43 : Fin 78) (6 : Fin 13) (4 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2710` (row). -/
theorem middleSource_h2710 :
    ((!((rowBit (I.sourceRows) 2 6 4 && rowBit (I.sourceRows) 2 6 5)) || ((allOneRankAtom (sourceRanks P) 43 == allOneRankAtom (sourceRanks P) 50)))) = true := by
  exact allOne_row_rank_guard I
    (2 : Fin 3) (6 : Fin 13)
    (4 : Fin 13) (5 : Fin 13)
    (43 : Fin 78) (50 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (43 : Fin 78) (6 : Fin 13) (4 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (50 : Fin 78) (6 : Fin 13) (5 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2711` (row). -/
theorem middleSource_h2711 :
    ((!((rowBit (I.sourceRows) 2 7 1 && rowBit (I.sourceRows) 2 7 4)) || ((allOneRankAtom (sourceRanks P) 17 == allOneRankAtom (sourceRanks P) 44)))) = true := by
  exact allOne_row_rank_guard I
    (2 : Fin 3) (7 : Fin 13)
    (1 : Fin 13) (4 : Fin 13)
    (17 : Fin 78) (44 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (17 : Fin 78) (7 : Fin 13) (1 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (44 : Fin 78) (7 : Fin 13) (4 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2712` (row). -/
theorem middleSource_h2712 :
    ((!((rowBit (I.sourceRows) 2 7 3 && rowBit (I.sourceRows) 2 7 4)) || ((allOneRankAtom (sourceRanks P) 36 == allOneRankAtom (sourceRanks P) 44)))) = true := by
  exact allOne_row_rank_guard I
    (2 : Fin 3) (7 : Fin 13)
    (3 : Fin 13) (4 : Fin 13)
    (36 : Fin 78) (44 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (36 : Fin 78) (7 : Fin 13) (3 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (44 : Fin 78) (7 : Fin 13) (4 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2713` (row). -/
theorem middleSource_h2713 :
    ((!((rowBit (I.sourceRows) 2 7 4 && rowBit (I.sourceRows) 2 7 5)) || ((allOneRankAtom (sourceRanks P) 44 == allOneRankAtom (sourceRanks P) 51)))) = true := by
  exact allOne_row_rank_guard I
    (2 : Fin 3) (7 : Fin 13)
    (4 : Fin 13) (5 : Fin 13)
    (44 : Fin 78) (51 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (44 : Fin 78) (7 : Fin 13) (4 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (51 : Fin 78) (7 : Fin 13) (5 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2714` (row). -/
theorem middleSource_h2714 :
    ((!((rowBit (I.sourceRows) 2 8 5 && rowBit (I.sourceRows) 2 8 10)) || ((allOneRankAtom (sourceRanks P) 52 == allOneRankAtom (sourceRanks P) 69)))) = true := by
  exact allOne_row_rank_guard I
    (2 : Fin 3) (8 : Fin 13)
    (5 : Fin 13) (10 : Fin 13)
    (52 : Fin 78) (69 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (52 : Fin 78) (8 : Fin 13) (5 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (69 : Fin 78) (8 : Fin 13) (10 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2715` (row). -/
theorem middleSource_h2715 :
    ((!((rowBit (I.sourceRows) 2 8 7 && rowBit (I.sourceRows) 2 8 9)) || ((allOneRankAtom (sourceRanks P) 63 == allOneRankAtom (sourceRanks P) 68)))) = true := by
  exact allOne_row_rank_guard I
    (2 : Fin 3) (8 : Fin 13)
    (7 : Fin 13) (9 : Fin 13)
    (63 : Fin 78) (68 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (63 : Fin 78) (8 : Fin 13) (7 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (68 : Fin 78) (8 : Fin 13) (9 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2716` (row). -/
theorem middleSource_h2716 :
    ((!((rowBit (I.sourceRows) 2 9 0 && rowBit (I.sourceRows) 2 9 1)) || ((allOneRankAtom (sourceRanks P) 8 == allOneRankAtom (sourceRanks P) 19)))) = true := by
  exact allOne_row_rank_guard I
    (2 : Fin 3) (9 : Fin 13)
    (0 : Fin 13) (1 : Fin 13)
    (8 : Fin 78) (19 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (8 : Fin 78) (9 : Fin 13) (0 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (19 : Fin 78) (9 : Fin 13) (1 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2717` (row). -/
theorem middleSource_h2717 :
    ((!((rowBit (I.sourceRows) 2 9 0 && rowBit (I.sourceRows) 2 9 2)) || ((allOneRankAtom (sourceRanks P) 8 == allOneRankAtom (sourceRanks P) 29)))) = true := by
  exact allOne_row_rank_guard I
    (2 : Fin 3) (9 : Fin 13)
    (0 : Fin 13) (2 : Fin 13)
    (8 : Fin 78) (29 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (8 : Fin 78) (9 : Fin 13) (0 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (29 : Fin 78) (9 : Fin 13) (2 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2718` (row). -/
theorem middleSource_h2718 :
    ((!((rowBit (I.sourceRows) 2 9 0 && rowBit (I.sourceRows) 2 9 3)) || ((allOneRankAtom (sourceRanks P) 8 == allOneRankAtom (sourceRanks P) 38)))) = true := by
  exact allOne_row_rank_guard I
    (2 : Fin 3) (9 : Fin 13)
    (0 : Fin 13) (3 : Fin 13)
    (8 : Fin 78) (38 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (8 : Fin 78) (9 : Fin 13) (0 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (38 : Fin 78) (9 : Fin 13) (3 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2719` (row). -/
theorem middleSource_h2719 :
    ((!((rowBit (I.sourceRows) 2 9 0 && rowBit (I.sourceRows) 2 9 4)) || ((allOneRankAtom (sourceRanks P) 8 == allOneRankAtom (sourceRanks P) 46)))) = true := by
  exact allOne_row_rank_guard I
    (2 : Fin 3) (9 : Fin 13)
    (0 : Fin 13) (4 : Fin 13)
    (8 : Fin 78) (46 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (8 : Fin 78) (9 : Fin 13) (0 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (46 : Fin 78) (9 : Fin 13) (4 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2720` (row). -/
theorem middleSource_h2720 :
    ((!((rowBit (I.sourceRows) 2 9 0 && rowBit (I.sourceRows) 2 9 5)) || ((allOneRankAtom (sourceRanks P) 8 == allOneRankAtom (sourceRanks P) 53)))) = true := by
  exact allOne_row_rank_guard I
    (2 : Fin 3) (9 : Fin 13)
    (0 : Fin 13) (5 : Fin 13)
    (8 : Fin 78) (53 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (8 : Fin 78) (9 : Fin 13) (0 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (53 : Fin 78) (9 : Fin 13) (5 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2721` (row). -/
theorem middleSource_h2721 :
    ((!((rowBit (I.sourceRows) 2 9 0 && rowBit (I.sourceRows) 2 9 6)) || ((allOneRankAtom (sourceRanks P) 8 == allOneRankAtom (sourceRanks P) 59)))) = true := by
  exact allOne_row_rank_guard I
    (2 : Fin 3) (9 : Fin 13)
    (0 : Fin 13) (6 : Fin 13)
    (8 : Fin 78) (59 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (8 : Fin 78) (9 : Fin 13) (0 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (59 : Fin 78) (9 : Fin 13) (6 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2722` (row). -/
theorem middleSource_h2722 :
    ((!((rowBit (I.sourceRows) 2 9 0 && rowBit (I.sourceRows) 2 9 7)) || ((allOneRankAtom (sourceRanks P) 8 == allOneRankAtom (sourceRanks P) 64)))) = true := by
  exact allOne_row_rank_guard I
    (2 : Fin 3) (9 : Fin 13)
    (0 : Fin 13) (7 : Fin 13)
    (8 : Fin 78) (64 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (8 : Fin 78) (9 : Fin 13) (0 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (64 : Fin 78) (9 : Fin 13) (7 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2723` (row). -/
theorem middleSource_h2723 :
    ((!((rowBit (I.sourceRows) 2 9 0 && rowBit (I.sourceRows) 2 9 8)) || ((allOneRankAtom (sourceRanks P) 8 == allOneRankAtom (sourceRanks P) 68)))) = true := by
  exact allOne_row_rank_guard I
    (2 : Fin 3) (9 : Fin 13)
    (0 : Fin 13) (8 : Fin 13)
    (8 : Fin 78) (68 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (8 : Fin 78) (9 : Fin 13) (0 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (68 : Fin 78) (9 : Fin 13) (8 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2724` (row). -/
theorem middleSource_h2724 :
    ((!((rowBit (I.sourceRows) 2 9 0 && rowBit (I.sourceRows) 2 9 10)) || ((allOneRankAtom (sourceRanks P) 8 == allOneRankAtom (sourceRanks P) 72)))) = true := by
  exact allOne_row_rank_guard I
    (2 : Fin 3) (9 : Fin 13)
    (0 : Fin 13) (10 : Fin 13)
    (8 : Fin 78) (72 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (8 : Fin 78) (9 : Fin 13) (0 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (72 : Fin 78) (9 : Fin 13) (10 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2725` (row). -/
theorem middleSource_h2725 :
    ((!((rowBit (I.sourceRows) 2 9 0 && rowBit (I.sourceRows) 2 9 11)) || ((allOneRankAtom (sourceRanks P) 8 == allOneRankAtom (sourceRanks P) 73)))) = true := by
  exact allOne_row_rank_guard I
    (2 : Fin 3) (9 : Fin 13)
    (0 : Fin 13) (11 : Fin 13)
    (8 : Fin 78) (73 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (8 : Fin 78) (9 : Fin 13) (0 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (73 : Fin 78) (9 : Fin 13) (11 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2726` (row). -/
theorem middleSource_h2726 :
    ((!((rowBit (I.sourceRows) 2 9 0 && rowBit (I.sourceRows) 2 9 12)) || ((allOneRankAtom (sourceRanks P) 8 == allOneRankAtom (sourceRanks P) 74)))) = true := by
  exact allOne_row_rank_guard I
    (2 : Fin 3) (9 : Fin 13)
    (0 : Fin 13) (12 : Fin 13)
    (8 : Fin 78) (74 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (8 : Fin 78) (9 : Fin 13) (0 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (74 : Fin 78) (9 : Fin 13) (12 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2727` (row). -/
theorem middleSource_h2727 :
    ((!((rowBit (I.sourceRows) 2 9 1 && rowBit (I.sourceRows) 2 9 2)) || ((allOneRankAtom (sourceRanks P) 19 == allOneRankAtom (sourceRanks P) 29)))) = true := by
  exact allOne_row_rank_guard I
    (2 : Fin 3) (9 : Fin 13)
    (1 : Fin 13) (2 : Fin 13)
    (19 : Fin 78) (29 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (19 : Fin 78) (9 : Fin 13) (1 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (29 : Fin 78) (9 : Fin 13) (2 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2728` (row). -/
theorem middleSource_h2728 :
    ((!((rowBit (I.sourceRows) 2 9 1 && rowBit (I.sourceRows) 2 9 3)) || ((allOneRankAtom (sourceRanks P) 19 == allOneRankAtom (sourceRanks P) 38)))) = true := by
  exact allOne_row_rank_guard I
    (2 : Fin 3) (9 : Fin 13)
    (1 : Fin 13) (3 : Fin 13)
    (19 : Fin 78) (38 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (19 : Fin 78) (9 : Fin 13) (1 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (38 : Fin 78) (9 : Fin 13) (3 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2729` (row). -/
theorem middleSource_h2729 :
    ((!((rowBit (I.sourceRows) 2 9 1 && rowBit (I.sourceRows) 2 9 4)) || ((allOneRankAtom (sourceRanks P) 19 == allOneRankAtom (sourceRanks P) 46)))) = true := by
  exact allOne_row_rank_guard I
    (2 : Fin 3) (9 : Fin 13)
    (1 : Fin 13) (4 : Fin 13)
    (19 : Fin 78) (46 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (19 : Fin 78) (9 : Fin 13) (1 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (46 : Fin 78) (9 : Fin 13) (4 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2730` (row). -/
theorem middleSource_h2730 :
    ((!((rowBit (I.sourceRows) 2 9 1 && rowBit (I.sourceRows) 2 9 5)) || ((allOneRankAtom (sourceRanks P) 19 == allOneRankAtom (sourceRanks P) 53)))) = true := by
  exact allOne_row_rank_guard I
    (2 : Fin 3) (9 : Fin 13)
    (1 : Fin 13) (5 : Fin 13)
    (19 : Fin 78) (53 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (19 : Fin 78) (9 : Fin 13) (1 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (53 : Fin 78) (9 : Fin 13) (5 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2731` (row). -/
theorem middleSource_h2731 :
    ((!((rowBit (I.sourceRows) 2 9 1 && rowBit (I.sourceRows) 2 9 6)) || ((allOneRankAtom (sourceRanks P) 19 == allOneRankAtom (sourceRanks P) 59)))) = true := by
  exact allOne_row_rank_guard I
    (2 : Fin 3) (9 : Fin 13)
    (1 : Fin 13) (6 : Fin 13)
    (19 : Fin 78) (59 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (19 : Fin 78) (9 : Fin 13) (1 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (59 : Fin 78) (9 : Fin 13) (6 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2732` (row). -/
theorem middleSource_h2732 :
    ((!((rowBit (I.sourceRows) 2 9 1 && rowBit (I.sourceRows) 2 9 7)) || ((allOneRankAtom (sourceRanks P) 19 == allOneRankAtom (sourceRanks P) 64)))) = true := by
  exact allOne_row_rank_guard I
    (2 : Fin 3) (9 : Fin 13)
    (1 : Fin 13) (7 : Fin 13)
    (19 : Fin 78) (64 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (19 : Fin 78) (9 : Fin 13) (1 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (64 : Fin 78) (9 : Fin 13) (7 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2733` (row). -/
theorem middleSource_h2733 :
    ((!((rowBit (I.sourceRows) 2 9 1 && rowBit (I.sourceRows) 2 9 8)) || ((allOneRankAtom (sourceRanks P) 19 == allOneRankAtom (sourceRanks P) 68)))) = true := by
  exact allOne_row_rank_guard I
    (2 : Fin 3) (9 : Fin 13)
    (1 : Fin 13) (8 : Fin 13)
    (19 : Fin 78) (68 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (19 : Fin 78) (9 : Fin 13) (1 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (68 : Fin 78) (9 : Fin 13) (8 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2734` (row). -/
theorem middleSource_h2734 :
    ((!((rowBit (I.sourceRows) 2 9 1 && rowBit (I.sourceRows) 2 9 10)) || ((allOneRankAtom (sourceRanks P) 19 == allOneRankAtom (sourceRanks P) 72)))) = true := by
  exact allOne_row_rank_guard I
    (2 : Fin 3) (9 : Fin 13)
    (1 : Fin 13) (10 : Fin 13)
    (19 : Fin 78) (72 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (19 : Fin 78) (9 : Fin 13) (1 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (72 : Fin 78) (9 : Fin 13) (10 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2735` (row). -/
theorem middleSource_h2735 :
    ((!((rowBit (I.sourceRows) 2 9 1 && rowBit (I.sourceRows) 2 9 11)) || ((allOneRankAtom (sourceRanks P) 19 == allOneRankAtom (sourceRanks P) 73)))) = true := by
  exact allOne_row_rank_guard I
    (2 : Fin 3) (9 : Fin 13)
    (1 : Fin 13) (11 : Fin 13)
    (19 : Fin 78) (73 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (19 : Fin 78) (9 : Fin 13) (1 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (73 : Fin 78) (9 : Fin 13) (11 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2736` (row). -/
theorem middleSource_h2736 :
    ((!((rowBit (I.sourceRows) 2 9 1 && rowBit (I.sourceRows) 2 9 12)) || ((allOneRankAtom (sourceRanks P) 19 == allOneRankAtom (sourceRanks P) 74)))) = true := by
  exact allOne_row_rank_guard I
    (2 : Fin 3) (9 : Fin 13)
    (1 : Fin 13) (12 : Fin 13)
    (19 : Fin 78) (74 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (19 : Fin 78) (9 : Fin 13) (1 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (74 : Fin 78) (9 : Fin 13) (12 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2737` (row). -/
theorem middleSource_h2737 :
    ((!((rowBit (I.sourceRows) 2 9 2 && rowBit (I.sourceRows) 2 9 4)) || ((allOneRankAtom (sourceRanks P) 29 == allOneRankAtom (sourceRanks P) 46)))) = true := by
  exact allOne_row_rank_guard I
    (2 : Fin 3) (9 : Fin 13)
    (2 : Fin 13) (4 : Fin 13)
    (29 : Fin 78) (46 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (29 : Fin 78) (9 : Fin 13) (2 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (46 : Fin 78) (9 : Fin 13) (4 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2738` (row). -/
theorem middleSource_h2738 :
    ((!((rowBit (I.sourceRows) 2 9 2 && rowBit (I.sourceRows) 2 9 5)) || ((allOneRankAtom (sourceRanks P) 29 == allOneRankAtom (sourceRanks P) 53)))) = true := by
  exact allOne_row_rank_guard I
    (2 : Fin 3) (9 : Fin 13)
    (2 : Fin 13) (5 : Fin 13)
    (29 : Fin 78) (53 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (29 : Fin 78) (9 : Fin 13) (2 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (53 : Fin 78) (9 : Fin 13) (5 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2739` (row). -/
theorem middleSource_h2739 :
    ((!((rowBit (I.sourceRows) 2 9 2 && rowBit (I.sourceRows) 2 9 6)) || ((allOneRankAtom (sourceRanks P) 29 == allOneRankAtom (sourceRanks P) 59)))) = true := by
  exact allOne_row_rank_guard I
    (2 : Fin 3) (9 : Fin 13)
    (2 : Fin 13) (6 : Fin 13)
    (29 : Fin 78) (59 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (29 : Fin 78) (9 : Fin 13) (2 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (59 : Fin 78) (9 : Fin 13) (6 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2740` (row). -/
theorem middleSource_h2740 :
    ((!((rowBit (I.sourceRows) 2 9 2 && rowBit (I.sourceRows) 2 9 7)) || ((allOneRankAtom (sourceRanks P) 29 == allOneRankAtom (sourceRanks P) 64)))) = true := by
  exact allOne_row_rank_guard I
    (2 : Fin 3) (9 : Fin 13)
    (2 : Fin 13) (7 : Fin 13)
    (29 : Fin 78) (64 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (29 : Fin 78) (9 : Fin 13) (2 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (64 : Fin 78) (9 : Fin 13) (7 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2741` (row). -/
theorem middleSource_h2741 :
    ((!((rowBit (I.sourceRows) 2 9 2 && rowBit (I.sourceRows) 2 9 8)) || ((allOneRankAtom (sourceRanks P) 29 == allOneRankAtom (sourceRanks P) 68)))) = true := by
  exact allOne_row_rank_guard I
    (2 : Fin 3) (9 : Fin 13)
    (2 : Fin 13) (8 : Fin 13)
    (29 : Fin 78) (68 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (29 : Fin 78) (9 : Fin 13) (2 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (68 : Fin 78) (9 : Fin 13) (8 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2742` (row). -/
theorem middleSource_h2742 :
    ((!((rowBit (I.sourceRows) 2 9 2 && rowBit (I.sourceRows) 2 9 10)) || ((allOneRankAtom (sourceRanks P) 29 == allOneRankAtom (sourceRanks P) 72)))) = true := by
  exact allOne_row_rank_guard I
    (2 : Fin 3) (9 : Fin 13)
    (2 : Fin 13) (10 : Fin 13)
    (29 : Fin 78) (72 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (29 : Fin 78) (9 : Fin 13) (2 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (72 : Fin 78) (9 : Fin 13) (10 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2743` (row). -/
theorem middleSource_h2743 :
    ((!((rowBit (I.sourceRows) 2 9 2 && rowBit (I.sourceRows) 2 9 11)) || ((allOneRankAtom (sourceRanks P) 29 == allOneRankAtom (sourceRanks P) 73)))) = true := by
  exact allOne_row_rank_guard I
    (2 : Fin 3) (9 : Fin 13)
    (2 : Fin 13) (11 : Fin 13)
    (29 : Fin 78) (73 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (29 : Fin 78) (9 : Fin 13) (2 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (73 : Fin 78) (9 : Fin 13) (11 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2744` (row). -/
theorem middleSource_h2744 :
    ((!((rowBit (I.sourceRows) 2 9 2 && rowBit (I.sourceRows) 2 9 12)) || ((allOneRankAtom (sourceRanks P) 29 == allOneRankAtom (sourceRanks P) 74)))) = true := by
  exact allOne_row_rank_guard I
    (2 : Fin 3) (9 : Fin 13)
    (2 : Fin 13) (12 : Fin 13)
    (29 : Fin 78) (74 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (29 : Fin 78) (9 : Fin 13) (2 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (74 : Fin 78) (9 : Fin 13) (12 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2745` (row). -/
theorem middleSource_h2745 :
    ((!((rowBit (I.sourceRows) 2 9 3 && rowBit (I.sourceRows) 2 9 4)) || ((allOneRankAtom (sourceRanks P) 38 == allOneRankAtom (sourceRanks P) 46)))) = true := by
  exact allOne_row_rank_guard I
    (2 : Fin 3) (9 : Fin 13)
    (3 : Fin 13) (4 : Fin 13)
    (38 : Fin 78) (46 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (38 : Fin 78) (9 : Fin 13) (3 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (46 : Fin 78) (9 : Fin 13) (4 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2746` (row). -/
theorem middleSource_h2746 :
    ((!((rowBit (I.sourceRows) 2 9 3 && rowBit (I.sourceRows) 2 9 5)) || ((allOneRankAtom (sourceRanks P) 38 == allOneRankAtom (sourceRanks P) 53)))) = true := by
  exact allOne_row_rank_guard I
    (2 : Fin 3) (9 : Fin 13)
    (3 : Fin 13) (5 : Fin 13)
    (38 : Fin 78) (53 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (38 : Fin 78) (9 : Fin 13) (3 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (53 : Fin 78) (9 : Fin 13) (5 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2747` (row). -/
theorem middleSource_h2747 :
    ((!((rowBit (I.sourceRows) 2 9 3 && rowBit (I.sourceRows) 2 9 6)) || ((allOneRankAtom (sourceRanks P) 38 == allOneRankAtom (sourceRanks P) 59)))) = true := by
  exact allOne_row_rank_guard I
    (2 : Fin 3) (9 : Fin 13)
    (3 : Fin 13) (6 : Fin 13)
    (38 : Fin 78) (59 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (38 : Fin 78) (9 : Fin 13) (3 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (59 : Fin 78) (9 : Fin 13) (6 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2748` (row). -/
theorem middleSource_h2748 :
    ((!((rowBit (I.sourceRows) 2 9 3 && rowBit (I.sourceRows) 2 9 7)) || ((allOneRankAtom (sourceRanks P) 38 == allOneRankAtom (sourceRanks P) 64)))) = true := by
  exact allOne_row_rank_guard I
    (2 : Fin 3) (9 : Fin 13)
    (3 : Fin 13) (7 : Fin 13)
    (38 : Fin 78) (64 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (38 : Fin 78) (9 : Fin 13) (3 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (64 : Fin 78) (9 : Fin 13) (7 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2749` (row). -/
theorem middleSource_h2749 :
    ((!((rowBit (I.sourceRows) 2 9 3 && rowBit (I.sourceRows) 2 9 8)) || ((allOneRankAtom (sourceRanks P) 38 == allOneRankAtom (sourceRanks P) 68)))) = true := by
  exact allOne_row_rank_guard I
    (2 : Fin 3) (9 : Fin 13)
    (3 : Fin 13) (8 : Fin 13)
    (38 : Fin 78) (68 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (38 : Fin 78) (9 : Fin 13) (3 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (68 : Fin 78) (9 : Fin 13) (8 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2750` (row). -/
theorem middleSource_h2750 :
    ((!((rowBit (I.sourceRows) 2 9 3 && rowBit (I.sourceRows) 2 9 10)) || ((allOneRankAtom (sourceRanks P) 38 == allOneRankAtom (sourceRanks P) 72)))) = true := by
  exact allOne_row_rank_guard I
    (2 : Fin 3) (9 : Fin 13)
    (3 : Fin 13) (10 : Fin 13)
    (38 : Fin 78) (72 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (38 : Fin 78) (9 : Fin 13) (3 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (72 : Fin 78) (9 : Fin 13) (10 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2751` (row). -/
theorem middleSource_h2751 :
    ((!((rowBit (I.sourceRows) 2 9 3 && rowBit (I.sourceRows) 2 9 11)) || ((allOneRankAtom (sourceRanks P) 38 == allOneRankAtom (sourceRanks P) 73)))) = true := by
  exact allOne_row_rank_guard I
    (2 : Fin 3) (9 : Fin 13)
    (3 : Fin 13) (11 : Fin 13)
    (38 : Fin 78) (73 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (38 : Fin 78) (9 : Fin 13) (3 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (73 : Fin 78) (9 : Fin 13) (11 : Fin 13) (by decide))

end

end ATailExactFiveCard13AllOneSourceIngressScratch
end Problem97
