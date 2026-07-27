/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import scratch.ExactFourRigid221SourceEqUVRowOtherUHeavyExactFivePlacementXuPeerXv

/-!
# The proposed reverse comparison in the exact-five `xu/xv` placement

The full concrete placement data force
`dist omittedPeer goodSource < dist u goodSource`.  Consequently the proposed
reverse weak comparison is not a further consequence waiting to be extracted:
under exactly these hypotheses, it is equivalent to `False`.

The final declarations give an exact rational planar consistency model for the
local boundary geometry: the apex, source, blocker, and companion form a
strictly convex boundary in the required order; the latter three lie on one
circle about the apex; the blocker bisects the source--companion pair; and the
reverse comparison fails.
-/

namespace Problem97
namespace ATailFrontierLiveClosure

open scoped EuclideanGeometry

open ATailCriticalPairFrontier
open ATailExactFourPhysicalConsumer
open ATailUniqueArmRouteAuditScratch
open ATailUniqueFourLateChoiceTerminalScratch

attribute [local instance] Classical.propDecidable

set_option maxHeartbeats 2000000

/-- With the full terminal and regenerated-source data specialized to
`goodSource = xu` and `omittedPeer = xv`, the proposed reverse weak comparison
is logically equivalent to closure of the entire branch.  In particular it
cannot serve as an independently derived geometric bridge without already
proving `False`. -/
theorem
    exactFourRigid221_sourceEqU_blockerVRowOther_uHeavy_exactFive_placement_xu_peer_xv_reverse_iff_false
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (xu xv : ℝ²)
    (terminal :
      ExactFourRigid221SourceEqUTerminal
        R P.rho P.u P.other P.v P.jointDeletion
          P.globalDeletion xu xv)
    (blocker_eq :
      (lateFirstApexSystem R).centerAt P.source.1 P.source.2 = xv)
    (pair_interior :
      ({P.u.1, xu} : Finset ℝ²) ∩
          S.capInteriorByIndex S.oppIndex2 =
        {P.u.1, xu})
    (blocker_interior :
      (lateFirstApexSystem R).centerAt P.u.1 P.u.2 ∈
        S.capInteriorByIndex S.oppIndex2)
    (interior_card_eq_three :
      (S.capInteriorByIndex S.oppIndex2).card = 3)
    (goodSource : CarrierVertex D.A)
    (Q : ExactFourRigid221UHeavyExactFiveGoodSourceRestart P goodSource)
    (hgoodXu : goodSource.1 = xu)
    (hpeerXv : Q.omittedPeer.1 = xv) :
    (dist P.u.1 goodSource.1 ≤
        dist Q.omittedPeer.1 goodSource.1) ↔ False := by
  have hplacement :=
    exactFourRigid221_sourceEqU_blockerVRowOther_uHeavy_exactFive_placement_xu_peer_xv
      P xu xv terminal blocker_eq pair_interior blocker_interior
        interior_card_eq_three goodSource Q hgoodXu hpeerXv
  constructor
  · exact hplacement.2.2.2.2.2.2.1
  · exact False.elim

/-- A rational point of the project plane. -/
noncomputable def xuPeerXvReverseModelPt (x y : ℝ) : ℝ² := !₂[x, y]

noncomputable def xuPeerXvReverseModelApex : ℝ² :=
  xuPeerXvReverseModelPt 0 0

noncomputable def xuPeerXvReverseModelSource : ℝ² :=
  xuPeerXvReverseModelPt 1 0

noncomputable def xuPeerXvReverseModelBlocker : ℝ² :=
  xuPeerXvReverseModelPt (3 / 5) (-4 / 5)

noncomputable def xuPeerXvReverseModelCompanion : ℝ² :=
  xuPeerXvReverseModelPt (-7 / 25) (-24 / 25)

/-- The project-CCW boundary order is apex, source, blocker, companion. -/
noncomputable def xuPeerXvReverseModelBoundary : Fin 4 → ℝ² :=
  ![xuPeerXvReverseModelApex, xuPeerXvReverseModelSource,
    xuPeerXvReverseModelBlocker, xuPeerXvReverseModelCompanion]

private noncomputable def xuPeerXvReverseModelSqDist
    (x y : ℝ²) : ℝ :=
  (x 0 - y 0) ^ 2 + (x 1 - y 1) ^ 2

private theorem xuPeerXvReverseModel_dist_sq (x y : ℝ²) :
    dist x y ^ 2 = xuPeerXvReverseModelSqDist x y := by
  rw [EuclideanSpace.dist_sq_eq]
  simp [xuPeerXvReverseModelSqDist, Fin.sum_univ_two,
    Real.dist_eq, sq_abs]

private theorem xuPeerXvReverseModel_dist_eq_of_sqDist_eq
    {x y z w : ℝ²}
    (h :
      xuPeerXvReverseModelSqDist x y =
        xuPeerXvReverseModelSqDist z w) :
    dist x y = dist z w := by
  apply (sq_eq_sq₀ dist_nonneg dist_nonneg).mp
  rw [xuPeerXvReverseModel_dist_sq, xuPeerXvReverseModel_dist_sq]
  exact h

theorem xuPeerXvReverseModel_boundary_injective :
    Function.Injective xuPeerXvReverseModelBoundary := by
  intro i j hij
  fin_cases i <;> fin_cases j
  all_goals
    first
    | rfl
    | norm_num [xuPeerXvReverseModelBoundary,
        xuPeerXvReverseModelApex, xuPeerXvReverseModelSource,
        xuPeerXvReverseModelBlocker, xuPeerXvReverseModelCompanion,
        xuPeerXvReverseModelPt] at hij

