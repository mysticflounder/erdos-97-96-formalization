/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R010:u=v:R010YY, term block 10:300-343

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R010UeqvR010YYTermShards

/-- Generator polynomial 10 for relaxed split surplus certificate `R010:u=v:R010YY`. -/
def rs_R010_ueqv_R010YY_generator_10_0300_0343 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(2, 1)]
]

/-- Coefficient term 300 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YY_coefficient_10_0300 : Poly :=
[
  term ((-5072 : Rat) / 25) [(8, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 300 for generator 10. -/
def rs_R010_ueqv_R010YY_partial_10_0300 : Poly :=
[
  term ((-10144 : Rat) / 25) [(2, 1), (8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((5072 : Rat) / 25) [(8, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 300 for generator 10. -/
theorem rs_R010_ueqv_R010YY_partial_10_0300_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_10_0300
        rs_R010_ueqv_R010YY_generator_10_0300_0343 =
      rs_R010_ueqv_R010YY_partial_10_0300 := by
  native_decide

/-- Coefficient term 301 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YY_coefficient_10_0301 : Poly :=
[
  term ((5444 : Rat) / 5) [(8, 1), (10, 1), (15, 2), (16, 1)]
]

/-- Partial product 301 for generator 10. -/
def rs_R010_ueqv_R010YY_partial_10_0301 : Poly :=
[
  term ((10888 : Rat) / 5) [(2, 1), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((-5444 : Rat) / 5) [(8, 1), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 301 for generator 10. -/
theorem rs_R010_ueqv_R010YY_partial_10_0301_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_10_0301
        rs_R010_ueqv_R010YY_generator_10_0300_0343 =
      rs_R010_ueqv_R010YY_partial_10_0301 := by
  native_decide

/-- Coefficient term 302 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YY_coefficient_10_0302 : Poly :=
[
  term ((-94384 : Rat) / 25) [(8, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 302 for generator 10. -/
def rs_R010_ueqv_R010YY_partial_10_0302 : Poly :=
[
  term ((-188768 : Rat) / 25) [(2, 1), (8, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((94384 : Rat) / 25) [(8, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 302 for generator 10. -/
theorem rs_R010_ueqv_R010YY_partial_10_0302_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_10_0302
        rs_R010_ueqv_R010YY_generator_10_0300_0343 =
      rs_R010_ueqv_R010YY_partial_10_0302 := by
  native_decide

/-- Coefficient term 303 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YY_coefficient_10_0303 : Poly :=
[
  term ((48644 : Rat) / 25) [(8, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 303 for generator 10. -/
def rs_R010_ueqv_R010YY_partial_10_0303 : Poly :=
[
  term ((97288 : Rat) / 25) [(2, 1), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-48644 : Rat) / 25) [(8, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 303 for generator 10. -/
theorem rs_R010_ueqv_R010YY_partial_10_0303_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_10_0303
        rs_R010_ueqv_R010YY_generator_10_0300_0343 =
      rs_R010_ueqv_R010YY_partial_10_0303 := by
  native_decide

/-- Coefficient term 304 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YY_coefficient_10_0304 : Poly :=
[
  term ((-5256 : Rat) / 25) [(8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 304 for generator 10. -/
def rs_R010_ueqv_R010YY_partial_10_0304 : Poly :=
[
  term ((-10512 : Rat) / 25) [(2, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((5256 : Rat) / 25) [(8, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 304 for generator 10. -/
theorem rs_R010_ueqv_R010YY_partial_10_0304_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_10_0304
        rs_R010_ueqv_R010YY_generator_10_0300_0343 =
      rs_R010_ueqv_R010YY_partial_10_0304 := by
  native_decide

/-- Coefficient term 305 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YY_coefficient_10_0305 : Poly :=
[
  term ((1792 : Rat) / 25) [(8, 1), (11, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 305 for generator 10. -/
def rs_R010_ueqv_R010YY_partial_10_0305 : Poly :=
[
  term ((3584 : Rat) / 25) [(2, 1), (8, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1792 : Rat) / 25) [(8, 1), (11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 305 for generator 10. -/
theorem rs_R010_ueqv_R010YY_partial_10_0305_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_10_0305
        rs_R010_ueqv_R010YY_generator_10_0300_0343 =
      rs_R010_ueqv_R010YY_partial_10_0305 := by
  native_decide

/-- Coefficient term 306 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YY_coefficient_10_0306 : Poly :=
[
  term ((5072 : Rat) / 25) [(8, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 306 for generator 10. -/
def rs_R010_ueqv_R010YY_partial_10_0306 : Poly :=
[
  term ((10144 : Rat) / 25) [(2, 1), (8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5072 : Rat) / 25) [(8, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 306 for generator 10. -/
theorem rs_R010_ueqv_R010YY_partial_10_0306_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_10_0306
        rs_R010_ueqv_R010YY_generator_10_0300_0343 =
      rs_R010_ueqv_R010YY_partial_10_0306 := by
  native_decide

/-- Coefficient term 307 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YY_coefficient_10_0307 : Poly :=
[
  term ((170992 : Rat) / 25) [(8, 1), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 307 for generator 10. -/
def rs_R010_ueqv_R010YY_partial_10_0307 : Poly :=
[
  term ((341984 : Rat) / 25) [(2, 1), (8, 1), (13, 1), (15, 3), (16, 1)],
  term ((-170992 : Rat) / 25) [(8, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 307 for generator 10. -/
theorem rs_R010_ueqv_R010YY_partial_10_0307_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_10_0307
        rs_R010_ueqv_R010YY_generator_10_0300_0343 =
      rs_R010_ueqv_R010YY_partial_10_0307 := by
  native_decide

/-- Coefficient term 308 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YY_coefficient_10_0308 : Poly :=
[
  term ((-85496 : Rat) / 25) [(8, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 308 for generator 10. -/
def rs_R010_ueqv_R010YY_partial_10_0308 : Poly :=
[
  term ((-170992 : Rat) / 25) [(2, 1), (8, 1), (14, 1), (15, 2), (16, 1)],
  term ((85496 : Rat) / 25) [(8, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 308 for generator 10. -/
theorem rs_R010_ueqv_R010YY_partial_10_0308_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_10_0308
        rs_R010_ueqv_R010YY_generator_10_0300_0343 =
      rs_R010_ueqv_R010YY_partial_10_0308 := by
  native_decide

/-- Coefficient term 309 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YY_coefficient_10_0309 : Poly :=
[
  term ((3552 : Rat) / 25) [(8, 1), (15, 2), (16, 1)]
]

/-- Partial product 309 for generator 10. -/
def rs_R010_ueqv_R010YY_partial_10_0309 : Poly :=
[
  term ((7104 : Rat) / 25) [(2, 1), (8, 1), (15, 2), (16, 1)],
  term ((-3552 : Rat) / 25) [(8, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 309 for generator 10. -/
theorem rs_R010_ueqv_R010YY_partial_10_0309_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_10_0309
        rs_R010_ueqv_R010YY_generator_10_0300_0343 =
      rs_R010_ueqv_R010YY_partial_10_0309 := by
  native_decide

/-- Coefficient term 310 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YY_coefficient_10_0310 : Poly :=
[
  term ((1792 : Rat) / 25) [(8, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 310 for generator 10. -/
def rs_R010_ueqv_R010YY_partial_10_0310 : Poly :=
[
  term ((3584 : Rat) / 25) [(2, 1), (8, 2), (11, 1), (15, 1), (16, 1)],
  term ((-1792 : Rat) / 25) [(8, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 310 for generator 10. -/
theorem rs_R010_ueqv_R010YY_partial_10_0310_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_10_0310
        rs_R010_ueqv_R010YY_generator_10_0300_0343 =
      rs_R010_ueqv_R010YY_partial_10_0310 := by
  native_decide

/-- Coefficient term 311 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YY_coefficient_10_0311 : Poly :=
[
  term ((22784 : Rat) / 25) [(8, 2), (15, 2), (16, 1)]
]

/-- Partial product 311 for generator 10. -/
def rs_R010_ueqv_R010YY_partial_10_0311 : Poly :=
[
  term ((45568 : Rat) / 25) [(2, 1), (8, 2), (15, 2), (16, 1)],
  term ((-22784 : Rat) / 25) [(8, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 311 for generator 10. -/
theorem rs_R010_ueqv_R010YY_partial_10_0311_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_10_0311
        rs_R010_ueqv_R010YY_generator_10_0300_0343 =
      rs_R010_ueqv_R010YY_partial_10_0311 := by
  native_decide

/-- Coefficient term 312 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YY_coefficient_10_0312 : Poly :=
[
  term ((-54336 : Rat) / 25) [(9, 1), (10, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 312 for generator 10. -/
def rs_R010_ueqv_R010YY_partial_10_0312 : Poly :=
[
  term ((-108672 : Rat) / 25) [(2, 1), (9, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((54336 : Rat) / 25) [(9, 1), (10, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 312 for generator 10. -/
theorem rs_R010_ueqv_R010YY_partial_10_0312_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_10_0312
        rs_R010_ueqv_R010YY_generator_10_0300_0343 =
      rs_R010_ueqv_R010YY_partial_10_0312 := by
  native_decide

/-- Coefficient term 313 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YY_coefficient_10_0313 : Poly :=
[
  term ((-28672 : Rat) / 25) [(9, 1), (10, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 313 for generator 10. -/
def rs_R010_ueqv_R010YY_partial_10_0313 : Poly :=
[
  term ((-57344 : Rat) / 25) [(2, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((28672 : Rat) / 25) [(9, 1), (10, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 313 for generator 10. -/
theorem rs_R010_ueqv_R010YY_partial_10_0313_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_10_0313
        rs_R010_ueqv_R010YY_generator_10_0300_0343 =
      rs_R010_ueqv_R010YY_partial_10_0313 := by
  native_decide

/-- Coefficient term 314 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YY_coefficient_10_0314 : Poly :=
[
  term ((6896 : Rat) / 25) [(9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 314 for generator 10. -/
def rs_R010_ueqv_R010YY_partial_10_0314 : Poly :=
[
  term ((13792 : Rat) / 25) [(2, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-6896 : Rat) / 25) [(9, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 314 for generator 10. -/
theorem rs_R010_ueqv_R010YY_partial_10_0314_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_10_0314
        rs_R010_ueqv_R010YY_generator_10_0300_0343 =
      rs_R010_ueqv_R010YY_partial_10_0314 := by
  native_decide

/-- Coefficient term 315 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YY_coefficient_10_0315 : Poly :=
[
  term ((-896 : Rat) / 25) [(9, 1), (10, 2), (15, 1), (16, 1)]
]

/-- Partial product 315 for generator 10. -/
def rs_R010_ueqv_R010YY_partial_10_0315 : Poly :=
[
  term ((-1792 : Rat) / 25) [(2, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((896 : Rat) / 25) [(9, 1), (10, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 315 for generator 10. -/
theorem rs_R010_ueqv_R010YY_partial_10_0315_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_10_0315
        rs_R010_ueqv_R010YY_generator_10_0300_0343 =
      rs_R010_ueqv_R010YY_partial_10_0315 := by
  native_decide

/-- Coefficient term 316 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YY_coefficient_10_0316 : Poly :=
[
  term ((54336 : Rat) / 25) [(9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 316 for generator 10. -/
def rs_R010_ueqv_R010YY_partial_10_0316 : Poly :=
[
  term ((108672 : Rat) / 25) [(2, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-54336 : Rat) / 25) [(9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 316 for generator 10. -/
theorem rs_R010_ueqv_R010YY_partial_10_0316_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_10_0316
        rs_R010_ueqv_R010YY_generator_10_0300_0343 =
      rs_R010_ueqv_R010YY_partial_10_0316 := by
  native_decide

/-- Coefficient term 317 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YY_coefficient_10_0317 : Poly :=
[
  term ((896 : Rat) / 25) [(9, 1), (11, 2), (15, 1), (16, 1)]
]

/-- Partial product 317 for generator 10. -/
def rs_R010_ueqv_R010YY_partial_10_0317 : Poly :=
[
  term ((1792 : Rat) / 25) [(2, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-896 : Rat) / 25) [(9, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 317 for generator 10. -/
theorem rs_R010_ueqv_R010YY_partial_10_0317_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_10_0317
        rs_R010_ueqv_R010YY_generator_10_0300_0343 =
      rs_R010_ueqv_R010YY_partial_10_0317 := by
  native_decide

/-- Coefficient term 318 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YY_coefficient_10_0318 : Poly :=
[
  term ((56128 : Rat) / 25) [(9, 1), (13, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 318 for generator 10. -/
def rs_R010_ueqv_R010YY_partial_10_0318 : Poly :=
[
  term ((112256 : Rat) / 25) [(2, 1), (9, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-56128 : Rat) / 25) [(9, 1), (13, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 318 for generator 10. -/
theorem rs_R010_ueqv_R010YY_partial_10_0318_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_10_0318
        rs_R010_ueqv_R010YY_generator_10_0300_0343 =
      rs_R010_ueqv_R010YY_partial_10_0318 := by
  native_decide

/-- Coefficient term 319 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YY_coefficient_10_0319 : Poly :=
[
  term ((-12408 : Rat) / 25) [(9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 319 for generator 10. -/
def rs_R010_ueqv_R010YY_partial_10_0319 : Poly :=
[
  term ((-24816 : Rat) / 25) [(2, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((12408 : Rat) / 25) [(9, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 319 for generator 10. -/
theorem rs_R010_ueqv_R010YY_partial_10_0319_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_10_0319
        rs_R010_ueqv_R010YY_generator_10_0300_0343 =
      rs_R010_ueqv_R010YY_partial_10_0319 := by
  native_decide

/-- Coefficient term 320 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YY_coefficient_10_0320 : Poly :=
[
  term ((-28064 : Rat) / 25) [(9, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 320 for generator 10. -/
def rs_R010_ueqv_R010YY_partial_10_0320 : Poly :=
[
  term ((-56128 : Rat) / 25) [(2, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((28064 : Rat) / 25) [(9, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 320 for generator 10. -/
theorem rs_R010_ueqv_R010YY_partial_10_0320_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_10_0320
        rs_R010_ueqv_R010YY_generator_10_0300_0343 =
      rs_R010_ueqv_R010YY_partial_10_0320 := by
  native_decide

/-- Coefficient term 321 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YY_coefficient_10_0321 : Poly :=
[
  term ((-448 : Rat) / 5) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 321 for generator 10. -/
def rs_R010_ueqv_R010YY_partial_10_0321 : Poly :=
[
  term ((-896 : Rat) / 5) [(2, 1), (9, 1), (15, 1), (16, 1)],
  term ((448 : Rat) / 5) [(9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 321 for generator 10. -/
theorem rs_R010_ueqv_R010YY_partial_10_0321_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_10_0321
        rs_R010_ueqv_R010YY_generator_10_0300_0343 =
      rs_R010_ueqv_R010YY_partial_10_0321 := by
  native_decide

/-- Coefficient term 322 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YY_coefficient_10_0322 : Poly :=
[
  term ((896 : Rat) / 25) [(9, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 322 for generator 10. -/
def rs_R010_ueqv_R010YY_partial_10_0322 : Poly :=
[
  term ((1792 : Rat) / 25) [(2, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-896 : Rat) / 25) [(9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 322 for generator 10. -/
theorem rs_R010_ueqv_R010YY_partial_10_0322_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_10_0322
        rs_R010_ueqv_R010YY_generator_10_0300_0343 =
      rs_R010_ueqv_R010YY_partial_10_0322 := by
  native_decide

/-- Coefficient term 323 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YY_coefficient_10_0323 : Poly :=
[
  term ((-46296 : Rat) / 25) [(10, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 323 for generator 10. -/
def rs_R010_ueqv_R010YY_partial_10_0323 : Poly :=
[
  term ((-92592 : Rat) / 25) [(2, 1), (10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((46296 : Rat) / 25) [(10, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 323 for generator 10. -/
theorem rs_R010_ueqv_R010YY_partial_10_0323_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_10_0323
        rs_R010_ueqv_R010YY_generator_10_0300_0343 =
      rs_R010_ueqv_R010YY_partial_10_0323 := by
  native_decide

/-- Coefficient term 324 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YY_coefficient_10_0324 : Poly :=
[
  term ((-18128 : Rat) / 25) [(10, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 324 for generator 10. -/
def rs_R010_ueqv_R010YY_partial_10_0324 : Poly :=
[
  term ((-36256 : Rat) / 25) [(2, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((18128 : Rat) / 25) [(10, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 324 for generator 10. -/
theorem rs_R010_ueqv_R010YY_partial_10_0324_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_10_0324
        rs_R010_ueqv_R010YY_generator_10_0300_0343 =
      rs_R010_ueqv_R010YY_partial_10_0324 := by
  native_decide

/-- Coefficient term 325 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YY_coefficient_10_0325 : Poly :=
[
  term ((3518 : Rat) / 25) [(10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 325 for generator 10. -/
def rs_R010_ueqv_R010YY_partial_10_0325 : Poly :=
[
  term ((7036 : Rat) / 25) [(2, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-3518 : Rat) / 25) [(10, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 325 for generator 10. -/
theorem rs_R010_ueqv_R010YY_partial_10_0325_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_10_0325
        rs_R010_ueqv_R010YY_generator_10_0300_0343 =
      rs_R010_ueqv_R010YY_partial_10_0325 := by
  native_decide

/-- Coefficient term 326 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YY_coefficient_10_0326 : Poly :=
[
  term ((12496 : Rat) / 25) [(10, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 326 for generator 10. -/
def rs_R010_ueqv_R010YY_partial_10_0326 : Poly :=
[
  term ((24992 : Rat) / 25) [(2, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-12496 : Rat) / 25) [(10, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 326 for generator 10. -/
theorem rs_R010_ueqv_R010YY_partial_10_0326_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_10_0326
        rs_R010_ueqv_R010YY_generator_10_0300_0343 =
      rs_R010_ueqv_R010YY_partial_10_0326 := by
  native_decide

/-- Coefficient term 327 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YY_coefficient_10_0327 : Poly :=
[
  term ((936 : Rat) / 5) [(10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 327 for generator 10. -/
def rs_R010_ueqv_R010YY_partial_10_0327 : Poly :=
[
  term ((1872 : Rat) / 5) [(2, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-936 : Rat) / 5) [(10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 327 for generator 10. -/
theorem rs_R010_ueqv_R010YY_partial_10_0327_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_10_0327
        rs_R010_ueqv_R010YY_generator_10_0300_0343 =
      rs_R010_ueqv_R010YY_partial_10_0327 := by
  native_decide

/-- Coefficient term 328 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YY_coefficient_10_0328 : Poly :=
[
  term ((85496 : Rat) / 25) [(10, 1), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 328 for generator 10. -/
def rs_R010_ueqv_R010YY_partial_10_0328 : Poly :=
[
  term ((170992 : Rat) / 25) [(2, 1), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((-85496 : Rat) / 25) [(10, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 328 for generator 10. -/
theorem rs_R010_ueqv_R010YY_partial_10_0328_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_10_0328
        rs_R010_ueqv_R010YY_generator_10_0300_0343 =
      rs_R010_ueqv_R010YY_partial_10_0328 := by
  native_decide

/-- Coefficient term 329 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YY_coefficient_10_0329 : Poly :=
[
  term ((-9952 : Rat) / 25) [(10, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 329 for generator 10. -/
def rs_R010_ueqv_R010YY_partial_10_0329 : Poly :=
[
  term ((-19904 : Rat) / 25) [(2, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((9952 : Rat) / 25) [(10, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 329 for generator 10. -/
theorem rs_R010_ueqv_R010YY_partial_10_0329_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_10_0329
        rs_R010_ueqv_R010YY_generator_10_0300_0343 =
      rs_R010_ueqv_R010YY_partial_10_0329 := by
  native_decide

/-- Coefficient term 330 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YY_coefficient_10_0330 : Poly :=
[
  term ((1034 : Rat) / 25) [(10, 1), (15, 2), (16, 1)]
]

/-- Partial product 330 for generator 10. -/
def rs_R010_ueqv_R010YY_partial_10_0330 : Poly :=
[
  term ((2068 : Rat) / 25) [(2, 1), (10, 1), (15, 2), (16, 1)],
  term ((-1034 : Rat) / 25) [(10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 330 for generator 10. -/
theorem rs_R010_ueqv_R010YY_partial_10_0330_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_10_0330
        rs_R010_ueqv_R010YY_generator_10_0300_0343 =
      rs_R010_ueqv_R010YY_partial_10_0330 := by
  native_decide

/-- Coefficient term 331 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YY_coefficient_10_0331 : Poly :=
[
  term ((-7036 : Rat) / 25) [(10, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 331 for generator 10. -/
def rs_R010_ueqv_R010YY_partial_10_0331 : Poly :=
[
  term ((-14072 : Rat) / 25) [(2, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((7036 : Rat) / 25) [(10, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 331 for generator 10. -/
theorem rs_R010_ueqv_R010YY_partial_10_0331_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_10_0331
        rs_R010_ueqv_R010YY_generator_10_0300_0343 =
      rs_R010_ueqv_R010YY_partial_10_0331 := by
  native_decide

/-- Coefficient term 332 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YY_coefficient_10_0332 : Poly :=
[
  term ((18128 : Rat) / 25) [(10, 2), (15, 2), (16, 1)]
]

/-- Partial product 332 for generator 10. -/
def rs_R010_ueqv_R010YY_partial_10_0332 : Poly :=
[
  term ((36256 : Rat) / 25) [(2, 1), (10, 2), (15, 2), (16, 1)],
  term ((-18128 : Rat) / 25) [(10, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 332 for generator 10. -/
theorem rs_R010_ueqv_R010YY_partial_10_0332_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_10_0332
        rs_R010_ueqv_R010YY_generator_10_0300_0343 =
      rs_R010_ueqv_R010YY_partial_10_0332 := by
  native_decide

/-- Coefficient term 333 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YY_coefficient_10_0333 : Poly :=
[
  term ((-62624 : Rat) / 25) [(11, 1), (13, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 333 for generator 10. -/
def rs_R010_ueqv_R010YY_partial_10_0333 : Poly :=
[
  term ((-125248 : Rat) / 25) [(2, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((62624 : Rat) / 25) [(11, 1), (13, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 333 for generator 10. -/
theorem rs_R010_ueqv_R010YY_partial_10_0333_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_10_0333
        rs_R010_ueqv_R010YY_generator_10_0300_0343 =
      rs_R010_ueqv_R010YY_partial_10_0333 := by
  native_decide

/-- Coefficient term 334 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YY_coefficient_10_0334 : Poly :=
[
  term (-378 : Rat) [(11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 334 for generator 10. -/
def rs_R010_ueqv_R010YY_partial_10_0334 : Poly :=
[
  term (-756 : Rat) [(2, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term (378 : Rat) [(11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 334 for generator 10. -/
theorem rs_R010_ueqv_R010YY_partial_10_0334_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_10_0334
        rs_R010_ueqv_R010YY_generator_10_0300_0343 =
      rs_R010_ueqv_R010YY_partial_10_0334 := by
  native_decide

/-- Coefficient term 335 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YY_coefficient_10_0335 : Poly :=
[
  term ((-1484 : Rat) / 25) [(11, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 335 for generator 10. -/
def rs_R010_ueqv_R010YY_partial_10_0335 : Poly :=
[
  term ((-2968 : Rat) / 25) [(2, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((1484 : Rat) / 25) [(11, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 335 for generator 10. -/
theorem rs_R010_ueqv_R010YY_partial_10_0335_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_10_0335
        rs_R010_ueqv_R010YY_generator_10_0300_0343 =
      rs_R010_ueqv_R010YY_partial_10_0335 := by
  native_decide

/-- Coefficient term 336 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YY_coefficient_10_0336 : Poly :=
[
  term ((288 : Rat) / 25) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 336 for generator 10. -/
def rs_R010_ueqv_R010YY_partial_10_0336 : Poly :=
[
  term ((576 : Rat) / 25) [(2, 1), (11, 1), (15, 1), (16, 1)],
  term ((-288 : Rat) / 25) [(11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 336 for generator 10. -/
theorem rs_R010_ueqv_R010YY_partial_10_0336_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_10_0336
        rs_R010_ueqv_R010YY_generator_10_0300_0343 =
      rs_R010_ueqv_R010YY_partial_10_0336 := by
  native_decide

/-- Coefficient term 337 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YY_coefficient_10_0337 : Poly :=
[
  term ((46296 : Rat) / 25) [(11, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 337 for generator 10. -/
def rs_R010_ueqv_R010YY_partial_10_0337 : Poly :=
[
  term ((92592 : Rat) / 25) [(2, 1), (11, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-46296 : Rat) / 25) [(11, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 337 for generator 10. -/
theorem rs_R010_ueqv_R010YY_partial_10_0337_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_10_0337
        rs_R010_ueqv_R010YY_generator_10_0300_0343 =
      rs_R010_ueqv_R010YY_partial_10_0337 := by
  native_decide

/-- Coefficient term 338 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YY_coefficient_10_0338 : Poly :=
[
  term ((-936 : Rat) / 5) [(13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 338 for generator 10. -/
def rs_R010_ueqv_R010YY_partial_10_0338 : Poly :=
[
  term ((-1872 : Rat) / 5) [(2, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((936 : Rat) / 5) [(13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 338 for generator 10. -/
theorem rs_R010_ueqv_R010YY_partial_10_0338_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_10_0338
        rs_R010_ueqv_R010YY_generator_10_0300_0343 =
      rs_R010_ueqv_R010YY_partial_10_0338 := by
  native_decide

/-- Coefficient term 339 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YY_coefficient_10_0339 : Poly :=
[
  term ((-3524 : Rat) / 25) [(13, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 339 for generator 10. -/
def rs_R010_ueqv_R010YY_partial_10_0339 : Poly :=
[
  term ((-7048 : Rat) / 25) [(2, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((3524 : Rat) / 25) [(13, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 339 for generator 10. -/
theorem rs_R010_ueqv_R010YY_partial_10_0339_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_10_0339
        rs_R010_ueqv_R010YY_generator_10_0300_0343 =
      rs_R010_ueqv_R010YY_partial_10_0339 := by
  native_decide

/-- Coefficient term 340 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YY_coefficient_10_0340 : Poly :=
[
  term ((6176 : Rat) / 25) [(13, 1), (14, 3), (15, 1), (16, 1)]
]

/-- Partial product 340 for generator 10. -/
def rs_R010_ueqv_R010YY_partial_10_0340 : Poly :=
[
  term ((12352 : Rat) / 25) [(2, 1), (13, 1), (14, 3), (15, 1), (16, 1)],
  term ((-6176 : Rat) / 25) [(13, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 340 for generator 10. -/
theorem rs_R010_ueqv_R010YY_partial_10_0340_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_10_0340
        rs_R010_ueqv_R010YY_generator_10_0300_0343 =
      rs_R010_ueqv_R010YY_partial_10_0340 := by
  native_decide

/-- Coefficient term 341 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YY_coefficient_10_0341 : Poly :=
[
  term ((-234 : Rat) / 5) [(14, 1), (15, 2), (16, 1)]
]

/-- Partial product 341 for generator 10. -/
def rs_R010_ueqv_R010YY_partial_10_0341 : Poly :=
[
  term ((-468 : Rat) / 5) [(2, 1), (14, 1), (15, 2), (16, 1)],
  term ((234 : Rat) / 5) [(14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 341 for generator 10. -/
theorem rs_R010_ueqv_R010YY_partial_10_0341_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_10_0341
        rs_R010_ueqv_R010YY_generator_10_0300_0343 =
      rs_R010_ueqv_R010YY_partial_10_0341 := by
  native_decide

/-- Coefficient term 342 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YY_coefficient_10_0342 : Poly :=
[
  term ((3088 : Rat) / 25) [(14, 2), (15, 2), (16, 1)]
]

/-- Partial product 342 for generator 10. -/
def rs_R010_ueqv_R010YY_partial_10_0342 : Poly :=
[
  term ((6176 : Rat) / 25) [(2, 1), (14, 2), (15, 2), (16, 1)],
  term ((-3088 : Rat) / 25) [(14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 342 for generator 10. -/
theorem rs_R010_ueqv_R010YY_partial_10_0342_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_10_0342
        rs_R010_ueqv_R010YY_generator_10_0300_0343 =
      rs_R010_ueqv_R010YY_partial_10_0342 := by
  native_decide

/-- Coefficient term 343 from coefficient polynomial 10. -/
def rs_R010_ueqv_R010YY_coefficient_10_0343 : Poly :=
[
  term ((646 : Rat) / 5) [(15, 2), (16, 1)]
]

/-- Partial product 343 for generator 10. -/
def rs_R010_ueqv_R010YY_partial_10_0343 : Poly :=
[
  term ((1292 : Rat) / 5) [(2, 1), (15, 2), (16, 1)],
  term ((-646 : Rat) / 5) [(15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 343 for generator 10. -/
theorem rs_R010_ueqv_R010YY_partial_10_0343_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_10_0343
        rs_R010_ueqv_R010YY_generator_10_0300_0343 =
      rs_R010_ueqv_R010YY_partial_10_0343 := by
  native_decide

/-- Partial products in this block. -/
def rs_R010_ueqv_R010YY_partials_10_0300_0343 : List Poly :=
[
  rs_R010_ueqv_R010YY_partial_10_0300,
  rs_R010_ueqv_R010YY_partial_10_0301,
  rs_R010_ueqv_R010YY_partial_10_0302,
  rs_R010_ueqv_R010YY_partial_10_0303,
  rs_R010_ueqv_R010YY_partial_10_0304,
  rs_R010_ueqv_R010YY_partial_10_0305,
  rs_R010_ueqv_R010YY_partial_10_0306,
  rs_R010_ueqv_R010YY_partial_10_0307,
  rs_R010_ueqv_R010YY_partial_10_0308,
  rs_R010_ueqv_R010YY_partial_10_0309,
  rs_R010_ueqv_R010YY_partial_10_0310,
  rs_R010_ueqv_R010YY_partial_10_0311,
  rs_R010_ueqv_R010YY_partial_10_0312,
  rs_R010_ueqv_R010YY_partial_10_0313,
  rs_R010_ueqv_R010YY_partial_10_0314,
  rs_R010_ueqv_R010YY_partial_10_0315,
  rs_R010_ueqv_R010YY_partial_10_0316,
  rs_R010_ueqv_R010YY_partial_10_0317,
  rs_R010_ueqv_R010YY_partial_10_0318,
  rs_R010_ueqv_R010YY_partial_10_0319,
  rs_R010_ueqv_R010YY_partial_10_0320,
  rs_R010_ueqv_R010YY_partial_10_0321,
  rs_R010_ueqv_R010YY_partial_10_0322,
  rs_R010_ueqv_R010YY_partial_10_0323,
  rs_R010_ueqv_R010YY_partial_10_0324,
  rs_R010_ueqv_R010YY_partial_10_0325,
  rs_R010_ueqv_R010YY_partial_10_0326,
  rs_R010_ueqv_R010YY_partial_10_0327,
  rs_R010_ueqv_R010YY_partial_10_0328,
  rs_R010_ueqv_R010YY_partial_10_0329,
  rs_R010_ueqv_R010YY_partial_10_0330,
  rs_R010_ueqv_R010YY_partial_10_0331,
  rs_R010_ueqv_R010YY_partial_10_0332,
  rs_R010_ueqv_R010YY_partial_10_0333,
  rs_R010_ueqv_R010YY_partial_10_0334,
  rs_R010_ueqv_R010YY_partial_10_0335,
  rs_R010_ueqv_R010YY_partial_10_0336,
  rs_R010_ueqv_R010YY_partial_10_0337,
  rs_R010_ueqv_R010YY_partial_10_0338,
  rs_R010_ueqv_R010YY_partial_10_0339,
  rs_R010_ueqv_R010YY_partial_10_0340,
  rs_R010_ueqv_R010YY_partial_10_0341,
  rs_R010_ueqv_R010YY_partial_10_0342,
  rs_R010_ueqv_R010YY_partial_10_0343
]

/-- Sum of partial products in this block. -/
def rs_R010_ueqv_R010YY_block_10_0300_0343 : Poly :=
[
  term ((-10144 : Rat) / 25) [(2, 1), (8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((10888 : Rat) / 5) [(2, 1), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((-188768 : Rat) / 25) [(2, 1), (8, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((97288 : Rat) / 25) [(2, 1), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-10512 : Rat) / 25) [(2, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((3584 : Rat) / 25) [(2, 1), (8, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((10144 : Rat) / 25) [(2, 1), (8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((341984 : Rat) / 25) [(2, 1), (8, 1), (13, 1), (15, 3), (16, 1)],
  term ((-170992 : Rat) / 25) [(2, 1), (8, 1), (14, 1), (15, 2), (16, 1)],
  term ((7104 : Rat) / 25) [(2, 1), (8, 1), (15, 2), (16, 1)],
  term ((3584 : Rat) / 25) [(2, 1), (8, 2), (11, 1), (15, 1), (16, 1)],
  term ((45568 : Rat) / 25) [(2, 1), (8, 2), (15, 2), (16, 1)],
  term ((-108672 : Rat) / 25) [(2, 1), (9, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-57344 : Rat) / 25) [(2, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((13792 : Rat) / 25) [(2, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-1792 : Rat) / 25) [(2, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((108672 : Rat) / 25) [(2, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1792 : Rat) / 25) [(2, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((112256 : Rat) / 25) [(2, 1), (9, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-24816 : Rat) / 25) [(2, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-56128 : Rat) / 25) [(2, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-896 : Rat) / 5) [(2, 1), (9, 1), (15, 1), (16, 1)],
  term ((1792 : Rat) / 25) [(2, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-92592 : Rat) / 25) [(2, 1), (10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-36256 : Rat) / 25) [(2, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((7036 : Rat) / 25) [(2, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((24992 : Rat) / 25) [(2, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1872 : Rat) / 5) [(2, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((170992 : Rat) / 25) [(2, 1), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((-19904 : Rat) / 25) [(2, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((2068 : Rat) / 25) [(2, 1), (10, 1), (15, 2), (16, 1)],
  term ((-14072 : Rat) / 25) [(2, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((36256 : Rat) / 25) [(2, 1), (10, 2), (15, 2), (16, 1)],
  term ((-125248 : Rat) / 25) [(2, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term (-756 : Rat) [(2, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2968 : Rat) / 25) [(2, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((576 : Rat) / 25) [(2, 1), (11, 1), (15, 1), (16, 1)],
  term ((92592 : Rat) / 25) [(2, 1), (11, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1872 : Rat) / 5) [(2, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-7048 : Rat) / 25) [(2, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((12352 : Rat) / 25) [(2, 1), (13, 1), (14, 3), (15, 1), (16, 1)],
  term ((-468 : Rat) / 5) [(2, 1), (14, 1), (15, 2), (16, 1)],
  term ((6176 : Rat) / 25) [(2, 1), (14, 2), (15, 2), (16, 1)],
  term ((1292 : Rat) / 5) [(2, 1), (15, 2), (16, 1)],
  term ((5072 : Rat) / 25) [(8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-5444 : Rat) / 5) [(8, 1), (10, 1), (15, 2), (16, 1)],
  term ((94384 : Rat) / 25) [(8, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-48644 : Rat) / 25) [(8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((5256 : Rat) / 25) [(8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1792 : Rat) / 25) [(8, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-5072 : Rat) / 25) [(8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-170992 : Rat) / 25) [(8, 1), (13, 1), (15, 3), (16, 1)],
  term ((85496 : Rat) / 25) [(8, 1), (14, 1), (15, 2), (16, 1)],
  term ((-3552 : Rat) / 25) [(8, 1), (15, 2), (16, 1)],
  term ((-1792 : Rat) / 25) [(8, 2), (11, 1), (15, 1), (16, 1)],
  term ((-22784 : Rat) / 25) [(8, 2), (15, 2), (16, 1)],
  term ((54336 : Rat) / 25) [(9, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((28672 : Rat) / 25) [(9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6896 : Rat) / 25) [(9, 1), (10, 1), (15, 1), (16, 1)],
  term ((896 : Rat) / 25) [(9, 1), (10, 2), (15, 1), (16, 1)],
  term ((-54336 : Rat) / 25) [(9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-896 : Rat) / 25) [(9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-56128 : Rat) / 25) [(9, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((12408 : Rat) / 25) [(9, 1), (14, 1), (15, 1), (16, 1)],
  term ((28064 : Rat) / 25) [(9, 1), (14, 2), (15, 1), (16, 1)],
  term ((448 : Rat) / 5) [(9, 1), (15, 1), (16, 1)],
  term ((-896 : Rat) / 25) [(9, 2), (11, 1), (15, 1), (16, 1)],
  term ((46296 : Rat) / 25) [(10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((18128 : Rat) / 25) [(10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3518 : Rat) / 25) [(10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-12496 : Rat) / 25) [(10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-936 : Rat) / 5) [(10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-85496 : Rat) / 25) [(10, 1), (13, 1), (15, 3), (16, 1)],
  term ((9952 : Rat) / 25) [(10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1034 : Rat) / 25) [(10, 1), (15, 2), (16, 1)],
  term ((7036 : Rat) / 25) [(10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-18128 : Rat) / 25) [(10, 2), (15, 2), (16, 1)],
  term ((62624 : Rat) / 25) [(11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term (378 : Rat) [(11, 1), (14, 1), (15, 1), (16, 1)],
  term ((1484 : Rat) / 25) [(11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-288 : Rat) / 25) [(11, 1), (15, 1), (16, 1)],
  term ((-46296 : Rat) / 25) [(11, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((936 : Rat) / 5) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term ((3524 : Rat) / 25) [(13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-6176 : Rat) / 25) [(13, 1), (14, 3), (15, 1), (16, 1)],
  term ((234 : Rat) / 5) [(14, 1), (15, 2), (16, 1)],
  term ((-3088 : Rat) / 25) [(14, 2), (15, 2), (16, 1)],
  term ((-646 : Rat) / 5) [(15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 10, terms 300 through 343. -/
theorem rs_R010_ueqv_R010YY_block_10_0300_0343_valid :
    checkProductSumEq rs_R010_ueqv_R010YY_partials_10_0300_0343
      rs_R010_ueqv_R010YY_block_10_0300_0343 = true := by
  native_decide

end R010UeqvR010YYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
