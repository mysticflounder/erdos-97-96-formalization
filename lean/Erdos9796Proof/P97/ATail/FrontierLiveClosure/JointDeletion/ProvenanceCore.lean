/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.JointDeletion.Types

/-!
# Provenance-preserving joint-deletion core

The historical packet `ExactFourMutualOmissionJointDeletion` records a carrier
point whose deletion is survived at three centers, but it does not record
*which row supplied that point*.  The two carrier vertices `u` and `v` and the
class radius `ρ` are parameters of its type rather than fields, so a consumer
holding only the packet cannot name the source, its chosen blocker, or the
exact row that produced the omission.

This module introduces the small record that keeps exactly that information.

## `JointDeletionCore`

Five pieces of data, in the order the consolidation audit lists them.

* `source` — the carrier vertex whose row supplied the deletion.
* `sourceBlocker` — the center chosen for that source by the ambient shell
  system `L`, recorded as its own field and pinned by `sourceBlocker_eq`.
* `exactSourceRow` — the exact four-point critical row at that blocker through
  the source.  Its support is forced to agree with the shell system's own
  choice (`exactSourceRow_support_eq_selectedAt`), so recording it separately
  costs no generality and makes the row available by name.
* `fixedSurvivals` — the finite set of centers at which deleting the recorded
  point still leaves a four-point equidistant class, each survival carried as
  an explicit hypothesis rather than as a count.
* `fixedOmissions` — the finite set of carrier points fixed as absent from the
  source row, again with the omission carried pointwise.

`deleted` is a sixth field.  The audit's sketch leaves it implicit, but
`fixedSurvivals` has no subject without it: "survives" is a statement about one
prescribed deletion.  Naming it here is what makes the adapter to the
historical packet total.

Every field is an explicit witness.  No field states a cardinality in place of
a witness, so nothing in this hierarchy derives provenance from a count.

## Radius modes

`SameRadiusJointDeletion` puts the source and the deletion on one radius class
at one apex; `CrossRadiusJointDeletion` puts them on two distinct concentric
classes at that apex.  `ApexRadiusMode` is the two-way choice between them.
The live geometry these two abstract is
`ATailPairedCommonDeletionNormalForm.PairedApexClassJointDeletion` and
`ATailPairedCommonDeletionNormalForm.PairedTwoRadiusGrid`; those two records
are stated against the retained oriented common deletion, while the records
here are stated against a bare shell system, so a producer for either arm can
be written without an oriented walk in hand.

## Adapters

`ExactFourMutualOmissionJointDeletion.toJointDeletionCore` is total: it reads
the historical packet with `u` as the source and needs no extra input.  The
reverse direction `exactFourMutualOmissionJointDeletion_ofJointDeletionCore`
takes the data the core deliberately drops — the class radius, the second
carrier vertex, and the two common-deletion packets — as extra arguments, and
`exactFourMutualOmissionJointDeletion_ofJointDeletionCore_toJointDeletionCore`
shows the round trip returns the original packet.
-/

namespace Problem97
namespace ATailFrontierLiveClosure

open scoped EuclideanGeometry
open ATailCommonDeletionTwoCenter
open ATailCriticalPairFrontier
open ATailUniqueFourLateChoiceTerminalScratch

attribute [local instance] Classical.propDecidable

/-- The provenance-preserving core of a joint deletion.

`L` is the ambient critical-shell system: for the historical exact-four route
it is the late first-apex system, but nothing below depends on that choice.
The record names the source that supplied the deletion, the blocker `L` chose
for it, the exact row at that blocker, the deleted point, the centers that
survive that deletion, and the carrier points fixed as omitted from the row. -/
structure JointDeletionCore
    (D : CounterexampleData) (L : CriticalShellSystem D.A) : Type where
  /-- The carrier vertex whose row supplied the deletion. -/
  source : CriticalShellSystem.CarrierVertex D.A
  /-- The blocker center chosen for `source` by the ambient shell system. -/
  sourceBlocker : ℝ²
  /-- The recorded blocker is the system's own choice for `source`. -/
  sourceBlocker_eq : sourceBlocker = L.centerAt source.1 source.2
  /-- The exact four-point critical row at the source's blocker. -/
  exactSourceRow :
    CriticalSelectedFourClass D.A source.1 (L.centerAt source.1 source.2)
  /-- The carrier vertex whose deletion the packet certifies. -/
  deleted : CriticalShellSystem.CarrierVertex D.A
  /-- The centers recorded as surviving the deletion. -/
  fixedSurvivals : Finset ℝ²
  /-- Every recorded survival center is a carrier point. -/
  fixedSurvivals_subset_carrier : fixedSurvivals ⊆ D.A
  /-- Each recorded center genuinely survives the deletion. -/
  survives_of_mem_fixedSurvivals :
    ∀ c ∈ fixedSurvivals,
      HasNEquidistantPointsAt 4 (D.A.erase deleted.1) c
  /-- The carrier points recorded as absent from the source row. -/
  fixedOmissions : Finset ℝ²
  /-- Every recorded omission is a carrier point. -/
  fixedOmissions_subset_carrier : fixedOmissions ⊆ D.A
  /-- The deletion itself is one of the recorded omissions. -/
  deleted_mem_fixedOmissions : deleted.1 ∈ fixedOmissions
  /-- Each recorded omission genuinely misses the source row. -/
  omitted_of_mem_fixedOmissions :
    ∀ z ∈ fixedOmissions,
      z ∉ exactSourceRow.toCriticalFourShell.support

