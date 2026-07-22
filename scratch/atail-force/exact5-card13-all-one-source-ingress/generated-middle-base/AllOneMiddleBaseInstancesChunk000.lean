/-
Generated from the middle source core whose original Lean-emitted CNF and
LRAT endpoint have been kernel checked.  These source-faithful adapters prove
the individual Boolean assertions consumed by that verified endpoint.
-/
import AllOnePacketFacts

/-!
# Candidate middle-orbit base geometry instances

Generated specializations of source-faithful finite row geometry schemas.
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

/-- Candidate middle source assertion `h0000` (center). -/
theorem middleSource_h0000 :
    (!(rowBit (I.sourceRows) 0 0 0)) = true := by
  exact allOne_row_center_excluded I (0 : Fin 3) (0 : Fin 13)

/-- Candidate middle source assertion `h0001` (card). -/
theorem middleSource_h0001 :
    ((((bif rowBit (I.sourceRows) 0 0 0 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 0 0 1 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 0 0 2 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 0 0 3 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 0 0 4 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 0 0 5 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 0 0 6 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 0 0 7 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 0 0 8 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 0 0 9 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 0 0 10 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 0 0 11 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 0 0 12 then 1#4 else 0#4)) == 4#4)) = true := by
  simpa only [allOneBitCount13] using
    allOne_row_card_eq_four I (0 : Fin 3) (0 : Fin 13)

/-- Candidate middle source assertion `h0002` (center). -/
theorem middleSource_h0002 :
    (!(rowBit (I.sourceRows) 0 1 1)) = true := by
  exact allOne_row_center_excluded I (0 : Fin 3) (1 : Fin 13)

/-- Candidate middle source assertion `h0003` (card). -/
theorem middleSource_h0003 :
    ((((bif rowBit (I.sourceRows) 0 1 0 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 0 1 1 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 0 1 2 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 0 1 3 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 0 1 4 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 0 1 5 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 0 1 6 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 0 1 7 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 0 1 8 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 0 1 9 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 0 1 10 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 0 1 11 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 0 1 12 then 1#4 else 0#4)) == 4#4)) = true := by
  simpa only [allOneBitCount13] using
    allOne_row_card_eq_four I (0 : Fin 3) (1 : Fin 13)

/-- Candidate middle source assertion `h0004` (center). -/
theorem middleSource_h0004 :
    (!(rowBit (I.sourceRows) 0 2 2)) = true := by
  exact allOne_row_center_excluded I (0 : Fin 3) (2 : Fin 13)

/-- Candidate middle source assertion `h0005` (card). -/
theorem middleSource_h0005 :
    ((((bif rowBit (I.sourceRows) 0 2 0 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 0 2 1 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 0 2 2 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 0 2 3 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 0 2 4 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 0 2 5 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 0 2 6 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 0 2 7 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 0 2 8 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 0 2 9 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 0 2 10 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 0 2 11 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 0 2 12 then 1#4 else 0#4)) == 4#4)) = true := by
  simpa only [allOneBitCount13] using
    allOne_row_card_eq_four I (0 : Fin 3) (2 : Fin 13)

/-- Candidate middle source assertion `h0006` (center). -/
theorem middleSource_h0006 :
    (!(rowBit (I.sourceRows) 0 3 3)) = true := by
  exact allOne_row_center_excluded I (0 : Fin 3) (3 : Fin 13)

/-- Candidate middle source assertion `h0007` (card). -/
theorem middleSource_h0007 :
    ((((bif rowBit (I.sourceRows) 0 3 0 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 0 3 1 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 0 3 2 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 0 3 3 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 0 3 4 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 0 3 5 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 0 3 6 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 0 3 7 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 0 3 8 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 0 3 9 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 0 3 10 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 0 3 11 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 0 3 12 then 1#4 else 0#4)) == 4#4)) = true := by
  simpa only [allOneBitCount13] using
    allOne_row_card_eq_four I (0 : Fin 3) (3 : Fin 13)

/-- Candidate middle source assertion `h0008` (center). -/
theorem middleSource_h0008 :
    (!(rowBit (I.sourceRows) 0 4 4)) = true := by
  exact allOne_row_center_excluded I (0 : Fin 3) (4 : Fin 13)

/-- Candidate middle source assertion `h0009` (card). -/
theorem middleSource_h0009 :
    ((((bif rowBit (I.sourceRows) 0 4 0 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 0 4 1 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 0 4 2 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 0 4 3 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 0 4 4 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 0 4 5 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 0 4 6 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 0 4 7 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 0 4 8 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 0 4 9 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 0 4 10 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 0 4 11 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 0 4 12 then 1#4 else 0#4)) == 4#4)) = true := by
  simpa only [allOneBitCount13] using
    allOne_row_card_eq_four I (0 : Fin 3) (4 : Fin 13)

/-- Candidate middle source assertion `h0010` (center). -/
theorem middleSource_h0010 :
    (!(rowBit (I.sourceRows) 0 5 5)) = true := by
  exact allOne_row_center_excluded I (0 : Fin 3) (5 : Fin 13)

/-- Candidate middle source assertion `h0011` (card). -/
theorem middleSource_h0011 :
    ((((bif rowBit (I.sourceRows) 0 5 0 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 0 5 1 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 0 5 2 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 0 5 3 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 0 5 4 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 0 5 5 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 0 5 6 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 0 5 7 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 0 5 8 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 0 5 9 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 0 5 10 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 0 5 11 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 0 5 12 then 1#4 else 0#4)) == 4#4)) = true := by
  simpa only [allOneBitCount13] using
    allOne_row_card_eq_four I (0 : Fin 3) (5 : Fin 13)

/-- Candidate middle source assertion `h0012` (center). -/
theorem middleSource_h0012 :
    (!(rowBit (I.sourceRows) 0 6 6)) = true := by
  exact allOne_row_center_excluded I (0 : Fin 3) (6 : Fin 13)

/-- Candidate middle source assertion `h0013` (card). -/
theorem middleSource_h0013 :
    ((((bif rowBit (I.sourceRows) 0 6 0 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 0 6 1 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 0 6 2 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 0 6 3 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 0 6 4 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 0 6 5 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 0 6 6 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 0 6 7 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 0 6 8 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 0 6 9 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 0 6 10 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 0 6 11 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 0 6 12 then 1#4 else 0#4)) == 4#4)) = true := by
  simpa only [allOneBitCount13] using
    allOne_row_card_eq_four I (0 : Fin 3) (6 : Fin 13)

/-- Candidate middle source assertion `h0014` (center). -/
theorem middleSource_h0014 :
    (!(rowBit (I.sourceRows) 0 7 7)) = true := by
  exact allOne_row_center_excluded I (0 : Fin 3) (7 : Fin 13)

/-- Candidate middle source assertion `h0015` (card). -/
theorem middleSource_h0015 :
    ((((bif rowBit (I.sourceRows) 0 7 0 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 0 7 1 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 0 7 2 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 0 7 3 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 0 7 4 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 0 7 5 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 0 7 6 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 0 7 7 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 0 7 8 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 0 7 9 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 0 7 10 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 0 7 11 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 0 7 12 then 1#4 else 0#4)) == 4#4)) = true := by
  simpa only [allOneBitCount13] using
    allOne_row_card_eq_four I (0 : Fin 3) (7 : Fin 13)

/-- Candidate middle source assertion `h0016` (center). -/
theorem middleSource_h0016 :
    (!(rowBit (I.sourceRows) 0 8 8)) = true := by
  exact allOne_row_center_excluded I (0 : Fin 3) (8 : Fin 13)

/-- Candidate middle source assertion `h0017` (card). -/
theorem middleSource_h0017 :
    ((((bif rowBit (I.sourceRows) 0 8 0 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 0 8 1 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 0 8 2 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 0 8 3 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 0 8 4 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 0 8 5 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 0 8 6 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 0 8 7 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 0 8 8 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 0 8 9 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 0 8 10 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 0 8 11 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 0 8 12 then 1#4 else 0#4)) == 4#4)) = true := by
  simpa only [allOneBitCount13] using
    allOne_row_card_eq_four I (0 : Fin 3) (8 : Fin 13)

/-- Candidate middle source assertion `h0018` (center). -/
theorem middleSource_h0018 :
    (!(rowBit (I.sourceRows) 0 9 9)) = true := by
  exact allOne_row_center_excluded I (0 : Fin 3) (9 : Fin 13)

/-- Candidate middle source assertion `h0019` (center). -/
theorem middleSource_h0019 :
    (!(rowBit (I.sourceRows) 0 10 10)) = true := by
  exact allOne_row_center_excluded I (0 : Fin 3) (10 : Fin 13)

/-- Candidate middle source assertion `h0020` (card). -/
theorem middleSource_h0020 :
    ((((bif rowBit (I.sourceRows) 0 10 0 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 0 10 1 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 0 10 2 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 0 10 3 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 0 10 4 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 0 10 5 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 0 10 6 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 0 10 7 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 0 10 8 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 0 10 9 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 0 10 10 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 0 10 11 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 0 10 12 then 1#4 else 0#4)) == 4#4)) = true := by
  simpa only [allOneBitCount13] using
    allOne_row_card_eq_four I (0 : Fin 3) (10 : Fin 13)

/-- Candidate middle source assertion `h0021` (center). -/
theorem middleSource_h0021 :
    (!(rowBit (I.sourceRows) 0 11 11)) = true := by
  exact allOne_row_center_excluded I (0 : Fin 3) (11 : Fin 13)

/-- Candidate middle source assertion `h0022` (card). -/
theorem middleSource_h0022 :
    ((((bif rowBit (I.sourceRows) 0 11 0 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 0 11 1 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 0 11 2 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 0 11 3 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 0 11 4 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 0 11 5 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 0 11 6 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 0 11 7 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 0 11 8 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 0 11 9 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 0 11 10 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 0 11 11 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 0 11 12 then 1#4 else 0#4)) == 4#4)) = true := by
  simpa only [allOneBitCount13] using
    allOne_row_card_eq_four I (0 : Fin 3) (11 : Fin 13)

/-- Candidate middle source assertion `h0023` (center). -/
theorem middleSource_h0023 :
    (!(rowBit (I.sourceRows) 0 12 12)) = true := by
  exact allOne_row_center_excluded I (0 : Fin 3) (12 : Fin 13)

/-- Candidate middle source assertion `h0024` (card). -/
theorem middleSource_h0024 :
    ((((bif rowBit (I.sourceRows) 0 12 0 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 0 12 1 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 0 12 2 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 0 12 3 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 0 12 4 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 0 12 5 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 0 12 6 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 0 12 7 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 0 12 8 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 0 12 9 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 0 12 10 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 0 12 11 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 0 12 12 then 1#4 else 0#4)) == 4#4)) = true := by
  simpa only [allOneBitCount13] using
    allOne_row_card_eq_four I (0 : Fin 3) (12 : Fin 13)

/-- Candidate middle source assertion `h0025` (intersection). -/
theorem middleSource_h0025 :
    ((((bif (rowBit (I.sourceRows) 0 0 0 && rowBit (I.sourceRows) 0 5 0) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 0 1 && rowBit (I.sourceRows) 0 5 1) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 0 2 && rowBit (I.sourceRows) 0 5 2) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 0 3 && rowBit (I.sourceRows) 0 5 3) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 0 4 && rowBit (I.sourceRows) 0 5 4) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 0 5 && rowBit (I.sourceRows) 0 5 5) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 0 6 && rowBit (I.sourceRows) 0 5 6) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 0 7 && rowBit (I.sourceRows) 0 5 7) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 0 8 && rowBit (I.sourceRows) 0 5 8) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 0 9 && rowBit (I.sourceRows) 0 5 9) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 0 10 && rowBit (I.sourceRows) 0 5 10) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 0 11 && rowBit (I.sourceRows) 0 5 11) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 0 12 && rowBit (I.sourceRows) 0 5 12) then 1#4 else 0#4))).ule 2#4) = true := by
  simpa only [allOneBitCount13] using
    allOne_row_inter_card_le_two I
      (0 : Fin 3) (0 : Fin 3)
      (0 : Fin 13) (5 : Fin 13) (by decide)

/-- Candidate middle source assertion `h0026` (intersection). -/
theorem middleSource_h0026 :
    ((((bif (rowBit (I.sourceRows) 0 0 0 && rowBit (I.sourceRows) 0 11 0) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 0 1 && rowBit (I.sourceRows) 0 11 1) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 0 2 && rowBit (I.sourceRows) 0 11 2) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 0 3 && rowBit (I.sourceRows) 0 11 3) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 0 4 && rowBit (I.sourceRows) 0 11 4) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 0 5 && rowBit (I.sourceRows) 0 11 5) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 0 6 && rowBit (I.sourceRows) 0 11 6) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 0 7 && rowBit (I.sourceRows) 0 11 7) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 0 8 && rowBit (I.sourceRows) 0 11 8) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 0 9 && rowBit (I.sourceRows) 0 11 9) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 0 10 && rowBit (I.sourceRows) 0 11 10) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 0 11 && rowBit (I.sourceRows) 0 11 11) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 0 12 && rowBit (I.sourceRows) 0 11 12) then 1#4 else 0#4))).ule 2#4) = true := by
  simpa only [allOneBitCount13] using
    allOne_row_inter_card_le_two I
      (0 : Fin 3) (0 : Fin 3)
      (0 : Fin 13) (11 : Fin 13) (by decide)

/-- Candidate middle source assertion `h0027` (intersection). -/
theorem middleSource_h0027 :
    ((((bif (rowBit (I.sourceRows) 0 1 0 && rowBit (I.sourceRows) 0 5 0) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 1 1 && rowBit (I.sourceRows) 0 5 1) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 1 2 && rowBit (I.sourceRows) 0 5 2) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 1 3 && rowBit (I.sourceRows) 0 5 3) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 1 4 && rowBit (I.sourceRows) 0 5 4) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 1 5 && rowBit (I.sourceRows) 0 5 5) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 1 6 && rowBit (I.sourceRows) 0 5 6) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 1 7 && rowBit (I.sourceRows) 0 5 7) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 1 8 && rowBit (I.sourceRows) 0 5 8) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 1 9 && rowBit (I.sourceRows) 0 5 9) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 1 10 && rowBit (I.sourceRows) 0 5 10) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 1 11 && rowBit (I.sourceRows) 0 5 11) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 1 12 && rowBit (I.sourceRows) 0 5 12) then 1#4 else 0#4))).ule 2#4) = true := by
  simpa only [allOneBitCount13] using
    allOne_row_inter_card_le_two I
      (0 : Fin 3) (0 : Fin 3)
      (1 : Fin 13) (5 : Fin 13) (by decide)

/-- Candidate middle source assertion `h0028` (intersection). -/
theorem middleSource_h0028 :
    ((((bif (rowBit (I.sourceRows) 0 1 0 && rowBit (I.sourceRows) 0 10 0) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 1 1 && rowBit (I.sourceRows) 0 10 1) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 1 2 && rowBit (I.sourceRows) 0 10 2) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 1 3 && rowBit (I.sourceRows) 0 10 3) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 1 4 && rowBit (I.sourceRows) 0 10 4) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 1 5 && rowBit (I.sourceRows) 0 10 5) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 1 6 && rowBit (I.sourceRows) 0 10 6) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 1 7 && rowBit (I.sourceRows) 0 10 7) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 1 8 && rowBit (I.sourceRows) 0 10 8) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 1 9 && rowBit (I.sourceRows) 0 10 9) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 1 10 && rowBit (I.sourceRows) 0 10 10) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 1 11 && rowBit (I.sourceRows) 0 10 11) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 1 12 && rowBit (I.sourceRows) 0 10 12) then 1#4 else 0#4))).ule 2#4) = true := by
  simpa only [allOneBitCount13] using
    allOne_row_inter_card_le_two I
      (0 : Fin 3) (0 : Fin 3)
      (1 : Fin 13) (10 : Fin 13) (by decide)

/-- Candidate middle source assertion `h0029` (intersection). -/
theorem middleSource_h0029 :
    ((((bif (rowBit (I.sourceRows) 0 1 0 && rowBit (I.sourceRows) 0 11 0) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 1 1 && rowBit (I.sourceRows) 0 11 1) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 1 2 && rowBit (I.sourceRows) 0 11 2) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 1 3 && rowBit (I.sourceRows) 0 11 3) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 1 4 && rowBit (I.sourceRows) 0 11 4) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 1 5 && rowBit (I.sourceRows) 0 11 5) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 1 6 && rowBit (I.sourceRows) 0 11 6) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 1 7 && rowBit (I.sourceRows) 0 11 7) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 1 8 && rowBit (I.sourceRows) 0 11 8) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 1 9 && rowBit (I.sourceRows) 0 11 9) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 1 10 && rowBit (I.sourceRows) 0 11 10) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 1 11 && rowBit (I.sourceRows) 0 11 11) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 1 12 && rowBit (I.sourceRows) 0 11 12) then 1#4 else 0#4))).ule 2#4) = true := by
  simpa only [allOneBitCount13] using
    allOne_row_inter_card_le_two I
      (0 : Fin 3) (0 : Fin 3)
      (1 : Fin 13) (11 : Fin 13) (by decide)

/-- Candidate middle source assertion `h0030` (intersection). -/
theorem middleSource_h0030 :
    ((((bif (rowBit (I.sourceRows) 0 2 0 && rowBit (I.sourceRows) 0 10 0) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 2 1 && rowBit (I.sourceRows) 0 10 1) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 2 2 && rowBit (I.sourceRows) 0 10 2) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 2 3 && rowBit (I.sourceRows) 0 10 3) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 2 4 && rowBit (I.sourceRows) 0 10 4) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 2 5 && rowBit (I.sourceRows) 0 10 5) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 2 6 && rowBit (I.sourceRows) 0 10 6) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 2 7 && rowBit (I.sourceRows) 0 10 7) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 2 8 && rowBit (I.sourceRows) 0 10 8) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 2 9 && rowBit (I.sourceRows) 0 10 9) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 2 10 && rowBit (I.sourceRows) 0 10 10) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 2 11 && rowBit (I.sourceRows) 0 10 11) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 2 12 && rowBit (I.sourceRows) 0 10 12) then 1#4 else 0#4))).ule 2#4) = true := by
  simpa only [allOneBitCount13] using
    allOne_row_inter_card_le_two I
      (0 : Fin 3) (0 : Fin 3)
      (2 : Fin 13) (10 : Fin 13) (by decide)

