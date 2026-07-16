/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import OriginalQSourceExtraction
import F2GeneratedEscapePlacement
import BlockerAlignment

/-!
# Scratch: prescribed criticality bridges for original-q generated rows

The exact generated-row split alone does not choose any named reverse
incidence.  This file records the weakest mechanical bridge that does:

* if deleting `source` destroys K4 at the generated center, then `source`
  belongs to the generated selected row; and
* equality of that center with the retained blocker of `source` supplies the
  deletion failure.

For a q-critical output the generated triple must first be completed by the
original deleted point.  A prescribed source distinct from that deleted point
then belongs to the surviving triple.

The current `OriginalQDeletionSplit` packages a q-critical raw 4A alternative
only as a triple and thereby forgets its exact full-shell witness.  The
raw-preserving split below retains all three views: the raw alternative, its
exact triple, and the full critical shell.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailRF2OriginalQCriticalityBridgeScratch

open ATailGlobalK4Extension
open ATailRF2GeneratedEscapePlacementScratch
open ATailRF2OriginalQSourceExtractionScratch
open ATailRF2SupportHeavyK4SplitScratch
open ATailRParentDangerousRowCouplingScratch

attribute [local instance] Classical.propDecidable

/-- Prescribed deletion criticality forces the source into an exact
q-deleted generated support.

No exact-cardinality argument beyond the selected-row wrapper is added here;
the result is the generic choice-invariant selected-row bridge specialized to
the exact q-deleted constructor. -/
theorem qDeleted_source_mem_support_of_prescribed_deletion_criticality
    {D : CounterexampleData} {deleted center source : ℝ²}
    (K : ExactQDeletedAt D deleted center)
    (hblocked :
      ¬ HasNEquidistantPointsAt 4 (D.A.erase source) center) :
    source ∈ K.support := by
  simpa [ExactGeneratedAt.qDeletedSelectedFourClass] using
    source_mem_selected_support_of_prescribed_deletion_criticality
      (ExactGeneratedAt.qDeletedSelectedFourClass K) hblocked

/-- Retained blocker-center provenance supplies the q-deleted support
membership directly. -/
theorem qDeleted_source_mem_support_of_blocker_alignment
    {D : CounterexampleData} {deleted center source : ℝ²}
    (H : CriticalShellSystem D.A)
    (hsource : source ∈ D.A)
    (K : ExactQDeletedAt D deleted center)
    (halign : H.centerAt source hsource = center) :
    source ∈ K.support := by
  exact
    qDeleted_source_mem_support_of_prescribed_deletion_criticality K <| by
      simpa [halign] using H.no_qfree_at source hsource

/-- Prescribed deletion criticality forces a source distinct from the
original deleted point into the surviving q-critical triple. -/
theorem qCritical_source_mem_support_of_prescribed_deletion_criticality
    {D : CounterexampleData} {deleted center source : ℝ²}
    (K : ExactQCriticalAt D deleted center)
    (hdeleted : deleted ∈ D.A)
    (hcenter_ne_deleted : center ≠ deleted)
    (hsource_ne_deleted : source ≠ deleted)
    (hblocked :
      ¬ HasNEquidistantPointsAt 4 (D.A.erase source) center) :
    source ∈ K.support := by
  have hfull :
      source ∈
        (ExactGeneratedAt.qCriticalSelectedFourClass
          K hdeleted hcenter_ne_deleted).support :=
    source_mem_selected_support_of_prescribed_deletion_criticality
      (ExactGeneratedAt.qCriticalSelectedFourClass
        K hdeleted hcenter_ne_deleted) hblocked
  simpa [ExactGeneratedAt.qCriticalSelectedFourClass,
    hsource_ne_deleted] using hfull

/-- Retained blocker-center provenance supplies the q-critical triple
membership once the prescribed source is known not to be the deleted point. -/
theorem qCritical_source_mem_support_of_blocker_alignment
    {D : CounterexampleData} {deleted center source : ℝ²}
    (H : CriticalShellSystem D.A)
    (hdeleted : deleted ∈ D.A)
    (hsource : source ∈ D.A)
    (K : ExactQCriticalAt D deleted center)
    (hcenter_ne_deleted : center ≠ deleted)
    (hsource_ne_deleted : source ≠ deleted)
    (halign : H.centerAt source hsource = center) :
    source ∈ K.support := by
  exact
    qCritical_source_mem_support_of_prescribed_deletion_criticality
      K hdeleted hcenter_ne_deleted hsource_ne_deleted <| by
        simpa [halign] using H.no_qfree_at source hsource

