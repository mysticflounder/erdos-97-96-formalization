/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FirstApexCriticalFiberRow
import Erdos9796Proof.P97.ATail.CapCrossingKalmanson
import Erdos9796Proof.P97.CapSelectedRowCounting

/-!
# Source-faithful closing contract for a first-apex critical fiber

This scratch module states the exact output expected from the missing
full-geometry producer.  The producer must choose a nontrivial blocker fiber
and then return either an ordered three-row core or a same-cap two-center core.
Both outputs have immediate checked consumers below.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailCriticalFiberConsumerMatchScratch

open ATailCriticalPairFrontier
open ATailOrientedPhysicalApexIngress
open ATailFirstApexCriticalFiber
open CapCrossingKalmansonBridge

attribute [local instance] Classical.propDecidable

/-- `C,K` are the two sources of `P`, with either orientation allowed. -/
def IsFiberOrientation
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : FrontierCommonDeletionCriticalFiber R) (C K : ℝ²) : Prop :=
  (C = P.source₁.1 ∧ K = P.source₂.1) ∨
    (C = P.source₂.1 ∧ K = P.source₁.1)

namespace IsFiberOrientation

theorem left_mem_A
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {P : FrontierCommonDeletionCriticalFiber R} {C K : ℝ²}
    (h : IsFiberOrientation P C K) : C ∈ D.A := by
  rcases h with ⟨rfl, _⟩ | ⟨rfl, _⟩
  · exact P.source₁.2
  · exact P.source₂.2

theorem right_mem_A
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {P : FrontierCommonDeletionCriticalFiber R} {C K : ℝ²}
    (h : IsFiberOrientation P C K) : K ∈ D.A := by
  rcases h with ⟨_, rfl⟩ | ⟨_, rfl⟩
  · exact P.source₂.2
  · exact P.source₁.2

theorem ne
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {P : FrontierCommonDeletionCriticalFiber R} {C K : ℝ²}
    (h : IsFiberOrientation P C K) : C ≠ K := by
  rcases h with ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩
  · exact P.source_points_ne
  · exact P.source_points_ne.symm

theorem commonBlocker_equidistant
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {P : FrontierCommonDeletionCriticalFiber R} {C K : ℝ²}
    (h : IsFiberOrientation P C K) :
    dist (H.centerAt P.source₁.1 P.source₁.2) C =
      dist (H.centerAt P.source₁.1 P.source₁.2) K := by
  have hsource₁ :
      P.source₁.1 ∈
        (H.selectedAt P.source₁.1 P.source₁.2).toCriticalFourShell.support :=
    (H.selectedAt P.source₁.1 P.source₁.2).toCriticalFourShell.q_mem_support
  have hsource₂ :
      P.source₂.1 ∈
        (H.selectedAt P.source₁.1 P.source₁.2).toCriticalFourShell.support :=
    P.source₂_mem_commonSupport
  rcases h with ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩
  · exact
      (H.selectedAt P.source₁.1 P.source₁.2).toCriticalFourShell.support_eq_radius
        P.source₁.1 hsource₁
      |>.trans
        ((H.selectedAt P.source₁.1
            P.source₁.2).toCriticalFourShell.support_eq_radius
          P.source₂.1 hsource₂).symm
  · exact
      (H.selectedAt P.source₁.1 P.source₁.2).toCriticalFourShell.support_eq_radius
        P.source₂.1 hsource₂
      |>.trans
        ((H.selectedAt P.source₁.1
            P.source₁.2).toCriticalFourShell.support_eq_radius
          P.source₁.1 hsource₁).symm

end IsFiberOrientation

/-- Ordered source-indexed terminal.

The chosen fiber supplies the `A`-row equality on `C,K`.  The source `J`
supplies the actual center `X` and its own `X`-row membership; the only new
cross membership is `K` in that exact row. -/
structure OrderedCrossRowCore
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : FrontierCommonDeletionCriticalFiber R) : Type where
  C : ℝ²
  K : ℝ²
  fiber_orientation : IsFiberOrientation P C K
  J : ℝ²
  J_mem_A : J ∈ D.A
  boundary : Fin D.A.card → ℝ²
  boundary_injective : Function.Injective boundary
  boundary_image : Finset.univ.image boundary = D.A
  boundary_ccw : EuclideanGeometry.IsCcwConvexPolygon boundary
  iO : Fin D.A.card
  iA : Fin D.A.card
  iX : Fin D.A.card
  iJ : Fin D.A.card
  iC : Fin D.A.card
  iK : Fin D.A.card
  hOA : iO < iA
  hAX : iA < iX
  hXJ : iX < iJ
  hJC : iJ < iC
  hCK : iC < iK
  boundary_O : boundary iO = S.oppApex1
  boundary_A :
    boundary iA = H.centerAt P.source₁.1 P.source₁.2
  boundary_X : boundary iX = H.centerAt J J_mem_A
  boundary_J : boundary iJ = J
  boundary_C : boundary iC = C
  boundary_K : boundary iK = K
  robust_equidistant : dist S.oppApex1 J = dist S.oppApex1 C
  K_mem_J_shell :
    K ∈ (H.selectedAt J J_mem_A).toCriticalFourShell.support

