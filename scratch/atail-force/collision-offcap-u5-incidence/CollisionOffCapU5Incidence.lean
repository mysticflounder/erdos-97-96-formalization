/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import CollisionOffCapLocalization

/-!
# Exact U5 incidence boundary for the off-first-cap collision arm

This scratch continuation classifies the complete intersection of the fresh
actual q-deleted row with the dangerous first-apex circle.  It also constructs
an unconditional q-deleted/q-critical row alternative at the named dangerous
point deliberately placed in the collision source's actual critical row.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailCollisionOffCapU5IncidenceScratch

open ATailCollisionOffCapLocalizationScratch
open ATailCriticalPairFrontier
open ATailLocalizedCollisionMutualOmissionCycle
open ATailOrientedPhysicalApexIngress
open ATailRetainedStrictInteriorPairSelector

attribute [local instance] Classical.propDecidable

/-- Exact finite classification of the fresh actual q-deleted row on the
dangerous first-apex circle.  The deleted collision source cannot occur, so
the only possibilities are zero, one, or two named points of `T`. -/
inductive FreshActualDangerousIntersectionOutcome
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {P : RetainedInteriorBlockerCollision R}
    {L : LocalizedCollisionCommonDeletion P}
    {C : LocalizedCollisionMutualOmissionCycle P L}
    (I : FreshBlockerOffFirstCapU5Ingress C) : Type
  | empty
      (intersection_eq :
        (H.selectedAt L.fresh
            L.packet.q_mem_A).toCriticalFourShell.support ∩
          insert C.collisionSource I.T = ∅)
  | singleton
      (point : ℝ²)
      (point_mem_T : point ∈ I.T)
      (intersection_eq :
        (H.selectedAt L.fresh
            L.packet.q_mem_A).toCriticalFourShell.support ∩
          insert C.collisionSource I.T = {point})
  | pair
      (point₁ point₂ : ℝ²)
      (points_ne : point₁ ≠ point₂)
      (point₁_mem_T : point₁ ∈ I.T)
      (point₂_mem_T : point₂ ∈ I.T)
      (intersection_eq :
        (H.selectedAt L.fresh
            L.packet.q_mem_A).toCriticalFourShell.support ∩
          insert C.collisionSource I.T = {point₁, point₂})

/-- The at-most-two U5 bound is an exact zero/singleton/pair split.  No
slot order or arbitrary support identifier remains. -/
theorem nonempty_freshActualDangerousIntersectionOutcome
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {P : RetainedInteriorBlockerCollision R}
    {L : LocalizedCollisionCommonDeletion P}
    {C : LocalizedCollisionMutualOmissionCycle P L}
    (I : FreshBlockerOffFirstCapU5Ingress C) :
    Nonempty (FreshActualDangerousIntersectionOutcome I) := by
  classical
  let B := (H.selectedAt L.fresh
    L.packet.q_mem_A).toCriticalFourShell.support
  let X := B ∩ insert C.collisionSource I.T
  have hcard : X.card ≤ 2 := by
    simpa only [X, B] using
      I.freshActualDeleted_inter_dangerousCircle_card_le_two
  have hsubsetT : X ⊆ I.T := by
    intro x hx
    rcases Finset.mem_inter.mp hx with ⟨hxB, hxCircle⟩
    rcases Finset.mem_insert.mp hxCircle with hxcollision | hxT
    · subst x
      exact False.elim (C.collisionSource_not_mem_fresh_shell hxB)
    · exact hxT
  rcases Nat.eq_zero_or_pos X.card with hzero | hpos
  · have hX : X = ∅ := Finset.card_eq_zero.mp hzero
    exact ⟨FreshActualDangerousIntersectionOutcome.empty (by
      simpa only [X, B] using hX)⟩
  · by_cases hone : X.card = 1
    · rcases Finset.card_eq_one.mp hone with ⟨point, hX⟩
      have hpointX : point ∈ X := by simp [hX]
      exact ⟨FreshActualDangerousIntersectionOutcome.singleton point
        (hsubsetT hpointX) (by simpa only [X, B] using hX)⟩
    · have htwo : X.card = 2 := by omega
      rcases Finset.card_eq_two.mp htwo with
        ⟨point₁, point₂, hpointsNe, hX⟩
      have hpoint₁X : point₁ ∈ X := by simp [hX]
      have hpoint₂X : point₂ ∈ X := by simp [hX]
      exact ⟨FreshActualDangerousIntersectionOutcome.pair
        point₁ point₂ hpointsNe (hsubsetT hpoint₁X) (hsubsetT hpoint₂X)
        (by simpa only [X, B] using hX)⟩

