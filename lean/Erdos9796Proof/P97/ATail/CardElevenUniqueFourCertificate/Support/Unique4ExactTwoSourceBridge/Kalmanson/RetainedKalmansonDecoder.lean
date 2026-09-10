/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.Unique4ExactTwoSourceBridge.Kalmanson.MissingRetainedOrientations
import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.Unique4ExactTwoSchemaDecoder.ExactTwoSchemaDecoder
import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.Unique4AlignedP5Occurrence.AlignedP5FinElevenKalmanson

/-!
# Generic decoder for the reduced-core Kalmanson schema bank

This module records the ten exact schemas from
`kalmanson_schema_bank.kernel_only.json` and consumes every orientation that
actually occurs in the p5 reduced source core.  The decoder is deliberately an
occurrence terminal: it does not prove that a retained occurrence is forced.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace RetainedKalmansonDecoderScratch

open CapCrossingKalmansonBridge
open UniqueFourKalmansonCoresScratch
open ATailUniqueFourExactTwoSchemaDecoderScratch
open ATailAlignedP5FinElevenKalmansonScratch
open MissingRetainedKalmansonOrientationsScratch

/-- Supports the exact-two-source Kalmanson analysis. -/
structure OrderedFour where
  i0 : Label
  i1 : Label
  i2 : Label
  i3 : Label
  h01 : i0 < i1
  h12 : i1 < i2
  h23 : i2 < i3

/-- Supports the exact-two-source Kalmanson analysis. -/
def OrderedFour.values (T : OrderedFour) : List Label :=
  [T.i0, T.i1, T.i2, T.i3]

/-- Supports the exact-two-source Kalmanson analysis. -/
structure OrderedFive where
  i0 : Label
  i1 : Label
  i2 : Label
  i3 : Label
  i4 : Label
  h01 : i0 < i1
  h12 : i1 < i2
  h23 : i2 < i3
  h34 : i3 < i4

/-- Supports the exact-two-source Kalmanson analysis. -/
def OrderedFive.values (T : OrderedFive) : List Label :=
  [T.i0, T.i1, T.i2, T.i3, T.i4]

/-- Supports the exact-two-source Kalmanson analysis. -/
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

/-- Supports the exact-two-source Kalmanson analysis. -/
def OrderedSix.values (T : OrderedSix) : List Label :=
  [T.i0, T.i1, T.i2, T.i3, T.i4, T.i5]

/-- Supports the exact-two-source Kalmanson analysis. -/
structure OrderedSeven where
  i0 : Label
  i1 : Label
  i2 : Label
  i3 : Label
  i4 : Label
  i5 : Label
  i6 : Label
  h01 : i0 < i1
  h12 : i1 < i2
  h23 : i2 < i3
  h34 : i3 < i4
  h45 : i4 < i5
  h56 : i5 < i6

/-- Supports the exact-two-source Kalmanson analysis. -/
def OrderedSeven.values (T : OrderedSeven) : List Label :=
  [T.i0, T.i1, T.i2, T.i3, T.i4, T.i5, T.i6]

/-- Supports the exact-two-source Kalmanson analysis. -/
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

/-- Supports the exact-two-source Kalmanson analysis. -/
def OrderedEight.values (T : OrderedEight) : List Label :=
  [T.i0, T.i1, T.i2, T.i3, T.i4, T.i5, T.i6, T.i7]

/-- Supports the exact-two-source Kalmanson analysis. -/
def schema0 : List Membership :=
  [(0, 1), (0, 2), (4, 1), (4, 3), (5, 2), (5, 3)]

/-- Supports the exact-two-source Kalmanson analysis. -/
def schema1 : List Membership :=
  [(0, 1), (0, 3), (4, 2), (4, 3), (5, 1), (5, 2)]

/-- Supports the exact-two-source Kalmanson analysis. -/
def schema2 : List Membership :=
  [(0, 1), (0, 2), (1, 2), (1, 3), (2, 1), (2, 3)]

/-- Supports the exact-two-source Kalmanson analysis. -/
def schema3 : List Membership :=
  [(0, 1), (0, 5), (1, 0), (1, 2), (2, 0), (2, 1), (2, 5),
    (3, 0), (3, 2)]

/-- Supports the exact-two-source Kalmanson analysis. -/
def schema4 : List Membership :=
  [(0, 1), (0, 3), (2, 3), (2, 4), (3, 1), (3, 4)]

/-- Supports the exact-two-source Kalmanson analysis. -/
def schema5 : List Membership :=
  [(0, 1), (0, 2), (0, 4), (2, 3), (2, 4), (3, 2), (3, 4),
    (4, 1), (4, 3)]

/-- Supports the exact-two-source Kalmanson analysis. -/
def schema6 : List Membership :=
  [(0, 3), (0, 4), (1, 0), (1, 4), (2, 0), (2, 3)]

/-- Supports the exact-two-source Kalmanson analysis. -/
def schema7 : List Membership :=
  [(0, 1), (0, 5), (1, 0), (1, 3), (1, 4), (2, 0), (2, 5),
    (3, 1), (3, 4), (6, 0), (6, 3)]

/-- Supports the exact-two-source Kalmanson analysis. -/
def schema8 : List Membership :=
  [(0, 1), (0, 2), (0, 7), (5, 1), (5, 4), (5, 6), (6, 3),
    (6, 4), (6, 7), (7, 2), (7, 3), (7, 6)]

/-- Supports the exact-two-source Kalmanson analysis. -/
def schema9 : List Membership :=
  [(0, 1), (0, 3), (0, 5), (4, 1), (4, 2), (5, 2), (5, 3)]

/-- SHA-256 of the exact kernel-only ten-schema bank decoded above. -/
def kernelOnlyBankSha256 : String :=
  "26ccfafca4308a7415aa82fdc0cc32a4348363a9633c30663c181df8951c679e"

/-- SHA-256 of the full source bank named by the kernel-only bank manifest. -/
def sourceFullBankSha256 : String :=
  "04105ec974d7e15664d9addca6473329f71f943b14a0037dad9ce3560fcda4f3"

/-- SHA-256 of the reduced p5 input core used for the retained census. -/
def reducedCoreCnfSha256 : String :=
  "1532d4d1c6fb90d89ce14697728f18b9db8b37fce2acf2f5a3244ec42e25b7a8"

