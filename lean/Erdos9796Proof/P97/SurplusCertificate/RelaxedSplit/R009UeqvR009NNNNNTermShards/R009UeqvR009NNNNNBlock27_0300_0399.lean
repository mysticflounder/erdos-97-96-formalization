/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NNNNN, term block 27:300-399

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NNNNNTermShards

/-- Generator polynomial 27 for relaxed split surplus certificate `R009:u=v:R009NNNNN`. -/
def rs_R009_ueqv_R009NNNNN_generator_27_0300_0399 : Poly :=
[
  term (-2 : Rat) [(0, 1), (12, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (13, 1)],
  term (1 : Rat) [(1, 2)],
  term (2 : Rat) [(12, 1), (14, 1)],
  term (2 : Rat) [(13, 1), (15, 1)],
  term (-1 : Rat) [(14, 2)],
  term (-1 : Rat) [(15, 2)]
]

/-- Coefficient term 300 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNNN_coefficient_27_0300 : Poly :=
[
  term ((2688 : Rat) / 589) [(3, 1), (10, 2), (15, 1), (16, 1)]
]

/-- Partial product 300 for generator 27. -/
def rs_R009_ueqv_R009NNNNN_partial_27_0300 : Poly :=
[
  term ((-5376 : Rat) / 589) [(0, 1), (3, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((2688 : Rat) / 589) [(0, 2), (3, 1), (10, 2), (15, 1), (16, 1)],
  term ((-5376 : Rat) / 589) [(1, 1), (3, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((2688 : Rat) / 589) [(1, 2), (3, 1), (10, 2), (15, 1), (16, 1)],
  term ((5376 : Rat) / 589) [(3, 1), (10, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((5376 : Rat) / 589) [(3, 1), (10, 2), (13, 1), (15, 2), (16, 1)],
  term ((-2688 : Rat) / 589) [(3, 1), (10, 2), (14, 2), (15, 1), (16, 1)],
  term ((-2688 : Rat) / 589) [(3, 1), (10, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 300 for generator 27. -/
theorem rs_R009_ueqv_R009NNNNN_partial_27_0300_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_27_0300
        rs_R009_ueqv_R009NNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009NNNNN_partial_27_0300 := by
  native_decide

/-- Coefficient term 301 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNNN_coefficient_27_0301 : Poly :=
[
  term ((3840 : Rat) / 589) [(3, 1), (11, 1), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 301 for generator 27. -/
def rs_R009_ueqv_R009NNNNN_partial_27_0301 : Poly :=
[
  term ((-7680 : Rat) / 589) [(0, 1), (3, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((3840 : Rat) / 589) [(0, 2), (3, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-7680 : Rat) / 589) [(1, 1), (3, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((3840 : Rat) / 589) [(1, 2), (3, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((7680 : Rat) / 589) [(3, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3840 : Rat) / 589) [(3, 1), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-3840 : Rat) / 589) [(3, 1), (11, 1), (12, 1), (14, 3), (16, 1)],
  term ((7680 : Rat) / 589) [(3, 1), (11, 1), (12, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 301 for generator 27. -/
theorem rs_R009_ueqv_R009NNNNN_partial_27_0301_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_27_0301
        rs_R009_ueqv_R009NNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009NNNNN_partial_27_0301 := by
  native_decide

/-- Coefficient term 302 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNNN_coefficient_27_0302 : Poly :=
[
  term ((1536 : Rat) / 589) [(3, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 302 for generator 27. -/
def rs_R009_ueqv_R009NNNNN_partial_27_0302 : Poly :=
[
  term ((-3072 : Rat) / 589) [(0, 1), (3, 1), (11, 1), (12, 2), (16, 1)],
  term ((1536 : Rat) / 589) [(0, 2), (3, 1), (11, 1), (12, 1), (16, 1)],
  term ((-3072 : Rat) / 589) [(1, 1), (3, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((1536 : Rat) / 589) [(1, 2), (3, 1), (11, 1), (12, 1), (16, 1)],
  term ((3072 : Rat) / 589) [(3, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1536 : Rat) / 589) [(3, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((-1536 : Rat) / 589) [(3, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((3072 : Rat) / 589) [(3, 1), (11, 1), (12, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 302 for generator 27. -/
theorem rs_R009_ueqv_R009NNNNN_partial_27_0302_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_27_0302
        rs_R009_ueqv_R009NNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009NNNNN_partial_27_0302 := by
  native_decide

/-- Coefficient term 303 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNNN_coefficient_27_0303 : Poly :=
[
  term ((-10205 : Rat) / 589) [(3, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 303 for generator 27. -/
def rs_R009_ueqv_R009NNNNN_partial_27_0303 : Poly :=
[
  term ((20410 : Rat) / 589) [(0, 1), (3, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-10205 : Rat) / 589) [(0, 2), (3, 1), (11, 1), (14, 1), (16, 1)],
  term ((20410 : Rat) / 589) [(1, 1), (3, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-10205 : Rat) / 589) [(1, 2), (3, 1), (11, 1), (14, 1), (16, 1)],
  term ((-20410 : Rat) / 589) [(3, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((-20410 : Rat) / 589) [(3, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((10205 : Rat) / 589) [(3, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((10205 : Rat) / 589) [(3, 1), (11, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 303 for generator 27. -/
theorem rs_R009_ueqv_R009NNNNN_partial_27_0303_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_27_0303
        rs_R009_ueqv_R009NNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009NNNNN_partial_27_0303 := by
  native_decide

/-- Coefficient term 304 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNNN_coefficient_27_0304 : Poly :=
[
  term ((-22745 : Rat) / 1178) [(3, 1), (11, 1), (16, 1)]
]

/-- Partial product 304 for generator 27. -/
def rs_R009_ueqv_R009NNNNN_partial_27_0304 : Poly :=
[
  term ((22745 : Rat) / 589) [(0, 1), (3, 1), (11, 1), (12, 1), (16, 1)],
  term ((-22745 : Rat) / 1178) [(0, 2), (3, 1), (11, 1), (16, 1)],
  term ((22745 : Rat) / 589) [(1, 1), (3, 1), (11, 1), (13, 1), (16, 1)],
  term ((-22745 : Rat) / 1178) [(1, 2), (3, 1), (11, 1), (16, 1)],
  term ((-22745 : Rat) / 589) [(3, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-22745 : Rat) / 589) [(3, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((22745 : Rat) / 1178) [(3, 1), (11, 1), (14, 2), (16, 1)],
  term ((22745 : Rat) / 1178) [(3, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 304 for generator 27. -/
theorem rs_R009_ueqv_R009NNNNN_partial_27_0304_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_27_0304
        rs_R009_ueqv_R009NNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009NNNNN_partial_27_0304 := by
  native_decide

/-- Coefficient term 305 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNNN_coefficient_27_0305 : Poly :=
[
  term ((-20211 : Rat) / 589) [(3, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 305 for generator 27. -/
def rs_R009_ueqv_R009NNNNN_partial_27_0305 : Poly :=
[
  term ((40422 : Rat) / 589) [(0, 1), (3, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-20211 : Rat) / 589) [(0, 2), (3, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((40422 : Rat) / 589) [(1, 1), (3, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-20211 : Rat) / 589) [(1, 2), (3, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((20211 : Rat) / 589) [(3, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((20211 : Rat) / 589) [(3, 1), (12, 1), (13, 1), (14, 3), (16, 1)],
  term ((-40422 : Rat) / 589) [(3, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-40422 : Rat) / 589) [(3, 1), (12, 2), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 305 for generator 27. -/
theorem rs_R009_ueqv_R009NNNNN_partial_27_0305_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_27_0305
        rs_R009_ueqv_R009NNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009NNNNN_partial_27_0305 := by
  native_decide

/-- Coefficient term 306 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNNN_coefficient_27_0306 : Poly :=
[
  term ((918 : Rat) / 589) [(3, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 306 for generator 27. -/
def rs_R009_ueqv_R009NNNNN_partial_27_0306 : Poly :=
[
  term ((-1836 : Rat) / 589) [(0, 1), (3, 1), (12, 2), (13, 1), (16, 1)],
  term ((918 : Rat) / 589) [(0, 2), (3, 1), (12, 1), (13, 1), (16, 1)],
  term ((-1836 : Rat) / 589) [(1, 1), (3, 1), (12, 1), (13, 2), (16, 1)],
  term ((918 : Rat) / 589) [(1, 2), (3, 1), (12, 1), (13, 1), (16, 1)],
  term ((-918 : Rat) / 589) [(3, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((-918 : Rat) / 589) [(3, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((1836 : Rat) / 589) [(3, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((1836 : Rat) / 589) [(3, 1), (12, 2), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 306 for generator 27. -/
theorem rs_R009_ueqv_R009NNNNN_partial_27_0306_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_27_0306
        rs_R009_ueqv_R009NNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009NNNNN_partial_27_0306 := by
  native_decide

/-- Coefficient term 307 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNNN_coefficient_27_0307 : Poly :=
[
  term ((-57669 : Rat) / 1178) [(3, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 307 for generator 27. -/
def rs_R009_ueqv_R009NNNNN_partial_27_0307 : Poly :=
[
  term ((57669 : Rat) / 589) [(0, 1), (3, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-57669 : Rat) / 1178) [(0, 2), (3, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((57669 : Rat) / 589) [(1, 1), (3, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-57669 : Rat) / 1178) [(1, 2), (3, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-57669 : Rat) / 589) [(3, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((57669 : Rat) / 1178) [(3, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((57669 : Rat) / 1178) [(3, 1), (12, 1), (14, 3), (15, 1), (16, 1)],
  term ((-57669 : Rat) / 589) [(3, 1), (12, 2), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 307 for generator 27. -/
theorem rs_R009_ueqv_R009NNNNN_partial_27_0307_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_27_0307
        rs_R009_ueqv_R009NNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009NNNNN_partial_27_0307 := by
  native_decide

/-- Coefficient term 308 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNNN_coefficient_27_0308 : Poly :=
[
  term ((-38495 : Rat) / 1767) [(3, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 308 for generator 27. -/
def rs_R009_ueqv_R009NNNNN_partial_27_0308 : Poly :=
[
  term ((76990 : Rat) / 1767) [(0, 1), (3, 1), (12, 2), (15, 1), (16, 1)],
  term ((-38495 : Rat) / 1767) [(0, 2), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((76990 : Rat) / 1767) [(1, 1), (3, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-38495 : Rat) / 1767) [(1, 2), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((-76990 : Rat) / 1767) [(3, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((38495 : Rat) / 1767) [(3, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((38495 : Rat) / 1767) [(3, 1), (12, 1), (15, 3), (16, 1)],
  term ((-76990 : Rat) / 1767) [(3, 1), (12, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 308 for generator 27. -/
theorem rs_R009_ueqv_R009NNNNN_partial_27_0308_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_27_0308
        rs_R009_ueqv_R009NNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009NNNNN_partial_27_0308 := by
  native_decide

/-- Coefficient term 309 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNNN_coefficient_27_0309 : Poly :=
[
  term ((288 : Rat) / 19) [(3, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 309 for generator 27. -/
def rs_R009_ueqv_R009NNNNN_partial_27_0309 : Poly :=
[
  term ((-576 : Rat) / 19) [(0, 1), (3, 1), (12, 3), (15, 1), (16, 1)],
  term ((288 : Rat) / 19) [(0, 2), (3, 1), (12, 2), (15, 1), (16, 1)],
  term ((-576 : Rat) / 19) [(1, 1), (3, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((288 : Rat) / 19) [(1, 2), (3, 1), (12, 2), (15, 1), (16, 1)],
  term ((576 : Rat) / 19) [(3, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-288 : Rat) / 19) [(3, 1), (12, 2), (14, 2), (15, 1), (16, 1)],
  term ((-288 : Rat) / 19) [(3, 1), (12, 2), (15, 3), (16, 1)],
  term ((576 : Rat) / 19) [(3, 1), (12, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 309 for generator 27. -/
theorem rs_R009_ueqv_R009NNNNN_partial_27_0309_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_27_0309
        rs_R009_ueqv_R009NNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009NNNNN_partial_27_0309 := by
  native_decide

/-- Coefficient term 310 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNNN_coefficient_27_0310 : Poly :=
[
  term ((-1365 : Rat) / 1178) [(3, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 310 for generator 27. -/
def rs_R009_ueqv_R009NNNNN_partial_27_0310 : Poly :=
[
  term ((1365 : Rat) / 589) [(0, 1), (3, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1365 : Rat) / 1178) [(0, 2), (3, 1), (13, 1), (14, 1), (16, 1)],
  term ((1365 : Rat) / 589) [(1, 1), (3, 1), (13, 2), (14, 1), (16, 1)],
  term ((-1365 : Rat) / 1178) [(1, 2), (3, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1365 : Rat) / 589) [(3, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((1365 : Rat) / 1178) [(3, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((1365 : Rat) / 1178) [(3, 1), (13, 1), (14, 3), (16, 1)],
  term ((-1365 : Rat) / 589) [(3, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 310 for generator 27. -/
theorem rs_R009_ueqv_R009NNNNN_partial_27_0310_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_27_0310
        rs_R009_ueqv_R009NNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009NNNNN_partial_27_0310 := by
  native_decide

/-- Coefficient term 311 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNNN_coefficient_27_0311 : Poly :=
[
  term ((33285 : Rat) / 1178) [(3, 1), (13, 1), (14, 2), (16, 1)]
]

/-- Partial product 311 for generator 27. -/
def rs_R009_ueqv_R009NNNNN_partial_27_0311 : Poly :=
[
  term ((-33285 : Rat) / 589) [(0, 1), (3, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((33285 : Rat) / 1178) [(0, 2), (3, 1), (13, 1), (14, 2), (16, 1)],
  term ((-33285 : Rat) / 589) [(1, 1), (3, 1), (13, 2), (14, 2), (16, 1)],
  term ((33285 : Rat) / 1178) [(1, 2), (3, 1), (13, 1), (14, 2), (16, 1)],
  term ((33285 : Rat) / 589) [(3, 1), (12, 1), (13, 1), (14, 3), (16, 1)],
  term ((-33285 : Rat) / 1178) [(3, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-33285 : Rat) / 1178) [(3, 1), (13, 1), (14, 4), (16, 1)],
  term ((33285 : Rat) / 589) [(3, 1), (13, 2), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 311 for generator 27. -/
theorem rs_R009_ueqv_R009NNNNN_partial_27_0311_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_27_0311
        rs_R009_ueqv_R009NNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009NNNNN_partial_27_0311 := by
  native_decide

/-- Coefficient term 312 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNNN_coefficient_27_0312 : Poly :=
[
  term ((107870 : Rat) / 1767) [(3, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 312 for generator 27. -/
def rs_R009_ueqv_R009NNNNN_partial_27_0312 : Poly :=
[
  term ((-215740 : Rat) / 1767) [(0, 1), (3, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((107870 : Rat) / 1767) [(0, 2), (3, 1), (13, 1), (15, 2), (16, 1)],
  term ((-215740 : Rat) / 1767) [(1, 1), (3, 1), (13, 2), (15, 2), (16, 1)],
  term ((107870 : Rat) / 1767) [(1, 2), (3, 1), (13, 1), (15, 2), (16, 1)],
  term ((215740 : Rat) / 1767) [(3, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-107870 : Rat) / 1767) [(3, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-107870 : Rat) / 1767) [(3, 1), (13, 1), (15, 4), (16, 1)],
  term ((215740 : Rat) / 1767) [(3, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 312 for generator 27. -/
theorem rs_R009_ueqv_R009NNNNN_partial_27_0312_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_27_0312
        rs_R009_ueqv_R009NNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009NNNNN_partial_27_0312 := by
  native_decide

/-- Coefficient term 313 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNNN_coefficient_27_0313 : Poly :=
[
  term ((-20091 : Rat) / 1178) [(3, 1), (13, 1), (16, 1)]
]

/-- Partial product 313 for generator 27. -/
def rs_R009_ueqv_R009NNNNN_partial_27_0313 : Poly :=
[
  term ((20091 : Rat) / 589) [(0, 1), (3, 1), (12, 1), (13, 1), (16, 1)],
  term ((-20091 : Rat) / 1178) [(0, 2), (3, 1), (13, 1), (16, 1)],
  term ((20091 : Rat) / 589) [(1, 1), (3, 1), (13, 2), (16, 1)],
  term ((-20091 : Rat) / 1178) [(1, 2), (3, 1), (13, 1), (16, 1)],
  term ((-20091 : Rat) / 589) [(3, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((20091 : Rat) / 1178) [(3, 1), (13, 1), (14, 2), (16, 1)],
  term ((20091 : Rat) / 1178) [(3, 1), (13, 1), (15, 2), (16, 1)],
  term ((-20091 : Rat) / 589) [(3, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 313 for generator 27. -/
theorem rs_R009_ueqv_R009NNNNN_partial_27_0313_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_27_0313
        rs_R009_ueqv_R009NNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009NNNNN_partial_27_0313 := by
  native_decide

/-- Coefficient term 314 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNNN_coefficient_27_0314 : Poly :=
[
  term ((-453 : Rat) / 589) [(3, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 314 for generator 27. -/
def rs_R009_ueqv_R009NNNNN_partial_27_0314 : Poly :=
[
  term ((906 : Rat) / 589) [(0, 1), (3, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-453 : Rat) / 589) [(0, 2), (3, 1), (13, 2), (15, 1), (16, 1)],
  term ((906 : Rat) / 589) [(1, 1), (3, 1), (13, 3), (15, 1), (16, 1)],
  term ((-453 : Rat) / 589) [(1, 2), (3, 1), (13, 2), (15, 1), (16, 1)],
  term ((-906 : Rat) / 589) [(3, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((453 : Rat) / 589) [(3, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((453 : Rat) / 589) [(3, 1), (13, 2), (15, 3), (16, 1)],
  term ((-906 : Rat) / 589) [(3, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 314 for generator 27. -/
theorem rs_R009_ueqv_R009NNNNN_partial_27_0314_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_27_0314
        rs_R009_ueqv_R009NNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009NNNNN_partial_27_0314 := by
  native_decide

/-- Coefficient term 315 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNNN_coefficient_27_0315 : Poly :=
[
  term ((1143077 : Rat) / 7068) [(3, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 315 for generator 27. -/
def rs_R009_ueqv_R009NNNNN_partial_27_0315 : Poly :=
[
  term ((-1143077 : Rat) / 3534) [(0, 1), (3, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((1143077 : Rat) / 7068) [(0, 2), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1143077 : Rat) / 3534) [(1, 1), (3, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1143077 : Rat) / 7068) [(1, 2), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((1143077 : Rat) / 3534) [(3, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((1143077 : Rat) / 3534) [(3, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1143077 : Rat) / 7068) [(3, 1), (14, 1), (15, 3), (16, 1)],
  term ((-1143077 : Rat) / 7068) [(3, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 315 for generator 27. -/
theorem rs_R009_ueqv_R009NNNNN_partial_27_0315_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_27_0315
        rs_R009_ueqv_R009NNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009NNNNN_partial_27_0315 := by
  native_decide

/-- Coefficient term 316 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNNN_coefficient_27_0316 : Poly :=
[
  term ((-340711 : Rat) / 7068) [(3, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 316 for generator 27. -/
def rs_R009_ueqv_R009NNNNN_partial_27_0316 : Poly :=
[
  term ((340711 : Rat) / 3534) [(0, 1), (3, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-340711 : Rat) / 7068) [(0, 2), (3, 1), (14, 2), (15, 1), (16, 1)],
  term ((340711 : Rat) / 3534) [(1, 1), (3, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-340711 : Rat) / 7068) [(1, 2), (3, 1), (14, 2), (15, 1), (16, 1)],
  term ((-340711 : Rat) / 3534) [(3, 1), (12, 1), (14, 3), (15, 1), (16, 1)],
  term ((-340711 : Rat) / 3534) [(3, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((340711 : Rat) / 7068) [(3, 1), (14, 2), (15, 3), (16, 1)],
  term ((340711 : Rat) / 7068) [(3, 1), (14, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 316 for generator 27. -/
theorem rs_R009_ueqv_R009NNNNN_partial_27_0316_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_27_0316
        rs_R009_ueqv_R009NNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009NNNNN_partial_27_0316 := by
  native_decide

/-- Coefficient term 317 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNNN_coefficient_27_0317 : Poly :=
[
  term ((-496175 : Rat) / 7068) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 317 for generator 27. -/
def rs_R009_ueqv_R009NNNNN_partial_27_0317 : Poly :=
[
  term ((496175 : Rat) / 3534) [(0, 1), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((-496175 : Rat) / 7068) [(0, 2), (3, 1), (15, 1), (16, 1)],
  term ((496175 : Rat) / 3534) [(1, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term ((-496175 : Rat) / 7068) [(1, 2), (3, 1), (15, 1), (16, 1)],
  term ((-496175 : Rat) / 3534) [(3, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-496175 : Rat) / 3534) [(3, 1), (13, 1), (15, 2), (16, 1)],
  term ((496175 : Rat) / 7068) [(3, 1), (14, 2), (15, 1), (16, 1)],
  term ((496175 : Rat) / 7068) [(3, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 317 for generator 27. -/
theorem rs_R009_ueqv_R009NNNNN_partial_27_0317_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_27_0317
        rs_R009_ueqv_R009NNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009NNNNN_partial_27_0317 := by
  native_decide

/-- Coefficient term 318 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNNN_coefficient_27_0318 : Poly :=
[
  term ((47143 : Rat) / 7068) [(3, 1), (15, 3), (16, 1)]
]

/-- Partial product 318 for generator 27. -/
def rs_R009_ueqv_R009NNNNN_partial_27_0318 : Poly :=
[
  term ((-47143 : Rat) / 3534) [(0, 1), (3, 1), (12, 1), (15, 3), (16, 1)],
  term ((47143 : Rat) / 7068) [(0, 2), (3, 1), (15, 3), (16, 1)],
  term ((-47143 : Rat) / 3534) [(1, 1), (3, 1), (13, 1), (15, 3), (16, 1)],
  term ((47143 : Rat) / 7068) [(1, 2), (3, 1), (15, 3), (16, 1)],
  term ((47143 : Rat) / 3534) [(3, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((47143 : Rat) / 3534) [(3, 1), (13, 1), (15, 4), (16, 1)],
  term ((-47143 : Rat) / 7068) [(3, 1), (14, 2), (15, 3), (16, 1)],
  term ((-47143 : Rat) / 7068) [(3, 1), (15, 5), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 318 for generator 27. -/
theorem rs_R009_ueqv_R009NNNNN_partial_27_0318_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_27_0318
        rs_R009_ueqv_R009NNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009NNNNN_partial_27_0318 := by
  native_decide

/-- Coefficient term 319 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNNN_coefficient_27_0319 : Poly :=
[
  term ((6912 : Rat) / 589) [(3, 2), (4, 1), (10, 1), (16, 1)]
]

/-- Partial product 319 for generator 27. -/
def rs_R009_ueqv_R009NNNNN_partial_27_0319 : Poly :=
[
  term ((-13824 : Rat) / 589) [(0, 1), (3, 2), (4, 1), (10, 1), (12, 1), (16, 1)],
  term ((6912 : Rat) / 589) [(0, 2), (3, 2), (4, 1), (10, 1), (16, 1)],
  term ((-13824 : Rat) / 589) [(1, 1), (3, 2), (4, 1), (10, 1), (13, 1), (16, 1)],
  term ((6912 : Rat) / 589) [(1, 2), (3, 2), (4, 1), (10, 1), (16, 1)],
  term ((13824 : Rat) / 589) [(3, 2), (4, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((13824 : Rat) / 589) [(3, 2), (4, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-6912 : Rat) / 589) [(3, 2), (4, 1), (10, 1), (14, 2), (16, 1)],
  term ((-6912 : Rat) / 589) [(3, 2), (4, 1), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 319 for generator 27. -/
theorem rs_R009_ueqv_R009NNNNN_partial_27_0319_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_27_0319
        rs_R009_ueqv_R009NNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009NNNNN_partial_27_0319 := by
  native_decide

/-- Coefficient term 320 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNNN_coefficient_27_0320 : Poly :=
[
  term ((-4416 : Rat) / 589) [(3, 2), (4, 1), (12, 1), (16, 1)]
]

/-- Partial product 320 for generator 27. -/
def rs_R009_ueqv_R009NNNNN_partial_27_0320 : Poly :=
[
  term ((8832 : Rat) / 589) [(0, 1), (3, 2), (4, 1), (12, 2), (16, 1)],
  term ((-4416 : Rat) / 589) [(0, 2), (3, 2), (4, 1), (12, 1), (16, 1)],
  term ((8832 : Rat) / 589) [(1, 1), (3, 2), (4, 1), (12, 1), (13, 1), (16, 1)],
  term ((-4416 : Rat) / 589) [(1, 2), (3, 2), (4, 1), (12, 1), (16, 1)],
  term ((-8832 : Rat) / 589) [(3, 2), (4, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((4416 : Rat) / 589) [(3, 2), (4, 1), (12, 1), (14, 2), (16, 1)],
  term ((4416 : Rat) / 589) [(3, 2), (4, 1), (12, 1), (15, 2), (16, 1)],
  term ((-8832 : Rat) / 589) [(3, 2), (4, 1), (12, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 320 for generator 27. -/
theorem rs_R009_ueqv_R009NNNNN_partial_27_0320_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_27_0320
        rs_R009_ueqv_R009NNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009NNNNN_partial_27_0320 := by
  native_decide

/-- Coefficient term 321 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNNN_coefficient_27_0321 : Poly :=
[
  term ((428 : Rat) / 589) [(3, 2), (4, 1), (16, 1)]
]

/-- Partial product 321 for generator 27. -/
def rs_R009_ueqv_R009NNNNN_partial_27_0321 : Poly :=
[
  term ((-856 : Rat) / 589) [(0, 1), (3, 2), (4, 1), (12, 1), (16, 1)],
  term ((428 : Rat) / 589) [(0, 2), (3, 2), (4, 1), (16, 1)],
  term ((-856 : Rat) / 589) [(1, 1), (3, 2), (4, 1), (13, 1), (16, 1)],
  term ((428 : Rat) / 589) [(1, 2), (3, 2), (4, 1), (16, 1)],
  term ((856 : Rat) / 589) [(3, 2), (4, 1), (12, 1), (14, 1), (16, 1)],
  term ((856 : Rat) / 589) [(3, 2), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-428 : Rat) / 589) [(3, 2), (4, 1), (14, 2), (16, 1)],
  term ((-428 : Rat) / 589) [(3, 2), (4, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 321 for generator 27. -/
theorem rs_R009_ueqv_R009NNNNN_partial_27_0321_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_27_0321
        rs_R009_ueqv_R009NNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009NNNNN_partial_27_0321 := by
  native_decide

/-- Coefficient term 322 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNNN_coefficient_27_0322 : Poly :=
[
  term ((24 : Rat) / 589) [(3, 2), (4, 2), (16, 1)]
]

/-- Partial product 322 for generator 27. -/
def rs_R009_ueqv_R009NNNNN_partial_27_0322 : Poly :=
[
  term ((-48 : Rat) / 589) [(0, 1), (3, 2), (4, 2), (12, 1), (16, 1)],
  term ((24 : Rat) / 589) [(0, 2), (3, 2), (4, 2), (16, 1)],
  term ((-48 : Rat) / 589) [(1, 1), (3, 2), (4, 2), (13, 1), (16, 1)],
  term ((24 : Rat) / 589) [(1, 2), (3, 2), (4, 2), (16, 1)],
  term ((48 : Rat) / 589) [(3, 2), (4, 2), (12, 1), (14, 1), (16, 1)],
  term ((48 : Rat) / 589) [(3, 2), (4, 2), (13, 1), (15, 1), (16, 1)],
  term ((-24 : Rat) / 589) [(3, 2), (4, 2), (14, 2), (16, 1)],
  term ((-24 : Rat) / 589) [(3, 2), (4, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 322 for generator 27. -/
theorem rs_R009_ueqv_R009NNNNN_partial_27_0322_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_27_0322
        rs_R009_ueqv_R009NNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009NNNNN_partial_27_0322 := by
  native_decide

/-- Coefficient term 323 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNNN_coefficient_27_0323 : Poly :=
[
  term ((-13152 : Rat) / 589) [(3, 2), (5, 1), (7, 1), (16, 1)]
]

/-- Partial product 323 for generator 27. -/
def rs_R009_ueqv_R009NNNNN_partial_27_0323 : Poly :=
[
  term ((26304 : Rat) / 589) [(0, 1), (3, 2), (5, 1), (7, 1), (12, 1), (16, 1)],
  term ((-13152 : Rat) / 589) [(0, 2), (3, 2), (5, 1), (7, 1), (16, 1)],
  term ((26304 : Rat) / 589) [(1, 1), (3, 2), (5, 1), (7, 1), (13, 1), (16, 1)],
  term ((-13152 : Rat) / 589) [(1, 2), (3, 2), (5, 1), (7, 1), (16, 1)],
  term ((-26304 : Rat) / 589) [(3, 2), (5, 1), (7, 1), (12, 1), (14, 1), (16, 1)],
  term ((-26304 : Rat) / 589) [(3, 2), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((13152 : Rat) / 589) [(3, 2), (5, 1), (7, 1), (14, 2), (16, 1)],
  term ((13152 : Rat) / 589) [(3, 2), (5, 1), (7, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 323 for generator 27. -/
theorem rs_R009_ueqv_R009NNNNN_partial_27_0323_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_27_0323
        rs_R009_ueqv_R009NNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009NNNNN_partial_27_0323 := by
  native_decide

/-- Coefficient term 324 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNNN_coefficient_27_0324 : Poly :=
[
  term ((-4728 : Rat) / 589) [(3, 2), (5, 1), (9, 1), (16, 1)]
]

/-- Partial product 324 for generator 27. -/
def rs_R009_ueqv_R009NNNNN_partial_27_0324 : Poly :=
[
  term ((9456 : Rat) / 589) [(0, 1), (3, 2), (5, 1), (9, 1), (12, 1), (16, 1)],
  term ((-4728 : Rat) / 589) [(0, 2), (3, 2), (5, 1), (9, 1), (16, 1)],
  term ((9456 : Rat) / 589) [(1, 1), (3, 2), (5, 1), (9, 1), (13, 1), (16, 1)],
  term ((-4728 : Rat) / 589) [(1, 2), (3, 2), (5, 1), (9, 1), (16, 1)],
  term ((-9456 : Rat) / 589) [(3, 2), (5, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((-9456 : Rat) / 589) [(3, 2), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((4728 : Rat) / 589) [(3, 2), (5, 1), (9, 1), (14, 2), (16, 1)],
  term ((4728 : Rat) / 589) [(3, 2), (5, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 324 for generator 27. -/
theorem rs_R009_ueqv_R009NNNNN_partial_27_0324_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_27_0324
        rs_R009_ueqv_R009NNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009NNNNN_partial_27_0324 := by
  native_decide

/-- Coefficient term 325 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNNN_coefficient_27_0325 : Poly :=
[
  term ((-8640 : Rat) / 589) [(3, 2), (5, 1), (13, 1), (16, 1)]
]

/-- Partial product 325 for generator 27. -/
def rs_R009_ueqv_R009NNNNN_partial_27_0325 : Poly :=
[
  term ((17280 : Rat) / 589) [(0, 1), (3, 2), (5, 1), (12, 1), (13, 1), (16, 1)],
  term ((-8640 : Rat) / 589) [(0, 2), (3, 2), (5, 1), (13, 1), (16, 1)],
  term ((17280 : Rat) / 589) [(1, 1), (3, 2), (5, 1), (13, 2), (16, 1)],
  term ((-8640 : Rat) / 589) [(1, 2), (3, 2), (5, 1), (13, 1), (16, 1)],
  term ((-17280 : Rat) / 589) [(3, 2), (5, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((8640 : Rat) / 589) [(3, 2), (5, 1), (13, 1), (14, 2), (16, 1)],
  term ((8640 : Rat) / 589) [(3, 2), (5, 1), (13, 1), (15, 2), (16, 1)],
  term ((-17280 : Rat) / 589) [(3, 2), (5, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 325 for generator 27. -/
theorem rs_R009_ueqv_R009NNNNN_partial_27_0325_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_27_0325
        rs_R009_ueqv_R009NNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009NNNNN_partial_27_0325 := by
  native_decide

/-- Coefficient term 326 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNNN_coefficient_27_0326 : Poly :=
[
  term ((13368 : Rat) / 589) [(3, 2), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 326 for generator 27. -/
def rs_R009_ueqv_R009NNNNN_partial_27_0326 : Poly :=
[
  term ((-26736 : Rat) / 589) [(0, 1), (3, 2), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((13368 : Rat) / 589) [(0, 2), (3, 2), (5, 1), (15, 1), (16, 1)],
  term ((-26736 : Rat) / 589) [(1, 1), (3, 2), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((13368 : Rat) / 589) [(1, 2), (3, 2), (5, 1), (15, 1), (16, 1)],
  term ((26736 : Rat) / 589) [(3, 2), (5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((26736 : Rat) / 589) [(3, 2), (5, 1), (13, 1), (15, 2), (16, 1)],
  term ((-13368 : Rat) / 589) [(3, 2), (5, 1), (14, 2), (15, 1), (16, 1)],
  term ((-13368 : Rat) / 589) [(3, 2), (5, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 326 for generator 27. -/
theorem rs_R009_ueqv_R009NNNNN_partial_27_0326_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_27_0326
        rs_R009_ueqv_R009NNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009NNNNN_partial_27_0326 := by
  native_decide

/-- Coefficient term 327 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNNN_coefficient_27_0327 : Poly :=
[
  term ((3456 : Rat) / 589) [(3, 2), (7, 1), (13, 1), (16, 1)]
]

/-- Partial product 327 for generator 27. -/
def rs_R009_ueqv_R009NNNNN_partial_27_0327 : Poly :=
[
  term ((-6912 : Rat) / 589) [(0, 1), (3, 2), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((3456 : Rat) / 589) [(0, 2), (3, 2), (7, 1), (13, 1), (16, 1)],
  term ((-6912 : Rat) / 589) [(1, 1), (3, 2), (7, 1), (13, 2), (16, 1)],
  term ((3456 : Rat) / 589) [(1, 2), (3, 2), (7, 1), (13, 1), (16, 1)],
  term ((6912 : Rat) / 589) [(3, 2), (7, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-3456 : Rat) / 589) [(3, 2), (7, 1), (13, 1), (14, 2), (16, 1)],
  term ((-3456 : Rat) / 589) [(3, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((6912 : Rat) / 589) [(3, 2), (7, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 327 for generator 27. -/
theorem rs_R009_ueqv_R009NNNNN_partial_27_0327_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_27_0327
        rs_R009_ueqv_R009NNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009NNNNN_partial_27_0327 := by
  native_decide

/-- Coefficient term 328 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNNN_coefficient_27_0328 : Poly :=
[
  term ((4320 : Rat) / 589) [(3, 2), (8, 1), (14, 1), (16, 1)]
]

/-- Partial product 328 for generator 27. -/
def rs_R009_ueqv_R009NNNNN_partial_27_0328 : Poly :=
[
  term ((-8640 : Rat) / 589) [(0, 1), (3, 2), (8, 1), (12, 1), (14, 1), (16, 1)],
  term ((4320 : Rat) / 589) [(0, 2), (3, 2), (8, 1), (14, 1), (16, 1)],
  term ((-8640 : Rat) / 589) [(1, 1), (3, 2), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((4320 : Rat) / 589) [(1, 2), (3, 2), (8, 1), (14, 1), (16, 1)],
  term ((8640 : Rat) / 589) [(3, 2), (8, 1), (12, 1), (14, 2), (16, 1)],
  term ((8640 : Rat) / 589) [(3, 2), (8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4320 : Rat) / 589) [(3, 2), (8, 1), (14, 1), (15, 2), (16, 1)],
  term ((-4320 : Rat) / 589) [(3, 2), (8, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 328 for generator 27. -/
theorem rs_R009_ueqv_R009NNNNN_partial_27_0328_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_27_0328
        rs_R009_ueqv_R009NNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009NNNNN_partial_27_0328 := by
  native_decide

/-- Coefficient term 329 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNNN_coefficient_27_0329 : Poly :=
[
  term ((2160 : Rat) / 589) [(3, 2), (8, 1), (16, 1)]
]

/-- Partial product 329 for generator 27. -/
def rs_R009_ueqv_R009NNNNN_partial_27_0329 : Poly :=
[
  term ((-4320 : Rat) / 589) [(0, 1), (3, 2), (8, 1), (12, 1), (16, 1)],
  term ((2160 : Rat) / 589) [(0, 2), (3, 2), (8, 1), (16, 1)],
  term ((-4320 : Rat) / 589) [(1, 1), (3, 2), (8, 1), (13, 1), (16, 1)],
  term ((2160 : Rat) / 589) [(1, 2), (3, 2), (8, 1), (16, 1)],
  term ((4320 : Rat) / 589) [(3, 2), (8, 1), (12, 1), (14, 1), (16, 1)],
  term ((4320 : Rat) / 589) [(3, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2160 : Rat) / 589) [(3, 2), (8, 1), (14, 2), (16, 1)],
  term ((-2160 : Rat) / 589) [(3, 2), (8, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 329 for generator 27. -/
theorem rs_R009_ueqv_R009NNNNN_partial_27_0329_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_27_0329
        rs_R009_ueqv_R009NNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009NNNNN_partial_27_0329 := by
  native_decide

/-- Coefficient term 330 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNNN_coefficient_27_0330 : Poly :=
[
  term ((-228 : Rat) / 31) [(3, 2), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 330 for generator 27. -/
def rs_R009_ueqv_R009NNNNN_partial_27_0330 : Poly :=
[
  term ((456 : Rat) / 31) [(0, 1), (3, 2), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-228 : Rat) / 31) [(0, 2), (3, 2), (9, 1), (13, 1), (16, 1)],
  term ((456 : Rat) / 31) [(1, 1), (3, 2), (9, 1), (13, 2), (16, 1)],
  term ((-228 : Rat) / 31) [(1, 2), (3, 2), (9, 1), (13, 1), (16, 1)],
  term ((-456 : Rat) / 31) [(3, 2), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((228 : Rat) / 31) [(3, 2), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((228 : Rat) / 31) [(3, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-456 : Rat) / 31) [(3, 2), (9, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 330 for generator 27. -/
theorem rs_R009_ueqv_R009NNNNN_partial_27_0330_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_27_0330
        rs_R009_ueqv_R009NNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009NNNNN_partial_27_0330 := by
  native_decide

/-- Coefficient term 331 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNNN_coefficient_27_0331 : Poly :=
[
  term ((-67874 : Rat) / 1767) [(3, 2), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 331 for generator 27. -/
def rs_R009_ueqv_R009NNNNN_partial_27_0331 : Poly :=
[
  term ((135748 : Rat) / 1767) [(0, 1), (3, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-67874 : Rat) / 1767) [(0, 2), (3, 2), (9, 1), (15, 1), (16, 1)],
  term ((135748 : Rat) / 1767) [(1, 1), (3, 2), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-67874 : Rat) / 1767) [(1, 2), (3, 2), (9, 1), (15, 1), (16, 1)],
  term ((-135748 : Rat) / 1767) [(3, 2), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-135748 : Rat) / 1767) [(3, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((67874 : Rat) / 1767) [(3, 2), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((67874 : Rat) / 1767) [(3, 2), (9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 331 for generator 27. -/
theorem rs_R009_ueqv_R009NNNNN_partial_27_0331_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_27_0331
        rs_R009_ueqv_R009NNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009NNNNN_partial_27_0331 := by
  native_decide

/-- Coefficient term 332 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNNN_coefficient_27_0332 : Poly :=
[
  term ((-3456 : Rat) / 589) [(3, 2), (10, 1), (14, 1), (16, 1)]
]

/-- Partial product 332 for generator 27. -/
def rs_R009_ueqv_R009NNNNN_partial_27_0332 : Poly :=
[
  term ((6912 : Rat) / 589) [(0, 1), (3, 2), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-3456 : Rat) / 589) [(0, 2), (3, 2), (10, 1), (14, 1), (16, 1)],
  term ((6912 : Rat) / 589) [(1, 1), (3, 2), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-3456 : Rat) / 589) [(1, 2), (3, 2), (10, 1), (14, 1), (16, 1)],
  term ((-6912 : Rat) / 589) [(3, 2), (10, 1), (12, 1), (14, 2), (16, 1)],
  term ((-6912 : Rat) / 589) [(3, 2), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((3456 : Rat) / 589) [(3, 2), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((3456 : Rat) / 589) [(3, 2), (10, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 332 for generator 27. -/
theorem rs_R009_ueqv_R009NNNNN_partial_27_0332_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_27_0332
        rs_R009_ueqv_R009NNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009NNNNN_partial_27_0332 := by
  native_decide

/-- Coefficient term 333 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNNN_coefficient_27_0333 : Poly :=
[
  term ((-4800 : Rat) / 589) [(3, 2), (10, 1), (16, 1)]
]

/-- Partial product 333 for generator 27. -/
def rs_R009_ueqv_R009NNNNN_partial_27_0333 : Poly :=
[
  term ((9600 : Rat) / 589) [(0, 1), (3, 2), (10, 1), (12, 1), (16, 1)],
  term ((-4800 : Rat) / 589) [(0, 2), (3, 2), (10, 1), (16, 1)],
  term ((9600 : Rat) / 589) [(1, 1), (3, 2), (10, 1), (13, 1), (16, 1)],
  term ((-4800 : Rat) / 589) [(1, 2), (3, 2), (10, 1), (16, 1)],
  term ((-9600 : Rat) / 589) [(3, 2), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-9600 : Rat) / 589) [(3, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((4800 : Rat) / 589) [(3, 2), (10, 1), (14, 2), (16, 1)],
  term ((4800 : Rat) / 589) [(3, 2), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 333 for generator 27. -/
theorem rs_R009_ueqv_R009NNNNN_partial_27_0333_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_27_0333
        rs_R009_ueqv_R009NNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009NNNNN_partial_27_0333 := by
  native_decide

/-- Coefficient term 334 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNNN_coefficient_27_0334 : Poly :=
[
  term ((4128 : Rat) / 589) [(3, 2), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 334 for generator 27. -/
def rs_R009_ueqv_R009NNNNN_partial_27_0334 : Poly :=
[
  term ((-8256 : Rat) / 589) [(0, 1), (3, 2), (12, 2), (14, 1), (16, 1)],
  term ((4128 : Rat) / 589) [(0, 2), (3, 2), (12, 1), (14, 1), (16, 1)],
  term ((-8256 : Rat) / 589) [(1, 1), (3, 2), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((4128 : Rat) / 589) [(1, 2), (3, 2), (12, 1), (14, 1), (16, 1)],
  term ((8256 : Rat) / 589) [(3, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4128 : Rat) / 589) [(3, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-4128 : Rat) / 589) [(3, 2), (12, 1), (14, 3), (16, 1)],
  term ((8256 : Rat) / 589) [(3, 2), (12, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 334 for generator 27. -/
theorem rs_R009_ueqv_R009NNNNN_partial_27_0334_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_27_0334
        rs_R009_ueqv_R009NNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009NNNNN_partial_27_0334 := by
  native_decide

/-- Coefficient term 335 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNNN_coefficient_27_0335 : Poly :=
[
  term ((3440 : Rat) / 589) [(3, 2), (12, 1), (16, 1)]
]

/-- Partial product 335 for generator 27. -/
def rs_R009_ueqv_R009NNNNN_partial_27_0335 : Poly :=
[
  term ((-6880 : Rat) / 589) [(0, 1), (3, 2), (12, 2), (16, 1)],
  term ((3440 : Rat) / 589) [(0, 2), (3, 2), (12, 1), (16, 1)],
  term ((-6880 : Rat) / 589) [(1, 1), (3, 2), (12, 1), (13, 1), (16, 1)],
  term ((3440 : Rat) / 589) [(1, 2), (3, 2), (12, 1), (16, 1)],
  term ((6880 : Rat) / 589) [(3, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3440 : Rat) / 589) [(3, 2), (12, 1), (14, 2), (16, 1)],
  term ((-3440 : Rat) / 589) [(3, 2), (12, 1), (15, 2), (16, 1)],
  term ((6880 : Rat) / 589) [(3, 2), (12, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 335 for generator 27. -/
theorem rs_R009_ueqv_R009NNNNN_partial_27_0335_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_27_0335
        rs_R009_ueqv_R009NNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009NNNNN_partial_27_0335 := by
  native_decide

/-- Coefficient term 336 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNNN_coefficient_27_0336 : Poly :=
[
  term ((-45728 : Rat) / 1767) [(3, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 336 for generator 27. -/
def rs_R009_ueqv_R009NNNNN_partial_27_0336 : Poly :=
[
  term ((91456 : Rat) / 1767) [(0, 1), (3, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-45728 : Rat) / 1767) [(0, 2), (3, 2), (13, 1), (15, 1), (16, 1)],
  term ((91456 : Rat) / 1767) [(1, 1), (3, 2), (13, 2), (15, 1), (16, 1)],
  term ((-45728 : Rat) / 1767) [(1, 2), (3, 2), (13, 1), (15, 1), (16, 1)],
  term ((-91456 : Rat) / 1767) [(3, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((45728 : Rat) / 1767) [(3, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((45728 : Rat) / 1767) [(3, 2), (13, 1), (15, 3), (16, 1)],
  term ((-91456 : Rat) / 1767) [(3, 2), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 336 for generator 27. -/
theorem rs_R009_ueqv_R009NNNNN_partial_27_0336_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_27_0336
        rs_R009_ueqv_R009NNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009NNNNN_partial_27_0336 := by
  native_decide

/-- Coefficient term 337 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNNN_coefficient_27_0337 : Poly :=
[
  term ((-228 : Rat) / 31) [(3, 2), (13, 2), (16, 1)]
]

/-- Partial product 337 for generator 27. -/
def rs_R009_ueqv_R009NNNNN_partial_27_0337 : Poly :=
[
  term ((456 : Rat) / 31) [(0, 1), (3, 2), (12, 1), (13, 2), (16, 1)],
  term ((-228 : Rat) / 31) [(0, 2), (3, 2), (13, 2), (16, 1)],
  term ((456 : Rat) / 31) [(1, 1), (3, 2), (13, 3), (16, 1)],
  term ((-228 : Rat) / 31) [(1, 2), (3, 2), (13, 2), (16, 1)],
  term ((-456 : Rat) / 31) [(3, 2), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((228 : Rat) / 31) [(3, 2), (13, 2), (14, 2), (16, 1)],
  term ((228 : Rat) / 31) [(3, 2), (13, 2), (15, 2), (16, 1)],
  term ((-456 : Rat) / 31) [(3, 2), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 337 for generator 27. -/
theorem rs_R009_ueqv_R009NNNNN_partial_27_0337_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_27_0337
        rs_R009_ueqv_R009NNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009NNNNN_partial_27_0337 := by
  native_decide

/-- Coefficient term 338 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNNN_coefficient_27_0338 : Poly :=
[
  term ((4532 : Rat) / 589) [(3, 2), (14, 1), (16, 1)]
]

/-- Partial product 338 for generator 27. -/
def rs_R009_ueqv_R009NNNNN_partial_27_0338 : Poly :=
[
  term ((-9064 : Rat) / 589) [(0, 1), (3, 2), (12, 1), (14, 1), (16, 1)],
  term ((4532 : Rat) / 589) [(0, 2), (3, 2), (14, 1), (16, 1)],
  term ((-9064 : Rat) / 589) [(1, 1), (3, 2), (13, 1), (14, 1), (16, 1)],
  term ((4532 : Rat) / 589) [(1, 2), (3, 2), (14, 1), (16, 1)],
  term ((9064 : Rat) / 589) [(3, 2), (12, 1), (14, 2), (16, 1)],
  term ((9064 : Rat) / 589) [(3, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4532 : Rat) / 589) [(3, 2), (14, 1), (15, 2), (16, 1)],
  term ((-4532 : Rat) / 589) [(3, 2), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 338 for generator 27. -/
theorem rs_R009_ueqv_R009NNNNN_partial_27_0338_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_27_0338
        rs_R009_ueqv_R009NNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009NNNNN_partial_27_0338 := by
  native_decide

/-- Coefficient term 339 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNNN_coefficient_27_0339 : Poly :=
[
  term ((-132 : Rat) / 589) [(3, 2), (14, 2), (16, 1)]
]

/-- Partial product 339 for generator 27. -/
def rs_R009_ueqv_R009NNNNN_partial_27_0339 : Poly :=
[
  term ((264 : Rat) / 589) [(0, 1), (3, 2), (12, 1), (14, 2), (16, 1)],
  term ((-132 : Rat) / 589) [(0, 2), (3, 2), (14, 2), (16, 1)],
  term ((264 : Rat) / 589) [(1, 1), (3, 2), (13, 1), (14, 2), (16, 1)],
  term ((-132 : Rat) / 589) [(1, 2), (3, 2), (14, 2), (16, 1)],
  term ((-264 : Rat) / 589) [(3, 2), (12, 1), (14, 3), (16, 1)],
  term ((-264 : Rat) / 589) [(3, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((132 : Rat) / 589) [(3, 2), (14, 2), (15, 2), (16, 1)],
  term ((132 : Rat) / 589) [(3, 2), (14, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 339 for generator 27. -/
theorem rs_R009_ueqv_R009NNNNN_partial_27_0339_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_27_0339
        rs_R009_ueqv_R009NNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009NNNNN_partial_27_0339 := by
  native_decide

/-- Coefficient term 340 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNNN_coefficient_27_0340 : Poly :=
[
  term ((4188 : Rat) / 589) [(3, 2), (15, 2), (16, 1)]
]

/-- Partial product 340 for generator 27. -/
def rs_R009_ueqv_R009NNNNN_partial_27_0340 : Poly :=
[
  term ((-8376 : Rat) / 589) [(0, 1), (3, 2), (12, 1), (15, 2), (16, 1)],
  term ((4188 : Rat) / 589) [(0, 2), (3, 2), (15, 2), (16, 1)],
  term ((-8376 : Rat) / 589) [(1, 1), (3, 2), (13, 1), (15, 2), (16, 1)],
  term ((4188 : Rat) / 589) [(1, 2), (3, 2), (15, 2), (16, 1)],
  term ((8376 : Rat) / 589) [(3, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((8376 : Rat) / 589) [(3, 2), (13, 1), (15, 3), (16, 1)],
  term ((-4188 : Rat) / 589) [(3, 2), (14, 2), (15, 2), (16, 1)],
  term ((-4188 : Rat) / 589) [(3, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 340 for generator 27. -/
theorem rs_R009_ueqv_R009NNNNN_partial_27_0340_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_27_0340
        rs_R009_ueqv_R009NNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009NNNNN_partial_27_0340 := by
  native_decide

/-- Coefficient term 341 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNNN_coefficient_27_0341 : Poly :=
[
  term ((-9528 : Rat) / 589) [(3, 2), (16, 1)]
]

/-- Partial product 341 for generator 27. -/
def rs_R009_ueqv_R009NNNNN_partial_27_0341 : Poly :=
[
  term ((19056 : Rat) / 589) [(0, 1), (3, 2), (12, 1), (16, 1)],
  term ((-9528 : Rat) / 589) [(0, 2), (3, 2), (16, 1)],
  term ((19056 : Rat) / 589) [(1, 1), (3, 2), (13, 1), (16, 1)],
  term ((-9528 : Rat) / 589) [(1, 2), (3, 2), (16, 1)],
  term ((-19056 : Rat) / 589) [(3, 2), (12, 1), (14, 1), (16, 1)],
  term ((-19056 : Rat) / 589) [(3, 2), (13, 1), (15, 1), (16, 1)],
  term ((9528 : Rat) / 589) [(3, 2), (14, 2), (16, 1)],
  term ((9528 : Rat) / 589) [(3, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 341 for generator 27. -/
theorem rs_R009_ueqv_R009NNNNN_partial_27_0341_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_27_0341
        rs_R009_ueqv_R009NNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009NNNNN_partial_27_0341 := by
  native_decide

/-- Coefficient term 342 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNNN_coefficient_27_0342 : Poly :=
[
  term ((-4728 : Rat) / 589) [(3, 3), (9, 1), (16, 1)]
]

/-- Partial product 342 for generator 27. -/
def rs_R009_ueqv_R009NNNNN_partial_27_0342 : Poly :=
[
  term ((9456 : Rat) / 589) [(0, 1), (3, 3), (9, 1), (12, 1), (16, 1)],
  term ((-4728 : Rat) / 589) [(0, 2), (3, 3), (9, 1), (16, 1)],
  term ((9456 : Rat) / 589) [(1, 1), (3, 3), (9, 1), (13, 1), (16, 1)],
  term ((-4728 : Rat) / 589) [(1, 2), (3, 3), (9, 1), (16, 1)],
  term ((-9456 : Rat) / 589) [(3, 3), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((-9456 : Rat) / 589) [(3, 3), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((4728 : Rat) / 589) [(3, 3), (9, 1), (14, 2), (16, 1)],
  term ((4728 : Rat) / 589) [(3, 3), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 342 for generator 27. -/
theorem rs_R009_ueqv_R009NNNNN_partial_27_0342_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_27_0342
        rs_R009_ueqv_R009NNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009NNNNN_partial_27_0342 := by
  native_decide

/-- Coefficient term 343 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNNN_coefficient_27_0343 : Poly :=
[
  term ((-10368 : Rat) / 589) [(3, 3), (13, 1), (16, 1)]
]

/-- Partial product 343 for generator 27. -/
def rs_R009_ueqv_R009NNNNN_partial_27_0343 : Poly :=
[
  term ((20736 : Rat) / 589) [(0, 1), (3, 3), (12, 1), (13, 1), (16, 1)],
  term ((-10368 : Rat) / 589) [(0, 2), (3, 3), (13, 1), (16, 1)],
  term ((20736 : Rat) / 589) [(1, 1), (3, 3), (13, 2), (16, 1)],
  term ((-10368 : Rat) / 589) [(1, 2), (3, 3), (13, 1), (16, 1)],
  term ((-20736 : Rat) / 589) [(3, 3), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((10368 : Rat) / 589) [(3, 3), (13, 1), (14, 2), (16, 1)],
  term ((10368 : Rat) / 589) [(3, 3), (13, 1), (15, 2), (16, 1)],
  term ((-20736 : Rat) / 589) [(3, 3), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 343 for generator 27. -/
theorem rs_R009_ueqv_R009NNNNN_partial_27_0343_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_27_0343
        rs_R009_ueqv_R009NNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009NNNNN_partial_27_0343 := by
  native_decide

/-- Coefficient term 344 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNNN_coefficient_27_0344 : Poly :=
[
  term ((399 : Rat) / 31) [(4, 1), (5, 1), (13, 1), (16, 1)]
]

/-- Partial product 344 for generator 27. -/
def rs_R009_ueqv_R009NNNNN_partial_27_0344 : Poly :=
[
  term ((-798 : Rat) / 31) [(0, 1), (4, 1), (5, 1), (12, 1), (13, 1), (16, 1)],
  term ((399 : Rat) / 31) [(0, 2), (4, 1), (5, 1), (13, 1), (16, 1)],
  term ((-798 : Rat) / 31) [(1, 1), (4, 1), (5, 1), (13, 2), (16, 1)],
  term ((399 : Rat) / 31) [(1, 2), (4, 1), (5, 1), (13, 1), (16, 1)],
  term ((798 : Rat) / 31) [(4, 1), (5, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-399 : Rat) / 31) [(4, 1), (5, 1), (13, 1), (14, 2), (16, 1)],
  term ((-399 : Rat) / 31) [(4, 1), (5, 1), (13, 1), (15, 2), (16, 1)],
  term ((798 : Rat) / 31) [(4, 1), (5, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 344 for generator 27. -/
theorem rs_R009_ueqv_R009NNNNN_partial_27_0344_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_27_0344
        rs_R009_ueqv_R009NNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009NNNNN_partial_27_0344 := by
  native_decide

/-- Coefficient term 345 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNNN_coefficient_27_0345 : Poly :=
[
  term ((-3948 : Rat) / 589) [(4, 1), (5, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 345 for generator 27. -/
def rs_R009_ueqv_R009NNNNN_partial_27_0345 : Poly :=
[
  term ((7896 : Rat) / 589) [(0, 1), (4, 1), (5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3948 : Rat) / 589) [(0, 2), (4, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((7896 : Rat) / 589) [(1, 1), (4, 1), (5, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3948 : Rat) / 589) [(1, 2), (4, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-7896 : Rat) / 589) [(4, 1), (5, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-7896 : Rat) / 589) [(4, 1), (5, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((3948 : Rat) / 589) [(4, 1), (5, 1), (14, 1), (15, 3), (16, 1)],
  term ((3948 : Rat) / 589) [(4, 1), (5, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 345 for generator 27. -/
theorem rs_R009_ueqv_R009NNNNN_partial_27_0345_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_27_0345
        rs_R009_ueqv_R009NNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009NNNNN_partial_27_0345 := by
  native_decide

/-- Coefficient term 346 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNNN_coefficient_27_0346 : Poly :=
[
  term ((99817 : Rat) / 3534) [(4, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 346 for generator 27. -/
def rs_R009_ueqv_R009NNNNN_partial_27_0346 : Poly :=
[
  term ((-99817 : Rat) / 1767) [(0, 1), (4, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((99817 : Rat) / 3534) [(0, 2), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((-99817 : Rat) / 1767) [(1, 1), (4, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((99817 : Rat) / 3534) [(1, 2), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((99817 : Rat) / 1767) [(4, 1), (5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((99817 : Rat) / 1767) [(4, 1), (5, 1), (13, 1), (15, 2), (16, 1)],
  term ((-99817 : Rat) / 3534) [(4, 1), (5, 1), (14, 2), (15, 1), (16, 1)],
  term ((-99817 : Rat) / 3534) [(4, 1), (5, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 346 for generator 27. -/
theorem rs_R009_ueqv_R009NNNNN_partial_27_0346_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_27_0346
        rs_R009_ueqv_R009NNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009NNNNN_partial_27_0346 := by
  native_decide

/-- Coefficient term 347 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNNN_coefficient_27_0347 : Poly :=
[
  term ((228 : Rat) / 31) [(4, 1), (7, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 347 for generator 27. -/
def rs_R009_ueqv_R009NNNNN_partial_27_0347 : Poly :=
[
  term ((-456 : Rat) / 31) [(0, 1), (4, 1), (7, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((228 : Rat) / 31) [(0, 2), (4, 1), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((-456 : Rat) / 31) [(1, 1), (4, 1), (7, 1), (10, 1), (13, 2), (16, 1)],
  term ((228 : Rat) / 31) [(1, 2), (4, 1), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((456 : Rat) / 31) [(4, 1), (7, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-228 : Rat) / 31) [(4, 1), (7, 1), (10, 1), (13, 1), (14, 2), (16, 1)],
  term ((-228 : Rat) / 31) [(4, 1), (7, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((456 : Rat) / 31) [(4, 1), (7, 1), (10, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 347 for generator 27. -/
theorem rs_R009_ueqv_R009NNNNN_partial_27_0347_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_27_0347
        rs_R009_ueqv_R009NNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009NNNNN_partial_27_0347 := by
  native_decide

/-- Coefficient term 348 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNNN_coefficient_27_0348 : Poly :=
[
  term ((56870 : Rat) / 1767) [(4, 1), (7, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 348 for generator 27. -/
def rs_R009_ueqv_R009NNNNN_partial_27_0348 : Poly :=
[
  term ((-113740 : Rat) / 1767) [(0, 1), (4, 1), (7, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((56870 : Rat) / 1767) [(0, 2), (4, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-113740 : Rat) / 1767) [(1, 1), (4, 1), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((56870 : Rat) / 1767) [(1, 2), (4, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((113740 : Rat) / 1767) [(4, 1), (7, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((113740 : Rat) / 1767) [(4, 1), (7, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-56870 : Rat) / 1767) [(4, 1), (7, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((-56870 : Rat) / 1767) [(4, 1), (7, 1), (10, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 348 for generator 27. -/
theorem rs_R009_ueqv_R009NNNNN_partial_27_0348_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_27_0348
        rs_R009_ueqv_R009NNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009NNNNN_partial_27_0348 := by
  native_decide

/-- Coefficient term 349 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNNN_coefficient_27_0349 : Poly :=
[
  term ((-2632 : Rat) / 589) [(4, 1), (7, 1), (11, 1), (16, 1)]
]

/-- Partial product 349 for generator 27. -/
def rs_R009_ueqv_R009NNNNN_partial_27_0349 : Poly :=
[
  term ((5264 : Rat) / 589) [(0, 1), (4, 1), (7, 1), (11, 1), (12, 1), (16, 1)],
  term ((-2632 : Rat) / 589) [(0, 2), (4, 1), (7, 1), (11, 1), (16, 1)],
  term ((5264 : Rat) / 589) [(1, 1), (4, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((-2632 : Rat) / 589) [(1, 2), (4, 1), (7, 1), (11, 1), (16, 1)],
  term ((-5264 : Rat) / 589) [(4, 1), (7, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-5264 : Rat) / 589) [(4, 1), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((2632 : Rat) / 589) [(4, 1), (7, 1), (11, 1), (14, 2), (16, 1)],
  term ((2632 : Rat) / 589) [(4, 1), (7, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 349 for generator 27. -/
theorem rs_R009_ueqv_R009NNNNN_partial_27_0349_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_27_0349
        rs_R009_ueqv_R009NNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009NNNNN_partial_27_0349 := by
  native_decide

/-- Coefficient term 350 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNNN_coefficient_27_0350 : Poly :=
[
  term ((342 : Rat) / 31) [(4, 1), (7, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 350 for generator 27. -/
def rs_R009_ueqv_R009NNNNN_partial_27_0350 : Poly :=
[
  term ((-684 : Rat) / 31) [(0, 1), (4, 1), (7, 1), (12, 2), (13, 1), (16, 1)],
  term ((342 : Rat) / 31) [(0, 2), (4, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((-684 : Rat) / 31) [(1, 1), (4, 1), (7, 1), (12, 1), (13, 2), (16, 1)],
  term ((342 : Rat) / 31) [(1, 2), (4, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((-342 : Rat) / 31) [(4, 1), (7, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((-342 : Rat) / 31) [(4, 1), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((684 : Rat) / 31) [(4, 1), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((684 : Rat) / 31) [(4, 1), (7, 1), (12, 2), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 350 for generator 27. -/
theorem rs_R009_ueqv_R009NNNNN_partial_27_0350_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_27_0350
        rs_R009_ueqv_R009NNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009NNNNN_partial_27_0350 := by
  native_decide

/-- Coefficient term 351 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNNN_coefficient_27_0351 : Poly :=
[
  term ((18199 : Rat) / 589) [(4, 1), (7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 351 for generator 27. -/
def rs_R009_ueqv_R009NNNNN_partial_27_0351 : Poly :=
[
  term ((-36398 : Rat) / 589) [(0, 1), (4, 1), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((18199 : Rat) / 589) [(0, 2), (4, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-36398 : Rat) / 589) [(1, 1), (4, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((18199 : Rat) / 589) [(1, 2), (4, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((36398 : Rat) / 589) [(4, 1), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-18199 : Rat) / 589) [(4, 1), (7, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-18199 : Rat) / 589) [(4, 1), (7, 1), (12, 1), (15, 3), (16, 1)],
  term ((36398 : Rat) / 589) [(4, 1), (7, 1), (12, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 351 for generator 27. -/
theorem rs_R009_ueqv_R009NNNNN_partial_27_0351_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_27_0351
        rs_R009_ueqv_R009NNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009NNNNN_partial_27_0351 := by
  native_decide

/-- Coefficient term 352 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNNN_coefficient_27_0352 : Poly :=
[
  term ((5263 : Rat) / 62) [(4, 1), (7, 1), (13, 1), (16, 1)]
]

/-- Partial product 352 for generator 27. -/
def rs_R009_ueqv_R009NNNNN_partial_27_0352 : Poly :=
[
  term ((-5263 : Rat) / 31) [(0, 1), (4, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((5263 : Rat) / 62) [(0, 2), (4, 1), (7, 1), (13, 1), (16, 1)],
  term ((-5263 : Rat) / 31) [(1, 1), (4, 1), (7, 1), (13, 2), (16, 1)],
  term ((5263 : Rat) / 62) [(1, 2), (4, 1), (7, 1), (13, 1), (16, 1)],
  term ((5263 : Rat) / 31) [(4, 1), (7, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-5263 : Rat) / 62) [(4, 1), (7, 1), (13, 1), (14, 2), (16, 1)],
  term ((-5263 : Rat) / 62) [(4, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((5263 : Rat) / 31) [(4, 1), (7, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 352 for generator 27. -/
theorem rs_R009_ueqv_R009NNNNN_partial_27_0352_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_27_0352
        rs_R009_ueqv_R009NNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009NNNNN_partial_27_0352 := by
  native_decide

/-- Coefficient term 353 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNNN_coefficient_27_0353 : Poly :=
[
  term ((3090121 : Rat) / 7068) [(4, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 353 for generator 27. -/
def rs_R009_ueqv_R009NNNNN_partial_27_0353 : Poly :=
[
  term ((-3090121 : Rat) / 3534) [(0, 1), (4, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((3090121 : Rat) / 7068) [(0, 2), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((-3090121 : Rat) / 3534) [(1, 1), (4, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((3090121 : Rat) / 7068) [(1, 2), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((3090121 : Rat) / 3534) [(4, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((3090121 : Rat) / 3534) [(4, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-3090121 : Rat) / 7068) [(4, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((-3090121 : Rat) / 7068) [(4, 1), (7, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 353 for generator 27. -/
theorem rs_R009_ueqv_R009NNNNN_partial_27_0353_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_27_0353
        rs_R009_ueqv_R009NNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009NNNNN_partial_27_0353 := by
  native_decide

/-- Coefficient term 354 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNNN_coefficient_27_0354 : Poly :=
[
  term ((-228 : Rat) / 31) [(4, 1), (9, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 354 for generator 27. -/
def rs_R009_ueqv_R009NNNNN_partial_27_0354 : Poly :=
[
  term ((456 : Rat) / 31) [(0, 1), (4, 1), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-228 : Rat) / 31) [(0, 2), (4, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((456 : Rat) / 31) [(1, 1), (4, 1), (9, 1), (13, 2), (14, 1), (16, 1)],
  term ((-228 : Rat) / 31) [(1, 2), (4, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-456 : Rat) / 31) [(4, 1), (9, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((228 : Rat) / 31) [(4, 1), (9, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((228 : Rat) / 31) [(4, 1), (9, 1), (13, 1), (14, 3), (16, 1)],
  term ((-456 : Rat) / 31) [(4, 1), (9, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 354 for generator 27. -/
theorem rs_R009_ueqv_R009NNNNN_partial_27_0354_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_27_0354
        rs_R009_ueqv_R009NNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009NNNNN_partial_27_0354 := by
  native_decide

/-- Coefficient term 355 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNNN_coefficient_27_0355 : Poly :=
[
  term ((456 : Rat) / 31) [(4, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 355 for generator 27. -/
def rs_R009_ueqv_R009NNNNN_partial_27_0355 : Poly :=
[
  term ((-912 : Rat) / 31) [(0, 1), (4, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((456 : Rat) / 31) [(0, 2), (4, 1), (9, 1), (13, 1), (16, 1)],
  term ((-912 : Rat) / 31) [(1, 1), (4, 1), (9, 1), (13, 2), (16, 1)],
  term ((456 : Rat) / 31) [(1, 2), (4, 1), (9, 1), (13, 1), (16, 1)],
  term ((912 : Rat) / 31) [(4, 1), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-456 : Rat) / 31) [(4, 1), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((-456 : Rat) / 31) [(4, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((912 : Rat) / 31) [(4, 1), (9, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 355 for generator 27. -/
theorem rs_R009_ueqv_R009NNNNN_partial_27_0355_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_27_0355
        rs_R009_ueqv_R009NNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009NNNNN_partial_27_0355 := by
  native_decide

/-- Coefficient term 356 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNNN_coefficient_27_0356 : Poly :=
[
  term ((-82058 : Rat) / 1767) [(4, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 356 for generator 27. -/
def rs_R009_ueqv_R009NNNNN_partial_27_0356 : Poly :=
[
  term ((164116 : Rat) / 1767) [(0, 1), (4, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-82058 : Rat) / 1767) [(0, 2), (4, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((164116 : Rat) / 1767) [(1, 1), (4, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-82058 : Rat) / 1767) [(1, 2), (4, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-164116 : Rat) / 1767) [(4, 1), (9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-164116 : Rat) / 1767) [(4, 1), (9, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((82058 : Rat) / 1767) [(4, 1), (9, 1), (14, 1), (15, 3), (16, 1)],
  term ((82058 : Rat) / 1767) [(4, 1), (9, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 356 for generator 27. -/
theorem rs_R009_ueqv_R009NNNNN_partial_27_0356_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_27_0356
        rs_R009_ueqv_R009NNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009NNNNN_partial_27_0356 := by
  native_decide

/-- Coefficient term 357 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNNN_coefficient_27_0357 : Poly :=
[
  term ((164116 : Rat) / 1767) [(4, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 357 for generator 27. -/
def rs_R009_ueqv_R009NNNNN_partial_27_0357 : Poly :=
[
  term ((-328232 : Rat) / 1767) [(0, 1), (4, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((164116 : Rat) / 1767) [(0, 2), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((-328232 : Rat) / 1767) [(1, 1), (4, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((164116 : Rat) / 1767) [(1, 2), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((328232 : Rat) / 1767) [(4, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((328232 : Rat) / 1767) [(4, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-164116 : Rat) / 1767) [(4, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-164116 : Rat) / 1767) [(4, 1), (9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 357 for generator 27. -/
theorem rs_R009_ueqv_R009NNNNN_partial_27_0357_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_27_0357
        rs_R009_ueqv_R009NNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009NNNNN_partial_27_0357 := by
  native_decide

/-- Coefficient term 358 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNNN_coefficient_27_0358 : Poly :=
[
  term ((-181016 : Rat) / 1767) [(4, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 358 for generator 27. -/
def rs_R009_ueqv_R009NNNNN_partial_27_0358 : Poly :=
[
  term ((362032 : Rat) / 1767) [(0, 1), (4, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-181016 : Rat) / 1767) [(0, 2), (4, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((362032 : Rat) / 1767) [(1, 1), (4, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-181016 : Rat) / 1767) [(1, 2), (4, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-362032 : Rat) / 1767) [(4, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((181016 : Rat) / 1767) [(4, 1), (10, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((181016 : Rat) / 1767) [(4, 1), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((-362032 : Rat) / 1767) [(4, 1), (10, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 358 for generator 27. -/
theorem rs_R009_ueqv_R009NNNNN_partial_27_0358_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_27_0358
        rs_R009_ueqv_R009NNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009NNNNN_partial_27_0358 := by
  native_decide

/-- Coefficient term 359 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNNN_coefficient_27_0359 : Poly :=
[
  term ((-912 : Rat) / 31) [(4, 1), (10, 1), (13, 2), (16, 1)]
]

/-- Partial product 359 for generator 27. -/
def rs_R009_ueqv_R009NNNNN_partial_27_0359 : Poly :=
[
  term ((1824 : Rat) / 31) [(0, 1), (4, 1), (10, 1), (12, 1), (13, 2), (16, 1)],
  term ((-912 : Rat) / 31) [(0, 2), (4, 1), (10, 1), (13, 2), (16, 1)],
  term ((1824 : Rat) / 31) [(1, 1), (4, 1), (10, 1), (13, 3), (16, 1)],
  term ((-912 : Rat) / 31) [(1, 2), (4, 1), (10, 1), (13, 2), (16, 1)],
  term ((-1824 : Rat) / 31) [(4, 1), (10, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((912 : Rat) / 31) [(4, 1), (10, 1), (13, 2), (14, 2), (16, 1)],
  term ((912 : Rat) / 31) [(4, 1), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((-1824 : Rat) / 31) [(4, 1), (10, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 359 for generator 27. -/
theorem rs_R009_ueqv_R009NNNNN_partial_27_0359_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_27_0359
        rs_R009_ueqv_R009NNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009NNNNN_partial_27_0359 := by
  native_decide

/-- Coefficient term 360 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNNN_coefficient_27_0360 : Poly :=
[
  term ((103504 : Rat) / 1767) [(4, 1), (10, 1), (15, 2), (16, 1)]
]

/-- Partial product 360 for generator 27. -/
def rs_R009_ueqv_R009NNNNN_partial_27_0360 : Poly :=
[
  term ((-207008 : Rat) / 1767) [(0, 1), (4, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((103504 : Rat) / 1767) [(0, 2), (4, 1), (10, 1), (15, 2), (16, 1)],
  term ((-207008 : Rat) / 1767) [(1, 1), (4, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((103504 : Rat) / 1767) [(1, 2), (4, 1), (10, 1), (15, 2), (16, 1)],
  term ((207008 : Rat) / 1767) [(4, 1), (10, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((207008 : Rat) / 1767) [(4, 1), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((-103504 : Rat) / 1767) [(4, 1), (10, 1), (14, 2), (15, 2), (16, 1)],
  term ((-103504 : Rat) / 1767) [(4, 1), (10, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 360 for generator 27. -/
theorem rs_R009_ueqv_R009NNNNN_partial_27_0360_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_27_0360
        rs_R009_ueqv_R009NNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009NNNNN_partial_27_0360 := by
  native_decide

/-- Coefficient term 361 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNNN_coefficient_27_0361 : Poly :=
[
  term ((6708 : Rat) / 589) [(4, 1), (10, 1), (16, 1)]
]

/-- Partial product 361 for generator 27. -/
def rs_R009_ueqv_R009NNNNN_partial_27_0361 : Poly :=
[
  term ((-13416 : Rat) / 589) [(0, 1), (4, 1), (10, 1), (12, 1), (16, 1)],
  term ((6708 : Rat) / 589) [(0, 2), (4, 1), (10, 1), (16, 1)],
  term ((-13416 : Rat) / 589) [(1, 1), (4, 1), (10, 1), (13, 1), (16, 1)],
  term ((6708 : Rat) / 589) [(1, 2), (4, 1), (10, 1), (16, 1)],
  term ((13416 : Rat) / 589) [(4, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((13416 : Rat) / 589) [(4, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-6708 : Rat) / 589) [(4, 1), (10, 1), (14, 2), (16, 1)],
  term ((-6708 : Rat) / 589) [(4, 1), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 361 for generator 27. -/
theorem rs_R009_ueqv_R009NNNNN_partial_27_0361_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_27_0361
        rs_R009_ueqv_R009NNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009NNNNN_partial_27_0361 := by
  native_decide

/-- Coefficient term 362 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNNN_coefficient_27_0362 : Poly :=
[
  term ((6824 : Rat) / 589) [(4, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 362 for generator 27. -/
def rs_R009_ueqv_R009NNNNN_partial_27_0362 : Poly :=
[
  term ((-13648 : Rat) / 589) [(0, 1), (4, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((6824 : Rat) / 589) [(0, 2), (4, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-13648 : Rat) / 589) [(1, 1), (4, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((6824 : Rat) / 589) [(1, 2), (4, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((13648 : Rat) / 589) [(4, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-6824 : Rat) / 589) [(4, 1), (11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-6824 : Rat) / 589) [(4, 1), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((13648 : Rat) / 589) [(4, 1), (11, 1), (12, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 362 for generator 27. -/
theorem rs_R009_ueqv_R009NNNNN_partial_27_0362_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_27_0362
        rs_R009_ueqv_R009NNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009NNNNN_partial_27_0362 := by
  native_decide

/-- Coefficient term 363 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNNN_coefficient_27_0363 : Poly :=
[
  term ((-18713 : Rat) / 1178) [(4, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 363 for generator 27. -/
def rs_R009_ueqv_R009NNNNN_partial_27_0363 : Poly :=
[
  term ((18713 : Rat) / 589) [(0, 1), (4, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-18713 : Rat) / 1178) [(0, 2), (4, 1), (11, 1), (13, 1), (16, 1)],
  term ((18713 : Rat) / 589) [(1, 1), (4, 1), (11, 1), (13, 2), (16, 1)],
  term ((-18713 : Rat) / 1178) [(1, 2), (4, 1), (11, 1), (13, 1), (16, 1)],
  term ((-18713 : Rat) / 589) [(4, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((18713 : Rat) / 1178) [(4, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((18713 : Rat) / 1178) [(4, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-18713 : Rat) / 589) [(4, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 363 for generator 27. -/
theorem rs_R009_ueqv_R009NNNNN_partial_27_0363_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_27_0363
        rs_R009_ueqv_R009NNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009NNNNN_partial_27_0363 := by
  native_decide

/-- Coefficient term 364 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNNN_coefficient_27_0364 : Poly :=
[
  term ((57047 : Rat) / 7068) [(4, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 364 for generator 27. -/
def rs_R009_ueqv_R009NNNNN_partial_27_0364 : Poly :=
[
  term ((-57047 : Rat) / 3534) [(0, 1), (4, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((57047 : Rat) / 7068) [(0, 2), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((-57047 : Rat) / 3534) [(1, 1), (4, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((57047 : Rat) / 7068) [(1, 2), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((57047 : Rat) / 3534) [(4, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((57047 : Rat) / 3534) [(4, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-57047 : Rat) / 7068) [(4, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-57047 : Rat) / 7068) [(4, 1), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 364 for generator 27. -/
theorem rs_R009_ueqv_R009NNNNN_partial_27_0364_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_27_0364
        rs_R009_ueqv_R009NNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009NNNNN_partial_27_0364 := by
  native_decide

/-- Coefficient term 365 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNNN_coefficient_27_0365 : Poly :=
[
  term ((-5264 : Rat) / 589) [(4, 1), (11, 2), (16, 1)]
]

/-- Partial product 365 for generator 27. -/
def rs_R009_ueqv_R009NNNNN_partial_27_0365 : Poly :=
[
  term ((10528 : Rat) / 589) [(0, 1), (4, 1), (11, 2), (12, 1), (16, 1)],
  term ((-5264 : Rat) / 589) [(0, 2), (4, 1), (11, 2), (16, 1)],
  term ((10528 : Rat) / 589) [(1, 1), (4, 1), (11, 2), (13, 1), (16, 1)],
  term ((-5264 : Rat) / 589) [(1, 2), (4, 1), (11, 2), (16, 1)],
  term ((-10528 : Rat) / 589) [(4, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((-10528 : Rat) / 589) [(4, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((5264 : Rat) / 589) [(4, 1), (11, 2), (14, 2), (16, 1)],
  term ((5264 : Rat) / 589) [(4, 1), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 365 for generator 27. -/
theorem rs_R009_ueqv_R009NNNNN_partial_27_0365_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_27_0365
        rs_R009_ueqv_R009NNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009NNNNN_partial_27_0365 := by
  native_decide

/-- Coefficient term 366 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNNN_coefficient_27_0366 : Poly :=
[
  term ((-190444 : Rat) / 1767) [(4, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 366 for generator 27. -/
def rs_R009_ueqv_R009NNNNN_partial_27_0366 : Poly :=
[
  term ((380888 : Rat) / 1767) [(0, 1), (4, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-190444 : Rat) / 1767) [(0, 2), (4, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((380888 : Rat) / 1767) [(1, 1), (4, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-190444 : Rat) / 1767) [(1, 2), (4, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((190444 : Rat) / 1767) [(4, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((190444 : Rat) / 1767) [(4, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-380888 : Rat) / 1767) [(4, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-380888 : Rat) / 1767) [(4, 1), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 366 for generator 27. -/
theorem rs_R009_ueqv_R009NNNNN_partial_27_0366_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_27_0366
        rs_R009_ueqv_R009NNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009NNNNN_partial_27_0366 := by
  native_decide

/-- Coefficient term 367 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNNN_coefficient_27_0367 : Poly :=
[
  term ((-1140 : Rat) / 31) [(4, 1), (12, 1), (13, 2), (16, 1)]
]

/-- Partial product 367 for generator 27. -/
def rs_R009_ueqv_R009NNNNN_partial_27_0367 : Poly :=
[
  term ((2280 : Rat) / 31) [(0, 1), (4, 1), (12, 2), (13, 2), (16, 1)],
  term ((-1140 : Rat) / 31) [(0, 2), (4, 1), (12, 1), (13, 2), (16, 1)],
  term ((2280 : Rat) / 31) [(1, 1), (4, 1), (12, 1), (13, 3), (16, 1)],
  term ((-1140 : Rat) / 31) [(1, 2), (4, 1), (12, 1), (13, 2), (16, 1)],
  term ((1140 : Rat) / 31) [(4, 1), (12, 1), (13, 2), (14, 2), (16, 1)],
  term ((1140 : Rat) / 31) [(4, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-2280 : Rat) / 31) [(4, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-2280 : Rat) / 31) [(4, 1), (12, 2), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 367 for generator 27. -/
theorem rs_R009_ueqv_R009NNNNN_partial_27_0367_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_27_0367
        rs_R009_ueqv_R009NNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009NNNNN_partial_27_0367 := by
  native_decide

/-- Coefficient term 368 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNNN_coefficient_27_0368 : Poly :=
[
  term ((6032 : Rat) / 589) [(4, 1), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 368 for generator 27. -/
def rs_R009_ueqv_R009NNNNN_partial_27_0368 : Poly :=
[
  term ((-12064 : Rat) / 589) [(0, 1), (4, 1), (12, 2), (14, 1), (16, 1)],
  term ((6032 : Rat) / 589) [(0, 2), (4, 1), (12, 1), (14, 1), (16, 1)],
  term ((-12064 : Rat) / 589) [(1, 1), (4, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((6032 : Rat) / 589) [(1, 2), (4, 1), (12, 1), (14, 1), (16, 1)],
  term ((12064 : Rat) / 589) [(4, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6032 : Rat) / 589) [(4, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-6032 : Rat) / 589) [(4, 1), (12, 1), (14, 3), (16, 1)],
  term ((12064 : Rat) / 589) [(4, 1), (12, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 368 for generator 27. -/
theorem rs_R009_ueqv_R009NNNNN_partial_27_0368_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_27_0368
        rs_R009_ueqv_R009NNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009NNNNN_partial_27_0368 := by
  native_decide

/-- Coefficient term 369 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNNN_coefficient_27_0369 : Poly :=
[
  term ((101231 : Rat) / 1767) [(4, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 369 for generator 27. -/
def rs_R009_ueqv_R009NNNNN_partial_27_0369 : Poly :=
[
  term ((-202462 : Rat) / 1767) [(0, 1), (4, 1), (12, 2), (15, 2), (16, 1)],
  term ((101231 : Rat) / 1767) [(0, 2), (4, 1), (12, 1), (15, 2), (16, 1)],
  term ((-202462 : Rat) / 1767) [(1, 1), (4, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((101231 : Rat) / 1767) [(1, 2), (4, 1), (12, 1), (15, 2), (16, 1)],
  term ((202462 : Rat) / 1767) [(4, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-101231 : Rat) / 1767) [(4, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((-101231 : Rat) / 1767) [(4, 1), (12, 1), (15, 4), (16, 1)],
  term ((202462 : Rat) / 1767) [(4, 1), (12, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 369 for generator 27. -/
theorem rs_R009_ueqv_R009NNNNN_partial_27_0369_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_27_0369
        rs_R009_ueqv_R009NNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009NNNNN_partial_27_0369 := by
  native_decide

/-- Coefficient term 370 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNNN_coefficient_27_0370 : Poly :=
[
  term ((-32088 : Rat) / 589) [(4, 1), (12, 1), (16, 1)]
]

/-- Partial product 370 for generator 27. -/
def rs_R009_ueqv_R009NNNNN_partial_27_0370 : Poly :=
[
  term ((64176 : Rat) / 589) [(0, 1), (4, 1), (12, 2), (16, 1)],
  term ((-32088 : Rat) / 589) [(0, 2), (4, 1), (12, 1), (16, 1)],
  term ((64176 : Rat) / 589) [(1, 1), (4, 1), (12, 1), (13, 1), (16, 1)],
  term ((-32088 : Rat) / 589) [(1, 2), (4, 1), (12, 1), (16, 1)],
  term ((-64176 : Rat) / 589) [(4, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((32088 : Rat) / 589) [(4, 1), (12, 1), (14, 2), (16, 1)],
  term ((32088 : Rat) / 589) [(4, 1), (12, 1), (15, 2), (16, 1)],
  term ((-64176 : Rat) / 589) [(4, 1), (12, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 370 for generator 27. -/
theorem rs_R009_ueqv_R009NNNNN_partial_27_0370_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_27_0370
        rs_R009_ueqv_R009NNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009NNNNN_partial_27_0370 := by
  native_decide

/-- Coefficient term 371 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNNN_coefficient_27_0371 : Poly :=
[
  term ((-123976 : Rat) / 1767) [(4, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 371 for generator 27. -/
def rs_R009_ueqv_R009NNNNN_partial_27_0371 : Poly :=
[
  term ((247952 : Rat) / 1767) [(0, 1), (4, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-123976 : Rat) / 1767) [(0, 2), (4, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((247952 : Rat) / 1767) [(1, 1), (4, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-123976 : Rat) / 1767) [(1, 2), (4, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-247952 : Rat) / 1767) [(4, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((123976 : Rat) / 1767) [(4, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((123976 : Rat) / 1767) [(4, 1), (13, 1), (14, 3), (15, 1), (16, 1)],
  term ((-247952 : Rat) / 1767) [(4, 1), (13, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 371 for generator 27. -/
theorem rs_R009_ueqv_R009NNNNN_partial_27_0371_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_27_0371
        rs_R009_ueqv_R009NNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009NNNNN_partial_27_0371 := by
  native_decide

/-- Coefficient term 372 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNNN_coefficient_27_0372 : Poly :=
[
  term ((195917 : Rat) / 1178) [(4, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 372 for generator 27. -/
def rs_R009_ueqv_R009NNNNN_partial_27_0372 : Poly :=
[
  term ((-195917 : Rat) / 589) [(0, 1), (4, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((195917 : Rat) / 1178) [(0, 2), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-195917 : Rat) / 589) [(1, 1), (4, 1), (13, 2), (15, 1), (16, 1)],
  term ((195917 : Rat) / 1178) [(1, 2), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((195917 : Rat) / 589) [(4, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-195917 : Rat) / 1178) [(4, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-195917 : Rat) / 1178) [(4, 1), (13, 1), (15, 3), (16, 1)],
  term ((195917 : Rat) / 589) [(4, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 372 for generator 27. -/
theorem rs_R009_ueqv_R009NNNNN_partial_27_0372_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_27_0372
        rs_R009_ueqv_R009NNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009NNNNN_partial_27_0372 := by
  native_decide

/-- Coefficient term 373 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNNN_coefficient_27_0373 : Poly :=
[
  term ((-456 : Rat) / 31) [(4, 1), (13, 2), (14, 1), (16, 1)]
]

/-- Partial product 373 for generator 27. -/
def rs_R009_ueqv_R009NNNNN_partial_27_0373 : Poly :=
[
  term ((912 : Rat) / 31) [(0, 1), (4, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-456 : Rat) / 31) [(0, 2), (4, 1), (13, 2), (14, 1), (16, 1)],
  term ((912 : Rat) / 31) [(1, 1), (4, 1), (13, 3), (14, 1), (16, 1)],
  term ((-456 : Rat) / 31) [(1, 2), (4, 1), (13, 2), (14, 1), (16, 1)],
  term ((-912 : Rat) / 31) [(4, 1), (12, 1), (13, 2), (14, 2), (16, 1)],
  term ((456 : Rat) / 31) [(4, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((456 : Rat) / 31) [(4, 1), (13, 2), (14, 3), (16, 1)],
  term ((-912 : Rat) / 31) [(4, 1), (13, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 373 for generator 27. -/
theorem rs_R009_ueqv_R009NNNNN_partial_27_0373_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_27_0373
        rs_R009_ueqv_R009NNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009NNNNN_partial_27_0373 := by
  native_decide

/-- Coefficient term 374 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNNN_coefficient_27_0374 : Poly :=
[
  term ((2014 : Rat) / 31) [(4, 1), (13, 2), (16, 1)]
]

/-- Partial product 374 for generator 27. -/
def rs_R009_ueqv_R009NNNNN_partial_27_0374 : Poly :=
[
  term ((-4028 : Rat) / 31) [(0, 1), (4, 1), (12, 1), (13, 2), (16, 1)],
  term ((2014 : Rat) / 31) [(0, 2), (4, 1), (13, 2), (16, 1)],
  term ((-4028 : Rat) / 31) [(1, 1), (4, 1), (13, 3), (16, 1)],
  term ((2014 : Rat) / 31) [(1, 2), (4, 1), (13, 2), (16, 1)],
  term ((4028 : Rat) / 31) [(4, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-2014 : Rat) / 31) [(4, 1), (13, 2), (14, 2), (16, 1)],
  term ((-2014 : Rat) / 31) [(4, 1), (13, 2), (15, 2), (16, 1)],
  term ((4028 : Rat) / 31) [(4, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 374 for generator 27. -/
theorem rs_R009_ueqv_R009NNNNN_partial_27_0374_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_27_0374
        rs_R009_ueqv_R009NNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009NNNNN_partial_27_0374 := by
  native_decide

/-- Coefficient term 375 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNNN_coefficient_27_0375 : Poly :=
[
  term ((-13792 : Rat) / 589) [(4, 1), (14, 1), (16, 1)]
]

/-- Partial product 375 for generator 27. -/
def rs_R009_ueqv_R009NNNNN_partial_27_0375 : Poly :=
[
  term ((27584 : Rat) / 589) [(0, 1), (4, 1), (12, 1), (14, 1), (16, 1)],
  term ((-13792 : Rat) / 589) [(0, 2), (4, 1), (14, 1), (16, 1)],
  term ((27584 : Rat) / 589) [(1, 1), (4, 1), (13, 1), (14, 1), (16, 1)],
  term ((-13792 : Rat) / 589) [(1, 2), (4, 1), (14, 1), (16, 1)],
  term ((-27584 : Rat) / 589) [(4, 1), (12, 1), (14, 2), (16, 1)],
  term ((-27584 : Rat) / 589) [(4, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((13792 : Rat) / 589) [(4, 1), (14, 1), (15, 2), (16, 1)],
  term ((13792 : Rat) / 589) [(4, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 375 for generator 27. -/
theorem rs_R009_ueqv_R009NNNNN_partial_27_0375_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_27_0375
        rs_R009_ueqv_R009NNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009NNNNN_partial_27_0375 := by
  native_decide

/-- Coefficient term 376 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNNN_coefficient_27_0376 : Poly :=
[
  term ((-1714409 : Rat) / 7068) [(4, 1), (15, 2), (16, 1)]
]

/-- Partial product 376 for generator 27. -/
def rs_R009_ueqv_R009NNNNN_partial_27_0376 : Poly :=
[
  term ((1714409 : Rat) / 3534) [(0, 1), (4, 1), (12, 1), (15, 2), (16, 1)],
  term ((-1714409 : Rat) / 7068) [(0, 2), (4, 1), (15, 2), (16, 1)],
  term ((1714409 : Rat) / 3534) [(1, 1), (4, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1714409 : Rat) / 7068) [(1, 2), (4, 1), (15, 2), (16, 1)],
  term ((-1714409 : Rat) / 3534) [(4, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1714409 : Rat) / 3534) [(4, 1), (13, 1), (15, 3), (16, 1)],
  term ((1714409 : Rat) / 7068) [(4, 1), (14, 2), (15, 2), (16, 1)],
  term ((1714409 : Rat) / 7068) [(4, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 376 for generator 27. -/
theorem rs_R009_ueqv_R009NNNNN_partial_27_0376_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_27_0376
        rs_R009_ueqv_R009NNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009NNNNN_partial_27_0376 := by
  native_decide

/-- Coefficient term 377 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNNN_coefficient_27_0377 : Poly :=
[
  term ((22430 : Rat) / 589) [(4, 1), (16, 1)]
]

/-- Partial product 377 for generator 27. -/
def rs_R009_ueqv_R009NNNNN_partial_27_0377 : Poly :=
[
  term ((-44860 : Rat) / 589) [(0, 1), (4, 1), (12, 1), (16, 1)],
  term ((22430 : Rat) / 589) [(0, 2), (4, 1), (16, 1)],
  term ((-44860 : Rat) / 589) [(1, 1), (4, 1), (13, 1), (16, 1)],
  term ((22430 : Rat) / 589) [(1, 2), (4, 1), (16, 1)],
  term ((44860 : Rat) / 589) [(4, 1), (12, 1), (14, 1), (16, 1)],
  term ((44860 : Rat) / 589) [(4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-22430 : Rat) / 589) [(4, 1), (14, 2), (16, 1)],
  term ((-22430 : Rat) / 589) [(4, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 377 for generator 27. -/
theorem rs_R009_ueqv_R009NNNNN_partial_27_0377_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_27_0377
        rs_R009_ueqv_R009NNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009NNNNN_partial_27_0377 := by
  native_decide

/-- Coefficient term 378 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNNN_coefficient_27_0378 : Poly :=
[
  term ((-1026 : Rat) / 31) [(4, 2), (7, 1), (13, 1), (16, 1)]
]

/-- Partial product 378 for generator 27. -/
def rs_R009_ueqv_R009NNNNN_partial_27_0378 : Poly :=
[
  term ((2052 : Rat) / 31) [(0, 1), (4, 2), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((-1026 : Rat) / 31) [(0, 2), (4, 2), (7, 1), (13, 1), (16, 1)],
  term ((2052 : Rat) / 31) [(1, 1), (4, 2), (7, 1), (13, 2), (16, 1)],
  term ((-1026 : Rat) / 31) [(1, 2), (4, 2), (7, 1), (13, 1), (16, 1)],
  term ((-2052 : Rat) / 31) [(4, 2), (7, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((1026 : Rat) / 31) [(4, 2), (7, 1), (13, 1), (14, 2), (16, 1)],
  term ((1026 : Rat) / 31) [(4, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-2052 : Rat) / 31) [(4, 2), (7, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 378 for generator 27. -/
theorem rs_R009_ueqv_R009NNNNN_partial_27_0378_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_27_0378
        rs_R009_ueqv_R009NNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009NNNNN_partial_27_0378 := by
  native_decide

/-- Coefficient term 379 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNNN_coefficient_27_0379 : Poly :=
[
  term ((-92129 : Rat) / 589) [(4, 2), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 379 for generator 27. -/
def rs_R009_ueqv_R009NNNNN_partial_27_0379 : Poly :=
[
  term ((184258 : Rat) / 589) [(0, 1), (4, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-92129 : Rat) / 589) [(0, 2), (4, 2), (7, 1), (15, 1), (16, 1)],
  term ((184258 : Rat) / 589) [(1, 1), (4, 2), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-92129 : Rat) / 589) [(1, 2), (4, 2), (7, 1), (15, 1), (16, 1)],
  term ((-184258 : Rat) / 589) [(4, 2), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-184258 : Rat) / 589) [(4, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((92129 : Rat) / 589) [(4, 2), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((92129 : Rat) / 589) [(4, 2), (7, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 379 for generator 27. -/
theorem rs_R009_ueqv_R009NNNNN_partial_27_0379_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_27_0379
        rs_R009_ueqv_R009NNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009NNNNN_partial_27_0379 := by
  native_decide

/-- Coefficient term 380 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNNN_coefficient_27_0380 : Poly :=
[
  term ((304 : Rat) / 31) [(4, 2), (12, 1), (16, 1)]
]

/-- Partial product 380 for generator 27. -/
def rs_R009_ueqv_R009NNNNN_partial_27_0380 : Poly :=
[
  term ((-608 : Rat) / 31) [(0, 1), (4, 2), (12, 2), (16, 1)],
  term ((304 : Rat) / 31) [(0, 2), (4, 2), (12, 1), (16, 1)],
  term ((-608 : Rat) / 31) [(1, 1), (4, 2), (12, 1), (13, 1), (16, 1)],
  term ((304 : Rat) / 31) [(1, 2), (4, 2), (12, 1), (16, 1)],
  term ((608 : Rat) / 31) [(4, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-304 : Rat) / 31) [(4, 2), (12, 1), (14, 2), (16, 1)],
  term ((-304 : Rat) / 31) [(4, 2), (12, 1), (15, 2), (16, 1)],
  term ((608 : Rat) / 31) [(4, 2), (12, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 380 for generator 27. -/
theorem rs_R009_ueqv_R009NNNNN_partial_27_0380_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_27_0380
        rs_R009_ueqv_R009NNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009NNNNN_partial_27_0380 := by
  native_decide

/-- Coefficient term 381 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNNN_coefficient_27_0381 : Poly :=
[
  term ((190 : Rat) / 31) [(4, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 381 for generator 27. -/
def rs_R009_ueqv_R009NNNNN_partial_27_0381 : Poly :=
[
  term ((-380 : Rat) / 31) [(0, 1), (4, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((190 : Rat) / 31) [(0, 2), (4, 2), (13, 1), (15, 1), (16, 1)],
  term ((-380 : Rat) / 31) [(1, 1), (4, 2), (13, 2), (15, 1), (16, 1)],
  term ((190 : Rat) / 31) [(1, 2), (4, 2), (13, 1), (15, 1), (16, 1)],
  term ((380 : Rat) / 31) [(4, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-190 : Rat) / 31) [(4, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-190 : Rat) / 31) [(4, 2), (13, 1), (15, 3), (16, 1)],
  term ((380 : Rat) / 31) [(4, 2), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 381 for generator 27. -/
theorem rs_R009_ueqv_R009NNNNN_partial_27_0381_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_27_0381
        rs_R009_ueqv_R009NNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009NNNNN_partial_27_0381 := by
  native_decide

/-- Coefficient term 382 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNNN_coefficient_27_0382 : Poly :=
[
  term ((69769 : Rat) / 1767) [(4, 2), (15, 2), (16, 1)]
]

/-- Partial product 382 for generator 27. -/
def rs_R009_ueqv_R009NNNNN_partial_27_0382 : Poly :=
[
  term ((-139538 : Rat) / 1767) [(0, 1), (4, 2), (12, 1), (15, 2), (16, 1)],
  term ((69769 : Rat) / 1767) [(0, 2), (4, 2), (15, 2), (16, 1)],
  term ((-139538 : Rat) / 1767) [(1, 1), (4, 2), (13, 1), (15, 2), (16, 1)],
  term ((69769 : Rat) / 1767) [(1, 2), (4, 2), (15, 2), (16, 1)],
  term ((139538 : Rat) / 1767) [(4, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((139538 : Rat) / 1767) [(4, 2), (13, 1), (15, 3), (16, 1)],
  term ((-69769 : Rat) / 1767) [(4, 2), (14, 2), (15, 2), (16, 1)],
  term ((-69769 : Rat) / 1767) [(4, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 382 for generator 27. -/
theorem rs_R009_ueqv_R009NNNNN_partial_27_0382_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_27_0382
        rs_R009_ueqv_R009NNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009NNNNN_partial_27_0382 := by
  native_decide

/-- Coefficient term 383 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNNN_coefficient_27_0383 : Poly :=
[
  term ((-228 : Rat) / 31) [(4, 2), (16, 1)]
]

/-- Partial product 383 for generator 27. -/
def rs_R009_ueqv_R009NNNNN_partial_27_0383 : Poly :=
[
  term ((456 : Rat) / 31) [(0, 1), (4, 2), (12, 1), (16, 1)],
  term ((-228 : Rat) / 31) [(0, 2), (4, 2), (16, 1)],
  term ((456 : Rat) / 31) [(1, 1), (4, 2), (13, 1), (16, 1)],
  term ((-228 : Rat) / 31) [(1, 2), (4, 2), (16, 1)],
  term ((-456 : Rat) / 31) [(4, 2), (12, 1), (14, 1), (16, 1)],
  term ((-456 : Rat) / 31) [(4, 2), (13, 1), (15, 1), (16, 1)],
  term ((228 : Rat) / 31) [(4, 2), (14, 2), (16, 1)],
  term ((228 : Rat) / 31) [(4, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 383 for generator 27. -/
theorem rs_R009_ueqv_R009NNNNN_partial_27_0383_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_27_0383
        rs_R009_ueqv_R009NNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009NNNNN_partial_27_0383 := by
  native_decide

/-- Coefficient term 384 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNNN_coefficient_27_0384 : Poly :=
[
  term ((-1048 : Rat) / 589) [(5, 1), (7, 1), (10, 1), (16, 1)]
]

/-- Partial product 384 for generator 27. -/
def rs_R009_ueqv_R009NNNNN_partial_27_0384 : Poly :=
[
  term ((2096 : Rat) / 589) [(0, 1), (5, 1), (7, 1), (10, 1), (12, 1), (16, 1)],
  term ((-1048 : Rat) / 589) [(0, 2), (5, 1), (7, 1), (10, 1), (16, 1)],
  term ((2096 : Rat) / 589) [(1, 1), (5, 1), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((-1048 : Rat) / 589) [(1, 2), (5, 1), (7, 1), (10, 1), (16, 1)],
  term ((-2096 : Rat) / 589) [(5, 1), (7, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-2096 : Rat) / 589) [(5, 1), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((1048 : Rat) / 589) [(5, 1), (7, 1), (10, 1), (14, 2), (16, 1)],
  term ((1048 : Rat) / 589) [(5, 1), (7, 1), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 384 for generator 27. -/
theorem rs_R009_ueqv_R009NNNNN_partial_27_0384_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_27_0384
        rs_R009_ueqv_R009NNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009NNNNN_partial_27_0384 := by
  native_decide

/-- Coefficient term 385 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNNN_coefficient_27_0385 : Poly :=
[
  term ((-228 : Rat) / 31) [(5, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 385 for generator 27. -/
def rs_R009_ueqv_R009NNNNN_partial_27_0385 : Poly :=
[
  term ((456 : Rat) / 31) [(0, 1), (5, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-228 : Rat) / 31) [(0, 2), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((456 : Rat) / 31) [(1, 1), (5, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-228 : Rat) / 31) [(1, 2), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-456 : Rat) / 31) [(5, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((228 : Rat) / 31) [(5, 1), (9, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((228 : Rat) / 31) [(5, 1), (9, 1), (13, 1), (15, 3), (16, 1)],
  term ((-456 : Rat) / 31) [(5, 1), (9, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 385 for generator 27. -/
theorem rs_R009_ueqv_R009NNNNN_partial_27_0385_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_27_0385
        rs_R009_ueqv_R009NNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009NNNNN_partial_27_0385 := by
  native_decide

/-- Coefficient term 386 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNNN_coefficient_27_0386 : Poly :=
[
  term ((-82058 : Rat) / 1767) [(5, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 386 for generator 27. -/
def rs_R009_ueqv_R009NNNNN_partial_27_0386 : Poly :=
[
  term ((164116 : Rat) / 1767) [(0, 1), (5, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((-82058 : Rat) / 1767) [(0, 2), (5, 1), (9, 1), (15, 2), (16, 1)],
  term ((164116 : Rat) / 1767) [(1, 1), (5, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-82058 : Rat) / 1767) [(1, 2), (5, 1), (9, 1), (15, 2), (16, 1)],
  term ((-164116 : Rat) / 1767) [(5, 1), (9, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-164116 : Rat) / 1767) [(5, 1), (9, 1), (13, 1), (15, 3), (16, 1)],
  term ((82058 : Rat) / 1767) [(5, 1), (9, 1), (14, 2), (15, 2), (16, 1)],
  term ((82058 : Rat) / 1767) [(5, 1), (9, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 386 for generator 27. -/
theorem rs_R009_ueqv_R009NNNNN_partial_27_0386_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_27_0386
        rs_R009_ueqv_R009NNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009NNNNN_partial_27_0386 := by
  native_decide

/-- Coefficient term 387 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNNN_coefficient_27_0387 : Poly :=
[
  term ((5264 : Rat) / 589) [(5, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 387 for generator 27. -/
def rs_R009_ueqv_R009NNNNN_partial_27_0387 : Poly :=
[
  term ((-10528 : Rat) / 589) [(0, 1), (5, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((5264 : Rat) / 589) [(0, 2), (5, 1), (10, 1), (11, 1), (16, 1)],
  term ((-10528 : Rat) / 589) [(1, 1), (5, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((5264 : Rat) / 589) [(1, 2), (5, 1), (10, 1), (11, 1), (16, 1)],
  term ((10528 : Rat) / 589) [(5, 1), (10, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((10528 : Rat) / 589) [(5, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-5264 : Rat) / 589) [(5, 1), (10, 1), (11, 1), (14, 2), (16, 1)],
  term ((-5264 : Rat) / 589) [(5, 1), (10, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 387 for generator 27. -/
theorem rs_R009_ueqv_R009NNNNN_partial_27_0387_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_27_0387
        rs_R009_ueqv_R009NNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009NNNNN_partial_27_0387 := by
  native_decide

/-- Coefficient term 388 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNNN_coefficient_27_0388 : Poly :=
[
  term ((912 : Rat) / 31) [(5, 1), (10, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 388 for generator 27. -/
def rs_R009_ueqv_R009NNNNN_partial_27_0388 : Poly :=
[
  term ((-1824 : Rat) / 31) [(0, 1), (5, 1), (10, 1), (12, 2), (13, 1), (16, 1)],
  term ((912 : Rat) / 31) [(0, 2), (5, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-1824 : Rat) / 31) [(1, 1), (5, 1), (10, 1), (12, 1), (13, 2), (16, 1)],
  term ((912 : Rat) / 31) [(1, 2), (5, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-912 : Rat) / 31) [(5, 1), (10, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((-912 : Rat) / 31) [(5, 1), (10, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((1824 : Rat) / 31) [(5, 1), (10, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((1824 : Rat) / 31) [(5, 1), (10, 1), (12, 2), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 388 for generator 27. -/
theorem rs_R009_ueqv_R009NNNNN_partial_27_0388_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_27_0388
        rs_R009_ueqv_R009NNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009NNNNN_partial_27_0388 := by
  native_decide

/-- Coefficient term 389 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNNN_coefficient_27_0389 : Poly :=
[
  term ((186536 : Rat) / 1767) [(5, 1), (10, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 389 for generator 27. -/
def rs_R009_ueqv_R009NNNNN_partial_27_0389 : Poly :=
[
  term ((-373072 : Rat) / 1767) [(0, 1), (5, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((186536 : Rat) / 1767) [(0, 2), (5, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-373072 : Rat) / 1767) [(1, 1), (5, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((186536 : Rat) / 1767) [(1, 2), (5, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((373072 : Rat) / 1767) [(5, 1), (10, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-186536 : Rat) / 1767) [(5, 1), (10, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-186536 : Rat) / 1767) [(5, 1), (10, 1), (12, 1), (15, 3), (16, 1)],
  term ((373072 : Rat) / 1767) [(5, 1), (10, 1), (12, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 389 for generator 27. -/
theorem rs_R009_ueqv_R009NNNNN_partial_27_0389_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_27_0389
        rs_R009_ueqv_R009NNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009NNNNN_partial_27_0389 := by
  native_decide

/-- Coefficient term 390 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNNN_coefficient_27_0390 : Poly :=
[
  term ((-456 : Rat) / 31) [(5, 1), (10, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 390 for generator 27. -/
def rs_R009_ueqv_R009NNNNN_partial_27_0390 : Poly :=
[
  term ((912 : Rat) / 31) [(0, 1), (5, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-456 : Rat) / 31) [(0, 2), (5, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((912 : Rat) / 31) [(1, 1), (5, 1), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((-456 : Rat) / 31) [(1, 2), (5, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-912 : Rat) / 31) [(5, 1), (10, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((456 : Rat) / 31) [(5, 1), (10, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((456 : Rat) / 31) [(5, 1), (10, 1), (13, 1), (14, 3), (16, 1)],
  term ((-912 : Rat) / 31) [(5, 1), (10, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 390 for generator 27. -/
theorem rs_R009_ueqv_R009NNNNN_partial_27_0390_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_27_0390
        rs_R009_ueqv_R009NNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009NNNNN_partial_27_0390 := by
  native_decide

/-- Coefficient term 391 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNNN_coefficient_27_0391 : Poly :=
[
  term ((988 : Rat) / 31) [(5, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 391 for generator 27. -/
def rs_R009_ueqv_R009NNNNN_partial_27_0391 : Poly :=
[
  term ((-1976 : Rat) / 31) [(0, 1), (5, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((988 : Rat) / 31) [(0, 2), (5, 1), (10, 1), (13, 1), (16, 1)],
  term ((-1976 : Rat) / 31) [(1, 1), (5, 1), (10, 1), (13, 2), (16, 1)],
  term ((988 : Rat) / 31) [(1, 2), (5, 1), (10, 1), (13, 1), (16, 1)],
  term ((1976 : Rat) / 31) [(5, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-988 : Rat) / 31) [(5, 1), (10, 1), (13, 1), (14, 2), (16, 1)],
  term ((-988 : Rat) / 31) [(5, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((1976 : Rat) / 31) [(5, 1), (10, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 391 for generator 27. -/
theorem rs_R009_ueqv_R009NNNNN_partial_27_0391_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_27_0391
        rs_R009_ueqv_R009NNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009NNNNN_partial_27_0391 := by
  native_decide

/-- Coefficient term 392 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNNN_coefficient_27_0392 : Poly :=
[
  term ((-103504 : Rat) / 1767) [(5, 1), (10, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 392 for generator 27. -/
def rs_R009_ueqv_R009NNNNN_partial_27_0392 : Poly :=
[
  term ((207008 : Rat) / 1767) [(0, 1), (5, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-103504 : Rat) / 1767) [(0, 2), (5, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((207008 : Rat) / 1767) [(1, 1), (5, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-103504 : Rat) / 1767) [(1, 2), (5, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-207008 : Rat) / 1767) [(5, 1), (10, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-207008 : Rat) / 1767) [(5, 1), (10, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((103504 : Rat) / 1767) [(5, 1), (10, 1), (14, 1), (15, 3), (16, 1)],
  term ((103504 : Rat) / 1767) [(5, 1), (10, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 392 for generator 27. -/
theorem rs_R009_ueqv_R009NNNNN_partial_27_0392_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_27_0392
        rs_R009_ueqv_R009NNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009NNNNN_partial_27_0392 := by
  native_decide

/-- Coefficient term 393 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNNN_coefficient_27_0393 : Poly :=
[
  term ((53446 : Rat) / 589) [(5, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 393 for generator 27. -/
def rs_R009_ueqv_R009NNNNN_partial_27_0393 : Poly :=
[
  term ((-106892 : Rat) / 589) [(0, 1), (5, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((53446 : Rat) / 589) [(0, 2), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((-106892 : Rat) / 589) [(1, 1), (5, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((53446 : Rat) / 589) [(1, 2), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((106892 : Rat) / 589) [(5, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((106892 : Rat) / 589) [(5, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-53446 : Rat) / 589) [(5, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((-53446 : Rat) / 589) [(5, 1), (10, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 393 for generator 27. -/
theorem rs_R009_ueqv_R009NNNNN_partial_27_0393_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_27_0393
        rs_R009_ueqv_R009NNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009NNNNN_partial_27_0393 := by
  native_decide

/-- Coefficient term 394 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNNN_coefficient_27_0394 : Poly :=
[
  term ((512 : Rat) / 589) [(5, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 394 for generator 27. -/
def rs_R009_ueqv_R009NNNNN_partial_27_0394 : Poly :=
[
  term ((-1024 : Rat) / 589) [(0, 1), (5, 1), (11, 1), (12, 2), (16, 1)],
  term ((512 : Rat) / 589) [(0, 2), (5, 1), (11, 1), (12, 1), (16, 1)],
  term ((-1024 : Rat) / 589) [(1, 1), (5, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((512 : Rat) / 589) [(1, 2), (5, 1), (11, 1), (12, 1), (16, 1)],
  term ((1024 : Rat) / 589) [(5, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-512 : Rat) / 589) [(5, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((-512 : Rat) / 589) [(5, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((1024 : Rat) / 589) [(5, 1), (11, 1), (12, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 394 for generator 27. -/
theorem rs_R009_ueqv_R009NNNNN_partial_27_0394_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_27_0394
        rs_R009_ueqv_R009NNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009NNNNN_partial_27_0394 := by
  native_decide

/-- Coefficient term 395 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNNN_coefficient_27_0395 : Poly :=
[
  term ((-152 : Rat) / 31) [(5, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 395 for generator 27. -/
def rs_R009_ueqv_R009NNNNN_partial_27_0395 : Poly :=
[
  term ((304 : Rat) / 31) [(0, 1), (5, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-152 : Rat) / 31) [(0, 2), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((304 : Rat) / 31) [(1, 1), (5, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-152 : Rat) / 31) [(1, 2), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((-304 : Rat) / 31) [(5, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((-304 : Rat) / 31) [(5, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((152 : Rat) / 31) [(5, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((152 : Rat) / 31) [(5, 1), (11, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 395 for generator 27. -/
theorem rs_R009_ueqv_R009NNNNN_partial_27_0395_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_27_0395
        rs_R009_ueqv_R009NNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009NNNNN_partial_27_0395 := by
  native_decide

/-- Coefficient term 396 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNNN_coefficient_27_0396 : Poly :=
[
  term ((1980 : Rat) / 589) [(5, 1), (11, 1), (16, 1)]
]

/-- Partial product 396 for generator 27. -/
def rs_R009_ueqv_R009NNNNN_partial_27_0396 : Poly :=
[
  term ((-3960 : Rat) / 589) [(0, 1), (5, 1), (11, 1), (12, 1), (16, 1)],
  term ((1980 : Rat) / 589) [(0, 2), (5, 1), (11, 1), (16, 1)],
  term ((-3960 : Rat) / 589) [(1, 1), (5, 1), (11, 1), (13, 1), (16, 1)],
  term ((1980 : Rat) / 589) [(1, 2), (5, 1), (11, 1), (16, 1)],
  term ((3960 : Rat) / 589) [(5, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((3960 : Rat) / 589) [(5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1980 : Rat) / 589) [(5, 1), (11, 1), (14, 2), (16, 1)],
  term ((-1980 : Rat) / 589) [(5, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 396 for generator 27. -/
theorem rs_R009_ueqv_R009NNNNN_partial_27_0396_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_27_0396
        rs_R009_ueqv_R009NNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009NNNNN_partial_27_0396 := by
  native_decide

/-- Coefficient term 397 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNNN_coefficient_27_0397 : Poly :=
[
  term ((-570 : Rat) / 31) [(5, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 397 for generator 27. -/
def rs_R009_ueqv_R009NNNNN_partial_27_0397 : Poly :=
[
  term ((1140 : Rat) / 31) [(0, 1), (5, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-570 : Rat) / 31) [(0, 2), (5, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((1140 : Rat) / 31) [(1, 1), (5, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-570 : Rat) / 31) [(1, 2), (5, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((570 : Rat) / 31) [(5, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((570 : Rat) / 31) [(5, 1), (12, 1), (13, 1), (14, 3), (16, 1)],
  term ((-1140 : Rat) / 31) [(5, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1140 : Rat) / 31) [(5, 1), (12, 2), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 397 for generator 27. -/
theorem rs_R009_ueqv_R009NNNNN_partial_27_0397_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_27_0397
        rs_R009_ueqv_R009NNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009NNNNN_partial_27_0397 := by
  native_decide

/-- Coefficient term 398 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNNN_coefficient_27_0398 : Poly :=
[
  term ((-703 : Rat) / 31) [(5, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 398 for generator 27. -/
def rs_R009_ueqv_R009NNNNN_partial_27_0398 : Poly :=
[
  term ((1406 : Rat) / 31) [(0, 1), (5, 1), (12, 2), (13, 1), (16, 1)],
  term ((-703 : Rat) / 31) [(0, 2), (5, 1), (12, 1), (13, 1), (16, 1)],
  term ((1406 : Rat) / 31) [(1, 1), (5, 1), (12, 1), (13, 2), (16, 1)],
  term ((-703 : Rat) / 31) [(1, 2), (5, 1), (12, 1), (13, 1), (16, 1)],
  term ((703 : Rat) / 31) [(5, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((703 : Rat) / 31) [(5, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1406 : Rat) / 31) [(5, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1406 : Rat) / 31) [(5, 1), (12, 2), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 398 for generator 27. -/
theorem rs_R009_ueqv_R009NNNNN_partial_27_0398_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_27_0398
        rs_R009_ueqv_R009NNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009NNNNN_partial_27_0398 := by
  native_decide

/-- Coefficient term 399 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNNN_coefficient_27_0399 : Poly :=
[
  term ((-101231 : Rat) / 1767) [(5, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 399 for generator 27. -/
def rs_R009_ueqv_R009NNNNN_partial_27_0399 : Poly :=
[
  term ((202462 : Rat) / 1767) [(0, 1), (5, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-101231 : Rat) / 1767) [(0, 2), (5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((202462 : Rat) / 1767) [(1, 1), (5, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-101231 : Rat) / 1767) [(1, 2), (5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-202462 : Rat) / 1767) [(5, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((101231 : Rat) / 1767) [(5, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((101231 : Rat) / 1767) [(5, 1), (12, 1), (14, 3), (15, 1), (16, 1)],
  term ((-202462 : Rat) / 1767) [(5, 1), (12, 2), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 399 for generator 27. -/
theorem rs_R009_ueqv_R009NNNNN_partial_27_0399_valid :
    mulPoly rs_R009_ueqv_R009NNNNN_coefficient_27_0399
        rs_R009_ueqv_R009NNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009NNNNN_partial_27_0399 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NNNNN_partials_27_0300_0399 : List Poly :=
[
  rs_R009_ueqv_R009NNNNN_partial_27_0300,
  rs_R009_ueqv_R009NNNNN_partial_27_0301,
  rs_R009_ueqv_R009NNNNN_partial_27_0302,
  rs_R009_ueqv_R009NNNNN_partial_27_0303,
  rs_R009_ueqv_R009NNNNN_partial_27_0304,
  rs_R009_ueqv_R009NNNNN_partial_27_0305,
  rs_R009_ueqv_R009NNNNN_partial_27_0306,
  rs_R009_ueqv_R009NNNNN_partial_27_0307,
  rs_R009_ueqv_R009NNNNN_partial_27_0308,
  rs_R009_ueqv_R009NNNNN_partial_27_0309,
  rs_R009_ueqv_R009NNNNN_partial_27_0310,
  rs_R009_ueqv_R009NNNNN_partial_27_0311,
  rs_R009_ueqv_R009NNNNN_partial_27_0312,
  rs_R009_ueqv_R009NNNNN_partial_27_0313,
  rs_R009_ueqv_R009NNNNN_partial_27_0314,
  rs_R009_ueqv_R009NNNNN_partial_27_0315,
  rs_R009_ueqv_R009NNNNN_partial_27_0316,
  rs_R009_ueqv_R009NNNNN_partial_27_0317,
  rs_R009_ueqv_R009NNNNN_partial_27_0318,
  rs_R009_ueqv_R009NNNNN_partial_27_0319,
  rs_R009_ueqv_R009NNNNN_partial_27_0320,
  rs_R009_ueqv_R009NNNNN_partial_27_0321,
  rs_R009_ueqv_R009NNNNN_partial_27_0322,
  rs_R009_ueqv_R009NNNNN_partial_27_0323,
  rs_R009_ueqv_R009NNNNN_partial_27_0324,
  rs_R009_ueqv_R009NNNNN_partial_27_0325,
  rs_R009_ueqv_R009NNNNN_partial_27_0326,
  rs_R009_ueqv_R009NNNNN_partial_27_0327,
  rs_R009_ueqv_R009NNNNN_partial_27_0328,
  rs_R009_ueqv_R009NNNNN_partial_27_0329,
  rs_R009_ueqv_R009NNNNN_partial_27_0330,
  rs_R009_ueqv_R009NNNNN_partial_27_0331,
  rs_R009_ueqv_R009NNNNN_partial_27_0332,
  rs_R009_ueqv_R009NNNNN_partial_27_0333,
  rs_R009_ueqv_R009NNNNN_partial_27_0334,
  rs_R009_ueqv_R009NNNNN_partial_27_0335,
  rs_R009_ueqv_R009NNNNN_partial_27_0336,
  rs_R009_ueqv_R009NNNNN_partial_27_0337,
  rs_R009_ueqv_R009NNNNN_partial_27_0338,
  rs_R009_ueqv_R009NNNNN_partial_27_0339,
  rs_R009_ueqv_R009NNNNN_partial_27_0340,
  rs_R009_ueqv_R009NNNNN_partial_27_0341,
  rs_R009_ueqv_R009NNNNN_partial_27_0342,
  rs_R009_ueqv_R009NNNNN_partial_27_0343,
  rs_R009_ueqv_R009NNNNN_partial_27_0344,
  rs_R009_ueqv_R009NNNNN_partial_27_0345,
  rs_R009_ueqv_R009NNNNN_partial_27_0346,
  rs_R009_ueqv_R009NNNNN_partial_27_0347,
  rs_R009_ueqv_R009NNNNN_partial_27_0348,
  rs_R009_ueqv_R009NNNNN_partial_27_0349,
  rs_R009_ueqv_R009NNNNN_partial_27_0350,
  rs_R009_ueqv_R009NNNNN_partial_27_0351,
  rs_R009_ueqv_R009NNNNN_partial_27_0352,
  rs_R009_ueqv_R009NNNNN_partial_27_0353,
  rs_R009_ueqv_R009NNNNN_partial_27_0354,
  rs_R009_ueqv_R009NNNNN_partial_27_0355,
  rs_R009_ueqv_R009NNNNN_partial_27_0356,
  rs_R009_ueqv_R009NNNNN_partial_27_0357,
  rs_R009_ueqv_R009NNNNN_partial_27_0358,
  rs_R009_ueqv_R009NNNNN_partial_27_0359,
  rs_R009_ueqv_R009NNNNN_partial_27_0360,
  rs_R009_ueqv_R009NNNNN_partial_27_0361,
  rs_R009_ueqv_R009NNNNN_partial_27_0362,
  rs_R009_ueqv_R009NNNNN_partial_27_0363,
  rs_R009_ueqv_R009NNNNN_partial_27_0364,
  rs_R009_ueqv_R009NNNNN_partial_27_0365,
  rs_R009_ueqv_R009NNNNN_partial_27_0366,
  rs_R009_ueqv_R009NNNNN_partial_27_0367,
  rs_R009_ueqv_R009NNNNN_partial_27_0368,
  rs_R009_ueqv_R009NNNNN_partial_27_0369,
  rs_R009_ueqv_R009NNNNN_partial_27_0370,
  rs_R009_ueqv_R009NNNNN_partial_27_0371,
  rs_R009_ueqv_R009NNNNN_partial_27_0372,
  rs_R009_ueqv_R009NNNNN_partial_27_0373,
  rs_R009_ueqv_R009NNNNN_partial_27_0374,
  rs_R009_ueqv_R009NNNNN_partial_27_0375,
  rs_R009_ueqv_R009NNNNN_partial_27_0376,
  rs_R009_ueqv_R009NNNNN_partial_27_0377,
  rs_R009_ueqv_R009NNNNN_partial_27_0378,
  rs_R009_ueqv_R009NNNNN_partial_27_0379,
  rs_R009_ueqv_R009NNNNN_partial_27_0380,
  rs_R009_ueqv_R009NNNNN_partial_27_0381,
  rs_R009_ueqv_R009NNNNN_partial_27_0382,
  rs_R009_ueqv_R009NNNNN_partial_27_0383,
  rs_R009_ueqv_R009NNNNN_partial_27_0384,
  rs_R009_ueqv_R009NNNNN_partial_27_0385,
  rs_R009_ueqv_R009NNNNN_partial_27_0386,
  rs_R009_ueqv_R009NNNNN_partial_27_0387,
  rs_R009_ueqv_R009NNNNN_partial_27_0388,
  rs_R009_ueqv_R009NNNNN_partial_27_0389,
  rs_R009_ueqv_R009NNNNN_partial_27_0390,
  rs_R009_ueqv_R009NNNNN_partial_27_0391,
  rs_R009_ueqv_R009NNNNN_partial_27_0392,
  rs_R009_ueqv_R009NNNNN_partial_27_0393,
  rs_R009_ueqv_R009NNNNN_partial_27_0394,
  rs_R009_ueqv_R009NNNNN_partial_27_0395,
  rs_R009_ueqv_R009NNNNN_partial_27_0396,
  rs_R009_ueqv_R009NNNNN_partial_27_0397,
  rs_R009_ueqv_R009NNNNN_partial_27_0398,
  rs_R009_ueqv_R009NNNNN_partial_27_0399
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NNNNN_block_27_0300_0399 : Poly :=
[
  term ((-5376 : Rat) / 589) [(0, 1), (3, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((20410 : Rat) / 589) [(0, 1), (3, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((22745 : Rat) / 589) [(0, 1), (3, 1), (11, 1), (12, 1), (16, 1)],
  term ((-7680 : Rat) / 589) [(0, 1), (3, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((-3072 : Rat) / 589) [(0, 1), (3, 1), (11, 1), (12, 2), (16, 1)],
  term ((1365 : Rat) / 589) [(0, 1), (3, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-33285 : Rat) / 589) [(0, 1), (3, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((-215740 : Rat) / 1767) [(0, 1), (3, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((20091 : Rat) / 589) [(0, 1), (3, 1), (12, 1), (13, 1), (16, 1)],
  term ((906 : Rat) / 589) [(0, 1), (3, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1143077 : Rat) / 3534) [(0, 1), (3, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((340711 : Rat) / 3534) [(0, 1), (3, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((496175 : Rat) / 3534) [(0, 1), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((-47143 : Rat) / 3534) [(0, 1), (3, 1), (12, 1), (15, 3), (16, 1)],
  term ((40422 : Rat) / 589) [(0, 1), (3, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-1836 : Rat) / 589) [(0, 1), (3, 1), (12, 2), (13, 1), (16, 1)],
  term ((57669 : Rat) / 589) [(0, 1), (3, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((76990 : Rat) / 1767) [(0, 1), (3, 1), (12, 2), (15, 1), (16, 1)],
  term ((-576 : Rat) / 19) [(0, 1), (3, 1), (12, 3), (15, 1), (16, 1)],
  term ((-13824 : Rat) / 589) [(0, 1), (3, 2), (4, 1), (10, 1), (12, 1), (16, 1)],
  term ((-856 : Rat) / 589) [(0, 1), (3, 2), (4, 1), (12, 1), (16, 1)],
  term ((8832 : Rat) / 589) [(0, 1), (3, 2), (4, 1), (12, 2), (16, 1)],
  term ((-48 : Rat) / 589) [(0, 1), (3, 2), (4, 2), (12, 1), (16, 1)],
  term ((26304 : Rat) / 589) [(0, 1), (3, 2), (5, 1), (7, 1), (12, 1), (16, 1)],
  term ((9456 : Rat) / 589) [(0, 1), (3, 2), (5, 1), (9, 1), (12, 1), (16, 1)],
  term ((17280 : Rat) / 589) [(0, 1), (3, 2), (5, 1), (12, 1), (13, 1), (16, 1)],
  term ((-26736 : Rat) / 589) [(0, 1), (3, 2), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-6912 : Rat) / 589) [(0, 1), (3, 2), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((-8640 : Rat) / 589) [(0, 1), (3, 2), (8, 1), (12, 1), (14, 1), (16, 1)],
  term ((-4320 : Rat) / 589) [(0, 1), (3, 2), (8, 1), (12, 1), (16, 1)],
  term ((456 : Rat) / 31) [(0, 1), (3, 2), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((135748 : Rat) / 1767) [(0, 1), (3, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((6912 : Rat) / 589) [(0, 1), (3, 2), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((9600 : Rat) / 589) [(0, 1), (3, 2), (10, 1), (12, 1), (16, 1)],
  term ((91456 : Rat) / 1767) [(0, 1), (3, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((456 : Rat) / 31) [(0, 1), (3, 2), (12, 1), (13, 2), (16, 1)],
  term ((-9064 : Rat) / 589) [(0, 1), (3, 2), (12, 1), (14, 1), (16, 1)],
  term ((264 : Rat) / 589) [(0, 1), (3, 2), (12, 1), (14, 2), (16, 1)],
  term ((-8376 : Rat) / 589) [(0, 1), (3, 2), (12, 1), (15, 2), (16, 1)],
  term ((19056 : Rat) / 589) [(0, 1), (3, 2), (12, 1), (16, 1)],
  term ((-8256 : Rat) / 589) [(0, 1), (3, 2), (12, 2), (14, 1), (16, 1)],
  term ((-6880 : Rat) / 589) [(0, 1), (3, 2), (12, 2), (16, 1)],
  term ((9456 : Rat) / 589) [(0, 1), (3, 3), (9, 1), (12, 1), (16, 1)],
  term ((20736 : Rat) / 589) [(0, 1), (3, 3), (12, 1), (13, 1), (16, 1)],
  term ((-798 : Rat) / 31) [(0, 1), (4, 1), (5, 1), (12, 1), (13, 1), (16, 1)],
  term ((7896 : Rat) / 589) [(0, 1), (4, 1), (5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-99817 : Rat) / 1767) [(0, 1), (4, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-456 : Rat) / 31) [(0, 1), (4, 1), (7, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-113740 : Rat) / 1767) [(0, 1), (4, 1), (7, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((5264 : Rat) / 589) [(0, 1), (4, 1), (7, 1), (11, 1), (12, 1), (16, 1)],
  term ((-5263 : Rat) / 31) [(0, 1), (4, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((-3090121 : Rat) / 3534) [(0, 1), (4, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-684 : Rat) / 31) [(0, 1), (4, 1), (7, 1), (12, 2), (13, 1), (16, 1)],
  term ((-36398 : Rat) / 589) [(0, 1), (4, 1), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((456 : Rat) / 31) [(0, 1), (4, 1), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-912 : Rat) / 31) [(0, 1), (4, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((164116 : Rat) / 1767) [(0, 1), (4, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-328232 : Rat) / 1767) [(0, 1), (4, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((362032 : Rat) / 1767) [(0, 1), (4, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1824 : Rat) / 31) [(0, 1), (4, 1), (10, 1), (12, 1), (13, 2), (16, 1)],
  term ((-207008 : Rat) / 1767) [(0, 1), (4, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-13416 : Rat) / 589) [(0, 1), (4, 1), (10, 1), (12, 1), (16, 1)],
  term ((18713 : Rat) / 589) [(0, 1), (4, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-57047 : Rat) / 3534) [(0, 1), (4, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-13648 : Rat) / 589) [(0, 1), (4, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((10528 : Rat) / 589) [(0, 1), (4, 1), (11, 2), (12, 1), (16, 1)],
  term ((247952 : Rat) / 1767) [(0, 1), (4, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-195917 : Rat) / 589) [(0, 1), (4, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((912 : Rat) / 31) [(0, 1), (4, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-4028 : Rat) / 31) [(0, 1), (4, 1), (12, 1), (13, 2), (16, 1)],
  term ((27584 : Rat) / 589) [(0, 1), (4, 1), (12, 1), (14, 1), (16, 1)],
  term ((1714409 : Rat) / 3534) [(0, 1), (4, 1), (12, 1), (15, 2), (16, 1)],
  term ((-44860 : Rat) / 589) [(0, 1), (4, 1), (12, 1), (16, 1)],
  term ((380888 : Rat) / 1767) [(0, 1), (4, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((2280 : Rat) / 31) [(0, 1), (4, 1), (12, 2), (13, 2), (16, 1)],
  term ((-12064 : Rat) / 589) [(0, 1), (4, 1), (12, 2), (14, 1), (16, 1)],
  term ((-202462 : Rat) / 1767) [(0, 1), (4, 1), (12, 2), (15, 2), (16, 1)],
  term ((64176 : Rat) / 589) [(0, 1), (4, 1), (12, 2), (16, 1)],
  term ((2052 : Rat) / 31) [(0, 1), (4, 2), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((184258 : Rat) / 589) [(0, 1), (4, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-380 : Rat) / 31) [(0, 1), (4, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-139538 : Rat) / 1767) [(0, 1), (4, 2), (12, 1), (15, 2), (16, 1)],
  term ((456 : Rat) / 31) [(0, 1), (4, 2), (12, 1), (16, 1)],
  term ((-608 : Rat) / 31) [(0, 1), (4, 2), (12, 2), (16, 1)],
  term ((2096 : Rat) / 589) [(0, 1), (5, 1), (7, 1), (10, 1), (12, 1), (16, 1)],
  term ((456 : Rat) / 31) [(0, 1), (5, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((164116 : Rat) / 1767) [(0, 1), (5, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((-10528 : Rat) / 589) [(0, 1), (5, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((912 : Rat) / 31) [(0, 1), (5, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1976 : Rat) / 31) [(0, 1), (5, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((207008 : Rat) / 1767) [(0, 1), (5, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-106892 : Rat) / 589) [(0, 1), (5, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1824 : Rat) / 31) [(0, 1), (5, 1), (10, 1), (12, 2), (13, 1), (16, 1)],
  term ((-373072 : Rat) / 1767) [(0, 1), (5, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((304 : Rat) / 31) [(0, 1), (5, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-3960 : Rat) / 589) [(0, 1), (5, 1), (11, 1), (12, 1), (16, 1)],
  term ((-1024 : Rat) / 589) [(0, 1), (5, 1), (11, 1), (12, 2), (16, 1)],
  term ((1140 : Rat) / 31) [(0, 1), (5, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((1406 : Rat) / 31) [(0, 1), (5, 1), (12, 2), (13, 1), (16, 1)],
  term ((202462 : Rat) / 1767) [(0, 1), (5, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((2688 : Rat) / 589) [(0, 2), (3, 1), (10, 2), (15, 1), (16, 1)],
  term ((3840 : Rat) / 589) [(0, 2), (3, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((1536 : Rat) / 589) [(0, 2), (3, 1), (11, 1), (12, 1), (16, 1)],
  term ((-10205 : Rat) / 589) [(0, 2), (3, 1), (11, 1), (14, 1), (16, 1)],
  term ((-22745 : Rat) / 1178) [(0, 2), (3, 1), (11, 1), (16, 1)],
  term ((-20211 : Rat) / 589) [(0, 2), (3, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((918 : Rat) / 589) [(0, 2), (3, 1), (12, 1), (13, 1), (16, 1)],
  term ((-57669 : Rat) / 1178) [(0, 2), (3, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-38495 : Rat) / 1767) [(0, 2), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((288 : Rat) / 19) [(0, 2), (3, 1), (12, 2), (15, 1), (16, 1)],
  term ((-1365 : Rat) / 1178) [(0, 2), (3, 1), (13, 1), (14, 1), (16, 1)],
  term ((33285 : Rat) / 1178) [(0, 2), (3, 1), (13, 1), (14, 2), (16, 1)],
  term ((107870 : Rat) / 1767) [(0, 2), (3, 1), (13, 1), (15, 2), (16, 1)],
  term ((-20091 : Rat) / 1178) [(0, 2), (3, 1), (13, 1), (16, 1)],
  term ((-453 : Rat) / 589) [(0, 2), (3, 1), (13, 2), (15, 1), (16, 1)],
  term ((1143077 : Rat) / 7068) [(0, 2), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((-340711 : Rat) / 7068) [(0, 2), (3, 1), (14, 2), (15, 1), (16, 1)],
  term ((-496175 : Rat) / 7068) [(0, 2), (3, 1), (15, 1), (16, 1)],
  term ((47143 : Rat) / 7068) [(0, 2), (3, 1), (15, 3), (16, 1)],
  term ((6912 : Rat) / 589) [(0, 2), (3, 2), (4, 1), (10, 1), (16, 1)],
  term ((-4416 : Rat) / 589) [(0, 2), (3, 2), (4, 1), (12, 1), (16, 1)],
  term ((428 : Rat) / 589) [(0, 2), (3, 2), (4, 1), (16, 1)],
  term ((24 : Rat) / 589) [(0, 2), (3, 2), (4, 2), (16, 1)],
  term ((-13152 : Rat) / 589) [(0, 2), (3, 2), (5, 1), (7, 1), (16, 1)],
  term ((-4728 : Rat) / 589) [(0, 2), (3, 2), (5, 1), (9, 1), (16, 1)],
  term ((-8640 : Rat) / 589) [(0, 2), (3, 2), (5, 1), (13, 1), (16, 1)],
  term ((13368 : Rat) / 589) [(0, 2), (3, 2), (5, 1), (15, 1), (16, 1)],
  term ((3456 : Rat) / 589) [(0, 2), (3, 2), (7, 1), (13, 1), (16, 1)],
  term ((4320 : Rat) / 589) [(0, 2), (3, 2), (8, 1), (14, 1), (16, 1)],
  term ((2160 : Rat) / 589) [(0, 2), (3, 2), (8, 1), (16, 1)],
  term ((-228 : Rat) / 31) [(0, 2), (3, 2), (9, 1), (13, 1), (16, 1)],
  term ((-67874 : Rat) / 1767) [(0, 2), (3, 2), (9, 1), (15, 1), (16, 1)],
  term ((-3456 : Rat) / 589) [(0, 2), (3, 2), (10, 1), (14, 1), (16, 1)],
  term ((-4800 : Rat) / 589) [(0, 2), (3, 2), (10, 1), (16, 1)],
  term ((4128 : Rat) / 589) [(0, 2), (3, 2), (12, 1), (14, 1), (16, 1)],
  term ((3440 : Rat) / 589) [(0, 2), (3, 2), (12, 1), (16, 1)],
  term ((-45728 : Rat) / 1767) [(0, 2), (3, 2), (13, 1), (15, 1), (16, 1)],
  term ((-228 : Rat) / 31) [(0, 2), (3, 2), (13, 2), (16, 1)],
  term ((4532 : Rat) / 589) [(0, 2), (3, 2), (14, 1), (16, 1)],
  term ((-132 : Rat) / 589) [(0, 2), (3, 2), (14, 2), (16, 1)],
  term ((4188 : Rat) / 589) [(0, 2), (3, 2), (15, 2), (16, 1)],
  term ((-9528 : Rat) / 589) [(0, 2), (3, 2), (16, 1)],
  term ((-4728 : Rat) / 589) [(0, 2), (3, 3), (9, 1), (16, 1)],
  term ((-10368 : Rat) / 589) [(0, 2), (3, 3), (13, 1), (16, 1)],
  term ((399 : Rat) / 31) [(0, 2), (4, 1), (5, 1), (13, 1), (16, 1)],
  term ((-3948 : Rat) / 589) [(0, 2), (4, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((99817 : Rat) / 3534) [(0, 2), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((228 : Rat) / 31) [(0, 2), (4, 1), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((56870 : Rat) / 1767) [(0, 2), (4, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-2632 : Rat) / 589) [(0, 2), (4, 1), (7, 1), (11, 1), (16, 1)],
  term ((342 : Rat) / 31) [(0, 2), (4, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((18199 : Rat) / 589) [(0, 2), (4, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((5263 : Rat) / 62) [(0, 2), (4, 1), (7, 1), (13, 1), (16, 1)],
  term ((3090121 : Rat) / 7068) [(0, 2), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((-228 : Rat) / 31) [(0, 2), (4, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((456 : Rat) / 31) [(0, 2), (4, 1), (9, 1), (13, 1), (16, 1)],
  term ((-82058 : Rat) / 1767) [(0, 2), (4, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((164116 : Rat) / 1767) [(0, 2), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((-181016 : Rat) / 1767) [(0, 2), (4, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-912 : Rat) / 31) [(0, 2), (4, 1), (10, 1), (13, 2), (16, 1)],
  term ((103504 : Rat) / 1767) [(0, 2), (4, 1), (10, 1), (15, 2), (16, 1)],
  term ((6708 : Rat) / 589) [(0, 2), (4, 1), (10, 1), (16, 1)],
  term ((6824 : Rat) / 589) [(0, 2), (4, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-18713 : Rat) / 1178) [(0, 2), (4, 1), (11, 1), (13, 1), (16, 1)],
  term ((57047 : Rat) / 7068) [(0, 2), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((-5264 : Rat) / 589) [(0, 2), (4, 1), (11, 2), (16, 1)],
  term ((-190444 : Rat) / 1767) [(0, 2), (4, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1140 : Rat) / 31) [(0, 2), (4, 1), (12, 1), (13, 2), (16, 1)],
  term ((6032 : Rat) / 589) [(0, 2), (4, 1), (12, 1), (14, 1), (16, 1)],
  term ((101231 : Rat) / 1767) [(0, 2), (4, 1), (12, 1), (15, 2), (16, 1)],
  term ((-32088 : Rat) / 589) [(0, 2), (4, 1), (12, 1), (16, 1)],
  term ((-123976 : Rat) / 1767) [(0, 2), (4, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((195917 : Rat) / 1178) [(0, 2), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-456 : Rat) / 31) [(0, 2), (4, 1), (13, 2), (14, 1), (16, 1)],
  term ((2014 : Rat) / 31) [(0, 2), (4, 1), (13, 2), (16, 1)],
  term ((-13792 : Rat) / 589) [(0, 2), (4, 1), (14, 1), (16, 1)],
  term ((-1714409 : Rat) / 7068) [(0, 2), (4, 1), (15, 2), (16, 1)],
  term ((22430 : Rat) / 589) [(0, 2), (4, 1), (16, 1)],
  term ((-1026 : Rat) / 31) [(0, 2), (4, 2), (7, 1), (13, 1), (16, 1)],
  term ((-92129 : Rat) / 589) [(0, 2), (4, 2), (7, 1), (15, 1), (16, 1)],
  term ((304 : Rat) / 31) [(0, 2), (4, 2), (12, 1), (16, 1)],
  term ((190 : Rat) / 31) [(0, 2), (4, 2), (13, 1), (15, 1), (16, 1)],
  term ((69769 : Rat) / 1767) [(0, 2), (4, 2), (15, 2), (16, 1)],
  term ((-228 : Rat) / 31) [(0, 2), (4, 2), (16, 1)],
  term ((-1048 : Rat) / 589) [(0, 2), (5, 1), (7, 1), (10, 1), (16, 1)],
  term ((-228 : Rat) / 31) [(0, 2), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-82058 : Rat) / 1767) [(0, 2), (5, 1), (9, 1), (15, 2), (16, 1)],
  term ((5264 : Rat) / 589) [(0, 2), (5, 1), (10, 1), (11, 1), (16, 1)],
  term ((912 : Rat) / 31) [(0, 2), (5, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((186536 : Rat) / 1767) [(0, 2), (5, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-456 : Rat) / 31) [(0, 2), (5, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((988 : Rat) / 31) [(0, 2), (5, 1), (10, 1), (13, 1), (16, 1)],
  term ((-103504 : Rat) / 1767) [(0, 2), (5, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((53446 : Rat) / 589) [(0, 2), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((512 : Rat) / 589) [(0, 2), (5, 1), (11, 1), (12, 1), (16, 1)],
  term ((-152 : Rat) / 31) [(0, 2), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((1980 : Rat) / 589) [(0, 2), (5, 1), (11, 1), (16, 1)],
  term ((-570 : Rat) / 31) [(0, 2), (5, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-703 : Rat) / 31) [(0, 2), (5, 1), (12, 1), (13, 1), (16, 1)],
  term ((-101231 : Rat) / 1767) [(0, 2), (5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5376 : Rat) / 589) [(1, 1), (3, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-7680 : Rat) / 589) [(1, 1), (3, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-3072 : Rat) / 589) [(1, 1), (3, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((20410 : Rat) / 589) [(1, 1), (3, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((22745 : Rat) / 589) [(1, 1), (3, 1), (11, 1), (13, 1), (16, 1)],
  term ((57669 : Rat) / 589) [(1, 1), (3, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((76990 : Rat) / 1767) [(1, 1), (3, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((40422 : Rat) / 589) [(1, 1), (3, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-1836 : Rat) / 589) [(1, 1), (3, 1), (12, 1), (13, 2), (16, 1)],
  term ((-576 : Rat) / 19) [(1, 1), (3, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1143077 : Rat) / 3534) [(1, 1), (3, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((340711 : Rat) / 3534) [(1, 1), (3, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((496175 : Rat) / 3534) [(1, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term ((-47143 : Rat) / 3534) [(1, 1), (3, 1), (13, 1), (15, 3), (16, 1)],
  term ((1365 : Rat) / 589) [(1, 1), (3, 1), (13, 2), (14, 1), (16, 1)],
  term ((-33285 : Rat) / 589) [(1, 1), (3, 1), (13, 2), (14, 2), (16, 1)],
  term ((-215740 : Rat) / 1767) [(1, 1), (3, 1), (13, 2), (15, 2), (16, 1)],
  term ((20091 : Rat) / 589) [(1, 1), (3, 1), (13, 2), (16, 1)],
  term ((906 : Rat) / 589) [(1, 1), (3, 1), (13, 3), (15, 1), (16, 1)],
  term ((-13824 : Rat) / 589) [(1, 1), (3, 2), (4, 1), (10, 1), (13, 1), (16, 1)],
  term ((8832 : Rat) / 589) [(1, 1), (3, 2), (4, 1), (12, 1), (13, 1), (16, 1)],
  term ((-856 : Rat) / 589) [(1, 1), (3, 2), (4, 1), (13, 1), (16, 1)],
  term ((-48 : Rat) / 589) [(1, 1), (3, 2), (4, 2), (13, 1), (16, 1)],
  term ((26304 : Rat) / 589) [(1, 1), (3, 2), (5, 1), (7, 1), (13, 1), (16, 1)],
  term ((9456 : Rat) / 589) [(1, 1), (3, 2), (5, 1), (9, 1), (13, 1), (16, 1)],
  term ((-26736 : Rat) / 589) [(1, 1), (3, 2), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((17280 : Rat) / 589) [(1, 1), (3, 2), (5, 1), (13, 2), (16, 1)],
  term ((-6912 : Rat) / 589) [(1, 1), (3, 2), (7, 1), (13, 2), (16, 1)],
  term ((-8640 : Rat) / 589) [(1, 1), (3, 2), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((-4320 : Rat) / 589) [(1, 1), (3, 2), (8, 1), (13, 1), (16, 1)],
  term ((135748 : Rat) / 1767) [(1, 1), (3, 2), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((456 : Rat) / 31) [(1, 1), (3, 2), (9, 1), (13, 2), (16, 1)],
  term ((6912 : Rat) / 589) [(1, 1), (3, 2), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((9600 : Rat) / 589) [(1, 1), (3, 2), (10, 1), (13, 1), (16, 1)],
  term ((-8256 : Rat) / 589) [(1, 1), (3, 2), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-6880 : Rat) / 589) [(1, 1), (3, 2), (12, 1), (13, 1), (16, 1)],
  term ((-9064 : Rat) / 589) [(1, 1), (3, 2), (13, 1), (14, 1), (16, 1)],
  term ((264 : Rat) / 589) [(1, 1), (3, 2), (13, 1), (14, 2), (16, 1)],
  term ((-8376 : Rat) / 589) [(1, 1), (3, 2), (13, 1), (15, 2), (16, 1)],
  term ((19056 : Rat) / 589) [(1, 1), (3, 2), (13, 1), (16, 1)],
  term ((91456 : Rat) / 1767) [(1, 1), (3, 2), (13, 2), (15, 1), (16, 1)],
  term ((456 : Rat) / 31) [(1, 1), (3, 2), (13, 3), (16, 1)],
  term ((9456 : Rat) / 589) [(1, 1), (3, 3), (9, 1), (13, 1), (16, 1)],
  term ((20736 : Rat) / 589) [(1, 1), (3, 3), (13, 2), (16, 1)],
  term ((7896 : Rat) / 589) [(1, 1), (4, 1), (5, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-99817 : Rat) / 1767) [(1, 1), (4, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((-798 : Rat) / 31) [(1, 1), (4, 1), (5, 1), (13, 2), (16, 1)],
  term ((-113740 : Rat) / 1767) [(1, 1), (4, 1), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-456 : Rat) / 31) [(1, 1), (4, 1), (7, 1), (10, 1), (13, 2), (16, 1)],
  term ((5264 : Rat) / 589) [(1, 1), (4, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((-36398 : Rat) / 589) [(1, 1), (4, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-684 : Rat) / 31) [(1, 1), (4, 1), (7, 1), (12, 1), (13, 2), (16, 1)],
  term ((-3090121 : Rat) / 3534) [(1, 1), (4, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-5263 : Rat) / 31) [(1, 1), (4, 1), (7, 1), (13, 2), (16, 1)],
  term ((164116 : Rat) / 1767) [(1, 1), (4, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-328232 : Rat) / 1767) [(1, 1), (4, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((456 : Rat) / 31) [(1, 1), (4, 1), (9, 1), (13, 2), (14, 1), (16, 1)],
  term ((-912 : Rat) / 31) [(1, 1), (4, 1), (9, 1), (13, 2), (16, 1)],
  term ((-207008 : Rat) / 1767) [(1, 1), (4, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-13416 : Rat) / 589) [(1, 1), (4, 1), (10, 1), (13, 1), (16, 1)],
  term ((362032 : Rat) / 1767) [(1, 1), (4, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((1824 : Rat) / 31) [(1, 1), (4, 1), (10, 1), (13, 3), (16, 1)],
  term ((-13648 : Rat) / 589) [(1, 1), (4, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-57047 : Rat) / 3534) [(1, 1), (4, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((18713 : Rat) / 589) [(1, 1), (4, 1), (11, 1), (13, 2), (16, 1)],
  term ((10528 : Rat) / 589) [(1, 1), (4, 1), (11, 2), (13, 1), (16, 1)],
  term ((-12064 : Rat) / 589) [(1, 1), (4, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-202462 : Rat) / 1767) [(1, 1), (4, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((64176 : Rat) / 589) [(1, 1), (4, 1), (12, 1), (13, 1), (16, 1)],
  term ((380888 : Rat) / 1767) [(1, 1), (4, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((2280 : Rat) / 31) [(1, 1), (4, 1), (12, 1), (13, 3), (16, 1)],
  term ((27584 : Rat) / 589) [(1, 1), (4, 1), (13, 1), (14, 1), (16, 1)],
  term ((1714409 : Rat) / 3534) [(1, 1), (4, 1), (13, 1), (15, 2), (16, 1)],
  term ((-44860 : Rat) / 589) [(1, 1), (4, 1), (13, 1), (16, 1)],
  term ((247952 : Rat) / 1767) [(1, 1), (4, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-195917 : Rat) / 589) [(1, 1), (4, 1), (13, 2), (15, 1), (16, 1)],
  term ((912 : Rat) / 31) [(1, 1), (4, 1), (13, 3), (14, 1), (16, 1)],
  term ((-4028 : Rat) / 31) [(1, 1), (4, 1), (13, 3), (16, 1)],
  term ((184258 : Rat) / 589) [(1, 1), (4, 2), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((2052 : Rat) / 31) [(1, 1), (4, 2), (7, 1), (13, 2), (16, 1)],
  term ((-608 : Rat) / 31) [(1, 1), (4, 2), (12, 1), (13, 1), (16, 1)],
  term ((-139538 : Rat) / 1767) [(1, 1), (4, 2), (13, 1), (15, 2), (16, 1)],
  term ((456 : Rat) / 31) [(1, 1), (4, 2), (13, 1), (16, 1)],
  term ((-380 : Rat) / 31) [(1, 1), (4, 2), (13, 2), (15, 1), (16, 1)],
  term ((2096 : Rat) / 589) [(1, 1), (5, 1), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((164116 : Rat) / 1767) [(1, 1), (5, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((456 : Rat) / 31) [(1, 1), (5, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-10528 : Rat) / 589) [(1, 1), (5, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-373072 : Rat) / 1767) [(1, 1), (5, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1824 : Rat) / 31) [(1, 1), (5, 1), (10, 1), (12, 1), (13, 2), (16, 1)],
  term ((207008 : Rat) / 1767) [(1, 1), (5, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-106892 : Rat) / 589) [(1, 1), (5, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((912 : Rat) / 31) [(1, 1), (5, 1), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((-1976 : Rat) / 31) [(1, 1), (5, 1), (10, 1), (13, 2), (16, 1)],
  term ((-1024 : Rat) / 589) [(1, 1), (5, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((304 : Rat) / 31) [(1, 1), (5, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-3960 : Rat) / 589) [(1, 1), (5, 1), (11, 1), (13, 1), (16, 1)],
  term ((202462 : Rat) / 1767) [(1, 1), (5, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1140 : Rat) / 31) [(1, 1), (5, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((1406 : Rat) / 31) [(1, 1), (5, 1), (12, 1), (13, 2), (16, 1)],
  term ((2688 : Rat) / 589) [(1, 2), (3, 1), (10, 2), (15, 1), (16, 1)],
  term ((3840 : Rat) / 589) [(1, 2), (3, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((1536 : Rat) / 589) [(1, 2), (3, 1), (11, 1), (12, 1), (16, 1)],
  term ((-10205 : Rat) / 589) [(1, 2), (3, 1), (11, 1), (14, 1), (16, 1)],
  term ((-22745 : Rat) / 1178) [(1, 2), (3, 1), (11, 1), (16, 1)],
  term ((-20211 : Rat) / 589) [(1, 2), (3, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((918 : Rat) / 589) [(1, 2), (3, 1), (12, 1), (13, 1), (16, 1)],
  term ((-57669 : Rat) / 1178) [(1, 2), (3, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-38495 : Rat) / 1767) [(1, 2), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((288 : Rat) / 19) [(1, 2), (3, 1), (12, 2), (15, 1), (16, 1)],
  term ((-1365 : Rat) / 1178) [(1, 2), (3, 1), (13, 1), (14, 1), (16, 1)],
  term ((33285 : Rat) / 1178) [(1, 2), (3, 1), (13, 1), (14, 2), (16, 1)],
  term ((107870 : Rat) / 1767) [(1, 2), (3, 1), (13, 1), (15, 2), (16, 1)],
  term ((-20091 : Rat) / 1178) [(1, 2), (3, 1), (13, 1), (16, 1)],
  term ((-453 : Rat) / 589) [(1, 2), (3, 1), (13, 2), (15, 1), (16, 1)],
  term ((1143077 : Rat) / 7068) [(1, 2), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((-340711 : Rat) / 7068) [(1, 2), (3, 1), (14, 2), (15, 1), (16, 1)],
  term ((-496175 : Rat) / 7068) [(1, 2), (3, 1), (15, 1), (16, 1)],
  term ((47143 : Rat) / 7068) [(1, 2), (3, 1), (15, 3), (16, 1)],
  term ((6912 : Rat) / 589) [(1, 2), (3, 2), (4, 1), (10, 1), (16, 1)],
  term ((-4416 : Rat) / 589) [(1, 2), (3, 2), (4, 1), (12, 1), (16, 1)],
  term ((428 : Rat) / 589) [(1, 2), (3, 2), (4, 1), (16, 1)],
  term ((24 : Rat) / 589) [(1, 2), (3, 2), (4, 2), (16, 1)],
  term ((-13152 : Rat) / 589) [(1, 2), (3, 2), (5, 1), (7, 1), (16, 1)],
  term ((-4728 : Rat) / 589) [(1, 2), (3, 2), (5, 1), (9, 1), (16, 1)],
  term ((-8640 : Rat) / 589) [(1, 2), (3, 2), (5, 1), (13, 1), (16, 1)],
  term ((13368 : Rat) / 589) [(1, 2), (3, 2), (5, 1), (15, 1), (16, 1)],
  term ((3456 : Rat) / 589) [(1, 2), (3, 2), (7, 1), (13, 1), (16, 1)],
  term ((4320 : Rat) / 589) [(1, 2), (3, 2), (8, 1), (14, 1), (16, 1)],
  term ((2160 : Rat) / 589) [(1, 2), (3, 2), (8, 1), (16, 1)],
  term ((-228 : Rat) / 31) [(1, 2), (3, 2), (9, 1), (13, 1), (16, 1)],
  term ((-67874 : Rat) / 1767) [(1, 2), (3, 2), (9, 1), (15, 1), (16, 1)],
  term ((-3456 : Rat) / 589) [(1, 2), (3, 2), (10, 1), (14, 1), (16, 1)],
  term ((-4800 : Rat) / 589) [(1, 2), (3, 2), (10, 1), (16, 1)],
  term ((4128 : Rat) / 589) [(1, 2), (3, 2), (12, 1), (14, 1), (16, 1)],
  term ((3440 : Rat) / 589) [(1, 2), (3, 2), (12, 1), (16, 1)],
  term ((-45728 : Rat) / 1767) [(1, 2), (3, 2), (13, 1), (15, 1), (16, 1)],
  term ((-228 : Rat) / 31) [(1, 2), (3, 2), (13, 2), (16, 1)],
  term ((4532 : Rat) / 589) [(1, 2), (3, 2), (14, 1), (16, 1)],
  term ((-132 : Rat) / 589) [(1, 2), (3, 2), (14, 2), (16, 1)],
  term ((4188 : Rat) / 589) [(1, 2), (3, 2), (15, 2), (16, 1)],
  term ((-9528 : Rat) / 589) [(1, 2), (3, 2), (16, 1)],
  term ((-4728 : Rat) / 589) [(1, 2), (3, 3), (9, 1), (16, 1)],
  term ((-10368 : Rat) / 589) [(1, 2), (3, 3), (13, 1), (16, 1)],
  term ((399 : Rat) / 31) [(1, 2), (4, 1), (5, 1), (13, 1), (16, 1)],
  term ((-3948 : Rat) / 589) [(1, 2), (4, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((99817 : Rat) / 3534) [(1, 2), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((228 : Rat) / 31) [(1, 2), (4, 1), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((56870 : Rat) / 1767) [(1, 2), (4, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-2632 : Rat) / 589) [(1, 2), (4, 1), (7, 1), (11, 1), (16, 1)],
  term ((342 : Rat) / 31) [(1, 2), (4, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((18199 : Rat) / 589) [(1, 2), (4, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((5263 : Rat) / 62) [(1, 2), (4, 1), (7, 1), (13, 1), (16, 1)],
  term ((3090121 : Rat) / 7068) [(1, 2), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((-228 : Rat) / 31) [(1, 2), (4, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((456 : Rat) / 31) [(1, 2), (4, 1), (9, 1), (13, 1), (16, 1)],
  term ((-82058 : Rat) / 1767) [(1, 2), (4, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((164116 : Rat) / 1767) [(1, 2), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((-181016 : Rat) / 1767) [(1, 2), (4, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-912 : Rat) / 31) [(1, 2), (4, 1), (10, 1), (13, 2), (16, 1)],
  term ((103504 : Rat) / 1767) [(1, 2), (4, 1), (10, 1), (15, 2), (16, 1)],
  term ((6708 : Rat) / 589) [(1, 2), (4, 1), (10, 1), (16, 1)],
  term ((6824 : Rat) / 589) [(1, 2), (4, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-18713 : Rat) / 1178) [(1, 2), (4, 1), (11, 1), (13, 1), (16, 1)],
  term ((57047 : Rat) / 7068) [(1, 2), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((-5264 : Rat) / 589) [(1, 2), (4, 1), (11, 2), (16, 1)],
  term ((-190444 : Rat) / 1767) [(1, 2), (4, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1140 : Rat) / 31) [(1, 2), (4, 1), (12, 1), (13, 2), (16, 1)],
  term ((6032 : Rat) / 589) [(1, 2), (4, 1), (12, 1), (14, 1), (16, 1)],
  term ((101231 : Rat) / 1767) [(1, 2), (4, 1), (12, 1), (15, 2), (16, 1)],
  term ((-32088 : Rat) / 589) [(1, 2), (4, 1), (12, 1), (16, 1)],
  term ((-123976 : Rat) / 1767) [(1, 2), (4, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((195917 : Rat) / 1178) [(1, 2), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-456 : Rat) / 31) [(1, 2), (4, 1), (13, 2), (14, 1), (16, 1)],
  term ((2014 : Rat) / 31) [(1, 2), (4, 1), (13, 2), (16, 1)],
  term ((-13792 : Rat) / 589) [(1, 2), (4, 1), (14, 1), (16, 1)],
  term ((-1714409 : Rat) / 7068) [(1, 2), (4, 1), (15, 2), (16, 1)],
  term ((22430 : Rat) / 589) [(1, 2), (4, 1), (16, 1)],
  term ((-1026 : Rat) / 31) [(1, 2), (4, 2), (7, 1), (13, 1), (16, 1)],
  term ((-92129 : Rat) / 589) [(1, 2), (4, 2), (7, 1), (15, 1), (16, 1)],
  term ((304 : Rat) / 31) [(1, 2), (4, 2), (12, 1), (16, 1)],
  term ((190 : Rat) / 31) [(1, 2), (4, 2), (13, 1), (15, 1), (16, 1)],
  term ((69769 : Rat) / 1767) [(1, 2), (4, 2), (15, 2), (16, 1)],
  term ((-228 : Rat) / 31) [(1, 2), (4, 2), (16, 1)],
  term ((-1048 : Rat) / 589) [(1, 2), (5, 1), (7, 1), (10, 1), (16, 1)],
  term ((-228 : Rat) / 31) [(1, 2), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-82058 : Rat) / 1767) [(1, 2), (5, 1), (9, 1), (15, 2), (16, 1)],
  term ((5264 : Rat) / 589) [(1, 2), (5, 1), (10, 1), (11, 1), (16, 1)],
  term ((912 : Rat) / 31) [(1, 2), (5, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((186536 : Rat) / 1767) [(1, 2), (5, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-456 : Rat) / 31) [(1, 2), (5, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((988 : Rat) / 31) [(1, 2), (5, 1), (10, 1), (13, 1), (16, 1)],
  term ((-103504 : Rat) / 1767) [(1, 2), (5, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((53446 : Rat) / 589) [(1, 2), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((512 : Rat) / 589) [(1, 2), (5, 1), (11, 1), (12, 1), (16, 1)],
  term ((-152 : Rat) / 31) [(1, 2), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((1980 : Rat) / 589) [(1, 2), (5, 1), (11, 1), (16, 1)],
  term ((-570 : Rat) / 31) [(1, 2), (5, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-703 : Rat) / 31) [(1, 2), (5, 1), (12, 1), (13, 1), (16, 1)],
  term ((-101231 : Rat) / 1767) [(1, 2), (5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((5376 : Rat) / 589) [(3, 1), (10, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((5376 : Rat) / 589) [(3, 1), (10, 2), (13, 1), (15, 2), (16, 1)],
  term ((-2688 : Rat) / 589) [(3, 1), (10, 2), (14, 2), (15, 1), (16, 1)],
  term ((-2688 : Rat) / 589) [(3, 1), (10, 2), (15, 3), (16, 1)],
  term ((7680 : Rat) / 589) [(3, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((3072 : Rat) / 589) [(3, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3840 : Rat) / 589) [(3, 1), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-22745 : Rat) / 589) [(3, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-21946 : Rat) / 589) [(3, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((-3840 : Rat) / 589) [(3, 1), (11, 1), (12, 1), (14, 3), (16, 1)],
  term ((-1536 : Rat) / 589) [(3, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((3072 : Rat) / 589) [(3, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((7680 : Rat) / 589) [(3, 1), (11, 1), (12, 2), (14, 2), (16, 1)],
  term ((-20410 : Rat) / 589) [(3, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-22745 : Rat) / 589) [(3, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((10205 : Rat) / 589) [(3, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((22745 : Rat) / 1178) [(3, 1), (11, 1), (14, 2), (16, 1)],
  term ((10205 : Rat) / 589) [(3, 1), (11, 1), (14, 3), (16, 1)],
  term ((22745 : Rat) / 1178) [(3, 1), (11, 1), (15, 2), (16, 1)],
  term ((103366 : Rat) / 1767) [(3, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-20091 : Rat) / 589) [(3, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2283 : Rat) / 589) [(3, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((53496 : Rat) / 589) [(3, 1), (12, 1), (13, 1), (14, 3), (16, 1)],
  term ((-79744 : Rat) / 1767) [(3, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-41328 : Rat) / 589) [(3, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((1836 : Rat) / 589) [(3, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-496175 : Rat) / 3534) [(3, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((110075 : Rat) / 1767) [(3, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((13119 : Rat) / 38) [(3, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-83852 : Rat) / 1767) [(3, 1), (12, 1), (14, 3), (15, 1), (16, 1)],
  term ((38495 : Rat) / 1767) [(3, 1), (12, 1), (15, 3), (16, 1)],
  term ((1836 : Rat) / 589) [(3, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-40422 : Rat) / 589) [(3, 1), (12, 2), (13, 1), (14, 2), (16, 1)],
  term ((576 : Rat) / 19) [(3, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-76990 : Rat) / 1767) [(3, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-66597 : Rat) / 589) [(3, 1), (12, 2), (14, 2), (15, 1), (16, 1)],
  term ((-288 : Rat) / 19) [(3, 1), (12, 2), (15, 3), (16, 1)],
  term ((576 : Rat) / 19) [(3, 1), (12, 3), (14, 1), (15, 1), (16, 1)],
  term ((573586 : Rat) / 1767) [(3, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-328153 : Rat) / 1767) [(3, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((20091 : Rat) / 1178) [(3, 1), (13, 1), (14, 2), (16, 1)],
  term ((1365 : Rat) / 1178) [(3, 1), (13, 1), (14, 3), (16, 1)],
  term ((-33285 : Rat) / 1178) [(3, 1), (13, 1), (14, 4), (16, 1)],
  term ((-217951 : Rat) / 1767) [(3, 1), (13, 1), (15, 2), (16, 1)],
  term ((-56199 : Rat) / 1178) [(3, 1), (13, 1), (15, 4), (16, 1)],
  term ((-1365 : Rat) / 589) [(3, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((33738 : Rat) / 589) [(3, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((-20091 : Rat) / 589) [(3, 1), (13, 2), (15, 1), (16, 1)],
  term ((217099 : Rat) / 1767) [(3, 1), (13, 2), (15, 3), (16, 1)],
  term ((-906 : Rat) / 589) [(3, 1), (13, 3), (15, 2), (16, 1)],
  term ((-1143077 : Rat) / 7068) [(3, 1), (14, 1), (15, 3), (16, 1)],
  term ((496175 : Rat) / 7068) [(3, 1), (14, 2), (15, 1), (16, 1)],
  term ((24464 : Rat) / 589) [(3, 1), (14, 2), (15, 3), (16, 1)],
  term ((-1143077 : Rat) / 7068) [(3, 1), (14, 3), (15, 1), (16, 1)],
  term ((340711 : Rat) / 7068) [(3, 1), (14, 4), (15, 1), (16, 1)],
  term ((496175 : Rat) / 7068) [(3, 1), (15, 3), (16, 1)],
  term ((-47143 : Rat) / 7068) [(3, 1), (15, 5), (16, 1)],
  term ((13824 : Rat) / 589) [(3, 2), (4, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((13824 : Rat) / 589) [(3, 2), (4, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-6912 : Rat) / 589) [(3, 2), (4, 1), (10, 1), (14, 2), (16, 1)],
  term ((-6912 : Rat) / 589) [(3, 2), (4, 1), (10, 1), (15, 2), (16, 1)],
  term ((-8832 : Rat) / 589) [(3, 2), (4, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((856 : Rat) / 589) [(3, 2), (4, 1), (12, 1), (14, 1), (16, 1)],
  term ((4416 : Rat) / 589) [(3, 2), (4, 1), (12, 1), (14, 2), (16, 1)],
  term ((4416 : Rat) / 589) [(3, 2), (4, 1), (12, 1), (15, 2), (16, 1)],
  term ((-8832 : Rat) / 589) [(3, 2), (4, 1), (12, 2), (14, 1), (16, 1)],
  term ((856 : Rat) / 589) [(3, 2), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-428 : Rat) / 589) [(3, 2), (4, 1), (14, 2), (16, 1)],
  term ((-428 : Rat) / 589) [(3, 2), (4, 1), (15, 2), (16, 1)],
  term ((48 : Rat) / 589) [(3, 2), (4, 2), (12, 1), (14, 1), (16, 1)],
  term ((48 : Rat) / 589) [(3, 2), (4, 2), (13, 1), (15, 1), (16, 1)],
  term ((-24 : Rat) / 589) [(3, 2), (4, 2), (14, 2), (16, 1)],
  term ((-24 : Rat) / 589) [(3, 2), (4, 2), (15, 2), (16, 1)],
  term ((-26304 : Rat) / 589) [(3, 2), (5, 1), (7, 1), (12, 1), (14, 1), (16, 1)],
  term ((-26304 : Rat) / 589) [(3, 2), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((13152 : Rat) / 589) [(3, 2), (5, 1), (7, 1), (14, 2), (16, 1)],
  term ((13152 : Rat) / 589) [(3, 2), (5, 1), (7, 1), (15, 2), (16, 1)],
  term ((-9456 : Rat) / 589) [(3, 2), (5, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((-9456 : Rat) / 589) [(3, 2), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((4728 : Rat) / 589) [(3, 2), (5, 1), (9, 1), (14, 2), (16, 1)],
  term ((4728 : Rat) / 589) [(3, 2), (5, 1), (9, 1), (15, 2), (16, 1)],
  term ((-17280 : Rat) / 589) [(3, 2), (5, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((26736 : Rat) / 589) [(3, 2), (5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((8640 : Rat) / 589) [(3, 2), (5, 1), (13, 1), (14, 2), (16, 1)],
  term ((35376 : Rat) / 589) [(3, 2), (5, 1), (13, 1), (15, 2), (16, 1)],
  term ((-17280 : Rat) / 589) [(3, 2), (5, 1), (13, 2), (15, 1), (16, 1)],
  term ((-13368 : Rat) / 589) [(3, 2), (5, 1), (14, 2), (15, 1), (16, 1)],
  term ((-13368 : Rat) / 589) [(3, 2), (5, 1), (15, 3), (16, 1)],
  term ((6912 : Rat) / 589) [(3, 2), (7, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-3456 : Rat) / 589) [(3, 2), (7, 1), (13, 1), (14, 2), (16, 1)],
  term ((-3456 : Rat) / 589) [(3, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((6912 : Rat) / 589) [(3, 2), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((4320 : Rat) / 589) [(3, 2), (8, 1), (12, 1), (14, 1), (16, 1)],
  term ((8640 : Rat) / 589) [(3, 2), (8, 1), (12, 1), (14, 2), (16, 1)],
  term ((8640 : Rat) / 589) [(3, 2), (8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((4320 : Rat) / 589) [(3, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4320 : Rat) / 589) [(3, 2), (8, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2160 : Rat) / 589) [(3, 2), (8, 1), (14, 2), (16, 1)],
  term ((-4320 : Rat) / 589) [(3, 2), (8, 1), (14, 3), (16, 1)],
  term ((-2160 : Rat) / 589) [(3, 2), (8, 1), (15, 2), (16, 1)],
  term ((-456 : Rat) / 31) [(3, 2), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-135748 : Rat) / 1767) [(3, 2), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((228 : Rat) / 31) [(3, 2), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((-122752 : Rat) / 1767) [(3, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-456 : Rat) / 31) [(3, 2), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((67874 : Rat) / 1767) [(3, 2), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((67874 : Rat) / 1767) [(3, 2), (9, 1), (15, 3), (16, 1)],
  term ((-9600 : Rat) / 589) [(3, 2), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-6912 : Rat) / 589) [(3, 2), (10, 1), (12, 1), (14, 2), (16, 1)],
  term ((-6912 : Rat) / 589) [(3, 2), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-9600 : Rat) / 589) [(3, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((3456 : Rat) / 589) [(3, 2), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((4800 : Rat) / 589) [(3, 2), (10, 1), (14, 2), (16, 1)],
  term ((3456 : Rat) / 589) [(3, 2), (10, 1), (14, 3), (16, 1)],
  term ((4800 : Rat) / 589) [(3, 2), (10, 1), (15, 2), (16, 1)],
  term ((-66688 : Rat) / 1767) [(3, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((6880 : Rat) / 589) [(3, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-456 : Rat) / 31) [(3, 2), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((4248 : Rat) / 589) [(3, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-19056 : Rat) / 589) [(3, 2), (12, 1), (14, 1), (16, 1)],
  term ((296 : Rat) / 31) [(3, 2), (12, 1), (14, 2), (16, 1)],
  term ((-4392 : Rat) / 589) [(3, 2), (12, 1), (14, 3), (16, 1)],
  term ((-3440 : Rat) / 589) [(3, 2), (12, 1), (15, 2), (16, 1)],
  term ((6880 : Rat) / 589) [(3, 2), (12, 2), (14, 1), (16, 1)],
  term ((8256 : Rat) / 589) [(3, 2), (12, 2), (14, 2), (16, 1)],
  term ((9064 : Rat) / 589) [(3, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((44936 : Rat) / 1767) [(3, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-19056 : Rat) / 589) [(3, 2), (13, 1), (15, 1), (16, 1)],
  term ((70856 : Rat) / 1767) [(3, 2), (13, 1), (15, 3), (16, 1)],
  term ((228 : Rat) / 31) [(3, 2), (13, 2), (14, 2), (16, 1)],
  term ((-78460 : Rat) / 1767) [(3, 2), (13, 2), (15, 2), (16, 1)],
  term ((-456 : Rat) / 31) [(3, 2), (13, 3), (15, 1), (16, 1)],
  term ((-4532 : Rat) / 589) [(3, 2), (14, 1), (15, 2), (16, 1)],
  term ((-4056 : Rat) / 589) [(3, 2), (14, 2), (15, 2), (16, 1)],
  term ((9528 : Rat) / 589) [(3, 2), (14, 2), (16, 1)],
  term ((-4532 : Rat) / 589) [(3, 2), (14, 3), (16, 1)],
  term ((132 : Rat) / 589) [(3, 2), (14, 4), (16, 1)],
  term ((9528 : Rat) / 589) [(3, 2), (15, 2), (16, 1)],
  term ((-4188 : Rat) / 589) [(3, 2), (15, 4), (16, 1)],
  term ((-9456 : Rat) / 589) [(3, 3), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((-9456 : Rat) / 589) [(3, 3), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((4728 : Rat) / 589) [(3, 3), (9, 1), (14, 2), (16, 1)],
  term ((4728 : Rat) / 589) [(3, 3), (9, 1), (15, 2), (16, 1)],
  term ((-20736 : Rat) / 589) [(3, 3), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((10368 : Rat) / 589) [(3, 3), (13, 1), (14, 2), (16, 1)],
  term ((10368 : Rat) / 589) [(3, 3), (13, 1), (15, 2), (16, 1)],
  term ((-20736 : Rat) / 589) [(3, 3), (13, 2), (15, 1), (16, 1)],
  term ((798 : Rat) / 31) [(4, 1), (5, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((99817 : Rat) / 1767) [(4, 1), (5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-7896 : Rat) / 589) [(4, 1), (5, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-7896 : Rat) / 589) [(4, 1), (5, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-399 : Rat) / 31) [(4, 1), (5, 1), (13, 1), (14, 2), (16, 1)],
  term ((77074 : Rat) / 1767) [(4, 1), (5, 1), (13, 1), (15, 2), (16, 1)],
  term ((798 : Rat) / 31) [(4, 1), (5, 1), (13, 2), (15, 1), (16, 1)],
  term ((3948 : Rat) / 589) [(4, 1), (5, 1), (14, 1), (15, 3), (16, 1)],
  term ((-99817 : Rat) / 3534) [(4, 1), (5, 1), (14, 2), (15, 1), (16, 1)],
  term ((3948 : Rat) / 589) [(4, 1), (5, 1), (14, 3), (15, 1), (16, 1)],
  term ((-99817 : Rat) / 3534) [(4, 1), (5, 1), (15, 3), (16, 1)],
  term ((456 : Rat) / 31) [(4, 1), (7, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((113740 : Rat) / 1767) [(4, 1), (7, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-228 : Rat) / 31) [(4, 1), (7, 1), (10, 1), (13, 1), (14, 2), (16, 1)],
  term ((100744 : Rat) / 1767) [(4, 1), (7, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((456 : Rat) / 31) [(4, 1), (7, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-56870 : Rat) / 1767) [(4, 1), (7, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((-56870 : Rat) / 1767) [(4, 1), (7, 1), (10, 1), (15, 3), (16, 1)],
  term ((-5264 : Rat) / 589) [(4, 1), (7, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-5264 : Rat) / 589) [(4, 1), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((2632 : Rat) / 589) [(4, 1), (7, 1), (11, 1), (14, 2), (16, 1)],
  term ((2632 : Rat) / 589) [(4, 1), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((5263 : Rat) / 31) [(4, 1), (7, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-342 : Rat) / 31) [(4, 1), (7, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((29900 : Rat) / 589) [(4, 1), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((684 : Rat) / 31) [(4, 1), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((3090121 : Rat) / 3534) [(4, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-18199 : Rat) / 589) [(4, 1), (7, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-18199 : Rat) / 589) [(4, 1), (7, 1), (12, 1), (15, 3), (16, 1)],
  term ((684 : Rat) / 31) [(4, 1), (7, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((36398 : Rat) / 589) [(4, 1), (7, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-5263 : Rat) / 62) [(4, 1), (7, 1), (13, 1), (14, 2), (16, 1)],
  term ((1395065 : Rat) / 1767) [(4, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((5263 : Rat) / 31) [(4, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-3090121 : Rat) / 7068) [(4, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((-3090121 : Rat) / 7068) [(4, 1), (7, 1), (15, 3), (16, 1)],
  term ((912 : Rat) / 31) [(4, 1), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-456 : Rat) / 31) [(4, 1), (9, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((328232 : Rat) / 1767) [(4, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-164116 : Rat) / 1767) [(4, 1), (9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-151120 : Rat) / 1767) [(4, 1), (9, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-456 : Rat) / 31) [(4, 1), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((228 : Rat) / 31) [(4, 1), (9, 1), (13, 1), (14, 3), (16, 1)],
  term ((302240 : Rat) / 1767) [(4, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-456 : Rat) / 31) [(4, 1), (9, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((912 : Rat) / 31) [(4, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((82058 : Rat) / 1767) [(4, 1), (9, 1), (14, 1), (15, 3), (16, 1)],
  term ((-164116 : Rat) / 1767) [(4, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((82058 : Rat) / 1767) [(4, 1), (9, 1), (14, 3), (15, 1), (16, 1)],
  term ((-164116 : Rat) / 1767) [(4, 1), (9, 1), (15, 3), (16, 1)],
  term ((-362032 : Rat) / 1767) [(4, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1824 : Rat) / 31) [(4, 1), (10, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((207008 : Rat) / 1767) [(4, 1), (10, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((13416 : Rat) / 589) [(4, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((181016 : Rat) / 1767) [(4, 1), (10, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((13416 : Rat) / 589) [(4, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((388024 : Rat) / 1767) [(4, 1), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((912 : Rat) / 31) [(4, 1), (10, 1), (13, 2), (14, 2), (16, 1)],
  term ((-310048 : Rat) / 1767) [(4, 1), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((-1824 : Rat) / 31) [(4, 1), (10, 1), (13, 3), (15, 1), (16, 1)],
  term ((-103504 : Rat) / 1767) [(4, 1), (10, 1), (14, 2), (15, 2), (16, 1)],
  term ((-6708 : Rat) / 589) [(4, 1), (10, 1), (14, 2), (16, 1)],
  term ((-6708 : Rat) / 589) [(4, 1), (10, 1), (15, 2), (16, 1)],
  term ((-103504 : Rat) / 1767) [(4, 1), (10, 1), (15, 4), (16, 1)],
  term ((-18713 : Rat) / 589) [(4, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((13648 : Rat) / 589) [(4, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((57047 : Rat) / 3534) [(4, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6824 : Rat) / 589) [(4, 1), (11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-6824 : Rat) / 589) [(4, 1), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((13648 : Rat) / 589) [(4, 1), (11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((18713 : Rat) / 1178) [(4, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((56593 : Rat) / 1767) [(4, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-18713 : Rat) / 589) [(4, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-57047 : Rat) / 7068) [(4, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-57047 : Rat) / 7068) [(4, 1), (11, 1), (15, 3), (16, 1)],
  term ((-10528 : Rat) / 589) [(4, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((-10528 : Rat) / 589) [(4, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((5264 : Rat) / 589) [(4, 1), (11, 2), (14, 2), (16, 1)],
  term ((5264 : Rat) / 589) [(4, 1), (11, 2), (15, 2), (16, 1)],
  term ((207981 : Rat) / 589) [(4, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-57508 : Rat) / 1767) [(4, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-64176 : Rat) / 589) [(4, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((392906 : Rat) / 1767) [(4, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((4028 : Rat) / 31) [(4, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((228 : Rat) / 31) [(4, 1), (12, 1), (13, 2), (14, 2), (16, 1)],
  term ((-315908 : Rat) / 1767) [(4, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-2280 : Rat) / 31) [(4, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-56471 : Rat) / 114) [(4, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((44860 : Rat) / 589) [(4, 1), (12, 1), (14, 1), (16, 1)],
  term ((-101231 : Rat) / 1767) [(4, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((4504 : Rat) / 589) [(4, 1), (12, 1), (14, 2), (16, 1)],
  term ((-6032 : Rat) / 589) [(4, 1), (12, 1), (14, 3), (16, 1)],
  term ((32088 : Rat) / 589) [(4, 1), (12, 1), (15, 2), (16, 1)],
  term ((-101231 : Rat) / 1767) [(4, 1), (12, 1), (15, 4), (16, 1)],
  term ((-380888 : Rat) / 1767) [(4, 1), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2280 : Rat) / 31) [(4, 1), (12, 2), (13, 2), (14, 1), (16, 1)],
  term ((202462 : Rat) / 1767) [(4, 1), (12, 2), (14, 1), (15, 2), (16, 1)],
  term ((-64176 : Rat) / 589) [(4, 1), (12, 2), (14, 1), (16, 1)],
  term ((12064 : Rat) / 589) [(4, 1), (12, 2), (14, 2), (16, 1)],
  term ((-27584 : Rat) / 589) [(4, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((123976 : Rat) / 1767) [(4, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-195917 : Rat) / 1178) [(4, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((123976 : Rat) / 1767) [(4, 1), (13, 1), (14, 3), (15, 1), (16, 1)],
  term ((44860 : Rat) / 589) [(4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1151080 : Rat) / 1767) [(4, 1), (13, 1), (15, 3), (16, 1)],
  term ((-7160 : Rat) / 57) [(4, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-2014 : Rat) / 31) [(4, 1), (13, 2), (14, 2), (16, 1)],
  term ((456 : Rat) / 31) [(4, 1), (13, 2), (14, 3), (16, 1)],
  term ((157651 : Rat) / 589) [(4, 1), (13, 2), (15, 2), (16, 1)],
  term ((-912 : Rat) / 31) [(4, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((4028 : Rat) / 31) [(4, 1), (13, 3), (15, 1), (16, 1)],
  term ((13792 : Rat) / 589) [(4, 1), (14, 1), (15, 2), (16, 1)],
  term ((1714409 : Rat) / 7068) [(4, 1), (14, 2), (15, 2), (16, 1)],
  term ((-22430 : Rat) / 589) [(4, 1), (14, 2), (16, 1)],
  term ((13792 : Rat) / 589) [(4, 1), (14, 3), (16, 1)],
  term ((-22430 : Rat) / 589) [(4, 1), (15, 2), (16, 1)],
  term ((1714409 : Rat) / 7068) [(4, 1), (15, 4), (16, 1)],
  term ((-2052 : Rat) / 31) [(4, 2), (7, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-184258 : Rat) / 589) [(4, 2), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((1026 : Rat) / 31) [(4, 2), (7, 1), (13, 1), (14, 2), (16, 1)],
  term ((-164764 : Rat) / 589) [(4, 2), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-2052 : Rat) / 31) [(4, 2), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((92129 : Rat) / 589) [(4, 2), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((92129 : Rat) / 589) [(4, 2), (7, 1), (15, 3), (16, 1)],
  term ((380 : Rat) / 31) [(4, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((608 : Rat) / 31) [(4, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((139538 : Rat) / 1767) [(4, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-456 : Rat) / 31) [(4, 2), (12, 1), (14, 1), (16, 1)],
  term ((-304 : Rat) / 31) [(4, 2), (12, 1), (14, 2), (16, 1)],
  term ((-304 : Rat) / 31) [(4, 2), (12, 1), (15, 2), (16, 1)],
  term ((608 : Rat) / 31) [(4, 2), (12, 2), (14, 1), (16, 1)],
  term ((-190 : Rat) / 31) [(4, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-456 : Rat) / 31) [(4, 2), (13, 1), (15, 1), (16, 1)],
  term ((128708 : Rat) / 1767) [(4, 2), (13, 1), (15, 3), (16, 1)],
  term ((380 : Rat) / 31) [(4, 2), (13, 2), (15, 2), (16, 1)],
  term ((-69769 : Rat) / 1767) [(4, 2), (14, 2), (15, 2), (16, 1)],
  term ((228 : Rat) / 31) [(4, 2), (14, 2), (16, 1)],
  term ((228 : Rat) / 31) [(4, 2), (15, 2), (16, 1)],
  term ((-69769 : Rat) / 1767) [(4, 2), (15, 4), (16, 1)],
  term ((-2096 : Rat) / 589) [(5, 1), (7, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-2096 : Rat) / 589) [(5, 1), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((1048 : Rat) / 589) [(5, 1), (7, 1), (10, 1), (14, 2), (16, 1)],
  term ((1048 : Rat) / 589) [(5, 1), (7, 1), (10, 1), (15, 2), (16, 1)],
  term ((-456 : Rat) / 31) [(5, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-164116 : Rat) / 1767) [(5, 1), (9, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((228 : Rat) / 31) [(5, 1), (9, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-151120 : Rat) / 1767) [(5, 1), (9, 1), (13, 1), (15, 3), (16, 1)],
  term ((-456 : Rat) / 31) [(5, 1), (9, 1), (13, 2), (15, 2), (16, 1)],
  term ((82058 : Rat) / 1767) [(5, 1), (9, 1), (14, 2), (15, 2), (16, 1)],
  term ((82058 : Rat) / 1767) [(5, 1), (9, 1), (15, 4), (16, 1)],
  term ((10528 : Rat) / 589) [(5, 1), (10, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((10528 : Rat) / 589) [(5, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-5264 : Rat) / 589) [(5, 1), (10, 1), (11, 1), (14, 2), (16, 1)],
  term ((-5264 : Rat) / 589) [(5, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((1976 : Rat) / 31) [(5, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1824 : Rat) / 31) [(5, 1), (10, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((321088 : Rat) / 1767) [(5, 1), (10, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((1824 : Rat) / 31) [(5, 1), (10, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((106892 : Rat) / 589) [(5, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-393544 : Rat) / 1767) [(5, 1), (10, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-186536 : Rat) / 1767) [(5, 1), (10, 1), (12, 1), (15, 3), (16, 1)],
  term ((1824 : Rat) / 31) [(5, 1), (10, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((373072 : Rat) / 1767) [(5, 1), (10, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-181016 : Rat) / 1767) [(5, 1), (10, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-988 : Rat) / 31) [(5, 1), (10, 1), (13, 1), (14, 2), (16, 1)],
  term ((456 : Rat) / 31) [(5, 1), (10, 1), (13, 1), (14, 3), (16, 1)],
  term ((88120 : Rat) / 589) [(5, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-912 : Rat) / 31) [(5, 1), (10, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((1976 : Rat) / 31) [(5, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((103504 : Rat) / 1767) [(5, 1), (10, 1), (14, 1), (15, 3), (16, 1)],
  term ((-53446 : Rat) / 589) [(5, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((103504 : Rat) / 1767) [(5, 1), (10, 1), (14, 3), (15, 1), (16, 1)],
  term ((-53446 : Rat) / 589) [(5, 1), (10, 1), (15, 3), (16, 1)],
  term ((1024 : Rat) / 589) [(5, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((3960 : Rat) / 589) [(5, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-6288 : Rat) / 589) [(5, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((-512 : Rat) / 589) [(5, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((1024 : Rat) / 589) [(5, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((-304 : Rat) / 31) [(5, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((3960 : Rat) / 589) [(5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((152 : Rat) / 31) [(5, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1980 : Rat) / 589) [(5, 1), (11, 1), (14, 2), (16, 1)],
  term ((152 : Rat) / 31) [(5, 1), (11, 1), (14, 3), (16, 1)],
  term ((-1980 : Rat) / 589) [(5, 1), (11, 1), (15, 2), (16, 1)],
  term ((-169972 : Rat) / 1767) [(5, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((703 : Rat) / 31) [(5, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((570 : Rat) / 31) [(5, 1), (12, 1), (13, 1), (14, 3), (16, 1)],
  term ((703 : Rat) / 31) [(5, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1140 : Rat) / 31) [(5, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1406 : Rat) / 31) [(5, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((101231 : Rat) / 1767) [(5, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((101231 : Rat) / 1767) [(5, 1), (12, 1), (14, 3), (15, 1), (16, 1)],
  term ((-1406 : Rat) / 31) [(5, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-1140 : Rat) / 31) [(5, 1), (12, 2), (13, 1), (14, 2), (16, 1)],
  term ((-202462 : Rat) / 1767) [(5, 1), (12, 2), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 27, terms 300 through 399. -/
theorem rs_R009_ueqv_R009NNNNN_block_27_0300_0399_valid :
    checkProductSumEq rs_R009_ueqv_R009NNNNN_partials_27_0300_0399
      rs_R009_ueqv_R009NNNNN_block_27_0300_0399 = true := by
  native_decide

end R009UeqvR009NNNNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
