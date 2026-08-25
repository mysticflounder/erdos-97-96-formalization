/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.PairedCommonDeletionNormalForm
import Erdos9796Proof.P97.ATail.RetainedMatchingLargeCapConsumer
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.JointDeletion.ProvenanceCore
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.JointDeletion.RoundTrip

/-!
# Producers of the joint-deletion provenance core

The provenance hierarchy of `JointDeletion.ProvenanceCore` is stated against a
bare critical-shell system.  This module supplies the readers that build its
records from the live retained-matching geometry: the oriented retained common
deletion of `RetainedMatchingLargeCapConsumer` and the two normalized paired
outcomes of `PairedCommonDeletionNormalForm`.

Every reader below is stated over the frontier's own shell system `H`, not over
the late first-apex system that the historical adapters of `ProvenanceCore` use.
A consumer that wants to compose a core produced here with one of those
adapters passes through `JointDeletionCore.rebase`.

## The three readings

* `jointDeletionCore_ofOrientedRetainedCommonDeletion` is total and takes no
  extra input.  The oriented record's kept source is the provenance source and
  its deleted source is the deletion: the only omission the record carries is
  `deleted_not_mem_kept_shell`, and its packet certifies survival of erasing the
  deleted source at the first opposite apex and at the kept source's blocker.
* `sameRadiusJointDeletion_ofPairedApexClass` and
  `crossRadiusJointDeletion_ofPairedApexClass` read the paired apex-class
  outcome.  Neither is total on its own: `PairedApexClassJointDeletion` records
  its own class radius `sourceRadius` and nothing in that record forces it to be
  the ambient frontier radius, while the kept source is known to lie on the
  frontier radius class.  Each reader therefore takes the comparison of the two
  radii as an explicit argument, and the mode is never selected from a
  cardinality.
* `crossRadiusJointDeletion_ofConcentricGrid` reads the grid outcome through the
  dedicated record `ConcentricGridJointDeletion`.  The grid carries no
  common-deletion packet at all, so the deletion is chosen rather than read off,
  and both survivals are constructed from the retained class.

## Why the grid gets its own record

`PairedTwoRadiusGrid` supplies two concentric exact four-point classes at the
first opposite apex, two disjoint retained rows, and named hits of each row on
each class — but no survival witness.  `ConcentricGridJointDeletion` names
exactly the grid facts a cross-radius joint deletion needs, together with one
chosen deletion carried as a point plus its two memberships.  A caller passes
`Gr.deletedOtherFirst` or `Gr.deletedOtherSecond` with the grid's own
hypotheses.

## The branch tag

`PairedCommonDeletionProvenance O` keeps the arm the live geometry reached, and
it carries its own origin: every constructor stores the paired outcome datum
over the *same* `O` together with the decision that outcome was split on, and
stores no prebuilt payload at all.  The apex-class arms store a
`PairedApexClassJointDeletion O` plus the comparison of that record's class
radius with the frontier radius; the grid arm stores a `PairedTwoRadiusGrid O`
plus the chosen deletion and its two memberships.  Because the stored datum is
indexed by `O`, an unrelated packet cannot be tagged as provenance of `O`: there
is no constructor that accepts a free `SameRadiusJointDeletion`,
`CrossRadiusJointDeletion`, or `ConcentricGridJointDeletion`.

The normalized records are recovered as projections rather than stored.
`toSameRadius`, `toCrossRadius` and `toConcentricGrid` are the per-branch
readings, each computed from the carried datum through the standalone adapter of
its branch, and each definitionally the adapter applied to that datum.
`toApexRadiusMode` and `toJointDeletionCore` are the total readings.

`pairedCommonDeletionProvenance_ofPairedCommonDeletionOutcome` is total: it
case-splits the apex-class outcome on whether its class radius agrees with the
frontier radius, and routes the grid outcome to its own constructor.  The
apex-class arms and the grid arm produce two different provenance cores — the
apex-class arms delete the escaping class point, the grid arm deletes a chosen
point of the second class — so the projection to `JointDeletionCore` is stated
as three separate per-branch lemmas rather than one identity.
-/

namespace Problem97
namespace ATailFrontierLiveClosure

open scoped EuclideanGeometry
open ATailApexRichClassStructure
open ATailCommonDeletionTwoCenter
open ATailCriticalPairFrontier
open ATailOrientedPhysicalApexIngress
open ATailPairedCommonDeletionNormalForm
open ATailRetainedMatchingGeometricReduction
open ATailRetainedMatchingLargeCapConsumer

attribute [local instance] Classical.propDecidable

noncomputable section