/-- Candidate middle source assertion `h0031` (intersection). -/
theorem middleSource_h0031 :
    ((((bif (rowBit (I.sourceRows) 0 2 0 && rowBit (I.sourceRows) 0 11 0) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 2 1 && rowBit (I.sourceRows) 0 11 1) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 2 2 && rowBit (I.sourceRows) 0 11 2) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 2 3 && rowBit (I.sourceRows) 0 11 3) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 2 4 && rowBit (I.sourceRows) 0 11 4) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 2 5 && rowBit (I.sourceRows) 0 11 5) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 2 6 && rowBit (I.sourceRows) 0 11 6) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 2 7 && rowBit (I.sourceRows) 0 11 7) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 2 8 && rowBit (I.sourceRows) 0 11 8) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 2 9 && rowBit (I.sourceRows) 0 11 9) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 2 10 && rowBit (I.sourceRows) 0 11 10) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 2 11 && rowBit (I.sourceRows) 0 11 11) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 2 12 && rowBit (I.sourceRows) 0 11 12) then 1#4 else 0#4))).ule 2#4) = true := by
  simpa only [allOneBitCount13] using
    allOne_row_inter_card_le_two I
      (0 : Fin 3) (0 : Fin 3)
      (2 : Fin 13) (11 : Fin 13) (by decide)

