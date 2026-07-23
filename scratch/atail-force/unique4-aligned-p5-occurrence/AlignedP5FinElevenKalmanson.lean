/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import UniqueFourKalmansonReflection

/-!
# Fin-eleven adapters for the aligned-p5 Kalmanson consumers

The reusable Kalmanson consumers use a boundary indexed by `Fin A.card`.
The aligned finite classifier uses its canonical `Fin 11` cut.  This module
transports that cut across a proved carrier-cardinality equality without
changing any boundary value or linear order.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailAlignedP5FinElevenKalmansonScratch

open UniqueFourKalmansonReflectionScratch
open UniqueFourKalmansonCoresScratch

private def cardBoundary {A : Finset ℝ²} (hcard : A.card = 11)
    (boundary : Fin 11 → ℝ²) : Fin A.card → ℝ² :=
  fun i => boundary (Fin.cast hcard i)

private theorem cardBoundary_injective
    {A : Finset ℝ²} (hcard : A.card = 11)
    {boundary : Fin 11 → ℝ²}
    (hinj : Function.Injective boundary) :
    Function.Injective (cardBoundary hcard boundary) := by
  intro i j hij
  apply Fin.cast_injective hcard
  exact hinj hij

private theorem cardBoundary_image
    {A : Finset ℝ²} (hcard : A.card = 11)
    {boundary : Fin 11 → ℝ²}
    (himage : Finset.univ.image boundary = A) :
    Finset.univ.image (cardBoundary hcard boundary) = A := by
  calc
    Finset.univ.image (cardBoundary hcard boundary) =
        Finset.univ.image boundary := by
      apply Finset.Subset.antisymm
      · intro x hx
        rcases Finset.mem_image.mp hx with ⟨i, _hi, rfl⟩
        exact Finset.mem_image.mpr
          ⟨Fin.cast hcard i, Finset.mem_univ _, rfl⟩
      · intro x hx
        rcases Finset.mem_image.mp hx with ⟨i, _hi, rfl⟩
        exact Finset.mem_image.mpr
          ⟨Fin.cast hcard.symm i, Finset.mem_univ _, by
            simp [cardBoundary]⟩
    _ = A := himage

private theorem cardBoundary_ccw
    {A : Finset ℝ²} (hcard : A.card = 11)
    {boundary : Fin 11 → ℝ²}
    (hccw : EuclideanGeometry.IsCcwConvexPolygon boundary) :
    EuclideanGeometry.IsCcwConvexPolygon (cardBoundary hcard boundary) := by
  intro i j k hij hjk
  apply hccw
  · simpa using hij
  · simpa using hjk

private def toCardIndex {A : Finset ℝ²} (hcard : A.card = 11)
    (i : Fin 11) : Fin A.card :=
  Fin.cast hcard.symm i

@[simp] private theorem cardBoundary_toCardIndex
    {A : Finset ℝ²} (hcard : A.card = 11)
    (boundary : Fin 11 → ℝ²) (i : Fin 11) :
    cardBoundary hcard boundary (toCardIndex hcard i) = boundary i := by
  simp [cardBoundary, toCardIndex]

private theorem toCardIndex_lt
    {A : Finset ℝ²} (hcard : A.card = 11)
    {i j : Fin 11} (hij : i < j) :
    toCardIndex hcard i < toCardIndex hcard j := by
  simpa [toCardIndex] using hij