/-- Exact global-K4 row alternative at the named dangerous point already
known to occur in the collision source's actual q-critical row. -/
inductive OtherCollisionSourceNamedRow
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {P : RetainedInteriorBlockerCollision R}
    {L : LocalizedCollisionCommonDeletion P}
    {C : LocalizedCollisionMutualOmissionCycle P L}
    (I : FreshBlockerOffFirstCapU5Ingress C) : Type
  | qDeleted
      (support : Finset ℝ²)
      (row : U5QDeletedK4Class D C.collisionSource
        I.otherCollisionSource support)
      (support_card : support.card = 4)
  | qCritical
      (support : Finset ℝ²)
      (row : U5QCriticalTripleClass D C.collisionSource
        I.otherCollisionSource support)

private theorem otherCollisionSource_mem_skeleton
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {P : RetainedInteriorBlockerCollision R}
    {L : LocalizedCollisionCommonDeletion P}
    {C : LocalizedCollisionMutualOmissionCycle P L}
    (I : FreshBlockerOffFirstCapU5Ingress C) :
    I.otherCollisionSource ∈ D.skeleton C.collisionSource := by
  exact (Finset.mem_erase.mp
    (I.dangerous.T_subset I.otherCollisionSource_mem_T)).2

/-- The named point `otherCollisionSource ∈ T` unconditionally carries an
exact q-deleted four-row or an exact q-critical three-row.  The q-critical
alternative is packaged from the exact radius filter returned by the global
4A split, rather than left as an untyped cardinality fact. -/
theorem nonempty_otherCollisionSourceNamedRow
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {P : RetainedInteriorBlockerCollision R}
    {L : LocalizedCollisionCommonDeletion P}
    {C : LocalizedCollisionMutualOmissionCycle P L}
    (I : FreshBlockerOffFirstCapU5Ingress C) :
    Nonempty (OtherCollisionSourceNamedRow I) := by
  classical
  rcases U5QDeletedK4Class.exists_card_four_or_qCritical_of_globalK4
      I.dangerous.q_mem (otherCollisionSource_mem_skeleton I) with
    ⟨support, ⟨row⟩, hcard⟩ | ⟨r, hr, hqr, hcard⟩
  · exact ⟨OtherCollisionSourceNamedRow.qDeleted support row hcard⟩
  · let support :=
      ((D.skeleton C.collisionSource).erase I.otherCollisionSource).filter
        fun y ↦ dist I.otherCollisionSource y = r
    have row : U5QCriticalTripleClass D C.collisionSource
        I.otherCollisionSource support := {
      subset := by
        intro y hy
        exact (Finset.mem_filter.mp hy).1
      card_three := by simpa only [support] using hcard
      q_radius_pos := by simpa only [hqr] using hr
      same_q_radius := by
        intro y hy
        exact (Finset.mem_filter.mp hy).2.trans hqr.symm }
    exact ⟨OtherCollisionSourceNamedRow.qCritical support row⟩

/-- The collision source's actual blocker is either itself a named dangerous
center, or it is a genuine selected candidate carrying the already-available
q-critical row.  In both cases that row contains `otherCollisionSource ∈ T`.
-/
inductive CollisionBlockerU5Role
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {P : RetainedInteriorBlockerCollision R}
    {L : LocalizedCollisionCommonDeletion P}
    {C : LocalizedCollisionMutualOmissionCycle P L}
    (I : FreshBlockerOffFirstCapU5Ingress C) : Type
  | dangerousCenter
      (center_mem_T :
        H.centerAt C.collisionSource C.collisionSource_mem_A ∈ I.T)
  | selectedCandidate
      (candidate : U5SelectedCandidateSkeleton D C.collisionSource
        S.oppApex1 I.T
        (H.centerAt C.collisionSource C.collisionSource_mem_A))

