/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import AlignedP5FinElevenKalmanson
import AlignedP5MetricSound
import AlignedP5NativeClassifier
import Erdos9796Proof.P97.Census554.CapSelectedNativeClassifierSound

/-!
# Decode aligned-p5 executable Kalmanson occurrences

This module converts the four Boolean occurrence schemas into the selected-row
memberships consumed by the geometric `Fin 11` Kalmanson terminals.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailAlignedP5KalmansonDecodeScratch

open Census554.CapSelectedFiniteCode
open Census554.CapSelectedNativeClassifier
open Census554.CapSelectedNativeClassifierSound
open ATailAlignedP5NativeClassifierScratch
open ATailAlignedP5MetricSoundScratch
open ATailAlignedP5FinElevenKalmansonScratch

/-- A true executable row lookup is a genuine selected-row membership. -/
theorem mem_row_of_rowHas_eq_true
    {P : PatternCode} {centers : List Label} (center point : Label)
    (hrow : rowHas (centers.map (rowOfPattern P))
      center.val point.val = true) :
    point ∈ row P center := by
  unfold rowHas at hrow
  cases hfind :
      (centers.map (rowOfPattern P)).find?
        (fun nativeRow => nativeRow.center = center.val) with
  | none =>
      simp [hfind] at hrow
  | some nativeRow =>
      simp only [hfind] at hrow
      have hmem := List.mem_of_find?_eq_some hfind
      rcases List.mem_map.mp hmem with ⟨actualCenter, _hactualMem, hactual⟩
      have hcenterValue := List.find?_some hfind
      have hnativeCenter : nativeRow.center = center.val := by
        simpa using hcenterValue
      have hactualCenter : actualCenter = center := by
        apply Fin.ext
        rw [← hactual] at hnativeCenter
        simpa [rowOfPattern] using hnativeCenter
      rw [← hactual] at hrow
      subst actualCenter
      rw [rowOfPattern, has_rowMaskOf] at hrow
      exact (mem_row_iff P center point).mpr hrow

/-- Geometric support form of `mem_row_of_rowHas_eq_true`. -/
theorem support_mem_of_rowHas_eq_true
    {A : Finset ℝ²} (boundary : Fin 11 → ℝ²)
    (hmem : ∀ i, boundary i ∈ A) (F : FaithfulCarrierPattern A)
    {centers : List Label} (center point : Label)
    (hrow :
      rowHas
        (centers.map
          (rowOfPattern (patternCode boundary hmem F)))
        center.val point.val = true) :
    boundary point ∈
      (F.classAt (boundary center) (hmem center)).support :=
  (mem_row_patternCode_iff boundary hmem F center point).mp
    (mem_row_of_rowHas_eq_true center point hrow)

/-- Five strictly increasing canonical boundary labels. -/
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

def OrderedFive.values (T : OrderedFive) : List Nat :=
  [T.i0.val, T.i1.val, T.i2.val, T.i3.val, T.i4.val]

/-- Six strictly increasing canonical boundary labels. -/
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

def OrderedSix.values (T : OrderedSix) : List Nat :=
  [T.i0.val, T.i1.val, T.i2.val, T.i3.val, T.i4.val, T.i5.val]

private theorem lt_eleven_of_mem_targets {targets : List Nat} {point : Nat}
    (hsub : targets.Sublist
      ATailAlignedP5NativeClassifierScratch.labels)
    (hpoint : point ∈ targets) :
    point < 11 := by
  exact List.mem_range.mp (hsub.subset hpoint)

