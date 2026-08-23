/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna.
-/

import Erdos9796Proof.P97.ATail.TwoRadiusGridConvexNesting
import Erdos9796Proof.P97.Census554.ZeroCutBoundaryIndexing

/-!
# Escape synchronization for two reflected radius pairs

This file isolates the source-independent boundary-order step in the D2
two-radius-grid argument.  A strict cap interior is used only through order
convexity in one retained boundary indexing.  Consequently the two escape
points may lie at endpoints of adjacent *closed* caps; no strict adjacent-cap
membership is assumed.

For positively oriented representatives the convex-nesting theorem forces the
cyclic pattern

`small, large, largeMirror, smallMirror`.

If the actual strict-interior representatives used opposite transverse signs,
one of the two escape points would therefore occur strictly between them and,
by order convexity, would itself belong to the strict interior.  This
contradicts the exact one-inside/one-outside labeling.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailTwoRadiusGridEscapeSynchronization

open Census554
open Census554.CapSelectedGeometry
open Census554.GeneralCarrierBridge
open ATailTwoRadiusGridCoordinateGeometry
open Erdos9796Proof.Geometry

/-- A subset of the retained boundary is order-convex in the chosen linear
cut.  This is the only cap-contiguity property used by synchronization. -/
def BoundaryOrderConvex {A : Finset ℝ²} (B : BoundaryIndexing A)
    (C : Finset ℝ²) : Prop :=
  ∀ ⦃i j k : Fin B.n⦄, i < j → j < k →
    B.boundary i ∈ C → B.boundary k ∈ C → B.boundary j ∈ C

/-- The positive-coordinate output of the generic convex-nesting theorem. -/
def PositiveScaledNesting (o a s L : ℝ²) : Prop :=
  0 < scaledLongitudinalCoord o a s ∧
    0 < scaledTransverseCoord o a s ∧
    scaledTransverseCoord o a s < scaledTransverseCoord o a L ∧
    0 < scaledLongitudinalCoord o a L * scaledTransverseCoord o a s -
      scaledTransverseCoord o a L * scaledLongitudinalCoord o a s

private theorem boundary_mem {A : Finset ℝ²} (B : BoundaryIndexing A)
    (i : Fin B.n) : B.boundary i ∈ A := by
  have hi : B.boundary i ∈ Finset.univ.image B.boundary :=
    Finset.mem_image.mpr ⟨i, Finset.mem_univ _, rfl⟩
  simpa only [B.boundary_image] using hi