/-- Candidate middle source assertion `h0032` (intersection). -/
theorem middleSource_h0032 :
    ((((bif (rowBit (I.sourceRows) 0 4 0 && rowBit (I.sourceRows) 0 11 0) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 4 1 && rowBit (I.sourceRows) 0 11 1) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 4 2 && rowBit (I.sourceRows) 0 11 2) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 4 3 && rowBit (I.sourceRows) 0 11 3) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 4 4 && rowBit (I.sourceRows) 0 11 4) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 4 5 && rowBit (I.sourceRows) 0 11 5) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 4 6 && rowBit (I.sourceRows) 0 11 6) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 4 7 && rowBit (I.sourceRows) 0 11 7) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 4 8 && rowBit (I.sourceRows) 0 11 8) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 4 9 && rowBit (I.sourceRows) 0 11 9) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 4 10 && rowBit (I.sourceRows) 0 11 10) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 4 11 && rowBit (I.sourceRows) 0 11 11) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 4 12 && rowBit (I.sourceRows) 0 11 12) then 1#4 else 0#4))).ule 2#4) = true := by
  simpa only [allOneBitCount13] using
    allOne_row_inter_card_le_two I
      (0 : Fin 3) (0 : Fin 3)
      (4 : Fin 13) (11 : Fin 13) (by decide)

