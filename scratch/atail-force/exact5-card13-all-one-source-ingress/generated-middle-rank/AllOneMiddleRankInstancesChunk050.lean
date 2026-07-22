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

/-- Candidate middle source assertion `h3200` (kalmanson). -/
theorem middleSource_h3200 :
    ((!((allOneRankAtom (sourceRanks P) 10 == allOneRankAtom (sourceRanks P) 77)) || ((allOneRankAtom (sourceRanks P) 0).ult (allOneRankAtom (sourceRanks P) 22)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (22 : Fin 78) (10 : Fin 78)
    (0 : Fin 78) (77 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (11 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (21 : Fin 78) (11 : Fin 78) (10 : Fin 78)
    (22 : Fin 78) (0 : Fin 78) (77 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3201` (kalmanson). -/
theorem middleSource_h3201 :
    ((!((allOneRankAtom (sourceRanks P) 22 == allOneRankAtom (sourceRanks P) 0)) || ((allOneRankAtom (sourceRanks P) 77).ult (allOneRankAtom (sourceRanks P) 10)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (10 : Fin 78) (22 : Fin 78)
    (77 : Fin 78) (0 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (11 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (21 : Fin 78) (11 : Fin 78) (10 : Fin 78)
    (22 : Fin 78) (0 : Fin 78) (77 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3202` (kalmanson). -/
theorem middleSource_h3202 :
    ((!((allOneRankAtom (sourceRanks P) 10 == allOneRankAtom (sourceRanks P) 21)) || ((allOneRankAtom (sourceRanks P) 11).ult (allOneRankAtom (sourceRanks P) 22)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (22 : Fin 78) (10 : Fin 78)
    (11 : Fin 78) (21 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (11 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (21 : Fin 78) (11 : Fin 78) (10 : Fin 78)
    (22 : Fin 78) (0 : Fin 78) (77 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3203` (kalmanson). -/
theorem middleSource_h3203 :
    ((!((allOneRankAtom (sourceRanks P) 22 == allOneRankAtom (sourceRanks P) 21)) || ((allOneRankAtom (sourceRanks P) 11).ult (allOneRankAtom (sourceRanks P) 10)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (10 : Fin 78) (22 : Fin 78)
    (11 : Fin 78) (21 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (11 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (21 : Fin 78) (11 : Fin 78) (10 : Fin 78)
    (22 : Fin 78) (0 : Fin 78) (77 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3204` (kalmanson). -/
theorem middleSource_h3204 :
    ((!((allOneRankAtom (sourceRanks P) 24 == allOneRankAtom (sourceRanks P) 3)) || ((allOneRankAtom (sourceRanks P) 23).ult (allOneRankAtom (sourceRanks P) 2)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (2 : Fin 78) (24 : Fin 78)
    (23 : Fin 78) (3 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (3 : Fin 13) (4 : Fin 13)
    (by decide) (by decide) (by decide)
    (23 : Fin 78) (3 : Fin 78) (2 : Fin 78)
    (24 : Fin 78) (1 : Fin 78) (33 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3205` (kalmanson). -/
theorem middleSource_h3205 :
    ((!((allOneRankAtom (sourceRanks P) 24 == allOneRankAtom (sourceRanks P) 23)) || ((allOneRankAtom (sourceRanks P) 3).ult (allOneRankAtom (sourceRanks P) 2)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (2 : Fin 78) (24 : Fin 78)
    (3 : Fin 78) (23 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (3 : Fin 13) (4 : Fin 13)
    (by decide) (by decide) (by decide)
    (23 : Fin 78) (3 : Fin 78) (2 : Fin 78)
    (24 : Fin 78) (1 : Fin 78) (33 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3206` (kalmanson). -/
theorem middleSource_h3206 :
    ((!((allOneRankAtom (sourceRanks P) 25 == allOneRankAtom (sourceRanks P) 1)) || ((allOneRankAtom (sourceRanks P) 34).ult (allOneRankAtom (sourceRanks P) 2)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (2 : Fin 78) (25 : Fin 78)
    (34 : Fin 78) (1 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (3 : Fin 13) (5 : Fin 13)
    (by decide) (by decide) (by decide)
    (23 : Fin 78) (4 : Fin 78) (2 : Fin 78)
    (25 : Fin 78) (1 : Fin 78) (34 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3207` (kalmanson). -/
theorem middleSource_h3207 :
    ((!((allOneRankAtom (sourceRanks P) 2 == allOneRankAtom (sourceRanks P) 4)) || ((allOneRankAtom (sourceRanks P) 23).ult (allOneRankAtom (sourceRanks P) 25)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (25 : Fin 78) (2 : Fin 78)
    (23 : Fin 78) (4 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (3 : Fin 13) (5 : Fin 13)
    (by decide) (by decide) (by decide)
    (23 : Fin 78) (4 : Fin 78) (2 : Fin 78)
    (25 : Fin 78) (1 : Fin 78) (34 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3208` (kalmanson). -/
theorem middleSource_h3208 :
    ((!((allOneRankAtom (sourceRanks P) 25 == allOneRankAtom (sourceRanks P) 4)) || ((allOneRankAtom (sourceRanks P) 23).ult (allOneRankAtom (sourceRanks P) 2)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (2 : Fin 78) (25 : Fin 78)
    (23 : Fin 78) (4 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (3 : Fin 13) (5 : Fin 13)
    (by decide) (by decide) (by decide)
    (23 : Fin 78) (4 : Fin 78) (2 : Fin 78)
    (25 : Fin 78) (1 : Fin 78) (34 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3209` (kalmanson). -/
theorem middleSource_h3209 :
    ((!((allOneRankAtom (sourceRanks P) 25 == allOneRankAtom (sourceRanks P) 23)) || ((allOneRankAtom (sourceRanks P) 4).ult (allOneRankAtom (sourceRanks P) 2)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (2 : Fin 78) (25 : Fin 78)
    (4 : Fin 78) (23 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (3 : Fin 13) (5 : Fin 13)
    (by decide) (by decide) (by decide)
    (23 : Fin 78) (4 : Fin 78) (2 : Fin 78)
    (25 : Fin 78) (1 : Fin 78) (34 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3210` (kalmanson). -/
theorem middleSource_h3210 :
    ((!((allOneRankAtom (sourceRanks P) 26 == allOneRankAtom (sourceRanks P) 1)) || ((allOneRankAtom (sourceRanks P) 35).ult (allOneRankAtom (sourceRanks P) 2)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (2 : Fin 78) (26 : Fin 78)
    (35 : Fin 78) (1 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (3 : Fin 13) (6 : Fin 13)
    (by decide) (by decide) (by decide)
    (23 : Fin 78) (5 : Fin 78) (2 : Fin 78)
    (26 : Fin 78) (1 : Fin 78) (35 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3211` (kalmanson). -/
theorem middleSource_h3211 :
    ((!((allOneRankAtom (sourceRanks P) 2 == allOneRankAtom (sourceRanks P) 5)) || ((allOneRankAtom (sourceRanks P) 23).ult (allOneRankAtom (sourceRanks P) 26)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (26 : Fin 78) (2 : Fin 78)
    (23 : Fin 78) (5 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (3 : Fin 13) (6 : Fin 13)
    (by decide) (by decide) (by decide)
    (23 : Fin 78) (5 : Fin 78) (2 : Fin 78)
    (26 : Fin 78) (1 : Fin 78) (35 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3212` (kalmanson). -/
theorem middleSource_h3212 :
    ((!((allOneRankAtom (sourceRanks P) 26 == allOneRankAtom (sourceRanks P) 5)) || ((allOneRankAtom (sourceRanks P) 23).ult (allOneRankAtom (sourceRanks P) 2)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (2 : Fin 78) (26 : Fin 78)
    (23 : Fin 78) (5 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (3 : Fin 13) (6 : Fin 13)
    (by decide) (by decide) (by decide)
    (23 : Fin 78) (5 : Fin 78) (2 : Fin 78)
    (26 : Fin 78) (1 : Fin 78) (35 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3213` (kalmanson). -/
theorem middleSource_h3213 :
    ((!((allOneRankAtom (sourceRanks P) 26 == allOneRankAtom (sourceRanks P) 23)) || ((allOneRankAtom (sourceRanks P) 5).ult (allOneRankAtom (sourceRanks P) 2)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (2 : Fin 78) (26 : Fin 78)
    (5 : Fin 78) (23 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (3 : Fin 13) (6 : Fin 13)
    (by decide) (by decide) (by decide)
    (23 : Fin 78) (5 : Fin 78) (2 : Fin 78)
    (26 : Fin 78) (1 : Fin 78) (35 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3214` (kalmanson). -/
theorem middleSource_h3214 :
    ((!((allOneRankAtom (sourceRanks P) 27 == allOneRankAtom (sourceRanks P) 1)) || ((allOneRankAtom (sourceRanks P) 36).ult (allOneRankAtom (sourceRanks P) 2)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (2 : Fin 78) (27 : Fin 78)
    (36 : Fin 78) (1 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (3 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (23 : Fin 78) (6 : Fin 78) (2 : Fin 78)
    (27 : Fin 78) (1 : Fin 78) (36 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3215` (kalmanson). -/
theorem middleSource_h3215 :
    ((!((allOneRankAtom (sourceRanks P) 2 == allOneRankAtom (sourceRanks P) 6)) || ((allOneRankAtom (sourceRanks P) 23).ult (allOneRankAtom (sourceRanks P) 27)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (27 : Fin 78) (2 : Fin 78)
    (23 : Fin 78) (6 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (3 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (23 : Fin 78) (6 : Fin 78) (2 : Fin 78)
    (27 : Fin 78) (1 : Fin 78) (36 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3216` (kalmanson). -/
theorem middleSource_h3216 :
    ((!((allOneRankAtom (sourceRanks P) 27 == allOneRankAtom (sourceRanks P) 23)) || ((allOneRankAtom (sourceRanks P) 6).ult (allOneRankAtom (sourceRanks P) 2)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (2 : Fin 78) (27 : Fin 78)
    (6 : Fin 78) (23 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (3 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (23 : Fin 78) (6 : Fin 78) (2 : Fin 78)
    (27 : Fin 78) (1 : Fin 78) (36 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3217` (kalmanson). -/
theorem middleSource_h3217 :
    ((!((allOneRankAtom (sourceRanks P) 2 == allOneRankAtom (sourceRanks P) 37)) || ((allOneRankAtom (sourceRanks P) 1).ult (allOneRankAtom (sourceRanks P) 28)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (28 : Fin 78) (2 : Fin 78)
    (1 : Fin 78) (37 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (3 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (23 : Fin 78) (7 : Fin 78) (2 : Fin 78)
    (28 : Fin 78) (1 : Fin 78) (37 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3218` (kalmanson). -/
theorem middleSource_h3218 :
    ((!((allOneRankAtom (sourceRanks P) 28 == allOneRankAtom (sourceRanks P) 1)) || ((allOneRankAtom (sourceRanks P) 37).ult (allOneRankAtom (sourceRanks P) 2)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (2 : Fin 78) (28 : Fin 78)
    (37 : Fin 78) (1 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (3 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (23 : Fin 78) (7 : Fin 78) (2 : Fin 78)
    (28 : Fin 78) (1 : Fin 78) (37 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3219` (kalmanson). -/
theorem middleSource_h3219 :
    ((!((allOneRankAtom (sourceRanks P) 28 == allOneRankAtom (sourceRanks P) 37)) || ((allOneRankAtom (sourceRanks P) 1).ult (allOneRankAtom (sourceRanks P) 2)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (2 : Fin 78) (28 : Fin 78)
    (1 : Fin 78) (37 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (3 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (23 : Fin 78) (7 : Fin 78) (2 : Fin 78)
    (28 : Fin 78) (1 : Fin 78) (37 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3220` (kalmanson). -/
theorem middleSource_h3220 :
    ((!((allOneRankAtom (sourceRanks P) 2 == allOneRankAtom (sourceRanks P) 23)) || ((allOneRankAtom (sourceRanks P) 7).ult (allOneRankAtom (sourceRanks P) 28)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (28 : Fin 78) (2 : Fin 78)
    (7 : Fin 78) (23 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (3 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (23 : Fin 78) (7 : Fin 78) (2 : Fin 78)
    (28 : Fin 78) (1 : Fin 78) (37 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3221` (kalmanson). -/
theorem middleSource_h3221 :
    ((!((allOneRankAtom (sourceRanks P) 28 == allOneRankAtom (sourceRanks P) 7)) || ((allOneRankAtom (sourceRanks P) 23).ult (allOneRankAtom (sourceRanks P) 2)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (2 : Fin 78) (28 : Fin 78)
    (23 : Fin 78) (7 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (3 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (23 : Fin 78) (7 : Fin 78) (2 : Fin 78)
    (28 : Fin 78) (1 : Fin 78) (37 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3222` (kalmanson). -/
theorem middleSource_h3222 :
    ((!((allOneRankAtom (sourceRanks P) 28 == allOneRankAtom (sourceRanks P) 23)) || ((allOneRankAtom (sourceRanks P) 7).ult (allOneRankAtom (sourceRanks P) 2)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (2 : Fin 78) (28 : Fin 78)
    (7 : Fin 78) (23 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (3 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (23 : Fin 78) (7 : Fin 78) (2 : Fin 78)
    (28 : Fin 78) (1 : Fin 78) (37 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3223` (kalmanson). -/
theorem middleSource_h3223 :
    ((!((allOneRankAtom (sourceRanks P) 2 == allOneRankAtom (sourceRanks P) 38)) || ((allOneRankAtom (sourceRanks P) 1).ult (allOneRankAtom (sourceRanks P) 29)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (29 : Fin 78) (2 : Fin 78)
    (1 : Fin 78) (38 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (3 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (23 : Fin 78) (8 : Fin 78) (2 : Fin 78)
    (29 : Fin 78) (1 : Fin 78) (38 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3224` (kalmanson). -/
theorem middleSource_h3224 :
    ((!((allOneRankAtom (sourceRanks P) 29 == allOneRankAtom (sourceRanks P) 1)) || ((allOneRankAtom (sourceRanks P) 38).ult (allOneRankAtom (sourceRanks P) 2)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (2 : Fin 78) (29 : Fin 78)
    (38 : Fin 78) (1 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (3 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (23 : Fin 78) (8 : Fin 78) (2 : Fin 78)
    (29 : Fin 78) (1 : Fin 78) (38 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3225` (kalmanson). -/
theorem middleSource_h3225 :
    ((!((allOneRankAtom (sourceRanks P) 29 == allOneRankAtom (sourceRanks P) 8)) || ((allOneRankAtom (sourceRanks P) 23).ult (allOneRankAtom (sourceRanks P) 2)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (2 : Fin 78) (29 : Fin 78)
    (23 : Fin 78) (8 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (3 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (23 : Fin 78) (8 : Fin 78) (2 : Fin 78)
    (29 : Fin 78) (1 : Fin 78) (38 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3226` (kalmanson). -/
theorem middleSource_h3226 :
    ((!((allOneRankAtom (sourceRanks P) 29 == allOneRankAtom (sourceRanks P) 23)) || ((allOneRankAtom (sourceRanks P) 8).ult (allOneRankAtom (sourceRanks P) 2)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (2 : Fin 78) (29 : Fin 78)
    (8 : Fin 78) (23 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (3 : Fin 13) (9 : Fin 13)
    (by decide) (by decide) (by decide)
    (23 : Fin 78) (8 : Fin 78) (2 : Fin 78)
    (29 : Fin 78) (1 : Fin 78) (38 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3227` (kalmanson). -/
theorem middleSource_h3227 :
    ((!((allOneRankAtom (sourceRanks P) 30 == allOneRankAtom (sourceRanks P) 1)) || ((allOneRankAtom (sourceRanks P) 39).ult (allOneRankAtom (sourceRanks P) 2)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (2 : Fin 78) (30 : Fin 78)
    (39 : Fin 78) (1 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (3 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (23 : Fin 78) (9 : Fin 78) (2 : Fin 78)
    (30 : Fin 78) (1 : Fin 78) (39 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3228` (kalmanson). -/
theorem middleSource_h3228 :
    ((!((allOneRankAtom (sourceRanks P) 2 == allOneRankAtom (sourceRanks P) 9)) || ((allOneRankAtom (sourceRanks P) 23).ult (allOneRankAtom (sourceRanks P) 30)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (30 : Fin 78) (2 : Fin 78)
    (23 : Fin 78) (9 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (3 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (23 : Fin 78) (9 : Fin 78) (2 : Fin 78)
    (30 : Fin 78) (1 : Fin 78) (39 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3229` (kalmanson). -/
theorem middleSource_h3229 :
    ((!((allOneRankAtom (sourceRanks P) 30 == allOneRankAtom (sourceRanks P) 9)) || ((allOneRankAtom (sourceRanks P) 23).ult (allOneRankAtom (sourceRanks P) 2)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (2 : Fin 78) (30 : Fin 78)
    (23 : Fin 78) (9 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (3 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (23 : Fin 78) (9 : Fin 78) (2 : Fin 78)
    (30 : Fin 78) (1 : Fin 78) (39 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3230` (kalmanson). -/
theorem middleSource_h3230 :
    ((!((allOneRankAtom (sourceRanks P) 30 == allOneRankAtom (sourceRanks P) 23)) || ((allOneRankAtom (sourceRanks P) 9).ult (allOneRankAtom (sourceRanks P) 2)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (2 : Fin 78) (30 : Fin 78)
    (9 : Fin 78) (23 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (3 : Fin 13) (10 : Fin 13)
    (by decide) (by decide) (by decide)
    (23 : Fin 78) (9 : Fin 78) (2 : Fin 78)
    (30 : Fin 78) (1 : Fin 78) (39 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3231` (kalmanson). -/
theorem middleSource_h3231 :
    ((!((allOneRankAtom (sourceRanks P) 2 == allOneRankAtom (sourceRanks P) 40)) || ((allOneRankAtom (sourceRanks P) 1).ult (allOneRankAtom (sourceRanks P) 31)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (31 : Fin 78) (2 : Fin 78)
    (1 : Fin 78) (40 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (3 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (23 : Fin 78) (10 : Fin 78) (2 : Fin 78)
    (31 : Fin 78) (1 : Fin 78) (40 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3232` (kalmanson). -/
theorem middleSource_h3232 :
    ((!((allOneRankAtom (sourceRanks P) 31 == allOneRankAtom (sourceRanks P) 1)) || ((allOneRankAtom (sourceRanks P) 40).ult (allOneRankAtom (sourceRanks P) 2)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (2 : Fin 78) (31 : Fin 78)
    (40 : Fin 78) (1 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (3 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (23 : Fin 78) (10 : Fin 78) (2 : Fin 78)
    (31 : Fin 78) (1 : Fin 78) (40 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3233` (kalmanson). -/
theorem middleSource_h3233 :
    ((!((allOneRankAtom (sourceRanks P) 31 == allOneRankAtom (sourceRanks P) 10)) || ((allOneRankAtom (sourceRanks P) 23).ult (allOneRankAtom (sourceRanks P) 2)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (2 : Fin 78) (31 : Fin 78)
    (23 : Fin 78) (10 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (3 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (23 : Fin 78) (10 : Fin 78) (2 : Fin 78)
    (31 : Fin 78) (1 : Fin 78) (40 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3234` (kalmanson). -/
theorem middleSource_h3234 :
    ((!((allOneRankAtom (sourceRanks P) 31 == allOneRankAtom (sourceRanks P) 23)) || ((allOneRankAtom (sourceRanks P) 10).ult (allOneRankAtom (sourceRanks P) 2)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (2 : Fin 78) (31 : Fin 78)
    (10 : Fin 78) (23 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (3 : Fin 13) (11 : Fin 13)
    (by decide) (by decide) (by decide)
    (23 : Fin 78) (10 : Fin 78) (2 : Fin 78)
    (31 : Fin 78) (1 : Fin 78) (40 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3235` (kalmanson). -/
theorem middleSource_h3235 :
    ((!((allOneRankAtom (sourceRanks P) 2 == allOneRankAtom (sourceRanks P) 41)) || ((allOneRankAtom (sourceRanks P) 1).ult (allOneRankAtom (sourceRanks P) 32)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (32 : Fin 78) (2 : Fin 78)
    (1 : Fin 78) (41 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (3 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (23 : Fin 78) (11 : Fin 78) (2 : Fin 78)
    (32 : Fin 78) (1 : Fin 78) (41 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3236` (kalmanson). -/
theorem middleSource_h3236 :
    ((!((allOneRankAtom (sourceRanks P) 32 == allOneRankAtom (sourceRanks P) 1)) || ((allOneRankAtom (sourceRanks P) 41).ult (allOneRankAtom (sourceRanks P) 2)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (2 : Fin 78) (32 : Fin 78)
    (41 : Fin 78) (1 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (3 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (23 : Fin 78) (11 : Fin 78) (2 : Fin 78)
    (32 : Fin 78) (1 : Fin 78) (41 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3237` (kalmanson). -/
theorem middleSource_h3237 :
    ((!((allOneRankAtom (sourceRanks P) 2 == allOneRankAtom (sourceRanks P) 11)) || ((allOneRankAtom (sourceRanks P) 23).ult (allOneRankAtom (sourceRanks P) 32)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (32 : Fin 78) (2 : Fin 78)
    (23 : Fin 78) (11 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (3 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (23 : Fin 78) (11 : Fin 78) (2 : Fin 78)
    (32 : Fin 78) (1 : Fin 78) (41 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3238` (kalmanson). -/
theorem middleSource_h3238 :
    ((!((allOneRankAtom (sourceRanks P) 32 == allOneRankAtom (sourceRanks P) 23)) || ((allOneRankAtom (sourceRanks P) 11).ult (allOneRankAtom (sourceRanks P) 2)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (2 : Fin 78) (32 : Fin 78)
    (11 : Fin 78) (23 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (3 : Fin 13) (12 : Fin 13)
    (by decide) (by decide) (by decide)
    (23 : Fin 78) (11 : Fin 78) (2 : Fin 78)
    (32 : Fin 78) (1 : Fin 78) (41 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3239` (kalmanson). -/
theorem middleSource_h3239 :
    ((!((allOneRankAtom (sourceRanks P) 3 == allOneRankAtom (sourceRanks P) 1)) || ((allOneRankAtom (sourceRanks P) 42).ult (allOneRankAtom (sourceRanks P) 25)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (25 : Fin 78) (3 : Fin 78)
    (42 : Fin 78) (1 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (4 : Fin 13) (5 : Fin 13)
    (by decide) (by decide) (by decide)
    (24 : Fin 78) (4 : Fin 78) (3 : Fin 78)
    (25 : Fin 78) (1 : Fin 78) (42 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3240` (kalmanson). -/
theorem middleSource_h3240 :
    ((!((allOneRankAtom (sourceRanks P) 3 == allOneRankAtom (sourceRanks P) 42)) || ((allOneRankAtom (sourceRanks P) 1).ult (allOneRankAtom (sourceRanks P) 25)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (25 : Fin 78) (3 : Fin 78)
    (1 : Fin 78) (42 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (4 : Fin 13) (5 : Fin 13)
    (by decide) (by decide) (by decide)
    (24 : Fin 78) (4 : Fin 78) (3 : Fin 78)
    (25 : Fin 78) (1 : Fin 78) (42 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3241` (kalmanson). -/
theorem middleSource_h3241 :
    ((!((allOneRankAtom (sourceRanks P) 25 == allOneRankAtom (sourceRanks P) 1)) || ((allOneRankAtom (sourceRanks P) 42).ult (allOneRankAtom (sourceRanks P) 3)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (3 : Fin 78) (25 : Fin 78)
    (42 : Fin 78) (1 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (4 : Fin 13) (5 : Fin 13)
    (by decide) (by decide) (by decide)
    (24 : Fin 78) (4 : Fin 78) (3 : Fin 78)
    (25 : Fin 78) (1 : Fin 78) (42 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3242` (kalmanson). -/
theorem middleSource_h3242 :
    ((!((allOneRankAtom (sourceRanks P) 25 == allOneRankAtom (sourceRanks P) 42)) || ((allOneRankAtom (sourceRanks P) 1).ult (allOneRankAtom (sourceRanks P) 3)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (3 : Fin 78) (25 : Fin 78)
    (1 : Fin 78) (42 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (4 : Fin 13) (5 : Fin 13)
    (by decide) (by decide) (by decide)
    (24 : Fin 78) (4 : Fin 78) (3 : Fin 78)
    (25 : Fin 78) (1 : Fin 78) (42 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3243` (kalmanson). -/
theorem middleSource_h3243 :
    ((!((allOneRankAtom (sourceRanks P) 3 == allOneRankAtom (sourceRanks P) 4)) || ((allOneRankAtom (sourceRanks P) 24).ult (allOneRankAtom (sourceRanks P) 25)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (25 : Fin 78) (3 : Fin 78)
    (24 : Fin 78) (4 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (4 : Fin 13) (5 : Fin 13)
    (by decide) (by decide) (by decide)
    (24 : Fin 78) (4 : Fin 78) (3 : Fin 78)
    (25 : Fin 78) (1 : Fin 78) (42 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3244` (kalmanson). -/
theorem middleSource_h3244 :
    ((!((allOneRankAtom (sourceRanks P) 3 == allOneRankAtom (sourceRanks P) 24)) || ((allOneRankAtom (sourceRanks P) 4).ult (allOneRankAtom (sourceRanks P) 25)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (25 : Fin 78) (3 : Fin 78)
    (4 : Fin 78) (24 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (4 : Fin 13) (5 : Fin 13)
    (by decide) (by decide) (by decide)
    (24 : Fin 78) (4 : Fin 78) (3 : Fin 78)
    (25 : Fin 78) (1 : Fin 78) (42 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3245` (kalmanson). -/
theorem middleSource_h3245 :
    ((!((allOneRankAtom (sourceRanks P) 25 == allOneRankAtom (sourceRanks P) 4)) || ((allOneRankAtom (sourceRanks P) 24).ult (allOneRankAtom (sourceRanks P) 3)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (3 : Fin 78) (25 : Fin 78)
    (24 : Fin 78) (4 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (4 : Fin 13) (5 : Fin 13)
    (by decide) (by decide) (by decide)
    (24 : Fin 78) (4 : Fin 78) (3 : Fin 78)
    (25 : Fin 78) (1 : Fin 78) (42 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3246` (kalmanson). -/
theorem middleSource_h3246 :
    ((!((allOneRankAtom (sourceRanks P) 25 == allOneRankAtom (sourceRanks P) 24)) || ((allOneRankAtom (sourceRanks P) 4).ult (allOneRankAtom (sourceRanks P) 3)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (3 : Fin 78) (25 : Fin 78)
    (4 : Fin 78) (24 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (4 : Fin 13) (5 : Fin 13)
    (by decide) (by decide) (by decide)
    (24 : Fin 78) (4 : Fin 78) (3 : Fin 78)
    (25 : Fin 78) (1 : Fin 78) (42 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3247` (kalmanson). -/
theorem middleSource_h3247 :
    ((!((allOneRankAtom (sourceRanks P) 3 == allOneRankAtom (sourceRanks P) 1)) || ((allOneRankAtom (sourceRanks P) 43).ult (allOneRankAtom (sourceRanks P) 26)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (26 : Fin 78) (3 : Fin 78)
    (43 : Fin 78) (1 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (4 : Fin 13) (6 : Fin 13)
    (by decide) (by decide) (by decide)
    (24 : Fin 78) (5 : Fin 78) (3 : Fin 78)
    (26 : Fin 78) (1 : Fin 78) (43 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3248` (kalmanson). -/
theorem middleSource_h3248 :
    ((!((allOneRankAtom (sourceRanks P) 3 == allOneRankAtom (sourceRanks P) 43)) || ((allOneRankAtom (sourceRanks P) 1).ult (allOneRankAtom (sourceRanks P) 26)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (26 : Fin 78) (3 : Fin 78)
    (1 : Fin 78) (43 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (4 : Fin 13) (6 : Fin 13)
    (by decide) (by decide) (by decide)
    (24 : Fin 78) (5 : Fin 78) (3 : Fin 78)
    (26 : Fin 78) (1 : Fin 78) (43 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3249` (kalmanson). -/
theorem middleSource_h3249 :
    ((!((allOneRankAtom (sourceRanks P) 26 == allOneRankAtom (sourceRanks P) 1)) || ((allOneRankAtom (sourceRanks P) 43).ult (allOneRankAtom (sourceRanks P) 3)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (3 : Fin 78) (26 : Fin 78)
    (43 : Fin 78) (1 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (4 : Fin 13) (6 : Fin 13)
    (by decide) (by decide) (by decide)
    (24 : Fin 78) (5 : Fin 78) (3 : Fin 78)
    (26 : Fin 78) (1 : Fin 78) (43 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3250` (kalmanson). -/
theorem middleSource_h3250 :
    ((!((allOneRankAtom (sourceRanks P) 26 == allOneRankAtom (sourceRanks P) 43)) || ((allOneRankAtom (sourceRanks P) 1).ult (allOneRankAtom (sourceRanks P) 3)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (3 : Fin 78) (26 : Fin 78)
    (1 : Fin 78) (43 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (4 : Fin 13) (6 : Fin 13)
    (by decide) (by decide) (by decide)
    (24 : Fin 78) (5 : Fin 78) (3 : Fin 78)
    (26 : Fin 78) (1 : Fin 78) (43 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3251` (kalmanson). -/
theorem middleSource_h3251 :
    ((!((allOneRankAtom (sourceRanks P) 3 == allOneRankAtom (sourceRanks P) 5)) || ((allOneRankAtom (sourceRanks P) 24).ult (allOneRankAtom (sourceRanks P) 26)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (26 : Fin 78) (3 : Fin 78)
    (24 : Fin 78) (5 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (4 : Fin 13) (6 : Fin 13)
    (by decide) (by decide) (by decide)
    (24 : Fin 78) (5 : Fin 78) (3 : Fin 78)
    (26 : Fin 78) (1 : Fin 78) (43 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3252` (kalmanson). -/
theorem middleSource_h3252 :
    ((!((allOneRankAtom (sourceRanks P) 3 == allOneRankAtom (sourceRanks P) 24)) || ((allOneRankAtom (sourceRanks P) 5).ult (allOneRankAtom (sourceRanks P) 26)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (26 : Fin 78) (3 : Fin 78)
    (5 : Fin 78) (24 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (4 : Fin 13) (6 : Fin 13)
    (by decide) (by decide) (by decide)
    (24 : Fin 78) (5 : Fin 78) (3 : Fin 78)
    (26 : Fin 78) (1 : Fin 78) (43 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3253` (kalmanson). -/
theorem middleSource_h3253 :
    ((!((allOneRankAtom (sourceRanks P) 26 == allOneRankAtom (sourceRanks P) 5)) || ((allOneRankAtom (sourceRanks P) 24).ult (allOneRankAtom (sourceRanks P) 3)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (3 : Fin 78) (26 : Fin 78)
    (24 : Fin 78) (5 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (4 : Fin 13) (6 : Fin 13)
    (by decide) (by decide) (by decide)
    (24 : Fin 78) (5 : Fin 78) (3 : Fin 78)
    (26 : Fin 78) (1 : Fin 78) (43 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3254` (kalmanson). -/
theorem middleSource_h3254 :
    ((!((allOneRankAtom (sourceRanks P) 26 == allOneRankAtom (sourceRanks P) 24)) || ((allOneRankAtom (sourceRanks P) 5).ult (allOneRankAtom (sourceRanks P) 3)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (3 : Fin 78) (26 : Fin 78)
    (5 : Fin 78) (24 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (4 : Fin 13) (6 : Fin 13)
    (by decide) (by decide) (by decide)
    (24 : Fin 78) (5 : Fin 78) (3 : Fin 78)
    (26 : Fin 78) (1 : Fin 78) (43 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3255` (kalmanson). -/
theorem middleSource_h3255 :
    ((!((allOneRankAtom (sourceRanks P) 3 == allOneRankAtom (sourceRanks P) 1)) || ((allOneRankAtom (sourceRanks P) 44).ult (allOneRankAtom (sourceRanks P) 27)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (27 : Fin 78) (3 : Fin 78)
    (44 : Fin 78) (1 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (4 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (24 : Fin 78) (6 : Fin 78) (3 : Fin 78)
    (27 : Fin 78) (1 : Fin 78) (44 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3256` (kalmanson). -/
theorem middleSource_h3256 :
    ((!((allOneRankAtom (sourceRanks P) 3 == allOneRankAtom (sourceRanks P) 44)) || ((allOneRankAtom (sourceRanks P) 1).ult (allOneRankAtom (sourceRanks P) 27)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (27 : Fin 78) (3 : Fin 78)
    (1 : Fin 78) (44 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (4 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (24 : Fin 78) (6 : Fin 78) (3 : Fin 78)
    (27 : Fin 78) (1 : Fin 78) (44 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3257` (kalmanson). -/
theorem middleSource_h3257 :
    ((!((allOneRankAtom (sourceRanks P) 27 == allOneRankAtom (sourceRanks P) 1)) || ((allOneRankAtom (sourceRanks P) 44).ult (allOneRankAtom (sourceRanks P) 3)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (3 : Fin 78) (27 : Fin 78)
    (44 : Fin 78) (1 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (4 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (24 : Fin 78) (6 : Fin 78) (3 : Fin 78)
    (27 : Fin 78) (1 : Fin 78) (44 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3258` (kalmanson). -/
theorem middleSource_h3258 :
    ((!((allOneRankAtom (sourceRanks P) 3 == allOneRankAtom (sourceRanks P) 6)) || ((allOneRankAtom (sourceRanks P) 24).ult (allOneRankAtom (sourceRanks P) 27)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (27 : Fin 78) (3 : Fin 78)
    (24 : Fin 78) (6 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (4 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (24 : Fin 78) (6 : Fin 78) (3 : Fin 78)
    (27 : Fin 78) (1 : Fin 78) (44 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3259` (kalmanson). -/
theorem middleSource_h3259 :
    ((!((allOneRankAtom (sourceRanks P) 3 == allOneRankAtom (sourceRanks P) 24)) || ((allOneRankAtom (sourceRanks P) 6).ult (allOneRankAtom (sourceRanks P) 27)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (27 : Fin 78) (3 : Fin 78)
    (6 : Fin 78) (24 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (4 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (24 : Fin 78) (6 : Fin 78) (3 : Fin 78)
    (27 : Fin 78) (1 : Fin 78) (44 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3260` (kalmanson). -/
theorem middleSource_h3260 :
    ((!((allOneRankAtom (sourceRanks P) 27 == allOneRankAtom (sourceRanks P) 24)) || ((allOneRankAtom (sourceRanks P) 6).ult (allOneRankAtom (sourceRanks P) 3)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (3 : Fin 78) (27 : Fin 78)
    (6 : Fin 78) (24 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (4 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (24 : Fin 78) (6 : Fin 78) (3 : Fin 78)
    (27 : Fin 78) (1 : Fin 78) (44 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Candidate middle source assertion `h3261` (kalmanson). -/
theorem middleSource_h3261 :
    ((!((allOneRankAtom (sourceRanks P) 3 == allOneRankAtom (sourceRanks P) 1)) || ((allOneRankAtom (sourceRanks P) 45).ult (allOneRankAtom (sourceRanks P) 28)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (28 : Fin 78) (3 : Fin 78)
    (45 : Fin 78) (1 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (4 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (24 : Fin 78) (7 : Fin 78) (3 : Fin 78)
    (28 : Fin 78) (1 : Fin 78) (45 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3262` (kalmanson). -/
theorem middleSource_h3262 :
    ((!((allOneRankAtom (sourceRanks P) 3 == allOneRankAtom (sourceRanks P) 45)) || ((allOneRankAtom (sourceRanks P) 1).ult (allOneRankAtom (sourceRanks P) 28)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (28 : Fin 78) (3 : Fin 78)
    (1 : Fin 78) (45 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (4 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (24 : Fin 78) (7 : Fin 78) (3 : Fin 78)
    (28 : Fin 78) (1 : Fin 78) (45 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Candidate middle source assertion `h3263` (kalmanson). -/
theorem middleSource_h3263 :
    ((!((allOneRankAtom (sourceRanks P) 28 == allOneRankAtom (sourceRanks P) 1)) || ((allOneRankAtom (sourceRanks P) 45).ult (allOneRankAtom (sourceRanks P) 3)))) = true := by
  apply allOne_kalmanson_rank_guard P
    (3 : Fin 78) (28 : Fin 78)
    (45 : Fin 78) (1 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (2 : Fin 13) (4 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (24 : Fin 78) (7 : Fin 78) (3 : Fin 78)
    (28 : Fin 78) (1 : Fin 78) (45 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

end

end ATailExactFiveCard13AllOneSourceIngressScratch
end Problem97
