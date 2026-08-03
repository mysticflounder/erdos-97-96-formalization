/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.SevenSourceCriticalShellDichotomy
import Erdos9796Proof.P97.ATail.PaleyCriticalShellAdapter

/-!
# Seven critical-shell sources force mutual omission

The seven-source counting dichotomy leaves a Paley support system as its only
alternative to a mutually omitted pair.  Reindexing the physical critical
shells by the permutation supplied by that dichotomy makes their supports
literal Paley supports, which the lifted-determinant obstruction excludes.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailSevenSourceCriticalShellMutualOmission

open SevenSourceTournament
open ATailSevenSourceCriticalShellDichotomy

/-- Any seven distinct carrier sources with their selected full critical
shells contain two sources omitted from one another's shells. -/
theorem exists_mutualOmission
    {D : CounterexampleData} (H : CriticalShellSystem D.A)
    (sources : Vertex ↪ CriticalShellSystem.CarrierVertex D.A) :
    ∃ i j : Vertex, i ≠ j ∧
      (sources j).1 ∉
        (H.selectedAt (sources i).1 (sources i).2).toCriticalFourShell.support ∧
      (sources i).1 ∉
        (H.selectedAt (sources j).1 (sources j).2).toCriticalFourShell.support := by
  rcases mutualOmission_or_exists_perm_supports_eq_paley H sources with
    hmut | ⟨σ, hσ⟩
  · exact hmut
  · exfalso
    let points : Vertex ↪ {p : ℝ² // p ∈ D.A} :=
      ⟨fun i ↦ sources (σ.symm i), by
        intro i j hij
        apply σ.symm.injective
        exact sources.injective hij⟩
    let centers : Vertex → ℝ² := fun i ↦
      H.centerAt (points i).1 (points i).2
    let K : ∀ i, CriticalFourShell D.A (points i).1 (centers i) :=
      fun i ↦ (H.selectedAt (points i).1 (points i).2).toCriticalFourShell
    apply PaleyCriticalShellAdapter.false_of_literal_paley_critical_shells
      points centers K
    intro i j
    simpa [points, K] using hσ (σ.symm i) (σ.symm j)

/-- Outside any two selected four-supports, a carrier of size at least fifteen
contains seven selected critical-shell sources and hence a mutually omitted
pair among those sources.  The witnesses retain their physical outside-support
facts; no finite named-incidence closure is assumed. -/
theorem exists_seven_sources_outside_two_supports_with_mutualOmission
    {D : CounterexampleData} (H : CriticalShellSystem D.A)
    (hcard : 15 ≤ D.A.card)
    {c₁ c₂ : ℝ²} (K₁ : SelectedFourClass D.A c₁)
    (K₂ : SelectedFourClass D.A c₂) :
    ∃ sources : Vertex ↪ CriticalShellSystem.CarrierVertex D.A,
      (∀ i, (sources i).1 ∉ K₁.support ∧ (sources i).1 ∉ K₂.support) ∧
      ∃ i j : Vertex, i ≠ j ∧
        (sources j).1 ∉
          (H.selectedAt (sources i).1
            (sources i).2).toCriticalFourShell.support ∧
        (sources i).1 ∉
          (H.selectedAt (sources j).1
            (sources j).2).toCriticalFourShell.support := by
  rcases exists_seven_sources_outside_two_selected_supports hcard K₁ K₂ with
    ⟨sources, houtside⟩
  exact ⟨sources, houtside, exists_mutualOmission H sources⟩

end ATailSevenSourceCriticalShellMutualOmission
end Problem97

#print axioms Problem97.ATailSevenSourceCriticalShellMutualOmission.exists_mutualOmission
#print axioms Problem97.ATailSevenSourceCriticalShellMutualOmission.exists_seven_sources_outside_two_supports_with_mutualOmission
