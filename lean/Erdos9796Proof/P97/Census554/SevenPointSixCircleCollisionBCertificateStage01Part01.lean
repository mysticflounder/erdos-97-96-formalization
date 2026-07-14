/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Mathlib

/-!
# Shard 15 UNIT certificate summand 1 part 1

Generated exact rational certificate module.
-/

set_option linter.style.longLine false
set_option maxRecDepth 100000
-- Exact certificate normalization needs extended heartbeats.
set_option maxHeartbeats 24000000

namespace Problem97
namespace Census554
namespace EqualityCore

/-- Exact part 1 of polynomial generator 1. -/
theorem normalizedSevenPointSixCircleBUnitSummand01Part01
    (x2x x2y x3x x3y x4x x4y x5x x5y x6x x6y : ℝ)
    (hp1 : -x2x^2-x2y^2+1 = 0)
    : -60434208*x2x^3*x2y^2*x3x*x6x - 767757024*x2x^3*x2y*x3x*x5y + 564393648*x2x^3*x2y*x3y*x6x - 64241856*x2x^3*x3x*x3y*x5y - 174691008*x2x^3*x3y^2*x4x*x6x + 2118752650*x2x^3*x3y*x4y - 13043232*x2x^3*x5y*x6x^2*x6y + 2026069248*x2x^2*x2y^2*x3x*x3y*x4y - 1308964472*x2x^2*x2y^2*x3y^2*x6x + 19436544*x2x^2*x2y*x3x^2*x3y*x4x - 2683300404*x2x^2*x2y*x3x*x3y*x4x - 2841847416*x2x^2*x2y*x3x*x4y*x6x - 6565577008*x2x^2*x2y*x3y^2*x6x*x6y - 27884736*x2x^2*x2y*x4x*x5y*x6x^2 - 796508608*x2x^2*x3x^2*x3y^2 + 4364083596*x2x^2*x3x^2 + 4528234160*x2x^2*x3x*x3y*x4y*x6x + 2921510400*x2x^2*x3x*x4y*x6x*x6y + 349382016*x2x^2*x3y^2*x4x*x6x^2 - 1574757024*x2x^2*x3y*x4x*x6y + 760060608*x2x^2*x4x*x6x^2 - 2018921375*x2x^2 - 60434208*x2x*x2y^4*x3x*x6x - 767757024*x2x*x2y^3*x3x*x5y + 564393648*x2x*x2y^3*x3y*x6x - 64241856*x2x*x2y^2*x3x*x3y*x5y + 60434208*x2x*x2y^2*x3x*x6x - 174691008*x2x*x2y^2*x3y^2*x4x*x6x + 2118752650*x2x*x2y^2*x3y*x4y - 13043232*x2x*x2y^2*x5y*x6x^2*x6y + 767757024*x2x*x2y*x3x*x5y - 564393648*x2x*x2y*x3y*x6x + 64241856*x2x*x3x*x3y*x5y + 174691008*x2x*x3y^2*x4x*x6x - 2118752650*x2x*x3y*x4y + 13043232*x2x*x5y*x6x^2*x6y + 2026069248*x2y^4*x3x*x3y*x4y - 1308964472*x2y^4*x3y^2*x6x + 19436544*x2y^3*x3x^2*x3y*x4x - 2683300404*x2y^3*x3x*x3y*x4x - 2841847416*x2y^3*x3x*x4y*x6x - 6565577008*x2y^3*x3y^2*x6x*x6y - 27884736*x2y^3*x4x*x5y*x6x^2 - 796508608*x2y^2*x3x^2*x3y^2 + 4364083596*x2y^2*x3x^2 + 4528234160*x2y^2*x3x*x3y*x4y*x6x - 2026069248*x2y^2*x3x*x3y*x4y + 2921510400*x2y^2*x3x*x4y*x6x*x6y + 349382016*x2y^2*x3y^2*x4x*x6x^2 + 1308964472*x2y^2*x3y^2*x6x - 1574757024*x2y^2*x3y*x4x*x6y + 760060608*x2y^2*x4x*x6x^2 - 2018921375*x2y^2 - 19436544*x2y*x3x^2*x3y*x4x + 2683300404*x2y*x3x*x3y*x4x + 2841847416*x2y*x3x*x4y*x6x + 6565577008*x2y*x3y^2*x6x*x6y + 27884736*x2y*x4x*x5y*x6x^2 + 796508608*x3x^2*x3y^2 - 4364083596*x3x^2 - 4528234160*x3x*x3y*x4y*x6x - 2921510400*x3x*x4y*x6x*x6y - 349382016*x3y^2*x4x*x6x^2 + 1574757024*x3y*x4x*x6y - 760060608*x4x*x6x^2 + 2018921375 = 0 := by
  linear_combination (norm := ring_nf) (60434208*x2x*x2y^2*x3x*x6x + 767757024*x2x*x2y*x3x*x5y - 564393648*x2x*x2y*x3y*x6x + 64241856*x2x*x3x*x3y*x5y + 174691008*x2x*x3y^2*x4x*x6x - 2118752650*x2x*x3y*x4y + 13043232*x2x*x5y*x6x^2*x6y - 2026069248*x2y^2*x3x*x3y*x4y + 1308964472*x2y^2*x3y^2*x6x - 19436544*x2y*x3x^2*x3y*x4x + 2683300404*x2y*x3x*x3y*x4x + 2841847416*x2y*x3x*x4y*x6x + 6565577008*x2y*x3y^2*x6x*x6y + 27884736*x2y*x4x*x5y*x6x^2 + 796508608*x3x^2*x3y^2 - 4364083596*x3x^2 - 4528234160*x3x*x3y*x4y*x6x - 2921510400*x3x*x4y*x6x*x6y - 349382016*x3y^2*x4x*x6x^2 + 1574757024*x3y*x4x*x6y - 760060608*x4x*x6x^2 + 2018921375) * hp1

end EqualityCore
end Census554
end Problem97
