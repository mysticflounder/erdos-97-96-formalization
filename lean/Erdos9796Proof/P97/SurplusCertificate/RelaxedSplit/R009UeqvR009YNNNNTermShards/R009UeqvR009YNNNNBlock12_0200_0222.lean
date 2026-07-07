/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009YNNNN, term block 12:200-222

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009YNNNNTermShards

/-- Generator polynomial 12 for relaxed split surplus certificate `R009:u=v:R009YNNNN`. -/
def rs_R009_ueqv_R009YNNNN_generator_12_0200_0222 : Poly :=
[
  term (1 : Rat) [],
  term (-2 : Rat) [(2, 1)],
  term (2 : Rat) [(2, 1), (14, 1)],
  term (2 : Rat) [(3, 1), (15, 1)],
  term (-1 : Rat) [(14, 2)],
  term (-1 : Rat) [(15, 2)]
]

/-- Coefficient term 200 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YNNNN_coefficient_12_0200 : Poly :=
[
  term ((-18561303581089453 : Rat) / 5802142523688) [(11, 1), (14, 1), (15, 1)]
]

/-- Partial product 200 for generator 12. -/
def rs_R009_ueqv_R009YNNNN_partial_12_0200 : Poly :=
[
  term ((18561303581089453 : Rat) / 2901071261844) [(2, 1), (11, 1), (14, 1), (15, 1)],
  term ((-18561303581089453 : Rat) / 2901071261844) [(2, 1), (11, 1), (14, 2), (15, 1)],
  term ((-18561303581089453 : Rat) / 2901071261844) [(3, 1), (11, 1), (14, 1), (15, 2)],
  term ((-18561303581089453 : Rat) / 5802142523688) [(11, 1), (14, 1), (15, 1)],
  term ((18561303581089453 : Rat) / 5802142523688) [(11, 1), (14, 1), (15, 3)],
  term ((18561303581089453 : Rat) / 5802142523688) [(11, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 200 for generator 12. -/
theorem rs_R009_ueqv_R009YNNNN_partial_12_0200_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_12_0200
        rs_R009_ueqv_R009YNNNN_generator_12_0200_0222 =
      rs_R009_ueqv_R009YNNNN_partial_12_0200 := by
  native_decide

/-- Coefficient term 201 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YNNNN_coefficient_12_0201 : Poly :=
[
  term ((2179 : Rat) / 252) [(11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 201 for generator 12. -/
def rs_R009_ueqv_R009YNNNN_partial_12_0201 : Poly :=
[
  term ((-2179 : Rat) / 126) [(2, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((2179 : Rat) / 126) [(2, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((2179 : Rat) / 126) [(3, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((2179 : Rat) / 252) [(11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2179 : Rat) / 252) [(11, 1), (14, 1), (15, 3), (16, 1)],
  term ((-2179 : Rat) / 252) [(11, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 201 for generator 12. -/
theorem rs_R009_ueqv_R009YNNNN_partial_12_0201_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_12_0201
        rs_R009_ueqv_R009YNNNN_generator_12_0200_0222 =
      rs_R009_ueqv_R009YNNNN_partial_12_0201 := by
  native_decide

/-- Coefficient term 202 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YNNNN_coefficient_12_0202 : Poly :=
[
  term ((-1532199782809 : Rat) / 26861770943) [(11, 1), (14, 2), (15, 1)]
]

/-- Partial product 202 for generator 12. -/
def rs_R009_ueqv_R009YNNNN_partial_12_0202 : Poly :=
[
  term ((3064399565618 : Rat) / 26861770943) [(2, 1), (11, 1), (14, 2), (15, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(2, 1), (11, 1), (14, 3), (15, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(3, 1), (11, 1), (14, 2), (15, 2)],
  term ((-1532199782809 : Rat) / 26861770943) [(11, 1), (14, 2), (15, 1)],
  term ((1532199782809 : Rat) / 26861770943) [(11, 1), (14, 2), (15, 3)],
  term ((1532199782809 : Rat) / 26861770943) [(11, 1), (14, 4), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 202 for generator 12. -/
theorem rs_R009_ueqv_R009YNNNN_partial_12_0202_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_12_0202
        rs_R009_ueqv_R009YNNNN_generator_12_0200_0222 =
      rs_R009_ueqv_R009YNNNN_partial_12_0202 := by
  native_decide

/-- Coefficient term 203 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YNNNN_coefficient_12_0203 : Poly :=
[
  term ((12135313228069442 : Rat) / 6527410339149) [(11, 1), (15, 1)]
]

/-- Partial product 203 for generator 12. -/
def rs_R009_ueqv_R009YNNNN_partial_12_0203 : Poly :=
[
  term ((24270626456138884 : Rat) / 6527410339149) [(2, 1), (11, 1), (14, 1), (15, 1)],
  term ((-24270626456138884 : Rat) / 6527410339149) [(2, 1), (11, 1), (15, 1)],
  term ((24270626456138884 : Rat) / 6527410339149) [(3, 1), (11, 1), (15, 2)],
  term ((-12135313228069442 : Rat) / 6527410339149) [(11, 1), (14, 2), (15, 1)],
  term ((12135313228069442 : Rat) / 6527410339149) [(11, 1), (15, 1)],
  term ((-12135313228069442 : Rat) / 6527410339149) [(11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 203 for generator 12. -/
theorem rs_R009_ueqv_R009YNNNN_partial_12_0203_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_12_0203
        rs_R009_ueqv_R009YNNNN_generator_12_0200_0222 =
      rs_R009_ueqv_R009YNNNN_partial_12_0203 := by
  native_decide

/-- Coefficient term 204 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YNNNN_coefficient_12_0204 : Poly :=
[
  term ((-794 : Rat) / 63) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 204 for generator 12. -/
def rs_R009_ueqv_R009YNNNN_partial_12_0204 : Poly :=
[
  term ((-1588 : Rat) / 63) [(2, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((1588 : Rat) / 63) [(2, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1588 : Rat) / 63) [(3, 1), (11, 1), (15, 2), (16, 1)],
  term ((794 : Rat) / 63) [(11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-794 : Rat) / 63) [(11, 1), (15, 1), (16, 1)],
  term ((794 : Rat) / 63) [(11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 204 for generator 12. -/
theorem rs_R009_ueqv_R009YNNNN_partial_12_0204_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_12_0204
        rs_R009_ueqv_R009YNNNN_generator_12_0200_0222 =
      rs_R009_ueqv_R009YNNNN_partial_12_0204 := by
  native_decide

/-- Coefficient term 205 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YNNNN_coefficient_12_0205 : Poly :=
[
  term ((-114508267095595943 : Rat) / 52219282713192) [(11, 2)]
]

/-- Partial product 205 for generator 12. -/
def rs_R009_ueqv_R009YNNNN_partial_12_0205 : Poly :=
[
  term ((114508267095595943 : Rat) / 26109641356596) [(2, 1), (11, 2)],
  term ((-114508267095595943 : Rat) / 26109641356596) [(2, 1), (11, 2), (14, 1)],
  term ((-114508267095595943 : Rat) / 26109641356596) [(3, 1), (11, 2), (15, 1)],
  term ((-114508267095595943 : Rat) / 52219282713192) [(11, 2)],
  term ((114508267095595943 : Rat) / 52219282713192) [(11, 2), (14, 2)],
  term ((114508267095595943 : Rat) / 52219282713192) [(11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 205 for generator 12. -/
theorem rs_R009_ueqv_R009YNNNN_partial_12_0205_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_12_0205
        rs_R009_ueqv_R009YNNNN_generator_12_0200_0222 =
      rs_R009_ueqv_R009YNNNN_partial_12_0205 := by
  native_decide

/-- Coefficient term 206 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YNNNN_coefficient_12_0206 : Poly :=
[
  term ((30941600629507063 : Rat) / 52219282713192) [(11, 2), (14, 1)]
]

/-- Partial product 206 for generator 12. -/
def rs_R009_ueqv_R009YNNNN_partial_12_0206 : Poly :=
[
  term ((-30941600629507063 : Rat) / 26109641356596) [(2, 1), (11, 2), (14, 1)],
  term ((30941600629507063 : Rat) / 26109641356596) [(2, 1), (11, 2), (14, 2)],
  term ((30941600629507063 : Rat) / 26109641356596) [(3, 1), (11, 2), (14, 1), (15, 1)],
  term ((30941600629507063 : Rat) / 52219282713192) [(11, 2), (14, 1)],
  term ((-30941600629507063 : Rat) / 52219282713192) [(11, 2), (14, 1), (15, 2)],
  term ((-30941600629507063 : Rat) / 52219282713192) [(11, 2), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 206 for generator 12. -/
theorem rs_R009_ueqv_R009YNNNN_partial_12_0206_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_12_0206
        rs_R009_ueqv_R009YNNNN_generator_12_0200_0222 =
      rs_R009_ueqv_R009YNNNN_partial_12_0206 := by
  native_decide

/-- Coefficient term 207 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YNNNN_coefficient_12_0207 : Poly :=
[
  term ((-10568938075403567 : Rat) / 26109641356596) [(12, 1)]
]

/-- Partial product 207 for generator 12. -/
def rs_R009_ueqv_R009YNNNN_partial_12_0207 : Poly :=
[
  term ((10568938075403567 : Rat) / 13054820678298) [(2, 1), (12, 1)],
  term ((-10568938075403567 : Rat) / 13054820678298) [(2, 1), (12, 1), (14, 1)],
  term ((-10568938075403567 : Rat) / 13054820678298) [(3, 1), (12, 1), (15, 1)],
  term ((-10568938075403567 : Rat) / 26109641356596) [(12, 1)],
  term ((10568938075403567 : Rat) / 26109641356596) [(12, 1), (14, 2)],
  term ((10568938075403567 : Rat) / 26109641356596) [(12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 207 for generator 12. -/
theorem rs_R009_ueqv_R009YNNNN_partial_12_0207_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_12_0207
        rs_R009_ueqv_R009YNNNN_generator_12_0200_0222 =
      rs_R009_ueqv_R009YNNNN_partial_12_0207 := by
  native_decide

/-- Coefficient term 208 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YNNNN_coefficient_12_0208 : Poly :=
[
  term ((-92772606908565587 : Rat) / 78328924069788) [(13, 1), (14, 1), (15, 1)]
]

/-- Partial product 208 for generator 12. -/
def rs_R009_ueqv_R009YNNNN_partial_12_0208 : Poly :=
[
  term ((92772606908565587 : Rat) / 39164462034894) [(2, 1), (13, 1), (14, 1), (15, 1)],
  term ((-92772606908565587 : Rat) / 39164462034894) [(2, 1), (13, 1), (14, 2), (15, 1)],
  term ((-92772606908565587 : Rat) / 39164462034894) [(3, 1), (13, 1), (14, 1), (15, 2)],
  term ((-92772606908565587 : Rat) / 78328924069788) [(13, 1), (14, 1), (15, 1)],
  term ((92772606908565587 : Rat) / 78328924069788) [(13, 1), (14, 1), (15, 3)],
  term ((92772606908565587 : Rat) / 78328924069788) [(13, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 208 for generator 12. -/
theorem rs_R009_ueqv_R009YNNNN_partial_12_0208_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_12_0208
        rs_R009_ueqv_R009YNNNN_generator_12_0200_0222 =
      rs_R009_ueqv_R009YNNNN_partial_12_0208 := by
  native_decide

/-- Coefficient term 209 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YNNNN_coefficient_12_0209 : Poly :=
[
  term ((11 : Rat) / 9) [(13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 209 for generator 12. -/
def rs_R009_ueqv_R009YNNNN_partial_12_0209 : Poly :=
[
  term ((-22 : Rat) / 9) [(2, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((22 : Rat) / 9) [(2, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((22 : Rat) / 9) [(3, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((11 : Rat) / 9) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-11 : Rat) / 9) [(13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-11 : Rat) / 9) [(13, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 209 for generator 12. -/
theorem rs_R009_ueqv_R009YNNNN_partial_12_0209_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_12_0209
        rs_R009_ueqv_R009YNNNN_generator_12_0200_0222 =
      rs_R009_ueqv_R009YNNNN_partial_12_0209 := by
  native_decide

/-- Coefficient term 210 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YNNNN_coefficient_12_0210 : Poly :=
[
  term ((1532199782809 : Rat) / 26861770943) [(13, 1), (14, 2), (15, 1)]
]

/-- Partial product 210 for generator 12. -/
def rs_R009_ueqv_R009YNNNN_partial_12_0210 : Poly :=
[
  term ((-3064399565618 : Rat) / 26861770943) [(2, 1), (13, 1), (14, 2), (15, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(2, 1), (13, 1), (14, 3), (15, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(3, 1), (13, 1), (14, 2), (15, 2)],
  term ((1532199782809 : Rat) / 26861770943) [(13, 1), (14, 2), (15, 1)],
  term ((-1532199782809 : Rat) / 26861770943) [(13, 1), (14, 2), (15, 3)],
  term ((-1532199782809 : Rat) / 26861770943) [(13, 1), (14, 4), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 210 for generator 12. -/
theorem rs_R009_ueqv_R009YNNNN_partial_12_0210_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_12_0210
        rs_R009_ueqv_R009YNNNN_generator_12_0200_0222 =
      rs_R009_ueqv_R009YNNNN_partial_12_0210 := by
  native_decide

/-- Coefficient term 211 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YNNNN_coefficient_12_0211 : Poly :=
[
  term ((-355985303982098195 : Rat) / 313315696279152) [(13, 1), (15, 1)]
]

/-- Partial product 211 for generator 12. -/
def rs_R009_ueqv_R009YNNNN_partial_12_0211 : Poly :=
[
  term ((-355985303982098195 : Rat) / 156657848139576) [(2, 1), (13, 1), (14, 1), (15, 1)],
  term ((355985303982098195 : Rat) / 156657848139576) [(2, 1), (13, 1), (15, 1)],
  term ((-355985303982098195 : Rat) / 156657848139576) [(3, 1), (13, 1), (15, 2)],
  term ((355985303982098195 : Rat) / 313315696279152) [(13, 1), (14, 2), (15, 1)],
  term ((-355985303982098195 : Rat) / 313315696279152) [(13, 1), (15, 1)],
  term ((355985303982098195 : Rat) / 313315696279152) [(13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 211 for generator 12. -/
theorem rs_R009_ueqv_R009YNNNN_partial_12_0211_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_12_0211
        rs_R009_ueqv_R009YNNNN_generator_12_0200_0222 =
      rs_R009_ueqv_R009YNNNN_partial_12_0211 := by
  native_decide

/-- Coefficient term 212 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YNNNN_coefficient_12_0212 : Poly :=
[
  term ((21347 : Rat) / 504) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 212 for generator 12. -/
def rs_R009_ueqv_R009YNNNN_partial_12_0212 : Poly :=
[
  term ((21347 : Rat) / 252) [(2, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-21347 : Rat) / 252) [(2, 1), (13, 1), (15, 1), (16, 1)],
  term ((21347 : Rat) / 252) [(3, 1), (13, 1), (15, 2), (16, 1)],
  term ((-21347 : Rat) / 504) [(13, 1), (14, 2), (15, 1), (16, 1)],
  term ((21347 : Rat) / 504) [(13, 1), (15, 1), (16, 1)],
  term ((-21347 : Rat) / 504) [(13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 212 for generator 12. -/
theorem rs_R009_ueqv_R009YNNNN_partial_12_0212_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_12_0212
        rs_R009_ueqv_R009YNNNN_generator_12_0200_0222 =
      rs_R009_ueqv_R009YNNNN_partial_12_0212 := by
  native_decide

/-- Coefficient term 213 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YNNNN_coefficient_12_0213 : Poly :=
[
  term ((941242657 : Rat) / 333083184) [(13, 2)]
]

/-- Partial product 213 for generator 12. -/
def rs_R009_ueqv_R009YNNNN_partial_12_0213 : Poly :=
[
  term ((-941242657 : Rat) / 166541592) [(2, 1), (13, 2)],
  term ((941242657 : Rat) / 166541592) [(2, 1), (13, 2), (14, 1)],
  term ((941242657 : Rat) / 166541592) [(3, 1), (13, 2), (15, 1)],
  term ((941242657 : Rat) / 333083184) [(13, 2)],
  term ((-941242657 : Rat) / 333083184) [(13, 2), (14, 2)],
  term ((-941242657 : Rat) / 333083184) [(13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 213 for generator 12. -/
theorem rs_R009_ueqv_R009YNNNN_partial_12_0213_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_12_0213
        rs_R009_ueqv_R009YNNNN_generator_12_0200_0222 =
      rs_R009_ueqv_R009YNNNN_partial_12_0213 := by
  native_decide

/-- Coefficient term 214 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YNNNN_coefficient_12_0214 : Poly :=
[
  term ((2224986028928059 : Rat) / 3197098941624) [(13, 2), (14, 1)]
]

/-- Partial product 214 for generator 12. -/
def rs_R009_ueqv_R009YNNNN_partial_12_0214 : Poly :=
[
  term ((-2224986028928059 : Rat) / 1598549470812) [(2, 1), (13, 2), (14, 1)],
  term ((2224986028928059 : Rat) / 1598549470812) [(2, 1), (13, 2), (14, 2)],
  term ((2224986028928059 : Rat) / 1598549470812) [(3, 1), (13, 2), (14, 1), (15, 1)],
  term ((2224986028928059 : Rat) / 3197098941624) [(13, 2), (14, 1)],
  term ((-2224986028928059 : Rat) / 3197098941624) [(13, 2), (14, 1), (15, 2)],
  term ((-2224986028928059 : Rat) / 3197098941624) [(13, 2), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 214 for generator 12. -/
theorem rs_R009_ueqv_R009YNNNN_partial_12_0214_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_12_0214
        rs_R009_ueqv_R009YNNNN_generator_12_0200_0222 =
      rs_R009_ueqv_R009YNNNN_partial_12_0214 := by
  native_decide

/-- Coefficient term 215 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YNNNN_coefficient_12_0215 : Poly :=
[
  term ((-1495 : Rat) / 252) [(13, 2), (14, 1), (16, 1)]
]

/-- Partial product 215 for generator 12. -/
def rs_R009_ueqv_R009YNNNN_partial_12_0215 : Poly :=
[
  term ((1495 : Rat) / 126) [(2, 1), (13, 2), (14, 1), (16, 1)],
  term ((-1495 : Rat) / 126) [(2, 1), (13, 2), (14, 2), (16, 1)],
  term ((-1495 : Rat) / 126) [(3, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((1495 : Rat) / 252) [(13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-1495 : Rat) / 252) [(13, 2), (14, 1), (16, 1)],
  term ((1495 : Rat) / 252) [(13, 2), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 215 for generator 12. -/
theorem rs_R009_ueqv_R009YNNNN_partial_12_0215_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_12_0215
        rs_R009_ueqv_R009YNNNN_generator_12_0200_0222 =
      rs_R009_ueqv_R009YNNNN_partial_12_0215 := by
  native_decide

/-- Coefficient term 216 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YNNNN_coefficient_12_0216 : Poly :=
[
  term ((725 : Rat) / 168) [(13, 2), (16, 1)]
]

/-- Partial product 216 for generator 12. -/
def rs_R009_ueqv_R009YNNNN_partial_12_0216 : Poly :=
[
  term ((725 : Rat) / 84) [(2, 1), (13, 2), (14, 1), (16, 1)],
  term ((-725 : Rat) / 84) [(2, 1), (13, 2), (16, 1)],
  term ((725 : Rat) / 84) [(3, 1), (13, 2), (15, 1), (16, 1)],
  term ((-725 : Rat) / 168) [(13, 2), (14, 2), (16, 1)],
  term ((-725 : Rat) / 168) [(13, 2), (15, 2), (16, 1)],
  term ((725 : Rat) / 168) [(13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 216 for generator 12. -/
theorem rs_R009_ueqv_R009YNNNN_partial_12_0216_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_12_0216
        rs_R009_ueqv_R009YNNNN_generator_12_0200_0222 =
      rs_R009_ueqv_R009YNNNN_partial_12_0216 := by
  native_decide

/-- Coefficient term 217 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YNNNN_coefficient_12_0217 : Poly :=
[
  term ((540260666936513 : Rat) / 3868095015792) [(14, 1)]
]

/-- Partial product 217 for generator 12. -/
def rs_R009_ueqv_R009YNNNN_partial_12_0217 : Poly :=
[
  term ((-540260666936513 : Rat) / 1934047507896) [(2, 1), (14, 1)],
  term ((540260666936513 : Rat) / 1934047507896) [(2, 1), (14, 2)],
  term ((540260666936513 : Rat) / 1934047507896) [(3, 1), (14, 1), (15, 1)],
  term ((540260666936513 : Rat) / 3868095015792) [(14, 1)],
  term ((-540260666936513 : Rat) / 3868095015792) [(14, 1), (15, 2)],
  term ((-540260666936513 : Rat) / 3868095015792) [(14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 217 for generator 12. -/
theorem rs_R009_ueqv_R009YNNNN_partial_12_0217_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_12_0217
        rs_R009_ueqv_R009YNNNN_generator_12_0200_0222 =
      rs_R009_ueqv_R009YNNNN_partial_12_0217 := by
  native_decide

/-- Coefficient term 218 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YNNNN_coefficient_12_0218 : Poly :=
[
  term ((10350951862125718 : Rat) / 6527410339149) [(14, 1), (15, 2)]
]

/-- Partial product 218 for generator 12. -/
def rs_R009_ueqv_R009YNNNN_partial_12_0218 : Poly :=
[
  term ((-20701903724251436 : Rat) / 6527410339149) [(2, 1), (14, 1), (15, 2)],
  term ((20701903724251436 : Rat) / 6527410339149) [(2, 1), (14, 2), (15, 2)],
  term ((20701903724251436 : Rat) / 6527410339149) [(3, 1), (14, 1), (15, 3)],
  term ((10350951862125718 : Rat) / 6527410339149) [(14, 1), (15, 2)],
  term ((-10350951862125718 : Rat) / 6527410339149) [(14, 1), (15, 4)],
  term ((-10350951862125718 : Rat) / 6527410339149) [(14, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 218 for generator 12. -/
theorem rs_R009_ueqv_R009YNNNN_partial_12_0218_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_12_0218
        rs_R009_ueqv_R009YNNNN_generator_12_0200_0222 =
      rs_R009_ueqv_R009YNNNN_partial_12_0218 := by
  native_decide

/-- Coefficient term 219 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YNNNN_coefficient_12_0219 : Poly :=
[
  term ((32 : Rat) / 9) [(14, 1), (15, 2), (16, 1)]
]

/-- Partial product 219 for generator 12. -/
def rs_R009_ueqv_R009YNNNN_partial_12_0219 : Poly :=
[
  term ((-64 : Rat) / 9) [(2, 1), (14, 1), (15, 2), (16, 1)],
  term ((64 : Rat) / 9) [(2, 1), (14, 2), (15, 2), (16, 1)],
  term ((64 : Rat) / 9) [(3, 1), (14, 1), (15, 3), (16, 1)],
  term ((32 : Rat) / 9) [(14, 1), (15, 2), (16, 1)],
  term ((-32 : Rat) / 9) [(14, 1), (15, 4), (16, 1)],
  term ((-32 : Rat) / 9) [(14, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 219 for generator 12. -/
theorem rs_R009_ueqv_R009YNNNN_partial_12_0219_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_12_0219
        rs_R009_ueqv_R009YNNNN_generator_12_0200_0222 =
      rs_R009_ueqv_R009YNNNN_partial_12_0219 := by
  native_decide

/-- Coefficient term 220 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YNNNN_coefficient_12_0220 : Poly :=
[
  term ((-16542791276515493 : Rat) / 104438565426384) [(14, 2)]
]

/-- Partial product 220 for generator 12. -/
def rs_R009_ueqv_R009YNNNN_partial_12_0220 : Poly :=
[
  term ((16542791276515493 : Rat) / 52219282713192) [(2, 1), (14, 2)],
  term ((-16542791276515493 : Rat) / 52219282713192) [(2, 1), (14, 3)],
  term ((-16542791276515493 : Rat) / 52219282713192) [(3, 1), (14, 2), (15, 1)],
  term ((-16542791276515493 : Rat) / 104438565426384) [(14, 2)],
  term ((16542791276515493 : Rat) / 104438565426384) [(14, 2), (15, 2)],
  term ((16542791276515493 : Rat) / 104438565426384) [(14, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 220 for generator 12. -/
theorem rs_R009_ueqv_R009YNNNN_partial_12_0220_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_12_0220
        rs_R009_ueqv_R009YNNNN_generator_12_0200_0222 =
      rs_R009_ueqv_R009YNNNN_partial_12_0220 := by
  native_decide

/-- Coefficient term 221 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YNNNN_coefficient_12_0221 : Poly :=
[
  term ((129782712716606639 : Rat) / 104438565426384) [(15, 2)]
]

/-- Partial product 221 for generator 12. -/
def rs_R009_ueqv_R009YNNNN_partial_12_0221 : Poly :=
[
  term ((129782712716606639 : Rat) / 52219282713192) [(2, 1), (14, 1), (15, 2)],
  term ((-129782712716606639 : Rat) / 52219282713192) [(2, 1), (15, 2)],
  term ((129782712716606639 : Rat) / 52219282713192) [(3, 1), (15, 3)],
  term ((-129782712716606639 : Rat) / 104438565426384) [(14, 2), (15, 2)],
  term ((129782712716606639 : Rat) / 104438565426384) [(15, 2)],
  term ((-129782712716606639 : Rat) / 104438565426384) [(15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 221 for generator 12. -/
theorem rs_R009_ueqv_R009YNNNN_partial_12_0221_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_12_0221
        rs_R009_ueqv_R009YNNNN_generator_12_0200_0222 =
      rs_R009_ueqv_R009YNNNN_partial_12_0221 := by
  native_decide

/-- Coefficient term 222 from coefficient polynomial 12. -/
def rs_R009_ueqv_R009YNNNN_coefficient_12_0222 : Poly :=
[
  term ((-665 : Rat) / 18) [(15, 2), (16, 1)]
]

/-- Partial product 222 for generator 12. -/
def rs_R009_ueqv_R009YNNNN_partial_12_0222 : Poly :=
[
  term ((-665 : Rat) / 9) [(2, 1), (14, 1), (15, 2), (16, 1)],
  term ((665 : Rat) / 9) [(2, 1), (15, 2), (16, 1)],
  term ((-665 : Rat) / 9) [(3, 1), (15, 3), (16, 1)],
  term ((665 : Rat) / 18) [(14, 2), (15, 2), (16, 1)],
  term ((-665 : Rat) / 18) [(15, 2), (16, 1)],
  term ((665 : Rat) / 18) [(15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 222 for generator 12. -/
theorem rs_R009_ueqv_R009YNNNN_partial_12_0222_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_12_0222
        rs_R009_ueqv_R009YNNNN_generator_12_0200_0222 =
      rs_R009_ueqv_R009YNNNN_partial_12_0222 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009YNNNN_partials_12_0200_0222 : List Poly :=
[
  rs_R009_ueqv_R009YNNNN_partial_12_0200,
  rs_R009_ueqv_R009YNNNN_partial_12_0201,
  rs_R009_ueqv_R009YNNNN_partial_12_0202,
  rs_R009_ueqv_R009YNNNN_partial_12_0203,
  rs_R009_ueqv_R009YNNNN_partial_12_0204,
  rs_R009_ueqv_R009YNNNN_partial_12_0205,
  rs_R009_ueqv_R009YNNNN_partial_12_0206,
  rs_R009_ueqv_R009YNNNN_partial_12_0207,
  rs_R009_ueqv_R009YNNNN_partial_12_0208,
  rs_R009_ueqv_R009YNNNN_partial_12_0209,
  rs_R009_ueqv_R009YNNNN_partial_12_0210,
  rs_R009_ueqv_R009YNNNN_partial_12_0211,
  rs_R009_ueqv_R009YNNNN_partial_12_0212,
  rs_R009_ueqv_R009YNNNN_partial_12_0213,
  rs_R009_ueqv_R009YNNNN_partial_12_0214,
  rs_R009_ueqv_R009YNNNN_partial_12_0215,
  rs_R009_ueqv_R009YNNNN_partial_12_0216,
  rs_R009_ueqv_R009YNNNN_partial_12_0217,
  rs_R009_ueqv_R009YNNNN_partial_12_0218,
  rs_R009_ueqv_R009YNNNN_partial_12_0219,
  rs_R009_ueqv_R009YNNNN_partial_12_0220,
  rs_R009_ueqv_R009YNNNN_partial_12_0221,
  rs_R009_ueqv_R009YNNNN_partial_12_0222
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009YNNNN_block_12_0200_0222 : Poly :=
[
  term ((264134238054360613 : Rat) / 26109641356596) [(2, 1), (11, 1), (14, 1), (15, 1)],
  term ((-85 : Rat) / 2) [(2, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-18230348428002709 : Rat) / 2901071261844) [(2, 1), (11, 1), (14, 2), (15, 1)],
  term ((2179 : Rat) / 126) [(2, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(2, 1), (11, 1), (14, 3), (15, 1)],
  term ((-24270626456138884 : Rat) / 6527410339149) [(2, 1), (11, 1), (15, 1)],
  term ((1588 : Rat) / 63) [(2, 1), (11, 1), (15, 1), (16, 1)],
  term ((114508267095595943 : Rat) / 26109641356596) [(2, 1), (11, 2)],
  term ((-2693516068983389 : Rat) / 483511876974) [(2, 1), (11, 2), (14, 1)],
  term ((30941600629507063 : Rat) / 26109641356596) [(2, 1), (11, 2), (14, 2)],
  term ((10568938075403567 : Rat) / 13054820678298) [(2, 1), (12, 1)],
  term ((-10568938075403567 : Rat) / 13054820678298) [(2, 1), (12, 1), (14, 1)],
  term ((5035041217388051 : Rat) / 52219282713192) [(2, 1), (13, 1), (14, 1), (15, 1)],
  term ((20731 : Rat) / 252) [(2, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-97240501475236631 : Rat) / 39164462034894) [(2, 1), (13, 1), (14, 2), (15, 1)],
  term ((22 : Rat) / 9) [(2, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(2, 1), (13, 1), (14, 3), (15, 1)],
  term ((355985303982098195 : Rat) / 156657848139576) [(2, 1), (13, 1), (15, 1)],
  term ((-21347 : Rat) / 252) [(2, 1), (13, 1), (15, 1), (16, 1)],
  term ((-941242657 : Rat) / 166541592) [(2, 1), (13, 2)],
  term ((-4431903022569689 : Rat) / 3197098941624) [(2, 1), (13, 2), (14, 1)],
  term ((5165 : Rat) / 252) [(2, 1), (13, 2), (14, 1), (16, 1)],
  term ((2224986028928059 : Rat) / 1598549470812) [(2, 1), (13, 2), (14, 2)],
  term ((-1495 : Rat) / 126) [(2, 1), (13, 2), (14, 2), (16, 1)],
  term ((-725 : Rat) / 84) [(2, 1), (13, 2), (16, 1)],
  term ((-540260666936513 : Rat) / 1934047507896) [(2, 1), (14, 1)],
  term ((-35832517077404849 : Rat) / 52219282713192) [(2, 1), (14, 1), (15, 2)],
  term (-81 : Rat) [(2, 1), (14, 1), (15, 2), (16, 1)],
  term ((3891228660475168 : Rat) / 6527410339149) [(2, 1), (14, 2)],
  term ((20701903724251436 : Rat) / 6527410339149) [(2, 1), (14, 2), (15, 2)],
  term ((64 : Rat) / 9) [(2, 1), (14, 2), (15, 2), (16, 1)],
  term ((-16542791276515493 : Rat) / 52219282713192) [(2, 1), (14, 3)],
  term ((-129782712716606639 : Rat) / 52219282713192) [(2, 1), (15, 2)],
  term ((665 : Rat) / 9) [(2, 1), (15, 2), (16, 1)],
  term ((-18561303581089453 : Rat) / 2901071261844) [(3, 1), (11, 1), (14, 1), (15, 2)],
  term ((2179 : Rat) / 126) [(3, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(3, 1), (11, 1), (14, 2), (15, 2)],
  term ((24270626456138884 : Rat) / 6527410339149) [(3, 1), (11, 1), (15, 2)],
  term ((-1588 : Rat) / 63) [(3, 1), (11, 1), (15, 2), (16, 1)],
  term ((30941600629507063 : Rat) / 26109641356596) [(3, 1), (11, 2), (14, 1), (15, 1)],
  term ((-114508267095595943 : Rat) / 26109641356596) [(3, 1), (11, 2), (15, 1)],
  term ((-10568938075403567 : Rat) / 13054820678298) [(3, 1), (12, 1), (15, 1)],
  term ((-92772606908565587 : Rat) / 39164462034894) [(3, 1), (13, 1), (14, 1), (15, 2)],
  term ((22 : Rat) / 9) [(3, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(3, 1), (13, 1), (14, 2), (15, 2)],
  term ((-355985303982098195 : Rat) / 156657848139576) [(3, 1), (13, 1), (15, 2)],
  term ((21347 : Rat) / 252) [(3, 1), (13, 1), (15, 2), (16, 1)],
  term ((2224986028928059 : Rat) / 1598549470812) [(3, 1), (13, 2), (14, 1), (15, 1)],
  term ((-1495 : Rat) / 126) [(3, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((941242657 : Rat) / 166541592) [(3, 1), (13, 2), (15, 1)],
  term ((725 : Rat) / 84) [(3, 1), (13, 2), (15, 1), (16, 1)],
  term ((540260666936513 : Rat) / 1934047507896) [(3, 1), (14, 1), (15, 1)],
  term ((20701903724251436 : Rat) / 6527410339149) [(3, 1), (14, 1), (15, 3)],
  term ((64 : Rat) / 9) [(3, 1), (14, 1), (15, 3), (16, 1)],
  term ((-16542791276515493 : Rat) / 52219282713192) [(3, 1), (14, 2), (15, 1)],
  term ((129782712716606639 : Rat) / 52219282713192) [(3, 1), (15, 3)],
  term ((-665 : Rat) / 9) [(3, 1), (15, 3), (16, 1)],
  term ((-18561303581089453 : Rat) / 5802142523688) [(11, 1), (14, 1), (15, 1)],
  term ((2179 : Rat) / 252) [(11, 1), (14, 1), (15, 1), (16, 1)],
  term ((18561303581089453 : Rat) / 5802142523688) [(11, 1), (14, 1), (15, 3)],
  term ((-2179 : Rat) / 252) [(11, 1), (14, 1), (15, 3), (16, 1)],
  term ((-12507637775292029 : Rat) / 6527410339149) [(11, 1), (14, 2), (15, 1)],
  term ((794 : Rat) / 63) [(11, 1), (14, 2), (15, 1), (16, 1)],
  term ((1532199782809 : Rat) / 26861770943) [(11, 1), (14, 2), (15, 3)],
  term ((18561303581089453 : Rat) / 5802142523688) [(11, 1), (14, 3), (15, 1)],
  term ((-2179 : Rat) / 252) [(11, 1), (14, 3), (15, 1), (16, 1)],
  term ((1532199782809 : Rat) / 26861770943) [(11, 1), (14, 4), (15, 1)],
  term ((12135313228069442 : Rat) / 6527410339149) [(11, 1), (15, 1)],
  term ((-794 : Rat) / 63) [(11, 1), (15, 1), (16, 1)],
  term ((-12135313228069442 : Rat) / 6527410339149) [(11, 1), (15, 3)],
  term ((794 : Rat) / 63) [(11, 1), (15, 3), (16, 1)],
  term ((-114508267095595943 : Rat) / 52219282713192) [(11, 2)],
  term ((30941600629507063 : Rat) / 52219282713192) [(11, 2), (14, 1)],
  term ((-30941600629507063 : Rat) / 52219282713192) [(11, 2), (14, 1), (15, 2)],
  term ((114508267095595943 : Rat) / 52219282713192) [(11, 2), (14, 2)],
  term ((-30941600629507063 : Rat) / 52219282713192) [(11, 2), (14, 3)],
  term ((114508267095595943 : Rat) / 52219282713192) [(11, 2), (15, 2)],
  term ((-10568938075403567 : Rat) / 26109641356596) [(12, 1)],
  term ((10568938075403567 : Rat) / 26109641356596) [(12, 1), (14, 2)],
  term ((10568938075403567 : Rat) / 26109641356596) [(12, 1), (15, 2)],
  term ((-92772606908565587 : Rat) / 78328924069788) [(13, 1), (14, 1), (15, 1)],
  term ((11 : Rat) / 9) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term ((92772606908565587 : Rat) / 78328924069788) [(13, 1), (14, 1), (15, 3)],
  term ((-11 : Rat) / 9) [(13, 1), (14, 1), (15, 3), (16, 1)],
  term ((373856882248782371 : Rat) / 313315696279152) [(13, 1), (14, 2), (15, 1)],
  term ((-21347 : Rat) / 504) [(13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1532199782809 : Rat) / 26861770943) [(13, 1), (14, 2), (15, 3)],
  term ((92772606908565587 : Rat) / 78328924069788) [(13, 1), (14, 3), (15, 1)],
  term ((-11 : Rat) / 9) [(13, 1), (14, 3), (15, 1), (16, 1)],
  term ((-1532199782809 : Rat) / 26861770943) [(13, 1), (14, 4), (15, 1)],
  term ((-355985303982098195 : Rat) / 313315696279152) [(13, 1), (15, 1)],
  term ((21347 : Rat) / 504) [(13, 1), (15, 1), (16, 1)],
  term ((355985303982098195 : Rat) / 313315696279152) [(13, 1), (15, 3)],
  term ((-21347 : Rat) / 504) [(13, 1), (15, 3), (16, 1)],
  term ((941242657 : Rat) / 333083184) [(13, 2)],
  term ((2224986028928059 : Rat) / 3197098941624) [(13, 2), (14, 1)],
  term ((-2224986028928059 : Rat) / 3197098941624) [(13, 2), (14, 1), (15, 2)],
  term ((1495 : Rat) / 252) [(13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-1495 : Rat) / 252) [(13, 2), (14, 1), (16, 1)],
  term ((-941242657 : Rat) / 333083184) [(13, 2), (14, 2)],
  term ((-725 : Rat) / 168) [(13, 2), (14, 2), (16, 1)],
  term ((-2224986028928059 : Rat) / 3197098941624) [(13, 2), (14, 3)],
  term ((1495 : Rat) / 252) [(13, 2), (14, 3), (16, 1)],
  term ((-941242657 : Rat) / 333083184) [(13, 2), (15, 2)],
  term ((-725 : Rat) / 168) [(13, 2), (15, 2), (16, 1)],
  term ((725 : Rat) / 168) [(13, 2), (16, 1)],
  term ((540260666936513 : Rat) / 3868095015792) [(14, 1)],
  term ((151028191786725637 : Rat) / 104438565426384) [(14, 1), (15, 2)],
  term ((32 : Rat) / 9) [(14, 1), (15, 2), (16, 1)],
  term ((-10350951862125718 : Rat) / 6527410339149) [(14, 1), (15, 4)],
  term ((-32 : Rat) / 9) [(14, 1), (15, 4), (16, 1)],
  term ((-16542791276515493 : Rat) / 104438565426384) [(14, 2)],
  term ((-18873320240015191 : Rat) / 17406427571064) [(14, 2), (15, 2)],
  term ((665 : Rat) / 18) [(14, 2), (15, 2), (16, 1)],
  term ((-540260666936513 : Rat) / 3868095015792) [(14, 3)],
  term ((-10350951862125718 : Rat) / 6527410339149) [(14, 3), (15, 2)],
  term ((-32 : Rat) / 9) [(14, 3), (15, 2), (16, 1)],
  term ((16542791276515493 : Rat) / 104438565426384) [(14, 4)],
  term ((129782712716606639 : Rat) / 104438565426384) [(15, 2)],
  term ((-665 : Rat) / 18) [(15, 2), (16, 1)],
  term ((-129782712716606639 : Rat) / 104438565426384) [(15, 4)],
  term ((665 : Rat) / 18) [(15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 12, terms 200 through 222. -/
theorem rs_R009_ueqv_R009YNNNN_block_12_0200_0222_valid :
    checkProductSumEq rs_R009_ueqv_R009YNNNN_partials_12_0200_0222
      rs_R009_ueqv_R009YNNNN_block_12_0200_0222 = true := by
  native_decide

end R009UeqvR009YNNNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