namespace JointDeletionCore

variable {D : CounterexampleData} {L : CriticalShellSystem D.A}

/-- The source lies on its own exact row. -/
theorem source_mem_exactSourceRow (C : JointDeletionCore D L) :
    C.source.1 ∈ C.exactSourceRow.toCriticalFourShell.support :=
  C.exactSourceRow.toCriticalFourShell.q_mem_support

/-- The recorded exact row has four points. -/
theorem exactSourceRow_card (C : JointDeletionCore D L) :
    C.exactSourceRow.toCriticalFourShell.support.card = 4 :=
  C.exactSourceRow.toCriticalFourShell.support_card

/-- The recorded row agrees with the shell system's own chosen row at the
source's blocker.  Recording the row as a separate field therefore loses no
generality: at a blocker center every exact four-point row is the chosen
one. -/
theorem exactSourceRow_support_eq_selectedAt (C : JointDeletionCore D L) :
    C.exactSourceRow.toCriticalFourShell.support =
      (L.selectedAt C.source.1 C.source.2).toCriticalFourShell.support :=
  L.selectedFourClass_support_eq_shell C.source.1 C.source.2
    C.exactSourceRow.toCriticalFourShell.toSelectedFourClass

/-- The recorded blocker is a carrier point. -/
theorem sourceBlocker_mem_carrier (C : JointDeletionCore D L) :
    C.sourceBlocker ∈ D.A := by
  rw [C.sourceBlocker_eq]
  exact (Finset.mem_erase.mp
    (L.selectedAt C.source.1 C.source.2).toCriticalFourShell.center_mem).2

/-- A source is never its own blocker. -/
theorem sourceBlocker_ne_source (C : JointDeletionCore D L) :
    C.sourceBlocker ≠ C.source.1 := by
  rw [C.sourceBlocker_eq]
  exact (Finset.mem_erase.mp
    (L.selectedAt C.source.1 C.source.2).toCriticalFourShell.center_mem).1

/-- The recorded blocker blocks: deleting the source destroys every four-point
equidistant class at it.  This is the legality condition a canonical-blocker
relation would quantify over. -/
theorem sourceBlocker_blocks (C : JointDeletionCore D L) :
    ¬ HasNEquidistantPointsAt 4 (D.A.erase C.source.1) C.sourceBlocker := by
  rw [C.sourceBlocker_eq]
  exact L.no_qfree_at C.source.1 C.source.2

/-- The deletion misses the source row. -/
theorem deleted_not_mem_exactSourceRow (C : JointDeletionCore D L) :
    C.deleted.1 ∉ C.exactSourceRow.toCriticalFourShell.support :=
  C.omitted_of_mem_fixedOmissions C.deleted.1 C.deleted_mem_fixedOmissions

/-- The deletion misses the shell system's chosen row at the source. -/
theorem deleted_not_mem_selectedAt_source (C : JointDeletionCore D L) :
    C.deleted.1 ∉
      (L.selectedAt C.source.1 C.source.2).toCriticalFourShell.support := by
  rw [← C.exactSourceRow_support_eq_selectedAt]
  exact C.deleted_not_mem_exactSourceRow

/-- The deletion is a different carrier vertex from the source: the source
lies on its own row and the deletion does not. -/
theorem deleted_ne_source (C : JointDeletionCore D L) :
    C.deleted ≠ C.source := by
  intro hEq
  refine C.deleted_not_mem_exactSourceRow ?_
  rw [hEq]
  exact C.source_mem_exactSourceRow

