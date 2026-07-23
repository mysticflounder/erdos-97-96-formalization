/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import CorrectedOwnCapKalmansonCores
import SixRoleKalmansonTriangle
import UniqueFourKalmansonReflection
import Erdos9796Proof.P97.Census554.CapSelectedFiniteCode

/-!
# Card-eleven exact-two Kalmanson schema decoder

This module decodes the four row-instance schemas recorded in the card-eleven
exact-two certificate manifests.  The input is a Boolean row-membership
occurrence pulled back from an actual `FaithfulCarrierPattern` along an
injective counterclockwise boundary.

The fourth schema is the block-reflected and cyclically re-cut six-role
triangle.  It is intentionally distinct from the ordinary linear reflection
of the third schema.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailUniqueFourExactTwoSchemaDecoderScratch

open CapCrossingKalmansonBridge
open Census554.CapSelectedFiniteCode
open CorrectedOwnCapKalmansonCoresScratch
open UniqueFourKalmansonOccurrenceScratch
open UniqueFourKalmansonReflectionScratch

abbrev Label := Fin 11
abbrev Membership := Nat × Nat

/-- Pull the selected geometric support at every boundary point back to a
Boolean `Fin 11` row pattern. -/
noncomputable def patternCode {A : Finset ℝ²}
    (boundary : Label → ℝ²) (hmem : ∀ i, boundary i ∈ A)
    (F : FaithfulCarrierPattern A) : PatternCode :=
  fun center point => decide <|
    boundary point ∈
      (F.classAt (boundary center) (hmem center)).support

@[simp] theorem patternCode_eq_true_iff
    {A : Finset ℝ²} (boundary : Label → ℝ²)
    (hmem : ∀ i, boundary i ∈ A) (F : FaithfulCarrierPattern A)
    (center point : Label) :
    patternCode boundary hmem F center point = true ↔
      boundary point ∈
        (F.classAt (boundary center) (hmem center)).support := by
  simp [patternCode]

/-- Eight strictly increasing boundary labels. -/
structure OrderedEight where
  i0 : Label
  i1 : Label
  i2 : Label
  i3 : Label
  i4 : Label
  i5 : Label
  i6 : Label
  i7 : Label
  h01 : i0 < i1
  h12 : i1 < i2
  h23 : i2 < i3
  h34 : i3 < i4
  h45 : i4 < i5
  h56 : i5 < i6
  h67 : i6 < i7

def OrderedEight.values (T : OrderedEight) : List Label :=
  [T.i0, T.i1, T.i2, T.i3, T.i4, T.i5, T.i6, T.i7]

/-- Six strictly increasing boundary labels. -/
structure OrderedSix where
  i0 : Label
  i1 : Label
  i2 : Label
  i3 : Label
  i4 : Label
  i5 : Label
  h01 : i0 < i1
  h12 : i1 < i2
  h23 : i2 < i3
  h34 : i3 < i4
  h45 : i4 < i5

def OrderedSix.values (T : OrderedSix) : List Label :=
  [T.i0, T.i1, T.i2, T.i3, T.i4, T.i5]

/-- The manifest-backed p4 four-endpoint-`K2` three-row template. -/
def p4FourEndpointK2Schema : List Membership :=
  [(0, 2), (0, 4), (0, 6),
    (1, 0), (1, 6), (1, 7),
    (3, 2), (3, 4), (3, 7)]

/-- The manifest-backed p5 two-`K1`/two-`K2` four-row template. -/
def p5TwoK1TwoK2Schema : List Membership :=
  [(0, 1), (0, 3), (0, 5),
    (1, 0), (1, 5),
    (2, 1), (2, 3), (2, 4),
    (5, 0), (5, 4)]

/-- The first manifest-backed p5 six-role two-`K2` triangle. -/
def p5TriangleASchema : List Membership :=
  [(0, 3), (0, 5), (1, 4), (1, 5), (2, 3), (2, 4)]

/-- The non-equivalent block-reflected and cyclically re-cut p5 triangle. -/
def p5TriangleBSchema : List Membership :=
  [(0, 4), (0, 5), (1, 3), (1, 4), (2, 3), (2, 5)]

def reflectSchema (roleCount : Nat) (schema : List Membership) : List Membership :=
  schema.map fun membership =>
    (roleCount - 1 - membership.1, roleCount - 1 - membership.2)

def rolePoint (targets : List Label) (role : Nat) : Label :=
  targets[role]!

def schemaAt (P : PatternCode) (targets : List Label)
    (schema : List Membership) : Bool :=
  schema.all fun membership =>
    P (rolePoint targets membership.1) (rolePoint targets membership.2)

def orientedSchemaAt (P : PatternCode) (targets : List Label)
    (schema : List Membership) : Bool :=
  schemaAt P targets schema ||
    schemaAt P targets (reflectSchema targets.length schema)

private def cardBoundary {A : Finset ℝ²} (hcard : A.card = 11)
    (boundary : Label → ℝ²) : Fin A.card → ℝ² :=
  fun i => boundary (Fin.cast hcard i)

private theorem cardBoundary_injective
    {A : Finset ℝ²} (hcard : A.card = 11)
    {boundary : Label → ℝ²} (hinj : Function.Injective boundary) :
    Function.Injective (cardBoundary hcard boundary) := by
  intro i j hij
  apply Fin.cast_injective hcard
  exact hinj hij

private theorem cardBoundary_image
    {A : Finset ℝ²} (hcard : A.card = 11)
    {boundary : Label → ℝ²}
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
    {boundary : Label → ℝ²}
    (hccw : EuclideanGeometry.IsCcwConvexPolygon boundary) :
    EuclideanGeometry.IsCcwConvexPolygon (cardBoundary hcard boundary) := by
  intro i j k hij hjk
  apply hccw
  · simpa using hij
  · simpa using hjk

private def toCardIndex {A : Finset ℝ²} (hcard : A.card = 11)
    (i : Label) : Fin A.card :=
  Fin.cast hcard.symm i

@[simp] private theorem cardBoundary_toCardIndex
    {A : Finset ℝ²} (hcard : A.card = 11)
    (boundary : Label → ℝ²) (i : Label) :
    cardBoundary hcard boundary (toCardIndex hcard i) = boundary i := by
  simp [cardBoundary, toCardIndex]

private theorem toCardIndex_lt
    {A : Finset ℝ²} (hcard : A.card = 11)
    {i j : Label} (hij : i < j) :
    toCardIndex hcard i < toCardIndex hcard j := by
  simpa [toCardIndex] using hij

