/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q1_028, term block 21:100-114

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q1_028`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ1028TermShards

/-- Generator polynomial 21 for endpoint certificate `ep_Q1_028`. -/
def ep_Q1_028_generator_21_0100_0114 : Poly :=
[
  term (-1 : Rat) [],
  term (-2 : Rat) [(0, 1), (10, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (11, 1)],
  term (1 : Rat) [(1, 2)],
  term (2 : Rat) [(10, 1)]
]

/-- Coefficient term 100 from coefficient polynomial 21. -/
def ep_Q1_028_coefficient_21_0100 : Poly :=
[
  term ((-176 : Rat) / 3) [(7, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 100 for generator 21. -/
def ep_Q1_028_partial_21_0100 : Poly :=
[
  term ((352 : Rat) / 3) [(0, 1), (7, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-176 : Rat) / 3) [(0, 2), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((352 : Rat) / 3) [(1, 1), (7, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-176 : Rat) / 3) [(1, 2), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-352 : Rat) / 3) [(7, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((176 : Rat) / 3) [(7, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 21. -/
theorem ep_Q1_028_partial_21_0100_valid :
    mulPoly ep_Q1_028_coefficient_21_0100
        ep_Q1_028_generator_21_0100_0114 =
      ep_Q1_028_partial_21_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 21. -/
def ep_Q1_028_coefficient_21_0101 : Poly :=
[
  term ((704 : Rat) / 3) [(7, 2), (13, 2), (16, 1)]
]

/-- Partial product 101 for generator 21. -/
def ep_Q1_028_partial_21_0101 : Poly :=
[
  term ((-1408 : Rat) / 3) [(0, 1), (7, 2), (10, 1), (13, 2), (16, 1)],
  term ((704 : Rat) / 3) [(0, 2), (7, 2), (13, 2), (16, 1)],
  term ((-1408 : Rat) / 3) [(1, 1), (7, 2), (11, 1), (13, 2), (16, 1)],
  term ((704 : Rat) / 3) [(1, 2), (7, 2), (13, 2), (16, 1)],
  term ((1408 : Rat) / 3) [(7, 2), (10, 1), (13, 2), (16, 1)],
  term ((-704 : Rat) / 3) [(7, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 21. -/
theorem ep_Q1_028_partial_21_0101_valid :
    mulPoly ep_Q1_028_coefficient_21_0101
        ep_Q1_028_generator_21_0100_0114 =
      ep_Q1_028_partial_21_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 21. -/
def ep_Q1_028_coefficient_21_0102 : Poly :=
[
  term ((-176 : Rat) / 3) [(7, 2), (15, 2), (16, 1)]
]

/-- Partial product 102 for generator 21. -/
def ep_Q1_028_partial_21_0102 : Poly :=
[
  term ((352 : Rat) / 3) [(0, 1), (7, 2), (10, 1), (15, 2), (16, 1)],
  term ((-176 : Rat) / 3) [(0, 2), (7, 2), (15, 2), (16, 1)],
  term ((352 : Rat) / 3) [(1, 1), (7, 2), (11, 1), (15, 2), (16, 1)],
  term ((-176 : Rat) / 3) [(1, 2), (7, 2), (15, 2), (16, 1)],
  term ((-352 : Rat) / 3) [(7, 2), (10, 1), (15, 2), (16, 1)],
  term ((176 : Rat) / 3) [(7, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 21. -/
theorem ep_Q1_028_partial_21_0102_valid :
    mulPoly ep_Q1_028_coefficient_21_0102
        ep_Q1_028_generator_21_0100_0114 =
      ep_Q1_028_partial_21_0102 := by
  native_decide

/-- Coefficient term 103 from coefficient polynomial 21. -/
def ep_Q1_028_coefficient_21_0103 : Poly :=
[
  term ((-136 : Rat) / 5) [(7, 2), (16, 1)]
]

/-- Partial product 103 for generator 21. -/
def ep_Q1_028_partial_21_0103 : Poly :=
[
  term ((272 : Rat) / 5) [(0, 1), (7, 2), (10, 1), (16, 1)],
  term ((-136 : Rat) / 5) [(0, 2), (7, 2), (16, 1)],
  term ((272 : Rat) / 5) [(1, 1), (7, 2), (11, 1), (16, 1)],
  term ((-136 : Rat) / 5) [(1, 2), (7, 2), (16, 1)],
  term ((-272 : Rat) / 5) [(7, 2), (10, 1), (16, 1)],
  term ((136 : Rat) / 5) [(7, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 103 for generator 21. -/
theorem ep_Q1_028_partial_21_0103_valid :
    mulPoly ep_Q1_028_coefficient_21_0103
        ep_Q1_028_generator_21_0100_0114 =
      ep_Q1_028_partial_21_0103 := by
  native_decide

/-- Coefficient term 104 from coefficient polynomial 21. -/
def ep_Q1_028_coefficient_21_0104 : Poly :=
[
  term ((9 : Rat) / 2) [(9, 1), (11, 1), (16, 1)]
]

/-- Partial product 104 for generator 21. -/
def ep_Q1_028_partial_21_0104 : Poly :=
[
  term (-9 : Rat) [(0, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((9 : Rat) / 2) [(0, 2), (9, 1), (11, 1), (16, 1)],
  term (-9 : Rat) [(1, 1), (9, 1), (11, 2), (16, 1)],
  term ((9 : Rat) / 2) [(1, 2), (9, 1), (11, 1), (16, 1)],
  term (9 : Rat) [(9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-9 : Rat) / 2) [(9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 104 for generator 21. -/
theorem ep_Q1_028_partial_21_0104_valid :
    mulPoly ep_Q1_028_coefficient_21_0104
        ep_Q1_028_generator_21_0100_0114 =
      ep_Q1_028_partial_21_0104 := by
  native_decide

/-- Coefficient term 105 from coefficient polynomial 21. -/
def ep_Q1_028_coefficient_21_0105 : Poly :=
[
  term (-13 : Rat) [(9, 1), (13, 1), (16, 1)]
]

/-- Partial product 105 for generator 21. -/
def ep_Q1_028_partial_21_0105 : Poly :=
[
  term (26 : Rat) [(0, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term (-13 : Rat) [(0, 2), (9, 1), (13, 1), (16, 1)],
  term (26 : Rat) [(1, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term (-13 : Rat) [(1, 2), (9, 1), (13, 1), (16, 1)],
  term (-26 : Rat) [(9, 1), (10, 1), (13, 1), (16, 1)],
  term (13 : Rat) [(9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 105 for generator 21. -/
theorem ep_Q1_028_partial_21_0105_valid :
    mulPoly ep_Q1_028_coefficient_21_0105
        ep_Q1_028_generator_21_0100_0114 =
      ep_Q1_028_partial_21_0105 := by
  native_decide

/-- Coefficient term 106 from coefficient polynomial 21. -/
def ep_Q1_028_coefficient_21_0106 : Poly :=
[
  term ((9 : Rat) / 2) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 106 for generator 21. -/
def ep_Q1_028_partial_21_0106 : Poly :=
[
  term (-9 : Rat) [(0, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((9 : Rat) / 2) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term (-9 : Rat) [(1, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((9 : Rat) / 2) [(1, 2), (9, 1), (15, 1), (16, 1)],
  term (9 : Rat) [(9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-9 : Rat) / 2) [(9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 106 for generator 21. -/
theorem ep_Q1_028_partial_21_0106_valid :
    mulPoly ep_Q1_028_coefficient_21_0106
        ep_Q1_028_generator_21_0100_0114 =
      ep_Q1_028_partial_21_0106 := by
  native_decide

/-- Coefficient term 107 from coefficient polynomial 21. -/
def ep_Q1_028_coefficient_21_0107 : Poly :=
[
  term (6 : Rat) [(9, 2), (16, 1)]
]

/-- Partial product 107 for generator 21. -/
def ep_Q1_028_partial_21_0107 : Poly :=
[
  term (-12 : Rat) [(0, 1), (9, 2), (10, 1), (16, 1)],
  term (6 : Rat) [(0, 2), (9, 2), (16, 1)],
  term (-12 : Rat) [(1, 1), (9, 2), (11, 1), (16, 1)],
  term (6 : Rat) [(1, 2), (9, 2), (16, 1)],
  term (12 : Rat) [(9, 2), (10, 1), (16, 1)],
  term (-6 : Rat) [(9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 107 for generator 21. -/
theorem ep_Q1_028_partial_21_0107_valid :
    mulPoly ep_Q1_028_coefficient_21_0107
        ep_Q1_028_generator_21_0100_0114 =
      ep_Q1_028_partial_21_0107 := by
  native_decide

/-- Coefficient term 108 from coefficient polynomial 21. -/
def ep_Q1_028_coefficient_21_0108 : Poly :=
[
  term ((-3 : Rat) / 2) [(10, 1), (16, 1)]
]

/-- Partial product 108 for generator 21. -/
def ep_Q1_028_partial_21_0108 : Poly :=
[
  term (3 : Rat) [(0, 1), (10, 2), (16, 1)],
  term ((-3 : Rat) / 2) [(0, 2), (10, 1), (16, 1)],
  term (3 : Rat) [(1, 1), (10, 1), (11, 1), (16, 1)],
  term ((-3 : Rat) / 2) [(1, 2), (10, 1), (16, 1)],
  term ((3 : Rat) / 2) [(10, 1), (16, 1)],
  term (-3 : Rat) [(10, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 108 for generator 21. -/
theorem ep_Q1_028_partial_21_0108_valid :
    mulPoly ep_Q1_028_coefficient_21_0108
        ep_Q1_028_generator_21_0100_0114 =
      ep_Q1_028_partial_21_0108 := by
  native_decide

/-- Coefficient term 109 from coefficient polynomial 21. -/
def ep_Q1_028_coefficient_21_0109 : Poly :=
[
  term (-12 : Rat) [(11, 1), (13, 1), (16, 1)]
]

/-- Partial product 109 for generator 21. -/
def ep_Q1_028_partial_21_0109 : Poly :=
[
  term (24 : Rat) [(0, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term (-12 : Rat) [(0, 2), (11, 1), (13, 1), (16, 1)],
  term (24 : Rat) [(1, 1), (11, 2), (13, 1), (16, 1)],
  term (-12 : Rat) [(1, 2), (11, 1), (13, 1), (16, 1)],
  term (-24 : Rat) [(10, 1), (11, 1), (13, 1), (16, 1)],
  term (12 : Rat) [(11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 109 for generator 21. -/
theorem ep_Q1_028_partial_21_0109_valid :
    mulPoly ep_Q1_028_coefficient_21_0109
        ep_Q1_028_generator_21_0100_0114 =
      ep_Q1_028_partial_21_0109 := by
  native_decide

/-- Coefficient term 110 from coefficient polynomial 21. -/
def ep_Q1_028_coefficient_21_0110 : Poly :=
[
  term (6 : Rat) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 110 for generator 21. -/
def ep_Q1_028_partial_21_0110 : Poly :=
[
  term (-12 : Rat) [(0, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term (6 : Rat) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(1, 1), (11, 2), (15, 1), (16, 1)],
  term (6 : Rat) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(10, 1), (11, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 110 for generator 21. -/
theorem ep_Q1_028_partial_21_0110_valid :
    mulPoly ep_Q1_028_coefficient_21_0110
        ep_Q1_028_generator_21_0100_0114 =
      ep_Q1_028_partial_21_0110 := by
  native_decide

/-- Coefficient term 111 from coefficient polynomial 21. -/
def ep_Q1_028_coefficient_21_0111 : Poly :=
[
  term (3 : Rat) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 111 for generator 21. -/
def ep_Q1_028_partial_21_0111 : Poly :=
[
  term (-6 : Rat) [(0, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term (3 : Rat) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term (3 : Rat) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term (6 : Rat) [(10, 1), (13, 1), (15, 1), (16, 1)],
  term (-3 : Rat) [(13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 111 for generator 21. -/
theorem ep_Q1_028_partial_21_0111_valid :
    mulPoly ep_Q1_028_coefficient_21_0111
        ep_Q1_028_generator_21_0100_0114 =
      ep_Q1_028_partial_21_0111 := by
  native_decide

/-- Coefficient term 112 from coefficient polynomial 21. -/
def ep_Q1_028_coefficient_21_0112 : Poly :=
[
  term (-12 : Rat) [(13, 2), (16, 1)]
]

/-- Partial product 112 for generator 21. -/
def ep_Q1_028_partial_21_0112 : Poly :=
[
  term (24 : Rat) [(0, 1), (10, 1), (13, 2), (16, 1)],
  term (-12 : Rat) [(0, 2), (13, 2), (16, 1)],
  term (24 : Rat) [(1, 1), (11, 1), (13, 2), (16, 1)],
  term (-12 : Rat) [(1, 2), (13, 2), (16, 1)],
  term (-24 : Rat) [(10, 1), (13, 2), (16, 1)],
  term (12 : Rat) [(13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 112 for generator 21. -/
theorem ep_Q1_028_partial_21_0112_valid :
    mulPoly ep_Q1_028_coefficient_21_0112
        ep_Q1_028_generator_21_0100_0114 =
      ep_Q1_028_partial_21_0112 := by
  native_decide

/-- Coefficient term 113 from coefficient polynomial 21. -/
def ep_Q1_028_coefficient_21_0113 : Poly :=
[
  term (3 : Rat) [(15, 2), (16, 1)]
]

/-- Partial product 113 for generator 21. -/
def ep_Q1_028_partial_21_0113 : Poly :=
[
  term (-6 : Rat) [(0, 1), (10, 1), (15, 2), (16, 1)],
  term (3 : Rat) [(0, 2), (15, 2), (16, 1)],
  term (-6 : Rat) [(1, 1), (11, 1), (15, 2), (16, 1)],
  term (3 : Rat) [(1, 2), (15, 2), (16, 1)],
  term (6 : Rat) [(10, 1), (15, 2), (16, 1)],
  term (-3 : Rat) [(15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 113 for generator 21. -/
theorem ep_Q1_028_partial_21_0113_valid :
    mulPoly ep_Q1_028_coefficient_21_0113
        ep_Q1_028_generator_21_0100_0114 =
      ep_Q1_028_partial_21_0113 := by
  native_decide

/-- Coefficient term 114 from coefficient polynomial 21. -/
def ep_Q1_028_coefficient_21_0114 : Poly :=
[
  term ((-7 : Rat) / 4) [(16, 1)]
]

/-- Partial product 114 for generator 21. -/
def ep_Q1_028_partial_21_0114 : Poly :=
[
  term ((7 : Rat) / 2) [(0, 1), (10, 1), (16, 1)],
  term ((-7 : Rat) / 4) [(0, 2), (16, 1)],
  term ((7 : Rat) / 2) [(1, 1), (11, 1), (16, 1)],
  term ((-7 : Rat) / 4) [(1, 2), (16, 1)],
  term ((-7 : Rat) / 2) [(10, 1), (16, 1)],
  term ((7 : Rat) / 4) [(16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 114 for generator 21. -/
theorem ep_Q1_028_partial_21_0114_valid :
    mulPoly ep_Q1_028_coefficient_21_0114
        ep_Q1_028_generator_21_0100_0114 =
      ep_Q1_028_partial_21_0114 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q1_028_partials_21_0100_0114 : List Poly :=
[
  ep_Q1_028_partial_21_0100,
  ep_Q1_028_partial_21_0101,
  ep_Q1_028_partial_21_0102,
  ep_Q1_028_partial_21_0103,
  ep_Q1_028_partial_21_0104,
  ep_Q1_028_partial_21_0105,
  ep_Q1_028_partial_21_0106,
  ep_Q1_028_partial_21_0107,
  ep_Q1_028_partial_21_0108,
  ep_Q1_028_partial_21_0109,
  ep_Q1_028_partial_21_0110,
  ep_Q1_028_partial_21_0111,
  ep_Q1_028_partial_21_0112,
  ep_Q1_028_partial_21_0113,
  ep_Q1_028_partial_21_0114
]

/-- Sum of partial products in this block. -/
def ep_Q1_028_block_21_0100_0114 : Poly :=
[
  term ((352 : Rat) / 3) [(0, 1), (7, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1408 : Rat) / 3) [(0, 1), (7, 2), (10, 1), (13, 2), (16, 1)],
  term ((352 : Rat) / 3) [(0, 1), (7, 2), (10, 1), (15, 2), (16, 1)],
  term ((272 : Rat) / 5) [(0, 1), (7, 2), (10, 1), (16, 1)],
  term (-9 : Rat) [(0, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term (26 : Rat) [(0, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term (-9 : Rat) [(0, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(0, 1), (9, 2), (10, 1), (16, 1)],
  term (24 : Rat) [(0, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term (-12 : Rat) [(0, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(0, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term (24 : Rat) [(0, 1), (10, 1), (13, 2), (16, 1)],
  term (-6 : Rat) [(0, 1), (10, 1), (15, 2), (16, 1)],
  term ((7 : Rat) / 2) [(0, 1), (10, 1), (16, 1)],
  term (3 : Rat) [(0, 1), (10, 2), (16, 1)],
  term ((-176 : Rat) / 3) [(0, 2), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((704 : Rat) / 3) [(0, 2), (7, 2), (13, 2), (16, 1)],
  term ((-176 : Rat) / 3) [(0, 2), (7, 2), (15, 2), (16, 1)],
  term ((-136 : Rat) / 5) [(0, 2), (7, 2), (16, 1)],
  term ((9 : Rat) / 2) [(0, 2), (9, 1), (11, 1), (16, 1)],
  term (-13 : Rat) [(0, 2), (9, 1), (13, 1), (16, 1)],
  term ((9 : Rat) / 2) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term (6 : Rat) [(0, 2), (9, 2), (16, 1)],
  term ((-3 : Rat) / 2) [(0, 2), (10, 1), (16, 1)],
  term (-12 : Rat) [(0, 2), (11, 1), (13, 1), (16, 1)],
  term (6 : Rat) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term (3 : Rat) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(0, 2), (13, 2), (16, 1)],
  term (3 : Rat) [(0, 2), (15, 2), (16, 1)],
  term ((-7 : Rat) / 4) [(0, 2), (16, 1)],
  term ((352 : Rat) / 3) [(1, 1), (7, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1408 : Rat) / 3) [(1, 1), (7, 2), (11, 1), (13, 2), (16, 1)],
  term ((352 : Rat) / 3) [(1, 1), (7, 2), (11, 1), (15, 2), (16, 1)],
  term ((272 : Rat) / 5) [(1, 1), (7, 2), (11, 1), (16, 1)],
  term (26 : Rat) [(1, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term (-9 : Rat) [(1, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term (-9 : Rat) [(1, 1), (9, 1), (11, 2), (16, 1)],
  term (-12 : Rat) [(1, 1), (9, 2), (11, 1), (16, 1)],
  term (3 : Rat) [(1, 1), (10, 1), (11, 1), (16, 1)],
  term (-6 : Rat) [(1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term (24 : Rat) [(1, 1), (11, 1), (13, 2), (16, 1)],
  term (-6 : Rat) [(1, 1), (11, 1), (15, 2), (16, 1)],
  term ((7 : Rat) / 2) [(1, 1), (11, 1), (16, 1)],
  term (24 : Rat) [(1, 1), (11, 2), (13, 1), (16, 1)],
  term (-12 : Rat) [(1, 1), (11, 2), (15, 1), (16, 1)],
  term ((-176 : Rat) / 3) [(1, 2), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((704 : Rat) / 3) [(1, 2), (7, 2), (13, 2), (16, 1)],
  term ((-176 : Rat) / 3) [(1, 2), (7, 2), (15, 2), (16, 1)],
  term ((-136 : Rat) / 5) [(1, 2), (7, 2), (16, 1)],
  term ((9 : Rat) / 2) [(1, 2), (9, 1), (11, 1), (16, 1)],
  term (-13 : Rat) [(1, 2), (9, 1), (13, 1), (16, 1)],
  term ((9 : Rat) / 2) [(1, 2), (9, 1), (15, 1), (16, 1)],
  term (6 : Rat) [(1, 2), (9, 2), (16, 1)],
  term ((-3 : Rat) / 2) [(1, 2), (10, 1), (16, 1)],
  term (-12 : Rat) [(1, 2), (11, 1), (13, 1), (16, 1)],
  term (6 : Rat) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term (3 : Rat) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(1, 2), (13, 2), (16, 1)],
  term (3 : Rat) [(1, 2), (15, 2), (16, 1)],
  term ((-7 : Rat) / 4) [(1, 2), (16, 1)],
  term ((-352 : Rat) / 3) [(7, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((1408 : Rat) / 3) [(7, 2), (10, 1), (13, 2), (16, 1)],
  term ((-352 : Rat) / 3) [(7, 2), (10, 1), (15, 2), (16, 1)],
  term ((-272 : Rat) / 5) [(7, 2), (10, 1), (16, 1)],
  term ((176 : Rat) / 3) [(7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-704 : Rat) / 3) [(7, 2), (13, 2), (16, 1)],
  term ((176 : Rat) / 3) [(7, 2), (15, 2), (16, 1)],
  term ((136 : Rat) / 5) [(7, 2), (16, 1)],
  term (9 : Rat) [(9, 1), (10, 1), (11, 1), (16, 1)],
  term (-26 : Rat) [(9, 1), (10, 1), (13, 1), (16, 1)],
  term (9 : Rat) [(9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-9 : Rat) / 2) [(9, 1), (11, 1), (16, 1)],
  term (13 : Rat) [(9, 1), (13, 1), (16, 1)],
  term ((-9 : Rat) / 2) [(9, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(9, 2), (10, 1), (16, 1)],
  term (-6 : Rat) [(9, 2), (16, 1)],
  term (-24 : Rat) [(10, 1), (11, 1), (13, 1), (16, 1)],
  term (12 : Rat) [(10, 1), (11, 1), (15, 1), (16, 1)],
  term (6 : Rat) [(10, 1), (13, 1), (15, 1), (16, 1)],
  term (-24 : Rat) [(10, 1), (13, 2), (16, 1)],
  term (6 : Rat) [(10, 1), (15, 2), (16, 1)],
  term (-2 : Rat) [(10, 1), (16, 1)],
  term (-3 : Rat) [(10, 2), (16, 1)],
  term (12 : Rat) [(11, 1), (13, 1), (16, 1)],
  term (-6 : Rat) [(11, 1), (15, 1), (16, 1)],
  term (-3 : Rat) [(13, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(13, 2), (16, 1)],
  term (-3 : Rat) [(15, 2), (16, 1)],
  term ((7 : Rat) / 4) [(16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 21, terms 100 through 114. -/
theorem ep_Q1_028_block_21_0100_0114_valid :
    checkProductSumEq ep_Q1_028_partials_21_0100_0114
      ep_Q1_028_block_21_0100_0114 = true := by
  native_decide

end EpQ1028TermShards

end Patterns

end EndpointCertificate

end Problem97
