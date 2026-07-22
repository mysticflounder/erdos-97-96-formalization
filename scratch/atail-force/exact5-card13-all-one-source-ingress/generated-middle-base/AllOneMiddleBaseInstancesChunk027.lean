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

/-- Candidate middle source assertion `h1728` (first_shared_pair). -/
theorem middleSource_h1728 :
    (!((firstRowBit (sourceFirstApexRow T) 1 && firstRowBit (sourceFirstApexRow T) 9 && rowBit (I.sourceRows) 0 5 1 && rowBit (I.sourceRows) 0 5 9))) = true := by
  apply allOne_firstRow_sharedPair_false_of_strict I
    (0 : Fin 3) (5 : Fin 13)
    (1 : Fin 13) (9 : Fin 13)
  have hk := P.strictKalmanson
    (a := (1 : Fin 13)) (b := (4 : Fin 13))
    (c := (5 : Fin 13)) (d := (9 : Fin 13))
    (by decide) (by decide) (by decide)
  exact Or.inr (by simpa only [dist_comm, add_comm] using hk.2)

/-- Candidate middle source assertion `h1729` (first_shared_pair). -/
theorem middleSource_h1729 :
    (!((firstRowBit (sourceFirstApexRow T) 1 && firstRowBit (sourceFirstApexRow T) 10 && rowBit (I.sourceRows) 0 5 1 && rowBit (I.sourceRows) 0 5 10))) = true := by
  apply allOne_firstRow_sharedPair_false_of_strict I
    (0 : Fin 3) (5 : Fin 13)
    (1 : Fin 13) (10 : Fin 13)
  have hk := P.strictKalmanson
    (a := (1 : Fin 13)) (b := (4 : Fin 13))
    (c := (5 : Fin 13)) (d := (10 : Fin 13))
    (by decide) (by decide) (by decide)
  exact Or.inr (by simpa only [dist_comm, add_comm] using hk.2)

/-- Candidate middle source assertion `h1730` (first_shared_pair). -/
theorem middleSource_h1730 :
    (!((firstRowBit (sourceFirstApexRow T) 1 && firstRowBit (sourceFirstApexRow T) 11 && rowBit (I.sourceRows) 0 5 1 && rowBit (I.sourceRows) 0 5 11))) = true := by
  apply allOne_firstRow_sharedPair_false_of_strict I
    (0 : Fin 3) (5 : Fin 13)
    (1 : Fin 13) (11 : Fin 13)
  have hk := P.strictKalmanson
    (a := (1 : Fin 13)) (b := (4 : Fin 13))
    (c := (5 : Fin 13)) (d := (11 : Fin 13))
    (by decide) (by decide) (by decide)
  exact Or.inr (by simpa only [dist_comm, add_comm] using hk.2)

/-- Candidate middle source assertion `h1731` (first_shared_pair). -/
theorem middleSource_h1731 :
    (!((firstRowBit (sourceFirstApexRow T) 2 && firstRowBit (sourceFirstApexRow T) 9 && rowBit (I.sourceRows) 0 5 2 && rowBit (I.sourceRows) 0 5 9))) = true := by
  apply allOne_firstRow_sharedPair_false_of_strict I
    (0 : Fin 3) (5 : Fin 13)
    (2 : Fin 13) (9 : Fin 13)
  have hk := P.strictKalmanson
    (a := (2 : Fin 13)) (b := (4 : Fin 13))
    (c := (5 : Fin 13)) (d := (9 : Fin 13))
    (by decide) (by decide) (by decide)
  exact Or.inr (by simpa only [dist_comm, add_comm] using hk.2)

/-- Candidate middle source assertion `h1732` (first_shared_pair). -/
theorem middleSource_h1732 :
    (!((firstRowBit (sourceFirstApexRow T) 2 && firstRowBit (sourceFirstApexRow T) 10 && rowBit (I.sourceRows) 0 5 2 && rowBit (I.sourceRows) 0 5 10))) = true := by
  apply allOne_firstRow_sharedPair_false_of_strict I
    (0 : Fin 3) (5 : Fin 13)
    (2 : Fin 13) (10 : Fin 13)
  have hk := P.strictKalmanson
    (a := (2 : Fin 13)) (b := (4 : Fin 13))
    (c := (5 : Fin 13)) (d := (10 : Fin 13))
    (by decide) (by decide) (by decide)
  exact Or.inr (by simpa only [dist_comm, add_comm] using hk.2)

/-- Candidate middle source assertion `h1733` (first_shared_pair). -/
theorem middleSource_h1733 :
    (!((firstRowBit (sourceFirstApexRow T) 2 && firstRowBit (sourceFirstApexRow T) 11 && rowBit (I.sourceRows) 0 5 2 && rowBit (I.sourceRows) 0 5 11))) = true := by
  apply allOne_firstRow_sharedPair_false_of_strict I
    (0 : Fin 3) (5 : Fin 13)
    (2 : Fin 13) (11 : Fin 13)
  have hk := P.strictKalmanson
    (a := (2 : Fin 13)) (b := (4 : Fin 13))
    (c := (5 : Fin 13)) (d := (11 : Fin 13))
    (by decide) (by decide) (by decide)
  exact Or.inr (by simpa only [dist_comm, add_comm] using hk.2)

/-- Candidate middle source assertion `h1734` (first_shared_pair). -/
theorem middleSource_h1734 :
    (!((firstRowBit (sourceFirstApexRow T) 2 && firstRowBit (sourceFirstApexRow T) 12 && rowBit (I.sourceRows) 0 5 2 && rowBit (I.sourceRows) 0 5 12))) = true := by
  apply allOne_firstRow_sharedPair_false_of_strict I
    (0 : Fin 3) (5 : Fin 13)
    (2 : Fin 13) (12 : Fin 13)
  have hk := P.strictKalmanson
    (a := (2 : Fin 13)) (b := (4 : Fin 13))
    (c := (5 : Fin 13)) (d := (12 : Fin 13))
    (by decide) (by decide) (by decide)
  exact Or.inr (by simpa only [dist_comm, add_comm] using hk.2)

/-- Candidate middle source assertion `h1735` (first_shared_pair). -/
theorem middleSource_h1735 :
    (!((firstRowBit (sourceFirstApexRow T) 3 && firstRowBit (sourceFirstApexRow T) 9 && rowBit (I.sourceRows) 0 5 3 && rowBit (I.sourceRows) 0 5 9))) = true := by
  apply allOne_firstRow_sharedPair_false_of_strict I
    (0 : Fin 3) (5 : Fin 13)
    (3 : Fin 13) (9 : Fin 13)
  have hk := P.strictKalmanson
    (a := (3 : Fin 13)) (b := (4 : Fin 13))
    (c := (5 : Fin 13)) (d := (9 : Fin 13))
    (by decide) (by decide) (by decide)
  exact Or.inr (by simpa only [dist_comm, add_comm] using hk.2)

