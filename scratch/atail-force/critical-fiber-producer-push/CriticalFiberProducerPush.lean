/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.RetainedStrictInteriorParentNormalForm

/-!
# Critical-fiber producer: exact endpoint-order reduction

The retained strict-interior normal form has one branch which already supplies
all row and metric data of `CriticalFiberClosingCore.ordered`: an endpoint
critical fiber, a genuinely fresh point on its first-apex row, and the positive
cross hit in that fresh point's actual critical shell.

This file isolates the only remaining input on that branch: the six named
roles must occur in the order required by the production Kalmanson consumer.
The other terminal-surface branches are retained literally rather than being
silently classified as closing cores.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailCriticalFiberProducerPushScratch

open ATailCriticalFiberClosingCore
open ATailCommonDeletionTwoCenter
open ATailCriticalPairFrontier
open ATailFirstApexCriticalFiber
open ATailOrientedPhysicalApexIngress
open ATailRetainedMatchingCommonDeletionCycle
open ATailRetainedMatchingEndpointContinuation
open ATailRetainedMatchingSourceReturnRadiusSplit
open ATailRetainedStrictInteriorParentNormalForm
open ATailRetainedStrictInteriorPairSelector
open ATailLocalizedCollisionMutualOmissionCycle

attribute [local instance] Classical.propDecidable

/-- The sole additional datum needed to turn an endpoint-fiber cross hit into
the production ordered closing core.  All six roles are fixed by the live
source data; this structure contains only their common boundary placement. -/
structure EndpointOrderedBoundaryPlacement
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {W : RetainedMatchingTwoStepCommonDeletionWalk R}
    {E : RetainedMatchingEndpointCriticalFiber W}
    (P : EndpointFreshFirstApexRowSource E) : Type where
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
    boundary iA = H.centerAt E.fiber.source₁.1 E.fiber.source₁.2
  boundary_X : boundary iX = H.centerAt P.J P.J_mem_A
  boundary_J : boundary iJ = P.J
  boundary_C : boundary iC = P.C
  boundary_K : boundary iK = P.K

/-- Coarse same-side placement for the endpoint equal-radius triangle.

Unlike `EndpointOrderedBoundaryPlacement`, this structure does not order the
three targets `J,C,K`.  It records only that the three centers `O,A,X` occur
first, in that order, and that all three targets occur later in the same
linear cut of the ambient boundary.  The PG136/Lemma-184 nesting argument
then forces `J` to lie between `C` and `K`. -/
structure EndpointPG136SameSidePlacement
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {W : RetainedMatchingTwoStepCommonDeletionWalk R}
    {E : RetainedMatchingEndpointCriticalFiber W}
    (P : EndpointFreshFirstApexRowSource E) : Type where
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
  hXC : iX < iC
  hXK : iX < iK
  boundary_O : boundary iO = S.oppApex1
  boundary_A :
    boundary iA = H.centerAt E.fiber.source₁.1 E.fiber.source₁.2
  boundary_X : boundary iX = H.centerAt P.J P.J_mem_A
  boundary_J : boundary iJ = P.J
  boundary_C : boundary iC = P.C
  boundary_K : boundary iK = P.K

/-- PG136/Lemma 184 on the live endpoint-cross-hit roles.

