/-
Generated from the middle source core whose original Lean-emitted CNF and
LRAT endpoint have been kernel checked.  These source-faithful adapters prove
the individual ordinal-rank assertions consumed by that verified endpoint.
-/
import AllOneRankFacts

/-!
# Candidate middle-orbit rank instances

Generated specializations of the source-faithful rank assertion schemas.
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

/-- Candidate middle source assertion `h6592` (kalmanson). -/
theorem middleSource_h6592 :
    ((!((allOneRankAtom (sourceRanks P) 46 == allOneRankAtom (sourceRanks P) 53)) || ((allOneRankAtom (sourceRanks P) 49).ult (allOneRankAtom (sourceRanks P) 56)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (56 : Fin 78) (46 : Fin 78)
    (49 : Fin 78) (53 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (5 : Fin 13) (9 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (53 : Fin 78) (49 : Fin 78) (46 : Fin 78)
    (56 : Fin 78) (42 : Fin 78) (74 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6593` (kalmanson). -/
theorem middleSource_h6593 :
    ((!((allOneRankAtom (sourceRanks P) 56 == allOneRankAtom (sourceRanks P) 49)) || ((allOneRankAtom (sourceRanks P) 53).ult (allOneRankAtom (sourceRanks P) 46)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (46 : Fin 78) (56 : Fin 78)
    (53 : Fin 78) (49 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (5 : Fin 13) (9 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (53 : Fin 78) (49 : Fin 78) (46 : Fin 78)
    (56 : Fin 78) (42 : Fin 78) (74 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6594` (kalmanson). -/
theorem middleSource_h6594 :
    ((!((allOneRankAtom (sourceRanks P) 56 == allOneRankAtom (sourceRanks P) 53)) || ((allOneRankAtom (sourceRanks P) 49).ult (allOneRankAtom (sourceRanks P) 46)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (46 : Fin 78) (56 : Fin 78)
    (49 : Fin 78) (53 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (5 : Fin 13) (9 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (53 : Fin 78) (49 : Fin 78) (46 : Fin 78)
    (56 : Fin 78) (42 : Fin 78) (74 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6595` (kalmanson). -/
theorem middleSource_h6595 :
    ((!((allOneRankAtom (sourceRanks P) 47 == allOneRankAtom (sourceRanks P) 42)) || ((allOneRankAtom (sourceRanks P) 75).ult (allOneRankAtom (sourceRanks P) 55)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (55 : Fin 78) (47 : Fin 78)
    (75 : Fin 78) (42 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (5 : Fin 13) (10 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (54 : Fin 78) (48 : Fin 78) (47 : Fin 78)
    (55 : Fin 78) (42 : Fin 78) (75 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6596` (kalmanson). -/
theorem middleSource_h6596 :
    ((!((allOneRankAtom (sourceRanks P) 47 == allOneRankAtom (sourceRanks P) 75)) || ((allOneRankAtom (sourceRanks P) 42).ult (allOneRankAtom (sourceRanks P) 55)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (55 : Fin 78) (47 : Fin 78)
    (42 : Fin 78) (75 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (5 : Fin 13) (10 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (54 : Fin 78) (48 : Fin 78) (47 : Fin 78)
    (55 : Fin 78) (42 : Fin 78) (75 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6597` (kalmanson). -/
theorem middleSource_h6597 :
    ((!((allOneRankAtom (sourceRanks P) 55 == allOneRankAtom (sourceRanks P) 42)) || ((allOneRankAtom (sourceRanks P) 75).ult (allOneRankAtom (sourceRanks P) 47)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (47 : Fin 78) (55 : Fin 78)
    (75 : Fin 78) (42 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (5 : Fin 13) (10 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (54 : Fin 78) (48 : Fin 78) (47 : Fin 78)
    (55 : Fin 78) (42 : Fin 78) (75 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6598` (kalmanson). -/
theorem middleSource_h6598 :
    ((!((allOneRankAtom (sourceRanks P) 55 == allOneRankAtom (sourceRanks P) 75)) || ((allOneRankAtom (sourceRanks P) 42).ult (allOneRankAtom (sourceRanks P) 47)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (47 : Fin 78) (55 : Fin 78)
    (42 : Fin 78) (75 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (5 : Fin 13) (10 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (54 : Fin 78) (48 : Fin 78) (47 : Fin 78)
    (55 : Fin 78) (42 : Fin 78) (75 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6599` (kalmanson). -/
theorem middleSource_h6599 :
    ((!((allOneRankAtom (sourceRanks P) 47 == allOneRankAtom (sourceRanks P) 48)) || ((allOneRankAtom (sourceRanks P) 54).ult (allOneRankAtom (sourceRanks P) 55)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (55 : Fin 78) (47 : Fin 78)
    (54 : Fin 78) (48 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (5 : Fin 13) (10 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (54 : Fin 78) (48 : Fin 78) (47 : Fin 78)
    (55 : Fin 78) (42 : Fin 78) (75 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6600` (kalmanson). -/
theorem middleSource_h6600 :
    ((!((allOneRankAtom (sourceRanks P) 47 == allOneRankAtom (sourceRanks P) 54)) || ((allOneRankAtom (sourceRanks P) 48).ult (allOneRankAtom (sourceRanks P) 55)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (55 : Fin 78) (47 : Fin 78)
    (48 : Fin 78) (54 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (5 : Fin 13) (10 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (54 : Fin 78) (48 : Fin 78) (47 : Fin 78)
    (55 : Fin 78) (42 : Fin 78) (75 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6601` (kalmanson). -/
theorem middleSource_h6601 :
    ((!((allOneRankAtom (sourceRanks P) 55 == allOneRankAtom (sourceRanks P) 48)) || ((allOneRankAtom (sourceRanks P) 54).ult (allOneRankAtom (sourceRanks P) 47)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (47 : Fin 78) (55 : Fin 78)
    (54 : Fin 78) (48 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (5 : Fin 13) (10 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (54 : Fin 78) (48 : Fin 78) (47 : Fin 78)
    (55 : Fin 78) (42 : Fin 78) (75 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6602` (kalmanson). -/
theorem middleSource_h6602 :
    ((!((allOneRankAtom (sourceRanks P) 55 == allOneRankAtom (sourceRanks P) 54)) || ((allOneRankAtom (sourceRanks P) 48).ult (allOneRankAtom (sourceRanks P) 47)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (47 : Fin 78) (55 : Fin 78)
    (48 : Fin 78) (54 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (5 : Fin 13) (10 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (54 : Fin 78) (48 : Fin 78) (47 : Fin 78)
    (55 : Fin 78) (42 : Fin 78) (75 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6603` (kalmanson). -/
theorem middleSource_h6603 :
    ((!((allOneRankAtom (sourceRanks P) 47 == allOneRankAtom (sourceRanks P) 42)) || ((allOneRankAtom (sourceRanks P) 76).ult (allOneRankAtom (sourceRanks P) 56)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (56 : Fin 78) (47 : Fin 78)
    (76 : Fin 78) (42 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (5 : Fin 13) (10 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (54 : Fin 78) (49 : Fin 78) (47 : Fin 78)
    (56 : Fin 78) (42 : Fin 78) (76 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6604` (kalmanson). -/
theorem middleSource_h6604 :
    ((!((allOneRankAtom (sourceRanks P) 47 == allOneRankAtom (sourceRanks P) 76)) || ((allOneRankAtom (sourceRanks P) 42).ult (allOneRankAtom (sourceRanks P) 56)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (56 : Fin 78) (47 : Fin 78)
    (42 : Fin 78) (76 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (5 : Fin 13) (10 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (54 : Fin 78) (49 : Fin 78) (47 : Fin 78)
    (56 : Fin 78) (42 : Fin 78) (76 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6605` (kalmanson). -/
theorem middleSource_h6605 :
    ((!((allOneRankAtom (sourceRanks P) 56 == allOneRankAtom (sourceRanks P) 42)) || ((allOneRankAtom (sourceRanks P) 76).ult (allOneRankAtom (sourceRanks P) 47)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (47 : Fin 78) (56 : Fin 78)
    (76 : Fin 78) (42 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (5 : Fin 13) (10 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (54 : Fin 78) (49 : Fin 78) (47 : Fin 78)
    (56 : Fin 78) (42 : Fin 78) (76 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6606` (kalmanson). -/
theorem middleSource_h6606 :
    ((!((allOneRankAtom (sourceRanks P) 56 == allOneRankAtom (sourceRanks P) 76)) || ((allOneRankAtom (sourceRanks P) 42).ult (allOneRankAtom (sourceRanks P) 47)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (47 : Fin 78) (56 : Fin 78)
    (42 : Fin 78) (76 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (5 : Fin 13) (10 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (54 : Fin 78) (49 : Fin 78) (47 : Fin 78)
    (56 : Fin 78) (42 : Fin 78) (76 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6607` (kalmanson). -/
theorem middleSource_h6607 :
    ((!((allOneRankAtom (sourceRanks P) 47 == allOneRankAtom (sourceRanks P) 49)) || ((allOneRankAtom (sourceRanks P) 54).ult (allOneRankAtom (sourceRanks P) 56)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (56 : Fin 78) (47 : Fin 78)
    (54 : Fin 78) (49 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (5 : Fin 13) (10 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (54 : Fin 78) (49 : Fin 78) (47 : Fin 78)
    (56 : Fin 78) (42 : Fin 78) (76 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6608` (kalmanson). -/
theorem middleSource_h6608 :
    ((!((allOneRankAtom (sourceRanks P) 47 == allOneRankAtom (sourceRanks P) 54)) || ((allOneRankAtom (sourceRanks P) 49).ult (allOneRankAtom (sourceRanks P) 56)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (56 : Fin 78) (47 : Fin 78)
    (49 : Fin 78) (54 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (5 : Fin 13) (10 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (54 : Fin 78) (49 : Fin 78) (47 : Fin 78)
    (56 : Fin 78) (42 : Fin 78) (76 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6609` (kalmanson). -/
theorem middleSource_h6609 :
    ((!((allOneRankAtom (sourceRanks P) 56 == allOneRankAtom (sourceRanks P) 49)) || ((allOneRankAtom (sourceRanks P) 54).ult (allOneRankAtom (sourceRanks P) 47)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (47 : Fin 78) (56 : Fin 78)
    (54 : Fin 78) (49 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (5 : Fin 13) (10 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (54 : Fin 78) (49 : Fin 78) (47 : Fin 78)
    (56 : Fin 78) (42 : Fin 78) (76 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6610` (kalmanson). -/
theorem middleSource_h6610 :
    ((!((allOneRankAtom (sourceRanks P) 56 == allOneRankAtom (sourceRanks P) 54)) || ((allOneRankAtom (sourceRanks P) 49).ult (allOneRankAtom (sourceRanks P) 47)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (47 : Fin 78) (56 : Fin 78)
    (49 : Fin 78) (54 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (5 : Fin 13) (10 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (54 : Fin 78) (49 : Fin 78) (47 : Fin 78)
    (56 : Fin 78) (42 : Fin 78) (76 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6611` (kalmanson). -/
theorem middleSource_h6611 :
    ((!((allOneRankAtom (sourceRanks P) 48 == allOneRankAtom (sourceRanks P) 42)) || ((allOneRankAtom (sourceRanks P) 77).ult (allOneRankAtom (sourceRanks P) 56)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (56 : Fin 78) (48 : Fin 78)
    (77 : Fin 78) (42 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (5 : Fin 13) (11 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (55 : Fin 78) (49 : Fin 78) (48 : Fin 78)
    (56 : Fin 78) (42 : Fin 78) (77 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6612` (kalmanson). -/
theorem middleSource_h6612 :
    ((!((allOneRankAtom (sourceRanks P) 48 == allOneRankAtom (sourceRanks P) 77)) || ((allOneRankAtom (sourceRanks P) 42).ult (allOneRankAtom (sourceRanks P) 56)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (56 : Fin 78) (48 : Fin 78)
    (42 : Fin 78) (77 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (5 : Fin 13) (11 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (55 : Fin 78) (49 : Fin 78) (48 : Fin 78)
    (56 : Fin 78) (42 : Fin 78) (77 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6613` (kalmanson). -/
theorem middleSource_h6613 :
    ((!((allOneRankAtom (sourceRanks P) 56 == allOneRankAtom (sourceRanks P) 42)) || ((allOneRankAtom (sourceRanks P) 77).ult (allOneRankAtom (sourceRanks P) 48)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (48 : Fin 78) (56 : Fin 78)
    (77 : Fin 78) (42 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (5 : Fin 13) (11 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (55 : Fin 78) (49 : Fin 78) (48 : Fin 78)
    (56 : Fin 78) (42 : Fin 78) (77 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6614` (kalmanson). -/
theorem middleSource_h6614 :
    ((!((allOneRankAtom (sourceRanks P) 56 == allOneRankAtom (sourceRanks P) 77)) || ((allOneRankAtom (sourceRanks P) 42).ult (allOneRankAtom (sourceRanks P) 48)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (48 : Fin 78) (56 : Fin 78)
    (42 : Fin 78) (77 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (5 : Fin 13) (11 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (55 : Fin 78) (49 : Fin 78) (48 : Fin 78)
    (56 : Fin 78) (42 : Fin 78) (77 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6615` (kalmanson). -/
theorem middleSource_h6615 :
    ((!((allOneRankAtom (sourceRanks P) 48 == allOneRankAtom (sourceRanks P) 49)) || ((allOneRankAtom (sourceRanks P) 55).ult (allOneRankAtom (sourceRanks P) 56)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (56 : Fin 78) (48 : Fin 78)
    (55 : Fin 78) (49 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (5 : Fin 13) (11 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (55 : Fin 78) (49 : Fin 78) (48 : Fin 78)
    (56 : Fin 78) (42 : Fin 78) (77 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6616` (kalmanson). -/
theorem middleSource_h6616 :
    ((!((allOneRankAtom (sourceRanks P) 48 == allOneRankAtom (sourceRanks P) 55)) || ((allOneRankAtom (sourceRanks P) 49).ult (allOneRankAtom (sourceRanks P) 56)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (56 : Fin 78) (48 : Fin 78)
    (49 : Fin 78) (55 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (5 : Fin 13) (11 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (55 : Fin 78) (49 : Fin 78) (48 : Fin 78)
    (56 : Fin 78) (42 : Fin 78) (77 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6617` (kalmanson). -/
theorem middleSource_h6617 :
    ((!((allOneRankAtom (sourceRanks P) 56 == allOneRankAtom (sourceRanks P) 49)) || ((allOneRankAtom (sourceRanks P) 55).ult (allOneRankAtom (sourceRanks P) 48)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (48 : Fin 78) (56 : Fin 78)
    (55 : Fin 78) (49 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (5 : Fin 13) (11 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (55 : Fin 78) (49 : Fin 78) (48 : Fin 78)
    (56 : Fin 78) (42 : Fin 78) (77 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6618` (kalmanson). -/
theorem middleSource_h6618 :
    ((!((allOneRankAtom (sourceRanks P) 56 == allOneRankAtom (sourceRanks P) 55)) || ((allOneRankAtom (sourceRanks P) 49).ult (allOneRankAtom (sourceRanks P) 48)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (48 : Fin 78) (56 : Fin 78)
    (49 : Fin 78) (55 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (5 : Fin 13) (11 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (55 : Fin 78) (49 : Fin 78) (48 : Fin 78)
    (56 : Fin 78) (42 : Fin 78) (77 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6619` (kalmanson). -/
theorem middleSource_h6619 :
    ((!((allOneRankAtom (sourceRanks P) 44 == allOneRankAtom (sourceRanks P) 43)) || ((allOneRankAtom (sourceRanks P) 63).ult (allOneRankAtom (sourceRanks P) 58)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (58 : Fin 78) (44 : Fin 78)
    (63 : Fin 78) (43 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (6 : Fin 13) (7 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (45 : Fin 78) (44 : Fin 78)
    (58 : Fin 78) (43 : Fin 78) (63 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6620` (kalmanson). -/
theorem middleSource_h6620 :
    ((!((allOneRankAtom (sourceRanks P) 44 == allOneRankAtom (sourceRanks P) 63)) || ((allOneRankAtom (sourceRanks P) 43).ult (allOneRankAtom (sourceRanks P) 58)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (58 : Fin 78) (44 : Fin 78)
    (43 : Fin 78) (63 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (6 : Fin 13) (7 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (45 : Fin 78) (44 : Fin 78)
    (58 : Fin 78) (43 : Fin 78) (63 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6621` (kalmanson). -/
theorem middleSource_h6621 :
    ((!((allOneRankAtom (sourceRanks P) 58 == allOneRankAtom (sourceRanks P) 43)) || ((allOneRankAtom (sourceRanks P) 63).ult (allOneRankAtom (sourceRanks P) 44)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (44 : Fin 78) (58 : Fin 78)
    (63 : Fin 78) (43 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (6 : Fin 13) (7 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (45 : Fin 78) (44 : Fin 78)
    (58 : Fin 78) (43 : Fin 78) (63 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6622` (kalmanson). -/
theorem middleSource_h6622 :
    ((!((allOneRankAtom (sourceRanks P) 44 == allOneRankAtom (sourceRanks P) 45)) || ((allOneRankAtom (sourceRanks P) 57).ult (allOneRankAtom (sourceRanks P) 58)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (58 : Fin 78) (44 : Fin 78)
    (57 : Fin 78) (45 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (6 : Fin 13) (7 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (45 : Fin 78) (44 : Fin 78)
    (58 : Fin 78) (43 : Fin 78) (63 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6623` (kalmanson). -/
theorem middleSource_h6623 :
    ((!((allOneRankAtom (sourceRanks P) 58 == allOneRankAtom (sourceRanks P) 57)) || ((allOneRankAtom (sourceRanks P) 45).ult (allOneRankAtom (sourceRanks P) 44)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (44 : Fin 78) (58 : Fin 78)
    (45 : Fin 78) (57 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (6 : Fin 13) (7 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (45 : Fin 78) (44 : Fin 78)
    (58 : Fin 78) (43 : Fin 78) (63 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6624` (kalmanson). -/
theorem middleSource_h6624 :
    ((!((allOneRankAtom (sourceRanks P) 44 == allOneRankAtom (sourceRanks P) 43)) || ((allOneRankAtom (sourceRanks P) 64).ult (allOneRankAtom (sourceRanks P) 59)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (59 : Fin 78) (44 : Fin 78)
    (64 : Fin 78) (43 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (6 : Fin 13) (7 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (46 : Fin 78) (44 : Fin 78)
    (59 : Fin 78) (43 : Fin 78) (64 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6625` (kalmanson). -/
theorem middleSource_h6625 :
    ((!((allOneRankAtom (sourceRanks P) 44 == allOneRankAtom (sourceRanks P) 64)) || ((allOneRankAtom (sourceRanks P) 43).ult (allOneRankAtom (sourceRanks P) 59)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (59 : Fin 78) (44 : Fin 78)
    (43 : Fin 78) (64 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (6 : Fin 13) (7 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (46 : Fin 78) (44 : Fin 78)
    (59 : Fin 78) (43 : Fin 78) (64 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6626` (kalmanson). -/
theorem middleSource_h6626 :
    ((!((allOneRankAtom (sourceRanks P) 59 == allOneRankAtom (sourceRanks P) 43)) || ((allOneRankAtom (sourceRanks P) 64).ult (allOneRankAtom (sourceRanks P) 44)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (44 : Fin 78) (59 : Fin 78)
    (64 : Fin 78) (43 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (6 : Fin 13) (7 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (46 : Fin 78) (44 : Fin 78)
    (59 : Fin 78) (43 : Fin 78) (64 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6627` (kalmanson). -/
theorem middleSource_h6627 :
    ((!((allOneRankAtom (sourceRanks P) 59 == allOneRankAtom (sourceRanks P) 64)) || ((allOneRankAtom (sourceRanks P) 43).ult (allOneRankAtom (sourceRanks P) 44)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (44 : Fin 78) (59 : Fin 78)
    (43 : Fin 78) (64 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (6 : Fin 13) (7 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (46 : Fin 78) (44 : Fin 78)
    (59 : Fin 78) (43 : Fin 78) (64 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6628` (kalmanson). -/
theorem middleSource_h6628 :
    ((!((allOneRankAtom (sourceRanks P) 44 == allOneRankAtom (sourceRanks P) 46)) || ((allOneRankAtom (sourceRanks P) 57).ult (allOneRankAtom (sourceRanks P) 59)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (59 : Fin 78) (44 : Fin 78)
    (57 : Fin 78) (46 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (6 : Fin 13) (7 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (46 : Fin 78) (44 : Fin 78)
    (59 : Fin 78) (43 : Fin 78) (64 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6629` (kalmanson). -/
theorem middleSource_h6629 :
    ((!((allOneRankAtom (sourceRanks P) 59 == allOneRankAtom (sourceRanks P) 46)) || ((allOneRankAtom (sourceRanks P) 57).ult (allOneRankAtom (sourceRanks P) 44)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (44 : Fin 78) (59 : Fin 78)
    (57 : Fin 78) (46 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (6 : Fin 13) (7 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (46 : Fin 78) (44 : Fin 78)
    (59 : Fin 78) (43 : Fin 78) (64 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6630` (kalmanson). -/
theorem middleSource_h6630 :
    ((!((allOneRankAtom (sourceRanks P) 59 == allOneRankAtom (sourceRanks P) 57)) || ((allOneRankAtom (sourceRanks P) 46).ult (allOneRankAtom (sourceRanks P) 44)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (44 : Fin 78) (59 : Fin 78)
    (46 : Fin 78) (57 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (6 : Fin 13) (7 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (46 : Fin 78) (44 : Fin 78)
    (59 : Fin 78) (43 : Fin 78) (64 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6631` (kalmanson). -/
theorem middleSource_h6631 :
    ((!((allOneRankAtom (sourceRanks P) 44 == allOneRankAtom (sourceRanks P) 43)) || ((allOneRankAtom (sourceRanks P) 65).ult (allOneRankAtom (sourceRanks P) 60)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (60 : Fin 78) (44 : Fin 78)
    (65 : Fin 78) (43 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (6 : Fin 13) (7 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (47 : Fin 78) (44 : Fin 78)
    (60 : Fin 78) (43 : Fin 78) (65 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6632` (kalmanson). -/
theorem middleSource_h6632 :
    ((!((allOneRankAtom (sourceRanks P) 44 == allOneRankAtom (sourceRanks P) 65)) || ((allOneRankAtom (sourceRanks P) 43).ult (allOneRankAtom (sourceRanks P) 60)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (60 : Fin 78) (44 : Fin 78)
    (43 : Fin 78) (65 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (6 : Fin 13) (7 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (47 : Fin 78) (44 : Fin 78)
    (60 : Fin 78) (43 : Fin 78) (65 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6633` (kalmanson). -/
theorem middleSource_h6633 :
    ((!((allOneRankAtom (sourceRanks P) 60 == allOneRankAtom (sourceRanks P) 43)) || ((allOneRankAtom (sourceRanks P) 65).ult (allOneRankAtom (sourceRanks P) 44)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (44 : Fin 78) (60 : Fin 78)
    (65 : Fin 78) (43 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (6 : Fin 13) (7 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (47 : Fin 78) (44 : Fin 78)
    (60 : Fin 78) (43 : Fin 78) (65 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6634` (kalmanson). -/
theorem middleSource_h6634 :
    ((!((allOneRankAtom (sourceRanks P) 60 == allOneRankAtom (sourceRanks P) 65)) || ((allOneRankAtom (sourceRanks P) 43).ult (allOneRankAtom (sourceRanks P) 44)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (44 : Fin 78) (60 : Fin 78)
    (43 : Fin 78) (65 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (6 : Fin 13) (7 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (47 : Fin 78) (44 : Fin 78)
    (60 : Fin 78) (43 : Fin 78) (65 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6635` (kalmanson). -/
theorem middleSource_h6635 :
    ((!((allOneRankAtom (sourceRanks P) 44 == allOneRankAtom (sourceRanks P) 47)) || ((allOneRankAtom (sourceRanks P) 57).ult (allOneRankAtom (sourceRanks P) 60)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (60 : Fin 78) (44 : Fin 78)
    (57 : Fin 78) (47 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (6 : Fin 13) (7 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (47 : Fin 78) (44 : Fin 78)
    (60 : Fin 78) (43 : Fin 78) (65 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6636` (kalmanson). -/
theorem middleSource_h6636 :
    ((!((allOneRankAtom (sourceRanks P) 60 == allOneRankAtom (sourceRanks P) 47)) || ((allOneRankAtom (sourceRanks P) 57).ult (allOneRankAtom (sourceRanks P) 44)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (44 : Fin 78) (60 : Fin 78)
    (57 : Fin 78) (47 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (6 : Fin 13) (7 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (47 : Fin 78) (44 : Fin 78)
    (60 : Fin 78) (43 : Fin 78) (65 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6637` (kalmanson). -/
theorem middleSource_h6637 :
    ((!((allOneRankAtom (sourceRanks P) 60 == allOneRankAtom (sourceRanks P) 57)) || ((allOneRankAtom (sourceRanks P) 47).ult (allOneRankAtom (sourceRanks P) 44)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (44 : Fin 78) (60 : Fin 78)
    (47 : Fin 78) (57 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (6 : Fin 13) (7 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (47 : Fin 78) (44 : Fin 78)
    (60 : Fin 78) (43 : Fin 78) (65 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6638` (kalmanson). -/
theorem middleSource_h6638 :
    ((!((allOneRankAtom (sourceRanks P) 44 == allOneRankAtom (sourceRanks P) 43)) || ((allOneRankAtom (sourceRanks P) 66).ult (allOneRankAtom (sourceRanks P) 61)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (61 : Fin 78) (44 : Fin 78)
    (66 : Fin 78) (43 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (6 : Fin 13) (7 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (48 : Fin 78) (44 : Fin 78)
    (61 : Fin 78) (43 : Fin 78) (66 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6639` (kalmanson). -/
theorem middleSource_h6639 :
    ((!((allOneRankAtom (sourceRanks P) 61 == allOneRankAtom (sourceRanks P) 43)) || ((allOneRankAtom (sourceRanks P) 66).ult (allOneRankAtom (sourceRanks P) 44)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (44 : Fin 78) (61 : Fin 78)
    (66 : Fin 78) (43 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (6 : Fin 13) (7 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (48 : Fin 78) (44 : Fin 78)
    (61 : Fin 78) (43 : Fin 78) (66 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6640` (kalmanson). -/
theorem middleSource_h6640 :
    ((!((allOneRankAtom (sourceRanks P) 61 == allOneRankAtom (sourceRanks P) 66)) || ((allOneRankAtom (sourceRanks P) 43).ult (allOneRankAtom (sourceRanks P) 44)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (44 : Fin 78) (61 : Fin 78)
    (43 : Fin 78) (66 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (6 : Fin 13) (7 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (48 : Fin 78) (44 : Fin 78)
    (61 : Fin 78) (43 : Fin 78) (66 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6641` (kalmanson). -/
theorem middleSource_h6641 :
    ((!((allOneRankAtom (sourceRanks P) 44 == allOneRankAtom (sourceRanks P) 48)) || ((allOneRankAtom (sourceRanks P) 57).ult (allOneRankAtom (sourceRanks P) 61)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (61 : Fin 78) (44 : Fin 78)
    (57 : Fin 78) (48 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (6 : Fin 13) (7 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (48 : Fin 78) (44 : Fin 78)
    (61 : Fin 78) (43 : Fin 78) (66 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6642` (kalmanson). -/
theorem middleSource_h6642 :
    ((!((allOneRankAtom (sourceRanks P) 61 == allOneRankAtom (sourceRanks P) 48)) || ((allOneRankAtom (sourceRanks P) 57).ult (allOneRankAtom (sourceRanks P) 44)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (44 : Fin 78) (61 : Fin 78)
    (57 : Fin 78) (48 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (6 : Fin 13) (7 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (48 : Fin 78) (44 : Fin 78)
    (61 : Fin 78) (43 : Fin 78) (66 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6643` (kalmanson). -/
theorem middleSource_h6643 :
    ((!((allOneRankAtom (sourceRanks P) 61 == allOneRankAtom (sourceRanks P) 57)) || ((allOneRankAtom (sourceRanks P) 48).ult (allOneRankAtom (sourceRanks P) 44)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (44 : Fin 78) (61 : Fin 78)
    (48 : Fin 78) (57 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (6 : Fin 13) (7 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (48 : Fin 78) (44 : Fin 78)
    (61 : Fin 78) (43 : Fin 78) (66 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6644` (kalmanson). -/
theorem middleSource_h6644 :
    ((!((allOneRankAtom (sourceRanks P) 44 == allOneRankAtom (sourceRanks P) 43)) || ((allOneRankAtom (sourceRanks P) 67).ult (allOneRankAtom (sourceRanks P) 62)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (62 : Fin 78) (44 : Fin 78)
    (67 : Fin 78) (43 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (6 : Fin 13) (7 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (49 : Fin 78) (44 : Fin 78)
    (62 : Fin 78) (43 : Fin 78) (67 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6645` (kalmanson). -/
theorem middleSource_h6645 :
    ((!((allOneRankAtom (sourceRanks P) 62 == allOneRankAtom (sourceRanks P) 43)) || ((allOneRankAtom (sourceRanks P) 67).ult (allOneRankAtom (sourceRanks P) 44)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (44 : Fin 78) (62 : Fin 78)
    (67 : Fin 78) (43 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (6 : Fin 13) (7 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (49 : Fin 78) (44 : Fin 78)
    (62 : Fin 78) (43 : Fin 78) (67 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6646` (kalmanson). -/
theorem middleSource_h6646 :
    ((!((allOneRankAtom (sourceRanks P) 44 == allOneRankAtom (sourceRanks P) 49)) || ((allOneRankAtom (sourceRanks P) 57).ult (allOneRankAtom (sourceRanks P) 62)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (62 : Fin 78) (44 : Fin 78)
    (57 : Fin 78) (49 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (6 : Fin 13) (7 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (49 : Fin 78) (44 : Fin 78)
    (62 : Fin 78) (43 : Fin 78) (67 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6647` (kalmanson). -/
theorem middleSource_h6647 :
    ((!((allOneRankAtom (sourceRanks P) 44 == allOneRankAtom (sourceRanks P) 57)) || ((allOneRankAtom (sourceRanks P) 49).ult (allOneRankAtom (sourceRanks P) 62)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (62 : Fin 78) (44 : Fin 78)
    (49 : Fin 78) (57 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (6 : Fin 13) (7 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (49 : Fin 78) (44 : Fin 78)
    (62 : Fin 78) (43 : Fin 78) (67 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6648` (kalmanson). -/
theorem middleSource_h6648 :
    ((!((allOneRankAtom (sourceRanks P) 62 == allOneRankAtom (sourceRanks P) 49)) || ((allOneRankAtom (sourceRanks P) 57).ult (allOneRankAtom (sourceRanks P) 44)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (44 : Fin 78) (62 : Fin 78)
    (57 : Fin 78) (49 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (6 : Fin 13) (7 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (49 : Fin 78) (44 : Fin 78)
    (62 : Fin 78) (43 : Fin 78) (67 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6649` (kalmanson). -/
theorem middleSource_h6649 :
    ((!((allOneRankAtom (sourceRanks P) 62 == allOneRankAtom (sourceRanks P) 57)) || ((allOneRankAtom (sourceRanks P) 49).ult (allOneRankAtom (sourceRanks P) 44)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (44 : Fin 78) (62 : Fin 78)
    (49 : Fin 78) (57 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (6 : Fin 13) (7 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (49 : Fin 78) (44 : Fin 78)
    (62 : Fin 78) (43 : Fin 78) (67 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6650` (kalmanson). -/
theorem middleSource_h6650 :
    ((!((allOneRankAtom (sourceRanks P) 45 == allOneRankAtom (sourceRanks P) 43)) || ((allOneRankAtom (sourceRanks P) 68).ult (allOneRankAtom (sourceRanks P) 59)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (59 : Fin 78) (45 : Fin 78)
    (68 : Fin 78) (43 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (6 : Fin 13) (8 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (58 : Fin 78) (46 : Fin 78) (45 : Fin 78)
    (59 : Fin 78) (43 : Fin 78) (68 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6651` (kalmanson). -/
theorem middleSource_h6651 :
    ((!((allOneRankAtom (sourceRanks P) 45 == allOneRankAtom (sourceRanks P) 68)) || ((allOneRankAtom (sourceRanks P) 43).ult (allOneRankAtom (sourceRanks P) 59)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (59 : Fin 78) (45 : Fin 78)
    (43 : Fin 78) (68 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (6 : Fin 13) (8 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (58 : Fin 78) (46 : Fin 78) (45 : Fin 78)
    (59 : Fin 78) (43 : Fin 78) (68 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6652` (kalmanson). -/
theorem middleSource_h6652 :
    ((!((allOneRankAtom (sourceRanks P) 59 == allOneRankAtom (sourceRanks P) 43)) || ((allOneRankAtom (sourceRanks P) 68).ult (allOneRankAtom (sourceRanks P) 45)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (45 : Fin 78) (59 : Fin 78)
    (68 : Fin 78) (43 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (6 : Fin 13) (8 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (58 : Fin 78) (46 : Fin 78) (45 : Fin 78)
    (59 : Fin 78) (43 : Fin 78) (68 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6653` (kalmanson). -/
theorem middleSource_h6653 :
    ((!((allOneRankAtom (sourceRanks P) 59 == allOneRankAtom (sourceRanks P) 68)) || ((allOneRankAtom (sourceRanks P) 43).ult (allOneRankAtom (sourceRanks P) 45)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (45 : Fin 78) (59 : Fin 78)
    (43 : Fin 78) (68 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (6 : Fin 13) (8 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (58 : Fin 78) (46 : Fin 78) (45 : Fin 78)
    (59 : Fin 78) (43 : Fin 78) (68 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h6654` (kalmanson). -/
theorem middleSource_h6654 :
    ((!((allOneRankAtom (sourceRanks P) 45 == allOneRankAtom (sourceRanks P) 46)) || ((allOneRankAtom (sourceRanks P) 58).ult (allOneRankAtom (sourceRanks P) 59)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (59 : Fin 78) (45 : Fin 78)
    (58 : Fin 78) (46 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (6 : Fin 13) (8 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (58 : Fin 78) (46 : Fin 78) (45 : Fin 78)
    (59 : Fin 78) (43 : Fin 78) (68 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h6655` (kalmanson). -/
theorem middleSource_h6655 :
    ((!((allOneRankAtom (sourceRanks P) 45 == allOneRankAtom (sourceRanks P) 58)) || ((allOneRankAtom (sourceRanks P) 46).ult (allOneRankAtom (sourceRanks P) 59)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (59 : Fin 78) (45 : Fin 78)
    (46 : Fin 78) (58 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (4 : Fin 13) (6 : Fin 13) (8 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (58 : Fin 78) (46 : Fin 78) (45 : Fin 78)
    (59 : Fin 78) (43 : Fin 78) (68 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

end

end ATailExactFiveCard13AllOneSourceIngressScratch
end Problem97