/-- Candidate middle source assertion `h1736` (first_shared_pair). -/
theorem middleSource_h1736 :
    (!((firstRowBit (sourceFirstApexRow T) 3 && firstRowBit (sourceFirstApexRow T) 11 && rowBit (I.sourceRows) 0 5 3 && rowBit (I.sourceRows) 0 5 11))) = true := by
  apply allOne_firstRow_sharedPair_false_of_strict I
    (0 : Fin 3) (5 : Fin 13)
    (3 : Fin 13) (11 : Fin 13)
  have hk := P.strictKalmanson
    (a := (3 : Fin 13)) (b := (4 : Fin 13))
    (c := (5 : Fin 13)) (d := (11 : Fin 13))
    (by decide) (by decide) (by decide)
  exact Or.inr (by simpa only [dist_comm, add_comm] using hk.2)

/-- Candidate middle source assertion `h1737` (first_shared_pair). -/
theorem middleSource_h1737 :
    (!((firstRowBit (sourceFirstApexRow T) 3 && firstRowBit (sourceFirstApexRow T) 12 && rowBit (I.sourceRows) 0 5 3 && rowBit (I.sourceRows) 0 5 12))) = true := by
  apply allOne_firstRow_sharedPair_false_of_strict I
    (0 : Fin 3) (5 : Fin 13)
    (3 : Fin 13) (12 : Fin 13)
  have hk := P.strictKalmanson
    (a := (3 : Fin 13)) (b := (4 : Fin 13))
    (c := (5 : Fin 13)) (d := (12 : Fin 13))
    (by decide) (by decide) (by decide)
  exact Or.inr (by simpa only [dist_comm, add_comm] using hk.2)

/-- Candidate middle source assertion `h1738` (first_shared_pair). -/
theorem middleSource_h1738 :
    (!((firstRowBit (sourceFirstApexRow T) 9 && firstRowBit (sourceFirstApexRow T) 10 && rowBit (I.sourceRows) 0 5 9 && rowBit (I.sourceRows) 0 5 10))) = true := by
  apply allOne_firstRow_sharedPair_false_of_strict I
    (0 : Fin 3) (5 : Fin 13)
    (9 : Fin 13) (10 : Fin 13)
  have hk := P.strictKalmanson
    (a := (4 : Fin 13)) (b := (5 : Fin 13))
    (c := (9 : Fin 13)) (d := (10 : Fin 13))
    (by decide) (by decide) (by decide)
  exact Or.inl (by simpa only [dist_comm, add_comm] using hk.1)

/-- Candidate middle source assertion `h1739` (first_shared_pair). -/
theorem middleSource_h1739 :
    (!((firstRowBit (sourceFirstApexRow T) 9 && firstRowBit (sourceFirstApexRow T) 11 && rowBit (I.sourceRows) 0 5 9 && rowBit (I.sourceRows) 0 5 11))) = true := by
  apply allOne_firstRow_sharedPair_false_of_strict I
    (0 : Fin 3) (5 : Fin 13)
    (9 : Fin 13) (11 : Fin 13)
  have hk := P.strictKalmanson
    (a := (4 : Fin 13)) (b := (5 : Fin 13))
    (c := (9 : Fin 13)) (d := (11 : Fin 13))
    (by decide) (by decide) (by decide)
  exact Or.inl (by simpa only [dist_comm, add_comm] using hk.1)

/-- Candidate middle source assertion `h1740` (first_shared_pair). -/
theorem middleSource_h1740 :
    (!((firstRowBit (sourceFirstApexRow T) 9 && firstRowBit (sourceFirstApexRow T) 12 && rowBit (I.sourceRows) 0 5 9 && rowBit (I.sourceRows) 0 5 12))) = true := by
  apply allOne_firstRow_sharedPair_false_of_strict I
    (0 : Fin 3) (5 : Fin 13)
    (9 : Fin 13) (12 : Fin 13)
  have hk := P.strictKalmanson
    (a := (4 : Fin 13)) (b := (5 : Fin 13))
    (c := (9 : Fin 13)) (d := (12 : Fin 13))
    (by decide) (by decide) (by decide)
  exact Or.inl (by simpa only [dist_comm, add_comm] using hk.1)

/-- Candidate middle source assertion `h1741` (first_shared_pair). -/
theorem middleSource_h1741 :
    (!((firstRowBit (sourceFirstApexRow T) 11 && firstRowBit (sourceFirstApexRow T) 12 && rowBit (I.sourceRows) 0 5 11 && rowBit (I.sourceRows) 0 5 12))) = true := by
  apply allOne_firstRow_sharedPair_false_of_strict I
    (0 : Fin 3) (5 : Fin 13)
    (11 : Fin 13) (12 : Fin 13)
  have hk := P.strictKalmanson
    (a := (4 : Fin 13)) (b := (5 : Fin 13))
    (c := (11 : Fin 13)) (d := (12 : Fin 13))
    (by decide) (by decide) (by decide)
  exact Or.inl (by simpa only [dist_comm, add_comm] using hk.1)

/-- Candidate middle source assertion `h1742` (first_shared_pair). -/
theorem middleSource_h1742 :
    (!((firstRowBit (sourceFirstApexRow T) 0 && firstRowBit (sourceFirstApexRow T) 11 && rowBit (I.sourceRows) 0 6 0 && rowBit (I.sourceRows) 0 6 11))) = true := by
  apply allOne_firstRow_sharedPair_false_of_strict I
    (0 : Fin 3) (6 : Fin 13)
    (0 : Fin 13) (11 : Fin 13)
  have hk := P.strictKalmanson
    (a := (0 : Fin 13)) (b := (4 : Fin 13))
    (c := (6 : Fin 13)) (d := (11 : Fin 13))
    (by decide) (by decide) (by decide)
  exact Or.inr (by simpa only [dist_comm, add_comm] using hk.2)

/-- Candidate middle source assertion `h1743` (first_shared_pair). -/
theorem middleSource_h1743 :
    (!((firstRowBit (sourceFirstApexRow T) 0 && firstRowBit (sourceFirstApexRow T) 12 && rowBit (I.sourceRows) 0 6 0 && rowBit (I.sourceRows) 0 6 12))) = true := by
  apply allOne_firstRow_sharedPair_false_of_strict I
    (0 : Fin 3) (6 : Fin 13)
    (0 : Fin 13) (12 : Fin 13)
  have hk := P.strictKalmanson
    (a := (0 : Fin 13)) (b := (4 : Fin 13))
    (c := (6 : Fin 13)) (d := (12 : Fin 13))
    (by decide) (by decide) (by decide)
  exact Or.inr (by simpa only [dist_comm, add_comm] using hk.2)

