/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CriticalFiberClosingCore
import Erdos9796Proof.P97.ATail.CriticalFiberRetainedRadiusSelector

/-!
# A different-pair continuation of a retained blocker collision

The collision pair itself cannot acquire a genuinely third actual center.
This file records the next smaller source-valid Kalmanson packet: choose a
fresh point `J` on a first-apex row through one collision source `C`, and ask
that `J`'s actual critical row contain the other collision source `K`.

The boundary order `O < J < C < A < X < K` is compatible with the mandatory
alternation of `C,K` across the first apex `O` and common blocker `A`.  In
that order the three equalities centered at `O,A,X` form a two-edge ordinal
cycle.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailRetainedCollisionDifferentPairScratch

open ATailCriticalPairFrontier
open ATailOrientedPhysicalApexIngress
open ATailFirstApexCriticalFiber
open ATailFirstApexCriticalFiberRow
open ATailCriticalFiberClosingCore
open ATailCriticalFiberRetainedRadiusSelector
open CapCrossingKalmansonBridge

attribute [local instance] Classical.propDecidable

private theorem exists_support_point_ne_pair
    {A : Finset ℝ²} {center a b : ℝ²}
    (row : SelectedFourClass A center) (hab : a ≠ b) :
    ∃ J ∈ row.support, J ≠ a ∧ J ≠ b := by
  by_contra hnone
  push_neg at hnone
  have hsub : row.support ⊆ ({a, b} : Finset ℝ²) := by
    intro J hJ
    by_cases hJa : J = a
    · simp [hJa]
    · have hJb : J = b := hnone J hJ hJa
      simp [hJb]
  have hcard := Finset.card_le_card hsub
  rw [row.support_card] at hcard
  simp [hab] at hcard

/-- The part supplied automatically by `RetainedRadiusCollision.nonempty_rowHit`,
strengthened only by choosing its other point away from both collision sources. -/
structure FreshFirstApexRowPoint
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (Q : RetainedRadiusCollision (R := R)) : Type where
  C : ℝ²
  K : ℝ²
  fiber_orientation : IsFiberOrientation Q.fiber C K
  row : SelectedFourClass D.A S.oppApex1
  C_mem_row : C ∈ row.support
  J : ℝ²
  J_mem_row : J ∈ row.support
  J_ne_C : J ≠ C
  J_ne_K : J ≠ K

/-- A retained collision automatically supplies a fresh first-apex equality
pair `OJ = OC`.  It does not yet supply any equality centered away from the
first apex and common blocker. -/
theorem nonempty_freshFirstApexRowPoint
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (Q : RetainedRadiusCollision (R := R)) :
    Nonempty (FreshFirstApexRowPoint Q) := by
  rcases Q.nonempty_rowHit with ⟨hit⟩
  rcases exists_support_point_ne_pair hit.row Q.fiber.source_points_ne with
    ⟨J, hJ, hJSource₁, hJSource₂⟩
  rcases hit.hitSource_is_fiber_source with hhit | hhit
  · exact ⟨{
      C := Q.fiber.source₁.1
      K := Q.fiber.source₂.1
      fiber_orientation := Or.inl ⟨rfl, rfl⟩
      row := hit.row
      C_mem_row := by simpa only [← hhit] using hit.hitSource_mem_row
      J := J
      J_mem_row := hJ
      J_ne_C := hJSource₁
      J_ne_K := hJSource₂ }⟩
  · exact ⟨{
      C := Q.fiber.source₂.1
      K := Q.fiber.source₁.1
      fiber_orientation := Or.inr ⟨rfl, rfl⟩
      row := hit.row
      C_mem_row := by simpa only [← hhit] using hit.hitSource_mem_row
      J := J
      J_mem_row := hJ
      J_ne_C := hJSource₂
      J_ne_K := hJSource₁ }⟩

/-- The narrow source-valid different-pair packet which reaches a Kalmanson
terminal.  The sole cross-row incidence is `K` in the actual critical row of
the fresh first-apex point `J`; membership of `J` in that row is definitional
for the retained `CriticalShellSystem`.

