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

/-- Candidate middle source assertion `h3008` (kalmanson). -/
theorem middleSource_h3008 :
    ((!((allOneRankAtom (sourceRanks P) 4 == allOneRankAtom (sourceRanks P) 0)) || ((allOneRankAtom (sourceRanks P) 50).ult (allOneRankAtom (sourceRanks P) 16)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (16 : Fin 78) (4 : Fin 78)
    (50 : Fin 78) (0 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (5 : Fin 13) (6 : Fin 13)
    (by decide) (by decide) (by decide)
    (15 : Fin 78) (5 : Fin 78) (4 : Fin 78)
    (16 : Fin 78) (0 : Fin 78) (50 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3009` (kalmanson). -/
theorem middleSource_h3009 :
    ((!((allOneRankAtom (sourceRanks P) 4 == allOneRankAtom (sourceRanks P) 50)) || ((allOneRankAtom (sourceRanks P) 0).ult (allOneRankAtom (sourceRanks P) 16)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (16 : Fin 78) (4 : Fin 78)
    (0 : Fin 78) (50 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (5 : Fin 13) (6 : Fin 13)
    (by decide) (by decide) (by decide)
    (15 : Fin 78) (5 : Fin 78) (4 : Fin 78)
    (16 : Fin 78) (0 : Fin 78) (50 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3010` (kalmanson). -/
theorem middleSource_h3010 :
    ((!((allOneRankAtom (sourceRanks P) 16 == allOneRankAtom (sourceRanks P) 0)) || ((allOneRankAtom (sourceRanks P) 50).ult (allOneRankAtom (sourceRanks P) 4)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (4 : Fin 78) (16 : Fin 78)
    (50 : Fin 78) (0 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (5 : Fin 13) (6 : Fin 13)
    (by decide) (by decide) (by decide)
    (15 : Fin 78) (5 : Fin 78) (4 : Fin 78)
    (16 : Fin 78) (0 : Fin 78) (50 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3011` (kalmanson). -/
theorem middleSource_h3011 :
    ((!((allOneRankAtom (sourceRanks P) 16 == allOneRankAtom (sourceRanks P) 50)) || ((allOneRankAtom (sourceRanks P) 0).ult (allOneRankAtom (sourceRanks P) 4)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (4 : Fin 78) (16 : Fin 78)
    (0 : Fin 78) (50 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (5 : Fin 13) (6 : Fin 13)
    (by decide) (by decide) (by decide)
    (15 : Fin 78) (5 : Fin 78) (4 : Fin 78)
    (16 : Fin 78) (0 : Fin 78) (50 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3012` (kalmanson). -/
theorem middleSource_h3012 :
    ((!((allOneRankAtom (sourceRanks P) 4 == allOneRankAtom (sourceRanks P) 5)) || ((allOneRankAtom (sourceRanks P) 15).ult (allOneRankAtom (sourceRanks P) 16)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (16 : Fin 78) (4 : Fin 78)
    (15 : Fin 78) (5 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (5 : Fin 13) (6 : Fin 13)
    (by decide) (by decide) (by decide)
    (15 : Fin 78) (5 : Fin 78) (4 : Fin 78)
    (16 : Fin 78) (0 : Fin 78) (50 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3013` (kalmanson). -/
theorem middleSource_h3013 :
    ((!((allOneRankAtom (sourceRanks P) 4 == allOneRankAtom (sourceRanks P) 15)) || ((allOneRankAtom (sourceRanks P) 5).ult (allOneRankAtom (sourceRanks P) 16)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (16 : Fin 78) (4 : Fin 78)
    (5 : Fin 78) (15 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (5 : Fin 13) (6 : Fin 13)
    (by decide) (by decide) (by decide)
    (15 : Fin 78) (5 : Fin 78) (4 : Fin 78)
    (16 : Fin 78) (0 : Fin 78) (50 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3014` (kalmanson). -/
theorem middleSource_h3014 :
    ((!((allOneRankAtom (sourceRanks P) 16 == allOneRankAtom (sourceRanks P) 5)) || ((allOneRankAtom (sourceRanks P) 15).ult (allOneRankAtom (sourceRanks P) 4)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (4 : Fin 78) (16 : Fin 78)
    (15 : Fin 78) (5 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (5 : Fin 13) (6 : Fin 13)
    (by decide) (by decide) (by decide)
    (15 : Fin 78) (5 : Fin 78) (4 : Fin 78)
    (16 : Fin 78) (0 : Fin 78) (50 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3015` (kalmanson). -/
theorem middleSource_h3015 :
    ((!((allOneRankAtom (sourceRanks P) 16 == allOneRankAtom (sourceRanks P) 15)) || ((allOneRankAtom (sourceRanks P) 5).ult (allOneRankAtom (sourceRanks P) 4)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (4 : Fin 78) (16 : Fin 78)
    (5 : Fin 78) (15 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (5 : Fin 13) (6 : Fin 13)
    (by decide) (by decide) (by decide)
    (15 : Fin 78) (5 : Fin 78) (4 : Fin 78)
    (16 : Fin 78) (0 : Fin 78) (50 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3016` (kalmanson). -/
theorem middleSource_h3016 :
    ((!((allOneRankAtom (sourceRanks P) 4 == allOneRankAtom (sourceRanks P) 0)) || ((allOneRankAtom (sourceRanks P) 51).ult (allOneRankAtom (sourceRanks P) 17)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (17 : Fin 78) (4 : Fin 78)
    (51 : Fin 78) (0 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (5 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (15 : Fin 78) (6 : Fin 78) (4 : Fin 78)
    (17 : Fin 78) (0 : Fin 78) (51 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3017` (kalmanson). -/
theorem middleSource_h3017 :
    ((!((allOneRankAtom (sourceRanks P) 4 == allOneRankAtom (sourceRanks P) 51)) || ((allOneRankAtom (sourceRanks P) 0).ult (allOneRankAtom (sourceRanks P) 17)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (17 : Fin 78) (4 : Fin 78)
    (0 : Fin 78) (51 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (5 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (15 : Fin 78) (6 : Fin 78) (4 : Fin 78)
    (17 : Fin 78) (0 : Fin 78) (51 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3018` (kalmanson). -/
theorem middleSource_h3018 :
    ((!((allOneRankAtom (sourceRanks P) 17 == allOneRankAtom (sourceRanks P) 0)) || ((allOneRankAtom (sourceRanks P) 51).ult (allOneRankAtom (sourceRanks P) 4)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (4 : Fin 78) (17 : Fin 78)
    (51 : Fin 78) (0 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (5 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (15 : Fin 78) (6 : Fin 78) (4 : Fin 78)
    (17 : Fin 78) (0 : Fin 78) (51 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3019` (kalmanson). -/
theorem middleSource_h3019 :
    ((!((allOneRankAtom (sourceRanks P) 4 == allOneRankAtom (sourceRanks P) 6)) || ((allOneRankAtom (sourceRanks P) 15).ult (allOneRankAtom (sourceRanks P) 17)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (17 : Fin 78) (4 : Fin 78)
    (15 : Fin 78) (6 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (5 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (15 : Fin 78) (6 : Fin 78) (4 : Fin 78)
    (17 : Fin 78) (0 : Fin 78) (51 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3020` (kalmanson). -/
theorem middleSource_h3020 :
    ((!((allOneRankAtom (sourceRanks P) 4 == allOneRankAtom (sourceRanks P) 15)) || ((allOneRankAtom (sourceRanks P) 6).ult (allOneRankAtom (sourceRanks P) 17)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (17 : Fin 78) (4 : Fin 78)
    (6 : Fin 78) (15 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (5 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (15 : Fin 78) (6 : Fin 78) (4 : Fin 78)
    (17 : Fin 78) (0 : Fin 78) (51 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3021` (kalmanson). -/
theorem middleSource_h3021 :
    ((!((allOneRankAtom (sourceRanks P) 17 == allOneRankAtom (sourceRanks P) 6)) || ((allOneRankAtom (sourceRanks P) 15).ult (allOneRankAtom (sourceRanks P) 4)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (4 : Fin 78) (17 : Fin 78)
    (15 : Fin 78) (6 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (5 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (15 : Fin 78) (6 : Fin 78) (4 : Fin 78)
    (17 : Fin 78) (0 : Fin 78) (51 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3022` (kalmanson). -/
theorem middleSource_h3022 :
    ((!((allOneRankAtom (sourceRanks P) 17 == allOneRankAtom (sourceRanks P) 15)) || ((allOneRankAtom (sourceRanks P) 6).ult (allOneRankAtom (sourceRanks P) 4)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (4 : Fin 78) (17 : Fin 78)
    (6 : Fin 78) (15 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (5 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (15 : Fin 78) (6 : Fin 78) (4 : Fin 78)
    (17 : Fin 78) (0 : Fin 78) (51 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3023` (kalmanson). -/
theorem middleSource_h3023 :
    ((!((allOneRankAtom (sourceRanks P) 4 == allOneRankAtom (sourceRanks P) 0)) || ((allOneRankAtom (sourceRanks P) 52).ult (allOneRankAtom (sourceRanks P) 18)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (18 : Fin 78) (4 : Fin 78)
    (52 : Fin 78) (0 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (5 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (15 : Fin 78) (7 : Fin 78) (4 : Fin 78)
    (18 : Fin 78) (0 : Fin 78) (52 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3024` (kalmanson). -/
theorem middleSource_h3024 :
    ((!((allOneRankAtom (sourceRanks P) 4 == allOneRankAtom (sourceRanks P) 52)) || ((allOneRankAtom (sourceRanks P) 0).ult (allOneRankAtom (sourceRanks P) 18)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (18 : Fin 78) (4 : Fin 78)
    (0 : Fin 78) (52 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (5 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (15 : Fin 78) (7 : Fin 78) (4 : Fin 78)
    (18 : Fin 78) (0 : Fin 78) (52 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3025` (kalmanson). -/
theorem middleSource_h3025 :
    ((!((allOneRankAtom (sourceRanks P) 18 == allOneRankAtom (sourceRanks P) 0)) || ((allOneRankAtom (sourceRanks P) 52).ult (allOneRankAtom (sourceRanks P) 4)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (4 : Fin 78) (18 : Fin 78)
    (52 : Fin 78) (0 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (5 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (15 : Fin 78) (7 : Fin 78) (4 : Fin 78)
    (18 : Fin 78) (0 : Fin 78) (52 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3026` (kalmanson). -/
theorem middleSource_h3026 :
    ((!((allOneRankAtom (sourceRanks P) 18 == allOneRankAtom (sourceRanks P) 52)) || ((allOneRankAtom (sourceRanks P) 0).ult (allOneRankAtom (sourceRanks P) 4)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (4 : Fin 78) (18 : Fin 78)
    (0 : Fin 78) (52 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (5 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (15 : Fin 78) (7 : Fin 78) (4 : Fin 78)
    (18 : Fin 78) (0 : Fin 78) (52 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3027` (kalmanson). -/
theorem middleSource_h3027 :
    ((!((allOneRankAtom (sourceRanks P) 4 == allOneRankAtom (sourceRanks P) 7)) || ((allOneRankAtom (sourceRanks P) 15).ult (allOneRankAtom (sourceRanks P) 18)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (18 : Fin 78) (4 : Fin 78)
    (15 : Fin 78) (7 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (5 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (15 : Fin 78) (7 : Fin 78) (4 : Fin 78)
    (18 : Fin 78) (0 : Fin 78) (52 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3028` (kalmanson). -/
theorem middleSource_h3028 :
    ((!((allOneRankAtom (sourceRanks P) 4 == allOneRankAtom (sourceRanks P) 15)) || ((allOneRankAtom (sourceRanks P) 7).ult (allOneRankAtom (sourceRanks P) 18)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (18 : Fin 78) (4 : Fin 78)
    (7 : Fin 78) (15 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (5 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (15 : Fin 78) (7 : Fin 78) (4 : Fin 78)
    (18 : Fin 78) (0 : Fin 78) (52 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3029` (kalmanson). -/
theorem middleSource_h3029 :
    ((!((allOneRankAtom (sourceRanks P) 18 == allOneRankAtom (sourceRanks P) 7)) || ((allOneRankAtom (sourceRanks P) 15).ult (allOneRankAtom (sourceRanks P) 4)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (4 : Fin 78) (18 : Fin 78)
    (15 : Fin 78) (7 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (5 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (15 : Fin 78) (7 : Fin 78) (4 : Fin 78)
    (18 : Fin 78) (0 : Fin 78) (52 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3030` (kalmanson). -/
theorem middleSource_h3030 :
    ((!((allOneRankAtom (sourceRanks P) 18 == allOneRankAtom (sourceRanks P) 15)) || ((allOneRankAtom (sourceRanks P) 7).ult (allOneRankAtom (sourceRanks P) 4)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (4 : Fin 78) (18 : Fin 78)
    (7 : Fin 78) (15 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (5 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (15 : Fin 78) (7 : Fin 78) (4 : Fin 78)
    (18 : Fin 78) (0 : Fin 78) (52 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3031` (kalmanson). -/
theorem middleSource_h3031 :
    ((!((allOneRankAtom (sourceRanks P) 4 == allOneRankAtom (sourceRanks P) 0)) || ((allOneRankAtom (sourceRanks P) 53).ult (allOneRankAtom (sourceRanks P) 19)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (19 : Fin 78) (4 : Fin 78)
    (53 : Fin 78) (0 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (5 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (15 : Fin 78) (8 : Fin 78) (4 : Fin 78)
    (19 : Fin 78) (0 : Fin 78) (53 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3032` (kalmanson). -/
theorem middleSource_h3032 :
    ((!((allOneRankAtom (sourceRanks P) 4 == allOneRankAtom (sourceRanks P) 53)) || ((allOneRankAtom (sourceRanks P) 0).ult (allOneRankAtom (sourceRanks P) 19)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (19 : Fin 78) (4 : Fin 78)
    (0 : Fin 78) (53 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (5 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (15 : Fin 78) (8 : Fin 78) (4 : Fin 78)
    (19 : Fin 78) (0 : Fin 78) (53 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3033` (kalmanson). -/
theorem middleSource_h3033 :
    ((!((allOneRankAtom (sourceRanks P) 19 == allOneRankAtom (sourceRanks P) 0)) || ((allOneRankAtom (sourceRanks P) 53).ult (allOneRankAtom (sourceRanks P) 4)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (4 : Fin 78) (19 : Fin 78)
    (53 : Fin 78) (0 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (5 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (15 : Fin 78) (8 : Fin 78) (4 : Fin 78)
    (19 : Fin 78) (0 : Fin 78) (53 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3034` (kalmanson). -/
theorem middleSource_h3034 :
    ((!((allOneRankAtom (sourceRanks P) 19 == allOneRankAtom (sourceRanks P) 53)) || ((allOneRankAtom (sourceRanks P) 0).ult (allOneRankAtom (sourceRanks P) 4)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (4 : Fin 78) (19 : Fin 78)
    (0 : Fin 78) (53 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (5 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (15 : Fin 78) (8 : Fin 78) (4 : Fin 78)
    (19 : Fin 78) (0 : Fin 78) (53 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3035` (kalmanson). -/
theorem middleSource_h3035 :
    ((!((allOneRankAtom (sourceRanks P) 4 == allOneRankAtom (sourceRanks P) 8)) || ((allOneRankAtom (sourceRanks P) 15).ult (allOneRankAtom (sourceRanks P) 19)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (19 : Fin 78) (4 : Fin 78)
    (15 : Fin 78) (8 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (5 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (15 : Fin 78) (8 : Fin 78) (4 : Fin 78)
    (19 : Fin 78) (0 : Fin 78) (53 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3036` (kalmanson). -/
theorem middleSource_h3036 :
    ((!((allOneRankAtom (sourceRanks P) 4 == allOneRankAtom (sourceRanks P) 15)) || ((allOneRankAtom (sourceRanks P) 8).ult (allOneRankAtom (sourceRanks P) 19)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (19 : Fin 78) (4 : Fin 78)
    (8 : Fin 78) (15 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (5 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (15 : Fin 78) (8 : Fin 78) (4 : Fin 78)
    (19 : Fin 78) (0 : Fin 78) (53 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3037` (kalmanson). -/
theorem middleSource_h3037 :
    ((!((allOneRankAtom (sourceRanks P) 19 == allOneRankAtom (sourceRanks P) 8)) || ((allOneRankAtom (sourceRanks P) 15).ult (allOneRankAtom (sourceRanks P) 4)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (4 : Fin 78) (19 : Fin 78)
    (15 : Fin 78) (8 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (5 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (15 : Fin 78) (8 : Fin 78) (4 : Fin 78)
    (19 : Fin 78) (0 : Fin 78) (53 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3038` (kalmanson). -/
theorem middleSource_h3038 :
    ((!((allOneRankAtom (sourceRanks P) 19 == allOneRankAtom (sourceRanks P) 15)) || ((allOneRankAtom (sourceRanks P) 8).ult (allOneRankAtom (sourceRanks P) 4)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (4 : Fin 78) (19 : Fin 78)
    (8 : Fin 78) (15 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (5 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (15 : Fin 78) (8 : Fin 78) (4 : Fin 78)
    (19 : Fin 78) (0 : Fin 78) (53 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3039` (kalmanson). -/
theorem middleSource_h3039 :
    ((!((allOneRankAtom (sourceRanks P) 4 == allOneRankAtom (sourceRanks P) 0)) || ((allOneRankAtom (sourceRanks P) 54).ult (allOneRankAtom (sourceRanks P) 20)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (20 : Fin 78) (4 : Fin 78)
    (54 : Fin 78) (0 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (5 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (15 : Fin 78) (9 : Fin 78) (4 : Fin 78)
    (20 : Fin 78) (0 : Fin 78) (54 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3040` (kalmanson). -/
theorem middleSource_h3040 :
    ((!((allOneRankAtom (sourceRanks P) 4 == allOneRankAtom (sourceRanks P) 54)) || ((allOneRankAtom (sourceRanks P) 0).ult (allOneRankAtom (sourceRanks P) 20)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (20 : Fin 78) (4 : Fin 78)
    (0 : Fin 78) (54 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (5 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (15 : Fin 78) (9 : Fin 78) (4 : Fin 78)
    (20 : Fin 78) (0 : Fin 78) (54 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3041` (kalmanson). -/
theorem middleSource_h3041 :
    ((!((allOneRankAtom (sourceRanks P) 20 == allOneRankAtom (sourceRanks P) 0)) || ((allOneRankAtom (sourceRanks P) 54).ult (allOneRankAtom (sourceRanks P) 4)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (4 : Fin 78) (20 : Fin 78)
    (54 : Fin 78) (0 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (5 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (15 : Fin 78) (9 : Fin 78) (4 : Fin 78)
    (20 : Fin 78) (0 : Fin 78) (54 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3042` (kalmanson). -/
theorem middleSource_h3042 :
    ((!((allOneRankAtom (sourceRanks P) 20 == allOneRankAtom (sourceRanks P) 54)) || ((allOneRankAtom (sourceRanks P) 0).ult (allOneRankAtom (sourceRanks P) 4)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (4 : Fin 78) (20 : Fin 78)
    (0 : Fin 78) (54 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (5 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (15 : Fin 78) (9 : Fin 78) (4 : Fin 78)
    (20 : Fin 78) (0 : Fin 78) (54 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3043` (kalmanson). -/
theorem middleSource_h3043 :
    ((!((allOneRankAtom (sourceRanks P) 4 == allOneRankAtom (sourceRanks P) 9)) || ((allOneRankAtom (sourceRanks P) 15).ult (allOneRankAtom (sourceRanks P) 20)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (20 : Fin 78) (4 : Fin 78)
    (15 : Fin 78) (9 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (5 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (15 : Fin 78) (9 : Fin 78) (4 : Fin 78)
    (20 : Fin 78) (0 : Fin 78) (54 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3044` (kalmanson). -/
theorem middleSource_h3044 :
    ((!((allOneRankAtom (sourceRanks P) 4 == allOneRankAtom (sourceRanks P) 15)) || ((allOneRankAtom (sourceRanks P) 9).ult (allOneRankAtom (sourceRanks P) 20)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (20 : Fin 78) (4 : Fin 78)
    (9 : Fin 78) (15 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (5 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (15 : Fin 78) (9 : Fin 78) (4 : Fin 78)
    (20 : Fin 78) (0 : Fin 78) (54 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3045` (kalmanson). -/
theorem middleSource_h3045 :
    ((!((allOneRankAtom (sourceRanks P) 20 == allOneRankAtom (sourceRanks P) 9)) || ((allOneRankAtom (sourceRanks P) 15).ult (allOneRankAtom (sourceRanks P) 4)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (4 : Fin 78) (20 : Fin 78)
    (15 : Fin 78) (9 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (5 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (15 : Fin 78) (9 : Fin 78) (4 : Fin 78)
    (20 : Fin 78) (0 : Fin 78) (54 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3046` (kalmanson). -/
theorem middleSource_h3046 :
    ((!((allOneRankAtom (sourceRanks P) 20 == allOneRankAtom (sourceRanks P) 15)) || ((allOneRankAtom (sourceRanks P) 9).ult (allOneRankAtom (sourceRanks P) 4)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (4 : Fin 78) (20 : Fin 78)
    (9 : Fin 78) (15 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (5 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (15 : Fin 78) (9 : Fin 78) (4 : Fin 78)
    (20 : Fin 78) (0 : Fin 78) (54 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3047` (kalmanson). -/
theorem middleSource_h3047 :
    ((!((allOneRankAtom (sourceRanks P) 4 == allOneRankAtom (sourceRanks P) 0)) || ((allOneRankAtom (sourceRanks P) 55).ult (allOneRankAtom (sourceRanks P) 21)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (21 : Fin 78) (4 : Fin 78)
    (55 : Fin 78) (0 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (5 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (15 : Fin 78) (10 : Fin 78) (4 : Fin 78)
    (21 : Fin 78) (0 : Fin 78) (55 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3048` (kalmanson). -/
theorem middleSource_h3048 :
    ((!((allOneRankAtom (sourceRanks P) 4 == allOneRankAtom (sourceRanks P) 55)) || ((allOneRankAtom (sourceRanks P) 0).ult (allOneRankAtom (sourceRanks P) 21)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (21 : Fin 78) (4 : Fin 78)
    (0 : Fin 78) (55 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (5 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (15 : Fin 78) (10 : Fin 78) (4 : Fin 78)
    (21 : Fin 78) (0 : Fin 78) (55 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3049` (kalmanson). -/
theorem middleSource_h3049 :
    ((!((allOneRankAtom (sourceRanks P) 21 == allOneRankAtom (sourceRanks P) 0)) || ((allOneRankAtom (sourceRanks P) 55).ult (allOneRankAtom (sourceRanks P) 4)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (4 : Fin 78) (21 : Fin 78)
    (55 : Fin 78) (0 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (5 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (15 : Fin 78) (10 : Fin 78) (4 : Fin 78)
    (21 : Fin 78) (0 : Fin 78) (55 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3050` (kalmanson). -/
theorem middleSource_h3050 :
    ((!((allOneRankAtom (sourceRanks P) 21 == allOneRankAtom (sourceRanks P) 55)) || ((allOneRankAtom (sourceRanks P) 0).ult (allOneRankAtom (sourceRanks P) 4)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (4 : Fin 78) (21 : Fin 78)
    (0 : Fin 78) (55 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (5 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (15 : Fin 78) (10 : Fin 78) (4 : Fin 78)
    (21 : Fin 78) (0 : Fin 78) (55 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3051` (kalmanson). -/
theorem middleSource_h3051 :
    ((!((allOneRankAtom (sourceRanks P) 4 == allOneRankAtom (sourceRanks P) 10)) || ((allOneRankAtom (sourceRanks P) 15).ult (allOneRankAtom (sourceRanks P) 21)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (21 : Fin 78) (4 : Fin 78)
    (15 : Fin 78) (10 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (5 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (15 : Fin 78) (10 : Fin 78) (4 : Fin 78)
    (21 : Fin 78) (0 : Fin 78) (55 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3052` (kalmanson). -/
theorem middleSource_h3052 :
    ((!((allOneRankAtom (sourceRanks P) 4 == allOneRankAtom (sourceRanks P) 15)) || ((allOneRankAtom (sourceRanks P) 10).ult (allOneRankAtom (sourceRanks P) 21)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (21 : Fin 78) (4 : Fin 78)
    (10 : Fin 78) (15 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (5 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (15 : Fin 78) (10 : Fin 78) (4 : Fin 78)
    (21 : Fin 78) (0 : Fin 78) (55 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3053` (kalmanson). -/
theorem middleSource_h3053 :
    ((!((allOneRankAtom (sourceRanks P) 21 == allOneRankAtom (sourceRanks P) 10)) || ((allOneRankAtom (sourceRanks P) 15).ult (allOneRankAtom (sourceRanks P) 4)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (4 : Fin 78) (21 : Fin 78)
    (15 : Fin 78) (10 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (5 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (15 : Fin 78) (10 : Fin 78) (4 : Fin 78)
    (21 : Fin 78) (0 : Fin 78) (55 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3054` (kalmanson). -/
theorem middleSource_h3054 :
    ((!((allOneRankAtom (sourceRanks P) 21 == allOneRankAtom (sourceRanks P) 15)) || ((allOneRankAtom (sourceRanks P) 10).ult (allOneRankAtom (sourceRanks P) 4)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (4 : Fin 78) (21 : Fin 78)
    (10 : Fin 78) (15 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (5 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (15 : Fin 78) (10 : Fin 78) (4 : Fin 78)
    (21 : Fin 78) (0 : Fin 78) (55 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3055` (kalmanson). -/
theorem middleSource_h3055 :
    ((!((allOneRankAtom (sourceRanks P) 4 == allOneRankAtom (sourceRanks P) 0)) || ((allOneRankAtom (sourceRanks P) 56).ult (allOneRankAtom (sourceRanks P) 22)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (22 : Fin 78) (4 : Fin 78)
    (56 : Fin 78) (0 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (5 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (15 : Fin 78) (11 : Fin 78) (4 : Fin 78)
    (22 : Fin 78) (0 : Fin 78) (56 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3056` (kalmanson). -/
theorem middleSource_h3056 :
    ((!((allOneRankAtom (sourceRanks P) 4 == allOneRankAtom (sourceRanks P) 56)) || ((allOneRankAtom (sourceRanks P) 0).ult (allOneRankAtom (sourceRanks P) 22)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (22 : Fin 78) (4 : Fin 78)
    (0 : Fin 78) (56 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (5 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (15 : Fin 78) (11 : Fin 78) (4 : Fin 78)
    (22 : Fin 78) (0 : Fin 78) (56 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3057` (kalmanson). -/
theorem middleSource_h3057 :
    ((!((allOneRankAtom (sourceRanks P) 22 == allOneRankAtom (sourceRanks P) 0)) || ((allOneRankAtom (sourceRanks P) 56).ult (allOneRankAtom (sourceRanks P) 4)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (4 : Fin 78) (22 : Fin 78)
    (56 : Fin 78) (0 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (5 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (15 : Fin 78) (11 : Fin 78) (4 : Fin 78)
    (22 : Fin 78) (0 : Fin 78) (56 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3058` (kalmanson). -/
theorem middleSource_h3058 :
    ((!((allOneRankAtom (sourceRanks P) 22 == allOneRankAtom (sourceRanks P) 56)) || ((allOneRankAtom (sourceRanks P) 0).ult (allOneRankAtom (sourceRanks P) 4)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (4 : Fin 78) (22 : Fin 78)
    (0 : Fin 78) (56 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (5 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (15 : Fin 78) (11 : Fin 78) (4 : Fin 78)
    (22 : Fin 78) (0 : Fin 78) (56 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3059` (kalmanson). -/
theorem middleSource_h3059 :
    ((!((allOneRankAtom (sourceRanks P) 4 == allOneRankAtom (sourceRanks P) 11)) || ((allOneRankAtom (sourceRanks P) 15).ult (allOneRankAtom (sourceRanks P) 22)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (22 : Fin 78) (4 : Fin 78)
    (15 : Fin 78) (11 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (5 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (15 : Fin 78) (11 : Fin 78) (4 : Fin 78)
    (22 : Fin 78) (0 : Fin 78) (56 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3060` (kalmanson). -/
theorem middleSource_h3060 :
    ((!((allOneRankAtom (sourceRanks P) 4 == allOneRankAtom (sourceRanks P) 15)) || ((allOneRankAtom (sourceRanks P) 11).ult (allOneRankAtom (sourceRanks P) 22)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (22 : Fin 78) (4 : Fin 78)
    (11 : Fin 78) (15 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (5 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (15 : Fin 78) (11 : Fin 78) (4 : Fin 78)
    (22 : Fin 78) (0 : Fin 78) (56 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3061` (kalmanson). -/
theorem middleSource_h3061 :
    ((!((allOneRankAtom (sourceRanks P) 22 == allOneRankAtom (sourceRanks P) 11)) || ((allOneRankAtom (sourceRanks P) 15).ult (allOneRankAtom (sourceRanks P) 4)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (4 : Fin 78) (22 : Fin 78)
    (15 : Fin 78) (11 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (5 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (15 : Fin 78) (11 : Fin 78) (4 : Fin 78)
    (22 : Fin 78) (0 : Fin 78) (56 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3062` (kalmanson). -/
theorem middleSource_h3062 :
    ((!((allOneRankAtom (sourceRanks P) 22 == allOneRankAtom (sourceRanks P) 15)) || ((allOneRankAtom (sourceRanks P) 11).ult (allOneRankAtom (sourceRanks P) 4)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (4 : Fin 78) (22 : Fin 78)
    (11 : Fin 78) (15 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (5 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (15 : Fin 78) (11 : Fin 78) (4 : Fin 78)
    (22 : Fin 78) (0 : Fin 78) (56 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3063` (kalmanson). -/
theorem middleSource_h3063 :
    ((!((allOneRankAtom (sourceRanks P) 5 == allOneRankAtom (sourceRanks P) 0)) || ((allOneRankAtom (sourceRanks P) 57).ult (allOneRankAtom (sourceRanks P) 17)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (17 : Fin 78) (5 : Fin 78)
    (57 : Fin 78) (0 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (6 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (16 : Fin 78) (6 : Fin 78) (5 : Fin 78)
    (17 : Fin 78) (0 : Fin 78) (57 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3064` (kalmanson). -/
theorem middleSource_h3064 :
    ((!((allOneRankAtom (sourceRanks P) 5 == allOneRankAtom (sourceRanks P) 57)) || ((allOneRankAtom (sourceRanks P) 0).ult (allOneRankAtom (sourceRanks P) 17)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (17 : Fin 78) (5 : Fin 78)
    (0 : Fin 78) (57 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (6 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (16 : Fin 78) (6 : Fin 78) (5 : Fin 78)
    (17 : Fin 78) (0 : Fin 78) (57 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3065` (kalmanson). -/
theorem middleSource_h3065 :
    ((!((allOneRankAtom (sourceRanks P) 17 == allOneRankAtom (sourceRanks P) 0)) || ((allOneRankAtom (sourceRanks P) 57).ult (allOneRankAtom (sourceRanks P) 5)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (5 : Fin 78) (17 : Fin 78)
    (57 : Fin 78) (0 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (6 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (16 : Fin 78) (6 : Fin 78) (5 : Fin 78)
    (17 : Fin 78) (0 : Fin 78) (57 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3066` (kalmanson). -/
theorem middleSource_h3066 :
    ((!((allOneRankAtom (sourceRanks P) 5 == allOneRankAtom (sourceRanks P) 6)) || ((allOneRankAtom (sourceRanks P) 16).ult (allOneRankAtom (sourceRanks P) 17)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (17 : Fin 78) (5 : Fin 78)
    (16 : Fin 78) (6 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (6 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (16 : Fin 78) (6 : Fin 78) (5 : Fin 78)
    (17 : Fin 78) (0 : Fin 78) (57 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3067` (kalmanson). -/
theorem middleSource_h3067 :
    ((!((allOneRankAtom (sourceRanks P) 5 == allOneRankAtom (sourceRanks P) 16)) || ((allOneRankAtom (sourceRanks P) 6).ult (allOneRankAtom (sourceRanks P) 17)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (17 : Fin 78) (5 : Fin 78)
    (6 : Fin 78) (16 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (6 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (16 : Fin 78) (6 : Fin 78) (5 : Fin 78)
    (17 : Fin 78) (0 : Fin 78) (57 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3068` (kalmanson). -/
theorem middleSource_h3068 :
    ((!((allOneRankAtom (sourceRanks P) 17 == allOneRankAtom (sourceRanks P) 6)) || ((allOneRankAtom (sourceRanks P) 16).ult (allOneRankAtom (sourceRanks P) 5)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (5 : Fin 78) (17 : Fin 78)
    (16 : Fin 78) (6 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (6 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (16 : Fin 78) (6 : Fin 78) (5 : Fin 78)
    (17 : Fin 78) (0 : Fin 78) (57 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3069` (kalmanson). -/
theorem middleSource_h3069 :
    ((!((allOneRankAtom (sourceRanks P) 17 == allOneRankAtom (sourceRanks P) 16)) || ((allOneRankAtom (sourceRanks P) 6).ult (allOneRankAtom (sourceRanks P) 5)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (5 : Fin 78) (17 : Fin 78)
    (6 : Fin 78) (16 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (6 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (16 : Fin 78) (6 : Fin 78) (5 : Fin 78)
    (17 : Fin 78) (0 : Fin 78) (57 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3070` (kalmanson). -/
theorem middleSource_h3070 :
    ((!((allOneRankAtom (sourceRanks P) 5 == allOneRankAtom (sourceRanks P) 0)) || ((allOneRankAtom (sourceRanks P) 58).ult (allOneRankAtom (sourceRanks P) 18)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (18 : Fin 78) (5 : Fin 78)
    (58 : Fin 78) (0 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (6 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (16 : Fin 78) (7 : Fin 78) (5 : Fin 78)
    (18 : Fin 78) (0 : Fin 78) (58 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3071` (kalmanson). -/
theorem middleSource_h3071 :
    ((!((allOneRankAtom (sourceRanks P) 5 == allOneRankAtom (sourceRanks P) 58)) || ((allOneRankAtom (sourceRanks P) 0).ult (allOneRankAtom (sourceRanks P) 18)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (18 : Fin 78) (5 : Fin 78)
    (0 : Fin 78) (58 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (6 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (16 : Fin 78) (7 : Fin 78) (5 : Fin 78)
    (18 : Fin 78) (0 : Fin 78) (58 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

end

end ATailExactFiveCard13AllOneSourceIngressScratch
end Problem97