/-- The ordered critical-fiber core is immediately contradictory. -/
theorem OrderedCrossRowCore.false
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {P : FrontierCommonDeletionCriticalFiber R}
    (Q : OrderedCrossRowCore P) : False := by
  have hOJ_eq_OC :
      dist (Q.boundary Q.iO) (Q.boundary Q.iJ) =
        dist (Q.boundary Q.iO) (Q.boundary Q.iC) := by
    simpa only [Q.boundary_O, Q.boundary_J, Q.boundary_C] using
      Q.robust_equidistant
  have hAJ_lt_AC :
      dist (Q.boundary Q.iA) (Q.boundary Q.iJ) <
        dist (Q.boundary Q.iA) (Q.boundary Q.iC) :=
    dist_lt_of_ccw_of_dist_diagonal_eq_side D.convex
      Q.boundary_injective Q.boundary_image Q.boundary_ccw
      Q.hOA (Q.hAX.trans Q.hXJ) Q.hJC hOJ_eq_OC
  have hXJ_eq_XK :
      dist (Q.boundary Q.iX) (Q.boundary Q.iJ) =
        dist (Q.boundary Q.iX) (Q.boundary Q.iK) := by
    have hJ :
        Q.J ∈
          (H.selectedAt Q.J Q.J_mem_A).toCriticalFourShell.support :=
      (H.selectedAt Q.J Q.J_mem_A).toCriticalFourShell.q_mem_support
    have hEq :
        dist (H.centerAt Q.J Q.J_mem_A) Q.J =
          dist (H.centerAt Q.J Q.J_mem_A) Q.K :=
      (H.selectedAt Q.J Q.J_mem_A).toCriticalFourShell.support_eq_radius
        Q.J hJ
      |>.trans
        ((H.selectedAt Q.J Q.J_mem_A).toCriticalFourShell.support_eq_radius
          Q.K Q.K_mem_J_shell).symm
    simpa only [Q.boundary_X, Q.boundary_J, Q.boundary_K] using hEq
  have hAC_eq_AK :
      dist (Q.boundary Q.iA) (Q.boundary Q.iC) =
        dist (Q.boundary Q.iA) (Q.boundary Q.iK) := by
    simpa only [Q.boundary_A, Q.boundary_C, Q.boundary_K] using
      Q.fiber_orientation.commonBlocker_equidistant
  have hkal :=
    dist_add_dist_lt_diagonal_sum_of_ccw D.convex
      Q.boundary_injective Q.boundary_image Q.boundary_ccw
      Q.hAX Q.hXJ (Q.hJC.trans Q.hCK)
  linarith

/-- Source-faithful origin of the second center in a same-cap terminal.

Either it is the robust first apex itself, or it is the actual chosen blocker
of another source `J` whose exact critical row contains both fiber sources. -/
def HasSourceFaithfulSecondCenter
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (_P : FrontierCommonDeletionCriticalFiber R)
    (C K secondCenter : ℝ²) : Prop :=
  (secondCenter = S.oppApex1 ∧
      dist S.oppApex1 C = dist S.oppApex1 K) ∨
    ∃ (J : ℝ²) (hJ : J ∈ D.A),
      secondCenter = H.centerAt J hJ ∧
        C ∈ (H.selectedAt J hJ).toCriticalFourShell.support ∧
        K ∈ (H.selectedAt J hJ).toCriticalFourShell.support

/-- Same-cap source-indexed terminal for the collision pair itself. -/
structure SameCapCollisionPairCore
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : FrontierCommonDeletionCriticalFiber R) : Type where
  C : ℝ²
  K : ℝ²
  fiber_orientation : IsFiberOrientation P C K
  capIndex : Fin 3
  secondCenter : ℝ²
  commonBlocker_mem_cap :
    H.centerAt P.source₁.1 P.source₁.2 ∈ S.capByIndex capIndex
  secondCenter_mem_cap : secondCenter ∈ S.capByIndex capIndex
  secondCenter_ne_commonBlocker :
    secondCenter ≠ H.centerAt P.source₁.1 P.source₁.2
  C_not_mem_cap : C ∉ S.capByIndex capIndex
  K_not_mem_cap : K ∉ S.capByIndex capIndex
  source_faithful_secondCenter :
    HasSourceFaithfulSecondCenter P C K secondCenter

