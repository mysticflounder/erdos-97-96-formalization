/-
Generated source-faithful composition for left certificate chunk 021.
-/
import AllOneLeftVerifiedBridgeChunk021
import AllOneMiddleBaseInstances
import AllOneMiddleRankInstances
import AllOneOrbitEdgeInstances

/-!
# Left source composition chunk 021

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

/-- The live left source facts satisfy certificate chunk 021. -/
theorem leftSourceChunk021_each
    (C : CanonicalAlignedCoverFamilies T 1 2 3) :
    ∀ item ∈ sourceChunk021Assertions,
      item.eval
        (sourceAssignment
          (sourceRows (CanonicalAllOneSourceOrbitIngress.left C))
          (sourceBlockers T) (sourceShell T) (sourceQ T) (sourceW T)
          (sourceFirstApexRow T) (sourceRanks P)) = true := by
  exact sourceChunk021_each_of_flat
    (sourceRows (CanonicalAllOneSourceOrbitIngress.left C))
    (sourceBlockers T) (sourceShell T) (sourceQ T) (sourceW T)
    (sourceFirstApexRow T) (sourceRanks P)
    (middleSource_h1344 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1345 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1346 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1347 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1348 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1349 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1350 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1351 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1352 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1353 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1354 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1355 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1356 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1357 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1358 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1359 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1360 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1361 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1362 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1363 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1364 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1365 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1366 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1367 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1368 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1369 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1370 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1371 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1372 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1373 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1374 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1375 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1376 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1377 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1378 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1379 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1380 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1381 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1382 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1383 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1384 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1385 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1386 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1387 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1388 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1389 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1390 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1391 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1392 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1393 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1394 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1395 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1396 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1397 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1398 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1399 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1400 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1401 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1402 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1403 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1404 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1405 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1406 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1407 (CanonicalAllOneSourceOrbitIngress.left C))

end

end ATailExactFiveCard13AllOneSourceIngressScratch
end Problem97