/-- Candidate middle source assertion `h1744` (first_shared_pair). -/
theorem middleSource_h1744 :
    (!((firstRowBit (sourceFirstApexRow T) 1 && firstRowBit (sourceFirstApexRow T) 9 && rowBit (I.sourceRows) 0 6 1 && rowBit (I.sourceRows) 0 6 9))) = true := by
  apply allOne_firstRow_sharedPair_false_of_strict I
    (0 : Fin 3) (6 : Fin 13)
    (1 : Fin 13) (9 : Fin 13)
  have hk := P.strictKalmanson
    (a := (1 : Fin 13)) (b := (4 : Fin 13))
    (c := (6 : Fin 13)) (d := (9 : Fin 13))
    (by decide) (by decide) (by decide)
  exact Or.inr (by simpa only [dist_comm, add_comm] using hk.2)

/-- Candidate middle source assertion `h1745` (first_shared_pair). -/
theorem middleSource_h1745 :
    (!((firstRowBit (sourceFirstApexRow T) 1 && firstRowBit (sourceFirstApexRow T) 10 && rowBit (I.sourceRows) 0 6 1 && rowBit (I.sourceRows) 0 6 10))) = true := by
  apply allOne_firstRow_sharedPair_false_of_strict I
    (0 : Fin 3) (6 : Fin 13)
    (1 : Fin 13) (10 : Fin 13)
  have hk := P.strictKalmanson
    (a := (1 : Fin 13)) (b := (4 : Fin 13))
    (c := (6 : Fin 13)) (d := (10 : Fin 13))
    (by decide) (by decide) (by decide)
  exact Or.inr (by simpa only [dist_comm, add_comm] using hk.2)

/-- Candidate middle source assertion `h1746` (first_shared_pair). -/
theorem middleSource_h1746 :
    (!((firstRowBit (sourceFirstApexRow T) 1 && firstRowBit (sourceFirstApexRow T) 11 && rowBit (I.sourceRows) 0 6 1 && rowBit (I.sourceRows) 0 6 11))) = true := by
  apply allOne_firstRow_sharedPair_false_of_strict I
    (0 : Fin 3) (6 : Fin 13)
    (1 : Fin 13) (11 : Fin 13)
  have hk := P.strictKalmanson
    (a := (1 : Fin 13)) (b := (4 : Fin 13))
    (c := (6 : Fin 13)) (d := (11 : Fin 13))
    (by decide) (by decide) (by decide)
  exact Or.inr (by simpa only [dist_comm, add_comm] using hk.2)

/-- Candidate middle source assertion `h1747` (first_shared_pair). -/
theorem middleSource_h1747 :
    (!((firstRowBit (sourceFirstApexRow T) 2 && firstRowBit (sourceFirstApexRow T) 9 && rowBit (I.sourceRows) 0 6 2 && rowBit (I.sourceRows) 0 6 9))) = true := by
  apply allOne_firstRow_sharedPair_false_of_strict I
    (0 : Fin 3) (6 : Fin 13)
    (2 : Fin 13) (9 : Fin 13)
  have hk := P.strictKalmanson
    (a := (2 : Fin 13)) (b := (4 : Fin 13))
    (c := (6 : Fin 13)) (d := (9 : Fin 13))
    (by decide) (by decide) (by decide)
  exact Or.inr (by simpa only [dist_comm, add_comm] using hk.2)

/-- Candidate middle source assertion `h1748` (first_shared_pair). -/
theorem middleSource_h1748 :
    (!((firstRowBit (sourceFirstApexRow T) 2 && firstRowBit (sourceFirstApexRow T) 10 && rowBit (I.sourceRows) 0 6 2 && rowBit (I.sourceRows) 0 6 10))) = true := by
  apply allOne_firstRow_sharedPair_false_of_strict I
    (0 : Fin 3) (6 : Fin 13)
    (2 : Fin 13) (10 : Fin 13)
  have hk := P.strictKalmanson
    (a := (2 : Fin 13)) (b := (4 : Fin 13))
    (c := (6 : Fin 13)) (d := (10 : Fin 13))
    (by decide) (by decide) (by decide)
  exact Or.inr (by simpa only [dist_comm, add_comm] using hk.2)

/-- Candidate middle source assertion `h1749` (first_shared_pair). -/
theorem middleSource_h1749 :
    (!((firstRowBit (sourceFirstApexRow T) 2 && firstRowBit (sourceFirstApexRow T) 11 && rowBit (I.sourceRows) 0 6 2 && rowBit (I.sourceRows) 0 6 11))) = true := by
  apply allOne_firstRow_sharedPair_false_of_strict I
    (0 : Fin 3) (6 : Fin 13)
    (2 : Fin 13) (11 : Fin 13)
  have hk := P.strictKalmanson
    (a := (2 : Fin 13)) (b := (4 : Fin 13))
    (c := (6 : Fin 13)) (d := (11 : Fin 13))
    (by decide) (by decide) (by decide)
  exact Or.inr (by simpa only [dist_comm, add_comm] using hk.2)

/-- Candidate middle source assertion `h1750` (first_shared_pair). -/
theorem middleSource_h1750 :
    (!((firstRowBit (sourceFirstApexRow T) 2 && firstRowBit (sourceFirstApexRow T) 12 && rowBit (I.sourceRows) 0 6 2 && rowBit (I.sourceRows) 0 6 12))) = true := by
  apply allOne_firstRow_sharedPair_false_of_strict I
    (0 : Fin 3) (6 : Fin 13)
    (2 : Fin 13) (12 : Fin 13)
  have hk := P.strictKalmanson
    (a := (2 : Fin 13)) (b := (4 : Fin 13))
    (c := (6 : Fin 13)) (d := (12 : Fin 13))
    (by decide) (by decide) (by decide)
  exact Or.inr (by simpa only [dist_comm, add_comm] using hk.2)

/-- Candidate middle source assertion `h1751` (first_shared_pair). -/
theorem middleSource_h1751 :
    (!((firstRowBit (sourceFirstApexRow T) 3 && firstRowBit (sourceFirstApexRow T) 9 && rowBit (I.sourceRows) 0 6 3 && rowBit (I.sourceRows) 0 6 9))) = true := by
  apply allOne_firstRow_sharedPair_false_of_strict I
    (0 : Fin 3) (6 : Fin 13)
    (3 : Fin 13) (9 : Fin 13)
  have hk := P.strictKalmanson
    (a := (3 : Fin 13)) (b := (4 : Fin 13))
    (c := (6 : Fin 13)) (d := (9 : Fin 13))
    (by decide) (by decide) (by decide)
  exact Or.inr (by simpa only [dist_comm, add_comm] using hk.2)

