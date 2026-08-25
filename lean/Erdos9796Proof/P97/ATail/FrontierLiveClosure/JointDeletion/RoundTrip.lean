/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.BlockerRelation
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.JointDeletion.CallerProvenance

/-!
# Round trips for the joint-deletion provenance hierarchy

`JointDeletion.ProvenanceCore` reads a `JointDeletionCore` off the historical
packet `ExactFourMutualOmissionJointDeletion` and rebuilds the packet from a
core plus the data the core drops.  That rebuild takes the dropped data as six
separate arguments, so the composite of the two adapters cannot be stated as a
plain identity.  This module packages the dropped data as one record and then
states both composites.

## The two composites

* `ExactFourMutualOmissionExtension C rho v` holds exactly the six pieces the
  core does not keep.  `ExactFourMutualOmissionJointDeletion.toExtension` reads
  it off a packet, and `exactFourMutualOmissionJointDeletion_ofExtension` puts
  it back.
* Packet to core and back is the identity on the nose:
  `ofExtension_toExtension` closes by `rfl`, with no side hypothesis and nothing
  supplied by the caller.
* Core to packet and back is not the identity.  A core may record a row, a
  survival set and an omission set larger or differently presented than the ones
  the packet forces, and the packet keeps none of that surplus.  The composite
  is a retraction instead: `agree_toJointDeletionCore_ofExtension` returns
  source, blocker, deletion and row support unchanged;
  `toJointDeletionCore_ofExtension_fixedSurvivals` and its companion compute the
  two sets the composite normalises to;
  `isPacketNormal_toJointDeletionCore_ofExtension` says the result is always
  normalised; `toJointDeletionCore_ofExtension_eq_self` says the composite is
  the identity exactly on normalised cores; and
  `toJointDeletionCore_ofExtension_idem` says a second pass changes nothing.

`JointDeletionCore.ext_of_data` is the extensionality lemma those statements
rest on.  Unlike `CriticalShellSystem`, the core admits one: all six of its data
fields are recorded by name.

## Field recovery for current callers

Section `Recovery` walks the historical packet field by field — all nine of
them — and names, for each, either the core projection that recovers it or the
extension projection that carries it.
`ExactFourMutualOmissionJointDeletion.swap` removes the standing convention that
the first carrier vertex is the source: the packet constrains its two vertices
in the same way, so both readings are available and `swap_swap` shows they are
the two halves of one involution.

## Source-context readers (one direction only)

`ExactFourMutualOmissionSourceContext.jointDeletionCore` and its bare variant
read a core off the source-context record.  No reverse adapter is stated:
nothing here rebuilds the context's source, class, interior, outside,
cardinality or survival data from a core plus an extension, so the field
recovery above is claimed for `ExactFourMutualOmissionJointDeletion` only.
The reverse round trip for the source context is a W2b obligation, to be
stated together with the producer port.

## Late blocker choice

`JointDeletionCore.rebase` moves a core from the shell system it was built over
to any other system selecting the same blocker at the same source, and
`rebase_rebase` returns the original.  With
`chooseCriticalShellSystem_centerAt_blockerPreference`, which steers the
late-choice adapter of `BlockerRelation` onto a core's recorded blocker, this
says a core's blocker is not tied to the early choice that produced it.

`chooseCriticalShellSystem_centerAt_overrideExactSelectedClass` and
`chooseCriticalShellSystem_centerAt_lateFirstApexSystem` close the remaining
round trip against the two production override operators.
-/

namespace Problem97
namespace ATailFrontierLiveClosure

open scoped EuclideanGeometry
open ATailCommonDeletionTwoCenter
open ATailCriticalPairFrontier
open ATailUniqueFourLateChoiceTerminalScratch

attribute [local instance] Classical.propDecidable

/- ## Transporting an exact row along an equality of centers -/

/-- Move an exact four-point critical row from one center to an equal one. -/
def transportCriticalRow {A : Finset ℝ²} {q c c' : ℝ²} (h : c = c')
    (X : CriticalSelectedFourClass A q c) :
    CriticalSelectedFourClass A q c' :=
  h ▸ X

