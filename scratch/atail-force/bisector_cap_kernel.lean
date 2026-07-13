import Mathlib

/-!
Order-free scalar kernel extracted from ATAIL class 2472.  The hypotheses are
the conservative deletion core emitted by `m6_base_minimize.py`; no live-leaf
or full-filter adapter is claimed here.
-/

namespace Problem97.ATAILForceScratch

theorem bisectorCapKernel
    (v1x v1y p2x p2y ru2 rv2 rw2 : ℝ)
    (heq3 : -ru2 + v1x ^ 2 + v1y ^ 2 = 0)
    (heq4 : 1 - rw2 = 0)
    (heq5 : -ru2 + v1x ^ 2 - 2 * v1x + v1y ^ 2 + 1 = 0)
    (heq6 : 1 - rv2 = 0)
    (heq10 : p2x ^ 2 + p2y ^ 2 - rv2 = 0)
    (heq11 : p2x ^ 2 - 2 * p2x + p2y ^ 2 - rw2 + 1 = 0)
    (hgt14 :
      0 < p2x * v1y ^ 2 - p2y * v1x * v1y +
        p2y * v1y - v1y ^ 2)
    (hgt15 : 0 < p2x * v1y ^ 2 - p2y * v1x * v1y) :
    False := by
  have hv1x : v1x = 1 / 2 := by
    nlinarith [heq3, heq5]
  have hp2x : p2x = 1 / 2 := by
    nlinarith [heq4, heq6, heq10, heq11]
  rw [hv1x, hp2x] at hgt14 hgt15
  nlinarith

end Problem97.ATAILForceScratch
