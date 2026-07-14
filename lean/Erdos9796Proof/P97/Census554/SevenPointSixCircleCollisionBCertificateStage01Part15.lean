/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Mathlib

/-!
# Shard 15 UNIT certificate summand 1 part 15

Generated exact rational certificate module.
-/

set_option linter.style.longLine false
set_option maxRecDepth 100000
-- Exact certificate normalization needs extended heartbeats.
set_option maxHeartbeats 24000000

namespace Problem97
namespace Census554
namespace EqualityCore

/-- Exact part 15 of polynomial generator 1. -/
theorem normalizedSevenPointSixCircleBUnitSummand01Part15
    (x2x x2y x3x x3y x4x x4y x5x x5y x6x x6y : ℝ)
    (hp1 : -x2x^2-x2y^2+1 = 0)
    : 42656112*x2x^3*x2y*x3x*x4y + 128483712*x2x^3*x2y*x3y*x5y*x6x*x6y + 1308505980*x2x^3*x3x*x3y*x4y - 150346080*x2x^3*x3y^3*x6y + 80447040*x2x^3*x3y*x4y^2*x6y - 1460755200*x2x^3*x4y*x6x*x6y + 1371323760*x2x^2*x2y^2*x3x^2 + 720359726*x2x^2*x2y^2*x3x + 564393648*x2x^2*x2y^2*x6x^2 - 261889344*x2x^2*x2y*x3x*x3y*x4x^2 - 1157753856*x2x^2*x2y*x3x*x4x*x6x*x6y - 64241856*x2x^2*x2y*x3y^2*x5y*x6x - 3901248*x2x^2*x2y*x4x*x4y*x6x + 735358512*x2x^2*x2y*x6y - 6637862772*x2x^2*x3x^2*x6x + 4178610244*x2x^2*x3x*x3y*x4x*x6y + 13942368*x2x^2*x3x*x4y*x5y*x6x - 38873088*x2x^2*x3y^2*x4x^2*x6x + 72962064*x2x^2*x3y*x4x*x5y + 13942368*x2x^2*x4x*x5y*x6x*x6y + 3916975114*x2x^2*x6x + 42656112*x2x*x2y^3*x3x*x4y + 128483712*x2x*x2y^3*x3y*x5y*x6x*x6y + 1308505980*x2x*x2y^2*x3x*x3y*x4y - 150346080*x2x*x2y^2*x3y^3*x6y + 80447040*x2x*x2y^2*x3y*x4y^2*x6y - 1460755200*x2x*x2y^2*x4y*x6x*x6y - 42656112*x2x*x2y*x3x*x4y - 128483712*x2x*x2y*x3y*x5y*x6x*x6y - 1308505980*x2x*x3x*x3y*x4y + 150346080*x2x*x3y^3*x6y - 80447040*x2x*x3y*x4y^2*x6y + 1460755200*x2x*x4y*x6x*x6y + 1371323760*x2y^4*x3x^2 + 720359726*x2y^4*x3x + 564393648*x2y^4*x6x^2 - 261889344*x2y^3*x3x*x3y*x4x^2 - 1157753856*x2y^3*x3x*x4x*x6x*x6y - 64241856*x2y^3*x3y^2*x5y*x6x - 3901248*x2y^3*x4x*x4y*x6x + 735358512*x2y^3*x6y - 6637862772*x2y^2*x3x^2*x6x - 1371323760*x2y^2*x3x^2 + 4178610244*x2y^2*x3x*x3y*x4x*x6y + 13942368*x2y^2*x3x*x4y*x5y*x6x - 720359726*x2y^2*x3x - 38873088*x2y^2*x3y^2*x4x^2*x6x + 72962064*x2y^2*x3y*x4x*x5y + 13942368*x2y^2*x4x*x5y*x6x*x6y - 564393648*x2y^2*x6x^2 + 3916975114*x2y^2*x6x + 261889344*x2y*x3x*x3y*x4x^2 + 1157753856*x2y*x3x*x4x*x6x*x6y + 64241856*x2y*x3y^2*x5y*x6x + 3901248*x2y*x4x*x4y*x6x - 735358512*x2y*x6y + 6637862772*x3x^2*x6x - 4178610244*x3x*x3y*x4x*x6y - 13942368*x3x*x4y*x5y*x6x + 38873088*x3y^2*x4x^2*x6x - 72962064*x3y*x4x*x5y - 13942368*x4x*x5y*x6x*x6y - 3916975114*x6x = 0 := by
  linear_combination (norm := ring_nf) (-42656112*x2x*x2y*x3x*x4y - 128483712*x2x*x2y*x3y*x5y*x6x*x6y - 1308505980*x2x*x3x*x3y*x4y + 150346080*x2x*x3y^3*x6y - 80447040*x2x*x3y*x4y^2*x6y + 1460755200*x2x*x4y*x6x*x6y - 1371323760*x2y^2*x3x^2 - 720359726*x2y^2*x3x - 564393648*x2y^2*x6x^2 + 261889344*x2y*x3x*x3y*x4x^2 + 1157753856*x2y*x3x*x4x*x6x*x6y + 64241856*x2y*x3y^2*x5y*x6x + 3901248*x2y*x4x*x4y*x6x - 735358512*x2y*x6y + 6637862772*x3x^2*x6x - 4178610244*x3x*x3y*x4x*x6y - 13942368*x3x*x4y*x5y*x6x + 38873088*x3y^2*x4x^2*x6x - 72962064*x3y*x4x*x5y - 13942368*x4x*x5y*x6x*x6y - 3916975114*x6x) * hp1

end EqualityCore
end Census554
end Problem97
