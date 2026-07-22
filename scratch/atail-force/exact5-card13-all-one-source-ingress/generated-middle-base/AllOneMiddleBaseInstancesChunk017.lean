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

/-- Candidate middle source assertion `h1088` (shared_pair). -/
theorem middleSource_h1088 :
    (!((rowBit (I.sourceRows) 0 3 8 && rowBit (I.sourceRows) 0 3 12 && rowBit (I.sourceRows) 0 4 8 && rowBit (I.sourceRows) 0 4 12))) = true := by
  exact allOne_sharedPair_centersBeforePoints I
      (0 : Fin 3) (0 : Fin 3)
      (3 : Fin 13) (4 : Fin 13)
      (8 : Fin 13) (12 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1089` (shared_pair). -/
theorem middleSource_h1089 :
    (!((rowBit (I.sourceRows) 0 3 9 && rowBit (I.sourceRows) 0 3 11 && rowBit (I.sourceRows) 0 4 9 && rowBit (I.sourceRows) 0 4 11))) = true := by
  exact allOne_sharedPair_centersBeforePoints I
      (0 : Fin 3) (0 : Fin 3)
      (3 : Fin 13) (4 : Fin 13)
      (9 : Fin 13) (11 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1090` (center). -/
theorem middleSource_h1090 :
    (!(rowBit (I.sourceRows) 1 0 0)) = true := by
  exact allOne_row_center_excluded I (1 : Fin 3) (0 : Fin 13)

/-- Candidate middle source assertion `h1091` (center). -/
theorem middleSource_h1091 :
    (!(rowBit (I.sourceRows) 1 1 1)) = true := by
  exact allOne_row_center_excluded I (1 : Fin 3) (1 : Fin 13)

/-- Candidate middle source assertion `h1092` (center). -/
theorem middleSource_h1092 :
    (!(rowBit (I.sourceRows) 1 2 2)) = true := by
  exact allOne_row_center_excluded I (1 : Fin 3) (2 : Fin 13)

/-- Candidate middle source assertion `h1093` (center). -/
theorem middleSource_h1093 :
    (!(rowBit (I.sourceRows) 1 3 3)) = true := by
  exact allOne_row_center_excluded I (1 : Fin 3) (3 : Fin 13)

/-- Candidate middle source assertion `h1094` (center). -/
theorem middleSource_h1094 :
    (!(rowBit (I.sourceRows) 1 4 4)) = true := by
  exact allOne_row_center_excluded I (1 : Fin 3) (4 : Fin 13)

/-- Candidate middle source assertion `h1095` (center). -/
theorem middleSource_h1095 :
    (!(rowBit (I.sourceRows) 1 5 5)) = true := by
  exact allOne_row_center_excluded I (1 : Fin 3) (5 : Fin 13)

/-- Candidate middle source assertion `h1096` (center). -/
theorem middleSource_h1096 :
    (!(rowBit (I.sourceRows) 1 6 6)) = true := by
  exact allOne_row_center_excluded I (1 : Fin 3) (6 : Fin 13)

/-- Candidate middle source assertion `h1097` (center). -/
theorem middleSource_h1097 :
    (!(rowBit (I.sourceRows) 1 7 7)) = true := by
  exact allOne_row_center_excluded I (1 : Fin 3) (7 : Fin 13)

/-- Candidate middle source assertion `h1098` (center). -/
theorem middleSource_h1098 :
    (!(rowBit (I.sourceRows) 1 8 8)) = true := by
  exact allOne_row_center_excluded I (1 : Fin 3) (8 : Fin 13)

/-- Candidate middle source assertion `h1099` (card). -/
theorem middleSource_h1099 :
    ((((bif rowBit (I.sourceRows) 1 8 0 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 1 8 1 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 1 8 2 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 1 8 3 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 1 8 4 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 1 8 5 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 1 8 6 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 1 8 7 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 1 8 8 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 1 8 9 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 1 8 10 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 1 8 11 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 1 8 12 then 1#4 else 0#4)) == 4#4)) = true := by
  simpa only [allOneBitCount13] using
    allOne_row_card_eq_four I (1 : Fin 3) (8 : Fin 13)

/-- Candidate middle source assertion `h1100` (center). -/
theorem middleSource_h1100 :
    (!(rowBit (I.sourceRows) 1 9 9)) = true := by
  exact allOne_row_center_excluded I (1 : Fin 3) (9 : Fin 13)

/-- Candidate middle source assertion `h1101` (center). -/
theorem middleSource_h1101 :
    (!(rowBit (I.sourceRows) 1 10 10)) = true := by
  exact allOne_row_center_excluded I (1 : Fin 3) (10 : Fin 13)

/-- Candidate middle source assertion `h1102` (center). -/
theorem middleSource_h1102 :
    (!(rowBit (I.sourceRows) 1 11 11)) = true := by
  exact allOne_row_center_excluded I (1 : Fin 3) (11 : Fin 13)

/-- Candidate middle source assertion `h1103` (center). -/
theorem middleSource_h1103 :
    (!(rowBit (I.sourceRows) 1 12 12)) = true := by
  exact allOne_row_center_excluded I (1 : Fin 3) (12 : Fin 13)

/-- Candidate middle source assertion `h1104` (family_pair_centers). -/
theorem middleSource_h1104 :
    ((((bif (rowBit (I.sourceRows) 1 0 10 && rowBit (I.sourceRows) 1 0 11) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 1 1 10 && rowBit (I.sourceRows) 1 1 11) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 1 2 10 && rowBit (I.sourceRows) 1 2 11) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 1 3 10 && rowBit (I.sourceRows) 1 3 11) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 1 4 10 && rowBit (I.sourceRows) 1 4 11) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 1 5 10 && rowBit (I.sourceRows) 1 5 11) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 1 6 10 && rowBit (I.sourceRows) 1 6 11) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 1 7 10 && rowBit (I.sourceRows) 1 7 11) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 1 8 10 && rowBit (I.sourceRows) 1 8 11) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 1 9 10 && rowBit (I.sourceRows) 1 9 11) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 1 10 10 && rowBit (I.sourceRows) 1 10 11) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 1 11 10 && rowBit (I.sourceRows) 1 11 11) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 1 12 10 && rowBit (I.sourceRows) 1 12 11) then 1#4 else 0#4))).ule 2#4) = true := by
  simpa only [allOneBitCount13] using
    allOne_family_pair_center_count_le_two I
      (1 : Fin 3) (10 : Fin 13) (11 : Fin 13) (by decide)

