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

/-- Candidate middle source assertion `h2944` (kalmanson). -/
theorem middleSource_h2944 :
    ((!((allOneRankAtom (sourceRanks P) 2 == allOneRankAtom (sourceRanks P) 13)) || ((allOneRankAtom (sourceRanks P) 10).ult (allOneRankAtom (sourceRanks P) 21)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (21 : Fin 78) (2 : Fin 78)
    (10 : Fin 78) (13 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (3 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (13 : Fin 78) (10 : Fin 78) (2 : Fin 78)
    (21 : Fin 78) (0 : Fin 78) (40 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h2945` (kalmanson). -/
theorem middleSource_h2945 :
    ((!((allOneRankAtom (sourceRanks P) 21 == allOneRankAtom (sourceRanks P) 10)) || ((allOneRankAtom (sourceRanks P) 13).ult (allOneRankAtom (sourceRanks P) 2)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (2 : Fin 78) (21 : Fin 78)
    (13 : Fin 78) (10 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (3 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (13 : Fin 78) (10 : Fin 78) (2 : Fin 78)
    (21 : Fin 78) (0 : Fin 78) (40 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h2946` (kalmanson). -/
theorem middleSource_h2946 :
    ((!((allOneRankAtom (sourceRanks P) 21 == allOneRankAtom (sourceRanks P) 13)) || ((allOneRankAtom (sourceRanks P) 10).ult (allOneRankAtom (sourceRanks P) 2)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (2 : Fin 78) (21 : Fin 78)
    (10 : Fin 78) (13 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (3 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (13 : Fin 78) (10 : Fin 78) (2 : Fin 78)
    (21 : Fin 78) (0 : Fin 78) (40 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h2947` (kalmanson). -/
theorem middleSource_h2947 :
    ((!((allOneRankAtom (sourceRanks P) 2 == allOneRankAtom (sourceRanks P) 41)) || ((allOneRankAtom (sourceRanks P) 0).ult (allOneRankAtom (sourceRanks P) 22)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (22 : Fin 78) (2 : Fin 78)
    (0 : Fin 78) (41 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (3 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (13 : Fin 78) (11 : Fin 78) (2 : Fin 78)
    (22 : Fin 78) (0 : Fin 78) (41 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h2948` (kalmanson). -/
theorem middleSource_h2948 :
    ((!((allOneRankAtom (sourceRanks P) 22 == allOneRankAtom (sourceRanks P) 0)) || ((allOneRankAtom (sourceRanks P) 41).ult (allOneRankAtom (sourceRanks P) 2)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (2 : Fin 78) (22 : Fin 78)
    (41 : Fin 78) (0 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (3 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (13 : Fin 78) (11 : Fin 78) (2 : Fin 78)
    (22 : Fin 78) (0 : Fin 78) (41 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h2949` (kalmanson). -/
theorem middleSource_h2949 :
    ((!((allOneRankAtom (sourceRanks P) 2 == allOneRankAtom (sourceRanks P) 11)) || ((allOneRankAtom (sourceRanks P) 13).ult (allOneRankAtom (sourceRanks P) 22)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (22 : Fin 78) (2 : Fin 78)
    (13 : Fin 78) (11 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (3 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (13 : Fin 78) (11 : Fin 78) (2 : Fin 78)
    (22 : Fin 78) (0 : Fin 78) (41 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h2950` (kalmanson). -/
theorem middleSource_h2950 :
    ((!((allOneRankAtom (sourceRanks P) 2 == allOneRankAtom (sourceRanks P) 13)) || ((allOneRankAtom (sourceRanks P) 11).ult (allOneRankAtom (sourceRanks P) 22)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (22 : Fin 78) (2 : Fin 78)
    (11 : Fin 78) (13 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (3 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (13 : Fin 78) (11 : Fin 78) (2 : Fin 78)
    (22 : Fin 78) (0 : Fin 78) (41 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h2951` (kalmanson). -/
theorem middleSource_h2951 :
    ((!((allOneRankAtom (sourceRanks P) 22 == allOneRankAtom (sourceRanks P) 11)) || ((allOneRankAtom (sourceRanks P) 13).ult (allOneRankAtom (sourceRanks P) 2)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (2 : Fin 78) (22 : Fin 78)
    (13 : Fin 78) (11 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (3 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (13 : Fin 78) (11 : Fin 78) (2 : Fin 78)
    (22 : Fin 78) (0 : Fin 78) (41 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h2952` (kalmanson). -/
theorem middleSource_h2952 :
    ((!((allOneRankAtom (sourceRanks P) 22 == allOneRankAtom (sourceRanks P) 13)) || ((allOneRankAtom (sourceRanks P) 11).ult (allOneRankAtom (sourceRanks P) 2)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (2 : Fin 78) (22 : Fin 78)
    (11 : Fin 78) (13 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (3 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (13 : Fin 78) (11 : Fin 78) (2 : Fin 78)
    (22 : Fin 78) (0 : Fin 78) (41 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h2953` (kalmanson). -/
theorem middleSource_h2953 :
    ((!((allOneRankAtom (sourceRanks P) 3 == allOneRankAtom (sourceRanks P) 42)) || ((allOneRankAtom (sourceRanks P) 0).ult (allOneRankAtom (sourceRanks P) 15)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (15 : Fin 78) (3 : Fin 78)
    (0 : Fin 78) (42 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (4 : Fin 13) (5 : Fin 13)
    (by decide) (by decide) (by decide)
    (14 : Fin 78) (4 : Fin 78) (3 : Fin 78)
    (15 : Fin 78) (0 : Fin 78) (42 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h2954` (kalmanson). -/
theorem middleSource_h2954 :
    ((!((allOneRankAtom (sourceRanks P) 15 == allOneRankAtom (sourceRanks P) 0)) || ((allOneRankAtom (sourceRanks P) 42).ult (allOneRankAtom (sourceRanks P) 3)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (3 : Fin 78) (15 : Fin 78)
    (42 : Fin 78) (0 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (4 : Fin 13) (5 : Fin 13)
    (by decide) (by decide) (by decide)
    (14 : Fin 78) (4 : Fin 78) (3 : Fin 78)
    (15 : Fin 78) (0 : Fin 78) (42 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h2955` (kalmanson). -/
theorem middleSource_h2955 :
    ((!((allOneRankAtom (sourceRanks P) 15 == allOneRankAtom (sourceRanks P) 42)) || ((allOneRankAtom (sourceRanks P) 0).ult (allOneRankAtom (sourceRanks P) 3)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (3 : Fin 78) (15 : Fin 78)
    (0 : Fin 78) (42 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (4 : Fin 13) (5 : Fin 13)
    (by decide) (by decide) (by decide)
    (14 : Fin 78) (4 : Fin 78) (3 : Fin 78)
    (15 : Fin 78) (0 : Fin 78) (42 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h2956` (kalmanson). -/
theorem middleSource_h2956 :
    ((!((allOneRankAtom (sourceRanks P) 3 == allOneRankAtom (sourceRanks P) 4)) || ((allOneRankAtom (sourceRanks P) 14).ult (allOneRankAtom (sourceRanks P) 15)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (15 : Fin 78) (3 : Fin 78)
    (14 : Fin 78) (4 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (4 : Fin 13) (5 : Fin 13)
    (by decide) (by decide) (by decide)
    (14 : Fin 78) (4 : Fin 78) (3 : Fin 78)
    (15 : Fin 78) (0 : Fin 78) (42 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h2957` (kalmanson). -/
theorem middleSource_h2957 :
    ((!((allOneRankAtom (sourceRanks P) 3 == allOneRankAtom (sourceRanks P) 14)) || ((allOneRankAtom (sourceRanks P) 4).ult (allOneRankAtom (sourceRanks P) 15)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (15 : Fin 78) (3 : Fin 78)
    (4 : Fin 78) (14 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (4 : Fin 13) (5 : Fin 13)
    (by decide) (by decide) (by decide)
    (14 : Fin 78) (4 : Fin 78) (3 : Fin 78)
    (15 : Fin 78) (0 : Fin 78) (42 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h2958` (kalmanson). -/
theorem middleSource_h2958 :
    ((!((allOneRankAtom (sourceRanks P) 15 == allOneRankAtom (sourceRanks P) 4)) || ((allOneRankAtom (sourceRanks P) 14).ult (allOneRankAtom (sourceRanks P) 3)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (3 : Fin 78) (15 : Fin 78)
    (14 : Fin 78) (4 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (4 : Fin 13) (5 : Fin 13)
    (by decide) (by decide) (by decide)
    (14 : Fin 78) (4 : Fin 78) (3 : Fin 78)
    (15 : Fin 78) (0 : Fin 78) (42 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h2959` (kalmanson). -/
theorem middleSource_h2959 :
    ((!((allOneRankAtom (sourceRanks P) 15 == allOneRankAtom (sourceRanks P) 14)) || ((allOneRankAtom (sourceRanks P) 4).ult (allOneRankAtom (sourceRanks P) 3)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (3 : Fin 78) (15 : Fin 78)
    (4 : Fin 78) (14 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (4 : Fin 13) (5 : Fin 13)
    (by decide) (by decide) (by decide)
    (14 : Fin 78) (4 : Fin 78) (3 : Fin 78)
    (15 : Fin 78) (0 : Fin 78) (42 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h2960` (kalmanson). -/
theorem middleSource_h2960 :
    ((!((allOneRankAtom (sourceRanks P) 3 == allOneRankAtom (sourceRanks P) 43)) || ((allOneRankAtom (sourceRanks P) 0).ult (allOneRankAtom (sourceRanks P) 16)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (16 : Fin 78) (3 : Fin 78)
    (0 : Fin 78) (43 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (4 : Fin 13) (6 : Fin 13)
    (by decide) (by decide) (by decide)
    (14 : Fin 78) (5 : Fin 78) (3 : Fin 78)
    (16 : Fin 78) (0 : Fin 78) (43 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h2961` (kalmanson). -/
theorem middleSource_h2961 :
    ((!((allOneRankAtom (sourceRanks P) 16 == allOneRankAtom (sourceRanks P) 0)) || ((allOneRankAtom (sourceRanks P) 43).ult (allOneRankAtom (sourceRanks P) 3)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (3 : Fin 78) (16 : Fin 78)
    (43 : Fin 78) (0 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (4 : Fin 13) (6 : Fin 13)
    (by decide) (by decide) (by decide)
    (14 : Fin 78) (5 : Fin 78) (3 : Fin 78)
    (16 : Fin 78) (0 : Fin 78) (43 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h2962` (kalmanson). -/
theorem middleSource_h2962 :
    ((!((allOneRankAtom (sourceRanks P) 16 == allOneRankAtom (sourceRanks P) 43)) || ((allOneRankAtom (sourceRanks P) 0).ult (allOneRankAtom (sourceRanks P) 3)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (3 : Fin 78) (16 : Fin 78)
    (0 : Fin 78) (43 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (4 : Fin 13) (6 : Fin 13)
    (by decide) (by decide) (by decide)
    (14 : Fin 78) (5 : Fin 78) (3 : Fin 78)
    (16 : Fin 78) (0 : Fin 78) (43 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h2963` (kalmanson). -/
theorem middleSource_h2963 :
    ((!((allOneRankAtom (sourceRanks P) 3 == allOneRankAtom (sourceRanks P) 5)) || ((allOneRankAtom (sourceRanks P) 14).ult (allOneRankAtom (sourceRanks P) 16)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (16 : Fin 78) (3 : Fin 78)
    (14 : Fin 78) (5 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (4 : Fin 13) (6 : Fin 13)
    (by decide) (by decide) (by decide)
    (14 : Fin 78) (5 : Fin 78) (3 : Fin 78)
    (16 : Fin 78) (0 : Fin 78) (43 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h2964` (kalmanson). -/
theorem middleSource_h2964 :
    ((!((allOneRankAtom (sourceRanks P) 3 == allOneRankAtom (sourceRanks P) 14)) || ((allOneRankAtom (sourceRanks P) 5).ult (allOneRankAtom (sourceRanks P) 16)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (16 : Fin 78) (3 : Fin 78)
    (5 : Fin 78) (14 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (4 : Fin 13) (6 : Fin 13)
    (by decide) (by decide) (by decide)
    (14 : Fin 78) (5 : Fin 78) (3 : Fin 78)
    (16 : Fin 78) (0 : Fin 78) (43 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h2965` (kalmanson). -/
theorem middleSource_h2965 :
    ((!((allOneRankAtom (sourceRanks P) 16 == allOneRankAtom (sourceRanks P) 5)) || ((allOneRankAtom (sourceRanks P) 14).ult (allOneRankAtom (sourceRanks P) 3)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (3 : Fin 78) (16 : Fin 78)
    (14 : Fin 78) (5 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (4 : Fin 13) (6 : Fin 13)
    (by decide) (by decide) (by decide)
    (14 : Fin 78) (5 : Fin 78) (3 : Fin 78)
    (16 : Fin 78) (0 : Fin 78) (43 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h2966` (kalmanson). -/
theorem middleSource_h2966 :
    ((!((allOneRankAtom (sourceRanks P) 16 == allOneRankAtom (sourceRanks P) 14)) || ((allOneRankAtom (sourceRanks P) 5).ult (allOneRankAtom (sourceRanks P) 3)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (3 : Fin 78) (16 : Fin 78)
    (5 : Fin 78) (14 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (4 : Fin 13) (6 : Fin 13)
    (by decide) (by decide) (by decide)
    (14 : Fin 78) (5 : Fin 78) (3 : Fin 78)
    (16 : Fin 78) (0 : Fin 78) (43 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h2967` (kalmanson). -/
theorem middleSource_h2967 :
    ((!((allOneRankAtom (sourceRanks P) 3 == allOneRankAtom (sourceRanks P) 44)) || ((allOneRankAtom (sourceRanks P) 0).ult (allOneRankAtom (sourceRanks P) 17)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (17 : Fin 78) (3 : Fin 78)
    (0 : Fin 78) (44 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (4 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (14 : Fin 78) (6 : Fin 78) (3 : Fin 78)
    (17 : Fin 78) (0 : Fin 78) (44 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h2968` (kalmanson). -/
theorem middleSource_h2968 :
    ((!((allOneRankAtom (sourceRanks P) 17 == allOneRankAtom (sourceRanks P) 0)) || ((allOneRankAtom (sourceRanks P) 44).ult (allOneRankAtom (sourceRanks P) 3)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (3 : Fin 78) (17 : Fin 78)
    (44 : Fin 78) (0 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (4 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (14 : Fin 78) (6 : Fin 78) (3 : Fin 78)
    (17 : Fin 78) (0 : Fin 78) (44 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h2969` (kalmanson). -/
theorem middleSource_h2969 :
    ((!((allOneRankAtom (sourceRanks P) 17 == allOneRankAtom (sourceRanks P) 44)) || ((allOneRankAtom (sourceRanks P) 0).ult (allOneRankAtom (sourceRanks P) 3)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (3 : Fin 78) (17 : Fin 78)
    (0 : Fin 78) (44 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (4 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (14 : Fin 78) (6 : Fin 78) (3 : Fin 78)
    (17 : Fin 78) (0 : Fin 78) (44 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h2970` (kalmanson). -/
theorem middleSource_h2970 :
    ((!((allOneRankAtom (sourceRanks P) 3 == allOneRankAtom (sourceRanks P) 6)) || ((allOneRankAtom (sourceRanks P) 14).ult (allOneRankAtom (sourceRanks P) 17)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (17 : Fin 78) (3 : Fin 78)
    (14 : Fin 78) (6 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (4 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (14 : Fin 78) (6 : Fin 78) (3 : Fin 78)
    (17 : Fin 78) (0 : Fin 78) (44 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h2971` (kalmanson). -/
theorem middleSource_h2971 :
    ((!((allOneRankAtom (sourceRanks P) 3 == allOneRankAtom (sourceRanks P) 14)) || ((allOneRankAtom (sourceRanks P) 6).ult (allOneRankAtom (sourceRanks P) 17)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (17 : Fin 78) (3 : Fin 78)
    (6 : Fin 78) (14 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (4 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (14 : Fin 78) (6 : Fin 78) (3 : Fin 78)
    (17 : Fin 78) (0 : Fin 78) (44 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h2972` (kalmanson). -/
theorem middleSource_h2972 :
    ((!((allOneRankAtom (sourceRanks P) 17 == allOneRankAtom (sourceRanks P) 6)) || ((allOneRankAtom (sourceRanks P) 14).ult (allOneRankAtom (sourceRanks P) 3)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (3 : Fin 78) (17 : Fin 78)
    (14 : Fin 78) (6 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (4 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (14 : Fin 78) (6 : Fin 78) (3 : Fin 78)
    (17 : Fin 78) (0 : Fin 78) (44 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h2973` (kalmanson). -/
theorem middleSource_h2973 :
    ((!((allOneRankAtom (sourceRanks P) 17 == allOneRankAtom (sourceRanks P) 14)) || ((allOneRankAtom (sourceRanks P) 6).ult (allOneRankAtom (sourceRanks P) 3)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (3 : Fin 78) (17 : Fin 78)
    (6 : Fin 78) (14 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (4 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (14 : Fin 78) (6 : Fin 78) (3 : Fin 78)
    (17 : Fin 78) (0 : Fin 78) (44 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h2974` (kalmanson). -/
theorem middleSource_h2974 :
    ((!((allOneRankAtom (sourceRanks P) 3 == allOneRankAtom (sourceRanks P) 45)) || ((allOneRankAtom (sourceRanks P) 0).ult (allOneRankAtom (sourceRanks P) 18)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (18 : Fin 78) (3 : Fin 78)
    (0 : Fin 78) (45 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (4 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (14 : Fin 78) (7 : Fin 78) (3 : Fin 78)
    (18 : Fin 78) (0 : Fin 78) (45 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h2975` (kalmanson). -/
theorem middleSource_h2975 :
    ((!((allOneRankAtom (sourceRanks P) 18 == allOneRankAtom (sourceRanks P) 0)) || ((allOneRankAtom (sourceRanks P) 45).ult (allOneRankAtom (sourceRanks P) 3)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (3 : Fin 78) (18 : Fin 78)
    (45 : Fin 78) (0 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (4 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (14 : Fin 78) (7 : Fin 78) (3 : Fin 78)
    (18 : Fin 78) (0 : Fin 78) (45 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h2976` (kalmanson). -/
theorem middleSource_h2976 :
    ((!((allOneRankAtom (sourceRanks P) 18 == allOneRankAtom (sourceRanks P) 45)) || ((allOneRankAtom (sourceRanks P) 0).ult (allOneRankAtom (sourceRanks P) 3)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (3 : Fin 78) (18 : Fin 78)
    (0 : Fin 78) (45 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (4 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (14 : Fin 78) (7 : Fin 78) (3 : Fin 78)
    (18 : Fin 78) (0 : Fin 78) (45 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h2977` (kalmanson). -/
theorem middleSource_h2977 :
    ((!((allOneRankAtom (sourceRanks P) 3 == allOneRankAtom (sourceRanks P) 7)) || ((allOneRankAtom (sourceRanks P) 14).ult (allOneRankAtom (sourceRanks P) 18)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (18 : Fin 78) (3 : Fin 78)
    (14 : Fin 78) (7 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (4 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (14 : Fin 78) (7 : Fin 78) (3 : Fin 78)
    (18 : Fin 78) (0 : Fin 78) (45 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h2978` (kalmanson). -/
theorem middleSource_h2978 :
    ((!((allOneRankAtom (sourceRanks P) 3 == allOneRankAtom (sourceRanks P) 14)) || ((allOneRankAtom (sourceRanks P) 7).ult (allOneRankAtom (sourceRanks P) 18)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (18 : Fin 78) (3 : Fin 78)
    (7 : Fin 78) (14 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (4 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (14 : Fin 78) (7 : Fin 78) (3 : Fin 78)
    (18 : Fin 78) (0 : Fin 78) (45 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h2979` (kalmanson). -/
theorem middleSource_h2979 :
    ((!((allOneRankAtom (sourceRanks P) 18 == allOneRankAtom (sourceRanks P) 7)) || ((allOneRankAtom (sourceRanks P) 14).ult (allOneRankAtom (sourceRanks P) 3)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (3 : Fin 78) (18 : Fin 78)
    (14 : Fin 78) (7 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (4 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (14 : Fin 78) (7 : Fin 78) (3 : Fin 78)
    (18 : Fin 78) (0 : Fin 78) (45 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h2980` (kalmanson). -/
theorem middleSource_h2980 :
    ((!((allOneRankAtom (sourceRanks P) 18 == allOneRankAtom (sourceRanks P) 14)) || ((allOneRankAtom (sourceRanks P) 7).ult (allOneRankAtom (sourceRanks P) 3)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (3 : Fin 78) (18 : Fin 78)
    (7 : Fin 78) (14 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (4 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (14 : Fin 78) (7 : Fin 78) (3 : Fin 78)
    (18 : Fin 78) (0 : Fin 78) (45 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h2981` (kalmanson). -/
theorem middleSource_h2981 :
    ((!((allOneRankAtom (sourceRanks P) 3 == allOneRankAtom (sourceRanks P) 46)) || ((allOneRankAtom (sourceRanks P) 0).ult (allOneRankAtom (sourceRanks P) 19)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (19 : Fin 78) (3 : Fin 78)
    (0 : Fin 78) (46 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (4 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (14 : Fin 78) (8 : Fin 78) (3 : Fin 78)
    (19 : Fin 78) (0 : Fin 78) (46 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h2982` (kalmanson). -/
theorem middleSource_h2982 :
    ((!((allOneRankAtom (sourceRanks P) 19 == allOneRankAtom (sourceRanks P) 0)) || ((allOneRankAtom (sourceRanks P) 46).ult (allOneRankAtom (sourceRanks P) 3)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (3 : Fin 78) (19 : Fin 78)
    (46 : Fin 78) (0 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (4 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (14 : Fin 78) (8 : Fin 78) (3 : Fin 78)
    (19 : Fin 78) (0 : Fin 78) (46 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h2983` (kalmanson). -/
theorem middleSource_h2983 :
    ((!((allOneRankAtom (sourceRanks P) 19 == allOneRankAtom (sourceRanks P) 46)) || ((allOneRankAtom (sourceRanks P) 0).ult (allOneRankAtom (sourceRanks P) 3)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (3 : Fin 78) (19 : Fin 78)
    (0 : Fin 78) (46 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (4 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (14 : Fin 78) (8 : Fin 78) (3 : Fin 78)
    (19 : Fin 78) (0 : Fin 78) (46 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h2984` (kalmanson). -/
theorem middleSource_h2984 :
    ((!((allOneRankAtom (sourceRanks P) 3 == allOneRankAtom (sourceRanks P) 8)) || ((allOneRankAtom (sourceRanks P) 14).ult (allOneRankAtom (sourceRanks P) 19)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (19 : Fin 78) (3 : Fin 78)
    (14 : Fin 78) (8 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (4 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (14 : Fin 78) (8 : Fin 78) (3 : Fin 78)
    (19 : Fin 78) (0 : Fin 78) (46 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h2985` (kalmanson). -/
theorem middleSource_h2985 :
    ((!((allOneRankAtom (sourceRanks P) 3 == allOneRankAtom (sourceRanks P) 14)) || ((allOneRankAtom (sourceRanks P) 8).ult (allOneRankAtom (sourceRanks P) 19)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (19 : Fin 78) (3 : Fin 78)
    (8 : Fin 78) (14 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (4 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (14 : Fin 78) (8 : Fin 78) (3 : Fin 78)
    (19 : Fin 78) (0 : Fin 78) (46 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h2986` (kalmanson). -/
theorem middleSource_h2986 :
    ((!((allOneRankAtom (sourceRanks P) 19 == allOneRankAtom (sourceRanks P) 8)) || ((allOneRankAtom (sourceRanks P) 14).ult (allOneRankAtom (sourceRanks P) 3)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (3 : Fin 78) (19 : Fin 78)
    (14 : Fin 78) (8 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (4 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (14 : Fin 78) (8 : Fin 78) (3 : Fin 78)
    (19 : Fin 78) (0 : Fin 78) (46 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h2987` (kalmanson). -/
theorem middleSource_h2987 :
    ((!((allOneRankAtom (sourceRanks P) 19 == allOneRankAtom (sourceRanks P) 14)) || ((allOneRankAtom (sourceRanks P) 8).ult (allOneRankAtom (sourceRanks P) 3)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (3 : Fin 78) (19 : Fin 78)
    (8 : Fin 78) (14 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (4 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (14 : Fin 78) (8 : Fin 78) (3 : Fin 78)
    (19 : Fin 78) (0 : Fin 78) (46 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h2988` (kalmanson). -/
theorem middleSource_h2988 :
    ((!((allOneRankAtom (sourceRanks P) 3 == allOneRankAtom (sourceRanks P) 47)) || ((allOneRankAtom (sourceRanks P) 0).ult (allOneRankAtom (sourceRanks P) 20)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (20 : Fin 78) (3 : Fin 78)
    (0 : Fin 78) (47 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (4 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (14 : Fin 78) (9 : Fin 78) (3 : Fin 78)
    (20 : Fin 78) (0 : Fin 78) (47 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h2989` (kalmanson). -/
theorem middleSource_h2989 :
    ((!((allOneRankAtom (sourceRanks P) 20 == allOneRankAtom (sourceRanks P) 0)) || ((allOneRankAtom (sourceRanks P) 47).ult (allOneRankAtom (sourceRanks P) 3)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (3 : Fin 78) (20 : Fin 78)
    (47 : Fin 78) (0 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (4 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (14 : Fin 78) (9 : Fin 78) (3 : Fin 78)
    (20 : Fin 78) (0 : Fin 78) (47 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h2990` (kalmanson). -/
theorem middleSource_h2990 :
    ((!((allOneRankAtom (sourceRanks P) 20 == allOneRankAtom (sourceRanks P) 47)) || ((allOneRankAtom (sourceRanks P) 0).ult (allOneRankAtom (sourceRanks P) 3)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (3 : Fin 78) (20 : Fin 78)
    (0 : Fin 78) (47 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (4 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (14 : Fin 78) (9 : Fin 78) (3 : Fin 78)
    (20 : Fin 78) (0 : Fin 78) (47 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h2991` (kalmanson). -/
theorem middleSource_h2991 :
    ((!((allOneRankAtom (sourceRanks P) 3 == allOneRankAtom (sourceRanks P) 9)) || ((allOneRankAtom (sourceRanks P) 14).ult (allOneRankAtom (sourceRanks P) 20)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (20 : Fin 78) (3 : Fin 78)
    (14 : Fin 78) (9 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (4 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (14 : Fin 78) (9 : Fin 78) (3 : Fin 78)
    (20 : Fin 78) (0 : Fin 78) (47 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h2992` (kalmanson). -/
theorem middleSource_h2992 :
    ((!((allOneRankAtom (sourceRanks P) 3 == allOneRankAtom (sourceRanks P) 14)) || ((allOneRankAtom (sourceRanks P) 9).ult (allOneRankAtom (sourceRanks P) 20)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (20 : Fin 78) (3 : Fin 78)
    (9 : Fin 78) (14 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (4 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (14 : Fin 78) (9 : Fin 78) (3 : Fin 78)
    (20 : Fin 78) (0 : Fin 78) (47 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h2993` (kalmanson). -/
theorem middleSource_h2993 :
    ((!((allOneRankAtom (sourceRanks P) 20 == allOneRankAtom (sourceRanks P) 9)) || ((allOneRankAtom (sourceRanks P) 14).ult (allOneRankAtom (sourceRanks P) 3)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (3 : Fin 78) (20 : Fin 78)
    (14 : Fin 78) (9 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (4 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (14 : Fin 78) (9 : Fin 78) (3 : Fin 78)
    (20 : Fin 78) (0 : Fin 78) (47 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h2994` (kalmanson). -/
theorem middleSource_h2994 :
    ((!((allOneRankAtom (sourceRanks P) 20 == allOneRankAtom (sourceRanks P) 14)) || ((allOneRankAtom (sourceRanks P) 9).ult (allOneRankAtom (sourceRanks P) 3)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (3 : Fin 78) (20 : Fin 78)
    (9 : Fin 78) (14 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (4 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (14 : Fin 78) (9 : Fin 78) (3 : Fin 78)
    (20 : Fin 78) (0 : Fin 78) (47 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h2995` (kalmanson). -/
theorem middleSource_h2995 :
    ((!((allOneRankAtom (sourceRanks P) 3 == allOneRankAtom (sourceRanks P) 48)) || ((allOneRankAtom (sourceRanks P) 0).ult (allOneRankAtom (sourceRanks P) 21)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (21 : Fin 78) (3 : Fin 78)
    (0 : Fin 78) (48 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (4 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (14 : Fin 78) (10 : Fin 78) (3 : Fin 78)
    (21 : Fin 78) (0 : Fin 78) (48 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h2996` (kalmanson). -/
theorem middleSource_h2996 :
    ((!((allOneRankAtom (sourceRanks P) 21 == allOneRankAtom (sourceRanks P) 0)) || ((allOneRankAtom (sourceRanks P) 48).ult (allOneRankAtom (sourceRanks P) 3)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (3 : Fin 78) (21 : Fin 78)
    (48 : Fin 78) (0 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (4 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (14 : Fin 78) (10 : Fin 78) (3 : Fin 78)
    (21 : Fin 78) (0 : Fin 78) (48 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h2997` (kalmanson). -/
theorem middleSource_h2997 :
    ((!((allOneRankAtom (sourceRanks P) 21 == allOneRankAtom (sourceRanks P) 48)) || ((allOneRankAtom (sourceRanks P) 0).ult (allOneRankAtom (sourceRanks P) 3)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (3 : Fin 78) (21 : Fin 78)
    (0 : Fin 78) (48 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (4 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (14 : Fin 78) (10 : Fin 78) (3 : Fin 78)
    (21 : Fin 78) (0 : Fin 78) (48 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h2998` (kalmanson). -/
theorem middleSource_h2998 :
    ((!((allOneRankAtom (sourceRanks P) 3 == allOneRankAtom (sourceRanks P) 10)) || ((allOneRankAtom (sourceRanks P) 14).ult (allOneRankAtom (sourceRanks P) 21)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (21 : Fin 78) (3 : Fin 78)
    (14 : Fin 78) (10 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (4 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (14 : Fin 78) (10 : Fin 78) (3 : Fin 78)
    (21 : Fin 78) (0 : Fin 78) (48 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h2999` (kalmanson). -/
theorem middleSource_h2999 :
    ((!((allOneRankAtom (sourceRanks P) 3 == allOneRankAtom (sourceRanks P) 14)) || ((allOneRankAtom (sourceRanks P) 10).ult (allOneRankAtom (sourceRanks P) 21)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (21 : Fin 78) (3 : Fin 78)
    (10 : Fin 78) (14 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (4 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (14 : Fin 78) (10 : Fin 78) (3 : Fin 78)
    (21 : Fin 78) (0 : Fin 78) (48 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3000` (kalmanson). -/
theorem middleSource_h3000 :
    ((!((allOneRankAtom (sourceRanks P) 21 == allOneRankAtom (sourceRanks P) 10)) || ((allOneRankAtom (sourceRanks P) 14).ult (allOneRankAtom (sourceRanks P) 3)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (3 : Fin 78) (21 : Fin 78)
    (14 : Fin 78) (10 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (4 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (14 : Fin 78) (10 : Fin 78) (3 : Fin 78)
    (21 : Fin 78) (0 : Fin 78) (48 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3001` (kalmanson). -/
theorem middleSource_h3001 :
    ((!((allOneRankAtom (sourceRanks P) 21 == allOneRankAtom (sourceRanks P) 14)) || ((allOneRankAtom (sourceRanks P) 10).ult (allOneRankAtom (sourceRanks P) 3)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (3 : Fin 78) (21 : Fin 78)
    (10 : Fin 78) (14 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (4 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (14 : Fin 78) (10 : Fin 78) (3 : Fin 78)
    (21 : Fin 78) (0 : Fin 78) (48 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3002` (kalmanson). -/
theorem middleSource_h3002 :
    ((!((allOneRankAtom (sourceRanks P) 3 == allOneRankAtom (sourceRanks P) 49)) || ((allOneRankAtom (sourceRanks P) 0).ult (allOneRankAtom (sourceRanks P) 22)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (22 : Fin 78) (3 : Fin 78)
    (0 : Fin 78) (49 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (4 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (14 : Fin 78) (11 : Fin 78) (3 : Fin 78)
    (22 : Fin 78) (0 : Fin 78) (49 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3003` (kalmanson). -/
theorem middleSource_h3003 :
    ((!((allOneRankAtom (sourceRanks P) 22 == allOneRankAtom (sourceRanks P) 0)) || ((allOneRankAtom (sourceRanks P) 49).ult (allOneRankAtom (sourceRanks P) 3)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (3 : Fin 78) (22 : Fin 78)
    (49 : Fin 78) (0 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (4 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (14 : Fin 78) (11 : Fin 78) (3 : Fin 78)
    (22 : Fin 78) (0 : Fin 78) (49 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3004` (kalmanson). -/
theorem middleSource_h3004 :
    ((!((allOneRankAtom (sourceRanks P) 3 == allOneRankAtom (sourceRanks P) 11)) || ((allOneRankAtom (sourceRanks P) 14).ult (allOneRankAtom (sourceRanks P) 22)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (22 : Fin 78) (3 : Fin 78)
    (14 : Fin 78) (11 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (4 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (14 : Fin 78) (11 : Fin 78) (3 : Fin 78)
    (22 : Fin 78) (0 : Fin 78) (49 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3005` (kalmanson). -/
theorem middleSource_h3005 :
    ((!((allOneRankAtom (sourceRanks P) 3 == allOneRankAtom (sourceRanks P) 14)) || ((allOneRankAtom (sourceRanks P) 11).ult (allOneRankAtom (sourceRanks P) 22)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (22 : Fin 78) (3 : Fin 78)
    (11 : Fin 78) (14 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (4 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (14 : Fin 78) (11 : Fin 78) (3 : Fin 78)
    (22 : Fin 78) (0 : Fin 78) (49 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3006` (kalmanson). -/
theorem middleSource_h3006 :
    ((!((allOneRankAtom (sourceRanks P) 22 == allOneRankAtom (sourceRanks P) 11)) || ((allOneRankAtom (sourceRanks P) 14).ult (allOneRankAtom (sourceRanks P) 3)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (3 : Fin 78) (22 : Fin 78)
    (14 : Fin 78) (11 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (4 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (14 : Fin 78) (11 : Fin 78) (3 : Fin 78)
    (22 : Fin 78) (0 : Fin 78) (49 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3007` (kalmanson). -/
theorem middleSource_h3007 :
    ((!((allOneRankAtom (sourceRanks P) 22 == allOneRankAtom (sourceRanks P) 14)) || ((allOneRankAtom (sourceRanks P) 11).ult (allOneRankAtom (sourceRanks P) 3)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (3 : Fin 78) (22 : Fin 78)
    (11 : Fin 78) (14 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (4 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (14 : Fin 78) (11 : Fin 78) (3 : Fin 78)
    (22 : Fin 78) (0 : Fin 78) (49 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

end

end ATailExactFiveCard13AllOneSourceIngressScratch
end Problem97
