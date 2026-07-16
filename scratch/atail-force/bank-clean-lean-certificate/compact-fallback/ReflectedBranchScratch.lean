import Mathlib

/-!
# Scratch terminals for the reflected bank-clean branch

This file is independent of production source.  It tests compact kernel
terminals after the two exact circle-intersection splits.
-/

namespace Problem97.ATailBankCleanReflectedScratch

set_option maxHeartbeats 20000000 in
set_option maxRecDepth 100000 in
/-- The exact eleven-row residual after the reflected first split and `Y = G`. -/
theorem reflected_points_coincident_reduced_incompatible
    {Ex Ey Fx Fy Kx Ky Xx Xy Zx Zy : ℝ}
    (hFAZ : 2 * Fx * Zx - 2 * Fx + 2 * Fy * Zy - Zx ^ 2 - Zy ^ 2 + 1 = 0)
    (hFAK : 2 * Fx * Kx - 2 * Fx + 2 * Fy * Ky - Kx ^ 2 - Ky ^ 2 + 1 = 0)
    (hGXE : -Ex ^ 2 + 4 * Ex * Ky ^ 2 - Ey ^ 2 - 4 * Ey * Kx * Ky +
      4 * Ey * Ky + 4 * Kx * Ky * Xy - 4 * Ky ^ 2 * Xx - 4 * Ky * Xy +
      Xx ^ 2 + Xy ^ 2 = 0)
    (hGXK : -Kx ^ 2 + 4 * Kx * Ky * Xy - 4 * Ky ^ 2 * Xx +
      3 * Ky ^ 2 - 4 * Ky * Xy + Xx ^ 2 + Xy ^ 2 = 0)
    (hKOG : -4 * Kx ^ 2 * Ky ^ 2 + 8 * Kx * Ky ^ 2 - 4 * Ky ^ 4 = 0)
    (hOAE : -Ex ^ 2 - Ey ^ 2 + 1 = 0)
    (hXZG : -4 * Kx ^ 2 * Ky ^ 2 + 8 * Kx * Ky ^ 2 -
      4 * Kx * Ky * Xy - 4 * Ky ^ 4 + 4 * Ky ^ 2 * Xx - 4 * Ky ^ 2 +
      4 * Ky * Xy - 2 * Xx * Zx - 2 * Xy * Zy + Zx ^ 2 + Zy ^ 2 = 0)
    (hXZF : -Fx ^ 2 + 2 * Fx * Xx - Fy ^ 2 + 2 * Fy * Xy -
      2 * Xx * Zx - 2 * Xy * Zy + Zx ^ 2 + Zy ^ 2 = 0)
    (hYOX : -4 * Kx * Ky * Xy + 4 * Ky ^ 2 * Xx + 4 * Ky * Xy -
      Xx ^ 2 - Xy ^ 2 = 0)
    (hYOZ : -4 * Kx * Ky * Zy + 4 * Ky ^ 2 * Zx + 4 * Ky * Zy -
      Zx ^ 2 - Zy ^ 2 = 0)
    (hZAG : -4 * Kx ^ 2 * Ky ^ 2 + 8 * Kx * Ky ^ 2 -
      4 * Kx * Ky * Zy - 4 * Ky ^ 4 + 4 * Ky ^ 2 * Zx - 4 * Ky ^ 2 +
      4 * Ky * Zy - 2 * Zx + 1 = 0) : False := by
  grobner (ringSteps := 2000000)

#print axioms reflected_points_coincident_reduced_incompatible

end Problem97.ATailBankCleanReflectedScratch
