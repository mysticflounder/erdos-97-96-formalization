/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R010:u=v:R010NYN, term block 9:100-132

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R010UeqvR010NYNTermShards

/-- Generator polynomial 9 for relaxed split surplus certificate `R010:u=v:R010NYN`. -/
def rs_R010_ueqv_R010NYN_generator_09_0100_0132 : Poly :=
[
  term (1 : Rat) [],
  term (-2 : Rat) [(0, 1)],
  term (2 : Rat) [(0, 1), (12, 1)],
  term (2 : Rat) [(1, 1), (13, 1)],
  term (-1 : Rat) [(12, 2)],
  term (-1 : Rat) [(13, 2)]
]

/-- Coefficient term 100 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYN_coefficient_09_0100 : Poly :=
[
  term ((-1212 : Rat) / 5) [(9, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 100 for generator 9. -/
def rs_R010_ueqv_R010NYN_partial_09_0100 : Poly :=
[
  term ((-2424 : Rat) / 5) [(0, 1), (9, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((2424 : Rat) / 5) [(0, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-2424 : Rat) / 5) [(1, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((1212 : Rat) / 5) [(9, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((1212 : Rat) / 5) [(9, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-1212 : Rat) / 5) [(9, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 9. -/
theorem rs_R010_ueqv_R010NYN_partial_09_0100_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_09_0100
        rs_R010_ueqv_R010NYN_generator_09_0100_0132 =
      rs_R010_ueqv_R010NYN_partial_09_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYN_coefficient_09_0101 : Poly :=
[
  term ((-321408 : Rat) / 2995) [(9, 1), (11, 2), (13, 1)]
]

/-- Partial product 101 for generator 9. -/
def rs_R010_ueqv_R010NYN_partial_09_0101 : Poly :=
[
  term ((-642816 : Rat) / 2995) [(0, 1), (9, 1), (11, 2), (12, 1), (13, 1)],
  term ((642816 : Rat) / 2995) [(0, 1), (9, 1), (11, 2), (13, 1)],
  term ((-642816 : Rat) / 2995) [(1, 1), (9, 1), (11, 2), (13, 2)],
  term ((321408 : Rat) / 2995) [(9, 1), (11, 2), (12, 2), (13, 1)],
  term ((-321408 : Rat) / 2995) [(9, 1), (11, 2), (13, 1)],
  term ((321408 : Rat) / 2995) [(9, 1), (11, 2), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 9. -/
theorem rs_R010_ueqv_R010NYN_partial_09_0101_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_09_0101
        rs_R010_ueqv_R010NYN_generator_09_0100_0132 =
      rs_R010_ueqv_R010NYN_partial_09_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYN_coefficient_09_0102 : Poly :=
[
  term ((-2121984 : Rat) / 599) [(9, 1), (11, 2), (15, 1)]
]

/-- Partial product 102 for generator 9. -/
def rs_R010_ueqv_R010NYN_partial_09_0102 : Poly :=
[
  term ((-4243968 : Rat) / 599) [(0, 1), (9, 1), (11, 2), (12, 1), (15, 1)],
  term ((4243968 : Rat) / 599) [(0, 1), (9, 1), (11, 2), (15, 1)],
  term ((-4243968 : Rat) / 599) [(1, 1), (9, 1), (11, 2), (13, 1), (15, 1)],
  term ((2121984 : Rat) / 599) [(9, 1), (11, 2), (12, 2), (15, 1)],
  term ((2121984 : Rat) / 599) [(9, 1), (11, 2), (13, 2), (15, 1)],
  term ((-2121984 : Rat) / 599) [(9, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 9. -/
theorem rs_R010_ueqv_R010NYN_partial_09_0102_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_09_0102
        rs_R010_ueqv_R010NYN_generator_09_0100_0132 =
      rs_R010_ueqv_R010NYN_partial_09_0102 := by
  native_decide

/-- Coefficient term 103 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYN_coefficient_09_0103 : Poly :=
[
  term ((1896 : Rat) / 5) [(9, 1), (11, 2), (15, 1), (16, 1)]
]

/-- Partial product 103 for generator 9. -/
def rs_R010_ueqv_R010NYN_partial_09_0103 : Poly :=
[
  term ((3792 : Rat) / 5) [(0, 1), (9, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-3792 : Rat) / 5) [(0, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((3792 : Rat) / 5) [(1, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1896 : Rat) / 5) [(9, 1), (11, 2), (12, 2), (15, 1), (16, 1)],
  term ((-1896 : Rat) / 5) [(9, 1), (11, 2), (13, 2), (15, 1), (16, 1)],
  term ((1896 : Rat) / 5) [(9, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 103 for generator 9. -/
theorem rs_R010_ueqv_R010NYN_partial_09_0103_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_09_0103
        rs_R010_ueqv_R010NYN_generator_09_0100_0132 =
      rs_R010_ueqv_R010NYN_partial_09_0103 := by
  native_decide

/-- Coefficient term 104 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYN_coefficient_09_0104 : Poly :=
[
  term ((5785344 : Rat) / 2995) [(9, 1), (11, 3)]
]

/-- Partial product 104 for generator 9. -/
def rs_R010_ueqv_R010NYN_partial_09_0104 : Poly :=
[
  term ((-11570688 : Rat) / 2995) [(0, 1), (9, 1), (11, 3)],
  term ((11570688 : Rat) / 2995) [(0, 1), (9, 1), (11, 3), (12, 1)],
  term ((11570688 : Rat) / 2995) [(1, 1), (9, 1), (11, 3), (13, 1)],
  term ((5785344 : Rat) / 2995) [(9, 1), (11, 3)],
  term ((-5785344 : Rat) / 2995) [(9, 1), (11, 3), (12, 2)],
  term ((-5785344 : Rat) / 2995) [(9, 1), (11, 3), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 104 for generator 9. -/
theorem rs_R010_ueqv_R010NYN_partial_09_0104_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_09_0104
        rs_R010_ueqv_R010NYN_generator_09_0100_0132 =
      rs_R010_ueqv_R010NYN_partial_09_0104 := by
  native_decide

/-- Coefficient term 105 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYN_coefficient_09_0105 : Poly :=
[
  term ((131328 : Rat) / 2995) [(9, 1), (13, 1), (15, 2)]
]

/-- Partial product 105 for generator 9. -/
def rs_R010_ueqv_R010NYN_partial_09_0105 : Poly :=
[
  term ((262656 : Rat) / 2995) [(0, 1), (9, 1), (12, 1), (13, 1), (15, 2)],
  term ((-262656 : Rat) / 2995) [(0, 1), (9, 1), (13, 1), (15, 2)],
  term ((262656 : Rat) / 2995) [(1, 1), (9, 1), (13, 2), (15, 2)],
  term ((-131328 : Rat) / 2995) [(9, 1), (12, 2), (13, 1), (15, 2)],
  term ((131328 : Rat) / 2995) [(9, 1), (13, 1), (15, 2)],
  term ((-131328 : Rat) / 2995) [(9, 1), (13, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 105 for generator 9. -/
theorem rs_R010_ueqv_R010NYN_partial_09_0105_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_09_0105
        rs_R010_ueqv_R010NYN_generator_09_0100_0132 =
      rs_R010_ueqv_R010NYN_partial_09_0105 := by
  native_decide

/-- Coefficient term 106 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYN_coefficient_09_0106 : Poly :=
[
  term ((16 : Rat) / 5) [(9, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 106 for generator 9. -/
def rs_R010_ueqv_R010NYN_partial_09_0106 : Poly :=
[
  term ((32 : Rat) / 5) [(0, 1), (9, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-32 : Rat) / 5) [(0, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((32 : Rat) / 5) [(1, 1), (9, 1), (13, 2), (15, 2), (16, 1)],
  term ((-16 : Rat) / 5) [(9, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((16 : Rat) / 5) [(9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-16 : Rat) / 5) [(9, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 106 for generator 9. -/
theorem rs_R010_ueqv_R010NYN_partial_09_0106_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_09_0106
        rs_R010_ueqv_R010NYN_generator_09_0100_0132 =
      rs_R010_ueqv_R010NYN_partial_09_0106 := by
  native_decide

/-- Coefficient term 107 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYN_coefficient_09_0107 : Poly :=
[
  term ((1124904 : Rat) / 2995) [(9, 1), (15, 1)]
]

/-- Partial product 107 for generator 9. -/
def rs_R010_ueqv_R010NYN_partial_09_0107 : Poly :=
[
  term ((2249808 : Rat) / 2995) [(0, 1), (9, 1), (12, 1), (15, 1)],
  term ((-2249808 : Rat) / 2995) [(0, 1), (9, 1), (15, 1)],
  term ((2249808 : Rat) / 2995) [(1, 1), (9, 1), (13, 1), (15, 1)],
  term ((-1124904 : Rat) / 2995) [(9, 1), (12, 2), (15, 1)],
  term ((-1124904 : Rat) / 2995) [(9, 1), (13, 2), (15, 1)],
  term ((1124904 : Rat) / 2995) [(9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 107 for generator 9. -/
theorem rs_R010_ueqv_R010NYN_partial_09_0107_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_09_0107
        rs_R010_ueqv_R010NYN_generator_09_0100_0132 =
      rs_R010_ueqv_R010NYN_partial_09_0107 := by
  native_decide

/-- Coefficient term 108 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYN_coefficient_09_0108 : Poly :=
[
  term ((-272 : Rat) / 5) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 108 for generator 9. -/
def rs_R010_ueqv_R010NYN_partial_09_0108 : Poly :=
[
  term ((-544 : Rat) / 5) [(0, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((544 : Rat) / 5) [(0, 1), (9, 1), (15, 1), (16, 1)],
  term ((-544 : Rat) / 5) [(1, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((272 : Rat) / 5) [(9, 1), (12, 2), (15, 1), (16, 1)],
  term ((272 : Rat) / 5) [(9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-272 : Rat) / 5) [(9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 108 for generator 9. -/
theorem rs_R010_ueqv_R010NYN_partial_09_0108_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_09_0108
        rs_R010_ueqv_R010NYN_generator_09_0100_0132 =
      rs_R010_ueqv_R010NYN_partial_09_0108 := by
  native_decide

/-- Coefficient term 109 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYN_coefficient_09_0109 : Poly :=
[
  term ((-262656 : Rat) / 2995) [(9, 1), (15, 3)]
]

/-- Partial product 109 for generator 9. -/
def rs_R010_ueqv_R010NYN_partial_09_0109 : Poly :=
[
  term ((-525312 : Rat) / 2995) [(0, 1), (9, 1), (12, 1), (15, 3)],
  term ((525312 : Rat) / 2995) [(0, 1), (9, 1), (15, 3)],
  term ((-525312 : Rat) / 2995) [(1, 1), (9, 1), (13, 1), (15, 3)],
  term ((262656 : Rat) / 2995) [(9, 1), (12, 2), (15, 3)],
  term ((262656 : Rat) / 2995) [(9, 1), (13, 2), (15, 3)],
  term ((-262656 : Rat) / 2995) [(9, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 109 for generator 9. -/
theorem rs_R010_ueqv_R010NYN_partial_09_0109_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_09_0109
        rs_R010_ueqv_R010NYN_generator_09_0100_0132 =
      rs_R010_ueqv_R010NYN_partial_09_0109 := by
  native_decide

/-- Coefficient term 110 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYN_coefficient_09_0110 : Poly :=
[
  term ((-32 : Rat) / 5) [(9, 1), (15, 3), (16, 1)]
]

/-- Partial product 110 for generator 9. -/
def rs_R010_ueqv_R010NYN_partial_09_0110 : Poly :=
[
  term ((-64 : Rat) / 5) [(0, 1), (9, 1), (12, 1), (15, 3), (16, 1)],
  term ((64 : Rat) / 5) [(0, 1), (9, 1), (15, 3), (16, 1)],
  term ((-64 : Rat) / 5) [(1, 1), (9, 1), (13, 1), (15, 3), (16, 1)],
  term ((32 : Rat) / 5) [(9, 1), (12, 2), (15, 3), (16, 1)],
  term ((32 : Rat) / 5) [(9, 1), (13, 2), (15, 3), (16, 1)],
  term ((-32 : Rat) / 5) [(9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 110 for generator 9. -/
theorem rs_R010_ueqv_R010NYN_partial_09_0110_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_09_0110
        rs_R010_ueqv_R010NYN_generator_09_0100_0132 =
      rs_R010_ueqv_R010NYN_partial_09_0110 := by
  native_decide

/-- Coefficient term 111 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYN_coefficient_09_0111 : Poly :=
[
  term ((-53568 : Rat) / 599) [(10, 1), (11, 1), (13, 1)]
]

/-- Partial product 111 for generator 9. -/
def rs_R010_ueqv_R010NYN_partial_09_0111 : Poly :=
[
  term ((-107136 : Rat) / 599) [(0, 1), (10, 1), (11, 1), (12, 1), (13, 1)],
  term ((107136 : Rat) / 599) [(0, 1), (10, 1), (11, 1), (13, 1)],
  term ((-107136 : Rat) / 599) [(1, 1), (10, 1), (11, 1), (13, 2)],
  term ((53568 : Rat) / 599) [(10, 1), (11, 1), (12, 2), (13, 1)],
  term ((-53568 : Rat) / 599) [(10, 1), (11, 1), (13, 1)],
  term ((53568 : Rat) / 599) [(10, 1), (11, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 111 for generator 9. -/
theorem rs_R010_ueqv_R010NYN_partial_09_0111_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_09_0111
        rs_R010_ueqv_R010NYN_generator_09_0100_0132 =
      rs_R010_ueqv_R010NYN_partial_09_0111 := by
  native_decide

/-- Coefficient term 112 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYN_coefficient_09_0112 : Poly :=
[
  term ((214272 : Rat) / 2995) [(10, 1), (11, 1), (15, 1)]
]

/-- Partial product 112 for generator 9. -/
def rs_R010_ueqv_R010NYN_partial_09_0112 : Poly :=
[
  term ((428544 : Rat) / 2995) [(0, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-428544 : Rat) / 2995) [(0, 1), (10, 1), (11, 1), (15, 1)],
  term ((428544 : Rat) / 2995) [(1, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((-214272 : Rat) / 2995) [(10, 1), (11, 1), (12, 2), (15, 1)],
  term ((-214272 : Rat) / 2995) [(10, 1), (11, 1), (13, 2), (15, 1)],
  term ((214272 : Rat) / 2995) [(10, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 112 for generator 9. -/
theorem rs_R010_ueqv_R010NYN_partial_09_0112_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_09_0112
        rs_R010_ueqv_R010NYN_generator_09_0100_0132 =
      rs_R010_ueqv_R010NYN_partial_09_0112 := by
  native_decide

/-- Coefficient term 113 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYN_coefficient_09_0113 : Poly :=
[
  term ((49632 : Rat) / 599) [(10, 1), (13, 1), (15, 1)]
]

/-- Partial product 113 for generator 9. -/
def rs_R010_ueqv_R010NYN_partial_09_0113 : Poly :=
[
  term ((99264 : Rat) / 599) [(0, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((-99264 : Rat) / 599) [(0, 1), (10, 1), (13, 1), (15, 1)],
  term ((99264 : Rat) / 599) [(1, 1), (10, 1), (13, 2), (15, 1)],
  term ((-49632 : Rat) / 599) [(10, 1), (12, 2), (13, 1), (15, 1)],
  term ((49632 : Rat) / 599) [(10, 1), (13, 1), (15, 1)],
  term ((-49632 : Rat) / 599) [(10, 1), (13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 113 for generator 9. -/
theorem rs_R010_ueqv_R010NYN_partial_09_0113_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_09_0113
        rs_R010_ueqv_R010NYN_generator_09_0100_0132 =
      rs_R010_ueqv_R010NYN_partial_09_0113 := by
  native_decide

/-- Coefficient term 114 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYN_coefficient_09_0114 : Poly :=
[
  term (-16 : Rat) [(10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 114 for generator 9. -/
def rs_R010_ueqv_R010NYN_partial_09_0114 : Poly :=
[
  term (-32 : Rat) [(0, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term (32 : Rat) [(0, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term (-32 : Rat) [(1, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term (16 : Rat) [(10, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term (-16 : Rat) [(10, 1), (13, 1), (15, 1), (16, 1)],
  term (16 : Rat) [(10, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 114 for generator 9. -/
theorem rs_R010_ueqv_R010NYN_partial_09_0114_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_09_0114
        rs_R010_ueqv_R010NYN_generator_09_0100_0132 =
      rs_R010_ueqv_R010NYN_partial_09_0114 := by
  native_decide

/-- Coefficient term 115 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYN_coefficient_09_0115 : Poly :=
[
  term ((-252096 : Rat) / 2995) [(10, 1), (15, 2)]
]

/-- Partial product 115 for generator 9. -/
def rs_R010_ueqv_R010NYN_partial_09_0115 : Poly :=
[
  term ((-504192 : Rat) / 2995) [(0, 1), (10, 1), (12, 1), (15, 2)],
  term ((504192 : Rat) / 2995) [(0, 1), (10, 1), (15, 2)],
  term ((-504192 : Rat) / 2995) [(1, 1), (10, 1), (13, 1), (15, 2)],
  term ((252096 : Rat) / 2995) [(10, 1), (12, 2), (15, 2)],
  term ((252096 : Rat) / 2995) [(10, 1), (13, 2), (15, 2)],
  term ((-252096 : Rat) / 2995) [(10, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 115 for generator 9. -/
theorem rs_R010_ueqv_R010NYN_partial_09_0115_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_09_0115
        rs_R010_ueqv_R010NYN_generator_09_0100_0132 =
      rs_R010_ueqv_R010NYN_partial_09_0115 := by
  native_decide

/-- Coefficient term 116 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYN_coefficient_09_0116 : Poly :=
[
  term ((88 : Rat) / 5) [(10, 1), (15, 2), (16, 1)]
]

/-- Partial product 116 for generator 9. -/
def rs_R010_ueqv_R010NYN_partial_09_0116 : Poly :=
[
  term ((176 : Rat) / 5) [(0, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-176 : Rat) / 5) [(0, 1), (10, 1), (15, 2), (16, 1)],
  term ((176 : Rat) / 5) [(1, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-88 : Rat) / 5) [(10, 1), (12, 2), (15, 2), (16, 1)],
  term ((-88 : Rat) / 5) [(10, 1), (13, 2), (15, 2), (16, 1)],
  term ((88 : Rat) / 5) [(10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 116 for generator 9. -/
theorem rs_R010_ueqv_R010NYN_partial_09_0116_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_09_0116
        rs_R010_ueqv_R010NYN_generator_09_0100_0132 =
      rs_R010_ueqv_R010NYN_partial_09_0116 := by
  native_decide

/-- Coefficient term 117 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYN_coefficient_09_0117 : Poly :=
[
  term ((-732096 : Rat) / 2995) [(11, 1), (13, 1)]
]

/-- Partial product 117 for generator 9. -/
def rs_R010_ueqv_R010NYN_partial_09_0117 : Poly :=
[
  term ((-1464192 : Rat) / 2995) [(0, 1), (11, 1), (12, 1), (13, 1)],
  term ((1464192 : Rat) / 2995) [(0, 1), (11, 1), (13, 1)],
  term ((-1464192 : Rat) / 2995) [(1, 1), (11, 1), (13, 2)],
  term ((732096 : Rat) / 2995) [(11, 1), (12, 2), (13, 1)],
  term ((-732096 : Rat) / 2995) [(11, 1), (13, 1)],
  term ((732096 : Rat) / 2995) [(11, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 117 for generator 9. -/
theorem rs_R010_ueqv_R010NYN_partial_09_0117_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_09_0117
        rs_R010_ueqv_R010NYN_generator_09_0100_0132 =
      rs_R010_ueqv_R010NYN_partial_09_0117 := by
  native_decide

/-- Coefficient term 118 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYN_coefficient_09_0118 : Poly :=
[
  term ((-162816 : Rat) / 2995) [(11, 1), (13, 1), (15, 2)]
]

/-- Partial product 118 for generator 9. -/
def rs_R010_ueqv_R010NYN_partial_09_0118 : Poly :=
[
  term ((-325632 : Rat) / 2995) [(0, 1), (11, 1), (12, 1), (13, 1), (15, 2)],
  term ((325632 : Rat) / 2995) [(0, 1), (11, 1), (13, 1), (15, 2)],
  term ((-325632 : Rat) / 2995) [(1, 1), (11, 1), (13, 2), (15, 2)],
  term ((162816 : Rat) / 2995) [(11, 1), (12, 2), (13, 1), (15, 2)],
  term ((-162816 : Rat) / 2995) [(11, 1), (13, 1), (15, 2)],
  term ((162816 : Rat) / 2995) [(11, 1), (13, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 118 for generator 9. -/
theorem rs_R010_ueqv_R010NYN_partial_09_0118_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_09_0118
        rs_R010_ueqv_R010NYN_generator_09_0100_0132 =
      rs_R010_ueqv_R010NYN_partial_09_0118 := by
  native_decide

/-- Coefficient term 119 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYN_coefficient_09_0119 : Poly :=
[
  term ((88 : Rat) / 5) [(11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 119 for generator 9. -/
def rs_R010_ueqv_R010NYN_partial_09_0119 : Poly :=
[
  term ((176 : Rat) / 5) [(0, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-176 : Rat) / 5) [(0, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((176 : Rat) / 5) [(1, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-88 : Rat) / 5) [(11, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((88 : Rat) / 5) [(11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-88 : Rat) / 5) [(11, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 119 for generator 9. -/
theorem rs_R010_ueqv_R010NYN_partial_09_0119_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_09_0119
        rs_R010_ueqv_R010NYN_generator_09_0100_0132 =
      rs_R010_ueqv_R010NYN_partial_09_0119 := by
  native_decide

/-- Coefficient term 120 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYN_coefficient_09_0120 : Poly :=
[
  term ((2785008 : Rat) / 2995) [(11, 1), (15, 1)]
]

/-- Partial product 120 for generator 9. -/
def rs_R010_ueqv_R010NYN_partial_09_0120 : Poly :=
[
  term ((5570016 : Rat) / 2995) [(0, 1), (11, 1), (12, 1), (15, 1)],
  term ((-5570016 : Rat) / 2995) [(0, 1), (11, 1), (15, 1)],
  term ((5570016 : Rat) / 2995) [(1, 1), (11, 1), (13, 1), (15, 1)],
  term ((-2785008 : Rat) / 2995) [(11, 1), (12, 2), (15, 1)],
  term ((-2785008 : Rat) / 2995) [(11, 1), (13, 2), (15, 1)],
  term ((2785008 : Rat) / 2995) [(11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 120 for generator 9. -/
theorem rs_R010_ueqv_R010NYN_partial_09_0120_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_09_0120
        rs_R010_ueqv_R010NYN_generator_09_0100_0132 =
      rs_R010_ueqv_R010NYN_partial_09_0120 := by
  native_decide

/-- Coefficient term 121 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYN_coefficient_09_0121 : Poly :=
[
  term ((-48 : Rat) / 5) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 121 for generator 9. -/
def rs_R010_ueqv_R010NYN_partial_09_0121 : Poly :=
[
  term ((-96 : Rat) / 5) [(0, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((96 : Rat) / 5) [(0, 1), (11, 1), (15, 1), (16, 1)],
  term ((-96 : Rat) / 5) [(1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((48 : Rat) / 5) [(11, 1), (12, 2), (15, 1), (16, 1)],
  term ((48 : Rat) / 5) [(11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-48 : Rat) / 5) [(11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 121 for generator 9. -/
theorem rs_R010_ueqv_R010NYN_partial_09_0121_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_09_0121
        rs_R010_ueqv_R010NYN_generator_09_0100_0132 =
      rs_R010_ueqv_R010NYN_partial_09_0121 := by
  native_decide

/-- Coefficient term 122 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYN_coefficient_09_0122 : Poly :=
[
  term ((-5010432 : Rat) / 2995) [(11, 1), (15, 3)]
]

/-- Partial product 122 for generator 9. -/
def rs_R010_ueqv_R010NYN_partial_09_0122 : Poly :=
[
  term ((-10020864 : Rat) / 2995) [(0, 1), (11, 1), (12, 1), (15, 3)],
  term ((10020864 : Rat) / 2995) [(0, 1), (11, 1), (15, 3)],
  term ((-10020864 : Rat) / 2995) [(1, 1), (11, 1), (13, 1), (15, 3)],
  term ((5010432 : Rat) / 2995) [(11, 1), (12, 2), (15, 3)],
  term ((5010432 : Rat) / 2995) [(11, 1), (13, 2), (15, 3)],
  term ((-5010432 : Rat) / 2995) [(11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 122 for generator 9. -/
theorem rs_R010_ueqv_R010NYN_partial_09_0122_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_09_0122
        rs_R010_ueqv_R010NYN_generator_09_0100_0132 =
      rs_R010_ueqv_R010NYN_partial_09_0122 := by
  native_decide

/-- Coefficient term 123 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYN_coefficient_09_0123 : Poly :=
[
  term ((1156 : Rat) / 5) [(11, 1), (15, 3), (16, 1)]
]

/-- Partial product 123 for generator 9. -/
def rs_R010_ueqv_R010NYN_partial_09_0123 : Poly :=
[
  term ((2312 : Rat) / 5) [(0, 1), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((-2312 : Rat) / 5) [(0, 1), (11, 1), (15, 3), (16, 1)],
  term ((2312 : Rat) / 5) [(1, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((-1156 : Rat) / 5) [(11, 1), (12, 2), (15, 3), (16, 1)],
  term ((-1156 : Rat) / 5) [(11, 1), (13, 2), (15, 3), (16, 1)],
  term ((1156 : Rat) / 5) [(11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 123 for generator 9. -/
theorem rs_R010_ueqv_R010NYN_partial_09_0123_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_09_0123
        rs_R010_ueqv_R010NYN_generator_09_0100_0132 =
      rs_R010_ueqv_R010NYN_partial_09_0123 := by
  native_decide

/-- Coefficient term 124 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYN_coefficient_09_0124 : Poly :=
[
  term ((-80352 : Rat) / 2995) [(11, 2)]
]

/-- Partial product 124 for generator 9. -/
def rs_R010_ueqv_R010NYN_partial_09_0124 : Poly :=
[
  term ((160704 : Rat) / 2995) [(0, 1), (11, 2)],
  term ((-160704 : Rat) / 2995) [(0, 1), (11, 2), (12, 1)],
  term ((-160704 : Rat) / 2995) [(1, 1), (11, 2), (13, 1)],
  term ((-80352 : Rat) / 2995) [(11, 2)],
  term ((80352 : Rat) / 2995) [(11, 2), (12, 2)],
  term ((80352 : Rat) / 2995) [(11, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 124 for generator 9. -/
theorem rs_R010_ueqv_R010NYN_partial_09_0124_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_09_0124
        rs_R010_ueqv_R010NYN_generator_09_0100_0132 =
      rs_R010_ueqv_R010NYN_partial_09_0124 := by
  native_decide

/-- Coefficient term 125 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYN_coefficient_09_0125 : Poly :=
[
  term ((214272 : Rat) / 2995) [(11, 2), (13, 1), (15, 1)]
]

/-- Partial product 125 for generator 9. -/
def rs_R010_ueqv_R010NYN_partial_09_0125 : Poly :=
[
  term ((428544 : Rat) / 2995) [(0, 1), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((-428544 : Rat) / 2995) [(0, 1), (11, 2), (13, 1), (15, 1)],
  term ((428544 : Rat) / 2995) [(1, 1), (11, 2), (13, 2), (15, 1)],
  term ((-214272 : Rat) / 2995) [(11, 2), (12, 2), (13, 1), (15, 1)],
  term ((214272 : Rat) / 2995) [(11, 2), (13, 1), (15, 1)],
  term ((-214272 : Rat) / 2995) [(11, 2), (13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 125 for generator 9. -/
theorem rs_R010_ueqv_R010NYN_partial_09_0125_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_09_0125
        rs_R010_ueqv_R010NYN_generator_09_0100_0132 =
      rs_R010_ueqv_R010NYN_partial_09_0125 := by
  native_decide

/-- Coefficient term 126 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYN_coefficient_09_0126 : Poly :=
[
  term ((10181376 : Rat) / 2995) [(11, 2), (15, 2)]
]

/-- Partial product 126 for generator 9. -/
def rs_R010_ueqv_R010NYN_partial_09_0126 : Poly :=
[
  term ((20362752 : Rat) / 2995) [(0, 1), (11, 2), (12, 1), (15, 2)],
  term ((-20362752 : Rat) / 2995) [(0, 1), (11, 2), (15, 2)],
  term ((20362752 : Rat) / 2995) [(1, 1), (11, 2), (13, 1), (15, 2)],
  term ((-10181376 : Rat) / 2995) [(11, 2), (12, 2), (15, 2)],
  term ((-10181376 : Rat) / 2995) [(11, 2), (13, 2), (15, 2)],
  term ((10181376 : Rat) / 2995) [(11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 126 for generator 9. -/
theorem rs_R010_ueqv_R010NYN_partial_09_0126_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_09_0126
        rs_R010_ueqv_R010NYN_generator_09_0100_0132 =
      rs_R010_ueqv_R010NYN_partial_09_0126 := by
  native_decide

/-- Coefficient term 127 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYN_coefficient_09_0127 : Poly :=
[
  term ((-1896 : Rat) / 5) [(11, 2), (15, 2), (16, 1)]
]

/-- Partial product 127 for generator 9. -/
def rs_R010_ueqv_R010NYN_partial_09_0127 : Poly :=
[
  term ((-3792 : Rat) / 5) [(0, 1), (11, 2), (12, 1), (15, 2), (16, 1)],
  term ((3792 : Rat) / 5) [(0, 1), (11, 2), (15, 2), (16, 1)],
  term ((-3792 : Rat) / 5) [(1, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((1896 : Rat) / 5) [(11, 2), (12, 2), (15, 2), (16, 1)],
  term ((1896 : Rat) / 5) [(11, 2), (13, 2), (15, 2), (16, 1)],
  term ((-1896 : Rat) / 5) [(11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 127 for generator 9. -/
theorem rs_R010_ueqv_R010NYN_partial_09_0127_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_09_0127
        rs_R010_ueqv_R010NYN_generator_09_0100_0132 =
      rs_R010_ueqv_R010NYN_partial_09_0127 := by
  native_decide

/-- Coefficient term 128 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYN_coefficient_09_0128 : Poly :=
[
  term ((-5785344 : Rat) / 2995) [(11, 3), (15, 1)]
]

/-- Partial product 128 for generator 9. -/
def rs_R010_ueqv_R010NYN_partial_09_0128 : Poly :=
[
  term ((-11570688 : Rat) / 2995) [(0, 1), (11, 3), (12, 1), (15, 1)],
  term ((11570688 : Rat) / 2995) [(0, 1), (11, 3), (15, 1)],
  term ((-11570688 : Rat) / 2995) [(1, 1), (11, 3), (13, 1), (15, 1)],
  term ((5785344 : Rat) / 2995) [(11, 3), (12, 2), (15, 1)],
  term ((5785344 : Rat) / 2995) [(11, 3), (13, 2), (15, 1)],
  term ((-5785344 : Rat) / 2995) [(11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 128 for generator 9. -/
theorem rs_R010_ueqv_R010NYN_partial_09_0128_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_09_0128
        rs_R010_ueqv_R010NYN_generator_09_0100_0132 =
      rs_R010_ueqv_R010NYN_partial_09_0128 := by
  native_decide

/-- Coefficient term 129 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYN_coefficient_09_0129 : Poly :=
[
  term ((766628 : Rat) / 2995) [(13, 1), (15, 1)]
]

/-- Partial product 129 for generator 9. -/
def rs_R010_ueqv_R010NYN_partial_09_0129 : Poly :=
[
  term ((1533256 : Rat) / 2995) [(0, 1), (12, 1), (13, 1), (15, 1)],
  term ((-1533256 : Rat) / 2995) [(0, 1), (13, 1), (15, 1)],
  term ((1533256 : Rat) / 2995) [(1, 1), (13, 2), (15, 1)],
  term ((-766628 : Rat) / 2995) [(12, 2), (13, 1), (15, 1)],
  term ((766628 : Rat) / 2995) [(13, 1), (15, 1)],
  term ((-766628 : Rat) / 2995) [(13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 129 for generator 9. -/
theorem rs_R010_ueqv_R010NYN_partial_09_0129_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_09_0129
        rs_R010_ueqv_R010NYN_generator_09_0100_0132 =
      rs_R010_ueqv_R010NYN_partial_09_0129 := by
  native_decide

/-- Coefficient term 130 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYN_coefficient_09_0130 : Poly :=
[
  term ((-174 : Rat) / 5) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 130 for generator 9. -/
def rs_R010_ueqv_R010NYN_partial_09_0130 : Poly :=
[
  term ((-348 : Rat) / 5) [(0, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((348 : Rat) / 5) [(0, 1), (13, 1), (15, 1), (16, 1)],
  term ((-348 : Rat) / 5) [(1, 1), (13, 2), (15, 1), (16, 1)],
  term ((174 : Rat) / 5) [(12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-174 : Rat) / 5) [(13, 1), (15, 1), (16, 1)],
  term ((174 : Rat) / 5) [(13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 130 for generator 9. -/
theorem rs_R010_ueqv_R010NYN_partial_09_0130_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_09_0130
        rs_R010_ueqv_R010NYN_generator_09_0100_0132 =
      rs_R010_ueqv_R010NYN_partial_09_0130 := by
  native_decide

/-- Coefficient term 131 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYN_coefficient_09_0131 : Poly :=
[
  term ((-2762716 : Rat) / 2995) [(15, 2)]
]

/-- Partial product 131 for generator 9. -/
def rs_R010_ueqv_R010NYN_partial_09_0131 : Poly :=
[
  term ((-5525432 : Rat) / 2995) [(0, 1), (12, 1), (15, 2)],
  term ((5525432 : Rat) / 2995) [(0, 1), (15, 2)],
  term ((-5525432 : Rat) / 2995) [(1, 1), (13, 1), (15, 2)],
  term ((2762716 : Rat) / 2995) [(12, 2), (15, 2)],
  term ((2762716 : Rat) / 2995) [(13, 2), (15, 2)],
  term ((-2762716 : Rat) / 2995) [(15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 131 for generator 9. -/
theorem rs_R010_ueqv_R010NYN_partial_09_0131_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_09_0131
        rs_R010_ueqv_R010NYN_generator_09_0100_0132 =
      rs_R010_ueqv_R010NYN_partial_09_0131 := by
  native_decide

/-- Coefficient term 132 from coefficient polynomial 9. -/
def rs_R010_ueqv_R010NYN_coefficient_09_0132 : Poly :=
[
  term ((658 : Rat) / 5) [(15, 2), (16, 1)]
]

/-- Partial product 132 for generator 9. -/
def rs_R010_ueqv_R010NYN_partial_09_0132 : Poly :=
[
  term ((1316 : Rat) / 5) [(0, 1), (12, 1), (15, 2), (16, 1)],
  term ((-1316 : Rat) / 5) [(0, 1), (15, 2), (16, 1)],
  term ((1316 : Rat) / 5) [(1, 1), (13, 1), (15, 2), (16, 1)],
  term ((-658 : Rat) / 5) [(12, 2), (15, 2), (16, 1)],
  term ((-658 : Rat) / 5) [(13, 2), (15, 2), (16, 1)],
  term ((658 : Rat) / 5) [(15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 132 for generator 9. -/
theorem rs_R010_ueqv_R010NYN_partial_09_0132_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_09_0132
        rs_R010_ueqv_R010NYN_generator_09_0100_0132 =
      rs_R010_ueqv_R010NYN_partial_09_0132 := by
  native_decide

/-- Partial products in this block. -/
def rs_R010_ueqv_R010NYN_partials_09_0100_0132 : List Poly :=
[
  rs_R010_ueqv_R010NYN_partial_09_0100,
  rs_R010_ueqv_R010NYN_partial_09_0101,
  rs_R010_ueqv_R010NYN_partial_09_0102,
  rs_R010_ueqv_R010NYN_partial_09_0103,
  rs_R010_ueqv_R010NYN_partial_09_0104,
  rs_R010_ueqv_R010NYN_partial_09_0105,
  rs_R010_ueqv_R010NYN_partial_09_0106,
  rs_R010_ueqv_R010NYN_partial_09_0107,
  rs_R010_ueqv_R010NYN_partial_09_0108,
  rs_R010_ueqv_R010NYN_partial_09_0109,
  rs_R010_ueqv_R010NYN_partial_09_0110,
  rs_R010_ueqv_R010NYN_partial_09_0111,
  rs_R010_ueqv_R010NYN_partial_09_0112,
  rs_R010_ueqv_R010NYN_partial_09_0113,
  rs_R010_ueqv_R010NYN_partial_09_0114,
  rs_R010_ueqv_R010NYN_partial_09_0115,
  rs_R010_ueqv_R010NYN_partial_09_0116,
  rs_R010_ueqv_R010NYN_partial_09_0117,
  rs_R010_ueqv_R010NYN_partial_09_0118,
  rs_R010_ueqv_R010NYN_partial_09_0119,
  rs_R010_ueqv_R010NYN_partial_09_0120,
  rs_R010_ueqv_R010NYN_partial_09_0121,
  rs_R010_ueqv_R010NYN_partial_09_0122,
  rs_R010_ueqv_R010NYN_partial_09_0123,
  rs_R010_ueqv_R010NYN_partial_09_0124,
  rs_R010_ueqv_R010NYN_partial_09_0125,
  rs_R010_ueqv_R010NYN_partial_09_0126,
  rs_R010_ueqv_R010NYN_partial_09_0127,
  rs_R010_ueqv_R010NYN_partial_09_0128,
  rs_R010_ueqv_R010NYN_partial_09_0129,
  rs_R010_ueqv_R010NYN_partial_09_0130,
  rs_R010_ueqv_R010NYN_partial_09_0131,
  rs_R010_ueqv_R010NYN_partial_09_0132
]

/-- Sum of partial products in this block. -/
def rs_R010_ueqv_R010NYN_block_09_0100_0132 : Poly :=
[
  term ((-2424 : Rat) / 5) [(0, 1), (9, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((2424 : Rat) / 5) [(0, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-642816 : Rat) / 2995) [(0, 1), (9, 1), (11, 2), (12, 1), (13, 1)],
  term ((-4243968 : Rat) / 599) [(0, 1), (9, 1), (11, 2), (12, 1), (15, 1)],
  term ((3792 : Rat) / 5) [(0, 1), (9, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((642816 : Rat) / 2995) [(0, 1), (9, 1), (11, 2), (13, 1)],
  term ((4243968 : Rat) / 599) [(0, 1), (9, 1), (11, 2), (15, 1)],
  term ((-3792 : Rat) / 5) [(0, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-11570688 : Rat) / 2995) [(0, 1), (9, 1), (11, 3)],
  term ((11570688 : Rat) / 2995) [(0, 1), (9, 1), (11, 3), (12, 1)],
  term ((262656 : Rat) / 2995) [(0, 1), (9, 1), (12, 1), (13, 1), (15, 2)],
  term ((32 : Rat) / 5) [(0, 1), (9, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((2249808 : Rat) / 2995) [(0, 1), (9, 1), (12, 1), (15, 1)],
  term ((-544 : Rat) / 5) [(0, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-525312 : Rat) / 2995) [(0, 1), (9, 1), (12, 1), (15, 3)],
  term ((-64 : Rat) / 5) [(0, 1), (9, 1), (12, 1), (15, 3), (16, 1)],
  term ((-262656 : Rat) / 2995) [(0, 1), (9, 1), (13, 1), (15, 2)],
  term ((-32 : Rat) / 5) [(0, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-2249808 : Rat) / 2995) [(0, 1), (9, 1), (15, 1)],
  term ((544 : Rat) / 5) [(0, 1), (9, 1), (15, 1), (16, 1)],
  term ((525312 : Rat) / 2995) [(0, 1), (9, 1), (15, 3)],
  term ((64 : Rat) / 5) [(0, 1), (9, 1), (15, 3), (16, 1)],
  term ((-107136 : Rat) / 599) [(0, 1), (10, 1), (11, 1), (12, 1), (13, 1)],
  term ((428544 : Rat) / 2995) [(0, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((107136 : Rat) / 599) [(0, 1), (10, 1), (11, 1), (13, 1)],
  term ((-428544 : Rat) / 2995) [(0, 1), (10, 1), (11, 1), (15, 1)],
  term ((99264 : Rat) / 599) [(0, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term (-32 : Rat) [(0, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-504192 : Rat) / 2995) [(0, 1), (10, 1), (12, 1), (15, 2)],
  term ((176 : Rat) / 5) [(0, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-99264 : Rat) / 599) [(0, 1), (10, 1), (13, 1), (15, 1)],
  term (32 : Rat) [(0, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((504192 : Rat) / 2995) [(0, 1), (10, 1), (15, 2)],
  term ((-176 : Rat) / 5) [(0, 1), (10, 1), (15, 2), (16, 1)],
  term ((-1464192 : Rat) / 2995) [(0, 1), (11, 1), (12, 1), (13, 1)],
  term ((-325632 : Rat) / 2995) [(0, 1), (11, 1), (12, 1), (13, 1), (15, 2)],
  term ((176 : Rat) / 5) [(0, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((5570016 : Rat) / 2995) [(0, 1), (11, 1), (12, 1), (15, 1)],
  term ((-96 : Rat) / 5) [(0, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-10020864 : Rat) / 2995) [(0, 1), (11, 1), (12, 1), (15, 3)],
  term ((2312 : Rat) / 5) [(0, 1), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((1464192 : Rat) / 2995) [(0, 1), (11, 1), (13, 1)],
  term ((325632 : Rat) / 2995) [(0, 1), (11, 1), (13, 1), (15, 2)],
  term ((-176 : Rat) / 5) [(0, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-5570016 : Rat) / 2995) [(0, 1), (11, 1), (15, 1)],
  term ((96 : Rat) / 5) [(0, 1), (11, 1), (15, 1), (16, 1)],
  term ((10020864 : Rat) / 2995) [(0, 1), (11, 1), (15, 3)],
  term ((-2312 : Rat) / 5) [(0, 1), (11, 1), (15, 3), (16, 1)],
  term ((160704 : Rat) / 2995) [(0, 1), (11, 2)],
  term ((-160704 : Rat) / 2995) [(0, 1), (11, 2), (12, 1)],
  term ((428544 : Rat) / 2995) [(0, 1), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((20362752 : Rat) / 2995) [(0, 1), (11, 2), (12, 1), (15, 2)],
  term ((-3792 : Rat) / 5) [(0, 1), (11, 2), (12, 1), (15, 2), (16, 1)],
  term ((-428544 : Rat) / 2995) [(0, 1), (11, 2), (13, 1), (15, 1)],
  term ((-20362752 : Rat) / 2995) [(0, 1), (11, 2), (15, 2)],
  term ((3792 : Rat) / 5) [(0, 1), (11, 2), (15, 2), (16, 1)],
  term ((-11570688 : Rat) / 2995) [(0, 1), (11, 3), (12, 1), (15, 1)],
  term ((11570688 : Rat) / 2995) [(0, 1), (11, 3), (15, 1)],
  term ((1533256 : Rat) / 2995) [(0, 1), (12, 1), (13, 1), (15, 1)],
  term ((-348 : Rat) / 5) [(0, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-5525432 : Rat) / 2995) [(0, 1), (12, 1), (15, 2)],
  term ((1316 : Rat) / 5) [(0, 1), (12, 1), (15, 2), (16, 1)],
  term ((-1533256 : Rat) / 2995) [(0, 1), (13, 1), (15, 1)],
  term ((348 : Rat) / 5) [(0, 1), (13, 1), (15, 1), (16, 1)],
  term ((5525432 : Rat) / 2995) [(0, 1), (15, 2)],
  term ((-1316 : Rat) / 5) [(0, 1), (15, 2), (16, 1)],
  term ((-2424 : Rat) / 5) [(1, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-4243968 : Rat) / 599) [(1, 1), (9, 1), (11, 2), (13, 1), (15, 1)],
  term ((3792 : Rat) / 5) [(1, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-642816 : Rat) / 2995) [(1, 1), (9, 1), (11, 2), (13, 2)],
  term ((11570688 : Rat) / 2995) [(1, 1), (9, 1), (11, 3), (13, 1)],
  term ((2249808 : Rat) / 2995) [(1, 1), (9, 1), (13, 1), (15, 1)],
  term ((-544 : Rat) / 5) [(1, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-525312 : Rat) / 2995) [(1, 1), (9, 1), (13, 1), (15, 3)],
  term ((-64 : Rat) / 5) [(1, 1), (9, 1), (13, 1), (15, 3), (16, 1)],
  term ((262656 : Rat) / 2995) [(1, 1), (9, 1), (13, 2), (15, 2)],
  term ((32 : Rat) / 5) [(1, 1), (9, 1), (13, 2), (15, 2), (16, 1)],
  term ((428544 : Rat) / 2995) [(1, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((-107136 : Rat) / 599) [(1, 1), (10, 1), (11, 1), (13, 2)],
  term ((-504192 : Rat) / 2995) [(1, 1), (10, 1), (13, 1), (15, 2)],
  term ((176 : Rat) / 5) [(1, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((99264 : Rat) / 599) [(1, 1), (10, 1), (13, 2), (15, 1)],
  term (-32 : Rat) [(1, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((5570016 : Rat) / 2995) [(1, 1), (11, 1), (13, 1), (15, 1)],
  term ((-96 : Rat) / 5) [(1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-10020864 : Rat) / 2995) [(1, 1), (11, 1), (13, 1), (15, 3)],
  term ((2312 : Rat) / 5) [(1, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((-1464192 : Rat) / 2995) [(1, 1), (11, 1), (13, 2)],
  term ((-325632 : Rat) / 2995) [(1, 1), (11, 1), (13, 2), (15, 2)],
  term ((176 : Rat) / 5) [(1, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-160704 : Rat) / 2995) [(1, 1), (11, 2), (13, 1)],
  term ((20362752 : Rat) / 2995) [(1, 1), (11, 2), (13, 1), (15, 2)],
  term ((-3792 : Rat) / 5) [(1, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((428544 : Rat) / 2995) [(1, 1), (11, 2), (13, 2), (15, 1)],
  term ((-11570688 : Rat) / 2995) [(1, 1), (11, 3), (13, 1), (15, 1)],
  term ((-5525432 : Rat) / 2995) [(1, 1), (13, 1), (15, 2)],
  term ((1316 : Rat) / 5) [(1, 1), (13, 1), (15, 2), (16, 1)],
  term ((1533256 : Rat) / 2995) [(1, 1), (13, 2), (15, 1)],
  term ((-348 : Rat) / 5) [(1, 1), (13, 2), (15, 1), (16, 1)],
  term ((1212 : Rat) / 5) [(9, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((1212 : Rat) / 5) [(9, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-1212 : Rat) / 5) [(9, 1), (11, 1), (15, 2), (16, 1)],
  term ((321408 : Rat) / 2995) [(9, 1), (11, 2), (12, 2), (13, 1)],
  term ((2121984 : Rat) / 599) [(9, 1), (11, 2), (12, 2), (15, 1)],
  term ((-1896 : Rat) / 5) [(9, 1), (11, 2), (12, 2), (15, 1), (16, 1)],
  term ((-321408 : Rat) / 2995) [(9, 1), (11, 2), (13, 1)],
  term ((2121984 : Rat) / 599) [(9, 1), (11, 2), (13, 2), (15, 1)],
  term ((-1896 : Rat) / 5) [(9, 1), (11, 2), (13, 2), (15, 1), (16, 1)],
  term ((321408 : Rat) / 2995) [(9, 1), (11, 2), (13, 3)],
  term ((-2121984 : Rat) / 599) [(9, 1), (11, 2), (15, 1)],
  term ((1896 : Rat) / 5) [(9, 1), (11, 2), (15, 1), (16, 1)],
  term ((5785344 : Rat) / 2995) [(9, 1), (11, 3)],
  term ((-5785344 : Rat) / 2995) [(9, 1), (11, 3), (12, 2)],
  term ((-5785344 : Rat) / 2995) [(9, 1), (11, 3), (13, 2)],
  term ((-131328 : Rat) / 2995) [(9, 1), (12, 2), (13, 1), (15, 2)],
  term ((-16 : Rat) / 5) [(9, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-1124904 : Rat) / 2995) [(9, 1), (12, 2), (15, 1)],
  term ((272 : Rat) / 5) [(9, 1), (12, 2), (15, 1), (16, 1)],
  term ((262656 : Rat) / 2995) [(9, 1), (12, 2), (15, 3)],
  term ((32 : Rat) / 5) [(9, 1), (12, 2), (15, 3), (16, 1)],
  term ((131328 : Rat) / 2995) [(9, 1), (13, 1), (15, 2)],
  term ((16 : Rat) / 5) [(9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1124904 : Rat) / 2995) [(9, 1), (13, 2), (15, 1)],
  term ((272 : Rat) / 5) [(9, 1), (13, 2), (15, 1), (16, 1)],
  term ((262656 : Rat) / 2995) [(9, 1), (13, 2), (15, 3)],
  term ((32 : Rat) / 5) [(9, 1), (13, 2), (15, 3), (16, 1)],
  term ((-131328 : Rat) / 2995) [(9, 1), (13, 3), (15, 2)],
  term ((-16 : Rat) / 5) [(9, 1), (13, 3), (15, 2), (16, 1)],
  term ((1124904 : Rat) / 2995) [(9, 1), (15, 1)],
  term ((-272 : Rat) / 5) [(9, 1), (15, 1), (16, 1)],
  term ((-262656 : Rat) / 2995) [(9, 1), (15, 3)],
  term ((-32 : Rat) / 5) [(9, 1), (15, 3), (16, 1)],
  term ((53568 : Rat) / 599) [(10, 1), (11, 1), (12, 2), (13, 1)],
  term ((-214272 : Rat) / 2995) [(10, 1), (11, 1), (12, 2), (15, 1)],
  term ((-53568 : Rat) / 599) [(10, 1), (11, 1), (13, 1)],
  term ((-214272 : Rat) / 2995) [(10, 1), (11, 1), (13, 2), (15, 1)],
  term ((53568 : Rat) / 599) [(10, 1), (11, 1), (13, 3)],
  term ((214272 : Rat) / 2995) [(10, 1), (11, 1), (15, 1)],
  term ((-49632 : Rat) / 599) [(10, 1), (12, 2), (13, 1), (15, 1)],
  term (16 : Rat) [(10, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((252096 : Rat) / 2995) [(10, 1), (12, 2), (15, 2)],
  term ((-88 : Rat) / 5) [(10, 1), (12, 2), (15, 2), (16, 1)],
  term ((49632 : Rat) / 599) [(10, 1), (13, 1), (15, 1)],
  term (-16 : Rat) [(10, 1), (13, 1), (15, 1), (16, 1)],
  term ((252096 : Rat) / 2995) [(10, 1), (13, 2), (15, 2)],
  term ((-88 : Rat) / 5) [(10, 1), (13, 2), (15, 2), (16, 1)],
  term ((-49632 : Rat) / 599) [(10, 1), (13, 3), (15, 1)],
  term (16 : Rat) [(10, 1), (13, 3), (15, 1), (16, 1)],
  term ((-252096 : Rat) / 2995) [(10, 1), (15, 2)],
  term ((88 : Rat) / 5) [(10, 1), (15, 2), (16, 1)],
  term ((732096 : Rat) / 2995) [(11, 1), (12, 2), (13, 1)],
  term ((162816 : Rat) / 2995) [(11, 1), (12, 2), (13, 1), (15, 2)],
  term ((-88 : Rat) / 5) [(11, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-2785008 : Rat) / 2995) [(11, 1), (12, 2), (15, 1)],
  term ((48 : Rat) / 5) [(11, 1), (12, 2), (15, 1), (16, 1)],
  term ((5010432 : Rat) / 2995) [(11, 1), (12, 2), (15, 3)],
  term ((-1156 : Rat) / 5) [(11, 1), (12, 2), (15, 3), (16, 1)],
  term ((-732096 : Rat) / 2995) [(11, 1), (13, 1)],
  term ((-162816 : Rat) / 2995) [(11, 1), (13, 1), (15, 2)],
  term ((88 : Rat) / 5) [(11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-2785008 : Rat) / 2995) [(11, 1), (13, 2), (15, 1)],
  term ((48 : Rat) / 5) [(11, 1), (13, 2), (15, 1), (16, 1)],
  term ((5010432 : Rat) / 2995) [(11, 1), (13, 2), (15, 3)],
  term ((-1156 : Rat) / 5) [(11, 1), (13, 2), (15, 3), (16, 1)],
  term ((732096 : Rat) / 2995) [(11, 1), (13, 3)],
  term ((162816 : Rat) / 2995) [(11, 1), (13, 3), (15, 2)],
  term ((-88 : Rat) / 5) [(11, 1), (13, 3), (15, 2), (16, 1)],
  term ((2785008 : Rat) / 2995) [(11, 1), (15, 1)],
  term ((-48 : Rat) / 5) [(11, 1), (15, 1), (16, 1)],
  term ((-5010432 : Rat) / 2995) [(11, 1), (15, 3)],
  term ((1156 : Rat) / 5) [(11, 1), (15, 3), (16, 1)],
  term ((-80352 : Rat) / 2995) [(11, 2)],
  term ((80352 : Rat) / 2995) [(11, 2), (12, 2)],
  term ((-214272 : Rat) / 2995) [(11, 2), (12, 2), (13, 1), (15, 1)],
  term ((-10181376 : Rat) / 2995) [(11, 2), (12, 2), (15, 2)],
  term ((1896 : Rat) / 5) [(11, 2), (12, 2), (15, 2), (16, 1)],
  term ((214272 : Rat) / 2995) [(11, 2), (13, 1), (15, 1)],
  term ((80352 : Rat) / 2995) [(11, 2), (13, 2)],
  term ((-10181376 : Rat) / 2995) [(11, 2), (13, 2), (15, 2)],
  term ((1896 : Rat) / 5) [(11, 2), (13, 2), (15, 2), (16, 1)],
  term ((-214272 : Rat) / 2995) [(11, 2), (13, 3), (15, 1)],
  term ((10181376 : Rat) / 2995) [(11, 2), (15, 2)],
  term ((-1896 : Rat) / 5) [(11, 2), (15, 2), (16, 1)],
  term ((5785344 : Rat) / 2995) [(11, 3), (12, 2), (15, 1)],
  term ((5785344 : Rat) / 2995) [(11, 3), (13, 2), (15, 1)],
  term ((-5785344 : Rat) / 2995) [(11, 3), (15, 1)],
  term ((-766628 : Rat) / 2995) [(12, 2), (13, 1), (15, 1)],
  term ((174 : Rat) / 5) [(12, 2), (13, 1), (15, 1), (16, 1)],
  term ((2762716 : Rat) / 2995) [(12, 2), (15, 2)],
  term ((-658 : Rat) / 5) [(12, 2), (15, 2), (16, 1)],
  term ((766628 : Rat) / 2995) [(13, 1), (15, 1)],
  term ((-174 : Rat) / 5) [(13, 1), (15, 1), (16, 1)],
  term ((2762716 : Rat) / 2995) [(13, 2), (15, 2)],
  term ((-658 : Rat) / 5) [(13, 2), (15, 2), (16, 1)],
  term ((-766628 : Rat) / 2995) [(13, 3), (15, 1)],
  term ((174 : Rat) / 5) [(13, 3), (15, 1), (16, 1)],
  term ((-2762716 : Rat) / 2995) [(15, 2)],
  term ((658 : Rat) / 5) [(15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 9, terms 100 through 132. -/
theorem rs_R010_ueqv_R010NYN_block_09_0100_0132_valid :
    checkProductSumEq rs_R010_ueqv_R010NYN_partials_09_0100_0132
      rs_R010_ueqv_R010NYN_block_09_0100_0132 = true := by
  native_decide

end R010UeqvR010NYNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
