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

/-- Candidate middle source assertion `h5760` (kalmanson). -/
theorem middleSource_h5760 :
    ((!((allOneRankAtom (sourceRanks P) 61 == allOneRankAtom (sourceRanks P) 66)) || ((allOneRankAtom (sourceRanks P) 26).ult (allOneRankAtom (sourceRanks P) 27)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (27 : Fin 78) (61 : Fin 78)
    (26 : Fin 78) (66 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (6 : Fin 13) (7 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (31 : Fin 78) (27 : Fin 78)
    (61 : Fin 78) (26 : Fin 78) (66 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5761` (kalmanson). -/
theorem middleSource_h5761 :
    ((!((allOneRankAtom (sourceRanks P) 27 == allOneRankAtom (sourceRanks P) 31)) || ((allOneRankAtom (sourceRanks P) 57).ult (allOneRankAtom (sourceRanks P) 61)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (61 : Fin 78) (27 : Fin 78)
    (57 : Fin 78) (31 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (6 : Fin 13) (7 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (31 : Fin 78) (27 : Fin 78)
    (61 : Fin 78) (26 : Fin 78) (66 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5762` (kalmanson). -/
theorem middleSource_h5762 :
    ((!((allOneRankAtom (sourceRanks P) 61 == allOneRankAtom (sourceRanks P) 31)) || ((allOneRankAtom (sourceRanks P) 57).ult (allOneRankAtom (sourceRanks P) 27)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (27 : Fin 78) (61 : Fin 78)
    (57 : Fin 78) (31 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (6 : Fin 13) (7 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (31 : Fin 78) (27 : Fin 78)
    (61 : Fin 78) (26 : Fin 78) (66 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5763` (kalmanson). -/
theorem middleSource_h5763 :
    ((!((allOneRankAtom (sourceRanks P) 61 == allOneRankAtom (sourceRanks P) 57)) || ((allOneRankAtom (sourceRanks P) 31).ult (allOneRankAtom (sourceRanks P) 27)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (27 : Fin 78) (61 : Fin 78)
    (31 : Fin 78) (57 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (6 : Fin 13) (7 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (31 : Fin 78) (27 : Fin 78)
    (61 : Fin 78) (26 : Fin 78) (66 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5764` (kalmanson). -/
theorem middleSource_h5764 :
    ((!((allOneRankAtom (sourceRanks P) 27 == allOneRankAtom (sourceRanks P) 26)) || ((allOneRankAtom (sourceRanks P) 67).ult (allOneRankAtom (sourceRanks P) 62)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (62 : Fin 78) (27 : Fin 78)
    (67 : Fin 78) (26 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (6 : Fin 13) (7 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (32 : Fin 78) (27 : Fin 78)
    (62 : Fin 78) (26 : Fin 78) (67 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5765` (kalmanson). -/
theorem middleSource_h5765 :
    ((!((allOneRankAtom (sourceRanks P) 62 == allOneRankAtom (sourceRanks P) 26)) || ((allOneRankAtom (sourceRanks P) 67).ult (allOneRankAtom (sourceRanks P) 27)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (27 : Fin 78) (62 : Fin 78)
    (67 : Fin 78) (26 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (6 : Fin 13) (7 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (32 : Fin 78) (27 : Fin 78)
    (62 : Fin 78) (26 : Fin 78) (67 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5766` (kalmanson). -/
theorem middleSource_h5766 :
    ((!((allOneRankAtom (sourceRanks P) 27 == allOneRankAtom (sourceRanks P) 32)) || ((allOneRankAtom (sourceRanks P) 57).ult (allOneRankAtom (sourceRanks P) 62)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (62 : Fin 78) (27 : Fin 78)
    (57 : Fin 78) (32 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (6 : Fin 13) (7 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (32 : Fin 78) (27 : Fin 78)
    (62 : Fin 78) (26 : Fin 78) (67 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5767` (kalmanson). -/
theorem middleSource_h5767 :
    ((!((allOneRankAtom (sourceRanks P) 62 == allOneRankAtom (sourceRanks P) 57)) || ((allOneRankAtom (sourceRanks P) 32).ult (allOneRankAtom (sourceRanks P) 27)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (27 : Fin 78) (62 : Fin 78)
    (32 : Fin 78) (57 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (6 : Fin 13) (7 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (57 : Fin 78) (32 : Fin 78) (27 : Fin 78)
    (62 : Fin 78) (26 : Fin 78) (67 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5768` (kalmanson). -/
theorem middleSource_h5768 :
    ((!((allOneRankAtom (sourceRanks P) 28 == allOneRankAtom (sourceRanks P) 26)) || ((allOneRankAtom (sourceRanks P) 68).ult (allOneRankAtom (sourceRanks P) 59)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (59 : Fin 78) (28 : Fin 78)
    (68 : Fin 78) (26 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (6 : Fin 13) (8 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (58 : Fin 78) (29 : Fin 78) (28 : Fin 78)
    (59 : Fin 78) (26 : Fin 78) (68 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5769` (kalmanson). -/
theorem middleSource_h5769 :
    ((!((allOneRankAtom (sourceRanks P) 28 == allOneRankAtom (sourceRanks P) 68)) || ((allOneRankAtom (sourceRanks P) 26).ult (allOneRankAtom (sourceRanks P) 59)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (59 : Fin 78) (28 : Fin 78)
    (26 : Fin 78) (68 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (6 : Fin 13) (8 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (58 : Fin 78) (29 : Fin 78) (28 : Fin 78)
    (59 : Fin 78) (26 : Fin 78) (68 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5770` (kalmanson). -/
theorem middleSource_h5770 :
    ((!((allOneRankAtom (sourceRanks P) 59 == allOneRankAtom (sourceRanks P) 26)) || ((allOneRankAtom (sourceRanks P) 68).ult (allOneRankAtom (sourceRanks P) 28)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (28 : Fin 78) (59 : Fin 78)
    (68 : Fin 78) (26 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (6 : Fin 13) (8 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (58 : Fin 78) (29 : Fin 78) (28 : Fin 78)
    (59 : Fin 78) (26 : Fin 78) (68 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5771` (kalmanson). -/
theorem middleSource_h5771 :
    ((!((allOneRankAtom (sourceRanks P) 59 == allOneRankAtom (sourceRanks P) 68)) || ((allOneRankAtom (sourceRanks P) 26).ult (allOneRankAtom (sourceRanks P) 28)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (28 : Fin 78) (59 : Fin 78)
    (26 : Fin 78) (68 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (6 : Fin 13) (8 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (58 : Fin 78) (29 : Fin 78) (28 : Fin 78)
    (59 : Fin 78) (26 : Fin 78) (68 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5772` (kalmanson). -/
theorem middleSource_h5772 :
    ((!((allOneRankAtom (sourceRanks P) 28 == allOneRankAtom (sourceRanks P) 29)) || ((allOneRankAtom (sourceRanks P) 58).ult (allOneRankAtom (sourceRanks P) 59)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (59 : Fin 78) (28 : Fin 78)
    (58 : Fin 78) (29 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (6 : Fin 13) (8 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (58 : Fin 78) (29 : Fin 78) (28 : Fin 78)
    (59 : Fin 78) (26 : Fin 78) (68 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5773` (kalmanson). -/
theorem middleSource_h5773 :
    ((!((allOneRankAtom (sourceRanks P) 28 == allOneRankAtom (sourceRanks P) 58)) || ((allOneRankAtom (sourceRanks P) 29).ult (allOneRankAtom (sourceRanks P) 59)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (59 : Fin 78) (28 : Fin 78)
    (29 : Fin 78) (58 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (6 : Fin 13) (8 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (58 : Fin 78) (29 : Fin 78) (28 : Fin 78)
    (59 : Fin 78) (26 : Fin 78) (68 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5774` (kalmanson). -/
theorem middleSource_h5774 :
    ((!((allOneRankAtom (sourceRanks P) 59 == allOneRankAtom (sourceRanks P) 29)) || ((allOneRankAtom (sourceRanks P) 58).ult (allOneRankAtom (sourceRanks P) 28)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (28 : Fin 78) (59 : Fin 78)
    (58 : Fin 78) (29 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (6 : Fin 13) (8 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (58 : Fin 78) (29 : Fin 78) (28 : Fin 78)
    (59 : Fin 78) (26 : Fin 78) (68 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5775` (kalmanson). -/
theorem middleSource_h5775 :
    ((!((allOneRankAtom (sourceRanks P) 59 == allOneRankAtom (sourceRanks P) 58)) || ((allOneRankAtom (sourceRanks P) 29).ult (allOneRankAtom (sourceRanks P) 28)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (28 : Fin 78) (59 : Fin 78)
    (29 : Fin 78) (58 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (6 : Fin 13) (8 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (58 : Fin 78) (29 : Fin 78) (28 : Fin 78)
    (59 : Fin 78) (26 : Fin 78) (68 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5776` (kalmanson). -/
theorem middleSource_h5776 :
    ((!((allOneRankAtom (sourceRanks P) 28 == allOneRankAtom (sourceRanks P) 26)) || ((allOneRankAtom (sourceRanks P) 69).ult (allOneRankAtom (sourceRanks P) 60)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (60 : Fin 78) (28 : Fin 78)
    (69 : Fin 78) (26 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (6 : Fin 13) (8 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (58 : Fin 78) (30 : Fin 78) (28 : Fin 78)
    (60 : Fin 78) (26 : Fin 78) (69 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5777` (kalmanson). -/
theorem middleSource_h5777 :
    ((!((allOneRankAtom (sourceRanks P) 28 == allOneRankAtom (sourceRanks P) 69)) || ((allOneRankAtom (sourceRanks P) 26).ult (allOneRankAtom (sourceRanks P) 60)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (60 : Fin 78) (28 : Fin 78)
    (26 : Fin 78) (69 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (6 : Fin 13) (8 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (58 : Fin 78) (30 : Fin 78) (28 : Fin 78)
    (60 : Fin 78) (26 : Fin 78) (69 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5778` (kalmanson). -/
theorem middleSource_h5778 :
    ((!((allOneRankAtom (sourceRanks P) 60 == allOneRankAtom (sourceRanks P) 26)) || ((allOneRankAtom (sourceRanks P) 69).ult (allOneRankAtom (sourceRanks P) 28)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (28 : Fin 78) (60 : Fin 78)
    (69 : Fin 78) (26 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (6 : Fin 13) (8 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (58 : Fin 78) (30 : Fin 78) (28 : Fin 78)
    (60 : Fin 78) (26 : Fin 78) (69 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5779` (kalmanson). -/
theorem middleSource_h5779 :
    ((!((allOneRankAtom (sourceRanks P) 60 == allOneRankAtom (sourceRanks P) 69)) || ((allOneRankAtom (sourceRanks P) 26).ult (allOneRankAtom (sourceRanks P) 28)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (28 : Fin 78) (60 : Fin 78)
    (26 : Fin 78) (69 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (6 : Fin 13) (8 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (58 : Fin 78) (30 : Fin 78) (28 : Fin 78)
    (60 : Fin 78) (26 : Fin 78) (69 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5780` (kalmanson). -/
theorem middleSource_h5780 :
    ((!((allOneRankAtom (sourceRanks P) 28 == allOneRankAtom (sourceRanks P) 30)) || ((allOneRankAtom (sourceRanks P) 58).ult (allOneRankAtom (sourceRanks P) 60)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (60 : Fin 78) (28 : Fin 78)
    (58 : Fin 78) (30 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (6 : Fin 13) (8 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (58 : Fin 78) (30 : Fin 78) (28 : Fin 78)
    (60 : Fin 78) (26 : Fin 78) (69 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5781` (kalmanson). -/
theorem middleSource_h5781 :
    ((!((allOneRankAtom (sourceRanks P) 28 == allOneRankAtom (sourceRanks P) 58)) || ((allOneRankAtom (sourceRanks P) 30).ult (allOneRankAtom (sourceRanks P) 60)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (60 : Fin 78) (28 : Fin 78)
    (30 : Fin 78) (58 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (6 : Fin 13) (8 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (58 : Fin 78) (30 : Fin 78) (28 : Fin 78)
    (60 : Fin 78) (26 : Fin 78) (69 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5782` (kalmanson). -/
theorem middleSource_h5782 :
    ((!((allOneRankAtom (sourceRanks P) 60 == allOneRankAtom (sourceRanks P) 30)) || ((allOneRankAtom (sourceRanks P) 58).ult (allOneRankAtom (sourceRanks P) 28)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (28 : Fin 78) (60 : Fin 78)
    (58 : Fin 78) (30 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (6 : Fin 13) (8 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (58 : Fin 78) (30 : Fin 78) (28 : Fin 78)
    (60 : Fin 78) (26 : Fin 78) (69 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5783` (kalmanson). -/
theorem middleSource_h5783 :
    ((!((allOneRankAtom (sourceRanks P) 60 == allOneRankAtom (sourceRanks P) 58)) || ((allOneRankAtom (sourceRanks P) 30).ult (allOneRankAtom (sourceRanks P) 28)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (28 : Fin 78) (60 : Fin 78)
    (30 : Fin 78) (58 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (6 : Fin 13) (8 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (58 : Fin 78) (30 : Fin 78) (28 : Fin 78)
    (60 : Fin 78) (26 : Fin 78) (69 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5784` (kalmanson). -/
theorem middleSource_h5784 :
    ((!((allOneRankAtom (sourceRanks P) 28 == allOneRankAtom (sourceRanks P) 26)) || ((allOneRankAtom (sourceRanks P) 70).ult (allOneRankAtom (sourceRanks P) 61)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (61 : Fin 78) (28 : Fin 78)
    (70 : Fin 78) (26 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (6 : Fin 13) (8 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (58 : Fin 78) (31 : Fin 78) (28 : Fin 78)
    (61 : Fin 78) (26 : Fin 78) (70 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5785` (kalmanson). -/
theorem middleSource_h5785 :
    ((!((allOneRankAtom (sourceRanks P) 28 == allOneRankAtom (sourceRanks P) 70)) || ((allOneRankAtom (sourceRanks P) 26).ult (allOneRankAtom (sourceRanks P) 61)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (61 : Fin 78) (28 : Fin 78)
    (26 : Fin 78) (70 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (6 : Fin 13) (8 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (58 : Fin 78) (31 : Fin 78) (28 : Fin 78)
    (61 : Fin 78) (26 : Fin 78) (70 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5786` (kalmanson). -/
theorem middleSource_h5786 :
    ((!((allOneRankAtom (sourceRanks P) 61 == allOneRankAtom (sourceRanks P) 26)) || ((allOneRankAtom (sourceRanks P) 70).ult (allOneRankAtom (sourceRanks P) 28)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (28 : Fin 78) (61 : Fin 78)
    (70 : Fin 78) (26 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (6 : Fin 13) (8 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (58 : Fin 78) (31 : Fin 78) (28 : Fin 78)
    (61 : Fin 78) (26 : Fin 78) (70 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5787` (kalmanson). -/
theorem middleSource_h5787 :
    ((!((allOneRankAtom (sourceRanks P) 61 == allOneRankAtom (sourceRanks P) 70)) || ((allOneRankAtom (sourceRanks P) 26).ult (allOneRankAtom (sourceRanks P) 28)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (28 : Fin 78) (61 : Fin 78)
    (26 : Fin 78) (70 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (6 : Fin 13) (8 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (58 : Fin 78) (31 : Fin 78) (28 : Fin 78)
    (61 : Fin 78) (26 : Fin 78) (70 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5788` (kalmanson). -/
theorem middleSource_h5788 :
    ((!((allOneRankAtom (sourceRanks P) 28 == allOneRankAtom (sourceRanks P) 31)) || ((allOneRankAtom (sourceRanks P) 58).ult (allOneRankAtom (sourceRanks P) 61)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (61 : Fin 78) (28 : Fin 78)
    (58 : Fin 78) (31 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (6 : Fin 13) (8 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (58 : Fin 78) (31 : Fin 78) (28 : Fin 78)
    (61 : Fin 78) (26 : Fin 78) (70 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5789` (kalmanson). -/
theorem middleSource_h5789 :
    ((!((allOneRankAtom (sourceRanks P) 28 == allOneRankAtom (sourceRanks P) 58)) || ((allOneRankAtom (sourceRanks P) 31).ult (allOneRankAtom (sourceRanks P) 61)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (61 : Fin 78) (28 : Fin 78)
    (31 : Fin 78) (58 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (6 : Fin 13) (8 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (58 : Fin 78) (31 : Fin 78) (28 : Fin 78)
    (61 : Fin 78) (26 : Fin 78) (70 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5790` (kalmanson). -/
theorem middleSource_h5790 :
    ((!((allOneRankAtom (sourceRanks P) 61 == allOneRankAtom (sourceRanks P) 31)) || ((allOneRankAtom (sourceRanks P) 58).ult (allOneRankAtom (sourceRanks P) 28)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (28 : Fin 78) (61 : Fin 78)
    (58 : Fin 78) (31 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (6 : Fin 13) (8 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (58 : Fin 78) (31 : Fin 78) (28 : Fin 78)
    (61 : Fin 78) (26 : Fin 78) (70 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5791` (kalmanson). -/
theorem middleSource_h5791 :
    ((!((allOneRankAtom (sourceRanks P) 61 == allOneRankAtom (sourceRanks P) 58)) || ((allOneRankAtom (sourceRanks P) 31).ult (allOneRankAtom (sourceRanks P) 28)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (28 : Fin 78) (61 : Fin 78)
    (31 : Fin 78) (58 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (6 : Fin 13) (8 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (58 : Fin 78) (31 : Fin 78) (28 : Fin 78)
    (61 : Fin 78) (26 : Fin 78) (70 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5792` (kalmanson). -/
theorem middleSource_h5792 :
    ((!((allOneRankAtom (sourceRanks P) 28 == allOneRankAtom (sourceRanks P) 26)) || ((allOneRankAtom (sourceRanks P) 71).ult (allOneRankAtom (sourceRanks P) 62)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (62 : Fin 78) (28 : Fin 78)
    (71 : Fin 78) (26 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (6 : Fin 13) (8 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (58 : Fin 78) (32 : Fin 78) (28 : Fin 78)
    (62 : Fin 78) (26 : Fin 78) (71 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5793` (kalmanson). -/
theorem middleSource_h5793 :
    ((!((allOneRankAtom (sourceRanks P) 28 == allOneRankAtom (sourceRanks P) 71)) || ((allOneRankAtom (sourceRanks P) 26).ult (allOneRankAtom (sourceRanks P) 62)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (62 : Fin 78) (28 : Fin 78)
    (26 : Fin 78) (71 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (6 : Fin 13) (8 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (58 : Fin 78) (32 : Fin 78) (28 : Fin 78)
    (62 : Fin 78) (26 : Fin 78) (71 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5794` (kalmanson). -/
theorem middleSource_h5794 :
    ((!((allOneRankAtom (sourceRanks P) 62 == allOneRankAtom (sourceRanks P) 26)) || ((allOneRankAtom (sourceRanks P) 71).ult (allOneRankAtom (sourceRanks P) 28)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (28 : Fin 78) (62 : Fin 78)
    (71 : Fin 78) (26 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (6 : Fin 13) (8 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (58 : Fin 78) (32 : Fin 78) (28 : Fin 78)
    (62 : Fin 78) (26 : Fin 78) (71 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5795` (kalmanson). -/
theorem middleSource_h5795 :
    ((!((allOneRankAtom (sourceRanks P) 28 == allOneRankAtom (sourceRanks P) 32)) || ((allOneRankAtom (sourceRanks P) 58).ult (allOneRankAtom (sourceRanks P) 62)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (62 : Fin 78) (28 : Fin 78)
    (58 : Fin 78) (32 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (6 : Fin 13) (8 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (58 : Fin 78) (32 : Fin 78) (28 : Fin 78)
    (62 : Fin 78) (26 : Fin 78) (71 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5796` (kalmanson). -/
theorem middleSource_h5796 :
    ((!((allOneRankAtom (sourceRanks P) 28 == allOneRankAtom (sourceRanks P) 58)) || ((allOneRankAtom (sourceRanks P) 32).ult (allOneRankAtom (sourceRanks P) 62)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (62 : Fin 78) (28 : Fin 78)
    (32 : Fin 78) (58 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (6 : Fin 13) (8 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (58 : Fin 78) (32 : Fin 78) (28 : Fin 78)
    (62 : Fin 78) (26 : Fin 78) (71 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5797` (kalmanson). -/
theorem middleSource_h5797 :
    ((!((allOneRankAtom (sourceRanks P) 62 == allOneRankAtom (sourceRanks P) 58)) || ((allOneRankAtom (sourceRanks P) 32).ult (allOneRankAtom (sourceRanks P) 28)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (28 : Fin 78) (62 : Fin 78)
    (32 : Fin 78) (58 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (6 : Fin 13) (8 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (58 : Fin 78) (32 : Fin 78) (28 : Fin 78)
    (62 : Fin 78) (26 : Fin 78) (71 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5798` (kalmanson). -/
theorem middleSource_h5798 :
    ((!((allOneRankAtom (sourceRanks P) 29 == allOneRankAtom (sourceRanks P) 26)) || ((allOneRankAtom (sourceRanks P) 72).ult (allOneRankAtom (sourceRanks P) 60)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (60 : Fin 78) (29 : Fin 78)
    (72 : Fin 78) (26 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (6 : Fin 13) (9 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (59 : Fin 78) (30 : Fin 78) (29 : Fin 78)
    (60 : Fin 78) (26 : Fin 78) (72 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5799` (kalmanson). -/
theorem middleSource_h5799 :
    ((!((allOneRankAtom (sourceRanks P) 29 == allOneRankAtom (sourceRanks P) 72)) || ((allOneRankAtom (sourceRanks P) 26).ult (allOneRankAtom (sourceRanks P) 60)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (60 : Fin 78) (29 : Fin 78)
    (26 : Fin 78) (72 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (6 : Fin 13) (9 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (59 : Fin 78) (30 : Fin 78) (29 : Fin 78)
    (60 : Fin 78) (26 : Fin 78) (72 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5800` (kalmanson). -/
theorem middleSource_h5800 :
    ((!((allOneRankAtom (sourceRanks P) 60 == allOneRankAtom (sourceRanks P) 26)) || ((allOneRankAtom (sourceRanks P) 72).ult (allOneRankAtom (sourceRanks P) 29)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (29 : Fin 78) (60 : Fin 78)
    (72 : Fin 78) (26 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (6 : Fin 13) (9 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (59 : Fin 78) (30 : Fin 78) (29 : Fin 78)
    (60 : Fin 78) (26 : Fin 78) (72 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5801` (kalmanson). -/
theorem middleSource_h5801 :
    ((!((allOneRankAtom (sourceRanks P) 60 == allOneRankAtom (sourceRanks P) 72)) || ((allOneRankAtom (sourceRanks P) 26).ult (allOneRankAtom (sourceRanks P) 29)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (29 : Fin 78) (60 : Fin 78)
    (26 : Fin 78) (72 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (6 : Fin 13) (9 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (59 : Fin 78) (30 : Fin 78) (29 : Fin 78)
    (60 : Fin 78) (26 : Fin 78) (72 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5802` (kalmanson). -/
theorem middleSource_h5802 :
    ((!((allOneRankAtom (sourceRanks P) 29 == allOneRankAtom (sourceRanks P) 30)) || ((allOneRankAtom (sourceRanks P) 59).ult (allOneRankAtom (sourceRanks P) 60)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (60 : Fin 78) (29 : Fin 78)
    (59 : Fin 78) (30 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (6 : Fin 13) (9 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (59 : Fin 78) (30 : Fin 78) (29 : Fin 78)
    (60 : Fin 78) (26 : Fin 78) (72 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5803` (kalmanson). -/
theorem middleSource_h5803 :
    ((!((allOneRankAtom (sourceRanks P) 29 == allOneRankAtom (sourceRanks P) 59)) || ((allOneRankAtom (sourceRanks P) 30).ult (allOneRankAtom (sourceRanks P) 60)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (60 : Fin 78) (29 : Fin 78)
    (30 : Fin 78) (59 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (6 : Fin 13) (9 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (59 : Fin 78) (30 : Fin 78) (29 : Fin 78)
    (60 : Fin 78) (26 : Fin 78) (72 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5804` (kalmanson). -/
theorem middleSource_h5804 :
    ((!((allOneRankAtom (sourceRanks P) 60 == allOneRankAtom (sourceRanks P) 30)) || ((allOneRankAtom (sourceRanks P) 59).ult (allOneRankAtom (sourceRanks P) 29)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (29 : Fin 78) (60 : Fin 78)
    (59 : Fin 78) (30 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (6 : Fin 13) (9 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (59 : Fin 78) (30 : Fin 78) (29 : Fin 78)
    (60 : Fin 78) (26 : Fin 78) (72 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5805` (kalmanson). -/
theorem middleSource_h5805 :
    ((!((allOneRankAtom (sourceRanks P) 60 == allOneRankAtom (sourceRanks P) 59)) || ((allOneRankAtom (sourceRanks P) 30).ult (allOneRankAtom (sourceRanks P) 29)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (29 : Fin 78) (60 : Fin 78)
    (30 : Fin 78) (59 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (6 : Fin 13) (9 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (59 : Fin 78) (30 : Fin 78) (29 : Fin 78)
    (60 : Fin 78) (26 : Fin 78) (72 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5806` (kalmanson). -/
theorem middleSource_h5806 :
    ((!((allOneRankAtom (sourceRanks P) 29 == allOneRankAtom (sourceRanks P) 26)) || ((allOneRankAtom (sourceRanks P) 73).ult (allOneRankAtom (sourceRanks P) 61)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (61 : Fin 78) (29 : Fin 78)
    (73 : Fin 78) (26 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (6 : Fin 13) (9 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (59 : Fin 78) (31 : Fin 78) (29 : Fin 78)
    (61 : Fin 78) (26 : Fin 78) (73 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5807` (kalmanson). -/
theorem middleSource_h5807 :
    ((!((allOneRankAtom (sourceRanks P) 29 == allOneRankAtom (sourceRanks P) 73)) || ((allOneRankAtom (sourceRanks P) 26).ult (allOneRankAtom (sourceRanks P) 61)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (61 : Fin 78) (29 : Fin 78)
    (26 : Fin 78) (73 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (6 : Fin 13) (9 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (59 : Fin 78) (31 : Fin 78) (29 : Fin 78)
    (61 : Fin 78) (26 : Fin 78) (73 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5808` (kalmanson). -/
theorem middleSource_h5808 :
    ((!((allOneRankAtom (sourceRanks P) 61 == allOneRankAtom (sourceRanks P) 26)) || ((allOneRankAtom (sourceRanks P) 73).ult (allOneRankAtom (sourceRanks P) 29)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (29 : Fin 78) (61 : Fin 78)
    (73 : Fin 78) (26 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (6 : Fin 13) (9 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (59 : Fin 78) (31 : Fin 78) (29 : Fin 78)
    (61 : Fin 78) (26 : Fin 78) (73 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5809` (kalmanson). -/
theorem middleSource_h5809 :
    ((!((allOneRankAtom (sourceRanks P) 61 == allOneRankAtom (sourceRanks P) 73)) || ((allOneRankAtom (sourceRanks P) 26).ult (allOneRankAtom (sourceRanks P) 29)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (29 : Fin 78) (61 : Fin 78)
    (26 : Fin 78) (73 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (6 : Fin 13) (9 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (59 : Fin 78) (31 : Fin 78) (29 : Fin 78)
    (61 : Fin 78) (26 : Fin 78) (73 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5810` (kalmanson). -/
theorem middleSource_h5810 :
    ((!((allOneRankAtom (sourceRanks P) 29 == allOneRankAtom (sourceRanks P) 31)) || ((allOneRankAtom (sourceRanks P) 59).ult (allOneRankAtom (sourceRanks P) 61)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (61 : Fin 78) (29 : Fin 78)
    (59 : Fin 78) (31 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (6 : Fin 13) (9 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (59 : Fin 78) (31 : Fin 78) (29 : Fin 78)
    (61 : Fin 78) (26 : Fin 78) (73 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5811` (kalmanson). -/
theorem middleSource_h5811 :
    ((!((allOneRankAtom (sourceRanks P) 29 == allOneRankAtom (sourceRanks P) 59)) || ((allOneRankAtom (sourceRanks P) 31).ult (allOneRankAtom (sourceRanks P) 61)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (61 : Fin 78) (29 : Fin 78)
    (31 : Fin 78) (59 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (6 : Fin 13) (9 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (59 : Fin 78) (31 : Fin 78) (29 : Fin 78)
    (61 : Fin 78) (26 : Fin 78) (73 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5812` (kalmanson). -/
theorem middleSource_h5812 :
    ((!((allOneRankAtom (sourceRanks P) 61 == allOneRankAtom (sourceRanks P) 31)) || ((allOneRankAtom (sourceRanks P) 59).ult (allOneRankAtom (sourceRanks P) 29)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (29 : Fin 78) (61 : Fin 78)
    (59 : Fin 78) (31 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (6 : Fin 13) (9 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (59 : Fin 78) (31 : Fin 78) (29 : Fin 78)
    (61 : Fin 78) (26 : Fin 78) (73 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5813` (kalmanson). -/
theorem middleSource_h5813 :
    ((!((allOneRankAtom (sourceRanks P) 61 == allOneRankAtom (sourceRanks P) 59)) || ((allOneRankAtom (sourceRanks P) 31).ult (allOneRankAtom (sourceRanks P) 29)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (29 : Fin 78) (61 : Fin 78)
    (31 : Fin 78) (59 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (6 : Fin 13) (9 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (59 : Fin 78) (31 : Fin 78) (29 : Fin 78)
    (61 : Fin 78) (26 : Fin 78) (73 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5814` (kalmanson). -/
theorem middleSource_h5814 :
    ((!((allOneRankAtom (sourceRanks P) 29 == allOneRankAtom (sourceRanks P) 26)) || ((allOneRankAtom (sourceRanks P) 74).ult (allOneRankAtom (sourceRanks P) 62)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (62 : Fin 78) (29 : Fin 78)
    (74 : Fin 78) (26 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (6 : Fin 13) (9 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (59 : Fin 78) (32 : Fin 78) (29 : Fin 78)
    (62 : Fin 78) (26 : Fin 78) (74 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5815` (kalmanson). -/
theorem middleSource_h5815 :
    ((!((allOneRankAtom (sourceRanks P) 29 == allOneRankAtom (sourceRanks P) 74)) || ((allOneRankAtom (sourceRanks P) 26).ult (allOneRankAtom (sourceRanks P) 62)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (62 : Fin 78) (29 : Fin 78)
    (26 : Fin 78) (74 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (6 : Fin 13) (9 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (59 : Fin 78) (32 : Fin 78) (29 : Fin 78)
    (62 : Fin 78) (26 : Fin 78) (74 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5816` (kalmanson). -/
theorem middleSource_h5816 :
    ((!((allOneRankAtom (sourceRanks P) 62 == allOneRankAtom (sourceRanks P) 26)) || ((allOneRankAtom (sourceRanks P) 74).ult (allOneRankAtom (sourceRanks P) 29)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (29 : Fin 78) (62 : Fin 78)
    (74 : Fin 78) (26 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (6 : Fin 13) (9 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (59 : Fin 78) (32 : Fin 78) (29 : Fin 78)
    (62 : Fin 78) (26 : Fin 78) (74 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5817` (kalmanson). -/
theorem middleSource_h5817 :
    ((!((allOneRankAtom (sourceRanks P) 29 == allOneRankAtom (sourceRanks P) 32)) || ((allOneRankAtom (sourceRanks P) 59).ult (allOneRankAtom (sourceRanks P) 62)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (62 : Fin 78) (29 : Fin 78)
    (59 : Fin 78) (32 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (6 : Fin 13) (9 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (59 : Fin 78) (32 : Fin 78) (29 : Fin 78)
    (62 : Fin 78) (26 : Fin 78) (74 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5818` (kalmanson). -/
theorem middleSource_h5818 :
    ((!((allOneRankAtom (sourceRanks P) 29 == allOneRankAtom (sourceRanks P) 59)) || ((allOneRankAtom (sourceRanks P) 32).ult (allOneRankAtom (sourceRanks P) 62)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (62 : Fin 78) (29 : Fin 78)
    (32 : Fin 78) (59 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (6 : Fin 13) (9 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (59 : Fin 78) (32 : Fin 78) (29 : Fin 78)
    (62 : Fin 78) (26 : Fin 78) (74 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5819` (kalmanson). -/
theorem middleSource_h5819 :
    ((!((allOneRankAtom (sourceRanks P) 62 == allOneRankAtom (sourceRanks P) 59)) || ((allOneRankAtom (sourceRanks P) 32).ult (allOneRankAtom (sourceRanks P) 29)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (29 : Fin 78) (62 : Fin 78)
    (32 : Fin 78) (59 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (6 : Fin 13) (9 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (59 : Fin 78) (32 : Fin 78) (29 : Fin 78)
    (62 : Fin 78) (26 : Fin 78) (74 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5820` (kalmanson). -/
theorem middleSource_h5820 :
    ((!((allOneRankAtom (sourceRanks P) 30 == allOneRankAtom (sourceRanks P) 26)) || ((allOneRankAtom (sourceRanks P) 75).ult (allOneRankAtom (sourceRanks P) 61)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (61 : Fin 78) (30 : Fin 78)
    (75 : Fin 78) (26 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (6 : Fin 13) (10 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (60 : Fin 78) (31 : Fin 78) (30 : Fin 78)
    (61 : Fin 78) (26 : Fin 78) (75 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5821` (kalmanson). -/
theorem middleSource_h5821 :
    ((!((allOneRankAtom (sourceRanks P) 30 == allOneRankAtom (sourceRanks P) 75)) || ((allOneRankAtom (sourceRanks P) 26).ult (allOneRankAtom (sourceRanks P) 61)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (61 : Fin 78) (30 : Fin 78)
    (26 : Fin 78) (75 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (6 : Fin 13) (10 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (60 : Fin 78) (31 : Fin 78) (30 : Fin 78)
    (61 : Fin 78) (26 : Fin 78) (75 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5822` (kalmanson). -/
theorem middleSource_h5822 :
    ((!((allOneRankAtom (sourceRanks P) 61 == allOneRankAtom (sourceRanks P) 26)) || ((allOneRankAtom (sourceRanks P) 75).ult (allOneRankAtom (sourceRanks P) 30)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (30 : Fin 78) (61 : Fin 78)
    (75 : Fin 78) (26 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (6 : Fin 13) (10 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (60 : Fin 78) (31 : Fin 78) (30 : Fin 78)
    (61 : Fin 78) (26 : Fin 78) (75 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5823` (kalmanson). -/
theorem middleSource_h5823 :
    ((!((allOneRankAtom (sourceRanks P) 61 == allOneRankAtom (sourceRanks P) 75)) || ((allOneRankAtom (sourceRanks P) 26).ult (allOneRankAtom (sourceRanks P) 30)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (30 : Fin 78) (61 : Fin 78)
    (26 : Fin 78) (75 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (6 : Fin 13) (10 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (60 : Fin 78) (31 : Fin 78) (30 : Fin 78)
    (61 : Fin 78) (26 : Fin 78) (75 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

end

end ATailExactFiveCard13AllOneSourceIngressScratch
end Problem97