/-- Candidate middle source assertion `h1105` (shared_pair). -/
theorem middleSource_h1105 :
    (!((rowBit (I.sourceRows) 1 0 4 && rowBit (I.sourceRows) 1 0 5 && rowBit (I.sourceRows) 1 1 4 && rowBit (I.sourceRows) 1 1 5))) = true := by
  exact allOne_sharedPair_centersBeforePoints I
      (1 : Fin 3) (1 : Fin 3)
      (0 : Fin 13) (1 : Fin 13)
      (4 : Fin 13) (5 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1106` (shared_pair). -/
theorem middleSource_h1106 :
    (!((rowBit (I.sourceRows) 1 1 4 && rowBit (I.sourceRows) 1 1 5 && rowBit (I.sourceRows) 1 2 4 && rowBit (I.sourceRows) 1 2 5))) = true := by
  exact allOne_sharedPair_centersBeforePoints I
      (1 : Fin 3) (1 : Fin 3)
      (1 : Fin 13) (2 : Fin 13)
      (4 : Fin 13) (5 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1107` (shared_pair). -/
theorem middleSource_h1107 :
    (!((rowBit (I.sourceRows) 1 6 3 && rowBit (I.sourceRows) 1 6 4 && rowBit (I.sourceRows) 1 8 3 && rowBit (I.sourceRows) 1 8 4))) = true := by
  exact allOne_sharedPair_pointsBeforeCenters I
      (1 : Fin 3) (1 : Fin 3)
      (6 : Fin 13) (8 : Fin 13)
      (3 : Fin 13) (4 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1108` (shared_pair). -/
theorem middleSource_h1108 :
    (!((rowBit (I.sourceRows) 1 7 3 && rowBit (I.sourceRows) 1 7 4 && rowBit (I.sourceRows) 1 8 3 && rowBit (I.sourceRows) 1 8 4))) = true := by
  exact allOne_sharedPair_pointsBeforeCenters I
      (1 : Fin 3) (1 : Fin 3)
      (7 : Fin 13) (8 : Fin 13)
      (3 : Fin 13) (4 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1109` (shared_pair). -/
theorem middleSource_h1109 :
    (!((rowBit (I.sourceRows) 1 9 0 && rowBit (I.sourceRows) 1 9 8 && rowBit (I.sourceRows) 1 11 0 && rowBit (I.sourceRows) 1 11 8))) = true := by
  exact allOne_sharedPair_pointsBeforeCenters I
      (1 : Fin 3) (1 : Fin 3)
      (9 : Fin 13) (11 : Fin 13)
      (0 : Fin 13) (8 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1110` (shared_pair). -/
theorem middleSource_h1110 :
    (!((rowBit (I.sourceRows) 1 9 10 && rowBit (I.sourceRows) 1 9 11 && rowBit (I.sourceRows) 1 12 10 && rowBit (I.sourceRows) 1 12 11))) = true := by
  exact allOne_sharedPair_centersAroundPoints I
      (1 : Fin 3) (1 : Fin 3)
      (9 : Fin 13) (12 : Fin 13)
      (10 : Fin 13) (11 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1111` (shared_pair). -/
theorem middleSource_h1111 :
    (!((rowBit (I.sourceRows) 1 10 2 && rowBit (I.sourceRows) 1 10 9 && rowBit (I.sourceRows) 1 11 2 && rowBit (I.sourceRows) 1 11 9))) = true := by
  exact allOne_sharedPair_pointsBeforeCenters I
      (1 : Fin 3) (1 : Fin 3)
      (10 : Fin 13) (11 : Fin 13)
      (2 : Fin 13) (9 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1112` (shared_pair). -/
theorem middleSource_h1112 :
    (!((rowBit (I.sourceRows) 1 10 2 && rowBit (I.sourceRows) 1 10 9 && rowBit (I.sourceRows) 1 12 2 && rowBit (I.sourceRows) 1 12 9))) = true := by
  exact allOne_sharedPair_pointsBeforeCenters I
      (1 : Fin 3) (1 : Fin 3)
      (10 : Fin 13) (12 : Fin 13)
      (2 : Fin 13) (9 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1113` (shared_pair). -/
theorem middleSource_h1113 :
    (!((rowBit (I.sourceRows) 1 11 2 && rowBit (I.sourceRows) 1 11 9 && rowBit (I.sourceRows) 1 12 2 && rowBit (I.sourceRows) 1 12 9))) = true := by
  exact allOne_sharedPair_pointsBeforeCenters I
      (1 : Fin 3) (1 : Fin 3)
      (11 : Fin 13) (12 : Fin 13)
      (2 : Fin 13) (9 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1114` (row_finalWrapBlock_le1). -/
theorem middleSource_h1114 :
    ((((bif rowBit (I.sourceRows) 1 0 0 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 1 0 8 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 1 0 9 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 1 0 10 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 1 0 11 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 1 0 12 then 1#4 else 0#4))).ule 1#4) = true := by
  simpa only [allOneFinalWrapBlockBitCount] using
    allOne_row_finalWrapBlock_count_le_one I
      (1 : Fin 3) (0 : Fin 13) (by decide)

/-- Candidate middle source assertion `h1115` (row_initialBlock_le1). -/
theorem middleSource_h1115 :
    ((((bif rowBit (I.sourceRows) 1 4 0 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 1 4 1 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 1 4 2 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 1 4 3 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 1 4 4 then 1#4 else 0#4))).ule 1#4) = true := by
  simpa only [allOneInitialBlockBitCount] using
    allOne_row_initialBlock_count_le_one I
      (1 : Fin 3) (4 : Fin 13) (by decide)

/-- Candidate middle source assertion `h1116` (center). -/
theorem middleSource_h1116 :
    (!(rowBit (I.sourceRows) 2 0 0)) = true := by
  exact allOne_row_center_excluded I (2 : Fin 3) (0 : Fin 13)

/-- Candidate middle source assertion `h1117` (center). -/
theorem middleSource_h1117 :
    (!(rowBit (I.sourceRows) 2 1 1)) = true := by
  exact allOne_row_center_excluded I (2 : Fin 3) (1 : Fin 13)

/-- Candidate middle source assertion `h1118` (center). -/
theorem middleSource_h1118 :
    (!(rowBit (I.sourceRows) 2 2 2)) = true := by
  exact allOne_row_center_excluded I (2 : Fin 3) (2 : Fin 13)

/-- Candidate middle source assertion `h1119` (center). -/
theorem middleSource_h1119 :
    (!(rowBit (I.sourceRows) 2 3 3)) = true := by
  exact allOne_row_center_excluded I (2 : Fin 3) (3 : Fin 13)

/-- Candidate middle source assertion `h1120` (center). -/
theorem middleSource_h1120 :
    (!(rowBit (I.sourceRows) 2 4 4)) = true := by
  exact allOne_row_center_excluded I (2 : Fin 3) (4 : Fin 13)

/-- Candidate middle source assertion `h1121` (center). -/
theorem middleSource_h1121 :
    (!(rowBit (I.sourceRows) 2 5 5)) = true := by
  exact allOne_row_center_excluded I (2 : Fin 3) (5 : Fin 13)

/-- Candidate middle source assertion `h1122` (center). -/
theorem middleSource_h1122 :
    (!(rowBit (I.sourceRows) 2 6 6)) = true := by
  exact allOne_row_center_excluded I (2 : Fin 3) (6 : Fin 13)

/-- Candidate middle source assertion `h1123` (center). -/
theorem middleSource_h1123 :
    (!(rowBit (I.sourceRows) 2 7 7)) = true := by
  exact allOne_row_center_excluded I (2 : Fin 3) (7 : Fin 13)

/-- Candidate middle source assertion `h1124` (center). -/
theorem middleSource_h1124 :
    (!(rowBit (I.sourceRows) 2 8 8)) = true := by
  exact allOne_row_center_excluded I (2 : Fin 3) (8 : Fin 13)

/-- Candidate middle source assertion `h1125` (card). -/
theorem middleSource_h1125 :
    ((((bif rowBit (I.sourceRows) 2 8 0 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 2 8 1 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 2 8 2 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 2 8 3 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 2 8 4 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 2 8 5 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 2 8 6 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 2 8 7 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 2 8 8 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 2 8 9 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 2 8 10 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 2 8 11 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 2 8 12 then 1#4 else 0#4)) == 4#4)) = true := by
  simpa only [allOneBitCount13] using
    allOne_row_card_eq_four I (2 : Fin 3) (8 : Fin 13)

/-- Candidate middle source assertion `h1126` (center). -/
theorem middleSource_h1126 :
    (!(rowBit (I.sourceRows) 2 9 9)) = true := by
  exact allOne_row_center_excluded I (2 : Fin 3) (9 : Fin 13)

/-- Candidate middle source assertion `h1127` (card). -/
theorem middleSource_h1127 :
    ((((bif rowBit (I.sourceRows) 2 9 0 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 2 9 1 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 2 9 2 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 2 9 3 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 2 9 4 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 2 9 5 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 2 9 6 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 2 9 7 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 2 9 8 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 2 9 9 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 2 9 10 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 2 9 11 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 2 9 12 then 1#4 else 0#4)) == 4#4)) = true := by
  simpa only [allOneBitCount13] using
    allOne_row_card_eq_four I (2 : Fin 3) (9 : Fin 13)

/-- Candidate middle source assertion `h1128` (center). -/
theorem middleSource_h1128 :
    (!(rowBit (I.sourceRows) 2 10 10)) = true := by
  exact allOne_row_center_excluded I (2 : Fin 3) (10 : Fin 13)

/-- Candidate middle source assertion `h1129` (center). -/
theorem middleSource_h1129 :
    (!(rowBit (I.sourceRows) 2 11 11)) = true := by
  exact allOne_row_center_excluded I (2 : Fin 3) (11 : Fin 13)

/-- Candidate middle source assertion `h1130` (center). -/
theorem middleSource_h1130 :
    (!(rowBit (I.sourceRows) 2 12 12)) = true := by
  exact allOne_row_center_excluded I (2 : Fin 3) (12 : Fin 13)

/-- Candidate middle source assertion `h1131` (family_pair_centers). -/
theorem middleSource_h1131 :
    ((((bif (rowBit (I.sourceRows) 2 0 10 && rowBit (I.sourceRows) 2 0 11) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 2 1 10 && rowBit (I.sourceRows) 2 1 11) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 2 2 10 && rowBit (I.sourceRows) 2 2 11) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 2 3 10 && rowBit (I.sourceRows) 2 3 11) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 2 4 10 && rowBit (I.sourceRows) 2 4 11) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 2 5 10 && rowBit (I.sourceRows) 2 5 11) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 2 6 10 && rowBit (I.sourceRows) 2 6 11) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 2 7 10 && rowBit (I.sourceRows) 2 7 11) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 2 8 10 && rowBit (I.sourceRows) 2 8 11) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 2 9 10 && rowBit (I.sourceRows) 2 9 11) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 2 10 10 && rowBit (I.sourceRows) 2 10 11) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 2 11 10 && rowBit (I.sourceRows) 2 11 11) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 2 12 10 && rowBit (I.sourceRows) 2 12 11) then 1#4 else 0#4))).ule 2#4) = true := by
  simpa only [allOneBitCount13] using
    allOne_family_pair_center_count_le_two I
      (2 : Fin 3) (10 : Fin 13) (11 : Fin 13) (by decide)

/-- Candidate middle source assertion `h1132` (shared_pair). -/
theorem middleSource_h1132 :
    (!((rowBit (I.sourceRows) 2 1 4 && rowBit (I.sourceRows) 2 1 5 && rowBit (I.sourceRows) 2 2 4 && rowBit (I.sourceRows) 2 2 5))) = true := by
  exact allOne_sharedPair_centersBeforePoints I
      (2 : Fin 3) (2 : Fin 3)
      (1 : Fin 13) (2 : Fin 13)
      (4 : Fin 13) (5 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1133` (shared_pair). -/
theorem middleSource_h1133 :
    (!((rowBit (I.sourceRows) 2 6 1 && rowBit (I.sourceRows) 2 6 4 && rowBit (I.sourceRows) 2 8 1 && rowBit (I.sourceRows) 2 8 4))) = true := by
  exact allOne_sharedPair_pointsBeforeCenters I
      (2 : Fin 3) (2 : Fin 3)
      (6 : Fin 13) (8 : Fin 13)
      (1 : Fin 13) (4 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1134` (shared_pair). -/
theorem middleSource_h1134 :
    (!((rowBit (I.sourceRows) 2 7 1 && rowBit (I.sourceRows) 2 7 4 && rowBit (I.sourceRows) 2 8 1 && rowBit (I.sourceRows) 2 8 4))) = true := by
  exact allOne_sharedPair_pointsBeforeCenters I
      (2 : Fin 3) (2 : Fin 3)
      (7 : Fin 13) (8 : Fin 13)
      (1 : Fin 13) (4 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1135` (shared_pair). -/
theorem middleSource_h1135 :
    (!((rowBit (I.sourceRows) 2 8 0 && rowBit (I.sourceRows) 2 8 1 && rowBit (I.sourceRows) 2 9 0 && rowBit (I.sourceRows) 2 9 1))) = true := by
  exact allOne_sharedPair_pointsBeforeCenters I
      (2 : Fin 3) (2 : Fin 3)
      (8 : Fin 13) (9 : Fin 13)
      (0 : Fin 13) (1 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1136` (shared_pair). -/
theorem middleSource_h1136 :
    (!((rowBit (I.sourceRows) 2 8 1 && rowBit (I.sourceRows) 2 8 4 && rowBit (I.sourceRows) 2 9 1 && rowBit (I.sourceRows) 2 9 4))) = true := by
  exact allOne_sharedPair_pointsBeforeCenters I
      (2 : Fin 3) (2 : Fin 3)
      (8 : Fin 13) (9 : Fin 13)
      (1 : Fin 13) (4 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1137` (shared_pair). -/
theorem middleSource_h1137 :
    (!((rowBit (I.sourceRows) 2 8 1 && rowBit (I.sourceRows) 2 8 10 && rowBit (I.sourceRows) 2 9 1 && rowBit (I.sourceRows) 2 9 10))) = true := by
  exact allOne_sharedPair_pointsAroundCenters I
      (2 : Fin 3) (2 : Fin 3)
      (8 : Fin 13) (9 : Fin 13)
      (1 : Fin 13) (10 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1138` (shared_pair). -/
theorem middleSource_h1138 :
    (!((rowBit (I.sourceRows) 2 8 1 && rowBit (I.sourceRows) 2 8 11 && rowBit (I.sourceRows) 2 9 1 && rowBit (I.sourceRows) 2 9 11))) = true := by
  exact allOne_sharedPair_pointsAroundCenters I
      (2 : Fin 3) (2 : Fin 3)
      (8 : Fin 13) (9 : Fin 13)
      (1 : Fin 13) (11 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1139` (shared_pair). -/
theorem middleSource_h1139 :
    (!((rowBit (I.sourceRows) 2 8 1 && rowBit (I.sourceRows) 2 8 12 && rowBit (I.sourceRows) 2 9 1 && rowBit (I.sourceRows) 2 9 12))) = true := by
  exact allOne_sharedPair_pointsAroundCenters I
      (2 : Fin 3) (2 : Fin 3)
      (8 : Fin 13) (9 : Fin 13)
      (1 : Fin 13) (12 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1140` (shared_pair). -/
theorem middleSource_h1140 :
    (!((rowBit (I.sourceRows) 2 8 5 && rowBit (I.sourceRows) 2 8 11 && rowBit (I.sourceRows) 2 9 5 && rowBit (I.sourceRows) 2 9 11))) = true := by
  exact allOne_sharedPair_pointsAroundCenters I
      (2 : Fin 3) (2 : Fin 3)
      (8 : Fin 13) (9 : Fin 13)
      (5 : Fin 13) (11 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1141` (shared_pair). -/
theorem middleSource_h1141 :
    (!((rowBit (I.sourceRows) 2 8 5 && rowBit (I.sourceRows) 2 8 12 && rowBit (I.sourceRows) 2 9 5 && rowBit (I.sourceRows) 2 9 12))) = true := by
  exact allOne_sharedPair_pointsAroundCenters I
      (2 : Fin 3) (2 : Fin 3)
      (8 : Fin 13) (9 : Fin 13)
      (5 : Fin 13) (12 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1142` (shared_pair). -/
theorem middleSource_h1142 :
    (!((rowBit (I.sourceRows) 2 8 6 && rowBit (I.sourceRows) 2 8 11 && rowBit (I.sourceRows) 2 9 6 && rowBit (I.sourceRows) 2 9 11))) = true := by
  exact allOne_sharedPair_pointsAroundCenters I
      (2 : Fin 3) (2 : Fin 3)
      (8 : Fin 13) (9 : Fin 13)
      (6 : Fin 13) (11 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1143` (shared_pair). -/
theorem middleSource_h1143 :
    (!((rowBit (I.sourceRows) 2 8 6 && rowBit (I.sourceRows) 2 8 12 && rowBit (I.sourceRows) 2 9 6 && rowBit (I.sourceRows) 2 9 12))) = true := by
  exact allOne_sharedPair_pointsAroundCenters I
      (2 : Fin 3) (2 : Fin 3)
      (8 : Fin 13) (9 : Fin 13)
      (6 : Fin 13) (12 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1144` (shared_pair). -/
theorem middleSource_h1144 :
    (!((rowBit (I.sourceRows) 2 9 0 && rowBit (I.sourceRows) 2 9 8 && rowBit (I.sourceRows) 2 11 0 && rowBit (I.sourceRows) 2 11 8))) = true := by
  exact allOne_sharedPair_pointsBeforeCenters I
      (2 : Fin 3) (2 : Fin 3)
      (9 : Fin 13) (11 : Fin 13)
      (0 : Fin 13) (8 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1145` (shared_pair). -/
theorem middleSource_h1145 :
    (!((rowBit (I.sourceRows) 2 9 10 && rowBit (I.sourceRows) 2 9 11 && rowBit (I.sourceRows) 2 12 10 && rowBit (I.sourceRows) 2 12 11))) = true := by
  exact allOne_sharedPair_centersAroundPoints I
      (2 : Fin 3) (2 : Fin 3)
      (9 : Fin 13) (12 : Fin 13)
      (10 : Fin 13) (11 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1146` (shared_pair). -/
theorem middleSource_h1146 :
    (!((rowBit (I.sourceRows) 2 10 2 && rowBit (I.sourceRows) 2 10 9 && rowBit (I.sourceRows) 2 11 2 && rowBit (I.sourceRows) 2 11 9))) = true := by
  exact allOne_sharedPair_pointsBeforeCenters I
      (2 : Fin 3) (2 : Fin 3)
      (10 : Fin 13) (11 : Fin 13)
      (2 : Fin 13) (9 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1147` (shared_pair). -/
theorem middleSource_h1147 :
    (!((rowBit (I.sourceRows) 2 10 2 && rowBit (I.sourceRows) 2 10 9 && rowBit (I.sourceRows) 2 12 2 && rowBit (I.sourceRows) 2 12 9))) = true := by
  exact allOne_sharedPair_pointsBeforeCenters I
      (2 : Fin 3) (2 : Fin 3)
      (10 : Fin 13) (12 : Fin 13)
      (2 : Fin 13) (9 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1148` (shared_pair). -/
theorem middleSource_h1148 :
    (!((rowBit (I.sourceRows) 2 11 2 && rowBit (I.sourceRows) 2 11 9 && rowBit (I.sourceRows) 2 12 2 && rowBit (I.sourceRows) 2 12 9))) = true := by
  exact allOne_sharedPair_pointsBeforeCenters I
      (2 : Fin 3) (2 : Fin 3)
      (11 : Fin 13) (12 : Fin 13)
      (2 : Fin 13) (9 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1149` (row_finalWrapBlock_le2). -/
theorem middleSource_h1149 :
    ((((bif rowBit (I.sourceRows) 2 9 0 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 2 9 8 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 2 9 9 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 2 9 10 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 2 9 11 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 2 9 12 then 1#4 else 0#4))).ule 2#4) = true := by
  simpa only [allOneFinalWrapBlockBitCount] using
    allOne_row_finalWrapBlock_count_le_two I
      (2 : Fin 3) (9 : Fin 13) (by decide)

/-- Candidate middle source assertion `h1150` (row_finalWrapBlock_le1). -/
theorem middleSource_h1150 :
    ((((bif rowBit (I.sourceRows) 2 0 0 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 2 0 8 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 2 0 9 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 2 0 10 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 2 0 11 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 2 0 12 then 1#4 else 0#4))).ule 1#4) = true := by
  simpa only [allOneFinalWrapBlockBitCount] using
    allOne_row_finalWrapBlock_count_le_one I
      (2 : Fin 3) (0 : Fin 13) (by decide)

/-- Candidate middle source assertion `h1151` (shared_pair). -/
theorem middleSource_h1151 :
    (!((rowBit (I.sourceRows) 2 8 1 && rowBit (I.sourceRows) 2 8 5 && rowBit (I.sourceRows) 2 9 1 && rowBit (I.sourceRows) 2 9 5))) = true := by
  exact allOne_sharedPair_pointsBeforeCenters I
      (2 : Fin 3) (2 : Fin 3)
      (8 : Fin 13) (9 : Fin 13)
      (1 : Fin 13) (5 : Fin 13)
      (by decide) (by decide) (by decide)

end

end ATailExactFiveCard13AllOneSourceIngressScratch
end Problem97
