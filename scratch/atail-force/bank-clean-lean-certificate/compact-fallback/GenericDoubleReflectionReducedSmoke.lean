import Mathlib

/-!
# AOK-reduced generic double-reflection residual

Scratch-only kernel terminal after reducing every other polynomial by the
normalized `A/O/K` circle equation.  This keeps the exact saturated ideal but
removes avoidable fourth powers and `Kx^2` multiples.
-/

namespace Problem97.ATailBankCleanGenericScratch

set_option maxHeartbeats 10000000 in
set_option maxRecDepth 100000 in
/-- Direct kernel terminal for the AOK-reduced generic residual. -/
theorem generic_double_reflection_AOK_reduced_incompatible
    {Fx Fy Kx Ky Xx Xy Yx Yy Zx Zy InvD : ℝ}
    (hAOK : -Kx ^ 2 + 2 * Kx - Ky ^ 2 = 0)
    (hFAZ : 2 * Fx * Zx - 2 * Fx + 2 * Fy * Zy - Zx ^ 2 - Zy ^ 2 + 1 = 0)
    (hFAK : 2 * Fx * Kx - 2 * Fx + 2 * Fy * Ky - 2 * Kx + 1 = 0)
    (hGXK : 4 * Kx * Ky * Xy - 2 * Kx - 4 * Ky ^ 2 * Xx +
      4 * Ky ^ 2 - 4 * Ky * Xy + Xx ^ 2 + Xy ^ 2 = 0)
    (hXZG : -4 * Kx * Ky * Xy + 4 * Ky ^ 2 * Xx - 4 * Ky ^ 2 +
      4 * Ky * Xy - 2 * Xx * Zx - 2 * Xy * Zy + Zx ^ 2 + Zy ^ 2 = 0)
    (hXZF : -Fx ^ 2 + 2 * Fx * Xx - Fy ^ 2 + 2 * Fy * Xy -
      2 * Xx * Zx - 2 * Xy * Zy + Zx ^ 2 + Zy ^ 2 = 0)
    (hYOX : -Xx ^ 2 + 2 * Xx * Yx - Xy ^ 2 + 2 * Xy * Yy = 0)
    (hYOZ : 2 * Yx * Zx + 2 * Yy * Zy - Zx ^ 2 - Zy ^ 2 = 0)
    (hZAG : -4 * Kx * Ky * Zy + 4 * Ky ^ 2 * Zx - 4 * Ky ^ 2 +
      4 * Ky * Zy - 2 * Zx + 1 = 0)
    (hReflectX : 4 * Kx * Ky * Zx * Zy - 2 * Kx * Ky * Zy -
      2 * Kx * Yx * Zx + 2 * Kx * Yx - 2 * Kx * Zy ^ 2 -
      2 * Ky ^ 2 * Zx ^ 2 + 2 * Ky ^ 2 * Zx + 2 * Ky ^ 2 * Zy ^ 2 -
      2 * Ky * Yx * Zy - 2 * Ky * Zx * Zy + Yx * Zx ^ 2 +
      Yx * Zy ^ 2 = 0)
    (hReflectY : -2 * Kx * Ky * Zx ^ 2 + 6 * Kx * Ky * Zx +
      2 * Kx * Ky * Zy ^ 2 - 4 * Kx * Ky - 2 * Kx * Yy * Zx +
      2 * Kx * Yy + 2 * Kx * Zx * Zy - 4 * Kx * Zy -
      4 * Ky ^ 2 * Zx * Zy + 6 * Ky ^ 2 * Zy - 2 * Ky * Yy * Zy -
      2 * Ky * Zy ^ 2 + Yy * Zx ^ 2 + Yy * Zy ^ 2 = 0)
    (hInv : -2 * InvD * Kx * Zx + 2 * InvD * Kx -
      2 * InvD * Ky * Zy + InvD * Zx ^ 2 + InvD * Zy ^ 2 - 1 = 0) : False := by
  grobner (ringSteps := 500000)

#print axioms generic_double_reflection_AOK_reduced_incompatible

end Problem97.ATailBankCleanGenericScratch
