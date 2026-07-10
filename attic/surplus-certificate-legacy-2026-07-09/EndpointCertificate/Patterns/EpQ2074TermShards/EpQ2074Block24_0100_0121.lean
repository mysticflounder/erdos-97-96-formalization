/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_074, term block 24:100-121

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_074`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2074TermShards

/-- Generator polynomial 24 for endpoint certificate `ep_Q2_074`. -/
def ep_Q2_074_generator_24_0100_0121 : Poly :=
[
  term (-2 : Rat) [(0, 1), (12, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (13, 1)],
  term (1 : Rat) [(1, 2)]
]

/-- Coefficient term 100 from coefficient polynomial 24. -/
def ep_Q2_074_coefficient_24_0100 : Poly :=
[
  term ((27060 : Rat) / 769) [(1, 2), (15, 2), (16, 1)]
]

/-- Partial product 100 for generator 24. -/
def ep_Q2_074_partial_24_0100 : Poly :=
[
  term ((-54120 : Rat) / 769) [(0, 1), (1, 2), (12, 1), (15, 2), (16, 1)],
  term ((27060 : Rat) / 769) [(0, 2), (1, 2), (15, 2), (16, 1)],
  term ((-54120 : Rat) / 769) [(1, 3), (13, 1), (15, 2), (16, 1)],
  term ((27060 : Rat) / 769) [(1, 4), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 24. -/
theorem ep_Q2_074_partial_24_0100_valid :
    mulPoly ep_Q2_074_coefficient_24_0100
        ep_Q2_074_generator_24_0100_0121 =
      ep_Q2_074_partial_24_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 24. -/
def ep_Q2_074_coefficient_24_0101 : Poly :=
[
  term ((-43149 : Rat) / 1538) [(1, 2), (16, 1)]
]

/-- Partial product 101 for generator 24. -/
def ep_Q2_074_partial_24_0101 : Poly :=
[
  term ((43149 : Rat) / 769) [(0, 1), (1, 2), (12, 1), (16, 1)],
  term ((-43149 : Rat) / 1538) [(0, 2), (1, 2), (16, 1)],
  term ((43149 : Rat) / 769) [(1, 3), (13, 1), (16, 1)],
  term ((-43149 : Rat) / 1538) [(1, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 24. -/
theorem ep_Q2_074_partial_24_0101_valid :
    mulPoly ep_Q2_074_coefficient_24_0101
        ep_Q2_074_generator_24_0100_0121 =
      ep_Q2_074_partial_24_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 24. -/
def ep_Q2_074_coefficient_24_0102 : Poly :=
[
  term ((-1998 : Rat) / 769) [(2, 1), (4, 1), (16, 1)]
]

/-- Partial product 102 for generator 24. -/
def ep_Q2_074_partial_24_0102 : Poly :=
[
  term ((3996 : Rat) / 769) [(0, 1), (2, 1), (4, 1), (12, 1), (16, 1)],
  term ((-1998 : Rat) / 769) [(0, 2), (2, 1), (4, 1), (16, 1)],
  term ((3996 : Rat) / 769) [(1, 1), (2, 1), (4, 1), (13, 1), (16, 1)],
  term ((-1998 : Rat) / 769) [(1, 2), (2, 1), (4, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 24. -/
theorem ep_Q2_074_partial_24_0102_valid :
    mulPoly ep_Q2_074_coefficient_24_0102
        ep_Q2_074_generator_24_0100_0121 =
      ep_Q2_074_partial_24_0102 := by
  native_decide

/-- Coefficient term 103 from coefficient polynomial 24. -/
def ep_Q2_074_coefficient_24_0103 : Poly :=
[
  term ((80940 : Rat) / 769) [(2, 1), (10, 1), (16, 1)]
]

/-- Partial product 103 for generator 24. -/
def ep_Q2_074_partial_24_0103 : Poly :=
[
  term ((-161880 : Rat) / 769) [(0, 1), (2, 1), (10, 1), (12, 1), (16, 1)],
  term ((80940 : Rat) / 769) [(0, 2), (2, 1), (10, 1), (16, 1)],
  term ((-161880 : Rat) / 769) [(1, 1), (2, 1), (10, 1), (13, 1), (16, 1)],
  term ((80940 : Rat) / 769) [(1, 2), (2, 1), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 103 for generator 24. -/
theorem ep_Q2_074_partial_24_0103_valid :
    mulPoly ep_Q2_074_coefficient_24_0103
        ep_Q2_074_generator_24_0100_0121 =
      ep_Q2_074_partial_24_0103 := by
  native_decide

/-- Coefficient term 104 from coefficient polynomial 24. -/
def ep_Q2_074_coefficient_24_0104 : Poly :=
[
  term ((1296 : Rat) / 769) [(2, 1), (12, 1), (16, 1)]
]

/-- Partial product 104 for generator 24. -/
def ep_Q2_074_partial_24_0104 : Poly :=
[
  term ((-2592 : Rat) / 769) [(0, 1), (2, 1), (12, 2), (16, 1)],
  term ((1296 : Rat) / 769) [(0, 2), (2, 1), (12, 1), (16, 1)],
  term ((-2592 : Rat) / 769) [(1, 1), (2, 1), (12, 1), (13, 1), (16, 1)],
  term ((1296 : Rat) / 769) [(1, 2), (2, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 104 for generator 24. -/
theorem ep_Q2_074_partial_24_0104_valid :
    mulPoly ep_Q2_074_coefficient_24_0104
        ep_Q2_074_generator_24_0100_0121 =
      ep_Q2_074_partial_24_0104 := by
  native_decide

/-- Coefficient term 105 from coefficient polynomial 24. -/
def ep_Q2_074_coefficient_24_0105 : Poly :=
[
  term ((-17556 : Rat) / 769) [(2, 1), (16, 1)]
]

/-- Partial product 105 for generator 24. -/
def ep_Q2_074_partial_24_0105 : Poly :=
[
  term ((35112 : Rat) / 769) [(0, 1), (2, 1), (12, 1), (16, 1)],
  term ((-17556 : Rat) / 769) [(0, 2), (2, 1), (16, 1)],
  term ((35112 : Rat) / 769) [(1, 1), (2, 1), (13, 1), (16, 1)],
  term ((-17556 : Rat) / 769) [(1, 2), (2, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 105 for generator 24. -/
theorem ep_Q2_074_partial_24_0105_valid :
    mulPoly ep_Q2_074_coefficient_24_0105
        ep_Q2_074_generator_24_0100_0121 =
      ep_Q2_074_partial_24_0105 := by
  native_decide

/-- Coefficient term 106 from coefficient polynomial 24. -/
def ep_Q2_074_coefficient_24_0106 : Poly :=
[
  term ((864 : Rat) / 769) [(2, 2), (16, 1)]
]

/-- Partial product 106 for generator 24. -/
def ep_Q2_074_partial_24_0106 : Poly :=
[
  term ((-1728 : Rat) / 769) [(0, 1), (2, 2), (12, 1), (16, 1)],
  term ((864 : Rat) / 769) [(0, 2), (2, 2), (16, 1)],
  term ((-1728 : Rat) / 769) [(1, 1), (2, 2), (13, 1), (16, 1)],
  term ((864 : Rat) / 769) [(1, 2), (2, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 106 for generator 24. -/
theorem ep_Q2_074_partial_24_0106_valid :
    mulPoly ep_Q2_074_coefficient_24_0106
        ep_Q2_074_generator_24_0100_0121 =
      ep_Q2_074_partial_24_0106 := by
  native_decide

/-- Coefficient term 107 from coefficient polynomial 24. -/
def ep_Q2_074_coefficient_24_0107 : Poly :=
[
  term ((-22221 : Rat) / 3076) [(3, 1), (7, 1), (16, 1)]
]

/-- Partial product 107 for generator 24. -/
def ep_Q2_074_partial_24_0107 : Poly :=
[
  term ((22221 : Rat) / 1538) [(0, 1), (3, 1), (7, 1), (12, 1), (16, 1)],
  term ((-22221 : Rat) / 3076) [(0, 2), (3, 1), (7, 1), (16, 1)],
  term ((22221 : Rat) / 1538) [(1, 1), (3, 1), (7, 1), (13, 1), (16, 1)],
  term ((-22221 : Rat) / 3076) [(1, 2), (3, 1), (7, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 107 for generator 24. -/
theorem ep_Q2_074_partial_24_0107_valid :
    mulPoly ep_Q2_074_coefficient_24_0107
        ep_Q2_074_generator_24_0100_0121 =
      ep_Q2_074_partial_24_0107 := by
  native_decide

/-- Coefficient term 108 from coefficient polynomial 24. -/
def ep_Q2_074_coefficient_24_0108 : Poly :=
[
  term ((-20493 : Rat) / 3076) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 108 for generator 24. -/
def ep_Q2_074_partial_24_0108 : Poly :=
[
  term ((20493 : Rat) / 1538) [(0, 1), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((-20493 : Rat) / 3076) [(0, 2), (3, 1), (15, 1), (16, 1)],
  term ((20493 : Rat) / 1538) [(1, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term ((-20493 : Rat) / 3076) [(1, 2), (3, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 108 for generator 24. -/
theorem ep_Q2_074_partial_24_0108_valid :
    mulPoly ep_Q2_074_coefficient_24_0108
        ep_Q2_074_generator_24_0100_0121 =
      ep_Q2_074_partial_24_0108 := by
  native_decide

/-- Coefficient term 109 from coefficient polynomial 24. -/
def ep_Q2_074_coefficient_24_0109 : Poly :=
[
  term ((63207 : Rat) / 1538) [(3, 2), (16, 1)]
]

/-- Partial product 109 for generator 24. -/
def ep_Q2_074_partial_24_0109 : Poly :=
[
  term ((-63207 : Rat) / 769) [(0, 1), (3, 2), (12, 1), (16, 1)],
  term ((63207 : Rat) / 1538) [(0, 2), (3, 2), (16, 1)],
  term ((-63207 : Rat) / 769) [(1, 1), (3, 2), (13, 1), (16, 1)],
  term ((63207 : Rat) / 1538) [(1, 2), (3, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 109 for generator 24. -/
theorem ep_Q2_074_partial_24_0109_valid :
    mulPoly ep_Q2_074_coefficient_24_0109
        ep_Q2_074_generator_24_0100_0121 =
      ep_Q2_074_partial_24_0109 := by
  native_decide

/-- Coefficient term 110 from coefficient polynomial 24. -/
def ep_Q2_074_coefficient_24_0110 : Poly :=
[
  term ((-1230 : Rat) / 769) [(4, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 110 for generator 24. -/
def ep_Q2_074_partial_24_0110 : Poly :=
[
  term ((2460 : Rat) / 769) [(0, 1), (4, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1230 : Rat) / 769) [(0, 2), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((2460 : Rat) / 769) [(1, 1), (4, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1230 : Rat) / 769) [(1, 2), (4, 1), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 110 for generator 24. -/
theorem ep_Q2_074_partial_24_0110_valid :
    mulPoly ep_Q2_074_coefficient_24_0110
        ep_Q2_074_generator_24_0100_0121 =
      ep_Q2_074_partial_24_0110 := by
  native_decide

/-- Coefficient term 111 from coefficient polynomial 24. -/
def ep_Q2_074_coefficient_24_0111 : Poly :=
[
  term ((-36459 : Rat) / 769) [(4, 1), (10, 1), (16, 1)]
]

/-- Partial product 111 for generator 24. -/
def ep_Q2_074_partial_24_0111 : Poly :=
[
  term ((72918 : Rat) / 769) [(0, 1), (4, 1), (10, 1), (12, 1), (16, 1)],
  term ((-36459 : Rat) / 769) [(0, 2), (4, 1), (10, 1), (16, 1)],
  term ((72918 : Rat) / 769) [(1, 1), (4, 1), (10, 1), (13, 1), (16, 1)],
  term ((-36459 : Rat) / 769) [(1, 2), (4, 1), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 111 for generator 24. -/
theorem ep_Q2_074_partial_24_0111_valid :
    mulPoly ep_Q2_074_coefficient_24_0111
        ep_Q2_074_generator_24_0100_0121 =
      ep_Q2_074_partial_24_0111 := by
  native_decide

/-- Coefficient term 112 from coefficient polynomial 24. -/
def ep_Q2_074_coefficient_24_0112 : Poly :=
[
  term ((-2997 : Rat) / 769) [(4, 1), (12, 1), (16, 1)]
]

/-- Partial product 112 for generator 24. -/
def ep_Q2_074_partial_24_0112 : Poly :=
[
  term ((5994 : Rat) / 769) [(0, 1), (4, 1), (12, 2), (16, 1)],
  term ((-2997 : Rat) / 769) [(0, 2), (4, 1), (12, 1), (16, 1)],
  term ((5994 : Rat) / 769) [(1, 1), (4, 1), (12, 1), (13, 1), (16, 1)],
  term ((-2997 : Rat) / 769) [(1, 2), (4, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 112 for generator 24. -/
theorem ep_Q2_074_partial_24_0112_valid :
    mulPoly ep_Q2_074_coefficient_24_0112
        ep_Q2_074_generator_24_0100_0121 =
      ep_Q2_074_partial_24_0112 := by
  native_decide

/-- Coefficient term 113 from coefficient polynomial 24. -/
def ep_Q2_074_coefficient_24_0113 : Poly :=
[
  term ((615 : Rat) / 769) [(4, 1), (15, 2), (16, 1)]
]

/-- Partial product 113 for generator 24. -/
def ep_Q2_074_partial_24_0113 : Poly :=
[
  term ((-1230 : Rat) / 769) [(0, 1), (4, 1), (12, 1), (15, 2), (16, 1)],
  term ((615 : Rat) / 769) [(0, 2), (4, 1), (15, 2), (16, 1)],
  term ((-1230 : Rat) / 769) [(1, 1), (4, 1), (13, 1), (15, 2), (16, 1)],
  term ((615 : Rat) / 769) [(1, 2), (4, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 113 for generator 24. -/
theorem ep_Q2_074_partial_24_0113_valid :
    mulPoly ep_Q2_074_coefficient_24_0113
        ep_Q2_074_generator_24_0100_0121 =
      ep_Q2_074_partial_24_0113 := by
  native_decide

/-- Coefficient term 114 from coefficient polynomial 24. -/
def ep_Q2_074_coefficient_24_0114 : Poly :=
[
  term ((79755 : Rat) / 3076) [(4, 1), (16, 1)]
]

/-- Partial product 114 for generator 24. -/
def ep_Q2_074_partial_24_0114 : Poly :=
[
  term ((-79755 : Rat) / 1538) [(0, 1), (4, 1), (12, 1), (16, 1)],
  term ((79755 : Rat) / 3076) [(0, 2), (4, 1), (16, 1)],
  term ((-79755 : Rat) / 1538) [(1, 1), (4, 1), (13, 1), (16, 1)],
  term ((79755 : Rat) / 3076) [(1, 2), (4, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 114 for generator 24. -/
theorem ep_Q2_074_partial_24_0114_valid :
    mulPoly ep_Q2_074_coefficient_24_0114
        ep_Q2_074_generator_24_0100_0121 =
      ep_Q2_074_partial_24_0114 := by
  native_decide

/-- Coefficient term 115 from coefficient polynomial 24. -/
def ep_Q2_074_coefficient_24_0115 : Poly :=
[
  term ((-63 : Rat) / 769) [(5, 1), (11, 1), (16, 1)]
]

/-- Partial product 115 for generator 24. -/
def ep_Q2_074_partial_24_0115 : Poly :=
[
  term ((126 : Rat) / 769) [(0, 1), (5, 1), (11, 1), (12, 1), (16, 1)],
  term ((-63 : Rat) / 769) [(0, 2), (5, 1), (11, 1), (16, 1)],
  term ((126 : Rat) / 769) [(1, 1), (5, 1), (11, 1), (13, 1), (16, 1)],
  term ((-63 : Rat) / 769) [(1, 2), (5, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 115 for generator 24. -/
theorem ep_Q2_074_partial_24_0115_valid :
    mulPoly ep_Q2_074_coefficient_24_0115
        ep_Q2_074_generator_24_0100_0121 =
      ep_Q2_074_partial_24_0115 := by
  native_decide

/-- Coefficient term 116 from coefficient polynomial 24. -/
def ep_Q2_074_coefficient_24_0116 : Poly :=
[
  term ((12590 : Rat) / 769) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 116 for generator 24. -/
def ep_Q2_074_partial_24_0116 : Poly :=
[
  term ((-25180 : Rat) / 769) [(0, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((12590 : Rat) / 769) [(0, 2), (7, 1), (15, 1), (16, 1)],
  term ((-25180 : Rat) / 769) [(1, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((12590 : Rat) / 769) [(1, 2), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 116 for generator 24. -/
theorem ep_Q2_074_partial_24_0116_valid :
    mulPoly ep_Q2_074_coefficient_24_0116
        ep_Q2_074_generator_24_0100_0121 =
      ep_Q2_074_partial_24_0116 := by
  native_decide

/-- Coefficient term 117 from coefficient polynomial 24. -/
def ep_Q2_074_coefficient_24_0117 : Poly :=
[
  term ((-101292 : Rat) / 769) [(10, 1), (16, 1)]
]

/-- Partial product 117 for generator 24. -/
def ep_Q2_074_partial_24_0117 : Poly :=
[
  term ((202584 : Rat) / 769) [(0, 1), (10, 1), (12, 1), (16, 1)],
  term ((-101292 : Rat) / 769) [(0, 2), (10, 1), (16, 1)],
  term ((202584 : Rat) / 769) [(1, 1), (10, 1), (13, 1), (16, 1)],
  term ((-101292 : Rat) / 769) [(1, 2), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 117 for generator 24. -/
theorem ep_Q2_074_partial_24_0117_valid :
    mulPoly ep_Q2_074_coefficient_24_0117
        ep_Q2_074_generator_24_0100_0121 =
      ep_Q2_074_partial_24_0117 := by
  native_decide

/-- Coefficient term 118 from coefficient polynomial 24. -/
def ep_Q2_074_coefficient_24_0118 : Poly :=
[
  term ((54576 : Rat) / 769) [(10, 2), (16, 1)]
]

/-- Partial product 118 for generator 24. -/
def ep_Q2_074_partial_24_0118 : Poly :=
[
  term ((-109152 : Rat) / 769) [(0, 1), (10, 2), (12, 1), (16, 1)],
  term ((54576 : Rat) / 769) [(0, 2), (10, 2), (16, 1)],
  term ((-109152 : Rat) / 769) [(1, 1), (10, 2), (13, 1), (16, 1)],
  term ((54576 : Rat) / 769) [(1, 2), (10, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 118 for generator 24. -/
theorem ep_Q2_074_partial_24_0118_valid :
    mulPoly ep_Q2_074_coefficient_24_0118
        ep_Q2_074_generator_24_0100_0121 =
      ep_Q2_074_partial_24_0118 := by
  native_decide

/-- Coefficient term 119 from coefficient polynomial 24. -/
def ep_Q2_074_coefficient_24_0119 : Poly :=
[
  term ((7695 : Rat) / 1538) [(12, 1), (16, 1)]
]

/-- Partial product 119 for generator 24. -/
def ep_Q2_074_partial_24_0119 : Poly :=
[
  term ((-7695 : Rat) / 769) [(0, 1), (12, 2), (16, 1)],
  term ((7695 : Rat) / 1538) [(0, 2), (12, 1), (16, 1)],
  term ((-7695 : Rat) / 769) [(1, 1), (12, 1), (13, 1), (16, 1)],
  term ((7695 : Rat) / 1538) [(1, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 119 for generator 24. -/
theorem ep_Q2_074_partial_24_0119_valid :
    mulPoly ep_Q2_074_coefficient_24_0119
        ep_Q2_074_generator_24_0100_0121 =
      ep_Q2_074_partial_24_0119 := by
  native_decide

/-- Coefficient term 120 from coefficient polynomial 24. -/
def ep_Q2_074_coefficient_24_0120 : Poly :=
[
  term ((-88261 : Rat) / 3076) [(15, 2), (16, 1)]
]

/-- Partial product 120 for generator 24. -/
def ep_Q2_074_partial_24_0120 : Poly :=
[
  term ((88261 : Rat) / 1538) [(0, 1), (12, 1), (15, 2), (16, 1)],
  term ((-88261 : Rat) / 3076) [(0, 2), (15, 2), (16, 1)],
  term ((88261 : Rat) / 1538) [(1, 1), (13, 1), (15, 2), (16, 1)],
  term ((-88261 : Rat) / 3076) [(1, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 120 for generator 24. -/
theorem ep_Q2_074_partial_24_0120_valid :
    mulPoly ep_Q2_074_coefficient_24_0120
        ep_Q2_074_generator_24_0100_0121 =
      ep_Q2_074_partial_24_0120 := by
  native_decide

/-- Coefficient term 121 from coefficient polynomial 24. -/
def ep_Q2_074_coefficient_24_0121 : Poly :=
[
  term ((432619 : Rat) / 12304) [(16, 1)]
]

/-- Partial product 121 for generator 24. -/
def ep_Q2_074_partial_24_0121 : Poly :=
[
  term ((-432619 : Rat) / 6152) [(0, 1), (12, 1), (16, 1)],
  term ((432619 : Rat) / 12304) [(0, 2), (16, 1)],
  term ((-432619 : Rat) / 6152) [(1, 1), (13, 1), (16, 1)],
  term ((432619 : Rat) / 12304) [(1, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 121 for generator 24. -/
theorem ep_Q2_074_partial_24_0121_valid :
    mulPoly ep_Q2_074_coefficient_24_0121
        ep_Q2_074_generator_24_0100_0121 =
      ep_Q2_074_partial_24_0121 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_074_partials_24_0100_0121 : List Poly :=
[
  ep_Q2_074_partial_24_0100,
  ep_Q2_074_partial_24_0101,
  ep_Q2_074_partial_24_0102,
  ep_Q2_074_partial_24_0103,
  ep_Q2_074_partial_24_0104,
  ep_Q2_074_partial_24_0105,
  ep_Q2_074_partial_24_0106,
  ep_Q2_074_partial_24_0107,
  ep_Q2_074_partial_24_0108,
  ep_Q2_074_partial_24_0109,
  ep_Q2_074_partial_24_0110,
  ep_Q2_074_partial_24_0111,
  ep_Q2_074_partial_24_0112,
  ep_Q2_074_partial_24_0113,
  ep_Q2_074_partial_24_0114,
  ep_Q2_074_partial_24_0115,
  ep_Q2_074_partial_24_0116,
  ep_Q2_074_partial_24_0117,
  ep_Q2_074_partial_24_0118,
  ep_Q2_074_partial_24_0119,
  ep_Q2_074_partial_24_0120,
  ep_Q2_074_partial_24_0121
]

/-- Sum of partial products in this block. -/
def ep_Q2_074_block_24_0100_0121 : Poly :=
[
  term ((-54120 : Rat) / 769) [(0, 1), (1, 2), (12, 1), (15, 2), (16, 1)],
  term ((43149 : Rat) / 769) [(0, 1), (1, 2), (12, 1), (16, 1)],
  term ((3996 : Rat) / 769) [(0, 1), (2, 1), (4, 1), (12, 1), (16, 1)],
  term ((-161880 : Rat) / 769) [(0, 1), (2, 1), (10, 1), (12, 1), (16, 1)],
  term ((35112 : Rat) / 769) [(0, 1), (2, 1), (12, 1), (16, 1)],
  term ((-2592 : Rat) / 769) [(0, 1), (2, 1), (12, 2), (16, 1)],
  term ((-1728 : Rat) / 769) [(0, 1), (2, 2), (12, 1), (16, 1)],
  term ((22221 : Rat) / 1538) [(0, 1), (3, 1), (7, 1), (12, 1), (16, 1)],
  term ((20493 : Rat) / 1538) [(0, 1), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((-63207 : Rat) / 769) [(0, 1), (3, 2), (12, 1), (16, 1)],
  term ((2460 : Rat) / 769) [(0, 1), (4, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((72918 : Rat) / 769) [(0, 1), (4, 1), (10, 1), (12, 1), (16, 1)],
  term ((-1230 : Rat) / 769) [(0, 1), (4, 1), (12, 1), (15, 2), (16, 1)],
  term ((-79755 : Rat) / 1538) [(0, 1), (4, 1), (12, 1), (16, 1)],
  term ((5994 : Rat) / 769) [(0, 1), (4, 1), (12, 2), (16, 1)],
  term ((126 : Rat) / 769) [(0, 1), (5, 1), (11, 1), (12, 1), (16, 1)],
  term ((-25180 : Rat) / 769) [(0, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((202584 : Rat) / 769) [(0, 1), (10, 1), (12, 1), (16, 1)],
  term ((-109152 : Rat) / 769) [(0, 1), (10, 2), (12, 1), (16, 1)],
  term ((88261 : Rat) / 1538) [(0, 1), (12, 1), (15, 2), (16, 1)],
  term ((-432619 : Rat) / 6152) [(0, 1), (12, 1), (16, 1)],
  term ((-7695 : Rat) / 769) [(0, 1), (12, 2), (16, 1)],
  term ((27060 : Rat) / 769) [(0, 2), (1, 2), (15, 2), (16, 1)],
  term ((-43149 : Rat) / 1538) [(0, 2), (1, 2), (16, 1)],
  term ((-1998 : Rat) / 769) [(0, 2), (2, 1), (4, 1), (16, 1)],
  term ((80940 : Rat) / 769) [(0, 2), (2, 1), (10, 1), (16, 1)],
  term ((1296 : Rat) / 769) [(0, 2), (2, 1), (12, 1), (16, 1)],
  term ((-17556 : Rat) / 769) [(0, 2), (2, 1), (16, 1)],
  term ((864 : Rat) / 769) [(0, 2), (2, 2), (16, 1)],
  term ((-22221 : Rat) / 3076) [(0, 2), (3, 1), (7, 1), (16, 1)],
  term ((-20493 : Rat) / 3076) [(0, 2), (3, 1), (15, 1), (16, 1)],
  term ((63207 : Rat) / 1538) [(0, 2), (3, 2), (16, 1)],
  term ((-1230 : Rat) / 769) [(0, 2), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((-36459 : Rat) / 769) [(0, 2), (4, 1), (10, 1), (16, 1)],
  term ((-2997 : Rat) / 769) [(0, 2), (4, 1), (12, 1), (16, 1)],
  term ((615 : Rat) / 769) [(0, 2), (4, 1), (15, 2), (16, 1)],
  term ((79755 : Rat) / 3076) [(0, 2), (4, 1), (16, 1)],
  term ((-63 : Rat) / 769) [(0, 2), (5, 1), (11, 1), (16, 1)],
  term ((12590 : Rat) / 769) [(0, 2), (7, 1), (15, 1), (16, 1)],
  term ((-101292 : Rat) / 769) [(0, 2), (10, 1), (16, 1)],
  term ((54576 : Rat) / 769) [(0, 2), (10, 2), (16, 1)],
  term ((7695 : Rat) / 1538) [(0, 2), (12, 1), (16, 1)],
  term ((-88261 : Rat) / 3076) [(0, 2), (15, 2), (16, 1)],
  term ((432619 : Rat) / 12304) [(0, 2), (16, 1)],
  term ((3996 : Rat) / 769) [(1, 1), (2, 1), (4, 1), (13, 1), (16, 1)],
  term ((-161880 : Rat) / 769) [(1, 1), (2, 1), (10, 1), (13, 1), (16, 1)],
  term ((-2592 : Rat) / 769) [(1, 1), (2, 1), (12, 1), (13, 1), (16, 1)],
  term ((35112 : Rat) / 769) [(1, 1), (2, 1), (13, 1), (16, 1)],
  term ((-1728 : Rat) / 769) [(1, 1), (2, 2), (13, 1), (16, 1)],
  term ((22221 : Rat) / 1538) [(1, 1), (3, 1), (7, 1), (13, 1), (16, 1)],
  term ((20493 : Rat) / 1538) [(1, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term ((-63207 : Rat) / 769) [(1, 1), (3, 2), (13, 1), (16, 1)],
  term ((2460 : Rat) / 769) [(1, 1), (4, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((72918 : Rat) / 769) [(1, 1), (4, 1), (10, 1), (13, 1), (16, 1)],
  term ((5994 : Rat) / 769) [(1, 1), (4, 1), (12, 1), (13, 1), (16, 1)],
  term ((-1230 : Rat) / 769) [(1, 1), (4, 1), (13, 1), (15, 2), (16, 1)],
  term ((-79755 : Rat) / 1538) [(1, 1), (4, 1), (13, 1), (16, 1)],
  term ((126 : Rat) / 769) [(1, 1), (5, 1), (11, 1), (13, 1), (16, 1)],
  term ((-25180 : Rat) / 769) [(1, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((202584 : Rat) / 769) [(1, 1), (10, 1), (13, 1), (16, 1)],
  term ((-109152 : Rat) / 769) [(1, 1), (10, 2), (13, 1), (16, 1)],
  term ((-7695 : Rat) / 769) [(1, 1), (12, 1), (13, 1), (16, 1)],
  term ((88261 : Rat) / 1538) [(1, 1), (13, 1), (15, 2), (16, 1)],
  term ((-432619 : Rat) / 6152) [(1, 1), (13, 1), (16, 1)],
  term ((-1998 : Rat) / 769) [(1, 2), (2, 1), (4, 1), (16, 1)],
  term ((80940 : Rat) / 769) [(1, 2), (2, 1), (10, 1), (16, 1)],
  term ((1296 : Rat) / 769) [(1, 2), (2, 1), (12, 1), (16, 1)],
  term ((-17556 : Rat) / 769) [(1, 2), (2, 1), (16, 1)],
  term ((864 : Rat) / 769) [(1, 2), (2, 2), (16, 1)],
  term ((-22221 : Rat) / 3076) [(1, 2), (3, 1), (7, 1), (16, 1)],
  term ((-20493 : Rat) / 3076) [(1, 2), (3, 1), (15, 1), (16, 1)],
  term ((63207 : Rat) / 1538) [(1, 2), (3, 2), (16, 1)],
  term ((-1230 : Rat) / 769) [(1, 2), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((-36459 : Rat) / 769) [(1, 2), (4, 1), (10, 1), (16, 1)],
  term ((-2997 : Rat) / 769) [(1, 2), (4, 1), (12, 1), (16, 1)],
  term ((615 : Rat) / 769) [(1, 2), (4, 1), (15, 2), (16, 1)],
  term ((79755 : Rat) / 3076) [(1, 2), (4, 1), (16, 1)],
  term ((-63 : Rat) / 769) [(1, 2), (5, 1), (11, 1), (16, 1)],
  term ((12590 : Rat) / 769) [(1, 2), (7, 1), (15, 1), (16, 1)],
  term ((-101292 : Rat) / 769) [(1, 2), (10, 1), (16, 1)],
  term ((54576 : Rat) / 769) [(1, 2), (10, 2), (16, 1)],
  term ((7695 : Rat) / 1538) [(1, 2), (12, 1), (16, 1)],
  term ((-88261 : Rat) / 3076) [(1, 2), (15, 2), (16, 1)],
  term ((432619 : Rat) / 12304) [(1, 2), (16, 1)],
  term ((-54120 : Rat) / 769) [(1, 3), (13, 1), (15, 2), (16, 1)],
  term ((43149 : Rat) / 769) [(1, 3), (13, 1), (16, 1)],
  term ((27060 : Rat) / 769) [(1, 4), (15, 2), (16, 1)],
  term ((-43149 : Rat) / 1538) [(1, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 24, terms 100 through 121. -/
theorem ep_Q2_074_block_24_0100_0121_valid :
    checkProductSumEq ep_Q2_074_partials_24_0100_0121
      ep_Q2_074_block_24_0100_0121 = true := by
  native_decide

end EpQ2074TermShards

end Patterns

end EndpointCertificate

end Problem97
