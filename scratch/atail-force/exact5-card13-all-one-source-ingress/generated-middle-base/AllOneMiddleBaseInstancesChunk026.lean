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

/-- Candidate middle source assertion `h1664` (first_shared_pair). -/
theorem middleSource_h1664 :
    (!((firstRowBit (sourceFirstApexRow T) 2 && firstRowBit (sourceFirstApexRow T) 7 && rowBit (I.sourceRows) 0 5 2 && rowBit (I.sourceRows) 0 5 7))) = true := by
  apply allOne_firstRow_sharedPair_false_of_strict I
    (0 : Fin 3) (5 : Fin 13)
    (2 : Fin 13) (7 : Fin 13)
  have hk := P.strictKalmanson
    (a := (2 : Fin 13)) (b := (4 : Fin 13))
    (c := (5 : Fin 13)) (d := (7 : Fin 13))
    (by decide) (by decide) (by decide)
  exact Or.inr (by simpa only [dist_comm, add_comm] using hk.2)

/-- Candidate middle source assertion `h1665` (first_shared_pair). -/
theorem middleSource_h1665 :
    (!((firstRowBit (sourceFirstApexRow T) 2 && firstRowBit (sourceFirstApexRow T) 8 && rowBit (I.sourceRows) 0 5 2 && rowBit (I.sourceRows) 0 5 8))) = true := by
  apply allOne_firstRow_sharedPair_false_of_strict I
    (0 : Fin 3) (5 : Fin 13)
    (2 : Fin 13) (8 : Fin 13)
  have hk := P.strictKalmanson
    (a := (2 : Fin 13)) (b := (4 : Fin 13))
    (c := (5 : Fin 13)) (d := (8 : Fin 13))
    (by decide) (by decide) (by decide)
  exact Or.inr (by simpa only [dist_comm, add_comm] using hk.2)

/-- Candidate middle source assertion `h1666` (first_shared_pair). -/
theorem middleSource_h1666 :
    (!((firstRowBit (sourceFirstApexRow T) 3 && firstRowBit (sourceFirstApexRow T) 6 && rowBit (I.sourceRows) 0 5 3 && rowBit (I.sourceRows) 0 5 6))) = true := by
  apply allOne_firstRow_sharedPair_false_of_strict I
    (0 : Fin 3) (5 : Fin 13)
    (3 : Fin 13) (6 : Fin 13)
  have hk := P.strictKalmanson
    (a := (3 : Fin 13)) (b := (4 : Fin 13))
    (c := (5 : Fin 13)) (d := (6 : Fin 13))
    (by decide) (by decide) (by decide)
  exact Or.inr (by simpa only [dist_comm, add_comm] using hk.2)

/-- Candidate middle source assertion `h1667` (first_shared_pair). -/
theorem middleSource_h1667 :
    (!((firstRowBit (sourceFirstApexRow T) 3 && firstRowBit (sourceFirstApexRow T) 7 && rowBit (I.sourceRows) 0 5 3 && rowBit (I.sourceRows) 0 5 7))) = true := by
  apply allOne_firstRow_sharedPair_false_of_strict I
    (0 : Fin 3) (5 : Fin 13)
    (3 : Fin 13) (7 : Fin 13)
  have hk := P.strictKalmanson
    (a := (3 : Fin 13)) (b := (4 : Fin 13))
    (c := (5 : Fin 13)) (d := (7 : Fin 13))
    (by decide) (by decide) (by decide)
  exact Or.inr (by simpa only [dist_comm, add_comm] using hk.2)

/-- Candidate middle source assertion `h1668` (first_shared_pair). -/
theorem middleSource_h1668 :
    (!((firstRowBit (sourceFirstApexRow T) 3 && firstRowBit (sourceFirstApexRow T) 8 && rowBit (I.sourceRows) 0 5 3 && rowBit (I.sourceRows) 0 5 8))) = true := by
  apply allOne_firstRow_sharedPair_false_of_strict I
    (0 : Fin 3) (5 : Fin 13)
    (3 : Fin 13) (8 : Fin 13)
  have hk := P.strictKalmanson
    (a := (3 : Fin 13)) (b := (4 : Fin 13))
    (c := (5 : Fin 13)) (d := (8 : Fin 13))
    (by decide) (by decide) (by decide)
  exact Or.inr (by simpa only [dist_comm, add_comm] using hk.2)

/-- Candidate middle source assertion `h1669` (first_shared_pair). -/
theorem middleSource_h1669 :
    (!((firstRowBit (sourceFirstApexRow T) 6 && firstRowBit (sourceFirstApexRow T) 9 && rowBit (I.sourceRows) 0 5 6 && rowBit (I.sourceRows) 0 5 9))) = true := by
  apply allOne_firstRow_sharedPair_false_of_strict I
    (0 : Fin 3) (5 : Fin 13)
    (6 : Fin 13) (9 : Fin 13)
  have hk := P.strictKalmanson
    (a := (4 : Fin 13)) (b := (5 : Fin 13))
    (c := (6 : Fin 13)) (d := (9 : Fin 13))
    (by decide) (by decide) (by decide)
  exact Or.inl (by simpa only [dist_comm, add_comm] using hk.1)

/-- Candidate middle source assertion `h1670` (first_shared_pair). -/
theorem middleSource_h1670 :
    (!((firstRowBit (sourceFirstApexRow T) 6 && firstRowBit (sourceFirstApexRow T) 10 && rowBit (I.sourceRows) 0 5 6 && rowBit (I.sourceRows) 0 5 10))) = true := by
  apply allOne_firstRow_sharedPair_false_of_strict I
    (0 : Fin 3) (5 : Fin 13)
    (6 : Fin 13) (10 : Fin 13)
  have hk := P.strictKalmanson
    (a := (4 : Fin 13)) (b := (5 : Fin 13))
    (c := (6 : Fin 13)) (d := (10 : Fin 13))
    (by decide) (by decide) (by decide)
  exact Or.inl (by simpa only [dist_comm, add_comm] using hk.1)

/-- Candidate middle source assertion `h1671` (first_shared_pair). -/
theorem middleSource_h1671 :
    (!((firstRowBit (sourceFirstApexRow T) 6 && firstRowBit (sourceFirstApexRow T) 11 && rowBit (I.sourceRows) 0 5 6 && rowBit (I.sourceRows) 0 5 11))) = true := by
  apply allOne_firstRow_sharedPair_false_of_strict I
    (0 : Fin 3) (5 : Fin 13)
    (6 : Fin 13) (11 : Fin 13)
  have hk := P.strictKalmanson
    (a := (4 : Fin 13)) (b := (5 : Fin 13))
    (c := (6 : Fin 13)) (d := (11 : Fin 13))
    (by decide) (by decide) (by decide)
  exact Or.inl (by simpa only [dist_comm, add_comm] using hk.1)