/-- Uniform generated-row form: prescribed deletion criticality puts
`source` either at the distinguished deleted point or in the stored generated
support. -/
theorem generated_source_eq_deleted_or_mem_support_of_prescribed_deletion_criticality
    {D : CounterexampleData} {deleted center source : ℝ²}
    (G : ExactGeneratedAt D deleted center)
    (hdeleted : deleted ∈ D.A)
    (hcenter_ne_deleted : center ≠ deleted)
    (hblocked :
      ¬ HasNEquidistantPointsAt 4 (D.A.erase source) center) :
    source = deleted ∨ source ∈ G.support := by
  cases G with
  | qDeleted K =>
      exact Or.inr
        (qDeleted_source_mem_support_of_prescribed_deletion_criticality K hblocked)
  | qCritical K =>
      by_cases hsource : source = deleted
      · exact Or.inl hsource
      · exact Or.inr
          (qCritical_source_mem_support_of_prescribed_deletion_criticality
            K hdeleted hcenter_ne_deleted hsource hblocked)

/-- Uniform generated-row membership under the natural
`source ≠ deleted` side condition. -/
theorem generated_source_mem_support_of_prescribed_deletion_criticality
    {D : CounterexampleData} {deleted center source : ℝ²}
    (G : ExactGeneratedAt D deleted center)
    (hdeleted : deleted ∈ D.A)
    (hcenter_ne_deleted : center ≠ deleted)
    (hsource_ne_deleted : source ≠ deleted)
    (hblocked :
      ¬ HasNEquidistantPointsAt 4 (D.A.erase source) center) :
    source ∈ G.support :=
  (generated_source_eq_deleted_or_mem_support_of_prescribed_deletion_criticality
    G hdeleted hcenter_ne_deleted hblocked).resolve_left hsource_ne_deleted

/-- Actual blocker alignment is the exact missing provenance needed to turn
an arbitrary generated row into a directed source incidence. -/
theorem generated_source_mem_support_of_blocker_alignment
    {D : CounterexampleData} {deleted center source : ℝ²}
    (H : CriticalShellSystem D.A)
    (hdeleted : deleted ∈ D.A)
    (hsource : source ∈ D.A)
    (G : ExactGeneratedAt D deleted center)
    (hcenter_ne_deleted : center ≠ deleted)
    (hsource_ne_deleted : source ≠ deleted)
    (halign : H.centerAt source hsource = center) :
    source ∈ G.support := by
  exact
    generated_source_mem_support_of_prescribed_deletion_criticality
      G hdeleted hcenter_ne_deleted hsource_ne_deleted <| by
        simpa [halign] using H.no_qfree_at source hsource

/-- Direct current-F2 interface: a prescribed deletion failure at the named
generated center forces the prescribed source into any exact original-`q`
generated support there. -/
theorem generated_source_mem_support_of_profile_and_prescribed_criticality
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {p q t1 t2 t3 center source : ℝ²}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    (P : OriginalQGeneratedCenterProfile (S := S) W center)
    (G : ExactGeneratedAt D q center)
    (hsource_ne_q : source ≠ q)
    (hblocked :
      ¬ HasNEquidistantPointsAt 4 (D.A.erase source) center) :
    source ∈ G.support :=
  generated_source_mem_support_of_prescribed_deletion_criticality
    G P.source.q_mem_A P.center_ne_source hsource_ne_q hblocked

/-- Direct current-F2 blocker-provenance interface.  This theorem makes the
remaining producer explicit: the retained critical map must send the desired
source to the named generated center. -/
theorem generated_source_mem_support_of_profile_and_blocker_alignment
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {p q t1 t2 t3 center source : ℝ²}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    (P : OriginalQGeneratedCenterProfile (S := S) W center)
    (G : ExactGeneratedAt D q center)
    (hsource : source ∈ D.A)
    (hsource_ne_q : source ≠ q)
    (halign : W.H.centerAt source hsource = center) :
    source ∈ G.support :=
  generated_source_mem_support_of_blocker_alignment
    W.H P.source.q_mem_A hsource G P.center_ne_source hsource_ne_q halign

/-- The raw q-critical 4A alternative, before it is weakened to an exact
three-point support. -/
def RawQCriticalAlternative
    (D : CounterexampleData) (deleted center : ℝ²) : Prop :=
  ∃ radius : ℝ, 0 < radius ∧ dist center deleted = radius ∧
    ((((D.skeleton deleted).erase center).filter
      fun y => dist center y = radius).card = 3)

/-- A raw q-critical alternative retained together with both downstream
interfaces: the exact surviving triple and the exact full critical shell. -/
structure RawQCriticalPayload
    (D : CounterexampleData) (deleted center : ℝ²) : Prop where
  raw : RawQCriticalAlternative D deleted center
  exact_generated : Nonempty (ExactQCriticalAt D deleted center)
  full_shell : Nonempty (CriticalFourShell D.A deleted center)

