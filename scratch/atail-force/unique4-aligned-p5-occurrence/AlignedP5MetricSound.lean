/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import AlignedP5NativeClassifier
import Erdos9796Proof.P97.Census554.CapSelectedNativeClosureSound

/-!
# Metric soundness for the aligned-p5 native classifier

This file pulls an arbitrary faithful selected-row pattern back along an
injective `Fin 11` boundary.  If the row at boundary position `0` is exact,
then none of the four metric prefix checks can fire on a semantic row prefix.

The proof is independent of the unfinished aligned-p5 boundary packet.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailAlignedP5MetricSoundScratch

open Census554
open Census554.CapSelectedFiniteCode
open Census554.CapSelectedNativeClassifier
open Census554.CapSelectedNativeClassifierSound
open Census554.CapSelectedNativeClosureSound
open Census554.EqualityCore
open ATailAlignedP5NativeClassifierScratch

/-- Pull the selected geometric support at each boundary point back to
`Fin 11`. -/
noncomputable def patternCode {A : Finset ℝ²}
    (boundary : Fin 11 → ℝ²) (hboundaryMem : ∀ i, boundary i ∈ A)
    (F : FaithfulCarrierPattern A) : PatternCode :=
  fun center point => decide <|
    boundary point ∈
      (F.classAt (boundary center) (hboundaryMem center)).support

/-- The selected class at boundary position `0` is the complete ambient
radius class: every carrier point at its selected radius lies in its support. -/
def ExactFirstClass {A : Finset ℝ²}
    (boundary : Fin 11 → ℝ²) (hboundaryMem : ∀ i, boundary i ∈ A)
    (F : FaithfulCarrierPattern A) : Prop :=
  ∀ z, z ∈ A →
    dist (boundary 0) z =
      (F.classAt (boundary 0) (hboundaryMem 0)).radius →
    z ∈ (F.classAt (boundary 0) (hboundaryMem 0)).support

@[simp] theorem mem_row_patternCode_iff
    {A : Finset ℝ²} (boundary : Fin 11 → ℝ²)
    (hboundaryMem : ∀ i, boundary i ∈ A)
    (F : FaithfulCarrierPattern A) (center point : Label) :
    point ∈ row (patternCode boundary hboundaryMem F) center ↔
      boundary point ∈
        (F.classAt (boundary center) (hboundaryMem center)).support := by
  simp [patternCode, mem_row_iff]

/-- The boundary interpretation realizes every pulled-back row equality. -/
theorem realizes_patternCode
    {A : Finset ℝ²} (boundary : Fin 11 → ℝ²)
    (hboundaryMem : ∀ i, boundary i ∈ A)
    (hboundaryInjective : Function.Injective boundary)
    (F : FaithfulCarrierPattern A) :
    Realizes (rowPattern (patternCode boundary hboundaryMem F)) boundary := by
  refine ⟨?_, hboundaryInjective⟩
  intro center left hleft right hright
  have hleftSupport :=
    (mem_row_patternCode_iff boundary hboundaryMem F center left).mp hleft
  have hrightSupport :=
    (mem_row_patternCode_iff boundary hboundaryMem F center right).mp hright
  exact
    ((F.classAt (boundary center) (hboundaryMem center)).support_eq_radius
      _ hleftSupport).trans
    ((F.classAt (boundary center) (hboundaryMem center)).support_eq_radius
      _ hrightSupport).symm

/-- A complete ambient first radius class is exact after pullback to the
boundary labels. -/
theorem exactAt_zero_of_exactFirstClass
    {A : Finset ℝ²} (boundary : Fin 11 → ℝ²)
    (hboundaryMem : ∀ i, boundary i ∈ A)
    (F : FaithfulCarrierPattern A)
    (hexact : ExactFirstClass boundary hboundaryMem F) :
    ExactAt (rowPattern (patternCode boundary hboundaryMem F)) boundary 0 := by
  intro first hfirst point hpoint hdist
  apply hpoint
  apply (mem_row_patternCode_iff boundary hboundaryMem F 0 point).mpr
  apply hexact (boundary point) (hboundaryMem point)
  calc
    dist (boundary 0) (boundary point) =
        dist (boundary 0) (boundary first) := hdist
    _ = (F.classAt (boundary 0) (hboundaryMem 0)).radius :=
      (F.classAt (boundary 0) (hboundaryMem 0)).support_eq_radius
        _ ((mem_row_patternCode_iff boundary hboundaryMem F 0 first).mp
          hfirst)

