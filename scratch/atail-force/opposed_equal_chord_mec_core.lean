/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import Erdos9796Proof.P97.Census554.MECStraddlingRowCore

/-!
# Opposed equal-chord MEC obstruction

This is the gauge-free kernel exposed by the card-11 producer probe.  Two
points `a,b` lie on a common disk boundary.  A point `c` in the disk is one
base-chord length from `a`, while a point `d` in the disk is one base-chord
length from `b`.  They cannot occur strictly on the opposed oriented sides
encoded by `a,c,b` and `b,d,a`.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailForce
namespace OpposedEqualChordMECCore

open Census554.EqualityCore

/-- Opposed radius-length chords based at the endpoints of a boundary chord
cannot both point into the same closed disk. -/
theorem metric_orientation_incompatibility
    {a b c d center : ℝ²}
    (hab : a ≠ b)
    (hboundary : dist a center = dist b center)
    (hcDisk : dist c center ≤ dist a center)
    (hdDisk : dist d center ≤ dist a center)
    (hac : dist a c = dist a b)
    (hbd : dist b d = dist b a)
    (hacb : 0 < signedArea2 a c b)
    (hbda : 0 < signedArea2 b d a) : False := by
  let T := normSim a b
  let x := T c 0
  let y := T c 1
  let u := T d 0
  let v := T d 1
  let t := T center 1
  have hCunitRaw := normSim_sqdist_from_fst_eq_of_dist_eq hab hac
  rw [normSim_snd a b hab] at hCunitRaw
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one, one_pow] at hCunitRaw
  have hCunit : x ^ 2 + y ^ 2 = 1 := by
    simpa [T, x, y] using hCunitRaw
  have hDunitRaw := normSim_sqdist_from_snd_eq_of_dist_eq hab hbd
  rw [normSim_fst] at hDunitRaw
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one, zero_sub,
    neg_sq, one_pow] at hDunitRaw
  have hDunit : (u - 1) ^ 2 + v ^ 2 = 1 := by
    simpa [T, u, v] using hDunitRaw
  have hCDiskRaw := normSim_mec_disk_normalized hab hboundary hcDisk
  have hCDisk : (x - 1 / 2) ^ 2 + (y - t) ^ 2 ≤ 1 / 4 + t ^ 2 := by
    simpa [T, x, y, t] using hCDiskRaw
  have hDDiskRaw := normSim_mec_disk_normalized hab hboundary hdDisk
  have hDDisk : (u - 1 / 2) ^ 2 + (v - t) ^ 2 ≤ 1 / 4 + t ^ 2 := by
    simpa [T, u, v, t] using hDDiskRaw
  have habc : signedArea2 a b c < 0 := by
    have hswap : signedArea2 a b c = -signedArea2 a c b := by
      simp only [signedArea2]
      ring
    rw [hswap]
    exact neg_neg_of_pos hacb
  have habd : 0 < signedArea2 a b d := by
    have hrotate : signedArea2 a b d = signedArea2 b d a := by
      simp only [signedArea2]
      ring
    rwa [hrotate]
  have hy : y < 0 := by
    simpa [T, y] using normSim_snd_neg_of_signedArea2_neg hab habc
  have hv : 0 < v := by
    simpa [T, v] using normSim_snd_pos_of_signedArea2_pos hab habd
  have hxLt : x < 1 := by
    nlinarith only [hCunit, sq_pos_of_neg hy]
  have huPos : 0 < u := by
    nlinarith only [hDunit, sq_pos_of_pos hv]
  have htNeg : t < 0 := by
    nlinarith only [hCunit, hCDisk, hxLt, hy]
  have htPos : 0 < t := by
    nlinarith only [hDunit, hDDisk, huPos, hv]
  exact (not_lt_of_ge htPos.le) htNeg

/-- Negative-orientation form, obtained by reflection across the first axis. -/
theorem metric_orientation_incompatibility_of_neg
    {a b c d center : ℝ²}
    (hab : a ≠ b)
    (hboundary : dist a center = dist b center)
    (hcDisk : dist c center ≤ dist a center)
    (hdDisk : dist d center ≤ dist a center)
    (hac : dist a c = dist a b)
    (hbd : dist b d = dist b a)
    (hacb : signedArea2 a c b < 0)
    (hbda : signedArea2 b d a < 0) : False := by
  apply metric_orientation_incompatibility
      (a := reflectXAxis a) (b := reflectXAxis b)
      (c := reflectXAxis c) (d := reflectXAxis d)
      (center := reflectXAxis center)
  · exact fun h => hab (reflectXAxis_injective h)
  · simpa only [dist_reflectXAxis] using hboundary
  · simpa only [dist_reflectXAxis] using hcDisk
  · simpa only [dist_reflectXAxis] using hdDisk
  · simpa only [dist_reflectXAxis] using hac
  · simpa only [dist_reflectXAxis] using hbd
  · rw [signedArea2_reflectXAxis]
    linarith
  · rw [signedArea2_reflectXAxis]
    linarith

#print axioms metric_orientation_incompatibility
#print axioms metric_orientation_incompatibility_of_neg

end OpposedEqualChordMECCore
end ATailForce
end Problem97
