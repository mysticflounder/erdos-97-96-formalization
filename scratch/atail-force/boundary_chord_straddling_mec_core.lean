/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import Erdos9796Proof.P97.Census554.MECStraddlingRowCore

/-!
# Boundary-chord one-center MEC straddling obstruction

Two points in a closed disk lie on the circle centered at one endpoint of a
boundary chord, with radius equal to that chord.  They cannot lie strictly on
opposite oriented sides of the boundary chord.

This is a scratch-only kernel exposed by the reduced round-2 ATAIL producer
core.  It uses fewer hypotheses than `MECStraddlingRowCore`: there is no third
boundary point, nonobtuse hypothesis, or second circle center.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailForce
namespace BoundaryChordStraddlingMECCore

open Census554.EqualityCore

/-- A boundary-endpoint circle cannot have in-disk points strictly on both
sides of the boundary chord. -/
theorem metric_orientation_incompatibility
    {a b x y center : ℝ²}
    (hab : a ≠ b)
    (hboundary : dist a center = dist b center)
    (hxDisk : dist x center ≤ dist a center)
    (hyDisk : dist y center ≤ dist a center)
    (hbx : dist b x = dist b a)
    (hby : dist b y = dist b a)
    (haxb : 0 < signedArea2 a x b)
    (hbya : 0 < signedArea2 b y a) : False := by
  let T := normSim a b
  let u := T x 0
  let v := T x 1
  let w := T y 0
  let z := T y 1
  let t := T center 1
  have hxUnitRaw := normSim_sqdist_from_snd_eq_of_dist_eq hab hbx
  rw [normSim_fst] at hxUnitRaw
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one, zero_sub,
    neg_sq, one_pow] at hxUnitRaw
  have hxUnit : (u - 1) ^ 2 + v ^ 2 = 1 := by
    simpa [T, u, v] using hxUnitRaw
  have hyUnitRaw := normSim_sqdist_from_snd_eq_of_dist_eq hab hby
  rw [normSim_fst] at hyUnitRaw
  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one, zero_sub,
    neg_sq, one_pow] at hyUnitRaw
  have hyUnit : (w - 1) ^ 2 + z ^ 2 = 1 := by
    simpa [T, w, z] using hyUnitRaw
  have hxDiskRaw := normSim_mec_disk_normalized hab hboundary hxDisk
  have hxDisk' : (u - 1 / 2) ^ 2 + (v - t) ^ 2 ≤ 1 / 4 + t ^ 2 := by
    simpa [T, u, v, t] using hxDiskRaw
  have hyDiskRaw := normSim_mec_disk_normalized hab hboundary hyDisk
  have hyDisk' : (w - 1 / 2) ^ 2 + (z - t) ^ 2 ≤ 1 / 4 + t ^ 2 := by
    simpa [T, w, z, t] using hyDiskRaw
  have habx : signedArea2 a b x < 0 := by
    have hswap : signedArea2 a b x = -signedArea2 a x b := by
      simp only [signedArea2]
      ring
    rw [hswap]
    exact neg_neg_of_pos haxb
  have haby : 0 < signedArea2 a b y := by
    have hrotate : signedArea2 a b y = signedArea2 b y a := by
      simp only [signedArea2]
      ring
    rwa [hrotate]
  have hv : v < 0 := by
    simpa [T, v] using normSim_snd_neg_of_signedArea2_neg hab habx
  have hz : 0 < z := by
    simpa [T, z] using normSim_snd_pos_of_signedArea2_pos hab haby
  have huPos : 0 < u := by
    nlinarith only [hxUnit, sq_pos_of_neg hv]
  have hwPos : 0 < w := by
    nlinarith only [hyUnit, sq_pos_of_pos hz]
  have htNeg : t < 0 := by
    nlinarith only [hxUnit, hxDisk', huPos, hv]
  have htPos : 0 < t := by
    nlinarith only [hyUnit, hyDisk', hwPos, hz]
  exact (not_lt_of_ge htPos.le) htNeg

/-- Reflected orientation form. -/
theorem metric_orientation_incompatibility_of_neg
    {a b x y center : ℝ²}
    (hab : a ≠ b)
    (hboundary : dist a center = dist b center)
    (hxDisk : dist x center ≤ dist a center)
    (hyDisk : dist y center ≤ dist a center)
    (hbx : dist b x = dist b a)
    (hby : dist b y = dist b a)
    (haxb : signedArea2 a x b < 0)
    (hbya : signedArea2 b y a < 0) : False := by
  apply metric_orientation_incompatibility
      (a := reflectXAxis a) (b := reflectXAxis b)
      (x := reflectXAxis x) (y := reflectXAxis y)
      (center := reflectXAxis center)
  · exact fun h => hab (reflectXAxis_injective h)
  · simpa only [dist_reflectXAxis] using hboundary
  · simpa only [dist_reflectXAxis] using hxDisk
  · simpa only [dist_reflectXAxis] using hyDisk
  · simpa only [dist_reflectXAxis] using hbx
  · simpa only [dist_reflectXAxis] using hby
  · rw [signedArea2_reflectXAxis]
    linarith
  · rw [signedArea2_reflectXAxis]
    linarith

#print axioms metric_orientation_incompatibility
#print axioms metric_orientation_incompatibility_of_neg

end BoundaryChordStraddlingMECCore
end ATailForce
end Problem97
