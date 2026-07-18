/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CapCrossingKalmanson

/-!
# Weighted Kalmanson cancellation consumers

The round-two exact-LRA cores are sums of strict Kalmanson inequalities whose
distance terms cancel modulo selected-row equalities.  This file isolates the
single generic consumer required after a concrete core proves that cancellation.
-/

open scoped BigOperators EuclideanGeometry

namespace Problem97
namespace Round2CoreNormalFormsScratch

open CapCrossingKalmansonBridge

/-- Arithmetic normal form of every two-Kalmanson/three-row alternate found in
the 30-core CNF round-three bank.  One distance cancels directly between the
two strict inequalities; the three row equalities pair the six terms left
over. -/
theorem false_of_two_strict_pair_sums_three_pairings
    {shared s1 s2 s3 d1 d2 d3 : ℝ}
    (hfirst : s1 + s2 < shared + d1)
    (hsecond : shared + s3 < d2 + d3)
    (hpair1 : s1 = d1) (hpair2 : s2 = d2) (hpair3 : s3 = d3) :
    False := by
  linarith

/-- The short-side sum selected by the two strict Kalmanson inequalities. -/
noncomputable def kalmansonShortSum
    {A : Finset ℝ²} (boundary : Fin A.card → ℝ²) (useAdjacentSides : Bool)
    (a b c d : Fin A.card) : ℝ :=
  if useAdjacentSides then
    dist (boundary a) (boundary b) + dist (boundary c) (boundary d)
  else
    dist (boundary b) (boundary c) + dist (boundary a) (boundary d)

/-- The common diagonal sum on the long side of both strict inequalities. -/
noncomputable def kalmansonDiagonalSum
    {A : Finset ℝ²} (boundary : Fin A.card → ℝ²)
    (a b c d : Fin A.card) : ℝ :=
  dist (boundary a) (boundary c) + dist (boundary b) (boundary d)

/-- Any nonzero nonnegative weighted sum of strict Kalmanson inequalities is
incompatible with exact cancellation of its short-side and diagonal sums.