/-- SHA-256 of the clause-to-source map for the reduced p5 input core. -/
def reducedCoreMapSha256 : String :=
  "9c43ca5fadd445ba22bde5dc5617ea9414caf4df8c82de198706c6076ee51747"

/-- Supports the exact-two-source Kalmanson analysis. -/
private def cardBoundary {A : Finset ℝ²} (hcard : A.card = 11)
    (boundary : Label → ℝ²) : Fin A.card → ℝ² :=
  fun i => boundary (Fin.cast hcard i)

/-- Supports the exact-two-source Kalmanson analysis. -/
private theorem cardBoundary_injective
    {A : Finset ℝ²} (hcard : A.card = 11)
    {boundary : Label → ℝ²} (hinj : Function.Injective boundary) :
    Function.Injective (cardBoundary hcard boundary) := by
  intro i j hij
  apply Fin.cast_injective hcard
  exact hinj hij

/-- Supports the exact-two-source Kalmanson analysis. -/
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

/-- Supports the exact-two-source Kalmanson analysis. -/
private theorem cardBoundary_ccw
    {A : Finset ℝ²} (hcard : A.card = 11)
    {boundary : Label → ℝ²}
    (hccw : EuclideanGeometry.IsCcwConvexPolygon boundary) :
    EuclideanGeometry.IsCcwConvexPolygon (cardBoundary hcard boundary) := by
  intro i j k hij hjk
  apply hccw <;> simpa

/-- Supports the exact-two-source Kalmanson analysis. -/
private def toCardIndex {A : Finset ℝ²} (hcard : A.card = 11)
    (i : Label) : Fin A.card :=
  Fin.cast hcard.symm i

/-- P97 ATail support RetainedKalmansonDecoder theorem. -/
@[simp] private theorem cardBoundary_toCardIndex
    {A : Finset ℝ²} (hcard : A.card = 11)
    (boundary : Label → ℝ²) (i : Label) :
    cardBoundary hcard boundary (toCardIndex hcard i) = boundary i := by
  simp [cardBoundary, toCardIndex]

/-- Supports the exact-two-source Kalmanson analysis. -/
private theorem toCardIndex_lt
    {A : Finset ℝ²} (hcard : A.card = 11)
    {i j : Label} (hij : i < j) :
    toCardIndex hcard i < toCardIndex hcard j := by
  simpa [toCardIndex] using hij

/-- Supports the exact-two-source Kalmanson analysis. -/
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

