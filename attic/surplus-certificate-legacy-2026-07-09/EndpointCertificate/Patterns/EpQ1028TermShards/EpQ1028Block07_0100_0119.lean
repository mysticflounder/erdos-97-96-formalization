/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q1_028, term block 7:100-119

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q1_028`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ1028TermShards

/-- Generator polynomial 7 for endpoint certificate `ep_Q1_028`. -/
def ep_Q1_028_generator_07_0100_0119 : Poly :=
[
  term (-2 : Rat) [(0, 1)],
  term (1 : Rat) [(0, 2)],
  term (1 : Rat) [(1, 2)],
  term (2 : Rat) [(12, 1)],
  term (-1 : Rat) [(12, 2)],
  term (-1 : Rat) [(13, 2)]
]

/-- Coefficient term 100 from coefficient polynomial 7. -/
def ep_Q1_028_coefficient_07_0100 : Poly :=
[
  term ((-704 : Rat) / 3) [(7, 2), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 100 for generator 7. -/
def ep_Q1_028_partial_07_0100 : Poly :=
[
  term ((1408 : Rat) / 3) [(0, 1), (7, 2), (11, 1), (13, 1), (16, 1)],
  term ((-704 : Rat) / 3) [(0, 2), (7, 2), (11, 1), (13, 1), (16, 1)],
  term ((-704 : Rat) / 3) [(1, 2), (7, 2), (11, 1), (13, 1), (16, 1)],
  term ((-1408 : Rat) / 3) [(7, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((704 : Rat) / 3) [(7, 2), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((704 : Rat) / 3) [(7, 2), (11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 7. -/
theorem ep_Q1_028_partial_07_0100_valid :
    mulPoly ep_Q1_028_coefficient_07_0100
        ep_Q1_028_generator_07_0100_0119 =
      ep_Q1_028_partial_07_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 7. -/
def ep_Q1_028_coefficient_07_0101 : Poly :=
[
  term ((176 : Rat) / 3) [(7, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 101 for generator 7. -/
def ep_Q1_028_partial_07_0101 : Poly :=
[
  term ((-352 : Rat) / 3) [(0, 1), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((176 : Rat) / 3) [(0, 2), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((176 : Rat) / 3) [(1, 2), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((352 : Rat) / 3) [(7, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-176 : Rat) / 3) [(7, 2), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-176 : Rat) / 3) [(7, 2), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 7. -/
theorem ep_Q1_028_partial_07_0101_valid :
    mulPoly ep_Q1_028_coefficient_07_0101
        ep_Q1_028_generator_07_0100_0119 =
      ep_Q1_028_partial_07_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 7. -/
def ep_Q1_028_coefficient_07_0102 : Poly :=
[
  term ((-704 : Rat) / 3) [(7, 2), (11, 2), (16, 1)]
]

/-- Partial product 102 for generator 7. -/
def ep_Q1_028_partial_07_0102 : Poly :=
[
  term ((1408 : Rat) / 3) [(0, 1), (7, 2), (11, 2), (16, 1)],
  term ((-704 : Rat) / 3) [(0, 2), (7, 2), (11, 2), (16, 1)],
  term ((-704 : Rat) / 3) [(1, 2), (7, 2), (11, 2), (16, 1)],
  term ((-1408 : Rat) / 3) [(7, 2), (11, 2), (12, 1), (16, 1)],
  term ((704 : Rat) / 3) [(7, 2), (11, 2), (12, 2), (16, 1)],
  term ((704 : Rat) / 3) [(7, 2), (11, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 7. -/
theorem ep_Q1_028_partial_07_0102_valid :
    mulPoly ep_Q1_028_coefficient_07_0102
        ep_Q1_028_generator_07_0100_0119 =
      ep_Q1_028_partial_07_0102 := by
  native_decide

/-- Coefficient term 103 from coefficient polynomial 7. -/
def ep_Q1_028_coefficient_07_0103 : Poly :=
[
  term ((2816 : Rat) / 15) [(7, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 103 for generator 7. -/
def ep_Q1_028_partial_07_0103 : Poly :=
[
  term ((-5632 : Rat) / 15) [(0, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((2816 : Rat) / 15) [(0, 2), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((2816 : Rat) / 15) [(1, 2), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((5632 : Rat) / 15) [(7, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2816 : Rat) / 15) [(7, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-2816 : Rat) / 15) [(7, 2), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 103 for generator 7. -/
theorem ep_Q1_028_partial_07_0103_valid :
    mulPoly ep_Q1_028_coefficient_07_0103
        ep_Q1_028_generator_07_0100_0119 =
      ep_Q1_028_partial_07_0103 := by
  native_decide

/-- Coefficient term 104 from coefficient polynomial 7. -/
def ep_Q1_028_coefficient_07_0104 : Poly :=
[
  term ((-2564 : Rat) / 15) [(7, 2), (14, 1), (16, 1)]
]

/-- Partial product 104 for generator 7. -/
def ep_Q1_028_partial_07_0104 : Poly :=
[
  term ((5128 : Rat) / 15) [(0, 1), (7, 2), (14, 1), (16, 1)],
  term ((-2564 : Rat) / 15) [(0, 2), (7, 2), (14, 1), (16, 1)],
  term ((-2564 : Rat) / 15) [(1, 2), (7, 2), (14, 1), (16, 1)],
  term ((-5128 : Rat) / 15) [(7, 2), (12, 1), (14, 1), (16, 1)],
  term ((2564 : Rat) / 15) [(7, 2), (12, 2), (14, 1), (16, 1)],
  term ((2564 : Rat) / 15) [(7, 2), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 104 for generator 7. -/
theorem ep_Q1_028_partial_07_0104_valid :
    mulPoly ep_Q1_028_coefficient_07_0104
        ep_Q1_028_generator_07_0100_0119 =
      ep_Q1_028_partial_07_0104 := by
  native_decide

/-- Coefficient term 105 from coefficient polynomial 7. -/
def ep_Q1_028_coefficient_07_0105 : Poly :=
[
  term ((1408 : Rat) / 15) [(7, 2), (14, 2), (16, 1)]
]

/-- Partial product 105 for generator 7. -/
def ep_Q1_028_partial_07_0105 : Poly :=
[
  term ((-2816 : Rat) / 15) [(0, 1), (7, 2), (14, 2), (16, 1)],
  term ((1408 : Rat) / 15) [(0, 2), (7, 2), (14, 2), (16, 1)],
  term ((1408 : Rat) / 15) [(1, 2), (7, 2), (14, 2), (16, 1)],
  term ((2816 : Rat) / 15) [(7, 2), (12, 1), (14, 2), (16, 1)],
  term ((-1408 : Rat) / 15) [(7, 2), (12, 2), (14, 2), (16, 1)],
  term ((-1408 : Rat) / 15) [(7, 2), (13, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 105 for generator 7. -/
theorem ep_Q1_028_partial_07_0105_valid :
    mulPoly ep_Q1_028_coefficient_07_0105
        ep_Q1_028_generator_07_0100_0119 =
      ep_Q1_028_partial_07_0105 := by
  native_decide

/-- Coefficient term 106 from coefficient polynomial 7. -/
def ep_Q1_028_coefficient_07_0106 : Poly :=
[
  term ((2992 : Rat) / 15) [(7, 2), (15, 2), (16, 1)]
]

/-- Partial product 106 for generator 7. -/
def ep_Q1_028_partial_07_0106 : Poly :=
[
  term ((-5984 : Rat) / 15) [(0, 1), (7, 2), (15, 2), (16, 1)],
  term ((2992 : Rat) / 15) [(0, 2), (7, 2), (15, 2), (16, 1)],
  term ((2992 : Rat) / 15) [(1, 2), (7, 2), (15, 2), (16, 1)],
  term ((5984 : Rat) / 15) [(7, 2), (12, 1), (15, 2), (16, 1)],
  term ((-2992 : Rat) / 15) [(7, 2), (12, 2), (15, 2), (16, 1)],
  term ((-2992 : Rat) / 15) [(7, 2), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 106 for generator 7. -/
theorem ep_Q1_028_partial_07_0106_valid :
    mulPoly ep_Q1_028_coefficient_07_0106
        ep_Q1_028_generator_07_0100_0119 =
      ep_Q1_028_partial_07_0106 := by
  native_decide

/-- Coefficient term 107 from coefficient polynomial 7. -/
def ep_Q1_028_coefficient_07_0107 : Poly :=
[
  term ((176 : Rat) / 3) [(7, 2), (16, 1)]
]

/-- Partial product 107 for generator 7. -/
def ep_Q1_028_partial_07_0107 : Poly :=
[
  term ((-352 : Rat) / 3) [(0, 1), (7, 2), (16, 1)],
  term ((176 : Rat) / 3) [(0, 2), (7, 2), (16, 1)],
  term ((176 : Rat) / 3) [(1, 2), (7, 2), (16, 1)],
  term ((352 : Rat) / 3) [(7, 2), (12, 1), (16, 1)],
  term ((-176 : Rat) / 3) [(7, 2), (12, 2), (16, 1)],
  term ((-176 : Rat) / 3) [(7, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 107 for generator 7. -/
theorem ep_Q1_028_partial_07_0107_valid :
    mulPoly ep_Q1_028_coefficient_07_0107
        ep_Q1_028_generator_07_0100_0119 =
      ep_Q1_028_partial_07_0107 := by
  native_decide

/-- Coefficient term 108 from coefficient polynomial 7. -/
def ep_Q1_028_coefficient_07_0108 : Poly :=
[
  term (10 : Rat) [(9, 1), (11, 1), (16, 1)]
]

/-- Partial product 108 for generator 7. -/
def ep_Q1_028_partial_07_0108 : Poly :=
[
  term (-20 : Rat) [(0, 1), (9, 1), (11, 1), (16, 1)],
  term (10 : Rat) [(0, 2), (9, 1), (11, 1), (16, 1)],
  term (10 : Rat) [(1, 2), (9, 1), (11, 1), (16, 1)],
  term (20 : Rat) [(9, 1), (11, 1), (12, 1), (16, 1)],
  term (-10 : Rat) [(9, 1), (11, 1), (12, 2), (16, 1)],
  term (-10 : Rat) [(9, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 108 for generator 7. -/
theorem ep_Q1_028_partial_07_0108_valid :
    mulPoly ep_Q1_028_coefficient_07_0108
        ep_Q1_028_generator_07_0100_0119 =
      ep_Q1_028_partial_07_0108 := by
  native_decide

/-- Coefficient term 109 from coefficient polynomial 7. -/
def ep_Q1_028_coefficient_07_0109 : Poly :=
[
  term (-6 : Rat) [(9, 1), (13, 1), (16, 1)]
]

/-- Partial product 109 for generator 7. -/
def ep_Q1_028_partial_07_0109 : Poly :=
[
  term (12 : Rat) [(0, 1), (9, 1), (13, 1), (16, 1)],
  term (-6 : Rat) [(0, 2), (9, 1), (13, 1), (16, 1)],
  term (-6 : Rat) [(1, 2), (9, 1), (13, 1), (16, 1)],
  term (-12 : Rat) [(9, 1), (12, 1), (13, 1), (16, 1)],
  term (6 : Rat) [(9, 1), (12, 2), (13, 1), (16, 1)],
  term (6 : Rat) [(9, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 109 for generator 7. -/
theorem ep_Q1_028_partial_07_0109_valid :
    mulPoly ep_Q1_028_coefficient_07_0109
        ep_Q1_028_generator_07_0100_0119 =
      ep_Q1_028_partial_07_0109 := by
  native_decide

/-- Coefficient term 110 from coefficient polynomial 7. -/
def ep_Q1_028_coefficient_07_0110 : Poly :=
[
  term (10 : Rat) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 110 for generator 7. -/
def ep_Q1_028_partial_07_0110 : Poly :=
[
  term (-20 : Rat) [(0, 1), (9, 1), (15, 1), (16, 1)],
  term (10 : Rat) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term (10 : Rat) [(1, 2), (9, 1), (15, 1), (16, 1)],
  term (20 : Rat) [(9, 1), (12, 1), (15, 1), (16, 1)],
  term (-10 : Rat) [(9, 1), (12, 2), (15, 1), (16, 1)],
  term (-10 : Rat) [(9, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 110 for generator 7. -/
theorem ep_Q1_028_partial_07_0110_valid :
    mulPoly ep_Q1_028_coefficient_07_0110
        ep_Q1_028_generator_07_0100_0119 =
      ep_Q1_028_partial_07_0110 := by
  native_decide

/-- Coefficient term 111 from coefficient polynomial 7. -/
def ep_Q1_028_coefficient_07_0111 : Poly :=
[
  term (-8 : Rat) [(9, 2), (16, 1)]
]

/-- Partial product 111 for generator 7. -/
def ep_Q1_028_partial_07_0111 : Poly :=
[
  term (16 : Rat) [(0, 1), (9, 2), (16, 1)],
  term (-8 : Rat) [(0, 2), (9, 2), (16, 1)],
  term (-8 : Rat) [(1, 2), (9, 2), (16, 1)],
  term (-16 : Rat) [(9, 2), (12, 1), (16, 1)],
  term (8 : Rat) [(9, 2), (12, 2), (16, 1)],
  term (8 : Rat) [(9, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 111 for generator 7. -/
theorem ep_Q1_028_partial_07_0111_valid :
    mulPoly ep_Q1_028_coefficient_07_0111
        ep_Q1_028_generator_07_0100_0119 =
      ep_Q1_028_partial_07_0111 := by
  native_decide

/-- Coefficient term 112 from coefficient polynomial 7. -/
def ep_Q1_028_coefficient_07_0112 : Poly :=
[
  term (12 : Rat) [(11, 1), (13, 1), (16, 1)]
]

/-- Partial product 112 for generator 7. -/
def ep_Q1_028_partial_07_0112 : Poly :=
[
  term (-24 : Rat) [(0, 1), (11, 1), (13, 1), (16, 1)],
  term (12 : Rat) [(0, 2), (11, 1), (13, 1), (16, 1)],
  term (12 : Rat) [(1, 2), (11, 1), (13, 1), (16, 1)],
  term (24 : Rat) [(11, 1), (12, 1), (13, 1), (16, 1)],
  term (-12 : Rat) [(11, 1), (12, 2), (13, 1), (16, 1)],
  term (-12 : Rat) [(11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 112 for generator 7. -/
theorem ep_Q1_028_partial_07_0112_valid :
    mulPoly ep_Q1_028_coefficient_07_0112
        ep_Q1_028_generator_07_0100_0119 =
      ep_Q1_028_partial_07_0112 := by
  native_decide

/-- Coefficient term 113 from coefficient polynomial 7. -/
def ep_Q1_028_coefficient_07_0113 : Poly :=
[
  term (-3 : Rat) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 113 for generator 7. -/
def ep_Q1_028_partial_07_0113 : Poly :=
[
  term (6 : Rat) [(0, 1), (11, 1), (15, 1), (16, 1)],
  term (-3 : Rat) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term (-3 : Rat) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(11, 1), (12, 1), (15, 1), (16, 1)],
  term (3 : Rat) [(11, 1), (12, 2), (15, 1), (16, 1)],
  term (3 : Rat) [(11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 113 for generator 7. -/
theorem ep_Q1_028_partial_07_0113_valid :
    mulPoly ep_Q1_028_coefficient_07_0113
        ep_Q1_028_generator_07_0100_0119 =
      ep_Q1_028_partial_07_0113 := by
  native_decide

/-- Coefficient term 114 from coefficient polynomial 7. -/
def ep_Q1_028_coefficient_07_0114 : Poly :=
[
  term (12 : Rat) [(11, 2), (16, 1)]
]

/-- Partial product 114 for generator 7. -/
def ep_Q1_028_partial_07_0114 : Poly :=
[
  term (-24 : Rat) [(0, 1), (11, 2), (16, 1)],
  term (12 : Rat) [(0, 2), (11, 2), (16, 1)],
  term (12 : Rat) [(1, 2), (11, 2), (16, 1)],
  term (24 : Rat) [(11, 2), (12, 1), (16, 1)],
  term (-12 : Rat) [(11, 2), (12, 2), (16, 1)],
  term (-12 : Rat) [(11, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 114 for generator 7. -/
theorem ep_Q1_028_partial_07_0114_valid :
    mulPoly ep_Q1_028_coefficient_07_0114
        ep_Q1_028_generator_07_0100_0119 =
      ep_Q1_028_partial_07_0114 := by
  native_decide

/-- Coefficient term 115 from coefficient polynomial 7. -/
def ep_Q1_028_coefficient_07_0115 : Poly :=
[
  term (-6 : Rat) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 115 for generator 7. -/
def ep_Q1_028_partial_07_0115 : Poly :=
[
  term (12 : Rat) [(0, 1), (13, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(12, 1), (13, 1), (15, 1), (16, 1)],
  term (6 : Rat) [(12, 2), (13, 1), (15, 1), (16, 1)],
  term (6 : Rat) [(13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 115 for generator 7. -/
theorem ep_Q1_028_partial_07_0115_valid :
    mulPoly ep_Q1_028_coefficient_07_0115
        ep_Q1_028_generator_07_0100_0119 =
      ep_Q1_028_partial_07_0115 := by
  native_decide

/-- Coefficient term 116 from coefficient polynomial 7. -/
def ep_Q1_028_coefficient_07_0116 : Poly :=
[
  term (23 : Rat) [(14, 1), (16, 1)]
]

/-- Partial product 116 for generator 7. -/
def ep_Q1_028_partial_07_0116 : Poly :=
[
  term (-46 : Rat) [(0, 1), (14, 1), (16, 1)],
  term (23 : Rat) [(0, 2), (14, 1), (16, 1)],
  term (23 : Rat) [(1, 2), (14, 1), (16, 1)],
  term (46 : Rat) [(12, 1), (14, 1), (16, 1)],
  term (-23 : Rat) [(12, 2), (14, 1), (16, 1)],
  term (-23 : Rat) [(13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 116 for generator 7. -/
theorem ep_Q1_028_partial_07_0116_valid :
    mulPoly ep_Q1_028_coefficient_07_0116
        ep_Q1_028_generator_07_0100_0119 =
      ep_Q1_028_partial_07_0116 := by
  native_decide

/-- Coefficient term 117 from coefficient polynomial 7. -/
def ep_Q1_028_coefficient_07_0117 : Poly :=
[
  term (-12 : Rat) [(14, 2), (16, 1)]
]

/-- Partial product 117 for generator 7. -/
def ep_Q1_028_partial_07_0117 : Poly :=
[
  term (24 : Rat) [(0, 1), (14, 2), (16, 1)],
  term (-12 : Rat) [(0, 2), (14, 2), (16, 1)],
  term (-12 : Rat) [(1, 2), (14, 2), (16, 1)],
  term (-24 : Rat) [(12, 1), (14, 2), (16, 1)],
  term (12 : Rat) [(12, 2), (14, 2), (16, 1)],
  term (12 : Rat) [(13, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 117 for generator 7. -/
theorem ep_Q1_028_partial_07_0117_valid :
    mulPoly ep_Q1_028_coefficient_07_0117
        ep_Q1_028_generator_07_0100_0119 =
      ep_Q1_028_partial_07_0117 := by
  native_decide

/-- Coefficient term 118 from coefficient polynomial 7. -/
def ep_Q1_028_coefficient_07_0118 : Poly :=
[
  term (-11 : Rat) [(15, 2), (16, 1)]
]

/-- Partial product 118 for generator 7. -/
def ep_Q1_028_partial_07_0118 : Poly :=
[
  term (22 : Rat) [(0, 1), (15, 2), (16, 1)],
  term (-11 : Rat) [(0, 2), (15, 2), (16, 1)],
  term (-11 : Rat) [(1, 2), (15, 2), (16, 1)],
  term (-22 : Rat) [(12, 1), (15, 2), (16, 1)],
  term (11 : Rat) [(12, 2), (15, 2), (16, 1)],
  term (11 : Rat) [(13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 118 for generator 7. -/
theorem ep_Q1_028_partial_07_0118_valid :
    mulPoly ep_Q1_028_coefficient_07_0118
        ep_Q1_028_generator_07_0100_0119 =
      ep_Q1_028_partial_07_0118 := by
  native_decide

/-- Coefficient term 119 from coefficient polynomial 7. -/
def ep_Q1_028_coefficient_07_0119 : Poly :=
[
  term ((-5 : Rat) / 2) [(16, 1)]
]

/-- Partial product 119 for generator 7. -/
def ep_Q1_028_partial_07_0119 : Poly :=
[
  term (5 : Rat) [(0, 1), (16, 1)],
  term ((-5 : Rat) / 2) [(0, 2), (16, 1)],
  term ((-5 : Rat) / 2) [(1, 2), (16, 1)],
  term (-5 : Rat) [(12, 1), (16, 1)],
  term ((5 : Rat) / 2) [(12, 2), (16, 1)],
  term ((5 : Rat) / 2) [(13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 119 for generator 7. -/
theorem ep_Q1_028_partial_07_0119_valid :
    mulPoly ep_Q1_028_coefficient_07_0119
        ep_Q1_028_generator_07_0100_0119 =
      ep_Q1_028_partial_07_0119 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q1_028_partials_07_0100_0119 : List Poly :=
[
  ep_Q1_028_partial_07_0100,
  ep_Q1_028_partial_07_0101,
  ep_Q1_028_partial_07_0102,
  ep_Q1_028_partial_07_0103,
  ep_Q1_028_partial_07_0104,
  ep_Q1_028_partial_07_0105,
  ep_Q1_028_partial_07_0106,
  ep_Q1_028_partial_07_0107,
  ep_Q1_028_partial_07_0108,
  ep_Q1_028_partial_07_0109,
  ep_Q1_028_partial_07_0110,
  ep_Q1_028_partial_07_0111,
  ep_Q1_028_partial_07_0112,
  ep_Q1_028_partial_07_0113,
  ep_Q1_028_partial_07_0114,
  ep_Q1_028_partial_07_0115,
  ep_Q1_028_partial_07_0116,
  ep_Q1_028_partial_07_0117,
  ep_Q1_028_partial_07_0118,
  ep_Q1_028_partial_07_0119
]

/-- Sum of partial products in this block. -/
def ep_Q1_028_block_07_0100_0119 : Poly :=
[
  term ((1408 : Rat) / 3) [(0, 1), (7, 2), (11, 1), (13, 1), (16, 1)],
  term ((-352 : Rat) / 3) [(0, 1), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((1408 : Rat) / 3) [(0, 1), (7, 2), (11, 2), (16, 1)],
  term ((-5632 : Rat) / 15) [(0, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((5128 : Rat) / 15) [(0, 1), (7, 2), (14, 1), (16, 1)],
  term ((-2816 : Rat) / 15) [(0, 1), (7, 2), (14, 2), (16, 1)],
  term ((-5984 : Rat) / 15) [(0, 1), (7, 2), (15, 2), (16, 1)],
  term ((-352 : Rat) / 3) [(0, 1), (7, 2), (16, 1)],
  term (-20 : Rat) [(0, 1), (9, 1), (11, 1), (16, 1)],
  term (12 : Rat) [(0, 1), (9, 1), (13, 1), (16, 1)],
  term (-20 : Rat) [(0, 1), (9, 1), (15, 1), (16, 1)],
  term (16 : Rat) [(0, 1), (9, 2), (16, 1)],
  term (-24 : Rat) [(0, 1), (11, 1), (13, 1), (16, 1)],
  term (6 : Rat) [(0, 1), (11, 1), (15, 1), (16, 1)],
  term (-24 : Rat) [(0, 1), (11, 2), (16, 1)],
  term (12 : Rat) [(0, 1), (13, 1), (15, 1), (16, 1)],
  term (-46 : Rat) [(0, 1), (14, 1), (16, 1)],
  term (24 : Rat) [(0, 1), (14, 2), (16, 1)],
  term (22 : Rat) [(0, 1), (15, 2), (16, 1)],
  term (5 : Rat) [(0, 1), (16, 1)],
  term ((-704 : Rat) / 3) [(0, 2), (7, 2), (11, 1), (13, 1), (16, 1)],
  term ((176 : Rat) / 3) [(0, 2), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((-704 : Rat) / 3) [(0, 2), (7, 2), (11, 2), (16, 1)],
  term ((2816 : Rat) / 15) [(0, 2), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-2564 : Rat) / 15) [(0, 2), (7, 2), (14, 1), (16, 1)],
  term ((1408 : Rat) / 15) [(0, 2), (7, 2), (14, 2), (16, 1)],
  term ((2992 : Rat) / 15) [(0, 2), (7, 2), (15, 2), (16, 1)],
  term ((176 : Rat) / 3) [(0, 2), (7, 2), (16, 1)],
  term (10 : Rat) [(0, 2), (9, 1), (11, 1), (16, 1)],
  term (-6 : Rat) [(0, 2), (9, 1), (13, 1), (16, 1)],
  term (10 : Rat) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(0, 2), (9, 2), (16, 1)],
  term (12 : Rat) [(0, 2), (11, 1), (13, 1), (16, 1)],
  term (-3 : Rat) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(0, 2), (11, 2), (16, 1)],
  term (-6 : Rat) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term (23 : Rat) [(0, 2), (14, 1), (16, 1)],
  term (-12 : Rat) [(0, 2), (14, 2), (16, 1)],
  term (-11 : Rat) [(0, 2), (15, 2), (16, 1)],
  term ((-5 : Rat) / 2) [(0, 2), (16, 1)],
  term ((-704 : Rat) / 3) [(1, 2), (7, 2), (11, 1), (13, 1), (16, 1)],
  term ((176 : Rat) / 3) [(1, 2), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((-704 : Rat) / 3) [(1, 2), (7, 2), (11, 2), (16, 1)],
  term ((2816 : Rat) / 15) [(1, 2), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-2564 : Rat) / 15) [(1, 2), (7, 2), (14, 1), (16, 1)],
  term ((1408 : Rat) / 15) [(1, 2), (7, 2), (14, 2), (16, 1)],
  term ((2992 : Rat) / 15) [(1, 2), (7, 2), (15, 2), (16, 1)],
  term ((176 : Rat) / 3) [(1, 2), (7, 2), (16, 1)],
  term (10 : Rat) [(1, 2), (9, 1), (11, 1), (16, 1)],
  term (-6 : Rat) [(1, 2), (9, 1), (13, 1), (16, 1)],
  term (10 : Rat) [(1, 2), (9, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(1, 2), (9, 2), (16, 1)],
  term (12 : Rat) [(1, 2), (11, 1), (13, 1), (16, 1)],
  term (-3 : Rat) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(1, 2), (11, 2), (16, 1)],
  term (-6 : Rat) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term (23 : Rat) [(1, 2), (14, 1), (16, 1)],
  term (-12 : Rat) [(1, 2), (14, 2), (16, 1)],
  term (-11 : Rat) [(1, 2), (15, 2), (16, 1)],
  term ((-5 : Rat) / 2) [(1, 2), (16, 1)],
  term ((-1408 : Rat) / 3) [(7, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((352 : Rat) / 3) [(7, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((704 : Rat) / 3) [(7, 2), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-176 : Rat) / 3) [(7, 2), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-176 : Rat) / 3) [(7, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((704 : Rat) / 3) [(7, 2), (11, 1), (13, 3), (16, 1)],
  term ((-1408 : Rat) / 3) [(7, 2), (11, 2), (12, 1), (16, 1)],
  term ((704 : Rat) / 3) [(7, 2), (11, 2), (12, 2), (16, 1)],
  term ((704 : Rat) / 3) [(7, 2), (11, 2), (13, 2), (16, 1)],
  term ((5632 : Rat) / 15) [(7, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-5128 : Rat) / 15) [(7, 2), (12, 1), (14, 1), (16, 1)],
  term ((2816 : Rat) / 15) [(7, 2), (12, 1), (14, 2), (16, 1)],
  term ((5984 : Rat) / 15) [(7, 2), (12, 1), (15, 2), (16, 1)],
  term ((352 : Rat) / 3) [(7, 2), (12, 1), (16, 1)],
  term ((-2816 : Rat) / 15) [(7, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((2564 : Rat) / 15) [(7, 2), (12, 2), (14, 1), (16, 1)],
  term ((-1408 : Rat) / 15) [(7, 2), (12, 2), (14, 2), (16, 1)],
  term ((-2992 : Rat) / 15) [(7, 2), (12, 2), (15, 2), (16, 1)],
  term ((-176 : Rat) / 3) [(7, 2), (12, 2), (16, 1)],
  term ((2564 : Rat) / 15) [(7, 2), (13, 2), (14, 1), (16, 1)],
  term ((-1408 : Rat) / 15) [(7, 2), (13, 2), (14, 2), (16, 1)],
  term ((-2992 : Rat) / 15) [(7, 2), (13, 2), (15, 2), (16, 1)],
  term ((-176 : Rat) / 3) [(7, 2), (13, 2), (16, 1)],
  term ((-2816 : Rat) / 15) [(7, 2), (13, 3), (15, 1), (16, 1)],
  term (20 : Rat) [(9, 1), (11, 1), (12, 1), (16, 1)],
  term (-10 : Rat) [(9, 1), (11, 1), (12, 2), (16, 1)],
  term (-10 : Rat) [(9, 1), (11, 1), (13, 2), (16, 1)],
  term (-12 : Rat) [(9, 1), (12, 1), (13, 1), (16, 1)],
  term (20 : Rat) [(9, 1), (12, 1), (15, 1), (16, 1)],
  term (6 : Rat) [(9, 1), (12, 2), (13, 1), (16, 1)],
  term (-10 : Rat) [(9, 1), (12, 2), (15, 1), (16, 1)],
  term (-10 : Rat) [(9, 1), (13, 2), (15, 1), (16, 1)],
  term (6 : Rat) [(9, 1), (13, 3), (16, 1)],
  term (-16 : Rat) [(9, 2), (12, 1), (16, 1)],
  term (8 : Rat) [(9, 2), (12, 2), (16, 1)],
  term (8 : Rat) [(9, 2), (13, 2), (16, 1)],
  term (24 : Rat) [(11, 1), (12, 1), (13, 1), (16, 1)],
  term (-6 : Rat) [(11, 1), (12, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(11, 1), (12, 2), (13, 1), (16, 1)],
  term (3 : Rat) [(11, 1), (12, 2), (15, 1), (16, 1)],
  term (3 : Rat) [(11, 1), (13, 2), (15, 1), (16, 1)],
  term (-12 : Rat) [(11, 1), (13, 3), (16, 1)],
  term (24 : Rat) [(11, 2), (12, 1), (16, 1)],
  term (-12 : Rat) [(11, 2), (12, 2), (16, 1)],
  term (-12 : Rat) [(11, 2), (13, 2), (16, 1)],
  term (-12 : Rat) [(12, 1), (13, 1), (15, 1), (16, 1)],
  term (46 : Rat) [(12, 1), (14, 1), (16, 1)],
  term (-24 : Rat) [(12, 1), (14, 2), (16, 1)],
  term (-22 : Rat) [(12, 1), (15, 2), (16, 1)],
  term (-5 : Rat) [(12, 1), (16, 1)],
  term (6 : Rat) [(12, 2), (13, 1), (15, 1), (16, 1)],
  term (-23 : Rat) [(12, 2), (14, 1), (16, 1)],
  term (12 : Rat) [(12, 2), (14, 2), (16, 1)],
  term (11 : Rat) [(12, 2), (15, 2), (16, 1)],
  term ((5 : Rat) / 2) [(12, 2), (16, 1)],
  term (-23 : Rat) [(13, 2), (14, 1), (16, 1)],
  term (12 : Rat) [(13, 2), (14, 2), (16, 1)],
  term (11 : Rat) [(13, 2), (15, 2), (16, 1)],
  term ((5 : Rat) / 2) [(13, 2), (16, 1)],
  term (6 : Rat) [(13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 7, terms 100 through 119. -/
theorem ep_Q1_028_block_07_0100_0119_valid :
    checkProductSumEq ep_Q1_028_partials_07_0100_0119
      ep_Q1_028_block_07_0100_0119 = true := by
  native_decide

end EpQ1028TermShards

end Patterns

end EndpointCertificate

end Problem97
