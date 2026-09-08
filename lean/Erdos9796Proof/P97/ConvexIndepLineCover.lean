/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under GPL-3.0-or-later as described in the file LICENSE.
Authors: Adam McKenna
-/
import Erdos9796Proof.P97.ConvexIndepHelpers
import Mathlib.Algebra.BigOperators.Group.Finset.Basic

/-!
# Cardinality bound for a convex-independent set covered by lines

Reusable line-cover bounds; validation and provenance are recorded in
`scratch/ConvexIndepLineCover.README.md`.
The cover consists of arbitrary collinear sets, so lines may overlap or repeat.
No equidistance, nonemptiness, common intersection, or symmetry hypothesis is needed.

Discovery credit: GitHub user **sallerk**, owner of `sallerk/erdos-notes`, for the
mirror-line counting observation in
[p97/NOTE.md](https://github.com/sallerk/erdos-notes/blob/6f0ff6e3937ad5bcd341afbf8cf857cd5403913b/p97/NOTE.md).
This project contributes the Lean formalization, the general collinear-cover
formulation, and the five-line/three-line specializations.
This file is not imported by the published P97 proof.
-/

open scoped EuclideanGeometry BigOperators
open EuclideanGeometry

namespace Problem97

/-- A collinear subset of a convex-independent planar finite set has at most two points. -/
theorem ConvexIndep.card_le_two_of_collinear_subset {A B : Finset ℝ²}
    (hA : ConvexIndep A) (hBA : B ⊆ A) (hB : Collinear ℝ (B : Set ℝ²)) :
    B.card ≤ 2 := by
  by_contra hcard
  exact (hA.mono hBA).not_collinear_of_card_ge_three (by omega) hB

/-- Covering a convex-independent planar finite set by `m` collinear sets bounds its
cardinality by `2 * m`. The covering sets need not be disjoint or nonempty.

Discovery credit: GitHub user **sallerk** (`sallerk/erdos-notes`) observed that `m`
mirror lines contain at most `2 * m` vertices of a strictly convex polygon; see
[the original note](https://github.com/sallerk/erdos-notes/blob/6f0ff6e3937ad5bcd341afbf8cf857cd5403913b/p97/NOTE.md).
This theorem formalizes that observation and generalizes it to arbitrary collinear covers. -/
theorem ConvexIndep.card_le_two_mul_of_collinear_cover {A : Finset ℝ²} {m : ℕ}
    (hA : ConvexIndep A) (L : Fin m → Set ℝ²)
    (hL : ∀ i, Collinear ℝ (L i))
    (hcover : ∀ a ∈ A, ∃ i, a ∈ L i) :
    A.card ≤ 2 * m := by
  classical
  let pieces : Fin m → Finset ℝ² := fun i ↦ A.filter (fun a ↦ a ∈ L i)
  have hpiece (i : Fin m) : (pieces i).card ≤ 2 := by
    apply hA.card_le_two_of_collinear_subset (Finset.filter_subset _ _)
    apply Collinear.subset _ (hL i)
    intro a ha
    exact (Finset.mem_filter.mp ha).2
  have hsub : A ⊆ Finset.univ.biUnion pieces := by
    intro a ha
    obtain ⟨i, hi⟩ := hcover a ha
    exact Finset.mem_biUnion.mpr ⟨i, Finset.mem_univ i, Finset.mem_filter.mpr ⟨ha, hi⟩⟩
  calc
    A.card ≤ (Finset.univ.biUnion pieces).card := Finset.card_le_card hsub
    _ ≤ ∑ i : Fin m, (pieces i).card := Finset.card_biUnion_le
    _ ≤ ∑ _i : Fin m, 2 := Finset.sum_le_sum (fun i _ ↦ hpiece i)
    _ = 2 * m := by simp [Nat.mul_comm]

/-- Fifteen convex-independent points cannot be covered by five collinear sets.
The D₅ all-mirror-axis application requires supplying its five-line cover. -/
theorem ConvexIndep.false_of_card_fifteen_five_collinear_cover {A : Finset ℝ²}
    (hA : ConvexIndep A) (hcard : A.card = 15) (L : Fin 5 → Set ℝ²)
    (hL : ∀ i, Collinear ℝ (L i))
    (hcover : ∀ a ∈ A, ∃ i, a ∈ L i) : False := by
  have hbound := hA.card_le_two_mul_of_collinear_cover L hL hcover
  omega

/-- Fifteen convex-independent points cannot be covered by three collinear sets.
The D₃ all-mirror-axis application requires supplying its three-line cover. -/
theorem ConvexIndep.false_of_card_fifteen_three_collinear_cover {A : Finset ℝ²}
    (hA : ConvexIndep A) (hcard : A.card = 15) (L : Fin 3 → Set ℝ²)
    (hL : ∀ i, Collinear ℝ (L i))
    (hcover : ∀ a ∈ A, ∃ i, a ∈ L i) : False := by
  have hbound := hA.card_le_two_mul_of_collinear_cover L hL hcover
  omega

end Problem97