/-- Candidate middle source assertion `h1672` (first_shared_pair). -/
theorem middleSource_h1672 :
    (!((firstRowBit (sourceFirstApexRow T) 6 && firstRowBit (sourceFirstApexRow T) 12 && rowBit (I.sourceRows) 0 5 6 && rowBit (I.sourceRows) 0 5 12))) = true := by
  apply allOne_firstRow_sharedPair_false_of_strict I
    (0 : Fin 3) (5 : Fin 13)
    (6 : Fin 13) (12 : Fin 13)
  have hk := P.strictKalmanson
    (a := (4 : Fin 13)) (b := (5 : Fin 13))
    (c := (6 : Fin 13)) (d := (12 : Fin 13))
    (by decide) (by decide) (by decide)
  exact Or.inl (by simpa only [dist_comm, add_comm] using hk.1)

/-- Candidate middle source assertion `h1673` (first_shared_pair). -/
theorem middleSource_h1673 :
    (!((firstRowBit (sourceFirstApexRow T) 7 && firstRowBit (sourceFirstApexRow T) 9 && rowBit (I.sourceRows) 0 5 7 && rowBit (I.sourceRows) 0 5 9))) = true := by
  apply allOne_firstRow_sharedPair_false_of_strict I
    (0 : Fin 3) (5 : Fin 13)
    (7 : Fin 13) (9 : Fin 13)
  have hk := P.strictKalmanson
    (a := (4 : Fin 13)) (b := (5 : Fin 13))
    (c := (7 : Fin 13)) (d := (9 : Fin 13))
    (by decide) (by decide) (by decide)
  exact Or.inl (by simpa only [dist_comm, add_comm] using hk.1)

/-- Candidate middle source assertion `h1674` (first_shared_pair). -/
theorem middleSource_h1674 :
    (!((firstRowBit (sourceFirstApexRow T) 7 && firstRowBit (sourceFirstApexRow T) 12 && rowBit (I.sourceRows) 0 5 7 && rowBit (I.sourceRows) 0 5 12))) = true := by
  apply allOne_firstRow_sharedPair_false_of_strict I
    (0 : Fin 3) (5 : Fin 13)
    (7 : Fin 13) (12 : Fin 13)
  have hk := P.strictKalmanson
    (a := (4 : Fin 13)) (b := (5 : Fin 13))
    (c := (7 : Fin 13)) (d := (12 : Fin 13))
    (by decide) (by decide) (by decide)
  exact Or.inl (by simpa only [dist_comm, add_comm] using hk.1)

/-- Candidate middle source assertion `h1675` (first_shared_pair). -/
theorem middleSource_h1675 :
    (!((firstRowBit (sourceFirstApexRow T) 8 && firstRowBit (sourceFirstApexRow T) 9 && rowBit (I.sourceRows) 0 5 8 && rowBit (I.sourceRows) 0 5 9))) = true := by
  apply allOne_firstRow_sharedPair_false_of_strict I
    (0 : Fin 3) (5 : Fin 13)
    (8 : Fin 13) (9 : Fin 13)
  have hk := P.strictKalmanson
    (a := (4 : Fin 13)) (b := (5 : Fin 13))
    (c := (8 : Fin 13)) (d := (9 : Fin 13))
    (by decide) (by decide) (by decide)
  exact Or.inl (by simpa only [dist_comm, add_comm] using hk.1)

/-- Candidate middle source assertion `h1676` (first_shared_pair). -/
theorem middleSource_h1676 :
    (!((firstRowBit (sourceFirstApexRow T) 8 && firstRowBit (sourceFirstApexRow T) 10 && rowBit (I.sourceRows) 0 5 8 && rowBit (I.sourceRows) 0 5 10))) = true := by
  apply allOne_firstRow_sharedPair_false_of_strict I
    (0 : Fin 3) (5 : Fin 13)
    (8 : Fin 13) (10 : Fin 13)
  have hk := P.strictKalmanson
    (a := (4 : Fin 13)) (b := (5 : Fin 13))
    (c := (8 : Fin 13)) (d := (10 : Fin 13))
    (by decide) (by decide) (by decide)
  exact Or.inl (by simpa only [dist_comm, add_comm] using hk.1)

/-- Candidate middle source assertion `h1677` (first_shared_pair). -/
theorem middleSource_h1677 :
    (!((firstRowBit (sourceFirstApexRow T) 8 && firstRowBit (sourceFirstApexRow T) 11 && rowBit (I.sourceRows) 0 5 8 && rowBit (I.sourceRows) 0 5 11))) = true := by
  apply allOne_firstRow_sharedPair_false_of_strict I
    (0 : Fin 3) (5 : Fin 13)
    (8 : Fin 13) (11 : Fin 13)
  have hk := P.strictKalmanson
    (a := (4 : Fin 13)) (b := (5 : Fin 13))
    (c := (8 : Fin 13)) (d := (11 : Fin 13))
    (by decide) (by decide) (by decide)
  exact Or.inl (by simpa only [dist_comm, add_comm] using hk.1)

/-- Candidate middle source assertion `h1678` (first_shared_pair). -/
theorem middleSource_h1678 :
    (!((firstRowBit (sourceFirstApexRow T) 8 && firstRowBit (sourceFirstApexRow T) 12 && rowBit (I.sourceRows) 0 5 8 && rowBit (I.sourceRows) 0 5 12))) = true := by
  apply allOne_firstRow_sharedPair_false_of_strict I
    (0 : Fin 3) (5 : Fin 13)
    (8 : Fin 13) (12 : Fin 13)
  have hk := P.strictKalmanson
    (a := (4 : Fin 13)) (b := (5 : Fin 13))
    (c := (8 : Fin 13)) (d := (12 : Fin 13))
    (by decide) (by decide) (by decide)
  exact Or.inl (by simpa only [dist_comm, add_comm] using hk.1)

/-- Candidate middle source assertion `h1679` (first_shared_pair). -/
theorem middleSource_h1679 :
    (!((firstRowBit (sourceFirstApexRow T) 10 && firstRowBit (sourceFirstApexRow T) 11 && rowBit (I.sourceRows) 0 5 10 && rowBit (I.sourceRows) 0 5 11))) = true := by
  apply allOne_firstRow_sharedPair_false_of_strict I
    (0 : Fin 3) (5 : Fin 13)
    (10 : Fin 13) (11 : Fin 13)
  have hk := P.strictKalmanson
    (a := (4 : Fin 13)) (b := (5 : Fin 13))
    (c := (10 : Fin 13)) (d := (11 : Fin 13))
    (by decide) (by decide) (by decide)
  exact Or.inl (by simpa only [dist_comm, add_comm] using hk.1)

