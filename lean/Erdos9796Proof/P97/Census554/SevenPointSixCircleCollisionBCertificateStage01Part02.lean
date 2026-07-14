/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Mathlib

/-!
# Shard 15 UNIT certificate summand 1 part 2

Generated exact rational certificate module.
-/

set_option linter.style.longLine false
set_option maxRecDepth 100000
-- Exact certificate normalization needs extended heartbeats.
set_option maxHeartbeats 24000000

namespace Problem97
namespace Census554
namespace EqualityCore

/-- Exact part 2 of polynomial generator 1. -/
theorem normalizedSevenPointSixCircleBUnitSummand01Part02
    (x2x x2y x3x x3y x4x x4y x5x x5y x6x x6y : ℝ)
    (hp1 : -x2x^2-x2y^2+1 = 0)
    : 120868416*x2x^3*x2y^2*x3x - 3088832952*x2x^3*x2y*x3x*x6x*x6y - 3335033720*x2x^3*x2y*x3y*x6y^2 - 99883584*x2x^3*x3x*x3y*x6x*x6y - 37195620*x2x^3*x3y^2*x4x + 13043232*x2x^3*x3y*x5y*x6x^2 - 37900368*x2x^3*x5y*x6x*x6y + 128483712*x2x^2*x2y^2*x3x*x3y*x5y*x6x - 393237504*x2x^2*x2y^2*x3y^2 - 2717812528*x2x^2*x2y*x3x^2*x3y*x6x + 4531392*x2x^2*x2y*x3x*x3y*x4y^2 + 2430056520*x2x^2*x2y*x3x*x4y - 984847016*x2x^2*x2y*x3y*x4x^2*x6x + 137306304*x2x^2*x2y*x4x*x5y*x6x - 38873088*x2x^2*x3x^2*x3y*x4x*x6y + 509673024*x2x^2*x3x*x3y^3*x6y + 50282530*x2x^2*x3x*x3y*x4y + 3723833768*x2x^2*x3x*x4y*x6y - 2466479792*x2x^2*x3y^2*x4x*x6x - 3008855904*x2x^2*x3y*x4y*x6x^2 - 1276903222*x2x^2*x4x*x6x + 120868416*x2x*x2y^4*x3x - 3088832952*x2x*x2y^3*x3x*x6x*x6y - 3335033720*x2x*x2y^3*x3y*x6y^2 - 99883584*x2x*x2y^2*x3x*x3y*x6x*x6y - 120868416*x2x*x2y^2*x3x - 37195620*x2x*x2y^2*x3y^2*x4x + 13043232*x2x*x2y^2*x3y*x5y*x6x^2 - 37900368*x2x*x2y^2*x5y*x6x*x6y + 3088832952*x2x*x2y*x3x*x6x*x6y + 3335033720*x2x*x2y*x3y*x6y^2 + 99883584*x2x*x3x*x3y*x6x*x6y + 37195620*x2x*x3y^2*x4x - 13043232*x2x*x3y*x5y*x6x^2 + 37900368*x2x*x5y*x6x*x6y + 128483712*x2y^4*x3x*x3y*x5y*x6x - 393237504*x2y^4*x3y^2 - 2717812528*x2y^3*x3x^2*x3y*x6x + 4531392*x2y^3*x3x*x3y*x4y^2 + 2430056520*x2y^3*x3x*x4y - 984847016*x2y^3*x3y*x4x^2*x6x + 137306304*x2y^3*x4x*x5y*x6x - 38873088*x2y^2*x3x^2*x3y*x4x*x6y + 509673024*x2y^2*x3x*x3y^3*x6y + 50282530*x2y^2*x3x*x3y*x4y - 128483712*x2y^2*x3x*x3y*x5y*x6x + 3723833768*x2y^2*x3x*x4y*x6y - 2466479792*x2y^2*x3y^2*x4x*x6x + 393237504*x2y^2*x3y^2 - 3008855904*x2y^2*x3y*x4y*x6x^2 - 1276903222*x2y^2*x4x*x6x + 2717812528*x2y*x3x^2*x3y*x6x - 4531392*x2y*x3x*x3y*x4y^2 - 2430056520*x2y*x3x*x4y + 984847016*x2y*x3y*x4x^2*x6x - 137306304*x2y*x4x*x5y*x6x + 38873088*x3x^2*x3y*x4x*x6y - 509673024*x3x*x3y^3*x6y - 50282530*x3x*x3y*x4y - 3723833768*x3x*x4y*x6y + 2466479792*x3y^2*x4x*x6x + 3008855904*x3y*x4y*x6x^2 + 1276903222*x4x*x6x = 0 := by
  linear_combination (norm := ring_nf) (-120868416*x2x*x2y^2*x3x + 3088832952*x2x*x2y*x3x*x6x*x6y + 3335033720*x2x*x2y*x3y*x6y^2 + 99883584*x2x*x3x*x3y*x6x*x6y + 37195620*x2x*x3y^2*x4x - 13043232*x2x*x3y*x5y*x6x^2 + 37900368*x2x*x5y*x6x*x6y - 128483712*x2y^2*x3x*x3y*x5y*x6x + 393237504*x2y^2*x3y^2 + 2717812528*x2y*x3x^2*x3y*x6x - 4531392*x2y*x3x*x3y*x4y^2 - 2430056520*x2y*x3x*x4y + 984847016*x2y*x3y*x4x^2*x6x - 137306304*x2y*x4x*x5y*x6x + 38873088*x3x^2*x3y*x4x*x6y - 509673024*x3x*x3y^3*x6y - 50282530*x3x*x3y*x4y - 3723833768*x3x*x4y*x6y + 2466479792*x3y^2*x4x*x6x + 3008855904*x3y*x4y*x6x^2 + 1276903222*x4x*x6x) * hp1

end EqualityCore
end Census554
end Problem97
