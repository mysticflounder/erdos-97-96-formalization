/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Mathlib

/-!
# Uniform off-diagonal metric shifts

For a finite distance table `d`, this file records the elementary operation

`d_C i j = 0` when `i = j`, and `d_C i j = d i j + C` otherwise.

Equalities between distances from one row centre and strict Kalmanson
comparisons are invariant under this operation.  On a finite type, a
sufficiently large `C` makes every off-diagonal entry positive and every
triangle inequality on three distinct labels strict.  Thus triangle
inequalities cannot remove a survivor of a strict-Kalmanson row abstraction;
any remaining obstruction must use additional structure, such as the planar
realisation.

The strict triangle conclusion is intentionally restricted to pairwise
distinct labels: a triangle with a repeated label has an equality forced by
the zero diagonal.
-/

namespace Erdos9796Proof
namespace Geometry

/-- Add a constant to off-diagonal entries and reset the diagonal to zero. -/
def offDiagonalShift {α : Type*} [DecidableEq α]
    (d : α → α → ℝ) (C : ℝ) (i j : α) : ℝ :=
  if i = j then 0 else d i j + C

/-- The shifted diagonal is zero. -/
theorem offDiagonalShift_diag {α : Type*} [DecidableEq α]
    (d : α → α → ℝ) (C : ℝ) (i : α) :
    offDiagonalShift d C i i = 0 := by
  simp [offDiagonalShift]

/-- Off-diagonal entries are translated by the common constant. -/
theorem offDiagonalShift_of_ne {α : Type*} [DecidableEq α]
    (d : α → α → ℝ) (C : ℝ) {i j : α} (hij : i ≠ j) :
    offDiagonalShift d C i j = d i j + C := by
  simp [offDiagonalShift, hij]

/-- Symmetry of the original table is preserved by the shift. -/
theorem offDiagonalShift_symmetric {α : Type*} [DecidableEq α]
    (d : α → α → ℝ) (C : ℝ)
    (hsymm : ∀ i j, d i j = d j i) :
    ∀ i j, offDiagonalShift d C i j = offDiagonalShift d C j i := by
  intro i j
  by_cases hij : i = j
  · subst j
    simp [offDiagonalShift]
  · rw [offDiagonalShift_of_ne d C hij,
      offDiagonalShift_of_ne d C (Ne.symm hij), hsymm i j]

/-- A row equality between two off-diagonal entries survives exactly. -/
theorem offDiagonalShift_row_eq_iff {α : Type*} [DecidableEq α]
    (d : α → α → ℝ) (C : ℝ) {i j k : α}
    (hij : i ≠ j) (hik : i ≠ k) :
    offDiagonalShift d C i j = offDiagonalShift d C i k ↔
      d i j = d i k := by
  rw [offDiagonalShift_of_ne d C hij, offDiagonalShift_of_ne d C hik]
  constructor <;> intro h <;> linarith

/-- A strict `K2` comparison on four distinct roles survives exactly.

The displayed inequality is
`d b c + d a d < d a c + d b d`, equivalently
`d a c + d b d > d a d + d b c`. -/
theorem offDiagonalShift_k2_iff {α : Type*} [DecidableEq α]
    (d : α → α → ℝ) (C : ℝ) {a b c e : α}
    (hbc : b ≠ c) (hae : a ≠ e) (hac : a ≠ c) (hbe : b ≠ e) :
    offDiagonalShift d C b c + offDiagonalShift d C a e <
        offDiagonalShift d C a c + offDiagonalShift d C b e ↔
      d b c + d a e < d a c + d b e := by
  rw [offDiagonalShift_of_ne d C hbc, offDiagonalShift_of_ne d C hae,
      offDiagonalShift_of_ne d C hac, offDiagonalShift_of_ne d C hbe]
  constructor <;> intro h <;> linarith

/-- A common explicit bound makes all off-diagonal entries positive and all
strict triangle inequalities on pairwise distinct labels hold.