/-- Candidate middle source assertion `h1680` (first_shared_pair). -/
theorem middleSource_h1680 :
    (!((firstRowBit (sourceFirstApexRow T) 10 && firstRowBit (sourceFirstApexRow T) 12 && rowBit (I.sourceRows) 0 5 10 && rowBit (I.sourceRows) 0 5 12))) = true := by
  apply allOne_firstRow_sharedPair_false_of_strict I
    (0 : Fin 3) (5 : Fin 13)
    (10 : Fin 13) (12 : Fin 13)
  have hk := P.strictKalmanson
    (a := (4 : Fin 13)) (b := (5 : Fin 13))
    (c := (10 : Fin 13)) (d := (12 : Fin 13))
    (by decide) (by decide) (by decide)
  exact Or.inl (by simpa only [dist_comm, add_comm] using hk.1)

/-- Candidate middle source assertion `h1681` (first_shared_pair). -/
theorem middleSource_h1681 :
    (!((firstRowBit (sourceFirstApexRow T) 0 && firstRowBit (sourceFirstApexRow T) 7 && rowBit (I.sourceRows) 0 6 0 && rowBit (I.sourceRows) 0 6 7))) = true := by
  apply allOne_firstRow_sharedPair_false_of_strict I
    (0 : Fin 3) (6 : Fin 13)
    (0 : Fin 13) (7 : Fin 13)
  have hk := P.strictKalmanson
    (a := (0 : Fin 13)) (b := (4 : Fin 13))
    (c := (6 : Fin 13)) (d := (7 : Fin 13))
    (by decide) (by decide) (by decide)
  exact Or.inr (by simpa only [dist_comm, add_comm] using hk.2)

/-- Candidate middle source assertion `h1682` (first_shared_pair). -/
theorem middleSource_h1682 :
    (!((firstRowBit (sourceFirstApexRow T) 0 && firstRowBit (sourceFirstApexRow T) 8 && rowBit (I.sourceRows) 0 6 0 && rowBit (I.sourceRows) 0 6 8))) = true := by
  apply allOne_firstRow_sharedPair_false_of_strict I
    (0 : Fin 3) (6 : Fin 13)
    (0 : Fin 13) (8 : Fin 13)
  have hk := P.strictKalmanson
    (a := (0 : Fin 13)) (b := (4 : Fin 13))
    (c := (6 : Fin 13)) (d := (8 : Fin 13))
    (by decide) (by decide) (by decide)
  exact Or.inr (by simpa only [dist_comm, add_comm] using hk.2)

/-- Candidate middle source assertion `h1683` (first_shared_pair). -/
theorem middleSource_h1683 :
    (!((firstRowBit (sourceFirstApexRow T) 0 && firstRowBit (sourceFirstApexRow T) 9 && rowBit (I.sourceRows) 0 6 0 && rowBit (I.sourceRows) 0 6 9))) = true := by
  apply allOne_firstRow_sharedPair_false_of_strict I
    (0 : Fin 3) (6 : Fin 13)
    (0 : Fin 13) (9 : Fin 13)
  have hk := P.strictKalmanson
    (a := (0 : Fin 13)) (b := (4 : Fin 13))
    (c := (6 : Fin 13)) (d := (9 : Fin 13))
    (by decide) (by decide) (by decide)
  exact Or.inr (by simpa only [dist_comm, add_comm] using hk.2)

/-- Candidate middle source assertion `h1684` (first_shared_pair). -/
theorem middleSource_h1684 :
    (!((firstRowBit (sourceFirstApexRow T) 0 && firstRowBit (sourceFirstApexRow T) 10 && rowBit (I.sourceRows) 0 6 0 && rowBit (I.sourceRows) 0 6 10))) = true := by
  apply allOne_firstRow_sharedPair_false_of_strict I
    (0 : Fin 3) (6 : Fin 13)
    (0 : Fin 13) (10 : Fin 13)
  have hk := P.strictKalmanson
    (a := (0 : Fin 13)) (b := (4 : Fin 13))
    (c := (6 : Fin 13)) (d := (10 : Fin 13))
    (by decide) (by decide) (by decide)
  exact Or.inr (by simpa only [dist_comm, add_comm] using hk.2)

/-- Candidate middle source assertion `h1685` (first_shared_pair). -/
theorem middleSource_h1685 :
    (!((firstRowBit (sourceFirstApexRow T) 1 && firstRowBit (sourceFirstApexRow T) 7 && rowBit (I.sourceRows) 0 6 1 && rowBit (I.sourceRows) 0 6 7))) = true := by
  apply allOne_firstRow_sharedPair_false_of_strict I
    (0 : Fin 3) (6 : Fin 13)
    (1 : Fin 13) (7 : Fin 13)
  have hk := P.strictKalmanson
    (a := (1 : Fin 13)) (b := (4 : Fin 13))
    (c := (6 : Fin 13)) (d := (7 : Fin 13))
    (by decide) (by decide) (by decide)
  exact Or.inr (by simpa only [dist_comm, add_comm] using hk.2)

/-- Candidate middle source assertion `h1686` (first_shared_pair). -/
theorem middleSource_h1686 :
    (!((firstRowBit (sourceFirstApexRow T) 1 && firstRowBit (sourceFirstApexRow T) 8 && rowBit (I.sourceRows) 0 6 1 && rowBit (I.sourceRows) 0 6 8))) = true := by
  apply allOne_firstRow_sharedPair_false_of_strict I
    (0 : Fin 3) (6 : Fin 13)
    (1 : Fin 13) (8 : Fin 13)
  have hk := P.strictKalmanson
    (a := (1 : Fin 13)) (b := (4 : Fin 13))
    (c := (6 : Fin 13)) (d := (8 : Fin 13))
    (by decide) (by decide) (by decide)
  exact Or.inr (by simpa only [dist_comm, add_comm] using hk.2)

/-- Candidate middle source assertion `h1687` (first_shared_pair). -/
theorem middleSource_h1687 :
    (!((firstRowBit (sourceFirstApexRow T) 2 && firstRowBit (sourceFirstApexRow T) 7 && rowBit (I.sourceRows) 0 6 2 && rowBit (I.sourceRows) 0 6 7))) = true := by
  apply allOne_firstRow_sharedPair_false_of_strict I
    (0 : Fin 3) (6 : Fin 13)
    (2 : Fin 13) (7 : Fin 13)
  have hk := P.strictKalmanson
    (a := (2 : Fin 13)) (b := (4 : Fin 13))
    (c := (6 : Fin 13)) (d := (7 : Fin 13))
    (by decide) (by decide) (by decide)
  exact Or.inr (by simpa only [dist_comm, add_comm] using hk.2)

