/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009YNNNN, term block 29:200-222

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009YNNNNTermShards

/-- Generator polynomial 29 for relaxed split surplus certificate `R009:u=v:R009YNNNN`. -/
def rs_R009_ueqv_R009YNNNN_generator_29_0200_0222 : Poly :=
[
  term (-2 : Rat) [(0, 1), (14, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (15, 1)],
  term (1 : Rat) [(1, 2)],
  term (2 : Rat) [(2, 1), (14, 1)],
  term (-1 : Rat) [(2, 2)],
  term (2 : Rat) [(3, 1), (15, 1)],
  term (-1 : Rat) [(3, 2)]
]

/-- Coefficient term 200 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0200 : Poly :=
[
  term ((55 : Rat) / 252) [(11, 1), (13, 1), (16, 1)]
]

/-- Partial product 200 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0200 : Poly :=
[
  term ((-55 : Rat) / 126) [(0, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((55 : Rat) / 252) [(0, 2), (11, 1), (13, 1), (16, 1)],
  term ((-55 : Rat) / 126) [(1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((55 : Rat) / 252) [(1, 2), (11, 1), (13, 1), (16, 1)],
  term ((55 : Rat) / 126) [(2, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-55 : Rat) / 252) [(2, 2), (11, 1), (13, 1), (16, 1)],
  term ((55 : Rat) / 126) [(3, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-55 : Rat) / 252) [(3, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 200 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0200_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0200
        rs_R009_ueqv_R009YNNNN_generator_29_0200_0222 =
      rs_R009_ueqv_R009YNNNN_partial_29_0200 := by
  native_decide

/-- Coefficient term 201 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0201 : Poly :=
[
  term ((10701790914295678 : Rat) / 6527410339149) [(11, 1), (14, 1), (15, 1)]
]

/-- Partial product 201 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0201 : Poly :=
[
  term ((-21403581828591356 : Rat) / 6527410339149) [(0, 1), (11, 1), (14, 2), (15, 1)],
  term ((10701790914295678 : Rat) / 6527410339149) [(0, 2), (11, 1), (14, 1), (15, 1)],
  term ((-21403581828591356 : Rat) / 6527410339149) [(1, 1), (11, 1), (14, 1), (15, 2)],
  term ((10701790914295678 : Rat) / 6527410339149) [(1, 2), (11, 1), (14, 1), (15, 1)],
  term ((21403581828591356 : Rat) / 6527410339149) [(2, 1), (11, 1), (14, 2), (15, 1)],
  term ((-10701790914295678 : Rat) / 6527410339149) [(2, 2), (11, 1), (14, 1), (15, 1)],
  term ((21403581828591356 : Rat) / 6527410339149) [(3, 1), (11, 1), (14, 1), (15, 2)],
  term ((-10701790914295678 : Rat) / 6527410339149) [(3, 2), (11, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 201 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0201_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0201
        rs_R009_ueqv_R009YNNNN_generator_29_0200_0222 =
      rs_R009_ueqv_R009YNNNN_partial_29_0201 := by
  native_decide

/-- Coefficient term 202 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0202 : Poly :=
[
  term ((-92 : Rat) / 7) [(11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 202 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0202 : Poly :=
[
  term ((184 : Rat) / 7) [(0, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-92 : Rat) / 7) [(0, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((184 : Rat) / 7) [(1, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-92 : Rat) / 7) [(1, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-184 : Rat) / 7) [(2, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((92 : Rat) / 7) [(2, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-184 : Rat) / 7) [(3, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((92 : Rat) / 7) [(3, 2), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 202 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0202_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0202
        rs_R009_ueqv_R009YNNNN_generator_29_0200_0222 =
      rs_R009_ueqv_R009YNNNN_partial_29_0202 := by
  native_decide

/-- Coefficient term 203 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0203 : Poly :=
[
  term ((1532199782809 : Rat) / 26861770943) [(11, 1), (14, 2), (15, 1)]
]

/-- Partial product 203 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0203 : Poly :=
[
  term ((-3064399565618 : Rat) / 26861770943) [(0, 1), (11, 1), (14, 3), (15, 1)],
  term ((1532199782809 : Rat) / 26861770943) [(0, 2), (11, 1), (14, 2), (15, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(1, 1), (11, 1), (14, 2), (15, 2)],
  term ((1532199782809 : Rat) / 26861770943) [(1, 2), (11, 1), (14, 2), (15, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(2, 1), (11, 1), (14, 3), (15, 1)],
  term ((-1532199782809 : Rat) / 26861770943) [(2, 2), (11, 1), (14, 2), (15, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(3, 1), (11, 1), (14, 2), (15, 2)],
  term ((-1532199782809 : Rat) / 26861770943) [(3, 2), (11, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 203 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0203_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0203
        rs_R009_ueqv_R009YNNNN_generator_29_0200_0222 =
      rs_R009_ueqv_R009YNNNN_partial_29_0203 := by
  native_decide

/-- Coefficient term 204 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0204 : Poly :=
[
  term ((898169651916097 : Rat) / 2901071261844) [(11, 1), (15, 1)]
]

/-- Partial product 204 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0204 : Poly :=
[
  term ((-898169651916097 : Rat) / 1450535630922) [(0, 1), (11, 1), (14, 1), (15, 1)],
  term ((898169651916097 : Rat) / 2901071261844) [(0, 2), (11, 1), (15, 1)],
  term ((-898169651916097 : Rat) / 1450535630922) [(1, 1), (11, 1), (15, 2)],
  term ((898169651916097 : Rat) / 2901071261844) [(1, 2), (11, 1), (15, 1)],
  term ((898169651916097 : Rat) / 1450535630922) [(2, 1), (11, 1), (14, 1), (15, 1)],
  term ((-898169651916097 : Rat) / 2901071261844) [(2, 2), (11, 1), (15, 1)],
  term ((898169651916097 : Rat) / 1450535630922) [(3, 1), (11, 1), (15, 2)],
  term ((-898169651916097 : Rat) / 2901071261844) [(3, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 204 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0204_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0204
        rs_R009_ueqv_R009YNNNN_generator_29_0200_0222 =
      rs_R009_ueqv_R009YNNNN_partial_29_0204 := by
  native_decide

/-- Coefficient term 205 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0205 : Poly :=
[
  term ((65 : Rat) / 63) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 205 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0205 : Poly :=
[
  term ((-130 : Rat) / 63) [(0, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((65 : Rat) / 63) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((-130 : Rat) / 63) [(1, 1), (11, 1), (15, 2), (16, 1)],
  term ((65 : Rat) / 63) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((130 : Rat) / 63) [(2, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-65 : Rat) / 63) [(2, 2), (11, 1), (15, 1), (16, 1)],
  term ((130 : Rat) / 63) [(3, 1), (11, 1), (15, 2), (16, 1)],
  term ((-65 : Rat) / 63) [(3, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 205 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0205_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0205
        rs_R009_ueqv_R009YNNNN_generator_29_0200_0222 =
      rs_R009_ueqv_R009YNNNN_partial_29_0205 := by
  native_decide

/-- Coefficient term 206 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0206 : Poly :=
[
  term ((17857901427447863 : Rat) / 52219282713192) [(11, 2)]
]

/-- Partial product 206 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0206 : Poly :=
[
  term ((-17857901427447863 : Rat) / 26109641356596) [(0, 1), (11, 2), (14, 1)],
  term ((17857901427447863 : Rat) / 52219282713192) [(0, 2), (11, 2)],
  term ((-17857901427447863 : Rat) / 26109641356596) [(1, 1), (11, 2), (15, 1)],
  term ((17857901427447863 : Rat) / 52219282713192) [(1, 2), (11, 2)],
  term ((17857901427447863 : Rat) / 26109641356596) [(2, 1), (11, 2), (14, 1)],
  term ((-17857901427447863 : Rat) / 52219282713192) [(2, 2), (11, 2)],
  term ((17857901427447863 : Rat) / 26109641356596) [(3, 1), (11, 2), (15, 1)],
  term ((-17857901427447863 : Rat) / 52219282713192) [(3, 2), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 206 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0206_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0206
        rs_R009_ueqv_R009YNNNN_generator_29_0200_0222 =
      rs_R009_ueqv_R009YNNNN_partial_29_0206 := by
  native_decide

/-- Coefficient term 207 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0207 : Poly :=
[
  term ((313530330473821 : Rat) / 220334526216) [(11, 2), (14, 1)]
]

/-- Partial product 207 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0207 : Poly :=
[
  term ((-313530330473821 : Rat) / 110167263108) [(0, 1), (11, 2), (14, 2)],
  term ((313530330473821 : Rat) / 220334526216) [(0, 2), (11, 2), (14, 1)],
  term ((-313530330473821 : Rat) / 110167263108) [(1, 1), (11, 2), (14, 1), (15, 1)],
  term ((313530330473821 : Rat) / 220334526216) [(1, 2), (11, 2), (14, 1)],
  term ((313530330473821 : Rat) / 110167263108) [(2, 1), (11, 2), (14, 2)],
  term ((-313530330473821 : Rat) / 220334526216) [(2, 2), (11, 2), (14, 1)],
  term ((313530330473821 : Rat) / 110167263108) [(3, 1), (11, 2), (14, 1), (15, 1)],
  term ((-313530330473821 : Rat) / 220334526216) [(3, 2), (11, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 207 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0207_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0207
        rs_R009_ueqv_R009YNNNN_generator_29_0200_0222 =
      rs_R009_ueqv_R009YNNNN_partial_29_0207 := by
  native_decide

/-- Coefficient term 208 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0208 : Poly :=
[
  term ((92772606908565587 : Rat) / 78328924069788) [(13, 1), (14, 1), (15, 1)]
]

/-- Partial product 208 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0208 : Poly :=
[
  term ((-92772606908565587 : Rat) / 39164462034894) [(0, 1), (13, 1), (14, 2), (15, 1)],
  term ((92772606908565587 : Rat) / 78328924069788) [(0, 2), (13, 1), (14, 1), (15, 1)],
  term ((-92772606908565587 : Rat) / 39164462034894) [(1, 1), (13, 1), (14, 1), (15, 2)],
  term ((92772606908565587 : Rat) / 78328924069788) [(1, 2), (13, 1), (14, 1), (15, 1)],
  term ((92772606908565587 : Rat) / 39164462034894) [(2, 1), (13, 1), (14, 2), (15, 1)],
  term ((-92772606908565587 : Rat) / 78328924069788) [(2, 2), (13, 1), (14, 1), (15, 1)],
  term ((92772606908565587 : Rat) / 39164462034894) [(3, 1), (13, 1), (14, 1), (15, 2)],
  term ((-92772606908565587 : Rat) / 78328924069788) [(3, 2), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 208 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0208_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0208
        rs_R009_ueqv_R009YNNNN_generator_29_0200_0222 =
      rs_R009_ueqv_R009YNNNN_partial_29_0208 := by
  native_decide

/-- Coefficient term 209 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0209 : Poly :=
[
  term ((-11 : Rat) / 9) [(13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 209 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0209 : Poly :=
[
  term ((22 : Rat) / 9) [(0, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-11 : Rat) / 9) [(0, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((22 : Rat) / 9) [(1, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-11 : Rat) / 9) [(1, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-22 : Rat) / 9) [(2, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((11 : Rat) / 9) [(2, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-22 : Rat) / 9) [(3, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((11 : Rat) / 9) [(3, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 209 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0209_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0209
        rs_R009_ueqv_R009YNNNN_generator_29_0200_0222 =
      rs_R009_ueqv_R009YNNNN_partial_29_0209 := by
  native_decide

/-- Coefficient term 210 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0210 : Poly :=
[
  term ((-1532199782809 : Rat) / 26861770943) [(13, 1), (14, 2), (15, 1)]
]

/-- Partial product 210 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0210 : Poly :=
[
  term ((3064399565618 : Rat) / 26861770943) [(0, 1), (13, 1), (14, 3), (15, 1)],
  term ((-1532199782809 : Rat) / 26861770943) [(0, 2), (13, 1), (14, 2), (15, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(1, 1), (13, 1), (14, 2), (15, 2)],
  term ((-1532199782809 : Rat) / 26861770943) [(1, 2), (13, 1), (14, 2), (15, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(2, 1), (13, 1), (14, 3), (15, 1)],
  term ((1532199782809 : Rat) / 26861770943) [(2, 2), (13, 1), (14, 2), (15, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(3, 1), (13, 1), (14, 2), (15, 2)],
  term ((1532199782809 : Rat) / 26861770943) [(3, 2), (13, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 210 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0210_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0210
        rs_R009_ueqv_R009YNNNN_generator_29_0200_0222 =
      rs_R009_ueqv_R009YNNNN_partial_29_0210 := by
  native_decide

/-- Coefficient term 211 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0211 : Poly :=
[
  term ((236652452977240031 : Rat) / 313315696279152) [(13, 1), (15, 1)]
]

/-- Partial product 211 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0211 : Poly :=
[
  term ((-236652452977240031 : Rat) / 156657848139576) [(0, 1), (13, 1), (14, 1), (15, 1)],
  term ((236652452977240031 : Rat) / 313315696279152) [(0, 2), (13, 1), (15, 1)],
  term ((-236652452977240031 : Rat) / 156657848139576) [(1, 1), (13, 1), (15, 2)],
  term ((236652452977240031 : Rat) / 313315696279152) [(1, 2), (13, 1), (15, 1)],
  term ((236652452977240031 : Rat) / 156657848139576) [(2, 1), (13, 1), (14, 1), (15, 1)],
  term ((-236652452977240031 : Rat) / 313315696279152) [(2, 2), (13, 1), (15, 1)],
  term ((236652452977240031 : Rat) / 156657848139576) [(3, 1), (13, 1), (15, 2)],
  term ((-236652452977240031 : Rat) / 313315696279152) [(3, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 211 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0211_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0211
        rs_R009_ueqv_R009YNNNN_generator_29_0200_0222 =
      rs_R009_ueqv_R009YNNNN_partial_29_0211 := by
  native_decide

/-- Coefficient term 212 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0212 : Poly :=
[
  term ((-21347 : Rat) / 504) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 212 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0212 : Poly :=
[
  term ((21347 : Rat) / 252) [(0, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-21347 : Rat) / 504) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((21347 : Rat) / 252) [(1, 1), (13, 1), (15, 2), (16, 1)],
  term ((-21347 : Rat) / 504) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((-21347 : Rat) / 252) [(2, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((21347 : Rat) / 504) [(2, 2), (13, 1), (15, 1), (16, 1)],
  term ((-21347 : Rat) / 252) [(3, 1), (13, 1), (15, 2), (16, 1)],
  term ((21347 : Rat) / 504) [(3, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 212 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0212_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0212
        rs_R009_ueqv_R009YNNNN_generator_29_0200_0222 =
      rs_R009_ueqv_R009YNNNN_partial_29_0212 := by
  native_decide

/-- Coefficient term 213 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0213 : Poly :=
[
  term ((-941242657 : Rat) / 333083184) [(13, 2)]
]

/-- Partial product 213 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0213 : Poly :=
[
  term ((941242657 : Rat) / 166541592) [(0, 1), (13, 2), (14, 1)],
  term ((-941242657 : Rat) / 333083184) [(0, 2), (13, 2)],
  term ((941242657 : Rat) / 166541592) [(1, 1), (13, 2), (15, 1)],
  term ((-941242657 : Rat) / 333083184) [(1, 2), (13, 2)],
  term ((-941242657 : Rat) / 166541592) [(2, 1), (13, 2), (14, 1)],
  term ((941242657 : Rat) / 333083184) [(2, 2), (13, 2)],
  term ((-941242657 : Rat) / 166541592) [(3, 1), (13, 2), (15, 1)],
  term ((941242657 : Rat) / 333083184) [(3, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 213 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0213_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0213
        rs_R009_ueqv_R009YNNNN_generator_29_0200_0222 =
      rs_R009_ueqv_R009YNNNN_partial_29_0213 := by
  native_decide

/-- Coefficient term 214 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0214 : Poly :=
[
  term ((-2224986028928059 : Rat) / 3197098941624) [(13, 2), (14, 1)]
]

/-- Partial product 214 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0214 : Poly :=
[
  term ((2224986028928059 : Rat) / 1598549470812) [(0, 1), (13, 2), (14, 2)],
  term ((-2224986028928059 : Rat) / 3197098941624) [(0, 2), (13, 2), (14, 1)],
  term ((2224986028928059 : Rat) / 1598549470812) [(1, 1), (13, 2), (14, 1), (15, 1)],
  term ((-2224986028928059 : Rat) / 3197098941624) [(1, 2), (13, 2), (14, 1)],
  term ((-2224986028928059 : Rat) / 1598549470812) [(2, 1), (13, 2), (14, 2)],
  term ((2224986028928059 : Rat) / 3197098941624) [(2, 2), (13, 2), (14, 1)],
  term ((-2224986028928059 : Rat) / 1598549470812) [(3, 1), (13, 2), (14, 1), (15, 1)],
  term ((2224986028928059 : Rat) / 3197098941624) [(3, 2), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 214 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0214_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0214
        rs_R009_ueqv_R009YNNNN_generator_29_0200_0222 =
      rs_R009_ueqv_R009YNNNN_partial_29_0214 := by
  native_decide

/-- Coefficient term 215 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0215 : Poly :=
[
  term ((1495 : Rat) / 252) [(13, 2), (14, 1), (16, 1)]
]

/-- Partial product 215 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0215 : Poly :=
[
  term ((-1495 : Rat) / 126) [(0, 1), (13, 2), (14, 2), (16, 1)],
  term ((1495 : Rat) / 252) [(0, 2), (13, 2), (14, 1), (16, 1)],
  term ((-1495 : Rat) / 126) [(1, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((1495 : Rat) / 252) [(1, 2), (13, 2), (14, 1), (16, 1)],
  term ((1495 : Rat) / 126) [(2, 1), (13, 2), (14, 2), (16, 1)],
  term ((-1495 : Rat) / 252) [(2, 2), (13, 2), (14, 1), (16, 1)],
  term ((1495 : Rat) / 126) [(3, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1495 : Rat) / 252) [(3, 2), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 215 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0215_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0215
        rs_R009_ueqv_R009YNNNN_generator_29_0200_0222 =
      rs_R009_ueqv_R009YNNNN_partial_29_0215 := by
  native_decide

/-- Coefficient term 216 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0216 : Poly :=
[
  term ((-725 : Rat) / 168) [(13, 2), (16, 1)]
]

/-- Partial product 216 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0216 : Poly :=
[
  term ((725 : Rat) / 84) [(0, 1), (13, 2), (14, 1), (16, 1)],
  term ((-725 : Rat) / 168) [(0, 2), (13, 2), (16, 1)],
  term ((725 : Rat) / 84) [(1, 1), (13, 2), (15, 1), (16, 1)],
  term ((-725 : Rat) / 168) [(1, 2), (13, 2), (16, 1)],
  term ((-725 : Rat) / 84) [(2, 1), (13, 2), (14, 1), (16, 1)],
  term ((725 : Rat) / 168) [(2, 2), (13, 2), (16, 1)],
  term ((-725 : Rat) / 84) [(3, 1), (13, 2), (15, 1), (16, 1)],
  term ((725 : Rat) / 168) [(3, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 216 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0216_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0216
        rs_R009_ueqv_R009YNNNN_generator_29_0200_0222 =
      rs_R009_ueqv_R009YNNNN_partial_29_0216 := by
  native_decide

/-- Coefficient term 217 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0217 : Poly :=
[
  term ((1806474784011811 : Rat) / 34812855142128) [(14, 1)]
]

/-- Partial product 217 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0217 : Poly :=
[
  term ((-1806474784011811 : Rat) / 17406427571064) [(0, 1), (14, 2)],
  term ((1806474784011811 : Rat) / 34812855142128) [(0, 2), (14, 1)],
  term ((-1806474784011811 : Rat) / 17406427571064) [(1, 1), (14, 1), (15, 1)],
  term ((1806474784011811 : Rat) / 34812855142128) [(1, 2), (14, 1)],
  term ((1806474784011811 : Rat) / 17406427571064) [(2, 1), (14, 2)],
  term ((-1806474784011811 : Rat) / 34812855142128) [(2, 2), (14, 1)],
  term ((1806474784011811 : Rat) / 17406427571064) [(3, 1), (14, 1), (15, 1)],
  term ((-1806474784011811 : Rat) / 34812855142128) [(3, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 217 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0217_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0217
        rs_R009_ueqv_R009YNNNN_generator_29_0200_0222 =
      rs_R009_ueqv_R009YNNNN_partial_29_0217 := by
  native_decide

/-- Coefficient term 218 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0218 : Poly :=
[
  term ((-10350951862125718 : Rat) / 6527410339149) [(14, 1), (15, 2)]
]

/-- Partial product 218 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0218 : Poly :=
[
  term ((20701903724251436 : Rat) / 6527410339149) [(0, 1), (14, 2), (15, 2)],
  term ((-10350951862125718 : Rat) / 6527410339149) [(0, 2), (14, 1), (15, 2)],
  term ((20701903724251436 : Rat) / 6527410339149) [(1, 1), (14, 1), (15, 3)],
  term ((-10350951862125718 : Rat) / 6527410339149) [(1, 2), (14, 1), (15, 2)],
  term ((-20701903724251436 : Rat) / 6527410339149) [(2, 1), (14, 2), (15, 2)],
  term ((10350951862125718 : Rat) / 6527410339149) [(2, 2), (14, 1), (15, 2)],
  term ((-20701903724251436 : Rat) / 6527410339149) [(3, 1), (14, 1), (15, 3)],
  term ((10350951862125718 : Rat) / 6527410339149) [(3, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 218 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0218_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0218
        rs_R009_ueqv_R009YNNNN_generator_29_0200_0222 =
      rs_R009_ueqv_R009YNNNN_partial_29_0218 := by
  native_decide

/-- Coefficient term 219 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0219 : Poly :=
[
  term ((-32 : Rat) / 9) [(14, 1), (15, 2), (16, 1)]
]

/-- Partial product 219 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0219 : Poly :=
[
  term ((64 : Rat) / 9) [(0, 1), (14, 2), (15, 2), (16, 1)],
  term ((-32 : Rat) / 9) [(0, 2), (14, 1), (15, 2), (16, 1)],
  term ((64 : Rat) / 9) [(1, 1), (14, 1), (15, 3), (16, 1)],
  term ((-32 : Rat) / 9) [(1, 2), (14, 1), (15, 2), (16, 1)],
  term ((-64 : Rat) / 9) [(2, 1), (14, 2), (15, 2), (16, 1)],
  term ((32 : Rat) / 9) [(2, 2), (14, 1), (15, 2), (16, 1)],
  term ((-64 : Rat) / 9) [(3, 1), (14, 1), (15, 3), (16, 1)],
  term ((32 : Rat) / 9) [(3, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 219 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0219_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0219
        rs_R009_ueqv_R009YNNNN_generator_29_0200_0222 =
      rs_R009_ueqv_R009YNNNN_partial_29_0219 := by
  native_decide

/-- Coefficient term 220 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0220 : Poly :=
[
  term ((788358524112601 : Rat) / 3868095015792) [(14, 2)]
]

/-- Partial product 220 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0220 : Poly :=
[
  term ((-788358524112601 : Rat) / 1934047507896) [(0, 1), (14, 3)],
  term ((788358524112601 : Rat) / 3868095015792) [(0, 2), (14, 2)],
  term ((-788358524112601 : Rat) / 1934047507896) [(1, 1), (14, 2), (15, 1)],
  term ((788358524112601 : Rat) / 3868095015792) [(1, 2), (14, 2)],
  term ((788358524112601 : Rat) / 1934047507896) [(2, 1), (14, 3)],
  term ((-788358524112601 : Rat) / 3868095015792) [(2, 2), (14, 2)],
  term ((788358524112601 : Rat) / 1934047507896) [(3, 1), (14, 2), (15, 1)],
  term ((-788358524112601 : Rat) / 3868095015792) [(3, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 220 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0220_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0220
        rs_R009_ueqv_R009YNNNN_generator_29_0200_0222 =
      rs_R009_ueqv_R009YNNNN_partial_29_0220 := by
  native_decide

/-- Coefficient term 221 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0221 : Poly :=
[
  term ((-120171034974832405 : Rat) / 104438565426384) [(15, 2)]
]

/-- Partial product 221 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0221 : Poly :=
[
  term ((120171034974832405 : Rat) / 52219282713192) [(0, 1), (14, 1), (15, 2)],
  term ((-120171034974832405 : Rat) / 104438565426384) [(0, 2), (15, 2)],
  term ((120171034974832405 : Rat) / 52219282713192) [(1, 1), (15, 3)],
  term ((-120171034974832405 : Rat) / 104438565426384) [(1, 2), (15, 2)],
  term ((-120171034974832405 : Rat) / 52219282713192) [(2, 1), (14, 1), (15, 2)],
  term ((120171034974832405 : Rat) / 104438565426384) [(2, 2), (15, 2)],
  term ((-120171034974832405 : Rat) / 52219282713192) [(3, 1), (15, 3)],
  term ((120171034974832405 : Rat) / 104438565426384) [(3, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 221 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0221_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0221
        rs_R009_ueqv_R009YNNNN_generator_29_0200_0222 =
      rs_R009_ueqv_R009YNNNN_partial_29_0221 := by
  native_decide

/-- Coefficient term 222 from coefficient polynomial 29. -/
def rs_R009_ueqv_R009YNNNN_coefficient_29_0222 : Poly :=
[
  term ((665 : Rat) / 18) [(15, 2), (16, 1)]
]

/-- Partial product 222 for generator 29. -/
def rs_R009_ueqv_R009YNNNN_partial_29_0222 : Poly :=
[
  term ((-665 : Rat) / 9) [(0, 1), (14, 1), (15, 2), (16, 1)],
  term ((665 : Rat) / 18) [(0, 2), (15, 2), (16, 1)],
  term ((-665 : Rat) / 9) [(1, 1), (15, 3), (16, 1)],
  term ((665 : Rat) / 18) [(1, 2), (15, 2), (16, 1)],
  term ((665 : Rat) / 9) [(2, 1), (14, 1), (15, 2), (16, 1)],
  term ((-665 : Rat) / 18) [(2, 2), (15, 2), (16, 1)],
  term ((665 : Rat) / 9) [(3, 1), (15, 3), (16, 1)],
  term ((-665 : Rat) / 18) [(3, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 222 for generator 29. -/
theorem rs_R009_ueqv_R009YNNNN_partial_29_0222_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_29_0222
        rs_R009_ueqv_R009YNNNN_generator_29_0200_0222 =
      rs_R009_ueqv_R009YNNNN_partial_29_0222 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009YNNNN_partials_29_0200_0222 : List Poly :=
[
  rs_R009_ueqv_R009YNNNN_partial_29_0200,
  rs_R009_ueqv_R009YNNNN_partial_29_0201,
  rs_R009_ueqv_R009YNNNN_partial_29_0202,
  rs_R009_ueqv_R009YNNNN_partial_29_0203,
  rs_R009_ueqv_R009YNNNN_partial_29_0204,
  rs_R009_ueqv_R009YNNNN_partial_29_0205,
  rs_R009_ueqv_R009YNNNN_partial_29_0206,
  rs_R009_ueqv_R009YNNNN_partial_29_0207,
  rs_R009_ueqv_R009YNNNN_partial_29_0208,
  rs_R009_ueqv_R009YNNNN_partial_29_0209,
  rs_R009_ueqv_R009YNNNN_partial_29_0210,
  rs_R009_ueqv_R009YNNNN_partial_29_0211,
  rs_R009_ueqv_R009YNNNN_partial_29_0212,
  rs_R009_ueqv_R009YNNNN_partial_29_0213,
  rs_R009_ueqv_R009YNNNN_partial_29_0214,
  rs_R009_ueqv_R009YNNNN_partial_29_0215,
  rs_R009_ueqv_R009YNNNN_partial_29_0216,
  rs_R009_ueqv_R009YNNNN_partial_29_0217,
  rs_R009_ueqv_R009YNNNN_partial_29_0218,
  rs_R009_ueqv_R009YNNNN_partial_29_0219,
  rs_R009_ueqv_R009YNNNN_partial_29_0220,
  rs_R009_ueqv_R009YNNNN_partial_29_0221,
  rs_R009_ueqv_R009YNNNN_partial_29_0222
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009YNNNN_block_29_0200_0222 : Poly :=
[
  term ((-55 : Rat) / 126) [(0, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-898169651916097 : Rat) / 1450535630922) [(0, 1), (11, 1), (14, 1), (15, 1)],
  term ((-130 : Rat) / 63) [(0, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-21403581828591356 : Rat) / 6527410339149) [(0, 1), (11, 1), (14, 2), (15, 1)],
  term ((184 : Rat) / 7) [(0, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(0, 1), (11, 1), (14, 3), (15, 1)],
  term ((-17857901427447863 : Rat) / 26109641356596) [(0, 1), (11, 2), (14, 1)],
  term ((-313530330473821 : Rat) / 110167263108) [(0, 1), (11, 2), (14, 2)],
  term ((-236652452977240031 : Rat) / 156657848139576) [(0, 1), (13, 1), (14, 1), (15, 1)],
  term ((21347 : Rat) / 252) [(0, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-92772606908565587 : Rat) / 39164462034894) [(0, 1), (13, 1), (14, 2), (15, 1)],
  term ((22 : Rat) / 9) [(0, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(0, 1), (13, 1), (14, 3), (15, 1)],
  term ((941242657 : Rat) / 166541592) [(0, 1), (13, 2), (14, 1)],
  term ((725 : Rat) / 84) [(0, 1), (13, 2), (14, 1), (16, 1)],
  term ((2224986028928059 : Rat) / 1598549470812) [(0, 1), (13, 2), (14, 2)],
  term ((-1495 : Rat) / 126) [(0, 1), (13, 2), (14, 2), (16, 1)],
  term ((120171034974832405 : Rat) / 52219282713192) [(0, 1), (14, 1), (15, 2)],
  term ((-665 : Rat) / 9) [(0, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1806474784011811 : Rat) / 17406427571064) [(0, 1), (14, 2)],
  term ((20701903724251436 : Rat) / 6527410339149) [(0, 1), (14, 2), (15, 2)],
  term ((64 : Rat) / 9) [(0, 1), (14, 2), (15, 2), (16, 1)],
  term ((-788358524112601 : Rat) / 1934047507896) [(0, 1), (14, 3)],
  term ((55 : Rat) / 252) [(0, 2), (11, 1), (13, 1), (16, 1)],
  term ((10701790914295678 : Rat) / 6527410339149) [(0, 2), (11, 1), (14, 1), (15, 1)],
  term ((-92 : Rat) / 7) [(0, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((1532199782809 : Rat) / 26861770943) [(0, 2), (11, 1), (14, 2), (15, 1)],
  term ((898169651916097 : Rat) / 2901071261844) [(0, 2), (11, 1), (15, 1)],
  term ((65 : Rat) / 63) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((17857901427447863 : Rat) / 52219282713192) [(0, 2), (11, 2)],
  term ((313530330473821 : Rat) / 220334526216) [(0, 2), (11, 2), (14, 1)],
  term ((92772606908565587 : Rat) / 78328924069788) [(0, 2), (13, 1), (14, 1), (15, 1)],
  term ((-11 : Rat) / 9) [(0, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1532199782809 : Rat) / 26861770943) [(0, 2), (13, 1), (14, 2), (15, 1)],
  term ((236652452977240031 : Rat) / 313315696279152) [(0, 2), (13, 1), (15, 1)],
  term ((-21347 : Rat) / 504) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((-941242657 : Rat) / 333083184) [(0, 2), (13, 2)],
  term ((-2224986028928059 : Rat) / 3197098941624) [(0, 2), (13, 2), (14, 1)],
  term ((1495 : Rat) / 252) [(0, 2), (13, 2), (14, 1), (16, 1)],
  term ((-725 : Rat) / 168) [(0, 2), (13, 2), (16, 1)],
  term ((1806474784011811 : Rat) / 34812855142128) [(0, 2), (14, 1)],
  term ((-10350951862125718 : Rat) / 6527410339149) [(0, 2), (14, 1), (15, 2)],
  term ((-32 : Rat) / 9) [(0, 2), (14, 1), (15, 2), (16, 1)],
  term ((788358524112601 : Rat) / 3868095015792) [(0, 2), (14, 2)],
  term ((-120171034974832405 : Rat) / 104438565426384) [(0, 2), (15, 2)],
  term ((665 : Rat) / 18) [(0, 2), (15, 2), (16, 1)],
  term ((-55 : Rat) / 126) [(1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-21403581828591356 : Rat) / 6527410339149) [(1, 1), (11, 1), (14, 1), (15, 2)],
  term ((184 : Rat) / 7) [(1, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(1, 1), (11, 1), (14, 2), (15, 2)],
  term ((-898169651916097 : Rat) / 1450535630922) [(1, 1), (11, 1), (15, 2)],
  term ((-130 : Rat) / 63) [(1, 1), (11, 1), (15, 2), (16, 1)],
  term ((-313530330473821 : Rat) / 110167263108) [(1, 1), (11, 2), (14, 1), (15, 1)],
  term ((-17857901427447863 : Rat) / 26109641356596) [(1, 1), (11, 2), (15, 1)],
  term ((-92772606908565587 : Rat) / 39164462034894) [(1, 1), (13, 1), (14, 1), (15, 2)],
  term ((22 : Rat) / 9) [(1, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(1, 1), (13, 1), (14, 2), (15, 2)],
  term ((-236652452977240031 : Rat) / 156657848139576) [(1, 1), (13, 1), (15, 2)],
  term ((21347 : Rat) / 252) [(1, 1), (13, 1), (15, 2), (16, 1)],
  term ((2224986028928059 : Rat) / 1598549470812) [(1, 1), (13, 2), (14, 1), (15, 1)],
  term ((-1495 : Rat) / 126) [(1, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((941242657 : Rat) / 166541592) [(1, 1), (13, 2), (15, 1)],
  term ((725 : Rat) / 84) [(1, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1806474784011811 : Rat) / 17406427571064) [(1, 1), (14, 1), (15, 1)],
  term ((20701903724251436 : Rat) / 6527410339149) [(1, 1), (14, 1), (15, 3)],
  term ((64 : Rat) / 9) [(1, 1), (14, 1), (15, 3), (16, 1)],
  term ((-788358524112601 : Rat) / 1934047507896) [(1, 1), (14, 2), (15, 1)],
  term ((120171034974832405 : Rat) / 52219282713192) [(1, 1), (15, 3)],
  term ((-665 : Rat) / 9) [(1, 1), (15, 3), (16, 1)],
  term ((55 : Rat) / 252) [(1, 2), (11, 1), (13, 1), (16, 1)],
  term ((10701790914295678 : Rat) / 6527410339149) [(1, 2), (11, 1), (14, 1), (15, 1)],
  term ((-92 : Rat) / 7) [(1, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((1532199782809 : Rat) / 26861770943) [(1, 2), (11, 1), (14, 2), (15, 1)],
  term ((898169651916097 : Rat) / 2901071261844) [(1, 2), (11, 1), (15, 1)],
  term ((65 : Rat) / 63) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((17857901427447863 : Rat) / 52219282713192) [(1, 2), (11, 2)],
  term ((313530330473821 : Rat) / 220334526216) [(1, 2), (11, 2), (14, 1)],
  term ((92772606908565587 : Rat) / 78328924069788) [(1, 2), (13, 1), (14, 1), (15, 1)],
  term ((-11 : Rat) / 9) [(1, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1532199782809 : Rat) / 26861770943) [(1, 2), (13, 1), (14, 2), (15, 1)],
  term ((236652452977240031 : Rat) / 313315696279152) [(1, 2), (13, 1), (15, 1)],
  term ((-21347 : Rat) / 504) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((-941242657 : Rat) / 333083184) [(1, 2), (13, 2)],
  term ((-2224986028928059 : Rat) / 3197098941624) [(1, 2), (13, 2), (14, 1)],
  term ((1495 : Rat) / 252) [(1, 2), (13, 2), (14, 1), (16, 1)],
  term ((-725 : Rat) / 168) [(1, 2), (13, 2), (16, 1)],
  term ((1806474784011811 : Rat) / 34812855142128) [(1, 2), (14, 1)],
  term ((-10350951862125718 : Rat) / 6527410339149) [(1, 2), (14, 1), (15, 2)],
  term ((-32 : Rat) / 9) [(1, 2), (14, 1), (15, 2), (16, 1)],
  term ((788358524112601 : Rat) / 3868095015792) [(1, 2), (14, 2)],
  term ((-120171034974832405 : Rat) / 104438565426384) [(1, 2), (15, 2)],
  term ((665 : Rat) / 18) [(1, 2), (15, 2), (16, 1)],
  term ((55 : Rat) / 126) [(2, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((898169651916097 : Rat) / 1450535630922) [(2, 1), (11, 1), (14, 1), (15, 1)],
  term ((130 : Rat) / 63) [(2, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((21403581828591356 : Rat) / 6527410339149) [(2, 1), (11, 1), (14, 2), (15, 1)],
  term ((-184 : Rat) / 7) [(2, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(2, 1), (11, 1), (14, 3), (15, 1)],
  term ((17857901427447863 : Rat) / 26109641356596) [(2, 1), (11, 2), (14, 1)],
  term ((313530330473821 : Rat) / 110167263108) [(2, 1), (11, 2), (14, 2)],
  term ((236652452977240031 : Rat) / 156657848139576) [(2, 1), (13, 1), (14, 1), (15, 1)],
  term ((-21347 : Rat) / 252) [(2, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((92772606908565587 : Rat) / 39164462034894) [(2, 1), (13, 1), (14, 2), (15, 1)],
  term ((-22 : Rat) / 9) [(2, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(2, 1), (13, 1), (14, 3), (15, 1)],
  term ((-941242657 : Rat) / 166541592) [(2, 1), (13, 2), (14, 1)],
  term ((-725 : Rat) / 84) [(2, 1), (13, 2), (14, 1), (16, 1)],
  term ((-2224986028928059 : Rat) / 1598549470812) [(2, 1), (13, 2), (14, 2)],
  term ((1495 : Rat) / 126) [(2, 1), (13, 2), (14, 2), (16, 1)],
  term ((-120171034974832405 : Rat) / 52219282713192) [(2, 1), (14, 1), (15, 2)],
  term ((665 : Rat) / 9) [(2, 1), (14, 1), (15, 2), (16, 1)],
  term ((1806474784011811 : Rat) / 17406427571064) [(2, 1), (14, 2)],
  term ((-20701903724251436 : Rat) / 6527410339149) [(2, 1), (14, 2), (15, 2)],
  term ((-64 : Rat) / 9) [(2, 1), (14, 2), (15, 2), (16, 1)],
  term ((788358524112601 : Rat) / 1934047507896) [(2, 1), (14, 3)],
  term ((-55 : Rat) / 252) [(2, 2), (11, 1), (13, 1), (16, 1)],
  term ((-10701790914295678 : Rat) / 6527410339149) [(2, 2), (11, 1), (14, 1), (15, 1)],
  term ((92 : Rat) / 7) [(2, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1532199782809 : Rat) / 26861770943) [(2, 2), (11, 1), (14, 2), (15, 1)],
  term ((-898169651916097 : Rat) / 2901071261844) [(2, 2), (11, 1), (15, 1)],
  term ((-65 : Rat) / 63) [(2, 2), (11, 1), (15, 1), (16, 1)],
  term ((-17857901427447863 : Rat) / 52219282713192) [(2, 2), (11, 2)],
  term ((-313530330473821 : Rat) / 220334526216) [(2, 2), (11, 2), (14, 1)],
  term ((-92772606908565587 : Rat) / 78328924069788) [(2, 2), (13, 1), (14, 1), (15, 1)],
  term ((11 : Rat) / 9) [(2, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1532199782809 : Rat) / 26861770943) [(2, 2), (13, 1), (14, 2), (15, 1)],
  term ((-236652452977240031 : Rat) / 313315696279152) [(2, 2), (13, 1), (15, 1)],
  term ((21347 : Rat) / 504) [(2, 2), (13, 1), (15, 1), (16, 1)],
  term ((941242657 : Rat) / 333083184) [(2, 2), (13, 2)],
  term ((2224986028928059 : Rat) / 3197098941624) [(2, 2), (13, 2), (14, 1)],
  term ((-1495 : Rat) / 252) [(2, 2), (13, 2), (14, 1), (16, 1)],
  term ((725 : Rat) / 168) [(2, 2), (13, 2), (16, 1)],
  term ((-1806474784011811 : Rat) / 34812855142128) [(2, 2), (14, 1)],
  term ((10350951862125718 : Rat) / 6527410339149) [(2, 2), (14, 1), (15, 2)],
  term ((32 : Rat) / 9) [(2, 2), (14, 1), (15, 2), (16, 1)],
  term ((-788358524112601 : Rat) / 3868095015792) [(2, 2), (14, 2)],
  term ((120171034974832405 : Rat) / 104438565426384) [(2, 2), (15, 2)],
  term ((-665 : Rat) / 18) [(2, 2), (15, 2), (16, 1)],
  term ((55 : Rat) / 126) [(3, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((21403581828591356 : Rat) / 6527410339149) [(3, 1), (11, 1), (14, 1), (15, 2)],
  term ((-184 : Rat) / 7) [(3, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(3, 1), (11, 1), (14, 2), (15, 2)],
  term ((898169651916097 : Rat) / 1450535630922) [(3, 1), (11, 1), (15, 2)],
  term ((130 : Rat) / 63) [(3, 1), (11, 1), (15, 2), (16, 1)],
  term ((313530330473821 : Rat) / 110167263108) [(3, 1), (11, 2), (14, 1), (15, 1)],
  term ((17857901427447863 : Rat) / 26109641356596) [(3, 1), (11, 2), (15, 1)],
  term ((92772606908565587 : Rat) / 39164462034894) [(3, 1), (13, 1), (14, 1), (15, 2)],
  term ((-22 : Rat) / 9) [(3, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(3, 1), (13, 1), (14, 2), (15, 2)],
  term ((236652452977240031 : Rat) / 156657848139576) [(3, 1), (13, 1), (15, 2)],
  term ((-21347 : Rat) / 252) [(3, 1), (13, 1), (15, 2), (16, 1)],
  term ((-2224986028928059 : Rat) / 1598549470812) [(3, 1), (13, 2), (14, 1), (15, 1)],
  term ((1495 : Rat) / 126) [(3, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-941242657 : Rat) / 166541592) [(3, 1), (13, 2), (15, 1)],
  term ((-725 : Rat) / 84) [(3, 1), (13, 2), (15, 1), (16, 1)],
  term ((1806474784011811 : Rat) / 17406427571064) [(3, 1), (14, 1), (15, 1)],
  term ((-20701903724251436 : Rat) / 6527410339149) [(3, 1), (14, 1), (15, 3)],
  term ((-64 : Rat) / 9) [(3, 1), (14, 1), (15, 3), (16, 1)],
  term ((788358524112601 : Rat) / 1934047507896) [(3, 1), (14, 2), (15, 1)],
  term ((-120171034974832405 : Rat) / 52219282713192) [(3, 1), (15, 3)],
  term ((665 : Rat) / 9) [(3, 1), (15, 3), (16, 1)],
  term ((-55 : Rat) / 252) [(3, 2), (11, 1), (13, 1), (16, 1)],
  term ((-10701790914295678 : Rat) / 6527410339149) [(3, 2), (11, 1), (14, 1), (15, 1)],
  term ((92 : Rat) / 7) [(3, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1532199782809 : Rat) / 26861770943) [(3, 2), (11, 1), (14, 2), (15, 1)],
  term ((-898169651916097 : Rat) / 2901071261844) [(3, 2), (11, 1), (15, 1)],
  term ((-65 : Rat) / 63) [(3, 2), (11, 1), (15, 1), (16, 1)],
  term ((-17857901427447863 : Rat) / 52219282713192) [(3, 2), (11, 2)],
  term ((-313530330473821 : Rat) / 220334526216) [(3, 2), (11, 2), (14, 1)],
  term ((-92772606908565587 : Rat) / 78328924069788) [(3, 2), (13, 1), (14, 1), (15, 1)],
  term ((11 : Rat) / 9) [(3, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1532199782809 : Rat) / 26861770943) [(3, 2), (13, 1), (14, 2), (15, 1)],
  term ((-236652452977240031 : Rat) / 313315696279152) [(3, 2), (13, 1), (15, 1)],
  term ((21347 : Rat) / 504) [(3, 2), (13, 1), (15, 1), (16, 1)],
  term ((941242657 : Rat) / 333083184) [(3, 2), (13, 2)],
  term ((2224986028928059 : Rat) / 3197098941624) [(3, 2), (13, 2), (14, 1)],
  term ((-1495 : Rat) / 252) [(3, 2), (13, 2), (14, 1), (16, 1)],
  term ((725 : Rat) / 168) [(3, 2), (13, 2), (16, 1)],
  term ((-1806474784011811 : Rat) / 34812855142128) [(3, 2), (14, 1)],
  term ((10350951862125718 : Rat) / 6527410339149) [(3, 2), (14, 1), (15, 2)],
  term ((32 : Rat) / 9) [(3, 2), (14, 1), (15, 2), (16, 1)],
  term ((-788358524112601 : Rat) / 3868095015792) [(3, 2), (14, 2)],
  term ((120171034974832405 : Rat) / 104438565426384) [(3, 2), (15, 2)],
  term ((-665 : Rat) / 18) [(3, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 29, terms 200 through 222. -/
theorem rs_R009_ueqv_R009YNNNN_block_29_0200_0222_valid :
    checkProductSumEq rs_R009_ueqv_R009YNNNN_partials_29_0200_0222
      rs_R009_ueqv_R009YNNNN_block_29_0200_0222 = true := by
  native_decide

end R009UeqvR009YNNNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
