/-
Generated source-faithful composition for left certificate chunk 023.
-/
import AllOneLeftVerifiedBridgeChunk023
import AllOneMiddleBaseInstances
import AllOneMiddleRankInstances
import AllOneOrbitEdgeInstances

/-!
# Left source composition chunk 023

Source-faithful Boolean facts for one chunk of the verified certificate.
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
open Problem97.ATailExactFiveCard13AllOneCertificate.Left

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

/-- The live left source facts satisfy certificate chunk 023. -/
theorem leftSourceChunk023_each
    (C : CanonicalAlignedCoverFamilies T 1 2 3) :
    ∀ item ∈ sourceChunk023Assertions,
      item.eval
        (sourceAssignment
          (sourceRows (CanonicalAllOneSourceOrbitIngress.left C))
          (sourceBlockers T) (sourceShell T) (sourceQ T) (sourceW T)
          (sourceFirstApexRow T) (sourceRanks P)) = true := by
  exact sourceChunk023_each_of_flat
    (sourceRows (CanonicalAllOneSourceOrbitIngress.left C))
    (sourceBlockers T) (sourceShell T) (sourceQ T) (sourceW T)
    (sourceFirstApexRow T) (sourceRanks P)
    (middleSource_h1472 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1473 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1474 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1475 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1476 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1477 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1478 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1479 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1480 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1481 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1482 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1483 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1484 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1485 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1486 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1487 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1488 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1489 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1490 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1491 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1492 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1493 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1494 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1495 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1496 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1497 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1498 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1499 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1500 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1501 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1502 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1503 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1504 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1505 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1506 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1507 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1508 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1509 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1510 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1511 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1512 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1513 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1514 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1515 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1516 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1517 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1518 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1519 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1520 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1521 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1522 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1523 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1524 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1525 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1526 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1527 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1528 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1529 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1530 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1531 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1532 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1533 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1534 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1535 (CanonicalAllOneSourceOrbitIngress.left C))

end

end ATailExactFiveCard13AllOneSourceIngressScratch
end Problem97
