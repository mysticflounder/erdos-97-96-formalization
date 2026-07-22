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

/-- Candidate middle source assertion `h2496` (row). -/
theorem middleSource_h2496 :
    ((!((rowBit (I.sourceRows) 0 7 4 && rowBit (I.sourceRows) 0 7 12)) || ((allOneRankAtom (sourceRanks P) 44 == allOneRankAtom (sourceRanks P) 67)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (7 : Fin 13)
    (4 : Fin 13) (12 : Fin 13)
    (44 : Fin 78) (67 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (44 : Fin 78) (7 : Fin 13) (4 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (67 : Fin 78) (7 : Fin 13) (12 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2497` (row). -/
theorem middleSource_h2497 :
    ((!((rowBit (I.sourceRows) 0 7 5 && rowBit (I.sourceRows) 0 7 6)) || ((allOneRankAtom (sourceRanks P) 51 == allOneRankAtom (sourceRanks P) 57)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (7 : Fin 13)
    (5 : Fin 13) (6 : Fin 13)
    (51 : Fin 78) (57 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (51 : Fin 78) (7 : Fin 13) (5 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (57 : Fin 78) (7 : Fin 13) (6 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2498` (row). -/
theorem middleSource_h2498 :
    ((!((rowBit (I.sourceRows) 0 7 5 && rowBit (I.sourceRows) 0 7 9)) || ((allOneRankAtom (sourceRanks P) 51 == allOneRankAtom (sourceRanks P) 64)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (7 : Fin 13)
    (5 : Fin 13) (9 : Fin 13)
    (51 : Fin 78) (64 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (51 : Fin 78) (7 : Fin 13) (5 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (64 : Fin 78) (7 : Fin 13) (9 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2499` (row). -/
theorem middleSource_h2499 :
    ((!((rowBit (I.sourceRows) 0 7 6 && rowBit (I.sourceRows) 0 7 8)) || ((allOneRankAtom (sourceRanks P) 57 == allOneRankAtom (sourceRanks P) 63)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (7 : Fin 13)
    (6 : Fin 13) (8 : Fin 13)
    (57 : Fin 78) (63 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (57 : Fin 78) (7 : Fin 13) (6 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (63 : Fin 78) (7 : Fin 13) (8 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2500` (row). -/
theorem middleSource_h2500 :
    ((!((rowBit (I.sourceRows) 0 7 8 && rowBit (I.sourceRows) 0 7 9)) || ((allOneRankAtom (sourceRanks P) 63 == allOneRankAtom (sourceRanks P) 64)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (7 : Fin 13)
    (8 : Fin 13) (9 : Fin 13)
    (63 : Fin 78) (64 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (63 : Fin 78) (7 : Fin 13) (8 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (64 : Fin 78) (7 : Fin 13) (9 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2501` (row). -/
theorem middleSource_h2501 :
    ((!((rowBit (I.sourceRows) 0 7 8 && rowBit (I.sourceRows) 0 7 10)) || ((allOneRankAtom (sourceRanks P) 63 == allOneRankAtom (sourceRanks P) 65)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (7 : Fin 13)
    (8 : Fin 13) (10 : Fin 13)
    (63 : Fin 78) (65 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (63 : Fin 78) (7 : Fin 13) (8 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (65 : Fin 78) (7 : Fin 13) (10 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2502` (row). -/
theorem middleSource_h2502 :
    ((!((rowBit (I.sourceRows) 0 7 8 && rowBit (I.sourceRows) 0 7 11)) || ((allOneRankAtom (sourceRanks P) 63 == allOneRankAtom (sourceRanks P) 66)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (7 : Fin 13)
    (8 : Fin 13) (11 : Fin 13)
    (63 : Fin 78) (66 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (63 : Fin 78) (7 : Fin 13) (8 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (66 : Fin 78) (7 : Fin 13) (11 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2503` (row). -/
theorem middleSource_h2503 :
    ((!((rowBit (I.sourceRows) 0 7 9 && rowBit (I.sourceRows) 0 7 10)) || ((allOneRankAtom (sourceRanks P) 64 == allOneRankAtom (sourceRanks P) 65)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (7 : Fin 13)
    (9 : Fin 13) (10 : Fin 13)
    (64 : Fin 78) (65 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (64 : Fin 78) (7 : Fin 13) (9 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (65 : Fin 78) (7 : Fin 13) (10 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2504` (row). -/
theorem middleSource_h2504 :
    ((!((rowBit (I.sourceRows) 0 7 9 && rowBit (I.sourceRows) 0 7 11)) || ((allOneRankAtom (sourceRanks P) 64 == allOneRankAtom (sourceRanks P) 66)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (7 : Fin 13)
    (9 : Fin 13) (11 : Fin 13)
    (64 : Fin 78) (66 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (64 : Fin 78) (7 : Fin 13) (9 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (66 : Fin 78) (7 : Fin 13) (11 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2505` (row). -/
theorem middleSource_h2505 :
    ((!((rowBit (I.sourceRows) 0 7 10 && rowBit (I.sourceRows) 0 7 11)) || ((allOneRankAtom (sourceRanks P) 65 == allOneRankAtom (sourceRanks P) 66)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (7 : Fin 13)
    (10 : Fin 13) (11 : Fin 13)
    (65 : Fin 78) (66 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (65 : Fin 78) (7 : Fin 13) (10 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (66 : Fin 78) (7 : Fin 13) (11 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2506` (row). -/
theorem middleSource_h2506 :
    ((!((rowBit (I.sourceRows) 0 7 10 && rowBit (I.sourceRows) 0 7 12)) || ((allOneRankAtom (sourceRanks P) 65 == allOneRankAtom (sourceRanks P) 67)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (7 : Fin 13)
    (10 : Fin 13) (12 : Fin 13)
    (65 : Fin 78) (67 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (65 : Fin 78) (7 : Fin 13) (10 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (67 : Fin 78) (7 : Fin 13) (12 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2507` (row). -/
theorem middleSource_h2507 :
    ((!((rowBit (I.sourceRows) 0 7 11 && rowBit (I.sourceRows) 0 7 12)) || ((allOneRankAtom (sourceRanks P) 66 == allOneRankAtom (sourceRanks P) 67)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (7 : Fin 13)
    (11 : Fin 13) (12 : Fin 13)
    (66 : Fin 78) (67 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (66 : Fin 78) (7 : Fin 13) (11 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (67 : Fin 78) (7 : Fin 13) (12 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2508` (row). -/
theorem middleSource_h2508 :
    ((!((rowBit (I.sourceRows) 0 9 2 && rowBit (I.sourceRows) 0 9 3)) || ((allOneRankAtom (sourceRanks P) 29 == allOneRankAtom (sourceRanks P) 38)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (9 : Fin 13)
    (2 : Fin 13) (3 : Fin 13)
    (29 : Fin 78) (38 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (29 : Fin 78) (9 : Fin 13) (2 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (38 : Fin 78) (9 : Fin 13) (3 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2509` (row). -/
theorem middleSource_h2509 :
    ((!((rowBit (I.sourceRows) 0 10 0 && rowBit (I.sourceRows) 0 10 1)) || ((allOneRankAtom (sourceRanks P) 9 == allOneRankAtom (sourceRanks P) 20)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (10 : Fin 13)
    (0 : Fin 13) (1 : Fin 13)
    (9 : Fin 78) (20 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (9 : Fin 78) (10 : Fin 13) (0 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (20 : Fin 78) (10 : Fin 13) (1 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2510` (row). -/
theorem middleSource_h2510 :
    ((!((rowBit (I.sourceRows) 0 10 0 && rowBit (I.sourceRows) 0 10 2)) || ((allOneRankAtom (sourceRanks P) 9 == allOneRankAtom (sourceRanks P) 30)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (10 : Fin 13)
    (0 : Fin 13) (2 : Fin 13)
    (9 : Fin 78) (30 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (9 : Fin 78) (10 : Fin 13) (0 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (30 : Fin 78) (10 : Fin 13) (2 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2511` (row). -/
theorem middleSource_h2511 :
    ((!((rowBit (I.sourceRows) 0 10 0 && rowBit (I.sourceRows) 0 10 3)) || ((allOneRankAtom (sourceRanks P) 9 == allOneRankAtom (sourceRanks P) 39)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (10 : Fin 13)
    (0 : Fin 13) (3 : Fin 13)
    (9 : Fin 78) (39 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (9 : Fin 78) (10 : Fin 13) (0 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (39 : Fin 78) (10 : Fin 13) (3 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2512` (row). -/
theorem middleSource_h2512 :
    ((!((rowBit (I.sourceRows) 0 10 0 && rowBit (I.sourceRows) 0 10 4)) || ((allOneRankAtom (sourceRanks P) 9 == allOneRankAtom (sourceRanks P) 47)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (10 : Fin 13)
    (0 : Fin 13) (4 : Fin 13)
    (9 : Fin 78) (47 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (9 : Fin 78) (10 : Fin 13) (0 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (47 : Fin 78) (10 : Fin 13) (4 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2513` (row). -/
theorem middleSource_h2513 :
    ((!((rowBit (I.sourceRows) 0 10 0 && rowBit (I.sourceRows) 0 10 5)) || ((allOneRankAtom (sourceRanks P) 9 == allOneRankAtom (sourceRanks P) 54)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (10 : Fin 13)
    (0 : Fin 13) (5 : Fin 13)
    (9 : Fin 78) (54 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (9 : Fin 78) (10 : Fin 13) (0 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (54 : Fin 78) (10 : Fin 13) (5 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2514` (row). -/
theorem middleSource_h2514 :
    ((!((rowBit (I.sourceRows) 0 10 0 && rowBit (I.sourceRows) 0 10 6)) || ((allOneRankAtom (sourceRanks P) 9 == allOneRankAtom (sourceRanks P) 60)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (10 : Fin 13)
    (0 : Fin 13) (6 : Fin 13)
    (9 : Fin 78) (60 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (9 : Fin 78) (10 : Fin 13) (0 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (60 : Fin 78) (10 : Fin 13) (6 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2515` (row). -/
theorem middleSource_h2515 :
    ((!((rowBit (I.sourceRows) 0 10 0 && rowBit (I.sourceRows) 0 10 7)) || ((allOneRankAtom (sourceRanks P) 9 == allOneRankAtom (sourceRanks P) 65)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (10 : Fin 13)
    (0 : Fin 13) (7 : Fin 13)
    (9 : Fin 78) (65 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (9 : Fin 78) (10 : Fin 13) (0 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (65 : Fin 78) (10 : Fin 13) (7 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2516` (row). -/
theorem middleSource_h2516 :
    ((!((rowBit (I.sourceRows) 0 10 0 && rowBit (I.sourceRows) 0 10 8)) || ((allOneRankAtom (sourceRanks P) 9 == allOneRankAtom (sourceRanks P) 69)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (10 : Fin 13)
    (0 : Fin 13) (8 : Fin 13)
    (9 : Fin 78) (69 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (9 : Fin 78) (10 : Fin 13) (0 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (69 : Fin 78) (10 : Fin 13) (8 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2517` (row). -/
theorem middleSource_h2517 :
    ((!((rowBit (I.sourceRows) 0 10 0 && rowBit (I.sourceRows) 0 10 9)) || ((allOneRankAtom (sourceRanks P) 9 == allOneRankAtom (sourceRanks P) 72)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (10 : Fin 13)
    (0 : Fin 13) (9 : Fin 13)
    (9 : Fin 78) (72 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (9 : Fin 78) (10 : Fin 13) (0 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (72 : Fin 78) (10 : Fin 13) (9 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2518` (row). -/
theorem middleSource_h2518 :
    ((!((rowBit (I.sourceRows) 0 10 0 && rowBit (I.sourceRows) 0 10 11)) || ((allOneRankAtom (sourceRanks P) 9 == allOneRankAtom (sourceRanks P) 75)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (10 : Fin 13)
    (0 : Fin 13) (11 : Fin 13)
    (9 : Fin 78) (75 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (9 : Fin 78) (10 : Fin 13) (0 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (75 : Fin 78) (10 : Fin 13) (11 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2519` (row). -/
theorem middleSource_h2519 :
    ((!((rowBit (I.sourceRows) 0 10 0 && rowBit (I.sourceRows) 0 10 12)) || ((allOneRankAtom (sourceRanks P) 9 == allOneRankAtom (sourceRanks P) 76)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (10 : Fin 13)
    (0 : Fin 13) (12 : Fin 13)
    (9 : Fin 78) (76 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (9 : Fin 78) (10 : Fin 13) (0 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (76 : Fin 78) (10 : Fin 13) (12 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2520` (row). -/
theorem middleSource_h2520 :
    ((!((rowBit (I.sourceRows) 0 10 1 && rowBit (I.sourceRows) 0 10 2)) || ((allOneRankAtom (sourceRanks P) 20 == allOneRankAtom (sourceRanks P) 30)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (10 : Fin 13)
    (1 : Fin 13) (2 : Fin 13)
    (20 : Fin 78) (30 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (20 : Fin 78) (10 : Fin 13) (1 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (30 : Fin 78) (10 : Fin 13) (2 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2521` (row). -/
theorem middleSource_h2521 :
    ((!((rowBit (I.sourceRows) 0 10 1 && rowBit (I.sourceRows) 0 10 3)) || ((allOneRankAtom (sourceRanks P) 20 == allOneRankAtom (sourceRanks P) 39)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (10 : Fin 13)
    (1 : Fin 13) (3 : Fin 13)
    (20 : Fin 78) (39 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (20 : Fin 78) (10 : Fin 13) (1 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (39 : Fin 78) (10 : Fin 13) (3 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2522` (row). -/
theorem middleSource_h2522 :
    ((!((rowBit (I.sourceRows) 0 10 1 && rowBit (I.sourceRows) 0 10 4)) || ((allOneRankAtom (sourceRanks P) 20 == allOneRankAtom (sourceRanks P) 47)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (10 : Fin 13)
    (1 : Fin 13) (4 : Fin 13)
    (20 : Fin 78) (47 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (20 : Fin 78) (10 : Fin 13) (1 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (47 : Fin 78) (10 : Fin 13) (4 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2523` (row). -/
theorem middleSource_h2523 :
    ((!((rowBit (I.sourceRows) 0 10 1 && rowBit (I.sourceRows) 0 10 5)) || ((allOneRankAtom (sourceRanks P) 20 == allOneRankAtom (sourceRanks P) 54)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (10 : Fin 13)
    (1 : Fin 13) (5 : Fin 13)
    (20 : Fin 78) (54 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (20 : Fin 78) (10 : Fin 13) (1 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (54 : Fin 78) (10 : Fin 13) (5 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2524` (row). -/
theorem middleSource_h2524 :
    ((!((rowBit (I.sourceRows) 0 10 1 && rowBit (I.sourceRows) 0 10 6)) || ((allOneRankAtom (sourceRanks P) 20 == allOneRankAtom (sourceRanks P) 60)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (10 : Fin 13)
    (1 : Fin 13) (6 : Fin 13)
    (20 : Fin 78) (60 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (20 : Fin 78) (10 : Fin 13) (1 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (60 : Fin 78) (10 : Fin 13) (6 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2525` (row). -/
theorem middleSource_h2525 :
    ((!((rowBit (I.sourceRows) 0 10 1 && rowBit (I.sourceRows) 0 10 7)) || ((allOneRankAtom (sourceRanks P) 20 == allOneRankAtom (sourceRanks P) 65)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (10 : Fin 13)
    (1 : Fin 13) (7 : Fin 13)
    (20 : Fin 78) (65 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (20 : Fin 78) (10 : Fin 13) (1 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (65 : Fin 78) (10 : Fin 13) (7 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2526` (row). -/
theorem middleSource_h2526 :
    ((!((rowBit (I.sourceRows) 0 10 1 && rowBit (I.sourceRows) 0 10 8)) || ((allOneRankAtom (sourceRanks P) 20 == allOneRankAtom (sourceRanks P) 69)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (10 : Fin 13)
    (1 : Fin 13) (8 : Fin 13)
    (20 : Fin 78) (69 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (20 : Fin 78) (10 : Fin 13) (1 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (69 : Fin 78) (10 : Fin 13) (8 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2527` (row). -/
theorem middleSource_h2527 :
    ((!((rowBit (I.sourceRows) 0 10 1 && rowBit (I.sourceRows) 0 10 9)) || ((allOneRankAtom (sourceRanks P) 20 == allOneRankAtom (sourceRanks P) 72)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (10 : Fin 13)
    (1 : Fin 13) (9 : Fin 13)
    (20 : Fin 78) (72 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (20 : Fin 78) (10 : Fin 13) (1 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (72 : Fin 78) (10 : Fin 13) (9 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2528` (row). -/
theorem middleSource_h2528 :
    ((!((rowBit (I.sourceRows) 0 10 1 && rowBit (I.sourceRows) 0 10 11)) || ((allOneRankAtom (sourceRanks P) 20 == allOneRankAtom (sourceRanks P) 75)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (10 : Fin 13)
    (1 : Fin 13) (11 : Fin 13)
    (20 : Fin 78) (75 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (20 : Fin 78) (10 : Fin 13) (1 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (75 : Fin 78) (10 : Fin 13) (11 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2529` (row). -/
theorem middleSource_h2529 :
    ((!((rowBit (I.sourceRows) 0 10 1 && rowBit (I.sourceRows) 0 10 12)) || ((allOneRankAtom (sourceRanks P) 20 == allOneRankAtom (sourceRanks P) 76)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (10 : Fin 13)
    (1 : Fin 13) (12 : Fin 13)
    (20 : Fin 78) (76 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (20 : Fin 78) (10 : Fin 13) (1 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (76 : Fin 78) (10 : Fin 13) (12 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2530` (row). -/
theorem middleSource_h2530 :
    ((!((rowBit (I.sourceRows) 0 10 2 && rowBit (I.sourceRows) 0 10 3)) || ((allOneRankAtom (sourceRanks P) 30 == allOneRankAtom (sourceRanks P) 39)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (10 : Fin 13)
    (2 : Fin 13) (3 : Fin 13)
    (30 : Fin 78) (39 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (30 : Fin 78) (10 : Fin 13) (2 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (39 : Fin 78) (10 : Fin 13) (3 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2531` (row). -/
theorem middleSource_h2531 :
    ((!((rowBit (I.sourceRows) 0 10 2 && rowBit (I.sourceRows) 0 10 4)) || ((allOneRankAtom (sourceRanks P) 30 == allOneRankAtom (sourceRanks P) 47)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (10 : Fin 13)
    (2 : Fin 13) (4 : Fin 13)
    (30 : Fin 78) (47 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (30 : Fin 78) (10 : Fin 13) (2 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (47 : Fin 78) (10 : Fin 13) (4 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2532` (row). -/
theorem middleSource_h2532 :
    ((!((rowBit (I.sourceRows) 0 10 2 && rowBit (I.sourceRows) 0 10 5)) || ((allOneRankAtom (sourceRanks P) 30 == allOneRankAtom (sourceRanks P) 54)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (10 : Fin 13)
    (2 : Fin 13) (5 : Fin 13)
    (30 : Fin 78) (54 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (30 : Fin 78) (10 : Fin 13) (2 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (54 : Fin 78) (10 : Fin 13) (5 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2533` (row). -/
theorem middleSource_h2533 :
    ((!((rowBit (I.sourceRows) 0 10 2 && rowBit (I.sourceRows) 0 10 6)) || ((allOneRankAtom (sourceRanks P) 30 == allOneRankAtom (sourceRanks P) 60)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (10 : Fin 13)
    (2 : Fin 13) (6 : Fin 13)
    (30 : Fin 78) (60 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (30 : Fin 78) (10 : Fin 13) (2 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (60 : Fin 78) (10 : Fin 13) (6 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2534` (row). -/
theorem middleSource_h2534 :
    ((!((rowBit (I.sourceRows) 0 10 2 && rowBit (I.sourceRows) 0 10 7)) || ((allOneRankAtom (sourceRanks P) 30 == allOneRankAtom (sourceRanks P) 65)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (10 : Fin 13)
    (2 : Fin 13) (7 : Fin 13)
    (30 : Fin 78) (65 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (30 : Fin 78) (10 : Fin 13) (2 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (65 : Fin 78) (10 : Fin 13) (7 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2535` (row). -/
theorem middleSource_h2535 :
    ((!((rowBit (I.sourceRows) 0 10 2 && rowBit (I.sourceRows) 0 10 8)) || ((allOneRankAtom (sourceRanks P) 30 == allOneRankAtom (sourceRanks P) 69)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (10 : Fin 13)
    (2 : Fin 13) (8 : Fin 13)
    (30 : Fin 78) (69 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (30 : Fin 78) (10 : Fin 13) (2 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (69 : Fin 78) (10 : Fin 13) (8 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2536` (row). -/
theorem middleSource_h2536 :
    ((!((rowBit (I.sourceRows) 0 10 2 && rowBit (I.sourceRows) 0 10 9)) || ((allOneRankAtom (sourceRanks P) 30 == allOneRankAtom (sourceRanks P) 72)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (10 : Fin 13)
    (2 : Fin 13) (9 : Fin 13)
    (30 : Fin 78) (72 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (30 : Fin 78) (10 : Fin 13) (2 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (72 : Fin 78) (10 : Fin 13) (9 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2537` (row). -/
theorem middleSource_h2537 :
    ((!((rowBit (I.sourceRows) 0 10 2 && rowBit (I.sourceRows) 0 10 11)) || ((allOneRankAtom (sourceRanks P) 30 == allOneRankAtom (sourceRanks P) 75)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (10 : Fin 13)
    (2 : Fin 13) (11 : Fin 13)
    (30 : Fin 78) (75 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (30 : Fin 78) (10 : Fin 13) (2 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (75 : Fin 78) (10 : Fin 13) (11 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2538` (row). -/
theorem middleSource_h2538 :
    ((!((rowBit (I.sourceRows) 0 10 2 && rowBit (I.sourceRows) 0 10 12)) || ((allOneRankAtom (sourceRanks P) 30 == allOneRankAtom (sourceRanks P) 76)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (10 : Fin 13)
    (2 : Fin 13) (12 : Fin 13)
    (30 : Fin 78) (76 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (30 : Fin 78) (10 : Fin 13) (2 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (76 : Fin 78) (10 : Fin 13) (12 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2539` (row). -/
theorem middleSource_h2539 :
    ((!((rowBit (I.sourceRows) 0 10 3 && rowBit (I.sourceRows) 0 10 4)) || ((allOneRankAtom (sourceRanks P) 39 == allOneRankAtom (sourceRanks P) 47)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (10 : Fin 13)
    (3 : Fin 13) (4 : Fin 13)
    (39 : Fin 78) (47 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (39 : Fin 78) (10 : Fin 13) (3 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (47 : Fin 78) (10 : Fin 13) (4 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2540` (row). -/
theorem middleSource_h2540 :
    ((!((rowBit (I.sourceRows) 0 10 3 && rowBit (I.sourceRows) 0 10 5)) || ((allOneRankAtom (sourceRanks P) 39 == allOneRankAtom (sourceRanks P) 54)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (10 : Fin 13)
    (3 : Fin 13) (5 : Fin 13)
    (39 : Fin 78) (54 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (39 : Fin 78) (10 : Fin 13) (3 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (54 : Fin 78) (10 : Fin 13) (5 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2541` (row). -/
theorem middleSource_h2541 :
    ((!((rowBit (I.sourceRows) 0 10 3 && rowBit (I.sourceRows) 0 10 6)) || ((allOneRankAtom (sourceRanks P) 39 == allOneRankAtom (sourceRanks P) 60)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (10 : Fin 13)
    (3 : Fin 13) (6 : Fin 13)
    (39 : Fin 78) (60 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (39 : Fin 78) (10 : Fin 13) (3 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (60 : Fin 78) (10 : Fin 13) (6 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2542` (row). -/
theorem middleSource_h2542 :
    ((!((rowBit (I.sourceRows) 0 10 3 && rowBit (I.sourceRows) 0 10 7)) || ((allOneRankAtom (sourceRanks P) 39 == allOneRankAtom (sourceRanks P) 65)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (10 : Fin 13)
    (3 : Fin 13) (7 : Fin 13)
    (39 : Fin 78) (65 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (39 : Fin 78) (10 : Fin 13) (3 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (65 : Fin 78) (10 : Fin 13) (7 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2543` (row). -/
theorem middleSource_h2543 :
    ((!((rowBit (I.sourceRows) 0 10 3 && rowBit (I.sourceRows) 0 10 8)) || ((allOneRankAtom (sourceRanks P) 39 == allOneRankAtom (sourceRanks P) 69)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (10 : Fin 13)
    (3 : Fin 13) (8 : Fin 13)
    (39 : Fin 78) (69 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (39 : Fin 78) (10 : Fin 13) (3 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (69 : Fin 78) (10 : Fin 13) (8 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2544` (row). -/
theorem middleSource_h2544 :
    ((!((rowBit (I.sourceRows) 0 10 3 && rowBit (I.sourceRows) 0 10 9)) || ((allOneRankAtom (sourceRanks P) 39 == allOneRankAtom (sourceRanks P) 72)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (10 : Fin 13)
    (3 : Fin 13) (9 : Fin 13)
    (39 : Fin 78) (72 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (39 : Fin 78) (10 : Fin 13) (3 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (72 : Fin 78) (10 : Fin 13) (9 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2545` (row). -/
theorem middleSource_h2545 :
    ((!((rowBit (I.sourceRows) 0 10 3 && rowBit (I.sourceRows) 0 10 11)) || ((allOneRankAtom (sourceRanks P) 39 == allOneRankAtom (sourceRanks P) 75)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (10 : Fin 13)
    (3 : Fin 13) (11 : Fin 13)
    (39 : Fin 78) (75 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (39 : Fin 78) (10 : Fin 13) (3 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (75 : Fin 78) (10 : Fin 13) (11 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2546` (row). -/
theorem middleSource_h2546 :
    ((!((rowBit (I.sourceRows) 0 10 3 && rowBit (I.sourceRows) 0 10 12)) || ((allOneRankAtom (sourceRanks P) 39 == allOneRankAtom (sourceRanks P) 76)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (10 : Fin 13)
    (3 : Fin 13) (12 : Fin 13)
    (39 : Fin 78) (76 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (39 : Fin 78) (10 : Fin 13) (3 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (76 : Fin 78) (10 : Fin 13) (12 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2547` (row). -/
theorem middleSource_h2547 :
    ((!((rowBit (I.sourceRows) 0 10 4 && rowBit (I.sourceRows) 0 10 5)) || ((allOneRankAtom (sourceRanks P) 47 == allOneRankAtom (sourceRanks P) 54)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (10 : Fin 13)
    (4 : Fin 13) (5 : Fin 13)
    (47 : Fin 78) (54 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (47 : Fin 78) (10 : Fin 13) (4 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (54 : Fin 78) (10 : Fin 13) (5 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2548` (row). -/
theorem middleSource_h2548 :
    ((!((rowBit (I.sourceRows) 0 10 4 && rowBit (I.sourceRows) 0 10 6)) || ((allOneRankAtom (sourceRanks P) 47 == allOneRankAtom (sourceRanks P) 60)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (10 : Fin 13)
    (4 : Fin 13) (6 : Fin 13)
    (47 : Fin 78) (60 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (47 : Fin 78) (10 : Fin 13) (4 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (60 : Fin 78) (10 : Fin 13) (6 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2549` (row). -/
theorem middleSource_h2549 :
    ((!((rowBit (I.sourceRows) 0 10 4 && rowBit (I.sourceRows) 0 10 7)) || ((allOneRankAtom (sourceRanks P) 47 == allOneRankAtom (sourceRanks P) 65)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (10 : Fin 13)
    (4 : Fin 13) (7 : Fin 13)
    (47 : Fin 78) (65 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (47 : Fin 78) (10 : Fin 13) (4 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (65 : Fin 78) (10 : Fin 13) (7 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2550` (row). -/
theorem middleSource_h2550 :
    ((!((rowBit (I.sourceRows) 0 10 4 && rowBit (I.sourceRows) 0 10 8)) || ((allOneRankAtom (sourceRanks P) 47 == allOneRankAtom (sourceRanks P) 69)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (10 : Fin 13)
    (4 : Fin 13) (8 : Fin 13)
    (47 : Fin 78) (69 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (47 : Fin 78) (10 : Fin 13) (4 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (69 : Fin 78) (10 : Fin 13) (8 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2551` (row). -/
theorem middleSource_h2551 :
    ((!((rowBit (I.sourceRows) 0 10 4 && rowBit (I.sourceRows) 0 10 9)) || ((allOneRankAtom (sourceRanks P) 47 == allOneRankAtom (sourceRanks P) 72)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (10 : Fin 13)
    (4 : Fin 13) (9 : Fin 13)
    (47 : Fin 78) (72 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (47 : Fin 78) (10 : Fin 13) (4 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (72 : Fin 78) (10 : Fin 13) (9 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2552` (row). -/
theorem middleSource_h2552 :
    ((!((rowBit (I.sourceRows) 0 10 4 && rowBit (I.sourceRows) 0 10 11)) || ((allOneRankAtom (sourceRanks P) 47 == allOneRankAtom (sourceRanks P) 75)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (10 : Fin 13)
    (4 : Fin 13) (11 : Fin 13)
    (47 : Fin 78) (75 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (47 : Fin 78) (10 : Fin 13) (4 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (75 : Fin 78) (10 : Fin 13) (11 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2553` (row). -/
theorem middleSource_h2553 :
    ((!((rowBit (I.sourceRows) 0 10 4 && rowBit (I.sourceRows) 0 10 12)) || ((allOneRankAtom (sourceRanks P) 47 == allOneRankAtom (sourceRanks P) 76)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (10 : Fin 13)
    (4 : Fin 13) (12 : Fin 13)
    (47 : Fin 78) (76 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (47 : Fin 78) (10 : Fin 13) (4 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (76 : Fin 78) (10 : Fin 13) (12 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2554` (row). -/
theorem middleSource_h2554 :
    ((!((rowBit (I.sourceRows) 0 10 5 && rowBit (I.sourceRows) 0 10 6)) || ((allOneRankAtom (sourceRanks P) 54 == allOneRankAtom (sourceRanks P) 60)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (10 : Fin 13)
    (5 : Fin 13) (6 : Fin 13)
    (54 : Fin 78) (60 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (54 : Fin 78) (10 : Fin 13) (5 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (60 : Fin 78) (10 : Fin 13) (6 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2555` (row). -/
theorem middleSource_h2555 :
    ((!((rowBit (I.sourceRows) 0 10 5 && rowBit (I.sourceRows) 0 10 7)) || ((allOneRankAtom (sourceRanks P) 54 == allOneRankAtom (sourceRanks P) 65)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (10 : Fin 13)
    (5 : Fin 13) (7 : Fin 13)
    (54 : Fin 78) (65 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (54 : Fin 78) (10 : Fin 13) (5 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (65 : Fin 78) (10 : Fin 13) (7 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2556` (row). -/
theorem middleSource_h2556 :
    ((!((rowBit (I.sourceRows) 0 10 5 && rowBit (I.sourceRows) 0 10 8)) || ((allOneRankAtom (sourceRanks P) 54 == allOneRankAtom (sourceRanks P) 69)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (10 : Fin 13)
    (5 : Fin 13) (8 : Fin 13)
    (54 : Fin 78) (69 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (54 : Fin 78) (10 : Fin 13) (5 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (69 : Fin 78) (10 : Fin 13) (8 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2557` (row). -/
theorem middleSource_h2557 :
    ((!((rowBit (I.sourceRows) 0 10 5 && rowBit (I.sourceRows) 0 10 9)) || ((allOneRankAtom (sourceRanks P) 54 == allOneRankAtom (sourceRanks P) 72)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (10 : Fin 13)
    (5 : Fin 13) (9 : Fin 13)
    (54 : Fin 78) (72 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (54 : Fin 78) (10 : Fin 13) (5 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (72 : Fin 78) (10 : Fin 13) (9 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2558` (row). -/
theorem middleSource_h2558 :
    ((!((rowBit (I.sourceRows) 0 10 5 && rowBit (I.sourceRows) 0 10 11)) || ((allOneRankAtom (sourceRanks P) 54 == allOneRankAtom (sourceRanks P) 75)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (10 : Fin 13)
    (5 : Fin 13) (11 : Fin 13)
    (54 : Fin 78) (75 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (54 : Fin 78) (10 : Fin 13) (5 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (75 : Fin 78) (10 : Fin 13) (11 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2559` (row). -/
theorem middleSource_h2559 :
    ((!((rowBit (I.sourceRows) 0 10 5 && rowBit (I.sourceRows) 0 10 12)) || ((allOneRankAtom (sourceRanks P) 54 == allOneRankAtom (sourceRanks P) 76)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (10 : Fin 13)
    (5 : Fin 13) (12 : Fin 13)
    (54 : Fin 78) (76 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (54 : Fin 78) (10 : Fin 13) (5 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (76 : Fin 78) (10 : Fin 13) (12 : Fin 13) (by decide))

end

end ATailExactFiveCard13AllOneSourceIngressScratch
end Problem97
