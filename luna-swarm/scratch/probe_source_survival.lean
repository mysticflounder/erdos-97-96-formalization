import Erdos9796Proof.P97.ATail.CriticalPairFrontier
import Erdos9796Proof.P97.ATail.DeletionRobustness
import Erdos9796Proof.P97.ATail.MinimalUniqueFourCover

open scoped EuclideanGeometry

namespace Problem97

open ATailCriticalPairFrontier

theorem probe_cross_survival_avoids_source_shell
    {D : CounterexampleData} (H : CriticalShellSystem D.A)
    (source q w : ℝ²) (hsource : source ∈ D.A)
    (hsurvives :
      HasNEquidistantPointsAt 4 (D.A.erase q) (H.centerAt source hsource) ∨
        HasNEquidistantPointsAt 4 (D.A.erase w) (H.centerAt source hsource)) :
    q ∉ (H.selectedAt source hsource).toCriticalFourShell.support ∨
      w ∉ (H.selectedAt source hsource).toCriticalFourShell.support := by
  rcases hsurvives with hq | hw
  · exact Or.inl ((cross_deletion_survives_iff_not_mem_selected_support
      H hsource).mp hq)
  · exact Or.inr ((cross_deletion_survives_iff_not_mem_selected_support
      H hsource).mp hw)

end Problem97

namespace Problem97

theorem probe_singleton_blocked_forbids_two_radii
    {D : CounterexampleData} (H : CriticalShellSystem D.A)
    (source : ℝ²) (hsource : source ∈ D.A)
    (hblocked :
      ¬ HasNEquidistantPointsAt 4 (D.A.erase source)
        (H.centerAt source hsource)) :
    ¬ (∃ r₁ r₂ : ℝ, 0 < r₁ ∧ 0 < r₂ ∧ r₁ ≠ r₂ ∧
      4 ≤ (SelectedClass D.A (H.centerAt source hsource) r₁).card ∧
      4 ≤ (SelectedClass D.A (H.centerAt source hsource) r₂).card) := by
  classical
  have hcenterA : H.centerAt source hsource ∈ D.A :=
    (Finset.mem_erase.mp
      (H.selectedAt source hsource).toCriticalFourShell.center_mem).2
  have hnonrobust : ¬ ATailDeletionRobustness.FullyDeletionRobustAt D
      (H.centerAt source hsource) := by
    intro hrob
    exact hblocked (hrob.survives source hsource)
  have hunique : ATailMinimalUniqueFourCover.IsUniqueFourCenter D.A
      (H.centerAt source hsource) :=
    ATailMinimalUniqueFourCover.isUniqueFourCenter_of_not_fullyDeletionRobust
      hcenterA hnonrobust
  rcases hunique with ⟨_hc, r0, hr0, hcard0, huniq⟩
  rintro ⟨r1, r2, hr1, hr2, hne, h1, h2⟩
  apply hne
  exact (huniq r1 hr1 h1).trans (huniq r2 hr2 h2).symm

end Problem97

#print axioms Problem97.probe_cross_survival_avoids_source_shell
#print axioms Problem97.probe_singleton_blocked_forbids_two_radii