/-- Candidate middle source assertion `h1752` (first_shared_pair). -/
theorem middleSource_h1752 :
    (!((firstRowBit (sourceFirstApexRow T) 3 && firstRowBit (sourceFirstApexRow T) 10 && rowBit (I.sourceRows) 0 6 3 && rowBit (I.sourceRows) 0 6 10))) = true := by
  apply allOne_firstRow_sharedPair_false_of_strict I
    (0 : Fin 3) (6 : Fin 13)
    (3 : Fin 13) (10 : Fin 13)
  have hk := P.strictKalmanson
    (a := (3 : Fin 13)) (b := (4 : Fin 13))
    (c := (6 : Fin 13)) (d := (10 : Fin 13))
    (by decide) (by decide) (by decide)
  exact Or.inr (by simpa only [dist_comm, add_comm] using hk.2)

/-- Candidate middle source assertion `h1753` (first_shared_pair). -/
theorem middleSource_h1753 :
    (!((firstRowBit (sourceFirstApexRow T) 9 && firstRowBit (sourceFirstApexRow T) 10 && rowBit (I.sourceRows) 0 6 9 && rowBit (I.sourceRows) 0 6 10))) = true := by
  apply allOne_firstRow_sharedPair_false_of_strict I
    (0 : Fin 3) (6 : Fin 13)
    (9 : Fin 13) (10 : Fin 13)
  have hk := P.strictKalmanson
    (a := (4 : Fin 13)) (b := (6 : Fin 13))
    (c := (9 : Fin 13)) (d := (10 : Fin 13))
    (by decide) (by decide) (by decide)
  exact Or.inl (by simpa only [dist_comm, add_comm] using hk.1)

/-- Candidate middle source assertion `h1754` (first_shared_pair). -/
theorem middleSource_h1754 :
    (!((firstRowBit (sourceFirstApexRow T) 9 && firstRowBit (sourceFirstApexRow T) 11 && rowBit (I.sourceRows) 0 6 9 && rowBit (I.sourceRows) 0 6 11))) = true := by
  apply allOne_firstRow_sharedPair_false_of_strict I
    (0 : Fin 3) (6 : Fin 13)
    (9 : Fin 13) (11 : Fin 13)
  have hk := P.strictKalmanson
    (a := (4 : Fin 13)) (b := (6 : Fin 13))
    (c := (9 : Fin 13)) (d := (11 : Fin 13))
    (by decide) (by decide) (by decide)
  exact Or.inl (by simpa only [dist_comm, add_comm] using hk.1)

/-- Candidate middle source assertion `h1755` (first_shared_pair). -/
theorem middleSource_h1755 :
    (!((firstRowBit (sourceFirstApexRow T) 10 && firstRowBit (sourceFirstApexRow T) 11 && rowBit (I.sourceRows) 0 6 10 && rowBit (I.sourceRows) 0 6 11))) = true := by
  apply allOne_firstRow_sharedPair_false_of_strict I
    (0 : Fin 3) (6 : Fin 13)
    (10 : Fin 13) (11 : Fin 13)
  have hk := P.strictKalmanson
    (a := (4 : Fin 13)) (b := (6 : Fin 13))
    (c := (10 : Fin 13)) (d := (11 : Fin 13))
    (by decide) (by decide) (by decide)
  exact Or.inl (by simpa only [dist_comm, add_comm] using hk.1)

/-- Candidate middle source assertion `h1756` (first_shared_pair). -/
theorem middleSource_h1756 :
    (!((firstRowBit (sourceFirstApexRow T) 11 && firstRowBit (sourceFirstApexRow T) 12 && rowBit (I.sourceRows) 0 6 11 && rowBit (I.sourceRows) 0 6 12))) = true := by
  apply allOne_firstRow_sharedPair_false_of_strict I
    (0 : Fin 3) (6 : Fin 13)
    (11 : Fin 13) (12 : Fin 13)
  have hk := P.strictKalmanson
    (a := (4 : Fin 13)) (b := (6 : Fin 13))
    (c := (11 : Fin 13)) (d := (12 : Fin 13))
    (by decide) (by decide) (by decide)
  exact Or.inl (by simpa only [dist_comm, add_comm] using hk.1)

/-- Candidate middle source assertion `h1757` (first_shared_pair). -/
theorem middleSource_h1757 :
    (!((firstRowBit (sourceFirstApexRow T) 5 && firstRowBit (sourceFirstApexRow T) 9 && rowBit (I.sourceRows) 0 0 5 && rowBit (I.sourceRows) 0 0 9))) = true := by
  apply allOne_firstRow_sharedPair_false_of_strict I
    (0 : Fin 3) (0 : Fin 13)
    (5 : Fin 13) (9 : Fin 13)
  have hk := P.strictKalmanson
    (a := (0 : Fin 13)) (b := (4 : Fin 13))
    (c := (5 : Fin 13)) (d := (9 : Fin 13))
    (by decide) (by decide) (by decide)
  exact Or.inr (by simpa only [dist_comm, add_comm] using hk.1)

/-- Candidate middle source assertion `h1758` (first_shared_pair). -/
theorem middleSource_h1758 :
    (!((firstRowBit (sourceFirstApexRow T) 5 && firstRowBit (sourceFirstApexRow T) 11 && rowBit (I.sourceRows) 0 0 5 && rowBit (I.sourceRows) 0 0 11))) = true := by
  apply allOne_firstRow_sharedPair_false_of_strict I
    (0 : Fin 3) (0 : Fin 13)
    (5 : Fin 13) (11 : Fin 13)
  have hk := P.strictKalmanson
    (a := (0 : Fin 13)) (b := (4 : Fin 13))
    (c := (5 : Fin 13)) (d := (11 : Fin 13))
    (by decide) (by decide) (by decide)
  exact Or.inr (by simpa only [dist_comm, add_comm] using hk.1)

/-- Candidate middle source assertion `h1759` (first_shared_pair). -/
theorem middleSource_h1759 :
    (!((firstRowBit (sourceFirstApexRow T) 5 && firstRowBit (sourceFirstApexRow T) 12 && rowBit (I.sourceRows) 0 0 5 && rowBit (I.sourceRows) 0 0 12))) = true := by
  apply allOne_firstRow_sharedPair_false_of_strict I
    (0 : Fin 3) (0 : Fin 13)
    (5 : Fin 13) (12 : Fin 13)
  have hk := P.strictKalmanson
    (a := (0 : Fin 13)) (b := (4 : Fin 13))
    (c := (5 : Fin 13)) (d := (12 : Fin 13))
    (by decide) (by decide) (by decide)
  exact Or.inr (by simpa only [dist_comm, add_comm] using hk.1)