/-- `Fin 11` adapter for the normalized p4 manifest consumer. -/
theorem false_of_p4_normalized_fin11
    {A : Finset ℝ²} (hA : ConvexIndep A) (hcard : A.card = 11)
    {boundary : Label → ℝ²}
    (hinj : Function.Injective boundary)
    (himage : Finset.univ.image boundary = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    (T : OrderedEight)
    (Row0 : SelectedFourClass A (boundary T.i0))
    (Row1 : SelectedFourClass A (boundary T.i1))
    (Row3 : SelectedFourClass A (boundary T.i3))
    (hi2_mem_Row0 : boundary T.i2 ∈ Row0.support)
    (hi4_mem_Row0 : boundary T.i4 ∈ Row0.support)
    (hi6_mem_Row0 : boundary T.i6 ∈ Row0.support)
    (hi0_mem_Row1 : boundary T.i0 ∈ Row1.support)
    (hi6_mem_Row1 : boundary T.i6 ∈ Row1.support)
    (hi7_mem_Row1 : boundary T.i7 ∈ Row1.support)
    (hi2_mem_Row3 : boundary T.i2 ∈ Row3.support)
    (hi4_mem_Row3 : boundary T.i4 ∈ Row3.support)
    (hi7_mem_Row3 : boundary T.i7 ∈ Row3.support) :
    False := by
  exact false_of_four_endpoint_k2_three_row_instances hA
    (cardBoundary_injective hcard hinj)
    (cardBoundary_image hcard himage)
    (cardBoundary_ccw hcard hccw)
    (toCardIndex_lt hcard T.h01) (toCardIndex_lt hcard T.h12)
    (toCardIndex_lt hcard T.h23) (toCardIndex_lt hcard T.h34)
    (toCardIndex_lt hcard T.h45) (toCardIndex_lt hcard T.h56)
    (toCardIndex_lt hcard T.h67)
    Row0 Row1 Row3 hi2_mem_Row0 hi4_mem_Row0 hi6_mem_Row0
    hi0_mem_Row1 hi6_mem_Row1 hi7_mem_Row1 hi2_mem_Row3
    hi4_mem_Row3 hi7_mem_Row3

/-- `Fin 11` adapter for the normalized p5 four-row manifest consumer. -/
theorem false_of_p5FourRow_normalized_fin11
    {A : Finset ℝ²} (hA : ConvexIndep A) (hcard : A.card = 11)
    {boundary : Label → ℝ²}
    (hinj : Function.Injective boundary)
    (himage : Finset.univ.image boundary = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    (T : OrderedSix)
    (Row0 : SelectedFourClass A (boundary T.i0))
    (Row1 : SelectedFourClass A (boundary T.i1))
    (Row2 : SelectedFourClass A (boundary T.i2))
    (Row5 : SelectedFourClass A (boundary T.i5))
    (hi1_mem_Row0 : boundary T.i1 ∈ Row0.support)
    (hi3_mem_Row0 : boundary T.i3 ∈ Row0.support)
    (hi5_mem_Row0 : boundary T.i5 ∈ Row0.support)
    (hi0_mem_Row1 : boundary T.i0 ∈ Row1.support)
    (hi5_mem_Row1 : boundary T.i5 ∈ Row1.support)
    (hi1_mem_Row2 : boundary T.i1 ∈ Row2.support)
    (hi3_mem_Row2 : boundary T.i3 ∈ Row2.support)
    (hi4_mem_Row2 : boundary T.i4 ∈ Row2.support)
    (hi0_mem_Row5 : boundary T.i0 ∈ Row5.support)
    (hi4_mem_Row5 : boundary T.i4 ∈ Row5.support) :
    False := by
  exact false_of_two_k1_two_k2_four_row_instances hA
    (cardBoundary_injective hcard hinj)
    (cardBoundary_image hcard himage)
    (cardBoundary_ccw hcard hccw)
    (toCardIndex_lt hcard T.h01) (toCardIndex_lt hcard T.h12)
    (toCardIndex_lt hcard T.h23) (toCardIndex_lt hcard T.h34)
    (toCardIndex_lt hcard T.h45)
    Row0 Row1 Row2 Row5 hi1_mem_Row0 hi3_mem_Row0 hi5_mem_Row0
    hi0_mem_Row1 hi5_mem_Row1 hi1_mem_Row2 hi3_mem_Row2
    hi4_mem_Row2 hi0_mem_Row5 hi4_mem_Row5

/-- `Fin 11` adapter for the normalized p5 triangle-A consumer. -/
theorem false_of_p5TriangleA_normalized_fin11
    {A : Finset ℝ²} (hA : ConvexIndep A) (hcard : A.card = 11)
    {boundary : Label → ℝ²}
    (hinj : Function.Injective boundary)
    (himage : Finset.univ.image boundary = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    (T : OrderedSix)
    (Row0 : SelectedFourClass A (boundary T.i0))
    (Row1 : SelectedFourClass A (boundary T.i1))
    (Row2 : SelectedFourClass A (boundary T.i2))
    (hi3_mem_Row0 : boundary T.i3 ∈ Row0.support)
    (hi5_mem_Row0 : boundary T.i5 ∈ Row0.support)
    (hi4_mem_Row1 : boundary T.i4 ∈ Row1.support)
    (hi5_mem_Row1 : boundary T.i5 ∈ Row1.support)
    (hi3_mem_Row2 : boundary T.i3 ∈ Row2.support)
    (hi4_mem_Row2 : boundary T.i4 ∈ Row2.support) :
    False := by
  exact false_of_two_k2_three_row_triangle hA
    (cardBoundary_injective hcard hinj)
    (cardBoundary_image hcard himage)
    (cardBoundary_ccw hcard hccw)
    (toCardIndex_lt hcard T.h01) (toCardIndex_lt hcard T.h12)
    (toCardIndex_lt hcard T.h23) (toCardIndex_lt hcard T.h34)
    (toCardIndex_lt hcard T.h45)
    Row0 Row1 Row2 hi3_mem_Row0 hi5_mem_Row0 hi4_mem_Row1
    hi5_mem_Row1 hi3_mem_Row2 hi4_mem_Row2

/-- The block-reflected and cyclically re-cut p5 triangle-B terminal.

This is the same two-`K2` cancellation as the existing triangle consumer,
with the two three-role blocks reversed. -/
theorem false_of_p5TriangleB_normalized_fin11
    {A : Finset ℝ²} (hA : ConvexIndep A) (hcard : A.card = 11)
    {boundary : Label → ℝ²}
    (hinj : Function.Injective boundary)
    (himage : Finset.univ.image boundary = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    (T : OrderedSix)
    (Row0 : SelectedFourClass A (boundary T.i0))
    (Row1 : SelectedFourClass A (boundary T.i1))
    (Row2 : SelectedFourClass A (boundary T.i2))
    (hi4_mem_Row0 : boundary T.i4 ∈ Row0.support)
    (hi5_mem_Row0 : boundary T.i5 ∈ Row0.support)
    (hi3_mem_Row1 : boundary T.i3 ∈ Row1.support)
    (hi4_mem_Row1 : boundary T.i4 ∈ Row1.support)
    (hi3_mem_Row2 : boundary T.i3 ∈ Row2.support)
    (hi5_mem_Row2 : boundary T.i5 ∈ Row2.support) :
    False := by
  let c := toCardIndex (A := A) hcard
  have hrow0 :
      dist (boundary T.i0) (boundary T.i4) =
        dist (boundary T.i0) (boundary T.i5) :=
    (Row0.support_eq_radius _ hi4_mem_Row0).trans
      (Row0.support_eq_radius _ hi5_mem_Row0).symm
  have hrow1 :
      dist (boundary T.i1) (boundary T.i3) =
        dist (boundary T.i1) (boundary T.i4) :=
    (Row1.support_eq_radius _ hi3_mem_Row1).trans
      (Row1.support_eq_radius _ hi4_mem_Row1).symm
  have hrow2 :
      dist (boundary T.i2) (boundary T.i3) =
        dist (boundary T.i2) (boundary T.i5) :=
    (Row2.support_eq_radius _ hi3_mem_Row2).trans
      (Row2.support_eq_radius _ hi5_mem_Row2).symm
  have hkal0145 :=
    dist_add_dist_lt_diagonal_sum_of_ccw hA
      (cardBoundary_injective hcard hinj)
      (cardBoundary_image hcard himage)
      (cardBoundary_ccw hcard hccw)
      (toCardIndex_lt hcard T.h01)
      (toCardIndex_lt hcard (T.h12.trans (T.h23.trans T.h34)))
      (toCardIndex_lt hcard T.h45)
  have hkal1235 :=
    dist_add_dist_lt_diagonal_sum_of_ccw hA
      (cardBoundary_injective hcard hinj)
      (cardBoundary_image hcard himage)
      (cardBoundary_ccw hcard hccw)
      (toCardIndex_lt hcard T.h12)
      (toCardIndex_lt hcard T.h23)
      (toCardIndex_lt hcard (T.h34.trans T.h45))
  simp only [cardBoundary_toCardIndex] at hkal0145 hkal1235
  linarith

/-- A normalized executable p4 occurrence over a faithful carrier pattern is
impossible. -/
theorem false_of_p4SchemaAt_normalized
    {A : Finset ℝ²} (hA : ConvexIndep A) (hcard : A.card = 11)
    (boundary : Label → ℝ²) (hmem : ∀ i, boundary i ∈ A)
    (hinj : Function.Injective boundary)
    (himage : Finset.univ.image boundary = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    (F : FaithfulCarrierPattern A) (T : OrderedEight)
    (hschema :
      schemaAt (patternCode boundary hmem F) T.values
        p4FourEndpointK2Schema = true) :
    False := by
  have hfields :
      boundary T.i2 ∈ (F.classAt (boundary T.i0) (hmem T.i0)).support ∧
      boundary T.i4 ∈ (F.classAt (boundary T.i0) (hmem T.i0)).support ∧
      boundary T.i6 ∈ (F.classAt (boundary T.i0) (hmem T.i0)).support ∧
      boundary T.i0 ∈ (F.classAt (boundary T.i1) (hmem T.i1)).support ∧
      boundary T.i6 ∈ (F.classAt (boundary T.i1) (hmem T.i1)).support ∧
      boundary T.i7 ∈ (F.classAt (boundary T.i1) (hmem T.i1)).support ∧
      boundary T.i2 ∈ (F.classAt (boundary T.i3) (hmem T.i3)).support ∧
      boundary T.i4 ∈ (F.classAt (boundary T.i3) (hmem T.i3)).support ∧
      boundary T.i7 ∈ (F.classAt (boundary T.i3) (hmem T.i3)).support := by
    simpa [schemaAt, p4FourEndpointK2Schema, OrderedEight.values,
      rolePoint] using hschema
  exact false_of_p4_normalized_fin11 hA hcard hinj himage hccw T
    (F.classAt (boundary T.i0) (hmem T.i0))
    (F.classAt (boundary T.i1) (hmem T.i1))
    (F.classAt (boundary T.i3) (hmem T.i3))
    hfields.1 hfields.2.1 hfields.2.2.1 hfields.2.2.2.1
    hfields.2.2.2.2.1 hfields.2.2.2.2.2.1
    hfields.2.2.2.2.2.2.1 hfields.2.2.2.2.2.2.2.1
    hfields.2.2.2.2.2.2.2.2

/-- A normalized executable p5 four-row occurrence over a faithful carrier
pattern is impossible. -/
theorem false_of_p5FourRowSchemaAt_normalized
    {A : Finset ℝ²} (hA : ConvexIndep A) (hcard : A.card = 11)
    (boundary : Label → ℝ²) (hmem : ∀ i, boundary i ∈ A)
    (hinj : Function.Injective boundary)
    (himage : Finset.univ.image boundary = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    (F : FaithfulCarrierPattern A) (T : OrderedSix)
    (hschema :
      schemaAt (patternCode boundary hmem F) T.values
        p5TwoK1TwoK2Schema = true) :
    False := by
  have hfields :
      boundary T.i1 ∈ (F.classAt (boundary T.i0) (hmem T.i0)).support ∧
      boundary T.i3 ∈ (F.classAt (boundary T.i0) (hmem T.i0)).support ∧
      boundary T.i5 ∈ (F.classAt (boundary T.i0) (hmem T.i0)).support ∧
      boundary T.i0 ∈ (F.classAt (boundary T.i1) (hmem T.i1)).support ∧
      boundary T.i5 ∈ (F.classAt (boundary T.i1) (hmem T.i1)).support ∧
      boundary T.i1 ∈ (F.classAt (boundary T.i2) (hmem T.i2)).support ∧
      boundary T.i3 ∈ (F.classAt (boundary T.i2) (hmem T.i2)).support ∧
      boundary T.i4 ∈ (F.classAt (boundary T.i2) (hmem T.i2)).support ∧
      boundary T.i0 ∈ (F.classAt (boundary T.i5) (hmem T.i5)).support ∧
      boundary T.i4 ∈ (F.classAt (boundary T.i5) (hmem T.i5)).support := by
    simpa [schemaAt, p5TwoK1TwoK2Schema, OrderedSix.values,
      rolePoint] using hschema
  exact false_of_p5FourRow_normalized_fin11 hA hcard hinj himage hccw T
    (F.classAt (boundary T.i0) (hmem T.i0))
    (F.classAt (boundary T.i1) (hmem T.i1))
    (F.classAt (boundary T.i2) (hmem T.i2))
    (F.classAt (boundary T.i5) (hmem T.i5))
    hfields.1 hfields.2.1 hfields.2.2.1 hfields.2.2.2.1
    hfields.2.2.2.2.1 hfields.2.2.2.2.2.1
    hfields.2.2.2.2.2.2.1 hfields.2.2.2.2.2.2.2.1
    hfields.2.2.2.2.2.2.2.2.1 hfields.2.2.2.2.2.2.2.2.2

/-- A normalized executable triangle-A occurrence over a faithful carrier
pattern is impossible. -/
theorem false_of_p5TriangleASchemaAt_normalized
    {A : Finset ℝ²} (hA : ConvexIndep A) (hcard : A.card = 11)
    (boundary : Label → ℝ²) (hmem : ∀ i, boundary i ∈ A)
    (hinj : Function.Injective boundary)
    (himage : Finset.univ.image boundary = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    (F : FaithfulCarrierPattern A) (T : OrderedSix)
    (hschema :
      schemaAt (patternCode boundary hmem F) T.values
        p5TriangleASchema = true) :
    False := by
  have hfields :
      boundary T.i3 ∈ (F.classAt (boundary T.i0) (hmem T.i0)).support ∧
      boundary T.i5 ∈ (F.classAt (boundary T.i0) (hmem T.i0)).support ∧
      boundary T.i4 ∈ (F.classAt (boundary T.i1) (hmem T.i1)).support ∧
      boundary T.i5 ∈ (F.classAt (boundary T.i1) (hmem T.i1)).support ∧
      boundary T.i3 ∈ (F.classAt (boundary T.i2) (hmem T.i2)).support ∧
      boundary T.i4 ∈ (F.classAt (boundary T.i2) (hmem T.i2)).support := by
    simpa [schemaAt, p5TriangleASchema, OrderedSix.values,
      rolePoint] using hschema
  exact false_of_p5TriangleA_normalized_fin11 hA hcard hinj himage hccw T
    (F.classAt (boundary T.i0) (hmem T.i0))
    (F.classAt (boundary T.i1) (hmem T.i1))
    (F.classAt (boundary T.i2) (hmem T.i2))
    hfields.1 hfields.2.1 hfields.2.2.1 hfields.2.2.2.1
    hfields.2.2.2.2.1 hfields.2.2.2.2.2

/-- A normalized executable triangle-B occurrence over a faithful carrier
pattern is impossible. -/
theorem false_of_p5TriangleBSchemaAt_normalized
    {A : Finset ℝ²} (hA : ConvexIndep A) (hcard : A.card = 11)
    (boundary : Label → ℝ²) (hmem : ∀ i, boundary i ∈ A)
    (hinj : Function.Injective boundary)
    (himage : Finset.univ.image boundary = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    (F : FaithfulCarrierPattern A) (T : OrderedSix)
    (hschema :
      schemaAt (patternCode boundary hmem F) T.values
        p5TriangleBSchema = true) :
    False := by
  have hfields :
      boundary T.i4 ∈ (F.classAt (boundary T.i0) (hmem T.i0)).support ∧
      boundary T.i5 ∈ (F.classAt (boundary T.i0) (hmem T.i0)).support ∧
      boundary T.i3 ∈ (F.classAt (boundary T.i1) (hmem T.i1)).support ∧
      boundary T.i4 ∈ (F.classAt (boundary T.i1) (hmem T.i1)).support ∧
      boundary T.i3 ∈ (F.classAt (boundary T.i2) (hmem T.i2)).support ∧
      boundary T.i5 ∈ (F.classAt (boundary T.i2) (hmem T.i2)).support := by
    simpa [schemaAt, p5TriangleBSchema, OrderedSix.values,
      rolePoint] using hschema
  exact false_of_p5TriangleB_normalized_fin11 hA hcard hinj himage hccw T
    (F.classAt (boundary T.i0) (hmem T.i0))
    (F.classAt (boundary T.i1) (hmem T.i1))
    (F.classAt (boundary T.i2) (hmem T.i2))
    hfields.1 hfields.2.1 hfields.2.2.1 hfields.2.2.2.1
    hfields.2.2.2.2.1 hfields.2.2.2.2.2

private theorem k2_of_decreasing_fin11
    {A : Finset ℝ²} (hA : ConvexIndep A) (hcard : A.card = 11)
    {boundary : Label → ℝ²}
    (hinj : Function.Injective boundary)
    (himage : Finset.univ.image boundary = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    {ia ib ic id : Label}
    (hba : ib < ia) (hcb : ic < ib) (hdc : id < ic) :
    dist (boundary ib) (boundary ic) + dist (boundary ia) (boundary id) <
      dist (boundary ia) (boundary ic) + dist (boundary ib) (boundary id) := by
  have h :=
    dist_add_dist_lt_diagonal_sum_of_ccw_of_decreasing hA
      (cardBoundary_injective hcard hinj)
      (cardBoundary_image hcard himage)
      (cardBoundary_ccw hcard hccw)
      (toCardIndex_lt hcard hba)
      (toCardIndex_lt hcard hcb)
      (toCardIndex_lt hcard hdc)
  simpa only [cardBoundary_toCardIndex] using h

private theorem k1_of_decreasing_fin11
    {A : Finset ℝ²} (hA : ConvexIndep A) (hcard : A.card = 11)
    {boundary : Label → ℝ²}
    (hinj : Function.Injective boundary)
    (himage : Finset.univ.image boundary = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    {ia ib ic id : Label}
    (hba : ib < ia) (hcb : ic < ib) (hdc : id < ic) :
    dist (boundary ia) (boundary ib) + dist (boundary ic) (boundary id) <
      dist (boundary ia) (boundary ic) + dist (boundary ib) (boundary id) := by
  have h :=
    complementary_dist_add_dist_lt_diagonal_sum_of_ccw_of_decreasing hA
      (cardBoundary_injective hcard hinj)
      (cardBoundary_image hcard himage)
      (cardBoundary_ccw hcard hccw)
      (toCardIndex_lt hcard hba)
      (toCardIndex_lt hcard hcb)
      (toCardIndex_lt hcard hdc)
  simpa only [cardBoundary_toCardIndex] using h

/-- `Fin 11` terminal for the ordinary linear reflection of the p4 schema. -/
theorem false_of_p4_reflected_fin11
    {A : Finset ℝ²} (hA : ConvexIndep A) (hcard : A.card = 11)
    {boundary : Label → ℝ²}
    (hinj : Function.Injective boundary)
    (himage : Finset.univ.image boundary = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    (T : OrderedEight)
    (Row4 : SelectedFourClass A (boundary T.i4))
    (Row6 : SelectedFourClass A (boundary T.i6))
    (Row7 : SelectedFourClass A (boundary T.i7))
    (hi0_mem_Row4 : boundary T.i0 ∈ Row4.support)
    (hi3_mem_Row4 : boundary T.i3 ∈ Row4.support)
    (hi5_mem_Row4 : boundary T.i5 ∈ Row4.support)
    (hi0_mem_Row6 : boundary T.i0 ∈ Row6.support)
    (hi1_mem_Row6 : boundary T.i1 ∈ Row6.support)
    (hi7_mem_Row6 : boundary T.i7 ∈ Row6.support)
    (hi1_mem_Row7 : boundary T.i1 ∈ Row7.support)
    (hi3_mem_Row7 : boundary T.i3 ∈ Row7.support)
    (hi5_mem_Row7 : boundary T.i5 ∈ Row7.support) :
    False := by
  have hrow7 :
      dist (boundary T.i7) (boundary T.i1) =
        dist (boundary T.i7) (boundary T.i3) :=
    (Row7.support_eq_radius _ hi1_mem_Row7).trans
      (Row7.support_eq_radius _ hi3_mem_Row7).symm
  have hrow7' :
      dist (boundary T.i7) (boundary T.i3) =
        dist (boundary T.i7) (boundary T.i5) :=
    (Row7.support_eq_radius _ hi3_mem_Row7).trans
      (Row7.support_eq_radius _ hi5_mem_Row7).symm
  have hrow6 :
      dist (boundary T.i6) (boundary T.i1) =
        dist (boundary T.i6) (boundary T.i0) :=
    (Row6.support_eq_radius _ hi1_mem_Row6).trans
      (Row6.support_eq_radius _ hi0_mem_Row6).symm
  have hrow6' :
      dist (boundary T.i7) (boundary T.i6) =
        dist (boundary T.i6) (boundary T.i0) := by
    calc
      dist (boundary T.i7) (boundary T.i6) =
          dist (boundary T.i6) (boundary T.i7) := dist_comm _ _
      _ = dist (boundary T.i6) (boundary T.i0) :=
        (Row6.support_eq_radius _ hi7_mem_Row6).trans
          (Row6.support_eq_radius _ hi0_mem_Row6).symm
  have hrow4 :
      dist (boundary T.i5) (boundary T.i4) =
        dist (boundary T.i4) (boundary T.i3) := by
    calc
      dist (boundary T.i5) (boundary T.i4) =
          dist (boundary T.i4) (boundary T.i5) := dist_comm _ _
      _ = dist (boundary T.i4) (boundary T.i3) :=
        (Row4.support_eq_radius _ hi5_mem_Row4).trans
          (Row4.support_eq_radius _ hi3_mem_Row4).symm
  have hrow4' :
      dist (boundary T.i4) (boundary T.i3) =
        dist (boundary T.i4) (boundary T.i0) :=
    (Row4.support_eq_radius _ hi3_mem_Row4).trans
      (Row4.support_eq_radius _ hi0_mem_Row4).symm
  have hkal7162 := k2_of_decreasing_fin11 hA hcard hinj himage hccw
    T.h67 (T.h23.trans (T.h34.trans (T.h45.trans T.h56))) T.h12
  have hkal7432 := k2_of_decreasing_fin11 hA hcard hinj himage hccw
    (T.h45.trans (T.h56.trans T.h67)) T.h34 T.h23
  have hkal6520 := k2_of_decreasing_fin11 hA hcard hinj himage hccw
    T.h56 (T.h23.trans (T.h34.trans T.h45)) (T.h01.trans T.h12)
  have hkal5420 := k2_of_decreasing_fin11 hA hcard hinj himage hccw
    T.h45 (T.h23.trans T.h34) (T.h01.trans T.h12)
  linarith

/-- `Fin 11` terminal for the ordinary linear reflection of the p5 four-row
schema. -/
theorem false_of_p5FourRow_reflected_fin11
    {A : Finset ℝ²} (hA : ConvexIndep A) (hcard : A.card = 11)
    {boundary : Label → ℝ²}
    (hinj : Function.Injective boundary)
    (himage : Finset.univ.image boundary = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    (T : OrderedSix)
    (Row0 : SelectedFourClass A (boundary T.i0))
    (Row3 : SelectedFourClass A (boundary T.i3))
    (Row4 : SelectedFourClass A (boundary T.i4))
    (Row5 : SelectedFourClass A (boundary T.i5))
    (hi1_mem_Row0 : boundary T.i1 ∈ Row0.support)
    (hi5_mem_Row0 : boundary T.i5 ∈ Row0.support)
    (hi1_mem_Row3 : boundary T.i1 ∈ Row3.support)
    (hi2_mem_Row3 : boundary T.i2 ∈ Row3.support)
    (hi4_mem_Row3 : boundary T.i4 ∈ Row3.support)
    (hi0_mem_Row4 : boundary T.i0 ∈ Row4.support)
    (hi5_mem_Row4 : boundary T.i5 ∈ Row4.support)
    (hi0_mem_Row5 : boundary T.i0 ∈ Row5.support)
    (hi2_mem_Row5 : boundary T.i2 ∈ Row5.support)
    (hi4_mem_Row5 : boundary T.i4 ∈ Row5.support) :
    False := by
  have hrow5 :
      dist (boundary T.i5) (boundary T.i4) =
        dist (boundary T.i5) (boundary T.i2) :=
    (Row5.support_eq_radius _ hi4_mem_Row5).trans
      (Row5.support_eq_radius _ hi2_mem_Row5).symm
  have hrow5' :
      dist (boundary T.i5) (boundary T.i4) =
        dist (boundary T.i5) (boundary T.i0) :=
    (Row5.support_eq_radius _ hi4_mem_Row5).trans
      (Row5.support_eq_radius _ hi0_mem_Row5).symm
  have hrow4 :
      dist (boundary T.i5) (boundary T.i4) =
        dist (boundary T.i4) (boundary T.i0) := by
    calc
      dist (boundary T.i5) (boundary T.i4) =
          dist (boundary T.i4) (boundary T.i5) := dist_comm _ _
      _ = dist (boundary T.i4) (boundary T.i0) :=
        (Row4.support_eq_radius _ hi5_mem_Row4).trans
          (Row4.support_eq_radius _ hi0_mem_Row4).symm
  have hrow3 :
      dist (boundary T.i3) (boundary T.i2) =
        dist (boundary T.i3) (boundary T.i1) :=
    (Row3.support_eq_radius _ hi2_mem_Row3).trans
      (Row3.support_eq_radius _ hi1_mem_Row3).symm
  have hrow3' :
      dist (boundary T.i4) (boundary T.i3) =
        dist (boundary T.i3) (boundary T.i2) := by
    calc
      dist (boundary T.i4) (boundary T.i3) =
          dist (boundary T.i3) (boundary T.i4) := dist_comm _ _
      _ = dist (boundary T.i3) (boundary T.i2) :=
        (Row3.support_eq_radius _ hi4_mem_Row3).trans
          (Row3.support_eq_radius _ hi2_mem_Row3).symm
  have hrow0 :
      dist (boundary T.i5) (boundary T.i0) =
        dist (boundary T.i1) (boundary T.i0) := by
    calc
      dist (boundary T.i5) (boundary T.i0) =
          dist (boundary T.i0) (boundary T.i5) := dist_comm _ _
      _ = dist (boundary T.i0) (boundary T.i1) :=
        (Row0.support_eq_radius _ hi5_mem_Row0).trans
          (Row0.support_eq_radius _ hi1_mem_Row0).symm
      _ = dist (boundary T.i1) (boundary T.i0) := dist_comm _ _
  have hkal15430 := k1_of_decreasing_fin11 hA hcard hinj himage hccw
    T.h45 T.h34 (T.h01.trans (T.h12.trans T.h23))
  have hkal25421 := k2_of_decreasing_fin11 hA hcard hinj himage hccw
    T.h45 (T.h23.trans T.h34) T.h12
  have hkal15310 := k1_of_decreasing_fin11 hA hcard hinj himage hccw
    (T.h34.trans T.h45) (T.h12.trans T.h23) T.h01
  have hkal24321 := k2_of_decreasing_fin11 hA hcard hinj himage hccw
    T.h34 T.h23 T.h12
  linarith

/-- `Fin 11` terminal for the ordinary linear reflection of triangle A. -/
theorem false_of_p5TriangleA_reflected_fin11
    {A : Finset ℝ²} (hA : ConvexIndep A) (hcard : A.card = 11)
    {boundary : Label → ℝ²}
    (hinj : Function.Injective boundary)
    (himage : Finset.univ.image boundary = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    (T : OrderedSix)
    (Row3 : SelectedFourClass A (boundary T.i3))
    (Row4 : SelectedFourClass A (boundary T.i4))
    (Row5 : SelectedFourClass A (boundary T.i5))
    (hi1_mem_Row3 : boundary T.i1 ∈ Row3.support)
    (hi2_mem_Row3 : boundary T.i2 ∈ Row3.support)
    (hi0_mem_Row4 : boundary T.i0 ∈ Row4.support)
    (hi1_mem_Row4 : boundary T.i1 ∈ Row4.support)
    (hi0_mem_Row5 : boundary T.i0 ∈ Row5.support)
    (hi2_mem_Row5 : boundary T.i2 ∈ Row5.support) :
    False := by
  have hrow5 :
      dist (boundary T.i5) (boundary T.i2) =
        dist (boundary T.i5) (boundary T.i0) :=
    (Row5.support_eq_radius _ hi2_mem_Row5).trans
      (Row5.support_eq_radius _ hi0_mem_Row5).symm
  have hrow4 :
      dist (boundary T.i4) (boundary T.i1) =
        dist (boundary T.i4) (boundary T.i0) :=
    (Row4.support_eq_radius _ hi1_mem_Row4).trans
      (Row4.support_eq_radius _ hi0_mem_Row4).symm
  have hrow3 :
      dist (boundary T.i3) (boundary T.i2) =
        dist (boundary T.i3) (boundary T.i1) :=
    (Row3.support_eq_radius _ hi2_mem_Row3).trans
      (Row3.support_eq_radius _ hi1_mem_Row3).symm
  have hkal5420 := k2_of_decreasing_fin11 hA hcard hinj himage hccw
    T.h45 (T.h23.trans T.h34) (T.h01.trans T.h12)
  have hkal4321 := k2_of_decreasing_fin11 hA hcard hinj himage hccw
    T.h34 T.h23 T.h12
  linarith

/-- `Fin 11` terminal for the ordinary linear reflection of triangle B. -/
theorem false_of_p5TriangleB_reflected_fin11
    {A : Finset ℝ²} (hA : ConvexIndep A) (hcard : A.card = 11)
    {boundary : Label → ℝ²}
    (hinj : Function.Injective boundary)
    (himage : Finset.univ.image boundary = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    (T : OrderedSix)
    (Row3 : SelectedFourClass A (boundary T.i3))
    (Row4 : SelectedFourClass A (boundary T.i4))
    (Row5 : SelectedFourClass A (boundary T.i5))
    (hi0_mem_Row3 : boundary T.i0 ∈ Row3.support)
    (hi2_mem_Row3 : boundary T.i2 ∈ Row3.support)
    (hi1_mem_Row4 : boundary T.i1 ∈ Row4.support)
    (hi2_mem_Row4 : boundary T.i2 ∈ Row4.support)
    (hi0_mem_Row5 : boundary T.i0 ∈ Row5.support)
    (hi1_mem_Row5 : boundary T.i1 ∈ Row5.support) :
    False := by
  have hrow5 :
      dist (boundary T.i5) (boundary T.i1) =
        dist (boundary T.i5) (boundary T.i0) :=
    (Row5.support_eq_radius _ hi1_mem_Row5).trans
      (Row5.support_eq_radius _ hi0_mem_Row5).symm
  have hrow4 :
      dist (boundary T.i4) (boundary T.i2) =
        dist (boundary T.i4) (boundary T.i1) :=
    (Row4.support_eq_radius _ hi2_mem_Row4).trans
      (Row4.support_eq_radius _ hi1_mem_Row4).symm
  have hrow3 :
      dist (boundary T.i3) (boundary T.i2) =
        dist (boundary T.i3) (boundary T.i0) :=
    (Row3.support_eq_radius _ hi2_mem_Row3).trans
      (Row3.support_eq_radius _ hi0_mem_Row3).symm
  have hkal5410 := k2_of_decreasing_fin11 hA hcard hinj himage hccw
    T.h45 (T.h12.trans (T.h23.trans T.h34)) T.h01
  have hkal4320 := k2_of_decreasing_fin11 hA hcard hinj himage hccw
    T.h34 T.h23 (T.h01.trans T.h12)
  linarith

/-- A reflected executable p4 occurrence over a faithful carrier pattern is
impossible. -/
theorem false_of_p4SchemaAt_reflected
    {A : Finset ℝ²} (hA : ConvexIndep A) (hcard : A.card = 11)
    (boundary : Label → ℝ²) (hmem : ∀ i, boundary i ∈ A)
    (hinj : Function.Injective boundary)
    (himage : Finset.univ.image boundary = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    (F : FaithfulCarrierPattern A) (T : OrderedEight)
    (hschema :
      schemaAt (patternCode boundary hmem F) T.values
        (reflectSchema 8 p4FourEndpointK2Schema) = true) :
    False := by
  have hfields :
      boundary T.i5 ∈ (F.classAt (boundary T.i7) (hmem T.i7)).support ∧
      boundary T.i3 ∈ (F.classAt (boundary T.i7) (hmem T.i7)).support ∧
      boundary T.i1 ∈ (F.classAt (boundary T.i7) (hmem T.i7)).support ∧
      boundary T.i7 ∈ (F.classAt (boundary T.i6) (hmem T.i6)).support ∧
      boundary T.i1 ∈ (F.classAt (boundary T.i6) (hmem T.i6)).support ∧
      boundary T.i0 ∈ (F.classAt (boundary T.i6) (hmem T.i6)).support ∧
      boundary T.i5 ∈ (F.classAt (boundary T.i4) (hmem T.i4)).support ∧
      boundary T.i3 ∈ (F.classAt (boundary T.i4) (hmem T.i4)).support ∧
      boundary T.i0 ∈ (F.classAt (boundary T.i4) (hmem T.i4)).support := by
    simpa [schemaAt, reflectSchema, p4FourEndpointK2Schema,
      OrderedEight.values, rolePoint] using hschema
  exact false_of_p4_reflected_fin11 hA hcard hinj himage hccw T
    (F.classAt (boundary T.i4) (hmem T.i4))
    (F.classAt (boundary T.i6) (hmem T.i6))
    (F.classAt (boundary T.i7) (hmem T.i7))
    hfields.2.2.2.2.2.2.2.2
    hfields.2.2.2.2.2.2.2.1 hfields.2.2.2.2.2.2.1
    hfields.2.2.2.2.2.1 hfields.2.2.2.2.1 hfields.2.2.2.1
    hfields.2.2.1 hfields.2.1 hfields.1

/-- A reflected executable p5 four-row occurrence over a faithful carrier
pattern is impossible. -/
theorem false_of_p5FourRowSchemaAt_reflected
    {A : Finset ℝ²} (hA : ConvexIndep A) (hcard : A.card = 11)
    (boundary : Label → ℝ²) (hmem : ∀ i, boundary i ∈ A)
    (hinj : Function.Injective boundary)
    (himage : Finset.univ.image boundary = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    (F : FaithfulCarrierPattern A) (T : OrderedSix)
    (hschema :
      schemaAt (patternCode boundary hmem F) T.values
        (reflectSchema 6 p5TwoK1TwoK2Schema) = true) :
    False := by
  have hfields :
      boundary T.i4 ∈ (F.classAt (boundary T.i5) (hmem T.i5)).support ∧
      boundary T.i2 ∈ (F.classAt (boundary T.i5) (hmem T.i5)).support ∧
      boundary T.i0 ∈ (F.classAt (boundary T.i5) (hmem T.i5)).support ∧
      boundary T.i5 ∈ (F.classAt (boundary T.i4) (hmem T.i4)).support ∧
      boundary T.i0 ∈ (F.classAt (boundary T.i4) (hmem T.i4)).support ∧
      boundary T.i4 ∈ (F.classAt (boundary T.i3) (hmem T.i3)).support ∧
      boundary T.i2 ∈ (F.classAt (boundary T.i3) (hmem T.i3)).support ∧
      boundary T.i1 ∈ (F.classAt (boundary T.i3) (hmem T.i3)).support ∧
      boundary T.i5 ∈ (F.classAt (boundary T.i0) (hmem T.i0)).support ∧
      boundary T.i1 ∈ (F.classAt (boundary T.i0) (hmem T.i0)).support := by
    simpa [schemaAt, reflectSchema, p5TwoK1TwoK2Schema,
      OrderedSix.values, rolePoint] using hschema
  exact false_of_p5FourRow_reflected_fin11 hA hcard hinj himage hccw T
    (F.classAt (boundary T.i0) (hmem T.i0))
    (F.classAt (boundary T.i3) (hmem T.i3))
    (F.classAt (boundary T.i4) (hmem T.i4))
    (F.classAt (boundary T.i5) (hmem T.i5))
    hfields.2.2.2.2.2.2.2.2.2 hfields.2.2.2.2.2.2.2.2.1
    hfields.2.2.2.2.2.2.2.1 hfields.2.2.2.2.2.2.1
    hfields.2.2.2.2.2.1 hfields.2.2.2.2.1
    hfields.2.2.2.1 hfields.2.2.1 hfields.2.1 hfields.1

/-- A reflected executable triangle-A occurrence over a faithful carrier
pattern is impossible. -/
theorem false_of_p5TriangleASchemaAt_reflected
    {A : Finset ℝ²} (hA : ConvexIndep A) (hcard : A.card = 11)
    (boundary : Label → ℝ²) (hmem : ∀ i, boundary i ∈ A)
    (hinj : Function.Injective boundary)
    (himage : Finset.univ.image boundary = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    (F : FaithfulCarrierPattern A) (T : OrderedSix)
    (hschema :
      schemaAt (patternCode boundary hmem F) T.values
        (reflectSchema 6 p5TriangleASchema) = true) :
    False := by
  have hfields :
      boundary T.i2 ∈ (F.classAt (boundary T.i5) (hmem T.i5)).support ∧
      boundary T.i0 ∈ (F.classAt (boundary T.i5) (hmem T.i5)).support ∧
      boundary T.i1 ∈ (F.classAt (boundary T.i4) (hmem T.i4)).support ∧
      boundary T.i0 ∈ (F.classAt (boundary T.i4) (hmem T.i4)).support ∧
      boundary T.i2 ∈ (F.classAt (boundary T.i3) (hmem T.i3)).support ∧
      boundary T.i1 ∈ (F.classAt (boundary T.i3) (hmem T.i3)).support := by
    simpa [schemaAt, reflectSchema, p5TriangleASchema,
      OrderedSix.values, rolePoint] using hschema
  exact false_of_p5TriangleA_reflected_fin11 hA hcard hinj himage hccw T
    (F.classAt (boundary T.i3) (hmem T.i3))
    (F.classAt (boundary T.i4) (hmem T.i4))
    (F.classAt (boundary T.i5) (hmem T.i5))
    hfields.2.2.2.2.2 hfields.2.2.2.2.1 hfields.2.2.2.1
    hfields.2.2.1 hfields.2.1 hfields.1

/-- A reflected executable triangle-B occurrence over a faithful carrier
pattern is impossible. -/
theorem false_of_p5TriangleBSchemaAt_reflected
    {A : Finset ℝ²} (hA : ConvexIndep A) (hcard : A.card = 11)
    (boundary : Label → ℝ²) (hmem : ∀ i, boundary i ∈ A)
    (hinj : Function.Injective boundary)
    (himage : Finset.univ.image boundary = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    (F : FaithfulCarrierPattern A) (T : OrderedSix)
    (hschema :
      schemaAt (patternCode boundary hmem F) T.values
        (reflectSchema 6 p5TriangleBSchema) = true) :
    False := by
  have hfields :
      boundary T.i1 ∈ (F.classAt (boundary T.i5) (hmem T.i5)).support ∧
      boundary T.i0 ∈ (F.classAt (boundary T.i5) (hmem T.i5)).support ∧
      boundary T.i2 ∈ (F.classAt (boundary T.i4) (hmem T.i4)).support ∧
      boundary T.i1 ∈ (F.classAt (boundary T.i4) (hmem T.i4)).support ∧
      boundary T.i2 ∈ (F.classAt (boundary T.i3) (hmem T.i3)).support ∧
      boundary T.i0 ∈ (F.classAt (boundary T.i3) (hmem T.i3)).support := by
    simpa [schemaAt, reflectSchema, p5TriangleBSchema,
      OrderedSix.values, rolePoint] using hschema
  exact false_of_p5TriangleB_reflected_fin11 hA hcard hinj himage hccw T
    (F.classAt (boundary T.i3) (hmem T.i3))
    (F.classAt (boundary T.i4) (hmem T.i4))
    (F.classAt (boundary T.i5) (hmem T.i5))
    hfields.2.2.2.2.2 hfields.2.2.2.2.1 hfields.2.2.2.1
    hfields.2.2.1 hfields.2.1 hfields.1

/-- Either manifest orientation of the executable p4 template is impossible. -/
theorem false_of_p4OrientedSchemaAt
    {A : Finset ℝ²} (hA : ConvexIndep A) (hcard : A.card = 11)
    (boundary : Label → ℝ²) (hmem : ∀ i, boundary i ∈ A)
    (hinj : Function.Injective boundary)
    (himage : Finset.univ.image boundary = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    (F : FaithfulCarrierPattern A) (T : OrderedEight)
    (hschema :
      orientedSchemaAt (patternCode boundary hmem F) T.values
        p4FourEndpointK2Schema = true) :
    False := by
  rw [orientedSchemaAt, Bool.or_eq_true] at hschema
  rcases hschema with hnormalized | hreflected
  · exact false_of_p4SchemaAt_normalized hA hcard boundary hmem
      hinj himage hccw F T hnormalized
  · apply false_of_p4SchemaAt_reflected hA hcard boundary hmem
      hinj himage hccw F T
    simpa [OrderedEight.values] using hreflected

/-- Either manifest orientation of the executable p5 four-row template is
impossible. -/
theorem false_of_p5FourRowOrientedSchemaAt
    {A : Finset ℝ²} (hA : ConvexIndep A) (hcard : A.card = 11)
    (boundary : Label → ℝ²) (hmem : ∀ i, boundary i ∈ A)
    (hinj : Function.Injective boundary)
    (himage : Finset.univ.image boundary = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    (F : FaithfulCarrierPattern A) (T : OrderedSix)
    (hschema :
      orientedSchemaAt (patternCode boundary hmem F) T.values
        p5TwoK1TwoK2Schema = true) :
    False := by
  rw [orientedSchemaAt, Bool.or_eq_true] at hschema
  rcases hschema with hnormalized | hreflected
  · exact false_of_p5FourRowSchemaAt_normalized hA hcard boundary hmem
      hinj himage hccw F T hnormalized
  · apply false_of_p5FourRowSchemaAt_reflected hA hcard boundary hmem
      hinj himage hccw F T
    simpa [OrderedSix.values] using hreflected

/-- Either manifest orientation of executable triangle A is impossible. -/
theorem false_of_p5TriangleAOrientedSchemaAt
    {A : Finset ℝ²} (hA : ConvexIndep A) (hcard : A.card = 11)
    (boundary : Label → ℝ²) (hmem : ∀ i, boundary i ∈ A)
    (hinj : Function.Injective boundary)
    (himage : Finset.univ.image boundary = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    (F : FaithfulCarrierPattern A) (T : OrderedSix)
    (hschema :
      orientedSchemaAt (patternCode boundary hmem F) T.values
        p5TriangleASchema = true) :
    False := by
  rw [orientedSchemaAt, Bool.or_eq_true] at hschema
  rcases hschema with hnormalized | hreflected
  · exact false_of_p5TriangleASchemaAt_normalized hA hcard boundary hmem
      hinj himage hccw F T hnormalized
  · apply false_of_p5TriangleASchemaAt_reflected hA hcard boundary hmem
      hinj himage hccw F T
    simpa [OrderedSix.values] using hreflected

/-- Either manifest orientation of executable triangle B is impossible. -/
theorem false_of_p5TriangleBOrientedSchemaAt
    {A : Finset ℝ²} (hA : ConvexIndep A) (hcard : A.card = 11)
    (boundary : Label → ℝ²) (hmem : ∀ i, boundary i ∈ A)
    (hinj : Function.Injective boundary)
    (himage : Finset.univ.image boundary = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    (F : FaithfulCarrierPattern A) (T : OrderedSix)
    (hschema :
      orientedSchemaAt (patternCode boundary hmem F) T.values
        p5TriangleBSchema = true) :
    False := by
  rw [orientedSchemaAt, Bool.or_eq_true] at hschema
  rcases hschema with hnormalized | hreflected
  · exact false_of_p5TriangleBSchemaAt_normalized hA hcard boundary hmem
      hinj himage hccw F T hnormalized
  · apply false_of_p5TriangleBSchemaAt_reflected hA hcard boundary hmem
      hinj himage hccw F T
    simpa [OrderedSix.values] using hreflected

#print axioms false_of_p4OrientedSchemaAt
#print axioms false_of_p5FourRowOrientedSchemaAt
#print axioms false_of_p5TriangleAOrientedSchemaAt
#print axioms false_of_p5TriangleBOrientedSchemaAt

end ATailUniqueFourExactTwoSchemaDecoderScratch
end Problem97