The displayed order is one of the alternation-compatible cyclic orders, not
the incompatible `O < A < X < J < C < K` order of the older terminal. -/
structure OrderedDifferentPairCrossHit
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (Q : RetainedRadiusCollision (R := R)) : Type where
  fresh : FreshFirstApexRowPoint Q
  J_mem_A : fresh.J ∈ D.A
  K_mem_J_shell :
    fresh.K ∈
      (H.selectedAt fresh.J J_mem_A).toCriticalFourShell.support
  boundary : Fin D.A.card → ℝ²
  boundary_injective : Function.Injective boundary
  boundary_image : Finset.univ.image boundary = D.A
  boundary_ccw : EuclideanGeometry.IsCcwConvexPolygon boundary
  iO : Fin D.A.card
  iJ : Fin D.A.card
  iC : Fin D.A.card
  iA : Fin D.A.card
  iX : Fin D.A.card
  iK : Fin D.A.card
  hOJ : iO < iJ
  hJC : iJ < iC
  hCA : iC < iA
  hAX : iA < iX
  hXK : iX < iK
  boundary_O : boundary iO = S.oppApex1
  boundary_J : boundary iJ = fresh.J
  boundary_C : boundary iC = fresh.C
  boundary_A :
    boundary iA = H.centerAt Q.fiber.source₁.1 Q.fiber.source₁.2
  boundary_X : boundary iX = H.centerAt fresh.J J_mem_A
  boundary_K : boundary iK = fresh.K

/-- The alternation-compatible different-pair packet is contradictory by two
strict Kalmanson comparisons: `AC < AJ` from the `O`-row and `AJ < AC` from
the `X`- and `A`-rows. -/
theorem OrderedDifferentPairCrossHit.false
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {Q : RetainedRadiusCollision (R := R)}
    (P : OrderedDifferentPairCrossHit Q) : False := by
  have hOJ_eq_OC :
      dist (P.boundary P.iO) (P.boundary P.iJ) =
        dist (P.boundary P.iO) (P.boundary P.iC) := by
    have hEq :=
      (P.fresh.row.support_eq_radius P.fresh.J P.fresh.J_mem_row).trans
        (P.fresh.row.support_eq_radius P.fresh.C P.fresh.C_mem_row).symm
    simpa only [P.boundary_O, P.boundary_J, P.boundary_C] using hEq
  have hAC_lt_AJ :
      dist (P.boundary P.iA) (P.boundary P.iC) <
        dist (P.boundary P.iA) (P.boundary P.iJ) := by
    have hkal :=
      complementary_dist_add_dist_lt_diagonal_sum_of_ccw D.convex
        P.boundary_injective P.boundary_image P.boundary_ccw
        P.hOJ P.hJC P.hCA
    have hkal' :
        dist (P.boundary P.iO) (P.boundary P.iJ) +
            dist (P.boundary P.iC) (P.boundary P.iA) <
          dist (P.boundary P.iO) (P.boundary P.iC) +
            dist (P.boundary P.iJ) (P.boundary P.iA) := hkal
    rw [dist_comm (P.boundary P.iJ) (P.boundary P.iA),
      dist_comm (P.boundary P.iC) (P.boundary P.iA)] at hkal'
    linarith
  have hXJ_eq_XK :
      dist (P.boundary P.iX) (P.boundary P.iJ) =
        dist (P.boundary P.iX) (P.boundary P.iK) := by
    have hEq :=
      (H.selectedAt P.fresh.J P.J_mem_A).toCriticalFourShell.support_eq_radius
        P.fresh.J
        (H.selectedAt P.fresh.J P.J_mem_A).toCriticalFourShell.q_mem_support
      |>.trans
        ((H.selectedAt P.fresh.J
          P.J_mem_A).toCriticalFourShell.support_eq_radius
            P.fresh.K P.K_mem_J_shell).symm
    simpa only [P.boundary_X, P.boundary_J, P.boundary_K] using hEq
  have hAC_eq_AK :
      dist (P.boundary P.iA) (P.boundary P.iC) =
        dist (P.boundary P.iA) (P.boundary P.iK) := by
    simpa only [P.boundary_A, P.boundary_C, P.boundary_K] using
      P.fresh.fiber_orientation.commonBlocker_equidistant
  have hAJ_lt_AC :
      dist (P.boundary P.iA) (P.boundary P.iJ) <
        dist (P.boundary P.iA) (P.boundary P.iC) := by
    have hkal :=
      complementary_dist_add_dist_lt_diagonal_sum_of_ccw D.convex
        P.boundary_injective P.boundary_image P.boundary_ccw
        (P.hJC.trans P.hCA) P.hAX P.hXK
    have hkal' :
        dist (P.boundary P.iJ) (P.boundary P.iA) +
            dist (P.boundary P.iX) (P.boundary P.iK) <
          dist (P.boundary P.iJ) (P.boundary P.iX) +
            dist (P.boundary P.iA) (P.boundary P.iK) := hkal
    rw [dist_comm (P.boundary P.iJ) (P.boundary P.iX),
      dist_comm (P.boundary P.iJ) (P.boundary P.iA),
      ← hXJ_eq_XK, ← hAC_eq_AK] at hkal'
    linarith
  exact (not_lt_of_ge hAC_lt_AJ.le) hAJ_lt_AC

#print axioms nonempty_freshFirstApexRowPoint
#print axioms OrderedDifferentPairCrossHit.false

end ATailRetainedCollisionDifferentPairScratch
end Problem97
