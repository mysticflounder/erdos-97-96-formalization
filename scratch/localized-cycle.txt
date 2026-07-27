/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.RetainedCollisionCapLocalization
import Erdos9796Proof.P97.ATail.RetainedStrictInteriorPairSelector

/-!
# Localized collision mutual-omission cycle

The strict-cap collision branch supplies a fresh point whose deletion survives
at both the robust first apex and the collision's common blocker.  This file
keeps that source provenance and applies the convex-carrier perpendicular-
bisector bound to the fresh point's actual critical row.

That row cannot contain both collision sources: otherwise its actual blocker
would equal the collision blocker, contrary to the stored common-deletion
packet.  Hence one collision source is omitted.  Deleting that source then
survives at both the first apex and the fresh point's actual blocker.  Together
with the original packet this is a source-exact mutual-omission two-cycle.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailLocalizedCollisionMutualOmissionCycle

open ATailCommonDeletionTwoCenter
open ATailCriticalFiberRetainedRadiusSelector
open ATailCriticalPairFrontier
open ATailFirstApexCriticalFiber
open ATailOrientedPhysicalApexIngress
open ATailRetainedCollisionCapLocalization
open ATailRetainedStrictInteriorPairSelector

attribute [local instance] Classical.propDecidable

/-- Repackage the strict-cap collision as the production retained-radius
collision.  This is only an adapter: all equal-blocker and exact-support data
come from the retained critical system. -/
private def retainedRadiusCollisionOfInteriorCollision
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R) :
    RetainedRadiusCollision (R := R) := by
  let source₁ : CriticalShellSystem.CarrierVertex D.A :=
    ⟨P.source₁, P.source₁_mem_A⟩
  let source₂ : CriticalShellSystem.CarrierVertex D.A :=
    ⟨P.source₂, P.source₂_mem_A⟩
  have hsources : source₁ ≠ source₂ := by
    intro h
    exact P.sources_ne (congrArg Subtype.val h)
  have hblockers : H.blockerVertex source₁ = H.blockerVertex source₂ := by
    apply Subtype.ext
    exact P.blockers_eq
  have hcenters :
      H.centerAt source₁.1 source₁.2 =
        H.centerAt source₂.1 source₂.2 :=
    congrArg Subtype.val hblockers
  have hsource₁Own :
      source₁.1 ∈
        (H.selectedAt source₁.1 source₁.2).toCriticalFourShell.support :=
    (H.selectedAt source₁.1 source₁.2).toCriticalFourShell.q_mem_support
  have hsource₂Own :
      source₂.1 ∈
        (H.selectedAt source₂.1 source₂.2).toCriticalFourShell.support :=
    (H.selectedAt source₂.1 source₂.2).toCriticalFourShell.q_mem_support
  have hsource₁Common :
      source₁.1 ∈
        (H.selectedAt source₂.1 source₂.2).toCriticalFourShell.support := by
    rw [← P.supports_eq]
    exact hsource₁Own
  have hsource₂Common :
      source₂.1 ∈
        (H.selectedAt source₁.1 source₁.2).toCriticalFourShell.support := by
    rw [P.supports_eq]
    exact hsource₂Own
  have hradii :
      (H.selectedAt source₁.1 source₁.2).toCriticalFourShell.radius =
        (H.selectedAt source₂.1 source₂.2).toCriticalFourShell.radius := by
    calc
      (H.selectedAt source₁.1 source₁.2).toCriticalFourShell.radius =
          dist (H.centerAt source₁.1 source₁.2) source₁.1 :=
        ((H.selectedAt source₁.1
          source₁.2).toCriticalFourShell.support_eq_radius
            source₁.1 hsource₁Own).symm
      _ = dist (H.centerAt source₂.1 source₂.2) source₁.1 := by
        rw [hcenters]
      _ = (H.selectedAt source₂.1 source₂.2).toCriticalFourShell.radius :=
        (H.selectedAt source₂.1
          source₂.2).toCriticalFourShell.support_eq_radius
            source₁.1 hsource₁Common
  let fiber : FrontierCommonDeletionCriticalFiber R := {
    firstApex_robust := R.firstApexFullyDeletionRobust
    source₁ := source₁
    source₂ := source₂
    sources_ne := hsources
    source_points_ne := P.sources_ne
    blockers_eq := hblockers
    commonBlocker_ne_firstApex :=
      R.actualBlocker_ne_firstApex P.source₁ P.source₁_mem_A
    commonBlocker_mem_A := (H.blockerVertex source₁).2
    supports_eq := P.supports_eq
    radii_eq := hradii
    source₁_mem_commonSupport := hsource₁Common
    source₂_mem_commonSupport := hsource₂Common
    commonSupport_card_eq_four :=
      (H.selectedAt source₁.1 source₁.2).toCriticalFourShell.support_card
    source₁_deletion_critical := H.no_qfree_at source₁.1 source₁.2
    source₂_deletion_critical := by
      intro hsurvives
      apply H.no_qfree_at source₂.1 source₂.2
      rw [← hcenters]
      exact hsurvives }
  exact {
    fiber := fiber
    source₁_mem_radius := P.source₁_mem_radius
    source₂_mem_radius := P.source₂_mem_radius }

