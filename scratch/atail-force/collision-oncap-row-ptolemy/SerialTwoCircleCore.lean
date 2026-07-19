/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.Census554.EqualityCore
import Erdos9796Proof.P97.Census554.GeneralCarrierBridge
import Erdos9796Proof.P97.Q3SharedInterior
import Erdos9796Proof.P97.SurplusCOMPGBankSep

/-!
# Serial two-circle convex-order core

Two distinct centers `A,B` share two circle points `s2,y`.  A further point
`s1` lies on the `A`-circle and a further point `f` lies on the `B`-circle.
The cyclic order `s1,A,s2,B,f,y` is impossible.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailCollisionOnCapRowPtolemyScratch

open Census554.GeneralCarrierBridge

private theorem normalized_serial_twoCircle_incompatible
    {t h u v w z : ℝ}
    (ht : 0 < t)
    (ht1 : t < 1)
    (hfirstCircle : u ^ 2 + v ^ 2 = t ^ 2 + h ^ 2)
    (hsecondCircle : (w - 1) ^ 2 + z ^ 2 = (t - 1) ^ 2 + h ^ 2)
    (hs1As2 : -h * u + t * v < 0)
    (hs1Ay : h * u + t * v < 0)
    (hs2Bf : h * w - h - t * z + z < 0)
    (hBfy : -h * w + h - t * z + z < 0)
    (hs1fy : h * u - h * w + t * v - t * z + u * z - v * w < 0) :
    False := by
  have hvNeg : v < 0 := by
    nlinarith only [hs1As2, hs1Ay, ht]
  have hfirstProduct :
      0 < (t * v - h * u) * (t * v + h * u) :=
    mul_pos_of_neg_of_neg (by nlinarith only [hs1As2])
      (by nlinarith only [hs1Ay])
  have hfirstSq : (h * u) ^ 2 < (t * v) ^ 2 := by
    nlinarith only [hfirstProduct]
  have hvSq : h ^ 2 < v ^ 2 := by
    nlinarith only [hfirstCircle, hfirstSq]
  have huSq : u ^ 2 < t ^ 2 := by
    nlinarith only [hfirstCircle, hvSq]
  have hvBelow : v < -h := by
    nlinarith only [hvNeg, hvSq, sq_nonneg (v + h)]
  have huLeft : u < t := by
    nlinarith only [ht, huSq, sq_nonneg (u + t)]
  have hcPos : 0 < 1 - t := sub_pos.mpr ht1
  have hzNeg : z < 0 := by
    nlinarith only [hs2Bf, hBfy, hcPos]
  have hsecondLeft : (1 - t) * z - h * (w - 1) < 0 := by
    calc
      (1 - t) * z - h * (w - 1) =
          -h * w + h - t * z + z := by ring
      _ < 0 := hBfy
  have hsecondRight : (1 - t) * z + h * (w - 1) < 0 := by
    calc
      (1 - t) * z + h * (w - 1) =
          h * w - h - t * z + z := by ring
      _ < 0 := hs2Bf
  have hsecondProduct :
      0 < ((1 - t) * z - h * (w - 1)) *
        ((1 - t) * z + h * (w - 1)) :=
    mul_pos_of_neg_of_neg hsecondLeft hsecondRight
  have hsecondSq : (h * (w - 1)) ^ 2 < ((1 - t) * z) ^ 2 := by
    nlinarith only [hsecondProduct]
  have hzSq : h ^ 2 < z ^ 2 := by
    nlinarith only [hsecondCircle, hsecondSq]
  have hwSq : (w - 1) ^ 2 < (1 - t) ^ 2 := by
    nlinarith only [hsecondCircle, hzSq]
  have hzBelow : z < -h := by
    nlinarith only [hzNeg, hzSq, sq_nonneg (z + h)]
  have hwRight : t < w := by
    nlinarith only [hcPos, hwSq, sq_nonneg ((w - 1) + (1 - t))]
  have hleft : 0 < (w - t) * (-h - v) :=
    mul_pos (sub_pos.mpr hwRight) (by linarith)
  have hright : 0 < (t - u) * (-h - z) :=
    mul_pos (sub_pos.mpr huLeft) (by linarith)
  have hterminal :
      0 < h * u - h * w + t * v - t * z + u * z - v * w := by
    nlinarith only [hleft, hright]
  linarith