/-- Candidate middle source assertion `h0033` (intersection). -/
theorem middleSource_h0033 :
    ((((bif (rowBit (I.sourceRows) 0 5 0 && rowBit (I.sourceRows) 0 10 0) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 5 1 && rowBit (I.sourceRows) 0 10 1) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 5 2 && rowBit (I.sourceRows) 0 10 2) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 5 3 && rowBit (I.sourceRows) 0 10 3) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 5 4 && rowBit (I.sourceRows) 0 10 4) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 5 5 && rowBit (I.sourceRows) 0 10 5) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 5 6 && rowBit (I.sourceRows) 0 10 6) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 5 7 && rowBit (I.sourceRows) 0 10 7) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 5 8 && rowBit (I.sourceRows) 0 10 8) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 5 9 && rowBit (I.sourceRows) 0 10 9) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 5 10 && rowBit (I.sourceRows) 0 10 10) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 5 11 && rowBit (I.sourceRows) 0 10 11) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 5 12 && rowBit (I.sourceRows) 0 10 12) then 1#4 else 0#4))).ule 2#4) = true := by
  simpa only [allOneBitCount13] using
    allOne_row_inter_card_le_two I
      (0 : Fin 3) (0 : Fin 3)
      (5 : Fin 13) (10 : Fin 13) (by decide)

/-- Candidate middle source assertion `h0034` (intersection). -/
theorem middleSource_h0034 :
    ((((bif (rowBit (I.sourceRows) 0 5 0 && rowBit (I.sourceRows) 0 11 0) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 5 1 && rowBit (I.sourceRows) 0 11 1) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 5 2 && rowBit (I.sourceRows) 0 11 2) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 5 3 && rowBit (I.sourceRows) 0 11 3) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 5 4 && rowBit (I.sourceRows) 0 11 4) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 5 5 && rowBit (I.sourceRows) 0 11 5) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 5 6 && rowBit (I.sourceRows) 0 11 6) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 5 7 && rowBit (I.sourceRows) 0 11 7) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 5 8 && rowBit (I.sourceRows) 0 11 8) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 5 9 && rowBit (I.sourceRows) 0 11 9) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 5 10 && rowBit (I.sourceRows) 0 11 10) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 5 11 && rowBit (I.sourceRows) 0 11 11) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 5 12 && rowBit (I.sourceRows) 0 11 12) then 1#4 else 0#4))).ule 2#4) = true := by
  simpa only [allOneBitCount13] using
    allOne_row_inter_card_le_two I
      (0 : Fin 3) (0 : Fin 3)
      (5 : Fin 13) (11 : Fin 13) (by decide)

/-- Candidate middle source assertion `h0035` (intersection). -/
theorem middleSource_h0035 :
    ((((bif (rowBit (I.sourceRows) 0 6 0 && rowBit (I.sourceRows) 0 10 0) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 6 1 && rowBit (I.sourceRows) 0 10 1) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 6 2 && rowBit (I.sourceRows) 0 10 2) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 6 3 && rowBit (I.sourceRows) 0 10 3) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 6 4 && rowBit (I.sourceRows) 0 10 4) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 6 5 && rowBit (I.sourceRows) 0 10 5) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 6 6 && rowBit (I.sourceRows) 0 10 6) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 6 7 && rowBit (I.sourceRows) 0 10 7) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 6 8 && rowBit (I.sourceRows) 0 10 8) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 6 9 && rowBit (I.sourceRows) 0 10 9) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 6 10 && rowBit (I.sourceRows) 0 10 10) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 6 11 && rowBit (I.sourceRows) 0 10 11) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 6 12 && rowBit (I.sourceRows) 0 10 12) then 1#4 else 0#4))).ule 2#4) = true := by
  simpa only [allOneBitCount13] using
    allOne_row_inter_card_le_two I
      (0 : Fin 3) (0 : Fin 3)
      (6 : Fin 13) (10 : Fin 13) (by decide)

/-- Candidate middle source assertion `h0036` (intersection). -/
theorem middleSource_h0036 :
    ((((bif (rowBit (I.sourceRows) 0 6 0 && rowBit (I.sourceRows) 0 11 0) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 6 1 && rowBit (I.sourceRows) 0 11 1) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 6 2 && rowBit (I.sourceRows) 0 11 2) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 6 3 && rowBit (I.sourceRows) 0 11 3) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 6 4 && rowBit (I.sourceRows) 0 11 4) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 6 5 && rowBit (I.sourceRows) 0 11 5) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 6 6 && rowBit (I.sourceRows) 0 11 6) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 6 7 && rowBit (I.sourceRows) 0 11 7) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 6 8 && rowBit (I.sourceRows) 0 11 8) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 6 9 && rowBit (I.sourceRows) 0 11 9) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 6 10 && rowBit (I.sourceRows) 0 11 10) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 6 11 && rowBit (I.sourceRows) 0 11 11) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 6 12 && rowBit (I.sourceRows) 0 11 12) then 1#4 else 0#4))).ule 2#4) = true := by
  simpa only [allOneBitCount13] using
    allOne_row_inter_card_le_two I
      (0 : Fin 3) (0 : Fin 3)
      (6 : Fin 13) (11 : Fin 13) (by decide)

