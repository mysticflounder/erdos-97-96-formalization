/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.MinimalUniqueFourCover
import Erdos9796Proof.P97.ATail.SevenSourceTournament
import Erdos9796Proof.P97.ATail.SevenSourcesOutsideTwoShells

/-!
# Seven critical-shell sources: mutual omission or Paley

Seven distinct carrier sources each lie on their own full critical four-shell.
If some pair misses one another's shells, we expose that mutual omission.  If
not, the 21 directed pair slots exactly saturate the seven four-point shells,
and the resulting support system is the Paley tournament after relabeling.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailSevenSourceCriticalShellDichotomy

open SevenSourceTournament

/-- The indices among seven named sources that lie on the full critical shell
selected for source `i`. -/
noncomputable def indexedCriticalSupport
    {D : CounterexampleData} (H : CriticalShellSystem D.A)
    (sources : Vertex ↪ CriticalShellSystem.CarrierVertex D.A)
    (i : Vertex) : Finset Vertex :=
  Finset.univ.filter fun j ↦
    (sources j).1 ∈
      (H.selectedAt (sources i).1 (sources i).2).toCriticalFourShell.support

/-- Seven distinct critical-shell sources either contain a mutually omitted
pair or induce the Paley four-support system after relabeling. -/
theorem mutualOmission_or_exists_perm_supports_eq_paley
    {D : CounterexampleData} (H : CriticalShellSystem D.A)
    (sources : Vertex ↪ CriticalShellSystem.CarrierVertex D.A) :
    (∃ i j : Vertex, i ≠ j ∧
      (sources j).1 ∉
        (H.selectedAt (sources i).1 (sources i).2).toCriticalFourShell.support ∧
      (sources i).1 ∉
        (H.selectedAt (sources j).1 (sources j).2).toCriticalFourShell.support) ∨
    ∃ σ : Equiv.Perm Vertex,
      ∀ i j,
        (sources j).1 ∈
            (H.selectedAt (sources i).1
              (sources i).2).toCriticalFourShell.support ↔
          σ j ∈ ({σ i, σ i + 1, σ i + 2, σ i + 4} : Finset Vertex) := by
  classical
  let B : Vertex → Finset Vertex := indexedCriticalSupport H sources
  by_cases hmut : ∃ i j : Vertex, i ≠ j ∧
      (sources j).1 ∉
        (H.selectedAt (sources i).1 (sources i).2).toCriticalFourShell.support ∧
      (sources i).1 ∉
        (H.selectedAt (sources j).1 (sources j).2).toCriticalFourShell.support
  · exact Or.inl hmut
  · right
    have hsourcePoint_inj : Function.Injective (fun i : Vertex ↦ (sources i).1) := by
      intro i j hij
      apply sources.injective
      exact Subtype.ext hij
    have hcard : ∀ i, (B i).card ≤ 4 := by
      intro i
      let K := (H.selectedAt (sources i).1
        (sources i).2).toCriticalFourShell
      calc
        (B i).card ≤ K.support.card := by
          apply Finset.card_le_card_of_injOn (fun j : Vertex ↦ (sources j).1)
          · intro j hj
            simpa [B, indexedCriticalSupport, K] using hj
          · intro j _ k _ hjk
            exact hsourcePoint_inj hjk
        _ = 4 := K.support_card
    have hself : ∀ i, i ∈ B i := by
      intro i
      simpa [B, indexedCriticalSupport] using
        (H.selectedAt (sources i).1
          (sources i).2).toCriticalFourShell.q_mem_support
    have hcover : ∀ i j, i ≠ j → j ∈ B i ∨ i ∈ B j := by
      intro i j hij
      by_cases hji : (sources j).1 ∈
          (H.selectedAt (sources i).1
            (sources i).2).toCriticalFourShell.support
      · left
        simpa [B, indexedCriticalSupport] using hji
      · right
        by_contra hij'
        apply hmut
        refine ⟨i, j, hij, hji, ?_⟩
        simpa [B, indexedCriticalSupport] using hij'
    rcases exact_support_surface_of_card_le_four_and_pairCovered
        B hcard hself hcover with ⟨hcardEq, hone⟩
    have hcenters : ∀ i j, i ≠ j →
        H.centerAt (sources i).1 (sources i).2 ≠
          H.centerAt (sources j).1 (sources j).2 := by
      intro i j hij hcenter
      let Ki := (H.selectedAt (sources i).1
        (sources i).2).toCriticalFourShell
      let Kj := (H.selectedAt (sources j).1
        (sources j).2).toCriticalFourShell
      have hsupports : Ki.support = Kj.support := by
        change
          (H.selectedAt (sources i).1
              (sources i).2).toCriticalFourShell.support =
            (H.selectedAt (sources j).1
              (sources j).2).toCriticalFourShell.support
        rw [← ATailMinimalUniqueFourCover.uniqueFourClass_centerAt_eq_selectedAt_support H
              (sources i).1 (sources i).2,
            ← ATailMinimalUniqueFourCover.uniqueFourClass_centerAt_eq_selectedAt_support H
              (sources j).1 (sources j).2,
            hcenter]
      have hjKi : (sources j).1 ∈ Ki.support := by
        rw [hsupports]
        exact Kj.q_mem_support
      have hiKj : (sources i).1 ∈ Kj.support := by
        rw [← hsupports]
        exact Ki.q_mem_support
      have hjBi : j ∈ B i := by
        simpa [B, indexedCriticalSupport, Ki] using hjKi
      have hiNotBj : i ∉ B j := (hone i j hij).mp hjBi
      apply hiNotBj
      simpa [B, indexedCriticalSupport, Kj] using hiKj
    have hinter : ∀ i j, i ≠ j → ((B i) ∩ B j).card ≤ 2 := by
      intro i j hij
      let Ki := (H.selectedAt (sources i).1
        (sources i).2).toCriticalFourShell
      let Kj := (H.selectedAt (sources j).1
        (sources j).2).toCriticalFourShell
      have hphysical : (Ki.support ∩ Kj.support).card ≤ 2 :=
        SelectedFourClass.inter_card_le_two
          Ki.toSelectedFourClass Kj.toSelectedFourClass (hcenters i j hij)
      apply le_trans
        (Finset.card_le_card_of_injOn
          (fun k : Vertex ↦ (sources k).1) (s := (B i) ∩ B j)
          (t := Ki.support ∩ Kj.support) ?_ ?_)
        hphysical
      · intro k hk
        have hmem : k ∈ B i ∩ B j := hk
        rcases Finset.mem_inter.mp hmem with ⟨hki, hkj⟩
        exact Finset.mem_inter.mpr ⟨
          by simpa [B, indexedCriticalSupport, Ki] using hki,
          by simpa [B, indexedCriticalSupport, Kj] using hkj⟩
      · intro k _ l _ hkl
        exact hsourcePoint_inj hkl
    rcases exists_perm_supports_eq_paley B hcardEq hself hone hinter with ⟨σ, hσ⟩
    exact ⟨σ, by
      intro i j
      simpa [B, indexedCriticalSupport] using hσ i j⟩