The equalities are not assumptions: the first-apex row gives `OJ = OC`, the
critical fiber gives `AC = AK`, and the positive cross hit gives `XJ = XK`.
Under the coarse placement `O < A < X < {J,C,K}`, strict Kalmanson
inequalities exclude `J` being before both or after both other targets. -/
theorem endpointCrossHit_tailNesting_of_sameSidePlacement
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {W : RetainedMatchingTwoStepCommonDeletionWalk R}
    {E : RetainedMatchingEndpointCriticalFiber W}
    (P : EndpointFreshFirstApexRowSource E)
    (hcross :
      P.K ∈ (H.selectedAt P.J P.J_mem_A).toCriticalFourShell.support)
    (B : EndpointPG136SameSidePlacement P) :
    (B.iK < B.iJ ∧ B.iJ < B.iC) ∨
      (B.iC < B.iJ ∧ B.iJ < B.iK) := by
  have hJ_ne_C : B.iJ ≠ B.iC := by
    intro hindices
    apply P.J_ne_C
    calc
      P.J = B.boundary B.iJ := B.boundary_J.symm
      _ = B.boundary B.iC := by rw [hindices]
      _ = P.C := B.boundary_C
  have hJ_ne_K : B.iJ ≠ B.iK := by
    intro hindices
    apply P.J_ne_K
    calc
      P.J = B.boundary B.iJ := B.boundary_J.symm
      _ = B.boundary B.iK := by rw [hindices]
      _ = P.K := B.boundary_K
  have hOJ_eq_OC :
      dist (B.boundary B.iO) (B.boundary B.iJ) =
        dist (B.boundary B.iO) (B.boundary B.iC) := by
    simpa only [B.boundary_O, B.boundary_J, B.boundary_C] using
      (P.row.support_eq_radius P.J P.J_mem_row).trans
        (P.row.support_eq_radius P.C P.C_mem_row).symm
  have hXJ_eq_XK :
      dist (B.boundary B.iX) (B.boundary B.iJ) =
        dist (B.boundary B.iX) (B.boundary B.iK) := by
    have hJ :
        P.J ∈
          (H.selectedAt P.J P.J_mem_A).toCriticalFourShell.support :=
      (H.selectedAt P.J P.J_mem_A).toCriticalFourShell.q_mem_support
    have hEq :
        dist (H.centerAt P.J P.J_mem_A) P.J =
          dist (H.centerAt P.J P.J_mem_A) P.K :=
      (H.selectedAt P.J P.J_mem_A).toCriticalFourShell.support_eq_radius
        P.J hJ
      |>.trans
        ((H.selectedAt P.J P.J_mem_A).toCriticalFourShell.support_eq_radius
          P.K hcross).symm
    simpa only [B.boundary_X, B.boundary_J, B.boundary_K] using hEq
  have hAC_eq_AK :
      dist (B.boundary B.iA) (B.boundary B.iC) =
        dist (B.boundary B.iA) (B.boundary B.iK) := by
    simpa only [B.boundary_A, B.boundary_C, B.boundary_K] using
      P.fiber_orientation.commonBlocker_equidistant
  rcases lt_or_gt_of_ne hJ_ne_C with hJC | hCJ
  · rcases lt_or_gt_of_ne hJ_ne_K with hJK | hKJ
    · have hAJ_lt_AC :
          dist (B.boundary B.iA) (B.boundary B.iJ) <
            dist (B.boundary B.iA) (B.boundary B.iC) :=
        dist_lt_of_ccw_of_dist_diagonal_eq_side D.convex
          B.boundary_injective B.boundary_image B.boundary_ccw
          B.hOA (B.hAX.trans B.hXJ) hJC hOJ_eq_OC
      have hAK_lt_AJ :
          dist (B.boundary B.iA) (B.boundary B.iK) <
            dist (B.boundary B.iA) (B.boundary B.iJ) := by
        have hkal :=
          dist_add_dist_lt_diagonal_sum_of_ccw D.convex
            B.boundary_injective B.boundary_image B.boundary_ccw
            B.hAX B.hXJ hJK
        linarith
      exfalso
      linarith
    · exact Or.inl ⟨hKJ, hJC⟩
  · rcases lt_or_gt_of_ne hJ_ne_K with hJK | hKJ
    · exact Or.inr ⟨hCJ, hJK⟩
    · have hAC_lt_AJ :
          dist (B.boundary B.iA) (B.boundary B.iC) <
            dist (B.boundary B.iA) (B.boundary B.iJ) :=
        dist_lt_of_ccw_of_dist_diagonal_eq_side D.convex
          B.boundary_injective B.boundary_image B.boundary_ccw
          B.hOA (B.hAX.trans B.hXC) hCJ hOJ_eq_OC.symm
      have hAJ_lt_AK :
          dist (B.boundary B.iA) (B.boundary B.iJ) <
            dist (B.boundary B.iA) (B.boundary B.iK) := by
        have hkal :=
          dist_add_dist_lt_diagonal_sum_of_ccw D.convex
            B.boundary_injective B.boundary_image B.boundary_ccw
            B.hAX B.hXK hKJ
        linarith
      exfalso
      linarith

/-- On the endpoint-cross-hit branch, a favorable boundary placement is
already a production `OrderedCrossRowCore`; no further metric or incidence
producer is needed. -/
def orderedCrossRowCoreOfEndpointCrossHit
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {W : RetainedMatchingTwoStepCommonDeletionWalk R}
    {E : RetainedMatchingEndpointCriticalFiber W}
    (P : EndpointFreshFirstApexRowSource E)
    (hcross :
      P.K ∈ (H.selectedAt P.J P.J_mem_A).toCriticalFourShell.support)
    (B : EndpointOrderedBoundaryPlacement P) :
    OrderedCrossRowCore E.fiber := by
  refine {
    C := P.C
    K := P.K
    fiber_orientation := P.fiber_orientation
    J := P.J
    J_mem_A := P.J_mem_A
    boundary := B.boundary
    boundary_injective := B.boundary_injective
    boundary_image := B.boundary_image
    boundary_ccw := B.boundary_ccw
    iO := B.iO
    iA := B.iA
    iX := B.iX
    iJ := B.iJ
    iC := B.iC
    iK := B.iK
    hOA := B.hOA
    hAX := B.hAX
    hXJ := B.hXJ
    hJC := B.hJC
    hCK := B.hCK
    boundary_O := B.boundary_O
    boundary_A := B.boundary_A
    boundary_X := B.boundary_X
    boundary_J := B.boundary_J
    boundary_C := B.boundary_C
    boundary_K := B.boundary_K
    robust_equidistant := ?_
    K_mem_J_shell := hcross }
  exact
    (P.row.support_eq_radius P.J P.J_mem_row).trans
      (P.row.support_eq_radius P.C P.C_mem_row).symm