/-- Candidate middle source assertion `h0037` (family_pair_centers). -/
theorem middleSource_h0037 :
    ((((bif (rowBit (I.sourceRows) 0 0 0 && rowBit (I.sourceRows) 0 0 6) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 1 0 && rowBit (I.sourceRows) 0 1 6) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 2 0 && rowBit (I.sourceRows) 0 2 6) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 3 0 && rowBit (I.sourceRows) 0 3 6) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 4 0 && rowBit (I.sourceRows) 0 4 6) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 5 0 && rowBit (I.sourceRows) 0 5 6) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 6 0 && rowBit (I.sourceRows) 0 6 6) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 7 0 && rowBit (I.sourceRows) 0 7 6) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 8 0 && rowBit (I.sourceRows) 0 8 6) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 9 0 && rowBit (I.sourceRows) 0 9 6) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 10 0 && rowBit (I.sourceRows) 0 10 6) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 11 0 && rowBit (I.sourceRows) 0 11 6) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 12 0 && rowBit (I.sourceRows) 0 12 6) then 1#4 else 0#4))).ule 2#4) = true := by
  simpa only [allOneBitCount13] using
    allOne_family_pair_center_count_le_two I
      (0 : Fin 3) (0 : Fin 13) (6 : Fin 13) (by decide)

/-- Candidate middle source assertion `h0038` (family_pair_centers). -/
theorem middleSource_h0038 :
    ((((bif (rowBit (I.sourceRows) 0 0 0 && rowBit (I.sourceRows) 0 0 7) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 1 0 && rowBit (I.sourceRows) 0 1 7) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 2 0 && rowBit (I.sourceRows) 0 2 7) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 3 0 && rowBit (I.sourceRows) 0 3 7) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 4 0 && rowBit (I.sourceRows) 0 4 7) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 5 0 && rowBit (I.sourceRows) 0 5 7) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 6 0 && rowBit (I.sourceRows) 0 6 7) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 7 0 && rowBit (I.sourceRows) 0 7 7) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 8 0 && rowBit (I.sourceRows) 0 8 7) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 9 0 && rowBit (I.sourceRows) 0 9 7) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 10 0 && rowBit (I.sourceRows) 0 10 7) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 11 0 && rowBit (I.sourceRows) 0 11 7) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 12 0 && rowBit (I.sourceRows) 0 12 7) then 1#4 else 0#4))).ule 2#4) = true := by
  simpa only [allOneBitCount13] using
    allOne_family_pair_center_count_le_two I
      (0 : Fin 3) (0 : Fin 13) (7 : Fin 13) (by decide)

/-- Candidate middle source assertion `h0039` (family_pair_centers). -/
theorem middleSource_h0039 :
    ((((bif (rowBit (I.sourceRows) 0 0 0 && rowBit (I.sourceRows) 0 0 8) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 1 0 && rowBit (I.sourceRows) 0 1 8) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 2 0 && rowBit (I.sourceRows) 0 2 8) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 3 0 && rowBit (I.sourceRows) 0 3 8) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 4 0 && rowBit (I.sourceRows) 0 4 8) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 5 0 && rowBit (I.sourceRows) 0 5 8) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 6 0 && rowBit (I.sourceRows) 0 6 8) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 7 0 && rowBit (I.sourceRows) 0 7 8) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 8 0 && rowBit (I.sourceRows) 0 8 8) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 9 0 && rowBit (I.sourceRows) 0 9 8) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 10 0 && rowBit (I.sourceRows) 0 10 8) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 11 0 && rowBit (I.sourceRows) 0 11 8) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 12 0 && rowBit (I.sourceRows) 0 12 8) then 1#4 else 0#4))).ule 2#4) = true := by
  simpa only [allOneBitCount13] using
    allOne_family_pair_center_count_le_two I
      (0 : Fin 3) (0 : Fin 13) (8 : Fin 13) (by decide)

/-- Candidate middle source assertion `h0040` (family_pair_centers). -/
theorem middleSource_h0040 :
    ((((bif (rowBit (I.sourceRows) 0 0 1 && rowBit (I.sourceRows) 0 0 9) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 1 1 && rowBit (I.sourceRows) 0 1 9) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 2 1 && rowBit (I.sourceRows) 0 2 9) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 3 1 && rowBit (I.sourceRows) 0 3 9) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 4 1 && rowBit (I.sourceRows) 0 4 9) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 5 1 && rowBit (I.sourceRows) 0 5 9) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 6 1 && rowBit (I.sourceRows) 0 6 9) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 7 1 && rowBit (I.sourceRows) 0 7 9) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 8 1 && rowBit (I.sourceRows) 0 8 9) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 9 1 && rowBit (I.sourceRows) 0 9 9) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 10 1 && rowBit (I.sourceRows) 0 10 9) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 11 1 && rowBit (I.sourceRows) 0 11 9) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 12 1 && rowBit (I.sourceRows) 0 12 9) then 1#4 else 0#4))).ule 2#4) = true := by
  simpa only [allOneBitCount13] using
    allOne_family_pair_center_count_le_two I
      (0 : Fin 3) (1 : Fin 13) (9 : Fin 13) (by decide)

/-- Candidate middle source assertion `h0041` (family_pair_centers). -/
theorem middleSource_h0041 :
    ((((bif (rowBit (I.sourceRows) 0 0 2 && rowBit (I.sourceRows) 0 0 7) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 1 2 && rowBit (I.sourceRows) 0 1 7) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 2 2 && rowBit (I.sourceRows) 0 2 7) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 3 2 && rowBit (I.sourceRows) 0 3 7) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 4 2 && rowBit (I.sourceRows) 0 4 7) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 5 2 && rowBit (I.sourceRows) 0 5 7) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 6 2 && rowBit (I.sourceRows) 0 6 7) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 7 2 && rowBit (I.sourceRows) 0 7 7) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 8 2 && rowBit (I.sourceRows) 0 8 7) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 9 2 && rowBit (I.sourceRows) 0 9 7) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 10 2 && rowBit (I.sourceRows) 0 10 7) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 11 2 && rowBit (I.sourceRows) 0 11 7) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 12 2 && rowBit (I.sourceRows) 0 12 7) then 1#4 else 0#4))).ule 2#4) = true := by
  simpa only [allOneBitCount13] using
    allOne_family_pair_center_count_le_two I
      (0 : Fin 3) (2 : Fin 13) (7 : Fin 13) (by decide)

/-- Candidate middle source assertion `h0042` (family_pair_centers). -/
theorem middleSource_h0042 :
    ((((bif (rowBit (I.sourceRows) 0 0 3 && rowBit (I.sourceRows) 0 0 6) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 1 3 && rowBit (I.sourceRows) 0 1 6) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 2 3 && rowBit (I.sourceRows) 0 2 6) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 3 3 && rowBit (I.sourceRows) 0 3 6) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 4 3 && rowBit (I.sourceRows) 0 4 6) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 5 3 && rowBit (I.sourceRows) 0 5 6) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 6 3 && rowBit (I.sourceRows) 0 6 6) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 7 3 && rowBit (I.sourceRows) 0 7 6) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 8 3 && rowBit (I.sourceRows) 0 8 6) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 9 3 && rowBit (I.sourceRows) 0 9 6) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 10 3 && rowBit (I.sourceRows) 0 10 6) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 11 3 && rowBit (I.sourceRows) 0 11 6) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 12 3 && rowBit (I.sourceRows) 0 12 6) then 1#4 else 0#4))).ule 2#4) = true := by
  simpa only [allOneBitCount13] using
    allOne_family_pair_center_count_le_two I
      (0 : Fin 3) (3 : Fin 13) (6 : Fin 13) (by decide)

