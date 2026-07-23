/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import RetainedKalmansonDecoder
import CardElevenExactTwoBoundaryPackets

/-!
# Normalized retained schemas 5 and 8 on the p5 mirror boundary

The retained Kalmanson occurrence type stores schemas `5` and `8` only in
reflected role order.  Reversing the mirror boundary order sends those clauses
to the normalized schemas.  This file supplies the missing decreasing-order
Kalmanson consumers and a single exact-two mirror-packet ingress.

This is an occurrence consumer.  It does not prove that either normalized
schema occurs on the source surface.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace P5MirrorSchema58Scratch

open ATailCriticalPairFrontier
open ATailUniqueArmRouteAuditScratch
open ATailUniqueFourClassCapDistributionScratch
open ATailUniqueFourExactTwoBoundaryScratch
open ATailUniqueFourExactTwoSchemaDecoderScratch
open RetainedKalmansonDecoderScratch
open UniqueFourKalmansonReflectionScratch

attribute [local instance] Classical.propDecidable

private theorem support_dist_eq
    {A : Finset ℝ²} {center x y : ℝ²}
    (Row : SelectedFourClass A center)
    (hx : x ∈ Row.support) (hy : y ∈ Row.support) :
    dist center x = dist center y :=
  (Row.support_eq_radius _ hx).trans (Row.support_eq_radius _ hy).symm