variable {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
  {H : CriticalShellSystem D.A}
  {F : CriticalPairFrontier D S radius H}
  {R : FrontierCommonDeletionParentResidual F}
  {P : RetainedInteriorDirectedOmission R}

/- ## The oriented retained common deletion -/

/-- The provenance core of an oriented retained common deletion.

The kept source is the provenance source and the deleted source is the
deletion.  That orientation is forced by the record itself: the single omission
it carries is that the deleted source misses the row at the kept source, and its
packet certifies survival of erasing the deleted source at the first opposite
apex and at the kept source's blocker.  The two recorded survival centers are
exactly that packet's two centers, each with its own survival hypothesis; the
single recorded omission is the deleted source, with its own non-membership
hypothesis.  Nothing here is read off a cardinality. -/
def jointDeletionCore_ofOrientedRetainedCommonDeletion
    (O : OrientedRetainedCommonDeletion P) : JointDeletionCore D H where
  source := ⟨O.kept, O.kept_mem_A⟩
  sourceBlocker := H.centerAt O.kept O.kept_mem_A
  sourceBlocker_eq := rfl
  exactSourceRow := H.selectedAt O.kept O.kept_mem_A
  deleted := ⟨O.deleted, O.deleted_mem_A⟩
  fixedSurvivals := {S.oppApex1, H.centerAt O.kept O.kept_mem_A}
  fixedSurvivals_subset_carrier := by
    intro c hc
    simp only [Finset.mem_insert, Finset.mem_singleton] at hc
    rcases hc with rfl | rfl
    · exact O.packet.center₁_mem_A
    · exact O.packet.center₂_mem_A
  survives_of_mem_fixedSurvivals := by
    intro c hc
    simp only [Finset.mem_insert, Finset.mem_singleton] at hc
    rcases hc with rfl | rfl
    · exact O.packet.survives₁
    · exact O.packet.survives₂
  fixedOmissions := {O.deleted}
  fixedOmissions_subset_carrier := by
    intro z hz
    rw [Finset.mem_singleton] at hz
    subst hz
    exact O.deleted_mem_A
  deleted_mem_fixedOmissions := Finset.mem_singleton_self _
  omitted_of_mem_fixedOmissions := by
    intro z hz
    rw [Finset.mem_singleton] at hz
    subst hz
    exact O.deleted_not_mem_kept_shell

/-- The core's source is the oriented record's kept source. -/
@[simp] theorem jointDeletionCore_ofOrientedRetainedCommonDeletion_source
    (O : OrientedRetainedCommonDeletion P) :
    (jointDeletionCore_ofOrientedRetainedCommonDeletion O).source.1 = O.kept :=
  rfl

/-- The core's blocker is the system's chosen blocker at the kept source. -/
@[simp] theorem jointDeletionCore_ofOrientedRetainedCommonDeletion_sourceBlocker
    (O : OrientedRetainedCommonDeletion P) :
    (jointDeletionCore_ofOrientedRetainedCommonDeletion O).sourceBlocker =
      H.centerAt O.kept O.kept_mem_A :=
  rfl

/-- The core's deletion is the oriented record's deleted source. -/
@[simp] theorem jointDeletionCore_ofOrientedRetainedCommonDeletion_deleted
    (O : OrientedRetainedCommonDeletion P) :
    (jointDeletionCore_ofOrientedRetainedCommonDeletion O).deleted.1 =
      O.deleted :=
  rfl

/-- The core's exact row is the system's chosen row at the kept source. -/
theorem jointDeletionCore_ofOrientedRetainedCommonDeletion_exactSourceRow_support
    (O : OrientedRetainedCommonDeletion P) :
    (jointDeletionCore_ofOrientedRetainedCommonDeletion
        O).exactSourceRow.toCriticalFourShell.support =
      (H.selectedAt O.kept O.kept_mem_A).toCriticalFourShell.support :=
  rfl

/-- The core's survival centers are the packet's two centers. -/
@[simp] theorem jointDeletionCore_ofOrientedRetainedCommonDeletion_fixedSurvivals
    (O : OrientedRetainedCommonDeletion P) :
    (jointDeletionCore_ofOrientedRetainedCommonDeletion O).fixedSurvivals =
      ({S.oppApex1, H.centerAt O.kept O.kept_mem_A} : Finset ℝ²) :=
  rfl

/-- The core's single omission is the deleted source. -/
@[simp] theorem jointDeletionCore_ofOrientedRetainedCommonDeletion_fixedOmissions
    (O : OrientedRetainedCommonDeletion P) :
    (jointDeletionCore_ofOrientedRetainedCommonDeletion O).fixedOmissions =
      ({O.deleted} : Finset ℝ²) :=
  rfl

/-- The first opposite apex is a recorded survival center of the core. -/
theorem oppApex1_mem_jointDeletionCore_ofOrientedRetainedCommonDeletion
    (O : OrientedRetainedCommonDeletion P) :
    S.oppApex1 ∈
      (jointDeletionCore_ofOrientedRetainedCommonDeletion O).fixedSurvivals :=
  Finset.mem_insert_self _ _

/- ## The paired apex-class outcome -/

/-- The provenance core of a paired apex-class joint deletion.

The naming of `PairedApexClassJointDeletion` runs against the core's: that
record's `source` field is the escaping point whose deletion it certifies, so in
core terms it is the *deletion*.  The core's source is the kept source of the
oriented walk, because the kept row is one of the two rows the escaping point is
recorded as missing.

Three survival centers are recorded, each with its own hypothesis: the first
opposite apex and the two retained blockers, taken from the record's two
common-deletion packets. -/
def jointDeletionCore_ofPairedApexClass
    {O : OrientedRetainedCommonDeletion P}
    (J : PairedApexClassJointDeletion O) : JointDeletionCore D H where
  source := ⟨O.kept, O.kept_mem_A⟩
  sourceBlocker := H.centerAt O.kept O.kept_mem_A
  sourceBlocker_eq := rfl
  exactSourceRow := H.selectedAt O.kept O.kept_mem_A
  deleted := ⟨J.source, J.source_mem_A⟩
  fixedSurvivals :=
    {S.oppApex1, H.centerAt O.kept O.kept_mem_A,
      H.centerAt O.deleted O.deleted_mem_A}
  fixedSurvivals_subset_carrier := by
    intro c hc
    simp only [Finset.mem_insert, Finset.mem_singleton] at hc
    rcases hc with rfl | rfl | rfl
    · exact J.keptPacket.center₁_mem_A
    · exact J.keptPacket.center₂_mem_A
    · exact J.deletedPacket.center₂_mem_A
  survives_of_mem_fixedSurvivals := by
    intro c hc
    simp only [Finset.mem_insert, Finset.mem_singleton] at hc
    rcases hc with rfl | rfl | rfl
    · exact J.keptPacket.survives₁
    · exact J.keptPacket.survives₂
    · exact J.deletedPacket.survives₂
  fixedOmissions := {J.source}
  fixedOmissions_subset_carrier := by
    intro z hz
    rw [Finset.mem_singleton] at hz
    subst hz
    exact J.source_mem_A
  deleted_mem_fixedOmissions := Finset.mem_singleton_self _
  omitted_of_mem_fixedOmissions := by
    intro z hz
    rw [Finset.mem_singleton] at hz
    subst hz
    exact J.source_not_mem_keptShell

/-- The core's source is the oriented record's kept source. -/
@[simp] theorem jointDeletionCore_ofPairedApexClass_source
    {O : OrientedRetainedCommonDeletion P}
    (J : PairedApexClassJointDeletion O) :
    (jointDeletionCore_ofPairedApexClass J).source.1 = O.kept :=
  rfl

/-- The core's blocker is the system's chosen blocker at the kept source. -/
@[simp] theorem jointDeletionCore_ofPairedApexClass_sourceBlocker
    {O : OrientedRetainedCommonDeletion P}
    (J : PairedApexClassJointDeletion O) :
    (jointDeletionCore_ofPairedApexClass J).sourceBlocker =
      H.centerAt O.kept O.kept_mem_A :=
  rfl

/-- The core's deletion is the escaping class point of the paired record. -/
@[simp] theorem jointDeletionCore_ofPairedApexClass_deleted
    {O : OrientedRetainedCommonDeletion P}
    (J : PairedApexClassJointDeletion O) :
    (jointDeletionCore_ofPairedApexClass J).deleted.1 = J.source :=
  rfl

/-- The core's exact row is the system's chosen row at the kept source. -/
theorem jointDeletionCore_ofPairedApexClass_exactSourceRow_support
    {O : OrientedRetainedCommonDeletion P}
    (J : PairedApexClassJointDeletion O) :
    (jointDeletionCore_ofPairedApexClass
        J).exactSourceRow.toCriticalFourShell.support =
      (H.selectedAt O.kept O.kept_mem_A).toCriticalFourShell.support :=
  rfl

/-- The core's survival centers are the apex and the two retained blockers. -/
@[simp] theorem jointDeletionCore_ofPairedApexClass_fixedSurvivals
    {O : OrientedRetainedCommonDeletion P}
    (J : PairedApexClassJointDeletion O) :
    (jointDeletionCore_ofPairedApexClass J).fixedSurvivals =
      ({S.oppApex1, H.centerAt O.kept O.kept_mem_A,
        H.centerAt O.deleted O.deleted_mem_A} : Finset ℝ²) :=
  rfl

/-- The core's single omission is the escaping class point. -/
@[simp] theorem jointDeletionCore_ofPairedApexClass_fixedOmissions
    {O : OrientedRetainedCommonDeletion P}
    (J : PairedApexClassJointDeletion O) :
    (jointDeletionCore_ofPairedApexClass J).fixedOmissions =
      ({J.source} : Finset ℝ²) :=
  rfl

/-- The first opposite apex is a recorded survival center of the core. -/
theorem oppApex1_mem_jointDeletionCore_ofPairedApexClass
    {O : OrientedRetainedCommonDeletion P}
    (J : PairedApexClassJointDeletion O) :
    S.oppApex1 ∈ (jointDeletionCore_ofPairedApexClass J).fixedSurvivals :=
  Finset.mem_insert_self _ _

/-- The same-radius arm of the paired apex-class outcome.

The class radius the paired record carries is its own datum, and the kept source
is known to lie on the *frontier* radius class, so the agreement of the two
radii is an explicit argument.  It is never inferred, and in particular never
inferred from a class cardinality.  Along the live route produced by
`nonempty_pairedCommonDeletionOutcome` the two radii agree by construction, so
the argument is discharged by `rfl` there. -/
def sameRadiusJointDeletion_ofPairedApexClass
    {O : OrientedRetainedCommonDeletion P}
    (J : PairedApexClassJointDeletion O)
    (hsourceRadius : J.sourceRadius = radius) :
    SameRadiusJointDeletion D H S.oppApex1 :=
  SameRadiusJointDeletion.ofJointDeletionCore (apex := S.oppApex1)
    (jointDeletionCore_ofPairedApexClass J) J.sourceRadius J.sourceRadius_pos
    (by rw [hsourceRadius]; exact O.kept_mem_radius)
    J.source_mem_class (Finset.mem_insert_self _ _)

/-- The cross-radius arm of the paired apex-class outcome.

The mirror of `sameRadiusJointDeletion_ofPairedApexClass`: here the paired
record's class radius is recorded as *different* from the frontier radius, again
as an explicit argument.  The source keeps the frontier radius, the deletion
takes the paired record's radius, and the two radii are distinct by that
argument. -/
def crossRadiusJointDeletion_ofPairedApexClass
    {O : OrientedRetainedCommonDeletion P}
    (J : PairedApexClassJointDeletion O)
    (hsourceRadius : J.sourceRadius ≠ radius) :
    CrossRadiusJointDeletion D H S.oppApex1 :=
  CrossRadiusJointDeletion.ofJointDeletionCore (apex := S.oppApex1)
    (jointDeletionCore_ofPairedApexClass J) radius F.radius_pos J.sourceRadius
    J.sourceRadius_pos (Ne.symm hsourceRadius) O.kept_mem_radius
    J.source_mem_class (Finset.mem_insert_self _ _)

/-- The same-radius arm carries the paired apex-class core. -/
@[simp] theorem sameRadiusJointDeletion_ofPairedApexClass_toJointDeletionCore
    {O : OrientedRetainedCommonDeletion P}
    (J : PairedApexClassJointDeletion O)
    (hsourceRadius : J.sourceRadius = radius) :
    (sameRadiusJointDeletion_ofPairedApexClass J
        hsourceRadius).toJointDeletionCore =
      jointDeletionCore_ofPairedApexClass J :=
  rfl

/-- The cross-radius arm carries the same paired apex-class core. -/
@[simp] theorem crossRadiusJointDeletion_ofPairedApexClass_toJointDeletionCore
    {O : OrientedRetainedCommonDeletion P}
    (J : PairedApexClassJointDeletion O)
    (hsourceRadius : J.sourceRadius ≠ radius) :
    (crossRadiusJointDeletion_ofPairedApexClass J
        hsourceRadius).toJointDeletionCore =
      jointDeletionCore_ofPairedApexClass J :=
  rfl

/- ## The concentric grid branch -/

/-- Two concentric exact four-point classes at one apex, two disjoint critical
rows, and one chosen deletion.

This is the grid branch's own record.  `PairedTwoRadiusGrid` supplies two
concentric first-apex classes of exactly four points, a retained row through the
kept source and a second row through the deleted source, and the disjointness of
those two rows — but it supplies no common-deletion packet, so the point whose
deletion a joint deletion certifies has to be chosen.  The choice arrives here
as three fields: the point, its membership in the second class, and its
membership in the second row.  A caller holding a grid passes
`Gr.deletedOtherFirst` or `Gr.deletedOtherSecond` together with the grid's own
membership hypotheses.

Every geometric fact is a named point or a pointwise hypothesis; no field
records a cardinality in place of a witness.  The two class cardinalities are
used only to build selected four-classes, never to assert provenance. -/
structure ConcentricGridJointDeletion
    (D : CounterexampleData) (H : CriticalShellSystem D.A) (apex : ℝ²) :
    Type where
  /-- The apex is a carrier point. -/
  apex_mem_carrier : apex ∈ D.A
  /-- The carrier vertex whose row is retained. -/
  retained : CriticalShellSystem.CarrierVertex D.A
  /-- The apex radius carrying the retained source. -/
  retainedRadius : ℝ
  /-- That radius is positive. -/
  retainedRadius_pos : 0 < retainedRadius
  /-- The retained source lies on its own apex class. -/
  retained_mem_retainedClass :
    retained.1 ∈ SelectedClass D.A apex retainedRadius
  /-- The retained class has exactly four points. -/
  retainedClass_card_eq_four :
    (SelectedClass D.A apex retainedRadius).card = 4
  /-- The second concentric apex radius. -/
  otherRadius : ℝ
  /-- That radius is positive. -/
  otherRadius_pos : 0 < otherRadius
  /-- The two grid radii are genuinely different. -/
  radii_ne : retainedRadius ≠ otherRadius
  /-- The second class has exactly four points. -/
  otherClass_card_eq_four : (SelectedClass D.A apex otherRadius).card = 4
  /-- The carrier vertex carrying the second of the two disjoint rows. -/
  deletedRowSource : CriticalShellSystem.CarrierVertex D.A
  /-- The two rows share no point. -/
  rows_disjoint :
    Disjoint (H.selectedAt retained.1 retained.2).toCriticalFourShell.support
      (H.selectedAt deletedRowSource.1
        deletedRowSource.2).toCriticalFourShell.support
  /-- The chosen deletion. -/
  deleted : CriticalShellSystem.CarrierVertex D.A
  /-- The chosen deletion lies on the second class. -/
  deleted_mem_otherClass : deleted.1 ∈ SelectedClass D.A apex otherRadius
  /-- The chosen deletion lies on the second row. -/
  deleted_mem_deletedRow :
    deleted.1 ∈
      (H.selectedAt deletedRowSource.1
        deletedRowSource.2).toCriticalFourShell.support

namespace ConcentricGridJointDeletion

variable {apex : ℝ²}

/-- The chosen deletion misses the retained row, because the two rows are
disjoint. -/
theorem deleted_not_mem_retainedRow (G : ConcentricGridJointDeletion D H apex) :
    G.deleted.1 ∉
      (H.selectedAt G.retained.1 G.retained.2).toCriticalFourShell.support :=
  Finset.disjoint_right.mp G.rows_disjoint G.deleted_mem_deletedRow

/-- The chosen deletion misses the retained class, because the two concentric
classes at one apex and distinct radii share no point. -/
theorem deleted_not_mem_retainedClass
    (G : ConcentricGridJointDeletion D H apex) :
    G.deleted.1 ∉ SelectedClass D.A apex G.retainedRadius :=
  Finset.disjoint_right.mp
    (selectedClass_disjoint_of_radius_ne G.radii_ne) G.deleted_mem_otherClass

/-- The retained class, as a selected four-class at the apex.  This is the
survival witness the grid branch uses: the class itself, not a count. -/
def retainedFourClass (G : ConcentricGridJointDeletion D H apex) :
    SelectedFourClass D.A apex :=
  SelectedFourClass.ofSelectedClass G.retainedRadius_pos
    G.retainedClass_card_eq_four

/-- Erasing the chosen deletion leaves a four-point class at the apex: the
retained class is disjoint from the deletion, so it survives whole. -/
theorem apex_survives_deleted (G : ConcentricGridJointDeletion D H apex) :
    HasNEquidistantPointsAt 4 (D.A.erase G.deleted.1) apex :=
  ATailDeletionRobustness.selectedFourClass_survives_erase_of_not_mem
    G.retainedFourClass G.deleted_not_mem_retainedClass

/-- Erasing the chosen deletion leaves a four-point class at the retained
source's blocker: the deletion misses the retained row. -/
theorem retainedBlocker_survives_deleted
    (G : ConcentricGridJointDeletion D H apex) :
    HasNEquidistantPointsAt 4 (D.A.erase G.deleted.1)
      (H.centerAt G.retained.1 G.retained.2) :=
  (cross_deletion_survives_iff_not_mem_selected_support H G.retained.2).mpr
    G.deleted_not_mem_retainedRow

/-- The retained source's blocker is a carrier point. -/
theorem retainedBlocker_mem_carrier
    (G : ConcentricGridJointDeletion D H apex) :
    H.centerAt G.retained.1 G.retained.2 ∈ D.A :=
  (Finset.mem_erase.mp
    (H.selectedAt G.retained.1 G.retained.2).toCriticalFourShell.center_mem).2

end ConcentricGridJointDeletion

/-- The cross-radius joint deletion of a concentric grid.

The grid branch is a genuine cross-radius arm and is built as one, not routed
silently through the apex-class reader: its source is the retained source on the
retained radius, and its deletion is the grid's own chosen point on the second
radius.

Both survivals are constructed, because the grid carries no packet.  At the apex
the survival witness is the retained class itself, disjoint from the deletion;
at the retained source's blocker the witness is the omission of the deletion
from the retained row.  No survival is asserted from a count alone. -/
def crossRadiusJointDeletion_ofConcentricGrid {apex : ℝ²}
    (G : ConcentricGridJointDeletion D H apex) :
    CrossRadiusJointDeletion D H apex :=
  CrossRadiusJointDeletion.ofJointDeletionCore (apex := apex)
    { source := G.retained
      sourceBlocker := H.centerAt G.retained.1 G.retained.2
      sourceBlocker_eq := rfl
      exactSourceRow := H.selectedAt G.retained.1 G.retained.2
      deleted := G.deleted
      fixedSurvivals := {apex, H.centerAt G.retained.1 G.retained.2}
      fixedSurvivals_subset_carrier := by
        intro c hc
        simp only [Finset.mem_insert, Finset.mem_singleton] at hc
        rcases hc with rfl | rfl
        · exact G.apex_mem_carrier
        · exact G.retainedBlocker_mem_carrier
      survives_of_mem_fixedSurvivals := by
        intro c hc
        simp only [Finset.mem_insert, Finset.mem_singleton] at hc
        rcases hc with rfl | rfl
        · exact G.apex_survives_deleted
        · exact G.retainedBlocker_survives_deleted
      fixedOmissions := {G.deleted.1}
      fixedOmissions_subset_carrier := by
        intro z hz
        rw [Finset.mem_singleton] at hz
        subst hz
        exact G.deleted.2
      deleted_mem_fixedOmissions := Finset.mem_singleton_self _
      omitted_of_mem_fixedOmissions := by
        intro z hz
        rw [Finset.mem_singleton] at hz
        subst hz
        exact G.deleted_not_mem_retainedRow }
    G.retainedRadius G.retainedRadius_pos G.otherRadius G.otherRadius_pos
    G.radii_ne G.retained_mem_retainedClass G.deleted_mem_otherClass
    (Finset.mem_insert_self _ _)

/-- The grid arm's source is the grid's retained source. -/
@[simp] theorem crossRadiusJointDeletion_ofConcentricGrid_source {apex : ℝ²}
    (G : ConcentricGridJointDeletion D H apex) :
    (crossRadiusJointDeletion_ofConcentricGrid G).source = G.retained :=
  rfl

/-- The grid arm's blocker is the system's chosen blocker at the retained
source. -/
@[simp] theorem crossRadiusJointDeletion_ofConcentricGrid_sourceBlocker
    {apex : ℝ²} (G : ConcentricGridJointDeletion D H apex) :
    (crossRadiusJointDeletion_ofConcentricGrid G).sourceBlocker =
      H.centerAt G.retained.1 G.retained.2 :=
  rfl

/-- The grid arm's deletion is the grid's chosen point. -/
@[simp] theorem crossRadiusJointDeletion_ofConcentricGrid_deleted {apex : ℝ²}
    (G : ConcentricGridJointDeletion D H apex) :
    (crossRadiusJointDeletion_ofConcentricGrid G).deleted = G.deleted :=
  rfl

/-- The grid arm's exact row is the system's chosen row at the retained
source. -/
theorem crossRadiusJointDeletion_ofConcentricGrid_exactSourceRow_support
    {apex : ℝ²} (G : ConcentricGridJointDeletion D H apex) :
    (crossRadiusJointDeletion_ofConcentricGrid
        G).exactSourceRow.toCriticalFourShell.support =
      (H.selectedAt G.retained.1 G.retained.2).toCriticalFourShell.support :=
  rfl

/-- The grid arm's survival centers are the apex and the retained blocker. -/
@[simp] theorem crossRadiusJointDeletion_ofConcentricGrid_fixedSurvivals
    {apex : ℝ²} (G : ConcentricGridJointDeletion D H apex) :
    (crossRadiusJointDeletion_ofConcentricGrid G).fixedSurvivals =
      ({apex, H.centerAt G.retained.1 G.retained.2} : Finset ℝ²) :=
  rfl

/-- The grid arm's single omission is the chosen deletion. -/
@[simp] theorem crossRadiusJointDeletion_ofConcentricGrid_fixedOmissions
    {apex : ℝ²} (G : ConcentricGridJointDeletion D H apex) :
    (crossRadiusJointDeletion_ofConcentricGrid G).fixedOmissions =
      ({G.deleted.1} : Finset ℝ²) :=
  rfl

/-- Read a concentric grid record off the live two-radius grid.

The deletion is the caller's choice, supplied as a point together with its
membership in the second first-apex class and in the deleted source's row.  The
grid's own projections `deletedOtherFirst_mem_other` and
`deletedOtherFirst_mem_deletedShell` (or their `deletedOtherSecond`
counterparts) discharge those two arguments. -/
def concentricGridJointDeletion_ofPairedTwoRadiusGrid
    {O : OrientedRetainedCommonDeletion P} (Gr : PairedTwoRadiusGrid O)
    (chosen : ℝ²)
    (hchosen_mem_other :
      chosen ∈ SelectedClass D.A S.oppApex1 Gr.otherRadius)
    (hchosen_mem_deletedShell :
      chosen ∈
        (H.selectedAt O.deleted O.deleted_mem_A).toCriticalFourShell.support) :
    ConcentricGridJointDeletion D H S.oppApex1 where
  apex_mem_carrier := oppApex1_mem_carrier S
  retained := ⟨O.kept, O.kept_mem_A⟩
  retainedRadius := radius
  retainedRadius_pos := F.radius_pos
  retained_mem_retainedClass := O.kept_mem_radius
  retainedClass_card_eq_four := Gr.retainedClass_card_eq_four
  otherRadius := Gr.otherRadius
  otherRadius_pos := Gr.otherRadius_pos
  radii_ne := Ne.symm Gr.otherRadius_ne_radius
  otherClass_card_eq_four := Gr.otherClass_card_eq_four
  deletedRowSource := ⟨O.deleted, O.deleted_mem_A⟩
  rows_disjoint := Gr.shells_disjoint
  deleted := ⟨chosen, (mem_selectedClass.mp hchosen_mem_other).1⟩
  deleted_mem_otherClass := hchosen_mem_other
  deleted_mem_deletedRow := hchosen_mem_deletedShell

/-- The grid record built from the live grid keeps the kept source. -/
@[simp] theorem concentricGridJointDeletion_ofPairedTwoRadiusGrid_retained
    {O : OrientedRetainedCommonDeletion P} (Gr : PairedTwoRadiusGrid O)
    (chosen : ℝ²)
    (hchosen_mem_other :
      chosen ∈ SelectedClass D.A S.oppApex1 Gr.otherRadius)
    (hchosen_mem_deletedShell :
      chosen ∈
        (H.selectedAt O.deleted O.deleted_mem_A).toCriticalFourShell.support) :
    (concentricGridJointDeletion_ofPairedTwoRadiusGrid Gr chosen
        hchosen_mem_other hchosen_mem_deletedShell).retained.1 = O.kept :=
  rfl

/-- The grid record built from the live grid keeps the chosen deletion. -/
@[simp] theorem concentricGridJointDeletion_ofPairedTwoRadiusGrid_deleted
    {O : OrientedRetainedCommonDeletion P} (Gr : PairedTwoRadiusGrid O)
    (chosen : ℝ²)
    (hchosen_mem_other :
      chosen ∈ SelectedClass D.A S.oppApex1 Gr.otherRadius)
    (hchosen_mem_deletedShell :
      chosen ∈
        (H.selectedAt O.deleted O.deleted_mem_A).toCriticalFourShell.support) :
    (concentricGridJointDeletion_ofPairedTwoRadiusGrid Gr chosen
        hchosen_mem_other hchosen_mem_deletedShell).deleted.1 = chosen :=
  rfl

/-- The grid record built from the live grid keeps the two grid radii. -/
@[simp] theorem concentricGridJointDeletion_ofPairedTwoRadiusGrid_radii
    {O : OrientedRetainedCommonDeletion P} (Gr : PairedTwoRadiusGrid O)
    (chosen : ℝ²)
    (hchosen_mem_other :
      chosen ∈ SelectedClass D.A S.oppApex1 Gr.otherRadius)
    (hchosen_mem_deletedShell :
      chosen ∈
        (H.selectedAt O.deleted O.deleted_mem_A).toCriticalFourShell.support) :
    (concentricGridJointDeletion_ofPairedTwoRadiusGrid Gr chosen
          hchosen_mem_other hchosen_mem_deletedShell).retainedRadius = radius ∧
      (concentricGridJointDeletion_ofPairedTwoRadiusGrid Gr chosen
          hchosen_mem_other hchosen_mem_deletedShell).otherRadius =
        Gr.otherRadius :=
  ⟨rfl, rfl⟩

/- ## The tagged paired provenance -/

/-- The paired outcome's provenance, with the branch the live geometry reached
kept as a constructor tag and the originating datum kept with it.

Three arms, not two: the apex-class outcome splits by whether its own class
radius agrees with the frontier radius, and the grid outcome keeps its own
branch rather than being folded into the cross-radius apex-class arm.  The grid
arm's provenance core deletes a chosen point of the second class, which is a
different deletion from the escaping point the apex-class arms delete, so the
two shapes are kept apart.

Every constructor binds its payload to `O`.  The apex-class arms carry a
`PairedApexClassJointDeletion O` together with the radius comparison that arm
was selected by; the grid arm carries a `PairedTwoRadiusGrid O` together with
the chosen deletion and the two memberships
`concentricGridJointDeletion_ofPairedTwoRadiusGrid` consumes.  No constructor
accepts a free normalized record, so a packet from an unrelated configuration
cannot be tagged as provenance of `O`.  The normalized records come back as the
projections `toSameRadius`, `toCrossRadius` and `toConcentricGrid`. -/
inductive PairedCommonDeletionProvenance
    (O : OrientedRetainedCommonDeletion P) : Type
  /-- The escaping class point shares the frontier radius with the kept
  source. -/
  | sameRadius (J : PairedApexClassJointDeletion O)
      (hsourceRadius : J.sourceRadius = radius)
  /-- The escaping class point sits on a first-apex radius different from the
  frontier radius. -/
  | crossRadiusApexClass (J : PairedApexClassJointDeletion O)
      (hsourceRadius : J.sourceRadius ≠ radius)
  /-- The configuration saturated into the two-radius grid, and the deletion is
  a chosen point of the second class, supplied with its membership in that class
  and in the deleted source's row. -/
  | crossRadiusGrid (Gr : PairedTwoRadiusGrid O) (chosen : ℝ²)
      (hchosen_mem_other :
        chosen ∈ SelectedClass D.A S.oppApex1 Gr.otherRadius)
      (hchosen_mem_deletedShell :
        chosen ∈
          (H.selectedAt O.deleted
            O.deleted_mem_A).toCriticalFourShell.support)

namespace PairedCommonDeletionProvenance

variable {O : OrientedRetainedCommonDeletion P}

/-- The same-radius reading, computed from the carried apex-class datum through
`sameRadiusJointDeletion_ofPairedApexClass`.  Only the same-radius arm has
one. -/
def toSameRadius :
    PairedCommonDeletionProvenance O →
      Option (SameRadiusJointDeletion D H S.oppApex1)
  | .sameRadius J hsourceRadius =>
      some (sameRadiusJointDeletion_ofPairedApexClass J hsourceRadius)
  | .crossRadiusApexClass _ _ => none
  | .crossRadiusGrid _ _ _ _ => none

/-- The cross-radius reading, computed from the carried datum: through
`crossRadiusJointDeletion_ofPairedApexClass` on the apex-class arm and through
`crossRadiusJointDeletion_ofConcentricGrid` on the grid arm.  The same-radius
arm has none. -/
def toCrossRadius :
    PairedCommonDeletionProvenance O →
      Option (CrossRadiusJointDeletion D H S.oppApex1)
  | .sameRadius _ _ => none
  | .crossRadiusApexClass J hsourceRadius =>
      some (crossRadiusJointDeletion_ofPairedApexClass J hsourceRadius)
  | .crossRadiusGrid Gr chosen hchosen_mem_other hchosen_mem_deletedShell =>
      some (crossRadiusJointDeletion_ofConcentricGrid
        (concentricGridJointDeletion_ofPairedTwoRadiusGrid Gr chosen
          hchosen_mem_other hchosen_mem_deletedShell))

/-- The concentric-grid reading, computed from the carried grid and its chosen
deletion through `concentricGridJointDeletion_ofPairedTwoRadiusGrid`.  Only the
grid arm has one. -/
def toConcentricGrid :
    PairedCommonDeletionProvenance O →
      Option (ConcentricGridJointDeletion D H S.oppApex1)
  | .sameRadius _ _ => none
  | .crossRadiusApexClass _ _ => none
  | .crossRadiusGrid Gr chosen hchosen_mem_other hchosen_mem_deletedShell =>
      some (concentricGridJointDeletion_ofPairedTwoRadiusGrid Gr chosen
        hchosen_mem_other hchosen_mem_deletedShell)

/-- Forget the branch tag and keep the apex radius mode.  Each arm reads its
carried datum through its own adapter; the grid arm is a cross-radius arm, read
through `crossRadiusJointDeletion_ofConcentricGrid`. -/
def toApexRadiusMode :
    PairedCommonDeletionProvenance O → ApexRadiusMode D H S.oppApex1
  | .sameRadius J hsourceRadius =>
      .sameRadius (sameRadiusJointDeletion_ofPairedApexClass J hsourceRadius)
  | .crossRadiusApexClass J hsourceRadius =>
      .crossRadius (crossRadiusJointDeletion_ofPairedApexClass J hsourceRadius)
  | .crossRadiusGrid Gr chosen hchosen_mem_other hchosen_mem_deletedShell =>
      .crossRadius (crossRadiusJointDeletion_ofConcentricGrid
        (concentricGridJointDeletion_ofPairedTwoRadiusGrid Gr chosen
          hchosen_mem_other hchosen_mem_deletedShell))

/-- The provenance core underlying any of the three arms. -/
def toJointDeletionCore (Q : PairedCommonDeletionProvenance O) :
    JointDeletionCore D H :=
  Q.toApexRadiusMode.toJointDeletionCore

/-- The first opposite apex is a recorded survival center in every arm. -/
theorem apex_mem_fixedSurvivals (Q : PairedCommonDeletionProvenance O) :
    S.oppApex1 ∈ Q.toJointDeletionCore.fixedSurvivals :=
  Q.toApexRadiusMode.apex_mem_fixedSurvivals

/-- Deleting the recorded point leaves a four-point class at the first opposite
apex, in every arm. -/
theorem apex_survives (Q : PairedCommonDeletionProvenance O) :
    HasNEquidistantPointsAt 4
      (D.A.erase Q.toJointDeletionCore.deleted.1) S.oppApex1 :=
  Q.toApexRadiusMode.apex_survives

/- ### The projections agree with the standalone adapters -/

/-- The same-radius arm's reading is the standalone same-radius adapter applied
to the datum the arm carries. -/
@[simp] theorem toSameRadius_sameRadius (J : PairedApexClassJointDeletion O)
    (hsourceRadius : J.sourceRadius = radius) :
    (sameRadius J hsourceRadius).toSameRadius =
      some (sameRadiusJointDeletion_ofPairedApexClass J hsourceRadius) :=
  rfl

/-- The cross-radius apex-class arm's reading is the standalone cross-radius
adapter applied to the datum the arm carries. -/
@[simp] theorem toCrossRadius_crossRadiusApexClass
    (J : PairedApexClassJointDeletion O)
    (hsourceRadius : J.sourceRadius ≠ radius) :
    (crossRadiusApexClass J hsourceRadius).toCrossRadius =
      some (crossRadiusJointDeletion_ofPairedApexClass J hsourceRadius) :=
  rfl

/-- The grid arm's grid reading is the standalone grid adapter applied to the
grid and the chosen deletion the arm carries. -/
@[simp] theorem toConcentricGrid_crossRadiusGrid (Gr : PairedTwoRadiusGrid O)
    (chosen : ℝ²)
    (hchosen_mem_other :
      chosen ∈ SelectedClass D.A S.oppApex1 Gr.otherRadius)
    (hchosen_mem_deletedShell :
      chosen ∈
        (H.selectedAt O.deleted O.deleted_mem_A).toCriticalFourShell.support) :
    (crossRadiusGrid Gr chosen hchosen_mem_other
        hchosen_mem_deletedShell).toConcentricGrid =
      some (concentricGridJointDeletion_ofPairedTwoRadiusGrid Gr chosen
        hchosen_mem_other hchosen_mem_deletedShell) :=
  rfl

/-- The grid arm's cross-radius reading is the standalone grid cross-radius
adapter applied to the grid record the arm's own data build. -/
@[simp] theorem toCrossRadius_crossRadiusGrid (Gr : PairedTwoRadiusGrid O)
    (chosen : ℝ²)
    (hchosen_mem_other :
      chosen ∈ SelectedClass D.A S.oppApex1 Gr.otherRadius)
    (hchosen_mem_deletedShell :
      chosen ∈
        (H.selectedAt O.deleted O.deleted_mem_A).toCriticalFourShell.support) :
    (crossRadiusGrid Gr chosen hchosen_mem_other
        hchosen_mem_deletedShell).toCrossRadius =
      some (crossRadiusJointDeletion_ofConcentricGrid
        (concentricGridJointDeletion_ofPairedTwoRadiusGrid Gr chosen
          hchosen_mem_other hchosen_mem_deletedShell)) :=
  rfl

/-- The same-radius arm has no cross-radius reading and no grid reading. -/
@[simp] theorem toCrossRadius_sameRadius (J : PairedApexClassJointDeletion O)
    (hsourceRadius : J.sourceRadius = radius) :
    (sameRadius J hsourceRadius).toCrossRadius = none :=
  rfl

/-- The cross-radius apex-class arm has no same-radius reading. -/
@[simp] theorem toSameRadius_crossRadiusApexClass
    (J : PairedApexClassJointDeletion O)
    (hsourceRadius : J.sourceRadius ≠ radius) :
    (crossRadiusApexClass J hsourceRadius).toSameRadius = none :=
  rfl

/-- The grid arm has no same-radius reading. -/
@[simp] theorem toSameRadius_crossRadiusGrid (Gr : PairedTwoRadiusGrid O)
    (chosen : ℝ²)
    (hchosen_mem_other :
      chosen ∈ SelectedClass D.A S.oppApex1 Gr.otherRadius)
    (hchosen_mem_deletedShell :
      chosen ∈
        (H.selectedAt O.deleted O.deleted_mem_A).toCriticalFourShell.support) :
    (crossRadiusGrid Gr chosen hchosen_mem_other
        hchosen_mem_deletedShell).toSameRadius = none :=
  rfl

/- ### Per-branch projection of the provenance core -/

/-- The same-radius arm projects to the paired apex-class core of the datum it
carries. -/
@[simp] theorem toJointDeletionCore_sameRadius
    (J : PairedApexClassJointDeletion O)
    (hsourceRadius : J.sourceRadius = radius) :
    (sameRadius J hsourceRadius).toJointDeletionCore =
      jointDeletionCore_ofPairedApexClass J :=
  rfl

/-- In the same-radius arm the recorded source is the oriented record's kept
source. -/
@[simp] theorem toJointDeletionCore_sameRadius_source
    (J : PairedApexClassJointDeletion O)
    (hsourceRadius : J.sourceRadius = radius) :
    (sameRadius J hsourceRadius).toJointDeletionCore.source.1 = O.kept :=
  rfl

/-- In the same-radius arm the recorded blocker is the system's chosen blocker
at the kept source. -/
@[simp] theorem toJointDeletionCore_sameRadius_sourceBlocker
    (J : PairedApexClassJointDeletion O)
    (hsourceRadius : J.sourceRadius = radius) :
    (sameRadius J hsourceRadius).toJointDeletionCore.sourceBlocker =
      H.centerAt O.kept O.kept_mem_A :=
  rfl

/-- In the same-radius arm the recorded deletion is the datum's own escaping
class point. -/
@[simp] theorem toJointDeletionCore_sameRadius_deleted
    (J : PairedApexClassJointDeletion O)
    (hsourceRadius : J.sourceRadius = radius) :
    (sameRadius J hsourceRadius).toJointDeletionCore.deleted.1 = J.source :=
  rfl

/-- The cross-radius apex-class arm projects to the same paired apex-class
core. -/
@[simp] theorem toJointDeletionCore_crossRadiusApexClass
    (J : PairedApexClassJointDeletion O)
    (hsourceRadius : J.sourceRadius ≠ radius) :
    (crossRadiusApexClass J hsourceRadius).toJointDeletionCore =
      jointDeletionCore_ofPairedApexClass J :=
  rfl

/-- In the cross-radius apex-class arm the recorded source is the oriented
record's kept source. -/
@[simp] theorem toJointDeletionCore_crossRadiusApexClass_source
    (J : PairedApexClassJointDeletion O)
    (hsourceRadius : J.sourceRadius ≠ radius) :
    (crossRadiusApexClass J hsourceRadius).toJointDeletionCore.source.1 =
      O.kept :=
  rfl

/-- In the cross-radius apex-class arm the recorded blocker is the system's
chosen blocker at the kept source. -/
@[simp] theorem toJointDeletionCore_crossRadiusApexClass_sourceBlocker
    (J : PairedApexClassJointDeletion O)
    (hsourceRadius : J.sourceRadius ≠ radius) :
    (crossRadiusApexClass J hsourceRadius).toJointDeletionCore.sourceBlocker =
      H.centerAt O.kept O.kept_mem_A :=
  rfl

/-- In the cross-radius apex-class arm the recorded deletion is the datum's own
escaping class point. -/
@[simp] theorem toJointDeletionCore_crossRadiusApexClass_deleted
    (J : PairedApexClassJointDeletion O)
    (hsourceRadius : J.sourceRadius ≠ radius) :
    (crossRadiusApexClass J hsourceRadius).toJointDeletionCore.deleted.1 =
      J.source :=
  rfl

/-- The grid arm projects to the grid's own core, whose deletion is the chosen
point.  This is a different core shape from the apex-class arms', which is why
the projection is stated per branch. -/
@[simp] theorem toJointDeletionCore_crossRadiusGrid (Gr : PairedTwoRadiusGrid O)
    (chosen : ℝ²)
    (hchosen_mem_other :
      chosen ∈ SelectedClass D.A S.oppApex1 Gr.otherRadius)
    (hchosen_mem_deletedShell :
      chosen ∈
        (H.selectedAt O.deleted O.deleted_mem_A).toCriticalFourShell.support) :
    (crossRadiusGrid Gr chosen hchosen_mem_other
        hchosen_mem_deletedShell).toJointDeletionCore =
      (crossRadiusJointDeletion_ofConcentricGrid
        (concentricGridJointDeletion_ofPairedTwoRadiusGrid Gr chosen
          hchosen_mem_other
          hchosen_mem_deletedShell)).toJointDeletionCore :=
  rfl

/-- In the grid arm the recorded source is the oriented record's kept source,
which is the grid record's retained source. -/
@[simp] theorem toJointDeletionCore_crossRadiusGrid_source
    (Gr : PairedTwoRadiusGrid O) (chosen : ℝ²)
    (hchosen_mem_other :
      chosen ∈ SelectedClass D.A S.oppApex1 Gr.otherRadius)
    (hchosen_mem_deletedShell :
      chosen ∈
        (H.selectedAt O.deleted O.deleted_mem_A).toCriticalFourShell.support) :
    (crossRadiusGrid Gr chosen hchosen_mem_other
        hchosen_mem_deletedShell).toJointDeletionCore.source.1 = O.kept :=
  rfl

/-- In the grid arm the recorded blocker is the system's chosen blocker at the
kept source. -/
@[simp] theorem toJointDeletionCore_crossRadiusGrid_sourceBlocker
    (Gr : PairedTwoRadiusGrid O) (chosen : ℝ²)
    (hchosen_mem_other :
      chosen ∈ SelectedClass D.A S.oppApex1 Gr.otherRadius)
    (hchosen_mem_deletedShell :
      chosen ∈
        (H.selectedAt O.deleted O.deleted_mem_A).toCriticalFourShell.support) :
    (crossRadiusGrid Gr chosen hchosen_mem_other
        hchosen_mem_deletedShell).toJointDeletionCore.sourceBlocker =
      H.centerAt O.kept O.kept_mem_A :=
  rfl

/-- In the grid arm the recorded deletion is the chosen point the arm
carries. -/
@[simp] theorem toJointDeletionCore_crossRadiusGrid_deleted
    (Gr : PairedTwoRadiusGrid O) (chosen : ℝ²)
    (hchosen_mem_other :
      chosen ∈ SelectedClass D.A S.oppApex1 Gr.otherRadius)
    (hchosen_mem_deletedShell :
      chosen ∈
        (H.selectedAt O.deleted O.deleted_mem_A).toCriticalFourShell.support) :
    (crossRadiusGrid Gr chosen hchosen_mem_other
        hchosen_mem_deletedShell).toJointDeletionCore.deleted.1 = chosen :=
  rfl

end PairedCommonDeletionProvenance

/-- Tag a paired apex-class joint deletion with its radius branch.

The split compares the record's own class radius with the ambient frontier
radius under classical decidability.  It is a comparison of two reals, never a
cardinality test.  Either branch stores the record itself together with the
comparison it was selected by, so the tagged value keeps its origin. -/
def pairedCommonDeletionProvenance_ofPairedApexClass
    {O : OrientedRetainedCommonDeletion P}
    (J : PairedApexClassJointDeletion O) :
    PairedCommonDeletionProvenance O :=
  if hEq : J.sourceRadius = radius then
    .sameRadius J hEq
  else
    .crossRadiusApexClass J hEq

/-- Tag a paired common-deletion outcome with its branch.

Total.  The apex-class outcome goes through
`pairedCommonDeletionProvenance_ofPairedApexClass`, and the grid outcome goes to
the grid branch, storing the grid itself with `deletedOtherFirst` as the chosen
deletion and the grid's own two memberships. -/
def pairedCommonDeletionProvenance_ofPairedCommonDeletionOutcome
    {O : OrientedRetainedCommonDeletion P} :
    PairedCommonDeletionOutcome O → PairedCommonDeletionProvenance O
  | .apexClassJointDeletion J => pairedCommonDeletionProvenance_ofPairedApexClass J
  | .twoRadiusGrid Gr =>
      .crossRadiusGrid Gr Gr.deletedOtherFirst Gr.deletedOtherFirst_mem_other
        Gr.deletedOtherFirst_mem_deletedShell

/-- The apex-class outcome is tagged by the radius branch of its record. -/
@[simp] theorem pairedCommonDeletionProvenance_apexClassJointDeletion
    {O : OrientedRetainedCommonDeletion P}
    (J : PairedApexClassJointDeletion O) :
    pairedCommonDeletionProvenance_ofPairedCommonDeletionOutcome
        (PairedCommonDeletionOutcome.apexClassJointDeletion J) =
      pairedCommonDeletionProvenance_ofPairedApexClass J :=
  rfl

/-- On the apex-class outcome with agreeing radii the tag is the same-radius
arm. -/
theorem pairedCommonDeletionProvenance_apexClass_of_radius_eq
    {O : OrientedRetainedCommonDeletion P}
    (J : PairedApexClassJointDeletion O) (hEq : J.sourceRadius = radius) :
    pairedCommonDeletionProvenance_ofPairedApexClass J =
      .sameRadius J hEq := by
  unfold pairedCommonDeletionProvenance_ofPairedApexClass
  rw [dif_pos hEq]

/-- On the apex-class outcome with differing radii the tag is the cross-radius
apex-class arm. -/
theorem pairedCommonDeletionProvenance_apexClass_of_radius_ne
    {O : OrientedRetainedCommonDeletion P}
    (J : PairedApexClassJointDeletion O) (hNe : J.sourceRadius ≠ radius) :
    pairedCommonDeletionProvenance_ofPairedApexClass J =
      .crossRadiusApexClass J hNe :=
  by
  unfold pairedCommonDeletionProvenance_ofPairedApexClass
  rw [dif_neg hNe]

/-- On the grid outcome the tag is the grid arm, carrying the grid itself with
`deletedOtherFirst` as the chosen deletion. -/
theorem pairedCommonDeletionProvenance_twoRadiusGrid
    {O : OrientedRetainedCommonDeletion P} (Gr : PairedTwoRadiusGrid O) :
    pairedCommonDeletionProvenance_ofPairedCommonDeletionOutcome
        (PairedCommonDeletionOutcome.twoRadiusGrid Gr) =
      .crossRadiusGrid Gr Gr.deletedOtherFirst Gr.deletedOtherFirst_mem_other
        Gr.deletedOtherFirst_mem_deletedShell :=
  rfl

/-- On either apex-class branch the tagged provenance carries the paired
apex-class core, whose deletion is the escaping class point. -/
theorem toJointDeletionCore_ofPairedApexClass
    {O : OrientedRetainedCommonDeletion P}
    (J : PairedApexClassJointDeletion O) :
    (pairedCommonDeletionProvenance_ofPairedCommonDeletionOutcome
        (PairedCommonDeletionOutcome.apexClassJointDeletion
          J)).toJointDeletionCore =
      jointDeletionCore_ofPairedApexClass J := by
  rw [pairedCommonDeletionProvenance_apexClassJointDeletion]
  unfold pairedCommonDeletionProvenance_ofPairedApexClass
  by_cases hEq : J.sourceRadius = radius
  · rw [dif_pos hEq]; rfl
  · rw [dif_neg hEq]; rfl

/-- On the grid branch the tagged provenance carries the grid's own core, whose
deletion is `deletedOtherFirst`.  Stated separately from the apex-class
projection because the two cores are different records. -/
theorem toJointDeletionCore_ofPairedTwoRadiusGrid
    {O : OrientedRetainedCommonDeletion P} (Gr : PairedTwoRadiusGrid O) :
    (pairedCommonDeletionProvenance_ofPairedCommonDeletionOutcome
        (PairedCommonDeletionOutcome.twoRadiusGrid Gr)).toJointDeletionCore =
      (crossRadiusJointDeletion_ofConcentricGrid
          (concentricGridJointDeletion_ofPairedTwoRadiusGrid Gr
            Gr.deletedOtherFirst Gr.deletedOtherFirst_mem_other
            Gr.deletedOtherFirst_mem_deletedShell)).toJointDeletionCore :=
  rfl

/-- On the grid branch the recorded deletion is the grid's first second-class
hit on the deleted source's row. -/
@[simp] theorem toJointDeletionCore_ofPairedTwoRadiusGrid_deleted
    {O : OrientedRetainedCommonDeletion P} (Gr : PairedTwoRadiusGrid O) :
    (pairedCommonDeletionProvenance_ofPairedCommonDeletionOutcome
          (PairedCommonDeletionOutcome.twoRadiusGrid
            Gr)).toJointDeletionCore.deleted.1 =
      Gr.deletedOtherFirst :=
  rfl

/- ## Existence from the live geometry -/

/-- A stored retained interior common deletion produces a provenance core.

The hypotheses are exactly those of `nonempty_orientedRetainedCommonDeletion`:
the directed omission and the stored common-deletion constructor.  Nothing new
is assumed. -/
theorem nonempty_jointDeletionCore_of_retainedInteriorCommonDeletion
    (P : RetainedInteriorDirectedOmission R)
    (C : RetainedInteriorCommonDeletion P) :
    Nonempty (JointDeletionCore D H) := by
  rcases nonempty_orientedRetainedCommonDeletion P C with ⟨O⟩
  exact ⟨jointDeletionCore_ofOrientedRetainedCommonDeletion O⟩

/-- The paired arm produces a tagged provenance.

The hypotheses are exactly those of `nonempty_pairedCommonDeletionOutcome`: the
oriented retained common deletion, the reverse common-deletion packet at the
deleted source's blocker, and the rich-class structure at the first opposite
apex.  Nothing new is assumed. -/
theorem nonempty_pairedCommonDeletionProvenance
    (O : OrientedRetainedCommonDeletion P)
    (reversePacket :
      CommonDeletionTwoCenterPacket D H O.kept S.oppApex1
        (H.centerAt O.deleted O.deleted_mem_A))
    (hrich : ApexRichClassStructure D.A S.oppApex1) :
    Nonempty (PairedCommonDeletionProvenance O) := by
  rcases nonempty_pairedCommonDeletionOutcome O reversePacket hrich with
    ⟨outcome⟩
  exact ⟨pairedCommonDeletionProvenance_ofPairedCommonDeletionOutcome outcome⟩

/-- The paired arm produces an apex radius mode at the first opposite apex,
under the same hypotheses. -/
theorem nonempty_apexRadiusMode_of_pairedCommonDeletion
    (O : OrientedRetainedCommonDeletion P)
    (reversePacket :
      CommonDeletionTwoCenterPacket D H O.kept S.oppApex1
        (H.centerAt O.deleted O.deleted_mem_A))
    (hrich : ApexRichClassStructure D.A S.oppApex1) :
    Nonempty (ApexRadiusMode D H S.oppApex1) := by
  rcases nonempty_pairedCommonDeletionProvenance O reversePacket hrich with ⟨Q⟩
  exact ⟨Q.toApexRadiusMode⟩

end

end ATailFrontierLiveClosure
end Problem97
