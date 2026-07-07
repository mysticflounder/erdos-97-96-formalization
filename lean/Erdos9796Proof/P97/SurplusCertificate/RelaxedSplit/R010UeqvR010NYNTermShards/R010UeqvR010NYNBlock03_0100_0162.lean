/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R010:u=v:R010NYN, term block 3:100-162

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R010UeqvR010NYNTermShards

/-- Generator polynomial 3 for relaxed split surplus certificate `R010:u=v:R010NYN`. -/
def rs_R010_ueqv_R010NYN_generator_03_0100_0162 : Poly :=
[
  term (-2 : Rat) [(6, 1)],
  term (1 : Rat) [(6, 2)],
  term (1 : Rat) [(7, 2)],
  term (2 : Rat) [(8, 1)],
  term (-1 : Rat) [(8, 2)],
  term (-1 : Rat) [(9, 2)]
]

/-- Coefficient term 100 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010NYN_coefficient_03_0100 : Poly :=
[
  term ((46608 : Rat) / 599) [(5, 1), (15, 1)]
]

/-- Partial product 100 for generator 3. -/
def rs_R010_ueqv_R010NYN_partial_03_0100 : Poly :=
[
  term ((-93216 : Rat) / 599) [(5, 1), (6, 1), (15, 1)],
  term ((46608 : Rat) / 599) [(5, 1), (6, 2), (15, 1)],
  term ((46608 : Rat) / 599) [(5, 1), (7, 2), (15, 1)],
  term ((93216 : Rat) / 599) [(5, 1), (8, 1), (15, 1)],
  term ((-46608 : Rat) / 599) [(5, 1), (8, 2), (15, 1)],
  term ((-46608 : Rat) / 599) [(5, 1), (9, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 3. -/
theorem rs_R010_ueqv_R010NYN_partial_03_0100_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_03_0100
        rs_R010_ueqv_R010NYN_generator_03_0100_0162 =
      rs_R010_ueqv_R010NYN_partial_03_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010NYN_coefficient_03_0101 : Poly :=
[
  term ((-170688 : Rat) / 2995) [(5, 1), (15, 3)]
]

/-- Partial product 101 for generator 3. -/
def rs_R010_ueqv_R010NYN_partial_03_0101 : Poly :=
[
  term ((341376 : Rat) / 2995) [(5, 1), (6, 1), (15, 3)],
  term ((-170688 : Rat) / 2995) [(5, 1), (6, 2), (15, 3)],
  term ((-170688 : Rat) / 2995) [(5, 1), (7, 2), (15, 3)],
  term ((-341376 : Rat) / 2995) [(5, 1), (8, 1), (15, 3)],
  term ((170688 : Rat) / 2995) [(5, 1), (8, 2), (15, 3)],
  term ((170688 : Rat) / 2995) [(5, 1), (9, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 3. -/
theorem rs_R010_ueqv_R010NYN_partial_03_0101_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_03_0101
        rs_R010_ueqv_R010NYN_generator_03_0100_0162 =
      rs_R010_ueqv_R010NYN_partial_03_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010NYN_coefficient_03_0102 : Poly :=
[
  term ((64 : Rat) / 5) [(5, 1), (15, 3), (16, 1)]
]

/-- Partial product 102 for generator 3. -/
def rs_R010_ueqv_R010NYN_partial_03_0102 : Poly :=
[
  term ((-128 : Rat) / 5) [(5, 1), (6, 1), (15, 3), (16, 1)],
  term ((64 : Rat) / 5) [(5, 1), (6, 2), (15, 3), (16, 1)],
  term ((64 : Rat) / 5) [(5, 1), (7, 2), (15, 3), (16, 1)],
  term ((128 : Rat) / 5) [(5, 1), (8, 1), (15, 3), (16, 1)],
  term ((-64 : Rat) / 5) [(5, 1), (8, 2), (15, 3), (16, 1)],
  term ((-64 : Rat) / 5) [(5, 1), (9, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 3. -/
theorem rs_R010_ueqv_R010NYN_partial_03_0102_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_03_0102
        rs_R010_ueqv_R010NYN_generator_03_0100_0162 =
      rs_R010_ueqv_R010NYN_partial_03_0102 := by
  native_decide

/-- Coefficient term 103 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010NYN_coefficient_03_0103 : Poly :=
[
  term ((-160704 : Rat) / 2995) [(6, 1), (11, 1), (15, 1)]
]

/-- Partial product 103 for generator 3. -/
def rs_R010_ueqv_R010NYN_partial_03_0103 : Poly :=
[
  term ((-160704 : Rat) / 2995) [(6, 1), (7, 2), (11, 1), (15, 1)],
  term ((-321408 : Rat) / 2995) [(6, 1), (8, 1), (11, 1), (15, 1)],
  term ((160704 : Rat) / 2995) [(6, 1), (8, 2), (11, 1), (15, 1)],
  term ((160704 : Rat) / 2995) [(6, 1), (9, 2), (11, 1), (15, 1)],
  term ((321408 : Rat) / 2995) [(6, 2), (11, 1), (15, 1)],
  term ((-160704 : Rat) / 2995) [(6, 3), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 103 for generator 3. -/
theorem rs_R010_ueqv_R010NYN_partial_03_0103_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_03_0103
        rs_R010_ueqv_R010NYN_generator_03_0100_0162 =
      rs_R010_ueqv_R010NYN_partial_03_0103 := by
  native_decide

/-- Coefficient term 104 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010NYN_coefficient_03_0104 : Poly :=
[
  term ((-56448 : Rat) / 2995) [(6, 1), (15, 2)]
]

/-- Partial product 104 for generator 3. -/
def rs_R010_ueqv_R010NYN_partial_03_0104 : Poly :=
[
  term ((-56448 : Rat) / 2995) [(6, 1), (7, 2), (15, 2)],
  term ((-112896 : Rat) / 2995) [(6, 1), (8, 1), (15, 2)],
  term ((56448 : Rat) / 2995) [(6, 1), (8, 2), (15, 2)],
  term ((56448 : Rat) / 2995) [(6, 1), (9, 2), (15, 2)],
  term ((112896 : Rat) / 2995) [(6, 2), (15, 2)],
  term ((-56448 : Rat) / 2995) [(6, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 104 for generator 3. -/
theorem rs_R010_ueqv_R010NYN_partial_03_0104_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_03_0104
        rs_R010_ueqv_R010NYN_generator_03_0100_0162 =
      rs_R010_ueqv_R010NYN_partial_03_0104 := by
  native_decide

/-- Coefficient term 105 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010NYN_coefficient_03_0105 : Poly :=
[
  term ((-26 : Rat) / 5) [(6, 1), (15, 2), (16, 1)]
]

/-- Partial product 105 for generator 3. -/
def rs_R010_ueqv_R010NYN_partial_03_0105 : Poly :=
[
  term ((-26 : Rat) / 5) [(6, 1), (7, 2), (15, 2), (16, 1)],
  term ((-52 : Rat) / 5) [(6, 1), (8, 1), (15, 2), (16, 1)],
  term ((26 : Rat) / 5) [(6, 1), (8, 2), (15, 2), (16, 1)],
  term ((26 : Rat) / 5) [(6, 1), (9, 2), (15, 2), (16, 1)],
  term ((52 : Rat) / 5) [(6, 2), (15, 2), (16, 1)],
  term ((-26 : Rat) / 5) [(6, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 105 for generator 3. -/
theorem rs_R010_ueqv_R010NYN_partial_03_0105_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_03_0105
        rs_R010_ueqv_R010NYN_generator_03_0100_0162 =
      rs_R010_ueqv_R010NYN_partial_03_0105 := by
  native_decide

/-- Coefficient term 106 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010NYN_coefficient_03_0106 : Poly :=
[
  term ((-9967104 : Rat) / 2995) [(7, 1), (11, 1), (15, 2)]
]

/-- Partial product 106 for generator 3. -/
def rs_R010_ueqv_R010NYN_partial_03_0106 : Poly :=
[
  term ((19934208 : Rat) / 2995) [(6, 1), (7, 1), (11, 1), (15, 2)],
  term ((-9967104 : Rat) / 2995) [(6, 2), (7, 1), (11, 1), (15, 2)],
  term ((-19934208 : Rat) / 2995) [(7, 1), (8, 1), (11, 1), (15, 2)],
  term ((9967104 : Rat) / 2995) [(7, 1), (8, 2), (11, 1), (15, 2)],
  term ((9967104 : Rat) / 2995) [(7, 1), (9, 2), (11, 1), (15, 2)],
  term ((-9967104 : Rat) / 2995) [(7, 3), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 106 for generator 3. -/
theorem rs_R010_ueqv_R010NYN_partial_03_0106_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_03_0106
        rs_R010_ueqv_R010NYN_generator_03_0100_0162 =
      rs_R010_ueqv_R010NYN_partial_03_0106 := by
  native_decide

/-- Coefficient term 107 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010NYN_coefficient_03_0107 : Poly :=
[
  term ((1896 : Rat) / 5) [(7, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 107 for generator 3. -/
def rs_R010_ueqv_R010NYN_partial_03_0107 : Poly :=
[
  term ((-3792 : Rat) / 5) [(6, 1), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((1896 : Rat) / 5) [(6, 2), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((3792 : Rat) / 5) [(7, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((-1896 : Rat) / 5) [(7, 1), (8, 2), (11, 1), (15, 2), (16, 1)],
  term ((-1896 : Rat) / 5) [(7, 1), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((1896 : Rat) / 5) [(7, 3), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 107 for generator 3. -/
theorem rs_R010_ueqv_R010NYN_partial_03_0107_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_03_0107
        rs_R010_ueqv_R010NYN_generator_03_0100_0162 =
      rs_R010_ueqv_R010NYN_partial_03_0107 := by
  native_decide

/-- Coefficient term 108 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010NYN_coefficient_03_0108 : Poly :=
[
  term ((5785344 : Rat) / 2995) [(7, 1), (11, 2), (15, 1)]
]

/-- Partial product 108 for generator 3. -/
def rs_R010_ueqv_R010NYN_partial_03_0108 : Poly :=
[
  term ((-11570688 : Rat) / 2995) [(6, 1), (7, 1), (11, 2), (15, 1)],
  term ((5785344 : Rat) / 2995) [(6, 2), (7, 1), (11, 2), (15, 1)],
  term ((11570688 : Rat) / 2995) [(7, 1), (8, 1), (11, 2), (15, 1)],
  term ((-5785344 : Rat) / 2995) [(7, 1), (8, 2), (11, 2), (15, 1)],
  term ((-5785344 : Rat) / 2995) [(7, 1), (9, 2), (11, 2), (15, 1)],
  term ((5785344 : Rat) / 2995) [(7, 3), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 108 for generator 3. -/
theorem rs_R010_ueqv_R010NYN_partial_03_0108_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_03_0108
        rs_R010_ueqv_R010NYN_generator_03_0100_0162 =
      rs_R010_ueqv_R010NYN_partial_03_0108 := by
  native_decide

/-- Coefficient term 109 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010NYN_coefficient_03_0109 : Poly :=
[
  term ((-42144 : Rat) / 599) [(7, 1), (15, 1)]
]

/-- Partial product 109 for generator 3. -/
def rs_R010_ueqv_R010NYN_partial_03_0109 : Poly :=
[
  term ((84288 : Rat) / 599) [(6, 1), (7, 1), (15, 1)],
  term ((-42144 : Rat) / 599) [(6, 2), (7, 1), (15, 1)],
  term ((-84288 : Rat) / 599) [(7, 1), (8, 1), (15, 1)],
  term ((42144 : Rat) / 599) [(7, 1), (8, 2), (15, 1)],
  term ((42144 : Rat) / 599) [(7, 1), (9, 2), (15, 1)],
  term ((-42144 : Rat) / 599) [(7, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 109 for generator 3. -/
theorem rs_R010_ueqv_R010NYN_partial_03_0109_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_03_0109
        rs_R010_ueqv_R010NYN_generator_03_0100_0162 =
      rs_R010_ueqv_R010NYN_partial_03_0109 := by
  native_decide

/-- Coefficient term 110 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010NYN_coefficient_03_0110 : Poly :=
[
  term ((4847616 : Rat) / 2995) [(7, 1), (15, 3)]
]

/-- Partial product 110 for generator 3. -/
def rs_R010_ueqv_R010NYN_partial_03_0110 : Poly :=
[
  term ((-9695232 : Rat) / 2995) [(6, 1), (7, 1), (15, 3)],
  term ((4847616 : Rat) / 2995) [(6, 2), (7, 1), (15, 3)],
  term ((9695232 : Rat) / 2995) [(7, 1), (8, 1), (15, 3)],
  term ((-4847616 : Rat) / 2995) [(7, 1), (8, 2), (15, 3)],
  term ((-4847616 : Rat) / 2995) [(7, 1), (9, 2), (15, 3)],
  term ((4847616 : Rat) / 2995) [(7, 3), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 110 for generator 3. -/
theorem rs_R010_ueqv_R010NYN_partial_03_0110_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_03_0110
        rs_R010_ueqv_R010NYN_generator_03_0100_0162 =
      rs_R010_ueqv_R010NYN_partial_03_0110 := by
  native_decide

/-- Coefficient term 111 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010NYN_coefficient_03_0111 : Poly :=
[
  term ((-1068 : Rat) / 5) [(7, 1), (15, 3), (16, 1)]
]

/-- Partial product 111 for generator 3. -/
def rs_R010_ueqv_R010NYN_partial_03_0111 : Poly :=
[
  term ((2136 : Rat) / 5) [(6, 1), (7, 1), (15, 3), (16, 1)],
  term ((-1068 : Rat) / 5) [(6, 2), (7, 1), (15, 3), (16, 1)],
  term ((-2136 : Rat) / 5) [(7, 1), (8, 1), (15, 3), (16, 1)],
  term ((1068 : Rat) / 5) [(7, 1), (8, 2), (15, 3), (16, 1)],
  term ((1068 : Rat) / 5) [(7, 1), (9, 2), (15, 3), (16, 1)],
  term ((-1068 : Rat) / 5) [(7, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 111 for generator 3. -/
theorem rs_R010_ueqv_R010NYN_partial_03_0111_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_03_0111
        rs_R010_ueqv_R010NYN_generator_03_0100_0162 =
      rs_R010_ueqv_R010NYN_partial_03_0111 := by
  native_decide

/-- Coefficient term 112 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010NYN_coefficient_03_0112 : Poly :=
[
  term ((53568 : Rat) / 599) [(8, 1), (11, 1), (13, 1)]
]

/-- Partial product 112 for generator 3. -/
def rs_R010_ueqv_R010NYN_partial_03_0112 : Poly :=
[
  term ((-107136 : Rat) / 599) [(6, 1), (8, 1), (11, 1), (13, 1)],
  term ((53568 : Rat) / 599) [(6, 2), (8, 1), (11, 1), (13, 1)],
  term ((53568 : Rat) / 599) [(7, 2), (8, 1), (11, 1), (13, 1)],
  term ((-53568 : Rat) / 599) [(8, 1), (9, 2), (11, 1), (13, 1)],
  term ((107136 : Rat) / 599) [(8, 2), (11, 1), (13, 1)],
  term ((-53568 : Rat) / 599) [(8, 3), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 112 for generator 3. -/
theorem rs_R010_ueqv_R010NYN_partial_03_0112_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_03_0112
        rs_R010_ueqv_R010NYN_generator_03_0100_0162 =
      rs_R010_ueqv_R010NYN_partial_03_0112 := by
  native_decide

/-- Coefficient term 113 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010NYN_coefficient_03_0113 : Poly :=
[
  term ((-754128 : Rat) / 599) [(8, 1), (11, 1), (15, 1)]
]

/-- Partial product 113 for generator 3. -/
def rs_R010_ueqv_R010NYN_partial_03_0113 : Poly :=
[
  term ((1508256 : Rat) / 599) [(6, 1), (8, 1), (11, 1), (15, 1)],
  term ((-754128 : Rat) / 599) [(6, 2), (8, 1), (11, 1), (15, 1)],
  term ((-754128 : Rat) / 599) [(7, 2), (8, 1), (11, 1), (15, 1)],
  term ((754128 : Rat) / 599) [(8, 1), (9, 2), (11, 1), (15, 1)],
  term ((-1508256 : Rat) / 599) [(8, 2), (11, 1), (15, 1)],
  term ((754128 : Rat) / 599) [(8, 3), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 113 for generator 3. -/
theorem rs_R010_ueqv_R010NYN_partial_03_0113_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_03_0113
        rs_R010_ueqv_R010NYN_generator_03_0100_0162 =
      rs_R010_ueqv_R010NYN_partial_03_0113 := by
  native_decide

/-- Coefficient term 114 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010NYN_coefficient_03_0114 : Poly :=
[
  term ((48 : Rat) / 5) [(8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 114 for generator 3. -/
def rs_R010_ueqv_R010NYN_partial_03_0114 : Poly :=
[
  term ((-96 : Rat) / 5) [(6, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((48 : Rat) / 5) [(6, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((48 : Rat) / 5) [(7, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-48 : Rat) / 5) [(8, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((96 : Rat) / 5) [(8, 2), (11, 1), (15, 1), (16, 1)],
  term ((-48 : Rat) / 5) [(8, 3), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 114 for generator 3. -/
theorem rs_R010_ueqv_R010NYN_partial_03_0114_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_03_0114
        rs_R010_ueqv_R010NYN_generator_03_0100_0162 =
      rs_R010_ueqv_R010NYN_partial_03_0114 := by
  native_decide

/-- Coefficient term 115 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010NYN_coefficient_03_0115 : Poly :=
[
  term ((80352 : Rat) / 2995) [(8, 1), (11, 2)]
]

/-- Partial product 115 for generator 3. -/
def rs_R010_ueqv_R010NYN_partial_03_0115 : Poly :=
[
  term ((-160704 : Rat) / 2995) [(6, 1), (8, 1), (11, 2)],
  term ((80352 : Rat) / 2995) [(6, 2), (8, 1), (11, 2)],
  term ((80352 : Rat) / 2995) [(7, 2), (8, 1), (11, 2)],
  term ((-80352 : Rat) / 2995) [(8, 1), (9, 2), (11, 2)],
  term ((160704 : Rat) / 2995) [(8, 2), (11, 2)],
  term ((-80352 : Rat) / 2995) [(8, 3), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 115 for generator 3. -/
theorem rs_R010_ueqv_R010NYN_partial_03_0115_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_03_0115
        rs_R010_ueqv_R010NYN_generator_03_0100_0162 =
      rs_R010_ueqv_R010NYN_partial_03_0115 := by
  native_decide

/-- Coefficient term 116 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010NYN_coefficient_03_0116 : Poly :=
[
  term ((-76416 : Rat) / 599) [(8, 1), (13, 1), (15, 1)]
]

/-- Partial product 116 for generator 3. -/
def rs_R010_ueqv_R010NYN_partial_03_0116 : Poly :=
[
  term ((152832 : Rat) / 599) [(6, 1), (8, 1), (13, 1), (15, 1)],
  term ((-76416 : Rat) / 599) [(6, 2), (8, 1), (13, 1), (15, 1)],
  term ((-76416 : Rat) / 599) [(7, 2), (8, 1), (13, 1), (15, 1)],
  term ((76416 : Rat) / 599) [(8, 1), (9, 2), (13, 1), (15, 1)],
  term ((-152832 : Rat) / 599) [(8, 2), (13, 1), (15, 1)],
  term ((76416 : Rat) / 599) [(8, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 116 for generator 3. -/
theorem rs_R010_ueqv_R010NYN_partial_03_0116_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_03_0116
        rs_R010_ueqv_R010NYN_generator_03_0100_0162 =
      rs_R010_ueqv_R010NYN_partial_03_0116 := by
  native_decide

/-- Coefficient term 117 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010NYN_coefficient_03_0117 : Poly :=
[
  term (10 : Rat) [(8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 117 for generator 3. -/
def rs_R010_ueqv_R010NYN_partial_03_0117 : Poly :=
[
  term (-20 : Rat) [(6, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term (10 : Rat) [(6, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term (10 : Rat) [(7, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term (-10 : Rat) [(8, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term (20 : Rat) [(8, 2), (13, 1), (15, 1), (16, 1)],
  term (-10 : Rat) [(8, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 117 for generator 3. -/
theorem rs_R010_ueqv_R010NYN_partial_03_0117_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_03_0117
        rs_R010_ueqv_R010NYN_generator_03_0100_0162 =
      rs_R010_ueqv_R010NYN_partial_03_0117 := by
  native_decide

/-- Coefficient term 118 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010NYN_coefficient_03_0118 : Poly :=
[
  term ((4196352 : Rat) / 2995) [(8, 1), (15, 2)]
]

/-- Partial product 118 for generator 3. -/
def rs_R010_ueqv_R010NYN_partial_03_0118 : Poly :=
[
  term ((-8392704 : Rat) / 2995) [(6, 1), (8, 1), (15, 2)],
  term ((4196352 : Rat) / 2995) [(6, 2), (8, 1), (15, 2)],
  term ((4196352 : Rat) / 2995) [(7, 2), (8, 1), (15, 2)],
  term ((-4196352 : Rat) / 2995) [(8, 1), (9, 2), (15, 2)],
  term ((8392704 : Rat) / 2995) [(8, 2), (15, 2)],
  term ((-4196352 : Rat) / 2995) [(8, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 118 for generator 3. -/
theorem rs_R010_ueqv_R010NYN_partial_03_0118_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_03_0118
        rs_R010_ueqv_R010NYN_generator_03_0100_0162 =
      rs_R010_ueqv_R010NYN_partial_03_0118 := by
  native_decide

/-- Coefficient term 119 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010NYN_coefficient_03_0119 : Poly :=
[
  term ((-966 : Rat) / 5) [(8, 1), (15, 2), (16, 1)]
]

/-- Partial product 119 for generator 3. -/
def rs_R010_ueqv_R010NYN_partial_03_0119 : Poly :=
[
  term ((1932 : Rat) / 5) [(6, 1), (8, 1), (15, 2), (16, 1)],
  term ((-966 : Rat) / 5) [(6, 2), (8, 1), (15, 2), (16, 1)],
  term ((-966 : Rat) / 5) [(7, 2), (8, 1), (15, 2), (16, 1)],
  term ((966 : Rat) / 5) [(8, 1), (9, 2), (15, 2), (16, 1)],
  term ((-1932 : Rat) / 5) [(8, 2), (15, 2), (16, 1)],
  term ((966 : Rat) / 5) [(8, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 119 for generator 3. -/
theorem rs_R010_ueqv_R010NYN_partial_03_0119_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_03_0119
        rs_R010_ueqv_R010NYN_generator_03_0100_0162 =
      rs_R010_ueqv_R010NYN_partial_03_0119 := by
  native_decide

/-- Coefficient term 120 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010NYN_coefficient_03_0120 : Poly :=
[
  term ((1620432 : Rat) / 2995) [(9, 1), (11, 1)]
]

/-- Partial product 120 for generator 3. -/
def rs_R010_ueqv_R010NYN_partial_03_0120 : Poly :=
[
  term ((-3240864 : Rat) / 2995) [(6, 1), (9, 1), (11, 1)],
  term ((1620432 : Rat) / 2995) [(6, 2), (9, 1), (11, 1)],
  term ((1620432 : Rat) / 2995) [(7, 2), (9, 1), (11, 1)],
  term ((3240864 : Rat) / 2995) [(8, 1), (9, 1), (11, 1)],
  term ((-1620432 : Rat) / 2995) [(8, 2), (9, 1), (11, 1)],
  term ((-1620432 : Rat) / 2995) [(9, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 120 for generator 3. -/
theorem rs_R010_ueqv_R010NYN_partial_03_0120_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_03_0120
        rs_R010_ueqv_R010NYN_generator_03_0100_0162 =
      rs_R010_ueqv_R010NYN_partial_03_0120 := by
  native_decide

/-- Coefficient term 121 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010NYN_coefficient_03_0121 : Poly :=
[
  term ((-875232 : Rat) / 2995) [(9, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 121 for generator 3. -/
def rs_R010_ueqv_R010NYN_partial_03_0121 : Poly :=
[
  term ((1750464 : Rat) / 2995) [(6, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-875232 : Rat) / 2995) [(6, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-875232 : Rat) / 2995) [(7, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-1750464 : Rat) / 2995) [(8, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((875232 : Rat) / 2995) [(8, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((875232 : Rat) / 2995) [(9, 3), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 121 for generator 3. -/
theorem rs_R010_ueqv_R010NYN_partial_03_0121_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_03_0121
        rs_R010_ueqv_R010NYN_generator_03_0100_0162 =
      rs_R010_ueqv_R010NYN_partial_03_0121 := by
  native_decide

/-- Coefficient term 122 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010NYN_coefficient_03_0122 : Poly :=
[
  term ((168 : Rat) / 5) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 122 for generator 3. -/
def rs_R010_ueqv_R010NYN_partial_03_0122 : Poly :=
[
  term ((-336 : Rat) / 5) [(6, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((168 : Rat) / 5) [(6, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((168 : Rat) / 5) [(7, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((336 : Rat) / 5) [(8, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-168 : Rat) / 5) [(8, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-168 : Rat) / 5) [(9, 3), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 122 for generator 3. -/
theorem rs_R010_ueqv_R010NYN_partial_03_0122_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_03_0122
        rs_R010_ueqv_R010NYN_generator_03_0100_0162 =
      rs_R010_ueqv_R010NYN_partial_03_0122 := by
  native_decide

/-- Coefficient term 123 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010NYN_coefficient_03_0123 : Poly :=
[
  term ((779904 : Rat) / 2995) [(9, 1), (11, 1), (15, 2)]
]

/-- Partial product 123 for generator 3. -/
def rs_R010_ueqv_R010NYN_partial_03_0123 : Poly :=
[
  term ((-1559808 : Rat) / 2995) [(6, 1), (9, 1), (11, 1), (15, 2)],
  term ((779904 : Rat) / 2995) [(6, 2), (9, 1), (11, 1), (15, 2)],
  term ((779904 : Rat) / 2995) [(7, 2), (9, 1), (11, 1), (15, 2)],
  term ((1559808 : Rat) / 2995) [(8, 1), (9, 1), (11, 1), (15, 2)],
  term ((-779904 : Rat) / 2995) [(8, 2), (9, 1), (11, 1), (15, 2)],
  term ((-779904 : Rat) / 2995) [(9, 3), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 123 for generator 3. -/
theorem rs_R010_ueqv_R010NYN_partial_03_0123_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_03_0123
        rs_R010_ueqv_R010NYN_generator_03_0100_0162 =
      rs_R010_ueqv_R010NYN_partial_03_0123 := by
  native_decide

/-- Coefficient term 124 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010NYN_coefficient_03_0124 : Poly :=
[
  term ((-72 : Rat) / 5) [(9, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 124 for generator 3. -/
def rs_R010_ueqv_R010NYN_partial_03_0124 : Poly :=
[
  term ((144 : Rat) / 5) [(6, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-72 : Rat) / 5) [(6, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-72 : Rat) / 5) [(7, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-144 : Rat) / 5) [(8, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((72 : Rat) / 5) [(8, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((72 : Rat) / 5) [(9, 3), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 124 for generator 3. -/
theorem rs_R010_ueqv_R010NYN_partial_03_0124_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_03_0124
        rs_R010_ueqv_R010NYN_generator_03_0100_0162 =
      rs_R010_ueqv_R010NYN_partial_03_0124 := by
  native_decide

/-- Coefficient term 125 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010NYN_coefficient_03_0125 : Poly :=
[
  term ((482112 : Rat) / 2995) [(9, 1), (11, 2), (13, 1)]
]

/-- Partial product 125 for generator 3. -/
def rs_R010_ueqv_R010NYN_partial_03_0125 : Poly :=
[
  term ((-964224 : Rat) / 2995) [(6, 1), (9, 1), (11, 2), (13, 1)],
  term ((482112 : Rat) / 2995) [(6, 2), (9, 1), (11, 2), (13, 1)],
  term ((482112 : Rat) / 2995) [(7, 2), (9, 1), (11, 2), (13, 1)],
  term ((964224 : Rat) / 2995) [(8, 1), (9, 1), (11, 2), (13, 1)],
  term ((-482112 : Rat) / 2995) [(8, 2), (9, 1), (11, 2), (13, 1)],
  term ((-482112 : Rat) / 2995) [(9, 3), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 125 for generator 3. -/
theorem rs_R010_ueqv_R010NYN_partial_03_0125_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_03_0125
        rs_R010_ueqv_R010NYN_generator_03_0100_0162 =
      rs_R010_ueqv_R010NYN_partial_03_0125 := by
  native_decide

/-- Coefficient term 126 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010NYN_coefficient_03_0126 : Poly :=
[
  term ((-321408 : Rat) / 2995) [(9, 1), (11, 2), (15, 1)]
]

/-- Partial product 126 for generator 3. -/
def rs_R010_ueqv_R010NYN_partial_03_0126 : Poly :=
[
  term ((642816 : Rat) / 2995) [(6, 1), (9, 1), (11, 2), (15, 1)],
  term ((-321408 : Rat) / 2995) [(6, 2), (9, 1), (11, 2), (15, 1)],
  term ((-321408 : Rat) / 2995) [(7, 2), (9, 1), (11, 2), (15, 1)],
  term ((-642816 : Rat) / 2995) [(8, 1), (9, 1), (11, 2), (15, 1)],
  term ((321408 : Rat) / 2995) [(8, 2), (9, 1), (11, 2), (15, 1)],
  term ((321408 : Rat) / 2995) [(9, 3), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 126 for generator 3. -/
theorem rs_R010_ueqv_R010NYN_partial_03_0126_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_03_0126
        rs_R010_ueqv_R010NYN_generator_03_0100_0162 =
      rs_R010_ueqv_R010NYN_partial_03_0126 := by
  native_decide

/-- Coefficient term 127 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010NYN_coefficient_03_0127 : Poly :=
[
  term ((-2724 : Rat) / 599) [(9, 1), (13, 1)]
]

/-- Partial product 127 for generator 3. -/
def rs_R010_ueqv_R010NYN_partial_03_0127 : Poly :=
[
  term ((5448 : Rat) / 599) [(6, 1), (9, 1), (13, 1)],
  term ((-2724 : Rat) / 599) [(6, 2), (9, 1), (13, 1)],
  term ((-2724 : Rat) / 599) [(7, 2), (9, 1), (13, 1)],
  term ((-5448 : Rat) / 599) [(8, 1), (9, 1), (13, 1)],
  term ((2724 : Rat) / 599) [(8, 2), (9, 1), (13, 1)],
  term ((2724 : Rat) / 599) [(9, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 127 for generator 3. -/
theorem rs_R010_ueqv_R010NYN_partial_03_0127_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_03_0127
        rs_R010_ueqv_R010NYN_generator_03_0100_0162 =
      rs_R010_ueqv_R010NYN_partial_03_0127 := by
  native_decide

/-- Coefficient term 128 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010NYN_coefficient_03_0128 : Poly :=
[
  term ((131328 : Rat) / 2995) [(9, 1), (13, 1), (15, 2)]
]

/-- Partial product 128 for generator 3. -/
def rs_R010_ueqv_R010NYN_partial_03_0128 : Poly :=
[
  term ((-262656 : Rat) / 2995) [(6, 1), (9, 1), (13, 1), (15, 2)],
  term ((131328 : Rat) / 2995) [(6, 2), (9, 1), (13, 1), (15, 2)],
  term ((131328 : Rat) / 2995) [(7, 2), (9, 1), (13, 1), (15, 2)],
  term ((262656 : Rat) / 2995) [(8, 1), (9, 1), (13, 1), (15, 2)],
  term ((-131328 : Rat) / 2995) [(8, 2), (9, 1), (13, 1), (15, 2)],
  term ((-131328 : Rat) / 2995) [(9, 3), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 128 for generator 3. -/
theorem rs_R010_ueqv_R010NYN_partial_03_0128_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_03_0128
        rs_R010_ueqv_R010NYN_generator_03_0100_0162 =
      rs_R010_ueqv_R010NYN_partial_03_0128 := by
  native_decide

/-- Coefficient term 129 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010NYN_coefficient_03_0129 : Poly :=
[
  term ((16 : Rat) / 5) [(9, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 129 for generator 3. -/
def rs_R010_ueqv_R010NYN_partial_03_0129 : Poly :=
[
  term ((-32 : Rat) / 5) [(6, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((16 : Rat) / 5) [(6, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((16 : Rat) / 5) [(7, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((32 : Rat) / 5) [(8, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-16 : Rat) / 5) [(8, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-16 : Rat) / 5) [(9, 3), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 129 for generator 3. -/
theorem rs_R010_ueqv_R010NYN_partial_03_0129_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_03_0129
        rs_R010_ueqv_R010NYN_generator_03_0100_0162 =
      rs_R010_ueqv_R010NYN_partial_03_0129 := by
  native_decide

/-- Coefficient term 130 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010NYN_coefficient_03_0130 : Poly :=
[
  term ((-1731036 : Rat) / 2995) [(9, 1), (15, 1)]
]

/-- Partial product 130 for generator 3. -/
def rs_R010_ueqv_R010NYN_partial_03_0130 : Poly :=
[
  term ((3462072 : Rat) / 2995) [(6, 1), (9, 1), (15, 1)],
  term ((-1731036 : Rat) / 2995) [(6, 2), (9, 1), (15, 1)],
  term ((-1731036 : Rat) / 2995) [(7, 2), (9, 1), (15, 1)],
  term ((-3462072 : Rat) / 2995) [(8, 1), (9, 1), (15, 1)],
  term ((1731036 : Rat) / 2995) [(8, 2), (9, 1), (15, 1)],
  term ((1731036 : Rat) / 2995) [(9, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 130 for generator 3. -/
theorem rs_R010_ueqv_R010NYN_partial_03_0130_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_03_0130
        rs_R010_ueqv_R010NYN_generator_03_0100_0162 =
      rs_R010_ueqv_R010NYN_partial_03_0130 := by
  native_decide

/-- Coefficient term 131 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010NYN_coefficient_03_0131 : Poly :=
[
  term ((393 : Rat) / 5) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 131 for generator 3. -/
def rs_R010_ueqv_R010NYN_partial_03_0131 : Poly :=
[
  term ((-786 : Rat) / 5) [(6, 1), (9, 1), (15, 1), (16, 1)],
  term ((393 : Rat) / 5) [(6, 2), (9, 1), (15, 1), (16, 1)],
  term ((393 : Rat) / 5) [(7, 2), (9, 1), (15, 1), (16, 1)],
  term ((786 : Rat) / 5) [(8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-393 : Rat) / 5) [(8, 2), (9, 1), (15, 1), (16, 1)],
  term ((-393 : Rat) / 5) [(9, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 131 for generator 3. -/
theorem rs_R010_ueqv_R010NYN_partial_03_0131_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_03_0131
        rs_R010_ueqv_R010NYN_generator_03_0100_0162 =
      rs_R010_ueqv_R010NYN_partial_03_0131 := by
  native_decide

/-- Coefficient term 132 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010NYN_coefficient_03_0132 : Poly :=
[
  term ((-32832 : Rat) / 599) [(9, 1), (15, 3)]
]

/-- Partial product 132 for generator 3. -/
def rs_R010_ueqv_R010NYN_partial_03_0132 : Poly :=
[
  term ((65664 : Rat) / 599) [(6, 1), (9, 1), (15, 3)],
  term ((-32832 : Rat) / 599) [(6, 2), (9, 1), (15, 3)],
  term ((-32832 : Rat) / 599) [(7, 2), (9, 1), (15, 3)],
  term ((-65664 : Rat) / 599) [(8, 1), (9, 1), (15, 3)],
  term ((32832 : Rat) / 599) [(8, 2), (9, 1), (15, 3)],
  term ((32832 : Rat) / 599) [(9, 3), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 132 for generator 3. -/
theorem rs_R010_ueqv_R010NYN_partial_03_0132_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_03_0132
        rs_R010_ueqv_R010NYN_generator_03_0100_0162 =
      rs_R010_ueqv_R010NYN_partial_03_0132 := by
  native_decide

/-- Coefficient term 133 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010NYN_coefficient_03_0133 : Poly :=
[
  term (-4 : Rat) [(9, 1), (15, 3), (16, 1)]
]

/-- Partial product 133 for generator 3. -/
def rs_R010_ueqv_R010NYN_partial_03_0133 : Poly :=
[
  term (8 : Rat) [(6, 1), (9, 1), (15, 3), (16, 1)],
  term (-4 : Rat) [(6, 2), (9, 1), (15, 3), (16, 1)],
  term (-4 : Rat) [(7, 2), (9, 1), (15, 3), (16, 1)],
  term (-8 : Rat) [(8, 1), (9, 1), (15, 3), (16, 1)],
  term (4 : Rat) [(8, 2), (9, 1), (15, 3), (16, 1)],
  term (4 : Rat) [(9, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 133 for generator 3. -/
theorem rs_R010_ueqv_R010NYN_partial_03_0133_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_03_0133
        rs_R010_ueqv_R010NYN_generator_03_0100_0162 =
      rs_R010_ueqv_R010NYN_partial_03_0133 := by
  native_decide

/-- Coefficient term 134 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010NYN_coefficient_03_0134 : Poly :=
[
  term (-6 : Rat) [(10, 1)]
]

/-- Partial product 134 for generator 3. -/
def rs_R010_ueqv_R010NYN_partial_03_0134 : Poly :=
[
  term (12 : Rat) [(6, 1), (10, 1)],
  term (-6 : Rat) [(6, 2), (10, 1)],
  term (-6 : Rat) [(7, 2), (10, 1)],
  term (-12 : Rat) [(8, 1), (10, 1)],
  term (6 : Rat) [(8, 2), (10, 1)],
  term (6 : Rat) [(9, 2), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 134 for generator 3. -/
theorem rs_R010_ueqv_R010NYN_partial_03_0134_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_03_0134
        rs_R010_ueqv_R010NYN_generator_03_0100_0162 =
      rs_R010_ueqv_R010NYN_partial_03_0134 := by
  native_decide

/-- Coefficient term 135 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010NYN_coefficient_03_0135 : Poly :=
[
  term ((964224 : Rat) / 2995) [(10, 1), (11, 1), (13, 1)]
]

/-- Partial product 135 for generator 3. -/
def rs_R010_ueqv_R010NYN_partial_03_0135 : Poly :=
[
  term ((-1928448 : Rat) / 2995) [(6, 1), (10, 1), (11, 1), (13, 1)],
  term ((964224 : Rat) / 2995) [(6, 2), (10, 1), (11, 1), (13, 1)],
  term ((964224 : Rat) / 2995) [(7, 2), (10, 1), (11, 1), (13, 1)],
  term ((1928448 : Rat) / 2995) [(8, 1), (10, 1), (11, 1), (13, 1)],
  term ((-964224 : Rat) / 2995) [(8, 2), (10, 1), (11, 1), (13, 1)],
  term ((-964224 : Rat) / 2995) [(9, 2), (10, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 135 for generator 3. -/
theorem rs_R010_ueqv_R010NYN_partial_03_0135_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_03_0135
        rs_R010_ueqv_R010NYN_generator_03_0100_0162 =
      rs_R010_ueqv_R010NYN_partial_03_0135 := by
  native_decide

/-- Coefficient term 136 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010NYN_coefficient_03_0136 : Poly :=
[
  term ((-642816 : Rat) / 2995) [(10, 1), (11, 1), (15, 1)]
]

/-- Partial product 136 for generator 3. -/
def rs_R010_ueqv_R010NYN_partial_03_0136 : Poly :=
[
  term ((1285632 : Rat) / 2995) [(6, 1), (10, 1), (11, 1), (15, 1)],
  term ((-642816 : Rat) / 2995) [(6, 2), (10, 1), (11, 1), (15, 1)],
  term ((-642816 : Rat) / 2995) [(7, 2), (10, 1), (11, 1), (15, 1)],
  term ((-1285632 : Rat) / 2995) [(8, 1), (10, 1), (11, 1), (15, 1)],
  term ((642816 : Rat) / 2995) [(8, 2), (10, 1), (11, 1), (15, 1)],
  term ((642816 : Rat) / 2995) [(9, 2), (10, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 136 for generator 3. -/
theorem rs_R010_ueqv_R010NYN_partial_03_0136_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_03_0136
        rs_R010_ueqv_R010NYN_generator_03_0100_0162 =
      rs_R010_ueqv_R010NYN_partial_03_0136 := by
  native_decide

/-- Coefficient term 137 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010NYN_coefficient_03_0137 : Poly :=
[
  term ((-1045152 : Rat) / 2995) [(10, 1), (13, 1), (15, 1)]
]

/-- Partial product 137 for generator 3. -/
def rs_R010_ueqv_R010NYN_partial_03_0137 : Poly :=
[
  term ((2090304 : Rat) / 2995) [(6, 1), (10, 1), (13, 1), (15, 1)],
  term ((-1045152 : Rat) / 2995) [(6, 2), (10, 1), (13, 1), (15, 1)],
  term ((-1045152 : Rat) / 2995) [(7, 2), (10, 1), (13, 1), (15, 1)],
  term ((-2090304 : Rat) / 2995) [(8, 1), (10, 1), (13, 1), (15, 1)],
  term ((1045152 : Rat) / 2995) [(8, 2), (10, 1), (13, 1), (15, 1)],
  term ((1045152 : Rat) / 2995) [(9, 2), (10, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 137 for generator 3. -/
theorem rs_R010_ueqv_R010NYN_partial_03_0137_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_03_0137
        rs_R010_ueqv_R010NYN_generator_03_0100_0162 =
      rs_R010_ueqv_R010NYN_partial_03_0137 := by
  native_decide

/-- Coefficient term 138 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010NYN_coefficient_03_0138 : Poly :=
[
  term ((206 : Rat) / 5) [(10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 138 for generator 3. -/
def rs_R010_ueqv_R010NYN_partial_03_0138 : Poly :=
[
  term ((-412 : Rat) / 5) [(6, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((206 : Rat) / 5) [(6, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((206 : Rat) / 5) [(7, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((412 : Rat) / 5) [(8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-206 : Rat) / 5) [(8, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-206 : Rat) / 5) [(9, 2), (10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 138 for generator 3. -/
theorem rs_R010_ueqv_R010NYN_partial_03_0138_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_03_0138
        rs_R010_ueqv_R010NYN_generator_03_0100_0162 =
      rs_R010_ueqv_R010NYN_partial_03_0138 := by
  native_decide

/-- Coefficient term 139 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010NYN_coefficient_03_0139 : Poly :=
[
  term ((711648 : Rat) / 2995) [(10, 1), (15, 2)]
]

/-- Partial product 139 for generator 3. -/
def rs_R010_ueqv_R010NYN_partial_03_0139 : Poly :=
[
  term ((-1423296 : Rat) / 2995) [(6, 1), (10, 1), (15, 2)],
  term ((711648 : Rat) / 2995) [(6, 2), (10, 1), (15, 2)],
  term ((711648 : Rat) / 2995) [(7, 2), (10, 1), (15, 2)],
  term ((1423296 : Rat) / 2995) [(8, 1), (10, 1), (15, 2)],
  term ((-711648 : Rat) / 2995) [(8, 2), (10, 1), (15, 2)],
  term ((-711648 : Rat) / 2995) [(9, 2), (10, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 139 for generator 3. -/
theorem rs_R010_ueqv_R010NYN_partial_03_0139_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_03_0139
        rs_R010_ueqv_R010NYN_generator_03_0100_0162 =
      rs_R010_ueqv_R010NYN_partial_03_0139 := by
  native_decide

/-- Coefficient term 140 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010NYN_coefficient_03_0140 : Poly :=
[
  term ((-154 : Rat) / 5) [(10, 1), (15, 2), (16, 1)]
]

/-- Partial product 140 for generator 3. -/
def rs_R010_ueqv_R010NYN_partial_03_0140 : Poly :=
[
  term ((308 : Rat) / 5) [(6, 1), (10, 1), (15, 2), (16, 1)],
  term ((-154 : Rat) / 5) [(6, 2), (10, 1), (15, 2), (16, 1)],
  term ((-154 : Rat) / 5) [(7, 2), (10, 1), (15, 2), (16, 1)],
  term ((-308 : Rat) / 5) [(8, 1), (10, 1), (15, 2), (16, 1)],
  term ((154 : Rat) / 5) [(8, 2), (10, 1), (15, 2), (16, 1)],
  term ((154 : Rat) / 5) [(9, 2), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 140 for generator 3. -/
theorem rs_R010_ueqv_R010NYN_partial_03_0140_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_03_0140
        rs_R010_ueqv_R010NYN_generator_03_0100_0162 =
      rs_R010_ueqv_R010NYN_partial_03_0140 := by
  native_decide

/-- Coefficient term 141 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010NYN_coefficient_03_0141 : Poly :=
[
  term ((-620496 : Rat) / 2995) [(11, 1), (13, 1)]
]

/-- Partial product 141 for generator 3. -/
def rs_R010_ueqv_R010NYN_partial_03_0141 : Poly :=
[
  term ((1240992 : Rat) / 2995) [(6, 1), (11, 1), (13, 1)],
  term ((-620496 : Rat) / 2995) [(6, 2), (11, 1), (13, 1)],
  term ((-620496 : Rat) / 2995) [(7, 2), (11, 1), (13, 1)],
  term ((-1240992 : Rat) / 2995) [(8, 1), (11, 1), (13, 1)],
  term ((620496 : Rat) / 2995) [(8, 2), (11, 1), (13, 1)],
  term ((620496 : Rat) / 2995) [(9, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 141 for generator 3. -/
theorem rs_R010_ueqv_R010NYN_partial_03_0141_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_03_0141
        rs_R010_ueqv_R010NYN_generator_03_0100_0162 =
      rs_R010_ueqv_R010NYN_partial_03_0141 := by
  native_decide

/-- Coefficient term 142 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010NYN_coefficient_03_0142 : Poly :=
[
  term ((283872 : Rat) / 599) [(11, 1), (13, 1), (15, 2)]
]

/-- Partial product 142 for generator 3. -/
def rs_R010_ueqv_R010NYN_partial_03_0142 : Poly :=
[
  term ((-567744 : Rat) / 599) [(6, 1), (11, 1), (13, 1), (15, 2)],
  term ((283872 : Rat) / 599) [(6, 2), (11, 1), (13, 1), (15, 2)],
  term ((283872 : Rat) / 599) [(7, 2), (11, 1), (13, 1), (15, 2)],
  term ((567744 : Rat) / 599) [(8, 1), (11, 1), (13, 1), (15, 2)],
  term ((-283872 : Rat) / 599) [(8, 2), (11, 1), (13, 1), (15, 2)],
  term ((-283872 : Rat) / 599) [(9, 2), (11, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 142 for generator 3. -/
theorem rs_R010_ueqv_R010NYN_partial_03_0142_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_03_0142
        rs_R010_ueqv_R010NYN_generator_03_0100_0162 =
      rs_R010_ueqv_R010NYN_partial_03_0142 := by
  native_decide

/-- Coefficient term 143 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010NYN_coefficient_03_0143 : Poly :=
[
  term (-80 : Rat) [(11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 143 for generator 3. -/
def rs_R010_ueqv_R010NYN_partial_03_0143 : Poly :=
[
  term (160 : Rat) [(6, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term (-80 : Rat) [(6, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term (-80 : Rat) [(7, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term (-160 : Rat) [(8, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term (80 : Rat) [(8, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term (80 : Rat) [(9, 2), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 143 for generator 3. -/
theorem rs_R010_ueqv_R010NYN_partial_03_0143_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_03_0143
        rs_R010_ueqv_R010NYN_generator_03_0100_0162 =
      rs_R010_ueqv_R010NYN_partial_03_0143 := by
  native_decide

/-- Coefficient term 144 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010NYN_coefficient_03_0144 : Poly :=
[
  term ((-4983552 : Rat) / 2995) [(11, 1), (14, 1), (15, 1)]
]

/-- Partial product 144 for generator 3. -/
def rs_R010_ueqv_R010NYN_partial_03_0144 : Poly :=
[
  term ((9967104 : Rat) / 2995) [(6, 1), (11, 1), (14, 1), (15, 1)],
  term ((-4983552 : Rat) / 2995) [(6, 2), (11, 1), (14, 1), (15, 1)],
  term ((-4983552 : Rat) / 2995) [(7, 2), (11, 1), (14, 1), (15, 1)],
  term ((-9967104 : Rat) / 2995) [(8, 1), (11, 1), (14, 1), (15, 1)],
  term ((4983552 : Rat) / 2995) [(8, 2), (11, 1), (14, 1), (15, 1)],
  term ((4983552 : Rat) / 2995) [(9, 2), (11, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 144 for generator 3. -/
theorem rs_R010_ueqv_R010NYN_partial_03_0144_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_03_0144
        rs_R010_ueqv_R010NYN_generator_03_0100_0162 =
      rs_R010_ueqv_R010NYN_partial_03_0144 := by
  native_decide

/-- Coefficient term 145 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010NYN_coefficient_03_0145 : Poly :=
[
  term ((948 : Rat) / 5) [(11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 145 for generator 3. -/
def rs_R010_ueqv_R010NYN_partial_03_0145 : Poly :=
[
  term ((-1896 : Rat) / 5) [(6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((948 : Rat) / 5) [(6, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((948 : Rat) / 5) [(7, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((1896 : Rat) / 5) [(8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-948 : Rat) / 5) [(8, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-948 : Rat) / 5) [(9, 2), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 145 for generator 3. -/
theorem rs_R010_ueqv_R010NYN_partial_03_0145_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_03_0145
        rs_R010_ueqv_R010NYN_generator_03_0100_0162 =
      rs_R010_ueqv_R010NYN_partial_03_0145 := by
  native_decide

/-- Coefficient term 146 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010NYN_coefficient_03_0146 : Poly :=
[
  term ((5107164 : Rat) / 2995) [(11, 1), (15, 1)]
]

/-- Partial product 146 for generator 3. -/
def rs_R010_ueqv_R010NYN_partial_03_0146 : Poly :=
[
  term ((-10214328 : Rat) / 2995) [(6, 1), (11, 1), (15, 1)],
  term ((5107164 : Rat) / 2995) [(6, 2), (11, 1), (15, 1)],
  term ((5107164 : Rat) / 2995) [(7, 2), (11, 1), (15, 1)],
  term ((10214328 : Rat) / 2995) [(8, 1), (11, 1), (15, 1)],
  term ((-5107164 : Rat) / 2995) [(8, 2), (11, 1), (15, 1)],
  term ((-5107164 : Rat) / 2995) [(9, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 146 for generator 3. -/
theorem rs_R010_ueqv_R010NYN_partial_03_0146_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_03_0146
        rs_R010_ueqv_R010NYN_generator_03_0100_0162 =
      rs_R010_ueqv_R010NYN_partial_03_0146 := by
  native_decide

/-- Coefficient term 147 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010NYN_coefficient_03_0147 : Poly :=
[
  term ((-287 : Rat) / 2) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 147 for generator 3. -/
def rs_R010_ueqv_R010NYN_partial_03_0147 : Poly :=
[
  term (287 : Rat) [(6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-287 : Rat) / 2) [(6, 2), (11, 1), (15, 1), (16, 1)],
  term ((-287 : Rat) / 2) [(7, 2), (11, 1), (15, 1), (16, 1)],
  term (-287 : Rat) [(8, 1), (11, 1), (15, 1), (16, 1)],
  term ((287 : Rat) / 2) [(8, 2), (11, 1), (15, 1), (16, 1)],
  term ((287 : Rat) / 2) [(9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 147 for generator 3. -/
theorem rs_R010_ueqv_R010NYN_partial_03_0147_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_03_0147
        rs_R010_ueqv_R010NYN_generator_03_0100_0162 =
      rs_R010_ueqv_R010NYN_partial_03_0147 := by
  native_decide

/-- Coefficient term 148 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010NYN_coefficient_03_0148 : Poly :=
[
  term ((-612384 : Rat) / 599) [(11, 1), (15, 3)]
]

/-- Partial product 148 for generator 3. -/
def rs_R010_ueqv_R010NYN_partial_03_0148 : Poly :=
[
  term ((1224768 : Rat) / 599) [(6, 1), (11, 1), (15, 3)],
  term ((-612384 : Rat) / 599) [(6, 2), (11, 1), (15, 3)],
  term ((-612384 : Rat) / 599) [(7, 2), (11, 1), (15, 3)],
  term ((-1224768 : Rat) / 599) [(8, 1), (11, 1), (15, 3)],
  term ((612384 : Rat) / 599) [(8, 2), (11, 1), (15, 3)],
  term ((612384 : Rat) / 599) [(9, 2), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 148 for generator 3. -/
theorem rs_R010_ueqv_R010NYN_partial_03_0148_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_03_0148
        rs_R010_ueqv_R010NYN_generator_03_0100_0162 =
      rs_R010_ueqv_R010NYN_partial_03_0148 := by
  native_decide

/-- Coefficient term 149 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010NYN_coefficient_03_0149 : Poly :=
[
  term (94 : Rat) [(11, 1), (15, 3), (16, 1)]
]

/-- Partial product 149 for generator 3. -/
def rs_R010_ueqv_R010NYN_partial_03_0149 : Poly :=
[
  term (-188 : Rat) [(6, 1), (11, 1), (15, 3), (16, 1)],
  term (94 : Rat) [(6, 2), (11, 1), (15, 3), (16, 1)],
  term (94 : Rat) [(7, 2), (11, 1), (15, 3), (16, 1)],
  term (188 : Rat) [(8, 1), (11, 1), (15, 3), (16, 1)],
  term (-94 : Rat) [(8, 2), (11, 1), (15, 3), (16, 1)],
  term (-94 : Rat) [(9, 2), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 149 for generator 3. -/
theorem rs_R010_ueqv_R010NYN_partial_03_0149_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_03_0149
        rs_R010_ueqv_R010NYN_generator_03_0100_0162 =
      rs_R010_ueqv_R010NYN_partial_03_0149 := by
  native_decide

/-- Coefficient term 150 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010NYN_coefficient_03_0150 : Poly :=
[
  term ((-468720 : Rat) / 599) [(11, 2)]
]

/-- Partial product 150 for generator 3. -/
def rs_R010_ueqv_R010NYN_partial_03_0150 : Poly :=
[
  term ((937440 : Rat) / 599) [(6, 1), (11, 2)],
  term ((-468720 : Rat) / 599) [(6, 2), (11, 2)],
  term ((-468720 : Rat) / 599) [(7, 2), (11, 2)],
  term ((-937440 : Rat) / 599) [(8, 1), (11, 2)],
  term ((468720 : Rat) / 599) [(8, 2), (11, 2)],
  term ((468720 : Rat) / 599) [(9, 2), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 150 for generator 3. -/
theorem rs_R010_ueqv_R010NYN_partial_03_0150_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_03_0150
        rs_R010_ueqv_R010NYN_generator_03_0100_0162 =
      rs_R010_ueqv_R010NYN_partial_03_0150 := by
  native_decide

/-- Coefficient term 151 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010NYN_coefficient_03_0151 : Poly :=
[
  term ((-267840 : Rat) / 599) [(11, 2), (13, 1), (15, 1)]
]

/-- Partial product 151 for generator 3. -/
def rs_R010_ueqv_R010NYN_partial_03_0151 : Poly :=
[
  term ((535680 : Rat) / 599) [(6, 1), (11, 2), (13, 1), (15, 1)],
  term ((-267840 : Rat) / 599) [(6, 2), (11, 2), (13, 1), (15, 1)],
  term ((-267840 : Rat) / 599) [(7, 2), (11, 2), (13, 1), (15, 1)],
  term ((-535680 : Rat) / 599) [(8, 1), (11, 2), (13, 1), (15, 1)],
  term ((267840 : Rat) / 599) [(8, 2), (11, 2), (13, 1), (15, 1)],
  term ((267840 : Rat) / 599) [(9, 2), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 151 for generator 3. -/
theorem rs_R010_ueqv_R010NYN_partial_03_0151_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_03_0151
        rs_R010_ueqv_R010NYN_generator_03_0100_0162 =
      rs_R010_ueqv_R010NYN_partial_03_0151 := by
  native_decide

/-- Coefficient term 152 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010NYN_coefficient_03_0152 : Poly :=
[
  term ((2892672 : Rat) / 2995) [(11, 2), (14, 1)]
]

/-- Partial product 152 for generator 3. -/
def rs_R010_ueqv_R010NYN_partial_03_0152 : Poly :=
[
  term ((-5785344 : Rat) / 2995) [(6, 1), (11, 2), (14, 1)],
  term ((2892672 : Rat) / 2995) [(6, 2), (11, 2), (14, 1)],
  term ((2892672 : Rat) / 2995) [(7, 2), (11, 2), (14, 1)],
  term ((5785344 : Rat) / 2995) [(8, 1), (11, 2), (14, 1)],
  term ((-2892672 : Rat) / 2995) [(8, 2), (11, 2), (14, 1)],
  term ((-2892672 : Rat) / 2995) [(9, 2), (11, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 152 for generator 3. -/
theorem rs_R010_ueqv_R010NYN_partial_03_0152_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_03_0152
        rs_R010_ueqv_R010NYN_generator_03_0100_0162 =
      rs_R010_ueqv_R010NYN_partial_03_0152 := by
  native_decide

/-- Coefficient term 153 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010NYN_coefficient_03_0153 : Poly :=
[
  term ((8145792 : Rat) / 2995) [(11, 2), (15, 2)]
]

/-- Partial product 153 for generator 3. -/
def rs_R010_ueqv_R010NYN_partial_03_0153 : Poly :=
[
  term ((-16291584 : Rat) / 2995) [(6, 1), (11, 2), (15, 2)],
  term ((8145792 : Rat) / 2995) [(6, 2), (11, 2), (15, 2)],
  term ((8145792 : Rat) / 2995) [(7, 2), (11, 2), (15, 2)],
  term ((16291584 : Rat) / 2995) [(8, 1), (11, 2), (15, 2)],
  term ((-8145792 : Rat) / 2995) [(8, 2), (11, 2), (15, 2)],
  term ((-8145792 : Rat) / 2995) [(9, 2), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 153 for generator 3. -/
theorem rs_R010_ueqv_R010NYN_partial_03_0153_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_03_0153
        rs_R010_ueqv_R010NYN_generator_03_0100_0162 =
      rs_R010_ueqv_R010NYN_partial_03_0153 := by
  native_decide

/-- Coefficient term 154 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010NYN_coefficient_03_0154 : Poly :=
[
  term ((-1896 : Rat) / 5) [(11, 2), (15, 2), (16, 1)]
]

/-- Partial product 154 for generator 3. -/
def rs_R010_ueqv_R010NYN_partial_03_0154 : Poly :=
[
  term ((3792 : Rat) / 5) [(6, 1), (11, 2), (15, 2), (16, 1)],
  term ((-1896 : Rat) / 5) [(6, 2), (11, 2), (15, 2), (16, 1)],
  term ((-1896 : Rat) / 5) [(7, 2), (11, 2), (15, 2), (16, 1)],
  term ((-3792 : Rat) / 5) [(8, 1), (11, 2), (15, 2), (16, 1)],
  term ((1896 : Rat) / 5) [(8, 2), (11, 2), (15, 2), (16, 1)],
  term ((1896 : Rat) / 5) [(9, 2), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 154 for generator 3. -/
theorem rs_R010_ueqv_R010NYN_partial_03_0154_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_03_0154
        rs_R010_ueqv_R010NYN_generator_03_0100_0162 =
      rs_R010_ueqv_R010NYN_partial_03_0154 := by
  native_decide

/-- Coefficient term 155 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010NYN_coefficient_03_0155 : Poly :=
[
  term ((-5785344 : Rat) / 2995) [(11, 3), (15, 1)]
]

/-- Partial product 155 for generator 3. -/
def rs_R010_ueqv_R010NYN_partial_03_0155 : Poly :=
[
  term ((11570688 : Rat) / 2995) [(6, 1), (11, 3), (15, 1)],
  term ((-5785344 : Rat) / 2995) [(6, 2), (11, 3), (15, 1)],
  term ((-5785344 : Rat) / 2995) [(7, 2), (11, 3), (15, 1)],
  term ((-11570688 : Rat) / 2995) [(8, 1), (11, 3), (15, 1)],
  term ((5785344 : Rat) / 2995) [(8, 2), (11, 3), (15, 1)],
  term ((5785344 : Rat) / 2995) [(9, 2), (11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 155 for generator 3. -/
theorem rs_R010_ueqv_R010NYN_partial_03_0155_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_03_0155
        rs_R010_ueqv_R010NYN_generator_03_0100_0162 =
      rs_R010_ueqv_R010NYN_partial_03_0155 := by
  native_decide

/-- Coefficient term 156 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010NYN_coefficient_03_0156 : Poly :=
[
  term ((578108 : Rat) / 2995) [(13, 1), (15, 1)]
]

/-- Partial product 156 for generator 3. -/
def rs_R010_ueqv_R010NYN_partial_03_0156 : Poly :=
[
  term ((-1156216 : Rat) / 2995) [(6, 1), (13, 1), (15, 1)],
  term ((578108 : Rat) / 2995) [(6, 2), (13, 1), (15, 1)],
  term ((578108 : Rat) / 2995) [(7, 2), (13, 1), (15, 1)],
  term ((1156216 : Rat) / 2995) [(8, 1), (13, 1), (15, 1)],
  term ((-578108 : Rat) / 2995) [(8, 2), (13, 1), (15, 1)],
  term ((-578108 : Rat) / 2995) [(9, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 156 for generator 3. -/
theorem rs_R010_ueqv_R010NYN_partial_03_0156_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_03_0156
        rs_R010_ueqv_R010NYN_generator_03_0100_0162 =
      rs_R010_ueqv_R010NYN_partial_03_0156 := by
  native_decide

/-- Coefficient term 157 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010NYN_coefficient_03_0157 : Poly :=
[
  term ((-139 : Rat) / 5) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 157 for generator 3. -/
def rs_R010_ueqv_R010NYN_partial_03_0157 : Poly :=
[
  term ((278 : Rat) / 5) [(6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-139 : Rat) / 5) [(6, 2), (13, 1), (15, 1), (16, 1)],
  term ((-139 : Rat) / 5) [(7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-278 : Rat) / 5) [(8, 1), (13, 1), (15, 1), (16, 1)],
  term ((139 : Rat) / 5) [(8, 2), (13, 1), (15, 1), (16, 1)],
  term ((139 : Rat) / 5) [(9, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 157 for generator 3. -/
theorem rs_R010_ueqv_R010NYN_partial_03_0157_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_03_0157
        rs_R010_ueqv_R010NYN_generator_03_0100_0162 =
      rs_R010_ueqv_R010NYN_partial_03_0157 := by
  native_decide

/-- Coefficient term 158 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010NYN_coefficient_03_0158 : Poly :=
[
  term ((-21072 : Rat) / 599) [(14, 1)]
]

/-- Partial product 158 for generator 3. -/
def rs_R010_ueqv_R010NYN_partial_03_0158 : Poly :=
[
  term ((42144 : Rat) / 599) [(6, 1), (14, 1)],
  term ((-21072 : Rat) / 599) [(6, 2), (14, 1)],
  term ((-21072 : Rat) / 599) [(7, 2), (14, 1)],
  term ((-42144 : Rat) / 599) [(8, 1), (14, 1)],
  term ((21072 : Rat) / 599) [(8, 2), (14, 1)],
  term ((21072 : Rat) / 599) [(9, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 158 for generator 3. -/
theorem rs_R010_ueqv_R010NYN_partial_03_0158_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_03_0158
        rs_R010_ueqv_R010NYN_generator_03_0100_0162 =
      rs_R010_ueqv_R010NYN_partial_03_0158 := by
  native_decide

/-- Coefficient term 159 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010NYN_coefficient_03_0159 : Poly :=
[
  term ((2423808 : Rat) / 2995) [(14, 1), (15, 2)]
]

/-- Partial product 159 for generator 3. -/
def rs_R010_ueqv_R010NYN_partial_03_0159 : Poly :=
[
  term ((-4847616 : Rat) / 2995) [(6, 1), (14, 1), (15, 2)],
  term ((2423808 : Rat) / 2995) [(6, 2), (14, 1), (15, 2)],
  term ((2423808 : Rat) / 2995) [(7, 2), (14, 1), (15, 2)],
  term ((4847616 : Rat) / 2995) [(8, 1), (14, 1), (15, 2)],
  term ((-2423808 : Rat) / 2995) [(8, 2), (14, 1), (15, 2)],
  term ((-2423808 : Rat) / 2995) [(9, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 159 for generator 3. -/
theorem rs_R010_ueqv_R010NYN_partial_03_0159_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_03_0159
        rs_R010_ueqv_R010NYN_generator_03_0100_0162 =
      rs_R010_ueqv_R010NYN_partial_03_0159 := by
  native_decide

/-- Coefficient term 160 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010NYN_coefficient_03_0160 : Poly :=
[
  term ((-534 : Rat) / 5) [(14, 1), (15, 2), (16, 1)]
]

/-- Partial product 160 for generator 3. -/
def rs_R010_ueqv_R010NYN_partial_03_0160 : Poly :=
[
  term ((1068 : Rat) / 5) [(6, 1), (14, 1), (15, 2), (16, 1)],
  term ((-534 : Rat) / 5) [(6, 2), (14, 1), (15, 2), (16, 1)],
  term ((-534 : Rat) / 5) [(7, 2), (14, 1), (15, 2), (16, 1)],
  term ((-1068 : Rat) / 5) [(8, 1), (14, 1), (15, 2), (16, 1)],
  term ((534 : Rat) / 5) [(8, 2), (14, 1), (15, 2), (16, 1)],
  term ((534 : Rat) / 5) [(9, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 160 for generator 3. -/
theorem rs_R010_ueqv_R010NYN_partial_03_0160_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_03_0160
        rs_R010_ueqv_R010NYN_generator_03_0100_0162 =
      rs_R010_ueqv_R010NYN_partial_03_0160 := by
  native_decide

/-- Coefficient term 161 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010NYN_coefficient_03_0161 : Poly :=
[
  term ((-2781142 : Rat) / 2995) [(15, 2)]
]

/-- Partial product 161 for generator 3. -/
def rs_R010_ueqv_R010NYN_partial_03_0161 : Poly :=
[
  term ((5562284 : Rat) / 2995) [(6, 1), (15, 2)],
  term ((-2781142 : Rat) / 2995) [(6, 2), (15, 2)],
  term ((-2781142 : Rat) / 2995) [(7, 2), (15, 2)],
  term ((-5562284 : Rat) / 2995) [(8, 1), (15, 2)],
  term ((2781142 : Rat) / 2995) [(8, 2), (15, 2)],
  term ((2781142 : Rat) / 2995) [(9, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 161 for generator 3. -/
theorem rs_R010_ueqv_R010NYN_partial_03_0161_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_03_0161
        rs_R010_ueqv_R010NYN_generator_03_0100_0162 =
      rs_R010_ueqv_R010NYN_partial_03_0161 := by
  native_decide

/-- Coefficient term 162 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010NYN_coefficient_03_0162 : Poly :=
[
  term ((646 : Rat) / 5) [(15, 2), (16, 1)]
]

/-- Partial product 162 for generator 3. -/
def rs_R010_ueqv_R010NYN_partial_03_0162 : Poly :=
[
  term ((-1292 : Rat) / 5) [(6, 1), (15, 2), (16, 1)],
  term ((646 : Rat) / 5) [(6, 2), (15, 2), (16, 1)],
  term ((646 : Rat) / 5) [(7, 2), (15, 2), (16, 1)],
  term ((1292 : Rat) / 5) [(8, 1), (15, 2), (16, 1)],
  term ((-646 : Rat) / 5) [(8, 2), (15, 2), (16, 1)],
  term ((-646 : Rat) / 5) [(9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 162 for generator 3. -/
theorem rs_R010_ueqv_R010NYN_partial_03_0162_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_03_0162
        rs_R010_ueqv_R010NYN_generator_03_0100_0162 =
      rs_R010_ueqv_R010NYN_partial_03_0162 := by
  native_decide

/-- Partial products in this block. -/
def rs_R010_ueqv_R010NYN_partials_03_0100_0162 : List Poly :=
[
  rs_R010_ueqv_R010NYN_partial_03_0100,
  rs_R010_ueqv_R010NYN_partial_03_0101,
  rs_R010_ueqv_R010NYN_partial_03_0102,
  rs_R010_ueqv_R010NYN_partial_03_0103,
  rs_R010_ueqv_R010NYN_partial_03_0104,
  rs_R010_ueqv_R010NYN_partial_03_0105,
  rs_R010_ueqv_R010NYN_partial_03_0106,
  rs_R010_ueqv_R010NYN_partial_03_0107,
  rs_R010_ueqv_R010NYN_partial_03_0108,
  rs_R010_ueqv_R010NYN_partial_03_0109,
  rs_R010_ueqv_R010NYN_partial_03_0110,
  rs_R010_ueqv_R010NYN_partial_03_0111,
  rs_R010_ueqv_R010NYN_partial_03_0112,
  rs_R010_ueqv_R010NYN_partial_03_0113,
  rs_R010_ueqv_R010NYN_partial_03_0114,
  rs_R010_ueqv_R010NYN_partial_03_0115,
  rs_R010_ueqv_R010NYN_partial_03_0116,
  rs_R010_ueqv_R010NYN_partial_03_0117,
  rs_R010_ueqv_R010NYN_partial_03_0118,
  rs_R010_ueqv_R010NYN_partial_03_0119,
  rs_R010_ueqv_R010NYN_partial_03_0120,
  rs_R010_ueqv_R010NYN_partial_03_0121,
  rs_R010_ueqv_R010NYN_partial_03_0122,
  rs_R010_ueqv_R010NYN_partial_03_0123,
  rs_R010_ueqv_R010NYN_partial_03_0124,
  rs_R010_ueqv_R010NYN_partial_03_0125,
  rs_R010_ueqv_R010NYN_partial_03_0126,
  rs_R010_ueqv_R010NYN_partial_03_0127,
  rs_R010_ueqv_R010NYN_partial_03_0128,
  rs_R010_ueqv_R010NYN_partial_03_0129,
  rs_R010_ueqv_R010NYN_partial_03_0130,
  rs_R010_ueqv_R010NYN_partial_03_0131,
  rs_R010_ueqv_R010NYN_partial_03_0132,
  rs_R010_ueqv_R010NYN_partial_03_0133,
  rs_R010_ueqv_R010NYN_partial_03_0134,
  rs_R010_ueqv_R010NYN_partial_03_0135,
  rs_R010_ueqv_R010NYN_partial_03_0136,
  rs_R010_ueqv_R010NYN_partial_03_0137,
  rs_R010_ueqv_R010NYN_partial_03_0138,
  rs_R010_ueqv_R010NYN_partial_03_0139,
  rs_R010_ueqv_R010NYN_partial_03_0140,
  rs_R010_ueqv_R010NYN_partial_03_0141,
  rs_R010_ueqv_R010NYN_partial_03_0142,
  rs_R010_ueqv_R010NYN_partial_03_0143,
  rs_R010_ueqv_R010NYN_partial_03_0144,
  rs_R010_ueqv_R010NYN_partial_03_0145,
  rs_R010_ueqv_R010NYN_partial_03_0146,
  rs_R010_ueqv_R010NYN_partial_03_0147,
  rs_R010_ueqv_R010NYN_partial_03_0148,
  rs_R010_ueqv_R010NYN_partial_03_0149,
  rs_R010_ueqv_R010NYN_partial_03_0150,
  rs_R010_ueqv_R010NYN_partial_03_0151,
  rs_R010_ueqv_R010NYN_partial_03_0152,
  rs_R010_ueqv_R010NYN_partial_03_0153,
  rs_R010_ueqv_R010NYN_partial_03_0154,
  rs_R010_ueqv_R010NYN_partial_03_0155,
  rs_R010_ueqv_R010NYN_partial_03_0156,
  rs_R010_ueqv_R010NYN_partial_03_0157,
  rs_R010_ueqv_R010NYN_partial_03_0158,
  rs_R010_ueqv_R010NYN_partial_03_0159,
  rs_R010_ueqv_R010NYN_partial_03_0160,
  rs_R010_ueqv_R010NYN_partial_03_0161,
  rs_R010_ueqv_R010NYN_partial_03_0162
]

/-- Sum of partial products in this block. -/
def rs_R010_ueqv_R010NYN_block_03_0100_0162 : Poly :=
[
  term ((-93216 : Rat) / 599) [(5, 1), (6, 1), (15, 1)],
  term ((341376 : Rat) / 2995) [(5, 1), (6, 1), (15, 3)],
  term ((-128 : Rat) / 5) [(5, 1), (6, 1), (15, 3), (16, 1)],
  term ((46608 : Rat) / 599) [(5, 1), (6, 2), (15, 1)],
  term ((-170688 : Rat) / 2995) [(5, 1), (6, 2), (15, 3)],
  term ((64 : Rat) / 5) [(5, 1), (6, 2), (15, 3), (16, 1)],
  term ((46608 : Rat) / 599) [(5, 1), (7, 2), (15, 1)],
  term ((-170688 : Rat) / 2995) [(5, 1), (7, 2), (15, 3)],
  term ((64 : Rat) / 5) [(5, 1), (7, 2), (15, 3), (16, 1)],
  term ((93216 : Rat) / 599) [(5, 1), (8, 1), (15, 1)],
  term ((-341376 : Rat) / 2995) [(5, 1), (8, 1), (15, 3)],
  term ((128 : Rat) / 5) [(5, 1), (8, 1), (15, 3), (16, 1)],
  term ((-46608 : Rat) / 599) [(5, 1), (8, 2), (15, 1)],
  term ((170688 : Rat) / 2995) [(5, 1), (8, 2), (15, 3)],
  term ((-64 : Rat) / 5) [(5, 1), (8, 2), (15, 3), (16, 1)],
  term ((-46608 : Rat) / 599) [(5, 1), (9, 2), (15, 1)],
  term ((170688 : Rat) / 2995) [(5, 1), (9, 2), (15, 3)],
  term ((-64 : Rat) / 5) [(5, 1), (9, 2), (15, 3), (16, 1)],
  term ((19934208 : Rat) / 2995) [(6, 1), (7, 1), (11, 1), (15, 2)],
  term ((-3792 : Rat) / 5) [(6, 1), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((-11570688 : Rat) / 2995) [(6, 1), (7, 1), (11, 2), (15, 1)],
  term ((84288 : Rat) / 599) [(6, 1), (7, 1), (15, 1)],
  term ((-9695232 : Rat) / 2995) [(6, 1), (7, 1), (15, 3)],
  term ((2136 : Rat) / 5) [(6, 1), (7, 1), (15, 3), (16, 1)],
  term ((-160704 : Rat) / 2995) [(6, 1), (7, 2), (11, 1), (15, 1)],
  term ((-56448 : Rat) / 2995) [(6, 1), (7, 2), (15, 2)],
  term ((-26 : Rat) / 5) [(6, 1), (7, 2), (15, 2), (16, 1)],
  term ((-107136 : Rat) / 599) [(6, 1), (8, 1), (11, 1), (13, 1)],
  term ((7219872 : Rat) / 2995) [(6, 1), (8, 1), (11, 1), (15, 1)],
  term ((-96 : Rat) / 5) [(6, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-160704 : Rat) / 2995) [(6, 1), (8, 1), (11, 2)],
  term ((152832 : Rat) / 599) [(6, 1), (8, 1), (13, 1), (15, 1)],
  term (-20 : Rat) [(6, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1701120 : Rat) / 599) [(6, 1), (8, 1), (15, 2)],
  term (376 : Rat) [(6, 1), (8, 1), (15, 2), (16, 1)],
  term ((160704 : Rat) / 2995) [(6, 1), (8, 2), (11, 1), (15, 1)],
  term ((56448 : Rat) / 2995) [(6, 1), (8, 2), (15, 2)],
  term ((26 : Rat) / 5) [(6, 1), (8, 2), (15, 2), (16, 1)],
  term ((-3240864 : Rat) / 2995) [(6, 1), (9, 1), (11, 1)],
  term ((1750464 : Rat) / 2995) [(6, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-336 : Rat) / 5) [(6, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1559808 : Rat) / 2995) [(6, 1), (9, 1), (11, 1), (15, 2)],
  term ((144 : Rat) / 5) [(6, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-964224 : Rat) / 2995) [(6, 1), (9, 1), (11, 2), (13, 1)],
  term ((642816 : Rat) / 2995) [(6, 1), (9, 1), (11, 2), (15, 1)],
  term ((5448 : Rat) / 599) [(6, 1), (9, 1), (13, 1)],
  term ((-262656 : Rat) / 2995) [(6, 1), (9, 1), (13, 1), (15, 2)],
  term ((-32 : Rat) / 5) [(6, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((3462072 : Rat) / 2995) [(6, 1), (9, 1), (15, 1)],
  term ((-786 : Rat) / 5) [(6, 1), (9, 1), (15, 1), (16, 1)],
  term ((65664 : Rat) / 599) [(6, 1), (9, 1), (15, 3)],
  term (8 : Rat) [(6, 1), (9, 1), (15, 3), (16, 1)],
  term ((160704 : Rat) / 2995) [(6, 1), (9, 2), (11, 1), (15, 1)],
  term ((56448 : Rat) / 2995) [(6, 1), (9, 2), (15, 2)],
  term ((26 : Rat) / 5) [(6, 1), (9, 2), (15, 2), (16, 1)],
  term (12 : Rat) [(6, 1), (10, 1)],
  term ((-1928448 : Rat) / 2995) [(6, 1), (10, 1), (11, 1), (13, 1)],
  term ((1285632 : Rat) / 2995) [(6, 1), (10, 1), (11, 1), (15, 1)],
  term ((2090304 : Rat) / 2995) [(6, 1), (10, 1), (13, 1), (15, 1)],
  term ((-412 : Rat) / 5) [(6, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1423296 : Rat) / 2995) [(6, 1), (10, 1), (15, 2)],
  term ((308 : Rat) / 5) [(6, 1), (10, 1), (15, 2), (16, 1)],
  term ((1240992 : Rat) / 2995) [(6, 1), (11, 1), (13, 1)],
  term ((-567744 : Rat) / 599) [(6, 1), (11, 1), (13, 1), (15, 2)],
  term (160 : Rat) [(6, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((9967104 : Rat) / 2995) [(6, 1), (11, 1), (14, 1), (15, 1)],
  term ((-1896 : Rat) / 5) [(6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-10214328 : Rat) / 2995) [(6, 1), (11, 1), (15, 1)],
  term (287 : Rat) [(6, 1), (11, 1), (15, 1), (16, 1)],
  term ((1224768 : Rat) / 599) [(6, 1), (11, 1), (15, 3)],
  term (-188 : Rat) [(6, 1), (11, 1), (15, 3), (16, 1)],
  term ((937440 : Rat) / 599) [(6, 1), (11, 2)],
  term ((535680 : Rat) / 599) [(6, 1), (11, 2), (13, 1), (15, 1)],
  term ((-5785344 : Rat) / 2995) [(6, 1), (11, 2), (14, 1)],
  term ((-16291584 : Rat) / 2995) [(6, 1), (11, 2), (15, 2)],
  term ((3792 : Rat) / 5) [(6, 1), (11, 2), (15, 2), (16, 1)],
  term ((11570688 : Rat) / 2995) [(6, 1), (11, 3), (15, 1)],
  term ((-1156216 : Rat) / 2995) [(6, 1), (13, 1), (15, 1)],
  term ((278 : Rat) / 5) [(6, 1), (13, 1), (15, 1), (16, 1)],
  term ((42144 : Rat) / 599) [(6, 1), (14, 1)],
  term ((-4847616 : Rat) / 2995) [(6, 1), (14, 1), (15, 2)],
  term ((1068 : Rat) / 5) [(6, 1), (14, 1), (15, 2), (16, 1)],
  term ((5562284 : Rat) / 2995) [(6, 1), (15, 2)],
  term ((-1292 : Rat) / 5) [(6, 1), (15, 2), (16, 1)],
  term ((-9967104 : Rat) / 2995) [(6, 2), (7, 1), (11, 1), (15, 2)],
  term ((1896 : Rat) / 5) [(6, 2), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((5785344 : Rat) / 2995) [(6, 2), (7, 1), (11, 2), (15, 1)],
  term ((-42144 : Rat) / 599) [(6, 2), (7, 1), (15, 1)],
  term ((4847616 : Rat) / 2995) [(6, 2), (7, 1), (15, 3)],
  term ((-1068 : Rat) / 5) [(6, 2), (7, 1), (15, 3), (16, 1)],
  term ((53568 : Rat) / 599) [(6, 2), (8, 1), (11, 1), (13, 1)],
  term ((-754128 : Rat) / 599) [(6, 2), (8, 1), (11, 1), (15, 1)],
  term ((48 : Rat) / 5) [(6, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((80352 : Rat) / 2995) [(6, 2), (8, 1), (11, 2)],
  term ((-76416 : Rat) / 599) [(6, 2), (8, 1), (13, 1), (15, 1)],
  term (10 : Rat) [(6, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((4196352 : Rat) / 2995) [(6, 2), (8, 1), (15, 2)],
  term ((-966 : Rat) / 5) [(6, 2), (8, 1), (15, 2), (16, 1)],
  term ((1620432 : Rat) / 2995) [(6, 2), (9, 1), (11, 1)],
  term ((-875232 : Rat) / 2995) [(6, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((168 : Rat) / 5) [(6, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((779904 : Rat) / 2995) [(6, 2), (9, 1), (11, 1), (15, 2)],
  term ((-72 : Rat) / 5) [(6, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((482112 : Rat) / 2995) [(6, 2), (9, 1), (11, 2), (13, 1)],
  term ((-321408 : Rat) / 2995) [(6, 2), (9, 1), (11, 2), (15, 1)],
  term ((-2724 : Rat) / 599) [(6, 2), (9, 1), (13, 1)],
  term ((131328 : Rat) / 2995) [(6, 2), (9, 1), (13, 1), (15, 2)],
  term ((16 : Rat) / 5) [(6, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1731036 : Rat) / 2995) [(6, 2), (9, 1), (15, 1)],
  term ((393 : Rat) / 5) [(6, 2), (9, 1), (15, 1), (16, 1)],
  term ((-32832 : Rat) / 599) [(6, 2), (9, 1), (15, 3)],
  term (-4 : Rat) [(6, 2), (9, 1), (15, 3), (16, 1)],
  term (-6 : Rat) [(6, 2), (10, 1)],
  term ((964224 : Rat) / 2995) [(6, 2), (10, 1), (11, 1), (13, 1)],
  term ((-642816 : Rat) / 2995) [(6, 2), (10, 1), (11, 1), (15, 1)],
  term ((-1045152 : Rat) / 2995) [(6, 2), (10, 1), (13, 1), (15, 1)],
  term ((206 : Rat) / 5) [(6, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((711648 : Rat) / 2995) [(6, 2), (10, 1), (15, 2)],
  term ((-154 : Rat) / 5) [(6, 2), (10, 1), (15, 2), (16, 1)],
  term ((-620496 : Rat) / 2995) [(6, 2), (11, 1), (13, 1)],
  term ((283872 : Rat) / 599) [(6, 2), (11, 1), (13, 1), (15, 2)],
  term (-80 : Rat) [(6, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-4983552 : Rat) / 2995) [(6, 2), (11, 1), (14, 1), (15, 1)],
  term ((948 : Rat) / 5) [(6, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((5428572 : Rat) / 2995) [(6, 2), (11, 1), (15, 1)],
  term ((-287 : Rat) / 2) [(6, 2), (11, 1), (15, 1), (16, 1)],
  term ((-612384 : Rat) / 599) [(6, 2), (11, 1), (15, 3)],
  term (94 : Rat) [(6, 2), (11, 1), (15, 3), (16, 1)],
  term ((-468720 : Rat) / 599) [(6, 2), (11, 2)],
  term ((-267840 : Rat) / 599) [(6, 2), (11, 2), (13, 1), (15, 1)],
  term ((2892672 : Rat) / 2995) [(6, 2), (11, 2), (14, 1)],
  term ((8145792 : Rat) / 2995) [(6, 2), (11, 2), (15, 2)],
  term ((-1896 : Rat) / 5) [(6, 2), (11, 2), (15, 2), (16, 1)],
  term ((-5785344 : Rat) / 2995) [(6, 2), (11, 3), (15, 1)],
  term ((578108 : Rat) / 2995) [(6, 2), (13, 1), (15, 1)],
  term ((-139 : Rat) / 5) [(6, 2), (13, 1), (15, 1), (16, 1)],
  term ((-21072 : Rat) / 599) [(6, 2), (14, 1)],
  term ((2423808 : Rat) / 2995) [(6, 2), (14, 1), (15, 2)],
  term ((-534 : Rat) / 5) [(6, 2), (14, 1), (15, 2), (16, 1)],
  term ((-2668246 : Rat) / 2995) [(6, 2), (15, 2)],
  term ((698 : Rat) / 5) [(6, 2), (15, 2), (16, 1)],
  term ((-160704 : Rat) / 2995) [(6, 3), (11, 1), (15, 1)],
  term ((-56448 : Rat) / 2995) [(6, 3), (15, 2)],
  term ((-26 : Rat) / 5) [(6, 3), (15, 2), (16, 1)],
  term ((-19934208 : Rat) / 2995) [(7, 1), (8, 1), (11, 1), (15, 2)],
  term ((3792 : Rat) / 5) [(7, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((11570688 : Rat) / 2995) [(7, 1), (8, 1), (11, 2), (15, 1)],
  term ((-84288 : Rat) / 599) [(7, 1), (8, 1), (15, 1)],
  term ((9695232 : Rat) / 2995) [(7, 1), (8, 1), (15, 3)],
  term ((-2136 : Rat) / 5) [(7, 1), (8, 1), (15, 3), (16, 1)],
  term ((9967104 : Rat) / 2995) [(7, 1), (8, 2), (11, 1), (15, 2)],
  term ((-1896 : Rat) / 5) [(7, 1), (8, 2), (11, 1), (15, 2), (16, 1)],
  term ((-5785344 : Rat) / 2995) [(7, 1), (8, 2), (11, 2), (15, 1)],
  term ((42144 : Rat) / 599) [(7, 1), (8, 2), (15, 1)],
  term ((-4847616 : Rat) / 2995) [(7, 1), (8, 2), (15, 3)],
  term ((1068 : Rat) / 5) [(7, 1), (8, 2), (15, 3), (16, 1)],
  term ((9967104 : Rat) / 2995) [(7, 1), (9, 2), (11, 1), (15, 2)],
  term ((-1896 : Rat) / 5) [(7, 1), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((-5785344 : Rat) / 2995) [(7, 1), (9, 2), (11, 2), (15, 1)],
  term ((42144 : Rat) / 599) [(7, 1), (9, 2), (15, 1)],
  term ((-4847616 : Rat) / 2995) [(7, 1), (9, 2), (15, 3)],
  term ((1068 : Rat) / 5) [(7, 1), (9, 2), (15, 3), (16, 1)],
  term ((53568 : Rat) / 599) [(7, 2), (8, 1), (11, 1), (13, 1)],
  term ((-754128 : Rat) / 599) [(7, 2), (8, 1), (11, 1), (15, 1)],
  term ((48 : Rat) / 5) [(7, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((80352 : Rat) / 2995) [(7, 2), (8, 1), (11, 2)],
  term ((-76416 : Rat) / 599) [(7, 2), (8, 1), (13, 1), (15, 1)],
  term (10 : Rat) [(7, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((4196352 : Rat) / 2995) [(7, 2), (8, 1), (15, 2)],
  term ((-966 : Rat) / 5) [(7, 2), (8, 1), (15, 2), (16, 1)],
  term ((1620432 : Rat) / 2995) [(7, 2), (9, 1), (11, 1)],
  term ((-875232 : Rat) / 2995) [(7, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((168 : Rat) / 5) [(7, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((779904 : Rat) / 2995) [(7, 2), (9, 1), (11, 1), (15, 2)],
  term ((-72 : Rat) / 5) [(7, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((482112 : Rat) / 2995) [(7, 2), (9, 1), (11, 2), (13, 1)],
  term ((-321408 : Rat) / 2995) [(7, 2), (9, 1), (11, 2), (15, 1)],
  term ((-2724 : Rat) / 599) [(7, 2), (9, 1), (13, 1)],
  term ((131328 : Rat) / 2995) [(7, 2), (9, 1), (13, 1), (15, 2)],
  term ((16 : Rat) / 5) [(7, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1731036 : Rat) / 2995) [(7, 2), (9, 1), (15, 1)],
  term ((393 : Rat) / 5) [(7, 2), (9, 1), (15, 1), (16, 1)],
  term ((-32832 : Rat) / 599) [(7, 2), (9, 1), (15, 3)],
  term (-4 : Rat) [(7, 2), (9, 1), (15, 3), (16, 1)],
  term (-6 : Rat) [(7, 2), (10, 1)],
  term ((964224 : Rat) / 2995) [(7, 2), (10, 1), (11, 1), (13, 1)],
  term ((-642816 : Rat) / 2995) [(7, 2), (10, 1), (11, 1), (15, 1)],
  term ((-1045152 : Rat) / 2995) [(7, 2), (10, 1), (13, 1), (15, 1)],
  term ((206 : Rat) / 5) [(7, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((711648 : Rat) / 2995) [(7, 2), (10, 1), (15, 2)],
  term ((-154 : Rat) / 5) [(7, 2), (10, 1), (15, 2), (16, 1)],
  term ((-620496 : Rat) / 2995) [(7, 2), (11, 1), (13, 1)],
  term ((283872 : Rat) / 599) [(7, 2), (11, 1), (13, 1), (15, 2)],
  term (-80 : Rat) [(7, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-4983552 : Rat) / 2995) [(7, 2), (11, 1), (14, 1), (15, 1)],
  term ((948 : Rat) / 5) [(7, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((5107164 : Rat) / 2995) [(7, 2), (11, 1), (15, 1)],
  term ((-287 : Rat) / 2) [(7, 2), (11, 1), (15, 1), (16, 1)],
  term ((-612384 : Rat) / 599) [(7, 2), (11, 1), (15, 3)],
  term (94 : Rat) [(7, 2), (11, 1), (15, 3), (16, 1)],
  term ((-468720 : Rat) / 599) [(7, 2), (11, 2)],
  term ((-267840 : Rat) / 599) [(7, 2), (11, 2), (13, 1), (15, 1)],
  term ((2892672 : Rat) / 2995) [(7, 2), (11, 2), (14, 1)],
  term ((8145792 : Rat) / 2995) [(7, 2), (11, 2), (15, 2)],
  term ((-1896 : Rat) / 5) [(7, 2), (11, 2), (15, 2), (16, 1)],
  term ((-5785344 : Rat) / 2995) [(7, 2), (11, 3), (15, 1)],
  term ((578108 : Rat) / 2995) [(7, 2), (13, 1), (15, 1)],
  term ((-139 : Rat) / 5) [(7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-21072 : Rat) / 599) [(7, 2), (14, 1)],
  term ((2423808 : Rat) / 2995) [(7, 2), (14, 1), (15, 2)],
  term ((-534 : Rat) / 5) [(7, 2), (14, 1), (15, 2), (16, 1)],
  term ((-2781142 : Rat) / 2995) [(7, 2), (15, 2)],
  term ((646 : Rat) / 5) [(7, 2), (15, 2), (16, 1)],
  term ((-9967104 : Rat) / 2995) [(7, 3), (11, 1), (15, 2)],
  term ((1896 : Rat) / 5) [(7, 3), (11, 1), (15, 2), (16, 1)],
  term ((5785344 : Rat) / 2995) [(7, 3), (11, 2), (15, 1)],
  term ((-42144 : Rat) / 599) [(7, 3), (15, 1)],
  term ((4847616 : Rat) / 2995) [(7, 3), (15, 3)],
  term ((-1068 : Rat) / 5) [(7, 3), (15, 3), (16, 1)],
  term ((3240864 : Rat) / 2995) [(8, 1), (9, 1), (11, 1)],
  term ((-1750464 : Rat) / 2995) [(8, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((336 : Rat) / 5) [(8, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((1559808 : Rat) / 2995) [(8, 1), (9, 1), (11, 1), (15, 2)],
  term ((-144 : Rat) / 5) [(8, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((964224 : Rat) / 2995) [(8, 1), (9, 1), (11, 2), (13, 1)],
  term ((-642816 : Rat) / 2995) [(8, 1), (9, 1), (11, 2), (15, 1)],
  term ((-5448 : Rat) / 599) [(8, 1), (9, 1), (13, 1)],
  term ((262656 : Rat) / 2995) [(8, 1), (9, 1), (13, 1), (15, 2)],
  term ((32 : Rat) / 5) [(8, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-3462072 : Rat) / 2995) [(8, 1), (9, 1), (15, 1)],
  term ((786 : Rat) / 5) [(8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-65664 : Rat) / 599) [(8, 1), (9, 1), (15, 3)],
  term (-8 : Rat) [(8, 1), (9, 1), (15, 3), (16, 1)],
  term ((-53568 : Rat) / 599) [(8, 1), (9, 2), (11, 1), (13, 1)],
  term ((754128 : Rat) / 599) [(8, 1), (9, 2), (11, 1), (15, 1)],
  term ((-48 : Rat) / 5) [(8, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-80352 : Rat) / 2995) [(8, 1), (9, 2), (11, 2)],
  term ((76416 : Rat) / 599) [(8, 1), (9, 2), (13, 1), (15, 1)],
  term (-10 : Rat) [(8, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-4196352 : Rat) / 2995) [(8, 1), (9, 2), (15, 2)],
  term ((966 : Rat) / 5) [(8, 1), (9, 2), (15, 2), (16, 1)],
  term (-12 : Rat) [(8, 1), (10, 1)],
  term ((1928448 : Rat) / 2995) [(8, 1), (10, 1), (11, 1), (13, 1)],
  term ((-1285632 : Rat) / 2995) [(8, 1), (10, 1), (11, 1), (15, 1)],
  term ((-2090304 : Rat) / 2995) [(8, 1), (10, 1), (13, 1), (15, 1)],
  term ((412 : Rat) / 5) [(8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((1423296 : Rat) / 2995) [(8, 1), (10, 1), (15, 2)],
  term ((-308 : Rat) / 5) [(8, 1), (10, 1), (15, 2), (16, 1)],
  term ((-1240992 : Rat) / 2995) [(8, 1), (11, 1), (13, 1)],
  term ((567744 : Rat) / 599) [(8, 1), (11, 1), (13, 1), (15, 2)],
  term (-160 : Rat) [(8, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-9967104 : Rat) / 2995) [(8, 1), (11, 1), (14, 1), (15, 1)],
  term ((1896 : Rat) / 5) [(8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((10214328 : Rat) / 2995) [(8, 1), (11, 1), (15, 1)],
  term (-287 : Rat) [(8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1224768 : Rat) / 599) [(8, 1), (11, 1), (15, 3)],
  term (188 : Rat) [(8, 1), (11, 1), (15, 3), (16, 1)],
  term ((-937440 : Rat) / 599) [(8, 1), (11, 2)],
  term ((-535680 : Rat) / 599) [(8, 1), (11, 2), (13, 1), (15, 1)],
  term ((5785344 : Rat) / 2995) [(8, 1), (11, 2), (14, 1)],
  term ((16291584 : Rat) / 2995) [(8, 1), (11, 2), (15, 2)],
  term ((-3792 : Rat) / 5) [(8, 1), (11, 2), (15, 2), (16, 1)],
  term ((-11570688 : Rat) / 2995) [(8, 1), (11, 3), (15, 1)],
  term ((1156216 : Rat) / 2995) [(8, 1), (13, 1), (15, 1)],
  term ((-278 : Rat) / 5) [(8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-42144 : Rat) / 599) [(8, 1), (14, 1)],
  term ((4847616 : Rat) / 2995) [(8, 1), (14, 1), (15, 2)],
  term ((-1068 : Rat) / 5) [(8, 1), (14, 1), (15, 2), (16, 1)],
  term ((-5562284 : Rat) / 2995) [(8, 1), (15, 2)],
  term ((1292 : Rat) / 5) [(8, 1), (15, 2), (16, 1)],
  term ((-1620432 : Rat) / 2995) [(8, 2), (9, 1), (11, 1)],
  term ((875232 : Rat) / 2995) [(8, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-168 : Rat) / 5) [(8, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-779904 : Rat) / 2995) [(8, 2), (9, 1), (11, 1), (15, 2)],
  term ((72 : Rat) / 5) [(8, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-482112 : Rat) / 2995) [(8, 2), (9, 1), (11, 2), (13, 1)],
  term ((321408 : Rat) / 2995) [(8, 2), (9, 1), (11, 2), (15, 1)],
  term ((2724 : Rat) / 599) [(8, 2), (9, 1), (13, 1)],
  term ((-131328 : Rat) / 2995) [(8, 2), (9, 1), (13, 1), (15, 2)],
  term ((-16 : Rat) / 5) [(8, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((1731036 : Rat) / 2995) [(8, 2), (9, 1), (15, 1)],
  term ((-393 : Rat) / 5) [(8, 2), (9, 1), (15, 1), (16, 1)],
  term ((32832 : Rat) / 599) [(8, 2), (9, 1), (15, 3)],
  term (4 : Rat) [(8, 2), (9, 1), (15, 3), (16, 1)],
  term (6 : Rat) [(8, 2), (10, 1)],
  term ((-964224 : Rat) / 2995) [(8, 2), (10, 1), (11, 1), (13, 1)],
  term ((642816 : Rat) / 2995) [(8, 2), (10, 1), (11, 1), (15, 1)],
  term ((1045152 : Rat) / 2995) [(8, 2), (10, 1), (13, 1), (15, 1)],
  term ((-206 : Rat) / 5) [(8, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-711648 : Rat) / 2995) [(8, 2), (10, 1), (15, 2)],
  term ((154 : Rat) / 5) [(8, 2), (10, 1), (15, 2), (16, 1)],
  term ((1156176 : Rat) / 2995) [(8, 2), (11, 1), (13, 1)],
  term ((-283872 : Rat) / 599) [(8, 2), (11, 1), (13, 1), (15, 2)],
  term (80 : Rat) [(8, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((4983552 : Rat) / 2995) [(8, 2), (11, 1), (14, 1), (15, 1)],
  term ((-948 : Rat) / 5) [(8, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-12648444 : Rat) / 2995) [(8, 2), (11, 1), (15, 1)],
  term ((1627 : Rat) / 10) [(8, 2), (11, 1), (15, 1), (16, 1)],
  term ((612384 : Rat) / 599) [(8, 2), (11, 1), (15, 3)],
  term (-94 : Rat) [(8, 2), (11, 1), (15, 3), (16, 1)],
  term ((2504304 : Rat) / 2995) [(8, 2), (11, 2)],
  term ((267840 : Rat) / 599) [(8, 2), (11, 2), (13, 1), (15, 1)],
  term ((-2892672 : Rat) / 2995) [(8, 2), (11, 2), (14, 1)],
  term ((-8145792 : Rat) / 2995) [(8, 2), (11, 2), (15, 2)],
  term ((1896 : Rat) / 5) [(8, 2), (11, 2), (15, 2), (16, 1)],
  term ((5785344 : Rat) / 2995) [(8, 2), (11, 3), (15, 1)],
  term ((-1342268 : Rat) / 2995) [(8, 2), (13, 1), (15, 1)],
  term ((239 : Rat) / 5) [(8, 2), (13, 1), (15, 1), (16, 1)],
  term ((21072 : Rat) / 599) [(8, 2), (14, 1)],
  term ((-2423808 : Rat) / 2995) [(8, 2), (14, 1), (15, 2)],
  term ((534 : Rat) / 5) [(8, 2), (14, 1), (15, 2), (16, 1)],
  term ((11173846 : Rat) / 2995) [(8, 2), (15, 2)],
  term ((-2578 : Rat) / 5) [(8, 2), (15, 2), (16, 1)],
  term ((-53568 : Rat) / 599) [(8, 3), (11, 1), (13, 1)],
  term ((754128 : Rat) / 599) [(8, 3), (11, 1), (15, 1)],
  term ((-48 : Rat) / 5) [(8, 3), (11, 1), (15, 1), (16, 1)],
  term ((-80352 : Rat) / 2995) [(8, 3), (11, 2)],
  term ((76416 : Rat) / 599) [(8, 3), (13, 1), (15, 1)],
  term (-10 : Rat) [(8, 3), (13, 1), (15, 1), (16, 1)],
  term ((-4196352 : Rat) / 2995) [(8, 3), (15, 2)],
  term ((966 : Rat) / 5) [(8, 3), (15, 2), (16, 1)],
  term (6 : Rat) [(9, 2), (10, 1)],
  term ((-964224 : Rat) / 2995) [(9, 2), (10, 1), (11, 1), (13, 1)],
  term ((642816 : Rat) / 2995) [(9, 2), (10, 1), (11, 1), (15, 1)],
  term ((1045152 : Rat) / 2995) [(9, 2), (10, 1), (13, 1), (15, 1)],
  term ((-206 : Rat) / 5) [(9, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-711648 : Rat) / 2995) [(9, 2), (10, 1), (15, 2)],
  term ((154 : Rat) / 5) [(9, 2), (10, 1), (15, 2), (16, 1)],
  term ((620496 : Rat) / 2995) [(9, 2), (11, 1), (13, 1)],
  term ((-283872 : Rat) / 599) [(9, 2), (11, 1), (13, 1), (15, 2)],
  term (80 : Rat) [(9, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((4983552 : Rat) / 2995) [(9, 2), (11, 1), (14, 1), (15, 1)],
  term ((-948 : Rat) / 5) [(9, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5107164 : Rat) / 2995) [(9, 2), (11, 1), (15, 1)],
  term ((287 : Rat) / 2) [(9, 2), (11, 1), (15, 1), (16, 1)],
  term ((612384 : Rat) / 599) [(9, 2), (11, 1), (15, 3)],
  term (-94 : Rat) [(9, 2), (11, 1), (15, 3), (16, 1)],
  term ((468720 : Rat) / 599) [(9, 2), (11, 2)],
  term ((267840 : Rat) / 599) [(9, 2), (11, 2), (13, 1), (15, 1)],
  term ((-2892672 : Rat) / 2995) [(9, 2), (11, 2), (14, 1)],
  term ((-8145792 : Rat) / 2995) [(9, 2), (11, 2), (15, 2)],
  term ((1896 : Rat) / 5) [(9, 2), (11, 2), (15, 2), (16, 1)],
  term ((5785344 : Rat) / 2995) [(9, 2), (11, 3), (15, 1)],
  term ((-578108 : Rat) / 2995) [(9, 2), (13, 1), (15, 1)],
  term ((139 : Rat) / 5) [(9, 2), (13, 1), (15, 1), (16, 1)],
  term ((21072 : Rat) / 599) [(9, 2), (14, 1)],
  term ((-2423808 : Rat) / 2995) [(9, 2), (14, 1), (15, 2)],
  term ((534 : Rat) / 5) [(9, 2), (14, 1), (15, 2), (16, 1)],
  term ((2781142 : Rat) / 2995) [(9, 2), (15, 2)],
  term ((-646 : Rat) / 5) [(9, 2), (15, 2), (16, 1)],
  term ((-1620432 : Rat) / 2995) [(9, 3), (11, 1)],
  term ((875232 : Rat) / 2995) [(9, 3), (11, 1), (13, 1), (15, 1)],
  term ((-168 : Rat) / 5) [(9, 3), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-779904 : Rat) / 2995) [(9, 3), (11, 1), (15, 2)],
  term ((72 : Rat) / 5) [(9, 3), (11, 1), (15, 2), (16, 1)],
  term ((-482112 : Rat) / 2995) [(9, 3), (11, 2), (13, 1)],
  term ((321408 : Rat) / 2995) [(9, 3), (11, 2), (15, 1)],
  term ((2724 : Rat) / 599) [(9, 3), (13, 1)],
  term ((-131328 : Rat) / 2995) [(9, 3), (13, 1), (15, 2)],
  term ((-16 : Rat) / 5) [(9, 3), (13, 1), (15, 2), (16, 1)],
  term ((1731036 : Rat) / 2995) [(9, 3), (15, 1)],
  term ((-393 : Rat) / 5) [(9, 3), (15, 1), (16, 1)],
  term ((32832 : Rat) / 599) [(9, 3), (15, 3)],
  term (4 : Rat) [(9, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 3, terms 100 through 162. -/
theorem rs_R010_ueqv_R010NYN_block_03_0100_0162_valid :
    checkProductSumEq rs_R010_ueqv_R010NYN_partials_03_0100_0162
      rs_R010_ueqv_R010NYN_block_03_0100_0162 = true := by
  native_decide

end R010UeqvR010NYNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
