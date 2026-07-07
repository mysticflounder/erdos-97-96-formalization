/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NYYYY, term block 3:100-178

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NYYYYTermShards

/-- Generator polynomial 3 for relaxed split surplus certificate `R009:u=v:R009NYYYY`. -/
def rs_R009_ueqv_R009NYYYY_generator_03_0100_0178 : Poly :=
[
  term (-2 : Rat) [(4, 1)],
  term (1 : Rat) [(4, 2)],
  term (1 : Rat) [(5, 2)],
  term (2 : Rat) [(8, 1)],
  term (-1 : Rat) [(8, 2)],
  term (-1 : Rat) [(9, 2)]
]

/-- Coefficient term 100 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NYYYY_coefficient_03_0100 : Poly :=
[
  term ((40 : Rat) / 29) [(9, 1), (12, 1), (13, 1), (15, 2)]
]

/-- Partial product 100 for generator 3. -/
def rs_R009_ueqv_R009NYYYY_partial_03_0100 : Poly :=
[
  term ((-80 : Rat) / 29) [(4, 1), (9, 1), (12, 1), (13, 1), (15, 2)],
  term ((40 : Rat) / 29) [(4, 2), (9, 1), (12, 1), (13, 1), (15, 2)],
  term ((40 : Rat) / 29) [(5, 2), (9, 1), (12, 1), (13, 1), (15, 2)],
  term ((80 : Rat) / 29) [(8, 1), (9, 1), (12, 1), (13, 1), (15, 2)],
  term ((-40 : Rat) / 29) [(8, 2), (9, 1), (12, 1), (13, 1), (15, 2)],
  term ((-40 : Rat) / 29) [(9, 3), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 3. -/
theorem rs_R009_ueqv_R009NYYYY_partial_03_0100_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_03_0100
        rs_R009_ueqv_R009NYYYY_generator_03_0100_0178 =
      rs_R009_ueqv_R009NYYYY_partial_03_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NYYYY_coefficient_03_0101 : Poly :=
[
  term ((46 : Rat) / 29) [(9, 1), (12, 1), (15, 1)]
]

/-- Partial product 101 for generator 3. -/
def rs_R009_ueqv_R009NYYYY_partial_03_0101 : Poly :=
[
  term ((-92 : Rat) / 29) [(4, 1), (9, 1), (12, 1), (15, 1)],
  term ((46 : Rat) / 29) [(4, 2), (9, 1), (12, 1), (15, 1)],
  term ((46 : Rat) / 29) [(5, 2), (9, 1), (12, 1), (15, 1)],
  term ((92 : Rat) / 29) [(8, 1), (9, 1), (12, 1), (15, 1)],
  term ((-46 : Rat) / 29) [(8, 2), (9, 1), (12, 1), (15, 1)],
  term ((-46 : Rat) / 29) [(9, 3), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 3. -/
theorem rs_R009_ueqv_R009NYYYY_partial_03_0101_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_03_0101
        rs_R009_ueqv_R009NYYYY_generator_03_0100_0178 =
      rs_R009_ueqv_R009NYYYY_partial_03_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NYYYY_coefficient_03_0102 : Poly :=
[
  term ((-15 : Rat) / 16) [(9, 1), (13, 1)]
]

/-- Partial product 102 for generator 3. -/
def rs_R009_ueqv_R009NYYYY_partial_03_0102 : Poly :=
[
  term ((15 : Rat) / 8) [(4, 1), (9, 1), (13, 1)],
  term ((-15 : Rat) / 16) [(4, 2), (9, 1), (13, 1)],
  term ((-15 : Rat) / 16) [(5, 2), (9, 1), (13, 1)],
  term ((-15 : Rat) / 8) [(8, 1), (9, 1), (13, 1)],
  term ((15 : Rat) / 16) [(8, 2), (9, 1), (13, 1)],
  term ((15 : Rat) / 16) [(9, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 3. -/
theorem rs_R009_ueqv_R009NYYYY_partial_03_0102_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_03_0102
        rs_R009_ueqv_R009NYYYY_generator_03_0100_0178 =
      rs_R009_ueqv_R009NYYYY_partial_03_0102 := by
  native_decide

/-- Coefficient term 103 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NYYYY_coefficient_03_0103 : Poly :=
[
  term ((-827 : Rat) / 116) [(9, 1), (13, 1), (15, 2)]
]

/-- Partial product 103 for generator 3. -/
def rs_R009_ueqv_R009NYYYY_partial_03_0103 : Poly :=
[
  term ((827 : Rat) / 58) [(4, 1), (9, 1), (13, 1), (15, 2)],
  term ((-827 : Rat) / 116) [(4, 2), (9, 1), (13, 1), (15, 2)],
  term ((-827 : Rat) / 116) [(5, 2), (9, 1), (13, 1), (15, 2)],
  term ((-827 : Rat) / 58) [(8, 1), (9, 1), (13, 1), (15, 2)],
  term ((827 : Rat) / 116) [(8, 2), (9, 1), (13, 1), (15, 2)],
  term ((827 : Rat) / 116) [(9, 3), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 103 for generator 3. -/
theorem rs_R009_ueqv_R009NYYYY_partial_03_0103_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_03_0103
        rs_R009_ueqv_R009NYYYY_generator_03_0100_0178 =
      rs_R009_ueqv_R009NYYYY_partial_03_0103 := by
  native_decide

/-- Coefficient term 104 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NYYYY_coefficient_03_0104 : Poly :=
[
  term ((40 : Rat) / 29) [(9, 1), (13, 1), (15, 4)]
]

/-- Partial product 104 for generator 3. -/
def rs_R009_ueqv_R009NYYYY_partial_03_0104 : Poly :=
[
  term ((-80 : Rat) / 29) [(4, 1), (9, 1), (13, 1), (15, 4)],
  term ((40 : Rat) / 29) [(4, 2), (9, 1), (13, 1), (15, 4)],
  term ((40 : Rat) / 29) [(5, 2), (9, 1), (13, 1), (15, 4)],
  term ((80 : Rat) / 29) [(8, 1), (9, 1), (13, 1), (15, 4)],
  term ((-40 : Rat) / 29) [(8, 2), (9, 1), (13, 1), (15, 4)],
  term ((-40 : Rat) / 29) [(9, 3), (13, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 104 for generator 3. -/
theorem rs_R009_ueqv_R009NYYYY_partial_03_0104_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_03_0104
        rs_R009_ueqv_R009NYYYY_generator_03_0100_0178 =
      rs_R009_ueqv_R009NYYYY_partial_03_0104 := by
  native_decide

/-- Coefficient term 105 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NYYYY_coefficient_03_0105 : Poly :=
[
  term ((-5 : Rat) / 2) [(9, 1), (13, 2), (15, 1)]
]

/-- Partial product 105 for generator 3. -/
def rs_R009_ueqv_R009NYYYY_partial_03_0105 : Poly :=
[
  term (5 : Rat) [(4, 1), (9, 1), (13, 2), (15, 1)],
  term ((-5 : Rat) / 2) [(4, 2), (9, 1), (13, 2), (15, 1)],
  term ((-5 : Rat) / 2) [(5, 2), (9, 1), (13, 2), (15, 1)],
  term (-5 : Rat) [(8, 1), (9, 1), (13, 2), (15, 1)],
  term ((5 : Rat) / 2) [(8, 2), (9, 1), (13, 2), (15, 1)],
  term ((5 : Rat) / 2) [(9, 3), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 105 for generator 3. -/
theorem rs_R009_ueqv_R009NYYYY_partial_03_0105_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_03_0105
        rs_R009_ueqv_R009NYYYY_generator_03_0100_0178 =
      rs_R009_ueqv_R009NYYYY_partial_03_0105 := by
  native_decide

/-- Coefficient term 106 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NYYYY_coefficient_03_0106 : Poly :=
[
  term ((-80 : Rat) / 29) [(9, 1), (13, 2), (15, 3)]
]

/-- Partial product 106 for generator 3. -/
def rs_R009_ueqv_R009NYYYY_partial_03_0106 : Poly :=
[
  term ((160 : Rat) / 29) [(4, 1), (9, 1), (13, 2), (15, 3)],
  term ((-80 : Rat) / 29) [(4, 2), (9, 1), (13, 2), (15, 3)],
  term ((-80 : Rat) / 29) [(5, 2), (9, 1), (13, 2), (15, 3)],
  term ((-160 : Rat) / 29) [(8, 1), (9, 1), (13, 2), (15, 3)],
  term ((80 : Rat) / 29) [(8, 2), (9, 1), (13, 2), (15, 3)],
  term ((80 : Rat) / 29) [(9, 3), (13, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 106 for generator 3. -/
theorem rs_R009_ueqv_R009NYYYY_partial_03_0106_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_03_0106
        rs_R009_ueqv_R009NYYYY_generator_03_0100_0178 =
      rs_R009_ueqv_R009NYYYY_partial_03_0106 := by
  native_decide

/-- Coefficient term 107 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NYYYY_coefficient_03_0107 : Poly :=
[
  term ((-607 : Rat) / 232) [(9, 1), (15, 1)]
]

/-- Partial product 107 for generator 3. -/
def rs_R009_ueqv_R009NYYYY_partial_03_0107 : Poly :=
[
  term ((607 : Rat) / 116) [(4, 1), (9, 1), (15, 1)],
  term ((-607 : Rat) / 232) [(4, 2), (9, 1), (15, 1)],
  term ((-607 : Rat) / 232) [(5, 2), (9, 1), (15, 1)],
  term ((-607 : Rat) / 116) [(8, 1), (9, 1), (15, 1)],
  term ((607 : Rat) / 232) [(8, 2), (9, 1), (15, 1)],
  term ((607 : Rat) / 232) [(9, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 107 for generator 3. -/
theorem rs_R009_ueqv_R009NYYYY_partial_03_0107_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_03_0107
        rs_R009_ueqv_R009NYYYY_generator_03_0100_0178 =
      rs_R009_ueqv_R009NYYYY_partial_03_0107 := by
  native_decide

/-- Coefficient term 108 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NYYYY_coefficient_03_0108 : Poly :=
[
  term ((213 : Rat) / 58) [(9, 1), (15, 3)]
]

/-- Partial product 108 for generator 3. -/
def rs_R009_ueqv_R009NYYYY_partial_03_0108 : Poly :=
[
  term ((-213 : Rat) / 29) [(4, 1), (9, 1), (15, 3)],
  term ((213 : Rat) / 58) [(4, 2), (9, 1), (15, 3)],
  term ((213 : Rat) / 58) [(5, 2), (9, 1), (15, 3)],
  term ((213 : Rat) / 29) [(8, 1), (9, 1), (15, 3)],
  term ((-213 : Rat) / 58) [(8, 2), (9, 1), (15, 3)],
  term ((-213 : Rat) / 58) [(9, 3), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 108 for generator 3. -/
theorem rs_R009_ueqv_R009NYYYY_partial_03_0108_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_03_0108
        rs_R009_ueqv_R009NYYYY_generator_03_0100_0178 =
      rs_R009_ueqv_R009NYYYY_partial_03_0108 := by
  native_decide

/-- Coefficient term 109 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NYYYY_coefficient_03_0109 : Poly :=
[
  term ((1116194112 : Rat) / 33189485) [(10, 1), (11, 1), (15, 1)]
]

/-- Partial product 109 for generator 3. -/
def rs_R009_ueqv_R009NYYYY_partial_03_0109 : Poly :=
[
  term ((-2232388224 : Rat) / 33189485) [(4, 1), (10, 1), (11, 1), (15, 1)],
  term ((1116194112 : Rat) / 33189485) [(4, 2), (10, 1), (11, 1), (15, 1)],
  term ((1116194112 : Rat) / 33189485) [(5, 2), (10, 1), (11, 1), (15, 1)],
  term ((2232388224 : Rat) / 33189485) [(8, 1), (10, 1), (11, 1), (15, 1)],
  term ((-1116194112 : Rat) / 33189485) [(8, 2), (10, 1), (11, 1), (15, 1)],
  term ((-1116194112 : Rat) / 33189485) [(9, 2), (10, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 109 for generator 3. -/
theorem rs_R009_ueqv_R009NYYYY_partial_03_0109_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_03_0109
        rs_R009_ueqv_R009NYYYY_generator_03_0100_0178 =
      rs_R009_ueqv_R009NYYYY_partial_03_0109 := by
  native_decide

/-- Coefficient term 110 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NYYYY_coefficient_03_0110 : Poly :=
[
  term ((-211968 : Rat) / 32699) [(10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 110 for generator 3. -/
def rs_R009_ueqv_R009NYYYY_partial_03_0110 : Poly :=
[
  term ((423936 : Rat) / 32699) [(4, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-211968 : Rat) / 32699) [(4, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-211968 : Rat) / 32699) [(5, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-423936 : Rat) / 32699) [(8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((211968 : Rat) / 32699) [(8, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((211968 : Rat) / 32699) [(9, 2), (10, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 110 for generator 3. -/
theorem rs_R009_ueqv_R009NYYYY_partial_03_0110_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_03_0110
        rs_R009_ueqv_R009NYYYY_generator_03_0100_0178 =
      rs_R009_ueqv_R009NYYYY_partial_03_0110 := by
  native_decide

/-- Coefficient term 111 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NYYYY_coefficient_03_0111 : Poly :=
[
  term ((-31005392 : Rat) / 33189485) [(10, 1), (11, 1), (15, 3)]
]

/-- Partial product 111 for generator 3. -/
def rs_R009_ueqv_R009NYYYY_partial_03_0111 : Poly :=
[
  term ((62010784 : Rat) / 33189485) [(4, 1), (10, 1), (11, 1), (15, 3)],
  term ((-31005392 : Rat) / 33189485) [(4, 2), (10, 1), (11, 1), (15, 3)],
  term ((-31005392 : Rat) / 33189485) [(5, 2), (10, 1), (11, 1), (15, 3)],
  term ((-62010784 : Rat) / 33189485) [(8, 1), (10, 1), (11, 1), (15, 3)],
  term ((31005392 : Rat) / 33189485) [(8, 2), (10, 1), (11, 1), (15, 3)],
  term ((31005392 : Rat) / 33189485) [(9, 2), (10, 1), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 111 for generator 3. -/
theorem rs_R009_ueqv_R009NYYYY_partial_03_0111_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_03_0111
        rs_R009_ueqv_R009NYYYY_generator_03_0100_0178 =
      rs_R009_ueqv_R009NYYYY_partial_03_0111 := by
  native_decide

/-- Coefficient term 112 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NYYYY_coefficient_03_0112 : Poly :=
[
  term ((5888 : Rat) / 32699) [(10, 1), (11, 1), (15, 3), (16, 1)]
]

/-- Partial product 112 for generator 3. -/
def rs_R009_ueqv_R009NYYYY_partial_03_0112 : Poly :=
[
  term ((-11776 : Rat) / 32699) [(4, 1), (10, 1), (11, 1), (15, 3), (16, 1)],
  term ((5888 : Rat) / 32699) [(4, 2), (10, 1), (11, 1), (15, 3), (16, 1)],
  term ((5888 : Rat) / 32699) [(5, 2), (10, 1), (11, 1), (15, 3), (16, 1)],
  term ((11776 : Rat) / 32699) [(8, 1), (10, 1), (11, 1), (15, 3), (16, 1)],
  term ((-5888 : Rat) / 32699) [(8, 2), (10, 1), (11, 1), (15, 3), (16, 1)],
  term ((-5888 : Rat) / 32699) [(9, 2), (10, 1), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 112 for generator 3. -/
theorem rs_R009_ueqv_R009NYYYY_partial_03_0112_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_03_0112
        rs_R009_ueqv_R009NYYYY_generator_03_0100_0178 =
      rs_R009_ueqv_R009NYYYY_partial_03_0112 := by
  native_decide

/-- Coefficient term 113 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NYYYY_coefficient_03_0113 : Poly :=
[
  term ((-3986508072 : Rat) / 33189485) [(10, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 113 for generator 3. -/
def rs_R009_ueqv_R009NYYYY_partial_03_0113 : Poly :=
[
  term ((7973016144 : Rat) / 33189485) [(4, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((-3986508072 : Rat) / 33189485) [(4, 2), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((-3986508072 : Rat) / 33189485) [(5, 2), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((-7973016144 : Rat) / 33189485) [(8, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((3986508072 : Rat) / 33189485) [(8, 2), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((3986508072 : Rat) / 33189485) [(9, 2), (10, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 113 for generator 3. -/
theorem rs_R009_ueqv_R009NYYYY_partial_03_0113_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_03_0113
        rs_R009_ueqv_R009NYYYY_generator_03_0100_0178 =
      rs_R009_ueqv_R009NYYYY_partial_03_0113 := by
  native_decide

/-- Coefficient term 114 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NYYYY_coefficient_03_0114 : Poly :=
[
  term ((762480 : Rat) / 32699) [(10, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 114 for generator 3. -/
def rs_R009_ueqv_R009NYYYY_partial_03_0114 : Poly :=
[
  term ((-1524960 : Rat) / 32699) [(4, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((762480 : Rat) / 32699) [(4, 2), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((762480 : Rat) / 32699) [(5, 2), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1524960 : Rat) / 32699) [(8, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-762480 : Rat) / 32699) [(8, 2), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-762480 : Rat) / 32699) [(9, 2), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 114 for generator 3. -/
theorem rs_R009_ueqv_R009NYYYY_partial_03_0114_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_03_0114
        rs_R009_ueqv_R009NYYYY_generator_03_0100_0178 =
      rs_R009_ueqv_R009NYYYY_partial_03_0114 := by
  native_decide

/-- Coefficient term 115 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NYYYY_coefficient_03_0115 : Poly :=
[
  term ((-2989881054 : Rat) / 33189485) [(10, 1), (12, 1), (15, 2)]
]

/-- Partial product 115 for generator 3. -/
def rs_R009_ueqv_R009NYYYY_partial_03_0115 : Poly :=
[
  term ((5979762108 : Rat) / 33189485) [(4, 1), (10, 1), (12, 1), (15, 2)],
  term ((-2989881054 : Rat) / 33189485) [(4, 2), (10, 1), (12, 1), (15, 2)],
  term ((-2989881054 : Rat) / 33189485) [(5, 2), (10, 1), (12, 1), (15, 2)],
  term ((-5979762108 : Rat) / 33189485) [(8, 1), (10, 1), (12, 1), (15, 2)],
  term ((2989881054 : Rat) / 33189485) [(8, 2), (10, 1), (12, 1), (15, 2)],
  term ((2989881054 : Rat) / 33189485) [(9, 2), (10, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 115 for generator 3. -/
theorem rs_R009_ueqv_R009NYYYY_partial_03_0115_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_03_0115
        rs_R009_ueqv_R009NYYYY_generator_03_0100_0178 =
      rs_R009_ueqv_R009NYYYY_partial_03_0115 := by
  native_decide

/-- Coefficient term 116 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NYYYY_coefficient_03_0116 : Poly :=
[
  term ((571860 : Rat) / 32699) [(10, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 116 for generator 3. -/
def rs_R009_ueqv_R009NYYYY_partial_03_0116 : Poly :=
[
  term ((-1143720 : Rat) / 32699) [(4, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((571860 : Rat) / 32699) [(4, 2), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((571860 : Rat) / 32699) [(5, 2), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((1143720 : Rat) / 32699) [(8, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-571860 : Rat) / 32699) [(8, 2), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-571860 : Rat) / 32699) [(9, 2), (10, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 116 for generator 3. -/
theorem rs_R009_ueqv_R009NYYYY_partial_03_0116_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_03_0116
        rs_R009_ueqv_R009NYYYY_generator_03_0100_0178 =
      rs_R009_ueqv_R009NYYYY_partial_03_0116 := by
  native_decide

/-- Coefficient term 117 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NYYYY_coefficient_03_0117 : Poly :=
[
  term ((-48543810283 : Rat) / 199136910) [(10, 1), (13, 1), (15, 1)]
]

/-- Partial product 117 for generator 3. -/
def rs_R009_ueqv_R009NYYYY_partial_03_0117 : Poly :=
[
  term ((48543810283 : Rat) / 99568455) [(4, 1), (10, 1), (13, 1), (15, 1)],
  term ((-48543810283 : Rat) / 199136910) [(4, 2), (10, 1), (13, 1), (15, 1)],
  term ((-48543810283 : Rat) / 199136910) [(5, 2), (10, 1), (13, 1), (15, 1)],
  term ((-48543810283 : Rat) / 99568455) [(8, 1), (10, 1), (13, 1), (15, 1)],
  term ((48543810283 : Rat) / 199136910) [(8, 2), (10, 1), (13, 1), (15, 1)],
  term ((48543810283 : Rat) / 199136910) [(9, 2), (10, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 117 for generator 3. -/
theorem rs_R009_ueqv_R009NYYYY_partial_03_0117_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_03_0117
        rs_R009_ueqv_R009NYYYY_generator_03_0100_0178 =
      rs_R009_ueqv_R009NYYYY_partial_03_0117 := by
  native_decide

/-- Coefficient term 118 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NYYYY_coefficient_03_0118 : Poly :=
[
  term ((4670300 : Rat) / 98097) [(10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 118 for generator 3. -/
def rs_R009_ueqv_R009NYYYY_partial_03_0118 : Poly :=
[
  term ((-9340600 : Rat) / 98097) [(4, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((4670300 : Rat) / 98097) [(4, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((4670300 : Rat) / 98097) [(5, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((9340600 : Rat) / 98097) [(8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4670300 : Rat) / 98097) [(8, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4670300 : Rat) / 98097) [(9, 2), (10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 118 for generator 3. -/
theorem rs_R009_ueqv_R009NYYYY_partial_03_0118_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_03_0118
        rs_R009_ueqv_R009NYYYY_generator_03_0100_0178 =
      rs_R009_ueqv_R009NYYYY_partial_03_0118 := by
  native_decide

/-- Coefficient term 119 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NYYYY_coefficient_03_0119 : Poly :=
[
  term ((1993254036 : Rat) / 33189485) [(10, 1), (13, 1), (15, 3)]
]

/-- Partial product 119 for generator 3. -/
def rs_R009_ueqv_R009NYYYY_partial_03_0119 : Poly :=
[
  term ((-3986508072 : Rat) / 33189485) [(4, 1), (10, 1), (13, 1), (15, 3)],
  term ((1993254036 : Rat) / 33189485) [(4, 2), (10, 1), (13, 1), (15, 3)],
  term ((1993254036 : Rat) / 33189485) [(5, 2), (10, 1), (13, 1), (15, 3)],
  term ((3986508072 : Rat) / 33189485) [(8, 1), (10, 1), (13, 1), (15, 3)],
  term ((-1993254036 : Rat) / 33189485) [(8, 2), (10, 1), (13, 1), (15, 3)],
  term ((-1993254036 : Rat) / 33189485) [(9, 2), (10, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 119 for generator 3. -/
theorem rs_R009_ueqv_R009NYYYY_partial_03_0119_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_03_0119
        rs_R009_ueqv_R009NYYYY_generator_03_0100_0178 =
      rs_R009_ueqv_R009NYYYY_partial_03_0119 := by
  native_decide

/-- Coefficient term 120 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NYYYY_coefficient_03_0120 : Poly :=
[
  term ((-381240 : Rat) / 32699) [(10, 1), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 120 for generator 3. -/
def rs_R009_ueqv_R009NYYYY_partial_03_0120 : Poly :=
[
  term ((762480 : Rat) / 32699) [(4, 1), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((-381240 : Rat) / 32699) [(4, 2), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((-381240 : Rat) / 32699) [(5, 2), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((-762480 : Rat) / 32699) [(8, 1), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((381240 : Rat) / 32699) [(8, 2), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((381240 : Rat) / 32699) [(9, 2), (10, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 120 for generator 3. -/
theorem rs_R009_ueqv_R009NYYYY_partial_03_0120_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_03_0120
        rs_R009_ueqv_R009NYYYY_generator_03_0100_0178 =
      rs_R009_ueqv_R009NYYYY_partial_03_0120 := by
  native_decide

/-- Coefficient term 121 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NYYYY_coefficient_03_0121 : Poly :=
[
  term ((7973016144 : Rat) / 33189485) [(10, 1), (13, 2), (15, 2)]
]

/-- Partial product 121 for generator 3. -/
def rs_R009_ueqv_R009NYYYY_partial_03_0121 : Poly :=
[
  term ((-15946032288 : Rat) / 33189485) [(4, 1), (10, 1), (13, 2), (15, 2)],
  term ((7973016144 : Rat) / 33189485) [(4, 2), (10, 1), (13, 2), (15, 2)],
  term ((7973016144 : Rat) / 33189485) [(5, 2), (10, 1), (13, 2), (15, 2)],
  term ((15946032288 : Rat) / 33189485) [(8, 1), (10, 1), (13, 2), (15, 2)],
  term ((-7973016144 : Rat) / 33189485) [(8, 2), (10, 1), (13, 2), (15, 2)],
  term ((-7973016144 : Rat) / 33189485) [(9, 2), (10, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 121 for generator 3. -/
theorem rs_R009_ueqv_R009NYYYY_partial_03_0121_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_03_0121
        rs_R009_ueqv_R009NYYYY_generator_03_0100_0178 =
      rs_R009_ueqv_R009NYYYY_partial_03_0121 := by
  native_decide

/-- Coefficient term 122 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NYYYY_coefficient_03_0122 : Poly :=
[
  term ((-1524960 : Rat) / 32699) [(10, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 122 for generator 3. -/
def rs_R009_ueqv_R009NYYYY_partial_03_0122 : Poly :=
[
  term ((3049920 : Rat) / 32699) [(4, 1), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((-1524960 : Rat) / 32699) [(4, 2), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((-1524960 : Rat) / 32699) [(5, 2), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((-3049920 : Rat) / 32699) [(8, 1), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((1524960 : Rat) / 32699) [(8, 2), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((1524960 : Rat) / 32699) [(9, 2), (10, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 122 for generator 3. -/
theorem rs_R009_ueqv_R009NYYYY_partial_03_0122_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_03_0122
        rs_R009_ueqv_R009NYYYY_generator_03_0100_0178 =
      rs_R009_ueqv_R009NYYYY_partial_03_0122 := by
  native_decide

/-- Coefficient term 123 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NYYYY_coefficient_03_0123 : Poly :=
[
  term ((3719562593 : Rat) / 199136910) [(10, 1), (15, 2)]
]

/-- Partial product 123 for generator 3. -/
def rs_R009_ueqv_R009NYYYY_partial_03_0123 : Poly :=
[
  term ((-3719562593 : Rat) / 99568455) [(4, 1), (10, 1), (15, 2)],
  term ((3719562593 : Rat) / 199136910) [(4, 2), (10, 1), (15, 2)],
  term ((3719562593 : Rat) / 199136910) [(5, 2), (10, 1), (15, 2)],
  term ((3719562593 : Rat) / 99568455) [(8, 1), (10, 1), (15, 2)],
  term ((-3719562593 : Rat) / 199136910) [(8, 2), (10, 1), (15, 2)],
  term ((-3719562593 : Rat) / 199136910) [(9, 2), (10, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 123 for generator 3. -/
theorem rs_R009_ueqv_R009NYYYY_partial_03_0123_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_03_0123
        rs_R009_ueqv_R009NYYYY_generator_03_0100_0178 =
      rs_R009_ueqv_R009NYYYY_partial_03_0123 := by
  native_decide

/-- Coefficient term 124 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NYYYY_coefficient_03_0124 : Poly :=
[
  term ((-357334 : Rat) / 98097) [(10, 1), (15, 2), (16, 1)]
]

/-- Partial product 124 for generator 3. -/
def rs_R009_ueqv_R009NYYYY_partial_03_0124 : Poly :=
[
  term ((714668 : Rat) / 98097) [(4, 1), (10, 1), (15, 2), (16, 1)],
  term ((-357334 : Rat) / 98097) [(4, 2), (10, 1), (15, 2), (16, 1)],
  term ((-357334 : Rat) / 98097) [(5, 2), (10, 1), (15, 2), (16, 1)],
  term ((-714668 : Rat) / 98097) [(8, 1), (10, 1), (15, 2), (16, 1)],
  term ((357334 : Rat) / 98097) [(8, 2), (10, 1), (15, 2), (16, 1)],
  term ((357334 : Rat) / 98097) [(9, 2), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 124 for generator 3. -/
theorem rs_R009_ueqv_R009NYYYY_partial_03_0124_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_03_0124
        rs_R009_ueqv_R009NYYYY_generator_03_0100_0178 =
      rs_R009_ueqv_R009NYYYY_partial_03_0124 := by
  native_decide

/-- Coefficient term 125 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NYYYY_coefficient_03_0125 : Poly :=
[
  term ((-2989881054 : Rat) / 33189485) [(10, 1), (15, 4)]
]

/-- Partial product 125 for generator 3. -/
def rs_R009_ueqv_R009NYYYY_partial_03_0125 : Poly :=
[
  term ((5979762108 : Rat) / 33189485) [(4, 1), (10, 1), (15, 4)],
  term ((-2989881054 : Rat) / 33189485) [(4, 2), (10, 1), (15, 4)],
  term ((-2989881054 : Rat) / 33189485) [(5, 2), (10, 1), (15, 4)],
  term ((-5979762108 : Rat) / 33189485) [(8, 1), (10, 1), (15, 4)],
  term ((2989881054 : Rat) / 33189485) [(8, 2), (10, 1), (15, 4)],
  term ((2989881054 : Rat) / 33189485) [(9, 2), (10, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 125 for generator 3. -/
theorem rs_R009_ueqv_R009NYYYY_partial_03_0125_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_03_0125
        rs_R009_ueqv_R009NYYYY_generator_03_0100_0178 =
      rs_R009_ueqv_R009NYYYY_partial_03_0125 := by
  native_decide

/-- Coefficient term 126 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NYYYY_coefficient_03_0126 : Poly :=
[
  term ((571860 : Rat) / 32699) [(10, 1), (15, 4), (16, 1)]
]

/-- Partial product 126 for generator 3. -/
def rs_R009_ueqv_R009NYYYY_partial_03_0126 : Poly :=
[
  term ((-1143720 : Rat) / 32699) [(4, 1), (10, 1), (15, 4), (16, 1)],
  term ((571860 : Rat) / 32699) [(4, 2), (10, 1), (15, 4), (16, 1)],
  term ((571860 : Rat) / 32699) [(5, 2), (10, 1), (15, 4), (16, 1)],
  term ((1143720 : Rat) / 32699) [(8, 1), (10, 1), (15, 4), (16, 1)],
  term ((-571860 : Rat) / 32699) [(8, 2), (10, 1), (15, 4), (16, 1)],
  term ((-571860 : Rat) / 32699) [(9, 2), (10, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 126 for generator 3. -/
theorem rs_R009_ueqv_R009NYYYY_partial_03_0126_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_03_0126
        rs_R009_ueqv_R009NYYYY_generator_03_0100_0178 =
      rs_R009_ueqv_R009NYYYY_partial_03_0126 := by
  native_decide

/-- Coefficient term 127 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NYYYY_coefficient_03_0127 : Poly :=
[
  term ((-2906755500 : Rat) / 6637897) [(11, 1), (12, 1), (13, 1), (15, 2)]
]

/-- Partial product 127 for generator 3. -/
def rs_R009_ueqv_R009NYYYY_partial_03_0127 : Poly :=
[
  term ((5813511000 : Rat) / 6637897) [(4, 1), (11, 1), (12, 1), (13, 1), (15, 2)],
  term ((-2906755500 : Rat) / 6637897) [(4, 2), (11, 1), (12, 1), (13, 1), (15, 2)],
  term ((-2906755500 : Rat) / 6637897) [(5, 2), (11, 1), (12, 1), (13, 1), (15, 2)],
  term ((-5813511000 : Rat) / 6637897) [(8, 1), (11, 1), (12, 1), (13, 1), (15, 2)],
  term ((2906755500 : Rat) / 6637897) [(8, 2), (11, 1), (12, 1), (13, 1), (15, 2)],
  term ((2906755500 : Rat) / 6637897) [(9, 2), (11, 1), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 127 for generator 3. -/
theorem rs_R009_ueqv_R009NYYYY_partial_03_0127_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_03_0127
        rs_R009_ueqv_R009NYYYY_generator_03_0100_0178 =
      rs_R009_ueqv_R009NYYYY_partial_03_0127 := by
  native_decide

/-- Coefficient term 128 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NYYYY_coefficient_03_0128 : Poly :=
[
  term ((2760000 : Rat) / 32699) [(11, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 128 for generator 3. -/
def rs_R009_ueqv_R009NYYYY_partial_03_0128 : Poly :=
[
  term ((-5520000 : Rat) / 32699) [(4, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((2760000 : Rat) / 32699) [(4, 2), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((2760000 : Rat) / 32699) [(5, 2), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((5520000 : Rat) / 32699) [(8, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-2760000 : Rat) / 32699) [(8, 2), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-2760000 : Rat) / 32699) [(9, 2), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 128 for generator 3. -/
theorem rs_R009_ueqv_R009NYYYY_partial_03_0128_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_03_0128
        rs_R009_ueqv_R009NYYYY_generator_03_0100_0178 =
      rs_R009_ueqv_R009NYYYY_partial_03_0128 := by
  native_decide

/-- Coefficient term 129 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NYYYY_coefficient_03_0129 : Poly :=
[
  term ((36134299337 : Rat) / 33189485) [(11, 1), (12, 1), (15, 1)]
]

/-- Partial product 129 for generator 3. -/
def rs_R009_ueqv_R009NYYYY_partial_03_0129 : Poly :=
[
  term ((-72268598674 : Rat) / 33189485) [(4, 1), (11, 1), (12, 1), (15, 1)],
  term ((36134299337 : Rat) / 33189485) [(4, 2), (11, 1), (12, 1), (15, 1)],
  term ((36134299337 : Rat) / 33189485) [(5, 2), (11, 1), (12, 1), (15, 1)],
  term ((72268598674 : Rat) / 33189485) [(8, 1), (11, 1), (12, 1), (15, 1)],
  term ((-36134299337 : Rat) / 33189485) [(8, 2), (11, 1), (12, 1), (15, 1)],
  term ((-36134299337 : Rat) / 33189485) [(9, 2), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 129 for generator 3. -/
theorem rs_R009_ueqv_R009NYYYY_partial_03_0129_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_03_0129
        rs_R009_ueqv_R009NYYYY_generator_03_0100_0178 =
      rs_R009_ueqv_R009NYYYY_partial_03_0129 := by
  native_decide

/-- Coefficient term 130 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NYYYY_coefficient_03_0130 : Poly :=
[
  term ((-6920562 : Rat) / 32699) [(11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 130 for generator 3. -/
def rs_R009_ueqv_R009NYYYY_partial_03_0130 : Poly :=
[
  term ((13841124 : Rat) / 32699) [(4, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-6920562 : Rat) / 32699) [(4, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-6920562 : Rat) / 32699) [(5, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-13841124 : Rat) / 32699) [(8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((6920562 : Rat) / 32699) [(8, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((6920562 : Rat) / 32699) [(9, 2), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 130 for generator 3. -/
theorem rs_R009_ueqv_R009NYYYY_partial_03_0130_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_03_0130
        rs_R009_ueqv_R009NYYYY_generator_03_0100_0178 =
      rs_R009_ueqv_R009NYYYY_partial_03_0130 := by
  native_decide

/-- Coefficient term 131 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NYYYY_coefficient_03_0131 : Poly :=
[
  term ((-3875674 : Rat) / 4741355) [(11, 1), (12, 1), (15, 3)]
]

/-- Partial product 131 for generator 3. -/
def rs_R009_ueqv_R009NYYYY_partial_03_0131 : Poly :=
[
  term ((7751348 : Rat) / 4741355) [(4, 1), (11, 1), (12, 1), (15, 3)],
  term ((-3875674 : Rat) / 4741355) [(4, 2), (11, 1), (12, 1), (15, 3)],
  term ((-3875674 : Rat) / 4741355) [(5, 2), (11, 1), (12, 1), (15, 3)],
  term ((-7751348 : Rat) / 4741355) [(8, 1), (11, 1), (12, 1), (15, 3)],
  term ((3875674 : Rat) / 4741355) [(8, 2), (11, 1), (12, 1), (15, 3)],
  term ((3875674 : Rat) / 4741355) [(9, 2), (11, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 131 for generator 3. -/
theorem rs_R009_ueqv_R009NYYYY_partial_03_0131_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_03_0131
        rs_R009_ueqv_R009NYYYY_generator_03_0100_0178 =
      rs_R009_ueqv_R009NYYYY_partial_03_0131 := by
  native_decide

/-- Coefficient term 132 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NYYYY_coefficient_03_0132 : Poly :=
[
  term ((5152 : Rat) / 32699) [(11, 1), (12, 1), (15, 3), (16, 1)]
]

/-- Partial product 132 for generator 3. -/
def rs_R009_ueqv_R009NYYYY_partial_03_0132 : Poly :=
[
  term ((-10304 : Rat) / 32699) [(4, 1), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((5152 : Rat) / 32699) [(4, 2), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((5152 : Rat) / 32699) [(5, 2), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((10304 : Rat) / 32699) [(8, 1), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((-5152 : Rat) / 32699) [(8, 2), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((-5152 : Rat) / 32699) [(9, 2), (11, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 132 for generator 3. -/
theorem rs_R009_ueqv_R009NYYYY_partial_03_0132_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_03_0132
        rs_R009_ueqv_R009NYYYY_generator_03_0100_0178 =
      rs_R009_ueqv_R009NYYYY_partial_03_0132 := by
  native_decide

/-- Coefficient term 133 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NYYYY_coefficient_03_0133 : Poly :=
[
  term ((-193687426123 : Rat) / 99568455) [(11, 1), (13, 1), (15, 2)]
]

/-- Partial product 133 for generator 3. -/
def rs_R009_ueqv_R009NYYYY_partial_03_0133 : Poly :=
[
  term ((387374852246 : Rat) / 99568455) [(4, 1), (11, 1), (13, 1), (15, 2)],
  term ((-193687426123 : Rat) / 99568455) [(4, 2), (11, 1), (13, 1), (15, 2)],
  term ((-193687426123 : Rat) / 99568455) [(5, 2), (11, 1), (13, 1), (15, 2)],
  term ((-387374852246 : Rat) / 99568455) [(8, 1), (11, 1), (13, 1), (15, 2)],
  term ((193687426123 : Rat) / 99568455) [(8, 2), (11, 1), (13, 1), (15, 2)],
  term ((193687426123 : Rat) / 99568455) [(9, 2), (11, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 133 for generator 3. -/
theorem rs_R009_ueqv_R009NYYYY_partial_03_0133_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_03_0133
        rs_R009_ueqv_R009NYYYY_generator_03_0100_0178 =
      rs_R009_ueqv_R009NYYYY_partial_03_0133 := by
  native_decide

/-- Coefficient term 134 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NYYYY_coefficient_03_0134 : Poly :=
[
  term ((37119556 : Rat) / 98097) [(11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 134 for generator 3. -/
def rs_R009_ueqv_R009NYYYY_partial_03_0134 : Poly :=
[
  term ((-74239112 : Rat) / 98097) [(4, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((37119556 : Rat) / 98097) [(4, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((37119556 : Rat) / 98097) [(5, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((74239112 : Rat) / 98097) [(8, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-37119556 : Rat) / 98097) [(8, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-37119556 : Rat) / 98097) [(9, 2), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 134 for generator 3. -/
theorem rs_R009_ueqv_R009NYYYY_partial_03_0134_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_03_0134
        rs_R009_ueqv_R009NYYYY_generator_03_0100_0178 =
      rs_R009_ueqv_R009NYYYY_partial_03_0134 := by
  native_decide

/-- Coefficient term 135 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NYYYY_coefficient_03_0135 : Poly :=
[
  term ((-2906755500 : Rat) / 6637897) [(11, 1), (13, 1), (15, 4)]
]

/-- Partial product 135 for generator 3. -/
def rs_R009_ueqv_R009NYYYY_partial_03_0135 : Poly :=
[
  term ((5813511000 : Rat) / 6637897) [(4, 1), (11, 1), (13, 1), (15, 4)],
  term ((-2906755500 : Rat) / 6637897) [(4, 2), (11, 1), (13, 1), (15, 4)],
  term ((-2906755500 : Rat) / 6637897) [(5, 2), (11, 1), (13, 1), (15, 4)],
  term ((-5813511000 : Rat) / 6637897) [(8, 1), (11, 1), (13, 1), (15, 4)],
  term ((2906755500 : Rat) / 6637897) [(8, 2), (11, 1), (13, 1), (15, 4)],
  term ((2906755500 : Rat) / 6637897) [(9, 2), (11, 1), (13, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 135 for generator 3. -/
theorem rs_R009_ueqv_R009NYYYY_partial_03_0135_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_03_0135
        rs_R009_ueqv_R009NYYYY_generator_03_0100_0178 =
      rs_R009_ueqv_R009NYYYY_partial_03_0135 := by
  native_decide

/-- Coefficient term 136 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NYYYY_coefficient_03_0136 : Poly :=
[
  term ((2760000 : Rat) / 32699) [(11, 1), (13, 1), (15, 4), (16, 1)]
]

/-- Partial product 136 for generator 3. -/
def rs_R009_ueqv_R009NYYYY_partial_03_0136 : Poly :=
[
  term ((-5520000 : Rat) / 32699) [(4, 1), (11, 1), (13, 1), (15, 4), (16, 1)],
  term ((2760000 : Rat) / 32699) [(4, 2), (11, 1), (13, 1), (15, 4), (16, 1)],
  term ((2760000 : Rat) / 32699) [(5, 2), (11, 1), (13, 1), (15, 4), (16, 1)],
  term ((5520000 : Rat) / 32699) [(8, 1), (11, 1), (13, 1), (15, 4), (16, 1)],
  term ((-2760000 : Rat) / 32699) [(8, 2), (11, 1), (13, 1), (15, 4), (16, 1)],
  term ((-2760000 : Rat) / 32699) [(9, 2), (11, 1), (13, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 136 for generator 3. -/
theorem rs_R009_ueqv_R009NYYYY_partial_03_0136_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_03_0136
        rs_R009_ueqv_R009NYYYY_generator_03_0100_0178 =
      rs_R009_ueqv_R009NYYYY_partial_03_0136 := by
  native_decide

/-- Coefficient term 137 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NYYYY_coefficient_03_0137 : Poly :=
[
  term ((5813511000 : Rat) / 6637897) [(11, 1), (13, 2), (15, 3)]
]

/-- Partial product 137 for generator 3. -/
def rs_R009_ueqv_R009NYYYY_partial_03_0137 : Poly :=
[
  term ((-11627022000 : Rat) / 6637897) [(4, 1), (11, 1), (13, 2), (15, 3)],
  term ((5813511000 : Rat) / 6637897) [(4, 2), (11, 1), (13, 2), (15, 3)],
  term ((5813511000 : Rat) / 6637897) [(5, 2), (11, 1), (13, 2), (15, 3)],
  term ((11627022000 : Rat) / 6637897) [(8, 1), (11, 1), (13, 2), (15, 3)],
  term ((-5813511000 : Rat) / 6637897) [(8, 2), (11, 1), (13, 2), (15, 3)],
  term ((-5813511000 : Rat) / 6637897) [(9, 2), (11, 1), (13, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 137 for generator 3. -/
theorem rs_R009_ueqv_R009NYYYY_partial_03_0137_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_03_0137
        rs_R009_ueqv_R009NYYYY_generator_03_0100_0178 =
      rs_R009_ueqv_R009NYYYY_partial_03_0137 := by
  native_decide

/-- Coefficient term 138 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NYYYY_coefficient_03_0138 : Poly :=
[
  term ((-5520000 : Rat) / 32699) [(11, 1), (13, 2), (15, 3), (16, 1)]
]

/-- Partial product 138 for generator 3. -/
def rs_R009_ueqv_R009NYYYY_partial_03_0138 : Poly :=
[
  term ((11040000 : Rat) / 32699) [(4, 1), (11, 1), (13, 2), (15, 3), (16, 1)],
  term ((-5520000 : Rat) / 32699) [(4, 2), (11, 1), (13, 2), (15, 3), (16, 1)],
  term ((-5520000 : Rat) / 32699) [(5, 2), (11, 1), (13, 2), (15, 3), (16, 1)],
  term ((-11040000 : Rat) / 32699) [(8, 1), (11, 1), (13, 2), (15, 3), (16, 1)],
  term ((5520000 : Rat) / 32699) [(8, 2), (11, 1), (13, 2), (15, 3), (16, 1)],
  term ((5520000 : Rat) / 32699) [(9, 2), (11, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 138 for generator 3. -/
theorem rs_R009_ueqv_R009NYYYY_partial_03_0138_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_03_0138
        rs_R009_ueqv_R009NYYYY_generator_03_0100_0178 =
      rs_R009_ueqv_R009NYYYY_partial_03_0138 := by
  native_decide

/-- Coefficient term 139 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NYYYY_coefficient_03_0139 : Poly :=
[
  term ((-9054528665 : Rat) / 11379252) [(11, 1), (15, 1)]
]

/-- Partial product 139 for generator 3. -/
def rs_R009_ueqv_R009NYYYY_partial_03_0139 : Poly :=
[
  term ((9054528665 : Rat) / 5689626) [(4, 1), (11, 1), (15, 1)],
  term ((-9054528665 : Rat) / 11379252) [(4, 2), (11, 1), (15, 1)],
  term ((-9054528665 : Rat) / 11379252) [(5, 2), (11, 1), (15, 1)],
  term ((-9054528665 : Rat) / 5689626) [(8, 1), (11, 1), (15, 1)],
  term ((9054528665 : Rat) / 11379252) [(8, 2), (11, 1), (15, 1)],
  term ((9054528665 : Rat) / 11379252) [(9, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 139 for generator 3. -/
theorem rs_R009_ueqv_R009NYYYY_partial_03_0139_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_03_0139
        rs_R009_ueqv_R009NYYYY_generator_03_0100_0178 =
      rs_R009_ueqv_R009NYYYY_partial_03_0139 := by
  native_decide

/-- Coefficient term 140 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NYYYY_coefficient_03_0140 : Poly :=
[
  term ((15159709 : Rat) / 98097) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 140 for generator 3. -/
def rs_R009_ueqv_R009NYYYY_partial_03_0140 : Poly :=
[
  term ((-30319418 : Rat) / 98097) [(4, 1), (11, 1), (15, 1), (16, 1)],
  term ((15159709 : Rat) / 98097) [(4, 2), (11, 1), (15, 1), (16, 1)],
  term ((15159709 : Rat) / 98097) [(5, 2), (11, 1), (15, 1), (16, 1)],
  term ((30319418 : Rat) / 98097) [(8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-15159709 : Rat) / 98097) [(8, 2), (11, 1), (15, 1), (16, 1)],
  term ((-15159709 : Rat) / 98097) [(9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 140 for generator 3. -/
theorem rs_R009_ueqv_R009NYYYY_partial_03_0140_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_03_0140
        rs_R009_ueqv_R009NYYYY_generator_03_0100_0178 =
      rs_R009_ueqv_R009NYYYY_partial_03_0140 := by
  native_decide

/-- Coefficient term 141 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NYYYY_coefficient_03_0141 : Poly :=
[
  term ((215878580 : Rat) / 228893) [(11, 1), (15, 3)]
]

/-- Partial product 141 for generator 3. -/
def rs_R009_ueqv_R009NYYYY_partial_03_0141 : Poly :=
[
  term ((-431757160 : Rat) / 228893) [(4, 1), (11, 1), (15, 3)],
  term ((215878580 : Rat) / 228893) [(4, 2), (11, 1), (15, 3)],
  term ((215878580 : Rat) / 228893) [(5, 2), (11, 1), (15, 3)],
  term ((431757160 : Rat) / 228893) [(8, 1), (11, 1), (15, 3)],
  term ((-215878580 : Rat) / 228893) [(8, 2), (11, 1), (15, 3)],
  term ((-215878580 : Rat) / 228893) [(9, 2), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 141 for generator 3. -/
theorem rs_R009_ueqv_R009NYYYY_partial_03_0141_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_03_0141
        rs_R009_ueqv_R009NYYYY_generator_03_0100_0178 =
      rs_R009_ueqv_R009NYYYY_partial_03_0141 := by
  native_decide

/-- Coefficient term 142 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NYYYY_coefficient_03_0142 : Poly :=
[
  term ((-5996182 : Rat) / 32699) [(11, 1), (15, 3), (16, 1)]
]

/-- Partial product 142 for generator 3. -/
def rs_R009_ueqv_R009NYYYY_partial_03_0142 : Poly :=
[
  term ((11992364 : Rat) / 32699) [(4, 1), (11, 1), (15, 3), (16, 1)],
  term ((-5996182 : Rat) / 32699) [(4, 2), (11, 1), (15, 3), (16, 1)],
  term ((-5996182 : Rat) / 32699) [(5, 2), (11, 1), (15, 3), (16, 1)],
  term ((-11992364 : Rat) / 32699) [(8, 1), (11, 1), (15, 3), (16, 1)],
  term ((5996182 : Rat) / 32699) [(8, 2), (11, 1), (15, 3), (16, 1)],
  term ((5996182 : Rat) / 32699) [(9, 2), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 142 for generator 3. -/
theorem rs_R009_ueqv_R009NYYYY_partial_03_0142_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_03_0142
        rs_R009_ueqv_R009NYYYY_generator_03_0100_0178 =
      rs_R009_ueqv_R009NYYYY_partial_03_0142 := by
  native_decide

/-- Coefficient term 143 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NYYYY_coefficient_03_0143 : Poly :=
[
  term ((6883197024 : Rat) / 33189485) [(11, 2), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 143 for generator 3. -/
def rs_R009_ueqv_R009NYYYY_partial_03_0143 : Poly :=
[
  term ((-13766394048 : Rat) / 33189485) [(4, 1), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((6883197024 : Rat) / 33189485) [(4, 2), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((6883197024 : Rat) / 33189485) [(5, 2), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((13766394048 : Rat) / 33189485) [(8, 1), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((-6883197024 : Rat) / 33189485) [(8, 2), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((-6883197024 : Rat) / 33189485) [(9, 2), (11, 2), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 143 for generator 3. -/
theorem rs_R009_ueqv_R009NYYYY_partial_03_0143_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_03_0143
        rs_R009_ueqv_R009NYYYY_generator_03_0100_0178 =
      rs_R009_ueqv_R009NYYYY_partial_03_0143 := by
  native_decide

/-- Coefficient term 144 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NYYYY_coefficient_03_0144 : Poly :=
[
  term ((-1307136 : Rat) / 32699) [(11, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 144 for generator 3. -/
def rs_R009_ueqv_R009NYYYY_partial_03_0144 : Poly :=
[
  term ((2614272 : Rat) / 32699) [(4, 1), (11, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1307136 : Rat) / 32699) [(4, 2), (11, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1307136 : Rat) / 32699) [(5, 2), (11, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2614272 : Rat) / 32699) [(8, 1), (11, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1307136 : Rat) / 32699) [(8, 2), (11, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1307136 : Rat) / 32699) [(9, 2), (11, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 144 for generator 3. -/
theorem rs_R009_ueqv_R009NYYYY_partial_03_0144_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_03_0144
        rs_R009_ueqv_R009NYYYY_generator_03_0100_0178 =
      rs_R009_ueqv_R009NYYYY_partial_03_0144 := by
  native_decide

/-- Coefficient term 145 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NYYYY_coefficient_03_0145 : Poly :=
[
  term ((-10107757792 : Rat) / 33189485) [(11, 2), (12, 1), (15, 2)]
]

/-- Partial product 145 for generator 3. -/
def rs_R009_ueqv_R009NYYYY_partial_03_0145 : Poly :=
[
  term ((20215515584 : Rat) / 33189485) [(4, 1), (11, 2), (12, 1), (15, 2)],
  term ((-10107757792 : Rat) / 33189485) [(4, 2), (11, 2), (12, 1), (15, 2)],
  term ((-10107757792 : Rat) / 33189485) [(5, 2), (11, 2), (12, 1), (15, 2)],
  term ((-20215515584 : Rat) / 33189485) [(8, 1), (11, 2), (12, 1), (15, 2)],
  term ((10107757792 : Rat) / 33189485) [(8, 2), (11, 2), (12, 1), (15, 2)],
  term ((10107757792 : Rat) / 33189485) [(9, 2), (11, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 145 for generator 3. -/
theorem rs_R009_ueqv_R009NYYYY_partial_03_0145_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_03_0145
        rs_R009_ueqv_R009NYYYY_generator_03_0100_0178 =
      rs_R009_ueqv_R009NYYYY_partial_03_0145 := by
  native_decide

/-- Coefficient term 146 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NYYYY_coefficient_03_0146 : Poly :=
[
  term ((1919488 : Rat) / 32699) [(11, 2), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 146 for generator 3. -/
def rs_R009_ueqv_R009NYYYY_partial_03_0146 : Poly :=
[
  term ((-3838976 : Rat) / 32699) [(4, 1), (11, 2), (12, 1), (15, 2), (16, 1)],
  term ((1919488 : Rat) / 32699) [(4, 2), (11, 2), (12, 1), (15, 2), (16, 1)],
  term ((1919488 : Rat) / 32699) [(5, 2), (11, 2), (12, 1), (15, 2), (16, 1)],
  term ((3838976 : Rat) / 32699) [(8, 1), (11, 2), (12, 1), (15, 2), (16, 1)],
  term ((-1919488 : Rat) / 32699) [(8, 2), (11, 2), (12, 1), (15, 2), (16, 1)],
  term ((-1919488 : Rat) / 32699) [(9, 2), (11, 2), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 146 for generator 3. -/
theorem rs_R009_ueqv_R009NYYYY_partial_03_0146_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_03_0146
        rs_R009_ueqv_R009NYYYY_generator_03_0100_0178 =
      rs_R009_ueqv_R009NYYYY_partial_03_0146 := by
  native_decide

/-- Coefficient term 147 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NYYYY_coefficient_03_0147 : Poly :=
[
  term ((-5239911248 : Rat) / 33189485) [(11, 2), (13, 1), (15, 1)]
]

/-- Partial product 147 for generator 3. -/
def rs_R009_ueqv_R009NYYYY_partial_03_0147 : Poly :=
[
  term ((10479822496 : Rat) / 33189485) [(4, 1), (11, 2), (13, 1), (15, 1)],
  term ((-5239911248 : Rat) / 33189485) [(4, 2), (11, 2), (13, 1), (15, 1)],
  term ((-5239911248 : Rat) / 33189485) [(5, 2), (11, 2), (13, 1), (15, 1)],
  term ((-10479822496 : Rat) / 33189485) [(8, 1), (11, 2), (13, 1), (15, 1)],
  term ((5239911248 : Rat) / 33189485) [(8, 2), (11, 2), (13, 1), (15, 1)],
  term ((5239911248 : Rat) / 33189485) [(9, 2), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 147 for generator 3. -/
theorem rs_R009_ueqv_R009NYYYY_partial_03_0147_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_03_0147
        rs_R009_ueqv_R009NYYYY_generator_03_0100_0178 =
      rs_R009_ueqv_R009NYYYY_partial_03_0147 := by
  native_decide

/-- Coefficient term 148 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NYYYY_coefficient_03_0148 : Poly :=
[
  term ((995072 : Rat) / 32699) [(11, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 148 for generator 3. -/
def rs_R009_ueqv_R009NYYYY_partial_03_0148 : Poly :=
[
  term ((-1990144 : Rat) / 32699) [(4, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((995072 : Rat) / 32699) [(4, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((995072 : Rat) / 32699) [(5, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((1990144 : Rat) / 32699) [(8, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-995072 : Rat) / 32699) [(8, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-995072 : Rat) / 32699) [(9, 2), (11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 148 for generator 3. -/
theorem rs_R009_ueqv_R009NYYYY_partial_03_0148_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_03_0148
        rs_R009_ueqv_R009NYYYY_generator_03_0100_0178 =
      rs_R009_ueqv_R009NYYYY_partial_03_0148 := by
  native_decide

/-- Coefficient term 149 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NYYYY_coefficient_03_0149 : Poly :=
[
  term ((27532788096 : Rat) / 33189485) [(11, 2), (13, 1), (15, 3)]
]

/-- Partial product 149 for generator 3. -/
def rs_R009_ueqv_R009NYYYY_partial_03_0149 : Poly :=
[
  term ((-55065576192 : Rat) / 33189485) [(4, 1), (11, 2), (13, 1), (15, 3)],
  term ((27532788096 : Rat) / 33189485) [(4, 2), (11, 2), (13, 1), (15, 3)],
  term ((27532788096 : Rat) / 33189485) [(5, 2), (11, 2), (13, 1), (15, 3)],
  term ((55065576192 : Rat) / 33189485) [(8, 1), (11, 2), (13, 1), (15, 3)],
  term ((-27532788096 : Rat) / 33189485) [(8, 2), (11, 2), (13, 1), (15, 3)],
  term ((-27532788096 : Rat) / 33189485) [(9, 2), (11, 2), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 149 for generator 3. -/
theorem rs_R009_ueqv_R009NYYYY_partial_03_0149_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_03_0149
        rs_R009_ueqv_R009NYYYY_generator_03_0100_0178 =
      rs_R009_ueqv_R009NYYYY_partial_03_0149 := by
  native_decide

/-- Coefficient term 150 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NYYYY_coefficient_03_0150 : Poly :=
[
  term ((-5228544 : Rat) / 32699) [(11, 2), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 150 for generator 3. -/
def rs_R009_ueqv_R009NYYYY_partial_03_0150 : Poly :=
[
  term ((10457088 : Rat) / 32699) [(4, 1), (11, 2), (13, 1), (15, 3), (16, 1)],
  term ((-5228544 : Rat) / 32699) [(4, 2), (11, 2), (13, 1), (15, 3), (16, 1)],
  term ((-5228544 : Rat) / 32699) [(5, 2), (11, 2), (13, 1), (15, 3), (16, 1)],
  term ((-10457088 : Rat) / 32699) [(8, 1), (11, 2), (13, 1), (15, 3), (16, 1)],
  term ((5228544 : Rat) / 32699) [(8, 2), (11, 2), (13, 1), (15, 3), (16, 1)],
  term ((5228544 : Rat) / 32699) [(9, 2), (11, 2), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 150 for generator 3. -/
theorem rs_R009_ueqv_R009NYYYY_partial_03_0150_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_03_0150
        rs_R009_ueqv_R009NYYYY_generator_03_0100_0178 =
      rs_R009_ueqv_R009NYYYY_partial_03_0150 := by
  native_decide

/-- Coefficient term 151 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NYYYY_coefficient_03_0151 : Poly :=
[
  term ((-13766394048 : Rat) / 33189485) [(11, 2), (13, 2), (15, 2)]
]

/-- Partial product 151 for generator 3. -/
def rs_R009_ueqv_R009NYYYY_partial_03_0151 : Poly :=
[
  term ((27532788096 : Rat) / 33189485) [(4, 1), (11, 2), (13, 2), (15, 2)],
  term ((-13766394048 : Rat) / 33189485) [(4, 2), (11, 2), (13, 2), (15, 2)],
  term ((-13766394048 : Rat) / 33189485) [(5, 2), (11, 2), (13, 2), (15, 2)],
  term ((-27532788096 : Rat) / 33189485) [(8, 1), (11, 2), (13, 2), (15, 2)],
  term ((13766394048 : Rat) / 33189485) [(8, 2), (11, 2), (13, 2), (15, 2)],
  term ((13766394048 : Rat) / 33189485) [(9, 2), (11, 2), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 151 for generator 3. -/
theorem rs_R009_ueqv_R009NYYYY_partial_03_0151_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_03_0151
        rs_R009_ueqv_R009NYYYY_generator_03_0100_0178 =
      rs_R009_ueqv_R009NYYYY_partial_03_0151 := by
  native_decide

/-- Coefficient term 152 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NYYYY_coefficient_03_0152 : Poly :=
[
  term ((2614272 : Rat) / 32699) [(11, 2), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 152 for generator 3. -/
def rs_R009_ueqv_R009NYYYY_partial_03_0152 : Poly :=
[
  term ((-5228544 : Rat) / 32699) [(4, 1), (11, 2), (13, 2), (15, 2), (16, 1)],
  term ((2614272 : Rat) / 32699) [(4, 2), (11, 2), (13, 2), (15, 2), (16, 1)],
  term ((2614272 : Rat) / 32699) [(5, 2), (11, 2), (13, 2), (15, 2), (16, 1)],
  term ((5228544 : Rat) / 32699) [(8, 1), (11, 2), (13, 2), (15, 2), (16, 1)],
  term ((-2614272 : Rat) / 32699) [(8, 2), (11, 2), (13, 2), (15, 2), (16, 1)],
  term ((-2614272 : Rat) / 32699) [(9, 2), (11, 2), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 152 for generator 3. -/
theorem rs_R009_ueqv_R009NYYYY_partial_03_0152_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_03_0152
        rs_R009_ueqv_R009NYYYY_generator_03_0100_0178 =
      rs_R009_ueqv_R009NYYYY_partial_03_0152 := by
  native_decide

/-- Coefficient term 153 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NYYYY_coefficient_03_0153 : Poly :=
[
  term ((9774449828 : Rat) / 33189485) [(11, 2), (15, 2)]
]

/-- Partial product 153 for generator 3. -/
def rs_R009_ueqv_R009NYYYY_partial_03_0153 : Poly :=
[
  term ((-19548899656 : Rat) / 33189485) [(4, 1), (11, 2), (15, 2)],
  term ((9774449828 : Rat) / 33189485) [(4, 2), (11, 2), (15, 2)],
  term ((9774449828 : Rat) / 33189485) [(5, 2), (11, 2), (15, 2)],
  term ((19548899656 : Rat) / 33189485) [(8, 1), (11, 2), (15, 2)],
  term ((-9774449828 : Rat) / 33189485) [(8, 2), (11, 2), (15, 2)],
  term ((-9774449828 : Rat) / 33189485) [(9, 2), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 153 for generator 3. -/
theorem rs_R009_ueqv_R009NYYYY_partial_03_0153_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_03_0153
        rs_R009_ueqv_R009NYYYY_generator_03_0100_0178 =
      rs_R009_ueqv_R009NYYYY_partial_03_0153 := by
  native_decide

/-- Coefficient term 154 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NYYYY_coefficient_03_0154 : Poly :=
[
  term ((-1856192 : Rat) / 32699) [(11, 2), (15, 2), (16, 1)]
]

/-- Partial product 154 for generator 3. -/
def rs_R009_ueqv_R009NYYYY_partial_03_0154 : Poly :=
[
  term ((3712384 : Rat) / 32699) [(4, 1), (11, 2), (15, 2), (16, 1)],
  term ((-1856192 : Rat) / 32699) [(4, 2), (11, 2), (15, 2), (16, 1)],
  term ((-1856192 : Rat) / 32699) [(5, 2), (11, 2), (15, 2), (16, 1)],
  term ((-3712384 : Rat) / 32699) [(8, 1), (11, 2), (15, 2), (16, 1)],
  term ((1856192 : Rat) / 32699) [(8, 2), (11, 2), (15, 2), (16, 1)],
  term ((1856192 : Rat) / 32699) [(9, 2), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 154 for generator 3. -/
theorem rs_R009_ueqv_R009NYYYY_partial_03_0154_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_03_0154
        rs_R009_ueqv_R009NYYYY_generator_03_0100_0178 =
      rs_R009_ueqv_R009NYYYY_partial_03_0154 := by
  native_decide

/-- Coefficient term 155 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NYYYY_coefficient_03_0155 : Poly :=
[
  term ((-10262784752 : Rat) / 33189485) [(11, 2), (15, 4)]
]

/-- Partial product 155 for generator 3. -/
def rs_R009_ueqv_R009NYYYY_partial_03_0155 : Poly :=
[
  term ((20525569504 : Rat) / 33189485) [(4, 1), (11, 2), (15, 4)],
  term ((-10262784752 : Rat) / 33189485) [(4, 2), (11, 2), (15, 4)],
  term ((-10262784752 : Rat) / 33189485) [(5, 2), (11, 2), (15, 4)],
  term ((-20525569504 : Rat) / 33189485) [(8, 1), (11, 2), (15, 4)],
  term ((10262784752 : Rat) / 33189485) [(8, 2), (11, 2), (15, 4)],
  term ((10262784752 : Rat) / 33189485) [(9, 2), (11, 2), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 155 for generator 3. -/
theorem rs_R009_ueqv_R009NYYYY_partial_03_0155_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_03_0155
        rs_R009_ueqv_R009NYYYY_generator_03_0100_0178 =
      rs_R009_ueqv_R009NYYYY_partial_03_0155 := by
  native_decide

/-- Coefficient term 156 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NYYYY_coefficient_03_0156 : Poly :=
[
  term ((1948928 : Rat) / 32699) [(11, 2), (15, 4), (16, 1)]
]

/-- Partial product 156 for generator 3. -/
def rs_R009_ueqv_R009NYYYY_partial_03_0156 : Poly :=
[
  term ((-3897856 : Rat) / 32699) [(4, 1), (11, 2), (15, 4), (16, 1)],
  term ((1948928 : Rat) / 32699) [(4, 2), (11, 2), (15, 4), (16, 1)],
  term ((1948928 : Rat) / 32699) [(5, 2), (11, 2), (15, 4), (16, 1)],
  term ((3897856 : Rat) / 32699) [(8, 1), (11, 2), (15, 4), (16, 1)],
  term ((-1948928 : Rat) / 32699) [(8, 2), (11, 2), (15, 4), (16, 1)],
  term ((-1948928 : Rat) / 32699) [(9, 2), (11, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 156 for generator 3. -/
theorem rs_R009_ueqv_R009NYYYY_partial_03_0156_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_03_0156
        rs_R009_ueqv_R009NYYYY_generator_03_0100_0178 =
      rs_R009_ueqv_R009NYYYY_partial_03_0156 := by
  native_decide

/-- Coefficient term 157 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NYYYY_coefficient_03_0157 : Poly :=
[
  term ((-496086272 : Rat) / 33189485) [(11, 3), (13, 1), (15, 2)]
]

/-- Partial product 157 for generator 3. -/
def rs_R009_ueqv_R009NYYYY_partial_03_0157 : Poly :=
[
  term ((992172544 : Rat) / 33189485) [(4, 1), (11, 3), (13, 1), (15, 2)],
  term ((-496086272 : Rat) / 33189485) [(4, 2), (11, 3), (13, 1), (15, 2)],
  term ((-496086272 : Rat) / 33189485) [(5, 2), (11, 3), (13, 1), (15, 2)],
  term ((-992172544 : Rat) / 33189485) [(8, 1), (11, 3), (13, 1), (15, 2)],
  term ((496086272 : Rat) / 33189485) [(8, 2), (11, 3), (13, 1), (15, 2)],
  term ((496086272 : Rat) / 33189485) [(9, 2), (11, 3), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 157 for generator 3. -/
theorem rs_R009_ueqv_R009NYYYY_partial_03_0157_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_03_0157
        rs_R009_ueqv_R009NYYYY_generator_03_0100_0178 =
      rs_R009_ueqv_R009NYYYY_partial_03_0157 := by
  native_decide

/-- Coefficient term 158 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NYYYY_coefficient_03_0158 : Poly :=
[
  term ((94208 : Rat) / 32699) [(11, 3), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 158 for generator 3. -/
def rs_R009_ueqv_R009NYYYY_partial_03_0158 : Poly :=
[
  term ((-188416 : Rat) / 32699) [(4, 1), (11, 3), (13, 1), (15, 2), (16, 1)],
  term ((94208 : Rat) / 32699) [(4, 2), (11, 3), (13, 1), (15, 2), (16, 1)],
  term ((94208 : Rat) / 32699) [(5, 2), (11, 3), (13, 1), (15, 2), (16, 1)],
  term ((188416 : Rat) / 32699) [(8, 1), (11, 3), (13, 1), (15, 2), (16, 1)],
  term ((-94208 : Rat) / 32699) [(8, 2), (11, 3), (13, 1), (15, 2), (16, 1)],
  term ((-94208 : Rat) / 32699) [(9, 2), (11, 3), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 158 for generator 3. -/
theorem rs_R009_ueqv_R009NYYYY_partial_03_0158_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_03_0158
        rs_R009_ueqv_R009NYYYY_generator_03_0100_0178 =
      rs_R009_ueqv_R009NYYYY_partial_03_0158 := by
  native_decide

/-- Coefficient term 159 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NYYYY_coefficient_03_0159 : Poly :=
[
  term ((-93016176 : Rat) / 33189485) [(11, 3), (15, 1)]
]

/-- Partial product 159 for generator 3. -/
def rs_R009_ueqv_R009NYYYY_partial_03_0159 : Poly :=
[
  term ((186032352 : Rat) / 33189485) [(4, 1), (11, 3), (15, 1)],
  term ((-93016176 : Rat) / 33189485) [(4, 2), (11, 3), (15, 1)],
  term ((-93016176 : Rat) / 33189485) [(5, 2), (11, 3), (15, 1)],
  term ((-186032352 : Rat) / 33189485) [(8, 1), (11, 3), (15, 1)],
  term ((93016176 : Rat) / 33189485) [(8, 2), (11, 3), (15, 1)],
  term ((93016176 : Rat) / 33189485) [(9, 2), (11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 159 for generator 3. -/
theorem rs_R009_ueqv_R009NYYYY_partial_03_0159_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_03_0159
        rs_R009_ueqv_R009NYYYY_generator_03_0100_0178 =
      rs_R009_ueqv_R009NYYYY_partial_03_0159 := by
  native_decide

/-- Coefficient term 160 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NYYYY_coefficient_03_0160 : Poly :=
[
  term ((17664 : Rat) / 32699) [(11, 3), (15, 1), (16, 1)]
]

/-- Partial product 160 for generator 3. -/
def rs_R009_ueqv_R009NYYYY_partial_03_0160 : Poly :=
[
  term ((-35328 : Rat) / 32699) [(4, 1), (11, 3), (15, 1), (16, 1)],
  term ((17664 : Rat) / 32699) [(4, 2), (11, 3), (15, 1), (16, 1)],
  term ((17664 : Rat) / 32699) [(5, 2), (11, 3), (15, 1), (16, 1)],
  term ((35328 : Rat) / 32699) [(8, 1), (11, 3), (15, 1), (16, 1)],
  term ((-17664 : Rat) / 32699) [(8, 2), (11, 3), (15, 1), (16, 1)],
  term ((-17664 : Rat) / 32699) [(9, 2), (11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 160 for generator 3. -/
theorem rs_R009_ueqv_R009NYYYY_partial_03_0160_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_03_0160
        rs_R009_ueqv_R009NYYYY_generator_03_0100_0178 =
      rs_R009_ueqv_R009NYYYY_partial_03_0160 := by
  native_decide

/-- Coefficient term 161 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NYYYY_coefficient_03_0161 : Poly :=
[
  term ((124021568 : Rat) / 33189485) [(11, 3), (15, 3)]
]

/-- Partial product 161 for generator 3. -/
def rs_R009_ueqv_R009NYYYY_partial_03_0161 : Poly :=
[
  term ((-248043136 : Rat) / 33189485) [(4, 1), (11, 3), (15, 3)],
  term ((124021568 : Rat) / 33189485) [(4, 2), (11, 3), (15, 3)],
  term ((124021568 : Rat) / 33189485) [(5, 2), (11, 3), (15, 3)],
  term ((248043136 : Rat) / 33189485) [(8, 1), (11, 3), (15, 3)],
  term ((-124021568 : Rat) / 33189485) [(8, 2), (11, 3), (15, 3)],
  term ((-124021568 : Rat) / 33189485) [(9, 2), (11, 3), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 161 for generator 3. -/
theorem rs_R009_ueqv_R009NYYYY_partial_03_0161_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_03_0161
        rs_R009_ueqv_R009NYYYY_generator_03_0100_0178 =
      rs_R009_ueqv_R009NYYYY_partial_03_0161 := by
  native_decide

/-- Coefficient term 162 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NYYYY_coefficient_03_0162 : Poly :=
[
  term ((-23552 : Rat) / 32699) [(11, 3), (15, 3), (16, 1)]
]

/-- Partial product 162 for generator 3. -/
def rs_R009_ueqv_R009NYYYY_partial_03_0162 : Poly :=
[
  term ((47104 : Rat) / 32699) [(4, 1), (11, 3), (15, 3), (16, 1)],
  term ((-23552 : Rat) / 32699) [(4, 2), (11, 3), (15, 3), (16, 1)],
  term ((-23552 : Rat) / 32699) [(5, 2), (11, 3), (15, 3), (16, 1)],
  term ((-47104 : Rat) / 32699) [(8, 1), (11, 3), (15, 3), (16, 1)],
  term ((23552 : Rat) / 32699) [(8, 2), (11, 3), (15, 3), (16, 1)],
  term ((23552 : Rat) / 32699) [(9, 2), (11, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 162 for generator 3. -/
theorem rs_R009_ueqv_R009NYYYY_partial_03_0162_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_03_0162
        rs_R009_ueqv_R009NYYYY_generator_03_0100_0178 =
      rs_R009_ueqv_R009NYYYY_partial_03_0162 := by
  native_decide

/-- Coefficient term 163 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NYYYY_coefficient_03_0163 : Poly :=
[
  term ((-109 : Rat) / 40) [(12, 1)]
]

/-- Partial product 163 for generator 3. -/
def rs_R009_ueqv_R009NYYYY_partial_03_0163 : Poly :=
[
  term ((109 : Rat) / 20) [(4, 1), (12, 1)],
  term ((-109 : Rat) / 40) [(4, 2), (12, 1)],
  term ((-109 : Rat) / 40) [(5, 2), (12, 1)],
  term ((-109 : Rat) / 20) [(8, 1), (12, 1)],
  term ((109 : Rat) / 40) [(8, 2), (12, 1)],
  term ((109 : Rat) / 40) [(9, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 163 for generator 3. -/
theorem rs_R009_ueqv_R009NYYYY_partial_03_0163_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_03_0163
        rs_R009_ueqv_R009NYYYY_generator_03_0100_0178 =
      rs_R009_ueqv_R009NYYYY_partial_03_0163 := by
  native_decide

/-- Coefficient term 164 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NYYYY_coefficient_03_0164 : Poly :=
[
  term ((72607343635 : Rat) / 53103176) [(12, 1), (13, 1), (15, 1)]
]

/-- Partial product 164 for generator 3. -/
def rs_R009_ueqv_R009NYYYY_partial_03_0164 : Poly :=
[
  term ((-72607343635 : Rat) / 26551588) [(4, 1), (12, 1), (13, 1), (15, 1)],
  term ((72607343635 : Rat) / 53103176) [(4, 2), (12, 1), (13, 1), (15, 1)],
  term ((72607343635 : Rat) / 53103176) [(5, 2), (12, 1), (13, 1), (15, 1)],
  term ((72607343635 : Rat) / 26551588) [(8, 1), (12, 1), (13, 1), (15, 1)],
  term ((-72607343635 : Rat) / 53103176) [(8, 2), (12, 1), (13, 1), (15, 1)],
  term ((-72607343635 : Rat) / 53103176) [(9, 2), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 164 for generator 3. -/
theorem rs_R009_ueqv_R009NYYYY_partial_03_0164_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_03_0164
        rs_R009_ueqv_R009NYYYY_generator_03_0100_0178 =
      rs_R009_ueqv_R009NYYYY_partial_03_0164 := by
  native_decide

/-- Coefficient term 165 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NYYYY_coefficient_03_0165 : Poly :=
[
  term ((-8620783 : Rat) / 32699) [(12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 165 for generator 3. -/
def rs_R009_ueqv_R009NYYYY_partial_03_0165 : Poly :=
[
  term ((17241566 : Rat) / 32699) [(4, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-8620783 : Rat) / 32699) [(4, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-8620783 : Rat) / 32699) [(5, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-17241566 : Rat) / 32699) [(8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((8620783 : Rat) / 32699) [(8, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((8620783 : Rat) / 32699) [(9, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 165 for generator 3. -/
theorem rs_R009_ueqv_R009NYYYY_partial_03_0165_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_03_0165
        rs_R009_ueqv_R009NYYYY_generator_03_0100_0178 =
      rs_R009_ueqv_R009NYYYY_partial_03_0165 := by
  native_decide

/-- Coefficient term 166 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NYYYY_coefficient_03_0166 : Poly :=
[
  term ((-1736140985741 : Rat) / 1593095280) [(12, 1), (15, 2)]
]

/-- Partial product 166 for generator 3. -/
def rs_R009_ueqv_R009NYYYY_partial_03_0166 : Poly :=
[
  term ((1736140985741 : Rat) / 796547640) [(4, 1), (12, 1), (15, 2)],
  term ((-1736140985741 : Rat) / 1593095280) [(4, 2), (12, 1), (15, 2)],
  term ((-1736140985741 : Rat) / 1593095280) [(5, 2), (12, 1), (15, 2)],
  term ((-1736140985741 : Rat) / 796547640) [(8, 1), (12, 1), (15, 2)],
  term ((1736140985741 : Rat) / 1593095280) [(8, 2), (12, 1), (15, 2)],
  term ((1736140985741 : Rat) / 1593095280) [(9, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 166 for generator 3. -/
theorem rs_R009_ueqv_R009NYYYY_partial_03_0166_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_03_0166
        rs_R009_ueqv_R009NYYYY_generator_03_0100_0178 =
      rs_R009_ueqv_R009NYYYY_partial_03_0166 := by
  native_decide

/-- Coefficient term 167 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NYYYY_coefficient_03_0167 : Poly :=
[
  term ((41429629 : Rat) / 196194) [(12, 1), (15, 2), (16, 1)]
]

/-- Partial product 167 for generator 3. -/
def rs_R009_ueqv_R009NYYYY_partial_03_0167 : Poly :=
[
  term ((-41429629 : Rat) / 98097) [(4, 1), (12, 1), (15, 2), (16, 1)],
  term ((41429629 : Rat) / 196194) [(4, 2), (12, 1), (15, 2), (16, 1)],
  term ((41429629 : Rat) / 196194) [(5, 2), (12, 1), (15, 2), (16, 1)],
  term ((41429629 : Rat) / 98097) [(8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-41429629 : Rat) / 196194) [(8, 2), (12, 1), (15, 2), (16, 1)],
  term ((-41429629 : Rat) / 196194) [(9, 2), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 167 for generator 3. -/
theorem rs_R009_ueqv_R009NYYYY_partial_03_0167_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_03_0167
        rs_R009_ueqv_R009NYYYY_generator_03_0100_0178 =
      rs_R009_ueqv_R009NYYYY_partial_03_0167 := by
  native_decide

/-- Coefficient term 168 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NYYYY_coefficient_03_0168 : Poly :=
[
  term ((-1772226783001 : Rat) / 1593095280) [(13, 1), (15, 1)]
]

/-- Partial product 168 for generator 3. -/
def rs_R009_ueqv_R009NYYYY_partial_03_0168 : Poly :=
[
  term ((1772226783001 : Rat) / 796547640) [(4, 1), (13, 1), (15, 1)],
  term ((-1772226783001 : Rat) / 1593095280) [(4, 2), (13, 1), (15, 1)],
  term ((-1772226783001 : Rat) / 1593095280) [(5, 2), (13, 1), (15, 1)],
  term ((-1772226783001 : Rat) / 796547640) [(8, 1), (13, 1), (15, 1)],
  term ((1772226783001 : Rat) / 1593095280) [(8, 2), (13, 1), (15, 1)],
  term ((1772226783001 : Rat) / 1593095280) [(9, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 168 for generator 3. -/
theorem rs_R009_ueqv_R009NYYYY_partial_03_0168_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_03_0168
        rs_R009_ueqv_R009NYYYY_generator_03_0100_0178 =
      rs_R009_ueqv_R009NYYYY_partial_03_0168 := by
  native_decide

/-- Coefficient term 169 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NYYYY_coefficient_03_0169 : Poly :=
[
  term ((42167843 : Rat) / 196194) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 169 for generator 3. -/
def rs_R009_ueqv_R009NYYYY_partial_03_0169 : Poly :=
[
  term ((-42167843 : Rat) / 98097) [(4, 1), (13, 1), (15, 1), (16, 1)],
  term ((42167843 : Rat) / 196194) [(4, 2), (13, 1), (15, 1), (16, 1)],
  term ((42167843 : Rat) / 196194) [(5, 2), (13, 1), (15, 1), (16, 1)],
  term ((42167843 : Rat) / 98097) [(8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-42167843 : Rat) / 196194) [(8, 2), (13, 1), (15, 1), (16, 1)],
  term ((-42167843 : Rat) / 196194) [(9, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 169 for generator 3. -/
theorem rs_R009_ueqv_R009NYYYY_partial_03_0169_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_03_0169
        rs_R009_ueqv_R009NYYYY_generator_03_0100_0178 =
      rs_R009_ueqv_R009NYYYY_partial_03_0169 := by
  native_decide

/-- Coefficient term 170 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NYYYY_coefficient_03_0170 : Poly :=
[
  term ((179348477725 : Rat) / 53103176) [(13, 1), (15, 3)]
]

/-- Partial product 170 for generator 3. -/
def rs_R009_ueqv_R009NYYYY_partial_03_0170 : Poly :=
[
  term ((-179348477725 : Rat) / 26551588) [(4, 1), (13, 1), (15, 3)],
  term ((179348477725 : Rat) / 53103176) [(4, 2), (13, 1), (15, 3)],
  term ((179348477725 : Rat) / 53103176) [(5, 2), (13, 1), (15, 3)],
  term ((179348477725 : Rat) / 26551588) [(8, 1), (13, 1), (15, 3)],
  term ((-179348477725 : Rat) / 53103176) [(8, 2), (13, 1), (15, 3)],
  term ((-179348477725 : Rat) / 53103176) [(9, 2), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 170 for generator 3. -/
theorem rs_R009_ueqv_R009NYYYY_partial_03_0170_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_03_0170
        rs_R009_ueqv_R009NYYYY_generator_03_0100_0178 =
      rs_R009_ueqv_R009NYYYY_partial_03_0170 := by
  native_decide

/-- Coefficient term 171 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NYYYY_coefficient_03_0171 : Poly :=
[
  term ((-21400505 : Rat) / 32699) [(13, 1), (15, 3), (16, 1)]
]

/-- Partial product 171 for generator 3. -/
def rs_R009_ueqv_R009NYYYY_partial_03_0171 : Poly :=
[
  term ((42801010 : Rat) / 32699) [(4, 1), (13, 1), (15, 3), (16, 1)],
  term ((-21400505 : Rat) / 32699) [(4, 2), (13, 1), (15, 3), (16, 1)],
  term ((-21400505 : Rat) / 32699) [(5, 2), (13, 1), (15, 3), (16, 1)],
  term ((-42801010 : Rat) / 32699) [(8, 1), (13, 1), (15, 3), (16, 1)],
  term ((21400505 : Rat) / 32699) [(8, 2), (13, 1), (15, 3), (16, 1)],
  term ((21400505 : Rat) / 32699) [(9, 2), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 171 for generator 3. -/
theorem rs_R009_ueqv_R009NYYYY_partial_03_0171_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_03_0171
        rs_R009_ueqv_R009NYYYY_generator_03_0100_0178 =
      rs_R009_ueqv_R009NYYYY_partial_03_0171 := by
  native_decide

/-- Coefficient term 172 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NYYYY_coefficient_03_0172 : Poly :=
[
  term ((41 : Rat) / 20) [(13, 2)]
]

/-- Partial product 172 for generator 3. -/
def rs_R009_ueqv_R009NYYYY_partial_03_0172 : Poly :=
[
  term ((-41 : Rat) / 10) [(4, 1), (13, 2)],
  term ((41 : Rat) / 20) [(4, 2), (13, 2)],
  term ((41 : Rat) / 20) [(5, 2), (13, 2)],
  term ((41 : Rat) / 10) [(8, 1), (13, 2)],
  term ((-41 : Rat) / 20) [(8, 2), (13, 2)],
  term ((-41 : Rat) / 20) [(9, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 172 for generator 3. -/
theorem rs_R009_ueqv_R009NYYYY_partial_03_0172_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_03_0172
        rs_R009_ueqv_R009NYYYY_generator_03_0100_0178 =
      rs_R009_ueqv_R009NYYYY_partial_03_0172 := by
  native_decide

/-- Coefficient term 173 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NYYYY_coefficient_03_0173 : Poly :=
[
  term ((-361948103067 : Rat) / 132757940) [(13, 2), (15, 2)]
]

/-- Partial product 173 for generator 3. -/
def rs_R009_ueqv_R009NYYYY_partial_03_0173 : Poly :=
[
  term ((361948103067 : Rat) / 66378970) [(4, 1), (13, 2), (15, 2)],
  term ((-361948103067 : Rat) / 132757940) [(4, 2), (13, 2), (15, 2)],
  term ((-361948103067 : Rat) / 132757940) [(5, 2), (13, 2), (15, 2)],
  term ((-361948103067 : Rat) / 66378970) [(8, 1), (13, 2), (15, 2)],
  term ((361948103067 : Rat) / 132757940) [(8, 2), (13, 2), (15, 2)],
  term ((361948103067 : Rat) / 132757940) [(9, 2), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 173 for generator 3. -/
theorem rs_R009_ueqv_R009NYYYY_partial_03_0173_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_03_0173
        rs_R009_ueqv_R009NYYYY_generator_03_0100_0178 =
      rs_R009_ueqv_R009NYYYY_partial_03_0173 := by
  native_decide

/-- Coefficient term 174 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NYYYY_coefficient_03_0174 : Poly :=
[
  term ((17241566 : Rat) / 32699) [(13, 2), (15, 2), (16, 1)]
]

/-- Partial product 174 for generator 3. -/
def rs_R009_ueqv_R009NYYYY_partial_03_0174 : Poly :=
[
  term ((-34483132 : Rat) / 32699) [(4, 1), (13, 2), (15, 2), (16, 1)],
  term ((17241566 : Rat) / 32699) [(4, 2), (13, 2), (15, 2), (16, 1)],
  term ((17241566 : Rat) / 32699) [(5, 2), (13, 2), (15, 2), (16, 1)],
  term ((34483132 : Rat) / 32699) [(8, 1), (13, 2), (15, 2), (16, 1)],
  term ((-17241566 : Rat) / 32699) [(8, 2), (13, 2), (15, 2), (16, 1)],
  term ((-17241566 : Rat) / 32699) [(9, 2), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 174 for generator 3. -/
theorem rs_R009_ueqv_R009NYYYY_partial_03_0174_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_03_0174
        rs_R009_ueqv_R009NYYYY_generator_03_0100_0178 =
      rs_R009_ueqv_R009NYYYY_partial_03_0174 := by
  native_decide

/-- Coefficient term 175 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NYYYY_coefficient_03_0175 : Poly :=
[
  term ((1365684604141 : Rat) / 1593095280) [(15, 2)]
]

/-- Partial product 175 for generator 3. -/
def rs_R009_ueqv_R009NYYYY_partial_03_0175 : Poly :=
[
  term ((-1365684604141 : Rat) / 796547640) [(4, 1), (15, 2)],
  term ((1365684604141 : Rat) / 1593095280) [(4, 2), (15, 2)],
  term ((1365684604141 : Rat) / 1593095280) [(5, 2), (15, 2)],
  term ((1365684604141 : Rat) / 796547640) [(8, 1), (15, 2)],
  term ((-1365684604141 : Rat) / 1593095280) [(8, 2), (15, 2)],
  term ((-1365684604141 : Rat) / 1593095280) [(9, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 175 for generator 3. -/
theorem rs_R009_ueqv_R009NYYYY_partial_03_0175_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_03_0175
        rs_R009_ueqv_R009NYYYY_generator_03_0100_0178 =
      rs_R009_ueqv_R009NYYYY_partial_03_0175 := by
  native_decide

/-- Coefficient term 176 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NYYYY_coefficient_03_0176 : Poly :=
[
  term ((-32771201 : Rat) / 196194) [(15, 2), (16, 1)]
]

/-- Partial product 176 for generator 3. -/
def rs_R009_ueqv_R009NYYYY_partial_03_0176 : Poly :=
[
  term ((32771201 : Rat) / 98097) [(4, 1), (15, 2), (16, 1)],
  term ((-32771201 : Rat) / 196194) [(4, 2), (15, 2), (16, 1)],
  term ((-32771201 : Rat) / 196194) [(5, 2), (15, 2), (16, 1)],
  term ((-32771201 : Rat) / 98097) [(8, 1), (15, 2), (16, 1)],
  term ((32771201 : Rat) / 196194) [(8, 2), (15, 2), (16, 1)],
  term ((32771201 : Rat) / 196194) [(9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 176 for generator 3. -/
theorem rs_R009_ueqv_R009NYYYY_partial_03_0176_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_03_0176
        rs_R009_ueqv_R009NYYYY_generator_03_0100_0178 =
      rs_R009_ueqv_R009NYYYY_partial_03_0176 := by
  native_decide

/-- Coefficient term 177 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NYYYY_coefficient_03_0177 : Poly :=
[
  term ((-713886046843 : Rat) / 796547640) [(15, 4)]
]

/-- Partial product 177 for generator 3. -/
def rs_R009_ueqv_R009NYYYY_partial_03_0177 : Poly :=
[
  term ((713886046843 : Rat) / 398273820) [(4, 1), (15, 4)],
  term ((-713886046843 : Rat) / 796547640) [(4, 2), (15, 4)],
  term ((-713886046843 : Rat) / 796547640) [(5, 2), (15, 4)],
  term ((-713886046843 : Rat) / 398273820) [(8, 1), (15, 4)],
  term ((713886046843 : Rat) / 796547640) [(8, 2), (15, 4)],
  term ((713886046843 : Rat) / 796547640) [(9, 2), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 177 for generator 3. -/
theorem rs_R009_ueqv_R009NYYYY_partial_03_0177_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_03_0177
        rs_R009_ueqv_R009NYYYY_generator_03_0100_0178 =
      rs_R009_ueqv_R009NYYYY_partial_03_0177 := by
  native_decide

/-- Coefficient term 178 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NYYYY_coefficient_03_0178 : Poly :=
[
  term ((17064581 : Rat) / 98097) [(15, 4), (16, 1)]
]

/-- Partial product 178 for generator 3. -/
def rs_R009_ueqv_R009NYYYY_partial_03_0178 : Poly :=
[
  term ((-34129162 : Rat) / 98097) [(4, 1), (15, 4), (16, 1)],
  term ((17064581 : Rat) / 98097) [(4, 2), (15, 4), (16, 1)],
  term ((17064581 : Rat) / 98097) [(5, 2), (15, 4), (16, 1)],
  term ((34129162 : Rat) / 98097) [(8, 1), (15, 4), (16, 1)],
  term ((-17064581 : Rat) / 98097) [(8, 2), (15, 4), (16, 1)],
  term ((-17064581 : Rat) / 98097) [(9, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 178 for generator 3. -/
theorem rs_R009_ueqv_R009NYYYY_partial_03_0178_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_03_0178
        rs_R009_ueqv_R009NYYYY_generator_03_0100_0178 =
      rs_R009_ueqv_R009NYYYY_partial_03_0178 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NYYYY_partials_03_0100_0178 : List Poly :=
[
  rs_R009_ueqv_R009NYYYY_partial_03_0100,
  rs_R009_ueqv_R009NYYYY_partial_03_0101,
  rs_R009_ueqv_R009NYYYY_partial_03_0102,
  rs_R009_ueqv_R009NYYYY_partial_03_0103,
  rs_R009_ueqv_R009NYYYY_partial_03_0104,
  rs_R009_ueqv_R009NYYYY_partial_03_0105,
  rs_R009_ueqv_R009NYYYY_partial_03_0106,
  rs_R009_ueqv_R009NYYYY_partial_03_0107,
  rs_R009_ueqv_R009NYYYY_partial_03_0108,
  rs_R009_ueqv_R009NYYYY_partial_03_0109,
  rs_R009_ueqv_R009NYYYY_partial_03_0110,
  rs_R009_ueqv_R009NYYYY_partial_03_0111,
  rs_R009_ueqv_R009NYYYY_partial_03_0112,
  rs_R009_ueqv_R009NYYYY_partial_03_0113,
  rs_R009_ueqv_R009NYYYY_partial_03_0114,
  rs_R009_ueqv_R009NYYYY_partial_03_0115,
  rs_R009_ueqv_R009NYYYY_partial_03_0116,
  rs_R009_ueqv_R009NYYYY_partial_03_0117,
  rs_R009_ueqv_R009NYYYY_partial_03_0118,
  rs_R009_ueqv_R009NYYYY_partial_03_0119,
  rs_R009_ueqv_R009NYYYY_partial_03_0120,
  rs_R009_ueqv_R009NYYYY_partial_03_0121,
  rs_R009_ueqv_R009NYYYY_partial_03_0122,
  rs_R009_ueqv_R009NYYYY_partial_03_0123,
  rs_R009_ueqv_R009NYYYY_partial_03_0124,
  rs_R009_ueqv_R009NYYYY_partial_03_0125,
  rs_R009_ueqv_R009NYYYY_partial_03_0126,
  rs_R009_ueqv_R009NYYYY_partial_03_0127,
  rs_R009_ueqv_R009NYYYY_partial_03_0128,
  rs_R009_ueqv_R009NYYYY_partial_03_0129,
  rs_R009_ueqv_R009NYYYY_partial_03_0130,
  rs_R009_ueqv_R009NYYYY_partial_03_0131,
  rs_R009_ueqv_R009NYYYY_partial_03_0132,
  rs_R009_ueqv_R009NYYYY_partial_03_0133,
  rs_R009_ueqv_R009NYYYY_partial_03_0134,
  rs_R009_ueqv_R009NYYYY_partial_03_0135,
  rs_R009_ueqv_R009NYYYY_partial_03_0136,
  rs_R009_ueqv_R009NYYYY_partial_03_0137,
  rs_R009_ueqv_R009NYYYY_partial_03_0138,
  rs_R009_ueqv_R009NYYYY_partial_03_0139,
  rs_R009_ueqv_R009NYYYY_partial_03_0140,
  rs_R009_ueqv_R009NYYYY_partial_03_0141,
  rs_R009_ueqv_R009NYYYY_partial_03_0142,
  rs_R009_ueqv_R009NYYYY_partial_03_0143,
  rs_R009_ueqv_R009NYYYY_partial_03_0144,
  rs_R009_ueqv_R009NYYYY_partial_03_0145,
  rs_R009_ueqv_R009NYYYY_partial_03_0146,
  rs_R009_ueqv_R009NYYYY_partial_03_0147,
  rs_R009_ueqv_R009NYYYY_partial_03_0148,
  rs_R009_ueqv_R009NYYYY_partial_03_0149,
  rs_R009_ueqv_R009NYYYY_partial_03_0150,
  rs_R009_ueqv_R009NYYYY_partial_03_0151,
  rs_R009_ueqv_R009NYYYY_partial_03_0152,
  rs_R009_ueqv_R009NYYYY_partial_03_0153,
  rs_R009_ueqv_R009NYYYY_partial_03_0154,
  rs_R009_ueqv_R009NYYYY_partial_03_0155,
  rs_R009_ueqv_R009NYYYY_partial_03_0156,
  rs_R009_ueqv_R009NYYYY_partial_03_0157,
  rs_R009_ueqv_R009NYYYY_partial_03_0158,
  rs_R009_ueqv_R009NYYYY_partial_03_0159,
  rs_R009_ueqv_R009NYYYY_partial_03_0160,
  rs_R009_ueqv_R009NYYYY_partial_03_0161,
  rs_R009_ueqv_R009NYYYY_partial_03_0162,
  rs_R009_ueqv_R009NYYYY_partial_03_0163,
  rs_R009_ueqv_R009NYYYY_partial_03_0164,
  rs_R009_ueqv_R009NYYYY_partial_03_0165,
  rs_R009_ueqv_R009NYYYY_partial_03_0166,
  rs_R009_ueqv_R009NYYYY_partial_03_0167,
  rs_R009_ueqv_R009NYYYY_partial_03_0168,
  rs_R009_ueqv_R009NYYYY_partial_03_0169,
  rs_R009_ueqv_R009NYYYY_partial_03_0170,
  rs_R009_ueqv_R009NYYYY_partial_03_0171,
  rs_R009_ueqv_R009NYYYY_partial_03_0172,
  rs_R009_ueqv_R009NYYYY_partial_03_0173,
  rs_R009_ueqv_R009NYYYY_partial_03_0174,
  rs_R009_ueqv_R009NYYYY_partial_03_0175,
  rs_R009_ueqv_R009NYYYY_partial_03_0176,
  rs_R009_ueqv_R009NYYYY_partial_03_0177,
  rs_R009_ueqv_R009NYYYY_partial_03_0178
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NYYYY_block_03_0100_0178 : Poly :=
[
  term ((-80 : Rat) / 29) [(4, 1), (9, 1), (12, 1), (13, 1), (15, 2)],
  term ((-92 : Rat) / 29) [(4, 1), (9, 1), (12, 1), (15, 1)],
  term ((15 : Rat) / 8) [(4, 1), (9, 1), (13, 1)],
  term ((827 : Rat) / 58) [(4, 1), (9, 1), (13, 1), (15, 2)],
  term ((-80 : Rat) / 29) [(4, 1), (9, 1), (13, 1), (15, 4)],
  term (5 : Rat) [(4, 1), (9, 1), (13, 2), (15, 1)],
  term ((160 : Rat) / 29) [(4, 1), (9, 1), (13, 2), (15, 3)],
  term ((607 : Rat) / 116) [(4, 1), (9, 1), (15, 1)],
  term ((-213 : Rat) / 29) [(4, 1), (9, 1), (15, 3)],
  term ((-2232388224 : Rat) / 33189485) [(4, 1), (10, 1), (11, 1), (15, 1)],
  term ((423936 : Rat) / 32699) [(4, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((62010784 : Rat) / 33189485) [(4, 1), (10, 1), (11, 1), (15, 3)],
  term ((-11776 : Rat) / 32699) [(4, 1), (10, 1), (11, 1), (15, 3), (16, 1)],
  term ((7973016144 : Rat) / 33189485) [(4, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((-1524960 : Rat) / 32699) [(4, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((5979762108 : Rat) / 33189485) [(4, 1), (10, 1), (12, 1), (15, 2)],
  term ((-1143720 : Rat) / 32699) [(4, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((48543810283 : Rat) / 99568455) [(4, 1), (10, 1), (13, 1), (15, 1)],
  term ((-9340600 : Rat) / 98097) [(4, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3986508072 : Rat) / 33189485) [(4, 1), (10, 1), (13, 1), (15, 3)],
  term ((762480 : Rat) / 32699) [(4, 1), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((-15946032288 : Rat) / 33189485) [(4, 1), (10, 1), (13, 2), (15, 2)],
  term ((3049920 : Rat) / 32699) [(4, 1), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((-3719562593 : Rat) / 99568455) [(4, 1), (10, 1), (15, 2)],
  term ((714668 : Rat) / 98097) [(4, 1), (10, 1), (15, 2), (16, 1)],
  term ((5979762108 : Rat) / 33189485) [(4, 1), (10, 1), (15, 4)],
  term ((-1143720 : Rat) / 32699) [(4, 1), (10, 1), (15, 4), (16, 1)],
  term ((5813511000 : Rat) / 6637897) [(4, 1), (11, 1), (12, 1), (13, 1), (15, 2)],
  term ((-5520000 : Rat) / 32699) [(4, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-72268598674 : Rat) / 33189485) [(4, 1), (11, 1), (12, 1), (15, 1)],
  term ((13841124 : Rat) / 32699) [(4, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((7751348 : Rat) / 4741355) [(4, 1), (11, 1), (12, 1), (15, 3)],
  term ((-10304 : Rat) / 32699) [(4, 1), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((387374852246 : Rat) / 99568455) [(4, 1), (11, 1), (13, 1), (15, 2)],
  term ((-74239112 : Rat) / 98097) [(4, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((5813511000 : Rat) / 6637897) [(4, 1), (11, 1), (13, 1), (15, 4)],
  term ((-5520000 : Rat) / 32699) [(4, 1), (11, 1), (13, 1), (15, 4), (16, 1)],
  term ((-11627022000 : Rat) / 6637897) [(4, 1), (11, 1), (13, 2), (15, 3)],
  term ((11040000 : Rat) / 32699) [(4, 1), (11, 1), (13, 2), (15, 3), (16, 1)],
  term ((9054528665 : Rat) / 5689626) [(4, 1), (11, 1), (15, 1)],
  term ((-30319418 : Rat) / 98097) [(4, 1), (11, 1), (15, 1), (16, 1)],
  term ((-431757160 : Rat) / 228893) [(4, 1), (11, 1), (15, 3)],
  term ((11992364 : Rat) / 32699) [(4, 1), (11, 1), (15, 3), (16, 1)],
  term ((-13766394048 : Rat) / 33189485) [(4, 1), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((2614272 : Rat) / 32699) [(4, 1), (11, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((20215515584 : Rat) / 33189485) [(4, 1), (11, 2), (12, 1), (15, 2)],
  term ((-3838976 : Rat) / 32699) [(4, 1), (11, 2), (12, 1), (15, 2), (16, 1)],
  term ((10479822496 : Rat) / 33189485) [(4, 1), (11, 2), (13, 1), (15, 1)],
  term ((-1990144 : Rat) / 32699) [(4, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-55065576192 : Rat) / 33189485) [(4, 1), (11, 2), (13, 1), (15, 3)],
  term ((10457088 : Rat) / 32699) [(4, 1), (11, 2), (13, 1), (15, 3), (16, 1)],
  term ((27532788096 : Rat) / 33189485) [(4, 1), (11, 2), (13, 2), (15, 2)],
  term ((-5228544 : Rat) / 32699) [(4, 1), (11, 2), (13, 2), (15, 2), (16, 1)],
  term ((-19548899656 : Rat) / 33189485) [(4, 1), (11, 2), (15, 2)],
  term ((3712384 : Rat) / 32699) [(4, 1), (11, 2), (15, 2), (16, 1)],
  term ((20525569504 : Rat) / 33189485) [(4, 1), (11, 2), (15, 4)],
  term ((-3897856 : Rat) / 32699) [(4, 1), (11, 2), (15, 4), (16, 1)],
  term ((992172544 : Rat) / 33189485) [(4, 1), (11, 3), (13, 1), (15, 2)],
  term ((-188416 : Rat) / 32699) [(4, 1), (11, 3), (13, 1), (15, 2), (16, 1)],
  term ((186032352 : Rat) / 33189485) [(4, 1), (11, 3), (15, 1)],
  term ((-35328 : Rat) / 32699) [(4, 1), (11, 3), (15, 1), (16, 1)],
  term ((-248043136 : Rat) / 33189485) [(4, 1), (11, 3), (15, 3)],
  term ((47104 : Rat) / 32699) [(4, 1), (11, 3), (15, 3), (16, 1)],
  term ((109 : Rat) / 20) [(4, 1), (12, 1)],
  term ((-72607343635 : Rat) / 26551588) [(4, 1), (12, 1), (13, 1), (15, 1)],
  term ((17241566 : Rat) / 32699) [(4, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1736140985741 : Rat) / 796547640) [(4, 1), (12, 1), (15, 2)],
  term ((-41429629 : Rat) / 98097) [(4, 1), (12, 1), (15, 2), (16, 1)],
  term ((1772226783001 : Rat) / 796547640) [(4, 1), (13, 1), (15, 1)],
  term ((-42167843 : Rat) / 98097) [(4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-179348477725 : Rat) / 26551588) [(4, 1), (13, 1), (15, 3)],
  term ((42801010 : Rat) / 32699) [(4, 1), (13, 1), (15, 3), (16, 1)],
  term ((-41 : Rat) / 10) [(4, 1), (13, 2)],
  term ((361948103067 : Rat) / 66378970) [(4, 1), (13, 2), (15, 2)],
  term ((-34483132 : Rat) / 32699) [(4, 1), (13, 2), (15, 2), (16, 1)],
  term ((-1365684604141 : Rat) / 796547640) [(4, 1), (15, 2)],
  term ((32771201 : Rat) / 98097) [(4, 1), (15, 2), (16, 1)],
  term ((713886046843 : Rat) / 398273820) [(4, 1), (15, 4)],
  term ((-34129162 : Rat) / 98097) [(4, 1), (15, 4), (16, 1)],
  term ((40 : Rat) / 29) [(4, 2), (9, 1), (12, 1), (13, 1), (15, 2)],
  term ((46 : Rat) / 29) [(4, 2), (9, 1), (12, 1), (15, 1)],
  term ((-15 : Rat) / 16) [(4, 2), (9, 1), (13, 1)],
  term ((-827 : Rat) / 116) [(4, 2), (9, 1), (13, 1), (15, 2)],
  term ((40 : Rat) / 29) [(4, 2), (9, 1), (13, 1), (15, 4)],
  term ((-5 : Rat) / 2) [(4, 2), (9, 1), (13, 2), (15, 1)],
  term ((-80 : Rat) / 29) [(4, 2), (9, 1), (13, 2), (15, 3)],
  term ((-607 : Rat) / 232) [(4, 2), (9, 1), (15, 1)],
  term ((213 : Rat) / 58) [(4, 2), (9, 1), (15, 3)],
  term ((1116194112 : Rat) / 33189485) [(4, 2), (10, 1), (11, 1), (15, 1)],
  term ((-211968 : Rat) / 32699) [(4, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-31005392 : Rat) / 33189485) [(4, 2), (10, 1), (11, 1), (15, 3)],
  term ((5888 : Rat) / 32699) [(4, 2), (10, 1), (11, 1), (15, 3), (16, 1)],
  term ((-3986508072 : Rat) / 33189485) [(4, 2), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((762480 : Rat) / 32699) [(4, 2), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2989881054 : Rat) / 33189485) [(4, 2), (10, 1), (12, 1), (15, 2)],
  term ((571860 : Rat) / 32699) [(4, 2), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-48543810283 : Rat) / 199136910) [(4, 2), (10, 1), (13, 1), (15, 1)],
  term ((4670300 : Rat) / 98097) [(4, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((1993254036 : Rat) / 33189485) [(4, 2), (10, 1), (13, 1), (15, 3)],
  term ((-381240 : Rat) / 32699) [(4, 2), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((7973016144 : Rat) / 33189485) [(4, 2), (10, 1), (13, 2), (15, 2)],
  term ((-1524960 : Rat) / 32699) [(4, 2), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((3719562593 : Rat) / 199136910) [(4, 2), (10, 1), (15, 2)],
  term ((-357334 : Rat) / 98097) [(4, 2), (10, 1), (15, 2), (16, 1)],
  term ((-2989881054 : Rat) / 33189485) [(4, 2), (10, 1), (15, 4)],
  term ((571860 : Rat) / 32699) [(4, 2), (10, 1), (15, 4), (16, 1)],
  term ((-2906755500 : Rat) / 6637897) [(4, 2), (11, 1), (12, 1), (13, 1), (15, 2)],
  term ((2760000 : Rat) / 32699) [(4, 2), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((36134299337 : Rat) / 33189485) [(4, 2), (11, 1), (12, 1), (15, 1)],
  term ((-6920562 : Rat) / 32699) [(4, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3875674 : Rat) / 4741355) [(4, 2), (11, 1), (12, 1), (15, 3)],
  term ((5152 : Rat) / 32699) [(4, 2), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((-193687426123 : Rat) / 99568455) [(4, 2), (11, 1), (13, 1), (15, 2)],
  term ((37119556 : Rat) / 98097) [(4, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-2906755500 : Rat) / 6637897) [(4, 2), (11, 1), (13, 1), (15, 4)],
  term ((2760000 : Rat) / 32699) [(4, 2), (11, 1), (13, 1), (15, 4), (16, 1)],
  term ((5813511000 : Rat) / 6637897) [(4, 2), (11, 1), (13, 2), (15, 3)],
  term ((-5520000 : Rat) / 32699) [(4, 2), (11, 1), (13, 2), (15, 3), (16, 1)],
  term ((-9054528665 : Rat) / 11379252) [(4, 2), (11, 1), (15, 1)],
  term ((15159709 : Rat) / 98097) [(4, 2), (11, 1), (15, 1), (16, 1)],
  term ((215878580 : Rat) / 228893) [(4, 2), (11, 1), (15, 3)],
  term ((-5996182 : Rat) / 32699) [(4, 2), (11, 1), (15, 3), (16, 1)],
  term ((6883197024 : Rat) / 33189485) [(4, 2), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((-1307136 : Rat) / 32699) [(4, 2), (11, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-10107757792 : Rat) / 33189485) [(4, 2), (11, 2), (12, 1), (15, 2)],
  term ((1919488 : Rat) / 32699) [(4, 2), (11, 2), (12, 1), (15, 2), (16, 1)],
  term ((-5239911248 : Rat) / 33189485) [(4, 2), (11, 2), (13, 1), (15, 1)],
  term ((995072 : Rat) / 32699) [(4, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((27532788096 : Rat) / 33189485) [(4, 2), (11, 2), (13, 1), (15, 3)],
  term ((-5228544 : Rat) / 32699) [(4, 2), (11, 2), (13, 1), (15, 3), (16, 1)],
  term ((-13766394048 : Rat) / 33189485) [(4, 2), (11, 2), (13, 2), (15, 2)],
  term ((2614272 : Rat) / 32699) [(4, 2), (11, 2), (13, 2), (15, 2), (16, 1)],
  term ((9774449828 : Rat) / 33189485) [(4, 2), (11, 2), (15, 2)],
  term ((-1856192 : Rat) / 32699) [(4, 2), (11, 2), (15, 2), (16, 1)],
  term ((-10262784752 : Rat) / 33189485) [(4, 2), (11, 2), (15, 4)],
  term ((1948928 : Rat) / 32699) [(4, 2), (11, 2), (15, 4), (16, 1)],
  term ((-496086272 : Rat) / 33189485) [(4, 2), (11, 3), (13, 1), (15, 2)],
  term ((94208 : Rat) / 32699) [(4, 2), (11, 3), (13, 1), (15, 2), (16, 1)],
  term ((-93016176 : Rat) / 33189485) [(4, 2), (11, 3), (15, 1)],
  term ((17664 : Rat) / 32699) [(4, 2), (11, 3), (15, 1), (16, 1)],
  term ((124021568 : Rat) / 33189485) [(4, 2), (11, 3), (15, 3)],
  term ((-23552 : Rat) / 32699) [(4, 2), (11, 3), (15, 3), (16, 1)],
  term ((-109 : Rat) / 40) [(4, 2), (12, 1)],
  term ((72607343635 : Rat) / 53103176) [(4, 2), (12, 1), (13, 1), (15, 1)],
  term ((-8620783 : Rat) / 32699) [(4, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1736140985741 : Rat) / 1593095280) [(4, 2), (12, 1), (15, 2)],
  term ((41429629 : Rat) / 196194) [(4, 2), (12, 1), (15, 2), (16, 1)],
  term ((-1772226783001 : Rat) / 1593095280) [(4, 2), (13, 1), (15, 1)],
  term ((42167843 : Rat) / 196194) [(4, 2), (13, 1), (15, 1), (16, 1)],
  term ((179348477725 : Rat) / 53103176) [(4, 2), (13, 1), (15, 3)],
  term ((-21400505 : Rat) / 32699) [(4, 2), (13, 1), (15, 3), (16, 1)],
  term ((41 : Rat) / 20) [(4, 2), (13, 2)],
  term ((-361948103067 : Rat) / 132757940) [(4, 2), (13, 2), (15, 2)],
  term ((17241566 : Rat) / 32699) [(4, 2), (13, 2), (15, 2), (16, 1)],
  term ((1365684604141 : Rat) / 1593095280) [(4, 2), (15, 2)],
  term ((-32771201 : Rat) / 196194) [(4, 2), (15, 2), (16, 1)],
  term ((-713886046843 : Rat) / 796547640) [(4, 2), (15, 4)],
  term ((17064581 : Rat) / 98097) [(4, 2), (15, 4), (16, 1)],
  term ((40 : Rat) / 29) [(5, 2), (9, 1), (12, 1), (13, 1), (15, 2)],
  term ((46 : Rat) / 29) [(5, 2), (9, 1), (12, 1), (15, 1)],
  term ((-15 : Rat) / 16) [(5, 2), (9, 1), (13, 1)],
  term ((-827 : Rat) / 116) [(5, 2), (9, 1), (13, 1), (15, 2)],
  term ((40 : Rat) / 29) [(5, 2), (9, 1), (13, 1), (15, 4)],
  term ((-5 : Rat) / 2) [(5, 2), (9, 1), (13, 2), (15, 1)],
  term ((-80 : Rat) / 29) [(5, 2), (9, 1), (13, 2), (15, 3)],
  term ((-607 : Rat) / 232) [(5, 2), (9, 1), (15, 1)],
  term ((213 : Rat) / 58) [(5, 2), (9, 1), (15, 3)],
  term ((1116194112 : Rat) / 33189485) [(5, 2), (10, 1), (11, 1), (15, 1)],
  term ((-211968 : Rat) / 32699) [(5, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-31005392 : Rat) / 33189485) [(5, 2), (10, 1), (11, 1), (15, 3)],
  term ((5888 : Rat) / 32699) [(5, 2), (10, 1), (11, 1), (15, 3), (16, 1)],
  term ((-3986508072 : Rat) / 33189485) [(5, 2), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((762480 : Rat) / 32699) [(5, 2), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2989881054 : Rat) / 33189485) [(5, 2), (10, 1), (12, 1), (15, 2)],
  term ((571860 : Rat) / 32699) [(5, 2), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-48543810283 : Rat) / 199136910) [(5, 2), (10, 1), (13, 1), (15, 1)],
  term ((4670300 : Rat) / 98097) [(5, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((1993254036 : Rat) / 33189485) [(5, 2), (10, 1), (13, 1), (15, 3)],
  term ((-381240 : Rat) / 32699) [(5, 2), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((7973016144 : Rat) / 33189485) [(5, 2), (10, 1), (13, 2), (15, 2)],
  term ((-1524960 : Rat) / 32699) [(5, 2), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((3719562593 : Rat) / 199136910) [(5, 2), (10, 1), (15, 2)],
  term ((-357334 : Rat) / 98097) [(5, 2), (10, 1), (15, 2), (16, 1)],
  term ((-2989881054 : Rat) / 33189485) [(5, 2), (10, 1), (15, 4)],
  term ((571860 : Rat) / 32699) [(5, 2), (10, 1), (15, 4), (16, 1)],
  term ((-2906755500 : Rat) / 6637897) [(5, 2), (11, 1), (12, 1), (13, 1), (15, 2)],
  term ((2760000 : Rat) / 32699) [(5, 2), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((36134299337 : Rat) / 33189485) [(5, 2), (11, 1), (12, 1), (15, 1)],
  term ((-6920562 : Rat) / 32699) [(5, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3875674 : Rat) / 4741355) [(5, 2), (11, 1), (12, 1), (15, 3)],
  term ((5152 : Rat) / 32699) [(5, 2), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((-193687426123 : Rat) / 99568455) [(5, 2), (11, 1), (13, 1), (15, 2)],
  term ((37119556 : Rat) / 98097) [(5, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-2906755500 : Rat) / 6637897) [(5, 2), (11, 1), (13, 1), (15, 4)],
  term ((2760000 : Rat) / 32699) [(5, 2), (11, 1), (13, 1), (15, 4), (16, 1)],
  term ((5813511000 : Rat) / 6637897) [(5, 2), (11, 1), (13, 2), (15, 3)],
  term ((-5520000 : Rat) / 32699) [(5, 2), (11, 1), (13, 2), (15, 3), (16, 1)],
  term ((-9054528665 : Rat) / 11379252) [(5, 2), (11, 1), (15, 1)],
  term ((15159709 : Rat) / 98097) [(5, 2), (11, 1), (15, 1), (16, 1)],
  term ((215878580 : Rat) / 228893) [(5, 2), (11, 1), (15, 3)],
  term ((-5996182 : Rat) / 32699) [(5, 2), (11, 1), (15, 3), (16, 1)],
  term ((6883197024 : Rat) / 33189485) [(5, 2), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((-1307136 : Rat) / 32699) [(5, 2), (11, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-10107757792 : Rat) / 33189485) [(5, 2), (11, 2), (12, 1), (15, 2)],
  term ((1919488 : Rat) / 32699) [(5, 2), (11, 2), (12, 1), (15, 2), (16, 1)],
  term ((-5239911248 : Rat) / 33189485) [(5, 2), (11, 2), (13, 1), (15, 1)],
  term ((995072 : Rat) / 32699) [(5, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((27532788096 : Rat) / 33189485) [(5, 2), (11, 2), (13, 1), (15, 3)],
  term ((-5228544 : Rat) / 32699) [(5, 2), (11, 2), (13, 1), (15, 3), (16, 1)],
  term ((-13766394048 : Rat) / 33189485) [(5, 2), (11, 2), (13, 2), (15, 2)],
  term ((2614272 : Rat) / 32699) [(5, 2), (11, 2), (13, 2), (15, 2), (16, 1)],
  term ((9774449828 : Rat) / 33189485) [(5, 2), (11, 2), (15, 2)],
  term ((-1856192 : Rat) / 32699) [(5, 2), (11, 2), (15, 2), (16, 1)],
  term ((-10262784752 : Rat) / 33189485) [(5, 2), (11, 2), (15, 4)],
  term ((1948928 : Rat) / 32699) [(5, 2), (11, 2), (15, 4), (16, 1)],
  term ((-496086272 : Rat) / 33189485) [(5, 2), (11, 3), (13, 1), (15, 2)],
  term ((94208 : Rat) / 32699) [(5, 2), (11, 3), (13, 1), (15, 2), (16, 1)],
  term ((-93016176 : Rat) / 33189485) [(5, 2), (11, 3), (15, 1)],
  term ((17664 : Rat) / 32699) [(5, 2), (11, 3), (15, 1), (16, 1)],
  term ((124021568 : Rat) / 33189485) [(5, 2), (11, 3), (15, 3)],
  term ((-23552 : Rat) / 32699) [(5, 2), (11, 3), (15, 3), (16, 1)],
  term ((-109 : Rat) / 40) [(5, 2), (12, 1)],
  term ((72607343635 : Rat) / 53103176) [(5, 2), (12, 1), (13, 1), (15, 1)],
  term ((-8620783 : Rat) / 32699) [(5, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1736140985741 : Rat) / 1593095280) [(5, 2), (12, 1), (15, 2)],
  term ((41429629 : Rat) / 196194) [(5, 2), (12, 1), (15, 2), (16, 1)],
  term ((-1772226783001 : Rat) / 1593095280) [(5, 2), (13, 1), (15, 1)],
  term ((42167843 : Rat) / 196194) [(5, 2), (13, 1), (15, 1), (16, 1)],
  term ((179348477725 : Rat) / 53103176) [(5, 2), (13, 1), (15, 3)],
  term ((-21400505 : Rat) / 32699) [(5, 2), (13, 1), (15, 3), (16, 1)],
  term ((41 : Rat) / 20) [(5, 2), (13, 2)],
  term ((-361948103067 : Rat) / 132757940) [(5, 2), (13, 2), (15, 2)],
  term ((17241566 : Rat) / 32699) [(5, 2), (13, 2), (15, 2), (16, 1)],
  term ((1365684604141 : Rat) / 1593095280) [(5, 2), (15, 2)],
  term ((-32771201 : Rat) / 196194) [(5, 2), (15, 2), (16, 1)],
  term ((-713886046843 : Rat) / 796547640) [(5, 2), (15, 4)],
  term ((17064581 : Rat) / 98097) [(5, 2), (15, 4), (16, 1)],
  term ((80 : Rat) / 29) [(8, 1), (9, 1), (12, 1), (13, 1), (15, 2)],
  term ((92 : Rat) / 29) [(8, 1), (9, 1), (12, 1), (15, 1)],
  term ((-15 : Rat) / 8) [(8, 1), (9, 1), (13, 1)],
  term ((-827 : Rat) / 58) [(8, 1), (9, 1), (13, 1), (15, 2)],
  term ((80 : Rat) / 29) [(8, 1), (9, 1), (13, 1), (15, 4)],
  term (-5 : Rat) [(8, 1), (9, 1), (13, 2), (15, 1)],
  term ((-160 : Rat) / 29) [(8, 1), (9, 1), (13, 2), (15, 3)],
  term ((-607 : Rat) / 116) [(8, 1), (9, 1), (15, 1)],
  term ((213 : Rat) / 29) [(8, 1), (9, 1), (15, 3)],
  term ((2232388224 : Rat) / 33189485) [(8, 1), (10, 1), (11, 1), (15, 1)],
  term ((-423936 : Rat) / 32699) [(8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-62010784 : Rat) / 33189485) [(8, 1), (10, 1), (11, 1), (15, 3)],
  term ((11776 : Rat) / 32699) [(8, 1), (10, 1), (11, 1), (15, 3), (16, 1)],
  term ((-7973016144 : Rat) / 33189485) [(8, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((1524960 : Rat) / 32699) [(8, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-5979762108 : Rat) / 33189485) [(8, 1), (10, 1), (12, 1), (15, 2)],
  term ((1143720 : Rat) / 32699) [(8, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-48543810283 : Rat) / 99568455) [(8, 1), (10, 1), (13, 1), (15, 1)],
  term ((9340600 : Rat) / 98097) [(8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((3986508072 : Rat) / 33189485) [(8, 1), (10, 1), (13, 1), (15, 3)],
  term ((-762480 : Rat) / 32699) [(8, 1), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((15946032288 : Rat) / 33189485) [(8, 1), (10, 1), (13, 2), (15, 2)],
  term ((-3049920 : Rat) / 32699) [(8, 1), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((3719562593 : Rat) / 99568455) [(8, 1), (10, 1), (15, 2)],
  term ((-714668 : Rat) / 98097) [(8, 1), (10, 1), (15, 2), (16, 1)],
  term ((-5979762108 : Rat) / 33189485) [(8, 1), (10, 1), (15, 4)],
  term ((1143720 : Rat) / 32699) [(8, 1), (10, 1), (15, 4), (16, 1)],
  term ((-5813511000 : Rat) / 6637897) [(8, 1), (11, 1), (12, 1), (13, 1), (15, 2)],
  term ((5520000 : Rat) / 32699) [(8, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((72268598674 : Rat) / 33189485) [(8, 1), (11, 1), (12, 1), (15, 1)],
  term ((-13841124 : Rat) / 32699) [(8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-7751348 : Rat) / 4741355) [(8, 1), (11, 1), (12, 1), (15, 3)],
  term ((10304 : Rat) / 32699) [(8, 1), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((-387374852246 : Rat) / 99568455) [(8, 1), (11, 1), (13, 1), (15, 2)],
  term ((74239112 : Rat) / 98097) [(8, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-5813511000 : Rat) / 6637897) [(8, 1), (11, 1), (13, 1), (15, 4)],
  term ((5520000 : Rat) / 32699) [(8, 1), (11, 1), (13, 1), (15, 4), (16, 1)],
  term ((11627022000 : Rat) / 6637897) [(8, 1), (11, 1), (13, 2), (15, 3)],
  term ((-11040000 : Rat) / 32699) [(8, 1), (11, 1), (13, 2), (15, 3), (16, 1)],
  term ((-9054528665 : Rat) / 5689626) [(8, 1), (11, 1), (15, 1)],
  term ((30319418 : Rat) / 98097) [(8, 1), (11, 1), (15, 1), (16, 1)],
  term ((431757160 : Rat) / 228893) [(8, 1), (11, 1), (15, 3)],
  term ((-11992364 : Rat) / 32699) [(8, 1), (11, 1), (15, 3), (16, 1)],
  term ((13766394048 : Rat) / 33189485) [(8, 1), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((-2614272 : Rat) / 32699) [(8, 1), (11, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-20215515584 : Rat) / 33189485) [(8, 1), (11, 2), (12, 1), (15, 2)],
  term ((3838976 : Rat) / 32699) [(8, 1), (11, 2), (12, 1), (15, 2), (16, 1)],
  term ((-10479822496 : Rat) / 33189485) [(8, 1), (11, 2), (13, 1), (15, 1)],
  term ((1990144 : Rat) / 32699) [(8, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((55065576192 : Rat) / 33189485) [(8, 1), (11, 2), (13, 1), (15, 3)],
  term ((-10457088 : Rat) / 32699) [(8, 1), (11, 2), (13, 1), (15, 3), (16, 1)],
  term ((-27532788096 : Rat) / 33189485) [(8, 1), (11, 2), (13, 2), (15, 2)],
  term ((5228544 : Rat) / 32699) [(8, 1), (11, 2), (13, 2), (15, 2), (16, 1)],
  term ((19548899656 : Rat) / 33189485) [(8, 1), (11, 2), (15, 2)],
  term ((-3712384 : Rat) / 32699) [(8, 1), (11, 2), (15, 2), (16, 1)],
  term ((-20525569504 : Rat) / 33189485) [(8, 1), (11, 2), (15, 4)],
  term ((3897856 : Rat) / 32699) [(8, 1), (11, 2), (15, 4), (16, 1)],
  term ((-992172544 : Rat) / 33189485) [(8, 1), (11, 3), (13, 1), (15, 2)],
  term ((188416 : Rat) / 32699) [(8, 1), (11, 3), (13, 1), (15, 2), (16, 1)],
  term ((-186032352 : Rat) / 33189485) [(8, 1), (11, 3), (15, 1)],
  term ((35328 : Rat) / 32699) [(8, 1), (11, 3), (15, 1), (16, 1)],
  term ((248043136 : Rat) / 33189485) [(8, 1), (11, 3), (15, 3)],
  term ((-47104 : Rat) / 32699) [(8, 1), (11, 3), (15, 3), (16, 1)],
  term ((-109 : Rat) / 20) [(8, 1), (12, 1)],
  term ((72607343635 : Rat) / 26551588) [(8, 1), (12, 1), (13, 1), (15, 1)],
  term ((-17241566 : Rat) / 32699) [(8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1736140985741 : Rat) / 796547640) [(8, 1), (12, 1), (15, 2)],
  term ((41429629 : Rat) / 98097) [(8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-1772226783001 : Rat) / 796547640) [(8, 1), (13, 1), (15, 1)],
  term ((42167843 : Rat) / 98097) [(8, 1), (13, 1), (15, 1), (16, 1)],
  term ((179348477725 : Rat) / 26551588) [(8, 1), (13, 1), (15, 3)],
  term ((-42801010 : Rat) / 32699) [(8, 1), (13, 1), (15, 3), (16, 1)],
  term ((41 : Rat) / 10) [(8, 1), (13, 2)],
  term ((-361948103067 : Rat) / 66378970) [(8, 1), (13, 2), (15, 2)],
  term ((34483132 : Rat) / 32699) [(8, 1), (13, 2), (15, 2), (16, 1)],
  term ((1365684604141 : Rat) / 796547640) [(8, 1), (15, 2)],
  term ((-32771201 : Rat) / 98097) [(8, 1), (15, 2), (16, 1)],
  term ((-713886046843 : Rat) / 398273820) [(8, 1), (15, 4)],
  term ((34129162 : Rat) / 98097) [(8, 1), (15, 4), (16, 1)],
  term ((-40 : Rat) / 29) [(8, 2), (9, 1), (12, 1), (13, 1), (15, 2)],
  term ((-46 : Rat) / 29) [(8, 2), (9, 1), (12, 1), (15, 1)],
  term ((15 : Rat) / 16) [(8, 2), (9, 1), (13, 1)],
  term ((827 : Rat) / 116) [(8, 2), (9, 1), (13, 1), (15, 2)],
  term ((-40 : Rat) / 29) [(8, 2), (9, 1), (13, 1), (15, 4)],
  term ((5 : Rat) / 2) [(8, 2), (9, 1), (13, 2), (15, 1)],
  term ((80 : Rat) / 29) [(8, 2), (9, 1), (13, 2), (15, 3)],
  term ((607 : Rat) / 232) [(8, 2), (9, 1), (15, 1)],
  term ((-213 : Rat) / 58) [(8, 2), (9, 1), (15, 3)],
  term ((-1116194112 : Rat) / 33189485) [(8, 2), (10, 1), (11, 1), (15, 1)],
  term ((211968 : Rat) / 32699) [(8, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((31005392 : Rat) / 33189485) [(8, 2), (10, 1), (11, 1), (15, 3)],
  term ((-5888 : Rat) / 32699) [(8, 2), (10, 1), (11, 1), (15, 3), (16, 1)],
  term ((3986508072 : Rat) / 33189485) [(8, 2), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((-762480 : Rat) / 32699) [(8, 2), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((2989881054 : Rat) / 33189485) [(8, 2), (10, 1), (12, 1), (15, 2)],
  term ((-571860 : Rat) / 32699) [(8, 2), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((48543810283 : Rat) / 199136910) [(8, 2), (10, 1), (13, 1), (15, 1)],
  term ((-4670300 : Rat) / 98097) [(8, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1993254036 : Rat) / 33189485) [(8, 2), (10, 1), (13, 1), (15, 3)],
  term ((381240 : Rat) / 32699) [(8, 2), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((-7973016144 : Rat) / 33189485) [(8, 2), (10, 1), (13, 2), (15, 2)],
  term ((1524960 : Rat) / 32699) [(8, 2), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((-3719562593 : Rat) / 199136910) [(8, 2), (10, 1), (15, 2)],
  term ((357334 : Rat) / 98097) [(8, 2), (10, 1), (15, 2), (16, 1)],
  term ((2989881054 : Rat) / 33189485) [(8, 2), (10, 1), (15, 4)],
  term ((-571860 : Rat) / 32699) [(8, 2), (10, 1), (15, 4), (16, 1)],
  term ((2906755500 : Rat) / 6637897) [(8, 2), (11, 1), (12, 1), (13, 1), (15, 2)],
  term ((-2760000 : Rat) / 32699) [(8, 2), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-36134299337 : Rat) / 33189485) [(8, 2), (11, 1), (12, 1), (15, 1)],
  term ((6920562 : Rat) / 32699) [(8, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((3875674 : Rat) / 4741355) [(8, 2), (11, 1), (12, 1), (15, 3)],
  term ((-5152 : Rat) / 32699) [(8, 2), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((193687426123 : Rat) / 99568455) [(8, 2), (11, 1), (13, 1), (15, 2)],
  term ((-37119556 : Rat) / 98097) [(8, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((2906755500 : Rat) / 6637897) [(8, 2), (11, 1), (13, 1), (15, 4)],
  term ((-2760000 : Rat) / 32699) [(8, 2), (11, 1), (13, 1), (15, 4), (16, 1)],
  term ((-5813511000 : Rat) / 6637897) [(8, 2), (11, 1), (13, 2), (15, 3)],
  term ((5520000 : Rat) / 32699) [(8, 2), (11, 1), (13, 2), (15, 3), (16, 1)],
  term ((9054528665 : Rat) / 11379252) [(8, 2), (11, 1), (15, 1)],
  term ((-15159709 : Rat) / 98097) [(8, 2), (11, 1), (15, 1), (16, 1)],
  term ((-215878580 : Rat) / 228893) [(8, 2), (11, 1), (15, 3)],
  term ((5996182 : Rat) / 32699) [(8, 2), (11, 1), (15, 3), (16, 1)],
  term ((-6883197024 : Rat) / 33189485) [(8, 2), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((1307136 : Rat) / 32699) [(8, 2), (11, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((10107757792 : Rat) / 33189485) [(8, 2), (11, 2), (12, 1), (15, 2)],
  term ((-1919488 : Rat) / 32699) [(8, 2), (11, 2), (12, 1), (15, 2), (16, 1)],
  term ((5239911248 : Rat) / 33189485) [(8, 2), (11, 2), (13, 1), (15, 1)],
  term ((-995072 : Rat) / 32699) [(8, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-27532788096 : Rat) / 33189485) [(8, 2), (11, 2), (13, 1), (15, 3)],
  term ((5228544 : Rat) / 32699) [(8, 2), (11, 2), (13, 1), (15, 3), (16, 1)],
  term ((13766394048 : Rat) / 33189485) [(8, 2), (11, 2), (13, 2), (15, 2)],
  term ((-2614272 : Rat) / 32699) [(8, 2), (11, 2), (13, 2), (15, 2), (16, 1)],
  term ((-9774449828 : Rat) / 33189485) [(8, 2), (11, 2), (15, 2)],
  term ((1856192 : Rat) / 32699) [(8, 2), (11, 2), (15, 2), (16, 1)],
  term ((10262784752 : Rat) / 33189485) [(8, 2), (11, 2), (15, 4)],
  term ((-1948928 : Rat) / 32699) [(8, 2), (11, 2), (15, 4), (16, 1)],
  term ((496086272 : Rat) / 33189485) [(8, 2), (11, 3), (13, 1), (15, 2)],
  term ((-94208 : Rat) / 32699) [(8, 2), (11, 3), (13, 1), (15, 2), (16, 1)],
  term ((93016176 : Rat) / 33189485) [(8, 2), (11, 3), (15, 1)],
  term ((-17664 : Rat) / 32699) [(8, 2), (11, 3), (15, 1), (16, 1)],
  term ((-124021568 : Rat) / 33189485) [(8, 2), (11, 3), (15, 3)],
  term ((23552 : Rat) / 32699) [(8, 2), (11, 3), (15, 3), (16, 1)],
  term ((109 : Rat) / 40) [(8, 2), (12, 1)],
  term ((-72607343635 : Rat) / 53103176) [(8, 2), (12, 1), (13, 1), (15, 1)],
  term ((8620783 : Rat) / 32699) [(8, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1736140985741 : Rat) / 1593095280) [(8, 2), (12, 1), (15, 2)],
  term ((-41429629 : Rat) / 196194) [(8, 2), (12, 1), (15, 2), (16, 1)],
  term ((1772226783001 : Rat) / 1593095280) [(8, 2), (13, 1), (15, 1)],
  term ((-42167843 : Rat) / 196194) [(8, 2), (13, 1), (15, 1), (16, 1)],
  term ((-179348477725 : Rat) / 53103176) [(8, 2), (13, 1), (15, 3)],
  term ((21400505 : Rat) / 32699) [(8, 2), (13, 1), (15, 3), (16, 1)],
  term ((-41 : Rat) / 20) [(8, 2), (13, 2)],
  term ((361948103067 : Rat) / 132757940) [(8, 2), (13, 2), (15, 2)],
  term ((-17241566 : Rat) / 32699) [(8, 2), (13, 2), (15, 2), (16, 1)],
  term ((-1365684604141 : Rat) / 1593095280) [(8, 2), (15, 2)],
  term ((32771201 : Rat) / 196194) [(8, 2), (15, 2), (16, 1)],
  term ((713886046843 : Rat) / 796547640) [(8, 2), (15, 4)],
  term ((-17064581 : Rat) / 98097) [(8, 2), (15, 4), (16, 1)],
  term ((-1116194112 : Rat) / 33189485) [(9, 2), (10, 1), (11, 1), (15, 1)],
  term ((211968 : Rat) / 32699) [(9, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((31005392 : Rat) / 33189485) [(9, 2), (10, 1), (11, 1), (15, 3)],
  term ((-5888 : Rat) / 32699) [(9, 2), (10, 1), (11, 1), (15, 3), (16, 1)],
  term ((3986508072 : Rat) / 33189485) [(9, 2), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((-762480 : Rat) / 32699) [(9, 2), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((2989881054 : Rat) / 33189485) [(9, 2), (10, 1), (12, 1), (15, 2)],
  term ((-571860 : Rat) / 32699) [(9, 2), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((48543810283 : Rat) / 199136910) [(9, 2), (10, 1), (13, 1), (15, 1)],
  term ((-4670300 : Rat) / 98097) [(9, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1993254036 : Rat) / 33189485) [(9, 2), (10, 1), (13, 1), (15, 3)],
  term ((381240 : Rat) / 32699) [(9, 2), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((-7973016144 : Rat) / 33189485) [(9, 2), (10, 1), (13, 2), (15, 2)],
  term ((1524960 : Rat) / 32699) [(9, 2), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((-3719562593 : Rat) / 199136910) [(9, 2), (10, 1), (15, 2)],
  term ((357334 : Rat) / 98097) [(9, 2), (10, 1), (15, 2), (16, 1)],
  term ((2989881054 : Rat) / 33189485) [(9, 2), (10, 1), (15, 4)],
  term ((-571860 : Rat) / 32699) [(9, 2), (10, 1), (15, 4), (16, 1)],
  term ((2906755500 : Rat) / 6637897) [(9, 2), (11, 1), (12, 1), (13, 1), (15, 2)],
  term ((-2760000 : Rat) / 32699) [(9, 2), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-36134299337 : Rat) / 33189485) [(9, 2), (11, 1), (12, 1), (15, 1)],
  term ((6920562 : Rat) / 32699) [(9, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((3875674 : Rat) / 4741355) [(9, 2), (11, 1), (12, 1), (15, 3)],
  term ((-5152 : Rat) / 32699) [(9, 2), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((193687426123 : Rat) / 99568455) [(9, 2), (11, 1), (13, 1), (15, 2)],
  term ((-37119556 : Rat) / 98097) [(9, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((2906755500 : Rat) / 6637897) [(9, 2), (11, 1), (13, 1), (15, 4)],
  term ((-2760000 : Rat) / 32699) [(9, 2), (11, 1), (13, 1), (15, 4), (16, 1)],
  term ((-5813511000 : Rat) / 6637897) [(9, 2), (11, 1), (13, 2), (15, 3)],
  term ((5520000 : Rat) / 32699) [(9, 2), (11, 1), (13, 2), (15, 3), (16, 1)],
  term ((9054528665 : Rat) / 11379252) [(9, 2), (11, 1), (15, 1)],
  term ((-15159709 : Rat) / 98097) [(9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-215878580 : Rat) / 228893) [(9, 2), (11, 1), (15, 3)],
  term ((5996182 : Rat) / 32699) [(9, 2), (11, 1), (15, 3), (16, 1)],
  term ((-6883197024 : Rat) / 33189485) [(9, 2), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((1307136 : Rat) / 32699) [(9, 2), (11, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((10107757792 : Rat) / 33189485) [(9, 2), (11, 2), (12, 1), (15, 2)],
  term ((-1919488 : Rat) / 32699) [(9, 2), (11, 2), (12, 1), (15, 2), (16, 1)],
  term ((5239911248 : Rat) / 33189485) [(9, 2), (11, 2), (13, 1), (15, 1)],
  term ((-995072 : Rat) / 32699) [(9, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-27532788096 : Rat) / 33189485) [(9, 2), (11, 2), (13, 1), (15, 3)],
  term ((5228544 : Rat) / 32699) [(9, 2), (11, 2), (13, 1), (15, 3), (16, 1)],
  term ((13766394048 : Rat) / 33189485) [(9, 2), (11, 2), (13, 2), (15, 2)],
  term ((-2614272 : Rat) / 32699) [(9, 2), (11, 2), (13, 2), (15, 2), (16, 1)],
  term ((-9774449828 : Rat) / 33189485) [(9, 2), (11, 2), (15, 2)],
  term ((1856192 : Rat) / 32699) [(9, 2), (11, 2), (15, 2), (16, 1)],
  term ((10262784752 : Rat) / 33189485) [(9, 2), (11, 2), (15, 4)],
  term ((-1948928 : Rat) / 32699) [(9, 2), (11, 2), (15, 4), (16, 1)],
  term ((496086272 : Rat) / 33189485) [(9, 2), (11, 3), (13, 1), (15, 2)],
  term ((-94208 : Rat) / 32699) [(9, 2), (11, 3), (13, 1), (15, 2), (16, 1)],
  term ((93016176 : Rat) / 33189485) [(9, 2), (11, 3), (15, 1)],
  term ((-17664 : Rat) / 32699) [(9, 2), (11, 3), (15, 1), (16, 1)],
  term ((-124021568 : Rat) / 33189485) [(9, 2), (11, 3), (15, 3)],
  term ((23552 : Rat) / 32699) [(9, 2), (11, 3), (15, 3), (16, 1)],
  term ((109 : Rat) / 40) [(9, 2), (12, 1)],
  term ((-72607343635 : Rat) / 53103176) [(9, 2), (12, 1), (13, 1), (15, 1)],
  term ((8620783 : Rat) / 32699) [(9, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1736140985741 : Rat) / 1593095280) [(9, 2), (12, 1), (15, 2)],
  term ((-41429629 : Rat) / 196194) [(9, 2), (12, 1), (15, 2), (16, 1)],
  term ((1772226783001 : Rat) / 1593095280) [(9, 2), (13, 1), (15, 1)],
  term ((-42167843 : Rat) / 196194) [(9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-179348477725 : Rat) / 53103176) [(9, 2), (13, 1), (15, 3)],
  term ((21400505 : Rat) / 32699) [(9, 2), (13, 1), (15, 3), (16, 1)],
  term ((-41 : Rat) / 20) [(9, 2), (13, 2)],
  term ((361948103067 : Rat) / 132757940) [(9, 2), (13, 2), (15, 2)],
  term ((-17241566 : Rat) / 32699) [(9, 2), (13, 2), (15, 2), (16, 1)],
  term ((-1365684604141 : Rat) / 1593095280) [(9, 2), (15, 2)],
  term ((32771201 : Rat) / 196194) [(9, 2), (15, 2), (16, 1)],
  term ((713886046843 : Rat) / 796547640) [(9, 2), (15, 4)],
  term ((-17064581 : Rat) / 98097) [(9, 2), (15, 4), (16, 1)],
  term ((-40 : Rat) / 29) [(9, 3), (12, 1), (13, 1), (15, 2)],
  term ((-46 : Rat) / 29) [(9, 3), (12, 1), (15, 1)],
  term ((15 : Rat) / 16) [(9, 3), (13, 1)],
  term ((827 : Rat) / 116) [(9, 3), (13, 1), (15, 2)],
  term ((-40 : Rat) / 29) [(9, 3), (13, 1), (15, 4)],
  term ((5 : Rat) / 2) [(9, 3), (13, 2), (15, 1)],
  term ((80 : Rat) / 29) [(9, 3), (13, 2), (15, 3)],
  term ((607 : Rat) / 232) [(9, 3), (15, 1)],
  term ((-213 : Rat) / 58) [(9, 3), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 3, terms 100 through 178. -/
theorem rs_R009_ueqv_R009NYYYY_block_03_0100_0178_valid :
    checkProductSumEq rs_R009_ueqv_R009NYYYY_partials_03_0100_0178
      rs_R009_ueqv_R009NYYYY_block_03_0100_0178 = true := by
  native_decide

end R009UeqvR009NYYYYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
