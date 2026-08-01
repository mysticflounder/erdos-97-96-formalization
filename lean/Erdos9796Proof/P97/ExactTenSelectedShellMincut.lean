/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.SmallCardinality
import Erdos9796Proof.P97.U1CarrierInjection

/-!
# Exact-ten selected-shell min-cut soundness

At every point of a ten-point Problem-97 counterexample, select any four
equal-distance witnesses.  The resulting directed graph has no nonempty proper
sink or source vertex set.

The sink statement follows because a sink would itself inherit the
four-equidistant-points property, while every proper subset of a ten-point
carrier has at most nine points.  The source statement is the sink statement
applied to the complement.  Its conclusion is the mathematical content of
each `S-MINCUT` clause emitted by the exact-`n = 10` projected-static-v2
generator.
-/

open scoped EuclideanGeometry

namespace Problem97

noncomputable section

/-- Every nonempty proper subset of an exact-ten carrier has a selected-shell
edge leaving it. -/
theorem exists_selectedFourClass_escape_of_card_eq_ten
    {A : Finset ℝ²}
    (hconv : ConvexIndep A)
    (hcard : A.card = 10)
    (rowAt : (center : ↑A) → SelectedFourClass A center.1)
    {B : Finset ℝ²}
    (hBne : B.Nonempty)
    (hBA : B ⊆ A)
    (hBproper : B ≠ A) :
    ∃ center : ↑A, center.1 ∈ B ∧
      ∃ x : ℝ², x ∈ (rowAt center).support ∧ x ∉ B := by
  classical
  by_contra hescape
  have hBK4 : HasNEquidistantProperty 4 B := by
    intro center hcenter
    let centerA : ↑A := ⟨center, hBA hcenter⟩
    let K : SelectedFourClass A center := rowAt centerA
    refine ⟨K.radius, K.radius_pos, ?_⟩
    calc
      4 = K.support.card := K.support_card.symm
      _ ≤ (B.filter fun x ↦ dist center x = K.radius).card :=
        Finset.card_le_card (by
          intro x hx
          apply Finset.mem_filter.mpr
          refine ⟨?_, K.support_eq_radius x hx⟩
          by_contra hxB
          exact hescape ⟨centerA, hcenter, x, hx, hxB⟩)
  have hBcard : 10 ≤ B.card :=
    counterexample_card_ge_ten hBne (ConvexIndep.mono hBA hconv) hBK4
  have hBltA : B.card < A.card :=
    Finset.card_lt_card
      (Finset.ssubset_iff_subset_ne.mpr ⟨hBA, hBproper⟩)
  omega

/-- Every nonempty proper subset of an exact-ten carrier has a selected-shell
edge entering it.  This is the direct `S-MINCUT` orientation. -/
theorem exists_selectedFourClass_entry_of_card_eq_ten
    {A : Finset ℝ²}
    (hconv : ConvexIndep A)
    (hcard : A.card = 10)
    (rowAt : (center : ↑A) → SelectedFourClass A center.1)
    {X : Finset ℝ²}
    (hXne : X.Nonempty)
    (hXA : X ⊆ A)
    (hXproper : X ≠ A) :
    ∃ center : ↑A, center.1 ∉ X ∧
      ∃ x : ℝ², x ∈ (rowAt center).support ∧ x ∈ X := by
  classical
  have hcomplement_ne : (A \ X).Nonempty := by
    rw [Finset.sdiff_nonempty]
    intro hAX
    exact hXproper (Finset.Subset.antisymm hXA hAX)
  have hcomplement_proper : A \ X ≠ A := by
    obtain ⟨x, hxX⟩ := hXne
    intro heq
    have hxA : x ∈ A := hXA hxX
    have hxDiff : x ∈ A \ X := heq.symm ▸ hxA
    exact (Finset.mem_sdiff.mp hxDiff).2 hxX
  obtain ⟨center, hcenter, x, hxrow, hxoutside⟩ :=
    exists_selectedFourClass_escape_of_card_eq_ten
      hconv hcard rowAt hcomplement_ne Finset.sdiff_subset
        hcomplement_proper
  refine ⟨center, (Finset.mem_sdiff.mp hcenter).2, x, hxrow, ?_⟩
  have hxA : x ∈ A := (rowAt center).support_subset_A hxrow
  by_contra hxX
  exact hxoutside (Finset.mem_sdiff.mpr ⟨hxA, hxX⟩)

end

end Problem97
