/-
Generated source-faithful composition for left certificate chunk 031.
-/
import AllOneLeftVerifiedBridgeChunk031
import AllOneMiddleBaseInstances
import AllOneMiddleRankInstances
import AllOneOrbitEdgeInstances

/-!
# Left source composition chunk 031

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

/-- The live left source facts satisfy certificate chunk 031. -/
theorem leftSourceChunk031_each
    (C : CanonicalAlignedCoverFamilies T 1 2 3) :
    ∀ item ∈ sourceChunk031Assertions,
      item.eval
        (sourceAssignment
          (sourceRows (CanonicalAllOneSourceOrbitIngress.left C))
          (sourceBlockers T) (sourceShell T) (sourceQ T) (sourceW T)
          (sourceFirstApexRow T) (sourceRanks P)) = true := by
  exact sourceChunk031_each_of_flat
    (sourceRows (CanonicalAllOneSourceOrbitIngress.left C))
    (sourceBlockers T) (sourceShell T) (sourceQ T) (sourceW T)
    (sourceFirstApexRow T) (sourceRanks P)
    (middleSource_h1984)
    (middleSource_h1985)
    (middleSource_h1986)
    (middleSource_h1987)
    (middleSource_h1988)
    (middleSource_h1989)
    (middleSource_h1990)
    (middleSource_h1991)
    (middleSource_h1992)
    (middleSource_h1993)
    (middleSource_h1994)
    (middleSource_h1995)
    (middleSource_h1996)
    (middleSource_h1997)
    (middleSource_h1998)
    (middleSource_h1999)
    (middleSource_h2000)
    (middleSource_h2001)
    (middleSource_h2002)
    (middleSource_h2003)
    (middleSource_h2004)
    (middleSource_h2005)
    (middleSource_h2006)
    (middleSource_h2007)
    (middleSource_h2008)
    (middleSource_h2009)
    (middleSource_h2010)
    (middleSource_h2011)
    (middleSource_h2012)
    (middleSource_h2013)
    (middleSource_h2014)
    (middleSource_h2015)
    (middleSource_h2016)
    (middleSource_h2017)
    (middleSource_h2018)
    (middleSource_h2019)
    (middleSource_h2020)
    (middleSource_h2021)
    (middleSource_h2022)
    (middleSource_h2023)
    (middleSource_h2024)
    (middleSource_h2025)
    (middleSource_h2026)
    (middleSource_h2027)
    (middleSource_h2028 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h2029 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h2030 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h2031 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h2032 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h2033 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h2034 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h2035 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h2036 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h2037 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h2038 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h2039 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h2040 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h2041 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h2042 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h2043 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h2044 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h2045 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h2046 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h2047 (CanonicalAllOneSourceOrbitIngress.left C))

end

end ATailExactFiveCard13AllOneSourceIngressScratch
end Problem97
