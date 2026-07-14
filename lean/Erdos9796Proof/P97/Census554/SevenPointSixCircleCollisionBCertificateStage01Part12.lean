/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Mathlib

/-!
# Shard 15 UNIT certificate summand 1 part 12

Generated exact rational certificate module.
-/

set_option linter.style.longLine false
set_option maxRecDepth 100000
-- Exact certificate normalization needs extended heartbeats.
set_option maxHeartbeats 24000000

namespace Problem97
namespace Census554
namespace EqualityCore

/-- Exact part 12 of polynomial generator 1. -/
theorem normalizedSevenPointSixCircleBUnitSummand01Part12
    (x2x x2y x3x x3y x4x x4y x5x x5y x6x x6y : ℝ)
    (hp1 : -x2x^2-x2y^2+1 = 0)
    : -83268576*x2x^3*x2y*x3x*x4x*x4y + 37957824*x2x^3*x2y*x3y*x4y^2 - 950129272*x2x^3*x3x*x3y^2 - 1474761104*x2x^3*x3x*x6y^2 + 301493232*x2x^3*x3y*x4x*x5y - 592925976*x2x^3*x4x - 60434208*x2x^2*x2y^3*x6x*x6y + 3088832952*x2x^2*x2y^2*x3x*x6x^2 - 578876928*x2x^2*x2y^2*x4x*x6x^2 + 359326944*x2x^2*x2y*x3x*x3y^2*x4y - 576680832*x2x^2*x2y*x3x*x4x*x4y + 3773258592*x2x^2*x2y*x3y^2*x4y*x6x + 2041913468*x2x^2*x2y*x3y*x6x + 189272592*x2x^2*x2y*x5y + 328373856*x2x^2*x3x^2*x4y*x5y - 6630912*x2x^2*x3x*x3y*x4x*x4y - 3190610880*x2x^2*x3x*x4x*x6y^2 + 718653888*x2x^2*x3y^3*x4y*x6x - 2074220868*x2x^2*x3y*x4x*x4y - 791580244*x2x^2*x4x^2*x6x + 176130432*x2x^2*x5y*x6x*x6y - 83268576*x2x*x2y^3*x3x*x4x*x4y + 37957824*x2x*x2y^3*x3y*x4y^2 - 950129272*x2x*x2y^2*x3x*x3y^2 - 1474761104*x2x*x2y^2*x3x*x6y^2 + 301493232*x2x*x2y^2*x3y*x4x*x5y - 592925976*x2x*x2y^2*x4x + 83268576*x2x*x2y*x3x*x4x*x4y - 37957824*x2x*x2y*x3y*x4y^2 + 950129272*x2x*x3x*x3y^2 + 1474761104*x2x*x3x*x6y^2 - 301493232*x2x*x3y*x4x*x5y + 592925976*x2x*x4x - 60434208*x2y^5*x6x*x6y + 3088832952*x2y^4*x3x*x6x^2 - 578876928*x2y^4*x4x*x6x^2 + 359326944*x2y^3*x3x*x3y^2*x4y - 576680832*x2y^3*x3x*x4x*x4y + 3773258592*x2y^3*x3y^2*x4y*x6x + 2041913468*x2y^3*x3y*x6x + 189272592*x2y^3*x5y + 60434208*x2y^3*x6x*x6y + 328373856*x2y^2*x3x^2*x4y*x5y - 6630912*x2y^2*x3x*x3y*x4x*x4y - 3190610880*x2y^2*x3x*x4x*x6y^2 - 3088832952*x2y^2*x3x*x6x^2 + 718653888*x2y^2*x3y^3*x4y*x6x - 2074220868*x2y^2*x3y*x4x*x4y - 791580244*x2y^2*x4x^2*x6x + 578876928*x2y^2*x4x*x6x^2 + 176130432*x2y^2*x5y*x6x*x6y - 359326944*x2y*x3x*x3y^2*x4y + 576680832*x2y*x3x*x4x*x4y - 3773258592*x2y*x3y^2*x4y*x6x - 2041913468*x2y*x3y*x6x - 189272592*x2y*x5y - 328373856*x3x^2*x4y*x5y + 6630912*x3x*x3y*x4x*x4y + 3190610880*x3x*x4x*x6y^2 - 718653888*x3y^3*x4y*x6x + 2074220868*x3y*x4x*x4y + 791580244*x4x^2*x6x - 176130432*x5y*x6x*x6y = 0 := by
  linear_combination (norm := ring_nf) (83268576*x2x*x2y*x3x*x4x*x4y - 37957824*x2x*x2y*x3y*x4y^2 + 950129272*x2x*x3x*x3y^2 + 1474761104*x2x*x3x*x6y^2 - 301493232*x2x*x3y*x4x*x5y + 592925976*x2x*x4x + 60434208*x2y^3*x6x*x6y - 3088832952*x2y^2*x3x*x6x^2 + 578876928*x2y^2*x4x*x6x^2 - 359326944*x2y*x3x*x3y^2*x4y + 576680832*x2y*x3x*x4x*x4y - 3773258592*x2y*x3y^2*x4y*x6x - 2041913468*x2y*x3y*x6x - 189272592*x2y*x5y - 328373856*x3x^2*x4y*x5y + 6630912*x3x*x3y*x4x*x4y + 3190610880*x3x*x4x*x6y^2 - 718653888*x3y^3*x4y*x6x + 2074220868*x3y*x4x*x4y + 791580244*x4x^2*x6x - 176130432*x5y*x6x*x6y) * hp1

end EqualityCore
end Census554
end Problem97