/-- Package one raw q-critical alternative without discarding either its U5
triple view or its full exact-shell view. -/
theorem nonempty_rawQCriticalPayload
    {D : CounterexampleData} {deleted center : ℝ²}
    (hdeleted : deleted ∈ D.A)
    (hcenter : center ∈ D.skeleton deleted)
    (hraw : RawQCriticalAlternative D deleted center) :
    RawQCriticalPayload D deleted center := by
  rcases U5QCriticalTripleClass.exists_card_three_of_qCritical hraw with
    ⟨B, ⟨K⟩, hB⟩
  exact {
    raw := hraw
    exact_generated := ⟨{
      support := B
      row := K
      support_card := hB
    }⟩
    full_shell :=
      U5QCriticalTripleClass.exists_criticalFourShell_of_qCritical
        hdeleted hcenter hraw
  }

/-- Raw-preserving replacement for `OriginalQDeletionSplit`.

The q-deleted branch is unchanged.  The q-critical branch keeps the raw 4A
alternative and both of its useful exact views. -/
def OriginalQDeletionSplitWithRaw
    (D : CounterexampleData) (deleted center : ℝ²) : Prop :=
  (∃ B : Finset ℝ²,
      Nonempty (U5QDeletedK4Class D deleted center B) ∧ B.card = 4) ∨
    RawQCriticalPayload D deleted center

/-- Global K4 gives the raw-preserving original-source split at any
q-deleted center. -/
theorem originalQDeletionSplitWithRaw_of_globalK4
    {D : CounterexampleData} {deleted center : ℝ²}
    (hdeleted : deleted ∈ D.A)
    (hcenter : center ∈ D.skeleton deleted) :
    OriginalQDeletionSplitWithRaw D deleted center := by
  rcases U5QDeletedK4Class.exists_card_four_or_qCritical_of_globalK4
      hdeleted hcenter with hqDeleted | hqCritical
  · exact Or.inl hqDeleted
  · exact Or.inr
      (nonempty_rawQCriticalPayload hdeleted hcenter hqCritical)

/-- Forgetting the retained raw/full-shell evidence recovers the existing
triple-only deletion split. -/
theorem OriginalQDeletionSplitWithRaw.toOriginalQDeletionSplit
    {D : CounterexampleData} {deleted center : ℝ²}
    (h : OriginalQDeletionSplitWithRaw D deleted center) :
    OriginalQDeletionSplit D deleted center := by
  rcases h with hqDeleted | hqCritical
  · exact Or.inl hqDeleted
  · rcases hqCritical.exact_generated with ⟨K⟩
    exact Or.inr ⟨K.support, ⟨K.row⟩, K.support_card⟩

/-- The source-faithful generated-center profile can recover the stronger
raw-preserving split from fields it already retains. -/
theorem OriginalQGeneratedCenterProfile.deletionSplitWithRaw
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {p q t1 t2 t3 center : ℝ²}
    {W : LiveDangerousRetainingSystem D p q t1 t2 t3}
    (P : OriginalQGeneratedCenterProfile (S := S) W center) :
    OriginalQDeletionSplitWithRaw D q center := by
  apply originalQDeletionSplitWithRaw_of_globalK4
    P.source.q_mem_A
  change center ∈ D.A.erase q
  exact Finset.mem_erase.mpr ⟨P.center_ne_source, P.center_mem_A⟩

#print axioms qDeleted_source_mem_support_of_prescribed_deletion_criticality
#print axioms qDeleted_source_mem_support_of_blocker_alignment
#print axioms qCritical_source_mem_support_of_prescribed_deletion_criticality
#print axioms qCritical_source_mem_support_of_blocker_alignment
#print axioms generated_source_eq_deleted_or_mem_support_of_prescribed_deletion_criticality
#print axioms generated_source_mem_support_of_prescribed_deletion_criticality
#print axioms generated_source_mem_support_of_blocker_alignment
#print axioms generated_source_mem_support_of_profile_and_prescribed_criticality
#print axioms generated_source_mem_support_of_profile_and_blocker_alignment
#print axioms nonempty_rawQCriticalPayload
#print axioms originalQDeletionSplitWithRaw_of_globalK4
#print axioms OriginalQDeletionSplitWithRaw.toOriginalQDeletionSplit
#print axioms OriginalQGeneratedCenterProfile.deletionSplitWithRaw

end ATailRF2OriginalQCriticalityBridgeScratch
end Problem97
