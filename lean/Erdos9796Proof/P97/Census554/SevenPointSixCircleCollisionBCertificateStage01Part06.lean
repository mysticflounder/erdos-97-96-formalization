/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Mathlib

/-!
# Shard 15 UNIT certificate summand 1 part 6

Generated exact rational certificate module.
-/

set_option linter.style.longLine false
set_option maxRecDepth 100000
-- Exact certificate normalization needs extended heartbeats.
set_option maxHeartbeats 24000000

namespace Problem97
namespace Census554
namespace EqualityCore

/-- Exact part 6 of polynomial generator 1. -/
theorem normalizedSevenPointSixCircleBUnitSummand01Part06
    (x2x x2y x3x x3y x4x x4y x5x x5y x6x x6y : ℝ)
    (hp1 : -x2x^2-x2y^2+1 = 0)
    : -120868416*x2x^3*x2y^2*x3y*x6y - 128483712*x2x^3*x2y*x3y^2*x5y*x6x - 31694738*x2x^3*x2y*x4x*x6y + 2069105246*x2x^3*x3x*x4x - 276378400*x2x^3*x3y^2*x6x + 1412474080*x2x^3*x3y*x6x*x6y + 374985972*x2x^3 + 868315392*x2x^2*x2y^2*x3x*x4x*x6x - 118571760*x2x^2*x2y^2*x3y*x4y + 578876928*x2x^2*x2y*x3x^2*x4x*x6y - 773335872*x2x^2*x2y*x3x*x3y*x5y*x6y - 224717760*x2x^2*x2y*x3x*x5y + 726963698*x2x^2*x2y*x3y*x4x + 1171316736*x2x^2*x2y*x4y*x6x^2 + 199767168*x2x^2*x3x^2*x3y*x6x*x6y - 128483712*x2x^2*x3x*x3y^2*x5y*x6y - 5874859104*x2x^2*x3x*x3y*x6x*x6y + 2440890792*x2x^2*x3x*x6x^2 - 128483712*x2x^2*x3y^2*x5y*x6x*x6y + 66625344*x2x^2*x3y*x5y*x6x^2 - 3018163720*x2x^2*x4y^2 - 120868416*x2x*x2y^4*x3y*x6y - 128483712*x2x*x2y^3*x3y^2*x5y*x6x - 31694738*x2x*x2y^3*x4x*x6y + 2069105246*x2x*x2y^2*x3x*x4x - 276378400*x2x*x2y^2*x3y^2*x6x + 1412474080*x2x*x2y^2*x3y*x6x*x6y + 120868416*x2x*x2y^2*x3y*x6y + 374985972*x2x*x2y^2 + 128483712*x2x*x2y*x3y^2*x5y*x6x + 31694738*x2x*x2y*x4x*x6y - 2069105246*x2x*x3x*x4x + 276378400*x2x*x3y^2*x6x - 1412474080*x2x*x3y*x6x*x6y - 374985972*x2x + 868315392*x2y^4*x3x*x4x*x6x - 118571760*x2y^4*x3y*x4y + 578876928*x2y^3*x3x^2*x4x*x6y - 773335872*x2y^3*x3x*x3y*x5y*x6y - 224717760*x2y^3*x3x*x5y + 726963698*x2y^3*x3y*x4x + 1171316736*x2y^3*x4y*x6x^2 + 199767168*x2y^2*x3x^2*x3y*x6x*x6y - 128483712*x2y^2*x3x*x3y^2*x5y*x6y - 5874859104*x2y^2*x3x*x3y*x6x*x6y - 868315392*x2y^2*x3x*x4x*x6x + 2440890792*x2y^2*x3x*x6x^2 - 128483712*x2y^2*x3y^2*x5y*x6x*x6y + 118571760*x2y^2*x3y*x4y + 66625344*x2y^2*x3y*x5y*x6x^2 - 3018163720*x2y^2*x4y^2 - 578876928*x2y*x3x^2*x4x*x6y + 773335872*x2y*x3x*x3y*x5y*x6y + 224717760*x2y*x3x*x5y - 726963698*x2y*x3y*x4x - 1171316736*x2y*x4y*x6x^2 - 199767168*x3x^2*x3y*x6x*x6y + 128483712*x3x*x3y^2*x5y*x6y + 5874859104*x3x*x3y*x6x*x6y - 2440890792*x3x*x6x^2 + 128483712*x3y^2*x5y*x6x*x6y - 66625344*x3y*x5y*x6x^2 + 3018163720*x4y^2 = 0 := by
  linear_combination (norm := ring_nf) (120868416*x2x*x2y^2*x3y*x6y + 128483712*x2x*x2y*x3y^2*x5y*x6x + 31694738*x2x*x2y*x4x*x6y - 2069105246*x2x*x3x*x4x + 276378400*x2x*x3y^2*x6x - 1412474080*x2x*x3y*x6x*x6y - 374985972*x2x - 868315392*x2y^2*x3x*x4x*x6x + 118571760*x2y^2*x3y*x4y - 578876928*x2y*x3x^2*x4x*x6y + 773335872*x2y*x3x*x3y*x5y*x6y + 224717760*x2y*x3x*x5y - 726963698*x2y*x3y*x4x - 1171316736*x2y*x4y*x6x^2 - 199767168*x3x^2*x3y*x6x*x6y + 128483712*x3x*x3y^2*x5y*x6y + 5874859104*x3x*x3y*x6x*x6y - 2440890792*x3x*x6x^2 + 128483712*x3y^2*x5y*x6x*x6y - 66625344*x3y*x5y*x6x^2 + 3018163720*x4y^2) * hp1

end EqualityCore
end Census554
end Problem97
