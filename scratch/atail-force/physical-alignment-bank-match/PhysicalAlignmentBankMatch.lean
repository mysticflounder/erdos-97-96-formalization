/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import SurvivalCoverBankMatch

/-!
# Scratch: actual-blocker row alignment for the survival-cover producer

The card-at-least-fourteen survival-cover theorem retains two source vertices
and centers the two common-deletion rows at their actual blockers.  This file
records the selector-independent consequence that was not present in the
generic `CommonDeletionTwoCenterPacket`: each q-deleted row is exactly the
chosen critical support of its retained source.  In particular, each source
lies in its corresponding row and therefore produces a source-indexed U5
critical triple.

This is actual-blocker/source-row alignment.  It does not identify either
blocker with the live physical centers `p` or `S.oppApex2`.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailPhysicalAlignmentBankMatchScratch

open ATailContinuationBankMatchScratch
open ATailCriticalPairFrontier
open ATAILStageOnePrescribedApexDichotomy
open ATailAnchoredDoubleDeletionProducerScratch
open ATailSurvivalCoverBankMatchScratch

attribute [local instance] Classical.propDecidable

/-- Regard an exact-cardinality q-deleted U5 row as an ambient selected
four-class at the same center. -/
def ambientSelectedFourClassOfQDeletedRow
    {D : CounterexampleData} {deleted center : ℝ²} {B : Finset ℝ²}
    (K : U5QDeletedK4Class D deleted center B)
    (hBcard : B.card = 4) :
    SelectedFourClass D.A center where
  support := B
  support_subset_A := by
    intro z hz
    exact (Finset.mem_erase.mp
      (Finset.mem_erase.mp (K.subset hz)).2).2
  support_card := hBcard
  radius := K.radius
  radius_pos := K.radius_pos
  support_eq_radius := K.same_radius
  center_not_mem := by
    intro hcenter
    exact (Finset.mem_erase.mp (K.subset hcenter)).1 rfl

/-- A q-deleted exact row centered at a retained source's actual blocker is
exactly that source's chosen critical support. -/
theorem qDeletedRow_support_eq_selectedAt_of_actualBlocker
    {D : CounterexampleData} (H : CriticalShellSystem D.A)
    {deleted : ℝ²}
    (source : CriticalShellSystem.CarrierVertex D.A)
    {B : Finset ℝ²}
    (K : U5QDeletedK4Class D deleted
      (H.centerAt source.1 source.2) B)
    (hBcard : B.card = 4) :
    B = (H.selectedAt source.1 source.2).toCriticalFourShell.support := by
  exact H.selectedFourClass_support_eq_shell source.1 source.2
    (ambientSelectedFourClassOfQDeletedRow K hBcard)

/-- The retained source belongs to every exact q-deleted row centered at its
actual blocker. -/
theorem source_mem_qDeletedRow_of_actualBlocker
    {D : CounterexampleData} (H : CriticalShellSystem D.A)
    {deleted : ℝ²}
    (source : CriticalShellSystem.CarrierVertex D.A)
    {B : Finset ℝ²}
    (K : U5QDeletedK4Class D deleted
      (H.centerAt source.1 source.2) B)
    (hBcard : B.card = 4) :
    source.1 ∈ B := by
  rw [qDeletedRow_support_eq_selectedAt_of_actualBlocker
    H source K hBcard]
  exact (H.selectedAt source.1 source.2).toCriticalFourShell.q_mem_support

/-- Source-faithful strengthening of the generic common-deletion packet.
Both exact rows are identified with the chosen critical shells at their
retained sources, and hence export source-indexed U5 critical triples. -/
structure ActualBlockerSourceIndexedCommonDeletion
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H) : Type where
  deleted : ℝ²
  deleted_mem_A : deleted ∈ D.A
  source₁ : CriticalShellSystem.CarrierVertex D.A
  source₂ : CriticalShellSystem.CarrierVertex D.A
  deleted_eq_frontier : deleted = P.q ∨ deleted = P.w
  source₁_outside_qBlockerFiber :
    source₁ ∈ Finset.univ \ qBlockerFiber P
  source₂_outside_qBlockerFiber :
    source₂ ∈ Finset.univ \ qBlockerFiber P
  centers_ne :
    H.centerAt source₁.1 source₁.2 ≠
      H.centerAt source₂.1 source₂.2
  packet : CommonDeletionTwoCenterPacket D H deleted
    (H.centerAt source₁.1 source₁.2)
    (H.centerAt source₂.1 source₂.2)
  first_support_eq :
    packet.B₁ =
      (H.selectedAt source₁.1 source₁.2).toCriticalFourShell.support
  second_support_eq :
    packet.B₂ =
      (H.selectedAt source₂.1 source₂.2).toCriticalFourShell.support
  source₁_mem_first : source₁.1 ∈ packet.B₁
  source₂_mem_second : source₂.1 ∈ packet.B₂
  sources_ne : source₁.1 ≠ source₂.1
  source₁_ne_deleted : source₁.1 ≠ deleted
  source₂_ne_deleted : source₂.1 ≠ deleted
  first_qCritical :
    Nonempty (U5QCriticalTripleClass D source₁.1
      (H.centerAt source₁.1 source₁.2)
      (packet.B₁.erase source₁.1))
  second_qCritical :
    Nonempty (U5QCriticalTripleClass D source₂.1
      (H.centerAt source₂.1 source₂.2)
      (packet.B₂.erase source₂.1))