/-- The endpoint schema-5 metric core when its roles are read in boundary
order opposite to the existing retained consumer. -/
private theorem false_of_endpoint_k1_four_selected_rows_of_decreasing
    {A : Finset ℝ²} (hA : ConvexIndep A)
    {boundary : Fin A.card → ℝ²}
    (hinj : Function.Injective boundary)
    (himage : Finset.univ.image boundary = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    {i0 i1 i2 i3 i4 : Fin A.card}
    (h01 : i0 < i1) (h12 : i1 < i2)
    (h23 : i2 < i3) (h34 : i3 < i4)
    (Row0 : SelectedFourClass A (boundary i0))
    (Row2 : SelectedFourClass A (boundary i2))
    (Row3 : SelectedFourClass A (boundary i3))
    (Row4 : SelectedFourClass A (boundary i4))
    (hi1_mem_Row0 : boundary i1 ∈ Row0.support)
    (hi2_mem_Row0 : boundary i2 ∈ Row0.support)
    (hi3_mem_Row2 : boundary i3 ∈ Row2.support)
    (hi4_mem_Row2 : boundary i4 ∈ Row2.support)
    (hi2_mem_Row3 : boundary i2 ∈ Row3.support)
    (hi4_mem_Row3 : boundary i4 ∈ Row3.support)
    (hi1_mem_Row4 : boundary i1 ∈ Row4.support)
    (hi3_mem_Row4 : boundary i3 ∈ Row4.support) :
    False := by
  have hrow0 :
      dist (boundary i0) (boundary i1) =
        dist (boundary i0) (boundary i2) :=
    support_dist_eq Row0 hi1_mem_Row0 hi2_mem_Row0
  have hrow2 :
      dist (boundary i2) (boundary i3) =
        dist (boundary i2) (boundary i4) :=
    support_dist_eq Row2 hi3_mem_Row2 hi4_mem_Row2
  have hrow3 :
      dist (boundary i3) (boundary i2) =
        dist (boundary i3) (boundary i4) :=
    support_dist_eq Row3 hi2_mem_Row3 hi4_mem_Row3
  have hrow4 :
      dist (boundary i4) (boundary i1) =
        dist (boundary i4) (boundary i3) :=
    support_dist_eq Row4 hi1_mem_Row4 hi3_mem_Row4
  have hkal :=
    complementary_dist_add_dist_lt_diagonal_sum_of_ccw_of_decreasing hA
      hinj himage hccw (h23.trans h34) h12 h01
  simp only [dist_comm] at hrow0 hrow2 hrow3 hrow4 hkal
  linarith

/-- The three-inequality schema-8 metric core when its roles are read in
boundary order opposite to the existing retained consumer. -/
private theorem false_of_three_endpoint_kalmanson_four_selected_rows_of_decreasing
    {A : Finset ℝ²} (hA : ConvexIndep A)
    {boundary : Fin A.card → ℝ²}
    (hinj : Function.Injective boundary)
    (himage : Finset.univ.image boundary = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    {i0 i1 i2 i3 i4 i5 i6 i7 : Fin A.card}
    (h01 : i0 < i1) (h12 : i1 < i2) (h23 : i2 < i3)
    (h34 : i3 < i4) (h45 : i4 < i5)
    (h56 : i5 < i6) (h67 : i6 < i7)
    (Row0 : SelectedFourClass A (boundary i0))
    (Row5 : SelectedFourClass A (boundary i5))
    (Row6 : SelectedFourClass A (boundary i6))
    (Row7 : SelectedFourClass A (boundary i7))
    (hi1_mem_Row0 : boundary i1 ∈ Row0.support)
    (hi2_mem_Row0 : boundary i2 ∈ Row0.support)
    (hi7_mem_Row0 : boundary i7 ∈ Row0.support)
    (hi1_mem_Row5 : boundary i1 ∈ Row5.support)
    (hi4_mem_Row5 : boundary i4 ∈ Row5.support)
    (hi6_mem_Row5 : boundary i6 ∈ Row5.support)
    (hi3_mem_Row6 : boundary i3 ∈ Row6.support)
    (hi4_mem_Row6 : boundary i4 ∈ Row6.support)
    (hi7_mem_Row6 : boundary i7 ∈ Row6.support)
    (hi2_mem_Row7 : boundary i2 ∈ Row7.support)
    (hi3_mem_Row7 : boundary i3 ∈ Row7.support)
    (hi6_mem_Row7 : boundary i6 ∈ Row7.support) :
    False := by
  have hrow76_3 :
      dist (boundary i7) (boundary i6) =
        dist (boundary i7) (boundary i3) :=
    support_dist_eq Row7 hi6_mem_Row7 hi3_mem_Row7
  have hrow76_2 :
      dist (boundary i7) (boundary i6) =
        dist (boundary i7) (boundary i2) :=
    support_dist_eq Row7 hi6_mem_Row7 hi2_mem_Row7
  have hrow67_4 :
      dist (boundary i7) (boundary i6) =
        dist (boundary i6) (boundary i4) := by
    calc
      dist (boundary i7) (boundary i6) =
          dist (boundary i6) (boundary i7) := dist_comm _ _
      _ = dist (boundary i6) (boundary i4) :=
        support_dist_eq Row6 hi7_mem_Row6 hi4_mem_Row6
  have hrow67_3 :
      dist (boundary i7) (boundary i6) =
        dist (boundary i6) (boundary i3) := by
    calc
      dist (boundary i7) (boundary i6) =
          dist (boundary i6) (boundary i7) := dist_comm _ _
      _ = dist (boundary i6) (boundary i3) :=
        support_dist_eq Row6 hi7_mem_Row6 hi3_mem_Row6
  have hrow65_4 :
      dist (boundary i6) (boundary i5) =
        dist (boundary i5) (boundary i4) := by
    calc
      dist (boundary i6) (boundary i5) =
          dist (boundary i5) (boundary i6) := dist_comm _ _
      _ = dist (boundary i5) (boundary i4) :=
        support_dist_eq Row5 hi6_mem_Row5 hi4_mem_Row5
  have hrow65_1 :
      dist (boundary i6) (boundary i5) =
        dist (boundary i5) (boundary i1) := by
    calc
      dist (boundary i6) (boundary i5) =
          dist (boundary i5) (boundary i6) := dist_comm _ _
      _ = dist (boundary i5) (boundary i1) :=
        support_dist_eq Row5 hi6_mem_Row5 hi1_mem_Row5
  have hrow70_2 :
      dist (boundary i7) (boundary i0) =
        dist (boundary i2) (boundary i0) := by
    calc
      dist (boundary i7) (boundary i0) =
          dist (boundary i0) (boundary i7) := dist_comm _ _
      _ = dist (boundary i0) (boundary i2) :=
        support_dist_eq Row0 hi7_mem_Row0 hi2_mem_Row0
      _ = dist (boundary i2) (boundary i0) := dist_comm _ _
  have hrow70_1 :
      dist (boundary i7) (boundary i0) =
        dist (boundary i1) (boundary i0) := by
    calc
      dist (boundary i7) (boundary i0) =
          dist (boundary i0) (boundary i7) := dist_comm _ _
      _ = dist (boundary i0) (boundary i1) :=
        support_dist_eq Row0 hi7_mem_Row0 hi1_mem_Row0
      _ = dist (boundary i1) (boundary i0) := dist_comm _ _
  have hkal2a :=
    dist_add_dist_lt_diagonal_sum_of_ccw_of_decreasing hA hinj himage hccw
      h67 (h34.trans (h45.trans h56)) (h12.trans h23)
  have hkal1 :=
    complementary_dist_add_dist_lt_diagonal_sum_of_ccw_of_decreasing hA
      hinj himage hccw
      (h23.trans (h34.trans (h45.trans (h56.trans h67)))) h12 h01
  have hkal2b :=
    dist_add_dist_lt_diagonal_sum_of_ccw_of_decreasing hA hinj himage hccw
      h56 h45 (h12.trans (h23.trans h34))
  linarith

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
  apply hccw <;> simpa

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

private theorem support_mem_of_schemaAt
    {A : Finset ℝ²} (boundary : Label → ℝ²)
    (hmem : ∀ i, boundary i ∈ A)
    (F : FaithfulCarrierPattern A)
    (targets : List Label) (schema : List Membership)
    (hschema : schemaAt (patternCode boundary hmem F) targets schema = true)
    {center point : Nat} (hpair : (center, point) ∈ schema) :
    boundary (rolePoint targets point) ∈
      (F.classAt (boundary (rolePoint targets center))
        (hmem (rolePoint targets center))).support := by
  have hall :
      ∀ membership ∈ schema,
        patternCode boundary hmem F
          (rolePoint targets membership.1)
          (rolePoint targets membership.2) = true := by
    simpa [schemaAt] using hschema
  exact (patternCode_eq_true_iff boundary hmem F _ _).mp
    (hall (center, point) hpair)

/-- A normalized retained schema-5 valuation contradicts convex position.
This is the boundary-reversed companion of the retained reflected terminal. -/
theorem false_of_schemaFive_normalized_at
    {A : Finset ℝ²} (hA : ConvexIndep A) (hcard : A.card = 11)
    (boundary : Label → ℝ²) (hmem : ∀ i, boundary i ∈ A)
    (hinj : Function.Injective boundary)
    (himage : Finset.univ.image boundary = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    (F : FaithfulCarrierPattern A) (T : OrderedFive)
    (hschema :
      schemaAt (patternCode boundary hmem F) T.values schema5 = true) :
    False := by
  let Row0 := F.classAt (boundary T.i0) (hmem T.i0)
  let Row2 := F.classAt (boundary T.i2) (hmem T.i2)
  let Row3 := F.classAt (boundary T.i3) (hmem T.i3)
  let Row4 := F.classAt (boundary T.i4) (hmem T.i4)
  have m (center point : Nat) (hpair : (center, point) ∈ schema5) :
      boundary (rolePoint T.values point) ∈
        (F.classAt (boundary (rolePoint T.values center))
          (hmem (rolePoint T.values center))).support :=
    support_mem_of_schemaAt boundary hmem F T.values schema5 hschema hpair
  apply false_of_endpoint_k1_four_selected_rows_of_decreasing hA
    (cardBoundary_injective hcard hinj)
    (cardBoundary_image hcard himage)
    (cardBoundary_ccw hcard hccw)
    (toCardIndex_lt hcard T.h01) (toCardIndex_lt hcard T.h12)
    (toCardIndex_lt hcard T.h23) (toCardIndex_lt hcard T.h34)
    Row0 Row2 Row3 Row4
  · simpa [Row0, OrderedFive.values, rolePoint] using
      m 0 1 (by simp [schema5])
  · simpa [Row0, OrderedFive.values, rolePoint] using
      m 0 2 (by simp [schema5])
  · simpa [Row2, OrderedFive.values, rolePoint] using
      m 2 3 (by simp [schema5])
  · simpa [Row2, OrderedFive.values, rolePoint] using
      m 2 4 (by simp [schema5])
  · simpa [Row3, OrderedFive.values, rolePoint] using
      m 3 2 (by simp [schema5])
  · simpa [Row3, OrderedFive.values, rolePoint] using
      m 3 4 (by simp [schema5])
  · simpa [Row4, OrderedFive.values, rolePoint] using
      m 4 1 (by simp [schema5])
  · simpa [Row4, OrderedFive.values, rolePoint] using
      m 4 3 (by simp [schema5])

/-- A normalized retained schema-8 valuation contradicts convex position.
This is the boundary-reversed companion of the retained reflected terminal. -/
theorem false_of_schemaEight_normalized_at
    {A : Finset ℝ²} (hA : ConvexIndep A) (hcard : A.card = 11)
    (boundary : Label → ℝ²) (hmem : ∀ i, boundary i ∈ A)
    (hinj : Function.Injective boundary)
    (himage : Finset.univ.image boundary = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    (F : FaithfulCarrierPattern A)
    (T : RetainedKalmansonDecoderScratch.OrderedEight)
    (hschema :
      schemaAt (patternCode boundary hmem F) T.values schema8 = true) :
    False := by
  let Row0 := F.classAt (boundary T.i0) (hmem T.i0)
  let Row5 := F.classAt (boundary T.i5) (hmem T.i5)
  let Row6 := F.classAt (boundary T.i6) (hmem T.i6)
  let Row7 := F.classAt (boundary T.i7) (hmem T.i7)
  have m (center point : Nat) (hpair : (center, point) ∈ schema8) :
      boundary (rolePoint T.values point) ∈
        (F.classAt (boundary (rolePoint T.values center))
          (hmem (rolePoint T.values center))).support :=
    support_mem_of_schemaAt boundary hmem F T.values schema8 hschema hpair
  apply false_of_three_endpoint_kalmanson_four_selected_rows_of_decreasing hA
    (cardBoundary_injective hcard hinj)
    (cardBoundary_image hcard himage)
    (cardBoundary_ccw hcard hccw)
    (toCardIndex_lt hcard T.h01) (toCardIndex_lt hcard T.h12)
    (toCardIndex_lt hcard T.h23) (toCardIndex_lt hcard T.h34)
    (toCardIndex_lt hcard T.h45) (toCardIndex_lt hcard T.h56)
    (toCardIndex_lt hcard T.h67) Row0 Row5 Row6 Row7
  · simpa [Row0, RetainedKalmansonDecoderScratch.OrderedEight.values,
      rolePoint] using
      m 0 1 (by simp [schema8])
  · simpa [Row0, RetainedKalmansonDecoderScratch.OrderedEight.values,
      rolePoint] using
      m 0 2 (by simp [schema8])
  · simpa [Row0, RetainedKalmansonDecoderScratch.OrderedEight.values,
      rolePoint] using
      m 0 7 (by simp [schema8])
  · simpa [Row5, RetainedKalmansonDecoderScratch.OrderedEight.values,
      rolePoint] using
      m 5 1 (by simp [schema8])
  · simpa [Row5, RetainedKalmansonDecoderScratch.OrderedEight.values,
      rolePoint] using
      m 5 4 (by simp [schema8])
  · simpa [Row5, RetainedKalmansonDecoderScratch.OrderedEight.values,
      rolePoint] using
      m 5 6 (by simp [schema8])
  · simpa [Row6, RetainedKalmansonDecoderScratch.OrderedEight.values,
      rolePoint] using
      m 6 3 (by simp [schema8])
  · simpa [Row6, RetainedKalmansonDecoderScratch.OrderedEight.values,
      rolePoint] using
      m 6 4 (by simp [schema8])
  · simpa [Row6, RetainedKalmansonDecoderScratch.OrderedEight.values,
      rolePoint] using
      m 6 7 (by simp [schema8])
  · simpa [Row7, RetainedKalmansonDecoderScratch.OrderedEight.values,
      rolePoint] using
      m 7 2 (by simp [schema8])
  · simpa [Row7, RetainedKalmansonDecoderScratch.OrderedEight.values,
      rolePoint] using
      m 7 3 (by simp [schema8])
  · simpa [Row7, RetainedKalmansonDecoderScratch.OrderedEight.values,
      rolePoint] using
      m 7 6 (by simp [schema8])

/-- The exact normalized occurrence surface introduced by reversing the
mirror-side retained schema-5/schema-8 clauses. -/
inductive NormalizedSchema58Occurrence
    (P : Census554.CapSelectedFiniteCode.PatternCode) : Type
  | schema5 (T : RetainedKalmansonDecoderScratch.OrderedFive)
      (hschema : schemaAt P T.values schema5 = true)
  | schema8 (T : RetainedKalmansonDecoderScratch.OrderedEight)
      (hschema : schemaAt P T.values schema8 = true)

namespace P5MirrorBoundaryPacket

/-- Every point in the exact-two packet boundary belongs to its carrier. -/
theorem boundary_mem
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    {R : OriginalUniqueFourResidual F}
    {profile : S.surplusCap.card = 5 ∧
      S.oppCap1.card = 5 ∧ S.oppCap2.card = 4}
    {distribution : ExactTwoStrictHitDistribution R}
    (Q : P5MirrorBoundaryPacket R profile distribution)
    (i : Label) :
    Q.core.boundary i ∈ D.A := by
  rw [← Q.core.boundary_image]
  exact Finset.mem_image.mpr ⟨i, Finset.mem_univ _, rfl⟩

/-- A p5 mirror exact-two packet refutes either normalized schema produced by
reversing the retained reflected schema-5/schema-8 occurrence surface. -/
theorem false_of_normalizedSchema58Occurrence
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    {R : OriginalUniqueFourResidual F}
    {profile : S.surplusCap.card = 5 ∧
      S.oppCap1.card = 5 ∧ S.oppCap2.card = 4}
    {distribution : ExactTwoStrictHitDistribution R}
    (Q : P5MirrorBoundaryPacket R profile distribution)
    (occ : NormalizedSchema58Occurrence
      (patternCode Q.core.boundary (boundary_mem Q)
        Q.core.carrierPattern)) :
    False := by
  have hcard : D.A.card = 11 := by
    have hsum := S.capSum
    omega
  cases occ with
  | schema5 T hschema =>
      exact false_of_schemaFive_normalized_at D.convex hcard
        Q.core.boundary (boundary_mem Q) Q.core.boundary_injective
        Q.core.boundary_image Q.core.boundary_ccw
        Q.core.carrierPattern T hschema
  | schema8 T hschema =>
      exact false_of_schemaEight_normalized_at D.convex hcard
        Q.core.boundary (boundary_mem Q) Q.core.boundary_injective
        Q.core.boundary_image Q.core.boundary_ccw
        Q.core.carrierPattern T hschema

end P5MirrorBoundaryPacket

#print axioms false_of_schemaFive_normalized_at
#print axioms false_of_schemaEight_normalized_at
#print axioms P5MirrorBoundaryPacket.false_of_normalizedSchema58Occurrence

end P5MirrorSchema58Scratch
end Problem97
