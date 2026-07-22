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

/-- Candidate middle source assertion `h4160` (kalmanson). -/
theorem middleSource_h4160 :
    ((!((allOneRankAtom (sourceRanks P) 7 == allOneRankAtom (sourceRanks P) 6)) || ((allOneRankAtom (sourceRanks P) 68).ult (allOneRankAtom (sourceRanks P) 64)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (64 : Fin 78) (7 : Fin 78)
    (68 : Fin 78) (6 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (7 : Fin 13) (8 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (63 : Fin 78) (8 : Fin 78) (7 : Fin 78)
    (64 : Fin 78) (6 : Fin 78) (68 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4161` (kalmanson). -/
theorem middleSource_h4161 :
    ((!((allOneRankAtom (sourceRanks P) 64 == allOneRankAtom (sourceRanks P) 6)) || ((allOneRankAtom (sourceRanks P) 68).ult (allOneRankAtom (sourceRanks P) 7)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (7 : Fin 78) (64 : Fin 78)
    (68 : Fin 78) (6 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (7 : Fin 13) (8 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (63 : Fin 78) (8 : Fin 78) (7 : Fin 78)
    (64 : Fin 78) (6 : Fin 78) (68 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4162` (kalmanson). -/
theorem middleSource_h4162 :
    ((!((allOneRankAtom (sourceRanks P) 64 == allOneRankAtom (sourceRanks P) 68)) || ((allOneRankAtom (sourceRanks P) 6).ult (allOneRankAtom (sourceRanks P) 7)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (7 : Fin 78) (64 : Fin 78)
    (6 : Fin 78) (68 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (7 : Fin 13) (8 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (63 : Fin 78) (8 : Fin 78) (7 : Fin 78)
    (64 : Fin 78) (6 : Fin 78) (68 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4163` (kalmanson). -/
theorem middleSource_h4163 :
    ((!((allOneRankAtom (sourceRanks P) 7 == allOneRankAtom (sourceRanks P) 63)) || ((allOneRankAtom (sourceRanks P) 8).ult (allOneRankAtom (sourceRanks P) 64)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (64 : Fin 78) (7 : Fin 78)
    (8 : Fin 78) (63 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (7 : Fin 13) (8 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (63 : Fin 78) (8 : Fin 78) (7 : Fin 78)
    (64 : Fin 78) (6 : Fin 78) (68 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4164` (kalmanson). -/
theorem middleSource_h4164 :
    ((!((allOneRankAtom (sourceRanks P) 64 == allOneRankAtom (sourceRanks P) 8)) || ((allOneRankAtom (sourceRanks P) 63).ult (allOneRankAtom (sourceRanks P) 7)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (7 : Fin 78) (64 : Fin 78)
    (63 : Fin 78) (8 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (7 : Fin 13) (8 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (63 : Fin 78) (8 : Fin 78) (7 : Fin 78)
    (64 : Fin 78) (6 : Fin 78) (68 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4165` (kalmanson). -/
theorem middleSource_h4165 :
    ((!((allOneRankAtom (sourceRanks P) 7 == allOneRankAtom (sourceRanks P) 6)) || ((allOneRankAtom (sourceRanks P) 69).ult (allOneRankAtom (sourceRanks P) 65)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (65 : Fin 78) (7 : Fin 78)
    (69 : Fin 78) (6 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (7 : Fin 13) (8 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (63 : Fin 78) (9 : Fin 78) (7 : Fin 78)
    (65 : Fin 78) (6 : Fin 78) (69 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4166` (kalmanson). -/
theorem middleSource_h4166 :
    ((!((allOneRankAtom (sourceRanks P) 65 == allOneRankAtom (sourceRanks P) 6)) || ((allOneRankAtom (sourceRanks P) 69).ult (allOneRankAtom (sourceRanks P) 7)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (7 : Fin 78) (65 : Fin 78)
    (69 : Fin 78) (6 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (7 : Fin 13) (8 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (63 : Fin 78) (9 : Fin 78) (7 : Fin 78)
    (65 : Fin 78) (6 : Fin 78) (69 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4167` (kalmanson). -/
theorem middleSource_h4167 :
    ((!((allOneRankAtom (sourceRanks P) 65 == allOneRankAtom (sourceRanks P) 69)) || ((allOneRankAtom (sourceRanks P) 6).ult (allOneRankAtom (sourceRanks P) 7)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (7 : Fin 78) (65 : Fin 78)
    (6 : Fin 78) (69 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (7 : Fin 13) (8 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (63 : Fin 78) (9 : Fin 78) (7 : Fin 78)
    (65 : Fin 78) (6 : Fin 78) (69 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4168` (kalmanson). -/
theorem middleSource_h4168 :
    ((!((allOneRankAtom (sourceRanks P) 7 == allOneRankAtom (sourceRanks P) 63)) || ((allOneRankAtom (sourceRanks P) 9).ult (allOneRankAtom (sourceRanks P) 65)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (65 : Fin 78) (7 : Fin 78)
    (9 : Fin 78) (63 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (7 : Fin 13) (8 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (63 : Fin 78) (9 : Fin 78) (7 : Fin 78)
    (65 : Fin 78) (6 : Fin 78) (69 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4169` (kalmanson). -/
theorem middleSource_h4169 :
    ((!((allOneRankAtom (sourceRanks P) 65 == allOneRankAtom (sourceRanks P) 9)) || ((allOneRankAtom (sourceRanks P) 63).ult (allOneRankAtom (sourceRanks P) 7)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (7 : Fin 78) (65 : Fin 78)
    (63 : Fin 78) (9 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (7 : Fin 13) (8 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (63 : Fin 78) (9 : Fin 78) (7 : Fin 78)
    (65 : Fin 78) (6 : Fin 78) (69 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4170` (kalmanson). -/
theorem middleSource_h4170 :
    ((!((allOneRankAtom (sourceRanks P) 7 == allOneRankAtom (sourceRanks P) 6)) || ((allOneRankAtom (sourceRanks P) 70).ult (allOneRankAtom (sourceRanks P) 66)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (66 : Fin 78) (7 : Fin 78)
    (70 : Fin 78) (6 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (7 : Fin 13) (8 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (63 : Fin 78) (10 : Fin 78) (7 : Fin 78)
    (66 : Fin 78) (6 : Fin 78) (70 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4171` (kalmanson). -/
theorem middleSource_h4171 :
    ((!((allOneRankAtom (sourceRanks P) 66 == allOneRankAtom (sourceRanks P) 6)) || ((allOneRankAtom (sourceRanks P) 70).ult (allOneRankAtom (sourceRanks P) 7)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (7 : Fin 78) (66 : Fin 78)
    (70 : Fin 78) (6 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (7 : Fin 13) (8 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (63 : Fin 78) (10 : Fin 78) (7 : Fin 78)
    (66 : Fin 78) (6 : Fin 78) (70 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4172` (kalmanson). -/
theorem middleSource_h4172 :
    ((!((allOneRankAtom (sourceRanks P) 66 == allOneRankAtom (sourceRanks P) 70)) || ((allOneRankAtom (sourceRanks P) 6).ult (allOneRankAtom (sourceRanks P) 7)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (7 : Fin 78) (66 : Fin 78)
    (6 : Fin 78) (70 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (7 : Fin 13) (8 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (63 : Fin 78) (10 : Fin 78) (7 : Fin 78)
    (66 : Fin 78) (6 : Fin 78) (70 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4173` (kalmanson). -/
theorem middleSource_h4173 :
    ((!((allOneRankAtom (sourceRanks P) 7 == allOneRankAtom (sourceRanks P) 63)) || ((allOneRankAtom (sourceRanks P) 10).ult (allOneRankAtom (sourceRanks P) 66)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (66 : Fin 78) (7 : Fin 78)
    (10 : Fin 78) (63 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (7 : Fin 13) (8 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (63 : Fin 78) (10 : Fin 78) (7 : Fin 78)
    (66 : Fin 78) (6 : Fin 78) (70 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4174` (kalmanson). -/
theorem middleSource_h4174 :
    ((!((allOneRankAtom (sourceRanks P) 66 == allOneRankAtom (sourceRanks P) 10)) || ((allOneRankAtom (sourceRanks P) 63).ult (allOneRankAtom (sourceRanks P) 7)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (7 : Fin 78) (66 : Fin 78)
    (63 : Fin 78) (10 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (7 : Fin 13) (8 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (63 : Fin 78) (10 : Fin 78) (7 : Fin 78)
    (66 : Fin 78) (6 : Fin 78) (70 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4175` (kalmanson). -/
theorem middleSource_h4175 :
    ((!((allOneRankAtom (sourceRanks P) 7 == allOneRankAtom (sourceRanks P) 6)) || ((allOneRankAtom (sourceRanks P) 71).ult (allOneRankAtom (sourceRanks P) 67)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (67 : Fin 78) (7 : Fin 78)
    (71 : Fin 78) (6 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (7 : Fin 13) (8 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (63 : Fin 78) (11 : Fin 78) (7 : Fin 78)
    (67 : Fin 78) (6 : Fin 78) (71 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4176` (kalmanson). -/
theorem middleSource_h4176 :
    ((!((allOneRankAtom (sourceRanks P) 7 == allOneRankAtom (sourceRanks P) 71)) || ((allOneRankAtom (sourceRanks P) 6).ult (allOneRankAtom (sourceRanks P) 67)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (67 : Fin 78) (7 : Fin 78)
    (6 : Fin 78) (71 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (7 : Fin 13) (8 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (63 : Fin 78) (11 : Fin 78) (7 : Fin 78)
    (67 : Fin 78) (6 : Fin 78) (71 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4177` (kalmanson). -/
theorem middleSource_h4177 :
    ((!((allOneRankAtom (sourceRanks P) 67 == allOneRankAtom (sourceRanks P) 6)) || ((allOneRankAtom (sourceRanks P) 71).ult (allOneRankAtom (sourceRanks P) 7)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (7 : Fin 78) (67 : Fin 78)
    (71 : Fin 78) (6 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (7 : Fin 13) (8 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (63 : Fin 78) (11 : Fin 78) (7 : Fin 78)
    (67 : Fin 78) (6 : Fin 78) (71 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4178` (kalmanson). -/
theorem middleSource_h4178 :
    ((!((allOneRankAtom (sourceRanks P) 8 == allOneRankAtom (sourceRanks P) 6)) || ((allOneRankAtom (sourceRanks P) 72).ult (allOneRankAtom (sourceRanks P) 65)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (65 : Fin 78) (8 : Fin 78)
    (72 : Fin 78) (6 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (7 : Fin 13) (9 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (64 : Fin 78) (9 : Fin 78) (8 : Fin 78)
    (65 : Fin 78) (6 : Fin 78) (72 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4179` (kalmanson). -/
theorem middleSource_h4179 :
    ((!((allOneRankAtom (sourceRanks P) 8 == allOneRankAtom (sourceRanks P) 72)) || ((allOneRankAtom (sourceRanks P) 6).ult (allOneRankAtom (sourceRanks P) 65)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (65 : Fin 78) (8 : Fin 78)
    (6 : Fin 78) (72 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (7 : Fin 13) (9 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (64 : Fin 78) (9 : Fin 78) (8 : Fin 78)
    (65 : Fin 78) (6 : Fin 78) (72 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4180` (kalmanson). -/
theorem middleSource_h4180 :
    ((!((allOneRankAtom (sourceRanks P) 65 == allOneRankAtom (sourceRanks P) 6)) || ((allOneRankAtom (sourceRanks P) 72).ult (allOneRankAtom (sourceRanks P) 8)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (8 : Fin 78) (65 : Fin 78)
    (72 : Fin 78) (6 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (7 : Fin 13) (9 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (64 : Fin 78) (9 : Fin 78) (8 : Fin 78)
    (65 : Fin 78) (6 : Fin 78) (72 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4181` (kalmanson). -/
theorem middleSource_h4181 :
    ((!((allOneRankAtom (sourceRanks P) 65 == allOneRankAtom (sourceRanks P) 72)) || ((allOneRankAtom (sourceRanks P) 6).ult (allOneRankAtom (sourceRanks P) 8)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (8 : Fin 78) (65 : Fin 78)
    (6 : Fin 78) (72 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (7 : Fin 13) (9 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (64 : Fin 78) (9 : Fin 78) (8 : Fin 78)
    (65 : Fin 78) (6 : Fin 78) (72 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4182` (kalmanson). -/
theorem middleSource_h4182 :
    ((!((allOneRankAtom (sourceRanks P) 8 == allOneRankAtom (sourceRanks P) 64)) || ((allOneRankAtom (sourceRanks P) 9).ult (allOneRankAtom (sourceRanks P) 65)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (65 : Fin 78) (8 : Fin 78)
    (9 : Fin 78) (64 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (7 : Fin 13) (9 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (64 : Fin 78) (9 : Fin 78) (8 : Fin 78)
    (65 : Fin 78) (6 : Fin 78) (72 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4183` (kalmanson). -/
theorem middleSource_h4183 :
    ((!((allOneRankAtom (sourceRanks P) 65 == allOneRankAtom (sourceRanks P) 9)) || ((allOneRankAtom (sourceRanks P) 64).ult (allOneRankAtom (sourceRanks P) 8)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (8 : Fin 78) (65 : Fin 78)
    (64 : Fin 78) (9 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (7 : Fin 13) (9 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (64 : Fin 78) (9 : Fin 78) (8 : Fin 78)
    (65 : Fin 78) (6 : Fin 78) (72 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4184` (kalmanson). -/
theorem middleSource_h4184 :
    ((!((allOneRankAtom (sourceRanks P) 65 == allOneRankAtom (sourceRanks P) 64)) || ((allOneRankAtom (sourceRanks P) 9).ult (allOneRankAtom (sourceRanks P) 8)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (8 : Fin 78) (65 : Fin 78)
    (9 : Fin 78) (64 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (7 : Fin 13) (9 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (64 : Fin 78) (9 : Fin 78) (8 : Fin 78)
    (65 : Fin 78) (6 : Fin 78) (72 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4185` (kalmanson). -/
theorem middleSource_h4185 :
    ((!((allOneRankAtom (sourceRanks P) 8 == allOneRankAtom (sourceRanks P) 6)) || ((allOneRankAtom (sourceRanks P) 73).ult (allOneRankAtom (sourceRanks P) 66)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (66 : Fin 78) (8 : Fin 78)
    (73 : Fin 78) (6 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (7 : Fin 13) (9 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (64 : Fin 78) (10 : Fin 78) (8 : Fin 78)
    (66 : Fin 78) (6 : Fin 78) (73 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4186` (kalmanson). -/
theorem middleSource_h4186 :
    ((!((allOneRankAtom (sourceRanks P) 8 == allOneRankAtom (sourceRanks P) 73)) || ((allOneRankAtom (sourceRanks P) 6).ult (allOneRankAtom (sourceRanks P) 66)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (66 : Fin 78) (8 : Fin 78)
    (6 : Fin 78) (73 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (7 : Fin 13) (9 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (64 : Fin 78) (10 : Fin 78) (8 : Fin 78)
    (66 : Fin 78) (6 : Fin 78) (73 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4187` (kalmanson). -/
theorem middleSource_h4187 :
    ((!((allOneRankAtom (sourceRanks P) 66 == allOneRankAtom (sourceRanks P) 6)) || ((allOneRankAtom (sourceRanks P) 73).ult (allOneRankAtom (sourceRanks P) 8)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (8 : Fin 78) (66 : Fin 78)
    (73 : Fin 78) (6 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (7 : Fin 13) (9 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (64 : Fin 78) (10 : Fin 78) (8 : Fin 78)
    (66 : Fin 78) (6 : Fin 78) (73 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4188` (kalmanson). -/
theorem middleSource_h4188 :
    ((!((allOneRankAtom (sourceRanks P) 66 == allOneRankAtom (sourceRanks P) 73)) || ((allOneRankAtom (sourceRanks P) 6).ult (allOneRankAtom (sourceRanks P) 8)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (8 : Fin 78) (66 : Fin 78)
    (6 : Fin 78) (73 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (7 : Fin 13) (9 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (64 : Fin 78) (10 : Fin 78) (8 : Fin 78)
    (66 : Fin 78) (6 : Fin 78) (73 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4189` (kalmanson). -/
theorem middleSource_h4189 :
    ((!((allOneRankAtom (sourceRanks P) 8 == allOneRankAtom (sourceRanks P) 64)) || ((allOneRankAtom (sourceRanks P) 10).ult (allOneRankAtom (sourceRanks P) 66)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (66 : Fin 78) (8 : Fin 78)
    (10 : Fin 78) (64 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (7 : Fin 13) (9 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (64 : Fin 78) (10 : Fin 78) (8 : Fin 78)
    (66 : Fin 78) (6 : Fin 78) (73 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4190` (kalmanson). -/
theorem middleSource_h4190 :
    ((!((allOneRankAtom (sourceRanks P) 66 == allOneRankAtom (sourceRanks P) 10)) || ((allOneRankAtom (sourceRanks P) 64).ult (allOneRankAtom (sourceRanks P) 8)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (8 : Fin 78) (66 : Fin 78)
    (64 : Fin 78) (10 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (7 : Fin 13) (9 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (64 : Fin 78) (10 : Fin 78) (8 : Fin 78)
    (66 : Fin 78) (6 : Fin 78) (73 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4191` (kalmanson). -/
theorem middleSource_h4191 :
    ((!((allOneRankAtom (sourceRanks P) 8 == allOneRankAtom (sourceRanks P) 6)) || ((allOneRankAtom (sourceRanks P) 74).ult (allOneRankAtom (sourceRanks P) 67)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (67 : Fin 78) (8 : Fin 78)
    (74 : Fin 78) (6 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (7 : Fin 13) (9 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (64 : Fin 78) (11 : Fin 78) (8 : Fin 78)
    (67 : Fin 78) (6 : Fin 78) (74 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4192` (kalmanson). -/
theorem middleSource_h4192 :
    ((!((allOneRankAtom (sourceRanks P) 8 == allOneRankAtom (sourceRanks P) 74)) || ((allOneRankAtom (sourceRanks P) 6).ult (allOneRankAtom (sourceRanks P) 67)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (67 : Fin 78) (8 : Fin 78)
    (6 : Fin 78) (74 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (7 : Fin 13) (9 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (64 : Fin 78) (11 : Fin 78) (8 : Fin 78)
    (67 : Fin 78) (6 : Fin 78) (74 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4193` (kalmanson). -/
theorem middleSource_h4193 :
    ((!((allOneRankAtom (sourceRanks P) 67 == allOneRankAtom (sourceRanks P) 6)) || ((allOneRankAtom (sourceRanks P) 74).ult (allOneRankAtom (sourceRanks P) 8)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (8 : Fin 78) (67 : Fin 78)
    (74 : Fin 78) (6 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (7 : Fin 13) (9 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (64 : Fin 78) (11 : Fin 78) (8 : Fin 78)
    (67 : Fin 78) (6 : Fin 78) (74 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4194` (kalmanson). -/
theorem middleSource_h4194 :
    ((!((allOneRankAtom (sourceRanks P) 8 == allOneRankAtom (sourceRanks P) 64)) || ((allOneRankAtom (sourceRanks P) 11).ult (allOneRankAtom (sourceRanks P) 67)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (67 : Fin 78) (8 : Fin 78)
    (11 : Fin 78) (64 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (7 : Fin 13) (9 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (64 : Fin 78) (11 : Fin 78) (8 : Fin 78)
    (67 : Fin 78) (6 : Fin 78) (74 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4195` (kalmanson). -/
theorem middleSource_h4195 :
    ((!((allOneRankAtom (sourceRanks P) 9 == allOneRankAtom (sourceRanks P) 6)) || ((allOneRankAtom (sourceRanks P) 75).ult (allOneRankAtom (sourceRanks P) 66)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (66 : Fin 78) (9 : Fin 78)
    (75 : Fin 78) (6 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (7 : Fin 13) (10 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (65 : Fin 78) (10 : Fin 78) (9 : Fin 78)
    (66 : Fin 78) (6 : Fin 78) (75 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4196` (kalmanson). -/
theorem middleSource_h4196 :
    ((!((allOneRankAtom (sourceRanks P) 9 == allOneRankAtom (sourceRanks P) 75)) || ((allOneRankAtom (sourceRanks P) 6).ult (allOneRankAtom (sourceRanks P) 66)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (66 : Fin 78) (9 : Fin 78)
    (6 : Fin 78) (75 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (7 : Fin 13) (10 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (65 : Fin 78) (10 : Fin 78) (9 : Fin 78)
    (66 : Fin 78) (6 : Fin 78) (75 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4197` (kalmanson). -/
theorem middleSource_h4197 :
    ((!((allOneRankAtom (sourceRanks P) 66 == allOneRankAtom (sourceRanks P) 6)) || ((allOneRankAtom (sourceRanks P) 75).ult (allOneRankAtom (sourceRanks P) 9)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (9 : Fin 78) (66 : Fin 78)
    (75 : Fin 78) (6 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (7 : Fin 13) (10 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (65 : Fin 78) (10 : Fin 78) (9 : Fin 78)
    (66 : Fin 78) (6 : Fin 78) (75 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4198` (kalmanson). -/
theorem middleSource_h4198 :
    ((!((allOneRankAtom (sourceRanks P) 66 == allOneRankAtom (sourceRanks P) 75)) || ((allOneRankAtom (sourceRanks P) 6).ult (allOneRankAtom (sourceRanks P) 9)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (9 : Fin 78) (66 : Fin 78)
    (6 : Fin 78) (75 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (7 : Fin 13) (10 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (65 : Fin 78) (10 : Fin 78) (9 : Fin 78)
    (66 : Fin 78) (6 : Fin 78) (75 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4199` (kalmanson). -/
theorem middleSource_h4199 :
    ((!((allOneRankAtom (sourceRanks P) 9 == allOneRankAtom (sourceRanks P) 65)) || ((allOneRankAtom (sourceRanks P) 10).ult (allOneRankAtom (sourceRanks P) 66)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (66 : Fin 78) (9 : Fin 78)
    (10 : Fin 78) (65 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (7 : Fin 13) (10 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (65 : Fin 78) (10 : Fin 78) (9 : Fin 78)
    (66 : Fin 78) (6 : Fin 78) (75 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4200` (kalmanson). -/
theorem middleSource_h4200 :
    ((!((allOneRankAtom (sourceRanks P) 66 == allOneRankAtom (sourceRanks P) 10)) || ((allOneRankAtom (sourceRanks P) 65).ult (allOneRankAtom (sourceRanks P) 9)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (9 : Fin 78) (66 : Fin 78)
    (65 : Fin 78) (10 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (7 : Fin 13) (10 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (65 : Fin 78) (10 : Fin 78) (9 : Fin 78)
    (66 : Fin 78) (6 : Fin 78) (75 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4201` (kalmanson). -/
theorem middleSource_h4201 :
    ((!((allOneRankAtom (sourceRanks P) 66 == allOneRankAtom (sourceRanks P) 65)) || ((allOneRankAtom (sourceRanks P) 10).ult (allOneRankAtom (sourceRanks P) 9)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (9 : Fin 78) (66 : Fin 78)
    (10 : Fin 78) (65 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (7 : Fin 13) (10 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (65 : Fin 78) (10 : Fin 78) (9 : Fin 78)
    (66 : Fin 78) (6 : Fin 78) (75 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4202` (kalmanson). -/
theorem middleSource_h4202 :
    ((!((allOneRankAtom (sourceRanks P) 9 == allOneRankAtom (sourceRanks P) 6)) || ((allOneRankAtom (sourceRanks P) 76).ult (allOneRankAtom (sourceRanks P) 67)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (67 : Fin 78) (9 : Fin 78)
    (76 : Fin 78) (6 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (7 : Fin 13) (10 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (65 : Fin 78) (11 : Fin 78) (9 : Fin 78)
    (67 : Fin 78) (6 : Fin 78) (76 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4203` (kalmanson). -/
theorem middleSource_h4203 :
    ((!((allOneRankAtom (sourceRanks P) 9 == allOneRankAtom (sourceRanks P) 76)) || ((allOneRankAtom (sourceRanks P) 6).ult (allOneRankAtom (sourceRanks P) 67)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (67 : Fin 78) (9 : Fin 78)
    (6 : Fin 78) (76 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (7 : Fin 13) (10 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (65 : Fin 78) (11 : Fin 78) (9 : Fin 78)
    (67 : Fin 78) (6 : Fin 78) (76 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4204` (kalmanson). -/
theorem middleSource_h4204 :
    ((!((allOneRankAtom (sourceRanks P) 9 == allOneRankAtom (sourceRanks P) 65)) || ((allOneRankAtom (sourceRanks P) 11).ult (allOneRankAtom (sourceRanks P) 67)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (67 : Fin 78) (9 : Fin 78)
    (11 : Fin 78) (65 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (7 : Fin 13) (10 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (65 : Fin 78) (11 : Fin 78) (9 : Fin 78)
    (67 : Fin 78) (6 : Fin 78) (76 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4205` (kalmanson). -/
theorem middleSource_h4205 :
    ((!((allOneRankAtom (sourceRanks P) 10 == allOneRankAtom (sourceRanks P) 6)) || ((allOneRankAtom (sourceRanks P) 77).ult (allOneRankAtom (sourceRanks P) 67)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (67 : Fin 78) (10 : Fin 78)
    (77 : Fin 78) (6 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (7 : Fin 13) (11 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (66 : Fin 78) (11 : Fin 78) (10 : Fin 78)
    (67 : Fin 78) (6 : Fin 78) (77 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4206` (kalmanson). -/
theorem middleSource_h4206 :
    ((!((allOneRankAtom (sourceRanks P) 10 == allOneRankAtom (sourceRanks P) 77)) || ((allOneRankAtom (sourceRanks P) 6).ult (allOneRankAtom (sourceRanks P) 67)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (67 : Fin 78) (10 : Fin 78)
    (6 : Fin 78) (77 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (7 : Fin 13) (11 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (66 : Fin 78) (11 : Fin 78) (10 : Fin 78)
    (67 : Fin 78) (6 : Fin 78) (77 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4207` (kalmanson). -/
theorem middleSource_h4207 :
    ((!((allOneRankAtom (sourceRanks P) 10 == allOneRankAtom (sourceRanks P) 66)) || ((allOneRankAtom (sourceRanks P) 11).ult (allOneRankAtom (sourceRanks P) 67)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (67 : Fin 78) (10 : Fin 78)
    (11 : Fin 78) (66 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (7 : Fin 13) (11 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (66 : Fin 78) (11 : Fin 78) (10 : Fin 78)
    (67 : Fin 78) (6 : Fin 78) (77 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4208` (kalmanson). -/
theorem middleSource_h4208 :
    ((!((allOneRankAtom (sourceRanks P) 67 == allOneRankAtom (sourceRanks P) 66)) || ((allOneRankAtom (sourceRanks P) 11).ult (allOneRankAtom (sourceRanks P) 10)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (10 : Fin 78) (67 : Fin 78)
    (11 : Fin 78) (66 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (7 : Fin 13) (11 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (66 : Fin 78) (11 : Fin 78) (10 : Fin 78)
    (67 : Fin 78) (6 : Fin 78) (77 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4209` (kalmanson). -/
theorem middleSource_h4209 :
    ((!((allOneRankAtom (sourceRanks P) 8 == allOneRankAtom (sourceRanks P) 7)) || ((allOneRankAtom (sourceRanks P) 72).ult (allOneRankAtom (sourceRanks P) 69)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (69 : Fin 78) (8 : Fin 78)
    (72 : Fin 78) (7 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (8 : Fin 13) (9 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (68 : Fin 78) (9 : Fin 78) (8 : Fin 78)
    (69 : Fin 78) (7 : Fin 78) (72 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4210` (kalmanson). -/
theorem middleSource_h4210 :
    ((!((allOneRankAtom (sourceRanks P) 8 == allOneRankAtom (sourceRanks P) 72)) || ((allOneRankAtom (sourceRanks P) 7).ult (allOneRankAtom (sourceRanks P) 69)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (69 : Fin 78) (8 : Fin 78)
    (7 : Fin 78) (72 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (8 : Fin 13) (9 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (68 : Fin 78) (9 : Fin 78) (8 : Fin 78)
    (69 : Fin 78) (7 : Fin 78) (72 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4211` (kalmanson). -/
theorem middleSource_h4211 :
    ((!((allOneRankAtom (sourceRanks P) 69 == allOneRankAtom (sourceRanks P) 72)) || ((allOneRankAtom (sourceRanks P) 7).ult (allOneRankAtom (sourceRanks P) 8)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (8 : Fin 78) (69 : Fin 78)
    (7 : Fin 78) (72 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (8 : Fin 13) (9 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (68 : Fin 78) (9 : Fin 78) (8 : Fin 78)
    (69 : Fin 78) (7 : Fin 78) (72 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4212` (kalmanson). -/
theorem middleSource_h4212 :
    ((!((allOneRankAtom (sourceRanks P) 8 == allOneRankAtom (sourceRanks P) 68)) || ((allOneRankAtom (sourceRanks P) 9).ult (allOneRankAtom (sourceRanks P) 69)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (69 : Fin 78) (8 : Fin 78)
    (9 : Fin 78) (68 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (8 : Fin 13) (9 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (68 : Fin 78) (9 : Fin 78) (8 : Fin 78)
    (69 : Fin 78) (7 : Fin 78) (72 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4213` (kalmanson). -/
theorem middleSource_h4213 :
    ((!((allOneRankAtom (sourceRanks P) 69 == allOneRankAtom (sourceRanks P) 9)) || ((allOneRankAtom (sourceRanks P) 68).ult (allOneRankAtom (sourceRanks P) 8)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (8 : Fin 78) (69 : Fin 78)
    (68 : Fin 78) (9 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (8 : Fin 13) (9 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (68 : Fin 78) (9 : Fin 78) (8 : Fin 78)
    (69 : Fin 78) (7 : Fin 78) (72 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4214` (kalmanson). -/
theorem middleSource_h4214 :
    ((!((allOneRankAtom (sourceRanks P) 69 == allOneRankAtom (sourceRanks P) 68)) || ((allOneRankAtom (sourceRanks P) 9).ult (allOneRankAtom (sourceRanks P) 8)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (8 : Fin 78) (69 : Fin 78)
    (9 : Fin 78) (68 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (8 : Fin 13) (9 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (68 : Fin 78) (9 : Fin 78) (8 : Fin 78)
    (69 : Fin 78) (7 : Fin 78) (72 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4215` (kalmanson). -/
theorem middleSource_h4215 :
    ((!((allOneRankAtom (sourceRanks P) 8 == allOneRankAtom (sourceRanks P) 73)) || ((allOneRankAtom (sourceRanks P) 7).ult (allOneRankAtom (sourceRanks P) 70)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (70 : Fin 78) (8 : Fin 78)
    (7 : Fin 78) (73 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (8 : Fin 13) (9 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (68 : Fin 78) (10 : Fin 78) (8 : Fin 78)
    (70 : Fin 78) (7 : Fin 78) (73 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4216` (kalmanson). -/
theorem middleSource_h4216 :
    ((!((allOneRankAtom (sourceRanks P) 70 == allOneRankAtom (sourceRanks P) 73)) || ((allOneRankAtom (sourceRanks P) 7).ult (allOneRankAtom (sourceRanks P) 8)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (8 : Fin 78) (70 : Fin 78)
    (7 : Fin 78) (73 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (8 : Fin 13) (9 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (68 : Fin 78) (10 : Fin 78) (8 : Fin 78)
    (70 : Fin 78) (7 : Fin 78) (73 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4217` (kalmanson). -/
theorem middleSource_h4217 :
    ((!((allOneRankAtom (sourceRanks P) 8 == allOneRankAtom (sourceRanks P) 68)) || ((allOneRankAtom (sourceRanks P) 10).ult (allOneRankAtom (sourceRanks P) 70)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (70 : Fin 78) (8 : Fin 78)
    (10 : Fin 78) (68 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (8 : Fin 13) (9 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (68 : Fin 78) (10 : Fin 78) (8 : Fin 78)
    (70 : Fin 78) (7 : Fin 78) (73 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4218` (kalmanson). -/
theorem middleSource_h4218 :
    ((!((allOneRankAtom (sourceRanks P) 70 == allOneRankAtom (sourceRanks P) 10)) || ((allOneRankAtom (sourceRanks P) 68).ult (allOneRankAtom (sourceRanks P) 8)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (8 : Fin 78) (70 : Fin 78)
    (68 : Fin 78) (10 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (8 : Fin 13) (9 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (68 : Fin 78) (10 : Fin 78) (8 : Fin 78)
    (70 : Fin 78) (7 : Fin 78) (73 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4219` (kalmanson). -/
theorem middleSource_h4219 :
    ((!((allOneRankAtom (sourceRanks P) 8 == allOneRankAtom (sourceRanks P) 74)) || ((allOneRankAtom (sourceRanks P) 7).ult (allOneRankAtom (sourceRanks P) 71)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (71 : Fin 78) (8 : Fin 78)
    (7 : Fin 78) (74 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (8 : Fin 13) (9 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (68 : Fin 78) (11 : Fin 78) (8 : Fin 78)
    (71 : Fin 78) (7 : Fin 78) (74 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4220` (kalmanson). -/
theorem middleSource_h4220 :
    ((!((allOneRankAtom (sourceRanks P) 8 == allOneRankAtom (sourceRanks P) 11)) || ((allOneRankAtom (sourceRanks P) 68).ult (allOneRankAtom (sourceRanks P) 71)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (71 : Fin 78) (8 : Fin 78)
    (68 : Fin 78) (11 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (8 : Fin 13) (9 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (68 : Fin 78) (11 : Fin 78) (8 : Fin 78)
    (71 : Fin 78) (7 : Fin 78) (74 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4221` (kalmanson). -/
theorem middleSource_h4221 :
    ((!((allOneRankAtom (sourceRanks P) 8 == allOneRankAtom (sourceRanks P) 68)) || ((allOneRankAtom (sourceRanks P) 11).ult (allOneRankAtom (sourceRanks P) 71)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (71 : Fin 78) (8 : Fin 78)
    (11 : Fin 78) (68 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (8 : Fin 13) (9 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (68 : Fin 78) (11 : Fin 78) (8 : Fin 78)
    (71 : Fin 78) (7 : Fin 78) (74 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4222` (kalmanson). -/
theorem middleSource_h4222 :
    ((!((allOneRankAtom (sourceRanks P) 71 == allOneRankAtom (sourceRanks P) 68)) || ((allOneRankAtom (sourceRanks P) 11).ult (allOneRankAtom (sourceRanks P) 8)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (8 : Fin 78) (71 : Fin 78)
    (11 : Fin 78) (68 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (8 : Fin 13) (9 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (68 : Fin 78) (11 : Fin 78) (8 : Fin 78)
    (71 : Fin 78) (7 : Fin 78) (74 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4223` (kalmanson). -/
theorem middleSource_h4223 :
    ((!((allOneRankAtom (sourceRanks P) 9 == allOneRankAtom (sourceRanks P) 7)) || ((allOneRankAtom (sourceRanks P) 75).ult (allOneRankAtom (sourceRanks P) 70)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (70 : Fin 78) (9 : Fin 78)
    (75 : Fin 78) (7 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (8 : Fin 13) (10 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (69 : Fin 78) (10 : Fin 78) (9 : Fin 78)
    (70 : Fin 78) (7 : Fin 78) (75 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

end

end ATailExactFiveCard13AllOneSourceIngressScratch
end Problem97