/-- Candidate middle source assertion `h1688` (first_shared_pair). -/
theorem middleSource_h1688 :
    (!((firstRowBit (sourceFirstApexRow T) 2 && firstRowBit (sourceFirstApexRow T) 8 && rowBit (I.sourceRows) 0 6 2 && rowBit (I.sourceRows) 0 6 8))) = true := by
  apply allOne_firstRow_sharedPair_false_of_strict I
    (0 : Fin 3) (6 : Fin 13)
    (2 : Fin 13) (8 : Fin 13)
  have hk := P.strictKalmanson
    (a := (2 : Fin 13)) (b := (4 : Fin 13))
    (c := (6 : Fin 13)) (d := (8 : Fin 13))
    (by decide) (by decide) (by decide)
  exact Or.inr (by simpa only [dist_comm, add_comm] using hk.2)

/-- Candidate middle source assertion `h1689` (first_shared_pair). -/
theorem middleSource_h1689 :
    (!((firstRowBit (sourceFirstApexRow T) 3 && firstRowBit (sourceFirstApexRow T) 8 && rowBit (I.sourceRows) 0 6 3 && rowBit (I.sourceRows) 0 6 8))) = true := by
  apply allOne_firstRow_sharedPair_false_of_strict I
    (0 : Fin 3) (6 : Fin 13)
    (3 : Fin 13) (8 : Fin 13)
  have hk := P.strictKalmanson
    (a := (3 : Fin 13)) (b := (4 : Fin 13))
    (c := (6 : Fin 13)) (d := (8 : Fin 13))
    (by decide) (by decide) (by decide)
  exact Or.inr (by simpa only [dist_comm, add_comm] using hk.2)

/-- Candidate middle source assertion `h1690` (first_shared_pair). -/
theorem middleSource_h1690 :
    (!((firstRowBit (sourceFirstApexRow T) 7 && firstRowBit (sourceFirstApexRow T) 9 && rowBit (I.sourceRows) 0 6 7 && rowBit (I.sourceRows) 0 6 9))) = true := by
  apply allOne_firstRow_sharedPair_false_of_strict I
    (0 : Fin 3) (6 : Fin 13)
    (7 : Fin 13) (9 : Fin 13)
  have hk := P.strictKalmanson
    (a := (4 : Fin 13)) (b := (6 : Fin 13))
    (c := (7 : Fin 13)) (d := (9 : Fin 13))
    (by decide) (by decide) (by decide)
  exact Or.inl (by simpa only [dist_comm, add_comm] using hk.1)

/-- Candidate middle source assertion `h1691` (first_shared_pair). -/
theorem middleSource_h1691 :
    (!((firstRowBit (sourceFirstApexRow T) 7 && firstRowBit (sourceFirstApexRow T) 10 && rowBit (I.sourceRows) 0 6 7 && rowBit (I.sourceRows) 0 6 10))) = true := by
  apply allOne_firstRow_sharedPair_false_of_strict I
    (0 : Fin 3) (6 : Fin 13)
    (7 : Fin 13) (10 : Fin 13)
  have hk := P.strictKalmanson
    (a := (4 : Fin 13)) (b := (6 : Fin 13))
    (c := (7 : Fin 13)) (d := (10 : Fin 13))
    (by decide) (by decide) (by decide)
  exact Or.inl (by simpa only [dist_comm, add_comm] using hk.1)

/-- Candidate middle source assertion `h1692` (first_shared_pair). -/
theorem middleSource_h1692 :
    (!((firstRowBit (sourceFirstApexRow T) 7 && firstRowBit (sourceFirstApexRow T) 11 && rowBit (I.sourceRows) 0 6 7 && rowBit (I.sourceRows) 0 6 11))) = true := by
  apply allOne_firstRow_sharedPair_false_of_strict I
    (0 : Fin 3) (6 : Fin 13)
    (7 : Fin 13) (11 : Fin 13)
  have hk := P.strictKalmanson
    (a := (4 : Fin 13)) (b := (6 : Fin 13))
    (c := (7 : Fin 13)) (d := (11 : Fin 13))
    (by decide) (by decide) (by decide)
  exact Or.inl (by simpa only [dist_comm, add_comm] using hk.1)

/-- Candidate middle source assertion `h1693` (first_shared_pair). -/
theorem middleSource_h1693 :
    (!((firstRowBit (sourceFirstApexRow T) 7 && firstRowBit (sourceFirstApexRow T) 12 && rowBit (I.sourceRows) 0 6 7 && rowBit (I.sourceRows) 0 6 12))) = true := by
  apply allOne_firstRow_sharedPair_false_of_strict I
    (0 : Fin 3) (6 : Fin 13)
    (7 : Fin 13) (12 : Fin 13)
  have hk := P.strictKalmanson
    (a := (4 : Fin 13)) (b := (6 : Fin 13))
    (c := (7 : Fin 13)) (d := (12 : Fin 13))
    (by decide) (by decide) (by decide)
  exact Or.inl (by simpa only [dist_comm, add_comm] using hk.1)

/-- Candidate middle source assertion `h1694` (first_shared_pair). -/
theorem middleSource_h1694 :
    (!((firstRowBit (sourceFirstApexRow T) 8 && firstRowBit (sourceFirstApexRow T) 9 && rowBit (I.sourceRows) 0 6 8 && rowBit (I.sourceRows) 0 6 9))) = true := by
  apply allOne_firstRow_sharedPair_false_of_strict I
    (0 : Fin 3) (6 : Fin 13)
    (8 : Fin 13) (9 : Fin 13)
  have hk := P.strictKalmanson
    (a := (4 : Fin 13)) (b := (6 : Fin 13))
    (c := (8 : Fin 13)) (d := (9 : Fin 13))
    (by decide) (by decide) (by decide)
  exact Or.inl (by simpa only [dist_comm, add_comm] using hk.1)

/-- Candidate middle source assertion `h1695` (first_shared_pair). -/
theorem middleSource_h1695 :
    (!((firstRowBit (sourceFirstApexRow T) 8 && firstRowBit (sourceFirstApexRow T) 10 && rowBit (I.sourceRows) 0 6 8 && rowBit (I.sourceRows) 0 6 10))) = true := by
  apply allOne_firstRow_sharedPair_false_of_strict I
    (0 : Fin 3) (6 : Fin 13)
    (8 : Fin 13) (10 : Fin 13)
  have hk := P.strictKalmanson
    (a := (4 : Fin 13)) (b := (6 : Fin 13))
    (c := (8 : Fin 13)) (d := (10 : Fin 13))
    (by decide) (by decide) (by decide)
  exact Or.inl (by simpa only [dist_comm, add_comm] using hk.1)