/-- The card-at-least-fourteen survival-cover producer automatically carries
the exact source-row alignment and two source-indexed U5 critical triples. -/
theorem nonempty_actualBlockerSourceIndexedCommonDeletion_of_card_ge_fourteen
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H)
    (hnotFour : (SelectedClass D.A S.oppApex1 r).card ≠ 4)
    (hwSupport :
      P.w ∈ (H.selectedAt P.q P.q_mem_A).toCriticalFourShell.support)
    (hcard : 14 ≤ D.A.card) :
    Nonempty (ActualBlockerSourceIndexedCommonDeletion P) := by
  rcases exists_sourceFaithful_commonDeletionTwoCenterPacket_of_card_ge_fourteen
      P hnotFour hwSupport hcard with
    ⟨deleted, hdeleted, source₁, source₂, hdeletedEq,
      hsource₁Outside, hsource₂Outside, hcenters,
      _hsurvives₁, _hsurvives₂, ⟨C⟩⟩
  have hfirstEq :=
    qDeletedRow_support_eq_selectedAt_of_actualBlocker
      H source₁ C.row₁ C.B₁_card
  have hsecondEq :=
    qDeletedRow_support_eq_selectedAt_of_actualBlocker
      H source₂ C.row₂ C.B₂_card
  have hsource₁B :=
    source_mem_qDeletedRow_of_actualBlocker
      H source₁ C.row₁ C.B₁_card
  have hsource₂B :=
    source_mem_qDeletedRow_of_actualBlocker
      H source₂ C.row₂ C.B₂_card
  have hsources : source₁.1 ≠ source₂.1 := by
    intro hsource
    have hsourceSubtype : source₁ = source₂ := Subtype.ext hsource
    subst source₂
    exact hcenters rfl
  have hsource₁Deleted : source₁.1 ≠ deleted := by
    intro hsource
    exact C.row₁.q_not_mem (hsource ▸ hsource₁B)
  have hsource₂Deleted : source₂.1 ≠ deleted := by
    intro hsource
    exact C.row₂.q_not_mem (hsource ▸ hsource₂B)
  have hcritical₁ :
      Nonempty (U5QCriticalTripleClass D source₁.1
        (H.centerAt source₁.1 source₁.2)
        (C.B₁.erase source₁.1)) :=
    C.row₁.toQAllowedK4Class.qCriticalTriple_of_mem_q
      C.B₁_card hsource₁B
  have hcritical₂ :
      Nonempty (U5QCriticalTripleClass D source₂.1
        (H.centerAt source₂.1 source₂.2)
        (C.B₂.erase source₂.1)) :=
    C.row₂.toQAllowedK4Class.qCriticalTriple_of_mem_q
      C.B₂_card hsource₂B
  exact ⟨{
    deleted := deleted
    deleted_mem_A := hdeleted
    source₁ := source₁
    source₂ := source₂
    deleted_eq_frontier := hdeletedEq
    source₁_outside_qBlockerFiber := hsource₁Outside
    source₂_outside_qBlockerFiber := hsource₂Outside
    centers_ne := hcenters
    packet := C
    first_support_eq := hfirstEq
    second_support_eq := hsecondEq
    source₁_mem_first := hsource₁B
    source₂_mem_second := hsource₂B
    sources_ne := hsources
    source₁_ne_deleted := hsource₁Deleted
    source₂_ne_deleted := hsource₂Deleted
    first_qCritical := hcritical₁
    second_qCritical := hcritical₂
  }⟩

#print axioms qDeletedRow_support_eq_selectedAt_of_actualBlocker
#print axioms source_mem_qDeletedRow_of_actualBlocker
#print axioms nonempty_actualBlockerSourceIndexedCommonDeletion_of_card_ge_fourteen

end ATailPhysicalAlignmentBankMatchScratch
end Problem97