/-- In a carrier of size at least fifteen, two selected four-supports leave
seven distinct carrier sources outside both supports. -/
theorem exists_seven_sources_outside_two_selected_supports
    {D : CounterexampleData} (hcard : 15 ≤ D.A.card)
    {c₁ c₂ : ℝ²} (K₁ : SelectedFourClass D.A c₁)
    (K₂ : SelectedFourClass D.A c₂) :
    ∃ sources : Vertex ↪ CriticalShellSystem.CarrierVertex D.A,
      ∀ i, (sources i).1 ∉ K₁.support ∧ (sources i).1 ∉ K₂.support := by
  classical
  rcases
      Problem97.ATailSevenSourcesOutsideTwoShells.exists_seven_carrierVertices_outside_two_selected_supports
          hcard K₁ K₂ with
    ⟨T, hTcard, houtside⟩
  let eT : T ≃ Vertex := Finset.equivFinOfCardEq hTcard
  let sources : Vertex ↪ CriticalShellSystem.CarrierVertex D.A :=
    ⟨fun i ↦ (eT.symm i).1, by
      intro i j hij
      apply eT.symm.injective
      exact Subtype.ext hij⟩
  refine ⟨sources, ?_⟩
  intro i
  apply houtside (sources i)
  · exact (eT.symm i).2

/-- Source-faithful seven-source reduction outside any two selected
four-supports.  The selected sources retain their two outside-support facts,
and their own full critical shells satisfy the mutual-omission/Paley
dichotomy. -/
theorem exists_seven_sources_outside_two_supports_with_dichotomy
    {D : CounterexampleData} (H : CriticalShellSystem D.A)
    (hcard : 15 ≤ D.A.card)
    {c₁ c₂ : ℝ²} (K₁ : SelectedFourClass D.A c₁)
    (K₂ : SelectedFourClass D.A c₂) :
    ∃ sources : Vertex ↪ CriticalShellSystem.CarrierVertex D.A,
      (∀ i, (sources i).1 ∉ K₁.support ∧ (sources i).1 ∉ K₂.support) ∧
      ((∃ i j : Vertex, i ≠ j ∧
          (sources j).1 ∉
            (H.selectedAt (sources i).1
              (sources i).2).toCriticalFourShell.support ∧
          (sources i).1 ∉
            (H.selectedAt (sources j).1
              (sources j).2).toCriticalFourShell.support) ∨
        ∃ σ : Equiv.Perm Vertex,
          ∀ i j,
            (sources j).1 ∈
                (H.selectedAt (sources i).1
                  (sources i).2).toCriticalFourShell.support ↔
              σ j ∈
                ({σ i, σ i + 1, σ i + 2, σ i + 4} : Finset Vertex)) := by
  rcases exists_seven_sources_outside_two_selected_supports hcard K₁ K₂ with
    ⟨sources, houtside⟩
  exact ⟨sources, houtside,
    mutualOmission_or_exists_perm_supports_eq_paley H sources⟩

end ATailSevenSourceCriticalShellDichotomy
end Problem97
