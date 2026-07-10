/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R011:u=v:R011NNNY, term block 25:200-299

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R011UeqvR011NNNYTermShards

/-- Generator polynomial 25 for relaxed split surplus certificate `R011:u=v:R011NNNY`. -/
def rs_R011_ueqv_R011NNNY_generator_25_0200_0299 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(12, 1)]
]

/-- Coefficient term 200 from coefficient polynomial 25. -/
def rs_R011_ueqv_R011NNNY_coefficient_25_0200 : Poly :=
[
  term ((-48 : Rat) / 7) [(3, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 200 for generator 25. -/
def rs_R011_ueqv_R011NNNY_partial_25_0200 : Poly :=
[
  term ((-96 : Rat) / 7) [(3, 1), (9, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((48 : Rat) / 7) [(3, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 200 for generator 25. -/
theorem rs_R011_ueqv_R011NNNY_partial_25_0200_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_25_0200
        rs_R011_ueqv_R011NNNY_generator_25_0200_0299 =
      rs_R011_ueqv_R011NNNY_partial_25_0200 := by
  native_decide

/-- Coefficient term 201 from coefficient polynomial 25. -/
def rs_R011_ueqv_R011NNNY_coefficient_25_0201 : Poly :=
[
  term ((32 : Rat) / 7) [(3, 1), (9, 1), (10, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 201 for generator 25. -/
def rs_R011_ueqv_R011NNNY_partial_25_0201 : Poly :=
[
  term ((-32 : Rat) / 7) [(3, 1), (9, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((64 : Rat) / 7) [(3, 1), (9, 1), (10, 1), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 201 for generator 25. -/
theorem rs_R011_ueqv_R011NNNY_partial_25_0201_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_25_0201
        rs_R011_ueqv_R011NNNY_generator_25_0200_0299 =
      rs_R011_ueqv_R011NNNY_partial_25_0201 := by
  native_decide

/-- Coefficient term 202 from coefficient polynomial 25. -/
def rs_R011_ueqv_R011NNNY_coefficient_25_0202 : Poly :=
[
  term ((-4 : Rat) / 7) [(3, 1), (9, 1), (10, 1), (12, 1), (16, 1)]
]

/-- Partial product 202 for generator 25. -/
def rs_R011_ueqv_R011NNNY_partial_25_0202 : Poly :=
[
  term ((4 : Rat) / 7) [(3, 1), (9, 1), (10, 1), (12, 1), (16, 1)],
  term ((-8 : Rat) / 7) [(3, 1), (9, 1), (10, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 202 for generator 25. -/
theorem rs_R011_ueqv_R011NNNY_partial_25_0202_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_25_0202
        rs_R011_ueqv_R011NNNY_generator_25_0200_0299 =
      rs_R011_ueqv_R011NNNY_partial_25_0202 := by
  native_decide

/-- Coefficient term 203 from coefficient polynomial 25. -/
def rs_R011_ueqv_R011NNNY_coefficient_25_0203 : Poly :=
[
  term ((-128 : Rat) / 7) [(3, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 203 for generator 25. -/
def rs_R011_ueqv_R011NNNY_partial_25_0203 : Poly :=
[
  term ((-256 : Rat) / 7) [(3, 1), (9, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((128 : Rat) / 7) [(3, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 203 for generator 25. -/
theorem rs_R011_ueqv_R011NNNY_partial_25_0203_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_25_0203
        rs_R011_ueqv_R011NNNY_generator_25_0200_0299 =
      rs_R011_ueqv_R011NNNY_partial_25_0203 := by
  native_decide

/-- Coefficient term 204 from coefficient polynomial 25. -/
def rs_R011_ueqv_R011NNNY_coefficient_25_0204 : Poly :=
[
  term ((31 : Rat) / 7) [(3, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 204 for generator 25. -/
def rs_R011_ueqv_R011NNNY_partial_25_0204 : Poly :=
[
  term ((62 : Rat) / 7) [(3, 1), (9, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-31 : Rat) / 7) [(3, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 204 for generator 25. -/
theorem rs_R011_ueqv_R011NNNY_partial_25_0204_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_25_0204
        rs_R011_ueqv_R011NNNY_generator_25_0200_0299 =
      rs_R011_ueqv_R011NNNY_partial_25_0204 := by
  native_decide

/-- Coefficient term 205 from coefficient polynomial 25. -/
def rs_R011_ueqv_R011NNNY_coefficient_25_0205 : Poly :=
[
  term ((384 : Rat) / 7) [(3, 1), (9, 1), (10, 1), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 205 for generator 25. -/
def rs_R011_ueqv_R011NNNY_partial_25_0205 : Poly :=
[
  term ((768 : Rat) / 7) [(3, 1), (9, 1), (10, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-384 : Rat) / 7) [(3, 1), (9, 1), (10, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 205 for generator 25. -/
theorem rs_R011_ueqv_R011NNNY_partial_25_0205_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_25_0205
        rs_R011_ueqv_R011NNNY_generator_25_0200_0299 =
      rs_R011_ueqv_R011NNNY_partial_25_0205 := by
  native_decide

/-- Coefficient term 206 from coefficient polynomial 25. -/
def rs_R011_ueqv_R011NNNY_coefficient_25_0206 : Poly :=
[
  term ((-144 : Rat) / 7) [(3, 1), (9, 1), (10, 1), (13, 2), (16, 1)]
]

/-- Partial product 206 for generator 25. -/
def rs_R011_ueqv_R011NNNY_partial_25_0206 : Poly :=
[
  term ((-288 : Rat) / 7) [(3, 1), (9, 1), (10, 1), (12, 1), (13, 2), (16, 1)],
  term ((144 : Rat) / 7) [(3, 1), (9, 1), (10, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 206 for generator 25. -/
theorem rs_R011_ueqv_R011NNNY_partial_25_0206_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_25_0206
        rs_R011_ueqv_R011NNNY_generator_25_0200_0299 =
      rs_R011_ueqv_R011NNNY_partial_25_0206 := by
  native_decide

/-- Coefficient term 207 from coefficient polynomial 25. -/
def rs_R011_ueqv_R011NNNY_coefficient_25_0207 : Poly :=
[
  term ((192 : Rat) / 7) [(3, 1), (9, 1), (10, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 207 for generator 25. -/
def rs_R011_ueqv_R011NNNY_partial_25_0207 : Poly :=
[
  term ((384 : Rat) / 7) [(3, 1), (9, 1), (10, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-192 : Rat) / 7) [(3, 1), (9, 1), (10, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 207 for generator 25. -/
theorem rs_R011_ueqv_R011NNNY_partial_25_0207_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_25_0207
        rs_R011_ueqv_R011NNNY_generator_25_0200_0299 =
      rs_R011_ueqv_R011NNNY_partial_25_0207 := by
  native_decide

/-- Coefficient term 208 from coefficient polynomial 25. -/
def rs_R011_ueqv_R011NNNY_coefficient_25_0208 : Poly :=
[
  term ((-96 : Rat) / 7) [(3, 1), (9, 1), (10, 1), (14, 1), (16, 1)]
]

/-- Partial product 208 for generator 25. -/
def rs_R011_ueqv_R011NNNY_partial_25_0208 : Poly :=
[
  term ((-192 : Rat) / 7) [(3, 1), (9, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((96 : Rat) / 7) [(3, 1), (9, 1), (10, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 208 for generator 25. -/
theorem rs_R011_ueqv_R011NNNY_partial_25_0208_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_25_0208
        rs_R011_ueqv_R011NNNY_generator_25_0200_0299 =
      rs_R011_ueqv_R011NNNY_partial_25_0208 := by
  native_decide

/-- Coefficient term 209 from coefficient polynomial 25. -/
def rs_R011_ueqv_R011NNNY_coefficient_25_0209 : Poly :=
[
  term ((-334 : Rat) / 7) [(3, 1), (9, 1), (10, 1), (15, 2), (16, 1)]
]

/-- Partial product 209 for generator 25. -/
def rs_R011_ueqv_R011NNNY_partial_25_0209 : Poly :=
[
  term ((-668 : Rat) / 7) [(3, 1), (9, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((334 : Rat) / 7) [(3, 1), (9, 1), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 209 for generator 25. -/
theorem rs_R011_ueqv_R011NNNY_partial_25_0209_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_25_0209
        rs_R011_ueqv_R011NNNY_generator_25_0200_0299 =
      rs_R011_ueqv_R011NNNY_partial_25_0209 := by
  native_decide

/-- Coefficient term 210 from coefficient polynomial 25. -/
def rs_R011_ueqv_R011NNNY_coefficient_25_0210 : Poly :=
[
  term ((114 : Rat) / 7) [(3, 1), (9, 1), (10, 1), (16, 1)]
]

/-- Partial product 210 for generator 25. -/
def rs_R011_ueqv_R011NNNY_partial_25_0210 : Poly :=
[
  term ((228 : Rat) / 7) [(3, 1), (9, 1), (10, 1), (12, 1), (16, 1)],
  term ((-114 : Rat) / 7) [(3, 1), (9, 1), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 210 for generator 25. -/
theorem rs_R011_ueqv_R011NNNY_partial_25_0210_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_25_0210
        rs_R011_ueqv_R011NNNY_generator_25_0200_0299 =
      rs_R011_ueqv_R011NNNY_partial_25_0210 := by
  native_decide

/-- Coefficient term 211 from coefficient polynomial 25. -/
def rs_R011_ueqv_R011NNNY_coefficient_25_0211 : Poly :=
[
  term ((32 : Rat) / 7) [(3, 1), (9, 1), (10, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 211 for generator 25. -/
def rs_R011_ueqv_R011NNNY_partial_25_0211 : Poly :=
[
  term ((64 : Rat) / 7) [(3, 1), (9, 1), (10, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-32 : Rat) / 7) [(3, 1), (9, 1), (10, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 211 for generator 25. -/
theorem rs_R011_ueqv_R011NNNY_partial_25_0211_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_25_0211
        rs_R011_ueqv_R011NNNY_generator_25_0200_0299 =
      rs_R011_ueqv_R011NNNY_partial_25_0211 := by
  native_decide

/-- Coefficient term 212 from coefficient polynomial 25. -/
def rs_R011_ueqv_R011NNNY_coefficient_25_0212 : Poly :=
[
  term ((-64 : Rat) / 7) [(3, 1), (9, 1), (10, 2), (15, 2), (16, 1)]
]

/-- Partial product 212 for generator 25. -/
def rs_R011_ueqv_R011NNNY_partial_25_0212 : Poly :=
[
  term ((-128 : Rat) / 7) [(3, 1), (9, 1), (10, 2), (12, 1), (15, 2), (16, 1)],
  term ((64 : Rat) / 7) [(3, 1), (9, 1), (10, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 212 for generator 25. -/
theorem rs_R011_ueqv_R011NNNY_partial_25_0212_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_25_0212
        rs_R011_ueqv_R011NNNY_generator_25_0200_0299 =
      rs_R011_ueqv_R011NNNY_partial_25_0212 := by
  native_decide

/-- Coefficient term 213 from coefficient polynomial 25. -/
def rs_R011_ueqv_R011NNNY_coefficient_25_0213 : Poly :=
[
  term ((144 : Rat) / 7) [(3, 1), (9, 1), (11, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 213 for generator 25. -/
def rs_R011_ueqv_R011NNNY_partial_25_0213 : Poly :=
[
  term ((-144 : Rat) / 7) [(3, 1), (9, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((288 : Rat) / 7) [(3, 1), (9, 1), (11, 1), (12, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 213 for generator 25. -/
theorem rs_R011_ueqv_R011NNNY_partial_25_0213_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_25_0213
        rs_R011_ueqv_R011NNNY_generator_25_0200_0299 =
      rs_R011_ueqv_R011NNNY_partial_25_0213 := by
  native_decide

/-- Coefficient term 214 from coefficient polynomial 25. -/
def rs_R011_ueqv_R011NNNY_coefficient_25_0214 : Poly :=
[
  term ((96 : Rat) / 7) [(3, 1), (9, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 214 for generator 25. -/
def rs_R011_ueqv_R011NNNY_partial_25_0214 : Poly :=
[
  term ((-96 : Rat) / 7) [(3, 1), (9, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((192 : Rat) / 7) [(3, 1), (9, 1), (11, 1), (12, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 214 for generator 25. -/
theorem rs_R011_ueqv_R011NNNY_partial_25_0214_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_25_0214
        rs_R011_ueqv_R011NNNY_generator_25_0200_0299 =
      rs_R011_ueqv_R011NNNY_partial_25_0214 := by
  native_decide

/-- Coefficient term 215 from coefficient polynomial 25. -/
def rs_R011_ueqv_R011NNNY_coefficient_25_0215 : Poly :=
[
  term ((177 : Rat) / 7) [(3, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 215 for generator 25. -/
def rs_R011_ueqv_R011NNNY_partial_25_0215 : Poly :=
[
  term ((-177 : Rat) / 7) [(3, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((354 : Rat) / 7) [(3, 1), (9, 1), (11, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 215 for generator 25. -/
theorem rs_R011_ueqv_R011NNNY_partial_25_0215_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_25_0215
        rs_R011_ueqv_R011NNNY_generator_25_0200_0299 =
      rs_R011_ueqv_R011NNNY_partial_25_0215 := by
  native_decide

/-- Coefficient term 216 from coefficient polynomial 25. -/
def rs_R011_ueqv_R011NNNY_coefficient_25_0216 : Poly :=
[
  term ((-384 : Rat) / 7) [(3, 1), (9, 1), (11, 1), (12, 1), (15, 3), (16, 1)]
]

/-- Partial product 216 for generator 25. -/
def rs_R011_ueqv_R011NNNY_partial_25_0216 : Poly :=
[
  term ((384 : Rat) / 7) [(3, 1), (9, 1), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((-768 : Rat) / 7) [(3, 1), (9, 1), (11, 1), (12, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 216 for generator 25. -/
theorem rs_R011_ueqv_R011NNNY_partial_25_0216_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_25_0216
        rs_R011_ueqv_R011NNNY_generator_25_0200_0299 =
      rs_R011_ueqv_R011NNNY_partial_25_0216 := by
  native_decide

/-- Coefficient term 217 from coefficient polynomial 25. -/
def rs_R011_ueqv_R011NNNY_coefficient_25_0217 : Poly :=
[
  term ((-288 : Rat) / 7) [(3, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 217 for generator 25. -/
def rs_R011_ueqv_R011NNNY_partial_25_0217 : Poly :=
[
  term ((-576 : Rat) / 7) [(3, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((288 : Rat) / 7) [(3, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 217 for generator 25. -/
theorem rs_R011_ueqv_R011NNNY_partial_25_0217_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_25_0217
        rs_R011_ueqv_R011NNNY_generator_25_0200_0299 =
      rs_R011_ueqv_R011NNNY_partial_25_0217 := by
  native_decide

/-- Coefficient term 218 from coefficient polynomial 25. -/
def rs_R011_ueqv_R011NNNY_coefficient_25_0218 : Poly :=
[
  term ((72 : Rat) / 7) [(3, 1), (9, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 218 for generator 25. -/
def rs_R011_ueqv_R011NNNY_partial_25_0218 : Poly :=
[
  term ((144 : Rat) / 7) [(3, 1), (9, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-72 : Rat) / 7) [(3, 1), (9, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 218 for generator 25. -/
theorem rs_R011_ueqv_R011NNNY_partial_25_0218_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_25_0218
        rs_R011_ueqv_R011NNNY_generator_25_0200_0299 =
      rs_R011_ueqv_R011NNNY_partial_25_0218 := by
  native_decide

/-- Coefficient term 219 from coefficient polynomial 25. -/
def rs_R011_ueqv_R011NNNY_coefficient_25_0219 : Poly :=
[
  term ((272 : Rat) / 7) [(3, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 219 for generator 25. -/
def rs_R011_ueqv_R011NNNY_partial_25_0219 : Poly :=
[
  term ((544 : Rat) / 7) [(3, 1), (9, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-272 : Rat) / 7) [(3, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 219 for generator 25. -/
theorem rs_R011_ueqv_R011NNNY_partial_25_0219_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_25_0219
        rs_R011_ueqv_R011NNNY_generator_25_0200_0299 =
      rs_R011_ueqv_R011NNNY_partial_25_0219 := by
  native_decide

/-- Coefficient term 220 from coefficient polynomial 25. -/
def rs_R011_ueqv_R011NNNY_coefficient_25_0220 : Poly :=
[
  term ((-192 : Rat) / 7) [(3, 1), (9, 1), (11, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 220 for generator 25. -/
def rs_R011_ueqv_R011NNNY_partial_25_0220 : Poly :=
[
  term ((-384 : Rat) / 7) [(3, 1), (9, 1), (11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((192 : Rat) / 7) [(3, 1), (9, 1), (11, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 220 for generator 25. -/
theorem rs_R011_ueqv_R011NNNY_partial_25_0220_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_25_0220
        rs_R011_ueqv_R011NNNY_generator_25_0200_0299 =
      rs_R011_ueqv_R011NNNY_partial_25_0220 := by
  native_decide

/-- Coefficient term 221 from coefficient polynomial 25. -/
def rs_R011_ueqv_R011NNNY_coefficient_25_0221 : Poly :=
[
  term ((177 : Rat) / 14) [(3, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 221 for generator 25. -/
def rs_R011_ueqv_R011NNNY_partial_25_0221 : Poly :=
[
  term ((177 : Rat) / 7) [(3, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-177 : Rat) / 14) [(3, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 221 for generator 25. -/
theorem rs_R011_ueqv_R011NNNY_partial_25_0221_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_25_0221
        rs_R011_ueqv_R011NNNY_generator_25_0200_0299 =
      rs_R011_ueqv_R011NNNY_partial_25_0221 := by
  native_decide

/-- Coefficient term 222 from coefficient polynomial 25. -/
def rs_R011_ueqv_R011NNNY_coefficient_25_0222 : Poly :=
[
  term ((-192 : Rat) / 7) [(3, 1), (9, 1), (11, 1), (15, 3), (16, 1)]
]

/-- Partial product 222 for generator 25. -/
def rs_R011_ueqv_R011NNNY_partial_25_0222 : Poly :=
[
  term ((-384 : Rat) / 7) [(3, 1), (9, 1), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((192 : Rat) / 7) [(3, 1), (9, 1), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 222 for generator 25. -/
theorem rs_R011_ueqv_R011NNNY_partial_25_0222_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_25_0222
        rs_R011_ueqv_R011NNNY_generator_25_0200_0299 =
      rs_R011_ueqv_R011NNNY_partial_25_0222 := by
  native_decide

/-- Coefficient term 223 from coefficient polynomial 25. -/
def rs_R011_ueqv_R011NNNY_coefficient_25_0223 : Poly :=
[
  term ((-128 : Rat) / 7) [(3, 1), (9, 1), (11, 2), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 223 for generator 25. -/
def rs_R011_ueqv_R011NNNY_partial_25_0223 : Poly :=
[
  term ((128 : Rat) / 7) [(3, 1), (9, 1), (11, 2), (12, 1), (15, 2), (16, 1)],
  term ((-256 : Rat) / 7) [(3, 1), (9, 1), (11, 2), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 223 for generator 25. -/
theorem rs_R011_ueqv_R011NNNY_partial_25_0223_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_25_0223
        rs_R011_ueqv_R011NNNY_generator_25_0200_0299 =
      rs_R011_ueqv_R011NNNY_partial_25_0223 := by
  native_decide

/-- Coefficient term 224 from coefficient polynomial 25. -/
def rs_R011_ueqv_R011NNNY_coefficient_25_0224 : Poly :=
[
  term ((-64 : Rat) / 7) [(3, 1), (9, 1), (11, 2), (15, 2), (16, 1)]
]

/-- Partial product 224 for generator 25. -/
def rs_R011_ueqv_R011NNNY_partial_25_0224 : Poly :=
[
  term ((-128 : Rat) / 7) [(3, 1), (9, 1), (11, 2), (12, 1), (15, 2), (16, 1)],
  term ((64 : Rat) / 7) [(3, 1), (9, 1), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 224 for generator 25. -/
theorem rs_R011_ueqv_R011NNNY_partial_25_0224_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_25_0224
        rs_R011_ueqv_R011NNNY_generator_25_0200_0299 =
      rs_R011_ueqv_R011NNNY_partial_25_0224 := by
  native_decide

/-- Coefficient term 225 from coefficient polynomial 25. -/
def rs_R011_ueqv_R011NNNY_coefficient_25_0225 : Poly :=
[
  term ((-39 : Rat) / 2) [(3, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 225 for generator 25. -/
def rs_R011_ueqv_R011NNNY_partial_25_0225 : Poly :=
[
  term ((39 : Rat) / 2) [(3, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term (-39 : Rat) [(3, 1), (9, 1), (12, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 225 for generator 25. -/
theorem rs_R011_ueqv_R011NNNY_partial_25_0225_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_25_0225
        rs_R011_ueqv_R011NNNY_generator_25_0200_0299 =
      rs_R011_ueqv_R011NNNY_partial_25_0225 := by
  native_decide

/-- Coefficient term 226 from coefficient polynomial 25. -/
def rs_R011_ueqv_R011NNNY_coefficient_25_0226 : Poly :=
[
  term ((-96 : Rat) / 7) [(3, 1), (9, 1), (12, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 226 for generator 25. -/
def rs_R011_ueqv_R011NNNY_partial_25_0226 : Poly :=
[
  term ((96 : Rat) / 7) [(3, 1), (9, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-192 : Rat) / 7) [(3, 1), (9, 1), (12, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 226 for generator 25. -/
theorem rs_R011_ueqv_R011NNNY_partial_25_0226_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_25_0226
        rs_R011_ueqv_R011NNNY_generator_25_0200_0299 =
      rs_R011_ueqv_R011NNNY_partial_25_0226 := by
  native_decide

/-- Coefficient term 227 from coefficient polynomial 25. -/
def rs_R011_ueqv_R011NNNY_coefficient_25_0227 : Poly :=
[
  term ((60 : Rat) / 7) [(3, 1), (9, 1), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 227 for generator 25. -/
def rs_R011_ueqv_R011NNNY_partial_25_0227 : Poly :=
[
  term ((-60 : Rat) / 7) [(3, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((120 : Rat) / 7) [(3, 1), (9, 1), (12, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 227 for generator 25. -/
theorem rs_R011_ueqv_R011NNNY_partial_25_0227_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_25_0227
        rs_R011_ueqv_R011NNNY_generator_25_0200_0299 =
      rs_R011_ueqv_R011NNNY_partial_25_0227 := by
  native_decide

/-- Coefficient term 228 from coefficient polynomial 25. -/
def rs_R011_ueqv_R011NNNY_coefficient_25_0228 : Poly :=
[
  term ((208 : Rat) / 7) [(3, 1), (9, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 228 for generator 25. -/
def rs_R011_ueqv_R011NNNY_partial_25_0228 : Poly :=
[
  term ((-208 : Rat) / 7) [(3, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((416 : Rat) / 7) [(3, 1), (9, 1), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 228 for generator 25. -/
theorem rs_R011_ueqv_R011NNNY_partial_25_0228_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_25_0228
        rs_R011_ueqv_R011NNNY_generator_25_0200_0299 =
      rs_R011_ueqv_R011NNNY_partial_25_0228 := by
  native_decide

/-- Coefficient term 229 from coefficient polynomial 25. -/
def rs_R011_ueqv_R011NNNY_coefficient_25_0229 : Poly :=
[
  term ((-44 : Rat) / 7) [(3, 1), (9, 1), (12, 1), (16, 1)]
]

/-- Partial product 229 for generator 25. -/
def rs_R011_ueqv_R011NNNY_partial_25_0229 : Poly :=
[
  term ((44 : Rat) / 7) [(3, 1), (9, 1), (12, 1), (16, 1)],
  term ((-88 : Rat) / 7) [(3, 1), (9, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 229 for generator 25. -/
theorem rs_R011_ueqv_R011NNNY_partial_25_0229_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_25_0229
        rs_R011_ueqv_R011NNNY_generator_25_0200_0299 =
      rs_R011_ueqv_R011NNNY_partial_25_0229 := by
  native_decide

/-- Coefficient term 230 from coefficient polynomial 25. -/
def rs_R011_ueqv_R011NNNY_coefficient_25_0230 : Poly :=
[
  term (-16 : Rat) [(3, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 230 for generator 25. -/
def rs_R011_ueqv_R011NNNY_partial_25_0230 : Poly :=
[
  term (-32 : Rat) [(3, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term (16 : Rat) [(3, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 230 for generator 25. -/
theorem rs_R011_ueqv_R011NNNY_partial_25_0230_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_25_0230
        rs_R011_ueqv_R011NNNY_generator_25_0200_0299 =
      rs_R011_ueqv_R011NNNY_partial_25_0230 := by
  native_decide

/-- Coefficient term 231 from coefficient polynomial 25. -/
def rs_R011_ueqv_R011NNNY_coefficient_25_0231 : Poly :=
[
  term ((96 : Rat) / 7) [(3, 1), (9, 1), (13, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 231 for generator 25. -/
def rs_R011_ueqv_R011NNNY_partial_25_0231 : Poly :=
[
  term ((192 : Rat) / 7) [(3, 1), (9, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-96 : Rat) / 7) [(3, 1), (9, 1), (13, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 231 for generator 25. -/
theorem rs_R011_ueqv_R011NNNY_partial_25_0231_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_25_0231
        rs_R011_ueqv_R011NNNY_generator_25_0200_0299 =
      rs_R011_ueqv_R011NNNY_partial_25_0231 := by
  native_decide

/-- Coefficient term 232 from coefficient polynomial 25. -/
def rs_R011_ueqv_R011NNNY_coefficient_25_0232 : Poly :=
[
  term ((-39 : Rat) / 4) [(3, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 232 for generator 25. -/
def rs_R011_ueqv_R011NNNY_partial_25_0232 : Poly :=
[
  term ((-39 : Rat) / 2) [(3, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((39 : Rat) / 4) [(3, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 232 for generator 25. -/
theorem rs_R011_ueqv_R011NNNY_partial_25_0232_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_25_0232
        rs_R011_ueqv_R011NNNY_generator_25_0200_0299 =
      rs_R011_ueqv_R011NNNY_partial_25_0232 := by
  native_decide

/-- Coefficient term 233 from coefficient polynomial 25. -/
def rs_R011_ueqv_R011NNNY_coefficient_25_0233 : Poly :=
[
  term ((144 : Rat) / 7) [(3, 1), (9, 1), (13, 2), (14, 1), (16, 1)]
]

/-- Partial product 233 for generator 25. -/
def rs_R011_ueqv_R011NNNY_partial_25_0233 : Poly :=
[
  term ((288 : Rat) / 7) [(3, 1), (9, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-144 : Rat) / 7) [(3, 1), (9, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 233 for generator 25. -/
theorem rs_R011_ueqv_R011NNNY_partial_25_0233_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_25_0233
        rs_R011_ueqv_R011NNNY_generator_25_0200_0299 =
      rs_R011_ueqv_R011NNNY_partial_25_0233 := by
  native_decide

/-- Coefficient term 234 from coefficient polynomial 25. -/
def rs_R011_ueqv_R011NNNY_coefficient_25_0234 : Poly :=
[
  term ((-96 : Rat) / 7) [(3, 1), (9, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 234 for generator 25. -/
def rs_R011_ueqv_R011NNNY_partial_25_0234 : Poly :=
[
  term ((-192 : Rat) / 7) [(3, 1), (9, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((96 : Rat) / 7) [(3, 1), (9, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 234 for generator 25. -/
theorem rs_R011_ueqv_R011NNNY_partial_25_0234_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_25_0234
        rs_R011_ueqv_R011NNNY_generator_25_0200_0299 =
      rs_R011_ueqv_R011NNNY_partial_25_0234 := by
  native_decide

/-- Coefficient term 235 from coefficient polynomial 25. -/
def rs_R011_ueqv_R011NNNY_coefficient_25_0235 : Poly :=
[
  term ((6 : Rat) / 7) [(3, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 235 for generator 25. -/
def rs_R011_ueqv_R011NNNY_partial_25_0235 : Poly :=
[
  term ((12 : Rat) / 7) [(3, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((-6 : Rat) / 7) [(3, 1), (9, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 235 for generator 25. -/
theorem rs_R011_ueqv_R011NNNY_partial_25_0235_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_25_0235
        rs_R011_ueqv_R011NNNY_generator_25_0200_0299 =
      rs_R011_ueqv_R011NNNY_partial_25_0235 := by
  native_decide

/-- Coefficient term 236 from coefficient polynomial 25. -/
def rs_R011_ueqv_R011NNNY_coefficient_25_0236 : Poly :=
[
  term ((104 : Rat) / 7) [(3, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 236 for generator 25. -/
def rs_R011_ueqv_R011NNNY_partial_25_0236 : Poly :=
[
  term ((208 : Rat) / 7) [(3, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((-104 : Rat) / 7) [(3, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 236 for generator 25. -/
theorem rs_R011_ueqv_R011NNNY_partial_25_0236_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_25_0236
        rs_R011_ueqv_R011NNNY_generator_25_0200_0299 =
      rs_R011_ueqv_R011NNNY_partial_25_0236 := by
  native_decide

/-- Coefficient term 237 from coefficient polynomial 25. -/
def rs_R011_ueqv_R011NNNY_coefficient_25_0237 : Poly :=
[
  term ((-22 : Rat) / 7) [(3, 1), (9, 1), (16, 1)]
]

/-- Partial product 237 for generator 25. -/
def rs_R011_ueqv_R011NNNY_partial_25_0237 : Poly :=
[
  term ((-44 : Rat) / 7) [(3, 1), (9, 1), (12, 1), (16, 1)],
  term ((22 : Rat) / 7) [(3, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 237 for generator 25. -/
theorem rs_R011_ueqv_R011NNNY_partial_25_0237_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_25_0237
        rs_R011_ueqv_R011NNNY_generator_25_0200_0299 =
      rs_R011_ueqv_R011NNNY_partial_25_0237 := by
  native_decide

/-- Coefficient term 238 from coefficient polynomial 25. -/
def rs_R011_ueqv_R011NNNY_coefficient_25_0238 : Poly :=
[
  term ((-128 : Rat) / 7) [(3, 1), (9, 2), (10, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 238 for generator 25. -/
def rs_R011_ueqv_R011NNNY_partial_25_0238 : Poly :=
[
  term ((-256 : Rat) / 7) [(3, 1), (9, 2), (10, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((128 : Rat) / 7) [(3, 1), (9, 2), (10, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 238 for generator 25. -/
theorem rs_R011_ueqv_R011NNNY_partial_25_0238_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_25_0238
        rs_R011_ueqv_R011NNNY_generator_25_0200_0299 =
      rs_R011_ueqv_R011NNNY_partial_25_0238 := by
  native_decide

/-- Coefficient term 239 from coefficient polynomial 25. -/
def rs_R011_ueqv_R011NNNY_coefficient_25_0239 : Poly :=
[
  term ((8 : Rat) / 7) [(3, 1), (9, 2), (10, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 239 for generator 25. -/
def rs_R011_ueqv_R011NNNY_partial_25_0239 : Poly :=
[
  term ((-8 : Rat) / 7) [(3, 1), (9, 2), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((16 : Rat) / 7) [(3, 1), (9, 2), (10, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 239 for generator 25. -/
theorem rs_R011_ueqv_R011NNNY_partial_25_0239_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_25_0239
        rs_R011_ueqv_R011NNNY_generator_25_0200_0299 =
      rs_R011_ueqv_R011NNNY_partial_25_0239 := by
  native_decide

/-- Coefficient term 240 from coefficient polynomial 25. -/
def rs_R011_ueqv_R011NNNY_coefficient_25_0240 : Poly :=
[
  term ((-160 : Rat) / 7) [(3, 1), (9, 2), (10, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 240 for generator 25. -/
def rs_R011_ueqv_R011NNNY_partial_25_0240 : Poly :=
[
  term ((-320 : Rat) / 7) [(3, 1), (9, 2), (10, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((160 : Rat) / 7) [(3, 1), (9, 2), (10, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 240 for generator 25. -/
theorem rs_R011_ueqv_R011NNNY_partial_25_0240_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_25_0240
        rs_R011_ueqv_R011NNNY_generator_25_0200_0299 =
      rs_R011_ueqv_R011NNNY_partial_25_0240 := by
  native_decide

/-- Coefficient term 241 from coefficient polynomial 25. -/
def rs_R011_ueqv_R011NNNY_coefficient_25_0241 : Poly :=
[
  term ((-72 : Rat) / 7) [(3, 1), (9, 2), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 241 for generator 25. -/
def rs_R011_ueqv_R011NNNY_partial_25_0241 : Poly :=
[
  term ((-144 : Rat) / 7) [(3, 1), (9, 2), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((72 : Rat) / 7) [(3, 1), (9, 2), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 241 for generator 25. -/
theorem rs_R011_ueqv_R011NNNY_partial_25_0241_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_25_0241
        rs_R011_ueqv_R011NNNY_generator_25_0200_0299 =
      rs_R011_ueqv_R011NNNY_partial_25_0241 := by
  native_decide

/-- Coefficient term 242 from coefficient polynomial 25. -/
def rs_R011_ueqv_R011NNNY_coefficient_25_0242 : Poly :=
[
  term ((205 : Rat) / 7) [(3, 1), (9, 2), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 242 for generator 25. -/
def rs_R011_ueqv_R011NNNY_partial_25_0242 : Poly :=
[
  term ((410 : Rat) / 7) [(3, 1), (9, 2), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-205 : Rat) / 7) [(3, 1), (9, 2), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 242 for generator 25. -/
theorem rs_R011_ueqv_R011NNNY_partial_25_0242_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_25_0242
        rs_R011_ueqv_R011NNNY_generator_25_0200_0299 =
      rs_R011_ueqv_R011NNNY_partial_25_0242 := by
  native_decide

/-- Coefficient term 243 from coefficient polynomial 25. -/
def rs_R011_ueqv_R011NNNY_coefficient_25_0243 : Poly :=
[
  term ((-384 : Rat) / 7) [(3, 1), (9, 2), (10, 1), (15, 3), (16, 1)]
]

/-- Partial product 243 for generator 25. -/
def rs_R011_ueqv_R011NNNY_partial_25_0243 : Poly :=
[
  term ((-768 : Rat) / 7) [(3, 1), (9, 2), (10, 1), (12, 1), (15, 3), (16, 1)],
  term ((384 : Rat) / 7) [(3, 1), (9, 2), (10, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 243 for generator 25. -/
theorem rs_R011_ueqv_R011NNNY_partial_25_0243_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_25_0243
        rs_R011_ueqv_R011NNNY_generator_25_0200_0299 =
      rs_R011_ueqv_R011NNNY_partial_25_0243 := by
  native_decide

/-- Coefficient term 244 from coefficient polynomial 25. -/
def rs_R011_ueqv_R011NNNY_coefficient_25_0244 : Poly :=
[
  term (32 : Rat) [(3, 1), (9, 2), (11, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 244 for generator 25. -/
def rs_R011_ueqv_R011NNNY_partial_25_0244 : Poly :=
[
  term (-32 : Rat) [(3, 1), (9, 2), (11, 1), (12, 1), (15, 2), (16, 1)],
  term (64 : Rat) [(3, 1), (9, 2), (11, 1), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 244 for generator 25. -/
theorem rs_R011_ueqv_R011NNNY_partial_25_0244_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_25_0244
        rs_R011_ueqv_R011NNNY_generator_25_0200_0299 =
      rs_R011_ueqv_R011NNNY_partial_25_0244 := by
  native_decide

/-- Coefficient term 245 from coefficient polynomial 25. -/
def rs_R011_ueqv_R011NNNY_coefficient_25_0245 : Poly :=
[
  term ((72 : Rat) / 7) [(3, 1), (9, 2), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 245 for generator 25. -/
def rs_R011_ueqv_R011NNNY_partial_25_0245 : Poly :=
[
  term ((-72 : Rat) / 7) [(3, 1), (9, 2), (11, 1), (12, 1), (16, 1)],
  term ((144 : Rat) / 7) [(3, 1), (9, 2), (11, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 245 for generator 25. -/
theorem rs_R011_ueqv_R011NNNY_partial_25_0245_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_25_0245
        rs_R011_ueqv_R011NNNY_generator_25_0200_0299 =
      rs_R011_ueqv_R011NNNY_partial_25_0245 := by
  native_decide

/-- Coefficient term 246 from coefficient polynomial 25. -/
def rs_R011_ueqv_R011NNNY_coefficient_25_0246 : Poly :=
[
  term (16 : Rat) [(3, 1), (9, 2), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 246 for generator 25. -/
def rs_R011_ueqv_R011NNNY_partial_25_0246 : Poly :=
[
  term (32 : Rat) [(3, 1), (9, 2), (11, 1), (12, 1), (15, 2), (16, 1)],
  term (-16 : Rat) [(3, 1), (9, 2), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 246 for generator 25. -/
theorem rs_R011_ueqv_R011NNNY_partial_25_0246_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_25_0246
        rs_R011_ueqv_R011NNNY_generator_25_0200_0299 =
      rs_R011_ueqv_R011NNNY_partial_25_0246 := by
  native_decide

/-- Coefficient term 247 from coefficient polynomial 25. -/
def rs_R011_ueqv_R011NNNY_coefficient_25_0247 : Poly :=
[
  term ((36 : Rat) / 7) [(3, 1), (9, 2), (11, 1), (16, 1)]
]

/-- Partial product 247 for generator 25. -/
def rs_R011_ueqv_R011NNNY_partial_25_0247 : Poly :=
[
  term ((72 : Rat) / 7) [(3, 1), (9, 2), (11, 1), (12, 1), (16, 1)],
  term ((-36 : Rat) / 7) [(3, 1), (9, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 247 for generator 25. -/
theorem rs_R011_ueqv_R011NNNY_partial_25_0247_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_25_0247
        rs_R011_ueqv_R011NNNY_generator_25_0200_0299 =
      rs_R011_ueqv_R011NNNY_partial_25_0247 := by
  native_decide

/-- Coefficient term 248 from coefficient polynomial 25. -/
def rs_R011_ueqv_R011NNNY_coefficient_25_0248 : Poly :=
[
  term ((-36 : Rat) / 7) [(3, 1), (9, 2), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 248 for generator 25. -/
def rs_R011_ueqv_R011NNNY_partial_25_0248 : Poly :=
[
  term ((36 : Rat) / 7) [(3, 1), (9, 2), (12, 1), (13, 1), (16, 1)],
  term ((-72 : Rat) / 7) [(3, 1), (9, 2), (12, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 248 for generator 25. -/
theorem rs_R011_ueqv_R011NNNY_partial_25_0248_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_25_0248
        rs_R011_ueqv_R011NNNY_generator_25_0200_0299 =
      rs_R011_ueqv_R011NNNY_partial_25_0248 := by
  native_decide

/-- Coefficient term 249 from coefficient polynomial 25. -/
def rs_R011_ueqv_R011NNNY_coefficient_25_0249 : Poly :=
[
  term ((-24 : Rat) / 7) [(3, 1), (9, 2), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 249 for generator 25. -/
def rs_R011_ueqv_R011NNNY_partial_25_0249 : Poly :=
[
  term ((24 : Rat) / 7) [(3, 1), (9, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-48 : Rat) / 7) [(3, 1), (9, 2), (12, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 249 for generator 25. -/
theorem rs_R011_ueqv_R011NNNY_partial_25_0249_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_25_0249
        rs_R011_ueqv_R011NNNY_generator_25_0200_0299 =
      rs_R011_ueqv_R011NNNY_partial_25_0249 := by
  native_decide

/-- Coefficient term 250 from coefficient polynomial 25. -/
def rs_R011_ueqv_R011NNNY_coefficient_25_0250 : Poly :=
[
  term ((-41 : Rat) / 14) [(3, 1), (9, 2), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 250 for generator 25. -/
def rs_R011_ueqv_R011NNNY_partial_25_0250 : Poly :=
[
  term ((41 : Rat) / 14) [(3, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((-41 : Rat) / 7) [(3, 1), (9, 2), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 250 for generator 25. -/
theorem rs_R011_ueqv_R011NNNY_partial_25_0250_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_25_0250
        rs_R011_ueqv_R011NNNY_generator_25_0200_0299 =
      rs_R011_ueqv_R011NNNY_partial_25_0250 := by
  native_decide

/-- Coefficient term 251 from coefficient polynomial 25. -/
def rs_R011_ueqv_R011NNNY_coefficient_25_0251 : Poly :=
[
  term ((192 : Rat) / 7) [(3, 1), (9, 2), (12, 1), (15, 3), (16, 1)]
]

/-- Partial product 251 for generator 25. -/
def rs_R011_ueqv_R011NNNY_partial_25_0251 : Poly :=
[
  term ((-192 : Rat) / 7) [(3, 1), (9, 2), (12, 1), (15, 3), (16, 1)],
  term ((384 : Rat) / 7) [(3, 1), (9, 2), (12, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 251 for generator 25. -/
theorem rs_R011_ueqv_R011NNNY_partial_25_0251_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_25_0251
        rs_R011_ueqv_R011NNNY_generator_25_0200_0299 =
      rs_R011_ueqv_R011NNNY_partial_25_0251 := by
  native_decide

/-- Coefficient term 252 from coefficient polynomial 25. -/
def rs_R011_ueqv_R011NNNY_coefficient_25_0252 : Poly :=
[
  term ((-18 : Rat) / 7) [(3, 1), (9, 2), (13, 1), (16, 1)]
]

/-- Partial product 252 for generator 25. -/
def rs_R011_ueqv_R011NNNY_partial_25_0252 : Poly :=
[
  term ((-36 : Rat) / 7) [(3, 1), (9, 2), (12, 1), (13, 1), (16, 1)],
  term ((18 : Rat) / 7) [(3, 1), (9, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 252 for generator 25. -/
theorem rs_R011_ueqv_R011NNNY_partial_25_0252_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_25_0252
        rs_R011_ueqv_R011NNNY_generator_25_0200_0299 =
      rs_R011_ueqv_R011NNNY_partial_25_0252 := by
  native_decide

/-- Coefficient term 253 from coefficient polynomial 25. -/
def rs_R011_ueqv_R011NNNY_coefficient_25_0253 : Poly :=
[
  term ((-12 : Rat) / 7) [(3, 1), (9, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 253 for generator 25. -/
def rs_R011_ueqv_R011NNNY_partial_25_0253 : Poly :=
[
  term ((-24 : Rat) / 7) [(3, 1), (9, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((12 : Rat) / 7) [(3, 1), (9, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 253 for generator 25. -/
theorem rs_R011_ueqv_R011NNNY_partial_25_0253_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_25_0253
        rs_R011_ueqv_R011NNNY_generator_25_0200_0299 =
      rs_R011_ueqv_R011NNNY_partial_25_0253 := by
  native_decide

/-- Coefficient term 254 from coefficient polynomial 25. -/
def rs_R011_ueqv_R011NNNY_coefficient_25_0254 : Poly :=
[
  term ((-41 : Rat) / 28) [(3, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 254 for generator 25. -/
def rs_R011_ueqv_R011NNNY_partial_25_0254 : Poly :=
[
  term ((-41 : Rat) / 14) [(3, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((41 : Rat) / 28) [(3, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 254 for generator 25. -/
theorem rs_R011_ueqv_R011NNNY_partial_25_0254_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_25_0254
        rs_R011_ueqv_R011NNNY_generator_25_0200_0299 =
      rs_R011_ueqv_R011NNNY_partial_25_0254 := by
  native_decide

/-- Coefficient term 255 from coefficient polynomial 25. -/
def rs_R011_ueqv_R011NNNY_coefficient_25_0255 : Poly :=
[
  term ((96 : Rat) / 7) [(3, 1), (9, 2), (15, 3), (16, 1)]
]

/-- Partial product 255 for generator 25. -/
def rs_R011_ueqv_R011NNNY_partial_25_0255 : Poly :=
[
  term ((192 : Rat) / 7) [(3, 1), (9, 2), (12, 1), (15, 3), (16, 1)],
  term ((-96 : Rat) / 7) [(3, 1), (9, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 255 for generator 25. -/
theorem rs_R011_ueqv_R011NNNY_partial_25_0255_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_25_0255
        rs_R011_ueqv_R011NNNY_generator_25_0200_0299 =
      rs_R011_ueqv_R011NNNY_partial_25_0255 := by
  native_decide

/-- Coefficient term 256 from coefficient polynomial 25. -/
def rs_R011_ueqv_R011NNNY_coefficient_25_0256 : Poly :=
[
  term ((160 : Rat) / 7) [(3, 1), (9, 3), (10, 1), (15, 2), (16, 1)]
]

/-- Partial product 256 for generator 25. -/
def rs_R011_ueqv_R011NNNY_partial_25_0256 : Poly :=
[
  term ((320 : Rat) / 7) [(3, 1), (9, 3), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-160 : Rat) / 7) [(3, 1), (9, 3), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 256 for generator 25. -/
theorem rs_R011_ueqv_R011NNNY_partial_25_0256_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_25_0256
        rs_R011_ueqv_R011NNNY_generator_25_0200_0299 =
      rs_R011_ueqv_R011NNNY_partial_25_0256 := by
  native_decide

/-- Coefficient term 257 from coefficient polynomial 25. -/
def rs_R011_ueqv_R011NNNY_coefficient_25_0257 : Poly :=
[
  term ((72 : Rat) / 7) [(3, 1), (9, 3), (10, 1), (16, 1)]
]

/-- Partial product 257 for generator 25. -/
def rs_R011_ueqv_R011NNNY_partial_25_0257 : Poly :=
[
  term ((144 : Rat) / 7) [(3, 1), (9, 3), (10, 1), (12, 1), (16, 1)],
  term ((-72 : Rat) / 7) [(3, 1), (9, 3), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 257 for generator 25. -/
theorem rs_R011_ueqv_R011NNNY_partial_25_0257_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_25_0257
        rs_R011_ueqv_R011NNNY_generator_25_0200_0299 =
      rs_R011_ueqv_R011NNNY_partial_25_0257 := by
  native_decide

/-- Coefficient term 258 from coefficient polynomial 25. -/
def rs_R011_ueqv_R011NNNY_coefficient_25_0258 : Poly :=
[
  term ((-80 : Rat) / 7) [(3, 1), (9, 3), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 258 for generator 25. -/
def rs_R011_ueqv_R011NNNY_partial_25_0258 : Poly :=
[
  term ((80 : Rat) / 7) [(3, 1), (9, 3), (12, 1), (15, 2), (16, 1)],
  term ((-160 : Rat) / 7) [(3, 1), (9, 3), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 258 for generator 25. -/
theorem rs_R011_ueqv_R011NNNY_partial_25_0258_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_25_0258
        rs_R011_ueqv_R011NNNY_generator_25_0200_0299 =
      rs_R011_ueqv_R011NNNY_partial_25_0258 := by
  native_decide

/-- Coefficient term 259 from coefficient polynomial 25. -/
def rs_R011_ueqv_R011NNNY_coefficient_25_0259 : Poly :=
[
  term ((-36 : Rat) / 7) [(3, 1), (9, 3), (12, 1), (16, 1)]
]

/-- Partial product 259 for generator 25. -/
def rs_R011_ueqv_R011NNNY_partial_25_0259 : Poly :=
[
  term ((36 : Rat) / 7) [(3, 1), (9, 3), (12, 1), (16, 1)],
  term ((-72 : Rat) / 7) [(3, 1), (9, 3), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 259 for generator 25. -/
theorem rs_R011_ueqv_R011NNNY_partial_25_0259_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_25_0259
        rs_R011_ueqv_R011NNNY_generator_25_0200_0299 =
      rs_R011_ueqv_R011NNNY_partial_25_0259 := by
  native_decide

/-- Coefficient term 260 from coefficient polynomial 25. -/
def rs_R011_ueqv_R011NNNY_coefficient_25_0260 : Poly :=
[
  term ((-40 : Rat) / 7) [(3, 1), (9, 3), (15, 2), (16, 1)]
]

/-- Partial product 260 for generator 25. -/
def rs_R011_ueqv_R011NNNY_partial_25_0260 : Poly :=
[
  term ((-80 : Rat) / 7) [(3, 1), (9, 3), (12, 1), (15, 2), (16, 1)],
  term ((40 : Rat) / 7) [(3, 1), (9, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 260 for generator 25. -/
theorem rs_R011_ueqv_R011NNNY_partial_25_0260_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_25_0260
        rs_R011_ueqv_R011NNNY_generator_25_0200_0299 =
      rs_R011_ueqv_R011NNNY_partial_25_0260 := by
  native_decide

/-- Coefficient term 261 from coefficient polynomial 25. -/
def rs_R011_ueqv_R011NNNY_coefficient_25_0261 : Poly :=
[
  term ((-18 : Rat) / 7) [(3, 1), (9, 3), (16, 1)]
]

/-- Partial product 261 for generator 25. -/
def rs_R011_ueqv_R011NNNY_partial_25_0261 : Poly :=
[
  term ((-36 : Rat) / 7) [(3, 1), (9, 3), (12, 1), (16, 1)],
  term ((18 : Rat) / 7) [(3, 1), (9, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 261 for generator 25. -/
theorem rs_R011_ueqv_R011NNNY_partial_25_0261_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_25_0261
        rs_R011_ueqv_R011NNNY_generator_25_0200_0299 =
      rs_R011_ueqv_R011NNNY_partial_25_0261 := by
  native_decide

/-- Coefficient term 262 from coefficient polynomial 25. -/
def rs_R011_ueqv_R011NNNY_coefficient_25_0262 : Poly :=
[
  term ((-8 : Rat) / 7) [(3, 1), (10, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 262 for generator 25. -/
def rs_R011_ueqv_R011NNNY_partial_25_0262 : Poly :=
[
  term ((8 : Rat) / 7) [(3, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((-16 : Rat) / 7) [(3, 1), (10, 1), (11, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 262 for generator 25. -/
theorem rs_R011_ueqv_R011NNNY_partial_25_0262_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_25_0262
        rs_R011_ueqv_R011NNNY_generator_25_0200_0299 =
      rs_R011_ueqv_R011NNNY_partial_25_0262 := by
  native_decide

/-- Coefficient term 263 from coefficient polynomial 25. -/
def rs_R011_ueqv_R011NNNY_coefficient_25_0263 : Poly :=
[
  term ((32 : Rat) / 7) [(3, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 263 for generator 25. -/
def rs_R011_ueqv_R011NNNY_partial_25_0263 : Poly :=
[
  term ((64 : Rat) / 7) [(3, 1), (10, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-32 : Rat) / 7) [(3, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 263 for generator 25. -/
theorem rs_R011_ueqv_R011NNNY_partial_25_0263_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_25_0263
        rs_R011_ueqv_R011NNNY_generator_25_0200_0299 =
      rs_R011_ueqv_R011NNNY_partial_25_0263 := by
  native_decide

/-- Coefficient term 264 from coefficient polynomial 25. -/
def rs_R011_ueqv_R011NNNY_coefficient_25_0264 : Poly :=
[
  term ((16 : Rat) / 7) [(3, 1), (10, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 264 for generator 25. -/
def rs_R011_ueqv_R011NNNY_partial_25_0264 : Poly :=
[
  term ((32 : Rat) / 7) [(3, 1), (10, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-16 : Rat) / 7) [(3, 1), (10, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 264 for generator 25. -/
theorem rs_R011_ueqv_R011NNNY_partial_25_0264_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_25_0264
        rs_R011_ueqv_R011NNNY_generator_25_0200_0299 =
      rs_R011_ueqv_R011NNNY_partial_25_0264 := by
  native_decide

/-- Coefficient term 265 from coefficient polynomial 25. -/
def rs_R011_ueqv_R011NNNY_coefficient_25_0265 : Poly :=
[
  term ((-4 : Rat) / 7) [(3, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 265 for generator 25. -/
def rs_R011_ueqv_R011NNNY_partial_25_0265 : Poly :=
[
  term ((-8 : Rat) / 7) [(3, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((4 : Rat) / 7) [(3, 1), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 265 for generator 25. -/
theorem rs_R011_ueqv_R011NNNY_partial_25_0265_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_25_0265
        rs_R011_ueqv_R011NNNY_generator_25_0200_0299 =
      rs_R011_ueqv_R011NNNY_partial_25_0265 := by
  native_decide

/-- Coefficient term 266 from coefficient polynomial 25. -/
def rs_R011_ueqv_R011NNNY_coefficient_25_0266 : Poly :=
[
  term ((32 : Rat) / 7) [(3, 1), (10, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 266 for generator 25. -/
def rs_R011_ueqv_R011NNNY_partial_25_0266 : Poly :=
[
  term ((-32 : Rat) / 7) [(3, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((64 : Rat) / 7) [(3, 1), (10, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 266 for generator 25. -/
theorem rs_R011_ueqv_R011NNNY_partial_25_0266_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_25_0266
        rs_R011_ueqv_R011NNNY_generator_25_0200_0299 =
      rs_R011_ueqv_R011NNNY_partial_25_0266 := by
  native_decide

/-- Coefficient term 267 from coefficient polynomial 25. -/
def rs_R011_ueqv_R011NNNY_coefficient_25_0267 : Poly :=
[
  term (-8 : Rat) [(3, 1), (10, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 267 for generator 25. -/
def rs_R011_ueqv_R011NNNY_partial_25_0267 : Poly :=
[
  term (-16 : Rat) [(3, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term (8 : Rat) [(3, 1), (10, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 267 for generator 25. -/
theorem rs_R011_ueqv_R011NNNY_partial_25_0267_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_25_0267
        rs_R011_ueqv_R011NNNY_generator_25_0200_0299 =
      rs_R011_ueqv_R011NNNY_partial_25_0267 := by
  native_decide

/-- Coefficient term 268 from coefficient polynomial 25. -/
def rs_R011_ueqv_R011NNNY_coefficient_25_0268 : Poly :=
[
  term ((66 : Rat) / 7) [(3, 1), (10, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 268 for generator 25. -/
def rs_R011_ueqv_R011NNNY_partial_25_0268 : Poly :=
[
  term ((132 : Rat) / 7) [(3, 1), (10, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-66 : Rat) / 7) [(3, 1), (10, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 268 for generator 25. -/
theorem rs_R011_ueqv_R011NNNY_partial_25_0268_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_25_0268
        rs_R011_ueqv_R011NNNY_generator_25_0200_0299 =
      rs_R011_ueqv_R011NNNY_partial_25_0268 := by
  native_decide

/-- Coefficient term 269 from coefficient polynomial 25. -/
def rs_R011_ueqv_R011NNNY_coefficient_25_0269 : Poly :=
[
  term ((-34 : Rat) / 7) [(3, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 269 for generator 25. -/
def rs_R011_ueqv_R011NNNY_partial_25_0269 : Poly :=
[
  term ((-68 : Rat) / 7) [(3, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((34 : Rat) / 7) [(3, 1), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 269 for generator 25. -/
theorem rs_R011_ueqv_R011NNNY_partial_25_0269_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_25_0269
        rs_R011_ueqv_R011NNNY_generator_25_0200_0299 =
      rs_R011_ueqv_R011NNNY_partial_25_0269 := by
  native_decide

/-- Coefficient term 270 from coefficient polynomial 25. -/
def rs_R011_ueqv_R011NNNY_coefficient_25_0270 : Poly :=
[
  term ((30 : Rat) / 7) [(3, 1), (10, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 270 for generator 25. -/
def rs_R011_ueqv_R011NNNY_partial_25_0270 : Poly :=
[
  term ((60 : Rat) / 7) [(3, 1), (10, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-30 : Rat) / 7) [(3, 1), (10, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 270 for generator 25. -/
theorem rs_R011_ueqv_R011NNNY_partial_25_0270_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_25_0270
        rs_R011_ueqv_R011NNNY_generator_25_0200_0299 =
      rs_R011_ueqv_R011NNNY_partial_25_0270 := by
  native_decide

/-- Coefficient term 271 from coefficient polynomial 25. -/
def rs_R011_ueqv_R011NNNY_coefficient_25_0271 : Poly :=
[
  term ((-18 : Rat) / 7) [(3, 1), (10, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 271 for generator 25. -/
def rs_R011_ueqv_R011NNNY_partial_25_0271 : Poly :=
[
  term ((-36 : Rat) / 7) [(3, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((18 : Rat) / 7) [(3, 1), (10, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 271 for generator 25. -/
theorem rs_R011_ueqv_R011NNNY_partial_25_0271_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_25_0271
        rs_R011_ueqv_R011NNNY_generator_25_0200_0299 =
      rs_R011_ueqv_R011NNNY_partial_25_0271 := by
  native_decide

/-- Coefficient term 272 from coefficient polynomial 25. -/
def rs_R011_ueqv_R011NNNY_coefficient_25_0272 : Poly :=
[
  term ((-125 : Rat) / 14) [(3, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 272 for generator 25. -/
def rs_R011_ueqv_R011NNNY_partial_25_0272 : Poly :=
[
  term ((-125 : Rat) / 7) [(3, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((125 : Rat) / 14) [(3, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 272 for generator 25. -/
theorem rs_R011_ueqv_R011NNNY_partial_25_0272_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_25_0272
        rs_R011_ueqv_R011NNNY_generator_25_0200_0299 =
      rs_R011_ueqv_R011NNNY_partial_25_0272 := by
  native_decide

/-- Coefficient term 273 from coefficient polynomial 25. -/
def rs_R011_ueqv_R011NNNY_coefficient_25_0273 : Poly :=
[
  term ((8 : Rat) / 7) [(3, 1), (10, 2), (13, 1), (16, 1)]
]

/-- Partial product 273 for generator 25. -/
def rs_R011_ueqv_R011NNNY_partial_25_0273 : Poly :=
[
  term ((16 : Rat) / 7) [(3, 1), (10, 2), (12, 1), (13, 1), (16, 1)],
  term ((-8 : Rat) / 7) [(3, 1), (10, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 273 for generator 25. -/
theorem rs_R011_ueqv_R011NNNY_partial_25_0273_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_25_0273
        rs_R011_ueqv_R011NNNY_generator_25_0200_0299 =
      rs_R011_ueqv_R011NNNY_partial_25_0273 := by
  native_decide

/-- Coefficient term 274 from coefficient polynomial 25. -/
def rs_R011_ueqv_R011NNNY_coefficient_25_0274 : Poly :=
[
  term ((80 : Rat) / 7) [(3, 1), (10, 2), (15, 1), (16, 1)]
]

/-- Partial product 274 for generator 25. -/
def rs_R011_ueqv_R011NNNY_partial_25_0274 : Poly :=
[
  term ((160 : Rat) / 7) [(3, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((-80 : Rat) / 7) [(3, 1), (10, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 274 for generator 25. -/
theorem rs_R011_ueqv_R011NNNY_partial_25_0274_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_25_0274
        rs_R011_ueqv_R011NNNY_generator_25_0200_0299 =
      rs_R011_ueqv_R011NNNY_partial_25_0274 := by
  native_decide

/-- Coefficient term 275 from coefficient polynomial 25. -/
def rs_R011_ueqv_R011NNNY_coefficient_25_0275 : Poly :=
[
  term ((-30 : Rat) / 7) [(3, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 275 for generator 25. -/
def rs_R011_ueqv_R011NNNY_partial_25_0275 : Poly :=
[
  term ((30 : Rat) / 7) [(3, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-60 : Rat) / 7) [(3, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 275 for generator 25. -/
theorem rs_R011_ueqv_R011NNNY_partial_25_0275_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_25_0275
        rs_R011_ueqv_R011NNNY_generator_25_0200_0299 =
      rs_R011_ueqv_R011NNNY_partial_25_0275 := by
  native_decide

/-- Coefficient term 276 from coefficient polynomial 25. -/
def rs_R011_ueqv_R011NNNY_coefficient_25_0276 : Poly :=
[
  term ((24 : Rat) / 7) [(3, 1), (11, 1), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 276 for generator 25. -/
def rs_R011_ueqv_R011NNNY_partial_25_0276 : Poly :=
[
  term ((-24 : Rat) / 7) [(3, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((48 : Rat) / 7) [(3, 1), (11, 1), (12, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 276 for generator 25. -/
theorem rs_R011_ueqv_R011NNNY_partial_25_0276_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_25_0276
        rs_R011_ueqv_R011NNNY_generator_25_0200_0299 =
      rs_R011_ueqv_R011NNNY_partial_25_0276 := by
  native_decide

/-- Coefficient term 277 from coefficient polynomial 25. -/
def rs_R011_ueqv_R011NNNY_coefficient_25_0277 : Poly :=
[
  term (-18 : Rat) [(3, 1), (11, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 277 for generator 25. -/
def rs_R011_ueqv_R011NNNY_partial_25_0277 : Poly :=
[
  term (18 : Rat) [(3, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term (-36 : Rat) [(3, 1), (11, 1), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 277 for generator 25. -/
theorem rs_R011_ueqv_R011NNNY_partial_25_0277_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_25_0277
        rs_R011_ueqv_R011NNNY_generator_25_0200_0299 =
      rs_R011_ueqv_R011NNNY_partial_25_0277 := by
  native_decide

/-- Coefficient term 278 from coefficient polynomial 25. -/
def rs_R011_ueqv_R011NNNY_coefficient_25_0278 : Poly :=
[
  term ((34 : Rat) / 7) [(3, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 278 for generator 25. -/
def rs_R011_ueqv_R011NNNY_partial_25_0278 : Poly :=
[
  term ((-34 : Rat) / 7) [(3, 1), (11, 1), (12, 1), (16, 1)],
  term ((68 : Rat) / 7) [(3, 1), (11, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 278 for generator 25. -/
theorem rs_R011_ueqv_R011NNNY_partial_25_0278_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_25_0278
        rs_R011_ueqv_R011NNNY_generator_25_0200_0299 =
      rs_R011_ueqv_R011NNNY_partial_25_0278 := by
  native_decide

/-- Coefficient term 279 from coefficient polynomial 25. -/
def rs_R011_ueqv_R011NNNY_coefficient_25_0279 : Poly :=
[
  term ((60 : Rat) / 7) [(3, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 279 for generator 25. -/
def rs_R011_ueqv_R011NNNY_partial_25_0279 : Poly :=
[
  term ((120 : Rat) / 7) [(3, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-60 : Rat) / 7) [(3, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 279 for generator 25. -/
theorem rs_R011_ueqv_R011NNNY_partial_25_0279_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_25_0279
        rs_R011_ueqv_R011NNNY_generator_25_0200_0299 =
      rs_R011_ueqv_R011NNNY_partial_25_0279 := by
  native_decide

/-- Coefficient term 280 from coefficient polynomial 25. -/
def rs_R011_ueqv_R011NNNY_coefficient_25_0280 : Poly :=
[
  term ((-15 : Rat) / 7) [(3, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 280 for generator 25. -/
def rs_R011_ueqv_R011NNNY_partial_25_0280 : Poly :=
[
  term ((-30 : Rat) / 7) [(3, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((15 : Rat) / 7) [(3, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 280 for generator 25. -/
theorem rs_R011_ueqv_R011NNNY_partial_25_0280_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_25_0280
        rs_R011_ueqv_R011NNNY_generator_25_0200_0299 =
      rs_R011_ueqv_R011NNNY_partial_25_0280 := by
  native_decide

/-- Coefficient term 281 from coefficient polynomial 25. -/
def rs_R011_ueqv_R011NNNY_coefficient_25_0281 : Poly :=
[
  term ((20 : Rat) / 7) [(3, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 281 for generator 25. -/
def rs_R011_ueqv_R011NNNY_partial_25_0281 : Poly :=
[
  term ((40 : Rat) / 7) [(3, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-20 : Rat) / 7) [(3, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 281 for generator 25. -/
theorem rs_R011_ueqv_R011NNNY_partial_25_0281_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_25_0281
        rs_R011_ueqv_R011NNNY_generator_25_0200_0299 =
      rs_R011_ueqv_R011NNNY_partial_25_0281 := by
  native_decide

/-- Coefficient term 282 from coefficient polynomial 25. -/
def rs_R011_ueqv_R011NNNY_coefficient_25_0282 : Poly :=
[
  term ((-48 : Rat) / 7) [(3, 1), (11, 1), (14, 2), (16, 1)]
]

/-- Partial product 282 for generator 25. -/
def rs_R011_ueqv_R011NNNY_partial_25_0282 : Poly :=
[
  term ((-96 : Rat) / 7) [(3, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((48 : Rat) / 7) [(3, 1), (11, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 282 for generator 25. -/
theorem rs_R011_ueqv_R011NNNY_partial_25_0282_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_25_0282
        rs_R011_ueqv_R011NNNY_generator_25_0200_0299 =
      rs_R011_ueqv_R011NNNY_partial_25_0282 := by
  native_decide

/-- Coefficient term 283 from coefficient polynomial 25. -/
def rs_R011_ueqv_R011NNNY_coefficient_25_0283 : Poly :=
[
  term (-9 : Rat) [(3, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 283 for generator 25. -/
def rs_R011_ueqv_R011NNNY_partial_25_0283 : Poly :=
[
  term (-18 : Rat) [(3, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term (9 : Rat) [(3, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 283 for generator 25. -/
theorem rs_R011_ueqv_R011NNNY_partial_25_0283_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_25_0283
        rs_R011_ueqv_R011NNNY_generator_25_0200_0299 =
      rs_R011_ueqv_R011NNNY_partial_25_0283 := by
  native_decide

/-- Coefficient term 284 from coefficient polynomial 25. -/
def rs_R011_ueqv_R011NNNY_coefficient_25_0284 : Poly :=
[
  term ((17 : Rat) / 7) [(3, 1), (11, 1), (16, 1)]
]

/-- Partial product 284 for generator 25. -/
def rs_R011_ueqv_R011NNNY_partial_25_0284 : Poly :=
[
  term ((34 : Rat) / 7) [(3, 1), (11, 1), (12, 1), (16, 1)],
  term ((-17 : Rat) / 7) [(3, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 284 for generator 25. -/
theorem rs_R011_ueqv_R011NNNY_partial_25_0284_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_25_0284
        rs_R011_ueqv_R011NNNY_generator_25_0200_0299 =
      rs_R011_ueqv_R011NNNY_partial_25_0284 := by
  native_decide

/-- Coefficient term 285 from coefficient polynomial 25. -/
def rs_R011_ueqv_R011NNNY_coefficient_25_0285 : Poly :=
[
  term ((-32 : Rat) / 7) [(3, 1), (11, 2), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 285 for generator 25. -/
def rs_R011_ueqv_R011NNNY_partial_25_0285 : Poly :=
[
  term ((32 : Rat) / 7) [(3, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-64 : Rat) / 7) [(3, 1), (11, 2), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 285 for generator 25. -/
theorem rs_R011_ueqv_R011NNNY_partial_25_0285_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_25_0285
        rs_R011_ueqv_R011NNNY_generator_25_0200_0299 =
      rs_R011_ueqv_R011NNNY_partial_25_0285 := by
  native_decide

/-- Coefficient term 286 from coefficient polynomial 25. -/
def rs_R011_ueqv_R011NNNY_coefficient_25_0286 : Poly :=
[
  term ((-16 : Rat) / 7) [(3, 1), (11, 2), (15, 1), (16, 1)]
]

/-- Partial product 286 for generator 25. -/
def rs_R011_ueqv_R011NNNY_partial_25_0286 : Poly :=
[
  term ((-32 : Rat) / 7) [(3, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((16 : Rat) / 7) [(3, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 286 for generator 25. -/
theorem rs_R011_ueqv_R011NNNY_partial_25_0286_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_25_0286
        rs_R011_ueqv_R011NNNY_generator_25_0200_0299 =
      rs_R011_ueqv_R011NNNY_partial_25_0286 := by
  native_decide

/-- Coefficient term 287 from coefficient polynomial 25. -/
def rs_R011_ueqv_R011NNNY_coefficient_25_0287 : Poly :=
[
  term ((30 : Rat) / 7) [(3, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 287 for generator 25. -/
def rs_R011_ueqv_R011NNNY_partial_25_0287 : Poly :=
[
  term ((-30 : Rat) / 7) [(3, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((60 : Rat) / 7) [(3, 1), (12, 2), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 287 for generator 25. -/
theorem rs_R011_ueqv_R011NNNY_partial_25_0287_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_25_0287
        rs_R011_ueqv_R011NNNY_generator_25_0200_0299 =
      rs_R011_ueqv_R011NNNY_partial_25_0287 := by
  native_decide

/-- Coefficient term 288 from coefficient polynomial 25. -/
def rs_R011_ueqv_R011NNNY_coefficient_25_0288 : Poly :=
[
  term ((-15 : Rat) / 7) [(3, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 288 for generator 25. -/
def rs_R011_ueqv_R011NNNY_partial_25_0288 : Poly :=
[
  term ((15 : Rat) / 7) [(3, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-30 : Rat) / 7) [(3, 1), (12, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 288 for generator 25. -/
theorem rs_R011_ueqv_R011NNNY_partial_25_0288_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_25_0288
        rs_R011_ueqv_R011NNNY_generator_25_0200_0299 =
      rs_R011_ueqv_R011NNNY_partial_25_0288 := by
  native_decide

/-- Coefficient term 289 from coefficient polynomial 25. -/
def rs_R011_ueqv_R011NNNY_coefficient_25_0289 : Poly :=
[
  term ((-7 : Rat) / 2) [(3, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 289 for generator 25. -/
def rs_R011_ueqv_R011NNNY_partial_25_0289 : Poly :=
[
  term ((7 : Rat) / 2) [(3, 1), (12, 1), (15, 1), (16, 1)],
  term (-7 : Rat) [(3, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 289 for generator 25. -/
theorem rs_R011_ueqv_R011NNNY_partial_25_0289_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_25_0289
        rs_R011_ueqv_R011NNNY_generator_25_0200_0299 =
      rs_R011_ueqv_R011NNNY_partial_25_0289 := by
  native_decide

/-- Coefficient term 290 from coefficient polynomial 25. -/
def rs_R011_ueqv_R011NNNY_coefficient_25_0290 : Poly :=
[
  term ((32 : Rat) / 7) [(3, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 290 for generator 25. -/
def rs_R011_ueqv_R011NNNY_partial_25_0290 : Poly :=
[
  term ((64 : Rat) / 7) [(3, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-32 : Rat) / 7) [(3, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 290 for generator 25. -/
theorem rs_R011_ueqv_R011NNNY_partial_25_0290_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_25_0290
        rs_R011_ueqv_R011NNNY_generator_25_0200_0299 =
      rs_R011_ueqv_R011NNNY_partial_25_0290 := by
  native_decide

/-- Coefficient term 291 from coefficient polynomial 25. -/
def rs_R011_ueqv_R011NNNY_coefficient_25_0291 : Poly :=
[
  term ((15 : Rat) / 7) [(3, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 291 for generator 25. -/
def rs_R011_ueqv_R011NNNY_partial_25_0291 : Poly :=
[
  term ((30 : Rat) / 7) [(3, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-15 : Rat) / 7) [(3, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 291 for generator 25. -/
theorem rs_R011_ueqv_R011NNNY_partial_25_0291_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_25_0291
        rs_R011_ueqv_R011NNNY_generator_25_0200_0299 =
      rs_R011_ueqv_R011NNNY_partial_25_0291 := by
  native_decide

/-- Coefficient term 292 from coefficient polynomial 25. -/
def rs_R011_ueqv_R011NNNY_coefficient_25_0292 : Poly :=
[
  term ((-30 : Rat) / 7) [(3, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 292 for generator 25. -/
def rs_R011_ueqv_R011NNNY_partial_25_0292 : Poly :=
[
  term ((-60 : Rat) / 7) [(3, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((30 : Rat) / 7) [(3, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 292 for generator 25. -/
theorem rs_R011_ueqv_R011NNNY_partial_25_0292_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_25_0292
        rs_R011_ueqv_R011NNNY_generator_25_0200_0299 =
      rs_R011_ueqv_R011NNNY_partial_25_0292 := by
  native_decide

/-- Coefficient term 293 from coefficient polynomial 25. -/
def rs_R011_ueqv_R011NNNY_coefficient_25_0293 : Poly :=
[
  term (6 : Rat) [(3, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 293 for generator 25. -/
def rs_R011_ueqv_R011NNNY_partial_25_0293 : Poly :=
[
  term (12 : Rat) [(3, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(3, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 293 for generator 25. -/
theorem rs_R011_ueqv_R011NNNY_partial_25_0293_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_25_0293
        rs_R011_ueqv_R011NNNY_generator_25_0200_0299 =
      rs_R011_ueqv_R011NNNY_partial_25_0293 := by
  native_decide

/-- Coefficient term 294 from coefficient polynomial 25. -/
def rs_R011_ueqv_R011NNNY_coefficient_25_0294 : Poly :=
[
  term ((-7 : Rat) / 4) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 294 for generator 25. -/
def rs_R011_ueqv_R011NNNY_partial_25_0294 : Poly :=
[
  term ((-7 : Rat) / 2) [(3, 1), (12, 1), (15, 1), (16, 1)],
  term ((7 : Rat) / 4) [(3, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 294 for generator 25. -/
theorem rs_R011_ueqv_R011NNNY_partial_25_0294_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_25_0294
        rs_R011_ueqv_R011NNNY_generator_25_0200_0299 =
      rs_R011_ueqv_R011NNNY_partial_25_0294 := by
  native_decide

/-- Coefficient term 295 from coefficient polynomial 25. -/
def rs_R011_ueqv_R011NNNY_coefficient_25_0295 : Poly :=
[
  term ((16 : Rat) / 7) [(4, 1), (7, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 295 for generator 25. -/
def rs_R011_ueqv_R011NNNY_partial_25_0295 : Poly :=
[
  term ((32 : Rat) / 7) [(4, 1), (7, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-16 : Rat) / 7) [(4, 1), (7, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 295 for generator 25. -/
theorem rs_R011_ueqv_R011NNNY_partial_25_0295_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_25_0295
        rs_R011_ueqv_R011NNNY_generator_25_0200_0299 =
      rs_R011_ueqv_R011NNNY_partial_25_0295 := by
  native_decide

/-- Coefficient term 296 from coefficient polynomial 25. -/
def rs_R011_ueqv_R011NNNY_coefficient_25_0296 : Poly :=
[
  term ((-4 : Rat) / 7) [(4, 1), (7, 1), (9, 1), (10, 1), (16, 1)]
]

/-- Partial product 296 for generator 25. -/
def rs_R011_ueqv_R011NNNY_partial_25_0296 : Poly :=
[
  term ((-8 : Rat) / 7) [(4, 1), (7, 1), (9, 1), (10, 1), (12, 1), (16, 1)],
  term ((4 : Rat) / 7) [(4, 1), (7, 1), (9, 1), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 296 for generator 25. -/
theorem rs_R011_ueqv_R011NNNY_partial_25_0296_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_25_0296
        rs_R011_ueqv_R011NNNY_generator_25_0200_0299 =
      rs_R011_ueqv_R011NNNY_partial_25_0296 := by
  native_decide

/-- Coefficient term 297 from coefficient polynomial 25. -/
def rs_R011_ueqv_R011NNNY_coefficient_25_0297 : Poly :=
[
  term ((-32 : Rat) / 7) [(4, 1), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 297 for generator 25. -/
def rs_R011_ueqv_R011NNNY_partial_25_0297 : Poly :=
[
  term ((-64 : Rat) / 7) [(4, 1), (7, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((32 : Rat) / 7) [(4, 1), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 297 for generator 25. -/
theorem rs_R011_ueqv_R011NNNY_partial_25_0297_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_25_0297
        rs_R011_ueqv_R011NNNY_generator_25_0200_0299 =
      rs_R011_ueqv_R011NNNY_partial_25_0297 := by
  native_decide

/-- Coefficient term 298 from coefficient polynomial 25. -/
def rs_R011_ueqv_R011NNNY_coefficient_25_0298 : Poly :=
[
  term ((-6 : Rat) / 7) [(4, 1), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 298 for generator 25. -/
def rs_R011_ueqv_R011NNNY_partial_25_0298 : Poly :=
[
  term ((-12 : Rat) / 7) [(4, 1), (7, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((6 : Rat) / 7) [(4, 1), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 298 for generator 25. -/
theorem rs_R011_ueqv_R011NNNY_partial_25_0298_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_25_0298
        rs_R011_ueqv_R011NNNY_generator_25_0200_0299 =
      rs_R011_ueqv_R011NNNY_partial_25_0298 := by
  native_decide

/-- Coefficient term 299 from coefficient polynomial 25. -/
def rs_R011_ueqv_R011NNNY_coefficient_25_0299 : Poly :=
[
  term ((-122 : Rat) / 7) [(4, 1), (7, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 299 for generator 25. -/
def rs_R011_ueqv_R011NNNY_partial_25_0299 : Poly :=
[
  term ((-244 : Rat) / 7) [(4, 1), (7, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((122 : Rat) / 7) [(4, 1), (7, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 299 for generator 25. -/
theorem rs_R011_ueqv_R011NNNY_partial_25_0299_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_25_0299
        rs_R011_ueqv_R011NNNY_generator_25_0200_0299 =
      rs_R011_ueqv_R011NNNY_partial_25_0299 := by
  native_decide

/-- Partial products in this block. -/
def rs_R011_ueqv_R011NNNY_partials_25_0200_0299 : List Poly :=
[
  rs_R011_ueqv_R011NNNY_partial_25_0200,
  rs_R011_ueqv_R011NNNY_partial_25_0201,
  rs_R011_ueqv_R011NNNY_partial_25_0202,
  rs_R011_ueqv_R011NNNY_partial_25_0203,
  rs_R011_ueqv_R011NNNY_partial_25_0204,
  rs_R011_ueqv_R011NNNY_partial_25_0205,
  rs_R011_ueqv_R011NNNY_partial_25_0206,
  rs_R011_ueqv_R011NNNY_partial_25_0207,
  rs_R011_ueqv_R011NNNY_partial_25_0208,
  rs_R011_ueqv_R011NNNY_partial_25_0209,
  rs_R011_ueqv_R011NNNY_partial_25_0210,
  rs_R011_ueqv_R011NNNY_partial_25_0211,
  rs_R011_ueqv_R011NNNY_partial_25_0212,
  rs_R011_ueqv_R011NNNY_partial_25_0213,
  rs_R011_ueqv_R011NNNY_partial_25_0214,
  rs_R011_ueqv_R011NNNY_partial_25_0215,
  rs_R011_ueqv_R011NNNY_partial_25_0216,
  rs_R011_ueqv_R011NNNY_partial_25_0217,
  rs_R011_ueqv_R011NNNY_partial_25_0218,
  rs_R011_ueqv_R011NNNY_partial_25_0219,
  rs_R011_ueqv_R011NNNY_partial_25_0220,
  rs_R011_ueqv_R011NNNY_partial_25_0221,
  rs_R011_ueqv_R011NNNY_partial_25_0222,
  rs_R011_ueqv_R011NNNY_partial_25_0223,
  rs_R011_ueqv_R011NNNY_partial_25_0224,
  rs_R011_ueqv_R011NNNY_partial_25_0225,
  rs_R011_ueqv_R011NNNY_partial_25_0226,
  rs_R011_ueqv_R011NNNY_partial_25_0227,
  rs_R011_ueqv_R011NNNY_partial_25_0228,
  rs_R011_ueqv_R011NNNY_partial_25_0229,
  rs_R011_ueqv_R011NNNY_partial_25_0230,
  rs_R011_ueqv_R011NNNY_partial_25_0231,
  rs_R011_ueqv_R011NNNY_partial_25_0232,
  rs_R011_ueqv_R011NNNY_partial_25_0233,
  rs_R011_ueqv_R011NNNY_partial_25_0234,
  rs_R011_ueqv_R011NNNY_partial_25_0235,
  rs_R011_ueqv_R011NNNY_partial_25_0236,
  rs_R011_ueqv_R011NNNY_partial_25_0237,
  rs_R011_ueqv_R011NNNY_partial_25_0238,
  rs_R011_ueqv_R011NNNY_partial_25_0239,
  rs_R011_ueqv_R011NNNY_partial_25_0240,
  rs_R011_ueqv_R011NNNY_partial_25_0241,
  rs_R011_ueqv_R011NNNY_partial_25_0242,
  rs_R011_ueqv_R011NNNY_partial_25_0243,
  rs_R011_ueqv_R011NNNY_partial_25_0244,
  rs_R011_ueqv_R011NNNY_partial_25_0245,
  rs_R011_ueqv_R011NNNY_partial_25_0246,
  rs_R011_ueqv_R011NNNY_partial_25_0247,
  rs_R011_ueqv_R011NNNY_partial_25_0248,
  rs_R011_ueqv_R011NNNY_partial_25_0249,
  rs_R011_ueqv_R011NNNY_partial_25_0250,
  rs_R011_ueqv_R011NNNY_partial_25_0251,
  rs_R011_ueqv_R011NNNY_partial_25_0252,
  rs_R011_ueqv_R011NNNY_partial_25_0253,
  rs_R011_ueqv_R011NNNY_partial_25_0254,
  rs_R011_ueqv_R011NNNY_partial_25_0255,
  rs_R011_ueqv_R011NNNY_partial_25_0256,
  rs_R011_ueqv_R011NNNY_partial_25_0257,
  rs_R011_ueqv_R011NNNY_partial_25_0258,
  rs_R011_ueqv_R011NNNY_partial_25_0259,
  rs_R011_ueqv_R011NNNY_partial_25_0260,
  rs_R011_ueqv_R011NNNY_partial_25_0261,
  rs_R011_ueqv_R011NNNY_partial_25_0262,
  rs_R011_ueqv_R011NNNY_partial_25_0263,
  rs_R011_ueqv_R011NNNY_partial_25_0264,
  rs_R011_ueqv_R011NNNY_partial_25_0265,
  rs_R011_ueqv_R011NNNY_partial_25_0266,
  rs_R011_ueqv_R011NNNY_partial_25_0267,
  rs_R011_ueqv_R011NNNY_partial_25_0268,
  rs_R011_ueqv_R011NNNY_partial_25_0269,
  rs_R011_ueqv_R011NNNY_partial_25_0270,
  rs_R011_ueqv_R011NNNY_partial_25_0271,
  rs_R011_ueqv_R011NNNY_partial_25_0272,
  rs_R011_ueqv_R011NNNY_partial_25_0273,
  rs_R011_ueqv_R011NNNY_partial_25_0274,
  rs_R011_ueqv_R011NNNY_partial_25_0275,
  rs_R011_ueqv_R011NNNY_partial_25_0276,
  rs_R011_ueqv_R011NNNY_partial_25_0277,
  rs_R011_ueqv_R011NNNY_partial_25_0278,
  rs_R011_ueqv_R011NNNY_partial_25_0279,
  rs_R011_ueqv_R011NNNY_partial_25_0280,
  rs_R011_ueqv_R011NNNY_partial_25_0281,
  rs_R011_ueqv_R011NNNY_partial_25_0282,
  rs_R011_ueqv_R011NNNY_partial_25_0283,
  rs_R011_ueqv_R011NNNY_partial_25_0284,
  rs_R011_ueqv_R011NNNY_partial_25_0285,
  rs_R011_ueqv_R011NNNY_partial_25_0286,
  rs_R011_ueqv_R011NNNY_partial_25_0287,
  rs_R011_ueqv_R011NNNY_partial_25_0288,
  rs_R011_ueqv_R011NNNY_partial_25_0289,
  rs_R011_ueqv_R011NNNY_partial_25_0290,
  rs_R011_ueqv_R011NNNY_partial_25_0291,
  rs_R011_ueqv_R011NNNY_partial_25_0292,
  rs_R011_ueqv_R011NNNY_partial_25_0293,
  rs_R011_ueqv_R011NNNY_partial_25_0294,
  rs_R011_ueqv_R011NNNY_partial_25_0295,
  rs_R011_ueqv_R011NNNY_partial_25_0296,
  rs_R011_ueqv_R011NNNY_partial_25_0297,
  rs_R011_ueqv_R011NNNY_partial_25_0298,
  rs_R011_ueqv_R011NNNY_partial_25_0299
]

/-- Sum of partial products in this block. -/
def rs_R011_ueqv_R011NNNY_block_25_0200_0299 : Poly :=
[
  term ((-96 : Rat) / 7) [(3, 1), (9, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((48 : Rat) / 7) [(3, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-256 : Rat) / 7) [(3, 1), (9, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((62 : Rat) / 7) [(3, 1), (9, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((768 : Rat) / 7) [(3, 1), (9, 1), (10, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-288 : Rat) / 7) [(3, 1), (9, 1), (10, 1), (12, 1), (13, 2), (16, 1)],
  term ((384 : Rat) / 7) [(3, 1), (9, 1), (10, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-192 : Rat) / 7) [(3, 1), (9, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term (-100 : Rat) [(3, 1), (9, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((232 : Rat) / 7) [(3, 1), (9, 1), (10, 1), (12, 1), (16, 1)],
  term ((64 : Rat) / 7) [(3, 1), (9, 1), (10, 1), (12, 2), (15, 2), (16, 1)],
  term ((-8 : Rat) / 7) [(3, 1), (9, 1), (10, 1), (12, 2), (16, 1)],
  term ((128 : Rat) / 7) [(3, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-31 : Rat) / 7) [(3, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-384 : Rat) / 7) [(3, 1), (9, 1), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((144 : Rat) / 7) [(3, 1), (9, 1), (10, 1), (13, 2), (16, 1)],
  term ((-192 : Rat) / 7) [(3, 1), (9, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((96 : Rat) / 7) [(3, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((334 : Rat) / 7) [(3, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((-114 : Rat) / 7) [(3, 1), (9, 1), (10, 1), (16, 1)],
  term ((64 : Rat) / 7) [(3, 1), (9, 1), (10, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-128 : Rat) / 7) [(3, 1), (9, 1), (10, 2), (12, 1), (15, 2), (16, 1)],
  term ((-32 : Rat) / 7) [(3, 1), (9, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((64 : Rat) / 7) [(3, 1), (9, 1), (10, 2), (15, 2), (16, 1)],
  term ((-576 : Rat) / 7) [(3, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term (64 : Rat) [(3, 1), (9, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-384 : Rat) / 7) [(3, 1), (9, 1), (11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((288 : Rat) / 7) [(3, 1), (9, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((192 : Rat) / 7) [(3, 1), (9, 1), (11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((354 : Rat) / 7) [(3, 1), (9, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-768 : Rat) / 7) [(3, 1), (9, 1), (11, 1), (12, 2), (15, 3), (16, 1)],
  term ((288 : Rat) / 7) [(3, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-72 : Rat) / 7) [(3, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-272 : Rat) / 7) [(3, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((192 : Rat) / 7) [(3, 1), (9, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-177 : Rat) / 14) [(3, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((192 : Rat) / 7) [(3, 1), (9, 1), (11, 1), (15, 3), (16, 1)],
  term ((-256 : Rat) / 7) [(3, 1), (9, 1), (11, 2), (12, 2), (15, 2), (16, 1)],
  term ((64 : Rat) / 7) [(3, 1), (9, 1), (11, 2), (15, 2), (16, 1)],
  term (-32 : Rat) [(3, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((192 : Rat) / 7) [(3, 1), (9, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((288 : Rat) / 7) [(3, 1), (9, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-96 : Rat) / 7) [(3, 1), (9, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-48 : Rat) / 7) [(3, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term (-39 : Rat) [(3, 1), (9, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-192 : Rat) / 7) [(3, 1), (9, 1), (12, 2), (14, 1), (15, 2), (16, 1)],
  term ((120 : Rat) / 7) [(3, 1), (9, 1), (12, 2), (14, 1), (16, 1)],
  term ((416 : Rat) / 7) [(3, 1), (9, 1), (12, 2), (15, 2), (16, 1)],
  term ((-88 : Rat) / 7) [(3, 1), (9, 1), (12, 2), (16, 1)],
  term (16 : Rat) [(3, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-96 : Rat) / 7) [(3, 1), (9, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((39 : Rat) / 4) [(3, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-144 : Rat) / 7) [(3, 1), (9, 1), (13, 2), (14, 1), (16, 1)],
  term ((96 : Rat) / 7) [(3, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((-6 : Rat) / 7) [(3, 1), (9, 1), (14, 1), (16, 1)],
  term ((-104 : Rat) / 7) [(3, 1), (9, 1), (15, 2), (16, 1)],
  term ((22 : Rat) / 7) [(3, 1), (9, 1), (16, 1)],
  term ((-256 : Rat) / 7) [(3, 1), (9, 2), (10, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((128 : Rat) / 7) [(3, 1), (9, 2), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((-320 : Rat) / 7) [(3, 1), (9, 2), (10, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-144 : Rat) / 7) [(3, 1), (9, 2), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((402 : Rat) / 7) [(3, 1), (9, 2), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-768 : Rat) / 7) [(3, 1), (9, 2), (10, 1), (12, 1), (15, 3), (16, 1)],
  term ((16 : Rat) / 7) [(3, 1), (9, 2), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((160 : Rat) / 7) [(3, 1), (9, 2), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((72 : Rat) / 7) [(3, 1), (9, 2), (10, 1), (13, 1), (16, 1)],
  term ((-205 : Rat) / 7) [(3, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((384 : Rat) / 7) [(3, 1), (9, 2), (10, 1), (15, 3), (16, 1)],
  term (64 : Rat) [(3, 1), (9, 2), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((144 : Rat) / 7) [(3, 1), (9, 2), (11, 1), (12, 2), (16, 1)],
  term (-16 : Rat) [(3, 1), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((-36 : Rat) / 7) [(3, 1), (9, 2), (11, 1), (16, 1)],
  term ((-72 : Rat) / 7) [(3, 1), (9, 2), (12, 2), (13, 1), (16, 1)],
  term ((-48 : Rat) / 7) [(3, 1), (9, 2), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-41 : Rat) / 7) [(3, 1), (9, 2), (12, 2), (15, 1), (16, 1)],
  term ((384 : Rat) / 7) [(3, 1), (9, 2), (12, 2), (15, 3), (16, 1)],
  term ((18 : Rat) / 7) [(3, 1), (9, 2), (13, 1), (16, 1)],
  term ((12 : Rat) / 7) [(3, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((41 : Rat) / 28) [(3, 1), (9, 2), (15, 1), (16, 1)],
  term ((-96 : Rat) / 7) [(3, 1), (9, 2), (15, 3), (16, 1)],
  term ((320 : Rat) / 7) [(3, 1), (9, 3), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((144 : Rat) / 7) [(3, 1), (9, 3), (10, 1), (12, 1), (16, 1)],
  term ((-160 : Rat) / 7) [(3, 1), (9, 3), (10, 1), (15, 2), (16, 1)],
  term ((-72 : Rat) / 7) [(3, 1), (9, 3), (10, 1), (16, 1)],
  term ((-160 : Rat) / 7) [(3, 1), (9, 3), (12, 2), (15, 2), (16, 1)],
  term ((-72 : Rat) / 7) [(3, 1), (9, 3), (12, 2), (16, 1)],
  term ((40 : Rat) / 7) [(3, 1), (9, 3), (15, 2), (16, 1)],
  term ((18 : Rat) / 7) [(3, 1), (9, 3), (16, 1)],
  term ((64 : Rat) / 7) [(3, 1), (10, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((32 : Rat) / 7) [(3, 1), (10, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-16 : Rat) / 7) [(3, 1), (10, 1), (11, 1), (12, 2), (16, 1)],
  term ((-32 : Rat) / 7) [(3, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-16 : Rat) / 7) [(3, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((4 : Rat) / 7) [(3, 1), (10, 1), (11, 1), (16, 1)],
  term (-16 : Rat) [(3, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((132 : Rat) / 7) [(3, 1), (10, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-68 : Rat) / 7) [(3, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((60 : Rat) / 7) [(3, 1), (10, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-36 : Rat) / 7) [(3, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-157 : Rat) / 7) [(3, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((64 : Rat) / 7) [(3, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term (8 : Rat) [(3, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-66 : Rat) / 7) [(3, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((34 : Rat) / 7) [(3, 1), (10, 1), (13, 1), (16, 1)],
  term ((-30 : Rat) / 7) [(3, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((18 : Rat) / 7) [(3, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((125 : Rat) / 14) [(3, 1), (10, 1), (15, 1), (16, 1)],
  term ((16 : Rat) / 7) [(3, 1), (10, 2), (12, 1), (13, 1), (16, 1)],
  term ((160 : Rat) / 7) [(3, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((-8 : Rat) / 7) [(3, 1), (10, 2), (13, 1), (16, 1)],
  term ((-80 : Rat) / 7) [(3, 1), (10, 2), (15, 1), (16, 1)],
  term ((120 : Rat) / 7) [(3, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((16 : Rat) / 7) [(3, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-96 : Rat) / 7) [(3, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((-60 : Rat) / 7) [(3, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((48 : Rat) / 7) [(3, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term (-36 : Rat) [(3, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((68 : Rat) / 7) [(3, 1), (11, 1), (12, 2), (16, 1)],
  term ((-60 : Rat) / 7) [(3, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((15 : Rat) / 7) [(3, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-20 : Rat) / 7) [(3, 1), (11, 1), (14, 1), (16, 1)],
  term ((48 : Rat) / 7) [(3, 1), (11, 1), (14, 2), (16, 1)],
  term (9 : Rat) [(3, 1), (11, 1), (15, 2), (16, 1)],
  term ((-17 : Rat) / 7) [(3, 1), (11, 1), (16, 1)],
  term ((-64 : Rat) / 7) [(3, 1), (11, 2), (12, 2), (15, 1), (16, 1)],
  term ((16 : Rat) / 7) [(3, 1), (11, 2), (15, 1), (16, 1)],
  term ((64 : Rat) / 7) [(3, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-60 : Rat) / 7) [(3, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((99 : Rat) / 7) [(3, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((60 : Rat) / 7) [(3, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-30 : Rat) / 7) [(3, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term (-7 : Rat) [(3, 1), (12, 2), (15, 1), (16, 1)],
  term ((-32 : Rat) / 7) [(3, 1), (13, 1), (14, 1), (16, 1)],
  term ((-15 : Rat) / 7) [(3, 1), (13, 1), (15, 2), (16, 1)],
  term ((30 : Rat) / 7) [(3, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term (-6 : Rat) [(3, 1), (14, 1), (15, 1), (16, 1)],
  term ((7 : Rat) / 4) [(3, 1), (15, 1), (16, 1)],
  term ((32 : Rat) / 7) [(4, 1), (7, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-16 : Rat) / 7) [(4, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-8 : Rat) / 7) [(4, 1), (7, 1), (9, 1), (10, 1), (12, 1), (16, 1)],
  term ((4 : Rat) / 7) [(4, 1), (7, 1), (9, 1), (10, 1), (16, 1)],
  term ((-64 : Rat) / 7) [(4, 1), (7, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((32 : Rat) / 7) [(4, 1), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-12 : Rat) / 7) [(4, 1), (7, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-244 : Rat) / 7) [(4, 1), (7, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((6 : Rat) / 7) [(4, 1), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((122 : Rat) / 7) [(4, 1), (7, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 25, terms 200 through 299. -/
theorem rs_R011_ueqv_R011NNNY_block_25_0200_0299_valid :
    checkProductSumEq rs_R011_ueqv_R011NNNY_partials_25_0200_0299
      rs_R011_ueqv_R011NNNY_block_25_0200_0299 = true := by
  native_decide

end R011UeqvR011NNNYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
