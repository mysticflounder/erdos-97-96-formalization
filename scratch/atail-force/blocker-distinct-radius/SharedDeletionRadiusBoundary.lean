/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import CriticalShellRadiusConsumer
import CapFiveApexRigidity
import PrescribedDeletionEdge

/-!
# Shared deletion/radius boundary for aligned ATAIL blockers

For an exact critical shell, the following are the same additional datum:

* K4 survives deletion of the shell source;
* a selected four-row at the shell center omits that source;
* a positive four-capable radius differs from the shell radius; and
* a selected four-row at the shell center has support different from the
  exact shell.

This equivalence is shared by the deleted-apex alignment and by all four
aligned reverse-mixed arms.  It is a producer boundary, not a production
theorem: when the deletion is certified to block K4, every selected row at
the center collapses to the exact shell.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailBlockerDistinctRadiusScratch

open ATailApexAlignmentConsumerScratch
open ATailCrossSurvivalEliminatorScratch
open ATailDeletedApexOmissionProducerScratch
open ATailFullGeometryProducerScratch
open ATailGlobalSourceSelectionScratch
open ATailJointTransitionCoreScratch
open ATailPrescribedDeletionEdge
open ATailReverseMixedRadiusConsumerScratch
open ATailReverseMixedResidualReductionScratch
open ATailThirdRowProfileBankScratch

attribute [local instance] Classical.propDecidable

/-- Lift a selected row on an erased carrier to the ambient carrier.  Its
support necessarily omits the erased source. -/
private def ambientOmissionRowOfErasedRow
    {A : Finset ℝ²} {source center : ℝ²}
    (K : SelectedFourClass (A.erase source) center) :
    SelectedFourClass A center :=
  { support := K.support
    support_subset_A := by
      intro z hz
      exact Finset.mem_of_mem_erase (K.support_subset_A hz)
    support_card := K.support_card
    radius := K.radius
    radius_pos := K.radius_pos
    support_eq_radius := K.support_eq_radius
    center_not_mem := K.center_not_mem }

private theorem source_not_mem_ambientOmissionRowOfErasedRow
    {A : Finset ℝ²} {source center : ℝ²}
    (K : SelectedFourClass (A.erase source) center) :
    source ∉ (ambientOmissionRowOfErasedRow K).support := by
  intro hsource
  exact (Finset.mem_erase.mp (K.support_subset_A hsource)).1 rfl

/-- Any surviving K4 witness can be trimmed on the erased carrier and lifted
to an ambient selected row which omits the erased source. -/
theorem nonempty_criticalShellOmissionRow_of_deletionSurvives
    {A : Finset ℝ²} {source center : ℝ²}
    {C : CriticalSelectedFourClass A source center}
    (survives : HasNEquidistantPointsAt 4 (A.erase source) center) :
    Nonempty (CriticalShellOmissionRow C) := by
  rcases exists_selectedClass_card_ge_of_hasNEquidistantPointsAt survives with
    ⟨radius, hradius, hfour⟩
  rcases exists_selectedFourClass_at_radius_of_four_le_selectedClass
      (A := A.erase source) hradius hfour with ⟨K, _hKradius⟩
  exact ⟨
    { row := ambientOmissionRowOfErasedRow K
      source_not_mem :=
        source_not_mem_ambientOmissionRowOfErasedRow K }⟩

/-- Exact generic equivalence between deletion survival and an ambient
selected row omitting the deleted source. -/
theorem deletionSurvives_iff_criticalShellOmission
    {A : Finset ℝ²} {source center : ℝ²}
    (C : CriticalSelectedFourClass A source center) :
    HasNEquidistantPointsAt 4 (A.erase source) center ↔
      Nonempty (CriticalShellOmissionRow C) := by
  constructor
  · exact nonempty_criticalShellOmissionRow_of_deletionSurvives
  · rintro ⟨P⟩
    exact deletion_survives_of_not_mem_selected_support
      P.row P.source_not_mem

/-- Exact generic equivalence between deletion survival and a second positive
K4-capable radius at the critical center. -/
theorem deletionSurvives_iff_criticalShellDistinctRadius
    {A : Finset ℝ²} {source center : ℝ²}
    (C : CriticalSelectedFourClass A source center) :
    HasNEquidistantPointsAt 4 (A.erase source) center ↔
      Nonempty (CriticalShellDistinctRadiusClass C) :=
  (deletionSurvives_iff_criticalShellOmission C).trans
    (criticalShellOmission_iff_distinctRadiusClass C)