/-- `Fin 11` form of the normalized schema-one terminal. -/
theorem false_of_schemaOne_normalized_fin11
    {A : Finset ℝ²} (hA : ConvexIndep A) (hcard : A.card = 11)
    {boundary : Fin 11 → ℝ²}
    (hinj : Function.Injective boundary)
    (himage : Finset.univ.image boundary = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    {i0 i1 i2 i3 i4 i5 : Fin 11}
    (h01 : i0 < i1) (h12 : i1 < i2) (h23 : i2 < i3)
    (h34 : i3 < i4) (h45 : i4 < i5)
    (Row0 : SelectedFourClass A (boundary i0))
    (Row4 : SelectedFourClass A (boundary i4))
    (Row5 : SelectedFourClass A (boundary i5))
    (hi1_mem_Row0 : boundary i1 ∈ Row0.support)
    (hi3_mem_Row0 : boundary i3 ∈ Row0.support)
    (hi2_mem_Row4 : boundary i2 ∈ Row4.support)
    (hi3_mem_Row4 : boundary i3 ∈ Row4.support)
    (hi1_mem_Row5 : boundary i1 ∈ Row5.support)
    (hi2_mem_Row5 : boundary i2 ∈ Row5.support) :
    False := by
  let c := toCardIndex (A := A) hcard
  have hc01 : c i0 < c i1 := toCardIndex_lt hcard h01
  have hc12 : c i1 < c i2 := toCardIndex_lt hcard h12
  have hc23 : c i2 < c i3 := toCardIndex_lt hcard h23
  have hc34 : c i3 < c i4 := toCardIndex_lt hcard h34
  have hc45 : c i4 < c i5 := toCardIndex_lt hcard h45
  exact false_of_schemaOne_normalized hA
    (cardBoundary_injective hcard hinj)
    (cardBoundary_image hcard himage)
    (cardBoundary_ccw hcard hccw)
    hc01 hc12 hc23 hc34 hc45 Row0 Row4 Row5
    hi1_mem_Row0 hi3_mem_Row0 hi2_mem_Row4 hi3_mem_Row4
    hi1_mem_Row5 hi2_mem_Row5

/-- `Fin 11` form of the normalized schema-four terminal. -/
theorem false_of_schemaFour_normalized_fin11
    {A : Finset ℝ²} (hA : ConvexIndep A) (hcard : A.card = 11)
    {boundary : Fin 11 → ℝ²}
    (hinj : Function.Injective boundary)
    (himage : Finset.univ.image boundary = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    {i0 i1 i2 i3 i4 : Fin 11}
    (h01 : i0 < i1) (h12 : i1 < i2) (h23 : i2 < i3) (h34 : i3 < i4)
    (Row0 : SelectedFourClass A (boundary i0))
    (Row2 : SelectedFourClass A (boundary i2))
    (Row3 : SelectedFourClass A (boundary i3))
    (hi1_mem_Row0 : boundary i1 ∈ Row0.support)
    (hi3_mem_Row0 : boundary i3 ∈ Row0.support)
    (hi3_mem_Row2 : boundary i3 ∈ Row2.support)
    (hi4_mem_Row2 : boundary i4 ∈ Row2.support)
    (hi1_mem_Row3 : boundary i1 ∈ Row3.support)
    (hi4_mem_Row3 : boundary i4 ∈ Row3.support) :
    False := by
  exact false_of_schemaFour_normalized hA
    (cardBoundary_injective hcard hinj)
    (cardBoundary_image hcard himage)
    (cardBoundary_ccw hcard hccw)
    (toCardIndex_lt hcard h01) (toCardIndex_lt hcard h12)
    (toCardIndex_lt hcard h23) (toCardIndex_lt hcard h34)
    Row0 Row2 Row3 hi1_mem_Row0 hi3_mem_Row0 hi3_mem_Row2
    hi4_mem_Row2 hi1_mem_Row3 hi4_mem_Row3

/-- `Fin 11` form of the normalized schema-six terminal. -/
theorem false_of_schemaSix_normalized_fin11
    {A : Finset ℝ²} (hA : ConvexIndep A) (hcard : A.card = 11)
    {boundary : Fin 11 → ℝ²}
    (hinj : Function.Injective boundary)
    (himage : Finset.univ.image boundary = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    {i0 i1 i2 i3 i4 i5 : Fin 11}
    (h01 : i0 < i1) (h12 : i1 < i2) (h23 : i2 < i3)
    (h34 : i3 < i4) (h45 : i4 < i5)
    (Row0 : SelectedFourClass A (boundary i0))
    (Row1 : SelectedFourClass A (boundary i1))
    (Row2 : SelectedFourClass A (boundary i2))
    (hi3_mem_Row0 : boundary i3 ∈ Row0.support)
    (hi4_mem_Row0 : boundary i4 ∈ Row0.support)
    (hi0_mem_Row1 : boundary i0 ∈ Row1.support)
    (hi4_mem_Row1 : boundary i4 ∈ Row1.support)
    (hi0_mem_Row2 : boundary i0 ∈ Row2.support)
    (hi3_mem_Row2 : boundary i3 ∈ Row2.support) :
    False := by
  exact false_of_schemaSix_normalized hA
    (cardBoundary_injective hcard hinj)
    (cardBoundary_image hcard himage)
    (cardBoundary_ccw hcard hccw)
    (toCardIndex_lt hcard h01) (toCardIndex_lt hcard h12)
    (toCardIndex_lt hcard h23) (toCardIndex_lt hcard h34)
    (toCardIndex_lt hcard h45)
    Row0 Row1 Row2 hi3_mem_Row0 hi4_mem_Row0 hi0_mem_Row1
    hi4_mem_Row1 hi0_mem_Row2 hi3_mem_Row2

/-- `Fin 11` form of the reflected schema-six terminal. -/
theorem false_of_schemaSix_reflected_fin11
    {A : Finset ℝ²} (hA : ConvexIndep A) (hcard : A.card = 11)
    {boundary : Fin 11 → ℝ²}
    (hinj : Function.Injective boundary)
    (himage : Finset.univ.image boundary = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    {i0 i1 i2 i3 i4 i5 : Fin 11}
    (h01 : i0 < i1) (h12 : i1 < i2) (h23 : i2 < i3)
    (h34 : i3 < i4) (h45 : i4 < i5)
    (Row3 : SelectedFourClass A (boundary i3))
    (Row4 : SelectedFourClass A (boundary i4))
    (Row5 : SelectedFourClass A (boundary i5))
    (hi2_mem_Row3 : boundary i2 ∈ Row3.support)
    (hi5_mem_Row3 : boundary i5 ∈ Row3.support)
    (hi1_mem_Row4 : boundary i1 ∈ Row4.support)
    (hi5_mem_Row4 : boundary i5 ∈ Row4.support)
    (hi1_mem_Row5 : boundary i1 ∈ Row5.support)
    (hi2_mem_Row5 : boundary i2 ∈ Row5.support) :
    False := by
  exact false_of_schemaSix_reflected hA
    (cardBoundary_injective hcard hinj)
    (cardBoundary_image hcard himage)
    (cardBoundary_ccw hcard hccw)
    (toCardIndex_lt hcard h01) (toCardIndex_lt hcard h12)
    (toCardIndex_lt hcard h23) (toCardIndex_lt hcard h34)
    (toCardIndex_lt hcard h45)
    Row3 Row4 Row5 hi2_mem_Row3 hi5_mem_Row3 hi1_mem_Row4
    hi5_mem_Row4 hi1_mem_Row5 hi2_mem_Row5

/-- `Fin 11` form of the normalized schema-nine terminal. -/
theorem false_of_schemaNine_normalized_fin11
    {A : Finset ℝ²} (hA : ConvexIndep A) (hcard : A.card = 11)
    {boundary : Fin 11 → ℝ²}
    (hinj : Function.Injective boundary)
    (himage : Finset.univ.image boundary = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    {i0 i1 i2 i3 i4 i5 : Fin 11}
    (h01 : i0 < i1) (h12 : i1 < i2) (h23 : i2 < i3)
    (h34 : i3 < i4) (h45 : i4 < i5)
    (Row0 : SelectedFourClass A (boundary i0))
    (Row4 : SelectedFourClass A (boundary i4))
    (Row5 : SelectedFourClass A (boundary i5))
    (hi1_mem_Row0 : boundary i1 ∈ Row0.support)
    (hi3_mem_Row0 : boundary i3 ∈ Row0.support)
    (hi5_mem_Row0 : boundary i5 ∈ Row0.support)
    (hi1_mem_Row4 : boundary i1 ∈ Row4.support)
    (hi2_mem_Row4 : boundary i2 ∈ Row4.support)
    (hi2_mem_Row5 : boundary i2 ∈ Row5.support)
    (hi3_mem_Row5 : boundary i3 ∈ Row5.support) :
    False := by
  exact false_of_schemaNine_normalized hA
    (cardBoundary_injective hcard hinj)
    (cardBoundary_image hcard himage)
    (cardBoundary_ccw hcard hccw)
    (toCardIndex_lt hcard h01) (toCardIndex_lt hcard h12)
    (toCardIndex_lt hcard h23) (toCardIndex_lt hcard h34)
    (toCardIndex_lt hcard h45)
    Row0 Row4 Row5 hi1_mem_Row0 hi3_mem_Row0 hi5_mem_Row0
    hi1_mem_Row4 hi2_mem_Row4 hi2_mem_Row5 hi3_mem_Row5

/-- `Fin 11` terminal for the reflected schema-one occurrence. -/
theorem false_of_schemaOne_reflected_fin11
    {A : Finset ℝ²} (hA : ConvexIndep A) (hcard : A.card = 11)
    {boundary : Fin 11 → ℝ²}
    (hinj : Function.Injective boundary)
    (himage : Finset.univ.image boundary = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    {i0 i1 i2 i3 i4 i5 : Fin 11}
    (h01 : i0 < i1) (h12 : i1 < i2) (h23 : i2 < i3)
    (h34 : i3 < i4) (h45 : i4 < i5)
    (Row0 : SelectedFourClass A (boundary i0))
    (Row1 : SelectedFourClass A (boundary i1))
    (Row5 : SelectedFourClass A (boundary i5))
    (hi3_mem_Row0 : boundary i3 ∈ Row0.support)
    (hi4_mem_Row0 : boundary i4 ∈ Row0.support)
    (hi2_mem_Row1 : boundary i2 ∈ Row1.support)
    (hi3_mem_Row1 : boundary i3 ∈ Row1.support)
    (hi2_mem_Row5 : boundary i2 ∈ Row5.support)
    (hi4_mem_Row5 : boundary i4 ∈ Row5.support) :
    False := by
  exact
    false_of_endpoint_k2_endpoint_k1_three_selected_rows_long hA
      (cardBoundary_injective hcard hinj)
      (cardBoundary_image hcard himage)
      (cardBoundary_ccw hcard hccw)
      (toCardIndex_lt hcard h01) (toCardIndex_lt hcard h12)
      (toCardIndex_lt hcard h23) (toCardIndex_lt hcard h34)
      (toCardIndex_lt hcard h45)
      Row0 Row1 Row5 hi3_mem_Row0 hi4_mem_Row0 hi2_mem_Row1
      hi3_mem_Row1 hi2_mem_Row5 hi4_mem_Row5

/-- `Fin 11` terminal for the reflected schema-four occurrence. -/
theorem false_of_schemaFour_reflected_fin11
    {A : Finset ℝ²} (hA : ConvexIndep A) (hcard : A.card = 11)
    {boundary : Fin 11 → ℝ²}
    (hinj : Function.Injective boundary)
    (himage : Finset.univ.image boundary = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    {i0 i1 i2 i3 i4 : Fin 11}
    (h01 : i0 < i1) (h12 : i1 < i2) (h23 : i2 < i3) (h34 : i3 < i4)
    (Row1 : SelectedFourClass A (boundary i1))
    (Row2 : SelectedFourClass A (boundary i2))
    (Row4 : SelectedFourClass A (boundary i4))
    (hi0_mem_Row1 : boundary i0 ∈ Row1.support)
    (hi3_mem_Row1 : boundary i3 ∈ Row1.support)
    (hi0_mem_Row2 : boundary i0 ∈ Row2.support)
    (hi1_mem_Row2 : boundary i1 ∈ Row2.support)
    (hi1_mem_Row4 : boundary i1 ∈ Row4.support)
    (hi3_mem_Row4 : boundary i3 ∈ Row4.support) :
    False := by
  exact
    false_of_one_k2_two_k1_three_selected_rows hA
      (cardBoundary_injective hcard hinj)
      (cardBoundary_image hcard himage)
      (cardBoundary_ccw hcard hccw)
      (toCardIndex_lt hcard h01) (toCardIndex_lt hcard h12)
      (toCardIndex_lt hcard h23) (toCardIndex_lt hcard h34)
      Row1 Row2 Row4 hi0_mem_Row1 hi3_mem_Row1 hi0_mem_Row2
      hi1_mem_Row2 hi1_mem_Row4 hi3_mem_Row4

/-- `Fin 11` terminal for the reflected schema-nine occurrence. -/
theorem false_of_schemaNine_reflected_fin11
    {A : Finset ℝ²} (hA : ConvexIndep A) (hcard : A.card = 11)
    {boundary : Fin 11 → ℝ²}
    (hinj : Function.Injective boundary)
    (himage : Finset.univ.image boundary = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    {i0 i1 i2 i3 i4 i5 : Fin 11}
    (h01 : i0 < i1) (h12 : i1 < i2) (h23 : i2 < i3)
    (h34 : i3 < i4) (h45 : i4 < i5)
    (Row0 : SelectedFourClass A (boundary i0))
    (Row1 : SelectedFourClass A (boundary i1))
    (Row5 : SelectedFourClass A (boundary i5))
    (hi2_mem_Row0 : boundary i2 ∈ Row0.support)
    (hi3_mem_Row0 : boundary i3 ∈ Row0.support)
    (hi3_mem_Row1 : boundary i3 ∈ Row1.support)
    (hi4_mem_Row1 : boundary i4 ∈ Row1.support)
    (hi0_mem_Row5 : boundary i0 ∈ Row5.support)
    (hi2_mem_Row5 : boundary i2 ∈ Row5.support)
    (hi4_mem_Row5 : boundary i4 ∈ Row5.support) :
    False := by
  exact
    false_of_endpoint_k2_endpoint_k1_three_selected_rows_postBankEight hA
      (cardBoundary_injective hcard hinj)
      (cardBoundary_image hcard himage)
      (cardBoundary_ccw hcard hccw)
      (toCardIndex_lt hcard h01) (toCardIndex_lt hcard h12)
      (toCardIndex_lt hcard h23) (toCardIndex_lt hcard h34)
      (toCardIndex_lt hcard h45)
      Row0 Row1 Row5 hi2_mem_Row0 hi3_mem_Row0 hi3_mem_Row1
      hi4_mem_Row1 hi0_mem_Row5 hi2_mem_Row5 hi4_mem_Row5

end ATailAlignedP5FinElevenKalmansonScratch
end Problem97
