/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Mathlib

/-!
# Shard 15 UNIT certificate summand 1 part 14

Generated exact rational certificate module.
-/

set_option linter.style.longLine false
set_option maxRecDepth 100000
-- Exact certificate normalization needs extended heartbeats.
set_option maxHeartbeats 24000000

namespace Problem97
namespace Census554
namespace EqualityCore

/-- Exact part 14 of polynomial generator 1. -/
theorem normalizedSevenPointSixCircleBUnitSummand01Part14
    (x2x x2y x3x x3y x4x x4y x5x x5y x6x x6y : ℝ)
    (hp1 : -x2x^2-x2y^2+1 = 0)
    : -289438464*x2x^3*x2y*x3x*x4x*x6y + 2026069248*x2x^3*x2y*x3y*x4y*x6y - 80447040*x2x^3*x3x*x3y*x4y*x6x - 359326944*x2x^3*x3y^3*x4y - 3679751426*x2x^3*x3y*x4x*x6y + 295113024*x2x^3*x4y*x5y - 2967964536*x2x^2*x2y^2*x3x^2*x6x - 120868416*x2x^2*x2y^2*x3x*x6y^2 - 236564640*x2x^2*x2y^2*x5y*x6x*x6y - 2977255888*x2x^2*x2y*x3x*x3y^2*x6y + 26880624*x2x^2*x2y*x3x*x4x*x5y + 256967424*x2x^2*x2y*x3y^2*x5y*x6x^2 - 251070890*x2x^2*x2y*x4x^2*x6y - 1297100980*x2x^2*x2y*x6x*x6y - 2908467168*x2x^2*x3x^2*x6x^2 - 349382016*x2x^2*x3x*x3y*x4x*x6x*x6y + 1779729392*x2x^2*x3x*x4y^2 - 208980864*x2x^2*x3y^3*x6x*x6y - 288554976*x2x^2*x3y*x4x*x5y*x6x - 70408992*x2x^2*x4x*x4y*x6y - 231692920*x2x^2*x6x^2 - 289438464*x2x*x2y^3*x3x*x4x*x6y + 2026069248*x2x*x2y^3*x3y*x4y*x6y - 80447040*x2x*x2y^2*x3x*x3y*x4y*x6x - 359326944*x2x*x2y^2*x3y^3*x4y - 3679751426*x2x*x2y^2*x3y*x4x*x6y + 295113024*x2x*x2y^2*x4y*x5y + 289438464*x2x*x2y*x3x*x4x*x6y - 2026069248*x2x*x2y*x3y*x4y*x6y + 80447040*x2x*x3x*x3y*x4y*x6x + 359326944*x2x*x3y^3*x4y + 3679751426*x2x*x3y*x4x*x6y - 295113024*x2x*x4y*x5y - 2967964536*x2y^4*x3x^2*x6x - 120868416*x2y^4*x3x*x6y^2 - 236564640*x2y^4*x5y*x6x*x6y - 2977255888*x2y^3*x3x*x3y^2*x6y + 26880624*x2y^3*x3x*x4x*x5y + 256967424*x2y^3*x3y^2*x5y*x6x^2 - 251070890*x2y^3*x4x^2*x6y - 1297100980*x2y^3*x6x*x6y - 2908467168*x2y^2*x3x^2*x6x^2 + 2967964536*x2y^2*x3x^2*x6x - 349382016*x2y^2*x3x*x3y*x4x*x6x*x6y + 1779729392*x2y^2*x3x*x4y^2 + 120868416*x2y^2*x3x*x6y^2 - 208980864*x2y^2*x3y^3*x6x*x6y - 288554976*x2y^2*x3y*x4x*x5y*x6x - 70408992*x2y^2*x4x*x4y*x6y + 236564640*x2y^2*x5y*x6x*x6y - 231692920*x2y^2*x6x^2 + 2977255888*x2y*x3x*x3y^2*x6y - 26880624*x2y*x3x*x4x*x5y - 256967424*x2y*x3y^2*x5y*x6x^2 + 251070890*x2y*x4x^2*x6y + 1297100980*x2y*x6x*x6y + 2908467168*x3x^2*x6x^2 + 349382016*x3x*x3y*x4x*x6x*x6y - 1779729392*x3x*x4y^2 + 208980864*x3y^3*x6x*x6y + 288554976*x3y*x4x*x5y*x6x + 70408992*x4x*x4y*x6y + 231692920*x6x^2 = 0 := by
  linear_combination (norm := ring_nf) (289438464*x2x*x2y*x3x*x4x*x6y - 2026069248*x2x*x2y*x3y*x4y*x6y + 80447040*x2x*x3x*x3y*x4y*x6x + 359326944*x2x*x3y^3*x4y + 3679751426*x2x*x3y*x4x*x6y - 295113024*x2x*x4y*x5y + 2967964536*x2y^2*x3x^2*x6x + 120868416*x2y^2*x3x*x6y^2 + 236564640*x2y^2*x5y*x6x*x6y + 2977255888*x2y*x3x*x3y^2*x6y - 26880624*x2y*x3x*x4x*x5y - 256967424*x2y*x3y^2*x5y*x6x^2 + 251070890*x2y*x4x^2*x6y + 1297100980*x2y*x6x*x6y + 2908467168*x3x^2*x6x^2 + 349382016*x3x*x3y*x4x*x6x*x6y - 1779729392*x3x*x4y^2 + 208980864*x3y^3*x6x*x6y + 288554976*x3y*x4x*x5y*x6x + 70408992*x4x*x4y*x6y + 231692920*x6x^2) * hp1

end EqualityCore
end Census554
end Problem97
