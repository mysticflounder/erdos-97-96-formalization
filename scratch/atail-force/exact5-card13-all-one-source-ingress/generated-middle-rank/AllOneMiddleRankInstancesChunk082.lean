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

/-- Candidate middle source assertion `h5248` (kalmanson). -/
theorem middleSource_h5248 :
    ((!((allOneRankAtom (sourceRanks P) 24 == allOneRankAtom (sourceRanks P) 25)) || ((allOneRankAtom (sourceRanks P) 33).ult (allOneRankAtom (sourceRanks P) 34)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (34 : Fin 78) (24 : Fin 78)
    (33 : Fin 78) (25 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (4 : Fin 13) (5 : Fin 13)
    (by decide) (by decide) (by decide)
    (33 : Fin 78) (25 : Fin 78) (24 : Fin 78)
    (34 : Fin 78) (23 : Fin 78) (42 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5249` (kalmanson). -/
theorem middleSource_h5249 :
    ((!((allOneRankAtom (sourceRanks P) 34 == allOneRankAtom (sourceRanks P) 33)) || ((allOneRankAtom (sourceRanks P) 25).ult (allOneRankAtom (sourceRanks P) 24)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (24 : Fin 78) (34 : Fin 78)
    (25 : Fin 78) (33 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (4 : Fin 13) (5 : Fin 13)
    (by decide) (by decide) (by decide)
    (33 : Fin 78) (25 : Fin 78) (24 : Fin 78)
    (34 : Fin 78) (23 : Fin 78) (42 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5250` (kalmanson). -/
theorem middleSource_h5250 :
    ((!((allOneRankAtom (sourceRanks P) 24 == allOneRankAtom (sourceRanks P) 23)) || ((allOneRankAtom (sourceRanks P) 43).ult (allOneRankAtom (sourceRanks P) 35)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (35 : Fin 78) (24 : Fin 78)
    (43 : Fin 78) (23 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (4 : Fin 13) (6 : Fin 13)
    (by decide) (by decide) (by decide)
    (33 : Fin 78) (26 : Fin 78) (24 : Fin 78)
    (35 : Fin 78) (23 : Fin 78) (43 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5251` (kalmanson). -/
theorem middleSource_h5251 :
    ((!((allOneRankAtom (sourceRanks P) 35 == allOneRankAtom (sourceRanks P) 43)) || ((allOneRankAtom (sourceRanks P) 23).ult (allOneRankAtom (sourceRanks P) 24)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (24 : Fin 78) (35 : Fin 78)
    (23 : Fin 78) (43 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (4 : Fin 13) (6 : Fin 13)
    (by decide) (by decide) (by decide)
    (33 : Fin 78) (26 : Fin 78) (24 : Fin 78)
    (35 : Fin 78) (23 : Fin 78) (43 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5252` (kalmanson). -/
theorem middleSource_h5252 :
    ((!((allOneRankAtom (sourceRanks P) 24 == allOneRankAtom (sourceRanks P) 26)) || ((allOneRankAtom (sourceRanks P) 33).ult (allOneRankAtom (sourceRanks P) 35)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (35 : Fin 78) (24 : Fin 78)
    (33 : Fin 78) (26 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (4 : Fin 13) (6 : Fin 13)
    (by decide) (by decide) (by decide)
    (33 : Fin 78) (26 : Fin 78) (24 : Fin 78)
    (35 : Fin 78) (23 : Fin 78) (43 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5253` (kalmanson). -/
theorem middleSource_h5253 :
    ((!((allOneRankAtom (sourceRanks P) 24 == allOneRankAtom (sourceRanks P) 23)) || ((allOneRankAtom (sourceRanks P) 44).ult (allOneRankAtom (sourceRanks P) 36)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (36 : Fin 78) (24 : Fin 78)
    (44 : Fin 78) (23 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (4 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (33 : Fin 78) (27 : Fin 78) (24 : Fin 78)
    (36 : Fin 78) (23 : Fin 78) (44 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5254` (kalmanson). -/
theorem middleSource_h5254 :
    ((!((allOneRankAtom (sourceRanks P) 36 == allOneRankAtom (sourceRanks P) 44)) || ((allOneRankAtom (sourceRanks P) 23).ult (allOneRankAtom (sourceRanks P) 24)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (24 : Fin 78) (36 : Fin 78)
    (23 : Fin 78) (44 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (4 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (33 : Fin 78) (27 : Fin 78) (24 : Fin 78)
    (36 : Fin 78) (23 : Fin 78) (44 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5255` (kalmanson). -/
theorem middleSource_h5255 :
    ((!((allOneRankAtom (sourceRanks P) 24 == allOneRankAtom (sourceRanks P) 27)) || ((allOneRankAtom (sourceRanks P) 33).ult (allOneRankAtom (sourceRanks P) 36)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (36 : Fin 78) (24 : Fin 78)
    (33 : Fin 78) (27 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (4 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (33 : Fin 78) (27 : Fin 78) (24 : Fin 78)
    (36 : Fin 78) (23 : Fin 78) (44 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5256` (kalmanson). -/
theorem middleSource_h5256 :
    ((!((allOneRankAtom (sourceRanks P) 36 == allOneRankAtom (sourceRanks P) 33)) || ((allOneRankAtom (sourceRanks P) 27).ult (allOneRankAtom (sourceRanks P) 24)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (24 : Fin 78) (36 : Fin 78)
    (27 : Fin 78) (33 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (4 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (33 : Fin 78) (27 : Fin 78) (24 : Fin 78)
    (36 : Fin 78) (23 : Fin 78) (44 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5257` (kalmanson). -/
theorem middleSource_h5257 :
    ((!((allOneRankAtom (sourceRanks P) 24 == allOneRankAtom (sourceRanks P) 23)) || ((allOneRankAtom (sourceRanks P) 45).ult (allOneRankAtom (sourceRanks P) 37)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (37 : Fin 78) (24 : Fin 78)
    (45 : Fin 78) (23 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (4 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (33 : Fin 78) (28 : Fin 78) (24 : Fin 78)
    (37 : Fin 78) (23 : Fin 78) (45 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5258` (kalmanson). -/
theorem middleSource_h5258 :
    ((!((allOneRankAtom (sourceRanks P) 37 == allOneRankAtom (sourceRanks P) 23)) || ((allOneRankAtom (sourceRanks P) 45).ult (allOneRankAtom (sourceRanks P) 24)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (24 : Fin 78) (37 : Fin 78)
    (45 : Fin 78) (23 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (4 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (33 : Fin 78) (28 : Fin 78) (24 : Fin 78)
    (37 : Fin 78) (23 : Fin 78) (45 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5259` (kalmanson). -/
theorem middleSource_h5259 :
    ((!((allOneRankAtom (sourceRanks P) 37 == allOneRankAtom (sourceRanks P) 45)) || ((allOneRankAtom (sourceRanks P) 23).ult (allOneRankAtom (sourceRanks P) 24)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (24 : Fin 78) (37 : Fin 78)
    (23 : Fin 78) (45 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (4 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (33 : Fin 78) (28 : Fin 78) (24 : Fin 78)
    (37 : Fin 78) (23 : Fin 78) (45 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5260` (kalmanson). -/
theorem middleSource_h5260 :
    ((!((allOneRankAtom (sourceRanks P) 24 == allOneRankAtom (sourceRanks P) 33)) || ((allOneRankAtom (sourceRanks P) 28).ult (allOneRankAtom (sourceRanks P) 37)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (37 : Fin 78) (24 : Fin 78)
    (28 : Fin 78) (33 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (4 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (33 : Fin 78) (28 : Fin 78) (24 : Fin 78)
    (37 : Fin 78) (23 : Fin 78) (45 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5261` (kalmanson). -/
theorem middleSource_h5261 :
    ((!((allOneRankAtom (sourceRanks P) 37 == allOneRankAtom (sourceRanks P) 28)) || ((allOneRankAtom (sourceRanks P) 33).ult (allOneRankAtom (sourceRanks P) 24)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (24 : Fin 78) (37 : Fin 78)
    (33 : Fin 78) (28 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (4 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (33 : Fin 78) (28 : Fin 78) (24 : Fin 78)
    (37 : Fin 78) (23 : Fin 78) (45 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5262` (kalmanson). -/
theorem middleSource_h5262 :
    ((!((allOneRankAtom (sourceRanks P) 24 == allOneRankAtom (sourceRanks P) 23)) || ((allOneRankAtom (sourceRanks P) 46).ult (allOneRankAtom (sourceRanks P) 38)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (38 : Fin 78) (24 : Fin 78)
    (46 : Fin 78) (23 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (4 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (33 : Fin 78) (29 : Fin 78) (24 : Fin 78)
    (38 : Fin 78) (23 : Fin 78) (46 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5263` (kalmanson). -/
theorem middleSource_h5263 :
    ((!((allOneRankAtom (sourceRanks P) 24 == allOneRankAtom (sourceRanks P) 46)) || ((allOneRankAtom (sourceRanks P) 23).ult (allOneRankAtom (sourceRanks P) 38)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (38 : Fin 78) (24 : Fin 78)
    (23 : Fin 78) (46 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (4 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (33 : Fin 78) (29 : Fin 78) (24 : Fin 78)
    (38 : Fin 78) (23 : Fin 78) (46 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5264` (kalmanson). -/
theorem middleSource_h5264 :
    ((!((allOneRankAtom (sourceRanks P) 38 == allOneRankAtom (sourceRanks P) 23)) || ((allOneRankAtom (sourceRanks P) 46).ult (allOneRankAtom (sourceRanks P) 24)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (24 : Fin 78) (38 : Fin 78)
    (46 : Fin 78) (23 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (4 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (33 : Fin 78) (29 : Fin 78) (24 : Fin 78)
    (38 : Fin 78) (23 : Fin 78) (46 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5265` (kalmanson). -/
theorem middleSource_h5265 :
    ((!((allOneRankAtom (sourceRanks P) 38 == allOneRankAtom (sourceRanks P) 46)) || ((allOneRankAtom (sourceRanks P) 23).ult (allOneRankAtom (sourceRanks P) 24)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (24 : Fin 78) (38 : Fin 78)
    (23 : Fin 78) (46 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (4 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (33 : Fin 78) (29 : Fin 78) (24 : Fin 78)
    (38 : Fin 78) (23 : Fin 78) (46 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5266` (kalmanson). -/
theorem middleSource_h5266 :
    ((!((allOneRankAtom (sourceRanks P) 24 == allOneRankAtom (sourceRanks P) 29)) || ((allOneRankAtom (sourceRanks P) 33).ult (allOneRankAtom (sourceRanks P) 38)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (38 : Fin 78) (24 : Fin 78)
    (33 : Fin 78) (29 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (4 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (33 : Fin 78) (29 : Fin 78) (24 : Fin 78)
    (38 : Fin 78) (23 : Fin 78) (46 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5267` (kalmanson). -/
theorem middleSource_h5267 :
    ((!((allOneRankAtom (sourceRanks P) 38 == allOneRankAtom (sourceRanks P) 33)) || ((allOneRankAtom (sourceRanks P) 29).ult (allOneRankAtom (sourceRanks P) 24)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (24 : Fin 78) (38 : Fin 78)
    (29 : Fin 78) (33 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (4 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (33 : Fin 78) (29 : Fin 78) (24 : Fin 78)
    (38 : Fin 78) (23 : Fin 78) (46 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5268` (kalmanson). -/
theorem middleSource_h5268 :
    ((!((allOneRankAtom (sourceRanks P) 24 == allOneRankAtom (sourceRanks P) 23)) || ((allOneRankAtom (sourceRanks P) 47).ult (allOneRankAtom (sourceRanks P) 39)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (39 : Fin 78) (24 : Fin 78)
    (47 : Fin 78) (23 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (4 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (33 : Fin 78) (30 : Fin 78) (24 : Fin 78)
    (39 : Fin 78) (23 : Fin 78) (47 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5269` (kalmanson). -/
theorem middleSource_h5269 :
    ((!((allOneRankAtom (sourceRanks P) 24 == allOneRankAtom (sourceRanks P) 47)) || ((allOneRankAtom (sourceRanks P) 23).ult (allOneRankAtom (sourceRanks P) 39)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (39 : Fin 78) (24 : Fin 78)
    (23 : Fin 78) (47 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (4 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (33 : Fin 78) (30 : Fin 78) (24 : Fin 78)
    (39 : Fin 78) (23 : Fin 78) (47 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5270` (kalmanson). -/
theorem middleSource_h5270 :
    ((!((allOneRankAtom (sourceRanks P) 39 == allOneRankAtom (sourceRanks P) 23)) || ((allOneRankAtom (sourceRanks P) 47).ult (allOneRankAtom (sourceRanks P) 24)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (24 : Fin 78) (39 : Fin 78)
    (47 : Fin 78) (23 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (4 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (33 : Fin 78) (30 : Fin 78) (24 : Fin 78)
    (39 : Fin 78) (23 : Fin 78) (47 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5271` (kalmanson). -/
theorem middleSource_h5271 :
    ((!((allOneRankAtom (sourceRanks P) 39 == allOneRankAtom (sourceRanks P) 47)) || ((allOneRankAtom (sourceRanks P) 23).ult (allOneRankAtom (sourceRanks P) 24)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (24 : Fin 78) (39 : Fin 78)
    (23 : Fin 78) (47 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (4 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (33 : Fin 78) (30 : Fin 78) (24 : Fin 78)
    (39 : Fin 78) (23 : Fin 78) (47 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5272` (kalmanson). -/
theorem middleSource_h5272 :
    ((!((allOneRankAtom (sourceRanks P) 24 == allOneRankAtom (sourceRanks P) 30)) || ((allOneRankAtom (sourceRanks P) 33).ult (allOneRankAtom (sourceRanks P) 39)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (39 : Fin 78) (24 : Fin 78)
    (33 : Fin 78) (30 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (4 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (33 : Fin 78) (30 : Fin 78) (24 : Fin 78)
    (39 : Fin 78) (23 : Fin 78) (47 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5273` (kalmanson). -/
theorem middleSource_h5273 :
    ((!((allOneRankAtom (sourceRanks P) 24 == allOneRankAtom (sourceRanks P) 23)) || ((allOneRankAtom (sourceRanks P) 48).ult (allOneRankAtom (sourceRanks P) 40)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (40 : Fin 78) (24 : Fin 78)
    (48 : Fin 78) (23 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (4 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (33 : Fin 78) (31 : Fin 78) (24 : Fin 78)
    (40 : Fin 78) (23 : Fin 78) (48 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5274` (kalmanson). -/
theorem middleSource_h5274 :
    ((!((allOneRankAtom (sourceRanks P) 24 == allOneRankAtom (sourceRanks P) 48)) || ((allOneRankAtom (sourceRanks P) 23).ult (allOneRankAtom (sourceRanks P) 40)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (40 : Fin 78) (24 : Fin 78)
    (23 : Fin 78) (48 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (4 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (33 : Fin 78) (31 : Fin 78) (24 : Fin 78)
    (40 : Fin 78) (23 : Fin 78) (48 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5275` (kalmanson). -/
theorem middleSource_h5275 :
    ((!((allOneRankAtom (sourceRanks P) 40 == allOneRankAtom (sourceRanks P) 23)) || ((allOneRankAtom (sourceRanks P) 48).ult (allOneRankAtom (sourceRanks P) 24)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (24 : Fin 78) (40 : Fin 78)
    (48 : Fin 78) (23 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (4 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (33 : Fin 78) (31 : Fin 78) (24 : Fin 78)
    (40 : Fin 78) (23 : Fin 78) (48 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5276` (kalmanson). -/
theorem middleSource_h5276 :
    ((!((allOneRankAtom (sourceRanks P) 40 == allOneRankAtom (sourceRanks P) 48)) || ((allOneRankAtom (sourceRanks P) 23).ult (allOneRankAtom (sourceRanks P) 24)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (24 : Fin 78) (40 : Fin 78)
    (23 : Fin 78) (48 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (4 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (33 : Fin 78) (31 : Fin 78) (24 : Fin 78)
    (40 : Fin 78) (23 : Fin 78) (48 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5277` (kalmanson). -/
theorem middleSource_h5277 :
    ((!((allOneRankAtom (sourceRanks P) 24 == allOneRankAtom (sourceRanks P) 31)) || ((allOneRankAtom (sourceRanks P) 33).ult (allOneRankAtom (sourceRanks P) 40)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (40 : Fin 78) (24 : Fin 78)
    (33 : Fin 78) (31 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (4 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (33 : Fin 78) (31 : Fin 78) (24 : Fin 78)
    (40 : Fin 78) (23 : Fin 78) (48 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5278` (kalmanson). -/
theorem middleSource_h5278 :
    ((!((allOneRankAtom (sourceRanks P) 24 == allOneRankAtom (sourceRanks P) 23)) || ((allOneRankAtom (sourceRanks P) 49).ult (allOneRankAtom (sourceRanks P) 41)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (41 : Fin 78) (24 : Fin 78)
    (49 : Fin 78) (23 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (4 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (33 : Fin 78) (32 : Fin 78) (24 : Fin 78)
    (41 : Fin 78) (23 : Fin 78) (49 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5279` (kalmanson). -/
theorem middleSource_h5279 :
    ((!((allOneRankAtom (sourceRanks P) 24 == allOneRankAtom (sourceRanks P) 49)) || ((allOneRankAtom (sourceRanks P) 23).ult (allOneRankAtom (sourceRanks P) 41)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (41 : Fin 78) (24 : Fin 78)
    (23 : Fin 78) (49 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (4 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (33 : Fin 78) (32 : Fin 78) (24 : Fin 78)
    (41 : Fin 78) (23 : Fin 78) (49 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5280` (kalmanson). -/
theorem middleSource_h5280 :
    ((!((allOneRankAtom (sourceRanks P) 24 == allOneRankAtom (sourceRanks P) 32)) || ((allOneRankAtom (sourceRanks P) 33).ult (allOneRankAtom (sourceRanks P) 41)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (41 : Fin 78) (24 : Fin 78)
    (33 : Fin 78) (32 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (4 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (33 : Fin 78) (32 : Fin 78) (24 : Fin 78)
    (41 : Fin 78) (23 : Fin 78) (49 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5281` (kalmanson). -/
theorem middleSource_h5281 :
    ((!((allOneRankAtom (sourceRanks P) 25 == allOneRankAtom (sourceRanks P) 23)) || ((allOneRankAtom (sourceRanks P) 50).ult (allOneRankAtom (sourceRanks P) 35)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (35 : Fin 78) (25 : Fin 78)
    (50 : Fin 78) (23 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (5 : Fin 13) (6 : Fin 13)
    (by decide) (by decide) (by decide)
    (34 : Fin 78) (26 : Fin 78) (25 : Fin 78)
    (35 : Fin 78) (23 : Fin 78) (50 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5282` (kalmanson). -/
theorem middleSource_h5282 :
    ((!((allOneRankAtom (sourceRanks P) 35 == allOneRankAtom (sourceRanks P) 50)) || ((allOneRankAtom (sourceRanks P) 23).ult (allOneRankAtom (sourceRanks P) 25)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (25 : Fin 78) (35 : Fin 78)
    (23 : Fin 78) (50 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (5 : Fin 13) (6 : Fin 13)
    (by decide) (by decide) (by decide)
    (34 : Fin 78) (26 : Fin 78) (25 : Fin 78)
    (35 : Fin 78) (23 : Fin 78) (50 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5283` (kalmanson). -/
theorem middleSource_h5283 :
    ((!((allOneRankAtom (sourceRanks P) 25 == allOneRankAtom (sourceRanks P) 26)) || ((allOneRankAtom (sourceRanks P) 34).ult (allOneRankAtom (sourceRanks P) 35)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (35 : Fin 78) (25 : Fin 78)
    (34 : Fin 78) (26 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (5 : Fin 13) (6 : Fin 13)
    (by decide) (by decide) (by decide)
    (34 : Fin 78) (26 : Fin 78) (25 : Fin 78)
    (35 : Fin 78) (23 : Fin 78) (50 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5284` (kalmanson). -/
theorem middleSource_h5284 :
    ((!((allOneRankAtom (sourceRanks P) 25 == allOneRankAtom (sourceRanks P) 23)) || ((allOneRankAtom (sourceRanks P) 51).ult (allOneRankAtom (sourceRanks P) 36)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (36 : Fin 78) (25 : Fin 78)
    (51 : Fin 78) (23 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (5 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (34 : Fin 78) (27 : Fin 78) (25 : Fin 78)
    (36 : Fin 78) (23 : Fin 78) (51 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5285` (kalmanson). -/
theorem middleSource_h5285 :
    ((!((allOneRankAtom (sourceRanks P) 25 == allOneRankAtom (sourceRanks P) 51)) || ((allOneRankAtom (sourceRanks P) 23).ult (allOneRankAtom (sourceRanks P) 36)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (36 : Fin 78) (25 : Fin 78)
    (23 : Fin 78) (51 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (5 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (34 : Fin 78) (27 : Fin 78) (25 : Fin 78)
    (36 : Fin 78) (23 : Fin 78) (51 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5286` (kalmanson). -/
theorem middleSource_h5286 :
    ((!((allOneRankAtom (sourceRanks P) 25 == allOneRankAtom (sourceRanks P) 27)) || ((allOneRankAtom (sourceRanks P) 34).ult (allOneRankAtom (sourceRanks P) 36)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (36 : Fin 78) (25 : Fin 78)
    (34 : Fin 78) (27 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (5 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (34 : Fin 78) (27 : Fin 78) (25 : Fin 78)
    (36 : Fin 78) (23 : Fin 78) (51 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5287` (kalmanson). -/
theorem middleSource_h5287 :
    ((!((allOneRankAtom (sourceRanks P) 36 == allOneRankAtom (sourceRanks P) 34)) || ((allOneRankAtom (sourceRanks P) 27).ult (allOneRankAtom (sourceRanks P) 25)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (25 : Fin 78) (36 : Fin 78)
    (27 : Fin 78) (34 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (5 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (34 : Fin 78) (27 : Fin 78) (25 : Fin 78)
    (36 : Fin 78) (23 : Fin 78) (51 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5288` (kalmanson). -/
theorem middleSource_h5288 :
    ((!((allOneRankAtom (sourceRanks P) 25 == allOneRankAtom (sourceRanks P) 23)) || ((allOneRankAtom (sourceRanks P) 52).ult (allOneRankAtom (sourceRanks P) 37)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (37 : Fin 78) (25 : Fin 78)
    (52 : Fin 78) (23 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (5 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (34 : Fin 78) (28 : Fin 78) (25 : Fin 78)
    (37 : Fin 78) (23 : Fin 78) (52 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5289` (kalmanson). -/
theorem middleSource_h5289 :
    ((!((allOneRankAtom (sourceRanks P) 25 == allOneRankAtom (sourceRanks P) 52)) || ((allOneRankAtom (sourceRanks P) 23).ult (allOneRankAtom (sourceRanks P) 37)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (37 : Fin 78) (25 : Fin 78)
    (23 : Fin 78) (52 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (5 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (34 : Fin 78) (28 : Fin 78) (25 : Fin 78)
    (37 : Fin 78) (23 : Fin 78) (52 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5290` (kalmanson). -/
theorem middleSource_h5290 :
    ((!((allOneRankAtom (sourceRanks P) 37 == allOneRankAtom (sourceRanks P) 23)) || ((allOneRankAtom (sourceRanks P) 52).ult (allOneRankAtom (sourceRanks P) 25)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (25 : Fin 78) (37 : Fin 78)
    (52 : Fin 78) (23 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (5 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (34 : Fin 78) (28 : Fin 78) (25 : Fin 78)
    (37 : Fin 78) (23 : Fin 78) (52 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5291` (kalmanson). -/
theorem middleSource_h5291 :
    ((!((allOneRankAtom (sourceRanks P) 37 == allOneRankAtom (sourceRanks P) 52)) || ((allOneRankAtom (sourceRanks P) 23).ult (allOneRankAtom (sourceRanks P) 25)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (25 : Fin 78) (37 : Fin 78)
    (23 : Fin 78) (52 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (5 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (34 : Fin 78) (28 : Fin 78) (25 : Fin 78)
    (37 : Fin 78) (23 : Fin 78) (52 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5292` (kalmanson). -/
theorem middleSource_h5292 :
    ((!((allOneRankAtom (sourceRanks P) 25 == allOneRankAtom (sourceRanks P) 28)) || ((allOneRankAtom (sourceRanks P) 34).ult (allOneRankAtom (sourceRanks P) 37)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (37 : Fin 78) (25 : Fin 78)
    (34 : Fin 78) (28 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (5 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (34 : Fin 78) (28 : Fin 78) (25 : Fin 78)
    (37 : Fin 78) (23 : Fin 78) (52 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5293` (kalmanson). -/
theorem middleSource_h5293 :
    ((!((allOneRankAtom (sourceRanks P) 25 == allOneRankAtom (sourceRanks P) 34)) || ((allOneRankAtom (sourceRanks P) 28).ult (allOneRankAtom (sourceRanks P) 37)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (37 : Fin 78) (25 : Fin 78)
    (28 : Fin 78) (34 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (5 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (34 : Fin 78) (28 : Fin 78) (25 : Fin 78)
    (37 : Fin 78) (23 : Fin 78) (52 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5294` (kalmanson). -/
theorem middleSource_h5294 :
    ((!((allOneRankAtom (sourceRanks P) 37 == allOneRankAtom (sourceRanks P) 28)) || ((allOneRankAtom (sourceRanks P) 34).ult (allOneRankAtom (sourceRanks P) 25)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (25 : Fin 78) (37 : Fin 78)
    (34 : Fin 78) (28 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (5 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (34 : Fin 78) (28 : Fin 78) (25 : Fin 78)
    (37 : Fin 78) (23 : Fin 78) (52 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5295` (kalmanson). -/
theorem middleSource_h5295 :
    ((!((allOneRankAtom (sourceRanks P) 37 == allOneRankAtom (sourceRanks P) 34)) || ((allOneRankAtom (sourceRanks P) 28).ult (allOneRankAtom (sourceRanks P) 25)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (25 : Fin 78) (37 : Fin 78)
    (28 : Fin 78) (34 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (5 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (34 : Fin 78) (28 : Fin 78) (25 : Fin 78)
    (37 : Fin 78) (23 : Fin 78) (52 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5296` (kalmanson). -/
theorem middleSource_h5296 :
    ((!((allOneRankAtom (sourceRanks P) 25 == allOneRankAtom (sourceRanks P) 23)) || ((allOneRankAtom (sourceRanks P) 53).ult (allOneRankAtom (sourceRanks P) 38)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (38 : Fin 78) (25 : Fin 78)
    (53 : Fin 78) (23 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (5 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (34 : Fin 78) (29 : Fin 78) (25 : Fin 78)
    (38 : Fin 78) (23 : Fin 78) (53 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5297` (kalmanson). -/
theorem middleSource_h5297 :
    ((!((allOneRankAtom (sourceRanks P) 25 == allOneRankAtom (sourceRanks P) 53)) || ((allOneRankAtom (sourceRanks P) 23).ult (allOneRankAtom (sourceRanks P) 38)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (38 : Fin 78) (25 : Fin 78)
    (23 : Fin 78) (53 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (5 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (34 : Fin 78) (29 : Fin 78) (25 : Fin 78)
    (38 : Fin 78) (23 : Fin 78) (53 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5298` (kalmanson). -/
theorem middleSource_h5298 :
    ((!((allOneRankAtom (sourceRanks P) 25 == allOneRankAtom (sourceRanks P) 29)) || ((allOneRankAtom (sourceRanks P) 34).ult (allOneRankAtom (sourceRanks P) 38)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (38 : Fin 78) (25 : Fin 78)
    (34 : Fin 78) (29 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (5 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (34 : Fin 78) (29 : Fin 78) (25 : Fin 78)
    (38 : Fin 78) (23 : Fin 78) (53 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5299` (kalmanson). -/
theorem middleSource_h5299 :
    ((!((allOneRankAtom (sourceRanks P) 25 == allOneRankAtom (sourceRanks P) 23)) || ((allOneRankAtom (sourceRanks P) 54).ult (allOneRankAtom (sourceRanks P) 39)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (39 : Fin 78) (25 : Fin 78)
    (54 : Fin 78) (23 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (5 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (34 : Fin 78) (30 : Fin 78) (25 : Fin 78)
    (39 : Fin 78) (23 : Fin 78) (54 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5300` (kalmanson). -/
theorem middleSource_h5300 :
    ((!((allOneRankAtom (sourceRanks P) 25 == allOneRankAtom (sourceRanks P) 54)) || ((allOneRankAtom (sourceRanks P) 23).ult (allOneRankAtom (sourceRanks P) 39)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (39 : Fin 78) (25 : Fin 78)
    (23 : Fin 78) (54 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (5 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (34 : Fin 78) (30 : Fin 78) (25 : Fin 78)
    (39 : Fin 78) (23 : Fin 78) (54 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5301` (kalmanson). -/
theorem middleSource_h5301 :
    ((!((allOneRankAtom (sourceRanks P) 25 == allOneRankAtom (sourceRanks P) 30)) || ((allOneRankAtom (sourceRanks P) 34).ult (allOneRankAtom (sourceRanks P) 39)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (39 : Fin 78) (25 : Fin 78)
    (34 : Fin 78) (30 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (5 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (34 : Fin 78) (30 : Fin 78) (25 : Fin 78)
    (39 : Fin 78) (23 : Fin 78) (54 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5302` (kalmanson). -/
theorem middleSource_h5302 :
    ((!((allOneRankAtom (sourceRanks P) 25 == allOneRankAtom (sourceRanks P) 23)) || ((allOneRankAtom (sourceRanks P) 55).ult (allOneRankAtom (sourceRanks P) 40)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (40 : Fin 78) (25 : Fin 78)
    (55 : Fin 78) (23 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (5 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (34 : Fin 78) (31 : Fin 78) (25 : Fin 78)
    (40 : Fin 78) (23 : Fin 78) (55 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5303` (kalmanson). -/
theorem middleSource_h5303 :
    ((!((allOneRankAtom (sourceRanks P) 25 == allOneRankAtom (sourceRanks P) 55)) || ((allOneRankAtom (sourceRanks P) 23).ult (allOneRankAtom (sourceRanks P) 40)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (40 : Fin 78) (25 : Fin 78)
    (23 : Fin 78) (55 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (5 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (34 : Fin 78) (31 : Fin 78) (25 : Fin 78)
    (40 : Fin 78) (23 : Fin 78) (55 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5304` (kalmanson). -/
theorem middleSource_h5304 :
    ((!((allOneRankAtom (sourceRanks P) 40 == allOneRankAtom (sourceRanks P) 55)) || ((allOneRankAtom (sourceRanks P) 23).ult (allOneRankAtom (sourceRanks P) 25)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (25 : Fin 78) (40 : Fin 78)
    (23 : Fin 78) (55 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (5 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (34 : Fin 78) (31 : Fin 78) (25 : Fin 78)
    (40 : Fin 78) (23 : Fin 78) (55 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5305` (kalmanson). -/
theorem middleSource_h5305 :
    ((!((allOneRankAtom (sourceRanks P) 25 == allOneRankAtom (sourceRanks P) 31)) || ((allOneRankAtom (sourceRanks P) 34).ult (allOneRankAtom (sourceRanks P) 40)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (40 : Fin 78) (25 : Fin 78)
    (34 : Fin 78) (31 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (5 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (34 : Fin 78) (31 : Fin 78) (25 : Fin 78)
    (40 : Fin 78) (23 : Fin 78) (55 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5306` (kalmanson). -/
theorem middleSource_h5306 :
    ((!((allOneRankAtom (sourceRanks P) 25 == allOneRankAtom (sourceRanks P) 23)) || ((allOneRankAtom (sourceRanks P) 56).ult (allOneRankAtom (sourceRanks P) 41)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (41 : Fin 78) (25 : Fin 78)
    (56 : Fin 78) (23 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (5 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (34 : Fin 78) (32 : Fin 78) (25 : Fin 78)
    (41 : Fin 78) (23 : Fin 78) (56 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5307` (kalmanson). -/
theorem middleSource_h5307 :
    ((!((allOneRankAtom (sourceRanks P) 25 == allOneRankAtom (sourceRanks P) 56)) || ((allOneRankAtom (sourceRanks P) 23).ult (allOneRankAtom (sourceRanks P) 41)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (41 : Fin 78) (25 : Fin 78)
    (23 : Fin 78) (56 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (5 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (34 : Fin 78) (32 : Fin 78) (25 : Fin 78)
    (41 : Fin 78) (23 : Fin 78) (56 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5308` (kalmanson). -/
theorem middleSource_h5308 :
    ((!((allOneRankAtom (sourceRanks P) 25 == allOneRankAtom (sourceRanks P) 32)) || ((allOneRankAtom (sourceRanks P) 34).ult (allOneRankAtom (sourceRanks P) 41)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (41 : Fin 78) (25 : Fin 78)
    (34 : Fin 78) (32 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (5 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (34 : Fin 78) (32 : Fin 78) (25 : Fin 78)
    (41 : Fin 78) (23 : Fin 78) (56 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h5309` (kalmanson). -/
theorem middleSource_h5309 :
    ((!((allOneRankAtom (sourceRanks P) 26 == allOneRankAtom (sourceRanks P) 23)) || ((allOneRankAtom (sourceRanks P) 57).ult (allOneRankAtom (sourceRanks P) 36)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (36 : Fin 78) (26 : Fin 78)
    (57 : Fin 78) (23 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (6 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (35 : Fin 78) (27 : Fin 78) (26 : Fin 78)
    (36 : Fin 78) (23 : Fin 78) (57 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5310` (kalmanson). -/
theorem middleSource_h5310 :
    ((!((allOneRankAtom (sourceRanks P) 26 == allOneRankAtom (sourceRanks P) 57)) || ((allOneRankAtom (sourceRanks P) 23).ult (allOneRankAtom (sourceRanks P) 36)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (36 : Fin 78) (26 : Fin 78)
    (23 : Fin 78) (57 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (6 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (35 : Fin 78) (27 : Fin 78) (26 : Fin 78)
    (36 : Fin 78) (23 : Fin 78) (57 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h5311` (kalmanson). -/
theorem middleSource_h5311 :
    ((!((allOneRankAtom (sourceRanks P) 26 == allOneRankAtom (sourceRanks P) 27)) || ((allOneRankAtom (sourceRanks P) 35).ult (allOneRankAtom (sourceRanks P) 36)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (36 : Fin 78) (26 : Fin 78)
    (35 : Fin 78) (27 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (2 : Fin 13) (3 : Fin 13) (6 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (35 : Fin 78) (27 : Fin 78) (26 : Fin 78)
    (36 : Fin 78) (23 : Fin 78) (57 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

end

end ATailExactFiveCard13AllOneSourceIngressScratch
end Problem97