private theorem normSim_signedArea_neg
    {A B p q r : ℝ²} (hAB : A ≠ B)
    (h : signedArea2 p q r < 0) :
    signedArea2 (normSim A B p) (normSim A B q) (normSim A B r) < 0 := by
  rw [signedArea2_normSim A B hAB]
  apply mul_neg_of_pos_of_neg _ h
  apply inv_pos.mpr
  rw [← SurplusCOMPGBank.dist_sq_coord B A]
  exact sq_pos_of_pos (dist_pos.mpr hAB.symm)

/-- Two centered circles sharing `s2,y` cannot have the strict cyclic order
`s1,A,s2,B,f,y`, even before the fourth point on either critical row is used. -/
theorem serial_twoCircle_order_incompatible
    {s1 A s2 B f y : ℝ²}
    (hAB : A ≠ B)
    (hA_s1_s2 : dist A s1 = dist A s2)
    (hA_s1_y : dist A s1 = dist A y)
    (hB_s2_f : dist B s2 = dist B f)
    (hB_s2_y : dist B s2 = dist B y)
    (hs1As2 : signedArea2 s1 A s2 < 0)
    (hs1Ay : signedArea2 s1 A y < 0)
    (hAs2B : signedArea2 A s2 B < 0)
    (hABy : signedArea2 A B y < 0)
    (hAs2y : signedArea2 A s2 y < 0)
    (hs2By : signedArea2 s2 B y < 0)
    (hs2Bf : signedArea2 s2 B f < 0)
    (hBfy : signedArea2 B f y < 0)
    (hs1fy : signedArea2 s1 f y < 0) : False := by
  let T := normSim A B
  let t := T s2 0
  let h := T s2 1
  let u := T s1 0
  let v := T s1 1
  let w := T f 0
  let z := T f 1
  let ty := T y 0
  let hy := T y 1
  have hTA : T A = pt 0 0 := by
    simpa [T] using normSim_fst A B
  have hTB : T B = pt 1 0 := by
    simpa [T] using normSim_snd A B hAB
  have map_dist_eq {P Q R S : ℝ²} (heq : dist P Q = dist R S) :
      dist (T P) (T Q) = dist (T R) (T S) := by
    simp only [T, normSim_dist_image A B hAB]
    rw [heq]
  have dist_sq_eq {P Q R S : ℝ²}
      (heq : dist P Q = dist R S) :
      dist (T P) (T Q) ^ 2 = dist (T R) (T S) ^ 2 :=
    congrArg (fun d : ℝ => d ^ 2) (map_dist_eq heq)
  have hfirstCircleRaw := dist_sq_eq hA_s1_s2
  rw [SurplusCOMPGBank.dist_sq_coord,
    SurplusCOMPGBank.dist_sq_coord, hTA] at hfirstCircleRaw
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one, zero_sub,
    neg_sq] at hfirstCircleRaw
  have hfirstCircle : u ^ 2 + v ^ 2 = t ^ 2 + h ^ 2 := by
    simpa [u, v, t, h] using hfirstCircleRaw
  have hsecondCircleRaw := dist_sq_eq hB_s2_f
  rw [SurplusCOMPGBank.dist_sq_coord,
    SurplusCOMPGBank.dist_sq_coord, hTB] at hsecondCircleRaw
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one, zero_sub,
    neg_sq] at hsecondCircleRaw
  have hsecondCircle : (t - 1) ^ 2 + h ^ 2 = (w - 1) ^ 2 + z ^ 2 := by
    dsimp [t, h, w, z]
    nlinarith only [hsecondCircleRaw]
  have hsharedA := dist_sq_eq (hA_s1_s2.symm.trans hA_s1_y)
  rw [SurplusCOMPGBank.dist_sq_coord,
    SurplusCOMPGBank.dist_sq_coord, hTA] at hsharedA
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one, zero_sub,
    neg_sq] at hsharedA
  have hsharedAScalar : t ^ 2 + h ^ 2 = ty ^ 2 + hy ^ 2 := by
    simpa [t, h, ty, hy] using hsharedA
  have hsharedB := dist_sq_eq hB_s2_y
  rw [SurplusCOMPGBank.dist_sq_coord,
    SurplusCOMPGBank.dist_sq_coord, hTB] at hsharedB
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one, zero_sub,
    neg_sq] at hsharedB
  have hsharedBScalar : (t - 1) ^ 2 + h ^ 2 = (ty - 1) ^ 2 + hy ^ 2 := by
    dsimp [t, h, ty, hy]
    nlinarith only [hsharedB]
  have hty : ty = t := by
    nlinarith only [hsharedAScalar, hsharedBScalar]
  have hhySq : hy ^ 2 = h ^ 2 := by
    rw [hty] at hsharedAScalar
    nlinarith only [hsharedAScalar]
  have hAs2B' := normSim_signedArea_neg hAB hAs2B
  change signedArea2 (T A) (T s2) (T B) < 0 at hAs2B'
  rw [hTA, hTB] at hAs2B'
  simp only [signedArea2, pt, Matrix.cons_val_zero,
    Matrix.cons_val_one, sub_zero, one_mul] at hAs2B'
  have hh : 0 < h := by
    dsimp [h]
    linarith only [hAs2B']
  have hABy' := normSim_signedArea_neg hAB hABy
  change signedArea2 (T A) (T B) (T y) < 0 at hABy'
  rw [hTA, hTB] at hABy'
  simp only [signedArea2, pt, Matrix.cons_val_zero,
    Matrix.cons_val_one, sub_zero, one_mul] at hABy'
  have hhyNeg : hy < 0 := by
    simpa [hy] using hABy'
  have hhy : hy = -h := by
    nlinarith only [hhySq, hh, hhyNeg]
  have hAs2y' := normSim_signedArea_neg hAB hAs2y
  change signedArea2 (T A) (T s2) (T y) < 0 at hAs2y'
  rw [hTA] at hAs2y'
  simp only [signedArea2, pt, Matrix.cons_val_zero,
    Matrix.cons_val_one, sub_zero] at hAs2y'
  have ht : 0 < t := by
    dsimp [t, h, ty, hy] at hty hhy hAs2y' hh
    rw [hty, hhy] at hAs2y'
    nlinarith only [hAs2y', hh]
  have hs2By' := normSim_signedArea_neg hAB hs2By
  change signedArea2 (T s2) (T B) (T y) < 0 at hs2By'
  rw [hTB] at hs2By'
  simp only [signedArea2, pt, Matrix.cons_val_zero,
    Matrix.cons_val_one] at hs2By'
  have ht1 : t < 1 := by
    dsimp [t, h, ty, hy] at hty hhy hs2By' hh
    rw [hty, hhy] at hs2By'
    nlinarith only [hs2By', hh]
  have hs1As2' := normSim_signedArea_neg hAB hs1As2
  have hs1Ay' := normSim_signedArea_neg hAB hs1Ay
  have hs2Bf' := normSim_signedArea_neg hAB hs2Bf
  have hBfy' := normSim_signedArea_neg hAB hBfy
  have hs1fy' := normSim_signedArea_neg hAB hs1fy
  change signedArea2 (T s1) (T A) (T s2) < 0 at hs1As2'
  change signedArea2 (T s1) (T A) (T y) < 0 at hs1Ay'
  change signedArea2 (T s2) (T B) (T f) < 0 at hs2Bf'
  change signedArea2 (T B) (T f) (T y) < 0 at hBfy'
  change signedArea2 (T s1) (T f) (T y) < 0 at hs1fy'
  rw [hTA] at hs1As2' hs1Ay'
  rw [hTB] at hs2Bf' hBfy'
  simp only [signedArea2, pt, Matrix.cons_val_zero,
    Matrix.cons_val_one, sub_zero] at hs1As2' hs1Ay' hs2Bf' hBfy' hs1fy'
  have hs1As2Scalar : -h * u + t * v < 0 := by
    dsimp [t, h, u, v]
    nlinarith only [hs1As2']
  have hs1AyScalar : h * u + t * v < 0 := by
    dsimp [t, h, u, v, ty, hy] at hty hhy hs1Ay' ⊢
    rw [hty, hhy] at hs1Ay'
    nlinarith only [hs1Ay']
  have hs2BfScalar : h * w - h - t * z + z < 0 := by
    dsimp [t, h, w, z]
    nlinarith only [hs2Bf']
  have hBfyScalar : -h * w + h - t * z + z < 0 := by
    dsimp [t, h, w, z, ty, hy] at hty hhy hBfy' ⊢
    rw [hty, hhy] at hBfy'
    nlinarith only [hBfy']
  have hs1fyScalar :
      h * u - h * w + t * v - t * z + u * z - v * w < 0 := by
    dsimp [t, h, u, v, w, z, ty, hy] at hty hhy hs1fy' ⊢
    rw [hty, hhy] at hs1fy'
    nlinarith only [hs1fy']
  exact normalized_serial_twoCircle_incompatible ht ht1 hfirstCircle
    hsecondCircle.symm hs1As2Scalar hs1AyScalar hs2BfScalar hBfyScalar
    hs1fyScalar

private theorem signedArea2_swap12 (a b c : ℝ²) :
    signedArea2 a b c = -signedArea2 b a c := by
  simp only [signedArea2]
  ring

private theorem signedArea2_neg_of_lt
    {n : ℕ} {boundary : Fin n → ℝ²}
    (hccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    (hinj : Function.Injective boundary)
    {i j k : Fin n} (hij : i < j) (hjk : j < k) :
    signedArea2 (boundary i) (boundary j) (boundary k) < 0 := by
  have hpos := signedArea2_pos_of_between hccw hinj hij hjk
  rw [signedArea2_swap12 (boundary i) (boundary j) (boundary k)]
  linarith

/-- Boundary-facing form: the two circle rows are incompatible with any six
strictly increasing boundary indices in the serial role order. -/
theorem false_of_ccw_serial_twoCircle
    {n : ℕ} {boundary : Fin n → ℝ²}
    (hccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    (hinj : Function.Injective boundary)
    {is1 iA is2 iB iF iy : Fin n}
    (hs1A : is1 < iA)
    (hAs2 : iA < is2)
    (hs2B : is2 < iB)
    (hBF : iB < iF)
    (hFy : iF < iy)
    (hA_s1_s2 : dist (boundary iA) (boundary is1) =
      dist (boundary iA) (boundary is2))
    (hA_s1_y : dist (boundary iA) (boundary is1) =
      dist (boundary iA) (boundary iy))
    (hB_s2_f : dist (boundary iB) (boundary is2) =
      dist (boundary iB) (boundary iF))
    (hB_s2_y : dist (boundary iB) (boundary is2) =
      dist (boundary iB) (boundary iy)) : False := by
  have hs1s2 : is1 < is2 := hs1A.trans hAs2
  have hs1B : is1 < iB := hs1s2.trans hs2B
  have hs1F : is1 < iF := hs1B.trans hBF
  have hAy : iA < iy := hAs2.trans (hs2B.trans (hBF.trans hFy))
  have hs2F : is2 < iF := hs2B.trans hBF
  have hs2y : is2 < iy := hs2F.trans hFy
  have hBy : iB < iy := hBF.trans hFy
  exact serial_twoCircle_order_incompatible
    (hinj.ne (hAs2.trans hs2B).ne)
    hA_s1_s2 hA_s1_y hB_s2_f hB_s2_y
    (signedArea2_neg_of_lt hccw hinj hs1A hAs2)
    (signedArea2_neg_of_lt hccw hinj hs1A hAy)
    (signedArea2_neg_of_lt hccw hinj hAs2 hs2B)
    (signedArea2_neg_of_lt hccw hinj (hAs2.trans hs2B) hBy)
    (signedArea2_neg_of_lt hccw hinj hAs2 hs2y)
    (signedArea2_neg_of_lt hccw hinj hs2B hBy)
    (signedArea2_neg_of_lt hccw hinj hs2B hBF)
    (signedArea2_neg_of_lt hccw hinj hBF hFy)
    (signedArea2_neg_of_lt hccw hinj hs1F hFy)

/-- Critical-row adapter for the serial residual. If two actual blocker rows
share `sharedCap,sharedOutside` and their sources, blockers, and common points
occur in the serial boundary order, the carrier is contradictory. -/
theorem false_of_serial_criticalRows
    {carrier : Finset ℝ²}
    (H : CriticalShellSystem carrier)
    (boundary : BoundaryIndexing carrier)
    (aSource bSource sharedCap sharedOutside : CarrierLabel carrier)
    (hsharedCapA : sharedCap.1 ∈
      (H.selectedAt aSource.1 aSource.2).toCriticalFourShell.support)
    (hsharedOutsideA : sharedOutside.1 ∈
      (H.selectedAt aSource.1 aSource.2).toCriticalFourShell.support)
    (hsharedCapB : sharedCap.1 ∈
      (H.selectedAt bSource.1 bSource.2).toCriticalFourShell.support)
    (hsharedOutsideB : sharedOutside.1 ∈
      (H.selectedAt bSource.1 bSource.2).toCriticalFourShell.support)
    (hsourceABlocker : boundary.indexOf aSource <
      boundary.indexOf (blockerLabel H aSource.1 aSource.2))
    (hblockerASharedCap :
      boundary.indexOf (blockerLabel H aSource.1 aSource.2) <
        boundary.indexOf sharedCap)
    (hsharedCapBlockerB : boundary.indexOf sharedCap <
      boundary.indexOf (blockerLabel H bSource.1 bSource.2))
    (hblockerBSource :
      boundary.indexOf (blockerLabel H bSource.1 bSource.2) <
        boundary.indexOf bSource)
    (hsourceBSharedOutside :
      boundary.indexOf bSource < boundary.indexOf sharedOutside) : False := by
  have hA_s1_s2 :
      dist (H.centerAt aSource.1 aSource.2) aSource.1 =
        dist (H.centerAt aSource.1 aSource.2) sharedCap.1 :=
    (H.selectedAt aSource.1 aSource.2).toCriticalFourShell.support_eq_radius
      aSource.1
      (H.selectedAt aSource.1 aSource.2).toCriticalFourShell.q_mem_support
    |>.trans
      ((H.selectedAt aSource.1
        aSource.2).toCriticalFourShell.support_eq_radius
          sharedCap.1 hsharedCapA).symm
  have hA_s1_y :
      dist (H.centerAt aSource.1 aSource.2) aSource.1 =
        dist (H.centerAt aSource.1 aSource.2) sharedOutside.1 :=
    (H.selectedAt aSource.1 aSource.2).toCriticalFourShell.support_eq_radius
      aSource.1
      (H.selectedAt aSource.1 aSource.2).toCriticalFourShell.q_mem_support
    |>.trans
      ((H.selectedAt aSource.1
        aSource.2).toCriticalFourShell.support_eq_radius
          sharedOutside.1 hsharedOutsideA).symm
  have hB_s2_f :
      dist (H.centerAt bSource.1 bSource.2) sharedCap.1 =
        dist (H.centerAt bSource.1 bSource.2) bSource.1 :=
    (H.selectedAt bSource.1 bSource.2).toCriticalFourShell.support_eq_radius
      sharedCap.1 hsharedCapB
    |>.trans
      ((H.selectedAt bSource.1
        bSource.2).toCriticalFourShell.support_eq_radius
          bSource.1
          (H.selectedAt bSource.1
            bSource.2).toCriticalFourShell.q_mem_support).symm
  have hB_s2_y :
      dist (H.centerAt bSource.1 bSource.2) sharedCap.1 =
        dist (H.centerAt bSource.1 bSource.2) sharedOutside.1 :=
    (H.selectedAt bSource.1 bSource.2).toCriticalFourShell.support_eq_radius
      sharedCap.1 hsharedCapB
    |>.trans
      ((H.selectedAt bSource.1
        bSource.2).toCriticalFourShell.support_eq_radius
          sharedOutside.1 hsharedOutsideB).symm
  apply false_of_ccw_serial_twoCircle boundary.boundary_ccw
    boundary.boundary_injective hsourceABlocker hblockerASharedCap
      hsharedCapBlockerB hblockerBSource hsourceBSharedOutside
  · simp only [boundary.point_eq]
    simpa [pointOf, blockerLabel] using hA_s1_s2
  · simp only [boundary.point_eq]
    simpa [pointOf, blockerLabel] using hA_s1_y
  · simp only [boundary.point_eq]
    simpa [pointOf, blockerLabel] using hB_s2_f
  · simp only [boundary.point_eq]
    simpa [pointOf, blockerLabel] using hB_s2_y

#print axioms normalized_serial_twoCircle_incompatible
#print axioms serial_twoCircle_order_incompatible
#print axioms false_of_ccw_serial_twoCircle
#print axioms false_of_serial_criticalRows

end ATailCollisionOnCapRowPtolemyScratch
end Problem97