/-- Candidate middle source assertion `h1760` (first_shared_pair). -/
theorem middleSource_h1760 :
    (!((firstRowBit (sourceFirstApexRow T) 6 && firstRowBit (sourceFirstApexRow T) 9 && rowBit (I.sourceRows) 0 0 6 && rowBit (I.sourceRows) 0 0 9))) = true := by
  apply allOne_firstRow_sharedPair_false_of_strict I
    (0 : Fin 3) (0 : Fin 13)
    (6 : Fin 13) (9 : Fin 13)
  have hk := P.strictKalmanson
    (a := (0 : Fin 13)) (b := (4 : Fin 13))
    (c := (6 : Fin 13)) (d := (9 : Fin 13))
    (by decide) (by decide) (by decide)
  exact Or.inr (by simpa only [dist_comm, add_comm] using hk.1)

/-- Candidate middle source assertion `h1761` (first_shared_pair). -/
theorem middleSource_h1761 :
    (!((firstRowBit (sourceFirstApexRow T) 6 && firstRowBit (sourceFirstApexRow T) 10 && rowBit (I.sourceRows) 0 0 6 && rowBit (I.sourceRows) 0 0 10))) = true := by
  apply allOne_firstRow_sharedPair_false_of_strict I
    (0 : Fin 3) (0 : Fin 13)
    (6 : Fin 13) (10 : Fin 13)
  have hk := P.strictKalmanson
    (a := (0 : Fin 13)) (b := (4 : Fin 13))
    (c := (6 : Fin 13)) (d := (10 : Fin 13))
    (by decide) (by decide) (by decide)
  exact Or.inr (by simpa only [dist_comm, add_comm] using hk.1)

/-- Candidate middle source assertion `h1762` (first_shared_pair). -/
theorem middleSource_h1762 :
    (!((firstRowBit (sourceFirstApexRow T) 6 && firstRowBit (sourceFirstApexRow T) 11 && rowBit (I.sourceRows) 0 0 6 && rowBit (I.sourceRows) 0 0 11))) = true := by
  apply allOne_firstRow_sharedPair_false_of_strict I
    (0 : Fin 3) (0 : Fin 13)
    (6 : Fin 13) (11 : Fin 13)
  have hk := P.strictKalmanson
    (a := (0 : Fin 13)) (b := (4 : Fin 13))
    (c := (6 : Fin 13)) (d := (11 : Fin 13))
    (by decide) (by decide) (by decide)
  exact Or.inr (by simpa only [dist_comm, add_comm] using hk.1)

/-- Candidate middle source assertion `h1763` (first_shared_pair). -/
theorem middleSource_h1763 :
    (!((firstRowBit (sourceFirstApexRow T) 6 && firstRowBit (sourceFirstApexRow T) 12 && rowBit (I.sourceRows) 0 0 6 && rowBit (I.sourceRows) 0 0 12))) = true := by
  apply allOne_firstRow_sharedPair_false_of_strict I
    (0 : Fin 3) (0 : Fin 13)
    (6 : Fin 13) (12 : Fin 13)
  have hk := P.strictKalmanson
    (a := (0 : Fin 13)) (b := (4 : Fin 13))
    (c := (6 : Fin 13)) (d := (12 : Fin 13))
    (by decide) (by decide) (by decide)
  exact Or.inr (by simpa only [dist_comm, add_comm] using hk.1)

/-- Candidate middle source assertion `h1764` (first_shared_pair). -/
theorem middleSource_h1764 :
    (!((firstRowBit (sourceFirstApexRow T) 7 && firstRowBit (sourceFirstApexRow T) 9 && rowBit (I.sourceRows) 0 0 7 && rowBit (I.sourceRows) 0 0 9))) = true := by
  apply allOne_firstRow_sharedPair_false_of_strict I
    (0 : Fin 3) (0 : Fin 13)
    (7 : Fin 13) (9 : Fin 13)
  have hk := P.strictKalmanson
    (a := (0 : Fin 13)) (b := (4 : Fin 13))
    (c := (7 : Fin 13)) (d := (9 : Fin 13))
    (by decide) (by decide) (by decide)
  exact Or.inr (by simpa only [dist_comm, add_comm] using hk.1)

/-- Candidate middle source assertion `h1765` (first_shared_pair). -/
theorem middleSource_h1765 :
    (!((firstRowBit (sourceFirstApexRow T) 7 && firstRowBit (sourceFirstApexRow T) 10 && rowBit (I.sourceRows) 0 0 7 && rowBit (I.sourceRows) 0 0 10))) = true := by
  apply allOne_firstRow_sharedPair_false_of_strict I
    (0 : Fin 3) (0 : Fin 13)
    (7 : Fin 13) (10 : Fin 13)
  have hk := P.strictKalmanson
    (a := (0 : Fin 13)) (b := (4 : Fin 13))
    (c := (7 : Fin 13)) (d := (10 : Fin 13))
    (by decide) (by decide) (by decide)
  exact Or.inr (by simpa only [dist_comm, add_comm] using hk.1)

/-- Candidate middle source assertion `h1766` (first_shared_pair). -/
theorem middleSource_h1766 :
    (!((firstRowBit (sourceFirstApexRow T) 7 && firstRowBit (sourceFirstApexRow T) 11 && rowBit (I.sourceRows) 0 0 7 && rowBit (I.sourceRows) 0 0 11))) = true := by
  apply allOne_firstRow_sharedPair_false_of_strict I
    (0 : Fin 3) (0 : Fin 13)
    (7 : Fin 13) (11 : Fin 13)
  have hk := P.strictKalmanson
    (a := (0 : Fin 13)) (b := (4 : Fin 13))
    (c := (7 : Fin 13)) (d := (11 : Fin 13))
    (by decide) (by decide) (by decide)
  exact Or.inr (by simpa only [dist_comm, add_comm] using hk.1)

/-- Candidate middle source assertion `h1767` (first_shared_pair). -/
theorem middleSource_h1767 :
    (!((firstRowBit (sourceFirstApexRow T) 7 && firstRowBit (sourceFirstApexRow T) 12 && rowBit (I.sourceRows) 0 0 7 && rowBit (I.sourceRows) 0 0 12))) = true := by
  apply allOne_firstRow_sharedPair_false_of_strict I
    (0 : Fin 3) (0 : Fin 13)
    (7 : Fin 13) (12 : Fin 13)
  have hk := P.strictKalmanson
    (a := (0 : Fin 13)) (b := (4 : Fin 13))
    (c := (7 : Fin 13)) (d := (12 : Fin 13))
    (by decide) (by decide) (by decide)
  exact Or.inr (by simpa only [dist_comm, add_comm] using hk.1)