/-- Source-exact terminal reached from a localized collision.

The two sources are a chosen collision source and the fresh strict-cap point.
Their actual blockers are distinct, and each source is absent from the other
source's exact critical shell.  The two stored packets are the corresponding
common deletions at the robust first apex and the predecessor's actual
blocker. -/
structure LocalizedCollisionMutualOmissionCycle
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    (L : LocalizedCollisionCommonDeletion P) : Type where
  collisionSource : ℝ²
  collisionSource_mem_A : collisionSource ∈ D.A
  collisionSource_mem_capInterior :
    collisionSource ∈ S.capInteriorByIndex S.oppIndex1
  collisionSource_eq :
    collisionSource = P.source₁ ∨ collisionSource = P.source₂
  collisionSource_ne_fresh : collisionSource ≠ L.fresh
  collisionSource_blocker_eq_commonBlocker :
    H.centerAt collisionSource collisionSource_mem_A =
      H.centerAt P.source₁ P.source₁_mem_A
  fresh_not_mem_collisionSource_shell :
    L.fresh ∉
      (H.selectedAt collisionSource
        collisionSource_mem_A).toCriticalFourShell.support
  collisionSource_not_mem_fresh_shell :
    collisionSource ∉
      (H.selectedAt L.fresh L.packet.q_mem_A).toCriticalFourShell.support
  blockers_ne :
    H.centerAt collisionSource collisionSource_mem_A ≠
      H.centerAt L.fresh L.packet.q_mem_A
  freshPacket :
    CommonDeletionTwoCenterPacket D H L.fresh S.oppApex1
      (H.centerAt collisionSource collisionSource_mem_A)
  collisionSourcePacket :
    CommonDeletionTwoCenterPacket D H collisionSource S.oppApex1
      (H.centerAt L.fresh L.packet.q_mem_A)

