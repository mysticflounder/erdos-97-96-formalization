/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R010:u=v:R010NYN, term block 25:300-399

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R010UeqvR010NYNTermShards

/-- Generator polynomial 25 for relaxed split surplus certificate `R010:u=v:R010NYN`. -/
def rs_R010_ueqv_R010NYN_generator_25_0300_0399 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(12, 1)]
]

/-- Coefficient term 300 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0300 : Poly :=
[
  term ((1714176 : Rat) / 2995) [(1, 1), (8, 1), (11, 1), (12, 1)]
]

/-- Partial product 300 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0300 : Poly :=
[
  term ((-1714176 : Rat) / 2995) [(1, 1), (8, 1), (11, 1), (12, 1)],
  term ((3428352 : Rat) / 2995) [(1, 1), (8, 1), (11, 1), (12, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 300 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0300_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0300
        rs_R010_ueqv_R010NYN_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYN_partial_25_0300 := by
  native_decide

/-- Coefficient term 301 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0301 : Poly :=
[
  term ((-642816 : Rat) / 2995) [(1, 1), (8, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 301 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0301 : Poly :=
[
  term ((-1285632 : Rat) / 2995) [(1, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((642816 : Rat) / 2995) [(1, 1), (8, 1), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 301 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0301_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0301
        rs_R010_ueqv_R010NYN_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYN_partial_25_0301 := by
  native_decide

/-- Coefficient term 302 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0302 : Poly :=
[
  term ((-3803328 : Rat) / 2995) [(1, 1), (8, 1), (11, 1), (14, 1)]
]

/-- Partial product 302 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0302 : Poly :=
[
  term ((-7606656 : Rat) / 2995) [(1, 1), (8, 1), (11, 1), (12, 1), (14, 1)],
  term ((3803328 : Rat) / 2995) [(1, 1), (8, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 302 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0302_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0302
        rs_R010_ueqv_R010NYN_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYN_partial_25_0302 := by
  native_decide

/-- Coefficient term 303 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0303 : Poly :=
[
  term ((1490304 : Rat) / 599) [(1, 1), (8, 1), (11, 1), (15, 2)]
]

/-- Partial product 303 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0303 : Poly :=
[
  term ((2980608 : Rat) / 599) [(1, 1), (8, 1), (11, 1), (12, 1), (15, 2)],
  term ((-1490304 : Rat) / 599) [(1, 1), (8, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 303 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0303_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0303
        rs_R010_ueqv_R010NYN_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYN_partial_25_0303 := by
  native_decide

/-- Coefficient term 304 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0304 : Poly :=
[
  term ((-1724 : Rat) / 5) [(1, 1), (8, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 304 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0304 : Poly :=
[
  term ((-3448 : Rat) / 5) [(1, 1), (8, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((1724 : Rat) / 5) [(1, 1), (8, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 304 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0304_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0304
        rs_R010_ueqv_R010NYN_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYN_partial_25_0304 := by
  native_decide

/-- Coefficient term 305 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0305 : Poly :=
[
  term ((-11467008 : Rat) / 2995) [(1, 1), (8, 1), (11, 2), (15, 1)]
]

/-- Partial product 305 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0305 : Poly :=
[
  term ((-22934016 : Rat) / 2995) [(1, 1), (8, 1), (11, 2), (12, 1), (15, 1)],
  term ((11467008 : Rat) / 2995) [(1, 1), (8, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 305 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0305_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0305
        rs_R010_ueqv_R010NYN_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYN_partial_25_0305 := by
  native_decide

/-- Coefficient term 306 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0306 : Poly :=
[
  term ((1896 : Rat) / 5) [(1, 1), (8, 1), (11, 2), (15, 1), (16, 1)]
]

/-- Partial product 306 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0306 : Poly :=
[
  term ((3792 : Rat) / 5) [(1, 1), (8, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-1896 : Rat) / 5) [(1, 1), (8, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 306 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0306_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0306
        rs_R010_ueqv_R010NYN_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYN_partial_25_0306 := by
  native_decide

/-- Coefficient term 307 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0307 : Poly :=
[
  term ((5785344 : Rat) / 2995) [(1, 1), (8, 1), (11, 3)]
]

/-- Partial product 307 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0307 : Poly :=
[
  term ((-5785344 : Rat) / 2995) [(1, 1), (8, 1), (11, 3)],
  term ((11570688 : Rat) / 2995) [(1, 1), (8, 1), (11, 3), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 307 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0307_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0307
        rs_R010_ueqv_R010NYN_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYN_partial_25_0307 := by
  native_decide

/-- Coefficient term 308 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0308 : Poly :=
[
  term ((-1838208 : Rat) / 2995) [(1, 1), (8, 1), (12, 1), (15, 1)]
]

/-- Partial product 308 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0308 : Poly :=
[
  term ((1838208 : Rat) / 2995) [(1, 1), (8, 1), (12, 1), (15, 1)],
  term ((-3676416 : Rat) / 2995) [(1, 1), (8, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 308 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0308_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0308
        rs_R010_ueqv_R010NYN_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYN_partial_25_0308 := by
  native_decide

/-- Coefficient term 309 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0309 : Poly :=
[
  term ((424 : Rat) / 5) [(1, 1), (8, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 309 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0309 : Poly :=
[
  term ((-424 : Rat) / 5) [(1, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((848 : Rat) / 5) [(1, 1), (8, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 309 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0309_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0309
        rs_R010_ueqv_R010NYN_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYN_partial_25_0309 := by
  native_decide

/-- Coefficient term 310 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0310 : Poly :=
[
  term ((131328 : Rat) / 2995) [(1, 1), (8, 1), (13, 1), (15, 2)]
]

/-- Partial product 310 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0310 : Poly :=
[
  term ((262656 : Rat) / 2995) [(1, 1), (8, 1), (12, 1), (13, 1), (15, 2)],
  term ((-131328 : Rat) / 2995) [(1, 1), (8, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 310 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0310_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0310
        rs_R010_ueqv_R010NYN_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYN_partial_25_0310 := by
  native_decide

/-- Coefficient term 311 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0311 : Poly :=
[
  term ((16 : Rat) / 5) [(1, 1), (8, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 311 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0311 : Poly :=
[
  term ((32 : Rat) / 5) [(1, 1), (8, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-16 : Rat) / 5) [(1, 1), (8, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 311 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0311_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0311
        rs_R010_ueqv_R010NYN_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYN_partial_25_0311 := by
  native_decide

/-- Coefficient term 312 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0312 : Poly :=
[
  term ((4050624 : Rat) / 2995) [(1, 1), (8, 1), (14, 1), (15, 1)]
]

/-- Partial product 312 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0312 : Poly :=
[
  term ((8101248 : Rat) / 2995) [(1, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((-4050624 : Rat) / 2995) [(1, 1), (8, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 312 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0312_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0312
        rs_R010_ueqv_R010NYN_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYN_partial_25_0312 := by
  native_decide

/-- Coefficient term 313 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0313 : Poly :=
[
  term ((-972 : Rat) / 5) [(1, 1), (8, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 313 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0313 : Poly :=
[
  term ((-1944 : Rat) / 5) [(1, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((972 : Rat) / 5) [(1, 1), (8, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 313 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0313_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0313
        rs_R010_ueqv_R010NYN_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYN_partial_25_0313 := by
  native_decide

/-- Coefficient term 314 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0314 : Poly :=
[
  term ((2231112 : Rat) / 2995) [(1, 1), (8, 1), (15, 1)]
]

/-- Partial product 314 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0314 : Poly :=
[
  term ((4462224 : Rat) / 2995) [(1, 1), (8, 1), (12, 1), (15, 1)],
  term ((-2231112 : Rat) / 2995) [(1, 1), (8, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 314 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0314_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0314
        rs_R010_ueqv_R010NYN_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYN_partial_25_0314 := by
  native_decide

/-- Coefficient term 315 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0315 : Poly :=
[
  term ((-546 : Rat) / 5) [(1, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 315 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0315 : Poly :=
[
  term ((-1092 : Rat) / 5) [(1, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((546 : Rat) / 5) [(1, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 315 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0315_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0315
        rs_R010_ueqv_R010NYN_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYN_partial_25_0315 := by
  native_decide

/-- Coefficient term 316 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0316 : Poly :=
[
  term ((-262656 : Rat) / 2995) [(1, 1), (8, 1), (15, 3)]
]

/-- Partial product 316 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0316 : Poly :=
[
  term ((-525312 : Rat) / 2995) [(1, 1), (8, 1), (12, 1), (15, 3)],
  term ((262656 : Rat) / 2995) [(1, 1), (8, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 316 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0316_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0316
        rs_R010_ueqv_R010NYN_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYN_partial_25_0316 := by
  native_decide

/-- Coefficient term 317 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0317 : Poly :=
[
  term ((-32 : Rat) / 5) [(1, 1), (8, 1), (15, 3), (16, 1)]
]

/-- Partial product 317 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0317 : Poly :=
[
  term ((-64 : Rat) / 5) [(1, 1), (8, 1), (12, 1), (15, 3), (16, 1)],
  term ((32 : Rat) / 5) [(1, 1), (8, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 317 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0317_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0317
        rs_R010_ueqv_R010NYN_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYN_partial_25_0317 := by
  native_decide

/-- Coefficient term 318 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0318 : Poly :=
[
  term ((214272 : Rat) / 2995) [(1, 1), (8, 2), (11, 1)]
]

/-- Partial product 318 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0318 : Poly :=
[
  term ((-214272 : Rat) / 2995) [(1, 1), (8, 2), (11, 1)],
  term ((428544 : Rat) / 2995) [(1, 1), (8, 2), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 318 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0318_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0318
        rs_R010_ueqv_R010NYN_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYN_partial_25_0318 := by
  native_decide

/-- Coefficient term 319 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0319 : Poly :=
[
  term ((-341376 : Rat) / 2995) [(1, 1), (8, 2), (15, 1)]
]

/-- Partial product 319 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0319 : Poly :=
[
  term ((-682752 : Rat) / 2995) [(1, 1), (8, 2), (12, 1), (15, 1)],
  term ((341376 : Rat) / 2995) [(1, 1), (8, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 319 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0319_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0319
        rs_R010_ueqv_R010NYN_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYN_partial_25_0319 := by
  native_decide

/-- Coefficient term 320 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0320 : Poly :=
[
  term ((128 : Rat) / 5) [(1, 1), (8, 2), (15, 1), (16, 1)]
]

/-- Partial product 320 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0320 : Poly :=
[
  term ((256 : Rat) / 5) [(1, 1), (8, 2), (12, 1), (15, 1), (16, 1)],
  term ((-128 : Rat) / 5) [(1, 1), (8, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 320 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0320_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0320
        rs_R010_ueqv_R010NYN_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYN_partial_25_0320 := by
  native_decide

/-- Coefficient term 321 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0321 : Poly :=
[
  term ((512064 : Rat) / 2995) [(1, 1), (9, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 321 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0321 : Poly :=
[
  term ((-512064 : Rat) / 2995) [(1, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((1024128 : Rat) / 2995) [(1, 1), (9, 1), (11, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 321 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0321_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0321
        rs_R010_ueqv_R010NYN_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYN_partial_25_0321 := by
  native_decide

/-- Coefficient term 322 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0322 : Poly :=
[
  term ((-192 : Rat) / 5) [(1, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 322 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0322 : Poly :=
[
  term ((192 : Rat) / 5) [(1, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-384 : Rat) / 5) [(1, 1), (9, 1), (11, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 322 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0322_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0322
        rs_R010_ueqv_R010NYN_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYN_partial_25_0322 := by
  native_decide

/-- Coefficient term 323 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0323 : Poly :=
[
  term ((-1365504 : Rat) / 2995) [(1, 1), (9, 1), (11, 1), (14, 1), (15, 1)]
]

/-- Partial product 323 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0323 : Poly :=
[
  term ((-2731008 : Rat) / 2995) [(1, 1), (9, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((1365504 : Rat) / 2995) [(1, 1), (9, 1), (11, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 323 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0323_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0323
        rs_R010_ueqv_R010NYN_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYN_partial_25_0323 := by
  native_decide

/-- Coefficient term 324 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0324 : Poly :=
[
  term ((512 : Rat) / 5) [(1, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 324 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0324 : Poly :=
[
  term ((1024 : Rat) / 5) [(1, 1), (9, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-512 : Rat) / 5) [(1, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 324 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0324_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0324
        rs_R010_ueqv_R010NYN_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYN_partial_25_0324 := by
  native_decide

/-- Coefficient term 325 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0325 : Poly :=
[
  term ((-85344 : Rat) / 599) [(1, 1), (9, 1), (11, 1), (15, 1)]
]

/-- Partial product 325 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0325 : Poly :=
[
  term ((-170688 : Rat) / 599) [(1, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((85344 : Rat) / 599) [(1, 1), (9, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 325 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0325_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0325
        rs_R010_ueqv_R010NYN_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYN_partial_25_0325 := by
  native_decide

/-- Coefficient term 326 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0326 : Poly :=
[
  term (32 : Rat) [(1, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 326 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0326 : Poly :=
[
  term (64 : Rat) [(1, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term (-32 : Rat) [(1, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 326 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0326_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0326
        rs_R010_ueqv_R010NYN_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYN_partial_25_0326 := by
  native_decide

/-- Coefficient term 327 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0327 : Poly :=
[
  term ((53568 : Rat) / 599) [(1, 1), (9, 1), (11, 2)]
]

/-- Partial product 327 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0327 : Poly :=
[
  term ((-53568 : Rat) / 599) [(1, 1), (9, 1), (11, 2)],
  term ((107136 : Rat) / 599) [(1, 1), (9, 1), (11, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 327 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0327_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0327
        rs_R010_ueqv_R010NYN_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYN_partial_25_0327 := by
  native_decide

/-- Coefficient term 328 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0328 : Poly :=
[
  term ((-321408 : Rat) / 2995) [(1, 1), (9, 1), (11, 2), (12, 1)]
]

/-- Partial product 328 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0328 : Poly :=
[
  term ((321408 : Rat) / 2995) [(1, 1), (9, 1), (11, 2), (12, 1)],
  term ((-642816 : Rat) / 2995) [(1, 1), (9, 1), (11, 2), (12, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 328 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0328_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0328
        rs_R010_ueqv_R010NYN_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYN_partial_25_0328 := by
  native_decide

/-- Coefficient term 329 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0329 : Poly :=
[
  term ((857088 : Rat) / 2995) [(1, 1), (9, 1), (11, 2), (14, 1)]
]

/-- Partial product 329 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0329 : Poly :=
[
  term ((1714176 : Rat) / 2995) [(1, 1), (9, 1), (11, 2), (12, 1), (14, 1)],
  term ((-857088 : Rat) / 2995) [(1, 1), (9, 1), (11, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 329 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0329_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0329
        rs_R010_ueqv_R010NYN_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYN_partial_25_0329 := by
  native_decide

/-- Coefficient term 330 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0330 : Poly :=
[
  term ((-53568 : Rat) / 599) [(1, 1), (10, 1), (11, 1), (12, 1)]
]

/-- Partial product 330 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0330 : Poly :=
[
  term ((53568 : Rat) / 599) [(1, 1), (10, 1), (11, 1), (12, 1)],
  term ((-107136 : Rat) / 599) [(1, 1), (10, 1), (11, 1), (12, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 330 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0330_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0330
        rs_R010_ueqv_R010NYN_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYN_partial_25_0330 := by
  native_decide

/-- Coefficient term 331 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0331 : Poly :=
[
  term ((321408 : Rat) / 2995) [(1, 1), (10, 1), (11, 1), (14, 1)]
]

/-- Partial product 331 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0331 : Poly :=
[
  term ((642816 : Rat) / 2995) [(1, 1), (10, 1), (11, 1), (12, 1), (14, 1)],
  term ((-321408 : Rat) / 2995) [(1, 1), (10, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 331 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0331_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0331
        rs_R010_ueqv_R010NYN_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYN_partial_25_0331 := by
  native_decide

/-- Coefficient term 332 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0332 : Poly :=
[
  term ((49632 : Rat) / 599) [(1, 1), (10, 1), (12, 1), (15, 1)]
]

/-- Partial product 332 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0332 : Poly :=
[
  term ((-49632 : Rat) / 599) [(1, 1), (10, 1), (12, 1), (15, 1)],
  term ((99264 : Rat) / 599) [(1, 1), (10, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 332 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0332_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0332
        rs_R010_ueqv_R010NYN_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYN_partial_25_0332 := by
  native_decide

/-- Coefficient term 333 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0333 : Poly :=
[
  term (-16 : Rat) [(1, 1), (10, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 333 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0333 : Poly :=
[
  term (16 : Rat) [(1, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term (-32 : Rat) [(1, 1), (10, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 333 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0333_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0333
        rs_R010_ueqv_R010NYN_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYN_partial_25_0333 := by
  native_decide

/-- Coefficient term 334 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0334 : Poly :=
[
  term ((-422784 : Rat) / 2995) [(1, 1), (10, 1), (14, 1), (15, 1)]
]

/-- Partial product 334 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0334 : Poly :=
[
  term ((-845568 : Rat) / 2995) [(1, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((422784 : Rat) / 2995) [(1, 1), (10, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 334 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0334_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0334
        rs_R010_ueqv_R010NYN_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYN_partial_25_0334 := by
  native_decide

/-- Coefficient term 335 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0335 : Poly :=
[
  term ((152 : Rat) / 5) [(1, 1), (10, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 335 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0335 : Poly :=
[
  term ((304 : Rat) / 5) [(1, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-152 : Rat) / 5) [(1, 1), (10, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 335 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0335_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0335
        rs_R010_ueqv_R010NYN_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYN_partial_25_0335 := by
  native_decide

/-- Coefficient term 336 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0336 : Poly :=
[
  term ((-986544 : Rat) / 2995) [(1, 1), (11, 1)]
]

/-- Partial product 336 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0336 : Poly :=
[
  term ((986544 : Rat) / 2995) [(1, 1), (11, 1)],
  term ((-1973088 : Rat) / 2995) [(1, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 336 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0336_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0336
        rs_R010_ueqv_R010NYN_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYN_partial_25_0336 := by
  native_decide

/-- Coefficient term 337 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0337 : Poly :=
[
  term ((-732096 : Rat) / 2995) [(1, 1), (11, 1), (12, 1)]
]

/-- Partial product 337 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0337 : Poly :=
[
  term ((732096 : Rat) / 2995) [(1, 1), (11, 1), (12, 1)],
  term ((-1464192 : Rat) / 2995) [(1, 1), (11, 1), (12, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 337 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0337_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0337
        rs_R010_ueqv_R010NYN_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYN_partial_25_0337 := by
  native_decide

/-- Coefficient term 338 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0338 : Poly :=
[
  term ((-486336 : Rat) / 2995) [(1, 1), (11, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 338 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0338 : Poly :=
[
  term ((-972672 : Rat) / 2995) [(1, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((486336 : Rat) / 2995) [(1, 1), (11, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 338 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0338_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0338
        rs_R010_ueqv_R010NYN_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYN_partial_25_0338 := by
  native_decide

/-- Coefficient term 339 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0339 : Poly :=
[
  term ((176 : Rat) / 5) [(1, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 339 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0339 : Poly :=
[
  term ((352 : Rat) / 5) [(1, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-176 : Rat) / 5) [(1, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 339 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0339_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0339
        rs_R010_ueqv_R010NYN_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYN_partial_25_0339 := by
  native_decide

/-- Coefficient term 340 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0340 : Poly :=
[
  term ((-198624 : Rat) / 599) [(1, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 340 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0340 : Poly :=
[
  term ((-397248 : Rat) / 599) [(1, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((198624 : Rat) / 599) [(1, 1), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 340 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0340_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0340
        rs_R010_ueqv_R010NYN_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYN_partial_25_0340 := by
  native_decide

/-- Coefficient term 341 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0341 : Poly :=
[
  term ((88 : Rat) / 5) [(1, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 341 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0341 : Poly :=
[
  term ((176 : Rat) / 5) [(1, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-88 : Rat) / 5) [(1, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 341 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0341_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0341
        rs_R010_ueqv_R010NYN_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYN_partial_25_0341 := by
  native_decide

/-- Coefficient term 342 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0342 : Poly :=
[
  term ((2853408 : Rat) / 2995) [(1, 1), (11, 1), (14, 1)]
]

/-- Partial product 342 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0342 : Poly :=
[
  term ((5706816 : Rat) / 2995) [(1, 1), (11, 1), (12, 1), (14, 1)],
  term ((-2853408 : Rat) / 2995) [(1, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 342 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0342_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0342
        rs_R010_ueqv_R010NYN_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYN_partial_25_0342 := by
  native_decide

/-- Coefficient term 343 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0343 : Poly :=
[
  term ((-4686912 : Rat) / 2995) [(1, 1), (11, 1), (14, 1), (15, 2)]
]

/-- Partial product 343 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0343 : Poly :=
[
  term ((-9373824 : Rat) / 2995) [(1, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((4686912 : Rat) / 2995) [(1, 1), (11, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 343 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0343_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0343
        rs_R010_ueqv_R010NYN_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYN_partial_25_0343 := by
  native_decide

/-- Coefficient term 344 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0344 : Poly :=
[
  term ((1068 : Rat) / 5) [(1, 1), (11, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 344 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0344 : Poly :=
[
  term ((2136 : Rat) / 5) [(1, 1), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1068 : Rat) / 5) [(1, 1), (11, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 344 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0344_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0344
        rs_R010_ueqv_R010NYN_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYN_partial_25_0344 := by
  native_decide

/-- Coefficient term 345 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0345 : Poly :=
[
  term ((-107136 : Rat) / 2995) [(1, 1), (11, 1), (14, 2)]
]

/-- Partial product 345 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0345 : Poly :=
[
  term ((-214272 : Rat) / 2995) [(1, 1), (11, 1), (12, 1), (14, 2)],
  term ((107136 : Rat) / 2995) [(1, 1), (11, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 345 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0345_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0345
        rs_R010_ueqv_R010NYN_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYN_partial_25_0345 := by
  native_decide

/-- Coefficient term 346 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0346 : Poly :=
[
  term ((1543008 : Rat) / 2995) [(1, 1), (11, 1), (15, 2)]
]

/-- Partial product 346 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0346 : Poly :=
[
  term ((3086016 : Rat) / 2995) [(1, 1), (11, 1), (12, 1), (15, 2)],
  term ((-1543008 : Rat) / 2995) [(1, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 346 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0346_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0346
        rs_R010_ueqv_R010NYN_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYN_partial_25_0346 := by
  native_decide

/-- Coefficient term 347 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0347 : Poly :=
[
  term ((-328 : Rat) / 5) [(1, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 347 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0347 : Poly :=
[
  term ((-656 : Rat) / 5) [(1, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((328 : Rat) / 5) [(1, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 347 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0347_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0347
        rs_R010_ueqv_R010NYN_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYN_partial_25_0347 := by
  native_decide

/-- Coefficient term 348 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0348 : Poly :=
[
  term ((214272 : Rat) / 2995) [(1, 1), (11, 2), (13, 1)]
]

/-- Partial product 348 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0348 : Poly :=
[
  term ((428544 : Rat) / 2995) [(1, 1), (11, 2), (12, 1), (13, 1)],
  term ((-214272 : Rat) / 2995) [(1, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 348 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0348_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0348
        rs_R010_ueqv_R010NYN_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYN_partial_25_0348 := by
  native_decide

/-- Coefficient term 349 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0349 : Poly :=
[
  term ((428544 : Rat) / 2995) [(1, 1), (11, 2), (13, 1), (14, 1)]
]

/-- Partial product 349 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0349 : Poly :=
[
  term ((857088 : Rat) / 2995) [(1, 1), (11, 2), (12, 1), (13, 1), (14, 1)],
  term ((-428544 : Rat) / 2995) [(1, 1), (11, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 349 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0349_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0349
        rs_R010_ueqv_R010NYN_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYN_partial_25_0349 := by
  native_decide

/-- Coefficient term 350 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0350 : Poly :=
[
  term ((9967104 : Rat) / 2995) [(1, 1), (11, 2), (14, 1), (15, 1)]
]

/-- Partial product 350 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0350 : Poly :=
[
  term ((19934208 : Rat) / 2995) [(1, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((-9967104 : Rat) / 2995) [(1, 1), (11, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 350 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0350_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0350
        rs_R010_ueqv_R010NYN_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYN_partial_25_0350 := by
  native_decide

/-- Coefficient term 351 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0351 : Poly :=
[
  term ((-1896 : Rat) / 5) [(1, 1), (11, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 351 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0351 : Poly :=
[
  term ((-3792 : Rat) / 5) [(1, 1), (11, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((1896 : Rat) / 5) [(1, 1), (11, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 351 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0351_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0351
        rs_R010_ueqv_R010NYN_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYN_partial_25_0351 := by
  native_decide

/-- Coefficient term 352 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0352 : Poly :=
[
  term ((-749952 : Rat) / 2995) [(1, 1), (11, 2), (15, 1)]
]

/-- Partial product 352 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0352 : Poly :=
[
  term ((-1499904 : Rat) / 2995) [(1, 1), (11, 2), (12, 1), (15, 1)],
  term ((749952 : Rat) / 2995) [(1, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 352 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0352_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0352
        rs_R010_ueqv_R010NYN_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYN_partial_25_0352 := by
  native_decide

/-- Coefficient term 353 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0353 : Poly :=
[
  term ((-5785344 : Rat) / 2995) [(1, 1), (11, 3), (14, 1)]
]

/-- Partial product 353 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0353 : Poly :=
[
  term ((-11570688 : Rat) / 2995) [(1, 1), (11, 3), (12, 1), (14, 1)],
  term ((5785344 : Rat) / 2995) [(1, 1), (11, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 353 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0353_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0353
        rs_R010_ueqv_R010NYN_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYN_partial_25_0353 := by
  native_decide

/-- Coefficient term 354 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0354 : Poly :=
[
  term ((778608 : Rat) / 2995) [(1, 1), (12, 1), (15, 1)]
]

/-- Partial product 354 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0354 : Poly :=
[
  term ((-778608 : Rat) / 2995) [(1, 1), (12, 1), (15, 1)],
  term ((1557216 : Rat) / 2995) [(1, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 354 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0354_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0354
        rs_R010_ueqv_R010NYN_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYN_partial_25_0354 := by
  native_decide

/-- Coefficient term 355 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0355 : Poly :=
[
  term ((-174 : Rat) / 5) [(1, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 355 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0355 : Poly :=
[
  term ((174 : Rat) / 5) [(1, 1), (12, 1), (15, 1), (16, 1)],
  term ((-348 : Rat) / 5) [(1, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 355 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0355_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0355
        rs_R010_ueqv_R010NYN_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYN_partial_25_0355 := by
  native_decide

/-- Coefficient term 356 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0356 : Poly :=
[
  term (-4 : Rat) [(1, 1), (13, 1)]
]

/-- Partial product 356 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0356 : Poly :=
[
  term (-8 : Rat) [(1, 1), (12, 1), (13, 1)],
  term (4 : Rat) [(1, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 356 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0356_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0356
        rs_R010_ueqv_R010NYN_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYN_partial_25_0356 := by
  native_decide

/-- Coefficient term 357 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0357 : Poly :=
[
  term (-8 : Rat) [(1, 1), (13, 1), (14, 1)]
]

/-- Partial product 357 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0357 : Poly :=
[
  term (-16 : Rat) [(1, 1), (12, 1), (13, 1), (14, 1)],
  term (8 : Rat) [(1, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 357 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0357_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0357
        rs_R010_ueqv_R010NYN_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYN_partial_25_0357 := by
  native_decide

/-- Coefficient term 358 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0358 : Poly :=
[
  term ((32832 : Rat) / 2995) [(1, 1), (13, 1), (14, 1), (15, 2)]
]

/-- Partial product 358 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0358 : Poly :=
[
  term ((65664 : Rat) / 2995) [(1, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((-32832 : Rat) / 2995) [(1, 1), (13, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 358 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0358_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0358
        rs_R010_ueqv_R010NYN_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYN_partial_25_0358 := by
  native_decide

/-- Coefficient term 359 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0359 : Poly :=
[
  term ((4 : Rat) / 5) [(1, 1), (13, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 359 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0359 : Poly :=
[
  term ((8 : Rat) / 5) [(1, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-4 : Rat) / 5) [(1, 1), (13, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 359 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0359_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0359
        rs_R010_ueqv_R010NYN_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYN_partial_25_0359 := by
  native_decide

/-- Coefficient term 360 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0360 : Poly :=
[
  term ((318432 : Rat) / 2995) [(1, 1), (13, 1), (15, 2)]
]

/-- Partial product 360 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0360 : Poly :=
[
  term ((636864 : Rat) / 2995) [(1, 1), (12, 1), (13, 1), (15, 2)],
  term ((-318432 : Rat) / 2995) [(1, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 360 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0360_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0360
        rs_R010_ueqv_R010NYN_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYN_partial_25_0360 := by
  native_decide

/-- Coefficient term 361 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0361 : Poly :=
[
  term ((-46 : Rat) / 5) [(1, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 361 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0361 : Poly :=
[
  term ((-92 : Rat) / 5) [(1, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((46 : Rat) / 5) [(1, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 361 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0361_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0361
        rs_R010_ueqv_R010NYN_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYN_partial_25_0361 := by
  native_decide

/-- Coefficient term 362 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0362 : Poly :=
[
  term ((-2921424 : Rat) / 2995) [(1, 1), (14, 1), (15, 1)]
]

/-- Partial product 362 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0362 : Poly :=
[
  term ((-5842848 : Rat) / 2995) [(1, 1), (12, 1), (14, 1), (15, 1)],
  term ((2921424 : Rat) / 2995) [(1, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 362 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0362_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0362
        rs_R010_ueqv_R010NYN_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYN_partial_25_0362 := by
  native_decide

/-- Coefficient term 363 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0363 : Poly :=
[
  term ((722 : Rat) / 5) [(1, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 363 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0363 : Poly :=
[
  term ((1444 : Rat) / 5) [(1, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-722 : Rat) / 5) [(1, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 363 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0363_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0363
        rs_R010_ueqv_R010NYN_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYN_partial_25_0363 := by
  native_decide

/-- Coefficient term 364 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0364 : Poly :=
[
  term ((-32832 : Rat) / 2995) [(1, 1), (14, 1), (15, 3)]
]

/-- Partial product 364 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0364 : Poly :=
[
  term ((-65664 : Rat) / 2995) [(1, 1), (12, 1), (14, 1), (15, 3)],
  term ((32832 : Rat) / 2995) [(1, 1), (14, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 364 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0364_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0364
        rs_R010_ueqv_R010NYN_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYN_partial_25_0364 := by
  native_decide

/-- Coefficient term 365 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0365 : Poly :=
[
  term ((-4 : Rat) / 5) [(1, 1), (14, 1), (15, 3), (16, 1)]
]

/-- Partial product 365 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0365 : Poly :=
[
  term ((-8 : Rat) / 5) [(1, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((4 : Rat) / 5) [(1, 1), (14, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 365 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0365_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0365
        rs_R010_ueqv_R010NYN_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYN_partial_25_0365 := by
  native_decide

/-- Coefficient term 366 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0366 : Poly :=
[
  term ((170688 : Rat) / 2995) [(1, 1), (14, 2), (15, 1)]
]

/-- Partial product 366 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0366 : Poly :=
[
  term ((341376 : Rat) / 2995) [(1, 1), (12, 1), (14, 2), (15, 1)],
  term ((-170688 : Rat) / 2995) [(1, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 366 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0366_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0366
        rs_R010_ueqv_R010NYN_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYN_partial_25_0366 := by
  native_decide

/-- Coefficient term 367 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0367 : Poly :=
[
  term ((-64 : Rat) / 5) [(1, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 367 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0367 : Poly :=
[
  term ((-128 : Rat) / 5) [(1, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((64 : Rat) / 5) [(1, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 367 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0367_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0367
        rs_R010_ueqv_R010NYN_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYN_partial_25_0367 := by
  native_decide

/-- Coefficient term 368 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0368 : Poly :=
[
  term ((1154292 : Rat) / 2995) [(1, 1), (15, 1)]
]

/-- Partial product 368 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0368 : Poly :=
[
  term ((2308584 : Rat) / 2995) [(1, 1), (12, 1), (15, 1)],
  term ((-1154292 : Rat) / 2995) [(1, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 368 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0368_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0368
        rs_R010_ueqv_R010NYN_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYN_partial_25_0368 := by
  native_decide

/-- Coefficient term 369 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0369 : Poly :=
[
  term ((-276 : Rat) / 5) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 369 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0369 : Poly :=
[
  term ((-552 : Rat) / 5) [(1, 1), (12, 1), (15, 1), (16, 1)],
  term ((276 : Rat) / 5) [(1, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 369 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0369_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0369
        rs_R010_ueqv_R010NYN_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYN_partial_25_0369 := by
  native_decide

/-- Coefficient term 370 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0370 : Poly :=
[
  term ((-180576 : Rat) / 2995) [(1, 1), (15, 3)]
]

/-- Partial product 370 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0370 : Poly :=
[
  term ((-361152 : Rat) / 2995) [(1, 1), (12, 1), (15, 3)],
  term ((180576 : Rat) / 2995) [(1, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 370 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0370_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0370
        rs_R010_ueqv_R010NYN_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYN_partial_25_0370 := by
  native_decide

/-- Coefficient term 371 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0371 : Poly :=
[
  term ((-22 : Rat) / 5) [(1, 1), (15, 3), (16, 1)]
]

/-- Partial product 371 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0371 : Poly :=
[
  term ((-44 : Rat) / 5) [(1, 1), (12, 1), (15, 3), (16, 1)],
  term ((22 : Rat) / 5) [(1, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 371 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0371_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0371
        rs_R010_ueqv_R010NYN_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYN_partial_25_0371 := by
  native_decide

/-- Coefficient term 372 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0372 : Poly :=
[
  term (6 : Rat) [(1, 2)]
]

/-- Partial product 372 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0372 : Poly :=
[
  term (-6 : Rat) [(1, 2)],
  term (12 : Rat) [(1, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 372 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0372_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0372
        rs_R010_ueqv_R010NYN_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYN_partial_25_0372 := by
  native_decide

/-- Coefficient term 373 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0373 : Poly :=
[
  term ((-214272 : Rat) / 2995) [(1, 2), (7, 1), (8, 1), (11, 1)]
]

/-- Partial product 373 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0373 : Poly :=
[
  term ((214272 : Rat) / 2995) [(1, 2), (7, 1), (8, 1), (11, 1)],
  term ((-428544 : Rat) / 2995) [(1, 2), (7, 1), (8, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 373 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0373_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0373
        rs_R010_ueqv_R010NYN_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYN_partial_25_0373 := by
  native_decide

/-- Coefficient term 374 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0374 : Poly :=
[
  term ((341376 : Rat) / 2995) [(1, 2), (7, 1), (8, 1), (15, 1)]
]

/-- Partial product 374 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0374 : Poly :=
[
  term ((682752 : Rat) / 2995) [(1, 2), (7, 1), (8, 1), (12, 1), (15, 1)],
  term ((-341376 : Rat) / 2995) [(1, 2), (7, 1), (8, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 374 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0374_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0374
        rs_R010_ueqv_R010NYN_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYN_partial_25_0374 := by
  native_decide

/-- Coefficient term 375 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0375 : Poly :=
[
  term ((-128 : Rat) / 5) [(1, 2), (7, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 375 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0375 : Poly :=
[
  term ((-256 : Rat) / 5) [(1, 2), (7, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((128 : Rat) / 5) [(1, 2), (7, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 375 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0375_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0375
        rs_R010_ueqv_R010NYN_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYN_partial_25_0375 := by
  native_decide

/-- Coefficient term 376 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0376 : Poly :=
[
  term ((-107136 : Rat) / 2995) [(1, 2), (7, 1), (11, 1)]
]

/-- Partial product 376 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0376 : Poly :=
[
  term ((107136 : Rat) / 2995) [(1, 2), (7, 1), (11, 1)],
  term ((-214272 : Rat) / 2995) [(1, 2), (7, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 376 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0376_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0376
        rs_R010_ueqv_R010NYN_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYN_partial_25_0376 := by
  native_decide

/-- Coefficient term 377 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0377 : Poly :=
[
  term ((214272 : Rat) / 2995) [(1, 2), (7, 1), (11, 1), (14, 1)]
]

/-- Partial product 377 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0377 : Poly :=
[
  term ((428544 : Rat) / 2995) [(1, 2), (7, 1), (11, 1), (12, 1), (14, 1)],
  term ((-214272 : Rat) / 2995) [(1, 2), (7, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 377 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0377_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0377
        rs_R010_ueqv_R010NYN_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYN_partial_25_0377 := by
  native_decide

/-- Coefficient term 378 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0378 : Poly :=
[
  term ((-341376 : Rat) / 2995) [(1, 2), (7, 1), (14, 1), (15, 1)]
]

/-- Partial product 378 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0378 : Poly :=
[
  term ((-682752 : Rat) / 2995) [(1, 2), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((341376 : Rat) / 2995) [(1, 2), (7, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 378 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0378_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0378
        rs_R010_ueqv_R010NYN_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYN_partial_25_0378 := by
  native_decide

/-- Coefficient term 379 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0379 : Poly :=
[
  term ((128 : Rat) / 5) [(1, 2), (7, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 379 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0379 : Poly :=
[
  term ((256 : Rat) / 5) [(1, 2), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-128 : Rat) / 5) [(1, 2), (7, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 379 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0379_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0379
        rs_R010_ueqv_R010NYN_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYN_partial_25_0379 := by
  native_decide

/-- Coefficient term 380 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0380 : Poly :=
[
  term ((170688 : Rat) / 2995) [(1, 2), (7, 1), (15, 1)]
]

/-- Partial product 380 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0380 : Poly :=
[
  term ((341376 : Rat) / 2995) [(1, 2), (7, 1), (12, 1), (15, 1)],
  term ((-170688 : Rat) / 2995) [(1, 2), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 380 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0380_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0380
        rs_R010_ueqv_R010NYN_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYN_partial_25_0380 := by
  native_decide

/-- Coefficient term 381 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0381 : Poly :=
[
  term ((-64 : Rat) / 5) [(1, 2), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 381 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0381 : Poly :=
[
  term ((-128 : Rat) / 5) [(1, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((64 : Rat) / 5) [(1, 2), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 381 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0381_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0381
        rs_R010_ueqv_R010NYN_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYN_partial_25_0381 := by
  native_decide

/-- Coefficient term 382 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0382 : Poly :=
[
  term ((-341376 : Rat) / 2995) [(1, 2), (8, 1), (11, 1), (15, 1)]
]

/-- Partial product 382 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0382 : Poly :=
[
  term ((-682752 : Rat) / 2995) [(1, 2), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((341376 : Rat) / 2995) [(1, 2), (8, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 382 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0382_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0382
        rs_R010_ueqv_R010NYN_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYN_partial_25_0382 := by
  native_decide

/-- Coefficient term 383 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0383 : Poly :=
[
  term ((128 : Rat) / 5) [(1, 2), (8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 383 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0383 : Poly :=
[
  term ((256 : Rat) / 5) [(1, 2), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-128 : Rat) / 5) [(1, 2), (8, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 383 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0383_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0383
        rs_R010_ueqv_R010NYN_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYN_partial_25_0383 := by
  native_decide

/-- Coefficient term 384 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0384 : Poly :=
[
  term ((214272 : Rat) / 2995) [(1, 2), (8, 1), (11, 2)]
]

/-- Partial product 384 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0384 : Poly :=
[
  term ((-214272 : Rat) / 2995) [(1, 2), (8, 1), (11, 2)],
  term ((428544 : Rat) / 2995) [(1, 2), (8, 1), (11, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 384 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0384_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0384
        rs_R010_ueqv_R010NYN_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYN_partial_25_0384 := by
  native_decide

/-- Coefficient term 385 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0385 : Poly :=
[
  term ((-1131264 : Rat) / 2995) [(1, 2), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 385 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0385 : Poly :=
[
  term ((1131264 : Rat) / 2995) [(1, 2), (11, 1), (12, 1), (15, 1)],
  term ((-2262528 : Rat) / 2995) [(1, 2), (11, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 385 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0385_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0385
        rs_R010_ueqv_R010NYN_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYN_partial_25_0385 := by
  native_decide

/-- Coefficient term 386 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0386 : Poly :=
[
  term ((264 : Rat) / 5) [(1, 2), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 386 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0386 : Poly :=
[
  term ((-264 : Rat) / 5) [(1, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((528 : Rat) / 5) [(1, 2), (11, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 386 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0386_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0386
        rs_R010_ueqv_R010NYN_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYN_partial_25_0386 := by
  native_decide

/-- Coefficient term 387 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0387 : Poly :=
[
  term ((2603904 : Rat) / 2995) [(1, 2), (11, 1), (14, 1), (15, 1)]
]

/-- Partial product 387 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0387 : Poly :=
[
  term ((5207808 : Rat) / 2995) [(1, 2), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-2603904 : Rat) / 2995) [(1, 2), (11, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 387 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0387_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0387
        rs_R010_ueqv_R010NYN_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYN_partial_25_0387 := by
  native_decide

/-- Coefficient term 388 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0388 : Poly :=
[
  term ((-656 : Rat) / 5) [(1, 2), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 388 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0388 : Poly :=
[
  term ((-1312 : Rat) / 5) [(1, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((656 : Rat) / 5) [(1, 2), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 388 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0388_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0388
        rs_R010_ueqv_R010NYN_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYN_partial_25_0388 := by
  native_decide

/-- Coefficient term 389 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0389 : Poly :=
[
  term ((565632 : Rat) / 2995) [(1, 2), (11, 1), (15, 1)]
]

/-- Partial product 389 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0389 : Poly :=
[
  term ((1131264 : Rat) / 2995) [(1, 2), (11, 1), (12, 1), (15, 1)],
  term ((-565632 : Rat) / 2995) [(1, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 389 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0389_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0389
        rs_R010_ueqv_R010NYN_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYN_partial_25_0389 := by
  native_decide

/-- Coefficient term 390 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0390 : Poly :=
[
  term ((-132 : Rat) / 5) [(1, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 390 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0390 : Poly :=
[
  term ((-264 : Rat) / 5) [(1, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((132 : Rat) / 5) [(1, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 390 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0390_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0390
        rs_R010_ueqv_R010NYN_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYN_partial_25_0390 := by
  native_decide

/-- Coefficient term 391 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0391 : Poly :=
[
  term ((-321408 : Rat) / 2995) [(1, 2), (11, 2)]
]

/-- Partial product 391 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0391 : Poly :=
[
  term ((321408 : Rat) / 2995) [(1, 2), (11, 2)],
  term ((-642816 : Rat) / 2995) [(1, 2), (11, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 391 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0391_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0391
        rs_R010_ueqv_R010NYN_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYN_partial_25_0391 := by
  native_decide

/-- Coefficient term 392 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0392 : Poly :=
[
  term ((642816 : Rat) / 2995) [(1, 2), (11, 2), (12, 1)]
]

/-- Partial product 392 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0392 : Poly :=
[
  term ((-642816 : Rat) / 2995) [(1, 2), (11, 2), (12, 1)],
  term ((1285632 : Rat) / 2995) [(1, 2), (11, 2), (12, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 392 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0392_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0392
        rs_R010_ueqv_R010NYN_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYN_partial_25_0392 := by
  native_decide

/-- Coefficient term 393 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0393 : Poly :=
[
  term ((-1499904 : Rat) / 2995) [(1, 2), (11, 2), (14, 1)]
]

/-- Partial product 393 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0393 : Poly :=
[
  term ((-2999808 : Rat) / 2995) [(1, 2), (11, 2), (12, 1), (14, 1)],
  term ((1499904 : Rat) / 2995) [(1, 2), (11, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 393 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0393_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0393
        rs_R010_ueqv_R010NYN_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYN_partial_25_0393 := by
  native_decide

/-- Coefficient term 394 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0394 : Poly :=
[
  term (-12 : Rat) [(1, 2), (12, 1)]
]

/-- Partial product 394 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0394 : Poly :=
[
  term (12 : Rat) [(1, 2), (12, 1)],
  term (-24 : Rat) [(1, 2), (12, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 394 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0394_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0394
        rs_R010_ueqv_R010NYN_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYN_partial_25_0394 := by
  native_decide

/-- Coefficient term 395 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0395 : Poly :=
[
  term ((131328 : Rat) / 2995) [(1, 2), (12, 1), (15, 2)]
]

/-- Partial product 395 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0395 : Poly :=
[
  term ((-131328 : Rat) / 2995) [(1, 2), (12, 1), (15, 2)],
  term ((262656 : Rat) / 2995) [(1, 2), (12, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 395 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0395_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0395
        rs_R010_ueqv_R010NYN_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYN_partial_25_0395 := by
  native_decide

/-- Coefficient term 396 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0396 : Poly :=
[
  term ((16 : Rat) / 5) [(1, 2), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 396 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0396 : Poly :=
[
  term ((-16 : Rat) / 5) [(1, 2), (12, 1), (15, 2), (16, 1)],
  term ((32 : Rat) / 5) [(1, 2), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 396 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0396_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0396
        rs_R010_ueqv_R010NYN_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYN_partial_25_0396 := by
  native_decide

/-- Coefficient term 397 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0397 : Poly :=
[
  term (24 : Rat) [(1, 2), (14, 1)]
]

/-- Partial product 397 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0397 : Poly :=
[
  term (48 : Rat) [(1, 2), (12, 1), (14, 1)],
  term (-24 : Rat) [(1, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 397 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0397_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0397
        rs_R010_ueqv_R010NYN_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYN_partial_25_0397 := by
  native_decide

/-- Coefficient term 398 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0398 : Poly :=
[
  term ((-262656 : Rat) / 2995) [(1, 2), (14, 1), (15, 2)]
]

/-- Partial product 398 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0398 : Poly :=
[
  term ((-525312 : Rat) / 2995) [(1, 2), (12, 1), (14, 1), (15, 2)],
  term ((262656 : Rat) / 2995) [(1, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 398 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0398_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0398
        rs_R010_ueqv_R010NYN_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYN_partial_25_0398 := by
  native_decide

/-- Coefficient term 399 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010NYN_coefficient_25_0399 : Poly :=
[
  term ((-32 : Rat) / 5) [(1, 2), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 399 for generator 25. -/
def rs_R010_ueqv_R010NYN_partial_25_0399 : Poly :=
[
  term ((-64 : Rat) / 5) [(1, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((32 : Rat) / 5) [(1, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 399 for generator 25. -/
theorem rs_R010_ueqv_R010NYN_partial_25_0399_valid :
    mulPoly rs_R010_ueqv_R010NYN_coefficient_25_0399
        rs_R010_ueqv_R010NYN_generator_25_0300_0399 =
      rs_R010_ueqv_R010NYN_partial_25_0399 := by
  native_decide

/-- Partial products in this block. -/
def rs_R010_ueqv_R010NYN_partials_25_0300_0399 : List Poly :=
[
  rs_R010_ueqv_R010NYN_partial_25_0300,
  rs_R010_ueqv_R010NYN_partial_25_0301,
  rs_R010_ueqv_R010NYN_partial_25_0302,
  rs_R010_ueqv_R010NYN_partial_25_0303,
  rs_R010_ueqv_R010NYN_partial_25_0304,
  rs_R010_ueqv_R010NYN_partial_25_0305,
  rs_R010_ueqv_R010NYN_partial_25_0306,
  rs_R010_ueqv_R010NYN_partial_25_0307,
  rs_R010_ueqv_R010NYN_partial_25_0308,
  rs_R010_ueqv_R010NYN_partial_25_0309,
  rs_R010_ueqv_R010NYN_partial_25_0310,
  rs_R010_ueqv_R010NYN_partial_25_0311,
  rs_R010_ueqv_R010NYN_partial_25_0312,
  rs_R010_ueqv_R010NYN_partial_25_0313,
  rs_R010_ueqv_R010NYN_partial_25_0314,
  rs_R010_ueqv_R010NYN_partial_25_0315,
  rs_R010_ueqv_R010NYN_partial_25_0316,
  rs_R010_ueqv_R010NYN_partial_25_0317,
  rs_R010_ueqv_R010NYN_partial_25_0318,
  rs_R010_ueqv_R010NYN_partial_25_0319,
  rs_R010_ueqv_R010NYN_partial_25_0320,
  rs_R010_ueqv_R010NYN_partial_25_0321,
  rs_R010_ueqv_R010NYN_partial_25_0322,
  rs_R010_ueqv_R010NYN_partial_25_0323,
  rs_R010_ueqv_R010NYN_partial_25_0324,
  rs_R010_ueqv_R010NYN_partial_25_0325,
  rs_R010_ueqv_R010NYN_partial_25_0326,
  rs_R010_ueqv_R010NYN_partial_25_0327,
  rs_R010_ueqv_R010NYN_partial_25_0328,
  rs_R010_ueqv_R010NYN_partial_25_0329,
  rs_R010_ueqv_R010NYN_partial_25_0330,
  rs_R010_ueqv_R010NYN_partial_25_0331,
  rs_R010_ueqv_R010NYN_partial_25_0332,
  rs_R010_ueqv_R010NYN_partial_25_0333,
  rs_R010_ueqv_R010NYN_partial_25_0334,
  rs_R010_ueqv_R010NYN_partial_25_0335,
  rs_R010_ueqv_R010NYN_partial_25_0336,
  rs_R010_ueqv_R010NYN_partial_25_0337,
  rs_R010_ueqv_R010NYN_partial_25_0338,
  rs_R010_ueqv_R010NYN_partial_25_0339,
  rs_R010_ueqv_R010NYN_partial_25_0340,
  rs_R010_ueqv_R010NYN_partial_25_0341,
  rs_R010_ueqv_R010NYN_partial_25_0342,
  rs_R010_ueqv_R010NYN_partial_25_0343,
  rs_R010_ueqv_R010NYN_partial_25_0344,
  rs_R010_ueqv_R010NYN_partial_25_0345,
  rs_R010_ueqv_R010NYN_partial_25_0346,
  rs_R010_ueqv_R010NYN_partial_25_0347,
  rs_R010_ueqv_R010NYN_partial_25_0348,
  rs_R010_ueqv_R010NYN_partial_25_0349,
  rs_R010_ueqv_R010NYN_partial_25_0350,
  rs_R010_ueqv_R010NYN_partial_25_0351,
  rs_R010_ueqv_R010NYN_partial_25_0352,
  rs_R010_ueqv_R010NYN_partial_25_0353,
  rs_R010_ueqv_R010NYN_partial_25_0354,
  rs_R010_ueqv_R010NYN_partial_25_0355,
  rs_R010_ueqv_R010NYN_partial_25_0356,
  rs_R010_ueqv_R010NYN_partial_25_0357,
  rs_R010_ueqv_R010NYN_partial_25_0358,
  rs_R010_ueqv_R010NYN_partial_25_0359,
  rs_R010_ueqv_R010NYN_partial_25_0360,
  rs_R010_ueqv_R010NYN_partial_25_0361,
  rs_R010_ueqv_R010NYN_partial_25_0362,
  rs_R010_ueqv_R010NYN_partial_25_0363,
  rs_R010_ueqv_R010NYN_partial_25_0364,
  rs_R010_ueqv_R010NYN_partial_25_0365,
  rs_R010_ueqv_R010NYN_partial_25_0366,
  rs_R010_ueqv_R010NYN_partial_25_0367,
  rs_R010_ueqv_R010NYN_partial_25_0368,
  rs_R010_ueqv_R010NYN_partial_25_0369,
  rs_R010_ueqv_R010NYN_partial_25_0370,
  rs_R010_ueqv_R010NYN_partial_25_0371,
  rs_R010_ueqv_R010NYN_partial_25_0372,
  rs_R010_ueqv_R010NYN_partial_25_0373,
  rs_R010_ueqv_R010NYN_partial_25_0374,
  rs_R010_ueqv_R010NYN_partial_25_0375,
  rs_R010_ueqv_R010NYN_partial_25_0376,
  rs_R010_ueqv_R010NYN_partial_25_0377,
  rs_R010_ueqv_R010NYN_partial_25_0378,
  rs_R010_ueqv_R010NYN_partial_25_0379,
  rs_R010_ueqv_R010NYN_partial_25_0380,
  rs_R010_ueqv_R010NYN_partial_25_0381,
  rs_R010_ueqv_R010NYN_partial_25_0382,
  rs_R010_ueqv_R010NYN_partial_25_0383,
  rs_R010_ueqv_R010NYN_partial_25_0384,
  rs_R010_ueqv_R010NYN_partial_25_0385,
  rs_R010_ueqv_R010NYN_partial_25_0386,
  rs_R010_ueqv_R010NYN_partial_25_0387,
  rs_R010_ueqv_R010NYN_partial_25_0388,
  rs_R010_ueqv_R010NYN_partial_25_0389,
  rs_R010_ueqv_R010NYN_partial_25_0390,
  rs_R010_ueqv_R010NYN_partial_25_0391,
  rs_R010_ueqv_R010NYN_partial_25_0392,
  rs_R010_ueqv_R010NYN_partial_25_0393,
  rs_R010_ueqv_R010NYN_partial_25_0394,
  rs_R010_ueqv_R010NYN_partial_25_0395,
  rs_R010_ueqv_R010NYN_partial_25_0396,
  rs_R010_ueqv_R010NYN_partial_25_0397,
  rs_R010_ueqv_R010NYN_partial_25_0398,
  rs_R010_ueqv_R010NYN_partial_25_0399
]

/-- Sum of partial products in this block. -/
def rs_R010_ueqv_R010NYN_block_25_0300_0399 : Poly :=
[
  term ((-1714176 : Rat) / 2995) [(1, 1), (8, 1), (11, 1), (12, 1)],
  term ((-1285632 : Rat) / 2995) [(1, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-7606656 : Rat) / 2995) [(1, 1), (8, 1), (11, 1), (12, 1), (14, 1)],
  term ((2980608 : Rat) / 599) [(1, 1), (8, 1), (11, 1), (12, 1), (15, 2)],
  term ((-3448 : Rat) / 5) [(1, 1), (8, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((3428352 : Rat) / 2995) [(1, 1), (8, 1), (11, 1), (12, 2)],
  term ((642816 : Rat) / 2995) [(1, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((3803328 : Rat) / 2995) [(1, 1), (8, 1), (11, 1), (14, 1)],
  term ((-1490304 : Rat) / 599) [(1, 1), (8, 1), (11, 1), (15, 2)],
  term ((1724 : Rat) / 5) [(1, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((-22934016 : Rat) / 2995) [(1, 1), (8, 1), (11, 2), (12, 1), (15, 1)],
  term ((3792 : Rat) / 5) [(1, 1), (8, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((11467008 : Rat) / 2995) [(1, 1), (8, 1), (11, 2), (15, 1)],
  term ((-1896 : Rat) / 5) [(1, 1), (8, 1), (11, 2), (15, 1), (16, 1)],
  term ((-5785344 : Rat) / 2995) [(1, 1), (8, 1), (11, 3)],
  term ((11570688 : Rat) / 2995) [(1, 1), (8, 1), (11, 3), (12, 1)],
  term ((262656 : Rat) / 2995) [(1, 1), (8, 1), (12, 1), (13, 1), (15, 2)],
  term ((32 : Rat) / 5) [(1, 1), (8, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((8101248 : Rat) / 2995) [(1, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((-1944 : Rat) / 5) [(1, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((6300432 : Rat) / 2995) [(1, 1), (8, 1), (12, 1), (15, 1)],
  term ((-1516 : Rat) / 5) [(1, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-525312 : Rat) / 2995) [(1, 1), (8, 1), (12, 1), (15, 3)],
  term ((-64 : Rat) / 5) [(1, 1), (8, 1), (12, 1), (15, 3), (16, 1)],
  term ((-3676416 : Rat) / 2995) [(1, 1), (8, 1), (12, 2), (15, 1)],
  term ((848 : Rat) / 5) [(1, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((-131328 : Rat) / 2995) [(1, 1), (8, 1), (13, 1), (15, 2)],
  term ((-16 : Rat) / 5) [(1, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((-4050624 : Rat) / 2995) [(1, 1), (8, 1), (14, 1), (15, 1)],
  term ((972 : Rat) / 5) [(1, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2231112 : Rat) / 2995) [(1, 1), (8, 1), (15, 1)],
  term ((546 : Rat) / 5) [(1, 1), (8, 1), (15, 1), (16, 1)],
  term ((262656 : Rat) / 2995) [(1, 1), (8, 1), (15, 3)],
  term ((32 : Rat) / 5) [(1, 1), (8, 1), (15, 3), (16, 1)],
  term ((-214272 : Rat) / 2995) [(1, 1), (8, 2), (11, 1)],
  term ((428544 : Rat) / 2995) [(1, 1), (8, 2), (11, 1), (12, 1)],
  term ((-682752 : Rat) / 2995) [(1, 1), (8, 2), (12, 1), (15, 1)],
  term ((256 : Rat) / 5) [(1, 1), (8, 2), (12, 1), (15, 1), (16, 1)],
  term ((341376 : Rat) / 2995) [(1, 1), (8, 2), (15, 1)],
  term ((-128 : Rat) / 5) [(1, 1), (8, 2), (15, 1), (16, 1)],
  term ((-2731008 : Rat) / 2995) [(1, 1), (9, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((1024 : Rat) / 5) [(1, 1), (9, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1365504 : Rat) / 2995) [(1, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((512 : Rat) / 5) [(1, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((1024128 : Rat) / 2995) [(1, 1), (9, 1), (11, 1), (12, 2), (15, 1)],
  term ((-384 : Rat) / 5) [(1, 1), (9, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((1365504 : Rat) / 2995) [(1, 1), (9, 1), (11, 1), (14, 1), (15, 1)],
  term ((-512 : Rat) / 5) [(1, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((85344 : Rat) / 599) [(1, 1), (9, 1), (11, 1), (15, 1)],
  term (-32 : Rat) [(1, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-53568 : Rat) / 599) [(1, 1), (9, 1), (11, 2)],
  term ((857088 : Rat) / 2995) [(1, 1), (9, 1), (11, 2), (12, 1)],
  term ((1714176 : Rat) / 2995) [(1, 1), (9, 1), (11, 2), (12, 1), (14, 1)],
  term ((-642816 : Rat) / 2995) [(1, 1), (9, 1), (11, 2), (12, 2)],
  term ((-857088 : Rat) / 2995) [(1, 1), (9, 1), (11, 2), (14, 1)],
  term ((53568 : Rat) / 599) [(1, 1), (10, 1), (11, 1), (12, 1)],
  term ((642816 : Rat) / 2995) [(1, 1), (10, 1), (11, 1), (12, 1), (14, 1)],
  term ((-107136 : Rat) / 599) [(1, 1), (10, 1), (11, 1), (12, 2)],
  term ((-321408 : Rat) / 2995) [(1, 1), (10, 1), (11, 1), (14, 1)],
  term ((-845568 : Rat) / 2995) [(1, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((304 : Rat) / 5) [(1, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-49632 : Rat) / 599) [(1, 1), (10, 1), (12, 1), (15, 1)],
  term (16 : Rat) [(1, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((99264 : Rat) / 599) [(1, 1), (10, 1), (12, 2), (15, 1)],
  term (-32 : Rat) [(1, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((422784 : Rat) / 2995) [(1, 1), (10, 1), (14, 1), (15, 1)],
  term ((-152 : Rat) / 5) [(1, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((986544 : Rat) / 2995) [(1, 1), (11, 1)],
  term ((-1240992 : Rat) / 2995) [(1, 1), (11, 1), (12, 1)],
  term ((-972672 : Rat) / 2995) [(1, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((352 : Rat) / 5) [(1, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-397248 : Rat) / 599) [(1, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((176 : Rat) / 5) [(1, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((5706816 : Rat) / 2995) [(1, 1), (11, 1), (12, 1), (14, 1)],
  term ((-9373824 : Rat) / 2995) [(1, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((2136 : Rat) / 5) [(1, 1), (11, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-214272 : Rat) / 2995) [(1, 1), (11, 1), (12, 1), (14, 2)],
  term ((3086016 : Rat) / 2995) [(1, 1), (11, 1), (12, 1), (15, 2)],
  term ((-656 : Rat) / 5) [(1, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-1464192 : Rat) / 2995) [(1, 1), (11, 1), (12, 2)],
  term ((486336 : Rat) / 2995) [(1, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-176 : Rat) / 5) [(1, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((198624 : Rat) / 599) [(1, 1), (11, 1), (13, 1), (15, 1)],
  term ((-88 : Rat) / 5) [(1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2853408 : Rat) / 2995) [(1, 1), (11, 1), (14, 1)],
  term ((4686912 : Rat) / 2995) [(1, 1), (11, 1), (14, 1), (15, 2)],
  term ((-1068 : Rat) / 5) [(1, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((107136 : Rat) / 2995) [(1, 1), (11, 1), (14, 2)],
  term ((-1543008 : Rat) / 2995) [(1, 1), (11, 1), (15, 2)],
  term ((328 : Rat) / 5) [(1, 1), (11, 1), (15, 2), (16, 1)],
  term ((428544 : Rat) / 2995) [(1, 1), (11, 2), (12, 1), (13, 1)],
  term ((857088 : Rat) / 2995) [(1, 1), (11, 2), (12, 1), (13, 1), (14, 1)],
  term ((19934208 : Rat) / 2995) [(1, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((-3792 : Rat) / 5) [(1, 1), (11, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1499904 : Rat) / 2995) [(1, 1), (11, 2), (12, 1), (15, 1)],
  term ((-214272 : Rat) / 2995) [(1, 1), (11, 2), (13, 1)],
  term ((-428544 : Rat) / 2995) [(1, 1), (11, 2), (13, 1), (14, 1)],
  term ((-9967104 : Rat) / 2995) [(1, 1), (11, 2), (14, 1), (15, 1)],
  term ((1896 : Rat) / 5) [(1, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((749952 : Rat) / 2995) [(1, 1), (11, 2), (15, 1)],
  term ((-11570688 : Rat) / 2995) [(1, 1), (11, 3), (12, 1), (14, 1)],
  term ((5785344 : Rat) / 2995) [(1, 1), (11, 3), (14, 1)],
  term (-8 : Rat) [(1, 1), (12, 1), (13, 1)],
  term (-16 : Rat) [(1, 1), (12, 1), (13, 1), (14, 1)],
  term ((65664 : Rat) / 2995) [(1, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((8 : Rat) / 5) [(1, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((636864 : Rat) / 2995) [(1, 1), (12, 1), (13, 1), (15, 2)],
  term ((-92 : Rat) / 5) [(1, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-5842848 : Rat) / 2995) [(1, 1), (12, 1), (14, 1), (15, 1)],
  term ((1444 : Rat) / 5) [(1, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-65664 : Rat) / 2995) [(1, 1), (12, 1), (14, 1), (15, 3)],
  term ((-8 : Rat) / 5) [(1, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((341376 : Rat) / 2995) [(1, 1), (12, 1), (14, 2), (15, 1)],
  term ((-128 : Rat) / 5) [(1, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((1529976 : Rat) / 2995) [(1, 1), (12, 1), (15, 1)],
  term ((-378 : Rat) / 5) [(1, 1), (12, 1), (15, 1), (16, 1)],
  term ((-361152 : Rat) / 2995) [(1, 1), (12, 1), (15, 3)],
  term ((-44 : Rat) / 5) [(1, 1), (12, 1), (15, 3), (16, 1)],
  term ((1557216 : Rat) / 2995) [(1, 1), (12, 2), (15, 1)],
  term ((-348 : Rat) / 5) [(1, 1), (12, 2), (15, 1), (16, 1)],
  term (4 : Rat) [(1, 1), (13, 1)],
  term (8 : Rat) [(1, 1), (13, 1), (14, 1)],
  term ((-32832 : Rat) / 2995) [(1, 1), (13, 1), (14, 1), (15, 2)],
  term ((-4 : Rat) / 5) [(1, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-318432 : Rat) / 2995) [(1, 1), (13, 1), (15, 2)],
  term ((46 : Rat) / 5) [(1, 1), (13, 1), (15, 2), (16, 1)],
  term ((2921424 : Rat) / 2995) [(1, 1), (14, 1), (15, 1)],
  term ((-722 : Rat) / 5) [(1, 1), (14, 1), (15, 1), (16, 1)],
  term ((32832 : Rat) / 2995) [(1, 1), (14, 1), (15, 3)],
  term ((4 : Rat) / 5) [(1, 1), (14, 1), (15, 3), (16, 1)],
  term ((-170688 : Rat) / 2995) [(1, 1), (14, 2), (15, 1)],
  term ((64 : Rat) / 5) [(1, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1154292 : Rat) / 2995) [(1, 1), (15, 1)],
  term ((276 : Rat) / 5) [(1, 1), (15, 1), (16, 1)],
  term ((180576 : Rat) / 2995) [(1, 1), (15, 3)],
  term ((22 : Rat) / 5) [(1, 1), (15, 3), (16, 1)],
  term (-6 : Rat) [(1, 2)],
  term ((214272 : Rat) / 2995) [(1, 2), (7, 1), (8, 1), (11, 1)],
  term ((-428544 : Rat) / 2995) [(1, 2), (7, 1), (8, 1), (11, 1), (12, 1)],
  term ((682752 : Rat) / 2995) [(1, 2), (7, 1), (8, 1), (12, 1), (15, 1)],
  term ((-256 : Rat) / 5) [(1, 2), (7, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-341376 : Rat) / 2995) [(1, 2), (7, 1), (8, 1), (15, 1)],
  term ((128 : Rat) / 5) [(1, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((107136 : Rat) / 2995) [(1, 2), (7, 1), (11, 1)],
  term ((-214272 : Rat) / 2995) [(1, 2), (7, 1), (11, 1), (12, 1)],
  term ((428544 : Rat) / 2995) [(1, 2), (7, 1), (11, 1), (12, 1), (14, 1)],
  term ((-214272 : Rat) / 2995) [(1, 2), (7, 1), (11, 1), (14, 1)],
  term ((-682752 : Rat) / 2995) [(1, 2), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((256 : Rat) / 5) [(1, 2), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((341376 : Rat) / 2995) [(1, 2), (7, 1), (12, 1), (15, 1)],
  term ((-128 : Rat) / 5) [(1, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((341376 : Rat) / 2995) [(1, 2), (7, 1), (14, 1), (15, 1)],
  term ((-128 : Rat) / 5) [(1, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-170688 : Rat) / 2995) [(1, 2), (7, 1), (15, 1)],
  term ((64 : Rat) / 5) [(1, 2), (7, 1), (15, 1), (16, 1)],
  term ((-682752 : Rat) / 2995) [(1, 2), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((256 : Rat) / 5) [(1, 2), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((341376 : Rat) / 2995) [(1, 2), (8, 1), (11, 1), (15, 1)],
  term ((-128 : Rat) / 5) [(1, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-214272 : Rat) / 2995) [(1, 2), (8, 1), (11, 2)],
  term ((428544 : Rat) / 2995) [(1, 2), (8, 1), (11, 2), (12, 1)],
  term ((5207808 : Rat) / 2995) [(1, 2), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-1312 : Rat) / 5) [(1, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((2262528 : Rat) / 2995) [(1, 2), (11, 1), (12, 1), (15, 1)],
  term ((-528 : Rat) / 5) [(1, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-2262528 : Rat) / 2995) [(1, 2), (11, 1), (12, 2), (15, 1)],
  term ((528 : Rat) / 5) [(1, 2), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-2603904 : Rat) / 2995) [(1, 2), (11, 1), (14, 1), (15, 1)],
  term ((656 : Rat) / 5) [(1, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-565632 : Rat) / 2995) [(1, 2), (11, 1), (15, 1)],
  term ((132 : Rat) / 5) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((321408 : Rat) / 2995) [(1, 2), (11, 2)],
  term ((-1285632 : Rat) / 2995) [(1, 2), (11, 2), (12, 1)],
  term ((-2999808 : Rat) / 2995) [(1, 2), (11, 2), (12, 1), (14, 1)],
  term ((1285632 : Rat) / 2995) [(1, 2), (11, 2), (12, 2)],
  term ((1499904 : Rat) / 2995) [(1, 2), (11, 2), (14, 1)],
  term (24 : Rat) [(1, 2), (12, 1)],
  term (48 : Rat) [(1, 2), (12, 1), (14, 1)],
  term ((-525312 : Rat) / 2995) [(1, 2), (12, 1), (14, 1), (15, 2)],
  term ((-64 : Rat) / 5) [(1, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-131328 : Rat) / 2995) [(1, 2), (12, 1), (15, 2)],
  term ((-16 : Rat) / 5) [(1, 2), (12, 1), (15, 2), (16, 1)],
  term (-24 : Rat) [(1, 2), (12, 2)],
  term ((262656 : Rat) / 2995) [(1, 2), (12, 2), (15, 2)],
  term ((32 : Rat) / 5) [(1, 2), (12, 2), (15, 2), (16, 1)],
  term (-24 : Rat) [(1, 2), (14, 1)],
  term ((262656 : Rat) / 2995) [(1, 2), (14, 1), (15, 2)],
  term ((32 : Rat) / 5) [(1, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 25, terms 300 through 399. -/
theorem rs_R010_ueqv_R010NYN_block_25_0300_0399_valid :
    checkProductSumEq rs_R010_ueqv_R010NYN_partials_25_0300_0399
      rs_R010_ueqv_R010NYN_block_25_0300_0399 = true := by
  native_decide

end R010UeqvR010NYNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
