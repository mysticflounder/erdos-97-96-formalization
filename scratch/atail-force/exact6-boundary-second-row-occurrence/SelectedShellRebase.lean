/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license.
-/

import Erdos9796Proof.P97.U1CarrierInjection
import Mathlib.Util.AssertNoSorry

/-!
# Exact selected-shell rebase

This is the non-geometric part of the exact-six boundary recurrence.  A
source-indexed critical shell is critical not only for its distinguished
source: every member of its complete four-point support is deletion-critical
at the same center.  Consequently the critical-shell system may be re-chosen
simultaneously on that support.

The result is intentionally an occurrence/rebase bridge, not a terminal
claim.  Applied to the two external members of a boundary target row, it
provides a genuine selected row at either export containing the other export.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailExactSixBoundarySecondRowOccurrence

attribute [local instance] Classical.propDecidable

noncomputable section

/-- Every member of a complete selected critical shell is deletion-critical
at that shell's center.  This uses the source's retained `no_qfree` fact and
the exactness of the full selected radius class; it is not a cardinality-only
restatement of the shell. -/
theorem selectedShell_blocks_each_support_member
    {A : Finset ℝ²} (H : CriticalShellSystem A)
    {source z : ℝ²} (hsource : source ∈ A)
    (hz : z ∈ (H.selectedAt source hsource).toCriticalFourShell.support) :
    ¬ HasNEquidistantPointsAt 4 (A.erase z) (H.centerAt source hsource) := by
  intro hsurvives
  rcases hsurvives with ⟨radius, hradius, hcard⟩
  let carrier := (A.erase z).filter fun x ↦ dist (H.centerAt source hsource) x = radius
  obtain ⟨U, hUsub, hUcard⟩ := Finset.exists_subset_card_eq hcard
  let selected : SelectedFourClass A (H.centerAt source hsource) := {
    support := U
    support_subset_A := by
      intro x hx
      exact Finset.mem_of_mem_erase (Finset.mem_filter.mp (hUsub hx)).1
    support_card := hUcard
    radius := radius
    radius_pos := hradius
    support_eq_radius := by
      intro x hx
      exact (Finset.mem_filter.mp (hUsub hx)).2
    center_not_mem := by
      intro hcenter
      have hdist := (Finset.mem_filter.mp (hUsub hcenter)).2
      have : (0 : ℝ) = radius := by simpa using hdist
      linarith }
  have hsupport : selected.support =
      (H.selectedAt source hsource).toCriticalFourShell.support :=
    H.selectedFourClass_support_eq_shell source hsource selected
  have hzSelected : z ∈ selected.support := by
    rw [hsupport]
    exact hz
  have hzErase : z ∈ A.erase z :=
    (Finset.mem_filter.mp (hUsub hzSelected)).1
  exact (Finset.mem_erase.mp hzErase).1 rfl

/-- Regard the full shell selected at `source` as a critical shell for any one
of its support points.  Together with
`selectedShell_blocks_each_support_member`, this is a genuine second-row
occurrence: deleting that new source is blocked at the same center. -/
def criticalFourShellAtSelectedSupportMember
    {A : Finset ℝ²} (H : CriticalShellSystem A)
    {source z : ℝ²} (hsource : source ∈ A)
    (hz : z ∈ (H.selectedAt source hsource).toCriticalFourShell.support) :
    CriticalFourShell A z (H.centerAt source hsource) :=
  let K := (H.selectedAt source hsource).toCriticalFourShell
  { center_mem := by
      refine Finset.mem_erase.mpr ⟨?_, (Finset.mem_erase.mp K.center_mem).2⟩
      intro hcenter
      apply K.center_not_mem_support
      simpa [hcenter] using hz
    radius := K.radius
    radius_pos := K.radius_pos
    support := K.support
    support_eq := K.support_eq
    support_card := K.support_card
    q_mem_support := hz }

/-- The exported point is genuinely blocked at the second center, rather than
merely lying on a selected shell at another source. -/
theorem criticalFourShellAtSelectedSupportMember_blocks
    {A : Finset ℝ²} (H : CriticalShellSystem A)
    {source z : ℝ²} (hsource : source ∈ A)
    (hz : z ∈ (H.selectedAt source hsource).toCriticalFourShell.support) :
    ¬ HasNEquidistantPointsAt 4 (A.erase z) (H.centerAt source hsource) :=
  selectedShell_blocks_each_support_member H hsource hz

/-- A second exported point occurs in the genuine critical row at the first
export.  This contains no cap, MEC, or localization hypothesis. -/
theorem mem_criticalFourShellAtSelectedSupportMember
    {A : Finset ℝ²} (H : CriticalShellSystem A)
    {source z w : ℝ²} (hsource : source ∈ A)
    (hz : z ∈ (H.selectedAt source hsource).toCriticalFourShell.support)
    (hw : w ∈ (H.selectedAt source hsource).toCriticalFourShell.support) :
    w ∈ (criticalFourShellAtSelectedSupportMember H hsource hz).support := by
  exact hw

