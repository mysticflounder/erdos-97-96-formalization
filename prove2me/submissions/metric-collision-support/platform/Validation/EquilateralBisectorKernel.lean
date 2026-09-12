/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Solutions.Sol_Erdos9796Mission_equilateral_bisector_collision

/-! Kernel validation of the equilateral-bisector collision theorem. -/

open Erdos9796Mission

namespace EquilateralBisectorKernelValidation

theorem result
    {p a b c x : Plane} {r : ℝ} (hr : 0 < r)
    (hpa : dist p a = r) (hpb : dist p b = r) (hpc : dist p c = r)
    (hab : dist a b = r) (hax : dist a x = r) (hbx : dist b x = r)
    (hcxca : dist c x = dist c a) :
    p = x ∨ c = b := by
  exact solution hr hpa hpb hpc hab hax hbx hcxca

#print axioms result

end EquilateralBisectorKernelValidation