theorem xuPeerXvReverseModel_boundary_ccw :
    EuclideanGeometry.IsCcwConvexPolygon
      xuPeerXvReverseModelBoundary := by
  apply ccw_of_hneg xuPeerXvReverseModel_boundary_injective
  intro i j k hij hjk
  fin_cases i <;> fin_cases j <;> fin_cases k
  all_goals norm_num at hij
  all_goals norm_num at hjk
  all_goals
    norm_num [xuPeerXvReverseModelBoundary,
      xuPeerXvReverseModelApex, xuPeerXvReverseModelSource,
      xuPeerXvReverseModelBlocker, xuPeerXvReverseModelCompanion,
      xuPeerXvReverseModelPt, signedArea2]

/-- Exact rational planar consistency model for all local geometric facts used
by the proposed reverse step.  The source, blocker, and companion have equal
apex radius, the blocker is strictly between the other two boundary indices
and is equidistant from them, yet the reverse weak comparison is false. -/
theorem xuPeerXvReverseModel_local_terminal_geometry :
    (1 : Fin 4) < 2 ∧
      (2 : Fin 4) < 3 ∧
      dist xuPeerXvReverseModelApex
          xuPeerXvReverseModelSource =
        dist xuPeerXvReverseModelApex
          xuPeerXvReverseModelBlocker ∧
      dist xuPeerXvReverseModelApex
          xuPeerXvReverseModelBlocker =
        dist xuPeerXvReverseModelApex
          xuPeerXvReverseModelCompanion ∧
      dist xuPeerXvReverseModelBlocker
          xuPeerXvReverseModelSource =
        dist xuPeerXvReverseModelBlocker
          xuPeerXvReverseModelCompanion ∧
      dist xuPeerXvReverseModelBlocker
          xuPeerXvReverseModelCompanion <
        dist xuPeerXvReverseModelSource
          xuPeerXvReverseModelCompanion ∧
      ¬ dist xuPeerXvReverseModelSource
          xuPeerXvReverseModelCompanion ≤
        dist xuPeerXvReverseModelBlocker
          xuPeerXvReverseModelCompanion := by
  have hapexSourceBlocker :
      dist xuPeerXvReverseModelApex xuPeerXvReverseModelSource =
        dist xuPeerXvReverseModelApex
          xuPeerXvReverseModelBlocker := by
    apply xuPeerXvReverseModel_dist_eq_of_sqDist_eq
    norm_num [xuPeerXvReverseModelSqDist,
      xuPeerXvReverseModelApex, xuPeerXvReverseModelSource,
      xuPeerXvReverseModelBlocker, xuPeerXvReverseModelPt]
  have hapexBlockerCompanion :
      dist xuPeerXvReverseModelApex xuPeerXvReverseModelBlocker =
        dist xuPeerXvReverseModelApex
          xuPeerXvReverseModelCompanion := by
    apply xuPeerXvReverseModel_dist_eq_of_sqDist_eq
    norm_num [xuPeerXvReverseModelSqDist,
      xuPeerXvReverseModelApex, xuPeerXvReverseModelBlocker,
      xuPeerXvReverseModelCompanion, xuPeerXvReverseModelPt]
  have hblockerBisects :
      dist xuPeerXvReverseModelBlocker xuPeerXvReverseModelSource =
        dist xuPeerXvReverseModelBlocker
          xuPeerXvReverseModelCompanion := by
    apply xuPeerXvReverseModel_dist_eq_of_sqDist_eq
    norm_num [xuPeerXvReverseModelSqDist,
      xuPeerXvReverseModelSource, xuPeerXvReverseModelBlocker,
      xuPeerXvReverseModelCompanion, xuPeerXvReverseModelPt]
  have hlegSq :
      dist xuPeerXvReverseModelBlocker
          xuPeerXvReverseModelCompanion ^ 2 = 4 / 5 := by
    rw [xuPeerXvReverseModel_dist_sq]
    norm_num [xuPeerXvReverseModelSqDist,
      xuPeerXvReverseModelBlocker, xuPeerXvReverseModelCompanion,
      xuPeerXvReverseModelPt]
  have hbaseSq :
      dist xuPeerXvReverseModelSource
          xuPeerXvReverseModelCompanion ^ 2 = 64 / 25 := by
    rw [xuPeerXvReverseModel_dist_sq]
    norm_num [xuPeerXvReverseModelSqDist,
      xuPeerXvReverseModelSource, xuPeerXvReverseModelCompanion,
      xuPeerXvReverseModelPt]
  have hstrict :
      dist xuPeerXvReverseModelBlocker
          xuPeerXvReverseModelCompanion <
        dist xuPeerXvReverseModelSource
          xuPeerXvReverseModelCompanion := by
    have hlegNonneg :
        0 ≤ dist xuPeerXvReverseModelBlocker
          xuPeerXvReverseModelCompanion := dist_nonneg
    have hbaseNonneg :
        0 ≤ dist xuPeerXvReverseModelSource
          xuPeerXvReverseModelCompanion := dist_nonneg
    nlinarith
  exact
    ⟨by decide, by decide, hapexSourceBlocker,
      hapexBlockerCompanion, hblockerBisects, hstrict,
      not_le_of_gt hstrict⟩

#print axioms
  exactFourRigid221_sourceEqU_blockerVRowOther_uHeavy_exactFive_placement_xu_peer_xv_reverse_iff_false

#print axioms xuPeerXvReverseModel_boundary_injective

#print axioms xuPeerXvReverseModel_boundary_ccw

#print axioms xuPeerXvReverseModel_local_terminal_geometry

end ATailFrontierLiveClosure
end Problem97
