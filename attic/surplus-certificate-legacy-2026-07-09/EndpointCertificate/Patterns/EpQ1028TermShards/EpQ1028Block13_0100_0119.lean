/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q1_028, term block 13:100-119

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q1_028`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ1028TermShards

/-- Generator polynomial 13 for endpoint certificate `ep_Q1_028`. -/
def ep_Q1_028_generator_13_0100_0119 : Poly :=
[
  term (1 : Rat) [],
  term (-2 : Rat) [(4, 1)],
  term (2 : Rat) [(4, 1), (6, 1)],
  term (2 : Rat) [(5, 1), (7, 1)],
  term (-1 : Rat) [(6, 2)],
  term (-1 : Rat) [(7, 2)]
]

/-- Coefficient term 100 from coefficient polynomial 13. -/
def ep_Q1_028_coefficient_13_0100 : Poly :=
[
  term ((-352 : Rat) / 3) [(7, 2), (11, 2), (16, 1)]
]

/-- Partial product 100 for generator 13. -/
def ep_Q1_028_partial_13_0100 : Poly :=
[
  term ((-704 : Rat) / 3) [(4, 1), (6, 1), (7, 2), (11, 2), (16, 1)],
  term ((704 : Rat) / 3) [(4, 1), (7, 2), (11, 2), (16, 1)],
  term ((-704 : Rat) / 3) [(5, 1), (7, 3), (11, 2), (16, 1)],
  term ((352 : Rat) / 3) [(6, 2), (7, 2), (11, 2), (16, 1)],
  term ((-352 : Rat) / 3) [(7, 2), (11, 2), (16, 1)],
  term ((352 : Rat) / 3) [(7, 4), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 13. -/
theorem ep_Q1_028_partial_13_0100_valid :
    mulPoly ep_Q1_028_coefficient_13_0100
        ep_Q1_028_generator_13_0100_0119 =
      ep_Q1_028_partial_13_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 13. -/
def ep_Q1_028_coefficient_13_0101 : Poly :=
[
  term ((176 : Rat) / 5) [(7, 2), (12, 1), (16, 1)]
]

/-- Partial product 101 for generator 13. -/
def ep_Q1_028_partial_13_0101 : Poly :=
[
  term ((352 : Rat) / 5) [(4, 1), (6, 1), (7, 2), (12, 1), (16, 1)],
  term ((-352 : Rat) / 5) [(4, 1), (7, 2), (12, 1), (16, 1)],
  term ((352 : Rat) / 5) [(5, 1), (7, 3), (12, 1), (16, 1)],
  term ((-176 : Rat) / 5) [(6, 2), (7, 2), (12, 1), (16, 1)],
  term ((176 : Rat) / 5) [(7, 2), (12, 1), (16, 1)],
  term ((-176 : Rat) / 5) [(7, 4), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 13. -/
theorem ep_Q1_028_partial_13_0101_valid :
    mulPoly ep_Q1_028_coefficient_13_0101
        ep_Q1_028_generator_13_0100_0119 =
      ep_Q1_028_partial_13_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 13. -/
def ep_Q1_028_coefficient_13_0102 : Poly :=
[
  term ((1232 : Rat) / 15) [(7, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 102 for generator 13. -/
def ep_Q1_028_partial_13_0102 : Poly :=
[
  term ((2464 : Rat) / 15) [(4, 1), (6, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-2464 : Rat) / 15) [(4, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((2464 : Rat) / 15) [(5, 1), (7, 3), (13, 1), (15, 1), (16, 1)],
  term ((-1232 : Rat) / 15) [(6, 2), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((1232 : Rat) / 15) [(7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1232 : Rat) / 15) [(7, 4), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 13. -/
theorem ep_Q1_028_partial_13_0102_valid :
    mulPoly ep_Q1_028_coefficient_13_0102
        ep_Q1_028_generator_13_0100_0119 =
      ep_Q1_028_partial_13_0102 := by
  native_decide

/-- Coefficient term 103 from coefficient polynomial 13. -/
def ep_Q1_028_coefficient_13_0103 : Poly :=
[
  term ((-2816 : Rat) / 15) [(7, 2), (13, 2), (16, 1)]
]

/-- Partial product 103 for generator 13. -/
def ep_Q1_028_partial_13_0103 : Poly :=
[
  term ((-5632 : Rat) / 15) [(4, 1), (6, 1), (7, 2), (13, 2), (16, 1)],
  term ((5632 : Rat) / 15) [(4, 1), (7, 2), (13, 2), (16, 1)],
  term ((-5632 : Rat) / 15) [(5, 1), (7, 3), (13, 2), (16, 1)],
  term ((2816 : Rat) / 15) [(6, 2), (7, 2), (13, 2), (16, 1)],
  term ((-2816 : Rat) / 15) [(7, 2), (13, 2), (16, 1)],
  term ((2816 : Rat) / 15) [(7, 4), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 103 for generator 13. -/
theorem ep_Q1_028_partial_13_0103_valid :
    mulPoly ep_Q1_028_coefficient_13_0103
        ep_Q1_028_generator_13_0100_0119 =
      ep_Q1_028_partial_13_0103 := by
  native_decide

/-- Coefficient term 104 from coefficient polynomial 13. -/
def ep_Q1_028_coefficient_13_0104 : Poly :=
[
  term ((-264 : Rat) / 5) [(7, 2), (14, 1), (16, 1)]
]

/-- Partial product 104 for generator 13. -/
def ep_Q1_028_partial_13_0104 : Poly :=
[
  term ((-528 : Rat) / 5) [(4, 1), (6, 1), (7, 2), (14, 1), (16, 1)],
  term ((528 : Rat) / 5) [(4, 1), (7, 2), (14, 1), (16, 1)],
  term ((-528 : Rat) / 5) [(5, 1), (7, 3), (14, 1), (16, 1)],
  term ((264 : Rat) / 5) [(6, 2), (7, 2), (14, 1), (16, 1)],
  term ((-264 : Rat) / 5) [(7, 2), (14, 1), (16, 1)],
  term ((264 : Rat) / 5) [(7, 4), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 104 for generator 13. -/
theorem ep_Q1_028_partial_13_0104_valid :
    mulPoly ep_Q1_028_coefficient_13_0104
        ep_Q1_028_generator_13_0100_0119 =
      ep_Q1_028_partial_13_0104 := by
  native_decide

/-- Coefficient term 105 from coefficient polynomial 13. -/
def ep_Q1_028_coefficient_13_0105 : Poly :=
[
  term ((528 : Rat) / 5) [(7, 2), (15, 2), (16, 1)]
]

/-- Partial product 105 for generator 13. -/
def ep_Q1_028_partial_13_0105 : Poly :=
[
  term ((1056 : Rat) / 5) [(4, 1), (6, 1), (7, 2), (15, 2), (16, 1)],
  term ((-1056 : Rat) / 5) [(4, 1), (7, 2), (15, 2), (16, 1)],
  term ((1056 : Rat) / 5) [(5, 1), (7, 3), (15, 2), (16, 1)],
  term ((-528 : Rat) / 5) [(6, 2), (7, 2), (15, 2), (16, 1)],
  term ((528 : Rat) / 5) [(7, 2), (15, 2), (16, 1)],
  term ((-528 : Rat) / 5) [(7, 4), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 105 for generator 13. -/
theorem ep_Q1_028_partial_13_0105_valid :
    mulPoly ep_Q1_028_coefficient_13_0105
        ep_Q1_028_generator_13_0100_0119 =
      ep_Q1_028_partial_13_0105 := by
  native_decide

/-- Coefficient term 106 from coefficient polynomial 13. -/
def ep_Q1_028_coefficient_13_0106 : Poly :=
[
  term ((136 : Rat) / 5) [(7, 2), (16, 1)]
]

/-- Partial product 106 for generator 13. -/
def ep_Q1_028_partial_13_0106 : Poly :=
[
  term ((272 : Rat) / 5) [(4, 1), (6, 1), (7, 2), (16, 1)],
  term ((-272 : Rat) / 5) [(4, 1), (7, 2), (16, 1)],
  term ((272 : Rat) / 5) [(5, 1), (7, 3), (16, 1)],
  term ((-136 : Rat) / 5) [(6, 2), (7, 2), (16, 1)],
  term ((136 : Rat) / 5) [(7, 2), (16, 1)],
  term ((-136 : Rat) / 5) [(7, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 106 for generator 13. -/
theorem ep_Q1_028_partial_13_0106_valid :
    mulPoly ep_Q1_028_coefficient_13_0106
        ep_Q1_028_generator_13_0100_0119 =
      ep_Q1_028_partial_13_0106 := by
  native_decide

/-- Coefficient term 107 from coefficient polynomial 13. -/
def ep_Q1_028_coefficient_13_0107 : Poly :=
[
  term ((7 : Rat) / 2) [(9, 1), (11, 1), (16, 1)]
]

/-- Partial product 107 for generator 13. -/
def ep_Q1_028_partial_13_0107 : Poly :=
[
  term (7 : Rat) [(4, 1), (6, 1), (9, 1), (11, 1), (16, 1)],
  term (-7 : Rat) [(4, 1), (9, 1), (11, 1), (16, 1)],
  term (7 : Rat) [(5, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((-7 : Rat) / 2) [(6, 2), (9, 1), (11, 1), (16, 1)],
  term ((-7 : Rat) / 2) [(7, 2), (9, 1), (11, 1), (16, 1)],
  term ((7 : Rat) / 2) [(9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 107 for generator 13. -/
theorem ep_Q1_028_partial_13_0107_valid :
    mulPoly ep_Q1_028_coefficient_13_0107
        ep_Q1_028_generator_13_0100_0119 =
      ep_Q1_028_partial_13_0107 := by
  native_decide

/-- Coefficient term 108 from coefficient polynomial 13. -/
def ep_Q1_028_coefficient_13_0108 : Poly :=
[
  term (5 : Rat) [(9, 1), (13, 1), (16, 1)]
]

/-- Partial product 108 for generator 13. -/
def ep_Q1_028_partial_13_0108 : Poly :=
[
  term (10 : Rat) [(4, 1), (6, 1), (9, 1), (13, 1), (16, 1)],
  term (-10 : Rat) [(4, 1), (9, 1), (13, 1), (16, 1)],
  term (10 : Rat) [(5, 1), (7, 1), (9, 1), (13, 1), (16, 1)],
  term (-5 : Rat) [(6, 2), (9, 1), (13, 1), (16, 1)],
  term (-5 : Rat) [(7, 2), (9, 1), (13, 1), (16, 1)],
  term (5 : Rat) [(9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 108 for generator 13. -/
theorem ep_Q1_028_partial_13_0108_valid :
    mulPoly ep_Q1_028_coefficient_13_0108
        ep_Q1_028_generator_13_0100_0119 =
      ep_Q1_028_partial_13_0108 := by
  native_decide

/-- Coefficient term 109 from coefficient polynomial 13. -/
def ep_Q1_028_coefficient_13_0109 : Poly :=
[
  term (-14 : Rat) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 109 for generator 13. -/
def ep_Q1_028_partial_13_0109 : Poly :=
[
  term (-28 : Rat) [(4, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term (28 : Rat) [(4, 1), (9, 1), (15, 1), (16, 1)],
  term (-28 : Rat) [(5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term (14 : Rat) [(6, 2), (9, 1), (15, 1), (16, 1)],
  term (14 : Rat) [(7, 2), (9, 1), (15, 1), (16, 1)],
  term (-14 : Rat) [(9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 109 for generator 13. -/
theorem ep_Q1_028_partial_13_0109_valid :
    mulPoly ep_Q1_028_coefficient_13_0109
        ep_Q1_028_generator_13_0100_0119 =
      ep_Q1_028_partial_13_0109 := by
  native_decide

/-- Coefficient term 110 from coefficient polynomial 13. -/
def ep_Q1_028_coefficient_13_0110 : Poly :=
[
  term (-6 : Rat) [(9, 2), (16, 1)]
]

/-- Partial product 110 for generator 13. -/
def ep_Q1_028_partial_13_0110 : Poly :=
[
  term (-12 : Rat) [(4, 1), (6, 1), (9, 2), (16, 1)],
  term (12 : Rat) [(4, 1), (9, 2), (16, 1)],
  term (-12 : Rat) [(5, 1), (7, 1), (9, 2), (16, 1)],
  term (6 : Rat) [(6, 2), (9, 2), (16, 1)],
  term (6 : Rat) [(7, 2), (9, 2), (16, 1)],
  term (-6 : Rat) [(9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 110 for generator 13. -/
theorem ep_Q1_028_partial_13_0110_valid :
    mulPoly ep_Q1_028_coefficient_13_0110
        ep_Q1_028_generator_13_0100_0119 =
      ep_Q1_028_partial_13_0110 := by
  native_decide

/-- Coefficient term 111 from coefficient polynomial 13. -/
def ep_Q1_028_coefficient_13_0111 : Poly :=
[
  term (12 : Rat) [(11, 1), (13, 1), (16, 1)]
]

/-- Partial product 111 for generator 13. -/
def ep_Q1_028_partial_13_0111 : Poly :=
[
  term (24 : Rat) [(4, 1), (6, 1), (11, 1), (13, 1), (16, 1)],
  term (-24 : Rat) [(4, 1), (11, 1), (13, 1), (16, 1)],
  term (24 : Rat) [(5, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term (-12 : Rat) [(6, 2), (11, 1), (13, 1), (16, 1)],
  term (-12 : Rat) [(7, 2), (11, 1), (13, 1), (16, 1)],
  term (12 : Rat) [(11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 111 for generator 13. -/
theorem ep_Q1_028_partial_13_0111_valid :
    mulPoly ep_Q1_028_coefficient_13_0111
        ep_Q1_028_generator_13_0100_0119 =
      ep_Q1_028_partial_13_0111 := by
  native_decide

/-- Coefficient term 112 from coefficient polynomial 13. -/
def ep_Q1_028_coefficient_13_0112 : Poly :=
[
  term (-6 : Rat) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 112 for generator 13. -/
def ep_Q1_028_partial_13_0112 : Poly :=
[
  term (-12 : Rat) [(4, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(4, 1), (11, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term (6 : Rat) [(6, 2), (11, 1), (15, 1), (16, 1)],
  term (6 : Rat) [(7, 2), (11, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 112 for generator 13. -/
theorem ep_Q1_028_partial_13_0112_valid :
    mulPoly ep_Q1_028_coefficient_13_0112
        ep_Q1_028_generator_13_0100_0119 =
      ep_Q1_028_partial_13_0112 := by
  native_decide

/-- Coefficient term 113 from coefficient polynomial 13. -/
def ep_Q1_028_coefficient_13_0113 : Poly :=
[
  term (6 : Rat) [(11, 2), (16, 1)]
]

/-- Partial product 113 for generator 13. -/
def ep_Q1_028_partial_13_0113 : Poly :=
[
  term (12 : Rat) [(4, 1), (6, 1), (11, 2), (16, 1)],
  term (-12 : Rat) [(4, 1), (11, 2), (16, 1)],
  term (12 : Rat) [(5, 1), (7, 1), (11, 2), (16, 1)],
  term (-6 : Rat) [(6, 2), (11, 2), (16, 1)],
  term (-6 : Rat) [(7, 2), (11, 2), (16, 1)],
  term (6 : Rat) [(11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 113 for generator 13. -/
theorem ep_Q1_028_partial_13_0113_valid :
    mulPoly ep_Q1_028_coefficient_13_0113
        ep_Q1_028_generator_13_0100_0119 =
      ep_Q1_028_partial_13_0113 := by
  native_decide

/-- Coefficient term 114 from coefficient polynomial 13. -/
def ep_Q1_028_coefficient_13_0114 : Poly :=
[
  term (-7 : Rat) [(12, 1), (16, 1)]
]

/-- Partial product 114 for generator 13. -/
def ep_Q1_028_partial_13_0114 : Poly :=
[
  term (-14 : Rat) [(4, 1), (6, 1), (12, 1), (16, 1)],
  term (14 : Rat) [(4, 1), (12, 1), (16, 1)],
  term (-14 : Rat) [(5, 1), (7, 1), (12, 1), (16, 1)],
  term (7 : Rat) [(6, 2), (12, 1), (16, 1)],
  term (7 : Rat) [(7, 2), (12, 1), (16, 1)],
  term (-7 : Rat) [(12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 114 for generator 13. -/
theorem ep_Q1_028_partial_13_0114_valid :
    mulPoly ep_Q1_028_coefficient_13_0114
        ep_Q1_028_generator_13_0100_0119 =
      ep_Q1_028_partial_13_0114 := by
  native_decide

/-- Coefficient term 115 from coefficient polynomial 13. -/
def ep_Q1_028_coefficient_13_0115 : Poly :=
[
  term (-7 : Rat) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 115 for generator 13. -/
def ep_Q1_028_partial_13_0115 : Poly :=
[
  term (-14 : Rat) [(4, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term (14 : Rat) [(4, 1), (13, 1), (15, 1), (16, 1)],
  term (-14 : Rat) [(5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term (7 : Rat) [(6, 2), (13, 1), (15, 1), (16, 1)],
  term (7 : Rat) [(7, 2), (13, 1), (15, 1), (16, 1)],
  term (-7 : Rat) [(13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 115 for generator 13. -/
theorem ep_Q1_028_partial_13_0115_valid :
    mulPoly ep_Q1_028_coefficient_13_0115
        ep_Q1_028_generator_13_0100_0119 =
      ep_Q1_028_partial_13_0115 := by
  native_decide

/-- Coefficient term 116 from coefficient polynomial 13. -/
def ep_Q1_028_coefficient_13_0116 : Poly :=
[
  term (6 : Rat) [(13, 2), (16, 1)]
]

/-- Partial product 116 for generator 13. -/
def ep_Q1_028_partial_13_0116 : Poly :=
[
  term (12 : Rat) [(4, 1), (6, 1), (13, 2), (16, 1)],
  term (-12 : Rat) [(4, 1), (13, 2), (16, 1)],
  term (12 : Rat) [(5, 1), (7, 1), (13, 2), (16, 1)],
  term (-6 : Rat) [(6, 2), (13, 2), (16, 1)],
  term (-6 : Rat) [(7, 2), (13, 2), (16, 1)],
  term (6 : Rat) [(13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 116 for generator 13. -/
theorem ep_Q1_028_partial_13_0116_valid :
    mulPoly ep_Q1_028_coefficient_13_0116
        ep_Q1_028_generator_13_0100_0119 =
      ep_Q1_028_partial_13_0116 := by
  native_decide

/-- Coefficient term 117 from coefficient polynomial 13. -/
def ep_Q1_028_coefficient_13_0117 : Poly :=
[
  term ((11 : Rat) / 2) [(14, 1), (16, 1)]
]

/-- Partial product 117 for generator 13. -/
def ep_Q1_028_partial_13_0117 : Poly :=
[
  term (11 : Rat) [(4, 1), (6, 1), (14, 1), (16, 1)],
  term (-11 : Rat) [(4, 1), (14, 1), (16, 1)],
  term (11 : Rat) [(5, 1), (7, 1), (14, 1), (16, 1)],
  term ((-11 : Rat) / 2) [(6, 2), (14, 1), (16, 1)],
  term ((-11 : Rat) / 2) [(7, 2), (14, 1), (16, 1)],
  term ((11 : Rat) / 2) [(14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 117 for generator 13. -/
theorem ep_Q1_028_partial_13_0117_valid :
    mulPoly ep_Q1_028_coefficient_13_0117
        ep_Q1_028_generator_13_0100_0119 =
      ep_Q1_028_partial_13_0117 := by
  native_decide

/-- Coefficient term 118 from coefficient polynomial 13. -/
def ep_Q1_028_coefficient_13_0118 : Poly :=
[
  term (1 : Rat) [(15, 2), (16, 1)]
]

/-- Partial product 118 for generator 13. -/
def ep_Q1_028_partial_13_0118 : Poly :=
[
  term (2 : Rat) [(4, 1), (6, 1), (15, 2), (16, 1)],
  term (-2 : Rat) [(4, 1), (15, 2), (16, 1)],
  term (2 : Rat) [(5, 1), (7, 1), (15, 2), (16, 1)],
  term (-1 : Rat) [(6, 2), (15, 2), (16, 1)],
  term (-1 : Rat) [(7, 2), (15, 2), (16, 1)],
  term (1 : Rat) [(15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 118 for generator 13. -/
theorem ep_Q1_028_partial_13_0118_valid :
    mulPoly ep_Q1_028_coefficient_13_0118
        ep_Q1_028_generator_13_0100_0119 =
      ep_Q1_028_partial_13_0118 := by
  native_decide

/-- Coefficient term 119 from coefficient polynomial 13. -/
def ep_Q1_028_coefficient_13_0119 : Poly :=
[
  term ((7 : Rat) / 4) [(16, 1)]
]

/-- Partial product 119 for generator 13. -/
def ep_Q1_028_partial_13_0119 : Poly :=
[
  term ((7 : Rat) / 2) [(4, 1), (6, 1), (16, 1)],
  term ((-7 : Rat) / 2) [(4, 1), (16, 1)],
  term ((7 : Rat) / 2) [(5, 1), (7, 1), (16, 1)],
  term ((-7 : Rat) / 4) [(6, 2), (16, 1)],
  term ((-7 : Rat) / 4) [(7, 2), (16, 1)],
  term ((7 : Rat) / 4) [(16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 119 for generator 13. -/
theorem ep_Q1_028_partial_13_0119_valid :
    mulPoly ep_Q1_028_coefficient_13_0119
        ep_Q1_028_generator_13_0100_0119 =
      ep_Q1_028_partial_13_0119 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q1_028_partials_13_0100_0119 : List Poly :=
[
  ep_Q1_028_partial_13_0100,
  ep_Q1_028_partial_13_0101,
  ep_Q1_028_partial_13_0102,
  ep_Q1_028_partial_13_0103,
  ep_Q1_028_partial_13_0104,
  ep_Q1_028_partial_13_0105,
  ep_Q1_028_partial_13_0106,
  ep_Q1_028_partial_13_0107,
  ep_Q1_028_partial_13_0108,
  ep_Q1_028_partial_13_0109,
  ep_Q1_028_partial_13_0110,
  ep_Q1_028_partial_13_0111,
  ep_Q1_028_partial_13_0112,
  ep_Q1_028_partial_13_0113,
  ep_Q1_028_partial_13_0114,
  ep_Q1_028_partial_13_0115,
  ep_Q1_028_partial_13_0116,
  ep_Q1_028_partial_13_0117,
  ep_Q1_028_partial_13_0118,
  ep_Q1_028_partial_13_0119
]

/-- Sum of partial products in this block. -/
def ep_Q1_028_block_13_0100_0119 : Poly :=
[
  term ((-704 : Rat) / 3) [(4, 1), (6, 1), (7, 2), (11, 2), (16, 1)],
  term ((352 : Rat) / 5) [(4, 1), (6, 1), (7, 2), (12, 1), (16, 1)],
  term ((2464 : Rat) / 15) [(4, 1), (6, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-5632 : Rat) / 15) [(4, 1), (6, 1), (7, 2), (13, 2), (16, 1)],
  term ((-528 : Rat) / 5) [(4, 1), (6, 1), (7, 2), (14, 1), (16, 1)],
  term ((1056 : Rat) / 5) [(4, 1), (6, 1), (7, 2), (15, 2), (16, 1)],
  term ((272 : Rat) / 5) [(4, 1), (6, 1), (7, 2), (16, 1)],
  term (7 : Rat) [(4, 1), (6, 1), (9, 1), (11, 1), (16, 1)],
  term (10 : Rat) [(4, 1), (6, 1), (9, 1), (13, 1), (16, 1)],
  term (-28 : Rat) [(4, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(4, 1), (6, 1), (9, 2), (16, 1)],
  term (24 : Rat) [(4, 1), (6, 1), (11, 1), (13, 1), (16, 1)],
  term (-12 : Rat) [(4, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(4, 1), (6, 1), (11, 2), (16, 1)],
  term (-14 : Rat) [(4, 1), (6, 1), (12, 1), (16, 1)],
  term (-14 : Rat) [(4, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(4, 1), (6, 1), (13, 2), (16, 1)],
  term (11 : Rat) [(4, 1), (6, 1), (14, 1), (16, 1)],
  term (2 : Rat) [(4, 1), (6, 1), (15, 2), (16, 1)],
  term ((7 : Rat) / 2) [(4, 1), (6, 1), (16, 1)],
  term ((704 : Rat) / 3) [(4, 1), (7, 2), (11, 2), (16, 1)],
  term ((-352 : Rat) / 5) [(4, 1), (7, 2), (12, 1), (16, 1)],
  term ((-2464 : Rat) / 15) [(4, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((5632 : Rat) / 15) [(4, 1), (7, 2), (13, 2), (16, 1)],
  term ((528 : Rat) / 5) [(4, 1), (7, 2), (14, 1), (16, 1)],
  term ((-1056 : Rat) / 5) [(4, 1), (7, 2), (15, 2), (16, 1)],
  term ((-272 : Rat) / 5) [(4, 1), (7, 2), (16, 1)],
  term (-7 : Rat) [(4, 1), (9, 1), (11, 1), (16, 1)],
  term (-10 : Rat) [(4, 1), (9, 1), (13, 1), (16, 1)],
  term (28 : Rat) [(4, 1), (9, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(4, 1), (9, 2), (16, 1)],
  term (-24 : Rat) [(4, 1), (11, 1), (13, 1), (16, 1)],
  term (12 : Rat) [(4, 1), (11, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(4, 1), (11, 2), (16, 1)],
  term (14 : Rat) [(4, 1), (12, 1), (16, 1)],
  term (14 : Rat) [(4, 1), (13, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(4, 1), (13, 2), (16, 1)],
  term (-11 : Rat) [(4, 1), (14, 1), (16, 1)],
  term (-2 : Rat) [(4, 1), (15, 2), (16, 1)],
  term ((-7 : Rat) / 2) [(4, 1), (16, 1)],
  term (7 : Rat) [(5, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term (10 : Rat) [(5, 1), (7, 1), (9, 1), (13, 1), (16, 1)],
  term (-28 : Rat) [(5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(5, 1), (7, 1), (9, 2), (16, 1)],
  term (24 : Rat) [(5, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term (-12 : Rat) [(5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(5, 1), (7, 1), (11, 2), (16, 1)],
  term (-14 : Rat) [(5, 1), (7, 1), (12, 1), (16, 1)],
  term (-14 : Rat) [(5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(5, 1), (7, 1), (13, 2), (16, 1)],
  term (11 : Rat) [(5, 1), (7, 1), (14, 1), (16, 1)],
  term (2 : Rat) [(5, 1), (7, 1), (15, 2), (16, 1)],
  term ((7 : Rat) / 2) [(5, 1), (7, 1), (16, 1)],
  term ((-704 : Rat) / 3) [(5, 1), (7, 3), (11, 2), (16, 1)],
  term ((352 : Rat) / 5) [(5, 1), (7, 3), (12, 1), (16, 1)],
  term ((2464 : Rat) / 15) [(5, 1), (7, 3), (13, 1), (15, 1), (16, 1)],
  term ((-5632 : Rat) / 15) [(5, 1), (7, 3), (13, 2), (16, 1)],
  term ((-528 : Rat) / 5) [(5, 1), (7, 3), (14, 1), (16, 1)],
  term ((1056 : Rat) / 5) [(5, 1), (7, 3), (15, 2), (16, 1)],
  term ((272 : Rat) / 5) [(5, 1), (7, 3), (16, 1)],
  term ((352 : Rat) / 3) [(6, 2), (7, 2), (11, 2), (16, 1)],
  term ((-176 : Rat) / 5) [(6, 2), (7, 2), (12, 1), (16, 1)],
  term ((-1232 : Rat) / 15) [(6, 2), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((2816 : Rat) / 15) [(6, 2), (7, 2), (13, 2), (16, 1)],
  term ((264 : Rat) / 5) [(6, 2), (7, 2), (14, 1), (16, 1)],
  term ((-528 : Rat) / 5) [(6, 2), (7, 2), (15, 2), (16, 1)],
  term ((-136 : Rat) / 5) [(6, 2), (7, 2), (16, 1)],
  term ((-7 : Rat) / 2) [(6, 2), (9, 1), (11, 1), (16, 1)],
  term (-5 : Rat) [(6, 2), (9, 1), (13, 1), (16, 1)],
  term (14 : Rat) [(6, 2), (9, 1), (15, 1), (16, 1)],
  term (6 : Rat) [(6, 2), (9, 2), (16, 1)],
  term (-12 : Rat) [(6, 2), (11, 1), (13, 1), (16, 1)],
  term (6 : Rat) [(6, 2), (11, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(6, 2), (11, 2), (16, 1)],
  term (7 : Rat) [(6, 2), (12, 1), (16, 1)],
  term (7 : Rat) [(6, 2), (13, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(6, 2), (13, 2), (16, 1)],
  term ((-11 : Rat) / 2) [(6, 2), (14, 1), (16, 1)],
  term (-1 : Rat) [(6, 2), (15, 2), (16, 1)],
  term ((-7 : Rat) / 4) [(6, 2), (16, 1)],
  term ((-7 : Rat) / 2) [(7, 2), (9, 1), (11, 1), (16, 1)],
  term (-5 : Rat) [(7, 2), (9, 1), (13, 1), (16, 1)],
  term (14 : Rat) [(7, 2), (9, 1), (15, 1), (16, 1)],
  term (6 : Rat) [(7, 2), (9, 2), (16, 1)],
  term (-12 : Rat) [(7, 2), (11, 1), (13, 1), (16, 1)],
  term (6 : Rat) [(7, 2), (11, 1), (15, 1), (16, 1)],
  term ((-370 : Rat) / 3) [(7, 2), (11, 2), (16, 1)],
  term ((211 : Rat) / 5) [(7, 2), (12, 1), (16, 1)],
  term ((1337 : Rat) / 15) [(7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-2906 : Rat) / 15) [(7, 2), (13, 2), (16, 1)],
  term ((-583 : Rat) / 10) [(7, 2), (14, 1), (16, 1)],
  term ((523 : Rat) / 5) [(7, 2), (15, 2), (16, 1)],
  term ((509 : Rat) / 20) [(7, 2), (16, 1)],
  term ((352 : Rat) / 3) [(7, 4), (11, 2), (16, 1)],
  term ((-176 : Rat) / 5) [(7, 4), (12, 1), (16, 1)],
  term ((-1232 : Rat) / 15) [(7, 4), (13, 1), (15, 1), (16, 1)],
  term ((2816 : Rat) / 15) [(7, 4), (13, 2), (16, 1)],
  term ((264 : Rat) / 5) [(7, 4), (14, 1), (16, 1)],
  term ((-528 : Rat) / 5) [(7, 4), (15, 2), (16, 1)],
  term ((-136 : Rat) / 5) [(7, 4), (16, 1)],
  term ((7 : Rat) / 2) [(9, 1), (11, 1), (16, 1)],
  term (5 : Rat) [(9, 1), (13, 1), (16, 1)],
  term (-14 : Rat) [(9, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(9, 2), (16, 1)],
  term (12 : Rat) [(11, 1), (13, 1), (16, 1)],
  term (-6 : Rat) [(11, 1), (15, 1), (16, 1)],
  term (6 : Rat) [(11, 2), (16, 1)],
  term (-7 : Rat) [(12, 1), (16, 1)],
  term (-7 : Rat) [(13, 1), (15, 1), (16, 1)],
  term (6 : Rat) [(13, 2), (16, 1)],
  term ((11 : Rat) / 2) [(14, 1), (16, 1)],
  term (1 : Rat) [(15, 2), (16, 1)],
  term ((7 : Rat) / 4) [(16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 13, terms 100 through 119. -/
theorem ep_Q1_028_block_13_0100_0119_valid :
    checkProductSumEq ep_Q1_028_partials_13_0100_0119
      ep_Q1_028_block_13_0100_0119 = true := by
  native_decide

end EpQ1028TermShards

end Patterns

end EndpointCertificate

end Problem97
