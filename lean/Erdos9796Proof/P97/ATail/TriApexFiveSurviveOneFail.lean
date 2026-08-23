/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.TriApexFourWitness

/-!
# Generic five-survive/one-fail packet

The packet below is a closed producer for the provenance-rich branch.  Four
points are selected outside the two canonical retained-source shells.  They
therefore survive at the three rich apexes and at both retained blockers, but
the actual blocker attached to each selected source still fails.  This is a
producer interface, not a contradiction theorem.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailTriApexFiveSurviveOneFail

open ATailApexRichClassStructure
open ATailApexRichFourWitness
open ATailTriApexFourWitness
open ATailCriticalPairFrontier
open ATailDeletionRobustness

attribute [local instance] Classical.propDecidable

/-- The selected canonical shell support attached to a retained carrier
vertex. -/
abbrev retainedShellSupport
    {D : CounterexampleData} (H : CriticalShellSystem D.A)
    (q : ℝ²) (hq : q ∈ D.A) : Finset ℝ² :=
  (H.selectedAt q hq).toCriticalFourShell.support

/-- A provenance-rich packet of four sources: each source lies in one indexed
four-witness, survives all three rich apexes and both retained blockers, and
fails at its own actual blocker. -/
structure TriApexFiveSurviveOneFail
    {D : CounterexampleData} (S : SurplusCapPacket D.A)
    (H : CriticalShellSystem D.A) (q₁ q₂ : ℝ²)
    (hq₁ : q₁ ∈ D.A) (hq₂ : q₂ ∈ D.A) where
  W : StrictApexFourFamily D.A S
  E : Finset ℝ²
  E_subset : E ⊆ W.support \
    (retainedShellSupport H q₁ hq₁ ∪ retainedShellSupport H q₂ hq₂)
  E_card : E.card = 4
  mem_A : ∀ x : ℝ², x ∈ E → x ∈ D.A
  indexed_provenance : ∀ x : ℝ², x ∈ E → ∃ i : Fin 3, x ∈ W.supportAt i
  apex_survives : ∀ x : ℝ², x ∈ E → ∀ i : Fin 3,
    HasNEquidistantPointsAt 4 (D.A.erase x)
      (S.oppositeVertexByIndex i)
  retained₁_survives : ∀ x : ℝ², x ∈ E →
    HasNEquidistantPointsAt 4 (D.A.erase x) (H.centerAt q₁ hq₁)
  retained₂_survives : ∀ x : ℝ², x ∈ E →
    HasNEquidistantPointsAt 4 (D.A.erase x) (H.centerAt q₂ hq₂)
  actual_blocker_fails : ∀ (x : ℝ²) (hx : x ∈ E),
    ¬ HasNEquidistantPointsAt 4 (D.A.erase x) (H.centerAt x (mem_A x hx))
  actualBlocker_ne_apex : ∀ x : ℝ², ∀ hx : x ∈ E, ∀ i : Fin 3,
    H.centerAt x (mem_A x hx) ≠ S.oppositeVertexByIndex i
  actualBlocker_ne_retained₁ : ∀ x : ℝ², ∀ hx : x ∈ E,
    H.centerAt x (mem_A x hx) ≠ H.centerAt q₁ hq₁
  actualBlocker_ne_retained₂ : ∀ x : ℝ², ∀ hx : x ∈ E,
    H.centerAt x (mem_A x hx) ≠ H.centerAt q₂ hq₂

