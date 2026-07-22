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

/-- Candidate middle source assertion `h1152` (shared_pair). -/
theorem middleSource_h1152 :
    (!((rowBit (I.sourceRows) 2 8 1 && rowBit (I.sourceRows) 2 8 6 && rowBit (I.sourceRows) 2 9 1 && rowBit (I.sourceRows) 2 9 6))) = true := by
  exact allOne_sharedPair_pointsBeforeCenters I
      (2 : Fin 3) (2 : Fin 3)
      (8 : Fin 13) (9 : Fin 13)
      (1 : Fin 13) (6 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1153` (shared_pair). -/
theorem middleSource_h1153 :
    (!((rowBit (I.sourceRows) 2 8 1 && rowBit (I.sourceRows) 2 8 7 && rowBit (I.sourceRows) 2 9 1 && rowBit (I.sourceRows) 2 9 7))) = true := by
  exact allOne_sharedPair_pointsBeforeCenters I
      (2 : Fin 3) (2 : Fin 3)
      (8 : Fin 13) (9 : Fin 13)
      (1 : Fin 13) (7 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1154` (row_initialBlock_le1). -/
theorem middleSource_h1154 :
    ((((bif rowBit (I.sourceRows) 2 4 0 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 2 4 1 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 2 4 2 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 2 4 3 then 1#4 else 0#4) + (bif rowBit (I.sourceRows) 2 4 4 then 1#4 else 0#4))).ule 1#4) = true := by
  simpa only [allOneInitialBlockBitCount] using
    allOne_row_initialBlock_count_le_one I
      (2 : Fin 3) (4 : Fin 13) (by decide)

/-- Candidate middle source assertion `h1155` (shared_pair). -/
theorem middleSource_h1155 :
    (!((rowBit (I.sourceRows) 0 0 4 && rowBit (I.sourceRows) 0 0 5 && rowBit (I.sourceRows) 1 1 4 && rowBit (I.sourceRows) 1 1 5))) = true := by
  exact allOne_sharedPair_centersBeforePoints I
      (0 : Fin 3) (1 : Fin 3)
      (0 : Fin 13) (1 : Fin 13)
      (4 : Fin 13) (5 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1156` (shared_pair). -/
theorem middleSource_h1156 :
    (!((rowBit (I.sourceRows) 1 0 4 && rowBit (I.sourceRows) 1 0 5 && rowBit (I.sourceRows) 0 1 4 && rowBit (I.sourceRows) 0 1 5))) = true := by
  exact allOne_sharedPair_centersBeforePoints I
      (1 : Fin 3) (0 : Fin 3)
      (0 : Fin 13) (1 : Fin 13)
      (4 : Fin 13) (5 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1157` (shared_pair). -/
theorem middleSource_h1157 :
    (!((rowBit (I.sourceRows) 0 1 4 && rowBit (I.sourceRows) 0 1 5 && rowBit (I.sourceRows) 1 2 4 && rowBit (I.sourceRows) 1 2 5))) = true := by
  exact allOne_sharedPair_centersBeforePoints I
      (0 : Fin 3) (1 : Fin 3)
      (1 : Fin 13) (2 : Fin 13)
      (4 : Fin 13) (5 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1158` (shared_pair). -/
theorem middleSource_h1158 :
    (!((rowBit (I.sourceRows) 1 1 4 && rowBit (I.sourceRows) 1 1 5 && rowBit (I.sourceRows) 0 2 4 && rowBit (I.sourceRows) 0 2 5))) = true := by
  exact allOne_sharedPair_centersBeforePoints I
      (1 : Fin 3) (0 : Fin 3)
      (1 : Fin 13) (2 : Fin 13)
      (4 : Fin 13) (5 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1159` (shared_pair). -/
theorem middleSource_h1159 :
    (!((rowBit (I.sourceRows) 0 1 3 && rowBit (I.sourceRows) 0 1 4 && rowBit (I.sourceRows) 1 8 3 && rowBit (I.sourceRows) 1 8 4))) = true := by
  exact allOne_sharedPair_centersAroundPoints I
      (0 : Fin 3) (1 : Fin 3)
      (1 : Fin 13) (8 : Fin 13)
      (3 : Fin 13) (4 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1160` (shared_pair). -/
theorem middleSource_h1160 :
    (!((rowBit (I.sourceRows) 0 1 3 && rowBit (I.sourceRows) 0 1 5 && rowBit (I.sourceRows) 1 8 3 && rowBit (I.sourceRows) 1 8 5))) = true := by
  exact allOne_sharedPair_centersAroundPoints I
      (0 : Fin 3) (1 : Fin 3)
      (1 : Fin 13) (8 : Fin 13)
      (3 : Fin 13) (5 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1161` (shared_pair). -/
theorem middleSource_h1161 :
    (!((rowBit (I.sourceRows) 0 1 3 && rowBit (I.sourceRows) 0 1 6 && rowBit (I.sourceRows) 1 8 3 && rowBit (I.sourceRows) 1 8 6))) = true := by
  exact allOne_sharedPair_centersAroundPoints I
      (0 : Fin 3) (1 : Fin 3)
      (1 : Fin 13) (8 : Fin 13)
      (3 : Fin 13) (6 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1162` (shared_pair). -/
theorem middleSource_h1162 :
    (!((rowBit (I.sourceRows) 0 1 3 && rowBit (I.sourceRows) 0 1 7 && rowBit (I.sourceRows) 1 8 3 && rowBit (I.sourceRows) 1 8 7))) = true := by
  exact allOne_sharedPair_centersAroundPoints I
      (0 : Fin 3) (1 : Fin 3)
      (1 : Fin 13) (8 : Fin 13)
      (3 : Fin 13) (7 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1163` (shared_pair). -/
theorem middleSource_h1163 :
    (!((rowBit (I.sourceRows) 0 2 0 && rowBit (I.sourceRows) 0 2 1 && rowBit (I.sourceRows) 1 3 0 && rowBit (I.sourceRows) 1 3 1))) = true := by
  exact allOne_sharedPair_pointsBeforeCenters I
      (0 : Fin 3) (1 : Fin 3)
      (2 : Fin 13) (3 : Fin 13)
      (0 : Fin 13) (1 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1164` (shared_pair). -/
theorem middleSource_h1164 :
    (!((rowBit (I.sourceRows) 0 2 0 && rowBit (I.sourceRows) 0 2 1 && rowBit (I.sourceRows) 1 5 0 && rowBit (I.sourceRows) 1 5 1))) = true := by
  exact allOne_sharedPair_pointsBeforeCenters I
      (0 : Fin 3) (1 : Fin 3)
      (2 : Fin 13) (5 : Fin 13)
      (0 : Fin 13) (1 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1165` (shared_pair). -/
theorem middleSource_h1165 :
    (!((rowBit (I.sourceRows) 0 2 0 && rowBit (I.sourceRows) 0 2 1 && rowBit (I.sourceRows) 1 6 0 && rowBit (I.sourceRows) 1 6 1))) = true := by
  exact allOne_sharedPair_pointsBeforeCenters I
      (0 : Fin 3) (1 : Fin 3)
      (2 : Fin 13) (6 : Fin 13)
      (0 : Fin 13) (1 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1166` (shared_pair). -/
theorem middleSource_h1166 :
    (!((rowBit (I.sourceRows) 0 2 0 && rowBit (I.sourceRows) 0 2 1 && rowBit (I.sourceRows) 1 7 0 && rowBit (I.sourceRows) 1 7 1))) = true := by
  exact allOne_sharedPair_pointsBeforeCenters I
      (0 : Fin 3) (1 : Fin 3)
      (2 : Fin 13) (7 : Fin 13)
      (0 : Fin 13) (1 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1167` (shared_pair). -/
theorem middleSource_h1167 :
    (!((rowBit (I.sourceRows) 0 2 0 && rowBit (I.sourceRows) 0 2 1 && rowBit (I.sourceRows) 1 8 0 && rowBit (I.sourceRows) 1 8 1))) = true := by
  exact allOne_sharedPair_pointsBeforeCenters I
      (0 : Fin 3) (1 : Fin 3)
      (2 : Fin 13) (8 : Fin 13)
      (0 : Fin 13) (1 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1168` (shared_pair). -/
theorem middleSource_h1168 :
    (!((rowBit (I.sourceRows) 0 2 3 && rowBit (I.sourceRows) 0 2 4 && rowBit (I.sourceRows) 1 8 3 && rowBit (I.sourceRows) 1 8 4))) = true := by
  exact allOne_sharedPair_centersAroundPoints I
      (0 : Fin 3) (1 : Fin 3)
      (2 : Fin 13) (8 : Fin 13)
      (3 : Fin 13) (4 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1169` (shared_pair). -/
theorem middleSource_h1169 :
    (!((rowBit (I.sourceRows) 0 2 3 && rowBit (I.sourceRows) 0 2 5 && rowBit (I.sourceRows) 1 8 3 && rowBit (I.sourceRows) 1 8 5))) = true := by
  exact allOne_sharedPair_centersAroundPoints I
      (0 : Fin 3) (1 : Fin 3)
      (2 : Fin 13) (8 : Fin 13)
      (3 : Fin 13) (5 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1170` (shared_pair). -/
theorem middleSource_h1170 :
    (!((rowBit (I.sourceRows) 0 2 3 && rowBit (I.sourceRows) 0 2 6 && rowBit (I.sourceRows) 1 8 3 && rowBit (I.sourceRows) 1 8 6))) = true := by
  exact allOne_sharedPair_centersAroundPoints I
      (0 : Fin 3) (1 : Fin 3)
      (2 : Fin 13) (8 : Fin 13)
      (3 : Fin 13) (6 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1171` (shared_pair). -/
theorem middleSource_h1171 :
    (!((rowBit (I.sourceRows) 0 2 3 && rowBit (I.sourceRows) 0 2 7 && rowBit (I.sourceRows) 1 8 3 && rowBit (I.sourceRows) 1 8 7))) = true := by
  exact allOne_sharedPair_centersAroundPoints I
      (0 : Fin 3) (1 : Fin 3)
      (2 : Fin 13) (8 : Fin 13)
      (3 : Fin 13) (7 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1172` (shared_pair). -/
theorem middleSource_h1172 :
    (!((rowBit (I.sourceRows) 0 2 0 && rowBit (I.sourceRows) 0 2 1 && rowBit (I.sourceRows) 1 9 0 && rowBit (I.sourceRows) 1 9 1))) = true := by
  exact allOne_sharedPair_pointsBeforeCenters I
      (0 : Fin 3) (1 : Fin 3)
      (2 : Fin 13) (9 : Fin 13)
      (0 : Fin 13) (1 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1173` (shared_pair). -/
theorem middleSource_h1173 :
    (!((rowBit (I.sourceRows) 0 2 0 && rowBit (I.sourceRows) 0 2 1 && rowBit (I.sourceRows) 1 10 0 && rowBit (I.sourceRows) 1 10 1))) = true := by
  exact allOne_sharedPair_pointsBeforeCenters I
      (0 : Fin 3) (1 : Fin 3)
      (2 : Fin 13) (10 : Fin 13)
      (0 : Fin 13) (1 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1174` (shared_pair). -/
theorem middleSource_h1174 :
    (!((rowBit (I.sourceRows) 0 2 0 && rowBit (I.sourceRows) 0 2 1 && rowBit (I.sourceRows) 1 11 0 && rowBit (I.sourceRows) 1 11 1))) = true := by
  exact allOne_sharedPair_pointsBeforeCenters I
      (0 : Fin 3) (1 : Fin 3)
      (2 : Fin 13) (11 : Fin 13)
      (0 : Fin 13) (1 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1175` (shared_pair). -/
theorem middleSource_h1175 :
    (!((rowBit (I.sourceRows) 0 2 0 && rowBit (I.sourceRows) 0 2 1 && rowBit (I.sourceRows) 1 12 0 && rowBit (I.sourceRows) 1 12 1))) = true := by
  exact allOne_sharedPair_pointsBeforeCenters I
      (0 : Fin 3) (1 : Fin 3)
      (2 : Fin 13) (12 : Fin 13)
      (0 : Fin 13) (1 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1176` (shared_pair). -/
theorem middleSource_h1176 :
    (!((rowBit (I.sourceRows) 1 5 3 && rowBit (I.sourceRows) 1 5 4 && rowBit (I.sourceRows) 0 6 3 && rowBit (I.sourceRows) 0 6 4))) = true := by
  exact allOne_sharedPair_pointsBeforeCenters I
      (1 : Fin 3) (0 : Fin 3)
      (5 : Fin 13) (6 : Fin 13)
      (3 : Fin 13) (4 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1177` (shared_pair). -/
theorem middleSource_h1177 :
    (!((rowBit (I.sourceRows) 0 5 0 && rowBit (I.sourceRows) 0 5 4 && rowBit (I.sourceRows) 1 8 0 && rowBit (I.sourceRows) 1 8 4))) = true := by
  exact allOne_sharedPair_pointsBeforeCenters I
      (0 : Fin 3) (1 : Fin 3)
      (5 : Fin 13) (8 : Fin 13)
      (0 : Fin 13) (4 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1178` (shared_pair). -/
theorem middleSource_h1178 :
    (!((rowBit (I.sourceRows) 0 5 3 && rowBit (I.sourceRows) 0 5 4 && rowBit (I.sourceRows) 1 8 3 && rowBit (I.sourceRows) 1 8 4))) = true := by
  exact allOne_sharedPair_pointsBeforeCenters I
      (0 : Fin 3) (1 : Fin 3)
      (5 : Fin 13) (8 : Fin 13)
      (3 : Fin 13) (4 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1179` (shared_pair). -/
theorem middleSource_h1179 :
    (!((rowBit (I.sourceRows) 0 5 4 && rowBit (I.sourceRows) 0 5 9 && rowBit (I.sourceRows) 1 8 4 && rowBit (I.sourceRows) 1 8 9))) = true := by
  exact allOne_sharedPair_pointsAroundCenters I
      (0 : Fin 3) (1 : Fin 3)
      (5 : Fin 13) (8 : Fin 13)
      (4 : Fin 13) (9 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1180` (shared_pair). -/
theorem middleSource_h1180 :
    (!((rowBit (I.sourceRows) 0 5 4 && rowBit (I.sourceRows) 0 5 10 && rowBit (I.sourceRows) 1 8 4 && rowBit (I.sourceRows) 1 8 10))) = true := by
  exact allOne_sharedPair_pointsAroundCenters I
      (0 : Fin 3) (1 : Fin 3)
      (5 : Fin 13) (8 : Fin 13)
      (4 : Fin 13) (10 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1181` (shared_pair). -/
theorem middleSource_h1181 :
    (!((rowBit (I.sourceRows) 0 5 4 && rowBit (I.sourceRows) 0 5 12 && rowBit (I.sourceRows) 1 8 4 && rowBit (I.sourceRows) 1 8 12))) = true := by
  exact allOne_sharedPair_pointsAroundCenters I
      (0 : Fin 3) (1 : Fin 3)
      (5 : Fin 13) (8 : Fin 13)
      (4 : Fin 13) (12 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1182` (intersection). -/
theorem middleSource_h1182 :
    ((((bif (rowBit (I.sourceRows) 0 6 0 && rowBit (I.sourceRows) 1 8 0) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 6 1 && rowBit (I.sourceRows) 1 8 1) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 6 2 && rowBit (I.sourceRows) 1 8 2) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 6 3 && rowBit (I.sourceRows) 1 8 3) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 6 4 && rowBit (I.sourceRows) 1 8 4) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 6 5 && rowBit (I.sourceRows) 1 8 5) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 6 6 && rowBit (I.sourceRows) 1 8 6) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 6 7 && rowBit (I.sourceRows) 1 8 7) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 6 8 && rowBit (I.sourceRows) 1 8 8) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 6 9 && rowBit (I.sourceRows) 1 8 9) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 6 10 && rowBit (I.sourceRows) 1 8 10) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 6 11 && rowBit (I.sourceRows) 1 8 11) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 6 12 && rowBit (I.sourceRows) 1 8 12) then 1#4 else 0#4))).ule 2#4) = true := by
  simpa only [allOneBitCount13] using
    allOne_row_inter_card_le_two I
      (0 : Fin 3) (1 : Fin 3)
      (6 : Fin 13) (8 : Fin 13) (by decide)

/-- Candidate middle source assertion `h1183` (shared_pair). -/
theorem middleSource_h1183 :
    (!((rowBit (I.sourceRows) 0 6 0 && rowBit (I.sourceRows) 0 6 3 && rowBit (I.sourceRows) 1 8 0 && rowBit (I.sourceRows) 1 8 3))) = true := by
  exact allOne_sharedPair_pointsBeforeCenters I
      (0 : Fin 3) (1 : Fin 3)
      (6 : Fin 13) (8 : Fin 13)
      (0 : Fin 13) (3 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1184` (shared_pair). -/
theorem middleSource_h1184 :
    (!((rowBit (I.sourceRows) 0 6 0 && rowBit (I.sourceRows) 0 6 4 && rowBit (I.sourceRows) 1 8 0 && rowBit (I.sourceRows) 1 8 4))) = true := by
  exact allOne_sharedPair_pointsBeforeCenters I
      (0 : Fin 3) (1 : Fin 3)
      (6 : Fin 13) (8 : Fin 13)
      (0 : Fin 13) (4 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1185` (shared_pair). -/
theorem middleSource_h1185 :
    (!((rowBit (I.sourceRows) 0 6 3 && rowBit (I.sourceRows) 0 6 4 && rowBit (I.sourceRows) 1 8 3 && rowBit (I.sourceRows) 1 8 4))) = true := by
  exact allOne_sharedPair_pointsBeforeCenters I
      (0 : Fin 3) (1 : Fin 3)
      (6 : Fin 13) (8 : Fin 13)
      (3 : Fin 13) (4 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1186` (shared_pair). -/
theorem middleSource_h1186 :
    (!((rowBit (I.sourceRows) 0 6 3 && rowBit (I.sourceRows) 0 6 5 && rowBit (I.sourceRows) 1 8 3 && rowBit (I.sourceRows) 1 8 5))) = true := by
  exact allOne_sharedPair_pointsBeforeCenters I
      (0 : Fin 3) (1 : Fin 3)
      (6 : Fin 13) (8 : Fin 13)
      (3 : Fin 13) (5 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1187` (shared_pair). -/
theorem middleSource_h1187 :
    (!((rowBit (I.sourceRows) 0 6 3 && rowBit (I.sourceRows) 0 6 9 && rowBit (I.sourceRows) 1 8 3 && rowBit (I.sourceRows) 1 8 9))) = true := by
  exact allOne_sharedPair_pointsAroundCenters I
      (0 : Fin 3) (1 : Fin 3)
      (6 : Fin 13) (8 : Fin 13)
      (3 : Fin 13) (9 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1188` (shared_pair). -/
theorem middleSource_h1188 :
    (!((rowBit (I.sourceRows) 0 6 4 && rowBit (I.sourceRows) 0 6 9 && rowBit (I.sourceRows) 1 8 4 && rowBit (I.sourceRows) 1 8 9))) = true := by
  exact allOne_sharedPair_pointsAroundCenters I
      (0 : Fin 3) (1 : Fin 3)
      (6 : Fin 13) (8 : Fin 13)
      (4 : Fin 13) (9 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1189` (shared_pair). -/
theorem middleSource_h1189 :
    (!((rowBit (I.sourceRows) 0 6 4 && rowBit (I.sourceRows) 0 6 10 && rowBit (I.sourceRows) 1 8 4 && rowBit (I.sourceRows) 1 8 10))) = true := by
  exact allOne_sharedPair_pointsAroundCenters I
      (0 : Fin 3) (1 : Fin 3)
      (6 : Fin 13) (8 : Fin 13)
      (4 : Fin 13) (10 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1190` (shared_pair). -/
theorem middleSource_h1190 :
    (!((rowBit (I.sourceRows) 0 6 4 && rowBit (I.sourceRows) 0 6 11 && rowBit (I.sourceRows) 1 8 4 && rowBit (I.sourceRows) 1 8 11))) = true := by
  exact allOne_sharedPair_pointsAroundCenters I
      (0 : Fin 3) (1 : Fin 3)
      (6 : Fin 13) (8 : Fin 13)
      (4 : Fin 13) (11 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1191` (shared_pair). -/
theorem middleSource_h1191 :
    (!((rowBit (I.sourceRows) 0 6 4 && rowBit (I.sourceRows) 0 6 12 && rowBit (I.sourceRows) 1 8 4 && rowBit (I.sourceRows) 1 8 12))) = true := by
  exact allOne_sharedPair_pointsAroundCenters I
      (0 : Fin 3) (1 : Fin 3)
      (6 : Fin 13) (8 : Fin 13)
      (4 : Fin 13) (12 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1192` (shared_pair). -/
theorem middleSource_h1192 :
    (!((rowBit (I.sourceRows) 0 6 5 && rowBit (I.sourceRows) 0 6 9 && rowBit (I.sourceRows) 1 8 5 && rowBit (I.sourceRows) 1 8 9))) = true := by
  exact allOne_sharedPair_pointsAroundCenters I
      (0 : Fin 3) (1 : Fin 3)
      (6 : Fin 13) (8 : Fin 13)
      (5 : Fin 13) (9 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1193` (shared_pair). -/
theorem middleSource_h1193 :
    (!((rowBit (I.sourceRows) 0 6 5 && rowBit (I.sourceRows) 0 6 11 && rowBit (I.sourceRows) 1 8 5 && rowBit (I.sourceRows) 1 8 11))) = true := by
  exact allOne_sharedPair_pointsAroundCenters I
      (0 : Fin 3) (1 : Fin 3)
      (6 : Fin 13) (8 : Fin 13)
      (5 : Fin 13) (11 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1194` (shared_pair). -/
theorem middleSource_h1194 :
    (!((rowBit (I.sourceRows) 0 7 3 && rowBit (I.sourceRows) 0 7 4 && rowBit (I.sourceRows) 1 8 3 && rowBit (I.sourceRows) 1 8 4))) = true := by
  exact allOne_sharedPair_pointsBeforeCenters I
      (0 : Fin 3) (1 : Fin 3)
      (7 : Fin 13) (8 : Fin 13)
      (3 : Fin 13) (4 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1195` (shared_pair). -/
theorem middleSource_h1195 :
    (!((rowBit (I.sourceRows) 0 7 3 && rowBit (I.sourceRows) 0 7 5 && rowBit (I.sourceRows) 1 8 3 && rowBit (I.sourceRows) 1 8 5))) = true := by
  exact allOne_sharedPair_pointsBeforeCenters I
      (0 : Fin 3) (1 : Fin 3)
      (7 : Fin 13) (8 : Fin 13)
      (3 : Fin 13) (5 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1196` (shared_pair). -/
theorem middleSource_h1196 :
    (!((rowBit (I.sourceRows) 0 7 3 && rowBit (I.sourceRows) 0 7 6 && rowBit (I.sourceRows) 1 8 3 && rowBit (I.sourceRows) 1 8 6))) = true := by
  exact allOne_sharedPair_pointsBeforeCenters I
      (0 : Fin 3) (1 : Fin 3)
      (7 : Fin 13) (8 : Fin 13)
      (3 : Fin 13) (6 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1197` (shared_pair). -/
theorem middleSource_h1197 :
    (!((rowBit (I.sourceRows) 1 8 0 && rowBit (I.sourceRows) 1 8 3 && rowBit (I.sourceRows) 0 10 0 && rowBit (I.sourceRows) 0 10 3))) = true := by
  exact allOne_sharedPair_pointsBeforeCenters I
      (1 : Fin 3) (0 : Fin 3)
      (8 : Fin 13) (10 : Fin 13)
      (0 : Fin 13) (3 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1198` (shared_pair). -/
theorem middleSource_h1198 :
    (!((rowBit (I.sourceRows) 1 8 0 && rowBit (I.sourceRows) 1 8 4 && rowBit (I.sourceRows) 0 10 0 && rowBit (I.sourceRows) 0 10 4))) = true := by
  exact allOne_sharedPair_pointsBeforeCenters I
      (1 : Fin 3) (0 : Fin 3)
      (8 : Fin 13) (10 : Fin 13)
      (0 : Fin 13) (4 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1199` (shared_pair). -/
theorem middleSource_h1199 :
    (!((rowBit (I.sourceRows) 1 8 0 && rowBit (I.sourceRows) 1 8 6 && rowBit (I.sourceRows) 0 10 0 && rowBit (I.sourceRows) 0 10 6))) = true := by
  exact allOne_sharedPair_pointsBeforeCenters I
      (1 : Fin 3) (0 : Fin 3)
      (8 : Fin 13) (10 : Fin 13)
      (0 : Fin 13) (6 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1200` (shared_pair). -/
theorem middleSource_h1200 :
    (!((rowBit (I.sourceRows) 1 8 0 && rowBit (I.sourceRows) 1 8 7 && rowBit (I.sourceRows) 0 10 0 && rowBit (I.sourceRows) 0 10 7))) = true := by
  exact allOne_sharedPair_pointsBeforeCenters I
      (1 : Fin 3) (0 : Fin 3)
      (8 : Fin 13) (10 : Fin 13)
      (0 : Fin 13) (7 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1201` (shared_pair). -/
theorem middleSource_h1201 :
    (!((rowBit (I.sourceRows) 1 8 3 && rowBit (I.sourceRows) 1 8 11 && rowBit (I.sourceRows) 0 10 3 && rowBit (I.sourceRows) 0 10 11))) = true := by
  exact allOne_sharedPair_pointsAroundCenters I
      (1 : Fin 3) (0 : Fin 3)
      (8 : Fin 13) (10 : Fin 13)
      (3 : Fin 13) (11 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1202` (shared_pair). -/
theorem middleSource_h1202 :
    (!((rowBit (I.sourceRows) 1 8 3 && rowBit (I.sourceRows) 1 8 12 && rowBit (I.sourceRows) 0 10 3 && rowBit (I.sourceRows) 0 10 12))) = true := by
  exact allOne_sharedPair_pointsAroundCenters I
      (1 : Fin 3) (0 : Fin 3)
      (8 : Fin 13) (10 : Fin 13)
      (3 : Fin 13) (12 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1203` (shared_pair). -/
theorem middleSource_h1203 :
    (!((rowBit (I.sourceRows) 1 8 4 && rowBit (I.sourceRows) 1 8 12 && rowBit (I.sourceRows) 0 10 4 && rowBit (I.sourceRows) 0 10 12))) = true := by
  exact allOne_sharedPair_pointsAroundCenters I
      (1 : Fin 3) (0 : Fin 3)
      (8 : Fin 13) (10 : Fin 13)
      (4 : Fin 13) (12 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1204` (shared_pair). -/
theorem middleSource_h1204 :
    (!((rowBit (I.sourceRows) 1 8 5 && rowBit (I.sourceRows) 1 8 11 && rowBit (I.sourceRows) 0 10 5 && rowBit (I.sourceRows) 0 10 11))) = true := by
  exact allOne_sharedPair_pointsAroundCenters I
      (1 : Fin 3) (0 : Fin 3)
      (8 : Fin 13) (10 : Fin 13)
      (5 : Fin 13) (11 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1205` (shared_pair). -/
theorem middleSource_h1205 :
    (!((rowBit (I.sourceRows) 1 8 5 && rowBit (I.sourceRows) 1 8 12 && rowBit (I.sourceRows) 0 10 5 && rowBit (I.sourceRows) 0 10 12))) = true := by
  exact allOne_sharedPair_pointsAroundCenters I
      (1 : Fin 3) (0 : Fin 3)
      (8 : Fin 13) (10 : Fin 13)
      (5 : Fin 13) (12 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1206` (shared_pair). -/
theorem middleSource_h1206 :
    (!((rowBit (I.sourceRows) 1 8 7 && rowBit (I.sourceRows) 1 8 11 && rowBit (I.sourceRows) 0 10 7 && rowBit (I.sourceRows) 0 10 11))) = true := by
  exact allOne_sharedPair_pointsAroundCenters I
      (1 : Fin 3) (0 : Fin 3)
      (8 : Fin 13) (10 : Fin 13)
      (7 : Fin 13) (11 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1207` (shared_pair). -/
theorem middleSource_h1207 :
    (!((rowBit (I.sourceRows) 1 8 7 && rowBit (I.sourceRows) 1 8 12 && rowBit (I.sourceRows) 0 10 7 && rowBit (I.sourceRows) 0 10 12))) = true := by
  exact allOne_sharedPair_pointsAroundCenters I
      (1 : Fin 3) (0 : Fin 3)
      (8 : Fin 13) (10 : Fin 13)
      (7 : Fin 13) (12 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1208` (shared_pair). -/
theorem middleSource_h1208 :
    (!((rowBit (I.sourceRows) 1 8 0 && rowBit (I.sourceRows) 1 8 3 && rowBit (I.sourceRows) 0 11 0 && rowBit (I.sourceRows) 0 11 3))) = true := by
  exact allOne_sharedPair_pointsBeforeCenters I
      (1 : Fin 3) (0 : Fin 3)
      (8 : Fin 13) (11 : Fin 13)
      (0 : Fin 13) (3 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1209` (shared_pair). -/
theorem middleSource_h1209 :
    (!((rowBit (I.sourceRows) 1 8 0 && rowBit (I.sourceRows) 1 8 4 && rowBit (I.sourceRows) 0 11 0 && rowBit (I.sourceRows) 0 11 4))) = true := by
  exact allOne_sharedPair_pointsBeforeCenters I
      (1 : Fin 3) (0 : Fin 3)
      (8 : Fin 13) (11 : Fin 13)
      (0 : Fin 13) (4 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1210` (shared_pair). -/
theorem middleSource_h1210 :
    (!((rowBit (I.sourceRows) 1 8 0 && rowBit (I.sourceRows) 1 8 7 && rowBit (I.sourceRows) 0 11 0 && rowBit (I.sourceRows) 0 11 7))) = true := by
  exact allOne_sharedPair_pointsBeforeCenters I
      (1 : Fin 3) (0 : Fin 3)
      (8 : Fin 13) (11 : Fin 13)
      (0 : Fin 13) (7 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1211` (shared_pair). -/
theorem middleSource_h1211 :
    (!((rowBit (I.sourceRows) 1 8 3 && rowBit (I.sourceRows) 1 8 5 && rowBit (I.sourceRows) 0 11 3 && rowBit (I.sourceRows) 0 11 5))) = true := by
  exact allOne_sharedPair_pointsBeforeCenters I
      (1 : Fin 3) (0 : Fin 3)
      (8 : Fin 13) (11 : Fin 13)
      (3 : Fin 13) (5 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1212` (shared_pair). -/
theorem middleSource_h1212 :
    (!((rowBit (I.sourceRows) 1 8 3 && rowBit (I.sourceRows) 1 8 12 && rowBit (I.sourceRows) 0 11 3 && rowBit (I.sourceRows) 0 11 12))) = true := by
  exact allOne_sharedPair_pointsAroundCenters I
      (1 : Fin 3) (0 : Fin 3)
      (8 : Fin 13) (11 : Fin 13)
      (3 : Fin 13) (12 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1213` (shared_pair). -/
theorem middleSource_h1213 :
    (!((rowBit (I.sourceRows) 1 8 4 && rowBit (I.sourceRows) 1 8 12 && rowBit (I.sourceRows) 0 11 4 && rowBit (I.sourceRows) 0 11 12))) = true := by
  exact allOne_sharedPair_pointsAroundCenters I
      (1 : Fin 3) (0 : Fin 3)
      (8 : Fin 13) (11 : Fin 13)
      (4 : Fin 13) (12 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1214` (shared_pair). -/
theorem middleSource_h1214 :
    (!((rowBit (I.sourceRows) 1 8 7 && rowBit (I.sourceRows) 1 8 12 && rowBit (I.sourceRows) 0 11 7 && rowBit (I.sourceRows) 0 11 12))) = true := by
  exact allOne_sharedPair_pointsAroundCenters I
      (1 : Fin 3) (0 : Fin 3)
      (8 : Fin 13) (11 : Fin 13)
      (7 : Fin 13) (12 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1215` (shared_pair). -/
theorem middleSource_h1215 :
    (!((rowBit (I.sourceRows) 1 8 0 && rowBit (I.sourceRows) 1 8 3 && rowBit (I.sourceRows) 0 12 0 && rowBit (I.sourceRows) 0 12 3))) = true := by
  exact allOne_sharedPair_pointsBeforeCenters I
      (1 : Fin 3) (0 : Fin 3)
      (8 : Fin 13) (12 : Fin 13)
      (0 : Fin 13) (3 : Fin 13)
      (by decide) (by decide) (by decide)

end

end ATailExactFiveCard13AllOneSourceIngressScratch
end Problem97
