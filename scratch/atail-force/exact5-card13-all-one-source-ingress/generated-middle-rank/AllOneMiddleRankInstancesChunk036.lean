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

/-- Candidate middle source assertion `h2304` (row). -/
theorem middleSource_h2304 :
    ((!((rowBit (I.sourceRows) 0 4 3 && rowBit (I.sourceRows) 0 4 12)) || ((allOneRankAtom (sourceRanks P) 33 == allOneRankAtom (sourceRanks P) 49)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (4 : Fin 13)
    (3 : Fin 13) (12 : Fin 13)
    (33 : Fin 78) (49 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (33 : Fin 78) (4 : Fin 13) (3 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (49 : Fin 78) (4 : Fin 13) (12 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2305` (row). -/
theorem middleSource_h2305 :
    ((!((rowBit (I.sourceRows) 0 4 5 && rowBit (I.sourceRows) 0 4 9)) || ((allOneRankAtom (sourceRanks P) 42 == allOneRankAtom (sourceRanks P) 46)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (4 : Fin 13)
    (5 : Fin 13) (9 : Fin 13)
    (42 : Fin 78) (46 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (42 : Fin 78) (4 : Fin 13) (5 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (46 : Fin 78) (4 : Fin 13) (9 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2306` (row). -/
theorem middleSource_h2306 :
    ((!((rowBit (I.sourceRows) 0 4 5 && rowBit (I.sourceRows) 0 4 10)) || ((allOneRankAtom (sourceRanks P) 42 == allOneRankAtom (sourceRanks P) 47)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (4 : Fin 13)
    (5 : Fin 13) (10 : Fin 13)
    (42 : Fin 78) (47 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (42 : Fin 78) (4 : Fin 13) (5 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (47 : Fin 78) (4 : Fin 13) (10 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2307` (row). -/
theorem middleSource_h2307 :
    ((!((rowBit (I.sourceRows) 0 4 5 && rowBit (I.sourceRows) 0 4 11)) || ((allOneRankAtom (sourceRanks P) 42 == allOneRankAtom (sourceRanks P) 48)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (4 : Fin 13)
    (5 : Fin 13) (11 : Fin 13)
    (42 : Fin 78) (48 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (42 : Fin 78) (4 : Fin 13) (5 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (48 : Fin 78) (4 : Fin 13) (11 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2308` (row). -/
theorem middleSource_h2308 :
    ((!((rowBit (I.sourceRows) 0 4 5 && rowBit (I.sourceRows) 0 4 12)) || ((allOneRankAtom (sourceRanks P) 42 == allOneRankAtom (sourceRanks P) 49)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (4 : Fin 13)
    (5 : Fin 13) (12 : Fin 13)
    (42 : Fin 78) (49 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (42 : Fin 78) (4 : Fin 13) (5 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (49 : Fin 78) (4 : Fin 13) (12 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2309` (row). -/
theorem middleSource_h2309 :
    ((!((rowBit (I.sourceRows) 0 4 6 && rowBit (I.sourceRows) 0 4 9)) || ((allOneRankAtom (sourceRanks P) 43 == allOneRankAtom (sourceRanks P) 46)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (4 : Fin 13)
    (6 : Fin 13) (9 : Fin 13)
    (43 : Fin 78) (46 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (43 : Fin 78) (4 : Fin 13) (6 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (46 : Fin 78) (4 : Fin 13) (9 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2310` (row). -/
theorem middleSource_h2310 :
    ((!((rowBit (I.sourceRows) 0 4 6 && rowBit (I.sourceRows) 0 4 10)) || ((allOneRankAtom (sourceRanks P) 43 == allOneRankAtom (sourceRanks P) 47)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (4 : Fin 13)
    (6 : Fin 13) (10 : Fin 13)
    (43 : Fin 78) (47 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (43 : Fin 78) (4 : Fin 13) (6 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (47 : Fin 78) (4 : Fin 13) (10 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2311` (row). -/
theorem middleSource_h2311 :
    ((!((rowBit (I.sourceRows) 0 4 6 && rowBit (I.sourceRows) 0 4 11)) || ((allOneRankAtom (sourceRanks P) 43 == allOneRankAtom (sourceRanks P) 48)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (4 : Fin 13)
    (6 : Fin 13) (11 : Fin 13)
    (43 : Fin 78) (48 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (43 : Fin 78) (4 : Fin 13) (6 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (48 : Fin 78) (4 : Fin 13) (11 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2312` (row). -/
theorem middleSource_h2312 :
    ((!((rowBit (I.sourceRows) 0 4 6 && rowBit (I.sourceRows) 0 4 12)) || ((allOneRankAtom (sourceRanks P) 43 == allOneRankAtom (sourceRanks P) 49)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (4 : Fin 13)
    (6 : Fin 13) (12 : Fin 13)
    (43 : Fin 78) (49 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (43 : Fin 78) (4 : Fin 13) (6 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (49 : Fin 78) (4 : Fin 13) (12 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2313` (row). -/
theorem middleSource_h2313 :
    ((!((rowBit (I.sourceRows) 0 4 7 && rowBit (I.sourceRows) 0 4 9)) || ((allOneRankAtom (sourceRanks P) 44 == allOneRankAtom (sourceRanks P) 46)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (4 : Fin 13)
    (7 : Fin 13) (9 : Fin 13)
    (44 : Fin 78) (46 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (44 : Fin 78) (4 : Fin 13) (7 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (46 : Fin 78) (4 : Fin 13) (9 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2314` (row). -/
theorem middleSource_h2314 :
    ((!((rowBit (I.sourceRows) 0 4 7 && rowBit (I.sourceRows) 0 4 10)) || ((allOneRankAtom (sourceRanks P) 44 == allOneRankAtom (sourceRanks P) 47)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (4 : Fin 13)
    (7 : Fin 13) (10 : Fin 13)
    (44 : Fin 78) (47 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (44 : Fin 78) (4 : Fin 13) (7 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (47 : Fin 78) (4 : Fin 13) (10 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2315` (row). -/
theorem middleSource_h2315 :
    ((!((rowBit (I.sourceRows) 0 4 7 && rowBit (I.sourceRows) 0 4 11)) || ((allOneRankAtom (sourceRanks P) 44 == allOneRankAtom (sourceRanks P) 48)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (4 : Fin 13)
    (7 : Fin 13) (11 : Fin 13)
    (44 : Fin 78) (48 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (44 : Fin 78) (4 : Fin 13) (7 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (48 : Fin 78) (4 : Fin 13) (11 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2316` (row). -/
theorem middleSource_h2316 :
    ((!((rowBit (I.sourceRows) 0 4 7 && rowBit (I.sourceRows) 0 4 12)) || ((allOneRankAtom (sourceRanks P) 44 == allOneRankAtom (sourceRanks P) 49)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (4 : Fin 13)
    (7 : Fin 13) (12 : Fin 13)
    (44 : Fin 78) (49 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (44 : Fin 78) (4 : Fin 13) (7 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (49 : Fin 78) (4 : Fin 13) (12 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2317` (row). -/
theorem middleSource_h2317 :
    ((!((rowBit (I.sourceRows) 0 4 8 && rowBit (I.sourceRows) 0 4 9)) || ((allOneRankAtom (sourceRanks P) 45 == allOneRankAtom (sourceRanks P) 46)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (4 : Fin 13)
    (8 : Fin 13) (9 : Fin 13)
    (45 : Fin 78) (46 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (45 : Fin 78) (4 : Fin 13) (8 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (46 : Fin 78) (4 : Fin 13) (9 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2318` (row). -/
theorem middleSource_h2318 :
    ((!((rowBit (I.sourceRows) 0 4 8 && rowBit (I.sourceRows) 0 4 10)) || ((allOneRankAtom (sourceRanks P) 45 == allOneRankAtom (sourceRanks P) 47)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (4 : Fin 13)
    (8 : Fin 13) (10 : Fin 13)
    (45 : Fin 78) (47 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (45 : Fin 78) (4 : Fin 13) (8 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (47 : Fin 78) (4 : Fin 13) (10 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2319` (row). -/
theorem middleSource_h2319 :
    ((!((rowBit (I.sourceRows) 0 4 8 && rowBit (I.sourceRows) 0 4 11)) || ((allOneRankAtom (sourceRanks P) 45 == allOneRankAtom (sourceRanks P) 48)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (4 : Fin 13)
    (8 : Fin 13) (11 : Fin 13)
    (45 : Fin 78) (48 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (45 : Fin 78) (4 : Fin 13) (8 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (48 : Fin 78) (4 : Fin 13) (11 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2320` (row). -/
theorem middleSource_h2320 :
    ((!((rowBit (I.sourceRows) 0 4 8 && rowBit (I.sourceRows) 0 4 12)) || ((allOneRankAtom (sourceRanks P) 45 == allOneRankAtom (sourceRanks P) 49)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (4 : Fin 13)
    (8 : Fin 13) (12 : Fin 13)
    (45 : Fin 78) (49 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (45 : Fin 78) (4 : Fin 13) (8 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (49 : Fin 78) (4 : Fin 13) (12 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2321` (row). -/
theorem middleSource_h2321 :
    ((!((rowBit (I.sourceRows) 0 4 9 && rowBit (I.sourceRows) 0 4 10)) || ((allOneRankAtom (sourceRanks P) 46 == allOneRankAtom (sourceRanks P) 47)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (4 : Fin 13)
    (9 : Fin 13) (10 : Fin 13)
    (46 : Fin 78) (47 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (46 : Fin 78) (4 : Fin 13) (9 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (47 : Fin 78) (4 : Fin 13) (10 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2322` (row). -/
theorem middleSource_h2322 :
    ((!((rowBit (I.sourceRows) 0 4 9 && rowBit (I.sourceRows) 0 4 11)) || ((allOneRankAtom (sourceRanks P) 46 == allOneRankAtom (sourceRanks P) 48)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (4 : Fin 13)
    (9 : Fin 13) (11 : Fin 13)
    (46 : Fin 78) (48 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (46 : Fin 78) (4 : Fin 13) (9 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (48 : Fin 78) (4 : Fin 13) (11 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2323` (row). -/
theorem middleSource_h2323 :
    ((!((rowBit (I.sourceRows) 0 4 9 && rowBit (I.sourceRows) 0 4 12)) || ((allOneRankAtom (sourceRanks P) 46 == allOneRankAtom (sourceRanks P) 49)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (4 : Fin 13)
    (9 : Fin 13) (12 : Fin 13)
    (46 : Fin 78) (49 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (46 : Fin 78) (4 : Fin 13) (9 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (49 : Fin 78) (4 : Fin 13) (12 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2324` (row). -/
theorem middleSource_h2324 :
    ((!((rowBit (I.sourceRows) 0 4 10 && rowBit (I.sourceRows) 0 4 11)) || ((allOneRankAtom (sourceRanks P) 47 == allOneRankAtom (sourceRanks P) 48)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (4 : Fin 13)
    (10 : Fin 13) (11 : Fin 13)
    (47 : Fin 78) (48 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (47 : Fin 78) (4 : Fin 13) (10 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (48 : Fin 78) (4 : Fin 13) (11 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2325` (row). -/
theorem middleSource_h2325 :
    ((!((rowBit (I.sourceRows) 0 4 10 && rowBit (I.sourceRows) 0 4 12)) || ((allOneRankAtom (sourceRanks P) 47 == allOneRankAtom (sourceRanks P) 49)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (4 : Fin 13)
    (10 : Fin 13) (12 : Fin 13)
    (47 : Fin 78) (49 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (47 : Fin 78) (4 : Fin 13) (10 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (49 : Fin 78) (4 : Fin 13) (12 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2326` (row). -/
theorem middleSource_h2326 :
    ((!((rowBit (I.sourceRows) 0 4 11 && rowBit (I.sourceRows) 0 4 12)) || ((allOneRankAtom (sourceRanks P) 48 == allOneRankAtom (sourceRanks P) 49)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (4 : Fin 13)
    (11 : Fin 13) (12 : Fin 13)
    (48 : Fin 78) (49 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (48 : Fin 78) (4 : Fin 13) (11 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (49 : Fin 78) (4 : Fin 13) (12 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2327` (row). -/
theorem middleSource_h2327 :
    ((!((rowBit (I.sourceRows) 0 5 0 && rowBit (I.sourceRows) 0 5 1)) || ((allOneRankAtom (sourceRanks P) 4 == allOneRankAtom (sourceRanks P) 15)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (5 : Fin 13)
    (0 : Fin 13) (1 : Fin 13)
    (4 : Fin 78) (15 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (4 : Fin 78) (5 : Fin 13) (0 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (15 : Fin 78) (5 : Fin 13) (1 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2328` (row). -/
theorem middleSource_h2328 :
    ((!((rowBit (I.sourceRows) 0 5 0 && rowBit (I.sourceRows) 0 5 2)) || ((allOneRankAtom (sourceRanks P) 4 == allOneRankAtom (sourceRanks P) 25)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (5 : Fin 13)
    (0 : Fin 13) (2 : Fin 13)
    (4 : Fin 78) (25 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (4 : Fin 78) (5 : Fin 13) (0 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (25 : Fin 78) (5 : Fin 13) (2 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2329` (row). -/
theorem middleSource_h2329 :
    ((!((rowBit (I.sourceRows) 0 5 0 && rowBit (I.sourceRows) 0 5 3)) || ((allOneRankAtom (sourceRanks P) 4 == allOneRankAtom (sourceRanks P) 34)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (5 : Fin 13)
    (0 : Fin 13) (3 : Fin 13)
    (4 : Fin 78) (34 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (4 : Fin 78) (5 : Fin 13) (0 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (34 : Fin 78) (5 : Fin 13) (3 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2330` (row). -/
theorem middleSource_h2330 :
    ((!((rowBit (I.sourceRows) 0 5 0 && rowBit (I.sourceRows) 0 5 4)) || ((allOneRankAtom (sourceRanks P) 4 == allOneRankAtom (sourceRanks P) 42)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (5 : Fin 13)
    (0 : Fin 13) (4 : Fin 13)
    (4 : Fin 78) (42 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (4 : Fin 78) (5 : Fin 13) (0 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (42 : Fin 78) (5 : Fin 13) (4 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2331` (row). -/
theorem middleSource_h2331 :
    ((!((rowBit (I.sourceRows) 0 5 0 && rowBit (I.sourceRows) 0 5 6)) || ((allOneRankAtom (sourceRanks P) 4 == allOneRankAtom (sourceRanks P) 50)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (5 : Fin 13)
    (0 : Fin 13) (6 : Fin 13)
    (4 : Fin 78) (50 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (4 : Fin 78) (5 : Fin 13) (0 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (50 : Fin 78) (5 : Fin 13) (6 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2332` (row). -/
theorem middleSource_h2332 :
    ((!((rowBit (I.sourceRows) 0 5 0 && rowBit (I.sourceRows) 0 5 7)) || ((allOneRankAtom (sourceRanks P) 4 == allOneRankAtom (sourceRanks P) 51)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (5 : Fin 13)
    (0 : Fin 13) (7 : Fin 13)
    (4 : Fin 78) (51 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (4 : Fin 78) (5 : Fin 13) (0 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (51 : Fin 78) (5 : Fin 13) (7 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2333` (row). -/
theorem middleSource_h2333 :
    ((!((rowBit (I.sourceRows) 0 5 0 && rowBit (I.sourceRows) 0 5 8)) || ((allOneRankAtom (sourceRanks P) 4 == allOneRankAtom (sourceRanks P) 52)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (5 : Fin 13)
    (0 : Fin 13) (8 : Fin 13)
    (4 : Fin 78) (52 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (4 : Fin 78) (5 : Fin 13) (0 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (52 : Fin 78) (5 : Fin 13) (8 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2334` (row). -/
theorem middleSource_h2334 :
    ((!((rowBit (I.sourceRows) 0 5 0 && rowBit (I.sourceRows) 0 5 9)) || ((allOneRankAtom (sourceRanks P) 4 == allOneRankAtom (sourceRanks P) 53)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (5 : Fin 13)
    (0 : Fin 13) (9 : Fin 13)
    (4 : Fin 78) (53 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (4 : Fin 78) (5 : Fin 13) (0 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (53 : Fin 78) (5 : Fin 13) (9 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2335` (row). -/
theorem middleSource_h2335 :
    ((!((rowBit (I.sourceRows) 0 5 0 && rowBit (I.sourceRows) 0 5 10)) || ((allOneRankAtom (sourceRanks P) 4 == allOneRankAtom (sourceRanks P) 54)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (5 : Fin 13)
    (0 : Fin 13) (10 : Fin 13)
    (4 : Fin 78) (54 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (4 : Fin 78) (5 : Fin 13) (0 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (54 : Fin 78) (5 : Fin 13) (10 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2336` (row). -/
theorem middleSource_h2336 :
    ((!((rowBit (I.sourceRows) 0 5 0 && rowBit (I.sourceRows) 0 5 11)) || ((allOneRankAtom (sourceRanks P) 4 == allOneRankAtom (sourceRanks P) 55)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (5 : Fin 13)
    (0 : Fin 13) (11 : Fin 13)
    (4 : Fin 78) (55 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (4 : Fin 78) (5 : Fin 13) (0 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (55 : Fin 78) (5 : Fin 13) (11 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2337` (row). -/
theorem middleSource_h2337 :
    ((!((rowBit (I.sourceRows) 0 5 0 && rowBit (I.sourceRows) 0 5 12)) || ((allOneRankAtom (sourceRanks P) 4 == allOneRankAtom (sourceRanks P) 56)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (5 : Fin 13)
    (0 : Fin 13) (12 : Fin 13)
    (4 : Fin 78) (56 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (4 : Fin 78) (5 : Fin 13) (0 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (56 : Fin 78) (5 : Fin 13) (12 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2338` (row). -/
theorem middleSource_h2338 :
    ((!((rowBit (I.sourceRows) 0 5 1 && rowBit (I.sourceRows) 0 5 2)) || ((allOneRankAtom (sourceRanks P) 15 == allOneRankAtom (sourceRanks P) 25)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (5 : Fin 13)
    (1 : Fin 13) (2 : Fin 13)
    (15 : Fin 78) (25 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (15 : Fin 78) (5 : Fin 13) (1 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (25 : Fin 78) (5 : Fin 13) (2 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2339` (row). -/
theorem middleSource_h2339 :
    ((!((rowBit (I.sourceRows) 0 5 1 && rowBit (I.sourceRows) 0 5 3)) || ((allOneRankAtom (sourceRanks P) 15 == allOneRankAtom (sourceRanks P) 34)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (5 : Fin 13)
    (1 : Fin 13) (3 : Fin 13)
    (15 : Fin 78) (34 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (15 : Fin 78) (5 : Fin 13) (1 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (34 : Fin 78) (5 : Fin 13) (3 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2340` (row). -/
theorem middleSource_h2340 :
    ((!((rowBit (I.sourceRows) 0 5 1 && rowBit (I.sourceRows) 0 5 4)) || ((allOneRankAtom (sourceRanks P) 15 == allOneRankAtom (sourceRanks P) 42)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (5 : Fin 13)
    (1 : Fin 13) (4 : Fin 13)
    (15 : Fin 78) (42 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (15 : Fin 78) (5 : Fin 13) (1 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (42 : Fin 78) (5 : Fin 13) (4 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2341` (row). -/
theorem middleSource_h2341 :
    ((!((rowBit (I.sourceRows) 0 5 1 && rowBit (I.sourceRows) 0 5 6)) || ((allOneRankAtom (sourceRanks P) 15 == allOneRankAtom (sourceRanks P) 50)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (5 : Fin 13)
    (1 : Fin 13) (6 : Fin 13)
    (15 : Fin 78) (50 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (15 : Fin 78) (5 : Fin 13) (1 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (50 : Fin 78) (5 : Fin 13) (6 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2342` (row). -/
theorem middleSource_h2342 :
    ((!((rowBit (I.sourceRows) 0 5 1 && rowBit (I.sourceRows) 0 5 7)) || ((allOneRankAtom (sourceRanks P) 15 == allOneRankAtom (sourceRanks P) 51)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (5 : Fin 13)
    (1 : Fin 13) (7 : Fin 13)
    (15 : Fin 78) (51 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (15 : Fin 78) (5 : Fin 13) (1 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (51 : Fin 78) (5 : Fin 13) (7 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2343` (row). -/
theorem middleSource_h2343 :
    ((!((rowBit (I.sourceRows) 0 5 1 && rowBit (I.sourceRows) 0 5 8)) || ((allOneRankAtom (sourceRanks P) 15 == allOneRankAtom (sourceRanks P) 52)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (5 : Fin 13)
    (1 : Fin 13) (8 : Fin 13)
    (15 : Fin 78) (52 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (15 : Fin 78) (5 : Fin 13) (1 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (52 : Fin 78) (5 : Fin 13) (8 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2344` (row). -/
theorem middleSource_h2344 :
    ((!((rowBit (I.sourceRows) 0 5 1 && rowBit (I.sourceRows) 0 5 9)) || ((allOneRankAtom (sourceRanks P) 15 == allOneRankAtom (sourceRanks P) 53)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (5 : Fin 13)
    (1 : Fin 13) (9 : Fin 13)
    (15 : Fin 78) (53 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (15 : Fin 78) (5 : Fin 13) (1 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (53 : Fin 78) (5 : Fin 13) (9 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2345` (row). -/
theorem middleSource_h2345 :
    ((!((rowBit (I.sourceRows) 0 5 1 && rowBit (I.sourceRows) 0 5 10)) || ((allOneRankAtom (sourceRanks P) 15 == allOneRankAtom (sourceRanks P) 54)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (5 : Fin 13)
    (1 : Fin 13) (10 : Fin 13)
    (15 : Fin 78) (54 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (15 : Fin 78) (5 : Fin 13) (1 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (54 : Fin 78) (5 : Fin 13) (10 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2346` (row). -/
theorem middleSource_h2346 :
    ((!((rowBit (I.sourceRows) 0 5 1 && rowBit (I.sourceRows) 0 5 11)) || ((allOneRankAtom (sourceRanks P) 15 == allOneRankAtom (sourceRanks P) 55)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (5 : Fin 13)
    (1 : Fin 13) (11 : Fin 13)
    (15 : Fin 78) (55 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (15 : Fin 78) (5 : Fin 13) (1 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (55 : Fin 78) (5 : Fin 13) (11 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2347` (row). -/
theorem middleSource_h2347 :
    ((!((rowBit (I.sourceRows) 0 5 1 && rowBit (I.sourceRows) 0 5 12)) || ((allOneRankAtom (sourceRanks P) 15 == allOneRankAtom (sourceRanks P) 56)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (5 : Fin 13)
    (1 : Fin 13) (12 : Fin 13)
    (15 : Fin 78) (56 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (15 : Fin 78) (5 : Fin 13) (1 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (56 : Fin 78) (5 : Fin 13) (12 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2348` (row). -/
theorem middleSource_h2348 :
    ((!((rowBit (I.sourceRows) 0 5 2 && rowBit (I.sourceRows) 0 5 3)) || ((allOneRankAtom (sourceRanks P) 25 == allOneRankAtom (sourceRanks P) 34)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (5 : Fin 13)
    (2 : Fin 13) (3 : Fin 13)
    (25 : Fin 78) (34 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (25 : Fin 78) (5 : Fin 13) (2 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (34 : Fin 78) (5 : Fin 13) (3 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2349` (row). -/
theorem middleSource_h2349 :
    ((!((rowBit (I.sourceRows) 0 5 2 && rowBit (I.sourceRows) 0 5 4)) || ((allOneRankAtom (sourceRanks P) 25 == allOneRankAtom (sourceRanks P) 42)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (5 : Fin 13)
    (2 : Fin 13) (4 : Fin 13)
    (25 : Fin 78) (42 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (25 : Fin 78) (5 : Fin 13) (2 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (42 : Fin 78) (5 : Fin 13) (4 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2350` (row). -/
theorem middleSource_h2350 :
    ((!((rowBit (I.sourceRows) 0 5 2 && rowBit (I.sourceRows) 0 5 6)) || ((allOneRankAtom (sourceRanks P) 25 == allOneRankAtom (sourceRanks P) 50)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (5 : Fin 13)
    (2 : Fin 13) (6 : Fin 13)
    (25 : Fin 78) (50 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (25 : Fin 78) (5 : Fin 13) (2 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (50 : Fin 78) (5 : Fin 13) (6 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2351` (row). -/
theorem middleSource_h2351 :
    ((!((rowBit (I.sourceRows) 0 5 2 && rowBit (I.sourceRows) 0 5 7)) || ((allOneRankAtom (sourceRanks P) 25 == allOneRankAtom (sourceRanks P) 51)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (5 : Fin 13)
    (2 : Fin 13) (7 : Fin 13)
    (25 : Fin 78) (51 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (25 : Fin 78) (5 : Fin 13) (2 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (51 : Fin 78) (5 : Fin 13) (7 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2352` (row). -/
theorem middleSource_h2352 :
    ((!((rowBit (I.sourceRows) 0 5 2 && rowBit (I.sourceRows) 0 5 8)) || ((allOneRankAtom (sourceRanks P) 25 == allOneRankAtom (sourceRanks P) 52)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (5 : Fin 13)
    (2 : Fin 13) (8 : Fin 13)
    (25 : Fin 78) (52 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (25 : Fin 78) (5 : Fin 13) (2 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (52 : Fin 78) (5 : Fin 13) (8 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2353` (row). -/
theorem middleSource_h2353 :
    ((!((rowBit (I.sourceRows) 0 5 2 && rowBit (I.sourceRows) 0 5 9)) || ((allOneRankAtom (sourceRanks P) 25 == allOneRankAtom (sourceRanks P) 53)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (5 : Fin 13)
    (2 : Fin 13) (9 : Fin 13)
    (25 : Fin 78) (53 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (25 : Fin 78) (5 : Fin 13) (2 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (53 : Fin 78) (5 : Fin 13) (9 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2354` (row). -/
theorem middleSource_h2354 :
    ((!((rowBit (I.sourceRows) 0 5 2 && rowBit (I.sourceRows) 0 5 10)) || ((allOneRankAtom (sourceRanks P) 25 == allOneRankAtom (sourceRanks P) 54)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (5 : Fin 13)
    (2 : Fin 13) (10 : Fin 13)
    (25 : Fin 78) (54 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (25 : Fin 78) (5 : Fin 13) (2 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (54 : Fin 78) (5 : Fin 13) (10 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2355` (row). -/
theorem middleSource_h2355 :
    ((!((rowBit (I.sourceRows) 0 5 2 && rowBit (I.sourceRows) 0 5 11)) || ((allOneRankAtom (sourceRanks P) 25 == allOneRankAtom (sourceRanks P) 55)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (5 : Fin 13)
    (2 : Fin 13) (11 : Fin 13)
    (25 : Fin 78) (55 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (25 : Fin 78) (5 : Fin 13) (2 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (55 : Fin 78) (5 : Fin 13) (11 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2356` (row). -/
theorem middleSource_h2356 :
    ((!((rowBit (I.sourceRows) 0 5 2 && rowBit (I.sourceRows) 0 5 12)) || ((allOneRankAtom (sourceRanks P) 25 == allOneRankAtom (sourceRanks P) 56)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (5 : Fin 13)
    (2 : Fin 13) (12 : Fin 13)
    (25 : Fin 78) (56 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (25 : Fin 78) (5 : Fin 13) (2 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (56 : Fin 78) (5 : Fin 13) (12 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2357` (row). -/
theorem middleSource_h2357 :
    ((!((rowBit (I.sourceRows) 0 5 3 && rowBit (I.sourceRows) 0 5 4)) || ((allOneRankAtom (sourceRanks P) 34 == allOneRankAtom (sourceRanks P) 42)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (5 : Fin 13)
    (3 : Fin 13) (4 : Fin 13)
    (34 : Fin 78) (42 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (34 : Fin 78) (5 : Fin 13) (3 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (42 : Fin 78) (5 : Fin 13) (4 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2358` (row). -/
theorem middleSource_h2358 :
    ((!((rowBit (I.sourceRows) 0 5 3 && rowBit (I.sourceRows) 0 5 6)) || ((allOneRankAtom (sourceRanks P) 34 == allOneRankAtom (sourceRanks P) 50)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (5 : Fin 13)
    (3 : Fin 13) (6 : Fin 13)
    (34 : Fin 78) (50 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (34 : Fin 78) (5 : Fin 13) (3 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (50 : Fin 78) (5 : Fin 13) (6 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2359` (row). -/
theorem middleSource_h2359 :
    ((!((rowBit (I.sourceRows) 0 5 3 && rowBit (I.sourceRows) 0 5 7)) || ((allOneRankAtom (sourceRanks P) 34 == allOneRankAtom (sourceRanks P) 51)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (5 : Fin 13)
    (3 : Fin 13) (7 : Fin 13)
    (34 : Fin 78) (51 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (34 : Fin 78) (5 : Fin 13) (3 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (51 : Fin 78) (5 : Fin 13) (7 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2360` (row). -/
theorem middleSource_h2360 :
    ((!((rowBit (I.sourceRows) 0 5 3 && rowBit (I.sourceRows) 0 5 8)) || ((allOneRankAtom (sourceRanks P) 34 == allOneRankAtom (sourceRanks P) 52)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (5 : Fin 13)
    (3 : Fin 13) (8 : Fin 13)
    (34 : Fin 78) (52 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (34 : Fin 78) (5 : Fin 13) (3 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (52 : Fin 78) (5 : Fin 13) (8 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2361` (row). -/
theorem middleSource_h2361 :
    ((!((rowBit (I.sourceRows) 0 5 3 && rowBit (I.sourceRows) 0 5 9)) || ((allOneRankAtom (sourceRanks P) 34 == allOneRankAtom (sourceRanks P) 53)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (5 : Fin 13)
    (3 : Fin 13) (9 : Fin 13)
    (34 : Fin 78) (53 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (34 : Fin 78) (5 : Fin 13) (3 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (53 : Fin 78) (5 : Fin 13) (9 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2362` (row). -/
theorem middleSource_h2362 :
    ((!((rowBit (I.sourceRows) 0 5 3 && rowBit (I.sourceRows) 0 5 10)) || ((allOneRankAtom (sourceRanks P) 34 == allOneRankAtom (sourceRanks P) 54)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (5 : Fin 13)
    (3 : Fin 13) (10 : Fin 13)
    (34 : Fin 78) (54 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (34 : Fin 78) (5 : Fin 13) (3 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (54 : Fin 78) (5 : Fin 13) (10 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2363` (row). -/
theorem middleSource_h2363 :
    ((!((rowBit (I.sourceRows) 0 5 3 && rowBit (I.sourceRows) 0 5 11)) || ((allOneRankAtom (sourceRanks P) 34 == allOneRankAtom (sourceRanks P) 55)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (5 : Fin 13)
    (3 : Fin 13) (11 : Fin 13)
    (34 : Fin 78) (55 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (34 : Fin 78) (5 : Fin 13) (3 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (55 : Fin 78) (5 : Fin 13) (11 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2364` (row). -/
theorem middleSource_h2364 :
    ((!((rowBit (I.sourceRows) 0 5 3 && rowBit (I.sourceRows) 0 5 12)) || ((allOneRankAtom (sourceRanks P) 34 == allOneRankAtom (sourceRanks P) 56)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (5 : Fin 13)
    (3 : Fin 13) (12 : Fin 13)
    (34 : Fin 78) (56 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (34 : Fin 78) (5 : Fin 13) (3 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (56 : Fin 78) (5 : Fin 13) (12 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2365` (row). -/
theorem middleSource_h2365 :
    ((!((rowBit (I.sourceRows) 0 5 4 && rowBit (I.sourceRows) 0 5 6)) || ((allOneRankAtom (sourceRanks P) 42 == allOneRankAtom (sourceRanks P) 50)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (5 : Fin 13)
    (4 : Fin 13) (6 : Fin 13)
    (42 : Fin 78) (50 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (42 : Fin 78) (5 : Fin 13) (4 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (50 : Fin 78) (5 : Fin 13) (6 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2366` (row). -/
theorem middleSource_h2366 :
    ((!((rowBit (I.sourceRows) 0 5 4 && rowBit (I.sourceRows) 0 5 7)) || ((allOneRankAtom (sourceRanks P) 42 == allOneRankAtom (sourceRanks P) 51)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (5 : Fin 13)
    (4 : Fin 13) (7 : Fin 13)
    (42 : Fin 78) (51 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (42 : Fin 78) (5 : Fin 13) (4 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (51 : Fin 78) (5 : Fin 13) (7 : Fin 13) (by decide))

/-- Candidate middle source assertion `h2367` (row). -/
theorem middleSource_h2367 :
    ((!((rowBit (I.sourceRows) 0 5 4 && rowBit (I.sourceRows) 0 5 8)) || ((allOneRankAtom (sourceRanks P) 42 == allOneRankAtom (sourceRanks P) 52)))) = true := by
  exact allOne_row_rank_guard I
    (0 : Fin 3) (5 : Fin 13)
    (4 : Fin 13) (8 : Fin 13)
    (42 : Fin 78) (52 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (42 : Fin 78) (5 : Fin 13) (4 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (52 : Fin 78) (5 : Fin 13) (8 : Fin 13) (by decide))

end

end ATailExactFiveCard13AllOneSourceIngressScratch
end Problem97
