/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_074, term block 8:100-115

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_074`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2074TermShards

/-- Generator polynomial 8 for endpoint certificate `ep_Q2_074`. -/
def ep_Q2_074_generator_08_0100_0115 : Poly :=
[
  term (-2 : Rat) [(0, 1)],
  term (1 : Rat) [(0, 2)],
  term (1 : Rat) [(1, 2)],
  term (2 : Rat) [(14, 1)],
  term (-1 : Rat) [(14, 2)],
  term (-1 : Rat) [(15, 2)]
]

/-- Coefficient term 100 from coefficient polynomial 8. -/
def ep_Q2_074_coefficient_08_0100 : Poly :=
[
  term ((22221 : Rat) / 3076) [(3, 1), (7, 1), (16, 1)]
]

/-- Partial product 100 for generator 8. -/
def ep_Q2_074_partial_08_0100 : Poly :=
[
  term ((-22221 : Rat) / 1538) [(0, 1), (3, 1), (7, 1), (16, 1)],
  term ((22221 : Rat) / 3076) [(0, 2), (3, 1), (7, 1), (16, 1)],
  term ((22221 : Rat) / 3076) [(1, 2), (3, 1), (7, 1), (16, 1)],
  term ((22221 : Rat) / 1538) [(3, 1), (7, 1), (14, 1), (16, 1)],
  term ((-22221 : Rat) / 3076) [(3, 1), (7, 1), (14, 2), (16, 1)],
  term ((-22221 : Rat) / 3076) [(3, 1), (7, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 8. -/
theorem ep_Q2_074_partial_08_0100_valid :
    mulPoly ep_Q2_074_coefficient_08_0100
        ep_Q2_074_generator_08_0100_0115 =
      ep_Q2_074_partial_08_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 8. -/
def ep_Q2_074_coefficient_08_0101 : Poly :=
[
  term ((20493 : Rat) / 3076) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 101 for generator 8. -/
def ep_Q2_074_partial_08_0101 : Poly :=
[
  term ((-20493 : Rat) / 1538) [(0, 1), (3, 1), (15, 1), (16, 1)],
  term ((20493 : Rat) / 3076) [(0, 2), (3, 1), (15, 1), (16, 1)],
  term ((20493 : Rat) / 3076) [(1, 2), (3, 1), (15, 1), (16, 1)],
  term ((20493 : Rat) / 1538) [(3, 1), (14, 1), (15, 1), (16, 1)],
  term ((-20493 : Rat) / 3076) [(3, 1), (14, 2), (15, 1), (16, 1)],
  term ((-20493 : Rat) / 3076) [(3, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 8. -/
theorem ep_Q2_074_partial_08_0101_valid :
    mulPoly ep_Q2_074_coefficient_08_0101
        ep_Q2_074_generator_08_0100_0115 =
      ep_Q2_074_partial_08_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 8. -/
def ep_Q2_074_coefficient_08_0102 : Poly :=
[
  term ((1230 : Rat) / 769) [(4, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 102 for generator 8. -/
def ep_Q2_074_partial_08_0102 : Poly :=
[
  term ((-2460 : Rat) / 769) [(0, 1), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((1230 : Rat) / 769) [(0, 2), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((1230 : Rat) / 769) [(1, 2), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((2460 : Rat) / 769) [(4, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1230 : Rat) / 769) [(4, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1230 : Rat) / 769) [(4, 1), (7, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 8. -/
theorem ep_Q2_074_partial_08_0102_valid :
    mulPoly ep_Q2_074_coefficient_08_0102
        ep_Q2_074_generator_08_0100_0115 =
      ep_Q2_074_partial_08_0102 := by
  native_decide

/-- Coefficient term 103 from coefficient polynomial 8. -/
def ep_Q2_074_coefficient_08_0103 : Poly :=
[
  term ((-57213 : Rat) / 769) [(4, 1), (10, 1), (16, 1)]
]

/-- Partial product 103 for generator 8. -/
def ep_Q2_074_partial_08_0103 : Poly :=
[
  term ((114426 : Rat) / 769) [(0, 1), (4, 1), (10, 1), (16, 1)],
  term ((-57213 : Rat) / 769) [(0, 2), (4, 1), (10, 1), (16, 1)],
  term ((-57213 : Rat) / 769) [(1, 2), (4, 1), (10, 1), (16, 1)],
  term ((-114426 : Rat) / 769) [(4, 1), (10, 1), (14, 1), (16, 1)],
  term ((57213 : Rat) / 769) [(4, 1), (10, 1), (14, 2), (16, 1)],
  term ((57213 : Rat) / 769) [(4, 1), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 103 for generator 8. -/
theorem ep_Q2_074_partial_08_0103_valid :
    mulPoly ep_Q2_074_coefficient_08_0103
        ep_Q2_074_generator_08_0100_0115 =
      ep_Q2_074_partial_08_0103 := by
  native_decide

/-- Coefficient term 104 from coefficient polynomial 8. -/
def ep_Q2_074_coefficient_08_0104 : Poly :=
[
  term ((-5994 : Rat) / 769) [(4, 1), (14, 1), (16, 1)]
]

/-- Partial product 104 for generator 8. -/
def ep_Q2_074_partial_08_0104 : Poly :=
[
  term ((11988 : Rat) / 769) [(0, 1), (4, 1), (14, 1), (16, 1)],
  term ((-5994 : Rat) / 769) [(0, 2), (4, 1), (14, 1), (16, 1)],
  term ((-5994 : Rat) / 769) [(1, 2), (4, 1), (14, 1), (16, 1)],
  term ((5994 : Rat) / 769) [(4, 1), (14, 1), (15, 2), (16, 1)],
  term ((-11988 : Rat) / 769) [(4, 1), (14, 2), (16, 1)],
  term ((5994 : Rat) / 769) [(4, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 104 for generator 8. -/
theorem ep_Q2_074_partial_08_0104_valid :
    mulPoly ep_Q2_074_coefficient_08_0104
        ep_Q2_074_generator_08_0100_0115 =
      ep_Q2_074_partial_08_0104 := by
  native_decide

/-- Coefficient term 105 from coefficient polynomial 8. -/
def ep_Q2_074_coefficient_08_0105 : Poly :=
[
  term ((-615 : Rat) / 769) [(4, 1), (15, 2), (16, 1)]
]

/-- Partial product 105 for generator 8. -/
def ep_Q2_074_partial_08_0105 : Poly :=
[
  term ((1230 : Rat) / 769) [(0, 1), (4, 1), (15, 2), (16, 1)],
  term ((-615 : Rat) / 769) [(0, 2), (4, 1), (15, 2), (16, 1)],
  term ((-615 : Rat) / 769) [(1, 2), (4, 1), (15, 2), (16, 1)],
  term ((-1230 : Rat) / 769) [(4, 1), (14, 1), (15, 2), (16, 1)],
  term ((615 : Rat) / 769) [(4, 1), (14, 2), (15, 2), (16, 1)],
  term ((615 : Rat) / 769) [(4, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 105 for generator 8. -/
theorem ep_Q2_074_partial_08_0105_valid :
    mulPoly ep_Q2_074_coefficient_08_0105
        ep_Q2_074_generator_08_0100_0115 =
      ep_Q2_074_partial_08_0105 := by
  native_decide

/-- Coefficient term 106 from coefficient polynomial 8. -/
def ep_Q2_074_coefficient_08_0106 : Poly :=
[
  term ((136923 : Rat) / 3076) [(4, 1), (16, 1)]
]

/-- Partial product 106 for generator 8. -/
def ep_Q2_074_partial_08_0106 : Poly :=
[
  term ((-136923 : Rat) / 1538) [(0, 1), (4, 1), (16, 1)],
  term ((136923 : Rat) / 3076) [(0, 2), (4, 1), (16, 1)],
  term ((136923 : Rat) / 3076) [(1, 2), (4, 1), (16, 1)],
  term ((136923 : Rat) / 1538) [(4, 1), (14, 1), (16, 1)],
  term ((-136923 : Rat) / 3076) [(4, 1), (14, 2), (16, 1)],
  term ((-136923 : Rat) / 3076) [(4, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 106 for generator 8. -/
theorem ep_Q2_074_partial_08_0106_valid :
    mulPoly ep_Q2_074_coefficient_08_0106
        ep_Q2_074_generator_08_0100_0115 =
      ep_Q2_074_partial_08_0106 := by
  native_decide

/-- Coefficient term 107 from coefficient polynomial 8. -/
def ep_Q2_074_coefficient_08_0107 : Poly :=
[
  term ((15993 : Rat) / 1538) [(4, 2), (16, 1)]
]

/-- Partial product 107 for generator 8. -/
def ep_Q2_074_partial_08_0107 : Poly :=
[
  term ((-15993 : Rat) / 769) [(0, 1), (4, 2), (16, 1)],
  term ((15993 : Rat) / 1538) [(0, 2), (4, 2), (16, 1)],
  term ((15993 : Rat) / 1538) [(1, 2), (4, 2), (16, 1)],
  term ((15993 : Rat) / 769) [(4, 2), (14, 1), (16, 1)],
  term ((-15993 : Rat) / 1538) [(4, 2), (14, 2), (16, 1)],
  term ((-15993 : Rat) / 1538) [(4, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 107 for generator 8. -/
theorem ep_Q2_074_partial_08_0107_valid :
    mulPoly ep_Q2_074_coefficient_08_0107
        ep_Q2_074_generator_08_0100_0115 =
      ep_Q2_074_partial_08_0107 := by
  native_decide

/-- Coefficient term 108 from coefficient polynomial 8. -/
def ep_Q2_074_coefficient_08_0108 : Poly :=
[
  term ((-63 : Rat) / 769) [(5, 1), (11, 1), (16, 1)]
]

/-- Partial product 108 for generator 8. -/
def ep_Q2_074_partial_08_0108 : Poly :=
[
  term ((126 : Rat) / 769) [(0, 1), (5, 1), (11, 1), (16, 1)],
  term ((-63 : Rat) / 769) [(0, 2), (5, 1), (11, 1), (16, 1)],
  term ((-63 : Rat) / 769) [(1, 2), (5, 1), (11, 1), (16, 1)],
  term ((-126 : Rat) / 769) [(5, 1), (11, 1), (14, 1), (16, 1)],
  term ((63 : Rat) / 769) [(5, 1), (11, 1), (14, 2), (16, 1)],
  term ((63 : Rat) / 769) [(5, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 108 for generator 8. -/
theorem ep_Q2_074_partial_08_0108_valid :
    mulPoly ep_Q2_074_coefficient_08_0108
        ep_Q2_074_generator_08_0100_0115 =
      ep_Q2_074_partial_08_0108 := by
  native_decide

/-- Coefficient term 109 from coefficient polynomial 8. -/
def ep_Q2_074_coefficient_08_0109 : Poly :=
[
  term ((-29283 : Rat) / 1538) [(5, 2), (16, 1)]
]

/-- Partial product 109 for generator 8. -/
def ep_Q2_074_partial_08_0109 : Poly :=
[
  term ((29283 : Rat) / 769) [(0, 1), (5, 2), (16, 1)],
  term ((-29283 : Rat) / 1538) [(0, 2), (5, 2), (16, 1)],
  term ((-29283 : Rat) / 1538) [(1, 2), (5, 2), (16, 1)],
  term ((-29283 : Rat) / 769) [(5, 2), (14, 1), (16, 1)],
  term ((29283 : Rat) / 1538) [(5, 2), (14, 2), (16, 1)],
  term ((29283 : Rat) / 1538) [(5, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 109 for generator 8. -/
theorem ep_Q2_074_partial_08_0109_valid :
    mulPoly ep_Q2_074_coefficient_08_0109
        ep_Q2_074_generator_08_0100_0115 =
      ep_Q2_074_partial_08_0109 := by
  native_decide

/-- Coefficient term 110 from coefficient polynomial 8. -/
def ep_Q2_074_coefficient_08_0110 : Poly :=
[
  term ((-12590 : Rat) / 769) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 110 for generator 8. -/
def ep_Q2_074_partial_08_0110 : Poly :=
[
  term ((25180 : Rat) / 769) [(0, 1), (7, 1), (15, 1), (16, 1)],
  term ((-12590 : Rat) / 769) [(0, 2), (7, 1), (15, 1), (16, 1)],
  term ((-12590 : Rat) / 769) [(1, 2), (7, 1), (15, 1), (16, 1)],
  term ((-25180 : Rat) / 769) [(7, 1), (14, 1), (15, 1), (16, 1)],
  term ((12590 : Rat) / 769) [(7, 1), (14, 2), (15, 1), (16, 1)],
  term ((12590 : Rat) / 769) [(7, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 110 for generator 8. -/
theorem ep_Q2_074_partial_08_0110_valid :
    mulPoly ep_Q2_074_coefficient_08_0110
        ep_Q2_074_generator_08_0100_0115 =
      ep_Q2_074_partial_08_0110 := by
  native_decide

/-- Coefficient term 111 from coefficient polynomial 8. -/
def ep_Q2_074_coefficient_08_0111 : Poly :=
[
  term ((-85236 : Rat) / 769) [(10, 1), (16, 1)]
]

/-- Partial product 111 for generator 8. -/
def ep_Q2_074_partial_08_0111 : Poly :=
[
  term ((170472 : Rat) / 769) [(0, 1), (10, 1), (16, 1)],
  term ((-85236 : Rat) / 769) [(0, 2), (10, 1), (16, 1)],
  term ((-85236 : Rat) / 769) [(1, 2), (10, 1), (16, 1)],
  term ((-170472 : Rat) / 769) [(10, 1), (14, 1), (16, 1)],
  term ((85236 : Rat) / 769) [(10, 1), (14, 2), (16, 1)],
  term ((85236 : Rat) / 769) [(10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 111 for generator 8. -/
theorem ep_Q2_074_partial_08_0111_valid :
    mulPoly ep_Q2_074_coefficient_08_0111
        ep_Q2_074_generator_08_0100_0115 =
      ep_Q2_074_partial_08_0111 := by
  native_decide

/-- Coefficient term 112 from coefficient polynomial 8. -/
def ep_Q2_074_coefficient_08_0112 : Poly :=
[
  term ((54576 : Rat) / 769) [(10, 2), (16, 1)]
]

/-- Partial product 112 for generator 8. -/
def ep_Q2_074_partial_08_0112 : Poly :=
[
  term ((-109152 : Rat) / 769) [(0, 1), (10, 2), (16, 1)],
  term ((54576 : Rat) / 769) [(0, 2), (10, 2), (16, 1)],
  term ((54576 : Rat) / 769) [(1, 2), (10, 2), (16, 1)],
  term ((109152 : Rat) / 769) [(10, 2), (14, 1), (16, 1)],
  term ((-54576 : Rat) / 769) [(10, 2), (14, 2), (16, 1)],
  term ((-54576 : Rat) / 769) [(10, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 112 for generator 8. -/
theorem ep_Q2_074_partial_08_0112_valid :
    mulPoly ep_Q2_074_coefficient_08_0112
        ep_Q2_074_generator_08_0100_0115 =
      ep_Q2_074_partial_08_0112 := by
  native_decide

/-- Coefficient term 113 from coefficient polynomial 8. -/
def ep_Q2_074_coefficient_08_0113 : Poly :=
[
  term ((7695 : Rat) / 769) [(14, 1), (16, 1)]
]

/-- Partial product 113 for generator 8. -/
def ep_Q2_074_partial_08_0113 : Poly :=
[
  term ((-15390 : Rat) / 769) [(0, 1), (14, 1), (16, 1)],
  term ((7695 : Rat) / 769) [(0, 2), (14, 1), (16, 1)],
  term ((7695 : Rat) / 769) [(1, 2), (14, 1), (16, 1)],
  term ((-7695 : Rat) / 769) [(14, 1), (15, 2), (16, 1)],
  term ((15390 : Rat) / 769) [(14, 2), (16, 1)],
  term ((-7695 : Rat) / 769) [(14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 113 for generator 8. -/
theorem ep_Q2_074_partial_08_0113_valid :
    mulPoly ep_Q2_074_coefficient_08_0113
        ep_Q2_074_generator_08_0100_0115 =
      ep_Q2_074_partial_08_0113 := by
  native_decide

/-- Coefficient term 114 from coefficient polynomial 8. -/
def ep_Q2_074_coefficient_08_0114 : Poly :=
[
  term ((3931 : Rat) / 3076) [(15, 2), (16, 1)]
]

/-- Partial product 114 for generator 8. -/
def ep_Q2_074_partial_08_0114 : Poly :=
[
  term ((-3931 : Rat) / 1538) [(0, 1), (15, 2), (16, 1)],
  term ((3931 : Rat) / 3076) [(0, 2), (15, 2), (16, 1)],
  term ((3931 : Rat) / 3076) [(1, 2), (15, 2), (16, 1)],
  term ((3931 : Rat) / 1538) [(14, 1), (15, 2), (16, 1)],
  term ((-3931 : Rat) / 3076) [(14, 2), (15, 2), (16, 1)],
  term ((-3931 : Rat) / 3076) [(15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 114 for generator 8. -/
theorem ep_Q2_074_partial_08_0114_valid :
    mulPoly ep_Q2_074_coefficient_08_0114
        ep_Q2_074_generator_08_0100_0115 =
      ep_Q2_074_partial_08_0114 := by
  native_decide

/-- Coefficient term 115 from coefficient polynomial 8. -/
def ep_Q2_074_coefficient_08_0115 : Poly :=
[
  term ((245003 : Rat) / 12304) [(16, 1)]
]

/-- Partial product 115 for generator 8. -/
def ep_Q2_074_partial_08_0115 : Poly :=
[
  term ((-245003 : Rat) / 6152) [(0, 1), (16, 1)],
  term ((245003 : Rat) / 12304) [(0, 2), (16, 1)],
  term ((245003 : Rat) / 12304) [(1, 2), (16, 1)],
  term ((245003 : Rat) / 6152) [(14, 1), (16, 1)],
  term ((-245003 : Rat) / 12304) [(14, 2), (16, 1)],
  term ((-245003 : Rat) / 12304) [(15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 115 for generator 8. -/
theorem ep_Q2_074_partial_08_0115_valid :
    mulPoly ep_Q2_074_coefficient_08_0115
        ep_Q2_074_generator_08_0100_0115 =
      ep_Q2_074_partial_08_0115 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_074_partials_08_0100_0115 : List Poly :=
[
  ep_Q2_074_partial_08_0100,
  ep_Q2_074_partial_08_0101,
  ep_Q2_074_partial_08_0102,
  ep_Q2_074_partial_08_0103,
  ep_Q2_074_partial_08_0104,
  ep_Q2_074_partial_08_0105,
  ep_Q2_074_partial_08_0106,
  ep_Q2_074_partial_08_0107,
  ep_Q2_074_partial_08_0108,
  ep_Q2_074_partial_08_0109,
  ep_Q2_074_partial_08_0110,
  ep_Q2_074_partial_08_0111,
  ep_Q2_074_partial_08_0112,
  ep_Q2_074_partial_08_0113,
  ep_Q2_074_partial_08_0114,
  ep_Q2_074_partial_08_0115
]

/-- Sum of partial products in this block. -/
def ep_Q2_074_block_08_0100_0115 : Poly :=
[
  term ((-22221 : Rat) / 1538) [(0, 1), (3, 1), (7, 1), (16, 1)],
  term ((-20493 : Rat) / 1538) [(0, 1), (3, 1), (15, 1), (16, 1)],
  term ((-2460 : Rat) / 769) [(0, 1), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((114426 : Rat) / 769) [(0, 1), (4, 1), (10, 1), (16, 1)],
  term ((11988 : Rat) / 769) [(0, 1), (4, 1), (14, 1), (16, 1)],
  term ((1230 : Rat) / 769) [(0, 1), (4, 1), (15, 2), (16, 1)],
  term ((-136923 : Rat) / 1538) [(0, 1), (4, 1), (16, 1)],
  term ((-15993 : Rat) / 769) [(0, 1), (4, 2), (16, 1)],
  term ((126 : Rat) / 769) [(0, 1), (5, 1), (11, 1), (16, 1)],
  term ((29283 : Rat) / 769) [(0, 1), (5, 2), (16, 1)],
  term ((25180 : Rat) / 769) [(0, 1), (7, 1), (15, 1), (16, 1)],
  term ((170472 : Rat) / 769) [(0, 1), (10, 1), (16, 1)],
  term ((-109152 : Rat) / 769) [(0, 1), (10, 2), (16, 1)],
  term ((-15390 : Rat) / 769) [(0, 1), (14, 1), (16, 1)],
  term ((-3931 : Rat) / 1538) [(0, 1), (15, 2), (16, 1)],
  term ((-245003 : Rat) / 6152) [(0, 1), (16, 1)],
  term ((22221 : Rat) / 3076) [(0, 2), (3, 1), (7, 1), (16, 1)],
  term ((20493 : Rat) / 3076) [(0, 2), (3, 1), (15, 1), (16, 1)],
  term ((1230 : Rat) / 769) [(0, 2), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((-57213 : Rat) / 769) [(0, 2), (4, 1), (10, 1), (16, 1)],
  term ((-5994 : Rat) / 769) [(0, 2), (4, 1), (14, 1), (16, 1)],
  term ((-615 : Rat) / 769) [(0, 2), (4, 1), (15, 2), (16, 1)],
  term ((136923 : Rat) / 3076) [(0, 2), (4, 1), (16, 1)],
  term ((15993 : Rat) / 1538) [(0, 2), (4, 2), (16, 1)],
  term ((-63 : Rat) / 769) [(0, 2), (5, 1), (11, 1), (16, 1)],
  term ((-29283 : Rat) / 1538) [(0, 2), (5, 2), (16, 1)],
  term ((-12590 : Rat) / 769) [(0, 2), (7, 1), (15, 1), (16, 1)],
  term ((-85236 : Rat) / 769) [(0, 2), (10, 1), (16, 1)],
  term ((54576 : Rat) / 769) [(0, 2), (10, 2), (16, 1)],
  term ((7695 : Rat) / 769) [(0, 2), (14, 1), (16, 1)],
  term ((3931 : Rat) / 3076) [(0, 2), (15, 2), (16, 1)],
  term ((245003 : Rat) / 12304) [(0, 2), (16, 1)],
  term ((22221 : Rat) / 3076) [(1, 2), (3, 1), (7, 1), (16, 1)],
  term ((20493 : Rat) / 3076) [(1, 2), (3, 1), (15, 1), (16, 1)],
  term ((1230 : Rat) / 769) [(1, 2), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((-57213 : Rat) / 769) [(1, 2), (4, 1), (10, 1), (16, 1)],
  term ((-5994 : Rat) / 769) [(1, 2), (4, 1), (14, 1), (16, 1)],
  term ((-615 : Rat) / 769) [(1, 2), (4, 1), (15, 2), (16, 1)],
  term ((136923 : Rat) / 3076) [(1, 2), (4, 1), (16, 1)],
  term ((15993 : Rat) / 1538) [(1, 2), (4, 2), (16, 1)],
  term ((-63 : Rat) / 769) [(1, 2), (5, 1), (11, 1), (16, 1)],
  term ((-29283 : Rat) / 1538) [(1, 2), (5, 2), (16, 1)],
  term ((-12590 : Rat) / 769) [(1, 2), (7, 1), (15, 1), (16, 1)],
  term ((-85236 : Rat) / 769) [(1, 2), (10, 1), (16, 1)],
  term ((54576 : Rat) / 769) [(1, 2), (10, 2), (16, 1)],
  term ((7695 : Rat) / 769) [(1, 2), (14, 1), (16, 1)],
  term ((3931 : Rat) / 3076) [(1, 2), (15, 2), (16, 1)],
  term ((245003 : Rat) / 12304) [(1, 2), (16, 1)],
  term ((22221 : Rat) / 1538) [(3, 1), (7, 1), (14, 1), (16, 1)],
  term ((-22221 : Rat) / 3076) [(3, 1), (7, 1), (14, 2), (16, 1)],
  term ((-22221 : Rat) / 3076) [(3, 1), (7, 1), (15, 2), (16, 1)],
  term ((20493 : Rat) / 1538) [(3, 1), (14, 1), (15, 1), (16, 1)],
  term ((-20493 : Rat) / 3076) [(3, 1), (14, 2), (15, 1), (16, 1)],
  term ((-20493 : Rat) / 3076) [(3, 1), (15, 3), (16, 1)],
  term ((2460 : Rat) / 769) [(4, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1230 : Rat) / 769) [(4, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1230 : Rat) / 769) [(4, 1), (7, 1), (15, 3), (16, 1)],
  term ((-114426 : Rat) / 769) [(4, 1), (10, 1), (14, 1), (16, 1)],
  term ((57213 : Rat) / 769) [(4, 1), (10, 1), (14, 2), (16, 1)],
  term ((57213 : Rat) / 769) [(4, 1), (10, 1), (15, 2), (16, 1)],
  term ((4764 : Rat) / 769) [(4, 1), (14, 1), (15, 2), (16, 1)],
  term ((136923 : Rat) / 1538) [(4, 1), (14, 1), (16, 1)],
  term ((615 : Rat) / 769) [(4, 1), (14, 2), (15, 2), (16, 1)],
  term ((-184875 : Rat) / 3076) [(4, 1), (14, 2), (16, 1)],
  term ((5994 : Rat) / 769) [(4, 1), (14, 3), (16, 1)],
  term ((-136923 : Rat) / 3076) [(4, 1), (15, 2), (16, 1)],
  term ((615 : Rat) / 769) [(4, 1), (15, 4), (16, 1)],
  term ((15993 : Rat) / 769) [(4, 2), (14, 1), (16, 1)],
  term ((-15993 : Rat) / 1538) [(4, 2), (14, 2), (16, 1)],
  term ((-15993 : Rat) / 1538) [(4, 2), (15, 2), (16, 1)],
  term ((-126 : Rat) / 769) [(5, 1), (11, 1), (14, 1), (16, 1)],
  term ((63 : Rat) / 769) [(5, 1), (11, 1), (14, 2), (16, 1)],
  term ((63 : Rat) / 769) [(5, 1), (11, 1), (15, 2), (16, 1)],
  term ((-29283 : Rat) / 769) [(5, 2), (14, 1), (16, 1)],
  term ((29283 : Rat) / 1538) [(5, 2), (14, 2), (16, 1)],
  term ((29283 : Rat) / 1538) [(5, 2), (15, 2), (16, 1)],
  term ((-25180 : Rat) / 769) [(7, 1), (14, 1), (15, 1), (16, 1)],
  term ((12590 : Rat) / 769) [(7, 1), (14, 2), (15, 1), (16, 1)],
  term ((12590 : Rat) / 769) [(7, 1), (15, 3), (16, 1)],
  term ((-170472 : Rat) / 769) [(10, 1), (14, 1), (16, 1)],
  term ((85236 : Rat) / 769) [(10, 1), (14, 2), (16, 1)],
  term ((85236 : Rat) / 769) [(10, 1), (15, 2), (16, 1)],
  term ((109152 : Rat) / 769) [(10, 2), (14, 1), (16, 1)],
  term ((-54576 : Rat) / 769) [(10, 2), (14, 2), (16, 1)],
  term ((-54576 : Rat) / 769) [(10, 2), (15, 2), (16, 1)],
  term ((-11459 : Rat) / 1538) [(14, 1), (15, 2), (16, 1)],
  term ((245003 : Rat) / 6152) [(14, 1), (16, 1)],
  term ((-3931 : Rat) / 3076) [(14, 2), (15, 2), (16, 1)],
  term ((1237 : Rat) / 12304) [(14, 2), (16, 1)],
  term ((-7695 : Rat) / 769) [(14, 3), (16, 1)],
  term ((-245003 : Rat) / 12304) [(15, 2), (16, 1)],
  term ((-3931 : Rat) / 3076) [(15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 8, terms 100 through 115. -/
theorem ep_Q2_074_block_08_0100_0115_valid :
    checkProductSumEq ep_Q2_074_partials_08_0100_0115
      ep_Q2_074_block_08_0100_0115 = true := by
  native_decide

end EpQ2074TermShards

end Patterns

end EndpointCertificate

end Problem97