/-- Candidate middle source assertion `h0043` (family_pair_centers). -/
theorem middleSource_h0043 :
    ((((bif (rowBit (I.sourceRows) 0 0 3 && rowBit (I.sourceRows) 0 0 7) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 1 3 && rowBit (I.sourceRows) 0 1 7) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 2 3 && rowBit (I.sourceRows) 0 2 7) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 3 3 && rowBit (I.sourceRows) 0 3 7) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 4 3 && rowBit (I.sourceRows) 0 4 7) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 5 3 && rowBit (I.sourceRows) 0 5 7) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 6 3 && rowBit (I.sourceRows) 0 6 7) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 7 3 && rowBit (I.sourceRows) 0 7 7) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 8 3 && rowBit (I.sourceRows) 0 8 7) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 9 3 && rowBit (I.sourceRows) 0 9 7) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 10 3 && rowBit (I.sourceRows) 0 10 7) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 11 3 && rowBit (I.sourceRows) 0 11 7) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 12 3 && rowBit (I.sourceRows) 0 12 7) then 1#4 else 0#4))).ule 2#4) = true := by
  simpa only [allOneBitCount13] using
    allOne_family_pair_center_count_le_two I
      (0 : Fin 3) (3 : Fin 13) (7 : Fin 13) (by decide)

/-- Candidate middle source assertion `h0044` (family_pair_centers). -/
theorem middleSource_h0044 :
    ((((bif (rowBit (I.sourceRows) 0 0 4 && rowBit (I.sourceRows) 0 0 6) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 1 4 && rowBit (I.sourceRows) 0 1 6) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 2 4 && rowBit (I.sourceRows) 0 2 6) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 3 4 && rowBit (I.sourceRows) 0 3 6) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 4 4 && rowBit (I.sourceRows) 0 4 6) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 5 4 && rowBit (I.sourceRows) 0 5 6) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 6 4 && rowBit (I.sourceRows) 0 6 6) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 7 4 && rowBit (I.sourceRows) 0 7 6) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 8 4 && rowBit (I.sourceRows) 0 8 6) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 9 4 && rowBit (I.sourceRows) 0 9 6) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 10 4 && rowBit (I.sourceRows) 0 10 6) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 11 4 && rowBit (I.sourceRows) 0 11 6) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 12 4 && rowBit (I.sourceRows) 0 12 6) then 1#4 else 0#4))).ule 2#4) = true := by
  simpa only [allOneBitCount13] using
    allOne_family_pair_center_count_le_two I
      (0 : Fin 3) (4 : Fin 13) (6 : Fin 13) (by decide)

/-- Candidate middle source assertion `h0045` (family_pair_centers). -/
theorem middleSource_h0045 :
    ((((bif (rowBit (I.sourceRows) 0 0 4 && rowBit (I.sourceRows) 0 0 7) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 1 4 && rowBit (I.sourceRows) 0 1 7) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 2 4 && rowBit (I.sourceRows) 0 2 7) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 3 4 && rowBit (I.sourceRows) 0 3 7) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 4 4 && rowBit (I.sourceRows) 0 4 7) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 5 4 && rowBit (I.sourceRows) 0 5 7) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 6 4 && rowBit (I.sourceRows) 0 6 7) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 7 4 && rowBit (I.sourceRows) 0 7 7) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 8 4 && rowBit (I.sourceRows) 0 8 7) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 9 4 && rowBit (I.sourceRows) 0 9 7) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 10 4 && rowBit (I.sourceRows) 0 10 7) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 11 4 && rowBit (I.sourceRows) 0 11 7) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 12 4 && rowBit (I.sourceRows) 0 12 7) then 1#4 else 0#4))).ule 2#4) = true := by
  simpa only [allOneBitCount13] using
    allOne_family_pair_center_count_le_two I
      (0 : Fin 3) (4 : Fin 13) (7 : Fin 13) (by decide)

/-- Candidate middle source assertion `h0046` (family_pair_centers). -/
theorem middleSource_h0046 :
    ((((bif (rowBit (I.sourceRows) 0 0 4 && rowBit (I.sourceRows) 0 0 8) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 1 4 && rowBit (I.sourceRows) 0 1 8) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 2 4 && rowBit (I.sourceRows) 0 2 8) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 3 4 && rowBit (I.sourceRows) 0 3 8) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 4 4 && rowBit (I.sourceRows) 0 4 8) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 5 4 && rowBit (I.sourceRows) 0 5 8) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 6 4 && rowBit (I.sourceRows) 0 6 8) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 7 4 && rowBit (I.sourceRows) 0 7 8) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 8 4 && rowBit (I.sourceRows) 0 8 8) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 9 4 && rowBit (I.sourceRows) 0 9 8) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 10 4 && rowBit (I.sourceRows) 0 10 8) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 11 4 && rowBit (I.sourceRows) 0 11 8) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 12 4 && rowBit (I.sourceRows) 0 12 8) then 1#4 else 0#4))).ule 2#4) = true := by
  simpa only [allOneBitCount13] using
    allOne_family_pair_center_count_le_two I
      (0 : Fin 3) (4 : Fin 13) (8 : Fin 13) (by decide)

/-- Candidate middle source assertion `h0047` (family_pair_centers). -/
theorem middleSource_h0047 :
    ((((bif (rowBit (I.sourceRows) 0 0 4 && rowBit (I.sourceRows) 0 0 9) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 1 4 && rowBit (I.sourceRows) 0 1 9) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 2 4 && rowBit (I.sourceRows) 0 2 9) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 3 4 && rowBit (I.sourceRows) 0 3 9) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 4 4 && rowBit (I.sourceRows) 0 4 9) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 5 4 && rowBit (I.sourceRows) 0 5 9) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 6 4 && rowBit (I.sourceRows) 0 6 9) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 7 4 && rowBit (I.sourceRows) 0 7 9) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 8 4 && rowBit (I.sourceRows) 0 8 9) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 9 4 && rowBit (I.sourceRows) 0 9 9) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 10 4 && rowBit (I.sourceRows) 0 10 9) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 11 4 && rowBit (I.sourceRows) 0 11 9) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 12 4 && rowBit (I.sourceRows) 0 12 9) then 1#4 else 0#4))).ule 2#4) = true := by
  simpa only [allOneBitCount13] using
    allOne_family_pair_center_count_le_two I
      (0 : Fin 3) (4 : Fin 13) (9 : Fin 13) (by decide)

