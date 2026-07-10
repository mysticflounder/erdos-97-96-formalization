/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q1_028, term block 1:100-111

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q1_028`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ1028TermShards

/-- Generator polynomial 1 for endpoint certificate `ep_Q1_028`. -/
def ep_Q1_028_generator_01_0100_0111 : Poly :=
[
  term (-2 : Rat) [(0, 1), (2, 1)],
  term (2 : Rat) [(0, 1), (10, 1)],
  term (-2 : Rat) [(1, 1), (3, 1)],
  term (2 : Rat) [(1, 1), (11, 1)],
  term (1 : Rat) [(2, 2)],
  term (1 : Rat) [(3, 2)],
  term (-1 : Rat) [(10, 2)],
  term (-1 : Rat) [(11, 2)]
]

/-- Coefficient term 100 from coefficient polynomial 1. -/
def ep_Q1_028_coefficient_01_0100 : Poly :=
[
  term ((436 : Rat) / 5) [(7, 2), (16, 1)]
]

/-- Partial product 100 for generator 1. -/
def ep_Q1_028_partial_01_0100 : Poly :=
[
  term ((-872 : Rat) / 5) [(0, 1), (2, 1), (7, 2), (16, 1)],
  term ((872 : Rat) / 5) [(0, 1), (7, 2), (10, 1), (16, 1)],
  term ((-872 : Rat) / 5) [(1, 1), (3, 1), (7, 2), (16, 1)],
  term ((872 : Rat) / 5) [(1, 1), (7, 2), (11, 1), (16, 1)],
  term ((436 : Rat) / 5) [(2, 2), (7, 2), (16, 1)],
  term ((436 : Rat) / 5) [(3, 2), (7, 2), (16, 1)],
  term ((-436 : Rat) / 5) [(7, 2), (10, 2), (16, 1)],
  term ((-436 : Rat) / 5) [(7, 2), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 1. -/
theorem ep_Q1_028_partial_01_0100_valid :
    mulPoly ep_Q1_028_coefficient_01_0100
        ep_Q1_028_generator_01_0100_0111 =
      ep_Q1_028_partial_01_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 1. -/
def ep_Q1_028_coefficient_01_0101 : Poly :=
[
  term (15 : Rat) [(9, 1), (11, 1), (16, 1)]
]

/-- Partial product 101 for generator 1. -/
def ep_Q1_028_partial_01_0101 : Poly :=
[
  term (-30 : Rat) [(0, 1), (2, 1), (9, 1), (11, 1), (16, 1)],
  term (30 : Rat) [(0, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term (-30 : Rat) [(1, 1), (3, 1), (9, 1), (11, 1), (16, 1)],
  term (30 : Rat) [(1, 1), (9, 1), (11, 2), (16, 1)],
  term (15 : Rat) [(2, 2), (9, 1), (11, 1), (16, 1)],
  term (15 : Rat) [(3, 2), (9, 1), (11, 1), (16, 1)],
  term (-15 : Rat) [(9, 1), (10, 2), (11, 1), (16, 1)],
  term (-15 : Rat) [(9, 1), (11, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 1. -/
theorem ep_Q1_028_partial_01_0101_valid :
    mulPoly ep_Q1_028_coefficient_01_0101
        ep_Q1_028_generator_01_0100_0111 =
      ep_Q1_028_partial_01_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 1. -/
def ep_Q1_028_coefficient_01_0102 : Poly :=
[
  term (-12 : Rat) [(9, 1), (13, 1), (16, 1)]
]

/-- Partial product 102 for generator 1. -/
def ep_Q1_028_partial_01_0102 : Poly :=
[
  term (24 : Rat) [(0, 1), (2, 1), (9, 1), (13, 1), (16, 1)],
  term (-24 : Rat) [(0, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term (24 : Rat) [(1, 1), (3, 1), (9, 1), (13, 1), (16, 1)],
  term (-24 : Rat) [(1, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term (-12 : Rat) [(2, 2), (9, 1), (13, 1), (16, 1)],
  term (-12 : Rat) [(3, 2), (9, 1), (13, 1), (16, 1)],
  term (12 : Rat) [(9, 1), (10, 2), (13, 1), (16, 1)],
  term (12 : Rat) [(9, 1), (11, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 1. -/
theorem ep_Q1_028_partial_01_0102_valid :
    mulPoly ep_Q1_028_coefficient_01_0102
        ep_Q1_028_generator_01_0100_0111 =
      ep_Q1_028_partial_01_0102 := by
  native_decide

/-- Coefficient term 103 from coefficient polynomial 1. -/
def ep_Q1_028_coefficient_01_0103 : Poly :=
[
  term (-12 : Rat) [(9, 2), (16, 1)]
]

/-- Partial product 103 for generator 1. -/
def ep_Q1_028_partial_01_0103 : Poly :=
[
  term (24 : Rat) [(0, 1), (2, 1), (9, 2), (16, 1)],
  term (-24 : Rat) [(0, 1), (9, 2), (10, 1), (16, 1)],
  term (24 : Rat) [(1, 1), (3, 1), (9, 2), (16, 1)],
  term (-24 : Rat) [(1, 1), (9, 2), (11, 1), (16, 1)],
  term (-12 : Rat) [(2, 2), (9, 2), (16, 1)],
  term (-12 : Rat) [(3, 2), (9, 2), (16, 1)],
  term (12 : Rat) [(9, 2), (10, 2), (16, 1)],
  term (12 : Rat) [(9, 2), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 103 for generator 1. -/
theorem ep_Q1_028_partial_01_0103_valid :
    mulPoly ep_Q1_028_coefficient_01_0103
        ep_Q1_028_generator_01_0100_0111 =
      ep_Q1_028_partial_01_0103 := by
  native_decide

/-- Coefficient term 104 from coefficient polynomial 1. -/
def ep_Q1_028_coefficient_01_0104 : Poly :=
[
  term (24 : Rat) [(11, 1), (13, 1), (16, 1)]
]

/-- Partial product 104 for generator 1. -/
def ep_Q1_028_partial_01_0104 : Poly :=
[
  term (-48 : Rat) [(0, 1), (2, 1), (11, 1), (13, 1), (16, 1)],
  term (48 : Rat) [(0, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term (-48 : Rat) [(1, 1), (3, 1), (11, 1), (13, 1), (16, 1)],
  term (48 : Rat) [(1, 1), (11, 2), (13, 1), (16, 1)],
  term (24 : Rat) [(2, 2), (11, 1), (13, 1), (16, 1)],
  term (24 : Rat) [(3, 2), (11, 1), (13, 1), (16, 1)],
  term (-24 : Rat) [(10, 2), (11, 1), (13, 1), (16, 1)],
  term (-24 : Rat) [(11, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 104 for generator 1. -/
theorem ep_Q1_028_partial_01_0104_valid :
    mulPoly ep_Q1_028_coefficient_01_0104
        ep_Q1_028_generator_01_0100_0111 =
      ep_Q1_028_partial_01_0104 := by
  native_decide

/-- Coefficient term 105 from coefficient polynomial 1. -/
def ep_Q1_028_coefficient_01_0105 : Poly :=
[
  term (-16 : Rat) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 105 for generator 1. -/
def ep_Q1_028_partial_01_0105 : Poly :=
[
  term (32 : Rat) [(0, 1), (2, 1), (11, 1), (15, 1), (16, 1)],
  term (-32 : Rat) [(0, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term (32 : Rat) [(1, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term (-32 : Rat) [(1, 1), (11, 2), (15, 1), (16, 1)],
  term (-16 : Rat) [(2, 2), (11, 1), (15, 1), (16, 1)],
  term (-16 : Rat) [(3, 2), (11, 1), (15, 1), (16, 1)],
  term (16 : Rat) [(10, 2), (11, 1), (15, 1), (16, 1)],
  term (16 : Rat) [(11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 105 for generator 1. -/
theorem ep_Q1_028_partial_01_0105_valid :
    mulPoly ep_Q1_028_coefficient_01_0105
        ep_Q1_028_generator_01_0100_0111 =
      ep_Q1_028_partial_01_0105 := by
  native_decide

/-- Coefficient term 106 from coefficient polynomial 1. -/
def ep_Q1_028_coefficient_01_0106 : Poly :=
[
  term (18 : Rat) [(11, 2), (16, 1)]
]

/-- Partial product 106 for generator 1. -/
def ep_Q1_028_partial_01_0106 : Poly :=
[
  term (-36 : Rat) [(0, 1), (2, 1), (11, 2), (16, 1)],
  term (36 : Rat) [(0, 1), (10, 1), (11, 2), (16, 1)],
  term (-36 : Rat) [(1, 1), (3, 1), (11, 2), (16, 1)],
  term (36 : Rat) [(1, 1), (11, 3), (16, 1)],
  term (18 : Rat) [(2, 2), (11, 2), (16, 1)],
  term (18 : Rat) [(3, 2), (11, 2), (16, 1)],
  term (-18 : Rat) [(10, 2), (11, 2), (16, 1)],
  term (-18 : Rat) [(11, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 106 for generator 1. -/
theorem ep_Q1_028_partial_01_0106_valid :
    mulPoly ep_Q1_028_coefficient_01_0106
        ep_Q1_028_generator_01_0100_0111 =
      ep_Q1_028_partial_01_0106 := by
  native_decide

/-- Coefficient term 107 from coefficient polynomial 1. -/
def ep_Q1_028_coefficient_01_0107 : Poly :=
[
  term (-6 : Rat) [(12, 1), (16, 1)]
]

/-- Partial product 107 for generator 1. -/
def ep_Q1_028_partial_01_0107 : Poly :=
[
  term (12 : Rat) [(0, 1), (2, 1), (12, 1), (16, 1)],
  term (-12 : Rat) [(0, 1), (10, 1), (12, 1), (16, 1)],
  term (12 : Rat) [(1, 1), (3, 1), (12, 1), (16, 1)],
  term (-12 : Rat) [(1, 1), (11, 1), (12, 1), (16, 1)],
  term (-6 : Rat) [(2, 2), (12, 1), (16, 1)],
  term (-6 : Rat) [(3, 2), (12, 1), (16, 1)],
  term (6 : Rat) [(10, 2), (12, 1), (16, 1)],
  term (6 : Rat) [(11, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 107 for generator 1. -/
theorem ep_Q1_028_partial_01_0107_valid :
    mulPoly ep_Q1_028_coefficient_01_0107
        ep_Q1_028_generator_01_0100_0111 =
      ep_Q1_028_partial_01_0107 := by
  native_decide

/-- Coefficient term 108 from coefficient polynomial 1. -/
def ep_Q1_028_coefficient_01_0108 : Poly :=
[
  term (-6 : Rat) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 108 for generator 1. -/
def ep_Q1_028_partial_01_0108 : Poly :=
[
  term (12 : Rat) [(0, 1), (2, 1), (13, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(0, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(1, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(2, 2), (13, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(3, 2), (13, 1), (15, 1), (16, 1)],
  term (6 : Rat) [(10, 2), (13, 1), (15, 1), (16, 1)],
  term (6 : Rat) [(11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 108 for generator 1. -/
theorem ep_Q1_028_partial_01_0108_valid :
    mulPoly ep_Q1_028_coefficient_01_0108
        ep_Q1_028_generator_01_0100_0111 =
      ep_Q1_028_partial_01_0108 := by
  native_decide

/-- Coefficient term 109 from coefficient polynomial 1. -/
def ep_Q1_028_coefficient_01_0109 : Poly :=
[
  term (-2 : Rat) [(14, 1), (16, 1)]
]

/-- Partial product 109 for generator 1. -/
def ep_Q1_028_partial_01_0109 : Poly :=
[
  term (4 : Rat) [(0, 1), (2, 1), (14, 1), (16, 1)],
  term (-4 : Rat) [(0, 1), (10, 1), (14, 1), (16, 1)],
  term (4 : Rat) [(1, 1), (3, 1), (14, 1), (16, 1)],
  term (-4 : Rat) [(1, 1), (11, 1), (14, 1), (16, 1)],
  term (-2 : Rat) [(2, 2), (14, 1), (16, 1)],
  term (-2 : Rat) [(3, 2), (14, 1), (16, 1)],
  term (2 : Rat) [(10, 2), (14, 1), (16, 1)],
  term (2 : Rat) [(11, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 109 for generator 1. -/
theorem ep_Q1_028_partial_01_0109_valid :
    mulPoly ep_Q1_028_coefficient_01_0109
        ep_Q1_028_generator_01_0100_0111 =
      ep_Q1_028_partial_01_0109 := by
  native_decide

/-- Coefficient term 110 from coefficient polynomial 1. -/
def ep_Q1_028_coefficient_01_0110 : Poly :=
[
  term (1 : Rat) [(15, 2), (16, 1)]
]

/-- Partial product 110 for generator 1. -/
def ep_Q1_028_partial_01_0110 : Poly :=
[
  term (-2 : Rat) [(0, 1), (2, 1), (15, 2), (16, 1)],
  term (2 : Rat) [(0, 1), (10, 1), (15, 2), (16, 1)],
  term (-2 : Rat) [(1, 1), (3, 1), (15, 2), (16, 1)],
  term (2 : Rat) [(1, 1), (11, 1), (15, 2), (16, 1)],
  term (1 : Rat) [(2, 2), (15, 2), (16, 1)],
  term (1 : Rat) [(3, 2), (15, 2), (16, 1)],
  term (-1 : Rat) [(10, 2), (15, 2), (16, 1)],
  term (-1 : Rat) [(11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 110 for generator 1. -/
theorem ep_Q1_028_partial_01_0110_valid :
    mulPoly ep_Q1_028_coefficient_01_0110
        ep_Q1_028_generator_01_0100_0111 =
      ep_Q1_028_partial_01_0110 := by
  native_decide

/-- Coefficient term 111 from coefficient polynomial 1. -/
def ep_Q1_028_coefficient_01_0111 : Poly :=
[
  term (5 : Rat) [(16, 1)]
]

/-- Partial product 111 for generator 1. -/
def ep_Q1_028_partial_01_0111 : Poly :=
[
  term (-10 : Rat) [(0, 1), (2, 1), (16, 1)],
  term (10 : Rat) [(0, 1), (10, 1), (16, 1)],
  term (-10 : Rat) [(1, 1), (3, 1), (16, 1)],
  term (10 : Rat) [(1, 1), (11, 1), (16, 1)],
  term (5 : Rat) [(2, 2), (16, 1)],
  term (5 : Rat) [(3, 2), (16, 1)],
  term (-5 : Rat) [(10, 2), (16, 1)],
  term (-5 : Rat) [(11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 111 for generator 1. -/
theorem ep_Q1_028_partial_01_0111_valid :
    mulPoly ep_Q1_028_coefficient_01_0111
        ep_Q1_028_generator_01_0100_0111 =
      ep_Q1_028_partial_01_0111 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q1_028_partials_01_0100_0111 : List Poly :=
[
  ep_Q1_028_partial_01_0100,
  ep_Q1_028_partial_01_0101,
  ep_Q1_028_partial_01_0102,
  ep_Q1_028_partial_01_0103,
  ep_Q1_028_partial_01_0104,
  ep_Q1_028_partial_01_0105,
  ep_Q1_028_partial_01_0106,
  ep_Q1_028_partial_01_0107,
  ep_Q1_028_partial_01_0108,
  ep_Q1_028_partial_01_0109,
  ep_Q1_028_partial_01_0110,
  ep_Q1_028_partial_01_0111
]

/-- Sum of partial products in this block. -/
def ep_Q1_028_block_01_0100_0111 : Poly :=
[
  term ((-872 : Rat) / 5) [(0, 1), (2, 1), (7, 2), (16, 1)],
  term (-30 : Rat) [(0, 1), (2, 1), (9, 1), (11, 1), (16, 1)],
  term (24 : Rat) [(0, 1), (2, 1), (9, 1), (13, 1), (16, 1)],
  term (24 : Rat) [(0, 1), (2, 1), (9, 2), (16, 1)],
  term (-48 : Rat) [(0, 1), (2, 1), (11, 1), (13, 1), (16, 1)],
  term (32 : Rat) [(0, 1), (2, 1), (11, 1), (15, 1), (16, 1)],
  term (-36 : Rat) [(0, 1), (2, 1), (11, 2), (16, 1)],
  term (12 : Rat) [(0, 1), (2, 1), (12, 1), (16, 1)],
  term (12 : Rat) [(0, 1), (2, 1), (13, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(0, 1), (2, 1), (14, 1), (16, 1)],
  term (-2 : Rat) [(0, 1), (2, 1), (15, 2), (16, 1)],
  term (-10 : Rat) [(0, 1), (2, 1), (16, 1)],
  term ((872 : Rat) / 5) [(0, 1), (7, 2), (10, 1), (16, 1)],
  term (30 : Rat) [(0, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term (-24 : Rat) [(0, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term (-24 : Rat) [(0, 1), (9, 2), (10, 1), (16, 1)],
  term (48 : Rat) [(0, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term (-32 : Rat) [(0, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term (36 : Rat) [(0, 1), (10, 1), (11, 2), (16, 1)],
  term (-12 : Rat) [(0, 1), (10, 1), (12, 1), (16, 1)],
  term (-12 : Rat) [(0, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(0, 1), (10, 1), (14, 1), (16, 1)],
  term (2 : Rat) [(0, 1), (10, 1), (15, 2), (16, 1)],
  term (10 : Rat) [(0, 1), (10, 1), (16, 1)],
  term ((-872 : Rat) / 5) [(1, 1), (3, 1), (7, 2), (16, 1)],
  term (-30 : Rat) [(1, 1), (3, 1), (9, 1), (11, 1), (16, 1)],
  term (24 : Rat) [(1, 1), (3, 1), (9, 1), (13, 1), (16, 1)],
  term (24 : Rat) [(1, 1), (3, 1), (9, 2), (16, 1)],
  term (-48 : Rat) [(1, 1), (3, 1), (11, 1), (13, 1), (16, 1)],
  term (32 : Rat) [(1, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term (-36 : Rat) [(1, 1), (3, 1), (11, 2), (16, 1)],
  term (12 : Rat) [(1, 1), (3, 1), (12, 1), (16, 1)],
  term (12 : Rat) [(1, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(1, 1), (3, 1), (14, 1), (16, 1)],
  term (-2 : Rat) [(1, 1), (3, 1), (15, 2), (16, 1)],
  term (-10 : Rat) [(1, 1), (3, 1), (16, 1)],
  term ((872 : Rat) / 5) [(1, 1), (7, 2), (11, 1), (16, 1)],
  term (-24 : Rat) [(1, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term (30 : Rat) [(1, 1), (9, 1), (11, 2), (16, 1)],
  term (-24 : Rat) [(1, 1), (9, 2), (11, 1), (16, 1)],
  term (-12 : Rat) [(1, 1), (11, 1), (12, 1), (16, 1)],
  term (-12 : Rat) [(1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(1, 1), (11, 1), (14, 1), (16, 1)],
  term (2 : Rat) [(1, 1), (11, 1), (15, 2), (16, 1)],
  term (10 : Rat) [(1, 1), (11, 1), (16, 1)],
  term (48 : Rat) [(1, 1), (11, 2), (13, 1), (16, 1)],
  term (-32 : Rat) [(1, 1), (11, 2), (15, 1), (16, 1)],
  term (36 : Rat) [(1, 1), (11, 3), (16, 1)],
  term ((436 : Rat) / 5) [(2, 2), (7, 2), (16, 1)],
  term (15 : Rat) [(2, 2), (9, 1), (11, 1), (16, 1)],
  term (-12 : Rat) [(2, 2), (9, 1), (13, 1), (16, 1)],
  term (-12 : Rat) [(2, 2), (9, 2), (16, 1)],
  term (24 : Rat) [(2, 2), (11, 1), (13, 1), (16, 1)],
  term (-16 : Rat) [(2, 2), (11, 1), (15, 1), (16, 1)],
  term (18 : Rat) [(2, 2), (11, 2), (16, 1)],
  term (-6 : Rat) [(2, 2), (12, 1), (16, 1)],
  term (-6 : Rat) [(2, 2), (13, 1), (15, 1), (16, 1)],
  term (-2 : Rat) [(2, 2), (14, 1), (16, 1)],
  term (1 : Rat) [(2, 2), (15, 2), (16, 1)],
  term (5 : Rat) [(2, 2), (16, 1)],
  term ((436 : Rat) / 5) [(3, 2), (7, 2), (16, 1)],
  term (15 : Rat) [(3, 2), (9, 1), (11, 1), (16, 1)],
  term (-12 : Rat) [(3, 2), (9, 1), (13, 1), (16, 1)],
  term (-12 : Rat) [(3, 2), (9, 2), (16, 1)],
  term (24 : Rat) [(3, 2), (11, 1), (13, 1), (16, 1)],
  term (-16 : Rat) [(3, 2), (11, 1), (15, 1), (16, 1)],
  term (18 : Rat) [(3, 2), (11, 2), (16, 1)],
  term (-6 : Rat) [(3, 2), (12, 1), (16, 1)],
  term (-6 : Rat) [(3, 2), (13, 1), (15, 1), (16, 1)],
  term (-2 : Rat) [(3, 2), (14, 1), (16, 1)],
  term (1 : Rat) [(3, 2), (15, 2), (16, 1)],
  term (5 : Rat) [(3, 2), (16, 1)],
  term ((-436 : Rat) / 5) [(7, 2), (10, 2), (16, 1)],
  term ((-436 : Rat) / 5) [(7, 2), (11, 2), (16, 1)],
  term (-15 : Rat) [(9, 1), (10, 2), (11, 1), (16, 1)],
  term (12 : Rat) [(9, 1), (10, 2), (13, 1), (16, 1)],
  term (12 : Rat) [(9, 1), (11, 2), (13, 1), (16, 1)],
  term (-15 : Rat) [(9, 1), (11, 3), (16, 1)],
  term (12 : Rat) [(9, 2), (10, 2), (16, 1)],
  term (12 : Rat) [(9, 2), (11, 2), (16, 1)],
  term (-24 : Rat) [(10, 2), (11, 1), (13, 1), (16, 1)],
  term (16 : Rat) [(10, 2), (11, 1), (15, 1), (16, 1)],
  term (-18 : Rat) [(10, 2), (11, 2), (16, 1)],
  term (6 : Rat) [(10, 2), (12, 1), (16, 1)],
  term (6 : Rat) [(10, 2), (13, 1), (15, 1), (16, 1)],
  term (2 : Rat) [(10, 2), (14, 1), (16, 1)],
  term (-1 : Rat) [(10, 2), (15, 2), (16, 1)],
  term (-5 : Rat) [(10, 2), (16, 1)],
  term (6 : Rat) [(11, 2), (12, 1), (16, 1)],
  term (6 : Rat) [(11, 2), (13, 1), (15, 1), (16, 1)],
  term (2 : Rat) [(11, 2), (14, 1), (16, 1)],
  term (-1 : Rat) [(11, 2), (15, 2), (16, 1)],
  term (-5 : Rat) [(11, 2), (16, 1)],
  term (-24 : Rat) [(11, 3), (13, 1), (16, 1)],
  term (16 : Rat) [(11, 3), (15, 1), (16, 1)],
  term (-18 : Rat) [(11, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 1, terms 100 through 111. -/
theorem ep_Q1_028_block_01_0100_0111_valid :
    checkProductSumEq ep_Q1_028_partials_01_0100_0111
      ep_Q1_028_block_01_0100_0111 = true := by
  native_decide

end EpQ1028TermShards

end Patterns

end EndpointCertificate

end Problem97