/-- Candidate middle source assertion `h1696` (first_shared_pair). -/
theorem middleSource_h1696 :
    (!((firstRowBit (sourceFirstApexRow T) 8 && firstRowBit (sourceFirstApexRow T) 11 && rowBit (I.sourceRows) 0 6 8 && rowBit (I.sourceRows) 0 6 11))) = true := by
  apply allOne_firstRow_sharedPair_false_of_strict I
    (0 : Fin 3) (6 : Fin 13)
    (8 : Fin 13) (11 : Fin 13)
  have hk := P.strictKalmanson
    (a := (4 : Fin 13)) (b := (6 : Fin 13))
    (c := (8 : Fin 13)) (d := (11 : Fin 13))
    (by decide) (by decide) (by decide)
  exact Or.inl (by simpa only [dist_comm, add_comm] using hk.1)

/-- Candidate middle source assertion `h1697` (first_shared_pair). -/
theorem middleSource_h1697 :
    (!((firstRowBit (sourceFirstApexRow T) 8 && firstRowBit (sourceFirstApexRow T) 12 && rowBit (I.sourceRows) 0 6 8 && rowBit (I.sourceRows) 0 6 12))) = true := by
  apply allOne_firstRow_sharedPair_false_of_strict I
    (0 : Fin 3) (6 : Fin 13)
    (8 : Fin 13) (12 : Fin 13)
  have hk := P.strictKalmanson
    (a := (4 : Fin 13)) (b := (6 : Fin 13))
    (c := (8 : Fin 13)) (d := (12 : Fin 13))
    (by decide) (by decide) (by decide)
  exact Or.inl (by simpa only [dist_comm, add_comm] using hk.1)

/-- Candidate middle source assertion `h1698` (first_shared_pair). -/
theorem middleSource_h1698 :
    (!((firstRowBit (sourceFirstApexRow T) 9 && firstRowBit (sourceFirstApexRow T) 12 && rowBit (I.sourceRows) 0 6 9 && rowBit (I.sourceRows) 0 6 12))) = true := by
  apply allOne_firstRow_sharedPair_false_of_strict I
    (0 : Fin 3) (6 : Fin 13)
    (9 : Fin 13) (12 : Fin 13)
  have hk := P.strictKalmanson
    (a := (4 : Fin 13)) (b := (6 : Fin 13))
    (c := (9 : Fin 13)) (d := (12 : Fin 13))
    (by decide) (by decide) (by decide)
  exact Or.inl (by simpa only [dist_comm, add_comm] using hk.1)

/-- Candidate middle source assertion `h1699` (first_shared_pair). -/
theorem middleSource_h1699 :
    (!((firstRowBit (sourceFirstApexRow T) 10 && firstRowBit (sourceFirstApexRow T) 12 && rowBit (I.sourceRows) 0 6 10 && rowBit (I.sourceRows) 0 6 12))) = true := by
  apply allOne_firstRow_sharedPair_false_of_strict I
    (0 : Fin 3) (6 : Fin 13)
    (10 : Fin 13) (12 : Fin 13)
  have hk := P.strictKalmanson
    (a := (4 : Fin 13)) (b := (6 : Fin 13))
    (c := (10 : Fin 13)) (d := (12 : Fin 13))
    (by decide) (by decide) (by decide)
  exact Or.inl (by simpa only [dist_comm, add_comm] using hk.1)

/-- Candidate middle source assertion `h1700` (first_shared_pair). -/
theorem middleSource_h1700 :
    (!((firstRowBit (sourceFirstApexRow T) 0 && firstRowBit (sourceFirstApexRow T) 8 && rowBit (I.sourceRows) 0 7 0 && rowBit (I.sourceRows) 0 7 8))) = true := by
  apply allOne_firstRow_sharedPair_false_of_strict I
    (0 : Fin 3) (7 : Fin 13)
    (0 : Fin 13) (8 : Fin 13)
  have hk := P.strictKalmanson
    (a := (0 : Fin 13)) (b := (4 : Fin 13))
    (c := (7 : Fin 13)) (d := (8 : Fin 13))
    (by decide) (by decide) (by decide)
  exact Or.inr (by simpa only [dist_comm, add_comm] using hk.2)

/-- Candidate middle source assertion `h1701` (first_shared_pair). -/
theorem middleSource_h1701 :
    (!((firstRowBit (sourceFirstApexRow T) 8 && firstRowBit (sourceFirstApexRow T) 10 && rowBit (I.sourceRows) 0 7 8 && rowBit (I.sourceRows) 0 7 10))) = true := by
  apply allOne_firstRow_sharedPair_false_of_strict I
    (0 : Fin 3) (7 : Fin 13)
    (8 : Fin 13) (10 : Fin 13)
  have hk := P.strictKalmanson
    (a := (4 : Fin 13)) (b := (7 : Fin 13))
    (c := (8 : Fin 13)) (d := (10 : Fin 13))
    (by decide) (by decide) (by decide)
  exact Or.inl (by simpa only [dist_comm, add_comm] using hk.1)

/-- Candidate middle source assertion `h1702` (first_shared_pair). -/
theorem middleSource_h1702 :
    (!((firstRowBit (sourceFirstApexRow T) 8 && firstRowBit (sourceFirstApexRow T) 12 && rowBit (I.sourceRows) 0 7 8 && rowBit (I.sourceRows) 0 7 12))) = true := by
  apply allOne_firstRow_sharedPair_false_of_strict I
    (0 : Fin 3) (7 : Fin 13)
    (8 : Fin 13) (12 : Fin 13)
  have hk := P.strictKalmanson
    (a := (4 : Fin 13)) (b := (7 : Fin 13))
    (c := (8 : Fin 13)) (d := (12 : Fin 13))
    (by decide) (by decide) (by decide)
  exact Or.inl (by simpa only [dist_comm, add_comm] using hk.1)

/-- Candidate middle source assertion `h1703` (first_shared_pair). -/
theorem middleSource_h1703 :
    (!((firstRowBit (sourceFirstApexRow T) 0 && firstRowBit (sourceFirstApexRow T) 11 && rowBit (I.sourceRows) 0 10 0 && rowBit (I.sourceRows) 0 10 11))) = true := by
  apply allOne_firstRow_sharedPair_false_of_strict I
    (0 : Fin 3) (10 : Fin 13)
    (0 : Fin 13) (11 : Fin 13)
  have hk := P.strictKalmanson
    (a := (0 : Fin 13)) (b := (4 : Fin 13))
    (c := (10 : Fin 13)) (d := (11 : Fin 13))
    (by decide) (by decide) (by decide)
  exact Or.inr (by simpa only [dist_comm, add_comm] using hk.2)

