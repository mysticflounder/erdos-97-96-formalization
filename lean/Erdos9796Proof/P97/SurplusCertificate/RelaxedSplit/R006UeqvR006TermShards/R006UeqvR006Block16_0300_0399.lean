/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R006:u=v:R006, term block 16:300-399

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R006UeqvR006TermShards

/-- Generator polynomial 16 for relaxed split surplus certificate `R006:u=v:R006`. -/
def rs_R006_ueqv_R006_generator_16_0300_0399 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(6, 1)]
]

/-- Coefficient term 300 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0300 : Poly :=
[
  term ((-288 : Rat) / 5) [(0, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 300 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0300 : Poly :=
[
  term ((-576 : Rat) / 5) [(0, 1), (6, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((288 : Rat) / 5) [(0, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 300 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0300_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0300
        rs_R006_ueqv_R006_generator_16_0300_0399 =
      rs_R006_ueqv_R006_partial_16_0300 := by
  native_decide

/-- Coefficient term 301 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0301 : Poly :=
[
  term ((144 : Rat) / 5) [(0, 1), (11, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 301 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0301 : Poly :=
[
  term ((288 : Rat) / 5) [(0, 1), (6, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-144 : Rat) / 5) [(0, 1), (11, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 301 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0301_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0301
        rs_R006_ueqv_R006_generator_16_0300_0399 =
      rs_R006_ueqv_R006_partial_16_0301 := by
  native_decide

/-- Coefficient term 302 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0302 : Poly :=
[
  term ((-1446 : Rat) / 5) [(0, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 302 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0302 : Poly :=
[
  term ((-2892 : Rat) / 5) [(0, 1), (6, 1), (11, 1), (12, 1), (15, 1)],
  term ((1446 : Rat) / 5) [(0, 1), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 302 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0302_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0302
        rs_R006_ueqv_R006_generator_16_0300_0399 =
      rs_R006_ueqv_R006_partial_16_0302 := by
  native_decide

/-- Coefficient term 303 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0303 : Poly :=
[
  term ((2298 : Rat) / 25) [(0, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 303 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0303 : Poly :=
[
  term ((4596 : Rat) / 25) [(0, 1), (6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-2298 : Rat) / 25) [(0, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 303 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0303_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0303
        rs_R006_ueqv_R006_generator_16_0300_0399 =
      rs_R006_ueqv_R006_partial_16_0303 := by
  native_decide

/-- Coefficient term 304 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0304 : Poly :=
[
  term ((-576 : Rat) / 5) [(0, 1), (11, 1), (12, 2), (15, 1)]
]

/-- Partial product 304 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0304 : Poly :=
[
  term ((-1152 : Rat) / 5) [(0, 1), (6, 1), (11, 1), (12, 2), (15, 1)],
  term ((576 : Rat) / 5) [(0, 1), (11, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 304 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0304_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0304
        rs_R006_ueqv_R006_generator_16_0300_0399 =
      rs_R006_ueqv_R006_partial_16_0304 := by
  native_decide

/-- Coefficient term 305 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0305 : Poly :=
[
  term ((564 : Rat) / 25) [(0, 1), (11, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 305 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0305 : Poly :=
[
  term ((1128 : Rat) / 25) [(0, 1), (6, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-564 : Rat) / 25) [(0, 1), (11, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 305 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0305_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0305
        rs_R006_ueqv_R006_generator_16_0300_0399 =
      rs_R006_ueqv_R006_partial_16_0305 := by
  native_decide

/-- Coefficient term 306 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0306 : Poly :=
[
  term ((-7008 : Rat) / 35) [(0, 1), (11, 1), (13, 1)]
]

/-- Partial product 306 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0306 : Poly :=
[
  term ((-14016 : Rat) / 35) [(0, 1), (6, 1), (11, 1), (13, 1)],
  term ((7008 : Rat) / 35) [(0, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 306 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0306_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0306
        rs_R006_ueqv_R006_generator_16_0300_0399 =
      rs_R006_ueqv_R006_partial_16_0306 := by
  native_decide

/-- Coefficient term 307 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0307 : Poly :=
[
  term ((648 : Rat) / 5) [(0, 1), (11, 1), (13, 1), (14, 1)]
]

/-- Partial product 307 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0307 : Poly :=
[
  term ((1296 : Rat) / 5) [(0, 1), (6, 1), (11, 1), (13, 1), (14, 1)],
  term ((-648 : Rat) / 5) [(0, 1), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 307 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0307_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0307
        rs_R006_ueqv_R006_generator_16_0300_0399 =
      rs_R006_ueqv_R006_partial_16_0307 := by
  native_decide

/-- Coefficient term 308 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0308 : Poly :=
[
  term ((96 : Rat) / 5) [(0, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 308 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0308 : Poly :=
[
  term ((192 : Rat) / 5) [(0, 1), (6, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-96 : Rat) / 5) [(0, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 308 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0308_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0308
        rs_R006_ueqv_R006_generator_16_0300_0399 =
      rs_R006_ueqv_R006_partial_16_0308 := by
  native_decide

/-- Coefficient term 309 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0309 : Poly :=
[
  term ((-48 : Rat) / 5) [(0, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 309 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0309 : Poly :=
[
  term ((-96 : Rat) / 5) [(0, 1), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((48 : Rat) / 5) [(0, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 309 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0309_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0309
        rs_R006_ueqv_R006_generator_16_0300_0399 =
      rs_R006_ueqv_R006_partial_16_0309 := by
  native_decide

/-- Coefficient term 310 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0310 : Poly :=
[
  term ((564 : Rat) / 5) [(0, 1), (11, 1), (15, 1)]
]

/-- Partial product 310 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0310 : Poly :=
[
  term ((1128 : Rat) / 5) [(0, 1), (6, 1), (11, 1), (15, 1)],
  term ((-564 : Rat) / 5) [(0, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 310 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0310_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0310
        rs_R006_ueqv_R006_generator_16_0300_0399 =
      rs_R006_ueqv_R006_partial_16_0310 := by
  native_decide

/-- Coefficient term 311 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0311 : Poly :=
[
  term ((-864 : Rat) / 25) [(0, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 311 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0311 : Poly :=
[
  term ((-1728 : Rat) / 25) [(0, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((864 : Rat) / 25) [(0, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 311 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0311_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0311
        rs_R006_ueqv_R006_generator_16_0300_0399 =
      rs_R006_ueqv_R006_partial_16_0311 := by
  native_decide

/-- Coefficient term 312 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0312 : Poly :=
[
  term ((942 : Rat) / 5) [(0, 1), (11, 2)]
]

/-- Partial product 312 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0312 : Poly :=
[
  term ((1884 : Rat) / 5) [(0, 1), (6, 1), (11, 2)],
  term ((-942 : Rat) / 5) [(0, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 312 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0312_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0312
        rs_R006_ueqv_R006_generator_16_0300_0399 =
      rs_R006_ueqv_R006_partial_16_0312 := by
  native_decide

/-- Coefficient term 313 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0313 : Poly :=
[
  term ((-678 : Rat) / 5) [(0, 1), (11, 2), (14, 1)]
]

/-- Partial product 313 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0313 : Poly :=
[
  term ((-1356 : Rat) / 5) [(0, 1), (6, 1), (11, 2), (14, 1)],
  term ((678 : Rat) / 5) [(0, 1), (11, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 313 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0313_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0313
        rs_R006_ueqv_R006_generator_16_0300_0399 =
      rs_R006_ueqv_R006_partial_16_0313 := by
  native_decide

/-- Coefficient term 314 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0314 : Poly :=
[
  term ((2 : Rat) / 5) [(0, 1), (11, 2), (16, 1)]
]

/-- Partial product 314 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0314 : Poly :=
[
  term ((4 : Rat) / 5) [(0, 1), (6, 1), (11, 2), (16, 1)],
  term ((-2 : Rat) / 5) [(0, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 314 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0314_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0314
        rs_R006_ueqv_R006_generator_16_0300_0399 =
      rs_R006_ueqv_R006_partial_16_0314 := by
  native_decide

/-- Coefficient term 315 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0315 : Poly :=
[
  term ((-138 : Rat) / 5) [(0, 1), (12, 1)]
]

/-- Partial product 315 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0315 : Poly :=
[
  term ((-276 : Rat) / 5) [(0, 1), (6, 1), (12, 1)],
  term ((138 : Rat) / 5) [(0, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 315 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0315_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0315
        rs_R006_ueqv_R006_generator_16_0300_0399 =
      rs_R006_ueqv_R006_partial_16_0315 := by
  native_decide

/-- Coefficient term 316 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0316 : Poly :=
[
  term ((864 : Rat) / 5) [(0, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 316 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0316 : Poly :=
[
  term ((1728 : Rat) / 5) [(0, 1), (6, 1), (12, 1), (13, 1), (15, 1)],
  term ((-864 : Rat) / 5) [(0, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 316 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0316_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0316
        rs_R006_ueqv_R006_generator_16_0300_0399 =
      rs_R006_ueqv_R006_partial_16_0316 := by
  native_decide

/-- Coefficient term 317 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0317 : Poly :=
[
  term ((-1038 : Rat) / 25) [(0, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 317 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0317 : Poly :=
[
  term ((-2076 : Rat) / 25) [(0, 1), (6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1038 : Rat) / 25) [(0, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 317 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0317_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0317
        rs_R006_ueqv_R006_generator_16_0300_0399 =
      rs_R006_ueqv_R006_partial_16_0317 := by
  native_decide

/-- Coefficient term 318 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0318 : Poly :=
[
  term ((108 : Rat) / 5) [(0, 1), (12, 1), (14, 1)]
]

/-- Partial product 318 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0318 : Poly :=
[
  term ((216 : Rat) / 5) [(0, 1), (6, 1), (12, 1), (14, 1)],
  term ((-108 : Rat) / 5) [(0, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 318 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0318_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0318
        rs_R006_ueqv_R006_generator_16_0300_0399 =
      rs_R006_ueqv_R006_partial_16_0318 := by
  native_decide

/-- Coefficient term 319 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0319 : Poly :=
[
  term ((14319 : Rat) / 25) [(0, 1), (13, 1), (15, 1)]
]

/-- Partial product 319 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0319 : Poly :=
[
  term ((28638 : Rat) / 25) [(0, 1), (6, 1), (13, 1), (15, 1)],
  term ((-14319 : Rat) / 25) [(0, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 319 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0319_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0319
        rs_R006_ueqv_R006_generator_16_0300_0399 =
      rs_R006_ueqv_R006_partial_16_0319 := by
  native_decide

/-- Coefficient term 320 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0320 : Poly :=
[
  term ((-999 : Rat) / 5) [(0, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 320 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0320 : Poly :=
[
  term ((-1998 : Rat) / 5) [(0, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((999 : Rat) / 5) [(0, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 320 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0320_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0320
        rs_R006_ueqv_R006_generator_16_0300_0399 =
      rs_R006_ueqv_R006_partial_16_0320 := by
  native_decide

/-- Coefficient term 321 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0321 : Poly :=
[
  term ((11454 : Rat) / 35) [(0, 1), (13, 2)]
]

/-- Partial product 321 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0321 : Poly :=
[
  term ((22908 : Rat) / 35) [(0, 1), (6, 1), (13, 2)],
  term ((-11454 : Rat) / 35) [(0, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 321 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0321_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0321
        rs_R006_ueqv_R006_generator_16_0300_0399 =
      rs_R006_ueqv_R006_partial_16_0321 := by
  native_decide

/-- Coefficient term 322 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0322 : Poly :=
[
  term ((-3312 : Rat) / 5) [(0, 1), (13, 2), (14, 1)]
]

/-- Partial product 322 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0322 : Poly :=
[
  term ((-6624 : Rat) / 5) [(0, 1), (6, 1), (13, 2), (14, 1)],
  term ((3312 : Rat) / 5) [(0, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 322 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0322_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0322
        rs_R006_ueqv_R006_generator_16_0300_0399 =
      rs_R006_ueqv_R006_partial_16_0322 := by
  native_decide

/-- Coefficient term 323 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0323 : Poly :=
[
  term ((1104 : Rat) / 5) [(0, 1), (13, 2), (14, 1), (16, 1)]
]

/-- Partial product 323 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0323 : Poly :=
[
  term ((2208 : Rat) / 5) [(0, 1), (6, 1), (13, 2), (14, 1), (16, 1)],
  term ((-1104 : Rat) / 5) [(0, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 323 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0323_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0323
        rs_R006_ueqv_R006_generator_16_0300_0399 =
      rs_R006_ueqv_R006_partial_16_0323 := by
  native_decide

/-- Coefficient term 324 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0324 : Poly :=
[
  term ((-552 : Rat) / 5) [(0, 1), (13, 2), (16, 1)]
]

/-- Partial product 324 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0324 : Poly :=
[
  term ((-1104 : Rat) / 5) [(0, 1), (6, 1), (13, 2), (16, 1)],
  term ((552 : Rat) / 5) [(0, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 324 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0324_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0324
        rs_R006_ueqv_R006_generator_16_0300_0399 =
      rs_R006_ueqv_R006_partial_16_0324 := by
  native_decide

/-- Coefficient term 325 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0325 : Poly :=
[
  term ((192 : Rat) / 5) [(0, 2), (1, 1), (3, 1), (9, 1), (15, 1)]
]

/-- Partial product 325 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0325 : Poly :=
[
  term ((384 : Rat) / 5) [(0, 2), (1, 1), (3, 1), (6, 1), (9, 1), (15, 1)],
  term ((-192 : Rat) / 5) [(0, 2), (1, 1), (3, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 325 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0325_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0325
        rs_R006_ueqv_R006_generator_16_0300_0399 =
      rs_R006_ueqv_R006_partial_16_0325 := by
  native_decide

/-- Coefficient term 326 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0326 : Poly :=
[
  term ((-48 : Rat) / 5) [(0, 2), (1, 1), (3, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 326 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0326 : Poly :=
[
  term ((-96 : Rat) / 5) [(0, 2), (1, 1), (3, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((48 : Rat) / 5) [(0, 2), (1, 1), (3, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 326 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0326_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0326
        rs_R006_ueqv_R006_generator_16_0300_0399 =
      rs_R006_ueqv_R006_partial_16_0326 := by
  native_decide

/-- Coefficient term 327 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0327 : Poly :=
[
  term (-192 : Rat) [(0, 2), (1, 1), (9, 1), (11, 1), (15, 1)]
]

/-- Partial product 327 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0327 : Poly :=
[
  term (-384 : Rat) [(0, 2), (1, 1), (6, 1), (9, 1), (11, 1), (15, 1)],
  term (192 : Rat) [(0, 2), (1, 1), (9, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 327 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0327_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0327
        rs_R006_ueqv_R006_generator_16_0300_0399 =
      rs_R006_ueqv_R006_partial_16_0327 := by
  native_decide

/-- Coefficient term 328 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0328 : Poly :=
[
  term (48 : Rat) [(0, 2), (1, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 328 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0328 : Poly :=
[
  term (96 : Rat) [(0, 2), (1, 1), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term (-48 : Rat) [(0, 2), (1, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 328 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0328_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0328
        rs_R006_ueqv_R006_generator_16_0300_0399 =
      rs_R006_ueqv_R006_partial_16_0328 := by
  native_decide

/-- Coefficient term 329 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0329 : Poly :=
[
  term ((192 : Rat) / 5) [(0, 2), (2, 1), (9, 1), (15, 1)]
]

/-- Partial product 329 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0329 : Poly :=
[
  term ((384 : Rat) / 5) [(0, 2), (2, 1), (6, 1), (9, 1), (15, 1)],
  term ((-192 : Rat) / 5) [(0, 2), (2, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 329 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0329_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0329
        rs_R006_ueqv_R006_generator_16_0300_0399 =
      rs_R006_ueqv_R006_partial_16_0329 := by
  native_decide

/-- Coefficient term 330 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0330 : Poly :=
[
  term ((-48 : Rat) / 5) [(0, 2), (2, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 330 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0330 : Poly :=
[
  term ((-96 : Rat) / 5) [(0, 2), (2, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((48 : Rat) / 5) [(0, 2), (2, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 330 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0330_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0330
        rs_R006_ueqv_R006_generator_16_0300_0399 =
      rs_R006_ueqv_R006_partial_16_0330 := by
  native_decide

/-- Coefficient term 331 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0331 : Poly :=
[
  term ((-72 : Rat) / 25) [(0, 2), (2, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 331 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0331 : Poly :=
[
  term ((-144 : Rat) / 25) [(0, 2), (2, 1), (6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((72 : Rat) / 25) [(0, 2), (2, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 331 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0331_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0331
        rs_R006_ueqv_R006_generator_16_0300_0399 =
      rs_R006_ueqv_R006_partial_16_0331 := by
  native_decide

/-- Coefficient term 332 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0332 : Poly :=
[
  term (12 : Rat) [(0, 2), (2, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 332 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0332 : Poly :=
[
  term (24 : Rat) [(0, 2), (2, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(0, 2), (2, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 332 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0332_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0332
        rs_R006_ueqv_R006_generator_16_0300_0399 =
      rs_R006_ueqv_R006_partial_16_0332 := by
  native_decide

/-- Coefficient term 333 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0333 : Poly :=
[
  term ((-36 : Rat) / 25) [(0, 2), (2, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 333 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0333 : Poly :=
[
  term ((-72 : Rat) / 25) [(0, 2), (2, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((36 : Rat) / 25) [(0, 2), (2, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 333 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0333_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0333
        rs_R006_ueqv_R006_generator_16_0300_0399 =
      rs_R006_ueqv_R006_partial_16_0333 := by
  native_decide

/-- Coefficient term 334 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0334 : Poly :=
[
  term ((384 : Rat) / 5) [(0, 2), (3, 1), (9, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 334 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0334 : Poly :=
[
  term ((768 : Rat) / 5) [(0, 2), (3, 1), (6, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((-384 : Rat) / 5) [(0, 2), (3, 1), (9, 1), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 334 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0334_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0334
        rs_R006_ueqv_R006_generator_16_0300_0399 =
      rs_R006_ueqv_R006_partial_16_0334 := by
  native_decide

/-- Coefficient term 335 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0335 : Poly :=
[
  term ((-96 : Rat) / 5) [(0, 2), (3, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 335 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0335 : Poly :=
[
  term ((-192 : Rat) / 5) [(0, 2), (3, 1), (6, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((96 : Rat) / 5) [(0, 2), (3, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 335 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0335_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0335
        rs_R006_ueqv_R006_generator_16_0300_0399 =
      rs_R006_ueqv_R006_partial_16_0335 := by
  native_decide

/-- Coefficient term 336 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0336 : Poly :=
[
  term (-192 : Rat) [(0, 2), (3, 1), (9, 1), (11, 1), (15, 1)]
]

/-- Partial product 336 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0336 : Poly :=
[
  term (-384 : Rat) [(0, 2), (3, 1), (6, 1), (9, 1), (11, 1), (15, 1)],
  term (192 : Rat) [(0, 2), (3, 1), (9, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 336 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0336_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0336
        rs_R006_ueqv_R006_generator_16_0300_0399 =
      rs_R006_ueqv_R006_partial_16_0336 := by
  native_decide

/-- Coefficient term 337 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0337 : Poly :=
[
  term (48 : Rat) [(0, 2), (3, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 337 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0337 : Poly :=
[
  term (96 : Rat) [(0, 2), (3, 1), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term (-48 : Rat) [(0, 2), (3, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 337 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0337_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0337
        rs_R006_ueqv_R006_generator_16_0300_0399 =
      rs_R006_ueqv_R006_partial_16_0337 := by
  native_decide

/-- Coefficient term 338 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0338 : Poly :=
[
  term ((192 : Rat) / 5) [(0, 2), (3, 1), (9, 1), (13, 1), (15, 1)]
]

/-- Partial product 338 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0338 : Poly :=
[
  term ((384 : Rat) / 5) [(0, 2), (3, 1), (6, 1), (9, 1), (13, 1), (15, 1)],
  term ((-192 : Rat) / 5) [(0, 2), (3, 1), (9, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 338 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0338_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0338
        rs_R006_ueqv_R006_generator_16_0300_0399 =
      rs_R006_ueqv_R006_partial_16_0338 := by
  native_decide

/-- Coefficient term 339 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0339 : Poly :=
[
  term ((-48 : Rat) / 5) [(0, 2), (3, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 339 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0339 : Poly :=
[
  term ((-96 : Rat) / 5) [(0, 2), (3, 1), (6, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((48 : Rat) / 5) [(0, 2), (3, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 339 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0339_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0339
        rs_R006_ueqv_R006_generator_16_0300_0399 =
      rs_R006_ueqv_R006_partial_16_0339 := by
  native_decide

/-- Coefficient term 340 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0340 : Poly :=
[
  term ((-48 : Rat) / 5) [(0, 2), (3, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 340 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0340 : Poly :=
[
  term ((-96 : Rat) / 5) [(0, 2), (3, 1), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((48 : Rat) / 5) [(0, 2), (3, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 340 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0340_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0340
        rs_R006_ueqv_R006_generator_16_0300_0399 =
      rs_R006_ueqv_R006_partial_16_0340 := by
  native_decide

/-- Coefficient term 341 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0341 : Poly :=
[
  term ((24 : Rat) / 5) [(0, 2), (3, 1), (11, 2), (15, 1), (16, 1)]
]

/-- Partial product 341 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0341 : Poly :=
[
  term ((48 : Rat) / 5) [(0, 2), (3, 1), (6, 1), (11, 2), (15, 1), (16, 1)],
  term ((-24 : Rat) / 5) [(0, 2), (3, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 341 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0341_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0341
        rs_R006_ueqv_R006_generator_16_0300_0399 =
      rs_R006_ueqv_R006_partial_16_0341 := by
  native_decide

/-- Coefficient term 342 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0342 : Poly :=
[
  term ((96 : Rat) / 25) [(0, 2), (3, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 342 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0342 : Poly :=
[
  term ((192 : Rat) / 25) [(0, 2), (3, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-96 : Rat) / 25) [(0, 2), (3, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 342 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0342_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0342
        rs_R006_ueqv_R006_generator_16_0300_0399 =
      rs_R006_ueqv_R006_partial_16_0342 := by
  native_decide

/-- Coefficient term 343 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0343 : Poly :=
[
  term ((-24 : Rat) / 5) [(0, 2), (3, 1), (15, 1), (16, 1)]
]

/-- Partial product 343 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0343 : Poly :=
[
  term ((-48 : Rat) / 5) [(0, 2), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((24 : Rat) / 5) [(0, 2), (3, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 343 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0343_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0343
        rs_R006_ueqv_R006_generator_16_0300_0399 =
      rs_R006_ueqv_R006_partial_16_0343 := by
  native_decide

/-- Coefficient term 344 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0344 : Poly :=
[
  term ((-384 : Rat) / 5) [(0, 2), (3, 2), (9, 1), (15, 1)]
]

/-- Partial product 344 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0344 : Poly :=
[
  term ((-768 : Rat) / 5) [(0, 2), (3, 2), (6, 1), (9, 1), (15, 1)],
  term ((384 : Rat) / 5) [(0, 2), (3, 2), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 344 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0344_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0344
        rs_R006_ueqv_R006_generator_16_0300_0399 =
      rs_R006_ueqv_R006_partial_16_0344 := by
  native_decide

/-- Coefficient term 345 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0345 : Poly :=
[
  term ((96 : Rat) / 5) [(0, 2), (3, 2), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 345 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0345 : Poly :=
[
  term ((192 : Rat) / 5) [(0, 2), (3, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-96 : Rat) / 5) [(0, 2), (3, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 345 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0345_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0345
        rs_R006_ueqv_R006_generator_16_0300_0399 =
      rs_R006_ueqv_R006_partial_16_0345 := by
  native_decide

/-- Coefficient term 346 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0346 : Poly :=
[
  term ((1152 : Rat) / 5) [(0, 2), (8, 1), (9, 1), (15, 1)]
]

/-- Partial product 346 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0346 : Poly :=
[
  term ((2304 : Rat) / 5) [(0, 2), (6, 1), (8, 1), (9, 1), (15, 1)],
  term ((-1152 : Rat) / 5) [(0, 2), (8, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 346 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0346_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0346
        rs_R006_ueqv_R006_generator_16_0300_0399 =
      rs_R006_ueqv_R006_partial_16_0346 := by
  native_decide

/-- Coefficient term 347 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0347 : Poly :=
[
  term ((-288 : Rat) / 5) [(0, 2), (8, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 347 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0347 : Poly :=
[
  term ((-576 : Rat) / 5) [(0, 2), (6, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((288 : Rat) / 5) [(0, 2), (8, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 347 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0347_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0347
        rs_R006_ueqv_R006_generator_16_0300_0399 =
      rs_R006_ueqv_R006_partial_16_0347 := by
  native_decide

/-- Coefficient term 348 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0348 : Poly :=
[
  term ((576 : Rat) / 5) [(0, 2), (8, 1), (11, 1), (15, 1)]
]

/-- Partial product 348 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0348 : Poly :=
[
  term ((1152 : Rat) / 5) [(0, 2), (6, 1), (8, 1), (11, 1), (15, 1)],
  term ((-576 : Rat) / 5) [(0, 2), (8, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 348 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0348_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0348
        rs_R006_ueqv_R006_generator_16_0300_0399 =
      rs_R006_ueqv_R006_partial_16_0348 := by
  native_decide

/-- Coefficient term 349 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0349 : Poly :=
[
  term ((-144 : Rat) / 5) [(0, 2), (8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 349 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0349 : Poly :=
[
  term ((-288 : Rat) / 5) [(0, 2), (6, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((144 : Rat) / 5) [(0, 2), (8, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 349 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0349_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0349
        rs_R006_ueqv_R006_generator_16_0300_0399 =
      rs_R006_ueqv_R006_partial_16_0349 := by
  native_decide

/-- Coefficient term 350 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0350 : Poly :=
[
  term ((-6912 : Rat) / 5) [(0, 2), (9, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 350 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0350 : Poly :=
[
  term ((-13824 : Rat) / 5) [(0, 2), (6, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((6912 : Rat) / 5) [(0, 2), (9, 1), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 350 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0350_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0350
        rs_R006_ueqv_R006_generator_16_0300_0399 =
      rs_R006_ueqv_R006_partial_16_0350 := by
  native_decide

/-- Coefficient term 351 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0351 : Poly :=
[
  term ((1728 : Rat) / 5) [(0, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 351 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0351 : Poly :=
[
  term ((3456 : Rat) / 5) [(0, 2), (6, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1728 : Rat) / 5) [(0, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 351 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0351_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0351
        rs_R006_ueqv_R006_generator_16_0300_0399 =
      rs_R006_ueqv_R006_partial_16_0351 := by
  native_decide

/-- Coefficient term 352 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0352 : Poly :=
[
  term ((4416 : Rat) / 5) [(0, 2), (9, 1), (11, 2), (15, 1)]
]

/-- Partial product 352 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0352 : Poly :=
[
  term ((8832 : Rat) / 5) [(0, 2), (6, 1), (9, 1), (11, 2), (15, 1)],
  term ((-4416 : Rat) / 5) [(0, 2), (9, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 352 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0352_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0352
        rs_R006_ueqv_R006_generator_16_0300_0399 =
      rs_R006_ueqv_R006_partial_16_0352 := by
  native_decide

/-- Coefficient term 353 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0353 : Poly :=
[
  term ((-1104 : Rat) / 5) [(0, 2), (9, 1), (11, 2), (15, 1), (16, 1)]
]

/-- Partial product 353 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0353 : Poly :=
[
  term ((-2208 : Rat) / 5) [(0, 2), (6, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((1104 : Rat) / 5) [(0, 2), (9, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 353 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0353_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0353
        rs_R006_ueqv_R006_generator_16_0300_0399 =
      rs_R006_ueqv_R006_partial_16_0353 := by
  native_decide

/-- Coefficient term 354 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0354 : Poly :=
[
  term ((-1152 : Rat) / 5) [(0, 2), (9, 1), (12, 1), (15, 1)]
]

/-- Partial product 354 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0354 : Poly :=
[
  term ((-2304 : Rat) / 5) [(0, 2), (6, 1), (9, 1), (12, 1), (15, 1)],
  term ((1152 : Rat) / 5) [(0, 2), (9, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 354 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0354_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0354
        rs_R006_ueqv_R006_generator_16_0300_0399 =
      rs_R006_ueqv_R006_partial_16_0354 := by
  native_decide

/-- Coefficient term 355 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0355 : Poly :=
[
  term ((288 : Rat) / 5) [(0, 2), (9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 355 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0355 : Poly :=
[
  term ((576 : Rat) / 5) [(0, 2), (6, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-288 : Rat) / 5) [(0, 2), (9, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 355 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0355_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0355
        rs_R006_ueqv_R006_generator_16_0300_0399 =
      rs_R006_ueqv_R006_partial_16_0355 := by
  native_decide

/-- Coefficient term 356 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0356 : Poly :=
[
  term (192 : Rat) [(0, 2), (9, 1), (15, 1)]
]

/-- Partial product 356 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0356 : Poly :=
[
  term (384 : Rat) [(0, 2), (6, 1), (9, 1), (15, 1)],
  term (-192 : Rat) [(0, 2), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 356 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0356_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0356
        rs_R006_ueqv_R006_generator_16_0300_0399 =
      rs_R006_ueqv_R006_partial_16_0356 := by
  native_decide

/-- Coefficient term 357 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0357 : Poly :=
[
  term (-48 : Rat) [(0, 2), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 357 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0357 : Poly :=
[
  term (-96 : Rat) [(0, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term (48 : Rat) [(0, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 357 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0357_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0357
        rs_R006_ueqv_R006_generator_16_0300_0399 =
      rs_R006_ueqv_R006_partial_16_0357 := by
  native_decide

/-- Coefficient term 358 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0358 : Poly :=
[
  term ((-1152 : Rat) / 5) [(0, 2), (9, 2), (11, 1), (15, 1)]
]

/-- Partial product 358 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0358 : Poly :=
[
  term ((-2304 : Rat) / 5) [(0, 2), (6, 1), (9, 2), (11, 1), (15, 1)],
  term ((1152 : Rat) / 5) [(0, 2), (9, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 358 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0358_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0358
        rs_R006_ueqv_R006_generator_16_0300_0399 =
      rs_R006_ueqv_R006_partial_16_0358 := by
  native_decide

/-- Coefficient term 359 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0359 : Poly :=
[
  term ((288 : Rat) / 5) [(0, 2), (9, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 359 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0359 : Poly :=
[
  term ((576 : Rat) / 5) [(0, 2), (6, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-288 : Rat) / 5) [(0, 2), (9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 359 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0359_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0359
        rs_R006_ueqv_R006_generator_16_0300_0399 =
      rs_R006_ueqv_R006_partial_16_0359 := by
  native_decide

/-- Coefficient term 360 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0360 : Poly :=
[
  term ((576 : Rat) / 5) [(0, 2), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 360 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0360 : Poly :=
[
  term ((1152 : Rat) / 5) [(0, 2), (6, 1), (11, 1), (12, 1), (15, 1)],
  term ((-576 : Rat) / 5) [(0, 2), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 360 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0360_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0360
        rs_R006_ueqv_R006_generator_16_0300_0399 =
      rs_R006_ueqv_R006_partial_16_0360 := by
  native_decide

/-- Coefficient term 361 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0361 : Poly :=
[
  term ((-132 : Rat) / 5) [(0, 2), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 361 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0361 : Poly :=
[
  term ((-264 : Rat) / 5) [(0, 2), (6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((132 : Rat) / 5) [(0, 2), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 361 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0361_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0361
        rs_R006_ueqv_R006_generator_16_0300_0399 =
      rs_R006_ueqv_R006_partial_16_0361 := by
  native_decide

/-- Coefficient term 362 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0362 : Poly :=
[
  term ((-144 : Rat) / 5) [(0, 2), (11, 1), (15, 1)]
]

/-- Partial product 362 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0362 : Poly :=
[
  term ((-288 : Rat) / 5) [(0, 2), (6, 1), (11, 1), (15, 1)],
  term ((144 : Rat) / 5) [(0, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 362 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0362_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0362
        rs_R006_ueqv_R006_generator_16_0300_0399 =
      rs_R006_ueqv_R006_partial_16_0362 := by
  native_decide

/-- Coefficient term 363 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0363 : Poly :=
[
  term ((12 : Rat) / 5) [(0, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 363 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0363 : Poly :=
[
  term ((24 : Rat) / 5) [(0, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-12 : Rat) / 5) [(0, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 363 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0363_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0363
        rs_R006_ueqv_R006_generator_16_0300_0399 =
      rs_R006_ueqv_R006_partial_16_0363 := by
  native_decide

/-- Coefficient term 364 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0364 : Poly :=
[
  term ((-2208 : Rat) / 5) [(0, 2), (13, 1), (15, 1)]
]

/-- Partial product 364 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0364 : Poly :=
[
  term ((-4416 : Rat) / 5) [(0, 2), (6, 1), (13, 1), (15, 1)],
  term ((2208 : Rat) / 5) [(0, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 364 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0364_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0364
        rs_R006_ueqv_R006_generator_16_0300_0399 =
      rs_R006_ueqv_R006_partial_16_0364 := by
  native_decide

/-- Coefficient term 365 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0365 : Poly :=
[
  term ((2778 : Rat) / 25) [(0, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 365 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0365 : Poly :=
[
  term ((5556 : Rat) / 25) [(0, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2778 : Rat) / 25) [(0, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 365 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0365_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0365
        rs_R006_ueqv_R006_generator_16_0300_0399 =
      rs_R006_ueqv_R006_partial_16_0365 := by
  native_decide

/-- Coefficient term 366 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0366 : Poly :=
[
  term (24 : Rat) [(1, 1), (2, 1), (3, 1)]
]

/-- Partial product 366 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0366 : Poly :=
[
  term (-24 : Rat) [(1, 1), (2, 1), (3, 1)],
  term (48 : Rat) [(1, 1), (2, 1), (3, 1), (6, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 366 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0366_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0366
        rs_R006_ueqv_R006_generator_16_0300_0399 =
      rs_R006_ueqv_R006_partial_16_0366 := by
  native_decide

/-- Coefficient term 367 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0367 : Poly :=
[
  term ((-96 : Rat) / 35) [(1, 1), (2, 1), (3, 1), (5, 1), (13, 1)]
]

/-- Partial product 367 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0367 : Poly :=
[
  term ((-192 : Rat) / 35) [(1, 1), (2, 1), (3, 1), (5, 1), (6, 1), (13, 1)],
  term ((96 : Rat) / 35) [(1, 1), (2, 1), (3, 1), (5, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 367 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0367_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0367
        rs_R006_ueqv_R006_generator_16_0300_0399 =
      rs_R006_ueqv_R006_partial_16_0367 := by
  native_decide

/-- Coefficient term 368 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0368 : Poly :=
[
  term ((-1728 : Rat) / 5) [(1, 1), (2, 1), (3, 1), (9, 1), (12, 1), (15, 1)]
]

/-- Partial product 368 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0368 : Poly :=
[
  term ((-3456 : Rat) / 5) [(1, 1), (2, 1), (3, 1), (6, 1), (9, 1), (12, 1), (15, 1)],
  term ((1728 : Rat) / 5) [(1, 1), (2, 1), (3, 1), (9, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 368 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0368_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0368
        rs_R006_ueqv_R006_generator_16_0300_0399 =
      rs_R006_ueqv_R006_partial_16_0368 := by
  native_decide

/-- Coefficient term 369 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0369 : Poly :=
[
  term ((576 : Rat) / 5) [(1, 1), (2, 1), (3, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 369 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0369 : Poly :=
[
  term ((1152 : Rat) / 5) [(1, 1), (2, 1), (3, 1), (6, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-576 : Rat) / 5) [(1, 1), (2, 1), (3, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 369 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0369_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0369
        rs_R006_ueqv_R006_generator_16_0300_0399 =
      rs_R006_ueqv_R006_partial_16_0369 := by
  native_decide

/-- Coefficient term 370 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0370 : Poly :=
[
  term ((-816 : Rat) / 7) [(1, 1), (2, 1), (3, 1), (9, 1), (13, 1)]
]

/-- Partial product 370 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0370 : Poly :=
[
  term ((-1632 : Rat) / 7) [(1, 1), (2, 1), (3, 1), (6, 1), (9, 1), (13, 1)],
  term ((816 : Rat) / 7) [(1, 1), (2, 1), (3, 1), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 370 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0370_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0370
        rs_R006_ueqv_R006_generator_16_0300_0399 =
      rs_R006_ueqv_R006_partial_16_0370 := by
  native_decide

/-- Coefficient term 371 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0371 : Poly :=
[
  term ((432 : Rat) / 5) [(1, 1), (2, 1), (3, 1), (9, 1), (13, 1), (14, 1)]
]

/-- Partial product 371 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0371 : Poly :=
[
  term ((864 : Rat) / 5) [(1, 1), (2, 1), (3, 1), (6, 1), (9, 1), (13, 1), (14, 1)],
  term ((-432 : Rat) / 5) [(1, 1), (2, 1), (3, 1), (9, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 371 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0371_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0371
        rs_R006_ueqv_R006_generator_16_0300_0399 =
      rs_R006_ueqv_R006_partial_16_0371 := by
  native_decide

/-- Coefficient term 372 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0372 : Poly :=
[
  term ((-144 : Rat) / 5) [(1, 1), (2, 1), (3, 1), (9, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 372 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0372 : Poly :=
[
  term ((-288 : Rat) / 5) [(1, 1), (2, 1), (3, 1), (6, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((144 : Rat) / 5) [(1, 1), (2, 1), (3, 1), (9, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 372 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0372_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0372
        rs_R006_ueqv_R006_generator_16_0300_0399 =
      rs_R006_ueqv_R006_partial_16_0372 := by
  native_decide

/-- Coefficient term 373 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0373 : Poly :=
[
  term ((192 : Rat) / 5) [(1, 1), (2, 1), (3, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 373 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0373 : Poly :=
[
  term ((384 : Rat) / 5) [(1, 1), (2, 1), (3, 1), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((-192 : Rat) / 5) [(1, 1), (2, 1), (3, 1), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 373 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0373_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0373
        rs_R006_ueqv_R006_generator_16_0300_0399 =
      rs_R006_ueqv_R006_partial_16_0373 := by
  native_decide

/-- Coefficient term 374 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0374 : Poly :=
[
  term (288 : Rat) [(1, 1), (2, 1), (3, 1), (9, 1), (15, 1)]
]

/-- Partial product 374 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0374 : Poly :=
[
  term (576 : Rat) [(1, 1), (2, 1), (3, 1), (6, 1), (9, 1), (15, 1)],
  term (-288 : Rat) [(1, 1), (2, 1), (3, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 374 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0374_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0374
        rs_R006_ueqv_R006_generator_16_0300_0399 =
      rs_R006_ueqv_R006_partial_16_0374 := by
  native_decide

/-- Coefficient term 375 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0375 : Poly :=
[
  term (-96 : Rat) [(1, 1), (2, 1), (3, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 375 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0375 : Poly :=
[
  term (-192 : Rat) [(1, 1), (2, 1), (3, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term (96 : Rat) [(1, 1), (2, 1), (3, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 375 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0375_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0375
        rs_R006_ueqv_R006_generator_16_0300_0399 =
      rs_R006_ueqv_R006_partial_16_0375 := by
  native_decide

/-- Coefficient term 376 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0376 : Poly :=
[
  term (-12 : Rat) [(1, 1), (2, 1), (3, 1), (14, 1)]
]

/-- Partial product 376 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0376 : Poly :=
[
  term (-24 : Rat) [(1, 1), (2, 1), (3, 1), (6, 1), (14, 1)],
  term (12 : Rat) [(1, 1), (2, 1), (3, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 376 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0376_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0376
        rs_R006_ueqv_R006_generator_16_0300_0399 =
      rs_R006_ueqv_R006_partial_16_0376 := by
  native_decide

/-- Coefficient term 377 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0377 : Poly :=
[
  term ((8 : Rat) / 5) [(1, 1), (2, 1), (3, 1), (16, 1)]
]

/-- Partial product 377 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0377 : Poly :=
[
  term ((16 : Rat) / 5) [(1, 1), (2, 1), (3, 1), (6, 1), (16, 1)],
  term ((-8 : Rat) / 5) [(1, 1), (2, 1), (3, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 377 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0377_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0377
        rs_R006_ueqv_R006_generator_16_0300_0399 =
      rs_R006_ueqv_R006_partial_16_0377 := by
  native_decide

/-- Coefficient term 378 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0378 : Poly :=
[
  term ((-576 : Rat) / 5) [(1, 1), (2, 1), (3, 2), (9, 1)]
]

/-- Partial product 378 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0378 : Poly :=
[
  term ((-1152 : Rat) / 5) [(1, 1), (2, 1), (3, 2), (6, 1), (9, 1)],
  term ((576 : Rat) / 5) [(1, 1), (2, 1), (3, 2), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 378 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0378_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0378
        rs_R006_ueqv_R006_generator_16_0300_0399 =
      rs_R006_ueqv_R006_partial_16_0378 := by
  native_decide

/-- Coefficient term 379 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0379 : Poly :=
[
  term ((-288 : Rat) / 5) [(1, 1), (2, 1), (3, 2), (9, 1), (14, 1)]
]

/-- Partial product 379 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0379 : Poly :=
[
  term ((-576 : Rat) / 5) [(1, 1), (2, 1), (3, 2), (6, 1), (9, 1), (14, 1)],
  term ((288 : Rat) / 5) [(1, 1), (2, 1), (3, 2), (9, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 379 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0379_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0379
        rs_R006_ueqv_R006_generator_16_0300_0399 =
      rs_R006_ueqv_R006_partial_16_0379 := by
  native_decide

/-- Coefficient term 380 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0380 : Poly :=
[
  term ((96 : Rat) / 5) [(1, 1), (2, 1), (3, 2), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 380 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0380 : Poly :=
[
  term ((192 : Rat) / 5) [(1, 1), (2, 1), (3, 2), (6, 1), (9, 1), (14, 1), (16, 1)],
  term ((-96 : Rat) / 5) [(1, 1), (2, 1), (3, 2), (9, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 380 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0380_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0380
        rs_R006_ueqv_R006_generator_16_0300_0399 =
      rs_R006_ueqv_R006_partial_16_0380 := by
  native_decide

/-- Coefficient term 381 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0381 : Poly :=
[
  term ((192 : Rat) / 5) [(1, 1), (2, 1), (3, 2), (9, 1), (16, 1)]
]

/-- Partial product 381 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0381 : Poly :=
[
  term ((384 : Rat) / 5) [(1, 1), (2, 1), (3, 2), (6, 1), (9, 1), (16, 1)],
  term ((-192 : Rat) / 5) [(1, 1), (2, 1), (3, 2), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 381 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0381_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0381
        rs_R006_ueqv_R006_generator_16_0300_0399 =
      rs_R006_ueqv_R006_partial_16_0381 := by
  native_decide

/-- Coefficient term 382 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0382 : Poly :=
[
  term ((-24 : Rat) / 5) [(1, 1), (2, 1), (5, 1)]
]

/-- Partial product 382 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0382 : Poly :=
[
  term ((24 : Rat) / 5) [(1, 1), (2, 1), (5, 1)],
  term ((-48 : Rat) / 5) [(1, 1), (2, 1), (5, 1), (6, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 382 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0382_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0382
        rs_R006_ueqv_R006_generator_16_0300_0399 =
      rs_R006_ueqv_R006_partial_16_0382 := by
  native_decide

/-- Coefficient term 383 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0383 : Poly :=
[
  term ((-48 : Rat) / 35) [(1, 1), (2, 1), (5, 1), (13, 2)]
]

/-- Partial product 383 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0383 : Poly :=
[
  term ((-96 : Rat) / 35) [(1, 1), (2, 1), (5, 1), (6, 1), (13, 2)],
  term ((48 : Rat) / 35) [(1, 1), (2, 1), (5, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 383 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0383_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0383
        rs_R006_ueqv_R006_generator_16_0300_0399 =
      rs_R006_ueqv_R006_partial_16_0383 := by
  native_decide

/-- Coefficient term 384 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0384 : Poly :=
[
  term ((48 : Rat) / 5) [(1, 1), (2, 1), (5, 1), (14, 1)]
]

/-- Partial product 384 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0384 : Poly :=
[
  term ((96 : Rat) / 5) [(1, 1), (2, 1), (5, 1), (6, 1), (14, 1)],
  term ((-48 : Rat) / 5) [(1, 1), (2, 1), (5, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 384 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0384_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0384
        rs_R006_ueqv_R006_generator_16_0300_0399 =
      rs_R006_ueqv_R006_partial_16_0384 := by
  native_decide

/-- Coefficient term 385 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0385 : Poly :=
[
  term ((-144 : Rat) / 35) [(1, 1), (2, 1), (8, 1), (13, 1)]
]

/-- Partial product 385 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0385 : Poly :=
[
  term ((-288 : Rat) / 35) [(1, 1), (2, 1), (6, 1), (8, 1), (13, 1)],
  term ((144 : Rat) / 35) [(1, 1), (2, 1), (8, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 385 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0385_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0385
        rs_R006_ueqv_R006_generator_16_0300_0399 =
      rs_R006_ueqv_R006_partial_16_0385 := by
  native_decide

/-- Coefficient term 386 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0386 : Poly :=
[
  term ((-3744 : Rat) / 5) [(1, 1), (2, 1), (8, 1), (15, 1)]
]

/-- Partial product 386 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0386 : Poly :=
[
  term ((-7488 : Rat) / 5) [(1, 1), (2, 1), (6, 1), (8, 1), (15, 1)],
  term ((3744 : Rat) / 5) [(1, 1), (2, 1), (8, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 386 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0386_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0386
        rs_R006_ueqv_R006_generator_16_0300_0399 =
      rs_R006_ueqv_R006_partial_16_0386 := by
  native_decide

/-- Coefficient term 387 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0387 : Poly :=
[
  term ((1248 : Rat) / 5) [(1, 1), (2, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 387 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0387 : Poly :=
[
  term ((2496 : Rat) / 5) [(1, 1), (2, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((-1248 : Rat) / 5) [(1, 1), (2, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 387 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0387_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0387
        rs_R006_ueqv_R006_generator_16_0300_0399 =
      rs_R006_ueqv_R006_partial_16_0387 := by
  native_decide

/-- Coefficient term 388 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0388 : Poly :=
[
  term (576 : Rat) [(1, 1), (2, 1), (9, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 388 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0388 : Poly :=
[
  term (1152 : Rat) [(1, 1), (2, 1), (6, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term (-576 : Rat) [(1, 1), (2, 1), (9, 1), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 388 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0388_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0388
        rs_R006_ueqv_R006_generator_16_0300_0399 =
      rs_R006_ueqv_R006_partial_16_0388 := by
  native_decide

/-- Coefficient term 389 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0389 : Poly :=
[
  term (-192 : Rat) [(1, 1), (2, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 389 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0389 : Poly :=
[
  term (-384 : Rat) [(1, 1), (2, 1), (6, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term (192 : Rat) [(1, 1), (2, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 389 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0389_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0389
        rs_R006_ueqv_R006_generator_16_0300_0399 =
      rs_R006_ueqv_R006_partial_16_0389 := by
  native_decide

/-- Coefficient term 390 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0390 : Poly :=
[
  term ((-6624 : Rat) / 5) [(1, 1), (2, 1), (9, 1), (11, 1), (15, 1)]
]

/-- Partial product 390 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0390 : Poly :=
[
  term ((-13248 : Rat) / 5) [(1, 1), (2, 1), (6, 1), (9, 1), (11, 1), (15, 1)],
  term ((6624 : Rat) / 5) [(1, 1), (2, 1), (9, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 390 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0390_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0390
        rs_R006_ueqv_R006_generator_16_0300_0399 =
      rs_R006_ueqv_R006_partial_16_0390 := by
  native_decide

/-- Coefficient term 391 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0391 : Poly :=
[
  term ((2208 : Rat) / 5) [(1, 1), (2, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 391 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0391 : Poly :=
[
  term ((4416 : Rat) / 5) [(1, 1), (2, 1), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-2208 : Rat) / 5) [(1, 1), (2, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 391 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0391_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0391
        rs_R006_ueqv_R006_generator_16_0300_0399 =
      rs_R006_ueqv_R006_partial_16_0391 := by
  native_decide

/-- Coefficient term 392 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0392 : Poly :=
[
  term ((5184 : Rat) / 5) [(1, 1), (2, 1), (9, 1), (13, 1), (15, 1)]
]

/-- Partial product 392 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0392 : Poly :=
[
  term ((10368 : Rat) / 5) [(1, 1), (2, 1), (6, 1), (9, 1), (13, 1), (15, 1)],
  term ((-5184 : Rat) / 5) [(1, 1), (2, 1), (9, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 392 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0392_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0392
        rs_R006_ueqv_R006_generator_16_0300_0399 =
      rs_R006_ueqv_R006_partial_16_0392 := by
  native_decide

/-- Coefficient term 393 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0393 : Poly :=
[
  term ((-1728 : Rat) / 5) [(1, 1), (2, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 393 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0393 : Poly :=
[
  term ((-3456 : Rat) / 5) [(1, 1), (2, 1), (6, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((1728 : Rat) / 5) [(1, 1), (2, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 393 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0393_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0393
        rs_R006_ueqv_R006_generator_16_0300_0399 =
      rs_R006_ueqv_R006_partial_16_0393 := by
  native_decide

/-- Coefficient term 394 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0394 : Poly :=
[
  term ((-192 : Rat) / 7) [(1, 1), (2, 1), (9, 1), (13, 2)]
]

/-- Partial product 394 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0394 : Poly :=
[
  term ((-384 : Rat) / 7) [(1, 1), (2, 1), (6, 1), (9, 1), (13, 2)],
  term ((192 : Rat) / 7) [(1, 1), (2, 1), (9, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 394 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0394_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0394
        rs_R006_ueqv_R006_generator_16_0300_0399 =
      rs_R006_ueqv_R006_partial_16_0394 := by
  native_decide

/-- Coefficient term 395 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0395 : Poly :=
[
  term ((288 : Rat) / 5) [(1, 1), (2, 1), (9, 1), (13, 2), (14, 1)]
]

/-- Partial product 395 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0395 : Poly :=
[
  term ((576 : Rat) / 5) [(1, 1), (2, 1), (6, 1), (9, 1), (13, 2), (14, 1)],
  term ((-288 : Rat) / 5) [(1, 1), (2, 1), (9, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 395 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0395_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0395
        rs_R006_ueqv_R006_generator_16_0300_0399 =
      rs_R006_ueqv_R006_partial_16_0395 := by
  native_decide

/-- Coefficient term 396 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0396 : Poly :=
[
  term ((-96 : Rat) / 5) [(1, 1), (2, 1), (9, 1), (13, 2), (14, 1), (16, 1)]
]

/-- Partial product 396 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0396 : Poly :=
[
  term ((-192 : Rat) / 5) [(1, 1), (2, 1), (6, 1), (9, 1), (13, 2), (14, 1), (16, 1)],
  term ((96 : Rat) / 5) [(1, 1), (2, 1), (9, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 396 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0396_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0396
        rs_R006_ueqv_R006_generator_16_0300_0399 =
      rs_R006_ueqv_R006_partial_16_0396 := by
  native_decide

/-- Coefficient term 397 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0397 : Poly :=
[
  term ((48 : Rat) / 5) [(1, 1), (2, 1), (9, 1), (13, 2), (16, 1)]
]

/-- Partial product 397 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0397 : Poly :=
[
  term ((96 : Rat) / 5) [(1, 1), (2, 1), (6, 1), (9, 1), (13, 2), (16, 1)],
  term ((-48 : Rat) / 5) [(1, 1), (2, 1), (9, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 397 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0397_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0397
        rs_R006_ueqv_R006_generator_16_0300_0399 =
      rs_R006_ueqv_R006_partial_16_0397 := by
  native_decide

/-- Coefficient term 398 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0398 : Poly :=
[
  term ((5184 : Rat) / 5) [(1, 1), (2, 1), (9, 2), (15, 1)]
]

/-- Partial product 398 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0398 : Poly :=
[
  term ((10368 : Rat) / 5) [(1, 1), (2, 1), (6, 1), (9, 2), (15, 1)],
  term ((-5184 : Rat) / 5) [(1, 1), (2, 1), (9, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 398 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0398_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0398
        rs_R006_ueqv_R006_generator_16_0300_0399 =
      rs_R006_ueqv_R006_partial_16_0398 := by
  native_decide

/-- Coefficient term 399 from coefficient polynomial 16. -/
def rs_R006_ueqv_R006_coefficient_16_0399 : Poly :=
[
  term ((-1728 : Rat) / 5) [(1, 1), (2, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 399 for generator 16. -/
def rs_R006_ueqv_R006_partial_16_0399 : Poly :=
[
  term ((-3456 : Rat) / 5) [(1, 1), (2, 1), (6, 1), (9, 2), (15, 1), (16, 1)],
  term ((1728 : Rat) / 5) [(1, 1), (2, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 399 for generator 16. -/
theorem rs_R006_ueqv_R006_partial_16_0399_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_16_0399
        rs_R006_ueqv_R006_generator_16_0300_0399 =
      rs_R006_ueqv_R006_partial_16_0399 := by
  native_decide

/-- Partial products in this block. -/
def rs_R006_ueqv_R006_partials_16_0300_0399 : List Poly :=
[
  rs_R006_ueqv_R006_partial_16_0300,
  rs_R006_ueqv_R006_partial_16_0301,
  rs_R006_ueqv_R006_partial_16_0302,
  rs_R006_ueqv_R006_partial_16_0303,
  rs_R006_ueqv_R006_partial_16_0304,
  rs_R006_ueqv_R006_partial_16_0305,
  rs_R006_ueqv_R006_partial_16_0306,
  rs_R006_ueqv_R006_partial_16_0307,
  rs_R006_ueqv_R006_partial_16_0308,
  rs_R006_ueqv_R006_partial_16_0309,
  rs_R006_ueqv_R006_partial_16_0310,
  rs_R006_ueqv_R006_partial_16_0311,
  rs_R006_ueqv_R006_partial_16_0312,
  rs_R006_ueqv_R006_partial_16_0313,
  rs_R006_ueqv_R006_partial_16_0314,
  rs_R006_ueqv_R006_partial_16_0315,
  rs_R006_ueqv_R006_partial_16_0316,
  rs_R006_ueqv_R006_partial_16_0317,
  rs_R006_ueqv_R006_partial_16_0318,
  rs_R006_ueqv_R006_partial_16_0319,
  rs_R006_ueqv_R006_partial_16_0320,
  rs_R006_ueqv_R006_partial_16_0321,
  rs_R006_ueqv_R006_partial_16_0322,
  rs_R006_ueqv_R006_partial_16_0323,
  rs_R006_ueqv_R006_partial_16_0324,
  rs_R006_ueqv_R006_partial_16_0325,
  rs_R006_ueqv_R006_partial_16_0326,
  rs_R006_ueqv_R006_partial_16_0327,
  rs_R006_ueqv_R006_partial_16_0328,
  rs_R006_ueqv_R006_partial_16_0329,
  rs_R006_ueqv_R006_partial_16_0330,
  rs_R006_ueqv_R006_partial_16_0331,
  rs_R006_ueqv_R006_partial_16_0332,
  rs_R006_ueqv_R006_partial_16_0333,
  rs_R006_ueqv_R006_partial_16_0334,
  rs_R006_ueqv_R006_partial_16_0335,
  rs_R006_ueqv_R006_partial_16_0336,
  rs_R006_ueqv_R006_partial_16_0337,
  rs_R006_ueqv_R006_partial_16_0338,
  rs_R006_ueqv_R006_partial_16_0339,
  rs_R006_ueqv_R006_partial_16_0340,
  rs_R006_ueqv_R006_partial_16_0341,
  rs_R006_ueqv_R006_partial_16_0342,
  rs_R006_ueqv_R006_partial_16_0343,
  rs_R006_ueqv_R006_partial_16_0344,
  rs_R006_ueqv_R006_partial_16_0345,
  rs_R006_ueqv_R006_partial_16_0346,
  rs_R006_ueqv_R006_partial_16_0347,
  rs_R006_ueqv_R006_partial_16_0348,
  rs_R006_ueqv_R006_partial_16_0349,
  rs_R006_ueqv_R006_partial_16_0350,
  rs_R006_ueqv_R006_partial_16_0351,
  rs_R006_ueqv_R006_partial_16_0352,
  rs_R006_ueqv_R006_partial_16_0353,
  rs_R006_ueqv_R006_partial_16_0354,
  rs_R006_ueqv_R006_partial_16_0355,
  rs_R006_ueqv_R006_partial_16_0356,
  rs_R006_ueqv_R006_partial_16_0357,
  rs_R006_ueqv_R006_partial_16_0358,
  rs_R006_ueqv_R006_partial_16_0359,
  rs_R006_ueqv_R006_partial_16_0360,
  rs_R006_ueqv_R006_partial_16_0361,
  rs_R006_ueqv_R006_partial_16_0362,
  rs_R006_ueqv_R006_partial_16_0363,
  rs_R006_ueqv_R006_partial_16_0364,
  rs_R006_ueqv_R006_partial_16_0365,
  rs_R006_ueqv_R006_partial_16_0366,
  rs_R006_ueqv_R006_partial_16_0367,
  rs_R006_ueqv_R006_partial_16_0368,
  rs_R006_ueqv_R006_partial_16_0369,
  rs_R006_ueqv_R006_partial_16_0370,
  rs_R006_ueqv_R006_partial_16_0371,
  rs_R006_ueqv_R006_partial_16_0372,
  rs_R006_ueqv_R006_partial_16_0373,
  rs_R006_ueqv_R006_partial_16_0374,
  rs_R006_ueqv_R006_partial_16_0375,
  rs_R006_ueqv_R006_partial_16_0376,
  rs_R006_ueqv_R006_partial_16_0377,
  rs_R006_ueqv_R006_partial_16_0378,
  rs_R006_ueqv_R006_partial_16_0379,
  rs_R006_ueqv_R006_partial_16_0380,
  rs_R006_ueqv_R006_partial_16_0381,
  rs_R006_ueqv_R006_partial_16_0382,
  rs_R006_ueqv_R006_partial_16_0383,
  rs_R006_ueqv_R006_partial_16_0384,
  rs_R006_ueqv_R006_partial_16_0385,
  rs_R006_ueqv_R006_partial_16_0386,
  rs_R006_ueqv_R006_partial_16_0387,
  rs_R006_ueqv_R006_partial_16_0388,
  rs_R006_ueqv_R006_partial_16_0389,
  rs_R006_ueqv_R006_partial_16_0390,
  rs_R006_ueqv_R006_partial_16_0391,
  rs_R006_ueqv_R006_partial_16_0392,
  rs_R006_ueqv_R006_partial_16_0393,
  rs_R006_ueqv_R006_partial_16_0394,
  rs_R006_ueqv_R006_partial_16_0395,
  rs_R006_ueqv_R006_partial_16_0396,
  rs_R006_ueqv_R006_partial_16_0397,
  rs_R006_ueqv_R006_partial_16_0398,
  rs_R006_ueqv_R006_partial_16_0399
]

/-- Sum of partial products in this block. -/
def rs_R006_ueqv_R006_block_16_0300_0399 : Poly :=
[
  term ((-576 : Rat) / 5) [(0, 1), (6, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((288 : Rat) / 5) [(0, 1), (6, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-2892 : Rat) / 5) [(0, 1), (6, 1), (11, 1), (12, 1), (15, 1)],
  term ((4596 : Rat) / 25) [(0, 1), (6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1152 : Rat) / 5) [(0, 1), (6, 1), (11, 1), (12, 2), (15, 1)],
  term ((1128 : Rat) / 25) [(0, 1), (6, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-14016 : Rat) / 35) [(0, 1), (6, 1), (11, 1), (13, 1)],
  term ((1296 : Rat) / 5) [(0, 1), (6, 1), (11, 1), (13, 1), (14, 1)],
  term ((192 : Rat) / 5) [(0, 1), (6, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-96 : Rat) / 5) [(0, 1), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((1128 : Rat) / 5) [(0, 1), (6, 1), (11, 1), (15, 1)],
  term ((-1728 : Rat) / 25) [(0, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((1884 : Rat) / 5) [(0, 1), (6, 1), (11, 2)],
  term ((-1356 : Rat) / 5) [(0, 1), (6, 1), (11, 2), (14, 1)],
  term ((4 : Rat) / 5) [(0, 1), (6, 1), (11, 2), (16, 1)],
  term ((-276 : Rat) / 5) [(0, 1), (6, 1), (12, 1)],
  term ((1728 : Rat) / 5) [(0, 1), (6, 1), (12, 1), (13, 1), (15, 1)],
  term ((-2076 : Rat) / 25) [(0, 1), (6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((216 : Rat) / 5) [(0, 1), (6, 1), (12, 1), (14, 1)],
  term ((28638 : Rat) / 25) [(0, 1), (6, 1), (13, 1), (15, 1)],
  term ((-1998 : Rat) / 5) [(0, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((22908 : Rat) / 35) [(0, 1), (6, 1), (13, 2)],
  term ((-6624 : Rat) / 5) [(0, 1), (6, 1), (13, 2), (14, 1)],
  term ((2208 : Rat) / 5) [(0, 1), (6, 1), (13, 2), (14, 1), (16, 1)],
  term ((-1104 : Rat) / 5) [(0, 1), (6, 1), (13, 2), (16, 1)],
  term ((288 : Rat) / 5) [(0, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-144 : Rat) / 5) [(0, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((1446 : Rat) / 5) [(0, 1), (11, 1), (12, 1), (15, 1)],
  term ((-2298 : Rat) / 25) [(0, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((576 : Rat) / 5) [(0, 1), (11, 1), (12, 2), (15, 1)],
  term ((-564 : Rat) / 25) [(0, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((7008 : Rat) / 35) [(0, 1), (11, 1), (13, 1)],
  term ((-648 : Rat) / 5) [(0, 1), (11, 1), (13, 1), (14, 1)],
  term ((-96 : Rat) / 5) [(0, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((48 : Rat) / 5) [(0, 1), (11, 1), (13, 1), (16, 1)],
  term ((-564 : Rat) / 5) [(0, 1), (11, 1), (15, 1)],
  term ((864 : Rat) / 25) [(0, 1), (11, 1), (15, 1), (16, 1)],
  term ((-942 : Rat) / 5) [(0, 1), (11, 2)],
  term ((678 : Rat) / 5) [(0, 1), (11, 2), (14, 1)],
  term ((-2 : Rat) / 5) [(0, 1), (11, 2), (16, 1)],
  term ((138 : Rat) / 5) [(0, 1), (12, 1)],
  term ((-864 : Rat) / 5) [(0, 1), (12, 1), (13, 1), (15, 1)],
  term ((1038 : Rat) / 25) [(0, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-108 : Rat) / 5) [(0, 1), (12, 1), (14, 1)],
  term ((-14319 : Rat) / 25) [(0, 1), (13, 1), (15, 1)],
  term ((999 : Rat) / 5) [(0, 1), (13, 1), (15, 1), (16, 1)],
  term ((-11454 : Rat) / 35) [(0, 1), (13, 2)],
  term ((3312 : Rat) / 5) [(0, 1), (13, 2), (14, 1)],
  term ((-1104 : Rat) / 5) [(0, 1), (13, 2), (14, 1), (16, 1)],
  term ((552 : Rat) / 5) [(0, 1), (13, 2), (16, 1)],
  term ((384 : Rat) / 5) [(0, 2), (1, 1), (3, 1), (6, 1), (9, 1), (15, 1)],
  term ((-96 : Rat) / 5) [(0, 2), (1, 1), (3, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-192 : Rat) / 5) [(0, 2), (1, 1), (3, 1), (9, 1), (15, 1)],
  term ((48 : Rat) / 5) [(0, 2), (1, 1), (3, 1), (9, 1), (15, 1), (16, 1)],
  term (-384 : Rat) [(0, 2), (1, 1), (6, 1), (9, 1), (11, 1), (15, 1)],
  term (96 : Rat) [(0, 2), (1, 1), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term (192 : Rat) [(0, 2), (1, 1), (9, 1), (11, 1), (15, 1)],
  term (-48 : Rat) [(0, 2), (1, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((384 : Rat) / 5) [(0, 2), (2, 1), (6, 1), (9, 1), (15, 1)],
  term ((-96 : Rat) / 5) [(0, 2), (2, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-144 : Rat) / 25) [(0, 2), (2, 1), (6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term (24 : Rat) [(0, 2), (2, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-72 : Rat) / 25) [(0, 2), (2, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-192 : Rat) / 5) [(0, 2), (2, 1), (9, 1), (15, 1)],
  term ((48 : Rat) / 5) [(0, 2), (2, 1), (9, 1), (15, 1), (16, 1)],
  term ((72 : Rat) / 25) [(0, 2), (2, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term (-12 : Rat) [(0, 2), (2, 1), (11, 1), (15, 1), (16, 1)],
  term ((36 : Rat) / 25) [(0, 2), (2, 1), (13, 1), (15, 1), (16, 1)],
  term ((768 : Rat) / 5) [(0, 2), (3, 1), (6, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((-192 : Rat) / 5) [(0, 2), (3, 1), (6, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term (-384 : Rat) [(0, 2), (3, 1), (6, 1), (9, 1), (11, 1), (15, 1)],
  term (96 : Rat) [(0, 2), (3, 1), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((384 : Rat) / 5) [(0, 2), (3, 1), (6, 1), (9, 1), (13, 1), (15, 1)],
  term ((-96 : Rat) / 5) [(0, 2), (3, 1), (6, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-96 : Rat) / 5) [(0, 2), (3, 1), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((48 : Rat) / 5) [(0, 2), (3, 1), (6, 1), (11, 2), (15, 1), (16, 1)],
  term ((192 : Rat) / 25) [(0, 2), (3, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-48 : Rat) / 5) [(0, 2), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((-384 : Rat) / 5) [(0, 2), (3, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((96 : Rat) / 5) [(0, 2), (3, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term (192 : Rat) [(0, 2), (3, 1), (9, 1), (11, 1), (15, 1)],
  term (-48 : Rat) [(0, 2), (3, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-192 : Rat) / 5) [(0, 2), (3, 1), (9, 1), (13, 1), (15, 1)],
  term ((48 : Rat) / 5) [(0, 2), (3, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((48 : Rat) / 5) [(0, 2), (3, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-24 : Rat) / 5) [(0, 2), (3, 1), (11, 2), (15, 1), (16, 1)],
  term ((-96 : Rat) / 25) [(0, 2), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((24 : Rat) / 5) [(0, 2), (3, 1), (15, 1), (16, 1)],
  term ((-768 : Rat) / 5) [(0, 2), (3, 2), (6, 1), (9, 1), (15, 1)],
  term ((192 : Rat) / 5) [(0, 2), (3, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((384 : Rat) / 5) [(0, 2), (3, 2), (9, 1), (15, 1)],
  term ((-96 : Rat) / 5) [(0, 2), (3, 2), (9, 1), (15, 1), (16, 1)],
  term ((2304 : Rat) / 5) [(0, 2), (6, 1), (8, 1), (9, 1), (15, 1)],
  term ((-576 : Rat) / 5) [(0, 2), (6, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((1152 : Rat) / 5) [(0, 2), (6, 1), (8, 1), (11, 1), (15, 1)],
  term ((-288 : Rat) / 5) [(0, 2), (6, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-13824 : Rat) / 5) [(0, 2), (6, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((3456 : Rat) / 5) [(0, 2), (6, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((8832 : Rat) / 5) [(0, 2), (6, 1), (9, 1), (11, 2), (15, 1)],
  term ((-2208 : Rat) / 5) [(0, 2), (6, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-2304 : Rat) / 5) [(0, 2), (6, 1), (9, 1), (12, 1), (15, 1)],
  term ((576 : Rat) / 5) [(0, 2), (6, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term (384 : Rat) [(0, 2), (6, 1), (9, 1), (15, 1)],
  term (-96 : Rat) [(0, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-2304 : Rat) / 5) [(0, 2), (6, 1), (9, 2), (11, 1), (15, 1)],
  term ((576 : Rat) / 5) [(0, 2), (6, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((1152 : Rat) / 5) [(0, 2), (6, 1), (11, 1), (12, 1), (15, 1)],
  term ((-264 : Rat) / 5) [(0, 2), (6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-288 : Rat) / 5) [(0, 2), (6, 1), (11, 1), (15, 1)],
  term ((24 : Rat) / 5) [(0, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-4416 : Rat) / 5) [(0, 2), (6, 1), (13, 1), (15, 1)],
  term ((5556 : Rat) / 25) [(0, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1152 : Rat) / 5) [(0, 2), (8, 1), (9, 1), (15, 1)],
  term ((288 : Rat) / 5) [(0, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-576 : Rat) / 5) [(0, 2), (8, 1), (11, 1), (15, 1)],
  term ((144 : Rat) / 5) [(0, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((6912 : Rat) / 5) [(0, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-1728 : Rat) / 5) [(0, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4416 : Rat) / 5) [(0, 2), (9, 1), (11, 2), (15, 1)],
  term ((1104 : Rat) / 5) [(0, 2), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((1152 : Rat) / 5) [(0, 2), (9, 1), (12, 1), (15, 1)],
  term ((-288 : Rat) / 5) [(0, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term (-192 : Rat) [(0, 2), (9, 1), (15, 1)],
  term (48 : Rat) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term ((1152 : Rat) / 5) [(0, 2), (9, 2), (11, 1), (15, 1)],
  term ((-288 : Rat) / 5) [(0, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-576 : Rat) / 5) [(0, 2), (11, 1), (12, 1), (15, 1)],
  term ((132 : Rat) / 5) [(0, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((144 : Rat) / 5) [(0, 2), (11, 1), (15, 1)],
  term ((-12 : Rat) / 5) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((2208 : Rat) / 5) [(0, 2), (13, 1), (15, 1)],
  term ((-2778 : Rat) / 25) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term (-24 : Rat) [(1, 1), (2, 1), (3, 1)],
  term ((-192 : Rat) / 35) [(1, 1), (2, 1), (3, 1), (5, 1), (6, 1), (13, 1)],
  term ((96 : Rat) / 35) [(1, 1), (2, 1), (3, 1), (5, 1), (13, 1)],
  term (48 : Rat) [(1, 1), (2, 1), (3, 1), (6, 1)],
  term ((-3456 : Rat) / 5) [(1, 1), (2, 1), (3, 1), (6, 1), (9, 1), (12, 1), (15, 1)],
  term ((1152 : Rat) / 5) [(1, 1), (2, 1), (3, 1), (6, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1632 : Rat) / 7) [(1, 1), (2, 1), (3, 1), (6, 1), (9, 1), (13, 1)],
  term ((864 : Rat) / 5) [(1, 1), (2, 1), (3, 1), (6, 1), (9, 1), (13, 1), (14, 1)],
  term ((-288 : Rat) / 5) [(1, 1), (2, 1), (3, 1), (6, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((384 : Rat) / 5) [(1, 1), (2, 1), (3, 1), (6, 1), (9, 1), (13, 1), (16, 1)],
  term (576 : Rat) [(1, 1), (2, 1), (3, 1), (6, 1), (9, 1), (15, 1)],
  term (-192 : Rat) [(1, 1), (2, 1), (3, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term (-24 : Rat) [(1, 1), (2, 1), (3, 1), (6, 1), (14, 1)],
  term ((16 : Rat) / 5) [(1, 1), (2, 1), (3, 1), (6, 1), (16, 1)],
  term ((1728 : Rat) / 5) [(1, 1), (2, 1), (3, 1), (9, 1), (12, 1), (15, 1)],
  term ((-576 : Rat) / 5) [(1, 1), (2, 1), (3, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((816 : Rat) / 7) [(1, 1), (2, 1), (3, 1), (9, 1), (13, 1)],
  term ((-432 : Rat) / 5) [(1, 1), (2, 1), (3, 1), (9, 1), (13, 1), (14, 1)],
  term ((144 : Rat) / 5) [(1, 1), (2, 1), (3, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-192 : Rat) / 5) [(1, 1), (2, 1), (3, 1), (9, 1), (13, 1), (16, 1)],
  term (-288 : Rat) [(1, 1), (2, 1), (3, 1), (9, 1), (15, 1)],
  term (96 : Rat) [(1, 1), (2, 1), (3, 1), (9, 1), (15, 1), (16, 1)],
  term (12 : Rat) [(1, 1), (2, 1), (3, 1), (14, 1)],
  term ((-8 : Rat) / 5) [(1, 1), (2, 1), (3, 1), (16, 1)],
  term ((-1152 : Rat) / 5) [(1, 1), (2, 1), (3, 2), (6, 1), (9, 1)],
  term ((-576 : Rat) / 5) [(1, 1), (2, 1), (3, 2), (6, 1), (9, 1), (14, 1)],
  term ((192 : Rat) / 5) [(1, 1), (2, 1), (3, 2), (6, 1), (9, 1), (14, 1), (16, 1)],
  term ((384 : Rat) / 5) [(1, 1), (2, 1), (3, 2), (6, 1), (9, 1), (16, 1)],
  term ((576 : Rat) / 5) [(1, 1), (2, 1), (3, 2), (9, 1)],
  term ((288 : Rat) / 5) [(1, 1), (2, 1), (3, 2), (9, 1), (14, 1)],
  term ((-96 : Rat) / 5) [(1, 1), (2, 1), (3, 2), (9, 1), (14, 1), (16, 1)],
  term ((-192 : Rat) / 5) [(1, 1), (2, 1), (3, 2), (9, 1), (16, 1)],
  term ((24 : Rat) / 5) [(1, 1), (2, 1), (5, 1)],
  term ((-48 : Rat) / 5) [(1, 1), (2, 1), (5, 1), (6, 1)],
  term ((-96 : Rat) / 35) [(1, 1), (2, 1), (5, 1), (6, 1), (13, 2)],
  term ((96 : Rat) / 5) [(1, 1), (2, 1), (5, 1), (6, 1), (14, 1)],
  term ((48 : Rat) / 35) [(1, 1), (2, 1), (5, 1), (13, 2)],
  term ((-48 : Rat) / 5) [(1, 1), (2, 1), (5, 1), (14, 1)],
  term ((-288 : Rat) / 35) [(1, 1), (2, 1), (6, 1), (8, 1), (13, 1)],
  term ((-7488 : Rat) / 5) [(1, 1), (2, 1), (6, 1), (8, 1), (15, 1)],
  term ((2496 : Rat) / 5) [(1, 1), (2, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term (1152 : Rat) [(1, 1), (2, 1), (6, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term (-384 : Rat) [(1, 1), (2, 1), (6, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-13248 : Rat) / 5) [(1, 1), (2, 1), (6, 1), (9, 1), (11, 1), (15, 1)],
  term ((4416 : Rat) / 5) [(1, 1), (2, 1), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((10368 : Rat) / 5) [(1, 1), (2, 1), (6, 1), (9, 1), (13, 1), (15, 1)],
  term ((-3456 : Rat) / 5) [(1, 1), (2, 1), (6, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-384 : Rat) / 7) [(1, 1), (2, 1), (6, 1), (9, 1), (13, 2)],
  term ((576 : Rat) / 5) [(1, 1), (2, 1), (6, 1), (9, 1), (13, 2), (14, 1)],
  term ((-192 : Rat) / 5) [(1, 1), (2, 1), (6, 1), (9, 1), (13, 2), (14, 1), (16, 1)],
  term ((96 : Rat) / 5) [(1, 1), (2, 1), (6, 1), (9, 1), (13, 2), (16, 1)],
  term ((10368 : Rat) / 5) [(1, 1), (2, 1), (6, 1), (9, 2), (15, 1)],
  term ((-3456 : Rat) / 5) [(1, 1), (2, 1), (6, 1), (9, 2), (15, 1), (16, 1)],
  term ((144 : Rat) / 35) [(1, 1), (2, 1), (8, 1), (13, 1)],
  term ((3744 : Rat) / 5) [(1, 1), (2, 1), (8, 1), (15, 1)],
  term ((-1248 : Rat) / 5) [(1, 1), (2, 1), (8, 1), (15, 1), (16, 1)],
  term (-576 : Rat) [(1, 1), (2, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term (192 : Rat) [(1, 1), (2, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((6624 : Rat) / 5) [(1, 1), (2, 1), (9, 1), (11, 1), (15, 1)],
  term ((-2208 : Rat) / 5) [(1, 1), (2, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-5184 : Rat) / 5) [(1, 1), (2, 1), (9, 1), (13, 1), (15, 1)],
  term ((1728 : Rat) / 5) [(1, 1), (2, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((192 : Rat) / 7) [(1, 1), (2, 1), (9, 1), (13, 2)],
  term ((-288 : Rat) / 5) [(1, 1), (2, 1), (9, 1), (13, 2), (14, 1)],
  term ((96 : Rat) / 5) [(1, 1), (2, 1), (9, 1), (13, 2), (14, 1), (16, 1)],
  term ((-48 : Rat) / 5) [(1, 1), (2, 1), (9, 1), (13, 2), (16, 1)],
  term ((-5184 : Rat) / 5) [(1, 1), (2, 1), (9, 2), (15, 1)],
  term ((1728 : Rat) / 5) [(1, 1), (2, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 16, terms 300 through 399. -/
theorem rs_R006_ueqv_R006_block_16_0300_0399_valid :
    checkProductSumEq rs_R006_ueqv_R006_partials_16_0300_0399
      rs_R006_ueqv_R006_block_16_0300_0399 = true := by
  native_decide

end R006UeqvR006TermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
