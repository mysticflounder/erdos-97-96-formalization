/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.Census554.Profile282K2OrderCore

/-!
# Opposed-turn residual order core

This module isolates the scalar contradiction carried by the small
family-13 core of the exact-five opposed-turn residual computation.
-/

namespace Problem97
namespace Census554
namespace EqualityCore

/-- A normalized `K2`-row point cannot satisfy both strict half-plane
constraints selected by the family-13 residual core. -/
theorem normalized_K2Row_above_left_incompatibility
    {r x y : ℝ}
    (hnorm : 4 * r ^ 2 = 3)
    (hr : 0 < r)
    (hrow : -2 - 2 * r * y + 3 * x - x ^ 2 - y ^ 2 = 0)
    (habove : 0 < r + y)
    (hleft : 0 < -r * x - y / 2) :
    False := by
  have hx : x < 1 / 2 := by
    by_contra hxNot
    have hxLower : 1 / 2 ≤ x := le_of_not_gt hxNot
    have hprod : 0 ≤ r * (x - 1 / 2) :=
      mul_nonneg hr.le (sub_nonneg.mpr hxLower)
    nlinarith
  have hcircle : (x - 3 / 2) ^ 2 + (y + r) ^ 2 = 1 := by
    nlinarith
  have hxSquare : 1 < (x - 3 / 2) ^ 2 := by
    nlinarith [sq_nonneg (1 / 2 - x)]
  nlinarith [sq_nonneg (y + r)]

/-- A unit-circle point strictly below the horizontal axis cannot lie beyond
the displayed positive-radius ray.  This is the scalar core selected from the
family-12 residual. -/
theorem unitCircle_below_rightRay_incompatibility
    {r x y : ℝ}
    (hr : 0 < r)
    (hcircle : 1 - x ^ 2 - y ^ 2 = 0)
    (hray : 0 < -r + r * x + y / 2)
    (hbelow : 0 < -y) :
    False := by
  have hx : 1 < x := by
    by_contra hxNot
    have hxUpper : x ≤ 1 := le_of_not_gt hxNot
    have hprod : r * (x - 1) ≤ 0 :=
      mul_nonpos_of_nonneg_of_nonpos hr.le (sub_nonpos.mpr hxUpper)
    nlinarith
  nlinarith [sq_nonneg (x - 1), sq_nonneg y]

end EqualityCore
end Census554
end Problem97
