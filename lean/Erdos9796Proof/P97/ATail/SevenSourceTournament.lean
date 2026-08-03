/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Mathlib

/-!
# Seven-source support tournaments

This file isolates the finite classification behind a seven-source support
configuration.  A compact Boolean function on the 21 increasing pairs encodes
a tournament.  The classification theorem below checks this finite encoding,
not the much larger type of arbitrary `Finset`-valued support functions.
-/

namespace Problem97
namespace SevenSourceTournament

/-- The seven source indices. -/
abbrev Vertex := Fin 7

/-- The 21 unordered vertex pairs, represented in increasing order. -/
abbrev UpperPair := {p : Vertex × Vertex // p.1 < p.2}

/-- The tournament encoded by one Boolean choice on each increasing pair. -/
def arc (bits : UpperPair → Bool) (i j : Vertex) : Bool :=
  if h : i < j then bits ⟨(i, j), h⟩
  else if h : j < i then !bits ⟨(j, i), h⟩
  else false

/-- The out-neighborhood in a compactly encoded tournament. -/
def outNeighbors (bits : UpperPair → Bool) (i : Vertex) : Finset Vertex :=
  Finset.univ.filter fun j ↦ arc bits i j = true

/-- The four-point support obtained by adjoining a source to its out-neighborhood. -/
def encodedSupport (bits : UpperPair → Bool) (i : Vertex) : Finset Vertex :=
  insert i (outNeighbors bits i)

/-- The Paley orientation on `Fin 7`, with differences `1`, `2`, and `4`. -/
def paleyArc (i j : Vertex) : Bool :=
  let d := (j.val + 7 - i.val) % 7
  d = 1 || d = 2 || d = 4

/-- The Paley four-support: its source together with the three Paley successors. -/
def paleySupport (i : Vertex) : Finset Vertex :=
  insert i (Finset.univ.filter fun j ↦ paleyArc i j = true)

private theorem all_paleySupport_eq :
    ∀ i : Vertex, paleySupport i = {i, i + 1, i + 2, i + 4} := by
  native_decide

/-- The Paley support is the translate of `{0, 1, 2, 4}` in `Fin 7`. -/
theorem paleySupport_eq (i : Vertex) : paleySupport i = {i, i + 1, i + 2, i + 4} :=
  all_paleySupport_eq i

/-- Regularity together with the unique-common-out-neighbor condition. -/
def IsDoublyRegular (bits : UpperPair → Bool) : Prop :=
  (∀ i, (outNeighbors bits i).card = 3) ∧
    ∀ i j, i ≠ j → ((outNeighbors bits i) ∩ outNeighbors bits j).card = 1

private instance (bits : UpperPair → Bool) : Decidable (IsDoublyRegular bits) := by
  unfold IsDoublyRegular
  infer_instance

/-- Three out-neighbors per source and the at-most-two support-intersection bound. -/
def IsSupportBounded (bits : UpperPair → Bool) : Prop :=
  (∀ i, (outNeighbors bits i).card = 3) ∧
    ∀ i j, i ≠ j → ((encodedSupport bits i) ∩ encodedSupport bits j).card ≤ 2

private instance (bits : UpperPair → Bool) : Decidable (IsSupportBounded bits) := by
  unfold IsSupportBounded
  infer_instance

/-- The compact finite classification, evaluated over the 21 independent pair bits. -/
private theorem all_supportBounded_classified :
    ∀ bits : UpperPair → Bool, IsSupportBounded bits →
      (∀ i j, i ≠ j →
        ((encodedSupport bits i) ∩ encodedSupport bits j).card = 2) ∧
      IsDoublyRegular bits ∧
      ∃ σ : Equiv.Perm Vertex, ∀ i j, arc bits i j = paleyArc (σ i) (σ j) := by
  native_decide

/-- Every distinct pair of encoded supports meets in exactly two vertices. -/
theorem support_inter_card_eq_two_of_isSupportBounded (bits : UpperPair → Bool)
    (h : IsSupportBounded bits) (i j : Vertex) (hij : i ≠ j) :
    ((encodedSupport bits i) ∩ encodedSupport bits j).card = 2 :=
  (all_supportBounded_classified bits h).1 i j hij

/-- The support-intersection assumptions force the exact doubly regular condition. -/
theorem isDoublyRegular_of_isSupportBounded (bits : UpperPair → Bool)
    (h : IsSupportBounded bits) : IsDoublyRegular bits :=
  (all_supportBounded_classified bits h).2.1

/-- Every support-bounded seven-vertex tournament is a relabeling of the Paley tournament. -/
theorem exists_perm_of_isSupportBounded (bits : UpperPair → Bool)
    (h : IsSupportBounded bits) :
    ∃ σ : Equiv.Perm Vertex, ∀ i j, arc bits i j = paleyArc (σ i) (σ j) :=
  (all_supportBounded_classified bits h).2.2

/-- Encode an arbitrary support family by its choices on the 21 increasing pairs. -/
def bitsOfSupports (B : Vertex → Finset Vertex) : UpperPair → Bool :=
  fun p ↦ decide (p.1.2 ∈ B p.1.1)

private theorem arc_bitsOfSupports_iff
    {B : Vertex → Finset Vertex}
    (hone : ∀ i j, i ≠ j → (j ∈ B i ↔ i ∉ B j))
    {i j : Vertex} (hij : i ≠ j) :
    arc (bitsOfSupports B) i j = true ↔ j ∈ B i := by
  by_cases hlt : i < j
  · simp [arc, bitsOfSupports, hlt]
  · have hji : j < i := lt_of_le_of_ne (le_of_not_gt hlt) (Ne.symm hij)
    simpa [arc, bitsOfSupports, hlt, hji] using (hone i j hij).symm

private theorem outNeighbors_bitsOfSupports_eq_erase
    {B : Vertex → Finset Vertex}
    (hone : ∀ i j, i ≠ j → (j ∈ B i ↔ i ∉ B j))
    (i : Vertex) :
    outNeighbors (bitsOfSupports B) i = (B i).erase i := by
  ext j
  by_cases hij : i = j
  · subst j
    simp [outNeighbors, arc]
  · have hji : j ≠ i := Ne.symm hij
    simp [outNeighbors, hji, arc_bitsOfSupports_iff hone hij]

private theorem encodedSupport_bitsOfSupports_eq
    {B : Vertex → Finset Vertex}
    (hself : ∀ i, i ∈ B i)
    (hone : ∀ i j, i ≠ j → (j ∈ B i ↔ i ∉ B j))
    (i : Vertex) :
    encodedSupport (bitsOfSupports B) i = B i := by
  rw [encodedSupport, outNeighbors_bitsOfSupports_eq_erase hone]
  exact Finset.insert_erase (hself i)

/-- Seven four-supports with exact directed pair coverage and pairwise
intersection at most two are, after a permutation, the Paley four-supports. -/
theorem exists_perm_supports_eq_paley
    (B : Vertex → Finset Vertex)
    (hcard : ∀ i, (B i).card = 4)
    (hself : ∀ i, i ∈ B i)
    (hone : ∀ i j, i ≠ j → (j ∈ B i ↔ i ∉ B j))
    (hinter : ∀ i j, i ≠ j → ((B i) ∩ B j).card ≤ 2) :
    ∃ σ : Equiv.Perm Vertex,
      ∀ i j, j ∈ B i ↔ σ j ∈ ({σ i, σ i + 1, σ i + 2, σ i + 4} : Finset Vertex) := by
  let bits := bitsOfSupports B
  have hbounded : IsSupportBounded bits := by
    constructor
    · intro i
      rw [outNeighbors_bitsOfSupports_eq_erase hone]
      rw [Finset.card_erase_of_mem (hself i), hcard]
    · intro i j hij
      rw [encodedSupport_bitsOfSupports_eq hself hone]
      rw [encodedSupport_bitsOfSupports_eq hself hone]
      exact hinter i j hij
  rcases exists_perm_of_isSupportBounded bits hbounded with ⟨σ, hσ⟩
  refine ⟨σ, ?_⟩
  intro i j
  rw [← paleySupport_eq]
  by_cases hij : i = j
  · subst j
    simp [hself, paleySupport]
  · have hσij : σ i ≠ σ j := σ.injective.ne hij
    have hσji : σ j ≠ σ i := Ne.symm hσij
    rw [← arc_bitsOfSupports_iff hone hij, hσ]
    simp [paleySupport, hσji]

end SevenSourceTournament
end Problem97
