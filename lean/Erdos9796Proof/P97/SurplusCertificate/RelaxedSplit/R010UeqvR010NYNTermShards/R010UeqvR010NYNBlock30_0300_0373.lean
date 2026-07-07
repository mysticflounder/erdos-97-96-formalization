/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R010:u=v:R010NYN, term block 30:300-373

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R010UeqvR010NYNTermShards

/-- Generator polynomial 30 for relaxed split surplus certificate `R010:u=v:R010NYN`. -/
def rs_R010_ueqv_R010NYN_generator_30_0300_0373 : Poly :=
[
  term (2 : Rat) [(12, 1), (14, 1)],
  term (-1 : Rat) [(12, 2)],
  term (2 : Rat) [(13, 1), (15, 1)],
  term (-1 : Rat) [(13, 2)]
]

/-- Coefficient term 300 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0300 : Poly :=
[
  term ((-160704 : Rat) / 2995) [(9, 1), (10, 1), (11, 1)]
]

/-- Partial product 300 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0300 : Poly :=
[
  term ((-321408 : Rat) / 2995) [(9, 1), (10, 1), (11, 1), (12, 1), (14, 1)],
  term ((160704 : Rat) / 2995) [(9, 1), (10, 1), (11, 1), (12, 2)],
  term ((-321408 : Rat) / 2995) [(9, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((160704 : Rat) / 2995) [(9, 1), (10, 1), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 300 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0300_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0300
        rs_R010_ueqv_R010NYN_generator_30_0300_0373 =
      rs_R010_ueqv_R010NYN_partial_30_0300 := by
  native_decide

/-- Coefficient term 301 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0301 : Poly :=
[
  term ((189072 : Rat) / 2995) [(9, 1), (10, 1), (15, 1)]
]

/-- Partial product 301 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0301 : Poly :=
[
  term ((378144 : Rat) / 2995) [(9, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((-189072 : Rat) / 2995) [(9, 1), (10, 1), (12, 2), (15, 1)],
  term ((378144 : Rat) / 2995) [(9, 1), (10, 1), (13, 1), (15, 2)],
  term ((-189072 : Rat) / 2995) [(9, 1), (10, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 301 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0301_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0301
        rs_R010_ueqv_R010NYN_generator_30_0300_0373 =
      rs_R010_ueqv_R010NYN_partial_30_0301 := by
  native_decide

/-- Coefficient term 302 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0302 : Poly :=
[
  term ((-51 : Rat) / 5) [(9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 302 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0302 : Poly :=
[
  term ((-102 : Rat) / 5) [(9, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((51 : Rat) / 5) [(9, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-102 : Rat) / 5) [(9, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((51 : Rat) / 5) [(9, 1), (10, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 302 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0302_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0302
        rs_R010_ueqv_R010NYN_generator_30_0300_0373 =
      rs_R010_ueqv_R010NYN_partial_30_0302 := by
  native_decide

/-- Coefficient term 303 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0303 : Poly :=
[
  term ((3448896 : Rat) / 2995) [(9, 1), (11, 1)]
]

/-- Partial product 303 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0303 : Poly :=
[
  term ((6897792 : Rat) / 2995) [(9, 1), (11, 1), (12, 1), (14, 1)],
  term ((-3448896 : Rat) / 2995) [(9, 1), (11, 1), (12, 2)],
  term ((6897792 : Rat) / 2995) [(9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-3448896 : Rat) / 2995) [(9, 1), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 303 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0303_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0303
        rs_R010_ueqv_R010NYN_generator_30_0300_0373 =
      rs_R010_ueqv_R010NYN_partial_30_0303 := by
  native_decide

/-- Coefficient term 304 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0304 : Poly :=
[
  term ((-67488 : Rat) / 2995) [(9, 1), (11, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 304 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0304 : Poly :=
[
  term ((-134976 : Rat) / 2995) [(9, 1), (11, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((67488 : Rat) / 2995) [(9, 1), (11, 1), (12, 2), (13, 1), (14, 1), (15, 1)],
  term ((-134976 : Rat) / 2995) [(9, 1), (11, 1), (13, 2), (14, 1), (15, 2)],
  term ((67488 : Rat) / 2995) [(9, 1), (11, 1), (13, 3), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 304 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0304_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0304
        rs_R010_ueqv_R010NYN_generator_30_0300_0373 =
      rs_R010_ueqv_R010NYN_partial_30_0304 := by
  native_decide

/-- Coefficient term 305 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0305 : Poly :=
[
  term ((-8 : Rat) / 5) [(9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 305 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0305 : Poly :=
[
  term ((-16 : Rat) / 5) [(9, 1), (11, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((8 : Rat) / 5) [(9, 1), (11, 1), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-16 : Rat) / 5) [(9, 1), (11, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((8 : Rat) / 5) [(9, 1), (11, 1), (13, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 305 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0305_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0305
        rs_R010_ueqv_R010NYN_generator_30_0300_0373 =
      rs_R010_ueqv_R010NYN_partial_30_0305 := by
  native_decide

/-- Coefficient term 306 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0306 : Poly :=
[
  term ((1189056 : Rat) / 2995) [(9, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 306 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0306 : Poly :=
[
  term ((2378112 : Rat) / 2995) [(9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-1189056 : Rat) / 2995) [(9, 1), (11, 1), (12, 2), (13, 1), (15, 1)],
  term ((2378112 : Rat) / 2995) [(9, 1), (11, 1), (13, 2), (15, 2)],
  term ((-1189056 : Rat) / 2995) [(9, 1), (11, 1), (13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 306 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0306_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0306
        rs_R010_ueqv_R010NYN_generator_30_0300_0373 =
      rs_R010_ueqv_R010NYN_partial_30_0306 := by
  native_decide

/-- Coefficient term 307 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0307 : Poly :=
[
  term (-58 : Rat) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 307 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0307 : Poly :=
[
  term (-116 : Rat) [(9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term (58 : Rat) [(9, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term (-116 : Rat) [(9, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term (58 : Rat) [(9, 1), (11, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 307 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0307_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0307
        rs_R010_ueqv_R010NYN_generator_30_0300_0373 =
      rs_R010_ueqv_R010NYN_partial_30_0307 := by
  native_decide

/-- Coefficient term 308 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0308 : Poly :=
[
  term ((-40176 : Rat) / 2995) [(9, 1), (11, 1), (14, 1)]
]

/-- Partial product 308 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0308 : Poly :=
[
  term ((-80352 : Rat) / 2995) [(9, 1), (11, 1), (12, 1), (14, 2)],
  term ((40176 : Rat) / 2995) [(9, 1), (11, 1), (12, 2), (14, 1)],
  term ((-80352 : Rat) / 2995) [(9, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((40176 : Rat) / 2995) [(9, 1), (11, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 308 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0308_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0308
        rs_R010_ueqv_R010NYN_generator_30_0300_0373 =
      rs_R010_ueqv_R010NYN_partial_30_0308 := by
  native_decide

/-- Coefficient term 309 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0309 : Poly :=
[
  term ((-1747872 : Rat) / 2995) [(9, 1), (11, 1), (15, 2)]
]

/-- Partial product 309 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0309 : Poly :=
[
  term ((-3495744 : Rat) / 2995) [(9, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((1747872 : Rat) / 2995) [(9, 1), (11, 1), (12, 2), (15, 2)],
  term ((-3495744 : Rat) / 2995) [(9, 1), (11, 1), (13, 1), (15, 3)],
  term ((1747872 : Rat) / 2995) [(9, 1), (11, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 309 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0309_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0309
        rs_R010_ueqv_R010NYN_generator_30_0300_0373 =
      rs_R010_ueqv_R010NYN_partial_30_0309 := by
  native_decide

/-- Coefficient term 310 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0310 : Poly :=
[
  term (66 : Rat) [(9, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 310 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0310 : Poly :=
[
  term (132 : Rat) [(9, 1), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term (-66 : Rat) [(9, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term (132 : Rat) [(9, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term (-66 : Rat) [(9, 1), (11, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 310 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0310_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0310
        rs_R010_ueqv_R010NYN_generator_30_0300_0373 =
      rs_R010_ueqv_R010NYN_partial_30_0310 := by
  native_decide

/-- Coefficient term 311 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0311 : Poly :=
[
  term ((-214272 : Rat) / 599) [(9, 1), (11, 2), (13, 1)]
]

/-- Partial product 311 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0311 : Poly :=
[
  term ((-428544 : Rat) / 599) [(9, 1), (11, 2), (12, 1), (13, 1), (14, 1)],
  term ((214272 : Rat) / 599) [(9, 1), (11, 2), (12, 2), (13, 1)],
  term ((-428544 : Rat) / 599) [(9, 1), (11, 2), (13, 2), (15, 1)],
  term ((214272 : Rat) / 599) [(9, 1), (11, 2), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 311 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0311_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0311
        rs_R010_ueqv_R010NYN_generator_30_0300_0373 =
      rs_R010_ueqv_R010NYN_partial_30_0311 := by
  native_decide

/-- Coefficient term 312 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0312 : Poly :=
[
  term ((53568 : Rat) / 2995) [(9, 1), (11, 2), (13, 1), (14, 1)]
]

/-- Partial product 312 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0312 : Poly :=
[
  term ((107136 : Rat) / 2995) [(9, 1), (11, 2), (12, 1), (13, 1), (14, 2)],
  term ((-53568 : Rat) / 2995) [(9, 1), (11, 2), (12, 2), (13, 1), (14, 1)],
  term ((107136 : Rat) / 2995) [(9, 1), (11, 2), (13, 2), (14, 1), (15, 1)],
  term ((-53568 : Rat) / 2995) [(9, 1), (11, 2), (13, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 312 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0312_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0312
        rs_R010_ueqv_R010NYN_generator_30_0300_0373 =
      rs_R010_ueqv_R010NYN_partial_30_0312 := by
  native_decide

/-- Coefficient term 313 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0313 : Poly :=
[
  term ((4340736 : Rat) / 2995) [(9, 1), (11, 2), (15, 1)]
]

/-- Partial product 313 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0313 : Poly :=
[
  term ((8681472 : Rat) / 2995) [(9, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((-4340736 : Rat) / 2995) [(9, 1), (11, 2), (12, 2), (15, 1)],
  term ((8681472 : Rat) / 2995) [(9, 1), (11, 2), (13, 1), (15, 2)],
  term ((-4340736 : Rat) / 2995) [(9, 1), (11, 2), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 313 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0313_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0313
        rs_R010_ueqv_R010NYN_generator_30_0300_0373 =
      rs_R010_ueqv_R010NYN_partial_30_0313 := by
  native_decide

/-- Coefficient term 314 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0314 : Poly :=
[
  term ((-948 : Rat) / 5) [(9, 1), (11, 2), (15, 1), (16, 1)]
]

/-- Partial product 314 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0314 : Poly :=
[
  term ((-1896 : Rat) / 5) [(9, 1), (11, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((948 : Rat) / 5) [(9, 1), (11, 2), (12, 2), (15, 1), (16, 1)],
  term ((-1896 : Rat) / 5) [(9, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((948 : Rat) / 5) [(9, 1), (11, 2), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 314 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0314_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0314
        rs_R010_ueqv_R010NYN_generator_30_0300_0373 =
      rs_R010_ueqv_R010NYN_partial_30_0314 := by
  native_decide

/-- Coefficient term 315 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0315 : Poly :=
[
  term ((-2892672 : Rat) / 2995) [(9, 1), (11, 3)]
]

/-- Partial product 315 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0315 : Poly :=
[
  term ((-5785344 : Rat) / 2995) [(9, 1), (11, 3), (12, 1), (14, 1)],
  term ((2892672 : Rat) / 2995) [(9, 1), (11, 3), (12, 2)],
  term ((-5785344 : Rat) / 2995) [(9, 1), (11, 3), (13, 1), (15, 1)],
  term ((2892672 : Rat) / 2995) [(9, 1), (11, 3), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 315 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0315_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0315
        rs_R010_ueqv_R010NYN_generator_30_0300_0373 =
      rs_R010_ueqv_R010NYN_partial_30_0315 := by
  native_decide

/-- Coefficient term 316 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0316 : Poly :=
[
  term ((3430 : Rat) / 599) [(9, 1), (13, 1)]
]

/-- Partial product 316 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0316 : Poly :=
[
  term ((6860 : Rat) / 599) [(9, 1), (12, 1), (13, 1), (14, 1)],
  term ((-3430 : Rat) / 599) [(9, 1), (12, 2), (13, 1)],
  term ((6860 : Rat) / 599) [(9, 1), (13, 2), (15, 1)],
  term ((-3430 : Rat) / 599) [(9, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 316 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0316_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0316
        rs_R010_ueqv_R010NYN_generator_30_0300_0373 =
      rs_R010_ueqv_R010NYN_partial_30_0316 := by
  native_decide

/-- Coefficient term 317 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0317 : Poly :=
[
  term (-4 : Rat) [(9, 1), (13, 1), (14, 1)]
]

/-- Partial product 317 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0317 : Poly :=
[
  term (-8 : Rat) [(9, 1), (12, 1), (13, 1), (14, 2)],
  term (4 : Rat) [(9, 1), (12, 2), (13, 1), (14, 1)],
  term (-8 : Rat) [(9, 1), (13, 2), (14, 1), (15, 1)],
  term (4 : Rat) [(9, 1), (13, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 317 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0317_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0317
        rs_R010_ueqv_R010NYN_generator_30_0300_0373 =
      rs_R010_ueqv_R010NYN_partial_30_0317 := by
  native_decide

/-- Coefficient term 318 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0318 : Poly :=
[
  term ((32832 : Rat) / 2995) [(9, 1), (13, 1), (14, 1), (15, 2)]
]

/-- Partial product 318 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0318 : Poly :=
[
  term ((65664 : Rat) / 2995) [(9, 1), (12, 1), (13, 1), (14, 2), (15, 2)],
  term ((-32832 : Rat) / 2995) [(9, 1), (12, 2), (13, 1), (14, 1), (15, 2)],
  term ((65664 : Rat) / 2995) [(9, 1), (13, 2), (14, 1), (15, 3)],
  term ((-32832 : Rat) / 2995) [(9, 1), (13, 3), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 318 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0318_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0318
        rs_R010_ueqv_R010NYN_generator_30_0300_0373 =
      rs_R010_ueqv_R010NYN_partial_30_0318 := by
  native_decide

/-- Coefficient term 319 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0319 : Poly :=
[
  term ((4 : Rat) / 5) [(9, 1), (13, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 319 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0319 : Poly :=
[
  term ((8 : Rat) / 5) [(9, 1), (12, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-4 : Rat) / 5) [(9, 1), (12, 2), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((8 : Rat) / 5) [(9, 1), (13, 2), (14, 1), (15, 3), (16, 1)],
  term ((-4 : Rat) / 5) [(9, 1), (13, 3), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 319 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0319_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0319
        rs_R010_ueqv_R010NYN_generator_30_0300_0373 =
      rs_R010_ueqv_R010NYN_partial_30_0319 := by
  native_decide

/-- Coefficient term 320 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0320 : Poly :=
[
  term ((-49248 : Rat) / 2995) [(9, 1), (13, 1), (15, 2)]
]

/-- Partial product 320 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0320 : Poly :=
[
  term ((-98496 : Rat) / 2995) [(9, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((49248 : Rat) / 2995) [(9, 1), (12, 2), (13, 1), (15, 2)],
  term ((-98496 : Rat) / 2995) [(9, 1), (13, 2), (15, 3)],
  term ((49248 : Rat) / 2995) [(9, 1), (13, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 320 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0320_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0320
        rs_R010_ueqv_R010NYN_generator_30_0300_0373 =
      rs_R010_ueqv_R010NYN_partial_30_0320 := by
  native_decide

/-- Coefficient term 321 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0321 : Poly :=
[
  term ((-6 : Rat) / 5) [(9, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 321 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0321 : Poly :=
[
  term ((-12 : Rat) / 5) [(9, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((6 : Rat) / 5) [(9, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-12 : Rat) / 5) [(9, 1), (13, 2), (15, 3), (16, 1)],
  term ((6 : Rat) / 5) [(9, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 321 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0321_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0321
        rs_R010_ueqv_R010NYN_generator_30_0300_0373 =
      rs_R010_ueqv_R010NYN_partial_30_0321 := by
  native_decide

/-- Coefficient term 322 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0322 : Poly :=
[
  term ((8208 : Rat) / 2995) [(9, 1), (14, 1), (15, 1)]
]

/-- Partial product 322 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0322 : Poly :=
[
  term ((16416 : Rat) / 2995) [(9, 1), (12, 1), (14, 2), (15, 1)],
  term ((-8208 : Rat) / 2995) [(9, 1), (12, 2), (14, 1), (15, 1)],
  term ((16416 : Rat) / 2995) [(9, 1), (13, 1), (14, 1), (15, 2)],
  term ((-8208 : Rat) / 2995) [(9, 1), (13, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 322 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0322_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0322
        rs_R010_ueqv_R010NYN_generator_30_0300_0373 =
      rs_R010_ueqv_R010NYN_partial_30_0322 := by
  native_decide

/-- Coefficient term 323 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0323 : Poly :=
[
  term ((1 : Rat) / 5) [(9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 323 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0323 : Poly :=
[
  term ((2 : Rat) / 5) [(9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1 : Rat) / 5) [(9, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((2 : Rat) / 5) [(9, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1 : Rat) / 5) [(9, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 323 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0323_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0323
        rs_R010_ueqv_R010NYN_generator_30_0300_0373 =
      rs_R010_ueqv_R010NYN_partial_30_0323 := by
  native_decide

/-- Coefficient term 324 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0324 : Poly :=
[
  term ((-3555288 : Rat) / 2995) [(9, 1), (15, 1)]
]

/-- Partial product 324 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0324 : Poly :=
[
  term ((-7110576 : Rat) / 2995) [(9, 1), (12, 1), (14, 1), (15, 1)],
  term ((3555288 : Rat) / 2995) [(9, 1), (12, 2), (15, 1)],
  term ((-7110576 : Rat) / 2995) [(9, 1), (13, 1), (15, 2)],
  term ((3555288 : Rat) / 2995) [(9, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 324 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0324_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0324
        rs_R010_ueqv_R010NYN_generator_30_0300_0373 =
      rs_R010_ueqv_R010NYN_partial_30_0324 := by
  native_decide

/-- Coefficient term 325 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0325 : Poly :=
[
  term ((1603 : Rat) / 10) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 325 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0325 : Poly :=
[
  term ((1603 : Rat) / 5) [(9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1603 : Rat) / 10) [(9, 1), (12, 2), (15, 1), (16, 1)],
  term ((1603 : Rat) / 5) [(9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1603 : Rat) / 10) [(9, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 325 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0325_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0325
        rs_R010_ueqv_R010NYN_generator_30_0300_0373 =
      rs_R010_ueqv_R010NYN_partial_30_0325 := by
  native_decide

/-- Coefficient term 326 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0326 : Poly :=
[
  term ((16416 : Rat) / 2995) [(9, 1), (15, 3)]
]

/-- Partial product 326 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0326 : Poly :=
[
  term ((32832 : Rat) / 2995) [(9, 1), (12, 1), (14, 1), (15, 3)],
  term ((-16416 : Rat) / 2995) [(9, 1), (12, 2), (15, 3)],
  term ((32832 : Rat) / 2995) [(9, 1), (13, 1), (15, 4)],
  term ((-16416 : Rat) / 2995) [(9, 1), (13, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 326 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0326_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0326
        rs_R010_ueqv_R010NYN_generator_30_0300_0373 =
      rs_R010_ueqv_R010NYN_partial_30_0326 := by
  native_decide

/-- Coefficient term 327 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0327 : Poly :=
[
  term ((2 : Rat) / 5) [(9, 1), (15, 3), (16, 1)]
]

/-- Partial product 327 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0327 : Poly :=
[
  term ((4 : Rat) / 5) [(9, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((-2 : Rat) / 5) [(9, 1), (12, 2), (15, 3), (16, 1)],
  term ((4 : Rat) / 5) [(9, 1), (13, 1), (15, 4), (16, 1)],
  term ((-2 : Rat) / 5) [(9, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 327 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0327_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0327
        rs_R010_ueqv_R010NYN_generator_30_0300_0373 =
      rs_R010_ueqv_R010NYN_partial_30_0327 := by
  native_decide

/-- Coefficient term 328 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0328 : Poly :=
[
  term ((2724 : Rat) / 599) [(9, 2)]
]

/-- Partial product 328 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0328 : Poly :=
[
  term ((5448 : Rat) / 599) [(9, 2), (12, 1), (14, 1)],
  term ((-2724 : Rat) / 599) [(9, 2), (12, 2)],
  term ((5448 : Rat) / 599) [(9, 2), (13, 1), (15, 1)],
  term ((-2724 : Rat) / 599) [(9, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 328 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0328_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0328
        rs_R010_ueqv_R010NYN_generator_30_0300_0373 =
      rs_R010_ueqv_R010NYN_partial_30_0328 := by
  native_decide

/-- Coefficient term 329 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0329 : Poly :=
[
  term ((123840 : Rat) / 599) [(9, 2), (11, 1), (15, 1)]
]

/-- Partial product 329 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0329 : Poly :=
[
  term ((247680 : Rat) / 599) [(9, 2), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-123840 : Rat) / 599) [(9, 2), (11, 1), (12, 2), (15, 1)],
  term ((247680 : Rat) / 599) [(9, 2), (11, 1), (13, 1), (15, 2)],
  term ((-123840 : Rat) / 599) [(9, 2), (11, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 329 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0329_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0329
        rs_R010_ueqv_R010NYN_generator_30_0300_0373 =
      rs_R010_ueqv_R010NYN_partial_30_0329 := by
  native_decide

/-- Coefficient term 330 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0330 : Poly :=
[
  term ((-72 : Rat) / 5) [(9, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 330 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0330 : Poly :=
[
  term ((-144 : Rat) / 5) [(9, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((72 : Rat) / 5) [(9, 2), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-144 : Rat) / 5) [(9, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((72 : Rat) / 5) [(9, 2), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 330 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0330_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0330
        rs_R010_ueqv_R010NYN_generator_30_0300_0373 =
      rs_R010_ueqv_R010NYN_partial_30_0330 := by
  native_decide

/-- Coefficient term 331 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0331 : Poly :=
[
  term ((-321408 : Rat) / 2995) [(9, 2), (11, 2)]
]

/-- Partial product 331 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0331 : Poly :=
[
  term ((-642816 : Rat) / 2995) [(9, 2), (11, 2), (12, 1), (14, 1)],
  term ((321408 : Rat) / 2995) [(9, 2), (11, 2), (12, 2)],
  term ((-642816 : Rat) / 2995) [(9, 2), (11, 2), (13, 1), (15, 1)],
  term ((321408 : Rat) / 2995) [(9, 2), (11, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 331 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0331_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0331
        rs_R010_ueqv_R010NYN_generator_30_0300_0373 =
      rs_R010_ueqv_R010NYN_partial_30_0331 := by
  native_decide

/-- Coefficient term 332 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0332 : Poly :=
[
  term ((-131328 : Rat) / 2995) [(9, 2), (15, 2)]
]

/-- Partial product 332 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0332 : Poly :=
[
  term ((-262656 : Rat) / 2995) [(9, 2), (12, 1), (14, 1), (15, 2)],
  term ((131328 : Rat) / 2995) [(9, 2), (12, 2), (15, 2)],
  term ((-262656 : Rat) / 2995) [(9, 2), (13, 1), (15, 3)],
  term ((131328 : Rat) / 2995) [(9, 2), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 332 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0332_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0332
        rs_R010_ueqv_R010NYN_generator_30_0300_0373 =
      rs_R010_ueqv_R010NYN_partial_30_0332 := by
  native_decide

/-- Coefficient term 333 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0333 : Poly :=
[
  term ((-16 : Rat) / 5) [(9, 2), (15, 2), (16, 1)]
]

/-- Partial product 333 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0333 : Poly :=
[
  term ((-32 : Rat) / 5) [(9, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((16 : Rat) / 5) [(9, 2), (12, 2), (15, 2), (16, 1)],
  term ((-32 : Rat) / 5) [(9, 2), (13, 1), (15, 3), (16, 1)],
  term ((16 : Rat) / 5) [(9, 2), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 333 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0333_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0333
        rs_R010_ueqv_R010NYN_generator_30_0300_0373 =
      rs_R010_ueqv_R010NYN_partial_30_0333 := by
  native_decide

/-- Coefficient term 334 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0334 : Poly :=
[
  term (-6 : Rat) [(10, 1)]
]

/-- Partial product 334 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0334 : Poly :=
[
  term (-12 : Rat) [(10, 1), (12, 1), (14, 1)],
  term (6 : Rat) [(10, 1), (12, 2)],
  term (-12 : Rat) [(10, 1), (13, 1), (15, 1)],
  term (6 : Rat) [(10, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 334 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0334_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0334
        rs_R010_ueqv_R010NYN_generator_30_0300_0373 =
      rs_R010_ueqv_R010NYN_partial_30_0334 := by
  native_decide

/-- Coefficient term 335 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0335 : Poly :=
[
  term ((-4983552 : Rat) / 2995) [(10, 1), (11, 1), (14, 1), (15, 1)]
]

/-- Partial product 335 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0335 : Poly :=
[
  term ((-9967104 : Rat) / 2995) [(10, 1), (11, 1), (12, 1), (14, 2), (15, 1)],
  term ((4983552 : Rat) / 2995) [(10, 1), (11, 1), (12, 2), (14, 1), (15, 1)],
  term ((-9967104 : Rat) / 2995) [(10, 1), (11, 1), (13, 1), (14, 1), (15, 2)],
  term ((4983552 : Rat) / 2995) [(10, 1), (11, 1), (13, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 335 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0335_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0335
        rs_R010_ueqv_R010NYN_generator_30_0300_0373 =
      rs_R010_ueqv_R010NYN_partial_30_0335 := by
  native_decide

/-- Coefficient term 336 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0336 : Poly :=
[
  term ((948 : Rat) / 5) [(10, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 336 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0336 : Poly :=
[
  term ((1896 : Rat) / 5) [(10, 1), (11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-948 : Rat) / 5) [(10, 1), (11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((1896 : Rat) / 5) [(10, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-948 : Rat) / 5) [(10, 1), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 336 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0336_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0336
        rs_R010_ueqv_R010NYN_generator_30_0300_0373 =
      rs_R010_ueqv_R010NYN_partial_30_0336 := by
  native_decide

/-- Coefficient term 337 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0337 : Poly :=
[
  term ((241056 : Rat) / 2995) [(10, 1), (11, 1), (15, 1)]
]

/-- Partial product 337 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0337 : Poly :=
[
  term ((482112 : Rat) / 2995) [(10, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-241056 : Rat) / 2995) [(10, 1), (11, 1), (12, 2), (15, 1)],
  term ((482112 : Rat) / 2995) [(10, 1), (11, 1), (13, 1), (15, 2)],
  term ((-241056 : Rat) / 2995) [(10, 1), (11, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 337 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0337_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0337
        rs_R010_ueqv_R010NYN_generator_30_0300_0373 =
      rs_R010_ueqv_R010NYN_partial_30_0337 := by
  native_decide

/-- Coefficient term 338 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0338 : Poly :=
[
  term ((2892672 : Rat) / 2995) [(10, 1), (11, 2), (14, 1)]
]

/-- Partial product 338 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0338 : Poly :=
[
  term ((5785344 : Rat) / 2995) [(10, 1), (11, 2), (12, 1), (14, 2)],
  term ((-2892672 : Rat) / 2995) [(10, 1), (11, 2), (12, 2), (14, 1)],
  term ((5785344 : Rat) / 2995) [(10, 1), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((-2892672 : Rat) / 2995) [(10, 1), (11, 2), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 338 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0338_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0338
        rs_R010_ueqv_R010NYN_generator_30_0300_0373 =
      rs_R010_ueqv_R010NYN_partial_30_0338 := by
  native_decide

/-- Coefficient term 339 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0339 : Poly :=
[
  term (8 : Rat) [(10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 339 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0339 : Poly :=
[
  term (16 : Rat) [(10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(10, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term (16 : Rat) [(10, 1), (13, 2), (15, 2), (16, 1)],
  term (-8 : Rat) [(10, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 339 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0339_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0339
        rs_R010_ueqv_R010NYN_generator_30_0300_0373 =
      rs_R010_ueqv_R010NYN_partial_30_0339 := by
  native_decide

/-- Coefficient term 340 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0340 : Poly :=
[
  term ((-19275 : Rat) / 599) [(10, 1), (14, 1)]
]

/-- Partial product 340 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0340 : Poly :=
[
  term ((-38550 : Rat) / 599) [(10, 1), (12, 1), (14, 2)],
  term ((19275 : Rat) / 599) [(10, 1), (12, 2), (14, 1)],
  term ((-38550 : Rat) / 599) [(10, 1), (13, 1), (14, 1), (15, 1)],
  term ((19275 : Rat) / 599) [(10, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 340 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0340_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0340
        rs_R010_ueqv_R010NYN_generator_30_0300_0373 =
      rs_R010_ueqv_R010NYN_partial_30_0340 := by
  native_decide

/-- Coefficient term 341 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0341 : Poly :=
[
  term ((2423808 : Rat) / 2995) [(10, 1), (14, 1), (15, 2)]
]

/-- Partial product 341 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0341 : Poly :=
[
  term ((4847616 : Rat) / 2995) [(10, 1), (12, 1), (14, 2), (15, 2)],
  term ((-2423808 : Rat) / 2995) [(10, 1), (12, 2), (14, 1), (15, 2)],
  term ((4847616 : Rat) / 2995) [(10, 1), (13, 1), (14, 1), (15, 3)],
  term ((-2423808 : Rat) / 2995) [(10, 1), (13, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 341 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0341_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0341
        rs_R010_ueqv_R010NYN_generator_30_0300_0373 =
      rs_R010_ueqv_R010NYN_partial_30_0341 := by
  native_decide

/-- Coefficient term 342 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0342 : Poly :=
[
  term ((-534 : Rat) / 5) [(10, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 342 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0342 : Poly :=
[
  term ((-1068 : Rat) / 5) [(10, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((534 : Rat) / 5) [(10, 1), (12, 2), (14, 1), (15, 2), (16, 1)],
  term ((-1068 : Rat) / 5) [(10, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((534 : Rat) / 5) [(10, 1), (13, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 342 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0342_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0342
        rs_R010_ueqv_R010NYN_generator_30_0300_0373 =
      rs_R010_ueqv_R010NYN_partial_30_0342 := by
  native_decide

/-- Coefficient term 343 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0343 : Poly :=
[
  term ((-335058 : Rat) / 2995) [(10, 1), (15, 2)]
]

/-- Partial product 343 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0343 : Poly :=
[
  term ((-670116 : Rat) / 2995) [(10, 1), (12, 1), (14, 1), (15, 2)],
  term ((335058 : Rat) / 2995) [(10, 1), (12, 2), (15, 2)],
  term ((-670116 : Rat) / 2995) [(10, 1), (13, 1), (15, 3)],
  term ((335058 : Rat) / 2995) [(10, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 343 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0343_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0343
        rs_R010_ueqv_R010NYN_generator_30_0300_0373 =
      rs_R010_ueqv_R010NYN_partial_30_0343 := by
  native_decide

/-- Coefficient term 344 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0344 : Poly :=
[
  term ((79 : Rat) / 5) [(10, 1), (15, 2), (16, 1)]
]

/-- Partial product 344 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0344 : Poly :=
[
  term ((158 : Rat) / 5) [(10, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-79 : Rat) / 5) [(10, 1), (12, 2), (15, 2), (16, 1)],
  term ((158 : Rat) / 5) [(10, 1), (13, 1), (15, 3), (16, 1)],
  term ((-79 : Rat) / 5) [(10, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 344 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0344_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0344
        rs_R010_ueqv_R010NYN_generator_30_0300_0373 =
      rs_R010_ueqv_R010NYN_partial_30_0344 := by
  native_decide

/-- Coefficient term 345 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0345 : Poly :=
[
  term ((-214272 : Rat) / 2995) [(11, 1), (13, 1), (14, 1)]
]

/-- Partial product 345 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0345 : Poly :=
[
  term ((-428544 : Rat) / 2995) [(11, 1), (12, 1), (13, 1), (14, 2)],
  term ((214272 : Rat) / 2995) [(11, 1), (12, 2), (13, 1), (14, 1)],
  term ((-428544 : Rat) / 2995) [(11, 1), (13, 2), (14, 1), (15, 1)],
  term ((214272 : Rat) / 2995) [(11, 1), (13, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 345 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0345_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0345
        rs_R010_ueqv_R010NYN_generator_30_0300_0373 =
      rs_R010_ueqv_R010NYN_partial_30_0345 := by
  native_decide

/-- Coefficient term 346 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0346 : Poly :=
[
  term ((122112 : Rat) / 2995) [(11, 1), (13, 1), (14, 1), (15, 2)]
]

/-- Partial product 346 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0346 : Poly :=
[
  term ((244224 : Rat) / 2995) [(11, 1), (12, 1), (13, 1), (14, 2), (15, 2)],
  term ((-122112 : Rat) / 2995) [(11, 1), (12, 2), (13, 1), (14, 1), (15, 2)],
  term ((244224 : Rat) / 2995) [(11, 1), (13, 2), (14, 1), (15, 3)],
  term ((-122112 : Rat) / 2995) [(11, 1), (13, 3), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 346 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0346_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0346
        rs_R010_ueqv_R010NYN_generator_30_0300_0373 =
      rs_R010_ueqv_R010NYN_partial_30_0346 := by
  native_decide

/-- Coefficient term 347 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0347 : Poly :=
[
  term ((-66 : Rat) / 5) [(11, 1), (13, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 347 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0347 : Poly :=
[
  term ((-132 : Rat) / 5) [(11, 1), (12, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((66 : Rat) / 5) [(11, 1), (12, 2), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-132 : Rat) / 5) [(11, 1), (13, 2), (14, 1), (15, 3), (16, 1)],
  term ((66 : Rat) / 5) [(11, 1), (13, 3), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 347 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0347_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0347
        rs_R010_ueqv_R010NYN_generator_30_0300_0373 =
      rs_R010_ueqv_R010NYN_partial_30_0347 := by
  native_decide

/-- Coefficient term 348 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0348 : Poly :=
[
  term ((884448 : Rat) / 599) [(11, 1), (13, 1), (15, 2)]
]

/-- Partial product 348 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0348 : Poly :=
[
  term ((1768896 : Rat) / 599) [(11, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((-884448 : Rat) / 599) [(11, 1), (12, 2), (13, 1), (15, 2)],
  term ((1768896 : Rat) / 599) [(11, 1), (13, 2), (15, 3)],
  term ((-884448 : Rat) / 599) [(11, 1), (13, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 348 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0348_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0348
        rs_R010_ueqv_R010NYN_generator_30_0300_0373 =
      rs_R010_ueqv_R010NYN_partial_30_0348 := by
  native_decide

/-- Coefficient term 349 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0349 : Poly :=
[
  term ((-757 : Rat) / 5) [(11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 349 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0349 : Poly :=
[
  term ((-1514 : Rat) / 5) [(11, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((757 : Rat) / 5) [(11, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-1514 : Rat) / 5) [(11, 1), (13, 2), (15, 3), (16, 1)],
  term ((757 : Rat) / 5) [(11, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 349 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0349_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0349
        rs_R010_ueqv_R010NYN_generator_30_0300_0373 =
      rs_R010_ueqv_R010NYN_partial_30_0349 := by
  native_decide

/-- Coefficient term 350 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0350 : Poly :=
[
  term ((-2728206 : Rat) / 2995) [(11, 1), (14, 1), (15, 1)]
]

/-- Partial product 350 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0350 : Poly :=
[
  term ((-5456412 : Rat) / 2995) [(11, 1), (12, 1), (14, 2), (15, 1)],
  term ((2728206 : Rat) / 2995) [(11, 1), (12, 2), (14, 1), (15, 1)],
  term ((-5456412 : Rat) / 2995) [(11, 1), (13, 1), (14, 1), (15, 2)],
  term ((2728206 : Rat) / 2995) [(11, 1), (13, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 350 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0350_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0350
        rs_R010_ueqv_R010NYN_generator_30_0300_0373 =
      rs_R010_ueqv_R010NYN_partial_30_0350 := by
  native_decide

/-- Coefficient term 351 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0351 : Poly :=
[
  term ((1153 : Rat) / 10) [(11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 351 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0351 : Poly :=
[
  term ((1153 : Rat) / 5) [(11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1153 : Rat) / 10) [(11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((1153 : Rat) / 5) [(11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1153 : Rat) / 10) [(11, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 351 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0351_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0351
        rs_R010_ueqv_R010NYN_generator_30_0300_0373 =
      rs_R010_ueqv_R010NYN_partial_30_0351 := by
  native_decide

/-- Coefficient term 352 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0352 : Poly :=
[
  term ((3462597 : Rat) / 2995) [(11, 1), (15, 1)]
]

/-- Partial product 352 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0352 : Poly :=
[
  term ((6925194 : Rat) / 2995) [(11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-3462597 : Rat) / 2995) [(11, 1), (12, 2), (15, 1)],
  term ((6925194 : Rat) / 2995) [(11, 1), (13, 1), (15, 2)],
  term ((-3462597 : Rat) / 2995) [(11, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 352 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0352_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0352
        rs_R010_ueqv_R010NYN_generator_30_0300_0373 =
      rs_R010_ueqv_R010NYN_partial_30_0352 := by
  native_decide

/-- Coefficient term 353 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0353 : Poly :=
[
  term ((-337 : Rat) / 2) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 353 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0353 : Poly :=
[
  term (-337 : Rat) [(11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((337 : Rat) / 2) [(11, 1), (12, 2), (15, 1), (16, 1)],
  term (-337 : Rat) [(11, 1), (13, 1), (15, 2), (16, 1)],
  term ((337 : Rat) / 2) [(11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 353 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0353_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0353
        rs_R010_ueqv_R010NYN_generator_30_0300_0373 =
      rs_R010_ueqv_R010NYN_partial_30_0353 := by
  native_decide

/-- Coefficient term 354 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0354 : Poly :=
[
  term ((2484864 : Rat) / 2995) [(11, 1), (15, 3)]
]

/-- Partial product 354 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0354 : Poly :=
[
  term ((4969728 : Rat) / 2995) [(11, 1), (12, 1), (14, 1), (15, 3)],
  term ((-2484864 : Rat) / 2995) [(11, 1), (12, 2), (15, 3)],
  term ((4969728 : Rat) / 2995) [(11, 1), (13, 1), (15, 4)],
  term ((-2484864 : Rat) / 2995) [(11, 1), (13, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 354 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0354_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0354
        rs_R010_ueqv_R010NYN_generator_30_0300_0373 =
      rs_R010_ueqv_R010NYN_partial_30_0354 := by
  native_decide

/-- Coefficient term 355 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0355 : Poly :=
[
  term ((-567 : Rat) / 5) [(11, 1), (15, 3), (16, 1)]
]

/-- Partial product 355 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0355 : Poly :=
[
  term ((-1134 : Rat) / 5) [(11, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((567 : Rat) / 5) [(11, 1), (12, 2), (15, 3), (16, 1)],
  term ((-1134 : Rat) / 5) [(11, 1), (13, 1), (15, 4), (16, 1)],
  term ((567 : Rat) / 5) [(11, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 355 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0355_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0355
        rs_R010_ueqv_R010NYN_generator_30_0300_0373 =
      rs_R010_ueqv_R010NYN_partial_30_0355 := by
  native_decide

/-- Coefficient term 356 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0356 : Poly :=
[
  term ((-549072 : Rat) / 599) [(11, 2)]
]

/-- Partial product 356 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0356 : Poly :=
[
  term ((-1098144 : Rat) / 599) [(11, 2), (12, 1), (14, 1)],
  term ((549072 : Rat) / 599) [(11, 2), (12, 2)],
  term ((-1098144 : Rat) / 599) [(11, 2), (13, 1), (15, 1)],
  term ((549072 : Rat) / 599) [(11, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 356 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0356_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0356
        rs_R010_ueqv_R010NYN_generator_30_0300_0373 =
      rs_R010_ueqv_R010NYN_partial_30_0356 := by
  native_decide

/-- Coefficient term 357 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0357 : Poly :=
[
  term ((-160704 : Rat) / 2995) [(11, 2), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 357 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0357 : Poly :=
[
  term ((-321408 : Rat) / 2995) [(11, 2), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((160704 : Rat) / 2995) [(11, 2), (12, 2), (13, 1), (14, 1), (15, 1)],
  term ((-321408 : Rat) / 2995) [(11, 2), (13, 2), (14, 1), (15, 2)],
  term ((160704 : Rat) / 2995) [(11, 2), (13, 3), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 357 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0357_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0357
        rs_R010_ueqv_R010NYN_generator_30_0300_0373 =
      rs_R010_ueqv_R010NYN_partial_30_0357 := by
  native_decide

/-- Coefficient term 358 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0358 : Poly :=
[
  term ((-2330208 : Rat) / 2995) [(11, 2), (13, 1), (15, 1)]
]

/-- Partial product 358 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0358 : Poly :=
[
  term ((-4660416 : Rat) / 2995) [(11, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((2330208 : Rat) / 2995) [(11, 2), (12, 2), (13, 1), (15, 1)],
  term ((-4660416 : Rat) / 2995) [(11, 2), (13, 2), (15, 2)],
  term ((2330208 : Rat) / 2995) [(11, 2), (13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 358 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0358_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0358
        rs_R010_ueqv_R010NYN_generator_30_0300_0373 =
      rs_R010_ueqv_R010NYN_partial_30_0358 := by
  native_decide

/-- Coefficient term 359 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0359 : Poly :=
[
  term ((1781136 : Rat) / 2995) [(11, 2), (14, 1)]
]

/-- Partial product 359 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0359 : Poly :=
[
  term ((3562272 : Rat) / 2995) [(11, 2), (12, 1), (14, 2)],
  term ((-1781136 : Rat) / 2995) [(11, 2), (12, 2), (14, 1)],
  term ((3562272 : Rat) / 2995) [(11, 2), (13, 1), (14, 1), (15, 1)],
  term ((-1781136 : Rat) / 2995) [(11, 2), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 359 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0359_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0359
        rs_R010_ueqv_R010NYN_generator_30_0300_0373 =
      rs_R010_ueqv_R010NYN_partial_30_0359 := by
  native_decide

/-- Coefficient term 360 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0360 : Poly :=
[
  term ((-5063904 : Rat) / 2995) [(11, 2), (15, 2)]
]

/-- Partial product 360 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0360 : Poly :=
[
  term ((-10127808 : Rat) / 2995) [(11, 2), (12, 1), (14, 1), (15, 2)],
  term ((5063904 : Rat) / 2995) [(11, 2), (12, 2), (15, 2)],
  term ((-10127808 : Rat) / 2995) [(11, 2), (13, 1), (15, 3)],
  term ((5063904 : Rat) / 2995) [(11, 2), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 360 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0360_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0360
        rs_R010_ueqv_R010NYN_generator_30_0300_0373 =
      rs_R010_ueqv_R010NYN_partial_30_0360 := by
  native_decide

/-- Coefficient term 361 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0361 : Poly :=
[
  term ((948 : Rat) / 5) [(11, 2), (15, 2), (16, 1)]
]

/-- Partial product 361 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0361 : Poly :=
[
  term ((1896 : Rat) / 5) [(11, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-948 : Rat) / 5) [(11, 2), (12, 2), (15, 2), (16, 1)],
  term ((1896 : Rat) / 5) [(11, 2), (13, 1), (15, 3), (16, 1)],
  term ((-948 : Rat) / 5) [(11, 2), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 361 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0361_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0361
        rs_R010_ueqv_R010NYN_generator_30_0300_0373 =
      rs_R010_ueqv_R010NYN_partial_30_0361 := by
  native_decide

/-- Coefficient term 362 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0362 : Poly :=
[
  term ((2892672 : Rat) / 2995) [(11, 3), (15, 1)]
]

/-- Partial product 362 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0362 : Poly :=
[
  term ((5785344 : Rat) / 2995) [(11, 3), (12, 1), (14, 1), (15, 1)],
  term ((-2892672 : Rat) / 2995) [(11, 3), (12, 2), (15, 1)],
  term ((5785344 : Rat) / 2995) [(11, 3), (13, 1), (15, 2)],
  term ((-2892672 : Rat) / 2995) [(11, 3), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 362 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0362_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0362
        rs_R010_ueqv_R010NYN_generator_30_0300_0373 =
      rs_R010_ueqv_R010NYN_partial_30_0362 := by
  native_decide

/-- Coefficient term 363 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0363 : Poly :=
[
  term ((205376 : Rat) / 2995) [(13, 1), (14, 1), (15, 1)]
]

/-- Partial product 363 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0363 : Poly :=
[
  term ((410752 : Rat) / 2995) [(12, 1), (13, 1), (14, 2), (15, 1)],
  term ((-205376 : Rat) / 2995) [(12, 2), (13, 1), (14, 1), (15, 1)],
  term ((410752 : Rat) / 2995) [(13, 2), (14, 1), (15, 2)],
  term ((-205376 : Rat) / 2995) [(13, 3), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 363 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0363_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0363
        rs_R010_ueqv_R010NYN_generator_30_0300_0373 =
      rs_R010_ueqv_R010NYN_partial_30_0363 := by
  native_decide

/-- Coefficient term 364 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0364 : Poly :=
[
  term ((-33 : Rat) / 5) [(13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 364 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0364 : Poly :=
[
  term ((-66 : Rat) / 5) [(12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((33 : Rat) / 5) [(12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-66 : Rat) / 5) [(13, 2), (14, 1), (15, 2), (16, 1)],
  term ((33 : Rat) / 5) [(13, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 364 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0364_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0364
        rs_R010_ueqv_R010NYN_generator_30_0300_0373 =
      rs_R010_ueqv_R010NYN_partial_30_0364 := by
  native_decide

/-- Coefficient term 365 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0365 : Poly :=
[
  term ((21532 : Rat) / 599) [(13, 1), (15, 1)]
]

/-- Partial product 365 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0365 : Poly :=
[
  term ((43064 : Rat) / 599) [(12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-21532 : Rat) / 599) [(12, 2), (13, 1), (15, 1)],
  term ((43064 : Rat) / 599) [(13, 2), (15, 2)],
  term ((-21532 : Rat) / 599) [(13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 365 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0365_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0365
        rs_R010_ueqv_R010NYN_generator_30_0300_0373 =
      rs_R010_ueqv_R010NYN_partial_30_0365 := by
  native_decide

/-- Coefficient term 366 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0366 : Poly :=
[
  term (-2 : Rat) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 366 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0366 : Poly :=
[
  term (-4 : Rat) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term (2 : Rat) [(12, 2), (13, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(13, 2), (15, 2), (16, 1)],
  term (2 : Rat) [(13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 366 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0366_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0366
        rs_R010_ueqv_R010NYN_generator_30_0300_0373 =
      rs_R010_ueqv_R010NYN_partial_30_0366 := by
  native_decide

/-- Coefficient term 367 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0367 : Poly :=
[
  term ((-2423808 : Rat) / 2995) [(13, 1), (15, 3)]
]

/-- Partial product 367 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0367 : Poly :=
[
  term ((-4847616 : Rat) / 2995) [(12, 1), (13, 1), (14, 1), (15, 3)],
  term ((2423808 : Rat) / 2995) [(12, 2), (13, 1), (15, 3)],
  term ((-4847616 : Rat) / 2995) [(13, 2), (15, 4)],
  term ((2423808 : Rat) / 2995) [(13, 3), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 367 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0367_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0367
        rs_R010_ueqv_R010NYN_generator_30_0300_0373 =
      rs_R010_ueqv_R010NYN_partial_30_0367 := by
  native_decide

/-- Coefficient term 368 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0368 : Poly :=
[
  term ((534 : Rat) / 5) [(13, 1), (15, 3), (16, 1)]
]

/-- Partial product 368 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0368 : Poly :=
[
  term ((1068 : Rat) / 5) [(12, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-534 : Rat) / 5) [(12, 2), (13, 1), (15, 3), (16, 1)],
  term ((1068 : Rat) / 5) [(13, 2), (15, 4), (16, 1)],
  term ((-534 : Rat) / 5) [(13, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 368 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0368_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0368
        rs_R010_ueqv_R010NYN_generator_30_0300_0373 =
      rs_R010_ueqv_R010NYN_partial_30_0368 := by
  native_decide

/-- Coefficient term 369 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0369 : Poly :=
[
  term ((-10123 : Rat) / 599) [(14, 1)]
]

/-- Partial product 369 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0369 : Poly :=
[
  term ((-20246 : Rat) / 599) [(12, 1), (14, 2)],
  term ((10123 : Rat) / 599) [(12, 2), (14, 1)],
  term ((-20246 : Rat) / 599) [(13, 1), (14, 1), (15, 1)],
  term ((10123 : Rat) / 599) [(13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 369 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0369_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0369
        rs_R010_ueqv_R010NYN_generator_30_0300_0373 =
      rs_R010_ueqv_R010NYN_partial_30_0369 := by
  native_decide

/-- Coefficient term 370 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0370 : Poly :=
[
  term ((1211904 : Rat) / 2995) [(14, 1), (15, 2)]
]

/-- Partial product 370 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0370 : Poly :=
[
  term ((2423808 : Rat) / 2995) [(12, 1), (14, 2), (15, 2)],
  term ((-1211904 : Rat) / 2995) [(12, 2), (14, 1), (15, 2)],
  term ((2423808 : Rat) / 2995) [(13, 1), (14, 1), (15, 3)],
  term ((-1211904 : Rat) / 2995) [(13, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 370 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0370_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0370
        rs_R010_ueqv_R010NYN_generator_30_0300_0373 =
      rs_R010_ueqv_R010NYN_partial_30_0370 := by
  native_decide

/-- Coefficient term 371 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0371 : Poly :=
[
  term ((-267 : Rat) / 5) [(14, 1), (15, 2), (16, 1)]
]

/-- Partial product 371 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0371 : Poly :=
[
  term ((-534 : Rat) / 5) [(12, 1), (14, 2), (15, 2), (16, 1)],
  term ((267 : Rat) / 5) [(12, 2), (14, 1), (15, 2), (16, 1)],
  term ((-534 : Rat) / 5) [(13, 1), (14, 1), (15, 3), (16, 1)],
  term ((267 : Rat) / 5) [(13, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 371 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0371_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0371
        rs_R010_ueqv_R010NYN_generator_30_0300_0373 =
      rs_R010_ueqv_R010NYN_partial_30_0371 := by
  native_decide

/-- Coefficient term 372 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0372 : Poly :=
[
  term ((-1109216 : Rat) / 2995) [(15, 2)]
]

/-- Partial product 372 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0372 : Poly :=
[
  term ((-2218432 : Rat) / 2995) [(12, 1), (14, 1), (15, 2)],
  term ((1109216 : Rat) / 2995) [(12, 2), (15, 2)],
  term ((-2218432 : Rat) / 2995) [(13, 1), (15, 3)],
  term ((1109216 : Rat) / 2995) [(13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 372 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0372_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0372
        rs_R010_ueqv_R010NYN_generator_30_0300_0373 =
      rs_R010_ueqv_R010NYN_partial_30_0372 := by
  native_decide

/-- Coefficient term 373 from coefficient polynomial 30. -/
def rs_R010_ueqv_R010NYN_coefficient_30_0373 : Poly :=
[
  term ((501 : Rat) / 10) [(15, 2), (16, 1)]
]

/-- Partial product 373 for generator 30. -/
def rs_R010_ueqv_R010NYN_partial_30_0373 : Poly :=
[
  term ((501 : Rat) / 5) [(12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-501 : Rat) / 10) [(12, 2), (15, 2), (16, 1)],
  term ((501 : Rat) / 5) [(13, 1), (15, 3), (16, 1)],
  term ((-501 : Rat) / 10) [(13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 373 for generator 30. -/
theorem rs_R010_ueqv_R010NYN_partial_30_0373_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_30_0373
        rs_R010_ueqv_R010NYN_generator_30_0300_0373 =
      rs_R010_ueqv_R010NYN_partial_30_0373 := by
  native_decide

/-- Partial products in this block. -/
def rs_R010_ueqv_R010NYN_partials_30_0300_0373 : List Poly :=
[
  rs_R010_ueqv_R010NYN_partial_30_0300,
  rs_R010_ueqv_R010NYN_partial_30_0301,
  rs_R010_ueqv_R010NYN_partial_30_0302,
  rs_R010_ueqv_R010NYN_partial_30_0303,
  rs_R010_ueqv_R010NYN_partial_30_0304,
  rs_R010_ueqv_R010NYN_partial_30_0305,
  rs_R010_ueqv_R010NYN_partial_30_0306,
  rs_R010_ueqv_R010NYN_partial_30_0307,
  rs_R010_ueqv_R010NYN_partial_30_0308,
  rs_R010_ueqv_R010NYN_partial_30_0309,
  rs_R010_ueqv_R010NYN_partial_30_0310,
  rs_R010_ueqv_R010NYN_partial_30_0311,
  rs_R010_ueqv_R010NYN_partial_30_0312,
  rs_R010_ueqv_R010NYN_partial_30_0313,
  rs_R010_ueqv_R010NYN_partial_30_0314,
  rs_R010_ueqv_R010NYN_partial_30_0315,
  rs_R010_ueqv_R010NYN_partial_30_0316,
  rs_R010_ueqv_R010NYN_partial_30_0317,
  rs_R010_ueqv_R010NYN_partial_30_0318,
  rs_R010_ueqv_R010NYN_partial_30_0319,
  rs_R010_ueqv_R010NYN_partial_30_0320,
  rs_R010_ueqv_R010NYN_partial_30_0321,
  rs_R010_ueqv_R010NYN_partial_30_0322,
  rs_R010_ueqv_R010NYN_partial_30_0323,
  rs_R010_ueqv_R010NYN_partial_30_0324,
  rs_R010_ueqv_R010NYN_partial_30_0325,
  rs_R010_ueqv_R010NYN_partial_30_0326,
  rs_R010_ueqv_R010NYN_partial_30_0327,
  rs_R010_ueqv_R010NYN_partial_30_0328,
  rs_R010_ueqv_R010NYN_partial_30_0329,
  rs_R010_ueqv_R010NYN_partial_30_0330,
  rs_R010_ueqv_R010NYN_partial_30_0331,
  rs_R010_ueqv_R010NYN_partial_30_0332,
  rs_R010_ueqv_R010NYN_partial_30_0333,
  rs_R010_ueqv_R010NYN_partial_30_0334,
  rs_R010_ueqv_R010NYN_partial_30_0335,
  rs_R010_ueqv_R010NYN_partial_30_0336,
  rs_R010_ueqv_R010NYN_partial_30_0337,
  rs_R010_ueqv_R010NYN_partial_30_0338,
  rs_R010_ueqv_R010NYN_partial_30_0339,
  rs_R010_ueqv_R010NYN_partial_30_0340,
  rs_R010_ueqv_R010NYN_partial_30_0341,
  rs_R010_ueqv_R010NYN_partial_30_0342,
  rs_R010_ueqv_R010NYN_partial_30_0343,
  rs_R010_ueqv_R010NYN_partial_30_0344,
  rs_R010_ueqv_R010NYN_partial_30_0345,
  rs_R010_ueqv_R010NYN_partial_30_0346,
  rs_R010_ueqv_R010NYN_partial_30_0347,
  rs_R010_ueqv_R010NYN_partial_30_0348,
  rs_R010_ueqv_R010NYN_partial_30_0349,
  rs_R010_ueqv_R010NYN_partial_30_0350,
  rs_R010_ueqv_R010NYN_partial_30_0351,
  rs_R010_ueqv_R010NYN_partial_30_0352,
  rs_R010_ueqv_R010NYN_partial_30_0353,
  rs_R010_ueqv_R010NYN_partial_30_0354,
  rs_R010_ueqv_R010NYN_partial_30_0355,
  rs_R010_ueqv_R010NYN_partial_30_0356,
  rs_R010_ueqv_R010NYN_partial_30_0357,
  rs_R010_ueqv_R010NYN_partial_30_0358,
  rs_R010_ueqv_R010NYN_partial_30_0359,
  rs_R010_ueqv_R010NYN_partial_30_0360,
  rs_R010_ueqv_R010NYN_partial_30_0361,
  rs_R010_ueqv_R010NYN_partial_30_0362,
  rs_R010_ueqv_R010NYN_partial_30_0363,
  rs_R010_ueqv_R010NYN_partial_30_0364,
  rs_R010_ueqv_R010NYN_partial_30_0365,
  rs_R010_ueqv_R010NYN_partial_30_0366,
  rs_R010_ueqv_R010NYN_partial_30_0367,
  rs_R010_ueqv_R010NYN_partial_30_0368,
  rs_R010_ueqv_R010NYN_partial_30_0369,
  rs_R010_ueqv_R010NYN_partial_30_0370,
  rs_R010_ueqv_R010NYN_partial_30_0371,
  rs_R010_ueqv_R010NYN_partial_30_0372,
  rs_R010_ueqv_R010NYN_partial_30_0373
]

/-- Sum of partial products in this block. -/
def rs_R010_ueqv_R010NYN_block_30_0300_0373 : Poly :=
[
  term ((-321408 : Rat) / 2995) [(9, 1), (10, 1), (11, 1), (12, 1), (14, 1)],
  term ((160704 : Rat) / 2995) [(9, 1), (10, 1), (11, 1), (12, 2)],
  term ((-321408 : Rat) / 2995) [(9, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((160704 : Rat) / 2995) [(9, 1), (10, 1), (11, 1), (13, 2)],
  term ((378144 : Rat) / 2995) [(9, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((-102 : Rat) / 5) [(9, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-189072 : Rat) / 2995) [(9, 1), (10, 1), (12, 2), (15, 1)],
  term ((51 : Rat) / 5) [(9, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((378144 : Rat) / 2995) [(9, 1), (10, 1), (13, 1), (15, 2)],
  term ((-102 : Rat) / 5) [(9, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-189072 : Rat) / 2995) [(9, 1), (10, 1), (13, 2), (15, 1)],
  term ((51 : Rat) / 5) [(9, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((2378112 : Rat) / 2995) [(9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term (-116 : Rat) [(9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-134976 : Rat) / 2995) [(9, 1), (11, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((-16 : Rat) / 5) [(9, 1), (11, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((6897792 : Rat) / 2995) [(9, 1), (11, 1), (12, 1), (14, 1)],
  term ((-3495744 : Rat) / 2995) [(9, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term (132 : Rat) [(9, 1), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-80352 : Rat) / 2995) [(9, 1), (11, 1), (12, 1), (14, 2)],
  term ((-3448896 : Rat) / 2995) [(9, 1), (11, 1), (12, 2)],
  term ((67488 : Rat) / 2995) [(9, 1), (11, 1), (12, 2), (13, 1), (14, 1), (15, 1)],
  term ((8 : Rat) / 5) [(9, 1), (11, 1), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1189056 : Rat) / 2995) [(9, 1), (11, 1), (12, 2), (13, 1), (15, 1)],
  term (58 : Rat) [(9, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((40176 : Rat) / 2995) [(9, 1), (11, 1), (12, 2), (14, 1)],
  term ((1747872 : Rat) / 2995) [(9, 1), (11, 1), (12, 2), (15, 2)],
  term (-66 : Rat) [(9, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((-80352 : Rat) / 2995) [(9, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((6897792 : Rat) / 2995) [(9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-3495744 : Rat) / 2995) [(9, 1), (11, 1), (13, 1), (15, 3)],
  term (132 : Rat) [(9, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((-3448896 : Rat) / 2995) [(9, 1), (11, 1), (13, 2)],
  term ((40176 : Rat) / 2995) [(9, 1), (11, 1), (13, 2), (14, 1)],
  term ((-134976 : Rat) / 2995) [(9, 1), (11, 1), (13, 2), (14, 1), (15, 2)],
  term ((-16 : Rat) / 5) [(9, 1), (11, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((4125984 : Rat) / 2995) [(9, 1), (11, 1), (13, 2), (15, 2)],
  term (-182 : Rat) [(9, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((67488 : Rat) / 2995) [(9, 1), (11, 1), (13, 3), (14, 1), (15, 1)],
  term ((8 : Rat) / 5) [(9, 1), (11, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-1189056 : Rat) / 2995) [(9, 1), (11, 1), (13, 3), (15, 1)],
  term (58 : Rat) [(9, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((-428544 : Rat) / 599) [(9, 1), (11, 2), (12, 1), (13, 1), (14, 1)],
  term ((107136 : Rat) / 2995) [(9, 1), (11, 2), (12, 1), (13, 1), (14, 2)],
  term ((8681472 : Rat) / 2995) [(9, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((-1896 : Rat) / 5) [(9, 1), (11, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((214272 : Rat) / 599) [(9, 1), (11, 2), (12, 2), (13, 1)],
  term ((-53568 : Rat) / 2995) [(9, 1), (11, 2), (12, 2), (13, 1), (14, 1)],
  term ((-4340736 : Rat) / 2995) [(9, 1), (11, 2), (12, 2), (15, 1)],
  term ((948 : Rat) / 5) [(9, 1), (11, 2), (12, 2), (15, 1), (16, 1)],
  term ((8681472 : Rat) / 2995) [(9, 1), (11, 2), (13, 1), (15, 2)],
  term ((-1896 : Rat) / 5) [(9, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((107136 : Rat) / 2995) [(9, 1), (11, 2), (13, 2), (14, 1), (15, 1)],
  term ((-6483456 : Rat) / 2995) [(9, 1), (11, 2), (13, 2), (15, 1)],
  term ((948 : Rat) / 5) [(9, 1), (11, 2), (13, 2), (15, 1), (16, 1)],
  term ((214272 : Rat) / 599) [(9, 1), (11, 2), (13, 3)],
  term ((-53568 : Rat) / 2995) [(9, 1), (11, 2), (13, 3), (14, 1)],
  term ((-5785344 : Rat) / 2995) [(9, 1), (11, 3), (12, 1), (14, 1)],
  term ((2892672 : Rat) / 2995) [(9, 1), (11, 3), (12, 2)],
  term ((-5785344 : Rat) / 2995) [(9, 1), (11, 3), (13, 1), (15, 1)],
  term ((2892672 : Rat) / 2995) [(9, 1), (11, 3), (13, 2)],
  term ((6860 : Rat) / 599) [(9, 1), (12, 1), (13, 1), (14, 1)],
  term ((-98496 : Rat) / 2995) [(9, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((-12 : Rat) / 5) [(9, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term (-8 : Rat) [(9, 1), (12, 1), (13, 1), (14, 2)],
  term ((65664 : Rat) / 2995) [(9, 1), (12, 1), (13, 1), (14, 2), (15, 2)],
  term ((8 : Rat) / 5) [(9, 1), (12, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-7110576 : Rat) / 2995) [(9, 1), (12, 1), (14, 1), (15, 1)],
  term ((1603 : Rat) / 5) [(9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((32832 : Rat) / 2995) [(9, 1), (12, 1), (14, 1), (15, 3)],
  term ((4 : Rat) / 5) [(9, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((16416 : Rat) / 2995) [(9, 1), (12, 1), (14, 2), (15, 1)],
  term ((2 : Rat) / 5) [(9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-3430 : Rat) / 599) [(9, 1), (12, 2), (13, 1)],
  term (4 : Rat) [(9, 1), (12, 2), (13, 1), (14, 1)],
  term ((-32832 : Rat) / 2995) [(9, 1), (12, 2), (13, 1), (14, 1), (15, 2)],
  term ((-4 : Rat) / 5) [(9, 1), (12, 2), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((49248 : Rat) / 2995) [(9, 1), (12, 2), (13, 1), (15, 2)],
  term ((6 : Rat) / 5) [(9, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-8208 : Rat) / 2995) [(9, 1), (12, 2), (14, 1), (15, 1)],
  term ((-1 : Rat) / 5) [(9, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((3555288 : Rat) / 2995) [(9, 1), (12, 2), (15, 1)],
  term ((-1603 : Rat) / 10) [(9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-16416 : Rat) / 2995) [(9, 1), (12, 2), (15, 3)],
  term ((-2 : Rat) / 5) [(9, 1), (12, 2), (15, 3), (16, 1)],
  term ((16416 : Rat) / 2995) [(9, 1), (13, 1), (14, 1), (15, 2)],
  term ((2 : Rat) / 5) [(9, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-7110576 : Rat) / 2995) [(9, 1), (13, 1), (15, 2)],
  term ((1603 : Rat) / 5) [(9, 1), (13, 1), (15, 2), (16, 1)],
  term ((32832 : Rat) / 2995) [(9, 1), (13, 1), (15, 4)],
  term ((4 : Rat) / 5) [(9, 1), (13, 1), (15, 4), (16, 1)],
  term ((-32168 : Rat) / 2995) [(9, 1), (13, 2), (14, 1), (15, 1)],
  term ((-1 : Rat) / 5) [(9, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((65664 : Rat) / 2995) [(9, 1), (13, 2), (14, 1), (15, 3)],
  term ((8 : Rat) / 5) [(9, 1), (13, 2), (14, 1), (15, 3), (16, 1)],
  term ((3589588 : Rat) / 2995) [(9, 1), (13, 2), (15, 1)],
  term ((-1603 : Rat) / 10) [(9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-114912 : Rat) / 2995) [(9, 1), (13, 2), (15, 3)],
  term ((-14 : Rat) / 5) [(9, 1), (13, 2), (15, 3), (16, 1)],
  term ((-3430 : Rat) / 599) [(9, 1), (13, 3)],
  term (4 : Rat) [(9, 1), (13, 3), (14, 1)],
  term ((-32832 : Rat) / 2995) [(9, 1), (13, 3), (14, 1), (15, 2)],
  term ((-4 : Rat) / 5) [(9, 1), (13, 3), (14, 1), (15, 2), (16, 1)],
  term ((49248 : Rat) / 2995) [(9, 1), (13, 3), (15, 2)],
  term ((6 : Rat) / 5) [(9, 1), (13, 3), (15, 2), (16, 1)],
  term ((247680 : Rat) / 599) [(9, 2), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-144 : Rat) / 5) [(9, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-123840 : Rat) / 599) [(9, 2), (11, 1), (12, 2), (15, 1)],
  term ((72 : Rat) / 5) [(9, 2), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((247680 : Rat) / 599) [(9, 2), (11, 1), (13, 1), (15, 2)],
  term ((-144 : Rat) / 5) [(9, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-123840 : Rat) / 599) [(9, 2), (11, 1), (13, 2), (15, 1)],
  term ((72 : Rat) / 5) [(9, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-642816 : Rat) / 2995) [(9, 2), (11, 2), (12, 1), (14, 1)],
  term ((321408 : Rat) / 2995) [(9, 2), (11, 2), (12, 2)],
  term ((-642816 : Rat) / 2995) [(9, 2), (11, 2), (13, 1), (15, 1)],
  term ((321408 : Rat) / 2995) [(9, 2), (11, 2), (13, 2)],
  term ((5448 : Rat) / 599) [(9, 2), (12, 1), (14, 1)],
  term ((-262656 : Rat) / 2995) [(9, 2), (12, 1), (14, 1), (15, 2)],
  term ((-32 : Rat) / 5) [(9, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2724 : Rat) / 599) [(9, 2), (12, 2)],
  term ((131328 : Rat) / 2995) [(9, 2), (12, 2), (15, 2)],
  term ((16 : Rat) / 5) [(9, 2), (12, 2), (15, 2), (16, 1)],
  term ((5448 : Rat) / 599) [(9, 2), (13, 1), (15, 1)],
  term ((-262656 : Rat) / 2995) [(9, 2), (13, 1), (15, 3)],
  term ((-32 : Rat) / 5) [(9, 2), (13, 1), (15, 3), (16, 1)],
  term ((-2724 : Rat) / 599) [(9, 2), (13, 2)],
  term ((131328 : Rat) / 2995) [(9, 2), (13, 2), (15, 2)],
  term ((16 : Rat) / 5) [(9, 2), (13, 2), (15, 2), (16, 1)],
  term ((482112 : Rat) / 2995) [(10, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-9967104 : Rat) / 2995) [(10, 1), (11, 1), (12, 1), (14, 2), (15, 1)],
  term ((1896 : Rat) / 5) [(10, 1), (11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((4983552 : Rat) / 2995) [(10, 1), (11, 1), (12, 2), (14, 1), (15, 1)],
  term ((-948 : Rat) / 5) [(10, 1), (11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-241056 : Rat) / 2995) [(10, 1), (11, 1), (12, 2), (15, 1)],
  term ((-9967104 : Rat) / 2995) [(10, 1), (11, 1), (13, 1), (14, 1), (15, 2)],
  term ((1896 : Rat) / 5) [(10, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((482112 : Rat) / 2995) [(10, 1), (11, 1), (13, 1), (15, 2)],
  term ((4983552 : Rat) / 2995) [(10, 1), (11, 1), (13, 2), (14, 1), (15, 1)],
  term ((-948 : Rat) / 5) [(10, 1), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-241056 : Rat) / 2995) [(10, 1), (11, 1), (13, 2), (15, 1)],
  term ((5785344 : Rat) / 2995) [(10, 1), (11, 2), (12, 1), (14, 2)],
  term ((-2892672 : Rat) / 2995) [(10, 1), (11, 2), (12, 2), (14, 1)],
  term ((5785344 : Rat) / 2995) [(10, 1), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((-2892672 : Rat) / 2995) [(10, 1), (11, 2), (13, 2), (14, 1)],
  term (16 : Rat) [(10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(10, 1), (12, 1), (14, 1)],
  term ((-670116 : Rat) / 2995) [(10, 1), (12, 1), (14, 1), (15, 2)],
  term ((158 : Rat) / 5) [(10, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-38550 : Rat) / 599) [(10, 1), (12, 1), (14, 2)],
  term ((4847616 : Rat) / 2995) [(10, 1), (12, 1), (14, 2), (15, 2)],
  term ((-1068 : Rat) / 5) [(10, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term (6 : Rat) [(10, 1), (12, 2)],
  term (-8 : Rat) [(10, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((19275 : Rat) / 599) [(10, 1), (12, 2), (14, 1)],
  term ((-2423808 : Rat) / 2995) [(10, 1), (12, 2), (14, 1), (15, 2)],
  term ((534 : Rat) / 5) [(10, 1), (12, 2), (14, 1), (15, 2), (16, 1)],
  term ((335058 : Rat) / 2995) [(10, 1), (12, 2), (15, 2)],
  term ((-79 : Rat) / 5) [(10, 1), (12, 2), (15, 2), (16, 1)],
  term ((-38550 : Rat) / 599) [(10, 1), (13, 1), (14, 1), (15, 1)],
  term ((4847616 : Rat) / 2995) [(10, 1), (13, 1), (14, 1), (15, 3)],
  term ((-1068 : Rat) / 5) [(10, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term (-12 : Rat) [(10, 1), (13, 1), (15, 1)],
  term ((-670116 : Rat) / 2995) [(10, 1), (13, 1), (15, 3)],
  term ((158 : Rat) / 5) [(10, 1), (13, 1), (15, 3), (16, 1)],
  term (6 : Rat) [(10, 1), (13, 2)],
  term ((19275 : Rat) / 599) [(10, 1), (13, 2), (14, 1)],
  term ((-2423808 : Rat) / 2995) [(10, 1), (13, 2), (14, 1), (15, 2)],
  term ((534 : Rat) / 5) [(10, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((335058 : Rat) / 2995) [(10, 1), (13, 2), (15, 2)],
  term ((1 : Rat) / 5) [(10, 1), (13, 2), (15, 2), (16, 1)],
  term (-8 : Rat) [(10, 1), (13, 3), (15, 1), (16, 1)],
  term ((1768896 : Rat) / 599) [(11, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((-1514 : Rat) / 5) [(11, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-428544 : Rat) / 2995) [(11, 1), (12, 1), (13, 1), (14, 2)],
  term ((244224 : Rat) / 2995) [(11, 1), (12, 1), (13, 1), (14, 2), (15, 2)],
  term ((-132 : Rat) / 5) [(11, 1), (12, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((6925194 : Rat) / 2995) [(11, 1), (12, 1), (14, 1), (15, 1)],
  term (-337 : Rat) [(11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((4969728 : Rat) / 2995) [(11, 1), (12, 1), (14, 1), (15, 3)],
  term ((-1134 : Rat) / 5) [(11, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((-5456412 : Rat) / 2995) [(11, 1), (12, 1), (14, 2), (15, 1)],
  term ((1153 : Rat) / 5) [(11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((214272 : Rat) / 2995) [(11, 1), (12, 2), (13, 1), (14, 1)],
  term ((-122112 : Rat) / 2995) [(11, 1), (12, 2), (13, 1), (14, 1), (15, 2)],
  term ((66 : Rat) / 5) [(11, 1), (12, 2), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-884448 : Rat) / 599) [(11, 1), (12, 2), (13, 1), (15, 2)],
  term ((757 : Rat) / 5) [(11, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((2728206 : Rat) / 2995) [(11, 1), (12, 2), (14, 1), (15, 1)],
  term ((-1153 : Rat) / 10) [(11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-3462597 : Rat) / 2995) [(11, 1), (12, 2), (15, 1)],
  term ((337 : Rat) / 2) [(11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-2484864 : Rat) / 2995) [(11, 1), (12, 2), (15, 3)],
  term ((567 : Rat) / 5) [(11, 1), (12, 2), (15, 3), (16, 1)],
  term ((-5456412 : Rat) / 2995) [(11, 1), (13, 1), (14, 1), (15, 2)],
  term ((1153 : Rat) / 5) [(11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((6925194 : Rat) / 2995) [(11, 1), (13, 1), (15, 2)],
  term (-337 : Rat) [(11, 1), (13, 1), (15, 2), (16, 1)],
  term ((4969728 : Rat) / 2995) [(11, 1), (13, 1), (15, 4)],
  term ((-1134 : Rat) / 5) [(11, 1), (13, 1), (15, 4), (16, 1)],
  term ((2299662 : Rat) / 2995) [(11, 1), (13, 2), (14, 1), (15, 1)],
  term ((-1153 : Rat) / 10) [(11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((244224 : Rat) / 2995) [(11, 1), (13, 2), (14, 1), (15, 3)],
  term ((-132 : Rat) / 5) [(11, 1), (13, 2), (14, 1), (15, 3), (16, 1)],
  term ((-3462597 : Rat) / 2995) [(11, 1), (13, 2), (15, 1)],
  term ((337 : Rat) / 2) [(11, 1), (13, 2), (15, 1), (16, 1)],
  term ((6359616 : Rat) / 2995) [(11, 1), (13, 2), (15, 3)],
  term ((-947 : Rat) / 5) [(11, 1), (13, 2), (15, 3), (16, 1)],
  term ((214272 : Rat) / 2995) [(11, 1), (13, 3), (14, 1)],
  term ((-122112 : Rat) / 2995) [(11, 1), (13, 3), (14, 1), (15, 2)],
  term ((66 : Rat) / 5) [(11, 1), (13, 3), (14, 1), (15, 2), (16, 1)],
  term ((-884448 : Rat) / 599) [(11, 1), (13, 3), (15, 2)],
  term ((757 : Rat) / 5) [(11, 1), (13, 3), (15, 2), (16, 1)],
  term ((-4660416 : Rat) / 2995) [(11, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-321408 : Rat) / 2995) [(11, 2), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((-1098144 : Rat) / 599) [(11, 2), (12, 1), (14, 1)],
  term ((-10127808 : Rat) / 2995) [(11, 2), (12, 1), (14, 1), (15, 2)],
  term ((1896 : Rat) / 5) [(11, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((3562272 : Rat) / 2995) [(11, 2), (12, 1), (14, 2)],
  term ((549072 : Rat) / 599) [(11, 2), (12, 2)],
  term ((160704 : Rat) / 2995) [(11, 2), (12, 2), (13, 1), (14, 1), (15, 1)],
  term ((2330208 : Rat) / 2995) [(11, 2), (12, 2), (13, 1), (15, 1)],
  term ((-1781136 : Rat) / 2995) [(11, 2), (12, 2), (14, 1)],
  term ((5063904 : Rat) / 2995) [(11, 2), (12, 2), (15, 2)],
  term ((-948 : Rat) / 5) [(11, 2), (12, 2), (15, 2), (16, 1)],
  term ((3562272 : Rat) / 2995) [(11, 2), (13, 1), (14, 1), (15, 1)],
  term ((-1098144 : Rat) / 599) [(11, 2), (13, 1), (15, 1)],
  term ((-10127808 : Rat) / 2995) [(11, 2), (13, 1), (15, 3)],
  term ((1896 : Rat) / 5) [(11, 2), (13, 1), (15, 3), (16, 1)],
  term ((549072 : Rat) / 599) [(11, 2), (13, 2)],
  term ((-1781136 : Rat) / 2995) [(11, 2), (13, 2), (14, 1)],
  term ((-321408 : Rat) / 2995) [(11, 2), (13, 2), (14, 1), (15, 2)],
  term ((403488 : Rat) / 2995) [(11, 2), (13, 2), (15, 2)],
  term ((-948 : Rat) / 5) [(11, 2), (13, 2), (15, 2), (16, 1)],
  term ((160704 : Rat) / 2995) [(11, 2), (13, 3), (14, 1), (15, 1)],
  term ((2330208 : Rat) / 2995) [(11, 2), (13, 3), (15, 1)],
  term ((5785344 : Rat) / 2995) [(11, 3), (12, 1), (14, 1), (15, 1)],
  term ((-2892672 : Rat) / 2995) [(11, 3), (12, 2), (15, 1)],
  term ((5785344 : Rat) / 2995) [(11, 3), (13, 1), (15, 2)],
  term ((-2892672 : Rat) / 2995) [(11, 3), (13, 2), (15, 1)],
  term ((43064 : Rat) / 599) [(12, 1), (13, 1), (14, 1), (15, 1)],
  term (-4 : Rat) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4847616 : Rat) / 2995) [(12, 1), (13, 1), (14, 1), (15, 3)],
  term ((1068 : Rat) / 5) [(12, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((410752 : Rat) / 2995) [(12, 1), (13, 1), (14, 2), (15, 1)],
  term ((-66 : Rat) / 5) [(12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-2218432 : Rat) / 2995) [(12, 1), (14, 1), (15, 2)],
  term ((501 : Rat) / 5) [(12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-20246 : Rat) / 599) [(12, 1), (14, 2)],
  term ((2423808 : Rat) / 2995) [(12, 1), (14, 2), (15, 2)],
  term ((-534 : Rat) / 5) [(12, 1), (14, 2), (15, 2), (16, 1)],
  term ((-205376 : Rat) / 2995) [(12, 2), (13, 1), (14, 1), (15, 1)],
  term ((33 : Rat) / 5) [(12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-21532 : Rat) / 599) [(12, 2), (13, 1), (15, 1)],
  term (2 : Rat) [(12, 2), (13, 1), (15, 1), (16, 1)],
  term ((2423808 : Rat) / 2995) [(12, 2), (13, 1), (15, 3)],
  term ((-534 : Rat) / 5) [(12, 2), (13, 1), (15, 3), (16, 1)],
  term ((10123 : Rat) / 599) [(12, 2), (14, 1)],
  term ((-1211904 : Rat) / 2995) [(12, 2), (14, 1), (15, 2)],
  term ((267 : Rat) / 5) [(12, 2), (14, 1), (15, 2), (16, 1)],
  term ((1109216 : Rat) / 2995) [(12, 2), (15, 2)],
  term ((-501 : Rat) / 10) [(12, 2), (15, 2), (16, 1)],
  term ((-20246 : Rat) / 599) [(13, 1), (14, 1), (15, 1)],
  term ((2423808 : Rat) / 2995) [(13, 1), (14, 1), (15, 3)],
  term ((-534 : Rat) / 5) [(13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-2218432 : Rat) / 2995) [(13, 1), (15, 3)],
  term ((501 : Rat) / 5) [(13, 1), (15, 3), (16, 1)],
  term ((10123 : Rat) / 599) [(13, 2), (14, 1)],
  term ((-801152 : Rat) / 2995) [(13, 2), (14, 1), (15, 2)],
  term ((201 : Rat) / 5) [(13, 2), (14, 1), (15, 2), (16, 1)],
  term ((1324536 : Rat) / 2995) [(13, 2), (15, 2)],
  term ((-541 : Rat) / 10) [(13, 2), (15, 2), (16, 1)],
  term ((-4847616 : Rat) / 2995) [(13, 2), (15, 4)],
  term ((1068 : Rat) / 5) [(13, 2), (15, 4), (16, 1)],
  term ((-205376 : Rat) / 2995) [(13, 3), (14, 1), (15, 1)],
  term ((33 : Rat) / 5) [(13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-21532 : Rat) / 599) [(13, 3), (15, 1)],
  term (2 : Rat) [(13, 3), (15, 1), (16, 1)],
  term ((2423808 : Rat) / 2995) [(13, 3), (15, 3)],
  term ((-534 : Rat) / 5) [(13, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 30, terms 300 through 373. -/
theorem rs_R010_ueqv_R010NYN_block_30_0300_0373_valid :
    checkProductSumEq rs_R010_ueqv_R010NYN_partials_30_0300_0373
      rs_R010_ueqv_R010NYN_block_30_0300_0373 = true := by
  native_decide

end R010UeqvR010NYNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
