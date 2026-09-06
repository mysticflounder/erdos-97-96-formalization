import Erdos9796Proof.P97.ATail.CriticalPairFrontier

/-!
# One-hit critical-shell reselection

A source whose actual critical shell contains `retained` can supply the
chosen blocker for `retained`. The override preserves every other source's
blocker and the complete critical support. This is a source transition
prototype, not a contradiction or a decreasing-measure theorem.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ExactFiveOneHitShellReselection

open ATailCriticalPairFrontier

/-- Rechoose one endpoint's blocker from a critical shell containing it,
preserving all other chosen centers and the entire critical support. -/
theorem exists_reselection_of_mem_support
    {A : Finset ℝ²} (H : CriticalShellSystem A)
    {fresh retained : ℝ²} (hfresh : fresh ∈ A)
    (hretained : retained ∈ A)
    (hhit : retained ∈ (H.selectedAt fresh hfresh).toCriticalFourShell.support) :
    ∃ H' : CriticalShellSystem A,
      H'.centerAt retained hretained = H.centerAt fresh hfresh ∧
      (∀ z : ℝ², ∀ hz : z ∈ A, z ≠ retained →
        H'.centerAt z hz = H.centerAt z hz) ∧
      (H'.selectedAt retained hretained).toCriticalFourShell.support =
        (H.selectedAt fresh hfresh).toCriticalFourShell.support := by
  classical
  let K := (H.selectedAt fresh hfresh).toCriticalFourShell
  have hclass : SelectedClass A (H.centerAt fresh hfresh) K.radius = K.support := by
    simpa [SelectedClass] using K.support_eq.symm
  obtain ⟨C⟩ := CriticalSelectedFourClass.exists_of_exactSelectedClass
    (Finset.mem_erase.mp K.center_mem).2 K.radius_pos
    (by rw [hclass]; exact K.support_card)
    (by rw [hclass]; exact hhit)
  have hblocked : ¬ HasNEquidistantPointsAt 4
      (A.erase retained) (H.centerAt fresh hfresh) := by
    intro hsurvives
    exact ((cross_deletion_survives_iff_not_mem_selected_support H hfresh).mp
      hsurvives) hhit
  let H' := H.overrideAt C hblocked
  refine ⟨H', H.overrideAt_centerAt C hblocked hretained, ?_, ?_⟩
  · intro z hz hne
    exact H.overrideAt_centerAt_of_ne C hblocked hz hne
  · have hsupport := H.selectedFourClass_support_eq_shell fresh hfresh
      C.toSelectedFourClass
    have hshell : H'.shellAt retained hretained =
        ⟨H.centerAt fresh hfresh, C⟩ := by
      simp [H', CriticalShellSystem.overrideAt]
    have hsame := congrArg
      (fun s : Sigma fun c : ℝ² => CriticalSelectedFourClass A retained c =>
        s.2.toCriticalFourShell.support) hshell
    exact hsame.trans hsupport

/-- A one-hit shell permits a blocker reselection with distinct endpoint
centers. The omitted endpoint's chosen center is preserved. -/
theorem exists_reselection_of_one_hit
    {A : Finset ℝ²} (H : CriticalShellSystem A)
    {fresh omitted retained : ℝ²} (hfresh : fresh ∈ A)
    (homitted : omitted ∈ A) (hretained : retained ∈ A)
    (hmiss : omitted ∉ (H.selectedAt fresh hfresh).toCriticalFourShell.support)
    (hhit : retained ∈ (H.selectedAt fresh hfresh).toCriticalFourShell.support) :
    ∃ H' : CriticalShellSystem A,
      H'.centerAt retained hretained = H.centerAt fresh hfresh ∧
      H'.centerAt omitted homitted = H.centerAt omitted homitted ∧
      H'.centerAt omitted homitted ≠ H'.centerAt retained hretained ∧
      (H'.selectedAt retained hretained).toCriticalFourShell.support =
        (H.selectedAt fresh hfresh).toCriticalFourShell.support := by
  obtain ⟨H', hretainedCenter, hother, hsupport⟩ :=
    exists_reselection_of_mem_support H hfresh hretained hhit
  have hne : omitted ≠ retained := by
    intro h
    exact hmiss (h ▸ hhit)
  have hsurvives : HasNEquidistantPointsAt 4
      (A.erase omitted) (H.centerAt fresh hfresh) :=
    (cross_deletion_survives_iff_not_mem_selected_support H hfresh).mpr hmiss
  have hcenters : H.centerAt omitted homitted ≠ H.centerAt fresh hfresh := by
    intro h
    exact H.no_qfree_at omitted homitted (h.symm ▸ hsurvives)
  refine ⟨H', hretainedCenter, hother omitted homitted hne, ?_, hsupport⟩
  simpa only [hother omitted homitted hne, hretainedCenter] using hcenters

end ExactFiveOneHitShellReselection
end Problem97
