/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Mathlib

/-!
# Shard 15 UNIT certificate summand 1 part 10

Generated exact rational certificate module.
-/

set_option linter.style.longLine false
set_option maxRecDepth 100000
-- Exact certificate normalization needs extended heartbeats.
set_option maxHeartbeats 24000000

namespace Problem97
namespace Census554
namespace EqualityCore

/-- Exact part 10 of polynomial generator 1. -/
theorem normalizedSevenPointSixCircleBUnitSummand01Part10
    (x2x x2y x3x x3y x4x x4y x5x x5y x6x x6y : ℝ)
    (hp1 : -x2x^2-x2y^2+1 = 0)
    : 4397797424*x2x^3*x2y*x3x*x3y*x6x - 578876928*x2x^3*x2y*x3y*x4x*x6x - 19436544*x2x^3*x3x*x3y^2*x4x + 1454233584*x2x^3*x3x*x6x^2 - 290035418*x2x^3*x3y*x4x*x4y - 137306304*x2x^3*x4x*x5y*x6y + 60434208*x2x^2*x2y^3*x3y*x6x + 241736832*x2x^2*x2y^2*x3x*x5y*x6x*x6y + 3455902136*x2x^2*x2y^2*x3y*x6x*x6y + 6177665904*x2x^2*x2y*x3x^2*x6x*x6y - 1319669104*x2x^2*x2y*x3x*x3y + 254836512*x2x^2*x2y*x3y^3*x6x + 537371136*x2x^2*x2y*x3y*x5y*x6x*x6y - 82968048*x2x^2*x2y*x5y*x6x^2 - 2964635400*x2x^2*x3x^2*x4x - 1335682360*x2x^2*x3x*x3y^2 + 274612608*x2x^2*x3x*x4x*x5y*x6y - 2749355869*x2x^2*x3x - 9718272*x2x^2*x3y*x4x^2*x6y + 283716288*x2x^2*x3y*x6x*x6y - 797652720*x2x^2*x4y*x6x*x6y + 4397797424*x2x*x2y^3*x3x*x3y*x6x - 578876928*x2x*x2y^3*x3y*x4x*x6x - 19436544*x2x*x2y^2*x3x*x3y^2*x4x + 1454233584*x2x*x2y^2*x3x*x6x^2 - 290035418*x2x*x2y^2*x3y*x4x*x4y - 137306304*x2x*x2y^2*x4x*x5y*x6y - 4397797424*x2x*x2y*x3x*x3y*x6x + 578876928*x2x*x2y*x3y*x4x*x6x + 19436544*x2x*x3x*x3y^2*x4x - 1454233584*x2x*x3x*x6x^2 + 290035418*x2x*x3y*x4x*x4y + 137306304*x2x*x4x*x5y*x6y + 60434208*x2y^5*x3y*x6x + 241736832*x2y^4*x3x*x5y*x6x*x6y + 3455902136*x2y^4*x3y*x6x*x6y + 6177665904*x2y^3*x3x^2*x6x*x6y - 1319669104*x2y^3*x3x*x3y + 254836512*x2y^3*x3y^3*x6x + 537371136*x2y^3*x3y*x5y*x6x*x6y - 60434208*x2y^3*x3y*x6x - 82968048*x2y^3*x5y*x6x^2 - 2964635400*x2y^2*x3x^2*x4x - 1335682360*x2y^2*x3x*x3y^2 + 274612608*x2y^2*x3x*x4x*x5y*x6y - 241736832*x2y^2*x3x*x5y*x6x*x6y - 2749355869*x2y^2*x3x - 9718272*x2y^2*x3y*x4x^2*x6y - 3172185848*x2y^2*x3y*x6x*x6y - 797652720*x2y^2*x4y*x6x*x6y - 6177665904*x2y*x3x^2*x6x*x6y + 1319669104*x2y*x3x*x3y - 254836512*x2y*x3y^3*x6x - 537371136*x2y*x3y*x5y*x6x*x6y + 82968048*x2y*x5y*x6x^2 + 2964635400*x3x^2*x4x + 1335682360*x3x*x3y^2 - 274612608*x3x*x4x*x5y*x6y + 2749355869*x3x + 9718272*x3y*x4x^2*x6y - 283716288*x3y*x6x*x6y + 797652720*x4y*x6x*x6y = 0 := by
  linear_combination (norm := ring_nf) (-4397797424*x2x*x2y*x3x*x3y*x6x + 578876928*x2x*x2y*x3y*x4x*x6x + 19436544*x2x*x3x*x3y^2*x4x - 1454233584*x2x*x3x*x6x^2 + 290035418*x2x*x3y*x4x*x4y + 137306304*x2x*x4x*x5y*x6y - 60434208*x2y^3*x3y*x6x - 241736832*x2y^2*x3x*x5y*x6x*x6y - 3455902136*x2y^2*x3y*x6x*x6y - 6177665904*x2y*x3x^2*x6x*x6y + 1319669104*x2y*x3x*x3y - 254836512*x2y*x3y^3*x6x - 537371136*x2y*x3y*x5y*x6x*x6y + 82968048*x2y*x5y*x6x^2 + 2964635400*x3x^2*x4x + 1335682360*x3x*x3y^2 - 274612608*x3x*x4x*x5y*x6y + 2749355869*x3x + 9718272*x3y*x4x^2*x6y - 283716288*x3y*x6x*x6y + 797652720*x4y*x6x*x6y) * hp1

end EqualityCore
end Census554
end Problem97