/-- Candidate middle source assertion `h1704` (first_shared_pair). -/
theorem middleSource_h1704 :
    (!((firstRowBit (sourceFirstApexRow T) 0 && firstRowBit (sourceFirstApexRow T) 12 && rowBit (I.sourceRows) 0 10 0 && rowBit (I.sourceRows) 0 10 12))) = true := by
  apply allOne_firstRow_sharedPair_false_of_strict I
    (0 : Fin 3) (10 : Fin 13)
    (0 : Fin 13) (12 : Fin 13)
  have hk := P.strictKalmanson
    (a := (0 : Fin 13)) (b := (4 : Fin 13))
    (c := (10 : Fin 13)) (d := (12 : Fin 13))
    (by decide) (by decide) (by decide)
  exact Or.inr (by simpa only [dist_comm, add_comm] using hk.2)

/-- Candidate middle source assertion `h1705` (first_shared_pair). -/
theorem middleSource_h1705 :
    (!((firstRowBit (sourceFirstApexRow T) 1 && firstRowBit (sourceFirstApexRow T) 11 && rowBit (I.sourceRows) 0 10 1 && rowBit (I.sourceRows) 0 10 11))) = true := by
  apply allOne_firstRow_sharedPair_false_of_strict I
    (0 : Fin 3) (10 : Fin 13)
    (1 : Fin 13) (11 : Fin 13)
  have hk := P.strictKalmanson
    (a := (1 : Fin 13)) (b := (4 : Fin 13))
    (c := (10 : Fin 13)) (d := (11 : Fin 13))
    (by decide) (by decide) (by decide)
  exact Or.inr (by simpa only [dist_comm, add_comm] using hk.2)

/-- Candidate middle source assertion `h1706` (first_shared_pair). -/
theorem middleSource_h1706 :
    (!((firstRowBit (sourceFirstApexRow T) 2 && firstRowBit (sourceFirstApexRow T) 11 && rowBit (I.sourceRows) 0 10 2 && rowBit (I.sourceRows) 0 10 11))) = true := by
  apply allOne_firstRow_sharedPair_false_of_strict I
    (0 : Fin 3) (10 : Fin 13)
    (2 : Fin 13) (11 : Fin 13)
  have hk := P.strictKalmanson
    (a := (2 : Fin 13)) (b := (4 : Fin 13))
    (c := (10 : Fin 13)) (d := (11 : Fin 13))
    (by decide) (by decide) (by decide)
  exact Or.inr (by simpa only [dist_comm, add_comm] using hk.2)

/-- Candidate middle source assertion `h1707` (first_shared_pair). -/
theorem middleSource_h1707 :
    (!((firstRowBit (sourceFirstApexRow T) 2 && firstRowBit (sourceFirstApexRow T) 12 && rowBit (I.sourceRows) 0 10 2 && rowBit (I.sourceRows) 0 10 12))) = true := by
  apply allOne_firstRow_sharedPair_false_of_strict I
    (0 : Fin 3) (10 : Fin 13)
    (2 : Fin 13) (12 : Fin 13)
  have hk := P.strictKalmanson
    (a := (2 : Fin 13)) (b := (4 : Fin 13))
    (c := (10 : Fin 13)) (d := (12 : Fin 13))
    (by decide) (by decide) (by decide)
  exact Or.inr (by simpa only [dist_comm, add_comm] using hk.2)

/-- Candidate middle source assertion `h1708` (first_shared_pair). -/
theorem middleSource_h1708 :
    (!((firstRowBit (sourceFirstApexRow T) 3 && firstRowBit (sourceFirstApexRow T) 12 && rowBit (I.sourceRows) 0 10 3 && rowBit (I.sourceRows) 0 10 12))) = true := by
  apply allOne_firstRow_sharedPair_false_of_strict I
    (0 : Fin 3) (10 : Fin 13)
    (3 : Fin 13) (12 : Fin 13)
  have hk := P.strictKalmanson
    (a := (3 : Fin 13)) (b := (4 : Fin 13))
    (c := (10 : Fin 13)) (d := (12 : Fin 13))
    (by decide) (by decide) (by decide)
  exact Or.inr (by simpa only [dist_comm, add_comm] using hk.2)

/-- Candidate middle source assertion `h1709` (first_shared_pair). -/
theorem middleSource_h1709 :
    (!((firstRowBit (sourceFirstApexRow T) 5 && firstRowBit (sourceFirstApexRow T) 9 && rowBit (I.sourceRows) 0 10 5 && rowBit (I.sourceRows) 0 10 9))) = true := by
  apply allOne_firstRow_sharedPair_false_of_strict I
    (0 : Fin 3) (10 : Fin 13)
    (5 : Fin 13) (9 : Fin 13)
  have hk := P.strictKalmanson
    (a := (4 : Fin 13)) (b := (5 : Fin 13))
    (c := (9 : Fin 13)) (d := (10 : Fin 13))
    (by decide) (by decide) (by decide)
  exact Or.inr (by simpa only [dist_comm, add_comm] using hk.2)

/-- Candidate middle source assertion `h1710` (first_shared_pair). -/
theorem middleSource_h1710 :
    (!((firstRowBit (sourceFirstApexRow T) 6 && firstRowBit (sourceFirstApexRow T) 9 && rowBit (I.sourceRows) 0 10 6 && rowBit (I.sourceRows) 0 10 9))) = true := by
  apply allOne_firstRow_sharedPair_false_of_strict I
    (0 : Fin 3) (10 : Fin 13)
    (6 : Fin 13) (9 : Fin 13)
  have hk := P.strictKalmanson
    (a := (4 : Fin 13)) (b := (6 : Fin 13))
    (c := (9 : Fin 13)) (d := (10 : Fin 13))
    (by decide) (by decide) (by decide)
  exact Or.inr (by simpa only [dist_comm, add_comm] using hk.2)

/-- Candidate middle source assertion `h1711` (first_shared_pair). -/
theorem middleSource_h1711 :
    (!((firstRowBit (sourceFirstApexRow T) 8 && firstRowBit (sourceFirstApexRow T) 9 && rowBit (I.sourceRows) 0 10 8 && rowBit (I.sourceRows) 0 10 9))) = true := by
  apply allOne_firstRow_sharedPair_false_of_strict I
    (0 : Fin 3) (10 : Fin 13)
    (8 : Fin 13) (9 : Fin 13)
  have hk := P.strictKalmanson
    (a := (4 : Fin 13)) (b := (8 : Fin 13))
    (c := (9 : Fin 13)) (d := (10 : Fin 13))
    (by decide) (by decide) (by decide)
  exact Or.inr (by simpa only [dist_comm, add_comm] using hk.2)