/-- A native row found at center value `0` is the semantic row at label `0`. -/
theorem row_eq_rowOfPattern_zero_of_find?_eq_some
    {P : PatternCode} {centers : List Label}
    {nativeRow : ATailAlignedP5NativeClassifierScratch.Row}
    (hfind : (centers.map (rowOfPattern P)).find?
      (fun nativeRow => nativeRow.center = 0) = some nativeRow) :
    nativeRow = rowOfPattern P 0 := by
  have hmem := List.mem_of_find?_eq_some hfind
  rcases List.mem_map.mp hmem with ⟨center, _hcenter, rfl⟩
  have hcenterValue := List.find?_some hfind
  have hcenter : center = (0 : Label) := by
    apply Fin.ext
    simpa [rowOfPattern] using hcenterValue
  rw [hcenter]

/-- Exactness of boundary row `0` excludes the native off-row equality
detector on every semantic prefix. -/
theorem exactFirstClassCore_eq_false
    {P : PatternCode} {pointOf : Label → ℝ²}
    (hreal : Realizes (rowPattern P) pointOf)
    (hexact : ExactAt (rowPattern P) pointOf 0)
    (centers : List Label) :
    exactFirstClassCore (centers.map (rowOfPattern P))
      (normalizedRoots
        (equalityClosure (centers.map (rowOfPattern P)))) = false := by
  apply Bool.eq_false_iff.mpr
  intro hcore
  let rows := centers.map (rowOfPattern P)
  let roots := normalizedRoots (equalityClosure rows)
  change exactFirstClassCore rows roots = true at hcore
  cases hfind : rows.find? (fun nativeRow => nativeRow.center = 0) with
  | none =>
      simp [exactFirstClassCore, hfind] at hcore
  | some nativeRow =>
      simp only [exactFirstClassCore, hfind] at hcore
      cases hsupport : supportPoints nativeRow.support with
      | nil =>
          simp [hsupport] at hcore
      | cons first rest =>
          simp only [hsupport] at hcore
          rw [List.any_eq_true] at hcore
          rcases hcore with ⟨point, hpointMem, hpoint⟩
          rw [Bool.and_eq_true, Bool.and_eq_true] at hpoint
          have hrow : nativeRow = rowOfPattern P 0 :=
            row_eq_rowOfPattern_zero_of_find?_eq_some (by
              simpa [rows] using hfind)
          have hfirstMem :
              first ∈ supportPoints nativeRow.support := by
            rw [hsupport]
            simp
          have hfirstMem' :
              first ∈ supportPoints (rowOfPattern P 0).support := by
            simpa [hrow] using hfirstMem
          let firstLabel : Label :=
            ⟨first, supportPoint_lt_eleven hfirstMem'⟩
          let pointLabel : Label := labelOfMem point hpointMem
          have hfirstRow : firstLabel ∈ row P 0 := by
            simpa [firstLabel] using supportPoint_mem_row hfirstMem'
          have hpointNotRow : pointLabel ∉ row P 0 := by
            intro hmem
            have hhasLabel :
                has (rowOfPattern P 0).support pointLabel.val = true := by
              change has (rowMaskOf P 0) pointLabel.val = true
              rw [has_rowMaskOf]
              exact (mem_row_iff P 0 pointLabel).mp hmem
            have hhas : has (rowOfPattern P 0).support point = true := by
              simpa [pointLabel] using hhasLabel
            have hfalse := hpoint.1.1
            rw [hrow, hhas] at hfalse
            simp at hfalse
          have hclosure :
              EdgeClosure (rowPattern P) (0, firstLabel) (0, pointLabel) := by
            apply edgeClosure_of_semanticRows_edgesEqual centers
            simpa [roots, rows, firstLabel, pointLabel] using hpoint.2
          have hdist :
              dist (pointOf 0) (pointOf firstLabel) =
                dist (pointOf 0) (pointOf pointLabel) := by
            simpa [edgeDist] using EdgeClosure.sound hreal hclosure
          exact (hexact firstLabel hfirstRow pointLabel hpointNotRow) hdist.symm

