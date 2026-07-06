/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import Erdos9796Proof.P97.U5FiniteAudit
import Erdos9796Proof.P97.U5GlobalIncidenceKernels
import Erdos9796Proof.P97.U5GlobalIncidenceSupport

/-!
# U5 finite-audit extraction helpers

This file starts the bridge from real audited U5 support classes to the finite
`U5AuditLabel.IndexPattern` certificate.  It stays finite-label-only: the
geometric extraction from actual point classes into these label classes is the
next layer.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace U5AuditLabel

open U5AuditLabel

noncomputable def labelFinset : Finset U5AuditLabel := labels.toFinset

noncomputable def supportSet (pt : U5AuditLabel → ℝ²) : Finset ℝ² :=
  labelFinset.image pt

noncomputable def classLabels (pt : U5AuditLabel → ℝ²) (B : Finset ℝ²) :
    Finset U5AuditLabel :=
  labelFinset.filter fun l => pt l ∈ B

/-- If a real four-point class lives inside the labeled support, its finite
label preimage also has cardinality four. -/
theorem classLabels_card_eq_of_subset_support
    {pt : U5AuditLabel → ℝ²} {B : Finset ℝ²}
    (hinj : Function.Injective pt)
    (hB : B ⊆ supportSet pt) (hcard : B.card = 4) :
    (classLabels pt B).card = 4 := by
  have himage : (classLabels pt B).image pt = B := by
    ext y
    constructor
    · intro hy
      rcases Finset.mem_image.mp hy with ⟨l, hl, rfl⟩
      exact (Finset.mem_filter.mp hl).2
    · intro hy
      rcases Finset.mem_image.mp (hB hy) with ⟨l, hl, hly⟩
      exact Finset.mem_image.mpr
        ⟨l, Finset.mem_filter.mpr ⟨hl, by simpa [hly] using hy⟩, hly⟩
  have hcard_image :
      ((classLabels pt B).image pt).card = (classLabels pt B).card := by
    exact Finset.card_image_of_injective _ hinj
  rw [himage, hcard] at hcard_image
  exact hcard_image.symm

theorem label_not_mem_classLabels
    {pt : U5AuditLabel → ℝ²} {B : Finset ℝ²} {l : U5AuditLabel}
    (h : pt l ∉ B) :
    l ∉ classLabels pt B := by
  simp [classLabels, h]

/-- Pairwise real-class overlap bounds transfer to finite label classes. -/
theorem classLabels_inter_card_le
    {pt : U5AuditLabel → ℝ²} {B C : Finset ℝ²}
    (hinj : Function.Injective pt) (hBC : (B ∩ C).card ≤ 2) :
    ((classLabels pt B) ∩ (classLabels pt C)).card ≤ 2 := by
  have hcard_image :
      (((classLabels pt B) ∩ (classLabels pt C)).image pt).card =
        ((classLabels pt B) ∩ (classLabels pt C)).card := by
    exact Finset.card_image_of_injective _ hinj
  rw [← hcard_image]
  refine le_trans (Finset.card_le_card ?_) hBC
  intro y hy
  rcases Finset.mem_image.mp hy with ⟨l, hl, rfl⟩
  rw [Finset.mem_inter] at hl ⊢
  exact ⟨(Finset.mem_filter.mp hl.1).2, (Finset.mem_filter.mp hl.2).2⟩

/-- An injective assignment of the eight audit labels to actual Euclidean
points.  The later U5 bad-pattern extraction supplies this from
`{p,q,t1,t2,t3,u,a0,a1}` distinctness. -/
structure PointLabeling where
  point : U5AuditLabel → ℝ²
  injective : Function.Injective point

theorem PointLabeling.ne_of_label_ne (Λ : PointLabeling)
    {l₁ l₂ : U5AuditLabel} (hlabel : l₁ ≠ l₂) :
    Λ.point l₁ ≠ Λ.point l₂ := by
  intro hpoint
  exact hlabel (Λ.injective hpoint)

noncomputable def pointOf (P Q T1 T2 T3 U A0 A1 : ℝ²) :
    U5AuditLabel → ℝ²
  | p => P
  | q => Q
  | t1 => T1
  | t2 => T2
  | t3 => T3
  | u => U
  | a0 => A0
  | a1 => A1

theorem pointOf_injective
    {P Q T1 T2 T3 U A0 A1 : ℝ²}
    (hPQ : P ≠ Q) (hPT1 : P ≠ T1) (hPT2 : P ≠ T2) (hPT3 : P ≠ T3)
    (hPU : P ≠ U) (hPA0 : P ≠ A0) (hPA1 : P ≠ A1)
    (hQT1 : Q ≠ T1) (hQT2 : Q ≠ T2) (hQT3 : Q ≠ T3)
    (hQU : Q ≠ U) (hQA0 : Q ≠ A0) (hQA1 : Q ≠ A1)
    (hT12 : T1 ≠ T2) (hT13 : T1 ≠ T3) (hT1U : T1 ≠ U)
    (hT1A0 : T1 ≠ A0) (hT1A1 : T1 ≠ A1)
    (hT23 : T2 ≠ T3) (hT2U : T2 ≠ U) (hT2A0 : T2 ≠ A0)
    (hT2A1 : T2 ≠ A1) (hT3U : T3 ≠ U) (hT3A0 : T3 ≠ A0)
    (hT3A1 : T3 ≠ A1) (hUA0 : U ≠ A0) (hUA1 : U ≠ A1)
    (hA01 : A0 ≠ A1) :
    Function.Injective (pointOf P Q T1 T2 T3 U A0 A1) := by
  intro x y hxy
  fin_cases x <;> fin_cases y <;>
    simp [pointOf] at hxy ⊢ <;> aesop

theorem supportSet_pointOf_eq_boundedSupport
    (D : CounterexampleData) (q p t1 t2 t3 u a0 a1 : ℝ²) :
    supportSet (pointOf p q t1 t2 t3 u a0 a1) =
      U5BoundedSupport D q p ({t1, t2, t3} : Finset ℝ²) u a0 a1 := by
  ext x
  simp [supportSet, labelFinset, labels, pointOf, U5BoundedSupport]
  tauto

theorem ne_of_mem_skeleton_erase
    {D : CounterexampleData} {q p x : ℝ²}
    (hx : x ∈ (D.skeleton q).erase p) :
    p ≠ x ∧ q ≠ x := by
  have hxp : x ≠ p := (Finset.mem_erase.mp hx).1
  have hx_skel : x ∈ D.skeleton q := (Finset.mem_erase.mp hx).2
  have hxq : x ≠ q := by
    have hxA : x ∈ D.A.erase q := by
      simpa [CounterexampleData.skeleton] using hx_skel
    exact (Finset.mem_erase.mp hxA).1
  exact ⟨hxp.symm, hxq.symm⟩

set_option maxHeartbeats 1000000 in
-- Native execution over the finite label powerset with the same
-- compiler-trust profile as `bv_decide`.
set_option maxRecDepth 10000 in
set_option linter.style.nativeDecide false in
theorem overlapAtMostTwo_labelMask_of_card_le
    {L₁ L₂ : Finset U5AuditLabel}
    (h : (L₁ ∩ L₂).card ≤ 2) :
    overlapAtMostTwo (labelMask L₁) (labelMask L₂) = true := by
  native_decide +revert

set_option maxHeartbeats 1000000 in
-- Native execution over the finite label powerset with the same
-- compiler-trust profile as `bv_decide`.
set_option maxRecDepth 10000 in
set_option linter.style.nativeDecide false in
theorem mem_of_has_labelMask {L : Finset U5AuditLabel} {l : U5AuditLabel}
    (h : has (labelMask L) l = true) : l ∈ L := by
  native_decide +revert

theorem point_mem_of_has_labelMask_classLabels
    {pt : U5AuditLabel → ℝ²} {B : Finset ℝ²} {l : U5AuditLabel}
    (h : has (labelMask (classLabels pt B)) l = true) :
    pt l ∈ B := by
  exact (Finset.mem_filter.mp (mem_of_has_labelMask h)).2

theorem point_mem_of_containsAll_labelMask_classLabels
    {pt : U5AuditLabel → ℝ²} {B : Finset ℝ²}
    {xs : List U5AuditLabel}
    (h : containsAll (labelMask (classLabels pt B)) xs = true) :
    ∀ l ∈ xs, pt l ∈ B := by
  intro l hl
  exact point_mem_of_has_labelMask_classLabels (List.all_eq_true.mp h l hl)

noncomputable def selectedClass
    (Bt1 Bt2 Bt3 Bu Ba0 Ba1 : Finset ℝ²) :
    U5AuditLabel → Finset ℝ²
  | t1 => Bt1
  | t2 => Bt2
  | t3 => Bt3
  | u => Bu
  | a0 => Ba0
  | a1 => Ba1
  | p => ∅
  | q => ∅

structure RoutedPatternData (D : CounterexampleData)
    (pt : U5AuditLabel → ℝ²) where
  Bt1 : Finset ℝ²
  Bt2 : Finset ℝ²
  Bt3 : Finset ℝ²
  Bu : Finset ℝ²
  Ba0 : Finset ℝ²
  Ba1 : Finset ℝ²
  Kt1 : U5QDeletedK4Class D (pt q) (pt t1) Bt1
  Kt2 : U5QDeletedK4Class D (pt q) (pt t2) Bt2
  Kt3 : U5QDeletedK4Class D (pt q) (pt t3) Bt3
  Ku : U5QDeletedK4Class D (pt q) (pt u) Bu
  Ka0 : U5QDeletedK4Class D (pt q) (pt a0) Ba0
  Ka1 : U5QDeletedK4Class D (pt q) (pt a1) Ba1
  P : IndexPattern
  hP : P ∈ boundedIndexPatterns
  h1 : choice t1 P.i1 = labelMask (classLabels pt Bt1)
  h2 : choice t2 P.i2 = labelMask (classLabels pt Bt2)
  h3 : choice t3 P.i3 = labelMask (classLabels pt Bt3)
  hu : choice u P.iu = labelMask (classLabels pt Bu)
  h0 : choice a0 P.ia0 = labelMask (classLabels pt Ba0)
  h1a : choice a1 P.ia1 = labelMask (classLabels pt Ba1)
  reason : PrefilterReason
  hreason : patternReason P = some reason

theorem false_of_has_zero {l : U5AuditLabel}
    (h : has 0 l = true) : False := by
  fin_cases l <;> simp [has, code] at h

theorem false_of_containsAll_zero
    {xs : List U5AuditLabel} {l : U5AuditLabel}
    (h : containsAll 0 xs = true) (hl : l ∈ xs) : False := by
  have hhas := List.all_eq_true.mp h l hl
  exact false_of_has_zero hhas

