/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Mathlib

/-!
# Shard 15 UNIT certificate summand 1 part 9

Generated exact rational certificate module.
-/

set_option linter.style.longLine false
set_option maxRecDepth 100000
-- Exact certificate normalization needs extended heartbeats.
set_option maxHeartbeats 24000000

namespace Problem97
namespace Census554
namespace EqualityCore

/-- Exact part 9 of polynomial generator 1. -/
theorem normalizedSevenPointSixCircleBUnitSummand01Part09
    (x2x x2y x3x x3y x4x x4y x5x x5y x6x x6y : ℝ)
    (hp1 : -x2x^2-x2y^2+1 = 0)
    : 289438464*x2x^3*x2y*x3x*x3y*x4x + 623368180*x2x^3*x2y*x3y*x4x^2 + 452999102*x2x^3*x2y*x6y + 140817984*x2x^3*x3x*x4y*x6y - 19436544*x2x^3*x3y*x4x^2*x6y + 27884736*x2x^3*x4x*x5y*x6x*x6y - 786475008*x2x^2*x2y^3*x3y*x6x^2 - 33006528*x2x^2*x2y^2*x3x*x4y*x5y + 60434208*x2x^2*x2y^2*x3y*x5y - 66013056*x2x^2*x2y*x3x^2*x5y + 6670067440*x2x^2*x2y*x3x*x3y*x6y^2 + 227119104*x2x^2*x2y*x3y^3*x6x^2 + 164186928*x2x^2*x2y*x3y*x4y*x5y + 13043232*x2x^2*x2y*x5y*x6x^3 + 5657284228*x2x^2*x3x^2*x4x*x6x + 208980864*x2x^2*x3x*x3y^2*x6y^2 - 55769472*x2x^2*x3x*x4x*x5y*x6x*x6y - 3512723096*x2x^2*x3x*x6y^2 + 1090040226*x2x^2*x3y^2 + 13043232*x2x^2*x3y*x6x^2*x6y + 45601416*x2x^2*x4y*x5y + 289438464*x2x*x2y^3*x3x*x3y*x4x + 623368180*x2x*x2y^3*x3y*x4x^2 + 452999102*x2x*x2y^3*x6y + 140817984*x2x*x2y^2*x3x*x4y*x6y - 19436544*x2x*x2y^2*x3y*x4x^2*x6y + 27884736*x2x*x2y^2*x4x*x5y*x6x*x6y - 289438464*x2x*x2y*x3x*x3y*x4x - 623368180*x2x*x2y*x3y*x4x^2 - 452999102*x2x*x2y*x6y - 140817984*x2x*x3x*x4y*x6y + 19436544*x2x*x3y*x4x^2*x6y - 27884736*x2x*x4x*x5y*x6x*x6y - 786475008*x2y^5*x3y*x6x^2 - 33006528*x2y^4*x3x*x4y*x5y + 60434208*x2y^4*x3y*x5y - 66013056*x2y^3*x3x^2*x5y + 6670067440*x2y^3*x3x*x3y*x6y^2 + 227119104*x2y^3*x3y^3*x6x^2 + 164186928*x2y^3*x3y*x4y*x5y + 786475008*x2y^3*x3y*x6x^2 + 13043232*x2y^3*x5y*x6x^3 + 5657284228*x2y^2*x3x^2*x4x*x6x + 208980864*x2y^2*x3x*x3y^2*x6y^2 - 55769472*x2y^2*x3x*x4x*x5y*x6x*x6y + 33006528*x2y^2*x3x*x4y*x5y - 3512723096*x2y^2*x3x*x6y^2 + 1090040226*x2y^2*x3y^2 - 60434208*x2y^2*x3y*x5y + 13043232*x2y^2*x3y*x6x^2*x6y + 45601416*x2y^2*x4y*x5y + 66013056*x2y*x3x^2*x5y - 6670067440*x2y*x3x*x3y*x6y^2 - 227119104*x2y*x3y^3*x6x^2 - 164186928*x2y*x3y*x4y*x5y - 13043232*x2y*x5y*x6x^3 - 5657284228*x3x^2*x4x*x6x - 208980864*x3x*x3y^2*x6y^2 + 55769472*x3x*x4x*x5y*x6x*x6y + 3512723096*x3x*x6y^2 - 1090040226*x3y^2 - 13043232*x3y*x6x^2*x6y - 45601416*x4y*x5y = 0 := by
  linear_combination (norm := ring_nf) (-289438464*x2x*x2y*x3x*x3y*x4x - 623368180*x2x*x2y*x3y*x4x^2 - 452999102*x2x*x2y*x6y - 140817984*x2x*x3x*x4y*x6y + 19436544*x2x*x3y*x4x^2*x6y - 27884736*x2x*x4x*x5y*x6x*x6y + 786475008*x2y^3*x3y*x6x^2 + 33006528*x2y^2*x3x*x4y*x5y - 60434208*x2y^2*x3y*x5y + 66013056*x2y*x3x^2*x5y - 6670067440*x2y*x3x*x3y*x6y^2 - 227119104*x2y*x3y^3*x6x^2 - 164186928*x2y*x3y*x4y*x5y - 13043232*x2y*x5y*x6x^3 - 5657284228*x3x^2*x4x*x6x - 208980864*x3x*x3y^2*x6y^2 + 55769472*x3x*x4x*x5y*x6x*x6y + 3512723096*x3x*x6y^2 - 1090040226*x3y^2 - 13043232*x3y*x6x^2*x6y - 45601416*x4y*x5y) * hp1

end EqualityCore
end Census554
end Problem97