/-- In the increasing linear cut used by the aligned classifier, semantic
`btw` alternation implies the executable cyclic-separation check. -/
theorem cyclicSeparated_eq_true_of_btw
    (left right first second : Label) (hlr : left < right)
    (hsep : SurplusCOMPGBank.btw left right first ↔
      ¬ SurplusCOMPGBank.btw left right second) :
    ATailAlignedP5NativeClassifierScratch.cyclicSeparated
      left.val right.val first.val second.val = true := by
  decide +revert

/-- CCW soundness excludes the native nonalternating shared-pair detector on
every semantic prefix. -/
theorem fullClassNonalternatingCore_eq_false
    {P : PatternCode} {pointOf : Label → ℝ²}
    (hreal : Realizes (rowPattern P) pointOf)
    (hpointInjective : Function.Injective pointOf)
    (hpointCcw : EuclideanGeometry.IsCcwConvexPolygon pointOf)
    (centers : List Label) :
    fullClassNonalternatingCore
      (normalizedRoots
        (equalityClosure (centers.map (rowOfPattern P)))) = false := by
  apply Bool.eq_false_iff.mpr
  intro hcore
  let roots :=
    normalizedRoots (equalityClosure (centers.map (rowOfPattern P)))
  change fullClassNonalternatingCore roots = true at hcore
  rw [fullClassNonalternatingCore] at hcore
  rcases List.any_eq_true.mp hcore with ⟨left, hleftMem, hleft⟩
  rcases List.any_eq_true.mp hleft with ⟨right, hrightMem, hright⟩
  simp only [Bool.and_eq_true] at hright
  rcases List.any_eq_true.mp hright.2 with
    ⟨first, hfirstMem, hfirst⟩
  simp only [Bool.and_eq_true] at hfirst
  rcases List.any_eq_true.mp hfirst.2 with
    ⟨second, hsecondMem, hsecond⟩
  simp only [Bool.and_eq_true] at hsecond
  let leftLabel : Label := labelOfMem left hleftMem
  let rightLabel : Label := labelOfMem right hrightMem
  let firstLabel : Label := labelOfMem first hfirstMem
  let secondLabel : Label := labelOfMem second hsecondMem
  have hleftRight : leftLabel < rightLabel := by
    simpa [leftLabel, rightLabel] using hright.1
  have hcentersNe : leftLabel ≠ rightLabel := ne_of_lt hleftRight
  have hsecondFirst : firstLabel ≠ secondLabel := by
    intro heq
    have hval := congrArg Fin.val heq
    simp [firstLabel, secondLabel] at hval
    exact (Nat.ne_of_lt (by simpa using hsecond.1.1.1.1.1)) hval
  have hsecondLeft : secondLabel ≠ leftLabel := by
    intro heq
    have hval := congrArg Fin.val heq
    simp [secondLabel, leftLabel] at hval
    have hne : second ≠ left := by
      simpa using hsecond.1.1.1.1.2
    exact hne hval
  have hsecondRight : secondLabel ≠ rightLabel := by
    intro heq
    have hval := congrArg Fin.val heq
    simp [secondLabel, rightLabel] at hval
    have hne : second ≠ right := by
      simpa using hsecond.1.1.1.2
    exact hne hval
  let core : Census554.SeparationCore.SharedPairSeparationCore
      (rowPattern P) :=
    { firstCenter := leftLabel
      secondCenter := rightLabel
      firstPoint := firstLabel
      secondPoint := secondLabel
      centers_ne := hcentersNe
      secondPoint_ne_firstCenter := hsecondLeft
      secondPoint_ne_secondCenter := hsecondRight
      points_ne := hsecondFirst
      firstCenter_eq := edgeClosure_of_semanticRows_edgesEqual centers
        leftLabel firstLabel leftLabel secondLabel (by
          simpa [roots, leftLabel, firstLabel, secondLabel] using
            hsecond.1.1.2)
      secondCenter_eq := edgeClosure_of_semanticRows_edgesEqual centers
        rightLabel firstLabel rightLabel secondLabel (by
          simpa [roots, rightLabel, firstLabel, secondLabel] using
            hsecond.1.2) }
  have hsat : core.SatisfiedBy (fun label => label) :=
    core.satisfiedBy_of_realizes_ccw hreal pointOf (fun label => label)
      hpointCcw hpointInjective Function.injective_id (fun _ => rfl)
  have hseparated :
      ATailAlignedP5NativeClassifierScratch.cyclicSeparated
        left right first second = true := by
    apply cyclicSeparated_eq_true_of_btw
      leftLabel rightLabel firstLabel secondLabel hleftRight
    simpa [core, Census554.SeparationCore.SharedPairSeparationCore.SatisfiedBy,
      leftLabel, rightLabel, firstLabel, secondLabel] using hsat
  simp [hseparated] at hsecond