/-- Candidate middle source assertion `h1768` (first_shared_pair). -/
theorem middleSource_h1768 :
    (!((firstRowBit (sourceFirstApexRow T) 5 && firstRowBit (sourceFirstApexRow T) 9 && rowBit (I.sourceRows) 0 1 5 && rowBit (I.sourceRows) 0 1 9))) = true := by
  apply allOne_firstRow_sharedPair_false_of_strict I
    (0 : Fin 3) (1 : Fin 13)
    (5 : Fin 13) (9 : Fin 13)
  have hk := P.strictKalmanson
    (a := (1 : Fin 13)) (b := (4 : Fin 13))
    (c := (5 : Fin 13)) (d := (9 : Fin 13))
    (by decide) (by decide) (by decide)
  exact Or.inr (by simpa only [dist_comm, add_comm] using hk.1)

/-- Candidate middle source assertion `h1769` (first_shared_pair). -/
theorem middleSource_h1769 :
    (!((firstRowBit (sourceFirstApexRow T) 5 && firstRowBit (sourceFirstApexRow T) 10 && rowBit (I.sourceRows) 0 1 5 && rowBit (I.sourceRows) 0 1 10))) = true := by
  apply allOne_firstRow_sharedPair_false_of_strict I
    (0 : Fin 3) (1 : Fin 13)
    (5 : Fin 13) (10 : Fin 13)
  have hk := P.strictKalmanson
    (a := (1 : Fin 13)) (b := (4 : Fin 13))
    (c := (5 : Fin 13)) (d := (10 : Fin 13))
    (by decide) (by decide) (by decide)
  exact Or.inr (by simpa only [dist_comm, add_comm] using hk.1)

/-- Candidate middle source assertion `h1770` (first_shared_pair). -/
theorem middleSource_h1770 :
    (!((firstRowBit (sourceFirstApexRow T) 5 && firstRowBit (sourceFirstApexRow T) 12 && rowBit (I.sourceRows) 0 1 5 && rowBit (I.sourceRows) 0 1 12))) = true := by
  apply allOne_firstRow_sharedPair_false_of_strict I
    (0 : Fin 3) (1 : Fin 13)
    (5 : Fin 13) (12 : Fin 13)
  have hk := P.strictKalmanson
    (a := (1 : Fin 13)) (b := (4 : Fin 13))
    (c := (5 : Fin 13)) (d := (12 : Fin 13))
    (by decide) (by decide) (by decide)
  exact Or.inr (by simpa only [dist_comm, add_comm] using hk.1)

/-- Candidate middle source assertion `h1771` (first_shared_pair). -/
theorem middleSource_h1771 :
    (!((firstRowBit (sourceFirstApexRow T) 6 && firstRowBit (sourceFirstApexRow T) 10 && rowBit (I.sourceRows) 0 1 6 && rowBit (I.sourceRows) 0 1 10))) = true := by
  apply allOne_firstRow_sharedPair_false_of_strict I
    (0 : Fin 3) (1 : Fin 13)
    (6 : Fin 13) (10 : Fin 13)
  have hk := P.strictKalmanson
    (a := (1 : Fin 13)) (b := (4 : Fin 13))
    (c := (6 : Fin 13)) (d := (10 : Fin 13))
    (by decide) (by decide) (by decide)
  exact Or.inr (by simpa only [dist_comm, add_comm] using hk.1)

/-- Candidate middle source assertion `h1772` (first_shared_pair). -/
theorem middleSource_h1772 :
    (!((firstRowBit (sourceFirstApexRow T) 6 && firstRowBit (sourceFirstApexRow T) 12 && rowBit (I.sourceRows) 0 1 6 && rowBit (I.sourceRows) 0 1 12))) = true := by
  apply allOne_firstRow_sharedPair_false_of_strict I
    (0 : Fin 3) (1 : Fin 13)
    (6 : Fin 13) (12 : Fin 13)
  have hk := P.strictKalmanson
    (a := (1 : Fin 13)) (b := (4 : Fin 13))
    (c := (6 : Fin 13)) (d := (12 : Fin 13))
    (by decide) (by decide) (by decide)
  exact Or.inr (by simpa only [dist_comm, add_comm] using hk.1)

/-- Candidate middle source assertion `h1773` (first_shared_pair). -/
theorem middleSource_h1773 :
    (!((firstRowBit (sourceFirstApexRow T) 7 && firstRowBit (sourceFirstApexRow T) 12 && rowBit (I.sourceRows) 0 1 7 && rowBit (I.sourceRows) 0 1 12))) = true := by
  apply allOne_firstRow_sharedPair_false_of_strict I
    (0 : Fin 3) (1 : Fin 13)
    (7 : Fin 13) (12 : Fin 13)
  have hk := P.strictKalmanson
    (a := (1 : Fin 13)) (b := (4 : Fin 13))
    (c := (7 : Fin 13)) (d := (12 : Fin 13))
    (by decide) (by decide) (by decide)
  exact Or.inr (by simpa only [dist_comm, add_comm] using hk.1)

/-- Candidate middle source assertion `h1774` (first_shared_pair). -/
theorem middleSource_h1774 :
    (!((firstRowBit (sourceFirstApexRow T) 8 && firstRowBit (sourceFirstApexRow T) 9 && rowBit (I.sourceRows) 0 1 8 && rowBit (I.sourceRows) 0 1 9))) = true := by
  apply allOne_firstRow_sharedPair_false_of_strict I
    (0 : Fin 3) (1 : Fin 13)
    (8 : Fin 13) (9 : Fin 13)
  have hk := P.strictKalmanson
    (a := (1 : Fin 13)) (b := (4 : Fin 13))
    (c := (8 : Fin 13)) (d := (9 : Fin 13))
    (by decide) (by decide) (by decide)
  exact Or.inr (by simpa only [dist_comm, add_comm] using hk.1)

/-- Candidate middle source assertion `h1775` (first_shared_pair). -/
theorem middleSource_h1775 :
    (!((firstRowBit (sourceFirstApexRow T) 8 && firstRowBit (sourceFirstApexRow T) 12 && rowBit (I.sourceRows) 0 1 8 && rowBit (I.sourceRows) 0 1 12))) = true := by
  apply allOne_firstRow_sharedPair_false_of_strict I
    (0 : Fin 3) (1 : Fin 13)
    (8 : Fin 13) (12 : Fin 13)
  have hk := P.strictKalmanson
    (a := (1 : Fin 13)) (b := (4 : Fin 13))
    (c := (8 : Fin 13)) (d := (12 : Fin 13))
    (by decide) (by decide) (by decide)
  exact Or.inr (by simpa only [dist_comm, add_comm] using hk.1)