/-- Transport leaves the row support alone. -/
@[simp] theorem transportCriticalRow_support {A : Finset ℝ²} {q c c' : ℝ²}
    (h : c = c') (X : CriticalSelectedFourClass A q c) :
    (transportCriticalRow h X).toCriticalFourShell.support =
      X.toCriticalFourShell.support := by
  subst h
  rfl

/-- Transporting a row out and back returns it unchanged. -/
@[simp] theorem transportCriticalRow_transportCriticalRow {A : Finset ℝ²}
    {q c c' : ℝ²} (h : c = c') (h' : c' = c)
    (X : CriticalSelectedFourClass A q c) :
    transportCriticalRow h' (transportCriticalRow h X) = X := by
  subst h
  rfl

/- ## Extensionality and agreement for the provenance core -/

namespace JointDeletionCore

variable {D : CounterexampleData} {L : CriticalShellSystem D.A}

/-- Two provenance cores with the same data fields are the same core.

The blocker is omitted from the hypotheses because `sourceBlocker_eq` already
pins it to the source.  `CriticalShellSystem` admits no such lemma; the core
does, which is what makes the round trips below statable as equations. -/
theorem ext_of_data {C C' : JointDeletionCore D L}
    (hsource : C.source = C'.source)
    (hrow : HEq C.exactSourceRow C'.exactSourceRow)
    (hdeleted : C.deleted = C'.deleted)
    (hsurvivals : C.fixedSurvivals = C'.fixedSurvivals)
    (homissions : C.fixedOmissions = C'.fixedOmissions) :
    C = C' := by
  cases C with
  | mk s b hb row d fs hfsA hfsS fo hfoA hfoD hfoO =>
    cases C' with
    | mk s' b' hb' row' d' fs' hfsA' hfsS' fo' hfoA' hfoD' hfoO' =>
      subst hb
      subst hb'
      cases hsource
      cases hdeleted
      cases hsurvivals
      cases homissions
      cases hrow
      rfl

/-- Two provenance cores agree when they name the same source, the same
blocker, the same deletion, and the same exact row support.

This is the strongest relation available between a core and its image under a
composite that drops the survival and omission sets: the row itself may be
replaced by another row on the same support, since a row carries four label
names with no canonical order. -/
structure Agree (C C' : JointDeletionCore D L) : Prop where
  /-- The two cores name the same source. -/
  source_eq : C.source = C'.source
  /-- The two cores name the same blocker. -/
  sourceBlocker_eq : C.sourceBlocker = C'.sourceBlocker
  /-- The two cores name the same deletion. -/
  deleted_eq : C.deleted = C'.deleted
  /-- The two cores record the same exact row support. -/
  support_eq :
    C.exactSourceRow.toCriticalFourShell.support =
      C'.exactSourceRow.toCriticalFourShell.support

namespace Agree

/-- Every core agrees with itself. -/
theorem refl (C : JointDeletionCore D L) : Agree C C :=
  ⟨rfl, rfl, rfl, rfl⟩

/-- Agreement is symmetric. -/
theorem symm {C C' : JointDeletionCore D L} (h : Agree C C') : Agree C' C :=
  ⟨h.source_eq.symm, h.sourceBlocker_eq.symm, h.deleted_eq.symm,
    h.support_eq.symm⟩

/-- Agreement is transitive. -/
theorem trans {C C' C'' : JointDeletionCore D L}
    (h : Agree C C') (h' : Agree C' C'') : Agree C C'' :=
  ⟨h.source_eq.trans h'.source_eq,
    h.sourceBlocker_eq.trans h'.sourceBlocker_eq,
    h.deleted_eq.trans h'.deleted_eq, h.support_eq.trans h'.support_eq⟩

/-- Cores that agree see the same points omitted from the source row. -/
theorem not_mem_support {C C' : JointDeletionCore D L} (h : Agree C C')
    {z : ℝ²} (hz : z ∉ C.exactSourceRow.toCriticalFourShell.support) :
    z ∉ C'.exactSourceRow.toCriticalFourShell.support := by
  rw [← h.support_eq]
  exact hz

/-- Cores that agree certify the same survivals from the same survival
witness. -/
theorem survives {C C' : JointDeletionCore D L} (h : Agree C C') {c : ℝ²}
    (hc : c ∈ C.fixedSurvivals) :
    HasNEquidistantPointsAt 4 (D.A.erase C'.deleted.1) c := by
  rw [← h.deleted_eq]
  exact C.survives_of_mem_fixedSurvivals c hc

end Agree

/- ### Moving a core between shell systems -/

/-- Rebase a provenance core onto any shell system that selects the same
blocker at the same source.

Every field except the exact row is independent of the shell system: the
survivals are statements about the deletion alone, and the omissions are
statements about the row support alone.  The row transports along the equality
of centers.  This is what makes a core's blocker independent of the early choice
that produced it. -/
def rebase (C : JointDeletionCore D L) (L' : CriticalShellSystem D.A)
    (hcenter : L'.centerAt C.source.1 C.source.2 = C.sourceBlocker) :
    JointDeletionCore D L' where
  source := C.source
  sourceBlocker := C.sourceBlocker
  sourceBlocker_eq := hcenter.symm
  exactSourceRow :=
    transportCriticalRow (C.sourceBlocker_eq.symm.trans hcenter.symm)
      C.exactSourceRow
  deleted := C.deleted
  fixedSurvivals := C.fixedSurvivals
  fixedSurvivals_subset_carrier := C.fixedSurvivals_subset_carrier
  survives_of_mem_fixedSurvivals := C.survives_of_mem_fixedSurvivals
  fixedOmissions := C.fixedOmissions
  fixedOmissions_subset_carrier := C.fixedOmissions_subset_carrier
  deleted_mem_fixedOmissions := C.deleted_mem_fixedOmissions
  omitted_of_mem_fixedOmissions := by
    intro z hz
    rw [transportCriticalRow_support]
    exact C.omitted_of_mem_fixedOmissions z hz

variable (C : JointDeletionCore D L) (L' : CriticalShellSystem D.A)
  (hcenter : L'.centerAt C.source.1 C.source.2 = C.sourceBlocker)

@[simp] theorem rebase_source : (C.rebase L' hcenter).source = C.source := rfl

@[simp] theorem rebase_sourceBlocker :
    (C.rebase L' hcenter).sourceBlocker = C.sourceBlocker := rfl

@[simp] theorem rebase_deleted :
    (C.rebase L' hcenter).deleted = C.deleted := rfl

@[simp] theorem rebase_fixedSurvivals :
    (C.rebase L' hcenter).fixedSurvivals = C.fixedSurvivals := rfl

@[simp] theorem rebase_fixedOmissions :
    (C.rebase L' hcenter).fixedOmissions = C.fixedOmissions := rfl

/-- Rebasing preserves the exact row support. -/
@[simp] theorem rebase_support :
    (C.rebase L' hcenter).exactSourceRow.toCriticalFourShell.support =
      C.exactSourceRow.toCriticalFourShell.support :=
  transportCriticalRow_support _ _

/-- Round trip for the rebase: moving a core to another shell system and back
returns the original core. -/
theorem rebase_rebase
    (hback : L.centerAt C.source.1 C.source.2 = C.sourceBlocker) :
    (C.rebase L' hcenter).rebase L hback = C := by
  refine ext_of_data rfl ?_ rfl rfl rfl
  exact heq_of_eq (transportCriticalRow_transportCriticalRow _ _ _)

/- ### The canonical-blocker layer -/

/-- The blocker a core records is a legal blocker of its source.  This is the
bridge from the provenance record to the choice-free predicate of
`BlockerRelation`. -/
theorem isCanonicalBlocker_sourceBlocker (C : JointDeletionCore D L) :
    IsCanonicalBlocker D.A C.source.1 C.sourceBlocker :=
  ⟨C.sourceBlocker_mem_carrier, C.sourceBlocker_ne_source,
    C.sourceBlocker_blocks⟩

/-- Every blocker relation on the carrier records the blocker of a core. -/
theorem blocks_sourceBlocker (C : JointDeletionCore D L)
    (Rel : CanonicalBlockerRelation D.A) :
    Rel.blocks C.source.1 C.sourceBlocker :=
  Rel.blocks_of_isCanonicalBlocker C.source.2 C.isCanonicalBlocker_sourceBlocker

/-- The preference that names a core's own blocker at the core's own source and
names nothing anywhere else. -/
def blockerPreference (C : JointDeletionCore D L)
    (Rel : CanonicalBlockerRelation D.A) : BlockerPreference Rel where
  preferred := fun source center =>
    source = C.source.1 ∧ center = C.sourceBlocker
  exists_preferred_or_default := by
    intro source hsource
    by_cases hEq : source = C.source.1
    · subst hEq
      exact Or.inl ⟨C.sourceBlocker, ⟨rfl, rfl⟩, C.blocks_sourceBlocker Rel⟩
    · exact Or.inr fun _ hc => hEq hc.1

end JointDeletionCore

/-- Late choice reproduces a core's blocker: the compatibility adapter of
`BlockerRelation`, steered by the core's own preference, selects at the core's
source exactly the blocker the core records. -/
theorem chooseCriticalShellSystem_centerAt_blockerPreference
    {D : CounterexampleData} {L : CriticalShellSystem D.A}
    (C : JointDeletionCore D L) (Rel : CanonicalBlockerRelation D.A) :
    (chooseCriticalShellSystem D.K4 Rel (C.blockerPreference Rel)).centerAt
        C.source.1 C.source.2 = C.sourceBlocker :=
  chooseCriticalShellSystem_centerAt_eq D.K4 Rel (C.blockerPreference Rel)
    C.source.2 ⟨rfl, rfl⟩ fun _ hc => hc.2

/-- Move a core onto a late-chosen shell system.  The recorded blocker, source,
deletion, survivals and omissions all survive the move; only the four label
names of the exact row may change. -/
noncomputable def JointDeletionCore.toLateChoice
    {D : CounterexampleData} {L : CriticalShellSystem D.A}
    (C : JointDeletionCore D L) (Rel : CanonicalBlockerRelation D.A) :
    JointDeletionCore D
      (chooseCriticalShellSystem D.K4 Rel (C.blockerPreference Rel)) :=
  C.rebase _ (chooseCriticalShellSystem_centerAt_blockerPreference C Rel)

@[simp] theorem JointDeletionCore.toLateChoice_source
    {D : CounterexampleData} {L : CriticalShellSystem D.A}
    (C : JointDeletionCore D L) (Rel : CanonicalBlockerRelation D.A) :
    (C.toLateChoice Rel).source = C.source := rfl

@[simp] theorem JointDeletionCore.toLateChoice_sourceBlocker
    {D : CounterexampleData} {L : CriticalShellSystem D.A}
    (C : JointDeletionCore D L) (Rel : CanonicalBlockerRelation D.A) :
    (C.toLateChoice Rel).sourceBlocker = C.sourceBlocker := rfl

@[simp] theorem JointDeletionCore.toLateChoice_deleted
    {D : CounterexampleData} {L : CriticalShellSystem D.A}
    (C : JointDeletionCore D L) (Rel : CanonicalBlockerRelation D.A) :
    (C.toLateChoice Rel).deleted = C.deleted := rfl

/-- The late-choice move preserves the exact row support. -/
theorem JointDeletionCore.toLateChoice_support
    {D : CounterexampleData} {L : CriticalShellSystem D.A}
    (C : JointDeletionCore D L) (Rel : CanonicalBlockerRelation D.A) :
    (C.toLateChoice Rel).exactSourceRow.toCriticalFourShell.support =
      C.exactSourceRow.toCriticalFourShell.support :=
  JointDeletionCore.rebase_support _ _ _

/- ## Transporting a preference between relations -/

namespace BlockerPreference

/-- Move a preference from one blocker relation to another on the same carrier.

No side condition is needed: `blocks_iff` pins every blocker relation on `A` to
`IsCanonicalBlocker` at carrier sources, so a center one relation accepts there
is accepted by all of them. -/
def transport {A : Finset ℝ²} {Rel : CanonicalBlockerRelation A}
    (pref : BlockerPreference Rel) (Rel' : CanonicalBlockerRelation A) :
    BlockerPreference Rel' where
  preferred := pref.preferred
  exists_preferred_or_default := by
    intro source hsource
    rcases pref.exists_preferred_or_default source hsource with
      ⟨center, hpref, hblocks⟩ | hnone
    · exact Or.inl ⟨center, hpref,
        Rel'.blocks_of_isCanonicalBlocker hsource
          (Rel.isCanonicalBlocker_of_blocks hsource hblocks)⟩
    · exact Or.inr hnone

@[simp] theorem transport_preferred {A : Finset ℝ²}
    {Rel : CanonicalBlockerRelation A} (pref : BlockerPreference Rel)
    (Rel' : CanonicalBlockerRelation A) :
    (pref.transport Rel').preferred = pref.preferred := rfl

/-- Round trip for the transport: a preference moved to another relation and
back is the preference moved directly, and in particular moving it back to its
own relation returns it. -/
@[simp] theorem transport_transport {A : Finset ℝ²}
    {Rel : CanonicalBlockerRelation A} (pref : BlockerPreference Rel)
    (Rel' Rel'' : CanonicalBlockerRelation A) :
    (pref.transport Rel').transport Rel'' = pref.transport Rel'' := rfl

/-- Transporting the preference of a shell system keeps naming that system's
centers. -/
theorem transport_ofCriticalShellSystem_preferred {A : Finset ℝ²}
    (Rel Rel' : CanonicalBlockerRelation A) (H : CriticalShellSystem A)
    {source : ℝ²} (hsource : source ∈ A) (center : ℝ²)
    (h : ((ofCriticalShellSystem Rel H).transport Rel').preferred source
      center) :
    center = H.centerAt source hsource :=
  ofCriticalShellSystem_unique Rel H hsource center h

end BlockerPreference

/-- Two blocker relations on one carrier accept the same centers at every
carrier source.  This is the reason `BlockerPreference.transport` needs no side
condition. -/
theorem blocks_iff_blocks {A : Finset ℝ²}
    (Rel Rel' : CanonicalBlockerRelation A) {source center : ℝ²}
    (hsource : source ∈ A) :
    Rel.blocks source center ↔ Rel'.blocks source center :=
  (Rel.blocks_iff source center hsource).trans
    (Rel'.blocks_iff source center hsource).symm

/-- A preference naming a unique center at a carrier source pins the selection
of the adapter under either relation, so transporting the preference cannot move
the selected center. -/
theorem chooseCriticalShellSystem_centerAt_transport_eq {A : Finset ℝ²}
    (hK4 : HasNEquidistantProperty 4 A)
    (Rel Rel' : CanonicalBlockerRelation A) (pref : BlockerPreference Rel)
    {source center : ℝ²} (hsource : source ∈ A)
    (hpref : pref.preferred source center)
    (huniq : ∀ c : ℝ², pref.preferred source c → c = center) :
    (chooseCriticalShellSystem hK4 Rel' (pref.transport Rel')).centerAt source
        hsource =
      (chooseCriticalShellSystem hK4 Rel pref).centerAt source hsource := by
  rw [chooseCriticalShellSystem_centerAt_eq hK4 Rel' (pref.transport Rel')
      hsource hpref huniq,
    chooseCriticalShellSystem_centerAt_eq hK4 Rel pref hsource hpref huniq]

/- ## Round trip against the production override operators -/

/-- The late-choice adapter reproduces the class-wide override.  Selecting from
the overridden system's own relation, under the preference for that system's own
centers, returns the prescribed class center at every class member. -/
theorem chooseCriticalShellSystem_centerAt_overrideExactSelectedClass
    {A : Finset ℝ²} (hK4 : HasNEquidistantProperty 4 A)
    (H : CriticalShellSystem A) {center q : ℝ²} {r : ℝ}
    (hcenter : center ∈ A) (hradius : 0 < r)
    (hcard : (SelectedClass A center r).card = 4)
    (hblocked : ∀ z : ℝ², z ∈ SelectedClass A center r →
      ¬ HasNEquidistantPointsAt 4 (A.erase z) center)
    (hq : q ∈ A) (hqClass : q ∈ SelectedClass A center r) :
    (chooseCriticalShellSystem hK4
        (CanonicalBlockerRelation.ofCriticalShellSystem
          (H.overrideExactSelectedClass hcenter hradius hcard hblocked))
        (BlockerPreference.ofCriticalShellSystem
          (CanonicalBlockerRelation.ofCriticalShellSystem
            (H.overrideExactSelectedClass hcenter hradius hcard hblocked))
          (H.overrideExactSelectedClass hcenter hradius hcard
            hblocked))).centerAt q hq =
      center := by
  rw [chooseCriticalShellSystem_centerAt_ofCriticalShellSystem]
  exact H.overrideExactSelectedClass_centerAt hcenter hradius hcard hblocked hq
    hqClass

/-- The late-choice adapter reproduces the pointwise override at its own
source. -/
theorem chooseCriticalShellSystem_centerAt_overrideAt
    {A : Finset ℝ²} (hK4 : HasNEquidistantProperty 4 A)
    (H : CriticalShellSystem A) {q center : ℝ²}
    (X : CriticalSelectedFourClass A q center)
    (hblocked : ¬ HasNEquidistantPointsAt 4 (A.erase q) center)
    (hq : q ∈ A) :
    (chooseCriticalShellSystem hK4
        (CanonicalBlockerRelation.ofCriticalShellSystem
          (H.overrideAt X hblocked))
        (BlockerPreference.ofCriticalShellSystem
          (CanonicalBlockerRelation.ofCriticalShellSystem
            (H.overrideAt X hblocked))
          (H.overrideAt X hblocked))).centerAt q hq =
      center := by
  rw [chooseCriticalShellSystem_centerAt_ofCriticalShellSystem]
  exact H.overrideAt_centerAt X hblocked hq

section LateFirstApex

variable {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
  {H : CriticalShellSystem D.A}
  {F : CriticalPairFrontier D S radius H}

/-- The late-choice adapter reproduces the production late first-apex system on
centers: every member of the exact first-apex class is still sent to the first
apex. -/
theorem chooseCriticalShellSystem_centerAt_lateFirstApexSystem
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    {source : ℝ²} (hsourceA : source ∈ D.A)
    (hsourceClass : source ∈ SelectedClass D.A S.oppApex1 radius) :
    (chooseCriticalShellSystem D.K4
        (CanonicalBlockerRelation.ofCriticalShellSystem (lateFirstApexSystem R))
        (BlockerPreference.ofCriticalShellSystem
          (CanonicalBlockerRelation.ofCriticalShellSystem
            (lateFirstApexSystem R))
          (lateFirstApexSystem R))).centerAt source hsourceA =
      S.oppApex1 := by
  rw [chooseCriticalShellSystem_centerAt_ofCriticalShellSystem]
  exact lateFirstApexSystem_centerAt_eq R hsourceA hsourceClass

/-- The late-choice adapter reproduces the production late first-apex system on
rows: the selected support at a class member is the whole class. -/
theorem chooseCriticalShellSystem_support_lateFirstApexSystem
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    {source : ℝ²} (hsourceA : source ∈ D.A)
    (hsourceClass : source ∈ SelectedClass D.A S.oppApex1 radius) :
    ((chooseCriticalShellSystem D.K4
          (CanonicalBlockerRelation.ofCriticalShellSystem
            (lateFirstApexSystem R))
          (BlockerPreference.ofCriticalShellSystem
            (CanonicalBlockerRelation.ofCriticalShellSystem
              (lateFirstApexSystem R))
            (lateFirstApexSystem R))).selectedAt source
        hsourceA).toCriticalFourShell.support =
      SelectedClass D.A S.oppApex1 radius := by
  rw [chooseCriticalShellSystem_support_ofCriticalShellSystem]
  exact lateFirstApexSystem_support_eq_class R hsourceA hsourceClass

/-- The residual supplies a blocker relation on its own carrier, so the
late-choice layer is available to every joint-deletion consumer without extra
hypotheses. -/
def canonicalBlockerRelation_ofOriginalUniqueFourResidual
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F) :
    CanonicalBlockerRelation D.A :=
  canonicalBlockerRelation_of_minimal R.minimal

end LateFirstApex

/- ## The historical packet, as a core plus one extension record -/

/-- Exactly the data the provenance core drops on its way from the historical
exact-four packet: where the deletion sits in the second-apex class, how it
relates to the second carrier vertex, that the two blockers differ, and the two
common-deletion packets.

Packaging the dropped data as one record turns the two adapters of
`ProvenanceCore` into a pair of maps whose composites can be compared with the
identity. -/
structure ExactFourMutualOmissionExtension
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (C : JointDeletionCore D (lateFirstApexSystem R))
    (rho : ℝ) (v : CriticalShellSystem.CarrierVertex D.A) : Type where
  /-- The deletion sits on the second-apex class of radius `rho`. -/
  deleted_mem_class : C.deleted.1 ∈ SelectedClass D.A S.oppApex2 rho
  /-- The deletion is not the second carrier vertex. -/
  deleted_ne_v : C.deleted ≠ v
  /-- The deletion misses the second vertex's row. -/
  deleted_not_mem_vRow :
    C.deleted.1 ∉
      ((lateFirstApexSystem R).selectedAt v.1 v.2).toCriticalFourShell.support
  /-- The two rows carry distinct blockers. -/
  blockers_ne :
    (lateFirstApexSystem R).centerAt C.source.1 C.source.2 ≠
      (lateFirstApexSystem R).centerAt v.1 v.2
  /-- The common-deletion packet at the source's blocker. -/
  uPacket :
    CommonDeletionTwoCenterPacket D (lateFirstApexSystem R) C.deleted.1
      ((lateFirstApexSystem R).centerAt C.source.1 C.source.2) S.oppApex2
  /-- The common-deletion packet at the second vertex's blocker. -/
  vPacket :
    CommonDeletionTwoCenterPacket D (lateFirstApexSystem R) C.deleted.1
      ((lateFirstApexSystem R).centerAt v.1 v.2) S.oppApex2

/-- A core is in the normal form the historical packet can carry when its row
is the shell system's own row at the source, its survivals are exactly the three
centers the packet certifies, and its only recorded omission is the deletion. -/
def JointDeletionCore.IsPacketNormal
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (C : JointDeletionCore D (lateFirstApexSystem R))
    (v : CriticalShellSystem.CarrierVertex D.A) : Prop :=
  C.exactSourceRow = (lateFirstApexSystem R).selectedAt C.source.1 C.source.2 ∧
    C.fixedSurvivals =
      ({S.oppApex2, (lateFirstApexSystem R).centerAt C.source.1 C.source.2,
        (lateFirstApexSystem R).centerAt v.1 v.2} : Finset ℝ²) ∧
    C.fixedOmissions = ({C.deleted.1} : Finset ℝ²)

noncomputable section HistoricalRoundTrip

variable {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
  {H : CriticalShellSystem D.A}
  {F : CriticalPairFrontier D S radius H}
  {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
  {rho : ℝ} {u v : CriticalShellSystem.CarrierVertex D.A}

/-- Rebuild the historical packet from a core and one extension record. -/
def exactFourMutualOmissionJointDeletion_ofExtension
    (C : JointDeletionCore D (lateFirstApexSystem R))
    (E : ExactFourMutualOmissionExtension C rho v) :
    ExactFourMutualOmissionJointDeletion R rho C.source v :=
  exactFourMutualOmissionJointDeletion_ofJointDeletionCore C rho v
    E.deleted_mem_class E.deleted_ne_v E.deleted_not_mem_vRow E.blockers_ne
    E.uPacket E.vPacket

/-- Read the extension record off a historical packet. -/
def ExactFourMutualOmissionJointDeletion.toExtension
    (K : ExactFourMutualOmissionJointDeletion R rho u v) :
    ExactFourMutualOmissionExtension K.toJointDeletionCore rho v where
  deleted_mem_class := K.deleted_mem_class
  deleted_ne_v := K.deleted_ne_v
  deleted_not_mem_vRow := K.deleted_not_mem_vRow
  blockers_ne := K.blockers_ne
  uPacket := K.uPacket
  vPacket := K.vPacket

/-- Round trip, packet to core and back.  Splitting a historical packet into a
provenance core and an extension record and reassembling it returns the original
packet, with no side hypothesis and nothing supplied by the caller. -/
theorem ofExtension_toExtension
    (K : ExactFourMutualOmissionJointDeletion R rho u v) :
    exactFourMutualOmissionJointDeletion_ofExtension K.toJointDeletionCore
        K.toExtension = K := rfl

/- ### Core to packet and back -/

variable (C : JointDeletionCore D (lateFirstApexSystem R))
  (E : ExactFourMutualOmissionExtension C rho v)

@[simp] theorem toJointDeletionCore_ofExtension_source :
    (exactFourMutualOmissionJointDeletion_ofExtension C
        E).toJointDeletionCore.source = C.source := rfl

@[simp] theorem toJointDeletionCore_ofExtension_deleted :
    (exactFourMutualOmissionJointDeletion_ofExtension C
        E).toJointDeletionCore.deleted = C.deleted := rfl

@[simp] theorem toJointDeletionCore_ofExtension_fixedSurvivals :
    (exactFourMutualOmissionJointDeletion_ofExtension C
        E).toJointDeletionCore.fixedSurvivals =
      {S.oppApex2, (lateFirstApexSystem R).centerAt C.source.1 C.source.2,
        (lateFirstApexSystem R).centerAt v.1 v.2} := rfl

@[simp] theorem toJointDeletionCore_ofExtension_fixedOmissions :
    (exactFourMutualOmissionJointDeletion_ofExtension C
        E).toJointDeletionCore.fixedOmissions = {C.deleted.1} := rfl

/-- The rebuilt core records the same blocker as the original. -/
theorem toJointDeletionCore_ofExtension_sourceBlocker :
    (exactFourMutualOmissionJointDeletion_ofExtension C
        E).toJointDeletionCore.sourceBlocker = C.sourceBlocker :=
  C.sourceBlocker_eq.symm

/-- The rebuilt core records the same exact row support as the original. -/
theorem toJointDeletionCore_ofExtension_support :
    (exactFourMutualOmissionJointDeletion_ofExtension C
          E).toJointDeletionCore.exactSourceRow.toCriticalFourShell.support =
      C.exactSourceRow.toCriticalFourShell.support :=
  C.exactSourceRow_support_eq_selectedAt.symm

/-- Round trip, core to packet and back, on every projection a consumer reads:
source, blocker, deletion and exact row support all return unchanged. -/
theorem agree_toJointDeletionCore_ofExtension :
    JointDeletionCore.Agree C
      (exactFourMutualOmissionJointDeletion_ofExtension C
        E).toJointDeletionCore :=
  ⟨rfl, (toJointDeletionCore_ofExtension_sourceBlocker C E).symm, rfl,
    (toJointDeletionCore_ofExtension_support C E).symm⟩

/-- Every survival the original core recorded still holds of the rebuilt core's
deletion, even though the rebuilt core keeps only the three centers the packet
forces. -/
theorem survives_of_mem_fixedSurvivals_ofExtension {c : ℝ²}
    (hc : c ∈ C.fixedSurvivals) :
    HasNEquidistantPointsAt 4
      (D.A.erase (exactFourMutualOmissionJointDeletion_ofExtension C
        E).toJointDeletionCore.deleted.1) c :=
  C.survives_of_mem_fixedSurvivals c hc

/-- Every omission the original core recorded still misses the rebuilt core's
row, even though the rebuilt core keeps only the deletion itself. -/
theorem omitted_of_mem_fixedOmissions_ofExtension {z : ℝ²}
    (hz : z ∈ C.fixedOmissions) :
    z ∉
      (exactFourMutualOmissionJointDeletion_ofExtension C
          E).toJointDeletionCore.exactSourceRow.toCriticalFourShell.support := by
  rw [toJointDeletionCore_ofExtension_support]
  exact C.omitted_of_mem_fixedOmissions z hz

/-- The core to packet and back composite always lands in normal form. -/
theorem isPacketNormal_toJointDeletionCore_ofExtension :
    (exactFourMutualOmissionJointDeletion_ofExtension C
      E).toJointDeletionCore.IsPacketNormal v := ⟨rfl, rfl, rfl⟩

/-- Round trip, core to packet and back, as an identity: on a core already in
normal form the composite changes nothing.

With `isPacketNormal_toJointDeletionCore_ofExtension` this says the composite is
a retraction onto the normal cores, and with `ofExtension_toExtension` it says
the historical packets and the normal cores carry each other's data without
loss. -/
theorem toJointDeletionCore_ofExtension_eq_self
    (hnormal : C.IsPacketNormal v) :
    (exactFourMutualOmissionJointDeletion_ofExtension C E).toJointDeletionCore =
      C :=
  JointDeletionCore.ext_of_data rfl (heq_of_eq hnormal.1.symm) rfl
    hnormal.2.1.symm hnormal.2.2.symm

/-- A second pass through the composite changes nothing. -/
theorem toJointDeletionCore_ofExtension_idem
    (E' : ExactFourMutualOmissionExtension
      (exactFourMutualOmissionJointDeletion_ofExtension C
        E).toJointDeletionCore rho v) :
    (exactFourMutualOmissionJointDeletion_ofExtension
        (exactFourMutualOmissionJointDeletion_ofExtension C
          E).toJointDeletionCore E').toJointDeletionCore =
      (exactFourMutualOmissionJointDeletion_ofExtension C
        E).toJointDeletionCore :=
  toJointDeletionCore_ofExtension_eq_self _ E'
    (isPacketNormal_toJointDeletionCore_ofExtension C E)

/- ### The two readings of the source -/

/-- The core read off a historical packet is always in normal form. -/
theorem isPacketNormal_toJointDeletionCore
    (K : ExactFourMutualOmissionJointDeletion R rho u v) :
    K.toJointDeletionCore.IsPacketNormal v := ⟨rfl, rfl, rfl⟩

/-- Exchange the two carrier vertices of a historical packet.

The packet constrains its two vertices in the same way, so the exchange is
total.  It removes the standing convention that the first vertex is the source:
both readings are available, and `swap_swap` shows they are the two halves of
one involution. -/
def ExactFourMutualOmissionJointDeletion.swap
    (K : ExactFourMutualOmissionJointDeletion R rho u v) :
    ExactFourMutualOmissionJointDeletion R rho v u where
  deleted := K.deleted
  deleted_mem_class := K.deleted_mem_class
  deleted_ne_u := K.deleted_ne_v
  deleted_ne_v := K.deleted_ne_u
  deleted_not_mem_uRow := K.deleted_not_mem_vRow
  deleted_not_mem_vRow := K.deleted_not_mem_uRow
  blockers_ne := K.blockers_ne.symm
  uPacket := K.vPacket
  vPacket := K.uPacket

@[simp] theorem ExactFourMutualOmissionJointDeletion.swap_deleted
    (K : ExactFourMutualOmissionJointDeletion R rho u v) :
    K.swap.deleted = K.deleted := rfl

/-- Round trip for the exchange: it is an involution. -/
@[simp] theorem ExactFourMutualOmissionJointDeletion.swap_swap
    (K : ExactFourMutualOmissionJointDeletion R rho u v) :
    K.swap.swap = K := rfl

/-- The second reading of the source: take the packet's second carrier vertex
as the source instead of the first. -/
def ExactFourMutualOmissionJointDeletion.toJointDeletionCoreAtSecond
    (K : ExactFourMutualOmissionJointDeletion R rho u v) :
    JointDeletionCore D (lateFirstApexSystem R) :=
  K.swap.toJointDeletionCore

@[simp] theorem
    ExactFourMutualOmissionJointDeletion.toJointDeletionCoreAtSecond_source
    (K : ExactFourMutualOmissionJointDeletion R rho u v) :
    K.toJointDeletionCoreAtSecond.source = v := rfl

@[simp] theorem
    ExactFourMutualOmissionJointDeletion.toJointDeletionCoreAtSecond_deleted
    (K : ExactFourMutualOmissionJointDeletion R rho u v) :
    K.toJointDeletionCoreAtSecond.deleted = K.deleted := rfl

/-- The two readings name the same deletion; they differ only in which row is
recorded as the source row. -/
theorem toJointDeletionCoreAtSecond_deleted_eq
    (K : ExactFourMutualOmissionJointDeletion R rho u v) :
    K.toJointDeletionCoreAtSecond.deleted = K.toJointDeletionCore.deleted := rfl

/-- Round trip for the two readings: reading the second source off the exchanged
packet returns the first reading of the original. -/
theorem toJointDeletionCoreAtSecond_swap
    (K : ExactFourMutualOmissionJointDeletion R rho u v) :
    K.swap.toJointDeletionCoreAtSecond = K.toJointDeletionCore := rfl

/- ### Field recovery for current callers -/

namespace ExactFourMutualOmissionJointDeletion

variable (K : ExactFourMutualOmissionJointDeletion R rho u v)

/-- Field 1 of the historical packet, `deleted`: recovered from the core. -/
theorem recover_deleted : K.deleted = K.toJointDeletionCore.deleted := rfl

/-- Field 2, `deleted_mem_class`: carried by the extension record.  It names
the second-apex class radius, which the core deliberately drops. -/
theorem recover_deleted_mem_class :
    K.toJointDeletionCore.deleted.1 ∈ SelectedClass D.A S.oppApex2 rho :=
  K.toExtension.deleted_mem_class

/-- Field 3, `deleted_ne_u`: recovered from the core. -/
theorem recover_deleted_ne_u :
    K.toJointDeletionCore.deleted ≠ K.toJointDeletionCore.source :=
  K.toJointDeletionCore.deleted_ne_source

/-- Field 4, `deleted_ne_v`: carried by the extension record. -/
theorem recover_deleted_ne_v : K.toJointDeletionCore.deleted ≠ v :=
  K.toExtension.deleted_ne_v

/-- Field 5, `deleted_not_mem_uRow`: recovered from the core. -/
theorem recover_deleted_not_mem_uRow :
    K.toJointDeletionCore.deleted.1 ∉
      K.toJointDeletionCore.exactSourceRow.toCriticalFourShell.support :=
  K.toJointDeletionCore.deleted_not_mem_exactSourceRow

/-- Field 6, `deleted_not_mem_vRow`: it is the second reading's row omission,
so the exchanged packet recovers it from a core as well. -/
theorem recover_deleted_not_mem_vRow :
    K.toJointDeletionCoreAtSecond.deleted.1 ∉
      K.toJointDeletionCoreAtSecond.exactSourceRow.toCriticalFourShell.support :=
  K.toJointDeletionCoreAtSecond.deleted_not_mem_exactSourceRow

/-- Field 7, `blockers_ne`, in core terms: the source's recorded blocker differs
from the second vertex's recorded blocker. -/
theorem recover_blockers_ne :
    K.toJointDeletionCore.sourceBlocker ≠
      K.toJointDeletionCoreAtSecond.sourceBlocker :=
  K.blockers_ne

/-- Fields 8 and 9, `uPacket` and `vPacket`: carried by the extension record.
The core keeps their survival content and drops their exact rows, so they are
supplied rather than rebuilt. -/
theorem recover_packets_survivals :
    HasNEquidistantPointsAt 4 (D.A.erase K.toJointDeletionCore.deleted.1)
        S.oppApex2 ∧
      HasNEquidistantPointsAt 4 (D.A.erase K.toJointDeletionCore.deleted.1)
        K.toJointDeletionCore.sourceBlocker ∧
      HasNEquidistantPointsAt 4 (D.A.erase K.toJointDeletionCore.deleted.1)
        K.toJointDeletionCoreAtSecond.sourceBlocker :=
  ⟨K.toJointDeletionCore_survives_oppApex2,
    K.toJointDeletionCore_survives_uBlocker,
    K.toJointDeletionCore_survives_vBlocker⟩

/-- The source's recorded blocker is a legal blocker of the source: the
canonical-blocker reading of the packet's first row. -/
theorem isCanonicalBlocker_toJointDeletionCore :
    IsCanonicalBlocker D.A K.toJointDeletionCore.source.1
      K.toJointDeletionCore.sourceBlocker :=
  K.toJointDeletionCore.isCanonicalBlocker_sourceBlocker

/-- The second vertex's blocker is a legal blocker of the second vertex. -/
theorem isCanonicalBlocker_toJointDeletionCoreAtSecond :
    IsCanonicalBlocker D.A K.toJointDeletionCoreAtSecond.source.1
      K.toJointDeletionCoreAtSecond.sourceBlocker :=
  K.toJointDeletionCoreAtSecond.isCanonicalBlocker_sourceBlocker

end ExactFourMutualOmissionJointDeletion

/- ### The source-context record (one-way readers; reverse round trip is a W2b
obligation) -/

/-- Read a provenance core off the source-context record.

The context is the one place in the historical layer that names the row which
supplied the mutually omitted pair, so this reading takes its `source` as the
source and its `other` as the deletion.  Survival centers are supplied by the
caller, since the context records no survival of the deletion of `other`. -/
def ExactFourMutualOmissionSourceContext.jointDeletionCore
    {source other : CriticalShellSystem.CarrierVertex D.A}
    (hctx : ExactFourMutualOmissionSourceContext R rho source other u v)
    (fixedSurvivals : Finset ℝ²)
    (hsubset : fixedSurvivals ⊆ D.A)
    (hsurvives : ∀ c ∈ fixedSurvivals,
      HasNEquidistantPointsAt 4 (D.A.erase other.1) c) :
    JointDeletionCore D (lateFirstApexSystem R) where
  source := source
  sourceBlocker := (lateFirstApexSystem R).centerAt source.1 source.2
  sourceBlocker_eq := rfl
  exactSourceRow := (lateFirstApexSystem R).selectedAt source.1 source.2
  deleted := other
  fixedSurvivals := fixedSurvivals
  fixedSurvivals_subset_carrier := hsubset
  survives_of_mem_fixedSurvivals := hsurvives
  fixedOmissions := {other.1}
  fixedOmissions_subset_carrier := by
    intro z hz
    rw [Finset.mem_singleton] at hz
    subst hz
    exact other.2
  deleted_mem_fixedOmissions := Finset.mem_singleton_self _
  omitted_of_mem_fixedOmissions := by
    intro z hz
    rw [Finset.mem_singleton] at hz
    subst hz
    exact hctx.other_not_mem_source_row

@[simp] theorem ExactFourMutualOmissionSourceContext.jointDeletionCore_source
    {source other : CriticalShellSystem.CarrierVertex D.A}
    (hctx : ExactFourMutualOmissionSourceContext R rho source other u v)
    (fixedSurvivals : Finset ℝ²) (hsubset : fixedSurvivals ⊆ D.A)
    (hsurvives : ∀ c ∈ fixedSurvivals,
      HasNEquidistantPointsAt 4 (D.A.erase other.1) c) :
    (hctx.jointDeletionCore fixedSurvivals hsubset hsurvives).source = source :=
  rfl

@[simp] theorem ExactFourMutualOmissionSourceContext.jointDeletionCore_deleted
    {source other : CriticalShellSystem.CarrierVertex D.A}
    (hctx : ExactFourMutualOmissionSourceContext R rho source other u v)
    (fixedSurvivals : Finset ℝ²) (hsubset : fixedSurvivals ⊆ D.A)
    (hsurvives : ∀ c ∈ fixedSurvivals,
      HasNEquidistantPointsAt 4 (D.A.erase other.1) c) :
    (hctx.jointDeletionCore fixedSurvivals hsubset hsurvives).deleted = other :=
  rfl

/-- The source-context reading with no recorded survival center.  It keeps the
full source provenance and claims nothing about survivals. -/
def ExactFourMutualOmissionSourceContext.jointDeletionCoreBare
    {source other : CriticalShellSystem.CarrierVertex D.A}
    (hctx : ExactFourMutualOmissionSourceContext R rho source other u v) :
    JointDeletionCore D (lateFirstApexSystem R) :=
  hctx.jointDeletionCore ∅ (Finset.empty_subset _)
    (by
      intro c hc
      simp at hc)

end HistoricalRoundTrip

/- ## Round trips for the radius-mode and caller extensions -/

section ModeRoundTrip

variable {D : CounterexampleData} {L : CriticalShellSystem D.A} {apex : ℝ²}

/-- Assemble the same-radius arm from a provenance core and its extra data. -/
def SameRadiusJointDeletion.ofJointDeletionCore (C : JointDeletionCore D L)
    (radius : ℝ) (hradius : 0 < radius)
    (hsource : C.source.1 ∈ SelectedClass D.A apex radius)
    (hdeleted : C.deleted.1 ∈ SelectedClass D.A apex radius)
    (hapex : apex ∈ C.fixedSurvivals) :
    SameRadiusJointDeletion D L apex where
  toJointDeletionCore := C
  radius := radius
  radius_pos := hradius
  source_mem_class := hsource
  deleted_mem_class := hdeleted
  apex_mem_fixedSurvivals := hapex

@[simp] theorem SameRadiusJointDeletion.ofJointDeletionCore_toJointDeletionCore
    (C : JointDeletionCore D L) (radius : ℝ) (hradius : 0 < radius)
    (hsource : C.source.1 ∈ SelectedClass D.A apex radius)
    (hdeleted : C.deleted.1 ∈ SelectedClass D.A apex radius)
    (hapex : apex ∈ C.fixedSurvivals) :
    (SameRadiusJointDeletion.ofJointDeletionCore (apex := apex) C radius
        hradius hsource hdeleted hapex).toJointDeletionCore = C := rfl

/-- Round trip for the same-radius arm: projecting to the core and reassembling
with the arm's own extra data returns the original. -/
theorem SameRadiusJointDeletion.ofJointDeletionCore_eta
    (J : SameRadiusJointDeletion D L apex) :
    SameRadiusJointDeletion.ofJointDeletionCore (apex := apex)
        J.toJointDeletionCore J.radius J.radius_pos J.source_mem_class
        J.deleted_mem_class J.apex_mem_fixedSurvivals = J := rfl

/-- Assemble the cross-radius arm from a provenance core and its extra data. -/
def CrossRadiusJointDeletion.ofJointDeletionCore (C : JointDeletionCore D L)
    (sourceRadius : ℝ) (hsourceRadius : 0 < sourceRadius)
    (deletedRadius : ℝ) (hdeletedRadius : 0 < deletedRadius)
    (hne : sourceRadius ≠ deletedRadius)
    (hsource : C.source.1 ∈ SelectedClass D.A apex sourceRadius)
    (hdeleted : C.deleted.1 ∈ SelectedClass D.A apex deletedRadius)
    (hapex : apex ∈ C.fixedSurvivals) :
    CrossRadiusJointDeletion D L apex where
  toJointDeletionCore := C
  sourceRadius := sourceRadius
  sourceRadius_pos := hsourceRadius
  deletedRadius := deletedRadius
  deletedRadius_pos := hdeletedRadius
  radii_ne := hne
  source_mem_sourceClass := hsource
  deleted_mem_deletedClass := hdeleted
  apex_mem_fixedSurvivals := hapex

@[simp] theorem CrossRadiusJointDeletion.ofJointDeletionCore_toJointDeletionCore
    (C : JointDeletionCore D L) (sourceRadius : ℝ)
    (hsourceRadius : 0 < sourceRadius) (deletedRadius : ℝ)
    (hdeletedRadius : 0 < deletedRadius) (hne : sourceRadius ≠ deletedRadius)
    (hsource : C.source.1 ∈ SelectedClass D.A apex sourceRadius)
    (hdeleted : C.deleted.1 ∈ SelectedClass D.A apex deletedRadius)
    (hapex : apex ∈ C.fixedSurvivals) :
    (CrossRadiusJointDeletion.ofJointDeletionCore (apex := apex) C sourceRadius
        hsourceRadius deletedRadius hdeletedRadius hne hsource hdeleted
        hapex).toJointDeletionCore = C := rfl

/-- Round trip for the cross-radius arm. -/
theorem CrossRadiusJointDeletion.ofJointDeletionCore_eta
    (J : CrossRadiusJointDeletion D L apex) :
    CrossRadiusJointDeletion.ofJointDeletionCore (apex := apex)
        J.toJointDeletionCore J.sourceRadius J.sourceRadius_pos J.deletedRadius
        J.deletedRadius_pos J.radii_ne J.source_mem_sourceClass
        J.deleted_mem_deletedClass J.apex_mem_fixedSurvivals = J := rfl

@[simp] theorem ApexRadiusMode.toJointDeletionCore_sameRadius
    (J : SameRadiusJointDeletion D L apex) :
    (ApexRadiusMode.sameRadius J).toJointDeletionCore =
      J.toJointDeletionCore := rfl

@[simp] theorem ApexRadiusMode.toJointDeletionCore_crossRadius
    (J : CrossRadiusJointDeletion D L apex) :
    (ApexRadiusMode.crossRadius J).toJointDeletionCore =
      J.toJointDeletionCore := rfl

/-- Round trip for the mode: a mode is one of its two arms, and the arm is
recovered on the nose. -/
theorem ApexRadiusMode.eq_sameRadius_or_eq_crossRadius
    (M : ApexRadiusMode D L apex) :
    (∃ J : SameRadiusJointDeletion D L apex, M = .sameRadius J) ∨
      (∃ J : CrossRadiusJointDeletion D L apex, M = .crossRadius J) := by
  cases M with
  | sameRadius data => exact Or.inl ⟨data, rfl⟩
  | crossRadius data => exact Or.inr ⟨data, rfl⟩

/-- Assemble the tri-apex extension from a provenance core and its extra
data. -/
def TriApexJointDeletionProvenance.ofJointDeletionCore
    {S : SurplusCapPacket D.A} {apexes : Fin 3 → ℝ²}
    (C : JointDeletionCore D L)
    (hallApex : ∀ i : Fin 3, apexes i ∈ C.fixedSurvivals)
    (globalEscapeSet : Finset ℝ²) (hescapeCarrier : globalEscapeSet ⊆ D.A)
    (hdeletedEscape : C.deleted.1 ∈ globalEscapeSet)
    (hescapeOmitted : globalEscapeSet ⊆ C.fixedOmissions)
    (hescapeSurvives : ∀ z ∈ globalEscapeSet, ∀ i : Fin 3,
      HasNEquidistantPointsAt 4 (D.A.erase z) (apexes i))
    (capLabels : ℝ² → Fin 3)
    (hcapLabels : ∀ z ∈ globalEscapeSet,
      z ∈ S.capInteriorByIndex (capLabels z)) :
    TriApexJointDeletionProvenance D S L apexes where
  toJointDeletionCore := C
  allApexSurvivals := hallApex
  globalEscapeSet := globalEscapeSet
  globalEscapeSet_subset_carrier := hescapeCarrier
  deleted_mem_globalEscapeSet := hdeletedEscape
  globalEscapeSet_subset_fixedOmissions := hescapeOmitted
  escape_survives_at_apexes := hescapeSurvives
  capLabels := capLabels
  capLabels_mem_capInterior := hcapLabels

@[simp] theorem
    TriApexJointDeletionProvenance.ofJointDeletionCore_toJointDeletionCore
    {S : SurplusCapPacket D.A} {apexes : Fin 3 → ℝ²}
    (C : JointDeletionCore D L)
    (hallApex : ∀ i : Fin 3, apexes i ∈ C.fixedSurvivals)
    (globalEscapeSet : Finset ℝ²) (hescapeCarrier : globalEscapeSet ⊆ D.A)
    (hdeletedEscape : C.deleted.1 ∈ globalEscapeSet)
    (hescapeOmitted : globalEscapeSet ⊆ C.fixedOmissions)
    (hescapeSurvives : ∀ z ∈ globalEscapeSet, ∀ i : Fin 3,
      HasNEquidistantPointsAt 4 (D.A.erase z) (apexes i))
    (capLabels : ℝ² → Fin 3)
    (hcapLabels : ∀ z ∈ globalEscapeSet,
      z ∈ S.capInteriorByIndex (capLabels z)) :
    (TriApexJointDeletionProvenance.ofJointDeletionCore (S := S)
        (apexes := apexes) C hallApex globalEscapeSet hescapeCarrier
        hdeletedEscape hescapeOmitted hescapeSurvives capLabels
        hcapLabels).toJointDeletionCore = C := rfl

/-- Round trip for the tri-apex extension. -/
theorem TriApexJointDeletionProvenance.ofJointDeletionCore_eta
    {S : SurplusCapPacket D.A} {apexes : Fin 3 → ℝ²}
    (T : TriApexJointDeletionProvenance D S L apexes) :
    TriApexJointDeletionProvenance.ofJointDeletionCore (S := S)
        (apexes := apexes) T.toJointDeletionCore T.allApexSurvivals
        T.globalEscapeSet T.globalEscapeSet_subset_carrier
        T.deleted_mem_globalEscapeSet T.globalEscapeSet_subset_fixedOmissions
        T.escape_survives_at_apexes T.capLabels T.capLabels_mem_capInterior =
      T := rfl

/-- The two-source record is always the cross-radius arm, on the nose. -/
theorem TwoSourceJointDeletionProvenance.toApexRadiusMode_eq
    (J : TwoSourceJointDeletionProvenance D L apex) :
    J.toApexRadiusMode = .crossRadius J.toCrossRadiusJointDeletion := rfl

/-- Assemble the two-source extension from a cross-radius arm and its extra
data.  This is the reverse of the `toCrossRadiusJointDeletion` projection. -/
def TwoSourceJointDeletionProvenance.ofCrossRadiusJointDeletion
    (P : CrossRadiusJointDeletion D L apex)
    (smallRadius largeRadius : ℝ) (hsmallPos : 0 < smallRadius)
    (hlt : smallRadius < largeRadius) (smallClass largeClass : Finset ℝ²)
    (hsmallClass : smallClass = SelectedClass D.A apex smallRadius)
    (hlargeClass : largeClass = SelectedClass D.A apex largeRadius)
    (hsmallCard : smallClass.card = 4) (hlargeCard : largeClass.card = 4)
    (hsourceRadius :
      P.sourceRadius = smallRadius ∨ P.sourceRadius = largeRadius)
    (hdeletedRadius :
      P.deletedRadius = smallRadius ∨ P.deletedRadius = largeRadius)
    (dangerousFirst dangerousSecond dangerousThird : ℝ²)
    (hd₁₂ : dangerousFirst ≠ dangerousSecond)
    (hd₁₃ : dangerousFirst ≠ dangerousThird)
    (hd₂₃ : dangerousSecond ≠ dangerousThird)
    (dangerousTriple : Finset ℝ²)
    (htriple : dangerousTriple =
      ({dangerousFirst, dangerousSecond, dangerousThird} : Finset ℝ²))
    (htripleSubset : dangerousTriple ⊆ smallClass ∪ largeClass)
    (hdeletedTriple : P.deleted.1 ∈ dangerousTriple)
    (retainedTrace : Finset ℝ²)
    (htrace : retainedTrace =
      P.exactSourceRow.toCriticalFourShell.support ∩
        (smallClass ∪ largeClass)) :
    TwoSourceJointDeletionProvenance D L apex where
  toCrossRadiusJointDeletion := P
  smallRadius := smallRadius
  largeRadius := largeRadius
  smallRadius_pos := hsmallPos
  radii_lt := hlt
  smallClass := smallClass
  largeClass := largeClass
  smallClass_eq := hsmallClass
  largeClass_eq := hlargeClass
  smallClass_card_eq_four := hsmallCard
  largeClass_card_eq_four := hlargeCard
  sourceRadius_eq_small_or_large := hsourceRadius
  deletedRadius_eq_small_or_large := hdeletedRadius
  dangerousFirst := dangerousFirst
  dangerousSecond := dangerousSecond
  dangerousThird := dangerousThird
  dangerousFirst_ne_dangerousSecond := hd₁₂
  dangerousFirst_ne_dangerousThird := hd₁₃
  dangerousSecond_ne_dangerousThird := hd₂₃
  dangerousTriple := dangerousTriple
  dangerousTriple_eq := htriple
  dangerousTriple_subset := htripleSubset
  deleted_mem_dangerousTriple := hdeletedTriple
  retainedTrace := retainedTrace
  retainedTrace_eq := htrace

/-- Round trip for the two-source extension, the other way: assembling from a
cross-radius arm and projecting back returns that arm. -/
@[simp] theorem
    TwoSourceJointDeletionProvenance.ofCrossRadiusJointDeletion_toCrossRadiusJointDeletion
    (P : CrossRadiusJointDeletion D L apex)
    (smallRadius largeRadius : ℝ) (hsmallPos : 0 < smallRadius)
    (hlt : smallRadius < largeRadius) (smallClass largeClass : Finset ℝ²)
    (hsmallClass : smallClass = SelectedClass D.A apex smallRadius)
    (hlargeClass : largeClass = SelectedClass D.A apex largeRadius)
    (hsmallCard : smallClass.card = 4) (hlargeCard : largeClass.card = 4)
    (hsourceRadius :
      P.sourceRadius = smallRadius ∨ P.sourceRadius = largeRadius)
    (hdeletedRadius :
      P.deletedRadius = smallRadius ∨ P.deletedRadius = largeRadius)
    (dangerousFirst dangerousSecond dangerousThird : ℝ²)
    (hd₁₂ : dangerousFirst ≠ dangerousSecond)
    (hd₁₃ : dangerousFirst ≠ dangerousThird)
    (hd₂₃ : dangerousSecond ≠ dangerousThird)
    (dangerousTriple : Finset ℝ²)
    (htriple : dangerousTriple =
      ({dangerousFirst, dangerousSecond, dangerousThird} : Finset ℝ²))
    (htripleSubset : dangerousTriple ⊆ smallClass ∪ largeClass)
    (hdeletedTriple : P.deleted.1 ∈ dangerousTriple)
    (retainedTrace : Finset ℝ²)
    (htrace : retainedTrace =
      P.exactSourceRow.toCriticalFourShell.support ∩
        (smallClass ∪ largeClass)) :
    (TwoSourceJointDeletionProvenance.ofCrossRadiusJointDeletion P smallRadius
        largeRadius hsmallPos hlt smallClass largeClass hsmallClass hlargeClass
        hsmallCard hlargeCard hsourceRadius hdeletedRadius dangerousFirst
        dangerousSecond dangerousThird hd₁₂ hd₁₃ hd₂₃ dangerousTriple htriple
        htripleSubset hdeletedTriple retainedTrace
        htrace).toCrossRadiusJointDeletion = P := rfl

/-- Round trip for the two-source extension: projecting to the cross-radius arm
and reassembling with the record's own extra data returns the original. -/
theorem TwoSourceJointDeletionProvenance.ofCrossRadiusJointDeletion_eta
    (J : TwoSourceJointDeletionProvenance D L apex) :
    TwoSourceJointDeletionProvenance.ofCrossRadiusJointDeletion
        J.toCrossRadiusJointDeletion J.smallRadius J.largeRadius
        J.smallRadius_pos J.radii_lt J.smallClass J.largeClass J.smallClass_eq
        J.largeClass_eq J.smallClass_card_eq_four J.largeClass_card_eq_four
        J.sourceRadius_eq_small_or_large J.deletedRadius_eq_small_or_large
        J.dangerousFirst J.dangerousSecond J.dangerousThird
        J.dangerousFirst_ne_dangerousSecond J.dangerousFirst_ne_dangerousThird
        J.dangerousSecond_ne_dangerousThird J.dangerousTriple
        J.dangerousTriple_eq J.dangerousTriple_subset
        J.deleted_mem_dangerousTriple J.retainedTrace J.retainedTrace_eq =
      J := rfl

end ModeRoundTrip

/- ## Pinning the historical classification -/

noncomputable section ClassificationRoundTrip

variable {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
  {H : CriticalShellSystem D.A}
  {F : CriticalPairFrontier D S radius H}
  {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
  {rho : ℝ} {u v : CriticalShellSystem.CarrierVertex D.A}

/-- With the source on the deletion's own radius the classification takes the
same-radius arm, and the arm is the one the direct promotion produces. -/
theorem toApexRadiusMode_eq_sameRadius
    (K : ExactFourMutualOmissionJointDeletion R rho u v)
    (sourceRadius : ℝ) (hsourceRadiusPos : 0 < sourceRadius)
    (hrhoPos : 0 < rho)
    (hsourceClass : u.1 ∈ SelectedClass D.A S.oppApex2 sourceRadius)
    (hEq : sourceRadius = rho)
    (hsourceClass' : u.1 ∈ SelectedClass D.A S.oppApex2 rho) :
    K.toApexRadiusMode sourceRadius hsourceRadiusPos hrhoPos hsourceClass =
      .sameRadius (K.toSameRadiusJointDeletion hrhoPos hsourceClass') := by
  unfold ExactFourMutualOmissionJointDeletion.toApexRadiusMode
  rw [dif_pos hEq]

/-- With the source on a different radius the classification takes the
cross-radius arm, and the arm is the one the direct promotion produces. -/
theorem toApexRadiusMode_eq_crossRadius
    (K : ExactFourMutualOmissionJointDeletion R rho u v)
    (sourceRadius : ℝ) (hsourceRadiusPos : 0 < sourceRadius)
    (hrhoPos : 0 < rho)
    (hsourceClass : u.1 ∈ SelectedClass D.A S.oppApex2 sourceRadius)
    (hNe : sourceRadius ≠ rho) :
    K.toApexRadiusMode sourceRadius hsourceRadiusPos hrhoPos hsourceClass =
      .crossRadius (K.toCrossRadiusJointDeletion sourceRadius hsourceRadiusPos
        hrhoPos hNe hsourceClass) := by
  unfold ExactFourMutualOmissionJointDeletion.toApexRadiusMode
  rw [dif_neg hNe]

/-- The same-radius promotion of a historical packet keeps the packet's own
provenance core. -/
@[simp] theorem toSameRadiusJointDeletion_toJointDeletionCore
    (K : ExactFourMutualOmissionJointDeletion R rho u v) (hrhoPos : 0 < rho)
    (hsourceClass : u.1 ∈ SelectedClass D.A S.oppApex2 rho) :
    (K.toSameRadiusJointDeletion hrhoPos hsourceClass).toJointDeletionCore =
      K.toJointDeletionCore := rfl

/-- The cross-radius promotion of a historical packet keeps the packet's own
provenance core. -/
@[simp] theorem toCrossRadiusJointDeletion_toJointDeletionCore
    (K : ExactFourMutualOmissionJointDeletion R rho u v) (sourceRadius : ℝ)
    (hsourceRadiusPos : 0 < sourceRadius) (hrhoPos : 0 < rho)
    (hradiiNe : sourceRadius ≠ rho)
    (hsourceClass : u.1 ∈ SelectedClass D.A S.oppApex2 sourceRadius) :
    (K.toCrossRadiusJointDeletion sourceRadius hsourceRadiusPos hrhoPos
        hradiiNe hsourceClass).toJointDeletionCore = K.toJointDeletionCore :=
  rfl

end ClassificationRoundTrip

end ATailFrontierLiveClosure
end Problem97
