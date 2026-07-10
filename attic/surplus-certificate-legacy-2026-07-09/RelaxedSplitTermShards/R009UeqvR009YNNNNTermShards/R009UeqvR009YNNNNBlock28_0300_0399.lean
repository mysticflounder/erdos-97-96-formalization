/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009YNNNN, term block 28:300-399

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009YNNNNTermShards

/-- Generator polynomial 28 for relaxed split surplus certificate `R009:u=v:R009YNNNN`. -/
def rs_R009_ueqv_R009YNNNN_generator_28_0300_0399 : Poly :=
[
  term (-1 : Rat) [],
  term (-2 : Rat) [(0, 1), (14, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (15, 1)],
  term (1 : Rat) [(1, 2)],
  term (2 : Rat) [(14, 1)]
]

/-- Coefficient term 300 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0300 : Poly :=
[
  term ((112 : Rat) / 9) [(6, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 300 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0300 : Poly :=
[
  term ((-224 : Rat) / 9) [(0, 1), (6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((112 : Rat) / 9) [(0, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-224 : Rat) / 9) [(1, 1), (6, 1), (11, 1), (15, 2), (16, 1)],
  term ((112 : Rat) / 9) [(1, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((224 : Rat) / 9) [(6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-112 : Rat) / 9) [(6, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 300 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0300_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0300
        rs_R009_ueqv_R009YNNNN_generator_28_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_28_0300 := by
  native_decide

/-- Coefficient term 301 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0301 : Poly :=
[
  term ((12678390449980907 : Rat) / 26109641356596) [(6, 1), (11, 2)]
]

/-- Partial product 301 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0301 : Poly :=
[
  term ((-12678390449980907 : Rat) / 13054820678298) [(0, 1), (6, 1), (11, 2), (14, 1)],
  term ((12678390449980907 : Rat) / 26109641356596) [(0, 2), (6, 1), (11, 2)],
  term ((-12678390449980907 : Rat) / 13054820678298) [(1, 1), (6, 1), (11, 2), (15, 1)],
  term ((12678390449980907 : Rat) / 26109641356596) [(1, 2), (6, 1), (11, 2)],
  term ((-12678390449980907 : Rat) / 26109641356596) [(6, 1), (11, 2)],
  term ((12678390449980907 : Rat) / 13054820678298) [(6, 1), (11, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 301 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0301_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0301
        rs_R009_ueqv_R009YNNNN_generator_28_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_28_0301 := by
  native_decide

/-- Coefficient term 302 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0302 : Poly :=
[
  term ((-2224986028928059 : Rat) / 3197098941624) [(6, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 302 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0302 : Poly :=
[
  term ((2224986028928059 : Rat) / 1598549470812) [(0, 1), (6, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-2224986028928059 : Rat) / 3197098941624) [(0, 2), (6, 1), (12, 1), (13, 1), (15, 1)],
  term ((2224986028928059 : Rat) / 1598549470812) [(1, 1), (6, 1), (12, 1), (13, 1), (15, 2)],
  term ((-2224986028928059 : Rat) / 3197098941624) [(1, 2), (6, 1), (12, 1), (13, 1), (15, 1)],
  term ((-2224986028928059 : Rat) / 1598549470812) [(6, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((2224986028928059 : Rat) / 3197098941624) [(6, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 302 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0302_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0302
        rs_R009_ueqv_R009YNNNN_generator_28_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_28_0302 := by
  native_decide

/-- Coefficient term 303 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0303 : Poly :=
[
  term ((1495 : Rat) / 252) [(6, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 303 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0303 : Poly :=
[
  term ((-1495 : Rat) / 126) [(0, 1), (6, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1495 : Rat) / 252) [(0, 2), (6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1495 : Rat) / 126) [(1, 1), (6, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((1495 : Rat) / 252) [(1, 2), (6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1495 : Rat) / 126) [(6, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1495 : Rat) / 252) [(6, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 303 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0303_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0303
        rs_R009_ueqv_R009YNNNN_generator_28_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_28_0303 := by
  native_decide

/-- Coefficient term 304 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0304 : Poly :=
[
  term ((-1532199782809 : Rat) / 26861770943) [(6, 1), (12, 1), (14, 1), (15, 2)]
]

/-- Partial product 304 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0304 : Poly :=
[
  term ((3064399565618 : Rat) / 26861770943) [(0, 1), (6, 1), (12, 1), (14, 2), (15, 2)],
  term ((-1532199782809 : Rat) / 26861770943) [(0, 2), (6, 1), (12, 1), (14, 1), (15, 2)],
  term ((3064399565618 : Rat) / 26861770943) [(1, 1), (6, 1), (12, 1), (14, 1), (15, 3)],
  term ((-1532199782809 : Rat) / 26861770943) [(1, 2), (6, 1), (12, 1), (14, 1), (15, 2)],
  term ((1532199782809 : Rat) / 26861770943) [(6, 1), (12, 1), (14, 1), (15, 2)],
  term ((-3064399565618 : Rat) / 26861770943) [(6, 1), (12, 1), (14, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 304 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0304_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0304
        rs_R009_ueqv_R009YNNNN_generator_28_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_28_0304 := by
  native_decide

/-- Coefficient term 305 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0305 : Poly :=
[
  term ((140138745041977 : Rat) / 330501789324) [(6, 1), (12, 1), (15, 2)]
]

/-- Partial product 305 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0305 : Poly :=
[
  term ((-140138745041977 : Rat) / 165250894662) [(0, 1), (6, 1), (12, 1), (14, 1), (15, 2)],
  term ((140138745041977 : Rat) / 330501789324) [(0, 2), (6, 1), (12, 1), (15, 2)],
  term ((-140138745041977 : Rat) / 165250894662) [(1, 1), (6, 1), (12, 1), (15, 3)],
  term ((140138745041977 : Rat) / 330501789324) [(1, 2), (6, 1), (12, 1), (15, 2)],
  term ((140138745041977 : Rat) / 165250894662) [(6, 1), (12, 1), (14, 1), (15, 2)],
  term ((-140138745041977 : Rat) / 330501789324) [(6, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 305 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0305_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0305
        rs_R009_ueqv_R009YNNNN_generator_28_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_28_0305 := by
  native_decide

/-- Coefficient term 306 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0306 : Poly :=
[
  term ((-247 : Rat) / 63) [(6, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 306 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0306 : Poly :=
[
  term ((494 : Rat) / 63) [(0, 1), (6, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-247 : Rat) / 63) [(0, 2), (6, 1), (12, 1), (15, 2), (16, 1)],
  term ((494 : Rat) / 63) [(1, 1), (6, 1), (12, 1), (15, 3), (16, 1)],
  term ((-247 : Rat) / 63) [(1, 2), (6, 1), (12, 1), (15, 2), (16, 1)],
  term ((-494 : Rat) / 63) [(6, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((247 : Rat) / 63) [(6, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 306 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0306_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0306
        rs_R009_ueqv_R009YNNNN_generator_28_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_28_0306 := by
  native_decide

/-- Coefficient term 307 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0307 : Poly :=
[
  term ((28425155928161 : Rat) / 483511876974) [(6, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 307 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0307 : Poly :=
[
  term ((-28425155928161 : Rat) / 241755938487) [(0, 1), (6, 1), (13, 1), (14, 2), (15, 1)],
  term ((28425155928161 : Rat) / 483511876974) [(0, 2), (6, 1), (13, 1), (14, 1), (15, 1)],
  term ((-28425155928161 : Rat) / 241755938487) [(1, 1), (6, 1), (13, 1), (14, 1), (15, 2)],
  term ((28425155928161 : Rat) / 483511876974) [(1, 2), (6, 1), (13, 1), (14, 1), (15, 1)],
  term ((-28425155928161 : Rat) / 483511876974) [(6, 1), (13, 1), (14, 1), (15, 1)],
  term ((28425155928161 : Rat) / 241755938487) [(6, 1), (13, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 307 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0307_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0307
        rs_R009_ueqv_R009YNNNN_generator_28_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_28_0307 := by
  native_decide

/-- Coefficient term 308 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0308 : Poly :=
[
  term ((27003763829248933 : Rat) / 13054820678298) [(6, 1), (13, 1), (15, 1)]
]

/-- Partial product 308 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0308 : Poly :=
[
  term ((-27003763829248933 : Rat) / 6527410339149) [(0, 1), (6, 1), (13, 1), (14, 1), (15, 1)],
  term ((27003763829248933 : Rat) / 13054820678298) [(0, 2), (6, 1), (13, 1), (15, 1)],
  term ((-27003763829248933 : Rat) / 6527410339149) [(1, 1), (6, 1), (13, 1), (15, 2)],
  term ((27003763829248933 : Rat) / 13054820678298) [(1, 2), (6, 1), (13, 1), (15, 1)],
  term ((27003763829248933 : Rat) / 6527410339149) [(6, 1), (13, 1), (14, 1), (15, 1)],
  term ((-27003763829248933 : Rat) / 13054820678298) [(6, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 308 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0308_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0308
        rs_R009_ueqv_R009YNNNN_generator_28_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_28_0308 := by
  native_decide

/-- Coefficient term 309 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0309 : Poly :=
[
  term ((-289 : Rat) / 28) [(6, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 309 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0309 : Poly :=
[
  term ((289 : Rat) / 14) [(0, 1), (6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-289 : Rat) / 28) [(0, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((289 : Rat) / 14) [(1, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((-289 : Rat) / 28) [(1, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-289 : Rat) / 14) [(6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((289 : Rat) / 28) [(6, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 309 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0309_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0309
        rs_R009_ueqv_R009YNNNN_generator_28_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_28_0309 := by
  native_decide

/-- Coefficient term 310 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0310 : Poly :=
[
  term ((-941242657 : Rat) / 166541592) [(6, 1), (13, 2)]
]

/-- Partial product 310 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0310 : Poly :=
[
  term ((941242657 : Rat) / 83270796) [(0, 1), (6, 1), (13, 2), (14, 1)],
  term ((-941242657 : Rat) / 166541592) [(0, 2), (6, 1), (13, 2)],
  term ((941242657 : Rat) / 83270796) [(1, 1), (6, 1), (13, 2), (15, 1)],
  term ((-941242657 : Rat) / 166541592) [(1, 2), (6, 1), (13, 2)],
  term ((941242657 : Rat) / 166541592) [(6, 1), (13, 2)],
  term ((-941242657 : Rat) / 83270796) [(6, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 310 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0310_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0310
        rs_R009_ueqv_R009YNNNN_generator_28_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_28_0310 := by
  native_decide

/-- Coefficient term 311 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0311 : Poly :=
[
  term ((-725 : Rat) / 84) [(6, 1), (13, 2), (16, 1)]
]

/-- Partial product 311 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0311 : Poly :=
[
  term ((725 : Rat) / 42) [(0, 1), (6, 1), (13, 2), (14, 1), (16, 1)],
  term ((-725 : Rat) / 84) [(0, 2), (6, 1), (13, 2), (16, 1)],
  term ((725 : Rat) / 42) [(1, 1), (6, 1), (13, 2), (15, 1), (16, 1)],
  term ((-725 : Rat) / 84) [(1, 2), (6, 1), (13, 2), (16, 1)],
  term ((-725 : Rat) / 42) [(6, 1), (13, 2), (14, 1), (16, 1)],
  term ((725 : Rat) / 84) [(6, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 311 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0311_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0311
        rs_R009_ueqv_R009YNNNN_generator_28_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_28_0311 := by
  native_decide

/-- Coefficient term 312 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0312 : Poly :=
[
  term ((-3021914984422465 : Rat) / 5802142523688) [(6, 1), (14, 1)]
]

/-- Partial product 312 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0312 : Poly :=
[
  term ((3021914984422465 : Rat) / 2901071261844) [(0, 1), (6, 1), (14, 2)],
  term ((-3021914984422465 : Rat) / 5802142523688) [(0, 2), (6, 1), (14, 1)],
  term ((3021914984422465 : Rat) / 2901071261844) [(1, 1), (6, 1), (14, 1), (15, 1)],
  term ((-3021914984422465 : Rat) / 5802142523688) [(1, 2), (6, 1), (14, 1)],
  term ((3021914984422465 : Rat) / 5802142523688) [(6, 1), (14, 1)],
  term ((-3021914984422465 : Rat) / 2901071261844) [(6, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 312 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0312_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0312
        rs_R009_ueqv_R009YNNNN_generator_28_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_28_0312 := by
  native_decide

/-- Coefficient term 313 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0313 : Poly :=
[
  term ((4596599348427 : Rat) / 26861770943) [(6, 1), (14, 1), (15, 2)]
]

/-- Partial product 313 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0313 : Poly :=
[
  term ((-9193198696854 : Rat) / 26861770943) [(0, 1), (6, 1), (14, 2), (15, 2)],
  term ((4596599348427 : Rat) / 26861770943) [(0, 2), (6, 1), (14, 1), (15, 2)],
  term ((-9193198696854 : Rat) / 26861770943) [(1, 1), (6, 1), (14, 1), (15, 3)],
  term ((4596599348427 : Rat) / 26861770943) [(1, 2), (6, 1), (14, 1), (15, 2)],
  term ((-4596599348427 : Rat) / 26861770943) [(6, 1), (14, 1), (15, 2)],
  term ((9193198696854 : Rat) / 26861770943) [(6, 1), (14, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 313 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0313_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0313
        rs_R009_ueqv_R009YNNNN_generator_28_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_28_0313 := by
  native_decide

/-- Coefficient term 314 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0314 : Poly :=
[
  term ((28425155928161 : Rat) / 967023753948) [(6, 1), (14, 2)]
]

/-- Partial product 314 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0314 : Poly :=
[
  term ((-28425155928161 : Rat) / 483511876974) [(0, 1), (6, 1), (14, 3)],
  term ((28425155928161 : Rat) / 967023753948) [(0, 2), (6, 1), (14, 2)],
  term ((-28425155928161 : Rat) / 483511876974) [(1, 1), (6, 1), (14, 2), (15, 1)],
  term ((28425155928161 : Rat) / 967023753948) [(1, 2), (6, 1), (14, 2)],
  term ((-28425155928161 : Rat) / 967023753948) [(6, 1), (14, 2)],
  term ((28425155928161 : Rat) / 483511876974) [(6, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 314 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0314_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0314
        rs_R009_ueqv_R009YNNNN_generator_28_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_28_0314 := by
  native_decide

/-- Coefficient term 315 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0315 : Poly :=
[
  term ((-6909224935385495 : Rat) / 4351606892766) [(6, 1), (15, 2)]
]

/-- Partial product 315 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0315 : Poly :=
[
  term ((6909224935385495 : Rat) / 2175803446383) [(0, 1), (6, 1), (14, 1), (15, 2)],
  term ((-6909224935385495 : Rat) / 4351606892766) [(0, 2), (6, 1), (15, 2)],
  term ((6909224935385495 : Rat) / 2175803446383) [(1, 1), (6, 1), (15, 3)],
  term ((-6909224935385495 : Rat) / 4351606892766) [(1, 2), (6, 1), (15, 2)],
  term ((-6909224935385495 : Rat) / 2175803446383) [(6, 1), (14, 1), (15, 2)],
  term ((6909224935385495 : Rat) / 4351606892766) [(6, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 315 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0315_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0315
        rs_R009_ueqv_R009YNNNN_generator_28_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_28_0315 := by
  native_decide

/-- Coefficient term 316 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0316 : Poly :=
[
  term ((247 : Rat) / 21) [(6, 1), (15, 2), (16, 1)]
]

/-- Partial product 316 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0316 : Poly :=
[
  term ((-494 : Rat) / 21) [(0, 1), (6, 1), (14, 1), (15, 2), (16, 1)],
  term ((247 : Rat) / 21) [(0, 2), (6, 1), (15, 2), (16, 1)],
  term ((-494 : Rat) / 21) [(1, 1), (6, 1), (15, 3), (16, 1)],
  term ((247 : Rat) / 21) [(1, 2), (6, 1), (15, 2), (16, 1)],
  term ((494 : Rat) / 21) [(6, 1), (14, 1), (15, 2), (16, 1)],
  term ((-247 : Rat) / 21) [(6, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 316 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0316_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0316
        rs_R009_ueqv_R009YNNNN_generator_28_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_28_0316 := by
  native_decide

/-- Coefficient term 317 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0317 : Poly :=
[
  term ((-107532017845456895 : Rat) / 313315696279152) [(7, 1), (9, 1)]
]

/-- Partial product 317 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0317 : Poly :=
[
  term ((107532017845456895 : Rat) / 156657848139576) [(0, 1), (7, 1), (9, 1), (14, 1)],
  term ((-107532017845456895 : Rat) / 313315696279152) [(0, 2), (7, 1), (9, 1)],
  term ((107532017845456895 : Rat) / 156657848139576) [(1, 1), (7, 1), (9, 1), (15, 1)],
  term ((-107532017845456895 : Rat) / 313315696279152) [(1, 2), (7, 1), (9, 1)],
  term ((107532017845456895 : Rat) / 313315696279152) [(7, 1), (9, 1)],
  term ((-107532017845456895 : Rat) / 156657848139576) [(7, 1), (9, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 317 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0317_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0317
        rs_R009_ueqv_R009YNNNN_generator_28_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_28_0317 := by
  native_decide

/-- Coefficient term 318 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0318 : Poly :=
[
  term ((12175190713465 : Rat) / 80939213712) [(7, 1), (9, 1), (10, 1)]
]

/-- Partial product 318 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0318 : Poly :=
[
  term ((-12175190713465 : Rat) / 40469606856) [(0, 1), (7, 1), (9, 1), (10, 1), (14, 1)],
  term ((12175190713465 : Rat) / 80939213712) [(0, 2), (7, 1), (9, 1), (10, 1)],
  term ((-12175190713465 : Rat) / 40469606856) [(1, 1), (7, 1), (9, 1), (10, 1), (15, 1)],
  term ((12175190713465 : Rat) / 80939213712) [(1, 2), (7, 1), (9, 1), (10, 1)],
  term ((-12175190713465 : Rat) / 80939213712) [(7, 1), (9, 1), (10, 1)],
  term ((12175190713465 : Rat) / 40469606856) [(7, 1), (9, 1), (10, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 318 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0318_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0318
        rs_R009_ueqv_R009YNNNN_generator_28_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_28_0318 := by
  native_decide

/-- Coefficient term 319 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0319 : Poly :=
[
  term ((3849005354029 : Rat) / 2578730010528) [(7, 1), (9, 1), (12, 1)]
]

/-- Partial product 319 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0319 : Poly :=
[
  term ((-3849005354029 : Rat) / 1289365005264) [(0, 1), (7, 1), (9, 1), (12, 1), (14, 1)],
  term ((3849005354029 : Rat) / 2578730010528) [(0, 2), (7, 1), (9, 1), (12, 1)],
  term ((-3849005354029 : Rat) / 1289365005264) [(1, 1), (7, 1), (9, 1), (12, 1), (15, 1)],
  term ((3849005354029 : Rat) / 2578730010528) [(1, 2), (7, 1), (9, 1), (12, 1)],
  term ((-3849005354029 : Rat) / 2578730010528) [(7, 1), (9, 1), (12, 1)],
  term ((3849005354029 : Rat) / 1289365005264) [(7, 1), (9, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 319 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0319_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0319
        rs_R009_ueqv_R009YNNNN_generator_28_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_28_0319 := by
  native_decide

/-- Coefficient term 320 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0320 : Poly :=
[
  term ((-53777198303881 : Rat) / 80939213712) [(7, 1), (9, 1), (12, 1), (14, 1)]
]

/-- Partial product 320 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0320 : Poly :=
[
  term ((53777198303881 : Rat) / 40469606856) [(0, 1), (7, 1), (9, 1), (12, 1), (14, 2)],
  term ((-53777198303881 : Rat) / 80939213712) [(0, 2), (7, 1), (9, 1), (12, 1), (14, 1)],
  term ((53777198303881 : Rat) / 40469606856) [(1, 1), (7, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-53777198303881 : Rat) / 80939213712) [(1, 2), (7, 1), (9, 1), (12, 1), (14, 1)],
  term ((53777198303881 : Rat) / 80939213712) [(7, 1), (9, 1), (12, 1), (14, 1)],
  term ((-53777198303881 : Rat) / 40469606856) [(7, 1), (9, 1), (12, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 320 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0320_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0320
        rs_R009_ueqv_R009YNNNN_generator_28_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_28_0320 := by
  native_decide

/-- Coefficient term 321 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0321 : Poly :=
[
  term ((206185803715802887 : Rat) / 104438565426384) [(7, 1), (9, 1), (14, 1)]
]

/-- Partial product 321 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0321 : Poly :=
[
  term ((-206185803715802887 : Rat) / 52219282713192) [(0, 1), (7, 1), (9, 1), (14, 2)],
  term ((206185803715802887 : Rat) / 104438565426384) [(0, 2), (7, 1), (9, 1), (14, 1)],
  term ((-206185803715802887 : Rat) / 52219282713192) [(1, 1), (7, 1), (9, 1), (14, 1), (15, 1)],
  term ((206185803715802887 : Rat) / 104438565426384) [(1, 2), (7, 1), (9, 1), (14, 1)],
  term ((-206185803715802887 : Rat) / 104438565426384) [(7, 1), (9, 1), (14, 1)],
  term ((206185803715802887 : Rat) / 52219282713192) [(7, 1), (9, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 321 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0321_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0321
        rs_R009_ueqv_R009YNNNN_generator_28_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_28_0321 := by
  native_decide

/-- Coefficient term 322 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0322 : Poly :=
[
  term ((-5063669429410409 : Rat) / 26109641356596) [(7, 1), (10, 1), (11, 1)]
]

/-- Partial product 322 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0322 : Poly :=
[
  term ((5063669429410409 : Rat) / 13054820678298) [(0, 1), (7, 1), (10, 1), (11, 1), (14, 1)],
  term ((-5063669429410409 : Rat) / 26109641356596) [(0, 2), (7, 1), (10, 1), (11, 1)],
  term ((5063669429410409 : Rat) / 13054820678298) [(1, 1), (7, 1), (10, 1), (11, 1), (15, 1)],
  term ((-5063669429410409 : Rat) / 26109641356596) [(1, 2), (7, 1), (10, 1), (11, 1)],
  term ((5063669429410409 : Rat) / 26109641356596) [(7, 1), (10, 1), (11, 1)],
  term ((-5063669429410409 : Rat) / 13054820678298) [(7, 1), (10, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 322 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0322_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0322
        rs_R009_ueqv_R009YNNNN_generator_28_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_28_0322 := by
  native_decide

/-- Coefficient term 323 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0323 : Poly :=
[
  term ((-568121444666635 : Rat) / 3197098941624) [(7, 1), (10, 1), (13, 1)]
]

/-- Partial product 323 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0323 : Poly :=
[
  term ((568121444666635 : Rat) / 1598549470812) [(0, 1), (7, 1), (10, 1), (13, 1), (14, 1)],
  term ((-568121444666635 : Rat) / 3197098941624) [(0, 2), (7, 1), (10, 1), (13, 1)],
  term ((568121444666635 : Rat) / 1598549470812) [(1, 1), (7, 1), (10, 1), (13, 1), (15, 1)],
  term ((-568121444666635 : Rat) / 3197098941624) [(1, 2), (7, 1), (10, 1), (13, 1)],
  term ((568121444666635 : Rat) / 3197098941624) [(7, 1), (10, 1), (13, 1)],
  term ((-568121444666635 : Rat) / 1598549470812) [(7, 1), (10, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 323 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0323_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0323
        rs_R009_ueqv_R009YNNNN_generator_28_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_28_0323 := by
  native_decide

/-- Coefficient term 324 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0324 : Poly :=
[
  term ((-9545 : Rat) / 252) [(7, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 324 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0324 : Poly :=
[
  term ((9545 : Rat) / 126) [(0, 1), (7, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-9545 : Rat) / 252) [(0, 2), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((9545 : Rat) / 126) [(1, 1), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-9545 : Rat) / 252) [(1, 2), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((-9545 : Rat) / 126) [(7, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((9545 : Rat) / 252) [(7, 1), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 324 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0324_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0324
        rs_R009_ueqv_R009YNNNN_generator_28_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_28_0324 := by
  native_decide

/-- Coefficient term 325 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0325 : Poly :=
[
  term ((27248392831391255 : Rat) / 52219282713192) [(7, 1), (10, 1), (15, 1)]
]

/-- Partial product 325 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0325 : Poly :=
[
  term ((-27248392831391255 : Rat) / 26109641356596) [(0, 1), (7, 1), (10, 1), (14, 1), (15, 1)],
  term ((27248392831391255 : Rat) / 52219282713192) [(0, 2), (7, 1), (10, 1), (15, 1)],
  term ((-27248392831391255 : Rat) / 26109641356596) [(1, 1), (7, 1), (10, 1), (15, 2)],
  term ((27248392831391255 : Rat) / 52219282713192) [(1, 2), (7, 1), (10, 1), (15, 1)],
  term ((27248392831391255 : Rat) / 26109641356596) [(7, 1), (10, 1), (14, 1), (15, 1)],
  term ((-27248392831391255 : Rat) / 52219282713192) [(7, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 325 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0325_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0325
        rs_R009_ueqv_R009YNNNN_generator_28_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_28_0325 := by
  native_decide

/-- Coefficient term 326 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0326 : Poly :=
[
  term ((2069 : Rat) / 63) [(7, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 326 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0326 : Poly :=
[
  term ((-4138 : Rat) / 63) [(0, 1), (7, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((2069 : Rat) / 63) [(0, 2), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-4138 : Rat) / 63) [(1, 1), (7, 1), (10, 1), (15, 2), (16, 1)],
  term ((2069 : Rat) / 63) [(1, 2), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((4138 : Rat) / 63) [(7, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2069 : Rat) / 63) [(7, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 326 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0326_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0326
        rs_R009_ueqv_R009YNNNN_generator_28_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_28_0326 := by
  native_decide

/-- Coefficient term 327 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0327 : Poly :=
[
  term ((-1237216831377703 : Rat) / 5802142523688) [(7, 1), (11, 1)]
]

/-- Partial product 327 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0327 : Poly :=
[
  term ((1237216831377703 : Rat) / 2901071261844) [(0, 1), (7, 1), (11, 1), (14, 1)],
  term ((-1237216831377703 : Rat) / 5802142523688) [(0, 2), (7, 1), (11, 1)],
  term ((1237216831377703 : Rat) / 2901071261844) [(1, 1), (7, 1), (11, 1), (15, 1)],
  term ((-1237216831377703 : Rat) / 5802142523688) [(1, 2), (7, 1), (11, 1)],
  term ((1237216831377703 : Rat) / 5802142523688) [(7, 1), (11, 1)],
  term ((-1237216831377703 : Rat) / 2901071261844) [(7, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 327 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0327_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0327
        rs_R009_ueqv_R009YNNNN_generator_28_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_28_0327 := by
  native_decide

/-- Coefficient term 328 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0328 : Poly :=
[
  term ((166554 : Rat) / 553) [(7, 1), (11, 1), (12, 1)]
]

/-- Partial product 328 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0328 : Poly :=
[
  term ((-333108 : Rat) / 553) [(0, 1), (7, 1), (11, 1), (12, 1), (14, 1)],
  term ((166554 : Rat) / 553) [(0, 2), (7, 1), (11, 1), (12, 1)],
  term ((-333108 : Rat) / 553) [(1, 1), (7, 1), (11, 1), (12, 1), (15, 1)],
  term ((166554 : Rat) / 553) [(1, 2), (7, 1), (11, 1), (12, 1)],
  term ((-166554 : Rat) / 553) [(7, 1), (11, 1), (12, 1)],
  term ((333108 : Rat) / 553) [(7, 1), (11, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 328 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0328_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0328
        rs_R009_ueqv_R009YNNNN_generator_28_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_28_0328 := by
  native_decide

/-- Coefficient term 329 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0329 : Poly :=
[
  term ((353060918012465 : Rat) / 6527410339149) [(7, 1), (11, 1), (12, 1), (14, 1)]
]

/-- Partial product 329 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0329 : Poly :=
[
  term ((-706121836024930 : Rat) / 6527410339149) [(0, 1), (7, 1), (11, 1), (12, 1), (14, 2)],
  term ((353060918012465 : Rat) / 6527410339149) [(0, 2), (7, 1), (11, 1), (12, 1), (14, 1)],
  term ((-706121836024930 : Rat) / 6527410339149) [(1, 1), (7, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((353060918012465 : Rat) / 6527410339149) [(1, 2), (7, 1), (11, 1), (12, 1), (14, 1)],
  term ((-353060918012465 : Rat) / 6527410339149) [(7, 1), (11, 1), (12, 1), (14, 1)],
  term ((706121836024930 : Rat) / 6527410339149) [(7, 1), (11, 1), (12, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 329 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0329_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0329
        rs_R009_ueqv_R009YNNNN_generator_28_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_28_0329 := by
  native_decide

/-- Coefficient term 330 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0330 : Poly :=
[
  term ((76343852153691455 : Rat) / 52219282713192) [(7, 1), (11, 1), (14, 1)]
]

/-- Partial product 330 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0330 : Poly :=
[
  term ((-76343852153691455 : Rat) / 26109641356596) [(0, 1), (7, 1), (11, 1), (14, 2)],
  term ((76343852153691455 : Rat) / 52219282713192) [(0, 2), (7, 1), (11, 1), (14, 1)],
  term ((-76343852153691455 : Rat) / 26109641356596) [(1, 1), (7, 1), (11, 1), (14, 1), (15, 1)],
  term ((76343852153691455 : Rat) / 52219282713192) [(1, 2), (7, 1), (11, 1), (14, 1)],
  term ((-76343852153691455 : Rat) / 52219282713192) [(7, 1), (11, 1), (14, 1)],
  term ((76343852153691455 : Rat) / 26109641356596) [(7, 1), (11, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 330 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0330_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0330
        rs_R009_ueqv_R009YNNNN_generator_28_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_28_0330 := by
  native_decide

/-- Coefficient term 331 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0331 : Poly :=
[
  term ((941242657 : Rat) / 333083184) [(7, 1), (12, 1), (13, 1)]
]

/-- Partial product 331 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0331 : Poly :=
[
  term ((-941242657 : Rat) / 166541592) [(0, 1), (7, 1), (12, 1), (13, 1), (14, 1)],
  term ((941242657 : Rat) / 333083184) [(0, 2), (7, 1), (12, 1), (13, 1)],
  term ((-941242657 : Rat) / 166541592) [(1, 1), (7, 1), (12, 1), (13, 1), (15, 1)],
  term ((941242657 : Rat) / 333083184) [(1, 2), (7, 1), (12, 1), (13, 1)],
  term ((-941242657 : Rat) / 333083184) [(7, 1), (12, 1), (13, 1)],
  term ((941242657 : Rat) / 166541592) [(7, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 331 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0331_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0331
        rs_R009_ueqv_R009YNNNN_generator_28_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_28_0331 := by
  native_decide

/-- Coefficient term 332 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0332 : Poly :=
[
  term ((2224986028928059 : Rat) / 3197098941624) [(7, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 332 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0332 : Poly :=
[
  term ((-2224986028928059 : Rat) / 1598549470812) [(0, 1), (7, 1), (12, 1), (13, 1), (14, 2)],
  term ((2224986028928059 : Rat) / 3197098941624) [(0, 2), (7, 1), (12, 1), (13, 1), (14, 1)],
  term ((-2224986028928059 : Rat) / 1598549470812) [(1, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((2224986028928059 : Rat) / 3197098941624) [(1, 2), (7, 1), (12, 1), (13, 1), (14, 1)],
  term ((-2224986028928059 : Rat) / 3197098941624) [(7, 1), (12, 1), (13, 1), (14, 1)],
  term ((2224986028928059 : Rat) / 1598549470812) [(7, 1), (12, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 332 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0332_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0332
        rs_R009_ueqv_R009YNNNN_generator_28_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_28_0332 := by
  native_decide

/-- Coefficient term 333 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0333 : Poly :=
[
  term ((-1495 : Rat) / 252) [(7, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 333 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0333 : Poly :=
[
  term ((1495 : Rat) / 126) [(0, 1), (7, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((-1495 : Rat) / 252) [(0, 2), (7, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((1495 : Rat) / 126) [(1, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1495 : Rat) / 252) [(1, 2), (7, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((1495 : Rat) / 252) [(7, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1495 : Rat) / 126) [(7, 1), (12, 1), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 333 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0333_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0333
        rs_R009_ueqv_R009YNNNN_generator_28_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_28_0333 := by
  native_decide

/-- Coefficient term 334 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0334 : Poly :=
[
  term ((725 : Rat) / 168) [(7, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 334 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0334 : Poly :=
[
  term ((-725 : Rat) / 84) [(0, 1), (7, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((725 : Rat) / 168) [(0, 2), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((-725 : Rat) / 84) [(1, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((725 : Rat) / 168) [(1, 2), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((725 : Rat) / 84) [(7, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-725 : Rat) / 168) [(7, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 334 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0334_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0334
        rs_R009_ueqv_R009YNNNN_generator_28_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_28_0334 := by
  native_decide

/-- Coefficient term 335 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0335 : Poly :=
[
  term ((-150142660556857 : Rat) / 330501789324) [(7, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 335 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0335 : Poly :=
[
  term ((150142660556857 : Rat) / 165250894662) [(0, 1), (7, 1), (12, 1), (14, 2), (15, 1)],
  term ((-150142660556857 : Rat) / 330501789324) [(0, 2), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((150142660556857 : Rat) / 165250894662) [(1, 1), (7, 1), (12, 1), (14, 1), (15, 2)],
  term ((-150142660556857 : Rat) / 330501789324) [(1, 2), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((150142660556857 : Rat) / 330501789324) [(7, 1), (12, 1), (14, 1), (15, 1)],
  term ((-150142660556857 : Rat) / 165250894662) [(7, 1), (12, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 335 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0335_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0335
        rs_R009_ueqv_R009YNNNN_generator_28_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_28_0335 := by
  native_decide

/-- Coefficient term 336 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0336 : Poly :=
[
  term ((247 : Rat) / 63) [(7, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 336 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0336 : Poly :=
[
  term ((-494 : Rat) / 63) [(0, 1), (7, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((247 : Rat) / 63) [(0, 2), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-494 : Rat) / 63) [(1, 1), (7, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((247 : Rat) / 63) [(1, 2), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-247 : Rat) / 63) [(7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((494 : Rat) / 63) [(7, 1), (12, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 336 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0336_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0336
        rs_R009_ueqv_R009YNNNN_generator_28_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_28_0336 := by
  native_decide

/-- Coefficient term 337 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0337 : Poly :=
[
  term ((1532199782809 : Rat) / 26861770943) [(7, 1), (12, 1), (14, 2), (15, 1)]
]

/-- Partial product 337 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0337 : Poly :=
[
  term ((-3064399565618 : Rat) / 26861770943) [(0, 1), (7, 1), (12, 1), (14, 3), (15, 1)],
  term ((1532199782809 : Rat) / 26861770943) [(0, 2), (7, 1), (12, 1), (14, 2), (15, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(1, 1), (7, 1), (12, 1), (14, 2), (15, 2)],
  term ((1532199782809 : Rat) / 26861770943) [(1, 2), (7, 1), (12, 1), (14, 2), (15, 1)],
  term ((-1532199782809 : Rat) / 26861770943) [(7, 1), (12, 1), (14, 2), (15, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(7, 1), (12, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 337 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0337_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0337
        rs_R009_ueqv_R009YNNNN_generator_28_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_28_0337 := by
  native_decide

/-- Coefficient term 338 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0338 : Poly :=
[
  term ((-148780745730977 : Rat) / 5802142523688) [(7, 1), (12, 1), (15, 1)]
]

/-- Partial product 338 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0338 : Poly :=
[
  term ((148780745730977 : Rat) / 2901071261844) [(0, 1), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((-148780745730977 : Rat) / 5802142523688) [(0, 2), (7, 1), (12, 1), (15, 1)],
  term ((148780745730977 : Rat) / 2901071261844) [(1, 1), (7, 1), (12, 1), (15, 2)],
  term ((-148780745730977 : Rat) / 5802142523688) [(1, 2), (7, 1), (12, 1), (15, 1)],
  term ((-148780745730977 : Rat) / 2901071261844) [(7, 1), (12, 1), (14, 1), (15, 1)],
  term ((148780745730977 : Rat) / 5802142523688) [(7, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 338 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0338_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0338
        rs_R009_ueqv_R009YNNNN_generator_28_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_28_0338 := by
  native_decide

/-- Coefficient term 339 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0339 : Poly :=
[
  term ((-157 : Rat) / 42) [(7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 339 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0339 : Poly :=
[
  term ((157 : Rat) / 21) [(0, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-157 : Rat) / 42) [(0, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((157 : Rat) / 21) [(1, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((-157 : Rat) / 42) [(1, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-157 : Rat) / 21) [(7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((157 : Rat) / 42) [(7, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 339 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0339_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0339
        rs_R009_ueqv_R009YNNNN_generator_28_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_28_0339 := by
  native_decide

/-- Coefficient term 340 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0340 : Poly :=
[
  term ((5968601306100743 : Rat) / 39164462034894) [(7, 1), (13, 1)]
]

/-- Partial product 340 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0340 : Poly :=
[
  term ((-5968601306100743 : Rat) / 19582231017447) [(0, 1), (7, 1), (13, 1), (14, 1)],
  term ((5968601306100743 : Rat) / 39164462034894) [(0, 2), (7, 1), (13, 1)],
  term ((-5968601306100743 : Rat) / 19582231017447) [(1, 1), (7, 1), (13, 1), (15, 1)],
  term ((5968601306100743 : Rat) / 39164462034894) [(1, 2), (7, 1), (13, 1)],
  term ((-5968601306100743 : Rat) / 39164462034894) [(7, 1), (13, 1)],
  term ((5968601306100743 : Rat) / 19582231017447) [(7, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 340 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0340_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0340
        rs_R009_ueqv_R009YNNNN_generator_28_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_28_0340 := by
  native_decide

/-- Coefficient term 341 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0341 : Poly :=
[
  term ((-9782145243569203 : Rat) / 5802142523688) [(7, 1), (13, 1), (14, 1)]
]

/-- Partial product 341 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0341 : Poly :=
[
  term ((9782145243569203 : Rat) / 2901071261844) [(0, 1), (7, 1), (13, 1), (14, 2)],
  term ((-9782145243569203 : Rat) / 5802142523688) [(0, 2), (7, 1), (13, 1), (14, 1)],
  term ((9782145243569203 : Rat) / 2901071261844) [(1, 1), (7, 1), (13, 1), (14, 1), (15, 1)],
  term ((-9782145243569203 : Rat) / 5802142523688) [(1, 2), (7, 1), (13, 1), (14, 1)],
  term ((9782145243569203 : Rat) / 5802142523688) [(7, 1), (13, 1), (14, 1)],
  term ((-9782145243569203 : Rat) / 2901071261844) [(7, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 341 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0341_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0341
        rs_R009_ueqv_R009YNNNN_generator_28_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_28_0341 := by
  native_decide

/-- Coefficient term 342 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0342 : Poly :=
[
  term ((1495 : Rat) / 84) [(7, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 342 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0342 : Poly :=
[
  term ((-1495 : Rat) / 42) [(0, 1), (7, 1), (13, 1), (14, 2), (16, 1)],
  term ((1495 : Rat) / 84) [(0, 2), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1495 : Rat) / 42) [(1, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1495 : Rat) / 84) [(1, 2), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1495 : Rat) / 84) [(7, 1), (13, 1), (14, 1), (16, 1)],
  term ((1495 : Rat) / 42) [(7, 1), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 342 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0342_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0342
        rs_R009_ueqv_R009YNNNN_generator_28_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_28_0342 := by
  native_decide

/-- Coefficient term 343 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0343 : Poly :=
[
  term ((-1532199782809 : Rat) / 53723541886) [(7, 1), (13, 1), (14, 2)]
]

/-- Partial product 343 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0343 : Poly :=
[
  term ((1532199782809 : Rat) / 26861770943) [(0, 1), (7, 1), (13, 1), (14, 3)],
  term ((-1532199782809 : Rat) / 53723541886) [(0, 2), (7, 1), (13, 1), (14, 2)],
  term ((1532199782809 : Rat) / 26861770943) [(1, 1), (7, 1), (13, 1), (14, 2), (15, 1)],
  term ((-1532199782809 : Rat) / 53723541886) [(1, 2), (7, 1), (13, 1), (14, 2)],
  term ((1532199782809 : Rat) / 53723541886) [(7, 1), (13, 1), (14, 2)],
  term ((-1532199782809 : Rat) / 26861770943) [(7, 1), (13, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 343 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0343_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0343
        rs_R009_ueqv_R009YNNNN_generator_28_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_28_0343 := by
  native_decide

/-- Coefficient term 344 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0344 : Poly :=
[
  term ((-1835 : Rat) / 252) [(7, 1), (13, 1), (16, 1)]
]

/-- Partial product 344 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0344 : Poly :=
[
  term ((1835 : Rat) / 126) [(0, 1), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1835 : Rat) / 252) [(0, 2), (7, 1), (13, 1), (16, 1)],
  term ((1835 : Rat) / 126) [(1, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1835 : Rat) / 252) [(1, 2), (7, 1), (13, 1), (16, 1)],
  term ((-1835 : Rat) / 126) [(7, 1), (13, 1), (14, 1), (16, 1)],
  term ((1835 : Rat) / 252) [(7, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 344 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0344_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0344
        rs_R009_ueqv_R009YNNNN_generator_28_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_28_0344 := by
  native_decide

/-- Coefficient term 345 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0345 : Poly :=
[
  term ((14834145445646395 : Rat) / 8703213785532) [(7, 1), (14, 1), (15, 1)]
]

/-- Partial product 345 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0345 : Poly :=
[
  term ((-14834145445646395 : Rat) / 4351606892766) [(0, 1), (7, 1), (14, 2), (15, 1)],
  term ((14834145445646395 : Rat) / 8703213785532) [(0, 2), (7, 1), (14, 1), (15, 1)],
  term ((-14834145445646395 : Rat) / 4351606892766) [(1, 1), (7, 1), (14, 1), (15, 2)],
  term ((14834145445646395 : Rat) / 8703213785532) [(1, 2), (7, 1), (14, 1), (15, 1)],
  term ((-14834145445646395 : Rat) / 8703213785532) [(7, 1), (14, 1), (15, 1)],
  term ((14834145445646395 : Rat) / 4351606892766) [(7, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 345 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0345_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0345
        rs_R009_ueqv_R009YNNNN_generator_28_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_28_0345 := by
  native_decide

/-- Coefficient term 346 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0346 : Poly :=
[
  term ((-247 : Rat) / 21) [(7, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 346 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0346 : Poly :=
[
  term ((494 : Rat) / 21) [(0, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((-247 : Rat) / 21) [(0, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((494 : Rat) / 21) [(1, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((-247 : Rat) / 21) [(1, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((247 : Rat) / 21) [(7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-494 : Rat) / 21) [(7, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 346 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0346_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0346
        rs_R009_ueqv_R009YNNNN_generator_28_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_28_0346 := by
  native_decide

/-- Coefficient term 347 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0347 : Poly :=
[
  term ((-4596599348427 : Rat) / 26861770943) [(7, 1), (14, 2), (15, 1)]
]

/-- Partial product 347 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0347 : Poly :=
[
  term ((9193198696854 : Rat) / 26861770943) [(0, 1), (7, 1), (14, 3), (15, 1)],
  term ((-4596599348427 : Rat) / 26861770943) [(0, 2), (7, 1), (14, 2), (15, 1)],
  term ((9193198696854 : Rat) / 26861770943) [(1, 1), (7, 1), (14, 2), (15, 2)],
  term ((-4596599348427 : Rat) / 26861770943) [(1, 2), (7, 1), (14, 2), (15, 1)],
  term ((4596599348427 : Rat) / 26861770943) [(7, 1), (14, 2), (15, 1)],
  term ((-9193198696854 : Rat) / 26861770943) [(7, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 347 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0347_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0347
        rs_R009_ueqv_R009YNNNN_generator_28_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_28_0347 := by
  native_decide

/-- Coefficient term 348 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0348 : Poly :=
[
  term ((-8724500552915153 : Rat) / 8703213785532) [(7, 1), (15, 1)]
]

/-- Partial product 348 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0348 : Poly :=
[
  term ((8724500552915153 : Rat) / 4351606892766) [(0, 1), (7, 1), (14, 1), (15, 1)],
  term ((-8724500552915153 : Rat) / 8703213785532) [(0, 2), (7, 1), (15, 1)],
  term ((8724500552915153 : Rat) / 4351606892766) [(1, 1), (7, 1), (15, 2)],
  term ((-8724500552915153 : Rat) / 8703213785532) [(1, 2), (7, 1), (15, 1)],
  term ((-8724500552915153 : Rat) / 4351606892766) [(7, 1), (14, 1), (15, 1)],
  term ((8724500552915153 : Rat) / 8703213785532) [(7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 348 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0348_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0348
        rs_R009_ueqv_R009YNNNN_generator_28_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_28_0348 := by
  native_decide

/-- Coefficient term 349 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0349 : Poly :=
[
  term ((359 : Rat) / 63) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 349 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0349 : Poly :=
[
  term ((-718 : Rat) / 63) [(0, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((359 : Rat) / 63) [(0, 2), (7, 1), (15, 1), (16, 1)],
  term ((-718 : Rat) / 63) [(1, 1), (7, 1), (15, 2), (16, 1)],
  term ((359 : Rat) / 63) [(1, 2), (7, 1), (15, 1), (16, 1)],
  term ((718 : Rat) / 63) [(7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-359 : Rat) / 63) [(7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 349 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0349_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0349
        rs_R009_ueqv_R009YNNNN_generator_28_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_28_0349 := by
  native_decide

/-- Coefficient term 350 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0350 : Poly :=
[
  term ((4593534948861382 : Rat) / 6527410339149) [(7, 2)]
]

/-- Partial product 350 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0350 : Poly :=
[
  term ((-9187069897722764 : Rat) / 6527410339149) [(0, 1), (7, 2), (14, 1)],
  term ((4593534948861382 : Rat) / 6527410339149) [(0, 2), (7, 2)],
  term ((-9187069897722764 : Rat) / 6527410339149) [(1, 1), (7, 2), (15, 1)],
  term ((4593534948861382 : Rat) / 6527410339149) [(1, 2), (7, 2)],
  term ((-4593534948861382 : Rat) / 6527410339149) [(7, 2)],
  term ((9187069897722764 : Rat) / 6527410339149) [(7, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 350 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0350_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0350
        rs_R009_ueqv_R009YNNNN_generator_28_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_28_0350 := by
  native_decide

/-- Coefficient term 351 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0351 : Poly :=
[
  term ((-1349868008654729 : Rat) / 26109641356596) [(7, 2), (10, 1)]
]

/-- Partial product 351 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0351 : Poly :=
[
  term ((1349868008654729 : Rat) / 13054820678298) [(0, 1), (7, 2), (10, 1), (14, 1)],
  term ((-1349868008654729 : Rat) / 26109641356596) [(0, 2), (7, 2), (10, 1)],
  term ((1349868008654729 : Rat) / 13054820678298) [(1, 1), (7, 2), (10, 1), (15, 1)],
  term ((-1349868008654729 : Rat) / 26109641356596) [(1, 2), (7, 2), (10, 1)],
  term ((1349868008654729 : Rat) / 26109641356596) [(7, 2), (10, 1)],
  term ((-1349868008654729 : Rat) / 13054820678298) [(7, 2), (10, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 351 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0351_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0351
        rs_R009_ueqv_R009YNNNN_generator_28_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_28_0351 := by
  native_decide

/-- Coefficient term 352 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0352 : Poly :=
[
  term ((1532199782809 : Rat) / 322341251316) [(7, 2), (12, 1)]
]

/-- Partial product 352 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0352 : Poly :=
[
  term ((-1532199782809 : Rat) / 161170625658) [(0, 1), (7, 2), (12, 1), (14, 1)],
  term ((1532199782809 : Rat) / 322341251316) [(0, 2), (7, 2), (12, 1)],
  term ((-1532199782809 : Rat) / 161170625658) [(1, 1), (7, 2), (12, 1), (15, 1)],
  term ((1532199782809 : Rat) / 322341251316) [(1, 2), (7, 2), (12, 1)],
  term ((-1532199782809 : Rat) / 322341251316) [(7, 2), (12, 1)],
  term ((1532199782809 : Rat) / 161170625658) [(7, 2), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 352 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0352_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0352
        rs_R009_ueqv_R009YNNNN_generator_28_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_28_0352 := by
  native_decide

/-- Coefficient term 353 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0353 : Poly :=
[
  term ((4349915183394751 : Rat) / 13054820678298) [(7, 2), (12, 1), (14, 1)]
]

/-- Partial product 353 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0353 : Poly :=
[
  term ((-4349915183394751 : Rat) / 6527410339149) [(0, 1), (7, 2), (12, 1), (14, 2)],
  term ((4349915183394751 : Rat) / 13054820678298) [(0, 2), (7, 2), (12, 1), (14, 1)],
  term ((-4349915183394751 : Rat) / 6527410339149) [(1, 1), (7, 2), (12, 1), (14, 1), (15, 1)],
  term ((4349915183394751 : Rat) / 13054820678298) [(1, 2), (7, 2), (12, 1), (14, 1)],
  term ((-4349915183394751 : Rat) / 13054820678298) [(7, 2), (12, 1), (14, 1)],
  term ((4349915183394751 : Rat) / 6527410339149) [(7, 2), (12, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 353 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0353_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0353
        rs_R009_ueqv_R009YNNNN_generator_28_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_28_0353 := by
  native_decide

/-- Coefficient term 354 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0354 : Poly :=
[
  term ((-4349915183394751 : Rat) / 4351606892766) [(7, 2), (14, 1)]
]

/-- Partial product 354 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0354 : Poly :=
[
  term ((4349915183394751 : Rat) / 2175803446383) [(0, 1), (7, 2), (14, 2)],
  term ((-4349915183394751 : Rat) / 4351606892766) [(0, 2), (7, 2), (14, 1)],
  term ((4349915183394751 : Rat) / 2175803446383) [(1, 1), (7, 2), (14, 1), (15, 1)],
  term ((-4349915183394751 : Rat) / 4351606892766) [(1, 2), (7, 2), (14, 1)],
  term ((4349915183394751 : Rat) / 4351606892766) [(7, 2), (14, 1)],
  term ((-4349915183394751 : Rat) / 2175803446383) [(7, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 354 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0354_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0354
        rs_R009_ueqv_R009YNNNN_generator_28_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_28_0354 := by
  native_decide

/-- Coefficient term 355 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0355 : Poly :=
[
  term ((-8367496511569 : Rat) / 26313571536) [(9, 1), (10, 1), (11, 1)]
]

/-- Partial product 355 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0355 : Poly :=
[
  term ((8367496511569 : Rat) / 13156785768) [(0, 1), (9, 1), (10, 1), (11, 1), (14, 1)],
  term ((-8367496511569 : Rat) / 26313571536) [(0, 2), (9, 1), (10, 1), (11, 1)],
  term ((8367496511569 : Rat) / 13156785768) [(1, 1), (9, 1), (10, 1), (11, 1), (15, 1)],
  term ((-8367496511569 : Rat) / 26313571536) [(1, 2), (9, 1), (10, 1), (11, 1)],
  term ((8367496511569 : Rat) / 26313571536) [(9, 1), (10, 1), (11, 1)],
  term ((-8367496511569 : Rat) / 13156785768) [(9, 1), (10, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 355 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0355_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0355
        rs_R009_ueqv_R009YNNNN_generator_28_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_28_0355 := by
  native_decide

/-- Coefficient term 356 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0356 : Poly :=
[
  term ((4992 : Rat) / 553) [(9, 1), (10, 1), (11, 1), (12, 1)]
]

/-- Partial product 356 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0356 : Poly :=
[
  term ((-9984 : Rat) / 553) [(0, 1), (9, 1), (10, 1), (11, 1), (12, 1), (14, 1)],
  term ((4992 : Rat) / 553) [(0, 2), (9, 1), (10, 1), (11, 1), (12, 1)],
  term ((-9984 : Rat) / 553) [(1, 1), (9, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((4992 : Rat) / 553) [(1, 2), (9, 1), (10, 1), (11, 1), (12, 1)],
  term ((-4992 : Rat) / 553) [(9, 1), (10, 1), (11, 1), (12, 1)],
  term ((9984 : Rat) / 553) [(9, 1), (10, 1), (11, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 356 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0356_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0356
        rs_R009_ueqv_R009YNNNN_generator_28_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_28_0356 := by
  native_decide

/-- Coefficient term 357 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0357 : Poly :=
[
  term ((29952 : Rat) / 553) [(9, 1), (10, 1), (11, 1), (14, 1)]
]

/-- Partial product 357 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0357 : Poly :=
[
  term ((-59904 : Rat) / 553) [(0, 1), (9, 1), (10, 1), (11, 1), (14, 2)],
  term ((29952 : Rat) / 553) [(0, 2), (9, 1), (10, 1), (11, 1), (14, 1)],
  term ((-59904 : Rat) / 553) [(1, 1), (9, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((29952 : Rat) / 553) [(1, 2), (9, 1), (10, 1), (11, 1), (14, 1)],
  term ((-29952 : Rat) / 553) [(9, 1), (10, 1), (11, 1), (14, 1)],
  term ((59904 : Rat) / 553) [(9, 1), (10, 1), (11, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 357 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0357_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0357
        rs_R009_ueqv_R009YNNNN_generator_28_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_28_0357 := by
  native_decide

/-- Coefficient term 358 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0358 : Poly :=
[
  term ((-6090608323475 : Rat) / 532849823604) [(9, 1), (10, 1), (12, 1), (13, 1)]
]

/-- Partial product 358 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0358 : Poly :=
[
  term ((6090608323475 : Rat) / 266424911802) [(0, 1), (9, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((-6090608323475 : Rat) / 532849823604) [(0, 2), (9, 1), (10, 1), (12, 1), (13, 1)],
  term ((6090608323475 : Rat) / 266424911802) [(1, 1), (9, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((-6090608323475 : Rat) / 532849823604) [(1, 2), (9, 1), (10, 1), (12, 1), (13, 1)],
  term ((6090608323475 : Rat) / 532849823604) [(9, 1), (10, 1), (12, 1), (13, 1)],
  term ((-6090608323475 : Rat) / 266424911802) [(9, 1), (10, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 358 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0358_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0358
        rs_R009_ueqv_R009YNNNN_generator_28_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_28_0358 := by
  native_decide

/-- Coefficient term 359 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0359 : Poly :=
[
  term ((5 : Rat) / 6) [(9, 1), (10, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 359 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0359 : Poly :=
[
  term ((-5 : Rat) / 3) [(0, 1), (9, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((5 : Rat) / 6) [(0, 2), (9, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-5 : Rat) / 3) [(1, 1), (9, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((5 : Rat) / 6) [(1, 2), (9, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((5 : Rat) / 3) [(9, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-5 : Rat) / 6) [(9, 1), (10, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 359 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0359_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0359
        rs_R009_ueqv_R009YNNNN_generator_28_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_28_0359 := by
  native_decide

/-- Coefficient term 360 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0360 : Poly :=
[
  term ((30188368622915 : Rat) / 355233215736) [(9, 1), (10, 1), (12, 1), (15, 1)]
]

/-- Partial product 360 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0360 : Poly :=
[
  term ((-30188368622915 : Rat) / 177616607868) [(0, 1), (9, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((30188368622915 : Rat) / 355233215736) [(0, 2), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((-30188368622915 : Rat) / 177616607868) [(1, 1), (9, 1), (10, 1), (12, 1), (15, 2)],
  term ((30188368622915 : Rat) / 355233215736) [(1, 2), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((30188368622915 : Rat) / 177616607868) [(9, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((-30188368622915 : Rat) / 355233215736) [(9, 1), (10, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 360 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0360_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0360
        rs_R009_ueqv_R009YNNNN_generator_28_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_28_0360 := by
  native_decide

/-- Coefficient term 361 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0361 : Poly :=
[
  term ((-16 : Rat) / 21) [(9, 1), (10, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 361 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0361 : Poly :=
[
  term ((32 : Rat) / 21) [(0, 1), (9, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-16 : Rat) / 21) [(0, 2), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((32 : Rat) / 21) [(1, 1), (9, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-16 : Rat) / 21) [(1, 2), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-32 : Rat) / 21) [(9, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((16 : Rat) / 21) [(9, 1), (10, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 361 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0361_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0361
        rs_R009_ueqv_R009YNNNN_generator_28_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_28_0361 := by
  native_decide

/-- Coefficient term 362 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0362 : Poly :=
[
  term ((30905832934531 : Rat) / 355233215736) [(9, 1), (10, 1), (13, 1)]
]

/-- Partial product 362 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0362 : Poly :=
[
  term ((-30905832934531 : Rat) / 177616607868) [(0, 1), (9, 1), (10, 1), (13, 1), (14, 1)],
  term ((30905832934531 : Rat) / 355233215736) [(0, 2), (9, 1), (10, 1), (13, 1)],
  term ((-30905832934531 : Rat) / 177616607868) [(1, 1), (9, 1), (10, 1), (13, 1), (15, 1)],
  term ((30905832934531 : Rat) / 355233215736) [(1, 2), (9, 1), (10, 1), (13, 1)],
  term ((-30905832934531 : Rat) / 355233215736) [(9, 1), (10, 1), (13, 1)],
  term ((30905832934531 : Rat) / 177616607868) [(9, 1), (10, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 362 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0362_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0362
        rs_R009_ueqv_R009YNNNN_generator_28_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_28_0362 := by
  native_decide

/-- Coefficient term 363 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0363 : Poly :=
[
  term ((8926828802611 : Rat) / 532849823604) [(9, 1), (10, 1), (13, 1), (14, 1)]
]

/-- Partial product 363 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0363 : Poly :=
[
  term ((-8926828802611 : Rat) / 266424911802) [(0, 1), (9, 1), (10, 1), (13, 1), (14, 2)],
  term ((8926828802611 : Rat) / 532849823604) [(0, 2), (9, 1), (10, 1), (13, 1), (14, 1)],
  term ((-8926828802611 : Rat) / 266424911802) [(1, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((8926828802611 : Rat) / 532849823604) [(1, 2), (9, 1), (10, 1), (13, 1), (14, 1)],
  term ((-8926828802611 : Rat) / 532849823604) [(9, 1), (10, 1), (13, 1), (14, 1)],
  term ((8926828802611 : Rat) / 266424911802) [(9, 1), (10, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 363 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0363_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0363
        rs_R009_ueqv_R009YNNNN_generator_28_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_28_0363 := by
  native_decide

/-- Coefficient term 364 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0364 : Poly :=
[
  term ((55 : Rat) / 28) [(9, 1), (10, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 364 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0364 : Poly :=
[
  term ((-55 : Rat) / 14) [(0, 1), (9, 1), (10, 1), (13, 1), (14, 2), (16, 1)],
  term ((55 : Rat) / 28) [(0, 2), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-55 : Rat) / 14) [(1, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((55 : Rat) / 28) [(1, 2), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-55 : Rat) / 28) [(9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((55 : Rat) / 14) [(9, 1), (10, 1), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 364 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0364_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0364
        rs_R009_ueqv_R009YNNNN_generator_28_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_28_0364 := by
  native_decide

/-- Coefficient term 365 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0365 : Poly :=
[
  term ((-1735 : Rat) / 168) [(9, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 365 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0365 : Poly :=
[
  term ((1735 : Rat) / 84) [(0, 1), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1735 : Rat) / 168) [(0, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((1735 : Rat) / 84) [(1, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1735 : Rat) / 168) [(1, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-1735 : Rat) / 84) [(9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((1735 : Rat) / 168) [(9, 1), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 365 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0365_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0365
        rs_R009_ueqv_R009YNNNN_generator_28_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_28_0365 := by
  native_decide

/-- Coefficient term 366 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0366 : Poly :=
[
  term ((-170525183774905 : Rat) / 710466431472) [(9, 1), (10, 1), (14, 1), (15, 1)]
]

/-- Partial product 366 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0366 : Poly :=
[
  term ((170525183774905 : Rat) / 355233215736) [(0, 1), (9, 1), (10, 1), (14, 2), (15, 1)],
  term ((-170525183774905 : Rat) / 710466431472) [(0, 2), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((170525183774905 : Rat) / 355233215736) [(1, 1), (9, 1), (10, 1), (14, 1), (15, 2)],
  term ((-170525183774905 : Rat) / 710466431472) [(1, 2), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((170525183774905 : Rat) / 710466431472) [(9, 1), (10, 1), (14, 1), (15, 1)],
  term ((-170525183774905 : Rat) / 355233215736) [(9, 1), (10, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 366 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0366_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0366
        rs_R009_ueqv_R009YNNNN_generator_28_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_28_0366 := by
  native_decide

/-- Coefficient term 367 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0367 : Poly :=
[
  term ((-11 : Rat) / 7) [(9, 1), (10, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 367 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0367 : Poly :=
[
  term ((22 : Rat) / 7) [(0, 1), (9, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((-11 : Rat) / 7) [(0, 2), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((22 : Rat) / 7) [(1, 1), (9, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-11 : Rat) / 7) [(1, 2), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((11 : Rat) / 7) [(9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-22 : Rat) / 7) [(9, 1), (10, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 367 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0367_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0367
        rs_R009_ueqv_R009YNNNN_generator_28_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_28_0367 := by
  native_decide

/-- Coefficient term 368 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0368 : Poly :=
[
  term ((-8023330184610151 : Rat) / 8525597177664) [(9, 1), (10, 1), (15, 1)]
]

/-- Partial product 368 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0368 : Poly :=
[
  term ((8023330184610151 : Rat) / 4262798588832) [(0, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((-8023330184610151 : Rat) / 8525597177664) [(0, 2), (9, 1), (10, 1), (15, 1)],
  term ((8023330184610151 : Rat) / 4262798588832) [(1, 1), (9, 1), (10, 1), (15, 2)],
  term ((-8023330184610151 : Rat) / 8525597177664) [(1, 2), (9, 1), (10, 1), (15, 1)],
  term ((-8023330184610151 : Rat) / 4262798588832) [(9, 1), (10, 1), (14, 1), (15, 1)],
  term ((8023330184610151 : Rat) / 8525597177664) [(9, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 368 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0368_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0368
        rs_R009_ueqv_R009YNNNN_generator_28_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_28_0368 := by
  native_decide

/-- Coefficient term 369 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0369 : Poly :=
[
  term ((373 : Rat) / 42) [(9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 369 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0369 : Poly :=
[
  term ((-373 : Rat) / 21) [(0, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((373 : Rat) / 42) [(0, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-373 : Rat) / 21) [(1, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((373 : Rat) / 42) [(1, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((373 : Rat) / 21) [(9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-373 : Rat) / 42) [(9, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 369 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0369_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0369
        rs_R009_ueqv_R009YNNNN_generator_28_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_28_0369 := by
  native_decide

/-- Coefficient term 370 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0370 : Poly :=
[
  term ((-25887226544513275 : Rat) / 25576791532992) [(9, 1), (11, 1)]
]

/-- Partial product 370 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0370 : Poly :=
[
  term ((25887226544513275 : Rat) / 12788395766496) [(0, 1), (9, 1), (11, 1), (14, 1)],
  term ((-25887226544513275 : Rat) / 25576791532992) [(0, 2), (9, 1), (11, 1)],
  term ((25887226544513275 : Rat) / 12788395766496) [(1, 1), (9, 1), (11, 1), (15, 1)],
  term ((-25887226544513275 : Rat) / 25576791532992) [(1, 2), (9, 1), (11, 1)],
  term ((25887226544513275 : Rat) / 25576791532992) [(9, 1), (11, 1)],
  term ((-25887226544513275 : Rat) / 12788395766496) [(9, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 370 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0370_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0370
        rs_R009_ueqv_R009YNNNN_generator_28_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_28_0370 := by
  native_decide

/-- Coefficient term 371 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0371 : Poly :=
[
  term ((-16612902868000 : Rat) / 133212455901) [(9, 1), (11, 1), (12, 1)]
]

/-- Partial product 371 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0371 : Poly :=
[
  term ((33225805736000 : Rat) / 133212455901) [(0, 1), (9, 1), (11, 1), (12, 1), (14, 1)],
  term ((-16612902868000 : Rat) / 133212455901) [(0, 2), (9, 1), (11, 1), (12, 1)],
  term ((33225805736000 : Rat) / 133212455901) [(1, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((-16612902868000 : Rat) / 133212455901) [(1, 2), (9, 1), (11, 1), (12, 1)],
  term ((16612902868000 : Rat) / 133212455901) [(9, 1), (11, 1), (12, 1)],
  term ((-33225805736000 : Rat) / 133212455901) [(9, 1), (11, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 371 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0371_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0371
        rs_R009_ueqv_R009YNNNN_generator_28_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_28_0371 := by
  native_decide

/-- Coefficient term 372 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0372 : Poly :=
[
  term ((-4196237636816657 : Rat) / 25576791532992) [(9, 1), (11, 1), (14, 1)]
]

/-- Partial product 372 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0372 : Poly :=
[
  term ((4196237636816657 : Rat) / 12788395766496) [(0, 1), (9, 1), (11, 1), (14, 2)],
  term ((-4196237636816657 : Rat) / 25576791532992) [(0, 2), (9, 1), (11, 1), (14, 1)],
  term ((4196237636816657 : Rat) / 12788395766496) [(1, 1), (9, 1), (11, 1), (14, 1), (15, 1)],
  term ((-4196237636816657 : Rat) / 25576791532992) [(1, 2), (9, 1), (11, 1), (14, 1)],
  term ((4196237636816657 : Rat) / 25576791532992) [(9, 1), (11, 1), (14, 1)],
  term ((-4196237636816657 : Rat) / 12788395766496) [(9, 1), (11, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 372 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0372_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0372
        rs_R009_ueqv_R009YNNNN_generator_28_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_28_0372 := by
  native_decide

/-- Coefficient term 373 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0373 : Poly :=
[
  term ((59904 : Rat) / 553) [(9, 1), (11, 1), (14, 2)]
]

/-- Partial product 373 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0373 : Poly :=
[
  term ((-119808 : Rat) / 553) [(0, 1), (9, 1), (11, 1), (14, 3)],
  term ((59904 : Rat) / 553) [(0, 2), (9, 1), (11, 1), (14, 2)],
  term ((-119808 : Rat) / 553) [(1, 1), (9, 1), (11, 1), (14, 2), (15, 1)],
  term ((59904 : Rat) / 553) [(1, 2), (9, 1), (11, 1), (14, 2)],
  term ((-59904 : Rat) / 553) [(9, 1), (11, 1), (14, 2)],
  term ((119808 : Rat) / 553) [(9, 1), (11, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 373 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0373_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0373
        rs_R009_ueqv_R009YNNNN_generator_28_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_28_0373 := by
  native_decide

/-- Coefficient term 374 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0374 : Poly :=
[
  term ((-9008294618453 : Rat) / 236822143824) [(9, 1), (11, 1), (15, 2)]
]

/-- Partial product 374 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0374 : Poly :=
[
  term ((9008294618453 : Rat) / 118411071912) [(0, 1), (9, 1), (11, 1), (14, 1), (15, 2)],
  term ((-9008294618453 : Rat) / 236822143824) [(0, 2), (9, 1), (11, 1), (15, 2)],
  term ((9008294618453 : Rat) / 118411071912) [(1, 1), (9, 1), (11, 1), (15, 3)],
  term ((-9008294618453 : Rat) / 236822143824) [(1, 2), (9, 1), (11, 1), (15, 2)],
  term ((-9008294618453 : Rat) / 118411071912) [(9, 1), (11, 1), (14, 1), (15, 2)],
  term ((9008294618453 : Rat) / 236822143824) [(9, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 374 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0374_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0374
        rs_R009_ueqv_R009YNNNN_generator_28_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_28_0374 := by
  native_decide

/-- Coefficient term 375 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0375 : Poly :=
[
  term ((97923607474811 : Rat) / 1065699647208) [(9, 1), (12, 1), (13, 1)]
]

/-- Partial product 375 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0375 : Poly :=
[
  term ((-97923607474811 : Rat) / 532849823604) [(0, 1), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((97923607474811 : Rat) / 1065699647208) [(0, 2), (9, 1), (12, 1), (13, 1)],
  term ((-97923607474811 : Rat) / 532849823604) [(1, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((97923607474811 : Rat) / 1065699647208) [(1, 2), (9, 1), (12, 1), (13, 1)],
  term ((-97923607474811 : Rat) / 1065699647208) [(9, 1), (12, 1), (13, 1)],
  term ((97923607474811 : Rat) / 532849823604) [(9, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 375 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0375_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0375
        rs_R009_ueqv_R009YNNNN_generator_28_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_28_0375 := by
  native_decide

/-- Coefficient term 376 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0376 : Poly :=
[
  term ((-475 : Rat) / 84) [(9, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 376 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0376 : Poly :=
[
  term ((475 : Rat) / 42) [(0, 1), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-475 : Rat) / 84) [(0, 2), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((475 : Rat) / 42) [(1, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-475 : Rat) / 84) [(1, 2), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-475 : Rat) / 42) [(9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((475 : Rat) / 84) [(9, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 376 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0376_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0376
        rs_R009_ueqv_R009YNNNN_generator_28_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_28_0376 := by
  native_decide

/-- Coefficient term 377 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0377 : Poly :=
[
  term ((2172201733 : Rat) / 666166368) [(9, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 377 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0377 : Poly :=
[
  term ((-2172201733 : Rat) / 333083184) [(0, 1), (9, 1), (12, 1), (14, 2), (15, 1)],
  term ((2172201733 : Rat) / 666166368) [(0, 2), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-2172201733 : Rat) / 333083184) [(1, 1), (9, 1), (12, 1), (14, 1), (15, 2)],
  term ((2172201733 : Rat) / 666166368) [(1, 2), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-2172201733 : Rat) / 666166368) [(9, 1), (12, 1), (14, 1), (15, 1)],
  term ((2172201733 : Rat) / 333083184) [(9, 1), (12, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 377 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0377_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0377
        rs_R009_ueqv_R009YNNNN_generator_28_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_28_0377 := by
  native_decide

/-- Coefficient term 378 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0378 : Poly :=
[
  term ((-10110568816218515 : Rat) / 139251420568512) [(9, 1), (12, 1), (15, 1)]
]

/-- Partial product 378 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0378 : Poly :=
[
  term ((10110568816218515 : Rat) / 69625710284256) [(0, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-10110568816218515 : Rat) / 139251420568512) [(0, 2), (9, 1), (12, 1), (15, 1)],
  term ((10110568816218515 : Rat) / 69625710284256) [(1, 1), (9, 1), (12, 1), (15, 2)],
  term ((-10110568816218515 : Rat) / 139251420568512) [(1, 2), (9, 1), (12, 1), (15, 1)],
  term ((-10110568816218515 : Rat) / 69625710284256) [(9, 1), (12, 1), (14, 1), (15, 1)],
  term ((10110568816218515 : Rat) / 139251420568512) [(9, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 378 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0378_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0378
        rs_R009_ueqv_R009YNNNN_generator_28_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_28_0378 := by
  native_decide

/-- Coefficient term 379 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0379 : Poly :=
[
  term ((32 : Rat) / 7) [(9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 379 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0379 : Poly :=
[
  term ((-64 : Rat) / 7) [(0, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((32 : Rat) / 7) [(0, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-64 : Rat) / 7) [(1, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((32 : Rat) / 7) [(1, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((64 : Rat) / 7) [(9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-32 : Rat) / 7) [(9, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 379 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0379_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0379
        rs_R009_ueqv_R009YNNNN_generator_28_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_28_0379 := by
  native_decide

/-- Coefficient term 380 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0380 : Poly :=
[
  term ((4001812670359445 : Rat) / 25576791532992) [(9, 1), (13, 1)]
]

/-- Partial product 380 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0380 : Poly :=
[
  term ((-4001812670359445 : Rat) / 12788395766496) [(0, 1), (9, 1), (13, 1), (14, 1)],
  term ((4001812670359445 : Rat) / 25576791532992) [(0, 2), (9, 1), (13, 1)],
  term ((-4001812670359445 : Rat) / 12788395766496) [(1, 1), (9, 1), (13, 1), (15, 1)],
  term ((4001812670359445 : Rat) / 25576791532992) [(1, 2), (9, 1), (13, 1)],
  term ((-4001812670359445 : Rat) / 25576791532992) [(9, 1), (13, 1)],
  term ((4001812670359445 : Rat) / 12788395766496) [(9, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 380 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0380_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0380
        rs_R009_ueqv_R009YNNNN_generator_28_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_28_0380 := by
  native_decide

/-- Coefficient term 381 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0381 : Poly :=
[
  term ((-15821421335342857 : Rat) / 25576791532992) [(9, 1), (13, 1), (14, 1)]
]

/-- Partial product 381 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0381 : Poly :=
[
  term ((15821421335342857 : Rat) / 12788395766496) [(0, 1), (9, 1), (13, 1), (14, 2)],
  term ((-15821421335342857 : Rat) / 25576791532992) [(0, 2), (9, 1), (13, 1), (14, 1)],
  term ((15821421335342857 : Rat) / 12788395766496) [(1, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((-15821421335342857 : Rat) / 25576791532992) [(1, 2), (9, 1), (13, 1), (14, 1)],
  term ((15821421335342857 : Rat) / 25576791532992) [(9, 1), (13, 1), (14, 1)],
  term ((-15821421335342857 : Rat) / 12788395766496) [(9, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 381 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0381_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0381
        rs_R009_ueqv_R009YNNNN_generator_28_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_28_0381 := by
  native_decide

/-- Coefficient term 382 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0382 : Poly :=
[
  term ((-1105 : Rat) / 84) [(9, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 382 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0382 : Poly :=
[
  term ((1105 : Rat) / 42) [(0, 1), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((-1105 : Rat) / 84) [(0, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((1105 : Rat) / 42) [(1, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1105 : Rat) / 84) [(1, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((1105 : Rat) / 84) [(9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1105 : Rat) / 42) [(9, 1), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 382 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0382_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0382
        rs_R009_ueqv_R009YNNNN_generator_28_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_28_0382 := by
  native_decide

/-- Coefficient term 383 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0383 : Poly :=
[
  term ((-6422908767787 : Rat) / 157881429216) [(9, 1), (13, 1), (14, 2)]
]

/-- Partial product 383 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0383 : Poly :=
[
  term ((6422908767787 : Rat) / 78940714608) [(0, 1), (9, 1), (13, 1), (14, 3)],
  term ((-6422908767787 : Rat) / 157881429216) [(0, 2), (9, 1), (13, 1), (14, 2)],
  term ((6422908767787 : Rat) / 78940714608) [(1, 1), (9, 1), (13, 1), (14, 2), (15, 1)],
  term ((-6422908767787 : Rat) / 157881429216) [(1, 2), (9, 1), (13, 1), (14, 2)],
  term ((6422908767787 : Rat) / 157881429216) [(9, 1), (13, 1), (14, 2)],
  term ((-6422908767787 : Rat) / 78940714608) [(9, 1), (13, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 383 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0383_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0383
        rs_R009_ueqv_R009YNNNN_generator_28_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_28_0383 := by
  native_decide

/-- Coefficient term 384 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0384 : Poly :=
[
  term ((305 : Rat) / 56) [(9, 1), (13, 1), (14, 2), (16, 1)]
]

/-- Partial product 384 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0384 : Poly :=
[
  term ((-305 : Rat) / 28) [(0, 1), (9, 1), (13, 1), (14, 3), (16, 1)],
  term ((305 : Rat) / 56) [(0, 2), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((-305 : Rat) / 28) [(1, 1), (9, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((305 : Rat) / 56) [(1, 2), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((-305 : Rat) / 56) [(9, 1), (13, 1), (14, 2), (16, 1)],
  term ((305 : Rat) / 28) [(9, 1), (13, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 384 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0384_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0384
        rs_R009_ueqv_R009YNNNN_generator_28_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_28_0384 := by
  native_decide

/-- Coefficient term 385 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0385 : Poly :=
[
  term ((2954048478533 : Rat) / 78940714608) [(9, 1), (13, 1), (15, 2)]
]

/-- Partial product 385 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0385 : Poly :=
[
  term ((-2954048478533 : Rat) / 39470357304) [(0, 1), (9, 1), (13, 1), (14, 1), (15, 2)],
  term ((2954048478533 : Rat) / 78940714608) [(0, 2), (9, 1), (13, 1), (15, 2)],
  term ((-2954048478533 : Rat) / 39470357304) [(1, 1), (9, 1), (13, 1), (15, 3)],
  term ((2954048478533 : Rat) / 78940714608) [(1, 2), (9, 1), (13, 1), (15, 2)],
  term ((2954048478533 : Rat) / 39470357304) [(9, 1), (13, 1), (14, 1), (15, 2)],
  term ((-2954048478533 : Rat) / 78940714608) [(9, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 385 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0385_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0385
        rs_R009_ueqv_R009YNNNN_generator_28_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_28_0385 := by
  native_decide

/-- Coefficient term 386 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0386 : Poly :=
[
  term ((-305 : Rat) / 56) [(9, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 386 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0386 : Poly :=
[
  term ((305 : Rat) / 28) [(0, 1), (9, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-305 : Rat) / 56) [(0, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((305 : Rat) / 28) [(1, 1), (9, 1), (13, 1), (15, 3), (16, 1)],
  term ((-305 : Rat) / 56) [(1, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-305 : Rat) / 28) [(9, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((305 : Rat) / 56) [(9, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 386 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0386_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0386
        rs_R009_ueqv_R009YNNNN_generator_28_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_28_0386 := by
  native_decide

/-- Coefficient term 387 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0387 : Poly :=
[
  term ((-2935 : Rat) / 336) [(9, 1), (13, 1), (16, 1)]
]

/-- Partial product 387 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0387 : Poly :=
[
  term ((2935 : Rat) / 168) [(0, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2935 : Rat) / 336) [(0, 2), (9, 1), (13, 1), (16, 1)],
  term ((2935 : Rat) / 168) [(1, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2935 : Rat) / 336) [(1, 2), (9, 1), (13, 1), (16, 1)],
  term ((-2935 : Rat) / 168) [(9, 1), (13, 1), (14, 1), (16, 1)],
  term ((2935 : Rat) / 336) [(9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 387 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0387_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0387
        rs_R009_ueqv_R009YNNNN_generator_28_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_28_0387 := by
  native_decide

/-- Coefficient term 388 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0388 : Poly :=
[
  term ((-107701373402531 : Rat) / 725267815461) [(9, 1), (14, 1), (15, 1)]
]

/-- Partial product 388 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0388 : Poly :=
[
  term ((215402746805062 : Rat) / 725267815461) [(0, 1), (9, 1), (14, 2), (15, 1)],
  term ((-107701373402531 : Rat) / 725267815461) [(0, 2), (9, 1), (14, 1), (15, 1)],
  term ((215402746805062 : Rat) / 725267815461) [(1, 1), (9, 1), (14, 1), (15, 2)],
  term ((-107701373402531 : Rat) / 725267815461) [(1, 2), (9, 1), (14, 1), (15, 1)],
  term ((107701373402531 : Rat) / 725267815461) [(9, 1), (14, 1), (15, 1)],
  term ((-215402746805062 : Rat) / 725267815461) [(9, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 388 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0388_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0388
        rs_R009_ueqv_R009YNNNN_generator_28_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_28_0388 := by
  native_decide

/-- Coefficient term 389 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0389 : Poly :=
[
  term ((227 : Rat) / 21) [(9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 389 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0389 : Poly :=
[
  term ((-454 : Rat) / 21) [(0, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((227 : Rat) / 21) [(0, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-454 : Rat) / 21) [(1, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((227 : Rat) / 21) [(1, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-227 : Rat) / 21) [(9, 1), (14, 1), (15, 1), (16, 1)],
  term ((454 : Rat) / 21) [(9, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 389 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0389_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0389
        rs_R009_ueqv_R009YNNNN_generator_28_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_28_0389 := by
  native_decide

/-- Coefficient term 390 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0390 : Poly :=
[
  term ((3366906314273 : Rat) / 59205535956) [(9, 1), (14, 2), (15, 1)]
]

/-- Partial product 390 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0390 : Poly :=
[
  term ((-3366906314273 : Rat) / 29602767978) [(0, 1), (9, 1), (14, 3), (15, 1)],
  term ((3366906314273 : Rat) / 59205535956) [(0, 2), (9, 1), (14, 2), (15, 1)],
  term ((-3366906314273 : Rat) / 29602767978) [(1, 1), (9, 1), (14, 2), (15, 2)],
  term ((3366906314273 : Rat) / 59205535956) [(1, 2), (9, 1), (14, 2), (15, 1)],
  term ((-3366906314273 : Rat) / 59205535956) [(9, 1), (14, 2), (15, 1)],
  term ((3366906314273 : Rat) / 29602767978) [(9, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 390 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0390_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0390
        rs_R009_ueqv_R009YNNNN_generator_28_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_28_0390 := by
  native_decide

/-- Coefficient term 391 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0391 : Poly :=
[
  term ((-65 : Rat) / 14) [(9, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 391 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0391 : Poly :=
[
  term ((65 : Rat) / 7) [(0, 1), (9, 1), (14, 3), (15, 1), (16, 1)],
  term ((-65 : Rat) / 14) [(0, 2), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((65 : Rat) / 7) [(1, 1), (9, 1), (14, 2), (15, 2), (16, 1)],
  term ((-65 : Rat) / 14) [(1, 2), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((65 : Rat) / 14) [(9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-65 : Rat) / 7) [(9, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 391 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0391_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0391
        rs_R009_ueqv_R009YNNNN_generator_28_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_28_0391 := by
  native_decide

/-- Coefficient term 392 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0392 : Poly :=
[
  term ((793129836375269699 : Rat) / 1253262785116608) [(9, 1), (15, 1)]
]

/-- Partial product 392 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0392 : Poly :=
[
  term ((-793129836375269699 : Rat) / 626631392558304) [(0, 1), (9, 1), (14, 1), (15, 1)],
  term ((793129836375269699 : Rat) / 1253262785116608) [(0, 2), (9, 1), (15, 1)],
  term ((-793129836375269699 : Rat) / 626631392558304) [(1, 1), (9, 1), (15, 2)],
  term ((793129836375269699 : Rat) / 1253262785116608) [(1, 2), (9, 1), (15, 1)],
  term ((793129836375269699 : Rat) / 626631392558304) [(9, 1), (14, 1), (15, 1)],
  term ((-793129836375269699 : Rat) / 1253262785116608) [(9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 392 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0392_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0392
        rs_R009_ueqv_R009YNNNN_generator_28_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_28_0392 := by
  native_decide

/-- Coefficient term 393 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0393 : Poly :=
[
  term ((27 : Rat) / 4) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 393 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0393 : Poly :=
[
  term ((-27 : Rat) / 2) [(0, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((27 : Rat) / 4) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term ((-27 : Rat) / 2) [(1, 1), (9, 1), (15, 2), (16, 1)],
  term ((27 : Rat) / 4) [(1, 2), (9, 1), (15, 1), (16, 1)],
  term ((27 : Rat) / 2) [(9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-27 : Rat) / 4) [(9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 393 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0393_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0393
        rs_R009_ueqv_R009YNNNN_generator_28_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_28_0393 := by
  native_decide

/-- Coefficient term 394 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0394 : Poly :=
[
  term ((-3366906314273 : Rat) / 59205535956) [(9, 1), (15, 3)]
]

/-- Partial product 394 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0394 : Poly :=
[
  term ((3366906314273 : Rat) / 29602767978) [(0, 1), (9, 1), (14, 1), (15, 3)],
  term ((-3366906314273 : Rat) / 59205535956) [(0, 2), (9, 1), (15, 3)],
  term ((3366906314273 : Rat) / 29602767978) [(1, 1), (9, 1), (15, 4)],
  term ((-3366906314273 : Rat) / 59205535956) [(1, 2), (9, 1), (15, 3)],
  term ((-3366906314273 : Rat) / 29602767978) [(9, 1), (14, 1), (15, 3)],
  term ((3366906314273 : Rat) / 59205535956) [(9, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 394 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0394_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0394
        rs_R009_ueqv_R009YNNNN_generator_28_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_28_0394 := by
  native_decide

/-- Coefficient term 395 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0395 : Poly :=
[
  term ((65 : Rat) / 14) [(9, 1), (15, 3), (16, 1)]
]

/-- Partial product 395 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0395 : Poly :=
[
  term ((-65 : Rat) / 7) [(0, 1), (9, 1), (14, 1), (15, 3), (16, 1)],
  term ((65 : Rat) / 14) [(0, 2), (9, 1), (15, 3), (16, 1)],
  term ((-65 : Rat) / 7) [(1, 1), (9, 1), (15, 4), (16, 1)],
  term ((65 : Rat) / 14) [(1, 2), (9, 1), (15, 3), (16, 1)],
  term ((65 : Rat) / 7) [(9, 1), (14, 1), (15, 3), (16, 1)],
  term ((-65 : Rat) / 14) [(9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 395 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0395_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0395
        rs_R009_ueqv_R009YNNNN_generator_28_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_28_0395 := by
  native_decide

/-- Coefficient term 396 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0396 : Poly :=
[
  term ((26387666788787755 : Rat) / 139251420568512) [(9, 2)]
]

/-- Partial product 396 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0396 : Poly :=
[
  term ((-26387666788787755 : Rat) / 69625710284256) [(0, 1), (9, 2), (14, 1)],
  term ((26387666788787755 : Rat) / 139251420568512) [(0, 2), (9, 2)],
  term ((-26387666788787755 : Rat) / 69625710284256) [(1, 1), (9, 2), (15, 1)],
  term ((26387666788787755 : Rat) / 139251420568512) [(1, 2), (9, 2)],
  term ((-26387666788787755 : Rat) / 139251420568512) [(9, 2)],
  term ((26387666788787755 : Rat) / 69625710284256) [(9, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 396 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0396_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0396
        rs_R009_ueqv_R009YNNNN_generator_28_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_28_0396 := by
  native_decide

/-- Coefficient term 397 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0397 : Poly :=
[
  term ((-1457547362843 : Rat) / 17986491936) [(9, 2), (10, 1)]
]

/-- Partial product 397 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0397 : Poly :=
[
  term ((1457547362843 : Rat) / 8993245968) [(0, 1), (9, 2), (10, 1), (14, 1)],
  term ((-1457547362843 : Rat) / 17986491936) [(0, 2), (9, 2), (10, 1)],
  term ((1457547362843 : Rat) / 8993245968) [(1, 1), (9, 2), (10, 1), (15, 1)],
  term ((-1457547362843 : Rat) / 17986491936) [(1, 2), (9, 2), (10, 1)],
  term ((1457547362843 : Rat) / 17986491936) [(9, 2), (10, 1)],
  term ((-1457547362843 : Rat) / 8993245968) [(9, 2), (10, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 397 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0397_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0397
        rs_R009_ueqv_R009YNNNN_generator_28_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_28_0397 := by
  native_decide

/-- Coefficient term 398 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0398 : Poly :=
[
  term ((67338253723 : Rat) / 4496622984) [(9, 2), (10, 1), (12, 1)]
]

/-- Partial product 398 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0398 : Poly :=
[
  term ((-67338253723 : Rat) / 2248311492) [(0, 1), (9, 2), (10, 1), (12, 1), (14, 1)],
  term ((67338253723 : Rat) / 4496622984) [(0, 2), (9, 2), (10, 1), (12, 1)],
  term ((-67338253723 : Rat) / 2248311492) [(1, 1), (9, 2), (10, 1), (12, 1), (15, 1)],
  term ((67338253723 : Rat) / 4496622984) [(1, 2), (9, 2), (10, 1), (12, 1)],
  term ((-67338253723 : Rat) / 4496622984) [(9, 2), (10, 1), (12, 1)],
  term ((67338253723 : Rat) / 2248311492) [(9, 2), (10, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 398 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0398_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0398
        rs_R009_ueqv_R009YNNNN_generator_28_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_28_0398 := by
  native_decide

/-- Coefficient term 399 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0399 : Poly :=
[
  term ((-2172201733 : Rat) / 333083184) [(9, 2), (10, 1), (14, 1)]
]

/-- Partial product 399 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0399 : Poly :=
[
  term ((2172201733 : Rat) / 166541592) [(0, 1), (9, 2), (10, 1), (14, 2)],
  term ((-2172201733 : Rat) / 333083184) [(0, 2), (9, 2), (10, 1), (14, 1)],
  term ((2172201733 : Rat) / 166541592) [(1, 1), (9, 2), (10, 1), (14, 1), (15, 1)],
  term ((-2172201733 : Rat) / 333083184) [(1, 2), (9, 2), (10, 1), (14, 1)],
  term ((2172201733 : Rat) / 333083184) [(9, 2), (10, 1), (14, 1)],
  term ((-2172201733 : Rat) / 166541592) [(9, 2), (10, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 399 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0399_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0399
        rs_R009_ueqv_R009YNNNN_generator_28_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_28_0399 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009YNNNN_partials_28_0300_0399 : List Poly :=
[
  rs_R009_ueqv_R009YNNNN_partial_28_0300,
  rs_R009_ueqv_R009YNNNN_partial_28_0301,
  rs_R009_ueqv_R009YNNNN_partial_28_0302,
  rs_R009_ueqv_R009YNNNN_partial_28_0303,
  rs_R009_ueqv_R009YNNNN_partial_28_0304,
  rs_R009_ueqv_R009YNNNN_partial_28_0305,
  rs_R009_ueqv_R009YNNNN_partial_28_0306,
  rs_R009_ueqv_R009YNNNN_partial_28_0307,
  rs_R009_ueqv_R009YNNNN_partial_28_0308,
  rs_R009_ueqv_R009YNNNN_partial_28_0309,
  rs_R009_ueqv_R009YNNNN_partial_28_0310,
  rs_R009_ueqv_R009YNNNN_partial_28_0311,
  rs_R009_ueqv_R009YNNNN_partial_28_0312,
  rs_R009_ueqv_R009YNNNN_partial_28_0313,
  rs_R009_ueqv_R009YNNNN_partial_28_0314,
  rs_R009_ueqv_R009YNNNN_partial_28_0315,
  rs_R009_ueqv_R009YNNNN_partial_28_0316,
  rs_R009_ueqv_R009YNNNN_partial_28_0317,
  rs_R009_ueqv_R009YNNNN_partial_28_0318,
  rs_R009_ueqv_R009YNNNN_partial_28_0319,
  rs_R009_ueqv_R009YNNNN_partial_28_0320,
  rs_R009_ueqv_R009YNNNN_partial_28_0321,
  rs_R009_ueqv_R009YNNNN_partial_28_0322,
  rs_R009_ueqv_R009YNNNN_partial_28_0323,
  rs_R009_ueqv_R009YNNNN_partial_28_0324,
  rs_R009_ueqv_R009YNNNN_partial_28_0325,
  rs_R009_ueqv_R009YNNNN_partial_28_0326,
  rs_R009_ueqv_R009YNNNN_partial_28_0327,
  rs_R009_ueqv_R009YNNNN_partial_28_0328,
  rs_R009_ueqv_R009YNNNN_partial_28_0329,
  rs_R009_ueqv_R009YNNNN_partial_28_0330,
  rs_R009_ueqv_R009YNNNN_partial_28_0331,
  rs_R009_ueqv_R009YNNNN_partial_28_0332,
  rs_R009_ueqv_R009YNNNN_partial_28_0333,
  rs_R009_ueqv_R009YNNNN_partial_28_0334,
  rs_R009_ueqv_R009YNNNN_partial_28_0335,
  rs_R009_ueqv_R009YNNNN_partial_28_0336,
  rs_R009_ueqv_R009YNNNN_partial_28_0337,
  rs_R009_ueqv_R009YNNNN_partial_28_0338,
  rs_R009_ueqv_R009YNNNN_partial_28_0339,
  rs_R009_ueqv_R009YNNNN_partial_28_0340,
  rs_R009_ueqv_R009YNNNN_partial_28_0341,
  rs_R009_ueqv_R009YNNNN_partial_28_0342,
  rs_R009_ueqv_R009YNNNN_partial_28_0343,
  rs_R009_ueqv_R009YNNNN_partial_28_0344,
  rs_R009_ueqv_R009YNNNN_partial_28_0345,
  rs_R009_ueqv_R009YNNNN_partial_28_0346,
  rs_R009_ueqv_R009YNNNN_partial_28_0347,
  rs_R009_ueqv_R009YNNNN_partial_28_0348,
  rs_R009_ueqv_R009YNNNN_partial_28_0349,
  rs_R009_ueqv_R009YNNNN_partial_28_0350,
  rs_R009_ueqv_R009YNNNN_partial_28_0351,
  rs_R009_ueqv_R009YNNNN_partial_28_0352,
  rs_R009_ueqv_R009YNNNN_partial_28_0353,
  rs_R009_ueqv_R009YNNNN_partial_28_0354,
  rs_R009_ueqv_R009YNNNN_partial_28_0355,
  rs_R009_ueqv_R009YNNNN_partial_28_0356,
  rs_R009_ueqv_R009YNNNN_partial_28_0357,
  rs_R009_ueqv_R009YNNNN_partial_28_0358,
  rs_R009_ueqv_R009YNNNN_partial_28_0359,
  rs_R009_ueqv_R009YNNNN_partial_28_0360,
  rs_R009_ueqv_R009YNNNN_partial_28_0361,
  rs_R009_ueqv_R009YNNNN_partial_28_0362,
  rs_R009_ueqv_R009YNNNN_partial_28_0363,
  rs_R009_ueqv_R009YNNNN_partial_28_0364,
  rs_R009_ueqv_R009YNNNN_partial_28_0365,
  rs_R009_ueqv_R009YNNNN_partial_28_0366,
  rs_R009_ueqv_R009YNNNN_partial_28_0367,
  rs_R009_ueqv_R009YNNNN_partial_28_0368,
  rs_R009_ueqv_R009YNNNN_partial_28_0369,
  rs_R009_ueqv_R009YNNNN_partial_28_0370,
  rs_R009_ueqv_R009YNNNN_partial_28_0371,
  rs_R009_ueqv_R009YNNNN_partial_28_0372,
  rs_R009_ueqv_R009YNNNN_partial_28_0373,
  rs_R009_ueqv_R009YNNNN_partial_28_0374,
  rs_R009_ueqv_R009YNNNN_partial_28_0375,
  rs_R009_ueqv_R009YNNNN_partial_28_0376,
  rs_R009_ueqv_R009YNNNN_partial_28_0377,
  rs_R009_ueqv_R009YNNNN_partial_28_0378,
  rs_R009_ueqv_R009YNNNN_partial_28_0379,
  rs_R009_ueqv_R009YNNNN_partial_28_0380,
  rs_R009_ueqv_R009YNNNN_partial_28_0381,
  rs_R009_ueqv_R009YNNNN_partial_28_0382,
  rs_R009_ueqv_R009YNNNN_partial_28_0383,
  rs_R009_ueqv_R009YNNNN_partial_28_0384,
  rs_R009_ueqv_R009YNNNN_partial_28_0385,
  rs_R009_ueqv_R009YNNNN_partial_28_0386,
  rs_R009_ueqv_R009YNNNN_partial_28_0387,
  rs_R009_ueqv_R009YNNNN_partial_28_0388,
  rs_R009_ueqv_R009YNNNN_partial_28_0389,
  rs_R009_ueqv_R009YNNNN_partial_28_0390,
  rs_R009_ueqv_R009YNNNN_partial_28_0391,
  rs_R009_ueqv_R009YNNNN_partial_28_0392,
  rs_R009_ueqv_R009YNNNN_partial_28_0393,
  rs_R009_ueqv_R009YNNNN_partial_28_0394,
  rs_R009_ueqv_R009YNNNN_partial_28_0395,
  rs_R009_ueqv_R009YNNNN_partial_28_0396,
  rs_R009_ueqv_R009YNNNN_partial_28_0397,
  rs_R009_ueqv_R009YNNNN_partial_28_0398,
  rs_R009_ueqv_R009YNNNN_partial_28_0399
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009YNNNN_block_28_0300_0399 : Poly :=
[
  term ((-224 : Rat) / 9) [(0, 1), (6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-12678390449980907 : Rat) / 13054820678298) [(0, 1), (6, 1), (11, 2), (14, 1)],
  term ((2224986028928059 : Rat) / 1598549470812) [(0, 1), (6, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-1495 : Rat) / 126) [(0, 1), (6, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-140138745041977 : Rat) / 165250894662) [(0, 1), (6, 1), (12, 1), (14, 1), (15, 2)],
  term ((494 : Rat) / 63) [(0, 1), (6, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(0, 1), (6, 1), (12, 1), (14, 2), (15, 2)],
  term ((-27003763829248933 : Rat) / 6527410339149) [(0, 1), (6, 1), (13, 1), (14, 1), (15, 1)],
  term ((289 : Rat) / 14) [(0, 1), (6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-28425155928161 : Rat) / 241755938487) [(0, 1), (6, 1), (13, 1), (14, 2), (15, 1)],
  term ((941242657 : Rat) / 83270796) [(0, 1), (6, 1), (13, 2), (14, 1)],
  term ((725 : Rat) / 42) [(0, 1), (6, 1), (13, 2), (14, 1), (16, 1)],
  term ((6909224935385495 : Rat) / 2175803446383) [(0, 1), (6, 1), (14, 1), (15, 2)],
  term ((-494 : Rat) / 21) [(0, 1), (6, 1), (14, 1), (15, 2), (16, 1)],
  term ((3021914984422465 : Rat) / 2901071261844) [(0, 1), (6, 1), (14, 2)],
  term ((-9193198696854 : Rat) / 26861770943) [(0, 1), (6, 1), (14, 2), (15, 2)],
  term ((-28425155928161 : Rat) / 483511876974) [(0, 1), (6, 1), (14, 3)],
  term ((-12175190713465 : Rat) / 40469606856) [(0, 1), (7, 1), (9, 1), (10, 1), (14, 1)],
  term ((-3849005354029 : Rat) / 1289365005264) [(0, 1), (7, 1), (9, 1), (12, 1), (14, 1)],
  term ((53777198303881 : Rat) / 40469606856) [(0, 1), (7, 1), (9, 1), (12, 1), (14, 2)],
  term ((107532017845456895 : Rat) / 156657848139576) [(0, 1), (7, 1), (9, 1), (14, 1)],
  term ((-206185803715802887 : Rat) / 52219282713192) [(0, 1), (7, 1), (9, 1), (14, 2)],
  term ((5063669429410409 : Rat) / 13054820678298) [(0, 1), (7, 1), (10, 1), (11, 1), (14, 1)],
  term ((568121444666635 : Rat) / 1598549470812) [(0, 1), (7, 1), (10, 1), (13, 1), (14, 1)],
  term ((9545 : Rat) / 126) [(0, 1), (7, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-27248392831391255 : Rat) / 26109641356596) [(0, 1), (7, 1), (10, 1), (14, 1), (15, 1)],
  term ((-4138 : Rat) / 63) [(0, 1), (7, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-333108 : Rat) / 553) [(0, 1), (7, 1), (11, 1), (12, 1), (14, 1)],
  term ((-706121836024930 : Rat) / 6527410339149) [(0, 1), (7, 1), (11, 1), (12, 1), (14, 2)],
  term ((1237216831377703 : Rat) / 2901071261844) [(0, 1), (7, 1), (11, 1), (14, 1)],
  term ((-76343852153691455 : Rat) / 26109641356596) [(0, 1), (7, 1), (11, 1), (14, 2)],
  term ((-941242657 : Rat) / 166541592) [(0, 1), (7, 1), (12, 1), (13, 1), (14, 1)],
  term ((-725 : Rat) / 84) [(0, 1), (7, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2224986028928059 : Rat) / 1598549470812) [(0, 1), (7, 1), (12, 1), (13, 1), (14, 2)],
  term ((1495 : Rat) / 126) [(0, 1), (7, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((148780745730977 : Rat) / 2901071261844) [(0, 1), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((157 : Rat) / 21) [(0, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((150142660556857 : Rat) / 165250894662) [(0, 1), (7, 1), (12, 1), (14, 2), (15, 1)],
  term ((-494 : Rat) / 63) [(0, 1), (7, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(0, 1), (7, 1), (12, 1), (14, 3), (15, 1)],
  term ((-5968601306100743 : Rat) / 19582231017447) [(0, 1), (7, 1), (13, 1), (14, 1)],
  term ((1835 : Rat) / 126) [(0, 1), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((9782145243569203 : Rat) / 2901071261844) [(0, 1), (7, 1), (13, 1), (14, 2)],
  term ((-1495 : Rat) / 42) [(0, 1), (7, 1), (13, 1), (14, 2), (16, 1)],
  term ((1532199782809 : Rat) / 26861770943) [(0, 1), (7, 1), (13, 1), (14, 3)],
  term ((8724500552915153 : Rat) / 4351606892766) [(0, 1), (7, 1), (14, 1), (15, 1)],
  term ((-718 : Rat) / 63) [(0, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-14834145445646395 : Rat) / 4351606892766) [(0, 1), (7, 1), (14, 2), (15, 1)],
  term ((494 : Rat) / 21) [(0, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((9193198696854 : Rat) / 26861770943) [(0, 1), (7, 1), (14, 3), (15, 1)],
  term ((1349868008654729 : Rat) / 13054820678298) [(0, 1), (7, 2), (10, 1), (14, 1)],
  term ((-1532199782809 : Rat) / 161170625658) [(0, 1), (7, 2), (12, 1), (14, 1)],
  term ((-4349915183394751 : Rat) / 6527410339149) [(0, 1), (7, 2), (12, 1), (14, 2)],
  term ((-9187069897722764 : Rat) / 6527410339149) [(0, 1), (7, 2), (14, 1)],
  term ((4349915183394751 : Rat) / 2175803446383) [(0, 1), (7, 2), (14, 2)],
  term ((-9984 : Rat) / 553) [(0, 1), (9, 1), (10, 1), (11, 1), (12, 1), (14, 1)],
  term ((8367496511569 : Rat) / 13156785768) [(0, 1), (9, 1), (10, 1), (11, 1), (14, 1)],
  term ((-59904 : Rat) / 553) [(0, 1), (9, 1), (10, 1), (11, 1), (14, 2)],
  term ((6090608323475 : Rat) / 266424911802) [(0, 1), (9, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((-5 : Rat) / 3) [(0, 1), (9, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-30188368622915 : Rat) / 177616607868) [(0, 1), (9, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((32 : Rat) / 21) [(0, 1), (9, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-30905832934531 : Rat) / 177616607868) [(0, 1), (9, 1), (10, 1), (13, 1), (14, 1)],
  term ((1735 : Rat) / 84) [(0, 1), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-8926828802611 : Rat) / 266424911802) [(0, 1), (9, 1), (10, 1), (13, 1), (14, 2)],
  term ((-55 : Rat) / 14) [(0, 1), (9, 1), (10, 1), (13, 1), (14, 2), (16, 1)],
  term ((8023330184610151 : Rat) / 4262798588832) [(0, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((-373 : Rat) / 21) [(0, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((170525183774905 : Rat) / 355233215736) [(0, 1), (9, 1), (10, 1), (14, 2), (15, 1)],
  term ((22 : Rat) / 7) [(0, 1), (9, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((33225805736000 : Rat) / 133212455901) [(0, 1), (9, 1), (11, 1), (12, 1), (14, 1)],
  term ((25887226544513275 : Rat) / 12788395766496) [(0, 1), (9, 1), (11, 1), (14, 1)],
  term ((9008294618453 : Rat) / 118411071912) [(0, 1), (9, 1), (11, 1), (14, 1), (15, 2)],
  term ((4196237636816657 : Rat) / 12788395766496) [(0, 1), (9, 1), (11, 1), (14, 2)],
  term ((-119808 : Rat) / 553) [(0, 1), (9, 1), (11, 1), (14, 3)],
  term ((-97923607474811 : Rat) / 532849823604) [(0, 1), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((475 : Rat) / 42) [(0, 1), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((10110568816218515 : Rat) / 69625710284256) [(0, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-64 : Rat) / 7) [(0, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2172201733 : Rat) / 333083184) [(0, 1), (9, 1), (12, 1), (14, 2), (15, 1)],
  term ((-4001812670359445 : Rat) / 12788395766496) [(0, 1), (9, 1), (13, 1), (14, 1)],
  term ((-2954048478533 : Rat) / 39470357304) [(0, 1), (9, 1), (13, 1), (14, 1), (15, 2)],
  term ((305 : Rat) / 28) [(0, 1), (9, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((2935 : Rat) / 168) [(0, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((15821421335342857 : Rat) / 12788395766496) [(0, 1), (9, 1), (13, 1), (14, 2)],
  term ((1105 : Rat) / 42) [(0, 1), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((6422908767787 : Rat) / 78940714608) [(0, 1), (9, 1), (13, 1), (14, 3)],
  term ((-305 : Rat) / 28) [(0, 1), (9, 1), (13, 1), (14, 3), (16, 1)],
  term ((-793129836375269699 : Rat) / 626631392558304) [(0, 1), (9, 1), (14, 1), (15, 1)],
  term ((-27 : Rat) / 2) [(0, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((3366906314273 : Rat) / 29602767978) [(0, 1), (9, 1), (14, 1), (15, 3)],
  term ((-65 : Rat) / 7) [(0, 1), (9, 1), (14, 1), (15, 3), (16, 1)],
  term ((215402746805062 : Rat) / 725267815461) [(0, 1), (9, 1), (14, 2), (15, 1)],
  term ((-454 : Rat) / 21) [(0, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-3366906314273 : Rat) / 29602767978) [(0, 1), (9, 1), (14, 3), (15, 1)],
  term ((65 : Rat) / 7) [(0, 1), (9, 1), (14, 3), (15, 1), (16, 1)],
  term ((-67338253723 : Rat) / 2248311492) [(0, 1), (9, 2), (10, 1), (12, 1), (14, 1)],
  term ((1457547362843 : Rat) / 8993245968) [(0, 1), (9, 2), (10, 1), (14, 1)],
  term ((2172201733 : Rat) / 166541592) [(0, 1), (9, 2), (10, 1), (14, 2)],
  term ((-26387666788787755 : Rat) / 69625710284256) [(0, 1), (9, 2), (14, 1)],
  term ((112 : Rat) / 9) [(0, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((12678390449980907 : Rat) / 26109641356596) [(0, 2), (6, 1), (11, 2)],
  term ((-2224986028928059 : Rat) / 3197098941624) [(0, 2), (6, 1), (12, 1), (13, 1), (15, 1)],
  term ((1495 : Rat) / 252) [(0, 2), (6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1532199782809 : Rat) / 26861770943) [(0, 2), (6, 1), (12, 1), (14, 1), (15, 2)],
  term ((140138745041977 : Rat) / 330501789324) [(0, 2), (6, 1), (12, 1), (15, 2)],
  term ((-247 : Rat) / 63) [(0, 2), (6, 1), (12, 1), (15, 2), (16, 1)],
  term ((28425155928161 : Rat) / 483511876974) [(0, 2), (6, 1), (13, 1), (14, 1), (15, 1)],
  term ((27003763829248933 : Rat) / 13054820678298) [(0, 2), (6, 1), (13, 1), (15, 1)],
  term ((-289 : Rat) / 28) [(0, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-941242657 : Rat) / 166541592) [(0, 2), (6, 1), (13, 2)],
  term ((-725 : Rat) / 84) [(0, 2), (6, 1), (13, 2), (16, 1)],
  term ((-3021914984422465 : Rat) / 5802142523688) [(0, 2), (6, 1), (14, 1)],
  term ((4596599348427 : Rat) / 26861770943) [(0, 2), (6, 1), (14, 1), (15, 2)],
  term ((28425155928161 : Rat) / 967023753948) [(0, 2), (6, 1), (14, 2)],
  term ((-6909224935385495 : Rat) / 4351606892766) [(0, 2), (6, 1), (15, 2)],
  term ((247 : Rat) / 21) [(0, 2), (6, 1), (15, 2), (16, 1)],
  term ((-107532017845456895 : Rat) / 313315696279152) [(0, 2), (7, 1), (9, 1)],
  term ((12175190713465 : Rat) / 80939213712) [(0, 2), (7, 1), (9, 1), (10, 1)],
  term ((3849005354029 : Rat) / 2578730010528) [(0, 2), (7, 1), (9, 1), (12, 1)],
  term ((-53777198303881 : Rat) / 80939213712) [(0, 2), (7, 1), (9, 1), (12, 1), (14, 1)],
  term ((206185803715802887 : Rat) / 104438565426384) [(0, 2), (7, 1), (9, 1), (14, 1)],
  term ((-5063669429410409 : Rat) / 26109641356596) [(0, 2), (7, 1), (10, 1), (11, 1)],
  term ((-568121444666635 : Rat) / 3197098941624) [(0, 2), (7, 1), (10, 1), (13, 1)],
  term ((-9545 : Rat) / 252) [(0, 2), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((27248392831391255 : Rat) / 52219282713192) [(0, 2), (7, 1), (10, 1), (15, 1)],
  term ((2069 : Rat) / 63) [(0, 2), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-1237216831377703 : Rat) / 5802142523688) [(0, 2), (7, 1), (11, 1)],
  term ((166554 : Rat) / 553) [(0, 2), (7, 1), (11, 1), (12, 1)],
  term ((353060918012465 : Rat) / 6527410339149) [(0, 2), (7, 1), (11, 1), (12, 1), (14, 1)],
  term ((76343852153691455 : Rat) / 52219282713192) [(0, 2), (7, 1), (11, 1), (14, 1)],
  term ((941242657 : Rat) / 333083184) [(0, 2), (7, 1), (12, 1), (13, 1)],
  term ((2224986028928059 : Rat) / 3197098941624) [(0, 2), (7, 1), (12, 1), (13, 1), (14, 1)],
  term ((-1495 : Rat) / 252) [(0, 2), (7, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((725 : Rat) / 168) [(0, 2), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((-150142660556857 : Rat) / 330501789324) [(0, 2), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((247 : Rat) / 63) [(0, 2), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((1532199782809 : Rat) / 26861770943) [(0, 2), (7, 1), (12, 1), (14, 2), (15, 1)],
  term ((-148780745730977 : Rat) / 5802142523688) [(0, 2), (7, 1), (12, 1), (15, 1)],
  term ((-157 : Rat) / 42) [(0, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((5968601306100743 : Rat) / 39164462034894) [(0, 2), (7, 1), (13, 1)],
  term ((-9782145243569203 : Rat) / 5802142523688) [(0, 2), (7, 1), (13, 1), (14, 1)],
  term ((1495 : Rat) / 84) [(0, 2), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1532199782809 : Rat) / 53723541886) [(0, 2), (7, 1), (13, 1), (14, 2)],
  term ((-1835 : Rat) / 252) [(0, 2), (7, 1), (13, 1), (16, 1)],
  term ((14834145445646395 : Rat) / 8703213785532) [(0, 2), (7, 1), (14, 1), (15, 1)],
  term ((-247 : Rat) / 21) [(0, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4596599348427 : Rat) / 26861770943) [(0, 2), (7, 1), (14, 2), (15, 1)],
  term ((-8724500552915153 : Rat) / 8703213785532) [(0, 2), (7, 1), (15, 1)],
  term ((359 : Rat) / 63) [(0, 2), (7, 1), (15, 1), (16, 1)],
  term ((4593534948861382 : Rat) / 6527410339149) [(0, 2), (7, 2)],
  term ((-1349868008654729 : Rat) / 26109641356596) [(0, 2), (7, 2), (10, 1)],
  term ((1532199782809 : Rat) / 322341251316) [(0, 2), (7, 2), (12, 1)],
  term ((4349915183394751 : Rat) / 13054820678298) [(0, 2), (7, 2), (12, 1), (14, 1)],
  term ((-4349915183394751 : Rat) / 4351606892766) [(0, 2), (7, 2), (14, 1)],
  term ((-8367496511569 : Rat) / 26313571536) [(0, 2), (9, 1), (10, 1), (11, 1)],
  term ((4992 : Rat) / 553) [(0, 2), (9, 1), (10, 1), (11, 1), (12, 1)],
  term ((29952 : Rat) / 553) [(0, 2), (9, 1), (10, 1), (11, 1), (14, 1)],
  term ((-6090608323475 : Rat) / 532849823604) [(0, 2), (9, 1), (10, 1), (12, 1), (13, 1)],
  term ((5 : Rat) / 6) [(0, 2), (9, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((30188368622915 : Rat) / 355233215736) [(0, 2), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((-16 : Rat) / 21) [(0, 2), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((30905832934531 : Rat) / 355233215736) [(0, 2), (9, 1), (10, 1), (13, 1)],
  term ((8926828802611 : Rat) / 532849823604) [(0, 2), (9, 1), (10, 1), (13, 1), (14, 1)],
  term ((55 : Rat) / 28) [(0, 2), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1735 : Rat) / 168) [(0, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-170525183774905 : Rat) / 710466431472) [(0, 2), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((-11 : Rat) / 7) [(0, 2), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-8023330184610151 : Rat) / 8525597177664) [(0, 2), (9, 1), (10, 1), (15, 1)],
  term ((373 : Rat) / 42) [(0, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-25887226544513275 : Rat) / 25576791532992) [(0, 2), (9, 1), (11, 1)],
  term ((-16612902868000 : Rat) / 133212455901) [(0, 2), (9, 1), (11, 1), (12, 1)],
  term ((-4196237636816657 : Rat) / 25576791532992) [(0, 2), (9, 1), (11, 1), (14, 1)],
  term ((59904 : Rat) / 553) [(0, 2), (9, 1), (11, 1), (14, 2)],
  term ((-9008294618453 : Rat) / 236822143824) [(0, 2), (9, 1), (11, 1), (15, 2)],
  term ((97923607474811 : Rat) / 1065699647208) [(0, 2), (9, 1), (12, 1), (13, 1)],
  term ((-475 : Rat) / 84) [(0, 2), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((2172201733 : Rat) / 666166368) [(0, 2), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-10110568816218515 : Rat) / 139251420568512) [(0, 2), (9, 1), (12, 1), (15, 1)],
  term ((32 : Rat) / 7) [(0, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((4001812670359445 : Rat) / 25576791532992) [(0, 2), (9, 1), (13, 1)],
  term ((-15821421335342857 : Rat) / 25576791532992) [(0, 2), (9, 1), (13, 1), (14, 1)],
  term ((-1105 : Rat) / 84) [(0, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-6422908767787 : Rat) / 157881429216) [(0, 2), (9, 1), (13, 1), (14, 2)],
  term ((305 : Rat) / 56) [(0, 2), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((2954048478533 : Rat) / 78940714608) [(0, 2), (9, 1), (13, 1), (15, 2)],
  term ((-305 : Rat) / 56) [(0, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-2935 : Rat) / 336) [(0, 2), (9, 1), (13, 1), (16, 1)],
  term ((-107701373402531 : Rat) / 725267815461) [(0, 2), (9, 1), (14, 1), (15, 1)],
  term ((227 : Rat) / 21) [(0, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((3366906314273 : Rat) / 59205535956) [(0, 2), (9, 1), (14, 2), (15, 1)],
  term ((-65 : Rat) / 14) [(0, 2), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((793129836375269699 : Rat) / 1253262785116608) [(0, 2), (9, 1), (15, 1)],
  term ((27 : Rat) / 4) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term ((-3366906314273 : Rat) / 59205535956) [(0, 2), (9, 1), (15, 3)],
  term ((65 : Rat) / 14) [(0, 2), (9, 1), (15, 3), (16, 1)],
  term ((26387666788787755 : Rat) / 139251420568512) [(0, 2), (9, 2)],
  term ((-1457547362843 : Rat) / 17986491936) [(0, 2), (9, 2), (10, 1)],
  term ((67338253723 : Rat) / 4496622984) [(0, 2), (9, 2), (10, 1), (12, 1)],
  term ((-2172201733 : Rat) / 333083184) [(0, 2), (9, 2), (10, 1), (14, 1)],
  term ((-224 : Rat) / 9) [(1, 1), (6, 1), (11, 1), (15, 2), (16, 1)],
  term ((-12678390449980907 : Rat) / 13054820678298) [(1, 1), (6, 1), (11, 2), (15, 1)],
  term ((2224986028928059 : Rat) / 1598549470812) [(1, 1), (6, 1), (12, 1), (13, 1), (15, 2)],
  term ((-1495 : Rat) / 126) [(1, 1), (6, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(1, 1), (6, 1), (12, 1), (14, 1), (15, 3)],
  term ((-140138745041977 : Rat) / 165250894662) [(1, 1), (6, 1), (12, 1), (15, 3)],
  term ((494 : Rat) / 63) [(1, 1), (6, 1), (12, 1), (15, 3), (16, 1)],
  term ((-28425155928161 : Rat) / 241755938487) [(1, 1), (6, 1), (13, 1), (14, 1), (15, 2)],
  term ((-27003763829248933 : Rat) / 6527410339149) [(1, 1), (6, 1), (13, 1), (15, 2)],
  term ((289 : Rat) / 14) [(1, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((941242657 : Rat) / 83270796) [(1, 1), (6, 1), (13, 2), (15, 1)],
  term ((725 : Rat) / 42) [(1, 1), (6, 1), (13, 2), (15, 1), (16, 1)],
  term ((3021914984422465 : Rat) / 2901071261844) [(1, 1), (6, 1), (14, 1), (15, 1)],
  term ((-9193198696854 : Rat) / 26861770943) [(1, 1), (6, 1), (14, 1), (15, 3)],
  term ((-28425155928161 : Rat) / 483511876974) [(1, 1), (6, 1), (14, 2), (15, 1)],
  term ((6909224935385495 : Rat) / 2175803446383) [(1, 1), (6, 1), (15, 3)],
  term ((-494 : Rat) / 21) [(1, 1), (6, 1), (15, 3), (16, 1)],
  term ((-12175190713465 : Rat) / 40469606856) [(1, 1), (7, 1), (9, 1), (10, 1), (15, 1)],
  term ((53777198303881 : Rat) / 40469606856) [(1, 1), (7, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-3849005354029 : Rat) / 1289365005264) [(1, 1), (7, 1), (9, 1), (12, 1), (15, 1)],
  term ((-206185803715802887 : Rat) / 52219282713192) [(1, 1), (7, 1), (9, 1), (14, 1), (15, 1)],
  term ((107532017845456895 : Rat) / 156657848139576) [(1, 1), (7, 1), (9, 1), (15, 1)],
  term ((5063669429410409 : Rat) / 13054820678298) [(1, 1), (7, 1), (10, 1), (11, 1), (15, 1)],
  term ((568121444666635 : Rat) / 1598549470812) [(1, 1), (7, 1), (10, 1), (13, 1), (15, 1)],
  term ((9545 : Rat) / 126) [(1, 1), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-27248392831391255 : Rat) / 26109641356596) [(1, 1), (7, 1), (10, 1), (15, 2)],
  term ((-4138 : Rat) / 63) [(1, 1), (7, 1), (10, 1), (15, 2), (16, 1)],
  term ((-706121836024930 : Rat) / 6527410339149) [(1, 1), (7, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-333108 : Rat) / 553) [(1, 1), (7, 1), (11, 1), (12, 1), (15, 1)],
  term ((-76343852153691455 : Rat) / 26109641356596) [(1, 1), (7, 1), (11, 1), (14, 1), (15, 1)],
  term ((1237216831377703 : Rat) / 2901071261844) [(1, 1), (7, 1), (11, 1), (15, 1)],
  term ((-2224986028928059 : Rat) / 1598549470812) [(1, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((1495 : Rat) / 126) [(1, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-941242657 : Rat) / 166541592) [(1, 1), (7, 1), (12, 1), (13, 1), (15, 1)],
  term ((-725 : Rat) / 84) [(1, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((150142660556857 : Rat) / 165250894662) [(1, 1), (7, 1), (12, 1), (14, 1), (15, 2)],
  term ((-494 : Rat) / 63) [(1, 1), (7, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(1, 1), (7, 1), (12, 1), (14, 2), (15, 2)],
  term ((148780745730977 : Rat) / 2901071261844) [(1, 1), (7, 1), (12, 1), (15, 2)],
  term ((157 : Rat) / 21) [(1, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((9782145243569203 : Rat) / 2901071261844) [(1, 1), (7, 1), (13, 1), (14, 1), (15, 1)],
  term ((-1495 : Rat) / 42) [(1, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1532199782809 : Rat) / 26861770943) [(1, 1), (7, 1), (13, 1), (14, 2), (15, 1)],
  term ((-5968601306100743 : Rat) / 19582231017447) [(1, 1), (7, 1), (13, 1), (15, 1)],
  term ((1835 : Rat) / 126) [(1, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-14834145445646395 : Rat) / 4351606892766) [(1, 1), (7, 1), (14, 1), (15, 2)],
  term ((494 : Rat) / 21) [(1, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((9193198696854 : Rat) / 26861770943) [(1, 1), (7, 1), (14, 2), (15, 2)],
  term ((8724500552915153 : Rat) / 4351606892766) [(1, 1), (7, 1), (15, 2)],
  term ((-718 : Rat) / 63) [(1, 1), (7, 1), (15, 2), (16, 1)],
  term ((1349868008654729 : Rat) / 13054820678298) [(1, 1), (7, 2), (10, 1), (15, 1)],
  term ((-4349915183394751 : Rat) / 6527410339149) [(1, 1), (7, 2), (12, 1), (14, 1), (15, 1)],
  term ((-1532199782809 : Rat) / 161170625658) [(1, 1), (7, 2), (12, 1), (15, 1)],
  term ((4349915183394751 : Rat) / 2175803446383) [(1, 1), (7, 2), (14, 1), (15, 1)],
  term ((-9187069897722764 : Rat) / 6527410339149) [(1, 1), (7, 2), (15, 1)],
  term ((-9984 : Rat) / 553) [(1, 1), (9, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-59904 : Rat) / 553) [(1, 1), (9, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((8367496511569 : Rat) / 13156785768) [(1, 1), (9, 1), (10, 1), (11, 1), (15, 1)],
  term ((6090608323475 : Rat) / 266424911802) [(1, 1), (9, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((-5 : Rat) / 3) [(1, 1), (9, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-30188368622915 : Rat) / 177616607868) [(1, 1), (9, 1), (10, 1), (12, 1), (15, 2)],
  term ((32 : Rat) / 21) [(1, 1), (9, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-8926828802611 : Rat) / 266424911802) [(1, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-55 : Rat) / 14) [(1, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-30905832934531 : Rat) / 177616607868) [(1, 1), (9, 1), (10, 1), (13, 1), (15, 1)],
  term ((1735 : Rat) / 84) [(1, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((170525183774905 : Rat) / 355233215736) [(1, 1), (9, 1), (10, 1), (14, 1), (15, 2)],
  term ((22 : Rat) / 7) [(1, 1), (9, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((8023330184610151 : Rat) / 4262798588832) [(1, 1), (9, 1), (10, 1), (15, 2)],
  term ((-373 : Rat) / 21) [(1, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((33225805736000 : Rat) / 133212455901) [(1, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((4196237636816657 : Rat) / 12788395766496) [(1, 1), (9, 1), (11, 1), (14, 1), (15, 1)],
  term ((-119808 : Rat) / 553) [(1, 1), (9, 1), (11, 1), (14, 2), (15, 1)],
  term ((25887226544513275 : Rat) / 12788395766496) [(1, 1), (9, 1), (11, 1), (15, 1)],
  term ((9008294618453 : Rat) / 118411071912) [(1, 1), (9, 1), (11, 1), (15, 3)],
  term ((-97923607474811 : Rat) / 532849823604) [(1, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((475 : Rat) / 42) [(1, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2172201733 : Rat) / 333083184) [(1, 1), (9, 1), (12, 1), (14, 1), (15, 2)],
  term ((10110568816218515 : Rat) / 69625710284256) [(1, 1), (9, 1), (12, 1), (15, 2)],
  term ((-64 : Rat) / 7) [(1, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((15821421335342857 : Rat) / 12788395766496) [(1, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((1105 : Rat) / 42) [(1, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((6422908767787 : Rat) / 78940714608) [(1, 1), (9, 1), (13, 1), (14, 2), (15, 1)],
  term ((-305 : Rat) / 28) [(1, 1), (9, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-4001812670359445 : Rat) / 12788395766496) [(1, 1), (9, 1), (13, 1), (15, 1)],
  term ((2935 : Rat) / 168) [(1, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2954048478533 : Rat) / 39470357304) [(1, 1), (9, 1), (13, 1), (15, 3)],
  term ((305 : Rat) / 28) [(1, 1), (9, 1), (13, 1), (15, 3), (16, 1)],
  term ((215402746805062 : Rat) / 725267815461) [(1, 1), (9, 1), (14, 1), (15, 2)],
  term ((-454 : Rat) / 21) [(1, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((-3366906314273 : Rat) / 29602767978) [(1, 1), (9, 1), (14, 2), (15, 2)],
  term ((65 : Rat) / 7) [(1, 1), (9, 1), (14, 2), (15, 2), (16, 1)],
  term ((-793129836375269699 : Rat) / 626631392558304) [(1, 1), (9, 1), (15, 2)],
  term ((-27 : Rat) / 2) [(1, 1), (9, 1), (15, 2), (16, 1)],
  term ((3366906314273 : Rat) / 29602767978) [(1, 1), (9, 1), (15, 4)],
  term ((-65 : Rat) / 7) [(1, 1), (9, 1), (15, 4), (16, 1)],
  term ((-67338253723 : Rat) / 2248311492) [(1, 1), (9, 2), (10, 1), (12, 1), (15, 1)],
  term ((2172201733 : Rat) / 166541592) [(1, 1), (9, 2), (10, 1), (14, 1), (15, 1)],
  term ((1457547362843 : Rat) / 8993245968) [(1, 1), (9, 2), (10, 1), (15, 1)],
  term ((-26387666788787755 : Rat) / 69625710284256) [(1, 1), (9, 2), (15, 1)],
  term ((112 : Rat) / 9) [(1, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((12678390449980907 : Rat) / 26109641356596) [(1, 2), (6, 1), (11, 2)],
  term ((-2224986028928059 : Rat) / 3197098941624) [(1, 2), (6, 1), (12, 1), (13, 1), (15, 1)],
  term ((1495 : Rat) / 252) [(1, 2), (6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1532199782809 : Rat) / 26861770943) [(1, 2), (6, 1), (12, 1), (14, 1), (15, 2)],
  term ((140138745041977 : Rat) / 330501789324) [(1, 2), (6, 1), (12, 1), (15, 2)],
  term ((-247 : Rat) / 63) [(1, 2), (6, 1), (12, 1), (15, 2), (16, 1)],
  term ((28425155928161 : Rat) / 483511876974) [(1, 2), (6, 1), (13, 1), (14, 1), (15, 1)],
  term ((27003763829248933 : Rat) / 13054820678298) [(1, 2), (6, 1), (13, 1), (15, 1)],
  term ((-289 : Rat) / 28) [(1, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-941242657 : Rat) / 166541592) [(1, 2), (6, 1), (13, 2)],
  term ((-725 : Rat) / 84) [(1, 2), (6, 1), (13, 2), (16, 1)],
  term ((-3021914984422465 : Rat) / 5802142523688) [(1, 2), (6, 1), (14, 1)],
  term ((4596599348427 : Rat) / 26861770943) [(1, 2), (6, 1), (14, 1), (15, 2)],
  term ((28425155928161 : Rat) / 967023753948) [(1, 2), (6, 1), (14, 2)],
  term ((-6909224935385495 : Rat) / 4351606892766) [(1, 2), (6, 1), (15, 2)],
  term ((247 : Rat) / 21) [(1, 2), (6, 1), (15, 2), (16, 1)],
  term ((-107532017845456895 : Rat) / 313315696279152) [(1, 2), (7, 1), (9, 1)],
  term ((12175190713465 : Rat) / 80939213712) [(1, 2), (7, 1), (9, 1), (10, 1)],
  term ((3849005354029 : Rat) / 2578730010528) [(1, 2), (7, 1), (9, 1), (12, 1)],
  term ((-53777198303881 : Rat) / 80939213712) [(1, 2), (7, 1), (9, 1), (12, 1), (14, 1)],
  term ((206185803715802887 : Rat) / 104438565426384) [(1, 2), (7, 1), (9, 1), (14, 1)],
  term ((-5063669429410409 : Rat) / 26109641356596) [(1, 2), (7, 1), (10, 1), (11, 1)],
  term ((-568121444666635 : Rat) / 3197098941624) [(1, 2), (7, 1), (10, 1), (13, 1)],
  term ((-9545 : Rat) / 252) [(1, 2), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((27248392831391255 : Rat) / 52219282713192) [(1, 2), (7, 1), (10, 1), (15, 1)],
  term ((2069 : Rat) / 63) [(1, 2), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-1237216831377703 : Rat) / 5802142523688) [(1, 2), (7, 1), (11, 1)],
  term ((166554 : Rat) / 553) [(1, 2), (7, 1), (11, 1), (12, 1)],
  term ((353060918012465 : Rat) / 6527410339149) [(1, 2), (7, 1), (11, 1), (12, 1), (14, 1)],
  term ((76343852153691455 : Rat) / 52219282713192) [(1, 2), (7, 1), (11, 1), (14, 1)],
  term ((941242657 : Rat) / 333083184) [(1, 2), (7, 1), (12, 1), (13, 1)],
  term ((2224986028928059 : Rat) / 3197098941624) [(1, 2), (7, 1), (12, 1), (13, 1), (14, 1)],
  term ((-1495 : Rat) / 252) [(1, 2), (7, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((725 : Rat) / 168) [(1, 2), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((-150142660556857 : Rat) / 330501789324) [(1, 2), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((247 : Rat) / 63) [(1, 2), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((1532199782809 : Rat) / 26861770943) [(1, 2), (7, 1), (12, 1), (14, 2), (15, 1)],
  term ((-148780745730977 : Rat) / 5802142523688) [(1, 2), (7, 1), (12, 1), (15, 1)],
  term ((-157 : Rat) / 42) [(1, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((5968601306100743 : Rat) / 39164462034894) [(1, 2), (7, 1), (13, 1)],
  term ((-9782145243569203 : Rat) / 5802142523688) [(1, 2), (7, 1), (13, 1), (14, 1)],
  term ((1495 : Rat) / 84) [(1, 2), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1532199782809 : Rat) / 53723541886) [(1, 2), (7, 1), (13, 1), (14, 2)],
  term ((-1835 : Rat) / 252) [(1, 2), (7, 1), (13, 1), (16, 1)],
  term ((14834145445646395 : Rat) / 8703213785532) [(1, 2), (7, 1), (14, 1), (15, 1)],
  term ((-247 : Rat) / 21) [(1, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4596599348427 : Rat) / 26861770943) [(1, 2), (7, 1), (14, 2), (15, 1)],
  term ((-8724500552915153 : Rat) / 8703213785532) [(1, 2), (7, 1), (15, 1)],
  term ((359 : Rat) / 63) [(1, 2), (7, 1), (15, 1), (16, 1)],
  term ((4593534948861382 : Rat) / 6527410339149) [(1, 2), (7, 2)],
  term ((-1349868008654729 : Rat) / 26109641356596) [(1, 2), (7, 2), (10, 1)],
  term ((1532199782809 : Rat) / 322341251316) [(1, 2), (7, 2), (12, 1)],
  term ((4349915183394751 : Rat) / 13054820678298) [(1, 2), (7, 2), (12, 1), (14, 1)],
  term ((-4349915183394751 : Rat) / 4351606892766) [(1, 2), (7, 2), (14, 1)],
  term ((-8367496511569 : Rat) / 26313571536) [(1, 2), (9, 1), (10, 1), (11, 1)],
  term ((4992 : Rat) / 553) [(1, 2), (9, 1), (10, 1), (11, 1), (12, 1)],
  term ((29952 : Rat) / 553) [(1, 2), (9, 1), (10, 1), (11, 1), (14, 1)],
  term ((-6090608323475 : Rat) / 532849823604) [(1, 2), (9, 1), (10, 1), (12, 1), (13, 1)],
  term ((5 : Rat) / 6) [(1, 2), (9, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((30188368622915 : Rat) / 355233215736) [(1, 2), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((-16 : Rat) / 21) [(1, 2), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((30905832934531 : Rat) / 355233215736) [(1, 2), (9, 1), (10, 1), (13, 1)],
  term ((8926828802611 : Rat) / 532849823604) [(1, 2), (9, 1), (10, 1), (13, 1), (14, 1)],
  term ((55 : Rat) / 28) [(1, 2), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1735 : Rat) / 168) [(1, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-170525183774905 : Rat) / 710466431472) [(1, 2), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((-11 : Rat) / 7) [(1, 2), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-8023330184610151 : Rat) / 8525597177664) [(1, 2), (9, 1), (10, 1), (15, 1)],
  term ((373 : Rat) / 42) [(1, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-25887226544513275 : Rat) / 25576791532992) [(1, 2), (9, 1), (11, 1)],
  term ((-16612902868000 : Rat) / 133212455901) [(1, 2), (9, 1), (11, 1), (12, 1)],
  term ((-4196237636816657 : Rat) / 25576791532992) [(1, 2), (9, 1), (11, 1), (14, 1)],
  term ((59904 : Rat) / 553) [(1, 2), (9, 1), (11, 1), (14, 2)],
  term ((-9008294618453 : Rat) / 236822143824) [(1, 2), (9, 1), (11, 1), (15, 2)],
  term ((97923607474811 : Rat) / 1065699647208) [(1, 2), (9, 1), (12, 1), (13, 1)],
  term ((-475 : Rat) / 84) [(1, 2), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((2172201733 : Rat) / 666166368) [(1, 2), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-10110568816218515 : Rat) / 139251420568512) [(1, 2), (9, 1), (12, 1), (15, 1)],
  term ((32 : Rat) / 7) [(1, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((4001812670359445 : Rat) / 25576791532992) [(1, 2), (9, 1), (13, 1)],
  term ((-15821421335342857 : Rat) / 25576791532992) [(1, 2), (9, 1), (13, 1), (14, 1)],
  term ((-1105 : Rat) / 84) [(1, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-6422908767787 : Rat) / 157881429216) [(1, 2), (9, 1), (13, 1), (14, 2)],
  term ((305 : Rat) / 56) [(1, 2), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((2954048478533 : Rat) / 78940714608) [(1, 2), (9, 1), (13, 1), (15, 2)],
  term ((-305 : Rat) / 56) [(1, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-2935 : Rat) / 336) [(1, 2), (9, 1), (13, 1), (16, 1)],
  term ((-107701373402531 : Rat) / 725267815461) [(1, 2), (9, 1), (14, 1), (15, 1)],
  term ((227 : Rat) / 21) [(1, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((3366906314273 : Rat) / 59205535956) [(1, 2), (9, 1), (14, 2), (15, 1)],
  term ((-65 : Rat) / 14) [(1, 2), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((793129836375269699 : Rat) / 1253262785116608) [(1, 2), (9, 1), (15, 1)],
  term ((27 : Rat) / 4) [(1, 2), (9, 1), (15, 1), (16, 1)],
  term ((-3366906314273 : Rat) / 59205535956) [(1, 2), (9, 1), (15, 3)],
  term ((65 : Rat) / 14) [(1, 2), (9, 1), (15, 3), (16, 1)],
  term ((26387666788787755 : Rat) / 139251420568512) [(1, 2), (9, 2)],
  term ((-1457547362843 : Rat) / 17986491936) [(1, 2), (9, 2), (10, 1)],
  term ((67338253723 : Rat) / 4496622984) [(1, 2), (9, 2), (10, 1), (12, 1)],
  term ((-2172201733 : Rat) / 333083184) [(1, 2), (9, 2), (10, 1), (14, 1)],
  term ((224 : Rat) / 9) [(6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-112 : Rat) / 9) [(6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-12678390449980907 : Rat) / 26109641356596) [(6, 1), (11, 2)],
  term ((12678390449980907 : Rat) / 13054820678298) [(6, 1), (11, 2), (14, 1)],
  term ((-2224986028928059 : Rat) / 1598549470812) [(6, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((1495 : Rat) / 126) [(6, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((2224986028928059 : Rat) / 3197098941624) [(6, 1), (12, 1), (13, 1), (15, 1)],
  term ((-1495 : Rat) / 252) [(6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((11815609952761357 : Rat) / 13054820678298) [(6, 1), (12, 1), (14, 1), (15, 2)],
  term ((-494 : Rat) / 63) [(6, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(6, 1), (12, 1), (14, 2), (15, 2)],
  term ((-140138745041977 : Rat) / 330501789324) [(6, 1), (12, 1), (15, 2)],
  term ((247 : Rat) / 63) [(6, 1), (12, 1), (15, 2), (16, 1)],
  term ((53240048448437519 : Rat) / 13054820678298) [(6, 1), (13, 1), (14, 1), (15, 1)],
  term ((-289 : Rat) / 14) [(6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((28425155928161 : Rat) / 241755938487) [(6, 1), (13, 1), (14, 2), (15, 1)],
  term ((-27003763829248933 : Rat) / 13054820678298) [(6, 1), (13, 1), (15, 1)],
  term ((289 : Rat) / 28) [(6, 1), (13, 1), (15, 1), (16, 1)],
  term ((941242657 : Rat) / 166541592) [(6, 1), (13, 2)],
  term ((-941242657 : Rat) / 83270796) [(6, 1), (13, 2), (14, 1)],
  term ((-725 : Rat) / 42) [(6, 1), (13, 2), (14, 1), (16, 1)],
  term ((725 : Rat) / 84) [(6, 1), (13, 2), (16, 1)],
  term ((3021914984422465 : Rat) / 5802142523688) [(6, 1), (14, 1)],
  term ((-7281549482608082 : Rat) / 2175803446383) [(6, 1), (14, 1), (15, 2)],
  term ((494 : Rat) / 21) [(6, 1), (14, 1), (15, 2), (16, 1)],
  term ((-776797613051737 : Rat) / 725267815461) [(6, 1), (14, 2)],
  term ((9193198696854 : Rat) / 26861770943) [(6, 1), (14, 2), (15, 2)],
  term ((28425155928161 : Rat) / 483511876974) [(6, 1), (14, 3)],
  term ((6909224935385495 : Rat) / 4351606892766) [(6, 1), (15, 2)],
  term ((-247 : Rat) / 21) [(6, 1), (15, 2), (16, 1)],
  term ((107532017845456895 : Rat) / 313315696279152) [(7, 1), (9, 1)],
  term ((-12175190713465 : Rat) / 80939213712) [(7, 1), (9, 1), (10, 1)],
  term ((12175190713465 : Rat) / 40469606856) [(7, 1), (9, 1), (10, 1), (14, 1)],
  term ((-3849005354029 : Rat) / 2578730010528) [(7, 1), (9, 1), (12, 1)],
  term ((104553421467676199 : Rat) / 156657848139576) [(7, 1), (9, 1), (12, 1), (14, 1)],
  term ((-53777198303881 : Rat) / 40469606856) [(7, 1), (9, 1), (12, 1), (14, 2)],
  term ((-833621446838322451 : Rat) / 313315696279152) [(7, 1), (9, 1), (14, 1)],
  term ((206185803715802887 : Rat) / 52219282713192) [(7, 1), (9, 1), (14, 2)],
  term ((5063669429410409 : Rat) / 26109641356596) [(7, 1), (10, 1), (11, 1)],
  term ((-5063669429410409 : Rat) / 13054820678298) [(7, 1), (10, 1), (11, 1), (14, 1)],
  term ((568121444666635 : Rat) / 3197098941624) [(7, 1), (10, 1), (13, 1)],
  term ((-568121444666635 : Rat) / 1598549470812) [(7, 1), (10, 1), (13, 1), (14, 1)],
  term ((-9545 : Rat) / 126) [(7, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((9545 : Rat) / 252) [(7, 1), (10, 1), (13, 1), (16, 1)],
  term ((27248392831391255 : Rat) / 26109641356596) [(7, 1), (10, 1), (14, 1), (15, 1)],
  term ((4138 : Rat) / 63) [(7, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-27248392831391255 : Rat) / 52219282713192) [(7, 1), (10, 1), (15, 1)],
  term ((-2069 : Rat) / 63) [(7, 1), (10, 1), (15, 1), (16, 1)],
  term ((1237216831377703 : Rat) / 5802142523688) [(7, 1), (11, 1)],
  term ((-166554 : Rat) / 553) [(7, 1), (11, 1), (12, 1)],
  term ((3578824440492499 : Rat) / 6527410339149) [(7, 1), (11, 1), (12, 1), (14, 1)],
  term ((706121836024930 : Rat) / 6527410339149) [(7, 1), (11, 1), (12, 1), (14, 2)],
  term ((-98613755118490109 : Rat) / 52219282713192) [(7, 1), (11, 1), (14, 1)],
  term ((76343852153691455 : Rat) / 26109641356596) [(7, 1), (11, 1), (14, 2)],
  term ((-941242657 : Rat) / 333083184) [(7, 1), (12, 1), (13, 1)],
  term ((-1103458496820815 : Rat) / 1598549470812) [(7, 1), (12, 1), (13, 1), (14, 1)],
  term ((1835 : Rat) / 126) [(7, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((2224986028928059 : Rat) / 1598549470812) [(7, 1), (12, 1), (13, 1), (14, 2)],
  term ((-1495 : Rat) / 126) [(7, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((-725 : Rat) / 168) [(7, 1), (12, 1), (13, 1), (16, 1)],
  term ((751588819458065 : Rat) / 1864974382614) [(7, 1), (12, 1), (14, 1), (15, 1)],
  term ((-718 : Rat) / 63) [(7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-12605919278436877 : Rat) / 13054820678298) [(7, 1), (12, 1), (14, 2), (15, 1)],
  term ((494 : Rat) / 63) [(7, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(7, 1), (12, 1), (14, 3), (15, 1)],
  term ((148780745730977 : Rat) / 5802142523688) [(7, 1), (12, 1), (15, 1)],
  term ((157 : Rat) / 42) [(7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-5968601306100743 : Rat) / 39164462034894) [(7, 1), (13, 1)],
  term ((311866732025174425 : Rat) / 156657848139576) [(7, 1), (13, 1), (14, 1)],
  term ((-1165 : Rat) / 36) [(7, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1385629493613931 : Rat) / 414438751692) [(7, 1), (13, 1), (14, 2)],
  term ((1495 : Rat) / 42) [(7, 1), (13, 1), (14, 2), (16, 1)],
  term ((-1532199782809 : Rat) / 26861770943) [(7, 1), (13, 1), (14, 3)],
  term ((1835 : Rat) / 252) [(7, 1), (13, 1), (16, 1)],
  term ((-32283146551476701 : Rat) / 8703213785532) [(7, 1), (14, 1), (15, 1)],
  term ((1459 : Rat) / 63) [(7, 1), (14, 1), (15, 1), (16, 1)],
  term ((15578794540091569 : Rat) / 4351606892766) [(7, 1), (14, 2), (15, 1)],
  term ((-494 : Rat) / 21) [(7, 1), (14, 2), (15, 1), (16, 1)],
  term ((-9193198696854 : Rat) / 26861770943) [(7, 1), (14, 3), (15, 1)],
  term ((8724500552915153 : Rat) / 8703213785532) [(7, 1), (15, 1)],
  term ((-359 : Rat) / 63) [(7, 1), (15, 1), (16, 1)],
  term ((-4593534948861382 : Rat) / 6527410339149) [(7, 2)],
  term ((1349868008654729 : Rat) / 26109641356596) [(7, 2), (10, 1)],
  term ((-1349868008654729 : Rat) / 13054820678298) [(7, 2), (10, 1), (14, 1)],
  term ((-1532199782809 : Rat) / 322341251316) [(7, 2), (12, 1)],
  term ((-301843357213373 : Rat) / 932487191307) [(7, 2), (12, 1), (14, 1)],
  term ((4349915183394751 : Rat) / 6527410339149) [(7, 2), (12, 1), (14, 2)],
  term ((31423885345629781 : Rat) / 13054820678298) [(7, 2), (14, 1)],
  term ((-4349915183394751 : Rat) / 2175803446383) [(7, 2), (14, 2)],
  term ((8367496511569 : Rat) / 26313571536) [(9, 1), (10, 1), (11, 1)],
  term ((-4992 : Rat) / 553) [(9, 1), (10, 1), (11, 1), (12, 1)],
  term ((9984 : Rat) / 553) [(9, 1), (10, 1), (11, 1), (12, 1), (14, 1)],
  term ((-9080104192081 : Rat) / 13156785768) [(9, 1), (10, 1), (11, 1), (14, 1)],
  term ((59904 : Rat) / 553) [(9, 1), (10, 1), (11, 1), (14, 2)],
  term ((6090608323475 : Rat) / 532849823604) [(9, 1), (10, 1), (12, 1), (13, 1)],
  term ((-6090608323475 : Rat) / 266424911802) [(9, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((5 : Rat) / 3) [(9, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-5 : Rat) / 6) [(9, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((30188368622915 : Rat) / 177616607868) [(9, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((-32 : Rat) / 21) [(9, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-30188368622915 : Rat) / 355233215736) [(9, 1), (10, 1), (12, 1), (15, 1)],
  term ((16 : Rat) / 21) [(9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-30905832934531 : Rat) / 355233215736) [(9, 1), (10, 1), (13, 1)],
  term ((5985047857213 : Rat) / 38060701686) [(9, 1), (10, 1), (13, 1), (14, 1)],
  term ((-475 : Rat) / 21) [(9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((8926828802611 : Rat) / 266424911802) [(9, 1), (10, 1), (13, 1), (14, 2)],
  term ((55 : Rat) / 14) [(9, 1), (10, 1), (13, 1), (14, 2), (16, 1)],
  term ((1735 : Rat) / 168) [(9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-7000179081960721 : Rat) / 4262798588832) [(9, 1), (10, 1), (14, 1), (15, 1)],
  term ((58 : Rat) / 3) [(9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-170525183774905 : Rat) / 355233215736) [(9, 1), (10, 1), (14, 2), (15, 1)],
  term ((-22 : Rat) / 7) [(9, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((8023330184610151 : Rat) / 8525597177664) [(9, 1), (10, 1), (15, 1)],
  term ((-373 : Rat) / 42) [(9, 1), (10, 1), (15, 1), (16, 1)],
  term ((25887226544513275 : Rat) / 25576791532992) [(9, 1), (11, 1)],
  term ((16612902868000 : Rat) / 133212455901) [(9, 1), (11, 1), (12, 1)],
  term ((-33225805736000 : Rat) / 133212455901) [(9, 1), (11, 1), (12, 1), (14, 1)],
  term ((-5286468383578877 : Rat) / 2841865725888) [(9, 1), (11, 1), (14, 1)],
  term ((-9008294618453 : Rat) / 118411071912) [(9, 1), (11, 1), (14, 1), (15, 2)],
  term ((-5581546967731985 : Rat) / 12788395766496) [(9, 1), (11, 1), (14, 2)],
  term ((119808 : Rat) / 553) [(9, 1), (11, 1), (14, 3)],
  term ((9008294618453 : Rat) / 236822143824) [(9, 1), (11, 1), (15, 2)],
  term ((-97923607474811 : Rat) / 1065699647208) [(9, 1), (12, 1), (13, 1)],
  term ((97923607474811 : Rat) / 532849823604) [(9, 1), (12, 1), (13, 1), (14, 1)],
  term ((-475 : Rat) / 42) [(9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((475 : Rat) / 84) [(9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-2584400206186619 : Rat) / 17406427571064) [(9, 1), (12, 1), (14, 1), (15, 1)],
  term ((64 : Rat) / 7) [(9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((2172201733 : Rat) / 333083184) [(9, 1), (12, 1), (14, 2), (15, 1)],
  term ((10110568816218515 : Rat) / 139251420568512) [(9, 1), (12, 1), (15, 1)],
  term ((-32 : Rat) / 7) [(9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-4001812670359445 : Rat) / 25576791532992) [(9, 1), (13, 1)],
  term ((23825046676061747 : Rat) / 25576791532992) [(9, 1), (13, 1), (14, 1)],
  term ((2954048478533 : Rat) / 39470357304) [(9, 1), (13, 1), (14, 1), (15, 2)],
  term ((-305 : Rat) / 28) [(9, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-725 : Rat) / 168) [(9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-7650582862576055 : Rat) / 6394197883248) [(9, 1), (13, 1), (14, 2)],
  term ((-5335 : Rat) / 168) [(9, 1), (13, 1), (14, 2), (16, 1)],
  term ((-6422908767787 : Rat) / 78940714608) [(9, 1), (13, 1), (14, 3)],
  term ((305 : Rat) / 28) [(9, 1), (13, 1), (14, 3), (16, 1)],
  term ((-2954048478533 : Rat) / 78940714608) [(9, 1), (13, 1), (15, 2)],
  term ((305 : Rat) / 56) [(9, 1), (13, 1), (15, 2), (16, 1)],
  term ((2935 : Rat) / 336) [(9, 1), (13, 1), (16, 1)],
  term ((886183822995056483 : Rat) / 626631392558304) [(9, 1), (14, 1), (15, 1)],
  term ((113 : Rat) / 42) [(9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3366906314273 : Rat) / 29602767978) [(9, 1), (14, 1), (15, 3)],
  term ((65 : Rat) / 7) [(9, 1), (14, 1), (15, 3), (16, 1)],
  term ((-342196465539875 : Rat) / 967023753948) [(9, 1), (14, 2), (15, 1)],
  term ((1103 : Rat) / 42) [(9, 1), (14, 2), (15, 1), (16, 1)],
  term ((3366906314273 : Rat) / 29602767978) [(9, 1), (14, 3), (15, 1)],
  term ((-65 : Rat) / 7) [(9, 1), (14, 3), (15, 1), (16, 1)],
  term ((-793129836375269699 : Rat) / 1253262785116608) [(9, 1), (15, 1)],
  term ((-27 : Rat) / 4) [(9, 1), (15, 1), (16, 1)],
  term ((3366906314273 : Rat) / 59205535956) [(9, 1), (15, 3)],
  term ((-65 : Rat) / 14) [(9, 1), (15, 3), (16, 1)],
  term ((-26387666788787755 : Rat) / 139251420568512) [(9, 2)],
  term ((1457547362843 : Rat) / 17986491936) [(9, 2), (10, 1)],
  term ((-67338253723 : Rat) / 4496622984) [(9, 2), (10, 1), (12, 1)],
  term ((67338253723 : Rat) / 2248311492) [(9, 2), (10, 1), (12, 1), (14, 1)],
  term ((-49960639859 : Rat) / 321187356) [(9, 2), (10, 1), (14, 1)],
  term ((-2172201733 : Rat) / 166541592) [(9, 2), (10, 1), (14, 2)],
  term ((26387666788787755 : Rat) / 69625710284256) [(9, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 28, terms 300 through 399. -/
theorem rs_R009_ueqv_R009YNNNN_block_28_0300_0399_valid :
    checkProductSumEq rs_R009_ueqv_R009YNNNN_partials_28_0300_0399
      rs_R009_ueqv_R009YNNNN_block_28_0300_0399 = true := by
  native_decide

end R009UeqvR009YNNNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