namespace SameCapCollisionPairCore

theorem secondCenter_equidistant
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {P : FrontierCommonDeletionCriticalFiber R}
    (Q : SameCapCollisionPairCore P) :
    dist Q.secondCenter Q.C = dist Q.secondCenter Q.K := by
  rcases Q.source_faithful_secondCenter with hfirst | hcritical
  · rcases hfirst with ⟨hcenter, hEq⟩
    simpa only [hcenter] using hEq
  · rcases hcritical with ⟨J, hJ, hcenter, hC, hK⟩
    have hEq :=
      (H.selectedAt J hJ).toCriticalFourShell.support_eq_radius Q.C hC
      |>.trans
        ((H.selectedAt J hJ).toCriticalFourShell.support_eq_radius Q.K hK).symm
    simpa only [hcenter] using hEq

/-- The same-cap collision-pair core is immediately contradictory. -/
theorem false
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {P : FrontierCommonDeletionCriticalFiber R}
    (Q : SameCapCollisionPairCore P) : False := by
  rcases S.capByIndex_cgn4g_capData D.convex Q.capIndex with
    ⟨m, L, Packet, _Hside, Hord, hcap⟩
  have hcommonImage :
      H.centerAt P.source₁.1 P.source₁.2 ∈
        Finset.univ.image L.points := by
    rw [hcap]
    exact Q.commonBlocker_mem_cap
  have hsecondImage :
      Q.secondCenter ∈ Finset.univ.image L.points := by
    rw [hcap]
    exact Q.secondCenter_mem_cap
  rcases Finset.mem_image.mp hcommonImage with ⟨i, _hi, hiCommon⟩
  rcases Finset.mem_image.mp hsecondImage with ⟨j, _hj, hjSecond⟩
  have hij : i ≠ j := by
    intro hij
    apply Q.secondCenter_ne_commonBlocker
    calc
      Q.secondCenter = L.points j := hjSecond.symm
      _ = L.points i := by rw [hij]
      _ = H.centerAt P.source₁.1 P.source₁.2 := hiCommon
  have hCOutside : Q.C ∉ Finset.univ.image L.points := by
    simpa only [hcap] using Q.C_not_mem_cap
  have hKOutside : Q.K ∉ Finset.univ.image L.points := by
    simpa only [hcap] using Q.K_not_mem_cap
  have hcommonEq :
      dist (H.centerAt P.source₁.1 P.source₁.2) Q.C =
        dist (H.centerAt P.source₁.1 P.source₁.2) Q.K :=
    Q.fiber_orientation.commonBlocker_equidistant
  rcases lt_or_gt_of_ne hij with hij | hji
  · exact CapSelectedRowCounting.outsidePair_unique_capCenter
      D.convex Hord Packet.mem_A hij
      Q.fiber_orientation.left_mem_A Q.fiber_orientation.right_mem_A
      hCOutside hKOutside Q.fiber_orientation.ne
      (by simpa only [hiCommon] using hcommonEq)
      (by simpa only [hjSecond] using Q.secondCenter_equidistant)
  · exact CapSelectedRowCounting.outsidePair_unique_capCenter
      D.convex Hord Packet.mem_A hji
      Q.fiber_orientation.left_mem_A Q.fiber_orientation.right_mem_A
      hCOutside hKOutside Q.fiber_orientation.ne
      (by simpa only [hjSecond] using Q.secondCenter_equidistant)
      (by simpa only [hiCommon] using hcommonEq)

end SameCapCollisionPairCore

/-- The exact output contract for the missing full-geometry producer.

Crucially, each constructor contains the chosen critical fiber.  The producer
therefore chooses the repeated blocker fiber after inspecting the full parent
geometry; callers do not pass an arbitrary pigeonhole witness. -/
inductive CriticalFiberClosingCore
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionParentResidual F) : Type
  | ordered
      (P : FrontierCommonDeletionCriticalFiber R)
      (core : OrderedCrossRowCore P)
  | sameCap
      (P : FrontierCommonDeletionCriticalFiber R)
      (core : SameCapCollisionPairCore P)

/-- Every output allowed by the closing contract is already contradictory. -/
theorem false_of_criticalFiberClosingCore
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F} :
    CriticalFiberClosingCore R → False := by
  intro core
  cases core with
  | ordered _ Q => exact Q.false
  | sameCap _ Q => exact Q.false

#print axioms IsFiberOrientation.commonBlocker_equidistant
#print axioms OrderedCrossRowCore.false
#print axioms SameCapCollisionPairCore.false
#print axioms false_of_criticalFiberClosingCore

end ATailCriticalFiberConsumerMatchScratch
end Problem97
