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

/-- Candidate middle source assertion `h2880` (kalmanson). -/
theorem middleSource_h2880 :
    ((!((allOneRankAtom (sourceRanks P) 1 == allOneRankAtom (sourceRanks P) 28)) || ((allOneRankAtom (sourceRanks P) 0).ult (allOneRankAtom (sourceRanks P) 18)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (18 : Fin 78) (1 : Fin 78)
    (0 : Fin 78) (28 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (2 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (12 : Fin 78) (7 : Fin 78) (1 : Fin 78)
    (18 : Fin 78) (0 : Fin 78) (28 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h2881` (kalmanson). -/
theorem middleSource_h2881 :
    ((!((allOneRankAtom (sourceRanks P) 18 == allOneRankAtom (sourceRanks P) 0)) || ((allOneRankAtom (sourceRanks P) 28).ult (allOneRankAtom (sourceRanks P) 1)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (1 : Fin 78) (18 : Fin 78)
    (28 : Fin 78) (0 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (2 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (12 : Fin 78) (7 : Fin 78) (1 : Fin 78)
    (18 : Fin 78) (0 : Fin 78) (28 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h2882` (kalmanson). -/
theorem middleSource_h2882 :
    ((!((allOneRankAtom (sourceRanks P) 18 == allOneRankAtom (sourceRanks P) 28)) || ((allOneRankAtom (sourceRanks P) 0).ult (allOneRankAtom (sourceRanks P) 1)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (1 : Fin 78) (18 : Fin 78)
    (0 : Fin 78) (28 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (2 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (12 : Fin 78) (7 : Fin 78) (1 : Fin 78)
    (18 : Fin 78) (0 : Fin 78) (28 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h2883` (kalmanson). -/
theorem middleSource_h2883 :
    ((!((allOneRankAtom (sourceRanks P) 1 == allOneRankAtom (sourceRanks P) 12)) || ((allOneRankAtom (sourceRanks P) 7).ult (allOneRankAtom (sourceRanks P) 18)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (18 : Fin 78) (1 : Fin 78)
    (7 : Fin 78) (12 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (2 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (12 : Fin 78) (7 : Fin 78) (1 : Fin 78)
    (18 : Fin 78) (0 : Fin 78) (28 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h2884` (kalmanson). -/
theorem middleSource_h2884 :
    ((!((allOneRankAtom (sourceRanks P) 18 == allOneRankAtom (sourceRanks P) 7)) || ((allOneRankAtom (sourceRanks P) 12).ult (allOneRankAtom (sourceRanks P) 1)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (1 : Fin 78) (18 : Fin 78)
    (12 : Fin 78) (7 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (2 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (12 : Fin 78) (7 : Fin 78) (1 : Fin 78)
    (18 : Fin 78) (0 : Fin 78) (28 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h2885` (kalmanson). -/
theorem middleSource_h2885 :
    ((!((allOneRankAtom (sourceRanks P) 18 == allOneRankAtom (sourceRanks P) 12)) || ((allOneRankAtom (sourceRanks P) 7).ult (allOneRankAtom (sourceRanks P) 1)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (1 : Fin 78) (18 : Fin 78)
    (7 : Fin 78) (12 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (2 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (12 : Fin 78) (7 : Fin 78) (1 : Fin 78)
    (18 : Fin 78) (0 : Fin 78) (28 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h2886` (kalmanson). -/
theorem middleSource_h2886 :
    ((!((allOneRankAtom (sourceRanks P) 1 == allOneRankAtom (sourceRanks P) 29)) || ((allOneRankAtom (sourceRanks P) 0).ult (allOneRankAtom (sourceRanks P) 19)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (19 : Fin 78) (1 : Fin 78)
    (0 : Fin 78) (29 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (2 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (12 : Fin 78) (8 : Fin 78) (1 : Fin 78)
    (19 : Fin 78) (0 : Fin 78) (29 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h2887` (kalmanson). -/
theorem middleSource_h2887 :
    ((!((allOneRankAtom (sourceRanks P) 19 == allOneRankAtom (sourceRanks P) 0)) || ((allOneRankAtom (sourceRanks P) 29).ult (allOneRankAtom (sourceRanks P) 1)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (1 : Fin 78) (19 : Fin 78)
    (29 : Fin 78) (0 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (2 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (12 : Fin 78) (8 : Fin 78) (1 : Fin 78)
    (19 : Fin 78) (0 : Fin 78) (29 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h2888` (kalmanson). -/
theorem middleSource_h2888 :
    ((!((allOneRankAtom (sourceRanks P) 1 == allOneRankAtom (sourceRanks P) 8)) || ((allOneRankAtom (sourceRanks P) 12).ult (allOneRankAtom (sourceRanks P) 19)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (19 : Fin 78) (1 : Fin 78)
    (12 : Fin 78) (8 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (2 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (12 : Fin 78) (8 : Fin 78) (1 : Fin 78)
    (19 : Fin 78) (0 : Fin 78) (29 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h2889` (kalmanson). -/
theorem middleSource_h2889 :
    ((!((allOneRankAtom (sourceRanks P) 1 == allOneRankAtom (sourceRanks P) 12)) || ((allOneRankAtom (sourceRanks P) 8).ult (allOneRankAtom (sourceRanks P) 19)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (19 : Fin 78) (1 : Fin 78)
    (8 : Fin 78) (12 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (2 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (12 : Fin 78) (8 : Fin 78) (1 : Fin 78)
    (19 : Fin 78) (0 : Fin 78) (29 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h2890` (kalmanson). -/
theorem middleSource_h2890 :
    ((!((allOneRankAtom (sourceRanks P) 19 == allOneRankAtom (sourceRanks P) 8)) || ((allOneRankAtom (sourceRanks P) 12).ult (allOneRankAtom (sourceRanks P) 1)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (1 : Fin 78) (19 : Fin 78)
    (12 : Fin 78) (8 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (2 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (12 : Fin 78) (8 : Fin 78) (1 : Fin 78)
    (19 : Fin 78) (0 : Fin 78) (29 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h2891` (kalmanson). -/
theorem middleSource_h2891 :
    ((!((allOneRankAtom (sourceRanks P) 19 == allOneRankAtom (sourceRanks P) 12)) || ((allOneRankAtom (sourceRanks P) 8).ult (allOneRankAtom (sourceRanks P) 1)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (1 : Fin 78) (19 : Fin 78)
    (8 : Fin 78) (12 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (2 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (12 : Fin 78) (8 : Fin 78) (1 : Fin 78)
    (19 : Fin 78) (0 : Fin 78) (29 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h2892` (kalmanson). -/
theorem middleSource_h2892 :
    ((!((allOneRankAtom (sourceRanks P) 1 == allOneRankAtom (sourceRanks P) 30)) || ((allOneRankAtom (sourceRanks P) 0).ult (allOneRankAtom (sourceRanks P) 20)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (20 : Fin 78) (1 : Fin 78)
    (0 : Fin 78) (30 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (2 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (12 : Fin 78) (9 : Fin 78) (1 : Fin 78)
    (20 : Fin 78) (0 : Fin 78) (30 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h2893` (kalmanson). -/
theorem middleSource_h2893 :
    ((!((allOneRankAtom (sourceRanks P) 20 == allOneRankAtom (sourceRanks P) 0)) || ((allOneRankAtom (sourceRanks P) 30).ult (allOneRankAtom (sourceRanks P) 1)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (1 : Fin 78) (20 : Fin 78)
    (30 : Fin 78) (0 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (2 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (12 : Fin 78) (9 : Fin 78) (1 : Fin 78)
    (20 : Fin 78) (0 : Fin 78) (30 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h2894` (kalmanson). -/
theorem middleSource_h2894 :
    ((!((allOneRankAtom (sourceRanks P) 1 == allOneRankAtom (sourceRanks P) 9)) || ((allOneRankAtom (sourceRanks P) 12).ult (allOneRankAtom (sourceRanks P) 20)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (20 : Fin 78) (1 : Fin 78)
    (12 : Fin 78) (9 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (2 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (12 : Fin 78) (9 : Fin 78) (1 : Fin 78)
    (20 : Fin 78) (0 : Fin 78) (30 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h2895` (kalmanson). -/
theorem middleSource_h2895 :
    ((!((allOneRankAtom (sourceRanks P) 1 == allOneRankAtom (sourceRanks P) 12)) || ((allOneRankAtom (sourceRanks P) 9).ult (allOneRankAtom (sourceRanks P) 20)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (20 : Fin 78) (1 : Fin 78)
    (9 : Fin 78) (12 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (2 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (12 : Fin 78) (9 : Fin 78) (1 : Fin 78)
    (20 : Fin 78) (0 : Fin 78) (30 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h2896` (kalmanson). -/
theorem middleSource_h2896 :
    ((!((allOneRankAtom (sourceRanks P) 20 == allOneRankAtom (sourceRanks P) 9)) || ((allOneRankAtom (sourceRanks P) 12).ult (allOneRankAtom (sourceRanks P) 1)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (1 : Fin 78) (20 : Fin 78)
    (12 : Fin 78) (9 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (2 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (12 : Fin 78) (9 : Fin 78) (1 : Fin 78)
    (20 : Fin 78) (0 : Fin 78) (30 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h2897` (kalmanson). -/
theorem middleSource_h2897 :
    ((!((allOneRankAtom (sourceRanks P) 20 == allOneRankAtom (sourceRanks P) 12)) || ((allOneRankAtom (sourceRanks P) 9).ult (allOneRankAtom (sourceRanks P) 1)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (1 : Fin 78) (20 : Fin 78)
    (9 : Fin 78) (12 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (2 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (12 : Fin 78) (9 : Fin 78) (1 : Fin 78)
    (20 : Fin 78) (0 : Fin 78) (30 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h2898` (kalmanson). -/
theorem middleSource_h2898 :
    ((!((allOneRankAtom (sourceRanks P) 1 == allOneRankAtom (sourceRanks P) 31)) || ((allOneRankAtom (sourceRanks P) 0).ult (allOneRankAtom (sourceRanks P) 21)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (21 : Fin 78) (1 : Fin 78)
    (0 : Fin 78) (31 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (2 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (12 : Fin 78) (10 : Fin 78) (1 : Fin 78)
    (21 : Fin 78) (0 : Fin 78) (31 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h2899` (kalmanson). -/
theorem middleSource_h2899 :
    ((!((allOneRankAtom (sourceRanks P) 21 == allOneRankAtom (sourceRanks P) 0)) || ((allOneRankAtom (sourceRanks P) 31).ult (allOneRankAtom (sourceRanks P) 1)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (1 : Fin 78) (21 : Fin 78)
    (31 : Fin 78) (0 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (2 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (12 : Fin 78) (10 : Fin 78) (1 : Fin 78)
    (21 : Fin 78) (0 : Fin 78) (31 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h2900` (kalmanson). -/
theorem middleSource_h2900 :
    ((!((allOneRankAtom (sourceRanks P) 1 == allOneRankAtom (sourceRanks P) 12)) || ((allOneRankAtom (sourceRanks P) 10).ult (allOneRankAtom (sourceRanks P) 21)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (21 : Fin 78) (1 : Fin 78)
    (10 : Fin 78) (12 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (2 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (12 : Fin 78) (10 : Fin 78) (1 : Fin 78)
    (21 : Fin 78) (0 : Fin 78) (31 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h2901` (kalmanson). -/
theorem middleSource_h2901 :
    ((!((allOneRankAtom (sourceRanks P) 21 == allOneRankAtom (sourceRanks P) 10)) || ((allOneRankAtom (sourceRanks P) 12).ult (allOneRankAtom (sourceRanks P) 1)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (1 : Fin 78) (21 : Fin 78)
    (12 : Fin 78) (10 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (2 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (12 : Fin 78) (10 : Fin 78) (1 : Fin 78)
    (21 : Fin 78) (0 : Fin 78) (31 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h2902` (kalmanson). -/
theorem middleSource_h2902 :
    ((!((allOneRankAtom (sourceRanks P) 21 == allOneRankAtom (sourceRanks P) 12)) || ((allOneRankAtom (sourceRanks P) 10).ult (allOneRankAtom (sourceRanks P) 1)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (1 : Fin 78) (21 : Fin 78)
    (10 : Fin 78) (12 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (2 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (12 : Fin 78) (10 : Fin 78) (1 : Fin 78)
    (21 : Fin 78) (0 : Fin 78) (31 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h2903` (kalmanson). -/
theorem middleSource_h2903 :
    ((!((allOneRankAtom (sourceRanks P) 1 == allOneRankAtom (sourceRanks P) 32)) || ((allOneRankAtom (sourceRanks P) 0).ult (allOneRankAtom (sourceRanks P) 22)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (22 : Fin 78) (1 : Fin 78)
    (0 : Fin 78) (32 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (2 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (12 : Fin 78) (11 : Fin 78) (1 : Fin 78)
    (22 : Fin 78) (0 : Fin 78) (32 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h2904` (kalmanson). -/
theorem middleSource_h2904 :
    ((!((allOneRankAtom (sourceRanks P) 22 == allOneRankAtom (sourceRanks P) 0)) || ((allOneRankAtom (sourceRanks P) 32).ult (allOneRankAtom (sourceRanks P) 1)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (1 : Fin 78) (22 : Fin 78)
    (32 : Fin 78) (0 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (2 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (12 : Fin 78) (11 : Fin 78) (1 : Fin 78)
    (22 : Fin 78) (0 : Fin 78) (32 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h2905` (kalmanson). -/
theorem middleSource_h2905 :
    ((!((allOneRankAtom (sourceRanks P) 1 == allOneRankAtom (sourceRanks P) 11)) || ((allOneRankAtom (sourceRanks P) 12).ult (allOneRankAtom (sourceRanks P) 22)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (22 : Fin 78) (1 : Fin 78)
    (12 : Fin 78) (11 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (2 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (12 : Fin 78) (11 : Fin 78) (1 : Fin 78)
    (22 : Fin 78) (0 : Fin 78) (32 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h2906` (kalmanson). -/
theorem middleSource_h2906 :
    ((!((allOneRankAtom (sourceRanks P) 1 == allOneRankAtom (sourceRanks P) 12)) || ((allOneRankAtom (sourceRanks P) 11).ult (allOneRankAtom (sourceRanks P) 22)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (22 : Fin 78) (1 : Fin 78)
    (11 : Fin 78) (12 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (2 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (12 : Fin 78) (11 : Fin 78) (1 : Fin 78)
    (22 : Fin 78) (0 : Fin 78) (32 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h2907` (kalmanson). -/
theorem middleSource_h2907 :
    ((!((allOneRankAtom (sourceRanks P) 22 == allOneRankAtom (sourceRanks P) 11)) || ((allOneRankAtom (sourceRanks P) 12).ult (allOneRankAtom (sourceRanks P) 1)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (1 : Fin 78) (22 : Fin 78)
    (12 : Fin 78) (11 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (2 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (12 : Fin 78) (11 : Fin 78) (1 : Fin 78)
    (22 : Fin 78) (0 : Fin 78) (32 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h2908` (kalmanson). -/
theorem middleSource_h2908 :
    ((!((allOneRankAtom (sourceRanks P) 22 == allOneRankAtom (sourceRanks P) 12)) || ((allOneRankAtom (sourceRanks P) 11).ult (allOneRankAtom (sourceRanks P) 1)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (1 : Fin 78) (22 : Fin 78)
    (11 : Fin 78) (12 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (2 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (12 : Fin 78) (11 : Fin 78) (1 : Fin 78)
    (22 : Fin 78) (0 : Fin 78) (32 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h2909` (kalmanson). -/
theorem middleSource_h2909 :
    ((!((allOneRankAtom (sourceRanks P) 14 == allOneRankAtom (sourceRanks P) 3)) || ((allOneRankAtom (sourceRanks P) 13).ult (allOneRankAtom (sourceRanks P) 2)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (2 : Fin 78) (14 : Fin 78)
    (13 : Fin 78) (3 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (3 : Fin 13) (4 : Fin 13)
    (by decide) (by decide) (by decide)
    (13 : Fin 78) (3 : Fin 78) (2 : Fin 78)
    (14 : Fin 78) (0 : Fin 78) (33 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h2910` (kalmanson). -/
theorem middleSource_h2910 :
    ((!((allOneRankAtom (sourceRanks P) 14 == allOneRankAtom (sourceRanks P) 13)) || ((allOneRankAtom (sourceRanks P) 3).ult (allOneRankAtom (sourceRanks P) 2)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (2 : Fin 78) (14 : Fin 78)
    (3 : Fin 78) (13 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (3 : Fin 13) (4 : Fin 13)
    (by decide) (by decide) (by decide)
    (13 : Fin 78) (3 : Fin 78) (2 : Fin 78)
    (14 : Fin 78) (0 : Fin 78) (33 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h2911` (kalmanson). -/
theorem middleSource_h2911 :
    ((!((allOneRankAtom (sourceRanks P) 15 == allOneRankAtom (sourceRanks P) 0)) || ((allOneRankAtom (sourceRanks P) 34).ult (allOneRankAtom (sourceRanks P) 2)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (2 : Fin 78) (15 : Fin 78)
    (34 : Fin 78) (0 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (3 : Fin 13) (5 : Fin 13)
    (by decide) (by decide) (by decide)
    (13 : Fin 78) (4 : Fin 78) (2 : Fin 78)
    (15 : Fin 78) (0 : Fin 78) (34 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h2912` (kalmanson). -/
theorem middleSource_h2912 :
    ((!((allOneRankAtom (sourceRanks P) 2 == allOneRankAtom (sourceRanks P) 4)) || ((allOneRankAtom (sourceRanks P) 13).ult (allOneRankAtom (sourceRanks P) 15)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (15 : Fin 78) (2 : Fin 78)
    (13 : Fin 78) (4 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (3 : Fin 13) (5 : Fin 13)
    (by decide) (by decide) (by decide)
    (13 : Fin 78) (4 : Fin 78) (2 : Fin 78)
    (15 : Fin 78) (0 : Fin 78) (34 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h2913` (kalmanson). -/
theorem middleSource_h2913 :
    ((!((allOneRankAtom (sourceRanks P) 15 == allOneRankAtom (sourceRanks P) 4)) || ((allOneRankAtom (sourceRanks P) 13).ult (allOneRankAtom (sourceRanks P) 2)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (2 : Fin 78) (15 : Fin 78)
    (13 : Fin 78) (4 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (3 : Fin 13) (5 : Fin 13)
    (by decide) (by decide) (by decide)
    (13 : Fin 78) (4 : Fin 78) (2 : Fin 78)
    (15 : Fin 78) (0 : Fin 78) (34 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h2914` (kalmanson). -/
theorem middleSource_h2914 :
    ((!((allOneRankAtom (sourceRanks P) 15 == allOneRankAtom (sourceRanks P) 13)) || ((allOneRankAtom (sourceRanks P) 4).ult (allOneRankAtom (sourceRanks P) 2)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (2 : Fin 78) (15 : Fin 78)
    (4 : Fin 78) (13 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (3 : Fin 13) (5 : Fin 13)
    (by decide) (by decide) (by decide)
    (13 : Fin 78) (4 : Fin 78) (2 : Fin 78)
    (15 : Fin 78) (0 : Fin 78) (34 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h2915` (kalmanson). -/
theorem middleSource_h2915 :
    ((!((allOneRankAtom (sourceRanks P) 16 == allOneRankAtom (sourceRanks P) 0)) || ((allOneRankAtom (sourceRanks P) 35).ult (allOneRankAtom (sourceRanks P) 2)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (2 : Fin 78) (16 : Fin 78)
    (35 : Fin 78) (0 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (3 : Fin 13) (6 : Fin 13)
    (by decide) (by decide) (by decide)
    (13 : Fin 78) (5 : Fin 78) (2 : Fin 78)
    (16 : Fin 78) (0 : Fin 78) (35 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h2916` (kalmanson). -/
theorem middleSource_h2916 :
    ((!((allOneRankAtom (sourceRanks P) 2 == allOneRankAtom (sourceRanks P) 5)) || ((allOneRankAtom (sourceRanks P) 13).ult (allOneRankAtom (sourceRanks P) 16)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (16 : Fin 78) (2 : Fin 78)
    (13 : Fin 78) (5 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (3 : Fin 13) (6 : Fin 13)
    (by decide) (by decide) (by decide)
    (13 : Fin 78) (5 : Fin 78) (2 : Fin 78)
    (16 : Fin 78) (0 : Fin 78) (35 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h2917` (kalmanson). -/
theorem middleSource_h2917 :
    ((!((allOneRankAtom (sourceRanks P) 16 == allOneRankAtom (sourceRanks P) 5)) || ((allOneRankAtom (sourceRanks P) 13).ult (allOneRankAtom (sourceRanks P) 2)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (2 : Fin 78) (16 : Fin 78)
    (13 : Fin 78) (5 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (3 : Fin 13) (6 : Fin 13)
    (by decide) (by decide) (by decide)
    (13 : Fin 78) (5 : Fin 78) (2 : Fin 78)
    (16 : Fin 78) (0 : Fin 78) (35 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h2918` (kalmanson). -/
theorem middleSource_h2918 :
    ((!((allOneRankAtom (sourceRanks P) 16 == allOneRankAtom (sourceRanks P) 13)) || ((allOneRankAtom (sourceRanks P) 5).ult (allOneRankAtom (sourceRanks P) 2)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (2 : Fin 78) (16 : Fin 78)
    (5 : Fin 78) (13 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (3 : Fin 13) (6 : Fin 13)
    (by decide) (by decide) (by decide)
    (13 : Fin 78) (5 : Fin 78) (2 : Fin 78)
    (16 : Fin 78) (0 : Fin 78) (35 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h2919` (kalmanson). -/
theorem middleSource_h2919 :
    ((!((allOneRankAtom (sourceRanks P) 17 == allOneRankAtom (sourceRanks P) 0)) || ((allOneRankAtom (sourceRanks P) 36).ult (allOneRankAtom (sourceRanks P) 2)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (2 : Fin 78) (17 : Fin 78)
    (36 : Fin 78) (0 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (3 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (13 : Fin 78) (6 : Fin 78) (2 : Fin 78)
    (17 : Fin 78) (0 : Fin 78) (36 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h2920` (kalmanson). -/
theorem middleSource_h2920 :
    ((!((allOneRankAtom (sourceRanks P) 2 == allOneRankAtom (sourceRanks P) 6)) || ((allOneRankAtom (sourceRanks P) 13).ult (allOneRankAtom (sourceRanks P) 17)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (17 : Fin 78) (2 : Fin 78)
    (13 : Fin 78) (6 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (3 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (13 : Fin 78) (6 : Fin 78) (2 : Fin 78)
    (17 : Fin 78) (0 : Fin 78) (36 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h2921` (kalmanson). -/
theorem middleSource_h2921 :
    ((!((allOneRankAtom (sourceRanks P) 2 == allOneRankAtom (sourceRanks P) 13)) || ((allOneRankAtom (sourceRanks P) 6).ult (allOneRankAtom (sourceRanks P) 17)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (17 : Fin 78) (2 : Fin 78)
    (6 : Fin 78) (13 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (3 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (13 : Fin 78) (6 : Fin 78) (2 : Fin 78)
    (17 : Fin 78) (0 : Fin 78) (36 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h2922` (kalmanson). -/
theorem middleSource_h2922 :
    ((!((allOneRankAtom (sourceRanks P) 17 == allOneRankAtom (sourceRanks P) 6)) || ((allOneRankAtom (sourceRanks P) 13).ult (allOneRankAtom (sourceRanks P) 2)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (2 : Fin 78) (17 : Fin 78)
    (13 : Fin 78) (6 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (3 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (13 : Fin 78) (6 : Fin 78) (2 : Fin 78)
    (17 : Fin 78) (0 : Fin 78) (36 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h2923` (kalmanson). -/
theorem middleSource_h2923 :
    ((!((allOneRankAtom (sourceRanks P) 17 == allOneRankAtom (sourceRanks P) 13)) || ((allOneRankAtom (sourceRanks P) 6).ult (allOneRankAtom (sourceRanks P) 2)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (2 : Fin 78) (17 : Fin 78)
    (6 : Fin 78) (13 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (3 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (13 : Fin 78) (6 : Fin 78) (2 : Fin 78)
    (17 : Fin 78) (0 : Fin 78) (36 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h2924` (kalmanson). -/
theorem middleSource_h2924 :
    ((!((allOneRankAtom (sourceRanks P) 18 == allOneRankAtom (sourceRanks P) 0)) || ((allOneRankAtom (sourceRanks P) 37).ult (allOneRankAtom (sourceRanks P) 2)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (2 : Fin 78) (18 : Fin 78)
    (37 : Fin 78) (0 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (3 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (13 : Fin 78) (7 : Fin 78) (2 : Fin 78)
    (18 : Fin 78) (0 : Fin 78) (37 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h2925` (kalmanson). -/
theorem middleSource_h2925 :
    ((!((allOneRankAtom (sourceRanks P) 18 == allOneRankAtom (sourceRanks P) 37)) || ((allOneRankAtom (sourceRanks P) 0).ult (allOneRankAtom (sourceRanks P) 2)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (2 : Fin 78) (18 : Fin 78)
    (0 : Fin 78) (37 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (3 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (13 : Fin 78) (7 : Fin 78) (2 : Fin 78)
    (18 : Fin 78) (0 : Fin 78) (37 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h2926` (kalmanson). -/
theorem middleSource_h2926 :
    ((!((allOneRankAtom (sourceRanks P) 2 == allOneRankAtom (sourceRanks P) 7)) || ((allOneRankAtom (sourceRanks P) 13).ult (allOneRankAtom (sourceRanks P) 18)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (18 : Fin 78) (2 : Fin 78)
    (13 : Fin 78) (7 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (3 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (13 : Fin 78) (7 : Fin 78) (2 : Fin 78)
    (18 : Fin 78) (0 : Fin 78) (37 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h2927` (kalmanson). -/
theorem middleSource_h2927 :
    ((!((allOneRankAtom (sourceRanks P) 2 == allOneRankAtom (sourceRanks P) 13)) || ((allOneRankAtom (sourceRanks P) 7).ult (allOneRankAtom (sourceRanks P) 18)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (18 : Fin 78) (2 : Fin 78)
    (7 : Fin 78) (13 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (3 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (13 : Fin 78) (7 : Fin 78) (2 : Fin 78)
    (18 : Fin 78) (0 : Fin 78) (37 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h2928` (kalmanson). -/
theorem middleSource_h2928 :
    ((!((allOneRankAtom (sourceRanks P) 18 == allOneRankAtom (sourceRanks P) 7)) || ((allOneRankAtom (sourceRanks P) 13).ult (allOneRankAtom (sourceRanks P) 2)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (2 : Fin 78) (18 : Fin 78)
    (13 : Fin 78) (7 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (3 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (13 : Fin 78) (7 : Fin 78) (2 : Fin 78)
    (18 : Fin 78) (0 : Fin 78) (37 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h2929` (kalmanson). -/
theorem middleSource_h2929 :
    ((!((allOneRankAtom (sourceRanks P) 18 == allOneRankAtom (sourceRanks P) 13)) || ((allOneRankAtom (sourceRanks P) 7).ult (allOneRankAtom (sourceRanks P) 2)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (2 : Fin 78) (18 : Fin 78)
    (7 : Fin 78) (13 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (3 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (13 : Fin 78) (7 : Fin 78) (2 : Fin 78)
    (18 : Fin 78) (0 : Fin 78) (37 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h2930` (kalmanson). -/
theorem middleSource_h2930 :
    ((!((allOneRankAtom (sourceRanks P) 2 == allOneRankAtom (sourceRanks P) 38)) || ((allOneRankAtom (sourceRanks P) 0).ult (allOneRankAtom (sourceRanks P) 19)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (19 : Fin 78) (2 : Fin 78)
    (0 : Fin 78) (38 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (3 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (13 : Fin 78) (8 : Fin 78) (2 : Fin 78)
    (19 : Fin 78) (0 : Fin 78) (38 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h2931` (kalmanson). -/
theorem middleSource_h2931 :
    ((!((allOneRankAtom (sourceRanks P) 19 == allOneRankAtom (sourceRanks P) 0)) || ((allOneRankAtom (sourceRanks P) 38).ult (allOneRankAtom (sourceRanks P) 2)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (2 : Fin 78) (19 : Fin 78)
    (38 : Fin 78) (0 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (3 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (13 : Fin 78) (8 : Fin 78) (2 : Fin 78)
    (19 : Fin 78) (0 : Fin 78) (38 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h2932` (kalmanson). -/
theorem middleSource_h2932 :
    ((!((allOneRankAtom (sourceRanks P) 2 == allOneRankAtom (sourceRanks P) 8)) || ((allOneRankAtom (sourceRanks P) 13).ult (allOneRankAtom (sourceRanks P) 19)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (19 : Fin 78) (2 : Fin 78)
    (13 : Fin 78) (8 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (3 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (13 : Fin 78) (8 : Fin 78) (2 : Fin 78)
    (19 : Fin 78) (0 : Fin 78) (38 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h2933` (kalmanson). -/
theorem middleSource_h2933 :
    ((!((allOneRankAtom (sourceRanks P) 2 == allOneRankAtom (sourceRanks P) 13)) || ((allOneRankAtom (sourceRanks P) 8).ult (allOneRankAtom (sourceRanks P) 19)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (19 : Fin 78) (2 : Fin 78)
    (8 : Fin 78) (13 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (3 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (13 : Fin 78) (8 : Fin 78) (2 : Fin 78)
    (19 : Fin 78) (0 : Fin 78) (38 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h2934` (kalmanson). -/
theorem middleSource_h2934 :
    ((!((allOneRankAtom (sourceRanks P) 19 == allOneRankAtom (sourceRanks P) 8)) || ((allOneRankAtom (sourceRanks P) 13).ult (allOneRankAtom (sourceRanks P) 2)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (2 : Fin 78) (19 : Fin 78)
    (13 : Fin 78) (8 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (3 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (13 : Fin 78) (8 : Fin 78) (2 : Fin 78)
    (19 : Fin 78) (0 : Fin 78) (38 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h2935` (kalmanson). -/
theorem middleSource_h2935 :
    ((!((allOneRankAtom (sourceRanks P) 19 == allOneRankAtom (sourceRanks P) 13)) || ((allOneRankAtom (sourceRanks P) 8).ult (allOneRankAtom (sourceRanks P) 2)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (2 : Fin 78) (19 : Fin 78)
    (8 : Fin 78) (13 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (3 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (13 : Fin 78) (8 : Fin 78) (2 : Fin 78)
    (19 : Fin 78) (0 : Fin 78) (38 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h2936` (kalmanson). -/
theorem middleSource_h2936 :
    ((!((allOneRankAtom (sourceRanks P) 20 == allOneRankAtom (sourceRanks P) 0)) || ((allOneRankAtom (sourceRanks P) 39).ult (allOneRankAtom (sourceRanks P) 2)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (2 : Fin 78) (20 : Fin 78)
    (39 : Fin 78) (0 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (3 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (13 : Fin 78) (9 : Fin 78) (2 : Fin 78)
    (20 : Fin 78) (0 : Fin 78) (39 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h2937` (kalmanson). -/
theorem middleSource_h2937 :
    ((!((allOneRankAtom (sourceRanks P) 2 == allOneRankAtom (sourceRanks P) 9)) || ((allOneRankAtom (sourceRanks P) 13).ult (allOneRankAtom (sourceRanks P) 20)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (20 : Fin 78) (2 : Fin 78)
    (13 : Fin 78) (9 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (3 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (13 : Fin 78) (9 : Fin 78) (2 : Fin 78)
    (20 : Fin 78) (0 : Fin 78) (39 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h2938` (kalmanson). -/
theorem middleSource_h2938 :
    ((!((allOneRankAtom (sourceRanks P) 2 == allOneRankAtom (sourceRanks P) 13)) || ((allOneRankAtom (sourceRanks P) 9).ult (allOneRankAtom (sourceRanks P) 20)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (20 : Fin 78) (2 : Fin 78)
    (9 : Fin 78) (13 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (3 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (13 : Fin 78) (9 : Fin 78) (2 : Fin 78)
    (20 : Fin 78) (0 : Fin 78) (39 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h2939` (kalmanson). -/
theorem middleSource_h2939 :
    ((!((allOneRankAtom (sourceRanks P) 20 == allOneRankAtom (sourceRanks P) 9)) || ((allOneRankAtom (sourceRanks P) 13).ult (allOneRankAtom (sourceRanks P) 2)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (2 : Fin 78) (20 : Fin 78)
    (13 : Fin 78) (9 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (3 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (13 : Fin 78) (9 : Fin 78) (2 : Fin 78)
    (20 : Fin 78) (0 : Fin 78) (39 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h2940` (kalmanson). -/
theorem middleSource_h2940 :
    ((!((allOneRankAtom (sourceRanks P) 20 == allOneRankAtom (sourceRanks P) 13)) || ((allOneRankAtom (sourceRanks P) 9).ult (allOneRankAtom (sourceRanks P) 2)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (2 : Fin 78) (20 : Fin 78)
    (9 : Fin 78) (13 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (3 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (13 : Fin 78) (9 : Fin 78) (2 : Fin 78)
    (20 : Fin 78) (0 : Fin 78) (39 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h2941` (kalmanson). -/
theorem middleSource_h2941 :
    ((!((allOneRankAtom (sourceRanks P) 2 == allOneRankAtom (sourceRanks P) 40)) || ((allOneRankAtom (sourceRanks P) 0).ult (allOneRankAtom (sourceRanks P) 21)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (21 : Fin 78) (2 : Fin 78)
    (0 : Fin 78) (40 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (3 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (13 : Fin 78) (10 : Fin 78) (2 : Fin 78)
    (21 : Fin 78) (0 : Fin 78) (40 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h2942` (kalmanson). -/
theorem middleSource_h2942 :
    ((!((allOneRankAtom (sourceRanks P) 21 == allOneRankAtom (sourceRanks P) 0)) || ((allOneRankAtom (sourceRanks P) 40).ult (allOneRankAtom (sourceRanks P) 2)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (2 : Fin 78) (21 : Fin 78)
    (40 : Fin 78) (0 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (3 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (13 : Fin 78) (10 : Fin 78) (2 : Fin 78)
    (21 : Fin 78) (0 : Fin 78) (40 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h2943` (kalmanson). -/
theorem middleSource_h2943 :
    ((!((allOneRankAtom (sourceRanks P) 2 == allOneRankAtom (sourceRanks P) 10)) || ((allOneRankAtom (sourceRanks P) 13).ult (allOneRankAtom (sourceRanks P) 21)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (21 : Fin 78) (2 : Fin 78)
    (13 : Fin 78) (10 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (3 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (13 : Fin 78) (10 : Fin 78) (2 : Fin 78)
    (21 : Fin 78) (0 : Fin 78) (40 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

end

end ATailExactFiveCard13AllOneSourceIngressScratch
end Problem97