/-- Candidate middle source assertion `h1776` (first_shared_pair). -/
theorem middleSource_h1776 :
    (!((firstRowBit (sourceFirstApexRow T) 9 && firstRowBit (sourceFirstApexRow T) 10 && rowBit (I.sourceRows) 0 1 9 && rowBit (I.sourceRows) 0 1 10))) = true := by
  apply allOne_firstRow_sharedPair_false_of_strict I
    (0 : Fin 3) (1 : Fin 13)
    (9 : Fin 13) (10 : Fin 13)
  have hk := P.strictKalmanson
    (a := (1 : Fin 13)) (b := (4 : Fin 13))
    (c := (9 : Fin 13)) (d := (10 : Fin 13))
    (by decide) (by decide) (by decide)
  exact Or.inr (by simpa only [dist_comm, add_comm] using hk.1)

/-- Candidate middle source assertion `h1777` (first_shared_pair). -/
theorem middleSource_h1777 :
    (!((firstRowBit (sourceFirstApexRow T) 9 && firstRowBit (sourceFirstApexRow T) 11 && rowBit (I.sourceRows) 0 1 9 && rowBit (I.sourceRows) 0 1 11))) = true := by
  apply allOne_firstRow_sharedPair_false_of_strict I
    (0 : Fin 3) (1 : Fin 13)
    (9 : Fin 13) (11 : Fin 13)
  have hk := P.strictKalmanson
    (a := (1 : Fin 13)) (b := (4 : Fin 13))
    (c := (9 : Fin 13)) (d := (11 : Fin 13))
    (by decide) (by decide) (by decide)
  exact Or.inr (by simpa only [dist_comm, add_comm] using hk.1)

/-- Candidate middle source assertion `h1778` (first_shared_pair). -/
theorem middleSource_h1778 :
    (!((firstRowBit (sourceFirstApexRow T) 9 && firstRowBit (sourceFirstApexRow T) 12 && rowBit (I.sourceRows) 0 1 9 && rowBit (I.sourceRows) 0 1 12))) = true := by
  apply allOne_firstRow_sharedPair_false_of_strict I
    (0 : Fin 3) (1 : Fin 13)
    (9 : Fin 13) (12 : Fin 13)
  have hk := P.strictKalmanson
    (a := (1 : Fin 13)) (b := (4 : Fin 13))
    (c := (9 : Fin 13)) (d := (12 : Fin 13))
    (by decide) (by decide) (by decide)
  exact Or.inr (by simpa only [dist_comm, add_comm] using hk.1)

/-- Candidate middle source assertion `h1779` (first_shared_pair). -/
theorem middleSource_h1779 :
    (!((firstRowBit (sourceFirstApexRow T) 10 && firstRowBit (sourceFirstApexRow T) 11 && rowBit (I.sourceRows) 0 1 10 && rowBit (I.sourceRows) 0 1 11))) = true := by
  apply allOne_firstRow_sharedPair_false_of_strict I
    (0 : Fin 3) (1 : Fin 13)
    (10 : Fin 13) (11 : Fin 13)
  have hk := P.strictKalmanson
    (a := (1 : Fin 13)) (b := (4 : Fin 13))
    (c := (10 : Fin 13)) (d := (11 : Fin 13))
    (by decide) (by decide) (by decide)
  exact Or.inr (by simpa only [dist_comm, add_comm] using hk.1)

/-- Candidate middle source assertion `h1780` (first_shared_pair). -/
theorem middleSource_h1780 :
    (!((firstRowBit (sourceFirstApexRow T) 10 && firstRowBit (sourceFirstApexRow T) 12 && rowBit (I.sourceRows) 0 1 10 && rowBit (I.sourceRows) 0 1 12))) = true := by
  apply allOne_firstRow_sharedPair_false_of_strict I
    (0 : Fin 3) (1 : Fin 13)
    (10 : Fin 13) (12 : Fin 13)
  have hk := P.strictKalmanson
    (a := (1 : Fin 13)) (b := (4 : Fin 13))
    (c := (10 : Fin 13)) (d := (12 : Fin 13))
    (by decide) (by decide) (by decide)
  exact Or.inr (by simpa only [dist_comm, add_comm] using hk.1)

/-- Candidate middle source assertion `h1781` (first_shared_pair). -/
theorem middleSource_h1781 :
    (!((firstRowBit (sourceFirstApexRow T) 11 && firstRowBit (sourceFirstApexRow T) 12 && rowBit (I.sourceRows) 0 1 11 && rowBit (I.sourceRows) 0 1 12))) = true := by
  apply allOne_firstRow_sharedPair_false_of_strict I
    (0 : Fin 3) (1 : Fin 13)
    (11 : Fin 13) (12 : Fin 13)
  have hk := P.strictKalmanson
    (a := (1 : Fin 13)) (b := (4 : Fin 13))
    (c := (11 : Fin 13)) (d := (12 : Fin 13))
    (by decide) (by decide) (by decide)
  exact Or.inr (by simpa only [dist_comm, add_comm] using hk.1)

/-- Candidate middle source assertion `h1782` (first_shared_pair). -/
theorem middleSource_h1782 :
    (!((firstRowBit (sourceFirstApexRow T) 5 && firstRowBit (sourceFirstApexRow T) 9 && rowBit (I.sourceRows) 0 2 5 && rowBit (I.sourceRows) 0 2 9))) = true := by
  apply allOne_firstRow_sharedPair_false_of_strict I
    (0 : Fin 3) (2 : Fin 13)
    (5 : Fin 13) (9 : Fin 13)
  have hk := P.strictKalmanson
    (a := (2 : Fin 13)) (b := (4 : Fin 13))
    (c := (5 : Fin 13)) (d := (9 : Fin 13))
    (by decide) (by decide) (by decide)
  exact Or.inr (by simpa only [dist_comm, add_comm] using hk.1)

/-- Candidate middle source assertion `h1783` (first_shared_pair). -/
theorem middleSource_h1783 :
    (!((firstRowBit (sourceFirstApexRow T) 5 && firstRowBit (sourceFirstApexRow T) 10 && rowBit (I.sourceRows) 0 2 5 && rowBit (I.sourceRows) 0 2 10))) = true := by
  apply allOne_firstRow_sharedPair_false_of_strict I
    (0 : Fin 3) (2 : Fin 13)
    (5 : Fin 13) (10 : Fin 13)
  have hk := P.strictKalmanson
    (a := (2 : Fin 13)) (b := (4 : Fin 13))
    (c := (5 : Fin 13)) (d := (10 : Fin 13))
    (by decide) (by decide) (by decide)
  exact Or.inr (by simpa only [dist_comm, add_comm] using hk.1)

