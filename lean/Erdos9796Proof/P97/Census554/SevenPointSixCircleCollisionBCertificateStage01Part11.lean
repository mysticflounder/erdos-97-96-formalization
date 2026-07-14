/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Mathlib

/-!
# Shard 15 UNIT certificate summand 1 part 11

Generated exact rational certificate module.
-/

set_option linter.style.longLine false
set_option maxRecDepth 100000
-- Exact certificate normalization needs extended heartbeats.
set_option maxHeartbeats 24000000

namespace Problem97
namespace Census554
namespace EqualityCore

/-- Exact part 11 of polynomial generator 1. -/
theorem normalizedSevenPointSixCircleBUnitSummand01Part11
    (x2x x2y x3x x3y x4x x4y x5x x5y x6x x6y : ℝ)
    (hp1 : -x2x^2-x2y^2+1 = 0)
    : -3596015200*x2x^3*x2y*x3x*x3y - 86877022*x2x^3*x2y*x3y*x4x - 154952928*x2x^3*x3x*x3y^2*x6x + 1725876438*x2x^3*x3x*x6x - 27884736*x2x^3*x3y*x4x*x5y*x6x + 1595305440*x2x^3*x4x*x6y^2 + 120868416*x2x^2*x2y^3*x5y*x6x^2 + 623232576*x2x^2*x2y^2*x3x*x5y*x6y + 502141780*x2x^2*x2y^2*x4x^2*x6x - 4217408624*x2x^2*x2y*x3x^2*x6y + 1004283560*x2x^2*x2y*x3x*x4x^2*x6y + 1579487424*x2x^2*x2y*x3y^3 - 1471869520*x2x^2*x2y*x3y*x6x^2 - 346957776*x2x^2*x2y*x5y*x6x - 191352960*x2x^2*x3x^2*x4y^2 + 38873088*x2x^2*x3x*x3y*x4x^2*x6y - 381994848*x2x^2*x3x*x4x*x6x - 796508608*x2x^2*x3y^4 + 519662548*x2x^2*x3y*x4x*x4y*x6x - 233901172*x2x^2*x3y*x6y + 187123356*x2x^2*x4y*x6y - 3596015200*x2x*x2y^3*x3x*x3y - 86877022*x2x*x2y^3*x3y*x4x - 154952928*x2x*x2y^2*x3x*x3y^2*x6x + 1725876438*x2x*x2y^2*x3x*x6x - 27884736*x2x*x2y^2*x3y*x4x*x5y*x6x + 1595305440*x2x*x2y^2*x4x*x6y^2 + 3596015200*x2x*x2y*x3x*x3y + 86877022*x2x*x2y*x3y*x4x + 154952928*x2x*x3x*x3y^2*x6x - 1725876438*x2x*x3x*x6x + 27884736*x2x*x3y*x4x*x5y*x6x - 1595305440*x2x*x4x*x6y^2 + 120868416*x2y^5*x5y*x6x^2 + 623232576*x2y^4*x3x*x5y*x6y + 502141780*x2y^4*x4x^2*x6x - 4217408624*x2y^3*x3x^2*x6y + 1004283560*x2y^3*x3x*x4x^2*x6y + 1579487424*x2y^3*x3y^3 - 1471869520*x2y^3*x3y*x6x^2 - 120868416*x2y^3*x5y*x6x^2 - 346957776*x2y^3*x5y*x6x - 191352960*x2y^2*x3x^2*x4y^2 + 38873088*x2y^2*x3x*x3y*x4x^2*x6y - 381994848*x2y^2*x3x*x4x*x6x - 623232576*x2y^2*x3x*x5y*x6y - 796508608*x2y^2*x3y^4 + 519662548*x2y^2*x3y*x4x*x4y*x6x - 233901172*x2y^2*x3y*x6y - 502141780*x2y^2*x4x^2*x6x + 187123356*x2y^2*x4y*x6y + 4217408624*x2y*x3x^2*x6y - 1004283560*x2y*x3x*x4x^2*x6y - 1579487424*x2y*x3y^3 + 1471869520*x2y*x3y*x6x^2 + 346957776*x2y*x5y*x6x + 191352960*x3x^2*x4y^2 - 38873088*x3x*x3y*x4x^2*x6y + 381994848*x3x*x4x*x6x + 796508608*x3y^4 - 519662548*x3y*x4x*x4y*x6x + 233901172*x3y*x6y - 187123356*x4y*x6y = 0 := by
  linear_combination (norm := ring_nf) (3596015200*x2x*x2y*x3x*x3y + 86877022*x2x*x2y*x3y*x4x + 154952928*x2x*x3x*x3y^2*x6x - 1725876438*x2x*x3x*x6x + 27884736*x2x*x3y*x4x*x5y*x6x - 1595305440*x2x*x4x*x6y^2 - 120868416*x2y^3*x5y*x6x^2 - 623232576*x2y^2*x3x*x5y*x6y - 502141780*x2y^2*x4x^2*x6x + 4217408624*x2y*x3x^2*x6y - 1004283560*x2y*x3x*x4x^2*x6y - 1579487424*x2y*x3y^3 + 1471869520*x2y*x3y*x6x^2 + 346957776*x2y*x5y*x6x + 191352960*x3x^2*x4y^2 - 38873088*x3x*x3y*x4x^2*x6y + 381994848*x3x*x4x*x6x + 796508608*x3y^4 - 519662548*x3y*x4x*x4y*x6x + 233901172*x3y*x6y - 187123356*x4y*x6y) * hp1

end EqualityCore
end Census554
end Problem97