/-- Candidate middle source assertion `h0048` (family_pair_centers). -/
theorem middleSource_h0048 :
    ((((bif (rowBit (I.sourceRows) 0 0 4 && rowBit (I.sourceRows) 0 0 10) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 1 4 && rowBit (I.sourceRows) 0 1 10) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 2 4 && rowBit (I.sourceRows) 0 2 10) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 3 4 && rowBit (I.sourceRows) 0 3 10) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 4 4 && rowBit (I.sourceRows) 0 4 10) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 5 4 && rowBit (I.sourceRows) 0 5 10) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 6 4 && rowBit (I.sourceRows) 0 6 10) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 7 4 && rowBit (I.sourceRows) 0 7 10) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 8 4 && rowBit (I.sourceRows) 0 8 10) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 9 4 && rowBit (I.sourceRows) 0 9 10) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 10 4 && rowBit (I.sourceRows) 0 10 10) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 11 4 && rowBit (I.sourceRows) 0 11 10) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 12 4 && rowBit (I.sourceRows) 0 12 10) then 1#4 else 0#4))).ule 2#4) = true := by
  simpa only [allOneBitCount13] using
    allOne_family_pair_center_count_le_two I
      (0 : Fin 3) (4 : Fin 13) (10 : Fin 13) (by decide)

/-- Candidate middle source assertion `h0049` (family_pair_centers). -/
theorem middleSource_h0049 :
    ((((bif (rowBit (I.sourceRows) 0 0 4 && rowBit (I.sourceRows) 0 0 11) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 1 4 && rowBit (I.sourceRows) 0 1 11) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 2 4 && rowBit (I.sourceRows) 0 2 11) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 3 4 && rowBit (I.sourceRows) 0 3 11) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 4 4 && rowBit (I.sourceRows) 0 4 11) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 5 4 && rowBit (I.sourceRows) 0 5 11) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 6 4 && rowBit (I.sourceRows) 0 6 11) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 7 4 && rowBit (I.sourceRows) 0 7 11) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 8 4 && rowBit (I.sourceRows) 0 8 11) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 9 4 && rowBit (I.sourceRows) 0 9 11) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 10 4 && rowBit (I.sourceRows) 0 10 11) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 11 4 && rowBit (I.sourceRows) 0 11 11) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 12 4 && rowBit (I.sourceRows) 0 12 11) then 1#4 else 0#4))).ule 2#4) = true := by
  simpa only [allOneBitCount13] using
    allOne_family_pair_center_count_le_two I
      (0 : Fin 3) (4 : Fin 13) (11 : Fin 13) (by decide)

/-- Candidate middle source assertion `h0050` (family_pair_centers). -/
theorem middleSource_h0050 :
    ((((bif (rowBit (I.sourceRows) 0 0 4 && rowBit (I.sourceRows) 0 0 12) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 1 4 && rowBit (I.sourceRows) 0 1 12) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 2 4 && rowBit (I.sourceRows) 0 2 12) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 3 4 && rowBit (I.sourceRows) 0 3 12) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 4 4 && rowBit (I.sourceRows) 0 4 12) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 5 4 && rowBit (I.sourceRows) 0 5 12) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 6 4 && rowBit (I.sourceRows) 0 6 12) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 7 4 && rowBit (I.sourceRows) 0 7 12) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 8 4 && rowBit (I.sourceRows) 0 8 12) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 9 4 && rowBit (I.sourceRows) 0 9 12) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 10 4 && rowBit (I.sourceRows) 0 10 12) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 11 4 && rowBit (I.sourceRows) 0 11 12) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 12 4 && rowBit (I.sourceRows) 0 12 12) then 1#4 else 0#4))).ule 2#4) = true := by
  simpa only [allOneBitCount13] using
    allOne_family_pair_center_count_le_two I
      (0 : Fin 3) (4 : Fin 13) (12 : Fin 13) (by decide)

/-- Candidate middle source assertion `h0051` (family_pair_centers). -/
theorem middleSource_h0051 :
    ((((bif (rowBit (I.sourceRows) 0 0 5 && rowBit (I.sourceRows) 0 0 9) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 1 5 && rowBit (I.sourceRows) 0 1 9) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 2 5 && rowBit (I.sourceRows) 0 2 9) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 3 5 && rowBit (I.sourceRows) 0 3 9) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 4 5 && rowBit (I.sourceRows) 0 4 9) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 5 5 && rowBit (I.sourceRows) 0 5 9) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 6 5 && rowBit (I.sourceRows) 0 6 9) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 7 5 && rowBit (I.sourceRows) 0 7 9) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 8 5 && rowBit (I.sourceRows) 0 8 9) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 9 5 && rowBit (I.sourceRows) 0 9 9) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 10 5 && rowBit (I.sourceRows) 0 10 9) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 11 5 && rowBit (I.sourceRows) 0 11 9) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 12 5 && rowBit (I.sourceRows) 0 12 9) then 1#4 else 0#4))).ule 2#4) = true := by
  simpa only [allOneBitCount13] using
    allOne_family_pair_center_count_le_two I
      (0 : Fin 3) (5 : Fin 13) (9 : Fin 13) (by decide)

/-- Candidate middle source assertion `h0052` (family_pair_centers). -/
theorem middleSource_h0052 :
    ((((bif (rowBit (I.sourceRows) 0 0 6 && rowBit (I.sourceRows) 0 0 12) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 1 6 && rowBit (I.sourceRows) 0 1 12) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 2 6 && rowBit (I.sourceRows) 0 2 12) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 3 6 && rowBit (I.sourceRows) 0 3 12) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 4 6 && rowBit (I.sourceRows) 0 4 12) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 5 6 && rowBit (I.sourceRows) 0 5 12) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 6 6 && rowBit (I.sourceRows) 0 6 12) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 7 6 && rowBit (I.sourceRows) 0 7 12) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 8 6 && rowBit (I.sourceRows) 0 8 12) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 9 6 && rowBit (I.sourceRows) 0 9 12) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 10 6 && rowBit (I.sourceRows) 0 10 12) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 11 6 && rowBit (I.sourceRows) 0 11 12) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 12 6 && rowBit (I.sourceRows) 0 12 12) then 1#4 else 0#4))).ule 2#4) = true := by
  simpa only [allOneBitCount13] using
    allOne_family_pair_center_count_le_two I
      (0 : Fin 3) (6 : Fin 13) (12 : Fin 13) (by decide)