/-- Candidate middle source assertion `h1784` (first_shared_pair). -/
theorem middleSource_h1784 :
    (!((firstRowBit (sourceFirstApexRow T) 5 && firstRowBit (sourceFirstApexRow T) 11 && rowBit (I.sourceRows) 0 2 5 && rowBit (I.sourceRows) 0 2 11))) = true := by
  apply allOne_firstRow_sharedPair_false_of_strict I
    (0 : Fin 3) (2 : Fin 13)
    (5 : Fin 13) (11 : Fin 13)
  have hk := P.strictKalmanson
    (a := (2 : Fin 13)) (b := (4 : Fin 13))
    (c := (5 : Fin 13)) (d := (11 : Fin 13))
    (by decide) (by decide) (by decide)
  exact Or.inr (by simpa only [dist_comm, add_comm] using hk.1)

/-- Candidate middle source assertion `h1785` (first_shared_pair). -/
theorem middleSource_h1785 :
    (!((firstRowBit (sourceFirstApexRow T) 5 && firstRowBit (sourceFirstApexRow T) 12 && rowBit (I.sourceRows) 0 2 5 && rowBit (I.sourceRows) 0 2 12))) = true := by
  apply allOne_firstRow_sharedPair_false_of_strict I
    (0 : Fin 3) (2 : Fin 13)
    (5 : Fin 13) (12 : Fin 13)
  have hk := P.strictKalmanson
    (a := (2 : Fin 13)) (b := (4 : Fin 13))
    (c := (5 : Fin 13)) (d := (12 : Fin 13))
    (by decide) (by decide) (by decide)
  exact Or.inr (by simpa only [dist_comm, add_comm] using hk.1)

/-- Candidate middle source assertion `h1786` (first_shared_pair). -/
theorem middleSource_h1786 :
    (!((firstRowBit (sourceFirstApexRow T) 6 && firstRowBit (sourceFirstApexRow T) 9 && rowBit (I.sourceRows) 0 2 6 && rowBit (I.sourceRows) 0 2 9))) = true := by
  apply allOne_firstRow_sharedPair_false_of_strict I
    (0 : Fin 3) (2 : Fin 13)
    (6 : Fin 13) (9 : Fin 13)
  have hk := P.strictKalmanson
    (a := (2 : Fin 13)) (b := (4 : Fin 13))
    (c := (6 : Fin 13)) (d := (9 : Fin 13))
    (by decide) (by decide) (by decide)
  exact Or.inr (by simpa only [dist_comm, add_comm] using hk.1)

/-- Candidate middle source assertion `h1787` (first_shared_pair). -/
theorem middleSource_h1787 :
    (!((firstRowBit (sourceFirstApexRow T) 6 && firstRowBit (sourceFirstApexRow T) 10 && rowBit (I.sourceRows) 0 2 6 && rowBit (I.sourceRows) 0 2 10))) = true := by
  apply allOne_firstRow_sharedPair_false_of_strict I
    (0 : Fin 3) (2 : Fin 13)
    (6 : Fin 13) (10 : Fin 13)
  have hk := P.strictKalmanson
    (a := (2 : Fin 13)) (b := (4 : Fin 13))
    (c := (6 : Fin 13)) (d := (10 : Fin 13))
    (by decide) (by decide) (by decide)
  exact Or.inr (by simpa only [dist_comm, add_comm] using hk.1)

/-- Candidate middle source assertion `h1788` (first_shared_pair). -/
theorem middleSource_h1788 :
    (!((firstRowBit (sourceFirstApexRow T) 6 && firstRowBit (sourceFirstApexRow T) 11 && rowBit (I.sourceRows) 0 2 6 && rowBit (I.sourceRows) 0 2 11))) = true := by
  apply allOne_firstRow_sharedPair_false_of_strict I
    (0 : Fin 3) (2 : Fin 13)
    (6 : Fin 13) (11 : Fin 13)
  have hk := P.strictKalmanson
    (a := (2 : Fin 13)) (b := (4 : Fin 13))
    (c := (6 : Fin 13)) (d := (11 : Fin 13))
    (by decide) (by decide) (by decide)
  exact Or.inr (by simpa only [dist_comm, add_comm] using hk.1)

/-- Candidate middle source assertion `h1789` (first_shared_pair). -/
theorem middleSource_h1789 :
    (!((firstRowBit (sourceFirstApexRow T) 6 && firstRowBit (sourceFirstApexRow T) 12 && rowBit (I.sourceRows) 0 2 6 && rowBit (I.sourceRows) 0 2 12))) = true := by
  apply allOne_firstRow_sharedPair_false_of_strict I
    (0 : Fin 3) (2 : Fin 13)
    (6 : Fin 13) (12 : Fin 13)
  have hk := P.strictKalmanson
    (a := (2 : Fin 13)) (b := (4 : Fin 13))
    (c := (6 : Fin 13)) (d := (12 : Fin 13))
    (by decide) (by decide) (by decide)
  exact Or.inr (by simpa only [dist_comm, add_comm] using hk.1)

/-- Candidate middle source assertion `h1790` (first_shared_pair). -/
theorem middleSource_h1790 :
    (!((firstRowBit (sourceFirstApexRow T) 7 && firstRowBit (sourceFirstApexRow T) 10 && rowBit (I.sourceRows) 0 2 7 && rowBit (I.sourceRows) 0 2 10))) = true := by
  apply allOne_firstRow_sharedPair_false_of_strict I
    (0 : Fin 3) (2 : Fin 13)
    (7 : Fin 13) (10 : Fin 13)
  have hk := P.strictKalmanson
    (a := (2 : Fin 13)) (b := (4 : Fin 13))
    (c := (7 : Fin 13)) (d := (10 : Fin 13))
    (by decide) (by decide) (by decide)
  exact Or.inr (by simpa only [dist_comm, add_comm] using hk.1)

/-- Candidate middle source assertion `h1791` (first_shared_pair). -/
theorem middleSource_h1791 :
    (!((firstRowBit (sourceFirstApexRow T) 7 && firstRowBit (sourceFirstApexRow T) 11 && rowBit (I.sourceRows) 0 2 7 && rowBit (I.sourceRows) 0 2 11))) = true := by
  apply allOne_firstRow_sharedPair_false_of_strict I
    (0 : Fin 3) (2 : Fin 13)
    (7 : Fin 13) (11 : Fin 13)
  have hk := P.strictKalmanson
    (a := (2 : Fin 13)) (b := (4 : Fin 13))
    (c := (7 : Fin 13)) (d := (11 : Fin 13))
    (by decide) (by decide) (by decide)
  exact Or.inr (by simpa only [dist_comm, add_comm] using hk.1)

end

end ATailExactFiveCard13AllOneSourceIngressScratch
end Problem97
