/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R011:u=v:R011YYY, term block 5:200-232

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R011UeqvR011YYYTermShards

/-- Generator polynomial 5 for relaxed split surplus certificate `R011:u=v:R011YYY`. -/
def rs_R011_ueqv_R011YYY_generator_05_0200_0232 : Poly :=
[
  term (-2 : Rat) [(4, 1)],
  term (1 : Rat) [(4, 2)],
  term (1 : Rat) [(5, 2)],
  term (2 : Rat) [(14, 1)],
  term (-1 : Rat) [(14, 2)],
  term (-1 : Rat) [(15, 2)]
]

/-- Coefficient term 200 from coefficient polynomial 5. -/
def rs_R011_ueqv_R011YYY_coefficient_05_0200 : Poly :=
[
  term ((48 : Rat) / 227) [(10, 1), (14, 2), (16, 1)]
]

/-- Partial product 200 for generator 5. -/
def rs_R011_ueqv_R011YYY_partial_05_0200 : Poly :=
[
  term ((-96 : Rat) / 227) [(4, 1), (10, 1), (14, 2), (16, 1)],
  term ((48 : Rat) / 227) [(4, 2), (10, 1), (14, 2), (16, 1)],
  term ((48 : Rat) / 227) [(5, 2), (10, 1), (14, 2), (16, 1)],
  term ((-48 : Rat) / 227) [(10, 1), (14, 2), (15, 2), (16, 1)],
  term ((96 : Rat) / 227) [(10, 1), (14, 3), (16, 1)],
  term ((-48 : Rat) / 227) [(10, 1), (14, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 200 for generator 5. -/
theorem rs_R011_ueqv_R011YYY_partial_05_0200_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_05_0200
        rs_R011_ueqv_R011YYY_generator_05_0200_0232 =
      rs_R011_ueqv_R011YYY_partial_05_0200 := by
  native_decide

/-- Coefficient term 201 from coefficient polynomial 5. -/
def rs_R011_ueqv_R011YYY_coefficient_05_0201 : Poly :=
[
  term ((-1084 : Rat) / 1135) [(10, 1), (15, 2), (16, 1)]
]

/-- Partial product 201 for generator 5. -/
def rs_R011_ueqv_R011YYY_partial_05_0201 : Poly :=
[
  term ((2168 : Rat) / 1135) [(4, 1), (10, 1), (15, 2), (16, 1)],
  term ((-1084 : Rat) / 1135) [(4, 2), (10, 1), (15, 2), (16, 1)],
  term ((-1084 : Rat) / 1135) [(5, 2), (10, 1), (15, 2), (16, 1)],
  term ((-2168 : Rat) / 1135) [(10, 1), (14, 1), (15, 2), (16, 1)],
  term ((1084 : Rat) / 1135) [(10, 1), (14, 2), (15, 2), (16, 1)],
  term ((1084 : Rat) / 1135) [(10, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 201 for generator 5. -/
theorem rs_R011_ueqv_R011YYY_partial_05_0201_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_05_0201
        rs_R011_ueqv_R011YYY_generator_05_0200_0232 =
      rs_R011_ueqv_R011YYY_partial_05_0201 := by
  native_decide

/-- Coefficient term 202 from coefficient polynomial 5. -/
def rs_R011_ueqv_R011YYY_coefficient_05_0202 : Poly :=
[
  term ((46199 : Rat) / 2270) [(10, 1), (16, 1)]
]

/-- Partial product 202 for generator 5. -/
def rs_R011_ueqv_R011YYY_partial_05_0202 : Poly :=
[
  term ((-46199 : Rat) / 1135) [(4, 1), (10, 1), (16, 1)],
  term ((46199 : Rat) / 2270) [(4, 2), (10, 1), (16, 1)],
  term ((46199 : Rat) / 2270) [(5, 2), (10, 1), (16, 1)],
  term ((46199 : Rat) / 1135) [(10, 1), (14, 1), (16, 1)],
  term ((-46199 : Rat) / 2270) [(10, 1), (14, 2), (16, 1)],
  term ((-46199 : Rat) / 2270) [(10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 202 for generator 5. -/
theorem rs_R011_ueqv_R011YYY_partial_05_0202_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_05_0202
        rs_R011_ueqv_R011YYY_generator_05_0200_0232 =
      rs_R011_ueqv_R011YYY_partial_05_0202 := by
  native_decide

/-- Coefficient term 203 from coefficient polynomial 5. -/
def rs_R011_ueqv_R011YYY_coefficient_05_0203 : Poly :=
[
  term ((-7184 : Rat) / 1135) [(10, 2), (16, 1)]
]

/-- Partial product 203 for generator 5. -/
def rs_R011_ueqv_R011YYY_partial_05_0203 : Poly :=
[
  term ((14368 : Rat) / 1135) [(4, 1), (10, 2), (16, 1)],
  term ((-7184 : Rat) / 1135) [(4, 2), (10, 2), (16, 1)],
  term ((-7184 : Rat) / 1135) [(5, 2), (10, 2), (16, 1)],
  term ((-14368 : Rat) / 1135) [(10, 2), (14, 1), (16, 1)],
  term ((7184 : Rat) / 1135) [(10, 2), (14, 2), (16, 1)],
  term ((7184 : Rat) / 1135) [(10, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 203 for generator 5. -/
theorem rs_R011_ueqv_R011YYY_partial_05_0203_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_05_0203
        rs_R011_ueqv_R011YYY_generator_05_0200_0232 =
      rs_R011_ueqv_R011YYY_partial_05_0203 := by
  native_decide

/-- Coefficient term 204 from coefficient polynomial 5. -/
def rs_R011_ueqv_R011YYY_coefficient_05_0204 : Poly :=
[
  term (-16 : Rat) [(11, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 204 for generator 5. -/
def rs_R011_ueqv_R011YYY_partial_05_0204 : Poly :=
[
  term (32 : Rat) [(4, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term (-16 : Rat) [(4, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term (-16 : Rat) [(5, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term (16 : Rat) [(11, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term (-32 : Rat) [(11, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term (16 : Rat) [(11, 1), (12, 1), (13, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 204 for generator 5. -/
theorem rs_R011_ueqv_R011YYY_partial_05_0204_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_05_0204
        rs_R011_ueqv_R011YYY_generator_05_0200_0232 =
      rs_R011_ueqv_R011YYY_partial_05_0204 := by
  native_decide

/-- Coefficient term 205 from coefficient polynomial 5. -/
def rs_R011_ueqv_R011YYY_coefficient_05_0205 : Poly :=
[
  term (16 : Rat) [(11, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 205 for generator 5. -/
def rs_R011_ueqv_R011YYY_partial_05_0205 : Poly :=
[
  term (-32 : Rat) [(4, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term (16 : Rat) [(4, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term (16 : Rat) [(5, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term (32 : Rat) [(11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term (-16 : Rat) [(11, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term (-16 : Rat) [(11, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 205 for generator 5. -/
theorem rs_R011_ueqv_R011YYY_partial_05_0205_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_05_0205
        rs_R011_ueqv_R011YYY_generator_05_0200_0232 =
      rs_R011_ueqv_R011YYY_partial_05_0205 := by
  native_decide

/-- Coefficient term 206 from coefficient polynomial 5. -/
def rs_R011_ueqv_R011YYY_coefficient_05_0206 : Poly :=
[
  term (4 : Rat) [(11, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 206 for generator 5. -/
def rs_R011_ueqv_R011YYY_partial_05_0206 : Poly :=
[
  term (-8 : Rat) [(4, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(4, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(5, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(11, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term (8 : Rat) [(11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term (-4 : Rat) [(11, 1), (12, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 206 for generator 5. -/
theorem rs_R011_ueqv_R011YYY_partial_05_0206_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_05_0206
        rs_R011_ueqv_R011YYY_generator_05_0200_0232 =
      rs_R011_ueqv_R011YYY_partial_05_0206 := by
  native_decide

/-- Coefficient term 207 from coefficient polynomial 5. -/
def rs_R011_ueqv_R011YYY_coefficient_05_0207 : Poly :=
[
  term ((-342 : Rat) / 227) [(11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 207 for generator 5. -/
def rs_R011_ueqv_R011YYY_partial_05_0207 : Poly :=
[
  term ((684 : Rat) / 227) [(4, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-342 : Rat) / 227) [(4, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-342 : Rat) / 227) [(5, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-684 : Rat) / 227) [(11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((342 : Rat) / 227) [(11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((342 : Rat) / 227) [(11, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 207 for generator 5. -/
theorem rs_R011_ueqv_R011YYY_partial_05_0207_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_05_0207
        rs_R011_ueqv_R011YYY_generator_05_0200_0232 =
      rs_R011_ueqv_R011YYY_partial_05_0207 := by
  native_decide

/-- Coefficient term 208 from coefficient polynomial 5. -/
def rs_R011_ueqv_R011YYY_coefficient_05_0208 : Poly :=
[
  term ((4428 : Rat) / 227) [(11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 208 for generator 5. -/
def rs_R011_ueqv_R011YYY_partial_05_0208 : Poly :=
[
  term ((-8856 : Rat) / 227) [(4, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((4428 : Rat) / 227) [(4, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((4428 : Rat) / 227) [(5, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-4428 : Rat) / 227) [(11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((8856 : Rat) / 227) [(11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-4428 : Rat) / 227) [(11, 1), (13, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 208 for generator 5. -/
theorem rs_R011_ueqv_R011YYY_partial_05_0208_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_05_0208
        rs_R011_ueqv_R011YYY_generator_05_0200_0232 =
      rs_R011_ueqv_R011YYY_partial_05_0208 := by
  native_decide

/-- Coefficient term 209 from coefficient polynomial 5. -/
def rs_R011_ueqv_R011YYY_coefficient_05_0209 : Poly :=
[
  term ((15097 : Rat) / 454) [(11, 1), (13, 1), (16, 1)]
]

/-- Partial product 209 for generator 5. -/
def rs_R011_ueqv_R011YYY_partial_05_0209 : Poly :=
[
  term ((-15097 : Rat) / 227) [(4, 1), (11, 1), (13, 1), (16, 1)],
  term ((15097 : Rat) / 454) [(4, 2), (11, 1), (13, 1), (16, 1)],
  term ((15097 : Rat) / 454) [(5, 2), (11, 1), (13, 1), (16, 1)],
  term ((15097 : Rat) / 227) [(11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-15097 : Rat) / 454) [(11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-15097 : Rat) / 454) [(11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 209 for generator 5. -/
theorem rs_R011_ueqv_R011YYY_partial_05_0209_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_05_0209
        rs_R011_ueqv_R011YYY_generator_05_0200_0232 =
      rs_R011_ueqv_R011YYY_partial_05_0209 := by
  native_decide

/-- Coefficient term 210 from coefficient polynomial 5. -/
def rs_R011_ueqv_R011YYY_coefficient_05_0210 : Poly :=
[
  term (-4 : Rat) [(11, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 210 for generator 5. -/
def rs_R011_ueqv_R011YYY_partial_05_0210 : Poly :=
[
  term (8 : Rat) [(4, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term (-4 : Rat) [(4, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term (-4 : Rat) [(5, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term (-8 : Rat) [(11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(11, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term (4 : Rat) [(11, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 210 for generator 5. -/
theorem rs_R011_ueqv_R011YYY_partial_05_0210_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_05_0210
        rs_R011_ueqv_R011YYY_generator_05_0200_0232 =
      rs_R011_ueqv_R011YYY_partial_05_0210 := by
  native_decide

/-- Coefficient term 211 from coefficient polynomial 5. -/
def rs_R011_ueqv_R011YYY_coefficient_05_0211 : Poly :=
[
  term (16 : Rat) [(11, 1), (13, 3), (16, 1)]
]

/-- Partial product 211 for generator 5. -/
def rs_R011_ueqv_R011YYY_partial_05_0211 : Poly :=
[
  term (-32 : Rat) [(4, 1), (11, 1), (13, 3), (16, 1)],
  term (16 : Rat) [(4, 2), (11, 1), (13, 3), (16, 1)],
  term (16 : Rat) [(5, 2), (11, 1), (13, 3), (16, 1)],
  term (32 : Rat) [(11, 1), (13, 3), (14, 1), (16, 1)],
  term (-16 : Rat) [(11, 1), (13, 3), (14, 2), (16, 1)],
  term (-16 : Rat) [(11, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 211 for generator 5. -/
theorem rs_R011_ueqv_R011YYY_partial_05_0211_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_05_0211
        rs_R011_ueqv_R011YYY_generator_05_0200_0232 =
      rs_R011_ueqv_R011YYY_partial_05_0211 := by
  native_decide

/-- Coefficient term 212 from coefficient polynomial 5. -/
def rs_R011_ueqv_R011YYY_coefficient_05_0212 : Poly :=
[
  term ((1324 : Rat) / 1135) [(11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 212 for generator 5. -/
def rs_R011_ueqv_R011YYY_partial_05_0212 : Poly :=
[
  term ((-2648 : Rat) / 1135) [(4, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((1324 : Rat) / 1135) [(4, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((1324 : Rat) / 1135) [(5, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1324 : Rat) / 1135) [(11, 1), (14, 1), (15, 3), (16, 1)],
  term ((2648 : Rat) / 1135) [(11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1324 : Rat) / 1135) [(11, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 212 for generator 5. -/
theorem rs_R011_ueqv_R011YYY_partial_05_0212_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_05_0212
        rs_R011_ueqv_R011YYY_generator_05_0200_0232 =
      rs_R011_ueqv_R011YYY_partial_05_0212 := by
  native_decide

/-- Coefficient term 213 from coefficient polynomial 5. -/
def rs_R011_ueqv_R011YYY_coefficient_05_0213 : Poly :=
[
  term ((3992 : Rat) / 3405) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 213 for generator 5. -/
def rs_R011_ueqv_R011YYY_partial_05_0213 : Poly :=
[
  term ((-7984 : Rat) / 3405) [(4, 1), (11, 1), (15, 1), (16, 1)],
  term ((3992 : Rat) / 3405) [(4, 2), (11, 1), (15, 1), (16, 1)],
  term ((3992 : Rat) / 3405) [(5, 2), (11, 1), (15, 1), (16, 1)],
  term ((7984 : Rat) / 3405) [(11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3992 : Rat) / 3405) [(11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-3992 : Rat) / 3405) [(11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 213 for generator 5. -/
theorem rs_R011_ueqv_R011YYY_partial_05_0213_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_05_0213
        rs_R011_ueqv_R011YYY_generator_05_0200_0232 =
      rs_R011_ueqv_R011YYY_partial_05_0213 := by
  native_decide

/-- Coefficient term 214 from coefficient polynomial 5. -/
def rs_R011_ueqv_R011YYY_coefficient_05_0214 : Poly :=
[
  term ((-272 : Rat) / 681) [(11, 2), (14, 1), (16, 1)]
]

/-- Partial product 214 for generator 5. -/
def rs_R011_ueqv_R011YYY_partial_05_0214 : Poly :=
[
  term ((544 : Rat) / 681) [(4, 1), (11, 2), (14, 1), (16, 1)],
  term ((-272 : Rat) / 681) [(4, 2), (11, 2), (14, 1), (16, 1)],
  term ((-272 : Rat) / 681) [(5, 2), (11, 2), (14, 1), (16, 1)],
  term ((272 : Rat) / 681) [(11, 2), (14, 1), (15, 2), (16, 1)],
  term ((-544 : Rat) / 681) [(11, 2), (14, 2), (16, 1)],
  term ((272 : Rat) / 681) [(11, 2), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 214 for generator 5. -/
theorem rs_R011_ueqv_R011YYY_partial_05_0214_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_05_0214
        rs_R011_ueqv_R011YYY_generator_05_0200_0232 =
      rs_R011_ueqv_R011YYY_partial_05_0214 := by
  native_decide

/-- Coefficient term 215 from coefficient polynomial 5. -/
def rs_R011_ueqv_R011YYY_coefficient_05_0215 : Poly :=
[
  term ((7224 : Rat) / 1135) [(11, 2), (16, 1)]
]

/-- Partial product 215 for generator 5. -/
def rs_R011_ueqv_R011YYY_partial_05_0215 : Poly :=
[
  term ((-14448 : Rat) / 1135) [(4, 1), (11, 2), (16, 1)],
  term ((7224 : Rat) / 1135) [(4, 2), (11, 2), (16, 1)],
  term ((7224 : Rat) / 1135) [(5, 2), (11, 2), (16, 1)],
  term ((14448 : Rat) / 1135) [(11, 2), (14, 1), (16, 1)],
  term ((-7224 : Rat) / 1135) [(11, 2), (14, 2), (16, 1)],
  term ((-7224 : Rat) / 1135) [(11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 215 for generator 5. -/
theorem rs_R011_ueqv_R011YYY_partial_05_0215_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_05_0215
        rs_R011_ueqv_R011YYY_generator_05_0200_0232 =
      rs_R011_ueqv_R011YYY_partial_05_0215 := by
  native_decide

/-- Coefficient term 216 from coefficient polynomial 5. -/
def rs_R011_ueqv_R011YYY_coefficient_05_0216 : Poly :=
[
  term (-16 : Rat) [(12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 216 for generator 5. -/
def rs_R011_ueqv_R011YYY_partial_05_0216 : Poly :=
[
  term (32 : Rat) [(4, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term (-16 : Rat) [(4, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term (-16 : Rat) [(5, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term (-32 : Rat) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term (16 : Rat) [(12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term (16 : Rat) [(12, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 216 for generator 5. -/
theorem rs_R011_ueqv_R011YYY_partial_05_0216_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_05_0216
        rs_R011_ueqv_R011YYY_generator_05_0200_0232 =
      rs_R011_ueqv_R011YYY_partial_05_0216 := by
  native_decide

/-- Coefficient term 217 from coefficient polynomial 5. -/
def rs_R011_ueqv_R011YYY_coefficient_05_0217 : Poly :=
[
  term (-56 : Rat) [(12, 1), (13, 2), (14, 1), (16, 1)]
]

/-- Partial product 217 for generator 5. -/
def rs_R011_ueqv_R011YYY_partial_05_0217 : Poly :=
[
  term (112 : Rat) [(4, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term (-56 : Rat) [(4, 2), (12, 1), (13, 2), (14, 1), (16, 1)],
  term (-56 : Rat) [(5, 2), (12, 1), (13, 2), (14, 1), (16, 1)],
  term (56 : Rat) [(12, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term (-112 : Rat) [(12, 1), (13, 2), (14, 2), (16, 1)],
  term (56 : Rat) [(12, 1), (13, 2), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 217 for generator 5. -/
theorem rs_R011_ueqv_R011YYY_partial_05_0217_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_05_0217
        rs_R011_ueqv_R011YYY_generator_05_0200_0232 =
      rs_R011_ueqv_R011YYY_partial_05_0217 := by
  native_decide

/-- Coefficient term 218 from coefficient polynomial 5. -/
def rs_R011_ueqv_R011YYY_coefficient_05_0218 : Poly :=
[
  term (38 : Rat) [(12, 1), (13, 2), (16, 1)]
]

/-- Partial product 218 for generator 5. -/
def rs_R011_ueqv_R011YYY_partial_05_0218 : Poly :=
[
  term (-76 : Rat) [(4, 1), (12, 1), (13, 2), (16, 1)],
  term (38 : Rat) [(4, 2), (12, 1), (13, 2), (16, 1)],
  term (38 : Rat) [(5, 2), (12, 1), (13, 2), (16, 1)],
  term (76 : Rat) [(12, 1), (13, 2), (14, 1), (16, 1)],
  term (-38 : Rat) [(12, 1), (13, 2), (14, 2), (16, 1)],
  term (-38 : Rat) [(12, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 218 for generator 5. -/
theorem rs_R011_ueqv_R011YYY_partial_05_0218_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_05_0218
        rs_R011_ueqv_R011YYY_generator_05_0200_0232 =
      rs_R011_ueqv_R011YYY_partial_05_0218 := by
  native_decide

/-- Coefficient term 219 from coefficient polynomial 5. -/
def rs_R011_ueqv_R011YYY_coefficient_05_0219 : Poly :=
[
  term ((-3873 : Rat) / 2270) [(12, 1), (14, 1), (16, 1)]
]

/-- Partial product 219 for generator 5. -/
def rs_R011_ueqv_R011YYY_partial_05_0219 : Poly :=
[
  term ((3873 : Rat) / 1135) [(4, 1), (12, 1), (14, 1), (16, 1)],
  term ((-3873 : Rat) / 2270) [(4, 2), (12, 1), (14, 1), (16, 1)],
  term ((-3873 : Rat) / 2270) [(5, 2), (12, 1), (14, 1), (16, 1)],
  term ((3873 : Rat) / 2270) [(12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-3873 : Rat) / 1135) [(12, 1), (14, 2), (16, 1)],
  term ((3873 : Rat) / 2270) [(12, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 219 for generator 5. -/
theorem rs_R011_ueqv_R011YYY_partial_05_0219_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_05_0219
        rs_R011_ueqv_R011YYY_generator_05_0200_0232 =
      rs_R011_ueqv_R011YYY_partial_05_0219 := by
  native_decide

/-- Coefficient term 220 from coefficient polynomial 5. -/
def rs_R011_ueqv_R011YYY_coefficient_05_0220 : Poly :=
[
  term ((1987 : Rat) / 227) [(12, 1), (15, 2), (16, 1)]
]

/-- Partial product 220 for generator 5. -/
def rs_R011_ueqv_R011YYY_partial_05_0220 : Poly :=
[
  term ((-3974 : Rat) / 227) [(4, 1), (12, 1), (15, 2), (16, 1)],
  term ((1987 : Rat) / 227) [(4, 2), (12, 1), (15, 2), (16, 1)],
  term ((1987 : Rat) / 227) [(5, 2), (12, 1), (15, 2), (16, 1)],
  term ((3974 : Rat) / 227) [(12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1987 : Rat) / 227) [(12, 1), (14, 2), (15, 2), (16, 1)],
  term ((-1987 : Rat) / 227) [(12, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 220 for generator 5. -/
theorem rs_R011_ueqv_R011YYY_partial_05_0220_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_05_0220
        rs_R011_ueqv_R011YYY_generator_05_0200_0232 =
      rs_R011_ueqv_R011YYY_partial_05_0220 := by
  native_decide

/-- Coefficient term 221 from coefficient polynomial 5. -/
def rs_R011_ueqv_R011YYY_coefficient_05_0221 : Poly :=
[
  term ((-15713 : Rat) / 2270) [(12, 1), (16, 1)]
]

/-- Partial product 221 for generator 5. -/
def rs_R011_ueqv_R011YYY_partial_05_0221 : Poly :=
[
  term ((15713 : Rat) / 1135) [(4, 1), (12, 1), (16, 1)],
  term ((-15713 : Rat) / 2270) [(4, 2), (12, 1), (16, 1)],
  term ((-15713 : Rat) / 2270) [(5, 2), (12, 1), (16, 1)],
  term ((-15713 : Rat) / 1135) [(12, 1), (14, 1), (16, 1)],
  term ((15713 : Rat) / 2270) [(12, 1), (14, 2), (16, 1)],
  term ((15713 : Rat) / 2270) [(12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 221 for generator 5. -/
theorem rs_R011_ueqv_R011YYY_partial_05_0221_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_05_0221
        rs_R011_ueqv_R011YYY_generator_05_0200_0232 =
      rs_R011_ueqv_R011YYY_partial_05_0221 := by
  native_decide

/-- Coefficient term 222 from coefficient polynomial 5. -/
def rs_R011_ueqv_R011YYY_coefficient_05_0222 : Poly :=
[
  term (56 : Rat) [(12, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 222 for generator 5. -/
def rs_R011_ueqv_R011YYY_partial_05_0222 : Poly :=
[
  term (-112 : Rat) [(4, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term (56 : Rat) [(4, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term (56 : Rat) [(5, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term (112 : Rat) [(12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term (-56 : Rat) [(12, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term (-56 : Rat) [(12, 2), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 222 for generator 5. -/
theorem rs_R011_ueqv_R011YYY_partial_05_0222_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_05_0222
        rs_R011_ueqv_R011YYY_generator_05_0200_0232 =
      rs_R011_ueqv_R011YYY_partial_05_0222 := by
  native_decide

/-- Coefficient term 223 from coefficient polynomial 5. -/
def rs_R011_ueqv_R011YYY_coefficient_05_0223 : Poly :=
[
  term (2 : Rat) [(12, 2), (14, 1), (16, 1)]
]

/-- Partial product 223 for generator 5. -/
def rs_R011_ueqv_R011YYY_partial_05_0223 : Poly :=
[
  term (-4 : Rat) [(4, 1), (12, 2), (14, 1), (16, 1)],
  term (2 : Rat) [(4, 2), (12, 2), (14, 1), (16, 1)],
  term (2 : Rat) [(5, 2), (12, 2), (14, 1), (16, 1)],
  term (-2 : Rat) [(12, 2), (14, 1), (15, 2), (16, 1)],
  term (4 : Rat) [(12, 2), (14, 2), (16, 1)],
  term (-2 : Rat) [(12, 2), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 223 for generator 5. -/
theorem rs_R011_ueqv_R011YYY_partial_05_0223_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_05_0223
        rs_R011_ueqv_R011YYY_generator_05_0200_0232 =
      rs_R011_ueqv_R011YYY_partial_05_0223 := by
  native_decide

/-- Coefficient term 224 from coefficient polynomial 5. -/
def rs_R011_ueqv_R011YYY_coefficient_05_0224 : Poly :=
[
  term ((3338 : Rat) / 1135) [(12, 2), (16, 1)]
]

/-- Partial product 224 for generator 5. -/
def rs_R011_ueqv_R011YYY_partial_05_0224 : Poly :=
[
  term ((-6676 : Rat) / 1135) [(4, 1), (12, 2), (16, 1)],
  term ((3338 : Rat) / 1135) [(4, 2), (12, 2), (16, 1)],
  term ((3338 : Rat) / 1135) [(5, 2), (12, 2), (16, 1)],
  term ((6676 : Rat) / 1135) [(12, 2), (14, 1), (16, 1)],
  term ((-3338 : Rat) / 1135) [(12, 2), (14, 2), (16, 1)],
  term ((-3338 : Rat) / 1135) [(12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 224 for generator 5. -/
theorem rs_R011_ueqv_R011YYY_partial_05_0224_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_05_0224
        rs_R011_ueqv_R011YYY_generator_05_0200_0232 =
      rs_R011_ueqv_R011YYY_partial_05_0224 := by
  native_decide

/-- Coefficient term 225 from coefficient polynomial 5. -/
def rs_R011_ueqv_R011YYY_coefficient_05_0225 : Poly :=
[
  term ((-1987 : Rat) / 227) [(13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 225 for generator 5. -/
def rs_R011_ueqv_R011YYY_partial_05_0225 : Poly :=
[
  term ((3974 : Rat) / 227) [(4, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1987 : Rat) / 227) [(4, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1987 : Rat) / 227) [(5, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1987 : Rat) / 227) [(13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-3974 : Rat) / 227) [(13, 1), (14, 2), (15, 1), (16, 1)],
  term ((1987 : Rat) / 227) [(13, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 225 for generator 5. -/
theorem rs_R011_ueqv_R011YYY_partial_05_0225_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_05_0225
        rs_R011_ueqv_R011YYY_generator_05_0200_0232 =
      rs_R011_ueqv_R011YYY_partial_05_0225 := by
  native_decide

/-- Coefficient term 226 from coefficient polynomial 5. -/
def rs_R011_ueqv_R011YYY_coefficient_05_0226 : Poly :=
[
  term ((6296 : Rat) / 1135) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 226 for generator 5. -/
def rs_R011_ueqv_R011YYY_partial_05_0226 : Poly :=
[
  term ((-12592 : Rat) / 1135) [(4, 1), (13, 1), (15, 1), (16, 1)],
  term ((6296 : Rat) / 1135) [(4, 2), (13, 1), (15, 1), (16, 1)],
  term ((6296 : Rat) / 1135) [(5, 2), (13, 1), (15, 1), (16, 1)],
  term ((12592 : Rat) / 1135) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6296 : Rat) / 1135) [(13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-6296 : Rat) / 1135) [(13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 226 for generator 5. -/
theorem rs_R011_ueqv_R011YYY_partial_05_0226_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_05_0226
        rs_R011_ueqv_R011YYY_generator_05_0200_0232 =
      rs_R011_ueqv_R011YYY_partial_05_0226 := by
  native_decide

/-- Coefficient term 227 from coefficient polynomial 5. -/
def rs_R011_ueqv_R011YYY_coefficient_05_0227 : Poly :=
[
  term (8 : Rat) [(13, 2), (14, 1), (16, 1)]
]

/-- Partial product 227 for generator 5. -/
def rs_R011_ueqv_R011YYY_partial_05_0227 : Poly :=
[
  term (-16 : Rat) [(4, 1), (13, 2), (14, 1), (16, 1)],
  term (8 : Rat) [(4, 2), (13, 2), (14, 1), (16, 1)],
  term (8 : Rat) [(5, 2), (13, 2), (14, 1), (16, 1)],
  term (-8 : Rat) [(13, 2), (14, 1), (15, 2), (16, 1)],
  term (16 : Rat) [(13, 2), (14, 2), (16, 1)],
  term (-8 : Rat) [(13, 2), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 227 for generator 5. -/
theorem rs_R011_ueqv_R011YYY_partial_05_0227_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_05_0227
        rs_R011_ueqv_R011YYY_generator_05_0200_0232 =
      rs_R011_ueqv_R011YYY_partial_05_0227 := by
  native_decide

/-- Coefficient term 228 from coefficient polynomial 5. -/
def rs_R011_ueqv_R011YYY_coefficient_05_0228 : Poly :=
[
  term ((-29257 : Rat) / 1135) [(13, 2), (16, 1)]
]

/-- Partial product 228 for generator 5. -/
def rs_R011_ueqv_R011YYY_partial_05_0228 : Poly :=
[
  term ((58514 : Rat) / 1135) [(4, 1), (13, 2), (16, 1)],
  term ((-29257 : Rat) / 1135) [(4, 2), (13, 2), (16, 1)],
  term ((-29257 : Rat) / 1135) [(5, 2), (13, 2), (16, 1)],
  term ((-58514 : Rat) / 1135) [(13, 2), (14, 1), (16, 1)],
  term ((29257 : Rat) / 1135) [(13, 2), (14, 2), (16, 1)],
  term ((29257 : Rat) / 1135) [(13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 228 for generator 5. -/
theorem rs_R011_ueqv_R011YYY_partial_05_0228_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_05_0228
        rs_R011_ueqv_R011YYY_generator_05_0200_0232 =
      rs_R011_ueqv_R011YYY_partial_05_0228 := by
  native_decide

/-- Coefficient term 229 from coefficient polynomial 5. -/
def rs_R011_ueqv_R011YYY_coefficient_05_0229 : Poly :=
[
  term ((-398 : Rat) / 1135) [(14, 1), (16, 1)]
]

/-- Partial product 229 for generator 5. -/
def rs_R011_ueqv_R011YYY_partial_05_0229 : Poly :=
[
  term ((796 : Rat) / 1135) [(4, 1), (14, 1), (16, 1)],
  term ((-398 : Rat) / 1135) [(4, 2), (14, 1), (16, 1)],
  term ((-398 : Rat) / 1135) [(5, 2), (14, 1), (16, 1)],
  term ((398 : Rat) / 1135) [(14, 1), (15, 2), (16, 1)],
  term ((-796 : Rat) / 1135) [(14, 2), (16, 1)],
  term ((398 : Rat) / 1135) [(14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 229 for generator 5. -/
theorem rs_R011_ueqv_R011YYY_partial_05_0229_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_05_0229
        rs_R011_ueqv_R011YYY_generator_05_0200_0232 =
      rs_R011_ueqv_R011YYY_partial_05_0229 := by
  native_decide

/-- Coefficient term 230 from coefficient polynomial 5. -/
def rs_R011_ueqv_R011YYY_coefficient_05_0230 : Poly :=
[
  term ((5609 : Rat) / 1135) [(14, 2), (16, 1)]
]

/-- Partial product 230 for generator 5. -/
def rs_R011_ueqv_R011YYY_partial_05_0230 : Poly :=
[
  term ((-11218 : Rat) / 1135) [(4, 1), (14, 2), (16, 1)],
  term ((5609 : Rat) / 1135) [(4, 2), (14, 2), (16, 1)],
  term ((5609 : Rat) / 1135) [(5, 2), (14, 2), (16, 1)],
  term ((-5609 : Rat) / 1135) [(14, 2), (15, 2), (16, 1)],
  term ((11218 : Rat) / 1135) [(14, 3), (16, 1)],
  term ((-5609 : Rat) / 1135) [(14, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 230 for generator 5. -/
theorem rs_R011_ueqv_R011YYY_partial_05_0230_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_05_0230
        rs_R011_ueqv_R011YYY_generator_05_0200_0232 =
      rs_R011_ueqv_R011YYY_partial_05_0230 := by
  native_decide

/-- Coefficient term 231 from coefficient polynomial 5. -/
def rs_R011_ueqv_R011YYY_coefficient_05_0231 : Poly :=
[
  term ((3959 : Rat) / 1135) [(15, 2), (16, 1)]
]

/-- Partial product 231 for generator 5. -/
def rs_R011_ueqv_R011YYY_partial_05_0231 : Poly :=
[
  term ((-7918 : Rat) / 1135) [(4, 1), (15, 2), (16, 1)],
  term ((3959 : Rat) / 1135) [(4, 2), (15, 2), (16, 1)],
  term ((3959 : Rat) / 1135) [(5, 2), (15, 2), (16, 1)],
  term ((7918 : Rat) / 1135) [(14, 1), (15, 2), (16, 1)],
  term ((-3959 : Rat) / 1135) [(14, 2), (15, 2), (16, 1)],
  term ((-3959 : Rat) / 1135) [(15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 231 for generator 5. -/
theorem rs_R011_ueqv_R011YYY_partial_05_0231_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_05_0231
        rs_R011_ueqv_R011YYY_generator_05_0200_0232 =
      rs_R011_ueqv_R011YYY_partial_05_0231 := by
  native_decide

/-- Coefficient term 232 from coefficient polynomial 5. -/
def rs_R011_ueqv_R011YYY_coefficient_05_0232 : Poly :=
[
  term ((-1436 : Rat) / 227) [(16, 1)]
]

/-- Partial product 232 for generator 5. -/
def rs_R011_ueqv_R011YYY_partial_05_0232 : Poly :=
[
  term ((2872 : Rat) / 227) [(4, 1), (16, 1)],
  term ((-1436 : Rat) / 227) [(4, 2), (16, 1)],
  term ((-1436 : Rat) / 227) [(5, 2), (16, 1)],
  term ((-2872 : Rat) / 227) [(14, 1), (16, 1)],
  term ((1436 : Rat) / 227) [(14, 2), (16, 1)],
  term ((1436 : Rat) / 227) [(15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 232 for generator 5. -/
theorem rs_R011_ueqv_R011YYY_partial_05_0232_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_05_0232
        rs_R011_ueqv_R011YYY_generator_05_0200_0232 =
      rs_R011_ueqv_R011YYY_partial_05_0232 := by
  native_decide

/-- Partial products in this block. -/
def rs_R011_ueqv_R011YYY_partials_05_0200_0232 : List Poly :=
[
  rs_R011_ueqv_R011YYY_partial_05_0200,
  rs_R011_ueqv_R011YYY_partial_05_0201,
  rs_R011_ueqv_R011YYY_partial_05_0202,
  rs_R011_ueqv_R011YYY_partial_05_0203,
  rs_R011_ueqv_R011YYY_partial_05_0204,
  rs_R011_ueqv_R011YYY_partial_05_0205,
  rs_R011_ueqv_R011YYY_partial_05_0206,
  rs_R011_ueqv_R011YYY_partial_05_0207,
  rs_R011_ueqv_R011YYY_partial_05_0208,
  rs_R011_ueqv_R011YYY_partial_05_0209,
  rs_R011_ueqv_R011YYY_partial_05_0210,
  rs_R011_ueqv_R011YYY_partial_05_0211,
  rs_R011_ueqv_R011YYY_partial_05_0212,
  rs_R011_ueqv_R011YYY_partial_05_0213,
  rs_R011_ueqv_R011YYY_partial_05_0214,
  rs_R011_ueqv_R011YYY_partial_05_0215,
  rs_R011_ueqv_R011YYY_partial_05_0216,
  rs_R011_ueqv_R011YYY_partial_05_0217,
  rs_R011_ueqv_R011YYY_partial_05_0218,
  rs_R011_ueqv_R011YYY_partial_05_0219,
  rs_R011_ueqv_R011YYY_partial_05_0220,
  rs_R011_ueqv_R011YYY_partial_05_0221,
  rs_R011_ueqv_R011YYY_partial_05_0222,
  rs_R011_ueqv_R011YYY_partial_05_0223,
  rs_R011_ueqv_R011YYY_partial_05_0224,
  rs_R011_ueqv_R011YYY_partial_05_0225,
  rs_R011_ueqv_R011YYY_partial_05_0226,
  rs_R011_ueqv_R011YYY_partial_05_0227,
  rs_R011_ueqv_R011YYY_partial_05_0228,
  rs_R011_ueqv_R011YYY_partial_05_0229,
  rs_R011_ueqv_R011YYY_partial_05_0230,
  rs_R011_ueqv_R011YYY_partial_05_0231,
  rs_R011_ueqv_R011YYY_partial_05_0232
]

/-- Sum of partial products in this block. -/
def rs_R011_ueqv_R011YYY_block_05_0200_0232 : Poly :=
[
  term ((-96 : Rat) / 227) [(4, 1), (10, 1), (14, 2), (16, 1)],
  term ((2168 : Rat) / 1135) [(4, 1), (10, 1), (15, 2), (16, 1)],
  term ((-46199 : Rat) / 1135) [(4, 1), (10, 1), (16, 1)],
  term ((14368 : Rat) / 1135) [(4, 1), (10, 2), (16, 1)],
  term (32 : Rat) [(4, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term (-32 : Rat) [(4, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term (-8 : Rat) [(4, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((684 : Rat) / 227) [(4, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-8856 : Rat) / 227) [(4, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-15097 : Rat) / 227) [(4, 1), (11, 1), (13, 1), (16, 1)],
  term (8 : Rat) [(4, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term (-32 : Rat) [(4, 1), (11, 1), (13, 3), (16, 1)],
  term ((-2648 : Rat) / 1135) [(4, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-7984 : Rat) / 3405) [(4, 1), (11, 1), (15, 1), (16, 1)],
  term ((544 : Rat) / 681) [(4, 1), (11, 2), (14, 1), (16, 1)],
  term ((-14448 : Rat) / 1135) [(4, 1), (11, 2), (16, 1)],
  term (32 : Rat) [(4, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term (112 : Rat) [(4, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term (-76 : Rat) [(4, 1), (12, 1), (13, 2), (16, 1)],
  term ((3873 : Rat) / 1135) [(4, 1), (12, 1), (14, 1), (16, 1)],
  term ((-3974 : Rat) / 227) [(4, 1), (12, 1), (15, 2), (16, 1)],
  term ((15713 : Rat) / 1135) [(4, 1), (12, 1), (16, 1)],
  term (-112 : Rat) [(4, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(4, 1), (12, 2), (14, 1), (16, 1)],
  term ((-6676 : Rat) / 1135) [(4, 1), (12, 2), (16, 1)],
  term ((3974 : Rat) / 227) [(4, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-12592 : Rat) / 1135) [(4, 1), (13, 1), (15, 1), (16, 1)],
  term (-16 : Rat) [(4, 1), (13, 2), (14, 1), (16, 1)],
  term ((58514 : Rat) / 1135) [(4, 1), (13, 2), (16, 1)],
  term ((796 : Rat) / 1135) [(4, 1), (14, 1), (16, 1)],
  term ((-11218 : Rat) / 1135) [(4, 1), (14, 2), (16, 1)],
  term ((-7918 : Rat) / 1135) [(4, 1), (15, 2), (16, 1)],
  term ((2872 : Rat) / 227) [(4, 1), (16, 1)],
  term ((48 : Rat) / 227) [(4, 2), (10, 1), (14, 2), (16, 1)],
  term ((-1084 : Rat) / 1135) [(4, 2), (10, 1), (15, 2), (16, 1)],
  term ((46199 : Rat) / 2270) [(4, 2), (10, 1), (16, 1)],
  term ((-7184 : Rat) / 1135) [(4, 2), (10, 2), (16, 1)],
  term (-16 : Rat) [(4, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term (16 : Rat) [(4, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term (4 : Rat) [(4, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-342 : Rat) / 227) [(4, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((4428 : Rat) / 227) [(4, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((15097 : Rat) / 454) [(4, 2), (11, 1), (13, 1), (16, 1)],
  term (-4 : Rat) [(4, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term (16 : Rat) [(4, 2), (11, 1), (13, 3), (16, 1)],
  term ((1324 : Rat) / 1135) [(4, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((3992 : Rat) / 3405) [(4, 2), (11, 1), (15, 1), (16, 1)],
  term ((-272 : Rat) / 681) [(4, 2), (11, 2), (14, 1), (16, 1)],
  term ((7224 : Rat) / 1135) [(4, 2), (11, 2), (16, 1)],
  term (-16 : Rat) [(4, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term (-56 : Rat) [(4, 2), (12, 1), (13, 2), (14, 1), (16, 1)],
  term (38 : Rat) [(4, 2), (12, 1), (13, 2), (16, 1)],
  term ((-3873 : Rat) / 2270) [(4, 2), (12, 1), (14, 1), (16, 1)],
  term ((1987 : Rat) / 227) [(4, 2), (12, 1), (15, 2), (16, 1)],
  term ((-15713 : Rat) / 2270) [(4, 2), (12, 1), (16, 1)],
  term (56 : Rat) [(4, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term (2 : Rat) [(4, 2), (12, 2), (14, 1), (16, 1)],
  term ((3338 : Rat) / 1135) [(4, 2), (12, 2), (16, 1)],
  term ((-1987 : Rat) / 227) [(4, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((6296 : Rat) / 1135) [(4, 2), (13, 1), (15, 1), (16, 1)],
  term (8 : Rat) [(4, 2), (13, 2), (14, 1), (16, 1)],
  term ((-29257 : Rat) / 1135) [(4, 2), (13, 2), (16, 1)],
  term ((-398 : Rat) / 1135) [(4, 2), (14, 1), (16, 1)],
  term ((5609 : Rat) / 1135) [(4, 2), (14, 2), (16, 1)],
  term ((3959 : Rat) / 1135) [(4, 2), (15, 2), (16, 1)],
  term ((-1436 : Rat) / 227) [(4, 2), (16, 1)],
  term ((48 : Rat) / 227) [(5, 2), (10, 1), (14, 2), (16, 1)],
  term ((-1084 : Rat) / 1135) [(5, 2), (10, 1), (15, 2), (16, 1)],
  term ((46199 : Rat) / 2270) [(5, 2), (10, 1), (16, 1)],
  term ((-7184 : Rat) / 1135) [(5, 2), (10, 2), (16, 1)],
  term (-16 : Rat) [(5, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term (16 : Rat) [(5, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term (4 : Rat) [(5, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-342 : Rat) / 227) [(5, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((4428 : Rat) / 227) [(5, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((15097 : Rat) / 454) [(5, 2), (11, 1), (13, 1), (16, 1)],
  term (-4 : Rat) [(5, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term (16 : Rat) [(5, 2), (11, 1), (13, 3), (16, 1)],
  term ((1324 : Rat) / 1135) [(5, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((3992 : Rat) / 3405) [(5, 2), (11, 1), (15, 1), (16, 1)],
  term ((-272 : Rat) / 681) [(5, 2), (11, 2), (14, 1), (16, 1)],
  term ((7224 : Rat) / 1135) [(5, 2), (11, 2), (16, 1)],
  term (-16 : Rat) [(5, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term (-56 : Rat) [(5, 2), (12, 1), (13, 2), (14, 1), (16, 1)],
  term (38 : Rat) [(5, 2), (12, 1), (13, 2), (16, 1)],
  term ((-3873 : Rat) / 2270) [(5, 2), (12, 1), (14, 1), (16, 1)],
  term ((1987 : Rat) / 227) [(5, 2), (12, 1), (15, 2), (16, 1)],
  term ((-15713 : Rat) / 2270) [(5, 2), (12, 1), (16, 1)],
  term (56 : Rat) [(5, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term (2 : Rat) [(5, 2), (12, 2), (14, 1), (16, 1)],
  term ((3338 : Rat) / 1135) [(5, 2), (12, 2), (16, 1)],
  term ((-1987 : Rat) / 227) [(5, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((6296 : Rat) / 1135) [(5, 2), (13, 1), (15, 1), (16, 1)],
  term (8 : Rat) [(5, 2), (13, 2), (14, 1), (16, 1)],
  term ((-29257 : Rat) / 1135) [(5, 2), (13, 2), (16, 1)],
  term ((-398 : Rat) / 1135) [(5, 2), (14, 1), (16, 1)],
  term ((5609 : Rat) / 1135) [(5, 2), (14, 2), (16, 1)],
  term ((3959 : Rat) / 1135) [(5, 2), (15, 2), (16, 1)],
  term ((-1436 : Rat) / 227) [(5, 2), (16, 1)],
  term ((-2168 : Rat) / 1135) [(10, 1), (14, 1), (15, 2), (16, 1)],
  term ((46199 : Rat) / 1135) [(10, 1), (14, 1), (16, 1)],
  term ((844 : Rat) / 1135) [(10, 1), (14, 2), (15, 2), (16, 1)],
  term ((-46199 : Rat) / 2270) [(10, 1), (14, 2), (16, 1)],
  term ((96 : Rat) / 227) [(10, 1), (14, 3), (16, 1)],
  term ((-48 : Rat) / 227) [(10, 1), (14, 4), (16, 1)],
  term ((-46199 : Rat) / 2270) [(10, 1), (15, 2), (16, 1)],
  term ((1084 : Rat) / 1135) [(10, 1), (15, 4), (16, 1)],
  term ((-14368 : Rat) / 1135) [(10, 2), (14, 1), (16, 1)],
  term ((7184 : Rat) / 1135) [(10, 2), (14, 2), (16, 1)],
  term ((7184 : Rat) / 1135) [(10, 2), (15, 2), (16, 1)],
  term (16 : Rat) [(11, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term (32 : Rat) [(11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term (-48 : Rat) [(11, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term (16 : Rat) [(11, 1), (12, 1), (13, 1), (14, 3), (16, 1)],
  term (-16 : Rat) [(11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-684 : Rat) / 227) [(11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(11, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((2158 : Rat) / 227) [(11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term (-4 : Rat) [(11, 1), (12, 1), (14, 3), (15, 1), (16, 1)],
  term ((342 : Rat) / 227) [(11, 1), (12, 1), (15, 3), (16, 1)],
  term ((-4428 : Rat) / 227) [(11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((15097 : Rat) / 227) [(11, 1), (13, 1), (14, 1), (16, 1)],
  term ((2615 : Rat) / 454) [(11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-4428 : Rat) / 227) [(11, 1), (13, 1), (14, 3), (16, 1)],
  term ((-15097 : Rat) / 454) [(11, 1), (13, 1), (15, 2), (16, 1)],
  term (-8 : Rat) [(11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(11, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term (4 : Rat) [(11, 1), (13, 2), (15, 3), (16, 1)],
  term (32 : Rat) [(11, 1), (13, 3), (14, 1), (16, 1)],
  term (-16 : Rat) [(11, 1), (13, 3), (14, 2), (16, 1)],
  term (-16 : Rat) [(11, 1), (13, 3), (15, 2), (16, 1)],
  term ((7984 : Rat) / 3405) [(11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1324 : Rat) / 1135) [(11, 1), (14, 1), (15, 3), (16, 1)],
  term ((3952 : Rat) / 3405) [(11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1324 : Rat) / 1135) [(11, 1), (14, 3), (15, 1), (16, 1)],
  term ((-3992 : Rat) / 3405) [(11, 1), (15, 3), (16, 1)],
  term ((272 : Rat) / 681) [(11, 2), (14, 1), (15, 2), (16, 1)],
  term ((14448 : Rat) / 1135) [(11, 2), (14, 1), (16, 1)],
  term ((-24392 : Rat) / 3405) [(11, 2), (14, 2), (16, 1)],
  term ((272 : Rat) / 681) [(11, 2), (14, 3), (16, 1)],
  term ((-7224 : Rat) / 1135) [(11, 2), (15, 2), (16, 1)],
  term (-32 : Rat) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term (16 : Rat) [(12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term (16 : Rat) [(12, 1), (13, 1), (15, 3), (16, 1)],
  term (56 : Rat) [(12, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term (76 : Rat) [(12, 1), (13, 2), (14, 1), (16, 1)],
  term (-150 : Rat) [(12, 1), (13, 2), (14, 2), (16, 1)],
  term (56 : Rat) [(12, 1), (13, 2), (14, 3), (16, 1)],
  term (-38 : Rat) [(12, 1), (13, 2), (15, 2), (16, 1)],
  term ((43613 : Rat) / 2270) [(12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-15713 : Rat) / 1135) [(12, 1), (14, 1), (16, 1)],
  term ((-1987 : Rat) / 227) [(12, 1), (14, 2), (15, 2), (16, 1)],
  term ((7967 : Rat) / 2270) [(12, 1), (14, 2), (16, 1)],
  term ((3873 : Rat) / 2270) [(12, 1), (14, 3), (16, 1)],
  term ((15713 : Rat) / 2270) [(12, 1), (15, 2), (16, 1)],
  term ((-1987 : Rat) / 227) [(12, 1), (15, 4), (16, 1)],
  term (112 : Rat) [(12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term (-56 : Rat) [(12, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term (-56 : Rat) [(12, 2), (13, 1), (15, 3), (16, 1)],
  term (-2 : Rat) [(12, 2), (14, 1), (15, 2), (16, 1)],
  term ((6676 : Rat) / 1135) [(12, 2), (14, 1), (16, 1)],
  term ((1202 : Rat) / 1135) [(12, 2), (14, 2), (16, 1)],
  term (-2 : Rat) [(12, 2), (14, 3), (16, 1)],
  term ((-3338 : Rat) / 1135) [(12, 2), (15, 2), (16, 1)],
  term ((12592 : Rat) / 1135) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1987 : Rat) / 227) [(13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-26166 : Rat) / 1135) [(13, 1), (14, 2), (15, 1), (16, 1)],
  term ((1987 : Rat) / 227) [(13, 1), (14, 3), (15, 1), (16, 1)],
  term ((-6296 : Rat) / 1135) [(13, 1), (15, 3), (16, 1)],
  term (-8 : Rat) [(13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-58514 : Rat) / 1135) [(13, 2), (14, 1), (16, 1)],
  term ((47417 : Rat) / 1135) [(13, 2), (14, 2), (16, 1)],
  term (-8 : Rat) [(13, 2), (14, 3), (16, 1)],
  term ((29257 : Rat) / 1135) [(13, 2), (15, 2), (16, 1)],
  term ((8316 : Rat) / 1135) [(14, 1), (15, 2), (16, 1)],
  term ((-2872 : Rat) / 227) [(14, 1), (16, 1)],
  term ((-9568 : Rat) / 1135) [(14, 2), (15, 2), (16, 1)],
  term ((6384 : Rat) / 1135) [(14, 2), (16, 1)],
  term ((11616 : Rat) / 1135) [(14, 3), (16, 1)],
  term ((-5609 : Rat) / 1135) [(14, 4), (16, 1)],
  term ((1436 : Rat) / 227) [(15, 2), (16, 1)],
  term ((-3959 : Rat) / 1135) [(15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 5, terms 200 through 232. -/
theorem rs_R011_ueqv_R011YYY_block_05_0200_0232_valid :
    checkProductSumEq rs_R011_ueqv_R011YYY_partials_05_0200_0232
      rs_R011_ueqv_R011YYY_block_05_0200_0232 = true := by
  native_decide

end R011UeqvR011YYYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