/-- Supports the exact-two-source Kalmanson analysis. -/
private theorem false_of_schemaZero_normalized_at
    {A : Finset ℝ²} (hA : ConvexIndep A) (hcard : A.card = 11)
    (boundary : Label → ℝ²) (hmem : ∀ i, boundary i ∈ A)
    (hinj : Function.Injective boundary)
    (himage : Finset.univ.image boundary = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    (F : FaithfulCarrierPattern A)
    (T : OrderedSix)
    (hschema :
      schemaAt (patternCode boundary hmem F) T.values schema0 = true) :
    False := by
  let Row0 := F.classAt (boundary T.i0) (hmem T.i0)
  let Row4 := F.classAt (boundary T.i4) (hmem T.i4)
  let Row5 := F.classAt (boundary T.i5) (hmem T.i5)
  have m (center point : Nat) (hpair : (center, point) ∈ schema0) :
      boundary (rolePoint T.values point) ∈
        (F.classAt (boundary (rolePoint T.values center))
          (hmem (rolePoint T.values center))).support :=
    support_mem_of_schemaAt boundary hmem F T.values schema0 hschema hpair
  apply false_of_schemaZero_normalized hA
    (cardBoundary_injective hcard hinj)
    (cardBoundary_image hcard himage)
    (cardBoundary_ccw hcard hccw)
    (toCardIndex_lt hcard T.h01) (toCardIndex_lt hcard T.h12)
    (toCardIndex_lt hcard T.h23) (toCardIndex_lt hcard T.h34)
    (toCardIndex_lt hcard T.h45) Row0 Row4 Row5
  · exact m 0 1 (by simp [schema0])
  · exact m 0 2 (by simp [schema0])
  · exact m 4 1 (by simp [schema0])
  · exact m 4 3 (by simp [schema0])
  · exact m 5 2 (by simp [schema0])
  · exact m 5 3 (by simp [schema0])

/-- Supports the exact-two-source Kalmanson analysis. -/
private theorem false_of_schemaZero_reflected_at
    {A : Finset ℝ²} (hA : ConvexIndep A) (hcard : A.card = 11)
    (boundary : Label → ℝ²) (hmem : ∀ i, boundary i ∈ A)
    (hinj : Function.Injective boundary)
    (himage : Finset.univ.image boundary = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    (F : FaithfulCarrierPattern A) (T : OrderedSix)
    (hschema : schemaAt (patternCode boundary hmem F) T.values
      (reflectSchema 6 schema0) = true) :
    False := by
  let Row0 := F.classAt (boundary T.i0) (hmem T.i0)
  let Row1 := F.classAt (boundary T.i1) (hmem T.i1)
  let Row5 := F.classAt (boundary T.i5) (hmem T.i5)
  have m (center point : Nat)
      (hpair : (center, point) ∈ reflectSchema 6 schema0) :
      boundary (rolePoint T.values point) ∈
        (F.classAt (boundary (rolePoint T.values center))
          (hmem (rolePoint T.values center))).support :=
    support_mem_of_schemaAt boundary hmem F T.values
      (reflectSchema 6 schema0) hschema hpair
  apply false_of_endpoint_k2_endpoint_k1_three_selected_rows hA
    (cardBoundary_injective hcard hinj)
    (cardBoundary_image hcard himage)
    (cardBoundary_ccw hcard hccw)
    (toCardIndex_lt hcard T.h01) (toCardIndex_lt hcard T.h12)
    (toCardIndex_lt hcard T.h23) (toCardIndex_lt hcard T.h34)
    (toCardIndex_lt hcard T.h45) Row0 Row1 Row5
  · exact m 0 2 (by simp [schema0, reflectSchema])
  · exact m 0 3 (by simp [schema0, reflectSchema])
  · exact m 1 2 (by simp [schema0, reflectSchema])
  · exact m 1 4 (by simp [schema0, reflectSchema])
  · exact m 5 3 (by simp [schema0, reflectSchema])
  · exact m 5 4 (by simp [schema0, reflectSchema])

/-- Supports the exact-two-source Kalmanson analysis. -/
private theorem false_of_schemaOne_normalized_at
    {A : Finset ℝ²} (hA : ConvexIndep A) (hcard : A.card = 11)
    (boundary : Label → ℝ²) (hmem : ∀ i, boundary i ∈ A)
    (hinj : Function.Injective boundary)
    (himage : Finset.univ.image boundary = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    (F : FaithfulCarrierPattern A) (T : OrderedSix)
    (hschema : schemaAt (patternCode boundary hmem F) T.values schema1 = true) :
    False := by
  let Row0 := F.classAt (boundary T.i0) (hmem T.i0)
  let Row4 := F.classAt (boundary T.i4) (hmem T.i4)
  let Row5 := F.classAt (boundary T.i5) (hmem T.i5)
  have m (center point : Nat) (hpair : (center, point) ∈ schema1) :
      boundary (rolePoint T.values point) ∈
        (F.classAt (boundary (rolePoint T.values center))
          (hmem (rolePoint T.values center))).support :=
    support_mem_of_schemaAt boundary hmem F T.values schema1 hschema hpair
  apply false_of_schemaOne_normalized_fin11 hA hcard hinj himage hccw
    T.h01 T.h12 T.h23 T.h34 T.h45 Row0 Row4 Row5
  · exact m 0 1 (by simp [schema1])
  · exact m 0 3 (by simp [schema1])
  · exact m 4 2 (by simp [schema1])
  · exact m 4 3 (by simp [schema1])
  · exact m 5 1 (by simp [schema1])
  · exact m 5 2 (by simp [schema1])

/-- Supports the exact-two-source Kalmanson analysis. -/
private theorem false_of_schemaOne_reflected_at
    {A : Finset ℝ²} (hA : ConvexIndep A) (hcard : A.card = 11)
    (boundary : Label → ℝ²) (hmem : ∀ i, boundary i ∈ A)
    (hinj : Function.Injective boundary)
    (himage : Finset.univ.image boundary = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    (F : FaithfulCarrierPattern A) (T : OrderedSix)
    (hschema : schemaAt (patternCode boundary hmem F) T.values
      (reflectSchema 6 schema1) = true) :
    False := by
  let Row0 := F.classAt (boundary T.i0) (hmem T.i0)
  let Row1 := F.classAt (boundary T.i1) (hmem T.i1)
  let Row5 := F.classAt (boundary T.i5) (hmem T.i5)
  have m (center point : Nat)
      (hpair : (center, point) ∈ reflectSchema 6 schema1) :
      boundary (rolePoint T.values point) ∈
        (F.classAt (boundary (rolePoint T.values center))
          (hmem (rolePoint T.values center))).support :=
    support_mem_of_schemaAt boundary hmem F T.values
      (reflectSchema 6 schema1) hschema hpair
  apply false_of_schemaOne_reflected_fin11 hA hcard hinj himage hccw
    T.h01 T.h12 T.h23 T.h34 T.h45 Row0 Row1 Row5
  · exact m 0 3 (by simp [schema1, reflectSchema])
  · exact m 0 4 (by simp [schema1, reflectSchema])
  · exact m 1 2 (by simp [schema1, reflectSchema])
  · exact m 1 3 (by simp [schema1, reflectSchema])
  · exact m 5 2 (by simp [schema1, reflectSchema])
  · exact m 5 4 (by simp [schema1, reflectSchema])

/-- Supports the exact-two-source Kalmanson analysis. -/
private theorem false_of_schemaTwo_normalized_at
    {A : Finset ℝ²} (hA : ConvexIndep A) (hcard : A.card = 11)
    (boundary : Label → ℝ²) (hmem : ∀ i, boundary i ∈ A)
    (hinj : Function.Injective boundary)
    (himage : Finset.univ.image boundary = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    (F : FaithfulCarrierPattern A) (T : OrderedFour)
    (hschema : schemaAt (patternCode boundary hmem F) T.values schema2 = true) :
    False := by
  let Row0 := F.classAt (boundary T.i0) (hmem T.i0)
  let Row1 := F.classAt (boundary T.i1) (hmem T.i1)
  let Row2 := F.classAt (boundary T.i2) (hmem T.i2)
  have m (center point : Nat) (hpair : (center, point) ∈ schema2) :
      boundary (rolePoint T.values point) ∈
        (F.classAt (boundary (rolePoint T.values center))
          (hmem (rolePoint T.values center))).support :=
    support_mem_of_schemaAt boundary hmem F T.values schema2 hschema hpair
  apply false_of_schemaTwo_normalized hA
    (cardBoundary_injective hcard hinj)
    (cardBoundary_image hcard himage)
    (cardBoundary_ccw hcard hccw)
    (toCardIndex_lt hcard T.h01) (toCardIndex_lt hcard T.h12)
    (toCardIndex_lt hcard T.h23) Row0 Row1 Row2
  · exact m 0 1 (by simp [schema2])
  · exact m 0 2 (by simp [schema2])
  · exact m 1 2 (by simp [schema2])
  · exact m 1 3 (by simp [schema2])
  · exact m 2 1 (by simp [schema2])
  · exact m 2 3 (by simp [schema2])

/-- Supports the exact-two-source Kalmanson analysis. -/
private theorem false_of_schemaTwo_reflected_at
    {A : Finset ℝ²} (hA : ConvexIndep A) (hcard : A.card = 11)
    (boundary : Label → ℝ²) (hmem : ∀ i, boundary i ∈ A)
    (hinj : Function.Injective boundary)
    (himage : Finset.univ.image boundary = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    (F : FaithfulCarrierPattern A) (T : OrderedFour)
    (hschema : schemaAt (patternCode boundary hmem F) T.values
      (reflectSchema 4 schema2) = true) :
    False := by
  let Row1 := F.classAt (boundary T.i1) (hmem T.i1)
  let Row2 := F.classAt (boundary T.i2) (hmem T.i2)
  let Row3 := F.classAt (boundary T.i3) (hmem T.i3)
  have m (center point : Nat)
      (hpair : (center, point) ∈ reflectSchema 4 schema2) :
      boundary (rolePoint T.values point) ∈
        (F.classAt (boundary (rolePoint T.values center))
          (hmem (rolePoint T.values center))).support :=
    support_mem_of_schemaAt boundary hmem F T.values
      (reflectSchema 4 schema2) hschema hpair
  apply false_of_one_k1_three_cyclic_selected_rows hA
    (cardBoundary_injective hcard hinj)
    (cardBoundary_image hcard himage)
    (cardBoundary_ccw hcard hccw)
    (toCardIndex_lt hcard T.h01) (toCardIndex_lt hcard T.h12)
    (toCardIndex_lt hcard T.h23) Row1 Row2 Row3
  · exact m 1 0 (by simp [schema2, reflectSchema])
  · exact m 1 2 (by simp [schema2, reflectSchema])
  · exact m 2 0 (by simp [schema2, reflectSchema])
  · exact m 2 1 (by simp [schema2, reflectSchema])
  · exact m 3 1 (by simp [schema2, reflectSchema])
  · exact m 3 2 (by simp [schema2, reflectSchema])

/-- Supports the exact-two-source Kalmanson analysis. -/
private theorem false_of_schemaThree_normalized_at
    {A : Finset ℝ²} (hA : ConvexIndep A) (hcard : A.card = 11)
    (boundary : Label → ℝ²) (hmem : ∀ i, boundary i ∈ A)
    (hinj : Function.Injective boundary)
    (himage : Finset.univ.image boundary = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    (F : FaithfulCarrierPattern A) (T : OrderedSix)
    (hschema : schemaAt (patternCode boundary hmem F) T.values schema3 = true) :
    False := by
  let Row0 := F.classAt (boundary T.i0) (hmem T.i0)
  let Row1 := F.classAt (boundary T.i1) (hmem T.i1)
  let Row2 := F.classAt (boundary T.i2) (hmem T.i2)
  let Row3 := F.classAt (boundary T.i3) (hmem T.i3)
  have m (center point : Nat) (hpair : (center, point) ∈ schema3) :
      boundary (rolePoint T.values point) ∈
        (F.classAt (boundary (rolePoint T.values center))
          (hmem (rolePoint T.values center))).support :=
    support_mem_of_schemaAt boundary hmem F T.values schema3 hschema hpair
  apply false_of_four_k2_five_selected_row_equalities hA
    (cardBoundary_injective hcard hinj)
    (cardBoundary_image hcard himage)
    (cardBoundary_ccw hcard hccw)
    (toCardIndex_lt hcard T.h01) (toCardIndex_lt hcard T.h12)
    (toCardIndex_lt hcard T.h23) (toCardIndex_lt hcard T.h34)
    (toCardIndex_lt hcard T.h45) Row0 Row1 Row2 Row3
  · exact m 0 1 (by simp [schema3])
  · exact m 0 5 (by simp [schema3])
  · exact m 1 0 (by simp [schema3])
  · exact m 1 2 (by simp [schema3])
  · exact m 2 0 (by simp [schema3])
  · exact m 2 1 (by simp [schema3])
  · exact m 2 5 (by simp [schema3])
  · exact m 3 0 (by simp [schema3])
  · exact m 3 2 (by simp [schema3])

/-- Supports the exact-two-source Kalmanson analysis. -/
private theorem false_of_schemaThree_reflected_at
    {A : Finset ℝ²} (hA : ConvexIndep A) (hcard : A.card = 11)
    (boundary : Label → ℝ²) (hmem : ∀ i, boundary i ∈ A)
    (hinj : Function.Injective boundary)
    (himage : Finset.univ.image boundary = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    (F : FaithfulCarrierPattern A) (T : OrderedSix)
    (hschema : schemaAt (patternCode boundary hmem F) T.values
      (reflectSchema 6 schema3) = true) :
    False := by
  let Row2 := F.classAt (boundary T.i2) (hmem T.i2)
  let Row3 := F.classAt (boundary T.i3) (hmem T.i3)
  let Row4 := F.classAt (boundary T.i4) (hmem T.i4)
  let Row5 := F.classAt (boundary T.i5) (hmem T.i5)
  have m (center point : Nat)
      (hpair : (center, point) ∈ reflectSchema 6 schema3) :
      boundary (rolePoint T.values point) ∈
        (F.classAt (boundary (rolePoint T.values center))
          (hmem (rolePoint T.values center))).support :=
    support_mem_of_schemaAt boundary hmem F T.values
      (reflectSchema 6 schema3) hschema hpair
  apply false_of_schemaThree_reflected hA
    (cardBoundary_injective hcard hinj)
    (cardBoundary_image hcard himage)
    (cardBoundary_ccw hcard hccw)
    (toCardIndex_lt hcard T.h01) (toCardIndex_lt hcard T.h12)
    (toCardIndex_lt hcard T.h23) (toCardIndex_lt hcard T.h34)
    (toCardIndex_lt hcard T.h45) Row2 Row3 Row4 Row5
  · exact m 2 3 (by simp [schema3, reflectSchema])
  · exact m 2 5 (by simp [schema3, reflectSchema])
  · exact m 3 0 (by simp [schema3, reflectSchema])
  · exact m 3 4 (by simp [schema3, reflectSchema])
  · exact m 3 5 (by simp [schema3, reflectSchema])
  · exact m 4 3 (by simp [schema3, reflectSchema])
  · exact m 4 5 (by simp [schema3, reflectSchema])
  · exact m 5 0 (by simp [schema3, reflectSchema])
  · exact m 5 4 (by simp [schema3, reflectSchema])

/-- Supports the exact-two-source Kalmanson analysis. -/
private theorem false_of_schemaFour_normalized_at
    {A : Finset ℝ²} (hA : ConvexIndep A) (hcard : A.card = 11)
    (boundary : Label → ℝ²) (hmem : ∀ i, boundary i ∈ A)
    (hinj : Function.Injective boundary)
    (himage : Finset.univ.image boundary = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    (F : FaithfulCarrierPattern A) (T : OrderedFive)
    (hschema : schemaAt (patternCode boundary hmem F) T.values schema4 = true) :
    False := by
  let Row0 := F.classAt (boundary T.i0) (hmem T.i0)
  let Row2 := F.classAt (boundary T.i2) (hmem T.i2)
  let Row3 := F.classAt (boundary T.i3) (hmem T.i3)
  have m (center point : Nat) (hpair : (center, point) ∈ schema4) :
      boundary (rolePoint T.values point) ∈
        (F.classAt (boundary (rolePoint T.values center))
          (hmem (rolePoint T.values center))).support :=
    support_mem_of_schemaAt boundary hmem F T.values schema4 hschema hpair
  apply false_of_schemaFour_normalized_fin11 hA hcard hinj himage hccw
    T.h01 T.h12 T.h23 T.h34 Row0 Row2 Row3
  · exact m 0 1 (by simp [schema4])
  · exact m 0 3 (by simp [schema4])
  · exact m 2 3 (by simp [schema4])
  · exact m 2 4 (by simp [schema4])
  · exact m 3 1 (by simp [schema4])
  · exact m 3 4 (by simp [schema4])

/-- Supports the exact-two-source Kalmanson analysis. -/
private theorem false_of_schemaFour_reflected_at
    {A : Finset ℝ²} (hA : ConvexIndep A) (hcard : A.card = 11)
    (boundary : Label → ℝ²) (hmem : ∀ i, boundary i ∈ A)
    (hinj : Function.Injective boundary)
    (himage : Finset.univ.image boundary = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    (F : FaithfulCarrierPattern A) (T : OrderedFive)
    (hschema : schemaAt (patternCode boundary hmem F) T.values
      (reflectSchema 5 schema4) = true) :
    False := by
  let Row1 := F.classAt (boundary T.i1) (hmem T.i1)
  let Row2 := F.classAt (boundary T.i2) (hmem T.i2)
  let Row4 := F.classAt (boundary T.i4) (hmem T.i4)
  have m (center point : Nat)
      (hpair : (center, point) ∈ reflectSchema 5 schema4) :
      boundary (rolePoint T.values point) ∈
        (F.classAt (boundary (rolePoint T.values center))
          (hmem (rolePoint T.values center))).support :=
    support_mem_of_schemaAt boundary hmem F T.values
      (reflectSchema 5 schema4) hschema hpair
  apply false_of_schemaFour_reflected_fin11 hA hcard hinj himage hccw
    T.h01 T.h12 T.h23 T.h34 Row1 Row2 Row4
  · exact m 1 0 (by simp [schema4, reflectSchema])
  · exact m 1 3 (by simp [schema4, reflectSchema])
  · exact m 2 0 (by simp [schema4, reflectSchema])
  · exact m 2 1 (by simp [schema4, reflectSchema])
  · exact m 4 1 (by simp [schema4, reflectSchema])
  · exact m 4 3 (by simp [schema4, reflectSchema])

/-- Supports the exact-two-source Kalmanson analysis. -/
private theorem false_of_schemaFive_reflected_at
    {A : Finset ℝ²} (hA : ConvexIndep A) (hcard : A.card = 11)
    (boundary : Label → ℝ²) (hmem : ∀ i, boundary i ∈ A)
    (hinj : Function.Injective boundary)
    (himage : Finset.univ.image boundary = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    (F : FaithfulCarrierPattern A) (T : OrderedFive)
    (hschema : schemaAt (patternCode boundary hmem F) T.values
      (reflectSchema 5 schema5) = true) :
    False := by
  let Row0 := F.classAt (boundary T.i0) (hmem T.i0)
  let Row1 := F.classAt (boundary T.i1) (hmem T.i1)
  let Row2 := F.classAt (boundary T.i2) (hmem T.i2)
  let Row4 := F.classAt (boundary T.i4) (hmem T.i4)
  have m (center point : Nat)
      (hpair : (center, point) ∈ reflectSchema 5 schema5) :
      boundary (rolePoint T.values point) ∈
        (F.classAt (boundary (rolePoint T.values center))
          (hmem (rolePoint T.values center))).support :=
    support_mem_of_schemaAt boundary hmem F T.values
      (reflectSchema 5 schema5) hschema hpair
  apply false_of_endpoint_k1_four_selected_rows hA
    (cardBoundary_injective hcard hinj)
    (cardBoundary_image hcard himage)
    (cardBoundary_ccw hcard hccw)
    (toCardIndex_lt hcard T.h01) (toCardIndex_lt hcard T.h12)
    (toCardIndex_lt hcard T.h23) (toCardIndex_lt hcard T.h34)
    Row0 Row1 Row2 Row4
  · exact m 0 1 (by simp [schema5, reflectSchema])
  · exact m 0 3 (by simp [schema5, reflectSchema])
  · exact m 1 0 (by simp [schema5, reflectSchema])
  · exact m 1 2 (by simp [schema5, reflectSchema])
  · exact m 2 0 (by simp [schema5, reflectSchema])
  · exact m 2 1 (by simp [schema5, reflectSchema])
  · exact m 4 0 (by simp [schema5, reflectSchema])
  · exact m 4 2 (by simp [schema5, reflectSchema])
  · exact m 4 3 (by simp [schema5, reflectSchema])

/-- Supports the exact-two-source Kalmanson analysis. -/
private theorem false_of_schemaSix_normalized_at
    {A : Finset ℝ²} (hA : ConvexIndep A) (hcard : A.card = 11)
    (boundary : Label → ℝ²) (hmem : ∀ i, boundary i ∈ A)
    (hinj : Function.Injective boundary)
    (himage : Finset.univ.image boundary = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    (F : FaithfulCarrierPattern A) (T : OrderedSix)
    (hschema : schemaAt (patternCode boundary hmem F) T.values schema6 = true) :
    False := by
  let Row0 := F.classAt (boundary T.i0) (hmem T.i0)
  let Row1 := F.classAt (boundary T.i1) (hmem T.i1)
  let Row2 := F.classAt (boundary T.i2) (hmem T.i2)
  have m (center point : Nat) (hpair : (center, point) ∈ schema6) :
      boundary (rolePoint T.values point) ∈
        (F.classAt (boundary (rolePoint T.values center))
          (hmem (rolePoint T.values center))).support :=
    support_mem_of_schemaAt boundary hmem F T.values schema6 hschema hpair
  apply false_of_schemaSix_normalized_fin11 hA hcard hinj himage hccw
    T.h01 T.h12 T.h23 T.h34 T.h45 Row0 Row1 Row2
  · exact m 0 3 (by simp [schema6])
  · exact m 0 4 (by simp [schema6])
  · exact m 1 0 (by simp [schema6])
  · exact m 1 4 (by simp [schema6])
  · exact m 2 0 (by simp [schema6])
  · exact m 2 3 (by simp [schema6])

/-- Supports the exact-two-source Kalmanson analysis. -/
private theorem false_of_schemaSix_reflected_at
    {A : Finset ℝ²} (hA : ConvexIndep A) (hcard : A.card = 11)
    (boundary : Label → ℝ²) (hmem : ∀ i, boundary i ∈ A)
    (hinj : Function.Injective boundary)
    (himage : Finset.univ.image boundary = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    (F : FaithfulCarrierPattern A) (T : OrderedSix)
    (hschema : schemaAt (patternCode boundary hmem F) T.values
      (reflectSchema 6 schema6) = true) :
    False := by
  let Row3 := F.classAt (boundary T.i3) (hmem T.i3)
  let Row4 := F.classAt (boundary T.i4) (hmem T.i4)
  let Row5 := F.classAt (boundary T.i5) (hmem T.i5)
  have m (center point : Nat)
      (hpair : (center, point) ∈ reflectSchema 6 schema6) :
      boundary (rolePoint T.values point) ∈
        (F.classAt (boundary (rolePoint T.values center))
          (hmem (rolePoint T.values center))).support :=
    support_mem_of_schemaAt boundary hmem F T.values
      (reflectSchema 6 schema6) hschema hpair
  apply false_of_schemaSix_reflected_fin11 hA hcard hinj himage hccw
    T.h01 T.h12 T.h23 T.h34 T.h45 Row3 Row4 Row5
  · exact m 3 2 (by simp [schema6, reflectSchema])
  · exact m 3 5 (by simp [schema6, reflectSchema])
  · exact m 4 1 (by simp [schema6, reflectSchema])
  · exact m 4 5 (by simp [schema6, reflectSchema])
  · exact m 5 1 (by simp [schema6, reflectSchema])
  · exact m 5 2 (by simp [schema6, reflectSchema])

/-- Supports the exact-two-source Kalmanson analysis. -/
private theorem false_of_schemaSeven_normalized_at
    {A : Finset ℝ²} (hA : ConvexIndep A) (hcard : A.card = 11)
    (boundary : Label → ℝ²) (hmem : ∀ i, boundary i ∈ A)
    (hinj : Function.Injective boundary)
    (himage : Finset.univ.image boundary = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    (F : FaithfulCarrierPattern A) (T : OrderedSeven)
    (hschema : schemaAt (patternCode boundary hmem F) T.values schema7 = true) :
    False := by
  let Row0 := F.classAt (boundary T.i0) (hmem T.i0)
  let Row1 := F.classAt (boundary T.i1) (hmem T.i1)
  let Row2 := F.classAt (boundary T.i2) (hmem T.i2)
  let Row3 := F.classAt (boundary T.i3) (hmem T.i3)
  let Row6 := F.classAt (boundary T.i6) (hmem T.i6)
  have m (center point : Nat) (hpair : (center, point) ∈ schema7) :
      boundary (rolePoint T.values point) ∈
        (F.classAt (boundary (rolePoint T.values center))
          (hmem (rolePoint T.values center))).support :=
    support_mem_of_schemaAt boundary hmem F T.values schema7 hschema hpair
  apply false_of_roundTwoFour_endpoint_rows hA
    (cardBoundary_injective hcard hinj)
    (cardBoundary_image hcard himage)
    (cardBoundary_ccw hcard hccw)
    (toCardIndex_lt hcard T.h01) (toCardIndex_lt hcard T.h12)
    (toCardIndex_lt hcard T.h23) (toCardIndex_lt hcard T.h34)
    (toCardIndex_lt hcard T.h45) (toCardIndex_lt hcard T.h56)
    Row0 Row1 Row2 Row3 Row6
  · exact m 0 1 (by simp [schema7])
  · exact m 0 5 (by simp [schema7])
  · exact m 1 0 (by simp [schema7])
  · exact m 1 3 (by simp [schema7])
  · exact m 1 4 (by simp [schema7])
  · exact m 2 0 (by simp [schema7])
  · exact m 2 5 (by simp [schema7])
  · exact m 3 1 (by simp [schema7])
  · exact m 3 4 (by simp [schema7])
  · exact m 6 0 (by simp [schema7])
  · exact m 6 3 (by simp [schema7])

/-- Supports the exact-two-source Kalmanson analysis. -/
private theorem false_of_schemaSeven_reflected_at
    {A : Finset ℝ²} (hA : ConvexIndep A) (hcard : A.card = 11)
    (boundary : Label → ℝ²) (hmem : ∀ i, boundary i ∈ A)
    (hinj : Function.Injective boundary)
    (himage : Finset.univ.image boundary = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    (F : FaithfulCarrierPattern A) (T : OrderedSeven)
    (hschema : schemaAt (patternCode boundary hmem F) T.values
      (reflectSchema 7 schema7) = true) :
    False := by
  let Row0 := F.classAt (boundary T.i0) (hmem T.i0)
  let Row3 := F.classAt (boundary T.i3) (hmem T.i3)
  let Row4 := F.classAt (boundary T.i4) (hmem T.i4)
  let Row5 := F.classAt (boundary T.i5) (hmem T.i5)
  let Row6 := F.classAt (boundary T.i6) (hmem T.i6)
  have m (center point : Nat)
      (hpair : (center, point) ∈ reflectSchema 7 schema7) :
      boundary (rolePoint T.values point) ∈
        (F.classAt (boundary (rolePoint T.values center))
          (hmem (rolePoint T.values center))).support :=
    support_mem_of_schemaAt boundary hmem F T.values
      (reflectSchema 7 schema7) hschema hpair
  apply false_of_schemaSeven_reflected hA
    (cardBoundary_injective hcard hinj)
    (cardBoundary_image hcard himage)
    (cardBoundary_ccw hcard hccw)
    (toCardIndex_lt hcard T.h01) (toCardIndex_lt hcard T.h12)
    (toCardIndex_lt hcard T.h23) (toCardIndex_lt hcard T.h34)
    (toCardIndex_lt hcard T.h45) (toCardIndex_lt hcard T.h56)
    Row0 Row3 Row4 Row5 Row6
  · exact m 0 3 (by simp [schema7, reflectSchema])
  · exact m 0 6 (by simp [schema7, reflectSchema])
  · exact m 3 2 (by simp [schema7, reflectSchema])
  · exact m 3 5 (by simp [schema7, reflectSchema])
  · exact m 4 1 (by simp [schema7, reflectSchema])
  · exact m 4 6 (by simp [schema7, reflectSchema])
  · exact m 5 2 (by simp [schema7, reflectSchema])
  · exact m 5 3 (by simp [schema7, reflectSchema])
  · exact m 5 6 (by simp [schema7, reflectSchema])
  · exact m 6 1 (by simp [schema7, reflectSchema])
  · exact m 6 5 (by simp [schema7, reflectSchema])

/-- Supports the exact-two-source Kalmanson analysis. -/
private theorem false_of_schemaEight_reflected_at
    {A : Finset ℝ²} (hA : ConvexIndep A) (hcard : A.card = 11)
    (boundary : Label → ℝ²) (hmem : ∀ i, boundary i ∈ A)
    (hinj : Function.Injective boundary)
    (himage : Finset.univ.image boundary = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    (F : FaithfulCarrierPattern A) (T : OrderedEight)
    (hschema : schemaAt (patternCode boundary hmem F) T.values
      (reflectSchema 8 schema8) = true) :
    False := by
  let Row0 := F.classAt (boundary T.i0) (hmem T.i0)
  let Row1 := F.classAt (boundary T.i1) (hmem T.i1)
  let Row2 := F.classAt (boundary T.i2) (hmem T.i2)
  let Row7 := F.classAt (boundary T.i7) (hmem T.i7)
  have m (center point : Nat)
      (hpair : (center, point) ∈ reflectSchema 8 schema8) :
      boundary (rolePoint T.values point) ∈
        (F.classAt (boundary (rolePoint T.values center))
          (hmem (rolePoint T.values center))).support :=
    support_mem_of_schemaAt boundary hmem F T.values
      (reflectSchema 8 schema8) hschema hpair
  apply false_of_three_endpoint_kalmanson_four_selected_rows hA
    (cardBoundary_injective hcard hinj)
    (cardBoundary_image hcard himage)
    (cardBoundary_ccw hcard hccw)
    (toCardIndex_lt hcard T.h01) (toCardIndex_lt hcard T.h12)
    (toCardIndex_lt hcard T.h23) (toCardIndex_lt hcard T.h34)
    (toCardIndex_lt hcard T.h45) (toCardIndex_lt hcard T.h56)
    (toCardIndex_lt hcard T.h67) Row0 Row1 Row2 Row7
  · exact m 0 1 (by simp [schema8, reflectSchema])
  · exact m 0 4 (by simp [schema8, reflectSchema])
  · exact m 0 5 (by simp [schema8, reflectSchema])
  · exact m 1 0 (by simp [schema8, reflectSchema])
  · exact m 1 3 (by simp [schema8, reflectSchema])
  · exact m 1 4 (by simp [schema8, reflectSchema])
  · exact m 2 1 (by simp [schema8, reflectSchema])
  · exact m 2 3 (by simp [schema8, reflectSchema])
  · exact m 2 6 (by simp [schema8, reflectSchema])
  · exact m 7 0 (by simp [schema8, reflectSchema])
  · exact m 7 5 (by simp [schema8, reflectSchema])
  · exact m 7 6 (by simp [schema8, reflectSchema])

/-- Supports the exact-two-source Kalmanson analysis. -/
private theorem false_of_schemaNine_normalized_at
    {A : Finset ℝ²} (hA : ConvexIndep A) (hcard : A.card = 11)
    (boundary : Label → ℝ²) (hmem : ∀ i, boundary i ∈ A)
    (hinj : Function.Injective boundary)
    (himage : Finset.univ.image boundary = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    (F : FaithfulCarrierPattern A) (T : OrderedSix)
    (hschema : schemaAt (patternCode boundary hmem F) T.values schema9 = true) :
    False := by
  let Row0 := F.classAt (boundary T.i0) (hmem T.i0)
  let Row4 := F.classAt (boundary T.i4) (hmem T.i4)
  let Row5 := F.classAt (boundary T.i5) (hmem T.i5)
  have m (center point : Nat) (hpair : (center, point) ∈ schema9) :
      boundary (rolePoint T.values point) ∈
        (F.classAt (boundary (rolePoint T.values center))
          (hmem (rolePoint T.values center))).support :=
    support_mem_of_schemaAt boundary hmem F T.values schema9 hschema hpair
  apply false_of_schemaNine_normalized_fin11 hA hcard hinj himage hccw
    T.h01 T.h12 T.h23 T.h34 T.h45 Row0 Row4 Row5
  · exact m 0 1 (by simp [schema9])
  · exact m 0 3 (by simp [schema9])
  · exact m 0 5 (by simp [schema9])
  · exact m 4 1 (by simp [schema9])
  · exact m 4 2 (by simp [schema9])
  · exact m 5 2 (by simp [schema9])
  · exact m 5 3 (by simp [schema9])

/-- Supports the exact-two-source Kalmanson analysis. -/
private theorem false_of_schemaNine_reflected_at
    {A : Finset ℝ²} (hA : ConvexIndep A) (hcard : A.card = 11)
    (boundary : Label → ℝ²) (hmem : ∀ i, boundary i ∈ A)
    (hinj : Function.Injective boundary)
    (himage : Finset.univ.image boundary = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    (F : FaithfulCarrierPattern A) (T : OrderedSix)
    (hschema : schemaAt (patternCode boundary hmem F) T.values
      (reflectSchema 6 schema9) = true) :
    False := by
  let Row0 := F.classAt (boundary T.i0) (hmem T.i0)
  let Row1 := F.classAt (boundary T.i1) (hmem T.i1)
  let Row5 := F.classAt (boundary T.i5) (hmem T.i5)
  have m (center point : Nat)
      (hpair : (center, point) ∈ reflectSchema 6 schema9) :
      boundary (rolePoint T.values point) ∈
        (F.classAt (boundary (rolePoint T.values center))
          (hmem (rolePoint T.values center))).support :=
    support_mem_of_schemaAt boundary hmem F T.values
      (reflectSchema 6 schema9) hschema hpair
  apply false_of_schemaNine_reflected_fin11 hA hcard hinj himage hccw
    T.h01 T.h12 T.h23 T.h34 T.h45 Row0 Row1 Row5
  · exact m 0 2 (by simp [schema9, reflectSchema])
  · exact m 0 3 (by simp [schema9, reflectSchema])
  · exact m 1 3 (by simp [schema9, reflectSchema])
  · exact m 1 4 (by simp [schema9, reflectSchema])
  · exact m 5 0 (by simp [schema9, reflectSchema])
  · exact m 5 2 (by simp [schema9, reflectSchema])
  · exact m 5 4 (by simp [schema9, reflectSchema])

/-- One of the exact schema/orientation pairs retained by the p5 reduced core.

Schemas `5` and `8` have only reflected constructors because the exact reduced
core contains no normalized occurrence of either schema. -/
inductive RetainedOccurrence
    (P : Census554.CapSelectedFiniteCode.PatternCode) : Type where
  | schema0Normalized (T : OrderedSix)
      (h : schemaAt P T.values schema0 = true)
  | schema0Reflected (T : OrderedSix)
      (h : schemaAt P T.values (reflectSchema 6 schema0) = true)
  | schema1Normalized (T : OrderedSix)
      (h : schemaAt P T.values schema1 = true)
  | schema1Reflected (T : OrderedSix)
      (h : schemaAt P T.values (reflectSchema 6 schema1) = true)
  | schema2Normalized (T : OrderedFour)
      (h : schemaAt P T.values schema2 = true)
  | schema2Reflected (T : OrderedFour)
      (h : schemaAt P T.values (reflectSchema 4 schema2) = true)
  | schema3Normalized (T : OrderedSix)
      (h : schemaAt P T.values schema3 = true)
  | schema3Reflected (T : OrderedSix)
      (h : schemaAt P T.values (reflectSchema 6 schema3) = true)
  | schema4Normalized (T : OrderedFive)
      (h : schemaAt P T.values schema4 = true)
  | schema4Reflected (T : OrderedFive)
      (h : schemaAt P T.values (reflectSchema 5 schema4) = true)
  | schema5Reflected (T : OrderedFive)
      (h : schemaAt P T.values (reflectSchema 5 schema5) = true)
  | schema6Normalized (T : OrderedSix)
      (h : schemaAt P T.values schema6 = true)
  | schema6Reflected (T : OrderedSix)
      (h : schemaAt P T.values (reflectSchema 6 schema6) = true)
  | schema7Normalized (T : OrderedSeven)
      (h : schemaAt P T.values schema7 = true)
  | schema7Reflected (T : OrderedSeven)
      (h : schemaAt P T.values (reflectSchema 7 schema7) = true)
  | schema8Reflected (T : OrderedEight)
      (h : schemaAt P T.values (reflectSchema 8 schema8) = true)
  | schema9Normalized (T : OrderedSix)
      (h : schemaAt P T.values schema9 = true)
  | schema9Reflected (T : OrderedSix)
      (h : schemaAt P T.values (reflectSchema 6 schema9) = true)

/-- Generic terminal for every exact Kalmanson occurrence retained by the p5
reduced core. -/
theorem false_of_retainedOccurrence
    {A : Finset ℝ²} (hA : ConvexIndep A) (hcard : A.card = 11)
    (boundary : Label → ℝ²) (hmem : ∀ i, boundary i ∈ A)
    (hinj : Function.Injective boundary)
    (himage : Finset.univ.image boundary = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    (F : FaithfulCarrierPattern A)
    (occ : RetainedOccurrence (patternCode boundary hmem F)) :
    False := by
  cases occ with
  | schema0Normalized T h =>
      exact false_of_schemaZero_normalized_at hA hcard boundary hmem
        hinj himage hccw F T h
  | schema0Reflected T h =>
      exact false_of_schemaZero_reflected_at hA hcard boundary hmem
        hinj himage hccw F T h
  | schema1Normalized T h =>
      exact false_of_schemaOne_normalized_at hA hcard boundary hmem
        hinj himage hccw F T h
  | schema1Reflected T h =>
      exact false_of_schemaOne_reflected_at hA hcard boundary hmem
        hinj himage hccw F T h
  | schema2Normalized T h =>
      exact false_of_schemaTwo_normalized_at hA hcard boundary hmem
        hinj himage hccw F T h
  | schema2Reflected T h =>
      exact false_of_schemaTwo_reflected_at hA hcard boundary hmem
        hinj himage hccw F T h
  | schema3Normalized T h =>
      exact false_of_schemaThree_normalized_at hA hcard boundary hmem
        hinj himage hccw F T h
  | schema3Reflected T h =>
      exact false_of_schemaThree_reflected_at hA hcard boundary hmem
        hinj himage hccw F T h
  | schema4Normalized T h =>
      exact false_of_schemaFour_normalized_at hA hcard boundary hmem
        hinj himage hccw F T h
  | schema4Reflected T h =>
      exact false_of_schemaFour_reflected_at hA hcard boundary hmem
        hinj himage hccw F T h
  | schema5Reflected T h =>
      exact false_of_schemaFive_reflected_at hA hcard boundary hmem
        hinj himage hccw F T h
  | schema6Normalized T h =>
      exact false_of_schemaSix_normalized_at hA hcard boundary hmem
        hinj himage hccw F T h
  | schema6Reflected T h =>
      exact false_of_schemaSix_reflected_at hA hcard boundary hmem
        hinj himage hccw F T h
  | schema7Normalized T h =>
      exact false_of_schemaSeven_normalized_at hA hcard boundary hmem
        hinj himage hccw F T h
  | schema7Reflected T h =>
      exact false_of_schemaSeven_reflected_at hA hcard boundary hmem
        hinj himage hccw F T h
  | schema8Reflected T h =>
      exact false_of_schemaEight_reflected_at hA hcard boundary hmem
        hinj himage hccw F T h
  | schema9Normalized T h =>
      exact false_of_schemaNine_normalized_at hA hcard boundary hmem
        hinj himage hccw F T h
  | schema9Reflected T h =>
      exact false_of_schemaNine_reflected_at hA hcard boundary hmem
        hinj himage hccw F T h

#print axioms false_of_retainedOccurrence

end RetainedKalmansonDecoderScratch
end Problem97
