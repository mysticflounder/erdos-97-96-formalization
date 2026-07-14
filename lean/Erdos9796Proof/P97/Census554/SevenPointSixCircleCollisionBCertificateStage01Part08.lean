/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Mathlib

/-!
# Shard 15 UNIT certificate summand 1 part 8

Generated exact rational certificate module.
-/

set_option linter.style.longLine false
set_option maxRecDepth 100000
-- Exact certificate normalization needs extended heartbeats.
set_option maxHeartbeats 24000000

namespace Problem97
namespace Census554
namespace EqualityCore

/-- Exact part 8 of polynomial generator 1. -/
theorem normalizedSevenPointSixCircleBUnitSummand01Part08
    (x2x x2y x3x x3y x4x x4y x5x x5y x6x x6y : ℝ)
    (hp1 : -x2x^2-x2y^2+1 = 0)
    : 60434208*x2x^3*x2y^2*x6y^2 + 4643998192*x2x^3*x2y*x3y^2*x6y - 564393648*x2x^3*x2y*x6x*x6y - 164186928*x2x^3*x3x*x4y*x5y - 1074931912*x2x^3*x3y^2 + 254972138*x2x^3*x4x*x4y*x6y - 120868416*x2x^2*x2y^3*x3x*x5y*x6x + 37957824*x2x^2*x2y^2*x3x*x4y^2 - 386667936*x2x^2*x2y^2*x3y*x5y*x6x - 773335872*x2x^2*x2y*x3x^2*x5y*x6x + 5165351720*x2x^2*x2y*x3x*x3y*x6x - 597078724*x2x^2*x2y*x3x*x6y - 95676480*x2x^2*x2y*x3y*x4y^2 - 138813624*x2x^2*x2y*x4y - 121226400*x2x^2*x3x^2*x4x^2 + 2409931568*x2x^2*x3x*x3y^2*x6x - 509944276*x2x^2*x3x*x4x*x4y*x6y - 1935796840*x2x^2*x3x*x6x - 1231484*x2x^2*x3y^2*x6x - 60706944*x2x^2*x3y*x5y + 121287168*x2x^2*x4y*x5y*x6x + 60434208*x2x*x2y^4*x6y^2 + 4643998192*x2x*x2y^3*x3y^2*x6y - 564393648*x2x*x2y^3*x6x*x6y - 164186928*x2x*x2y^2*x3x*x4y*x5y - 1074931912*x2x*x2y^2*x3y^2 + 254972138*x2x*x2y^2*x4x*x4y*x6y - 60434208*x2x*x2y^2*x6y^2 - 4643998192*x2x*x2y*x3y^2*x6y + 564393648*x2x*x2y*x6x*x6y + 164186928*x2x*x3x*x4y*x5y + 1074931912*x2x*x3y^2 - 254972138*x2x*x4x*x4y*x6y - 120868416*x2y^5*x3x*x5y*x6x + 37957824*x2y^4*x3x*x4y^2 - 386667936*x2y^4*x3y*x5y*x6x - 773335872*x2y^3*x3x^2*x5y*x6x + 5165351720*x2y^3*x3x*x3y*x6x + 120868416*x2y^3*x3x*x5y*x6x - 597078724*x2y^3*x3x*x6y - 95676480*x2y^3*x3y*x4y^2 - 138813624*x2y^3*x4y - 121226400*x2y^2*x3x^2*x4x^2 + 2409931568*x2y^2*x3x*x3y^2*x6x - 509944276*x2y^2*x3x*x4x*x4y*x6y - 37957824*x2y^2*x3x*x4y^2 - 1935796840*x2y^2*x3x*x6x - 1231484*x2y^2*x3y^2*x6x + 386667936*x2y^2*x3y*x5y*x6x - 60706944*x2y^2*x3y*x5y + 121287168*x2y^2*x4y*x5y*x6x + 773335872*x2y*x3x^2*x5y*x6x - 5165351720*x2y*x3x*x3y*x6x + 597078724*x2y*x3x*x6y + 95676480*x2y*x3y*x4y^2 + 138813624*x2y*x4y + 121226400*x3x^2*x4x^2 - 2409931568*x3x*x3y^2*x6x + 509944276*x3x*x4x*x4y*x6y + 1935796840*x3x*x6x + 1231484*x3y^2*x6x + 60706944*x3y*x5y - 121287168*x4y*x5y*x6x = 0 := by
  linear_combination (norm := ring_nf) (-60434208*x2x*x2y^2*x6y^2 - 4643998192*x2x*x2y*x3y^2*x6y + 564393648*x2x*x2y*x6x*x6y + 164186928*x2x*x3x*x4y*x5y + 1074931912*x2x*x3y^2 - 254972138*x2x*x4x*x4y*x6y + 120868416*x2y^3*x3x*x5y*x6x - 37957824*x2y^2*x3x*x4y^2 + 386667936*x2y^2*x3y*x5y*x6x + 773335872*x2y*x3x^2*x5y*x6x - 5165351720*x2y*x3x*x3y*x6x + 597078724*x2y*x3x*x6y + 95676480*x2y*x3y*x4y^2 + 138813624*x2y*x4y + 121226400*x3x^2*x4x^2 - 2409931568*x3x*x3y^2*x6x + 509944276*x3x*x4x*x4y*x6y + 1935796840*x3x*x6x + 1231484*x3y^2*x6x + 60706944*x3y*x5y - 121287168*x4y*x5y*x6x) * hp1

end EqualityCore
end Census554
end Problem97