private theorem cyclic_indices_of_signedArea2_neg
    {A : Finset ℝ²} (B : BoundaryIndexing A)
    {p q r : ℝ²} {ip iq ir : Fin B.n}
    (hp : B.boundary ip = p) (hq : B.boundary iq = q)
    (hr : B.boundary ir = r) (harea : signedArea2 p q r < 0) :
    (ip < iq ∧ iq < ir) ∨ (iq < ir ∧ ir < ip) ∨
      (ir < ip ∧ ip < iq) := by
  have hpq : ip ≠ iq := by
    intro h
    have hpq' : p = q := by
      calc
        p = B.boundary ip := hp.symm
        _ = B.boundary iq := congrArg B.boundary h
        _ = q := hq
    have hzero : signedArea2 p q r = 0 := by
      rw [hpq']
      simp [signedArea2]
    linarith
  have hqr : iq ≠ ir := by
    intro h
    have hqr' : q = r := by
      calc
        q = B.boundary iq := hq.symm
        _ = B.boundary ir := congrArg B.boundary h
        _ = r := hr
    have hzero : signedArea2 p q r = 0 := by
      rw [hqr']
      simp [signedArea2]
    linarith
  have hirp : ir ≠ ip := by
    intro h
    have hrp' : r = p := by
      calc
        r = B.boundary ir := hr.symm
        _ = B.boundary ip := congrArg B.boundary h
        _ = p := hp
    have hzero : signedArea2 p q r = 0 := by
      rw [hrp']
      simp [signedArea2]
    linarith
  have hneg : ∀ {i j k : Fin B.n}, i < j → j < k →
      signedArea2 (B.boundary i) (B.boundary j) (B.boundary k) < 0 :=
    hneg_of_ccw B.boundary_injective B.boundary_ccw
  have hnot_prq : ¬ (ip < ir ∧ ir < iq) := by
    rintro ⟨hpir, hriq⟩
    have h := hneg hpir hriq
    rw [hp, hr, hq] at h
    have hswap : signedArea2 p r q = -signedArea2 p q r := by
      simp [signedArea2]
    rw [hswap] at h
    linarith
  have hnot_rqp : ¬ (ir < iq ∧ iq < ip) := by
    rintro ⟨hriq, hqip⟩
    have h := hneg hriq hqip
    rw [hr, hq, hp] at h
    have hswap : signedArea2 r q p = -signedArea2 p q r := by
      simp [signedArea2]
      ring
    rw [hswap] at h
    linarith
  have hnot_qpr : ¬ (iq < ip ∧ ip < ir) := by
    rintro ⟨hqip, hpir⟩
    have h := hneg hqip hpir
    rw [hq, hp, hr] at h
    have hswap : signedArea2 q p r = -signedArea2 p q r := by
      simp [signedArea2]
      ring
    rw [hswap] at h
    linarith
  omega

/-- Boundary-index form of the cyclic order of the two positively oriented
reflected pairs.  The two conclusions are the two crossed-cap contradictions:
whichever alternating pair is declared inside, one of the other pair lies
strictly between its members. -/
theorem positiveRepresentatives_cyclicBetweenness
    {A : Finset ℝ²} (B : BoundaryIndexing A)
    {o a s sMinus L LMinus : ℝ²}
    {is isMinus iL iLMinus : Fin B.n}
    (hs : B.boundary is = s) (hsMinus : B.boundary isMinus = sMinus)
    (hL : B.boundary iL = L) (hLMinus : B.boundary iLMinus = LMinus)
    (hoa : o ≠ a)
    (hsReflect :
      scaledLongitudinalCoord o a s =
          scaledLongitudinalCoord o a sMinus ∧
        scaledTransverseCoord o a s =
          -scaledTransverseCoord o a sMinus)
    (hLReflect :
      scaledLongitudinalCoord o a L =
          scaledLongitudinalCoord o a LMinus ∧
        scaledTransverseCoord o a L =
          -scaledTransverseCoord o a LMinus)
    (hNest : PositiveScaledNesting o a s L) :
    ((is < iL ∧ iL < iLMinus) ∨
        (iLMinus < isMinus ∧ isMinus < is)) ∧
      ((iL < iLMinus ∧ iLMinus < isMinus) ∨
        (isMinus < is ∧ is < iL)) := by
  have hXx : scaledLongitudinalCoord o a s <
      scaledLongitudinalCoord o a L := by
    by_contra hnot
    have hle : scaledLongitudinalCoord o a L ≤
        scaledLongitudinalCoord o a s := le_of_not_gt hnot
    have hmulLe :
        scaledLongitudinalCoord o a L * scaledTransverseCoord o a s ≤
          scaledLongitudinalCoord o a s * scaledTransverseCoord o a s :=
      mul_le_mul_of_nonneg_right hle hNest.2.1.le
    have hmulLt :
        scaledLongitudinalCoord o a s * scaledTransverseCoord o a s <
          scaledTransverseCoord o a L * scaledLongitudinalCoord o a s := by
      simpa [mul_comm] using
        (mul_lt_mul_of_pos_right hNest.2.2.1 hNest.1)
    linarith [hNest.2.2.2]
  have hN : 0 < ‖a - o‖ ^ 2 :=
    sq_pos_of_pos (norm_pos_iff.mpr (sub_ne_zero.mpr hoa.symm))
  have harea₁ : signedArea2 s L LMinus < 0 := by
    have htransport := scaledCoordinate_triangle_det o a s L LMinus
    have hscaled :
        (scaledLongitudinalCoord o a L - scaledLongitudinalCoord o a s) *
              (scaledTransverseCoord o a LMinus -
                scaledTransverseCoord o a s) -
            (scaledTransverseCoord o a L -
                scaledTransverseCoord o a s) *
              (scaledLongitudinalCoord o a LMinus -
                scaledLongitudinalCoord o a s) < 0 := by
      rw [← hLReflect.1]
      have htrans : scaledTransverseCoord o a LMinus =
          -scaledTransverseCoord o a L := by linarith [hLReflect.2]
      rw [htrans]
      have hYpos : 0 < scaledTransverseCoord o a L :=
        lt_trans hNest.2.1 hNest.2.2.1
      nlinarith
    rw [htransport] at hscaled
    rcases (mul_neg_iff.mp hscaled) with h | h
    · exact h.2
    · exact False.elim ((not_lt_of_ge hN.le) h.1)
  have harea₂ : signedArea2 LMinus sMinus s < 0 := by
    have htransport := scaledCoordinate_triangle_det o a LMinus sMinus s
    have hscaled :
        (scaledLongitudinalCoord o a sMinus -
              scaledLongitudinalCoord o a LMinus) *
              (scaledTransverseCoord o a s -
                scaledTransverseCoord o a LMinus) -
            (scaledTransverseCoord o a sMinus -
                scaledTransverseCoord o a LMinus) *
              (scaledLongitudinalCoord o a s -
                scaledLongitudinalCoord o a LMinus) < 0 := by
      rw [← hsReflect.1, ← hLReflect.1]
      have hsTrans : scaledTransverseCoord o a sMinus =
          -scaledTransverseCoord o a s := by linarith [hsReflect.2]
      have hLTrans : scaledTransverseCoord o a LMinus =
          -scaledTransverseCoord o a L := by linarith [hLReflect.2]
      rw [hsTrans, hLTrans]
      nlinarith [hNest.2.1]
    rw [htransport] at hscaled
    rcases (mul_neg_iff.mp hscaled) with h | h
    · exact h.2
    · exact False.elim ((not_lt_of_ge hN.le) h.1)
  have hcyc₁ := cyclic_indices_of_signedArea2_neg B hs hL hLMinus harea₁
  have hcyc₂ := cyclic_indices_of_signedArea2_neg B hLMinus hsMinus hs harea₂
  constructor
  · rcases hcyc₁ with h | h | h <;>
      rcases hcyc₂ with h' | h' | h' <;> omega
  · rcases hcyc₁ with h | h | h <;>
      rcases hcyc₂ with h' | h' | h' <;> omega

/-- The first non-surplus strict cap interior is order-convex in either
zero-cut boundary orientation.  The proof passes through the *closed* cap
interval and then excludes its two endpoints by strict index inequalities, so
closed-cap endpoint escapees are handled without strengthening hypotheses. -/
theorem oppIndex1_capInterior_boundaryOrderConvex
    {A : Finset ℝ²} (S : SurplusCapPacket A) (B : BoundaryIndexing A)
    (hn : 0 < B.n) (iv iw : Fin B.n)
    (hu : B.boundary (zeroIndex hn) =
      S.oppositeVertexByIndex S.surplusIdx)
    (hv : B.boundary iv = S.oppositeVertexByIndex S.oppIndex1)
    (hw : B.boundary iw = S.oppositeVertexByIndex S.oppIndex2)
    (hblocks : DirectBoundaryBlocks S B.boundary hn iv iw ∨
      MirrorBoundaryBlocks S B.boundary hn iv iw) :
    BoundaryOrderConvex B (S.capInteriorByIndex S.oppIndex1) := by
  letI : NeZero B.n := ⟨Nat.ne_of_gt hn⟩
  intro i j k hij hjk hi hk
  have hv1 : B.boundary iv = (S.triangleByIndex S.oppIndex1).v1 :=
    hv.trans (S.triangleByIndex_v1_eq_oppositeVertexByIndex S.oppIndex1).symm
  have hw2 : B.boundary iw = (S.triangleByIndex S.oppIndex1).v2 :=
    hw.trans S.triangleByIndex_oppIndex1_v2_eq_oppositeVertexByIndex_oppIndex2.symm
  have hu3 : B.boundary (zeroIndex hn) =
      (S.triangleByIndex S.oppIndex1).v3 :=
    hu.trans S.triangleByIndex_oppIndex1_v3_eq_oppositeVertexByIndex_surplusIdx.symm
  rcases hblocks with hdirect | hmirror
  · rcases hdirect.opp1_after (B.boundary i) hi with ⟨ii, hwii, hii⟩
    have hii' : ii = i := B.boundary_injective (hii.trans rfl)
    subst ii
    have hwj : iw < j := hwii.trans hij
    have hjcap : B.boundary j ∈ S.capByIndex S.oppIndex1 := by
      apply (S.capByIndex_reverse_complement_interval_of_global_indices
        S.oppIndex1 B.boundary_ccw B.boundary_injective B.boundary_image
        hdirect.apex_order.1 hdirect.apex_order.2 hv1 hw2 hu3
        (B.boundary j)).2
      exact ⟨j, Or.inr hwj.le, rfl⟩
    apply S.mem_capInteriorByIndex_of_mem_capByIndex_of_ne_outer
      S.oppIndex1 hjcap
    · rw [S.rightOuterVertexByIndex_oppIndex1_eq_oppositeVertexByIndex_oppIndex2,
        ← hw]
      intro h
      exact (ne_of_gt hwj) (B.boundary_injective h)
    · rw [S.leftOuterVertexByIndex_oppIndex1_eq_oppositeVertexByIndex_surplusIdx,
        ← hu]
      intro h
      have hjzero : j = zeroIndex hn := B.boundary_injective h
      subst j
      exact (Fin.not_lt_zero _ (hdirect.apex_order.1.trans
        (hdirect.apex_order.2.trans hwj))).elim
  · rcases hmirror.opp1_between (B.boundary i) hi with
      ⟨ii, hzoi, hiiw, hii⟩
    have hii' : ii = i := B.boundary_injective (hii.trans rfl)
    subst ii
    rcases hmirror.opp1_between (B.boundary k) hk with
      ⟨ik, hzok, hkiw, hik⟩
    have hik' : ik = k := B.boundary_injective (hik.trans rfl)
    subst ik
    have hzoj : zeroIndex hn < j := hzoi.trans hij
    have hjiw : j < iw := hjk.trans hkiw
    have hjcap : B.boundary j ∈ S.capByIndex S.oppIndex1 := by
      apply (S.capByIndex_reverse_interval_of_global_indices
        S.oppIndex1 B.boundary_ccw B.boundary_injective B.boundary_image
        hmirror.apex_order.1
        (Or.inr hmirror.apex_order.2) hv1 hw2 hu3 (B.boundary j)).2
      exact ⟨j, hzoj.le, hjiw.le, rfl⟩
    apply S.mem_capInteriorByIndex_of_mem_capByIndex_of_ne_outer
      S.oppIndex1 hjcap
    · rw [S.rightOuterVertexByIndex_oppIndex1_eq_oppositeVertexByIndex_oppIndex2,
        ← hw]
      intro h
      exact (ne_of_lt hjiw) (B.boundary_injective h)
    · rw [S.leftOuterVertexByIndex_oppIndex1_eq_oppositeVertexByIndex_surplusIdx,
        ← hu]
      intro h
      exact (ne_of_gt hzoj) (B.boundary_injective h)

set_option maxHeartbeats 1200000 in
-- Four oriented calls to the nonlinear convex-nesting kernel are elaborated.
/-- **Two-radius escape synchronization.**

The points `s,L` are the actual strict-interior choices and `sMinus,LMinus`
their actual escapees.  No transverse orientation is assumed.  The conclusion
is an orientation-coherent disjunction: either both actual inside points are
positive and the nesting packet is based on them, or both are negative and
the nesting packet is based on the two escapees. -/
theorem twoRadiusGrid_escape_synchronization
    {A : Finset ℝ²} (B : BoundaryIndexing A) (C : Finset ℝ²)
    {o a s sMinus L LMinus : ℝ²}
    {io ia is isMinus iL iLMinus : Fin B.n}
    (ho : B.boundary io = o) (ha : B.boundary ia = a)
    (hs : B.boundary is = s) (hsMinus : B.boundary isMinus = sMinus)
    (hL : B.boundary iL = L) (hLMinus : B.boundary iLMinus = LMinus)
    (hA : EuclideanGeometry.ConvexIndep (↑A : Set ℝ²))
    (hoa : o ≠ a) (hos : o ≠ s) (hosMinus : o ≠ sMinus)
    (hssMinus : s ≠ sMinus) (haL : a ≠ L) (haLMinus : a ≠ LMinus)
    (hLLMinus : L ≠ LMinus)
    (hsReflect :
      scaledLongitudinalCoord o a s =
          scaledLongitudinalCoord o a sMinus ∧
        scaledTransverseCoord o a s =
          -scaledTransverseCoord o a sMinus)
    (hLReflect :
      scaledLongitudinalCoord o a L =
          scaledLongitudinalCoord o a LMinus ∧
        scaledTransverseCoord o a L =
          -scaledTransverseCoord o a LMinus)
    (hsO : dist o s = dist o sMinus)
    (hsA : dist a s = dist a sMinus)
    (hLO : dist o L = dist o LMinus)
    (hLA : dist a L = dist a LMinus)
    (hRadius : dist o s < dist o L)
    (hCommonBlocker : dist a s = dist a L)
    (hBlock : BoundaryOrderConvex B C)
    (hsInside : s ∈ C) (hsMinusOutside : sMinus ∉ C)
    (hLInside : L ∈ C) (hLMinusOutside : LMinus ∉ C) :
    ((0 < scaledTransverseCoord o a s ∧
        0 < scaledTransverseCoord o a L) ∧
      PositiveScaledNesting o a s L) ∨
    ((scaledTransverseCoord o a s < 0 ∧
        scaledTransverseCoord o a L < 0) ∧
      PositiveScaledNesting o a sMinus LMinus) := by
  have hoA : o ∈ (↑A : Set ℝ²) := by simpa [← ho] using boundary_mem B io
  have haA : a ∈ (↑A : Set ℝ²) := by simpa [← ha] using boundary_mem B ia
  have hsA' : s ∈ (↑A : Set ℝ²) := by simpa [← hs] using boundary_mem B is
  have hsMinusA : sMinus ∈ (↑A : Set ℝ²) := by
    simpa [← hsMinus] using boundary_mem B isMinus
  have hLA' : L ∈ (↑A : Set ℝ²) := by simpa [← hL] using boundary_mem B iL
  have hLMinusA : LMinus ∈ (↑A : Set ℝ²) := by
    simpa [← hLMinus] using boundary_mem B iLMinus
  have hsL : s ≠ L := by
    intro h
    exact (ne_of_lt hRadius) (congrArg (dist o) h)
  have hsLMinus : s ≠ LMinus := by
    intro h
    have heq : dist o s = dist o L :=
      (congrArg (dist o) h).trans hLO.symm
    exact (ne_of_lt hRadius) heq
  have hsMinusL : sMinus ≠ L := by
    intro h
    have heq : dist o s = dist o L :=
      hsO.trans (congrArg (dist o) h)
    exact (ne_of_lt hRadius) heq
  have hsMinusLMinus : sMinus ≠ LMinus := by
    intro h
    have heq : dist o s = dist o L :=
      hsO.trans ((congrArg (dist o) h).trans hLO.symm)
    exact (ne_of_lt hRadius) heq
  have hRadiusSwap : dist o sMinus < dist o LMinus := by
    calc
      dist o sMinus = dist o s := hsO.symm
      _ < dist o L := hRadius
      _ = dist o LMinus := hLO
  have hCommonSwap : dist a sMinus = dist a LMinus := by
    calc
      dist a sMinus = dist a s := hsA.symm
      _ = dist a L := hCommonBlocker
      _ = dist a LMinus := hLA
  have hsReflectSwap :
      scaledLongitudinalCoord o a sMinus = scaledLongitudinalCoord o a s ∧
        scaledTransverseCoord o a sMinus =
          -scaledTransverseCoord o a s := by
    exact ⟨hsReflect.1.symm, by linarith [hsReflect.2]⟩
  have hLReflectSwap :
      scaledLongitudinalCoord o a LMinus = scaledLongitudinalCoord o a L ∧
        scaledTransverseCoord o a LMinus =
          -scaledTransverseCoord o a L := by
    exact ⟨hLReflect.1.symm, by linarith [hLReflect.2]⟩
  rcases le_total 0 (scaledTransverseCoord o a s) with hsNonneg | hsNonpos <;>
    rcases le_total 0 (scaledTransverseCoord o a L) with hLNonneg | hLNonpos
  · have hnest : PositiveScaledNesting o a s L :=
      twoRadiusGrid_scaled_convex_nesting hA hoA haA hsA' hsMinusA hLA'
        hLMinusA hoa hos hosMinus hssMinus haL haLMinus hLLMinus hsL
        hsLMinus hsReflect hLReflect hsNonneg hLNonneg hRadius
        hCommonBlocker
    left
    exact ⟨⟨hnest.2.1, lt_trans hnest.2.1 hnest.2.2.1⟩, hnest⟩
  · have hLMinusNonneg : 0 ≤ scaledTransverseCoord o a LMinus := by
      linarith [hLReflect.2]
    have hnest : PositiveScaledNesting o a s LMinus :=
      twoRadiusGrid_scaled_convex_nesting hA hoA haA hsA' hsMinusA
        hLMinusA hLA' hoa hos hosMinus hssMinus haLMinus haL hLLMinus.symm
        hsLMinus hsL hsReflect hLReflectSwap hsNonneg hLMinusNonneg
        (hRadius.trans_eq hLO) (hCommonBlocker.trans hLA)
    have hbetween := positiveRepresentatives_cyclicBetweenness B hs hsMinus
      hLMinus hL hoa hsReflect hLReflectSwap hnest
    rcases hbetween.1 with hbetween | hbetween
    · have hmidB : B.boundary iLMinus ∈ C :=
        hBlock hbetween.1 hbetween.2
          (by simpa only [hs] using hsInside)
          (by simpa only [hL] using hLInside)
      have hmid : LMinus ∈ C := by simpa only [hLMinus] using hmidB
      exact (hLMinusOutside hmid).elim
    · have hmidB : B.boundary isMinus ∈ C :=
        hBlock hbetween.1 hbetween.2
          (by simpa only [hL] using hLInside)
          (by simpa only [hs] using hsInside)
      have hmid : sMinus ∈ C := by simpa only [hsMinus] using hmidB
      exact (hsMinusOutside hmid).elim
  · have hsMinusNonneg : 0 ≤ scaledTransverseCoord o a sMinus := by
      linarith [hsReflect.2]
    have hnest : PositiveScaledNesting o a sMinus L :=
      twoRadiusGrid_scaled_convex_nesting hA hoA haA hsMinusA hsA' hLA'
        hLMinusA hoa hosMinus hos hssMinus.symm haL haLMinus hLLMinus
        hsMinusL hsMinusLMinus hsReflectSwap hLReflect hsMinusNonneg
        hLNonneg
        (by calc
          dist o sMinus = dist o s := hsO.symm
          _ < dist o L := hRadius)
        (hsA.symm.trans hCommonBlocker)
    have hbetween := positiveRepresentatives_cyclicBetweenness B hsMinus hs
      hL hLMinus hoa hsReflectSwap hLReflect hnest
    rcases hbetween.2 with hbetween | hbetween
    · have hmidB : B.boundary iLMinus ∈ C :=
        hBlock hbetween.1 hbetween.2
          (by simpa only [hL] using hLInside)
          (by simpa only [hs] using hsInside)
      have hmid : LMinus ∈ C := by simpa only [hLMinus] using hmidB
      exact (hLMinusOutside hmid).elim
    · have hmidB : B.boundary isMinus ∈ C :=
        hBlock hbetween.1 hbetween.2
          (by simpa only [hs] using hsInside)
          (by simpa only [hL] using hLInside)
      have hmid : sMinus ∈ C := by simpa only [hsMinus] using hmidB
      exact (hsMinusOutside hmid).elim
  · have hsMinusNonneg : 0 ≤ scaledTransverseCoord o a sMinus := by
      linarith [hsReflect.2]
    have hLMinusNonneg : 0 ≤ scaledTransverseCoord o a LMinus := by
      linarith [hLReflect.2]
    have hnest : PositiveScaledNesting o a sMinus LMinus :=
      twoRadiusGrid_scaled_convex_nesting hA hoA haA hsMinusA hsA'
        hLMinusA hLA' hoa hosMinus hos hssMinus.symm haLMinus haL
        hLLMinus.symm hsMinusLMinus hsMinusL hsReflectSwap hLReflectSwap
        hsMinusNonneg hLMinusNonneg hRadiusSwap hCommonSwap
    right
    have hsNeg : scaledTransverseCoord o a s < 0 := by
      linarith [hsReflect.2, hnest.2.1]
    have hLNeg : scaledTransverseCoord o a L < 0 := by
      have hLMinusPos : 0 < scaledTransverseCoord o a LMinus :=
        lt_trans hnest.2.1 hnest.2.2.1
      linarith [hLReflect.2]
    exact ⟨⟨hsNeg, hLNeg⟩, hnest⟩

end ATailTwoRadiusGridEscapeSynchronization
end Problem97