/-- A selected row containing the critical source is forced onto the exact
critical support. -/
private theorem selectedFourClass_support_eq_shell_of_source_mem
    {A : Finset ℝ²} {source center : ℝ²}
    (C : CriticalSelectedFourClass A source center)
    (K : SelectedFourClass A center)
    (hsource : source ∈ K.support) :
    K.support = C.toCriticalFourShell.support := by
  have hradius : K.radius = C.toCriticalFourShell.radius := by
    calc
      K.radius = dist center source :=
        (K.support_eq_radius source hsource).symm
      _ = C.toCriticalFourShell.radius :=
        C.toCriticalFourShell.support_eq_radius source
          C.toCriticalFourShell.q_mem_support
  apply Finset.eq_of_subset_of_card_le
  · intro z hz
    exact C.toCriticalFourShell.off_row_named_label_forbidden
      (K.support_subset_A hz)
      ((K.support_eq_radius z hz).trans hradius)
  · rw [K.support_card, C.toCriticalFourShell.support_card]

/-- A selected support different from the exact shell is equivalent to
omitting the critical source. -/
theorem support_ne_shell_iff_source_not_mem
    {A : Finset ℝ²} {source center : ℝ²}
    (C : CriticalSelectedFourClass A source center)
    (K : SelectedFourClass A center) :
    K.support ≠ C.toCriticalFourShell.support ↔
      source ∉ K.support := by
  constructor
  · intro hne hsource
    exact hne (selectedFourClass_support_eq_shell_of_source_mem C K hsource)
  · intro hsource heq
    apply hsource
    rw [heq]
    exact C.toCriticalFourShell.q_mem_support

/-- A third equivalent producer interface: global K4 must supply a row whose
support genuinely differs from the exact shell, not merely another choice of
the same row. -/
theorem deletionSurvives_iff_exists_selectedSupport_ne_shell
    {A : Finset ℝ²} {source center : ℝ²}
    (C : CriticalSelectedFourClass A source center) :
    HasNEquidistantPointsAt 4 (A.erase source) center ↔
      ∃ K : SelectedFourClass A center,
        K.support ≠ C.toCriticalFourShell.support := by
  constructor
  · intro survives
    rcases nonempty_criticalShellOmissionRow_of_deletionSurvives
        (C := C) survives with ⟨P⟩
    exact ⟨P.row,
      (support_ne_shell_iff_source_not_mem C P.row).2
        P.source_not_mem⟩
  · rintro ⟨K, hne⟩
    exact deletion_survives_of_not_mem_selected_support K
      ((support_ne_shell_iff_source_not_mem C K).1 hne)

/-- Under a deletion-blocking certificate, every selected row at the center
is the exact critical support.  Thus arbitrary global-K4 selection cannot by
itself manufacture the missing producer. -/
theorem selectedFourClass_support_eq_shell_of_blocked
    {A : Finset ℝ²} {source center : ℝ²}
    (C : CriticalSelectedFourClass A source center)
    (blocked : ¬ HasNEquidistantPointsAt 4 (A.erase source) center)
    (K : SelectedFourClass A center) :
    K.support = C.toCriticalFourShell.support := by
  have hsource : source ∈ K.support := by
    by_contra hnot
    exact blocked
      (deletion_survives_of_not_mem_selected_support K hnot)
  exact selectedFourClass_support_eq_shell_of_source_mem C K hsource

/-- Cross-apex specialization: deletion survival is exactly the existing
`DeletedApexOmissionPacket`. -/
theorem deletedApexSurvives_iff_omissionPacket
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {O : CrossSurvivalApexPacket D S H}
    (C : DeletedApexCriticalCertificate O) :
    HasNEquidistantPointsAt 4
        (D.A.erase O.survivor.deleted) S.oppApex2 ↔
      Nonempty (DeletedApexOmissionPacket O) := by
  constructor
  · intro survives
    rcases nonempty_criticalShellOmissionRow_of_deletionSurvives
        (C := C.shell) survives with ⟨P⟩
    exact ⟨{ row := P.row, deleted_not_mem := P.source_not_mem }⟩
  · rintro ⟨P⟩
    exact deletion_survives_of_not_mem_selected_support
      P.row P.deleted_not_mem