/-- The source is not one of the recorded omissions. -/
theorem source_not_mem_fixedOmissions (C : JointDeletionCore D L) :
    C.source.1 ∉ C.fixedOmissions := by
  intro hmem
  exact C.omitted_of_mem_fixedOmissions C.source.1 hmem
    C.source_mem_exactSourceRow

/-- The recorded omissions are disjoint from the source row. -/
theorem fixedOmissions_disjoint_exactSourceRow (C : JointDeletionCore D L) :
    Disjoint C.fixedOmissions C.exactSourceRow.toCriticalFourShell.support := by
  rw [Finset.disjoint_left]
  exact C.omitted_of_mem_fixedOmissions

/-- The blocker the shell system chose for the deleted point is never a
recorded survival center: it blocks exactly the deletion the survivals
survive. -/
theorem centerAt_deleted_not_mem_fixedSurvivals (C : JointDeletionCore D L) :
    L.centerAt C.deleted.1 C.deleted.2 ∉ C.fixedSurvivals := by
  intro hmem
  exact L.no_qfree_at C.deleted.1 C.deleted.2
    (C.survives_of_mem_fixedSurvivals _ hmem)

/-- Consequently the deleted point's blocker differs from every recorded
survival center. -/
theorem centerAt_deleted_ne_of_mem_fixedSurvivals
    (C : JointDeletionCore D L) {c : ℝ²} (hc : c ∈ C.fixedSurvivals) :
    L.centerAt C.deleted.1 C.deleted.2 ≠ c := by
  intro hEq
  exact C.centerAt_deleted_not_mem_fixedSurvivals (hEq ▸ hc)

end JointDeletionCore

/-- A joint deletion whose source and deleted point lie on one radius class at
one apex.  This is the abstract form of the same-radius arm: the live
`PairedApexClassJointDeletion` supplies exactly this data against the retained
oriented common deletion. -/
structure SameRadiusJointDeletion
    (D : CounterexampleData) (L : CriticalShellSystem D.A) (apex : ℝ²)
    extends JointDeletionCore D L where
  /-- The single apex radius carrying both the source and the deletion. -/
  radius : ℝ
  /-- That radius is positive. -/
  radius_pos : 0 < radius
  /-- The source lies on the apex class. -/
  source_mem_class : source.1 ∈ SelectedClass D.A apex radius
  /-- The deletion lies on the same apex class. -/
  deleted_mem_class : deleted.1 ∈ SelectedClass D.A apex radius
  /-- The apex is one of the recorded survival centers. -/
  apex_mem_fixedSurvivals : apex ∈ fixedSurvivals

namespace SameRadiusJointDeletion

variable {D : CounterexampleData} {L : CriticalShellSystem D.A} {apex : ℝ²}

/-- Deleting the recorded point leaves a four-point class at the apex. -/
theorem apex_survives (J : SameRadiusJointDeletion D L apex) :
    HasNEquidistantPointsAt 4 (D.A.erase J.deleted.1) apex :=
  J.survives_of_mem_fixedSurvivals apex J.apex_mem_fixedSurvivals

/-- The deleted point's own blocker is not the apex. -/
theorem centerAt_deleted_ne_apex (J : SameRadiusJointDeletion D L apex) :
    L.centerAt J.deleted.1 J.deleted.2 ≠ apex :=
  J.centerAt_deleted_ne_of_mem_fixedSurvivals J.apex_mem_fixedSurvivals

/-- Source and deletion are the same distance from the apex. -/
theorem dist_source_eq_dist_deleted (J : SameRadiusJointDeletion D L apex) :
    dist apex J.source.1 = dist apex J.deleted.1 := by
  rw [(mem_selectedClass.mp J.source_mem_class).2,
    (mem_selectedClass.mp J.deleted_mem_class).2]

end SameRadiusJointDeletion

/-- A joint deletion whose source and deleted point lie on two distinct
concentric radius classes at one apex.  This is the abstract form of the
cross-radius arm; the live `PairedTwoRadiusGrid` is the saturated version of
the same two-radius picture. -/
structure CrossRadiusJointDeletion
    (D : CounterexampleData) (L : CriticalShellSystem D.A) (apex : ℝ²)
    extends JointDeletionCore D L where
  /-- The apex radius carrying the source. -/
  sourceRadius : ℝ
  /-- That radius is positive. -/
  sourceRadius_pos : 0 < sourceRadius
  /-- The apex radius carrying the deletion. -/
  deletedRadius : ℝ
  /-- That radius is positive. -/
  deletedRadius_pos : 0 < deletedRadius
  /-- The two radii are genuinely different: this is the cross-radius arm. -/
  radii_ne : sourceRadius ≠ deletedRadius
  /-- The source lies on the source class. -/
  source_mem_sourceClass : source.1 ∈ SelectedClass D.A apex sourceRadius
  /-- The deletion lies on the deleted class. -/
  deleted_mem_deletedClass : deleted.1 ∈ SelectedClass D.A apex deletedRadius
  /-- The apex is one of the recorded survival centers. -/
  apex_mem_fixedSurvivals : apex ∈ fixedSurvivals

