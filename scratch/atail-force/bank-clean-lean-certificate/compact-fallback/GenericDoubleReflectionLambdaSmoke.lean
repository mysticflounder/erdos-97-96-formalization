import Mathlib

/-!
# Low-degree generic double-reflection terminal

The quotient `L = q / |Z-K|^2` turns the final reflection identities into two
linear coordinate formulas.  The remaining exact rows force the squared
center separation itself to vanish; the generic branch excludes that.
-/

namespace Problem97.ATailBankCleanGenericScratch

set_option maxHeartbeats 2000000 in
/-- The low-degree lambda system forces the two reflection centers to coincide. -/
theorem generic_double_reflection_lambda_forces_center_collision
    {L Fx Fy Kx Ky Xx Xy Yx Yy Zx Zy : ℝ}
    (hAOK : -Kx ^ 2 + 2 * Kx - Ky ^ 2 = 0)
    (hFAK : 2 * Fx * Kx - 2 * Fx + 2 * Fy * Ky - 2 * Kx + 1 = 0)
    (hFKZ : 2 * Fx * Zx + 2 * Fy * Zy - 2 * Fx * Kx - 2 * Fy * Ky -
      Zx ^ 2 - Zy ^ 2 + 2 * Kx = 0)
    (hGXK : 4 * Kx * Ky * Xy - 2 * Kx - 4 * Ky ^ 2 * Xx +
      4 * Ky ^ 2 - 4 * Ky * Xy + Xx ^ 2 + Xy ^ 2 = 0)
    (hXZ : Xx ^ 2 + Xy ^ 2 - 2 * Xx * Zx - 2 * Xy * Zy +
      Zx ^ 2 + Zy ^ 2 - 2 * Kx = 0)
    (hXF : -Fx ^ 2 - Fy ^ 2 + 2 * Fx * Xx + 2 * Fy * Xy -
      Xx ^ 2 - Xy ^ 2 + 2 * Kx = 0)
    (hYOX : -Xx ^ 2 + 2 * Xx * Yx - Xy ^ 2 + 2 * Xy * Yy = 0)
    (hYOZ : 2 * Yx * Zx + 2 * Yy * Zy - Zx ^ 2 - Zy ^ 2 = 0)
    (hZAG : -4 * Kx * Ky * Zy + 4 * Ky ^ 2 * Zx - 4 * Ky ^ 2 +
      4 * Ky * Zy - 2 * Zx + 1 = 0)
    (hL : L * (-2 * Kx * Zx + 2 * Kx - 2 * Ky * Zy + Zx ^ 2 + Zy ^ 2) -
      (2 * Kx * Ky - 2 * Kx * Ky * Zx + Kx * Zy -
        2 * Ky ^ 2 * Zy + Ky * Zx) = 0)
    (hReflectX : Yx - 2 * Ky ^ 2 - 2 * L * (Zy - Ky) = 0)
    (hReflectY : Yy - 2 * Ky * (1 - Kx) + 2 * L * (Zx - Kx) = 0) :
    -2 * Kx * Zx + 2 * Kx - 2 * Ky * Zy + Zx ^ 2 + Zy ^ 2 = 0 := by
  grobner

#print axioms generic_double_reflection_lambda_forces_center_collision

end Problem97.ATailBankCleanGenericScratch