The hypotheses provide a global lower bound `m` and upper bound `M`; the
choice `C = max (-m) (M - 2*m) + 1` is sufficient. -/
theorem exists_offDiagonalShift_strict_triangle_of_bounds
    {α : Type*} [DecidableEq α]
    (d : α → α → ℝ) (m M : ℝ)
    (hlower : ∀ i j, i ≠ j → m ≤ d i j)
    (hupper : ∀ i j, d i j ≤ M) :
    ∃ C : ℝ,
      (∀ i j, i ≠ j → 0 < offDiagonalShift d C i j) ∧
      (∀ i j k, i ≠ j → j ≠ k → i ≠ k →
        offDiagonalShift d C i k <
          offDiagonalShift d C i j + offDiagonalShift d C j k) := by
  let C : ℝ := max (-m) (M - 2 * m) + 1
  refine ⟨C, ?_, ?_⟩
  · intro i j hij
    rw [offDiagonalShift_of_ne d C hij]
    have hmax : -m ≤ max (-m) (M - 2 * m) := le_max_left _ _
    have h := hlower i j hij
    dsimp [C]
    linarith
  · intro i j k hij hjk hik
    rw [offDiagonalShift_of_ne d C hik,
      offDiagonalShift_of_ne d C hij,
      offDiagonalShift_of_ne d C hjk]
    have hmax : M - 2 * m ≤ max (-m) (M - 2 * m) := le_max_right _ _
    have hik_upper := hupper i k
    have hij_lower := hlower i j hij
    have hjk_lower := hlower j k hjk
    dsimp [C]
    linarith

/-- Every finite real-valued distance table admits the bounds used above. -/
theorem exists_offDiagonalShift_strict_triangle_finite
    {α : Type*} [Fintype α] [DecidableEq α]
    (d : α → α → ℝ) :
    ∃ C : ℝ,
      (∀ i j, i ≠ j → 0 < offDiagonalShift d C i j) ∧
      (∀ i j k, i ≠ j → j ≠ k → i ≠ k →
        offDiagonalShift d C i k <
          offDiagonalShift d C i j + offDiagonalShift d C j k) := by
  obtain ⟨M, hM⟩ :=
    Finite.exists_le (f := fun p : α × α => d p.1 p.2)
  obtain ⟨N, hN⟩ :=
    Finite.exists_le (f := fun p : α × α => -d p.1 p.2)
  have hupper : ∀ i j, d i j ≤ M := by
    intro i j
    exact hM (i, j)
  have hlower : ∀ i j, i ≠ j → -N ≤ d i j := by
    intro i j hij
    have h := hN (i, j)
    linarith
  exact exists_offDiagonalShift_strict_triangle_of_bounds d (-N) M hlower hupper

/-- Finite symmetric tables admit a shift that is symmetric, zero on the
diagonal, positive off the diagonal, and strictly triangular on distinct
labels. -/
theorem exists_offDiagonalShift_strict_metric_finite
    {α : Type*} [Fintype α] [DecidableEq α]
    (d : α → α → ℝ)
    (hsymm : ∀ i j, d i j = d j i) :
    ∃ C : ℝ,
      (∀ i j, offDiagonalShift d C i j = offDiagonalShift d C j i) ∧
      (∀ i, offDiagonalShift d C i i = 0) ∧
      (∀ i j, i ≠ j → 0 < offDiagonalShift d C i j) ∧
      (∀ i j k, i ≠ j → j ≠ k → i ≠ k →
        offDiagonalShift d C i k <
          offDiagonalShift d C i j + offDiagonalShift d C j k) := by
  obtain ⟨C, hpos, htri⟩ := exists_offDiagonalShift_strict_triangle_finite d
  refine ⟨C, offDiagonalShift_symmetric d C hsymm,
    (fun i => offDiagonalShift_diag d C i), hpos, htri⟩

end Geometry
end Erdos9796Proof

#print axioms Erdos9796Proof.Geometry.exists_offDiagonalShift_strict_metric_finite