theorem point_mem_of_has_selected
    {Λ : PointLabeling} {P : IndexPattern}
    {Bt1 Bt2 Bt3 Bu Ba0 Ba1 : Finset ℝ²}
    (h1 : choice t1 P.i1 = labelMask (classLabels Λ.point Bt1))
    (h2 : choice t2 P.i2 = labelMask (classLabels Λ.point Bt2))
    (h3 : choice t3 P.i3 = labelMask (classLabels Λ.point Bt3))
    (hu : choice u P.iu = labelMask (classLabels Λ.point Bu))
    (h0 : choice a0 P.ia0 = labelMask (classLabels Λ.point Ba0))
    (h1a : choice a1 P.ia1 = labelMask (classLabels Λ.point Ba1))
    {center l : U5AuditLabel}
    (h : has (classOf P.i1 P.i2 P.i3 P.iu P.ia0 P.ia1 center) l = true) :
    Λ.point l ∈ selectedClass Bt1 Bt2 Bt3 Bu Ba0 Ba1 center := by
  fin_cases center
  · have h' : has 0 l = true := by simpa [classOf] using h
    exact (false_of_has_zero h').elim
  · have h' : has 0 l = true := by simpa [classOf] using h
    exact (false_of_has_zero h').elim
  · have h' : has (labelMask (classLabels Λ.point Bt1)) l = true := by
      simpa [classOf, h1] using h
    exact point_mem_of_has_labelMask_classLabels h'
  · have h' : has (labelMask (classLabels Λ.point Bt2)) l = true := by
      simpa [classOf, h2] using h
    exact point_mem_of_has_labelMask_classLabels h'
  · have h' : has (labelMask (classLabels Λ.point Bt3)) l = true := by
      simpa [classOf, h3] using h
    exact point_mem_of_has_labelMask_classLabels h'
  · have h' : has (labelMask (classLabels Λ.point Bu)) l = true := by
      simpa [classOf, hu] using h
    exact point_mem_of_has_labelMask_classLabels h'
  · have h' : has (labelMask (classLabels Λ.point Ba0)) l = true := by
      simpa [classOf, h0] using h
    exact point_mem_of_has_labelMask_classLabels h'
  · have h' : has (labelMask (classLabels Λ.point Ba1)) l = true := by
      simpa [classOf, h1a] using h
    exact point_mem_of_has_labelMask_classLabels h'

theorem point_mem_of_classContains_selected
    {Λ : PointLabeling} {P : IndexPattern}
    {Bt1 Bt2 Bt3 Bu Ba0 Ba1 : Finset ℝ²}
    (h1 : choice t1 P.i1 = labelMask (classLabels Λ.point Bt1))
    (h2 : choice t2 P.i2 = labelMask (classLabels Λ.point Bt2))
    (h3 : choice t3 P.i3 = labelMask (classLabels Λ.point Bt3))
    (hu : choice u P.iu = labelMask (classLabels Λ.point Bu))
    (h0 : choice a0 P.ia0 = labelMask (classLabels Λ.point Ba0))
    (h1a : choice a1 P.ia1 = labelMask (classLabels Λ.point Ba1))
    {center l : U5AuditLabel} {xs : List U5AuditLabel}
    (h : classContains P.i1 P.i2 P.i3 P.iu P.ia0 P.ia1 center xs = true)
    (hl : l ∈ xs) :
    Λ.point l ∈ selectedClass Bt1 Bt2 Bt3 Bu Ba0 Ba1 center := by
  fin_cases center
  · have h' : containsAll 0 xs = true := by
      simpa [classContains, classOf] using h
    exact (false_of_containsAll_zero h' hl).elim
  · have h' : containsAll 0 xs = true := by
      simpa [classContains, classOf] using h
    exact (false_of_containsAll_zero h' hl).elim
  · have h' : containsAll (labelMask (classLabels Λ.point Bt1)) xs = true := by
      simpa [classContains, classOf, h1] using h
    exact point_mem_of_containsAll_labelMask_classLabels h' l hl
  · have h' : containsAll (labelMask (classLabels Λ.point Bt2)) xs = true := by
      simpa [classContains, classOf, h2] using h
    exact point_mem_of_containsAll_labelMask_classLabels h' l hl
  · have h' : containsAll (labelMask (classLabels Λ.point Bt3)) xs = true := by
      simpa [classContains, classOf, h3] using h
    exact point_mem_of_containsAll_labelMask_classLabels h' l hl
  · have h' : containsAll (labelMask (classLabels Λ.point Bu)) xs = true := by
      simpa [classContains, classOf, hu] using h
    exact point_mem_of_containsAll_labelMask_classLabels h' l hl
  · have h' : containsAll (labelMask (classLabels Λ.point Ba0)) xs = true := by
      simpa [classContains, classOf, h0] using h
    exact point_mem_of_containsAll_labelMask_classLabels h' l hl
  · have h' : containsAll (labelMask (classLabels Λ.point Ba1)) xs = true := by
      simpa [classContains, classOf, h1a] using h
    exact point_mem_of_containsAll_labelMask_classLabels h' l hl

theorem mem_centers_of_mem_triple {x : U5AuditLabel}
    (hx : x ∈ triple) : x ∈ centers := by
  fin_cases x <;> simp [triple, centers] at hx ⊢

theorem mem_centers_of_mem_nonTriple {x : U5AuditLabel}
    (hx : x ∈ nonTriple) : x ∈ centers := by
  fin_cases x <;> simp [nonTriple, centers] at hx ⊢

theorem thirdTriple_mem_triple {a b : U5AuditLabel}
    (ha : a ∈ triple) (hb : b ∈ triple) :
    thirdTriple a b ∈ triple := by
  fin_cases a <;> fin_cases b <;>
    simp [thirdTriple, triple] at ha hb ⊢

theorem radius_of_mem_triple
    {Λ : PointLabeling}
    (ht1_radius : dist (Λ.point p) (Λ.point t1) =
      dist (Λ.point p) (Λ.point q))
    (ht2_radius : dist (Λ.point p) (Λ.point t2) =
      dist (Λ.point p) (Λ.point q))
    (ht3_radius : dist (Λ.point p) (Λ.point t3) =
      dist (Λ.point p) (Λ.point q))
    {t : U5AuditLabel} (ht : t ∈ triple) :
    dist (Λ.point p) (Λ.point t) =
      dist (Λ.point p) (Λ.point q) := by
  cases t
  · simp [triple] at ht
  · simp [triple] at ht
  · exact ht1_radius
  · exact ht2_radius
  · exact ht3_radius
  · simp [triple] at ht
  · simp [triple] at ht
  · simp [triple] at ht

theorem off_circle_of_mem_nonTriple
    {Λ : PointLabeling}
    (hu_off : dist (Λ.point p) (Λ.point u) ≠
      dist (Λ.point p) (Λ.point q))
    (ha0_off : dist (Λ.point p) (Λ.point a0) ≠
      dist (Λ.point p) (Λ.point q))
    (ha1_off : dist (Λ.point p) (Λ.point a1) ≠
      dist (Λ.point p) (Λ.point q))
    {x : U5AuditLabel} (hx : x ∈ nonTriple) :
    dist (Λ.point p) (Λ.point x) ≠
      dist (Λ.point p) (Λ.point q) := by
  cases x
  · simp [nonTriple] at hx
  · simp [nonTriple] at hx
  · simp [nonTriple] at hx
  · simp [nonTriple] at hx
  · simp [nonTriple] at hx
  · exact hu_off
  · exact ha0_off
  · exact ha1_off

noncomputable def selectedKOfCenter
    {D : CounterexampleData} {Λ : PointLabeling}
    {Bt1 Bt2 Bt3 Bu Ba0 Ba1 : Finset ℝ²}
    (Kt1 : U5QDeletedK4Class D (Λ.point q) (Λ.point t1) Bt1)
    (Kt2 : U5QDeletedK4Class D (Λ.point q) (Λ.point t2) Bt2)
    (Kt3 : U5QDeletedK4Class D (Λ.point q) (Λ.point t3) Bt3)
    (Ku : U5QDeletedK4Class D (Λ.point q) (Λ.point u) Bu)
    (Ka0 : U5QDeletedK4Class D (Λ.point q) (Λ.point a0) Ba0)
    (Ka1 : U5QDeletedK4Class D (Λ.point q) (Λ.point a1) Ba1)
    {center : U5AuditLabel} (hc : center ∈ centers) :
    U5QDeletedK4Class D (Λ.point q) (Λ.point center)
      (selectedClass Bt1 Bt2 Bt3 Bu Ba0 Ba1 center) := by
  cases center
  · simp [centers] at hc
  · simp [centers] at hc
  · exact Kt1
  · exact Kt2
  · exact Kt3
  · exact Ku
  · exact Ka0
  · exact Ka1

theorem unitTriangleIncompatibility_of_patternReason_eq {P : IndexPattern}
    (h : patternReason P = some PrefilterReason.unitTriangleOnPCircle) :
    unitTriangleIncompatibility P.i1 P.i2 P.i3 P.iu P.ia0 P.ia1 = true := by
  unfold patternReason prefilterReason at h
  repeat split at h <;> simp_all

theorem nontripleEquilateralOnPCircleIncompatibility_of_patternReason_eq
    {P : IndexPattern}
    (h : patternReason P =
      some PrefilterReason.nontripleEquilateralOnPCircle) :
    nontripleEquilateralOnPCircleIncompatibility
      P.i1 P.i2 P.i3 P.iu P.ia0 P.ia1 = true := by
  unfold patternReason prefilterReason at h
  repeat split at h <;> simp_all

theorem equilateralOppositeIncompatibility_of_patternReason_eq
    {P : IndexPattern}
    (h : patternReason P = some PrefilterReason.equilateralOppositePoint) :
    equilateralOppositeIncompatibility P.i1 P.i2 P.i3 P.iu P.ia0 P.ia1 =
      true := by
  unfold patternReason prefilterReason at h
  repeat split at h <;> simp_all

theorem equilateralBisectorIncompatibility_of_patternReason_eq
    {P : IndexPattern}
    (h : patternReason P = some PrefilterReason.equilateralBisector) :
    equilateralBisectorIncompatibility P.i1 P.i2 P.i3 P.iu P.ia0 P.ia1 =
      true := by
  unfold patternReason prefilterReason at h
  repeat split at h <;> simp_all

theorem commonBisectorTripleIncompatibility_of_patternReason_eq
    {P : IndexPattern}
    (h : patternReason P = some PrefilterReason.commonBisectorTriple) :
    commonBisectorTripleIncompatibility P.i1 P.i2 P.i3 P.iu P.ia0 P.ia1 =
      true := by
  unfold patternReason prefilterReason at h
  repeat split at h <;> simp_all

theorem equilateralCircumcenterIncompatibility_of_patternReason_eq
    {P : IndexPattern}
    (h : patternReason P =
      some PrefilterReason.equilateralCircumcenterOnPCircle) :
    equilateralCircumcenterIncompatibility P.i1 P.i2 P.i3 P.iu P.ia0 P.ia1 =
      true := by
  unfold patternReason prefilterReason at h
  repeat split at h <;> simp_all

theorem equilateralOuterPointIncompatibility_of_patternReason_eq
    {P : IndexPattern}
    (h : patternReason P = some PrefilterReason.equilateralOuterPoint) :
    equilateralOuterPointIncompatibility P.i1 P.i2 P.i3 P.iu P.ia0 P.ia1 =
      true := by
  unfold patternReason prefilterReason at h
  repeat split at h <;> simp_all

theorem exists_nontripleEquilateralOnPCircle_witness {P : IndexPattern}
    (h : nontripleEquilateralOnPCircleIncompatibility
      P.i1 P.i2 P.i3 P.iu P.ia0 P.ia1 = true) :
    ∃ t, t ∈ triple ∧ ∃ x, x ∈ nonTriple ∧
      classContains P.i1 P.i2 P.i3 P.iu P.ia0 P.ia1 t [p, x] = true ∧
      classContains P.i1 P.i2 P.i3 P.iu P.ia0 P.ia1 x [p, t] = true := by
  unfold nontripleEquilateralOnPCircleIncompatibility at h
  rcases List.any_eq_true.mp h with ⟨t, ht, htbool⟩
  rcases List.any_eq_true.mp htbool with ⟨x, hx, hxbool⟩
  rw [Bool.and_eq_true] at hxbool
  exact ⟨t, ht, x, hx, hxbool.1, hxbool.2⟩

theorem exists_commonBisectorTriple_witness {P : IndexPattern}
    (h : commonBisectorTripleIncompatibility
      P.i1 P.i2 P.i3 P.iu P.ia0 P.ia1 = true) :
    ∃ x, x ∈ nonTriple ∧
      classContains P.i1 P.i2 P.i3 P.iu P.ia0 P.ia1
        x [p, t1, t2, t3] = true := by
  unfold commonBisectorTripleIncompatibility at h
  exact List.any_eq_true.mp h

theorem exists_equilateralOpposite_witness {P : IndexPattern}
    (h : equilateralOppositeIncompatibility
      P.i1 P.i2 P.i3 P.iu P.ia0 P.ia1 = true) :
    ∃ a, a ∈ triple ∧ ∃ b, b ∈ triple ∧ b ≠ a ∧
    ∃ x, x ∈ nonTriple ∧
      let c := thirdTriple a b
      classContains P.i1 P.i2 P.i3 P.iu P.ia0 P.ia1
        a [p, b, c, x] = true ∧
      classContains P.i1 P.i2 P.i3 P.iu P.ia0 P.ia1
        b [p, a, x] = true ∧
      classContains P.i1 P.i2 P.i3 P.iu P.ia0 P.ia1
        x [p, c] = true := by
  unfold equilateralOppositeIncompatibility at h
  rcases List.any_eq_true.mp h with ⟨a, ha, habool⟩
  rcases List.any_eq_true.mp habool with ⟨b, hb, hbbool⟩
  rw [Bool.and_eq_true] at hbbool
  have hba : b ≠ a := of_decide_eq_true hbbool.1
  rcases List.any_eq_true.mp hbbool.2 with ⟨x, hx, hxbool⟩
  rw [Bool.and_eq_true] at hxbool
  rcases hxbool with ⟨habcx, hxc⟩
  rw [Bool.and_eq_true] at habcx
  rcases habcx with ⟨hac, hbc⟩
  exact ⟨a, ha, b, hb, hba, x, hx, hac, hbc, hxc⟩

theorem exists_equilateralBisector_witness {P : IndexPattern}
    (h : equilateralBisectorIncompatibility
      P.i1 P.i2 P.i3 P.iu P.ia0 P.ia1 = true) :
    ∃ a, a ∈ triple ∧ ∃ b, b ∈ triple ∧ b ≠ a ∧
    ∃ x, x ∈ nonTriple ∧
      let c := thirdTriple a b
      classContains P.i1 P.i2 P.i3 P.iu P.ia0 P.ia1
        a [p, b, x] = true ∧
      classContains P.i1 P.i2 P.i3 P.iu P.ia0 P.ia1
        b [p, a, x] = true ∧
      classContains P.i1 P.i2 P.i3 P.iu P.ia0 P.ia1
        x [p, c] = true ∧
      classContains P.i1 P.i2 P.i3 P.iu P.ia0 P.ia1
        c [a, b] = true := by
  unfold equilateralBisectorIncompatibility at h
  rcases List.any_eq_true.mp h with ⟨a, ha, habool⟩
  rcases List.any_eq_true.mp habool with ⟨b, hb, hbbool⟩
  rw [Bool.and_eq_true] at hbbool
  have hba : b ≠ a := of_decide_eq_true hbbool.1
  rcases List.any_eq_true.mp hbbool.2 with ⟨x, hx, hxbool⟩
  rw [Bool.and_eq_true] at hxbool
  rcases hxbool with ⟨habcx, hcc⟩
  rw [Bool.and_eq_true] at habcx
  rcases habcx with ⟨habc, hxc⟩
  rw [Bool.and_eq_true] at habc
  rcases habc with ⟨hac, hbc⟩
  exact ⟨a, ha, b, hb, hba, x, hx, hac, hbc, hxc, hcc⟩

theorem exists_two_triple_of_count {B : ClassMask}
    (h : 2 ≤ (triple.filter fun t => has B t).length) :
    ∃ a, a ∈ triple ∧ ∃ b, b ∈ triple ∧ a ≠ b ∧
      has B a = true ∧ has B b = true := by
  by_cases h1 : has B t1 = true <;>
  by_cases h2 : has B t2 = true <;>
  by_cases h3 : has B t3 = true <;>
    simp [triple, h1, h2, h3] at h ⊢

theorem route_nontripleEquilateralOnPCircle
    {D : CounterexampleData} {Λ : PointLabeling} {P : IndexPattern}
    {Bt1 Bt2 Bt3 Bu Ba0 Ba1 : Finset ℝ²}
    (Kt1 : U5QDeletedK4Class D (Λ.point q) (Λ.point t1) Bt1)
    (Kt2 : U5QDeletedK4Class D (Λ.point q) (Λ.point t2) Bt2)
    (Kt3 : U5QDeletedK4Class D (Λ.point q) (Λ.point t3) Bt3)
    (Ku : U5QDeletedK4Class D (Λ.point q) (Λ.point u) Bu)
    (Ka0 : U5QDeletedK4Class D (Λ.point q) (Λ.point a0) Ba0)
    (Ka1 : U5QDeletedK4Class D (Λ.point q) (Λ.point a1) Ba1)
    (h1 : choice t1 P.i1 = labelMask (classLabels Λ.point Bt1))
    (h2 : choice t2 P.i2 = labelMask (classLabels Λ.point Bt2))
    (h3 : choice t3 P.i3 = labelMask (classLabels Λ.point Bt3))
    (hu : choice u P.iu = labelMask (classLabels Λ.point Bu))
    (h0 : choice a0 P.ia0 = labelMask (classLabels Λ.point Ba0))
    (h1a : choice a1 P.ia1 = labelMask (classLabels Λ.point Ba1))
    (ht1_radius : dist (Λ.point p) (Λ.point t1) =
      dist (Λ.point p) (Λ.point q))
    (ht2_radius : dist (Λ.point p) (Λ.point t2) =
      dist (Λ.point p) (Λ.point q))
    (ht3_radius : dist (Λ.point p) (Λ.point t3) =
      dist (Λ.point p) (Λ.point q))
    (hu_off : dist (Λ.point p) (Λ.point u) ≠
      dist (Λ.point p) (Λ.point q))
    (ha0_off : dist (Λ.point p) (Λ.point a0) ≠
      dist (Λ.point p) (Λ.point q))
    (ha1_off : dist (Λ.point p) (Λ.point a1) ≠
      dist (Λ.point p) (Λ.point q))
    (hobs : nontripleEquilateralOnPCircleIncompatibility
      P.i1 P.i2 P.i3 P.iu P.ia0 P.ia1 = true) : False := by
  rcases exists_nontripleEquilateralOnPCircle_witness hobs with
    ⟨t, ht, x, hx, htx, hxt⟩
  let Kt :=
    selectedKOfCenter Kt1 Kt2 Kt3 Ku Ka0 Ka1
      (mem_centers_of_mem_triple ht)
  let Kx :=
    selectedKOfCenter Kt1 Kt2 Kt3 Ku Ka0 Ka1
      (mem_centers_of_mem_nonTriple hx)
  exact u5_nontriple_equilateral_on_p_circle_incompatibility
    (D := D) (q := Λ.point q) (p := Λ.point p)
    (t := Λ.point t) (x := Λ.point x)
    (Bt := selectedClass Bt1 Bt2 Bt3 Bu Ba0 Ba1 t)
    (Bx := selectedClass Bt1 Bt2 Bt3 Bu Ba0 Ba1 x)
    (radius_of_mem_triple ht1_radius ht2_radius ht3_radius ht)
    (off_circle_of_mem_nonTriple hu_off ha0_off ha1_off hx)
    Kt Kx
    (point_mem_of_classContains_selected h1 h2 h3 hu h0 h1a htx
      (by simp))
    (point_mem_of_classContains_selected h1 h2 h3 hu h0 h1a htx
      (by simp))
    (point_mem_of_classContains_selected h1 h2 h3 hu h0 h1a hxt
      (by simp))
    (point_mem_of_classContains_selected h1 h2 h3 hu h0 h1a hxt
      (by simp))

theorem route_commonBisectorTriple
    {D : CounterexampleData} {Λ : PointLabeling} {P : IndexPattern}
    {Bt1 Bt2 Bt3 Bu Ba0 Ba1 : Finset ℝ²}
    (Kt1 : U5QDeletedK4Class D (Λ.point q) (Λ.point t1) Bt1)
    (Kt2 : U5QDeletedK4Class D (Λ.point q) (Λ.point t2) Bt2)
    (Kt3 : U5QDeletedK4Class D (Λ.point q) (Λ.point t3) Bt3)
    (Ku : U5QDeletedK4Class D (Λ.point q) (Λ.point u) Bu)
    (Ka0 : U5QDeletedK4Class D (Λ.point q) (Λ.point a0) Ba0)
    (Ka1 : U5QDeletedK4Class D (Λ.point q) (Λ.point a1) Ba1)
    (h1 : choice t1 P.i1 = labelMask (classLabels Λ.point Bt1))
    (h2 : choice t2 P.i2 = labelMask (classLabels Λ.point Bt2))
    (h3 : choice t3 P.i3 = labelMask (classLabels Λ.point Bt3))
    (hu : choice u P.iu = labelMask (classLabels Λ.point Bu))
    (h0 : choice a0 P.ia0 = labelMask (classLabels Λ.point Ba0))
    (h1a : choice a1 P.ia1 = labelMask (classLabels Λ.point Ba1))
    (hr_pos : 0 < dist (Λ.point p) (Λ.point q))
    (hT_noncol : ¬ Collinear ℝ
      ({Λ.point t1, Λ.point t2, Λ.point t3} : Set ℝ²))
    (ht1_radius : dist (Λ.point p) (Λ.point t1) =
      dist (Λ.point p) (Λ.point q))
    (ht2_radius : dist (Λ.point p) (Λ.point t2) =
      dist (Λ.point p) (Λ.point q))
    (ht3_radius : dist (Λ.point p) (Λ.point t3) =
      dist (Λ.point p) (Λ.point q))
    (hobs : commonBisectorTripleIncompatibility
      P.i1 P.i2 P.i3 P.iu P.ia0 P.ia1 = true) : False := by
  rcases exists_commonBisectorTriple_witness hobs with ⟨x, hx, hcontains⟩
  let Kx :=
    selectedKOfCenter Kt1 Kt2 Kt3 Ku Ka0 Ka1
      (mem_centers_of_mem_nonTriple hx)
  exact u5_common_bisector_triple_incompatibility
    (D := D) (q := Λ.point q) (p := Λ.point p)
    (x := Λ.point x) (t1 := Λ.point t1) (t2 := Λ.point t2)
    (t3 := Λ.point t3)
    (Bx := selectedClass Bt1 Bt2 Bt3 Bu Ba0 Ba1 x)
    hr_pos hT_noncol ht1_radius ht2_radius ht3_radius Kx
    (point_mem_of_classContains_selected h1 h2 h3 hu h0 h1a hcontains
      (by simp))
    (point_mem_of_classContains_selected h1 h2 h3 hu h0 h1a hcontains
      (by simp))
    (point_mem_of_classContains_selected h1 h2 h3 hu h0 h1a hcontains
      (by simp))
    (point_mem_of_classContains_selected h1 h2 h3 hu h0 h1a hcontains
      (by simp))

theorem route_equilateralOpposite
    {D : CounterexampleData} {Λ : PointLabeling} {P : IndexPattern}
    {Bt1 Bt2 Bt3 Bu Ba0 Ba1 : Finset ℝ²}
    (Kt1 : U5QDeletedK4Class D (Λ.point q) (Λ.point t1) Bt1)
    (Kt2 : U5QDeletedK4Class D (Λ.point q) (Λ.point t2) Bt2)
    (Kt3 : U5QDeletedK4Class D (Λ.point q) (Λ.point t3) Bt3)
    (Ku : U5QDeletedK4Class D (Λ.point q) (Λ.point u) Bu)
    (Ka0 : U5QDeletedK4Class D (Λ.point q) (Λ.point a0) Ba0)
    (Ka1 : U5QDeletedK4Class D (Λ.point q) (Λ.point a1) Ba1)
    (h1 : choice t1 P.i1 = labelMask (classLabels Λ.point Bt1))
    (h2 : choice t2 P.i2 = labelMask (classLabels Λ.point Bt2))
    (h3 : choice t3 P.i3 = labelMask (classLabels Λ.point Bt3))
    (hu : choice u P.iu = labelMask (classLabels Λ.point Bu))
    (h0 : choice a0 P.ia0 = labelMask (classLabels Λ.point Ba0))
    (h1a : choice a1 P.ia1 = labelMask (classLabels Λ.point Ba1))
    (hr_pos : 0 < dist (Λ.point p) (Λ.point q))
    (ht1_radius : dist (Λ.point p) (Λ.point t1) =
      dist (Λ.point p) (Λ.point q))
    (ht2_radius : dist (Λ.point p) (Λ.point t2) =
      dist (Λ.point p) (Λ.point q))
    (ht3_radius : dist (Λ.point p) (Λ.point t3) =
      dist (Λ.point p) (Λ.point q))
    (hobs : equilateralOppositeIncompatibility
      P.i1 P.i2 P.i3 P.iu P.ia0 P.ia1 = true) : False := by
  rcases exists_equilateralOpposite_witness hobs with
    ⟨a, ha, b, hb, _hne, x, hx, haclass, hbclass, hxclass⟩
  let c := thirdTriple a b
  have hc : c ∈ triple := thirdTriple_mem_triple ha hb
  let Ka :=
    selectedKOfCenter Kt1 Kt2 Kt3 Ku Ka0 Ka1
      (mem_centers_of_mem_triple ha)
  let Kb :=
    selectedKOfCenter Kt1 Kt2 Kt3 Ku Ka0 Ka1
      (mem_centers_of_mem_triple hb)
  let Kx :=
    selectedKOfCenter Kt1 Kt2 Kt3 Ku Ka0 Ka1
      (mem_centers_of_mem_nonTriple hx)
  exact u5_equilateral_opposite_point_incompatibility
    (D := D) (q := Λ.point q) (p := Λ.point p)
    (a := Λ.point a) (b := Λ.point b) (c := Λ.point c)
    (x := Λ.point x)
    (Ba := selectedClass Bt1 Bt2 Bt3 Bu Ba0 Ba1 a)
    (Bb := selectedClass Bt1 Bt2 Bt3 Bu Ba0 Ba1 b)
    (Bx := selectedClass Bt1 Bt2 Bt3 Bu Ba0 Ba1 x)
    hr_pos
    (radius_of_mem_triple ht1_radius ht2_radius ht3_radius ha)
    (radius_of_mem_triple ht1_radius ht2_radius ht3_radius hb)
    (radius_of_mem_triple ht1_radius ht2_radius ht3_radius hc)
    Ka Kb Kx
    (point_mem_of_classContains_selected h1 h2 h3 hu h0 h1a haclass
      (by simp))
    (point_mem_of_classContains_selected h1 h2 h3 hu h0 h1a haclass
      (by simp))
    (point_mem_of_classContains_selected h1 h2 h3 hu h0 h1a haclass
      (by simp [c]))
    (point_mem_of_classContains_selected h1 h2 h3 hu h0 h1a haclass
      (by simp))
    (point_mem_of_classContains_selected h1 h2 h3 hu h0 h1a hbclass
      (by simp))
    (point_mem_of_classContains_selected h1 h2 h3 hu h0 h1a hbclass
      (by simp))
    (point_mem_of_classContains_selected h1 h2 h3 hu h0 h1a hbclass
      (by simp))
    (point_mem_of_classContains_selected h1 h2 h3 hu h0 h1a hxclass
      (by simp))
    (point_mem_of_classContains_selected h1 h2 h3 hu h0 h1a hxclass
      (by simp [c]))

theorem route_equilateralBisector
    {D : CounterexampleData} {Λ : PointLabeling} {P : IndexPattern}
    {Bt1 Bt2 Bt3 Bu Ba0 Ba1 : Finset ℝ²}
    (Kt1 : U5QDeletedK4Class D (Λ.point q) (Λ.point t1) Bt1)
    (Kt2 : U5QDeletedK4Class D (Λ.point q) (Λ.point t2) Bt2)
    (Kt3 : U5QDeletedK4Class D (Λ.point q) (Λ.point t3) Bt3)
    (Ku : U5QDeletedK4Class D (Λ.point q) (Λ.point u) Bu)
    (Ka0 : U5QDeletedK4Class D (Λ.point q) (Λ.point a0) Ba0)
    (Ka1 : U5QDeletedK4Class D (Λ.point q) (Λ.point a1) Ba1)
    (h1 : choice t1 P.i1 = labelMask (classLabels Λ.point Bt1))
    (h2 : choice t2 P.i2 = labelMask (classLabels Λ.point Bt2))
    (h3 : choice t3 P.i3 = labelMask (classLabels Λ.point Bt3))
    (hu : choice u P.iu = labelMask (classLabels Λ.point Bu))
    (h0 : choice a0 P.ia0 = labelMask (classLabels Λ.point Ba0))
    (h1a : choice a1 P.ia1 = labelMask (classLabels Λ.point Ba1))
    (hr_pos : 0 < dist (Λ.point p) (Λ.point q))
    (ht1_radius : dist (Λ.point p) (Λ.point t1) =
      dist (Λ.point p) (Λ.point q))
    (ht2_radius : dist (Λ.point p) (Λ.point t2) =
      dist (Λ.point p) (Λ.point q))
    (ht3_radius : dist (Λ.point p) (Λ.point t3) =
      dist (Λ.point p) (Λ.point q))
    (hobs : equilateralBisectorIncompatibility
      P.i1 P.i2 P.i3 P.iu P.ia0 P.ia1 = true) : False := by
  rcases exists_equilateralBisector_witness hobs with
    ⟨a, ha, b, hb, _hne, x, hx, haclass, hbclass, hxclass, hcclass⟩
  let c := thirdTriple a b
  have hc : c ∈ triple := thirdTriple_mem_triple ha hb
  let Ka :=
    selectedKOfCenter Kt1 Kt2 Kt3 Ku Ka0 Ka1
      (mem_centers_of_mem_triple ha)
  let Kb :=
    selectedKOfCenter Kt1 Kt2 Kt3 Ku Ka0 Ka1
      (mem_centers_of_mem_triple hb)
  let Kx :=
    selectedKOfCenter Kt1 Kt2 Kt3 Ku Ka0 Ka1
      (mem_centers_of_mem_nonTriple hx)
  let Kc :=
    selectedKOfCenter Kt1 Kt2 Kt3 Ku Ka0 Ka1
      (mem_centers_of_mem_triple hc)
  exact u5_equilateral_bisector_incompatibility
    (D := D) (q := Λ.point q) (p := Λ.point p)
    (a := Λ.point a) (b := Λ.point b) (c := Λ.point c)
    (x := Λ.point x)
    (Ba := selectedClass Bt1 Bt2 Bt3 Bu Ba0 Ba1 a)
    (Bb := selectedClass Bt1 Bt2 Bt3 Bu Ba0 Ba1 b)
    (Bx := selectedClass Bt1 Bt2 Bt3 Bu Ba0 Ba1 x)
    (Bc := selectedClass Bt1 Bt2 Bt3 Bu Ba0 Ba1 c)
    hr_pos
    (radius_of_mem_triple ht1_radius ht2_radius ht3_radius ha)
    (radius_of_mem_triple ht1_radius ht2_radius ht3_radius hb)
    (radius_of_mem_triple ht1_radius ht2_radius ht3_radius hc)
    Ka Kb Kx Kc
    (point_mem_of_classContains_selected h1 h2 h3 hu h0 h1a haclass
      (by simp))
    (point_mem_of_classContains_selected h1 h2 h3 hu h0 h1a haclass
      (by simp))
    (point_mem_of_classContains_selected h1 h2 h3 hu h0 h1a haclass
      (by simp))
    (point_mem_of_classContains_selected h1 h2 h3 hu h0 h1a hbclass
      (by simp))
    (point_mem_of_classContains_selected h1 h2 h3 hu h0 h1a hbclass
      (by simp))
    (point_mem_of_classContains_selected h1 h2 h3 hu h0 h1a hbclass
      (by simp))
    (point_mem_of_classContains_selected h1 h2 h3 hu h0 h1a hxclass
      (by simp))
    (point_mem_of_classContains_selected h1 h2 h3 hu h0 h1a hxclass
      (by simp [c]))
    (point_mem_of_classContains_selected h1 h2 h3 hu h0 h1a hcclass
      (by simp))
    (point_mem_of_classContains_selected h1 h2 h3 hu h0 h1a hcclass
      (by simp))

theorem triple_pair_distances_equal_of_forced
    {D : CounterexampleData} {Λ : PointLabeling} {P : IndexPattern}
    {Bt1 Bt2 Bt3 Bu Ba0 Ba1 : Finset ℝ²}
    (Kt1 : U5QDeletedK4Class D (Λ.point q) (Λ.point t1) Bt1)
    (Kt2 : U5QDeletedK4Class D (Λ.point q) (Λ.point t2) Bt2)
    (Kt3 : U5QDeletedK4Class D (Λ.point q) (Λ.point t3) Bt3)
    (h1 : choice t1 P.i1 = labelMask (classLabels Λ.point Bt1))
    (h2 : choice t2 P.i2 = labelMask (classLabels Λ.point Bt2))
    (h3 : choice t3 P.i3 = labelMask (classLabels Λ.point Bt3))
    (hu : choice u P.iu = labelMask (classLabels Λ.point Bu))
    (h0 : choice a0 P.ia0 = labelMask (classLabels Λ.point Ba0))
    (h1a : choice a1 P.ia1 = labelMask (classLabels Λ.point Ba1))
    (hpair : triplePairDotsForcedEqual
      P.i1 P.i2 P.i3 P.iu P.ia0 P.ia1 = true) :
    dist (Λ.point t1) (Λ.point t2) =
      dist (Λ.point t1) (Λ.point t3) ∧
    dist (Λ.point t1) (Λ.point t2) =
      dist (Λ.point t2) (Λ.point t3) := by
  have e01_dist :
      classContains P.i1 P.i2 P.i3 P.iu P.ia0 P.ia1
        t1 [t2, t3] = true →
      dist (Λ.point t1) (Λ.point t2) =
        dist (Λ.point t1) (Λ.point t3) := by
    intro he
    calc
      dist (Λ.point t1) (Λ.point t2) = Kt1.radius :=
        Kt1.same_radius (Λ.point t2)
          (point_mem_of_classContains_selected h1 h2 h3 hu h0 h1a he
            (by simp))
      _ = dist (Λ.point t1) (Λ.point t3) :=
        (Kt1.same_radius (Λ.point t3)
          (point_mem_of_classContains_selected h1 h2 h3 hu h0 h1a he
            (by simp))).symm
  have e02_dist :
      classContains P.i1 P.i2 P.i3 P.iu P.ia0 P.ia1
        t2 [t1, t3] = true →
      dist (Λ.point t1) (Λ.point t2) =
        dist (Λ.point t2) (Λ.point t3) := by
    intro he
    calc
      dist (Λ.point t1) (Λ.point t2) =
          dist (Λ.point t2) (Λ.point t1) :=
        dist_comm (Λ.point t1) (Λ.point t2)
      _ = Kt2.radius :=
        Kt2.same_radius (Λ.point t1)
          (point_mem_of_classContains_selected h1 h2 h3 hu h0 h1a he
            (by simp))
      _ = dist (Λ.point t2) (Λ.point t3) :=
        (Kt2.same_radius (Λ.point t3)
          (point_mem_of_classContains_selected h1 h2 h3 hu h0 h1a he
            (by simp))).symm
  have e12_dist :
      classContains P.i1 P.i2 P.i3 P.iu P.ia0 P.ia1
        t3 [t1, t2] = true →
      dist (Λ.point t1) (Λ.point t3) =
        dist (Λ.point t2) (Λ.point t3) := by
    intro he
    calc
      dist (Λ.point t1) (Λ.point t3) =
          dist (Λ.point t3) (Λ.point t1) :=
        dist_comm (Λ.point t1) (Λ.point t3)
      _ = Kt3.radius :=
        Kt3.same_radius (Λ.point t1)
          (point_mem_of_classContains_selected h1 h2 h3 hu h0 h1a he
            (by simp))
      _ = dist (Λ.point t3) (Λ.point t2) :=
        (Kt3.same_radius (Λ.point t2)
          (point_mem_of_classContains_selected h1 h2 h3 hu h0 h1a he
            (by simp))).symm
      _ = dist (Λ.point t2) (Λ.point t3) :=
        dist_comm (Λ.point t3) (Λ.point t2)
  by_cases h01 :
      classContains P.i1 P.i2 P.i3 P.iu P.ia0 P.ia1
        t1 [t2, t3] = true <;>
  by_cases h02 :
      classContains P.i1 P.i2 P.i3 P.iu P.ia0 P.ia1
        t2 [t1, t3] = true <;>
  by_cases h12 :
      classContains P.i1 P.i2 P.i3 P.iu P.ia0 P.ia1
        t3 [t1, t2] = true <;>
    simp [triplePairDotsForcedEqual, h01, h02, h12] at hpair
  · exact ⟨e01_dist h01, e02_dist h02⟩
  · exact ⟨e01_dist h01, e02_dist h02⟩
  · have h13_23 := e12_dist h12
    exact ⟨e01_dist h01, by
      calc
        dist (Λ.point t1) (Λ.point t2) =
            dist (Λ.point t1) (Λ.point t3) :=
          e01_dist h01
        _ = dist (Λ.point t2) (Λ.point t3) := h13_23⟩
  · have h12_23 := e02_dist h02
    have h13_23 := e12_dist h12
    exact ⟨by
      calc
        dist (Λ.point t1) (Λ.point t2) =
            dist (Λ.point t2) (Λ.point t3) := h12_23
        _ = dist (Λ.point t1) (Λ.point t3) := h13_23.symm,
      h12_23⟩

theorem dist_pair_eq_base
    {Λ : PointLabeling}
    (h12_13 : dist (Λ.point t1) (Λ.point t2) =
      dist (Λ.point t1) (Λ.point t3))
    (h12_23 : dist (Λ.point t1) (Λ.point t2) =
      dist (Λ.point t2) (Λ.point t3))
    {a b : U5AuditLabel} (ha : a ∈ triple) (hb : b ∈ triple)
    (hne : a ≠ b) :
    dist (Λ.point a) (Λ.point b) =
      dist (Λ.point t1) (Λ.point t2) := by
  fin_cases a <;> fin_cases b <;> simp [triple] at ha hb hne
  · rfl
  · exact h12_13.symm
  · exact dist_comm (Λ.point t2) (Λ.point t1)
  · exact h12_23.symm
  · calc
      dist (Λ.point t3) (Λ.point t1) =
          dist (Λ.point t1) (Λ.point t3) :=
        dist_comm (Λ.point t3) (Λ.point t1)
      _ = dist (Λ.point t1) (Λ.point t2) := h12_13.symm
  · calc
      dist (Λ.point t3) (Λ.point t2) =
          dist (Λ.point t2) (Λ.point t3) :=
        dist_comm (Λ.point t3) (Λ.point t2)
      _ = dist (Λ.point t1) (Λ.point t2) := h12_23.symm

theorem thirdTriple_ne_left {a b : U5AuditLabel}
    (ha : a ∈ triple) (hb : b ∈ triple) (hne : a ≠ b) :
    a ≠ thirdTriple a b := by
  fin_cases a <;> fin_cases b <;>
    simp [thirdTriple, triple] at ha hb hne ⊢

theorem thirdTriple_ne_right {a b : U5AuditLabel}
    (ha : a ∈ triple) (hb : b ∈ triple) (hne : a ≠ b) :
    b ≠ thirdTriple a b := by
  fin_cases a <;> fin_cases b <;>
    simp [thirdTriple, triple] at ha hb hne ⊢

theorem pair_eqs_for_triple_labels
    {Λ : PointLabeling}
    (h12_13 : dist (Λ.point t1) (Λ.point t2) =
      dist (Λ.point t1) (Λ.point t3))
    (h12_23 : dist (Λ.point t1) (Λ.point t2) =
      dist (Λ.point t2) (Λ.point t3))
    {a b : U5AuditLabel} (ha : a ∈ triple) (hb : b ∈ triple)
    (hne : a ≠ b) :
    let c := thirdTriple a b
    dist (Λ.point a) (Λ.point b) =
        dist (Λ.point a) (Λ.point c) ∧
      dist (Λ.point a) (Λ.point b) =
        dist (Λ.point b) (Λ.point c) ∧
      0 < dist (Λ.point a) (Λ.point b) := by
  let c := thirdTriple a b
  have hc : c ∈ triple := thirdTriple_mem_triple ha hb
  have hac : a ≠ c := thirdTriple_ne_left ha hb hne
  have hbc : b ≠ c := thirdTriple_ne_right ha hb hne
  have hab_base := dist_pair_eq_base h12_13 h12_23 ha hb hne
  have hac_base := dist_pair_eq_base h12_13 h12_23 ha hc hac
  have hbc_base := dist_pair_eq_base h12_13 h12_23 hb hc hbc
  exact ⟨hab_base.trans hac_base.symm, hab_base.trans hbc_base.symm,
    dist_pos.mpr (Λ.ne_of_label_ne hne)⟩

theorem dist_eq_for_triple_pairs
    {Λ : PointLabeling}
    (h12_13 : dist (Λ.point t1) (Λ.point t2) =
      dist (Λ.point t1) (Λ.point t3))
    (h12_23 : dist (Λ.point t1) (Λ.point t2) =
      dist (Λ.point t2) (Λ.point t3))
    {a b c : U5AuditLabel} (ha : a ∈ triple) (hb : b ∈ triple)
    (hc : c ∈ triple) (hab : a ≠ b) (hac : a ≠ c) :
    dist (Λ.point a) (Λ.point b) = dist (Λ.point a) (Λ.point c) := by
  exact
    (dist_pair_eq_base h12_13 h12_23 ha hb hab).trans
      (dist_pair_eq_base h12_13 h12_23 ha hc hac).symm

theorem exists_hasTripleWitness_witness {P : IndexPattern}
    {center : U5AuditLabel}
    (h : hasTripleWitness P.i1 P.i2 P.i3 P.iu P.ia0 P.ia1 center =
      true) :
    ∃ t, t ∈ triple ∧ t ≠ center ∧
      has (classOf P.i1 P.i2 P.i3 P.iu P.ia0 P.ia1 center) t =
        true := by
  unfold hasTripleWitness at h
  rcases List.any_eq_true.mp h with ⟨t, ht, htbool⟩
  rw [Bool.and_eq_true] at htbool
  exact ⟨t, ht, of_decide_eq_true htbool.1, htbool.2⟩

theorem exists_equilateralOuter_witness {P : IndexPattern}
    (h : equilateralOuterPointIncompatibility
      P.i1 P.i2 P.i3 P.iu P.ia0 P.ia1 = true) :
    ∃ x, x ∈ nonTriple ∧ ∃ left, left ∈ triple ∧
    ∃ right, right ∈ triple ∧ left ≠ right ∧
      let opposite := thirdTriple left right
      has (classOf P.i1 P.i2 P.i3 P.iu P.ia0 P.ia1 left) x =
        true ∧
      has (classOf P.i1 P.i2 P.i3 P.iu P.ia0 P.ia1 right) x =
        true ∧
      hasTripleWitness P.i1 P.i2 P.i3 P.iu P.ia0 P.ia1 left =
        true ∧
      hasTripleWitness P.i1 P.i2 P.i3 P.iu P.ia0 P.ia1 right =
        true ∧
      classContains P.i1 P.i2 P.i3 P.iu P.ia0 P.ia1
        x [p, opposite] = true := by
  unfold equilateralOuterPointIncompatibility at h
  rw [Bool.and_eq_true] at h
  rcases h with ⟨_hpair, hxany⟩
  rcases List.any_eq_true.mp hxany with ⟨x, hx, hleftany⟩
  rcases List.any_eq_true.mp hleftany with ⟨left, hleft, hrightany⟩
  rcases List.any_eq_true.mp hrightany with ⟨right, hright, hbool⟩
  rw [Bool.and_eq_true] at hbool
  have hne : left ≠ right := of_decide_eq_true hbool.1
  rw [Bool.and_eq_true] at hbool
  rcases hbool.2 with ⟨hleftx_rightx_wl_wr, hxclass⟩
  rw [Bool.and_eq_true] at hleftx_rightx_wl_wr
  rcases hleftx_rightx_wl_wr with ⟨hleftx_rightx_wl, hwr⟩
  rw [Bool.and_eq_true] at hleftx_rightx_wl
  rcases hleftx_rightx_wl with ⟨hleftx_rightx, hwl⟩
  rw [Bool.and_eq_true] at hleftx_rightx
  rcases hleftx_rightx with ⟨hleftx, hrightx⟩
  exact
    ⟨x, hx, left, hleft, right, hright, hne, hleftx, hrightx,
      hwl, hwr, hxclass⟩

def EdgeSound (Λ : PointLabeling) (r : ℝ) (E : EdgeMask) : Prop :=
  ∀ a b, hasEdge E a b = true → dist (Λ.point a) (Λ.point b) = r

theorem edgeCode_eq_iff {a b x y : U5AuditLabel} :
    edgeCode a b = edgeCode x y ↔ a = x ∧ b = y := by
  fin_cases a <;> fin_cases b <;> fin_cases x <;> fin_cases y <;>
    decide

theorem hasEdge_insertEdge {E : EdgeMask} {a b x y : U5AuditLabel} :
    hasEdge (insertEdge E a b) x y =
      (hasEdge E x y || decide (a = x ∧ b = y) ||
        decide (b = x ∧ a = y)) := by
  simp [insertEdge, hasEdge, edgeBit, Nat.shiftLeft_eq, Nat.testBit_two_pow,
    edgeCode_eq_iff, and_comm]

theorem edgeSound_insertEdge
    {Λ : PointLabeling} {r : ℝ} {E : EdgeMask} {a b : U5AuditLabel}
    (hE : EdgeSound Λ r E)
    (hab : dist (Λ.point a) (Λ.point b) = r) :
    EdgeSound Λ r (insertEdge E a b) := by
  intro x y hxy
  rw [hasEdge_insertEdge] at hxy
  simp only [Bool.or_eq_true, decide_eq_true_eq] at hxy
  rcases hxy with hOldOrNew | hnew
  · rcases hOldOrNew with hOld | hnew
    · exact hE x y hOld
    · rcases hnew with ⟨rfl, rfl⟩
      exact hab
  · rcases hnew with ⟨rfl, rfl⟩
    simpa [dist_comm] using hab

theorem edgeSound_zero {Λ : PointLabeling} {r : ℝ} :
    EdgeSound Λ r 0 := by
  intro a b h
  simp [hasEdge] at h

theorem edgeSound_fold_insertClass
    {Λ : PointLabeling} {r : ℝ} {E B : EdgeMask}
    {center : U5AuditLabel}
    (hE : EdgeSound Λ r E)
    (hB : ∀ z, has B z = true → dist (Λ.point center) (Λ.point z) = r)
    (xs : List U5AuditLabel) :
    EdgeSound Λ r
      (xs.foldl
        (fun F z => if has B z then insertEdge F center z else F) E) := by
  induction xs generalizing E with
  | nil =>
      simpa using hE
  | cons z zs ih =>
      by_cases hz : has B z = true
      · simpa [List.foldl_cons, hz] using
          ih (E := insertEdge E center z)
            (edgeSound_insertEdge hE (hB z hz))
      · have hz_false : has B z = false := by
          cases h : has B z <;> simp_all
        simpa [List.foldl_cons, hz_false] using ih (E := E) hE

theorem edgeSound_addClassEdges
    {D : CounterexampleData} {Λ : PointLabeling} {P : IndexPattern}
    {Bt1 Bt2 Bt3 Bu Ba0 Ba1 : Finset ℝ²}
    (Kt1 : U5QDeletedK4Class D (Λ.point q) (Λ.point t1) Bt1)
    (Kt2 : U5QDeletedK4Class D (Λ.point q) (Λ.point t2) Bt2)
    (Kt3 : U5QDeletedK4Class D (Λ.point q) (Λ.point t3) Bt3)
    (Ku : U5QDeletedK4Class D (Λ.point q) (Λ.point u) Bu)
    (Ka0 : U5QDeletedK4Class D (Λ.point q) (Λ.point a0) Ba0)
    (Ka1 : U5QDeletedK4Class D (Λ.point q) (Λ.point a1) Ba1)
    (h1 : choice t1 P.i1 = labelMask (classLabels Λ.point Bt1))
    (h2 : choice t2 P.i2 = labelMask (classLabels Λ.point Bt2))
    (h3 : choice t3 P.i3 = labelMask (classLabels Λ.point Bt3))
    (hu : choice u P.iu = labelMask (classLabels Λ.point Bu))
    (h0 : choice a0 P.ia0 = labelMask (classLabels Λ.point Ba0))
    (h1a : choice a1 P.ia1 = labelMask (classLabels Λ.point Ba1))
    {r : ℝ} {E : EdgeMask} {center : U5AuditLabel}
    (hc : center ∈ centers)
    (hE : EdgeSound Λ r E) :
    EdgeSound Λ r
      (addClassEdges P.i1 P.i2 P.i3 P.iu P.ia0 P.ia1 E center) := by
  unfold addClassEdges
  by_cases hany :
      labels.any
        (fun x =>
          has (classOf P.i1 P.i2 P.i3 P.iu P.ia0 P.ia1 center) x &&
            hasEdge E center x) = true
  · rw [if_pos hany]
    rcases List.any_eq_true.mp hany with ⟨w, _hw_label, hw_bool⟩
    rw [Bool.and_eq_true] at hw_bool
    let Kcenter :=
      selectedKOfCenter Kt1 Kt2 Kt3 Ku Ka0 Ka1 hc
    have hw_mem :
        Λ.point w ∈ selectedClass Bt1 Bt2 Bt3 Bu Ba0 Ba1 center :=
      point_mem_of_has_selected h1 h2 h3 hu h0 h1a hw_bool.1
    have hcw : dist (Λ.point center) (Λ.point w) = r :=
      hE center w hw_bool.2
    have hB :
        ∀ z,
          has (classOf P.i1 P.i2 P.i3 P.iu P.ia0 P.ia1 center) z =
            true →
          dist (Λ.point center) (Λ.point z) = r := by
      intro z hz
      have hz_mem :
          Λ.point z ∈ selectedClass Bt1 Bt2 Bt3 Bu Ba0 Ba1 center :=
        point_mem_of_has_selected h1 h2 h3 hu h0 h1a hz
      calc
        dist (Λ.point center) (Λ.point z) = Kcenter.radius :=
          Kcenter.same_radius (Λ.point z) hz_mem
        _ = dist (Λ.point center) (Λ.point w) :=
          (Kcenter.same_radius (Λ.point w) hw_mem).symm
        _ = r := hcw
    exact edgeSound_fold_insertClass hE hB labels
  · have hany_false :
      labels.any
        (fun x =>
          has (classOf P.i1 P.i2 P.i3 P.iu P.ia0 P.ia1 center) x &&
            hasEdge E center x) = false := by
      cases h :
        labels.any
          (fun x =>
            has (classOf P.i1 P.i2 P.i3 P.iu P.ia0 P.ia1 center) x &&
              hasEdge E center x) <;> simp_all
    simpa [hany_false] using hE

theorem edgeSound_unitStep
    {D : CounterexampleData} {Λ : PointLabeling} {P : IndexPattern}
    {Bt1 Bt2 Bt3 Bu Ba0 Ba1 : Finset ℝ²}
    (Kt1 : U5QDeletedK4Class D (Λ.point q) (Λ.point t1) Bt1)
    (Kt2 : U5QDeletedK4Class D (Λ.point q) (Λ.point t2) Bt2)
    (Kt3 : U5QDeletedK4Class D (Λ.point q) (Λ.point t3) Bt3)
    (Ku : U5QDeletedK4Class D (Λ.point q) (Λ.point u) Bu)
    (Ka0 : U5QDeletedK4Class D (Λ.point q) (Λ.point a0) Ba0)
    (Ka1 : U5QDeletedK4Class D (Λ.point q) (Λ.point a1) Ba1)
    (h1 : choice t1 P.i1 = labelMask (classLabels Λ.point Bt1))
    (h2 : choice t2 P.i2 = labelMask (classLabels Λ.point Bt2))
    (h3 : choice t3 P.i3 = labelMask (classLabels Λ.point Bt3))
    (hu : choice u P.iu = labelMask (classLabels Λ.point Bu))
    (h0 : choice a0 P.ia0 = labelMask (classLabels Λ.point Ba0))
    (h1a : choice a1 P.ia1 = labelMask (classLabels Λ.point Ba1))
    {r : ℝ} {E : EdgeMask}
    (hE : EdgeSound Λ r E) :
    EdgeSound Λ r (unitStep P.i1 P.i2 P.i3 P.iu P.ia0 P.ia1 E) := by
  unfold unitStep centers
  simp only [List.foldl_cons, List.foldl_nil]
  repeat
    first
    | apply edgeSound_addClassEdges Kt1 Kt2 Kt3 Ku Ka0 Ka1
        h1 h2 h3 hu h0 h1a (by simp [centers])
    | exact hE

theorem edgeSound_initialUnitEdges
    {Λ : PointLabeling} {r : ℝ}
    (ht1 : dist (Λ.point p) (Λ.point t1) = r)
    (ht2 : dist (Λ.point p) (Λ.point t2) = r)
    (ht3 : dist (Λ.point p) (Λ.point t3) = r) :
    EdgeSound Λ r initialUnitEdges := by
  unfold initialUnitEdges
  simp only [List.foldl_cons, List.foldl_nil]
  exact
    edgeSound_insertEdge
      (edgeSound_insertEdge
        (edgeSound_insertEdge (edgeSound_zero (Λ := Λ) (r := r)) ht1)
        ht2)
      ht3

theorem edgeSound_unitClosure
    {D : CounterexampleData} {Λ : PointLabeling} {P : IndexPattern}
    {Bt1 Bt2 Bt3 Bu Ba0 Ba1 : Finset ℝ²}
    (Kt1 : U5QDeletedK4Class D (Λ.point q) (Λ.point t1) Bt1)
    (Kt2 : U5QDeletedK4Class D (Λ.point q) (Λ.point t2) Bt2)
    (Kt3 : U5QDeletedK4Class D (Λ.point q) (Λ.point t3) Bt3)
    (Ku : U5QDeletedK4Class D (Λ.point q) (Λ.point u) Bu)
    (Ka0 : U5QDeletedK4Class D (Λ.point q) (Λ.point a0) Ba0)
    (Ka1 : U5QDeletedK4Class D (Λ.point q) (Λ.point a1) Ba1)
    (h1 : choice t1 P.i1 = labelMask (classLabels Λ.point Bt1))
    (h2 : choice t2 P.i2 = labelMask (classLabels Λ.point Bt2))
    (h3 : choice t3 P.i3 = labelMask (classLabels Λ.point Bt3))
    (hu : choice u P.iu = labelMask (classLabels Λ.point Bu))
    (h0 : choice a0 P.ia0 = labelMask (classLabels Λ.point Ba0))
    (h1a : choice a1 P.ia1 = labelMask (classLabels Λ.point Ba1))
    {r : ℝ}
    (ht1 : dist (Λ.point p) (Λ.point t1) = r)
    (ht2 : dist (Λ.point p) (Λ.point t2) = r)
    (ht3 : dist (Λ.point p) (Λ.point t3) = r) :
    EdgeSound Λ r (unitClosure P.i1 P.i2 P.i3 P.iu P.ia0 P.ia1) := by
  let step := unitStep P.i1 P.i2 P.i3 P.iu P.ia0 P.ia1
  have hstep : ∀ E, EdgeSound Λ r E → EdgeSound Λ r (step E) := by
    intro E hE
    exact edgeSound_unitStep Kt1 Kt2 Kt3 Ku Ka0 Ka1
      h1 h2 h3 hu h0 h1a hE
  have h0sound : EdgeSound Λ r initialUnitEdges :=
    edgeSound_initialUnitEdges ht1 ht2 ht3
  unfold unitClosure
  change EdgeSound Λ r (step^[8] initialUnitEdges)
  repeat
    first
    | exact h0sound
    | apply hstep

theorem route_unitTriangle
    {D : CounterexampleData} {Λ : PointLabeling} {P : IndexPattern}
    {Bt1 Bt2 Bt3 Bu Ba0 Ba1 : Finset ℝ²}
    (Kt1 : U5QDeletedK4Class D (Λ.point q) (Λ.point t1) Bt1)
    (Kt2 : U5QDeletedK4Class D (Λ.point q) (Λ.point t2) Bt2)
    (Kt3 : U5QDeletedK4Class D (Λ.point q) (Λ.point t3) Bt3)
    (Ku : U5QDeletedK4Class D (Λ.point q) (Λ.point u) Bu)
    (Ka0 : U5QDeletedK4Class D (Λ.point q) (Λ.point a0) Ba0)
    (Ka1 : U5QDeletedK4Class D (Λ.point q) (Λ.point a1) Ba1)
    (h1 : choice t1 P.i1 = labelMask (classLabels Λ.point Bt1))
    (h2 : choice t2 P.i2 = labelMask (classLabels Λ.point Bt2))
    (h3 : choice t3 P.i3 = labelMask (classLabels Λ.point Bt3))
    (hu : choice u P.iu = labelMask (classLabels Λ.point Bu))
    (h0 : choice a0 P.ia0 = labelMask (classLabels Λ.point Ba0))
    (h1a : choice a1 P.ia1 = labelMask (classLabels Λ.point Ba1))
    (hr_pos : 0 < dist (Λ.point p) (Λ.point q))
    (ht1_radius : dist (Λ.point p) (Λ.point t1) =
      dist (Λ.point p) (Λ.point q))
    (ht2_radius : dist (Λ.point p) (Λ.point t2) =
      dist (Λ.point p) (Λ.point q))
    (ht3_radius : dist (Λ.point p) (Λ.point t3) =
      dist (Λ.point p) (Λ.point q))
    (hobs : unitTriangleIncompatibility P.i1 P.i2 P.i3 P.iu P.ia0 P.ia1 =
      true) : False := by
  unfold unitTriangleIncompatibility at hobs
  rw [Bool.and_eq_true] at hobs
  rcases hobs with ⟨h12_13, h23⟩
  rw [Bool.and_eq_true] at h12_13
  rcases h12_13 with ⟨h12, h13⟩
  have hsound :=
    edgeSound_unitClosure Kt1 Kt2 Kt3 Ku Ka0 Ka1 h1 h2 h3 hu h0 h1a
      ht1_radius ht2_radius ht3_radius
  exact u5_unit_triangle_on_p_circle_incompatibility
    (p := Λ.point p) (t1 := Λ.point t1) (t2 := Λ.point t2)
    (t3 := Λ.point t3) (r := dist (Λ.point p) (Λ.point q))
    hr_pos ht1_radius ht2_radius ht3_radius
    (hsound t1 t2 (by simpa [unitEdge] using h12))
    (hsound t1 t3 (by simpa [unitEdge] using h13))
    (hsound t2 t3 (by simpa [unitEdge] using h23))


theorem route_equilateralCircumcenter
    {D : CounterexampleData} {Λ : PointLabeling} {P : IndexPattern}
    {Bt1 Bt2 Bt3 Bu Ba0 Ba1 : Finset ℝ²}
    (Kt1 : U5QDeletedK4Class D (Λ.point q) (Λ.point t1) Bt1)
    (Kt2 : U5QDeletedK4Class D (Λ.point q) (Λ.point t2) Bt2)
    (Kt3 : U5QDeletedK4Class D (Λ.point q) (Λ.point t3) Bt3)
    (Ku : U5QDeletedK4Class D (Λ.point q) (Λ.point u) Bu)
    (Ka0 : U5QDeletedK4Class D (Λ.point q) (Λ.point a0) Ba0)
    (Ka1 : U5QDeletedK4Class D (Λ.point q) (Λ.point a1) Ba1)
    (h1 : choice t1 P.i1 = labelMask (classLabels Λ.point Bt1))
    (h2 : choice t2 P.i2 = labelMask (classLabels Λ.point Bt2))
    (h3 : choice t3 P.i3 = labelMask (classLabels Λ.point Bt3))
    (hu : choice u P.iu = labelMask (classLabels Λ.point Bu))
    (h0 : choice a0 P.ia0 = labelMask (classLabels Λ.point Ba0))
    (h1a : choice a1 P.ia1 = labelMask (classLabels Λ.point Ba1))
    (hr_pos : 0 < dist (Λ.point p) (Λ.point q))
    (ht1_radius : dist (Λ.point p) (Λ.point t1) =
      dist (Λ.point p) (Λ.point q))
    (ht2_radius : dist (Λ.point p) (Λ.point t2) =
      dist (Λ.point p) (Λ.point q))
    (ht3_radius : dist (Λ.point p) (Λ.point t3) =
      dist (Λ.point p) (Λ.point q))
    (hu_off : dist (Λ.point p) (Λ.point u) ≠
      dist (Λ.point p) (Λ.point q))
    (ha0_off : dist (Λ.point p) (Λ.point a0) ≠
      dist (Λ.point p) (Λ.point q))
    (ha1_off : dist (Λ.point p) (Λ.point a1) ≠
      dist (Λ.point p) (Λ.point q))
    (hobs : equilateralCircumcenterIncompatibility
      P.i1 P.i2 P.i3 P.iu P.ia0 P.ia1 = true) : False := by
  unfold equilateralCircumcenterIncompatibility at hobs
  rw [Bool.and_eq_true] at hobs
  rcases hobs with ⟨hpair, hxany⟩
  rcases triple_pair_distances_equal_of_forced
      Kt1 Kt2 Kt3 h1 h2 h3 hu h0 h1a hpair with
    ⟨h12_13, h12_23⟩
  rcases List.any_eq_true.mp hxany with ⟨x, hx, hxbool⟩
  rw [Bool.and_eq_true] at hxbool
  have hp_has :
      has (classOf P.i1 P.i2 P.i3 P.iu P.ia0 P.ia1 x) p =
        true := hxbool.1
  have hcount :
      2 ≤ tripleWitnessCount P.i1 P.i2 P.i3 P.iu P.ia0 P.ia1 x :=
    of_decide_eq_true hxbool.2
  rcases exists_two_triple_of_count
      (B := classOf P.i1 P.i2 P.i3 P.iu P.ia0 P.ia1 x)
      hcount with
    ⟨a, ha, b, hb, hne, ha_has, hb_has⟩
  let c := thirdTriple a b
  have hc : c ∈ triple := thirdTriple_mem_triple ha hb
  rcases pair_eqs_for_triple_labels h12_13 h12_23 ha hb hne with
    ⟨hab_eq_hac, hab_eq_hbc, hab_pos⟩
  let Kx :=
    selectedKOfCenter Kt1 Kt2 Kt3 Ku Ka0 Ka1
      (mem_centers_of_mem_nonTriple hx)
  exact u5_equilateral_circumcenter_on_p_circle_incompatibility
    (D := D) (q := Λ.point q) (p := Λ.point p)
    (a := Λ.point a) (b := Λ.point b) (c := Λ.point c)
    (x := Λ.point x)
    (Bx := selectedClass Bt1 Bt2 Bt3 Bu Ba0 Ba1 x)
    hr_pos
    (radius_of_mem_triple ht1_radius ht2_radius ht3_radius ha)
    (radius_of_mem_triple ht1_radius ht2_radius ht3_radius hb)
    (radius_of_mem_triple ht1_radius ht2_radius ht3_radius hc)
    hab_eq_hac hab_eq_hbc hab_pos
    (off_circle_of_mem_nonTriple hu_off ha0_off ha1_off hx)
    Kx
    (point_mem_of_has_selected h1 h2 h3 hu h0 h1a hp_has)
    (point_mem_of_has_selected h1 h2 h3 hu h0 h1a ha_has)
    (point_mem_of_has_selected h1 h2 h3 hu h0 h1a hb_has)

theorem route_equilateralOuter
    {D : CounterexampleData} {Λ : PointLabeling} {P : IndexPattern}
    {Bt1 Bt2 Bt3 Bu Ba0 Ba1 : Finset ℝ²}
    (Kt1 : U5QDeletedK4Class D (Λ.point q) (Λ.point t1) Bt1)
    (Kt2 : U5QDeletedK4Class D (Λ.point q) (Λ.point t2) Bt2)
    (Kt3 : U5QDeletedK4Class D (Λ.point q) (Λ.point t3) Bt3)
    (Ku : U5QDeletedK4Class D (Λ.point q) (Λ.point u) Bu)
    (Ka0 : U5QDeletedK4Class D (Λ.point q) (Λ.point a0) Ba0)
    (Ka1 : U5QDeletedK4Class D (Λ.point q) (Λ.point a1) Ba1)
    (h1 : choice t1 P.i1 = labelMask (classLabels Λ.point Bt1))
    (h2 : choice t2 P.i2 = labelMask (classLabels Λ.point Bt2))
    (h3 : choice t3 P.i3 = labelMask (classLabels Λ.point Bt3))
    (hu : choice u P.iu = labelMask (classLabels Λ.point Bu))
    (h0 : choice a0 P.ia0 = labelMask (classLabels Λ.point Ba0))
    (h1a : choice a1 P.ia1 = labelMask (classLabels Λ.point Ba1))
    (hr_pos : 0 < dist (Λ.point p) (Λ.point q))
    (ht1_radius : dist (Λ.point p) (Λ.point t1) =
      dist (Λ.point p) (Λ.point q))
    (ht2_radius : dist (Λ.point p) (Λ.point t2) =
      dist (Λ.point p) (Λ.point q))
    (ht3_radius : dist (Λ.point p) (Λ.point t3) =
      dist (Λ.point p) (Λ.point q))
    (hobs : equilateralOuterPointIncompatibility
      P.i1 P.i2 P.i3 P.iu P.ia0 P.ia1 = true) : False := by
  have hobs_orig := hobs
  unfold equilateralOuterPointIncompatibility at hobs
  rw [Bool.and_eq_true] at hobs
  rcases hobs with ⟨hpair, _hxany⟩
  rcases triple_pair_distances_equal_of_forced
      Kt1 Kt2 Kt3 h1 h2 h3 hu h0 h1a hpair with
    ⟨h12_13, h12_23⟩
  rcases exists_equilateralOuter_witness hobs_orig with
    ⟨x, hx, left, hleft, right, hright, hne, hleftx, hrightx,
      hleftWitness, hrightWitness, hxclass⟩
  let opposite := thirdTriple left right
  have hopposite : opposite ∈ triple := thirdTriple_mem_triple hleft hright
  let Kleft :=
    selectedKOfCenter Kt1 Kt2 Kt3 Ku Ka0 Ka1
      (mem_centers_of_mem_triple hleft)
  let Kright :=
    selectedKOfCenter Kt1 Kt2 Kt3 Ku Ka0 Ka1
      (mem_centers_of_mem_triple hright)
  let Kx :=
    selectedKOfCenter Kt1 Kt2 Kt3 Ku Ka0 Ka1
      (mem_centers_of_mem_nonTriple hx)
  rcases exists_hasTripleWitness_witness hleftWitness with
    ⟨wl, hwl, hwl_ne_left, hwl_has⟩
  rcases exists_hasTripleWitness_witness hrightWitness with
    ⟨wr, hwr, hwr_ne_right, hwr_has⟩
  have hleft_side :
      dist (Λ.point left) (Λ.point x) =
        dist (Λ.point left) (Λ.point right) := by
    calc
      dist (Λ.point left) (Λ.point x) = Kleft.radius :=
        Kleft.same_radius (Λ.point x)
          (point_mem_of_has_selected h1 h2 h3 hu h0 h1a hleftx)
      _ = dist (Λ.point left) (Λ.point wl) :=
        (Kleft.same_radius (Λ.point wl)
          (point_mem_of_has_selected h1 h2 h3 hu h0 h1a hwl_has)).symm
      _ = dist (Λ.point left) (Λ.point right) :=
        (dist_eq_for_triple_pairs h12_13 h12_23 hleft hright hwl
          hne hwl_ne_left.symm).symm
  have hright_side :
      dist (Λ.point right) (Λ.point x) =
        dist (Λ.point left) (Λ.point right) := by
    calc
      dist (Λ.point right) (Λ.point x) = Kright.radius :=
        Kright.same_radius (Λ.point x)
          (point_mem_of_has_selected h1 h2 h3 hu h0 h1a hrightx)
      _ = dist (Λ.point right) (Λ.point wr) :=
        (Kright.same_radius (Λ.point wr)
          (point_mem_of_has_selected h1 h2 h3 hu h0 h1a hwr_has)).symm
      _ = dist (Λ.point right) (Λ.point left) :=
        (dist_eq_for_triple_pairs h12_13 h12_23 hright hleft hwr
          hne.symm hwr_ne_right.symm).symm
      _ = dist (Λ.point left) (Λ.point right) :=
        dist_comm (Λ.point right) (Λ.point left)
  rcases pair_eqs_for_triple_labels h12_13 h12_23 hleft hright hne with
    ⟨hab_eq_hac, hab_eq_hbc, hab_pos⟩
  exact u5_equilateral_outer_point_incompatibility
    (D := D) (q := Λ.point q) (p := Λ.point p)
    (a := Λ.point left) (b := Λ.point right)
    (c := Λ.point opposite) (x := Λ.point x)
    (Bx := selectedClass Bt1 Bt2 Bt3 Bu Ba0 Ba1 x)
    hr_pos
    (radius_of_mem_triple ht1_radius ht2_radius ht3_radius hleft)
    (radius_of_mem_triple ht1_radius ht2_radius ht3_radius hright)
    (radius_of_mem_triple ht1_radius ht2_radius ht3_radius hopposite)
    hab_eq_hac hab_eq_hbc hab_pos hleft_side hright_side Kx
    (point_mem_of_classContains_selected h1 h2 h3 hu h0 h1a hxclass
      (by simp))
    (point_mem_of_classContains_selected h1 h2 h3 hu h0 h1a hxclass
      (by simp [opposite]))

theorem route_patternReason
    {D : CounterexampleData} {Λ : PointLabeling} {P : IndexPattern}
    {Bt1 Bt2 Bt3 Bu Ba0 Ba1 : Finset ℝ²}
    (Kt1 : U5QDeletedK4Class D (Λ.point q) (Λ.point t1) Bt1)
    (Kt2 : U5QDeletedK4Class D (Λ.point q) (Λ.point t2) Bt2)
    (Kt3 : U5QDeletedK4Class D (Λ.point q) (Λ.point t3) Bt3)
    (Ku : U5QDeletedK4Class D (Λ.point q) (Λ.point u) Bu)
    (Ka0 : U5QDeletedK4Class D (Λ.point q) (Λ.point a0) Ba0)
    (Ka1 : U5QDeletedK4Class D (Λ.point q) (Λ.point a1) Ba1)
    (h1 : choice t1 P.i1 = labelMask (classLabels Λ.point Bt1))
    (h2 : choice t2 P.i2 = labelMask (classLabels Λ.point Bt2))
    (h3 : choice t3 P.i3 = labelMask (classLabels Λ.point Bt3))
    (hu : choice u P.iu = labelMask (classLabels Λ.point Bu))
    (h0 : choice a0 P.ia0 = labelMask (classLabels Λ.point Ba0))
    (h1a : choice a1 P.ia1 = labelMask (classLabels Λ.point Ba1))
    (hr_pos : 0 < dist (Λ.point p) (Λ.point q))
    (hT_noncol : ¬ Collinear ℝ
      ({Λ.point t1, Λ.point t2, Λ.point t3} : Set ℝ²))
    (ht1_radius : dist (Λ.point p) (Λ.point t1) =
      dist (Λ.point p) (Λ.point q))
    (ht2_radius : dist (Λ.point p) (Λ.point t2) =
      dist (Λ.point p) (Λ.point q))
    (ht3_radius : dist (Λ.point p) (Λ.point t3) =
      dist (Λ.point p) (Λ.point q))
    (hu_off : dist (Λ.point p) (Λ.point u) ≠
      dist (Λ.point p) (Λ.point q))
    (ha0_off : dist (Λ.point p) (Λ.point a0) ≠
      dist (Λ.point p) (Λ.point q))
    (ha1_off : dist (Λ.point p) (Λ.point a1) ≠
      dist (Λ.point p) (Λ.point q))
    {reason : PrefilterReason}
    (hreason : patternReason P = some reason) : False := by
  cases reason
  · exact route_unitTriangle Kt1 Kt2 Kt3 Ku Ka0 Ka1 h1 h2 h3 hu h0
      h1a hr_pos ht1_radius ht2_radius ht3_radius
      (unitTriangleIncompatibility_of_patternReason_eq hreason)
  · exact route_nontripleEquilateralOnPCircle
      Kt1 Kt2 Kt3 Ku Ka0 Ka1 h1 h2 h3 hu h0 h1a
      ht1_radius ht2_radius ht3_radius hu_off ha0_off ha1_off
      (nontripleEquilateralOnPCircleIncompatibility_of_patternReason_eq
        hreason)
  · exact route_equilateralOpposite
      Kt1 Kt2 Kt3 Ku Ka0 Ka1 h1 h2 h3 hu h0 h1a
      hr_pos ht1_radius ht2_radius ht3_radius
      (equilateralOppositeIncompatibility_of_patternReason_eq hreason)
  · exact route_equilateralBisector
      Kt1 Kt2 Kt3 Ku Ka0 Ka1 h1 h2 h3 hu h0 h1a
      hr_pos ht1_radius ht2_radius ht3_radius
      (equilateralBisectorIncompatibility_of_patternReason_eq hreason)
  · exact route_commonBisectorTriple
      Kt1 Kt2 Kt3 Ku Ka0 Ka1 h1 h2 h3 hu h0 h1a
      hr_pos hT_noncol ht1_radius ht2_radius ht3_radius
      (commonBisectorTripleIncompatibility_of_patternReason_eq hreason)
  · exact route_equilateralCircumcenter
      Kt1 Kt2 Kt3 Ku Ka0 Ka1 h1 h2 h3 hu h0 h1a
      hr_pos ht1_radius ht2_radius ht3_radius hu_off ha0_off ha1_off
      (equilateralCircumcenterIncompatibility_of_patternReason_eq hreason)
  · exact route_equilateralOuter
      Kt1 Kt2 Kt3 Ku Ka0 Ka1 h1 h2 h3 hu h0 h1a
      hr_pos ht1_radius ht2_radius ht3_radius
      (equilateralOuterPointIncompatibility_of_patternReason_eq hreason)

/-- Six extracted four-label classes with the pairwise overlap proxy produce
one bounded finite audit pattern and therefore one named prefilter reason. -/
theorem exists_boundedIndexPattern_of_labelClasses
    (Lt1 Lt2 Lt3 Lu La0 La1 : Finset U5AuditLabel)
    (ht1_card : Lt1.card = 4) (ht1_q : q ∉ Lt1) (ht1_center : t1 ∉ Lt1)
    (ht2_card : Lt2.card = 4) (ht2_q : q ∉ Lt2) (ht2_center : t2 ∉ Lt2)
    (ht3_card : Lt3.card = 4) (ht3_q : q ∉ Lt3) (ht3_center : t3 ∉ Lt3)
    (hu_card : Lu.card = 4) (hu_q : q ∉ Lu) (hu_center : u ∉ Lu)
    (ha0_card : La0.card = 4) (ha0_q : q ∉ La0) (ha0_center : a0 ∉ La0)
    (ha1_card : La1.card = 4) (ha1_q : q ∉ La1) (ha1_center : a1 ∉ La1)
    (h12 : (Lt1 ∩ Lt2).card ≤ 2)
    (h13 : (Lt1 ∩ Lt3).card ≤ 2)
    (h23 : (Lt2 ∩ Lt3).card ≤ 2)
    (h1u : (Lt1 ∩ Lu).card ≤ 2)
    (h2u : (Lt2 ∩ Lu).card ≤ 2)
    (h3u : (Lt3 ∩ Lu).card ≤ 2)
    (h10 : (Lt1 ∩ La0).card ≤ 2)
    (h20 : (Lt2 ∩ La0).card ≤ 2)
    (h30 : (Lt3 ∩ La0).card ≤ 2)
    (hu0 : (Lu ∩ La0).card ≤ 2)
    (h11 : (Lt1 ∩ La1).card ≤ 2)
    (h21 : (Lt2 ∩ La1).card ≤ 2)
    (h31 : (Lt3 ∩ La1).card ≤ 2)
    (hu1 : (Lu ∩ La1).card ≤ 2)
    (h01 : (La0 ∩ La1).card ≤ 2) :
    ∃ P : IndexPattern,
      P ∈ boundedIndexPatterns ∧
      choice t1 P.i1 = labelMask Lt1 ∧
      choice t2 P.i2 = labelMask Lt2 ∧
      choice t3 P.i3 = labelMask Lt3 ∧
      choice u P.iu = labelMask Lu ∧
      choice a0 P.ia0 = labelMask La0 ∧
      choice a1 P.ia1 = labelMask La1 ∧
      ∃ reason, patternReason P = some reason := by
  rcases exists_choice_index_of_labelMask (by simp [centers])
      Lt1 ht1_card ht1_q ht1_center with ⟨i1, hi1⟩
  rcases exists_choice_index_of_labelMask (by simp [centers])
      Lt2 ht2_card ht2_q ht2_center with ⟨i2, hi2⟩
  rcases exists_choice_index_of_labelMask (by simp [centers])
      Lt3 ht3_card ht3_q ht3_center with ⟨i3, hi3⟩
  rcases exists_choice_index_of_labelMask (by simp [centers])
      Lu hu_card hu_q hu_center with ⟨iu, hiu⟩
  rcases exists_choice_index_of_labelMask (by simp [centers])
      La0 ha0_card ha0_q ha0_center with ⟨ia0, hia0⟩
  rcases exists_choice_index_of_labelMask (by simp [centers])
      La1 ha1_card ha1_q ha1_center with ⟨ia1, hia1⟩
  let P : IndexPattern := { i1, i2, i3, iu, ia0, ia1 }
  have hP : P ∈ boundedIndexPatterns := by
    refine mem_boundedIndexPatterns_of_pairOK P ?_ ?_ ?_ ?_ ?_ ?_ ?_ ?_ ?_ ?_ ?_ ?_ ?_ ?_ ?_
    all_goals
      unfold pairOK
      simp only [P]
    · rw [hi1, hi2]
      exact overlapAtMostTwo_labelMask_of_card_le h12
    · rw [hi1, hi3]
      exact overlapAtMostTwo_labelMask_of_card_le h13
    · rw [hi2, hi3]
      exact overlapAtMostTwo_labelMask_of_card_le h23
    · rw [hi1, hiu]
      exact overlapAtMostTwo_labelMask_of_card_le h1u
    · rw [hi2, hiu]
      exact overlapAtMostTwo_labelMask_of_card_le h2u
    · rw [hi3, hiu]
      exact overlapAtMostTwo_labelMask_of_card_le h3u
    · rw [hi1, hia0]
      exact overlapAtMostTwo_labelMask_of_card_le h10
    · rw [hi2, hia0]
      exact overlapAtMostTwo_labelMask_of_card_le h20
    · rw [hi3, hia0]
      exact overlapAtMostTwo_labelMask_of_card_le h30
    · rw [hiu, hia0]
      exact overlapAtMostTwo_labelMask_of_card_le hu0
    · rw [hi1, hia1]
      exact overlapAtMostTwo_labelMask_of_card_le h11
    · rw [hi2, hia1]
      exact overlapAtMostTwo_labelMask_of_card_le h21
    · rw [hi3, hia1]
      exact overlapAtMostTwo_labelMask_of_card_le h31
    · rw [hiu, hia1]
      exact overlapAtMostTwo_labelMask_of_card_le hu1
    · rw [hia0, hia1]
      exact overlapAtMostTwo_labelMask_of_card_le h01
  refine ⟨P, hP, ?_, ?_, ?_, ?_, ?_, ?_, ?_⟩
  · exact hi1
  · exact hi2
  · exact hi3
  · exact hiu
  · exact hia0
  · exact hia1
  · exact patternReason_isSome_of_mem_boundedIndexPatterns hP

/-- Real-class extraction into the finite bounded audit pattern.

This is the main finite bridge: once the geometric U5 layer has named the
eight support points injectively and has six exact four-point q-free selected
classes with pairwise overlap at most two, the hard-coded finite certificate
provides an `IndexPattern` and a named prefilter reason. -/
theorem exists_boundedIndexPattern_of_realClasses
    (Λ : PointLabeling)
    (Bt1 Bt2 Bt3 Bu Ba0 Ba1 : Finset ℝ²)
    (ht1_subset : Bt1 ⊆ supportSet Λ.point)
    (ht1_card : Bt1.card = 4)
    (ht1_q : Λ.point q ∉ Bt1) (ht1_center : Λ.point t1 ∉ Bt1)
    (ht2_subset : Bt2 ⊆ supportSet Λ.point)
    (ht2_card : Bt2.card = 4)
    (ht2_q : Λ.point q ∉ Bt2) (ht2_center : Λ.point t2 ∉ Bt2)
    (ht3_subset : Bt3 ⊆ supportSet Λ.point)
    (ht3_card : Bt3.card = 4)
    (ht3_q : Λ.point q ∉ Bt3) (ht3_center : Λ.point t3 ∉ Bt3)
    (hu_subset : Bu ⊆ supportSet Λ.point)
    (hu_card : Bu.card = 4)
    (hu_q : Λ.point q ∉ Bu) (hu_center : Λ.point u ∉ Bu)
    (ha0_subset : Ba0 ⊆ supportSet Λ.point)
    (ha0_card : Ba0.card = 4)
    (ha0_q : Λ.point q ∉ Ba0) (ha0_center : Λ.point a0 ∉ Ba0)
    (ha1_subset : Ba1 ⊆ supportSet Λ.point)
    (ha1_card : Ba1.card = 4)
    (ha1_q : Λ.point q ∉ Ba1) (ha1_center : Λ.point a1 ∉ Ba1)
    (h12 : (Bt1 ∩ Bt2).card ≤ 2)
    (h13 : (Bt1 ∩ Bt3).card ≤ 2)
    (h23 : (Bt2 ∩ Bt3).card ≤ 2)
    (h1u : (Bt1 ∩ Bu).card ≤ 2)
    (h2u : (Bt2 ∩ Bu).card ≤ 2)
    (h3u : (Bt3 ∩ Bu).card ≤ 2)
    (h10 : (Bt1 ∩ Ba0).card ≤ 2)
    (h20 : (Bt2 ∩ Ba0).card ≤ 2)
    (h30 : (Bt3 ∩ Ba0).card ≤ 2)
    (hu0 : (Bu ∩ Ba0).card ≤ 2)
    (h11 : (Bt1 ∩ Ba1).card ≤ 2)
    (h21 : (Bt2 ∩ Ba1).card ≤ 2)
    (h31 : (Bt3 ∩ Ba1).card ≤ 2)
    (hu1 : (Bu ∩ Ba1).card ≤ 2)
    (h01 : (Ba0 ∩ Ba1).card ≤ 2) :
    ∃ P : IndexPattern,
      P ∈ boundedIndexPatterns ∧
      choice t1 P.i1 = labelMask (classLabels Λ.point Bt1) ∧
      choice t2 P.i2 = labelMask (classLabels Λ.point Bt2) ∧
      choice t3 P.i3 = labelMask (classLabels Λ.point Bt3) ∧
      choice u P.iu = labelMask (classLabels Λ.point Bu) ∧
      choice a0 P.ia0 = labelMask (classLabels Λ.point Ba0) ∧
      choice a1 P.ia1 = labelMask (classLabels Λ.point Ba1) ∧
      ∃ reason, patternReason P = some reason := by
  exact exists_boundedIndexPattern_of_labelClasses
    (classLabels Λ.point Bt1) (classLabels Λ.point Bt2)
    (classLabels Λ.point Bt3) (classLabels Λ.point Bu)
    (classLabels Λ.point Ba0) (classLabels Λ.point Ba1)
    (classLabels_card_eq_of_subset_support Λ.injective ht1_subset ht1_card)
    (label_not_mem_classLabels ht1_q)
    (label_not_mem_classLabels ht1_center)
    (classLabels_card_eq_of_subset_support Λ.injective ht2_subset ht2_card)
    (label_not_mem_classLabels ht2_q)
    (label_not_mem_classLabels ht2_center)
    (classLabels_card_eq_of_subset_support Λ.injective ht3_subset ht3_card)
    (label_not_mem_classLabels ht3_q)
    (label_not_mem_classLabels ht3_center)
    (classLabels_card_eq_of_subset_support Λ.injective hu_subset hu_card)
    (label_not_mem_classLabels hu_q)
    (label_not_mem_classLabels hu_center)
    (classLabels_card_eq_of_subset_support Λ.injective ha0_subset ha0_card)
    (label_not_mem_classLabels ha0_q)
    (label_not_mem_classLabels ha0_center)
    (classLabels_card_eq_of_subset_support Λ.injective ha1_subset ha1_card)
    (label_not_mem_classLabels ha1_q)
    (label_not_mem_classLabels ha1_center)
    (classLabels_inter_card_le Λ.injective h12)
    (classLabels_inter_card_le Λ.injective h13)
    (classLabels_inter_card_le Λ.injective h23)
    (classLabels_inter_card_le Λ.injective h1u)
    (classLabels_inter_card_le Λ.injective h2u)
    (classLabels_inter_card_le Λ.injective h3u)
    (classLabels_inter_card_le Λ.injective h10)
    (classLabels_inter_card_le Λ.injective h20)
    (classLabels_inter_card_le Λ.injective h30)
    (classLabels_inter_card_le Λ.injective hu0)
    (classLabels_inter_card_le Λ.injective h11)
    (classLabels_inter_card_le Λ.injective h21)
    (classLabels_inter_card_le Λ.injective h31)
    (classLabels_inter_card_le Λ.injective hu1)
    (classLabels_inter_card_le Λ.injective h01)

/-- Routed specialization of the real-class extractor to the selected classes
carried by `U5BoundedAuditSupport`, after the dangerous triple has been
labeled. -/
theorem exists_routedPatternData_of_auditedSupport
    {D : CounterexampleData} {q p u : ℝ²} {T : Finset ℝ²}
    (hs : U5BoundedAuditSupport D q p T u)
    {t1 t2 t3 : ℝ²} (hT : T = {t1, t2, t3})
    (hinj : Function.Injective
      (pointOf p q t1 t2 t3 u
        hs.toU5BoundedEightPointSupport.a0
        hs.toU5BoundedEightPointSupport.a1)) :
    Nonempty (RoutedPatternData D
      (pointOf p q t1 t2 t3 u
        hs.toU5BoundedEightPointSupport.a0
        hs.toU5BoundedEightPointSupport.a1)) := by
  let base := hs.toU5BoundedEightPointSupport
  let A0 := base.a0
  let A1 := base.a1
  let Λ : PointLabeling :=
    { point := pointOf p q t1 t2 t3 u A0 A1
      injective := by simpa [A0, A1, base] using hinj }
  have hsupp_eq :
      supportSet Λ.point = U5BoundedSupport D q p T u A0 A1 := by
    rw [hT]
    exact supportSet_pointOf_eq_boundedSupport D q p t1 t2 t3 u A0 A1
  have ht1_mem : t1 ∈ insert u (insert A0 (insert A1 T)) := by
    simp [hT]
  have ht2_mem : t2 ∈ insert u (insert A0 (insert A1 T)) := by
    simp [hT]
  have ht3_mem : t3 ∈ insert u (insert A0 (insert A1 T)) := by
    simp [hT]
  have hu_mem : u ∈ insert u (insert A0 (insert A1 T)) := by simp
  have ha0_mem : A0 ∈ insert u (insert A0 (insert A1 T)) := by simp
  have ha1_mem : A1 ∈ insert u (insert A0 (insert A1 T)) := by simp
  let Bt1 := (base.selected_classes t1 ht1_mem).1
  let Bt2 := (base.selected_classes t2 ht2_mem).1
  let Bt3 := (base.selected_classes t3 ht3_mem).1
  let Bu := (base.selected_classes u hu_mem).1
  let Ba0 := (base.selected_classes A0 ha0_mem).1
  let Ba1 := (base.selected_classes A1 ha1_mem).1
  have subset_t1 : Bt1 ⊆ supportSet Λ.point := by
    intro z hz
    rw [hsupp_eq]
    exact (base.selected_classes t1 ht1_mem).2.2 hz
  have subset_t2 : Bt2 ⊆ supportSet Λ.point := by
    intro z hz
    rw [hsupp_eq]
    exact (base.selected_classes t2 ht2_mem).2.2 hz
  have subset_t3 : Bt3 ⊆ supportSet Λ.point := by
    intro z hz
    rw [hsupp_eq]
    exact (base.selected_classes t3 ht3_mem).2.2 hz
  have subset_u : Bu ⊆ supportSet Λ.point := by
    intro z hz
    rw [hsupp_eq]
    exact (base.selected_classes u hu_mem).2.2 hz
  have subset_a0 : Ba0 ⊆ supportSet Λ.point := by
    intro z hz
    rw [hsupp_eq]
    exact (base.selected_classes A0 ha0_mem).2.2 hz
  have subset_a1 : Ba1 ⊆ supportSet Λ.point := by
    intro z hz
    rw [hsupp_eq]
    exact (base.selected_classes A1 ha1_mem).2.2 hz
  have q_t1 : Λ.point U5AuditLabel.q ∉ Bt1 := by
    simpa [Λ, pointOf, Bt1] using
      (base.selected_classes t1 ht1_mem).2.1.q_not_mem
  have q_t2 : Λ.point U5AuditLabel.q ∉ Bt2 := by
    simpa [Λ, pointOf, Bt2] using
      (base.selected_classes t2 ht2_mem).2.1.q_not_mem
  have q_t3 : Λ.point U5AuditLabel.q ∉ Bt3 := by
    simpa [Λ, pointOf, Bt3] using
      (base.selected_classes t3 ht3_mem).2.1.q_not_mem
  have q_u : Λ.point U5AuditLabel.q ∉ Bu := by
    simpa [Λ, pointOf, Bu] using
      (base.selected_classes u hu_mem).2.1.q_not_mem
  have q_a0 : Λ.point U5AuditLabel.q ∉ Ba0 := by
    simpa [Λ, pointOf, Ba0] using
      (base.selected_classes A0 ha0_mem).2.1.q_not_mem
  have q_a1 : Λ.point U5AuditLabel.q ∉ Ba1 := by
    simpa [Λ, pointOf, Ba1] using
      (base.selected_classes A1 ha1_mem).2.1.q_not_mem
  have center_t1 : Λ.point U5AuditLabel.t1 ∉ Bt1 := by
    intro hmem
    have hmem' : t1 ∈ Bt1 := by simpa [Λ, pointOf] using hmem
    exact (Finset.mem_erase.mp
      ((base.selected_classes t1 ht1_mem).2.1.subset hmem')).1 rfl
  have center_t2 : Λ.point U5AuditLabel.t2 ∉ Bt2 := by
    intro hmem
    have hmem' : t2 ∈ Bt2 := by simpa [Λ, pointOf] using hmem
    exact (Finset.mem_erase.mp
      ((base.selected_classes t2 ht2_mem).2.1.subset hmem')).1 rfl
  have center_t3 : Λ.point U5AuditLabel.t3 ∉ Bt3 := by
    intro hmem
    have hmem' : t3 ∈ Bt3 := by simpa [Λ, pointOf] using hmem
    exact (Finset.mem_erase.mp
      ((base.selected_classes t3 ht3_mem).2.1.subset hmem')).1 rfl
  have center_u : Λ.point U5AuditLabel.u ∉ Bu := by
    intro hmem
    have hmem' : u ∈ Bu := by simpa [Λ, pointOf] using hmem
    exact (Finset.mem_erase.mp
      ((base.selected_classes u hu_mem).2.1.subset hmem')).1 rfl
  have center_a0 : Λ.point U5AuditLabel.a0 ∉ Ba0 := by
    intro hmem
    have hmem' : A0 ∈ Ba0 := by simpa [Λ, pointOf] using hmem
    exact (Finset.mem_erase.mp
      ((base.selected_classes A0 ha0_mem).2.1.subset hmem')).1 rfl
  have center_a1 : Λ.point U5AuditLabel.a1 ∉ Ba1 := by
    intro hmem
    have hmem' : A1 ∈ Ba1 := by simpa [Λ, pointOf] using hmem
    exact (Finset.mem_erase.mp
      ((base.selected_classes A1 ha1_mem).2.1.subset hmem')).1 rfl
  let neLabel {l₁ l₂ : U5AuditLabel} (h : l₁ ≠ l₂) :
      Λ.point l₁ ≠ Λ.point l₂ := Λ.ne_of_label_ne h
  have ne_t1_t2 : t1 ≠ t2 := by
    simpa [Λ, pointOf] using
      neLabel (by decide : U5AuditLabel.t1 ≠ U5AuditLabel.t2)
  have ne_t1_t3 : t1 ≠ t3 := by
    simpa [Λ, pointOf] using
      neLabel (by decide : U5AuditLabel.t1 ≠ U5AuditLabel.t3)
  have ne_t2_t3 : t2 ≠ t3 := by
    simpa [Λ, pointOf] using
      neLabel (by decide : U5AuditLabel.t2 ≠ U5AuditLabel.t3)
  have ne_t1_u : t1 ≠ u := by
    simpa [Λ, pointOf] using
      neLabel (by decide : U5AuditLabel.t1 ≠ U5AuditLabel.u)
  have ne_t2_u : t2 ≠ u := by
    simpa [Λ, pointOf] using
      neLabel (by decide : U5AuditLabel.t2 ≠ U5AuditLabel.u)
  have ne_t3_u : t3 ≠ u := by
    simpa [Λ, pointOf] using
      neLabel (by decide : U5AuditLabel.t3 ≠ U5AuditLabel.u)
  have ne_t1_a0 : t1 ≠ A0 := by
    simpa [Λ, pointOf] using
      neLabel (by decide : U5AuditLabel.t1 ≠ U5AuditLabel.a0)
  have ne_t2_a0 : t2 ≠ A0 := by
    simpa [Λ, pointOf] using
      neLabel (by decide : U5AuditLabel.t2 ≠ U5AuditLabel.a0)
  have ne_t3_a0 : t3 ≠ A0 := by
    simpa [Λ, pointOf] using
      neLabel (by decide : U5AuditLabel.t3 ≠ U5AuditLabel.a0)
  have ne_u_a0 : u ≠ A0 := by
    simpa [Λ, pointOf] using
      neLabel (by decide : U5AuditLabel.u ≠ U5AuditLabel.a0)
  have ne_t1_a1 : t1 ≠ A1 := by
    simpa [Λ, pointOf] using
      neLabel (by decide : U5AuditLabel.t1 ≠ U5AuditLabel.a1)
  have ne_t2_a1 : t2 ≠ A1 := by
    simpa [Λ, pointOf] using
      neLabel (by decide : U5AuditLabel.t2 ≠ U5AuditLabel.a1)
  have ne_t3_a1 : t3 ≠ A1 := by
    simpa [Λ, pointOf] using
      neLabel (by decide : U5AuditLabel.t3 ≠ U5AuditLabel.a1)
  have ne_u_a1 : u ≠ A1 := by
    simpa [Λ, pointOf] using
      neLabel (by decide : U5AuditLabel.u ≠ U5AuditLabel.a1)
  have ne_a0_a1 : A0 ≠ A1 := by
    simpa [Λ, pointOf] using
      neLabel (by decide : U5AuditLabel.a0 ≠ U5AuditLabel.a1)
  have ov12 : (Bt1 ∩ Bt2).card ≤ 2 := by
    simpa [Bt1, Bt2, Λ, pointOf] using
      hs.two_circle_overlap t1 ht1_mem t2 ht2_mem ne_t1_t2
  have ov13 : (Bt1 ∩ Bt3).card ≤ 2 := by
    simpa [Bt1, Bt3, Λ, pointOf] using
      hs.two_circle_overlap t1 ht1_mem t3 ht3_mem ne_t1_t3
  have ov23 : (Bt2 ∩ Bt3).card ≤ 2 := by
    simpa [Bt2, Bt3, Λ, pointOf] using
      hs.two_circle_overlap t2 ht2_mem t3 ht3_mem ne_t2_t3
  have ov1u : (Bt1 ∩ Bu).card ≤ 2 := by
    simpa [Bt1, Bu, Λ, pointOf] using
      hs.two_circle_overlap t1 ht1_mem u hu_mem ne_t1_u
  have ov2u : (Bt2 ∩ Bu).card ≤ 2 := by
    simpa [Bt2, Bu, Λ, pointOf] using
      hs.two_circle_overlap t2 ht2_mem u hu_mem ne_t2_u
  have ov3u : (Bt3 ∩ Bu).card ≤ 2 := by
    simpa [Bt3, Bu, Λ, pointOf] using
      hs.two_circle_overlap t3 ht3_mem u hu_mem ne_t3_u
  have ov10 : (Bt1 ∩ Ba0).card ≤ 2 := by
    simpa [Bt1, Ba0, Λ, pointOf] using
      hs.two_circle_overlap t1 ht1_mem A0 ha0_mem ne_t1_a0
  have ov20 : (Bt2 ∩ Ba0).card ≤ 2 := by
    simpa [Bt2, Ba0, Λ, pointOf] using
      hs.two_circle_overlap t2 ht2_mem A0 ha0_mem ne_t2_a0
  have ov30 : (Bt3 ∩ Ba0).card ≤ 2 := by
    simpa [Bt3, Ba0, Λ, pointOf] using
      hs.two_circle_overlap t3 ht3_mem A0 ha0_mem ne_t3_a0
  have ovu0 : (Bu ∩ Ba0).card ≤ 2 := by
    simpa [Bu, Ba0, Λ, pointOf] using
      hs.two_circle_overlap u hu_mem A0 ha0_mem ne_u_a0
  have ov11 : (Bt1 ∩ Ba1).card ≤ 2 := by
    simpa [Bt1, Ba1, Λ, pointOf] using
      hs.two_circle_overlap t1 ht1_mem A1 ha1_mem ne_t1_a1
  have ov21 : (Bt2 ∩ Ba1).card ≤ 2 := by
    simpa [Bt2, Ba1, Λ, pointOf] using
      hs.two_circle_overlap t2 ht2_mem A1 ha1_mem ne_t2_a1
  have ov31 : (Bt3 ∩ Ba1).card ≤ 2 := by
    simpa [Bt3, Ba1, Λ, pointOf] using
      hs.two_circle_overlap t3 ht3_mem A1 ha1_mem ne_t3_a1
  have ovu1 : (Bu ∩ Ba1).card ≤ 2 := by
    simpa [Bu, Ba1, Λ, pointOf] using
      hs.two_circle_overlap u hu_mem A1 ha1_mem ne_u_a1
  have ov01 : (Ba0 ∩ Ba1).card ≤ 2 := by
    simpa [Ba0, Ba1, Λ, pointOf] using
      hs.two_circle_overlap A0 ha0_mem A1 ha1_mem ne_a0_a1
  rcases exists_boundedIndexPattern_of_realClasses Λ Bt1 Bt2 Bt3 Bu Ba0 Ba1
      subset_t1 (hs.selected_card_four t1 ht1_mem) q_t1 center_t1
      subset_t2 (hs.selected_card_four t2 ht2_mem) q_t2 center_t2
      subset_t3 (hs.selected_card_four t3 ht3_mem) q_t3 center_t3
      subset_u (hs.selected_card_four u hu_mem) q_u center_u
      subset_a0 (hs.selected_card_four A0 ha0_mem) q_a0 center_a0
      subset_a1 (hs.selected_card_four A1 ha1_mem) q_a1 center_a1
      ov12 ov13 ov23 ov1u ov2u ov3u ov10 ov20 ov30 ovu0
      ov11 ov21 ov31 ovu1 ov01 with
    ⟨P, hP, h1, h2, h3, hu, h0, h1a, hreason⟩
  rcases hreason with ⟨reason, hreason⟩
  refine ⟨?_⟩
  exact
    { Bt1 := Bt1
      Bt2 := Bt2
      Bt3 := Bt3
      Bu := Bu
      Ba0 := Ba0
      Ba1 := Ba1
      Kt1 := by
        simpa [Λ, pointOf, Bt1, A0, A1, base] using
          (base.selected_classes t1 ht1_mem).2.1
      Kt2 := by
        simpa [Λ, pointOf, Bt2, A0, A1, base] using
          (base.selected_classes t2 ht2_mem).2.1
      Kt3 := by
        simpa [Λ, pointOf, Bt3, A0, A1, base] using
          (base.selected_classes t3 ht3_mem).2.1
      Ku := by
        simpa [Λ, pointOf, Bu, A0, A1, base] using
          (base.selected_classes u hu_mem).2.1
      Ka0 := by
        simpa [Λ, pointOf, Ba0, A0, A1, base] using
          (base.selected_classes A0 ha0_mem).2.1
      Ka1 := by
        simpa [Λ, pointOf, Ba1, A0, A1, base] using
          (base.selected_classes A1 ha1_mem).2.1
      P := P
      hP := hP
      h1 := by simpa [Λ, A0, A1, base] using h1
      h2 := by simpa [Λ, A0, A1, base] using h2
      h3 := by simpa [Λ, A0, A1, base] using h3
      hu := by simpa [Λ, A0, A1, base] using hu
      h0 := by simpa [Λ, A0, A1, base] using h0
      h1a := by simpa [Λ, A0, A1, base] using h1a
      reason := reason
      hreason := hreason }

/-- Compact statement retained for callers that only need the finite index
pattern and named reason. -/
theorem exists_boundedIndexPattern_of_auditedSupport
    {D : CounterexampleData} {q p u : ℝ²} {T : Finset ℝ²}
    (hs : U5BoundedAuditSupport D q p T u)
    {t1 t2 t3 : ℝ²} (hT : T = {t1, t2, t3})
    (hinj : Function.Injective
      (pointOf p q t1 t2 t3 u
        hs.toU5BoundedEightPointSupport.a0
        hs.toU5BoundedEightPointSupport.a1)) :
    ∃ P : IndexPattern,
      P ∈ boundedIndexPatterns ∧
      ∃ reason, patternReason P = some reason := by
  rcases exists_routedPatternData_of_auditedSupport hs hT hinj with
    ⟨data⟩
  exact ⟨data.P, data.hP, data.reason, data.hreason⟩

/-- An exact audited bad pattern has a bounded finite index pattern and a
named prefilter reason.  This discharges the label/index extraction part of
the bounded audit; the next layer routes the named reason to the corresponding
metric incompatibility. -/
theorem exists_boundedIndexPattern_of_auditedBadPattern
    {D : CounterexampleData} {q p u : ℝ²} {T : Finset ℝ²}
    (hbad : U5AuditedBoundedBadPattern D q p T u) :
    ∃ P : IndexPattern,
      P ∈ boundedIndexPatterns ∧
      ∃ reason, patternReason P = some reason := by
  rcases hbad.dangerous.exists_triple_labels with
    ⟨t1, t2, t3, ht12, ht13, ht23, hT, _hnoncol, _hr1, _hr2, _hr3⟩
  let hs := hbad.audited_support
  let base := hs.toU5BoundedEightPointSupport
  let A0 := base.a0
  let A1 := base.a1
  have ht1T : t1 ∈ T := by simp [hT]
  have ht2T : t2 ∈ T := by simp [hT]
  have ht3T : t3 ∈ T := by simp [hT]
  have hpt1 : p ≠ t1 := (ne_of_mem_skeleton_erase (hbad.dangerous.T_subset ht1T)).1
  have hpt2 : p ≠ t2 := (ne_of_mem_skeleton_erase (hbad.dangerous.T_subset ht2T)).1
  have hpt3 : p ≠ t3 := (ne_of_mem_skeleton_erase (hbad.dangerous.T_subset ht3T)).1
  have hqt1 : q ≠ t1 := (ne_of_mem_skeleton_erase (hbad.dangerous.T_subset ht1T)).2
  have hqt2 : q ≠ t2 := (ne_of_mem_skeleton_erase (hbad.dangerous.T_subset ht2T)).2
  have hqt3 : q ≠ t3 := (ne_of_mem_skeleton_erase (hbad.dangerous.T_subset ht3T)).2
  have hpu : p ≠ u := (ne_of_mem_skeleton_erase hbad.selected.candidate_mem).1
  have hqu : q ≠ u := (ne_of_mem_skeleton_erase hbad.selected.candidate_mem).2
  have hpA0 : p ≠ A0 := by
    simpa [A0, base, hs] using (ne_of_mem_skeleton_erase base.a0_mem).1
  have hqA0 : q ≠ A0 := by
    simpa [A0, base, hs] using (ne_of_mem_skeleton_erase base.a0_mem).2
  have hpA1 : p ≠ A1 := by
    simpa [A1, base, hs] using (ne_of_mem_skeleton_erase base.a1_mem).1
  have hqA1 : q ≠ A1 := by
    simpa [A1, base, hs] using (ne_of_mem_skeleton_erase base.a1_mem).2
  have ht1u : t1 ≠ u := by
    intro h
    exact hbad.selected.candidate_notin_T (by simpa [h] using ht1T)
  have ht2u : t2 ≠ u := by
    intro h
    exact hbad.selected.candidate_notin_T (by simpa [h] using ht2T)
  have ht3u : t3 ≠ u := by
    intro h
    exact hbad.selected.candidate_notin_T (by simpa [h] using ht3T)
  have ht1A0 : t1 ≠ A0 := by
    intro h
    have hA0T : A0 ∈ T := by simpa [h] using ht1T
    exact base.a0_notin_base (Finset.mem_insert.mpr (Or.inr hA0T))
  have ht2A0 : t2 ≠ A0 := by
    intro h
    have hA0T : A0 ∈ T := by simpa [h] using ht2T
    exact base.a0_notin_base (Finset.mem_insert.mpr (Or.inr hA0T))
  have ht3A0 : t3 ≠ A0 := by
    intro h
    have hA0T : A0 ∈ T := by simpa [h] using ht3T
    exact base.a0_notin_base (Finset.mem_insert.mpr (Or.inr hA0T))
  have huA0 : u ≠ A0 := by
    intro h
    exact base.a0_notin_base (Finset.mem_insert.mpr (Or.inl h.symm))
  have ht1A1 : t1 ≠ A1 := by
    intro h
    have hA1T : A1 ∈ T := by simpa [h] using ht1T
    exact base.a1_notin_base
      (Finset.mem_insert.mpr
        (Or.inr (Finset.mem_insert.mpr (Or.inr hA1T))))
  have ht2A1 : t2 ≠ A1 := by
    intro h
    have hA1T : A1 ∈ T := by simpa [h] using ht2T
    exact base.a1_notin_base
      (Finset.mem_insert.mpr
        (Or.inr (Finset.mem_insert.mpr (Or.inr hA1T))))
  have ht3A1 : t3 ≠ A1 := by
    intro h
    have hA1T : A1 ∈ T := by simpa [h] using ht3T
    exact base.a1_notin_base
      (Finset.mem_insert.mpr
        (Or.inr (Finset.mem_insert.mpr (Or.inr hA1T))))
  have huA1 : u ≠ A1 := by
    intro h
    exact base.a1_notin_base (Finset.mem_insert.mpr (Or.inl h.symm))
  have hA01 : A0 ≠ A1 := by
    intro h
    exact base.a1_notin_base
      (Finset.mem_insert.mpr
        (Or.inr (Finset.mem_insert.mpr (Or.inl h.symm))))
  have hinj : Function.Injective (pointOf p q t1 t2 t3 u A0 A1) :=
    pointOf_injective hbad.dangerous.p_ne_q hpt1 hpt2 hpt3 hpu hpA0 hpA1
      hqt1 hqt2 hqt3 hqu hqA0 hqA1 ht12 ht13 ht1u ht1A0 ht1A1
      ht23 ht2u ht2A0 ht2A1 ht3u ht3A0 ht3A1 huA0 huA1 hA01
  exact exists_boundedIndexPattern_of_auditedSupport hs hT (by
    simpa [A0, A1, base, hs] using hinj)

/-- The finite audit and the seven routed metric kernels exclude every exact
audited bounded bad pattern. -/
theorem false_of_auditedBadPattern
    {D : CounterexampleData} {q p u : ℝ²} {T : Finset ℝ²}
    (hbad : U5AuditedBoundedBadPattern D q p T u) : False := by
  rcases hbad.dangerous.exists_triple_labels with
    ⟨T1, T2, T3, hT12, hT13, hT23, hT, hnoncol, hr1, hr2, hr3⟩
  let hs := hbad.audited_support
  let base := hs.toU5BoundedEightPointSupport
  let A0 := base.a0
  let A1 := base.a1
  have hT1T : T1 ∈ T := by simp [hT]
  have hT2T : T2 ∈ T := by simp [hT]
  have hT3T : T3 ∈ T := by simp [hT]
  have hpT1 : p ≠ T1 := (ne_of_mem_skeleton_erase (hbad.dangerous.T_subset hT1T)).1
  have hpT2 : p ≠ T2 := (ne_of_mem_skeleton_erase (hbad.dangerous.T_subset hT2T)).1
  have hpT3 : p ≠ T3 := (ne_of_mem_skeleton_erase (hbad.dangerous.T_subset hT3T)).1
  have hqT1 : q ≠ T1 := (ne_of_mem_skeleton_erase (hbad.dangerous.T_subset hT1T)).2
  have hqT2 : q ≠ T2 := (ne_of_mem_skeleton_erase (hbad.dangerous.T_subset hT2T)).2
  have hqT3 : q ≠ T3 := (ne_of_mem_skeleton_erase (hbad.dangerous.T_subset hT3T)).2
  have hpu : p ≠ u := (ne_of_mem_skeleton_erase hbad.selected.candidate_mem).1
  have hqu : q ≠ u := (ne_of_mem_skeleton_erase hbad.selected.candidate_mem).2
  have hpA0 : p ≠ A0 := by
    simpa [A0, base, hs] using (ne_of_mem_skeleton_erase base.a0_mem).1
  have hqA0 : q ≠ A0 := by
    simpa [A0, base, hs] using (ne_of_mem_skeleton_erase base.a0_mem).2
  have hpA1 : p ≠ A1 := by
    simpa [A1, base, hs] using (ne_of_mem_skeleton_erase base.a1_mem).1
  have hqA1 : q ≠ A1 := by
    simpa [A1, base, hs] using (ne_of_mem_skeleton_erase base.a1_mem).2
  have hT1u : T1 ≠ u := by
    intro h
    exact hbad.selected.candidate_notin_T (by simpa [h] using hT1T)
  have hT2u : T2 ≠ u := by
    intro h
    exact hbad.selected.candidate_notin_T (by simpa [h] using hT2T)
  have hT3u : T3 ≠ u := by
    intro h
    exact hbad.selected.candidate_notin_T (by simpa [h] using hT3T)
  have hT1A0 : T1 ≠ A0 := by
    intro h
    have hA0T : A0 ∈ T := by simpa [h] using hT1T
    exact base.a0_notin_base (Finset.mem_insert.mpr (Or.inr hA0T))
  have hT2A0 : T2 ≠ A0 := by
    intro h
    have hA0T : A0 ∈ T := by simpa [h] using hT2T
    exact base.a0_notin_base (Finset.mem_insert.mpr (Or.inr hA0T))
  have hT3A0 : T3 ≠ A0 := by
    intro h
    have hA0T : A0 ∈ T := by simpa [h] using hT3T
    exact base.a0_notin_base (Finset.mem_insert.mpr (Or.inr hA0T))
  have huA0 : u ≠ A0 := by
    intro h
    exact base.a0_notin_base (Finset.mem_insert.mpr (Or.inl h.symm))
  have hT1A1 : T1 ≠ A1 := by
    intro h
    have hA1T : A1 ∈ T := by simpa [h] using hT1T
    exact base.a1_notin_base
      (Finset.mem_insert.mpr
        (Or.inr (Finset.mem_insert.mpr (Or.inr hA1T))))
  have hT2A1 : T2 ≠ A1 := by
    intro h
    have hA1T : A1 ∈ T := by simpa [h] using hT2T
    exact base.a1_notin_base
      (Finset.mem_insert.mpr
        (Or.inr (Finset.mem_insert.mpr (Or.inr hA1T))))
  have hT3A1 : T3 ≠ A1 := by
    intro h
    have hA1T : A1 ∈ T := by simpa [h] using hT3T
    exact base.a1_notin_base
      (Finset.mem_insert.mpr
        (Or.inr (Finset.mem_insert.mpr (Or.inr hA1T))))
  have huA1 : u ≠ A1 := by
    intro h
    exact base.a1_notin_base (Finset.mem_insert.mpr (Or.inl h.symm))
  have hA01 : A0 ≠ A1 := by
    intro h
    exact base.a1_notin_base
      (Finset.mem_insert.mpr
        (Or.inr (Finset.mem_insert.mpr (Or.inl h.symm))))
  have hinj : Function.Injective (pointOf p q T1 T2 T3 u A0 A1) :=
    pointOf_injective hbad.dangerous.p_ne_q hpT1 hpT2 hpT3 hpu hpA0 hpA1
      hqT1 hqT2 hqT3 hqu hqA0 hqA1 hT12 hT13 hT1u hT1A0 hT1A1
      hT23 hT2u hT2A0 hT2A1 hT3u hT3A0 hT3A1 huA0 huA1 hA01
  let Λ : PointLabeling :=
    { point := pointOf p q T1 T2 T3 u A0 A1
      injective := hinj }
  rcases exists_routedPatternData_of_auditedSupport hs hT (by
      simpa [A0, A1, base, hs] using hinj) with
    ⟨data⟩
  have hnoncolΛ : ¬ Collinear ℝ
      ({Λ.point U5AuditLabel.t1, Λ.point U5AuditLabel.t2,
          Λ.point U5AuditLabel.t3} : Set ℝ²) := by
    simpa [Λ, pointOf] using hnoncol
  have hr1Λ : dist (Λ.point U5AuditLabel.p) (Λ.point U5AuditLabel.t1) =
      dist (Λ.point U5AuditLabel.p) (Λ.point U5AuditLabel.q) := by
    simpa [Λ, pointOf] using hr1
  have hr2Λ : dist (Λ.point U5AuditLabel.p) (Λ.point U5AuditLabel.t2) =
      dist (Λ.point U5AuditLabel.p) (Λ.point U5AuditLabel.q) := by
    simpa [Λ, pointOf] using hr2
  have hr3Λ : dist (Λ.point U5AuditLabel.p) (Λ.point U5AuditLabel.t3) =
      dist (Λ.point U5AuditLabel.p) (Λ.point U5AuditLabel.q) := by
    simpa [Λ, pointOf] using hr3
  have hu_offΛ : dist (Λ.point U5AuditLabel.p) (Λ.point U5AuditLabel.u) ≠
      dist (Λ.point U5AuditLabel.p) (Λ.point U5AuditLabel.q) := by
    simpa [Λ, pointOf] using hbad.not_same_radius
  have ha0_offΛ : dist (Λ.point U5AuditLabel.p) (Λ.point U5AuditLabel.a0) ≠
      dist (Λ.point U5AuditLabel.p) (Λ.point U5AuditLabel.q) := by
    simpa [Λ, pointOf, A0, A1, base, hs] using hs.a0_off_circle
  have ha1_offΛ : dist (Λ.point U5AuditLabel.p) (Λ.point U5AuditLabel.a1) ≠
      dist (Λ.point U5AuditLabel.p) (Λ.point U5AuditLabel.q) := by
    simpa [Λ, pointOf, A0, A1, base, hs] using hs.a1_off_circle
  have hr_posΛ : 0 < dist (Λ.point U5AuditLabel.p)
      (Λ.point U5AuditLabel.q) := by
    simpa [Λ, pointOf] using hbad.dangerous.q_radius_pos
  exact route_patternReason
    (D := D) (Λ := Λ) (P := data.P)
    (Bt1 := data.Bt1) (Bt2 := data.Bt2) (Bt3 := data.Bt3)
    (Bu := data.Bu) (Ba0 := data.Ba0) (Ba1 := data.Ba1)
    (by simpa [Λ, pointOf, A0, A1, base, hs] using data.Kt1)
    (by simpa [Λ, pointOf, A0, A1, base, hs] using data.Kt2)
    (by simpa [Λ, pointOf, A0, A1, base, hs] using data.Kt3)
    (by simpa [Λ, pointOf, A0, A1, base, hs] using data.Ku)
    (by simpa [Λ, pointOf, A0, A1, base, hs] using data.Ka0)
    (by simpa [Λ, pointOf, A0, A1, base, hs] using data.Ka1)
    (by simpa [Λ, A0, A1, base, hs] using data.h1)
    (by simpa [Λ, A0, A1, base, hs] using data.h2)
    (by simpa [Λ, A0, A1, base, hs] using data.h3)
    (by simpa [Λ, A0, A1, base, hs] using data.hu)
    (by simpa [Λ, A0, A1, base, hs] using data.h0)
    (by simpa [Λ, A0, A1, base, hs] using data.h1a)
    hr_posΛ hnoncolΛ hr1Λ hr2Λ hr3Λ hu_offΛ ha0_offΛ ha1_offΛ
    data.hreason

end U5AuditLabel

/-- The exact finite U5 audit excludes all audited bounded bad patterns. -/
theorem u5NoAuditedBoundedBadPattern (D : CounterexampleData) :
    U5NoAuditedBoundedBadPattern D := by
  intro _hM44 _hU2 _hModeA q p T u
  exact ⟨fun hbad => U5AuditLabel.false_of_auditedBadPattern hbad⟩

/-- The closed finite audit gives the audited-support reduction directly. -/
theorem u5AuditedBoundedSupportReduction (D : CounterexampleData) :
    U5AuditedBoundedSupportReduction D :=
  u5AuditedBoundedSupportReduction_of_noBadPattern
    (u5NoAuditedBoundedBadPattern D)

/-- If the row/global producers supply either same-circle directly or the
audited support payload, the approved global repeated-circle target follows. -/
theorem u5ForcedRepeatedCircle_of_auditedSupportOrSameCircle
    {D : CounterexampleData}
    (hproducer : U5AuditedSupportOrSameCircle D) :
    U5ForcedRepeatedCircle D := by
  intro hM44 hU2 hModeA q p T F u htriple hsel
  rcases hproducer hM44 hU2 hModeA q p T F u htriple hsel with
    hsame | hsupport_nonempty
  · exact hsame
  · rcases hsupport_nonempty with ⟨hsupport⟩
    exact u5AuditedBoundedSupportReduction D
      hM44 hU2 hModeA q p T F u htriple hsel hsupport

/-- The approved global repeated-circle theorem follows for payload-bearing
candidate descriptors.  The row/global work is now located at concrete
`U5CandidateDescriptor` construction sites: each descriptor must provide its
`producer_payload` field. -/
theorem u5ForcedRepeatedCircle (D : CounterexampleData) :
    U5ForcedRepeatedCircle D :=
  u5ForcedRepeatedCircle_of_auditedSupportOrSameCircle
    (u5AuditedSupportOrSameCircle D)

/-- A completed audited support payload is a direct same-circle source for the
endpoint-literal U5d-d2c row.

This is the selected-class landing point: if a concrete row/global proof gives
the actual `U5BoundedAuditSupport` payload, it can feed the finite audit
directly. -/
theorem u5SameCircleExport_of_auditedSupport
    {D : CounterexampleData} {q p u : ℝ²} {T : Finset ℝ²}
    (hM44 : D.IsM44) (hU2 : U2Statement D) (hModeA : U5ModeA D)
    (htriple : U5DangerousTriple D q p T)
    (hsel : U5SelectedCandidateSkeleton D q p T u)
    (hsupport : U5BoundedAuditSupport D q p T u) :
    U5SameCircleExport D q p T u := by
  let F : U5CandidateDescriptor D q p T :=
    u5EndpointLiteralDescriptor_of_auditedSupport hsel ⟨hsupport⟩
  exact u5ForcedRepeatedCircle D hM44 hU2 hModeA q p T F u htriple
    ⟨rfl⟩

/-- A completed confined-class audit payload is a direct same-circle source. -/
theorem u5SameCircleExport_of_confinedK4AuditPayload
    {D : CounterexampleData} {q p u : ℝ²} {T : Finset ℝ²}
    (hM44 : D.IsM44) (hU2 : U2Statement D) (hModeA : U5ModeA D)
    (htriple : U5DangerousTriple D q p T)
    (hsel : U5SelectedCandidateSkeleton D q p T u)
    (H : U5ConfinedK4AuditPayload D q p T u) :
    U5SameCircleExport D q p T u :=
  u5SameCircleExport_of_auditedSupport hM44 hU2 hModeA htriple hsel
    H.toAuditedSupport

/-- Exact dangerous-triple data rules out a confined-class payload unless the
incompatibility has already been contradicted. -/
theorem u5False_of_exact_confinedK4AuditPayload
    {D : CounterexampleData} {q p u : ℝ²} {T : Finset ℝ²}
    (hM44 : D.IsM44) (hU2 : U2Statement D) (hModeA : U5ModeA D)
    (htriple : U5DangerousTriple D q p T)
    (hsel : U5SelectedCandidateSkeleton D q p T u)
    (hexact :
      (((D.skeleton q).erase p).filter fun y => dist p y = dist p q).card = 3)
    (H : U5ConfinedK4AuditPayload D q p T u) :
    False :=
  htriple.selected_off_circle_of_exact hsel hexact
    (u5SameCircleExport_of_confinedK4AuditPayload
      hM44 hU2 hModeA htriple hsel H).2

/-- Direct U5 adapter after the exact audited support payload is available. -/
theorem u5AuditedBoundedSupport_hasNEquidistantPointsAt
    {D : CounterexampleData}
    (hM44 : D.IsM44) (hU2 : U2Statement D) (hModeA : U5ModeA D)
    {q p u : ℝ²} {T : Finset ℝ²} {F : U5CandidateDescriptor D q p T}
    (htriple : U5DangerousTriple D q p T)
    (hsel : U5SelectedCandidate D q p T F u)
    (hsupport : U5BoundedAuditSupport D q p T u) :
    HasNEquidistantPointsAt 4 ((D.skeleton q).erase p) p :=
  u5AuditedBoundedSupportReduction_hasNEquidistantPointsAt
    (u5AuditedBoundedSupportReduction D)
    hM44 hU2 hModeA htriple hsel hsupport

/-- Direct U5 adapter from a selected-class audited support payload, without
requiring callers to first build a descriptor. -/
theorem u5AuditedSupport_hasNEquidistantPointsAt
    {D : CounterexampleData}
    (hM44 : D.IsM44) (hU2 : U2Statement D) (hModeA : U5ModeA D)
    {q p u : ℝ²} {T : Finset ℝ²}
    (htriple : U5DangerousTriple D q p T)
    (hsel : U5SelectedCandidateSkeleton D q p T u)
    (hsupport : U5BoundedAuditSupport D q p T u) :
    HasNEquidistantPointsAt 4 ((D.skeleton q).erase p) p :=
  u5QFreeWitness_hasNEquidistantPointsAt htriple
    { selected := hsel
      same_circle :=
        u5SameCircleExport_of_auditedSupport
          hM44 hU2 hModeA htriple hsel hsupport }

/-- Direct U5 adapter after a confined-class audit payload is available. -/
theorem u5ConfinedK4AuditPayload_hasNEquidistantPointsAt
    {D : CounterexampleData}
    (hM44 : D.IsM44) (hU2 : U2Statement D) (hModeA : U5ModeA D)
    {q p u : ℝ²} {T : Finset ℝ²}
    (htriple : U5DangerousTriple D q p T)
    (hsel : U5SelectedCandidateSkeleton D q p T u)
    (H : U5ConfinedK4AuditPayload D q p T u) :
    HasNEquidistantPointsAt 4 ((D.skeleton q).erase p) p :=
  u5AuditedSupport_hasNEquidistantPointsAt hM44 hU2 hModeA
    htriple hsel H.toAuditedSupport

end Problem97