/-- Candidate middle source assertion `h1712` (first_shared_pair). -/
theorem middleSource_h1712 :
    (!((firstRowBit (sourceFirstApexRow T) 11 && firstRowBit (sourceFirstApexRow T) 12 && rowBit (I.sourceRows) 0 10 11 && rowBit (I.sourceRows) 0 10 12))) = true := by
  apply allOne_firstRow_sharedPair_false_of_strict I
    (0 : Fin 3) (10 : Fin 13)
    (11 : Fin 13) (12 : Fin 13)
  have hk := P.strictKalmanson
    (a := (4 : Fin 13)) (b := (10 : Fin 13))
    (c := (11 : Fin 13)) (d := (12 : Fin 13))
    (by decide) (by decide) (by decide)
  exact Or.inl (by simpa only [dist_comm, add_comm] using hk.1)

/-- Candidate middle source assertion `h1713` (first_shared_pair). -/
theorem middleSource_h1713 :
    (!((firstRowBit (sourceFirstApexRow T) 0 && firstRowBit (sourceFirstApexRow T) 12 && rowBit (I.sourceRows) 0 11 0 && rowBit (I.sourceRows) 0 11 12))) = true := by
  apply allOne_firstRow_sharedPair_false_of_strict I
    (0 : Fin 3) (11 : Fin 13)
    (0 : Fin 13) (12 : Fin 13)
  have hk := P.strictKalmanson
    (a := (0 : Fin 13)) (b := (4 : Fin 13))
    (c := (11 : Fin 13)) (d := (12 : Fin 13))
    (by decide) (by decide) (by decide)
  exact Or.inr (by simpa only [dist_comm, add_comm] using hk.2)

/-- Candidate middle source assertion `h1714` (first_shared_pair). -/
theorem middleSource_h1714 :
    (!((firstRowBit (sourceFirstApexRow T) 1 && firstRowBit (sourceFirstApexRow T) 12 && rowBit (I.sourceRows) 0 11 1 && rowBit (I.sourceRows) 0 11 12))) = true := by
  apply allOne_firstRow_sharedPair_false_of_strict I
    (0 : Fin 3) (11 : Fin 13)
    (1 : Fin 13) (12 : Fin 13)
  have hk := P.strictKalmanson
    (a := (1 : Fin 13)) (b := (4 : Fin 13))
    (c := (11 : Fin 13)) (d := (12 : Fin 13))
    (by decide) (by decide) (by decide)
  exact Or.inr (by simpa only [dist_comm, add_comm] using hk.2)

/-- Candidate middle source assertion `h1715` (first_shared_pair). -/
theorem middleSource_h1715 :
    (!((firstRowBit (sourceFirstApexRow T) 2 && firstRowBit (sourceFirstApexRow T) 12 && rowBit (I.sourceRows) 0 11 2 && rowBit (I.sourceRows) 0 11 12))) = true := by
  apply allOne_firstRow_sharedPair_false_of_strict I
    (0 : Fin 3) (11 : Fin 13)
    (2 : Fin 13) (12 : Fin 13)
  have hk := P.strictKalmanson
    (a := (2 : Fin 13)) (b := (4 : Fin 13))
    (c := (11 : Fin 13)) (d := (12 : Fin 13))
    (by decide) (by decide) (by decide)
  exact Or.inr (by simpa only [dist_comm, add_comm] using hk.2)

/-- Candidate middle source assertion `h1716` (first_shared_pair). -/
theorem middleSource_h1716 :
    (!((firstRowBit (sourceFirstApexRow T) 3 && firstRowBit (sourceFirstApexRow T) 12 && rowBit (I.sourceRows) 0 11 3 && rowBit (I.sourceRows) 0 11 12))) = true := by
  apply allOne_firstRow_sharedPair_false_of_strict I
    (0 : Fin 3) (11 : Fin 13)
    (3 : Fin 13) (12 : Fin 13)
  have hk := P.strictKalmanson
    (a := (3 : Fin 13)) (b := (4 : Fin 13))
    (c := (11 : Fin 13)) (d := (12 : Fin 13))
    (by decide) (by decide) (by decide)
  exact Or.inr (by simpa only [dist_comm, add_comm] using hk.2)

/-- Candidate middle source assertion `h1717` (first_shared_pair). -/
theorem middleSource_h1717 :
    (!((firstRowBit (sourceFirstApexRow T) 5 && firstRowBit (sourceFirstApexRow T) 9 && rowBit (I.sourceRows) 0 11 5 && rowBit (I.sourceRows) 0 11 9))) = true := by
  apply allOne_firstRow_sharedPair_false_of_strict I
    (0 : Fin 3) (11 : Fin 13)
    (5 : Fin 13) (9 : Fin 13)
  have hk := P.strictKalmanson
    (a := (4 : Fin 13)) (b := (5 : Fin 13))
    (c := (9 : Fin 13)) (d := (11 : Fin 13))
    (by decide) (by decide) (by decide)
  exact Or.inr (by simpa only [dist_comm, add_comm] using hk.2)

/-- Candidate middle source assertion `h1718` (first_shared_pair). -/
theorem middleSource_h1718 :
    (!((firstRowBit (sourceFirstApexRow T) 5 && firstRowBit (sourceFirstApexRow T) 10 && rowBit (I.sourceRows) 0 11 5 && rowBit (I.sourceRows) 0 11 10))) = true := by
  apply allOne_firstRow_sharedPair_false_of_strict I
    (0 : Fin 3) (11 : Fin 13)
    (5 : Fin 13) (10 : Fin 13)
  have hk := P.strictKalmanson
    (a := (4 : Fin 13)) (b := (5 : Fin 13))
    (c := (10 : Fin 13)) (d := (11 : Fin 13))
    (by decide) (by decide) (by decide)
  exact Or.inr (by simpa only [dist_comm, add_comm] using hk.2)

/-- Candidate middle source assertion `h1719` (first_shared_pair). -/
theorem middleSource_h1719 :
    (!((firstRowBit (sourceFirstApexRow T) 6 && firstRowBit (sourceFirstApexRow T) 9 && rowBit (I.sourceRows) 0 11 6 && rowBit (I.sourceRows) 0 11 9))) = true := by
  apply allOne_firstRow_sharedPair_false_of_strict I
    (0 : Fin 3) (11 : Fin 13)
    (6 : Fin 13) (9 : Fin 13)
  have hk := P.strictKalmanson
    (a := (4 : Fin 13)) (b := (6 : Fin 13))
    (c := (9 : Fin 13)) (d := (11 : Fin 13))
    (by decide) (by decide) (by decide)
  exact Or.inr (by simpa only [dist_comm, add_comm] using hk.2)

