/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Mathlib

/-!
# Shard 15 UNIT certificate summand 1 part 7

Generated exact rational certificate module.
-/

set_option linter.style.longLine false
set_option maxRecDepth 100000
-- Exact certificate normalization needs extended heartbeats.
set_option maxHeartbeats 24000000

namespace Problem97
namespace Census554
namespace EqualityCore

/-- Exact part 7 of polynomial generator 1. -/
theorem normalizedSevenPointSixCircleBUnitSummand01Part07
    (x2x x2y x3x x3y x4x x4y x5x x5y x6x x6y : ℝ)
    (hp1 : -x2x^2-x2y^2+1 = 0)
    : -120868416*x2x^3*x2y^2*x5y*x6x*x6y + 113559552*x2x^3*x2y*x3y^2*x6x*x6y + 236564640*x2x^3*x2y*x5y*x6y^2 + 95676480*x2x^3*x3x*x4y^2 - 104490432*x2x^3*x3y^2*x6y^2 - 1059000274*x2x^3*x3y*x6y + 786475008*x2x^2*x2y^3*x3x*x3y*x6x - 392719298*x2x^2*x2y^2*x3x*x4x - 370220544*x2x^2*x2y^2*x3y*x5y*x6x^2 - 1033444512*x2x^2*x2y*x3x^2*x4y - 6077782320*x2x^2*x2y*x3x*x3y*x6x^2 + 3774865136*x2x^2*x2y*x3x*x6x*x6y - 80447040*x2x^2*x2y*x3y*x4y^2*x6x + 409661712*x2x^2*x2y*x4y*x6x - 3033164144*x2x^2*x3x^2*x3y*x6y - 199767168*x2x^2*x3x*x3y^2*x6x^2 + 747755432*x2x^2*x3x*x3y*x6y - 13043232*x2x^2*x3x*x6x*x6y^2 + 130429280*x2x^2*x3y^2*x6x^2 + 160710336*x2x^2*x3y*x5y*x6x - 13942368*x2x^2*x4y*x5y*x6x^2 - 120868416*x2x*x2y^4*x5y*x6x*x6y + 113559552*x2x*x2y^3*x3y^2*x6x*x6y + 236564640*x2x*x2y^3*x5y*x6y^2 + 95676480*x2x*x2y^2*x3x*x4y^2 - 104490432*x2x*x2y^2*x3y^2*x6y^2 - 1059000274*x2x*x2y^2*x3y*x6y + 120868416*x2x*x2y^2*x5y*x6x*x6y - 113559552*x2x*x2y*x3y^2*x6x*x6y - 236564640*x2x*x2y*x5y*x6y^2 - 95676480*x2x*x3x*x4y^2 + 104490432*x2x*x3y^2*x6y^2 + 1059000274*x2x*x3y*x6y + 786475008*x2y^5*x3x*x3y*x6x - 392719298*x2y^4*x3x*x4x - 370220544*x2y^4*x3y*x5y*x6x^2 - 1033444512*x2y^3*x3x^2*x4y - 6077782320*x2y^3*x3x*x3y*x6x^2 - 786475008*x2y^3*x3x*x3y*x6x + 3774865136*x2y^3*x3x*x6x*x6y - 80447040*x2y^3*x3y*x4y^2*x6x + 409661712*x2y^3*x4y*x6x - 3033164144*x2y^2*x3x^2*x3y*x6y - 199767168*x2y^2*x3x*x3y^2*x6x^2 + 747755432*x2y^2*x3x*x3y*x6y + 392719298*x2y^2*x3x*x4x - 13043232*x2y^2*x3x*x6x*x6y^2 + 130429280*x2y^2*x3y^2*x6x^2 + 370220544*x2y^2*x3y*x5y*x6x^2 + 160710336*x2y^2*x3y*x5y*x6x - 13942368*x2y^2*x4y*x5y*x6x^2 + 1033444512*x2y*x3x^2*x4y + 6077782320*x2y*x3x*x3y*x6x^2 - 3774865136*x2y*x3x*x6x*x6y + 80447040*x2y*x3y*x4y^2*x6x - 409661712*x2y*x4y*x6x + 3033164144*x3x^2*x3y*x6y + 199767168*x3x*x3y^2*x6x^2 - 747755432*x3x*x3y*x6y + 13043232*x3x*x6x*x6y^2 - 130429280*x3y^2*x6x^2 - 160710336*x3y*x5y*x6x + 13942368*x4y*x5y*x6x^2 = 0 := by
  linear_combination (norm := ring_nf) (120868416*x2x*x2y^2*x5y*x6x*x6y - 113559552*x2x*x2y*x3y^2*x6x*x6y - 236564640*x2x*x2y*x5y*x6y^2 - 95676480*x2x*x3x*x4y^2 + 104490432*x2x*x3y^2*x6y^2 + 1059000274*x2x*x3y*x6y - 786475008*x2y^3*x3x*x3y*x6x + 392719298*x2y^2*x3x*x4x + 370220544*x2y^2*x3y*x5y*x6x^2 + 1033444512*x2y*x3x^2*x4y + 6077782320*x2y*x3x*x3y*x6x^2 - 3774865136*x2y*x3x*x6x*x6y + 80447040*x2y*x3y*x4y^2*x6x - 409661712*x2y*x4y*x6x + 3033164144*x3x^2*x3y*x6y + 199767168*x3x*x3y^2*x6x^2 - 747755432*x3x*x3y*x6y + 13043232*x3x*x6x*x6y^2 - 130429280*x3y^2*x6x^2 - 160710336*x3y*x5y*x6x + 13942368*x4y*x5y*x6x^2) * hp1

end EqualityCore
end Census554
end Problem97
