import Mathlib

/-!
# Scalar cores for the exact-five strict-cap radius drop

Unelaborated draft, 2026-09-05. These are algebraic lemmas, not a source adapter
and not a proof of the physical exact-five terminal. No proof hole is intended.
-/

namespace Problem97.ExactFiveCapRadiusDropScalar

def sqDist (x y z t : ℝ) : ℝ := (x-z)^2 + (y-t)^2

def dotAt (x y z t c h : ℝ) : ℝ := (x-c)*(z-c)+(y-h)*(t-h)

/-- Polarization in coordinates. -/
theorem chord_sq_identity (x y z t c h : ℝ) :
    sqDist x y z t = sqDist c h x y + sqDist c h z t -
      2 * dotAt x y z t c h := by
  unfold sqDist dotAt
  ring

/-- A division-free positive decomposition for the opposite-apex dot product. -/
theorem apex_dot_identity (u v x y z t : ℝ) :
    2 * dotAt x y z t u (-v) =
      (1-u)*(1+x)*(1+z) + (1+u)*(1-x)*(1-z) +
      2*(u^2+v^2-1) + 2*v*(y+t) + 2*y*t := by
  unfold dotAt
  ring

/-- In the chord-normalized nonobtuse triangle with endpoints (-1,0),(1,0)
and opposite vertex (u,-v), strict upper-cap points see a positive apex dot. -/
theorem apex_dot_pos
    {u v x y z t : ℝ}
    (huL : -1 ≤ u) (huR : u ≤ 1) (hv : 0 < v)
    (hangle : 1 ≤ u^2+v^2)
    (hxL : -1 ≤ x) (hxR : x ≤ 1)
    (hzL : -1 ≤ z) (hzR : z ≤ 1)
    (hy : 0 < y) (ht : 0 < t) :
    0 < dotAt x y z t u (-v) := by
  have hleft : 0 ≤ (1-u)*(1+x)*(1+z) :=
    mul_nonneg
      (mul_nonneg (by linarith only [huR]) (by linarith only [hxL]))
      (by linarith only [hzL])
  have hright : 0 ≤ (1+u)*(1-x)*(1-z) :=
    mul_nonneg
      (mul_nonneg (by linarith only [huL]) (by linarith only [hxR]))
      (by linarith only [hzR])
  have hgap : 0 ≤ u^2+v^2-1 := by linarith only [hangle]
  have hvertical : 0 < v*(y+t) := mul_pos hv (add_pos hy ht)
  have hyt : 0 ≤ y*t := le_of_lt (mul_pos hy ht)
  have hid := apex_dot_identity u v x y z t
  nlinarith only [hid, hleft, hright, hgap, hvertical, hyt]

/-- Two equal-radius pairs with an acute outer apex and a nonacute inner apex
have strictly decreasing radii. -/
theorem paired_radius_lt_of_dots
    {ox oy cx cy qx qy wx wy r s : ℝ}
    (hr : 0 ≤ r) (hs : 0 ≤ s)
    (hOq : sqDist ox oy qx qy = r^2)
    (hOw : sqDist ox oy wx wy = r^2)
    (hcq : sqDist cx cy qx qy = s^2)
    (hcw : sqDist cx cy wx wy = s^2)
    (hacute : 0 < dotAt qx qy wx wy ox oy)
    (hnonacute : dotAt qx qy wx wy cx cy ≤ 0) :
    s < r := by
  have houter := chord_sq_identity qx qy wx wy ox oy
  have hinner := chord_sq_identity qx qy wx wy cx cy
  have hsq : s^2 < r^2 := by
    nlinarith only [houter, hinner, hOq, hOw, hcq, hcw, hacute, hnonacute]
  by_contra hnot
  have hrs : r ≤ s := le_of_not_gt hnot
  have hprod : 0 ≤ (s-r)*(s+r) :=
    mul_nonneg (sub_nonneg.mpr hrs) (add_nonneg hs hr)
  nlinarith only [hsq, hprod]

/-- Complete normalized scalar radius-drop core. The caller must derive
nonacuteness from the actual cap order, rather than postulating it. -/
theorem normalized_cap_pair_radius_lt
    {u v cx cy qx qy wx wy r s : ℝ}
    (huL : -1 ≤ u) (huR : u ≤ 1) (hv : 0 < v)
    (hangle : 1 ≤ u^2+v^2)
    (hqL : -1 ≤ qx) (hqR : qx ≤ 1)
    (hwL : -1 ≤ wx) (hwR : wx ≤ 1)
    (hqY : 0 < qy) (hwY : 0 < wy)
    (hr : 0 ≤ r) (hs : 0 ≤ s)
    (hOq : sqDist u (-v) qx qy = r^2)
    (hOw : sqDist u (-v) wx wy = r^2)
    (hcq : sqDist cx cy qx qy = s^2)
    (hcw : sqDist cx cy wx wy = s^2)
    (hnonacute : dotAt qx qy wx wy cx cy ≤ 0) :
    s < r := by
  exact paired_radius_lt_of_dots hr hs hOq hOw hcq hcw
    (apex_dot_pos huL huR hv hangle hqL hqR hwL hwR hqY hwY)
    hnonacute

/-- No disk through the named O and P can contain both q and d of the old
23-point local model. radSq is merely a common squared boundary distance. -/
theorem old_local_model_no_common_boundary_disk
    (cx cy radSq : ℝ)
    (hO : sqDist cx cy 0 (-1/10) = radSq)
    (hP : sqDist cx cy 1 0 = radSq)
    (hq : sqDist cx cy (-1) 0 ≤ radSq)
    (hd : sqDist cx cy (3401/3385) (-416/3385) ≤ radSq) :
    False := by
  unfold sqDist at *
  nlinarith [hO, hP, hq, hd]

end Problem97.ExactFiveCapRadiusDropScalar