/-- Exact U5 role of the collision source's actual blocker.  This consumes
the retained critical system rather than manufacturing a generic K4 row. -/
theorem nonempty_collisionBlockerU5Role
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {P : RetainedInteriorBlockerCollision R}
    {L : LocalizedCollisionCommonDeletion P}
    {C : LocalizedCollisionMutualOmissionCycle P L}
    (I : FreshBlockerOffFirstCapU5Ingress C) :
    Nonempty (CollisionBlockerU5Role I) := by
  classical
  let blocker := H.centerAt C.collisionSource C.collisionSource_mem_A
  by_cases hblockerT : blocker ∈ I.T
  · exact ⟨CollisionBlockerU5Role.dangerousCenter hblockerT⟩
  · have hblockerA : blocker ∈ D.A := by
      simpa only [blocker, CriticalShellSystem.blockerVertex] using
        (H.blockerVertex
          ⟨C.collisionSource, C.collisionSource_mem_A⟩).2
    have hblockerNeQ : blocker ≠ C.collisionSource := by
      intro h
      have hcenterNot := (H.selectedAt C.collisionSource
        C.collisionSource_mem_A).toCriticalFourShell.center_not_mem_support
      apply hcenterNot
      simpa only [blocker, h] using
        (H.selectedAt C.collisionSource
          C.collisionSource_mem_A).toCriticalFourShell.q_mem_support
    have hblockerNeP : blocker ≠ S.oppApex1 := by
      intro h
      apply R.actualBlocker_ne_firstApex P.source₁ P.source₁_mem_A
      exact C.collisionSource_blocker_eq_commonBlocker.symm.trans h
    have hcandidate : U5SelectedCandidateSkeleton D C.collisionSource
        S.oppApex1 I.T blocker := {
      candidate_mem := by
        exact Finset.mem_erase.mpr
          ⟨hblockerNeP,
            Finset.mem_erase.mpr ⟨hblockerNeQ, hblockerA⟩⟩
      candidate_notin_T := hblockerT }
    exact ⟨CollisionBlockerU5Role.selectedCandidate (by
      simpa only [blocker] using hcandidate)⟩

/-- The fresh source's actual blocker has one extra possible role: it can be
the deleted collision source itself.  Otherwise it is either a named
dangerous center carrying the concrete q-deleted row, or a selected candidate
carrying that row. -/
inductive FreshBlockerU5Role
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {P : RetainedInteriorBlockerCollision R}
    {L : LocalizedCollisionCommonDeletion P}
    {C : LocalizedCollisionMutualOmissionCycle P L}
    (I : FreshBlockerOffFirstCapU5Ingress C) : Type
  | deletedSourceCenter
      (center_eq :
        H.centerAt L.fresh L.packet.q_mem_A = C.collisionSource)
  | dangerousCenter
      (center_mem_T : H.centerAt L.fresh L.packet.q_mem_A ∈ I.T)
  | selectedCandidate
      (candidate : U5SelectedCandidateSkeleton D C.collisionSource
        S.oppApex1 I.T (H.centerAt L.fresh L.packet.q_mem_A))

/-- Exact U5 role of the fresh source's actual blocker. -/
theorem nonempty_freshBlockerU5Role
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {P : RetainedInteriorBlockerCollision R}
    {L : LocalizedCollisionCommonDeletion P}
    {C : LocalizedCollisionMutualOmissionCycle P L}
    (I : FreshBlockerOffFirstCapU5Ingress C) :
    Nonempty (FreshBlockerU5Role I) := by
  classical
  let blocker := H.centerAt L.fresh L.packet.q_mem_A
  by_cases hblockerQ : blocker = C.collisionSource
  · exact ⟨FreshBlockerU5Role.deletedSourceCenter hblockerQ⟩
  · by_cases hblockerT : blocker ∈ I.T
    · exact ⟨FreshBlockerU5Role.dangerousCenter hblockerT⟩
    · have hblockerA : blocker ∈ D.A := by
        simpa only [blocker, CriticalShellSystem.blockerVertex] using
          (H.blockerVertex ⟨L.fresh, L.packet.q_mem_A⟩).2
      have hblockerNeP : blocker ≠ S.oppApex1 := by
        simpa only [blocker] using L.packet.actual_blocker_ne_center₁
      have hcandidate : U5SelectedCandidateSkeleton D C.collisionSource
          S.oppApex1 I.T blocker := {
        candidate_mem := by
          exact Finset.mem_erase.mpr
            ⟨hblockerNeP,
              Finset.mem_erase.mpr ⟨hblockerQ, hblockerA⟩⟩
        candidate_notin_T := hblockerT }
      exact ⟨FreshBlockerU5Role.selectedCandidate (by
        simpa only [blocker] using hcandidate)⟩

#print axioms FreshActualDangerousIntersectionOutcome
#print axioms nonempty_freshActualDangerousIntersectionOutcome
#print axioms OtherCollisionSourceNamedRow
#print axioms nonempty_otherCollisionSourceNamedRow
#print axioms CollisionBlockerU5Role
#print axioms nonempty_collisionBlockerU5Role
#print axioms FreshBlockerU5Role
#print axioms nonempty_freshBlockerU5Role

end ATailCollisionOffCapU5IncidenceScratch
end Problem97
