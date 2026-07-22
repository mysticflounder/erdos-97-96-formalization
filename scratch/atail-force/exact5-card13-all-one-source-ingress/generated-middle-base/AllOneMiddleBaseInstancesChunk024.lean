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

/-- Candidate middle source assertion `h1536` (shared_pair). -/
theorem middleSource_h1536 :
    (!((rowBit (I.sourceRows) 0 6 0 && rowBit (I.sourceRows) 0 6 1 && rowBit (I.sourceRows) 2 8 0 && rowBit (I.sourceRows) 2 8 1))) = true := by
  exact allOne_sharedPair_pointsBeforeCenters I
      (0 : Fin 3) (2 : Fin 3)
      (6 : Fin 13) (8 : Fin 13)
      (0 : Fin 13) (1 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1537` (shared_pair). -/
theorem middleSource_h1537 :
    (!((rowBit (I.sourceRows) 0 6 1 && rowBit (I.sourceRows) 0 6 10 && rowBit (I.sourceRows) 2 8 1 && rowBit (I.sourceRows) 2 8 10))) = true := by
  exact allOne_sharedPair_pointsAroundCenters I
      (0 : Fin 3) (2 : Fin 3)
      (6 : Fin 13) (8 : Fin 13)
      (1 : Fin 13) (10 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1538` (shared_pair). -/
theorem middleSource_h1538 :
    (!((rowBit (I.sourceRows) 0 6 1 && rowBit (I.sourceRows) 0 6 11 && rowBit (I.sourceRows) 2 8 1 && rowBit (I.sourceRows) 2 8 11))) = true := by
  exact allOne_sharedPair_pointsAroundCenters I
      (0 : Fin 3) (2 : Fin 3)
      (6 : Fin 13) (8 : Fin 13)
      (1 : Fin 13) (11 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1539` (shared_pair). -/
theorem middleSource_h1539 :
    (!((rowBit (I.sourceRows) 0 7 1 && rowBit (I.sourceRows) 0 7 3 && rowBit (I.sourceRows) 2 8 1 && rowBit (I.sourceRows) 2 8 3))) = true := by
  exact allOne_sharedPair_pointsBeforeCenters I
      (0 : Fin 3) (2 : Fin 3)
      (7 : Fin 13) (8 : Fin 13)
      (1 : Fin 13) (3 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1540` (shared_pair). -/
theorem middleSource_h1540 :
    (!((rowBit (I.sourceRows) 0 7 1 && rowBit (I.sourceRows) 0 7 9 && rowBit (I.sourceRows) 2 8 1 && rowBit (I.sourceRows) 2 8 9))) = true := by
  exact allOne_sharedPair_pointsAroundCenters I
      (0 : Fin 3) (2 : Fin 3)
      (7 : Fin 13) (8 : Fin 13)
      (1 : Fin 13) (9 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1541` (shared_pair). -/
theorem middleSource_h1541 :
    (!((rowBit (I.sourceRows) 0 0 1 && rowBit (I.sourceRows) 0 0 6 && rowBit (I.sourceRows) 2 9 1 && rowBit (I.sourceRows) 2 9 6))) = true := by
  exact allOne_sharedPair_centersAroundPoints I
      (0 : Fin 3) (2 : Fin 3)
      (0 : Fin 13) (9 : Fin 13)
      (1 : Fin 13) (6 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1542` (shared_pair). -/
theorem middleSource_h1542 :
    (!((rowBit (I.sourceRows) 0 0 2 && rowBit (I.sourceRows) 0 0 5 && rowBit (I.sourceRows) 2 9 2 && rowBit (I.sourceRows) 2 9 5))) = true := by
  exact allOne_sharedPair_centersAroundPoints I
      (0 : Fin 3) (2 : Fin 3)
      (0 : Fin 13) (9 : Fin 13)
      (2 : Fin 13) (5 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1543` (shared_pair). -/
theorem middleSource_h1543 :
    (!((rowBit (I.sourceRows) 0 0 2 && rowBit (I.sourceRows) 0 0 6 && rowBit (I.sourceRows) 2 9 2 && rowBit (I.sourceRows) 2 9 6))) = true := by
  exact allOne_sharedPair_centersAroundPoints I
      (0 : Fin 3) (2 : Fin 3)
      (0 : Fin 13) (9 : Fin 13)
      (2 : Fin 13) (6 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1544` (shared_pair). -/
theorem middleSource_h1544 :
    (!((rowBit (I.sourceRows) 0 0 2 && rowBit (I.sourceRows) 0 0 7 && rowBit (I.sourceRows) 2 9 2 && rowBit (I.sourceRows) 2 9 7))) = true := by
  exact allOne_sharedPair_centersAroundPoints I
      (0 : Fin 3) (2 : Fin 3)
      (0 : Fin 13) (9 : Fin 13)
      (2 : Fin 13) (7 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1545` (shared_pair). -/
theorem middleSource_h1545 :
    (!((rowBit (I.sourceRows) 0 0 3 && rowBit (I.sourceRows) 0 0 5 && rowBit (I.sourceRows) 2 9 3 && rowBit (I.sourceRows) 2 9 5))) = true := by
  exact allOne_sharedPair_centersAroundPoints I
      (0 : Fin 3) (2 : Fin 3)
      (0 : Fin 13) (9 : Fin 13)
      (3 : Fin 13) (5 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1546` (shared_pair). -/
theorem middleSource_h1546 :
    (!((rowBit (I.sourceRows) 0 0 3 && rowBit (I.sourceRows) 0 0 6 && rowBit (I.sourceRows) 2 9 3 && rowBit (I.sourceRows) 2 9 6))) = true := by
  exact allOne_sharedPair_centersAroundPoints I
      (0 : Fin 3) (2 : Fin 3)
      (0 : Fin 13) (9 : Fin 13)
      (3 : Fin 13) (6 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1547` (shared_pair). -/
theorem middleSource_h1547 :
    (!((rowBit (I.sourceRows) 0 0 4 && rowBit (I.sourceRows) 0 0 6 && rowBit (I.sourceRows) 2 9 4 && rowBit (I.sourceRows) 2 9 6))) = true := by
  exact allOne_sharedPair_centersAroundPoints I
      (0 : Fin 3) (2 : Fin 3)
      (0 : Fin 13) (9 : Fin 13)
      (4 : Fin 13) (6 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1548` (shared_pair). -/
theorem middleSource_h1548 :
    (!((rowBit (I.sourceRows) 0 0 4 && rowBit (I.sourceRows) 0 0 7 && rowBit (I.sourceRows) 2 9 4 && rowBit (I.sourceRows) 2 9 7))) = true := by
  exact allOne_sharedPair_centersAroundPoints I
      (0 : Fin 3) (2 : Fin 3)
      (0 : Fin 13) (9 : Fin 13)
      (4 : Fin 13) (7 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1549` (shared_pair). -/
theorem middleSource_h1549 :
    (!((rowBit (I.sourceRows) 0 0 5 && rowBit (I.sourceRows) 0 0 6 && rowBit (I.sourceRows) 2 9 5 && rowBit (I.sourceRows) 2 9 6))) = true := by
  exact allOne_sharedPair_centersAroundPoints I
      (0 : Fin 3) (2 : Fin 3)
      (0 : Fin 13) (9 : Fin 13)
      (5 : Fin 13) (6 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1550` (shared_pair). -/
theorem middleSource_h1550 :
    (!((rowBit (I.sourceRows) 0 0 5 && rowBit (I.sourceRows) 0 0 7 && rowBit (I.sourceRows) 2 9 5 && rowBit (I.sourceRows) 2 9 7))) = true := by
  exact allOne_sharedPair_centersAroundPoints I
      (0 : Fin 3) (2 : Fin 3)
      (0 : Fin 13) (9 : Fin 13)
      (5 : Fin 13) (7 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1551` (shared_pair). -/
theorem middleSource_h1551 :
    (!((rowBit (I.sourceRows) 2 8 1 && rowBit (I.sourceRows) 2 8 4 && rowBit (I.sourceRows) 0 10 1 && rowBit (I.sourceRows) 0 10 4))) = true := by
  exact allOne_sharedPair_pointsBeforeCenters I
      (2 : Fin 3) (0 : Fin 3)
      (8 : Fin 13) (10 : Fin 13)
      (1 : Fin 13) (4 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1552` (shared_pair). -/
theorem middleSource_h1552 :
    (!((rowBit (I.sourceRows) 2 8 1 && rowBit (I.sourceRows) 2 8 7 && rowBit (I.sourceRows) 0 10 1 && rowBit (I.sourceRows) 0 10 7))) = true := by
  exact allOne_sharedPair_pointsBeforeCenters I
      (2 : Fin 3) (0 : Fin 3)
      (8 : Fin 13) (10 : Fin 13)
      (1 : Fin 13) (7 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1553` (shared_pair). -/
theorem middleSource_h1553 :
    (!((rowBit (I.sourceRows) 2 8 1 && rowBit (I.sourceRows) 2 8 4 && rowBit (I.sourceRows) 0 11 1 && rowBit (I.sourceRows) 0 11 4))) = true := by
  exact allOne_sharedPair_pointsBeforeCenters I
      (2 : Fin 3) (0 : Fin 3)
      (8 : Fin 13) (11 : Fin 13)
      (1 : Fin 13) (4 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1554` (shared_pair). -/
theorem middleSource_h1554 :
    (!((rowBit (I.sourceRows) 2 8 1 && rowBit (I.sourceRows) 2 8 5 && rowBit (I.sourceRows) 0 11 1 && rowBit (I.sourceRows) 0 11 5))) = true := by
  exact allOne_sharedPair_pointsBeforeCenters I
      (2 : Fin 3) (0 : Fin 3)
      (8 : Fin 13) (11 : Fin 13)
      (1 : Fin 13) (5 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1555` (shared_pair). -/
theorem middleSource_h1555 :
    (!((rowBit (I.sourceRows) 2 8 1 && rowBit (I.sourceRows) 2 8 7 && rowBit (I.sourceRows) 0 12 1 && rowBit (I.sourceRows) 0 12 7))) = true := by
  exact allOne_sharedPair_pointsBeforeCenters I
      (2 : Fin 3) (0 : Fin 3)
      (8 : Fin 13) (12 : Fin 13)
      (1 : Fin 13) (7 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1556` (shared_pair). -/
theorem middleSource_h1556 :
    (!((rowBit (I.sourceRows) 2 9 1 && rowBit (I.sourceRows) 2 9 4 && rowBit (I.sourceRows) 0 10 1 && rowBit (I.sourceRows) 0 10 4))) = true := by
  exact allOne_sharedPair_pointsBeforeCenters I
      (2 : Fin 3) (0 : Fin 3)
      (9 : Fin 13) (10 : Fin 13)
      (1 : Fin 13) (4 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1557` (shared_pair). -/
theorem middleSource_h1557 :
    (!((rowBit (I.sourceRows) 2 9 1 && rowBit (I.sourceRows) 2 9 5 && rowBit (I.sourceRows) 0 10 1 && rowBit (I.sourceRows) 0 10 5))) = true := by
  exact allOne_sharedPair_pointsBeforeCenters I
      (2 : Fin 3) (0 : Fin 3)
      (9 : Fin 13) (10 : Fin 13)
      (1 : Fin 13) (5 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1558` (shared_pair). -/
theorem middleSource_h1558 :
    (!((rowBit (I.sourceRows) 2 9 1 && rowBit (I.sourceRows) 2 9 7 && rowBit (I.sourceRows) 0 10 1 && rowBit (I.sourceRows) 0 10 7))) = true := by
  exact allOne_sharedPair_pointsBeforeCenters I
      (2 : Fin 3) (0 : Fin 3)
      (9 : Fin 13) (10 : Fin 13)
      (1 : Fin 13) (7 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1559` (shared_pair). -/
theorem middleSource_h1559 :
    (!((rowBit (I.sourceRows) 2 9 2 && rowBit (I.sourceRows) 2 9 6 && rowBit (I.sourceRows) 0 10 2 && rowBit (I.sourceRows) 0 10 6))) = true := by
  exact allOne_sharedPair_pointsBeforeCenters I
      (2 : Fin 3) (0 : Fin 3)
      (9 : Fin 13) (10 : Fin 13)
      (2 : Fin 13) (6 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1560` (shared_pair). -/
theorem middleSource_h1560 :
    (!((rowBit (I.sourceRows) 2 9 3 && rowBit (I.sourceRows) 2 9 4 && rowBit (I.sourceRows) 0 10 3 && rowBit (I.sourceRows) 0 10 4))) = true := by
  exact allOne_sharedPair_pointsBeforeCenters I
      (2 : Fin 3) (0 : Fin 3)
      (9 : Fin 13) (10 : Fin 13)
      (3 : Fin 13) (4 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1561` (shared_pair). -/
theorem middleSource_h1561 :
    (!((rowBit (I.sourceRows) 2 9 3 && rowBit (I.sourceRows) 2 9 5 && rowBit (I.sourceRows) 0 10 3 && rowBit (I.sourceRows) 0 10 5))) = true := by
  exact allOne_sharedPair_pointsBeforeCenters I
      (2 : Fin 3) (0 : Fin 3)
      (9 : Fin 13) (10 : Fin 13)
      (3 : Fin 13) (5 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1562` (shared_pair). -/
theorem middleSource_h1562 :
    (!((rowBit (I.sourceRows) 2 9 3 && rowBit (I.sourceRows) 2 9 6 && rowBit (I.sourceRows) 0 10 3 && rowBit (I.sourceRows) 0 10 6))) = true := by
  exact allOne_sharedPair_pointsBeforeCenters I
      (2 : Fin 3) (0 : Fin 3)
      (9 : Fin 13) (10 : Fin 13)
      (3 : Fin 13) (6 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1563` (shared_pair). -/
theorem middleSource_h1563 :
    (!((rowBit (I.sourceRows) 2 9 3 && rowBit (I.sourceRows) 2 9 7 && rowBit (I.sourceRows) 0 10 3 && rowBit (I.sourceRows) 0 10 7))) = true := by
  exact allOne_sharedPair_pointsBeforeCenters I
      (2 : Fin 3) (0 : Fin 3)
      (9 : Fin 13) (10 : Fin 13)
      (3 : Fin 13) (7 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1564` (shared_pair). -/
theorem middleSource_h1564 :
    (!((rowBit (I.sourceRows) 2 9 4 && rowBit (I.sourceRows) 2 9 5 && rowBit (I.sourceRows) 0 10 4 && rowBit (I.sourceRows) 0 10 5))) = true := by
  exact allOne_sharedPair_pointsBeforeCenters I
      (2 : Fin 3) (0 : Fin 3)
      (9 : Fin 13) (10 : Fin 13)
      (4 : Fin 13) (5 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1565` (shared_pair). -/
theorem middleSource_h1565 :
    (!((rowBit (I.sourceRows) 2 9 4 && rowBit (I.sourceRows) 2 9 6 && rowBit (I.sourceRows) 0 10 4 && rowBit (I.sourceRows) 0 10 6))) = true := by
  exact allOne_sharedPair_pointsBeforeCenters I
      (2 : Fin 3) (0 : Fin 3)
      (9 : Fin 13) (10 : Fin 13)
      (4 : Fin 13) (6 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1566` (shared_pair). -/
theorem middleSource_h1566 :
    (!((rowBit (I.sourceRows) 2 9 4 && rowBit (I.sourceRows) 2 9 7 && rowBit (I.sourceRows) 0 10 4 && rowBit (I.sourceRows) 0 10 7))) = true := by
  exact allOne_sharedPair_pointsBeforeCenters I
      (2 : Fin 3) (0 : Fin 3)
      (9 : Fin 13) (10 : Fin 13)
      (4 : Fin 13) (7 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1567` (shared_pair). -/
theorem middleSource_h1567 :
    (!((rowBit (I.sourceRows) 2 9 5 && rowBit (I.sourceRows) 2 9 6 && rowBit (I.sourceRows) 0 10 5 && rowBit (I.sourceRows) 0 10 6))) = true := by
  exact allOne_sharedPair_pointsBeforeCenters I
      (2 : Fin 3) (0 : Fin 3)
      (9 : Fin 13) (10 : Fin 13)
      (5 : Fin 13) (6 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1568` (shared_pair). -/
theorem middleSource_h1568 :
    (!((rowBit (I.sourceRows) 2 9 5 && rowBit (I.sourceRows) 2 9 7 && rowBit (I.sourceRows) 0 10 5 && rowBit (I.sourceRows) 0 10 7))) = true := by
  exact allOne_sharedPair_pointsBeforeCenters I
      (2 : Fin 3) (0 : Fin 3)
      (9 : Fin 13) (10 : Fin 13)
      (5 : Fin 13) (7 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1569` (shared_pair). -/
theorem middleSource_h1569 :
    (!((rowBit (I.sourceRows) 2 9 6 && rowBit (I.sourceRows) 2 9 7 && rowBit (I.sourceRows) 0 10 6 && rowBit (I.sourceRows) 0 10 7))) = true := by
  exact allOne_sharedPair_pointsBeforeCenters I
      (2 : Fin 3) (0 : Fin 3)
      (9 : Fin 13) (10 : Fin 13)
      (6 : Fin 13) (7 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1570` (shared_pair). -/
theorem middleSource_h1570 :
    (!((rowBit (I.sourceRows) 2 9 1 && rowBit (I.sourceRows) 2 9 4 && rowBit (I.sourceRows) 0 11 1 && rowBit (I.sourceRows) 0 11 4))) = true := by
  exact allOne_sharedPair_pointsBeforeCenters I
      (2 : Fin 3) (0 : Fin 3)
      (9 : Fin 13) (11 : Fin 13)
      (1 : Fin 13) (4 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1571` (shared_pair). -/
theorem middleSource_h1571 :
    (!((rowBit (I.sourceRows) 2 9 1 && rowBit (I.sourceRows) 2 9 5 && rowBit (I.sourceRows) 0 11 1 && rowBit (I.sourceRows) 0 11 5))) = true := by
  exact allOne_sharedPair_pointsBeforeCenters I
      (2 : Fin 3) (0 : Fin 3)
      (9 : Fin 13) (11 : Fin 13)
      (1 : Fin 13) (5 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1572` (shared_pair). -/
theorem middleSource_h1572 :
    (!((rowBit (I.sourceRows) 2 9 1 && rowBit (I.sourceRows) 2 9 6 && rowBit (I.sourceRows) 0 11 1 && rowBit (I.sourceRows) 0 11 6))) = true := by
  exact allOne_sharedPair_pointsBeforeCenters I
      (2 : Fin 3) (0 : Fin 3)
      (9 : Fin 13) (11 : Fin 13)
      (1 : Fin 13) (6 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1573` (shared_pair). -/
theorem middleSource_h1573 :
    (!((rowBit (I.sourceRows) 2 9 1 && rowBit (I.sourceRows) 2 9 7 && rowBit (I.sourceRows) 0 11 1 && rowBit (I.sourceRows) 0 11 7))) = true := by
  exact allOne_sharedPair_pointsBeforeCenters I
      (2 : Fin 3) (0 : Fin 3)
      (9 : Fin 13) (11 : Fin 13)
      (1 : Fin 13) (7 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1574` (shared_pair). -/
theorem middleSource_h1574 :
    (!((rowBit (I.sourceRows) 2 9 2 && rowBit (I.sourceRows) 2 9 4 && rowBit (I.sourceRows) 0 11 2 && rowBit (I.sourceRows) 0 11 4))) = true := by
  exact allOne_sharedPair_pointsBeforeCenters I
      (2 : Fin 3) (0 : Fin 3)
      (9 : Fin 13) (11 : Fin 13)
      (2 : Fin 13) (4 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1575` (shared_pair). -/
theorem middleSource_h1575 :
    (!((rowBit (I.sourceRows) 2 9 2 && rowBit (I.sourceRows) 2 9 5 && rowBit (I.sourceRows) 0 11 2 && rowBit (I.sourceRows) 0 11 5))) = true := by
  exact allOne_sharedPair_pointsBeforeCenters I
      (2 : Fin 3) (0 : Fin 3)
      (9 : Fin 13) (11 : Fin 13)
      (2 : Fin 13) (5 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1576` (shared_pair). -/
theorem middleSource_h1576 :
    (!((rowBit (I.sourceRows) 2 9 2 && rowBit (I.sourceRows) 2 9 6 && rowBit (I.sourceRows) 0 11 2 && rowBit (I.sourceRows) 0 11 6))) = true := by
  exact allOne_sharedPair_pointsBeforeCenters I
      (2 : Fin 3) (0 : Fin 3)
      (9 : Fin 13) (11 : Fin 13)
      (2 : Fin 13) (6 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1577` (shared_pair). -/
theorem middleSource_h1577 :
    (!((rowBit (I.sourceRows) 2 9 2 && rowBit (I.sourceRows) 2 9 7 && rowBit (I.sourceRows) 0 11 2 && rowBit (I.sourceRows) 0 11 7))) = true := by
  exact allOne_sharedPair_pointsBeforeCenters I
      (2 : Fin 3) (0 : Fin 3)
      (9 : Fin 13) (11 : Fin 13)
      (2 : Fin 13) (7 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1578` (shared_pair). -/
theorem middleSource_h1578 :
    (!((rowBit (I.sourceRows) 2 9 3 && rowBit (I.sourceRows) 2 9 6 && rowBit (I.sourceRows) 0 11 3 && rowBit (I.sourceRows) 0 11 6))) = true := by
  exact allOne_sharedPair_pointsBeforeCenters I
      (2 : Fin 3) (0 : Fin 3)
      (9 : Fin 13) (11 : Fin 13)
      (3 : Fin 13) (6 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1579` (shared_pair). -/
theorem middleSource_h1579 :
    (!((rowBit (I.sourceRows) 2 9 4 && rowBit (I.sourceRows) 2 9 5 && rowBit (I.sourceRows) 0 11 4 && rowBit (I.sourceRows) 0 11 5))) = true := by
  exact allOne_sharedPair_pointsBeforeCenters I
      (2 : Fin 3) (0 : Fin 3)
      (9 : Fin 13) (11 : Fin 13)
      (4 : Fin 13) (5 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1580` (shared_pair). -/
theorem middleSource_h1580 :
    (!((rowBit (I.sourceRows) 2 9 4 && rowBit (I.sourceRows) 2 9 6 && rowBit (I.sourceRows) 0 11 4 && rowBit (I.sourceRows) 0 11 6))) = true := by
  exact allOne_sharedPair_pointsBeforeCenters I
      (2 : Fin 3) (0 : Fin 3)
      (9 : Fin 13) (11 : Fin 13)
      (4 : Fin 13) (6 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1581` (shared_pair). -/
theorem middleSource_h1581 :
    (!((rowBit (I.sourceRows) 2 9 4 && rowBit (I.sourceRows) 2 9 7 && rowBit (I.sourceRows) 0 11 4 && rowBit (I.sourceRows) 0 11 7))) = true := by
  exact allOne_sharedPair_pointsBeforeCenters I
      (2 : Fin 3) (0 : Fin 3)
      (9 : Fin 13) (11 : Fin 13)
      (4 : Fin 13) (7 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1582` (shared_pair). -/
theorem middleSource_h1582 :
    (!((rowBit (I.sourceRows) 2 9 5 && rowBit (I.sourceRows) 2 9 6 && rowBit (I.sourceRows) 0 11 5 && rowBit (I.sourceRows) 0 11 6))) = true := by
  exact allOne_sharedPair_pointsBeforeCenters I
      (2 : Fin 3) (0 : Fin 3)
      (9 : Fin 13) (11 : Fin 13)
      (5 : Fin 13) (6 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1583` (shared_pair). -/
theorem middleSource_h1583 :
    (!((rowBit (I.sourceRows) 2 9 5 && rowBit (I.sourceRows) 2 9 7 && rowBit (I.sourceRows) 0 11 5 && rowBit (I.sourceRows) 0 11 7))) = true := by
  exact allOne_sharedPair_pointsBeforeCenters I
      (2 : Fin 3) (0 : Fin 3)
      (9 : Fin 13) (11 : Fin 13)
      (5 : Fin 13) (7 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1584` (shared_pair). -/
theorem middleSource_h1584 :
    (!((rowBit (I.sourceRows) 2 9 6 && rowBit (I.sourceRows) 2 9 7 && rowBit (I.sourceRows) 0 11 6 && rowBit (I.sourceRows) 0 11 7))) = true := by
  exact allOne_sharedPair_pointsBeforeCenters I
      (2 : Fin 3) (0 : Fin 3)
      (9 : Fin 13) (11 : Fin 13)
      (6 : Fin 13) (7 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1585` (shared_pair). -/
theorem middleSource_h1585 :
    (!((rowBit (I.sourceRows) 2 9 4 && rowBit (I.sourceRows) 2 9 6 && rowBit (I.sourceRows) 0 12 4 && rowBit (I.sourceRows) 0 12 6))) = true := by
  exact allOne_sharedPair_pointsBeforeCenters I
      (2 : Fin 3) (0 : Fin 3)
      (9 : Fin 13) (12 : Fin 13)
      (4 : Fin 13) (6 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1586` (shared_pair). -/
theorem middleSource_h1586 :
    (!((rowBit (I.sourceRows) 2 9 4 && rowBit (I.sourceRows) 2 9 7 && rowBit (I.sourceRows) 0 12 4 && rowBit (I.sourceRows) 0 12 7))) = true := by
  exact allOne_sharedPair_pointsBeforeCenters I
      (2 : Fin 3) (0 : Fin 3)
      (9 : Fin 13) (12 : Fin 13)
      (4 : Fin 13) (7 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1587` (shared_pair). -/
theorem middleSource_h1587 :
    (!((rowBit (I.sourceRows) 1 0 4 && rowBit (I.sourceRows) 1 0 5 && rowBit (I.sourceRows) 2 1 4 && rowBit (I.sourceRows) 2 1 5))) = true := by
  exact allOne_sharedPair_centersBeforePoints I
      (1 : Fin 3) (2 : Fin 3)
      (0 : Fin 13) (1 : Fin 13)
      (4 : Fin 13) (5 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1588` (shared_pair). -/
theorem middleSource_h1588 :
    (!((rowBit (I.sourceRows) 2 0 4 && rowBit (I.sourceRows) 2 0 5 && rowBit (I.sourceRows) 1 1 4 && rowBit (I.sourceRows) 1 1 5))) = true := by
  exact allOne_sharedPair_centersBeforePoints I
      (2 : Fin 3) (1 : Fin 3)
      (0 : Fin 13) (1 : Fin 13)
      (4 : Fin 13) (5 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1589` (shared_pair). -/
theorem middleSource_h1589 :
    (!((rowBit (I.sourceRows) 1 1 4 && rowBit (I.sourceRows) 1 1 5 && rowBit (I.sourceRows) 2 2 4 && rowBit (I.sourceRows) 2 2 5))) = true := by
  exact allOne_sharedPair_centersBeforePoints I
      (1 : Fin 3) (2 : Fin 3)
      (1 : Fin 13) (2 : Fin 13)
      (4 : Fin 13) (5 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1590` (shared_pair). -/
theorem middleSource_h1590 :
    (!((rowBit (I.sourceRows) 2 1 4 && rowBit (I.sourceRows) 2 1 5 && rowBit (I.sourceRows) 1 2 4 && rowBit (I.sourceRows) 1 2 5))) = true := by
  exact allOne_sharedPair_centersBeforePoints I
      (2 : Fin 3) (1 : Fin 3)
      (1 : Fin 13) (2 : Fin 13)
      (4 : Fin 13) (5 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1591` (shared_pair). -/
theorem middleSource_h1591 :
    (!((rowBit (I.sourceRows) 1 3 10 && rowBit (I.sourceRows) 1 3 12 && rowBit (I.sourceRows) 2 4 10 && rowBit (I.sourceRows) 2 4 12))) = true := by
  exact allOne_sharedPair_centersBeforePoints I
      (1 : Fin 3) (2 : Fin 3)
      (3 : Fin 13) (4 : Fin 13)
      (10 : Fin 13) (12 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1592` (shared_pair). -/
theorem middleSource_h1592 :
    (!((rowBit (I.sourceRows) 2 6 3 && rowBit (I.sourceRows) 2 6 4 && rowBit (I.sourceRows) 1 8 3 && rowBit (I.sourceRows) 1 8 4))) = true := by
  exact allOne_sharedPair_pointsBeforeCenters I
      (2 : Fin 3) (1 : Fin 3)
      (6 : Fin 13) (8 : Fin 13)
      (3 : Fin 13) (4 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1593` (shared_pair). -/
theorem middleSource_h1593 :
    (!((rowBit (I.sourceRows) 1 8 0 && rowBit (I.sourceRows) 1 8 3 && rowBit (I.sourceRows) 2 9 0 && rowBit (I.sourceRows) 2 9 3))) = true := by
  exact allOne_sharedPair_pointsBeforeCenters I
      (1 : Fin 3) (2 : Fin 3)
      (8 : Fin 13) (9 : Fin 13)
      (0 : Fin 13) (3 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1594` (shared_pair). -/
theorem middleSource_h1594 :
    (!((rowBit (I.sourceRows) 1 8 0 && rowBit (I.sourceRows) 1 8 4 && rowBit (I.sourceRows) 2 9 0 && rowBit (I.sourceRows) 2 9 4))) = true := by
  exact allOne_sharedPair_pointsBeforeCenters I
      (1 : Fin 3) (2 : Fin 3)
      (8 : Fin 13) (9 : Fin 13)
      (0 : Fin 13) (4 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1595` (shared_pair). -/
theorem middleSource_h1595 :
    (!((rowBit (I.sourceRows) 1 8 0 && rowBit (I.sourceRows) 1 8 5 && rowBit (I.sourceRows) 2 9 0 && rowBit (I.sourceRows) 2 9 5))) = true := by
  exact allOne_sharedPair_pointsBeforeCenters I
      (1 : Fin 3) (2 : Fin 3)
      (8 : Fin 13) (9 : Fin 13)
      (0 : Fin 13) (5 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1596` (shared_pair). -/
theorem middleSource_h1596 :
    (!((rowBit (I.sourceRows) 1 8 0 && rowBit (I.sourceRows) 1 8 6 && rowBit (I.sourceRows) 2 9 0 && rowBit (I.sourceRows) 2 9 6))) = true := by
  exact allOne_sharedPair_pointsBeforeCenters I
      (1 : Fin 3) (2 : Fin 3)
      (8 : Fin 13) (9 : Fin 13)
      (0 : Fin 13) (6 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1597` (shared_pair). -/
theorem middleSource_h1597 :
    (!((rowBit (I.sourceRows) 1 8 0 && rowBit (I.sourceRows) 1 8 7 && rowBit (I.sourceRows) 2 9 0 && rowBit (I.sourceRows) 2 9 7))) = true := by
  exact allOne_sharedPair_pointsBeforeCenters I
      (1 : Fin 3) (2 : Fin 3)
      (8 : Fin 13) (9 : Fin 13)
      (0 : Fin 13) (7 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1598` (shared_pair). -/
theorem middleSource_h1598 :
    (!((rowBit (I.sourceRows) 1 8 3 && rowBit (I.sourceRows) 1 8 5 && rowBit (I.sourceRows) 2 9 3 && rowBit (I.sourceRows) 2 9 5))) = true := by
  exact allOne_sharedPair_pointsBeforeCenters I
      (1 : Fin 3) (2 : Fin 3)
      (8 : Fin 13) (9 : Fin 13)
      (3 : Fin 13) (5 : Fin 13)
      (by decide) (by decide) (by decide)

/-- Candidate middle source assertion `h1599` (shared_pair). -/
theorem middleSource_h1599 :
    (!((rowBit (I.sourceRows) 1 8 3 && rowBit (I.sourceRows) 1 8 6 && rowBit (I.sourceRows) 2 9 3 && rowBit (I.sourceRows) 2 9 6))) = true := by
  exact allOne_sharedPair_pointsBeforeCenters I
      (1 : Fin 3) (2 : Fin 3)
      (8 : Fin 13) (9 : Fin 13)
      (3 : Fin 13) (6 : Fin 13)
      (by decide) (by decide) (by decide)

end

end ATailExactFiveCard13AllOneSourceIngressScratch
end Problem97
