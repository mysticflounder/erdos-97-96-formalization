/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Mathlib

/-!
# Shard 15 UNIT certificate summand 1 part 5

Generated exact rational certificate module.
-/

set_option linter.style.longLine false
set_option maxRecDepth 100000
-- Exact certificate normalization needs extended heartbeats.
set_option maxHeartbeats 24000000

namespace Problem97
namespace Census554
namespace EqualityCore

/-- Exact part 5 of polynomial generator 1. -/
theorem normalizedSevenPointSixCircleBUnitSummand01Part05
    (x2x x2y x3x x3y x4x x4y x5x x5y x6x x6y : ℝ)
    (hp1 : -x2x^2-x2y^2+1 = 0)
    : 786475008*x2x^3*x2y^2*x3y*x6x*x6y - 2026069248*x2x^3*x2y*x3y^2*x4y + 578876928*x2x^3*x2y*x4x*x6x*x6y - 2828642114*x2x^3*x3x*x4x*x6x + 128483712*x2x^3*x3y^2*x5y*x6y - 239141952*x2x^3*x3y*x5y + 1357535188*x2x^3*x6y^2 - 380915380*x2x^2*x2y^2*x3x*x4x^2 - 2026069248*x2x^2*x2y^2*x3y*x4y*x6x + 66013056*x2x^2*x2y*x3x^2*x4x*x5y - 256967424*x2x^2*x2y*x3x*x3y*x5y*x6x*x6y - 473129280*x2x^2*x2y*x3x*x5y*x6y^2 + 2151326636*x2x^2*x2y*x3y*x4x*x6x + 176728162*x2x^2*x2y*x4x*x6y - 128483712*x2x^2*x3x^2*x3y*x5y*x6x - 557759808*x2x^2*x3x*x3y^2*x4y*x6y + 406389888*x2x^2*x3x*x3y*x5y - 2644819744*x2x^2*x3x*x5y*x6y - 40223520*x2x^2*x3y^2*x4y^2 - 26086464*x2x^2*x3y*x5y*x6x^3 + 162386784*x2x^2*x4y^2*x6x + 786475008*x2x*x2y^4*x3y*x6x*x6y - 2026069248*x2x*x2y^3*x3y^2*x4y + 578876928*x2x*x2y^3*x4x*x6x*x6y - 2828642114*x2x*x2y^2*x3x*x4x*x6x + 128483712*x2x*x2y^2*x3y^2*x5y*x6y - 239141952*x2x*x2y^2*x3y*x5y - 786475008*x2x*x2y^2*x3y*x6x*x6y + 1357535188*x2x*x2y^2*x6y^2 + 2026069248*x2x*x2y*x3y^2*x4y - 578876928*x2x*x2y*x4x*x6x*x6y + 2828642114*x2x*x3x*x4x*x6x - 128483712*x2x*x3y^2*x5y*x6y + 239141952*x2x*x3y*x5y - 1357535188*x2x*x6y^2 - 380915380*x2y^4*x3x*x4x^2 - 2026069248*x2y^4*x3y*x4y*x6x + 66013056*x2y^3*x3x^2*x4x*x5y - 256967424*x2y^3*x3x*x3y*x5y*x6x*x6y - 473129280*x2y^3*x3x*x5y*x6y^2 + 2151326636*x2y^3*x3y*x4x*x6x + 176728162*x2y^3*x4x*x6y - 128483712*x2y^2*x3x^2*x3y*x5y*x6x - 557759808*x2y^2*x3x*x3y^2*x4y*x6y + 406389888*x2y^2*x3x*x3y*x5y + 380915380*x2y^2*x3x*x4x^2 - 2644819744*x2y^2*x3x*x5y*x6y - 40223520*x2y^2*x3y^2*x4y^2 + 2026069248*x2y^2*x3y*x4y*x6x - 26086464*x2y^2*x3y*x5y*x6x^3 + 162386784*x2y^2*x4y^2*x6x - 66013056*x2y*x3x^2*x4x*x5y + 256967424*x2y*x3x*x3y*x5y*x6x*x6y + 473129280*x2y*x3x*x5y*x6y^2 - 2151326636*x2y*x3y*x4x*x6x - 176728162*x2y*x4x*x6y + 128483712*x3x^2*x3y*x5y*x6x + 557759808*x3x*x3y^2*x4y*x6y - 406389888*x3x*x3y*x5y + 2644819744*x3x*x5y*x6y + 40223520*x3y^2*x4y^2 + 26086464*x3y*x5y*x6x^3 - 162386784*x4y^2*x6x = 0 := by
  linear_combination (norm := ring_nf) (-786475008*x2x*x2y^2*x3y*x6x*x6y + 2026069248*x2x*x2y*x3y^2*x4y - 578876928*x2x*x2y*x4x*x6x*x6y + 2828642114*x2x*x3x*x4x*x6x - 128483712*x2x*x3y^2*x5y*x6y + 239141952*x2x*x3y*x5y - 1357535188*x2x*x6y^2 + 380915380*x2y^2*x3x*x4x^2 + 2026069248*x2y^2*x3y*x4y*x6x - 66013056*x2y*x3x^2*x4x*x5y + 256967424*x2y*x3x*x3y*x5y*x6x*x6y + 473129280*x2y*x3x*x5y*x6y^2 - 2151326636*x2y*x3y*x4x*x6x - 176728162*x2y*x4x*x6y + 128483712*x3x^2*x3y*x5y*x6x + 557759808*x3x*x3y^2*x4y*x6y - 406389888*x3x*x3y*x5y + 2644819744*x3x*x5y*x6y + 40223520*x3y^2*x4y^2 + 26086464*x3y*x5y*x6x^3 - 162386784*x4y^2*x6x) * hp1

end EqualityCore
end Census554
end Problem97