theorem exists_orderedFive_of_mem_increasingTargets
    {targets : List Nat} (htargets : targets ∈ increasingTargets 5) :
    ∃ T : OrderedFive, targets = T.values := by
  have hfiltered := List.mem_filter.mp htargets
  have hsub : targets.Sublist
      ATailAlignedP5NativeClassifierScratch.labels :=
    List.mem_sublists.mp hfiltered.1
  have hlen : targets.length = 5 := by
    simpa using hfiltered.2
  have hpair : targets.Pairwise (· < ·) :=
    List.Pairwise.sublist hsub List.pairwise_lt_range
  rcases targets with _ | ⟨a, rest⟩
  · simp at hlen
  rcases rest with _ | ⟨b, rest⟩
  · simp at hlen
  rcases rest with _ | ⟨c, rest⟩
  · simp at hlen
  rcases rest with _ | ⟨d, rest⟩
  · simp at hlen
  rcases rest with _ | ⟨e, rest⟩
  · simp at hlen
  have hrest : rest = [] :=
    List.length_eq_zero_iff.mp (by simpa using hlen)
  subst rest
  have ha : a < 11 := lt_eleven_of_mem_targets hsub (by simp)
  have hb : b < 11 := lt_eleven_of_mem_targets hsub (by simp)
  have hc : c < 11 := lt_eleven_of_mem_targets hsub (by simp)
  have hd : d < 11 := lt_eleven_of_mem_targets hsub (by simp)
  have he : e < 11 := lt_eleven_of_mem_targets hsub (by simp)
  let i0 : Label := ⟨a, ha⟩
  let i1 : Label := ⟨b, hb⟩
  let i2 : Label := ⟨c, hc⟩
  let i3 : Label := ⟨d, hd⟩
  let i4 : Label := ⟨e, he⟩
  have hab : a < b := by
    simpa using hpair.rel_get_of_lt
      (a := ⟨0, by simp⟩) (b := ⟨1, by simp⟩) (by simp)
  have hbc : b < c := by
    simpa using hpair.rel_get_of_lt
      (a := ⟨1, by simp⟩) (b := ⟨2, by simp⟩) (by simp)
  have hcd : c < d := by
    simpa using hpair.rel_get_of_lt
      (a := ⟨2, by simp⟩) (b := ⟨3, by simp⟩) (by simp)
  have hde : d < e := by
    simpa using hpair.rel_get_of_lt
      (a := ⟨3, by simp⟩) (b := ⟨4, by simp⟩) (by simp)
  exact ⟨{
    i0 := i0
    i1 := i1
    i2 := i2
    i3 := i3
    i4 := i4
    h01 := by simpa [i0, i1] using hab
    h12 := by simpa [i1, i2] using hbc
    h23 := by simpa [i2, i3] using hcd
    h34 := by simpa [i3, i4] using hde }, by
      simp [OrderedFive.values, i0, i1, i2, i3, i4]⟩

theorem exists_orderedSix_of_mem_increasingTargets
    {targets : List Nat} (htargets : targets ∈ increasingTargets 6) :
    ∃ T : OrderedSix, targets = T.values := by
  have hfiltered := List.mem_filter.mp htargets
  have hsub : targets.Sublist
      ATailAlignedP5NativeClassifierScratch.labels :=
    List.mem_sublists.mp hfiltered.1
  have hlen : targets.length = 6 := by
    simpa using hfiltered.2
  have hpair : targets.Pairwise (· < ·) :=
    List.Pairwise.sublist hsub List.pairwise_lt_range
  rcases targets with _ | ⟨a, rest⟩
  · simp at hlen
  rcases rest with _ | ⟨b, rest⟩
  · simp at hlen
  rcases rest with _ | ⟨c, rest⟩
  · simp at hlen
  rcases rest with _ | ⟨d, rest⟩
  · simp at hlen
  rcases rest with _ | ⟨e, rest⟩
  · simp at hlen
  rcases rest with _ | ⟨f, rest⟩
  · simp at hlen
  have hrest : rest = [] :=
    List.length_eq_zero_iff.mp (by simpa using hlen)
  subst rest
  have ha : a < 11 := lt_eleven_of_mem_targets hsub (by simp)
  have hb : b < 11 := lt_eleven_of_mem_targets hsub (by simp)
  have hc : c < 11 := lt_eleven_of_mem_targets hsub (by simp)
  have hd : d < 11 := lt_eleven_of_mem_targets hsub (by simp)
  have he : e < 11 := lt_eleven_of_mem_targets hsub (by simp)
  have hf : f < 11 := lt_eleven_of_mem_targets hsub (by simp)
  let i0 : Label := ⟨a, ha⟩
  let i1 : Label := ⟨b, hb⟩
  let i2 : Label := ⟨c, hc⟩
  let i3 : Label := ⟨d, hd⟩
  let i4 : Label := ⟨e, he⟩
  let i5 : Label := ⟨f, hf⟩
  have hab : a < b := by
    simpa using hpair.rel_get_of_lt
      (a := ⟨0, by simp⟩) (b := ⟨1, by simp⟩) (by simp)
  have hbc : b < c := by
    simpa using hpair.rel_get_of_lt
      (a := ⟨1, by simp⟩) (b := ⟨2, by simp⟩) (by simp)
  have hcd : c < d := by
    simpa using hpair.rel_get_of_lt
      (a := ⟨2, by simp⟩) (b := ⟨3, by simp⟩) (by simp)
  have hde : d < e := by
    simpa using hpair.rel_get_of_lt
      (a := ⟨3, by simp⟩) (b := ⟨4, by simp⟩) (by simp)
  have hef : e < f := by
    simpa using hpair.rel_get_of_lt
      (a := ⟨4, by simp⟩) (b := ⟨5, by simp⟩) (by simp)
  exact ⟨{
    i0 := i0
    i1 := i1
    i2 := i2
    i3 := i3
    i4 := i4
    i5 := i5
    h01 := by simpa [i0, i1] using hab
    h12 := by simpa [i1, i2] using hbc
    h23 := by simpa [i2, i3] using hcd
    h34 := by simpa [i3, i4] using hde
    h45 := by simpa [i4, i5] using hef }, by
      simp [OrderedSix.values, i0, i1, i2, i3, i4, i5]⟩

