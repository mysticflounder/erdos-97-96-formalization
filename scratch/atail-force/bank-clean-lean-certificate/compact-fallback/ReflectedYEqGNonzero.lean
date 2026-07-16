import Mathlib

/-!
# Nonzero reflected `Y = G` terminal

Scratch-only exact algebra for the nonzero arm after the first two
circle-intersection splits.  The reductions are stated with low-degree
consequences so the kernel-facing Groebner call stays small.
-/

namespace Problem97.ATailBankCleanReflectedScratch

set_option maxHeartbeats 2000000 in
/-- Seven-variable terminal for `Kx = 3/2`, `4*Ky^2 = 3`, and `Y = G`. -/
theorem reflected_points_coincident_nonzero_reduced_incompatible
    {Ky Fx Fy Xx Xy Zx Zy : ℝ}
    (hKy : 4 * Ky ^ 2 - 3 = 0)
    (hFAK : Fx + 2 * Ky * Fy - 2 = 0)
    (hFAZ : 2 * Fx * Zx - 2 * Fx + 2 * Fy * Zy - Zx ^ 2 - Zy ^ 2 + 1 = 0)
    (hYOX : 3 * Xx - 2 * Ky * Xy - Xx ^ 2 - Xy ^ 2 = 0)
    (hYOZ : 3 * Zx - 2 * Ky * Zy - Zx ^ 2 - Zy ^ 2 = 0)
    (hZAG : Zx - 2 * Ky * Zy - 2 = 0)
    (hXZG : 3 * Xx - 2 * Ky * Xy - 2 * Xx * Zx - 2 * Xy * Zy +
      Zx ^ 2 + Zy ^ 2 - 3 = 0)
    (hXZF : -Fx ^ 2 + 2 * Fx * Xx - Fy ^ 2 + 2 * Fy * Xy -
      2 * Xx * Zx - 2 * Xy * Zy + Zx ^ 2 + Zy ^ 2 = 0) : False := by
  grobner

#print axioms reflected_points_coincident_nonzero_reduced_incompatible

end Problem97.ATailBankCleanReflectedScratch