/-- This is the first full-parent branch on which the current exact geometry
constructs a `CriticalFiberClosingCore`: endpoint fiber, positive cross hit,
and the one remaining six-role boundary placement. -/
theorem nonempty_criticalFiberClosingCore_of_endpointCrossHit_ordered
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {W : RetainedMatchingTwoStepCommonDeletionWalk R}
    {E : RetainedMatchingEndpointCriticalFiber W}
    (P : EndpointFreshFirstApexRowSource E)
    (hcross :
      P.K ∈ (H.selectedAt P.J P.J_mem_A).toCriticalFourShell.support)
    (B : EndpointOrderedBoundaryPlacement P) :
    Nonempty (CriticalFiberClosingCore R) :=
  ⟨CriticalFiberClosingCore.ordered E.fiber
    (orderedCrossRowCoreOfEndpointCrossHit P hcross B)⟩

/-- Exact residual after exposing the one closing subbranch of the production
strict-interior terminal surface.  No constructor asserts that a remaining
branch is geometrically realizable. -/
inductive ProducerResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionParentResidual F) : Type
  | localizedCollision
      (collision : RetainedInteriorBlockerCollision R)
      (commonDeletion : LocalizedCollisionCommonDeletion collision)
      (cycle : LocalizedCollisionMutualOmissionCycle collision commonDeletion)
  | matchingSourceReturn
      (walk : RetainedMatchingTwoStepCommonDeletionWalk R)
      (outcome : RetainedSourceReturnU5Outcome walk)
  | endpointFreshCommonDeletion
      (walk : RetainedMatchingTwoStepCommonDeletionWalk R)
      (fiber : RetainedMatchingEndpointCriticalFiber walk)
      (fresh : EndpointFreshFirstApexRowSource fiber)
      (K_not_mem_J_shell :
        fresh.K ∉
          (H.selectedAt fresh.J fresh.J_mem_A).toCriticalFourShell.support)
      (packet : CommonDeletionTwoCenterPacket D H fresh.K S.oppApex1
        (H.centerAt fresh.J fresh.J_mem_A))
  | endpointCrossHitOrderMissing
      (walk : RetainedMatchingTwoStepCommonDeletionWalk R)
      (fiber : RetainedMatchingEndpointCriticalFiber walk)
      (fresh : EndpointFreshFirstApexRowSource fiber)
      (K_mem_J_shell :
        fresh.K ∈
          (H.selectedAt fresh.J fresh.J_mem_A).toCriticalFourShell.support)
      (order_missing : ¬ Nonempty (EndpointOrderedBoundaryPlacement fresh))
  | matchingThreeDistinctBlockers
      (walk : RetainedMatchingTwoStepCommonDeletionWalk R)
      (path : RetainedMatchingThreeDistinctBlockerPath walk)
      (continuation : ThreeDistinctEndpointCrossOrCycle path)

/-- Strongest honest reduction currently obtained from the named production
normal forms.  The positive endpoint-cross/order branch produces the actual
closing core.  Every other branch is preserved in `ProducerResidual`, with
the exact first missing field recorded on the almost-closing branch. -/
theorem nonempty_criticalFiberClosingCore_or_producerResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionParentResidual F) :
    Nonempty (CriticalFiberClosingCore R) ∨ Nonempty (ProducerResidual R) := by
  rcases nonempty_retainedStrictInteriorTerminalSurface R with ⟨surface⟩
  cases surface with
  | localizedCollisionMutualOmission collision commonDeletion cycle =>
      exact Or.inr ⟨ProducerResidual.localizedCollision
        collision commonDeletion cycle⟩
  | matchingSourceReturn walk outcome =>
      exact Or.inr ⟨ProducerResidual.matchingSourceReturn walk outcome⟩
  | matchingEndpointCriticalFiber walk fiber fresh continuation =>
      cases continuation with
      | crossHit hcross =>
          by_cases horder : Nonempty (EndpointOrderedBoundaryPlacement fresh)
          · rcases horder with ⟨order⟩
            exact Or.inl
              (nonempty_criticalFiberClosingCore_of_endpointCrossHit_ordered
                fresh hcross order)
          · exact Or.inr ⟨ProducerResidual.endpointCrossHitOrderMissing
              walk fiber fresh hcross horder⟩
      | freshCommonDeletion hnot packet =>
          exact Or.inr ⟨ProducerResidual.endpointFreshCommonDeletion
            walk fiber fresh hnot packet⟩
  | matchingThreeDistinctBlockers walk path continuation =>
      exact Or.inr ⟨ProducerResidual.matchingThreeDistinctBlockers
        walk path continuation⟩

#print axioms orderedCrossRowCoreOfEndpointCrossHit
#print axioms nonempty_criticalFiberClosingCore_of_endpointCrossHit_ordered
#print axioms nonempty_criticalFiberClosingCore_or_producerResidual

end ATailCriticalFiberProducerPushScratch
end Problem97
