/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_074, term block 21:100-142

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_074`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2074TermShards

/-- Generator polynomial 21 for endpoint certificate `ep_Q2_074`. -/
def ep_Q2_074_generator_21_0100_0142 : Poly :=
[
  term (-1 : Rat) [],
  term (-2 : Rat) [(0, 1), (10, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (11, 1)],
  term (1 : Rat) [(1, 2)],
  term (2 : Rat) [(10, 1)]
]

/-- Coefficient term 100 from coefficient polynomial 21. -/
def ep_Q2_074_coefficient_21_0100 : Poly :=
[
  term ((-7380 : Rat) / 769) [(1, 3), (3, 1), (16, 1)]
]

/-- Partial product 100 for generator 21. -/
def ep_Q2_074_partial_21_0100 : Poly :=
[
  term ((14760 : Rat) / 769) [(0, 1), (1, 3), (3, 1), (10, 1), (16, 1)],
  term ((-7380 : Rat) / 769) [(0, 2), (1, 3), (3, 1), (16, 1)],
  term ((-14760 : Rat) / 769) [(1, 3), (3, 1), (10, 1), (16, 1)],
  term ((7380 : Rat) / 769) [(1, 3), (3, 1), (16, 1)],
  term ((14760 : Rat) / 769) [(1, 4), (3, 1), (11, 1), (16, 1)],
  term ((-7380 : Rat) / 769) [(1, 5), (3, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 21. -/
theorem ep_Q2_074_partial_21_0100_valid :
    mulPoly ep_Q2_074_coefficient_21_0100
        ep_Q2_074_generator_21_0100_0142 =
      ep_Q2_074_partial_21_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 21. -/
def ep_Q2_074_coefficient_21_0101 : Poly :=
[
  term ((-14760 : Rat) / 769) [(1, 3), (4, 1), (5, 1), (16, 1)]
]

/-- Partial product 101 for generator 21. -/
def ep_Q2_074_partial_21_0101 : Poly :=
[
  term ((29520 : Rat) / 769) [(0, 1), (1, 3), (4, 1), (5, 1), (10, 1), (16, 1)],
  term ((-14760 : Rat) / 769) [(0, 2), (1, 3), (4, 1), (5, 1), (16, 1)],
  term ((-29520 : Rat) / 769) [(1, 3), (4, 1), (5, 1), (10, 1), (16, 1)],
  term ((14760 : Rat) / 769) [(1, 3), (4, 1), (5, 1), (16, 1)],
  term ((29520 : Rat) / 769) [(1, 4), (4, 1), (5, 1), (11, 1), (16, 1)],
  term ((-14760 : Rat) / 769) [(1, 5), (4, 1), (5, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 21. -/
theorem ep_Q2_074_partial_21_0101_valid :
    mulPoly ep_Q2_074_coefficient_21_0101
        ep_Q2_074_generator_21_0100_0142 =
      ep_Q2_074_partial_21_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 21. -/
def ep_Q2_074_coefficient_21_0102 : Poly :=
[
  term ((9840 : Rat) / 769) [(1, 3), (5, 1), (16, 1)]
]

/-- Partial product 102 for generator 21. -/
def ep_Q2_074_partial_21_0102 : Poly :=
[
  term ((-19680 : Rat) / 769) [(0, 1), (1, 3), (5, 1), (10, 1), (16, 1)],
  term ((9840 : Rat) / 769) [(0, 2), (1, 3), (5, 1), (16, 1)],
  term ((19680 : Rat) / 769) [(1, 3), (5, 1), (10, 1), (16, 1)],
  term ((-9840 : Rat) / 769) [(1, 3), (5, 1), (16, 1)],
  term ((-19680 : Rat) / 769) [(1, 4), (5, 1), (11, 1), (16, 1)],
  term ((9840 : Rat) / 769) [(1, 5), (5, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 21. -/
theorem ep_Q2_074_partial_21_0102_valid :
    mulPoly ep_Q2_074_coefficient_21_0102
        ep_Q2_074_generator_21_0100_0142 =
      ep_Q2_074_partial_21_0102 := by
  native_decide

/-- Coefficient term 103 from coefficient polynomial 21. -/
def ep_Q2_074_coefficient_21_0103 : Poly :=
[
  term ((132 : Rat) / 769) [(1, 3), (7, 1), (16, 1)]
]

/-- Partial product 103 for generator 21. -/
def ep_Q2_074_partial_21_0103 : Poly :=
[
  term ((-264 : Rat) / 769) [(0, 1), (1, 3), (7, 1), (10, 1), (16, 1)],
  term ((132 : Rat) / 769) [(0, 2), (1, 3), (7, 1), (16, 1)],
  term ((264 : Rat) / 769) [(1, 3), (7, 1), (10, 1), (16, 1)],
  term ((-132 : Rat) / 769) [(1, 3), (7, 1), (16, 1)],
  term ((-264 : Rat) / 769) [(1, 4), (7, 1), (11, 1), (16, 1)],
  term ((132 : Rat) / 769) [(1, 5), (7, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 103 for generator 21. -/
theorem ep_Q2_074_partial_21_0103_valid :
    mulPoly ep_Q2_074_coefficient_21_0103
        ep_Q2_074_generator_21_0100_0142 =
      ep_Q2_074_partial_21_0103 := by
  native_decide

/-- Coefficient term 104 from coefficient polynomial 21. -/
def ep_Q2_074_coefficient_21_0104 : Poly :=
[
  term ((-132 : Rat) / 769) [(1, 3), (11, 1), (16, 1)]
]

/-- Partial product 104 for generator 21. -/
def ep_Q2_074_partial_21_0104 : Poly :=
[
  term ((264 : Rat) / 769) [(0, 1), (1, 3), (10, 1), (11, 1), (16, 1)],
  term ((-132 : Rat) / 769) [(0, 2), (1, 3), (11, 1), (16, 1)],
  term ((-264 : Rat) / 769) [(1, 3), (10, 1), (11, 1), (16, 1)],
  term ((132 : Rat) / 769) [(1, 3), (11, 1), (16, 1)],
  term ((264 : Rat) / 769) [(1, 4), (11, 2), (16, 1)],
  term ((-132 : Rat) / 769) [(1, 5), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 104 for generator 21. -/
theorem ep_Q2_074_partial_21_0104_valid :
    mulPoly ep_Q2_074_coefficient_21_0104
        ep_Q2_074_generator_21_0100_0142 =
      ep_Q2_074_partial_21_0104 := by
  native_decide

/-- Coefficient term 105 from coefficient polynomial 21. -/
def ep_Q2_074_coefficient_21_0105 : Poly :=
[
  term ((29520 : Rat) / 769) [(1, 4), (2, 1), (16, 1)]
]

/-- Partial product 105 for generator 21. -/
def ep_Q2_074_partial_21_0105 : Poly :=
[
  term ((-59040 : Rat) / 769) [(0, 1), (1, 4), (2, 1), (10, 1), (16, 1)],
  term ((29520 : Rat) / 769) [(0, 2), (1, 4), (2, 1), (16, 1)],
  term ((59040 : Rat) / 769) [(1, 4), (2, 1), (10, 1), (16, 1)],
  term ((-29520 : Rat) / 769) [(1, 4), (2, 1), (16, 1)],
  term ((-59040 : Rat) / 769) [(1, 5), (2, 1), (11, 1), (16, 1)],
  term ((29520 : Rat) / 769) [(1, 6), (2, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 105 for generator 21. -/
theorem ep_Q2_074_partial_21_0105_valid :
    mulPoly ep_Q2_074_coefficient_21_0105
        ep_Q2_074_generator_21_0100_0142 =
      ep_Q2_074_partial_21_0105 := by
  native_decide

/-- Coefficient term 106 from coefficient polynomial 21. -/
def ep_Q2_074_coefficient_21_0106 : Poly :=
[
  term ((-14760 : Rat) / 769) [(1, 4), (4, 1), (16, 1)]
]

/-- Partial product 106 for generator 21. -/
def ep_Q2_074_partial_21_0106 : Poly :=
[
  term ((29520 : Rat) / 769) [(0, 1), (1, 4), (4, 1), (10, 1), (16, 1)],
  term ((-14760 : Rat) / 769) [(0, 2), (1, 4), (4, 1), (16, 1)],
  term ((-29520 : Rat) / 769) [(1, 4), (4, 1), (10, 1), (16, 1)],
  term ((14760 : Rat) / 769) [(1, 4), (4, 1), (16, 1)],
  term ((29520 : Rat) / 769) [(1, 5), (4, 1), (11, 1), (16, 1)],
  term ((-14760 : Rat) / 769) [(1, 6), (4, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 106 for generator 21. -/
theorem ep_Q2_074_partial_21_0106_valid :
    mulPoly ep_Q2_074_coefficient_21_0106
        ep_Q2_074_generator_21_0100_0142 =
      ep_Q2_074_partial_21_0106 := by
  native_decide

/-- Coefficient term 107 from coefficient polynomial 21. -/
def ep_Q2_074_coefficient_21_0107 : Poly :=
[
  term ((29520 : Rat) / 769) [(1, 4), (10, 1), (16, 1)]
]

/-- Partial product 107 for generator 21. -/
def ep_Q2_074_partial_21_0107 : Poly :=
[
  term ((-59040 : Rat) / 769) [(0, 1), (1, 4), (10, 2), (16, 1)],
  term ((29520 : Rat) / 769) [(0, 2), (1, 4), (10, 1), (16, 1)],
  term ((-29520 : Rat) / 769) [(1, 4), (10, 1), (16, 1)],
  term ((59040 : Rat) / 769) [(1, 4), (10, 2), (16, 1)],
  term ((-59040 : Rat) / 769) [(1, 5), (10, 1), (11, 1), (16, 1)],
  term ((29520 : Rat) / 769) [(1, 6), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 107 for generator 21. -/
theorem ep_Q2_074_partial_21_0107_valid :
    mulPoly ep_Q2_074_coefficient_21_0107
        ep_Q2_074_generator_21_0100_0142 =
      ep_Q2_074_partial_21_0107 := by
  native_decide

/-- Coefficient term 108 from coefficient polynomial 21. -/
def ep_Q2_074_coefficient_21_0108 : Poly :=
[
  term ((-29520 : Rat) / 769) [(1, 4), (16, 1)]
]

/-- Partial product 108 for generator 21. -/
def ep_Q2_074_partial_21_0108 : Poly :=
[
  term ((59040 : Rat) / 769) [(0, 1), (1, 4), (10, 1), (16, 1)],
  term ((-29520 : Rat) / 769) [(0, 2), (1, 4), (16, 1)],
  term ((-59040 : Rat) / 769) [(1, 4), (10, 1), (16, 1)],
  term ((29520 : Rat) / 769) [(1, 4), (16, 1)],
  term ((59040 : Rat) / 769) [(1, 5), (11, 1), (16, 1)],
  term ((-29520 : Rat) / 769) [(1, 6), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 108 for generator 21. -/
theorem ep_Q2_074_partial_21_0108_valid :
    mulPoly ep_Q2_074_coefficient_21_0108
        ep_Q2_074_generator_21_0100_0142 =
      ep_Q2_074_partial_21_0108 := by
  native_decide

/-- Coefficient term 109 from coefficient polynomial 21. -/
def ep_Q2_074_coefficient_21_0109 : Poly :=
[
  term ((-864 : Rat) / 769) [(2, 1), (3, 1), (5, 1), (16, 1)]
]

/-- Partial product 109 for generator 21. -/
def ep_Q2_074_partial_21_0109 : Poly :=
[
  term ((1728 : Rat) / 769) [(0, 1), (2, 1), (3, 1), (5, 1), (10, 1), (16, 1)],
  term ((-864 : Rat) / 769) [(0, 2), (2, 1), (3, 1), (5, 1), (16, 1)],
  term ((1728 : Rat) / 769) [(1, 1), (2, 1), (3, 1), (5, 1), (11, 1), (16, 1)],
  term ((-864 : Rat) / 769) [(1, 2), (2, 1), (3, 1), (5, 1), (16, 1)],
  term ((-1728 : Rat) / 769) [(2, 1), (3, 1), (5, 1), (10, 1), (16, 1)],
  term ((864 : Rat) / 769) [(2, 1), (3, 1), (5, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 109 for generator 21. -/
theorem ep_Q2_074_partial_21_0109_valid :
    mulPoly ep_Q2_074_coefficient_21_0109
        ep_Q2_074_generator_21_0100_0142 =
      ep_Q2_074_partial_21_0109 := by
  native_decide

/-- Coefficient term 110 from coefficient polynomial 21. -/
def ep_Q2_074_coefficient_21_0110 : Poly :=
[
  term ((-44412 : Rat) / 769) [(2, 1), (4, 1), (10, 1), (16, 1)]
]

/-- Partial product 110 for generator 21. -/
def ep_Q2_074_partial_21_0110 : Poly :=
[
  term ((88824 : Rat) / 769) [(0, 1), (2, 1), (4, 1), (10, 2), (16, 1)],
  term ((-44412 : Rat) / 769) [(0, 2), (2, 1), (4, 1), (10, 1), (16, 1)],
  term ((88824 : Rat) / 769) [(1, 1), (2, 1), (4, 1), (10, 1), (11, 1), (16, 1)],
  term ((-44412 : Rat) / 769) [(1, 2), (2, 1), (4, 1), (10, 1), (16, 1)],
  term ((44412 : Rat) / 769) [(2, 1), (4, 1), (10, 1), (16, 1)],
  term ((-88824 : Rat) / 769) [(2, 1), (4, 1), (10, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 110 for generator 21. -/
theorem ep_Q2_074_partial_21_0110_valid :
    mulPoly ep_Q2_074_coefficient_21_0110
        ep_Q2_074_generator_21_0100_0142 =
      ep_Q2_074_partial_21_0110 := by
  native_decide

/-- Coefficient term 111 from coefficient polynomial 21. -/
def ep_Q2_074_coefficient_21_0111 : Poly :=
[
  term ((-4569 : Rat) / 769) [(2, 1), (4, 1), (16, 1)]
]

/-- Partial product 111 for generator 21. -/
def ep_Q2_074_partial_21_0111 : Poly :=
[
  term ((9138 : Rat) / 769) [(0, 1), (2, 1), (4, 1), (10, 1), (16, 1)],
  term ((-4569 : Rat) / 769) [(0, 2), (2, 1), (4, 1), (16, 1)],
  term ((9138 : Rat) / 769) [(1, 1), (2, 1), (4, 1), (11, 1), (16, 1)],
  term ((-4569 : Rat) / 769) [(1, 2), (2, 1), (4, 1), (16, 1)],
  term ((-9138 : Rat) / 769) [(2, 1), (4, 1), (10, 1), (16, 1)],
  term ((4569 : Rat) / 769) [(2, 1), (4, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 111 for generator 21. -/
theorem ep_Q2_074_partial_21_0111_valid :
    mulPoly ep_Q2_074_coefficient_21_0111
        ep_Q2_074_generator_21_0100_0142 =
      ep_Q2_074_partial_21_0111 := by
  native_decide

/-- Coefficient term 112 from coefficient polynomial 21. -/
def ep_Q2_074_coefficient_21_0112 : Poly :=
[
  term ((13566 : Rat) / 769) [(2, 1), (4, 2), (16, 1)]
]

/-- Partial product 112 for generator 21. -/
def ep_Q2_074_partial_21_0112 : Poly :=
[
  term ((-27132 : Rat) / 769) [(0, 1), (2, 1), (4, 2), (10, 1), (16, 1)],
  term ((13566 : Rat) / 769) [(0, 2), (2, 1), (4, 2), (16, 1)],
  term ((-27132 : Rat) / 769) [(1, 1), (2, 1), (4, 2), (11, 1), (16, 1)],
  term ((13566 : Rat) / 769) [(1, 2), (2, 1), (4, 2), (16, 1)],
  term ((27132 : Rat) / 769) [(2, 1), (4, 2), (10, 1), (16, 1)],
  term ((-13566 : Rat) / 769) [(2, 1), (4, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 112 for generator 21. -/
theorem ep_Q2_074_partial_21_0112_valid :
    mulPoly ep_Q2_074_coefficient_21_0112
        ep_Q2_074_generator_21_0100_0142 =
      ep_Q2_074_partial_21_0112 := by
  native_decide

/-- Coefficient term 113 from coefficient polynomial 21. -/
def ep_Q2_074_coefficient_21_0113 : Poly :=
[
  term ((-44412 : Rat) / 769) [(2, 1), (5, 1), (11, 1), (16, 1)]
]

/-- Partial product 113 for generator 21. -/
def ep_Q2_074_partial_21_0113 : Poly :=
[
  term ((88824 : Rat) / 769) [(0, 1), (2, 1), (5, 1), (10, 1), (11, 1), (16, 1)],
  term ((-44412 : Rat) / 769) [(0, 2), (2, 1), (5, 1), (11, 1), (16, 1)],
  term ((88824 : Rat) / 769) [(1, 1), (2, 1), (5, 1), (11, 2), (16, 1)],
  term ((-44412 : Rat) / 769) [(1, 2), (2, 1), (5, 1), (11, 1), (16, 1)],
  term ((-88824 : Rat) / 769) [(2, 1), (5, 1), (10, 1), (11, 1), (16, 1)],
  term ((44412 : Rat) / 769) [(2, 1), (5, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 113 for generator 21. -/
theorem ep_Q2_074_partial_21_0113_valid :
    mulPoly ep_Q2_074_coefficient_21_0113
        ep_Q2_074_generator_21_0100_0142 =
      ep_Q2_074_partial_21_0113 := by
  native_decide

/-- Coefficient term 114 from coefficient polynomial 21. -/
def ep_Q2_074_coefficient_21_0114 : Poly :=
[
  term ((22638 : Rat) / 769) [(2, 1), (5, 2), (16, 1)]
]

/-- Partial product 114 for generator 21. -/
def ep_Q2_074_partial_21_0114 : Poly :=
[
  term ((-45276 : Rat) / 769) [(0, 1), (2, 1), (5, 2), (10, 1), (16, 1)],
  term ((22638 : Rat) / 769) [(0, 2), (2, 1), (5, 2), (16, 1)],
  term ((-45276 : Rat) / 769) [(1, 1), (2, 1), (5, 2), (11, 1), (16, 1)],
  term ((22638 : Rat) / 769) [(1, 2), (2, 1), (5, 2), (16, 1)],
  term ((45276 : Rat) / 769) [(2, 1), (5, 2), (10, 1), (16, 1)],
  term ((-22638 : Rat) / 769) [(2, 1), (5, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 114 for generator 21. -/
theorem ep_Q2_074_partial_21_0114_valid :
    mulPoly ep_Q2_074_coefficient_21_0114
        ep_Q2_074_generator_21_0100_0142 =
      ep_Q2_074_partial_21_0114 := by
  native_decide

/-- Coefficient term 115 from coefficient polynomial 21. -/
def ep_Q2_074_coefficient_21_0115 : Poly :=
[
  term ((40470 : Rat) / 769) [(2, 1), (12, 1), (16, 1)]
]

/-- Partial product 115 for generator 21. -/
def ep_Q2_074_partial_21_0115 : Poly :=
[
  term ((-80940 : Rat) / 769) [(0, 1), (2, 1), (10, 1), (12, 1), (16, 1)],
  term ((40470 : Rat) / 769) [(0, 2), (2, 1), (12, 1), (16, 1)],
  term ((-80940 : Rat) / 769) [(1, 1), (2, 1), (11, 1), (12, 1), (16, 1)],
  term ((40470 : Rat) / 769) [(1, 2), (2, 1), (12, 1), (16, 1)],
  term ((80940 : Rat) / 769) [(2, 1), (10, 1), (12, 1), (16, 1)],
  term ((-40470 : Rat) / 769) [(2, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 115 for generator 21. -/
theorem ep_Q2_074_partial_21_0115_valid :
    mulPoly ep_Q2_074_coefficient_21_0115
        ep_Q2_074_generator_21_0100_0142 =
      ep_Q2_074_partial_21_0115 := by
  native_decide

/-- Coefficient term 116 from coefficient polynomial 21. -/
def ep_Q2_074_coefficient_21_0116 : Poly :=
[
  term ((80940 : Rat) / 769) [(2, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 116 for generator 21. -/
def ep_Q2_074_partial_21_0116 : Poly :=
[
  term ((-161880 : Rat) / 769) [(0, 1), (2, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((80940 : Rat) / 769) [(0, 2), (2, 1), (13, 1), (15, 1), (16, 1)],
  term ((-161880 : Rat) / 769) [(1, 1), (2, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((80940 : Rat) / 769) [(1, 2), (2, 1), (13, 1), (15, 1), (16, 1)],
  term ((161880 : Rat) / 769) [(2, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-80940 : Rat) / 769) [(2, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 116 for generator 21. -/
theorem ep_Q2_074_partial_21_0116_valid :
    mulPoly ep_Q2_074_coefficient_21_0116
        ep_Q2_074_generator_21_0100_0142 =
      ep_Q2_074_partial_21_0116 := by
  native_decide

/-- Coefficient term 117 from coefficient polynomial 21. -/
def ep_Q2_074_coefficient_21_0117 : Poly :=
[
  term ((-40470 : Rat) / 769) [(2, 1), (16, 1)]
]

/-- Partial product 117 for generator 21. -/
def ep_Q2_074_partial_21_0117 : Poly :=
[
  term ((80940 : Rat) / 769) [(0, 1), (2, 1), (10, 1), (16, 1)],
  term ((-40470 : Rat) / 769) [(0, 2), (2, 1), (16, 1)],
  term ((80940 : Rat) / 769) [(1, 1), (2, 1), (11, 1), (16, 1)],
  term ((-40470 : Rat) / 769) [(1, 2), (2, 1), (16, 1)],
  term ((-80940 : Rat) / 769) [(2, 1), (10, 1), (16, 1)],
  term ((40470 : Rat) / 769) [(2, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 117 for generator 21. -/
theorem ep_Q2_074_partial_21_0117_valid :
    mulPoly ep_Q2_074_coefficient_21_0117
        ep_Q2_074_generator_21_0100_0142 =
      ep_Q2_074_partial_21_0117 := by
  native_decide

/-- Coefficient term 118 from coefficient polynomial 21. -/
def ep_Q2_074_coefficient_21_0118 : Poly :=
[
  term ((-864 : Rat) / 769) [(2, 2), (4, 1), (16, 1)]
]

/-- Partial product 118 for generator 21. -/
def ep_Q2_074_partial_21_0118 : Poly :=
[
  term ((1728 : Rat) / 769) [(0, 1), (2, 2), (4, 1), (10, 1), (16, 1)],
  term ((-864 : Rat) / 769) [(0, 2), (2, 2), (4, 1), (16, 1)],
  term ((1728 : Rat) / 769) [(1, 1), (2, 2), (4, 1), (11, 1), (16, 1)],
  term ((-864 : Rat) / 769) [(1, 2), (2, 2), (4, 1), (16, 1)],
  term ((-1728 : Rat) / 769) [(2, 2), (4, 1), (10, 1), (16, 1)],
  term ((864 : Rat) / 769) [(2, 2), (4, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 118 for generator 21. -/
theorem ep_Q2_074_partial_21_0118_valid :
    mulPoly ep_Q2_074_coefficient_21_0118
        ep_Q2_074_generator_21_0100_0142 =
      ep_Q2_074_partial_21_0118 := by
  native_decide

/-- Coefficient term 119 from coefficient polynomial 21. -/
def ep_Q2_074_coefficient_21_0119 : Poly :=
[
  term ((-9072 : Rat) / 769) [(3, 1), (4, 1), (5, 1), (16, 1)]
]

/-- Partial product 119 for generator 21. -/
def ep_Q2_074_partial_21_0119 : Poly :=
[
  term ((18144 : Rat) / 769) [(0, 1), (3, 1), (4, 1), (5, 1), (10, 1), (16, 1)],
  term ((-9072 : Rat) / 769) [(0, 2), (3, 1), (4, 1), (5, 1), (16, 1)],
  term ((18144 : Rat) / 769) [(1, 1), (3, 1), (4, 1), (5, 1), (11, 1), (16, 1)],
  term ((-9072 : Rat) / 769) [(1, 2), (3, 1), (4, 1), (5, 1), (16, 1)],
  term ((-18144 : Rat) / 769) [(3, 1), (4, 1), (5, 1), (10, 1), (16, 1)],
  term ((9072 : Rat) / 769) [(3, 1), (4, 1), (5, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 119 for generator 21. -/
theorem ep_Q2_074_partial_21_0119_valid :
    mulPoly ep_Q2_074_coefficient_21_0119
        ep_Q2_074_generator_21_0100_0142 =
      ep_Q2_074_partial_21_0119 := by
  native_decide

/-- Coefficient term 120 from coefficient polynomial 21. -/
def ep_Q2_074_coefficient_21_0120 : Poly :=
[
  term ((-4569 : Rat) / 769) [(3, 1), (5, 1), (16, 1)]
]

/-- Partial product 120 for generator 21. -/
def ep_Q2_074_partial_21_0120 : Poly :=
[
  term ((9138 : Rat) / 769) [(0, 1), (3, 1), (5, 1), (10, 1), (16, 1)],
  term ((-4569 : Rat) / 769) [(0, 2), (3, 1), (5, 1), (16, 1)],
  term ((9138 : Rat) / 769) [(1, 1), (3, 1), (5, 1), (11, 1), (16, 1)],
  term ((-4569 : Rat) / 769) [(1, 2), (3, 1), (5, 1), (16, 1)],
  term ((-9138 : Rat) / 769) [(3, 1), (5, 1), (10, 1), (16, 1)],
  term ((4569 : Rat) / 769) [(3, 1), (5, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 120 for generator 21. -/
theorem ep_Q2_074_partial_21_0120_valid :
    mulPoly ep_Q2_074_coefficient_21_0120
        ep_Q2_074_generator_21_0100_0142 =
      ep_Q2_074_partial_21_0120 := by
  native_decide

/-- Coefficient term 121 from coefficient polynomial 21. -/
def ep_Q2_074_coefficient_21_0121 : Poly :=
[
  term ((21471 : Rat) / 769) [(4, 1), (5, 1), (11, 1), (16, 1)]
]

/-- Partial product 121 for generator 21. -/
def ep_Q2_074_partial_21_0121 : Poly :=
[
  term ((-42942 : Rat) / 769) [(0, 1), (4, 1), (5, 1), (10, 1), (11, 1), (16, 1)],
  term ((21471 : Rat) / 769) [(0, 2), (4, 1), (5, 1), (11, 1), (16, 1)],
  term ((-42942 : Rat) / 769) [(1, 1), (4, 1), (5, 1), (11, 2), (16, 1)],
  term ((21471 : Rat) / 769) [(1, 2), (4, 1), (5, 1), (11, 1), (16, 1)],
  term ((42942 : Rat) / 769) [(4, 1), (5, 1), (10, 1), (11, 1), (16, 1)],
  term ((-21471 : Rat) / 769) [(4, 1), (5, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 121 for generator 21. -/
theorem ep_Q2_074_partial_21_0121_valid :
    mulPoly ep_Q2_074_coefficient_21_0121
        ep_Q2_074_generator_21_0100_0142 =
      ep_Q2_074_partial_21_0121 := by
  native_decide

/-- Coefficient term 122 from coefficient polynomial 21. -/
def ep_Q2_074_coefficient_21_0122 : Poly :=
[
  term ((-12399 : Rat) / 1538) [(4, 1), (5, 2), (16, 1)]
]

/-- Partial product 122 for generator 21. -/
def ep_Q2_074_partial_21_0122 : Poly :=
[
  term ((12399 : Rat) / 769) [(0, 1), (4, 1), (5, 2), (10, 1), (16, 1)],
  term ((-12399 : Rat) / 1538) [(0, 2), (4, 1), (5, 2), (16, 1)],
  term ((12399 : Rat) / 769) [(1, 1), (4, 1), (5, 2), (11, 1), (16, 1)],
  term ((-12399 : Rat) / 1538) [(1, 2), (4, 1), (5, 2), (16, 1)],
  term ((-12399 : Rat) / 769) [(4, 1), (5, 2), (10, 1), (16, 1)],
  term ((12399 : Rat) / 1538) [(4, 1), (5, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 122 for generator 21. -/
theorem ep_Q2_074_partial_21_0122_valid :
    mulPoly ep_Q2_074_coefficient_21_0122
        ep_Q2_074_generator_21_0100_0142 =
      ep_Q2_074_partial_21_0122 := by
  native_decide

/-- Coefficient term 123 from coefficient polynomial 21. -/
def ep_Q2_074_coefficient_21_0123 : Poly :=
[
  term ((46881 : Rat) / 769) [(4, 1), (10, 1), (16, 1)]
]

/-- Partial product 123 for generator 21. -/
def ep_Q2_074_partial_21_0123 : Poly :=
[
  term ((-93762 : Rat) / 769) [(0, 1), (4, 1), (10, 2), (16, 1)],
  term ((46881 : Rat) / 769) [(0, 2), (4, 1), (10, 1), (16, 1)],
  term ((-93762 : Rat) / 769) [(1, 1), (4, 1), (10, 1), (11, 1), (16, 1)],
  term ((46881 : Rat) / 769) [(1, 2), (4, 1), (10, 1), (16, 1)],
  term ((-46881 : Rat) / 769) [(4, 1), (10, 1), (16, 1)],
  term ((93762 : Rat) / 769) [(4, 1), (10, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 123 for generator 21. -/
theorem ep_Q2_074_partial_21_0123_valid :
    mulPoly ep_Q2_074_coefficient_21_0123
        ep_Q2_074_generator_21_0100_0142 =
      ep_Q2_074_partial_21_0123 := by
  native_decide

/-- Coefficient term 124 from coefficient polynomial 21. -/
def ep_Q2_074_coefficient_21_0124 : Poly :=
[
  term ((-22464 : Rat) / 769) [(4, 1), (10, 2), (16, 1)]
]

/-- Partial product 124 for generator 21. -/
def ep_Q2_074_partial_21_0124 : Poly :=
[
  term ((44928 : Rat) / 769) [(0, 1), (4, 1), (10, 3), (16, 1)],
  term ((-22464 : Rat) / 769) [(0, 2), (4, 1), (10, 2), (16, 1)],
  term ((44928 : Rat) / 769) [(1, 1), (4, 1), (10, 2), (11, 1), (16, 1)],
  term ((-22464 : Rat) / 769) [(1, 2), (4, 1), (10, 2), (16, 1)],
  term ((22464 : Rat) / 769) [(4, 1), (10, 2), (16, 1)],
  term ((-44928 : Rat) / 769) [(4, 1), (10, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 124 for generator 21. -/
theorem ep_Q2_074_partial_21_0124_valid :
    mulPoly ep_Q2_074_coefficient_21_0124
        ep_Q2_074_generator_21_0100_0142 =
      ep_Q2_074_partial_21_0124 := by
  native_decide

/-- Coefficient term 125 from coefficient polynomial 21. -/
def ep_Q2_074_coefficient_21_0125 : Poly :=
[
  term ((-36333 : Rat) / 1538) [(4, 1), (12, 1), (16, 1)]
]

/-- Partial product 125 for generator 21. -/
def ep_Q2_074_partial_21_0125 : Poly :=
[
  term ((36333 : Rat) / 769) [(0, 1), (4, 1), (10, 1), (12, 1), (16, 1)],
  term ((-36333 : Rat) / 1538) [(0, 2), (4, 1), (12, 1), (16, 1)],
  term ((36333 : Rat) / 769) [(1, 1), (4, 1), (11, 1), (12, 1), (16, 1)],
  term ((-36333 : Rat) / 1538) [(1, 2), (4, 1), (12, 1), (16, 1)],
  term ((-36333 : Rat) / 769) [(4, 1), (10, 1), (12, 1), (16, 1)],
  term ((36333 : Rat) / 1538) [(4, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 125 for generator 21. -/
theorem ep_Q2_074_partial_21_0125_valid :
    mulPoly ep_Q2_074_coefficient_21_0125
        ep_Q2_074_generator_21_0100_0142 =
      ep_Q2_074_partial_21_0125 := by
  native_decide

/-- Coefficient term 126 from coefficient polynomial 21. -/
def ep_Q2_074_coefficient_21_0126 : Poly :=
[
  term ((-36459 : Rat) / 769) [(4, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 126 for generator 21. -/
def ep_Q2_074_partial_21_0126 : Poly :=
[
  term ((72918 : Rat) / 769) [(0, 1), (4, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-36459 : Rat) / 769) [(0, 2), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((72918 : Rat) / 769) [(1, 1), (4, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-36459 : Rat) / 769) [(1, 2), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-72918 : Rat) / 769) [(4, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((36459 : Rat) / 769) [(4, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 126 for generator 21. -/
theorem ep_Q2_074_partial_21_0126_valid :
    mulPoly ep_Q2_074_coefficient_21_0126
        ep_Q2_074_generator_21_0100_0142 =
      ep_Q2_074_partial_21_0126 := by
  native_decide

/-- Coefficient term 127 from coefficient polynomial 21. -/
def ep_Q2_074_coefficient_21_0127 : Poly :=
[
  term ((-10377 : Rat) / 769) [(4, 1), (15, 2), (16, 1)]
]

/-- Partial product 127 for generator 21. -/
def ep_Q2_074_partial_21_0127 : Poly :=
[
  term ((20754 : Rat) / 769) [(0, 1), (4, 1), (10, 1), (15, 2), (16, 1)],
  term ((-10377 : Rat) / 769) [(0, 2), (4, 1), (15, 2), (16, 1)],
  term ((20754 : Rat) / 769) [(1, 1), (4, 1), (11, 1), (15, 2), (16, 1)],
  term ((-10377 : Rat) / 769) [(1, 2), (4, 1), (15, 2), (16, 1)],
  term ((-20754 : Rat) / 769) [(4, 1), (10, 1), (15, 2), (16, 1)],
  term ((10377 : Rat) / 769) [(4, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 127 for generator 21. -/
theorem ep_Q2_074_partial_21_0127_valid :
    mulPoly ep_Q2_074_coefficient_21_0127
        ep_Q2_074_generator_21_0100_0142 =
      ep_Q2_074_partial_21_0127 := by
  native_decide

/-- Coefficient term 128 from coefficient polynomial 21. -/
def ep_Q2_074_coefficient_21_0128 : Poly :=
[
  term ((62163 : Rat) / 3076) [(4, 1), (16, 1)]
]

/-- Partial product 128 for generator 21. -/
def ep_Q2_074_partial_21_0128 : Poly :=
[
  term ((-62163 : Rat) / 1538) [(0, 1), (4, 1), (10, 1), (16, 1)],
  term ((62163 : Rat) / 3076) [(0, 2), (4, 1), (16, 1)],
  term ((-62163 : Rat) / 1538) [(1, 1), (4, 1), (11, 1), (16, 1)],
  term ((62163 : Rat) / 3076) [(1, 2), (4, 1), (16, 1)],
  term ((62163 : Rat) / 1538) [(4, 1), (10, 1), (16, 1)],
  term ((-62163 : Rat) / 3076) [(4, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 128 for generator 21. -/
theorem ep_Q2_074_partial_21_0128_valid :
    mulPoly ep_Q2_074_coefficient_21_0128
        ep_Q2_074_generator_21_0100_0142 =
      ep_Q2_074_partial_21_0128 := by
  native_decide

/-- Coefficient term 129 from coefficient polynomial 21. -/
def ep_Q2_074_coefficient_21_0129 : Poly :=
[
  term ((32703 : Rat) / 769) [(4, 2), (10, 1), (16, 1)]
]

/-- Partial product 129 for generator 21. -/
def ep_Q2_074_partial_21_0129 : Poly :=
[
  term ((-65406 : Rat) / 769) [(0, 1), (4, 2), (10, 2), (16, 1)],
  term ((32703 : Rat) / 769) [(0, 2), (4, 2), (10, 1), (16, 1)],
  term ((-65406 : Rat) / 769) [(1, 1), (4, 2), (10, 1), (11, 1), (16, 1)],
  term ((32703 : Rat) / 769) [(1, 2), (4, 2), (10, 1), (16, 1)],
  term ((-32703 : Rat) / 769) [(4, 2), (10, 1), (16, 1)],
  term ((65406 : Rat) / 769) [(4, 2), (10, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 129 for generator 21. -/
theorem ep_Q2_074_partial_21_0129_valid :
    mulPoly ep_Q2_074_coefficient_21_0129
        ep_Q2_074_generator_21_0100_0142 =
      ep_Q2_074_partial_21_0129 := by
  native_decide

/-- Coefficient term 130 from coefficient polynomial 21. -/
def ep_Q2_074_coefficient_21_0130 : Poly :=
[
  term ((-21156 : Rat) / 769) [(4, 2), (16, 1)]
]

/-- Partial product 130 for generator 21. -/
def ep_Q2_074_partial_21_0130 : Poly :=
[
  term ((42312 : Rat) / 769) [(0, 1), (4, 2), (10, 1), (16, 1)],
  term ((-21156 : Rat) / 769) [(0, 2), (4, 2), (16, 1)],
  term ((42312 : Rat) / 769) [(1, 1), (4, 2), (11, 1), (16, 1)],
  term ((-21156 : Rat) / 769) [(1, 2), (4, 2), (16, 1)],
  term ((-42312 : Rat) / 769) [(4, 2), (10, 1), (16, 1)],
  term ((21156 : Rat) / 769) [(4, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 130 for generator 21. -/
theorem ep_Q2_074_partial_21_0130_valid :
    mulPoly ep_Q2_074_coefficient_21_0130
        ep_Q2_074_generator_21_0100_0142 =
      ep_Q2_074_partial_21_0130 := by
  native_decide

/-- Coefficient term 131 from coefficient polynomial 21. -/
def ep_Q2_074_coefficient_21_0131 : Poly :=
[
  term ((-12399 : Rat) / 1538) [(4, 3), (16, 1)]
]

/-- Partial product 131 for generator 21. -/
def ep_Q2_074_partial_21_0131 : Poly :=
[
  term ((12399 : Rat) / 769) [(0, 1), (4, 3), (10, 1), (16, 1)],
  term ((-12399 : Rat) / 1538) [(0, 2), (4, 3), (16, 1)],
  term ((12399 : Rat) / 769) [(1, 1), (4, 3), (11, 1), (16, 1)],
  term ((-12399 : Rat) / 1538) [(1, 2), (4, 3), (16, 1)],
  term ((-12399 : Rat) / 769) [(4, 3), (10, 1), (16, 1)],
  term ((12399 : Rat) / 1538) [(4, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 131 for generator 21. -/
theorem ep_Q2_074_partial_21_0131_valid :
    mulPoly ep_Q2_074_coefficient_21_0131
        ep_Q2_074_generator_21_0100_0142 =
      ep_Q2_074_partial_21_0131 := by
  native_decide

/-- Coefficient term 132 from coefficient polynomial 21. -/
def ep_Q2_074_coefficient_21_0132 : Poly :=
[
  term ((-22464 : Rat) / 769) [(5, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 132 for generator 21. -/
def ep_Q2_074_partial_21_0132 : Poly :=
[
  term ((44928 : Rat) / 769) [(0, 1), (5, 1), (10, 2), (11, 1), (16, 1)],
  term ((-22464 : Rat) / 769) [(0, 2), (5, 1), (10, 1), (11, 1), (16, 1)],
  term ((44928 : Rat) / 769) [(1, 1), (5, 1), (10, 1), (11, 2), (16, 1)],
  term ((-22464 : Rat) / 769) [(1, 2), (5, 1), (10, 1), (11, 1), (16, 1)],
  term ((22464 : Rat) / 769) [(5, 1), (10, 1), (11, 1), (16, 1)],
  term ((-44928 : Rat) / 769) [(5, 1), (10, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 132 for generator 21. -/
theorem ep_Q2_074_partial_21_0132_valid :
    mulPoly ep_Q2_074_coefficient_21_0132
        ep_Q2_074_generator_21_0100_0142 =
      ep_Q2_074_partial_21_0132 := by
  native_decide

/-- Coefficient term 133 from coefficient polynomial 21. -/
def ep_Q2_074_coefficient_21_0133 : Poly :=
[
  term ((46881 : Rat) / 769) [(5, 1), (11, 1), (16, 1)]
]

/-- Partial product 133 for generator 21. -/
def ep_Q2_074_partial_21_0133 : Poly :=
[
  term ((-93762 : Rat) / 769) [(0, 1), (5, 1), (10, 1), (11, 1), (16, 1)],
  term ((46881 : Rat) / 769) [(0, 2), (5, 1), (11, 1), (16, 1)],
  term ((-93762 : Rat) / 769) [(1, 1), (5, 1), (11, 2), (16, 1)],
  term ((46881 : Rat) / 769) [(1, 2), (5, 1), (11, 1), (16, 1)],
  term ((93762 : Rat) / 769) [(5, 1), (10, 1), (11, 1), (16, 1)],
  term ((-46881 : Rat) / 769) [(5, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 133 for generator 21. -/
theorem ep_Q2_074_partial_21_0133_valid :
    mulPoly ep_Q2_074_coefficient_21_0133
        ep_Q2_074_generator_21_0100_0142 =
      ep_Q2_074_partial_21_0133 := by
  native_decide

/-- Coefficient term 134 from coefficient polynomial 21. -/
def ep_Q2_074_coefficient_21_0134 : Poly :=
[
  term ((11232 : Rat) / 769) [(5, 2), (10, 1), (16, 1)]
]

/-- Partial product 134 for generator 21. -/
def ep_Q2_074_partial_21_0134 : Poly :=
[
  term ((-22464 : Rat) / 769) [(0, 1), (5, 2), (10, 2), (16, 1)],
  term ((11232 : Rat) / 769) [(0, 2), (5, 2), (10, 1), (16, 1)],
  term ((-22464 : Rat) / 769) [(1, 1), (5, 2), (10, 1), (11, 1), (16, 1)],
  term ((11232 : Rat) / 769) [(1, 2), (5, 2), (10, 1), (16, 1)],
  term ((-11232 : Rat) / 769) [(5, 2), (10, 1), (16, 1)],
  term ((22464 : Rat) / 769) [(5, 2), (10, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 134 for generator 21. -/
theorem ep_Q2_074_partial_21_0134_valid :
    mulPoly ep_Q2_074_coefficient_21_0134
        ep_Q2_074_generator_21_0100_0142 =
      ep_Q2_074_partial_21_0134 := by
  native_decide

/-- Coefficient term 135 from coefficient polynomial 21. -/
def ep_Q2_074_coefficient_21_0135 : Poly :=
[
  term ((-9924 : Rat) / 769) [(5, 2), (16, 1)]
]

/-- Partial product 135 for generator 21. -/
def ep_Q2_074_partial_21_0135 : Poly :=
[
  term ((19848 : Rat) / 769) [(0, 1), (5, 2), (10, 1), (16, 1)],
  term ((-9924 : Rat) / 769) [(0, 2), (5, 2), (16, 1)],
  term ((19848 : Rat) / 769) [(1, 1), (5, 2), (11, 1), (16, 1)],
  term ((-9924 : Rat) / 769) [(1, 2), (5, 2), (16, 1)],
  term ((-19848 : Rat) / 769) [(5, 2), (10, 1), (16, 1)],
  term ((9924 : Rat) / 769) [(5, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 135 for generator 21. -/
theorem ep_Q2_074_partial_21_0135_valid :
    mulPoly ep_Q2_074_coefficient_21_0135
        ep_Q2_074_generator_21_0100_0142 =
      ep_Q2_074_partial_21_0135 := by
  native_decide

/-- Coefficient term 136 from coefficient polynomial 21. -/
def ep_Q2_074_coefficient_21_0136 : Poly :=
[
  term ((27288 : Rat) / 769) [(10, 1), (12, 1), (16, 1)]
]

/-- Partial product 136 for generator 21. -/
def ep_Q2_074_partial_21_0136 : Poly :=
[
  term ((-54576 : Rat) / 769) [(0, 1), (10, 2), (12, 1), (16, 1)],
  term ((27288 : Rat) / 769) [(0, 2), (10, 1), (12, 1), (16, 1)],
  term ((-54576 : Rat) / 769) [(1, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((27288 : Rat) / 769) [(1, 2), (10, 1), (12, 1), (16, 1)],
  term ((-27288 : Rat) / 769) [(10, 1), (12, 1), (16, 1)],
  term ((54576 : Rat) / 769) [(10, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 136 for generator 21. -/
theorem ep_Q2_074_partial_21_0136_valid :
    mulPoly ep_Q2_074_coefficient_21_0136
        ep_Q2_074_generator_21_0100_0142 =
      ep_Q2_074_partial_21_0136 := by
  native_decide

/-- Coefficient term 137 from coefficient polynomial 21. -/
def ep_Q2_074_coefficient_21_0137 : Poly :=
[
  term ((54576 : Rat) / 769) [(10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 137 for generator 21. -/
def ep_Q2_074_partial_21_0137 : Poly :=
[
  term ((-109152 : Rat) / 769) [(0, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((54576 : Rat) / 769) [(0, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-109152 : Rat) / 769) [(1, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((54576 : Rat) / 769) [(1, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-54576 : Rat) / 769) [(10, 1), (13, 1), (15, 1), (16, 1)],
  term ((109152 : Rat) / 769) [(10, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 137 for generator 21. -/
theorem ep_Q2_074_partial_21_0137_valid :
    mulPoly ep_Q2_074_coefficient_21_0137
        ep_Q2_074_generator_21_0100_0142 =
      ep_Q2_074_partial_21_0137 := by
  native_decide

/-- Coefficient term 138 from coefficient polynomial 21. -/
def ep_Q2_074_coefficient_21_0138 : Poly :=
[
  term ((-27288 : Rat) / 769) [(10, 1), (16, 1)]
]

/-- Partial product 138 for generator 21. -/
def ep_Q2_074_partial_21_0138 : Poly :=
[
  term ((54576 : Rat) / 769) [(0, 1), (10, 2), (16, 1)],
  term ((-27288 : Rat) / 769) [(0, 2), (10, 1), (16, 1)],
  term ((54576 : Rat) / 769) [(1, 1), (10, 1), (11, 1), (16, 1)],
  term ((-27288 : Rat) / 769) [(1, 2), (10, 1), (16, 1)],
  term ((27288 : Rat) / 769) [(10, 1), (16, 1)],
  term ((-54576 : Rat) / 769) [(10, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 138 for generator 21. -/
theorem ep_Q2_074_partial_21_0138_valid :
    mulPoly ep_Q2_074_coefficient_21_0138
        ep_Q2_074_generator_21_0100_0142 =
      ep_Q2_074_partial_21_0138 := by
  native_decide

/-- Coefficient term 139 from coefficient polynomial 21. -/
def ep_Q2_074_coefficient_21_0139 : Poly :=
[
  term ((-37002 : Rat) / 769) [(12, 1), (16, 1)]
]

/-- Partial product 139 for generator 21. -/
def ep_Q2_074_partial_21_0139 : Poly :=
[
  term ((74004 : Rat) / 769) [(0, 1), (10, 1), (12, 1), (16, 1)],
  term ((-37002 : Rat) / 769) [(0, 2), (12, 1), (16, 1)],
  term ((74004 : Rat) / 769) [(1, 1), (11, 1), (12, 1), (16, 1)],
  term ((-37002 : Rat) / 769) [(1, 2), (12, 1), (16, 1)],
  term ((-74004 : Rat) / 769) [(10, 1), (12, 1), (16, 1)],
  term ((37002 : Rat) / 769) [(12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 139 for generator 21. -/
theorem ep_Q2_074_partial_21_0139_valid :
    mulPoly ep_Q2_074_coefficient_21_0139
        ep_Q2_074_generator_21_0100_0142 =
      ep_Q2_074_partial_21_0139 := by
  native_decide

/-- Coefficient term 140 from coefficient polynomial 21. -/
def ep_Q2_074_coefficient_21_0140 : Poly :=
[
  term ((-74004 : Rat) / 769) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 140 for generator 21. -/
def ep_Q2_074_partial_21_0140 : Poly :=
[
  term ((148008 : Rat) / 769) [(0, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-74004 : Rat) / 769) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((148008 : Rat) / 769) [(1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-74004 : Rat) / 769) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((-148008 : Rat) / 769) [(10, 1), (13, 1), (15, 1), (16, 1)],
  term ((74004 : Rat) / 769) [(13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 140 for generator 21. -/
theorem ep_Q2_074_partial_21_0140_valid :
    mulPoly ep_Q2_074_coefficient_21_0140
        ep_Q2_074_generator_21_0100_0142 =
      ep_Q2_074_partial_21_0140 := by
  native_decide

/-- Coefficient term 141 from coefficient polynomial 21. -/
def ep_Q2_074_coefficient_21_0141 : Poly :=
[
  term ((-3204 : Rat) / 769) [(15, 2), (16, 1)]
]

/-- Partial product 141 for generator 21. -/
def ep_Q2_074_partial_21_0141 : Poly :=
[
  term ((6408 : Rat) / 769) [(0, 1), (10, 1), (15, 2), (16, 1)],
  term ((-3204 : Rat) / 769) [(0, 2), (15, 2), (16, 1)],
  term ((6408 : Rat) / 769) [(1, 1), (11, 1), (15, 2), (16, 1)],
  term ((-3204 : Rat) / 769) [(1, 2), (15, 2), (16, 1)],
  term ((-6408 : Rat) / 769) [(10, 1), (15, 2), (16, 1)],
  term ((3204 : Rat) / 769) [(15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 141 for generator 21. -/
theorem ep_Q2_074_partial_21_0141_valid :
    mulPoly ep_Q2_074_coefficient_21_0141
        ep_Q2_074_generator_21_0100_0142 =
      ep_Q2_074_partial_21_0141 := by
  native_decide

/-- Coefficient term 142 from coefficient polynomial 21. -/
def ep_Q2_074_coefficient_21_0142 : Poly :=
[
  term ((36201 : Rat) / 769) [(16, 1)]
]

/-- Partial product 142 for generator 21. -/
def ep_Q2_074_partial_21_0142 : Poly :=
[
  term ((-72402 : Rat) / 769) [(0, 1), (10, 1), (16, 1)],
  term ((36201 : Rat) / 769) [(0, 2), (16, 1)],
  term ((-72402 : Rat) / 769) [(1, 1), (11, 1), (16, 1)],
  term ((36201 : Rat) / 769) [(1, 2), (16, 1)],
  term ((72402 : Rat) / 769) [(10, 1), (16, 1)],
  term ((-36201 : Rat) / 769) [(16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 142 for generator 21. -/
theorem ep_Q2_074_partial_21_0142_valid :
    mulPoly ep_Q2_074_coefficient_21_0142
        ep_Q2_074_generator_21_0100_0142 =
      ep_Q2_074_partial_21_0142 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_074_partials_21_0100_0142 : List Poly :=
[
  ep_Q2_074_partial_21_0100,
  ep_Q2_074_partial_21_0101,
  ep_Q2_074_partial_21_0102,
  ep_Q2_074_partial_21_0103,
  ep_Q2_074_partial_21_0104,
  ep_Q2_074_partial_21_0105,
  ep_Q2_074_partial_21_0106,
  ep_Q2_074_partial_21_0107,
  ep_Q2_074_partial_21_0108,
  ep_Q2_074_partial_21_0109,
  ep_Q2_074_partial_21_0110,
  ep_Q2_074_partial_21_0111,
  ep_Q2_074_partial_21_0112,
  ep_Q2_074_partial_21_0113,
  ep_Q2_074_partial_21_0114,
  ep_Q2_074_partial_21_0115,
  ep_Q2_074_partial_21_0116,
  ep_Q2_074_partial_21_0117,
  ep_Q2_074_partial_21_0118,
  ep_Q2_074_partial_21_0119,
  ep_Q2_074_partial_21_0120,
  ep_Q2_074_partial_21_0121,
  ep_Q2_074_partial_21_0122,
  ep_Q2_074_partial_21_0123,
  ep_Q2_074_partial_21_0124,
  ep_Q2_074_partial_21_0125,
  ep_Q2_074_partial_21_0126,
  ep_Q2_074_partial_21_0127,
  ep_Q2_074_partial_21_0128,
  ep_Q2_074_partial_21_0129,
  ep_Q2_074_partial_21_0130,
  ep_Q2_074_partial_21_0131,
  ep_Q2_074_partial_21_0132,
  ep_Q2_074_partial_21_0133,
  ep_Q2_074_partial_21_0134,
  ep_Q2_074_partial_21_0135,
  ep_Q2_074_partial_21_0136,
  ep_Q2_074_partial_21_0137,
  ep_Q2_074_partial_21_0138,
  ep_Q2_074_partial_21_0139,
  ep_Q2_074_partial_21_0140,
  ep_Q2_074_partial_21_0141,
  ep_Q2_074_partial_21_0142
]

/-- Sum of partial products in this block. -/
def ep_Q2_074_block_21_0100_0142 : Poly :=
[
  term ((14760 : Rat) / 769) [(0, 1), (1, 3), (3, 1), (10, 1), (16, 1)],
  term ((29520 : Rat) / 769) [(0, 1), (1, 3), (4, 1), (5, 1), (10, 1), (16, 1)],
  term ((-19680 : Rat) / 769) [(0, 1), (1, 3), (5, 1), (10, 1), (16, 1)],
  term ((-264 : Rat) / 769) [(0, 1), (1, 3), (7, 1), (10, 1), (16, 1)],
  term ((264 : Rat) / 769) [(0, 1), (1, 3), (10, 1), (11, 1), (16, 1)],
  term ((-59040 : Rat) / 769) [(0, 1), (1, 4), (2, 1), (10, 1), (16, 1)],
  term ((29520 : Rat) / 769) [(0, 1), (1, 4), (4, 1), (10, 1), (16, 1)],
  term ((59040 : Rat) / 769) [(0, 1), (1, 4), (10, 1), (16, 1)],
  term ((-59040 : Rat) / 769) [(0, 1), (1, 4), (10, 2), (16, 1)],
  term ((1728 : Rat) / 769) [(0, 1), (2, 1), (3, 1), (5, 1), (10, 1), (16, 1)],
  term ((9138 : Rat) / 769) [(0, 1), (2, 1), (4, 1), (10, 1), (16, 1)],
  term ((88824 : Rat) / 769) [(0, 1), (2, 1), (4, 1), (10, 2), (16, 1)],
  term ((-27132 : Rat) / 769) [(0, 1), (2, 1), (4, 2), (10, 1), (16, 1)],
  term ((88824 : Rat) / 769) [(0, 1), (2, 1), (5, 1), (10, 1), (11, 1), (16, 1)],
  term ((-45276 : Rat) / 769) [(0, 1), (2, 1), (5, 2), (10, 1), (16, 1)],
  term ((-80940 : Rat) / 769) [(0, 1), (2, 1), (10, 1), (12, 1), (16, 1)],
  term ((-161880 : Rat) / 769) [(0, 1), (2, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((80940 : Rat) / 769) [(0, 1), (2, 1), (10, 1), (16, 1)],
  term ((1728 : Rat) / 769) [(0, 1), (2, 2), (4, 1), (10, 1), (16, 1)],
  term ((18144 : Rat) / 769) [(0, 1), (3, 1), (4, 1), (5, 1), (10, 1), (16, 1)],
  term ((9138 : Rat) / 769) [(0, 1), (3, 1), (5, 1), (10, 1), (16, 1)],
  term ((-42942 : Rat) / 769) [(0, 1), (4, 1), (5, 1), (10, 1), (11, 1), (16, 1)],
  term ((12399 : Rat) / 769) [(0, 1), (4, 1), (5, 2), (10, 1), (16, 1)],
  term ((36333 : Rat) / 769) [(0, 1), (4, 1), (10, 1), (12, 1), (16, 1)],
  term ((72918 : Rat) / 769) [(0, 1), (4, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((20754 : Rat) / 769) [(0, 1), (4, 1), (10, 1), (15, 2), (16, 1)],
  term ((-62163 : Rat) / 1538) [(0, 1), (4, 1), (10, 1), (16, 1)],
  term ((-93762 : Rat) / 769) [(0, 1), (4, 1), (10, 2), (16, 1)],
  term ((44928 : Rat) / 769) [(0, 1), (4, 1), (10, 3), (16, 1)],
  term ((42312 : Rat) / 769) [(0, 1), (4, 2), (10, 1), (16, 1)],
  term ((-65406 : Rat) / 769) [(0, 1), (4, 2), (10, 2), (16, 1)],
  term ((12399 : Rat) / 769) [(0, 1), (4, 3), (10, 1), (16, 1)],
  term ((-93762 : Rat) / 769) [(0, 1), (5, 1), (10, 1), (11, 1), (16, 1)],
  term ((44928 : Rat) / 769) [(0, 1), (5, 1), (10, 2), (11, 1), (16, 1)],
  term ((19848 : Rat) / 769) [(0, 1), (5, 2), (10, 1), (16, 1)],
  term ((-22464 : Rat) / 769) [(0, 1), (5, 2), (10, 2), (16, 1)],
  term ((74004 : Rat) / 769) [(0, 1), (10, 1), (12, 1), (16, 1)],
  term ((148008 : Rat) / 769) [(0, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((6408 : Rat) / 769) [(0, 1), (10, 1), (15, 2), (16, 1)],
  term ((-72402 : Rat) / 769) [(0, 1), (10, 1), (16, 1)],
  term ((-54576 : Rat) / 769) [(0, 1), (10, 2), (12, 1), (16, 1)],
  term ((-109152 : Rat) / 769) [(0, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((54576 : Rat) / 769) [(0, 1), (10, 2), (16, 1)],
  term ((-7380 : Rat) / 769) [(0, 2), (1, 3), (3, 1), (16, 1)],
  term ((-14760 : Rat) / 769) [(0, 2), (1, 3), (4, 1), (5, 1), (16, 1)],
  term ((9840 : Rat) / 769) [(0, 2), (1, 3), (5, 1), (16, 1)],
  term ((132 : Rat) / 769) [(0, 2), (1, 3), (7, 1), (16, 1)],
  term ((-132 : Rat) / 769) [(0, 2), (1, 3), (11, 1), (16, 1)],
  term ((29520 : Rat) / 769) [(0, 2), (1, 4), (2, 1), (16, 1)],
  term ((-14760 : Rat) / 769) [(0, 2), (1, 4), (4, 1), (16, 1)],
  term ((29520 : Rat) / 769) [(0, 2), (1, 4), (10, 1), (16, 1)],
  term ((-29520 : Rat) / 769) [(0, 2), (1, 4), (16, 1)],
  term ((-864 : Rat) / 769) [(0, 2), (2, 1), (3, 1), (5, 1), (16, 1)],
  term ((-44412 : Rat) / 769) [(0, 2), (2, 1), (4, 1), (10, 1), (16, 1)],
  term ((-4569 : Rat) / 769) [(0, 2), (2, 1), (4, 1), (16, 1)],
  term ((13566 : Rat) / 769) [(0, 2), (2, 1), (4, 2), (16, 1)],
  term ((-44412 : Rat) / 769) [(0, 2), (2, 1), (5, 1), (11, 1), (16, 1)],
  term ((22638 : Rat) / 769) [(0, 2), (2, 1), (5, 2), (16, 1)],
  term ((40470 : Rat) / 769) [(0, 2), (2, 1), (12, 1), (16, 1)],
  term ((80940 : Rat) / 769) [(0, 2), (2, 1), (13, 1), (15, 1), (16, 1)],
  term ((-40470 : Rat) / 769) [(0, 2), (2, 1), (16, 1)],
  term ((-864 : Rat) / 769) [(0, 2), (2, 2), (4, 1), (16, 1)],
  term ((-9072 : Rat) / 769) [(0, 2), (3, 1), (4, 1), (5, 1), (16, 1)],
  term ((-4569 : Rat) / 769) [(0, 2), (3, 1), (5, 1), (16, 1)],
  term ((21471 : Rat) / 769) [(0, 2), (4, 1), (5, 1), (11, 1), (16, 1)],
  term ((-12399 : Rat) / 1538) [(0, 2), (4, 1), (5, 2), (16, 1)],
  term ((46881 : Rat) / 769) [(0, 2), (4, 1), (10, 1), (16, 1)],
  term ((-22464 : Rat) / 769) [(0, 2), (4, 1), (10, 2), (16, 1)],
  term ((-36333 : Rat) / 1538) [(0, 2), (4, 1), (12, 1), (16, 1)],
  term ((-36459 : Rat) / 769) [(0, 2), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-10377 : Rat) / 769) [(0, 2), (4, 1), (15, 2), (16, 1)],
  term ((62163 : Rat) / 3076) [(0, 2), (4, 1), (16, 1)],
  term ((32703 : Rat) / 769) [(0, 2), (4, 2), (10, 1), (16, 1)],
  term ((-21156 : Rat) / 769) [(0, 2), (4, 2), (16, 1)],
  term ((-12399 : Rat) / 1538) [(0, 2), (4, 3), (16, 1)],
  term ((-22464 : Rat) / 769) [(0, 2), (5, 1), (10, 1), (11, 1), (16, 1)],
  term ((46881 : Rat) / 769) [(0, 2), (5, 1), (11, 1), (16, 1)],
  term ((11232 : Rat) / 769) [(0, 2), (5, 2), (10, 1), (16, 1)],
  term ((-9924 : Rat) / 769) [(0, 2), (5, 2), (16, 1)],
  term ((27288 : Rat) / 769) [(0, 2), (10, 1), (12, 1), (16, 1)],
  term ((54576 : Rat) / 769) [(0, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-27288 : Rat) / 769) [(0, 2), (10, 1), (16, 1)],
  term ((-37002 : Rat) / 769) [(0, 2), (12, 1), (16, 1)],
  term ((-74004 : Rat) / 769) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((-3204 : Rat) / 769) [(0, 2), (15, 2), (16, 1)],
  term ((36201 : Rat) / 769) [(0, 2), (16, 1)],
  term ((1728 : Rat) / 769) [(1, 1), (2, 1), (3, 1), (5, 1), (11, 1), (16, 1)],
  term ((88824 : Rat) / 769) [(1, 1), (2, 1), (4, 1), (10, 1), (11, 1), (16, 1)],
  term ((9138 : Rat) / 769) [(1, 1), (2, 1), (4, 1), (11, 1), (16, 1)],
  term ((-27132 : Rat) / 769) [(1, 1), (2, 1), (4, 2), (11, 1), (16, 1)],
  term ((88824 : Rat) / 769) [(1, 1), (2, 1), (5, 1), (11, 2), (16, 1)],
  term ((-45276 : Rat) / 769) [(1, 1), (2, 1), (5, 2), (11, 1), (16, 1)],
  term ((-80940 : Rat) / 769) [(1, 1), (2, 1), (11, 1), (12, 1), (16, 1)],
  term ((-161880 : Rat) / 769) [(1, 1), (2, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((80940 : Rat) / 769) [(1, 1), (2, 1), (11, 1), (16, 1)],
  term ((1728 : Rat) / 769) [(1, 1), (2, 2), (4, 1), (11, 1), (16, 1)],
  term ((18144 : Rat) / 769) [(1, 1), (3, 1), (4, 1), (5, 1), (11, 1), (16, 1)],
  term ((9138 : Rat) / 769) [(1, 1), (3, 1), (5, 1), (11, 1), (16, 1)],
  term ((-42942 : Rat) / 769) [(1, 1), (4, 1), (5, 1), (11, 2), (16, 1)],
  term ((12399 : Rat) / 769) [(1, 1), (4, 1), (5, 2), (11, 1), (16, 1)],
  term ((-93762 : Rat) / 769) [(1, 1), (4, 1), (10, 1), (11, 1), (16, 1)],
  term ((44928 : Rat) / 769) [(1, 1), (4, 1), (10, 2), (11, 1), (16, 1)],
  term ((36333 : Rat) / 769) [(1, 1), (4, 1), (11, 1), (12, 1), (16, 1)],
  term ((72918 : Rat) / 769) [(1, 1), (4, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((20754 : Rat) / 769) [(1, 1), (4, 1), (11, 1), (15, 2), (16, 1)],
  term ((-62163 : Rat) / 1538) [(1, 1), (4, 1), (11, 1), (16, 1)],
  term ((-65406 : Rat) / 769) [(1, 1), (4, 2), (10, 1), (11, 1), (16, 1)],
  term ((42312 : Rat) / 769) [(1, 1), (4, 2), (11, 1), (16, 1)],
  term ((12399 : Rat) / 769) [(1, 1), (4, 3), (11, 1), (16, 1)],
  term ((44928 : Rat) / 769) [(1, 1), (5, 1), (10, 1), (11, 2), (16, 1)],
  term ((-93762 : Rat) / 769) [(1, 1), (5, 1), (11, 2), (16, 1)],
  term ((-22464 : Rat) / 769) [(1, 1), (5, 2), (10, 1), (11, 1), (16, 1)],
  term ((19848 : Rat) / 769) [(1, 1), (5, 2), (11, 1), (16, 1)],
  term ((-54576 : Rat) / 769) [(1, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((-109152 : Rat) / 769) [(1, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((54576 : Rat) / 769) [(1, 1), (10, 1), (11, 1), (16, 1)],
  term ((74004 : Rat) / 769) [(1, 1), (11, 1), (12, 1), (16, 1)],
  term ((148008 : Rat) / 769) [(1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((6408 : Rat) / 769) [(1, 1), (11, 1), (15, 2), (16, 1)],
  term ((-72402 : Rat) / 769) [(1, 1), (11, 1), (16, 1)],
  term ((-864 : Rat) / 769) [(1, 2), (2, 1), (3, 1), (5, 1), (16, 1)],
  term ((-44412 : Rat) / 769) [(1, 2), (2, 1), (4, 1), (10, 1), (16, 1)],
  term ((-4569 : Rat) / 769) [(1, 2), (2, 1), (4, 1), (16, 1)],
  term ((13566 : Rat) / 769) [(1, 2), (2, 1), (4, 2), (16, 1)],
  term ((-44412 : Rat) / 769) [(1, 2), (2, 1), (5, 1), (11, 1), (16, 1)],
  term ((22638 : Rat) / 769) [(1, 2), (2, 1), (5, 2), (16, 1)],
  term ((40470 : Rat) / 769) [(1, 2), (2, 1), (12, 1), (16, 1)],
  term ((80940 : Rat) / 769) [(1, 2), (2, 1), (13, 1), (15, 1), (16, 1)],
  term ((-40470 : Rat) / 769) [(1, 2), (2, 1), (16, 1)],
  term ((-864 : Rat) / 769) [(1, 2), (2, 2), (4, 1), (16, 1)],
  term ((-9072 : Rat) / 769) [(1, 2), (3, 1), (4, 1), (5, 1), (16, 1)],
  term ((-4569 : Rat) / 769) [(1, 2), (3, 1), (5, 1), (16, 1)],
  term ((21471 : Rat) / 769) [(1, 2), (4, 1), (5, 1), (11, 1), (16, 1)],
  term ((-12399 : Rat) / 1538) [(1, 2), (4, 1), (5, 2), (16, 1)],
  term ((46881 : Rat) / 769) [(1, 2), (4, 1), (10, 1), (16, 1)],
  term ((-22464 : Rat) / 769) [(1, 2), (4, 1), (10, 2), (16, 1)],
  term ((-36333 : Rat) / 1538) [(1, 2), (4, 1), (12, 1), (16, 1)],
  term ((-36459 : Rat) / 769) [(1, 2), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-10377 : Rat) / 769) [(1, 2), (4, 1), (15, 2), (16, 1)],
  term ((62163 : Rat) / 3076) [(1, 2), (4, 1), (16, 1)],
  term ((32703 : Rat) / 769) [(1, 2), (4, 2), (10, 1), (16, 1)],
  term ((-21156 : Rat) / 769) [(1, 2), (4, 2), (16, 1)],
  term ((-12399 : Rat) / 1538) [(1, 2), (4, 3), (16, 1)],
  term ((-22464 : Rat) / 769) [(1, 2), (5, 1), (10, 1), (11, 1), (16, 1)],
  term ((46881 : Rat) / 769) [(1, 2), (5, 1), (11, 1), (16, 1)],
  term ((11232 : Rat) / 769) [(1, 2), (5, 2), (10, 1), (16, 1)],
  term ((-9924 : Rat) / 769) [(1, 2), (5, 2), (16, 1)],
  term ((27288 : Rat) / 769) [(1, 2), (10, 1), (12, 1), (16, 1)],
  term ((54576 : Rat) / 769) [(1, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-27288 : Rat) / 769) [(1, 2), (10, 1), (16, 1)],
  term ((-37002 : Rat) / 769) [(1, 2), (12, 1), (16, 1)],
  term ((-74004 : Rat) / 769) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((-3204 : Rat) / 769) [(1, 2), (15, 2), (16, 1)],
  term ((36201 : Rat) / 769) [(1, 2), (16, 1)],
  term ((-14760 : Rat) / 769) [(1, 3), (3, 1), (10, 1), (16, 1)],
  term ((7380 : Rat) / 769) [(1, 3), (3, 1), (16, 1)],
  term ((-29520 : Rat) / 769) [(1, 3), (4, 1), (5, 1), (10, 1), (16, 1)],
  term ((14760 : Rat) / 769) [(1, 3), (4, 1), (5, 1), (16, 1)],
  term ((19680 : Rat) / 769) [(1, 3), (5, 1), (10, 1), (16, 1)],
  term ((-9840 : Rat) / 769) [(1, 3), (5, 1), (16, 1)],
  term ((264 : Rat) / 769) [(1, 3), (7, 1), (10, 1), (16, 1)],
  term ((-132 : Rat) / 769) [(1, 3), (7, 1), (16, 1)],
  term ((-264 : Rat) / 769) [(1, 3), (10, 1), (11, 1), (16, 1)],
  term ((132 : Rat) / 769) [(1, 3), (11, 1), (16, 1)],
  term ((59040 : Rat) / 769) [(1, 4), (2, 1), (10, 1), (16, 1)],
  term ((-29520 : Rat) / 769) [(1, 4), (2, 1), (16, 1)],
  term ((14760 : Rat) / 769) [(1, 4), (3, 1), (11, 1), (16, 1)],
  term ((29520 : Rat) / 769) [(1, 4), (4, 1), (5, 1), (11, 1), (16, 1)],
  term ((-29520 : Rat) / 769) [(1, 4), (4, 1), (10, 1), (16, 1)],
  term ((14760 : Rat) / 769) [(1, 4), (4, 1), (16, 1)],
  term ((-19680 : Rat) / 769) [(1, 4), (5, 1), (11, 1), (16, 1)],
  term ((-264 : Rat) / 769) [(1, 4), (7, 1), (11, 1), (16, 1)],
  term ((-88560 : Rat) / 769) [(1, 4), (10, 1), (16, 1)],
  term ((59040 : Rat) / 769) [(1, 4), (10, 2), (16, 1)],
  term ((264 : Rat) / 769) [(1, 4), (11, 2), (16, 1)],
  term ((29520 : Rat) / 769) [(1, 4), (16, 1)],
  term ((-59040 : Rat) / 769) [(1, 5), (2, 1), (11, 1), (16, 1)],
  term ((-7380 : Rat) / 769) [(1, 5), (3, 1), (16, 1)],
  term ((-14760 : Rat) / 769) [(1, 5), (4, 1), (5, 1), (16, 1)],
  term ((29520 : Rat) / 769) [(1, 5), (4, 1), (11, 1), (16, 1)],
  term ((9840 : Rat) / 769) [(1, 5), (5, 1), (16, 1)],
  term ((132 : Rat) / 769) [(1, 5), (7, 1), (16, 1)],
  term ((-59040 : Rat) / 769) [(1, 5), (10, 1), (11, 1), (16, 1)],
  term ((58908 : Rat) / 769) [(1, 5), (11, 1), (16, 1)],
  term ((29520 : Rat) / 769) [(1, 6), (2, 1), (16, 1)],
  term ((-14760 : Rat) / 769) [(1, 6), (4, 1), (16, 1)],
  term ((29520 : Rat) / 769) [(1, 6), (10, 1), (16, 1)],
  term ((-29520 : Rat) / 769) [(1, 6), (16, 1)],
  term ((-1728 : Rat) / 769) [(2, 1), (3, 1), (5, 1), (10, 1), (16, 1)],
  term ((864 : Rat) / 769) [(2, 1), (3, 1), (5, 1), (16, 1)],
  term ((35274 : Rat) / 769) [(2, 1), (4, 1), (10, 1), (16, 1)],
  term ((-88824 : Rat) / 769) [(2, 1), (4, 1), (10, 2), (16, 1)],
  term ((4569 : Rat) / 769) [(2, 1), (4, 1), (16, 1)],
  term ((27132 : Rat) / 769) [(2, 1), (4, 2), (10, 1), (16, 1)],
  term ((-13566 : Rat) / 769) [(2, 1), (4, 2), (16, 1)],
  term ((-88824 : Rat) / 769) [(2, 1), (5, 1), (10, 1), (11, 1), (16, 1)],
  term ((44412 : Rat) / 769) [(2, 1), (5, 1), (11, 1), (16, 1)],
  term ((45276 : Rat) / 769) [(2, 1), (5, 2), (10, 1), (16, 1)],
  term ((-22638 : Rat) / 769) [(2, 1), (5, 2), (16, 1)],
  term ((80940 : Rat) / 769) [(2, 1), (10, 1), (12, 1), (16, 1)],
  term ((161880 : Rat) / 769) [(2, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-80940 : Rat) / 769) [(2, 1), (10, 1), (16, 1)],
  term ((-40470 : Rat) / 769) [(2, 1), (12, 1), (16, 1)],
  term ((-80940 : Rat) / 769) [(2, 1), (13, 1), (15, 1), (16, 1)],
  term ((40470 : Rat) / 769) [(2, 1), (16, 1)],
  term ((-1728 : Rat) / 769) [(2, 2), (4, 1), (10, 1), (16, 1)],
  term ((864 : Rat) / 769) [(2, 2), (4, 1), (16, 1)],
  term ((-18144 : Rat) / 769) [(3, 1), (4, 1), (5, 1), (10, 1), (16, 1)],
  term ((9072 : Rat) / 769) [(3, 1), (4, 1), (5, 1), (16, 1)],
  term ((-9138 : Rat) / 769) [(3, 1), (5, 1), (10, 1), (16, 1)],
  term ((4569 : Rat) / 769) [(3, 1), (5, 1), (16, 1)],
  term ((42942 : Rat) / 769) [(4, 1), (5, 1), (10, 1), (11, 1), (16, 1)],
  term ((-21471 : Rat) / 769) [(4, 1), (5, 1), (11, 1), (16, 1)],
  term ((-12399 : Rat) / 769) [(4, 1), (5, 2), (10, 1), (16, 1)],
  term ((12399 : Rat) / 1538) [(4, 1), (5, 2), (16, 1)],
  term ((-36333 : Rat) / 769) [(4, 1), (10, 1), (12, 1), (16, 1)],
  term ((-72918 : Rat) / 769) [(4, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-20754 : Rat) / 769) [(4, 1), (10, 1), (15, 2), (16, 1)],
  term ((-31599 : Rat) / 1538) [(4, 1), (10, 1), (16, 1)],
  term ((116226 : Rat) / 769) [(4, 1), (10, 2), (16, 1)],
  term ((-44928 : Rat) / 769) [(4, 1), (10, 3), (16, 1)],
  term ((36333 : Rat) / 1538) [(4, 1), (12, 1), (16, 1)],
  term ((36459 : Rat) / 769) [(4, 1), (13, 1), (15, 1), (16, 1)],
  term ((10377 : Rat) / 769) [(4, 1), (15, 2), (16, 1)],
  term ((-62163 : Rat) / 3076) [(4, 1), (16, 1)],
  term ((-75015 : Rat) / 769) [(4, 2), (10, 1), (16, 1)],
  term ((65406 : Rat) / 769) [(4, 2), (10, 2), (16, 1)],
  term ((21156 : Rat) / 769) [(4, 2), (16, 1)],
  term ((-12399 : Rat) / 769) [(4, 3), (10, 1), (16, 1)],
  term ((12399 : Rat) / 1538) [(4, 3), (16, 1)],
  term ((116226 : Rat) / 769) [(5, 1), (10, 1), (11, 1), (16, 1)],
  term ((-44928 : Rat) / 769) [(5, 1), (10, 2), (11, 1), (16, 1)],
  term ((-46881 : Rat) / 769) [(5, 1), (11, 1), (16, 1)],
  term ((-31080 : Rat) / 769) [(5, 2), (10, 1), (16, 1)],
  term ((22464 : Rat) / 769) [(5, 2), (10, 2), (16, 1)],
  term ((9924 : Rat) / 769) [(5, 2), (16, 1)],
  term ((-101292 : Rat) / 769) [(10, 1), (12, 1), (16, 1)],
  term ((-202584 : Rat) / 769) [(10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-6408 : Rat) / 769) [(10, 1), (15, 2), (16, 1)],
  term ((99690 : Rat) / 769) [(10, 1), (16, 1)],
  term ((54576 : Rat) / 769) [(10, 2), (12, 1), (16, 1)],
  term ((109152 : Rat) / 769) [(10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-54576 : Rat) / 769) [(10, 2), (16, 1)],
  term ((37002 : Rat) / 769) [(12, 1), (16, 1)],
  term ((74004 : Rat) / 769) [(13, 1), (15, 1), (16, 1)],
  term ((3204 : Rat) / 769) [(15, 2), (16, 1)],
  term ((-36201 : Rat) / 769) [(16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 21, terms 100 through 142. -/
theorem ep_Q2_074_block_21_0100_0142_valid :
    checkProductSumEq ep_Q2_074_partials_21_0100_0142
      ep_Q2_074_block_21_0100_0142 = true := by
  native_decide

end EpQ2074TermShards

end Patterns

end EndpointCertificate

end Problem97
