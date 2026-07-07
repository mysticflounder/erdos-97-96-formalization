/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R010:u=v:R010NYN, term block 30:200-299

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R010UeqvR010NYNTermShards

/-- Generator polynomial 30 for relaxed split surplus certificate `R010:u=v:R010NYN`. -/
def rs_R010_ueqv_R010NYN_generator_30_0200_0299 : Poly :=
[
  term (2 : Rat) [(12, 1), (14, 1)],
  term (-1 : Rat) [(12, 2)],
  term (2 : Rat) [(13, 1), (15, 1)],
  term (-1 : Rat) [(13, 2)]
]

/-- Coefficient term 200 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0200 : Poly :=
[
  term ((-636 : Rat) / 5) [(3, 1), (8, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 200 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0200 : Poly :=
[
  term ((-1272 : Rat) / 5) [(3, 1), (8, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((636 : Rat) / 5) [(3, 1), (8, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-1272 : Rat) / 5) [(3, 1), (8, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((636 : Rat) / 5) [(3, 1), (8, 1), (10, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 200 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0200_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0200
        rs_R010_ueqv_R010NYN_generator_30_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_30_0200 := by
  native_decide

/-- Coefficient term 201 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0201 : Poly :=
[
  term ((-2571264 : Rat) / 2995) [(3, 1), (8, 1), (11, 1)]
]

/-- Partial product 201 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0201 : Poly :=
[
  term ((-5142528 : Rat) / 2995) [(3, 1), (8, 1), (11, 1), (12, 1), (14, 1)],
  term ((2571264 : Rat) / 2995) [(3, 1), (8, 1), (11, 1), (12, 2)],
  term ((-5142528 : Rat) / 2995) [(3, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((2571264 : Rat) / 2995) [(3, 1), (8, 1), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 201 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0201_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0201
        rs_R010_ueqv_R010NYN_generator_30_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_30_0201 := by
  native_decide

/-- Coefficient term 202 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0202 : Poly :=
[
  term ((-1714176 : Rat) / 2995) [(3, 1), (8, 1), (11, 1), (14, 1)]
]

/-- Partial product 202 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0202 : Poly :=
[
  term ((-3428352 : Rat) / 2995) [(3, 1), (8, 1), (11, 1), (12, 1), (14, 2)],
  term ((1714176 : Rat) / 2995) [(3, 1), (8, 1), (11, 1), (12, 2), (14, 1)],
  term ((-3428352 : Rat) / 2995) [(3, 1), (8, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((1714176 : Rat) / 2995) [(3, 1), (8, 1), (11, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 202 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0202_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0202
        rs_R010_ueqv_R010NYN_generator_30_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_30_0202 := by
  native_decide

/-- Coefficient term 203 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0203 : Poly :=
[
  term ((1838208 : Rat) / 2995) [(3, 1), (8, 1), (14, 1), (15, 1)]
]

/-- Partial product 203 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0203 : Poly :=
[
  term ((3676416 : Rat) / 2995) [(3, 1), (8, 1), (12, 1), (14, 2), (15, 1)],
  term ((-1838208 : Rat) / 2995) [(3, 1), (8, 1), (12, 2), (14, 1), (15, 1)],
  term ((3676416 : Rat) / 2995) [(3, 1), (8, 1), (13, 1), (14, 1), (15, 2)],
  term ((-1838208 : Rat) / 2995) [(3, 1), (8, 1), (13, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 203 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0203_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0203
        rs_R010_ueqv_R010NYN_generator_30_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_30_0203 := by
  native_decide

/-- Coefficient term 204 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0204 : Poly :=
[
  term ((-424 : Rat) / 5) [(3, 1), (8, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 204 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0204 : Poly :=
[
  term ((-848 : Rat) / 5) [(3, 1), (8, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((424 : Rat) / 5) [(3, 1), (8, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-848 : Rat) / 5) [(3, 1), (8, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((424 : Rat) / 5) [(3, 1), (8, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 204 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0204_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0204
        rs_R010_ueqv_R010NYN_generator_30_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_30_0204 := by
  native_decide

/-- Coefficient term 205 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0205 : Poly :=
[
  term ((2757312 : Rat) / 2995) [(3, 1), (8, 1), (15, 1)]
]

/-- Partial product 205 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0205 : Poly :=
[
  term ((5514624 : Rat) / 2995) [(3, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((-2757312 : Rat) / 2995) [(3, 1), (8, 1), (12, 2), (15, 1)],
  term ((5514624 : Rat) / 2995) [(3, 1), (8, 1), (13, 1), (15, 2)],
  term ((-2757312 : Rat) / 2995) [(3, 1), (8, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 205 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0205_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0205
        rs_R010_ueqv_R010NYN_generator_30_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_30_0205 := by
  native_decide

/-- Coefficient term 206 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0206 : Poly :=
[
  term ((-636 : Rat) / 5) [(3, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 206 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0206 : Poly :=
[
  term ((-1272 : Rat) / 5) [(3, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((636 : Rat) / 5) [(3, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((-1272 : Rat) / 5) [(3, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((636 : Rat) / 5) [(3, 1), (8, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 206 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0206_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0206
        rs_R010_ueqv_R010NYN_generator_30_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_30_0206 := by
  native_decide

/-- Coefficient term 207 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0207 : Poly :=
[
  term (-18 : Rat) [(3, 1), (9, 1)]
]

/-- Partial product 207 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0207 : Poly :=
[
  term (-36 : Rat) [(3, 1), (9, 1), (12, 1), (14, 1)],
  term (18 : Rat) [(3, 1), (9, 1), (12, 2)],
  term (-36 : Rat) [(3, 1), (9, 1), (13, 1), (15, 1)],
  term (18 : Rat) [(3, 1), (9, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 207 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0207_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0207
        rs_R010_ueqv_R010NYN_generator_30_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_30_0207 := by
  native_decide

/-- Coefficient term 208 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0208 : Poly :=
[
  term ((458496 : Rat) / 2995) [(3, 1), (9, 1), (11, 1), (14, 1), (15, 1)]
]

/-- Partial product 208 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0208 : Poly :=
[
  term ((916992 : Rat) / 2995) [(3, 1), (9, 1), (11, 1), (12, 1), (14, 2), (15, 1)],
  term ((-458496 : Rat) / 2995) [(3, 1), (9, 1), (11, 1), (12, 2), (14, 1), (15, 1)],
  term ((916992 : Rat) / 2995) [(3, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 2)],
  term ((-458496 : Rat) / 2995) [(3, 1), (9, 1), (11, 1), (13, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 208 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0208_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0208
        rs_R010_ueqv_R010NYN_generator_30_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_30_0208 := by
  native_decide

/-- Coefficient term 209 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0209 : Poly :=
[
  term ((-72 : Rat) / 5) [(3, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 209 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0209 : Poly :=
[
  term ((-144 : Rat) / 5) [(3, 1), (9, 1), (11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((72 : Rat) / 5) [(3, 1), (9, 1), (11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-144 : Rat) / 5) [(3, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((72 : Rat) / 5) [(3, 1), (9, 1), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 209 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0209_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0209
        rs_R010_ueqv_R010NYN_generator_30_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_30_0209 := by
  native_decide

/-- Coefficient term 210 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0210 : Poly :=
[
  term ((-105408 : Rat) / 599) [(3, 1), (9, 1), (11, 1), (15, 1)]
]

/-- Partial product 210 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0210 : Poly :=
[
  term ((-210816 : Rat) / 599) [(3, 1), (9, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((105408 : Rat) / 599) [(3, 1), (9, 1), (11, 1), (12, 2), (15, 1)],
  term ((-210816 : Rat) / 599) [(3, 1), (9, 1), (11, 1), (13, 1), (15, 2)],
  term ((105408 : Rat) / 599) [(3, 1), (9, 1), (11, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 210 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0210_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0210
        rs_R010_ueqv_R010NYN_generator_30_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_30_0210 := by
  native_decide

/-- Coefficient term 211 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0211 : Poly :=
[
  term ((348 : Rat) / 5) [(3, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 211 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0211 : Poly :=
[
  term ((696 : Rat) / 5) [(3, 1), (9, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-348 : Rat) / 5) [(3, 1), (9, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((696 : Rat) / 5) [(3, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-348 : Rat) / 5) [(3, 1), (9, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 211 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0211_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0211
        rs_R010_ueqv_R010NYN_generator_30_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_30_0211 := by
  native_decide

/-- Coefficient term 212 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0212 : Poly :=
[
  term ((482112 : Rat) / 2995) [(3, 1), (9, 1), (11, 2)]
]

/-- Partial product 212 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0212 : Poly :=
[
  term ((964224 : Rat) / 2995) [(3, 1), (9, 1), (11, 2), (12, 1), (14, 1)],
  term ((-482112 : Rat) / 2995) [(3, 1), (9, 1), (11, 2), (12, 2)],
  term ((964224 : Rat) / 2995) [(3, 1), (9, 1), (11, 2), (13, 1), (15, 1)],
  term ((-482112 : Rat) / 2995) [(3, 1), (9, 1), (11, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 212 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0212_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0212
        rs_R010_ueqv_R010NYN_generator_30_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_30_0212 := by
  native_decide

/-- Coefficient term 213 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0213 : Poly :=
[
  term ((-321408 : Rat) / 2995) [(3, 1), (9, 1), (11, 2), (14, 1)]
]

/-- Partial product 213 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0213 : Poly :=
[
  term ((-642816 : Rat) / 2995) [(3, 1), (9, 1), (11, 2), (12, 1), (14, 2)],
  term ((321408 : Rat) / 2995) [(3, 1), (9, 1), (11, 2), (12, 2), (14, 1)],
  term ((-642816 : Rat) / 2995) [(3, 1), (9, 1), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((321408 : Rat) / 2995) [(3, 1), (9, 1), (11, 2), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 213 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0213_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0213
        rs_R010_ueqv_R010NYN_generator_30_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_30_0213 := by
  native_decide

/-- Coefficient term 214 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0214 : Poly :=
[
  term (12 : Rat) [(3, 1), (9, 1), (14, 1)]
]

/-- Partial product 214 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0214 : Poly :=
[
  term (24 : Rat) [(3, 1), (9, 1), (12, 1), (14, 2)],
  term (-12 : Rat) [(3, 1), (9, 1), (12, 2), (14, 1)],
  term (24 : Rat) [(3, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term (-12 : Rat) [(3, 1), (9, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 214 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0214_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0214
        rs_R010_ueqv_R010NYN_generator_30_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_30_0214 := by
  native_decide

/-- Coefficient term 215 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0215 : Poly :=
[
  term ((-98496 : Rat) / 2995) [(3, 1), (9, 1), (14, 1), (15, 2)]
]

/-- Partial product 215 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0215 : Poly :=
[
  term ((-196992 : Rat) / 2995) [(3, 1), (9, 1), (12, 1), (14, 2), (15, 2)],
  term ((98496 : Rat) / 2995) [(3, 1), (9, 1), (12, 2), (14, 1), (15, 2)],
  term ((-196992 : Rat) / 2995) [(3, 1), (9, 1), (13, 1), (14, 1), (15, 3)],
  term ((98496 : Rat) / 2995) [(3, 1), (9, 1), (13, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 215 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0215_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0215
        rs_R010_ueqv_R010NYN_generator_30_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_30_0215 := by
  native_decide

/-- Coefficient term 216 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0216 : Poly :=
[
  term ((-12 : Rat) / 5) [(3, 1), (9, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 216 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0216 : Poly :=
[
  term ((-24 : Rat) / 5) [(3, 1), (9, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((12 : Rat) / 5) [(3, 1), (9, 1), (12, 2), (14, 1), (15, 2), (16, 1)],
  term ((-24 : Rat) / 5) [(3, 1), (9, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((12 : Rat) / 5) [(3, 1), (9, 1), (13, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 216 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0216_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0216
        rs_R010_ueqv_R010NYN_generator_30_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_30_0216 := by
  native_decide

/-- Coefficient term 217 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0217 : Poly :=
[
  term ((114912 : Rat) / 2995) [(3, 1), (9, 1), (15, 2)]
]

/-- Partial product 217 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0217 : Poly :=
[
  term ((229824 : Rat) / 2995) [(3, 1), (9, 1), (12, 1), (14, 1), (15, 2)],
  term ((-114912 : Rat) / 2995) [(3, 1), (9, 1), (12, 2), (15, 2)],
  term ((229824 : Rat) / 2995) [(3, 1), (9, 1), (13, 1), (15, 3)],
  term ((-114912 : Rat) / 2995) [(3, 1), (9, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 217 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0217_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0217
        rs_R010_ueqv_R010NYN_generator_30_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_30_0217 := by
  native_decide

/-- Coefficient term 218 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0218 : Poly :=
[
  term ((14 : Rat) / 5) [(3, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 218 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0218 : Poly :=
[
  term ((28 : Rat) / 5) [(3, 1), (9, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-14 : Rat) / 5) [(3, 1), (9, 1), (12, 2), (15, 2), (16, 1)],
  term ((28 : Rat) / 5) [(3, 1), (9, 1), (13, 1), (15, 3), (16, 1)],
  term ((-14 : Rat) / 5) [(3, 1), (9, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 218 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0218_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0218
        rs_R010_ueqv_R010NYN_generator_30_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_30_0218 := by
  native_decide

/-- Coefficient term 219 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0219 : Poly :=
[
  term ((2571264 : Rat) / 2995) [(3, 1), (10, 1), (11, 1), (14, 1)]
]

/-- Partial product 219 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0219 : Poly :=
[
  term ((5142528 : Rat) / 2995) [(3, 1), (10, 1), (11, 1), (12, 1), (14, 2)],
  term ((-2571264 : Rat) / 2995) [(3, 1), (10, 1), (11, 1), (12, 2), (14, 1)],
  term ((5142528 : Rat) / 2995) [(3, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-2571264 : Rat) / 2995) [(3, 1), (10, 1), (11, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 219 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0219_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0219
        rs_R010_ueqv_R010NYN_generator_30_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_30_0219 := by
  native_decide

/-- Coefficient term 220 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0220 : Poly :=
[
  term ((-2757312 : Rat) / 2995) [(3, 1), (10, 1), (14, 1), (15, 1)]
]

/-- Partial product 220 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0220 : Poly :=
[
  term ((-5514624 : Rat) / 2995) [(3, 1), (10, 1), (12, 1), (14, 2), (15, 1)],
  term ((2757312 : Rat) / 2995) [(3, 1), (10, 1), (12, 2), (14, 1), (15, 1)],
  term ((-5514624 : Rat) / 2995) [(3, 1), (10, 1), (13, 1), (14, 1), (15, 2)],
  term ((2757312 : Rat) / 2995) [(3, 1), (10, 1), (13, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 220 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0220_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0220
        rs_R010_ueqv_R010NYN_generator_30_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_30_0220 := by
  native_decide

/-- Coefficient term 221 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0221 : Poly :=
[
  term ((636 : Rat) / 5) [(3, 1), (10, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 221 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0221 : Poly :=
[
  term ((1272 : Rat) / 5) [(3, 1), (10, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-636 : Rat) / 5) [(3, 1), (10, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((1272 : Rat) / 5) [(3, 1), (10, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-636 : Rat) / 5) [(3, 1), (10, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 221 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0221_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0221
        rs_R010_ueqv_R010NYN_generator_30_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_30_0221 := by
  native_decide

/-- Coefficient term 222 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0222 : Poly :=
[
  term (12 : Rat) [(3, 1), (10, 1), (15, 1)]
]

/-- Partial product 222 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0222 : Poly :=
[
  term (24 : Rat) [(3, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term (-12 : Rat) [(3, 1), (10, 1), (12, 2), (15, 1)],
  term (24 : Rat) [(3, 1), (10, 1), (13, 1), (15, 2)],
  term (-12 : Rat) [(3, 1), (10, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 222 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0222_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0222
        rs_R010_ueqv_R010NYN_generator_30_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_30_0222 := by
  native_decide

/-- Coefficient term 223 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0223 : Poly :=
[
  term (-12 : Rat) [(3, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 223 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0223 : Poly :=
[
  term (-24 : Rat) [(3, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(3, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term (-24 : Rat) [(3, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term (12 : Rat) [(3, 1), (10, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 223 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0223_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0223
        rs_R010_ueqv_R010NYN_generator_30_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_30_0223 := by
  native_decide

/-- Coefficient term 224 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0224 : Poly :=
[
  term ((-2082456 : Rat) / 2995) [(3, 1), (11, 1)]
]

/-- Partial product 224 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0224 : Poly :=
[
  term ((-4164912 : Rat) / 2995) [(3, 1), (11, 1), (12, 1), (14, 1)],
  term ((2082456 : Rat) / 2995) [(3, 1), (11, 1), (12, 2)],
  term ((-4164912 : Rat) / 2995) [(3, 1), (11, 1), (13, 1), (15, 1)],
  term ((2082456 : Rat) / 2995) [(3, 1), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 224 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0224_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0224
        rs_R010_ueqv_R010NYN_generator_30_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_30_0224 := by
  native_decide

/-- Coefficient term 225 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0225 : Poly :=
[
  term ((-2571264 : Rat) / 2995) [(3, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 225 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0225 : Poly :=
[
  term ((-5142528 : Rat) / 2995) [(3, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((2571264 : Rat) / 2995) [(3, 1), (11, 1), (12, 2), (13, 1), (15, 1)],
  term ((-5142528 : Rat) / 2995) [(3, 1), (11, 1), (13, 2), (15, 2)],
  term ((2571264 : Rat) / 2995) [(3, 1), (11, 1), (13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 225 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0225_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0225
        rs_R010_ueqv_R010NYN_generator_30_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_30_0225 := by
  native_decide

/-- Coefficient term 226 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0226 : Poly :=
[
  term (6 : Rat) [(3, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 226 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0226 : Poly :=
[
  term (12 : Rat) [(3, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(3, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(3, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term (-6 : Rat) [(3, 1), (11, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 226 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0226_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0226
        rs_R010_ueqv_R010NYN_generator_30_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_30_0226 := by
  native_decide

/-- Coefficient term 227 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0227 : Poly :=
[
  term ((2245392 : Rat) / 2995) [(3, 1), (11, 1), (14, 1)]
]

/-- Partial product 227 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0227 : Poly :=
[
  term ((4490784 : Rat) / 2995) [(3, 1), (11, 1), (12, 1), (14, 2)],
  term ((-2245392 : Rat) / 2995) [(3, 1), (11, 1), (12, 2), (14, 1)],
  term ((4490784 : Rat) / 2995) [(3, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-2245392 : Rat) / 2995) [(3, 1), (11, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 227 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0227_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0227
        rs_R010_ueqv_R010NYN_generator_30_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_30_0227 := by
  native_decide

/-- Coefficient term 228 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0228 : Poly :=
[
  term ((-366336 : Rat) / 2995) [(3, 1), (11, 1), (14, 1), (15, 2)]
]

/-- Partial product 228 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0228 : Poly :=
[
  term ((-732672 : Rat) / 2995) [(3, 1), (11, 1), (12, 1), (14, 2), (15, 2)],
  term ((366336 : Rat) / 2995) [(3, 1), (11, 1), (12, 2), (14, 1), (15, 2)],
  term ((-732672 : Rat) / 2995) [(3, 1), (11, 1), (13, 1), (14, 1), (15, 3)],
  term ((366336 : Rat) / 2995) [(3, 1), (11, 1), (13, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 228 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0228_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0228
        rs_R010_ueqv_R010NYN_generator_30_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_30_0228 := by
  native_decide

/-- Coefficient term 229 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0229 : Poly :=
[
  term ((198 : Rat) / 5) [(3, 1), (11, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 229 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0229 : Poly :=
[
  term ((396 : Rat) / 5) [(3, 1), (11, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((-198 : Rat) / 5) [(3, 1), (11, 1), (12, 2), (14, 1), (15, 2), (16, 1)],
  term ((396 : Rat) / 5) [(3, 1), (11, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-198 : Rat) / 5) [(3, 1), (11, 1), (13, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 229 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0229_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0229
        rs_R010_ueqv_R010NYN_generator_30_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_30_0229 := by
  native_decide

/-- Coefficient term 230 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0230 : Poly :=
[
  term ((-7348272 : Rat) / 2995) [(3, 1), (11, 1), (15, 2)]
]

/-- Partial product 230 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0230 : Poly :=
[
  term ((-14696544 : Rat) / 2995) [(3, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((7348272 : Rat) / 2995) [(3, 1), (11, 1), (12, 2), (15, 2)],
  term ((-14696544 : Rat) / 2995) [(3, 1), (11, 1), (13, 1), (15, 3)],
  term ((7348272 : Rat) / 2995) [(3, 1), (11, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 230 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0230_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0230
        rs_R010_ueqv_R010NYN_generator_30_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_30_0230 := by
  native_decide

/-- Coefficient term 231 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0231 : Poly :=
[
  term ((1413 : Rat) / 5) [(3, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 231 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0231 : Poly :=
[
  term ((2826 : Rat) / 5) [(3, 1), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1413 : Rat) / 5) [(3, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((2826 : Rat) / 5) [(3, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((-1413 : Rat) / 5) [(3, 1), (11, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 231 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0231_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0231
        rs_R010_ueqv_R010NYN_generator_30_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_30_0231 := by
  native_decide

/-- Coefficient term 232 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0232 : Poly :=
[
  term ((482112 : Rat) / 2995) [(3, 1), (11, 2), (14, 1), (15, 1)]
]

/-- Partial product 232 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0232 : Poly :=
[
  term ((964224 : Rat) / 2995) [(3, 1), (11, 2), (12, 1), (14, 2), (15, 1)],
  term ((-482112 : Rat) / 2995) [(3, 1), (11, 2), (12, 2), (14, 1), (15, 1)],
  term ((964224 : Rat) / 2995) [(3, 1), (11, 2), (13, 1), (14, 1), (15, 2)],
  term ((-482112 : Rat) / 2995) [(3, 1), (11, 2), (13, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 232 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0232_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0232
        rs_R010_ueqv_R010NYN_generator_30_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_30_0232 := by
  native_decide

/-- Coefficient term 233 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0233 : Poly :=
[
  term ((5035392 : Rat) / 2995) [(3, 1), (11, 2), (15, 1)]
]

/-- Partial product 233 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0233 : Poly :=
[
  term ((10070784 : Rat) / 2995) [(3, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((-5035392 : Rat) / 2995) [(3, 1), (11, 2), (12, 2), (15, 1)],
  term ((10070784 : Rat) / 2995) [(3, 1), (11, 2), (13, 1), (15, 2)],
  term ((-5035392 : Rat) / 2995) [(3, 1), (11, 2), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 233 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0233_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0233
        rs_R010_ueqv_R010NYN_generator_30_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_30_0233 := by
  native_decide

/-- Coefficient term 234 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0234 : Poly :=
[
  term ((-2667 : Rat) / 599) [(3, 1), (13, 1)]
]

/-- Partial product 234 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0234 : Poly :=
[
  term ((-5334 : Rat) / 599) [(3, 1), (12, 1), (13, 1), (14, 1)],
  term ((2667 : Rat) / 599) [(3, 1), (12, 2), (13, 1)],
  term ((-5334 : Rat) / 599) [(3, 1), (13, 2), (15, 1)],
  term ((2667 : Rat) / 599) [(3, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 234 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0234_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0234
        rs_R010_ueqv_R010NYN_generator_30_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_30_0234 := by
  native_decide

/-- Coefficient term 235 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0235 : Poly :=
[
  term ((2757312 : Rat) / 2995) [(3, 1), (13, 1), (15, 2)]
]

/-- Partial product 235 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0235 : Poly :=
[
  term ((5514624 : Rat) / 2995) [(3, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((-2757312 : Rat) / 2995) [(3, 1), (12, 2), (13, 1), (15, 2)],
  term ((5514624 : Rat) / 2995) [(3, 1), (13, 2), (15, 3)],
  term ((-2757312 : Rat) / 2995) [(3, 1), (13, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 235 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0235_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0235
        rs_R010_ueqv_R010NYN_generator_30_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_30_0235 := by
  native_decide

/-- Coefficient term 236 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0236 : Poly :=
[
  term ((-636 : Rat) / 5) [(3, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 236 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0236 : Poly :=
[
  term ((-1272 : Rat) / 5) [(3, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((636 : Rat) / 5) [(3, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-1272 : Rat) / 5) [(3, 1), (13, 2), (15, 3), (16, 1)],
  term ((636 : Rat) / 5) [(3, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 236 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0236_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0236
        rs_R010_ueqv_R010NYN_generator_30_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_30_0236 := by
  native_decide

/-- Coefficient term 237 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0237 : Poly :=
[
  term ((-2336056 : Rat) / 2995) [(3, 1), (14, 1), (15, 1)]
]

/-- Partial product 237 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0237 : Poly :=
[
  term ((-4672112 : Rat) / 2995) [(3, 1), (12, 1), (14, 2), (15, 1)],
  term ((2336056 : Rat) / 2995) [(3, 1), (12, 2), (14, 1), (15, 1)],
  term ((-4672112 : Rat) / 2995) [(3, 1), (13, 1), (14, 1), (15, 2)],
  term ((2336056 : Rat) / 2995) [(3, 1), (13, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 237 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0237_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0237
        rs_R010_ueqv_R010NYN_generator_30_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_30_0237 := by
  native_decide

/-- Coefficient term 238 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0238 : Poly :=
[
  term ((538 : Rat) / 5) [(3, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 238 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0238 : Poly :=
[
  term ((1076 : Rat) / 5) [(3, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-538 : Rat) / 5) [(3, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((1076 : Rat) / 5) [(3, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-538 : Rat) / 5) [(3, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 238 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0238_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0238
        rs_R010_ueqv_R010NYN_generator_30_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_30_0238 := by
  native_decide

/-- Coefficient term 239 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0239 : Poly :=
[
  term ((2029493 : Rat) / 2995) [(3, 1), (15, 1)]
]

/-- Partial product 239 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0239 : Poly :=
[
  term ((4058986 : Rat) / 2995) [(3, 1), (12, 1), (14, 1), (15, 1)],
  term ((-2029493 : Rat) / 2995) [(3, 1), (12, 2), (15, 1)],
  term ((4058986 : Rat) / 2995) [(3, 1), (13, 1), (15, 2)],
  term ((-2029493 : Rat) / 2995) [(3, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 239 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0239_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0239
        rs_R010_ueqv_R010NYN_generator_30_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_30_0239 := by
  native_decide

/-- Coefficient term 240 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0240 : Poly :=
[
  term ((-494 : Rat) / 5) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 240 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0240 : Poly :=
[
  term ((-988 : Rat) / 5) [(3, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((494 : Rat) / 5) [(3, 1), (12, 2), (15, 1), (16, 1)],
  term ((-988 : Rat) / 5) [(3, 1), (13, 1), (15, 2), (16, 1)],
  term ((494 : Rat) / 5) [(3, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 240 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0240_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0240
        rs_R010_ueqv_R010NYN_generator_30_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_30_0240 := by
  native_decide

/-- Coefficient term 241 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0241 : Poly :=
[
  term ((2423808 : Rat) / 2995) [(3, 1), (15, 3)]
]

/-- Partial product 241 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0241 : Poly :=
[
  term ((4847616 : Rat) / 2995) [(3, 1), (12, 1), (14, 1), (15, 3)],
  term ((-2423808 : Rat) / 2995) [(3, 1), (12, 2), (15, 3)],
  term ((4847616 : Rat) / 2995) [(3, 1), (13, 1), (15, 4)],
  term ((-2423808 : Rat) / 2995) [(3, 1), (13, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 241 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0241_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0241
        rs_R010_ueqv_R010NYN_generator_30_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_30_0241 := by
  native_decide

/-- Coefficient term 242 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0242 : Poly :=
[
  term ((-534 : Rat) / 5) [(3, 1), (15, 3), (16, 1)]
]

/-- Partial product 242 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0242 : Poly :=
[
  term ((-1068 : Rat) / 5) [(3, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((534 : Rat) / 5) [(3, 1), (12, 2), (15, 3), (16, 1)],
  term ((-1068 : Rat) / 5) [(3, 1), (13, 1), (15, 4), (16, 1)],
  term ((534 : Rat) / 5) [(3, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 242 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0242_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0242
        rs_R010_ueqv_R010NYN_generator_30_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_30_0242 := by
  native_decide

/-- Coefficient term 243 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0243 : Poly :=
[
  term (6 : Rat) [(3, 2)]
]

/-- Partial product 243 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0243 : Poly :=
[
  term (12 : Rat) [(3, 2), (12, 1), (14, 1)],
  term (-6 : Rat) [(3, 2), (12, 2)],
  term (12 : Rat) [(3, 2), (13, 1), (15, 1)],
  term (-6 : Rat) [(3, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 243 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0243_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0243
        rs_R010_ueqv_R010NYN_generator_30_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_30_0243 := by
  native_decide

/-- Coefficient term 244 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0244 : Poly :=
[
  term ((2571264 : Rat) / 2995) [(3, 2), (11, 1), (15, 1)]
]

/-- Partial product 244 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0244 : Poly :=
[
  term ((5142528 : Rat) / 2995) [(3, 2), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-2571264 : Rat) / 2995) [(3, 2), (11, 1), (12, 2), (15, 1)],
  term ((5142528 : Rat) / 2995) [(3, 2), (11, 1), (13, 1), (15, 2)],
  term ((-2571264 : Rat) / 2995) [(3, 2), (11, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 244 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0244_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0244
        rs_R010_ueqv_R010NYN_generator_30_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_30_0244 := by
  native_decide

/-- Coefficient term 245 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0245 : Poly :=
[
  term (-12 : Rat) [(3, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 245 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0245 : Poly :=
[
  term (-24 : Rat) [(3, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(3, 2), (11, 1), (12, 2), (15, 1), (16, 1)],
  term (-24 : Rat) [(3, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term (12 : Rat) [(3, 2), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 245 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0245_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0245
        rs_R010_ueqv_R010NYN_generator_30_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_30_0245 := by
  native_decide

/-- Coefficient term 246 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0246 : Poly :=
[
  term ((-2757312 : Rat) / 2995) [(3, 2), (15, 2)]
]

/-- Partial product 246 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0246 : Poly :=
[
  term ((-5514624 : Rat) / 2995) [(3, 2), (12, 1), (14, 1), (15, 2)],
  term ((2757312 : Rat) / 2995) [(3, 2), (12, 2), (15, 2)],
  term ((-5514624 : Rat) / 2995) [(3, 2), (13, 1), (15, 3)],
  term ((2757312 : Rat) / 2995) [(3, 2), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 246 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0246_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0246
        rs_R010_ueqv_R010NYN_generator_30_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_30_0246 := by
  native_decide

/-- Coefficient term 247 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0247 : Poly :=
[
  term ((636 : Rat) / 5) [(3, 2), (15, 2), (16, 1)]
]

/-- Partial product 247 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0247 : Poly :=
[
  term ((1272 : Rat) / 5) [(3, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-636 : Rat) / 5) [(3, 2), (12, 2), (15, 2), (16, 1)],
  term ((1272 : Rat) / 5) [(3, 2), (13, 1), (15, 3), (16, 1)],
  term ((-636 : Rat) / 5) [(3, 2), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 247 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0247_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0247
        rs_R010_ueqv_R010NYN_generator_30_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_30_0247 := by
  native_decide

/-- Coefficient term 248 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0248 : Poly :=
[
  term ((23304 : Rat) / 599) [(4, 1), (8, 1)]
]

/-- Partial product 248 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0248 : Poly :=
[
  term ((46608 : Rat) / 599) [(4, 1), (8, 1), (12, 1), (14, 1)],
  term ((-23304 : Rat) / 599) [(4, 1), (8, 1), (12, 2)],
  term ((46608 : Rat) / 599) [(4, 1), (8, 1), (13, 1), (15, 1)],
  term ((-23304 : Rat) / 599) [(4, 1), (8, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 248 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0248_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0248
        rs_R010_ueqv_R010NYN_generator_30_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_30_0248 := by
  native_decide

/-- Coefficient term 249 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0249 : Poly :=
[
  term ((2957952 : Rat) / 2995) [(4, 1), (8, 1), (11, 1), (15, 1)]
]

/-- Partial product 249 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0249 : Poly :=
[
  term ((5915904 : Rat) / 2995) [(4, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-2957952 : Rat) / 2995) [(4, 1), (8, 1), (11, 1), (12, 2), (15, 1)],
  term ((5915904 : Rat) / 2995) [(4, 1), (8, 1), (11, 1), (13, 1), (15, 2)],
  term ((-2957952 : Rat) / 2995) [(4, 1), (8, 1), (11, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 249 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0249_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0249
        rs_R010_ueqv_R010NYN_generator_30_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_30_0249 := by
  native_decide

/-- Coefficient term 250 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0250 : Poly :=
[
  term ((-1012 : Rat) / 5) [(4, 1), (8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 250 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0250 : Poly :=
[
  term ((-2024 : Rat) / 5) [(4, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((1012 : Rat) / 5) [(4, 1), (8, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-2024 : Rat) / 5) [(4, 1), (8, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((1012 : Rat) / 5) [(4, 1), (8, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 250 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0250_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0250
        rs_R010_ueqv_R010NYN_generator_30_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_30_0250 := by
  native_decide

/-- Coefficient term 251 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0251 : Poly :=
[
  term ((-2999808 : Rat) / 2995) [(4, 1), (8, 1), (11, 2)]
]

/-- Partial product 251 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0251 : Poly :=
[
  term ((-5999616 : Rat) / 2995) [(4, 1), (8, 1), (11, 2), (12, 1), (14, 1)],
  term ((2999808 : Rat) / 2995) [(4, 1), (8, 1), (11, 2), (12, 2)],
  term ((-5999616 : Rat) / 2995) [(4, 1), (8, 1), (11, 2), (13, 1), (15, 1)],
  term ((2999808 : Rat) / 2995) [(4, 1), (8, 1), (11, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 251 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0251_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0251
        rs_R010_ueqv_R010NYN_generator_30_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_30_0251 := by
  native_decide

/-- Coefficient term 252 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0252 : Poly :=
[
  term ((-85344 : Rat) / 2995) [(4, 1), (8, 1), (15, 2)]
]

/-- Partial product 252 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0252 : Poly :=
[
  term ((-170688 : Rat) / 2995) [(4, 1), (8, 1), (12, 1), (14, 1), (15, 2)],
  term ((85344 : Rat) / 2995) [(4, 1), (8, 1), (12, 2), (15, 2)],
  term ((-170688 : Rat) / 2995) [(4, 1), (8, 1), (13, 1), (15, 3)],
  term ((85344 : Rat) / 2995) [(4, 1), (8, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 252 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0252_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0252
        rs_R010_ueqv_R010NYN_generator_30_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_30_0252 := by
  native_decide

/-- Coefficient term 253 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0253 : Poly :=
[
  term ((32 : Rat) / 5) [(4, 1), (8, 1), (15, 2), (16, 1)]
]

/-- Partial product 253 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0253 : Poly :=
[
  term ((64 : Rat) / 5) [(4, 1), (8, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-32 : Rat) / 5) [(4, 1), (8, 1), (12, 2), (15, 2), (16, 1)],
  term ((64 : Rat) / 5) [(4, 1), (8, 1), (13, 1), (15, 3), (16, 1)],
  term ((-32 : Rat) / 5) [(4, 1), (8, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 253 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0253_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0253
        rs_R010_ueqv_R010NYN_generator_30_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_30_0253 := by
  native_decide

/-- Coefficient term 254 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0254 : Poly :=
[
  term ((23304 : Rat) / 599) [(5, 1), (9, 1)]
]

/-- Partial product 254 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0254 : Poly :=
[
  term ((46608 : Rat) / 599) [(5, 1), (9, 1), (12, 1), (14, 1)],
  term ((-23304 : Rat) / 599) [(5, 1), (9, 1), (12, 2)],
  term ((46608 : Rat) / 599) [(5, 1), (9, 1), (13, 1), (15, 1)],
  term ((-23304 : Rat) / 599) [(5, 1), (9, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 254 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0254_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0254
        rs_R010_ueqv_R010NYN_generator_30_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_30_0254 := by
  native_decide

/-- Coefficient term 255 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0255 : Poly :=
[
  term ((2957952 : Rat) / 2995) [(5, 1), (9, 1), (11, 1), (15, 1)]
]

/-- Partial product 255 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0255 : Poly :=
[
  term ((5915904 : Rat) / 2995) [(5, 1), (9, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-2957952 : Rat) / 2995) [(5, 1), (9, 1), (11, 1), (12, 2), (15, 1)],
  term ((5915904 : Rat) / 2995) [(5, 1), (9, 1), (11, 1), (13, 1), (15, 2)],
  term ((-2957952 : Rat) / 2995) [(5, 1), (9, 1), (11, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 255 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0255_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0255
        rs_R010_ueqv_R010NYN_generator_30_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_30_0255 := by
  native_decide

/-- Coefficient term 256 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0256 : Poly :=
[
  term ((-1012 : Rat) / 5) [(5, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 256 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0256 : Poly :=
[
  term ((-2024 : Rat) / 5) [(5, 1), (9, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((1012 : Rat) / 5) [(5, 1), (9, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-2024 : Rat) / 5) [(5, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((1012 : Rat) / 5) [(5, 1), (9, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 256 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0256_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0256
        rs_R010_ueqv_R010NYN_generator_30_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_30_0256 := by
  native_decide

/-- Coefficient term 257 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0257 : Poly :=
[
  term ((-2999808 : Rat) / 2995) [(5, 1), (9, 1), (11, 2)]
]

/-- Partial product 257 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0257 : Poly :=
[
  term ((-5999616 : Rat) / 2995) [(5, 1), (9, 1), (11, 2), (12, 1), (14, 1)],
  term ((2999808 : Rat) / 2995) [(5, 1), (9, 1), (11, 2), (12, 2)],
  term ((-5999616 : Rat) / 2995) [(5, 1), (9, 1), (11, 2), (13, 1), (15, 1)],
  term ((2999808 : Rat) / 2995) [(5, 1), (9, 1), (11, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 257 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0257_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0257
        rs_R010_ueqv_R010NYN_generator_30_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_30_0257 := by
  native_decide

/-- Coefficient term 258 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0258 : Poly :=
[
  term ((-85344 : Rat) / 2995) [(5, 1), (9, 1), (15, 2)]
]

/-- Partial product 258 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0258 : Poly :=
[
  term ((-170688 : Rat) / 2995) [(5, 1), (9, 1), (12, 1), (14, 1), (15, 2)],
  term ((85344 : Rat) / 2995) [(5, 1), (9, 1), (12, 2), (15, 2)],
  term ((-170688 : Rat) / 2995) [(5, 1), (9, 1), (13, 1), (15, 3)],
  term ((85344 : Rat) / 2995) [(5, 1), (9, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 258 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0258_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0258
        rs_R010_ueqv_R010NYN_generator_30_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_30_0258 := by
  native_decide

/-- Coefficient term 259 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0259 : Poly :=
[
  term ((32 : Rat) / 5) [(5, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 259 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0259 : Poly :=
[
  term ((64 : Rat) / 5) [(5, 1), (9, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-32 : Rat) / 5) [(5, 1), (9, 1), (12, 2), (15, 2), (16, 1)],
  term ((64 : Rat) / 5) [(5, 1), (9, 1), (13, 1), (15, 3), (16, 1)],
  term ((-32 : Rat) / 5) [(5, 1), (9, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 259 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0259_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0259
        rs_R010_ueqv_R010NYN_generator_30_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_30_0259 := by
  native_decide

/-- Coefficient term 260 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0260 : Poly :=
[
  term ((-21072 : Rat) / 599) [(6, 1), (8, 1)]
]

/-- Partial product 260 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0260 : Poly :=
[
  term ((-42144 : Rat) / 599) [(6, 1), (8, 1), (12, 1), (14, 1)],
  term ((21072 : Rat) / 599) [(6, 1), (8, 1), (12, 2)],
  term ((-42144 : Rat) / 599) [(6, 1), (8, 1), (13, 1), (15, 1)],
  term ((21072 : Rat) / 599) [(6, 1), (8, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 260 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0260_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0260
        rs_R010_ueqv_R010NYN_generator_30_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_30_0260 := by
  native_decide

/-- Coefficient term 261 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0261 : Poly :=
[
  term ((-4983552 : Rat) / 2995) [(6, 1), (8, 1), (11, 1), (15, 1)]
]

/-- Partial product 261 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0261 : Poly :=
[
  term ((-9967104 : Rat) / 2995) [(6, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((4983552 : Rat) / 2995) [(6, 1), (8, 1), (11, 1), (12, 2), (15, 1)],
  term ((-9967104 : Rat) / 2995) [(6, 1), (8, 1), (11, 1), (13, 1), (15, 2)],
  term ((4983552 : Rat) / 2995) [(6, 1), (8, 1), (11, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 261 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0261_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0261
        rs_R010_ueqv_R010NYN_generator_30_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_30_0261 := by
  native_decide

/-- Coefficient term 262 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0262 : Poly :=
[
  term ((948 : Rat) / 5) [(6, 1), (8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 262 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0262 : Poly :=
[
  term ((1896 : Rat) / 5) [(6, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-948 : Rat) / 5) [(6, 1), (8, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((1896 : Rat) / 5) [(6, 1), (8, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-948 : Rat) / 5) [(6, 1), (8, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 262 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0262_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0262
        rs_R010_ueqv_R010NYN_generator_30_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_30_0262 := by
  native_decide

/-- Coefficient term 263 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0263 : Poly :=
[
  term ((2892672 : Rat) / 2995) [(6, 1), (8, 1), (11, 2)]
]

/-- Partial product 263 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0263 : Poly :=
[
  term ((5785344 : Rat) / 2995) [(6, 1), (8, 1), (11, 2), (12, 1), (14, 1)],
  term ((-2892672 : Rat) / 2995) [(6, 1), (8, 1), (11, 2), (12, 2)],
  term ((5785344 : Rat) / 2995) [(6, 1), (8, 1), (11, 2), (13, 1), (15, 1)],
  term ((-2892672 : Rat) / 2995) [(6, 1), (8, 1), (11, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 263 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0263_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0263
        rs_R010_ueqv_R010NYN_generator_30_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_30_0263 := by
  native_decide

/-- Coefficient term 264 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0264 : Poly :=
[
  term ((2423808 : Rat) / 2995) [(6, 1), (8, 1), (15, 2)]
]

/-- Partial product 264 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0264 : Poly :=
[
  term ((4847616 : Rat) / 2995) [(6, 1), (8, 1), (12, 1), (14, 1), (15, 2)],
  term ((-2423808 : Rat) / 2995) [(6, 1), (8, 1), (12, 2), (15, 2)],
  term ((4847616 : Rat) / 2995) [(6, 1), (8, 1), (13, 1), (15, 3)],
  term ((-2423808 : Rat) / 2995) [(6, 1), (8, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 264 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0264_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0264
        rs_R010_ueqv_R010NYN_generator_30_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_30_0264 := by
  native_decide

/-- Coefficient term 265 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0265 : Poly :=
[
  term ((-534 : Rat) / 5) [(6, 1), (8, 1), (15, 2), (16, 1)]
]

/-- Partial product 265 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0265 : Poly :=
[
  term ((-1068 : Rat) / 5) [(6, 1), (8, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((534 : Rat) / 5) [(6, 1), (8, 1), (12, 2), (15, 2), (16, 1)],
  term ((-1068 : Rat) / 5) [(6, 1), (8, 1), (13, 1), (15, 3), (16, 1)],
  term ((534 : Rat) / 5) [(6, 1), (8, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 265 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0265_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0265
        rs_R010_ueqv_R010NYN_generator_30_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_30_0265 := by
  native_decide

/-- Coefficient term 266 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0266 : Poly :=
[
  term ((-21072 : Rat) / 599) [(7, 1), (9, 1)]
]

/-- Partial product 266 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0266 : Poly :=
[
  term ((-42144 : Rat) / 599) [(7, 1), (9, 1), (12, 1), (14, 1)],
  term ((21072 : Rat) / 599) [(7, 1), (9, 1), (12, 2)],
  term ((-42144 : Rat) / 599) [(7, 1), (9, 1), (13, 1), (15, 1)],
  term ((21072 : Rat) / 599) [(7, 1), (9, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 266 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0266_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0266
        rs_R010_ueqv_R010NYN_generator_30_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_30_0266 := by
  native_decide

/-- Coefficient term 267 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0267 : Poly :=
[
  term ((-4983552 : Rat) / 2995) [(7, 1), (9, 1), (11, 1), (15, 1)]
]

/-- Partial product 267 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0267 : Poly :=
[
  term ((-9967104 : Rat) / 2995) [(7, 1), (9, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((4983552 : Rat) / 2995) [(7, 1), (9, 1), (11, 1), (12, 2), (15, 1)],
  term ((-9967104 : Rat) / 2995) [(7, 1), (9, 1), (11, 1), (13, 1), (15, 2)],
  term ((4983552 : Rat) / 2995) [(7, 1), (9, 1), (11, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 267 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0267_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0267
        rs_R010_ueqv_R010NYN_generator_30_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_30_0267 := by
  native_decide

/-- Coefficient term 268 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0268 : Poly :=
[
  term ((948 : Rat) / 5) [(7, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 268 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0268 : Poly :=
[
  term ((1896 : Rat) / 5) [(7, 1), (9, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-948 : Rat) / 5) [(7, 1), (9, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((1896 : Rat) / 5) [(7, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-948 : Rat) / 5) [(7, 1), (9, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 268 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0268_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0268
        rs_R010_ueqv_R010NYN_generator_30_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_30_0268 := by
  native_decide

/-- Coefficient term 269 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0269 : Poly :=
[
  term ((2892672 : Rat) / 2995) [(7, 1), (9, 1), (11, 2)]
]

/-- Partial product 269 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0269 : Poly :=
[
  term ((5785344 : Rat) / 2995) [(7, 1), (9, 1), (11, 2), (12, 1), (14, 1)],
  term ((-2892672 : Rat) / 2995) [(7, 1), (9, 1), (11, 2), (12, 2)],
  term ((5785344 : Rat) / 2995) [(7, 1), (9, 1), (11, 2), (13, 1), (15, 1)],
  term ((-2892672 : Rat) / 2995) [(7, 1), (9, 1), (11, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 269 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0269_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0269
        rs_R010_ueqv_R010NYN_generator_30_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_30_0269 := by
  native_decide

/-- Coefficient term 270 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0270 : Poly :=
[
  term ((2423808 : Rat) / 2995) [(7, 1), (9, 1), (15, 2)]
]

/-- Partial product 270 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0270 : Poly :=
[
  term ((4847616 : Rat) / 2995) [(7, 1), (9, 1), (12, 1), (14, 1), (15, 2)],
  term ((-2423808 : Rat) / 2995) [(7, 1), (9, 1), (12, 2), (15, 2)],
  term ((4847616 : Rat) / 2995) [(7, 1), (9, 1), (13, 1), (15, 3)],
  term ((-2423808 : Rat) / 2995) [(7, 1), (9, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 270 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0270_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0270
        rs_R010_ueqv_R010NYN_generator_30_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_30_0270 := by
  native_decide

/-- Coefficient term 271 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0271 : Poly :=
[
  term ((-534 : Rat) / 5) [(7, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 271 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0271 : Poly :=
[
  term ((-1068 : Rat) / 5) [(7, 1), (9, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((534 : Rat) / 5) [(7, 1), (9, 1), (12, 2), (15, 2), (16, 1)],
  term ((-1068 : Rat) / 5) [(7, 1), (9, 1), (13, 1), (15, 3), (16, 1)],
  term ((534 : Rat) / 5) [(7, 1), (9, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 271 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0271_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0271
        rs_R010_ueqv_R010NYN_generator_30_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_30_0271 := by
  native_decide

/-- Coefficient term 272 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0272 : Poly :=
[
  term ((618 : Rat) / 599) [(8, 1)]
]

/-- Partial product 272 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0272 : Poly :=
[
  term ((1236 : Rat) / 599) [(8, 1), (12, 1), (14, 1)],
  term ((-618 : Rat) / 599) [(8, 1), (12, 2)],
  term ((1236 : Rat) / 599) [(8, 1), (13, 1), (15, 1)],
  term ((-618 : Rat) / 599) [(8, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 272 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0272_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0272
        rs_R010_ueqv_R010NYN_generator_30_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_30_0272 := by
  native_decide

/-- Coefficient term 273 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0273 : Poly :=
[
  term ((-776736 : Rat) / 599) [(8, 1), (9, 1), (11, 1)]
]

/-- Partial product 273 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0273 : Poly :=
[
  term ((-1553472 : Rat) / 599) [(8, 1), (9, 1), (11, 1), (12, 1), (14, 1)],
  term ((776736 : Rat) / 599) [(8, 1), (9, 1), (11, 1), (12, 2)],
  term ((-1553472 : Rat) / 599) [(8, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((776736 : Rat) / 599) [(8, 1), (9, 1), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 273 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0273_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0273
        rs_R010_ueqv_R010NYN_generator_30_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_30_0273 := by
  native_decide

/-- Coefficient term 274 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0274 : Poly :=
[
  term ((160704 : Rat) / 2995) [(8, 1), (9, 1), (11, 1), (14, 1)]
]

/-- Partial product 274 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0274 : Poly :=
[
  term ((321408 : Rat) / 2995) [(8, 1), (9, 1), (11, 1), (12, 1), (14, 2)],
  term ((-160704 : Rat) / 2995) [(8, 1), (9, 1), (11, 1), (12, 2), (14, 1)],
  term ((321408 : Rat) / 2995) [(8, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-160704 : Rat) / 2995) [(8, 1), (9, 1), (11, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 274 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0274_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0274
        rs_R010_ueqv_R010NYN_generator_30_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_30_0274 := by
  native_decide

/-- Coefficient term 275 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0275 : Poly :=
[
  term ((-32832 : Rat) / 2995) [(8, 1), (9, 1), (14, 1), (15, 1)]
]

/-- Partial product 275 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0275 : Poly :=
[
  term ((-65664 : Rat) / 2995) [(8, 1), (9, 1), (12, 1), (14, 2), (15, 1)],
  term ((32832 : Rat) / 2995) [(8, 1), (9, 1), (12, 2), (14, 1), (15, 1)],
  term ((-65664 : Rat) / 2995) [(8, 1), (9, 1), (13, 1), (14, 1), (15, 2)],
  term ((32832 : Rat) / 2995) [(8, 1), (9, 1), (13, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 275 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0275_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0275
        rs_R010_ueqv_R010NYN_generator_30_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_30_0275 := by
  native_decide

/-- Coefficient term 276 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0276 : Poly :=
[
  term ((-4 : Rat) / 5) [(8, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 276 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0276 : Poly :=
[
  term ((-8 : Rat) / 5) [(8, 1), (9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((4 : Rat) / 5) [(8, 1), (9, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-8 : Rat) / 5) [(8, 1), (9, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((4 : Rat) / 5) [(8, 1), (9, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 276 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0276_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0276
        rs_R010_ueqv_R010NYN_generator_30_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_30_0276 := by
  native_decide

/-- Coefficient term 277 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0277 : Poly :=
[
  term ((849120 : Rat) / 599) [(8, 1), (9, 1), (15, 1)]
]

/-- Partial product 277 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0277 : Poly :=
[
  term ((1698240 : Rat) / 599) [(8, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-849120 : Rat) / 599) [(8, 1), (9, 1), (12, 2), (15, 1)],
  term ((1698240 : Rat) / 599) [(8, 1), (9, 1), (13, 1), (15, 2)],
  term ((-849120 : Rat) / 599) [(8, 1), (9, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 277 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0277_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0277
        rs_R010_ueqv_R010NYN_generator_30_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_30_0277 := by
  native_decide

/-- Coefficient term 278 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0278 : Poly :=
[
  term (-192 : Rat) [(8, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 278 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0278 : Poly :=
[
  term (-384 : Rat) [(8, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term (192 : Rat) [(8, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term (-384 : Rat) [(8, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term (192 : Rat) [(8, 1), (9, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 278 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0278_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0278
        rs_R010_ueqv_R010NYN_generator_30_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_30_0278 := by
  native_decide

/-- Coefficient term 279 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0279 : Poly :=
[
  term ((4956 : Rat) / 599) [(8, 1), (10, 1)]
]

/-- Partial product 279 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0279 : Poly :=
[
  term ((9912 : Rat) / 599) [(8, 1), (10, 1), (12, 1), (14, 1)],
  term ((-4956 : Rat) / 599) [(8, 1), (10, 1), (12, 2)],
  term ((9912 : Rat) / 599) [(8, 1), (10, 1), (13, 1), (15, 1)],
  term ((-4956 : Rat) / 599) [(8, 1), (10, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 279 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0279_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0279
        rs_R010_ueqv_R010NYN_generator_30_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_30_0279 := by
  native_decide

/-- Coefficient term 280 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0280 : Poly :=
[
  term ((4983552 : Rat) / 2995) [(8, 1), (10, 1), (11, 1), (15, 1)]
]

/-- Partial product 280 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0280 : Poly :=
[
  term ((9967104 : Rat) / 2995) [(8, 1), (10, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-4983552 : Rat) / 2995) [(8, 1), (10, 1), (11, 1), (12, 2), (15, 1)],
  term ((9967104 : Rat) / 2995) [(8, 1), (10, 1), (11, 1), (13, 1), (15, 2)],
  term ((-4983552 : Rat) / 2995) [(8, 1), (10, 1), (11, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 280 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0280_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0280
        rs_R010_ueqv_R010NYN_generator_30_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_30_0280 := by
  native_decide

/-- Coefficient term 281 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0281 : Poly :=
[
  term ((-948 : Rat) / 5) [(8, 1), (10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 281 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0281 : Poly :=
[
  term ((-1896 : Rat) / 5) [(8, 1), (10, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((948 : Rat) / 5) [(8, 1), (10, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-1896 : Rat) / 5) [(8, 1), (10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((948 : Rat) / 5) [(8, 1), (10, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 281 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0281_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0281
        rs_R010_ueqv_R010NYN_generator_30_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_30_0281 := by
  native_decide

/-- Coefficient term 282 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0282 : Poly :=
[
  term ((-2892672 : Rat) / 2995) [(8, 1), (10, 1), (11, 2)]
]

/-- Partial product 282 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0282 : Poly :=
[
  term ((-5785344 : Rat) / 2995) [(8, 1), (10, 1), (11, 2), (12, 1), (14, 1)],
  term ((2892672 : Rat) / 2995) [(8, 1), (10, 1), (11, 2), (12, 2)],
  term ((-5785344 : Rat) / 2995) [(8, 1), (10, 1), (11, 2), (13, 1), (15, 1)],
  term ((2892672 : Rat) / 2995) [(8, 1), (10, 1), (11, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 282 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0282_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0282
        rs_R010_ueqv_R010NYN_generator_30_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_30_0282 := by
  native_decide

/-- Coefficient term 283 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0283 : Poly :=
[
  term ((-2423808 : Rat) / 2995) [(8, 1), (10, 1), (15, 2)]
]

/-- Partial product 283 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0283 : Poly :=
[
  term ((-4847616 : Rat) / 2995) [(8, 1), (10, 1), (12, 1), (14, 1), (15, 2)],
  term ((2423808 : Rat) / 2995) [(8, 1), (10, 1), (12, 2), (15, 2)],
  term ((-4847616 : Rat) / 2995) [(8, 1), (10, 1), (13, 1), (15, 3)],
  term ((2423808 : Rat) / 2995) [(8, 1), (10, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 283 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0283_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0283
        rs_R010_ueqv_R010NYN_generator_30_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_30_0283 := by
  native_decide

/-- Coefficient term 284 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0284 : Poly :=
[
  term ((534 : Rat) / 5) [(8, 1), (10, 1), (15, 2), (16, 1)]
]

/-- Partial product 284 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0284 : Poly :=
[
  term ((1068 : Rat) / 5) [(8, 1), (10, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-534 : Rat) / 5) [(8, 1), (10, 1), (12, 2), (15, 2), (16, 1)],
  term ((1068 : Rat) / 5) [(8, 1), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((-534 : Rat) / 5) [(8, 1), (10, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 284 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0284_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0284
        rs_R010_ueqv_R010NYN_generator_30_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_30_0284 := by
  native_decide

/-- Coefficient term 285 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0285 : Poly :=
[
  term ((-723168 : Rat) / 2995) [(8, 1), (11, 1), (13, 1)]
]

/-- Partial product 285 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0285 : Poly :=
[
  term ((-1446336 : Rat) / 2995) [(8, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((723168 : Rat) / 2995) [(8, 1), (11, 1), (12, 2), (13, 1)],
  term ((-1446336 : Rat) / 2995) [(8, 1), (11, 1), (13, 2), (15, 1)],
  term ((723168 : Rat) / 2995) [(8, 1), (11, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 285 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0285_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0285
        rs_R010_ueqv_R010NYN_generator_30_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_30_0285 := by
  native_decide

/-- Coefficient term 286 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0286 : Poly :=
[
  term ((857088 : Rat) / 2995) [(8, 1), (11, 1), (13, 1), (14, 1)]
]

/-- Partial product 286 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0286 : Poly :=
[
  term ((1714176 : Rat) / 2995) [(8, 1), (11, 1), (12, 1), (13, 1), (14, 2)],
  term ((-857088 : Rat) / 2995) [(8, 1), (11, 1), (12, 2), (13, 1), (14, 1)],
  term ((1714176 : Rat) / 2995) [(8, 1), (11, 1), (13, 2), (14, 1), (15, 1)],
  term ((-857088 : Rat) / 2995) [(8, 1), (11, 1), (13, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 286 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0286_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0286
        rs_R010_ueqv_R010NYN_generator_30_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_30_0286 := by
  native_decide

/-- Coefficient term 287 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0287 : Poly :=
[
  term ((1076016 : Rat) / 2995) [(8, 1), (11, 1), (14, 1), (15, 1)]
]

/-- Partial product 287 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0287 : Poly :=
[
  term ((2152032 : Rat) / 2995) [(8, 1), (11, 1), (12, 1), (14, 2), (15, 1)],
  term ((-1076016 : Rat) / 2995) [(8, 1), (11, 1), (12, 2), (14, 1), (15, 1)],
  term ((2152032 : Rat) / 2995) [(8, 1), (11, 1), (13, 1), (14, 1), (15, 2)],
  term ((-1076016 : Rat) / 2995) [(8, 1), (11, 1), (13, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 287 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0287_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0287
        rs_R010_ueqv_R010NYN_generator_30_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_30_0287 := by
  native_decide

/-- Coefficient term 288 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0288 : Poly :=
[
  term ((-398 : Rat) / 5) [(8, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 288 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0288 : Poly :=
[
  term ((-796 : Rat) / 5) [(8, 1), (11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((398 : Rat) / 5) [(8, 1), (11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-796 : Rat) / 5) [(8, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((398 : Rat) / 5) [(8, 1), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 288 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0288_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0288
        rs_R010_ueqv_R010NYN_generator_30_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_30_0288 := by
  native_decide

/-- Coefficient term 289 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0289 : Poly :=
[
  term ((5468832 : Rat) / 2995) [(8, 1), (11, 1), (15, 1)]
]

/-- Partial product 289 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0289 : Poly :=
[
  term ((10937664 : Rat) / 2995) [(8, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-5468832 : Rat) / 2995) [(8, 1), (11, 1), (12, 2), (15, 1)],
  term ((10937664 : Rat) / 2995) [(8, 1), (11, 1), (13, 1), (15, 2)],
  term ((-5468832 : Rat) / 2995) [(8, 1), (11, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 289 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0289_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0289
        rs_R010_ueqv_R010NYN_generator_30_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_30_0289 := by
  native_decide

/-- Coefficient term 290 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0290 : Poly :=
[
  term ((-187 : Rat) / 5) [(8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 290 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0290 : Poly :=
[
  term ((-374 : Rat) / 5) [(8, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((187 : Rat) / 5) [(8, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-374 : Rat) / 5) [(8, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((187 : Rat) / 5) [(8, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 290 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0290_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0290
        rs_R010_ueqv_R010NYN_generator_30_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_30_0290 := by
  native_decide

/-- Coefficient term 291 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0291 : Poly :=
[
  term ((-723168 : Rat) / 2995) [(8, 1), (11, 2)]
]

/-- Partial product 291 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0291 : Poly :=
[
  term ((-1446336 : Rat) / 2995) [(8, 1), (11, 2), (12, 1), (14, 1)],
  term ((723168 : Rat) / 2995) [(8, 1), (11, 2), (12, 2)],
  term ((-1446336 : Rat) / 2995) [(8, 1), (11, 2), (13, 1), (15, 1)],
  term ((723168 : Rat) / 2995) [(8, 1), (11, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 291 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0291_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0291
        rs_R010_ueqv_R010NYN_generator_30_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_30_0291 := by
  native_decide

/-- Coefficient term 292 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0292 : Poly :=
[
  term ((-1151712 : Rat) / 2995) [(8, 1), (11, 2), (14, 1)]
]

/-- Partial product 292 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0292 : Poly :=
[
  term ((-2303424 : Rat) / 2995) [(8, 1), (11, 2), (12, 1), (14, 2)],
  term ((1151712 : Rat) / 2995) [(8, 1), (11, 2), (12, 2), (14, 1)],
  term ((-2303424 : Rat) / 2995) [(8, 1), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((1151712 : Rat) / 2995) [(8, 1), (11, 2), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 292 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0292_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0292
        rs_R010_ueqv_R010NYN_generator_30_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_30_0292 := by
  native_decide

/-- Coefficient term 293 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0293 : Poly :=
[
  term ((-919104 : Rat) / 2995) [(8, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 293 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0293 : Poly :=
[
  term ((-1838208 : Rat) / 2995) [(8, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((919104 : Rat) / 2995) [(8, 1), (12, 2), (13, 1), (14, 1), (15, 1)],
  term ((-1838208 : Rat) / 2995) [(8, 1), (13, 2), (14, 1), (15, 2)],
  term ((919104 : Rat) / 2995) [(8, 1), (13, 3), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 293 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0293_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0293
        rs_R010_ueqv_R010NYN_generator_30_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_30_0293 := by
  native_decide

/-- Coefficient term 294 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0294 : Poly :=
[
  term ((212 : Rat) / 5) [(8, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 294 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0294 : Poly :=
[
  term ((424 : Rat) / 5) [(8, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-212 : Rat) / 5) [(8, 1), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((424 : Rat) / 5) [(8, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-212 : Rat) / 5) [(8, 1), (13, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 294 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0294_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0294
        rs_R010_ueqv_R010NYN_generator_30_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_30_0294 := by
  native_decide

/-- Coefficient term 295 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0295 : Poly :=
[
  term ((728064 : Rat) / 2995) [(8, 1), (13, 1), (15, 1)]
]

/-- Partial product 295 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0295 : Poly :=
[
  term ((1456128 : Rat) / 2995) [(8, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-728064 : Rat) / 2995) [(8, 1), (12, 2), (13, 1), (15, 1)],
  term ((1456128 : Rat) / 2995) [(8, 1), (13, 2), (15, 2)],
  term ((-728064 : Rat) / 2995) [(8, 1), (13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 295 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0295_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0295
        rs_R010_ueqv_R010NYN_generator_30_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_30_0295 := by
  native_decide

/-- Coefficient term 296 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0296 : Poly :=
[
  term ((-187 : Rat) / 5) [(8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 296 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0296 : Poly :=
[
  term ((-374 : Rat) / 5) [(8, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((187 : Rat) / 5) [(8, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-374 : Rat) / 5) [(8, 1), (13, 2), (15, 2), (16, 1)],
  term ((187 : Rat) / 5) [(8, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 296 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0296_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0296
        rs_R010_ueqv_R010NYN_generator_30_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_30_0296 := by
  native_decide

/-- Coefficient term 297 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0297 : Poly :=
[
  term ((15372 : Rat) / 599) [(8, 1), (14, 1)]
]

/-- Partial product 297 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0297 : Poly :=
[
  term ((30744 : Rat) / 599) [(8, 1), (12, 1), (14, 2)],
  term ((-15372 : Rat) / 599) [(8, 1), (12, 2), (14, 1)],
  term ((30744 : Rat) / 599) [(8, 1), (13, 1), (14, 1), (15, 1)],
  term ((-15372 : Rat) / 599) [(8, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 297 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0297_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0297
        rs_R010_ueqv_R010NYN_generator_30_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_30_0297 := by
  native_decide

/-- Coefficient term 298 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0298 : Poly :=
[
  term ((-5221824 : Rat) / 2995) [(8, 1), (15, 2)]
]

/-- Partial product 298 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0298 : Poly :=
[
  term ((-10443648 : Rat) / 2995) [(8, 1), (12, 1), (14, 1), (15, 2)],
  term ((5221824 : Rat) / 2995) [(8, 1), (12, 2), (15, 2)],
  term ((-10443648 : Rat) / 2995) [(8, 1), (13, 1), (15, 3)],
  term ((5221824 : Rat) / 2995) [(8, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 298 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0298_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0298
        rs_R010_ueqv_R010NYN_generator_30_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_30_0298 := by
  native_decide

/-- Coefficient term 299 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0299 : Poly :=
[
  term ((1142 : Rat) / 5) [(8, 1), (15, 2), (16, 1)]
]

/-- Partial product 299 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0299 : Poly :=
[
  term ((2284 : Rat) / 5) [(8, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1142 : Rat) / 5) [(8, 1), (12, 2), (15, 2), (16, 1)],
  term ((2284 : Rat) / 5) [(8, 1), (13, 1), (15, 3), (16, 1)],
  term ((-1142 : Rat) / 5) [(8, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 299 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0299_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0299
        rs_R010_ueqv_R010NYN_generator_30_0200_0299 =
      rs_R010_ueqv_R010NYN_partial_30_0299 := by
  native_decide

/-- Partial products in this block. -/
def rs_R010_ueqv_R010NYN_partials_30_0200_0299 : List Poly :=
[
  rs_R010_ueqv_R010NYN_partial_30_0200,
  rs_R010_ueqv_R010NYN_partial_30_0201,
  rs_R010_ueqv_R010NYN_partial_30_0202,
  rs_R010_ueqv_R010NYN_partial_30_0203,
  rs_R010_ueqv_R010NYN_partial_30_0204,
  rs_R010_ueqv_R010NYN_partial_30_0205,
  rs_R010_ueqv_R010NYN_partial_30_0206,
  rs_R010_ueqv_R010NYN_partial_30_0207,
  rs_R010_ueqv_R010NYN_partial_30_0208,
  rs_R010_ueqv_R010NYN_partial_30_0209,
  rs_R010_ueqv_R010NYN_partial_30_0210,
  rs_R010_ueqv_R010NYN_partial_30_0211,
  rs_R010_ueqv_R010NYN_partial_30_0212,
  rs_R010_ueqv_R010NYN_partial_30_0213,
  rs_R010_ueqv_R010NYN_partial_30_0214,
  rs_R010_ueqv_R010NYN_partial_30_0215,
  rs_R010_ueqv_R010NYN_partial_30_0216,
  rs_R010_ueqv_R010NYN_partial_30_0217,
  rs_R010_ueqv_R010NYN_partial_30_0218,
  rs_R010_ueqv_R010NYN_partial_30_0219,
  rs_R010_ueqv_R010NYN_partial_30_0220,
  rs_R010_ueqv_R010NYN_partial_30_0221,
  rs_R010_ueqv_R010NYN_partial_30_0222,
  rs_R010_ueqv_R010NYN_partial_30_0223,
  rs_R010_ueqv_R010NYN_partial_30_0224,
  rs_R010_ueqv_R010NYN_partial_30_0225,
  rs_R010_ueqv_R010NYN_partial_30_0226,
  rs_R010_ueqv_R010NYN_partial_30_0227,
  rs_R010_ueqv_R010NYN_partial_30_0228,
  rs_R010_ueqv_R010NYN_partial_30_0229,
  rs_R010_ueqv_R010NYN_partial_30_0230,
  rs_R010_ueqv_R010NYN_partial_30_0231,
  rs_R010_ueqv_R010NYN_partial_30_0232,
  rs_R010_ueqv_R010NYN_partial_30_0233,
  rs_R010_ueqv_R010NYN_partial_30_0234,
  rs_R010_ueqv_R010NYN_partial_30_0235,
  rs_R010_ueqv_R010NYN_partial_30_0236,
  rs_R010_ueqv_R010NYN_partial_30_0237,
  rs_R010_ueqv_R010NYN_partial_30_0238,
  rs_R010_ueqv_R010NYN_partial_30_0239,
  rs_R010_ueqv_R010NYN_partial_30_0240,
  rs_R010_ueqv_R010NYN_partial_30_0241,
  rs_R010_ueqv_R010NYN_partial_30_0242,
  rs_R010_ueqv_R010NYN_partial_30_0243,
  rs_R010_ueqv_R010NYN_partial_30_0244,
  rs_R010_ueqv_R010NYN_partial_30_0245,
  rs_R010_ueqv_R010NYN_partial_30_0246,
  rs_R010_ueqv_R010NYN_partial_30_0247,
  rs_R010_ueqv_R010NYN_partial_30_0248,
  rs_R010_ueqv_R010NYN_partial_30_0249,
  rs_R010_ueqv_R010NYN_partial_30_0250,
  rs_R010_ueqv_R010NYN_partial_30_0251,
  rs_R010_ueqv_R010NYN_partial_30_0252,
  rs_R010_ueqv_R010NYN_partial_30_0253,
  rs_R010_ueqv_R010NYN_partial_30_0254,
  rs_R010_ueqv_R010NYN_partial_30_0255,
  rs_R010_ueqv_R010NYN_partial_30_0256,
  rs_R010_ueqv_R010NYN_partial_30_0257,
  rs_R010_ueqv_R010NYN_partial_30_0258,
  rs_R010_ueqv_R010NYN_partial_30_0259,
  rs_R010_ueqv_R010NYN_partial_30_0260,
  rs_R010_ueqv_R010NYN_partial_30_0261,
  rs_R010_ueqv_R010NYN_partial_30_0262,
  rs_R010_ueqv_R010NYN_partial_30_0263,
  rs_R010_ueqv_R010NYN_partial_30_0264,
  rs_R010_ueqv_R010NYN_partial_30_0265,
  rs_R010_ueqv_R010NYN_partial_30_0266,
  rs_R010_ueqv_R010NYN_partial_30_0267,
  rs_R010_ueqv_R010NYN_partial_30_0268,
  rs_R010_ueqv_R010NYN_partial_30_0269,
  rs_R010_ueqv_R010NYN_partial_30_0270,
  rs_R010_ueqv_R010NYN_partial_30_0271,
  rs_R010_ueqv_R010NYN_partial_30_0272,
  rs_R010_ueqv_R010NYN_partial_30_0273,
  rs_R010_ueqv_R010NYN_partial_30_0274,
  rs_R010_ueqv_R010NYN_partial_30_0275,
  rs_R010_ueqv_R010NYN_partial_30_0276,
  rs_R010_ueqv_R010NYN_partial_30_0277,
  rs_R010_ueqv_R010NYN_partial_30_0278,
  rs_R010_ueqv_R010NYN_partial_30_0279,
  rs_R010_ueqv_R010NYN_partial_30_0280,
  rs_R010_ueqv_R010NYN_partial_30_0281,
  rs_R010_ueqv_R010NYN_partial_30_0282,
  rs_R010_ueqv_R010NYN_partial_30_0283,
  rs_R010_ueqv_R010NYN_partial_30_0284,
  rs_R010_ueqv_R010NYN_partial_30_0285,
  rs_R010_ueqv_R010NYN_partial_30_0286,
  rs_R010_ueqv_R010NYN_partial_30_0287,
  rs_R010_ueqv_R010NYN_partial_30_0288,
  rs_R010_ueqv_R010NYN_partial_30_0289,
  rs_R010_ueqv_R010NYN_partial_30_0290,
  rs_R010_ueqv_R010NYN_partial_30_0291,
  rs_R010_ueqv_R010NYN_partial_30_0292,
  rs_R010_ueqv_R010NYN_partial_30_0293,
  rs_R010_ueqv_R010NYN_partial_30_0294,
  rs_R010_ueqv_R010NYN_partial_30_0295,
  rs_R010_ueqv_R010NYN_partial_30_0296,
  rs_R010_ueqv_R010NYN_partial_30_0297,
  rs_R010_ueqv_R010NYN_partial_30_0298,
  rs_R010_ueqv_R010NYN_partial_30_0299
]

/-- Sum of partial products in this block. -/
def rs_R010_ueqv_R010NYN_block_30_0200_0299 : Poly :=
[
  term ((-1272 : Rat) / 5) [(3, 1), (8, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((636 : Rat) / 5) [(3, 1), (8, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-1272 : Rat) / 5) [(3, 1), (8, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((636 : Rat) / 5) [(3, 1), (8, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-5142528 : Rat) / 2995) [(3, 1), (8, 1), (11, 1), (12, 1), (14, 1)],
  term ((-3428352 : Rat) / 2995) [(3, 1), (8, 1), (11, 1), (12, 1), (14, 2)],
  term ((2571264 : Rat) / 2995) [(3, 1), (8, 1), (11, 1), (12, 2)],
  term ((1714176 : Rat) / 2995) [(3, 1), (8, 1), (11, 1), (12, 2), (14, 1)],
  term ((-3428352 : Rat) / 2995) [(3, 1), (8, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-5142528 : Rat) / 2995) [(3, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((2571264 : Rat) / 2995) [(3, 1), (8, 1), (11, 1), (13, 2)],
  term ((1714176 : Rat) / 2995) [(3, 1), (8, 1), (11, 1), (13, 2), (14, 1)],
  term ((5514624 : Rat) / 2995) [(3, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((-1272 : Rat) / 5) [(3, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((3676416 : Rat) / 2995) [(3, 1), (8, 1), (12, 1), (14, 2), (15, 1)],
  term ((-848 : Rat) / 5) [(3, 1), (8, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1838208 : Rat) / 2995) [(3, 1), (8, 1), (12, 2), (14, 1), (15, 1)],
  term ((424 : Rat) / 5) [(3, 1), (8, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-2757312 : Rat) / 2995) [(3, 1), (8, 1), (12, 2), (15, 1)],
  term ((636 : Rat) / 5) [(3, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((3676416 : Rat) / 2995) [(3, 1), (8, 1), (13, 1), (14, 1), (15, 2)],
  term ((-848 : Rat) / 5) [(3, 1), (8, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((5514624 : Rat) / 2995) [(3, 1), (8, 1), (13, 1), (15, 2)],
  term ((-1272 : Rat) / 5) [(3, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1838208 : Rat) / 2995) [(3, 1), (8, 1), (13, 2), (14, 1), (15, 1)],
  term ((424 : Rat) / 5) [(3, 1), (8, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-2757312 : Rat) / 2995) [(3, 1), (8, 1), (13, 2), (15, 1)],
  term ((636 : Rat) / 5) [(3, 1), (8, 1), (13, 2), (15, 1), (16, 1)],
  term ((-210816 : Rat) / 599) [(3, 1), (9, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((696 : Rat) / 5) [(3, 1), (9, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((916992 : Rat) / 2995) [(3, 1), (9, 1), (11, 1), (12, 1), (14, 2), (15, 1)],
  term ((-144 : Rat) / 5) [(3, 1), (9, 1), (11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-458496 : Rat) / 2995) [(3, 1), (9, 1), (11, 1), (12, 2), (14, 1), (15, 1)],
  term ((72 : Rat) / 5) [(3, 1), (9, 1), (11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((105408 : Rat) / 599) [(3, 1), (9, 1), (11, 1), (12, 2), (15, 1)],
  term ((-348 : Rat) / 5) [(3, 1), (9, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((916992 : Rat) / 2995) [(3, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 2)],
  term ((-144 : Rat) / 5) [(3, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-210816 : Rat) / 599) [(3, 1), (9, 1), (11, 1), (13, 1), (15, 2)],
  term ((696 : Rat) / 5) [(3, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-458496 : Rat) / 2995) [(3, 1), (9, 1), (11, 1), (13, 2), (14, 1), (15, 1)],
  term ((72 : Rat) / 5) [(3, 1), (9, 1), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((105408 : Rat) / 599) [(3, 1), (9, 1), (11, 1), (13, 2), (15, 1)],
  term ((-348 : Rat) / 5) [(3, 1), (9, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((964224 : Rat) / 2995) [(3, 1), (9, 1), (11, 2), (12, 1), (14, 1)],
  term ((-642816 : Rat) / 2995) [(3, 1), (9, 1), (11, 2), (12, 1), (14, 2)],
  term ((-482112 : Rat) / 2995) [(3, 1), (9, 1), (11, 2), (12, 2)],
  term ((321408 : Rat) / 2995) [(3, 1), (9, 1), (11, 2), (12, 2), (14, 1)],
  term ((-642816 : Rat) / 2995) [(3, 1), (9, 1), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((964224 : Rat) / 2995) [(3, 1), (9, 1), (11, 2), (13, 1), (15, 1)],
  term ((-482112 : Rat) / 2995) [(3, 1), (9, 1), (11, 2), (13, 2)],
  term ((321408 : Rat) / 2995) [(3, 1), (9, 1), (11, 2), (13, 2), (14, 1)],
  term (-36 : Rat) [(3, 1), (9, 1), (12, 1), (14, 1)],
  term ((229824 : Rat) / 2995) [(3, 1), (9, 1), (12, 1), (14, 1), (15, 2)],
  term ((28 : Rat) / 5) [(3, 1), (9, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term (24 : Rat) [(3, 1), (9, 1), (12, 1), (14, 2)],
  term ((-196992 : Rat) / 2995) [(3, 1), (9, 1), (12, 1), (14, 2), (15, 2)],
  term ((-24 : Rat) / 5) [(3, 1), (9, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term (18 : Rat) [(3, 1), (9, 1), (12, 2)],
  term (-12 : Rat) [(3, 1), (9, 1), (12, 2), (14, 1)],
  term ((98496 : Rat) / 2995) [(3, 1), (9, 1), (12, 2), (14, 1), (15, 2)],
  term ((12 : Rat) / 5) [(3, 1), (9, 1), (12, 2), (14, 1), (15, 2), (16, 1)],
  term ((-114912 : Rat) / 2995) [(3, 1), (9, 1), (12, 2), (15, 2)],
  term ((-14 : Rat) / 5) [(3, 1), (9, 1), (12, 2), (15, 2), (16, 1)],
  term (24 : Rat) [(3, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((-196992 : Rat) / 2995) [(3, 1), (9, 1), (13, 1), (14, 1), (15, 3)],
  term ((-24 : Rat) / 5) [(3, 1), (9, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term (-36 : Rat) [(3, 1), (9, 1), (13, 1), (15, 1)],
  term ((229824 : Rat) / 2995) [(3, 1), (9, 1), (13, 1), (15, 3)],
  term ((28 : Rat) / 5) [(3, 1), (9, 1), (13, 1), (15, 3), (16, 1)],
  term (18 : Rat) [(3, 1), (9, 1), (13, 2)],
  term (-12 : Rat) [(3, 1), (9, 1), (13, 2), (14, 1)],
  term ((98496 : Rat) / 2995) [(3, 1), (9, 1), (13, 2), (14, 1), (15, 2)],
  term ((12 : Rat) / 5) [(3, 1), (9, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-114912 : Rat) / 2995) [(3, 1), (9, 1), (13, 2), (15, 2)],
  term ((-14 : Rat) / 5) [(3, 1), (9, 1), (13, 2), (15, 2), (16, 1)],
  term ((5142528 : Rat) / 2995) [(3, 1), (10, 1), (11, 1), (12, 1), (14, 2)],
  term ((-2571264 : Rat) / 2995) [(3, 1), (10, 1), (11, 1), (12, 2), (14, 1)],
  term ((5142528 : Rat) / 2995) [(3, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-2571264 : Rat) / 2995) [(3, 1), (10, 1), (11, 1), (13, 2), (14, 1)],
  term (24 : Rat) [(3, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term (-24 : Rat) [(3, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5514624 : Rat) / 2995) [(3, 1), (10, 1), (12, 1), (14, 2), (15, 1)],
  term ((1272 : Rat) / 5) [(3, 1), (10, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((2757312 : Rat) / 2995) [(3, 1), (10, 1), (12, 2), (14, 1), (15, 1)],
  term ((-636 : Rat) / 5) [(3, 1), (10, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(3, 1), (10, 1), (12, 2), (15, 1)],
  term (12 : Rat) [(3, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-5514624 : Rat) / 2995) [(3, 1), (10, 1), (13, 1), (14, 1), (15, 2)],
  term ((1272 : Rat) / 5) [(3, 1), (10, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term (24 : Rat) [(3, 1), (10, 1), (13, 1), (15, 2)],
  term (-24 : Rat) [(3, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((2757312 : Rat) / 2995) [(3, 1), (10, 1), (13, 2), (14, 1), (15, 1)],
  term ((-636 : Rat) / 5) [(3, 1), (10, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(3, 1), (10, 1), (13, 2), (15, 1)],
  term (12 : Rat) [(3, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-5142528 : Rat) / 2995) [(3, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term (12 : Rat) [(3, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4164912 : Rat) / 2995) [(3, 1), (11, 1), (12, 1), (14, 1)],
  term ((-14696544 : Rat) / 2995) [(3, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((2826 : Rat) / 5) [(3, 1), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((4490784 : Rat) / 2995) [(3, 1), (11, 1), (12, 1), (14, 2)],
  term ((-732672 : Rat) / 2995) [(3, 1), (11, 1), (12, 1), (14, 2), (15, 2)],
  term ((396 : Rat) / 5) [(3, 1), (11, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((2082456 : Rat) / 2995) [(3, 1), (11, 1), (12, 2)],
  term ((2571264 : Rat) / 2995) [(3, 1), (11, 1), (12, 2), (13, 1), (15, 1)],
  term (-6 : Rat) [(3, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-2245392 : Rat) / 2995) [(3, 1), (11, 1), (12, 2), (14, 1)],
  term ((366336 : Rat) / 2995) [(3, 1), (11, 1), (12, 2), (14, 1), (15, 2)],
  term ((-198 : Rat) / 5) [(3, 1), (11, 1), (12, 2), (14, 1), (15, 2), (16, 1)],
  term ((7348272 : Rat) / 2995) [(3, 1), (11, 1), (12, 2), (15, 2)],
  term ((-1413 : Rat) / 5) [(3, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((4490784 : Rat) / 2995) [(3, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-732672 : Rat) / 2995) [(3, 1), (11, 1), (13, 1), (14, 1), (15, 3)],
  term ((396 : Rat) / 5) [(3, 1), (11, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-4164912 : Rat) / 2995) [(3, 1), (11, 1), (13, 1), (15, 1)],
  term ((-14696544 : Rat) / 2995) [(3, 1), (11, 1), (13, 1), (15, 3)],
  term ((2826 : Rat) / 5) [(3, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((2082456 : Rat) / 2995) [(3, 1), (11, 1), (13, 2)],
  term ((-2245392 : Rat) / 2995) [(3, 1), (11, 1), (13, 2), (14, 1)],
  term ((366336 : Rat) / 2995) [(3, 1), (11, 1), (13, 2), (14, 1), (15, 2)],
  term ((-198 : Rat) / 5) [(3, 1), (11, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((2205744 : Rat) / 2995) [(3, 1), (11, 1), (13, 2), (15, 2)],
  term ((-1353 : Rat) / 5) [(3, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((2571264 : Rat) / 2995) [(3, 1), (11, 1), (13, 3), (15, 1)],
  term (-6 : Rat) [(3, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((10070784 : Rat) / 2995) [(3, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((964224 : Rat) / 2995) [(3, 1), (11, 2), (12, 1), (14, 2), (15, 1)],
  term ((-482112 : Rat) / 2995) [(3, 1), (11, 2), (12, 2), (14, 1), (15, 1)],
  term ((-5035392 : Rat) / 2995) [(3, 1), (11, 2), (12, 2), (15, 1)],
  term ((964224 : Rat) / 2995) [(3, 1), (11, 2), (13, 1), (14, 1), (15, 2)],
  term ((10070784 : Rat) / 2995) [(3, 1), (11, 2), (13, 1), (15, 2)],
  term ((-482112 : Rat) / 2995) [(3, 1), (11, 2), (13, 2), (14, 1), (15, 1)],
  term ((-5035392 : Rat) / 2995) [(3, 1), (11, 2), (13, 2), (15, 1)],
  term ((-5334 : Rat) / 599) [(3, 1), (12, 1), (13, 1), (14, 1)],
  term ((5514624 : Rat) / 2995) [(3, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((-1272 : Rat) / 5) [(3, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((4058986 : Rat) / 2995) [(3, 1), (12, 1), (14, 1), (15, 1)],
  term ((-988 : Rat) / 5) [(3, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((4847616 : Rat) / 2995) [(3, 1), (12, 1), (14, 1), (15, 3)],
  term ((-1068 : Rat) / 5) [(3, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((-4672112 : Rat) / 2995) [(3, 1), (12, 1), (14, 2), (15, 1)],
  term ((1076 : Rat) / 5) [(3, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((2667 : Rat) / 599) [(3, 1), (12, 2), (13, 1)],
  term ((-2757312 : Rat) / 2995) [(3, 1), (12, 2), (13, 1), (15, 2)],
  term ((636 : Rat) / 5) [(3, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((2336056 : Rat) / 2995) [(3, 1), (12, 2), (14, 1), (15, 1)],
  term ((-538 : Rat) / 5) [(3, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-2029493 : Rat) / 2995) [(3, 1), (12, 2), (15, 1)],
  term ((494 : Rat) / 5) [(3, 1), (12, 2), (15, 1), (16, 1)],
  term ((-2423808 : Rat) / 2995) [(3, 1), (12, 2), (15, 3)],
  term ((534 : Rat) / 5) [(3, 1), (12, 2), (15, 3), (16, 1)],
  term ((-4672112 : Rat) / 2995) [(3, 1), (13, 1), (14, 1), (15, 2)],
  term ((1076 : Rat) / 5) [(3, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((4058986 : Rat) / 2995) [(3, 1), (13, 1), (15, 2)],
  term ((-988 : Rat) / 5) [(3, 1), (13, 1), (15, 2), (16, 1)],
  term ((4847616 : Rat) / 2995) [(3, 1), (13, 1), (15, 4)],
  term ((-1068 : Rat) / 5) [(3, 1), (13, 1), (15, 4), (16, 1)],
  term ((2336056 : Rat) / 2995) [(3, 1), (13, 2), (14, 1), (15, 1)],
  term ((-538 : Rat) / 5) [(3, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-2056163 : Rat) / 2995) [(3, 1), (13, 2), (15, 1)],
  term ((494 : Rat) / 5) [(3, 1), (13, 2), (15, 1), (16, 1)],
  term ((3090816 : Rat) / 2995) [(3, 1), (13, 2), (15, 3)],
  term ((-738 : Rat) / 5) [(3, 1), (13, 2), (15, 3), (16, 1)],
  term ((2667 : Rat) / 599) [(3, 1), (13, 3)],
  term ((-2757312 : Rat) / 2995) [(3, 1), (13, 3), (15, 2)],
  term ((636 : Rat) / 5) [(3, 1), (13, 3), (15, 2), (16, 1)],
  term ((5142528 : Rat) / 2995) [(3, 2), (11, 1), (12, 1), (14, 1), (15, 1)],
  term (-24 : Rat) [(3, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2571264 : Rat) / 2995) [(3, 2), (11, 1), (12, 2), (15, 1)],
  term (12 : Rat) [(3, 2), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((5142528 : Rat) / 2995) [(3, 2), (11, 1), (13, 1), (15, 2)],
  term (-24 : Rat) [(3, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-2571264 : Rat) / 2995) [(3, 2), (11, 1), (13, 2), (15, 1)],
  term (12 : Rat) [(3, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term (12 : Rat) [(3, 2), (12, 1), (14, 1)],
  term ((-5514624 : Rat) / 2995) [(3, 2), (12, 1), (14, 1), (15, 2)],
  term ((1272 : Rat) / 5) [(3, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term (-6 : Rat) [(3, 2), (12, 2)],
  term ((2757312 : Rat) / 2995) [(3, 2), (12, 2), (15, 2)],
  term ((-636 : Rat) / 5) [(3, 2), (12, 2), (15, 2), (16, 1)],
  term (12 : Rat) [(3, 2), (13, 1), (15, 1)],
  term ((-5514624 : Rat) / 2995) [(3, 2), (13, 1), (15, 3)],
  term ((1272 : Rat) / 5) [(3, 2), (13, 1), (15, 3), (16, 1)],
  term (-6 : Rat) [(3, 2), (13, 2)],
  term ((2757312 : Rat) / 2995) [(3, 2), (13, 2), (15, 2)],
  term ((-636 : Rat) / 5) [(3, 2), (13, 2), (15, 2), (16, 1)],
  term ((5915904 : Rat) / 2995) [(4, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-2024 : Rat) / 5) [(4, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2957952 : Rat) / 2995) [(4, 1), (8, 1), (11, 1), (12, 2), (15, 1)],
  term ((1012 : Rat) / 5) [(4, 1), (8, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((5915904 : Rat) / 2995) [(4, 1), (8, 1), (11, 1), (13, 1), (15, 2)],
  term ((-2024 : Rat) / 5) [(4, 1), (8, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-2957952 : Rat) / 2995) [(4, 1), (8, 1), (11, 1), (13, 2), (15, 1)],
  term ((1012 : Rat) / 5) [(4, 1), (8, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-5999616 : Rat) / 2995) [(4, 1), (8, 1), (11, 2), (12, 1), (14, 1)],
  term ((2999808 : Rat) / 2995) [(4, 1), (8, 1), (11, 2), (12, 2)],
  term ((-5999616 : Rat) / 2995) [(4, 1), (8, 1), (11, 2), (13, 1), (15, 1)],
  term ((2999808 : Rat) / 2995) [(4, 1), (8, 1), (11, 2), (13, 2)],
  term ((46608 : Rat) / 599) [(4, 1), (8, 1), (12, 1), (14, 1)],
  term ((-170688 : Rat) / 2995) [(4, 1), (8, 1), (12, 1), (14, 1), (15, 2)],
  term ((64 : Rat) / 5) [(4, 1), (8, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-23304 : Rat) / 599) [(4, 1), (8, 1), (12, 2)],
  term ((85344 : Rat) / 2995) [(4, 1), (8, 1), (12, 2), (15, 2)],
  term ((-32 : Rat) / 5) [(4, 1), (8, 1), (12, 2), (15, 2), (16, 1)],
  term ((46608 : Rat) / 599) [(4, 1), (8, 1), (13, 1), (15, 1)],
  term ((-170688 : Rat) / 2995) [(4, 1), (8, 1), (13, 1), (15, 3)],
  term ((64 : Rat) / 5) [(4, 1), (8, 1), (13, 1), (15, 3), (16, 1)],
  term ((-23304 : Rat) / 599) [(4, 1), (8, 1), (13, 2)],
  term ((85344 : Rat) / 2995) [(4, 1), (8, 1), (13, 2), (15, 2)],
  term ((-32 : Rat) / 5) [(4, 1), (8, 1), (13, 2), (15, 2), (16, 1)],
  term ((5915904 : Rat) / 2995) [(5, 1), (9, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-2024 : Rat) / 5) [(5, 1), (9, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2957952 : Rat) / 2995) [(5, 1), (9, 1), (11, 1), (12, 2), (15, 1)],
  term ((1012 : Rat) / 5) [(5, 1), (9, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((5915904 : Rat) / 2995) [(5, 1), (9, 1), (11, 1), (13, 1), (15, 2)],
  term ((-2024 : Rat) / 5) [(5, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-2957952 : Rat) / 2995) [(5, 1), (9, 1), (11, 1), (13, 2), (15, 1)],
  term ((1012 : Rat) / 5) [(5, 1), (9, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-5999616 : Rat) / 2995) [(5, 1), (9, 1), (11, 2), (12, 1), (14, 1)],
  term ((2999808 : Rat) / 2995) [(5, 1), (9, 1), (11, 2), (12, 2)],
  term ((-5999616 : Rat) / 2995) [(5, 1), (9, 1), (11, 2), (13, 1), (15, 1)],
  term ((2999808 : Rat) / 2995) [(5, 1), (9, 1), (11, 2), (13, 2)],
  term ((46608 : Rat) / 599) [(5, 1), (9, 1), (12, 1), (14, 1)],
  term ((-170688 : Rat) / 2995) [(5, 1), (9, 1), (12, 1), (14, 1), (15, 2)],
  term ((64 : Rat) / 5) [(5, 1), (9, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-23304 : Rat) / 599) [(5, 1), (9, 1), (12, 2)],
  term ((85344 : Rat) / 2995) [(5, 1), (9, 1), (12, 2), (15, 2)],
  term ((-32 : Rat) / 5) [(5, 1), (9, 1), (12, 2), (15, 2), (16, 1)],
  term ((46608 : Rat) / 599) [(5, 1), (9, 1), (13, 1), (15, 1)],
  term ((-170688 : Rat) / 2995) [(5, 1), (9, 1), (13, 1), (15, 3)],
  term ((64 : Rat) / 5) [(5, 1), (9, 1), (13, 1), (15, 3), (16, 1)],
  term ((-23304 : Rat) / 599) [(5, 1), (9, 1), (13, 2)],
  term ((85344 : Rat) / 2995) [(5, 1), (9, 1), (13, 2), (15, 2)],
  term ((-32 : Rat) / 5) [(5, 1), (9, 1), (13, 2), (15, 2), (16, 1)],
  term ((-9967104 : Rat) / 2995) [(6, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((1896 : Rat) / 5) [(6, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((4983552 : Rat) / 2995) [(6, 1), (8, 1), (11, 1), (12, 2), (15, 1)],
  term ((-948 : Rat) / 5) [(6, 1), (8, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-9967104 : Rat) / 2995) [(6, 1), (8, 1), (11, 1), (13, 1), (15, 2)],
  term ((1896 : Rat) / 5) [(6, 1), (8, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((4983552 : Rat) / 2995) [(6, 1), (8, 1), (11, 1), (13, 2), (15, 1)],
  term ((-948 : Rat) / 5) [(6, 1), (8, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((5785344 : Rat) / 2995) [(6, 1), (8, 1), (11, 2), (12, 1), (14, 1)],
  term ((-2892672 : Rat) / 2995) [(6, 1), (8, 1), (11, 2), (12, 2)],
  term ((5785344 : Rat) / 2995) [(6, 1), (8, 1), (11, 2), (13, 1), (15, 1)],
  term ((-2892672 : Rat) / 2995) [(6, 1), (8, 1), (11, 2), (13, 2)],
  term ((-42144 : Rat) / 599) [(6, 1), (8, 1), (12, 1), (14, 1)],
  term ((4847616 : Rat) / 2995) [(6, 1), (8, 1), (12, 1), (14, 1), (15, 2)],
  term ((-1068 : Rat) / 5) [(6, 1), (8, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((21072 : Rat) / 599) [(6, 1), (8, 1), (12, 2)],
  term ((-2423808 : Rat) / 2995) [(6, 1), (8, 1), (12, 2), (15, 2)],
  term ((534 : Rat) / 5) [(6, 1), (8, 1), (12, 2), (15, 2), (16, 1)],
  term ((-42144 : Rat) / 599) [(6, 1), (8, 1), (13, 1), (15, 1)],
  term ((4847616 : Rat) / 2995) [(6, 1), (8, 1), (13, 1), (15, 3)],
  term ((-1068 : Rat) / 5) [(6, 1), (8, 1), (13, 1), (15, 3), (16, 1)],
  term ((21072 : Rat) / 599) [(6, 1), (8, 1), (13, 2)],
  term ((-2423808 : Rat) / 2995) [(6, 1), (8, 1), (13, 2), (15, 2)],
  term ((534 : Rat) / 5) [(6, 1), (8, 1), (13, 2), (15, 2), (16, 1)],
  term ((-9967104 : Rat) / 2995) [(7, 1), (9, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((1896 : Rat) / 5) [(7, 1), (9, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((4983552 : Rat) / 2995) [(7, 1), (9, 1), (11, 1), (12, 2), (15, 1)],
  term ((-948 : Rat) / 5) [(7, 1), (9, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-9967104 : Rat) / 2995) [(7, 1), (9, 1), (11, 1), (13, 1), (15, 2)],
  term ((1896 : Rat) / 5) [(7, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((4983552 : Rat) / 2995) [(7, 1), (9, 1), (11, 1), (13, 2), (15, 1)],
  term ((-948 : Rat) / 5) [(7, 1), (9, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((5785344 : Rat) / 2995) [(7, 1), (9, 1), (11, 2), (12, 1), (14, 1)],
  term ((-2892672 : Rat) / 2995) [(7, 1), (9, 1), (11, 2), (12, 2)],
  term ((5785344 : Rat) / 2995) [(7, 1), (9, 1), (11, 2), (13, 1), (15, 1)],
  term ((-2892672 : Rat) / 2995) [(7, 1), (9, 1), (11, 2), (13, 2)],
  term ((-42144 : Rat) / 599) [(7, 1), (9, 1), (12, 1), (14, 1)],
  term ((4847616 : Rat) / 2995) [(7, 1), (9, 1), (12, 1), (14, 1), (15, 2)],
  term ((-1068 : Rat) / 5) [(7, 1), (9, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((21072 : Rat) / 599) [(7, 1), (9, 1), (12, 2)],
  term ((-2423808 : Rat) / 2995) [(7, 1), (9, 1), (12, 2), (15, 2)],
  term ((534 : Rat) / 5) [(7, 1), (9, 1), (12, 2), (15, 2), (16, 1)],
  term ((-42144 : Rat) / 599) [(7, 1), (9, 1), (13, 1), (15, 1)],
  term ((4847616 : Rat) / 2995) [(7, 1), (9, 1), (13, 1), (15, 3)],
  term ((-1068 : Rat) / 5) [(7, 1), (9, 1), (13, 1), (15, 3), (16, 1)],
  term ((21072 : Rat) / 599) [(7, 1), (9, 1), (13, 2)],
  term ((-2423808 : Rat) / 2995) [(7, 1), (9, 1), (13, 2), (15, 2)],
  term ((534 : Rat) / 5) [(7, 1), (9, 1), (13, 2), (15, 2), (16, 1)],
  term ((-1553472 : Rat) / 599) [(8, 1), (9, 1), (11, 1), (12, 1), (14, 1)],
  term ((321408 : Rat) / 2995) [(8, 1), (9, 1), (11, 1), (12, 1), (14, 2)],
  term ((776736 : Rat) / 599) [(8, 1), (9, 1), (11, 1), (12, 2)],
  term ((-160704 : Rat) / 2995) [(8, 1), (9, 1), (11, 1), (12, 2), (14, 1)],
  term ((321408 : Rat) / 2995) [(8, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-1553472 : Rat) / 599) [(8, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((776736 : Rat) / 599) [(8, 1), (9, 1), (11, 1), (13, 2)],
  term ((-160704 : Rat) / 2995) [(8, 1), (9, 1), (11, 1), (13, 2), (14, 1)],
  term ((1698240 : Rat) / 599) [(8, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term (-384 : Rat) [(8, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-65664 : Rat) / 2995) [(8, 1), (9, 1), (12, 1), (14, 2), (15, 1)],
  term ((-8 : Rat) / 5) [(8, 1), (9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((32832 : Rat) / 2995) [(8, 1), (9, 1), (12, 2), (14, 1), (15, 1)],
  term ((4 : Rat) / 5) [(8, 1), (9, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-849120 : Rat) / 599) [(8, 1), (9, 1), (12, 2), (15, 1)],
  term (192 : Rat) [(8, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-65664 : Rat) / 2995) [(8, 1), (9, 1), (13, 1), (14, 1), (15, 2)],
  term ((-8 : Rat) / 5) [(8, 1), (9, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((1698240 : Rat) / 599) [(8, 1), (9, 1), (13, 1), (15, 2)],
  term (-384 : Rat) [(8, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((32832 : Rat) / 2995) [(8, 1), (9, 1), (13, 2), (14, 1), (15, 1)],
  term ((4 : Rat) / 5) [(8, 1), (9, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-849120 : Rat) / 599) [(8, 1), (9, 1), (13, 2), (15, 1)],
  term (192 : Rat) [(8, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((9967104 : Rat) / 2995) [(8, 1), (10, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-1896 : Rat) / 5) [(8, 1), (10, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4983552 : Rat) / 2995) [(8, 1), (10, 1), (11, 1), (12, 2), (15, 1)],
  term ((948 : Rat) / 5) [(8, 1), (10, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((9967104 : Rat) / 2995) [(8, 1), (10, 1), (11, 1), (13, 1), (15, 2)],
  term ((-1896 : Rat) / 5) [(8, 1), (10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-4983552 : Rat) / 2995) [(8, 1), (10, 1), (11, 1), (13, 2), (15, 1)],
  term ((948 : Rat) / 5) [(8, 1), (10, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-5785344 : Rat) / 2995) [(8, 1), (10, 1), (11, 2), (12, 1), (14, 1)],
  term ((2892672 : Rat) / 2995) [(8, 1), (10, 1), (11, 2), (12, 2)],
  term ((-5785344 : Rat) / 2995) [(8, 1), (10, 1), (11, 2), (13, 1), (15, 1)],
  term ((2892672 : Rat) / 2995) [(8, 1), (10, 1), (11, 2), (13, 2)],
  term ((9912 : Rat) / 599) [(8, 1), (10, 1), (12, 1), (14, 1)],
  term ((-4847616 : Rat) / 2995) [(8, 1), (10, 1), (12, 1), (14, 1), (15, 2)],
  term ((1068 : Rat) / 5) [(8, 1), (10, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-4956 : Rat) / 599) [(8, 1), (10, 1), (12, 2)],
  term ((2423808 : Rat) / 2995) [(8, 1), (10, 1), (12, 2), (15, 2)],
  term ((-534 : Rat) / 5) [(8, 1), (10, 1), (12, 2), (15, 2), (16, 1)],
  term ((9912 : Rat) / 599) [(8, 1), (10, 1), (13, 1), (15, 1)],
  term ((-4847616 : Rat) / 2995) [(8, 1), (10, 1), (13, 1), (15, 3)],
  term ((1068 : Rat) / 5) [(8, 1), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((-4956 : Rat) / 599) [(8, 1), (10, 1), (13, 2)],
  term ((2423808 : Rat) / 2995) [(8, 1), (10, 1), (13, 2), (15, 2)],
  term ((-534 : Rat) / 5) [(8, 1), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((-1446336 : Rat) / 2995) [(8, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((1714176 : Rat) / 2995) [(8, 1), (11, 1), (12, 1), (13, 1), (14, 2)],
  term ((10937664 : Rat) / 2995) [(8, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-374 : Rat) / 5) [(8, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((2152032 : Rat) / 2995) [(8, 1), (11, 1), (12, 1), (14, 2), (15, 1)],
  term ((-796 : Rat) / 5) [(8, 1), (11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((723168 : Rat) / 2995) [(8, 1), (11, 1), (12, 2), (13, 1)],
  term ((-857088 : Rat) / 2995) [(8, 1), (11, 1), (12, 2), (13, 1), (14, 1)],
  term ((-1076016 : Rat) / 2995) [(8, 1), (11, 1), (12, 2), (14, 1), (15, 1)],
  term ((398 : Rat) / 5) [(8, 1), (11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-5468832 : Rat) / 2995) [(8, 1), (11, 1), (12, 2), (15, 1)],
  term ((187 : Rat) / 5) [(8, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((2152032 : Rat) / 2995) [(8, 1), (11, 1), (13, 1), (14, 1), (15, 2)],
  term ((-796 : Rat) / 5) [(8, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((10937664 : Rat) / 2995) [(8, 1), (11, 1), (13, 1), (15, 2)],
  term ((-374 : Rat) / 5) [(8, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((127632 : Rat) / 599) [(8, 1), (11, 1), (13, 2), (14, 1), (15, 1)],
  term ((398 : Rat) / 5) [(8, 1), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-6915168 : Rat) / 2995) [(8, 1), (11, 1), (13, 2), (15, 1)],
  term ((187 : Rat) / 5) [(8, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((723168 : Rat) / 2995) [(8, 1), (11, 1), (13, 3)],
  term ((-857088 : Rat) / 2995) [(8, 1), (11, 1), (13, 3), (14, 1)],
  term ((-1446336 : Rat) / 2995) [(8, 1), (11, 2), (12, 1), (14, 1)],
  term ((-2303424 : Rat) / 2995) [(8, 1), (11, 2), (12, 1), (14, 2)],
  term ((723168 : Rat) / 2995) [(8, 1), (11, 2), (12, 2)],
  term ((1151712 : Rat) / 2995) [(8, 1), (11, 2), (12, 2), (14, 1)],
  term ((-2303424 : Rat) / 2995) [(8, 1), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((-1446336 : Rat) / 2995) [(8, 1), (11, 2), (13, 1), (15, 1)],
  term ((723168 : Rat) / 2995) [(8, 1), (11, 2), (13, 2)],
  term ((1151712 : Rat) / 2995) [(8, 1), (11, 2), (13, 2), (14, 1)],
  term ((1456128 : Rat) / 2995) [(8, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-374 : Rat) / 5) [(8, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1838208 : Rat) / 2995) [(8, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((424 : Rat) / 5) [(8, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((1236 : Rat) / 599) [(8, 1), (12, 1), (14, 1)],
  term ((-10443648 : Rat) / 2995) [(8, 1), (12, 1), (14, 1), (15, 2)],
  term ((2284 : Rat) / 5) [(8, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((30744 : Rat) / 599) [(8, 1), (12, 1), (14, 2)],
  term ((-618 : Rat) / 599) [(8, 1), (12, 2)],
  term ((919104 : Rat) / 2995) [(8, 1), (12, 2), (13, 1), (14, 1), (15, 1)],
  term ((-212 : Rat) / 5) [(8, 1), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-728064 : Rat) / 2995) [(8, 1), (12, 2), (13, 1), (15, 1)],
  term ((187 : Rat) / 5) [(8, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-15372 : Rat) / 599) [(8, 1), (12, 2), (14, 1)],
  term ((5221824 : Rat) / 2995) [(8, 1), (12, 2), (15, 2)],
  term ((-1142 : Rat) / 5) [(8, 1), (12, 2), (15, 2), (16, 1)],
  term ((30744 : Rat) / 599) [(8, 1), (13, 1), (14, 1), (15, 1)],
  term ((1236 : Rat) / 599) [(8, 1), (13, 1), (15, 1)],
  term ((-10443648 : Rat) / 2995) [(8, 1), (13, 1), (15, 3)],
  term ((2284 : Rat) / 5) [(8, 1), (13, 1), (15, 3), (16, 1)],
  term ((-618 : Rat) / 599) [(8, 1), (13, 2)],
  term ((-15372 : Rat) / 599) [(8, 1), (13, 2), (14, 1)],
  term ((-1838208 : Rat) / 2995) [(8, 1), (13, 2), (14, 1), (15, 2)],
  term ((424 : Rat) / 5) [(8, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((6677952 : Rat) / 2995) [(8, 1), (13, 2), (15, 2)],
  term ((-1516 : Rat) / 5) [(8, 1), (13, 2), (15, 2), (16, 1)],
  term ((919104 : Rat) / 2995) [(8, 1), (13, 3), (14, 1), (15, 1)],
  term ((-212 : Rat) / 5) [(8, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-728064 : Rat) / 2995) [(8, 1), (13, 3), (15, 1)],
  term ((187 : Rat) / 5) [(8, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 30, terms 200 through 299. -/
theorem rs_R010_ueqv_R010NYN_block_30_0200_0299_valid :
    checkProductSumEq rs_R010_ueqv_R010NYN_partials_30_0200_0299
      rs_R010_ueqv_R010NYN_block_30_0200_0299 = true := by
  native_decide

end R010UeqvR010NYNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
