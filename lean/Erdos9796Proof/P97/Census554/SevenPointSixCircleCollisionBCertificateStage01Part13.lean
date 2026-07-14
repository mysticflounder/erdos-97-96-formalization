/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Mathlib

/-!
# Shard 15 UNIT certificate summand 1 part 13

Generated exact rational certificate module.
-/

set_option linter.style.longLine false
set_option maxRecDepth 100000
-- Exact certificate normalization needs extended heartbeats.
set_option maxHeartbeats 24000000

namespace Problem97
namespace Census554
namespace EqualityCore

/-- Exact part 13 of polynomial generator 1. -/
theorem normalizedSevenPointSixCircleBUnitSummand01Part13
    (x2x x2y x3x x3y x4x x4y x5x x5y x6x x6y : ℝ)
    (hp1 : -x2x^2-x2y^2+1 = 0)
    : -33006528*x2x^3*x2y*x3x*x4x*x5y - 33006528*x2x^3*x2y*x3y*x4y*x5y + 19436544*x2x^3*x3x*x3y*x4x*x6y - 715809680*x2x^3*x3x + 174691008*x2x^3*x3y*x4x*x6x*x6y + 18978912*x2x^3*x4y^2 - 289438464*x2x^2*x2y^2*x3x^2*x4x - 2177454240*x2x^2*x2y^2*x3x*x6x + 31694738*x2x^2*x2y^2*x4x*x6x - 227119104*x2x^2*x2y*x3x*x3y^2*x6x*x6y + 27884736*x2x^2*x2y*x3x*x4x*x5y*x6x - 2924697084*x2x^2*x2y*x3y^2*x4y - 1275460386*x2x^2*x2y*x3y - 6521616*x2x^2*x2y*x6x^2*x6y - 281635968*x2x^2*x3x^2*x4y*x6y - 328373856*x2x^2*x3x*x3y*x4x*x5y + 549308810*x2x^2*x3x*x4x + 836732128*x2x^2*x3y^3*x4y + 55769472*x2x^2*x3y*x4x*x5y*x6x^2 - 774458692*x2x^2*x4x^2 + 5901827624*x2x^2*x5y*x6y - 33006528*x2x*x2y^3*x3x*x4x*x5y - 33006528*x2x*x2y^3*x3y*x4y*x5y + 19436544*x2x*x2y^2*x3x*x3y*x4x*x6y - 715809680*x2x*x2y^2*x3x + 174691008*x2x*x2y^2*x3y*x4x*x6x*x6y + 18978912*x2x*x2y^2*x4y^2 + 33006528*x2x*x2y*x3x*x4x*x5y + 33006528*x2x*x2y*x3y*x4y*x5y - 19436544*x2x*x3x*x3y*x4x*x6y + 715809680*x2x*x3x - 174691008*x2x*x3y*x4x*x6x*x6y - 18978912*x2x*x4y^2 - 289438464*x2y^4*x3x^2*x4x - 2177454240*x2y^4*x3x*x6x + 31694738*x2y^4*x4x*x6x - 227119104*x2y^3*x3x*x3y^2*x6x*x6y + 27884736*x2y^3*x3x*x4x*x5y*x6x - 2924697084*x2y^3*x3y^2*x4y - 1275460386*x2y^3*x3y - 6521616*x2y^3*x6x^2*x6y + 289438464*x2y^2*x3x^2*x4x - 281635968*x2y^2*x3x^2*x4y*x6y - 328373856*x2y^2*x3x*x3y*x4x*x5y + 549308810*x2y^2*x3x*x4x + 2177454240*x2y^2*x3x*x6x + 836732128*x2y^2*x3y^3*x4y + 55769472*x2y^2*x3y*x4x*x5y*x6x^2 - 774458692*x2y^2*x4x^2 - 31694738*x2y^2*x4x*x6x + 5901827624*x2y^2*x5y*x6y + 227119104*x2y*x3x*x3y^2*x6x*x6y - 27884736*x2y*x3x*x4x*x5y*x6x + 2924697084*x2y*x3y^2*x4y + 1275460386*x2y*x3y + 6521616*x2y*x6x^2*x6y + 281635968*x3x^2*x4y*x6y + 328373856*x3x*x3y*x4x*x5y - 549308810*x3x*x4x - 836732128*x3y^3*x4y - 55769472*x3y*x4x*x5y*x6x^2 + 774458692*x4x^2 - 5901827624*x5y*x6y = 0 := by
  linear_combination (norm := ring_nf) (33006528*x2x*x2y*x3x*x4x*x5y + 33006528*x2x*x2y*x3y*x4y*x5y - 19436544*x2x*x3x*x3y*x4x*x6y + 715809680*x2x*x3x - 174691008*x2x*x3y*x4x*x6x*x6y - 18978912*x2x*x4y^2 + 289438464*x2y^2*x3x^2*x4x + 2177454240*x2y^2*x3x*x6x - 31694738*x2y^2*x4x*x6x + 227119104*x2y*x3x*x3y^2*x6x*x6y - 27884736*x2y*x3x*x4x*x5y*x6x + 2924697084*x2y*x3y^2*x4y + 1275460386*x2y*x3y + 6521616*x2y*x6x^2*x6y + 281635968*x3x^2*x4y*x6y + 328373856*x3x*x3y*x4x*x5y - 549308810*x3x*x4x - 836732128*x3y^3*x4y - 55769472*x3y*x4x*x5y*x6x^2 + 774458692*x4x^2 - 5901827624*x5y*x6y) * hp1

end EqualityCore
end Census554
end Problem97