/-- Candidate middle source assertion `h0053` (family_pair_centers). -/
theorem middleSource_h0053 :
    ((((bif (rowBit (I.sourceRows) 0 0 7 && rowBit (I.sourceRows) 0 0 12) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 1 7 && rowBit (I.sourceRows) 0 1 12) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 2 7 && rowBit (I.sourceRows) 0 2 12) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 3 7 && rowBit (I.sourceRows) 0 3 12) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 4 7 && rowBit (I.sourceRows) 0 4 12) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 5 7 && rowBit (I.sourceRows) 0 5 12) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 6 7 && rowBit (I.sourceRows) 0 6 12) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 7 7 && rowBit (I.sourceRows) 0 7 12) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 8 7 && rowBit (I.sourceRows) 0 8 12) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 9 7 && rowBit (I.sourceRows) 0 9 12) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 10 7 && rowBit (I.sourceRows) 0 10 12) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 11 7 && rowBit (I.sourceRows) 0 11 12) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 12 7 && rowBit (I.sourceRows) 0 12 12) then 1#4 else 0#4))).ule 2#4) = true := by
  simpa only [allOneBitCount13] using
    allOne_family_pair_center_count_le_two I
      (0 : Fin 3) (7 : Fin 13) (12 : Fin 13) (by decide)

/-- Candidate middle source assertion `h0054` (family_pair_centers). -/
theorem middleSource_h0054 :
    ((((bif (rowBit (I.sourceRows) 0 0 8 && rowBit (I.sourceRows) 0 0 12) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 1 8 && rowBit (I.sourceRows) 0 1 12) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 2 8 && rowBit (I.sourceRows) 0 2 12) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 3 8 && rowBit (I.sourceRows) 0 3 12) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 4 8 && rowBit (I.sourceRows) 0 4 12) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 5 8 && rowBit (I.sourceRows) 0 5 12) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 6 8 && rowBit (I.sourceRows) 0 6 12) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 7 8 && rowBit (I.sourceRows) 0 7 12) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 8 8 && rowBit (I.sourceRows) 0 8 12) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 9 8 && rowBit (I.sourceRows) 0 9 12) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 10 8 && rowBit (I.sourceRows) 0 10 12) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 11 8 && rowBit (I.sourceRows) 0 11 12) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 12 8 && rowBit (I.sourceRows) 0 12 12) then 1#4 else 0#4))).ule 2#4) = true := by
  simpa only [allOneBitCount13] using
    allOne_family_pair_center_count_le_two I
      (0 : Fin 3) (8 : Fin 13) (12 : Fin 13) (by decide)

/-- Candidate middle source assertion `h0055` (shared_pair). -/
theorem middleSource_h0055 :
    (!((rowBit (I.sourceRows) 0 0 2 && rowBit (I.sourceRows) 0 0 5 && rowBit (I.sourceRows) 0 1 2 && rowBit (I.sourceRows) 0 1 5))) = true := by
  exact allOne_sharedPair_centersBeforePoints I
      (0 : Fin 3) (0 : Fin 3)
      (0 : Fin 13) (1 : Fin 13)
      (2 : Fin 13) (5 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h0056` (shared_pair). -/
theorem middleSource_h0056 :
    (!((rowBit (I.sourceRows) 0 0 2 && rowBit (I.sourceRows) 0 0 6 && rowBit (I.sourceRows) 0 1 2 && rowBit (I.sourceRows) 0 1 6))) = true := by
  exact allOne_sharedPair_centersBeforePoints I
      (0 : Fin 3) (0 : Fin 3)
      (0 : Fin 13) (1 : Fin 13)
      (2 : Fin 13) (6 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h0057` (shared_pair). -/
theorem middleSource_h0057 :
    (!((rowBit (I.sourceRows) 0 0 2 && rowBit (I.sourceRows) 0 0 7 && rowBit (I.sourceRows) 0 1 2 && rowBit (I.sourceRows) 0 1 7))) = true := by
  exact allOne_sharedPair_centersBeforePoints I
      (0 : Fin 3) (0 : Fin 3)
      (0 : Fin 13) (1 : Fin 13)
      (2 : Fin 13) (7 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h0058` (shared_pair). -/
theorem middleSource_h0058 :
    (!((rowBit (I.sourceRows) 0 0 2 && rowBit (I.sourceRows) 0 0 8 && rowBit (I.sourceRows) 0 1 2 && rowBit (I.sourceRows) 0 1 8))) = true := by
  exact allOne_sharedPair_centersBeforePoints I
      (0 : Fin 3) (0 : Fin 3)
      (0 : Fin 13) (1 : Fin 13)
      (2 : Fin 13) (8 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h0059` (shared_pair). -/
theorem middleSource_h0059 :
    (!((rowBit (I.sourceRows) 0 0 2 && rowBit (I.sourceRows) 0 0 9 && rowBit (I.sourceRows) 0 1 2 && rowBit (I.sourceRows) 0 1 9))) = true := by
  exact allOne_sharedPair_centersBeforePoints I
      (0 : Fin 3) (0 : Fin 3)
      (0 : Fin 13) (1 : Fin 13)
      (2 : Fin 13) (9 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h0060` (shared_pair). -/
theorem middleSource_h0060 :
    (!((rowBit (I.sourceRows) 0 0 2 && rowBit (I.sourceRows) 0 0 10 && rowBit (I.sourceRows) 0 1 2 && rowBit (I.sourceRows) 0 1 10))) = true := by
  exact allOne_sharedPair_centersBeforePoints I
      (0 : Fin 3) (0 : Fin 3)
      (0 : Fin 13) (1 : Fin 13)
      (2 : Fin 13) (10 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h0061` (shared_pair). -/
theorem middleSource_h0061 :
    (!((rowBit (I.sourceRows) 0 0 2 && rowBit (I.sourceRows) 0 0 11 && rowBit (I.sourceRows) 0 1 2 && rowBit (I.sourceRows) 0 1 11))) = true := by
  exact allOne_sharedPair_centersBeforePoints I
      (0 : Fin 3) (0 : Fin 3)
      (0 : Fin 13) (1 : Fin 13)
      (2 : Fin 13) (11 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h0062` (shared_pair). -/
theorem middleSource_h0062 :
    (!((rowBit (I.sourceRows) 0 0 2 && rowBit (I.sourceRows) 0 0 12 && rowBit (I.sourceRows) 0 1 2 && rowBit (I.sourceRows) 0 1 12))) = true := by
  exact allOne_sharedPair_centersBeforePoints I
      (0 : Fin 3) (0 : Fin 3)
      (0 : Fin 13) (1 : Fin 13)
      (2 : Fin 13) (12 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h0063` (shared_pair). -/
theorem middleSource_h0063 :
    (!((rowBit (I.sourceRows) 0 0 3 && rowBit (I.sourceRows) 0 0 5 && rowBit (I.sourceRows) 0 1 3 && rowBit (I.sourceRows) 0 1 5))) = true := by
  exact allOne_sharedPair_centersBeforePoints I
      (0 : Fin 3) (0 : Fin 3)
      (0 : Fin 13) (1 : Fin 13)
      (3 : Fin 13) (5 : Fin 13)
      (by decide) (by decide) (by decide)

end

end ATailExactFiveCard13AllOneSourceIngressScratch
end Problem97
