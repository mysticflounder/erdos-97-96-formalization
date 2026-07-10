/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NNNNN, term block 30:400-499

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NNNNNTermShards

/-- Generator polynomial 30 for relaxed split surplus certificate `R009:u=v:R009NNNNN`. -/
def rs_R009_ueqv_R009NNNNN_generator_30_0400_0499 : Poly :=
[
  term (2 : Rat) [(12, 1), (14, 1)],
  term (-1 : Rat) [(12, 2)],
  term (2 : Rat) [(13, 1), (15, 1)],
  term (-1 : Rat) [(13, 2)]
]

/-- Coefficient term 400 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNN_coefficient_30_0400 : Poly :=
[
  term ((101231 : Rat) / 1767) [(5, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 400 for generator 30. -/
def rs_R009_ueqv_R009NNNNN_partial_30_0400 : Poly :=
[
  term ((202462 : Rat) / 1767) [(5, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-101231 : Rat) / 1767) [(5, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((202462 : Rat) / 1767) [(5, 1), (12, 2), (14, 2), (15, 1), (16, 1)],
  term ((-101231 : Rat) / 1767) [(5, 1), (12, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 400 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNN_partial_30_0400_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_30_0400
        rs_R009_ueqv_R009NNNNN_generator_30_0400_0499 =
      rs_R009_ueqv_R009NNNNN_partial_30_0400 := by
  native_decide

/-- Coefficient term 401 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNN_coefficient_30_0401 : Poly :=
[
  term ((175087 : Rat) / 1178) [(5, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 401 for generator 30. -/
def rs_R009_ueqv_R009NNNNN_partial_30_0401 : Poly :=
[
  term ((175087 : Rat) / 589) [(5, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-175087 : Rat) / 1178) [(5, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((175087 : Rat) / 589) [(5, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-175087 : Rat) / 1178) [(5, 1), (12, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 401 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNN_partial_30_0401_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_30_0401
        rs_R009_ueqv_R009NNNNN_generator_30_0400_0499 =
      rs_R009_ueqv_R009NNNNN_partial_30_0401 := by
  native_decide

/-- Coefficient term 402 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNN_coefficient_30_0402 : Poly :=
[
  term ((-1140 : Rat) / 31) [(5, 1), (12, 2), (13, 1), (16, 1)]
]

/-- Partial product 402 for generator 30. -/
def rs_R009_ueqv_R009NNNNN_partial_30_0402 : Poly :=
[
  term ((-2280 : Rat) / 31) [(5, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((1140 : Rat) / 31) [(5, 1), (12, 2), (13, 3), (16, 1)],
  term ((-2280 : Rat) / 31) [(5, 1), (12, 3), (13, 1), (14, 1), (16, 1)],
  term ((1140 : Rat) / 31) [(5, 1), (12, 4), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 402 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNN_partial_30_0402_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_30_0402
        rs_R009_ueqv_R009NNNNN_generator_30_0400_0499 =
      rs_R009_ueqv_R009NNNNN_partial_30_0402 := by
  native_decide

/-- Coefficient term 403 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNN_coefficient_30_0403 : Poly :=
[
  term ((-222934 : Rat) / 1767) [(5, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 403 for generator 30. -/
def rs_R009_ueqv_R009NNNNN_partial_30_0403 : Poly :=
[
  term ((-445868 : Rat) / 1767) [(5, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((222934 : Rat) / 1767) [(5, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((-445868 : Rat) / 1767) [(5, 1), (12, 3), (14, 1), (15, 1), (16, 1)],
  term ((222934 : Rat) / 1767) [(5, 1), (12, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 403 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNN_partial_30_0403_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_30_0403
        rs_R009_ueqv_R009NNNNN_generator_30_0400_0499 =
      rs_R009_ueqv_R009NNNNN_partial_30_0403 := by
  native_decide

/-- Coefficient term 404 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNN_coefficient_30_0404 : Poly :=
[
  term ((-1501 : Rat) / 62) [(5, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 404 for generator 30. -/
def rs_R009_ueqv_R009NNNNN_partial_30_0404 : Poly :=
[
  term ((-1501 : Rat) / 31) [(5, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((1501 : Rat) / 62) [(5, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-1501 : Rat) / 31) [(5, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((1501 : Rat) / 62) [(5, 1), (13, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 404 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNN_partial_30_0404_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_30_0404
        rs_R009_ueqv_R009NNNNN_generator_30_0400_0499 =
      rs_R009_ueqv_R009NNNNN_partial_30_0404 := by
  native_decide

/-- Coefficient term 405 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNN_coefficient_30_0405 : Poly :=
[
  term ((123976 : Rat) / 1767) [(5, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 405 for generator 30. -/
def rs_R009_ueqv_R009NNNNN_partial_30_0405 : Poly :=
[
  term ((247952 : Rat) / 1767) [(5, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-123976 : Rat) / 1767) [(5, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((247952 : Rat) / 1767) [(5, 1), (13, 2), (15, 3), (16, 1)],
  term ((-123976 : Rat) / 1767) [(5, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 405 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNN_partial_30_0405_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_30_0405
        rs_R009_ueqv_R009NNNNN_generator_30_0400_0499 =
      rs_R009_ueqv_R009NNNNN_partial_30_0405 := by
  native_decide

/-- Coefficient term 406 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNN_coefficient_30_0406 : Poly :=
[
  term ((-1273 : Rat) / 124) [(5, 1), (13, 1), (16, 1)]
]

/-- Partial product 406 for generator 30. -/
def rs_R009_ueqv_R009NNNNN_partial_30_0406 : Poly :=
[
  term ((-1273 : Rat) / 62) [(5, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((1273 : Rat) / 124) [(5, 1), (12, 2), (13, 1), (16, 1)],
  term ((-1273 : Rat) / 62) [(5, 1), (13, 2), (15, 1), (16, 1)],
  term ((1273 : Rat) / 124) [(5, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 406 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNN_partial_30_0406_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_30_0406
        rs_R009_ueqv_R009NNNNN_generator_30_0400_0499 =
      rs_R009_ueqv_R009NNNNN_partial_30_0406 := by
  native_decide

/-- Coefficient term 407 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNN_coefficient_30_0407 : Poly :=
[
  term ((456 : Rat) / 31) [(5, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 407 for generator 30. -/
def rs_R009_ueqv_R009NNNNN_partial_30_0407 : Poly :=
[
  term ((912 : Rat) / 31) [(5, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-456 : Rat) / 31) [(5, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((912 : Rat) / 31) [(5, 1), (13, 3), (15, 2), (16, 1)],
  term ((-456 : Rat) / 31) [(5, 1), (13, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 407 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNN_partial_30_0407_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_30_0407
        rs_R009_ueqv_R009NNNNN_generator_30_0400_0499 =
      rs_R009_ueqv_R009NNNNN_partial_30_0407 := by
  native_decide

/-- Coefficient term 408 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNN_coefficient_30_0408 : Poly :=
[
  term ((-214297 : Rat) / 2356) [(5, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 408 for generator 30. -/
def rs_R009_ueqv_R009NNNNN_partial_30_0408 : Poly :=
[
  term ((-214297 : Rat) / 1178) [(5, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((214297 : Rat) / 2356) [(5, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-214297 : Rat) / 1178) [(5, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((214297 : Rat) / 2356) [(5, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 408 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNN_partial_30_0408_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_30_0408
        rs_R009_ueqv_R009NNNNN_generator_30_0400_0499 =
      rs_R009_ueqv_R009NNNNN_partial_30_0408 := by
  native_decide

/-- Coefficient term 409 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNN_coefficient_30_0409 : Poly :=
[
  term ((-5922 : Rat) / 589) [(5, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 409 for generator 30. -/
def rs_R009_ueqv_R009NNNNN_partial_30_0409 : Poly :=
[
  term ((-11844 : Rat) / 589) [(5, 1), (12, 1), (14, 3), (15, 1), (16, 1)],
  term ((5922 : Rat) / 589) [(5, 1), (12, 2), (14, 2), (15, 1), (16, 1)],
  term ((-11844 : Rat) / 589) [(5, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((5922 : Rat) / 589) [(5, 1), (13, 2), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 409 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNN_partial_30_0409_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_30_0409
        rs_R009_ueqv_R009NNNNN_generator_30_0400_0499 =
      rs_R009_ueqv_R009NNNNN_partial_30_0409 := by
  native_decide

/-- Coefficient term 410 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNN_coefficient_30_0410 : Poly :=
[
  term ((-78503 : Rat) / 14136) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 410 for generator 30. -/
def rs_R009_ueqv_R009NNNNN_partial_30_0410 : Poly :=
[
  term ((-78503 : Rat) / 7068) [(5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((78503 : Rat) / 14136) [(5, 1), (12, 2), (15, 1), (16, 1)],
  term ((-78503 : Rat) / 7068) [(5, 1), (13, 1), (15, 2), (16, 1)],
  term ((78503 : Rat) / 14136) [(5, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 410 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNN_partial_30_0410_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_30_0410
        rs_R009_ueqv_R009NNNNN_generator_30_0400_0499 =
      rs_R009_ueqv_R009NNNNN_partial_30_0410 := by
  native_decide

/-- Coefficient term 411 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNN_coefficient_30_0411 : Poly :=
[
  term ((-5922 : Rat) / 589) [(5, 1), (15, 3), (16, 1)]
]

/-- Partial product 411 for generator 30. -/
def rs_R009_ueqv_R009NNNNN_partial_30_0411 : Poly :=
[
  term ((-11844 : Rat) / 589) [(5, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((5922 : Rat) / 589) [(5, 1), (12, 2), (15, 3), (16, 1)],
  term ((-11844 : Rat) / 589) [(5, 1), (13, 1), (15, 4), (16, 1)],
  term ((5922 : Rat) / 589) [(5, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 411 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNN_partial_30_0411_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_30_0411
        rs_R009_ueqv_R009NNNNN_generator_30_0400_0499 =
      rs_R009_ueqv_R009NNNNN_partial_30_0411 := by
  native_decide

/-- Coefficient term 412 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNN_coefficient_30_0412 : Poly :=
[
  term ((1026 : Rat) / 31) [(5, 2), (7, 1), (13, 1), (16, 1)]
]

/-- Partial product 412 for generator 30. -/
def rs_R009_ueqv_R009NNNNN_partial_30_0412 : Poly :=
[
  term ((2052 : Rat) / 31) [(5, 2), (7, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1026 : Rat) / 31) [(5, 2), (7, 1), (12, 2), (13, 1), (16, 1)],
  term ((2052 : Rat) / 31) [(5, 2), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1026 : Rat) / 31) [(5, 2), (7, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 412 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNN_partial_30_0412_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_30_0412
        rs_R009_ueqv_R009NNNNN_generator_30_0400_0499 =
      rs_R009_ueqv_R009NNNNN_partial_30_0412 := by
  native_decide

/-- Coefficient term 413 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNN_coefficient_30_0413 : Poly :=
[
  term ((92129 : Rat) / 589) [(5, 2), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 413 for generator 30. -/
def rs_R009_ueqv_R009NNNNN_partial_30_0413 : Poly :=
[
  term ((184258 : Rat) / 589) [(5, 2), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-92129 : Rat) / 589) [(5, 2), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((184258 : Rat) / 589) [(5, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-92129 : Rat) / 589) [(5, 2), (7, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 413 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNN_partial_30_0413_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_30_0413
        rs_R009_ueqv_R009NNNNN_generator_30_0400_0499 =
      rs_R009_ueqv_R009NNNNN_partial_30_0413 := by
  native_decide

/-- Coefficient term 414 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNN_coefficient_30_0414 : Poly :=
[
  term ((-190 : Rat) / 31) [(5, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 414 for generator 30. -/
def rs_R009_ueqv_R009NNNNN_partial_30_0414 : Poly :=
[
  term ((-380 : Rat) / 31) [(5, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((190 : Rat) / 31) [(5, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-380 : Rat) / 31) [(5, 2), (13, 2), (15, 2), (16, 1)],
  term ((190 : Rat) / 31) [(5, 2), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 414 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNN_partial_30_0414_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_30_0414
        rs_R009_ueqv_R009NNNNN_generator_30_0400_0499 =
      rs_R009_ueqv_R009NNNNN_partial_30_0414 := by
  native_decide

/-- Coefficient term 415 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNN_coefficient_30_0415 : Poly :=
[
  term ((-152 : Rat) / 31) [(5, 2), (14, 1), (16, 1)]
]

/-- Partial product 415 for generator 30. -/
def rs_R009_ueqv_R009NNNNN_partial_30_0415 : Poly :=
[
  term ((-304 : Rat) / 31) [(5, 2), (12, 1), (14, 2), (16, 1)],
  term ((152 : Rat) / 31) [(5, 2), (12, 2), (14, 1), (16, 1)],
  term ((-304 : Rat) / 31) [(5, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((152 : Rat) / 31) [(5, 2), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 415 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNN_partial_30_0415_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_30_0415
        rs_R009_ueqv_R009NNNNN_generator_30_0400_0499 =
      rs_R009_ueqv_R009NNNNN_partial_30_0415 := by
  native_decide

/-- Coefficient term 416 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNN_coefficient_30_0416 : Poly :=
[
  term ((-57925 : Rat) / 1767) [(5, 2), (15, 2), (16, 1)]
]

/-- Partial product 416 for generator 30. -/
def rs_R009_ueqv_R009NNNNN_partial_30_0416 : Poly :=
[
  term ((-115850 : Rat) / 1767) [(5, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((57925 : Rat) / 1767) [(5, 2), (12, 2), (15, 2), (16, 1)],
  term ((-115850 : Rat) / 1767) [(5, 2), (13, 1), (15, 3), (16, 1)],
  term ((57925 : Rat) / 1767) [(5, 2), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 416 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNN_partial_30_0416_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_30_0416
        rs_R009_ueqv_R009NNNNN_generator_30_0400_0499 =
      rs_R009_ueqv_R009NNNNN_partial_30_0416 := by
  native_decide

/-- Coefficient term 417 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNN_coefficient_30_0417 : Poly :=
[
  term ((152 : Rat) / 31) [(5, 2), (16, 1)]
]

/-- Partial product 417 for generator 30. -/
def rs_R009_ueqv_R009NNNNN_partial_30_0417 : Poly :=
[
  term ((304 : Rat) / 31) [(5, 2), (12, 1), (14, 1), (16, 1)],
  term ((-152 : Rat) / 31) [(5, 2), (12, 2), (16, 1)],
  term ((304 : Rat) / 31) [(5, 2), (13, 1), (15, 1), (16, 1)],
  term ((-152 : Rat) / 31) [(5, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 417 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNN_partial_30_0417_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_30_0417
        rs_R009_ueqv_R009NNNNN_generator_30_0400_0499 =
      rs_R009_ueqv_R009NNNNN_partial_30_0417 := by
  native_decide

/-- Coefficient term 418 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNN_coefficient_30_0418 : Poly :=
[
  term ((-304 : Rat) / 31) [(7, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 418 for generator 30. -/
def rs_R009_ueqv_R009NNNNN_partial_30_0418 : Poly :=
[
  term ((-608 : Rat) / 31) [(7, 1), (10, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((304 : Rat) / 31) [(7, 1), (10, 1), (11, 1), (12, 2), (16, 1)],
  term ((-608 : Rat) / 31) [(7, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((304 : Rat) / 31) [(7, 1), (10, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 418 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNN_partial_30_0418_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_30_0418
        rs_R009_ueqv_R009NNNNN_generator_30_0400_0499 =
      rs_R009_ueqv_R009NNNNN_partial_30_0418 := by
  native_decide

/-- Coefficient term 419 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNN_coefficient_30_0419 : Poly :=
[
  term ((-456 : Rat) / 31) [(7, 1), (10, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 419 for generator 30. -/
def rs_R009_ueqv_R009NNNNN_partial_30_0419 : Poly :=
[
  term ((-912 : Rat) / 31) [(7, 1), (10, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((456 : Rat) / 31) [(7, 1), (10, 1), (12, 1), (13, 3), (16, 1)],
  term ((-912 : Rat) / 31) [(7, 1), (10, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((456 : Rat) / 31) [(7, 1), (10, 1), (12, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 419 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNN_partial_30_0419_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_30_0419
        rs_R009_ueqv_R009NNNNN_generator_30_0400_0499 =
      rs_R009_ueqv_R009NNNNN_partial_30_0419 := by
  native_decide

/-- Coefficient term 420 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNN_coefficient_30_0420 : Poly :=
[
  term ((-113740 : Rat) / 1767) [(7, 1), (10, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 420 for generator 30. -/
def rs_R009_ueqv_R009NNNNN_partial_30_0420 : Poly :=
[
  term ((-227480 : Rat) / 1767) [(7, 1), (10, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((113740 : Rat) / 1767) [(7, 1), (10, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-227480 : Rat) / 1767) [(7, 1), (10, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((113740 : Rat) / 1767) [(7, 1), (10, 1), (12, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 420 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNN_partial_30_0420_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_30_0420
        rs_R009_ueqv_R009NNNNN_generator_30_0400_0499 =
      rs_R009_ueqv_R009NNNNN_partial_30_0420 := by
  native_decide

/-- Coefficient term 421 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNN_coefficient_30_0421 : Poly :=
[
  term ((3971 : Rat) / 124) [(7, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 421 for generator 30. -/
def rs_R009_ueqv_R009NNNNN_partial_30_0421 : Poly :=
[
  term ((3971 : Rat) / 62) [(7, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-3971 : Rat) / 124) [(7, 1), (10, 1), (12, 2), (13, 1), (16, 1)],
  term ((3971 : Rat) / 62) [(7, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-3971 : Rat) / 124) [(7, 1), (10, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 421 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNN_partial_30_0421_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_30_0421
        rs_R009_ueqv_R009NNNNN_generator_30_0400_0499 =
      rs_R009_ueqv_R009NNNNN_partial_30_0421 := by
  native_decide

/-- Coefficient term 422 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNN_coefficient_30_0422 : Poly :=
[
  term ((584811 : Rat) / 4712) [(7, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 422 for generator 30. -/
def rs_R009_ueqv_R009NNNNN_partial_30_0422 : Poly :=
[
  term ((584811 : Rat) / 2356) [(7, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-584811 : Rat) / 4712) [(7, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((584811 : Rat) / 2356) [(7, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-584811 : Rat) / 4712) [(7, 1), (10, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 422 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNN_partial_30_0422_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_30_0422
        rs_R009_ueqv_R009NNNNN_generator_30_0400_0499 =
      rs_R009_ueqv_R009NNNNN_partial_30_0422 := by
  native_decide

/-- Coefficient term 423 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNN_coefficient_30_0423 : Poly :=
[
  term ((-1140 : Rat) / 31) [(7, 1), (10, 2), (13, 1), (16, 1)]
]

/-- Partial product 423 for generator 30. -/
def rs_R009_ueqv_R009NNNNN_partial_30_0423 : Poly :=
[
  term ((-2280 : Rat) / 31) [(7, 1), (10, 2), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((1140 : Rat) / 31) [(7, 1), (10, 2), (12, 2), (13, 1), (16, 1)],
  term ((-2280 : Rat) / 31) [(7, 1), (10, 2), (13, 2), (15, 1), (16, 1)],
  term ((1140 : Rat) / 31) [(7, 1), (10, 2), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 423 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNN_partial_30_0423_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_30_0423
        rs_R009_ueqv_R009NNNNN_generator_30_0400_0499 =
      rs_R009_ueqv_R009NNNNN_partial_30_0423 := by
  native_decide

/-- Coefficient term 424 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNN_coefficient_30_0424 : Poly :=
[
  term ((-284350 : Rat) / 1767) [(7, 1), (10, 2), (15, 1), (16, 1)]
]

/-- Partial product 424 for generator 30. -/
def rs_R009_ueqv_R009NNNNN_partial_30_0424 : Poly :=
[
  term ((-568700 : Rat) / 1767) [(7, 1), (10, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((284350 : Rat) / 1767) [(7, 1), (10, 2), (12, 2), (15, 1), (16, 1)],
  term ((-568700 : Rat) / 1767) [(7, 1), (10, 2), (13, 1), (15, 2), (16, 1)],
  term ((284350 : Rat) / 1767) [(7, 1), (10, 2), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 424 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNN_partial_30_0424_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_30_0424
        rs_R009_ueqv_R009NNNNN_generator_30_0400_0499 =
      rs_R009_ueqv_R009NNNNN_partial_30_0424 := by
  native_decide

/-- Coefficient term 425 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNN_coefficient_30_0425 : Poly :=
[
  term ((1316 : Rat) / 589) [(7, 1), (11, 1), (16, 1)]
]

/-- Partial product 425 for generator 30. -/
def rs_R009_ueqv_R009NNNNN_partial_30_0425 : Poly :=
[
  term ((2632 : Rat) / 589) [(7, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-1316 : Rat) / 589) [(7, 1), (11, 1), (12, 2), (16, 1)],
  term ((2632 : Rat) / 589) [(7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1316 : Rat) / 589) [(7, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 425 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNN_partial_30_0425_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_30_0425
        rs_R009_ueqv_R009NNNNN_generator_30_0400_0499 =
      rs_R009_ueqv_R009NNNNN_partial_30_0425 := by
  native_decide

/-- Coefficient term 426 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNN_coefficient_30_0426 : Poly :=
[
  term ((-171 : Rat) / 31) [(7, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 426 for generator 30. -/
def rs_R009_ueqv_R009NNNNN_partial_30_0426 : Poly :=
[
  term ((-342 : Rat) / 31) [(7, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((171 : Rat) / 31) [(7, 1), (12, 1), (13, 3), (14, 1), (16, 1)],
  term ((-342 : Rat) / 31) [(7, 1), (12, 2), (13, 1), (14, 2), (16, 1)],
  term ((171 : Rat) / 31) [(7, 1), (12, 3), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 426 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNN_partial_30_0426_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_30_0426
        rs_R009_ueqv_R009NNNNN_generator_30_0400_0499 =
      rs_R009_ueqv_R009NNNNN_partial_30_0426 := by
  native_decide

/-- Coefficient term 427 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNN_coefficient_30_0427 : Poly :=
[
  term ((1881 : Rat) / 31) [(7, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 427 for generator 30. -/
def rs_R009_ueqv_R009NNNNN_partial_30_0427 : Poly :=
[
  term ((3762 : Rat) / 31) [(7, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1881 : Rat) / 31) [(7, 1), (12, 1), (13, 3), (16, 1)],
  term ((3762 : Rat) / 31) [(7, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-1881 : Rat) / 31) [(7, 1), (12, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 427 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNN_partial_30_0427_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_30_0427
        rs_R009_ueqv_R009NNNNN_generator_30_0400_0499 =
      rs_R009_ueqv_R009NNNNN_partial_30_0427 := by
  native_decide

/-- Coefficient term 428 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNN_coefficient_30_0428 : Poly :=
[
  term ((-21611 : Rat) / 1178) [(7, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 428 for generator 30. -/
def rs_R009_ueqv_R009NNNNN_partial_30_0428 : Poly :=
[
  term ((-21611 : Rat) / 589) [(7, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((21611 : Rat) / 1178) [(7, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-21611 : Rat) / 589) [(7, 1), (12, 2), (14, 2), (15, 1), (16, 1)],
  term ((21611 : Rat) / 1178) [(7, 1), (12, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 428 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNN_partial_30_0428_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_30_0428
        rs_R009_ueqv_R009NNNNN_generator_30_0400_0499 =
      rs_R009_ueqv_R009NNNNN_partial_30_0428 := by
  native_decide

/-- Coefficient term 429 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNN_coefficient_30_0429 : Poly :=
[
  term ((280371 : Rat) / 1178) [(7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 429 for generator 30. -/
def rs_R009_ueqv_R009NNNNN_partial_30_0429 : Poly :=
[
  term ((280371 : Rat) / 589) [(7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-280371 : Rat) / 1178) [(7, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((280371 : Rat) / 589) [(7, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-280371 : Rat) / 1178) [(7, 1), (12, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 429 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNN_partial_30_0429_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_30_0429
        rs_R009_ueqv_R009NNNNN_generator_30_0400_0499 =
      rs_R009_ueqv_R009NNNNN_partial_30_0429 := by
  native_decide

/-- Coefficient term 430 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNN_coefficient_30_0430 : Poly :=
[
  term ((228 : Rat) / 31) [(7, 1), (12, 2), (13, 1), (16, 1)]
]

/-- Partial product 430 for generator 30. -/
def rs_R009_ueqv_R009NNNNN_partial_30_0430 : Poly :=
[
  term ((456 : Rat) / 31) [(7, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((-228 : Rat) / 31) [(7, 1), (12, 2), (13, 3), (16, 1)],
  term ((456 : Rat) / 31) [(7, 1), (12, 3), (13, 1), (14, 1), (16, 1)],
  term ((-228 : Rat) / 31) [(7, 1), (12, 4), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 430 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNN_partial_30_0430_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_30_0430
        rs_R009_ueqv_R009NNNNN_generator_30_0400_0499 =
      rs_R009_ueqv_R009NNNNN_partial_30_0430 := by
  native_decide

/-- Coefficient term 431 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNN_coefficient_30_0431 : Poly :=
[
  term ((51752 : Rat) / 1767) [(7, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 431 for generator 30. -/
def rs_R009_ueqv_R009NNNNN_partial_30_0431 : Poly :=
[
  term ((103504 : Rat) / 1767) [(7, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-51752 : Rat) / 1767) [(7, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((103504 : Rat) / 1767) [(7, 1), (12, 3), (14, 1), (15, 1), (16, 1)],
  term ((-51752 : Rat) / 1767) [(7, 1), (12, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 431 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNN_partial_30_0431_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_30_0431
        rs_R009_ueqv_R009NNNNN_generator_30_0400_0499 =
      rs_R009_ueqv_R009NNNNN_partial_30_0431 := by
  native_decide

/-- Coefficient term 432 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNN_coefficient_30_0432 : Poly :=
[
  term ((3078 : Rat) / 31) [(7, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 432 for generator 30. -/
def rs_R009_ueqv_R009NNNNN_partial_30_0432 : Poly :=
[
  term ((6156 : Rat) / 31) [(7, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((-3078 : Rat) / 31) [(7, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((6156 : Rat) / 31) [(7, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-3078 : Rat) / 31) [(7, 1), (13, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 432 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNN_partial_30_0432_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_30_0432
        rs_R009_ueqv_R009NNNNN_generator_30_0400_0499 =
      rs_R009_ueqv_R009NNNNN_partial_30_0432 := by
  native_decide

/-- Coefficient term 433 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNN_coefficient_30_0433 : Poly :=
[
  term ((-2907 : Rat) / 62) [(7, 1), (13, 1), (14, 2), (16, 1)]
]

/-- Partial product 433 for generator 30. -/
def rs_R009_ueqv_R009NNNNN_partial_30_0433 : Poly :=
[
  term ((-2907 : Rat) / 31) [(7, 1), (12, 1), (13, 1), (14, 3), (16, 1)],
  term ((2907 : Rat) / 62) [(7, 1), (12, 2), (13, 1), (14, 2), (16, 1)],
  term ((-2907 : Rat) / 31) [(7, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((2907 : Rat) / 62) [(7, 1), (13, 3), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 433 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNN_partial_30_0433_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_30_0433
        rs_R009_ueqv_R009NNNNN_generator_30_0400_0499 =
      rs_R009_ueqv_R009NNNNN_partial_30_0433 := by
  native_decide

/-- Coefficient term 434 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNN_coefficient_30_0434 : Poly :=
[
  term ((-38422 : Rat) / 589) [(7, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 434 for generator 30. -/
def rs_R009_ueqv_R009NNNNN_partial_30_0434 : Poly :=
[
  term ((-76844 : Rat) / 589) [(7, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((38422 : Rat) / 589) [(7, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-76844 : Rat) / 589) [(7, 1), (13, 2), (15, 3), (16, 1)],
  term ((38422 : Rat) / 589) [(7, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 434 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNN_partial_30_0434_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_30_0434
        rs_R009_ueqv_R009NNNNN_generator_30_0400_0499 =
      rs_R009_ueqv_R009NNNNN_partial_30_0434 := by
  native_decide

/-- Coefficient term 435 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNN_coefficient_30_0435 : Poly :=
[
  term ((-2413 : Rat) / 62) [(7, 1), (13, 1), (16, 1)]
]

/-- Partial product 435 for generator 30. -/
def rs_R009_ueqv_R009NNNNN_partial_30_0435 : Poly :=
[
  term ((-2413 : Rat) / 31) [(7, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((2413 : Rat) / 62) [(7, 1), (12, 2), (13, 1), (16, 1)],
  term ((-2413 : Rat) / 31) [(7, 1), (13, 2), (15, 1), (16, 1)],
  term ((2413 : Rat) / 62) [(7, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 435 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNN_partial_30_0435_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_30_0435
        rs_R009_ueqv_R009NNNNN_generator_30_0400_0499 =
      rs_R009_ueqv_R009NNNNN_partial_30_0435 := by
  native_decide

/-- Coefficient term 436 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNN_coefficient_30_0436 : Poly :=
[
  term ((1355 : Rat) / 57) [(7, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 436 for generator 30. -/
def rs_R009_ueqv_R009NNNNN_partial_30_0436 : Poly :=
[
  term ((2710 : Rat) / 57) [(7, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1355 : Rat) / 57) [(7, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((2710 : Rat) / 57) [(7, 1), (13, 3), (15, 2), (16, 1)],
  term ((-1355 : Rat) / 57) [(7, 1), (13, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 436 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNN_partial_30_0436_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_30_0436
        rs_R009_ueqv_R009NNNNN_generator_30_0400_0499 =
      rs_R009_ueqv_R009NNNNN_partial_30_0436 := by
  native_decide

/-- Coefficient term 437 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNN_coefficient_30_0437 : Poly :=
[
  term ((228 : Rat) / 31) [(7, 1), (13, 3), (16, 1)]
]

/-- Partial product 437 for generator 30. -/
def rs_R009_ueqv_R009NNNNN_partial_30_0437 : Poly :=
[
  term ((456 : Rat) / 31) [(7, 1), (12, 1), (13, 3), (14, 1), (16, 1)],
  term ((-228 : Rat) / 31) [(7, 1), (12, 2), (13, 3), (16, 1)],
  term ((456 : Rat) / 31) [(7, 1), (13, 4), (15, 1), (16, 1)],
  term ((-228 : Rat) / 31) [(7, 1), (13, 5), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 437 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNN_partial_30_0437_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_30_0437
        rs_R009_ueqv_R009NNNNN_generator_30_0400_0499 =
      rs_R009_ueqv_R009NNNNN_partial_30_0437 := by
  native_decide

/-- Coefficient term 438 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNN_coefficient_30_0438 : Poly :=
[
  term ((276387 : Rat) / 589) [(7, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 438 for generator 30. -/
def rs_R009_ueqv_R009NNNNN_partial_30_0438 : Poly :=
[
  term ((552774 : Rat) / 589) [(7, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-276387 : Rat) / 589) [(7, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((552774 : Rat) / 589) [(7, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-276387 : Rat) / 589) [(7, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 438 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNN_partial_30_0438_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_30_0438
        rs_R009_ueqv_R009NNNNN_generator_30_0400_0499 =
      rs_R009_ueqv_R009NNNNN_partial_30_0438 := by
  native_decide

/-- Coefficient term 439 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNN_coefficient_30_0439 : Poly :=
[
  term ((-531163 : Rat) / 2356) [(7, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 439 for generator 30. -/
def rs_R009_ueqv_R009NNNNN_partial_30_0439 : Poly :=
[
  term ((-531163 : Rat) / 1178) [(7, 1), (12, 1), (14, 3), (15, 1), (16, 1)],
  term ((531163 : Rat) / 2356) [(7, 1), (12, 2), (14, 2), (15, 1), (16, 1)],
  term ((-531163 : Rat) / 1178) [(7, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((531163 : Rat) / 2356) [(7, 1), (13, 2), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 439 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNN_partial_30_0439_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_30_0439
        rs_R009_ueqv_R009NNNNN_generator_30_0400_0499 =
      rs_R009_ueqv_R009NNNNN_partial_30_0439 := by
  native_decide

/-- Coefficient term 440 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNN_coefficient_30_0440 : Poly :=
[
  term ((-361697 : Rat) / 2356) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 440 for generator 30. -/
def rs_R009_ueqv_R009NNNNN_partial_30_0440 : Poly :=
[
  term ((-361697 : Rat) / 1178) [(7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((361697 : Rat) / 2356) [(7, 1), (12, 2), (15, 1), (16, 1)],
  term ((-361697 : Rat) / 1178) [(7, 1), (13, 1), (15, 2), (16, 1)],
  term ((361697 : Rat) / 2356) [(7, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 440 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNN_partial_30_0440_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_30_0440
        rs_R009_ueqv_R009NNNNN_generator_30_0400_0499 =
      rs_R009_ueqv_R009NNNNN_partial_30_0440 := by
  native_decide

/-- Coefficient term 441 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNN_coefficient_30_0441 : Poly :=
[
  term ((-531163 : Rat) / 2356) [(7, 1), (15, 3), (16, 1)]
]

/-- Partial product 441 for generator 30. -/
def rs_R009_ueqv_R009NNNNN_partial_30_0441 : Poly :=
[
  term ((-531163 : Rat) / 1178) [(7, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((531163 : Rat) / 2356) [(7, 1), (12, 2), (15, 3), (16, 1)],
  term ((-531163 : Rat) / 1178) [(7, 1), (13, 1), (15, 4), (16, 1)],
  term ((531163 : Rat) / 2356) [(7, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 441 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNN_partial_30_0441_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_30_0441
        rs_R009_ueqv_R009NNNNN_generator_30_0400_0499 =
      rs_R009_ueqv_R009NNNNN_partial_30_0441 := by
  native_decide

/-- Coefficient term 442 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNN_coefficient_30_0442 : Poly :=
[
  term ((9200 : Rat) / 1767) [(8, 1), (10, 1), (14, 1), (16, 1)]
]

/-- Partial product 442 for generator 30. -/
def rs_R009_ueqv_R009NNNNN_partial_30_0442 : Poly :=
[
  term ((18400 : Rat) / 1767) [(8, 1), (10, 1), (12, 1), (14, 2), (16, 1)],
  term ((-9200 : Rat) / 1767) [(8, 1), (10, 1), (12, 2), (14, 1), (16, 1)],
  term ((18400 : Rat) / 1767) [(8, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-9200 : Rat) / 1767) [(8, 1), (10, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 442 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNN_partial_30_0442_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_30_0442
        rs_R009_ueqv_R009NNNNN_generator_30_0400_0499 =
      rs_R009_ueqv_R009NNNNN_partial_30_0442 := by
  native_decide

/-- Coefficient term 443 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNN_coefficient_30_0443 : Poly :=
[
  term ((13800 : Rat) / 589) [(8, 1), (10, 1), (16, 1)]
]

/-- Partial product 443 for generator 30. -/
def rs_R009_ueqv_R009NNNNN_partial_30_0443 : Poly :=
[
  term ((27600 : Rat) / 589) [(8, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-13800 : Rat) / 589) [(8, 1), (10, 1), (12, 2), (16, 1)],
  term ((27600 : Rat) / 589) [(8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-13800 : Rat) / 589) [(8, 1), (10, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 443 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNN_partial_30_0443_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_30_0443
        rs_R009_ueqv_R009NNNNN_generator_30_0400_0499 =
      rs_R009_ueqv_R009NNNNN_partial_30_0443 := by
  native_decide

/-- Coefficient term 444 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNN_coefficient_30_0444 : Poly :=
[
  term ((114 : Rat) / 31) [(8, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 444 for generator 30. -/
def rs_R009_ueqv_R009NNNNN_partial_30_0444 : Poly :=
[
  term ((228 : Rat) / 31) [(8, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-114 : Rat) / 31) [(8, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((228 : Rat) / 31) [(8, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-114 : Rat) / 31) [(8, 1), (11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 444 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNN_partial_30_0444_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_30_0444
        rs_R009_ueqv_R009NNNNN_generator_30_0400_0499 =
      rs_R009_ueqv_R009NNNNN_partial_30_0444 := by
  native_decide

/-- Coefficient term 445 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNN_coefficient_30_0445 : Poly :=
[
  term ((41029 : Rat) / 1767) [(8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 445 for generator 30. -/
def rs_R009_ueqv_R009NNNNN_partial_30_0445 : Poly :=
[
  term ((82058 : Rat) / 1767) [(8, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-41029 : Rat) / 1767) [(8, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((82058 : Rat) / 1767) [(8, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-41029 : Rat) / 1767) [(8, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 445 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNN_partial_30_0445_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_30_0445
        rs_R009_ueqv_R009NNNNN_generator_30_0400_0499 =
      rs_R009_ueqv_R009NNNNN_partial_30_0445 := by
  native_decide

/-- Coefficient term 446 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNN_coefficient_30_0446 : Poly :=
[
  term ((-9200 : Rat) / 1767) [(8, 1), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 446 for generator 30. -/
def rs_R009_ueqv_R009NNNNN_partial_30_0446 : Poly :=
[
  term ((-18400 : Rat) / 1767) [(8, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((9200 : Rat) / 1767) [(8, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-18400 : Rat) / 1767) [(8, 1), (12, 2), (14, 2), (16, 1)],
  term ((9200 : Rat) / 1767) [(8, 1), (12, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 446 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNN_partial_30_0446_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_30_0446
        rs_R009_ueqv_R009NNNNN_generator_30_0400_0499 =
      rs_R009_ueqv_R009NNNNN_partial_30_0446 := by
  native_decide

/-- Coefficient term 447 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNN_coefficient_30_0447 : Poly :=
[
  term ((-4600 : Rat) / 1767) [(8, 1), (12, 1), (16, 1)]
]

/-- Partial product 447 for generator 30. -/
def rs_R009_ueqv_R009NNNNN_partial_30_0447 : Poly :=
[
  term ((-9200 : Rat) / 1767) [(8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((4600 : Rat) / 1767) [(8, 1), (12, 1), (13, 2), (16, 1)],
  term ((-9200 : Rat) / 1767) [(8, 1), (12, 2), (14, 1), (16, 1)],
  term ((4600 : Rat) / 1767) [(8, 1), (12, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 447 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNN_partial_30_0447_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_30_0447
        rs_R009_ueqv_R009NNNNN_generator_30_0400_0499 =
      rs_R009_ueqv_R009NNNNN_partial_30_0447 := by
  native_decide

/-- Coefficient term 448 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNN_coefficient_30_0448 : Poly :=
[
  term ((-18400 : Rat) / 1767) [(8, 1), (14, 2), (16, 1)]
]

/-- Partial product 448 for generator 30. -/
def rs_R009_ueqv_R009NNNNN_partial_30_0448 : Poly :=
[
  term ((-36800 : Rat) / 1767) [(8, 1), (12, 1), (14, 3), (16, 1)],
  term ((18400 : Rat) / 1767) [(8, 1), (12, 2), (14, 2), (16, 1)],
  term ((-36800 : Rat) / 1767) [(8, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((18400 : Rat) / 1767) [(8, 1), (13, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 448 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNN_partial_30_0448_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_30_0448
        rs_R009_ueqv_R009NNNNN_generator_30_0400_0499 =
      rs_R009_ueqv_R009NNNNN_partial_30_0448 := by
  native_decide

/-- Coefficient term 449 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNN_coefficient_30_0449 : Poly :=
[
  term ((-32200 : Rat) / 1767) [(8, 1), (16, 1)]
]

/-- Partial product 449 for generator 30. -/
def rs_R009_ueqv_R009NNNNN_partial_30_0449 : Poly :=
[
  term ((-64400 : Rat) / 1767) [(8, 1), (12, 1), (14, 1), (16, 1)],
  term ((32200 : Rat) / 1767) [(8, 1), (12, 2), (16, 1)],
  term ((-64400 : Rat) / 1767) [(8, 1), (13, 1), (15, 1), (16, 1)],
  term ((32200 : Rat) / 1767) [(8, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 449 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNN_partial_30_0449_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_30_0449
        rs_R009_ueqv_R009NNNNN_generator_30_0400_0499 =
      rs_R009_ueqv_R009NNNNN_partial_30_0449 := by
  native_decide

/-- Coefficient term 450 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNN_coefficient_30_0450 : Poly :=
[
  term ((456 : Rat) / 31) [(9, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 450 for generator 30. -/
def rs_R009_ueqv_R009NNNNN_partial_30_0450 : Poly :=
[
  term ((912 : Rat) / 31) [(9, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((-456 : Rat) / 31) [(9, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((912 : Rat) / 31) [(9, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-456 : Rat) / 31) [(9, 1), (13, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 450 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNN_partial_30_0450_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_30_0450
        rs_R009_ueqv_R009NNNNN_generator_30_0400_0499 =
      rs_R009_ueqv_R009NNNNN_partial_30_0450 := by
  native_decide

/-- Coefficient term 451 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNN_coefficient_30_0451 : Poly :=
[
  term ((-342 : Rat) / 31) [(9, 1), (13, 1), (14, 2), (16, 1)]
]

/-- Partial product 451 for generator 30. -/
def rs_R009_ueqv_R009NNNNN_partial_30_0451 : Poly :=
[
  term ((-684 : Rat) / 31) [(9, 1), (12, 1), (13, 1), (14, 3), (16, 1)],
  term ((342 : Rat) / 31) [(9, 1), (12, 2), (13, 1), (14, 2), (16, 1)],
  term ((-684 : Rat) / 31) [(9, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((342 : Rat) / 31) [(9, 1), (13, 3), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 451 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNN_partial_30_0451_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_30_0451
        rs_R009_ueqv_R009NNNNN_generator_30_0400_0499 =
      rs_R009_ueqv_R009NNNNN_partial_30_0451 := by
  native_decide

/-- Coefficient term 452 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNN_coefficient_30_0452 : Poly :=
[
  term ((-342 : Rat) / 31) [(9, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 452 for generator 30. -/
def rs_R009_ueqv_R009NNNNN_partial_30_0452 : Poly :=
[
  term ((-684 : Rat) / 31) [(9, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((342 : Rat) / 31) [(9, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-684 : Rat) / 31) [(9, 1), (13, 2), (15, 3), (16, 1)],
  term ((342 : Rat) / 31) [(9, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 452 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNN_partial_30_0452_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_30_0452
        rs_R009_ueqv_R009NNNNN_generator_30_0400_0499 =
      rs_R009_ueqv_R009NNNNN_partial_30_0452 := by
  native_decide

/-- Coefficient term 453 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNN_coefficient_30_0453 : Poly :=
[
  term ((164116 : Rat) / 1767) [(9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 453 for generator 30. -/
def rs_R009_ueqv_R009NNNNN_partial_30_0453 : Poly :=
[
  term ((328232 : Rat) / 1767) [(9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-164116 : Rat) / 1767) [(9, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((328232 : Rat) / 1767) [(9, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-164116 : Rat) / 1767) [(9, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 453 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNN_partial_30_0453_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_30_0453
        rs_R009_ueqv_R009NNNNN_generator_30_0400_0499 =
      rs_R009_ueqv_R009NNNNN_partial_30_0453 := by
  native_decide

/-- Coefficient term 454 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNN_coefficient_30_0454 : Poly :=
[
  term ((-41029 : Rat) / 589) [(9, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 454 for generator 30. -/
def rs_R009_ueqv_R009NNNNN_partial_30_0454 : Poly :=
[
  term ((-82058 : Rat) / 589) [(9, 1), (12, 1), (14, 3), (15, 1), (16, 1)],
  term ((41029 : Rat) / 589) [(9, 1), (12, 2), (14, 2), (15, 1), (16, 1)],
  term ((-82058 : Rat) / 589) [(9, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((41029 : Rat) / 589) [(9, 1), (13, 2), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 454 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNN_partial_30_0454_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_30_0454
        rs_R009_ueqv_R009NNNNN_generator_30_0400_0499 =
      rs_R009_ueqv_R009NNNNN_partial_30_0454 := by
  native_decide

/-- Coefficient term 455 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNN_coefficient_30_0455 : Poly :=
[
  term ((-41029 : Rat) / 589) [(9, 1), (15, 3), (16, 1)]
]

/-- Partial product 455 for generator 30. -/
def rs_R009_ueqv_R009NNNNN_partial_30_0455 : Poly :=
[
  term ((-82058 : Rat) / 589) [(9, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((41029 : Rat) / 589) [(9, 1), (12, 2), (15, 3), (16, 1)],
  term ((-82058 : Rat) / 589) [(9, 1), (13, 1), (15, 4), (16, 1)],
  term ((41029 : Rat) / 589) [(9, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 455 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNN_partial_30_0455_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_30_0455
        rs_R009_ueqv_R009NNNNN_generator_30_0400_0499 =
      rs_R009_ueqv_R009NNNNN_partial_30_0455 := by
  native_decide

/-- Coefficient term 456 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNN_coefficient_30_0456 : Poly :=
[
  term ((912 : Rat) / 31) [(10, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 456 for generator 30. -/
def rs_R009_ueqv_R009NNNNN_partial_30_0456 : Poly :=
[
  term ((1824 : Rat) / 31) [(10, 1), (11, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((-912 : Rat) / 31) [(10, 1), (11, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((1824 : Rat) / 31) [(10, 1), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-912 : Rat) / 31) [(10, 1), (11, 1), (13, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 456 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNN_partial_30_0456_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_30_0456
        rs_R009_ueqv_R009NNNNN_generator_30_0400_0499 =
      rs_R009_ueqv_R009NNNNN_partial_30_0456 := by
  native_decide

/-- Coefficient term 457 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNN_coefficient_30_0457 : Poly :=
[
  term ((-798 : Rat) / 31) [(10, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 457 for generator 30. -/
def rs_R009_ueqv_R009NNNNN_partial_30_0457 : Poly :=
[
  term ((-1596 : Rat) / 31) [(10, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((798 : Rat) / 31) [(10, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-1596 : Rat) / 31) [(10, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((798 : Rat) / 31) [(10, 1), (11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 457 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNN_partial_30_0457_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_30_0457
        rs_R009_ueqv_R009NNNNN_generator_30_0400_0499 =
      rs_R009_ueqv_R009NNNNN_partial_30_0457 := by
  native_decide

/-- Coefficient term 458 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNN_coefficient_30_0458 : Poly :=
[
  term ((227480 : Rat) / 1767) [(10, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 458 for generator 30. -/
def rs_R009_ueqv_R009NNNNN_partial_30_0458 : Poly :=
[
  term ((454960 : Rat) / 1767) [(10, 1), (11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-227480 : Rat) / 1767) [(10, 1), (11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((454960 : Rat) / 1767) [(10, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-227480 : Rat) / 1767) [(10, 1), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 458 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNN_partial_30_0458_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_30_0458
        rs_R009_ueqv_R009NNNNN_generator_30_0400_0499 =
      rs_R009_ueqv_R009NNNNN_partial_30_0458 := by
  native_decide

/-- Coefficient term 459 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNN_coefficient_30_0459 : Poly :=
[
  term ((-64611 : Rat) / 589) [(10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 459 for generator 30. -/
def rs_R009_ueqv_R009NNNNN_partial_30_0459 : Poly :=
[
  term ((-129222 : Rat) / 589) [(10, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((64611 : Rat) / 589) [(10, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-129222 : Rat) / 589) [(10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((64611 : Rat) / 589) [(10, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 459 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNN_partial_30_0459_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_30_0459
        rs_R009_ueqv_R009NNNNN_generator_30_0400_0499 =
      rs_R009_ueqv_R009NNNNN_partial_30_0459 := by
  native_decide

/-- Coefficient term 460 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNN_coefficient_30_0460 : Poly :=
[
  term ((456 : Rat) / 31) [(10, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 460 for generator 30. -/
def rs_R009_ueqv_R009NNNNN_partial_30_0460 : Poly :=
[
  term ((912 : Rat) / 31) [(10, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-456 : Rat) / 31) [(10, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((912 : Rat) / 31) [(10, 1), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-456 : Rat) / 31) [(10, 1), (12, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 460 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNN_partial_30_0460_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_30_0460
        rs_R009_ueqv_R009NNNNN_generator_30_0400_0499 =
      rs_R009_ueqv_R009NNNNN_partial_30_0460 := by
  native_decide

/-- Coefficient term 461 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNN_coefficient_30_0461 : Poly :=
[
  term ((72796 : Rat) / 1767) [(10, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 461 for generator 30. -/
def rs_R009_ueqv_R009NNNNN_partial_30_0461 : Poly :=
[
  term ((145592 : Rat) / 1767) [(10, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-72796 : Rat) / 1767) [(10, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((145592 : Rat) / 1767) [(10, 1), (12, 2), (14, 1), (15, 2), (16, 1)],
  term ((-72796 : Rat) / 1767) [(10, 1), (12, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 461 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNN_partial_30_0461_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_30_0461
        rs_R009_ueqv_R009NNNNN_generator_30_0400_0499 =
      rs_R009_ueqv_R009NNNNN_partial_30_0461 := by
  native_decide

/-- Coefficient term 462 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNN_coefficient_30_0462 : Poly :=
[
  term ((-6044 : Rat) / 589) [(10, 1), (12, 1), (16, 1)]
]

/-- Partial product 462 for generator 30. -/
def rs_R009_ueqv_R009NNNNN_partial_30_0462 : Poly :=
[
  term ((-12088 : Rat) / 589) [(10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((6044 : Rat) / 589) [(10, 1), (12, 1), (13, 2), (16, 1)],
  term ((-12088 : Rat) / 589) [(10, 1), (12, 2), (14, 1), (16, 1)],
  term ((6044 : Rat) / 589) [(10, 1), (12, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 462 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNN_partial_30_0462_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_30_0462
        rs_R009_ueqv_R009NNNNN_generator_30_0400_0499 =
      rs_R009_ueqv_R009NNNNN_partial_30_0462 := by
  native_decide

/-- Coefficient term 463 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNN_coefficient_30_0463 : Poly :=
[
  term ((-93268 : Rat) / 1767) [(10, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 463 for generator 30. -/
def rs_R009_ueqv_R009NNNNN_partial_30_0463 : Poly :=
[
  term ((-186536 : Rat) / 1767) [(10, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((93268 : Rat) / 1767) [(10, 1), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-186536 : Rat) / 1767) [(10, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((93268 : Rat) / 1767) [(10, 1), (13, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 463 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNN_partial_30_0463_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_30_0463
        rs_R009_ueqv_R009NNNNN_generator_30_0400_0499 =
      rs_R009_ueqv_R009NNNNN_partial_30_0463 := by
  native_decide

/-- Coefficient term 464 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNN_coefficient_30_0464 : Poly :=
[
  term ((-158529 : Rat) / 2356) [(10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 464 for generator 30. -/
def rs_R009_ueqv_R009NNNNN_partial_30_0464 : Poly :=
[
  term ((-158529 : Rat) / 1178) [(10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((158529 : Rat) / 2356) [(10, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-158529 : Rat) / 1178) [(10, 1), (13, 2), (15, 2), (16, 1)],
  term ((158529 : Rat) / 2356) [(10, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 464 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNN_partial_30_0464_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_30_0464
        rs_R009_ueqv_R009NNNNN_generator_30_0400_0499 =
      rs_R009_ueqv_R009NNNNN_partial_30_0464 := by
  native_decide

/-- Coefficient term 465 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNN_coefficient_30_0465 : Poly :=
[
  term ((-456 : Rat) / 31) [(10, 1), (13, 2), (14, 1), (16, 1)]
]

/-- Partial product 465 for generator 30. -/
def rs_R009_ueqv_R009NNNNN_partial_30_0465 : Poly :=
[
  term ((-912 : Rat) / 31) [(10, 1), (12, 1), (13, 2), (14, 2), (16, 1)],
  term ((456 : Rat) / 31) [(10, 1), (12, 2), (13, 2), (14, 1), (16, 1)],
  term ((-912 : Rat) / 31) [(10, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((456 : Rat) / 31) [(10, 1), (13, 4), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 465 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNN_partial_30_0465_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_30_0465
        rs_R009_ueqv_R009NNNNN_generator_30_0400_0499 =
      rs_R009_ueqv_R009NNNNN_partial_30_0465 := by
  native_decide

/-- Coefficient term 466 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNN_coefficient_30_0466 : Poly :=
[
  term ((-684 : Rat) / 31) [(10, 1), (13, 2), (16, 1)]
]

/-- Partial product 466 for generator 30. -/
def rs_R009_ueqv_R009NNNNN_partial_30_0466 : Poly :=
[
  term ((-1368 : Rat) / 31) [(10, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((684 : Rat) / 31) [(10, 1), (12, 2), (13, 2), (16, 1)],
  term ((-1368 : Rat) / 31) [(10, 1), (13, 3), (15, 1), (16, 1)],
  term ((684 : Rat) / 31) [(10, 1), (13, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 466 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNN_partial_30_0466_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_30_0466
        rs_R009_ueqv_R009NNNNN_generator_30_0400_0499 =
      rs_R009_ueqv_R009NNNNN_partial_30_0466 := by
  native_decide

/-- Coefficient term 467 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNN_coefficient_30_0467 : Poly :=
[
  term ((-3029 : Rat) / 1767) [(10, 1), (14, 1), (16, 1)]
]

/-- Partial product 467 for generator 30. -/
def rs_R009_ueqv_R009NNNNN_partial_30_0467 : Poly :=
[
  term ((-6058 : Rat) / 1767) [(10, 1), (12, 1), (14, 2), (16, 1)],
  term ((3029 : Rat) / 1767) [(10, 1), (12, 2), (14, 1), (16, 1)],
  term ((-6058 : Rat) / 1767) [(10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((3029 : Rat) / 1767) [(10, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 467 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNN_partial_30_0467_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_30_0467
        rs_R009_ueqv_R009NNNNN_generator_30_0400_0499 =
      rs_R009_ueqv_R009NNNNN_partial_30_0467 := by
  native_decide

/-- Coefficient term 468 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNN_coefficient_30_0468 : Poly :=
[
  term ((18400 : Rat) / 1767) [(10, 1), (14, 2), (16, 1)]
]

/-- Partial product 468 for generator 30. -/
def rs_R009_ueqv_R009NNNNN_partial_30_0468 : Poly :=
[
  term ((36800 : Rat) / 1767) [(10, 1), (12, 1), (14, 3), (16, 1)],
  term ((-18400 : Rat) / 1767) [(10, 1), (12, 2), (14, 2), (16, 1)],
  term ((36800 : Rat) / 1767) [(10, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-18400 : Rat) / 1767) [(10, 1), (13, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 468 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNN_partial_30_0468_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_30_0468
        rs_R009_ueqv_R009NNNNN_generator_30_0400_0499 =
      rs_R009_ueqv_R009NNNNN_partial_30_0468 := by
  native_decide

/-- Coefficient term 469 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNN_coefficient_30_0469 : Poly :=
[
  term ((1591007 : Rat) / 14136) [(10, 1), (15, 2), (16, 1)]
]

/-- Partial product 469 for generator 30. -/
def rs_R009_ueqv_R009NNNNN_partial_30_0469 : Poly :=
[
  term ((1591007 : Rat) / 7068) [(10, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1591007 : Rat) / 14136) [(10, 1), (12, 2), (15, 2), (16, 1)],
  term ((1591007 : Rat) / 7068) [(10, 1), (13, 1), (15, 3), (16, 1)],
  term ((-1591007 : Rat) / 14136) [(10, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 469 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNN_partial_30_0469_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_30_0469
        rs_R009_ueqv_R009NNNNN_generator_30_0400_0499 =
      rs_R009_ueqv_R009NNNNN_partial_30_0469 := by
  native_decide

/-- Coefficient term 470 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNN_coefficient_30_0470 : Poly :=
[
  term ((-9718 : Rat) / 1767) [(10, 1), (16, 1)]
]

/-- Partial product 470 for generator 30. -/
def rs_R009_ueqv_R009NNNNN_partial_30_0470 : Poly :=
[
  term ((-19436 : Rat) / 1767) [(10, 1), (12, 1), (14, 1), (16, 1)],
  term ((9718 : Rat) / 1767) [(10, 1), (12, 2), (16, 1)],
  term ((-19436 : Rat) / 1767) [(10, 1), (13, 1), (15, 1), (16, 1)],
  term ((9718 : Rat) / 1767) [(10, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 470 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNN_partial_30_0470_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_30_0470
        rs_R009_ueqv_R009NNNNN_generator_30_0400_0499 =
      rs_R009_ueqv_R009NNNNN_partial_30_0470 := by
  native_decide

/-- Coefficient term 471 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNN_coefficient_30_0471 : Poly :=
[
  term ((-912 : Rat) / 31) [(10, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 471 for generator 30. -/
def rs_R009_ueqv_R009NNNNN_partial_30_0471 : Poly :=
[
  term ((-1824 : Rat) / 31) [(10, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((912 : Rat) / 31) [(10, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1824 : Rat) / 31) [(10, 2), (13, 2), (15, 2), (16, 1)],
  term ((912 : Rat) / 31) [(10, 2), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 471 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNN_partial_30_0471_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_30_0471
        rs_R009_ueqv_R009NNNNN_generator_30_0400_0499 =
      rs_R009_ueqv_R009NNNNN_partial_30_0471 := by
  native_decide

/-- Coefficient term 472 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNN_coefficient_30_0472 : Poly :=
[
  term ((-9200 : Rat) / 1767) [(10, 2), (14, 1), (16, 1)]
]

/-- Partial product 472 for generator 30. -/
def rs_R009_ueqv_R009NNNNN_partial_30_0472 : Poly :=
[
  term ((-18400 : Rat) / 1767) [(10, 2), (12, 1), (14, 2), (16, 1)],
  term ((9200 : Rat) / 1767) [(10, 2), (12, 2), (14, 1), (16, 1)],
  term ((-18400 : Rat) / 1767) [(10, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((9200 : Rat) / 1767) [(10, 2), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 472 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNN_partial_30_0472_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_30_0472
        rs_R009_ueqv_R009NNNNN_generator_30_0400_0499 =
      rs_R009_ueqv_R009NNNNN_partial_30_0472 := by
  native_decide

/-- Coefficient term 473 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNN_coefficient_30_0473 : Poly :=
[
  term ((-227480 : Rat) / 1767) [(10, 2), (15, 2), (16, 1)]
]

/-- Partial product 473 for generator 30. -/
def rs_R009_ueqv_R009NNNNN_partial_30_0473 : Poly :=
[
  term ((-454960 : Rat) / 1767) [(10, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((227480 : Rat) / 1767) [(10, 2), (12, 2), (15, 2), (16, 1)],
  term ((-454960 : Rat) / 1767) [(10, 2), (13, 1), (15, 3), (16, 1)],
  term ((227480 : Rat) / 1767) [(10, 2), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 473 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNN_partial_30_0473_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_30_0473
        rs_R009_ueqv_R009NNNNN_generator_30_0400_0499 =
      rs_R009_ueqv_R009NNNNN_partial_30_0473 := by
  native_decide

/-- Coefficient term 474 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNN_coefficient_30_0474 : Poly :=
[
  term ((-26 : Rat) / 589) [(10, 2), (16, 1)]
]

/-- Partial product 474 for generator 30. -/
def rs_R009_ueqv_R009NNNNN_partial_30_0474 : Poly :=
[
  term ((-52 : Rat) / 589) [(10, 2), (12, 1), (14, 1), (16, 1)],
  term ((26 : Rat) / 589) [(10, 2), (12, 2), (16, 1)],
  term ((-52 : Rat) / 589) [(10, 2), (13, 1), (15, 1), (16, 1)],
  term ((26 : Rat) / 589) [(10, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 474 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNN_partial_30_0474_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_30_0474
        rs_R009_ueqv_R009NNNNN_generator_30_0400_0499 =
      rs_R009_ueqv_R009NNNNN_partial_30_0474 := by
  native_decide

/-- Coefficient term 475 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNN_coefficient_30_0475 : Poly :=
[
  term ((6824 : Rat) / 589) [(11, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 475 for generator 30. -/
def rs_R009_ueqv_R009NNNNN_partial_30_0475 : Poly :=
[
  term ((13648 : Rat) / 589) [(11, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-6824 : Rat) / 589) [(11, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((13648 : Rat) / 589) [(11, 1), (12, 2), (14, 2), (15, 1), (16, 1)],
  term ((-6824 : Rat) / 589) [(11, 1), (12, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 475 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNN_partial_30_0475_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_30_0475
        rs_R009_ueqv_R009NNNNN_generator_30_0400_0499 =
      rs_R009_ueqv_R009NNNNN_partial_30_0475 := by
  native_decide

/-- Coefficient term 476 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNN_coefficient_30_0476 : Poly :=
[
  term ((-2632 : Rat) / 589) [(11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 476 for generator 30. -/
def rs_R009_ueqv_R009NNNNN_partial_30_0476 : Poly :=
[
  term ((-5264 : Rat) / 589) [(11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((2632 : Rat) / 589) [(11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-5264 : Rat) / 589) [(11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((2632 : Rat) / 589) [(11, 1), (12, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 476 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNN_partial_30_0476_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_30_0476
        rs_R009_ueqv_R009NNNNN_generator_30_0400_0499 =
      rs_R009_ueqv_R009NNNNN_partial_30_0476 := by
  native_decide

/-- Coefficient term 477 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNN_coefficient_30_0477 : Poly :=
[
  term ((-88025 : Rat) / 2356) [(11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 477 for generator 30. -/
def rs_R009_ueqv_R009NNNNN_partial_30_0477 : Poly :=
[
  term ((-88025 : Rat) / 1178) [(11, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((88025 : Rat) / 2356) [(11, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-88025 : Rat) / 1178) [(11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((88025 : Rat) / 2356) [(11, 1), (13, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 477 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNN_partial_30_0477_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_30_0477
        rs_R009_ueqv_R009NNNNN_generator_30_0400_0499 =
      rs_R009_ueqv_R009NNNNN_partial_30_0477 := by
  native_decide

/-- Coefficient term 478 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNN_coefficient_30_0478 : Poly :=
[
  term ((67927 : Rat) / 4712) [(11, 1), (13, 1), (16, 1)]
]

/-- Partial product 478 for generator 30. -/
def rs_R009_ueqv_R009NNNNN_partial_30_0478 : Poly :=
[
  term ((67927 : Rat) / 2356) [(11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-67927 : Rat) / 4712) [(11, 1), (12, 2), (13, 1), (16, 1)],
  term ((67927 : Rat) / 2356) [(11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-67927 : Rat) / 4712) [(11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 478 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNN_partial_30_0478_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_30_0478
        rs_R009_ueqv_R009NNNNN_generator_30_0400_0499 =
      rs_R009_ueqv_R009NNNNN_partial_30_0478 := by
  native_decide

/-- Coefficient term 479 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNN_coefficient_30_0479 : Poly :=
[
  term ((-1799537 : Rat) / 14136) [(11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 479 for generator 30. -/
def rs_R009_ueqv_R009NNNNN_partial_30_0479 : Poly :=
[
  term ((-1799537 : Rat) / 7068) [(11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((1799537 : Rat) / 14136) [(11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1799537 : Rat) / 7068) [(11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((1799537 : Rat) / 14136) [(11, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 479 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNN_partial_30_0479_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_30_0479
        rs_R009_ueqv_R009NNNNN_generator_30_0400_0499 =
      rs_R009_ueqv_R009NNNNN_partial_30_0479 := by
  native_decide

/-- Coefficient term 480 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNN_coefficient_30_0480 : Poly :=
[
  term ((711989 : Rat) / 9424) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 480 for generator 30. -/
def rs_R009_ueqv_R009NNNNN_partial_30_0480 : Poly :=
[
  term ((711989 : Rat) / 4712) [(11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-711989 : Rat) / 9424) [(11, 1), (12, 2), (15, 1), (16, 1)],
  term ((711989 : Rat) / 4712) [(11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-711989 : Rat) / 9424) [(11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 480 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNN_partial_30_0480_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_30_0480
        rs_R009_ueqv_R009NNNNN_generator_30_0400_0499 =
      rs_R009_ueqv_R009NNNNN_partial_30_0480 := by
  native_decide

/-- Coefficient term 481 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNN_coefficient_30_0481 : Poly :=
[
  term ((-4804 : Rat) / 589) [(11, 2), (14, 1), (16, 1)]
]

/-- Partial product 481 for generator 30. -/
def rs_R009_ueqv_R009NNNNN_partial_30_0481 : Poly :=
[
  term ((-9608 : Rat) / 589) [(11, 2), (12, 1), (14, 2), (16, 1)],
  term ((4804 : Rat) / 589) [(11, 2), (12, 2), (14, 1), (16, 1)],
  term ((-9608 : Rat) / 589) [(11, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((4804 : Rat) / 589) [(11, 2), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 481 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNN_partial_30_0481_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_30_0481
        rs_R009_ueqv_R009NNNNN_generator_30_0400_0499 =
      rs_R009_ueqv_R009NNNNN_partial_30_0481 := by
  native_decide

/-- Coefficient term 482 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNN_coefficient_30_0482 : Poly :=
[
  term ((262 : Rat) / 57) [(11, 2), (16, 1)]
]

/-- Partial product 482 for generator 30. -/
def rs_R009_ueqv_R009NNNNN_partial_30_0482 : Poly :=
[
  term ((524 : Rat) / 57) [(11, 2), (12, 1), (14, 1), (16, 1)],
  term ((-262 : Rat) / 57) [(11, 2), (12, 2), (16, 1)],
  term ((524 : Rat) / 57) [(11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-262 : Rat) / 57) [(11, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 482 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNN_partial_30_0482_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_30_0482
        rs_R009_ueqv_R009NNNNN_generator_30_0400_0499 =
      rs_R009_ueqv_R009NNNNN_partial_30_0482 := by
  native_decide

/-- Coefficient term 483 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNN_coefficient_30_0483 : Poly :=
[
  term ((-16415 : Rat) / 1767) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 483 for generator 30. -/
def rs_R009_ueqv_R009NNNNN_partial_30_0483 : Poly :=
[
  term ((-32830 : Rat) / 1767) [(12, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((16415 : Rat) / 1767) [(12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-32830 : Rat) / 1767) [(12, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((16415 : Rat) / 1767) [(12, 3), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 483 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNN_partial_30_0483_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_30_0483
        rs_R009_ueqv_R009NNNNN_generator_30_0400_0499 =
      rs_R009_ueqv_R009NNNNN_partial_30_0483 := by
  native_decide

/-- Coefficient term 484 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNN_coefficient_30_0484 : Poly :=
[
  term ((-254171 : Rat) / 1767) [(12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 484 for generator 30. -/
def rs_R009_ueqv_R009NNNNN_partial_30_0484 : Poly :=
[
  term ((-508342 : Rat) / 1767) [(12, 1), (13, 2), (15, 2), (16, 1)],
  term ((254171 : Rat) / 1767) [(12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-508342 : Rat) / 1767) [(12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((254171 : Rat) / 1767) [(12, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 484 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNN_partial_30_0484_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_30_0484
        rs_R009_ueqv_R009NNNNN_generator_30_0400_0499 =
      rs_R009_ueqv_R009NNNNN_partial_30_0484 := by
  native_decide

/-- Coefficient term 485 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNN_coefficient_30_0485 : Poly :=
[
  term ((-228 : Rat) / 31) [(12, 1), (13, 2), (14, 1), (16, 1)]
]

/-- Partial product 485 for generator 30. -/
def rs_R009_ueqv_R009NNNNN_partial_30_0485 : Poly :=
[
  term ((-456 : Rat) / 31) [(12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((228 : Rat) / 31) [(12, 1), (13, 4), (14, 1), (16, 1)],
  term ((-456 : Rat) / 31) [(12, 2), (13, 2), (14, 2), (16, 1)],
  term ((228 : Rat) / 31) [(12, 3), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 485 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNN_partial_30_0485_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_30_0485
        rs_R009_ueqv_R009NNNNN_generator_30_0400_0499 =
      rs_R009_ueqv_R009NNNNN_partial_30_0485 := by
  native_decide

/-- Coefficient term 486 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNN_coefficient_30_0486 : Poly :=
[
  term ((-912 : Rat) / 31) [(12, 1), (13, 2), (16, 1)]
]

/-- Partial product 486 for generator 30. -/
def rs_R009_ueqv_R009NNNNN_partial_30_0486 : Poly :=
[
  term ((-1824 : Rat) / 31) [(12, 1), (13, 3), (15, 1), (16, 1)],
  term ((912 : Rat) / 31) [(12, 1), (13, 4), (16, 1)],
  term ((-1824 : Rat) / 31) [(12, 2), (13, 2), (14, 1), (16, 1)],
  term ((912 : Rat) / 31) [(12, 3), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 486 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNN_partial_30_0486_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_30_0486
        rs_R009_ueqv_R009NNNNN_generator_30_0400_0499 =
      rs_R009_ueqv_R009NNNNN_partial_30_0486 := by
  native_decide

/-- Coefficient term 487 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNN_coefficient_30_0487 : Poly :=
[
  term ((21611 : Rat) / 1178) [(12, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 487 for generator 30. -/
def rs_R009_ueqv_R009NNNNN_partial_30_0487 : Poly :=
[
  term ((21611 : Rat) / 589) [(12, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-21611 : Rat) / 1178) [(12, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((21611 : Rat) / 589) [(12, 2), (14, 2), (15, 2), (16, 1)],
  term ((-21611 : Rat) / 1178) [(12, 3), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 487 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNN_partial_30_0487_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_30_0487
        rs_R009_ueqv_R009NNNNN_generator_30_0400_0499 =
      rs_R009_ueqv_R009NNNNN_partial_30_0487 := by
  native_decide

/-- Coefficient term 488 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNN_coefficient_30_0488 : Poly :=
[
  term ((-36950 : Rat) / 589) [(12, 1), (14, 1), (16, 1)]
]

/-- Partial product 488 for generator 30. -/
def rs_R009_ueqv_R009NNNNN_partial_30_0488 : Poly :=
[
  term ((-73900 : Rat) / 589) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((36950 : Rat) / 589) [(12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-73900 : Rat) / 589) [(12, 2), (14, 2), (16, 1)],
  term ((36950 : Rat) / 589) [(12, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 488 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNN_partial_30_0488_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_30_0488
        rs_R009_ueqv_R009NNNNN_generator_30_0400_0499 =
      rs_R009_ueqv_R009NNNNN_partial_30_0488 := by
  native_decide

/-- Coefficient term 489 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNN_coefficient_30_0489 : Poly :=
[
  term ((17712 : Rat) / 589) [(12, 1), (14, 2), (16, 1)]
]

/-- Partial product 489 for generator 30. -/
def rs_R009_ueqv_R009NNNNN_partial_30_0489 : Poly :=
[
  term ((35424 : Rat) / 589) [(12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-17712 : Rat) / 589) [(12, 1), (13, 2), (14, 2), (16, 1)],
  term ((35424 : Rat) / 589) [(12, 2), (14, 3), (16, 1)],
  term ((-17712 : Rat) / 589) [(12, 3), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 489 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNN_partial_30_0489_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_30_0489
        rs_R009_ueqv_R009NNNNN_generator_30_0400_0499 =
      rs_R009_ueqv_R009NNNNN_partial_30_0489 := by
  native_decide

/-- Coefficient term 490 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNN_coefficient_30_0490 : Poly :=
[
  term ((-210337 : Rat) / 3534) [(12, 1), (15, 2), (16, 1)]
]

/-- Partial product 490 for generator 30. -/
def rs_R009_ueqv_R009NNNNN_partial_30_0490 : Poly :=
[
  term ((-210337 : Rat) / 1767) [(12, 1), (13, 1), (15, 3), (16, 1)],
  term ((210337 : Rat) / 3534) [(12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-210337 : Rat) / 1767) [(12, 2), (14, 1), (15, 2), (16, 1)],
  term ((210337 : Rat) / 3534) [(12, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 490 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNN_partial_30_0490_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_30_0490
        rs_R009_ueqv_R009NNNNN_generator_30_0400_0499 =
      rs_R009_ueqv_R009NNNNN_partial_30_0490 := by
  native_decide

/-- Coefficient term 491 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNN_coefficient_30_0491 : Poly :=
[
  term ((-576 : Rat) / 589) [(12, 1), (16, 1)]
]

/-- Partial product 491 for generator 30. -/
def rs_R009_ueqv_R009NNNNN_partial_30_0491 : Poly :=
[
  term ((-1152 : Rat) / 589) [(12, 1), (13, 1), (15, 1), (16, 1)],
  term ((576 : Rat) / 589) [(12, 1), (13, 2), (16, 1)],
  term ((-1152 : Rat) / 589) [(12, 2), (14, 1), (16, 1)],
  term ((576 : Rat) / 589) [(12, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 491 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNN_partial_30_0491_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_30_0491
        rs_R009_ueqv_R009NNNNN_generator_30_0400_0499 =
      rs_R009_ueqv_R009NNNNN_partial_30_0491 := by
  native_decide

/-- Coefficient term 492 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNN_coefficient_30_0492 : Poly :=
[
  term ((342 : Rat) / 31) [(12, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 492 for generator 30. -/
def rs_R009_ueqv_R009NNNNN_partial_30_0492 : Poly :=
[
  term ((684 : Rat) / 31) [(12, 2), (13, 2), (15, 2), (16, 1)],
  term ((-342 : Rat) / 31) [(12, 2), (13, 3), (15, 1), (16, 1)],
  term ((684 : Rat) / 31) [(12, 3), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-342 : Rat) / 31) [(12, 4), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 492 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNN_partial_30_0492_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_30_0492
        rs_R009_ueqv_R009NNNNN_generator_30_0400_0499 =
      rs_R009_ueqv_R009NNNNN_partial_30_0492 := by
  native_decide

/-- Coefficient term 493 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNN_coefficient_30_0493 : Poly :=
[
  term ((9200 : Rat) / 1767) [(12, 2), (14, 1), (16, 1)]
]

/-- Partial product 493 for generator 30. -/
def rs_R009_ueqv_R009NNNNN_partial_30_0493 : Poly :=
[
  term ((18400 : Rat) / 1767) [(12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-9200 : Rat) / 1767) [(12, 2), (13, 2), (14, 1), (16, 1)],
  term ((18400 : Rat) / 1767) [(12, 3), (14, 2), (16, 1)],
  term ((-9200 : Rat) / 1767) [(12, 4), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 493 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNN_partial_30_0493_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_30_0493
        rs_R009_ueqv_R009NNNNN_generator_30_0400_0499 =
      rs_R009_ueqv_R009NNNNN_partial_30_0493 := by
  native_decide

/-- Coefficient term 494 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNN_coefficient_30_0494 : Poly :=
[
  term ((18199 : Rat) / 589) [(12, 2), (15, 2), (16, 1)]
]

/-- Partial product 494 for generator 30. -/
def rs_R009_ueqv_R009NNNNN_partial_30_0494 : Poly :=
[
  term ((36398 : Rat) / 589) [(12, 2), (13, 1), (15, 3), (16, 1)],
  term ((-18199 : Rat) / 589) [(12, 2), (13, 2), (15, 2), (16, 1)],
  term ((36398 : Rat) / 589) [(12, 3), (14, 1), (15, 2), (16, 1)],
  term ((-18199 : Rat) / 589) [(12, 4), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 494 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNN_partial_30_0494_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_30_0494
        rs_R009_ueqv_R009NNNNN_generator_30_0400_0499 =
      rs_R009_ueqv_R009NNNNN_partial_30_0494 := by
  native_decide

/-- Coefficient term 495 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNN_coefficient_30_0495 : Poly :=
[
  term ((268 : Rat) / 1767) [(12, 2), (16, 1)]
]

/-- Partial product 495 for generator 30. -/
def rs_R009_ueqv_R009NNNNN_partial_30_0495 : Poly :=
[
  term ((536 : Rat) / 1767) [(12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-268 : Rat) / 1767) [(12, 2), (13, 2), (16, 1)],
  term ((536 : Rat) / 1767) [(12, 3), (14, 1), (16, 1)],
  term ((-268 : Rat) / 1767) [(12, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 495 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNN_partial_30_0495_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_30_0495
        rs_R009_ueqv_R009NNNNN_generator_30_0400_0499 =
      rs_R009_ueqv_R009NNNNN_partial_30_0495 := by
  native_decide

/-- Coefficient term 496 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNN_coefficient_30_0496 : Poly :=
[
  term ((68443 : Rat) / 589) [(13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 496 for generator 30. -/
def rs_R009_ueqv_R009NNNNN_partial_30_0496 : Poly :=
[
  term ((136886 : Rat) / 589) [(12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-68443 : Rat) / 589) [(12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((136886 : Rat) / 589) [(13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-68443 : Rat) / 589) [(13, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 496 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNN_partial_30_0496_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_30_0496
        rs_R009_ueqv_R009NNNNN_generator_30_0400_0499 =
      rs_R009_ueqv_R009NNNNN_partial_30_0496 := by
  native_decide

/-- Coefficient term 497 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNN_coefficient_30_0497 : Poly :=
[
  term ((-45686 : Rat) / 589) [(13, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 497 for generator 30. -/
def rs_R009_ueqv_R009NNNNN_partial_30_0497 : Poly :=
[
  term ((-91372 : Rat) / 589) [(12, 1), (13, 1), (14, 3), (15, 1), (16, 1)],
  term ((45686 : Rat) / 589) [(12, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-91372 : Rat) / 589) [(13, 2), (14, 2), (15, 2), (16, 1)],
  term ((45686 : Rat) / 589) [(13, 3), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 497 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNN_partial_30_0497_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_30_0497
        rs_R009_ueqv_R009NNNNN_generator_30_0400_0499 =
      rs_R009_ueqv_R009NNNNN_partial_30_0497 := by
  native_decide

/-- Coefficient term 498 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNN_coefficient_30_0498 : Poly :=
[
  term ((29528 : Rat) / 589) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 498 for generator 30. -/
def rs_R009_ueqv_R009NNNNN_partial_30_0498 : Poly :=
[
  term ((59056 : Rat) / 589) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-29528 : Rat) / 589) [(12, 2), (13, 1), (15, 1), (16, 1)],
  term ((59056 : Rat) / 589) [(13, 2), (15, 2), (16, 1)],
  term ((-29528 : Rat) / 589) [(13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 498 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNN_partial_30_0498_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_30_0498
        rs_R009_ueqv_R009NNNNN_generator_30_0400_0499 =
      rs_R009_ueqv_R009NNNNN_partial_30_0498 := by
  native_decide

/-- Coefficient term 499 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNNN_coefficient_30_0499 : Poly :=
[
  term ((-69761 : Rat) / 1178) [(13, 1), (15, 3), (16, 1)]
]

/-- Partial product 499 for generator 30. -/
def rs_R009_ueqv_R009NNNNN_partial_30_0499 : Poly :=
[
  term ((-69761 : Rat) / 589) [(12, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((69761 : Rat) / 1178) [(12, 2), (13, 1), (15, 3), (16, 1)],
  term ((-69761 : Rat) / 589) [(13, 2), (15, 4), (16, 1)],
  term ((69761 : Rat) / 1178) [(13, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 499 for generator 30. -/
theorem rs_R009_ueqv_R009NNNNN_partial_30_0499_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_30_0499
        rs_R009_ueqv_R009NNNNN_generator_30_0400_0499 =
      rs_R009_ueqv_R009NNNNN_partial_30_0499 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NNNNN_partials_30_0400_0499 : List Poly :=
[
  rs_R009_ueqv_R009NNNNN_partial_30_0400,
  rs_R009_ueqv_R009NNNNN_partial_30_0401,
  rs_R009_ueqv_R009NNNNN_partial_30_0402,
  rs_R009_ueqv_R009NNNNN_partial_30_0403,
  rs_R009_ueqv_R009NNNNN_partial_30_0404,
  rs_R009_ueqv_R009NNNNN_partial_30_0405,
  rs_R009_ueqv_R009NNNNN_partial_30_0406,
  rs_R009_ueqv_R009NNNNN_partial_30_0407,
  rs_R009_ueqv_R009NNNNN_partial_30_0408,
  rs_R009_ueqv_R009NNNNN_partial_30_0409,
  rs_R009_ueqv_R009NNNNN_partial_30_0410,
  rs_R009_ueqv_R009NNNNN_partial_30_0411,
  rs_R009_ueqv_R009NNNNN_partial_30_0412,
  rs_R009_ueqv_R009NNNNN_partial_30_0413,
  rs_R009_ueqv_R009NNNNN_partial_30_0414,
  rs_R009_ueqv_R009NNNNN_partial_30_0415,
  rs_R009_ueqv_R009NNNNN_partial_30_0416,
  rs_R009_ueqv_R009NNNNN_partial_30_0417,
  rs_R009_ueqv_R009NNNNN_partial_30_0418,
  rs_R009_ueqv_R009NNNNN_partial_30_0419,
  rs_R009_ueqv_R009NNNNN_partial_30_0420,
  rs_R009_ueqv_R009NNNNN_partial_30_0421,
  rs_R009_ueqv_R009NNNNN_partial_30_0422,
  rs_R009_ueqv_R009NNNNN_partial_30_0423,
  rs_R009_ueqv_R009NNNNN_partial_30_0424,
  rs_R009_ueqv_R009NNNNN_partial_30_0425,
  rs_R009_ueqv_R009NNNNN_partial_30_0426,
  rs_R009_ueqv_R009NNNNN_partial_30_0427,
  rs_R009_ueqv_R009NNNNN_partial_30_0428,
  rs_R009_ueqv_R009NNNNN_partial_30_0429,
  rs_R009_ueqv_R009NNNNN_partial_30_0430,
  rs_R009_ueqv_R009NNNNN_partial_30_0431,
  rs_R009_ueqv_R009NNNNN_partial_30_0432,
  rs_R009_ueqv_R009NNNNN_partial_30_0433,
  rs_R009_ueqv_R009NNNNN_partial_30_0434,
  rs_R009_ueqv_R009NNNNN_partial_30_0435,
  rs_R009_ueqv_R009NNNNN_partial_30_0436,
  rs_R009_ueqv_R009NNNNN_partial_30_0437,
  rs_R009_ueqv_R009NNNNN_partial_30_0438,
  rs_R009_ueqv_R009NNNNN_partial_30_0439,
  rs_R009_ueqv_R009NNNNN_partial_30_0440,
  rs_R009_ueqv_R009NNNNN_partial_30_0441,
  rs_R009_ueqv_R009NNNNN_partial_30_0442,
  rs_R009_ueqv_R009NNNNN_partial_30_0443,
  rs_R009_ueqv_R009NNNNN_partial_30_0444,
  rs_R009_ueqv_R009NNNNN_partial_30_0445,
  rs_R009_ueqv_R009NNNNN_partial_30_0446,
  rs_R009_ueqv_R009NNNNN_partial_30_0447,
  rs_R009_ueqv_R009NNNNN_partial_30_0448,
  rs_R009_ueqv_R009NNNNN_partial_30_0449,
  rs_R009_ueqv_R009NNNNN_partial_30_0450,
  rs_R009_ueqv_R009NNNNN_partial_30_0451,
  rs_R009_ueqv_R009NNNNN_partial_30_0452,
  rs_R009_ueqv_R009NNNNN_partial_30_0453,
  rs_R009_ueqv_R009NNNNN_partial_30_0454,
  rs_R009_ueqv_R009NNNNN_partial_30_0455,
  rs_R009_ueqv_R009NNNNN_partial_30_0456,
  rs_R009_ueqv_R009NNNNN_partial_30_0457,
  rs_R009_ueqv_R009NNNNN_partial_30_0458,
  rs_R009_ueqv_R009NNNNN_partial_30_0459,
  rs_R009_ueqv_R009NNNNN_partial_30_0460,
  rs_R009_ueqv_R009NNNNN_partial_30_0461,
  rs_R009_ueqv_R009NNNNN_partial_30_0462,
  rs_R009_ueqv_R009NNNNN_partial_30_0463,
  rs_R009_ueqv_R009NNNNN_partial_30_0464,
  rs_R009_ueqv_R009NNNNN_partial_30_0465,
  rs_R009_ueqv_R009NNNNN_partial_30_0466,
  rs_R009_ueqv_R009NNNNN_partial_30_0467,
  rs_R009_ueqv_R009NNNNN_partial_30_0468,
  rs_R009_ueqv_R009NNNNN_partial_30_0469,
  rs_R009_ueqv_R009NNNNN_partial_30_0470,
  rs_R009_ueqv_R009NNNNN_partial_30_0471,
  rs_R009_ueqv_R009NNNNN_partial_30_0472,
  rs_R009_ueqv_R009NNNNN_partial_30_0473,
  rs_R009_ueqv_R009NNNNN_partial_30_0474,
  rs_R009_ueqv_R009NNNNN_partial_30_0475,
  rs_R009_ueqv_R009NNNNN_partial_30_0476,
  rs_R009_ueqv_R009NNNNN_partial_30_0477,
  rs_R009_ueqv_R009NNNNN_partial_30_0478,
  rs_R009_ueqv_R009NNNNN_partial_30_0479,
  rs_R009_ueqv_R009NNNNN_partial_30_0480,
  rs_R009_ueqv_R009NNNNN_partial_30_0481,
  rs_R009_ueqv_R009NNNNN_partial_30_0482,
  rs_R009_ueqv_R009NNNNN_partial_30_0483,
  rs_R009_ueqv_R009NNNNN_partial_30_0484,
  rs_R009_ueqv_R009NNNNN_partial_30_0485,
  rs_R009_ueqv_R009NNNNN_partial_30_0486,
  rs_R009_ueqv_R009NNNNN_partial_30_0487,
  rs_R009_ueqv_R009NNNNN_partial_30_0488,
  rs_R009_ueqv_R009NNNNN_partial_30_0489,
  rs_R009_ueqv_R009NNNNN_partial_30_0490,
  rs_R009_ueqv_R009NNNNN_partial_30_0491,
  rs_R009_ueqv_R009NNNNN_partial_30_0492,
  rs_R009_ueqv_R009NNNNN_partial_30_0493,
  rs_R009_ueqv_R009NNNNN_partial_30_0494,
  rs_R009_ueqv_R009NNNNN_partial_30_0495,
  rs_R009_ueqv_R009NNNNN_partial_30_0496,
  rs_R009_ueqv_R009NNNNN_partial_30_0497,
  rs_R009_ueqv_R009NNNNN_partial_30_0498,
  rs_R009_ueqv_R009NNNNN_partial_30_0499
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NNNNN_block_30_0400_0499 : Poly :=
[
  term ((7902 : Rat) / 31) [(5, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1273 : Rat) / 62) [(5, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1501 : Rat) / 31) [(5, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((175087 : Rat) / 589) [(5, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-49247 : Rat) / 1767) [(5, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-175087 : Rat) / 1178) [(5, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-78503 : Rat) / 7068) [(5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-11844 : Rat) / 589) [(5, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((-214297 : Rat) / 1178) [(5, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-11844 : Rat) / 589) [(5, 1), (12, 1), (14, 3), (15, 1), (16, 1)],
  term ((1501 : Rat) / 62) [(5, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-189948 : Rat) / 589) [(5, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((1273 : Rat) / 124) [(5, 1), (12, 2), (13, 1), (16, 1)],
  term ((66982 : Rat) / 1767) [(5, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((1140 : Rat) / 31) [(5, 1), (12, 2), (13, 3), (16, 1)],
  term ((914645 : Rat) / 2356) [(5, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((220228 : Rat) / 1767) [(5, 1), (12, 2), (14, 2), (15, 1), (16, 1)],
  term ((78503 : Rat) / 14136) [(5, 1), (12, 2), (15, 1), (16, 1)],
  term ((5922 : Rat) / 589) [(5, 1), (12, 2), (15, 3), (16, 1)],
  term ((-2280 : Rat) / 31) [(5, 1), (12, 3), (13, 1), (14, 1), (16, 1)],
  term ((-547099 : Rat) / 1767) [(5, 1), (12, 3), (14, 1), (15, 1), (16, 1)],
  term ((-175087 : Rat) / 1178) [(5, 1), (12, 3), (15, 1), (16, 1)],
  term ((1140 : Rat) / 31) [(5, 1), (12, 4), (13, 1), (16, 1)],
  term ((222934 : Rat) / 1767) [(5, 1), (12, 4), (15, 1), (16, 1)],
  term ((-214297 : Rat) / 1178) [(5, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-11844 : Rat) / 589) [(5, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-78503 : Rat) / 7068) [(5, 1), (13, 1), (15, 2), (16, 1)],
  term ((-11844 : Rat) / 589) [(5, 1), (13, 1), (15, 4), (16, 1)],
  term ((100221 : Rat) / 2356) [(5, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((5922 : Rat) / 589) [(5, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((-211741 : Rat) / 14136) [(5, 1), (13, 2), (15, 1), (16, 1)],
  term ((265718 : Rat) / 1767) [(5, 1), (13, 2), (15, 3), (16, 1)],
  term ((1501 : Rat) / 62) [(5, 1), (13, 3), (14, 1), (16, 1)],
  term ((-71992 : Rat) / 1767) [(5, 1), (13, 3), (15, 2), (16, 1)],
  term ((1273 : Rat) / 124) [(5, 1), (13, 3), (16, 1)],
  term ((-456 : Rat) / 31) [(5, 1), (13, 4), (15, 1), (16, 1)],
  term ((2052 : Rat) / 31) [(5, 2), (7, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((184258 : Rat) / 589) [(5, 2), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1026 : Rat) / 31) [(5, 2), (7, 1), (12, 2), (13, 1), (16, 1)],
  term ((-92129 : Rat) / 589) [(5, 2), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((184258 : Rat) / 589) [(5, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-53141 : Rat) / 589) [(5, 2), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1026 : Rat) / 31) [(5, 2), (7, 1), (13, 3), (16, 1)],
  term ((-380 : Rat) / 31) [(5, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-115850 : Rat) / 1767) [(5, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((304 : Rat) / 31) [(5, 2), (12, 1), (14, 1), (16, 1)],
  term ((-304 : Rat) / 31) [(5, 2), (12, 1), (14, 2), (16, 1)],
  term ((190 : Rat) / 31) [(5, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((152 : Rat) / 31) [(5, 2), (12, 2), (14, 1), (16, 1)],
  term ((57925 : Rat) / 1767) [(5, 2), (12, 2), (15, 2), (16, 1)],
  term ((-152 : Rat) / 31) [(5, 2), (12, 2), (16, 1)],
  term ((-304 : Rat) / 31) [(5, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((304 : Rat) / 31) [(5, 2), (13, 1), (15, 1), (16, 1)],
  term ((-115850 : Rat) / 1767) [(5, 2), (13, 1), (15, 3), (16, 1)],
  term ((152 : Rat) / 31) [(5, 2), (13, 2), (14, 1), (16, 1)],
  term ((36265 : Rat) / 1767) [(5, 2), (13, 2), (15, 2), (16, 1)],
  term ((-152 : Rat) / 31) [(5, 2), (13, 2), (16, 1)],
  term ((190 : Rat) / 31) [(5, 2), (13, 3), (15, 1), (16, 1)],
  term ((-608 : Rat) / 31) [(7, 1), (10, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((304 : Rat) / 31) [(7, 1), (10, 1), (11, 1), (12, 2), (16, 1)],
  term ((-608 : Rat) / 31) [(7, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((304 : Rat) / 31) [(7, 1), (10, 1), (11, 1), (13, 2), (16, 1)],
  term ((3971 : Rat) / 62) [(7, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-227480 : Rat) / 1767) [(7, 1), (10, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((61756 : Rat) / 1767) [(7, 1), (10, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((456 : Rat) / 31) [(7, 1), (10, 1), (12, 1), (13, 3), (16, 1)],
  term ((584811 : Rat) / 2356) [(7, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-912 : Rat) / 31) [(7, 1), (10, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-3971 : Rat) / 124) [(7, 1), (10, 1), (12, 2), (13, 1), (16, 1)],
  term ((-227480 : Rat) / 1767) [(7, 1), (10, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-584811 : Rat) / 4712) [(7, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((456 : Rat) / 31) [(7, 1), (10, 1), (12, 3), (13, 1), (16, 1)],
  term ((113740 : Rat) / 1767) [(7, 1), (10, 1), (12, 3), (15, 1), (16, 1)],
  term ((584811 : Rat) / 2356) [(7, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-283015 : Rat) / 4712) [(7, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-3971 : Rat) / 124) [(7, 1), (10, 1), (13, 3), (16, 1)],
  term ((-2280 : Rat) / 31) [(7, 1), (10, 2), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-568700 : Rat) / 1767) [(7, 1), (10, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((1140 : Rat) / 31) [(7, 1), (10, 2), (12, 2), (13, 1), (16, 1)],
  term ((284350 : Rat) / 1767) [(7, 1), (10, 2), (12, 2), (15, 1), (16, 1)],
  term ((-568700 : Rat) / 1767) [(7, 1), (10, 2), (13, 1), (15, 2), (16, 1)],
  term ((154390 : Rat) / 1767) [(7, 1), (10, 2), (13, 2), (15, 1), (16, 1)],
  term ((1140 : Rat) / 31) [(7, 1), (10, 2), (13, 3), (16, 1)],
  term ((2632 : Rat) / 589) [(7, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-1316 : Rat) / 589) [(7, 1), (11, 1), (12, 2), (16, 1)],
  term ((2632 : Rat) / 589) [(7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1316 : Rat) / 589) [(7, 1), (11, 1), (13, 2), (16, 1)],
  term ((-98455 : Rat) / 589) [(7, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2413 : Rat) / 31) [(7, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((6156 : Rat) / 31) [(7, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((-2907 : Rat) / 31) [(7, 1), (12, 1), (13, 1), (14, 3), (16, 1)],
  term ((280371 : Rat) / 589) [(7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((193865 : Rat) / 3534) [(7, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-137415 : Rat) / 1178) [(7, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((627 : Rat) / 31) [(7, 1), (12, 1), (13, 3), (14, 1), (16, 1)],
  term ((-1881 : Rat) / 31) [(7, 1), (12, 1), (13, 3), (16, 1)],
  term ((-361697 : Rat) / 1178) [(7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-531163 : Rat) / 1178) [(7, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((552774 : Rat) / 589) [(7, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-531163 : Rat) / 1178) [(7, 1), (12, 1), (14, 3), (15, 1), (16, 1)],
  term ((684 : Rat) / 31) [(7, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((2223 : Rat) / 62) [(7, 1), (12, 2), (13, 1), (14, 2), (16, 1)],
  term ((218770 : Rat) / 1767) [(7, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((2413 : Rat) / 62) [(7, 1), (12, 2), (13, 1), (16, 1)],
  term ((-67765 : Rat) / 1767) [(7, 1), (12, 2), (13, 2), (15, 1), (16, 1)],
  term ((-456 : Rat) / 31) [(7, 1), (12, 2), (13, 3), (16, 1)],
  term ((3984 : Rat) / 589) [(7, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((444719 : Rat) / 2356) [(7, 1), (12, 2), (14, 2), (15, 1), (16, 1)],
  term ((361697 : Rat) / 2356) [(7, 1), (12, 2), (15, 1), (16, 1)],
  term ((531163 : Rat) / 2356) [(7, 1), (12, 2), (15, 3), (16, 1)],
  term ((627 : Rat) / 31) [(7, 1), (12, 3), (13, 1), (14, 1), (16, 1)],
  term ((-1881 : Rat) / 31) [(7, 1), (12, 3), (13, 1), (16, 1)],
  term ((271841 : Rat) / 3534) [(7, 1), (12, 3), (14, 1), (15, 1), (16, 1)],
  term ((-280371 : Rat) / 1178) [(7, 1), (12, 3), (15, 1), (16, 1)],
  term ((-228 : Rat) / 31) [(7, 1), (12, 4), (13, 1), (16, 1)],
  term ((-51752 : Rat) / 1767) [(7, 1), (12, 4), (15, 1), (16, 1)],
  term ((552774 : Rat) / 589) [(7, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-531163 : Rat) / 1178) [(7, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-361697 : Rat) / 1178) [(7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-531163 : Rat) / 1178) [(7, 1), (13, 1), (15, 4), (16, 1)],
  term ((-159423 : Rat) / 589) [(7, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((310231 : Rat) / 2356) [(7, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((178309 : Rat) / 2356) [(7, 1), (13, 2), (15, 1), (16, 1)],
  term ((223787 : Rat) / 2356) [(7, 1), (13, 2), (15, 3), (16, 1)],
  term ((-3078 : Rat) / 31) [(7, 1), (13, 3), (14, 1), (16, 1)],
  term ((2907 : Rat) / 62) [(7, 1), (13, 3), (14, 2), (16, 1)],
  term ((199276 : Rat) / 1767) [(7, 1), (13, 3), (15, 2), (16, 1)],
  term ((2413 : Rat) / 62) [(7, 1), (13, 3), (16, 1)],
  term ((-16013 : Rat) / 1767) [(7, 1), (13, 4), (15, 1), (16, 1)],
  term ((-228 : Rat) / 31) [(7, 1), (13, 5), (16, 1)],
  term ((27600 : Rat) / 589) [(8, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((18400 : Rat) / 1767) [(8, 1), (10, 1), (12, 1), (14, 2), (16, 1)],
  term ((-9200 : Rat) / 1767) [(8, 1), (10, 1), (12, 2), (14, 1), (16, 1)],
  term ((-13800 : Rat) / 589) [(8, 1), (10, 1), (12, 2), (16, 1)],
  term ((18400 : Rat) / 1767) [(8, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((27600 : Rat) / 589) [(8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-9200 : Rat) / 1767) [(8, 1), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((-13800 : Rat) / 589) [(8, 1), (10, 1), (13, 2), (16, 1)],
  term ((228 : Rat) / 31) [(8, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((82058 : Rat) / 1767) [(8, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-114 : Rat) / 31) [(8, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-41029 : Rat) / 1767) [(8, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((82058 : Rat) / 1767) [(8, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-28033 : Rat) / 1767) [(8, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-114 : Rat) / 31) [(8, 1), (11, 1), (13, 3), (16, 1)],
  term ((-18400 : Rat) / 1767) [(8, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-9200 : Rat) / 1767) [(8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((9200 : Rat) / 1767) [(8, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((4600 : Rat) / 1767) [(8, 1), (12, 1), (13, 2), (16, 1)],
  term ((-64400 : Rat) / 1767) [(8, 1), (12, 1), (14, 1), (16, 1)],
  term ((-36800 : Rat) / 1767) [(8, 1), (12, 1), (14, 3), (16, 1)],
  term ((-9200 : Rat) / 1767) [(8, 1), (12, 2), (14, 1), (16, 1)],
  term ((32200 : Rat) / 1767) [(8, 1), (12, 2), (16, 1)],
  term ((9200 : Rat) / 1767) [(8, 1), (12, 3), (14, 1), (16, 1)],
  term ((4600 : Rat) / 1767) [(8, 1), (12, 3), (16, 1)],
  term ((-36800 : Rat) / 1767) [(8, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-64400 : Rat) / 1767) [(8, 1), (13, 1), (15, 1), (16, 1)],
  term ((18400 : Rat) / 1767) [(8, 1), (13, 2), (14, 2), (16, 1)],
  term ((32200 : Rat) / 1767) [(8, 1), (13, 2), (16, 1)],
  term ((-684 : Rat) / 31) [(9, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((912 : Rat) / 31) [(9, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((-684 : Rat) / 31) [(9, 1), (12, 1), (13, 1), (14, 3), (16, 1)],
  term ((-82058 : Rat) / 589) [(9, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((328232 : Rat) / 1767) [(9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-82058 : Rat) / 589) [(9, 1), (12, 1), (14, 3), (15, 1), (16, 1)],
  term ((-456 : Rat) / 31) [(9, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((342 : Rat) / 31) [(9, 1), (12, 2), (13, 1), (14, 2), (16, 1)],
  term ((342 : Rat) / 31) [(9, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-164116 : Rat) / 1767) [(9, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((41029 : Rat) / 589) [(9, 1), (12, 2), (14, 2), (15, 1), (16, 1)],
  term ((41029 : Rat) / 589) [(9, 1), (12, 2), (15, 3), (16, 1)],
  term ((328232 : Rat) / 1767) [(9, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-82058 : Rat) / 589) [(9, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-82058 : Rat) / 589) [(9, 1), (13, 1), (15, 4), (16, 1)],
  term ((-112132 : Rat) / 1767) [(9, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((28033 : Rat) / 589) [(9, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((28033 : Rat) / 589) [(9, 1), (13, 2), (15, 3), (16, 1)],
  term ((-456 : Rat) / 31) [(9, 1), (13, 3), (14, 1), (16, 1)],
  term ((342 : Rat) / 31) [(9, 1), (13, 3), (14, 2), (16, 1)],
  term ((342 : Rat) / 31) [(9, 1), (13, 3), (15, 2), (16, 1)],
  term ((-1596 : Rat) / 31) [(10, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((1824 : Rat) / 31) [(10, 1), (11, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((-129222 : Rat) / 589) [(10, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((454960 : Rat) / 1767) [(10, 1), (11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-912 : Rat) / 31) [(10, 1), (11, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((798 : Rat) / 31) [(10, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-227480 : Rat) / 1767) [(10, 1), (11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((64611 : Rat) / 589) [(10, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((454960 : Rat) / 1767) [(10, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-129222 : Rat) / 589) [(10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-123512 : Rat) / 1767) [(10, 1), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((34287 : Rat) / 589) [(10, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-912 : Rat) / 31) [(10, 1), (11, 1), (13, 3), (14, 1), (16, 1)],
  term ((798 : Rat) / 31) [(10, 1), (11, 1), (13, 3), (16, 1)],
  term ((-158529 : Rat) / 1178) [(10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-186536 : Rat) / 1767) [(10, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-12088 : Rat) / 589) [(10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((145592 : Rat) / 1767) [(10, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-1368 : Rat) / 31) [(10, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-912 : Rat) / 31) [(10, 1), (12, 1), (13, 2), (14, 2), (16, 1)],
  term ((-20812 : Rat) / 1767) [(10, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((6044 : Rat) / 589) [(10, 1), (12, 1), (13, 2), (16, 1)],
  term ((-456 : Rat) / 31) [(10, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((1591007 : Rat) / 7068) [(10, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-19436 : Rat) / 1767) [(10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-6058 : Rat) / 1767) [(10, 1), (12, 1), (14, 2), (16, 1)],
  term ((36800 : Rat) / 1767) [(10, 1), (12, 1), (14, 3), (16, 1)],
  term ((145252 : Rat) / 1767) [(10, 1), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((158529 : Rat) / 2356) [(10, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((456 : Rat) / 31) [(10, 1), (12, 2), (13, 2), (14, 1), (16, 1)],
  term ((684 : Rat) / 31) [(10, 1), (12, 2), (13, 2), (16, 1)],
  term ((145592 : Rat) / 1767) [(10, 1), (12, 2), (14, 1), (15, 2), (16, 1)],
  term ((-33235 : Rat) / 1767) [(10, 1), (12, 2), (14, 1), (16, 1)],
  term ((-18400 : Rat) / 1767) [(10, 1), (12, 2), (14, 2), (16, 1)],
  term ((-1591007 : Rat) / 14136) [(10, 1), (12, 2), (15, 2), (16, 1)],
  term ((9718 : Rat) / 1767) [(10, 1), (12, 2), (16, 1)],
  term ((-456 : Rat) / 31) [(10, 1), (12, 3), (13, 1), (15, 1), (16, 1)],
  term ((-72796 : Rat) / 1767) [(10, 1), (12, 3), (15, 2), (16, 1)],
  term ((6044 : Rat) / 589) [(10, 1), (12, 3), (16, 1)],
  term ((-6058 : Rat) / 1767) [(10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((36800 : Rat) / 1767) [(10, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-19436 : Rat) / 1767) [(10, 1), (13, 1), (15, 1), (16, 1)],
  term ((1591007 : Rat) / 7068) [(10, 1), (13, 1), (15, 3), (16, 1)],
  term ((-186536 : Rat) / 1767) [(10, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((3029 : Rat) / 1767) [(10, 1), (13, 2), (14, 1), (16, 1)],
  term ((-18400 : Rat) / 1767) [(10, 1), (13, 2), (14, 2), (16, 1)],
  term ((-3493355 : Rat) / 14136) [(10, 1), (13, 2), (15, 2), (16, 1)],
  term ((9718 : Rat) / 1767) [(10, 1), (13, 2), (16, 1)],
  term ((41284 : Rat) / 1767) [(10, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((54561 : Rat) / 2356) [(10, 1), (13, 3), (15, 1), (16, 1)],
  term ((456 : Rat) / 31) [(10, 1), (13, 4), (14, 1), (16, 1)],
  term ((684 : Rat) / 31) [(10, 1), (13, 4), (16, 1)],
  term ((-1824 : Rat) / 31) [(10, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-454960 : Rat) / 1767) [(10, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-52 : Rat) / 589) [(10, 2), (12, 1), (14, 1), (16, 1)],
  term ((-18400 : Rat) / 1767) [(10, 2), (12, 1), (14, 2), (16, 1)],
  term ((912 : Rat) / 31) [(10, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((9200 : Rat) / 1767) [(10, 2), (12, 2), (14, 1), (16, 1)],
  term ((227480 : Rat) / 1767) [(10, 2), (12, 2), (15, 2), (16, 1)],
  term ((26 : Rat) / 589) [(10, 2), (12, 2), (16, 1)],
  term ((-18400 : Rat) / 1767) [(10, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-52 : Rat) / 589) [(10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-454960 : Rat) / 1767) [(10, 2), (13, 1), (15, 3), (16, 1)],
  term ((9200 : Rat) / 1767) [(10, 2), (13, 2), (14, 1), (16, 1)],
  term ((123512 : Rat) / 1767) [(10, 2), (13, 2), (15, 2), (16, 1)],
  term ((26 : Rat) / 589) [(10, 2), (13, 2), (16, 1)],
  term ((912 : Rat) / 31) [(10, 2), (13, 3), (15, 1), (16, 1)],
  term ((13648 : Rat) / 589) [(11, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((67927 : Rat) / 2356) [(11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-88025 : Rat) / 1178) [(11, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((-5264 : Rat) / 589) [(11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-6824 : Rat) / 589) [(11, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((2632 : Rat) / 589) [(11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((711989 : Rat) / 4712) [(11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1799537 : Rat) / 7068) [(11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((88025 : Rat) / 2356) [(11, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-67927 : Rat) / 4712) [(11, 1), (12, 2), (13, 1), (16, 1)],
  term ((1673201 : Rat) / 14136) [(11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((13648 : Rat) / 589) [(11, 1), (12, 2), (14, 2), (15, 1), (16, 1)],
  term ((-711989 : Rat) / 9424) [(11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-6824 : Rat) / 589) [(11, 1), (12, 3), (14, 1), (15, 1), (16, 1)],
  term ((2632 : Rat) / 589) [(11, 1), (12, 3), (15, 1), (16, 1)],
  term ((-1799537 : Rat) / 7068) [(11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((711989 : Rat) / 4712) [(11, 1), (13, 1), (15, 2), (16, 1)],
  term ((743237 : Rat) / 14136) [(11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-440281 : Rat) / 9424) [(11, 1), (13, 2), (15, 1), (16, 1)],
  term ((88025 : Rat) / 2356) [(11, 1), (13, 3), (14, 1), (16, 1)],
  term ((-67927 : Rat) / 4712) [(11, 1), (13, 3), (16, 1)],
  term ((524 : Rat) / 57) [(11, 2), (12, 1), (14, 1), (16, 1)],
  term ((-9608 : Rat) / 589) [(11, 2), (12, 1), (14, 2), (16, 1)],
  term ((4804 : Rat) / 589) [(11, 2), (12, 2), (14, 1), (16, 1)],
  term ((-262 : Rat) / 57) [(11, 2), (12, 2), (16, 1)],
  term ((-9608 : Rat) / 589) [(11, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((524 : Rat) / 57) [(11, 2), (13, 1), (15, 1), (16, 1)],
  term ((4804 : Rat) / 589) [(11, 2), (13, 2), (14, 1), (16, 1)],
  term ((-262 : Rat) / 57) [(11, 2), (13, 2), (16, 1)],
  term ((-14844 : Rat) / 589) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-48150 : Rat) / 589) [(12, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((172310 : Rat) / 589) [(12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-91372 : Rat) / 589) [(12, 1), (13, 1), (14, 3), (15, 1), (16, 1)],
  term ((-1152 : Rat) / 589) [(12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-210337 : Rat) / 1767) [(12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-130493 : Rat) / 3534) [(12, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((36950 : Rat) / 589) [(12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-17712 : Rat) / 589) [(12, 1), (13, 2), (14, 2), (16, 1)],
  term ((-806347 : Rat) / 3534) [(12, 1), (13, 2), (15, 2), (16, 1)],
  term ((576 : Rat) / 589) [(12, 1), (13, 2), (16, 1)],
  term ((-9577 : Rat) / 1767) [(12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((150203 : Rat) / 1767) [(12, 1), (13, 3), (15, 1), (16, 1)],
  term ((228 : Rat) / 31) [(12, 1), (13, 4), (14, 1), (16, 1)],
  term ((912 : Rat) / 31) [(12, 1), (13, 4), (16, 1)],
  term ((-231757 : Rat) / 589) [(12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((104228 : Rat) / 1767) [(12, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-88048 : Rat) / 1767) [(12, 2), (13, 1), (15, 1), (16, 1)],
  term ((7503 : Rat) / 62) [(12, 2), (13, 1), (15, 3), (16, 1)],
  term ((-113168 : Rat) / 1767) [(12, 2), (13, 2), (14, 1), (16, 1)],
  term ((-456 : Rat) / 31) [(12, 2), (13, 2), (14, 2), (16, 1)],
  term ((-5203 : Rat) / 589) [(12, 2), (13, 2), (15, 2), (16, 1)],
  term ((-268 : Rat) / 1767) [(12, 2), (13, 2), (16, 1)],
  term ((-342 : Rat) / 31) [(12, 2), (13, 3), (15, 1), (16, 1)],
  term ((-210337 : Rat) / 1767) [(12, 2), (14, 1), (15, 2), (16, 1)],
  term ((-1152 : Rat) / 589) [(12, 2), (14, 1), (16, 1)],
  term ((21611 : Rat) / 589) [(12, 2), (14, 2), (15, 2), (16, 1)],
  term ((-73900 : Rat) / 589) [(12, 2), (14, 2), (16, 1)],
  term ((35424 : Rat) / 589) [(12, 2), (14, 3), (16, 1)],
  term ((55403 : Rat) / 1767) [(12, 3), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((254171 : Rat) / 1767) [(12, 3), (13, 1), (15, 1), (16, 1)],
  term ((228 : Rat) / 31) [(12, 3), (13, 2), (14, 1), (16, 1)],
  term ((912 : Rat) / 31) [(12, 3), (13, 2), (16, 1)],
  term ((51185 : Rat) / 1178) [(12, 3), (14, 1), (15, 2), (16, 1)],
  term ((111386 : Rat) / 1767) [(12, 3), (14, 1), (16, 1)],
  term ((-34736 : Rat) / 1767) [(12, 3), (14, 2), (16, 1)],
  term ((210337 : Rat) / 3534) [(12, 3), (15, 2), (16, 1)],
  term ((576 : Rat) / 589) [(12, 3), (16, 1)],
  term ((-342 : Rat) / 31) [(12, 4), (13, 1), (15, 1), (16, 1)],
  term ((-9200 : Rat) / 1767) [(12, 4), (14, 1), (16, 1)],
  term ((-18199 : Rat) / 589) [(12, 4), (15, 2), (16, 1)],
  term ((-268 : Rat) / 1767) [(12, 4), (16, 1)],
  term ((136886 : Rat) / 589) [(13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-91372 : Rat) / 589) [(13, 2), (14, 2), (15, 2), (16, 1)],
  term ((59056 : Rat) / 589) [(13, 2), (15, 2), (16, 1)],
  term ((-69761 : Rat) / 589) [(13, 2), (15, 4), (16, 1)],
  term ((-68443 : Rat) / 589) [(13, 3), (14, 1), (15, 1), (16, 1)],
  term ((45686 : Rat) / 589) [(13, 3), (14, 2), (15, 1), (16, 1)],
  term ((-29528 : Rat) / 589) [(13, 3), (15, 1), (16, 1)],
  term ((69761 : Rat) / 1178) [(13, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 30, terms 400 through 499. -/
theorem rs_R009_ueqv_R009NNNNN_block_30_0400_0499_valid :
    checkProductSumEq rs_R009_ueqv_R009NNNNN_partials_30_0400_0499
      rs_R009_ueqv_R009NNNNN_block_30_0400_0499 = true := by
  native_decide

end R009UeqvR009NNNNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
