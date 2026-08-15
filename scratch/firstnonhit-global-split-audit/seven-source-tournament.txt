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

private abbrev Incidence (B : Vertex → Finset Vertex) :=
  Σ i : Vertex, ↑(B i)

private def unorderedSlot (i j : Vertex) (hij : i ≠ j) : UpperPair :=
  if h : i < j then ⟨(i, j), h⟩
  else ⟨(j, i), lt_of_le_of_ne (le_of_not_gt h) (Ne.symm hij)⟩

private def incidenceSlot {B : Vertex → Finset Vertex} (x : Incidence B) :
    Vertex ⊕ UpperPair :=
  if h : x.1 = x.2.1 then Sum.inl x.1
  else Sum.inr (unorderedSlot x.1 x.2.1 h)

private theorem incidenceSlot_swap {B : Vertex → Finset Vertex}
    {i j : Vertex} (hij : i ≠ j) (hji : j ∈ B i) (hij' : i ∈ B j) :
    incidenceSlot (⟨i, ⟨j, hji⟩⟩ : Incidence B) =
      incidenceSlot (⟨j, ⟨i, hij'⟩⟩ : Incidence B) := by
  by_cases hlt : i < j
  · simp [incidenceSlot, unorderedSlot, hij, Ne.symm hij, hlt,
      not_lt_of_ge (le_of_lt hlt)]
  · have hjlt : j < i := lt_of_le_of_ne (le_of_not_gt hlt) (Ne.symm hij)
    simp [incidenceSlot, unorderedSlot, hij, Ne.symm hij, hlt, hjlt]

private theorem card_vertex_sum_upperPair :
    Fintype.card (Vertex ⊕ UpperPair) = 28 := by
  decide

/-- If seven self-containing supports have size at most four and every pair is
covered in at least one direction, then capacity is tight: every support has
size four and every pair is covered in exactly one direction. -/
theorem exact_support_surface_of_card_le_four_and_pairCovered
    (B : Vertex → Finset Vertex)
    (hcard : ∀ i, (B i).card ≤ 4)
    (hself : ∀ i, i ∈ B i)
    (hcover : ∀ i j, i ≠ j → j ∈ B i ∨ i ∈ B j) :
    (∀ i, (B i).card = 4) ∧
      ∀ i j, i ≠ j → (j ∈ B i ↔ i ∉ B j) := by
  classical
  have hsurj : Function.Surjective (@incidenceSlot B) := by
    intro s
    rcases s with i | p
    · exact ⟨⟨i, ⟨i, hself i⟩⟩, by simp [incidenceSlot]⟩
    · rcases p with ⟨⟨i, j⟩, hij⟩
      have hne : i ≠ j := ne_of_lt hij
      rcases hcover i j hne with hji | hijmem
      · refine ⟨⟨i, ⟨j, hji⟩⟩, ?_⟩
        simp [incidenceSlot, unorderedSlot, hne, hij]
      · refine ⟨⟨j, ⟨i, hijmem⟩⟩, ?_⟩
        simp [incidenceSlot, unorderedSlot, Ne.symm hne,
          not_lt_of_ge (le_of_lt hij)]
  have hInc_le : Fintype.card (Incidence B) ≤ 28 := by
    rw [Fintype.card_sigma]
    calc
      ∑ i : Vertex, Fintype.card ↑(B i) = ∑ i : Vertex, (B i).card := by simp
      _ ≤ ∑ _i : Vertex, 4 := Finset.sum_le_sum fun i _ ↦ hcard i
      _ = 28 := by decide
  have hSlots_le : 28 ≤ Fintype.card (Incidence B) := by
    rw [← card_vertex_sum_upperPair]
    exact Fintype.card_le_of_surjective incidenceSlot hsurj
  have hInc_eq : Fintype.card (Incidence B) = 28 := by omega
  have hSlots_eq : Fintype.card (Incidence B) = Fintype.card (Vertex ⊕ UpperPair) := by
    exact hInc_eq.trans card_vertex_sum_upperPair.symm
  have hinj : Function.Injective (@incidenceSlot B) :=
    ((Fintype.bijective_iff_surjective_and_card incidenceSlot).2
      ⟨hsurj, hSlots_eq⟩).1
  constructor
  · have hsum : ∑ i : Vertex, (B i).card = ∑ _i : Vertex, 4 := by
      have hsigma : ∑ i : Vertex, (B i).card = 28 := by
        rw [← hInc_eq, Fintype.card_sigma]
        simp
      calc
        ∑ i : Vertex, (B i).card = 28 := hsigma
        _ = ∑ _i : Vertex, 4 := by decide
    have hterm := (Finset.sum_eq_sum_iff_of_le
      (s := (Finset.univ : Finset Vertex))
      (f := fun i ↦ (B i).card) (g := fun _ ↦ 4)
      (fun i _ ↦ hcard i)).mp hsum
    exact fun i ↦ hterm i (Finset.mem_univ i)
  · intro i j hij
    constructor
    · intro hji hijmem
      have heq := hinj (incidenceSlot_swap hij hji hijmem)
      exact hij (by simpa using congrArg Sigma.fst heq)
    · intro hnot
      rcases hcover i j hij with hji | hijmem
      · exact hji
      · exact (hnot hijmem).elim

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

/-- Pair coverage plus the four-slot capacity supplies the exact tournament
surface required by `exists_perm_supports_eq_paley`. -/
theorem exists_perm_supports_eq_paley_of_card_le_four_and_pairCovered
    (B : Vertex → Finset Vertex)
    (hcard : ∀ i, (B i).card ≤ 4)
    (hself : ∀ i, i ∈ B i)
    (hcover : ∀ i j, i ≠ j → j ∈ B i ∨ i ∈ B j)
    (hinter : ∀ i j, i ≠ j → ((B i) ∩ B j).card ≤ 2) :
    ∃ σ : Equiv.Perm Vertex,
      ∀ i j, j ∈ B i ↔ σ j ∈ ({σ i, σ i + 1, σ i + 2, σ i + 4} : Finset Vertex) := by
  rcases exact_support_surface_of_card_le_four_and_pairCovered
      B hcard hself hcover with ⟨hcardEq, hone⟩
  exact exists_perm_supports_eq_paley B hcardEq hself hone hinter

end SevenSourceTournament
end Problem97
