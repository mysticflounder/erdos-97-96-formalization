/-
Generated source-faithful composition for left certificate chunk 030.
-/
import AllOneLeftVerifiedBridgeChunk030
import AllOneMiddleBaseInstances
import AllOneMiddleRankInstances
import AllOneOrbitEdgeInstances

/-!
# Left source composition chunk 030

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

/-- The live left source facts satisfy certificate chunk 030. -/
theorem leftSourceChunk030_each
    (C : CanonicalAlignedCoverFamilies T 1 2 3) :
    ∀ item ∈ sourceChunk030Assertions,
      item.eval
        (sourceAssignment
          (sourceRows (CanonicalAllOneSourceOrbitIngress.left C))
          (sourceBlockers T) (sourceShell T) (sourceQ T) (sourceW T)
          (sourceFirstApexRow T) (sourceRanks P)) = true := by
  exact sourceChunk030_each_of_flat
    (sourceRows (CanonicalAllOneSourceOrbitIngress.left C))
    (sourceBlockers T) (sourceShell T) (sourceQ T) (sourceW T)
    (sourceFirstApexRow T) (sourceRanks P)
    (middleSource_h1920)
    (middleSource_h1921)
    (middleSource_h1922)
    (middleSource_h1923)
    (middleSource_h1924)
    (middleSource_h1925)
    (middleSource_h1926)
    (middleSource_h1927)
    (middleSource_h1928)
    (middleSource_h1929)
    (middleSource_h1930)
    (middleSource_h1931)
    (middleSource_h1932)
    (middleSource_h1933)
    (middleSource_h1934)
    (middleSource_h1935)
    (middleSource_h1936)
    (middleSource_h1937)
    (middleSource_h1938)
    (middleSource_h1939)
    (middleSource_h1940)
    (middleSource_h1941)
    (middleSource_h1942)
    (middleSource_h1943)
    (middleSource_h1944)
    (middleSource_h1945)
    (middleSource_h1946)
    (leftSource_h1947 C)
    (leftSource_h1948 C)
    (leftSource_h1949 C)
    (middleSource_h1950 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1951 (CanonicalAllOneSourceOrbitIngress.left C))
    (middleSource_h1952)
    (middleSource_h1953)
    (middleSource_h1954)
    (middleSource_h1955)
    (middleSource_h1956)
    (middleSource_h1957)
    (middleSource_h1958)
    (middleSource_h1959)
    (middleSource_h1960)
    (middleSource_h1961)
    (middleSource_h1962)
    (middleSource_h1963)
    (middleSource_h1964)
    (middleSource_h1965)
    (middleSource_h1966)
    (middleSource_h1967)
    (middleSource_h1968)
    (middleSource_h1969)
    (middleSource_h1970)
    (middleSource_h1971)
    (middleSource_h1972)
    (middleSource_h1973)
    (middleSource_h1974)
    (middleSource_h1975)
    (middleSource_h1976)
    (middleSource_h1977)
    (middleSource_h1978)
    (middleSource_h1979)
    (middleSource_h1980)
    (middleSource_h1981)
    (middleSource_h1982)
    (middleSource_h1983)

end

end ATailExactFiveCard13AllOneSourceIngressScratch
end Problem97