/-- Candidate middle source assertion `h1720` (first_shared_pair). -/
theorem middleSource_h1720 :
    (!((firstRowBit (sourceFirstApexRow T) 6 && firstRowBit (sourceFirstApexRow T) 10 && rowBit (I.sourceRows) 0 11 6 && rowBit (I.sourceRows) 0 11 10))) = true := by
  apply allOne_firstRow_sharedPair_false_of_strict I
    (0 : Fin 3) (11 : Fin 13)
    (6 : Fin 13) (10 : Fin 13)
  have hk := P.strictKalmanson
    (a := (4 : Fin 13)) (b := (6 : Fin 13))
    (c := (10 : Fin 13)) (d := (11 : Fin 13))
    (by decide) (by decide) (by decide)
  exact Or.inr (by simpa only [dist_comm, add_comm] using hk.2)

/-- Candidate middle source assertion `h1721` (first_shared_pair). -/
theorem middleSource_h1721 :
    (!((firstRowBit (sourceFirstApexRow T) 7 && firstRowBit (sourceFirstApexRow T) 10 && rowBit (I.sourceRows) 0 11 7 && rowBit (I.sourceRows) 0 11 10))) = true := by
  apply allOne_firstRow_sharedPair_false_of_strict I
    (0 : Fin 3) (11 : Fin 13)
    (7 : Fin 13) (10 : Fin 13)
  have hk := P.strictKalmanson
    (a := (4 : Fin 13)) (b := (7 : Fin 13))
    (c := (10 : Fin 13)) (d := (11 : Fin 13))
    (by decide) (by decide) (by decide)
  exact Or.inr (by simpa only [dist_comm, add_comm] using hk.2)

/-- Candidate middle source assertion `h1722` (first_shared_pair). -/
theorem middleSource_h1722 :
    (!((firstRowBit (sourceFirstApexRow T) 8 && firstRowBit (sourceFirstApexRow T) 9 && rowBit (I.sourceRows) 0 11 8 && rowBit (I.sourceRows) 0 11 9))) = true := by
  apply allOne_firstRow_sharedPair_false_of_strict I
    (0 : Fin 3) (11 : Fin 13)
    (8 : Fin 13) (9 : Fin 13)
  have hk := P.strictKalmanson
    (a := (4 : Fin 13)) (b := (8 : Fin 13))
    (c := (9 : Fin 13)) (d := (11 : Fin 13))
    (by decide) (by decide) (by decide)
  exact Or.inr (by simpa only [dist_comm, add_comm] using hk.2)

/-- Candidate middle source assertion `h1723` (first_shared_pair). -/
theorem middleSource_h1723 :
    (!((firstRowBit (sourceFirstApexRow T) 8 && firstRowBit (sourceFirstApexRow T) 10 && rowBit (I.sourceRows) 0 11 8 && rowBit (I.sourceRows) 0 11 10))) = true := by
  apply allOne_firstRow_sharedPair_false_of_strict I
    (0 : Fin 3) (11 : Fin 13)
    (8 : Fin 13) (10 : Fin 13)
  have hk := P.strictKalmanson
    (a := (4 : Fin 13)) (b := (8 : Fin 13))
    (c := (10 : Fin 13)) (d := (11 : Fin 13))
    (by decide) (by decide) (by decide)
  exact Or.inr (by simpa only [dist_comm, add_comm] using hk.2)

/-- Candidate middle source assertion `h1724` (first_shared_pair). -/
theorem middleSource_h1724 :
    (!((firstRowBit (sourceFirstApexRow T) 9 && firstRowBit (sourceFirstApexRow T) 10 && rowBit (I.sourceRows) 0 11 9 && rowBit (I.sourceRows) 0 11 10))) = true := by
  apply allOne_firstRow_sharedPair_false_of_strict I
    (0 : Fin 3) (11 : Fin 13)
    (9 : Fin 13) (10 : Fin 13)
  have hk := P.strictKalmanson
    (a := (4 : Fin 13)) (b := (9 : Fin 13))
    (c := (10 : Fin 13)) (d := (11 : Fin 13))
    (by decide) (by decide) (by decide)
  exact Or.inr (by simpa only [dist_comm, add_comm] using hk.2)

/-- Candidate middle source assertion `h1725` (first_shared_pair). -/
theorem middleSource_h1725 :
    (!((firstRowBit (sourceFirstApexRow T) 9 && firstRowBit (sourceFirstApexRow T) 10 && rowBit (I.sourceRows) 0 12 9 && rowBit (I.sourceRows) 0 12 10))) = true := by
  apply allOne_firstRow_sharedPair_false_of_strict I
    (0 : Fin 3) (12 : Fin 13)
    (9 : Fin 13) (10 : Fin 13)
  have hk := P.strictKalmanson
    (a := (4 : Fin 13)) (b := (9 : Fin 13))
    (c := (10 : Fin 13)) (d := (12 : Fin 13))
    (by decide) (by decide) (by decide)
  exact Or.inr (by simpa only [dist_comm, add_comm] using hk.2)

/-- Candidate middle source assertion `h1726` (first_shared_pair). -/
theorem middleSource_h1726 :
    (!((firstRowBit (sourceFirstApexRow T) 0 && firstRowBit (sourceFirstApexRow T) 9 && rowBit (I.sourceRows) 0 5 0 && rowBit (I.sourceRows) 0 5 9))) = true := by
  apply allOne_firstRow_sharedPair_false_of_strict I
    (0 : Fin 3) (5 : Fin 13)
    (0 : Fin 13) (9 : Fin 13)
  have hk := P.strictKalmanson
    (a := (0 : Fin 13)) (b := (4 : Fin 13))
    (c := (5 : Fin 13)) (d := (9 : Fin 13))
    (by decide) (by decide) (by decide)
  exact Or.inr (by simpa only [dist_comm, add_comm] using hk.2)

/-- Candidate middle source assertion `h1727` (first_shared_pair). -/
theorem middleSource_h1727 :
    (!((firstRowBit (sourceFirstApexRow T) 0 && firstRowBit (sourceFirstApexRow T) 11 && rowBit (I.sourceRows) 0 5 0 && rowBit (I.sourceRows) 0 5 11))) = true := by
  apply allOne_firstRow_sharedPair_false_of_strict I
    (0 : Fin 3) (5 : Fin 13)
    (0 : Fin 13) (11 : Fin 13)
  have hk := P.strictKalmanson
    (a := (0 : Fin 13)) (b := (4 : Fin 13))
    (c := (5 : Fin 13)) (d := (11 : Fin 13))
    (by decide) (by decide) (by decide)
  exact Or.inr (by simpa only [dist_comm, add_comm] using hk.2)

end

end ATailExactFiveCard13AllOneSourceIngressScratch
end Problem97
