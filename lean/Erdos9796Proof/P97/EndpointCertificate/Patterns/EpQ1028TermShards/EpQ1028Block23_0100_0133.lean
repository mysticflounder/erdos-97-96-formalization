/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q1_028, term block 23:100-133

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q1_028`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ1028TermShards

/-- Generator polynomial 23 for endpoint certificate `ep_Q1_028`. -/
def ep_Q1_028_generator_23_0100_0133 : Poly :=
[
  term (-2 : Rat) [(0, 1), (10, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (11, 1)],
  term (1 : Rat) [(1, 2)],
  term (2 : Rat) [(8, 1), (10, 1)],
  term (-1 : Rat) [(8, 2)],
  term (2 : Rat) [(9, 1), (11, 1)],
  term (-1 : Rat) [(9, 2)]
]

/-- Coefficient term 100 from coefficient polynomial 23. -/
def ep_Q1_028_coefficient_23_0100 : Poly :=
[
  term ((-64 : Rat) / 15) [(7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 100 for generator 23. -/
def ep_Q1_028_partial_23_0100 : Poly :=
[
  term ((128 : Rat) / 15) [(0, 1), (7, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-64 : Rat) / 15) [(0, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((128 : Rat) / 15) [(1, 1), (7, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-64 : Rat) / 15) [(1, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-128 : Rat) / 15) [(7, 1), (8, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((64 : Rat) / 15) [(7, 1), (8, 2), (12, 1), (15, 1), (16, 1)],
  term ((-128 : Rat) / 15) [(7, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((64 : Rat) / 15) [(7, 1), (9, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 23. -/
theorem ep_Q1_028_partial_23_0100_valid :
    mulPoly ep_Q1_028_coefficient_23_0100
        ep_Q1_028_generator_23_0100_0133 =
      ep_Q1_028_partial_23_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 23. -/
def ep_Q1_028_coefficient_23_0101 : Poly :=
[
  term ((-344 : Rat) / 15) [(7, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 101 for generator 23. -/
def ep_Q1_028_partial_23_0101 : Poly :=
[
  term ((688 : Rat) / 15) [(0, 1), (7, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-344 : Rat) / 15) [(0, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((688 : Rat) / 15) [(1, 1), (7, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-344 : Rat) / 15) [(1, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-688 : Rat) / 15) [(7, 1), (8, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((344 : Rat) / 15) [(7, 1), (8, 2), (13, 1), (15, 2), (16, 1)],
  term ((-688 : Rat) / 15) [(7, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((344 : Rat) / 15) [(7, 1), (9, 2), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 23. -/
theorem ep_Q1_028_partial_23_0101_valid :
    mulPoly ep_Q1_028_coefficient_23_0101
        ep_Q1_028_generator_23_0100_0133 =
      ep_Q1_028_partial_23_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 23. -/
def ep_Q1_028_coefficient_23_0102 : Poly :=
[
  term ((-4 : Rat) / 5) [(7, 1), (13, 1), (16, 1)]
]

/-- Partial product 102 for generator 23. -/
def ep_Q1_028_partial_23_0102 : Poly :=
[
  term ((8 : Rat) / 5) [(0, 1), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((-4 : Rat) / 5) [(0, 2), (7, 1), (13, 1), (16, 1)],
  term ((8 : Rat) / 5) [(1, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((-4 : Rat) / 5) [(1, 2), (7, 1), (13, 1), (16, 1)],
  term ((-8 : Rat) / 5) [(7, 1), (8, 1), (10, 1), (13, 1), (16, 1)],
  term ((4 : Rat) / 5) [(7, 1), (8, 2), (13, 1), (16, 1)],
  term ((-8 : Rat) / 5) [(7, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((4 : Rat) / 5) [(7, 1), (9, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 23. -/
theorem ep_Q1_028_partial_23_0102_valid :
    mulPoly ep_Q1_028_coefficient_23_0102
        ep_Q1_028_generator_23_0100_0133 =
      ep_Q1_028_partial_23_0102 := by
  native_decide

/-- Coefficient term 103 from coefficient polynomial 23. -/
def ep_Q1_028_coefficient_23_0103 : Poly :=
[
  term ((128 : Rat) / 15) [(7, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 103 for generator 23. -/
def ep_Q1_028_partial_23_0103 : Poly :=
[
  term ((-256 : Rat) / 15) [(0, 1), (7, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((128 : Rat) / 15) [(0, 2), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-256 : Rat) / 15) [(1, 1), (7, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((128 : Rat) / 15) [(1, 2), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((256 : Rat) / 15) [(7, 1), (8, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-128 : Rat) / 15) [(7, 1), (8, 2), (13, 2), (15, 1), (16, 1)],
  term ((256 : Rat) / 15) [(7, 1), (9, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-128 : Rat) / 15) [(7, 1), (9, 2), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 103 for generator 23. -/
theorem ep_Q1_028_partial_23_0103_valid :
    mulPoly ep_Q1_028_coefficient_23_0103
        ep_Q1_028_generator_23_0100_0133 =
      ep_Q1_028_partial_23_0103 := by
  native_decide

/-- Coefficient term 104 from coefficient polynomial 23. -/
def ep_Q1_028_coefficient_23_0104 : Poly :=
[
  term ((32 : Rat) / 15) [(7, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 104 for generator 23. -/
def ep_Q1_028_partial_23_0104 : Poly :=
[
  term ((-64 : Rat) / 15) [(0, 1), (7, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((32 : Rat) / 15) [(0, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-64 : Rat) / 15) [(1, 1), (7, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((32 : Rat) / 15) [(1, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((64 : Rat) / 15) [(7, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-32 : Rat) / 15) [(7, 1), (8, 2), (14, 1), (15, 1), (16, 1)],
  term ((64 : Rat) / 15) [(7, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-32 : Rat) / 15) [(7, 1), (9, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 104 for generator 23. -/
theorem ep_Q1_028_partial_23_0104_valid :
    mulPoly ep_Q1_028_coefficient_23_0104
        ep_Q1_028_generator_23_0100_0133 =
      ep_Q1_028_partial_23_0104 := by
  native_decide

/-- Coefficient term 105 from coefficient polynomial 23. -/
def ep_Q1_028_coefficient_23_0105 : Poly :=
[
  term ((242 : Rat) / 5) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 105 for generator 23. -/
def ep_Q1_028_partial_23_0105 : Poly :=
[
  term ((-484 : Rat) / 5) [(0, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((242 : Rat) / 5) [(0, 2), (7, 1), (15, 1), (16, 1)],
  term ((-484 : Rat) / 5) [(1, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((242 : Rat) / 5) [(1, 2), (7, 1), (15, 1), (16, 1)],
  term ((484 : Rat) / 5) [(7, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-242 : Rat) / 5) [(7, 1), (8, 2), (15, 1), (16, 1)],
  term ((484 : Rat) / 5) [(7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-242 : Rat) / 5) [(7, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 105 for generator 23. -/
theorem ep_Q1_028_partial_23_0105_valid :
    mulPoly ep_Q1_028_coefficient_23_0105
        ep_Q1_028_generator_23_0100_0133 =
      ep_Q1_028_partial_23_0105 := by
  native_decide

/-- Coefficient term 106 from coefficient polynomial 23. -/
def ep_Q1_028_coefficient_23_0106 : Poly :=
[
  term ((-104 : Rat) / 5) [(7, 1), (15, 3), (16, 1)]
]

/-- Partial product 106 for generator 23. -/
def ep_Q1_028_partial_23_0106 : Poly :=
[
  term ((208 : Rat) / 5) [(0, 1), (7, 1), (10, 1), (15, 3), (16, 1)],
  term ((-104 : Rat) / 5) [(0, 2), (7, 1), (15, 3), (16, 1)],
  term ((208 : Rat) / 5) [(1, 1), (7, 1), (11, 1), (15, 3), (16, 1)],
  term ((-104 : Rat) / 5) [(1, 2), (7, 1), (15, 3), (16, 1)],
  term ((-208 : Rat) / 5) [(7, 1), (8, 1), (10, 1), (15, 3), (16, 1)],
  term ((104 : Rat) / 5) [(7, 1), (8, 2), (15, 3), (16, 1)],
  term ((-208 : Rat) / 5) [(7, 1), (9, 1), (11, 1), (15, 3), (16, 1)],
  term ((104 : Rat) / 5) [(7, 1), (9, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 106 for generator 23. -/
theorem ep_Q1_028_partial_23_0106_valid :
    mulPoly ep_Q1_028_coefficient_23_0106
        ep_Q1_028_generator_23_0100_0133 =
      ep_Q1_028_partial_23_0106 := by
  native_decide

/-- Coefficient term 107 from coefficient polynomial 23. -/
def ep_Q1_028_coefficient_23_0107 : Poly :=
[
  term ((17864 : Rat) / 15) [(7, 2), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 107 for generator 23. -/
def ep_Q1_028_partial_23_0107 : Poly :=
[
  term ((-35728 : Rat) / 15) [(0, 1), (7, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((17864 : Rat) / 15) [(0, 2), (7, 2), (9, 1), (11, 1), (16, 1)],
  term ((-35728 : Rat) / 15) [(1, 1), (7, 2), (9, 1), (11, 2), (16, 1)],
  term ((17864 : Rat) / 15) [(1, 2), (7, 2), (9, 1), (11, 1), (16, 1)],
  term ((35728 : Rat) / 15) [(7, 2), (8, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-17864 : Rat) / 15) [(7, 2), (8, 2), (9, 1), (11, 1), (16, 1)],
  term ((35728 : Rat) / 15) [(7, 2), (9, 2), (11, 2), (16, 1)],
  term ((-17864 : Rat) / 15) [(7, 2), (9, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 107 for generator 23. -/
theorem ep_Q1_028_partial_23_0107_valid :
    mulPoly ep_Q1_028_coefficient_23_0107
        ep_Q1_028_generator_23_0100_0133 =
      ep_Q1_028_partial_23_0107 := by
  native_decide

/-- Coefficient term 108 from coefficient polynomial 23. -/
def ep_Q1_028_coefficient_23_0108 : Poly :=
[
  term ((7744 : Rat) / 15) [(7, 2), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 108 for generator 23. -/
def ep_Q1_028_partial_23_0108 : Poly :=
[
  term ((-15488 : Rat) / 15) [(0, 1), (7, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((7744 : Rat) / 15) [(0, 2), (7, 2), (9, 1), (13, 1), (16, 1)],
  term ((-15488 : Rat) / 15) [(1, 1), (7, 2), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((7744 : Rat) / 15) [(1, 2), (7, 2), (9, 1), (13, 1), (16, 1)],
  term ((15488 : Rat) / 15) [(7, 2), (8, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-7744 : Rat) / 15) [(7, 2), (8, 2), (9, 1), (13, 1), (16, 1)],
  term ((15488 : Rat) / 15) [(7, 2), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((-7744 : Rat) / 15) [(7, 2), (9, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 108 for generator 23. -/
theorem ep_Q1_028_partial_23_0108_valid :
    mulPoly ep_Q1_028_coefficient_23_0108
        ep_Q1_028_generator_23_0100_0133 =
      ep_Q1_028_partial_23_0108 := by
  native_decide

/-- Coefficient term 109 from coefficient polynomial 23. -/
def ep_Q1_028_coefficient_23_0109 : Poly :=
[
  term ((-1496 : Rat) / 5) [(7, 2), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 109 for generator 23. -/
def ep_Q1_028_partial_23_0109 : Poly :=
[
  term ((2992 : Rat) / 5) [(0, 1), (7, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-1496 : Rat) / 5) [(0, 2), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((2992 : Rat) / 5) [(1, 1), (7, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1496 : Rat) / 5) [(1, 2), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((-2992 : Rat) / 5) [(7, 2), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((1496 : Rat) / 5) [(7, 2), (8, 2), (9, 1), (15, 1), (16, 1)],
  term ((-2992 : Rat) / 5) [(7, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((1496 : Rat) / 5) [(7, 2), (9, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 109 for generator 23. -/
theorem ep_Q1_028_partial_23_0109_valid :
    mulPoly ep_Q1_028_coefficient_23_0109
        ep_Q1_028_generator_23_0100_0133 =
      ep_Q1_028_partial_23_0109 := by
  native_decide

/-- Coefficient term 110 from coefficient polynomial 23. -/
def ep_Q1_028_coefficient_23_0110 : Poly :=
[
  term ((-8624 : Rat) / 15) [(7, 2), (9, 2), (16, 1)]
]

/-- Partial product 110 for generator 23. -/
def ep_Q1_028_partial_23_0110 : Poly :=
[
  term ((17248 : Rat) / 15) [(0, 1), (7, 2), (9, 2), (10, 1), (16, 1)],
  term ((-8624 : Rat) / 15) [(0, 2), (7, 2), (9, 2), (16, 1)],
  term ((17248 : Rat) / 15) [(1, 1), (7, 2), (9, 2), (11, 1), (16, 1)],
  term ((-8624 : Rat) / 15) [(1, 2), (7, 2), (9, 2), (16, 1)],
  term ((-17248 : Rat) / 15) [(7, 2), (8, 1), (9, 2), (10, 1), (16, 1)],
  term ((8624 : Rat) / 15) [(7, 2), (8, 2), (9, 2), (16, 1)],
  term ((-17248 : Rat) / 15) [(7, 2), (9, 3), (11, 1), (16, 1)],
  term ((8624 : Rat) / 15) [(7, 2), (9, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 110 for generator 23. -/
theorem ep_Q1_028_partial_23_0110_valid :
    mulPoly ep_Q1_028_coefficient_23_0110
        ep_Q1_028_generator_23_0100_0133 =
      ep_Q1_028_partial_23_0110 := by
  native_decide

/-- Coefficient term 111 from coefficient polynomial 23. -/
def ep_Q1_028_coefficient_23_0111 : Poly :=
[
  term ((-88 : Rat) / 3) [(7, 2), (10, 1), (16, 1)]
]

/-- Partial product 111 for generator 23. -/
def ep_Q1_028_partial_23_0111 : Poly :=
[
  term ((176 : Rat) / 3) [(0, 1), (7, 2), (10, 2), (16, 1)],
  term ((-88 : Rat) / 3) [(0, 2), (7, 2), (10, 1), (16, 1)],
  term ((176 : Rat) / 3) [(1, 1), (7, 2), (10, 1), (11, 1), (16, 1)],
  term ((-88 : Rat) / 3) [(1, 2), (7, 2), (10, 1), (16, 1)],
  term ((-176 : Rat) / 3) [(7, 2), (8, 1), (10, 2), (16, 1)],
  term ((88 : Rat) / 3) [(7, 2), (8, 2), (10, 1), (16, 1)],
  term ((-176 : Rat) / 3) [(7, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((88 : Rat) / 3) [(7, 2), (9, 2), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 111 for generator 23. -/
theorem ep_Q1_028_partial_23_0111_valid :
    mulPoly ep_Q1_028_coefficient_23_0111
        ep_Q1_028_generator_23_0100_0133 =
      ep_Q1_028_partial_23_0111 := by
  native_decide

/-- Coefficient term 112 from coefficient polynomial 23. -/
def ep_Q1_028_coefficient_23_0112 : Poly :=
[
  term ((-6688 : Rat) / 15) [(7, 2), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 112 for generator 23. -/
def ep_Q1_028_partial_23_0112 : Poly :=
[
  term ((13376 : Rat) / 15) [(0, 1), (7, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-6688 : Rat) / 15) [(0, 2), (7, 2), (11, 1), (13, 1), (16, 1)],
  term ((13376 : Rat) / 15) [(1, 1), (7, 2), (11, 2), (13, 1), (16, 1)],
  term ((-6688 : Rat) / 15) [(1, 2), (7, 2), (11, 1), (13, 1), (16, 1)],
  term ((-13376 : Rat) / 15) [(7, 2), (8, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((6688 : Rat) / 15) [(7, 2), (8, 2), (11, 1), (13, 1), (16, 1)],
  term ((-13376 : Rat) / 15) [(7, 2), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((6688 : Rat) / 15) [(7, 2), (9, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 112 for generator 23. -/
theorem ep_Q1_028_partial_23_0112_valid :
    mulPoly ep_Q1_028_coefficient_23_0112
        ep_Q1_028_generator_23_0100_0133 =
      ep_Q1_028_partial_23_0112 := by
  native_decide

/-- Coefficient term 113 from coefficient polynomial 23. -/
def ep_Q1_028_coefficient_23_0113 : Poly :=
[
  term (-352 : Rat) [(7, 2), (11, 2), (16, 1)]
]

/-- Partial product 113 for generator 23. -/
def ep_Q1_028_partial_23_0113 : Poly :=
[
  term (704 : Rat) [(0, 1), (7, 2), (10, 1), (11, 2), (16, 1)],
  term (-352 : Rat) [(0, 2), (7, 2), (11, 2), (16, 1)],
  term (704 : Rat) [(1, 1), (7, 2), (11, 3), (16, 1)],
  term (-352 : Rat) [(1, 2), (7, 2), (11, 2), (16, 1)],
  term (-704 : Rat) [(7, 2), (8, 1), (10, 1), (11, 2), (16, 1)],
  term (352 : Rat) [(7, 2), (8, 2), (11, 2), (16, 1)],
  term (-704 : Rat) [(7, 2), (9, 1), (11, 3), (16, 1)],
  term (352 : Rat) [(7, 2), (9, 2), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 113 for generator 23. -/
theorem ep_Q1_028_partial_23_0113_valid :
    mulPoly ep_Q1_028_coefficient_23_0113
        ep_Q1_028_generator_23_0100_0133 =
      ep_Q1_028_partial_23_0113 := by
  native_decide

/-- Coefficient term 114 from coefficient polynomial 23. -/
def ep_Q1_028_coefficient_23_0114 : Poly :=
[
  term ((704 : Rat) / 15) [(7, 2), (12, 1), (16, 1)]
]

/-- Partial product 114 for generator 23. -/
def ep_Q1_028_partial_23_0114 : Poly :=
[
  term ((-1408 : Rat) / 15) [(0, 1), (7, 2), (10, 1), (12, 1), (16, 1)],
  term ((704 : Rat) / 15) [(0, 2), (7, 2), (12, 1), (16, 1)],
  term ((-1408 : Rat) / 15) [(1, 1), (7, 2), (11, 1), (12, 1), (16, 1)],
  term ((704 : Rat) / 15) [(1, 2), (7, 2), (12, 1), (16, 1)],
  term ((1408 : Rat) / 15) [(7, 2), (8, 1), (10, 1), (12, 1), (16, 1)],
  term ((-704 : Rat) / 15) [(7, 2), (8, 2), (12, 1), (16, 1)],
  term ((1408 : Rat) / 15) [(7, 2), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-704 : Rat) / 15) [(7, 2), (9, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 114 for generator 23. -/
theorem ep_Q1_028_partial_23_0114_valid :
    mulPoly ep_Q1_028_coefficient_23_0114
        ep_Q1_028_generator_23_0100_0133 =
      ep_Q1_028_partial_23_0114 := by
  native_decide

/-- Coefficient term 115 from coefficient polynomial 23. -/
def ep_Q1_028_coefficient_23_0115 : Poly :=
[
  term ((1936 : Rat) / 15) [(7, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 115 for generator 23. -/
def ep_Q1_028_partial_23_0115 : Poly :=
[
  term ((-3872 : Rat) / 15) [(0, 1), (7, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((1936 : Rat) / 15) [(0, 2), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-3872 : Rat) / 15) [(1, 1), (7, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((1936 : Rat) / 15) [(1, 2), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((3872 : Rat) / 15) [(7, 2), (8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1936 : Rat) / 15) [(7, 2), (8, 2), (13, 1), (15, 1), (16, 1)],
  term ((3872 : Rat) / 15) [(7, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1936 : Rat) / 15) [(7, 2), (9, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 115 for generator 23. -/
theorem ep_Q1_028_partial_23_0115_valid :
    mulPoly ep_Q1_028_coefficient_23_0115
        ep_Q1_028_generator_23_0100_0133 =
      ep_Q1_028_partial_23_0115 := by
  native_decide

/-- Coefficient term 116 from coefficient polynomial 23. -/
def ep_Q1_028_coefficient_23_0116 : Poly :=
[
  term ((-1408 : Rat) / 15) [(7, 2), (13, 2), (16, 1)]
]

/-- Partial product 116 for generator 23. -/
def ep_Q1_028_partial_23_0116 : Poly :=
[
  term ((2816 : Rat) / 15) [(0, 1), (7, 2), (10, 1), (13, 2), (16, 1)],
  term ((-1408 : Rat) / 15) [(0, 2), (7, 2), (13, 2), (16, 1)],
  term ((2816 : Rat) / 15) [(1, 1), (7, 2), (11, 1), (13, 2), (16, 1)],
  term ((-1408 : Rat) / 15) [(1, 2), (7, 2), (13, 2), (16, 1)],
  term ((-2816 : Rat) / 15) [(7, 2), (8, 1), (10, 1), (13, 2), (16, 1)],
  term ((1408 : Rat) / 15) [(7, 2), (8, 2), (13, 2), (16, 1)],
  term ((-2816 : Rat) / 15) [(7, 2), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((1408 : Rat) / 15) [(7, 2), (9, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 116 for generator 23. -/
theorem ep_Q1_028_partial_23_0116_valid :
    mulPoly ep_Q1_028_coefficient_23_0116
        ep_Q1_028_generator_23_0100_0133 =
      ep_Q1_028_partial_23_0116 := by
  native_decide

/-- Coefficient term 117 from coefficient polynomial 23. -/
def ep_Q1_028_coefficient_23_0117 : Poly :=
[
  term ((-352 : Rat) / 15) [(7, 2), (14, 1), (16, 1)]
]

/-- Partial product 117 for generator 23. -/
def ep_Q1_028_partial_23_0117 : Poly :=
[
  term ((704 : Rat) / 15) [(0, 1), (7, 2), (10, 1), (14, 1), (16, 1)],
  term ((-352 : Rat) / 15) [(0, 2), (7, 2), (14, 1), (16, 1)],
  term ((704 : Rat) / 15) [(1, 1), (7, 2), (11, 1), (14, 1), (16, 1)],
  term ((-352 : Rat) / 15) [(1, 2), (7, 2), (14, 1), (16, 1)],
  term ((-704 : Rat) / 15) [(7, 2), (8, 1), (10, 1), (14, 1), (16, 1)],
  term ((352 : Rat) / 15) [(7, 2), (8, 2), (14, 1), (16, 1)],
  term ((-704 : Rat) / 15) [(7, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((352 : Rat) / 15) [(7, 2), (9, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 117 for generator 23. -/
theorem ep_Q1_028_partial_23_0117_valid :
    mulPoly ep_Q1_028_coefficient_23_0117
        ep_Q1_028_generator_23_0100_0133 =
      ep_Q1_028_partial_23_0117 := by
  native_decide

/-- Coefficient term 118 from coefficient polynomial 23. -/
def ep_Q1_028_coefficient_23_0118 : Poly :=
[
  term ((528 : Rat) / 5) [(7, 2), (15, 2), (16, 1)]
]

/-- Partial product 118 for generator 23. -/
def ep_Q1_028_partial_23_0118 : Poly :=
[
  term ((-1056 : Rat) / 5) [(0, 1), (7, 2), (10, 1), (15, 2), (16, 1)],
  term ((528 : Rat) / 5) [(0, 2), (7, 2), (15, 2), (16, 1)],
  term ((-1056 : Rat) / 5) [(1, 1), (7, 2), (11, 1), (15, 2), (16, 1)],
  term ((528 : Rat) / 5) [(1, 2), (7, 2), (15, 2), (16, 1)],
  term ((1056 : Rat) / 5) [(7, 2), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((-528 : Rat) / 5) [(7, 2), (8, 2), (15, 2), (16, 1)],
  term ((1056 : Rat) / 5) [(7, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-528 : Rat) / 5) [(7, 2), (9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 118 for generator 23. -/
theorem ep_Q1_028_partial_23_0118_valid :
    mulPoly ep_Q1_028_coefficient_23_0118
        ep_Q1_028_generator_23_0100_0133 =
      ep_Q1_028_partial_23_0118 := by
  native_decide

/-- Coefficient term 119 from coefficient polynomial 23. -/
def ep_Q1_028_coefficient_23_0119 : Poly :=
[
  term (96 : Rat) [(7, 2), (16, 1)]
]

/-- Partial product 119 for generator 23. -/
def ep_Q1_028_partial_23_0119 : Poly :=
[
  term (-192 : Rat) [(0, 1), (7, 2), (10, 1), (16, 1)],
  term (96 : Rat) [(0, 2), (7, 2), (16, 1)],
  term (-192 : Rat) [(1, 1), (7, 2), (11, 1), (16, 1)],
  term (96 : Rat) [(1, 2), (7, 2), (16, 1)],
  term (192 : Rat) [(7, 2), (8, 1), (10, 1), (16, 1)],
  term (-96 : Rat) [(7, 2), (8, 2), (16, 1)],
  term (192 : Rat) [(7, 2), (9, 1), (11, 1), (16, 1)],
  term (-96 : Rat) [(7, 2), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 119 for generator 23. -/
theorem ep_Q1_028_partial_23_0119_valid :
    mulPoly ep_Q1_028_coefficient_23_0119
        ep_Q1_028_generator_23_0100_0133 =
      ep_Q1_028_partial_23_0119 := by
  native_decide

/-- Coefficient term 120 from coefficient polynomial 23. -/
def ep_Q1_028_coefficient_23_0120 : Poly :=
[
  term ((27 : Rat) / 2) [(9, 1), (11, 1), (16, 1)]
]

/-- Partial product 120 for generator 23. -/
def ep_Q1_028_partial_23_0120 : Poly :=
[
  term (-27 : Rat) [(0, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((27 : Rat) / 2) [(0, 2), (9, 1), (11, 1), (16, 1)],
  term (-27 : Rat) [(1, 1), (9, 1), (11, 2), (16, 1)],
  term ((27 : Rat) / 2) [(1, 2), (9, 1), (11, 1), (16, 1)],
  term (27 : Rat) [(8, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-27 : Rat) / 2) [(8, 2), (9, 1), (11, 1), (16, 1)],
  term (27 : Rat) [(9, 2), (11, 2), (16, 1)],
  term ((-27 : Rat) / 2) [(9, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 120 for generator 23. -/
theorem ep_Q1_028_partial_23_0120_valid :
    mulPoly ep_Q1_028_coefficient_23_0120
        ep_Q1_028_generator_23_0100_0133 =
      ep_Q1_028_partial_23_0120 := by
  native_decide

/-- Coefficient term 121 from coefficient polynomial 23. -/
def ep_Q1_028_coefficient_23_0121 : Poly :=
[
  term (-7 : Rat) [(9, 1), (13, 1), (16, 1)]
]

/-- Partial product 121 for generator 23. -/
def ep_Q1_028_partial_23_0121 : Poly :=
[
  term (14 : Rat) [(0, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term (-7 : Rat) [(0, 2), (9, 1), (13, 1), (16, 1)],
  term (14 : Rat) [(1, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term (-7 : Rat) [(1, 2), (9, 1), (13, 1), (16, 1)],
  term (-14 : Rat) [(8, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term (7 : Rat) [(8, 2), (9, 1), (13, 1), (16, 1)],
  term (-14 : Rat) [(9, 2), (11, 1), (13, 1), (16, 1)],
  term (7 : Rat) [(9, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 121 for generator 23. -/
theorem ep_Q1_028_partial_23_0121_valid :
    mulPoly ep_Q1_028_coefficient_23_0121
        ep_Q1_028_generator_23_0100_0133 =
      ep_Q1_028_partial_23_0121 := by
  native_decide

/-- Coefficient term 122 from coefficient polynomial 23. -/
def ep_Q1_028_coefficient_23_0122 : Poly :=
[
  term ((-7 : Rat) / 2) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 122 for generator 23. -/
def ep_Q1_028_partial_23_0122 : Poly :=
[
  term (7 : Rat) [(0, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-7 : Rat) / 2) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term (7 : Rat) [(1, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-7 : Rat) / 2) [(1, 2), (9, 1), (15, 1), (16, 1)],
  term (-7 : Rat) [(8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((7 : Rat) / 2) [(8, 2), (9, 1), (15, 1), (16, 1)],
  term (-7 : Rat) [(9, 2), (11, 1), (15, 1), (16, 1)],
  term ((7 : Rat) / 2) [(9, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 122 for generator 23. -/
theorem ep_Q1_028_partial_23_0122_valid :
    mulPoly ep_Q1_028_coefficient_23_0122
        ep_Q1_028_generator_23_0100_0133 =
      ep_Q1_028_partial_23_0122 := by
  native_decide

/-- Coefficient term 123 from coefficient polynomial 23. -/
def ep_Q1_028_coefficient_23_0123 : Poly :=
[
  term (-14 : Rat) [(9, 2), (16, 1)]
]

/-- Partial product 123 for generator 23. -/
def ep_Q1_028_partial_23_0123 : Poly :=
[
  term (28 : Rat) [(0, 1), (9, 2), (10, 1), (16, 1)],
  term (-14 : Rat) [(0, 2), (9, 2), (16, 1)],
  term (28 : Rat) [(1, 1), (9, 2), (11, 1), (16, 1)],
  term (-14 : Rat) [(1, 2), (9, 2), (16, 1)],
  term (-28 : Rat) [(8, 1), (9, 2), (10, 1), (16, 1)],
  term (14 : Rat) [(8, 2), (9, 2), (16, 1)],
  term (-28 : Rat) [(9, 3), (11, 1), (16, 1)],
  term (14 : Rat) [(9, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 123 for generator 23. -/
theorem ep_Q1_028_partial_23_0123_valid :
    mulPoly ep_Q1_028_coefficient_23_0123
        ep_Q1_028_generator_23_0100_0133 =
      ep_Q1_028_partial_23_0123 := by
  native_decide

/-- Coefficient term 124 from coefficient polynomial 23. -/
def ep_Q1_028_coefficient_23_0124 : Poly :=
[
  term ((3 : Rat) / 2) [(10, 1), (16, 1)]
]

/-- Partial product 124 for generator 23. -/
def ep_Q1_028_partial_23_0124 : Poly :=
[
  term (-3 : Rat) [(0, 1), (10, 2), (16, 1)],
  term ((3 : Rat) / 2) [(0, 2), (10, 1), (16, 1)],
  term (-3 : Rat) [(1, 1), (10, 1), (11, 1), (16, 1)],
  term ((3 : Rat) / 2) [(1, 2), (10, 1), (16, 1)],
  term (3 : Rat) [(8, 1), (10, 2), (16, 1)],
  term ((-3 : Rat) / 2) [(8, 2), (10, 1), (16, 1)],
  term (3 : Rat) [(9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-3 : Rat) / 2) [(9, 2), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 124 for generator 23. -/
theorem ep_Q1_028_partial_23_0124_valid :
    mulPoly ep_Q1_028_coefficient_23_0124
        ep_Q1_028_generator_23_0100_0133 =
      ep_Q1_028_partial_23_0124 := by
  native_decide

/-- Coefficient term 125 from coefficient polynomial 23. -/
def ep_Q1_028_coefficient_23_0125 : Poly :=
[
  term (30 : Rat) [(11, 1), (13, 1), (16, 1)]
]

/-- Partial product 125 for generator 23. -/
def ep_Q1_028_partial_23_0125 : Poly :=
[
  term (-60 : Rat) [(0, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term (30 : Rat) [(0, 2), (11, 1), (13, 1), (16, 1)],
  term (-60 : Rat) [(1, 1), (11, 2), (13, 1), (16, 1)],
  term (30 : Rat) [(1, 2), (11, 1), (13, 1), (16, 1)],
  term (60 : Rat) [(8, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term (-30 : Rat) [(8, 2), (11, 1), (13, 1), (16, 1)],
  term (60 : Rat) [(9, 1), (11, 2), (13, 1), (16, 1)],
  term (-30 : Rat) [(9, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 125 for generator 23. -/
theorem ep_Q1_028_partial_23_0125_valid :
    mulPoly ep_Q1_028_coefficient_23_0125
        ep_Q1_028_generator_23_0100_0133 =
      ep_Q1_028_partial_23_0125 := by
  native_decide

/-- Coefficient term 126 from coefficient polynomial 23. -/
def ep_Q1_028_coefficient_23_0126 : Poly :=
[
  term (-16 : Rat) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 126 for generator 23. -/
def ep_Q1_028_partial_23_0126 : Poly :=
[
  term (32 : Rat) [(0, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term (-16 : Rat) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term (32 : Rat) [(1, 1), (11, 2), (15, 1), (16, 1)],
  term (-16 : Rat) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term (-32 : Rat) [(8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term (16 : Rat) [(8, 2), (11, 1), (15, 1), (16, 1)],
  term (-32 : Rat) [(9, 1), (11, 2), (15, 1), (16, 1)],
  term (16 : Rat) [(9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 126 for generator 23. -/
theorem ep_Q1_028_partial_23_0126_valid :
    mulPoly ep_Q1_028_coefficient_23_0126
        ep_Q1_028_generator_23_0100_0133 =
      ep_Q1_028_partial_23_0126 := by
  native_decide

/-- Coefficient term 127 from coefficient polynomial 23. -/
def ep_Q1_028_coefficient_23_0127 : Poly :=
[
  term (18 : Rat) [(11, 2), (16, 1)]
]

/-- Partial product 127 for generator 23. -/
def ep_Q1_028_partial_23_0127 : Poly :=
[
  term (-36 : Rat) [(0, 1), (10, 1), (11, 2), (16, 1)],
  term (18 : Rat) [(0, 2), (11, 2), (16, 1)],
  term (-36 : Rat) [(1, 1), (11, 3), (16, 1)],
  term (18 : Rat) [(1, 2), (11, 2), (16, 1)],
  term (36 : Rat) [(8, 1), (10, 1), (11, 2), (16, 1)],
  term (-18 : Rat) [(8, 2), (11, 2), (16, 1)],
  term (36 : Rat) [(9, 1), (11, 3), (16, 1)],
  term (-18 : Rat) [(9, 2), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 127 for generator 23. -/
theorem ep_Q1_028_partial_23_0127_valid :
    mulPoly ep_Q1_028_coefficient_23_0127
        ep_Q1_028_generator_23_0100_0133 =
      ep_Q1_028_partial_23_0127 := by
  native_decide

/-- Coefficient term 128 from coefficient polynomial 23. -/
def ep_Q1_028_coefficient_23_0128 : Poly :=
[
  term (-6 : Rat) [(12, 1), (16, 1)]
]

/-- Partial product 128 for generator 23. -/
def ep_Q1_028_partial_23_0128 : Poly :=
[
  term (12 : Rat) [(0, 1), (10, 1), (12, 1), (16, 1)],
  term (-6 : Rat) [(0, 2), (12, 1), (16, 1)],
  term (12 : Rat) [(1, 1), (11, 1), (12, 1), (16, 1)],
  term (-6 : Rat) [(1, 2), (12, 1), (16, 1)],
  term (-12 : Rat) [(8, 1), (10, 1), (12, 1), (16, 1)],
  term (6 : Rat) [(8, 2), (12, 1), (16, 1)],
  term (-12 : Rat) [(9, 1), (11, 1), (12, 1), (16, 1)],
  term (6 : Rat) [(9, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 128 for generator 23. -/
theorem ep_Q1_028_partial_23_0128_valid :
    mulPoly ep_Q1_028_coefficient_23_0128
        ep_Q1_028_generator_23_0100_0133 =
      ep_Q1_028_partial_23_0128 := by
  native_decide

/-- Coefficient term 129 from coefficient polynomial 23. -/
def ep_Q1_028_coefficient_23_0129 : Poly :=
[
  term (-19 : Rat) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 129 for generator 23. -/
def ep_Q1_028_partial_23_0129 : Poly :=
[
  term (38 : Rat) [(0, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term (-19 : Rat) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term (38 : Rat) [(1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term (-19 : Rat) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term (-38 : Rat) [(8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term (19 : Rat) [(8, 2), (13, 1), (15, 1), (16, 1)],
  term (-38 : Rat) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term (19 : Rat) [(9, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 129 for generator 23. -/
theorem ep_Q1_028_partial_23_0129_valid :
    mulPoly ep_Q1_028_coefficient_23_0129
        ep_Q1_028_generator_23_0100_0133 =
      ep_Q1_028_partial_23_0129 := by
  native_decide

/-- Coefficient term 130 from coefficient polynomial 23. -/
def ep_Q1_028_coefficient_23_0130 : Poly :=
[
  term (12 : Rat) [(13, 2), (16, 1)]
]

/-- Partial product 130 for generator 23. -/
def ep_Q1_028_partial_23_0130 : Poly :=
[
  term (-24 : Rat) [(0, 1), (10, 1), (13, 2), (16, 1)],
  term (12 : Rat) [(0, 2), (13, 2), (16, 1)],
  term (-24 : Rat) [(1, 1), (11, 1), (13, 2), (16, 1)],
  term (12 : Rat) [(1, 2), (13, 2), (16, 1)],
  term (24 : Rat) [(8, 1), (10, 1), (13, 2), (16, 1)],
  term (-12 : Rat) [(8, 2), (13, 2), (16, 1)],
  term (24 : Rat) [(9, 1), (11, 1), (13, 2), (16, 1)],
  term (-12 : Rat) [(9, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 130 for generator 23. -/
theorem ep_Q1_028_partial_23_0130_valid :
    mulPoly ep_Q1_028_coefficient_23_0130
        ep_Q1_028_generator_23_0100_0133 =
      ep_Q1_028_partial_23_0130 := by
  native_decide

/-- Coefficient term 131 from coefficient polynomial 23. -/
def ep_Q1_028_coefficient_23_0131 : Poly :=
[
  term (-2 : Rat) [(14, 1), (16, 1)]
]

/-- Partial product 131 for generator 23. -/
def ep_Q1_028_partial_23_0131 : Poly :=
[
  term (4 : Rat) [(0, 1), (10, 1), (14, 1), (16, 1)],
  term (-2 : Rat) [(0, 2), (14, 1), (16, 1)],
  term (4 : Rat) [(1, 1), (11, 1), (14, 1), (16, 1)],
  term (-2 : Rat) [(1, 2), (14, 1), (16, 1)],
  term (-4 : Rat) [(8, 1), (10, 1), (14, 1), (16, 1)],
  term (2 : Rat) [(8, 2), (14, 1), (16, 1)],
  term (-4 : Rat) [(9, 1), (11, 1), (14, 1), (16, 1)],
  term (2 : Rat) [(9, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 131 for generator 23. -/
theorem ep_Q1_028_partial_23_0131_valid :
    mulPoly ep_Q1_028_coefficient_23_0131
        ep_Q1_028_generator_23_0100_0133 =
      ep_Q1_028_partial_23_0131 := by
  native_decide

/-- Coefficient term 132 from coefficient polynomial 23. -/
def ep_Q1_028_coefficient_23_0132 : Poly :=
[
  term (1 : Rat) [(15, 2), (16, 1)]
]

/-- Partial product 132 for generator 23. -/
def ep_Q1_028_partial_23_0132 : Poly :=
[
  term (-2 : Rat) [(0, 1), (10, 1), (15, 2), (16, 1)],
  term (1 : Rat) [(0, 2), (15, 2), (16, 1)],
  term (-2 : Rat) [(1, 1), (11, 1), (15, 2), (16, 1)],
  term (1 : Rat) [(1, 2), (15, 2), (16, 1)],
  term (2 : Rat) [(8, 1), (10, 1), (15, 2), (16, 1)],
  term (-1 : Rat) [(8, 2), (15, 2), (16, 1)],
  term (2 : Rat) [(9, 1), (11, 1), (15, 2), (16, 1)],
  term (-1 : Rat) [(9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 132 for generator 23. -/
theorem ep_Q1_028_partial_23_0132_valid :
    mulPoly ep_Q1_028_coefficient_23_0132
        ep_Q1_028_generator_23_0100_0133 =
      ep_Q1_028_partial_23_0132 := by
  native_decide

/-- Coefficient term 133 from coefficient polynomial 23. -/
def ep_Q1_028_coefficient_23_0133 : Poly :=
[
  term ((27 : Rat) / 4) [(16, 1)]
]

/-- Partial product 133 for generator 23. -/
def ep_Q1_028_partial_23_0133 : Poly :=
[
  term ((-27 : Rat) / 2) [(0, 1), (10, 1), (16, 1)],
  term ((27 : Rat) / 4) [(0, 2), (16, 1)],
  term ((-27 : Rat) / 2) [(1, 1), (11, 1), (16, 1)],
  term ((27 : Rat) / 4) [(1, 2), (16, 1)],
  term ((27 : Rat) / 2) [(8, 1), (10, 1), (16, 1)],
  term ((-27 : Rat) / 4) [(8, 2), (16, 1)],
  term ((27 : Rat) / 2) [(9, 1), (11, 1), (16, 1)],
  term ((-27 : Rat) / 4) [(9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 133 for generator 23. -/
theorem ep_Q1_028_partial_23_0133_valid :
    mulPoly ep_Q1_028_coefficient_23_0133
        ep_Q1_028_generator_23_0100_0133 =
      ep_Q1_028_partial_23_0133 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q1_028_partials_23_0100_0133 : List Poly :=
[
  ep_Q1_028_partial_23_0100,
  ep_Q1_028_partial_23_0101,
  ep_Q1_028_partial_23_0102,
  ep_Q1_028_partial_23_0103,
  ep_Q1_028_partial_23_0104,
  ep_Q1_028_partial_23_0105,
  ep_Q1_028_partial_23_0106,
  ep_Q1_028_partial_23_0107,
  ep_Q1_028_partial_23_0108,
  ep_Q1_028_partial_23_0109,
  ep_Q1_028_partial_23_0110,
  ep_Q1_028_partial_23_0111,
  ep_Q1_028_partial_23_0112,
  ep_Q1_028_partial_23_0113,
  ep_Q1_028_partial_23_0114,
  ep_Q1_028_partial_23_0115,
  ep_Q1_028_partial_23_0116,
  ep_Q1_028_partial_23_0117,
  ep_Q1_028_partial_23_0118,
  ep_Q1_028_partial_23_0119,
  ep_Q1_028_partial_23_0120,
  ep_Q1_028_partial_23_0121,
  ep_Q1_028_partial_23_0122,
  ep_Q1_028_partial_23_0123,
  ep_Q1_028_partial_23_0124,
  ep_Q1_028_partial_23_0125,
  ep_Q1_028_partial_23_0126,
  ep_Q1_028_partial_23_0127,
  ep_Q1_028_partial_23_0128,
  ep_Q1_028_partial_23_0129,
  ep_Q1_028_partial_23_0130,
  ep_Q1_028_partial_23_0131,
  ep_Q1_028_partial_23_0132,
  ep_Q1_028_partial_23_0133
]

/-- Sum of partial products in this block. -/
def ep_Q1_028_block_23_0100_0133 : Poly :=
[
  term ((128 : Rat) / 15) [(0, 1), (7, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((688 : Rat) / 15) [(0, 1), (7, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((8 : Rat) / 5) [(0, 1), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((-256 : Rat) / 15) [(0, 1), (7, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-64 : Rat) / 15) [(0, 1), (7, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-484 : Rat) / 5) [(0, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((208 : Rat) / 5) [(0, 1), (7, 1), (10, 1), (15, 3), (16, 1)],
  term ((-35728 : Rat) / 15) [(0, 1), (7, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-15488 : Rat) / 15) [(0, 1), (7, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((2992 : Rat) / 5) [(0, 1), (7, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((17248 : Rat) / 15) [(0, 1), (7, 2), (9, 2), (10, 1), (16, 1)],
  term ((13376 : Rat) / 15) [(0, 1), (7, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term (704 : Rat) [(0, 1), (7, 2), (10, 1), (11, 2), (16, 1)],
  term ((-1408 : Rat) / 15) [(0, 1), (7, 2), (10, 1), (12, 1), (16, 1)],
  term ((-3872 : Rat) / 15) [(0, 1), (7, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((2816 : Rat) / 15) [(0, 1), (7, 2), (10, 1), (13, 2), (16, 1)],
  term ((704 : Rat) / 15) [(0, 1), (7, 2), (10, 1), (14, 1), (16, 1)],
  term ((-1056 : Rat) / 5) [(0, 1), (7, 2), (10, 1), (15, 2), (16, 1)],
  term (-192 : Rat) [(0, 1), (7, 2), (10, 1), (16, 1)],
  term ((176 : Rat) / 3) [(0, 1), (7, 2), (10, 2), (16, 1)],
  term (-27 : Rat) [(0, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term (14 : Rat) [(0, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term (7 : Rat) [(0, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term (28 : Rat) [(0, 1), (9, 2), (10, 1), (16, 1)],
  term (-60 : Rat) [(0, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term (32 : Rat) [(0, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term (-36 : Rat) [(0, 1), (10, 1), (11, 2), (16, 1)],
  term (12 : Rat) [(0, 1), (10, 1), (12, 1), (16, 1)],
  term (38 : Rat) [(0, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term (-24 : Rat) [(0, 1), (10, 1), (13, 2), (16, 1)],
  term (4 : Rat) [(0, 1), (10, 1), (14, 1), (16, 1)],
  term (-2 : Rat) [(0, 1), (10, 1), (15, 2), (16, 1)],
  term ((-27 : Rat) / 2) [(0, 1), (10, 1), (16, 1)],
  term (-3 : Rat) [(0, 1), (10, 2), (16, 1)],
  term ((-64 : Rat) / 15) [(0, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-344 : Rat) / 15) [(0, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-4 : Rat) / 5) [(0, 2), (7, 1), (13, 1), (16, 1)],
  term ((128 : Rat) / 15) [(0, 2), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((32 : Rat) / 15) [(0, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((242 : Rat) / 5) [(0, 2), (7, 1), (15, 1), (16, 1)],
  term ((-104 : Rat) / 5) [(0, 2), (7, 1), (15, 3), (16, 1)],
  term ((17864 : Rat) / 15) [(0, 2), (7, 2), (9, 1), (11, 1), (16, 1)],
  term ((7744 : Rat) / 15) [(0, 2), (7, 2), (9, 1), (13, 1), (16, 1)],
  term ((-1496 : Rat) / 5) [(0, 2), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((-8624 : Rat) / 15) [(0, 2), (7, 2), (9, 2), (16, 1)],
  term ((-88 : Rat) / 3) [(0, 2), (7, 2), (10, 1), (16, 1)],
  term ((-6688 : Rat) / 15) [(0, 2), (7, 2), (11, 1), (13, 1), (16, 1)],
  term (-352 : Rat) [(0, 2), (7, 2), (11, 2), (16, 1)],
  term ((704 : Rat) / 15) [(0, 2), (7, 2), (12, 1), (16, 1)],
  term ((1936 : Rat) / 15) [(0, 2), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1408 : Rat) / 15) [(0, 2), (7, 2), (13, 2), (16, 1)],
  term ((-352 : Rat) / 15) [(0, 2), (7, 2), (14, 1), (16, 1)],
  term ((528 : Rat) / 5) [(0, 2), (7, 2), (15, 2), (16, 1)],
  term (96 : Rat) [(0, 2), (7, 2), (16, 1)],
  term ((27 : Rat) / 2) [(0, 2), (9, 1), (11, 1), (16, 1)],
  term (-7 : Rat) [(0, 2), (9, 1), (13, 1), (16, 1)],
  term ((-7 : Rat) / 2) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term (-14 : Rat) [(0, 2), (9, 2), (16, 1)],
  term ((3 : Rat) / 2) [(0, 2), (10, 1), (16, 1)],
  term (30 : Rat) [(0, 2), (11, 1), (13, 1), (16, 1)],
  term (-16 : Rat) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term (18 : Rat) [(0, 2), (11, 2), (16, 1)],
  term (-6 : Rat) [(0, 2), (12, 1), (16, 1)],
  term (-19 : Rat) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(0, 2), (13, 2), (16, 1)],
  term (-2 : Rat) [(0, 2), (14, 1), (16, 1)],
  term (1 : Rat) [(0, 2), (15, 2), (16, 1)],
  term ((27 : Rat) / 4) [(0, 2), (16, 1)],
  term ((128 : Rat) / 15) [(1, 1), (7, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((688 : Rat) / 15) [(1, 1), (7, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((8 : Rat) / 5) [(1, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((-256 : Rat) / 15) [(1, 1), (7, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-64 : Rat) / 15) [(1, 1), (7, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-484 : Rat) / 5) [(1, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((208 : Rat) / 5) [(1, 1), (7, 1), (11, 1), (15, 3), (16, 1)],
  term ((-15488 : Rat) / 15) [(1, 1), (7, 2), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((2992 : Rat) / 5) [(1, 1), (7, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-35728 : Rat) / 15) [(1, 1), (7, 2), (9, 1), (11, 2), (16, 1)],
  term ((17248 : Rat) / 15) [(1, 1), (7, 2), (9, 2), (11, 1), (16, 1)],
  term ((176 : Rat) / 3) [(1, 1), (7, 2), (10, 1), (11, 1), (16, 1)],
  term ((-1408 : Rat) / 15) [(1, 1), (7, 2), (11, 1), (12, 1), (16, 1)],
  term ((-3872 : Rat) / 15) [(1, 1), (7, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((2816 : Rat) / 15) [(1, 1), (7, 2), (11, 1), (13, 2), (16, 1)],
  term ((704 : Rat) / 15) [(1, 1), (7, 2), (11, 1), (14, 1), (16, 1)],
  term ((-1056 : Rat) / 5) [(1, 1), (7, 2), (11, 1), (15, 2), (16, 1)],
  term (-192 : Rat) [(1, 1), (7, 2), (11, 1), (16, 1)],
  term ((13376 : Rat) / 15) [(1, 1), (7, 2), (11, 2), (13, 1), (16, 1)],
  term (704 : Rat) [(1, 1), (7, 2), (11, 3), (16, 1)],
  term (14 : Rat) [(1, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term (7 : Rat) [(1, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term (-27 : Rat) [(1, 1), (9, 1), (11, 2), (16, 1)],
  term (28 : Rat) [(1, 1), (9, 2), (11, 1), (16, 1)],
  term (-3 : Rat) [(1, 1), (10, 1), (11, 1), (16, 1)],
  term (12 : Rat) [(1, 1), (11, 1), (12, 1), (16, 1)],
  term (38 : Rat) [(1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term (-24 : Rat) [(1, 1), (11, 1), (13, 2), (16, 1)],
  term (4 : Rat) [(1, 1), (11, 1), (14, 1), (16, 1)],
  term (-2 : Rat) [(1, 1), (11, 1), (15, 2), (16, 1)],
  term ((-27 : Rat) / 2) [(1, 1), (11, 1), (16, 1)],
  term (-60 : Rat) [(1, 1), (11, 2), (13, 1), (16, 1)],
  term (32 : Rat) [(1, 1), (11, 2), (15, 1), (16, 1)],
  term (-36 : Rat) [(1, 1), (11, 3), (16, 1)],
  term ((-64 : Rat) / 15) [(1, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-344 : Rat) / 15) [(1, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-4 : Rat) / 5) [(1, 2), (7, 1), (13, 1), (16, 1)],
  term ((128 : Rat) / 15) [(1, 2), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((32 : Rat) / 15) [(1, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((242 : Rat) / 5) [(1, 2), (7, 1), (15, 1), (16, 1)],
  term ((-104 : Rat) / 5) [(1, 2), (7, 1), (15, 3), (16, 1)],
  term ((17864 : Rat) / 15) [(1, 2), (7, 2), (9, 1), (11, 1), (16, 1)],
  term ((7744 : Rat) / 15) [(1, 2), (7, 2), (9, 1), (13, 1), (16, 1)],
  term ((-1496 : Rat) / 5) [(1, 2), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((-8624 : Rat) / 15) [(1, 2), (7, 2), (9, 2), (16, 1)],
  term ((-88 : Rat) / 3) [(1, 2), (7, 2), (10, 1), (16, 1)],
  term ((-6688 : Rat) / 15) [(1, 2), (7, 2), (11, 1), (13, 1), (16, 1)],
  term (-352 : Rat) [(1, 2), (7, 2), (11, 2), (16, 1)],
  term ((704 : Rat) / 15) [(1, 2), (7, 2), (12, 1), (16, 1)],
  term ((1936 : Rat) / 15) [(1, 2), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1408 : Rat) / 15) [(1, 2), (7, 2), (13, 2), (16, 1)],
  term ((-352 : Rat) / 15) [(1, 2), (7, 2), (14, 1), (16, 1)],
  term ((528 : Rat) / 5) [(1, 2), (7, 2), (15, 2), (16, 1)],
  term (96 : Rat) [(1, 2), (7, 2), (16, 1)],
  term ((27 : Rat) / 2) [(1, 2), (9, 1), (11, 1), (16, 1)],
  term (-7 : Rat) [(1, 2), (9, 1), (13, 1), (16, 1)],
  term ((-7 : Rat) / 2) [(1, 2), (9, 1), (15, 1), (16, 1)],
  term (-14 : Rat) [(1, 2), (9, 2), (16, 1)],
  term ((3 : Rat) / 2) [(1, 2), (10, 1), (16, 1)],
  term (30 : Rat) [(1, 2), (11, 1), (13, 1), (16, 1)],
  term (-16 : Rat) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term (18 : Rat) [(1, 2), (11, 2), (16, 1)],
  term (-6 : Rat) [(1, 2), (12, 1), (16, 1)],
  term (-19 : Rat) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(1, 2), (13, 2), (16, 1)],
  term (-2 : Rat) [(1, 2), (14, 1), (16, 1)],
  term (1 : Rat) [(1, 2), (15, 2), (16, 1)],
  term ((27 : Rat) / 4) [(1, 2), (16, 1)],
  term ((-128 : Rat) / 15) [(7, 1), (8, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-688 : Rat) / 15) [(7, 1), (8, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-8 : Rat) / 5) [(7, 1), (8, 1), (10, 1), (13, 1), (16, 1)],
  term ((256 : Rat) / 15) [(7, 1), (8, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((64 : Rat) / 15) [(7, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((484 : Rat) / 5) [(7, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-208 : Rat) / 5) [(7, 1), (8, 1), (10, 1), (15, 3), (16, 1)],
  term ((64 : Rat) / 15) [(7, 1), (8, 2), (12, 1), (15, 1), (16, 1)],
  term ((344 : Rat) / 15) [(7, 1), (8, 2), (13, 1), (15, 2), (16, 1)],
  term ((4 : Rat) / 5) [(7, 1), (8, 2), (13, 1), (16, 1)],
  term ((-128 : Rat) / 15) [(7, 1), (8, 2), (13, 2), (15, 1), (16, 1)],
  term ((-32 : Rat) / 15) [(7, 1), (8, 2), (14, 1), (15, 1), (16, 1)],
  term ((-242 : Rat) / 5) [(7, 1), (8, 2), (15, 1), (16, 1)],
  term ((104 : Rat) / 5) [(7, 1), (8, 2), (15, 3), (16, 1)],
  term ((-128 : Rat) / 15) [(7, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-688 : Rat) / 15) [(7, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-8 : Rat) / 5) [(7, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((256 : Rat) / 15) [(7, 1), (9, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((64 : Rat) / 15) [(7, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((484 : Rat) / 5) [(7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-208 : Rat) / 5) [(7, 1), (9, 1), (11, 1), (15, 3), (16, 1)],
  term ((64 : Rat) / 15) [(7, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((344 : Rat) / 15) [(7, 1), (9, 2), (13, 1), (15, 2), (16, 1)],
  term ((4 : Rat) / 5) [(7, 1), (9, 2), (13, 1), (16, 1)],
  term ((-128 : Rat) / 15) [(7, 1), (9, 2), (13, 2), (15, 1), (16, 1)],
  term ((-32 : Rat) / 15) [(7, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((-242 : Rat) / 5) [(7, 1), (9, 2), (15, 1), (16, 1)],
  term ((104 : Rat) / 5) [(7, 1), (9, 2), (15, 3), (16, 1)],
  term ((35728 : Rat) / 15) [(7, 2), (8, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((15488 : Rat) / 15) [(7, 2), (8, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-2992 : Rat) / 5) [(7, 2), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-17248 : Rat) / 15) [(7, 2), (8, 1), (9, 2), (10, 1), (16, 1)],
  term ((-13376 : Rat) / 15) [(7, 2), (8, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term (-704 : Rat) [(7, 2), (8, 1), (10, 1), (11, 2), (16, 1)],
  term ((1408 : Rat) / 15) [(7, 2), (8, 1), (10, 1), (12, 1), (16, 1)],
  term ((3872 : Rat) / 15) [(7, 2), (8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2816 : Rat) / 15) [(7, 2), (8, 1), (10, 1), (13, 2), (16, 1)],
  term ((-704 : Rat) / 15) [(7, 2), (8, 1), (10, 1), (14, 1), (16, 1)],
  term ((1056 : Rat) / 5) [(7, 2), (8, 1), (10, 1), (15, 2), (16, 1)],
  term (192 : Rat) [(7, 2), (8, 1), (10, 1), (16, 1)],
  term ((-176 : Rat) / 3) [(7, 2), (8, 1), (10, 2), (16, 1)],
  term ((-17864 : Rat) / 15) [(7, 2), (8, 2), (9, 1), (11, 1), (16, 1)],
  term ((-7744 : Rat) / 15) [(7, 2), (8, 2), (9, 1), (13, 1), (16, 1)],
  term ((1496 : Rat) / 5) [(7, 2), (8, 2), (9, 1), (15, 1), (16, 1)],
  term ((8624 : Rat) / 15) [(7, 2), (8, 2), (9, 2), (16, 1)],
  term ((88 : Rat) / 3) [(7, 2), (8, 2), (10, 1), (16, 1)],
  term ((6688 : Rat) / 15) [(7, 2), (8, 2), (11, 1), (13, 1), (16, 1)],
  term (352 : Rat) [(7, 2), (8, 2), (11, 2), (16, 1)],
  term ((-704 : Rat) / 15) [(7, 2), (8, 2), (12, 1), (16, 1)],
  term ((-1936 : Rat) / 15) [(7, 2), (8, 2), (13, 1), (15, 1), (16, 1)],
  term ((1408 : Rat) / 15) [(7, 2), (8, 2), (13, 2), (16, 1)],
  term ((352 : Rat) / 15) [(7, 2), (8, 2), (14, 1), (16, 1)],
  term ((-528 : Rat) / 5) [(7, 2), (8, 2), (15, 2), (16, 1)],
  term (-96 : Rat) [(7, 2), (8, 2), (16, 1)],
  term ((-176 : Rat) / 3) [(7, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((1408 : Rat) / 15) [(7, 2), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((3872 : Rat) / 15) [(7, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2816 : Rat) / 15) [(7, 2), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((-704 : Rat) / 15) [(7, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((1056 : Rat) / 5) [(7, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term (192 : Rat) [(7, 2), (9, 1), (11, 1), (16, 1)],
  term ((-13376 : Rat) / 15) [(7, 2), (9, 1), (11, 2), (13, 1), (16, 1)],
  term (-704 : Rat) [(7, 2), (9, 1), (11, 3), (16, 1)],
  term ((88 : Rat) / 3) [(7, 2), (9, 2), (10, 1), (16, 1)],
  term ((7392 : Rat) / 5) [(7, 2), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((-2992 : Rat) / 5) [(7, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((41008 : Rat) / 15) [(7, 2), (9, 2), (11, 2), (16, 1)],
  term ((-704 : Rat) / 15) [(7, 2), (9, 2), (12, 1), (16, 1)],
  term ((-1936 : Rat) / 15) [(7, 2), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((1408 : Rat) / 15) [(7, 2), (9, 2), (13, 2), (16, 1)],
  term ((352 : Rat) / 15) [(7, 2), (9, 2), (14, 1), (16, 1)],
  term ((-528 : Rat) / 5) [(7, 2), (9, 2), (15, 2), (16, 1)],
  term (-96 : Rat) [(7, 2), (9, 2), (16, 1)],
  term ((-11704 : Rat) / 5) [(7, 2), (9, 3), (11, 1), (16, 1)],
  term ((-7744 : Rat) / 15) [(7, 2), (9, 3), (13, 1), (16, 1)],
  term ((1496 : Rat) / 5) [(7, 2), (9, 3), (15, 1), (16, 1)],
  term ((8624 : Rat) / 15) [(7, 2), (9, 4), (16, 1)],
  term (27 : Rat) [(8, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term (-14 : Rat) [(8, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term (-7 : Rat) [(8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term (-28 : Rat) [(8, 1), (9, 2), (10, 1), (16, 1)],
  term (60 : Rat) [(8, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term (-32 : Rat) [(8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term (36 : Rat) [(8, 1), (10, 1), (11, 2), (16, 1)],
  term (-12 : Rat) [(8, 1), (10, 1), (12, 1), (16, 1)],
  term (-38 : Rat) [(8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term (24 : Rat) [(8, 1), (10, 1), (13, 2), (16, 1)],
  term (-4 : Rat) [(8, 1), (10, 1), (14, 1), (16, 1)],
  term (2 : Rat) [(8, 1), (10, 1), (15, 2), (16, 1)],
  term ((27 : Rat) / 2) [(8, 1), (10, 1), (16, 1)],
  term (3 : Rat) [(8, 1), (10, 2), (16, 1)],
  term ((-27 : Rat) / 2) [(8, 2), (9, 1), (11, 1), (16, 1)],
  term (7 : Rat) [(8, 2), (9, 1), (13, 1), (16, 1)],
  term ((7 : Rat) / 2) [(8, 2), (9, 1), (15, 1), (16, 1)],
  term (14 : Rat) [(8, 2), (9, 2), (16, 1)],
  term ((-3 : Rat) / 2) [(8, 2), (10, 1), (16, 1)],
  term (-30 : Rat) [(8, 2), (11, 1), (13, 1), (16, 1)],
  term (16 : Rat) [(8, 2), (11, 1), (15, 1), (16, 1)],
  term (-18 : Rat) [(8, 2), (11, 2), (16, 1)],
  term (6 : Rat) [(8, 2), (12, 1), (16, 1)],
  term (19 : Rat) [(8, 2), (13, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(8, 2), (13, 2), (16, 1)],
  term (2 : Rat) [(8, 2), (14, 1), (16, 1)],
  term (-1 : Rat) [(8, 2), (15, 2), (16, 1)],
  term ((-27 : Rat) / 4) [(8, 2), (16, 1)],
  term (3 : Rat) [(9, 1), (10, 1), (11, 1), (16, 1)],
  term (-12 : Rat) [(9, 1), (11, 1), (12, 1), (16, 1)],
  term (-38 : Rat) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term (24 : Rat) [(9, 1), (11, 1), (13, 2), (16, 1)],
  term (-4 : Rat) [(9, 1), (11, 1), (14, 1), (16, 1)],
  term (2 : Rat) [(9, 1), (11, 1), (15, 2), (16, 1)],
  term ((27 : Rat) / 2) [(9, 1), (11, 1), (16, 1)],
  term (60 : Rat) [(9, 1), (11, 2), (13, 1), (16, 1)],
  term (-32 : Rat) [(9, 1), (11, 2), (15, 1), (16, 1)],
  term (36 : Rat) [(9, 1), (11, 3), (16, 1)],
  term ((-3 : Rat) / 2) [(9, 2), (10, 1), (16, 1)],
  term (-44 : Rat) [(9, 2), (11, 1), (13, 1), (16, 1)],
  term (9 : Rat) [(9, 2), (11, 1), (15, 1), (16, 1)],
  term (9 : Rat) [(9, 2), (11, 2), (16, 1)],
  term (6 : Rat) [(9, 2), (12, 1), (16, 1)],
  term (19 : Rat) [(9, 2), (13, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(9, 2), (13, 2), (16, 1)],
  term (2 : Rat) [(9, 2), (14, 1), (16, 1)],
  term (-1 : Rat) [(9, 2), (15, 2), (16, 1)],
  term ((-27 : Rat) / 4) [(9, 2), (16, 1)],
  term ((-83 : Rat) / 2) [(9, 3), (11, 1), (16, 1)],
  term (7 : Rat) [(9, 3), (13, 1), (16, 1)],
  term ((7 : Rat) / 2) [(9, 3), (15, 1), (16, 1)],
  term (14 : Rat) [(9, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 23, terms 100 through 133. -/
theorem ep_Q1_028_block_23_0100_0133_valid :
    checkProductSumEq ep_Q1_028_partials_23_0100_0133
      ep_Q1_028_block_23_0100_0133 = true := by
  native_decide

end EpQ1028TermShards

end Patterns

end EndpointCertificate

end Problem97