This is the uniform consumer for all 31 round-two exact-LRA cores.  A concrete
core still has to derive `hcancel` from its selected-row equalities. -/
theorem false_of_weighted_kalmanson_cancellation
    {A : Finset ℝ²} (hA : ConvexIndep A)
    {boundary : Fin A.card → ℝ²}
    (hboundary_injective : Function.Injective boundary)
    (hboundary_image : Finset.univ.image boundary = A)
    (hboundary_ccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    {ι : Type*} [Fintype ι]
    (useAdjacentSides : ι → Bool)
    (a b c d : ι → Fin A.card)
    (hab : ∀ i, a i < b i) (hbc : ∀ i, b i < c i) (hcd : ∀ i, c i < d i)
    (weight : ι → ℕ)
    (hweight : ∃ i, 0 < weight i)
    (hcancel :
      ∑ i, (weight i : ℝ) * kalmansonShortSum boundary (useAdjacentSides i)
        (a i) (b i) (c i) (d i) =
      ∑ i, (weight i : ℝ) * kalmansonDiagonalSum boundary
        (a i) (b i) (c i) (d i)) :
    False := by
  have hlt (i : ι) :
      kalmansonShortSum boundary (useAdjacentSides i) (a i) (b i) (c i) (d i) <
        kalmansonDiagonalSum boundary (a i) (b i) (c i) (d i) := by
    cases hside : useAdjacentSides i
    · simpa [kalmansonShortSum, kalmansonDiagonalSum, hside] using
        dist_add_dist_lt_diagonal_sum_of_ccw hA hboundary_injective
          hboundary_image hboundary_ccw (hab i) (hbc i) (hcd i)
    · simpa [kalmansonShortSum, kalmansonDiagonalSum, hside] using
        complementary_dist_add_dist_lt_diagonal_sum_of_ccw hA hboundary_injective
          hboundary_image hboundary_ccw (hab i) (hbc i) (hcd i)
  have hle (i : ι) :
      (weight i : ℝ) * kalmansonShortSum boundary (useAdjacentSides i)
          (a i) (b i) (c i) (d i) ≤
        (weight i : ℝ) * kalmansonDiagonalSum boundary (a i) (b i) (c i) (d i) :=
    mul_le_mul_of_nonneg_left (hlt i).le (Nat.cast_nonneg _)
  obtain ⟨i, hi⟩ := hweight
  have hi_real : (0 : ℝ) < weight i := by exact_mod_cast hi
  have hi_strict :
      (weight i : ℝ) * kalmansonShortSum boundary (useAdjacentSides i)
          (a i) (b i) (c i) (d i) <
        (weight i : ℝ) * kalmansonDiagonalSum boundary (a i) (b i) (c i) (d i) :=
    mul_lt_mul_of_pos_left (hlt i) hi_real
  have hsum_lt :
      ∑ j, (weight j : ℝ) * kalmansonShortSum boundary (useAdjacentSides j)
          (a j) (b j) (c j) (d j) <
        ∑ j, (weight j : ℝ) * kalmansonDiagonalSum boundary
          (a j) (b j) (c j) (d j) :=
    Finset.sum_lt_sum (fun j _ ↦ hle j) ⟨i, Finset.mem_univ i, hi_strict⟩
  exact (ne_of_lt hsum_lt) hcancel

/-- Unit-weight specialization.  It directly covers the 28 round-two cores
whose primitive Farkas multiplier on every strict inequality is one. -/
theorem false_of_kalmanson_cancellation
    {A : Finset ℝ²} (hA : ConvexIndep A)
    {boundary : Fin A.card → ℝ²}
    (hboundary_injective : Function.Injective boundary)
    (hboundary_image : Finset.univ.image boundary = A)
    (hboundary_ccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    {ι : Type*} [Fintype ι] [Nonempty ι]
    (useAdjacentSides : ι → Bool)
    (a b c d : ι → Fin A.card)
    (hab : ∀ i, a i < b i) (hbc : ∀ i, b i < c i) (hcd : ∀ i, c i < d i)
    (hcancel :
      ∑ i, kalmansonShortSum boundary (useAdjacentSides i)
        (a i) (b i) (c i) (d i) =
      ∑ i, kalmansonDiagonalSum boundary (a i) (b i) (c i) (d i)) :
    False := by
  apply false_of_weighted_kalmanson_cancellation hA hboundary_injective
    hboundary_image hboundary_ccw useAdjacentSides a b c d hab hbc hcd (fun _ ↦ 1)
  · exact ⟨Classical.choice inferInstance, by simp⟩
  · simpa using hcancel

/-- A size-independent two-inequality terminal found by the CNF outer search.

The `K2(i0,i1,i2,ig)` inequality and the `K1(i0,i2,i3,i4)` inequality cancel
through three selected-row equalities:

* the row at `ig` identifies `d(i0,ig)` with `d(i1,ig)`;
* the row at `i2` identifies `d(i1,i2)` with `d(i2,i4)`;
* the row at `i3` identifies `d(i0,i3)` with `d(i3,i4)`.

Thus the first inequality forces `d(i2,i4) < d(i0,i2)`, while the second
forces the reverse strict inequality. -/
theorem false_of_two_kalmanson_three_selected_rows
    {A : Finset ℝ²} (hA : ConvexIndep A)
    {boundary : Fin A.card → ℝ²}
    (hboundary_injective : Function.Injective boundary)
    (hboundary_image : Finset.univ.image boundary = A)
    (hboundary_ccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    {i0 i1 i2 i3 i4 ig : Fin A.card}
    (hi01 : i0 < i1) (hi12 : i1 < i2) (hi2g : i2 < ig)
    (hi23 : i2 < i3) (hi34 : i3 < i4)
    (Row2 : SelectedFourClass A (boundary i2))
    (Row3 : SelectedFourClass A (boundary i3))
    (Rowg : SelectedFourClass A (boundary ig))
    (hi1_mem_Row2 : boundary i1 ∈ Row2.support)
    (hi4_mem_Row2 : boundary i4 ∈ Row2.support)
    (hi0_mem_Row3 : boundary i0 ∈ Row3.support)
    (hi4_mem_Row3 : boundary i4 ∈ Row3.support)
    (hi0_mem_Rowg : boundary i0 ∈ Rowg.support)
    (hi1_mem_Rowg : boundary i1 ∈ Rowg.support) :
    False := by
  have h0g_eq_h1g :
      dist (boundary i0) (boundary ig) = dist (boundary i1) (boundary ig) := by
    calc
      dist (boundary i0) (boundary ig) = dist (boundary ig) (boundary i0) :=
        dist_comm _ _
      _ = dist (boundary ig) (boundary i1) :=
        (Rowg.support_eq_radius _ hi0_mem_Rowg).trans
          (Rowg.support_eq_radius _ hi1_mem_Rowg).symm
      _ = dist (boundary i1) (boundary ig) := dist_comm _ _
  have h12_eq_h24 :
      dist (boundary i1) (boundary i2) = dist (boundary i2) (boundary i4) := by
    calc
      dist (boundary i1) (boundary i2) = dist (boundary i2) (boundary i1) :=
        dist_comm _ _
      _ = dist (boundary i2) (boundary i4) :=
        (Row2.support_eq_radius _ hi1_mem_Row2).trans
          (Row2.support_eq_radius _ hi4_mem_Row2).symm
  have h03_eq_h34 :
      dist (boundary i0) (boundary i3) = dist (boundary i3) (boundary i4) := by
    calc
      dist (boundary i0) (boundary i3) = dist (boundary i3) (boundary i0) :=
        dist_comm _ _
      _ = dist (boundary i3) (boundary i4) :=
        (Row3.support_eq_radius _ hi0_mem_Row3).trans
          (Row3.support_eq_radius _ hi4_mem_Row3).symm
  have hkal2 :=
    dist_add_dist_lt_diagonal_sum_of_ccw hA hboundary_injective
      hboundary_image hboundary_ccw hi01 hi12 hi2g
  have hkal1 :=
    complementary_dist_add_dist_lt_diagonal_sum_of_ccw hA hboundary_injective
      hboundary_image hboundary_ccw (hi01.trans hi12) hi23 hi34
  linarith

#print axioms false_of_weighted_kalmanson_cancellation
#print axioms false_of_kalmanson_cancellation
#print axioms false_of_two_kalmanson_three_selected_rows
#print axioms false_of_two_strict_pair_sums_three_pairings

end Round2CoreNormalFormsScratch
end Problem97