/-- Produce the five-survive/one-fail packet from rich class structure at all
three indexed apices. -/
noncomputable def triApexFiveSurviveOneFailOfApexRich
    {D : CounterexampleData} (S : SurplusCapPacket D.A)
    (H : CriticalShellSystem D.A) (q₁ q₂ : ℝ²)
    (hq₁ : q₁ ∈ D.A) (hq₂ : q₂ ∈ D.A)
    (hconv : ConvexIndep D.A)
    (hrich : ∀ i : Fin 3,
      ApexRichClassStructure D.A (S.oppositeVertexByIndex i)) :
    TriApexFiveSurviveOneFail S H q₁ q₂ hq₁ hq₂ := by
  classical
  let W : StrictApexFourFamily D.A S :=
    strictApexFourFamilyOfApexRichClassStructure S hconv hrich
  let K₁ := retainedShellSupport H q₁ hq₁
  let K₂ := retainedShellSupport H q₂ hq₂
  have hres : 4 ≤ (W.support \ (K₁ ∪ K₂)).card :=
    W.four_le_card_support_sdiff_two K₁ K₂
      (by simpa [K₁] using (H.selectedAt q₁ hq₁).toCriticalFourShell.support_card.le)
      (by simpa [K₂] using (H.selectedAt q₂ hq₂).toCriticalFourShell.support_card.le)
  let E : Finset ℝ² := Classical.choose
    (Finset.exists_subset_card_eq
      (s := W.support \ (K₁ ∪ K₂)) hres)
  have hEsub : E ⊆ W.support \ (K₁ ∪ K₂) :=
    (Classical.choose_spec (Finset.exists_subset_card_eq
      (s := W.support \ (K₁ ∪ K₂)) hres)).1
  have hEcard : E.card = 4 :=
    (Classical.choose_spec (Finset.exists_subset_card_eq
      (s := W.support \ (K₁ ∪ K₂)) hres)).2
  have hmemA : ∀ x : ℝ², x ∈ E → x ∈ D.A := by
    intro x hx
    have hxW : x ∈ W.support := (Finset.mem_sdiff.mp (hEsub hx)).1
    rcases W.mem_support_iff.mp hxW with ⟨i, hxi⟩
    exact S.capInteriorByIndex_subset i
      (W.supportAt_subset_capInterior i hxi)
  have hprov : ∀ x : ℝ², x ∈ E → ∃ i : Fin 3, x ∈ W.supportAt i := by
    intro x hx
    apply W.exists_index_mem_supportAt
    exact (Finset.mem_sdiff.mp (hEsub hx)).1
  have hnot₁ : ∀ x : ℝ², x ∈ E → x ∉ K₁ := by
    intro x hx hxK
    exact (Finset.mem_sdiff.mp (hEsub hx)).2 (Finset.mem_union.mpr (Or.inl hxK))
  have hnot₂ : ∀ x : ℝ², x ∈ E → x ∉ K₂ := by
    intro x hx hxK
    exact (Finset.mem_sdiff.mp (hEsub hx)).2 (Finset.mem_union.mpr (Or.inr hxK))
  refine {
    W := W
    E := E
    E_subset := by simpa [K₁, K₂] using hEsub
    E_card := hEcard
    mem_A := hmemA
    indexed_provenance := hprov
    apex_survives := by
      intro x hx i
      exact (fullyDeletionRobustAt_of_apexRichClassStructure (hrich i)).survives
        x (hmemA x hx)
    retained₁_survives := by
      intro x hx
      exact (cross_deletion_survives_iff_not_mem_selected_support H hq₁).mpr
        (by simpa [K₁] using hnot₁ x hx)
    retained₂_survives := by
      intro x hx
      exact (cross_deletion_survives_iff_not_mem_selected_support H hq₂).mpr
        (by simpa [K₂] using hnot₂ x hx)
    actual_blocker_fails := by
      intro x hx
      exact H.no_qfree_at x (hmemA x hx)
    actualBlocker_ne_apex := by
      intro x hx i heq
      apply H.no_qfree_at x (hmemA x hx)
      rw [heq]
      exact (fullyDeletionRobustAt_of_apexRichClassStructure (hrich i)).survives
        x (hmemA x hx)
    actualBlocker_ne_retained₁ := by
      intro x hx heq
      apply H.no_qfree_at x (hmemA x hx)
      rw [heq]
      exact (cross_deletion_survives_iff_not_mem_selected_support H hq₁).mpr
        (by simpa [K₁] using hnot₁ x hx)
    actualBlocker_ne_retained₂ := by
      intro x hx heq
      apply H.no_qfree_at x (hmemA x hx)
      rw [heq]
      exact (cross_deletion_survives_iff_not_mem_selected_support H hq₂).mpr
        (by simpa [K₂] using hnot₂ x hx) }

/-- Four selected sources cannot occupy three indexed apex supports injectively;
two distinct sources therefore retain one common indexed-cap provenance. -/
theorem TriApexFiveSurviveOneFail.exists_distinct_same_index
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A} {q₁ q₂ : ℝ²}
    {hq₁ : q₁ ∈ D.A} {hq₂ : q₂ ∈ D.A}
    (Q : TriApexFiveSurviveOneFail S H q₁ q₂ hq₁ hq₂) :
    ∃ x y : ℝ², x ∈ Q.E ∧ y ∈ Q.E ∧ x ≠ y ∧
      ∃ i : Fin 3, x ∈ Q.W.supportAt i ∧ y ∈ Q.W.supportAt i := by
  classical
  let f : ℝ² → Fin 3 := fun z =>
    if hz : z ∈ Q.E then
      Classical.choose (Q.indexed_provenance z hz)
    else 0
  have hf : Set.MapsTo f Q.E (Finset.univ : Finset (Fin 3)) := by
    intro z hz
    simp
  have hcard : (Finset.univ : Finset (Fin 3)).card < Q.E.card := by
    simp [Q.E_card]
  obtain ⟨x, hx, y, hy, hxy, hindex⟩ :=
    Finset.exists_ne_map_eq_of_card_lt_of_maps_to
      (s := Q.E) (t := (Finset.univ : Finset (Fin 3))) (f := f)
      hcard hf
  have hprov (z : ℝ²) (hz : z ∈ Q.E) :
      z ∈ Q.W.supportAt (f z) := by
    dsimp [f]
    split
    · exact Classical.choose_spec (Q.indexed_provenance z hz)
    · rename_i hnot
      exact False.elim (hnot hz)
  refine ⟨x, y, hx, hy, hxy, f x, hprov x hx, ?_⟩
  rw [hindex]
  exact hprov y hy

end ATailTriApexFiveSurviveOneFail
end Problem97
