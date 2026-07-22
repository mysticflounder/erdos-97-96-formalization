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

/-- Candidate middle source assertion `h5824` (kalmanson). -/
theorem middleSource_h5824 :
    ((!((allOneRankAtom (sourceRanks P) 30 == allOneRankAtom (sourceRanks P) 31)) || ((allOneRankAtom (sourceRanks P) 60).ult (allOneRankAtom (sourceRanks P) 61)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (61 : Fin 78) (30 : Fin 78)
    (60 : Fin 78) (31 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (6 : Fin 13) (10 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (60 : Fin 78) (31 : Fin 78) (30 : Fin 78)
    (61 : Fin 78) (26 : Fin 78) (75 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5825` (kalmanson). -/
theorem middleSource_h5825 :
    ((!((allOneRankAtom (sourceRanks P) 30 == allOneRankAtom (sourceRanks P) 60)) || ((allOneRankAtom (sourceRanks P) 31).ult (allOneRankAtom (sourceRanks P) 61)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (61 : Fin 78) (30 : Fin 78)
    (31 : Fin 78) (60 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (6 : Fin 13) (10 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (60 : Fin 78) (31 : Fin 78) (30 : Fin 78)
    (61 : Fin 78) (26 : Fin 78) (75 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5826` (kalmanson). -/
theorem middleSource_h5826 :
    ((!((allOneRankAtom (sourceRanks P) 61 == allOneRankAtom (sourceRanks P) 31)) || ((allOneRankAtom (sourceRanks P) 60).ult (allOneRankAtom (sourceRanks P) 30)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (30 : Fin 78) (61 : Fin 78)
    (60 : Fin 78) (31 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (6 : Fin 13) (10 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (60 : Fin 78) (31 : Fin 78) (30 : Fin 78)
    (61 : Fin 78) (26 : Fin 78) (75 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5827` (kalmanson). -/
theorem middleSource_h5827 :
    ((!((allOneRankAtom (sourceRanks P) 61 == allOneRankAtom (sourceRanks P) 60)) || ((allOneRankAtom (sourceRanks P) 31).ult (allOneRankAtom (sourceRanks P) 30)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (30 : Fin 78) (61 : Fin 78)
    (31 : Fin 78) (60 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (6 : Fin 13) (10 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (60 : Fin 78) (31 : Fin 78) (30 : Fin 78)
    (61 : Fin 78) (26 : Fin 78) (75 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5828` (kalmanson). -/
theorem middleSource_h5828 :
    ((!((allOneRankAtom (sourceRanks P) 30 == allOneRankAtom (sourceRanks P) 26)) || ((allOneRankAtom (sourceRanks P) 76).ult (allOneRankAtom (sourceRanks P) 62)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (62 : Fin 78) (30 : Fin 78)
    (76 : Fin 78) (26 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (6 : Fin 13) (10 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (60 : Fin 78) (32 : Fin 78) (30 : Fin 78)
    (62 : Fin 78) (26 : Fin 78) (76 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5829` (kalmanson). -/
theorem middleSource_h5829 :
    ((!((allOneRankAtom (sourceRanks P) 30 == allOneRankAtom (sourceRanks P) 76)) || ((allOneRankAtom (sourceRanks P) 26).ult (allOneRankAtom (sourceRanks P) 62)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (62 : Fin 78) (30 : Fin 78)
    (26 : Fin 78) (76 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (6 : Fin 13) (10 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (60 : Fin 78) (32 : Fin 78) (30 : Fin 78)
    (62 : Fin 78) (26 : Fin 78) (76 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5830` (kalmanson). -/
theorem middleSource_h5830 :
    ((!((allOneRankAtom (sourceRanks P) 62 == allOneRankAtom (sourceRanks P) 26)) || ((allOneRankAtom (sourceRanks P) 76).ult (allOneRankAtom (sourceRanks P) 30)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (30 : Fin 78) (62 : Fin 78)
    (76 : Fin 78) (26 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (6 : Fin 13) (10 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (60 : Fin 78) (32 : Fin 78) (30 : Fin 78)
    (62 : Fin 78) (26 : Fin 78) (76 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5831` (kalmanson). -/
theorem middleSource_h5831 :
    ((!((allOneRankAtom (sourceRanks P) 30 == allOneRankAtom (sourceRanks P) 32)) || ((allOneRankAtom (sourceRanks P) 60).ult (allOneRankAtom (sourceRanks P) 62)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (62 : Fin 78) (30 : Fin 78)
    (60 : Fin 78) (32 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (6 : Fin 13) (10 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (60 : Fin 78) (32 : Fin 78) (30 : Fin 78)
    (62 : Fin 78) (26 : Fin 78) (76 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5832` (kalmanson). -/
theorem middleSource_h5832 :
    ((!((allOneRankAtom (sourceRanks P) 30 == allOneRankAtom (sourceRanks P) 60)) || ((allOneRankAtom (sourceRanks P) 32).ult (allOneRankAtom (sourceRanks P) 62)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (62 : Fin 78) (30 : Fin 78)
    (32 : Fin 78) (60 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (6 : Fin 13) (10 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (60 : Fin 78) (32 : Fin 78) (30 : Fin 78)
    (62 : Fin 78) (26 : Fin 78) (76 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5833` (kalmanson). -/
theorem middleSource_h5833 :
    ((!((allOneRankAtom (sourceRanks P) 62 == allOneRankAtom (sourceRanks P) 60)) || ((allOneRankAtom (sourceRanks P) 32).ult (allOneRankAtom (sourceRanks P) 30)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (30 : Fin 78) (62 : Fin 78)
    (32 : Fin 78) (60 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (6 : Fin 13) (10 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (60 : Fin 78) (32 : Fin 78) (30 : Fin 78)
    (62 : Fin 78) (26 : Fin 78) (76 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5834` (kalmanson). -/
theorem middleSource_h5834 :
    ((!((allOneRankAtom (sourceRanks P) 31 == allOneRankAtom (sourceRanks P) 77)) || ((allOneRankAtom (sourceRanks P) 26).ult (allOneRankAtom (sourceRanks P) 62)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (62 : Fin 78) (31 : Fin 78)
    (26 : Fin 78) (77 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (6 : Fin 13) (11 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (61 : Fin 78) (32 : Fin 78) (31 : Fin 78)
    (62 : Fin 78) (26 : Fin 78) (77 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5835` (kalmanson). -/
theorem middleSource_h5835 :
    ((!((allOneRankAtom (sourceRanks P) 31 == allOneRankAtom (sourceRanks P) 32)) || ((allOneRankAtom (sourceRanks P) 61).ult (allOneRankAtom (sourceRanks P) 62)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (62 : Fin 78) (31 : Fin 78)
    (61 : Fin 78) (32 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (6 : Fin 13) (11 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (61 : Fin 78) (32 : Fin 78) (31 : Fin 78)
    (62 : Fin 78) (26 : Fin 78) (77 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5836` (kalmanson). -/
theorem middleSource_h5836 :
    ((!((allOneRankAtom (sourceRanks P) 31 == allOneRankAtom (sourceRanks P) 61)) || ((allOneRankAtom (sourceRanks P) 32).ult (allOneRankAtom (sourceRanks P) 62)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (62 : Fin 78) (31 : Fin 78)
    (32 : Fin 78) (61 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (6 : Fin 13) (11 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (61 : Fin 78) (32 : Fin 78) (31 : Fin 78)
    (62 : Fin 78) (26 : Fin 78) (77 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5837` (kalmanson). -/
theorem middleSource_h5837 :
    ((!((allOneRankAtom (sourceRanks P) 62 == allOneRankAtom (sourceRanks P) 61)) || ((allOneRankAtom (sourceRanks P) 32).ult (allOneRankAtom (sourceRanks P) 31)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (31 : Fin 78) (62 : Fin 78)
    (32 : Fin 78) (61 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (6 : Fin 13) (11 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (61 : Fin 78) (32 : Fin 78) (31 : Fin 78)
    (62 : Fin 78) (26 : Fin 78) (77 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5838` (kalmanson). -/
theorem middleSource_h5838 :
    ((!((allOneRankAtom (sourceRanks P) 28 == allOneRankAtom (sourceRanks P) 27)) || ((allOneRankAtom (sourceRanks P) 68).ult (allOneRankAtom (sourceRanks P) 64)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (64 : Fin 78) (28 : Fin 78)
    (68 : Fin 78) (27 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (7 : Fin 13) (8 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (63 : Fin 78) (29 : Fin 78) (28 : Fin 78)
    (64 : Fin 78) (27 : Fin 78) (68 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5839` (kalmanson). -/
theorem middleSource_h5839 :
    ((!((allOneRankAtom (sourceRanks P) 28 == allOneRankAtom (sourceRanks P) 68)) || ((allOneRankAtom (sourceRanks P) 27).ult (allOneRankAtom (sourceRanks P) 64)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (64 : Fin 78) (28 : Fin 78)
    (27 : Fin 78) (68 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (7 : Fin 13) (8 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (63 : Fin 78) (29 : Fin 78) (28 : Fin 78)
    (64 : Fin 78) (27 : Fin 78) (68 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5840` (kalmanson). -/
theorem middleSource_h5840 :
    ((!((allOneRankAtom (sourceRanks P) 64 == allOneRankAtom (sourceRanks P) 68)) || ((allOneRankAtom (sourceRanks P) 27).ult (allOneRankAtom (sourceRanks P) 28)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (28 : Fin 78) (64 : Fin 78)
    (27 : Fin 78) (68 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (7 : Fin 13) (8 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (63 : Fin 78) (29 : Fin 78) (28 : Fin 78)
    (64 : Fin 78) (27 : Fin 78) (68 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5841` (kalmanson). -/
theorem middleSource_h5841 :
    ((!((allOneRankAtom (sourceRanks P) 28 == allOneRankAtom (sourceRanks P) 29)) || ((allOneRankAtom (sourceRanks P) 63).ult (allOneRankAtom (sourceRanks P) 64)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (64 : Fin 78) (28 : Fin 78)
    (63 : Fin 78) (29 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (7 : Fin 13) (8 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (63 : Fin 78) (29 : Fin 78) (28 : Fin 78)
    (64 : Fin 78) (27 : Fin 78) (68 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5842` (kalmanson). -/
theorem middleSource_h5842 :
    ((!((allOneRankAtom (sourceRanks P) 28 == allOneRankAtom (sourceRanks P) 63)) || ((allOneRankAtom (sourceRanks P) 29).ult (allOneRankAtom (sourceRanks P) 64)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (64 : Fin 78) (28 : Fin 78)
    (29 : Fin 78) (63 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (7 : Fin 13) (8 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (63 : Fin 78) (29 : Fin 78) (28 : Fin 78)
    (64 : Fin 78) (27 : Fin 78) (68 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5843` (kalmanson). -/
theorem middleSource_h5843 :
    ((!((allOneRankAtom (sourceRanks P) 64 == allOneRankAtom (sourceRanks P) 29)) || ((allOneRankAtom (sourceRanks P) 63).ult (allOneRankAtom (sourceRanks P) 28)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (28 : Fin 78) (64 : Fin 78)
    (63 : Fin 78) (29 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (7 : Fin 13) (8 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (63 : Fin 78) (29 : Fin 78) (28 : Fin 78)
    (64 : Fin 78) (27 : Fin 78) (68 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5844` (kalmanson). -/
theorem middleSource_h5844 :
    ((!((allOneRankAtom (sourceRanks P) 28 == allOneRankAtom (sourceRanks P) 27)) || ((allOneRankAtom (sourceRanks P) 69).ult (allOneRankAtom (sourceRanks P) 65)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (65 : Fin 78) (28 : Fin 78)
    (69 : Fin 78) (27 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (7 : Fin 13) (8 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (63 : Fin 78) (30 : Fin 78) (28 : Fin 78)
    (65 : Fin 78) (27 : Fin 78) (69 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5845` (kalmanson). -/
theorem middleSource_h5845 :
    ((!((allOneRankAtom (sourceRanks P) 28 == allOneRankAtom (sourceRanks P) 69)) || ((allOneRankAtom (sourceRanks P) 27).ult (allOneRankAtom (sourceRanks P) 65)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (65 : Fin 78) (28 : Fin 78)
    (27 : Fin 78) (69 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (7 : Fin 13) (8 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (63 : Fin 78) (30 : Fin 78) (28 : Fin 78)
    (65 : Fin 78) (27 : Fin 78) (69 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5846` (kalmanson). -/
theorem middleSource_h5846 :
    ((!((allOneRankAtom (sourceRanks P) 65 == allOneRankAtom (sourceRanks P) 27)) || ((allOneRankAtom (sourceRanks P) 69).ult (allOneRankAtom (sourceRanks P) 28)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (28 : Fin 78) (65 : Fin 78)
    (69 : Fin 78) (27 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (7 : Fin 13) (8 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (63 : Fin 78) (30 : Fin 78) (28 : Fin 78)
    (65 : Fin 78) (27 : Fin 78) (69 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5847` (kalmanson). -/
theorem middleSource_h5847 :
    ((!((allOneRankAtom (sourceRanks P) 65 == allOneRankAtom (sourceRanks P) 69)) || ((allOneRankAtom (sourceRanks P) 27).ult (allOneRankAtom (sourceRanks P) 28)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (28 : Fin 78) (65 : Fin 78)
    (27 : Fin 78) (69 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (7 : Fin 13) (8 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (63 : Fin 78) (30 : Fin 78) (28 : Fin 78)
    (65 : Fin 78) (27 : Fin 78) (69 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5848` (kalmanson). -/
theorem middleSource_h5848 :
    ((!((allOneRankAtom (sourceRanks P) 28 == allOneRankAtom (sourceRanks P) 30)) || ((allOneRankAtom (sourceRanks P) 63).ult (allOneRankAtom (sourceRanks P) 65)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (65 : Fin 78) (28 : Fin 78)
    (63 : Fin 78) (30 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (7 : Fin 13) (8 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (63 : Fin 78) (30 : Fin 78) (28 : Fin 78)
    (65 : Fin 78) (27 : Fin 78) (69 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5849` (kalmanson). -/
theorem middleSource_h5849 :
    ((!((allOneRankAtom (sourceRanks P) 28 == allOneRankAtom (sourceRanks P) 63)) || ((allOneRankAtom (sourceRanks P) 30).ult (allOneRankAtom (sourceRanks P) 65)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (65 : Fin 78) (28 : Fin 78)
    (30 : Fin 78) (63 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (7 : Fin 13) (8 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (63 : Fin 78) (30 : Fin 78) (28 : Fin 78)
    (65 : Fin 78) (27 : Fin 78) (69 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5850` (kalmanson). -/
theorem middleSource_h5850 :
    ((!((allOneRankAtom (sourceRanks P) 65 == allOneRankAtom (sourceRanks P) 30)) || ((allOneRankAtom (sourceRanks P) 63).ult (allOneRankAtom (sourceRanks P) 28)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (28 : Fin 78) (65 : Fin 78)
    (63 : Fin 78) (30 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (7 : Fin 13) (8 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (63 : Fin 78) (30 : Fin 78) (28 : Fin 78)
    (65 : Fin 78) (27 : Fin 78) (69 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5851` (kalmanson). -/
theorem middleSource_h5851 :
    ((!((allOneRankAtom (sourceRanks P) 28 == allOneRankAtom (sourceRanks P) 27)) || ((allOneRankAtom (sourceRanks P) 70).ult (allOneRankAtom (sourceRanks P) 66)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (66 : Fin 78) (28 : Fin 78)
    (70 : Fin 78) (27 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (7 : Fin 13) (8 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (63 : Fin 78) (31 : Fin 78) (28 : Fin 78)
    (66 : Fin 78) (27 : Fin 78) (70 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5852` (kalmanson). -/
theorem middleSource_h5852 :
    ((!((allOneRankAtom (sourceRanks P) 28 == allOneRankAtom (sourceRanks P) 70)) || ((allOneRankAtom (sourceRanks P) 27).ult (allOneRankAtom (sourceRanks P) 66)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (66 : Fin 78) (28 : Fin 78)
    (27 : Fin 78) (70 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (7 : Fin 13) (8 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (63 : Fin 78) (31 : Fin 78) (28 : Fin 78)
    (66 : Fin 78) (27 : Fin 78) (70 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5853` (kalmanson). -/
theorem middleSource_h5853 :
    ((!((allOneRankAtom (sourceRanks P) 66 == allOneRankAtom (sourceRanks P) 27)) || ((allOneRankAtom (sourceRanks P) 70).ult (allOneRankAtom (sourceRanks P) 28)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (28 : Fin 78) (66 : Fin 78)
    (70 : Fin 78) (27 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (7 : Fin 13) (8 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (63 : Fin 78) (31 : Fin 78) (28 : Fin 78)
    (66 : Fin 78) (27 : Fin 78) (70 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5854` (kalmanson). -/
theorem middleSource_h5854 :
    ((!((allOneRankAtom (sourceRanks P) 66 == allOneRankAtom (sourceRanks P) 70)) || ((allOneRankAtom (sourceRanks P) 27).ult (allOneRankAtom (sourceRanks P) 28)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (28 : Fin 78) (66 : Fin 78)
    (27 : Fin 78) (70 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (7 : Fin 13) (8 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (63 : Fin 78) (31 : Fin 78) (28 : Fin 78)
    (66 : Fin 78) (27 : Fin 78) (70 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5855` (kalmanson). -/
theorem middleSource_h5855 :
    ((!((allOneRankAtom (sourceRanks P) 28 == allOneRankAtom (sourceRanks P) 63)) || ((allOneRankAtom (sourceRanks P) 31).ult (allOneRankAtom (sourceRanks P) 66)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (66 : Fin 78) (28 : Fin 78)
    (31 : Fin 78) (63 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (7 : Fin 13) (8 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (63 : Fin 78) (31 : Fin 78) (28 : Fin 78)
    (66 : Fin 78) (27 : Fin 78) (70 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5856` (kalmanson). -/
theorem middleSource_h5856 :
    ((!((allOneRankAtom (sourceRanks P) 66 == allOneRankAtom (sourceRanks P) 31)) || ((allOneRankAtom (sourceRanks P) 63).ult (allOneRankAtom (sourceRanks P) 28)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (28 : Fin 78) (66 : Fin 78)
    (63 : Fin 78) (31 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (7 : Fin 13) (8 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (63 : Fin 78) (31 : Fin 78) (28 : Fin 78)
    (66 : Fin 78) (27 : Fin 78) (70 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5857` (kalmanson). -/
theorem middleSource_h5857 :
    ((!((allOneRankAtom (sourceRanks P) 28 == allOneRankAtom (sourceRanks P) 27)) || ((allOneRankAtom (sourceRanks P) 71).ult (allOneRankAtom (sourceRanks P) 67)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (67 : Fin 78) (28 : Fin 78)
    (71 : Fin 78) (27 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (7 : Fin 13) (8 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (63 : Fin 78) (32 : Fin 78) (28 : Fin 78)
    (67 : Fin 78) (27 : Fin 78) (71 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5858` (kalmanson). -/
theorem middleSource_h5858 :
    ((!((allOneRankAtom (sourceRanks P) 28 == allOneRankAtom (sourceRanks P) 71)) || ((allOneRankAtom (sourceRanks P) 27).ult (allOneRankAtom (sourceRanks P) 67)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (67 : Fin 78) (28 : Fin 78)
    (27 : Fin 78) (71 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (7 : Fin 13) (8 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (63 : Fin 78) (32 : Fin 78) (28 : Fin 78)
    (67 : Fin 78) (27 : Fin 78) (71 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5859` (kalmanson). -/
theorem middleSource_h5859 :
    ((!((allOneRankAtom (sourceRanks P) 67 == allOneRankAtom (sourceRanks P) 27)) || ((allOneRankAtom (sourceRanks P) 71).ult (allOneRankAtom (sourceRanks P) 28)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (28 : Fin 78) (67 : Fin 78)
    (71 : Fin 78) (27 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (7 : Fin 13) (8 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (63 : Fin 78) (32 : Fin 78) (28 : Fin 78)
    (67 : Fin 78) (27 : Fin 78) (71 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5860` (kalmanson). -/
theorem middleSource_h5860 :
    ((!((allOneRankAtom (sourceRanks P) 28 == allOneRankAtom (sourceRanks P) 63)) || ((allOneRankAtom (sourceRanks P) 32).ult (allOneRankAtom (sourceRanks P) 67)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (67 : Fin 78) (28 : Fin 78)
    (32 : Fin 78) (63 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (7 : Fin 13) (8 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (63 : Fin 78) (32 : Fin 78) (28 : Fin 78)
    (67 : Fin 78) (27 : Fin 78) (71 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5861` (kalmanson). -/
theorem middleSource_h5861 :
    ((!((allOneRankAtom (sourceRanks P) 29 == allOneRankAtom (sourceRanks P) 27)) || ((allOneRankAtom (sourceRanks P) 72).ult (allOneRankAtom (sourceRanks P) 65)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (65 : Fin 78) (29 : Fin 78)
    (72 : Fin 78) (27 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (7 : Fin 13) (9 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (64 : Fin 78) (30 : Fin 78) (29 : Fin 78)
    (65 : Fin 78) (27 : Fin 78) (72 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5862` (kalmanson). -/
theorem middleSource_h5862 :
    ((!((allOneRankAtom (sourceRanks P) 29 == allOneRankAtom (sourceRanks P) 72)) || ((allOneRankAtom (sourceRanks P) 27).ult (allOneRankAtom (sourceRanks P) 65)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (65 : Fin 78) (29 : Fin 78)
    (27 : Fin 78) (72 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (7 : Fin 13) (9 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (64 : Fin 78) (30 : Fin 78) (29 : Fin 78)
    (65 : Fin 78) (27 : Fin 78) (72 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5863` (kalmanson). -/
theorem middleSource_h5863 :
    ((!((allOneRankAtom (sourceRanks P) 65 == allOneRankAtom (sourceRanks P) 72)) || ((allOneRankAtom (sourceRanks P) 27).ult (allOneRankAtom (sourceRanks P) 29)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (29 : Fin 78) (65 : Fin 78)
    (27 : Fin 78) (72 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (7 : Fin 13) (9 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (64 : Fin 78) (30 : Fin 78) (29 : Fin 78)
    (65 : Fin 78) (27 : Fin 78) (72 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5864` (kalmanson). -/
theorem middleSource_h5864 :
    ((!((allOneRankAtom (sourceRanks P) 29 == allOneRankAtom (sourceRanks P) 30)) || ((allOneRankAtom (sourceRanks P) 64).ult (allOneRankAtom (sourceRanks P) 65)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (65 : Fin 78) (29 : Fin 78)
    (64 : Fin 78) (30 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (7 : Fin 13) (9 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (64 : Fin 78) (30 : Fin 78) (29 : Fin 78)
    (65 : Fin 78) (27 : Fin 78) (72 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5865` (kalmanson). -/
theorem middleSource_h5865 :
    ((!((allOneRankAtom (sourceRanks P) 29 == allOneRankAtom (sourceRanks P) 64)) || ((allOneRankAtom (sourceRanks P) 30).ult (allOneRankAtom (sourceRanks P) 65)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (65 : Fin 78) (29 : Fin 78)
    (30 : Fin 78) (64 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (7 : Fin 13) (9 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (64 : Fin 78) (30 : Fin 78) (29 : Fin 78)
    (65 : Fin 78) (27 : Fin 78) (72 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5866` (kalmanson). -/
theorem middleSource_h5866 :
    ((!((allOneRankAtom (sourceRanks P) 65 == allOneRankAtom (sourceRanks P) 30)) || ((allOneRankAtom (sourceRanks P) 64).ult (allOneRankAtom (sourceRanks P) 29)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (29 : Fin 78) (65 : Fin 78)
    (64 : Fin 78) (30 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (7 : Fin 13) (9 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (64 : Fin 78) (30 : Fin 78) (29 : Fin 78)
    (65 : Fin 78) (27 : Fin 78) (72 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5867` (kalmanson). -/
theorem middleSource_h5867 :
    ((!((allOneRankAtom (sourceRanks P) 65 == allOneRankAtom (sourceRanks P) 64)) || ((allOneRankAtom (sourceRanks P) 30).ult (allOneRankAtom (sourceRanks P) 29)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (29 : Fin 78) (65 : Fin 78)
    (30 : Fin 78) (64 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (7 : Fin 13) (9 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (64 : Fin 78) (30 : Fin 78) (29 : Fin 78)
    (65 : Fin 78) (27 : Fin 78) (72 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5868` (kalmanson). -/
theorem middleSource_h5868 :
    ((!((allOneRankAtom (sourceRanks P) 29 == allOneRankAtom (sourceRanks P) 27)) || ((allOneRankAtom (sourceRanks P) 73).ult (allOneRankAtom (sourceRanks P) 66)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (66 : Fin 78) (29 : Fin 78)
    (73 : Fin 78) (27 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (7 : Fin 13) (9 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (64 : Fin 78) (31 : Fin 78) (29 : Fin 78)
    (66 : Fin 78) (27 : Fin 78) (73 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5869` (kalmanson). -/
theorem middleSource_h5869 :
    ((!((allOneRankAtom (sourceRanks P) 29 == allOneRankAtom (sourceRanks P) 73)) || ((allOneRankAtom (sourceRanks P) 27).ult (allOneRankAtom (sourceRanks P) 66)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (66 : Fin 78) (29 : Fin 78)
    (27 : Fin 78) (73 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (7 : Fin 13) (9 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (64 : Fin 78) (31 : Fin 78) (29 : Fin 78)
    (66 : Fin 78) (27 : Fin 78) (73 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5870` (kalmanson). -/
theorem middleSource_h5870 :
    ((!((allOneRankAtom (sourceRanks P) 66 == allOneRankAtom (sourceRanks P) 73)) || ((allOneRankAtom (sourceRanks P) 27).ult (allOneRankAtom (sourceRanks P) 29)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (29 : Fin 78) (66 : Fin 78)
    (27 : Fin 78) (73 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (7 : Fin 13) (9 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (64 : Fin 78) (31 : Fin 78) (29 : Fin 78)
    (66 : Fin 78) (27 : Fin 78) (73 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5871` (kalmanson). -/
theorem middleSource_h5871 :
    ((!((allOneRankAtom (sourceRanks P) 29 == allOneRankAtom (sourceRanks P) 31)) || ((allOneRankAtom (sourceRanks P) 64).ult (allOneRankAtom (sourceRanks P) 66)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (66 : Fin 78) (29 : Fin 78)
    (64 : Fin 78) (31 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (7 : Fin 13) (9 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (64 : Fin 78) (31 : Fin 78) (29 : Fin 78)
    (66 : Fin 78) (27 : Fin 78) (73 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5872` (kalmanson). -/
theorem middleSource_h5872 :
    ((!((allOneRankAtom (sourceRanks P) 29 == allOneRankAtom (sourceRanks P) 64)) || ((allOneRankAtom (sourceRanks P) 31).ult (allOneRankAtom (sourceRanks P) 66)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (66 : Fin 78) (29 : Fin 78)
    (31 : Fin 78) (64 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (7 : Fin 13) (9 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (64 : Fin 78) (31 : Fin 78) (29 : Fin 78)
    (66 : Fin 78) (27 : Fin 78) (73 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5873` (kalmanson). -/
theorem middleSource_h5873 :
    ((!((allOneRankAtom (sourceRanks P) 66 == allOneRankAtom (sourceRanks P) 31)) || ((allOneRankAtom (sourceRanks P) 64).ult (allOneRankAtom (sourceRanks P) 29)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (29 : Fin 78) (66 : Fin 78)
    (64 : Fin 78) (31 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (7 : Fin 13) (9 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (64 : Fin 78) (31 : Fin 78) (29 : Fin 78)
    (66 : Fin 78) (27 : Fin 78) (73 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5874` (kalmanson). -/
theorem middleSource_h5874 :
    ((!((allOneRankAtom (sourceRanks P) 29 == allOneRankAtom (sourceRanks P) 27)) || ((allOneRankAtom (sourceRanks P) 74).ult (allOneRankAtom (sourceRanks P) 67)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (67 : Fin 78) (29 : Fin 78)
    (74 : Fin 78) (27 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (7 : Fin 13) (9 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (64 : Fin 78) (32 : Fin 78) (29 : Fin 78)
    (67 : Fin 78) (27 : Fin 78) (74 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5875` (kalmanson). -/
theorem middleSource_h5875 :
    ((!((allOneRankAtom (sourceRanks P) 29 == allOneRankAtom (sourceRanks P) 74)) || ((allOneRankAtom (sourceRanks P) 27).ult (allOneRankAtom (sourceRanks P) 67)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (67 : Fin 78) (29 : Fin 78)
    (27 : Fin 78) (74 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (7 : Fin 13) (9 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (64 : Fin 78) (32 : Fin 78) (29 : Fin 78)
    (67 : Fin 78) (27 : Fin 78) (74 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5876` (kalmanson). -/
theorem middleSource_h5876 :
    ((!((allOneRankAtom (sourceRanks P) 29 == allOneRankAtom (sourceRanks P) 32)) || ((allOneRankAtom (sourceRanks P) 64).ult (allOneRankAtom (sourceRanks P) 67)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (67 : Fin 78) (29 : Fin 78)
    (64 : Fin 78) (32 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (7 : Fin 13) (9 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (64 : Fin 78) (32 : Fin 78) (29 : Fin 78)
    (67 : Fin 78) (27 : Fin 78) (74 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5877` (kalmanson). -/
theorem middleSource_h5877 :
    ((!((allOneRankAtom (sourceRanks P) 29 == allOneRankAtom (sourceRanks P) 64)) || ((allOneRankAtom (sourceRanks P) 32).ult (allOneRankAtom (sourceRanks P) 67)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (67 : Fin 78) (29 : Fin 78)
    (32 : Fin 78) (64 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (7 : Fin 13) (9 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (64 : Fin 78) (32 : Fin 78) (29 : Fin 78)
    (67 : Fin 78) (27 : Fin 78) (74 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5878` (kalmanson). -/
theorem middleSource_h5878 :
    ((!((allOneRankAtom (sourceRanks P) 30 == allOneRankAtom (sourceRanks P) 27)) || ((allOneRankAtom (sourceRanks P) 75).ult (allOneRankAtom (sourceRanks P) 66)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (66 : Fin 78) (30 : Fin 78)
    (75 : Fin 78) (27 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (7 : Fin 13) (10 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (65 : Fin 78) (31 : Fin 78) (30 : Fin 78)
    (66 : Fin 78) (27 : Fin 78) (75 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5879` (kalmanson). -/
theorem middleSource_h5879 :
    ((!((allOneRankAtom (sourceRanks P) 30 == allOneRankAtom (sourceRanks P) 75)) || ((allOneRankAtom (sourceRanks P) 27).ult (allOneRankAtom (sourceRanks P) 66)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (66 : Fin 78) (30 : Fin 78)
    (27 : Fin 78) (75 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (7 : Fin 13) (10 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (65 : Fin 78) (31 : Fin 78) (30 : Fin 78)
    (66 : Fin 78) (27 : Fin 78) (75 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5880` (kalmanson). -/
theorem middleSource_h5880 :
    ((!((allOneRankAtom (sourceRanks P) 66 == allOneRankAtom (sourceRanks P) 75)) || ((allOneRankAtom (sourceRanks P) 27).ult (allOneRankAtom (sourceRanks P) 30)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (30 : Fin 78) (66 : Fin 78)
    (27 : Fin 78) (75 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (7 : Fin 13) (10 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (65 : Fin 78) (31 : Fin 78) (30 : Fin 78)
    (66 : Fin 78) (27 : Fin 78) (75 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5881` (kalmanson). -/
theorem middleSource_h5881 :
    ((!((allOneRankAtom (sourceRanks P) 30 == allOneRankAtom (sourceRanks P) 31)) || ((allOneRankAtom (sourceRanks P) 65).ult (allOneRankAtom (sourceRanks P) 66)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (66 : Fin 78) (30 : Fin 78)
    (65 : Fin 78) (31 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (7 : Fin 13) (10 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (65 : Fin 78) (31 : Fin 78) (30 : Fin 78)
    (66 : Fin 78) (27 : Fin 78) (75 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5882` (kalmanson). -/
theorem middleSource_h5882 :
    ((!((allOneRankAtom (sourceRanks P) 30 == allOneRankAtom (sourceRanks P) 65)) || ((allOneRankAtom (sourceRanks P) 31).ult (allOneRankAtom (sourceRanks P) 66)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (66 : Fin 78) (30 : Fin 78)
    (31 : Fin 78) (65 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (7 : Fin 13) (10 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (65 : Fin 78) (31 : Fin 78) (30 : Fin 78)
    (66 : Fin 78) (27 : Fin 78) (75 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5883` (kalmanson). -/
theorem middleSource_h5883 :
    ((!((allOneRankAtom (sourceRanks P) 66 == allOneRankAtom (sourceRanks P) 31)) || ((allOneRankAtom (sourceRanks P) 65).ult (allOneRankAtom (sourceRanks P) 30)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (30 : Fin 78) (66 : Fin 78)
    (65 : Fin 78) (31 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (7 : Fin 13) (10 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (65 : Fin 78) (31 : Fin 78) (30 : Fin 78)
    (66 : Fin 78) (27 : Fin 78) (75 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5884` (kalmanson). -/
theorem middleSource_h5884 :
    ((!((allOneRankAtom (sourceRanks P) 30 == allOneRankAtom (sourceRanks P) 27)) || ((allOneRankAtom (sourceRanks P) 76).ult (allOneRankAtom (sourceRanks P) 67)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (67 : Fin 78) (30 : Fin 78)
    (76 : Fin 78) (27 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (7 : Fin 13) (10 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (65 : Fin 78) (32 : Fin 78) (30 : Fin 78)
    (67 : Fin 78) (27 : Fin 78) (76 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5885` (kalmanson). -/
theorem middleSource_h5885 :
    ((!((allOneRankAtom (sourceRanks P) 30 == allOneRankAtom (sourceRanks P) 76)) || ((allOneRankAtom (sourceRanks P) 27).ult (allOneRankAtom (sourceRanks P) 67)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (67 : Fin 78) (30 : Fin 78)
    (27 : Fin 78) (76 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (7 : Fin 13) (10 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (65 : Fin 78) (32 : Fin 78) (30 : Fin 78)
    (67 : Fin 78) (27 : Fin 78) (76 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5886` (kalmanson). -/
theorem middleSource_h5886 :
    ((!((allOneRankAtom (sourceRanks P) 30 == allOneRankAtom (sourceRanks P) 32)) || ((allOneRankAtom (sourceRanks P) 65).ult (allOneRankAtom (sourceRanks P) 67)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (67 : Fin 78) (30 : Fin 78)
    (65 : Fin 78) (32 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (7 : Fin 13) (10 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (65 : Fin 78) (32 : Fin 78) (30 : Fin 78)
    (67 : Fin 78) (27 : Fin 78) (76 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5887` (kalmanson). -/
theorem middleSource_h5887 :
    ((!((allOneRankAtom (sourceRanks P) 30 == allOneRankAtom (sourceRanks P) 65)) || ((allOneRankAtom (sourceRanks P) 32).ult (allOneRankAtom (sourceRanks P) 67)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (67 : Fin 78) (30 : Fin 78)
    (32 : Fin 78) (65 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (7 : Fin 13) (10 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (65 : Fin 78) (32 : Fin 78) (30 : Fin 78)
    (67 : Fin 78) (27 : Fin 78) (76 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

end

end ATailExactFiveCard13AllOneSourceIngressScratch
end Problem97