/-- The aligned executable metric core is false on every duplicate-free
semantic prefix of a faithful boundary pattern. -/
theorem metricCore_eq_false_of_exactAt
    {A : Finset ℝ²} (hconv : ConvexIndep A)
    (boundary : Label → ℝ²) (hboundaryMem : ∀ i, boundary i ∈ A)
    (hboundaryInjective : Function.Injective boundary)
    (hboundaryCcw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    (F : FaithfulCarrierPattern A)
    (hexact : ExactAt
      (rowPattern (patternCode boundary hboundaryMem F)) boundary 0)
    (centers : List Label) (_hcenters : centers.Nodup) :
    metricCore
      (centers.map
        (rowOfPattern (patternCode boundary hboundaryMem F))) = false := by
  let P := patternCode boundary hboundaryMem F
  let rows := centers.map (rowOfPattern P)
  let roots := normalizedRoots (equalityClosure rows)
  have hreal : Realizes (rowPattern P) boundary :=
    realizes_patternCode boundary hboundaryMem hboundaryInjective F
  have hexactFalse : exactFirstClassCore rows roots = false := by
    simpa [P, rows, roots] using
      exactFirstClassCore_eq_false hreal hexact centers
  have hduplicateFalse : duplicateCenterCore roots = false := by
    apply Bool.eq_false_iff.mpr
    intro hduplicate
    rcases duplicateCenterCore_sound centers (by
      simpa [P, rows, roots] using hduplicate) with ⟨core⟩
    exact not_realizes_of_duplicateCenterCore core ⟨boundary, hreal⟩
  have hperpendicularFalse : perpendicularBisectorCore roots = false := by
    apply Bool.eq_false_iff.mpr
    intro hperpendicular
    rcases perpendicularBisectorCore_sound centers (by
      simpa [P, rows, roots] using hperpendicular) with ⟨core⟩
    exact false_of_convexIndep_of_perpBisectorCore hreal hconv
      hboundaryMem core
  have hnonalternatingFalse : fullClassNonalternatingCore roots = false := by
    simpa [P, rows, roots] using
      fullClassNonalternatingCore_eq_false hreal hboundaryInjective
        hboundaryCcw centers
  simp [metricCore, P, rows, roots, hexactFalse, hduplicateFalse,
    hperpendicularFalse, hnonalternatingFalse]

/-- Complete-radius-class form of `metricCore_eq_false_of_exactAt`. -/
theorem metricCore_eq_false
    {A : Finset ℝ²} (hconv : ConvexIndep A)
    (boundary : Label → ℝ²) (hboundaryMem : ∀ i, boundary i ∈ A)
    (hboundaryInjective : Function.Injective boundary)
    (hboundaryCcw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    (F : FaithfulCarrierPattern A)
    (hexact : ExactFirstClass boundary hboundaryMem F)
    (centers : List Label) (hcenters : centers.Nodup) :
    metricCore
      (centers.map
        (rowOfPattern (patternCode boundary hboundaryMem F))) = false :=
  metricCore_eq_false_of_exactAt hconv boundary hboundaryMem
    hboundaryInjective hboundaryCcw F
    (exactAt_zero_of_exactFirstClass boundary hboundaryMem F hexact)
    centers hcenters

end ATailAlignedP5MetricSoundScratch
end Problem97