/-- The cross-apex producer has exactly three interchangeable presentations:
survival, omission, and a distinct positive four-capable apex radius. -/
theorem deletedApexSurvives_iff_distinctApexRadiusClass
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {O : CrossSurvivalApexPacket D S H}
    (C : DeletedApexCriticalCertificate O) :
    HasNEquidistantPointsAt 4
        (D.A.erase O.survivor.deleted) S.oppApex2 ↔
      Nonempty (DistinctApexRadiusClass O) :=
  (deletedApexSurvives_iff_omissionPacket C).trans
    (deletedApexOmission_iff_distinctApexRadiusClass C)

/-- A positive K4-capable radius distinct from one retained selected row. -/
structure DistinctSelectedRowRadiusClass
    {A : Finset ℝ²} {center : ℝ²}
    (K : SelectedFourClass A center) where
  radius : ℝ
  radius_pos : 0 < radius
  card_ge_four : 4 ≤ (SelectedClass A center radius).card
  radius_ne_row : radius ≠ K.radius

/-- If a retained row is the exact critical support, its radius and the
critical-shell radius agree. -/
private theorem selectedRow_radius_eq_shell_of_support_eq
    {A : Finset ℝ²} {source center : ℝ²}
    (C : CriticalSelectedFourClass A source center)
    (K : SelectedFourClass A center)
    (hsupport : C.toCriticalFourShell.support = K.support) :
    K.radius = C.toCriticalFourShell.radius := by
  have hsource : source ∈ K.support := by
    rw [← hsupport]
    exact C.toCriticalFourShell.q_mem_support
  exact (K.support_eq_radius source hsource).symm.trans
    (C.toCriticalFourShell.support_eq_radius source
      C.toCriticalFourShell.q_mem_support)

/-- Radius-level transport from an exact critical shell to a retained row
with the same support. -/
theorem criticalDistinctRadius_iff_selectedRowDistinctRadius
    {A : Finset ℝ²} {source center : ℝ²}
    (C : CriticalSelectedFourClass A source center)
    (K : SelectedFourClass A center)
    (hsupport : C.toCriticalFourShell.support = K.support) :
    Nonempty (CriticalShellDistinctRadiusClass C) ↔
      Nonempty (DistinctSelectedRowRadiusClass K) := by
  have hradius := selectedRow_radius_eq_shell_of_support_eq C K hsupport
  constructor
  · rintro ⟨W⟩
    exact ⟨
      { radius := W.radius
        radius_pos := W.radius_pos
        card_ge_four := W.card_ge_four
        radius_ne_row := by
          intro h
          exact W.radius_ne_shell (h.trans hradius) }⟩
  · rintro ⟨W⟩
    exact ⟨
      { radius := W.radius
        radius_pos := W.radius_pos
        card_ge_four := W.card_ge_four
        radius_ne_shell := by
          intro h
          exact W.radius_ne_row (h.trans hradius.symm) }⟩

/-- The role-specific radius producer for the four aligned reverse-mixed
arms.  The equality records which existing row is the exact critical row. -/
def ReverseMixedAlignedDistinctRadiusProducer
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {x y u v center : ℝ²}
    (P : EquilateralRows D.A x y S.oppApex2)
    (Ku : SelectedFourClass D.A u)
    (Kv : SelectedFourClass D.A v) : Prop :=
  (center = x ∧
      Nonempty (DistinctSelectedRowRadiusClass P.rowX)) ∨
    (center = u ∧
      Nonempty (DistinctSelectedRowRadiusClass Ku)) ∨
    (center = y ∧
      Nonempty (DistinctSelectedRowRadiusClass P.rowY)) ∨
    (center = v ∧
      Nonempty (DistinctSelectedRowRadiusClass Kv))