/-- A normalized schema-one Boolean occurrence is geometrically impossible. -/
theorem false_of_schemaOneAt_normalized
    {A : Finset ℝ²} (hA : ConvexIndep A) (hcard : A.card = 11)
    (boundary : Fin 11 → ℝ²) (hmem : ∀ i, boundary i ∈ A)
    (hinj : Function.Injective boundary)
    (himage : Finset.univ.image boundary = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    (F : FaithfulCarrierPattern A) (centers : List Label)
    (T : OrderedSix)
    (hschema :
      schemaAt
        (centers.map
          (rowOfPattern (patternCode boundary hmem F)))
        T.values schema1 = true) :
    False := by
  let P := patternCode boundary hmem F
  let rows := centers.map (rowOfPattern P)
  have hfields :
      rowHas rows T.i0.val T.i1.val = true ∧
      rowHas rows T.i0.val T.i3.val = true ∧
      rowHas rows T.i4.val T.i2.val = true ∧
      rowHas rows T.i4.val T.i3.val = true ∧
      rowHas rows T.i5.val T.i1.val = true ∧
      rowHas rows T.i5.val T.i2.val = true := by
    simpa [P, rows, schemaAt, schema1, OrderedSix.values, rolePoint] using
      hschema
  let Row0 := F.classAt (boundary T.i0) (hmem T.i0)
  let Row4 := F.classAt (boundary T.i4) (hmem T.i4)
  let Row5 := F.classAt (boundary T.i5) (hmem T.i5)
  apply false_of_schemaOne_normalized_fin11 hA hcard hinj himage hccw
    T.h01 T.h12 T.h23 T.h34 T.h45 Row0 Row4 Row5
  · exact (mem_row_patternCode_iff boundary hmem F T.i0 T.i1).mp
      (mem_row_of_rowHas_eq_true T.i0 T.i1 hfields.1)
  · exact (mem_row_patternCode_iff boundary hmem F T.i0 T.i3).mp
      (mem_row_of_rowHas_eq_true T.i0 T.i3 hfields.2.1)
  · exact (mem_row_patternCode_iff boundary hmem F T.i4 T.i2).mp
      (mem_row_of_rowHas_eq_true T.i4 T.i2 hfields.2.2.1)
  · exact (mem_row_patternCode_iff boundary hmem F T.i4 T.i3).mp
      (mem_row_of_rowHas_eq_true T.i4 T.i3 hfields.2.2.2.1)
  · exact (mem_row_patternCode_iff boundary hmem F T.i5 T.i1).mp
      (mem_row_of_rowHas_eq_true T.i5 T.i1 hfields.2.2.2.2.1)
  · exact (mem_row_patternCode_iff boundary hmem F T.i5 T.i2).mp
      (mem_row_of_rowHas_eq_true T.i5 T.i2 hfields.2.2.2.2.2)

/-- A reflected schema-one Boolean occurrence is geometrically impossible. -/
theorem false_of_schemaOneAt_reflected
    {A : Finset ℝ²} (hA : ConvexIndep A) (hcard : A.card = 11)
    (boundary : Fin 11 → ℝ²) (hmem : ∀ i, boundary i ∈ A)
    (hinj : Function.Injective boundary)
    (himage : Finset.univ.image boundary = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    (F : FaithfulCarrierPattern A) (centers : List Label)
    (T : OrderedSix)
    (hschema :
      schemaAt
        (centers.map
          (rowOfPattern (patternCode boundary hmem F)))
        T.values (reflectSchema 6 schema1) = true) :
    False := by
  let P := patternCode boundary hmem F
  let rows := centers.map (rowOfPattern P)
  have hfields :
      rowHas rows T.i5.val T.i4.val = true ∧
      rowHas rows T.i5.val T.i2.val = true ∧
      rowHas rows T.i1.val T.i3.val = true ∧
      rowHas rows T.i1.val T.i2.val = true ∧
      rowHas rows T.i0.val T.i4.val = true ∧
      rowHas rows T.i0.val T.i3.val = true := by
    simpa [P, rows, schemaAt, schema1, reflectSchema, OrderedSix.values,
      rolePoint] using hschema
  let Row0 := F.classAt (boundary T.i0) (hmem T.i0)
  let Row1 := F.classAt (boundary T.i1) (hmem T.i1)
  let Row5 := F.classAt (boundary T.i5) (hmem T.i5)
  apply false_of_schemaOne_reflected_fin11 hA hcard hinj himage hccw
    T.h01 T.h12 T.h23 T.h34 T.h45 Row0 Row1 Row5
  · exact (mem_row_patternCode_iff boundary hmem F T.i0 T.i3).mp
      (mem_row_of_rowHas_eq_true T.i0 T.i3 hfields.2.2.2.2.2)
  · exact (mem_row_patternCode_iff boundary hmem F T.i0 T.i4).mp
      (mem_row_of_rowHas_eq_true T.i0 T.i4 hfields.2.2.2.2.1)
  · exact (mem_row_patternCode_iff boundary hmem F T.i1 T.i2).mp
      (mem_row_of_rowHas_eq_true T.i1 T.i2 hfields.2.2.2.1)
  · exact (mem_row_patternCode_iff boundary hmem F T.i1 T.i3).mp
      (mem_row_of_rowHas_eq_true T.i1 T.i3 hfields.2.2.1)
  · exact (mem_row_patternCode_iff boundary hmem F T.i5 T.i2).mp
      (mem_row_of_rowHas_eq_true T.i5 T.i2 hfields.2.1)
  · exact (mem_row_patternCode_iff boundary hmem F T.i5 T.i4).mp
      (mem_row_of_rowHas_eq_true T.i5 T.i4 hfields.1)

/-- A normalized schema-four Boolean occurrence is geometrically impossible. -/
theorem false_of_schemaFourAt_normalized
    {A : Finset ℝ²} (hA : ConvexIndep A) (hcard : A.card = 11)
    (boundary : Fin 11 → ℝ²) (hmem : ∀ i, boundary i ∈ A)
    (hinj : Function.Injective boundary)
    (himage : Finset.univ.image boundary = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    (F : FaithfulCarrierPattern A) (centers : List Label)
    (T : OrderedFive)
    (hschema :
      schemaAt
        (centers.map
          (rowOfPattern (patternCode boundary hmem F)))
        T.values schema4 = true) :
    False := by
  let P := patternCode boundary hmem F
  let rows := centers.map (rowOfPattern P)
  have hfields :
      rowHas rows T.i0.val T.i1.val = true ∧
      rowHas rows T.i0.val T.i3.val = true ∧
      rowHas rows T.i2.val T.i3.val = true ∧
      rowHas rows T.i2.val T.i4.val = true ∧
      rowHas rows T.i3.val T.i1.val = true ∧
      rowHas rows T.i3.val T.i4.val = true := by
    simpa [P, rows, schemaAt, schema4, OrderedFive.values, rolePoint] using
      hschema
  let Row0 := F.classAt (boundary T.i0) (hmem T.i0)
  let Row2 := F.classAt (boundary T.i2) (hmem T.i2)
  let Row3 := F.classAt (boundary T.i3) (hmem T.i3)
  apply false_of_schemaFour_normalized_fin11 hA hcard hinj himage hccw
    T.h01 T.h12 T.h23 T.h34 Row0 Row2 Row3
  · exact support_mem_of_rowHas_eq_true boundary hmem F T.i0 T.i1 hfields.1
  · exact support_mem_of_rowHas_eq_true boundary hmem F T.i0 T.i3
      hfields.2.1
  · exact support_mem_of_rowHas_eq_true boundary hmem F T.i2 T.i3
      hfields.2.2.1
  · exact support_mem_of_rowHas_eq_true boundary hmem F T.i2 T.i4
      hfields.2.2.2.1
  · exact support_mem_of_rowHas_eq_true boundary hmem F T.i3 T.i1
      hfields.2.2.2.2.1
  · exact support_mem_of_rowHas_eq_true boundary hmem F T.i3 T.i4
      hfields.2.2.2.2.2

/-- A reflected schema-four Boolean occurrence is geometrically impossible. -/
theorem false_of_schemaFourAt_reflected
    {A : Finset ℝ²} (hA : ConvexIndep A) (hcard : A.card = 11)
    (boundary : Fin 11 → ℝ²) (hmem : ∀ i, boundary i ∈ A)
    (hinj : Function.Injective boundary)
    (himage : Finset.univ.image boundary = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    (F : FaithfulCarrierPattern A) (centers : List Label)
    (T : OrderedFive)
    (hschema :
      schemaAt
        (centers.map
          (rowOfPattern (patternCode boundary hmem F)))
        T.values (reflectSchema 5 schema4) = true) :
    False := by
  let P := patternCode boundary hmem F
  let rows := centers.map (rowOfPattern P)
  have hfields :
      rowHas rows T.i4.val T.i3.val = true ∧
      rowHas rows T.i4.val T.i1.val = true ∧
      rowHas rows T.i2.val T.i1.val = true ∧
      rowHas rows T.i2.val T.i0.val = true ∧
      rowHas rows T.i1.val T.i3.val = true ∧
      rowHas rows T.i1.val T.i0.val = true := by
    simpa [P, rows, schemaAt, schema4, reflectSchema, OrderedFive.values,
      rolePoint] using hschema
  let Row1 := F.classAt (boundary T.i1) (hmem T.i1)
  let Row2 := F.classAt (boundary T.i2) (hmem T.i2)
  let Row4 := F.classAt (boundary T.i4) (hmem T.i4)
  apply false_of_schemaFour_reflected_fin11 hA hcard hinj himage hccw
    T.h01 T.h12 T.h23 T.h34 Row1 Row2 Row4
  · exact support_mem_of_rowHas_eq_true boundary hmem F T.i1 T.i0
      hfields.2.2.2.2.2
  · exact support_mem_of_rowHas_eq_true boundary hmem F T.i1 T.i3
      hfields.2.2.2.2.1
  · exact support_mem_of_rowHas_eq_true boundary hmem F T.i2 T.i0
      hfields.2.2.2.1
  · exact support_mem_of_rowHas_eq_true boundary hmem F T.i2 T.i1
      hfields.2.2.1
  · exact support_mem_of_rowHas_eq_true boundary hmem F T.i4 T.i1
      hfields.2.1
  · exact support_mem_of_rowHas_eq_true boundary hmem F T.i4 T.i3 hfields.1

/-- A normalized schema-six Boolean occurrence is geometrically impossible. -/
theorem false_of_schemaSixAt_normalized
    {A : Finset ℝ²} (hA : ConvexIndep A) (hcard : A.card = 11)
    (boundary : Fin 11 → ℝ²) (hmem : ∀ i, boundary i ∈ A)
    (hinj : Function.Injective boundary)
    (himage : Finset.univ.image boundary = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    (F : FaithfulCarrierPattern A) (centers : List Label)
    (T : OrderedSix)
    (hschema :
      schemaAt
        (centers.map
          (rowOfPattern (patternCode boundary hmem F)))
        T.values schema6 = true) :
    False := by
  let P := patternCode boundary hmem F
  let rows := centers.map (rowOfPattern P)
  have hfields :
      rowHas rows T.i0.val T.i3.val = true ∧
      rowHas rows T.i0.val T.i4.val = true ∧
      rowHas rows T.i1.val T.i0.val = true ∧
      rowHas rows T.i1.val T.i4.val = true ∧
      rowHas rows T.i2.val T.i0.val = true ∧
      rowHas rows T.i2.val T.i3.val = true := by
    simpa [P, rows, schemaAt, schema6, OrderedSix.values, rolePoint] using
      hschema
  let Row0 := F.classAt (boundary T.i0) (hmem T.i0)
  let Row1 := F.classAt (boundary T.i1) (hmem T.i1)
  let Row2 := F.classAt (boundary T.i2) (hmem T.i2)
  apply false_of_schemaSix_normalized_fin11 hA hcard hinj himage hccw
    T.h01 T.h12 T.h23 T.h34 T.h45 Row0 Row1 Row2
  · exact support_mem_of_rowHas_eq_true boundary hmem F T.i0 T.i3 hfields.1
  · exact support_mem_of_rowHas_eq_true boundary hmem F T.i0 T.i4
      hfields.2.1
  · exact support_mem_of_rowHas_eq_true boundary hmem F T.i1 T.i0
      hfields.2.2.1
  · exact support_mem_of_rowHas_eq_true boundary hmem F T.i1 T.i4
      hfields.2.2.2.1
  · exact support_mem_of_rowHas_eq_true boundary hmem F T.i2 T.i0
      hfields.2.2.2.2.1
  · exact support_mem_of_rowHas_eq_true boundary hmem F T.i2 T.i3
      hfields.2.2.2.2.2

/-- A reflected schema-six Boolean occurrence is geometrically impossible. -/
theorem false_of_schemaSixAt_reflected
    {A : Finset ℝ²} (hA : ConvexIndep A) (hcard : A.card = 11)
    (boundary : Fin 11 → ℝ²) (hmem : ∀ i, boundary i ∈ A)
    (hinj : Function.Injective boundary)
    (himage : Finset.univ.image boundary = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    (F : FaithfulCarrierPattern A) (centers : List Label)
    (T : OrderedSix)
    (hschema :
      schemaAt
        (centers.map
          (rowOfPattern (patternCode boundary hmem F)))
        T.values (reflectSchema 6 schema6) = true) :
    False := by
  let P := patternCode boundary hmem F
  let rows := centers.map (rowOfPattern P)
  have hfields :
      rowHas rows T.i5.val T.i2.val = true ∧
      rowHas rows T.i5.val T.i1.val = true ∧
      rowHas rows T.i4.val T.i5.val = true ∧
      rowHas rows T.i4.val T.i1.val = true ∧
      rowHas rows T.i3.val T.i5.val = true ∧
      rowHas rows T.i3.val T.i2.val = true := by
    simpa [P, rows, schemaAt, schema6, reflectSchema, OrderedSix.values,
      rolePoint] using hschema
  let Row3 := F.classAt (boundary T.i3) (hmem T.i3)
  let Row4 := F.classAt (boundary T.i4) (hmem T.i4)
  let Row5 := F.classAt (boundary T.i5) (hmem T.i5)
  apply false_of_schemaSix_reflected_fin11 hA hcard hinj himage hccw
    T.h01 T.h12 T.h23 T.h34 T.h45 Row3 Row4 Row5
  · exact support_mem_of_rowHas_eq_true boundary hmem F T.i3 T.i2
      hfields.2.2.2.2.2
  · exact support_mem_of_rowHas_eq_true boundary hmem F T.i3 T.i5
      hfields.2.2.2.2.1
  · exact support_mem_of_rowHas_eq_true boundary hmem F T.i4 T.i1
      hfields.2.2.2.1
  · exact support_mem_of_rowHas_eq_true boundary hmem F T.i4 T.i5
      hfields.2.2.1
  · exact support_mem_of_rowHas_eq_true boundary hmem F T.i5 T.i1
      hfields.2.1
  · exact support_mem_of_rowHas_eq_true boundary hmem F T.i5 T.i2 hfields.1

/-- A normalized schema-nine Boolean occurrence is geometrically impossible. -/
theorem false_of_schemaNineAt_normalized
    {A : Finset ℝ²} (hA : ConvexIndep A) (hcard : A.card = 11)
    (boundary : Fin 11 → ℝ²) (hmem : ∀ i, boundary i ∈ A)
    (hinj : Function.Injective boundary)
    (himage : Finset.univ.image boundary = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    (F : FaithfulCarrierPattern A) (centers : List Label)
    (T : OrderedSix)
    (hschema :
      schemaAt
        (centers.map
          (rowOfPattern (patternCode boundary hmem F)))
        T.values schema9 = true) :
    False := by
  let P := patternCode boundary hmem F
  let rows := centers.map (rowOfPattern P)
  have hfields :
      rowHas rows T.i0.val T.i1.val = true ∧
      rowHas rows T.i0.val T.i3.val = true ∧
      rowHas rows T.i0.val T.i5.val = true ∧
      rowHas rows T.i4.val T.i1.val = true ∧
      rowHas rows T.i4.val T.i2.val = true ∧
      rowHas rows T.i5.val T.i2.val = true ∧
      rowHas rows T.i5.val T.i3.val = true := by
    simpa [P, rows, schemaAt, schema9, OrderedSix.values, rolePoint] using
      hschema
  let Row0 := F.classAt (boundary T.i0) (hmem T.i0)
  let Row4 := F.classAt (boundary T.i4) (hmem T.i4)
  let Row5 := F.classAt (boundary T.i5) (hmem T.i5)
  apply false_of_schemaNine_normalized_fin11 hA hcard hinj himage hccw
    T.h01 T.h12 T.h23 T.h34 T.h45 Row0 Row4 Row5
  · exact support_mem_of_rowHas_eq_true boundary hmem F T.i0 T.i1 hfields.1
  · exact support_mem_of_rowHas_eq_true boundary hmem F T.i0 T.i3
      hfields.2.1
  · exact support_mem_of_rowHas_eq_true boundary hmem F T.i0 T.i5
      hfields.2.2.1
  · exact support_mem_of_rowHas_eq_true boundary hmem F T.i4 T.i1
      hfields.2.2.2.1
  · exact support_mem_of_rowHas_eq_true boundary hmem F T.i4 T.i2
      hfields.2.2.2.2.1
  · exact support_mem_of_rowHas_eq_true boundary hmem F T.i5 T.i2
      hfields.2.2.2.2.2.1
  · exact support_mem_of_rowHas_eq_true boundary hmem F T.i5 T.i3
      hfields.2.2.2.2.2.2

/-- A reflected schema-nine Boolean occurrence is geometrically impossible. -/
theorem false_of_schemaNineAt_reflected
    {A : Finset ℝ²} (hA : ConvexIndep A) (hcard : A.card = 11)
    (boundary : Fin 11 → ℝ²) (hmem : ∀ i, boundary i ∈ A)
    (hinj : Function.Injective boundary)
    (himage : Finset.univ.image boundary = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    (F : FaithfulCarrierPattern A) (centers : List Label)
    (T : OrderedSix)
    (hschema :
      schemaAt
        (centers.map
          (rowOfPattern (patternCode boundary hmem F)))
        T.values (reflectSchema 6 schema9) = true) :
    False := by
  let P := patternCode boundary hmem F
  let rows := centers.map (rowOfPattern P)
  have hfields :
      rowHas rows T.i5.val T.i4.val = true ∧
      rowHas rows T.i5.val T.i2.val = true ∧
      rowHas rows T.i5.val T.i0.val = true ∧
      rowHas rows T.i1.val T.i4.val = true ∧
      rowHas rows T.i1.val T.i3.val = true ∧
      rowHas rows T.i0.val T.i3.val = true ∧
      rowHas rows T.i0.val T.i2.val = true := by
    simpa [P, rows, schemaAt, schema9, reflectSchema, OrderedSix.values,
      rolePoint] using hschema
  let Row0 := F.classAt (boundary T.i0) (hmem T.i0)
  let Row1 := F.classAt (boundary T.i1) (hmem T.i1)
  let Row5 := F.classAt (boundary T.i5) (hmem T.i5)
  apply false_of_schemaNine_reflected_fin11 hA hcard hinj himage hccw
    T.h01 T.h12 T.h23 T.h34 T.h45 Row0 Row1 Row5
  · exact support_mem_of_rowHas_eq_true boundary hmem F T.i0 T.i2
      hfields.2.2.2.2.2.2
  · exact support_mem_of_rowHas_eq_true boundary hmem F T.i0 T.i3
      hfields.2.2.2.2.2.1
  · exact support_mem_of_rowHas_eq_true boundary hmem F T.i1 T.i3
      hfields.2.2.2.2.1
  · exact support_mem_of_rowHas_eq_true boundary hmem F T.i1 T.i4
      hfields.2.2.2.1
  · exact support_mem_of_rowHas_eq_true boundary hmem F T.i5 T.i0
      hfields.2.2.1
  · exact support_mem_of_rowHas_eq_true boundary hmem F T.i5 T.i2
      hfields.2.1
  · exact support_mem_of_rowHas_eq_true boundary hmem F T.i5 T.i4 hfields.1

/-- Any executable aligned-p5 Kalmanson occurrence is consumed by one of the
eight orientation-aware geometric terminals. -/
theorem false_of_kalmansonCore_eq_true
    {A : Finset ℝ²} (hA : ConvexIndep A) (hcard : A.card = 11)
    (boundary : Fin 11 → ℝ²) (hmem : ∀ i, boundary i ∈ A)
    (hinj : Function.Injective boundary)
    (himage : Finset.univ.image boundary = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    (F : FaithfulCarrierPattern A) (centers : List Label)
    (hcore :
      kalmansonCore
        (centers.map
          (rowOfPattern (patternCode boundary hmem F))) = true) :
    False := by
  rw [kalmansonCore] at hcore
  have hdisj :
      schemaOccurs
          (centers.map
            (rowOfPattern (patternCode boundary hmem F))) 6 schema1 = true ∨
      schemaOccurs
          (centers.map
            (rowOfPattern (patternCode boundary hmem F))) 5 schema4 = true ∨
      schemaOccurs
          (centers.map
            (rowOfPattern (patternCode boundary hmem F))) 6 schema6 = true ∨
      schemaOccurs
          (centers.map
            (rowOfPattern (patternCode boundary hmem F))) 6 schema9 = true := by
    rcases Bool.or_eq_true_iff.mp hcore with hleft | hschemaNine
    · rcases Bool.or_eq_true_iff.mp hleft with hleft | hschemaSix
      · rcases Bool.or_eq_true_iff.mp hleft with
          hschemaOne | hschemaFour
        · exact Or.inl hschemaOne
        · exact Or.inr (Or.inl hschemaFour)
      · exact Or.inr (Or.inr (Or.inl hschemaSix))
    · exact Or.inr (Or.inr (Or.inr hschemaNine))
  rcases hdisj with hschemaOne | hschemaFour | hschemaSix | hschemaNine
  · rw [schemaOccurs, List.any_eq_true] at hschemaOne
    rcases hschemaOne with ⟨targets, htargets, hschema⟩
    rcases exists_orderedSix_of_mem_increasingTargets htargets with
      ⟨T, rfl⟩
    simp only [Bool.or_eq_true] at hschema
    rcases hschema with hnormalized | hreflected
    · exact false_of_schemaOneAt_normalized hA hcard boundary hmem
        hinj himage hccw F centers T hnormalized
    · exact false_of_schemaOneAt_reflected hA hcard boundary hmem
        hinj himage hccw F centers T hreflected
  · rw [schemaOccurs, List.any_eq_true] at hschemaFour
    rcases hschemaFour with ⟨targets, htargets, hschema⟩
    rcases exists_orderedFive_of_mem_increasingTargets htargets with
      ⟨T, rfl⟩
    simp only [Bool.or_eq_true] at hschema
    rcases hschema with hnormalized | hreflected
    · exact false_of_schemaFourAt_normalized hA hcard boundary hmem
        hinj himage hccw F centers T hnormalized
    · exact false_of_schemaFourAt_reflected hA hcard boundary hmem
        hinj himage hccw F centers T hreflected
  · rw [schemaOccurs, List.any_eq_true] at hschemaSix
    rcases hschemaSix with ⟨targets, htargets, hschema⟩
    rcases exists_orderedSix_of_mem_increasingTargets htargets with
      ⟨T, rfl⟩
    simp only [Bool.or_eq_true] at hschema
    rcases hschema with hnormalized | hreflected
    · exact false_of_schemaSixAt_normalized hA hcard boundary hmem
        hinj himage hccw F centers T hnormalized
    · exact false_of_schemaSixAt_reflected hA hcard boundary hmem
        hinj himage hccw F centers T hreflected
  · rw [schemaOccurs, List.any_eq_true] at hschemaNine
    rcases hschemaNine with ⟨targets, htargets, hschema⟩
    rcases exists_orderedSix_of_mem_increasingTargets htargets with
      ⟨T, rfl⟩
    simp only [Bool.or_eq_true] at hschema
    rcases hschema with hnormalized | hreflected
    · exact false_of_schemaNineAt_normalized hA hcard boundary hmem
        hinj himage hccw F centers T hnormalized
    · exact false_of_schemaNineAt_reflected hA hcard boundary hmem
        hinj himage hccw F centers T hreflected

end ATailAlignedP5KalmansonDecodeScratch
end Problem97
