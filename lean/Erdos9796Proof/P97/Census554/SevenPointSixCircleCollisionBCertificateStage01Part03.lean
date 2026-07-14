/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Mathlib

/-!
# Shard 15 UNIT certificate summand 1 part 3

Generated exact rational certificate module.
-/

set_option linter.style.longLine false
set_option maxRecDepth 100000
-- Exact certificate normalization needs extended heartbeats.
set_option maxHeartbeats 24000000

namespace Problem97
namespace Census554
namespace EqualityCore

/-- Exact part 3 of polynomial generator 1. -/
theorem normalizedSevenPointSixCircleBUnitSummand01Part03
    (x2x x2y x3x x3y x4x x4y x5x x5y x6x x6y : ℝ)
    (hp1 : -x2x^2-x2y^2+1 = 0)
    : -786475008*x2x^3*x2y^2*x3y^2*x6x + 1371323760*x2x^3*x2y*x3x*x6y - 422781998*x2x^3*x2y*x3y + 2991343176*x2x^3*x3x*x3y*x6y - 80447040*x2x^3*x3y^2*x4y^2 + 349516656*x2x^3*x3y*x5y*x6x - 123714000*x2x^3*x5y*x6y - 1572950016*x2x^2*x2y^2*x3x*x3y*x6x*x6y + 83268576*x2x^2*x2y^2*x3y*x4x*x4y + 2529616696*x2x^2*x2y*x3x^2*x3y + 66013056*x2x^2*x2y*x3x*x3y*x4y*x5y - 13043232*x2x^2*x2y*x3x*x5y*x6x^2 + 251070890*x2x^2*x2y*x3y*x4x^2 - 142552224*x2x^2*x2y*x4x*x5y + 160894080*x2x^2*x3x^2*x3y*x4y*x6x + 38873088*x2x^2*x3x*x3y^2*x4x*x6x - 623232576*x2x^2*x3x*x3y*x5y*x6x + 26086464*x2x^2*x3x*x5y*x6x^2*x6y + 144416670*x2x^2*x3y^2*x4x + 2177129676*x2x^2*x3y*x4y*x6x + 797652720*x2x^2*x4x*x6y^2 - 786475008*x2x*x2y^4*x3y^2*x6x + 1371323760*x2x*x2y^3*x3x*x6y - 422781998*x2x*x2y^3*x3y + 2991343176*x2x*x2y^2*x3x*x3y*x6y - 80447040*x2x*x2y^2*x3y^2*x4y^2 + 786475008*x2x*x2y^2*x3y^2*x6x + 349516656*x2x*x2y^2*x3y*x5y*x6x - 123714000*x2x*x2y^2*x5y*x6y - 1371323760*x2x*x2y*x3x*x6y + 422781998*x2x*x2y*x3y - 2991343176*x2x*x3x*x3y*x6y + 80447040*x2x*x3y^2*x4y^2 - 349516656*x2x*x3y*x5y*x6x + 123714000*x2x*x5y*x6y - 1572950016*x2y^4*x3x*x3y*x6x*x6y + 83268576*x2y^4*x3y*x4x*x4y + 2529616696*x2y^3*x3x^2*x3y + 66013056*x2y^3*x3x*x3y*x4y*x5y - 13043232*x2y^3*x3x*x5y*x6x^2 + 251070890*x2y^3*x3y*x4x^2 - 142552224*x2y^3*x4x*x5y + 160894080*x2y^2*x3x^2*x3y*x4y*x6x + 38873088*x2y^2*x3x*x3y^2*x4x*x6x - 623232576*x2y^2*x3x*x3y*x5y*x6x + 1572950016*x2y^2*x3x*x3y*x6x*x6y + 26086464*x2y^2*x3x*x5y*x6x^2*x6y + 144416670*x2y^2*x3y^2*x4x - 83268576*x2y^2*x3y*x4x*x4y + 2177129676*x2y^2*x3y*x4y*x6x + 797652720*x2y^2*x4x*x6y^2 - 2529616696*x2y*x3x^2*x3y - 66013056*x2y*x3x*x3y*x4y*x5y + 13043232*x2y*x3x*x5y*x6x^2 - 251070890*x2y*x3y*x4x^2 + 142552224*x2y*x4x*x5y - 160894080*x3x^2*x3y*x4y*x6x - 38873088*x3x*x3y^2*x4x*x6x + 623232576*x3x*x3y*x5y*x6x - 26086464*x3x*x5y*x6x^2*x6y - 144416670*x3y^2*x4x - 2177129676*x3y*x4y*x6x - 797652720*x4x*x6y^2 = 0 := by
  linear_combination (norm := ring_nf) (786475008*x2x*x2y^2*x3y^2*x6x - 1371323760*x2x*x2y*x3x*x6y + 422781998*x2x*x2y*x3y - 2991343176*x2x*x3x*x3y*x6y + 80447040*x2x*x3y^2*x4y^2 - 349516656*x2x*x3y*x5y*x6x + 123714000*x2x*x5y*x6y + 1572950016*x2y^2*x3x*x3y*x6x*x6y - 83268576*x2y^2*x3y*x4x*x4y - 2529616696*x2y*x3x^2*x3y - 66013056*x2y*x3x*x3y*x4y*x5y + 13043232*x2y*x3x*x5y*x6x^2 - 251070890*x2y*x3y*x4x^2 + 142552224*x2y*x4x*x5y - 160894080*x3x^2*x3y*x4y*x6x - 38873088*x3x*x3y^2*x4x*x6x + 623232576*x3x*x3y*x5y*x6x - 26086464*x3x*x5y*x6x^2*x6y - 144416670*x3y^2*x4x - 2177129676*x3y*x4y*x6x - 797652720*x4x*x6y^2) * hp1

end EqualityCore
end Census554
end Problem97