/-- In every aligned reverse-mixed arm, deletion survival is exactly a
distinct four-capable radius relative to that arm's retained row. -/
theorem reverseMixedAligned_survives_iff_roleDistinctRadius
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {x y u v center : ℝ²}
    (P : EquilateralRows D.A x y S.oppApex2)
    (Ku : SelectedFourClass D.A u)
    (Kv : SelectedFourClass D.A v)
    (haKu : S.oppApex2 ∈ Ku.support)
    (haKv : S.oppApex2 ∈ Kv.support)
    (C : CriticalSelectedFourClass D.A S.oppApex2 center)
    (aligned : AlignedKnownRowResidual P Ku Kv C) :
    HasNEquidistantPointsAt 4
        (D.A.erase S.oppApex2) center ↔
      ReverseMixedAlignedDistinctRadiusProducer
        (center := center) P Ku Kv := by
  have hgeneric := deletionSurvives_iff_criticalShellDistinctRadius C
  constructor
  · intro survives
    have hdistinct := hgeneric.mp survives
    rcases aligned with ⟨hcenter, hsupport⟩ |
        ⟨hcenter, hsupport⟩ |
        ⟨hcenter, hsupport⟩ |
        ⟨hcenter, hsupport⟩
    · subst center
      exact Or.inl ⟨rfl,
        (criticalDistinctRadius_iff_selectedRowDistinctRadius
          C P.rowX hsupport).mp hdistinct⟩
    · subst center
      exact Or.inr (Or.inl ⟨rfl,
        (criticalDistinctRadius_iff_selectedRowDistinctRadius
          C Ku hsupport).mp hdistinct⟩)
    · subst center
      exact Or.inr (Or.inr (Or.inl ⟨rfl,
        (criticalDistinctRadius_iff_selectedRowDistinctRadius
          C P.rowY hsupport).mp hdistinct⟩))
    · subst center
      exact Or.inr (Or.inr (Or.inr ⟨rfl,
        (criticalDistinctRadius_iff_selectedRowDistinctRadius
          C Kv hsupport).mp hdistinct⟩))
  · intro producer
    apply hgeneric.mpr
    rcases producer with ⟨hcenter, hdistinct⟩ |
        ⟨hcenter, hdistinct⟩ |
        ⟨hcenter, hdistinct⟩ |
        ⟨hcenter, hdistinct⟩
    · subst center
      have hsupport : C.toCriticalFourShell.support = P.rowX.support :=
        (selectedFourClass_support_eq_shell_of_source_mem
          C P.rowX P.a_mem_rowX).symm
      exact (criticalDistinctRadius_iff_selectedRowDistinctRadius
        C P.rowX hsupport).mpr hdistinct
    · subst center
      have hsupport : C.toCriticalFourShell.support = Ku.support :=
        (selectedFourClass_support_eq_shell_of_source_mem
          C Ku haKu).symm
      exact (criticalDistinctRadius_iff_selectedRowDistinctRadius
        C Ku hsupport).mpr hdistinct
    · subst center
      have hsupport : C.toCriticalFourShell.support = P.rowY.support :=
        (selectedFourClass_support_eq_shell_of_source_mem
          C P.rowY P.a_mem_rowY).symm
      exact (criticalDistinctRadius_iff_selectedRowDistinctRadius
        C P.rowY hsupport).mpr hdistinct
    · subst center
      have hsupport : C.toCriticalFourShell.support = Kv.support :=
        (selectedFourClass_support_eq_shell_of_source_mem
          C Kv haKv).symm
      exact (criticalDistinctRadius_iff_selectedRowDistinctRadius
        C Kv hsupport).mpr hdistinct

/-- Under the blocked aligned certificate, an arbitrary global-K4 row at the
selected blocker has exactly the already-retained support in the active arm.
This is the precise role gap left after applying global K4. -/
theorem reverseMixedAligned_selectedRow_collapses
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {x y u v center : ℝ²}
    (P : EquilateralRows D.A x y S.oppApex2)
    (Ku : SelectedFourClass D.A u)
    (Kv : SelectedFourClass D.A v)
    (C : CriticalSelectedFourClass D.A S.oppApex2 center)
    (blocked :
      ¬ HasNEquidistantPointsAt 4
        (D.A.erase S.oppApex2) center)
    (aligned : AlignedKnownRowResidual P Ku Kv C)
    (K : SelectedFourClass D.A center) :
    (center = x ∧ K.support = P.rowX.support) ∨
      (center = u ∧ K.support = Ku.support) ∨
      (center = y ∧ K.support = P.rowY.support) ∨
      (center = v ∧ K.support = Kv.support) := by
  have hK := selectedFourClass_support_eq_shell_of_blocked C blocked K
  rcases aligned with ⟨hcenter, hsupport⟩ |
      ⟨hcenter, hsupport⟩ |
      ⟨hcenter, hsupport⟩ |
      ⟨hcenter, hsupport⟩
  · exact Or.inl ⟨hcenter, hK.trans hsupport⟩
  · exact Or.inr (Or.inl ⟨hcenter, hK.trans hsupport⟩)
  · exact Or.inr (Or.inr (Or.inl
      ⟨hcenter, hK.trans hsupport⟩))
  · exact Or.inr (Or.inr (Or.inr
      ⟨hcenter, hK.trans hsupport⟩))