private theorem nonempty_cycle_of_collisionSource
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    (L : LocalizedCollisionCommonDeletion P)
    {source : ℝ²}
    (hsourceA : source ∈ D.A)
    (hsourceInterior : source ∈ S.capInteriorByIndex S.oppIndex1)
    (hsourceEq : source = P.source₁ ∨ source = P.source₂)
    (hsourceNeFresh : source ≠ L.fresh)
    (hblockerEq :
      H.centerAt source hsourceA =
        H.centerAt P.source₁ P.source₁_mem_A)
    (hfreshNotSourceShell :
      L.fresh ∉
        (H.selectedAt source hsourceA).toCriticalFourShell.support)
    (hsourceNotFreshShell :
      source ∉
        (H.selectedAt L.fresh
          L.packet.q_mem_A).toCriticalFourShell.support) :
    Nonempty (LocalizedCollisionMutualOmissionCycle P L) := by
  have hfirstSurvives :
      HasNEquidistantPointsAt 4 (D.A.erase source) S.oppApex1 :=
    R.firstApexFullyDeletionRobust.survives source hsourceA
  have hfreshBlockerSurvives :
      HasNEquidistantPointsAt 4 (D.A.erase source)
        (H.centerAt L.fresh L.packet.q_mem_A) :=
    (cross_deletion_survives_iff_not_mem_selected_support
      H L.packet.q_mem_A).mpr hsourceNotFreshShell
  have hfreshBlockerA :
      H.centerAt L.fresh L.packet.q_mem_A ∈ D.A := by
    simpa [CriticalShellSystem.blockerVertex] using
      (H.blockerVertex ⟨L.fresh, L.packet.q_mem_A⟩).2
  have hcentersNe :
      S.oppApex1 ≠ H.centerAt L.fresh L.packet.q_mem_A :=
    L.packet.actual_blocker_ne_center₁.symm
  rcases nonempty_commonDeletionTwoCenterPacket H
      hsourceA L.packet.center₁_mem_A hfreshBlockerA hcentersNe
      hfirstSurvives hfreshBlockerSurvives with ⟨sourcePacket⟩
  have hblockersNe :
      H.centerAt source hsourceA ≠
        H.centerAt L.fresh L.packet.q_mem_A := by
    rw [hblockerEq]
    exact L.packet.actual_blocker_ne_center₂.symm
  have hfreshPacket :
      CommonDeletionTwoCenterPacket D H L.fresh S.oppApex1
        (H.centerAt source hsourceA) := by
    simpa only [hblockerEq] using L.packet
  exact ⟨{
    collisionSource := source
    collisionSource_mem_A := hsourceA
    collisionSource_mem_capInterior := hsourceInterior
    collisionSource_eq := hsourceEq
    collisionSource_ne_fresh := hsourceNeFresh
    collisionSource_blocker_eq_commonBlocker := hblockerEq
    fresh_not_mem_collisionSource_shell := hfreshNotSourceShell
    collisionSource_not_mem_fresh_shell := hsourceNotFreshShell
    blockers_ne := hblockersNe
    freshPacket := hfreshPacket
    collisionSourcePacket := sourcePacket }⟩

/-- Every localized collision common deletion reaches a source-exact mutual-
omission two-cycle.  The only nontrivial choice is which collision source is
absent from the fresh point's actual critical row. -/
theorem nonempty_localizedCollisionMutualOmissionCycle
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    (L : LocalizedCollisionCommonDeletion P) :
    Nonempty (LocalizedCollisionMutualOmissionCycle P L) := by
  let Q : RetainedRadiusCollision (R := R) :=
    retainedRadiusCollisionOfInteriorCollision P
  have homission :
      P.source₁ ∉
          (H.selectedAt L.fresh
            L.packet.q_mem_A).toCriticalFourShell.support ∨
        P.source₂ ∉
          (H.selectedAt L.fresh
            L.packet.q_mem_A).toCriticalFourShell.support := by
    by_cases hsource₁ :
        P.source₁ ∈
          (H.selectedAt L.fresh
            L.packet.q_mem_A).toCriticalFourShell.support
    · apply Or.inr
      intro hsource₂
      exact false_of_distinct_actualRow_contains_collisionSources
        Q L.packet.q_mem_A L.packet.actual_blocker_ne_center₂
        hsource₁ hsource₂
    · exact Or.inl hsource₁
  rcases homission with hsource₁ | hsource₂
  · exact nonempty_cycle_of_collisionSource P L
      P.source₁_mem_A P.source₁_mem_capInterior (Or.inl rfl)
      L.fresh_ne_source₁.symm rfl L.fresh_not_mem_shell hsource₁
  · have hfreshNotSource₂ :
        L.fresh ∉
          (H.selectedAt P.source₂
            P.source₂_mem_A).toCriticalFourShell.support := by
      intro hfresh
      apply L.fresh_not_mem_shell
      rw [P.supports_eq]
      exact hfresh
    exact nonempty_cycle_of_collisionSource P L
      P.source₂_mem_A P.source₂_mem_capInterior (Or.inr rfl)
      L.fresh_ne_source₂.symm P.blockers_eq.symm
      hfreshNotSource₂ hsource₂

#print axioms LocalizedCollisionMutualOmissionCycle
#print axioms nonempty_localizedCollisionMutualOmissionCycle

end ATailLocalizedCollisionMutualOmissionCycle
end Problem97

