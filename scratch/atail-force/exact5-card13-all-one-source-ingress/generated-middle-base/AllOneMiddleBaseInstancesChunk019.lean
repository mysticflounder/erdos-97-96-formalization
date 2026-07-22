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

/-- Candidate middle source assertion `h1216` (shared_pair). -/
theorem middleSource_h1216 :
    (!((rowBit (I.sourceRows) 1 8 3 && rowBit (I.sourceRows) 1 8 4 && rowBit (I.sourceRows) 0 12 3 && rowBit (I.sourceRows) 0 12 4))) = true := by
  exact allOne_sharedPair_pointsBeforeCenters I
      (1 : Fin 3) (0 : Fin 3)
      (8 : Fin 13) (12 : Fin 13)
      (3 : Fin 13) (4 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1217` (shared_pair). -/
theorem middleSource_h1217 :
    (!((rowBit (I.sourceRows) 1 8 3 && rowBit (I.sourceRows) 1 8 5 && rowBit (I.sourceRows) 0 12 3 && rowBit (I.sourceRows) 0 12 5))) = true := by
  exact allOne_sharedPair_pointsBeforeCenters I
      (1 : Fin 3) (0 : Fin 3)
      (8 : Fin 13) (12 : Fin 13)
      (3 : Fin 13) (5 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1218` (shared_pair). -/
theorem middleSource_h1218 :
    (!((rowBit (I.sourceRows) 0 9 0 && rowBit (I.sourceRows) 0 9 8 && rowBit (I.sourceRows) 1 11 0 && rowBit (I.sourceRows) 1 11 8))) = true := by
  exact allOne_sharedPair_pointsBeforeCenters I
      (0 : Fin 3) (1 : Fin 3)
      (9 : Fin 13) (11 : Fin 13)
      (0 : Fin 13) (8 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1219` (shared_pair). -/
theorem middleSource_h1219 :
    (!((rowBit (I.sourceRows) 1 9 0 && rowBit (I.sourceRows) 1 9 8 && rowBit (I.sourceRows) 0 11 0 && rowBit (I.sourceRows) 0 11 8))) = true := by
  exact allOne_sharedPair_pointsBeforeCenters I
      (1 : Fin 3) (0 : Fin 3)
      (9 : Fin 13) (11 : Fin 13)
      (0 : Fin 13) (8 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1220` (shared_pair). -/
theorem middleSource_h1220 :
    (!((rowBit (I.sourceRows) 0 10 2 && rowBit (I.sourceRows) 0 10 9 && rowBit (I.sourceRows) 1 11 2 && rowBit (I.sourceRows) 1 11 9))) = true := by
  exact allOne_sharedPair_pointsBeforeCenters I
      (0 : Fin 3) (1 : Fin 3)
      (10 : Fin 13) (11 : Fin 13)
      (2 : Fin 13) (9 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1221` (shared_pair). -/
theorem middleSource_h1221 :
    (!((rowBit (I.sourceRows) 1 10 2 && rowBit (I.sourceRows) 1 10 9 && rowBit (I.sourceRows) 0 11 2 && rowBit (I.sourceRows) 0 11 9))) = true := by
  exact allOne_sharedPair_pointsBeforeCenters I
      (1 : Fin 3) (0 : Fin 3)
      (10 : Fin 13) (11 : Fin 13)
      (2 : Fin 13) (9 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1222` (shared_pair). -/
theorem middleSource_h1222 :
    (!((rowBit (I.sourceRows) 0 10 2 && rowBit (I.sourceRows) 0 10 9 && rowBit (I.sourceRows) 1 12 2 && rowBit (I.sourceRows) 1 12 9))) = true := by
  exact allOne_sharedPair_pointsBeforeCenters I
      (0 : Fin 3) (1 : Fin 3)
      (10 : Fin 13) (12 : Fin 13)
      (2 : Fin 13) (9 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1223` (shared_pair). -/
theorem middleSource_h1223 :
    (!((rowBit (I.sourceRows) 1 10 2 && rowBit (I.sourceRows) 1 10 9 && rowBit (I.sourceRows) 0 12 2 && rowBit (I.sourceRows) 0 12 9))) = true := by
  exact allOne_sharedPair_pointsBeforeCenters I
      (1 : Fin 3) (0 : Fin 3)
      (10 : Fin 13) (12 : Fin 13)
      (2 : Fin 13) (9 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1224` (shared_pair). -/
theorem middleSource_h1224 :
    (!((rowBit (I.sourceRows) 0 11 2 && rowBit (I.sourceRows) 0 11 9 && rowBit (I.sourceRows) 1 12 2 && rowBit (I.sourceRows) 1 12 9))) = true := by
  exact allOne_sharedPair_pointsBeforeCenters I
      (0 : Fin 3) (1 : Fin 3)
      (11 : Fin 13) (12 : Fin 13)
      (2 : Fin 13) (9 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1225` (shared_pair). -/
theorem middleSource_h1225 :
    (!((rowBit (I.sourceRows) 1 11 2 && rowBit (I.sourceRows) 1 11 9 && rowBit (I.sourceRows) 0 12 2 && rowBit (I.sourceRows) 0 12 9))) = true := by
  exact allOne_sharedPair_pointsBeforeCenters I
      (1 : Fin 3) (0 : Fin 3)
      (11 : Fin 13) (12 : Fin 13)
      (2 : Fin 13) (9 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1226` (shared_pair). -/
theorem middleSource_h1226 :
    (!((rowBit (I.sourceRows) 0 4 3 && rowBit (I.sourceRows) 0 4 9 && rowBit (I.sourceRows) 1 8 3 && rowBit (I.sourceRows) 1 8 9))) = true := by
  exact allOne_sharedPair_pointsAroundCenters I
      (0 : Fin 3) (1 : Fin 3)
      (4 : Fin 13) (8 : Fin 13)
      (3 : Fin 13) (9 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1227` (shared_pair). -/
theorem middleSource_h1227 :
    (!((rowBit (I.sourceRows) 0 4 3 && rowBit (I.sourceRows) 0 4 10 && rowBit (I.sourceRows) 1 8 3 && rowBit (I.sourceRows) 1 8 10))) = true := by
  exact allOne_sharedPair_pointsAroundCenters I
      (0 : Fin 3) (1 : Fin 3)
      (4 : Fin 13) (8 : Fin 13)
      (3 : Fin 13) (10 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1228` (shared_pair). -/
theorem middleSource_h1228 :
    (!((rowBit (I.sourceRows) 0 4 3 && rowBit (I.sourceRows) 0 4 11 && rowBit (I.sourceRows) 1 8 3 && rowBit (I.sourceRows) 1 8 11))) = true := by
  exact allOne_sharedPair_pointsAroundCenters I
      (0 : Fin 3) (1 : Fin 3)
      (4 : Fin 13) (8 : Fin 13)
      (3 : Fin 13) (11 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1229` (shared_pair). -/
theorem middleSource_h1229 :
    (!((rowBit (I.sourceRows) 0 4 3 && rowBit (I.sourceRows) 0 4 12 && rowBit (I.sourceRows) 1 8 3 && rowBit (I.sourceRows) 1 8 12))) = true := by
  exact allOne_sharedPair_pointsAroundCenters I
      (0 : Fin 3) (1 : Fin 3)
      (4 : Fin 13) (8 : Fin 13)
      (3 : Fin 13) (12 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1230` (shared_pair). -/
theorem middleSource_h1230 :
    (!((rowBit (I.sourceRows) 0 5 0 && rowBit (I.sourceRows) 0 5 3 && rowBit (I.sourceRows) 1 8 0 && rowBit (I.sourceRows) 1 8 3))) = true := by
  exact allOne_sharedPair_pointsBeforeCenters I
      (0 : Fin 3) (1 : Fin 3)
      (5 : Fin 13) (8 : Fin 13)
      (0 : Fin 13) (3 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1231` (shared_pair). -/
theorem middleSource_h1231 :
    (!((rowBit (I.sourceRows) 0 5 3 && rowBit (I.sourceRows) 0 5 9 && rowBit (I.sourceRows) 1 8 3 && rowBit (I.sourceRows) 1 8 9))) = true := by
  exact allOne_sharedPair_pointsAroundCenters I
      (0 : Fin 3) (1 : Fin 3)
      (5 : Fin 13) (8 : Fin 13)
      (3 : Fin 13) (9 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1232` (shared_pair). -/
theorem middleSource_h1232 :
    (!((rowBit (I.sourceRows) 0 5 3 && rowBit (I.sourceRows) 0 5 10 && rowBit (I.sourceRows) 1 8 3 && rowBit (I.sourceRows) 1 8 10))) = true := by
  exact allOne_sharedPair_pointsAroundCenters I
      (0 : Fin 3) (1 : Fin 3)
      (5 : Fin 13) (8 : Fin 13)
      (3 : Fin 13) (10 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1233` (shared_pair). -/
theorem middleSource_h1233 :
    (!((rowBit (I.sourceRows) 0 5 3 && rowBit (I.sourceRows) 0 5 11 && rowBit (I.sourceRows) 1 8 3 && rowBit (I.sourceRows) 1 8 11))) = true := by
  exact allOne_sharedPair_pointsAroundCenters I
      (0 : Fin 3) (1 : Fin 3)
      (5 : Fin 13) (8 : Fin 13)
      (3 : Fin 13) (11 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1234` (shared_pair). -/
theorem middleSource_h1234 :
    (!((rowBit (I.sourceRows) 0 5 3 && rowBit (I.sourceRows) 0 5 12 && rowBit (I.sourceRows) 1 8 3 && rowBit (I.sourceRows) 1 8 12))) = true := by
  exact allOne_sharedPair_pointsAroundCenters I
      (0 : Fin 3) (1 : Fin 3)
      (5 : Fin 13) (8 : Fin 13)
      (3 : Fin 13) (12 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1235` (shared_pair). -/
theorem middleSource_h1235 :
    (!((rowBit (I.sourceRows) 0 6 3 && rowBit (I.sourceRows) 0 6 11 && rowBit (I.sourceRows) 1 8 3 && rowBit (I.sourceRows) 1 8 11))) = true := by
  exact allOne_sharedPair_pointsAroundCenters I
      (0 : Fin 3) (1 : Fin 3)
      (6 : Fin 13) (8 : Fin 13)
      (3 : Fin 13) (11 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1236` (shared_pair). -/
theorem middleSource_h1236 :
    (!((rowBit (I.sourceRows) 0 6 3 && rowBit (I.sourceRows) 0 6 12 && rowBit (I.sourceRows) 1 8 3 && rowBit (I.sourceRows) 1 8 12))) = true := by
  exact allOne_sharedPair_pointsAroundCenters I
      (0 : Fin 3) (1 : Fin 3)
      (6 : Fin 13) (8 : Fin 13)
      (3 : Fin 13) (12 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1237` (shared_pair). -/
theorem middleSource_h1237 :
    (!((rowBit (I.sourceRows) 0 7 0 && rowBit (I.sourceRows) 0 7 3 && rowBit (I.sourceRows) 1 8 0 && rowBit (I.sourceRows) 1 8 3))) = true := by
  exact allOne_sharedPair_pointsBeforeCenters I
      (0 : Fin 3) (1 : Fin 3)
      (7 : Fin 13) (8 : Fin 13)
      (0 : Fin 13) (3 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1238` (shared_pair). -/
theorem middleSource_h1238 :
    (!((rowBit (I.sourceRows) 0 7 1 && rowBit (I.sourceRows) 0 7 3 && rowBit (I.sourceRows) 1 8 1 && rowBit (I.sourceRows) 1 8 3))) = true := by
  exact allOne_sharedPair_pointsBeforeCenters I
      (0 : Fin 3) (1 : Fin 3)
      (7 : Fin 13) (8 : Fin 13)
      (1 : Fin 13) (3 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1239` (shared_pair). -/
theorem middleSource_h1239 :
    (!((rowBit (I.sourceRows) 0 7 3 && rowBit (I.sourceRows) 0 7 9 && rowBit (I.sourceRows) 1 8 3 && rowBit (I.sourceRows) 1 8 9))) = true := by
  exact allOne_sharedPair_pointsAroundCenters I
      (0 : Fin 3) (1 : Fin 3)
      (7 : Fin 13) (8 : Fin 13)
      (3 : Fin 13) (9 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1240` (shared_pair). -/
theorem middleSource_h1240 :
    (!((rowBit (I.sourceRows) 0 7 3 && rowBit (I.sourceRows) 0 7 10 && rowBit (I.sourceRows) 1 8 3 && rowBit (I.sourceRows) 1 8 10))) = true := by
  exact allOne_sharedPair_pointsAroundCenters I
      (0 : Fin 3) (1 : Fin 3)
      (7 : Fin 13) (8 : Fin 13)
      (3 : Fin 13) (10 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1241` (shared_pair). -/
theorem middleSource_h1241 :
    (!((rowBit (I.sourceRows) 0 7 3 && rowBit (I.sourceRows) 0 7 11 && rowBit (I.sourceRows) 1 8 3 && rowBit (I.sourceRows) 1 8 11))) = true := by
  exact allOne_sharedPair_pointsAroundCenters I
      (0 : Fin 3) (1 : Fin 3)
      (7 : Fin 13) (8 : Fin 13)
      (3 : Fin 13) (11 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1242` (shared_pair). -/
theorem middleSource_h1242 :
    (!((rowBit (I.sourceRows) 0 0 3 && rowBit (I.sourceRows) 0 0 5 && rowBit (I.sourceRows) 1 8 3 && rowBit (I.sourceRows) 1 8 5))) = true := by
  exact allOne_sharedPair_centersAroundPoints I
      (0 : Fin 3) (1 : Fin 3)
      (0 : Fin 13) (8 : Fin 13)
      (3 : Fin 13) (5 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1243` (shared_pair). -/
theorem middleSource_h1243 :
    (!((rowBit (I.sourceRows) 0 0 3 && rowBit (I.sourceRows) 0 0 6 && rowBit (I.sourceRows) 1 8 3 && rowBit (I.sourceRows) 1 8 6))) = true := by
  exact allOne_sharedPair_centersAroundPoints I
      (0 : Fin 3) (1 : Fin 3)
      (0 : Fin 13) (8 : Fin 13)
      (3 : Fin 13) (6 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1244` (shared_pair). -/
theorem middleSource_h1244 :
    (!((rowBit (I.sourceRows) 0 0 3 && rowBit (I.sourceRows) 0 0 7 && rowBit (I.sourceRows) 1 8 3 && rowBit (I.sourceRows) 1 8 7))) = true := by
  exact allOne_sharedPair_centersAroundPoints I
      (0 : Fin 3) (1 : Fin 3)
      (0 : Fin 13) (8 : Fin 13)
      (3 : Fin 13) (7 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1245` (shared_pair). -/
theorem middleSource_h1245 :
    (!((rowBit (I.sourceRows) 1 8 3 && rowBit (I.sourceRows) 1 8 4 && rowBit (I.sourceRows) 0 10 3 && rowBit (I.sourceRows) 0 10 4))) = true := by
  exact allOne_sharedPair_pointsBeforeCenters I
      (1 : Fin 3) (0 : Fin 3)
      (8 : Fin 13) (10 : Fin 13)
      (3 : Fin 13) (4 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1246` (shared_pair). -/
theorem middleSource_h1246 :
    (!((rowBit (I.sourceRows) 1 8 3 && rowBit (I.sourceRows) 1 8 5 && rowBit (I.sourceRows) 0 10 3 && rowBit (I.sourceRows) 0 10 5))) = true := by
  exact allOne_sharedPair_pointsBeforeCenters I
      (1 : Fin 3) (0 : Fin 3)
      (8 : Fin 13) (10 : Fin 13)
      (3 : Fin 13) (5 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1247` (shared_pair). -/
theorem middleSource_h1247 :
    (!((rowBit (I.sourceRows) 1 8 3 && rowBit (I.sourceRows) 1 8 6 && rowBit (I.sourceRows) 0 10 3 && rowBit (I.sourceRows) 0 10 6))) = true := by
  exact allOne_sharedPair_pointsBeforeCenters I
      (1 : Fin 3) (0 : Fin 3)
      (8 : Fin 13) (10 : Fin 13)
      (3 : Fin 13) (6 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1248` (shared_pair). -/
theorem middleSource_h1248 :
    (!((rowBit (I.sourceRows) 1 8 3 && rowBit (I.sourceRows) 1 8 7 && rowBit (I.sourceRows) 0 10 3 && rowBit (I.sourceRows) 0 10 7))) = true := by
  exact allOne_sharedPair_pointsBeforeCenters I
      (1 : Fin 3) (0 : Fin 3)
      (8 : Fin 13) (10 : Fin 13)
      (3 : Fin 13) (7 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1249` (shared_pair). -/
theorem middleSource_h1249 :
    (!((rowBit (I.sourceRows) 1 8 3 && rowBit (I.sourceRows) 1 8 4 && rowBit (I.sourceRows) 0 11 3 && rowBit (I.sourceRows) 0 11 4))) = true := by
  exact allOne_sharedPair_pointsBeforeCenters I
      (1 : Fin 3) (0 : Fin 3)
      (8 : Fin 13) (11 : Fin 13)
      (3 : Fin 13) (4 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1250` (shared_pair). -/
theorem middleSource_h1250 :
    (!((rowBit (I.sourceRows) 1 8 3 && rowBit (I.sourceRows) 1 8 6 && rowBit (I.sourceRows) 0 11 3 && rowBit (I.sourceRows) 0 11 6))) = true := by
  exact allOne_sharedPair_pointsBeforeCenters I
      (1 : Fin 3) (0 : Fin 3)
      (8 : Fin 13) (11 : Fin 13)
      (3 : Fin 13) (6 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1251` (shared_pair). -/
theorem middleSource_h1251 :
    (!((rowBit (I.sourceRows) 1 8 3 && rowBit (I.sourceRows) 1 8 7 && rowBit (I.sourceRows) 0 11 3 && rowBit (I.sourceRows) 0 11 7))) = true := by
  exact allOne_sharedPair_pointsBeforeCenters I
      (1 : Fin 3) (0 : Fin 3)
      (8 : Fin 13) (11 : Fin 13)
      (3 : Fin 13) (7 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1252` (shared_pair). -/
theorem middleSource_h1252 :
    (!((rowBit (I.sourceRows) 0 0 1 && rowBit (I.sourceRows) 0 0 6 && rowBit (I.sourceRows) 2 8 1 && rowBit (I.sourceRows) 2 8 6))) = true := by
  exact allOne_sharedPair_centersAroundPoints I
      (0 : Fin 3) (2 : Fin 3)
      (0 : Fin 13) (8 : Fin 13)
      (1 : Fin 13) (6 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1253` (shared_pair). -/
theorem middleSource_h1253 :
    (!((rowBit (I.sourceRows) 0 0 1 && rowBit (I.sourceRows) 0 0 7 && rowBit (I.sourceRows) 2 8 1 && rowBit (I.sourceRows) 2 8 7))) = true := by
  exact allOne_sharedPair_centersAroundPoints I
      (0 : Fin 3) (2 : Fin 3)
      (0 : Fin 13) (8 : Fin 13)
      (1 : Fin 13) (7 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1254` (shared_pair). -/
theorem middleSource_h1254 :
    (!((rowBit (I.sourceRows) 0 0 1 && rowBit (I.sourceRows) 0 0 5 && rowBit (I.sourceRows) 2 9 1 && rowBit (I.sourceRows) 2 9 5))) = true := by
  exact allOne_sharedPair_centersAroundPoints I
      (0 : Fin 3) (2 : Fin 3)
      (0 : Fin 13) (9 : Fin 13)
      (1 : Fin 13) (5 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1255` (shared_pair). -/
theorem middleSource_h1255 :
    (!((rowBit (I.sourceRows) 0 0 1 && rowBit (I.sourceRows) 0 0 7 && rowBit (I.sourceRows) 2 9 1 && rowBit (I.sourceRows) 2 9 7))) = true := by
  exact allOne_sharedPair_centersAroundPoints I
      (0 : Fin 3) (2 : Fin 3)
      (0 : Fin 13) (9 : Fin 13)
      (1 : Fin 13) (7 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1256` (shared_pair). -/
theorem middleSource_h1256 :
    (!((rowBit (I.sourceRows) 0 0 1 && rowBit (I.sourceRows) 0 0 8 && rowBit (I.sourceRows) 2 9 1 && rowBit (I.sourceRows) 2 9 8))) = true := by
  exact allOne_sharedPair_centersAroundPoints I
      (0 : Fin 3) (2 : Fin 3)
      (0 : Fin 13) (9 : Fin 13)
      (1 : Fin 13) (8 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1257` (shared_pair). -/
theorem middleSource_h1257 :
    (!((rowBit (I.sourceRows) 0 0 2 && rowBit (I.sourceRows) 0 0 8 && rowBit (I.sourceRows) 2 9 2 && rowBit (I.sourceRows) 2 9 8))) = true := by
  exact allOne_sharedPair_centersAroundPoints I
      (0 : Fin 3) (2 : Fin 3)
      (0 : Fin 13) (9 : Fin 13)
      (2 : Fin 13) (8 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1258` (shared_pair). -/
theorem middleSource_h1258 :
    (!((rowBit (I.sourceRows) 0 0 3 && rowBit (I.sourceRows) 0 0 7 && rowBit (I.sourceRows) 2 9 3 && rowBit (I.sourceRows) 2 9 7))) = true := by
  exact allOne_sharedPair_centersAroundPoints I
      (0 : Fin 3) (2 : Fin 3)
      (0 : Fin 13) (9 : Fin 13)
      (3 : Fin 13) (7 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1259` (shared_pair). -/
theorem middleSource_h1259 :
    (!((rowBit (I.sourceRows) 0 0 3 && rowBit (I.sourceRows) 0 0 8 && rowBit (I.sourceRows) 2 9 3 && rowBit (I.sourceRows) 2 9 8))) = true := by
  exact allOne_sharedPair_centersAroundPoints I
      (0 : Fin 3) (2 : Fin 3)
      (0 : Fin 13) (9 : Fin 13)
      (3 : Fin 13) (8 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1260` (shared_pair). -/
theorem middleSource_h1260 :
    (!((rowBit (I.sourceRows) 0 0 4 && rowBit (I.sourceRows) 0 0 5 && rowBit (I.sourceRows) 2 9 4 && rowBit (I.sourceRows) 2 9 5))) = true := by
  exact allOne_sharedPair_centersAroundPoints I
      (0 : Fin 3) (2 : Fin 3)
      (0 : Fin 13) (9 : Fin 13)
      (4 : Fin 13) (5 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1261` (shared_pair). -/
theorem middleSource_h1261 :
    (!((rowBit (I.sourceRows) 0 0 4 && rowBit (I.sourceRows) 0 0 8 && rowBit (I.sourceRows) 2 9 4 && rowBit (I.sourceRows) 2 9 8))) = true := by
  exact allOne_sharedPair_centersAroundPoints I
      (0 : Fin 3) (2 : Fin 3)
      (0 : Fin 13) (9 : Fin 13)
      (4 : Fin 13) (8 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1262` (shared_pair). -/
theorem middleSource_h1262 :
    (!((rowBit (I.sourceRows) 0 0 5 && rowBit (I.sourceRows) 0 0 8 && rowBit (I.sourceRows) 2 9 5 && rowBit (I.sourceRows) 2 9 8))) = true := by
  exact allOne_sharedPair_centersAroundPoints I
      (0 : Fin 3) (2 : Fin 3)
      (0 : Fin 13) (9 : Fin 13)
      (5 : Fin 13) (8 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1263` (shared_pair). -/
theorem middleSource_h1263 :
    (!((rowBit (I.sourceRows) 0 0 6 && rowBit (I.sourceRows) 0 0 7 && rowBit (I.sourceRows) 2 9 6 && rowBit (I.sourceRows) 2 9 7))) = true := by
  exact allOne_sharedPair_centersAroundPoints I
      (0 : Fin 3) (2 : Fin 3)
      (0 : Fin 13) (9 : Fin 13)
      (6 : Fin 13) (7 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1264` (shared_pair). -/
theorem middleSource_h1264 :
    (!((rowBit (I.sourceRows) 0 0 6 && rowBit (I.sourceRows) 0 0 8 && rowBit (I.sourceRows) 2 9 6 && rowBit (I.sourceRows) 2 9 8))) = true := by
  exact allOne_sharedPair_centersAroundPoints I
      (0 : Fin 3) (2 : Fin 3)
      (0 : Fin 13) (9 : Fin 13)
      (6 : Fin 13) (8 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1265` (shared_pair). -/
theorem middleSource_h1265 :
    (!((rowBit (I.sourceRows) 0 0 7 && rowBit (I.sourceRows) 0 0 8 && rowBit (I.sourceRows) 2 9 7 && rowBit (I.sourceRows) 2 9 8))) = true := by
  exact allOne_sharedPair_centersAroundPoints I
      (0 : Fin 3) (2 : Fin 3)
      (0 : Fin 13) (9 : Fin 13)
      (7 : Fin 13) (8 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1266` (shared_pair). -/
theorem middleSource_h1266 :
    (!((rowBit (I.sourceRows) 0 1 4 && rowBit (I.sourceRows) 0 1 5 && rowBit (I.sourceRows) 2 2 4 && rowBit (I.sourceRows) 2 2 5))) = true := by
  exact allOne_sharedPair_centersBeforePoints I
      (0 : Fin 3) (2 : Fin 3)
      (1 : Fin 13) (2 : Fin 13)
      (4 : Fin 13) (5 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1267` (shared_pair). -/
theorem middleSource_h1267 :
    (!((rowBit (I.sourceRows) 2 1 4 && rowBit (I.sourceRows) 2 1 5 && rowBit (I.sourceRows) 0 2 4 && rowBit (I.sourceRows) 0 2 5))) = true := by
  exact allOne_sharedPair_centersBeforePoints I
      (2 : Fin 3) (0 : Fin 3)
      (1 : Fin 13) (2 : Fin 13)
      (4 : Fin 13) (5 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1268` (intersection). -/
theorem middleSource_h1268 :
    ((((bif (rowBit (I.sourceRows) 0 1 0 && rowBit (I.sourceRows) 2 9 0) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 1 1 && rowBit (I.sourceRows) 2 9 1) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 1 2 && rowBit (I.sourceRows) 2 9 2) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 1 3 && rowBit (I.sourceRows) 2 9 3) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 1 4 && rowBit (I.sourceRows) 2 9 4) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 1 5 && rowBit (I.sourceRows) 2 9 5) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 1 6 && rowBit (I.sourceRows) 2 9 6) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 1 7 && rowBit (I.sourceRows) 2 9 7) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 1 8 && rowBit (I.sourceRows) 2 9 8) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 1 9 && rowBit (I.sourceRows) 2 9 9) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 1 10 && rowBit (I.sourceRows) 2 9 10) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 1 11 && rowBit (I.sourceRows) 2 9 11) then 1#4 else 0#4) + (bif (rowBit (I.sourceRows) 0 1 12 && rowBit (I.sourceRows) 2 9 12) then 1#4 else 0#4))).ule 2#4) = true := by
  simpa only [allOneBitCount13] using
    allOne_row_inter_card_le_two I
      (0 : Fin 3) (2 : Fin 3)
      (1 : Fin 13) (9 : Fin 13) (by decide)

/-- Candidate middle source assertion `h1269` (shared_pair). -/
theorem middleSource_h1269 :
    (!((rowBit (I.sourceRows) 0 1 0 && rowBit (I.sourceRows) 0 1 10 && rowBit (I.sourceRows) 2 9 0 && rowBit (I.sourceRows) 2 9 10))) = true := by
  exact allOne_sharedPair_pointsAroundCenters I
      (0 : Fin 3) (2 : Fin 3)
      (1 : Fin 13) (9 : Fin 13)
      (0 : Fin 13) (10 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1270` (shared_pair). -/
theorem middleSource_h1270 :
    (!((rowBit (I.sourceRows) 0 1 0 && rowBit (I.sourceRows) 0 1 11 && rowBit (I.sourceRows) 2 9 0 && rowBit (I.sourceRows) 2 9 11))) = true := by
  exact allOne_sharedPair_pointsAroundCenters I
      (0 : Fin 3) (2 : Fin 3)
      (1 : Fin 13) (9 : Fin 13)
      (0 : Fin 13) (11 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1271` (shared_pair). -/
theorem middleSource_h1271 :
    (!((rowBit (I.sourceRows) 0 1 0 && rowBit (I.sourceRows) 0 1 12 && rowBit (I.sourceRows) 2 9 0 && rowBit (I.sourceRows) 2 9 12))) = true := by
  exact allOne_sharedPair_pointsAroundCenters I
      (0 : Fin 3) (2 : Fin 3)
      (1 : Fin 13) (9 : Fin 13)
      (0 : Fin 13) (12 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1272` (shared_pair). -/
theorem middleSource_h1272 :
    (!((rowBit (I.sourceRows) 0 1 2 && rowBit (I.sourceRows) 0 1 4 && rowBit (I.sourceRows) 2 9 2 && rowBit (I.sourceRows) 2 9 4))) = true := by
  exact allOne_sharedPair_centersAroundPoints I
      (0 : Fin 3) (2 : Fin 3)
      (1 : Fin 13) (9 : Fin 13)
      (2 : Fin 13) (4 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1273` (shared_pair). -/
theorem middleSource_h1273 :
    (!((rowBit (I.sourceRows) 0 1 2 && rowBit (I.sourceRows) 0 1 5 && rowBit (I.sourceRows) 2 9 2 && rowBit (I.sourceRows) 2 9 5))) = true := by
  exact allOne_sharedPair_centersAroundPoints I
      (0 : Fin 3) (2 : Fin 3)
      (1 : Fin 13) (9 : Fin 13)
      (2 : Fin 13) (5 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1274` (shared_pair). -/
theorem middleSource_h1274 :
    (!((rowBit (I.sourceRows) 0 1 2 && rowBit (I.sourceRows) 0 1 6 && rowBit (I.sourceRows) 2 9 2 && rowBit (I.sourceRows) 2 9 6))) = true := by
  exact allOne_sharedPair_centersAroundPoints I
      (0 : Fin 3) (2 : Fin 3)
      (1 : Fin 13) (9 : Fin 13)
      (2 : Fin 13) (6 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1275` (shared_pair). -/
theorem middleSource_h1275 :
    (!((rowBit (I.sourceRows) 0 1 2 && rowBit (I.sourceRows) 0 1 7 && rowBit (I.sourceRows) 2 9 2 && rowBit (I.sourceRows) 2 9 7))) = true := by
  exact allOne_sharedPair_centersAroundPoints I
      (0 : Fin 3) (2 : Fin 3)
      (1 : Fin 13) (9 : Fin 13)
      (2 : Fin 13) (7 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1276` (shared_pair). -/
theorem middleSource_h1276 :
    (!((rowBit (I.sourceRows) 0 1 2 && rowBit (I.sourceRows) 0 1 8 && rowBit (I.sourceRows) 2 9 2 && rowBit (I.sourceRows) 2 9 8))) = true := by
  exact allOne_sharedPair_centersAroundPoints I
      (0 : Fin 3) (2 : Fin 3)
      (1 : Fin 13) (9 : Fin 13)
      (2 : Fin 13) (8 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1277` (shared_pair). -/
theorem middleSource_h1277 :
    (!((rowBit (I.sourceRows) 0 1 3 && rowBit (I.sourceRows) 0 1 4 && rowBit (I.sourceRows) 2 9 3 && rowBit (I.sourceRows) 2 9 4))) = true := by
  exact allOne_sharedPair_centersAroundPoints I
      (0 : Fin 3) (2 : Fin 3)
      (1 : Fin 13) (9 : Fin 13)
      (3 : Fin 13) (4 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1278` (shared_pair). -/
theorem middleSource_h1278 :
    (!((rowBit (I.sourceRows) 0 1 3 && rowBit (I.sourceRows) 0 1 5 && rowBit (I.sourceRows) 2 9 3 && rowBit (I.sourceRows) 2 9 5))) = true := by
  exact allOne_sharedPair_centersAroundPoints I
      (0 : Fin 3) (2 : Fin 3)
      (1 : Fin 13) (9 : Fin 13)
      (3 : Fin 13) (5 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1279` (shared_pair). -/
theorem middleSource_h1279 :
    (!((rowBit (I.sourceRows) 0 1 3 && rowBit (I.sourceRows) 0 1 6 && rowBit (I.sourceRows) 2 9 3 && rowBit (I.sourceRows) 2 9 6))) = true := by
  exact allOne_sharedPair_centersAroundPoints I
      (0 : Fin 3) (2 : Fin 3)
      (1 : Fin 13) (9 : Fin 13)
      (3 : Fin 13) (6 : Fin 13)
      (by decide) (by decide) (by decide)

end

end ATailExactFiveCard13AllOneSourceIngressScratch
end Problem97
