/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009YNNNN, term block 27:300-399

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009YNNNNTermShards

/-- Generator polynomial 27 for relaxed split surplus certificate `R009:u=v:R009YNNNN`. -/
def rs_R009_ueqv_R009YNNNN_generator_27_0300_0399 : Poly :=
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
def rs_R009_ueqv_R009YNNNN_coefficient_27_0300 : Poly :=
[
  term ((-71946724318135 : Rat) / 11604285047376) [(6, 1), (9, 2)]
]

/-- Partial product 300 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0300 : Poly :=
[
  term ((71946724318135 : Rat) / 5802142523688) [(0, 1), (6, 1), (9, 2), (12, 1)],
  term ((-71946724318135 : Rat) / 11604285047376) [(0, 2), (6, 1), (9, 2)],
  term ((71946724318135 : Rat) / 5802142523688) [(1, 1), (6, 1), (9, 2), (13, 1)],
  term ((-71946724318135 : Rat) / 11604285047376) [(1, 2), (6, 1), (9, 2)],
  term ((-71946724318135 : Rat) / 5802142523688) [(6, 1), (9, 2), (12, 1), (14, 1)],
  term ((-71946724318135 : Rat) / 5802142523688) [(6, 1), (9, 2), (13, 1), (15, 1)],
  term ((71946724318135 : Rat) / 11604285047376) [(6, 1), (9, 2), (14, 2)],
  term ((71946724318135 : Rat) / 11604285047376) [(6, 1), (9, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 300 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0300_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0300
        rs_R009_ueqv_R009YNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_27_0300 := by
  native_decide

/-- Coefficient term 301 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0301 : Poly :=
[
  term ((2172201733 : Rat) / 333083184) [(6, 1), (9, 2), (12, 1)]
]

/-- Partial product 301 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0301 : Poly :=
[
  term ((-2172201733 : Rat) / 166541592) [(0, 1), (6, 1), (9, 2), (12, 2)],
  term ((2172201733 : Rat) / 333083184) [(0, 2), (6, 1), (9, 2), (12, 1)],
  term ((-2172201733 : Rat) / 166541592) [(1, 1), (6, 1), (9, 2), (12, 1), (13, 1)],
  term ((2172201733 : Rat) / 333083184) [(1, 2), (6, 1), (9, 2), (12, 1)],
  term ((2172201733 : Rat) / 166541592) [(6, 1), (9, 2), (12, 1), (13, 1), (15, 1)],
  term ((-2172201733 : Rat) / 333083184) [(6, 1), (9, 2), (12, 1), (14, 2)],
  term ((-2172201733 : Rat) / 333083184) [(6, 1), (9, 2), (12, 1), (15, 2)],
  term ((2172201733 : Rat) / 166541592) [(6, 1), (9, 2), (12, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 301 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0301_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0301
        rs_R009_ueqv_R009YNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_27_0301 := by
  native_decide

/-- Coefficient term 302 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0302 : Poly :=
[
  term ((209812062200357 : Rat) / 644682502632) [(6, 1), (10, 1)]
]

/-- Partial product 302 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0302 : Poly :=
[
  term ((-209812062200357 : Rat) / 322341251316) [(0, 1), (6, 1), (10, 1), (12, 1)],
  term ((209812062200357 : Rat) / 644682502632) [(0, 2), (6, 1), (10, 1)],
  term ((-209812062200357 : Rat) / 322341251316) [(1, 1), (6, 1), (10, 1), (13, 1)],
  term ((209812062200357 : Rat) / 644682502632) [(1, 2), (6, 1), (10, 1)],
  term ((209812062200357 : Rat) / 322341251316) [(6, 1), (10, 1), (12, 1), (14, 1)],
  term ((209812062200357 : Rat) / 322341251316) [(6, 1), (10, 1), (13, 1), (15, 1)],
  term ((-209812062200357 : Rat) / 644682502632) [(6, 1), (10, 1), (14, 2)],
  term ((-209812062200357 : Rat) / 644682502632) [(6, 1), (10, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 302 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0302_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0302
        rs_R009_ueqv_R009YNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_27_0302 := by
  native_decide

/-- Coefficient term 303 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0303 : Poly :=
[
  term ((1005180329591 : Rat) / 29602767978) [(6, 1), (10, 1), (14, 1)]
]

/-- Partial product 303 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0303 : Poly :=
[
  term ((-1005180329591 : Rat) / 14801383989) [(0, 1), (6, 1), (10, 1), (12, 1), (14, 1)],
  term ((1005180329591 : Rat) / 29602767978) [(0, 2), (6, 1), (10, 1), (14, 1)],
  term ((-1005180329591 : Rat) / 14801383989) [(1, 1), (6, 1), (10, 1), (13, 1), (14, 1)],
  term ((1005180329591 : Rat) / 29602767978) [(1, 2), (6, 1), (10, 1), (14, 1)],
  term ((1005180329591 : Rat) / 14801383989) [(6, 1), (10, 1), (12, 1), (14, 2)],
  term ((1005180329591 : Rat) / 14801383989) [(6, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-1005180329591 : Rat) / 29602767978) [(6, 1), (10, 1), (14, 1), (15, 2)],
  term ((-1005180329591 : Rat) / 29602767978) [(6, 1), (10, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 303 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0303_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0303
        rs_R009_ueqv_R009YNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_27_0303 := by
  native_decide

/-- Coefficient term 304 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0304 : Poly :=
[
  term ((-353060918012465 : Rat) / 6527410339149) [(6, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 304 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0304 : Poly :=
[
  term ((706121836024930 : Rat) / 6527410339149) [(0, 1), (6, 1), (11, 1), (12, 2), (15, 1)],
  term ((-353060918012465 : Rat) / 6527410339149) [(0, 2), (6, 1), (11, 1), (12, 1), (15, 1)],
  term ((706121836024930 : Rat) / 6527410339149) [(1, 1), (6, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-353060918012465 : Rat) / 6527410339149) [(1, 2), (6, 1), (11, 1), (12, 1), (15, 1)],
  term ((-706121836024930 : Rat) / 6527410339149) [(6, 1), (11, 1), (12, 1), (13, 1), (15, 2)],
  term ((353060918012465 : Rat) / 6527410339149) [(6, 1), (11, 1), (12, 1), (14, 2), (15, 1)],
  term ((353060918012465 : Rat) / 6527410339149) [(6, 1), (11, 1), (12, 1), (15, 3)],
  term ((-706121836024930 : Rat) / 6527410339149) [(6, 1), (11, 1), (12, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 304 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0304_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0304
        rs_R009_ueqv_R009YNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_27_0304 := by
  native_decide

/-- Coefficient term 305 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0305 : Poly :=
[
  term ((-22816977973072676 : Rat) / 19582231017447) [(6, 1), (11, 1), (13, 1)]
]

/-- Partial product 305 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0305 : Poly :=
[
  term ((45633955946145352 : Rat) / 19582231017447) [(0, 1), (6, 1), (11, 1), (12, 1), (13, 1)],
  term ((-22816977973072676 : Rat) / 19582231017447) [(0, 2), (6, 1), (11, 1), (13, 1)],
  term ((45633955946145352 : Rat) / 19582231017447) [(1, 1), (6, 1), (11, 1), (13, 2)],
  term ((-22816977973072676 : Rat) / 19582231017447) [(1, 2), (6, 1), (11, 1), (13, 1)],
  term ((-45633955946145352 : Rat) / 19582231017447) [(6, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((22816977973072676 : Rat) / 19582231017447) [(6, 1), (11, 1), (13, 1), (14, 2)],
  term ((22816977973072676 : Rat) / 19582231017447) [(6, 1), (11, 1), (13, 1), (15, 2)],
  term ((-45633955946145352 : Rat) / 19582231017447) [(6, 1), (11, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 305 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0305_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0305
        rs_R009_ueqv_R009YNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_27_0305 := by
  native_decide

/-- Coefficient term 306 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0306 : Poly :=
[
  term ((-170 : Rat) / 63) [(6, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 306 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0306 : Poly :=
[
  term ((340 : Rat) / 63) [(0, 1), (6, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-170 : Rat) / 63) [(0, 2), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((340 : Rat) / 63) [(1, 1), (6, 1), (11, 1), (13, 2), (16, 1)],
  term ((-170 : Rat) / 63) [(1, 2), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((-340 : Rat) / 63) [(6, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((170 : Rat) / 63) [(6, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((170 : Rat) / 63) [(6, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-340 : Rat) / 63) [(6, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 306 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0306_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0306
        rs_R009_ueqv_R009YNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_27_0306 := by
  native_decide

/-- Coefficient term 307 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0307 : Poly :=
[
  term ((-1532199782809 : Rat) / 26861770943) [(6, 1), (11, 1), (14, 1), (15, 1)]
]

/-- Partial product 307 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0307 : Poly :=
[
  term ((3064399565618 : Rat) / 26861770943) [(0, 1), (6, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-1532199782809 : Rat) / 26861770943) [(0, 2), (6, 1), (11, 1), (14, 1), (15, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(1, 1), (6, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-1532199782809 : Rat) / 26861770943) [(1, 2), (6, 1), (11, 1), (14, 1), (15, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(6, 1), (11, 1), (12, 1), (14, 2), (15, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(6, 1), (11, 1), (13, 1), (14, 1), (15, 2)],
  term ((1532199782809 : Rat) / 26861770943) [(6, 1), (11, 1), (14, 1), (15, 3)],
  term ((1532199782809 : Rat) / 26861770943) [(6, 1), (11, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 307 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0307_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0307
        rs_R009_ueqv_R009YNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_27_0307 := by
  native_decide

/-- Coefficient term 308 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0308 : Poly :=
[
  term ((4110502005449020 : Rat) / 6527410339149) [(6, 1), (11, 1), (15, 1)]
]

/-- Partial product 308 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0308 : Poly :=
[
  term ((-8221004010898040 : Rat) / 6527410339149) [(0, 1), (6, 1), (11, 1), (12, 1), (15, 1)],
  term ((4110502005449020 : Rat) / 6527410339149) [(0, 2), (6, 1), (11, 1), (15, 1)],
  term ((-8221004010898040 : Rat) / 6527410339149) [(1, 1), (6, 1), (11, 1), (13, 1), (15, 1)],
  term ((4110502005449020 : Rat) / 6527410339149) [(1, 2), (6, 1), (11, 1), (15, 1)],
  term ((8221004010898040 : Rat) / 6527410339149) [(6, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((8221004010898040 : Rat) / 6527410339149) [(6, 1), (11, 1), (13, 1), (15, 2)],
  term ((-4110502005449020 : Rat) / 6527410339149) [(6, 1), (11, 1), (14, 2), (15, 1)],
  term ((-4110502005449020 : Rat) / 6527410339149) [(6, 1), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 308 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0308_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0308
        rs_R009_ueqv_R009YNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_27_0308 := by
  native_decide

/-- Coefficient term 309 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0309 : Poly :=
[
  term ((32 : Rat) / 9) [(6, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 309 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0309 : Poly :=
[
  term ((-64 : Rat) / 9) [(0, 1), (6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((32 : Rat) / 9) [(0, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-64 : Rat) / 9) [(1, 1), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((32 : Rat) / 9) [(1, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((64 : Rat) / 9) [(6, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((64 : Rat) / 9) [(6, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-32 : Rat) / 9) [(6, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-32 : Rat) / 9) [(6, 1), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 309 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0309_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0309
        rs_R009_ueqv_R009YNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_27_0309 := by
  native_decide

/-- Coefficient term 310 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0310 : Poly :=
[
  term ((-3445707804341129 : Rat) / 6527410339149) [(6, 1), (11, 2)]
]

/-- Partial product 310 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0310 : Poly :=
[
  term ((6891415608682258 : Rat) / 6527410339149) [(0, 1), (6, 1), (11, 2), (12, 1)],
  term ((-3445707804341129 : Rat) / 6527410339149) [(0, 2), (6, 1), (11, 2)],
  term ((6891415608682258 : Rat) / 6527410339149) [(1, 1), (6, 1), (11, 2), (13, 1)],
  term ((-3445707804341129 : Rat) / 6527410339149) [(1, 2), (6, 1), (11, 2)],
  term ((-6891415608682258 : Rat) / 6527410339149) [(6, 1), (11, 2), (12, 1), (14, 1)],
  term ((-6891415608682258 : Rat) / 6527410339149) [(6, 1), (11, 2), (13, 1), (15, 1)],
  term ((3445707804341129 : Rat) / 6527410339149) [(6, 1), (11, 2), (14, 2)],
  term ((3445707804341129 : Rat) / 6527410339149) [(6, 1), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 310 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0310_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0310
        rs_R009_ueqv_R009YNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_27_0310 := by
  native_decide

/-- Coefficient term 311 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0311 : Poly :=
[
  term ((-2224986028928059 : Rat) / 3197098941624) [(6, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 311 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0311 : Poly :=
[
  term ((2224986028928059 : Rat) / 1598549470812) [(0, 1), (6, 1), (12, 2), (13, 1), (15, 1)],
  term ((-2224986028928059 : Rat) / 3197098941624) [(0, 2), (6, 1), (12, 1), (13, 1), (15, 1)],
  term ((2224986028928059 : Rat) / 1598549470812) [(1, 1), (6, 1), (12, 1), (13, 2), (15, 1)],
  term ((-2224986028928059 : Rat) / 3197098941624) [(1, 2), (6, 1), (12, 1), (13, 1), (15, 1)],
  term ((2224986028928059 : Rat) / 3197098941624) [(6, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((2224986028928059 : Rat) / 3197098941624) [(6, 1), (12, 1), (13, 1), (15, 3)],
  term ((-2224986028928059 : Rat) / 1598549470812) [(6, 1), (12, 1), (13, 2), (15, 2)],
  term ((-2224986028928059 : Rat) / 1598549470812) [(6, 1), (12, 2), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 311 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0311_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0311
        rs_R009_ueqv_R009YNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_27_0311 := by
  native_decide

/-- Coefficient term 312 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0312 : Poly :=
[
  term ((1495 : Rat) / 252) [(6, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 312 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0312 : Poly :=
[
  term ((-1495 : Rat) / 126) [(0, 1), (6, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((1495 : Rat) / 252) [(0, 2), (6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1495 : Rat) / 126) [(1, 1), (6, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((1495 : Rat) / 252) [(1, 2), (6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1495 : Rat) / 252) [(6, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1495 : Rat) / 252) [(6, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((1495 : Rat) / 126) [(6, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((1495 : Rat) / 126) [(6, 1), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 312 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0312_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0312
        rs_R009_ueqv_R009YNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_27_0312 := by
  native_decide

/-- Coefficient term 313 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0313 : Poly :=
[
  term ((-1532199782809 : Rat) / 26861770943) [(6, 1), (12, 1), (14, 1), (15, 2)]
]

/-- Partial product 313 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0313 : Poly :=
[
  term ((3064399565618 : Rat) / 26861770943) [(0, 1), (6, 1), (12, 2), (14, 1), (15, 2)],
  term ((-1532199782809 : Rat) / 26861770943) [(0, 2), (6, 1), (12, 1), (14, 1), (15, 2)],
  term ((3064399565618 : Rat) / 26861770943) [(1, 1), (6, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((-1532199782809 : Rat) / 26861770943) [(1, 2), (6, 1), (12, 1), (14, 1), (15, 2)],
  term ((-3064399565618 : Rat) / 26861770943) [(6, 1), (12, 1), (13, 1), (14, 1), (15, 3)],
  term ((1532199782809 : Rat) / 26861770943) [(6, 1), (12, 1), (14, 1), (15, 4)],
  term ((1532199782809 : Rat) / 26861770943) [(6, 1), (12, 1), (14, 3), (15, 2)],
  term ((-3064399565618 : Rat) / 26861770943) [(6, 1), (12, 2), (14, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 313 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0313_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0313
        rs_R009_ueqv_R009YNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_27_0313 := by
  native_decide

/-- Coefficient term 314 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0314 : Poly :=
[
  term ((140138745041977 : Rat) / 330501789324) [(6, 1), (12, 1), (15, 2)]
]

/-- Partial product 314 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0314 : Poly :=
[
  term ((-140138745041977 : Rat) / 165250894662) [(0, 1), (6, 1), (12, 2), (15, 2)],
  term ((140138745041977 : Rat) / 330501789324) [(0, 2), (6, 1), (12, 1), (15, 2)],
  term ((-140138745041977 : Rat) / 165250894662) [(1, 1), (6, 1), (12, 1), (13, 1), (15, 2)],
  term ((140138745041977 : Rat) / 330501789324) [(1, 2), (6, 1), (12, 1), (15, 2)],
  term ((140138745041977 : Rat) / 165250894662) [(6, 1), (12, 1), (13, 1), (15, 3)],
  term ((-140138745041977 : Rat) / 330501789324) [(6, 1), (12, 1), (14, 2), (15, 2)],
  term ((-140138745041977 : Rat) / 330501789324) [(6, 1), (12, 1), (15, 4)],
  term ((140138745041977 : Rat) / 165250894662) [(6, 1), (12, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 314 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0314_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0314
        rs_R009_ueqv_R009YNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_27_0314 := by
  native_decide

/-- Coefficient term 315 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0315 : Poly :=
[
  term ((-247 : Rat) / 63) [(6, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 315 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0315 : Poly :=
[
  term ((494 : Rat) / 63) [(0, 1), (6, 1), (12, 2), (15, 2), (16, 1)],
  term ((-247 : Rat) / 63) [(0, 2), (6, 1), (12, 1), (15, 2), (16, 1)],
  term ((494 : Rat) / 63) [(1, 1), (6, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-247 : Rat) / 63) [(1, 2), (6, 1), (12, 1), (15, 2), (16, 1)],
  term ((-494 : Rat) / 63) [(6, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((247 : Rat) / 63) [(6, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((247 : Rat) / 63) [(6, 1), (12, 1), (15, 4), (16, 1)],
  term ((-494 : Rat) / 63) [(6, 1), (12, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 315 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0315_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0315
        rs_R009_ueqv_R009YNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_27_0315 := by
  native_decide

/-- Coefficient term 316 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0316 : Poly :=
[
  term ((845559837599 : Rat) / 483511876974) [(6, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 316 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0316 : Poly :=
[
  term ((-845559837599 : Rat) / 241755938487) [(0, 1), (6, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((845559837599 : Rat) / 483511876974) [(0, 2), (6, 1), (13, 1), (14, 1), (15, 1)],
  term ((-845559837599 : Rat) / 241755938487) [(1, 1), (6, 1), (13, 2), (14, 1), (15, 1)],
  term ((845559837599 : Rat) / 483511876974) [(1, 2), (6, 1), (13, 1), (14, 1), (15, 1)],
  term ((845559837599 : Rat) / 241755938487) [(6, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((-845559837599 : Rat) / 483511876974) [(6, 1), (13, 1), (14, 1), (15, 3)],
  term ((-845559837599 : Rat) / 483511876974) [(6, 1), (13, 1), (14, 3), (15, 1)],
  term ((845559837599 : Rat) / 241755938487) [(6, 1), (13, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 316 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0316_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0316
        rs_R009_ueqv_R009YNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_27_0316 := by
  native_decide

/-- Coefficient term 317 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0317 : Poly :=
[
  term ((21692829505604683 : Rat) / 8703213785532) [(6, 1), (13, 1), (15, 1)]
]

/-- Partial product 317 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0317 : Poly :=
[
  term ((-21692829505604683 : Rat) / 4351606892766) [(0, 1), (6, 1), (12, 1), (13, 1), (15, 1)],
  term ((21692829505604683 : Rat) / 8703213785532) [(0, 2), (6, 1), (13, 1), (15, 1)],
  term ((-21692829505604683 : Rat) / 4351606892766) [(1, 1), (6, 1), (13, 2), (15, 1)],
  term ((21692829505604683 : Rat) / 8703213785532) [(1, 2), (6, 1), (13, 1), (15, 1)],
  term ((21692829505604683 : Rat) / 4351606892766) [(6, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-21692829505604683 : Rat) / 8703213785532) [(6, 1), (13, 1), (14, 2), (15, 1)],
  term ((-21692829505604683 : Rat) / 8703213785532) [(6, 1), (13, 1), (15, 3)],
  term ((21692829505604683 : Rat) / 4351606892766) [(6, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 317 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0317_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0317
        rs_R009_ueqv_R009YNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_27_0317 := by
  native_decide

/-- Coefficient term 318 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0318 : Poly :=
[
  term ((-3589 : Rat) / 252) [(6, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 318 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0318 : Poly :=
[
  term ((3589 : Rat) / 126) [(0, 1), (6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3589 : Rat) / 252) [(0, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((3589 : Rat) / 126) [(1, 1), (6, 1), (13, 2), (15, 1), (16, 1)],
  term ((-3589 : Rat) / 252) [(1, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3589 : Rat) / 126) [(6, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((3589 : Rat) / 252) [(6, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((3589 : Rat) / 252) [(6, 1), (13, 1), (15, 3), (16, 1)],
  term ((-3589 : Rat) / 126) [(6, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 318 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0318_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0318
        rs_R009_ueqv_R009YNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_27_0318 := by
  native_decide

/-- Coefficient term 319 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0319 : Poly :=
[
  term ((-280381883026811 : Rat) / 399637367703) [(6, 1), (13, 2)]
]

/-- Partial product 319 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0319 : Poly :=
[
  term ((560763766053622 : Rat) / 399637367703) [(0, 1), (6, 1), (12, 1), (13, 2)],
  term ((-280381883026811 : Rat) / 399637367703) [(0, 2), (6, 1), (13, 2)],
  term ((560763766053622 : Rat) / 399637367703) [(1, 1), (6, 1), (13, 3)],
  term ((-280381883026811 : Rat) / 399637367703) [(1, 2), (6, 1), (13, 2)],
  term ((-560763766053622 : Rat) / 399637367703) [(6, 1), (12, 1), (13, 2), (14, 1)],
  term ((280381883026811 : Rat) / 399637367703) [(6, 1), (13, 2), (14, 2)],
  term ((280381883026811 : Rat) / 399637367703) [(6, 1), (13, 2), (15, 2)],
  term ((-560763766053622 : Rat) / 399637367703) [(6, 1), (13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 319 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0319_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0319
        rs_R009_ueqv_R009YNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_27_0319 := by
  native_decide

/-- Coefficient term 320 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0320 : Poly :=
[
  term ((-170 : Rat) / 63) [(6, 1), (13, 2), (16, 1)]
]

/-- Partial product 320 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0320 : Poly :=
[
  term ((340 : Rat) / 63) [(0, 1), (6, 1), (12, 1), (13, 2), (16, 1)],
  term ((-170 : Rat) / 63) [(0, 2), (6, 1), (13, 2), (16, 1)],
  term ((340 : Rat) / 63) [(1, 1), (6, 1), (13, 3), (16, 1)],
  term ((-170 : Rat) / 63) [(1, 2), (6, 1), (13, 2), (16, 1)],
  term ((-340 : Rat) / 63) [(6, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((170 : Rat) / 63) [(6, 1), (13, 2), (14, 2), (16, 1)],
  term ((170 : Rat) / 63) [(6, 1), (13, 2), (15, 2), (16, 1)],
  term ((-340 : Rat) / 63) [(6, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 320 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0320_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0320
        rs_R009_ueqv_R009YNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_27_0320 := by
  native_decide

/-- Coefficient term 321 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0321 : Poly :=
[
  term ((-2944249555176373 : Rat) / 5802142523688) [(6, 1), (14, 1)]
]

/-- Partial product 321 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0321 : Poly :=
[
  term ((2944249555176373 : Rat) / 2901071261844) [(0, 1), (6, 1), (12, 1), (14, 1)],
  term ((-2944249555176373 : Rat) / 5802142523688) [(0, 2), (6, 1), (14, 1)],
  term ((2944249555176373 : Rat) / 2901071261844) [(1, 1), (6, 1), (13, 1), (14, 1)],
  term ((-2944249555176373 : Rat) / 5802142523688) [(1, 2), (6, 1), (14, 1)],
  term ((-2944249555176373 : Rat) / 2901071261844) [(6, 1), (12, 1), (14, 2)],
  term ((-2944249555176373 : Rat) / 2901071261844) [(6, 1), (13, 1), (14, 1), (15, 1)],
  term ((2944249555176373 : Rat) / 5802142523688) [(6, 1), (14, 1), (15, 2)],
  term ((2944249555176373 : Rat) / 5802142523688) [(6, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 321 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0321_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0321
        rs_R009_ueqv_R009YNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_27_0321 := by
  native_decide

/-- Coefficient term 322 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0322 : Poly :=
[
  term ((4596599348427 : Rat) / 26861770943) [(6, 1), (14, 1), (15, 2)]
]

/-- Partial product 322 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0322 : Poly :=
[
  term ((-9193198696854 : Rat) / 26861770943) [(0, 1), (6, 1), (12, 1), (14, 1), (15, 2)],
  term ((4596599348427 : Rat) / 26861770943) [(0, 2), (6, 1), (14, 1), (15, 2)],
  term ((-9193198696854 : Rat) / 26861770943) [(1, 1), (6, 1), (13, 1), (14, 1), (15, 2)],
  term ((4596599348427 : Rat) / 26861770943) [(1, 2), (6, 1), (14, 1), (15, 2)],
  term ((9193198696854 : Rat) / 26861770943) [(6, 1), (12, 1), (14, 2), (15, 2)],
  term ((9193198696854 : Rat) / 26861770943) [(6, 1), (13, 1), (14, 1), (15, 3)],
  term ((-4596599348427 : Rat) / 26861770943) [(6, 1), (14, 1), (15, 4)],
  term ((-4596599348427 : Rat) / 26861770943) [(6, 1), (14, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 322 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0322_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0322
        rs_R009_ueqv_R009YNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_27_0322 := by
  native_decide

/-- Coefficient term 323 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0323 : Poly :=
[
  term ((28425155928161 : Rat) / 967023753948) [(6, 1), (14, 2)]
]

/-- Partial product 323 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0323 : Poly :=
[
  term ((-28425155928161 : Rat) / 483511876974) [(0, 1), (6, 1), (12, 1), (14, 2)],
  term ((28425155928161 : Rat) / 967023753948) [(0, 2), (6, 1), (14, 2)],
  term ((-28425155928161 : Rat) / 483511876974) [(1, 1), (6, 1), (13, 1), (14, 2)],
  term ((28425155928161 : Rat) / 967023753948) [(1, 2), (6, 1), (14, 2)],
  term ((28425155928161 : Rat) / 483511876974) [(6, 1), (12, 1), (14, 3)],
  term ((28425155928161 : Rat) / 483511876974) [(6, 1), (13, 1), (14, 2), (15, 1)],
  term ((-28425155928161 : Rat) / 967023753948) [(6, 1), (14, 2), (15, 2)],
  term ((-28425155928161 : Rat) / 967023753948) [(6, 1), (14, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 323 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0323_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0323
        rs_R009_ueqv_R009YNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_27_0323 := by
  native_decide

/-- Coefficient term 324 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0324 : Poly :=
[
  term ((-6290114302379351 : Rat) / 4351606892766) [(6, 1), (15, 2)]
]

/-- Partial product 324 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0324 : Poly :=
[
  term ((6290114302379351 : Rat) / 2175803446383) [(0, 1), (6, 1), (12, 1), (15, 2)],
  term ((-6290114302379351 : Rat) / 4351606892766) [(0, 2), (6, 1), (15, 2)],
  term ((6290114302379351 : Rat) / 2175803446383) [(1, 1), (6, 1), (13, 1), (15, 2)],
  term ((-6290114302379351 : Rat) / 4351606892766) [(1, 2), (6, 1), (15, 2)],
  term ((-6290114302379351 : Rat) / 2175803446383) [(6, 1), (12, 1), (14, 1), (15, 2)],
  term ((-6290114302379351 : Rat) / 2175803446383) [(6, 1), (13, 1), (15, 3)],
  term ((6290114302379351 : Rat) / 4351606892766) [(6, 1), (14, 2), (15, 2)],
  term ((6290114302379351 : Rat) / 4351606892766) [(6, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 324 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0324_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0324
        rs_R009_ueqv_R009YNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_27_0324 := by
  native_decide

/-- Coefficient term 325 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0325 : Poly :=
[
  term ((247 : Rat) / 21) [(6, 1), (15, 2), (16, 1)]
]

/-- Partial product 325 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0325 : Poly :=
[
  term ((-494 : Rat) / 21) [(0, 1), (6, 1), (12, 1), (15, 2), (16, 1)],
  term ((247 : Rat) / 21) [(0, 2), (6, 1), (15, 2), (16, 1)],
  term ((-494 : Rat) / 21) [(1, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((247 : Rat) / 21) [(1, 2), (6, 1), (15, 2), (16, 1)],
  term ((494 : Rat) / 21) [(6, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((494 : Rat) / 21) [(6, 1), (13, 1), (15, 3), (16, 1)],
  term ((-247 : Rat) / 21) [(6, 1), (14, 2), (15, 2), (16, 1)],
  term ((-247 : Rat) / 21) [(6, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 325 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0325_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0325
        rs_R009_ueqv_R009YNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_27_0325 := by
  native_decide

/-- Coefficient term 326 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0326 : Poly :=
[
  term ((-1150854976623484333 : Rat) / 626631392558304) [(7, 1), (9, 1)]
]

/-- Partial product 326 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0326 : Poly :=
[
  term ((1150854976623484333 : Rat) / 313315696279152) [(0, 1), (7, 1), (9, 1), (12, 1)],
  term ((-1150854976623484333 : Rat) / 626631392558304) [(0, 2), (7, 1), (9, 1)],
  term ((1150854976623484333 : Rat) / 313315696279152) [(1, 1), (7, 1), (9, 1), (13, 1)],
  term ((-1150854976623484333 : Rat) / 626631392558304) [(1, 2), (7, 1), (9, 1)],
  term ((-1150854976623484333 : Rat) / 313315696279152) [(7, 1), (9, 1), (12, 1), (14, 1)],
  term ((-1150854976623484333 : Rat) / 313315696279152) [(7, 1), (9, 1), (13, 1), (15, 1)],
  term ((1150854976623484333 : Rat) / 626631392558304) [(7, 1), (9, 1), (14, 2)],
  term ((1150854976623484333 : Rat) / 626631392558304) [(7, 1), (9, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 326 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0326_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0326
        rs_R009_ueqv_R009YNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_27_0326 := by
  native_decide

/-- Coefficient term 327 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0327 : Poly :=
[
  term ((69282374274035 : Rat) / 80939213712) [(7, 1), (9, 1), (10, 1)]
]

/-- Partial product 327 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0327 : Poly :=
[
  term ((-69282374274035 : Rat) / 40469606856) [(0, 1), (7, 1), (9, 1), (10, 1), (12, 1)],
  term ((69282374274035 : Rat) / 80939213712) [(0, 2), (7, 1), (9, 1), (10, 1)],
  term ((-69282374274035 : Rat) / 40469606856) [(1, 1), (7, 1), (9, 1), (10, 1), (13, 1)],
  term ((69282374274035 : Rat) / 80939213712) [(1, 2), (7, 1), (9, 1), (10, 1)],
  term ((69282374274035 : Rat) / 40469606856) [(7, 1), (9, 1), (10, 1), (12, 1), (14, 1)],
  term ((69282374274035 : Rat) / 40469606856) [(7, 1), (9, 1), (10, 1), (13, 1), (15, 1)],
  term ((-69282374274035 : Rat) / 80939213712) [(7, 1), (9, 1), (10, 1), (14, 2)],
  term ((-69282374274035 : Rat) / 80939213712) [(7, 1), (9, 1), (10, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 327 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0327_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0327
        rs_R009_ueqv_R009YNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_27_0327 := by
  native_decide

/-- Coefficient term 328 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0328 : Poly :=
[
  term ((3849005354029 : Rat) / 2578730010528) [(7, 1), (9, 1), (12, 1)]
]

/-- Partial product 328 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0328 : Poly :=
[
  term ((-3849005354029 : Rat) / 1289365005264) [(0, 1), (7, 1), (9, 1), (12, 2)],
  term ((3849005354029 : Rat) / 2578730010528) [(0, 2), (7, 1), (9, 1), (12, 1)],
  term ((-3849005354029 : Rat) / 1289365005264) [(1, 1), (7, 1), (9, 1), (12, 1), (13, 1)],
  term ((3849005354029 : Rat) / 2578730010528) [(1, 2), (7, 1), (9, 1), (12, 1)],
  term ((3849005354029 : Rat) / 1289365005264) [(7, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((-3849005354029 : Rat) / 2578730010528) [(7, 1), (9, 1), (12, 1), (14, 2)],
  term ((-3849005354029 : Rat) / 2578730010528) [(7, 1), (9, 1), (12, 1), (15, 2)],
  term ((3849005354029 : Rat) / 1289365005264) [(7, 1), (9, 1), (12, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 328 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0328_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0328
        rs_R009_ueqv_R009YNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_27_0328 := by
  native_decide

/-- Coefficient term 329 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0329 : Poly :=
[
  term ((-53777198303881 : Rat) / 80939213712) [(7, 1), (9, 1), (12, 1), (14, 1)]
]

/-- Partial product 329 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0329 : Poly :=
[
  term ((53777198303881 : Rat) / 40469606856) [(0, 1), (7, 1), (9, 1), (12, 2), (14, 1)],
  term ((-53777198303881 : Rat) / 80939213712) [(0, 2), (7, 1), (9, 1), (12, 1), (14, 1)],
  term ((53777198303881 : Rat) / 40469606856) [(1, 1), (7, 1), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((-53777198303881 : Rat) / 80939213712) [(1, 2), (7, 1), (9, 1), (12, 1), (14, 1)],
  term ((-53777198303881 : Rat) / 40469606856) [(7, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((53777198303881 : Rat) / 80939213712) [(7, 1), (9, 1), (12, 1), (14, 1), (15, 2)],
  term ((53777198303881 : Rat) / 80939213712) [(7, 1), (9, 1), (12, 1), (14, 3)],
  term ((-53777198303881 : Rat) / 40469606856) [(7, 1), (9, 1), (12, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 329 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0329_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0329
        rs_R009_ueqv_R009YNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_27_0329 := by
  native_decide

/-- Coefficient term 330 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0330 : Poly :=
[
  term ((206185803715802887 : Rat) / 104438565426384) [(7, 1), (9, 1), (14, 1)]
]

/-- Partial product 330 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0330 : Poly :=
[
  term ((-206185803715802887 : Rat) / 52219282713192) [(0, 1), (7, 1), (9, 1), (12, 1), (14, 1)],
  term ((206185803715802887 : Rat) / 104438565426384) [(0, 2), (7, 1), (9, 1), (14, 1)],
  term ((-206185803715802887 : Rat) / 52219282713192) [(1, 1), (7, 1), (9, 1), (13, 1), (14, 1)],
  term ((206185803715802887 : Rat) / 104438565426384) [(1, 2), (7, 1), (9, 1), (14, 1)],
  term ((206185803715802887 : Rat) / 52219282713192) [(7, 1), (9, 1), (12, 1), (14, 2)],
  term ((206185803715802887 : Rat) / 52219282713192) [(7, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((-206185803715802887 : Rat) / 104438565426384) [(7, 1), (9, 1), (14, 1), (15, 2)],
  term ((-206185803715802887 : Rat) / 104438565426384) [(7, 1), (9, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 330 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0330_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0330
        rs_R009_ueqv_R009YNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_27_0330 := by
  native_decide

/-- Coefficient term 331 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0331 : Poly :=
[
  term ((36984430141213349 : Rat) / 26109641356596) [(7, 1), (10, 1), (11, 1)]
]

/-- Partial product 331 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0331 : Poly :=
[
  term ((-36984430141213349 : Rat) / 13054820678298) [(0, 1), (7, 1), (10, 1), (11, 1), (12, 1)],
  term ((36984430141213349 : Rat) / 26109641356596) [(0, 2), (7, 1), (10, 1), (11, 1)],
  term ((-36984430141213349 : Rat) / 13054820678298) [(1, 1), (7, 1), (10, 1), (11, 1), (13, 1)],
  term ((36984430141213349 : Rat) / 26109641356596) [(1, 2), (7, 1), (10, 1), (11, 1)],
  term ((36984430141213349 : Rat) / 13054820678298) [(7, 1), (10, 1), (11, 1), (12, 1), (14, 1)],
  term ((36984430141213349 : Rat) / 13054820678298) [(7, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((-36984430141213349 : Rat) / 26109641356596) [(7, 1), (10, 1), (11, 1), (14, 2)],
  term ((-36984430141213349 : Rat) / 26109641356596) [(7, 1), (10, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 331 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0331_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0331
        rs_R009_ueqv_R009YNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_27_0331 := by
  native_decide

/-- Coefficient term 332 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0332 : Poly :=
[
  term ((-2796461151655097 : Rat) / 3197098941624) [(7, 1), (10, 1), (13, 1)]
]

/-- Partial product 332 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0332 : Poly :=
[
  term ((2796461151655097 : Rat) / 1598549470812) [(0, 1), (7, 1), (10, 1), (12, 1), (13, 1)],
  term ((-2796461151655097 : Rat) / 3197098941624) [(0, 2), (7, 1), (10, 1), (13, 1)],
  term ((2796461151655097 : Rat) / 1598549470812) [(1, 1), (7, 1), (10, 1), (13, 2)],
  term ((-2796461151655097 : Rat) / 3197098941624) [(1, 2), (7, 1), (10, 1), (13, 1)],
  term ((-2796461151655097 : Rat) / 1598549470812) [(7, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((2796461151655097 : Rat) / 3197098941624) [(7, 1), (10, 1), (13, 1), (14, 2)],
  term ((2796461151655097 : Rat) / 3197098941624) [(7, 1), (10, 1), (13, 1), (15, 2)],
  term ((-2796461151655097 : Rat) / 1598549470812) [(7, 1), (10, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 332 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0332_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0332
        rs_R009_ueqv_R009YNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_27_0332 := by
  native_decide

/-- Coefficient term 333 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0333 : Poly :=
[
  term ((8525 : Rat) / 252) [(7, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 333 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0333 : Poly :=
[
  term ((-8525 : Rat) / 126) [(0, 1), (7, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((8525 : Rat) / 252) [(0, 2), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((-8525 : Rat) / 126) [(1, 1), (7, 1), (10, 1), (13, 2), (16, 1)],
  term ((8525 : Rat) / 252) [(1, 2), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((8525 : Rat) / 126) [(7, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-8525 : Rat) / 252) [(7, 1), (10, 1), (13, 1), (14, 2), (16, 1)],
  term ((-8525 : Rat) / 252) [(7, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((8525 : Rat) / 126) [(7, 1), (10, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 333 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0333_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0333
        rs_R009_ueqv_R009YNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_27_0333 := by
  native_decide

/-- Coefficient term 334 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0334 : Poly :=
[
  term ((2335788672963988 : Rat) / 6527410339149) [(7, 1), (10, 1), (15, 1)]
]

/-- Partial product 334 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0334 : Poly :=
[
  term ((-4671577345927976 : Rat) / 6527410339149) [(0, 1), (7, 1), (10, 1), (12, 1), (15, 1)],
  term ((2335788672963988 : Rat) / 6527410339149) [(0, 2), (7, 1), (10, 1), (15, 1)],
  term ((-4671577345927976 : Rat) / 6527410339149) [(1, 1), (7, 1), (10, 1), (13, 1), (15, 1)],
  term ((2335788672963988 : Rat) / 6527410339149) [(1, 2), (7, 1), (10, 1), (15, 1)],
  term ((4671577345927976 : Rat) / 6527410339149) [(7, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((4671577345927976 : Rat) / 6527410339149) [(7, 1), (10, 1), (13, 1), (15, 2)],
  term ((-2335788672963988 : Rat) / 6527410339149) [(7, 1), (10, 1), (14, 2), (15, 1)],
  term ((-2335788672963988 : Rat) / 6527410339149) [(7, 1), (10, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 334 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0334_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0334
        rs_R009_ueqv_R009YNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_27_0334 := by
  native_decide

/-- Coefficient term 335 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0335 : Poly :=
[
  term ((-1733 : Rat) / 63) [(7, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 335 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0335 : Poly :=
[
  term ((3466 : Rat) / 63) [(0, 1), (7, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1733 : Rat) / 63) [(0, 2), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((3466 : Rat) / 63) [(1, 1), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1733 : Rat) / 63) [(1, 2), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-3466 : Rat) / 63) [(7, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3466 : Rat) / 63) [(7, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((1733 : Rat) / 63) [(7, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((1733 : Rat) / 63) [(7, 1), (10, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 335 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0335_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0335
        rs_R009_ueqv_R009YNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_27_0335 := by
  native_decide

/-- Coefficient term 336 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0336 : Poly :=
[
  term ((430369017280645 : Rat) / 8703213785532) [(7, 1), (11, 1)]
]

/-- Partial product 336 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0336 : Poly :=
[
  term ((-430369017280645 : Rat) / 4351606892766) [(0, 1), (7, 1), (11, 1), (12, 1)],
  term ((430369017280645 : Rat) / 8703213785532) [(0, 2), (7, 1), (11, 1)],
  term ((-430369017280645 : Rat) / 4351606892766) [(1, 1), (7, 1), (11, 1), (13, 1)],
  term ((430369017280645 : Rat) / 8703213785532) [(1, 2), (7, 1), (11, 1)],
  term ((430369017280645 : Rat) / 4351606892766) [(7, 1), (11, 1), (12, 1), (14, 1)],
  term ((430369017280645 : Rat) / 4351606892766) [(7, 1), (11, 1), (13, 1), (15, 1)],
  term ((-430369017280645 : Rat) / 8703213785532) [(7, 1), (11, 1), (14, 2)],
  term ((-430369017280645 : Rat) / 8703213785532) [(7, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 336 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0336_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0336
        rs_R009_ueqv_R009YNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_27_0336 := by
  native_decide

/-- Coefficient term 337 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0337 : Poly :=
[
  term ((166554 : Rat) / 553) [(7, 1), (11, 1), (12, 1)]
]

/-- Partial product 337 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0337 : Poly :=
[
  term ((-333108 : Rat) / 553) [(0, 1), (7, 1), (11, 1), (12, 2)],
  term ((166554 : Rat) / 553) [(0, 2), (7, 1), (11, 1), (12, 1)],
  term ((-333108 : Rat) / 553) [(1, 1), (7, 1), (11, 1), (12, 1), (13, 1)],
  term ((166554 : Rat) / 553) [(1, 2), (7, 1), (11, 1), (12, 1)],
  term ((333108 : Rat) / 553) [(7, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-166554 : Rat) / 553) [(7, 1), (11, 1), (12, 1), (14, 2)],
  term ((-166554 : Rat) / 553) [(7, 1), (11, 1), (12, 1), (15, 2)],
  term ((333108 : Rat) / 553) [(7, 1), (11, 1), (12, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 337 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0337_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0337
        rs_R009_ueqv_R009YNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_27_0337 := by
  native_decide

/-- Coefficient term 338 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0338 : Poly :=
[
  term ((353060918012465 : Rat) / 6527410339149) [(7, 1), (11, 1), (12, 1), (14, 1)]
]

/-- Partial product 338 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0338 : Poly :=
[
  term ((-706121836024930 : Rat) / 6527410339149) [(0, 1), (7, 1), (11, 1), (12, 2), (14, 1)],
  term ((353060918012465 : Rat) / 6527410339149) [(0, 2), (7, 1), (11, 1), (12, 1), (14, 1)],
  term ((-706121836024930 : Rat) / 6527410339149) [(1, 1), (7, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((353060918012465 : Rat) / 6527410339149) [(1, 2), (7, 1), (11, 1), (12, 1), (14, 1)],
  term ((706121836024930 : Rat) / 6527410339149) [(7, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-353060918012465 : Rat) / 6527410339149) [(7, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((-353060918012465 : Rat) / 6527410339149) [(7, 1), (11, 1), (12, 1), (14, 3)],
  term ((706121836024930 : Rat) / 6527410339149) [(7, 1), (11, 1), (12, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 338 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0338_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0338
        rs_R009_ueqv_R009YNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_27_0338 := by
  native_decide

/-- Coefficient term 339 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0339 : Poly :=
[
  term ((38302929158275897 : Rat) / 26109641356596) [(7, 1), (11, 1), (14, 1)]
]

/-- Partial product 339 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0339 : Poly :=
[
  term ((-38302929158275897 : Rat) / 13054820678298) [(0, 1), (7, 1), (11, 1), (12, 1), (14, 1)],
  term ((38302929158275897 : Rat) / 26109641356596) [(0, 2), (7, 1), (11, 1), (14, 1)],
  term ((-38302929158275897 : Rat) / 13054820678298) [(1, 1), (7, 1), (11, 1), (13, 1), (14, 1)],
  term ((38302929158275897 : Rat) / 26109641356596) [(1, 2), (7, 1), (11, 1), (14, 1)],
  term ((38302929158275897 : Rat) / 13054820678298) [(7, 1), (11, 1), (12, 1), (14, 2)],
  term ((38302929158275897 : Rat) / 13054820678298) [(7, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-38302929158275897 : Rat) / 26109641356596) [(7, 1), (11, 1), (14, 1), (15, 2)],
  term ((-38302929158275897 : Rat) / 26109641356596) [(7, 1), (11, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 339 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0339_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0339
        rs_R009_ueqv_R009YNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_27_0339 := by
  native_decide

/-- Coefficient term 340 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0340 : Poly :=
[
  term ((941242657 : Rat) / 333083184) [(7, 1), (12, 1), (13, 1)]
]

/-- Partial product 340 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0340 : Poly :=
[
  term ((-941242657 : Rat) / 166541592) [(0, 1), (7, 1), (12, 2), (13, 1)],
  term ((941242657 : Rat) / 333083184) [(0, 2), (7, 1), (12, 1), (13, 1)],
  term ((-941242657 : Rat) / 166541592) [(1, 1), (7, 1), (12, 1), (13, 2)],
  term ((941242657 : Rat) / 333083184) [(1, 2), (7, 1), (12, 1), (13, 1)],
  term ((-941242657 : Rat) / 333083184) [(7, 1), (12, 1), (13, 1), (14, 2)],
  term ((-941242657 : Rat) / 333083184) [(7, 1), (12, 1), (13, 1), (15, 2)],
  term ((941242657 : Rat) / 166541592) [(7, 1), (12, 1), (13, 2), (15, 1)],
  term ((941242657 : Rat) / 166541592) [(7, 1), (12, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 340 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0340_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0340
        rs_R009_ueqv_R009YNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_27_0340 := by
  native_decide

/-- Coefficient term 341 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0341 : Poly :=
[
  term ((2224986028928059 : Rat) / 3197098941624) [(7, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 341 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0341 : Poly :=
[
  term ((-2224986028928059 : Rat) / 1598549470812) [(0, 1), (7, 1), (12, 2), (13, 1), (14, 1)],
  term ((2224986028928059 : Rat) / 3197098941624) [(0, 2), (7, 1), (12, 1), (13, 1), (14, 1)],
  term ((-2224986028928059 : Rat) / 1598549470812) [(1, 1), (7, 1), (12, 1), (13, 2), (14, 1)],
  term ((2224986028928059 : Rat) / 3197098941624) [(1, 2), (7, 1), (12, 1), (13, 1), (14, 1)],
  term ((-2224986028928059 : Rat) / 3197098941624) [(7, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((-2224986028928059 : Rat) / 3197098941624) [(7, 1), (12, 1), (13, 1), (14, 3)],
  term ((2224986028928059 : Rat) / 1598549470812) [(7, 1), (12, 1), (13, 2), (14, 1), (15, 1)],
  term ((2224986028928059 : Rat) / 1598549470812) [(7, 1), (12, 2), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 341 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0341_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0341
        rs_R009_ueqv_R009YNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_27_0341 := by
  native_decide

/-- Coefficient term 342 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0342 : Poly :=
[
  term ((-1495 : Rat) / 252) [(7, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 342 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0342 : Poly :=
[
  term ((1495 : Rat) / 126) [(0, 1), (7, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-1495 : Rat) / 252) [(0, 2), (7, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((1495 : Rat) / 126) [(1, 1), (7, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-1495 : Rat) / 252) [(1, 2), (7, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((1495 : Rat) / 252) [(7, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((1495 : Rat) / 252) [(7, 1), (12, 1), (13, 1), (14, 3), (16, 1)],
  term ((-1495 : Rat) / 126) [(7, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1495 : Rat) / 126) [(7, 1), (12, 2), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 342 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0342_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0342
        rs_R009_ueqv_R009YNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_27_0342 := by
  native_decide

/-- Coefficient term 343 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0343 : Poly :=
[
  term ((725 : Rat) / 168) [(7, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 343 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0343 : Poly :=
[
  term ((-725 : Rat) / 84) [(0, 1), (7, 1), (12, 2), (13, 1), (16, 1)],
  term ((725 : Rat) / 168) [(0, 2), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((-725 : Rat) / 84) [(1, 1), (7, 1), (12, 1), (13, 2), (16, 1)],
  term ((725 : Rat) / 168) [(1, 2), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((-725 : Rat) / 168) [(7, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((-725 : Rat) / 168) [(7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((725 : Rat) / 84) [(7, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((725 : Rat) / 84) [(7, 1), (12, 2), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 343 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0343_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0343
        rs_R009_ueqv_R009YNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_27_0343 := by
  native_decide

/-- Coefficient term 344 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0344 : Poly :=
[
  term ((-150142660556857 : Rat) / 330501789324) [(7, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 344 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0344 : Poly :=
[
  term ((150142660556857 : Rat) / 165250894662) [(0, 1), (7, 1), (12, 2), (14, 1), (15, 1)],
  term ((-150142660556857 : Rat) / 330501789324) [(0, 2), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((150142660556857 : Rat) / 165250894662) [(1, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-150142660556857 : Rat) / 330501789324) [(1, 2), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((-150142660556857 : Rat) / 165250894662) [(7, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((150142660556857 : Rat) / 330501789324) [(7, 1), (12, 1), (14, 1), (15, 3)],
  term ((150142660556857 : Rat) / 330501789324) [(7, 1), (12, 1), (14, 3), (15, 1)],
  term ((-150142660556857 : Rat) / 165250894662) [(7, 1), (12, 2), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 344 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0344_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0344
        rs_R009_ueqv_R009YNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_27_0344 := by
  native_decide

/-- Coefficient term 345 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0345 : Poly :=
[
  term ((247 : Rat) / 63) [(7, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 345 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0345 : Poly :=
[
  term ((-494 : Rat) / 63) [(0, 1), (7, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((247 : Rat) / 63) [(0, 2), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-494 : Rat) / 63) [(1, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((247 : Rat) / 63) [(1, 2), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((494 : Rat) / 63) [(7, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-247 : Rat) / 63) [(7, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((-247 : Rat) / 63) [(7, 1), (12, 1), (14, 3), (15, 1), (16, 1)],
  term ((494 : Rat) / 63) [(7, 1), (12, 2), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 345 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0345_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0345
        rs_R009_ueqv_R009YNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_27_0345 := by
  native_decide

/-- Coefficient term 346 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0346 : Poly :=
[
  term ((1532199782809 : Rat) / 26861770943) [(7, 1), (12, 1), (14, 2), (15, 1)]
]

/-- Partial product 346 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0346 : Poly :=
[
  term ((-3064399565618 : Rat) / 26861770943) [(0, 1), (7, 1), (12, 2), (14, 2), (15, 1)],
  term ((1532199782809 : Rat) / 26861770943) [(0, 2), (7, 1), (12, 1), (14, 2), (15, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(1, 1), (7, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((1532199782809 : Rat) / 26861770943) [(1, 2), (7, 1), (12, 1), (14, 2), (15, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(7, 1), (12, 1), (13, 1), (14, 2), (15, 2)],
  term ((-1532199782809 : Rat) / 26861770943) [(7, 1), (12, 1), (14, 2), (15, 3)],
  term ((-1532199782809 : Rat) / 26861770943) [(7, 1), (12, 1), (14, 4), (15, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(7, 1), (12, 2), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 346 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0346_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0346
        rs_R009_ueqv_R009YNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_27_0346 := by
  native_decide

/-- Coefficient term 347 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0347 : Poly :=
[
  term ((-148780745730977 : Rat) / 5802142523688) [(7, 1), (12, 1), (15, 1)]
]

/-- Partial product 347 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0347 : Poly :=
[
  term ((148780745730977 : Rat) / 2901071261844) [(0, 1), (7, 1), (12, 2), (15, 1)],
  term ((-148780745730977 : Rat) / 5802142523688) [(0, 2), (7, 1), (12, 1), (15, 1)],
  term ((148780745730977 : Rat) / 2901071261844) [(1, 1), (7, 1), (12, 1), (13, 1), (15, 1)],
  term ((-148780745730977 : Rat) / 5802142523688) [(1, 2), (7, 1), (12, 1), (15, 1)],
  term ((-148780745730977 : Rat) / 2901071261844) [(7, 1), (12, 1), (13, 1), (15, 2)],
  term ((148780745730977 : Rat) / 5802142523688) [(7, 1), (12, 1), (14, 2), (15, 1)],
  term ((148780745730977 : Rat) / 5802142523688) [(7, 1), (12, 1), (15, 3)],
  term ((-148780745730977 : Rat) / 2901071261844) [(7, 1), (12, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 347 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0347_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0347
        rs_R009_ueqv_R009YNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_27_0347 := by
  native_decide

/-- Coefficient term 348 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0348 : Poly :=
[
  term ((-157 : Rat) / 42) [(7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 348 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0348 : Poly :=
[
  term ((157 : Rat) / 21) [(0, 1), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((-157 : Rat) / 42) [(0, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((157 : Rat) / 21) [(1, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-157 : Rat) / 42) [(1, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-157 : Rat) / 21) [(7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((157 : Rat) / 42) [(7, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((157 : Rat) / 42) [(7, 1), (12, 1), (15, 3), (16, 1)],
  term ((-157 : Rat) / 21) [(7, 1), (12, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 348 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0348_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0348
        rs_R009_ueqv_R009YNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_27_0348 := by
  native_decide

/-- Coefficient term 349 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0349 : Poly :=
[
  term ((515963868277391503 : Rat) / 313315696279152) [(7, 1), (13, 1)]
]

/-- Partial product 349 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0349 : Poly :=
[
  term ((-515963868277391503 : Rat) / 156657848139576) [(0, 1), (7, 1), (12, 1), (13, 1)],
  term ((515963868277391503 : Rat) / 313315696279152) [(0, 2), (7, 1), (13, 1)],
  term ((-515963868277391503 : Rat) / 156657848139576) [(1, 1), (7, 1), (13, 2)],
  term ((515963868277391503 : Rat) / 313315696279152) [(1, 2), (7, 1), (13, 1)],
  term ((515963868277391503 : Rat) / 156657848139576) [(7, 1), (12, 1), (13, 1), (14, 1)],
  term ((-515963868277391503 : Rat) / 313315696279152) [(7, 1), (13, 1), (14, 2)],
  term ((-515963868277391503 : Rat) / 313315696279152) [(7, 1), (13, 1), (15, 2)],
  term ((515963868277391503 : Rat) / 156657848139576) [(7, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 349 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0349_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0349
        rs_R009_ueqv_R009YNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_27_0349 := by
  native_decide

/-- Coefficient term 350 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0350 : Poly :=
[
  term ((-103949669736811483 : Rat) / 52219282713192) [(7, 1), (13, 1), (14, 1)]
]

/-- Partial product 350 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0350 : Poly :=
[
  term ((103949669736811483 : Rat) / 26109641356596) [(0, 1), (7, 1), (12, 1), (13, 1), (14, 1)],
  term ((-103949669736811483 : Rat) / 52219282713192) [(0, 2), (7, 1), (13, 1), (14, 1)],
  term ((103949669736811483 : Rat) / 26109641356596) [(1, 1), (7, 1), (13, 2), (14, 1)],
  term ((-103949669736811483 : Rat) / 52219282713192) [(1, 2), (7, 1), (13, 1), (14, 1)],
  term ((-103949669736811483 : Rat) / 26109641356596) [(7, 1), (12, 1), (13, 1), (14, 2)],
  term ((103949669736811483 : Rat) / 52219282713192) [(7, 1), (13, 1), (14, 1), (15, 2)],
  term ((103949669736811483 : Rat) / 52219282713192) [(7, 1), (13, 1), (14, 3)],
  term ((-103949669736811483 : Rat) / 26109641356596) [(7, 1), (13, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 350 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0350_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0350
        rs_R009_ueqv_R009YNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_27_0350 := by
  native_decide

/-- Coefficient term 351 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0351 : Poly :=
[
  term ((1495 : Rat) / 84) [(7, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 351 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0351 : Poly :=
[
  term ((-1495 : Rat) / 42) [(0, 1), (7, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((1495 : Rat) / 84) [(0, 2), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1495 : Rat) / 42) [(1, 1), (7, 1), (13, 2), (14, 1), (16, 1)],
  term ((1495 : Rat) / 84) [(1, 2), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((1495 : Rat) / 42) [(7, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((-1495 : Rat) / 84) [(7, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1495 : Rat) / 84) [(7, 1), (13, 1), (14, 3), (16, 1)],
  term ((1495 : Rat) / 42) [(7, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 351 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0351_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0351
        rs_R009_ueqv_R009YNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_27_0351 := by
  native_decide

/-- Coefficient term 352 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0352 : Poly :=
[
  term ((-1532199782809 : Rat) / 53723541886) [(7, 1), (13, 1), (14, 2)]
]

/-- Partial product 352 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0352 : Poly :=
[
  term ((1532199782809 : Rat) / 26861770943) [(0, 1), (7, 1), (12, 1), (13, 1), (14, 2)],
  term ((-1532199782809 : Rat) / 53723541886) [(0, 2), (7, 1), (13, 1), (14, 2)],
  term ((1532199782809 : Rat) / 26861770943) [(1, 1), (7, 1), (13, 2), (14, 2)],
  term ((-1532199782809 : Rat) / 53723541886) [(1, 2), (7, 1), (13, 1), (14, 2)],
  term ((-1532199782809 : Rat) / 26861770943) [(7, 1), (12, 1), (13, 1), (14, 3)],
  term ((1532199782809 : Rat) / 53723541886) [(7, 1), (13, 1), (14, 2), (15, 2)],
  term ((1532199782809 : Rat) / 53723541886) [(7, 1), (13, 1), (14, 4)],
  term ((-1532199782809 : Rat) / 26861770943) [(7, 1), (13, 2), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 352 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0352_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0352
        rs_R009_ueqv_R009YNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_27_0352 := by
  native_decide

/-- Coefficient term 353 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0353 : Poly :=
[
  term ((-25885 : Rat) / 504) [(7, 1), (13, 1), (16, 1)]
]

/-- Partial product 353 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0353 : Poly :=
[
  term ((25885 : Rat) / 252) [(0, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((-25885 : Rat) / 504) [(0, 2), (7, 1), (13, 1), (16, 1)],
  term ((25885 : Rat) / 252) [(1, 1), (7, 1), (13, 2), (16, 1)],
  term ((-25885 : Rat) / 504) [(1, 2), (7, 1), (13, 1), (16, 1)],
  term ((-25885 : Rat) / 252) [(7, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((25885 : Rat) / 504) [(7, 1), (13, 1), (14, 2), (16, 1)],
  term ((25885 : Rat) / 504) [(7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-25885 : Rat) / 252) [(7, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 353 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0353_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0353
        rs_R009_ueqv_R009YNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_27_0353 := by
  native_decide

/-- Coefficient term 354 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0354 : Poly :=
[
  term ((22183802776035443 : Rat) / 26109641356596) [(7, 1), (14, 1), (15, 1)]
]

/-- Partial product 354 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0354 : Poly :=
[
  term ((-22183802776035443 : Rat) / 13054820678298) [(0, 1), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((22183802776035443 : Rat) / 26109641356596) [(0, 2), (7, 1), (14, 1), (15, 1)],
  term ((-22183802776035443 : Rat) / 13054820678298) [(1, 1), (7, 1), (13, 1), (14, 1), (15, 1)],
  term ((22183802776035443 : Rat) / 26109641356596) [(1, 2), (7, 1), (14, 1), (15, 1)],
  term ((22183802776035443 : Rat) / 13054820678298) [(7, 1), (12, 1), (14, 2), (15, 1)],
  term ((22183802776035443 : Rat) / 13054820678298) [(7, 1), (13, 1), (14, 1), (15, 2)],
  term ((-22183802776035443 : Rat) / 26109641356596) [(7, 1), (14, 1), (15, 3)],
  term ((-22183802776035443 : Rat) / 26109641356596) [(7, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 354 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0354_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0354
        rs_R009_ueqv_R009YNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_27_0354 := by
  native_decide

/-- Coefficient term 355 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0355 : Poly :=
[
  term ((-247 : Rat) / 21) [(7, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 355 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0355 : Poly :=
[
  term ((494 : Rat) / 21) [(0, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-247 : Rat) / 21) [(0, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((494 : Rat) / 21) [(1, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-247 : Rat) / 21) [(1, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-494 : Rat) / 21) [(7, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-494 : Rat) / 21) [(7, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((247 : Rat) / 21) [(7, 1), (14, 1), (15, 3), (16, 1)],
  term ((247 : Rat) / 21) [(7, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 355 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0355_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0355
        rs_R009_ueqv_R009YNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_27_0355 := by
  native_decide

/-- Coefficient term 356 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0356 : Poly :=
[
  term ((-4596599348427 : Rat) / 26861770943) [(7, 1), (14, 2), (15, 1)]
]

/-- Partial product 356 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0356 : Poly :=
[
  term ((9193198696854 : Rat) / 26861770943) [(0, 1), (7, 1), (12, 1), (14, 2), (15, 1)],
  term ((-4596599348427 : Rat) / 26861770943) [(0, 2), (7, 1), (14, 2), (15, 1)],
  term ((9193198696854 : Rat) / 26861770943) [(1, 1), (7, 1), (13, 1), (14, 2), (15, 1)],
  term ((-4596599348427 : Rat) / 26861770943) [(1, 2), (7, 1), (14, 2), (15, 1)],
  term ((-9193198696854 : Rat) / 26861770943) [(7, 1), (12, 1), (14, 3), (15, 1)],
  term ((-9193198696854 : Rat) / 26861770943) [(7, 1), (13, 1), (14, 2), (15, 2)],
  term ((4596599348427 : Rat) / 26861770943) [(7, 1), (14, 2), (15, 3)],
  term ((4596599348427 : Rat) / 26861770943) [(7, 1), (14, 4), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 356 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0356_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0356
        rs_R009_ueqv_R009YNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_27_0356 := by
  native_decide

/-- Coefficient term 357 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0357 : Poly :=
[
  term ((-25114142040388049 : Rat) / 7459897530456) [(7, 1), (15, 1)]
]

/-- Partial product 357 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0357 : Poly :=
[
  term ((25114142040388049 : Rat) / 3729948765228) [(0, 1), (7, 1), (12, 1), (15, 1)],
  term ((-25114142040388049 : Rat) / 7459897530456) [(0, 2), (7, 1), (15, 1)],
  term ((25114142040388049 : Rat) / 3729948765228) [(1, 1), (7, 1), (13, 1), (15, 1)],
  term ((-25114142040388049 : Rat) / 7459897530456) [(1, 2), (7, 1), (15, 1)],
  term ((-25114142040388049 : Rat) / 3729948765228) [(7, 1), (12, 1), (14, 1), (15, 1)],
  term ((-25114142040388049 : Rat) / 3729948765228) [(7, 1), (13, 1), (15, 2)],
  term ((25114142040388049 : Rat) / 7459897530456) [(7, 1), (14, 2), (15, 1)],
  term ((25114142040388049 : Rat) / 7459897530456) [(7, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 357 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0357_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0357
        rs_R009_ueqv_R009YNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_27_0357 := by
  native_decide

/-- Coefficient term 358 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0358 : Poly :=
[
  term ((5149 : Rat) / 126) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 358 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0358 : Poly :=
[
  term ((-5149 : Rat) / 63) [(0, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((5149 : Rat) / 126) [(0, 2), (7, 1), (15, 1), (16, 1)],
  term ((-5149 : Rat) / 63) [(1, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((5149 : Rat) / 126) [(1, 2), (7, 1), (15, 1), (16, 1)],
  term ((5149 : Rat) / 63) [(7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((5149 : Rat) / 63) [(7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-5149 : Rat) / 126) [(7, 1), (14, 2), (15, 1), (16, 1)],
  term ((-5149 : Rat) / 126) [(7, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 358 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0358_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0358
        rs_R009_ueqv_R009YNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_27_0358 := by
  native_decide

/-- Coefficient term 359 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0359 : Poly :=
[
  term ((-1711467157397653 : Rat) / 13054820678298) [(7, 2)]
]

/-- Partial product 359 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0359 : Poly :=
[
  term ((1711467157397653 : Rat) / 6527410339149) [(0, 1), (7, 2), (12, 1)],
  term ((-1711467157397653 : Rat) / 13054820678298) [(0, 2), (7, 2)],
  term ((1711467157397653 : Rat) / 6527410339149) [(1, 1), (7, 2), (13, 1)],
  term ((-1711467157397653 : Rat) / 13054820678298) [(1, 2), (7, 2)],
  term ((-1711467157397653 : Rat) / 6527410339149) [(7, 2), (12, 1), (14, 1)],
  term ((-1711467157397653 : Rat) / 6527410339149) [(7, 2), (13, 1), (15, 1)],
  term ((1711467157397653 : Rat) / 13054820678298) [(7, 2), (14, 2)],
  term ((1711467157397653 : Rat) / 13054820678298) [(7, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 359 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0359_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0359
        rs_R009_ueqv_R009YNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_27_0359 := by
  native_decide

/-- Coefficient term 360 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0360 : Poly :=
[
  term ((16224463500164501 : Rat) / 26109641356596) [(7, 2), (10, 1)]
]

/-- Partial product 360 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0360 : Poly :=
[
  term ((-16224463500164501 : Rat) / 13054820678298) [(0, 1), (7, 2), (10, 1), (12, 1)],
  term ((16224463500164501 : Rat) / 26109641356596) [(0, 2), (7, 2), (10, 1)],
  term ((-16224463500164501 : Rat) / 13054820678298) [(1, 1), (7, 2), (10, 1), (13, 1)],
  term ((16224463500164501 : Rat) / 26109641356596) [(1, 2), (7, 2), (10, 1)],
  term ((16224463500164501 : Rat) / 13054820678298) [(7, 2), (10, 1), (12, 1), (14, 1)],
  term ((16224463500164501 : Rat) / 13054820678298) [(7, 2), (10, 1), (13, 1), (15, 1)],
  term ((-16224463500164501 : Rat) / 26109641356596) [(7, 2), (10, 1), (14, 2)],
  term ((-16224463500164501 : Rat) / 26109641356596) [(7, 2), (10, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 360 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0360_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0360
        rs_R009_ueqv_R009YNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_27_0360 := by
  native_decide

/-- Coefficient term 361 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0361 : Poly :=
[
  term ((1532199782809 : Rat) / 322341251316) [(7, 2), (12, 1)]
]

/-- Partial product 361 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0361 : Poly :=
[
  term ((-1532199782809 : Rat) / 161170625658) [(0, 1), (7, 2), (12, 2)],
  term ((1532199782809 : Rat) / 322341251316) [(0, 2), (7, 2), (12, 1)],
  term ((-1532199782809 : Rat) / 161170625658) [(1, 1), (7, 2), (12, 1), (13, 1)],
  term ((1532199782809 : Rat) / 322341251316) [(1, 2), (7, 2), (12, 1)],
  term ((1532199782809 : Rat) / 161170625658) [(7, 2), (12, 1), (13, 1), (15, 1)],
  term ((-1532199782809 : Rat) / 322341251316) [(7, 2), (12, 1), (14, 2)],
  term ((-1532199782809 : Rat) / 322341251316) [(7, 2), (12, 1), (15, 2)],
  term ((1532199782809 : Rat) / 161170625658) [(7, 2), (12, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 361 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0361_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0361
        rs_R009_ueqv_R009YNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_27_0361 := by
  native_decide

/-- Coefficient term 362 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0362 : Poly :=
[
  term ((4349915183394751 : Rat) / 13054820678298) [(7, 2), (12, 1), (14, 1)]
]

/-- Partial product 362 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0362 : Poly :=
[
  term ((-4349915183394751 : Rat) / 6527410339149) [(0, 1), (7, 2), (12, 2), (14, 1)],
  term ((4349915183394751 : Rat) / 13054820678298) [(0, 2), (7, 2), (12, 1), (14, 1)],
  term ((-4349915183394751 : Rat) / 6527410339149) [(1, 1), (7, 2), (12, 1), (13, 1), (14, 1)],
  term ((4349915183394751 : Rat) / 13054820678298) [(1, 2), (7, 2), (12, 1), (14, 1)],
  term ((4349915183394751 : Rat) / 6527410339149) [(7, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-4349915183394751 : Rat) / 13054820678298) [(7, 2), (12, 1), (14, 1), (15, 2)],
  term ((-4349915183394751 : Rat) / 13054820678298) [(7, 2), (12, 1), (14, 3)],
  term ((4349915183394751 : Rat) / 6527410339149) [(7, 2), (12, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 362 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0362_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0362
        rs_R009_ueqv_R009YNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_27_0362 := by
  native_decide

/-- Coefficient term 363 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0363 : Poly :=
[
  term ((-4349915183394751 : Rat) / 4351606892766) [(7, 2), (14, 1)]
]

/-- Partial product 363 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0363 : Poly :=
[
  term ((4349915183394751 : Rat) / 2175803446383) [(0, 1), (7, 2), (12, 1), (14, 1)],
  term ((-4349915183394751 : Rat) / 4351606892766) [(0, 2), (7, 2), (14, 1)],
  term ((4349915183394751 : Rat) / 2175803446383) [(1, 1), (7, 2), (13, 1), (14, 1)],
  term ((-4349915183394751 : Rat) / 4351606892766) [(1, 2), (7, 2), (14, 1)],
  term ((-4349915183394751 : Rat) / 2175803446383) [(7, 2), (12, 1), (14, 2)],
  term ((-4349915183394751 : Rat) / 2175803446383) [(7, 2), (13, 1), (14, 1), (15, 1)],
  term ((4349915183394751 : Rat) / 4351606892766) [(7, 2), (14, 1), (15, 2)],
  term ((4349915183394751 : Rat) / 4351606892766) [(7, 2), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 363 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0363_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0363
        rs_R009_ueqv_R009YNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_27_0363 := by
  native_decide

/-- Coefficient term 364 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0364 : Poly :=
[
  term ((-7459770061393 : Rat) / 16915867416) [(9, 1), (10, 1), (11, 1)]
]

/-- Partial product 364 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0364 : Poly :=
[
  term ((7459770061393 : Rat) / 8457933708) [(0, 1), (9, 1), (10, 1), (11, 1), (12, 1)],
  term ((-7459770061393 : Rat) / 16915867416) [(0, 2), (9, 1), (10, 1), (11, 1)],
  term ((7459770061393 : Rat) / 8457933708) [(1, 1), (9, 1), (10, 1), (11, 1), (13, 1)],
  term ((-7459770061393 : Rat) / 16915867416) [(1, 2), (9, 1), (10, 1), (11, 1)],
  term ((-7459770061393 : Rat) / 8457933708) [(9, 1), (10, 1), (11, 1), (12, 1), (14, 1)],
  term ((-7459770061393 : Rat) / 8457933708) [(9, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((7459770061393 : Rat) / 16915867416) [(9, 1), (10, 1), (11, 1), (14, 2)],
  term ((7459770061393 : Rat) / 16915867416) [(9, 1), (10, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 364 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0364_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0364
        rs_R009_ueqv_R009YNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_27_0364 := by
  native_decide

/-- Coefficient term 365 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0365 : Poly :=
[
  term ((4992 : Rat) / 553) [(9, 1), (10, 1), (11, 1), (12, 1)]
]

/-- Partial product 365 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0365 : Poly :=
[
  term ((-9984 : Rat) / 553) [(0, 1), (9, 1), (10, 1), (11, 1), (12, 2)],
  term ((4992 : Rat) / 553) [(0, 2), (9, 1), (10, 1), (11, 1), (12, 1)],
  term ((-9984 : Rat) / 553) [(1, 1), (9, 1), (10, 1), (11, 1), (12, 1), (13, 1)],
  term ((4992 : Rat) / 553) [(1, 2), (9, 1), (10, 1), (11, 1), (12, 1)],
  term ((9984 : Rat) / 553) [(9, 1), (10, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-4992 : Rat) / 553) [(9, 1), (10, 1), (11, 1), (12, 1), (14, 2)],
  term ((-4992 : Rat) / 553) [(9, 1), (10, 1), (11, 1), (12, 1), (15, 2)],
  term ((9984 : Rat) / 553) [(9, 1), (10, 1), (11, 1), (12, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 365 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0365_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0365
        rs_R009_ueqv_R009YNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_27_0365 := by
  native_decide

/-- Coefficient term 366 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0366 : Poly :=
[
  term ((29952 : Rat) / 553) [(9, 1), (10, 1), (11, 1), (14, 1)]
]

/-- Partial product 366 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0366 : Poly :=
[
  term ((-59904 : Rat) / 553) [(0, 1), (9, 1), (10, 1), (11, 1), (12, 1), (14, 1)],
  term ((29952 : Rat) / 553) [(0, 2), (9, 1), (10, 1), (11, 1), (14, 1)],
  term ((-59904 : Rat) / 553) [(1, 1), (9, 1), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((29952 : Rat) / 553) [(1, 2), (9, 1), (10, 1), (11, 1), (14, 1)],
  term ((59904 : Rat) / 553) [(9, 1), (10, 1), (11, 1), (12, 1), (14, 2)],
  term ((59904 : Rat) / 553) [(9, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-29952 : Rat) / 553) [(9, 1), (10, 1), (11, 1), (14, 1), (15, 2)],
  term ((-29952 : Rat) / 553) [(9, 1), (10, 1), (11, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 366 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0366_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0366
        rs_R009_ueqv_R009YNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_27_0366 := by
  native_decide

/-- Coefficient term 367 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0367 : Poly :=
[
  term ((-6090608323475 : Rat) / 532849823604) [(9, 1), (10, 1), (12, 1), (13, 1)]
]

/-- Partial product 367 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0367 : Poly :=
[
  term ((6090608323475 : Rat) / 266424911802) [(0, 1), (9, 1), (10, 1), (12, 2), (13, 1)],
  term ((-6090608323475 : Rat) / 532849823604) [(0, 2), (9, 1), (10, 1), (12, 1), (13, 1)],
  term ((6090608323475 : Rat) / 266424911802) [(1, 1), (9, 1), (10, 1), (12, 1), (13, 2)],
  term ((-6090608323475 : Rat) / 532849823604) [(1, 2), (9, 1), (10, 1), (12, 1), (13, 1)],
  term ((6090608323475 : Rat) / 532849823604) [(9, 1), (10, 1), (12, 1), (13, 1), (14, 2)],
  term ((6090608323475 : Rat) / 532849823604) [(9, 1), (10, 1), (12, 1), (13, 1), (15, 2)],
  term ((-6090608323475 : Rat) / 266424911802) [(9, 1), (10, 1), (12, 1), (13, 2), (15, 1)],
  term ((-6090608323475 : Rat) / 266424911802) [(9, 1), (10, 1), (12, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 367 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0367_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0367
        rs_R009_ueqv_R009YNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_27_0367 := by
  native_decide

/-- Coefficient term 368 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0368 : Poly :=
[
  term ((5 : Rat) / 6) [(9, 1), (10, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 368 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0368 : Poly :=
[
  term ((-5 : Rat) / 3) [(0, 1), (9, 1), (10, 1), (12, 2), (13, 1), (16, 1)],
  term ((5 : Rat) / 6) [(0, 2), (9, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-5 : Rat) / 3) [(1, 1), (9, 1), (10, 1), (12, 1), (13, 2), (16, 1)],
  term ((5 : Rat) / 6) [(1, 2), (9, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-5 : Rat) / 6) [(9, 1), (10, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((-5 : Rat) / 6) [(9, 1), (10, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((5 : Rat) / 3) [(9, 1), (10, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((5 : Rat) / 3) [(9, 1), (10, 1), (12, 2), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 368 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0368_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0368
        rs_R009_ueqv_R009YNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_27_0368 := by
  native_decide

/-- Coefficient term 369 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0369 : Poly :=
[
  term ((30188368622915 : Rat) / 355233215736) [(9, 1), (10, 1), (12, 1), (15, 1)]
]

/-- Partial product 369 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0369 : Poly :=
[
  term ((-30188368622915 : Rat) / 177616607868) [(0, 1), (9, 1), (10, 1), (12, 2), (15, 1)],
  term ((30188368622915 : Rat) / 355233215736) [(0, 2), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((-30188368622915 : Rat) / 177616607868) [(1, 1), (9, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((30188368622915 : Rat) / 355233215736) [(1, 2), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((30188368622915 : Rat) / 177616607868) [(9, 1), (10, 1), (12, 1), (13, 1), (15, 2)],
  term ((-30188368622915 : Rat) / 355233215736) [(9, 1), (10, 1), (12, 1), (14, 2), (15, 1)],
  term ((-30188368622915 : Rat) / 355233215736) [(9, 1), (10, 1), (12, 1), (15, 3)],
  term ((30188368622915 : Rat) / 177616607868) [(9, 1), (10, 1), (12, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 369 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0369_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0369
        rs_R009_ueqv_R009YNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_27_0369 := by
  native_decide

/-- Coefficient term 370 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0370 : Poly :=
[
  term ((-16 : Rat) / 21) [(9, 1), (10, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 370 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0370 : Poly :=
[
  term ((32 : Rat) / 21) [(0, 1), (9, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-16 : Rat) / 21) [(0, 2), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((32 : Rat) / 21) [(1, 1), (9, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-16 : Rat) / 21) [(1, 2), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-32 : Rat) / 21) [(9, 1), (10, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((16 : Rat) / 21) [(9, 1), (10, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((16 : Rat) / 21) [(9, 1), (10, 1), (12, 1), (15, 3), (16, 1)],
  term ((-32 : Rat) / 21) [(9, 1), (10, 1), (12, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 370 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0370_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0370
        rs_R009_ueqv_R009YNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_27_0370 := by
  native_decide

/-- Coefficient term 371 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0371 : Poly :=
[
  term ((74863841198371 : Rat) / 1065699647208) [(9, 1), (10, 1), (13, 1)]
]

/-- Partial product 371 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0371 : Poly :=
[
  term ((-74863841198371 : Rat) / 532849823604) [(0, 1), (9, 1), (10, 1), (12, 1), (13, 1)],
  term ((74863841198371 : Rat) / 1065699647208) [(0, 2), (9, 1), (10, 1), (13, 1)],
  term ((-74863841198371 : Rat) / 532849823604) [(1, 1), (9, 1), (10, 1), (13, 2)],
  term ((74863841198371 : Rat) / 1065699647208) [(1, 2), (9, 1), (10, 1), (13, 1)],
  term ((74863841198371 : Rat) / 532849823604) [(9, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((-74863841198371 : Rat) / 1065699647208) [(9, 1), (10, 1), (13, 1), (14, 2)],
  term ((-74863841198371 : Rat) / 1065699647208) [(9, 1), (10, 1), (13, 1), (15, 2)],
  term ((74863841198371 : Rat) / 532849823604) [(9, 1), (10, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 371 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0371_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0371
        rs_R009_ueqv_R009YNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_27_0371 := by
  native_decide

/-- Coefficient term 372 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0372 : Poly :=
[
  term ((8926828802611 : Rat) / 532849823604) [(9, 1), (10, 1), (13, 1), (14, 1)]
]

/-- Partial product 372 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0372 : Poly :=
[
  term ((-8926828802611 : Rat) / 266424911802) [(0, 1), (9, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((8926828802611 : Rat) / 532849823604) [(0, 2), (9, 1), (10, 1), (13, 1), (14, 1)],
  term ((-8926828802611 : Rat) / 266424911802) [(1, 1), (9, 1), (10, 1), (13, 2), (14, 1)],
  term ((8926828802611 : Rat) / 532849823604) [(1, 2), (9, 1), (10, 1), (13, 1), (14, 1)],
  term ((8926828802611 : Rat) / 266424911802) [(9, 1), (10, 1), (12, 1), (13, 1), (14, 2)],
  term ((-8926828802611 : Rat) / 532849823604) [(9, 1), (10, 1), (13, 1), (14, 1), (15, 2)],
  term ((-8926828802611 : Rat) / 532849823604) [(9, 1), (10, 1), (13, 1), (14, 3)],
  term ((8926828802611 : Rat) / 266424911802) [(9, 1), (10, 1), (13, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 372 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0372_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0372
        rs_R009_ueqv_R009YNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_27_0372 := by
  native_decide

/-- Coefficient term 373 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0373 : Poly :=
[
  term ((55 : Rat) / 28) [(9, 1), (10, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 373 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0373 : Poly :=
[
  term ((-55 : Rat) / 14) [(0, 1), (9, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((55 : Rat) / 28) [(0, 2), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-55 : Rat) / 14) [(1, 1), (9, 1), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((55 : Rat) / 28) [(1, 2), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((55 : Rat) / 14) [(9, 1), (10, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((-55 : Rat) / 28) [(9, 1), (10, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-55 : Rat) / 28) [(9, 1), (10, 1), (13, 1), (14, 3), (16, 1)],
  term ((55 : Rat) / 14) [(9, 1), (10, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 373 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0373_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0373
        rs_R009_ueqv_R009YNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_27_0373 := by
  native_decide

/-- Coefficient term 374 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0374 : Poly :=
[
  term ((-295 : Rat) / 24) [(9, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 374 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0374 : Poly :=
[
  term ((295 : Rat) / 12) [(0, 1), (9, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-295 : Rat) / 24) [(0, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((295 : Rat) / 12) [(1, 1), (9, 1), (10, 1), (13, 2), (16, 1)],
  term ((-295 : Rat) / 24) [(1, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-295 : Rat) / 12) [(9, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((295 : Rat) / 24) [(9, 1), (10, 1), (13, 1), (14, 2), (16, 1)],
  term ((295 : Rat) / 24) [(9, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-295 : Rat) / 12) [(9, 1), (10, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 374 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0374_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0374
        rs_R009_ueqv_R009YNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_27_0374 := by
  native_decide

/-- Coefficient term 375 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0375 : Poly :=
[
  term ((-170525183774905 : Rat) / 710466431472) [(9, 1), (10, 1), (14, 1), (15, 1)]
]

/-- Partial product 375 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0375 : Poly :=
[
  term ((170525183774905 : Rat) / 355233215736) [(0, 1), (9, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((-170525183774905 : Rat) / 710466431472) [(0, 2), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((170525183774905 : Rat) / 355233215736) [(1, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-170525183774905 : Rat) / 710466431472) [(1, 2), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((-170525183774905 : Rat) / 355233215736) [(9, 1), (10, 1), (12, 1), (14, 2), (15, 1)],
  term ((-170525183774905 : Rat) / 355233215736) [(9, 1), (10, 1), (13, 1), (14, 1), (15, 2)],
  term ((170525183774905 : Rat) / 710466431472) [(9, 1), (10, 1), (14, 1), (15, 3)],
  term ((170525183774905 : Rat) / 710466431472) [(9, 1), (10, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 375 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0375_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0375
        rs_R009_ueqv_R009YNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_27_0375 := by
  native_decide

/-- Coefficient term 376 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0376 : Poly :=
[
  term ((-11 : Rat) / 7) [(9, 1), (10, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 376 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0376 : Poly :=
[
  term ((22 : Rat) / 7) [(0, 1), (9, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-11 : Rat) / 7) [(0, 2), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((22 : Rat) / 7) [(1, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-11 : Rat) / 7) [(1, 2), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-22 : Rat) / 7) [(9, 1), (10, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-22 : Rat) / 7) [(9, 1), (10, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((11 : Rat) / 7) [(9, 1), (10, 1), (14, 1), (15, 3), (16, 1)],
  term ((11 : Rat) / 7) [(9, 1), (10, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 376 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0376_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0376
        rs_R009_ueqv_R009YNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_27_0376 := by
  native_decide

/-- Coefficient term 377 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0377 : Poly :=
[
  term ((-4133771477798857 : Rat) / 6394197883248) [(9, 1), (10, 1), (15, 1)]
]

/-- Partial product 377 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0377 : Poly :=
[
  term ((4133771477798857 : Rat) / 3197098941624) [(0, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((-4133771477798857 : Rat) / 6394197883248) [(0, 2), (9, 1), (10, 1), (15, 1)],
  term ((4133771477798857 : Rat) / 3197098941624) [(1, 1), (9, 1), (10, 1), (13, 1), (15, 1)],
  term ((-4133771477798857 : Rat) / 6394197883248) [(1, 2), (9, 1), (10, 1), (15, 1)],
  term ((-4133771477798857 : Rat) / 3197098941624) [(9, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((-4133771477798857 : Rat) / 3197098941624) [(9, 1), (10, 1), (13, 1), (15, 2)],
  term ((4133771477798857 : Rat) / 6394197883248) [(9, 1), (10, 1), (14, 2), (15, 1)],
  term ((4133771477798857 : Rat) / 6394197883248) [(9, 1), (10, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 377 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0377_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0377
        rs_R009_ueqv_R009YNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_27_0377 := by
  native_decide

/-- Coefficient term 378 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0378 : Poly :=
[
  term ((439 : Rat) / 42) [(9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 378 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0378 : Poly :=
[
  term ((-439 : Rat) / 21) [(0, 1), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((439 : Rat) / 42) [(0, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-439 : Rat) / 21) [(1, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((439 : Rat) / 42) [(1, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((439 : Rat) / 21) [(9, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((439 : Rat) / 21) [(9, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-439 : Rat) / 42) [(9, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((-439 : Rat) / 42) [(9, 1), (10, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 378 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0378_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0378
        rs_R009_ueqv_R009YNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_27_0378 := by
  native_decide

/-- Coefficient term 379 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0379 : Poly :=
[
  term ((3667089710400365 : Rat) / 25576791532992) [(9, 1), (11, 1)]
]

/-- Partial product 379 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0379 : Poly :=
[
  term ((-3667089710400365 : Rat) / 12788395766496) [(0, 1), (9, 1), (11, 1), (12, 1)],
  term ((3667089710400365 : Rat) / 25576791532992) [(0, 2), (9, 1), (11, 1)],
  term ((-3667089710400365 : Rat) / 12788395766496) [(1, 1), (9, 1), (11, 1), (13, 1)],
  term ((3667089710400365 : Rat) / 25576791532992) [(1, 2), (9, 1), (11, 1)],
  term ((3667089710400365 : Rat) / 12788395766496) [(9, 1), (11, 1), (12, 1), (14, 1)],
  term ((3667089710400365 : Rat) / 12788395766496) [(9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-3667089710400365 : Rat) / 25576791532992) [(9, 1), (11, 1), (14, 2)],
  term ((-3667089710400365 : Rat) / 25576791532992) [(9, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 379 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0379_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0379
        rs_R009_ueqv_R009YNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_27_0379 := by
  native_decide

/-- Coefficient term 380 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0380 : Poly :=
[
  term ((-16612902868000 : Rat) / 133212455901) [(9, 1), (11, 1), (12, 1)]
]

/-- Partial product 380 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0380 : Poly :=
[
  term ((33225805736000 : Rat) / 133212455901) [(0, 1), (9, 1), (11, 1), (12, 2)],
  term ((-16612902868000 : Rat) / 133212455901) [(0, 2), (9, 1), (11, 1), (12, 1)],
  term ((33225805736000 : Rat) / 133212455901) [(1, 1), (9, 1), (11, 1), (12, 1), (13, 1)],
  term ((-16612902868000 : Rat) / 133212455901) [(1, 2), (9, 1), (11, 1), (12, 1)],
  term ((-33225805736000 : Rat) / 133212455901) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((16612902868000 : Rat) / 133212455901) [(9, 1), (11, 1), (12, 1), (14, 2)],
  term ((16612902868000 : Rat) / 133212455901) [(9, 1), (11, 1), (12, 1), (15, 2)],
  term ((-33225805736000 : Rat) / 133212455901) [(9, 1), (11, 1), (12, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 380 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0380_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0380
        rs_R009_ueqv_R009YNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_27_0380 := by
  native_decide

/-- Coefficient term 381 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0381 : Poly :=
[
  term ((-9518309600500579 : Rat) / 12788395766496) [(9, 1), (11, 1), (14, 1)]
]

/-- Partial product 381 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0381 : Poly :=
[
  term ((9518309600500579 : Rat) / 6394197883248) [(0, 1), (9, 1), (11, 1), (12, 1), (14, 1)],
  term ((-9518309600500579 : Rat) / 12788395766496) [(0, 2), (9, 1), (11, 1), (14, 1)],
  term ((9518309600500579 : Rat) / 6394197883248) [(1, 1), (9, 1), (11, 1), (13, 1), (14, 1)],
  term ((-9518309600500579 : Rat) / 12788395766496) [(1, 2), (9, 1), (11, 1), (14, 1)],
  term ((-9518309600500579 : Rat) / 6394197883248) [(9, 1), (11, 1), (12, 1), (14, 2)],
  term ((-9518309600500579 : Rat) / 6394197883248) [(9, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((9518309600500579 : Rat) / 12788395766496) [(9, 1), (11, 1), (14, 1), (15, 2)],
  term ((9518309600500579 : Rat) / 12788395766496) [(9, 1), (11, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 381 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0381_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0381
        rs_R009_ueqv_R009YNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_27_0381 := by
  native_decide

/-- Coefficient term 382 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0382 : Poly :=
[
  term ((59904 : Rat) / 553) [(9, 1), (11, 1), (14, 2)]
]

/-- Partial product 382 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0382 : Poly :=
[
  term ((-119808 : Rat) / 553) [(0, 1), (9, 1), (11, 1), (12, 1), (14, 2)],
  term ((59904 : Rat) / 553) [(0, 2), (9, 1), (11, 1), (14, 2)],
  term ((-119808 : Rat) / 553) [(1, 1), (9, 1), (11, 1), (13, 1), (14, 2)],
  term ((59904 : Rat) / 553) [(1, 2), (9, 1), (11, 1), (14, 2)],
  term ((119808 : Rat) / 553) [(9, 1), (11, 1), (12, 1), (14, 3)],
  term ((119808 : Rat) / 553) [(9, 1), (11, 1), (13, 1), (14, 2), (15, 1)],
  term ((-59904 : Rat) / 553) [(9, 1), (11, 1), (14, 2), (15, 2)],
  term ((-59904 : Rat) / 553) [(9, 1), (11, 1), (14, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 382 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0382_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0382
        rs_R009_ueqv_R009YNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_27_0382 := by
  native_decide

/-- Coefficient term 383 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0383 : Poly :=
[
  term ((-9008294618453 : Rat) / 236822143824) [(9, 1), (11, 1), (15, 2)]
]

/-- Partial product 383 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0383 : Poly :=
[
  term ((9008294618453 : Rat) / 118411071912) [(0, 1), (9, 1), (11, 1), (12, 1), (15, 2)],
  term ((-9008294618453 : Rat) / 236822143824) [(0, 2), (9, 1), (11, 1), (15, 2)],
  term ((9008294618453 : Rat) / 118411071912) [(1, 1), (9, 1), (11, 1), (13, 1), (15, 2)],
  term ((-9008294618453 : Rat) / 236822143824) [(1, 2), (9, 1), (11, 1), (15, 2)],
  term ((-9008294618453 : Rat) / 118411071912) [(9, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((-9008294618453 : Rat) / 118411071912) [(9, 1), (11, 1), (13, 1), (15, 3)],
  term ((9008294618453 : Rat) / 236822143824) [(9, 1), (11, 1), (14, 2), (15, 2)],
  term ((9008294618453 : Rat) / 236822143824) [(9, 1), (11, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 383 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0383_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0383
        rs_R009_ueqv_R009YNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_27_0383 := by
  native_decide

/-- Coefficient term 384 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0384 : Poly :=
[
  term ((97923607474811 : Rat) / 1065699647208) [(9, 1), (12, 1), (13, 1)]
]

/-- Partial product 384 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0384 : Poly :=
[
  term ((-97923607474811 : Rat) / 532849823604) [(0, 1), (9, 1), (12, 2), (13, 1)],
  term ((97923607474811 : Rat) / 1065699647208) [(0, 2), (9, 1), (12, 1), (13, 1)],
  term ((-97923607474811 : Rat) / 532849823604) [(1, 1), (9, 1), (12, 1), (13, 2)],
  term ((97923607474811 : Rat) / 1065699647208) [(1, 2), (9, 1), (12, 1), (13, 1)],
  term ((-97923607474811 : Rat) / 1065699647208) [(9, 1), (12, 1), (13, 1), (14, 2)],
  term ((-97923607474811 : Rat) / 1065699647208) [(9, 1), (12, 1), (13, 1), (15, 2)],
  term ((97923607474811 : Rat) / 532849823604) [(9, 1), (12, 1), (13, 2), (15, 1)],
  term ((97923607474811 : Rat) / 532849823604) [(9, 1), (12, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 384 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0384_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0384
        rs_R009_ueqv_R009YNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_27_0384 := by
  native_decide

/-- Coefficient term 385 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0385 : Poly :=
[
  term ((-475 : Rat) / 84) [(9, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 385 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0385 : Poly :=
[
  term ((475 : Rat) / 42) [(0, 1), (9, 1), (12, 2), (13, 1), (16, 1)],
  term ((-475 : Rat) / 84) [(0, 2), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((475 : Rat) / 42) [(1, 1), (9, 1), (12, 1), (13, 2), (16, 1)],
  term ((-475 : Rat) / 84) [(1, 2), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((475 : Rat) / 84) [(9, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((475 : Rat) / 84) [(9, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-475 : Rat) / 42) [(9, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-475 : Rat) / 42) [(9, 1), (12, 2), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 385 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0385_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0385
        rs_R009_ueqv_R009YNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_27_0385 := by
  native_decide

/-- Coefficient term 386 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0386 : Poly :=
[
  term ((2172201733 : Rat) / 666166368) [(9, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 386 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0386 : Poly :=
[
  term ((-2172201733 : Rat) / 333083184) [(0, 1), (9, 1), (12, 2), (14, 1), (15, 1)],
  term ((2172201733 : Rat) / 666166368) [(0, 2), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-2172201733 : Rat) / 333083184) [(1, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((2172201733 : Rat) / 666166368) [(1, 2), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((2172201733 : Rat) / 333083184) [(9, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((-2172201733 : Rat) / 666166368) [(9, 1), (12, 1), (14, 1), (15, 3)],
  term ((-2172201733 : Rat) / 666166368) [(9, 1), (12, 1), (14, 3), (15, 1)],
  term ((2172201733 : Rat) / 333083184) [(9, 1), (12, 2), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 386 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0386_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0386
        rs_R009_ueqv_R009YNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_27_0386 := by
  native_decide

/-- Coefficient term 387 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0387 : Poly :=
[
  term ((-10110568816218515 : Rat) / 139251420568512) [(9, 1), (12, 1), (15, 1)]
]

/-- Partial product 387 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0387 : Poly :=
[
  term ((10110568816218515 : Rat) / 69625710284256) [(0, 1), (9, 1), (12, 2), (15, 1)],
  term ((-10110568816218515 : Rat) / 139251420568512) [(0, 2), (9, 1), (12, 1), (15, 1)],
  term ((10110568816218515 : Rat) / 69625710284256) [(1, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((-10110568816218515 : Rat) / 139251420568512) [(1, 2), (9, 1), (12, 1), (15, 1)],
  term ((-10110568816218515 : Rat) / 69625710284256) [(9, 1), (12, 1), (13, 1), (15, 2)],
  term ((10110568816218515 : Rat) / 139251420568512) [(9, 1), (12, 1), (14, 2), (15, 1)],
  term ((10110568816218515 : Rat) / 139251420568512) [(9, 1), (12, 1), (15, 3)],
  term ((-10110568816218515 : Rat) / 69625710284256) [(9, 1), (12, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 387 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0387_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0387
        rs_R009_ueqv_R009YNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_27_0387 := by
  native_decide

/-- Coefficient term 388 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0388 : Poly :=
[
  term ((32 : Rat) / 7) [(9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 388 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0388 : Poly :=
[
  term ((-64 : Rat) / 7) [(0, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((32 : Rat) / 7) [(0, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-64 : Rat) / 7) [(1, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((32 : Rat) / 7) [(1, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((64 : Rat) / 7) [(9, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-32 : Rat) / 7) [(9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-32 : Rat) / 7) [(9, 1), (12, 1), (15, 3), (16, 1)],
  term ((64 : Rat) / 7) [(9, 1), (12, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 388 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0388_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0388
        rs_R009_ueqv_R009YNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_27_0388 := by
  native_decide

/-- Coefficient term 389 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0389 : Poly :=
[
  term ((1093190292828671 : Rat) / 3653827361856) [(9, 1), (13, 1)]
]

/-- Partial product 389 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0389 : Poly :=
[
  term ((-1093190292828671 : Rat) / 1826913680928) [(0, 1), (9, 1), (12, 1), (13, 1)],
  term ((1093190292828671 : Rat) / 3653827361856) [(0, 2), (9, 1), (13, 1)],
  term ((-1093190292828671 : Rat) / 1826913680928) [(1, 1), (9, 1), (13, 2)],
  term ((1093190292828671 : Rat) / 3653827361856) [(1, 2), (9, 1), (13, 1)],
  term ((1093190292828671 : Rat) / 1826913680928) [(9, 1), (12, 1), (13, 1), (14, 1)],
  term ((-1093190292828671 : Rat) / 3653827361856) [(9, 1), (13, 1), (14, 2)],
  term ((-1093190292828671 : Rat) / 3653827361856) [(9, 1), (13, 1), (15, 2)],
  term ((1093190292828671 : Rat) / 1826913680928) [(9, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 389 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0389_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0389
        rs_R009_ueqv_R009YNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_27_0389 := by
  native_decide

/-- Coefficient term 390 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0390 : Poly :=
[
  term ((737561516355011 : Rat) / 8525597177664) [(9, 1), (13, 1), (14, 1)]
]

/-- Partial product 390 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0390 : Poly :=
[
  term ((-737561516355011 : Rat) / 4262798588832) [(0, 1), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((737561516355011 : Rat) / 8525597177664) [(0, 2), (9, 1), (13, 1), (14, 1)],
  term ((-737561516355011 : Rat) / 4262798588832) [(1, 1), (9, 1), (13, 2), (14, 1)],
  term ((737561516355011 : Rat) / 8525597177664) [(1, 2), (9, 1), (13, 1), (14, 1)],
  term ((737561516355011 : Rat) / 4262798588832) [(9, 1), (12, 1), (13, 1), (14, 2)],
  term ((-737561516355011 : Rat) / 8525597177664) [(9, 1), (13, 1), (14, 1), (15, 2)],
  term ((-737561516355011 : Rat) / 8525597177664) [(9, 1), (13, 1), (14, 3)],
  term ((737561516355011 : Rat) / 4262798588832) [(9, 1), (13, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 390 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0390_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0390
        rs_R009_ueqv_R009YNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_27_0390 := by
  native_decide

/-- Coefficient term 391 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0391 : Poly :=
[
  term ((-3125 : Rat) / 168) [(9, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 391 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0391 : Poly :=
[
  term ((3125 : Rat) / 84) [(0, 1), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-3125 : Rat) / 168) [(0, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((3125 : Rat) / 84) [(1, 1), (9, 1), (13, 2), (14, 1), (16, 1)],
  term ((-3125 : Rat) / 168) [(1, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-3125 : Rat) / 84) [(9, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((3125 : Rat) / 168) [(9, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((3125 : Rat) / 168) [(9, 1), (13, 1), (14, 3), (16, 1)],
  term ((-3125 : Rat) / 84) [(9, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 391 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0391_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0391
        rs_R009_ueqv_R009YNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_27_0391 := by
  native_decide

/-- Coefficient term 392 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0392 : Poly :=
[
  term ((-6422908767787 : Rat) / 157881429216) [(9, 1), (13, 1), (14, 2)]
]

/-- Partial product 392 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0392 : Poly :=
[
  term ((6422908767787 : Rat) / 78940714608) [(0, 1), (9, 1), (12, 1), (13, 1), (14, 2)],
  term ((-6422908767787 : Rat) / 157881429216) [(0, 2), (9, 1), (13, 1), (14, 2)],
  term ((6422908767787 : Rat) / 78940714608) [(1, 1), (9, 1), (13, 2), (14, 2)],
  term ((-6422908767787 : Rat) / 157881429216) [(1, 2), (9, 1), (13, 1), (14, 2)],
  term ((-6422908767787 : Rat) / 78940714608) [(9, 1), (12, 1), (13, 1), (14, 3)],
  term ((6422908767787 : Rat) / 157881429216) [(9, 1), (13, 1), (14, 2), (15, 2)],
  term ((6422908767787 : Rat) / 157881429216) [(9, 1), (13, 1), (14, 4)],
  term ((-6422908767787 : Rat) / 78940714608) [(9, 1), (13, 2), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 392 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0392_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0392
        rs_R009_ueqv_R009YNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_27_0392 := by
  native_decide

/-- Coefficient term 393 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0393 : Poly :=
[
  term ((305 : Rat) / 56) [(9, 1), (13, 1), (14, 2), (16, 1)]
]

/-- Partial product 393 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0393 : Poly :=
[
  term ((-305 : Rat) / 28) [(0, 1), (9, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((305 : Rat) / 56) [(0, 2), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((-305 : Rat) / 28) [(1, 1), (9, 1), (13, 2), (14, 2), (16, 1)],
  term ((305 : Rat) / 56) [(1, 2), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((305 : Rat) / 28) [(9, 1), (12, 1), (13, 1), (14, 3), (16, 1)],
  term ((-305 : Rat) / 56) [(9, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-305 : Rat) / 56) [(9, 1), (13, 1), (14, 4), (16, 1)],
  term ((305 : Rat) / 28) [(9, 1), (13, 2), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 393 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0393_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0393
        rs_R009_ueqv_R009YNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_27_0393 := by
  native_decide

/-- Coefficient term 394 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0394 : Poly :=
[
  term ((2954048478533 : Rat) / 78940714608) [(9, 1), (13, 1), (15, 2)]
]

/-- Partial product 394 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0394 : Poly :=
[
  term ((-2954048478533 : Rat) / 39470357304) [(0, 1), (9, 1), (12, 1), (13, 1), (15, 2)],
  term ((2954048478533 : Rat) / 78940714608) [(0, 2), (9, 1), (13, 1), (15, 2)],
  term ((-2954048478533 : Rat) / 39470357304) [(1, 1), (9, 1), (13, 2), (15, 2)],
  term ((2954048478533 : Rat) / 78940714608) [(1, 2), (9, 1), (13, 1), (15, 2)],
  term ((2954048478533 : Rat) / 39470357304) [(9, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((-2954048478533 : Rat) / 78940714608) [(9, 1), (13, 1), (14, 2), (15, 2)],
  term ((-2954048478533 : Rat) / 78940714608) [(9, 1), (13, 1), (15, 4)],
  term ((2954048478533 : Rat) / 39470357304) [(9, 1), (13, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 394 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0394_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0394
        rs_R009_ueqv_R009YNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_27_0394 := by
  native_decide

/-- Coefficient term 395 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0395 : Poly :=
[
  term ((-305 : Rat) / 56) [(9, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 395 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0395 : Poly :=
[
  term ((305 : Rat) / 28) [(0, 1), (9, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-305 : Rat) / 56) [(0, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((305 : Rat) / 28) [(1, 1), (9, 1), (13, 2), (15, 2), (16, 1)],
  term ((-305 : Rat) / 56) [(1, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-305 : Rat) / 28) [(9, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((305 : Rat) / 56) [(9, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((305 : Rat) / 56) [(9, 1), (13, 1), (15, 4), (16, 1)],
  term ((-305 : Rat) / 28) [(9, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 395 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0395_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0395
        rs_R009_ueqv_R009YNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_27_0395 := by
  native_decide

/-- Coefficient term 396 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0396 : Poly :=
[
  term ((1055 : Rat) / 168) [(9, 1), (13, 1), (16, 1)]
]

/-- Partial product 396 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0396 : Poly :=
[
  term ((-1055 : Rat) / 84) [(0, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((1055 : Rat) / 168) [(0, 2), (9, 1), (13, 1), (16, 1)],
  term ((-1055 : Rat) / 84) [(1, 1), (9, 1), (13, 2), (16, 1)],
  term ((1055 : Rat) / 168) [(1, 2), (9, 1), (13, 1), (16, 1)],
  term ((1055 : Rat) / 84) [(9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1055 : Rat) / 168) [(9, 1), (13, 1), (14, 2), (16, 1)],
  term ((-1055 : Rat) / 168) [(9, 1), (13, 1), (15, 2), (16, 1)],
  term ((1055 : Rat) / 84) [(9, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 396 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0396_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0396
        rs_R009_ueqv_R009YNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_27_0396 := by
  native_decide

/-- Coefficient term 397 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0397 : Poly :=
[
  term ((-68639871059025277 : Rat) / 78328924069788) [(9, 1), (14, 1), (15, 1)]
]

/-- Partial product 397 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0397 : Poly :=
[
  term ((68639871059025277 : Rat) / 39164462034894) [(0, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-68639871059025277 : Rat) / 78328924069788) [(0, 2), (9, 1), (14, 1), (15, 1)],
  term ((68639871059025277 : Rat) / 39164462034894) [(1, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((-68639871059025277 : Rat) / 78328924069788) [(1, 2), (9, 1), (14, 1), (15, 1)],
  term ((-68639871059025277 : Rat) / 39164462034894) [(9, 1), (12, 1), (14, 2), (15, 1)],
  term ((-68639871059025277 : Rat) / 39164462034894) [(9, 1), (13, 1), (14, 1), (15, 2)],
  term ((68639871059025277 : Rat) / 78328924069788) [(9, 1), (14, 1), (15, 3)],
  term ((68639871059025277 : Rat) / 78328924069788) [(9, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 397 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0397_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0397
        rs_R009_ueqv_R009YNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_27_0397 := by
  native_decide

/-- Coefficient term 398 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0398 : Poly :=
[
  term ((649 : Rat) / 42) [(9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 398 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0398 : Poly :=
[
  term ((-649 : Rat) / 21) [(0, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((649 : Rat) / 42) [(0, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-649 : Rat) / 21) [(1, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((649 : Rat) / 42) [(1, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((649 : Rat) / 21) [(9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((649 : Rat) / 21) [(9, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-649 : Rat) / 42) [(9, 1), (14, 1), (15, 3), (16, 1)],
  term ((-649 : Rat) / 42) [(9, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 398 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0398_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0398
        rs_R009_ueqv_R009YNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_27_0398 := by
  native_decide

/-- Coefficient term 399 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0399 : Poly :=
[
  term ((3366906314273 : Rat) / 59205535956) [(9, 1), (14, 2), (15, 1)]
]

/-- Partial product 399 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0399 : Poly :=
[
  term ((-3366906314273 : Rat) / 29602767978) [(0, 1), (9, 1), (12, 1), (14, 2), (15, 1)],
  term ((3366906314273 : Rat) / 59205535956) [(0, 2), (9, 1), (14, 2), (15, 1)],
  term ((-3366906314273 : Rat) / 29602767978) [(1, 1), (9, 1), (13, 1), (14, 2), (15, 1)],
  term ((3366906314273 : Rat) / 59205535956) [(1, 2), (9, 1), (14, 2), (15, 1)],
  term ((3366906314273 : Rat) / 29602767978) [(9, 1), (12, 1), (14, 3), (15, 1)],
  term ((3366906314273 : Rat) / 29602767978) [(9, 1), (13, 1), (14, 2), (15, 2)],
  term ((-3366906314273 : Rat) / 59205535956) [(9, 1), (14, 2), (15, 3)],
  term ((-3366906314273 : Rat) / 59205535956) [(9, 1), (14, 4), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 399 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0399_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0399
        rs_R009_ueqv_R009YNNNN_generator_27_0300_0399 =
      rs_R009_ueqv_R009YNNNN_partial_27_0399 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009YNNNN_partials_27_0300_0399 : List Poly :=
[
  rs_R009_ueqv_R009YNNNN_partial_27_0300,
  rs_R009_ueqv_R009YNNNN_partial_27_0301,
  rs_R009_ueqv_R009YNNNN_partial_27_0302,
  rs_R009_ueqv_R009YNNNN_partial_27_0303,
  rs_R009_ueqv_R009YNNNN_partial_27_0304,
  rs_R009_ueqv_R009YNNNN_partial_27_0305,
  rs_R009_ueqv_R009YNNNN_partial_27_0306,
  rs_R009_ueqv_R009YNNNN_partial_27_0307,
  rs_R009_ueqv_R009YNNNN_partial_27_0308,
  rs_R009_ueqv_R009YNNNN_partial_27_0309,
  rs_R009_ueqv_R009YNNNN_partial_27_0310,
  rs_R009_ueqv_R009YNNNN_partial_27_0311,
  rs_R009_ueqv_R009YNNNN_partial_27_0312,
  rs_R009_ueqv_R009YNNNN_partial_27_0313,
  rs_R009_ueqv_R009YNNNN_partial_27_0314,
  rs_R009_ueqv_R009YNNNN_partial_27_0315,
  rs_R009_ueqv_R009YNNNN_partial_27_0316,
  rs_R009_ueqv_R009YNNNN_partial_27_0317,
  rs_R009_ueqv_R009YNNNN_partial_27_0318,
  rs_R009_ueqv_R009YNNNN_partial_27_0319,
  rs_R009_ueqv_R009YNNNN_partial_27_0320,
  rs_R009_ueqv_R009YNNNN_partial_27_0321,
  rs_R009_ueqv_R009YNNNN_partial_27_0322,
  rs_R009_ueqv_R009YNNNN_partial_27_0323,
  rs_R009_ueqv_R009YNNNN_partial_27_0324,
  rs_R009_ueqv_R009YNNNN_partial_27_0325,
  rs_R009_ueqv_R009YNNNN_partial_27_0326,
  rs_R009_ueqv_R009YNNNN_partial_27_0327,
  rs_R009_ueqv_R009YNNNN_partial_27_0328,
  rs_R009_ueqv_R009YNNNN_partial_27_0329,
  rs_R009_ueqv_R009YNNNN_partial_27_0330,
  rs_R009_ueqv_R009YNNNN_partial_27_0331,
  rs_R009_ueqv_R009YNNNN_partial_27_0332,
  rs_R009_ueqv_R009YNNNN_partial_27_0333,
  rs_R009_ueqv_R009YNNNN_partial_27_0334,
  rs_R009_ueqv_R009YNNNN_partial_27_0335,
  rs_R009_ueqv_R009YNNNN_partial_27_0336,
  rs_R009_ueqv_R009YNNNN_partial_27_0337,
  rs_R009_ueqv_R009YNNNN_partial_27_0338,
  rs_R009_ueqv_R009YNNNN_partial_27_0339,
  rs_R009_ueqv_R009YNNNN_partial_27_0340,
  rs_R009_ueqv_R009YNNNN_partial_27_0341,
  rs_R009_ueqv_R009YNNNN_partial_27_0342,
  rs_R009_ueqv_R009YNNNN_partial_27_0343,
  rs_R009_ueqv_R009YNNNN_partial_27_0344,
  rs_R009_ueqv_R009YNNNN_partial_27_0345,
  rs_R009_ueqv_R009YNNNN_partial_27_0346,
  rs_R009_ueqv_R009YNNNN_partial_27_0347,
  rs_R009_ueqv_R009YNNNN_partial_27_0348,
  rs_R009_ueqv_R009YNNNN_partial_27_0349,
  rs_R009_ueqv_R009YNNNN_partial_27_0350,
  rs_R009_ueqv_R009YNNNN_partial_27_0351,
  rs_R009_ueqv_R009YNNNN_partial_27_0352,
  rs_R009_ueqv_R009YNNNN_partial_27_0353,
  rs_R009_ueqv_R009YNNNN_partial_27_0354,
  rs_R009_ueqv_R009YNNNN_partial_27_0355,
  rs_R009_ueqv_R009YNNNN_partial_27_0356,
  rs_R009_ueqv_R009YNNNN_partial_27_0357,
  rs_R009_ueqv_R009YNNNN_partial_27_0358,
  rs_R009_ueqv_R009YNNNN_partial_27_0359,
  rs_R009_ueqv_R009YNNNN_partial_27_0360,
  rs_R009_ueqv_R009YNNNN_partial_27_0361,
  rs_R009_ueqv_R009YNNNN_partial_27_0362,
  rs_R009_ueqv_R009YNNNN_partial_27_0363,
  rs_R009_ueqv_R009YNNNN_partial_27_0364,
  rs_R009_ueqv_R009YNNNN_partial_27_0365,
  rs_R009_ueqv_R009YNNNN_partial_27_0366,
  rs_R009_ueqv_R009YNNNN_partial_27_0367,
  rs_R009_ueqv_R009YNNNN_partial_27_0368,
  rs_R009_ueqv_R009YNNNN_partial_27_0369,
  rs_R009_ueqv_R009YNNNN_partial_27_0370,
  rs_R009_ueqv_R009YNNNN_partial_27_0371,
  rs_R009_ueqv_R009YNNNN_partial_27_0372,
  rs_R009_ueqv_R009YNNNN_partial_27_0373,
  rs_R009_ueqv_R009YNNNN_partial_27_0374,
  rs_R009_ueqv_R009YNNNN_partial_27_0375,
  rs_R009_ueqv_R009YNNNN_partial_27_0376,
  rs_R009_ueqv_R009YNNNN_partial_27_0377,
  rs_R009_ueqv_R009YNNNN_partial_27_0378,
  rs_R009_ueqv_R009YNNNN_partial_27_0379,
  rs_R009_ueqv_R009YNNNN_partial_27_0380,
  rs_R009_ueqv_R009YNNNN_partial_27_0381,
  rs_R009_ueqv_R009YNNNN_partial_27_0382,
  rs_R009_ueqv_R009YNNNN_partial_27_0383,
  rs_R009_ueqv_R009YNNNN_partial_27_0384,
  rs_R009_ueqv_R009YNNNN_partial_27_0385,
  rs_R009_ueqv_R009YNNNN_partial_27_0386,
  rs_R009_ueqv_R009YNNNN_partial_27_0387,
  rs_R009_ueqv_R009YNNNN_partial_27_0388,
  rs_R009_ueqv_R009YNNNN_partial_27_0389,
  rs_R009_ueqv_R009YNNNN_partial_27_0390,
  rs_R009_ueqv_R009YNNNN_partial_27_0391,
  rs_R009_ueqv_R009YNNNN_partial_27_0392,
  rs_R009_ueqv_R009YNNNN_partial_27_0393,
  rs_R009_ueqv_R009YNNNN_partial_27_0394,
  rs_R009_ueqv_R009YNNNN_partial_27_0395,
  rs_R009_ueqv_R009YNNNN_partial_27_0396,
  rs_R009_ueqv_R009YNNNN_partial_27_0397,
  rs_R009_ueqv_R009YNNNN_partial_27_0398,
  rs_R009_ueqv_R009YNNNN_partial_27_0399
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009YNNNN_block_27_0300_0399 : Poly :=
[
  term ((71946724318135 : Rat) / 5802142523688) [(0, 1), (6, 1), (9, 2), (12, 1)],
  term ((-2172201733 : Rat) / 166541592) [(0, 1), (6, 1), (9, 2), (12, 2)],
  term ((-209812062200357 : Rat) / 322341251316) [(0, 1), (6, 1), (10, 1), (12, 1)],
  term ((-1005180329591 : Rat) / 14801383989) [(0, 1), (6, 1), (10, 1), (12, 1), (14, 1)],
  term ((45633955946145352 : Rat) / 19582231017447) [(0, 1), (6, 1), (11, 1), (12, 1), (13, 1)],
  term ((340 : Rat) / 63) [(0, 1), (6, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(0, 1), (6, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-8221004010898040 : Rat) / 6527410339149) [(0, 1), (6, 1), (11, 1), (12, 1), (15, 1)],
  term ((-64 : Rat) / 9) [(0, 1), (6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((706121836024930 : Rat) / 6527410339149) [(0, 1), (6, 1), (11, 1), (12, 2), (15, 1)],
  term ((6891415608682258 : Rat) / 6527410339149) [(0, 1), (6, 1), (11, 2), (12, 1)],
  term ((-845559837599 : Rat) / 241755938487) [(0, 1), (6, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-21692829505604683 : Rat) / 4351606892766) [(0, 1), (6, 1), (12, 1), (13, 1), (15, 1)],
  term ((3589 : Rat) / 126) [(0, 1), (6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((560763766053622 : Rat) / 399637367703) [(0, 1), (6, 1), (12, 1), (13, 2)],
  term ((340 : Rat) / 63) [(0, 1), (6, 1), (12, 1), (13, 2), (16, 1)],
  term ((2944249555176373 : Rat) / 2901071261844) [(0, 1), (6, 1), (12, 1), (14, 1)],
  term ((-9193198696854 : Rat) / 26861770943) [(0, 1), (6, 1), (12, 1), (14, 1), (15, 2)],
  term ((-28425155928161 : Rat) / 483511876974) [(0, 1), (6, 1), (12, 1), (14, 2)],
  term ((6290114302379351 : Rat) / 2175803446383) [(0, 1), (6, 1), (12, 1), (15, 2)],
  term ((-494 : Rat) / 21) [(0, 1), (6, 1), (12, 1), (15, 2), (16, 1)],
  term ((2224986028928059 : Rat) / 1598549470812) [(0, 1), (6, 1), (12, 2), (13, 1), (15, 1)],
  term ((-1495 : Rat) / 126) [(0, 1), (6, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(0, 1), (6, 1), (12, 2), (14, 1), (15, 2)],
  term ((-140138745041977 : Rat) / 165250894662) [(0, 1), (6, 1), (12, 2), (15, 2)],
  term ((494 : Rat) / 63) [(0, 1), (6, 1), (12, 2), (15, 2), (16, 1)],
  term ((-69282374274035 : Rat) / 40469606856) [(0, 1), (7, 1), (9, 1), (10, 1), (12, 1)],
  term ((1150854976623484333 : Rat) / 313315696279152) [(0, 1), (7, 1), (9, 1), (12, 1)],
  term ((-206185803715802887 : Rat) / 52219282713192) [(0, 1), (7, 1), (9, 1), (12, 1), (14, 1)],
  term ((-3849005354029 : Rat) / 1289365005264) [(0, 1), (7, 1), (9, 1), (12, 2)],
  term ((53777198303881 : Rat) / 40469606856) [(0, 1), (7, 1), (9, 1), (12, 2), (14, 1)],
  term ((-36984430141213349 : Rat) / 13054820678298) [(0, 1), (7, 1), (10, 1), (11, 1), (12, 1)],
  term ((2796461151655097 : Rat) / 1598549470812) [(0, 1), (7, 1), (10, 1), (12, 1), (13, 1)],
  term ((-8525 : Rat) / 126) [(0, 1), (7, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-4671577345927976 : Rat) / 6527410339149) [(0, 1), (7, 1), (10, 1), (12, 1), (15, 1)],
  term ((3466 : Rat) / 63) [(0, 1), (7, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-430369017280645 : Rat) / 4351606892766) [(0, 1), (7, 1), (11, 1), (12, 1)],
  term ((-38302929158275897 : Rat) / 13054820678298) [(0, 1), (7, 1), (11, 1), (12, 1), (14, 1)],
  term ((-333108 : Rat) / 553) [(0, 1), (7, 1), (11, 1), (12, 2)],
  term ((-706121836024930 : Rat) / 6527410339149) [(0, 1), (7, 1), (11, 1), (12, 2), (14, 1)],
  term ((-515963868277391503 : Rat) / 156657848139576) [(0, 1), (7, 1), (12, 1), (13, 1)],
  term ((103949669736811483 : Rat) / 26109641356596) [(0, 1), (7, 1), (12, 1), (13, 1), (14, 1)],
  term ((-1495 : Rat) / 42) [(0, 1), (7, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((1532199782809 : Rat) / 26861770943) [(0, 1), (7, 1), (12, 1), (13, 1), (14, 2)],
  term ((25885 : Rat) / 252) [(0, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((-22183802776035443 : Rat) / 13054820678298) [(0, 1), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((494 : Rat) / 21) [(0, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((9193198696854 : Rat) / 26861770943) [(0, 1), (7, 1), (12, 1), (14, 2), (15, 1)],
  term ((25114142040388049 : Rat) / 3729948765228) [(0, 1), (7, 1), (12, 1), (15, 1)],
  term ((-5149 : Rat) / 63) [(0, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-941242657 : Rat) / 166541592) [(0, 1), (7, 1), (12, 2), (13, 1)],
  term ((-2224986028928059 : Rat) / 1598549470812) [(0, 1), (7, 1), (12, 2), (13, 1), (14, 1)],
  term ((1495 : Rat) / 126) [(0, 1), (7, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-725 : Rat) / 84) [(0, 1), (7, 1), (12, 2), (13, 1), (16, 1)],
  term ((150142660556857 : Rat) / 165250894662) [(0, 1), (7, 1), (12, 2), (14, 1), (15, 1)],
  term ((-494 : Rat) / 63) [(0, 1), (7, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(0, 1), (7, 1), (12, 2), (14, 2), (15, 1)],
  term ((148780745730977 : Rat) / 2901071261844) [(0, 1), (7, 1), (12, 2), (15, 1)],
  term ((157 : Rat) / 21) [(0, 1), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((-16224463500164501 : Rat) / 13054820678298) [(0, 1), (7, 2), (10, 1), (12, 1)],
  term ((1711467157397653 : Rat) / 6527410339149) [(0, 1), (7, 2), (12, 1)],
  term ((4349915183394751 : Rat) / 2175803446383) [(0, 1), (7, 2), (12, 1), (14, 1)],
  term ((-1532199782809 : Rat) / 161170625658) [(0, 1), (7, 2), (12, 2)],
  term ((-4349915183394751 : Rat) / 6527410339149) [(0, 1), (7, 2), (12, 2), (14, 1)],
  term ((7459770061393 : Rat) / 8457933708) [(0, 1), (9, 1), (10, 1), (11, 1), (12, 1)],
  term ((-59904 : Rat) / 553) [(0, 1), (9, 1), (10, 1), (11, 1), (12, 1), (14, 1)],
  term ((-9984 : Rat) / 553) [(0, 1), (9, 1), (10, 1), (11, 1), (12, 2)],
  term ((-74863841198371 : Rat) / 532849823604) [(0, 1), (9, 1), (10, 1), (12, 1), (13, 1)],
  term ((-8926828802611 : Rat) / 266424911802) [(0, 1), (9, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((-55 : Rat) / 14) [(0, 1), (9, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((295 : Rat) / 12) [(0, 1), (9, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((170525183774905 : Rat) / 355233215736) [(0, 1), (9, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((22 : Rat) / 7) [(0, 1), (9, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((4133771477798857 : Rat) / 3197098941624) [(0, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((-439 : Rat) / 21) [(0, 1), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((6090608323475 : Rat) / 266424911802) [(0, 1), (9, 1), (10, 1), (12, 2), (13, 1)],
  term ((-5 : Rat) / 3) [(0, 1), (9, 1), (10, 1), (12, 2), (13, 1), (16, 1)],
  term ((-30188368622915 : Rat) / 177616607868) [(0, 1), (9, 1), (10, 1), (12, 2), (15, 1)],
  term ((32 : Rat) / 21) [(0, 1), (9, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-3667089710400365 : Rat) / 12788395766496) [(0, 1), (9, 1), (11, 1), (12, 1)],
  term ((9518309600500579 : Rat) / 6394197883248) [(0, 1), (9, 1), (11, 1), (12, 1), (14, 1)],
  term ((-119808 : Rat) / 553) [(0, 1), (9, 1), (11, 1), (12, 1), (14, 2)],
  term ((9008294618453 : Rat) / 118411071912) [(0, 1), (9, 1), (11, 1), (12, 1), (15, 2)],
  term ((33225805736000 : Rat) / 133212455901) [(0, 1), (9, 1), (11, 1), (12, 2)],
  term ((-1093190292828671 : Rat) / 1826913680928) [(0, 1), (9, 1), (12, 1), (13, 1)],
  term ((-737561516355011 : Rat) / 4262798588832) [(0, 1), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((3125 : Rat) / 84) [(0, 1), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((6422908767787 : Rat) / 78940714608) [(0, 1), (9, 1), (12, 1), (13, 1), (14, 2)],
  term ((-305 : Rat) / 28) [(0, 1), (9, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((-2954048478533 : Rat) / 39470357304) [(0, 1), (9, 1), (12, 1), (13, 1), (15, 2)],
  term ((305 : Rat) / 28) [(0, 1), (9, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1055 : Rat) / 84) [(0, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((68639871059025277 : Rat) / 39164462034894) [(0, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-649 : Rat) / 21) [(0, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3366906314273 : Rat) / 29602767978) [(0, 1), (9, 1), (12, 1), (14, 2), (15, 1)],
  term ((-97923607474811 : Rat) / 532849823604) [(0, 1), (9, 1), (12, 2), (13, 1)],
  term ((475 : Rat) / 42) [(0, 1), (9, 1), (12, 2), (13, 1), (16, 1)],
  term ((-2172201733 : Rat) / 333083184) [(0, 1), (9, 1), (12, 2), (14, 1), (15, 1)],
  term ((10110568816218515 : Rat) / 69625710284256) [(0, 1), (9, 1), (12, 2), (15, 1)],
  term ((-64 : Rat) / 7) [(0, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-71946724318135 : Rat) / 11604285047376) [(0, 2), (6, 1), (9, 2)],
  term ((2172201733 : Rat) / 333083184) [(0, 2), (6, 1), (9, 2), (12, 1)],
  term ((209812062200357 : Rat) / 644682502632) [(0, 2), (6, 1), (10, 1)],
  term ((1005180329591 : Rat) / 29602767978) [(0, 2), (6, 1), (10, 1), (14, 1)],
  term ((-353060918012465 : Rat) / 6527410339149) [(0, 2), (6, 1), (11, 1), (12, 1), (15, 1)],
  term ((-22816977973072676 : Rat) / 19582231017447) [(0, 2), (6, 1), (11, 1), (13, 1)],
  term ((-170 : Rat) / 63) [(0, 2), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((-1532199782809 : Rat) / 26861770943) [(0, 2), (6, 1), (11, 1), (14, 1), (15, 1)],
  term ((4110502005449020 : Rat) / 6527410339149) [(0, 2), (6, 1), (11, 1), (15, 1)],
  term ((32 : Rat) / 9) [(0, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-3445707804341129 : Rat) / 6527410339149) [(0, 2), (6, 1), (11, 2)],
  term ((-2224986028928059 : Rat) / 3197098941624) [(0, 2), (6, 1), (12, 1), (13, 1), (15, 1)],
  term ((1495 : Rat) / 252) [(0, 2), (6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1532199782809 : Rat) / 26861770943) [(0, 2), (6, 1), (12, 1), (14, 1), (15, 2)],
  term ((140138745041977 : Rat) / 330501789324) [(0, 2), (6, 1), (12, 1), (15, 2)],
  term ((-247 : Rat) / 63) [(0, 2), (6, 1), (12, 1), (15, 2), (16, 1)],
  term ((845559837599 : Rat) / 483511876974) [(0, 2), (6, 1), (13, 1), (14, 1), (15, 1)],
  term ((21692829505604683 : Rat) / 8703213785532) [(0, 2), (6, 1), (13, 1), (15, 1)],
  term ((-3589 : Rat) / 252) [(0, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-280381883026811 : Rat) / 399637367703) [(0, 2), (6, 1), (13, 2)],
  term ((-170 : Rat) / 63) [(0, 2), (6, 1), (13, 2), (16, 1)],
  term ((-2944249555176373 : Rat) / 5802142523688) [(0, 2), (6, 1), (14, 1)],
  term ((4596599348427 : Rat) / 26861770943) [(0, 2), (6, 1), (14, 1), (15, 2)],
  term ((28425155928161 : Rat) / 967023753948) [(0, 2), (6, 1), (14, 2)],
  term ((-6290114302379351 : Rat) / 4351606892766) [(0, 2), (6, 1), (15, 2)],
  term ((247 : Rat) / 21) [(0, 2), (6, 1), (15, 2), (16, 1)],
  term ((-1150854976623484333 : Rat) / 626631392558304) [(0, 2), (7, 1), (9, 1)],
  term ((69282374274035 : Rat) / 80939213712) [(0, 2), (7, 1), (9, 1), (10, 1)],
  term ((3849005354029 : Rat) / 2578730010528) [(0, 2), (7, 1), (9, 1), (12, 1)],
  term ((-53777198303881 : Rat) / 80939213712) [(0, 2), (7, 1), (9, 1), (12, 1), (14, 1)],
  term ((206185803715802887 : Rat) / 104438565426384) [(0, 2), (7, 1), (9, 1), (14, 1)],
  term ((36984430141213349 : Rat) / 26109641356596) [(0, 2), (7, 1), (10, 1), (11, 1)],
  term ((-2796461151655097 : Rat) / 3197098941624) [(0, 2), (7, 1), (10, 1), (13, 1)],
  term ((8525 : Rat) / 252) [(0, 2), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((2335788672963988 : Rat) / 6527410339149) [(0, 2), (7, 1), (10, 1), (15, 1)],
  term ((-1733 : Rat) / 63) [(0, 2), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((430369017280645 : Rat) / 8703213785532) [(0, 2), (7, 1), (11, 1)],
  term ((166554 : Rat) / 553) [(0, 2), (7, 1), (11, 1), (12, 1)],
  term ((353060918012465 : Rat) / 6527410339149) [(0, 2), (7, 1), (11, 1), (12, 1), (14, 1)],
  term ((38302929158275897 : Rat) / 26109641356596) [(0, 2), (7, 1), (11, 1), (14, 1)],
  term ((941242657 : Rat) / 333083184) [(0, 2), (7, 1), (12, 1), (13, 1)],
  term ((2224986028928059 : Rat) / 3197098941624) [(0, 2), (7, 1), (12, 1), (13, 1), (14, 1)],
  term ((-1495 : Rat) / 252) [(0, 2), (7, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((725 : Rat) / 168) [(0, 2), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((-150142660556857 : Rat) / 330501789324) [(0, 2), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((247 : Rat) / 63) [(0, 2), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((1532199782809 : Rat) / 26861770943) [(0, 2), (7, 1), (12, 1), (14, 2), (15, 1)],
  term ((-148780745730977 : Rat) / 5802142523688) [(0, 2), (7, 1), (12, 1), (15, 1)],
  term ((-157 : Rat) / 42) [(0, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((515963868277391503 : Rat) / 313315696279152) [(0, 2), (7, 1), (13, 1)],
  term ((-103949669736811483 : Rat) / 52219282713192) [(0, 2), (7, 1), (13, 1), (14, 1)],
  term ((1495 : Rat) / 84) [(0, 2), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1532199782809 : Rat) / 53723541886) [(0, 2), (7, 1), (13, 1), (14, 2)],
  term ((-25885 : Rat) / 504) [(0, 2), (7, 1), (13, 1), (16, 1)],
  term ((22183802776035443 : Rat) / 26109641356596) [(0, 2), (7, 1), (14, 1), (15, 1)],
  term ((-247 : Rat) / 21) [(0, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4596599348427 : Rat) / 26861770943) [(0, 2), (7, 1), (14, 2), (15, 1)],
  term ((-25114142040388049 : Rat) / 7459897530456) [(0, 2), (7, 1), (15, 1)],
  term ((5149 : Rat) / 126) [(0, 2), (7, 1), (15, 1), (16, 1)],
  term ((-1711467157397653 : Rat) / 13054820678298) [(0, 2), (7, 2)],
  term ((16224463500164501 : Rat) / 26109641356596) [(0, 2), (7, 2), (10, 1)],
  term ((1532199782809 : Rat) / 322341251316) [(0, 2), (7, 2), (12, 1)],
  term ((4349915183394751 : Rat) / 13054820678298) [(0, 2), (7, 2), (12, 1), (14, 1)],
  term ((-4349915183394751 : Rat) / 4351606892766) [(0, 2), (7, 2), (14, 1)],
  term ((-7459770061393 : Rat) / 16915867416) [(0, 2), (9, 1), (10, 1), (11, 1)],
  term ((4992 : Rat) / 553) [(0, 2), (9, 1), (10, 1), (11, 1), (12, 1)],
  term ((29952 : Rat) / 553) [(0, 2), (9, 1), (10, 1), (11, 1), (14, 1)],
  term ((-6090608323475 : Rat) / 532849823604) [(0, 2), (9, 1), (10, 1), (12, 1), (13, 1)],
  term ((5 : Rat) / 6) [(0, 2), (9, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((30188368622915 : Rat) / 355233215736) [(0, 2), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((-16 : Rat) / 21) [(0, 2), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((74863841198371 : Rat) / 1065699647208) [(0, 2), (9, 1), (10, 1), (13, 1)],
  term ((8926828802611 : Rat) / 532849823604) [(0, 2), (9, 1), (10, 1), (13, 1), (14, 1)],
  term ((55 : Rat) / 28) [(0, 2), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-295 : Rat) / 24) [(0, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-170525183774905 : Rat) / 710466431472) [(0, 2), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((-11 : Rat) / 7) [(0, 2), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4133771477798857 : Rat) / 6394197883248) [(0, 2), (9, 1), (10, 1), (15, 1)],
  term ((439 : Rat) / 42) [(0, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((3667089710400365 : Rat) / 25576791532992) [(0, 2), (9, 1), (11, 1)],
  term ((-16612902868000 : Rat) / 133212455901) [(0, 2), (9, 1), (11, 1), (12, 1)],
  term ((-9518309600500579 : Rat) / 12788395766496) [(0, 2), (9, 1), (11, 1), (14, 1)],
  term ((59904 : Rat) / 553) [(0, 2), (9, 1), (11, 1), (14, 2)],
  term ((-9008294618453 : Rat) / 236822143824) [(0, 2), (9, 1), (11, 1), (15, 2)],
  term ((97923607474811 : Rat) / 1065699647208) [(0, 2), (9, 1), (12, 1), (13, 1)],
  term ((-475 : Rat) / 84) [(0, 2), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((2172201733 : Rat) / 666166368) [(0, 2), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-10110568816218515 : Rat) / 139251420568512) [(0, 2), (9, 1), (12, 1), (15, 1)],
  term ((32 : Rat) / 7) [(0, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((1093190292828671 : Rat) / 3653827361856) [(0, 2), (9, 1), (13, 1)],
  term ((737561516355011 : Rat) / 8525597177664) [(0, 2), (9, 1), (13, 1), (14, 1)],
  term ((-3125 : Rat) / 168) [(0, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-6422908767787 : Rat) / 157881429216) [(0, 2), (9, 1), (13, 1), (14, 2)],
  term ((305 : Rat) / 56) [(0, 2), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((2954048478533 : Rat) / 78940714608) [(0, 2), (9, 1), (13, 1), (15, 2)],
  term ((-305 : Rat) / 56) [(0, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((1055 : Rat) / 168) [(0, 2), (9, 1), (13, 1), (16, 1)],
  term ((-68639871059025277 : Rat) / 78328924069788) [(0, 2), (9, 1), (14, 1), (15, 1)],
  term ((649 : Rat) / 42) [(0, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((3366906314273 : Rat) / 59205535956) [(0, 2), (9, 1), (14, 2), (15, 1)],
  term ((-2172201733 : Rat) / 166541592) [(1, 1), (6, 1), (9, 2), (12, 1), (13, 1)],
  term ((71946724318135 : Rat) / 5802142523688) [(1, 1), (6, 1), (9, 2), (13, 1)],
  term ((-209812062200357 : Rat) / 322341251316) [(1, 1), (6, 1), (10, 1), (13, 1)],
  term ((-1005180329591 : Rat) / 14801383989) [(1, 1), (6, 1), (10, 1), (13, 1), (14, 1)],
  term ((706121836024930 : Rat) / 6527410339149) [(1, 1), (6, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(1, 1), (6, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-8221004010898040 : Rat) / 6527410339149) [(1, 1), (6, 1), (11, 1), (13, 1), (15, 1)],
  term ((-64 : Rat) / 9) [(1, 1), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((45633955946145352 : Rat) / 19582231017447) [(1, 1), (6, 1), (11, 1), (13, 2)],
  term ((340 : Rat) / 63) [(1, 1), (6, 1), (11, 1), (13, 2), (16, 1)],
  term ((6891415608682258 : Rat) / 6527410339149) [(1, 1), (6, 1), (11, 2), (13, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(1, 1), (6, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((-140138745041977 : Rat) / 165250894662) [(1, 1), (6, 1), (12, 1), (13, 1), (15, 2)],
  term ((494 : Rat) / 63) [(1, 1), (6, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((2224986028928059 : Rat) / 1598549470812) [(1, 1), (6, 1), (12, 1), (13, 2), (15, 1)],
  term ((-1495 : Rat) / 126) [(1, 1), (6, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((2944249555176373 : Rat) / 2901071261844) [(1, 1), (6, 1), (13, 1), (14, 1)],
  term ((-9193198696854 : Rat) / 26861770943) [(1, 1), (6, 1), (13, 1), (14, 1), (15, 2)],
  term ((-28425155928161 : Rat) / 483511876974) [(1, 1), (6, 1), (13, 1), (14, 2)],
  term ((6290114302379351 : Rat) / 2175803446383) [(1, 1), (6, 1), (13, 1), (15, 2)],
  term ((-494 : Rat) / 21) [(1, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((-845559837599 : Rat) / 241755938487) [(1, 1), (6, 1), (13, 2), (14, 1), (15, 1)],
  term ((-21692829505604683 : Rat) / 4351606892766) [(1, 1), (6, 1), (13, 2), (15, 1)],
  term ((3589 : Rat) / 126) [(1, 1), (6, 1), (13, 2), (15, 1), (16, 1)],
  term ((560763766053622 : Rat) / 399637367703) [(1, 1), (6, 1), (13, 3)],
  term ((340 : Rat) / 63) [(1, 1), (6, 1), (13, 3), (16, 1)],
  term ((-69282374274035 : Rat) / 40469606856) [(1, 1), (7, 1), (9, 1), (10, 1), (13, 1)],
  term ((-3849005354029 : Rat) / 1289365005264) [(1, 1), (7, 1), (9, 1), (12, 1), (13, 1)],
  term ((53777198303881 : Rat) / 40469606856) [(1, 1), (7, 1), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((1150854976623484333 : Rat) / 313315696279152) [(1, 1), (7, 1), (9, 1), (13, 1)],
  term ((-206185803715802887 : Rat) / 52219282713192) [(1, 1), (7, 1), (9, 1), (13, 1), (14, 1)],
  term ((-36984430141213349 : Rat) / 13054820678298) [(1, 1), (7, 1), (10, 1), (11, 1), (13, 1)],
  term ((-4671577345927976 : Rat) / 6527410339149) [(1, 1), (7, 1), (10, 1), (13, 1), (15, 1)],
  term ((3466 : Rat) / 63) [(1, 1), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((2796461151655097 : Rat) / 1598549470812) [(1, 1), (7, 1), (10, 1), (13, 2)],
  term ((-8525 : Rat) / 126) [(1, 1), (7, 1), (10, 1), (13, 2), (16, 1)],
  term ((-333108 : Rat) / 553) [(1, 1), (7, 1), (11, 1), (12, 1), (13, 1)],
  term ((-706121836024930 : Rat) / 6527410339149) [(1, 1), (7, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-430369017280645 : Rat) / 4351606892766) [(1, 1), (7, 1), (11, 1), (13, 1)],
  term ((-38302929158275897 : Rat) / 13054820678298) [(1, 1), (7, 1), (11, 1), (13, 1), (14, 1)],
  term ((150142660556857 : Rat) / 165250894662) [(1, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-494 : Rat) / 63) [(1, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(1, 1), (7, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((148780745730977 : Rat) / 2901071261844) [(1, 1), (7, 1), (12, 1), (13, 1), (15, 1)],
  term ((157 : Rat) / 21) [(1, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-941242657 : Rat) / 166541592) [(1, 1), (7, 1), (12, 1), (13, 2)],
  term ((-2224986028928059 : Rat) / 1598549470812) [(1, 1), (7, 1), (12, 1), (13, 2), (14, 1)],
  term ((1495 : Rat) / 126) [(1, 1), (7, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-725 : Rat) / 84) [(1, 1), (7, 1), (12, 1), (13, 2), (16, 1)],
  term ((-22183802776035443 : Rat) / 13054820678298) [(1, 1), (7, 1), (13, 1), (14, 1), (15, 1)],
  term ((494 : Rat) / 21) [(1, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((9193198696854 : Rat) / 26861770943) [(1, 1), (7, 1), (13, 1), (14, 2), (15, 1)],
  term ((25114142040388049 : Rat) / 3729948765228) [(1, 1), (7, 1), (13, 1), (15, 1)],
  term ((-5149 : Rat) / 63) [(1, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-515963868277391503 : Rat) / 156657848139576) [(1, 1), (7, 1), (13, 2)],
  term ((103949669736811483 : Rat) / 26109641356596) [(1, 1), (7, 1), (13, 2), (14, 1)],
  term ((-1495 : Rat) / 42) [(1, 1), (7, 1), (13, 2), (14, 1), (16, 1)],
  term ((1532199782809 : Rat) / 26861770943) [(1, 1), (7, 1), (13, 2), (14, 2)],
  term ((25885 : Rat) / 252) [(1, 1), (7, 1), (13, 2), (16, 1)],
  term ((-16224463500164501 : Rat) / 13054820678298) [(1, 1), (7, 2), (10, 1), (13, 1)],
  term ((-1532199782809 : Rat) / 161170625658) [(1, 1), (7, 2), (12, 1), (13, 1)],
  term ((-4349915183394751 : Rat) / 6527410339149) [(1, 1), (7, 2), (12, 1), (13, 1), (14, 1)],
  term ((1711467157397653 : Rat) / 6527410339149) [(1, 1), (7, 2), (13, 1)],
  term ((4349915183394751 : Rat) / 2175803446383) [(1, 1), (7, 2), (13, 1), (14, 1)],
  term ((-9984 : Rat) / 553) [(1, 1), (9, 1), (10, 1), (11, 1), (12, 1), (13, 1)],
  term ((7459770061393 : Rat) / 8457933708) [(1, 1), (9, 1), (10, 1), (11, 1), (13, 1)],
  term ((-59904 : Rat) / 553) [(1, 1), (9, 1), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((-30188368622915 : Rat) / 177616607868) [(1, 1), (9, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((32 : Rat) / 21) [(1, 1), (9, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((6090608323475 : Rat) / 266424911802) [(1, 1), (9, 1), (10, 1), (12, 1), (13, 2)],
  term ((-5 : Rat) / 3) [(1, 1), (9, 1), (10, 1), (12, 1), (13, 2), (16, 1)],
  term ((170525183774905 : Rat) / 355233215736) [(1, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((22 : Rat) / 7) [(1, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((4133771477798857 : Rat) / 3197098941624) [(1, 1), (9, 1), (10, 1), (13, 1), (15, 1)],
  term ((-439 : Rat) / 21) [(1, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-74863841198371 : Rat) / 532849823604) [(1, 1), (9, 1), (10, 1), (13, 2)],
  term ((-8926828802611 : Rat) / 266424911802) [(1, 1), (9, 1), (10, 1), (13, 2), (14, 1)],
  term ((-55 : Rat) / 14) [(1, 1), (9, 1), (10, 1), (13, 2), (14, 1), (16, 1)],
  term ((295 : Rat) / 12) [(1, 1), (9, 1), (10, 1), (13, 2), (16, 1)],
  term ((33225805736000 : Rat) / 133212455901) [(1, 1), (9, 1), (11, 1), (12, 1), (13, 1)],
  term ((-3667089710400365 : Rat) / 12788395766496) [(1, 1), (9, 1), (11, 1), (13, 1)],
  term ((9518309600500579 : Rat) / 6394197883248) [(1, 1), (9, 1), (11, 1), (13, 1), (14, 1)],
  term ((-119808 : Rat) / 553) [(1, 1), (9, 1), (11, 1), (13, 1), (14, 2)],
  term ((9008294618453 : Rat) / 118411071912) [(1, 1), (9, 1), (11, 1), (13, 1), (15, 2)],
  term ((-2172201733 : Rat) / 333083184) [(1, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((10110568816218515 : Rat) / 69625710284256) [(1, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((-64 : Rat) / 7) [(1, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-97923607474811 : Rat) / 532849823604) [(1, 1), (9, 1), (12, 1), (13, 2)],
  term ((475 : Rat) / 42) [(1, 1), (9, 1), (12, 1), (13, 2), (16, 1)],
  term ((68639871059025277 : Rat) / 39164462034894) [(1, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((-649 : Rat) / 21) [(1, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3366906314273 : Rat) / 29602767978) [(1, 1), (9, 1), (13, 1), (14, 2), (15, 1)],
  term ((-1093190292828671 : Rat) / 1826913680928) [(1, 1), (9, 1), (13, 2)],
  term ((-737561516355011 : Rat) / 4262798588832) [(1, 1), (9, 1), (13, 2), (14, 1)],
  term ((3125 : Rat) / 84) [(1, 1), (9, 1), (13, 2), (14, 1), (16, 1)],
  term ((6422908767787 : Rat) / 78940714608) [(1, 1), (9, 1), (13, 2), (14, 2)],
  term ((-305 : Rat) / 28) [(1, 1), (9, 1), (13, 2), (14, 2), (16, 1)],
  term ((-2954048478533 : Rat) / 39470357304) [(1, 1), (9, 1), (13, 2), (15, 2)],
  term ((305 : Rat) / 28) [(1, 1), (9, 1), (13, 2), (15, 2), (16, 1)],
  term ((-1055 : Rat) / 84) [(1, 1), (9, 1), (13, 2), (16, 1)],
  term ((-71946724318135 : Rat) / 11604285047376) [(1, 2), (6, 1), (9, 2)],
  term ((2172201733 : Rat) / 333083184) [(1, 2), (6, 1), (9, 2), (12, 1)],
  term ((209812062200357 : Rat) / 644682502632) [(1, 2), (6, 1), (10, 1)],
  term ((1005180329591 : Rat) / 29602767978) [(1, 2), (6, 1), (10, 1), (14, 1)],
  term ((-353060918012465 : Rat) / 6527410339149) [(1, 2), (6, 1), (11, 1), (12, 1), (15, 1)],
  term ((-22816977973072676 : Rat) / 19582231017447) [(1, 2), (6, 1), (11, 1), (13, 1)],
  term ((-170 : Rat) / 63) [(1, 2), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((-1532199782809 : Rat) / 26861770943) [(1, 2), (6, 1), (11, 1), (14, 1), (15, 1)],
  term ((4110502005449020 : Rat) / 6527410339149) [(1, 2), (6, 1), (11, 1), (15, 1)],
  term ((32 : Rat) / 9) [(1, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-3445707804341129 : Rat) / 6527410339149) [(1, 2), (6, 1), (11, 2)],
  term ((-2224986028928059 : Rat) / 3197098941624) [(1, 2), (6, 1), (12, 1), (13, 1), (15, 1)],
  term ((1495 : Rat) / 252) [(1, 2), (6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1532199782809 : Rat) / 26861770943) [(1, 2), (6, 1), (12, 1), (14, 1), (15, 2)],
  term ((140138745041977 : Rat) / 330501789324) [(1, 2), (6, 1), (12, 1), (15, 2)],
  term ((-247 : Rat) / 63) [(1, 2), (6, 1), (12, 1), (15, 2), (16, 1)],
  term ((845559837599 : Rat) / 483511876974) [(1, 2), (6, 1), (13, 1), (14, 1), (15, 1)],
  term ((21692829505604683 : Rat) / 8703213785532) [(1, 2), (6, 1), (13, 1), (15, 1)],
  term ((-3589 : Rat) / 252) [(1, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-280381883026811 : Rat) / 399637367703) [(1, 2), (6, 1), (13, 2)],
  term ((-170 : Rat) / 63) [(1, 2), (6, 1), (13, 2), (16, 1)],
  term ((-2944249555176373 : Rat) / 5802142523688) [(1, 2), (6, 1), (14, 1)],
  term ((4596599348427 : Rat) / 26861770943) [(1, 2), (6, 1), (14, 1), (15, 2)],
  term ((28425155928161 : Rat) / 967023753948) [(1, 2), (6, 1), (14, 2)],
  term ((-6290114302379351 : Rat) / 4351606892766) [(1, 2), (6, 1), (15, 2)],
  term ((247 : Rat) / 21) [(1, 2), (6, 1), (15, 2), (16, 1)],
  term ((-1150854976623484333 : Rat) / 626631392558304) [(1, 2), (7, 1), (9, 1)],
  term ((69282374274035 : Rat) / 80939213712) [(1, 2), (7, 1), (9, 1), (10, 1)],
  term ((3849005354029 : Rat) / 2578730010528) [(1, 2), (7, 1), (9, 1), (12, 1)],
  term ((-53777198303881 : Rat) / 80939213712) [(1, 2), (7, 1), (9, 1), (12, 1), (14, 1)],
  term ((206185803715802887 : Rat) / 104438565426384) [(1, 2), (7, 1), (9, 1), (14, 1)],
  term ((36984430141213349 : Rat) / 26109641356596) [(1, 2), (7, 1), (10, 1), (11, 1)],
  term ((-2796461151655097 : Rat) / 3197098941624) [(1, 2), (7, 1), (10, 1), (13, 1)],
  term ((8525 : Rat) / 252) [(1, 2), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((2335788672963988 : Rat) / 6527410339149) [(1, 2), (7, 1), (10, 1), (15, 1)],
  term ((-1733 : Rat) / 63) [(1, 2), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((430369017280645 : Rat) / 8703213785532) [(1, 2), (7, 1), (11, 1)],
  term ((166554 : Rat) / 553) [(1, 2), (7, 1), (11, 1), (12, 1)],
  term ((353060918012465 : Rat) / 6527410339149) [(1, 2), (7, 1), (11, 1), (12, 1), (14, 1)],
  term ((38302929158275897 : Rat) / 26109641356596) [(1, 2), (7, 1), (11, 1), (14, 1)],
  term ((941242657 : Rat) / 333083184) [(1, 2), (7, 1), (12, 1), (13, 1)],
  term ((2224986028928059 : Rat) / 3197098941624) [(1, 2), (7, 1), (12, 1), (13, 1), (14, 1)],
  term ((-1495 : Rat) / 252) [(1, 2), (7, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((725 : Rat) / 168) [(1, 2), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((-150142660556857 : Rat) / 330501789324) [(1, 2), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((247 : Rat) / 63) [(1, 2), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((1532199782809 : Rat) / 26861770943) [(1, 2), (7, 1), (12, 1), (14, 2), (15, 1)],
  term ((-148780745730977 : Rat) / 5802142523688) [(1, 2), (7, 1), (12, 1), (15, 1)],
  term ((-157 : Rat) / 42) [(1, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((515963868277391503 : Rat) / 313315696279152) [(1, 2), (7, 1), (13, 1)],
  term ((-103949669736811483 : Rat) / 52219282713192) [(1, 2), (7, 1), (13, 1), (14, 1)],
  term ((1495 : Rat) / 84) [(1, 2), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1532199782809 : Rat) / 53723541886) [(1, 2), (7, 1), (13, 1), (14, 2)],
  term ((-25885 : Rat) / 504) [(1, 2), (7, 1), (13, 1), (16, 1)],
  term ((22183802776035443 : Rat) / 26109641356596) [(1, 2), (7, 1), (14, 1), (15, 1)],
  term ((-247 : Rat) / 21) [(1, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4596599348427 : Rat) / 26861770943) [(1, 2), (7, 1), (14, 2), (15, 1)],
  term ((-25114142040388049 : Rat) / 7459897530456) [(1, 2), (7, 1), (15, 1)],
  term ((5149 : Rat) / 126) [(1, 2), (7, 1), (15, 1), (16, 1)],
  term ((-1711467157397653 : Rat) / 13054820678298) [(1, 2), (7, 2)],
  term ((16224463500164501 : Rat) / 26109641356596) [(1, 2), (7, 2), (10, 1)],
  term ((1532199782809 : Rat) / 322341251316) [(1, 2), (7, 2), (12, 1)],
  term ((4349915183394751 : Rat) / 13054820678298) [(1, 2), (7, 2), (12, 1), (14, 1)],
  term ((-4349915183394751 : Rat) / 4351606892766) [(1, 2), (7, 2), (14, 1)],
  term ((-7459770061393 : Rat) / 16915867416) [(1, 2), (9, 1), (10, 1), (11, 1)],
  term ((4992 : Rat) / 553) [(1, 2), (9, 1), (10, 1), (11, 1), (12, 1)],
  term ((29952 : Rat) / 553) [(1, 2), (9, 1), (10, 1), (11, 1), (14, 1)],
  term ((-6090608323475 : Rat) / 532849823604) [(1, 2), (9, 1), (10, 1), (12, 1), (13, 1)],
  term ((5 : Rat) / 6) [(1, 2), (9, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((30188368622915 : Rat) / 355233215736) [(1, 2), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((-16 : Rat) / 21) [(1, 2), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((74863841198371 : Rat) / 1065699647208) [(1, 2), (9, 1), (10, 1), (13, 1)],
  term ((8926828802611 : Rat) / 532849823604) [(1, 2), (9, 1), (10, 1), (13, 1), (14, 1)],
  term ((55 : Rat) / 28) [(1, 2), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-295 : Rat) / 24) [(1, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-170525183774905 : Rat) / 710466431472) [(1, 2), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((-11 : Rat) / 7) [(1, 2), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4133771477798857 : Rat) / 6394197883248) [(1, 2), (9, 1), (10, 1), (15, 1)],
  term ((439 : Rat) / 42) [(1, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((3667089710400365 : Rat) / 25576791532992) [(1, 2), (9, 1), (11, 1)],
  term ((-16612902868000 : Rat) / 133212455901) [(1, 2), (9, 1), (11, 1), (12, 1)],
  term ((-9518309600500579 : Rat) / 12788395766496) [(1, 2), (9, 1), (11, 1), (14, 1)],
  term ((59904 : Rat) / 553) [(1, 2), (9, 1), (11, 1), (14, 2)],
  term ((-9008294618453 : Rat) / 236822143824) [(1, 2), (9, 1), (11, 1), (15, 2)],
  term ((97923607474811 : Rat) / 1065699647208) [(1, 2), (9, 1), (12, 1), (13, 1)],
  term ((-475 : Rat) / 84) [(1, 2), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((2172201733 : Rat) / 666166368) [(1, 2), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-10110568816218515 : Rat) / 139251420568512) [(1, 2), (9, 1), (12, 1), (15, 1)],
  term ((32 : Rat) / 7) [(1, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((1093190292828671 : Rat) / 3653827361856) [(1, 2), (9, 1), (13, 1)],
  term ((737561516355011 : Rat) / 8525597177664) [(1, 2), (9, 1), (13, 1), (14, 1)],
  term ((-3125 : Rat) / 168) [(1, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-6422908767787 : Rat) / 157881429216) [(1, 2), (9, 1), (13, 1), (14, 2)],
  term ((305 : Rat) / 56) [(1, 2), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((2954048478533 : Rat) / 78940714608) [(1, 2), (9, 1), (13, 1), (15, 2)],
  term ((-305 : Rat) / 56) [(1, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((1055 : Rat) / 168) [(1, 2), (9, 1), (13, 1), (16, 1)],
  term ((-68639871059025277 : Rat) / 78328924069788) [(1, 2), (9, 1), (14, 1), (15, 1)],
  term ((649 : Rat) / 42) [(1, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((3366906314273 : Rat) / 59205535956) [(1, 2), (9, 1), (14, 2), (15, 1)],
  term ((2172201733 : Rat) / 166541592) [(6, 1), (9, 2), (12, 1), (13, 1), (15, 1)],
  term ((-71946724318135 : Rat) / 5802142523688) [(6, 1), (9, 2), (12, 1), (14, 1)],
  term ((-2172201733 : Rat) / 333083184) [(6, 1), (9, 2), (12, 1), (14, 2)],
  term ((-2172201733 : Rat) / 333083184) [(6, 1), (9, 2), (12, 1), (15, 2)],
  term ((2172201733 : Rat) / 166541592) [(6, 1), (9, 2), (12, 2), (14, 1)],
  term ((-71946724318135 : Rat) / 5802142523688) [(6, 1), (9, 2), (13, 1), (15, 1)],
  term ((71946724318135 : Rat) / 11604285047376) [(6, 1), (9, 2), (14, 2)],
  term ((71946724318135 : Rat) / 11604285047376) [(6, 1), (9, 2), (15, 2)],
  term ((209812062200357 : Rat) / 322341251316) [(6, 1), (10, 1), (12, 1), (14, 1)],
  term ((1005180329591 : Rat) / 14801383989) [(6, 1), (10, 1), (12, 1), (14, 2)],
  term ((1005180329591 : Rat) / 14801383989) [(6, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((209812062200357 : Rat) / 322341251316) [(6, 1), (10, 1), (13, 1), (15, 1)],
  term ((-1005180329591 : Rat) / 29602767978) [(6, 1), (10, 1), (14, 1), (15, 2)],
  term ((-209812062200357 : Rat) / 644682502632) [(6, 1), (10, 1), (14, 2)],
  term ((-1005180329591 : Rat) / 29602767978) [(6, 1), (10, 1), (14, 3)],
  term ((-209812062200357 : Rat) / 644682502632) [(6, 1), (10, 1), (15, 2)],
  term ((-45633955946145352 : Rat) / 19582231017447) [(6, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-340 : Rat) / 63) [(6, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-706121836024930 : Rat) / 6527410339149) [(6, 1), (11, 1), (12, 1), (13, 1), (15, 2)],
  term ((8221004010898040 : Rat) / 6527410339149) [(6, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((64 : Rat) / 9) [(6, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-391588176432709 : Rat) / 6527410339149) [(6, 1), (11, 1), (12, 1), (14, 2), (15, 1)],
  term ((353060918012465 : Rat) / 6527410339149) [(6, 1), (11, 1), (12, 1), (15, 3)],
  term ((-706121836024930 : Rat) / 6527410339149) [(6, 1), (11, 1), (12, 2), (14, 1), (15, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(6, 1), (11, 1), (13, 1), (14, 1), (15, 2)],
  term ((22816977973072676 : Rat) / 19582231017447) [(6, 1), (11, 1), (13, 1), (14, 2)],
  term ((170 : Rat) / 63) [(6, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((47479990005766796 : Rat) / 19582231017447) [(6, 1), (11, 1), (13, 1), (15, 2)],
  term ((206 : Rat) / 21) [(6, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-45633955946145352 : Rat) / 19582231017447) [(6, 1), (11, 1), (13, 2), (15, 1)],
  term ((-340 : Rat) / 63) [(6, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((1532199782809 : Rat) / 26861770943) [(6, 1), (11, 1), (14, 1), (15, 3)],
  term ((-4110502005449020 : Rat) / 6527410339149) [(6, 1), (11, 1), (14, 2), (15, 1)],
  term ((-32 : Rat) / 9) [(6, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((1532199782809 : Rat) / 26861770943) [(6, 1), (11, 1), (14, 3), (15, 1)],
  term ((-4110502005449020 : Rat) / 6527410339149) [(6, 1), (11, 1), (15, 3)],
  term ((-32 : Rat) / 9) [(6, 1), (11, 1), (15, 3), (16, 1)],
  term ((-6891415608682258 : Rat) / 6527410339149) [(6, 1), (11, 2), (12, 1), (14, 1)],
  term ((-6891415608682258 : Rat) / 6527410339149) [(6, 1), (11, 2), (13, 1), (15, 1)],
  term ((3445707804341129 : Rat) / 6527410339149) [(6, 1), (11, 2), (14, 2)],
  term ((3445707804341129 : Rat) / 6527410339149) [(6, 1), (11, 2), (15, 2)],
  term ((21692829505604683 : Rat) / 4351606892766) [(6, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-3589 : Rat) / 126) [(6, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(6, 1), (12, 1), (13, 1), (14, 1), (15, 3)],
  term ((109572238192239043 : Rat) / 156657848139576) [(6, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((-1495 : Rat) / 252) [(6, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((241875845717269087 : Rat) / 156657848139576) [(6, 1), (12, 1), (13, 1), (15, 3)],
  term ((-1157 : Rat) / 84) [(6, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-560763766053622 : Rat) / 399637367703) [(6, 1), (12, 1), (13, 2), (14, 1)],
  term ((-340 : Rat) / 63) [(6, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-2224986028928059 : Rat) / 1598549470812) [(6, 1), (12, 1), (13, 2), (15, 2)],
  term ((1495 : Rat) / 126) [(6, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-6290114302379351 : Rat) / 2175803446383) [(6, 1), (12, 1), (14, 1), (15, 2)],
  term ((494 : Rat) / 21) [(6, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((1532199782809 : Rat) / 26861770943) [(6, 1), (12, 1), (14, 1), (15, 4)],
  term ((-2944249555176373 : Rat) / 2901071261844) [(6, 1), (12, 1), (14, 2)],
  term ((-2135171724974095 : Rat) / 26109641356596) [(6, 1), (12, 1), (14, 2), (15, 2)],
  term ((247 : Rat) / 63) [(6, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((28425155928161 : Rat) / 483511876974) [(6, 1), (12, 1), (14, 3)],
  term ((1532199782809 : Rat) / 26861770943) [(6, 1), (12, 1), (14, 3), (15, 2)],
  term ((-140138745041977 : Rat) / 330501789324) [(6, 1), (12, 1), (15, 4)],
  term ((247 : Rat) / 63) [(6, 1), (12, 1), (15, 4), (16, 1)],
  term ((-2224986028928059 : Rat) / 1598549470812) [(6, 1), (12, 2), (13, 1), (14, 1), (15, 1)],
  term ((1495 : Rat) / 126) [(6, 1), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((140138745041977 : Rat) / 165250894662) [(6, 1), (12, 2), (14, 1), (15, 2)],
  term ((-494 : Rat) / 63) [(6, 1), (12, 2), (14, 1), (15, 2), (16, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(6, 1), (12, 2), (14, 2), (15, 2)],
  term ((-2944249555176373 : Rat) / 2901071261844) [(6, 1), (13, 1), (14, 1), (15, 1)],
  term ((164632016705773 : Rat) / 483511876974) [(6, 1), (13, 1), (14, 1), (15, 3)],
  term ((-21181176698897785 : Rat) / 8703213785532) [(6, 1), (13, 1), (14, 2), (15, 1)],
  term ((3589 : Rat) / 252) [(6, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-845559837599 : Rat) / 483511876974) [(6, 1), (13, 1), (14, 3), (15, 1)],
  term ((-15617762238374029 : Rat) / 2901071261844) [(6, 1), (13, 1), (15, 3)],
  term ((9517 : Rat) / 252) [(6, 1), (13, 1), (15, 3), (16, 1)],
  term ((845559837599 : Rat) / 241755938487) [(6, 1), (13, 2), (14, 1), (15, 2)],
  term ((280381883026811 : Rat) / 399637367703) [(6, 1), (13, 2), (14, 2)],
  term ((170 : Rat) / 63) [(6, 1), (13, 2), (14, 2), (16, 1)],
  term ((222712890087069625 : Rat) / 39164462034894) [(6, 1), (13, 2), (15, 2)],
  term ((-361 : Rat) / 14) [(6, 1), (13, 2), (15, 2), (16, 1)],
  term ((-560763766053622 : Rat) / 399637367703) [(6, 1), (13, 3), (15, 1)],
  term ((-340 : Rat) / 63) [(6, 1), (13, 3), (15, 1), (16, 1)],
  term ((2944249555176373 : Rat) / 5802142523688) [(6, 1), (14, 1), (15, 2)],
  term ((-4596599348427 : Rat) / 26861770943) [(6, 1), (14, 1), (15, 4)],
  term ((12324402201405253 : Rat) / 8703213785532) [(6, 1), (14, 2), (15, 2)],
  term ((-247 : Rat) / 21) [(6, 1), (14, 2), (15, 2), (16, 1)],
  term ((2944249555176373 : Rat) / 5802142523688) [(6, 1), (14, 3)],
  term ((-4596599348427 : Rat) / 26861770943) [(6, 1), (14, 3), (15, 2)],
  term ((-28425155928161 : Rat) / 967023753948) [(6, 1), (14, 4)],
  term ((6290114302379351 : Rat) / 4351606892766) [(6, 1), (15, 4)],
  term ((-247 : Rat) / 21) [(6, 1), (15, 4), (16, 1)],
  term ((69282374274035 : Rat) / 40469606856) [(7, 1), (9, 1), (10, 1), (12, 1), (14, 1)],
  term ((69282374274035 : Rat) / 40469606856) [(7, 1), (9, 1), (10, 1), (13, 1), (15, 1)],
  term ((-69282374274035 : Rat) / 80939213712) [(7, 1), (9, 1), (10, 1), (14, 2)],
  term ((-69282374274035 : Rat) / 80939213712) [(7, 1), (9, 1), (10, 1), (15, 2)],
  term ((-53777198303881 : Rat) / 40469606856) [(7, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((3849005354029 : Rat) / 1289365005264) [(7, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((-1150854976623484333 : Rat) / 313315696279152) [(7, 1), (9, 1), (12, 1), (14, 1)],
  term ((53777198303881 : Rat) / 80939213712) [(7, 1), (9, 1), (12, 1), (14, 1), (15, 2)],
  term ((824431445429535199 : Rat) / 208877130852768) [(7, 1), (9, 1), (12, 1), (14, 2)],
  term ((53777198303881 : Rat) / 80939213712) [(7, 1), (9, 1), (12, 1), (14, 3)],
  term ((-3849005354029 : Rat) / 2578730010528) [(7, 1), (9, 1), (12, 1), (15, 2)],
  term ((3849005354029 : Rat) / 1289365005264) [(7, 1), (9, 1), (12, 2), (14, 1)],
  term ((-53777198303881 : Rat) / 40469606856) [(7, 1), (9, 1), (12, 2), (14, 2)],
  term ((206185803715802887 : Rat) / 52219282713192) [(7, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((-1150854976623484333 : Rat) / 313315696279152) [(7, 1), (9, 1), (13, 1), (15, 1)],
  term ((-206185803715802887 : Rat) / 104438565426384) [(7, 1), (9, 1), (14, 1), (15, 2)],
  term ((1150854976623484333 : Rat) / 626631392558304) [(7, 1), (9, 1), (14, 2)],
  term ((-206185803715802887 : Rat) / 104438565426384) [(7, 1), (9, 1), (14, 3)],
  term ((1150854976623484333 : Rat) / 626631392558304) [(7, 1), (9, 1), (15, 2)],
  term ((36984430141213349 : Rat) / 13054820678298) [(7, 1), (10, 1), (11, 1), (12, 1), (14, 1)],
  term ((36984430141213349 : Rat) / 13054820678298) [(7, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((-36984430141213349 : Rat) / 26109641356596) [(7, 1), (10, 1), (11, 1), (14, 2)],
  term ((-36984430141213349 : Rat) / 26109641356596) [(7, 1), (10, 1), (11, 1), (15, 2)],
  term ((-2796461151655097 : Rat) / 1598549470812) [(7, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((8525 : Rat) / 126) [(7, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((4671577345927976 : Rat) / 6527410339149) [(7, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((-3466 : Rat) / 63) [(7, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((2796461151655097 : Rat) / 3197098941624) [(7, 1), (10, 1), (13, 1), (14, 2)],
  term ((-8525 : Rat) / 252) [(7, 1), (10, 1), (13, 1), (14, 2), (16, 1)],
  term ((249144452733371177 : Rat) / 156657848139576) [(7, 1), (10, 1), (13, 1), (15, 2)],
  term ((-7463 : Rat) / 84) [(7, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-2796461151655097 : Rat) / 1598549470812) [(7, 1), (10, 1), (13, 2), (15, 1)],
  term ((8525 : Rat) / 126) [(7, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-2335788672963988 : Rat) / 6527410339149) [(7, 1), (10, 1), (14, 2), (15, 1)],
  term ((1733 : Rat) / 63) [(7, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((-2335788672963988 : Rat) / 6527410339149) [(7, 1), (10, 1), (15, 3)],
  term ((1733 : Rat) / 63) [(7, 1), (10, 1), (15, 3), (16, 1)],
  term ((706121836024930 : Rat) / 6527410339149) [(7, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((333108 : Rat) / 553) [(7, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((430369017280645 : Rat) / 4351606892766) [(7, 1), (11, 1), (12, 1), (14, 1)],
  term ((-353060918012465 : Rat) / 6527410339149) [(7, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((34371043799770933 : Rat) / 13054820678298) [(7, 1), (11, 1), (12, 1), (14, 2)],
  term ((-353060918012465 : Rat) / 6527410339149) [(7, 1), (11, 1), (12, 1), (14, 3)],
  term ((-166554 : Rat) / 553) [(7, 1), (11, 1), (12, 1), (15, 2)],
  term ((333108 : Rat) / 553) [(7, 1), (11, 1), (12, 2), (14, 1)],
  term ((706121836024930 : Rat) / 6527410339149) [(7, 1), (11, 1), (12, 2), (14, 2)],
  term ((38302929158275897 : Rat) / 13054820678298) [(7, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((430369017280645 : Rat) / 4351606892766) [(7, 1), (11, 1), (13, 1), (15, 1)],
  term ((-38302929158275897 : Rat) / 26109641356596) [(7, 1), (11, 1), (14, 1), (15, 2)],
  term ((-430369017280645 : Rat) / 8703213785532) [(7, 1), (11, 1), (14, 2)],
  term ((-38302929158275897 : Rat) / 26109641356596) [(7, 1), (11, 1), (14, 3)],
  term ((-430369017280645 : Rat) / 8703213785532) [(7, 1), (11, 1), (15, 2)],
  term ((515963868277391503 : Rat) / 156657848139576) [(7, 1), (12, 1), (13, 1), (14, 1)],
  term ((-251359557625375327 : Rat) / 156657848139576) [(7, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((1157 : Rat) / 84) [(7, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-25885 : Rat) / 252) [(7, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-416093806523590939 : Rat) / 104438565426384) [(7, 1), (12, 1), (13, 1), (14, 2)],
  term ((3064399565618 : Rat) / 26861770943) [(7, 1), (12, 1), (13, 1), (14, 2), (15, 2)],
  term ((5255 : Rat) / 168) [(7, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((-117960104550816979 : Rat) / 156657848139576) [(7, 1), (12, 1), (13, 1), (14, 3)],
  term ((1495 : Rat) / 252) [(7, 1), (12, 1), (13, 1), (14, 3), (16, 1)],
  term ((-627914935851131 : Rat) / 11604285047376) [(7, 1), (12, 1), (13, 1), (15, 2)],
  term ((-283 : Rat) / 24) [(7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((2224986028928059 : Rat) / 1598549470812) [(7, 1), (12, 1), (13, 2), (14, 1), (15, 1)],
  term ((-1495 : Rat) / 126) [(7, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((941242657 : Rat) / 166541592) [(7, 1), (12, 1), (13, 2), (15, 1)],
  term ((725 : Rat) / 84) [(7, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-25114142040388049 : Rat) / 3729948765228) [(7, 1), (12, 1), (14, 1), (15, 1)],
  term ((5149 : Rat) / 63) [(7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((150142660556857 : Rat) / 330501789324) [(7, 1), (12, 1), (14, 1), (15, 3)],
  term ((-247 : Rat) / 63) [(7, 1), (12, 1), (14, 1), (15, 3), (16, 1)],
  term ((90074237815720565 : Rat) / 52219282713192) [(7, 1), (12, 1), (14, 2), (15, 1)],
  term ((-277 : Rat) / 14) [(7, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1532199782809 : Rat) / 26861770943) [(7, 1), (12, 1), (14, 2), (15, 3)],
  term ((2925481050649615 : Rat) / 26109641356596) [(7, 1), (12, 1), (14, 3), (15, 1)],
  term ((-247 : Rat) / 63) [(7, 1), (12, 1), (14, 3), (15, 1), (16, 1)],
  term ((-1532199782809 : Rat) / 26861770943) [(7, 1), (12, 1), (14, 4), (15, 1)],
  term ((148780745730977 : Rat) / 5802142523688) [(7, 1), (12, 1), (15, 3)],
  term ((157 : Rat) / 42) [(7, 1), (12, 1), (15, 3), (16, 1)],
  term ((941242657 : Rat) / 166541592) [(7, 1), (12, 2), (13, 1), (14, 1)],
  term ((725 : Rat) / 84) [(7, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((2224986028928059 : Rat) / 1598549470812) [(7, 1), (12, 2), (13, 1), (14, 2)],
  term ((-1495 : Rat) / 126) [(7, 1), (12, 2), (13, 1), (14, 2), (16, 1)],
  term ((-148780745730977 : Rat) / 2901071261844) [(7, 1), (12, 2), (14, 1), (15, 1)],
  term ((-157 : Rat) / 21) [(7, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-150142660556857 : Rat) / 165250894662) [(7, 1), (12, 2), (14, 2), (15, 1)],
  term ((494 : Rat) / 63) [(7, 1), (12, 2), (14, 2), (15, 1), (16, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(7, 1), (12, 2), (14, 3), (15, 1)],
  term ((64228293613651085 : Rat) / 17406427571064) [(7, 1), (13, 1), (14, 1), (15, 2)],
  term ((-1157 : Rat) / 28) [(7, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-515963868277391503 : Rat) / 313315696279152) [(7, 1), (13, 1), (14, 2)],
  term ((-16854197610899 : Rat) / 53723541886) [(7, 1), (13, 1), (14, 2), (15, 2)],
  term ((25885 : Rat) / 504) [(7, 1), (13, 1), (14, 2), (16, 1)],
  term ((103949669736811483 : Rat) / 52219282713192) [(7, 1), (13, 1), (14, 3)],
  term ((-1495 : Rat) / 84) [(7, 1), (13, 1), (14, 3), (16, 1)],
  term ((1532199782809 : Rat) / 53723541886) [(7, 1), (13, 1), (14, 4)],
  term ((-2625551799669987619 : Rat) / 313315696279152) [(7, 1), (13, 1), (15, 2)],
  term ((7453 : Rat) / 56) [(7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-103949669736811483 : Rat) / 26109641356596) [(7, 1), (13, 2), (14, 1), (15, 1)],
  term ((1495 : Rat) / 42) [(7, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1532199782809 : Rat) / 26861770943) [(7, 1), (13, 2), (14, 2), (15, 1)],
  term ((515963868277391503 : Rat) / 156657848139576) [(7, 1), (13, 2), (15, 1)],
  term ((-25885 : Rat) / 252) [(7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-22183802776035443 : Rat) / 26109641356596) [(7, 1), (14, 1), (15, 3)],
  term ((247 : Rat) / 21) [(7, 1), (14, 1), (15, 3), (16, 1)],
  term ((25114142040388049 : Rat) / 7459897530456) [(7, 1), (14, 2), (15, 1)],
  term ((-5149 : Rat) / 126) [(7, 1), (14, 2), (15, 1), (16, 1)],
  term ((4596599348427 : Rat) / 26861770943) [(7, 1), (14, 2), (15, 3)],
  term ((-22183802776035443 : Rat) / 26109641356596) [(7, 1), (14, 3), (15, 1)],
  term ((247 : Rat) / 21) [(7, 1), (14, 3), (15, 1), (16, 1)],
  term ((4596599348427 : Rat) / 26861770943) [(7, 1), (14, 4), (15, 1)],
  term ((25114142040388049 : Rat) / 7459897530456) [(7, 1), (15, 3)],
  term ((-5149 : Rat) / 126) [(7, 1), (15, 3), (16, 1)],
  term ((16224463500164501 : Rat) / 13054820678298) [(7, 2), (10, 1), (12, 1), (14, 1)],
  term ((16224463500164501 : Rat) / 13054820678298) [(7, 2), (10, 1), (13, 1), (15, 1)],
  term ((-16224463500164501 : Rat) / 26109641356596) [(7, 2), (10, 1), (14, 2)],
  term ((-16224463500164501 : Rat) / 26109641356596) [(7, 2), (10, 1), (15, 2)],
  term ((4349915183394751 : Rat) / 6527410339149) [(7, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((1532199782809 : Rat) / 161170625658) [(7, 2), (12, 1), (13, 1), (15, 1)],
  term ((-1711467157397653 : Rat) / 6527410339149) [(7, 2), (12, 1), (14, 1)],
  term ((-4349915183394751 : Rat) / 13054820678298) [(7, 2), (12, 1), (14, 1), (15, 2)],
  term ((-17441030127714847 : Rat) / 8703213785532) [(7, 2), (12, 1), (14, 2)],
  term ((-4349915183394751 : Rat) / 13054820678298) [(7, 2), (12, 1), (14, 3)],
  term ((-1532199782809 : Rat) / 322341251316) [(7, 2), (12, 1), (15, 2)],
  term ((1532199782809 : Rat) / 161170625658) [(7, 2), (12, 2), (14, 1)],
  term ((4349915183394751 : Rat) / 6527410339149) [(7, 2), (12, 2), (14, 2)],
  term ((-4349915183394751 : Rat) / 2175803446383) [(7, 2), (13, 1), (14, 1), (15, 1)],
  term ((-1711467157397653 : Rat) / 6527410339149) [(7, 2), (13, 1), (15, 1)],
  term ((4349915183394751 : Rat) / 4351606892766) [(7, 2), (14, 1), (15, 2)],
  term ((1711467157397653 : Rat) / 13054820678298) [(7, 2), (14, 2)],
  term ((4349915183394751 : Rat) / 4351606892766) [(7, 2), (14, 3)],
  term ((1711467157397653 : Rat) / 13054820678298) [(7, 2), (15, 2)],
  term ((9984 : Rat) / 553) [(9, 1), (10, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-7459770061393 : Rat) / 8457933708) [(9, 1), (10, 1), (11, 1), (12, 1), (14, 1)],
  term ((54912 : Rat) / 553) [(9, 1), (10, 1), (11, 1), (12, 1), (14, 2)],
  term ((-4992 : Rat) / 553) [(9, 1), (10, 1), (11, 1), (12, 1), (15, 2)],
  term ((9984 : Rat) / 553) [(9, 1), (10, 1), (11, 1), (12, 2), (14, 1)],
  term ((59904 : Rat) / 553) [(9, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-7459770061393 : Rat) / 8457933708) [(9, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((-29952 : Rat) / 553) [(9, 1), (10, 1), (11, 1), (14, 1), (15, 2)],
  term ((7459770061393 : Rat) / 16915867416) [(9, 1), (10, 1), (11, 1), (14, 2)],
  term ((-29952 : Rat) / 553) [(9, 1), (10, 1), (11, 1), (14, 3)],
  term ((7459770061393 : Rat) / 16915867416) [(9, 1), (10, 1), (11, 1), (15, 2)],
  term ((74863841198371 : Rat) / 532849823604) [(9, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((-295 : Rat) / 12) [(9, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((23944265928697 : Rat) / 532849823604) [(9, 1), (10, 1), (12, 1), (13, 1), (14, 2)],
  term ((65 : Rat) / 21) [(9, 1), (10, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((24163928548055 : Rat) / 133212455901) [(9, 1), (10, 1), (12, 1), (13, 1), (15, 2)],
  term ((-33 : Rat) / 14) [(9, 1), (10, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-6090608323475 : Rat) / 266424911802) [(9, 1), (10, 1), (12, 1), (13, 2), (15, 1)],
  term ((5 : Rat) / 3) [(9, 1), (10, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-4133771477798857 : Rat) / 3197098941624) [(9, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((439 : Rat) / 21) [(9, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-796482350785 : Rat) / 1409655618) [(9, 1), (10, 1), (12, 1), (14, 2), (15, 1)],
  term ((-50 : Rat) / 21) [(9, 1), (10, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-30188368622915 : Rat) / 355233215736) [(9, 1), (10, 1), (12, 1), (15, 3)],
  term ((16 : Rat) / 21) [(9, 1), (10, 1), (12, 1), (15, 3), (16, 1)],
  term ((-6090608323475 : Rat) / 266424911802) [(9, 1), (10, 1), (12, 2), (13, 1), (14, 1)],
  term ((5 : Rat) / 3) [(9, 1), (10, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((30188368622915 : Rat) / 177616607868) [(9, 1), (10, 1), (12, 2), (14, 1), (15, 1)],
  term ((-32 : Rat) / 21) [(9, 1), (10, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-529429208929937 : Rat) / 1065699647208) [(9, 1), (10, 1), (13, 1), (14, 1), (15, 2)],
  term ((-143 : Rat) / 28) [(9, 1), (10, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-74863841198371 : Rat) / 1065699647208) [(9, 1), (10, 1), (13, 1), (14, 2)],
  term ((295 : Rat) / 24) [(9, 1), (10, 1), (13, 1), (14, 2), (16, 1)],
  term ((-8926828802611 : Rat) / 532849823604) [(9, 1), (10, 1), (13, 1), (14, 3)],
  term ((-55 : Rat) / 28) [(9, 1), (10, 1), (13, 1), (14, 3), (16, 1)],
  term ((-2179181500696985 : Rat) / 1598549470812) [(9, 1), (10, 1), (13, 1), (15, 2)],
  term ((1859 : Rat) / 56) [(9, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((8926828802611 : Rat) / 266424911802) [(9, 1), (10, 1), (13, 2), (14, 1), (15, 1)],
  term ((55 : Rat) / 14) [(9, 1), (10, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((74863841198371 : Rat) / 532849823604) [(9, 1), (10, 1), (13, 2), (15, 1)],
  term ((-295 : Rat) / 12) [(9, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((170525183774905 : Rat) / 710466431472) [(9, 1), (10, 1), (14, 1), (15, 3)],
  term ((11 : Rat) / 7) [(9, 1), (10, 1), (14, 1), (15, 3), (16, 1)],
  term ((4133771477798857 : Rat) / 6394197883248) [(9, 1), (10, 1), (14, 2), (15, 1)],
  term ((-439 : Rat) / 42) [(9, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((170525183774905 : Rat) / 710466431472) [(9, 1), (10, 1), (14, 3), (15, 1)],
  term ((11 : Rat) / 7) [(9, 1), (10, 1), (14, 3), (15, 1), (16, 1)],
  term ((4133771477798857 : Rat) / 6394197883248) [(9, 1), (10, 1), (15, 3)],
  term ((-439 : Rat) / 42) [(9, 1), (10, 1), (15, 3), (16, 1)],
  term ((-33225805736000 : Rat) / 133212455901) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((3667089710400365 : Rat) / 12788395766496) [(9, 1), (11, 1), (12, 1), (14, 1)],
  term ((-9008294618453 : Rat) / 118411071912) [(9, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((-8720890262836579 : Rat) / 6394197883248) [(9, 1), (11, 1), (12, 1), (14, 2)],
  term ((119808 : Rat) / 553) [(9, 1), (11, 1), (12, 1), (14, 3)],
  term ((16612902868000 : Rat) / 133212455901) [(9, 1), (11, 1), (12, 1), (15, 2)],
  term ((-33225805736000 : Rat) / 133212455901) [(9, 1), (11, 1), (12, 2), (14, 1)],
  term ((-9518309600500579 : Rat) / 6394197883248) [(9, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((119808 : Rat) / 553) [(9, 1), (11, 1), (13, 1), (14, 2), (15, 1)],
  term ((3667089710400365 : Rat) / 12788395766496) [(9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-9008294618453 : Rat) / 118411071912) [(9, 1), (11, 1), (13, 1), (15, 3)],
  term ((9518309600500579 : Rat) / 12788395766496) [(9, 1), (11, 1), (14, 1), (15, 2)],
  term ((-3667089710400365 : Rat) / 25576791532992) [(9, 1), (11, 1), (14, 2)],
  term ((-210703568101 : Rat) / 2997748656) [(9, 1), (11, 1), (14, 2), (15, 2)],
  term ((9518309600500579 : Rat) / 12788395766496) [(9, 1), (11, 1), (14, 3)],
  term ((-59904 : Rat) / 553) [(9, 1), (11, 1), (14, 4)],
  term ((-3667089710400365 : Rat) / 25576791532992) [(9, 1), (11, 1), (15, 2)],
  term ((9008294618453 : Rat) / 236822143824) [(9, 1), (11, 1), (15, 4)],
  term ((1093190292828671 : Rat) / 1826913680928) [(9, 1), (12, 1), (13, 1), (14, 1)],
  term ((6422908767787 : Rat) / 78940714608) [(9, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((-305 : Rat) / 28) [(9, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((1055 : Rat) / 84) [(9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((38429676272863 : Rat) / 473644287648) [(9, 1), (12, 1), (13, 1), (14, 2)],
  term ((-1325 : Rat) / 42) [(9, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((-6422908767787 : Rat) / 78940714608) [(9, 1), (12, 1), (13, 1), (14, 3)],
  term ((305 : Rat) / 28) [(9, 1), (12, 1), (13, 1), (14, 3), (16, 1)],
  term ((-49524733513718501 : Rat) / 208877130852768) [(9, 1), (12, 1), (13, 1), (15, 2)],
  term ((1243 : Rat) / 84) [(9, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((97923607474811 : Rat) / 532849823604) [(9, 1), (12, 1), (13, 2), (15, 1)],
  term ((-475 : Rat) / 42) [(9, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-2172201733 : Rat) / 666166368) [(9, 1), (12, 1), (14, 1), (15, 3)],
  term ((-300782964934691747 : Rat) / 179037540730944) [(9, 1), (12, 1), (14, 2), (15, 1)],
  term ((79 : Rat) / 3) [(9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((52326065596205 : Rat) / 473644287648) [(9, 1), (12, 1), (14, 3), (15, 1)],
  term ((10110568816218515 : Rat) / 139251420568512) [(9, 1), (12, 1), (15, 3)],
  term ((-32 : Rat) / 7) [(9, 1), (12, 1), (15, 3), (16, 1)],
  term ((97923607474811 : Rat) / 532849823604) [(9, 1), (12, 2), (13, 1), (14, 1)],
  term ((-475 : Rat) / 42) [(9, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-10110568816218515 : Rat) / 69625710284256) [(9, 1), (12, 2), (14, 1), (15, 1)],
  term ((64 : Rat) / 7) [(9, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((2172201733 : Rat) / 333083184) [(9, 1), (12, 2), (14, 2), (15, 1)],
  term ((-2304897416792995481 : Rat) / 1253262785116608) [(9, 1), (13, 1), (14, 1), (15, 2)],
  term ((8317 : Rat) / 168) [(9, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1093190292828671 : Rat) / 3653827361856) [(9, 1), (13, 1), (14, 2)],
  term ((55414936460531 : Rat) / 473644287648) [(9, 1), (13, 1), (14, 2), (15, 2)],
  term ((-1055 : Rat) / 168) [(9, 1), (13, 1), (14, 2), (16, 1)],
  term ((-737561516355011 : Rat) / 8525597177664) [(9, 1), (13, 1), (14, 3)],
  term ((3125 : Rat) / 168) [(9, 1), (13, 1), (14, 3), (16, 1)],
  term ((6422908767787 : Rat) / 157881429216) [(9, 1), (13, 1), (14, 4)],
  term ((-305 : Rat) / 56) [(9, 1), (13, 1), (14, 4), (16, 1)],
  term ((-1093190292828671 : Rat) / 3653827361856) [(9, 1), (13, 1), (15, 2)],
  term ((-1055 : Rat) / 168) [(9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-2954048478533 : Rat) / 78940714608) [(9, 1), (13, 1), (15, 4)],
  term ((305 : Rat) / 56) [(9, 1), (13, 1), (15, 4), (16, 1)],
  term ((737561516355011 : Rat) / 4262798588832) [(9, 1), (13, 2), (14, 1), (15, 1)],
  term ((-3125 : Rat) / 84) [(9, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-6422908767787 : Rat) / 78940714608) [(9, 1), (13, 2), (14, 2), (15, 1)],
  term ((305 : Rat) / 28) [(9, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((1093190292828671 : Rat) / 1826913680928) [(9, 1), (13, 2), (15, 1)],
  term ((1055 : Rat) / 84) [(9, 1), (13, 2), (15, 1), (16, 1)],
  term ((2954048478533 : Rat) / 39470357304) [(9, 1), (13, 2), (15, 3)],
  term ((-305 : Rat) / 28) [(9, 1), (13, 2), (15, 3), (16, 1)],
  term ((68639871059025277 : Rat) / 78328924069788) [(9, 1), (14, 1), (15, 3)],
  term ((-649 : Rat) / 42) [(9, 1), (14, 1), (15, 3), (16, 1)],
  term ((-3366906314273 : Rat) / 59205535956) [(9, 1), (14, 2), (15, 3)],
  term ((68639871059025277 : Rat) / 78328924069788) [(9, 1), (14, 3), (15, 1)],
  term ((-649 : Rat) / 42) [(9, 1), (14, 3), (15, 1), (16, 1)],
  term ((-3366906314273 : Rat) / 59205535956) [(9, 1), (14, 4), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 27, terms 300 through 399. -/
theorem rs_R009_ueqv_R009YNNNN_block_27_0300_0399_valid :
    checkProductSumEq rs_R009_ueqv_R009YNNNN_partials_27_0300_0399
      rs_R009_ueqv_R009YNNNN_block_27_0300_0399 = true := by
  native_decide

end R009UeqvR009YNNNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