namespace CrossRadiusJointDeletion

variable {D : CounterexampleData} {L : CriticalShellSystem D.A} {apex : ℝ²}

/-- Deleting the recorded point leaves a four-point class at the apex. -/
theorem apex_survives (J : CrossRadiusJointDeletion D L apex) :
    HasNEquidistantPointsAt 4 (D.A.erase J.deleted.1) apex :=
  J.survives_of_mem_fixedSurvivals apex J.apex_mem_fixedSurvivals

/-- The deleted point's own blocker is not the apex. -/
theorem centerAt_deleted_ne_apex (J : CrossRadiusJointDeletion D L apex) :
    L.centerAt J.deleted.1 J.deleted.2 ≠ apex :=
  J.centerAt_deleted_ne_of_mem_fixedSurvivals J.apex_mem_fixedSurvivals

/-- Two classes at one center and distinct radii share no point. -/
theorem classes_disjoint (J : CrossRadiusJointDeletion D L apex) :
    Disjoint (SelectedClass D.A apex J.sourceRadius)
      (SelectedClass D.A apex J.deletedRadius) := by
  rw [Finset.disjoint_left]
  intro z hz₁ hz₂
  exact J.radii_ne
    ((mem_selectedClass.mp hz₁).2.symm.trans (mem_selectedClass.mp hz₂).2)

/-- Source and deletion stand at different distances from the apex. -/
theorem dist_source_ne_dist_deleted (J : CrossRadiusJointDeletion D L apex) :
    dist apex J.source.1 ≠ dist apex J.deleted.1 := by
  rw [(mem_selectedClass.mp J.source_mem_sourceClass).2,
    (mem_selectedClass.mp J.deleted_mem_deletedClass).2]
  exact J.radii_ne

end CrossRadiusJointDeletion

/-- The apex radius mode of a joint deletion: the source and the deletion sit
on one apex class, or on two distinct concentric apex classes.  This is the
two-way split the shared descent and the cross-radius transport branch on. -/
inductive ApexRadiusMode
    (D : CounterexampleData) (L : CriticalShellSystem D.A) (apex : ℝ²) : Type
  /-- Source and deletion share one apex radius class. -/
  | sameRadius (data : SameRadiusJointDeletion D L apex)
  /-- Source and deletion sit on two distinct concentric apex classes. -/
  | crossRadius (data : CrossRadiusJointDeletion D L apex)

namespace ApexRadiusMode

variable {D : CounterexampleData} {L : CriticalShellSystem D.A} {apex : ℝ²}

/-- The provenance core underlying either arm. -/
def toJointDeletionCore :
    ApexRadiusMode D L apex → JointDeletionCore D L
  | .sameRadius data => data.toJointDeletionCore
  | .crossRadius data => data.toJointDeletionCore

/-- Either arm records the apex as a survival center. -/
theorem apex_mem_fixedSurvivals (M : ApexRadiusMode D L apex) :
    apex ∈ M.toJointDeletionCore.fixedSurvivals := by
  cases M with
  | sameRadius data => exact data.apex_mem_fixedSurvivals
  | crossRadius data => exact data.apex_mem_fixedSurvivals

/-- Either arm survives the recorded deletion at the apex. -/
theorem apex_survives (M : ApexRadiusMode D L apex) :
    HasNEquidistantPointsAt 4
      (D.A.erase M.toJointDeletionCore.deleted.1) apex :=
  M.toJointDeletionCore.survives_of_mem_fixedSurvivals apex
    M.apex_mem_fixedSurvivals

/-- Either arm carries a source distinct from its deletion. -/
theorem deleted_ne_source (M : ApexRadiusMode D L apex) :
    M.toJointDeletionCore.deleted ≠ M.toJointDeletionCore.source :=
  M.toJointDeletionCore.deleted_ne_source

end ApexRadiusMode

noncomputable section HistoricalAdapters

