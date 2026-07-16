import Mathlib

/-!
# Generic double-reflection residual smoke

Exact scratch-only saturation of the final branch by an inverse to the
squared center separation.  The polynomial list is deletion-minimal for the
recorded order; msolve (forward and reverse variable orders) and Singular over
`QQ` independently return the unit ideal.
-/

namespace Problem97.ATailBankCleanGenericScratch

set_option maxHeartbeats 10000000 in
set_option maxRecDepth 100000 in
/-- Direct kernel terminal for the saturated generic residual. -/
theorem generic_double_reflection_reduced_incompatible
    {Fx Fy Kx Ky Xx Xy Yx Yy Zx Zy InvD : ℝ}
    (hAOK : -Kx ^ 2 + 2 * Kx - Ky ^ 2 = 0)
    (hFAZ : 2 * Fx * Zx - 2 * Fx + 2 * Fy * Zy - Zx ^ 2 - Zy ^ 2 + 1 = 0)
    (hFAK : 2 * Fx * Kx - 2 * Fx + 2 * Fy * Ky - Kx ^ 2 - Ky ^ 2 + 1 = 0)
    (hGXK : -Kx ^ 2 + 4 * Kx * Ky * Xy - 4 * Ky ^ 2 * Xx +
      3 * Ky ^ 2 - 4 * Ky * Xy + Xx ^ 2 + Xy ^ 2 = 0)
    (hXZG : -4 * Kx ^ 2 * Ky ^ 2 + 8 * Kx * Ky ^ 2 -
      4 * Kx * Ky * Xy - 4 * Ky ^ 4 + 4 * Ky ^ 2 * Xx - 4 * Ky ^ 2 +
      4 * Ky * Xy - 2 * Xx * Zx - 2 * Xy * Zy + Zx ^ 2 + Zy ^ 2 = 0)
    (hXZF : -Fx ^ 2 + 2 * Fx * Xx - Fy ^ 2 + 2 * Fy * Xy -
      2 * Xx * Zx - 2 * Xy * Zy + Zx ^ 2 + Zy ^ 2 = 0)
    (hYOX : -Xx ^ 2 + 2 * Xx * Yx - Xy ^ 2 + 2 * Xy * Yy = 0)
    (hYOZ : 2 * Yx * Zx + 2 * Yy * Zy - Zx ^ 2 - Zy ^ 2 = 0)
    (hZAG : -4 * Kx ^ 2 * Ky ^ 2 + 8 * Kx * Ky ^ 2 -
      4 * Kx * Ky * Zy - 4 * Ky ^ 4 + 4 * Ky ^ 2 * Zx - 4 * Ky ^ 2 +
      4 * Ky * Zy - 2 * Zx + 1 = 0)
    (hReflectX : 2 * Kx ^ 2 * Ky ^ 2 - 4 * Kx ^ 2 * Ky * Zy + Kx ^ 2 * Yx -
      4 * Kx * Ky ^ 2 + 4 * Kx * Ky * Zx * Zy + 6 * Kx * Ky * Zy -
      2 * Kx * Yx * Zx - 2 * Kx * Zy ^ 2 + 2 * Ky ^ 4 - 4 * Ky ^ 3 * Zy +
      Ky ^ 2 * Yx - 2 * Ky ^ 2 * Zx ^ 2 + 2 * Ky ^ 2 * Zx +
      2 * Ky ^ 2 * Zy ^ 2 - 2 * Ky * Yx * Zy - 2 * Ky * Zx * Zy +
      Yx * Zx ^ 2 + Yx * Zy ^ 2 = 0)
    (hReflectY : -2 * Kx ^ 3 * Ky + 4 * Kx ^ 2 * Ky * Zx +
      2 * Kx ^ 2 * Ky + Kx ^ 2 * Yy - 2 * Kx ^ 2 * Zy - 2 * Kx * Ky ^ 3 -
      2 * Kx * Ky * Zx ^ 2 - 2 * Kx * Ky * Zx + 2 * Kx * Ky * Zy ^ 2 -
      2 * Kx * Yy * Zx + 2 * Kx * Zx * Zy + 4 * Ky ^ 3 * Zx -
      2 * Ky ^ 3 + Ky ^ 2 * Yy - 4 * Ky ^ 2 * Zx * Zy + 4 * Ky ^ 2 * Zy -
      2 * Ky * Yy * Zy - 2 * Ky * Zy ^ 2 + Yy * Zx ^ 2 + Yy * Zy ^ 2 = 0)
    (hInv : InvD * Kx ^ 2 - 2 * InvD * Kx * Zx + InvD * Ky ^ 2 -
      2 * InvD * Ky * Zy + InvD * Zx ^ 2 + InvD * Zy ^ 2 - 1 = 0) : False := by
  grobner (ringSteps := 1000000)

#print axioms generic_double_reflection_reduced_incompatible

end Problem97.ATailBankCleanGenericScratch
