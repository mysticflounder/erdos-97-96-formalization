/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Mathlib

/-!
# Shard 15 UNIT certificate summand 1 part 4

Generated exact rational certificate module.
-/

set_option linter.style.longLine false
set_option maxRecDepth 100000
-- Exact certificate normalization needs extended heartbeats.
set_option maxHeartbeats 24000000

namespace Problem97
namespace Census554
namespace EqualityCore

/-- Exact part 4 of polynomial generator 1. -/
theorem normalizedSevenPointSixCircleBUnitSummand01Part04
    (x2x x2y x3x x3y x4x x4y x5x x5y x6x x6y : ℝ)
    (hp1 : -x2x^2-x2y^2+1 = 0)
    : 120868416*x2x^3*x2y^2*x3y*x5y*x6x - 113559552*x2x^3*x2y*x3y^3*x6x - 502141780*x2x^3*x2y*x4x^2*x6y + 60613200*x2x^3*x3x*x4x^2 + 278879904*x2x^3*x3y^2*x4y*x6y - 64241856*x2x^3*x3y*x5y*x6y^2 + 6521616*x2x^3*x6x*x6y^2 - 1905200832*x2x^2*x2y^2*x3x*x3y*x6y + 33006528*x2x^2*x2y^2*x3y*x4x*x5y + 166537152*x2x^2*x2y*x3x^2*x4x*x4y - 4132585536*x2x^2*x2y*x3x*x3y*x4y*x6y + 1996111440*x2x^2*x2y*x3x*x5y*x6x + 983062848*x2x^2*x2y*x3y*x4x*x6x^2 - 1305866976*x2x^2*x2y*x4x*x6x*x6y - 1780351160*x2x^2*x3x^2*x3y*x4y + 3240315864*x2x^2*x3x*x3y^2*x4x + 128483712*x2x^2*x3x*x3y*x5y*x6y^2 + 61858368*x2x^2*x3x*x5y*x6x*x6y + 160894080*x2x^2*x3y^2*x4y^2*x6x + 1710426262*x2x^2*x3y*x4y + 2917210528*x2x^2*x4x + 120868416*x2x*x2y^4*x3y*x5y*x6x - 113559552*x2x*x2y^3*x3y^3*x6x - 502141780*x2x*x2y^3*x4x^2*x6y + 60613200*x2x*x2y^2*x3x*x4x^2 + 278879904*x2x*x2y^2*x3y^2*x4y*x6y - 120868416*x2x*x2y^2*x3y*x5y*x6x - 64241856*x2x*x2y^2*x3y*x5y*x6y^2 + 6521616*x2x*x2y^2*x6x*x6y^2 + 113559552*x2x*x2y*x3y^3*x6x + 502141780*x2x*x2y*x4x^2*x6y - 60613200*x2x*x3x*x4x^2 - 278879904*x2x*x3y^2*x4y*x6y + 64241856*x2x*x3y*x5y*x6y^2 - 6521616*x2x*x6x*x6y^2 - 1905200832*x2y^4*x3x*x3y*x6y + 33006528*x2y^4*x3y*x4x*x5y + 166537152*x2y^3*x3x^2*x4x*x4y - 4132585536*x2y^3*x3x*x3y*x4y*x6y + 1996111440*x2y^3*x3x*x5y*x6x + 983062848*x2y^3*x3y*x4x*x6x^2 - 1305866976*x2y^3*x4x*x6x*x6y - 1780351160*x2y^2*x3x^2*x3y*x4y + 3240315864*x2y^2*x3x*x3y^2*x4x + 128483712*x2y^2*x3x*x3y*x5y*x6y^2 + 1905200832*x2y^2*x3x*x3y*x6y + 61858368*x2y^2*x3x*x5y*x6x*x6y + 160894080*x2y^2*x3y^2*x4y^2*x6x - 33006528*x2y^2*x3y*x4x*x5y + 1710426262*x2y^2*x3y*x4y + 2917210528*x2y^2*x4x - 166537152*x2y*x3x^2*x4x*x4y + 4132585536*x2y*x3x*x3y*x4y*x6y - 1996111440*x2y*x3x*x5y*x6x - 983062848*x2y*x3y*x4x*x6x^2 + 1305866976*x2y*x4x*x6x*x6y + 1780351160*x3x^2*x3y*x4y - 3240315864*x3x*x3y^2*x4x - 128483712*x3x*x3y*x5y*x6y^2 - 61858368*x3x*x5y*x6x*x6y - 160894080*x3y^2*x4y^2*x6x - 1710426262*x3y*x4y - 2917210528*x4x = 0 := by
  linear_combination (norm := ring_nf) (-120868416*x2x*x2y^2*x3y*x5y*x6x + 113559552*x2x*x2y*x3y^3*x6x + 502141780*x2x*x2y*x4x^2*x6y - 60613200*x2x*x3x*x4x^2 - 278879904*x2x*x3y^2*x4y*x6y + 64241856*x2x*x3y*x5y*x6y^2 - 6521616*x2x*x6x*x6y^2 + 1905200832*x2y^2*x3x*x3y*x6y - 33006528*x2y^2*x3y*x4x*x5y - 166537152*x2y*x3x^2*x4x*x4y + 4132585536*x2y*x3x*x3y*x4y*x6y - 1996111440*x2y*x3x*x5y*x6x - 983062848*x2y*x3y*x4x*x6x^2 + 1305866976*x2y*x4x*x6x*x6y + 1780351160*x3x^2*x3y*x4y - 3240315864*x3x*x3y^2*x4x - 128483712*x3x*x3y*x5y*x6y^2 - 61858368*x3x*x5y*x6x*x6y - 160894080*x3y^2*x4y^2*x6x - 1710426262*x3y*x4y - 2917210528*x4x) * hp1

end EqualityCore
end Census554
end Problem97
