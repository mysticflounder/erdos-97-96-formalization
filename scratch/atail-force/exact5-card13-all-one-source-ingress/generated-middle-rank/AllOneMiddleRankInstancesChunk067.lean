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

/-- Candidate middle source assertion `h4288` (kalmanson). -/
theorem middleSource_h4288 :
    ((!((allOneRankAtom (sourceRanks P) 25 == allOneRankAtom (sourceRanks P) 42)) || ((allOneRankAtom (sourceRanks P) 12).ult (allOneRankAtom (sourceRanks P) 14)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (14 : Fin 78) (25 : Fin 78)
    (12 : Fin 78) (42 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (4 : Fin 13) (5 : Fin 13)
    (by decide) (by decide) (by decide)
    (24 : Fin 78) (15 : Fin 78) (14 : Fin 78)
    (25 : Fin 78) (12 : Fin 78) (42 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4289` (kalmanson). -/
theorem middleSource_h4289 :
    ((!((allOneRankAtom (sourceRanks P) 14 == allOneRankAtom (sourceRanks P) 15)) || ((allOneRankAtom (sourceRanks P) 24).ult (allOneRankAtom (sourceRanks P) 25)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (25 : Fin 78) (14 : Fin 78)
    (24 : Fin 78) (15 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (4 : Fin 13) (5 : Fin 13)
    (by decide) (by decide) (by decide)
    (24 : Fin 78) (15 : Fin 78) (14 : Fin 78)
    (25 : Fin 78) (12 : Fin 78) (42 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4290` (kalmanson). -/
theorem middleSource_h4290 :
    ((!((allOneRankAtom (sourceRanks P) 25 == allOneRankAtom (sourceRanks P) 24)) || ((allOneRankAtom (sourceRanks P) 15).ult (allOneRankAtom (sourceRanks P) 14)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (14 : Fin 78) (25 : Fin 78)
    (15 : Fin 78) (24 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (4 : Fin 13) (5 : Fin 13)
    (by decide) (by decide) (by decide)
    (24 : Fin 78) (15 : Fin 78) (14 : Fin 78)
    (25 : Fin 78) (12 : Fin 78) (42 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4291` (kalmanson). -/
theorem middleSource_h4291 :
    ((!((allOneRankAtom (sourceRanks P) 14 == allOneRankAtom (sourceRanks P) 12)) || ((allOneRankAtom (sourceRanks P) 43).ult (allOneRankAtom (sourceRanks P) 26)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (26 : Fin 78) (14 : Fin 78)
    (43 : Fin 78) (12 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (4 : Fin 13) (6 : Fin 13)
    (by decide) (by decide) (by decide)
    (24 : Fin 78) (16 : Fin 78) (14 : Fin 78)
    (26 : Fin 78) (12 : Fin 78) (43 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4292` (kalmanson). -/
theorem middleSource_h4292 :
    ((!((allOneRankAtom (sourceRanks P) 14 == allOneRankAtom (sourceRanks P) 43)) || ((allOneRankAtom (sourceRanks P) 12).ult (allOneRankAtom (sourceRanks P) 26)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (26 : Fin 78) (14 : Fin 78)
    (12 : Fin 78) (43 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (4 : Fin 13) (6 : Fin 13)
    (by decide) (by decide) (by decide)
    (24 : Fin 78) (16 : Fin 78) (14 : Fin 78)
    (26 : Fin 78) (12 : Fin 78) (43 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4293` (kalmanson). -/
theorem middleSource_h4293 :
    ((!((allOneRankAtom (sourceRanks P) 26 == allOneRankAtom (sourceRanks P) 12)) || ((allOneRankAtom (sourceRanks P) 43).ult (allOneRankAtom (sourceRanks P) 14)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (14 : Fin 78) (26 : Fin 78)
    (43 : Fin 78) (12 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (4 : Fin 13) (6 : Fin 13)
    (by decide) (by decide) (by decide)
    (24 : Fin 78) (16 : Fin 78) (14 : Fin 78)
    (26 : Fin 78) (12 : Fin 78) (43 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4294` (kalmanson). -/
theorem middleSource_h4294 :
    ((!((allOneRankAtom (sourceRanks P) 26 == allOneRankAtom (sourceRanks P) 43)) || ((allOneRankAtom (sourceRanks P) 12).ult (allOneRankAtom (sourceRanks P) 14)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (14 : Fin 78) (26 : Fin 78)
    (12 : Fin 78) (43 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (4 : Fin 13) (6 : Fin 13)
    (by decide) (by decide) (by decide)
    (24 : Fin 78) (16 : Fin 78) (14 : Fin 78)
    (26 : Fin 78) (12 : Fin 78) (43 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4295` (kalmanson). -/
theorem middleSource_h4295 :
    ((!((allOneRankAtom (sourceRanks P) 14 == allOneRankAtom (sourceRanks P) 16)) || ((allOneRankAtom (sourceRanks P) 24).ult (allOneRankAtom (sourceRanks P) 26)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (26 : Fin 78) (14 : Fin 78)
    (24 : Fin 78) (16 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (4 : Fin 13) (6 : Fin 13)
    (by decide) (by decide) (by decide)
    (24 : Fin 78) (16 : Fin 78) (14 : Fin 78)
    (26 : Fin 78) (12 : Fin 78) (43 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4296` (kalmanson). -/
theorem middleSource_h4296 :
    ((!((allOneRankAtom (sourceRanks P) 26 == allOneRankAtom (sourceRanks P) 24)) || ((allOneRankAtom (sourceRanks P) 16).ult (allOneRankAtom (sourceRanks P) 14)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (14 : Fin 78) (26 : Fin 78)
    (16 : Fin 78) (24 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (4 : Fin 13) (6 : Fin 13)
    (by decide) (by decide) (by decide)
    (24 : Fin 78) (16 : Fin 78) (14 : Fin 78)
    (26 : Fin 78) (12 : Fin 78) (43 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4297` (kalmanson). -/
theorem middleSource_h4297 :
    ((!((allOneRankAtom (sourceRanks P) 14 == allOneRankAtom (sourceRanks P) 12)) || ((allOneRankAtom (sourceRanks P) 44).ult (allOneRankAtom (sourceRanks P) 27)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (27 : Fin 78) (14 : Fin 78)
    (44 : Fin 78) (12 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (4 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (24 : Fin 78) (17 : Fin 78) (14 : Fin 78)
    (27 : Fin 78) (12 : Fin 78) (44 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4298` (kalmanson). -/
theorem middleSource_h4298 :
    ((!((allOneRankAtom (sourceRanks P) 27 == allOneRankAtom (sourceRanks P) 12)) || ((allOneRankAtom (sourceRanks P) 44).ult (allOneRankAtom (sourceRanks P) 14)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (14 : Fin 78) (27 : Fin 78)
    (44 : Fin 78) (12 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (4 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (24 : Fin 78) (17 : Fin 78) (14 : Fin 78)
    (27 : Fin 78) (12 : Fin 78) (44 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4299` (kalmanson). -/
theorem middleSource_h4299 :
    ((!((allOneRankAtom (sourceRanks P) 14 == allOneRankAtom (sourceRanks P) 17)) || ((allOneRankAtom (sourceRanks P) 24).ult (allOneRankAtom (sourceRanks P) 27)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (27 : Fin 78) (14 : Fin 78)
    (24 : Fin 78) (17 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (4 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (24 : Fin 78) (17 : Fin 78) (14 : Fin 78)
    (27 : Fin 78) (12 : Fin 78) (44 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4300` (kalmanson). -/
theorem middleSource_h4300 :
    ((!((allOneRankAtom (sourceRanks P) 27 == allOneRankAtom (sourceRanks P) 24)) || ((allOneRankAtom (sourceRanks P) 17).ult (allOneRankAtom (sourceRanks P) 14)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (14 : Fin 78) (27 : Fin 78)
    (17 : Fin 78) (24 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (4 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (24 : Fin 78) (17 : Fin 78) (14 : Fin 78)
    (27 : Fin 78) (12 : Fin 78) (44 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4301` (kalmanson). -/
theorem middleSource_h4301 :
    ((!((allOneRankAtom (sourceRanks P) 14 == allOneRankAtom (sourceRanks P) 12)) || ((allOneRankAtom (sourceRanks P) 45).ult (allOneRankAtom (sourceRanks P) 28)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (28 : Fin 78) (14 : Fin 78)
    (45 : Fin 78) (12 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (4 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (24 : Fin 78) (18 : Fin 78) (14 : Fin 78)
    (28 : Fin 78) (12 : Fin 78) (45 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4302` (kalmanson). -/
theorem middleSource_h4302 :
    ((!((allOneRankAtom (sourceRanks P) 14 == allOneRankAtom (sourceRanks P) 45)) || ((allOneRankAtom (sourceRanks P) 12).ult (allOneRankAtom (sourceRanks P) 28)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (28 : Fin 78) (14 : Fin 78)
    (12 : Fin 78) (45 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (4 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (24 : Fin 78) (18 : Fin 78) (14 : Fin 78)
    (28 : Fin 78) (12 : Fin 78) (45 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4303` (kalmanson). -/
theorem middleSource_h4303 :
    ((!((allOneRankAtom (sourceRanks P) 28 == allOneRankAtom (sourceRanks P) 12)) || ((allOneRankAtom (sourceRanks P) 45).ult (allOneRankAtom (sourceRanks P) 14)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (14 : Fin 78) (28 : Fin 78)
    (45 : Fin 78) (12 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (4 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (24 : Fin 78) (18 : Fin 78) (14 : Fin 78)
    (28 : Fin 78) (12 : Fin 78) (45 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4304` (kalmanson). -/
theorem middleSource_h4304 :
    ((!((allOneRankAtom (sourceRanks P) 28 == allOneRankAtom (sourceRanks P) 45)) || ((allOneRankAtom (sourceRanks P) 12).ult (allOneRankAtom (sourceRanks P) 14)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (14 : Fin 78) (28 : Fin 78)
    (12 : Fin 78) (45 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (4 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (24 : Fin 78) (18 : Fin 78) (14 : Fin 78)
    (28 : Fin 78) (12 : Fin 78) (45 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4305` (kalmanson). -/
theorem middleSource_h4305 :
    ((!((allOneRankAtom (sourceRanks P) 14 == allOneRankAtom (sourceRanks P) 18)) || ((allOneRankAtom (sourceRanks P) 24).ult (allOneRankAtom (sourceRanks P) 28)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (28 : Fin 78) (14 : Fin 78)
    (24 : Fin 78) (18 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (4 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (24 : Fin 78) (18 : Fin 78) (14 : Fin 78)
    (28 : Fin 78) (12 : Fin 78) (45 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4306` (kalmanson). -/
theorem middleSource_h4306 :
    ((!((allOneRankAtom (sourceRanks P) 28 == allOneRankAtom (sourceRanks P) 18)) || ((allOneRankAtom (sourceRanks P) 24).ult (allOneRankAtom (sourceRanks P) 14)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (14 : Fin 78) (28 : Fin 78)
    (24 : Fin 78) (18 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (4 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (24 : Fin 78) (18 : Fin 78) (14 : Fin 78)
    (28 : Fin 78) (12 : Fin 78) (45 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4307` (kalmanson). -/
theorem middleSource_h4307 :
    ((!((allOneRankAtom (sourceRanks P) 28 == allOneRankAtom (sourceRanks P) 24)) || ((allOneRankAtom (sourceRanks P) 18).ult (allOneRankAtom (sourceRanks P) 14)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (14 : Fin 78) (28 : Fin 78)
    (18 : Fin 78) (24 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (4 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (24 : Fin 78) (18 : Fin 78) (14 : Fin 78)
    (28 : Fin 78) (12 : Fin 78) (45 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4308` (kalmanson). -/
theorem middleSource_h4308 :
    ((!((allOneRankAtom (sourceRanks P) 14 == allOneRankAtom (sourceRanks P) 12)) || ((allOneRankAtom (sourceRanks P) 46).ult (allOneRankAtom (sourceRanks P) 29)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (29 : Fin 78) (14 : Fin 78)
    (46 : Fin 78) (12 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (4 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (24 : Fin 78) (19 : Fin 78) (14 : Fin 78)
    (29 : Fin 78) (12 : Fin 78) (46 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4309` (kalmanson). -/
theorem middleSource_h4309 :
    ((!((allOneRankAtom (sourceRanks P) 14 == allOneRankAtom (sourceRanks P) 46)) || ((allOneRankAtom (sourceRanks P) 12).ult (allOneRankAtom (sourceRanks P) 29)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (29 : Fin 78) (14 : Fin 78)
    (12 : Fin 78) (46 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (4 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (24 : Fin 78) (19 : Fin 78) (14 : Fin 78)
    (29 : Fin 78) (12 : Fin 78) (46 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4310` (kalmanson). -/
theorem middleSource_h4310 :
    ((!((allOneRankAtom (sourceRanks P) 29 == allOneRankAtom (sourceRanks P) 12)) || ((allOneRankAtom (sourceRanks P) 46).ult (allOneRankAtom (sourceRanks P) 14)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (14 : Fin 78) (29 : Fin 78)
    (46 : Fin 78) (12 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (4 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (24 : Fin 78) (19 : Fin 78) (14 : Fin 78)
    (29 : Fin 78) (12 : Fin 78) (46 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4311` (kalmanson). -/
theorem middleSource_h4311 :
    ((!((allOneRankAtom (sourceRanks P) 29 == allOneRankAtom (sourceRanks P) 46)) || ((allOneRankAtom (sourceRanks P) 12).ult (allOneRankAtom (sourceRanks P) 14)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (14 : Fin 78) (29 : Fin 78)
    (12 : Fin 78) (46 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (4 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (24 : Fin 78) (19 : Fin 78) (14 : Fin 78)
    (29 : Fin 78) (12 : Fin 78) (46 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4312` (kalmanson). -/
theorem middleSource_h4312 :
    ((!((allOneRankAtom (sourceRanks P) 14 == allOneRankAtom (sourceRanks P) 19)) || ((allOneRankAtom (sourceRanks P) 24).ult (allOneRankAtom (sourceRanks P) 29)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (29 : Fin 78) (14 : Fin 78)
    (24 : Fin 78) (19 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (4 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (24 : Fin 78) (19 : Fin 78) (14 : Fin 78)
    (29 : Fin 78) (12 : Fin 78) (46 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4313` (kalmanson). -/
theorem middleSource_h4313 :
    ((!((allOneRankAtom (sourceRanks P) 29 == allOneRankAtom (sourceRanks P) 24)) || ((allOneRankAtom (sourceRanks P) 19).ult (allOneRankAtom (sourceRanks P) 14)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (14 : Fin 78) (29 : Fin 78)
    (19 : Fin 78) (24 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (4 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (24 : Fin 78) (19 : Fin 78) (14 : Fin 78)
    (29 : Fin 78) (12 : Fin 78) (46 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4314` (kalmanson). -/
theorem middleSource_h4314 :
    ((!((allOneRankAtom (sourceRanks P) 14 == allOneRankAtom (sourceRanks P) 12)) || ((allOneRankAtom (sourceRanks P) 47).ult (allOneRankAtom (sourceRanks P) 30)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (30 : Fin 78) (14 : Fin 78)
    (47 : Fin 78) (12 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (4 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (24 : Fin 78) (20 : Fin 78) (14 : Fin 78)
    (30 : Fin 78) (12 : Fin 78) (47 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4315` (kalmanson). -/
theorem middleSource_h4315 :
    ((!((allOneRankAtom (sourceRanks P) 14 == allOneRankAtom (sourceRanks P) 47)) || ((allOneRankAtom (sourceRanks P) 12).ult (allOneRankAtom (sourceRanks P) 30)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (30 : Fin 78) (14 : Fin 78)
    (12 : Fin 78) (47 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (4 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (24 : Fin 78) (20 : Fin 78) (14 : Fin 78)
    (30 : Fin 78) (12 : Fin 78) (47 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4316` (kalmanson). -/
theorem middleSource_h4316 :
    ((!((allOneRankAtom (sourceRanks P) 30 == allOneRankAtom (sourceRanks P) 12)) || ((allOneRankAtom (sourceRanks P) 47).ult (allOneRankAtom (sourceRanks P) 14)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (14 : Fin 78) (30 : Fin 78)
    (47 : Fin 78) (12 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (4 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (24 : Fin 78) (20 : Fin 78) (14 : Fin 78)
    (30 : Fin 78) (12 : Fin 78) (47 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4317` (kalmanson). -/
theorem middleSource_h4317 :
    ((!((allOneRankAtom (sourceRanks P) 30 == allOneRankAtom (sourceRanks P) 47)) || ((allOneRankAtom (sourceRanks P) 12).ult (allOneRankAtom (sourceRanks P) 14)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (14 : Fin 78) (30 : Fin 78)
    (12 : Fin 78) (47 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (4 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (24 : Fin 78) (20 : Fin 78) (14 : Fin 78)
    (30 : Fin 78) (12 : Fin 78) (47 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4318` (kalmanson). -/
theorem middleSource_h4318 :
    ((!((allOneRankAtom (sourceRanks P) 14 == allOneRankAtom (sourceRanks P) 20)) || ((allOneRankAtom (sourceRanks P) 24).ult (allOneRankAtom (sourceRanks P) 30)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (30 : Fin 78) (14 : Fin 78)
    (24 : Fin 78) (20 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (4 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (24 : Fin 78) (20 : Fin 78) (14 : Fin 78)
    (30 : Fin 78) (12 : Fin 78) (47 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4319` (kalmanson). -/
theorem middleSource_h4319 :
    ((!((allOneRankAtom (sourceRanks P) 30 == allOneRankAtom (sourceRanks P) 24)) || ((allOneRankAtom (sourceRanks P) 20).ult (allOneRankAtom (sourceRanks P) 14)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (14 : Fin 78) (30 : Fin 78)
    (20 : Fin 78) (24 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (4 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (24 : Fin 78) (20 : Fin 78) (14 : Fin 78)
    (30 : Fin 78) (12 : Fin 78) (47 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4320` (kalmanson). -/
theorem middleSource_h4320 :
    ((!((allOneRankAtom (sourceRanks P) 14 == allOneRankAtom (sourceRanks P) 12)) || ((allOneRankAtom (sourceRanks P) 48).ult (allOneRankAtom (sourceRanks P) 31)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (31 : Fin 78) (14 : Fin 78)
    (48 : Fin 78) (12 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (4 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (24 : Fin 78) (21 : Fin 78) (14 : Fin 78)
    (31 : Fin 78) (12 : Fin 78) (48 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4321` (kalmanson). -/
theorem middleSource_h4321 :
    ((!((allOneRankAtom (sourceRanks P) 14 == allOneRankAtom (sourceRanks P) 48)) || ((allOneRankAtom (sourceRanks P) 12).ult (allOneRankAtom (sourceRanks P) 31)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (31 : Fin 78) (14 : Fin 78)
    (12 : Fin 78) (48 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (4 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (24 : Fin 78) (21 : Fin 78) (14 : Fin 78)
    (31 : Fin 78) (12 : Fin 78) (48 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4322` (kalmanson). -/
theorem middleSource_h4322 :
    ((!((allOneRankAtom (sourceRanks P) 31 == allOneRankAtom (sourceRanks P) 12)) || ((allOneRankAtom (sourceRanks P) 48).ult (allOneRankAtom (sourceRanks P) 14)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (14 : Fin 78) (31 : Fin 78)
    (48 : Fin 78) (12 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (4 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (24 : Fin 78) (21 : Fin 78) (14 : Fin 78)
    (31 : Fin 78) (12 : Fin 78) (48 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4323` (kalmanson). -/
theorem middleSource_h4323 :
    ((!((allOneRankAtom (sourceRanks P) 31 == allOneRankAtom (sourceRanks P) 48)) || ((allOneRankAtom (sourceRanks P) 12).ult (allOneRankAtom (sourceRanks P) 14)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (14 : Fin 78) (31 : Fin 78)
    (12 : Fin 78) (48 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (4 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (24 : Fin 78) (21 : Fin 78) (14 : Fin 78)
    (31 : Fin 78) (12 : Fin 78) (48 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4324` (kalmanson). -/
theorem middleSource_h4324 :
    ((!((allOneRankAtom (sourceRanks P) 14 == allOneRankAtom (sourceRanks P) 21)) || ((allOneRankAtom (sourceRanks P) 24).ult (allOneRankAtom (sourceRanks P) 31)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (31 : Fin 78) (14 : Fin 78)
    (24 : Fin 78) (21 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (4 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (24 : Fin 78) (21 : Fin 78) (14 : Fin 78)
    (31 : Fin 78) (12 : Fin 78) (48 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4325` (kalmanson). -/
theorem middleSource_h4325 :
    ((!((allOneRankAtom (sourceRanks P) 31 == allOneRankAtom (sourceRanks P) 24)) || ((allOneRankAtom (sourceRanks P) 21).ult (allOneRankAtom (sourceRanks P) 14)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (14 : Fin 78) (31 : Fin 78)
    (21 : Fin 78) (24 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (4 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (24 : Fin 78) (21 : Fin 78) (14 : Fin 78)
    (31 : Fin 78) (12 : Fin 78) (48 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4326` (kalmanson). -/
theorem middleSource_h4326 :
    ((!((allOneRankAtom (sourceRanks P) 14 == allOneRankAtom (sourceRanks P) 12)) || ((allOneRankAtom (sourceRanks P) 49).ult (allOneRankAtom (sourceRanks P) 32)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (32 : Fin 78) (14 : Fin 78)
    (49 : Fin 78) (12 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (4 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (24 : Fin 78) (22 : Fin 78) (14 : Fin 78)
    (32 : Fin 78) (12 : Fin 78) (49 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4327` (kalmanson). -/
theorem middleSource_h4327 :
    ((!((allOneRankAtom (sourceRanks P) 14 == allOneRankAtom (sourceRanks P) 49)) || ((allOneRankAtom (sourceRanks P) 12).ult (allOneRankAtom (sourceRanks P) 32)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (32 : Fin 78) (14 : Fin 78)
    (12 : Fin 78) (49 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (4 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (24 : Fin 78) (22 : Fin 78) (14 : Fin 78)
    (32 : Fin 78) (12 : Fin 78) (49 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4328` (kalmanson). -/
theorem middleSource_h4328 :
    ((!((allOneRankAtom (sourceRanks P) 32 == allOneRankAtom (sourceRanks P) 12)) || ((allOneRankAtom (sourceRanks P) 49).ult (allOneRankAtom (sourceRanks P) 14)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (14 : Fin 78) (32 : Fin 78)
    (49 : Fin 78) (12 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (4 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (24 : Fin 78) (22 : Fin 78) (14 : Fin 78)
    (32 : Fin 78) (12 : Fin 78) (49 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4329` (kalmanson). -/
theorem middleSource_h4329 :
    ((!((allOneRankAtom (sourceRanks P) 14 == allOneRankAtom (sourceRanks P) 22)) || ((allOneRankAtom (sourceRanks P) 24).ult (allOneRankAtom (sourceRanks P) 32)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (32 : Fin 78) (14 : Fin 78)
    (24 : Fin 78) (22 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (4 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (24 : Fin 78) (22 : Fin 78) (14 : Fin 78)
    (32 : Fin 78) (12 : Fin 78) (49 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4330` (kalmanson). -/
theorem middleSource_h4330 :
    ((!((allOneRankAtom (sourceRanks P) 32 == allOneRankAtom (sourceRanks P) 24)) || ((allOneRankAtom (sourceRanks P) 22).ult (allOneRankAtom (sourceRanks P) 14)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (14 : Fin 78) (32 : Fin 78)
    (22 : Fin 78) (24 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (4 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (24 : Fin 78) (22 : Fin 78) (14 : Fin 78)
    (32 : Fin 78) (12 : Fin 78) (49 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4331` (kalmanson). -/
theorem middleSource_h4331 :
    ((!((allOneRankAtom (sourceRanks P) 15 == allOneRankAtom (sourceRanks P) 12)) || ((allOneRankAtom (sourceRanks P) 50).ult (allOneRankAtom (sourceRanks P) 26)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (26 : Fin 78) (15 : Fin 78)
    (50 : Fin 78) (12 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (5 : Fin 13) (6 : Fin 13)
    (by decide) (by decide) (by decide)
    (25 : Fin 78) (16 : Fin 78) (15 : Fin 78)
    (26 : Fin 78) (12 : Fin 78) (50 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4332` (kalmanson). -/
theorem middleSource_h4332 :
    ((!((allOneRankAtom (sourceRanks P) 26 == allOneRankAtom (sourceRanks P) 12)) || ((allOneRankAtom (sourceRanks P) 50).ult (allOneRankAtom (sourceRanks P) 15)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (15 : Fin 78) (26 : Fin 78)
    (50 : Fin 78) (12 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (5 : Fin 13) (6 : Fin 13)
    (by decide) (by decide) (by decide)
    (25 : Fin 78) (16 : Fin 78) (15 : Fin 78)
    (26 : Fin 78) (12 : Fin 78) (50 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4333` (kalmanson). -/
theorem middleSource_h4333 :
    ((!((allOneRankAtom (sourceRanks P) 26 == allOneRankAtom (sourceRanks P) 50)) || ((allOneRankAtom (sourceRanks P) 12).ult (allOneRankAtom (sourceRanks P) 15)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (15 : Fin 78) (26 : Fin 78)
    (12 : Fin 78) (50 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (5 : Fin 13) (6 : Fin 13)
    (by decide) (by decide) (by decide)
    (25 : Fin 78) (16 : Fin 78) (15 : Fin 78)
    (26 : Fin 78) (12 : Fin 78) (50 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4334` (kalmanson). -/
theorem middleSource_h4334 :
    ((!((allOneRankAtom (sourceRanks P) 15 == allOneRankAtom (sourceRanks P) 16)) || ((allOneRankAtom (sourceRanks P) 25).ult (allOneRankAtom (sourceRanks P) 26)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (26 : Fin 78) (15 : Fin 78)
    (25 : Fin 78) (16 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (5 : Fin 13) (6 : Fin 13)
    (by decide) (by decide) (by decide)
    (25 : Fin 78) (16 : Fin 78) (15 : Fin 78)
    (26 : Fin 78) (12 : Fin 78) (50 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4335` (kalmanson). -/
theorem middleSource_h4335 :
    ((!((allOneRankAtom (sourceRanks P) 26 == allOneRankAtom (sourceRanks P) 25)) || ((allOneRankAtom (sourceRanks P) 16).ult (allOneRankAtom (sourceRanks P) 15)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (15 : Fin 78) (26 : Fin 78)
    (16 : Fin 78) (25 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (5 : Fin 13) (6 : Fin 13)
    (by decide) (by decide) (by decide)
    (25 : Fin 78) (16 : Fin 78) (15 : Fin 78)
    (26 : Fin 78) (12 : Fin 78) (50 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4336` (kalmanson). -/
theorem middleSource_h4336 :
    ((!((allOneRankAtom (sourceRanks P) 15 == allOneRankAtom (sourceRanks P) 12)) || ((allOneRankAtom (sourceRanks P) 51).ult (allOneRankAtom (sourceRanks P) 27)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (27 : Fin 78) (15 : Fin 78)
    (51 : Fin 78) (12 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (5 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (25 : Fin 78) (17 : Fin 78) (15 : Fin 78)
    (27 : Fin 78) (12 : Fin 78) (51 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4337` (kalmanson). -/
theorem middleSource_h4337 :
    ((!((allOneRankAtom (sourceRanks P) 15 == allOneRankAtom (sourceRanks P) 51)) || ((allOneRankAtom (sourceRanks P) 12).ult (allOneRankAtom (sourceRanks P) 27)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (27 : Fin 78) (15 : Fin 78)
    (12 : Fin 78) (51 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (5 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (25 : Fin 78) (17 : Fin 78) (15 : Fin 78)
    (27 : Fin 78) (12 : Fin 78) (51 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4338` (kalmanson). -/
theorem middleSource_h4338 :
    ((!((allOneRankAtom (sourceRanks P) 27 == allOneRankAtom (sourceRanks P) 12)) || ((allOneRankAtom (sourceRanks P) 51).ult (allOneRankAtom (sourceRanks P) 15)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (15 : Fin 78) (27 : Fin 78)
    (51 : Fin 78) (12 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (5 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (25 : Fin 78) (17 : Fin 78) (15 : Fin 78)
    (27 : Fin 78) (12 : Fin 78) (51 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4339` (kalmanson). -/
theorem middleSource_h4339 :
    ((!((allOneRankAtom (sourceRanks P) 15 == allOneRankAtom (sourceRanks P) 17)) || ((allOneRankAtom (sourceRanks P) 25).ult (allOneRankAtom (sourceRanks P) 27)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (27 : Fin 78) (15 : Fin 78)
    (25 : Fin 78) (17 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (5 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (25 : Fin 78) (17 : Fin 78) (15 : Fin 78)
    (27 : Fin 78) (12 : Fin 78) (51 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4340` (kalmanson). -/
theorem middleSource_h4340 :
    ((!((allOneRankAtom (sourceRanks P) 27 == allOneRankAtom (sourceRanks P) 25)) || ((allOneRankAtom (sourceRanks P) 17).ult (allOneRankAtom (sourceRanks P) 15)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (15 : Fin 78) (27 : Fin 78)
    (17 : Fin 78) (25 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (5 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (25 : Fin 78) (17 : Fin 78) (15 : Fin 78)
    (27 : Fin 78) (12 : Fin 78) (51 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4341` (kalmanson). -/
theorem middleSource_h4341 :
    ((!((allOneRankAtom (sourceRanks P) 15 == allOneRankAtom (sourceRanks P) 12)) || ((allOneRankAtom (sourceRanks P) 52).ult (allOneRankAtom (sourceRanks P) 28)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (28 : Fin 78) (15 : Fin 78)
    (52 : Fin 78) (12 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (5 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (25 : Fin 78) (18 : Fin 78) (15 : Fin 78)
    (28 : Fin 78) (12 : Fin 78) (52 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4342` (kalmanson). -/
theorem middleSource_h4342 :
    ((!((allOneRankAtom (sourceRanks P) 15 == allOneRankAtom (sourceRanks P) 52)) || ((allOneRankAtom (sourceRanks P) 12).ult (allOneRankAtom (sourceRanks P) 28)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (28 : Fin 78) (15 : Fin 78)
    (12 : Fin 78) (52 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (5 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (25 : Fin 78) (18 : Fin 78) (15 : Fin 78)
    (28 : Fin 78) (12 : Fin 78) (52 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4343` (kalmanson). -/
theorem middleSource_h4343 :
    ((!((allOneRankAtom (sourceRanks P) 28 == allOneRankAtom (sourceRanks P) 12)) || ((allOneRankAtom (sourceRanks P) 52).ult (allOneRankAtom (sourceRanks P) 15)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (15 : Fin 78) (28 : Fin 78)
    (52 : Fin 78) (12 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (5 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (25 : Fin 78) (18 : Fin 78) (15 : Fin 78)
    (28 : Fin 78) (12 : Fin 78) (52 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4344` (kalmanson). -/
theorem middleSource_h4344 :
    ((!((allOneRankAtom (sourceRanks P) 28 == allOneRankAtom (sourceRanks P) 52)) || ((allOneRankAtom (sourceRanks P) 12).ult (allOneRankAtom (sourceRanks P) 15)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (15 : Fin 78) (28 : Fin 78)
    (12 : Fin 78) (52 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (5 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (25 : Fin 78) (18 : Fin 78) (15 : Fin 78)
    (28 : Fin 78) (12 : Fin 78) (52 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4345` (kalmanson). -/
theorem middleSource_h4345 :
    ((!((allOneRankAtom (sourceRanks P) 15 == allOneRankAtom (sourceRanks P) 18)) || ((allOneRankAtom (sourceRanks P) 25).ult (allOneRankAtom (sourceRanks P) 28)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (28 : Fin 78) (15 : Fin 78)
    (25 : Fin 78) (18 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (5 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (25 : Fin 78) (18 : Fin 78) (15 : Fin 78)
    (28 : Fin 78) (12 : Fin 78) (52 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4346` (kalmanson). -/
theorem middleSource_h4346 :
    ((!((allOneRankAtom (sourceRanks P) 15 == allOneRankAtom (sourceRanks P) 25)) || ((allOneRankAtom (sourceRanks P) 18).ult (allOneRankAtom (sourceRanks P) 28)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (28 : Fin 78) (15 : Fin 78)
    (18 : Fin 78) (25 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (5 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (25 : Fin 78) (18 : Fin 78) (15 : Fin 78)
    (28 : Fin 78) (12 : Fin 78) (52 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4347` (kalmanson). -/
theorem middleSource_h4347 :
    ((!((allOneRankAtom (sourceRanks P) 28 == allOneRankAtom (sourceRanks P) 18)) || ((allOneRankAtom (sourceRanks P) 25).ult (allOneRankAtom (sourceRanks P) 15)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (15 : Fin 78) (28 : Fin 78)
    (25 : Fin 78) (18 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (5 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (25 : Fin 78) (18 : Fin 78) (15 : Fin 78)
    (28 : Fin 78) (12 : Fin 78) (52 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4348` (kalmanson). -/
theorem middleSource_h4348 :
    ((!((allOneRankAtom (sourceRanks P) 28 == allOneRankAtom (sourceRanks P) 25)) || ((allOneRankAtom (sourceRanks P) 18).ult (allOneRankAtom (sourceRanks P) 15)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (15 : Fin 78) (28 : Fin 78)
    (18 : Fin 78) (25 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (5 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (25 : Fin 78) (18 : Fin 78) (15 : Fin 78)
    (28 : Fin 78) (12 : Fin 78) (52 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h4349` (kalmanson). -/
theorem middleSource_h4349 :
    ((!((allOneRankAtom (sourceRanks P) 15 == allOneRankAtom (sourceRanks P) 12)) || ((allOneRankAtom (sourceRanks P) 53).ult (allOneRankAtom (sourceRanks P) 29)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (29 : Fin 78) (15 : Fin 78)
    (53 : Fin 78) (12 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (5 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (25 : Fin 78) (19 : Fin 78) (15 : Fin 78)
    (29 : Fin 78) (12 : Fin 78) (53 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4350` (kalmanson). -/
theorem middleSource_h4350 :
    ((!((allOneRankAtom (sourceRanks P) 15 == allOneRankAtom (sourceRanks P) 53)) || ((allOneRankAtom (sourceRanks P) 12).ult (allOneRankAtom (sourceRanks P) 29)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (29 : Fin 78) (15 : Fin 78)
    (12 : Fin 78) (53 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (5 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (25 : Fin 78) (19 : Fin 78) (15 : Fin 78)
    (29 : Fin 78) (12 : Fin 78) (53 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h4351` (kalmanson). -/
theorem middleSource_h4351 :
    ((!((allOneRankAtom (sourceRanks P) 29 == allOneRankAtom (sourceRanks P) 12)) || ((allOneRankAtom (sourceRanks P) 53).ult (allOneRankAtom (sourceRanks P) 15)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (15 : Fin 78) (29 : Fin 78)
    (53 : Fin 78) (12 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (1 : Fin 13) (2 : Fin 13) (5 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (25 : Fin 78) (19 : Fin 78) (15 : Fin 78)
    (29 : Fin 78) (12 : Fin 78) (53 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

end

end ATailExactFiveCard13AllOneSourceIngressScratch
end Problem97
