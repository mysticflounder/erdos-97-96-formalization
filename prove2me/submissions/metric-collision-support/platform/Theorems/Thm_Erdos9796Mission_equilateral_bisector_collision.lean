/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/

import Definitions.Def_Erdos9796Mission

open scoped EuclideanGeometry

/-! An equilateral-bisector metric configuration forces one of two collisions. -/

-- PROVE2ME_FORMAL_STATEMENT
theorem Erdos9796Mission.equilateral_bisector_collision
    {p a b c x : Erdos9796Mission.Plane} {r : ℝ} (hr : 0 < r)
    (hpa : dist p a = r) (hpb : dist p b = r) (hpc : dist p c = r)
    (hab : dist a b = r) (hax : dist a x = r) (hbx : dist b x = r)
    (hcxca : dist c x = dist c a) :
    p = x ∨ c = b := by
  sorry