/-- The exact role identification needed before the cap-five Moser-apex
rigidity bank can say anything about a selected blocker.  The current
full-parent second-large-cap theorem supplies an index and a lower cardinality
bound, but does not identify a reverse-mixed blocker with the opposite vertex
of that cap (nor, in general cardinality, refine the cap size to five). -/
structure CapFiveOppositeApexBlockerRole
    {D : CounterexampleData} (S : SurplusCapPacket D.A)
    (center : ℝ²) where
  capIndex : Fin 3
  capIndex_ne_surplus : capIndex ≠ S.surplusIdx
  cap_card_eq_five : (S.capByIndex capIndex).card = 5
  center_eq_oppositeVertex :
    center = S.oppositeVertexByIndex capIndex

/-- Once the exact blocker role is supplied, the cap-five class-cardinality
bound transports to that blocker without any further geometric work. -/
theorem selectedClass_card_le_five_of_capFiveBlockerRole
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {center : ℝ²}
    (R : CapFiveOppositeApexBlockerRole S center)
    {radius : ℝ} (hradius : 0 < radius) :
    (SelectedClass D.A center radius).card ≤ 5 := by
  rw [R.center_eq_oppositeVertex]
  exact oppositeVertex_selectedClass_card_le_five_of_cap_card_eq_five
    S D.convex R.capIndex R.cap_card_eq_five hradius

/-- The stronger cap-five radius-rigidity theorem likewise becomes directly
applicable after the same role identification. -/
theorem K4_radius_unique_of_capFiveBlockerRole
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {center : ℝ²}
    (R : CapFiveOppositeApexBlockerRole S center)
    {radius rho : ℝ}
    (hradius : 0 < radius) (hrho : 0 < rho)
    (hradiusFour : 4 ≤ (SelectedClass D.A center radius).card)
    (hrhoFour : 4 ≤ (SelectedClass D.A center rho).card) :
    radius = rho := by
  have hradiusFour' :
      4 ≤ (SelectedClass D.A
        (S.oppositeVertexByIndex R.capIndex) radius).card := by
    simpa only [R.center_eq_oppositeVertex] using hradiusFour
  have hrhoFour' :
      4 ≤ (SelectedClass D.A
        (S.oppositeVertexByIndex R.capIndex) rho).card := by
    simpa only [R.center_eq_oppositeVertex] using hrhoFour
  exact oppositeVertex_K4_radius_unique_of_cap_card_eq_five
    S D.convex R.capIndex R.cap_card_eq_five
      hradius hrho hradiusFour' hrhoFour'

#print axioms deletionSurvives_iff_criticalShellOmission
#print axioms deletionSurvives_iff_criticalShellDistinctRadius
#print axioms deletionSurvives_iff_exists_selectedSupport_ne_shell
#print axioms selectedFourClass_support_eq_shell_of_blocked
#print axioms deletedApexSurvives_iff_omissionPacket
#print axioms deletedApexSurvives_iff_distinctApexRadiusClass
#print axioms criticalDistinctRadius_iff_selectedRowDistinctRadius
#print axioms reverseMixedAligned_survives_iff_roleDistinctRadius
#print axioms reverseMixedAligned_selectedRow_collapses
#print axioms selectedClass_card_le_five_of_capFiveBlockerRole
#print axioms K4_radius_unique_of_capFiveBlockerRole

end ATailBlockerDistinctRadiusScratch
end Problem97
