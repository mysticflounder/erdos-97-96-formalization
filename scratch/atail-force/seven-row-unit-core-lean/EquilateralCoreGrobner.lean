/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Mathlib

/-!
Scratch check for the residual equality ideal after using the equilateral
anchor vectors as a basis.  Their Gram form is `a² + a*b + b²`.
-/

namespace Problem97.ATailSevenRowScratch

set_option maxHeartbeats 20000000 in
set_option maxRecDepth 100000 in
theorem equilateralCoreIncompatible
    (a3 b3 a5 b5 a6 b6 a7 b7 a8 b8 a9 b9 a10 b10 a11 b11 : ℝ)
    (h01 : -a6^2-a6*b6+2*a6-b6^2+b6 = 0)
    (h02 : -a7^2-a7*b7+2*a7-b7^2+b7 = 0)
    (h03 : -a9^2-a9*b9+a9-b9^2+2*b9 = 0)
    (h04 : -a10^2-a10*b10+a10-b10^2+2*b10 = 0)
    (h05 : -a5^2-a5*b5+2*a5*a7+a5*b7-b5^2+b5*a7+2*b5*b7-a7-2*b7+1 = 0)
    (h06 : 2*a7*a9+a7*b9-a7+b7*a9+2*b7*b9-2*b7-a9^2-a9*b9-b9^2+1 = 0)
    (h07 : 2*a7*a11+a7*b11-a7+b7*a11+2*b7*b11-2*b7-a11^2-a11*b11-b11^2+1 = 0)
    (h08 : -a3^2-a3*b3+2*a3*a8+a3*b8-b3^2+b3*a8+2*b3*b8 = 0)
    (h09 : -a5^2-a5*b5+2*a5*a8+a5*b8-b5^2+b5*a8+2*b5*b8 = 0)
    (h10 : -a7^2-a7*b7+2*a7*a8+a7*b8-b7^2+b7*a8+2*b7*b8 = 0)
    (h11 : a3^2+a3*b3-2*a3*a9-a3*b9+b3^2-b3*a9-2*b3*b9-a6^2-a6*b6+2*a6*a9+a6*b9-b6^2+b6*a9+2*b6*b9 = 0)
    (h12 : a3^2+a3*b3-2*a3*a9-a3*b9+b3^2-b3*a9-2*b3*b9-a8^2-a8*b8+2*a8*a9+a8*b9-b8^2+b8*a9+2*b8*b9 = 0)
    (h13 : a3^2+a3*b3-2*a3*a9-a3*b9+b3^2-b3*a9-2*b3*b9+2*a9*a11+a9*b11+b9*a11+2*b9*b11-a11^2-a11*b11-b11^2 = 0)
    (h14 : -a7^2-a7*b7+2*a7*a10+a7*b10-b7^2+b7*a10+2*b7*b10-2*a10-b10+1 = 0)
    (h15 : -a8^2-a8*b8+2*a8*a10+a8*b10-b8^2+b8*a10+2*b8*b10-2*a10-b10+1 = 0)
    (h16 : -a9^2-a9*b9+2*a9*a10+a9*b10-b9^2+b9*a10+2*b9*b10-2*a10-b10+1 = 0)
    (h17 : -a5^2-a5*b5+2*a5*a11+a5*b11-b5^2+b5*a11+2*b5*b11-2*a11-b11+1 = 0)
    (h18 : -a6^2-a6*b6+2*a6*a11+a6*b11-b6^2+b6*a11+2*b6*b11-2*a11-b11+1 = 0)
    (h19 : -a10^2-a10*b10+2*a10*a11+a10*b11-b10^2+b10*a11+2*b10*b11-2*a11-b11+1 = 0) : False := by
  grobner (ringSteps := 1000000)

#print axioms equilateralCoreIncompatible

end Problem97.ATailSevenRowScratch
