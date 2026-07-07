/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R011:u=v:R011YYY, term block 4:200-226

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R011UeqvR011YYYTermShards

/-- Generator polynomial 4 for relaxed split surplus certificate `R011:u=v:R011YYY`. -/
def rs_R011_ueqv_R011YYY_generator_04_0200_0226 : Poly :=
[
  term (-2 : Rat) [(4, 1)],
  term (1 : Rat) [(4, 2)],
  term (1 : Rat) [(5, 2)],
  term (2 : Rat) [(12, 1)],
  term (-1 : Rat) [(12, 2)],
  term (-1 : Rat) [(13, 2)]
]

/-- Coefficient term 200 from coefficient polynomial 4. -/
def rs_R011_ueqv_R011YYY_coefficient_04_0200 : Poly :=
[
  term ((-4428 : Rat) / 227) [(11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 200 for generator 4. -/
def rs_R011_ueqv_R011YYY_partial_04_0200 : Poly :=
[
  term ((8856 : Rat) / 227) [(4, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-4428 : Rat) / 227) [(4, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-4428 : Rat) / 227) [(5, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-8856 : Rat) / 227) [(11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((4428 : Rat) / 227) [(11, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((4428 : Rat) / 227) [(11, 1), (13, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 200 for generator 4. -/
theorem rs_R011_ueqv_R011YYY_partial_04_0200_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_04_0200
        rs_R011_ueqv_R011YYY_generator_04_0200_0226 =
      rs_R011_ueqv_R011YYY_partial_04_0200 := by
  native_decide

/-- Coefficient term 201 from coefficient polynomial 4. -/
def rs_R011_ueqv_R011YYY_coefficient_04_0201 : Poly :=
[
  term ((-11011 : Rat) / 454) [(11, 1), (13, 1), (16, 1)]
]

/-- Partial product 201 for generator 4. -/
def rs_R011_ueqv_R011YYY_partial_04_0201 : Poly :=
[
  term ((11011 : Rat) / 227) [(4, 1), (11, 1), (13, 1), (16, 1)],
  term ((-11011 : Rat) / 454) [(4, 2), (11, 1), (13, 1), (16, 1)],
  term ((-11011 : Rat) / 454) [(5, 2), (11, 1), (13, 1), (16, 1)],
  term ((-11011 : Rat) / 227) [(11, 1), (12, 1), (13, 1), (16, 1)],
  term ((11011 : Rat) / 454) [(11, 1), (12, 2), (13, 1), (16, 1)],
  term ((11011 : Rat) / 454) [(11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 201 for generator 4. -/
theorem rs_R011_ueqv_R011YYY_partial_04_0201_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_04_0201
        rs_R011_ueqv_R011YYY_generator_04_0200_0226 =
      rs_R011_ueqv_R011YYY_partial_04_0201 := by
  native_decide

/-- Coefficient term 202 from coefficient polynomial 4. -/
def rs_R011_ueqv_R011YYY_coefficient_04_0202 : Poly :=
[
  term (4 : Rat) [(11, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 202 for generator 4. -/
def rs_R011_ueqv_R011YYY_partial_04_0202 : Poly :=
[
  term (-8 : Rat) [(4, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term (4 : Rat) [(4, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term (4 : Rat) [(5, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term (8 : Rat) [(11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term (-4 : Rat) [(11, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term (-4 : Rat) [(11, 1), (13, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 202 for generator 4. -/
theorem rs_R011_ueqv_R011YYY_partial_04_0202_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_04_0202
        rs_R011_ueqv_R011YYY_generator_04_0200_0226 =
      rs_R011_ueqv_R011YYY_partial_04_0202 := by
  native_decide

/-- Coefficient term 203 from coefficient polynomial 4. -/
def rs_R011_ueqv_R011YYY_coefficient_04_0203 : Poly :=
[
  term (-16 : Rat) [(11, 1), (13, 3), (16, 1)]
]

/-- Partial product 203 for generator 4. -/
def rs_R011_ueqv_R011YYY_partial_04_0203 : Poly :=
[
  term (32 : Rat) [(4, 1), (11, 1), (13, 3), (16, 1)],
  term (-16 : Rat) [(4, 2), (11, 1), (13, 3), (16, 1)],
  term (-16 : Rat) [(5, 2), (11, 1), (13, 3), (16, 1)],
  term (-32 : Rat) [(11, 1), (12, 1), (13, 3), (16, 1)],
  term (16 : Rat) [(11, 1), (12, 2), (13, 3), (16, 1)],
  term (16 : Rat) [(11, 1), (13, 5), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 203 for generator 4. -/
theorem rs_R011_ueqv_R011YYY_partial_04_0203_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_04_0203
        rs_R011_ueqv_R011YYY_generator_04_0200_0226 =
      rs_R011_ueqv_R011YYY_partial_04_0203 := by
  native_decide

/-- Coefficient term 204 from coefficient polynomial 4. -/
def rs_R011_ueqv_R011YYY_coefficient_04_0204 : Poly :=
[
  term ((-1324 : Rat) / 1135) [(11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 204 for generator 4. -/
def rs_R011_ueqv_R011YYY_partial_04_0204 : Poly :=
[
  term ((2648 : Rat) / 1135) [(4, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1324 : Rat) / 1135) [(4, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1324 : Rat) / 1135) [(5, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2648 : Rat) / 1135) [(11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((1324 : Rat) / 1135) [(11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((1324 : Rat) / 1135) [(11, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 204 for generator 4. -/
theorem rs_R011_ueqv_R011YYY_partial_04_0204_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_04_0204
        rs_R011_ueqv_R011YYY_generator_04_0200_0226 =
      rs_R011_ueqv_R011YYY_partial_04_0204 := by
  native_decide

/-- Coefficient term 205 from coefficient polynomial 4. -/
def rs_R011_ueqv_R011YYY_coefficient_04_0205 : Poly :=
[
  term ((48292 : Rat) / 3405) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 205 for generator 4. -/
def rs_R011_ueqv_R011YYY_partial_04_0205 : Poly :=
[
  term ((-96584 : Rat) / 3405) [(4, 1), (11, 1), (15, 1), (16, 1)],
  term ((48292 : Rat) / 3405) [(4, 2), (11, 1), (15, 1), (16, 1)],
  term ((48292 : Rat) / 3405) [(5, 2), (11, 1), (15, 1), (16, 1)],
  term ((96584 : Rat) / 3405) [(11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-48292 : Rat) / 3405) [(11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-48292 : Rat) / 3405) [(11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 205 for generator 4. -/
theorem rs_R011_ueqv_R011YYY_partial_04_0205_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_04_0205
        rs_R011_ueqv_R011YYY_generator_04_0200_0226 =
      rs_R011_ueqv_R011YYY_partial_04_0205 := by
  native_decide

/-- Coefficient term 206 from coefficient polynomial 4. -/
def rs_R011_ueqv_R011YYY_coefficient_04_0206 : Poly :=
[
  term ((272 : Rat) / 681) [(11, 2), (14, 1), (16, 1)]
]

/-- Partial product 206 for generator 4. -/
def rs_R011_ueqv_R011YYY_partial_04_0206 : Poly :=
[
  term ((-544 : Rat) / 681) [(4, 1), (11, 2), (14, 1), (16, 1)],
  term ((272 : Rat) / 681) [(4, 2), (11, 2), (14, 1), (16, 1)],
  term ((272 : Rat) / 681) [(5, 2), (11, 2), (14, 1), (16, 1)],
  term ((544 : Rat) / 681) [(11, 2), (12, 1), (14, 1), (16, 1)],
  term ((-272 : Rat) / 681) [(11, 2), (12, 2), (14, 1), (16, 1)],
  term ((-272 : Rat) / 681) [(11, 2), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 206 for generator 4. -/
theorem rs_R011_ueqv_R011YYY_partial_04_0206_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_04_0206
        rs_R011_ueqv_R011YYY_generator_04_0200_0226 =
      rs_R011_ueqv_R011YYY_partial_04_0206 := by
  native_decide

/-- Coefficient term 207 from coefficient polynomial 4. -/
def rs_R011_ueqv_R011YYY_coefficient_04_0207 : Poly :=
[
  term ((-21352 : Rat) / 3405) [(11, 2), (16, 1)]
]

/-- Partial product 207 for generator 4. -/
def rs_R011_ueqv_R011YYY_partial_04_0207 : Poly :=
[
  term ((42704 : Rat) / 3405) [(4, 1), (11, 2), (16, 1)],
  term ((-21352 : Rat) / 3405) [(4, 2), (11, 2), (16, 1)],
  term ((-21352 : Rat) / 3405) [(5, 2), (11, 2), (16, 1)],
  term ((-42704 : Rat) / 3405) [(11, 2), (12, 1), (16, 1)],
  term ((21352 : Rat) / 3405) [(11, 2), (12, 2), (16, 1)],
  term ((21352 : Rat) / 3405) [(11, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 207 for generator 4. -/
theorem rs_R011_ueqv_R011YYY_partial_04_0207_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_04_0207
        rs_R011_ueqv_R011YYY_generator_04_0200_0226 =
      rs_R011_ueqv_R011YYY_partial_04_0207 := by
  native_decide

/-- Coefficient term 208 from coefficient polynomial 4. -/
def rs_R011_ueqv_R011YYY_coefficient_04_0208 : Poly :=
[
  term (12 : Rat) [(12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 208 for generator 4. -/
def rs_R011_ueqv_R011YYY_partial_04_0208 : Poly :=
[
  term (-24 : Rat) [(4, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(4, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(5, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(12, 1), (13, 3), (15, 1), (16, 1)],
  term (24 : Rat) [(12, 2), (13, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(12, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 208 for generator 4. -/
theorem rs_R011_ueqv_R011YYY_partial_04_0208_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_04_0208
        rs_R011_ueqv_R011YYY_generator_04_0200_0226 =
      rs_R011_ueqv_R011YYY_partial_04_0208 := by
  native_decide

/-- Coefficient term 209 from coefficient polynomial 4. -/
def rs_R011_ueqv_R011YYY_coefficient_04_0209 : Poly :=
[
  term (56 : Rat) [(12, 1), (13, 2), (14, 1), (16, 1)]
]

/-- Partial product 209 for generator 4. -/
def rs_R011_ueqv_R011YYY_partial_04_0209 : Poly :=
[
  term (-112 : Rat) [(4, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term (56 : Rat) [(4, 2), (12, 1), (13, 2), (14, 1), (16, 1)],
  term (56 : Rat) [(5, 2), (12, 1), (13, 2), (14, 1), (16, 1)],
  term (-56 : Rat) [(12, 1), (13, 4), (14, 1), (16, 1)],
  term (112 : Rat) [(12, 2), (13, 2), (14, 1), (16, 1)],
  term (-56 : Rat) [(12, 3), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 209 for generator 4. -/
theorem rs_R011_ueqv_R011YYY_partial_04_0209_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_04_0209
        rs_R011_ueqv_R011YYY_generator_04_0200_0226 =
      rs_R011_ueqv_R011YYY_partial_04_0209 := by
  native_decide

/-- Coefficient term 210 from coefficient polynomial 4. -/
def rs_R011_ueqv_R011YYY_coefficient_04_0210 : Poly :=
[
  term (-42 : Rat) [(12, 1), (13, 2), (16, 1)]
]

/-- Partial product 210 for generator 4. -/
def rs_R011_ueqv_R011YYY_partial_04_0210 : Poly :=
[
  term (84 : Rat) [(4, 1), (12, 1), (13, 2), (16, 1)],
  term (-42 : Rat) [(4, 2), (12, 1), (13, 2), (16, 1)],
  term (-42 : Rat) [(5, 2), (12, 1), (13, 2), (16, 1)],
  term (42 : Rat) [(12, 1), (13, 4), (16, 1)],
  term (-84 : Rat) [(12, 2), (13, 2), (16, 1)],
  term (42 : Rat) [(12, 3), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 210 for generator 4. -/
theorem rs_R011_ueqv_R011YYY_partial_04_0210_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_04_0210
        rs_R011_ueqv_R011YYY_generator_04_0200_0226 =
      rs_R011_ueqv_R011YYY_partial_04_0210 := by
  native_decide

/-- Coefficient term 211 from coefficient polynomial 4. -/
def rs_R011_ueqv_R011YYY_coefficient_04_0211 : Poly :=
[
  term ((-13647 : Rat) / 2270) [(12, 1), (14, 1), (16, 1)]
]

/-- Partial product 211 for generator 4. -/
def rs_R011_ueqv_R011YYY_partial_04_0211 : Poly :=
[
  term ((13647 : Rat) / 1135) [(4, 1), (12, 1), (14, 1), (16, 1)],
  term ((-13647 : Rat) / 2270) [(4, 2), (12, 1), (14, 1), (16, 1)],
  term ((-13647 : Rat) / 2270) [(5, 2), (12, 1), (14, 1), (16, 1)],
  term ((13647 : Rat) / 2270) [(12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-13647 : Rat) / 1135) [(12, 2), (14, 1), (16, 1)],
  term ((13647 : Rat) / 2270) [(12, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 211 for generator 4. -/
theorem rs_R011_ueqv_R011YYY_partial_04_0211_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_04_0211
        rs_R011_ueqv_R011YYY_generator_04_0200_0226 =
      rs_R011_ueqv_R011YYY_partial_04_0211 := by
  native_decide

/-- Coefficient term 212 from coefficient polynomial 4. -/
def rs_R011_ueqv_R011YYY_coefficient_04_0212 : Poly :=
[
  term ((-1987 : Rat) / 227) [(12, 1), (15, 2), (16, 1)]
]

/-- Partial product 212 for generator 4. -/
def rs_R011_ueqv_R011YYY_partial_04_0212 : Poly :=
[
  term ((3974 : Rat) / 227) [(4, 1), (12, 1), (15, 2), (16, 1)],
  term ((-1987 : Rat) / 227) [(4, 2), (12, 1), (15, 2), (16, 1)],
  term ((-1987 : Rat) / 227) [(5, 2), (12, 1), (15, 2), (16, 1)],
  term ((1987 : Rat) / 227) [(12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-3974 : Rat) / 227) [(12, 2), (15, 2), (16, 1)],
  term ((1987 : Rat) / 227) [(12, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 212 for generator 4. -/
theorem rs_R011_ueqv_R011YYY_partial_04_0212_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_04_0212
        rs_R011_ueqv_R011YYY_generator_04_0200_0226 =
      rs_R011_ueqv_R011YYY_partial_04_0212 := by
  native_decide

/-- Coefficient term 213 from coefficient polynomial 4. -/
def rs_R011_ueqv_R011YYY_coefficient_04_0213 : Poly :=
[
  term ((-27631 : Rat) / 2270) [(12, 1), (16, 1)]
]

/-- Partial product 213 for generator 4. -/
def rs_R011_ueqv_R011YYY_partial_04_0213 : Poly :=
[
  term ((27631 : Rat) / 1135) [(4, 1), (12, 1), (16, 1)],
  term ((-27631 : Rat) / 2270) [(4, 2), (12, 1), (16, 1)],
  term ((-27631 : Rat) / 2270) [(5, 2), (12, 1), (16, 1)],
  term ((27631 : Rat) / 2270) [(12, 1), (13, 2), (16, 1)],
  term ((-27631 : Rat) / 1135) [(12, 2), (16, 1)],
  term ((27631 : Rat) / 2270) [(12, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 213 for generator 4. -/
theorem rs_R011_ueqv_R011YYY_partial_04_0213_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_04_0213
        rs_R011_ueqv_R011YYY_generator_04_0200_0226 =
      rs_R011_ueqv_R011YYY_partial_04_0213 := by
  native_decide

/-- Coefficient term 214 from coefficient polynomial 4. -/
def rs_R011_ueqv_R011YYY_coefficient_04_0214 : Poly :=
[
  term (-56 : Rat) [(12, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 214 for generator 4. -/
def rs_R011_ueqv_R011YYY_partial_04_0214 : Poly :=
[
  term (112 : Rat) [(4, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term (-56 : Rat) [(4, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term (-56 : Rat) [(5, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term (56 : Rat) [(12, 2), (13, 3), (15, 1), (16, 1)],
  term (-112 : Rat) [(12, 3), (13, 1), (15, 1), (16, 1)],
  term (56 : Rat) [(12, 4), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 214 for generator 4. -/
theorem rs_R011_ueqv_R011YYY_partial_04_0214_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_04_0214
        rs_R011_ueqv_R011YYY_generator_04_0200_0226 =
      rs_R011_ueqv_R011YYY_partial_04_0214 := by
  native_decide

/-- Coefficient term 215 from coefficient polynomial 4. -/
def rs_R011_ueqv_R011YYY_coefficient_04_0215 : Poly :=
[
  term (-2 : Rat) [(12, 2), (14, 1), (16, 1)]
]

/-- Partial product 215 for generator 4. -/
def rs_R011_ueqv_R011YYY_partial_04_0215 : Poly :=
[
  term (4 : Rat) [(4, 1), (12, 2), (14, 1), (16, 1)],
  term (-2 : Rat) [(4, 2), (12, 2), (14, 1), (16, 1)],
  term (-2 : Rat) [(5, 2), (12, 2), (14, 1), (16, 1)],
  term (2 : Rat) [(12, 2), (13, 2), (14, 1), (16, 1)],
  term (-4 : Rat) [(12, 3), (14, 1), (16, 1)],
  term (2 : Rat) [(12, 4), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 215 for generator 4. -/
theorem rs_R011_ueqv_R011YYY_partial_04_0215_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_04_0215
        rs_R011_ueqv_R011YYY_generator_04_0200_0226 =
      rs_R011_ueqv_R011YYY_partial_04_0215 := by
  native_decide

/-- Coefficient term 216 from coefficient polynomial 4. -/
def rs_R011_ueqv_R011YYY_coefficient_04_0216 : Poly :=
[
  term ((10282 : Rat) / 1135) [(12, 2), (16, 1)]
]

/-- Partial product 216 for generator 4. -/
def rs_R011_ueqv_R011YYY_partial_04_0216 : Poly :=
[
  term ((-20564 : Rat) / 1135) [(4, 1), (12, 2), (16, 1)],
  term ((10282 : Rat) / 1135) [(4, 2), (12, 2), (16, 1)],
  term ((10282 : Rat) / 1135) [(5, 2), (12, 2), (16, 1)],
  term ((-10282 : Rat) / 1135) [(12, 2), (13, 2), (16, 1)],
  term ((20564 : Rat) / 1135) [(12, 3), (16, 1)],
  term ((-10282 : Rat) / 1135) [(12, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 216 for generator 4. -/
theorem rs_R011_ueqv_R011YYY_partial_04_0216_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_04_0216
        rs_R011_ueqv_R011YYY_generator_04_0200_0226 =
      rs_R011_ueqv_R011YYY_partial_04_0216 := by
  native_decide

/-- Coefficient term 217 from coefficient polynomial 4. -/
def rs_R011_ueqv_R011YYY_coefficient_04_0217 : Poly :=
[
  term ((1987 : Rat) / 227) [(13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 217 for generator 4. -/
def rs_R011_ueqv_R011YYY_partial_04_0217 : Poly :=
[
  term ((-3974 : Rat) / 227) [(4, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1987 : Rat) / 227) [(4, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1987 : Rat) / 227) [(5, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((3974 : Rat) / 227) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1987 : Rat) / 227) [(12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1987 : Rat) / 227) [(13, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 217 for generator 4. -/
theorem rs_R011_ueqv_R011YYY_partial_04_0217_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_04_0217
        rs_R011_ueqv_R011YYY_generator_04_0200_0226 =
      rs_R011_ueqv_R011YYY_partial_04_0217 := by
  native_decide

/-- Coefficient term 218 from coefficient polynomial 4. -/
def rs_R011_ueqv_R011YYY_coefficient_04_0218 : Poly :=
[
  term ((42524 : Rat) / 1135) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 218 for generator 4. -/
def rs_R011_ueqv_R011YYY_partial_04_0218 : Poly :=
[
  term ((-85048 : Rat) / 1135) [(4, 1), (13, 1), (15, 1), (16, 1)],
  term ((42524 : Rat) / 1135) [(4, 2), (13, 1), (15, 1), (16, 1)],
  term ((42524 : Rat) / 1135) [(5, 2), (13, 1), (15, 1), (16, 1)],
  term ((85048 : Rat) / 1135) [(12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-42524 : Rat) / 1135) [(12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-42524 : Rat) / 1135) [(13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 218 for generator 4. -/
theorem rs_R011_ueqv_R011YYY_partial_04_0218_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_04_0218
        rs_R011_ueqv_R011YYY_generator_04_0200_0226 =
      rs_R011_ueqv_R011YYY_partial_04_0218 := by
  native_decide

/-- Coefficient term 219 from coefficient polynomial 4. -/
def rs_R011_ueqv_R011YYY_coefficient_04_0219 : Poly :=
[
  term (-8 : Rat) [(13, 2), (14, 1), (16, 1)]
]

/-- Partial product 219 for generator 4. -/
def rs_R011_ueqv_R011YYY_partial_04_0219 : Poly :=
[
  term (16 : Rat) [(4, 1), (13, 2), (14, 1), (16, 1)],
  term (-8 : Rat) [(4, 2), (13, 2), (14, 1), (16, 1)],
  term (-8 : Rat) [(5, 2), (13, 2), (14, 1), (16, 1)],
  term (-16 : Rat) [(12, 1), (13, 2), (14, 1), (16, 1)],
  term (8 : Rat) [(12, 2), (13, 2), (14, 1), (16, 1)],
  term (8 : Rat) [(13, 4), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 219 for generator 4. -/
theorem rs_R011_ueqv_R011YYY_partial_04_0219_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_04_0219
        rs_R011_ueqv_R011YYY_generator_04_0200_0226 =
      rs_R011_ueqv_R011YYY_partial_04_0219 := by
  native_decide

/-- Coefficient term 220 from coefficient polynomial 4. -/
def rs_R011_ueqv_R011YYY_coefficient_04_0220 : Poly :=
[
  term (-8 : Rat) [(13, 2), (15, 2), (16, 1)]
]

/-- Partial product 220 for generator 4. -/
def rs_R011_ueqv_R011YYY_partial_04_0220 : Poly :=
[
  term (16 : Rat) [(4, 1), (13, 2), (15, 2), (16, 1)],
  term (-8 : Rat) [(4, 2), (13, 2), (15, 2), (16, 1)],
  term (-8 : Rat) [(5, 2), (13, 2), (15, 2), (16, 1)],
  term (-16 : Rat) [(12, 1), (13, 2), (15, 2), (16, 1)],
  term (8 : Rat) [(12, 2), (13, 2), (15, 2), (16, 1)],
  term (8 : Rat) [(13, 4), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 220 for generator 4. -/
theorem rs_R011_ueqv_R011YYY_partial_04_0220_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_04_0220
        rs_R011_ueqv_R011YYY_generator_04_0200_0226 =
      rs_R011_ueqv_R011YYY_partial_04_0220 := by
  native_decide

/-- Coefficient term 221 from coefficient polynomial 4. -/
def rs_R011_ueqv_R011YYY_coefficient_04_0221 : Poly :=
[
  term ((38337 : Rat) / 1135) [(13, 2), (16, 1)]
]

/-- Partial product 221 for generator 4. -/
def rs_R011_ueqv_R011YYY_partial_04_0221 : Poly :=
[
  term ((-76674 : Rat) / 1135) [(4, 1), (13, 2), (16, 1)],
  term ((38337 : Rat) / 1135) [(4, 2), (13, 2), (16, 1)],
  term ((38337 : Rat) / 1135) [(5, 2), (13, 2), (16, 1)],
  term ((76674 : Rat) / 1135) [(12, 1), (13, 2), (16, 1)],
  term ((-38337 : Rat) / 1135) [(12, 2), (13, 2), (16, 1)],
  term ((-38337 : Rat) / 1135) [(13, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 221 for generator 4. -/
theorem rs_R011_ueqv_R011YYY_partial_04_0221_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_04_0221
        rs_R011_ueqv_R011YYY_generator_04_0200_0226 =
      rs_R011_ueqv_R011YYY_partial_04_0221 := by
  native_decide

/-- Coefficient term 222 from coefficient polynomial 4. -/
def rs_R011_ueqv_R011YYY_coefficient_04_0222 : Poly :=
[
  term (32 : Rat) [(13, 3), (15, 1), (16, 1)]
]

/-- Partial product 222 for generator 4. -/
def rs_R011_ueqv_R011YYY_partial_04_0222 : Poly :=
[
  term (-64 : Rat) [(4, 1), (13, 3), (15, 1), (16, 1)],
  term (32 : Rat) [(4, 2), (13, 3), (15, 1), (16, 1)],
  term (32 : Rat) [(5, 2), (13, 3), (15, 1), (16, 1)],
  term (64 : Rat) [(12, 1), (13, 3), (15, 1), (16, 1)],
  term (-32 : Rat) [(12, 2), (13, 3), (15, 1), (16, 1)],
  term (-32 : Rat) [(13, 5), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 222 for generator 4. -/
theorem rs_R011_ueqv_R011YYY_partial_04_0222_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_04_0222
        rs_R011_ueqv_R011YYY_generator_04_0200_0226 =
      rs_R011_ueqv_R011YYY_partial_04_0222 := by
  native_decide

/-- Coefficient term 223 from coefficient polynomial 4. -/
def rs_R011_ueqv_R011YYY_coefficient_04_0223 : Poly :=
[
  term ((3498 : Rat) / 227) [(14, 1), (16, 1)]
]

/-- Partial product 223 for generator 4. -/
def rs_R011_ueqv_R011YYY_partial_04_0223 : Poly :=
[
  term ((-6996 : Rat) / 227) [(4, 1), (14, 1), (16, 1)],
  term ((3498 : Rat) / 227) [(4, 2), (14, 1), (16, 1)],
  term ((3498 : Rat) / 227) [(5, 2), (14, 1), (16, 1)],
  term ((6996 : Rat) / 227) [(12, 1), (14, 1), (16, 1)],
  term ((-3498 : Rat) / 227) [(12, 2), (14, 1), (16, 1)],
  term ((-3498 : Rat) / 227) [(13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 223 for generator 4. -/
theorem rs_R011_ueqv_R011YYY_partial_04_0223_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_04_0223
        rs_R011_ueqv_R011YYY_generator_04_0200_0226 =
      rs_R011_ueqv_R011YYY_partial_04_0223 := by
  native_decide

/-- Coefficient term 224 from coefficient polynomial 4. -/
def rs_R011_ueqv_R011YYY_coefficient_04_0224 : Poly :=
[
  term ((-5609 : Rat) / 1135) [(14, 2), (16, 1)]
]

/-- Partial product 224 for generator 4. -/
def rs_R011_ueqv_R011YYY_partial_04_0224 : Poly :=
[
  term ((11218 : Rat) / 1135) [(4, 1), (14, 2), (16, 1)],
  term ((-5609 : Rat) / 1135) [(4, 2), (14, 2), (16, 1)],
  term ((-5609 : Rat) / 1135) [(5, 2), (14, 2), (16, 1)],
  term ((-11218 : Rat) / 1135) [(12, 1), (14, 2), (16, 1)],
  term ((5609 : Rat) / 1135) [(12, 2), (14, 2), (16, 1)],
  term ((5609 : Rat) / 1135) [(13, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 224 for generator 4. -/
theorem rs_R011_ueqv_R011YYY_partial_04_0224_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_04_0224
        rs_R011_ueqv_R011YYY_generator_04_0200_0226 =
      rs_R011_ueqv_R011YYY_partial_04_0224 := by
  native_decide

/-- Coefficient term 225 from coefficient polynomial 4. -/
def rs_R011_ueqv_R011YYY_coefficient_04_0225 : Poly :=
[
  term ((-18352 : Rat) / 1135) [(15, 2), (16, 1)]
]

/-- Partial product 225 for generator 4. -/
def rs_R011_ueqv_R011YYY_partial_04_0225 : Poly :=
[
  term ((36704 : Rat) / 1135) [(4, 1), (15, 2), (16, 1)],
  term ((-18352 : Rat) / 1135) [(4, 2), (15, 2), (16, 1)],
  term ((-18352 : Rat) / 1135) [(5, 2), (15, 2), (16, 1)],
  term ((-36704 : Rat) / 1135) [(12, 1), (15, 2), (16, 1)],
  term ((18352 : Rat) / 1135) [(12, 2), (15, 2), (16, 1)],
  term ((18352 : Rat) / 1135) [(13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 225 for generator 4. -/
theorem rs_R011_ueqv_R011YYY_partial_04_0225_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_04_0225
        rs_R011_ueqv_R011YYY_generator_04_0200_0226 =
      rs_R011_ueqv_R011YYY_partial_04_0225 := by
  native_decide

/-- Coefficient term 226 from coefficient polynomial 4. -/
def rs_R011_ueqv_R011YYY_coefficient_04_0226 : Poly :=
[
  term ((27591 : Rat) / 4540) [(16, 1)]
]

/-- Partial product 226 for generator 4. -/
def rs_R011_ueqv_R011YYY_partial_04_0226 : Poly :=
[
  term ((-27591 : Rat) / 2270) [(4, 1), (16, 1)],
  term ((27591 : Rat) / 4540) [(4, 2), (16, 1)],
  term ((27591 : Rat) / 4540) [(5, 2), (16, 1)],
  term ((27591 : Rat) / 2270) [(12, 1), (16, 1)],
  term ((-27591 : Rat) / 4540) [(12, 2), (16, 1)],
  term ((-27591 : Rat) / 4540) [(13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 226 for generator 4. -/
theorem rs_R011_ueqv_R011YYY_partial_04_0226_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_04_0226
        rs_R011_ueqv_R011YYY_generator_04_0200_0226 =
      rs_R011_ueqv_R011YYY_partial_04_0226 := by
  native_decide

/-- Partial products in this block. -/
def rs_R011_ueqv_R011YYY_partials_04_0200_0226 : List Poly :=
[
  rs_R011_ueqv_R011YYY_partial_04_0200,
  rs_R011_ueqv_R011YYY_partial_04_0201,
  rs_R011_ueqv_R011YYY_partial_04_0202,
  rs_R011_ueqv_R011YYY_partial_04_0203,
  rs_R011_ueqv_R011YYY_partial_04_0204,
  rs_R011_ueqv_R011YYY_partial_04_0205,
  rs_R011_ueqv_R011YYY_partial_04_0206,
  rs_R011_ueqv_R011YYY_partial_04_0207,
  rs_R011_ueqv_R011YYY_partial_04_0208,
  rs_R011_ueqv_R011YYY_partial_04_0209,
  rs_R011_ueqv_R011YYY_partial_04_0210,
  rs_R011_ueqv_R011YYY_partial_04_0211,
  rs_R011_ueqv_R011YYY_partial_04_0212,
  rs_R011_ueqv_R011YYY_partial_04_0213,
  rs_R011_ueqv_R011YYY_partial_04_0214,
  rs_R011_ueqv_R011YYY_partial_04_0215,
  rs_R011_ueqv_R011YYY_partial_04_0216,
  rs_R011_ueqv_R011YYY_partial_04_0217,
  rs_R011_ueqv_R011YYY_partial_04_0218,
  rs_R011_ueqv_R011YYY_partial_04_0219,
  rs_R011_ueqv_R011YYY_partial_04_0220,
  rs_R011_ueqv_R011YYY_partial_04_0221,
  rs_R011_ueqv_R011YYY_partial_04_0222,
  rs_R011_ueqv_R011YYY_partial_04_0223,
  rs_R011_ueqv_R011YYY_partial_04_0224,
  rs_R011_ueqv_R011YYY_partial_04_0225,
  rs_R011_ueqv_R011YYY_partial_04_0226
]

/-- Sum of partial products in this block. -/
def rs_R011_ueqv_R011YYY_block_04_0200_0226 : Poly :=
[
  term ((8856 : Rat) / 227) [(4, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((11011 : Rat) / 227) [(4, 1), (11, 1), (13, 1), (16, 1)],
  term (-8 : Rat) [(4, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term (32 : Rat) [(4, 1), (11, 1), (13, 3), (16, 1)],
  term ((2648 : Rat) / 1135) [(4, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-96584 : Rat) / 3405) [(4, 1), (11, 1), (15, 1), (16, 1)],
  term ((-544 : Rat) / 681) [(4, 1), (11, 2), (14, 1), (16, 1)],
  term ((42704 : Rat) / 3405) [(4, 1), (11, 2), (16, 1)],
  term (-24 : Rat) [(4, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term (-112 : Rat) [(4, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term (84 : Rat) [(4, 1), (12, 1), (13, 2), (16, 1)],
  term ((13647 : Rat) / 1135) [(4, 1), (12, 1), (14, 1), (16, 1)],
  term ((3974 : Rat) / 227) [(4, 1), (12, 1), (15, 2), (16, 1)],
  term ((27631 : Rat) / 1135) [(4, 1), (12, 1), (16, 1)],
  term (112 : Rat) [(4, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(4, 1), (12, 2), (14, 1), (16, 1)],
  term ((-20564 : Rat) / 1135) [(4, 1), (12, 2), (16, 1)],
  term ((-3974 : Rat) / 227) [(4, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-85048 : Rat) / 1135) [(4, 1), (13, 1), (15, 1), (16, 1)],
  term (16 : Rat) [(4, 1), (13, 2), (14, 1), (16, 1)],
  term (16 : Rat) [(4, 1), (13, 2), (15, 2), (16, 1)],
  term ((-76674 : Rat) / 1135) [(4, 1), (13, 2), (16, 1)],
  term (-64 : Rat) [(4, 1), (13, 3), (15, 1), (16, 1)],
  term ((-6996 : Rat) / 227) [(4, 1), (14, 1), (16, 1)],
  term ((11218 : Rat) / 1135) [(4, 1), (14, 2), (16, 1)],
  term ((36704 : Rat) / 1135) [(4, 1), (15, 2), (16, 1)],
  term ((-27591 : Rat) / 2270) [(4, 1), (16, 1)],
  term ((-4428 : Rat) / 227) [(4, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-11011 : Rat) / 454) [(4, 2), (11, 1), (13, 1), (16, 1)],
  term (4 : Rat) [(4, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term (-16 : Rat) [(4, 2), (11, 1), (13, 3), (16, 1)],
  term ((-1324 : Rat) / 1135) [(4, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((48292 : Rat) / 3405) [(4, 2), (11, 1), (15, 1), (16, 1)],
  term ((272 : Rat) / 681) [(4, 2), (11, 2), (14, 1), (16, 1)],
  term ((-21352 : Rat) / 3405) [(4, 2), (11, 2), (16, 1)],
  term (12 : Rat) [(4, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term (56 : Rat) [(4, 2), (12, 1), (13, 2), (14, 1), (16, 1)],
  term (-42 : Rat) [(4, 2), (12, 1), (13, 2), (16, 1)],
  term ((-13647 : Rat) / 2270) [(4, 2), (12, 1), (14, 1), (16, 1)],
  term ((-1987 : Rat) / 227) [(4, 2), (12, 1), (15, 2), (16, 1)],
  term ((-27631 : Rat) / 2270) [(4, 2), (12, 1), (16, 1)],
  term (-56 : Rat) [(4, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term (-2 : Rat) [(4, 2), (12, 2), (14, 1), (16, 1)],
  term ((10282 : Rat) / 1135) [(4, 2), (12, 2), (16, 1)],
  term ((1987 : Rat) / 227) [(4, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((42524 : Rat) / 1135) [(4, 2), (13, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(4, 2), (13, 2), (14, 1), (16, 1)],
  term (-8 : Rat) [(4, 2), (13, 2), (15, 2), (16, 1)],
  term ((38337 : Rat) / 1135) [(4, 2), (13, 2), (16, 1)],
  term (32 : Rat) [(4, 2), (13, 3), (15, 1), (16, 1)],
  term ((3498 : Rat) / 227) [(4, 2), (14, 1), (16, 1)],
  term ((-5609 : Rat) / 1135) [(4, 2), (14, 2), (16, 1)],
  term ((-18352 : Rat) / 1135) [(4, 2), (15, 2), (16, 1)],
  term ((27591 : Rat) / 4540) [(4, 2), (16, 1)],
  term ((-4428 : Rat) / 227) [(5, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-11011 : Rat) / 454) [(5, 2), (11, 1), (13, 1), (16, 1)],
  term (4 : Rat) [(5, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term (-16 : Rat) [(5, 2), (11, 1), (13, 3), (16, 1)],
  term ((-1324 : Rat) / 1135) [(5, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((48292 : Rat) / 3405) [(5, 2), (11, 1), (15, 1), (16, 1)],
  term ((272 : Rat) / 681) [(5, 2), (11, 2), (14, 1), (16, 1)],
  term ((-21352 : Rat) / 3405) [(5, 2), (11, 2), (16, 1)],
  term (12 : Rat) [(5, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term (56 : Rat) [(5, 2), (12, 1), (13, 2), (14, 1), (16, 1)],
  term (-42 : Rat) [(5, 2), (12, 1), (13, 2), (16, 1)],
  term ((-13647 : Rat) / 2270) [(5, 2), (12, 1), (14, 1), (16, 1)],
  term ((-1987 : Rat) / 227) [(5, 2), (12, 1), (15, 2), (16, 1)],
  term ((-27631 : Rat) / 2270) [(5, 2), (12, 1), (16, 1)],
  term (-56 : Rat) [(5, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term (-2 : Rat) [(5, 2), (12, 2), (14, 1), (16, 1)],
  term ((10282 : Rat) / 1135) [(5, 2), (12, 2), (16, 1)],
  term ((1987 : Rat) / 227) [(5, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((42524 : Rat) / 1135) [(5, 2), (13, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(5, 2), (13, 2), (14, 1), (16, 1)],
  term (-8 : Rat) [(5, 2), (13, 2), (15, 2), (16, 1)],
  term ((38337 : Rat) / 1135) [(5, 2), (13, 2), (16, 1)],
  term (32 : Rat) [(5, 2), (13, 3), (15, 1), (16, 1)],
  term ((3498 : Rat) / 227) [(5, 2), (14, 1), (16, 1)],
  term ((-5609 : Rat) / 1135) [(5, 2), (14, 2), (16, 1)],
  term ((-18352 : Rat) / 1135) [(5, 2), (15, 2), (16, 1)],
  term ((27591 : Rat) / 4540) [(5, 2), (16, 1)],
  term ((-8856 : Rat) / 227) [(11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-11011 : Rat) / 227) [(11, 1), (12, 1), (13, 1), (16, 1)],
  term (8 : Rat) [(11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term (-32 : Rat) [(11, 1), (12, 1), (13, 3), (16, 1)],
  term ((-2648 : Rat) / 1135) [(11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((96584 : Rat) / 3405) [(11, 1), (12, 1), (15, 1), (16, 1)],
  term ((4428 : Rat) / 227) [(11, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((11011 : Rat) / 454) [(11, 1), (12, 2), (13, 1), (16, 1)],
  term (-4 : Rat) [(11, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term (16 : Rat) [(11, 1), (12, 2), (13, 3), (16, 1)],
  term ((1324 : Rat) / 1135) [(11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-48292 : Rat) / 3405) [(11, 1), (12, 2), (15, 1), (16, 1)],
  term ((1324 : Rat) / 1135) [(11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-48292 : Rat) / 3405) [(11, 1), (13, 2), (15, 1), (16, 1)],
  term ((4428 : Rat) / 227) [(11, 1), (13, 3), (14, 1), (16, 1)],
  term ((11011 : Rat) / 454) [(11, 1), (13, 3), (16, 1)],
  term (-4 : Rat) [(11, 1), (13, 4), (15, 1), (16, 1)],
  term (16 : Rat) [(11, 1), (13, 5), (16, 1)],
  term ((544 : Rat) / 681) [(11, 2), (12, 1), (14, 1), (16, 1)],
  term ((-42704 : Rat) / 3405) [(11, 2), (12, 1), (16, 1)],
  term ((-272 : Rat) / 681) [(11, 2), (12, 2), (14, 1), (16, 1)],
  term ((21352 : Rat) / 3405) [(11, 2), (12, 2), (16, 1)],
  term ((-272 : Rat) / 681) [(11, 2), (13, 2), (14, 1), (16, 1)],
  term ((21352 : Rat) / 3405) [(11, 2), (13, 2), (16, 1)],
  term ((3974 : Rat) / 227) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((85048 : Rat) / 1135) [(12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-22673 : Rat) / 2270) [(12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-1645 : Rat) / 227) [(12, 1), (13, 2), (15, 2), (16, 1)],
  term ((180979 : Rat) / 2270) [(12, 1), (13, 2), (16, 1)],
  term (52 : Rat) [(12, 1), (13, 3), (15, 1), (16, 1)],
  term (-56 : Rat) [(12, 1), (13, 4), (14, 1), (16, 1)],
  term (42 : Rat) [(12, 1), (13, 4), (16, 1)],
  term ((6996 : Rat) / 227) [(12, 1), (14, 1), (16, 1)],
  term ((-11218 : Rat) / 1135) [(12, 1), (14, 2), (16, 1)],
  term ((-36704 : Rat) / 1135) [(12, 1), (15, 2), (16, 1)],
  term ((27591 : Rat) / 2270) [(12, 1), (16, 1)],
  term ((-1987 : Rat) / 227) [(12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-15284 : Rat) / 1135) [(12, 2), (13, 1), (15, 1), (16, 1)],
  term (122 : Rat) [(12, 2), (13, 2), (14, 1), (16, 1)],
  term (8 : Rat) [(12, 2), (13, 2), (15, 2), (16, 1)],
  term ((-143959 : Rat) / 1135) [(12, 2), (13, 2), (16, 1)],
  term (24 : Rat) [(12, 2), (13, 3), (15, 1), (16, 1)],
  term ((-31137 : Rat) / 1135) [(12, 2), (14, 1), (16, 1)],
  term ((5609 : Rat) / 1135) [(12, 2), (14, 2), (16, 1)],
  term ((-1518 : Rat) / 1135) [(12, 2), (15, 2), (16, 1)],
  term ((-27623 : Rat) / 908) [(12, 2), (16, 1)],
  term (-124 : Rat) [(12, 3), (13, 1), (15, 1), (16, 1)],
  term (-56 : Rat) [(12, 3), (13, 2), (14, 1), (16, 1)],
  term (42 : Rat) [(12, 3), (13, 2), (16, 1)],
  term ((4567 : Rat) / 2270) [(12, 3), (14, 1), (16, 1)],
  term ((1987 : Rat) / 227) [(12, 3), (15, 2), (16, 1)],
  term ((68759 : Rat) / 2270) [(12, 3), (16, 1)],
  term (56 : Rat) [(12, 4), (13, 1), (15, 1), (16, 1)],
  term (2 : Rat) [(12, 4), (14, 1), (16, 1)],
  term ((-10282 : Rat) / 1135) [(12, 4), (16, 1)],
  term ((-3498 : Rat) / 227) [(13, 2), (14, 1), (16, 1)],
  term ((5609 : Rat) / 1135) [(13, 2), (14, 2), (16, 1)],
  term ((18352 : Rat) / 1135) [(13, 2), (15, 2), (16, 1)],
  term ((-27591 : Rat) / 4540) [(13, 2), (16, 1)],
  term ((-1987 : Rat) / 227) [(13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-42524 : Rat) / 1135) [(13, 3), (15, 1), (16, 1)],
  term (8 : Rat) [(13, 4), (14, 1), (16, 1)],
  term (8 : Rat) [(13, 4), (15, 2), (16, 1)],
  term ((-38337 : Rat) / 1135) [(13, 4), (16, 1)],
  term (-32 : Rat) [(13, 5), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 4, terms 200 through 226. -/
theorem rs_R011_ueqv_R011YYY_block_04_0200_0226_valid :
    checkProductSumEq rs_R011_ueqv_R011YYY_partials_04_0200_0226
      rs_R011_ueqv_R011YYY_block_04_0200_0226 = true := by
  native_decide

end R011UeqvR011YYYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
