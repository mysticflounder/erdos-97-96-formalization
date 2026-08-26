/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ContextFrames
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.JointDeletionCore

/-!
# Two-source joint-deletion provenance from the collision frame

`TwoSourceJointDeletionProvenance` (`JointDeletion/CallerProvenance.lean`)
records a joint deletion whose source and deleted point sit on the two exact
four-point first-apex radius classes, together with the small/large split of
those two radii.  `TwoSourceCollisionFrame` (`ContextFrames.lean`) carries the
two-source collision hypotheses in the order the cluster's `variable` blocks
declare them.  This module shows that the frame already determines such a
record, so nothing in the two-source ingress has to be assumed twice.

## The two orientations

The frame states only `hρne : ρ ≠ radius`, while the provenance record fixes an
order: its `source_mem_largeClass` field puts the source on the larger radius
and `radii_ne` then puts the deletion on the smaller one.  The construction is
therefore split on `lt_trichotomy`.  Under `ρ < radius` the source is
`P.source₁` and the deletion is the fresh point of `LPρ`, which `hLPρ` places on
the `ρ` class; under `radius < ρ` the same argument runs with the two collision
records exchanged, using `LP` and `hLP`.  The frame is symmetric in exactly this
way, so both orientations are the single lemma
`TwoSourceJointDeletionProvenance.nonempty_of_localizedCollisionCommonDeletion`
applied to the two halves of the frame.

## Survivals and omissions

The recorded survival set is the singleton apex `{S.oppApex1}`, justified by the
two-center packet carried by the localized common deletion, and the recorded
omission set is the singleton fresh point, justified by the localized deletion's
own `fresh_not_mem_shell`.  Both are the smallest sets the frame supports.
-/

namespace Problem97
namespace ATailFrontierLiveClosure

open scoped EuclideanGeometry
open ATailCommonDeletionTwoCenter
open ATailCriticalPairFrontier
open ATailOrientedPhysicalApexIngress
open ATailRetainedStrictInteriorPairSelector

attribute [local instance] Classical.propDecidable

/-- A retained interior blocker collision on the larger of two first-apex radii,
together with a localized common deletion whose fresh point lies on the smaller
radius, supplies a two-source joint-deletion provenance record at the first
opposite apex.

The collision's first source is the recorded source, the fresh point of the
localized deletion is the recorded deletion, the apex is the single recorded
survival, and the fresh point is the single recorded omission. -/
theorem TwoSourceJointDeletionProvenance.nonempty_of_localizedCollisionCommonDeletion
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {small large : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S large H}
    {R : FrontierCommonDeletionParentResidual F}
    {P : RetainedInteriorBlockerCollision R}
    (deletion : LocalizedCollisionCommonDeletion P)
    (hsmallPos : 0 < small)
    (hlt : small < large)
    (hsmallFour : (SelectedClass D.A S.oppApex1 small).card = 4)
    (hlargeFour : (SelectedClass D.A S.oppApex1 large).card = 4)
    (hfreshSmall : deletion.fresh ∈ SelectedClass D.A S.oppApex1 small) :
    Nonempty (TwoSourceJointDeletionProvenance D H S.oppApex1) := by
  classical
  exact
    ⟨TwoSourceJointDeletionProvenance.ofCrossRadiusJointDeletion
      { source := ⟨P.source₁, P.source₁_mem_A⟩
        sourceBlocker := H.centerAt P.source₁ P.source₁_mem_A
        sourceBlocker_eq := rfl
        exactSourceRow := H.selectedAt P.source₁ P.source₁_mem_A
        deleted := ⟨deletion.fresh, deletion.packet.q_mem_A⟩
        fixedSurvivals := {S.oppApex1}
        fixedSurvivals_subset_carrier :=
          Finset.singleton_subset_iff.mpr deletion.packet.center₁_mem_A
        survives_of_mem_fixedSurvivals := by
          intro c hc
          rw [Finset.mem_singleton] at hc
          subst hc
          exact deletion.packet.survives₁
        fixedOmissions := {deletion.fresh}
        fixedOmissions_subset_carrier :=
          Finset.singleton_subset_iff.mpr deletion.packet.q_mem_A
        deleted_mem_fixedOmissions := Finset.mem_singleton_self _
        omitted_of_mem_fixedOmissions := by
          intro z hz
          rw [Finset.mem_singleton] at hz
          subst hz
          exact deletion.fresh_not_mem_shell
        sourceRadius := large
        sourceRadius_pos := hsmallPos.trans hlt
        deletedRadius := small
        deletedRadius_pos := hsmallPos
        radii_ne := hlt.ne'
        source_mem_sourceClass := P.source₁_mem_radius
        deleted_mem_deletedClass := hfreshSmall
        apex_mem_fixedSurvivals := Finset.mem_singleton_self _ }
      small large hsmallPos hlt
      (SelectedClass D.A S.oppApex1 small) (SelectedClass D.A S.oppApex1 large)
      rfl rfl hsmallFour hlargeFour (Or.inr rfl) (Or.inl rfl)
      P.source₁_mem_radius _ rfl⟩

/-- The two-source collision frame determines a two-source joint-deletion
provenance record at the first opposite apex.

The frame fixes only that the two first-apex radii differ, so the construction
splits on their order and reads the source off the larger radius in each
orientation: the first collision and its localized deletion `LPρ` under
`ρ < radius`, the second collision and `LP` under `radius < ρ`.  No hypothesis
beyond the frame's own fields is used. -/
theorem TwoSourceJointDeletionProvenance.nonempty_of_twoSourceCollisionFrame
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius ρ : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {Fρ : CriticalPairFrontier D S ρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ)
    (frame : TwoSourceCollisionFrame P Pρ) :
    Nonempty (TwoSourceJointDeletionProvenance D H S.oppApex1) := by
  classical
  rcases lt_trichotomy ρ radius with hlt | heq | hgt
  · refine
      TwoSourceJointDeletionProvenance.nonempty_of_localizedCollisionCommonDeletion
        frame.LPρ Fρ.radius_pos hlt frame.hρfour frame.hfrontierFour ?_
    rw [frame.hLPρ]
    exact Pρ.source₁_mem_radius
  · exact absurd heq frame.hρne
  · refine
      TwoSourceJointDeletionProvenance.nonempty_of_localizedCollisionCommonDeletion
        frame.LP F.radius_pos hgt frame.hfrontierFour frame.hρfour ?_
    rw [frame.hLP]
    exact P.source₁_mem_radius

end ATailFrontierLiveClosure
end Problem97