/-- Rechoose a critical-shell system on the complete shell selected at one
source. -/
noncomputable def rebaseAtSelectedShell
    {A : Finset ℝ²} (H : CriticalShellSystem A)
    {source : ℝ²} (hsource : source ∈ A) : CriticalShellSystem A :=
  H.overrideExactSelectedClass
    ((H.selectedAt source hsource).toCriticalFourShell.center_mem |> Finset.mem_erase.mp |>.2)
    (H.selectedAt source hsource).toCriticalFourShell.radius_pos
    (by simpa [(H.selectedAt source hsource).toCriticalFourShell.support_eq] using
      (H.selectedAt source hsource).toCriticalFourShell.support_card)
    (fun z hz ↦ by
      have hz' : z ∈ (H.selectedAt source hsource).toCriticalFourShell.support := by
        rw [(H.selectedAt source hsource).toCriticalFourShell.support_eq]
        exact hz
      exact selectedShell_blocks_each_support_member H hsource hz')

/-- After the rebase, any two members of the original selected shell occur
in one another's selected rows. -/
theorem mem_rebaseAtSelectedShell_selectedAt
    {A : Finset ℝ²} (H : CriticalShellSystem A)
    {source z w : ℝ²} (hsource : source ∈ A)
    (hz : z ∈ (H.selectedAt source hsource).toCriticalFourShell.support)
    (hw : w ∈ (H.selectedAt source hsource).toCriticalFourShell.support) :
    w ∈ ((rebaseAtSelectedShell H hsource).selectedAt z
      ((H.selectedAt source hsource).toCriticalFourShell.support_subset_A hz)).toCriticalFourShell.support := by
  let C := (H.selectedAt source hsource).toCriticalFourShell
  let H' := rebaseAtSelectedShell H hsource
  have hcenter : H'.centerAt z (C.support_subset_A hz) = H.centerAt source hsource := by
    apply CriticalShellSystem.overrideExactSelectedClass_centerAt
    simpa [C, C.support_eq] using hz
  have hrow_eq :
      ((H'.selectedAt z (C.support_subset_A hz)).toCriticalFourShell.support) = C.support := by
    apply Finset.eq_of_subset_of_card_le
    · intro x hx
      have hxRadius : H'.centerAt z (C.support_subset_A hz) |> fun center ↦ dist center x =
          (H'.selectedAt z (C.support_subset_A hz)).toCriticalFourShell.radius :=
        (H'.selectedAt z (C.support_subset_A hz)).toCriticalFourShell.support_eq_radius x hx
      have hzRadius : H'.centerAt z (C.support_subset_A hz) |> fun center ↦ dist center z =
          (H'.selectedAt z (C.support_subset_A hz)).toCriticalFourShell.radius :=
        (H'.selectedAt z (C.support_subset_A hz)).toCriticalFourShell.support_eq_radius z
          (H'.selectedAt z (C.support_subset_A hz)).toCriticalFourShell.q_mem_support
      have zC : dist (H.centerAt source hsource) z = C.radius := C.support_eq_radius z hz
      have xC : dist (H.centerAt source hsource) x = C.radius := by
        rw [← zC, ← hcenter]
        exact hxRadius.trans hzRadius.symm
      exact C.off_row_named_label_forbidden
        ((H'.selectedAt z (C.support_subset_A hz)).toCriticalFourShell.support_subset_A hx) xC
    · rw [(H'.selectedAt z (C.support_subset_A hz)).toCriticalFourShell.support_card,
      C.support_card]
  rw [hrow_eq]
  exact hw

/-- Two points exported from one exact selected row yield a valid global
critical-shell choice in which the first export has a selected row through the
second, at the original row's center.  This is the source-indexed occurrence
available without cap/MEC localization. -/
theorem exists_selectedSecondRowOccurrence_of_two_mem_selectedRow
    {A : Finset ℝ²} (H : CriticalShellSystem A)
    {source z w : ℝ²} (hsource : source ∈ A)
    (hz : z ∈ (H.selectedAt source hsource).toCriticalFourShell.support)
    (hw : w ∈ (H.selectedAt source hsource).toCriticalFourShell.support) :
    ∃ H' : CriticalShellSystem A,
      H'.centerAt z ((H.selectedAt source hsource).toCriticalFourShell.support_subset_A hz) =
        H.centerAt source hsource ∧
      w ∈ (H'.selectedAt z
        ((H.selectedAt source hsource).toCriticalFourShell.support_subset_A hz)).toCriticalFourShell.support := by
  let H' := rebaseAtSelectedShell H hsource
  refine ⟨H', ?_, mem_rebaseAtSelectedShell_selectedAt H hsource hz hw⟩
  apply CriticalShellSystem.overrideExactSelectedClass_centerAt
  simpa [H', rebaseAtSelectedShell,
    (H.selectedAt source hsource).toCriticalFourShell.support_eq] using hz

assert_no_sorry selectedShell_blocks_each_support_member
assert_no_sorry criticalFourShellAtSelectedSupportMember_blocks
assert_no_sorry mem_criticalFourShellAtSelectedSupportMember
assert_no_sorry mem_rebaseAtSelectedShell_selectedAt
assert_no_sorry exists_selectedSecondRowOccurrence_of_two_mem_selectedRow

#print axioms selectedShell_blocks_each_support_member
#print axioms criticalFourShellAtSelectedSupportMember_blocks
#print axioms mem_criticalFourShellAtSelectedSupportMember
#print axioms mem_rebaseAtSelectedShell_selectedAt
#print axioms exists_selectedSecondRowOccurrence_of_two_mem_selectedRow

end

end ATailExactSixBoundarySecondRowOccurrence
end Problem97
