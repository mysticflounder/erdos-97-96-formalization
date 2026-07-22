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

/-- Candidate middle source assertion `h2048` (row). -/
theorem middleSource_h2048 :
    ((!((rowBit (I.sourceRows) 0 0 3 && rowBit (I.sourceRows) 0 0 9)) || ((allOneRankAtom (sourceRanks P) 2 == allOneRankAtom (sourceRanks P) 8)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (0 : Fin 13)
    (3 : Fin 13) (9 : Fin 13)
    (2 : Fin 78) (8 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (2 : Fin 78) (0 : Fin 13) (3 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (8 : Fin 78) (0 : Fin 13) (9 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2049` (row). -/
theorem middleSource_h2049 :
    ((!((rowBit (I.sourceRows) 0 0 3 && rowBit (I.sourceRows) 0 0 10)) || ((allOneRankAtom (sourceRanks P) 2 == allOneRankAtom (sourceRanks P) 9)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (0 : Fin 13)
    (3 : Fin 13) (10 : Fin 13)
    (2 : Fin 78) (9 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (2 : Fin 78) (0 : Fin 13) (3 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (9 : Fin 78) (0 : Fin 13) (10 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2050` (row). -/
theorem middleSource_h2050 :
    ((!((rowBit (I.sourceRows) 0 0 3 && rowBit (I.sourceRows) 0 0 11)) || ((allOneRankAtom (sourceRanks P) 2 == allOneRankAtom (sourceRanks P) 10)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (0 : Fin 13)
    (3 : Fin 13) (11 : Fin 13)
    (2 : Fin 78) (10 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (2 : Fin 78) (0 : Fin 13) (3 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (10 : Fin 78) (0 : Fin 13) (11 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2051` (row). -/
theorem middleSource_h2051 :
    ((!((rowBit (I.sourceRows) 0 0 3 && rowBit (I.sourceRows) 0 0 12)) || ((allOneRankAtom (sourceRanks P) 2 == allOneRankAtom (sourceRanks P) 11)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (0 : Fin 13)
    (3 : Fin 13) (12 : Fin 13)
    (2 : Fin 78) (11 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (2 : Fin 78) (0 : Fin 13) (3 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (11 : Fin 78) (0 : Fin 13) (12 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2052` (row). -/
theorem middleSource_h2052 :
    ((!((rowBit (I.sourceRows) 0 0 4 && rowBit (I.sourceRows) 0 0 5)) || ((allOneRankAtom (sourceRanks P) 3 == allOneRankAtom (sourceRanks P) 4)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (0 : Fin 13)
    (4 : Fin 13) (5 : Fin 13)
    (3 : Fin 78) (4 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (3 : Fin 78) (0 : Fin 13) (4 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (4 : Fin 78) (0 : Fin 13) (5 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2053` (row). -/
theorem middleSource_h2053 :
    ((!((rowBit (I.sourceRows) 0 0 4 && rowBit (I.sourceRows) 0 0 6)) || ((allOneRankAtom (sourceRanks P) 3 == allOneRankAtom (sourceRanks P) 5)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (0 : Fin 13)
    (4 : Fin 13) (6 : Fin 13)
    (3 : Fin 78) (5 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (3 : Fin 78) (0 : Fin 13) (4 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (5 : Fin 78) (0 : Fin 13) (6 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2054` (row). -/
theorem middleSource_h2054 :
    ((!((rowBit (I.sourceRows) 0 0 4 && rowBit (I.sourceRows) 0 0 7)) || ((allOneRankAtom (sourceRanks P) 3 == allOneRankAtom (sourceRanks P) 6)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (0 : Fin 13)
    (4 : Fin 13) (7 : Fin 13)
    (3 : Fin 78) (6 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (3 : Fin 78) (0 : Fin 13) (4 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (6 : Fin 78) (0 : Fin 13) (7 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2055` (row). -/
theorem middleSource_h2055 :
    ((!((rowBit (I.sourceRows) 0 0 4 && rowBit (I.sourceRows) 0 0 8)) || ((allOneRankAtom (sourceRanks P) 3 == allOneRankAtom (sourceRanks P) 7)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (0 : Fin 13)
    (4 : Fin 13) (8 : Fin 13)
    (3 : Fin 78) (7 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (3 : Fin 78) (0 : Fin 13) (4 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (7 : Fin 78) (0 : Fin 13) (8 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2056` (row). -/
theorem middleSource_h2056 :
    ((!((rowBit (I.sourceRows) 0 0 4 && rowBit (I.sourceRows) 0 0 9)) || ((allOneRankAtom (sourceRanks P) 3 == allOneRankAtom (sourceRanks P) 8)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (0 : Fin 13)
    (4 : Fin 13) (9 : Fin 13)
    (3 : Fin 78) (8 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (3 : Fin 78) (0 : Fin 13) (4 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (8 : Fin 78) (0 : Fin 13) (9 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2057` (row). -/
theorem middleSource_h2057 :
    ((!((rowBit (I.sourceRows) 0 0 4 && rowBit (I.sourceRows) 0 0 10)) || ((allOneRankAtom (sourceRanks P) 3 == allOneRankAtom (sourceRanks P) 9)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (0 : Fin 13)
    (4 : Fin 13) (10 : Fin 13)
    (3 : Fin 78) (9 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (3 : Fin 78) (0 : Fin 13) (4 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (9 : Fin 78) (0 : Fin 13) (10 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2058` (row). -/
theorem middleSource_h2058 :
    ((!((rowBit (I.sourceRows) 0 0 4 && rowBit (I.sourceRows) 0 0 11)) || ((allOneRankAtom (sourceRanks P) 3 == allOneRankAtom (sourceRanks P) 10)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (0 : Fin 13)
    (4 : Fin 13) (11 : Fin 13)
    (3 : Fin 78) (10 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (3 : Fin 78) (0 : Fin 13) (4 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (10 : Fin 78) (0 : Fin 13) (11 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2059` (row). -/
theorem middleSource_h2059 :
    ((!((rowBit (I.sourceRows) 0 0 4 && rowBit (I.sourceRows) 0 0 12)) || ((allOneRankAtom (sourceRanks P) 3 == allOneRankAtom (sourceRanks P) 11)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (0 : Fin 13)
    (4 : Fin 13) (12 : Fin 13)
    (3 : Fin 78) (11 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (3 : Fin 78) (0 : Fin 13) (4 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (11 : Fin 78) (0 : Fin 13) (12 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2060` (row). -/
theorem middleSource_h2060 :
    ((!((rowBit (I.sourceRows) 0 0 5 && rowBit (I.sourceRows) 0 0 6)) || ((allOneRankAtom (sourceRanks P) 4 == allOneRankAtom (sourceRanks P) 5)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (0 : Fin 13)
    (5 : Fin 13) (6 : Fin 13)
    (4 : Fin 78) (5 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (4 : Fin 78) (0 : Fin 13) (5 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (5 : Fin 78) (0 : Fin 13) (6 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2061` (row). -/
theorem middleSource_h2061 :
    ((!((rowBit (I.sourceRows) 0 0 5 && rowBit (I.sourceRows) 0 0 7)) || ((allOneRankAtom (sourceRanks P) 4 == allOneRankAtom (sourceRanks P) 6)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (0 : Fin 13)
    (5 : Fin 13) (7 : Fin 13)
    (4 : Fin 78) (6 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (4 : Fin 78) (0 : Fin 13) (5 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (6 : Fin 78) (0 : Fin 13) (7 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2062` (row). -/
theorem middleSource_h2062 :
    ((!((rowBit (I.sourceRows) 0 0 5 && rowBit (I.sourceRows) 0 0 8)) || ((allOneRankAtom (sourceRanks P) 4 == allOneRankAtom (sourceRanks P) 7)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (0 : Fin 13)
    (5 : Fin 13) (8 : Fin 13)
    (4 : Fin 78) (7 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (4 : Fin 78) (0 : Fin 13) (5 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (7 : Fin 78) (0 : Fin 13) (8 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2063` (row). -/
theorem middleSource_h2063 :
    ((!((rowBit (I.sourceRows) 0 0 5 && rowBit (I.sourceRows) 0 0 9)) || ((allOneRankAtom (sourceRanks P) 4 == allOneRankAtom (sourceRanks P) 8)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (0 : Fin 13)
    (5 : Fin 13) (9 : Fin 13)
    (4 : Fin 78) (8 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (4 : Fin 78) (0 : Fin 13) (5 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (8 : Fin 78) (0 : Fin 13) (9 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2064` (row). -/
theorem middleSource_h2064 :
    ((!((rowBit (I.sourceRows) 0 0 5 && rowBit (I.sourceRows) 0 0 10)) || ((allOneRankAtom (sourceRanks P) 4 == allOneRankAtom (sourceRanks P) 9)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (0 : Fin 13)
    (5 : Fin 13) (10 : Fin 13)
    (4 : Fin 78) (9 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (4 : Fin 78) (0 : Fin 13) (5 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (9 : Fin 78) (0 : Fin 13) (10 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2065` (row). -/
theorem middleSource_h2065 :
    ((!((rowBit (I.sourceRows) 0 0 5 && rowBit (I.sourceRows) 0 0 11)) || ((allOneRankAtom (sourceRanks P) 4 == allOneRankAtom (sourceRanks P) 10)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (0 : Fin 13)
    (5 : Fin 13) (11 : Fin 13)
    (4 : Fin 78) (10 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (4 : Fin 78) (0 : Fin 13) (5 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (10 : Fin 78) (0 : Fin 13) (11 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2066` (row). -/
theorem middleSource_h2066 :
    ((!((rowBit (I.sourceRows) 0 0 5 && rowBit (I.sourceRows) 0 0 12)) || ((allOneRankAtom (sourceRanks P) 4 == allOneRankAtom (sourceRanks P) 11)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (0 : Fin 13)
    (5 : Fin 13) (12 : Fin 13)
    (4 : Fin 78) (11 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (4 : Fin 78) (0 : Fin 13) (5 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (11 : Fin 78) (0 : Fin 13) (12 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2067` (row). -/
theorem middleSource_h2067 :
    ((!((rowBit (I.sourceRows) 0 0 6 && rowBit (I.sourceRows) 0 0 7)) || ((allOneRankAtom (sourceRanks P) 5 == allOneRankAtom (sourceRanks P) 6)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (0 : Fin 13)
    (6 : Fin 13) (7 : Fin 13)
    (5 : Fin 78) (6 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (5 : Fin 78) (0 : Fin 13) (6 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (6 : Fin 78) (0 : Fin 13) (7 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2068` (row). -/
theorem middleSource_h2068 :
    ((!((rowBit (I.sourceRows) 0 0 6 && rowBit (I.sourceRows) 0 0 8)) || ((allOneRankAtom (sourceRanks P) 5 == allOneRankAtom (sourceRanks P) 7)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (0 : Fin 13)
    (6 : Fin 13) (8 : Fin 13)
    (5 : Fin 78) (7 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (5 : Fin 78) (0 : Fin 13) (6 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (7 : Fin 78) (0 : Fin 13) (8 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2069` (row). -/
theorem middleSource_h2069 :
    ((!((rowBit (I.sourceRows) 0 0 6 && rowBit (I.sourceRows) 0 0 9)) || ((allOneRankAtom (sourceRanks P) 5 == allOneRankAtom (sourceRanks P) 8)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (0 : Fin 13)
    (6 : Fin 13) (9 : Fin 13)
    (5 : Fin 78) (8 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (5 : Fin 78) (0 : Fin 13) (6 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (8 : Fin 78) (0 : Fin 13) (9 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2070` (row). -/
theorem middleSource_h2070 :
    ((!((rowBit (I.sourceRows) 0 0 6 && rowBit (I.sourceRows) 0 0 10)) || ((allOneRankAtom (sourceRanks P) 5 == allOneRankAtom (sourceRanks P) 9)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (0 : Fin 13)
    (6 : Fin 13) (10 : Fin 13)
    (5 : Fin 78) (9 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (5 : Fin 78) (0 : Fin 13) (6 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (9 : Fin 78) (0 : Fin 13) (10 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2071` (row). -/
theorem middleSource_h2071 :
    ((!((rowBit (I.sourceRows) 0 0 6 && rowBit (I.sourceRows) 0 0 11)) || ((allOneRankAtom (sourceRanks P) 5 == allOneRankAtom (sourceRanks P) 10)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (0 : Fin 13)
    (6 : Fin 13) (11 : Fin 13)
    (5 : Fin 78) (10 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (5 : Fin 78) (0 : Fin 13) (6 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (10 : Fin 78) (0 : Fin 13) (11 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2072` (row). -/
theorem middleSource_h2072 :
    ((!((rowBit (I.sourceRows) 0 0 6 && rowBit (I.sourceRows) 0 0 12)) || ((allOneRankAtom (sourceRanks P) 5 == allOneRankAtom (sourceRanks P) 11)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (0 : Fin 13)
    (6 : Fin 13) (12 : Fin 13)
    (5 : Fin 78) (11 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (5 : Fin 78) (0 : Fin 13) (6 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (11 : Fin 78) (0 : Fin 13) (12 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2073` (row). -/
theorem middleSource_h2073 :
    ((!((rowBit (I.sourceRows) 0 0 7 && rowBit (I.sourceRows) 0 0 8)) || ((allOneRankAtom (sourceRanks P) 6 == allOneRankAtom (sourceRanks P) 7)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (0 : Fin 13)
    (7 : Fin 13) (8 : Fin 13)
    (6 : Fin 78) (7 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (6 : Fin 78) (0 : Fin 13) (7 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (7 : Fin 78) (0 : Fin 13) (8 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2074` (row). -/
theorem middleSource_h2074 :
    ((!((rowBit (I.sourceRows) 0 0 7 && rowBit (I.sourceRows) 0 0 9)) || ((allOneRankAtom (sourceRanks P) 6 == allOneRankAtom (sourceRanks P) 8)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (0 : Fin 13)
    (7 : Fin 13) (9 : Fin 13)
    (6 : Fin 78) (8 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (6 : Fin 78) (0 : Fin 13) (7 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (8 : Fin 78) (0 : Fin 13) (9 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2075` (row). -/
theorem middleSource_h2075 :
    ((!((rowBit (I.sourceRows) 0 0 7 && rowBit (I.sourceRows) 0 0 10)) || ((allOneRankAtom (sourceRanks P) 6 == allOneRankAtom (sourceRanks P) 9)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (0 : Fin 13)
    (7 : Fin 13) (10 : Fin 13)
    (6 : Fin 78) (9 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (6 : Fin 78) (0 : Fin 13) (7 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (9 : Fin 78) (0 : Fin 13) (10 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2076` (row). -/
theorem middleSource_h2076 :
    ((!((rowBit (I.sourceRows) 0 0 7 && rowBit (I.sourceRows) 0 0 11)) || ((allOneRankAtom (sourceRanks P) 6 == allOneRankAtom (sourceRanks P) 10)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (0 : Fin 13)
    (7 : Fin 13) (11 : Fin 13)
    (6 : Fin 78) (10 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (6 : Fin 78) (0 : Fin 13) (7 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (10 : Fin 78) (0 : Fin 13) (11 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2077` (row). -/
theorem middleSource_h2077 :
    ((!((rowBit (I.sourceRows) 0 0 7 && rowBit (I.sourceRows) 0 0 12)) || ((allOneRankAtom (sourceRanks P) 6 == allOneRankAtom (sourceRanks P) 11)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (0 : Fin 13)
    (7 : Fin 13) (12 : Fin 13)
    (6 : Fin 78) (11 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (6 : Fin 78) (0 : Fin 13) (7 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (11 : Fin 78) (0 : Fin 13) (12 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2078` (row). -/
theorem middleSource_h2078 :
    ((!((rowBit (I.sourceRows) 0 1 0 && rowBit (I.sourceRows) 0 1 2)) || ((allOneRankAtom (sourceRanks P) 0 == allOneRankAtom (sourceRanks P) 12)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (1 : Fin 13)
    (0 : Fin 13) (2 : Fin 13)
    (0 : Fin 78) (12 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (0 : Fin 78) (1 : Fin 13) (0 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (12 : Fin 78) (1 : Fin 13) (2 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2079` (row). -/
theorem middleSource_h2079 :
    ((!((rowBit (I.sourceRows) 0 1 0 && rowBit (I.sourceRows) 0 1 3)) || ((allOneRankAtom (sourceRanks P) 0 == allOneRankAtom (sourceRanks P) 13)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (1 : Fin 13)
    (0 : Fin 13) (3 : Fin 13)
    (0 : Fin 78) (13 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (0 : Fin 78) (1 : Fin 13) (0 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (13 : Fin 78) (1 : Fin 13) (3 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2080` (row). -/
theorem middleSource_h2080 :
    ((!((rowBit (I.sourceRows) 0 1 0 && rowBit (I.sourceRows) 0 1 4)) || ((allOneRankAtom (sourceRanks P) 0 == allOneRankAtom (sourceRanks P) 14)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (1 : Fin 13)
    (0 : Fin 13) (4 : Fin 13)
    (0 : Fin 78) (14 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (0 : Fin 78) (1 : Fin 13) (0 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (14 : Fin 78) (1 : Fin 13) (4 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2081` (row). -/
theorem middleSource_h2081 :
    ((!((rowBit (I.sourceRows) 0 1 0 && rowBit (I.sourceRows) 0 1 5)) || ((allOneRankAtom (sourceRanks P) 0 == allOneRankAtom (sourceRanks P) 15)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (1 : Fin 13)
    (0 : Fin 13) (5 : Fin 13)
    (0 : Fin 78) (15 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (0 : Fin 78) (1 : Fin 13) (0 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (15 : Fin 78) (1 : Fin 13) (5 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2082` (row). -/
theorem middleSource_h2082 :
    ((!((rowBit (I.sourceRows) 0 1 0 && rowBit (I.sourceRows) 0 1 6)) || ((allOneRankAtom (sourceRanks P) 0 == allOneRankAtom (sourceRanks P) 16)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (1 : Fin 13)
    (0 : Fin 13) (6 : Fin 13)
    (0 : Fin 78) (16 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (0 : Fin 78) (1 : Fin 13) (0 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (16 : Fin 78) (1 : Fin 13) (6 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2083` (row). -/
theorem middleSource_h2083 :
    ((!((rowBit (I.sourceRows) 0 1 0 && rowBit (I.sourceRows) 0 1 7)) || ((allOneRankAtom (sourceRanks P) 0 == allOneRankAtom (sourceRanks P) 17)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (1 : Fin 13)
    (0 : Fin 13) (7 : Fin 13)
    (0 : Fin 78) (17 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (0 : Fin 78) (1 : Fin 13) (0 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (17 : Fin 78) (1 : Fin 13) (7 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2084` (row). -/
theorem middleSource_h2084 :
    ((!((rowBit (I.sourceRows) 0 1 0 && rowBit (I.sourceRows) 0 1 8)) || ((allOneRankAtom (sourceRanks P) 0 == allOneRankAtom (sourceRanks P) 18)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (1 : Fin 13)
    (0 : Fin 13) (8 : Fin 13)
    (0 : Fin 78) (18 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (0 : Fin 78) (1 : Fin 13) (0 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (18 : Fin 78) (1 : Fin 13) (8 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2085` (row). -/
theorem middleSource_h2085 :
    ((!((rowBit (I.sourceRows) 0 1 0 && rowBit (I.sourceRows) 0 1 9)) || ((allOneRankAtom (sourceRanks P) 0 == allOneRankAtom (sourceRanks P) 19)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (1 : Fin 13)
    (0 : Fin 13) (9 : Fin 13)
    (0 : Fin 78) (19 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (0 : Fin 78) (1 : Fin 13) (0 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (19 : Fin 78) (1 : Fin 13) (9 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2086` (row). -/
theorem middleSource_h2086 :
    ((!((rowBit (I.sourceRows) 0 1 0 && rowBit (I.sourceRows) 0 1 10)) || ((allOneRankAtom (sourceRanks P) 0 == allOneRankAtom (sourceRanks P) 20)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (1 : Fin 13)
    (0 : Fin 13) (10 : Fin 13)
    (0 : Fin 78) (20 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (0 : Fin 78) (1 : Fin 13) (0 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (20 : Fin 78) (1 : Fin 13) (10 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2087` (row). -/
theorem middleSource_h2087 :
    ((!((rowBit (I.sourceRows) 0 1 0 && rowBit (I.sourceRows) 0 1 11)) || ((allOneRankAtom (sourceRanks P) 0 == allOneRankAtom (sourceRanks P) 21)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (1 : Fin 13)
    (0 : Fin 13) (11 : Fin 13)
    (0 : Fin 78) (21 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (0 : Fin 78) (1 : Fin 13) (0 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (21 : Fin 78) (1 : Fin 13) (11 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2088` (row). -/
theorem middleSource_h2088 :
    ((!((rowBit (I.sourceRows) 0 1 0 && rowBit (I.sourceRows) 0 1 12)) || ((allOneRankAtom (sourceRanks P) 0 == allOneRankAtom (sourceRanks P) 22)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (1 : Fin 13)
    (0 : Fin 13) (12 : Fin 13)
    (0 : Fin 78) (22 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (0 : Fin 78) (1 : Fin 13) (0 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (22 : Fin 78) (1 : Fin 13) (12 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2089` (row). -/
theorem middleSource_h2089 :
    ((!((rowBit (I.sourceRows) 0 1 2 && rowBit (I.sourceRows) 0 1 3)) || ((allOneRankAtom (sourceRanks P) 12 == allOneRankAtom (sourceRanks P) 13)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (1 : Fin 13)
    (2 : Fin 13) (3 : Fin 13)
    (12 : Fin 78) (13 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (12 : Fin 78) (1 : Fin 13) (2 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (13 : Fin 78) (1 : Fin 13) (3 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2090` (row). -/
theorem middleSource_h2090 :
    ((!((rowBit (I.sourceRows) 0 1 2 && rowBit (I.sourceRows) 0 1 4)) || ((allOneRankAtom (sourceRanks P) 12 == allOneRankAtom (sourceRanks P) 14)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (1 : Fin 13)
    (2 : Fin 13) (4 : Fin 13)
    (12 : Fin 78) (14 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (12 : Fin 78) (1 : Fin 13) (2 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (14 : Fin 78) (1 : Fin 13) (4 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2091` (row). -/
theorem middleSource_h2091 :
    ((!((rowBit (I.sourceRows) 0 1 2 && rowBit (I.sourceRows) 0 1 5)) || ((allOneRankAtom (sourceRanks P) 12 == allOneRankAtom (sourceRanks P) 15)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (1 : Fin 13)
    (2 : Fin 13) (5 : Fin 13)
    (12 : Fin 78) (15 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (12 : Fin 78) (1 : Fin 13) (2 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (15 : Fin 78) (1 : Fin 13) (5 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2092` (row). -/
theorem middleSource_h2092 :
    ((!((rowBit (I.sourceRows) 0 1 2 && rowBit (I.sourceRows) 0 1 6)) || ((allOneRankAtom (sourceRanks P) 12 == allOneRankAtom (sourceRanks P) 16)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (1 : Fin 13)
    (2 : Fin 13) (6 : Fin 13)
    (12 : Fin 78) (16 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (12 : Fin 78) (1 : Fin 13) (2 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (16 : Fin 78) (1 : Fin 13) (6 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2093` (row). -/
theorem middleSource_h2093 :
    ((!((rowBit (I.sourceRows) 0 1 2 && rowBit (I.sourceRows) 0 1 7)) || ((allOneRankAtom (sourceRanks P) 12 == allOneRankAtom (sourceRanks P) 17)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (1 : Fin 13)
    (2 : Fin 13) (7 : Fin 13)
    (12 : Fin 78) (17 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (12 : Fin 78) (1 : Fin 13) (2 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (17 : Fin 78) (1 : Fin 13) (7 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2094` (row). -/
theorem middleSource_h2094 :
    ((!((rowBit (I.sourceRows) 0 1 2 && rowBit (I.sourceRows) 0 1 8)) || ((allOneRankAtom (sourceRanks P) 12 == allOneRankAtom (sourceRanks P) 18)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (1 : Fin 13)
    (2 : Fin 13) (8 : Fin 13)
    (12 : Fin 78) (18 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (12 : Fin 78) (1 : Fin 13) (2 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (18 : Fin 78) (1 : Fin 13) (8 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2095` (row). -/
theorem middleSource_h2095 :
    ((!((rowBit (I.sourceRows) 0 1 2 && rowBit (I.sourceRows) 0 1 9)) || ((allOneRankAtom (sourceRanks P) 12 == allOneRankAtom (sourceRanks P) 19)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (1 : Fin 13)
    (2 : Fin 13) (9 : Fin 13)
    (12 : Fin 78) (19 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (12 : Fin 78) (1 : Fin 13) (2 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (19 : Fin 78) (1 : Fin 13) (9 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2096` (row). -/
theorem middleSource_h2096 :
    ((!((rowBit (I.sourceRows) 0 1 2 && rowBit (I.sourceRows) 0 1 10)) || ((allOneRankAtom (sourceRanks P) 12 == allOneRankAtom (sourceRanks P) 20)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (1 : Fin 13)
    (2 : Fin 13) (10 : Fin 13)
    (12 : Fin 78) (20 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (12 : Fin 78) (1 : Fin 13) (2 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (20 : Fin 78) (1 : Fin 13) (10 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2097` (row). -/
theorem middleSource_h2097 :
    ((!((rowBit (I.sourceRows) 0 1 2 && rowBit (I.sourceRows) 0 1 11)) || ((allOneRankAtom (sourceRanks P) 12 == allOneRankAtom (sourceRanks P) 21)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (1 : Fin 13)
    (2 : Fin 13) (11 : Fin 13)
    (12 : Fin 78) (21 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (12 : Fin 78) (1 : Fin 13) (2 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (21 : Fin 78) (1 : Fin 13) (11 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2098` (row). -/
theorem middleSource_h2098 :
    ((!((rowBit (I.sourceRows) 0 1 2 && rowBit (I.sourceRows) 0 1 12)) || ((allOneRankAtom (sourceRanks P) 12 == allOneRankAtom (sourceRanks P) 22)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (1 : Fin 13)
    (2 : Fin 13) (12 : Fin 13)
    (12 : Fin 78) (22 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (12 : Fin 78) (1 : Fin 13) (2 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (22 : Fin 78) (1 : Fin 13) (12 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2099` (row). -/
theorem middleSource_h2099 :
    ((!((rowBit (I.sourceRows) 0 1 3 && rowBit (I.sourceRows) 0 1 4)) || ((allOneRankAtom (sourceRanks P) 13 == allOneRankAtom (sourceRanks P) 14)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (1 : Fin 13)
    (3 : Fin 13) (4 : Fin 13)
    (13 : Fin 78) (14 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (13 : Fin 78) (1 : Fin 13) (3 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (14 : Fin 78) (1 : Fin 13) (4 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2100` (row). -/
theorem middleSource_h2100 :
    ((!((rowBit (I.sourceRows) 0 1 3 && rowBit (I.sourceRows) 0 1 5)) || ((allOneRankAtom (sourceRanks P) 13 == allOneRankAtom (sourceRanks P) 15)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (1 : Fin 13)
    (3 : Fin 13) (5 : Fin 13)
    (13 : Fin 78) (15 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (13 : Fin 78) (1 : Fin 13) (3 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (15 : Fin 78) (1 : Fin 13) (5 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2101` (row). -/
theorem middleSource_h2101 :
    ((!((rowBit (I.sourceRows) 0 1 3 && rowBit (I.sourceRows) 0 1 6)) || ((allOneRankAtom (sourceRanks P) 13 == allOneRankAtom (sourceRanks P) 16)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (1 : Fin 13)
    (3 : Fin 13) (6 : Fin 13)
    (13 : Fin 78) (16 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (13 : Fin 78) (1 : Fin 13) (3 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (16 : Fin 78) (1 : Fin 13) (6 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2102` (row). -/
theorem middleSource_h2102 :
    ((!((rowBit (I.sourceRows) 0 1 3 && rowBit (I.sourceRows) 0 1 7)) || ((allOneRankAtom (sourceRanks P) 13 == allOneRankAtom (sourceRanks P) 17)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (1 : Fin 13)
    (3 : Fin 13) (7 : Fin 13)
    (13 : Fin 78) (17 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (13 : Fin 78) (1 : Fin 13) (3 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (17 : Fin 78) (1 : Fin 13) (7 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2103` (row). -/
theorem middleSource_h2103 :
    ((!((rowBit (I.sourceRows) 0 1 3 && rowBit (I.sourceRows) 0 1 8)) || ((allOneRankAtom (sourceRanks P) 13 == allOneRankAtom (sourceRanks P) 18)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (1 : Fin 13)
    (3 : Fin 13) (8 : Fin 13)
    (13 : Fin 78) (18 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (13 : Fin 78) (1 : Fin 13) (3 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (18 : Fin 78) (1 : Fin 13) (8 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2104` (row). -/
theorem middleSource_h2104 :
    ((!((rowBit (I.sourceRows) 0 1 3 && rowBit (I.sourceRows) 0 1 9)) || ((allOneRankAtom (sourceRanks P) 13 == allOneRankAtom (sourceRanks P) 19)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (1 : Fin 13)
    (3 : Fin 13) (9 : Fin 13)
    (13 : Fin 78) (19 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (13 : Fin 78) (1 : Fin 13) (3 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (19 : Fin 78) (1 : Fin 13) (9 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2105` (row). -/
theorem middleSource_h2105 :
    ((!((rowBit (I.sourceRows) 0 1 3 && rowBit (I.sourceRows) 0 1 10)) || ((allOneRankAtom (sourceRanks P) 13 == allOneRankAtom (sourceRanks P) 20)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (1 : Fin 13)
    (3 : Fin 13) (10 : Fin 13)
    (13 : Fin 78) (20 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (13 : Fin 78) (1 : Fin 13) (3 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (20 : Fin 78) (1 : Fin 13) (10 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2106` (row). -/
theorem middleSource_h2106 :
    ((!((rowBit (I.sourceRows) 0 1 3 && rowBit (I.sourceRows) 0 1 11)) || ((allOneRankAtom (sourceRanks P) 13 == allOneRankAtom (sourceRanks P) 21)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (1 : Fin 13)
    (3 : Fin 13) (11 : Fin 13)
    (13 : Fin 78) (21 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (13 : Fin 78) (1 : Fin 13) (3 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (21 : Fin 78) (1 : Fin 13) (11 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2107` (row). -/
theorem middleSource_h2107 :
    ((!((rowBit (I.sourceRows) 0 1 3 && rowBit (I.sourceRows) 0 1 12)) || ((allOneRankAtom (sourceRanks P) 13 == allOneRankAtom (sourceRanks P) 22)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (1 : Fin 13)
    (3 : Fin 13) (12 : Fin 13)
    (13 : Fin 78) (22 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (13 : Fin 78) (1 : Fin 13) (3 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (22 : Fin 78) (1 : Fin 13) (12 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2108` (row). -/
theorem middleSource_h2108 :
    ((!((rowBit (I.sourceRows) 0 1 4 && rowBit (I.sourceRows) 0 1 5)) || ((allOneRankAtom (sourceRanks P) 14 == allOneRankAtom (sourceRanks P) 15)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (1 : Fin 13)
    (4 : Fin 13) (5 : Fin 13)
    (14 : Fin 78) (15 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (14 : Fin 78) (1 : Fin 13) (4 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (15 : Fin 78) (1 : Fin 13) (5 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2109` (row). -/
theorem middleSource_h2109 :
    ((!((rowBit (I.sourceRows) 0 1 4 && rowBit (I.sourceRows) 0 1 6)) || ((allOneRankAtom (sourceRanks P) 14 == allOneRankAtom (sourceRanks P) 16)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (1 : Fin 13)
    (4 : Fin 13) (6 : Fin 13)
    (14 : Fin 78) (16 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (14 : Fin 78) (1 : Fin 13) (4 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (16 : Fin 78) (1 : Fin 13) (6 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2110` (row). -/
theorem middleSource_h2110 :
    ((!((rowBit (I.sourceRows) 0 1 4 && rowBit (I.sourceRows) 0 1 7)) || ((allOneRankAtom (sourceRanks P) 14 == allOneRankAtom (sourceRanks P) 17)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (1 : Fin 13)
    (4 : Fin 13) (7 : Fin 13)
    (14 : Fin 78) (17 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (14 : Fin 78) (1 : Fin 13) (4 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (17 : Fin 78) (1 : Fin 13) (7 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2111` (row). -/
theorem middleSource_h2111 :
    ((!((rowBit (I.sourceRows) 0 1 4 && rowBit (I.sourceRows) 0 1 8)) || ((allOneRankAtom (sourceRanks P) 14 == allOneRankAtom (sourceRanks P) 18)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (1 : Fin 13)
    (4 : Fin 13) (8 : Fin 13)
    (14 : Fin 78) (18 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (14 : Fin 78) (1 : Fin 13) (4 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (18 : Fin 78) (1 : Fin 13) (8 : Fin 13) (by decide))

end

end ATailExactFiveCard13AllOneSourceIngressScratch
end Problem97
