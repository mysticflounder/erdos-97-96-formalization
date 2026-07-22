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

/-- Candidate middle source assertion `h2112` (row). -/
theorem middleSource_h2112 :
    ((!((rowBit (I.sourceRows) 0 1 4 && rowBit (I.sourceRows) 0 1 9)) || ((allOneRankAtom (sourceRanks P) 14 == allOneRankAtom (sourceRanks P) 19)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (1 : Fin 13)
    (4 : Fin 13) (9 : Fin 13)
    (14 : Fin 78) (19 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (14 : Fin 78) (1 : Fin 13) (4 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (19 : Fin 78) (1 : Fin 13) (9 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2113` (row). -/
theorem middleSource_h2113 :
    ((!((rowBit (I.sourceRows) 0 1 4 && rowBit (I.sourceRows) 0 1 10)) || ((allOneRankAtom (sourceRanks P) 14 == allOneRankAtom (sourceRanks P) 20)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (1 : Fin 13)
    (4 : Fin 13) (10 : Fin 13)
    (14 : Fin 78) (20 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (14 : Fin 78) (1 : Fin 13) (4 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (20 : Fin 78) (1 : Fin 13) (10 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2114` (row). -/
theorem middleSource_h2114 :
    ((!((rowBit (I.sourceRows) 0 1 4 && rowBit (I.sourceRows) 0 1 11)) || ((allOneRankAtom (sourceRanks P) 14 == allOneRankAtom (sourceRanks P) 21)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (1 : Fin 13)
    (4 : Fin 13) (11 : Fin 13)
    (14 : Fin 78) (21 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (14 : Fin 78) (1 : Fin 13) (4 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (21 : Fin 78) (1 : Fin 13) (11 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2115` (row). -/
theorem middleSource_h2115 :
    ((!((rowBit (I.sourceRows) 0 1 4 && rowBit (I.sourceRows) 0 1 12)) || ((allOneRankAtom (sourceRanks P) 14 == allOneRankAtom (sourceRanks P) 22)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (1 : Fin 13)
    (4 : Fin 13) (12 : Fin 13)
    (14 : Fin 78) (22 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (14 : Fin 78) (1 : Fin 13) (4 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (22 : Fin 78) (1 : Fin 13) (12 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2116` (row). -/
theorem middleSource_h2116 :
    ((!((rowBit (I.sourceRows) 0 1 5 && rowBit (I.sourceRows) 0 1 6)) || ((allOneRankAtom (sourceRanks P) 15 == allOneRankAtom (sourceRanks P) 16)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (1 : Fin 13)
    (5 : Fin 13) (6 : Fin 13)
    (15 : Fin 78) (16 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (15 : Fin 78) (1 : Fin 13) (5 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (16 : Fin 78) (1 : Fin 13) (6 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2117` (row). -/
theorem middleSource_h2117 :
    ((!((rowBit (I.sourceRows) 0 1 5 && rowBit (I.sourceRows) 0 1 7)) || ((allOneRankAtom (sourceRanks P) 15 == allOneRankAtom (sourceRanks P) 17)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (1 : Fin 13)
    (5 : Fin 13) (7 : Fin 13)
    (15 : Fin 78) (17 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (15 : Fin 78) (1 : Fin 13) (5 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (17 : Fin 78) (1 : Fin 13) (7 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2118` (row). -/
theorem middleSource_h2118 :
    ((!((rowBit (I.sourceRows) 0 1 5 && rowBit (I.sourceRows) 0 1 8)) || ((allOneRankAtom (sourceRanks P) 15 == allOneRankAtom (sourceRanks P) 18)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (1 : Fin 13)
    (5 : Fin 13) (8 : Fin 13)
    (15 : Fin 78) (18 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (15 : Fin 78) (1 : Fin 13) (5 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (18 : Fin 78) (1 : Fin 13) (8 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2119` (row). -/
theorem middleSource_h2119 :
    ((!((rowBit (I.sourceRows) 0 1 5 && rowBit (I.sourceRows) 0 1 9)) || ((allOneRankAtom (sourceRanks P) 15 == allOneRankAtom (sourceRanks P) 19)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (1 : Fin 13)
    (5 : Fin 13) (9 : Fin 13)
    (15 : Fin 78) (19 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (15 : Fin 78) (1 : Fin 13) (5 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (19 : Fin 78) (1 : Fin 13) (9 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2120` (row). -/
theorem middleSource_h2120 :
    ((!((rowBit (I.sourceRows) 0 1 5 && rowBit (I.sourceRows) 0 1 10)) || ((allOneRankAtom (sourceRanks P) 15 == allOneRankAtom (sourceRanks P) 20)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (1 : Fin 13)
    (5 : Fin 13) (10 : Fin 13)
    (15 : Fin 78) (20 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (15 : Fin 78) (1 : Fin 13) (5 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (20 : Fin 78) (1 : Fin 13) (10 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2121` (row). -/
theorem middleSource_h2121 :
    ((!((rowBit (I.sourceRows) 0 1 5 && rowBit (I.sourceRows) 0 1 11)) || ((allOneRankAtom (sourceRanks P) 15 == allOneRankAtom (sourceRanks P) 21)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (1 : Fin 13)
    (5 : Fin 13) (11 : Fin 13)
    (15 : Fin 78) (21 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (15 : Fin 78) (1 : Fin 13) (5 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (21 : Fin 78) (1 : Fin 13) (11 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2122` (row). -/
theorem middleSource_h2122 :
    ((!((rowBit (I.sourceRows) 0 1 5 && rowBit (I.sourceRows) 0 1 12)) || ((allOneRankAtom (sourceRanks P) 15 == allOneRankAtom (sourceRanks P) 22)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (1 : Fin 13)
    (5 : Fin 13) (12 : Fin 13)
    (15 : Fin 78) (22 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (15 : Fin 78) (1 : Fin 13) (5 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (22 : Fin 78) (1 : Fin 13) (12 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2123` (row). -/
theorem middleSource_h2123 :
    ((!((rowBit (I.sourceRows) 0 1 6 && rowBit (I.sourceRows) 0 1 7)) || ((allOneRankAtom (sourceRanks P) 16 == allOneRankAtom (sourceRanks P) 17)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (1 : Fin 13)
    (6 : Fin 13) (7 : Fin 13)
    (16 : Fin 78) (17 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (16 : Fin 78) (1 : Fin 13) (6 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (17 : Fin 78) (1 : Fin 13) (7 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2124` (row). -/
theorem middleSource_h2124 :
    ((!((rowBit (I.sourceRows) 0 1 6 && rowBit (I.sourceRows) 0 1 8)) || ((allOneRankAtom (sourceRanks P) 16 == allOneRankAtom (sourceRanks P) 18)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (1 : Fin 13)
    (6 : Fin 13) (8 : Fin 13)
    (16 : Fin 78) (18 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (16 : Fin 78) (1 : Fin 13) (6 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (18 : Fin 78) (1 : Fin 13) (8 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2125` (row). -/
theorem middleSource_h2125 :
    ((!((rowBit (I.sourceRows) 0 1 6 && rowBit (I.sourceRows) 0 1 9)) || ((allOneRankAtom (sourceRanks P) 16 == allOneRankAtom (sourceRanks P) 19)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (1 : Fin 13)
    (6 : Fin 13) (9 : Fin 13)
    (16 : Fin 78) (19 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (16 : Fin 78) (1 : Fin 13) (6 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (19 : Fin 78) (1 : Fin 13) (9 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2126` (row). -/
theorem middleSource_h2126 :
    ((!((rowBit (I.sourceRows) 0 1 6 && rowBit (I.sourceRows) 0 1 10)) || ((allOneRankAtom (sourceRanks P) 16 == allOneRankAtom (sourceRanks P) 20)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (1 : Fin 13)
    (6 : Fin 13) (10 : Fin 13)
    (16 : Fin 78) (20 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (16 : Fin 78) (1 : Fin 13) (6 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (20 : Fin 78) (1 : Fin 13) (10 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2127` (row). -/
theorem middleSource_h2127 :
    ((!((rowBit (I.sourceRows) 0 1 6 && rowBit (I.sourceRows) 0 1 11)) || ((allOneRankAtom (sourceRanks P) 16 == allOneRankAtom (sourceRanks P) 21)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (1 : Fin 13)
    (6 : Fin 13) (11 : Fin 13)
    (16 : Fin 78) (21 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (16 : Fin 78) (1 : Fin 13) (6 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (21 : Fin 78) (1 : Fin 13) (11 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2128` (row). -/
theorem middleSource_h2128 :
    ((!((rowBit (I.sourceRows) 0 1 6 && rowBit (I.sourceRows) 0 1 12)) || ((allOneRankAtom (sourceRanks P) 16 == allOneRankAtom (sourceRanks P) 22)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (1 : Fin 13)
    (6 : Fin 13) (12 : Fin 13)
    (16 : Fin 78) (22 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (16 : Fin 78) (1 : Fin 13) (6 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (22 : Fin 78) (1 : Fin 13) (12 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2129` (row). -/
theorem middleSource_h2129 :
    ((!((rowBit (I.sourceRows) 0 1 7 && rowBit (I.sourceRows) 0 1 8)) || ((allOneRankAtom (sourceRanks P) 17 == allOneRankAtom (sourceRanks P) 18)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (1 : Fin 13)
    (7 : Fin 13) (8 : Fin 13)
    (17 : Fin 78) (18 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (17 : Fin 78) (1 : Fin 13) (7 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (18 : Fin 78) (1 : Fin 13) (8 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2130` (row). -/
theorem middleSource_h2130 :
    ((!((rowBit (I.sourceRows) 0 1 7 && rowBit (I.sourceRows) 0 1 9)) || ((allOneRankAtom (sourceRanks P) 17 == allOneRankAtom (sourceRanks P) 19)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (1 : Fin 13)
    (7 : Fin 13) (9 : Fin 13)
    (17 : Fin 78) (19 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (17 : Fin 78) (1 : Fin 13) (7 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (19 : Fin 78) (1 : Fin 13) (9 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2131` (row). -/
theorem middleSource_h2131 :
    ((!((rowBit (I.sourceRows) 0 1 7 && rowBit (I.sourceRows) 0 1 10)) || ((allOneRankAtom (sourceRanks P) 17 == allOneRankAtom (sourceRanks P) 20)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (1 : Fin 13)
    (7 : Fin 13) (10 : Fin 13)
    (17 : Fin 78) (20 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (17 : Fin 78) (1 : Fin 13) (7 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (20 : Fin 78) (1 : Fin 13) (10 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2132` (row). -/
theorem middleSource_h2132 :
    ((!((rowBit (I.sourceRows) 0 1 7 && rowBit (I.sourceRows) 0 1 11)) || ((allOneRankAtom (sourceRanks P) 17 == allOneRankAtom (sourceRanks P) 21)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (1 : Fin 13)
    (7 : Fin 13) (11 : Fin 13)
    (17 : Fin 78) (21 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (17 : Fin 78) (1 : Fin 13) (7 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (21 : Fin 78) (1 : Fin 13) (11 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2133` (row). -/
theorem middleSource_h2133 :
    ((!((rowBit (I.sourceRows) 0 1 7 && rowBit (I.sourceRows) 0 1 12)) || ((allOneRankAtom (sourceRanks P) 17 == allOneRankAtom (sourceRanks P) 22)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (1 : Fin 13)
    (7 : Fin 13) (12 : Fin 13)
    (17 : Fin 78) (22 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (17 : Fin 78) (1 : Fin 13) (7 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (22 : Fin 78) (1 : Fin 13) (12 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2134` (row). -/
theorem middleSource_h2134 :
    ((!((rowBit (I.sourceRows) 0 1 8 && rowBit (I.sourceRows) 0 1 9)) || ((allOneRankAtom (sourceRanks P) 18 == allOneRankAtom (sourceRanks P) 19)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (1 : Fin 13)
    (8 : Fin 13) (9 : Fin 13)
    (18 : Fin 78) (19 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (18 : Fin 78) (1 : Fin 13) (8 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (19 : Fin 78) (1 : Fin 13) (9 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2135` (row). -/
theorem middleSource_h2135 :
    ((!((rowBit (I.sourceRows) 0 1 8 && rowBit (I.sourceRows) 0 1 10)) || ((allOneRankAtom (sourceRanks P) 18 == allOneRankAtom (sourceRanks P) 20)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (1 : Fin 13)
    (8 : Fin 13) (10 : Fin 13)
    (18 : Fin 78) (20 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (18 : Fin 78) (1 : Fin 13) (8 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (20 : Fin 78) (1 : Fin 13) (10 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2136` (row). -/
theorem middleSource_h2136 :
    ((!((rowBit (I.sourceRows) 0 1 8 && rowBit (I.sourceRows) 0 1 11)) || ((allOneRankAtom (sourceRanks P) 18 == allOneRankAtom (sourceRanks P) 21)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (1 : Fin 13)
    (8 : Fin 13) (11 : Fin 13)
    (18 : Fin 78) (21 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (18 : Fin 78) (1 : Fin 13) (8 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (21 : Fin 78) (1 : Fin 13) (11 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2137` (row). -/
theorem middleSource_h2137 :
    ((!((rowBit (I.sourceRows) 0 1 8 && rowBit (I.sourceRows) 0 1 12)) || ((allOneRankAtom (sourceRanks P) 18 == allOneRankAtom (sourceRanks P) 22)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (1 : Fin 13)
    (8 : Fin 13) (12 : Fin 13)
    (18 : Fin 78) (22 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (18 : Fin 78) (1 : Fin 13) (8 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (22 : Fin 78) (1 : Fin 13) (12 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2138` (row). -/
theorem middleSource_h2138 :
    ((!((rowBit (I.sourceRows) 0 1 9 && rowBit (I.sourceRows) 0 1 10)) || ((allOneRankAtom (sourceRanks P) 19 == allOneRankAtom (sourceRanks P) 20)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (1 : Fin 13)
    (9 : Fin 13) (10 : Fin 13)
    (19 : Fin 78) (20 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (19 : Fin 78) (1 : Fin 13) (9 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (20 : Fin 78) (1 : Fin 13) (10 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2139` (row). -/
theorem middleSource_h2139 :
    ((!((rowBit (I.sourceRows) 0 1 9 && rowBit (I.sourceRows) 0 1 11)) || ((allOneRankAtom (sourceRanks P) 19 == allOneRankAtom (sourceRanks P) 21)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (1 : Fin 13)
    (9 : Fin 13) (11 : Fin 13)
    (19 : Fin 78) (21 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (19 : Fin 78) (1 : Fin 13) (9 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (21 : Fin 78) (1 : Fin 13) (11 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2140` (row). -/
theorem middleSource_h2140 :
    ((!((rowBit (I.sourceRows) 0 1 9 && rowBit (I.sourceRows) 0 1 12)) || ((allOneRankAtom (sourceRanks P) 19 == allOneRankAtom (sourceRanks P) 22)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (1 : Fin 13)
    (9 : Fin 13) (12 : Fin 13)
    (19 : Fin 78) (22 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (19 : Fin 78) (1 : Fin 13) (9 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (22 : Fin 78) (1 : Fin 13) (12 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2141` (row). -/
theorem middleSource_h2141 :
    ((!((rowBit (I.sourceRows) 0 1 10 && rowBit (I.sourceRows) 0 1 11)) || ((allOneRankAtom (sourceRanks P) 20 == allOneRankAtom (sourceRanks P) 21)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (1 : Fin 13)
    (10 : Fin 13) (11 : Fin 13)
    (20 : Fin 78) (21 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (20 : Fin 78) (1 : Fin 13) (10 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (21 : Fin 78) (1 : Fin 13) (11 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2142` (row). -/
theorem middleSource_h2142 :
    ((!((rowBit (I.sourceRows) 0 1 10 && rowBit (I.sourceRows) 0 1 12)) || ((allOneRankAtom (sourceRanks P) 20 == allOneRankAtom (sourceRanks P) 22)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (1 : Fin 13)
    (10 : Fin 13) (12 : Fin 13)
    (20 : Fin 78) (22 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (20 : Fin 78) (1 : Fin 13) (10 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (22 : Fin 78) (1 : Fin 13) (12 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2143` (row). -/
theorem middleSource_h2143 :
    ((!((rowBit (I.sourceRows) 0 1 11 && rowBit (I.sourceRows) 0 1 12)) || ((allOneRankAtom (sourceRanks P) 21 == allOneRankAtom (sourceRanks P) 22)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (1 : Fin 13)
    (11 : Fin 13) (12 : Fin 13)
    (21 : Fin 78) (22 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (21 : Fin 78) (1 : Fin 13) (11 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (22 : Fin 78) (1 : Fin 13) (12 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2144` (row). -/
theorem middleSource_h2144 :
    ((!((rowBit (I.sourceRows) 0 2 0 && rowBit (I.sourceRows) 0 2 1)) || ((allOneRankAtom (sourceRanks P) 1 == allOneRankAtom (sourceRanks P) 12)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (2 : Fin 13)
    (0 : Fin 13) (1 : Fin 13)
    (1 : Fin 78) (12 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (1 : Fin 78) (2 : Fin 13) (0 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (12 : Fin 78) (2 : Fin 13) (1 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2145` (row). -/
theorem middleSource_h2145 :
    ((!((rowBit (I.sourceRows) 0 2 0 && rowBit (I.sourceRows) 0 2 3)) || ((allOneRankAtom (sourceRanks P) 1 == allOneRankAtom (sourceRanks P) 23)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (2 : Fin 13)
    (0 : Fin 13) (3 : Fin 13)
    (1 : Fin 78) (23 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (1 : Fin 78) (2 : Fin 13) (0 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (23 : Fin 78) (2 : Fin 13) (3 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2146` (row). -/
theorem middleSource_h2146 :
    ((!((rowBit (I.sourceRows) 0 2 0 && rowBit (I.sourceRows) 0 2 4)) || ((allOneRankAtom (sourceRanks P) 1 == allOneRankAtom (sourceRanks P) 24)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (2 : Fin 13)
    (0 : Fin 13) (4 : Fin 13)
    (1 : Fin 78) (24 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (1 : Fin 78) (2 : Fin 13) (0 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (24 : Fin 78) (2 : Fin 13) (4 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2147` (row). -/
theorem middleSource_h2147 :
    ((!((rowBit (I.sourceRows) 0 2 0 && rowBit (I.sourceRows) 0 2 5)) || ((allOneRankAtom (sourceRanks P) 1 == allOneRankAtom (sourceRanks P) 25)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (2 : Fin 13)
    (0 : Fin 13) (5 : Fin 13)
    (1 : Fin 78) (25 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (1 : Fin 78) (2 : Fin 13) (0 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (25 : Fin 78) (2 : Fin 13) (5 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2148` (row). -/
theorem middleSource_h2148 :
    ((!((rowBit (I.sourceRows) 0 2 0 && rowBit (I.sourceRows) 0 2 6)) || ((allOneRankAtom (sourceRanks P) 1 == allOneRankAtom (sourceRanks P) 26)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (2 : Fin 13)
    (0 : Fin 13) (6 : Fin 13)
    (1 : Fin 78) (26 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (1 : Fin 78) (2 : Fin 13) (0 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (26 : Fin 78) (2 : Fin 13) (6 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2149` (row). -/
theorem middleSource_h2149 :
    ((!((rowBit (I.sourceRows) 0 2 0 && rowBit (I.sourceRows) 0 2 7)) || ((allOneRankAtom (sourceRanks P) 1 == allOneRankAtom (sourceRanks P) 27)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (2 : Fin 13)
    (0 : Fin 13) (7 : Fin 13)
    (1 : Fin 78) (27 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (1 : Fin 78) (2 : Fin 13) (0 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (27 : Fin 78) (2 : Fin 13) (7 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2150` (row). -/
theorem middleSource_h2150 :
    ((!((rowBit (I.sourceRows) 0 2 0 && rowBit (I.sourceRows) 0 2 8)) || ((allOneRankAtom (sourceRanks P) 1 == allOneRankAtom (sourceRanks P) 28)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (2 : Fin 13)
    (0 : Fin 13) (8 : Fin 13)
    (1 : Fin 78) (28 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (1 : Fin 78) (2 : Fin 13) (0 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (28 : Fin 78) (2 : Fin 13) (8 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2151` (row). -/
theorem middleSource_h2151 :
    ((!((rowBit (I.sourceRows) 0 2 0 && rowBit (I.sourceRows) 0 2 9)) || ((allOneRankAtom (sourceRanks P) 1 == allOneRankAtom (sourceRanks P) 29)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (2 : Fin 13)
    (0 : Fin 13) (9 : Fin 13)
    (1 : Fin 78) (29 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (1 : Fin 78) (2 : Fin 13) (0 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (29 : Fin 78) (2 : Fin 13) (9 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2152` (row). -/
theorem middleSource_h2152 :
    ((!((rowBit (I.sourceRows) 0 2 0 && rowBit (I.sourceRows) 0 2 10)) || ((allOneRankAtom (sourceRanks P) 1 == allOneRankAtom (sourceRanks P) 30)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (2 : Fin 13)
    (0 : Fin 13) (10 : Fin 13)
    (1 : Fin 78) (30 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (1 : Fin 78) (2 : Fin 13) (0 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (30 : Fin 78) (2 : Fin 13) (10 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2153` (row). -/
theorem middleSource_h2153 :
    ((!((rowBit (I.sourceRows) 0 2 0 && rowBit (I.sourceRows) 0 2 11)) || ((allOneRankAtom (sourceRanks P) 1 == allOneRankAtom (sourceRanks P) 31)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (2 : Fin 13)
    (0 : Fin 13) (11 : Fin 13)
    (1 : Fin 78) (31 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (1 : Fin 78) (2 : Fin 13) (0 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (31 : Fin 78) (2 : Fin 13) (11 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2154` (row). -/
theorem middleSource_h2154 :
    ((!((rowBit (I.sourceRows) 0 2 0 && rowBit (I.sourceRows) 0 2 12)) || ((allOneRankAtom (sourceRanks P) 1 == allOneRankAtom (sourceRanks P) 32)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (2 : Fin 13)
    (0 : Fin 13) (12 : Fin 13)
    (1 : Fin 78) (32 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (1 : Fin 78) (2 : Fin 13) (0 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (32 : Fin 78) (2 : Fin 13) (12 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2155` (row). -/
theorem middleSource_h2155 :
    ((!((rowBit (I.sourceRows) 0 2 1 && rowBit (I.sourceRows) 0 2 3)) || ((allOneRankAtom (sourceRanks P) 12 == allOneRankAtom (sourceRanks P) 23)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (2 : Fin 13)
    (1 : Fin 13) (3 : Fin 13)
    (12 : Fin 78) (23 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (12 : Fin 78) (2 : Fin 13) (1 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (23 : Fin 78) (2 : Fin 13) (3 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2156` (row). -/
theorem middleSource_h2156 :
    ((!((rowBit (I.sourceRows) 0 2 1 && rowBit (I.sourceRows) 0 2 4)) || ((allOneRankAtom (sourceRanks P) 12 == allOneRankAtom (sourceRanks P) 24)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (2 : Fin 13)
    (1 : Fin 13) (4 : Fin 13)
    (12 : Fin 78) (24 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (12 : Fin 78) (2 : Fin 13) (1 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (24 : Fin 78) (2 : Fin 13) (4 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2157` (row). -/
theorem middleSource_h2157 :
    ((!((rowBit (I.sourceRows) 0 2 1 && rowBit (I.sourceRows) 0 2 5)) || ((allOneRankAtom (sourceRanks P) 12 == allOneRankAtom (sourceRanks P) 25)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (2 : Fin 13)
    (1 : Fin 13) (5 : Fin 13)
    (12 : Fin 78) (25 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (12 : Fin 78) (2 : Fin 13) (1 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (25 : Fin 78) (2 : Fin 13) (5 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2158` (row). -/
theorem middleSource_h2158 :
    ((!((rowBit (I.sourceRows) 0 2 1 && rowBit (I.sourceRows) 0 2 6)) || ((allOneRankAtom (sourceRanks P) 12 == allOneRankAtom (sourceRanks P) 26)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (2 : Fin 13)
    (1 : Fin 13) (6 : Fin 13)
    (12 : Fin 78) (26 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (12 : Fin 78) (2 : Fin 13) (1 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (26 : Fin 78) (2 : Fin 13) (6 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2159` (row). -/
theorem middleSource_h2159 :
    ((!((rowBit (I.sourceRows) 0 2 1 && rowBit (I.sourceRows) 0 2 7)) || ((allOneRankAtom (sourceRanks P) 12 == allOneRankAtom (sourceRanks P) 27)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (2 : Fin 13)
    (1 : Fin 13) (7 : Fin 13)
    (12 : Fin 78) (27 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (12 : Fin 78) (2 : Fin 13) (1 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (27 : Fin 78) (2 : Fin 13) (7 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2160` (row). -/
theorem middleSource_h2160 :
    ((!((rowBit (I.sourceRows) 0 2 1 && rowBit (I.sourceRows) 0 2 8)) || ((allOneRankAtom (sourceRanks P) 12 == allOneRankAtom (sourceRanks P) 28)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (2 : Fin 13)
    (1 : Fin 13) (8 : Fin 13)
    (12 : Fin 78) (28 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (12 : Fin 78) (2 : Fin 13) (1 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (28 : Fin 78) (2 : Fin 13) (8 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2161` (row). -/
theorem middleSource_h2161 :
    ((!((rowBit (I.sourceRows) 0 2 1 && rowBit (I.sourceRows) 0 2 9)) || ((allOneRankAtom (sourceRanks P) 12 == allOneRankAtom (sourceRanks P) 29)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (2 : Fin 13)
    (1 : Fin 13) (9 : Fin 13)
    (12 : Fin 78) (29 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (12 : Fin 78) (2 : Fin 13) (1 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (29 : Fin 78) (2 : Fin 13) (9 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2162` (row). -/
theorem middleSource_h2162 :
    ((!((rowBit (I.sourceRows) 0 2 1 && rowBit (I.sourceRows) 0 2 10)) || ((allOneRankAtom (sourceRanks P) 12 == allOneRankAtom (sourceRanks P) 30)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (2 : Fin 13)
    (1 : Fin 13) (10 : Fin 13)
    (12 : Fin 78) (30 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (12 : Fin 78) (2 : Fin 13) (1 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (30 : Fin 78) (2 : Fin 13) (10 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2163` (row). -/
theorem middleSource_h2163 :
    ((!((rowBit (I.sourceRows) 0 2 1 && rowBit (I.sourceRows) 0 2 11)) || ((allOneRankAtom (sourceRanks P) 12 == allOneRankAtom (sourceRanks P) 31)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (2 : Fin 13)
    (1 : Fin 13) (11 : Fin 13)
    (12 : Fin 78) (31 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (12 : Fin 78) (2 : Fin 13) (1 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (31 : Fin 78) (2 : Fin 13) (11 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2164` (row). -/
theorem middleSource_h2164 :
    ((!((rowBit (I.sourceRows) 0 2 1 && rowBit (I.sourceRows) 0 2 12)) || ((allOneRankAtom (sourceRanks P) 12 == allOneRankAtom (sourceRanks P) 32)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (2 : Fin 13)
    (1 : Fin 13) (12 : Fin 13)
    (12 : Fin 78) (32 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (12 : Fin 78) (2 : Fin 13) (1 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (32 : Fin 78) (2 : Fin 13) (12 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2165` (row). -/
theorem middleSource_h2165 :
    ((!((rowBit (I.sourceRows) 0 2 3 && rowBit (I.sourceRows) 0 2 4)) || ((allOneRankAtom (sourceRanks P) 23 == allOneRankAtom (sourceRanks P) 24)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (2 : Fin 13)
    (3 : Fin 13) (4 : Fin 13)
    (23 : Fin 78) (24 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (23 : Fin 78) (2 : Fin 13) (3 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (24 : Fin 78) (2 : Fin 13) (4 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2166` (row). -/
theorem middleSource_h2166 :
    ((!((rowBit (I.sourceRows) 0 2 3 && rowBit (I.sourceRows) 0 2 5)) || ((allOneRankAtom (sourceRanks P) 23 == allOneRankAtom (sourceRanks P) 25)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (2 : Fin 13)
    (3 : Fin 13) (5 : Fin 13)
    (23 : Fin 78) (25 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (23 : Fin 78) (2 : Fin 13) (3 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (25 : Fin 78) (2 : Fin 13) (5 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2167` (row). -/
theorem middleSource_h2167 :
    ((!((rowBit (I.sourceRows) 0 2 3 && rowBit (I.sourceRows) 0 2 6)) || ((allOneRankAtom (sourceRanks P) 23 == allOneRankAtom (sourceRanks P) 26)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (2 : Fin 13)
    (3 : Fin 13) (6 : Fin 13)
    (23 : Fin 78) (26 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (23 : Fin 78) (2 : Fin 13) (3 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (26 : Fin 78) (2 : Fin 13) (6 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2168` (row). -/
theorem middleSource_h2168 :
    ((!((rowBit (I.sourceRows) 0 2 3 && rowBit (I.sourceRows) 0 2 7)) || ((allOneRankAtom (sourceRanks P) 23 == allOneRankAtom (sourceRanks P) 27)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (2 : Fin 13)
    (3 : Fin 13) (7 : Fin 13)
    (23 : Fin 78) (27 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (23 : Fin 78) (2 : Fin 13) (3 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (27 : Fin 78) (2 : Fin 13) (7 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2169` (row). -/
theorem middleSource_h2169 :
    ((!((rowBit (I.sourceRows) 0 2 3 && rowBit (I.sourceRows) 0 2 8)) || ((allOneRankAtom (sourceRanks P) 23 == allOneRankAtom (sourceRanks P) 28)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (2 : Fin 13)
    (3 : Fin 13) (8 : Fin 13)
    (23 : Fin 78) (28 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (23 : Fin 78) (2 : Fin 13) (3 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (28 : Fin 78) (2 : Fin 13) (8 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2170` (row). -/
theorem middleSource_h2170 :
    ((!((rowBit (I.sourceRows) 0 2 3 && rowBit (I.sourceRows) 0 2 9)) || ((allOneRankAtom (sourceRanks P) 23 == allOneRankAtom (sourceRanks P) 29)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (2 : Fin 13)
    (3 : Fin 13) (9 : Fin 13)
    (23 : Fin 78) (29 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (23 : Fin 78) (2 : Fin 13) (3 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (29 : Fin 78) (2 : Fin 13) (9 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2171` (row). -/
theorem middleSource_h2171 :
    ((!((rowBit (I.sourceRows) 0 2 3 && rowBit (I.sourceRows) 0 2 10)) || ((allOneRankAtom (sourceRanks P) 23 == allOneRankAtom (sourceRanks P) 30)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (2 : Fin 13)
    (3 : Fin 13) (10 : Fin 13)
    (23 : Fin 78) (30 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (23 : Fin 78) (2 : Fin 13) (3 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (30 : Fin 78) (2 : Fin 13) (10 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2172` (row). -/
theorem middleSource_h2172 :
    ((!((rowBit (I.sourceRows) 0 2 3 && rowBit (I.sourceRows) 0 2 11)) || ((allOneRankAtom (sourceRanks P) 23 == allOneRankAtom (sourceRanks P) 31)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (2 : Fin 13)
    (3 : Fin 13) (11 : Fin 13)
    (23 : Fin 78) (31 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (23 : Fin 78) (2 : Fin 13) (3 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (31 : Fin 78) (2 : Fin 13) (11 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2173` (row). -/
theorem middleSource_h2173 :
    ((!((rowBit (I.sourceRows) 0 2 3 && rowBit (I.sourceRows) 0 2 12)) || ((allOneRankAtom (sourceRanks P) 23 == allOneRankAtom (sourceRanks P) 32)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (2 : Fin 13)
    (3 : Fin 13) (12 : Fin 13)
    (23 : Fin 78) (32 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (23 : Fin 78) (2 : Fin 13) (3 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (32 : Fin 78) (2 : Fin 13) (12 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2174` (row). -/
theorem middleSource_h2174 :
    ((!((rowBit (I.sourceRows) 0 2 4 && rowBit (I.sourceRows) 0 2 5)) || ((allOneRankAtom (sourceRanks P) 24 == allOneRankAtom (sourceRanks P) 25)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (2 : Fin 13)
    (4 : Fin 13) (5 : Fin 13)
    (24 : Fin 78) (25 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (24 : Fin 78) (2 : Fin 13) (4 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (25 : Fin 78) (2 : Fin 13) (5 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2175` (row). -/
theorem middleSource_h2175 :
    ((!((rowBit (I.sourceRows) 0 2 4 && rowBit (I.sourceRows) 0 2 6)) || ((allOneRankAtom (sourceRanks P) 24 == allOneRankAtom (sourceRanks P) 26)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (2 : Fin 13)
    (4 : Fin 13) (6 : Fin 13)
    (24 : Fin 78) (26 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (24 : Fin 78) (2 : Fin 13) (4 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (26 : Fin 78) (2 : Fin 13) (6 : Fin 13) (by decide))

end

end ATailExactFiveCard13AllOneSourceIngressScratch
end Problem97