variable {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
  {H : CriticalShellSystem D.A}
  {F : CriticalPairFrontier D S radius H}
  {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}

/-- Rebuild the historical exact-four packet from a provenance core.

The core deliberately forgets the second carrier vertex, the second-apex class
radius, and the two common-deletion packets, so those come back as explicit
arguments.  Everything the core does keep — the source, the deletion, the
omission of the deletion from the source row — is read straight off it. -/
def exactFourMutualOmissionJointDeletion_ofJointDeletionCore
    (C : JointDeletionCore D (lateFirstApexSystem R))
    (rho : ℝ) (v : CriticalShellSystem.CarrierVertex D.A)
    (hdeletedClass : C.deleted.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (hdeletedNeV : C.deleted ≠ v)
    (hdeletedNotVRow :
      C.deleted.1 ∉
        ((lateFirstApexSystem R).selectedAt
          v.1 v.2).toCriticalFourShell.support)
    (hblockersNe :
      (lateFirstApexSystem R).centerAt C.source.1 C.source.2 ≠
        (lateFirstApexSystem R).centerAt v.1 v.2)
    (uPacket :
      CommonDeletionTwoCenterPacket D (lateFirstApexSystem R) C.deleted.1
        ((lateFirstApexSystem R).centerAt C.source.1 C.source.2) S.oppApex2)
    (vPacket :
      CommonDeletionTwoCenterPacket D (lateFirstApexSystem R) C.deleted.1
        ((lateFirstApexSystem R).centerAt v.1 v.2) S.oppApex2) :
    ExactFourMutualOmissionJointDeletion R rho C.source v where
  deleted := C.deleted
  deleted_mem_class := hdeletedClass
  deleted_ne_u := C.deleted_ne_source
  deleted_ne_v := hdeletedNeV
  deleted_not_mem_uRow := C.deleted_not_mem_selectedAt_source
  deleted_not_mem_vRow := hdeletedNotVRow
  blockers_ne := hblockersNe
  uPacket := uPacket
  vPacket := vPacket

variable {rho : ℝ} {u v : CriticalShellSystem.CarrierVertex D.A}

/-- Read the provenance core off the historical exact-four packet.

The reading is total: the packet's first carrier vertex `u` is taken as the
source, the late system's chosen blocker and row at `u` supply the blocker and
the exact row, the three centers of the two common-deletion packets supply the
survivals, and the deleted point supplies the single recorded omission.  What
the core adds over the packet is that `u`, previously only a type parameter,
is now a field a consumer can name. -/
def ExactFourMutualOmissionJointDeletion.toJointDeletionCore
    (K : ExactFourMutualOmissionJointDeletion R rho u v) :
    JointDeletionCore D (lateFirstApexSystem R) where
  source := u
  sourceBlocker := (lateFirstApexSystem R).centerAt u.1 u.2
  sourceBlocker_eq := rfl
  exactSourceRow := (lateFirstApexSystem R).selectedAt u.1 u.2
  deleted := K.deleted
  fixedSurvivals :=
    {S.oppApex2, (lateFirstApexSystem R).centerAt u.1 u.2,
      (lateFirstApexSystem R).centerAt v.1 v.2}
  fixedSurvivals_subset_carrier := by
    intro c hc
    simp only [Finset.mem_insert, Finset.mem_singleton] at hc
    rcases hc with rfl | rfl | rfl
    · exact K.uPacket.center₂_mem_A
    · exact K.uPacket.center₁_mem_A
    · exact K.vPacket.center₁_mem_A
  survives_of_mem_fixedSurvivals := by
    intro c hc
    simp only [Finset.mem_insert, Finset.mem_singleton] at hc
    rcases hc with rfl | rfl | rfl
    · exact K.uPacket.survives₂
    · exact K.uPacket.survives₁
    · exact K.vPacket.survives₁
  fixedOmissions := {K.deleted.1}
  fixedOmissions_subset_carrier := by
    intro z hz
    rw [Finset.mem_singleton] at hz
    subst hz
    exact K.deleted.2
  deleted_mem_fixedOmissions := Finset.mem_singleton_self _
  omitted_of_mem_fixedOmissions := by
    intro z hz
    rw [Finset.mem_singleton] at hz
    subst hz
    exact K.deleted_not_mem_uRow

namespace ExactFourMutualOmissionJointDeletion

variable (K : ExactFourMutualOmissionJointDeletion R rho u v)

@[simp] theorem toJointDeletionCore_source :
    K.toJointDeletionCore.source = u := rfl

@[simp] theorem toJointDeletionCore_sourceBlocker :
    K.toJointDeletionCore.sourceBlocker =
      (lateFirstApexSystem R).centerAt u.1 u.2 := rfl

@[simp] theorem toJointDeletionCore_exactSourceRow :
    K.toJointDeletionCore.exactSourceRow =
      (lateFirstApexSystem R).selectedAt u.1 u.2 := rfl

@[simp] theorem toJointDeletionCore_deleted :
    K.toJointDeletionCore.deleted = K.deleted := rfl

@[simp] theorem toJointDeletionCore_fixedSurvivals :
    K.toJointDeletionCore.fixedSurvivals =
      {S.oppApex2, (lateFirstApexSystem R).centerAt u.1 u.2,
        (lateFirstApexSystem R).centerAt v.1 v.2} := rfl

@[simp] theorem toJointDeletionCore_fixedOmissions :
    K.toJointDeletionCore.fixedOmissions = {K.deleted.1} := rfl

/-- The second opposite apex is a recorded survival center of the core. -/
theorem oppApex2_mem_toJointDeletionCore_fixedSurvivals :
    S.oppApex2 ∈ K.toJointDeletionCore.fixedSurvivals := by
  rw [toJointDeletionCore_fixedSurvivals]
  exact Finset.mem_insert_self _ _

/-- The first vertex's blocker is a recorded survival center of the core. -/
theorem uBlocker_mem_toJointDeletionCore_fixedSurvivals :
    (lateFirstApexSystem R).centerAt u.1 u.2 ∈
      K.toJointDeletionCore.fixedSurvivals := by
  rw [toJointDeletionCore_fixedSurvivals]
  exact Finset.mem_insert_of_mem (Finset.mem_insert_self _ _)

/-- The second vertex's blocker is a recorded survival center of the core. -/
theorem vBlocker_mem_toJointDeletionCore_fixedSurvivals :
    (lateFirstApexSystem R).centerAt v.1 v.2 ∈
      K.toJointDeletionCore.fixedSurvivals := by
  rw [toJointDeletionCore_fixedSurvivals]
  exact Finset.mem_insert_of_mem
    (Finset.mem_insert_of_mem (Finset.mem_singleton_self _))

/-- The core alone recovers the packet's omission of the deletion from the
first row. -/
theorem toJointDeletionCore_deleted_not_mem_uRow :
    K.toJointDeletionCore.deleted.1 ∉
      ((lateFirstApexSystem R).selectedAt
        u.1 u.2).toCriticalFourShell.support :=
  K.toJointDeletionCore.deleted_not_mem_selectedAt_source

/-- The core alone recovers that the deletion is not the first vertex. -/
theorem toJointDeletionCore_deleted_ne_u :
    K.toJointDeletionCore.deleted ≠ u :=
  K.toJointDeletionCore.deleted_ne_source

/-- The core alone recovers survival at the second opposite apex. -/
theorem toJointDeletionCore_survives_oppApex2 :
    HasNEquidistantPointsAt 4
      (D.A.erase K.toJointDeletionCore.deleted.1) S.oppApex2 :=
  K.toJointDeletionCore.survives_of_mem_fixedSurvivals _
    K.oppApex2_mem_toJointDeletionCore_fixedSurvivals

/-- The core alone recovers survival at the first vertex's blocker. -/
theorem toJointDeletionCore_survives_uBlocker :
    HasNEquidistantPointsAt 4
      (D.A.erase K.toJointDeletionCore.deleted.1)
      ((lateFirstApexSystem R).centerAt u.1 u.2) :=
  K.toJointDeletionCore.survives_of_mem_fixedSurvivals _
    K.uBlocker_mem_toJointDeletionCore_fixedSurvivals

/-- The core alone recovers survival at the second vertex's blocker. -/
theorem toJointDeletionCore_survives_vBlocker :
    HasNEquidistantPointsAt 4
      (D.A.erase K.toJointDeletionCore.deleted.1)
      ((lateFirstApexSystem R).centerAt v.1 v.2) :=
  K.toJointDeletionCore.survives_of_mem_fixedSurvivals _
    K.vBlocker_mem_toJointDeletionCore_fixedSurvivals

end ExactFourMutualOmissionJointDeletion

/-- Round trip.  Reading the core off a historical packet and rebuilding the
packet from that core, with the dropped data handed back, returns the original
packet unchanged.  Together with the projection lemmas above this is the
complete recovery statement: no component of the historical packet is lost by
passing through the core. -/
theorem exactFourMutualOmissionJointDeletion_ofJointDeletionCore_toJointDeletionCore
    (K : ExactFourMutualOmissionJointDeletion R rho u v) :
    exactFourMutualOmissionJointDeletion_ofJointDeletionCore
        K.toJointDeletionCore rho v K.deleted_mem_class K.deleted_ne_v
        K.deleted_not_mem_vRow K.blockers_ne K.uPacket K.vPacket =
      K := rfl

/-- Rebuilding from a core and reading the core back preserves the source. -/
@[simp] theorem ofJointDeletionCore_toJointDeletionCore_source
    (C : JointDeletionCore D (lateFirstApexSystem R))
    (rho : ℝ) (v : CriticalShellSystem.CarrierVertex D.A)
    (hdeletedClass : C.deleted.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (hdeletedNeV : C.deleted ≠ v)
    (hdeletedNotVRow :
      C.deleted.1 ∉
        ((lateFirstApexSystem R).selectedAt
          v.1 v.2).toCriticalFourShell.support)
    (hblockersNe :
      (lateFirstApexSystem R).centerAt C.source.1 C.source.2 ≠
        (lateFirstApexSystem R).centerAt v.1 v.2)
    (uPacket :
      CommonDeletionTwoCenterPacket D (lateFirstApexSystem R) C.deleted.1
        ((lateFirstApexSystem R).centerAt C.source.1 C.source.2) S.oppApex2)
    (vPacket :
      CommonDeletionTwoCenterPacket D (lateFirstApexSystem R) C.deleted.1
        ((lateFirstApexSystem R).centerAt v.1 v.2) S.oppApex2) :
    (exactFourMutualOmissionJointDeletion_ofJointDeletionCore C rho v
        hdeletedClass hdeletedNeV hdeletedNotVRow hblockersNe uPacket
        vPacket).toJointDeletionCore.source = C.source := rfl

/-- Rebuilding from a core and reading the core back preserves the
deletion. -/
@[simp] theorem ofJointDeletionCore_toJointDeletionCore_deleted
    (C : JointDeletionCore D (lateFirstApexSystem R))
    (rho : ℝ) (v : CriticalShellSystem.CarrierVertex D.A)
    (hdeletedClass : C.deleted.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (hdeletedNeV : C.deleted ≠ v)
    (hdeletedNotVRow :
      C.deleted.1 ∉
        ((lateFirstApexSystem R).selectedAt
          v.1 v.2).toCriticalFourShell.support)
    (hblockersNe :
      (lateFirstApexSystem R).centerAt C.source.1 C.source.2 ≠
        (lateFirstApexSystem R).centerAt v.1 v.2)
    (uPacket :
      CommonDeletionTwoCenterPacket D (lateFirstApexSystem R) C.deleted.1
        ((lateFirstApexSystem R).centerAt C.source.1 C.source.2) S.oppApex2)
    (vPacket :
      CommonDeletionTwoCenterPacket D (lateFirstApexSystem R) C.deleted.1
        ((lateFirstApexSystem R).centerAt v.1 v.2) S.oppApex2) :
    (exactFourMutualOmissionJointDeletion_ofJointDeletionCore C rho v
        hdeletedClass hdeletedNeV hdeletedNotVRow hblockersNe uPacket
        vPacket).toJointDeletionCore.deleted = C.deleted := rfl

/-- Rebuilding from a core and reading the core back preserves the source row
up to its support, which is all the row is used for.  The rebuilt core carries
the shell system's chosen row; the original core's row has the same support by
`JointDeletionCore.exactSourceRow_support_eq_selectedAt`. -/
theorem ofJointDeletionCore_toJointDeletionCore_exactSourceRow_support
    (C : JointDeletionCore D (lateFirstApexSystem R))
    (rho : ℝ) (v : CriticalShellSystem.CarrierVertex D.A)
    (hdeletedClass : C.deleted.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (hdeletedNeV : C.deleted ≠ v)
    (hdeletedNotVRow :
      C.deleted.1 ∉
        ((lateFirstApexSystem R).selectedAt
          v.1 v.2).toCriticalFourShell.support)
    (hblockersNe :
      (lateFirstApexSystem R).centerAt C.source.1 C.source.2 ≠
        (lateFirstApexSystem R).centerAt v.1 v.2)
    (uPacket :
      CommonDeletionTwoCenterPacket D (lateFirstApexSystem R) C.deleted.1
        ((lateFirstApexSystem R).centerAt C.source.1 C.source.2) S.oppApex2)
    (vPacket :
      CommonDeletionTwoCenterPacket D (lateFirstApexSystem R) C.deleted.1
        ((lateFirstApexSystem R).centerAt v.1 v.2) S.oppApex2) :
    (exactFourMutualOmissionJointDeletion_ofJointDeletionCore C rho v
          hdeletedClass hdeletedNeV hdeletedNotVRow hblockersNe uPacket
          vPacket).toJointDeletionCore.exactSourceRow.toCriticalFourShell.support =
      C.exactSourceRow.toCriticalFourShell.support :=
  C.exactSourceRow_support_eq_selectedAt.symm

/-- Promote a historical packet to the same-radius arm.  The class radius of
the source is the datum the packet never carried, so it is supplied here. -/
def ExactFourMutualOmissionJointDeletion.toSameRadiusJointDeletion
    (K : ExactFourMutualOmissionJointDeletion R rho u v)
    (hrhoPos : 0 < rho)
    (hsourceClass : u.1 ∈ SelectedClass D.A S.oppApex2 rho) :
    SameRadiusJointDeletion D (lateFirstApexSystem R) S.oppApex2 where
  toJointDeletionCore := K.toJointDeletionCore
  radius := rho
  radius_pos := hrhoPos
  source_mem_class := hsourceClass
  deleted_mem_class := K.deleted_mem_class
  apex_mem_fixedSurvivals := K.oppApex2_mem_toJointDeletionCore_fixedSurvivals

/-- Promote a historical packet to the cross-radius arm.  The source's own
apex radius and its difference from the deletion's radius are the data the
packet never carried, so they are supplied here. -/
def ExactFourMutualOmissionJointDeletion.toCrossRadiusJointDeletion
    (K : ExactFourMutualOmissionJointDeletion R rho u v)
    (sourceRadius : ℝ) (hsourceRadiusPos : 0 < sourceRadius)
    (hrhoPos : 0 < rho) (hradiiNe : sourceRadius ≠ rho)
    (hsourceClass : u.1 ∈ SelectedClass D.A S.oppApex2 sourceRadius) :
    CrossRadiusJointDeletion D (lateFirstApexSystem R) S.oppApex2 where
  toJointDeletionCore := K.toJointDeletionCore
  sourceRadius := sourceRadius
  sourceRadius_pos := hsourceRadiusPos
  deletedRadius := rho
  deletedRadius_pos := hrhoPos
  radii_ne := hradiiNe
  source_mem_sourceClass := hsourceClass
  deleted_mem_deletedClass := K.deleted_mem_class
  apex_mem_fixedSurvivals := K.oppApex2_mem_toJointDeletionCore_fixedSurvivals

/-- Classify a historical packet by apex radius mode.  The caller decides
which arm applies by supplying the source's apex radius together with the
comparison against the deletion's radius. -/
def ExactFourMutualOmissionJointDeletion.toApexRadiusMode
    (K : ExactFourMutualOmissionJointDeletion R rho u v)
    (sourceRadius : ℝ) (hsourceRadiusPos : 0 < sourceRadius)
    (hrhoPos : 0 < rho)
    (hsourceClass : u.1 ∈ SelectedClass D.A S.oppApex2 sourceRadius) :
    ApexRadiusMode D (lateFirstApexSystem R) S.oppApex2 :=
  if hEq : sourceRadius = rho then
    .sameRadius
      (K.toSameRadiusJointDeletion hrhoPos (by rw [← hEq]; exact hsourceClass))
  else
    .crossRadius
      (K.toCrossRadiusJointDeletion sourceRadius hsourceRadiusPos hrhoPos hEq
        hsourceClass)

/-- Either arm of the classification carries the same provenance core. -/
theorem toApexRadiusMode_toJointDeletionCore
    (K : ExactFourMutualOmissionJointDeletion R rho u v)
    (sourceRadius : ℝ) (hsourceRadiusPos : 0 < sourceRadius)
    (hrhoPos : 0 < rho)
    (hsourceClass : u.1 ∈ SelectedClass D.A S.oppApex2 sourceRadius) :
    (K.toApexRadiusMode sourceRadius hsourceRadiusPos hrhoPos
        hsourceClass).toJointDeletionCore =
      K.toJointDeletionCore := by
  unfold ExactFourMutualOmissionJointDeletion.toApexRadiusMode
  by_cases hEq : sourceRadius = rho
  · rw [dif_pos hEq]; rfl
  · rw [dif_neg hEq]; rfl

end HistoricalAdapters

end ATailFrontierLiveClosure
end Problem97
