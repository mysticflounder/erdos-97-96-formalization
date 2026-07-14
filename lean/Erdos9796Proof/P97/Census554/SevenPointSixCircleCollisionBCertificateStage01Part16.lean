/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Mathlib

/-!
# Shard 15 UNIT certificate summand 1 part 16

Generated exact rational certificate module.
-/

set_option linter.style.longLine false
set_option maxRecDepth 100000
-- Exact certificate normalization needs extended heartbeats.
set_option maxHeartbeats 24000000

namespace Problem97
namespace Census554
namespace EqualityCore

/-- Exact part 16 of polynomial generator 1. -/
theorem normalizedSevenPointSixCircleBUnitSummand01Part16
    (x2x x2y x3x x3y x4x x4y x5x x5y x6x x6y : ℝ)
    (hp1 : -x2x^2-x2y^2+1 = 0)
    : 386667936*x2x^3*x2y*x3x*x5y*x6x + 150103296*x2x^3*x2y*x3y*x5y*x6y + 64241856*x2x^3*x3x*x3y*x5y*x6x + 19436544*x2x^3*x3y^2*x4x^2 - 1157907768*x2x^3*x3y*x4y*x6x - 1586435122*x2x^3*x4y*x6y + 113559552*x2x^2*x2y^2*x3x*x3y^2*x6x + 1459390464*x2x^2*x2y^2*x3y^2*x6x^2 - 452999102*x2x^2*x2y^2*x6x - 423622464*x2x^2*x2y*x3x*x3y*x4x*x6x + 1630623172*x2x^2*x2y*x3x*x4x*x6y - 64241856*x2x^2*x2y*x3y^2*x5y + 41634288*x2x^2*x2y*x4x*x4y + 509673024*x2x^2*x3x^2*x3y^2*x6x + 2949522208*x2x^2*x3x^2*x6y^2 - 160894080*x2x^2*x3x*x3y*x4y^2*x6y - 892030608*x2x^2*x3x*x4y*x5y + 36533952*x2x^2*x3y^2*x4x^2 + 3277956384*x2x^2*x3y*x4x*x6x*x6y - 68653152*x2x^2*x4x*x5y*x6y + 60272168*x2x^2*x6y^2 + 386667936*x2x*x2y^3*x3x*x5y*x6x + 150103296*x2x*x2y^3*x3y*x5y*x6y + 64241856*x2x*x2y^2*x3x*x3y*x5y*x6x + 19436544*x2x*x2y^2*x3y^2*x4x^2 - 1157907768*x2x*x2y^2*x3y*x4y*x6x - 1586435122*x2x*x2y^2*x4y*x6y - 386667936*x2x*x2y*x3x*x5y*x6x - 150103296*x2x*x2y*x3y*x5y*x6y - 64241856*x2x*x3x*x3y*x5y*x6x - 19436544*x2x*x3y^2*x4x^2 + 1157907768*x2x*x3y*x4y*x6x + 1586435122*x2x*x4y*x6y + 113559552*x2y^4*x3x*x3y^2*x6x + 1459390464*x2y^4*x3y^2*x6x^2 - 452999102*x2y^4*x6x - 423622464*x2y^3*x3x*x3y*x4x*x6x + 1630623172*x2y^3*x3x*x4x*x6y - 64241856*x2y^3*x3y^2*x5y + 41634288*x2y^3*x4x*x4y + 509673024*x2y^2*x3x^2*x3y^2*x6x + 2949522208*x2y^2*x3x^2*x6y^2 - 113559552*x2y^2*x3x*x3y^2*x6x - 160894080*x2y^2*x3x*x3y*x4y^2*x6y - 892030608*x2y^2*x3x*x4y*x5y + 36533952*x2y^2*x3y^2*x4x^2 - 1459390464*x2y^2*x3y^2*x6x^2 + 3277956384*x2y^2*x3y*x4x*x6x*x6y - 68653152*x2y^2*x4x*x5y*x6y + 452999102*x2y^2*x6x + 60272168*x2y^2*x6y^2 + 423622464*x2y*x3x*x3y*x4x*x6x - 1630623172*x2y*x3x*x4x*x6y + 64241856*x2y*x3y^2*x5y - 41634288*x2y*x4x*x4y - 509673024*x3x^2*x3y^2*x6x - 2949522208*x3x^2*x6y^2 + 160894080*x3x*x3y*x4y^2*x6y + 892030608*x3x*x4y*x5y - 36533952*x3y^2*x4x^2 - 3277956384*x3y*x4x*x6x*x6y + 68653152*x4x*x5y*x6y - 60272168*x6y^2 = 0 := by
  linear_combination (norm := ring_nf) (-386667936*x2x*x2y*x3x*x5y*x6x - 150103296*x2x*x2y*x3y*x5y*x6y - 64241856*x2x*x3x*x3y*x5y*x6x - 19436544*x2x*x3y^2*x4x^2 + 1157907768*x2x*x3y*x4y*x6x + 1586435122*x2x*x4y*x6y - 113559552*x2y^2*x3x*x3y^2*x6x - 1459390464*x2y^2*x3y^2*x6x^2 + 452999102*x2y^2*x6x + 423622464*x2y*x3x*x3y*x4x*x6x - 1630623172*x2y*x3x*x4x*x6y + 64241856*x2y*x3y^2*x5y - 41634288*x2y*x4x*x4y - 509673024*x3x^2*x3y^2*x6x - 2949522208*x3x^2*x6y^2 + 160894080*x3x*x3y*x4y^2*x6y + 892030608*x3x*x4y*x5y - 36533952*x3y^2*x4x^2 - 3277956384*x3y*x4x*x6x*x6y + 68653152*x4x*x5y*x6y - 60272168*x6y^2) * hp1

end EqualityCore
end Census554
end Problem97
