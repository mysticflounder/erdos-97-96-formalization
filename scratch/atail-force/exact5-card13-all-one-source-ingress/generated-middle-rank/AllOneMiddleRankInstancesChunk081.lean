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

/-- Candidate middle source assertion `h5184` (kalmanson). -/
theorem middleSource_h5184 :
    ((!((allOneRankAtom (sourceRanks P) 19 == allOneRankAtom (sourceRanks P) 18)) || ((allOneRankAtom (sourceRanks P) 72).ult (allOneRankAtom (sourceRanks P) 69)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (69 : Fin 78) (19 : Fin 78)
    (72 : Fin 78) (18 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (8 : Fin 13) (9 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (68 : Fin 78) (20 : Fin 78) (19 : Fin 78)
    (69 : Fin 78) (18 : Fin 78) (72 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5185` (kalmanson). -/
theorem middleSource_h5185 :
    ((!((allOneRankAtom (sourceRanks P) 19 == allOneRankAtom (sourceRanks P) 72)) || ((allOneRankAtom (sourceRanks P) 18).ult (allOneRankAtom (sourceRanks P) 69)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (69 : Fin 78) (19 : Fin 78)
    (18 : Fin 78) (72 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (8 : Fin 13) (9 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (68 : Fin 78) (20 : Fin 78) (19 : Fin 78)
    (69 : Fin 78) (18 : Fin 78) (72 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5186` (kalmanson). -/
theorem middleSource_h5186 :
    ((!((allOneRankAtom (sourceRanks P) 69 == allOneRankAtom (sourceRanks P) 18)) || ((allOneRankAtom (sourceRanks P) 72).ult (allOneRankAtom (sourceRanks P) 19)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (19 : Fin 78) (69 : Fin 78)
    (72 : Fin 78) (18 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (8 : Fin 13) (9 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (68 : Fin 78) (20 : Fin 78) (19 : Fin 78)
    (69 : Fin 78) (18 : Fin 78) (72 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5187` (kalmanson). -/
theorem middleSource_h5187 :
    ((!((allOneRankAtom (sourceRanks P) 69 == allOneRankAtom (sourceRanks P) 72)) || ((allOneRankAtom (sourceRanks P) 18).ult (allOneRankAtom (sourceRanks P) 19)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (19 : Fin 78) (69 : Fin 78)
    (18 : Fin 78) (72 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (8 : Fin 13) (9 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (68 : Fin 78) (20 : Fin 78) (19 : Fin 78)
    (69 : Fin 78) (18 : Fin 78) (72 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5188` (kalmanson). -/
theorem middleSource_h5188 :
    ((!((allOneRankAtom (sourceRanks P) 19 == allOneRankAtom (sourceRanks P) 20)) || ((allOneRankAtom (sourceRanks P) 68).ult (allOneRankAtom (sourceRanks P) 69)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (69 : Fin 78) (19 : Fin 78)
    (68 : Fin 78) (20 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (8 : Fin 13) (9 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (68 : Fin 78) (20 : Fin 78) (19 : Fin 78)
    (69 : Fin 78) (18 : Fin 78) (72 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5189` (kalmanson). -/
theorem middleSource_h5189 :
    ((!((allOneRankAtom (sourceRanks P) 19 == allOneRankAtom (sourceRanks P) 68)) || ((allOneRankAtom (sourceRanks P) 20).ult (allOneRankAtom (sourceRanks P) 69)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (69 : Fin 78) (19 : Fin 78)
    (20 : Fin 78) (68 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (8 : Fin 13) (9 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (68 : Fin 78) (20 : Fin 78) (19 : Fin 78)
    (69 : Fin 78) (18 : Fin 78) (72 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5190` (kalmanson). -/
theorem middleSource_h5190 :
    ((!((allOneRankAtom (sourceRanks P) 69 == allOneRankAtom (sourceRanks P) 20)) || ((allOneRankAtom (sourceRanks P) 68).ult (allOneRankAtom (sourceRanks P) 19)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (19 : Fin 78) (69 : Fin 78)
    (68 : Fin 78) (20 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (8 : Fin 13) (9 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (68 : Fin 78) (20 : Fin 78) (19 : Fin 78)
    (69 : Fin 78) (18 : Fin 78) (72 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5191` (kalmanson). -/
theorem middleSource_h5191 :
    ((!((allOneRankAtom (sourceRanks P) 19 == allOneRankAtom (sourceRanks P) 18)) || ((allOneRankAtom (sourceRanks P) 73).ult (allOneRankAtom (sourceRanks P) 70)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (70 : Fin 78) (19 : Fin 78)
    (73 : Fin 78) (18 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (8 : Fin 13) (9 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (68 : Fin 78) (21 : Fin 78) (19 : Fin 78)
    (70 : Fin 78) (18 : Fin 78) (73 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5192` (kalmanson). -/
theorem middleSource_h5192 :
    ((!((allOneRankAtom (sourceRanks P) 19 == allOneRankAtom (sourceRanks P) 73)) || ((allOneRankAtom (sourceRanks P) 18).ult (allOneRankAtom (sourceRanks P) 70)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (70 : Fin 78) (19 : Fin 78)
    (18 : Fin 78) (73 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (8 : Fin 13) (9 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (68 : Fin 78) (21 : Fin 78) (19 : Fin 78)
    (70 : Fin 78) (18 : Fin 78) (73 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5193` (kalmanson). -/
theorem middleSource_h5193 :
    ((!((allOneRankAtom (sourceRanks P) 70 == allOneRankAtom (sourceRanks P) 18)) || ((allOneRankAtom (sourceRanks P) 73).ult (allOneRankAtom (sourceRanks P) 19)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (19 : Fin 78) (70 : Fin 78)
    (73 : Fin 78) (18 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (8 : Fin 13) (9 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (68 : Fin 78) (21 : Fin 78) (19 : Fin 78)
    (70 : Fin 78) (18 : Fin 78) (73 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5194` (kalmanson). -/
theorem middleSource_h5194 :
    ((!((allOneRankAtom (sourceRanks P) 70 == allOneRankAtom (sourceRanks P) 73)) || ((allOneRankAtom (sourceRanks P) 18).ult (allOneRankAtom (sourceRanks P) 19)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (19 : Fin 78) (70 : Fin 78)
    (18 : Fin 78) (73 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (8 : Fin 13) (9 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (68 : Fin 78) (21 : Fin 78) (19 : Fin 78)
    (70 : Fin 78) (18 : Fin 78) (73 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5195` (kalmanson). -/
theorem middleSource_h5195 :
    ((!((allOneRankAtom (sourceRanks P) 19 == allOneRankAtom (sourceRanks P) 21)) || ((allOneRankAtom (sourceRanks P) 68).ult (allOneRankAtom (sourceRanks P) 70)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (70 : Fin 78) (19 : Fin 78)
    (68 : Fin 78) (21 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (8 : Fin 13) (9 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (68 : Fin 78) (21 : Fin 78) (19 : Fin 78)
    (70 : Fin 78) (18 : Fin 78) (73 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5196` (kalmanson). -/
theorem middleSource_h5196 :
    ((!((allOneRankAtom (sourceRanks P) 19 == allOneRankAtom (sourceRanks P) 68)) || ((allOneRankAtom (sourceRanks P) 21).ult (allOneRankAtom (sourceRanks P) 70)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (70 : Fin 78) (19 : Fin 78)
    (21 : Fin 78) (68 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (8 : Fin 13) (9 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (68 : Fin 78) (21 : Fin 78) (19 : Fin 78)
    (70 : Fin 78) (18 : Fin 78) (73 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5197` (kalmanson). -/
theorem middleSource_h5197 :
    ((!((allOneRankAtom (sourceRanks P) 70 == allOneRankAtom (sourceRanks P) 21)) || ((allOneRankAtom (sourceRanks P) 68).ult (allOneRankAtom (sourceRanks P) 19)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (19 : Fin 78) (70 : Fin 78)
    (68 : Fin 78) (21 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (8 : Fin 13) (9 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (68 : Fin 78) (21 : Fin 78) (19 : Fin 78)
    (70 : Fin 78) (18 : Fin 78) (73 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5198` (kalmanson). -/
theorem middleSource_h5198 :
    ((!((allOneRankAtom (sourceRanks P) 19 == allOneRankAtom (sourceRanks P) 18)) || ((allOneRankAtom (sourceRanks P) 74).ult (allOneRankAtom (sourceRanks P) 71)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (71 : Fin 78) (19 : Fin 78)
    (74 : Fin 78) (18 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (8 : Fin 13) (9 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (68 : Fin 78) (22 : Fin 78) (19 : Fin 78)
    (71 : Fin 78) (18 : Fin 78) (74 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5199` (kalmanson). -/
theorem middleSource_h5199 :
    ((!((allOneRankAtom (sourceRanks P) 19 == allOneRankAtom (sourceRanks P) 74)) || ((allOneRankAtom (sourceRanks P) 18).ult (allOneRankAtom (sourceRanks P) 71)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (71 : Fin 78) (19 : Fin 78)
    (18 : Fin 78) (74 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (8 : Fin 13) (9 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (68 : Fin 78) (22 : Fin 78) (19 : Fin 78)
    (71 : Fin 78) (18 : Fin 78) (74 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5200` (kalmanson). -/
theorem middleSource_h5200 :
    ((!((allOneRankAtom (sourceRanks P) 71 == allOneRankAtom (sourceRanks P) 18)) || ((allOneRankAtom (sourceRanks P) 74).ult (allOneRankAtom (sourceRanks P) 19)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (19 : Fin 78) (71 : Fin 78)
    (74 : Fin 78) (18 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (8 : Fin 13) (9 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (68 : Fin 78) (22 : Fin 78) (19 : Fin 78)
    (71 : Fin 78) (18 : Fin 78) (74 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5201` (kalmanson). -/
theorem middleSource_h5201 :
    ((!((allOneRankAtom (sourceRanks P) 19 == allOneRankAtom (sourceRanks P) 22)) || ((allOneRankAtom (sourceRanks P) 68).ult (allOneRankAtom (sourceRanks P) 71)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (71 : Fin 78) (19 : Fin 78)
    (68 : Fin 78) (22 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (8 : Fin 13) (9 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (68 : Fin 78) (22 : Fin 78) (19 : Fin 78)
    (71 : Fin 78) (18 : Fin 78) (74 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5202` (kalmanson). -/
theorem middleSource_h5202 :
    ((!((allOneRankAtom (sourceRanks P) 19 == allOneRankAtom (sourceRanks P) 68)) || ((allOneRankAtom (sourceRanks P) 22).ult (allOneRankAtom (sourceRanks P) 71)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (71 : Fin 78) (19 : Fin 78)
    (22 : Fin 78) (68 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (8 : Fin 13) (9 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (68 : Fin 78) (22 : Fin 78) (19 : Fin 78)
    (71 : Fin 78) (18 : Fin 78) (74 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5203` (kalmanson). -/
theorem middleSource_h5203 :
    ((!((allOneRankAtom (sourceRanks P) 20 == allOneRankAtom (sourceRanks P) 18)) || ((allOneRankAtom (sourceRanks P) 75).ult (allOneRankAtom (sourceRanks P) 70)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (70 : Fin 78) (20 : Fin 78)
    (75 : Fin 78) (18 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (8 : Fin 13) (10 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (69 : Fin 78) (21 : Fin 78) (20 : Fin 78)
    (70 : Fin 78) (18 : Fin 78) (75 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5204` (kalmanson). -/
theorem middleSource_h5204 :
    ((!((allOneRankAtom (sourceRanks P) 20 == allOneRankAtom (sourceRanks P) 75)) || ((allOneRankAtom (sourceRanks P) 18).ult (allOneRankAtom (sourceRanks P) 70)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (70 : Fin 78) (20 : Fin 78)
    (18 : Fin 78) (75 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (8 : Fin 13) (10 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (69 : Fin 78) (21 : Fin 78) (20 : Fin 78)
    (70 : Fin 78) (18 : Fin 78) (75 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5205` (kalmanson). -/
theorem middleSource_h5205 :
    ((!((allOneRankAtom (sourceRanks P) 70 == allOneRankAtom (sourceRanks P) 18)) || ((allOneRankAtom (sourceRanks P) 75).ult (allOneRankAtom (sourceRanks P) 20)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (20 : Fin 78) (70 : Fin 78)
    (75 : Fin 78) (18 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (8 : Fin 13) (10 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (69 : Fin 78) (21 : Fin 78) (20 : Fin 78)
    (70 : Fin 78) (18 : Fin 78) (75 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5206` (kalmanson). -/
theorem middleSource_h5206 :
    ((!((allOneRankAtom (sourceRanks P) 70 == allOneRankAtom (sourceRanks P) 75)) || ((allOneRankAtom (sourceRanks P) 18).ult (allOneRankAtom (sourceRanks P) 20)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (20 : Fin 78) (70 : Fin 78)
    (18 : Fin 78) (75 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (8 : Fin 13) (10 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (69 : Fin 78) (21 : Fin 78) (20 : Fin 78)
    (70 : Fin 78) (18 : Fin 78) (75 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5207` (kalmanson). -/
theorem middleSource_h5207 :
    ((!((allOneRankAtom (sourceRanks P) 20 == allOneRankAtom (sourceRanks P) 21)) || ((allOneRankAtom (sourceRanks P) 69).ult (allOneRankAtom (sourceRanks P) 70)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (70 : Fin 78) (20 : Fin 78)
    (69 : Fin 78) (21 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (8 : Fin 13) (10 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (69 : Fin 78) (21 : Fin 78) (20 : Fin 78)
    (70 : Fin 78) (18 : Fin 78) (75 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5208` (kalmanson). -/
theorem middleSource_h5208 :
    ((!((allOneRankAtom (sourceRanks P) 20 == allOneRankAtom (sourceRanks P) 69)) || ((allOneRankAtom (sourceRanks P) 21).ult (allOneRankAtom (sourceRanks P) 70)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (70 : Fin 78) (20 : Fin 78)
    (21 : Fin 78) (69 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (8 : Fin 13) (10 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (69 : Fin 78) (21 : Fin 78) (20 : Fin 78)
    (70 : Fin 78) (18 : Fin 78) (75 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5209` (kalmanson). -/
theorem middleSource_h5209 :
    ((!((allOneRankAtom (sourceRanks P) 70 == allOneRankAtom (sourceRanks P) 21)) || ((allOneRankAtom (sourceRanks P) 69).ult (allOneRankAtom (sourceRanks P) 20)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (20 : Fin 78) (70 : Fin 78)
    (69 : Fin 78) (21 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (8 : Fin 13) (10 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (69 : Fin 78) (21 : Fin 78) (20 : Fin 78)
    (70 : Fin 78) (18 : Fin 78) (75 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5210` (kalmanson). -/
theorem middleSource_h5210 :
    ((!((allOneRankAtom (sourceRanks P) 20 == allOneRankAtom (sourceRanks P) 18)) || ((allOneRankAtom (sourceRanks P) 76).ult (allOneRankAtom (sourceRanks P) 71)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (71 : Fin 78) (20 : Fin 78)
    (76 : Fin 78) (18 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (8 : Fin 13) (10 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (69 : Fin 78) (22 : Fin 78) (20 : Fin 78)
    (71 : Fin 78) (18 : Fin 78) (76 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5211` (kalmanson). -/
theorem middleSource_h5211 :
    ((!((allOneRankAtom (sourceRanks P) 20 == allOneRankAtom (sourceRanks P) 76)) || ((allOneRankAtom (sourceRanks P) 18).ult (allOneRankAtom (sourceRanks P) 71)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (71 : Fin 78) (20 : Fin 78)
    (18 : Fin 78) (76 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (8 : Fin 13) (10 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (69 : Fin 78) (22 : Fin 78) (20 : Fin 78)
    (71 : Fin 78) (18 : Fin 78) (76 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5212` (kalmanson). -/
theorem middleSource_h5212 :
    ((!((allOneRankAtom (sourceRanks P) 71 == allOneRankAtom (sourceRanks P) 18)) || ((allOneRankAtom (sourceRanks P) 76).ult (allOneRankAtom (sourceRanks P) 20)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (20 : Fin 78) (71 : Fin 78)
    (76 : Fin 78) (18 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (8 : Fin 13) (10 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (69 : Fin 78) (22 : Fin 78) (20 : Fin 78)
    (71 : Fin 78) (18 : Fin 78) (76 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5213` (kalmanson). -/
theorem middleSource_h5213 :
    ((!((allOneRankAtom (sourceRanks P) 20 == allOneRankAtom (sourceRanks P) 22)) || ((allOneRankAtom (sourceRanks P) 69).ult (allOneRankAtom (sourceRanks P) 71)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (71 : Fin 78) (20 : Fin 78)
    (69 : Fin 78) (22 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (8 : Fin 13) (10 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (69 : Fin 78) (22 : Fin 78) (20 : Fin 78)
    (71 : Fin 78) (18 : Fin 78) (76 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5214` (kalmanson). -/
theorem middleSource_h5214 :
    ((!((allOneRankAtom (sourceRanks P) 20 == allOneRankAtom (sourceRanks P) 69)) || ((allOneRankAtom (sourceRanks P) 22).ult (allOneRankAtom (sourceRanks P) 71)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (71 : Fin 78) (20 : Fin 78)
    (22 : Fin 78) (69 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (8 : Fin 13) (10 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (69 : Fin 78) (22 : Fin 78) (20 : Fin 78)
    (71 : Fin 78) (18 : Fin 78) (76 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5215` (kalmanson). -/
theorem middleSource_h5215 :
    ((!((allOneRankAtom (sourceRanks P) 21 == allOneRankAtom (sourceRanks P) 18)) || ((allOneRankAtom (sourceRanks P) 77).ult (allOneRankAtom (sourceRanks P) 71)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (71 : Fin 78) (21 : Fin 78)
    (77 : Fin 78) (18 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (8 : Fin 13) (11 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (70 : Fin 78) (22 : Fin 78) (21 : Fin 78)
    (71 : Fin 78) (18 : Fin 78) (77 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5216` (kalmanson). -/
theorem middleSource_h5216 :
    ((!((allOneRankAtom (sourceRanks P) 21 == allOneRankAtom (sourceRanks P) 77)) || ((allOneRankAtom (sourceRanks P) 18).ult (allOneRankAtom (sourceRanks P) 71)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (71 : Fin 78) (21 : Fin 78)
    (18 : Fin 78) (77 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (8 : Fin 13) (11 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (70 : Fin 78) (22 : Fin 78) (21 : Fin 78)
    (71 : Fin 78) (18 : Fin 78) (77 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5217` (kalmanson). -/
theorem middleSource_h5217 :
    ((!((allOneRankAtom (sourceRanks P) 71 == allOneRankAtom (sourceRanks P) 18)) || ((allOneRankAtom (sourceRanks P) 77).ult (allOneRankAtom (sourceRanks P) 21)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (21 : Fin 78) (71 : Fin 78)
    (77 : Fin 78) (18 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (8 : Fin 13) (11 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (70 : Fin 78) (22 : Fin 78) (21 : Fin 78)
    (71 : Fin 78) (18 : Fin 78) (77 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5218` (kalmanson). -/
theorem middleSource_h5218 :
    ((!((allOneRankAtom (sourceRanks P) 21 == allOneRankAtom (sourceRanks P) 22)) || ((allOneRankAtom (sourceRanks P) 70).ult (allOneRankAtom (sourceRanks P) 71)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (71 : Fin 78) (21 : Fin 78)
    (70 : Fin 78) (22 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (8 : Fin 13) (11 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (70 : Fin 78) (22 : Fin 78) (21 : Fin 78)
    (71 : Fin 78) (18 : Fin 78) (77 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5219` (kalmanson). -/
theorem middleSource_h5219 :
    ((!((allOneRankAtom (sourceRanks P) 21 == allOneRankAtom (sourceRanks P) 70)) || ((allOneRankAtom (sourceRanks P) 22).ult (allOneRankAtom (sourceRanks P) 71)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (71 : Fin 78) (21 : Fin 78)
    (22 : Fin 78) (70 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (8 : Fin 13) (11 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (70 : Fin 78) (22 : Fin 78) (21 : Fin 78)
    (71 : Fin 78) (18 : Fin 78) (77 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5220` (kalmanson). -/
theorem middleSource_h5220 :
    ((!((allOneRankAtom (sourceRanks P) 20 == allOneRankAtom (sourceRanks P) 19)) || ((allOneRankAtom (sourceRanks P) 75).ult (allOneRankAtom (sourceRanks P) 73)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (73 : Fin 78) (20 : Fin 78)
    (75 : Fin 78) (19 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (9 : Fin 13) (10 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (72 : Fin 78) (21 : Fin 78) (20 : Fin 78)
    (73 : Fin 78) (19 : Fin 78) (75 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5221` (kalmanson). -/
theorem middleSource_h5221 :
    ((!((allOneRankAtom (sourceRanks P) 20 == allOneRankAtom (sourceRanks P) 75)) || ((allOneRankAtom (sourceRanks P) 19).ult (allOneRankAtom (sourceRanks P) 73)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (73 : Fin 78) (20 : Fin 78)
    (19 : Fin 78) (75 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (9 : Fin 13) (10 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (72 : Fin 78) (21 : Fin 78) (20 : Fin 78)
    (73 : Fin 78) (19 : Fin 78) (75 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5222` (kalmanson). -/
theorem middleSource_h5222 :
    ((!((allOneRankAtom (sourceRanks P) 73 == allOneRankAtom (sourceRanks P) 19)) || ((allOneRankAtom (sourceRanks P) 75).ult (allOneRankAtom (sourceRanks P) 20)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (20 : Fin 78) (73 : Fin 78)
    (75 : Fin 78) (19 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (9 : Fin 13) (10 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (72 : Fin 78) (21 : Fin 78) (20 : Fin 78)
    (73 : Fin 78) (19 : Fin 78) (75 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5223` (kalmanson). -/
theorem middleSource_h5223 :
    ((!((allOneRankAtom (sourceRanks P) 73 == allOneRankAtom (sourceRanks P) 75)) || ((allOneRankAtom (sourceRanks P) 19).ult (allOneRankAtom (sourceRanks P) 20)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (20 : Fin 78) (73 : Fin 78)
    (19 : Fin 78) (75 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (9 : Fin 13) (10 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (72 : Fin 78) (21 : Fin 78) (20 : Fin 78)
    (73 : Fin 78) (19 : Fin 78) (75 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5224` (kalmanson). -/
theorem middleSource_h5224 :
    ((!((allOneRankAtom (sourceRanks P) 20 == allOneRankAtom (sourceRanks P) 21)) || ((allOneRankAtom (sourceRanks P) 72).ult (allOneRankAtom (sourceRanks P) 73)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (73 : Fin 78) (20 : Fin 78)
    (72 : Fin 78) (21 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (9 : Fin 13) (10 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (72 : Fin 78) (21 : Fin 78) (20 : Fin 78)
    (73 : Fin 78) (19 : Fin 78) (75 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5225` (kalmanson). -/
theorem middleSource_h5225 :
    ((!((allOneRankAtom (sourceRanks P) 20 == allOneRankAtom (sourceRanks P) 72)) || ((allOneRankAtom (sourceRanks P) 21).ult (allOneRankAtom (sourceRanks P) 73)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (73 : Fin 78) (20 : Fin 78)
    (21 : Fin 78) (72 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (9 : Fin 13) (10 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (72 : Fin 78) (21 : Fin 78) (20 : Fin 78)
    (73 : Fin 78) (19 : Fin 78) (75 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5226` (kalmanson). -/
theorem middleSource_h5226 :
    ((!((allOneRankAtom (sourceRanks P) 73 == allOneRankAtom (sourceRanks P) 21)) || ((allOneRankAtom (sourceRanks P) 72).ult (allOneRankAtom (sourceRanks P) 20)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (20 : Fin 78) (73 : Fin 78)
    (72 : Fin 78) (21 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (9 : Fin 13) (10 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (72 : Fin 78) (21 : Fin 78) (20 : Fin 78)
    (73 : Fin 78) (19 : Fin 78) (75 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5227` (kalmanson). -/
theorem middleSource_h5227 :
    ((!((allOneRankAtom (sourceRanks P) 73 == allOneRankAtom (sourceRanks P) 72)) || ((allOneRankAtom (sourceRanks P) 21).ult (allOneRankAtom (sourceRanks P) 20)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (20 : Fin 78) (73 : Fin 78)
    (21 : Fin 78) (72 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (9 : Fin 13) (10 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (72 : Fin 78) (21 : Fin 78) (20 : Fin 78)
    (73 : Fin 78) (19 : Fin 78) (75 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5228` (kalmanson). -/
theorem middleSource_h5228 :
    ((!((allOneRankAtom (sourceRanks P) 20 == allOneRankAtom (sourceRanks P) 19)) || ((allOneRankAtom (sourceRanks P) 76).ult (allOneRankAtom (sourceRanks P) 74)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (74 : Fin 78) (20 : Fin 78)
    (76 : Fin 78) (19 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (9 : Fin 13) (10 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (72 : Fin 78) (22 : Fin 78) (20 : Fin 78)
    (74 : Fin 78) (19 : Fin 78) (76 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5229` (kalmanson). -/
theorem middleSource_h5229 :
    ((!((allOneRankAtom (sourceRanks P) 20 == allOneRankAtom (sourceRanks P) 76)) || ((allOneRankAtom (sourceRanks P) 19).ult (allOneRankAtom (sourceRanks P) 74)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (74 : Fin 78) (20 : Fin 78)
    (19 : Fin 78) (76 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (9 : Fin 13) (10 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (72 : Fin 78) (22 : Fin 78) (20 : Fin 78)
    (74 : Fin 78) (19 : Fin 78) (76 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5230` (kalmanson). -/
theorem middleSource_h5230 :
    ((!((allOneRankAtom (sourceRanks P) 74 == allOneRankAtom (sourceRanks P) 19)) || ((allOneRankAtom (sourceRanks P) 76).ult (allOneRankAtom (sourceRanks P) 20)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (20 : Fin 78) (74 : Fin 78)
    (76 : Fin 78) (19 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (9 : Fin 13) (10 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (72 : Fin 78) (22 : Fin 78) (20 : Fin 78)
    (74 : Fin 78) (19 : Fin 78) (76 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5231` (kalmanson). -/
theorem middleSource_h5231 :
    ((!((allOneRankAtom (sourceRanks P) 20 == allOneRankAtom (sourceRanks P) 22)) || ((allOneRankAtom (sourceRanks P) 72).ult (allOneRankAtom (sourceRanks P) 74)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (74 : Fin 78) (20 : Fin 78)
    (72 : Fin 78) (22 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (9 : Fin 13) (10 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (72 : Fin 78) (22 : Fin 78) (20 : Fin 78)
    (74 : Fin 78) (19 : Fin 78) (76 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5232` (kalmanson). -/
theorem middleSource_h5232 :
    ((!((allOneRankAtom (sourceRanks P) 20 == allOneRankAtom (sourceRanks P) 72)) || ((allOneRankAtom (sourceRanks P) 22).ult (allOneRankAtom (sourceRanks P) 74)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (74 : Fin 78) (20 : Fin 78)
    (22 : Fin 78) (72 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (9 : Fin 13) (10 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (72 : Fin 78) (22 : Fin 78) (20 : Fin 78)
    (74 : Fin 78) (19 : Fin 78) (76 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5233` (kalmanson). -/
theorem middleSource_h5233 :
    ((!((allOneRankAtom (sourceRanks P) 74 == allOneRankAtom (sourceRanks P) 72)) || ((allOneRankAtom (sourceRanks P) 22).ult (allOneRankAtom (sourceRanks P) 20)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (20 : Fin 78) (74 : Fin 78)
    (22 : Fin 78) (72 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (9 : Fin 13) (10 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (72 : Fin 78) (22 : Fin 78) (20 : Fin 78)
    (74 : Fin 78) (19 : Fin 78) (76 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5234` (kalmanson). -/
theorem middleSource_h5234 :
    ((!((allOneRankAtom (sourceRanks P) 21 == allOneRankAtom (sourceRanks P) 19)) || ((allOneRankAtom (sourceRanks P) 77).ult (allOneRankAtom (sourceRanks P) 74)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (74 : Fin 78) (21 : Fin 78)
    (77 : Fin 78) (19 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (9 : Fin 13) (11 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (73 : Fin 78) (22 : Fin 78) (21 : Fin 78)
    (74 : Fin 78) (19 : Fin 78) (77 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5235` (kalmanson). -/
theorem middleSource_h5235 :
    ((!((allOneRankAtom (sourceRanks P) 21 == allOneRankAtom (sourceRanks P) 77)) || ((allOneRankAtom (sourceRanks P) 19).ult (allOneRankAtom (sourceRanks P) 74)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (74 : Fin 78) (21 : Fin 78)
    (19 : Fin 78) (77 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (9 : Fin 13) (11 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (73 : Fin 78) (22 : Fin 78) (21 : Fin 78)
    (74 : Fin 78) (19 : Fin 78) (77 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5236` (kalmanson). -/
theorem middleSource_h5236 :
    ((!((allOneRankAtom (sourceRanks P) 74 == allOneRankAtom (sourceRanks P) 19)) || ((allOneRankAtom (sourceRanks P) 77).ult (allOneRankAtom (sourceRanks P) 21)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (21 : Fin 78) (74 : Fin 78)
    (77 : Fin 78) (19 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (9 : Fin 13) (11 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (73 : Fin 78) (22 : Fin 78) (21 : Fin 78)
    (74 : Fin 78) (19 : Fin 78) (77 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5237` (kalmanson). -/
theorem middleSource_h5237 :
    ((!((allOneRankAtom (sourceRanks P) 21 == allOneRankAtom (sourceRanks P) 22)) || ((allOneRankAtom (sourceRanks P) 73).ult (allOneRankAtom (sourceRanks P) 74)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (74 : Fin 78) (21 : Fin 78)
    (73 : Fin 78) (22 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (9 : Fin 13) (11 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (73 : Fin 78) (22 : Fin 78) (21 : Fin 78)
    (74 : Fin 78) (19 : Fin 78) (77 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5238` (kalmanson). -/
theorem middleSource_h5238 :
    ((!((allOneRankAtom (sourceRanks P) 21 == allOneRankAtom (sourceRanks P) 73)) || ((allOneRankAtom (sourceRanks P) 22).ult (allOneRankAtom (sourceRanks P) 74)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (74 : Fin 78) (21 : Fin 78)
    (22 : Fin 78) (73 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (9 : Fin 13) (11 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (73 : Fin 78) (22 : Fin 78) (21 : Fin 78)
    (74 : Fin 78) (19 : Fin 78) (77 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5239` (kalmanson). -/
theorem middleSource_h5239 :
    ((!((allOneRankAtom (sourceRanks P) 74 == allOneRankAtom (sourceRanks P) 73)) || ((allOneRankAtom (sourceRanks P) 22).ult (allOneRankAtom (sourceRanks P) 21)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (21 : Fin 78) (74 : Fin 78)
    (22 : Fin 78) (73 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (9 : Fin 13) (11 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (73 : Fin 78) (22 : Fin 78) (21 : Fin 78)
    (74 : Fin 78) (19 : Fin 78) (77 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5240` (kalmanson). -/
theorem middleSource_h5240 :
    ((!((allOneRankAtom (sourceRanks P) 21 == allOneRankAtom (sourceRanks P) 20)) || ((allOneRankAtom (sourceRanks P) 77).ult (allOneRankAtom (sourceRanks P) 76)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (76 : Fin 78) (21 : Fin 78)
    (77 : Fin 78) (20 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (10 : Fin 13) (11 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (75 : Fin 78) (22 : Fin 78) (21 : Fin 78)
    (76 : Fin 78) (20 : Fin 78) (77 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5241` (kalmanson). -/
theorem middleSource_h5241 :
    ((!((allOneRankAtom (sourceRanks P) 21 == allOneRankAtom (sourceRanks P) 77)) || ((allOneRankAtom (sourceRanks P) 20).ult (allOneRankAtom (sourceRanks P) 76)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (76 : Fin 78) (21 : Fin 78)
    (20 : Fin 78) (77 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (10 : Fin 13) (11 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (75 : Fin 78) (22 : Fin 78) (21 : Fin 78)
    (76 : Fin 78) (20 : Fin 78) (77 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5242` (kalmanson). -/
theorem middleSource_h5242 :
    ((!((allOneRankAtom (sourceRanks P) 76 == allOneRankAtom (sourceRanks P) 20)) || ((allOneRankAtom (sourceRanks P) 77).ult (allOneRankAtom (sourceRanks P) 21)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (21 : Fin 78) (76 : Fin 78)
    (77 : Fin 78) (20 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (10 : Fin 13) (11 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (75 : Fin 78) (22 : Fin 78) (21 : Fin 78)
    (76 : Fin 78) (20 : Fin 78) (77 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5243` (kalmanson). -/
theorem middleSource_h5243 :
    ((!((allOneRankAtom (sourceRanks P) 21 == allOneRankAtom (sourceRanks P) 22)) || ((allOneRankAtom (sourceRanks P) 75).ult (allOneRankAtom (sourceRanks P) 76)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (76 : Fin 78) (21 : Fin 78)
    (75 : Fin 78) (22 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (10 : Fin 13) (11 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (75 : Fin 78) (22 : Fin 78) (21 : Fin 78)
    (76 : Fin 78) (20 : Fin 78) (77 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5244` (kalmanson). -/
theorem middleSource_h5244 :
    ((!((allOneRankAtom (sourceRanks P) 21 == allOneRankAtom (sourceRanks P) 75)) || ((allOneRankAtom (sourceRanks P) 22).ult (allOneRankAtom (sourceRanks P) 76)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (76 : Fin 78) (21 : Fin 78)
    (22 : Fin 78) (75 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (10 : Fin 13) (11 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (75 : Fin 78) (22 : Fin 78) (21 : Fin 78)
    (76 : Fin 78) (20 : Fin 78) (77 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5245` (kalmanson). -/
theorem middleSource_h5245 :
    ((!((allOneRankAtom (sourceRanks P) 76 == allOneRankAtom (sourceRanks P) 75)) || ((allOneRankAtom (sourceRanks P) 22).ult (allOneRankAtom (sourceRanks P) 21)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (21 : Fin 78) (76 : Fin 78)
    (22 : Fin 78) (75 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (10 : Fin 13) (11 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (75 : Fin 78) (22 : Fin 78) (21 : Fin 78)
    (76 : Fin 78) (20 : Fin 78) (77 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5246` (kalmanson). -/
theorem middleSource_h5246 :
    ((!((allOneRankAtom (sourceRanks P) 24 == allOneRankAtom (sourceRanks P) 23)) || ((allOneRankAtom (sourceRanks P) 42).ult (allOneRankAtom (sourceRanks P) 34)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (34 : Fin 78) (24 : Fin 78)
    (42 : Fin 78) (23 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (4 : Fin 13) (5 : Fin 13)
    (by decide) (by decide) (by decide)
    (33 : Fin 78) (25 : Fin 78) (24 : Fin 78)
    (34 : Fin 78) (23 : Fin 78) (42 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5247` (kalmanson). -/
theorem middleSource_h5247 :
    ((!((allOneRankAtom (sourceRanks P) 34 == allOneRankAtom (sourceRanks P) 42)) || ((allOneRankAtom (sourceRanks P) 23).ult (allOneRankAtom (sourceRanks P) 24)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (24 : Fin 78) (34 : Fin 78)
    (23 : Fin 78) (42 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (4 : Fin 13) (5 : Fin 13)
    (by decide) (by decide) (by decide)
    (33 : Fin 78) (25 : Fin 78) (24 : Fin 78)
    (34 : Fin 78) (23 : Fin 78) (42 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

end

end ATailExactFiveCard13AllOneSourceIngressScratch
end Problem97
