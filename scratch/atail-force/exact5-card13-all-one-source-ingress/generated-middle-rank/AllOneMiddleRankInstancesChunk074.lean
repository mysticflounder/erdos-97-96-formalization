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

/-- Candidate middle source assertion `h4736` (kalmanson). -/
theorem middleSource_h4736 :
    ((!((allOneRankAtom (sourceRanks P) 16 == allOneRankAtom (sourceRanks P) 43)) || ((allOneRankAtom (sourceRanks P) 19).ult (allOneRankAtom (sourceRanks P) 46)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (46 : Fin 78) (16 : Fin 78)
    (19 : Fin 78) (43 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (6 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (43 : Fin 78) (19 : Fin 78) (16 : Fin 78)
    (46 : Fin 78) (14 : Fin 78) (59 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4737` (kalmanson). -/
theorem middleSource_h4737 :
    ((!((allOneRankAtom (sourceRanks P) 46 == allOneRankAtom (sourceRanks P) 19)) || ((allOneRankAtom (sourceRanks P) 43).ult (allOneRankAtom (sourceRanks P) 16)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (16 : Fin 78) (46 : Fin 78)
    (43 : Fin 78) (19 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (6 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (43 : Fin 78) (19 : Fin 78) (16 : Fin 78)
    (46 : Fin 78) (14 : Fin 78) (59 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4738` (kalmanson). -/
theorem middleSource_h4738 :
    ((!((allOneRankAtom (sourceRanks P) 46 == allOneRankAtom (sourceRanks P) 43)) || ((allOneRankAtom (sourceRanks P) 19).ult (allOneRankAtom (sourceRanks P) 16)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (16 : Fin 78) (46 : Fin 78)
    (19 : Fin 78) (43 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (6 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (43 : Fin 78) (19 : Fin 78) (16 : Fin 78)
    (46 : Fin 78) (14 : Fin 78) (59 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4739` (kalmanson). -/
theorem middleSource_h4739 :
    ((!((allOneRankAtom (sourceRanks P) 16 == allOneRankAtom (sourceRanks P) 14)) || ((allOneRankAtom (sourceRanks P) 60).ult (allOneRankAtom (sourceRanks P) 47)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (47 : Fin 78) (16 : Fin 78)
    (60 : Fin 78) (14 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (6 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (43 : Fin 78) (20 : Fin 78) (16 : Fin 78)
    (47 : Fin 78) (14 : Fin 78) (60 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4740` (kalmanson). -/
theorem middleSource_h4740 :
    ((!((allOneRankAtom (sourceRanks P) 16 == allOneRankAtom (sourceRanks P) 60)) || ((allOneRankAtom (sourceRanks P) 14).ult (allOneRankAtom (sourceRanks P) 47)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (47 : Fin 78) (16 : Fin 78)
    (14 : Fin 78) (60 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (6 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (43 : Fin 78) (20 : Fin 78) (16 : Fin 78)
    (47 : Fin 78) (14 : Fin 78) (60 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4741` (kalmanson). -/
theorem middleSource_h4741 :
    ((!((allOneRankAtom (sourceRanks P) 47 == allOneRankAtom (sourceRanks P) 14)) || ((allOneRankAtom (sourceRanks P) 60).ult (allOneRankAtom (sourceRanks P) 16)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (16 : Fin 78) (47 : Fin 78)
    (60 : Fin 78) (14 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (6 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (43 : Fin 78) (20 : Fin 78) (16 : Fin 78)
    (47 : Fin 78) (14 : Fin 78) (60 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4742` (kalmanson). -/
theorem middleSource_h4742 :
    ((!((allOneRankAtom (sourceRanks P) 47 == allOneRankAtom (sourceRanks P) 60)) || ((allOneRankAtom (sourceRanks P) 14).ult (allOneRankAtom (sourceRanks P) 16)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (16 : Fin 78) (47 : Fin 78)
    (14 : Fin 78) (60 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (6 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (43 : Fin 78) (20 : Fin 78) (16 : Fin 78)
    (47 : Fin 78) (14 : Fin 78) (60 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4743` (kalmanson). -/
theorem middleSource_h4743 :
    ((!((allOneRankAtom (sourceRanks P) 16 == allOneRankAtom (sourceRanks P) 20)) || ((allOneRankAtom (sourceRanks P) 43).ult (allOneRankAtom (sourceRanks P) 47)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (47 : Fin 78) (16 : Fin 78)
    (43 : Fin 78) (20 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (6 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (43 : Fin 78) (20 : Fin 78) (16 : Fin 78)
    (47 : Fin 78) (14 : Fin 78) (60 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4744` (kalmanson). -/
theorem middleSource_h4744 :
    ((!((allOneRankAtom (sourceRanks P) 16 == allOneRankAtom (sourceRanks P) 43)) || ((allOneRankAtom (sourceRanks P) 20).ult (allOneRankAtom (sourceRanks P) 47)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (47 : Fin 78) (16 : Fin 78)
    (20 : Fin 78) (43 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (6 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (43 : Fin 78) (20 : Fin 78) (16 : Fin 78)
    (47 : Fin 78) (14 : Fin 78) (60 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4745` (kalmanson). -/
theorem middleSource_h4745 :
    ((!((allOneRankAtom (sourceRanks P) 47 == allOneRankAtom (sourceRanks P) 20)) || ((allOneRankAtom (sourceRanks P) 43).ult (allOneRankAtom (sourceRanks P) 16)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (16 : Fin 78) (47 : Fin 78)
    (43 : Fin 78) (20 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (6 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (43 : Fin 78) (20 : Fin 78) (16 : Fin 78)
    (47 : Fin 78) (14 : Fin 78) (60 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4746` (kalmanson). -/
theorem middleSource_h4746 :
    ((!((allOneRankAtom (sourceRanks P) 47 == allOneRankAtom (sourceRanks P) 43)) || ((allOneRankAtom (sourceRanks P) 20).ult (allOneRankAtom (sourceRanks P) 16)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (16 : Fin 78) (47 : Fin 78)
    (20 : Fin 78) (43 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (6 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (43 : Fin 78) (20 : Fin 78) (16 : Fin 78)
    (47 : Fin 78) (14 : Fin 78) (60 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4747` (kalmanson). -/
theorem middleSource_h4747 :
    ((!((allOneRankAtom (sourceRanks P) 16 == allOneRankAtom (sourceRanks P) 14)) || ((allOneRankAtom (sourceRanks P) 61).ult (allOneRankAtom (sourceRanks P) 48)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (48 : Fin 78) (16 : Fin 78)
    (61 : Fin 78) (14 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (6 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (43 : Fin 78) (21 : Fin 78) (16 : Fin 78)
    (48 : Fin 78) (14 : Fin 78) (61 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4748` (kalmanson). -/
theorem middleSource_h4748 :
    ((!((allOneRankAtom (sourceRanks P) 16 == allOneRankAtom (sourceRanks P) 61)) || ((allOneRankAtom (sourceRanks P) 14).ult (allOneRankAtom (sourceRanks P) 48)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (48 : Fin 78) (16 : Fin 78)
    (14 : Fin 78) (61 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (6 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (43 : Fin 78) (21 : Fin 78) (16 : Fin 78)
    (48 : Fin 78) (14 : Fin 78) (61 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4749` (kalmanson). -/
theorem middleSource_h4749 :
    ((!((allOneRankAtom (sourceRanks P) 48 == allOneRankAtom (sourceRanks P) 14)) || ((allOneRankAtom (sourceRanks P) 61).ult (allOneRankAtom (sourceRanks P) 16)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (16 : Fin 78) (48 : Fin 78)
    (61 : Fin 78) (14 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (6 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (43 : Fin 78) (21 : Fin 78) (16 : Fin 78)
    (48 : Fin 78) (14 : Fin 78) (61 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4750` (kalmanson). -/
theorem middleSource_h4750 :
    ((!((allOneRankAtom (sourceRanks P) 48 == allOneRankAtom (sourceRanks P) 61)) || ((allOneRankAtom (sourceRanks P) 14).ult (allOneRankAtom (sourceRanks P) 16)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (16 : Fin 78) (48 : Fin 78)
    (14 : Fin 78) (61 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (6 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (43 : Fin 78) (21 : Fin 78) (16 : Fin 78)
    (48 : Fin 78) (14 : Fin 78) (61 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4751` (kalmanson). -/
theorem middleSource_h4751 :
    ((!((allOneRankAtom (sourceRanks P) 16 == allOneRankAtom (sourceRanks P) 21)) || ((allOneRankAtom (sourceRanks P) 43).ult (allOneRankAtom (sourceRanks P) 48)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (48 : Fin 78) (16 : Fin 78)
    (43 : Fin 78) (21 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (6 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (43 : Fin 78) (21 : Fin 78) (16 : Fin 78)
    (48 : Fin 78) (14 : Fin 78) (61 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4752` (kalmanson). -/
theorem middleSource_h4752 :
    ((!((allOneRankAtom (sourceRanks P) 16 == allOneRankAtom (sourceRanks P) 43)) || ((allOneRankAtom (sourceRanks P) 21).ult (allOneRankAtom (sourceRanks P) 48)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (48 : Fin 78) (16 : Fin 78)
    (21 : Fin 78) (43 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (6 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (43 : Fin 78) (21 : Fin 78) (16 : Fin 78)
    (48 : Fin 78) (14 : Fin 78) (61 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4753` (kalmanson). -/
theorem middleSource_h4753 :
    ((!((allOneRankAtom (sourceRanks P) 48 == allOneRankAtom (sourceRanks P) 21)) || ((allOneRankAtom (sourceRanks P) 43).ult (allOneRankAtom (sourceRanks P) 16)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (16 : Fin 78) (48 : Fin 78)
    (43 : Fin 78) (21 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (6 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (43 : Fin 78) (21 : Fin 78) (16 : Fin 78)
    (48 : Fin 78) (14 : Fin 78) (61 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4754` (kalmanson). -/
theorem middleSource_h4754 :
    ((!((allOneRankAtom (sourceRanks P) 48 == allOneRankAtom (sourceRanks P) 43)) || ((allOneRankAtom (sourceRanks P) 21).ult (allOneRankAtom (sourceRanks P) 16)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (16 : Fin 78) (48 : Fin 78)
    (21 : Fin 78) (43 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (6 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (43 : Fin 78) (21 : Fin 78) (16 : Fin 78)
    (48 : Fin 78) (14 : Fin 78) (61 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4755` (kalmanson). -/
theorem middleSource_h4755 :
    ((!((allOneRankAtom (sourceRanks P) 16 == allOneRankAtom (sourceRanks P) 14)) || ((allOneRankAtom (sourceRanks P) 62).ult (allOneRankAtom (sourceRanks P) 49)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (49 : Fin 78) (16 : Fin 78)
    (62 : Fin 78) (14 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (6 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (43 : Fin 78) (22 : Fin 78) (16 : Fin 78)
    (49 : Fin 78) (14 : Fin 78) (62 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4756` (kalmanson). -/
theorem middleSource_h4756 :
    ((!((allOneRankAtom (sourceRanks P) 16 == allOneRankAtom (sourceRanks P) 62)) || ((allOneRankAtom (sourceRanks P) 14).ult (allOneRankAtom (sourceRanks P) 49)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (49 : Fin 78) (16 : Fin 78)
    (14 : Fin 78) (62 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (6 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (43 : Fin 78) (22 : Fin 78) (16 : Fin 78)
    (49 : Fin 78) (14 : Fin 78) (62 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4757` (kalmanson). -/
theorem middleSource_h4757 :
    ((!((allOneRankAtom (sourceRanks P) 49 == allOneRankAtom (sourceRanks P) 14)) || ((allOneRankAtom (sourceRanks P) 62).ult (allOneRankAtom (sourceRanks P) 16)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (16 : Fin 78) (49 : Fin 78)
    (62 : Fin 78) (14 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (6 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (43 : Fin 78) (22 : Fin 78) (16 : Fin 78)
    (49 : Fin 78) (14 : Fin 78) (62 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4758` (kalmanson). -/
theorem middleSource_h4758 :
    ((!((allOneRankAtom (sourceRanks P) 49 == allOneRankAtom (sourceRanks P) 62)) || ((allOneRankAtom (sourceRanks P) 14).ult (allOneRankAtom (sourceRanks P) 16)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (16 : Fin 78) (49 : Fin 78)
    (14 : Fin 78) (62 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (6 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (43 : Fin 78) (22 : Fin 78) (16 : Fin 78)
    (49 : Fin 78) (14 : Fin 78) (62 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4759` (kalmanson). -/
theorem middleSource_h4759 :
    ((!((allOneRankAtom (sourceRanks P) 16 == allOneRankAtom (sourceRanks P) 22)) || ((allOneRankAtom (sourceRanks P) 43).ult (allOneRankAtom (sourceRanks P) 49)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (49 : Fin 78) (16 : Fin 78)
    (43 : Fin 78) (22 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (6 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (43 : Fin 78) (22 : Fin 78) (16 : Fin 78)
    (49 : Fin 78) (14 : Fin 78) (62 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4760` (kalmanson). -/
theorem middleSource_h4760 :
    ((!((allOneRankAtom (sourceRanks P) 16 == allOneRankAtom (sourceRanks P) 43)) || ((allOneRankAtom (sourceRanks P) 22).ult (allOneRankAtom (sourceRanks P) 49)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (49 : Fin 78) (16 : Fin 78)
    (22 : Fin 78) (43 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (6 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (43 : Fin 78) (22 : Fin 78) (16 : Fin 78)
    (49 : Fin 78) (14 : Fin 78) (62 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4761` (kalmanson). -/
theorem middleSource_h4761 :
    ((!((allOneRankAtom (sourceRanks P) 49 == allOneRankAtom (sourceRanks P) 43)) || ((allOneRankAtom (sourceRanks P) 22).ult (allOneRankAtom (sourceRanks P) 16)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (16 : Fin 78) (49 : Fin 78)
    (22 : Fin 78) (43 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (6 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (43 : Fin 78) (22 : Fin 78) (16 : Fin 78)
    (49 : Fin 78) (14 : Fin 78) (62 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4762` (kalmanson). -/
theorem middleSource_h4762 :
    ((!((allOneRankAtom (sourceRanks P) 17 == allOneRankAtom (sourceRanks P) 14)) || ((allOneRankAtom (sourceRanks P) 63).ult (allOneRankAtom (sourceRanks P) 45)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (45 : Fin 78) (17 : Fin 78)
    (63 : Fin 78) (14 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (7 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (44 : Fin 78) (18 : Fin 78) (17 : Fin 78)
    (45 : Fin 78) (14 : Fin 78) (63 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4763` (kalmanson). -/
theorem middleSource_h4763 :
    ((!((allOneRankAtom (sourceRanks P) 45 == allOneRankAtom (sourceRanks P) 14)) || ((allOneRankAtom (sourceRanks P) 63).ult (allOneRankAtom (sourceRanks P) 17)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (17 : Fin 78) (45 : Fin 78)
    (63 : Fin 78) (14 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (7 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (44 : Fin 78) (18 : Fin 78) (17 : Fin 78)
    (45 : Fin 78) (14 : Fin 78) (63 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4764` (kalmanson). -/
theorem middleSource_h4764 :
    ((!((allOneRankAtom (sourceRanks P) 17 == allOneRankAtom (sourceRanks P) 18)) || ((allOneRankAtom (sourceRanks P) 44).ult (allOneRankAtom (sourceRanks P) 45)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (45 : Fin 78) (17 : Fin 78)
    (44 : Fin 78) (18 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (7 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (44 : Fin 78) (18 : Fin 78) (17 : Fin 78)
    (45 : Fin 78) (14 : Fin 78) (63 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4765` (kalmanson). -/
theorem middleSource_h4765 :
    ((!((allOneRankAtom (sourceRanks P) 17 == allOneRankAtom (sourceRanks P) 44)) || ((allOneRankAtom (sourceRanks P) 18).ult (allOneRankAtom (sourceRanks P) 45)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (45 : Fin 78) (17 : Fin 78)
    (18 : Fin 78) (44 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (7 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (44 : Fin 78) (18 : Fin 78) (17 : Fin 78)
    (45 : Fin 78) (14 : Fin 78) (63 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4766` (kalmanson). -/
theorem middleSource_h4766 :
    ((!((allOneRankAtom (sourceRanks P) 45 == allOneRankAtom (sourceRanks P) 18)) || ((allOneRankAtom (sourceRanks P) 44).ult (allOneRankAtom (sourceRanks P) 17)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (17 : Fin 78) (45 : Fin 78)
    (44 : Fin 78) (18 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (7 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (44 : Fin 78) (18 : Fin 78) (17 : Fin 78)
    (45 : Fin 78) (14 : Fin 78) (63 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4767` (kalmanson). -/
theorem middleSource_h4767 :
    ((!((allOneRankAtom (sourceRanks P) 45 == allOneRankAtom (sourceRanks P) 44)) || ((allOneRankAtom (sourceRanks P) 18).ult (allOneRankAtom (sourceRanks P) 17)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (17 : Fin 78) (45 : Fin 78)
    (18 : Fin 78) (44 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (7 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (44 : Fin 78) (18 : Fin 78) (17 : Fin 78)
    (45 : Fin 78) (14 : Fin 78) (63 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4768` (kalmanson). -/
theorem middleSource_h4768 :
    ((!((allOneRankAtom (sourceRanks P) 17 == allOneRankAtom (sourceRanks P) 14)) || ((allOneRankAtom (sourceRanks P) 64).ult (allOneRankAtom (sourceRanks P) 46)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (46 : Fin 78) (17 : Fin 78)
    (64 : Fin 78) (14 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (7 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (44 : Fin 78) (19 : Fin 78) (17 : Fin 78)
    (46 : Fin 78) (14 : Fin 78) (64 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4769` (kalmanson). -/
theorem middleSource_h4769 :
    ((!((allOneRankAtom (sourceRanks P) 17 == allOneRankAtom (sourceRanks P) 64)) || ((allOneRankAtom (sourceRanks P) 14).ult (allOneRankAtom (sourceRanks P) 46)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (46 : Fin 78) (17 : Fin 78)
    (14 : Fin 78) (64 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (7 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (44 : Fin 78) (19 : Fin 78) (17 : Fin 78)
    (46 : Fin 78) (14 : Fin 78) (64 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4770` (kalmanson). -/
theorem middleSource_h4770 :
    ((!((allOneRankAtom (sourceRanks P) 46 == allOneRankAtom (sourceRanks P) 14)) || ((allOneRankAtom (sourceRanks P) 64).ult (allOneRankAtom (sourceRanks P) 17)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (17 : Fin 78) (46 : Fin 78)
    (64 : Fin 78) (14 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (7 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (44 : Fin 78) (19 : Fin 78) (17 : Fin 78)
    (46 : Fin 78) (14 : Fin 78) (64 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4771` (kalmanson). -/
theorem middleSource_h4771 :
    ((!((allOneRankAtom (sourceRanks P) 46 == allOneRankAtom (sourceRanks P) 64)) || ((allOneRankAtom (sourceRanks P) 14).ult (allOneRankAtom (sourceRanks P) 17)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (17 : Fin 78) (46 : Fin 78)
    (14 : Fin 78) (64 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (7 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (44 : Fin 78) (19 : Fin 78) (17 : Fin 78)
    (46 : Fin 78) (14 : Fin 78) (64 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4772` (kalmanson). -/
theorem middleSource_h4772 :
    ((!((allOneRankAtom (sourceRanks P) 17 == allOneRankAtom (sourceRanks P) 19)) || ((allOneRankAtom (sourceRanks P) 44).ult (allOneRankAtom (sourceRanks P) 46)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (46 : Fin 78) (17 : Fin 78)
    (44 : Fin 78) (19 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (7 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (44 : Fin 78) (19 : Fin 78) (17 : Fin 78)
    (46 : Fin 78) (14 : Fin 78) (64 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4773` (kalmanson). -/
theorem middleSource_h4773 :
    ((!((allOneRankAtom (sourceRanks P) 46 == allOneRankAtom (sourceRanks P) 19)) || ((allOneRankAtom (sourceRanks P) 44).ult (allOneRankAtom (sourceRanks P) 17)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (17 : Fin 78) (46 : Fin 78)
    (44 : Fin 78) (19 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (7 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (44 : Fin 78) (19 : Fin 78) (17 : Fin 78)
    (46 : Fin 78) (14 : Fin 78) (64 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4774` (kalmanson). -/
theorem middleSource_h4774 :
    ((!((allOneRankAtom (sourceRanks P) 46 == allOneRankAtom (sourceRanks P) 44)) || ((allOneRankAtom (sourceRanks P) 19).ult (allOneRankAtom (sourceRanks P) 17)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (17 : Fin 78) (46 : Fin 78)
    (19 : Fin 78) (44 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (7 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (44 : Fin 78) (19 : Fin 78) (17 : Fin 78)
    (46 : Fin 78) (14 : Fin 78) (64 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4775` (kalmanson). -/
theorem middleSource_h4775 :
    ((!((allOneRankAtom (sourceRanks P) 17 == allOneRankAtom (sourceRanks P) 14)) || ((allOneRankAtom (sourceRanks P) 65).ult (allOneRankAtom (sourceRanks P) 47)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (47 : Fin 78) (17 : Fin 78)
    (65 : Fin 78) (14 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (7 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (44 : Fin 78) (20 : Fin 78) (17 : Fin 78)
    (47 : Fin 78) (14 : Fin 78) (65 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4776` (kalmanson). -/
theorem middleSource_h4776 :
    ((!((allOneRankAtom (sourceRanks P) 17 == allOneRankAtom (sourceRanks P) 65)) || ((allOneRankAtom (sourceRanks P) 14).ult (allOneRankAtom (sourceRanks P) 47)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (47 : Fin 78) (17 : Fin 78)
    (14 : Fin 78) (65 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (7 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (44 : Fin 78) (20 : Fin 78) (17 : Fin 78)
    (47 : Fin 78) (14 : Fin 78) (65 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4777` (kalmanson). -/
theorem middleSource_h4777 :
    ((!((allOneRankAtom (sourceRanks P) 47 == allOneRankAtom (sourceRanks P) 14)) || ((allOneRankAtom (sourceRanks P) 65).ult (allOneRankAtom (sourceRanks P) 17)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (17 : Fin 78) (47 : Fin 78)
    (65 : Fin 78) (14 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (7 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (44 : Fin 78) (20 : Fin 78) (17 : Fin 78)
    (47 : Fin 78) (14 : Fin 78) (65 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4778` (kalmanson). -/
theorem middleSource_h4778 :
    ((!((allOneRankAtom (sourceRanks P) 47 == allOneRankAtom (sourceRanks P) 65)) || ((allOneRankAtom (sourceRanks P) 14).ult (allOneRankAtom (sourceRanks P) 17)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (17 : Fin 78) (47 : Fin 78)
    (14 : Fin 78) (65 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (7 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (44 : Fin 78) (20 : Fin 78) (17 : Fin 78)
    (47 : Fin 78) (14 : Fin 78) (65 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4779` (kalmanson). -/
theorem middleSource_h4779 :
    ((!((allOneRankAtom (sourceRanks P) 17 == allOneRankAtom (sourceRanks P) 20)) || ((allOneRankAtom (sourceRanks P) 44).ult (allOneRankAtom (sourceRanks P) 47)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (47 : Fin 78) (17 : Fin 78)
    (44 : Fin 78) (20 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (7 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (44 : Fin 78) (20 : Fin 78) (17 : Fin 78)
    (47 : Fin 78) (14 : Fin 78) (65 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4780` (kalmanson). -/
theorem middleSource_h4780 :
    ((!((allOneRankAtom (sourceRanks P) 17 == allOneRankAtom (sourceRanks P) 44)) || ((allOneRankAtom (sourceRanks P) 20).ult (allOneRankAtom (sourceRanks P) 47)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (47 : Fin 78) (17 : Fin 78)
    (20 : Fin 78) (44 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (7 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (44 : Fin 78) (20 : Fin 78) (17 : Fin 78)
    (47 : Fin 78) (14 : Fin 78) (65 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4781` (kalmanson). -/
theorem middleSource_h4781 :
    ((!((allOneRankAtom (sourceRanks P) 47 == allOneRankAtom (sourceRanks P) 20)) || ((allOneRankAtom (sourceRanks P) 44).ult (allOneRankAtom (sourceRanks P) 17)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (17 : Fin 78) (47 : Fin 78)
    (44 : Fin 78) (20 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (7 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (44 : Fin 78) (20 : Fin 78) (17 : Fin 78)
    (47 : Fin 78) (14 : Fin 78) (65 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4782` (kalmanson). -/
theorem middleSource_h4782 :
    ((!((allOneRankAtom (sourceRanks P) 47 == allOneRankAtom (sourceRanks P) 44)) || ((allOneRankAtom (sourceRanks P) 20).ult (allOneRankAtom (sourceRanks P) 17)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (17 : Fin 78) (47 : Fin 78)
    (20 : Fin 78) (44 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (7 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (44 : Fin 78) (20 : Fin 78) (17 : Fin 78)
    (47 : Fin 78) (14 : Fin 78) (65 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4783` (kalmanson). -/
theorem middleSource_h4783 :
    ((!((allOneRankAtom (sourceRanks P) 17 == allOneRankAtom (sourceRanks P) 14)) || ((allOneRankAtom (sourceRanks P) 66).ult (allOneRankAtom (sourceRanks P) 48)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (48 : Fin 78) (17 : Fin 78)
    (66 : Fin 78) (14 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (7 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (44 : Fin 78) (21 : Fin 78) (17 : Fin 78)
    (48 : Fin 78) (14 : Fin 78) (66 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4784` (kalmanson). -/
theorem middleSource_h4784 :
    ((!((allOneRankAtom (sourceRanks P) 48 == allOneRankAtom (sourceRanks P) 14)) || ((allOneRankAtom (sourceRanks P) 66).ult (allOneRankAtom (sourceRanks P) 17)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (17 : Fin 78) (48 : Fin 78)
    (66 : Fin 78) (14 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (7 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (44 : Fin 78) (21 : Fin 78) (17 : Fin 78)
    (48 : Fin 78) (14 : Fin 78) (66 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4785` (kalmanson). -/
theorem middleSource_h4785 :
    ((!((allOneRankAtom (sourceRanks P) 48 == allOneRankAtom (sourceRanks P) 66)) || ((allOneRankAtom (sourceRanks P) 14).ult (allOneRankAtom (sourceRanks P) 17)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (17 : Fin 78) (48 : Fin 78)
    (14 : Fin 78) (66 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (7 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (44 : Fin 78) (21 : Fin 78) (17 : Fin 78)
    (48 : Fin 78) (14 : Fin 78) (66 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4786` (kalmanson). -/
theorem middleSource_h4786 :
    ((!((allOneRankAtom (sourceRanks P) 17 == allOneRankAtom (sourceRanks P) 21)) || ((allOneRankAtom (sourceRanks P) 44).ult (allOneRankAtom (sourceRanks P) 48)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (48 : Fin 78) (17 : Fin 78)
    (44 : Fin 78) (21 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (7 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (44 : Fin 78) (21 : Fin 78) (17 : Fin 78)
    (48 : Fin 78) (14 : Fin 78) (66 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4787` (kalmanson). -/
theorem middleSource_h4787 :
    ((!((allOneRankAtom (sourceRanks P) 17 == allOneRankAtom (sourceRanks P) 44)) || ((allOneRankAtom (sourceRanks P) 21).ult (allOneRankAtom (sourceRanks P) 48)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (48 : Fin 78) (17 : Fin 78)
    (21 : Fin 78) (44 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (7 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (44 : Fin 78) (21 : Fin 78) (17 : Fin 78)
    (48 : Fin 78) (14 : Fin 78) (66 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4788` (kalmanson). -/
theorem middleSource_h4788 :
    ((!((allOneRankAtom (sourceRanks P) 48 == allOneRankAtom (sourceRanks P) 21)) || ((allOneRankAtom (sourceRanks P) 44).ult (allOneRankAtom (sourceRanks P) 17)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (17 : Fin 78) (48 : Fin 78)
    (44 : Fin 78) (21 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (7 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (44 : Fin 78) (21 : Fin 78) (17 : Fin 78)
    (48 : Fin 78) (14 : Fin 78) (66 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4789` (kalmanson). -/
theorem middleSource_h4789 :
    ((!((allOneRankAtom (sourceRanks P) 48 == allOneRankAtom (sourceRanks P) 44)) || ((allOneRankAtom (sourceRanks P) 21).ult (allOneRankAtom (sourceRanks P) 17)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (17 : Fin 78) (48 : Fin 78)
    (21 : Fin 78) (44 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (7 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (44 : Fin 78) (21 : Fin 78) (17 : Fin 78)
    (48 : Fin 78) (14 : Fin 78) (66 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4790` (kalmanson). -/
theorem middleSource_h4790 :
    ((!((allOneRankAtom (sourceRanks P) 17 == allOneRankAtom (sourceRanks P) 14)) || ((allOneRankAtom (sourceRanks P) 67).ult (allOneRankAtom (sourceRanks P) 49)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (49 : Fin 78) (17 : Fin 78)
    (67 : Fin 78) (14 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (7 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (44 : Fin 78) (22 : Fin 78) (17 : Fin 78)
    (49 : Fin 78) (14 : Fin 78) (67 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4791` (kalmanson). -/
theorem middleSource_h4791 :
    ((!((allOneRankAtom (sourceRanks P) 17 == allOneRankAtom (sourceRanks P) 67)) || ((allOneRankAtom (sourceRanks P) 14).ult (allOneRankAtom (sourceRanks P) 49)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (49 : Fin 78) (17 : Fin 78)
    (14 : Fin 78) (67 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (7 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (44 : Fin 78) (22 : Fin 78) (17 : Fin 78)
    (49 : Fin 78) (14 : Fin 78) (67 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4792` (kalmanson). -/
theorem middleSource_h4792 :
    ((!((allOneRankAtom (sourceRanks P) 49 == allOneRankAtom (sourceRanks P) 14)) || ((allOneRankAtom (sourceRanks P) 67).ult (allOneRankAtom (sourceRanks P) 17)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (17 : Fin 78) (49 : Fin 78)
    (67 : Fin 78) (14 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (7 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (44 : Fin 78) (22 : Fin 78) (17 : Fin 78)
    (49 : Fin 78) (14 : Fin 78) (67 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4793` (kalmanson). -/
theorem middleSource_h4793 :
    ((!((allOneRankAtom (sourceRanks P) 17 == allOneRankAtom (sourceRanks P) 22)) || ((allOneRankAtom (sourceRanks P) 44).ult (allOneRankAtom (sourceRanks P) 49)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (49 : Fin 78) (17 : Fin 78)
    (44 : Fin 78) (22 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (7 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (44 : Fin 78) (22 : Fin 78) (17 : Fin 78)
    (49 : Fin 78) (14 : Fin 78) (67 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4794` (kalmanson). -/
theorem middleSource_h4794 :
    ((!((allOneRankAtom (sourceRanks P) 17 == allOneRankAtom (sourceRanks P) 44)) || ((allOneRankAtom (sourceRanks P) 22).ult (allOneRankAtom (sourceRanks P) 49)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (49 : Fin 78) (17 : Fin 78)
    (22 : Fin 78) (44 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (7 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (44 : Fin 78) (22 : Fin 78) (17 : Fin 78)
    (49 : Fin 78) (14 : Fin 78) (67 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4795` (kalmanson). -/
theorem middleSource_h4795 :
    ((!((allOneRankAtom (sourceRanks P) 49 == allOneRankAtom (sourceRanks P) 44)) || ((allOneRankAtom (sourceRanks P) 22).ult (allOneRankAtom (sourceRanks P) 17)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (17 : Fin 78) (49 : Fin 78)
    (22 : Fin 78) (44 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (7 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (44 : Fin 78) (22 : Fin 78) (17 : Fin 78)
    (49 : Fin 78) (14 : Fin 78) (67 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4796` (kalmanson). -/
theorem middleSource_h4796 :
    ((!((allOneRankAtom (sourceRanks P) 18 == allOneRankAtom (sourceRanks P) 14)) || ((allOneRankAtom (sourceRanks P) 68).ult (allOneRankAtom (sourceRanks P) 46)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (46 : Fin 78) (18 : Fin 78)
    (68 : Fin 78) (14 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (8 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (45 : Fin 78) (19 : Fin 78) (18 : Fin 78)
    (46 : Fin 78) (14 : Fin 78) (68 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4797` (kalmanson). -/
theorem middleSource_h4797 :
    ((!((allOneRankAtom (sourceRanks P) 18 == allOneRankAtom (sourceRanks P) 68)) || ((allOneRankAtom (sourceRanks P) 14).ult (allOneRankAtom (sourceRanks P) 46)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (46 : Fin 78) (18 : Fin 78)
    (14 : Fin 78) (68 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (8 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (45 : Fin 78) (19 : Fin 78) (18 : Fin 78)
    (46 : Fin 78) (14 : Fin 78) (68 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4798` (kalmanson). -/
theorem middleSource_h4798 :
    ((!((allOneRankAtom (sourceRanks P) 46 == allOneRankAtom (sourceRanks P) 14)) || ((allOneRankAtom (sourceRanks P) 68).ult (allOneRankAtom (sourceRanks P) 18)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (18 : Fin 78) (46 : Fin 78)
    (68 : Fin 78) (14 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (8 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (45 : Fin 78) (19 : Fin 78) (18 : Fin 78)
    (46 : Fin 78) (14 : Fin 78) (68 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4799` (kalmanson). -/
theorem middleSource_h4799 :
    ((!((allOneRankAtom (sourceRanks P) 46 == allOneRankAtom (sourceRanks P) 68)) || ((allOneRankAtom (sourceRanks P) 14).ult (allOneRankAtom (sourceRanks P) 18)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (18 : Fin 78) (46 : Fin 78)
    (14 : Fin 78) (68 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (4 : Fin 13) (8 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (45 : Fin 78) (19 : Fin 78) (18 : Fin 78)
    (46 : Fin 78) (14 : Fin 78) (68 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

end

end ATailExactFiveCard13AllOneSourceIngressScratch
end Problem97
