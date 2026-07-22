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

/-- Candidate middle source assertion `h4544` (kalmanson). -/
theorem middleSource_h4544 :
    ((!((allOneRankAtom (sourceRanks P) 37 == allOneRankAtom (sourceRanks P) 18)) || ((allOneRankAtom (sourceRanks P) 34).ult (allOneRankAtom (sourceRanks P) 15)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (15 : Fin 78) (37 : Fin 78)
    (34 : Fin 78) (18 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (3 : Fin 13) (5 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (34 : Fin 78) (18 : Fin 78) (15 : Fin 78)
    (37 : Fin 78) (13 : Fin 78) (52 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4545` (kalmanson). -/
theorem middleSource_h4545 :
    ((!((allOneRankAtom (sourceRanks P) 37 == allOneRankAtom (sourceRanks P) 34)) || ((allOneRankAtom (sourceRanks P) 18).ult (allOneRankAtom (sourceRanks P) 15)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (15 : Fin 78) (37 : Fin 78)
    (18 : Fin 78) (34 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (3 : Fin 13) (5 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (34 : Fin 78) (18 : Fin 78) (15 : Fin 78)
    (37 : Fin 78) (13 : Fin 78) (52 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4546` (kalmanson). -/
theorem middleSource_h4546 :
    ((!((allOneRankAtom (sourceRanks P) 15 == allOneRankAtom (sourceRanks P) 13)) || ((allOneRankAtom (sourceRanks P) 53).ult (allOneRankAtom (sourceRanks P) 38)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (38 : Fin 78) (15 : Fin 78)
    (53 : Fin 78) (13 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (3 : Fin 13) (5 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (34 : Fin 78) (19 : Fin 78) (15 : Fin 78)
    (38 : Fin 78) (13 : Fin 78) (53 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4547` (kalmanson). -/
theorem middleSource_h4547 :
    ((!((allOneRankAtom (sourceRanks P) 15 == allOneRankAtom (sourceRanks P) 53)) || ((allOneRankAtom (sourceRanks P) 13).ult (allOneRankAtom (sourceRanks P) 38)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (38 : Fin 78) (15 : Fin 78)
    (13 : Fin 78) (53 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (3 : Fin 13) (5 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (34 : Fin 78) (19 : Fin 78) (15 : Fin 78)
    (38 : Fin 78) (13 : Fin 78) (53 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4548` (kalmanson). -/
theorem middleSource_h4548 :
    ((!((allOneRankAtom (sourceRanks P) 38 == allOneRankAtom (sourceRanks P) 53)) || ((allOneRankAtom (sourceRanks P) 13).ult (allOneRankAtom (sourceRanks P) 15)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (15 : Fin 78) (38 : Fin 78)
    (13 : Fin 78) (53 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (3 : Fin 13) (5 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (34 : Fin 78) (19 : Fin 78) (15 : Fin 78)
    (38 : Fin 78) (13 : Fin 78) (53 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4549` (kalmanson). -/
theorem middleSource_h4549 :
    ((!((allOneRankAtom (sourceRanks P) 15 == allOneRankAtom (sourceRanks P) 19)) || ((allOneRankAtom (sourceRanks P) 34).ult (allOneRankAtom (sourceRanks P) 38)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (38 : Fin 78) (15 : Fin 78)
    (34 : Fin 78) (19 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (3 : Fin 13) (5 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (34 : Fin 78) (19 : Fin 78) (15 : Fin 78)
    (38 : Fin 78) (13 : Fin 78) (53 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4550` (kalmanson). -/
theorem middleSource_h4550 :
    ((!((allOneRankAtom (sourceRanks P) 15 == allOneRankAtom (sourceRanks P) 13)) || ((allOneRankAtom (sourceRanks P) 54).ult (allOneRankAtom (sourceRanks P) 39)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (39 : Fin 78) (15 : Fin 78)
    (54 : Fin 78) (13 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (3 : Fin 13) (5 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (34 : Fin 78) (20 : Fin 78) (15 : Fin 78)
    (39 : Fin 78) (13 : Fin 78) (54 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4551` (kalmanson). -/
theorem middleSource_h4551 :
    ((!((allOneRankAtom (sourceRanks P) 15 == allOneRankAtom (sourceRanks P) 54)) || ((allOneRankAtom (sourceRanks P) 13).ult (allOneRankAtom (sourceRanks P) 39)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (39 : Fin 78) (15 : Fin 78)
    (13 : Fin 78) (54 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (3 : Fin 13) (5 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (34 : Fin 78) (20 : Fin 78) (15 : Fin 78)
    (39 : Fin 78) (13 : Fin 78) (54 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4552` (kalmanson). -/
theorem middleSource_h4552 :
    ((!((allOneRankAtom (sourceRanks P) 39 == allOneRankAtom (sourceRanks P) 54)) || ((allOneRankAtom (sourceRanks P) 13).ult (allOneRankAtom (sourceRanks P) 15)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (15 : Fin 78) (39 : Fin 78)
    (13 : Fin 78) (54 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (3 : Fin 13) (5 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (34 : Fin 78) (20 : Fin 78) (15 : Fin 78)
    (39 : Fin 78) (13 : Fin 78) (54 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4553` (kalmanson). -/
theorem middleSource_h4553 :
    ((!((allOneRankAtom (sourceRanks P) 15 == allOneRankAtom (sourceRanks P) 20)) || ((allOneRankAtom (sourceRanks P) 34).ult (allOneRankAtom (sourceRanks P) 39)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (39 : Fin 78) (15 : Fin 78)
    (34 : Fin 78) (20 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (3 : Fin 13) (5 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (34 : Fin 78) (20 : Fin 78) (15 : Fin 78)
    (39 : Fin 78) (13 : Fin 78) (54 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4554` (kalmanson). -/
theorem middleSource_h4554 :
    ((!((allOneRankAtom (sourceRanks P) 15 == allOneRankAtom (sourceRanks P) 13)) || ((allOneRankAtom (sourceRanks P) 55).ult (allOneRankAtom (sourceRanks P) 40)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (40 : Fin 78) (15 : Fin 78)
    (55 : Fin 78) (13 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (3 : Fin 13) (5 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (34 : Fin 78) (21 : Fin 78) (15 : Fin 78)
    (40 : Fin 78) (13 : Fin 78) (55 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4555` (kalmanson). -/
theorem middleSource_h4555 :
    ((!((allOneRankAtom (sourceRanks P) 15 == allOneRankAtom (sourceRanks P) 55)) || ((allOneRankAtom (sourceRanks P) 13).ult (allOneRankAtom (sourceRanks P) 40)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (40 : Fin 78) (15 : Fin 78)
    (13 : Fin 78) (55 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (3 : Fin 13) (5 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (34 : Fin 78) (21 : Fin 78) (15 : Fin 78)
    (40 : Fin 78) (13 : Fin 78) (55 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4556` (kalmanson). -/
theorem middleSource_h4556 :
    ((!((allOneRankAtom (sourceRanks P) 40 == allOneRankAtom (sourceRanks P) 55)) || ((allOneRankAtom (sourceRanks P) 13).ult (allOneRankAtom (sourceRanks P) 15)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (15 : Fin 78) (40 : Fin 78)
    (13 : Fin 78) (55 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (3 : Fin 13) (5 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (34 : Fin 78) (21 : Fin 78) (15 : Fin 78)
    (40 : Fin 78) (13 : Fin 78) (55 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4557` (kalmanson). -/
theorem middleSource_h4557 :
    ((!((allOneRankAtom (sourceRanks P) 15 == allOneRankAtom (sourceRanks P) 21)) || ((allOneRankAtom (sourceRanks P) 34).ult (allOneRankAtom (sourceRanks P) 40)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (40 : Fin 78) (15 : Fin 78)
    (34 : Fin 78) (21 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (3 : Fin 13) (5 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (34 : Fin 78) (21 : Fin 78) (15 : Fin 78)
    (40 : Fin 78) (13 : Fin 78) (55 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4558` (kalmanson). -/
theorem middleSource_h4558 :
    ((!((allOneRankAtom (sourceRanks P) 15 == allOneRankAtom (sourceRanks P) 13)) || ((allOneRankAtom (sourceRanks P) 56).ult (allOneRankAtom (sourceRanks P) 41)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (41 : Fin 78) (15 : Fin 78)
    (56 : Fin 78) (13 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (3 : Fin 13) (5 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (34 : Fin 78) (22 : Fin 78) (15 : Fin 78)
    (41 : Fin 78) (13 : Fin 78) (56 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4559` (kalmanson). -/
theorem middleSource_h4559 :
    ((!((allOneRankAtom (sourceRanks P) 15 == allOneRankAtom (sourceRanks P) 56)) || ((allOneRankAtom (sourceRanks P) 13).ult (allOneRankAtom (sourceRanks P) 41)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (41 : Fin 78) (15 : Fin 78)
    (13 : Fin 78) (56 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (3 : Fin 13) (5 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (34 : Fin 78) (22 : Fin 78) (15 : Fin 78)
    (41 : Fin 78) (13 : Fin 78) (56 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4560` (kalmanson). -/
theorem middleSource_h4560 :
    ((!((allOneRankAtom (sourceRanks P) 15 == allOneRankAtom (sourceRanks P) 22)) || ((allOneRankAtom (sourceRanks P) 34).ult (allOneRankAtom (sourceRanks P) 41)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (41 : Fin 78) (15 : Fin 78)
    (34 : Fin 78) (22 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (3 : Fin 13) (5 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (34 : Fin 78) (22 : Fin 78) (15 : Fin 78)
    (41 : Fin 78) (13 : Fin 78) (56 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4561` (kalmanson). -/
theorem middleSource_h4561 :
    ((!((allOneRankAtom (sourceRanks P) 16 == allOneRankAtom (sourceRanks P) 13)) || ((allOneRankAtom (sourceRanks P) 57).ult (allOneRankAtom (sourceRanks P) 36)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (36 : Fin 78) (16 : Fin 78)
    (57 : Fin 78) (13 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (3 : Fin 13) (6 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (35 : Fin 78) (17 : Fin 78) (16 : Fin 78)
    (36 : Fin 78) (13 : Fin 78) (57 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4562` (kalmanson). -/
theorem middleSource_h4562 :
    ((!((allOneRankAtom (sourceRanks P) 16 == allOneRankAtom (sourceRanks P) 57)) || ((allOneRankAtom (sourceRanks P) 13).ult (allOneRankAtom (sourceRanks P) 36)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (36 : Fin 78) (16 : Fin 78)
    (13 : Fin 78) (57 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (3 : Fin 13) (6 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (35 : Fin 78) (17 : Fin 78) (16 : Fin 78)
    (36 : Fin 78) (13 : Fin 78) (57 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4563` (kalmanson). -/
theorem middleSource_h4563 :
    ((!((allOneRankAtom (sourceRanks P) 16 == allOneRankAtom (sourceRanks P) 17)) || ((allOneRankAtom (sourceRanks P) 35).ult (allOneRankAtom (sourceRanks P) 36)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (36 : Fin 78) (16 : Fin 78)
    (35 : Fin 78) (17 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (3 : Fin 13) (6 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (35 : Fin 78) (17 : Fin 78) (16 : Fin 78)
    (36 : Fin 78) (13 : Fin 78) (57 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4564` (kalmanson). -/
theorem middleSource_h4564 :
    ((!((allOneRankAtom (sourceRanks P) 36 == allOneRankAtom (sourceRanks P) 35)) || ((allOneRankAtom (sourceRanks P) 17).ult (allOneRankAtom (sourceRanks P) 16)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (16 : Fin 78) (36 : Fin 78)
    (17 : Fin 78) (35 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (3 : Fin 13) (6 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (35 : Fin 78) (17 : Fin 78) (16 : Fin 78)
    (36 : Fin 78) (13 : Fin 78) (57 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4565` (kalmanson). -/
theorem middleSource_h4565 :
    ((!((allOneRankAtom (sourceRanks P) 16 == allOneRankAtom (sourceRanks P) 13)) || ((allOneRankAtom (sourceRanks P) 58).ult (allOneRankAtom (sourceRanks P) 37)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (37 : Fin 78) (16 : Fin 78)
    (58 : Fin 78) (13 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (3 : Fin 13) (6 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (35 : Fin 78) (18 : Fin 78) (16 : Fin 78)
    (37 : Fin 78) (13 : Fin 78) (58 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4566` (kalmanson). -/
theorem middleSource_h4566 :
    ((!((allOneRankAtom (sourceRanks P) 16 == allOneRankAtom (sourceRanks P) 58)) || ((allOneRankAtom (sourceRanks P) 13).ult (allOneRankAtom (sourceRanks P) 37)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (37 : Fin 78) (16 : Fin 78)
    (13 : Fin 78) (58 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (3 : Fin 13) (6 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (35 : Fin 78) (18 : Fin 78) (16 : Fin 78)
    (37 : Fin 78) (13 : Fin 78) (58 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4567` (kalmanson). -/
theorem middleSource_h4567 :
    ((!((allOneRankAtom (sourceRanks P) 37 == allOneRankAtom (sourceRanks P) 13)) || ((allOneRankAtom (sourceRanks P) 58).ult (allOneRankAtom (sourceRanks P) 16)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (16 : Fin 78) (37 : Fin 78)
    (58 : Fin 78) (13 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (3 : Fin 13) (6 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (35 : Fin 78) (18 : Fin 78) (16 : Fin 78)
    (37 : Fin 78) (13 : Fin 78) (58 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4568` (kalmanson). -/
theorem middleSource_h4568 :
    ((!((allOneRankAtom (sourceRanks P) 37 == allOneRankAtom (sourceRanks P) 58)) || ((allOneRankAtom (sourceRanks P) 13).ult (allOneRankAtom (sourceRanks P) 16)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (16 : Fin 78) (37 : Fin 78)
    (13 : Fin 78) (58 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (3 : Fin 13) (6 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (35 : Fin 78) (18 : Fin 78) (16 : Fin 78)
    (37 : Fin 78) (13 : Fin 78) (58 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4569` (kalmanson). -/
theorem middleSource_h4569 :
    ((!((allOneRankAtom (sourceRanks P) 16 == allOneRankAtom (sourceRanks P) 18)) || ((allOneRankAtom (sourceRanks P) 35).ult (allOneRankAtom (sourceRanks P) 37)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (37 : Fin 78) (16 : Fin 78)
    (35 : Fin 78) (18 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (3 : Fin 13) (6 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (35 : Fin 78) (18 : Fin 78) (16 : Fin 78)
    (37 : Fin 78) (13 : Fin 78) (58 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4570` (kalmanson). -/
theorem middleSource_h4570 :
    ((!((allOneRankAtom (sourceRanks P) 16 == allOneRankAtom (sourceRanks P) 35)) || ((allOneRankAtom (sourceRanks P) 18).ult (allOneRankAtom (sourceRanks P) 37)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (37 : Fin 78) (16 : Fin 78)
    (18 : Fin 78) (35 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (3 : Fin 13) (6 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (35 : Fin 78) (18 : Fin 78) (16 : Fin 78)
    (37 : Fin 78) (13 : Fin 78) (58 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4571` (kalmanson). -/
theorem middleSource_h4571 :
    ((!((allOneRankAtom (sourceRanks P) 37 == allOneRankAtom (sourceRanks P) 18)) || ((allOneRankAtom (sourceRanks P) 35).ult (allOneRankAtom (sourceRanks P) 16)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (16 : Fin 78) (37 : Fin 78)
    (35 : Fin 78) (18 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (3 : Fin 13) (6 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (35 : Fin 78) (18 : Fin 78) (16 : Fin 78)
    (37 : Fin 78) (13 : Fin 78) (58 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4572` (kalmanson). -/
theorem middleSource_h4572 :
    ((!((allOneRankAtom (sourceRanks P) 37 == allOneRankAtom (sourceRanks P) 35)) || ((allOneRankAtom (sourceRanks P) 18).ult (allOneRankAtom (sourceRanks P) 16)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (16 : Fin 78) (37 : Fin 78)
    (18 : Fin 78) (35 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (3 : Fin 13) (6 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (35 : Fin 78) (18 : Fin 78) (16 : Fin 78)
    (37 : Fin 78) (13 : Fin 78) (58 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4573` (kalmanson). -/
theorem middleSource_h4573 :
    ((!((allOneRankAtom (sourceRanks P) 16 == allOneRankAtom (sourceRanks P) 13)) || ((allOneRankAtom (sourceRanks P) 59).ult (allOneRankAtom (sourceRanks P) 38)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (38 : Fin 78) (16 : Fin 78)
    (59 : Fin 78) (13 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (3 : Fin 13) (6 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (35 : Fin 78) (19 : Fin 78) (16 : Fin 78)
    (38 : Fin 78) (13 : Fin 78) (59 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4574` (kalmanson). -/
theorem middleSource_h4574 :
    ((!((allOneRankAtom (sourceRanks P) 16 == allOneRankAtom (sourceRanks P) 59)) || ((allOneRankAtom (sourceRanks P) 13).ult (allOneRankAtom (sourceRanks P) 38)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (38 : Fin 78) (16 : Fin 78)
    (13 : Fin 78) (59 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (3 : Fin 13) (6 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (35 : Fin 78) (19 : Fin 78) (16 : Fin 78)
    (38 : Fin 78) (13 : Fin 78) (59 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4575` (kalmanson). -/
theorem middleSource_h4575 :
    ((!((allOneRankAtom (sourceRanks P) 38 == allOneRankAtom (sourceRanks P) 59)) || ((allOneRankAtom (sourceRanks P) 13).ult (allOneRankAtom (sourceRanks P) 16)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (16 : Fin 78) (38 : Fin 78)
    (13 : Fin 78) (59 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (3 : Fin 13) (6 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (35 : Fin 78) (19 : Fin 78) (16 : Fin 78)
    (38 : Fin 78) (13 : Fin 78) (59 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4576` (kalmanson). -/
theorem middleSource_h4576 :
    ((!((allOneRankAtom (sourceRanks P) 16 == allOneRankAtom (sourceRanks P) 19)) || ((allOneRankAtom (sourceRanks P) 35).ult (allOneRankAtom (sourceRanks P) 38)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (38 : Fin 78) (16 : Fin 78)
    (35 : Fin 78) (19 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (3 : Fin 13) (6 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (35 : Fin 78) (19 : Fin 78) (16 : Fin 78)
    (38 : Fin 78) (13 : Fin 78) (59 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4577` (kalmanson). -/
theorem middleSource_h4577 :
    ((!((allOneRankAtom (sourceRanks P) 16 == allOneRankAtom (sourceRanks P) 13)) || ((allOneRankAtom (sourceRanks P) 60).ult (allOneRankAtom (sourceRanks P) 39)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (39 : Fin 78) (16 : Fin 78)
    (60 : Fin 78) (13 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (3 : Fin 13) (6 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (35 : Fin 78) (20 : Fin 78) (16 : Fin 78)
    (39 : Fin 78) (13 : Fin 78) (60 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4578` (kalmanson). -/
theorem middleSource_h4578 :
    ((!((allOneRankAtom (sourceRanks P) 16 == allOneRankAtom (sourceRanks P) 60)) || ((allOneRankAtom (sourceRanks P) 13).ult (allOneRankAtom (sourceRanks P) 39)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (39 : Fin 78) (16 : Fin 78)
    (13 : Fin 78) (60 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (3 : Fin 13) (6 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (35 : Fin 78) (20 : Fin 78) (16 : Fin 78)
    (39 : Fin 78) (13 : Fin 78) (60 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4579` (kalmanson). -/
theorem middleSource_h4579 :
    ((!((allOneRankAtom (sourceRanks P) 39 == allOneRankAtom (sourceRanks P) 60)) || ((allOneRankAtom (sourceRanks P) 13).ult (allOneRankAtom (sourceRanks P) 16)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (16 : Fin 78) (39 : Fin 78)
    (13 : Fin 78) (60 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (3 : Fin 13) (6 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (35 : Fin 78) (20 : Fin 78) (16 : Fin 78)
    (39 : Fin 78) (13 : Fin 78) (60 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4580` (kalmanson). -/
theorem middleSource_h4580 :
    ((!((allOneRankAtom (sourceRanks P) 16 == allOneRankAtom (sourceRanks P) 20)) || ((allOneRankAtom (sourceRanks P) 35).ult (allOneRankAtom (sourceRanks P) 39)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (39 : Fin 78) (16 : Fin 78)
    (35 : Fin 78) (20 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (3 : Fin 13) (6 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (35 : Fin 78) (20 : Fin 78) (16 : Fin 78)
    (39 : Fin 78) (13 : Fin 78) (60 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4581` (kalmanson). -/
theorem middleSource_h4581 :
    ((!((allOneRankAtom (sourceRanks P) 16 == allOneRankAtom (sourceRanks P) 13)) || ((allOneRankAtom (sourceRanks P) 61).ult (allOneRankAtom (sourceRanks P) 40)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (40 : Fin 78) (16 : Fin 78)
    (61 : Fin 78) (13 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (3 : Fin 13) (6 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (35 : Fin 78) (21 : Fin 78) (16 : Fin 78)
    (40 : Fin 78) (13 : Fin 78) (61 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4582` (kalmanson). -/
theorem middleSource_h4582 :
    ((!((allOneRankAtom (sourceRanks P) 16 == allOneRankAtom (sourceRanks P) 61)) || ((allOneRankAtom (sourceRanks P) 13).ult (allOneRankAtom (sourceRanks P) 40)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (40 : Fin 78) (16 : Fin 78)
    (13 : Fin 78) (61 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (3 : Fin 13) (6 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (35 : Fin 78) (21 : Fin 78) (16 : Fin 78)
    (40 : Fin 78) (13 : Fin 78) (61 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4583` (kalmanson). -/
theorem middleSource_h4583 :
    ((!((allOneRankAtom (sourceRanks P) 40 == allOneRankAtom (sourceRanks P) 61)) || ((allOneRankAtom (sourceRanks P) 13).ult (allOneRankAtom (sourceRanks P) 16)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (16 : Fin 78) (40 : Fin 78)
    (13 : Fin 78) (61 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (3 : Fin 13) (6 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (35 : Fin 78) (21 : Fin 78) (16 : Fin 78)
    (40 : Fin 78) (13 : Fin 78) (61 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4584` (kalmanson). -/
theorem middleSource_h4584 :
    ((!((allOneRankAtom (sourceRanks P) 16 == allOneRankAtom (sourceRanks P) 21)) || ((allOneRankAtom (sourceRanks P) 35).ult (allOneRankAtom (sourceRanks P) 40)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (40 : Fin 78) (16 : Fin 78)
    (35 : Fin 78) (21 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (3 : Fin 13) (6 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (35 : Fin 78) (21 : Fin 78) (16 : Fin 78)
    (40 : Fin 78) (13 : Fin 78) (61 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4585` (kalmanson). -/
theorem middleSource_h4585 :
    ((!((allOneRankAtom (sourceRanks P) 40 == allOneRankAtom (sourceRanks P) 35)) || ((allOneRankAtom (sourceRanks P) 21).ult (allOneRankAtom (sourceRanks P) 16)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (16 : Fin 78) (40 : Fin 78)
    (21 : Fin 78) (35 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (3 : Fin 13) (6 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (35 : Fin 78) (21 : Fin 78) (16 : Fin 78)
    (40 : Fin 78) (13 : Fin 78) (61 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4586` (kalmanson). -/
theorem middleSource_h4586 :
    ((!((allOneRankAtom (sourceRanks P) 16 == allOneRankAtom (sourceRanks P) 13)) || ((allOneRankAtom (sourceRanks P) 62).ult (allOneRankAtom (sourceRanks P) 41)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (41 : Fin 78) (16 : Fin 78)
    (62 : Fin 78) (13 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (3 : Fin 13) (6 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (35 : Fin 78) (22 : Fin 78) (16 : Fin 78)
    (41 : Fin 78) (13 : Fin 78) (62 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4587` (kalmanson). -/
theorem middleSource_h4587 :
    ((!((allOneRankAtom (sourceRanks P) 16 == allOneRankAtom (sourceRanks P) 62)) || ((allOneRankAtom (sourceRanks P) 13).ult (allOneRankAtom (sourceRanks P) 41)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (41 : Fin 78) (16 : Fin 78)
    (13 : Fin 78) (62 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (3 : Fin 13) (6 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (35 : Fin 78) (22 : Fin 78) (16 : Fin 78)
    (41 : Fin 78) (13 : Fin 78) (62 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4588` (kalmanson). -/
theorem middleSource_h4588 :
    ((!((allOneRankAtom (sourceRanks P) 16 == allOneRankAtom (sourceRanks P) 22)) || ((allOneRankAtom (sourceRanks P) 35).ult (allOneRankAtom (sourceRanks P) 41)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (41 : Fin 78) (16 : Fin 78)
    (35 : Fin 78) (22 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (3 : Fin 13) (6 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (35 : Fin 78) (22 : Fin 78) (16 : Fin 78)
    (41 : Fin 78) (13 : Fin 78) (62 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4589` (kalmanson). -/
theorem middleSource_h4589 :
    ((!((allOneRankAtom (sourceRanks P) 37 == allOneRankAtom (sourceRanks P) 13)) || ((allOneRankAtom (sourceRanks P) 63).ult (allOneRankAtom (sourceRanks P) 17)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (17 : Fin 78) (37 : Fin 78)
    (63 : Fin 78) (13 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (3 : Fin 13) (7 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (36 : Fin 78) (18 : Fin 78) (17 : Fin 78)
    (37 : Fin 78) (13 : Fin 78) (63 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4590` (kalmanson). -/
theorem middleSource_h4590 :
    ((!((allOneRankAtom (sourceRanks P) 37 == allOneRankAtom (sourceRanks P) 63)) || ((allOneRankAtom (sourceRanks P) 13).ult (allOneRankAtom (sourceRanks P) 17)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (17 : Fin 78) (37 : Fin 78)
    (13 : Fin 78) (63 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (3 : Fin 13) (7 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (36 : Fin 78) (18 : Fin 78) (17 : Fin 78)
    (37 : Fin 78) (13 : Fin 78) (63 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4591` (kalmanson). -/
theorem middleSource_h4591 :
    ((!((allOneRankAtom (sourceRanks P) 17 == allOneRankAtom (sourceRanks P) 18)) || ((allOneRankAtom (sourceRanks P) 36).ult (allOneRankAtom (sourceRanks P) 37)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (37 : Fin 78) (17 : Fin 78)
    (36 : Fin 78) (18 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (3 : Fin 13) (7 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (36 : Fin 78) (18 : Fin 78) (17 : Fin 78)
    (37 : Fin 78) (13 : Fin 78) (63 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4592` (kalmanson). -/
theorem middleSource_h4592 :
    ((!((allOneRankAtom (sourceRanks P) 17 == allOneRankAtom (sourceRanks P) 36)) || ((allOneRankAtom (sourceRanks P) 18).ult (allOneRankAtom (sourceRanks P) 37)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (37 : Fin 78) (17 : Fin 78)
    (18 : Fin 78) (36 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (3 : Fin 13) (7 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (36 : Fin 78) (18 : Fin 78) (17 : Fin 78)
    (37 : Fin 78) (13 : Fin 78) (63 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4593` (kalmanson). -/
theorem middleSource_h4593 :
    ((!((allOneRankAtom (sourceRanks P) 37 == allOneRankAtom (sourceRanks P) 18)) || ((allOneRankAtom (sourceRanks P) 36).ult (allOneRankAtom (sourceRanks P) 17)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (17 : Fin 78) (37 : Fin 78)
    (36 : Fin 78) (18 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (3 : Fin 13) (7 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (36 : Fin 78) (18 : Fin 78) (17 : Fin 78)
    (37 : Fin 78) (13 : Fin 78) (63 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4594` (kalmanson). -/
theorem middleSource_h4594 :
    ((!((allOneRankAtom (sourceRanks P) 37 == allOneRankAtom (sourceRanks P) 36)) || ((allOneRankAtom (sourceRanks P) 18).ult (allOneRankAtom (sourceRanks P) 17)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (17 : Fin 78) (37 : Fin 78)
    (18 : Fin 78) (36 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (3 : Fin 13) (7 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (36 : Fin 78) (18 : Fin 78) (17 : Fin 78)
    (37 : Fin 78) (13 : Fin 78) (63 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4595` (kalmanson). -/
theorem middleSource_h4595 :
    ((!((allOneRankAtom (sourceRanks P) 17 == allOneRankAtom (sourceRanks P) 13)) || ((allOneRankAtom (sourceRanks P) 64).ult (allOneRankAtom (sourceRanks P) 38)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (38 : Fin 78) (17 : Fin 78)
    (64 : Fin 78) (13 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (3 : Fin 13) (7 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (36 : Fin 78) (19 : Fin 78) (17 : Fin 78)
    (38 : Fin 78) (13 : Fin 78) (64 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4596` (kalmanson). -/
theorem middleSource_h4596 :
    ((!((allOneRankAtom (sourceRanks P) 17 == allOneRankAtom (sourceRanks P) 64)) || ((allOneRankAtom (sourceRanks P) 13).ult (allOneRankAtom (sourceRanks P) 38)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (38 : Fin 78) (17 : Fin 78)
    (13 : Fin 78) (64 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (3 : Fin 13) (7 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (36 : Fin 78) (19 : Fin 78) (17 : Fin 78)
    (38 : Fin 78) (13 : Fin 78) (64 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4597` (kalmanson). -/
theorem middleSource_h4597 :
    ((!((allOneRankAtom (sourceRanks P) 38 == allOneRankAtom (sourceRanks P) 64)) || ((allOneRankAtom (sourceRanks P) 13).ult (allOneRankAtom (sourceRanks P) 17)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (17 : Fin 78) (38 : Fin 78)
    (13 : Fin 78) (64 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (3 : Fin 13) (7 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (36 : Fin 78) (19 : Fin 78) (17 : Fin 78)
    (38 : Fin 78) (13 : Fin 78) (64 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4598` (kalmanson). -/
theorem middleSource_h4598 :
    ((!((allOneRankAtom (sourceRanks P) 17 == allOneRankAtom (sourceRanks P) 19)) || ((allOneRankAtom (sourceRanks P) 36).ult (allOneRankAtom (sourceRanks P) 38)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (38 : Fin 78) (17 : Fin 78)
    (36 : Fin 78) (19 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (3 : Fin 13) (7 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (36 : Fin 78) (19 : Fin 78) (17 : Fin 78)
    (38 : Fin 78) (13 : Fin 78) (64 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4599` (kalmanson). -/
theorem middleSource_h4599 :
    ((!((allOneRankAtom (sourceRanks P) 17 == allOneRankAtom (sourceRanks P) 13)) || ((allOneRankAtom (sourceRanks P) 65).ult (allOneRankAtom (sourceRanks P) 39)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (39 : Fin 78) (17 : Fin 78)
    (65 : Fin 78) (13 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (3 : Fin 13) (7 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (36 : Fin 78) (20 : Fin 78) (17 : Fin 78)
    (39 : Fin 78) (13 : Fin 78) (65 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4600` (kalmanson). -/
theorem middleSource_h4600 :
    ((!((allOneRankAtom (sourceRanks P) 39 == allOneRankAtom (sourceRanks P) 65)) || ((allOneRankAtom (sourceRanks P) 13).ult (allOneRankAtom (sourceRanks P) 17)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (17 : Fin 78) (39 : Fin 78)
    (13 : Fin 78) (65 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (3 : Fin 13) (7 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (36 : Fin 78) (20 : Fin 78) (17 : Fin 78)
    (39 : Fin 78) (13 : Fin 78) (65 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4601` (kalmanson). -/
theorem middleSource_h4601 :
    ((!((allOneRankAtom (sourceRanks P) 17 == allOneRankAtom (sourceRanks P) 20)) || ((allOneRankAtom (sourceRanks P) 36).ult (allOneRankAtom (sourceRanks P) 39)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (39 : Fin 78) (17 : Fin 78)
    (36 : Fin 78) (20 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (3 : Fin 13) (7 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (36 : Fin 78) (20 : Fin 78) (17 : Fin 78)
    (39 : Fin 78) (13 : Fin 78) (65 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4602` (kalmanson). -/
theorem middleSource_h4602 :
    ((!((allOneRankAtom (sourceRanks P) 17 == allOneRankAtom (sourceRanks P) 13)) || ((allOneRankAtom (sourceRanks P) 66).ult (allOneRankAtom (sourceRanks P) 40)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (40 : Fin 78) (17 : Fin 78)
    (66 : Fin 78) (13 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (3 : Fin 13) (7 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (36 : Fin 78) (21 : Fin 78) (17 : Fin 78)
    (40 : Fin 78) (13 : Fin 78) (66 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4603` (kalmanson). -/
theorem middleSource_h4603 :
    ((!((allOneRankAtom (sourceRanks P) 40 == allOneRankAtom (sourceRanks P) 66)) || ((allOneRankAtom (sourceRanks P) 13).ult (allOneRankAtom (sourceRanks P) 17)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (17 : Fin 78) (40 : Fin 78)
    (13 : Fin 78) (66 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (3 : Fin 13) (7 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (36 : Fin 78) (21 : Fin 78) (17 : Fin 78)
    (40 : Fin 78) (13 : Fin 78) (66 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4604` (kalmanson). -/
theorem middleSource_h4604 :
    ((!((allOneRankAtom (sourceRanks P) 17 == allOneRankAtom (sourceRanks P) 21)) || ((allOneRankAtom (sourceRanks P) 36).ult (allOneRankAtom (sourceRanks P) 40)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (40 : Fin 78) (17 : Fin 78)
    (36 : Fin 78) (21 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (3 : Fin 13) (7 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (36 : Fin 78) (21 : Fin 78) (17 : Fin 78)
    (40 : Fin 78) (13 : Fin 78) (66 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4605` (kalmanson). -/
theorem middleSource_h4605 :
    ((!((allOneRankAtom (sourceRanks P) 17 == allOneRankAtom (sourceRanks P) 13)) || ((allOneRankAtom (sourceRanks P) 67).ult (allOneRankAtom (sourceRanks P) 41)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (41 : Fin 78) (17 : Fin 78)
    (67 : Fin 78) (13 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (3 : Fin 13) (7 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (36 : Fin 78) (22 : Fin 78) (17 : Fin 78)
    (41 : Fin 78) (13 : Fin 78) (67 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4606` (kalmanson). -/
theorem middleSource_h4606 :
    ((!((allOneRankAtom (sourceRanks P) 41 == allOneRankAtom (sourceRanks P) 13)) || ((allOneRankAtom (sourceRanks P) 67).ult (allOneRankAtom (sourceRanks P) 17)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (17 : Fin 78) (41 : Fin 78)
    (67 : Fin 78) (13 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (3 : Fin 13) (7 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (36 : Fin 78) (22 : Fin 78) (17 : Fin 78)
    (41 : Fin 78) (13 : Fin 78) (67 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4607` (kalmanson). -/
theorem middleSource_h4607 :
    ((!((allOneRankAtom (sourceRanks P) 17 == allOneRankAtom (sourceRanks P) 22)) || ((allOneRankAtom (sourceRanks P) 36).ult (allOneRankAtom (sourceRanks P) 41)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (41 : Fin 78) (17 : Fin 78)
    (36 : Fin 78) (22 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (3 : Fin 13) (7 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (36 : Fin 78) (22 : Fin 78) (17 : Fin 78)
    (41 : Fin 78) (13 : Fin 78) (67 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

end

end ATailExactFiveCard13AllOneSourceIngressScratch
end Problem97
