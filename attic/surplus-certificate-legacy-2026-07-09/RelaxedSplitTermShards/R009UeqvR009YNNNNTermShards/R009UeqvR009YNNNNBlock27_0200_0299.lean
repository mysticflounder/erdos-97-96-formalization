/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009YNNNN, term block 27:200-299

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009YNNNNTermShards

/-- Generator polynomial 27 for relaxed split surplus certificate `R009:u=v:R009YNNNN`. -/
def rs_R009_ueqv_R009YNNNN_generator_27_0200_0299 : Poly :=
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

/-- Coefficient term 200 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0200 : Poly :=
[
  term ((-1532199782809 : Rat) / 26861770943) [(2, 1), (3, 1), (14, 1), (15, 1)]
]

/-- Partial product 200 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0200 : Poly :=
[
  term ((3064399565618 : Rat) / 26861770943) [(0, 1), (2, 1), (3, 1), (12, 1), (14, 1), (15, 1)],
  term ((-1532199782809 : Rat) / 26861770943) [(0, 2), (2, 1), (3, 1), (14, 1), (15, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(1, 1), (2, 1), (3, 1), (13, 1), (14, 1), (15, 1)],
  term ((-1532199782809 : Rat) / 26861770943) [(1, 2), (2, 1), (3, 1), (14, 1), (15, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(2, 1), (3, 1), (12, 1), (14, 2), (15, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(2, 1), (3, 1), (13, 1), (14, 1), (15, 2)],
  term ((1532199782809 : Rat) / 26861770943) [(2, 1), (3, 1), (14, 1), (15, 3)],
  term ((1532199782809 : Rat) / 26861770943) [(2, 1), (3, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 200 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0200_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0200
        rs_R009_ueqv_R009YNNNN_generator_27_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_27_0200 := by
  native_decide

/-- Coefficient term 201 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0201 : Poly :=
[
  term ((-231195579038557549 : Rat) / 78328924069788) [(2, 1), (3, 1), (15, 1)]
]

/-- Partial product 201 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0201 : Poly :=
[
  term ((231195579038557549 : Rat) / 39164462034894) [(0, 1), (2, 1), (3, 1), (12, 1), (15, 1)],
  term ((-231195579038557549 : Rat) / 78328924069788) [(0, 2), (2, 1), (3, 1), (15, 1)],
  term ((231195579038557549 : Rat) / 39164462034894) [(1, 1), (2, 1), (3, 1), (13, 1), (15, 1)],
  term ((-231195579038557549 : Rat) / 78328924069788) [(1, 2), (2, 1), (3, 1), (15, 1)],
  term ((-231195579038557549 : Rat) / 39164462034894) [(2, 1), (3, 1), (12, 1), (14, 1), (15, 1)],
  term ((-231195579038557549 : Rat) / 39164462034894) [(2, 1), (3, 1), (13, 1), (15, 2)],
  term ((231195579038557549 : Rat) / 78328924069788) [(2, 1), (3, 1), (14, 2), (15, 1)],
  term ((231195579038557549 : Rat) / 78328924069788) [(2, 1), (3, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 201 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0201_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0201
        rs_R009_ueqv_R009YNNNN_generator_27_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_27_0201 := by
  native_decide

/-- Coefficient term 202 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0202 : Poly :=
[
  term ((1943 : Rat) / 63) [(2, 1), (3, 1), (15, 1), (16, 1)]
]

/-- Partial product 202 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0202 : Poly :=
[
  term ((-3886 : Rat) / 63) [(0, 1), (2, 1), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((1943 : Rat) / 63) [(0, 2), (2, 1), (3, 1), (15, 1), (16, 1)],
  term ((-3886 : Rat) / 63) [(1, 1), (2, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term ((1943 : Rat) / 63) [(1, 2), (2, 1), (3, 1), (15, 1), (16, 1)],
  term ((3886 : Rat) / 63) [(2, 1), (3, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((3886 : Rat) / 63) [(2, 1), (3, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1943 : Rat) / 63) [(2, 1), (3, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1943 : Rat) / 63) [(2, 1), (3, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 202 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0202_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0202
        rs_R009_ueqv_R009YNNNN_generator_27_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_27_0202 := by
  native_decide

/-- Coefficient term 203 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0203 : Poly :=
[
  term ((21929444827088455 : Rat) / 19582231017447) [(2, 1), (3, 2)]
]

/-- Partial product 203 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0203 : Poly :=
[
  term ((-43858889654176910 : Rat) / 19582231017447) [(0, 1), (2, 1), (3, 2), (12, 1)],
  term ((21929444827088455 : Rat) / 19582231017447) [(0, 2), (2, 1), (3, 2)],
  term ((-43858889654176910 : Rat) / 19582231017447) [(1, 1), (2, 1), (3, 2), (13, 1)],
  term ((21929444827088455 : Rat) / 19582231017447) [(1, 2), (2, 1), (3, 2)],
  term ((43858889654176910 : Rat) / 19582231017447) [(2, 1), (3, 2), (12, 1), (14, 1)],
  term ((43858889654176910 : Rat) / 19582231017447) [(2, 1), (3, 2), (13, 1), (15, 1)],
  term ((-21929444827088455 : Rat) / 19582231017447) [(2, 1), (3, 2), (14, 2)],
  term ((-21929444827088455 : Rat) / 19582231017447) [(2, 1), (3, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 203 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0203_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0203
        rs_R009_ueqv_R009YNNNN_generator_27_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_27_0203 := by
  native_decide

/-- Coefficient term 204 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0204 : Poly :=
[
  term ((-2576683275007571 : Rat) / 2901071261844) [(2, 1), (6, 1)]
]

/-- Partial product 204 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0204 : Poly :=
[
  term ((2576683275007571 : Rat) / 1450535630922) [(0, 1), (2, 1), (6, 1), (12, 1)],
  term ((-2576683275007571 : Rat) / 2901071261844) [(0, 2), (2, 1), (6, 1)],
  term ((2576683275007571 : Rat) / 1450535630922) [(1, 1), (2, 1), (6, 1), (13, 1)],
  term ((-2576683275007571 : Rat) / 2901071261844) [(1, 2), (2, 1), (6, 1)],
  term ((-2576683275007571 : Rat) / 1450535630922) [(2, 1), (6, 1), (12, 1), (14, 1)],
  term ((-2576683275007571 : Rat) / 1450535630922) [(2, 1), (6, 1), (13, 1), (15, 1)],
  term ((2576683275007571 : Rat) / 2901071261844) [(2, 1), (6, 1), (14, 2)],
  term ((2576683275007571 : Rat) / 2901071261844) [(2, 1), (6, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 204 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0204_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0204
        rs_R009_ueqv_R009YNNNN_generator_27_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_27_0204 := by
  native_decide

/-- Coefficient term 205 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0205 : Poly :=
[
  term ((2488871127710291 : Rat) / 5802142523688) [(2, 1), (6, 1), (14, 1)]
]

/-- Partial product 205 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0205 : Poly :=
[
  term ((-2488871127710291 : Rat) / 2901071261844) [(0, 1), (2, 1), (6, 1), (12, 1), (14, 1)],
  term ((2488871127710291 : Rat) / 5802142523688) [(0, 2), (2, 1), (6, 1), (14, 1)],
  term ((-2488871127710291 : Rat) / 2901071261844) [(1, 1), (2, 1), (6, 1), (13, 1), (14, 1)],
  term ((2488871127710291 : Rat) / 5802142523688) [(1, 2), (2, 1), (6, 1), (14, 1)],
  term ((2488871127710291 : Rat) / 2901071261844) [(2, 1), (6, 1), (12, 1), (14, 2)],
  term ((2488871127710291 : Rat) / 2901071261844) [(2, 1), (6, 1), (13, 1), (14, 1), (15, 1)],
  term ((-2488871127710291 : Rat) / 5802142523688) [(2, 1), (6, 1), (14, 1), (15, 2)],
  term ((-2488871127710291 : Rat) / 5802142523688) [(2, 1), (6, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 205 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0205_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0205
        rs_R009_ueqv_R009YNNNN_generator_27_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_27_0205 := by
  native_decide

/-- Coefficient term 206 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0206 : Poly :=
[
  term ((69282374274035 : Rat) / 80939213712) [(2, 1), (7, 1), (9, 1)]
]

/-- Partial product 206 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0206 : Poly :=
[
  term ((-69282374274035 : Rat) / 40469606856) [(0, 1), (2, 1), (7, 1), (9, 1), (12, 1)],
  term ((69282374274035 : Rat) / 80939213712) [(0, 2), (2, 1), (7, 1), (9, 1)],
  term ((-69282374274035 : Rat) / 40469606856) [(1, 1), (2, 1), (7, 1), (9, 1), (13, 1)],
  term ((69282374274035 : Rat) / 80939213712) [(1, 2), (2, 1), (7, 1), (9, 1)],
  term ((69282374274035 : Rat) / 40469606856) [(2, 1), (7, 1), (9, 1), (12, 1), (14, 1)],
  term ((69282374274035 : Rat) / 40469606856) [(2, 1), (7, 1), (9, 1), (13, 1), (15, 1)],
  term ((-69282374274035 : Rat) / 80939213712) [(2, 1), (7, 1), (9, 1), (14, 2)],
  term ((-69282374274035 : Rat) / 80939213712) [(2, 1), (7, 1), (9, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 206 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0206_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0206
        rs_R009_ueqv_R009YNNNN_generator_27_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_27_0206 := by
  native_decide

/-- Coefficient term 207 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0207 : Poly :=
[
  term ((-1454632118436379 : Rat) / 2901071261844) [(2, 1), (7, 1), (11, 1)]
]

/-- Partial product 207 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0207 : Poly :=
[
  term ((1454632118436379 : Rat) / 1450535630922) [(0, 1), (2, 1), (7, 1), (11, 1), (12, 1)],
  term ((-1454632118436379 : Rat) / 2901071261844) [(0, 2), (2, 1), (7, 1), (11, 1)],
  term ((1454632118436379 : Rat) / 1450535630922) [(1, 1), (2, 1), (7, 1), (11, 1), (13, 1)],
  term ((-1454632118436379 : Rat) / 2901071261844) [(1, 2), (2, 1), (7, 1), (11, 1)],
  term ((-1454632118436379 : Rat) / 1450535630922) [(2, 1), (7, 1), (11, 1), (12, 1), (14, 1)],
  term ((-1454632118436379 : Rat) / 1450535630922) [(2, 1), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((1454632118436379 : Rat) / 2901071261844) [(2, 1), (7, 1), (11, 1), (14, 2)],
  term ((1454632118436379 : Rat) / 2901071261844) [(2, 1), (7, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 207 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0207_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0207
        rs_R009_ueqv_R009YNNNN_generator_27_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_27_0207 := by
  native_decide

/-- Coefficient term 208 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0208 : Poly :=
[
  term ((-2796461151655097 : Rat) / 3197098941624) [(2, 1), (7, 1), (13, 1)]
]

/-- Partial product 208 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0208 : Poly :=
[
  term ((2796461151655097 : Rat) / 1598549470812) [(0, 1), (2, 1), (7, 1), (12, 1), (13, 1)],
  term ((-2796461151655097 : Rat) / 3197098941624) [(0, 2), (2, 1), (7, 1), (13, 1)],
  term ((2796461151655097 : Rat) / 1598549470812) [(1, 1), (2, 1), (7, 1), (13, 2)],
  term ((-2796461151655097 : Rat) / 3197098941624) [(1, 2), (2, 1), (7, 1), (13, 1)],
  term ((-2796461151655097 : Rat) / 1598549470812) [(2, 1), (7, 1), (12, 1), (13, 1), (14, 1)],
  term ((2796461151655097 : Rat) / 3197098941624) [(2, 1), (7, 1), (13, 1), (14, 2)],
  term ((2796461151655097 : Rat) / 3197098941624) [(2, 1), (7, 1), (13, 1), (15, 2)],
  term ((-2796461151655097 : Rat) / 1598549470812) [(2, 1), (7, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 208 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0208_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0208
        rs_R009_ueqv_R009YNNNN_generator_27_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_27_0208 := by
  native_decide

/-- Coefficient term 209 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0209 : Poly :=
[
  term ((8525 : Rat) / 252) [(2, 1), (7, 1), (13, 1), (16, 1)]
]

/-- Partial product 209 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0209 : Poly :=
[
  term ((-8525 : Rat) / 126) [(0, 1), (2, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((8525 : Rat) / 252) [(0, 2), (2, 1), (7, 1), (13, 1), (16, 1)],
  term ((-8525 : Rat) / 126) [(1, 1), (2, 1), (7, 1), (13, 2), (16, 1)],
  term ((8525 : Rat) / 252) [(1, 2), (2, 1), (7, 1), (13, 1), (16, 1)],
  term ((8525 : Rat) / 126) [(2, 1), (7, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-8525 : Rat) / 252) [(2, 1), (7, 1), (13, 1), (14, 2), (16, 1)],
  term ((-8525 : Rat) / 252) [(2, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((8525 : Rat) / 126) [(2, 1), (7, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 209 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0209_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0209
        rs_R009_ueqv_R009YNNNN_generator_27_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_27_0209 := by
  native_decide

/-- Coefficient term 210 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0210 : Poly :=
[
  term ((67697594944644565 : Rat) / 26109641356596) [(2, 1), (7, 1), (15, 1)]
]

/-- Partial product 210 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0210 : Poly :=
[
  term ((-67697594944644565 : Rat) / 13054820678298) [(0, 1), (2, 1), (7, 1), (12, 1), (15, 1)],
  term ((67697594944644565 : Rat) / 26109641356596) [(0, 2), (2, 1), (7, 1), (15, 1)],
  term ((-67697594944644565 : Rat) / 13054820678298) [(1, 1), (2, 1), (7, 1), (13, 1), (15, 1)],
  term ((67697594944644565 : Rat) / 26109641356596) [(1, 2), (2, 1), (7, 1), (15, 1)],
  term ((67697594944644565 : Rat) / 13054820678298) [(2, 1), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((67697594944644565 : Rat) / 13054820678298) [(2, 1), (7, 1), (13, 1), (15, 2)],
  term ((-67697594944644565 : Rat) / 26109641356596) [(2, 1), (7, 1), (14, 2), (15, 1)],
  term ((-67697594944644565 : Rat) / 26109641356596) [(2, 1), (7, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 210 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0210_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0210
        rs_R009_ueqv_R009YNNNN_generator_27_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_27_0210 := by
  native_decide

/-- Coefficient term 211 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0211 : Poly :=
[
  term ((-1733 : Rat) / 63) [(2, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 211 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0211 : Poly :=
[
  term ((3466 : Rat) / 63) [(0, 1), (2, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1733 : Rat) / 63) [(0, 2), (2, 1), (7, 1), (15, 1), (16, 1)],
  term ((3466 : Rat) / 63) [(1, 1), (2, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1733 : Rat) / 63) [(1, 2), (2, 1), (7, 1), (15, 1), (16, 1)],
  term ((-3466 : Rat) / 63) [(2, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3466 : Rat) / 63) [(2, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((1733 : Rat) / 63) [(2, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((1733 : Rat) / 63) [(2, 1), (7, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 211 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0211_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0211
        rs_R009_ueqv_R009YNNNN_generator_27_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_27_0211 := by
  native_decide

/-- Coefficient term 212 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0212 : Poly :=
[
  term ((16224463500164501 : Rat) / 26109641356596) [(2, 1), (7, 2)]
]

/-- Partial product 212 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0212 : Poly :=
[
  term ((-16224463500164501 : Rat) / 13054820678298) [(0, 1), (2, 1), (7, 2), (12, 1)],
  term ((16224463500164501 : Rat) / 26109641356596) [(0, 2), (2, 1), (7, 2)],
  term ((-16224463500164501 : Rat) / 13054820678298) [(1, 1), (2, 1), (7, 2), (13, 1)],
  term ((16224463500164501 : Rat) / 26109641356596) [(1, 2), (2, 1), (7, 2)],
  term ((16224463500164501 : Rat) / 13054820678298) [(2, 1), (7, 2), (12, 1), (14, 1)],
  term ((16224463500164501 : Rat) / 13054820678298) [(2, 1), (7, 2), (13, 1), (15, 1)],
  term ((-16224463500164501 : Rat) / 26109641356596) [(2, 1), (7, 2), (14, 2)],
  term ((-16224463500164501 : Rat) / 26109641356596) [(2, 1), (7, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 212 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0212_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0212
        rs_R009_ueqv_R009YNNNN_generator_27_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_27_0212 := by
  native_decide

/-- Coefficient term 213 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0213 : Poly :=
[
  term ((-67275259872743 : Rat) / 323756854848) [(2, 1), (9, 1), (11, 1)]
]

/-- Partial product 213 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0213 : Poly :=
[
  term ((67275259872743 : Rat) / 161878427424) [(0, 1), (2, 1), (9, 1), (11, 1), (12, 1)],
  term ((-67275259872743 : Rat) / 323756854848) [(0, 2), (2, 1), (9, 1), (11, 1)],
  term ((67275259872743 : Rat) / 161878427424) [(1, 1), (2, 1), (9, 1), (11, 1), (13, 1)],
  term ((-67275259872743 : Rat) / 323756854848) [(1, 2), (2, 1), (9, 1), (11, 1)],
  term ((-67275259872743 : Rat) / 161878427424) [(2, 1), (9, 1), (11, 1), (12, 1), (14, 1)],
  term ((-67275259872743 : Rat) / 161878427424) [(2, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((67275259872743 : Rat) / 323756854848) [(2, 1), (9, 1), (11, 1), (14, 2)],
  term ((67275259872743 : Rat) / 323756854848) [(2, 1), (9, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 213 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0213_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0213
        rs_R009_ueqv_R009YNNNN_generator_27_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_27_0213 := by
  native_decide

/-- Coefficient term 214 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0214 : Poly :=
[
  term ((581604841809017 : Rat) / 323756854848) [(2, 1), (9, 1), (15, 1)]
]

/-- Partial product 214 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0214 : Poly :=
[
  term ((-581604841809017 : Rat) / 161878427424) [(0, 1), (2, 1), (9, 1), (12, 1), (15, 1)],
  term ((581604841809017 : Rat) / 323756854848) [(0, 2), (2, 1), (9, 1), (15, 1)],
  term ((-581604841809017 : Rat) / 161878427424) [(1, 1), (2, 1), (9, 1), (13, 1), (15, 1)],
  term ((581604841809017 : Rat) / 323756854848) [(1, 2), (2, 1), (9, 1), (15, 1)],
  term ((581604841809017 : Rat) / 161878427424) [(2, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((581604841809017 : Rat) / 161878427424) [(2, 1), (9, 1), (13, 1), (15, 2)],
  term ((-581604841809017 : Rat) / 323756854848) [(2, 1), (9, 1), (14, 2), (15, 1)],
  term ((-581604841809017 : Rat) / 323756854848) [(2, 1), (9, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 214 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0214_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0214
        rs_R009_ueqv_R009YNNNN_generator_27_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_27_0214 := by
  native_decide

/-- Coefficient term 215 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0215 : Poly :=
[
  term ((395910373848515 : Rat) / 8703213785532) [(2, 1), (10, 1)]
]

/-- Partial product 215 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0215 : Poly :=
[
  term ((-395910373848515 : Rat) / 4351606892766) [(0, 1), (2, 1), (10, 1), (12, 1)],
  term ((395910373848515 : Rat) / 8703213785532) [(0, 2), (2, 1), (10, 1)],
  term ((-395910373848515 : Rat) / 4351606892766) [(1, 1), (2, 1), (10, 1), (13, 1)],
  term ((395910373848515 : Rat) / 8703213785532) [(1, 2), (2, 1), (10, 1)],
  term ((395910373848515 : Rat) / 4351606892766) [(2, 1), (10, 1), (12, 1), (14, 1)],
  term ((395910373848515 : Rat) / 4351606892766) [(2, 1), (10, 1), (13, 1), (15, 1)],
  term ((-395910373848515 : Rat) / 8703213785532) [(2, 1), (10, 1), (14, 2)],
  term ((-395910373848515 : Rat) / 8703213785532) [(2, 1), (10, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 215 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0215_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0215
        rs_R009_ueqv_R009YNNNN_generator_27_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_27_0215 := by
  native_decide

/-- Coefficient term 216 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0216 : Poly :=
[
  term ((2972412027096341 : Rat) / 12788395766496) [(2, 1), (11, 1), (13, 1)]
]

/-- Partial product 216 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0216 : Poly :=
[
  term ((-2972412027096341 : Rat) / 6394197883248) [(0, 1), (2, 1), (11, 1), (12, 1), (13, 1)],
  term ((2972412027096341 : Rat) / 12788395766496) [(0, 2), (2, 1), (11, 1), (13, 1)],
  term ((-2972412027096341 : Rat) / 6394197883248) [(1, 1), (2, 1), (11, 1), (13, 2)],
  term ((2972412027096341 : Rat) / 12788395766496) [(1, 2), (2, 1), (11, 1), (13, 1)],
  term ((2972412027096341 : Rat) / 6394197883248) [(2, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-2972412027096341 : Rat) / 12788395766496) [(2, 1), (11, 1), (13, 1), (14, 2)],
  term ((-2972412027096341 : Rat) / 12788395766496) [(2, 1), (11, 1), (13, 1), (15, 2)],
  term ((2972412027096341 : Rat) / 6394197883248) [(2, 1), (11, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 216 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0216_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0216
        rs_R009_ueqv_R009YNNNN_generator_27_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_27_0216 := by
  native_decide

/-- Coefficient term 217 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0217 : Poly :=
[
  term ((-28985 : Rat) / 1008) [(2, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 217 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0217 : Poly :=
[
  term ((28985 : Rat) / 504) [(0, 1), (2, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-28985 : Rat) / 1008) [(0, 2), (2, 1), (11, 1), (13, 1), (16, 1)],
  term ((28985 : Rat) / 504) [(1, 1), (2, 1), (11, 1), (13, 2), (16, 1)],
  term ((-28985 : Rat) / 1008) [(1, 2), (2, 1), (11, 1), (13, 1), (16, 1)],
  term ((-28985 : Rat) / 504) [(2, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((28985 : Rat) / 1008) [(2, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((28985 : Rat) / 1008) [(2, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-28985 : Rat) / 504) [(2, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 217 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0217_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0217
        rs_R009_ueqv_R009YNNNN_generator_27_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_27_0217 := by
  native_decide

/-- Coefficient term 218 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0218 : Poly :=
[
  term ((-19223968449686125 : Rat) / 5802142523688) [(2, 1), (11, 1), (15, 1)]
]

/-- Partial product 218 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0218 : Poly :=
[
  term ((19223968449686125 : Rat) / 2901071261844) [(0, 1), (2, 1), (11, 1), (12, 1), (15, 1)],
  term ((-19223968449686125 : Rat) / 5802142523688) [(0, 2), (2, 1), (11, 1), (15, 1)],
  term ((19223968449686125 : Rat) / 2901071261844) [(1, 1), (2, 1), (11, 1), (13, 1), (15, 1)],
  term ((-19223968449686125 : Rat) / 5802142523688) [(1, 2), (2, 1), (11, 1), (15, 1)],
  term ((-19223968449686125 : Rat) / 2901071261844) [(2, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-19223968449686125 : Rat) / 2901071261844) [(2, 1), (11, 1), (13, 1), (15, 2)],
  term ((19223968449686125 : Rat) / 5802142523688) [(2, 1), (11, 1), (14, 2), (15, 1)],
  term ((19223968449686125 : Rat) / 5802142523688) [(2, 1), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 218 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0218_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0218
        rs_R009_ueqv_R009YNNNN_generator_27_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_27_0218 := by
  native_decide

/-- Coefficient term 219 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0219 : Poly :=
[
  term ((6137 : Rat) / 252) [(2, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 219 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0219 : Poly :=
[
  term ((-6137 : Rat) / 126) [(0, 1), (2, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((6137 : Rat) / 252) [(0, 2), (2, 1), (11, 1), (15, 1), (16, 1)],
  term ((-6137 : Rat) / 126) [(1, 1), (2, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((6137 : Rat) / 252) [(1, 2), (2, 1), (11, 1), (15, 1), (16, 1)],
  term ((6137 : Rat) / 126) [(2, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((6137 : Rat) / 126) [(2, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-6137 : Rat) / 252) [(2, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-6137 : Rat) / 252) [(2, 1), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 219 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0219_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0219
        rs_R009_ueqv_R009YNNNN_generator_27_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_27_0219 := by
  native_decide

/-- Coefficient term 220 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0220 : Poly :=
[
  term ((-51436413354355775 : Rat) / 26109641356596) [(2, 1), (11, 2)]
]

/-- Partial product 220 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0220 : Poly :=
[
  term ((51436413354355775 : Rat) / 13054820678298) [(0, 1), (2, 1), (11, 2), (12, 1)],
  term ((-51436413354355775 : Rat) / 26109641356596) [(0, 2), (2, 1), (11, 2)],
  term ((51436413354355775 : Rat) / 13054820678298) [(1, 1), (2, 1), (11, 2), (13, 1)],
  term ((-51436413354355775 : Rat) / 26109641356596) [(1, 2), (2, 1), (11, 2)],
  term ((-51436413354355775 : Rat) / 13054820678298) [(2, 1), (11, 2), (12, 1), (14, 1)],
  term ((-51436413354355775 : Rat) / 13054820678298) [(2, 1), (11, 2), (13, 1), (15, 1)],
  term ((51436413354355775 : Rat) / 26109641356596) [(2, 1), (11, 2), (14, 2)],
  term ((51436413354355775 : Rat) / 26109641356596) [(2, 1), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 220 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0220_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0220
        rs_R009_ueqv_R009YNNNN_generator_27_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_27_0220 := by
  native_decide

/-- Coefficient term 221 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0221 : Poly :=
[
  term ((-23975823582991883 : Rat) / 12788395766496) [(2, 1), (13, 1), (15, 1)]
]

/-- Partial product 221 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0221 : Poly :=
[
  term ((23975823582991883 : Rat) / 6394197883248) [(0, 1), (2, 1), (12, 1), (13, 1), (15, 1)],
  term ((-23975823582991883 : Rat) / 12788395766496) [(0, 2), (2, 1), (13, 1), (15, 1)],
  term ((23975823582991883 : Rat) / 6394197883248) [(1, 1), (2, 1), (13, 2), (15, 1)],
  term ((-23975823582991883 : Rat) / 12788395766496) [(1, 2), (2, 1), (13, 1), (15, 1)],
  term ((-23975823582991883 : Rat) / 6394197883248) [(2, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((23975823582991883 : Rat) / 12788395766496) [(2, 1), (13, 1), (14, 2), (15, 1)],
  term ((23975823582991883 : Rat) / 12788395766496) [(2, 1), (13, 1), (15, 3)],
  term ((-23975823582991883 : Rat) / 6394197883248) [(2, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 221 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0221_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0221
        rs_R009_ueqv_R009YNNNN_generator_27_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_27_0221 := by
  native_decide

/-- Coefficient term 222 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0222 : Poly :=
[
  term ((28775 : Rat) / 1008) [(2, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 222 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0222 : Poly :=
[
  term ((-28775 : Rat) / 504) [(0, 1), (2, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((28775 : Rat) / 1008) [(0, 2), (2, 1), (13, 1), (15, 1), (16, 1)],
  term ((-28775 : Rat) / 504) [(1, 1), (2, 1), (13, 2), (15, 1), (16, 1)],
  term ((28775 : Rat) / 1008) [(1, 2), (2, 1), (13, 1), (15, 1), (16, 1)],
  term ((28775 : Rat) / 504) [(2, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-28775 : Rat) / 1008) [(2, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-28775 : Rat) / 1008) [(2, 1), (13, 1), (15, 3), (16, 1)],
  term ((28775 : Rat) / 504) [(2, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 222 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0222_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0222
        rs_R009_ueqv_R009YNNNN_generator_27_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_27_0222 := by
  native_decide

/-- Coefficient term 223 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0223 : Poly :=
[
  term ((3866078345790215 : Rat) / 5802142523688) [(2, 1), (14, 1)]
]

/-- Partial product 223 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0223 : Poly :=
[
  term ((-3866078345790215 : Rat) / 2901071261844) [(0, 1), (2, 1), (12, 1), (14, 1)],
  term ((3866078345790215 : Rat) / 5802142523688) [(0, 2), (2, 1), (14, 1)],
  term ((-3866078345790215 : Rat) / 2901071261844) [(1, 1), (2, 1), (13, 1), (14, 1)],
  term ((3866078345790215 : Rat) / 5802142523688) [(1, 2), (2, 1), (14, 1)],
  term ((3866078345790215 : Rat) / 2901071261844) [(2, 1), (12, 1), (14, 2)],
  term ((3866078345790215 : Rat) / 2901071261844) [(2, 1), (13, 1), (14, 1), (15, 1)],
  term ((-3866078345790215 : Rat) / 5802142523688) [(2, 1), (14, 1), (15, 2)],
  term ((-3866078345790215 : Rat) / 5802142523688) [(2, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 223 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0223_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0223
        rs_R009_ueqv_R009YNNNN_generator_27_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_27_0223 := by
  native_decide

/-- Coefficient term 224 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0224 : Poly :=
[
  term ((-10143334851217007 : Rat) / 26109641356596) [(2, 1), (14, 2)]
]

/-- Partial product 224 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0224 : Poly :=
[
  term ((10143334851217007 : Rat) / 13054820678298) [(0, 1), (2, 1), (12, 1), (14, 2)],
  term ((-10143334851217007 : Rat) / 26109641356596) [(0, 2), (2, 1), (14, 2)],
  term ((10143334851217007 : Rat) / 13054820678298) [(1, 1), (2, 1), (13, 1), (14, 2)],
  term ((-10143334851217007 : Rat) / 26109641356596) [(1, 2), (2, 1), (14, 2)],
  term ((-10143334851217007 : Rat) / 13054820678298) [(2, 1), (12, 1), (14, 3)],
  term ((-10143334851217007 : Rat) / 13054820678298) [(2, 1), (13, 1), (14, 2), (15, 1)],
  term ((10143334851217007 : Rat) / 26109641356596) [(2, 1), (14, 2), (15, 2)],
  term ((10143334851217007 : Rat) / 26109641356596) [(2, 1), (14, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 224 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0224_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0224
        rs_R009_ueqv_R009YNNNN_generator_27_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_27_0224 := by
  native_decide

/-- Coefficient term 225 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0225 : Poly :=
[
  term ((54794038719859987 : Rat) / 17406427571064) [(2, 1), (15, 2)]
]

/-- Partial product 225 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0225 : Poly :=
[
  term ((-54794038719859987 : Rat) / 8703213785532) [(0, 1), (2, 1), (12, 1), (15, 2)],
  term ((54794038719859987 : Rat) / 17406427571064) [(0, 2), (2, 1), (15, 2)],
  term ((-54794038719859987 : Rat) / 8703213785532) [(1, 1), (2, 1), (13, 1), (15, 2)],
  term ((54794038719859987 : Rat) / 17406427571064) [(1, 2), (2, 1), (15, 2)],
  term ((54794038719859987 : Rat) / 8703213785532) [(2, 1), (12, 1), (14, 1), (15, 2)],
  term ((54794038719859987 : Rat) / 8703213785532) [(2, 1), (13, 1), (15, 3)],
  term ((-54794038719859987 : Rat) / 17406427571064) [(2, 1), (14, 2), (15, 2)],
  term ((-54794038719859987 : Rat) / 17406427571064) [(2, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 225 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0225_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0225
        rs_R009_ueqv_R009YNNNN_generator_27_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_27_0225 := by
  native_decide

/-- Coefficient term 226 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0226 : Poly :=
[
  term ((-5351 : Rat) / 252) [(2, 1), (15, 2), (16, 1)]
]

/-- Partial product 226 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0226 : Poly :=
[
  term ((5351 : Rat) / 126) [(0, 1), (2, 1), (12, 1), (15, 2), (16, 1)],
  term ((-5351 : Rat) / 252) [(0, 2), (2, 1), (15, 2), (16, 1)],
  term ((5351 : Rat) / 126) [(1, 1), (2, 1), (13, 1), (15, 2), (16, 1)],
  term ((-5351 : Rat) / 252) [(1, 2), (2, 1), (15, 2), (16, 1)],
  term ((-5351 : Rat) / 126) [(2, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-5351 : Rat) / 126) [(2, 1), (13, 1), (15, 3), (16, 1)],
  term ((5351 : Rat) / 252) [(2, 1), (14, 2), (15, 2), (16, 1)],
  term ((5351 : Rat) / 252) [(2, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 226 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0226_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0226
        rs_R009_ueqv_R009YNNNN_generator_27_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_27_0226 := by
  native_decide

/-- Coefficient term 227 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0227 : Poly :=
[
  term ((1063033397773325 : Rat) / 26109641356596) [(2, 2)]
]

/-- Partial product 227 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0227 : Poly :=
[
  term ((-1063033397773325 : Rat) / 13054820678298) [(0, 1), (2, 2), (12, 1)],
  term ((1063033397773325 : Rat) / 26109641356596) [(0, 2), (2, 2)],
  term ((-1063033397773325 : Rat) / 13054820678298) [(1, 1), (2, 2), (13, 1)],
  term ((1063033397773325 : Rat) / 26109641356596) [(1, 2), (2, 2)],
  term ((1063033397773325 : Rat) / 13054820678298) [(2, 2), (12, 1), (14, 1)],
  term ((1063033397773325 : Rat) / 13054820678298) [(2, 2), (13, 1), (15, 1)],
  term ((-1063033397773325 : Rat) / 26109641356596) [(2, 2), (14, 2)],
  term ((-1063033397773325 : Rat) / 26109641356596) [(2, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 227 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0227_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0227
        rs_R009_ueqv_R009YNNNN_generator_27_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_27_0227 := by
  native_decide

/-- Coefficient term 228 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0228 : Poly :=
[
  term ((640 : Rat) / 21) [(3, 1), (5, 1)]
]

/-- Partial product 228 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0228 : Poly :=
[
  term ((-1280 : Rat) / 21) [(0, 1), (3, 1), (5, 1), (12, 1)],
  term ((640 : Rat) / 21) [(0, 2), (3, 1), (5, 1)],
  term ((-1280 : Rat) / 21) [(1, 1), (3, 1), (5, 1), (13, 1)],
  term ((640 : Rat) / 21) [(1, 2), (3, 1), (5, 1)],
  term ((1280 : Rat) / 21) [(3, 1), (5, 1), (12, 1), (14, 1)],
  term ((1280 : Rat) / 21) [(3, 1), (5, 1), (13, 1), (15, 1)],
  term ((-640 : Rat) / 21) [(3, 1), (5, 1), (14, 2)],
  term ((-640 : Rat) / 21) [(3, 1), (5, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 228 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0228_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0228
        rs_R009_ueqv_R009YNNNN_generator_27_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_27_0228 := by
  native_decide

/-- Coefficient term 229 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0229 : Poly :=
[
  term ((-320 : Rat) / 7) [(3, 1), (5, 1), (14, 1)]
]

/-- Partial product 229 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0229 : Poly :=
[
  term ((640 : Rat) / 7) [(0, 1), (3, 1), (5, 1), (12, 1), (14, 1)],
  term ((-320 : Rat) / 7) [(0, 2), (3, 1), (5, 1), (14, 1)],
  term ((640 : Rat) / 7) [(1, 1), (3, 1), (5, 1), (13, 1), (14, 1)],
  term ((-320 : Rat) / 7) [(1, 2), (3, 1), (5, 1), (14, 1)],
  term ((-640 : Rat) / 7) [(3, 1), (5, 1), (12, 1), (14, 2)],
  term ((-640 : Rat) / 7) [(3, 1), (5, 1), (13, 1), (14, 1), (15, 1)],
  term ((320 : Rat) / 7) [(3, 1), (5, 1), (14, 1), (15, 2)],
  term ((320 : Rat) / 7) [(3, 1), (5, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 229 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0229_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0229
        rs_R009_ueqv_R009YNNNN_generator_27_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_27_0229 := by
  native_decide

/-- Coefficient term 230 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0230 : Poly :=
[
  term ((-97280 : Rat) / 343) [(3, 1), (5, 1), (15, 2)]
]

/-- Partial product 230 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0230 : Poly :=
[
  term ((194560 : Rat) / 343) [(0, 1), (3, 1), (5, 1), (12, 1), (15, 2)],
  term ((-97280 : Rat) / 343) [(0, 2), (3, 1), (5, 1), (15, 2)],
  term ((194560 : Rat) / 343) [(1, 1), (3, 1), (5, 1), (13, 1), (15, 2)],
  term ((-97280 : Rat) / 343) [(1, 2), (3, 1), (5, 1), (15, 2)],
  term ((-194560 : Rat) / 343) [(3, 1), (5, 1), (12, 1), (14, 1), (15, 2)],
  term ((-194560 : Rat) / 343) [(3, 1), (5, 1), (13, 1), (15, 3)],
  term ((97280 : Rat) / 343) [(3, 1), (5, 1), (14, 2), (15, 2)],
  term ((97280 : Rat) / 343) [(3, 1), (5, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 230 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0230_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0230
        rs_R009_ueqv_R009YNNNN_generator_27_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_27_0230 := by
  native_decide

/-- Coefficient term 231 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0231 : Poly :=
[
  term ((-31277275379339804 : Rat) / 19582231017447) [(3, 1), (6, 1), (7, 1)]
]

/-- Partial product 231 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0231 : Poly :=
[
  term ((62554550758679608 : Rat) / 19582231017447) [(0, 1), (3, 1), (6, 1), (7, 1), (12, 1)],
  term ((-31277275379339804 : Rat) / 19582231017447) [(0, 2), (3, 1), (6, 1), (7, 1)],
  term ((62554550758679608 : Rat) / 19582231017447) [(1, 1), (3, 1), (6, 1), (7, 1), (13, 1)],
  term ((-31277275379339804 : Rat) / 19582231017447) [(1, 2), (3, 1), (6, 1), (7, 1)],
  term ((-62554550758679608 : Rat) / 19582231017447) [(3, 1), (6, 1), (7, 1), (12, 1), (14, 1)],
  term ((-62554550758679608 : Rat) / 19582231017447) [(3, 1), (6, 1), (7, 1), (13, 1), (15, 1)],
  term ((31277275379339804 : Rat) / 19582231017447) [(3, 1), (6, 1), (7, 1), (14, 2)],
  term ((31277275379339804 : Rat) / 19582231017447) [(3, 1), (6, 1), (7, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 231 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0231_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0231
        rs_R009_ueqv_R009YNNNN_generator_27_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_27_0231 := by
  native_decide

/-- Coefficient term 232 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0232 : Poly :=
[
  term ((-6788130415625 : Rat) / 6744934476) [(3, 1), (6, 1), (9, 1)]
]

/-- Partial product 232 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0232 : Poly :=
[
  term ((6788130415625 : Rat) / 3372467238) [(0, 1), (3, 1), (6, 1), (9, 1), (12, 1)],
  term ((-6788130415625 : Rat) / 6744934476) [(0, 2), (3, 1), (6, 1), (9, 1)],
  term ((6788130415625 : Rat) / 3372467238) [(1, 1), (3, 1), (6, 1), (9, 1), (13, 1)],
  term ((-6788130415625 : Rat) / 6744934476) [(1, 2), (3, 1), (6, 1), (9, 1)],
  term ((-6788130415625 : Rat) / 3372467238) [(3, 1), (6, 1), (9, 1), (12, 1), (14, 1)],
  term ((-6788130415625 : Rat) / 3372467238) [(3, 1), (6, 1), (9, 1), (13, 1), (15, 1)],
  term ((6788130415625 : Rat) / 6744934476) [(3, 1), (6, 1), (9, 1), (14, 2)],
  term ((6788130415625 : Rat) / 6744934476) [(3, 1), (6, 1), (9, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 232 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0232_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0232
        rs_R009_ueqv_R009YNNNN_generator_27_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_27_0232 := by
  native_decide

/-- Coefficient term 233 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0233 : Poly :=
[
  term ((30048784493840884 : Rat) / 19582231017447) [(3, 1), (6, 1), (11, 1)]
]

/-- Partial product 233 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0233 : Poly :=
[
  term ((-60097568987681768 : Rat) / 19582231017447) [(0, 1), (3, 1), (6, 1), (11, 1), (12, 1)],
  term ((30048784493840884 : Rat) / 19582231017447) [(0, 2), (3, 1), (6, 1), (11, 1)],
  term ((-60097568987681768 : Rat) / 19582231017447) [(1, 1), (3, 1), (6, 1), (11, 1), (13, 1)],
  term ((30048784493840884 : Rat) / 19582231017447) [(1, 2), (3, 1), (6, 1), (11, 1)],
  term ((60097568987681768 : Rat) / 19582231017447) [(3, 1), (6, 1), (11, 1), (12, 1), (14, 1)],
  term ((60097568987681768 : Rat) / 19582231017447) [(3, 1), (6, 1), (11, 1), (13, 1), (15, 1)],
  term ((-30048784493840884 : Rat) / 19582231017447) [(3, 1), (6, 1), (11, 1), (14, 2)],
  term ((-30048784493840884 : Rat) / 19582231017447) [(3, 1), (6, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 233 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0233_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0233
        rs_R009_ueqv_R009YNNNN_generator_27_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_27_0233 := by
  native_decide

/-- Coefficient term 234 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0234 : Poly :=
[
  term ((-33944746640006525 : Rat) / 78328924069788) [(3, 1), (6, 1), (12, 1), (15, 1)]
]

/-- Partial product 234 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0234 : Poly :=
[
  term ((33944746640006525 : Rat) / 39164462034894) [(0, 1), (3, 1), (6, 1), (12, 2), (15, 1)],
  term ((-33944746640006525 : Rat) / 78328924069788) [(0, 2), (3, 1), (6, 1), (12, 1), (15, 1)],
  term ((33944746640006525 : Rat) / 39164462034894) [(1, 1), (3, 1), (6, 1), (12, 1), (13, 1), (15, 1)],
  term ((-33944746640006525 : Rat) / 78328924069788) [(1, 2), (3, 1), (6, 1), (12, 1), (15, 1)],
  term ((-33944746640006525 : Rat) / 39164462034894) [(3, 1), (6, 1), (12, 1), (13, 1), (15, 2)],
  term ((33944746640006525 : Rat) / 78328924069788) [(3, 1), (6, 1), (12, 1), (14, 2), (15, 1)],
  term ((33944746640006525 : Rat) / 78328924069788) [(3, 1), (6, 1), (12, 1), (15, 3)],
  term ((-33944746640006525 : Rat) / 39164462034894) [(3, 1), (6, 1), (12, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 234 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0234_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0234
        rs_R009_ueqv_R009YNNNN_generator_27_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_27_0234 := by
  native_decide

/-- Coefficient term 235 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0235 : Poly :=
[
  term ((48487526969875909 : Rat) / 78328924069788) [(3, 1), (6, 1), (13, 1)]
]

/-- Partial product 235 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0235 : Poly :=
[
  term ((-48487526969875909 : Rat) / 39164462034894) [(0, 1), (3, 1), (6, 1), (12, 1), (13, 1)],
  term ((48487526969875909 : Rat) / 78328924069788) [(0, 2), (3, 1), (6, 1), (13, 1)],
  term ((-48487526969875909 : Rat) / 39164462034894) [(1, 1), (3, 1), (6, 1), (13, 2)],
  term ((48487526969875909 : Rat) / 78328924069788) [(1, 2), (3, 1), (6, 1), (13, 1)],
  term ((48487526969875909 : Rat) / 39164462034894) [(3, 1), (6, 1), (12, 1), (13, 1), (14, 1)],
  term ((-48487526969875909 : Rat) / 78328924069788) [(3, 1), (6, 1), (13, 1), (14, 2)],
  term ((-48487526969875909 : Rat) / 78328924069788) [(3, 1), (6, 1), (13, 1), (15, 2)],
  term ((48487526969875909 : Rat) / 39164462034894) [(3, 1), (6, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 235 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0235_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0235
        rs_R009_ueqv_R009YNNNN_generator_27_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_27_0235 := by
  native_decide

/-- Coefficient term 236 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0236 : Poly :=
[
  term ((-186880 : Rat) / 3087) [(3, 1), (6, 1), (13, 1), (15, 2)]
]

/-- Partial product 236 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0236 : Poly :=
[
  term ((373760 : Rat) / 3087) [(0, 1), (3, 1), (6, 1), (12, 1), (13, 1), (15, 2)],
  term ((-186880 : Rat) / 3087) [(0, 2), (3, 1), (6, 1), (13, 1), (15, 2)],
  term ((373760 : Rat) / 3087) [(1, 1), (3, 1), (6, 1), (13, 2), (15, 2)],
  term ((-186880 : Rat) / 3087) [(1, 2), (3, 1), (6, 1), (13, 1), (15, 2)],
  term ((-373760 : Rat) / 3087) [(3, 1), (6, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((186880 : Rat) / 3087) [(3, 1), (6, 1), (13, 1), (14, 2), (15, 2)],
  term ((186880 : Rat) / 3087) [(3, 1), (6, 1), (13, 1), (15, 4)],
  term ((-373760 : Rat) / 3087) [(3, 1), (6, 1), (13, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 236 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0236_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0236
        rs_R009_ueqv_R009YNNNN_generator_27_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_27_0236 := by
  native_decide

/-- Coefficient term 237 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0237 : Poly :=
[
  term ((85 : Rat) / 21) [(3, 1), (6, 1), (13, 1), (16, 1)]
]

/-- Partial product 237 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0237 : Poly :=
[
  term ((-170 : Rat) / 21) [(0, 1), (3, 1), (6, 1), (12, 1), (13, 1), (16, 1)],
  term ((85 : Rat) / 21) [(0, 2), (3, 1), (6, 1), (13, 1), (16, 1)],
  term ((-170 : Rat) / 21) [(1, 1), (3, 1), (6, 1), (13, 2), (16, 1)],
  term ((85 : Rat) / 21) [(1, 2), (3, 1), (6, 1), (13, 1), (16, 1)],
  term ((170 : Rat) / 21) [(3, 1), (6, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-85 : Rat) / 21) [(3, 1), (6, 1), (13, 1), (14, 2), (16, 1)],
  term ((-85 : Rat) / 21) [(3, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((170 : Rat) / 21) [(3, 1), (6, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 237 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0237_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0237
        rs_R009_ueqv_R009YNNNN_generator_27_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_27_0237 := by
  native_decide

/-- Coefficient term 238 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0238 : Poly :=
[
  term ((-93440 : Rat) / 3087) [(3, 1), (6, 1), (14, 1), (15, 1)]
]

/-- Partial product 238 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0238 : Poly :=
[
  term ((186880 : Rat) / 3087) [(0, 1), (3, 1), (6, 1), (12, 1), (14, 1), (15, 1)],
  term ((-93440 : Rat) / 3087) [(0, 2), (3, 1), (6, 1), (14, 1), (15, 1)],
  term ((186880 : Rat) / 3087) [(1, 1), (3, 1), (6, 1), (13, 1), (14, 1), (15, 1)],
  term ((-93440 : Rat) / 3087) [(1, 2), (3, 1), (6, 1), (14, 1), (15, 1)],
  term ((-186880 : Rat) / 3087) [(3, 1), (6, 1), (12, 1), (14, 2), (15, 1)],
  term ((-186880 : Rat) / 3087) [(3, 1), (6, 1), (13, 1), (14, 1), (15, 2)],
  term ((93440 : Rat) / 3087) [(3, 1), (6, 1), (14, 1), (15, 3)],
  term ((93440 : Rat) / 3087) [(3, 1), (6, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 238 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0238_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0238
        rs_R009_ueqv_R009YNNNN_generator_27_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_27_0238 := by
  native_decide

/-- Coefficient term 239 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0239 : Poly :=
[
  term ((-16716349441926325 : Rat) / 26109641356596) [(3, 1), (6, 1), (15, 1)]
]

/-- Partial product 239 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0239 : Poly :=
[
  term ((16716349441926325 : Rat) / 13054820678298) [(0, 1), (3, 1), (6, 1), (12, 1), (15, 1)],
  term ((-16716349441926325 : Rat) / 26109641356596) [(0, 2), (3, 1), (6, 1), (15, 1)],
  term ((16716349441926325 : Rat) / 13054820678298) [(1, 1), (3, 1), (6, 1), (13, 1), (15, 1)],
  term ((-16716349441926325 : Rat) / 26109641356596) [(1, 2), (3, 1), (6, 1), (15, 1)],
  term ((-16716349441926325 : Rat) / 13054820678298) [(3, 1), (6, 1), (12, 1), (14, 1), (15, 1)],
  term ((-16716349441926325 : Rat) / 13054820678298) [(3, 1), (6, 1), (13, 1), (15, 2)],
  term ((16716349441926325 : Rat) / 26109641356596) [(3, 1), (6, 1), (14, 2), (15, 1)],
  term ((16716349441926325 : Rat) / 26109641356596) [(3, 1), (6, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 239 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0239_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0239
        rs_R009_ueqv_R009YNNNN_generator_27_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_27_0239 := by
  native_decide

/-- Coefficient term 240 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0240 : Poly :=
[
  term ((-16 : Rat) / 3) [(3, 1), (6, 1), (15, 1), (16, 1)]
]

/-- Partial product 240 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0240 : Poly :=
[
  term ((32 : Rat) / 3) [(0, 1), (3, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-16 : Rat) / 3) [(0, 2), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((32 : Rat) / 3) [(1, 1), (3, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-16 : Rat) / 3) [(1, 2), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((-32 : Rat) / 3) [(3, 1), (6, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-32 : Rat) / 3) [(3, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((16 : Rat) / 3) [(3, 1), (6, 1), (14, 2), (15, 1), (16, 1)],
  term ((16 : Rat) / 3) [(3, 1), (6, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 240 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0240_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0240
        rs_R009_ueqv_R009YNNNN_generator_27_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_27_0240 := by
  native_decide

/-- Coefficient term 241 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0241 : Poly :=
[
  term ((373760 : Rat) / 3087) [(3, 1), (6, 1), (15, 3)]
]

/-- Partial product 241 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0241 : Poly :=
[
  term ((-747520 : Rat) / 3087) [(0, 1), (3, 1), (6, 1), (12, 1), (15, 3)],
  term ((373760 : Rat) / 3087) [(0, 2), (3, 1), (6, 1), (15, 3)],
  term ((-747520 : Rat) / 3087) [(1, 1), (3, 1), (6, 1), (13, 1), (15, 3)],
  term ((373760 : Rat) / 3087) [(1, 2), (3, 1), (6, 1), (15, 3)],
  term ((747520 : Rat) / 3087) [(3, 1), (6, 1), (12, 1), (14, 1), (15, 3)],
  term ((747520 : Rat) / 3087) [(3, 1), (6, 1), (13, 1), (15, 4)],
  term ((-373760 : Rat) / 3087) [(3, 1), (6, 1), (14, 2), (15, 3)],
  term ((-373760 : Rat) / 3087) [(3, 1), (6, 1), (15, 5)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 241 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0241_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0241
        rs_R009_ueqv_R009YNNNN_generator_27_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_27_0241 := by
  native_decide

/-- Coefficient term 242 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0242 : Poly :=
[
  term ((480923310623753267 : Rat) / 156657848139576) [(3, 1), (7, 1)]
]

/-- Partial product 242 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0242 : Poly :=
[
  term ((-480923310623753267 : Rat) / 78328924069788) [(0, 1), (3, 1), (7, 1), (12, 1)],
  term ((480923310623753267 : Rat) / 156657848139576) [(0, 2), (3, 1), (7, 1)],
  term ((-480923310623753267 : Rat) / 78328924069788) [(1, 1), (3, 1), (7, 1), (13, 1)],
  term ((480923310623753267 : Rat) / 156657848139576) [(1, 2), (3, 1), (7, 1)],
  term ((480923310623753267 : Rat) / 78328924069788) [(3, 1), (7, 1), (12, 1), (14, 1)],
  term ((480923310623753267 : Rat) / 78328924069788) [(3, 1), (7, 1), (13, 1), (15, 1)],
  term ((-480923310623753267 : Rat) / 156657848139576) [(3, 1), (7, 1), (14, 2)],
  term ((-480923310623753267 : Rat) / 156657848139576) [(3, 1), (7, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 242 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0242_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0242
        rs_R009_ueqv_R009YNNNN_generator_27_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_27_0242 := by
  native_decide

/-- Coefficient term 243 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0243 : Poly :=
[
  term ((-25000068476225527 : Rat) / 78328924069788) [(3, 1), (7, 1), (10, 1)]
]

/-- Partial product 243 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0243 : Poly :=
[
  term ((25000068476225527 : Rat) / 39164462034894) [(0, 1), (3, 1), (7, 1), (10, 1), (12, 1)],
  term ((-25000068476225527 : Rat) / 78328924069788) [(0, 2), (3, 1), (7, 1), (10, 1)],
  term ((25000068476225527 : Rat) / 39164462034894) [(1, 1), (3, 1), (7, 1), (10, 1), (13, 1)],
  term ((-25000068476225527 : Rat) / 78328924069788) [(1, 2), (3, 1), (7, 1), (10, 1)],
  term ((-25000068476225527 : Rat) / 39164462034894) [(3, 1), (7, 1), (10, 1), (12, 1), (14, 1)],
  term ((-25000068476225527 : Rat) / 39164462034894) [(3, 1), (7, 1), (10, 1), (13, 1), (15, 1)],
  term ((25000068476225527 : Rat) / 78328924069788) [(3, 1), (7, 1), (10, 1), (14, 2)],
  term ((25000068476225527 : Rat) / 78328924069788) [(3, 1), (7, 1), (10, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 243 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0243_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0243
        rs_R009_ueqv_R009YNNNN_generator_27_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_27_0243 := by
  native_decide

/-- Coefficient term 244 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0244 : Poly :=
[
  term ((33944746640006525 : Rat) / 78328924069788) [(3, 1), (7, 1), (12, 1), (14, 1)]
]

/-- Partial product 244 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0244 : Poly :=
[
  term ((-33944746640006525 : Rat) / 39164462034894) [(0, 1), (3, 1), (7, 1), (12, 2), (14, 1)],
  term ((33944746640006525 : Rat) / 78328924069788) [(0, 2), (3, 1), (7, 1), (12, 1), (14, 1)],
  term ((-33944746640006525 : Rat) / 39164462034894) [(1, 1), (3, 1), (7, 1), (12, 1), (13, 1), (14, 1)],
  term ((33944746640006525 : Rat) / 78328924069788) [(1, 2), (3, 1), (7, 1), (12, 1), (14, 1)],
  term ((33944746640006525 : Rat) / 39164462034894) [(3, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-33944746640006525 : Rat) / 78328924069788) [(3, 1), (7, 1), (12, 1), (14, 1), (15, 2)],
  term ((-33944746640006525 : Rat) / 78328924069788) [(3, 1), (7, 1), (12, 1), (14, 3)],
  term ((33944746640006525 : Rat) / 39164462034894) [(3, 1), (7, 1), (12, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 244 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0244_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0244
        rs_R009_ueqv_R009YNNNN_generator_27_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_27_0244 := by
  native_decide

/-- Coefficient term 245 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0245 : Poly :=
[
  term ((186880 : Rat) / 3087) [(3, 1), (7, 1), (12, 1), (15, 2)]
]

/-- Partial product 245 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0245 : Poly :=
[
  term ((-373760 : Rat) / 3087) [(0, 1), (3, 1), (7, 1), (12, 2), (15, 2)],
  term ((186880 : Rat) / 3087) [(0, 2), (3, 1), (7, 1), (12, 1), (15, 2)],
  term ((-373760 : Rat) / 3087) [(1, 1), (3, 1), (7, 1), (12, 1), (13, 1), (15, 2)],
  term ((186880 : Rat) / 3087) [(1, 2), (3, 1), (7, 1), (12, 1), (15, 2)],
  term ((373760 : Rat) / 3087) [(3, 1), (7, 1), (12, 1), (13, 1), (15, 3)],
  term ((-186880 : Rat) / 3087) [(3, 1), (7, 1), (12, 1), (14, 2), (15, 2)],
  term ((-186880 : Rat) / 3087) [(3, 1), (7, 1), (12, 1), (15, 4)],
  term ((373760 : Rat) / 3087) [(3, 1), (7, 1), (12, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 245 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0245_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0245
        rs_R009_ueqv_R009YNNNN_generator_27_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_27_0245 := by
  native_decide

/-- Coefficient term 246 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0246 : Poly :=
[
  term ((-7341319116991847 : Rat) / 7459897530456) [(3, 1), (7, 1), (14, 1)]
]

/-- Partial product 246 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0246 : Poly :=
[
  term ((7341319116991847 : Rat) / 3729948765228) [(0, 1), (3, 1), (7, 1), (12, 1), (14, 1)],
  term ((-7341319116991847 : Rat) / 7459897530456) [(0, 2), (3, 1), (7, 1), (14, 1)],
  term ((7341319116991847 : Rat) / 3729948765228) [(1, 1), (3, 1), (7, 1), (13, 1), (14, 1)],
  term ((-7341319116991847 : Rat) / 7459897530456) [(1, 2), (3, 1), (7, 1), (14, 1)],
  term ((-7341319116991847 : Rat) / 3729948765228) [(3, 1), (7, 1), (12, 1), (14, 2)],
  term ((-7341319116991847 : Rat) / 3729948765228) [(3, 1), (7, 1), (13, 1), (14, 1), (15, 1)],
  term ((7341319116991847 : Rat) / 7459897530456) [(3, 1), (7, 1), (14, 1), (15, 2)],
  term ((7341319116991847 : Rat) / 7459897530456) [(3, 1), (7, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 246 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0246_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0246
        rs_R009_ueqv_R009YNNNN_generator_27_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_27_0246 := by
  native_decide

/-- Coefficient term 247 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0247 : Poly :=
[
  term ((-373760 : Rat) / 3087) [(3, 1), (7, 1), (14, 1), (15, 2)]
]

/-- Partial product 247 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0247 : Poly :=
[
  term ((747520 : Rat) / 3087) [(0, 1), (3, 1), (7, 1), (12, 1), (14, 1), (15, 2)],
  term ((-373760 : Rat) / 3087) [(0, 2), (3, 1), (7, 1), (14, 1), (15, 2)],
  term ((747520 : Rat) / 3087) [(1, 1), (3, 1), (7, 1), (13, 1), (14, 1), (15, 2)],
  term ((-373760 : Rat) / 3087) [(1, 2), (3, 1), (7, 1), (14, 1), (15, 2)],
  term ((-747520 : Rat) / 3087) [(3, 1), (7, 1), (12, 1), (14, 2), (15, 2)],
  term ((-747520 : Rat) / 3087) [(3, 1), (7, 1), (13, 1), (14, 1), (15, 3)],
  term ((373760 : Rat) / 3087) [(3, 1), (7, 1), (14, 1), (15, 4)],
  term ((373760 : Rat) / 3087) [(3, 1), (7, 1), (14, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 247 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0247_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0247
        rs_R009_ueqv_R009YNNNN_generator_27_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_27_0247 := by
  native_decide

/-- Coefficient term 248 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0248 : Poly :=
[
  term ((93440 : Rat) / 3087) [(3, 1), (7, 1), (15, 2)]
]

/-- Partial product 248 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0248 : Poly :=
[
  term ((-186880 : Rat) / 3087) [(0, 1), (3, 1), (7, 1), (12, 1), (15, 2)],
  term ((93440 : Rat) / 3087) [(0, 2), (3, 1), (7, 1), (15, 2)],
  term ((-186880 : Rat) / 3087) [(1, 1), (3, 1), (7, 1), (13, 1), (15, 2)],
  term ((93440 : Rat) / 3087) [(1, 2), (3, 1), (7, 1), (15, 2)],
  term ((186880 : Rat) / 3087) [(3, 1), (7, 1), (12, 1), (14, 1), (15, 2)],
  term ((186880 : Rat) / 3087) [(3, 1), (7, 1), (13, 1), (15, 3)],
  term ((-93440 : Rat) / 3087) [(3, 1), (7, 1), (14, 2), (15, 2)],
  term ((-93440 : Rat) / 3087) [(3, 1), (7, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 248 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0248_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0248
        rs_R009_ueqv_R009YNNNN_generator_27_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_27_0248 := by
  native_decide

/-- Coefficient term 249 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0249 : Poly :=
[
  term ((1015569108576973 : Rat) / 323756854848) [(3, 1), (9, 1)]
]

/-- Partial product 249 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0249 : Poly :=
[
  term ((-1015569108576973 : Rat) / 161878427424) [(0, 1), (3, 1), (9, 1), (12, 1)],
  term ((1015569108576973 : Rat) / 323756854848) [(0, 2), (3, 1), (9, 1)],
  term ((-1015569108576973 : Rat) / 161878427424) [(1, 1), (3, 1), (9, 1), (13, 1)],
  term ((1015569108576973 : Rat) / 323756854848) [(1, 2), (3, 1), (9, 1)],
  term ((1015569108576973 : Rat) / 161878427424) [(3, 1), (9, 1), (12, 1), (14, 1)],
  term ((1015569108576973 : Rat) / 161878427424) [(3, 1), (9, 1), (13, 1), (15, 1)],
  term ((-1015569108576973 : Rat) / 323756854848) [(3, 1), (9, 1), (14, 2)],
  term ((-1015569108576973 : Rat) / 323756854848) [(3, 1), (9, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 249 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0249_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0249
        rs_R009_ueqv_R009YNNNN_generator_27_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_27_0249 := by
  native_decide

/-- Coefficient term 250 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0250 : Poly :=
[
  term ((-10880558480597 : Rat) / 15416993088) [(3, 1), (9, 1), (10, 1)]
]

/-- Partial product 250 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0250 : Poly :=
[
  term ((10880558480597 : Rat) / 7708496544) [(0, 1), (3, 1), (9, 1), (10, 1), (12, 1)],
  term ((-10880558480597 : Rat) / 15416993088) [(0, 2), (3, 1), (9, 1), (10, 1)],
  term ((10880558480597 : Rat) / 7708496544) [(1, 1), (3, 1), (9, 1), (10, 1), (13, 1)],
  term ((-10880558480597 : Rat) / 15416993088) [(1, 2), (3, 1), (9, 1), (10, 1)],
  term ((-10880558480597 : Rat) / 7708496544) [(3, 1), (9, 1), (10, 1), (12, 1), (14, 1)],
  term ((-10880558480597 : Rat) / 7708496544) [(3, 1), (9, 1), (10, 1), (13, 1), (15, 1)],
  term ((10880558480597 : Rat) / 15416993088) [(3, 1), (9, 1), (10, 1), (14, 2)],
  term ((10880558480597 : Rat) / 15416993088) [(3, 1), (9, 1), (10, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 250 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0250_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0250
        rs_R009_ueqv_R009YNNNN_generator_27_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_27_0250 := by
  native_decide

/-- Coefficient term 251 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0251 : Poly :=
[
  term ((-519569467138361 : Rat) / 323756854848) [(3, 1), (9, 1), (14, 1)]
]

/-- Partial product 251 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0251 : Poly :=
[
  term ((519569467138361 : Rat) / 161878427424) [(0, 1), (3, 1), (9, 1), (12, 1), (14, 1)],
  term ((-519569467138361 : Rat) / 323756854848) [(0, 2), (3, 1), (9, 1), (14, 1)],
  term ((519569467138361 : Rat) / 161878427424) [(1, 1), (3, 1), (9, 1), (13, 1), (14, 1)],
  term ((-519569467138361 : Rat) / 323756854848) [(1, 2), (3, 1), (9, 1), (14, 1)],
  term ((-519569467138361 : Rat) / 161878427424) [(3, 1), (9, 1), (12, 1), (14, 2)],
  term ((-519569467138361 : Rat) / 161878427424) [(3, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((519569467138361 : Rat) / 323756854848) [(3, 1), (9, 1), (14, 1), (15, 2)],
  term ((519569467138361 : Rat) / 323756854848) [(3, 1), (9, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 251 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0251_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0251
        rs_R009_ueqv_R009YNNNN_generator_27_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_27_0251 := by
  native_decide

/-- Coefficient term 252 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0252 : Poly :=
[
  term ((48640 : Rat) / 343) [(3, 1), (9, 1), (15, 2)]
]

/-- Partial product 252 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0252 : Poly :=
[
  term ((-97280 : Rat) / 343) [(0, 1), (3, 1), (9, 1), (12, 1), (15, 2)],
  term ((48640 : Rat) / 343) [(0, 2), (3, 1), (9, 1), (15, 2)],
  term ((-97280 : Rat) / 343) [(1, 1), (3, 1), (9, 1), (13, 1), (15, 2)],
  term ((48640 : Rat) / 343) [(1, 2), (3, 1), (9, 1), (15, 2)],
  term ((97280 : Rat) / 343) [(3, 1), (9, 1), (12, 1), (14, 1), (15, 2)],
  term ((97280 : Rat) / 343) [(3, 1), (9, 1), (13, 1), (15, 3)],
  term ((-48640 : Rat) / 343) [(3, 1), (9, 1), (14, 2), (15, 2)],
  term ((-48640 : Rat) / 343) [(3, 1), (9, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 252 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0252_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0252
        rs_R009_ueqv_R009YNNNN_generator_27_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_27_0252 := by
  native_decide

/-- Coefficient term 253 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0253 : Poly :=
[
  term ((3707981798324431 : Rat) / 8703213785532) [(3, 1), (10, 1), (11, 1)]
]

/-- Partial product 253 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0253 : Poly :=
[
  term ((-3707981798324431 : Rat) / 4351606892766) [(0, 1), (3, 1), (10, 1), (11, 1), (12, 1)],
  term ((3707981798324431 : Rat) / 8703213785532) [(0, 2), (3, 1), (10, 1), (11, 1)],
  term ((-3707981798324431 : Rat) / 4351606892766) [(1, 1), (3, 1), (10, 1), (11, 1), (13, 1)],
  term ((3707981798324431 : Rat) / 8703213785532) [(1, 2), (3, 1), (10, 1), (11, 1)],
  term ((3707981798324431 : Rat) / 4351606892766) [(3, 1), (10, 1), (11, 1), (12, 1), (14, 1)],
  term ((3707981798324431 : Rat) / 4351606892766) [(3, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((-3707981798324431 : Rat) / 8703213785532) [(3, 1), (10, 1), (11, 1), (14, 2)],
  term ((-3707981798324431 : Rat) / 8703213785532) [(3, 1), (10, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 253 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0253_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0253
        rs_R009_ueqv_R009YNNNN_generator_27_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_27_0253 := by
  native_decide

/-- Coefficient term 254 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0254 : Poly :=
[
  term ((3053922743221337 : Rat) / 4262798588832) [(3, 1), (10, 1), (13, 1)]
]

/-- Partial product 254 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0254 : Poly :=
[
  term ((-3053922743221337 : Rat) / 2131399294416) [(0, 1), (3, 1), (10, 1), (12, 1), (13, 1)],
  term ((3053922743221337 : Rat) / 4262798588832) [(0, 2), (3, 1), (10, 1), (13, 1)],
  term ((-3053922743221337 : Rat) / 2131399294416) [(1, 1), (3, 1), (10, 1), (13, 2)],
  term ((3053922743221337 : Rat) / 4262798588832) [(1, 2), (3, 1), (10, 1), (13, 1)],
  term ((3053922743221337 : Rat) / 2131399294416) [(3, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((-3053922743221337 : Rat) / 4262798588832) [(3, 1), (10, 1), (13, 1), (14, 2)],
  term ((-3053922743221337 : Rat) / 4262798588832) [(3, 1), (10, 1), (13, 1), (15, 2)],
  term ((3053922743221337 : Rat) / 2131399294416) [(3, 1), (10, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 254 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0254_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0254
        rs_R009_ueqv_R009YNNNN_generator_27_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_27_0254 := by
  native_decide

/-- Coefficient term 255 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0255 : Poly :=
[
  term ((-3725 : Rat) / 336) [(3, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 255 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0255 : Poly :=
[
  term ((3725 : Rat) / 168) [(0, 1), (3, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-3725 : Rat) / 336) [(0, 2), (3, 1), (10, 1), (13, 1), (16, 1)],
  term ((3725 : Rat) / 168) [(1, 1), (3, 1), (10, 1), (13, 2), (16, 1)],
  term ((-3725 : Rat) / 336) [(1, 2), (3, 1), (10, 1), (13, 1), (16, 1)],
  term ((-3725 : Rat) / 168) [(3, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((3725 : Rat) / 336) [(3, 1), (10, 1), (13, 1), (14, 2), (16, 1)],
  term ((3725 : Rat) / 336) [(3, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-3725 : Rat) / 168) [(3, 1), (10, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 255 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0255_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0255
        rs_R009_ueqv_R009YNNNN_generator_27_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_27_0255 := by
  native_decide

/-- Coefficient term 256 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0256 : Poly :=
[
  term ((-165940779078161915 : Rat) / 156657848139576) [(3, 1), (10, 1), (15, 1)]
]

/-- Partial product 256 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0256 : Poly :=
[
  term ((165940779078161915 : Rat) / 78328924069788) [(0, 1), (3, 1), (10, 1), (12, 1), (15, 1)],
  term ((-165940779078161915 : Rat) / 156657848139576) [(0, 2), (3, 1), (10, 1), (15, 1)],
  term ((165940779078161915 : Rat) / 78328924069788) [(1, 1), (3, 1), (10, 1), (13, 1), (15, 1)],
  term ((-165940779078161915 : Rat) / 156657848139576) [(1, 2), (3, 1), (10, 1), (15, 1)],
  term ((-165940779078161915 : Rat) / 78328924069788) [(3, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((-165940779078161915 : Rat) / 78328924069788) [(3, 1), (10, 1), (13, 1), (15, 2)],
  term ((165940779078161915 : Rat) / 156657848139576) [(3, 1), (10, 1), (14, 2), (15, 1)],
  term ((165940779078161915 : Rat) / 156657848139576) [(3, 1), (10, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 256 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0256_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0256
        rs_R009_ueqv_R009YNNNN_generator_27_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_27_0256 := by
  native_decide

/-- Coefficient term 257 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0257 : Poly :=
[
  term ((701 : Rat) / 84) [(3, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 257 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0257 : Poly :=
[
  term ((-701 : Rat) / 42) [(0, 1), (3, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((701 : Rat) / 84) [(0, 2), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((-701 : Rat) / 42) [(1, 1), (3, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((701 : Rat) / 84) [(1, 2), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((701 : Rat) / 42) [(3, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((701 : Rat) / 42) [(3, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-701 : Rat) / 84) [(3, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((-701 : Rat) / 84) [(3, 1), (10, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 257 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0257_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0257
        rs_R009_ueqv_R009YNNNN_generator_27_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_27_0257 := by
  native_decide

/-- Coefficient term 258 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0258 : Poly :=
[
  term ((-174280011147021505 : Rat) / 78328924069788) [(3, 1), (11, 1)]
]

/-- Partial product 258 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0258 : Poly :=
[
  term ((174280011147021505 : Rat) / 39164462034894) [(0, 1), (3, 1), (11, 1), (12, 1)],
  term ((-174280011147021505 : Rat) / 78328924069788) [(0, 2), (3, 1), (11, 1)],
  term ((174280011147021505 : Rat) / 39164462034894) [(1, 1), (3, 1), (11, 1), (13, 1)],
  term ((-174280011147021505 : Rat) / 78328924069788) [(1, 2), (3, 1), (11, 1)],
  term ((-174280011147021505 : Rat) / 39164462034894) [(3, 1), (11, 1), (12, 1), (14, 1)],
  term ((-174280011147021505 : Rat) / 39164462034894) [(3, 1), (11, 1), (13, 1), (15, 1)],
  term ((174280011147021505 : Rat) / 78328924069788) [(3, 1), (11, 1), (14, 2)],
  term ((174280011147021505 : Rat) / 78328924069788) [(3, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 258 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0258_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0258
        rs_R009_ueqv_R009YNNNN_generator_27_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_27_0258 := by
  native_decide

/-- Coefficient term 259 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0259 : Poly :=
[
  term ((24944916250237507 : Rat) / 11189846295684) [(3, 1), (11, 1), (14, 1)]
]

/-- Partial product 259 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0259 : Poly :=
[
  term ((-24944916250237507 : Rat) / 5594923147842) [(0, 1), (3, 1), (11, 1), (12, 1), (14, 1)],
  term ((24944916250237507 : Rat) / 11189846295684) [(0, 2), (3, 1), (11, 1), (14, 1)],
  term ((-24944916250237507 : Rat) / 5594923147842) [(1, 1), (3, 1), (11, 1), (13, 1), (14, 1)],
  term ((24944916250237507 : Rat) / 11189846295684) [(1, 2), (3, 1), (11, 1), (14, 1)],
  term ((24944916250237507 : Rat) / 5594923147842) [(3, 1), (11, 1), (12, 1), (14, 2)],
  term ((24944916250237507 : Rat) / 5594923147842) [(3, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-24944916250237507 : Rat) / 11189846295684) [(3, 1), (11, 1), (14, 1), (15, 2)],
  term ((-24944916250237507 : Rat) / 11189846295684) [(3, 1), (11, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 259 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0259_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0259
        rs_R009_ueqv_R009YNNNN_generator_27_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_27_0259 := by
  native_decide

/-- Coefficient term 260 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0260 : Poly :=
[
  term ((320 : Rat) / 21) [(3, 1), (12, 1), (15, 1)]
]

/-- Partial product 260 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0260 : Poly :=
[
  term ((-640 : Rat) / 21) [(0, 1), (3, 1), (12, 2), (15, 1)],
  term ((320 : Rat) / 21) [(0, 2), (3, 1), (12, 1), (15, 1)],
  term ((-640 : Rat) / 21) [(1, 1), (3, 1), (12, 1), (13, 1), (15, 1)],
  term ((320 : Rat) / 21) [(1, 2), (3, 1), (12, 1), (15, 1)],
  term ((640 : Rat) / 21) [(3, 1), (12, 1), (13, 1), (15, 2)],
  term ((-320 : Rat) / 21) [(3, 1), (12, 1), (14, 2), (15, 1)],
  term ((-320 : Rat) / 21) [(3, 1), (12, 1), (15, 3)],
  term ((640 : Rat) / 21) [(3, 1), (12, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 260 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0260_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0260
        rs_R009_ueqv_R009YNNNN_generator_27_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_27_0260 := by
  native_decide

/-- Coefficient term 261 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0261 : Poly :=
[
  term ((-186880 : Rat) / 3087) [(3, 1), (12, 1), (15, 3)]
]

/-- Partial product 261 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0261 : Poly :=
[
  term ((373760 : Rat) / 3087) [(0, 1), (3, 1), (12, 2), (15, 3)],
  term ((-186880 : Rat) / 3087) [(0, 2), (3, 1), (12, 1), (15, 3)],
  term ((373760 : Rat) / 3087) [(1, 1), (3, 1), (12, 1), (13, 1), (15, 3)],
  term ((-186880 : Rat) / 3087) [(1, 2), (3, 1), (12, 1), (15, 3)],
  term ((-373760 : Rat) / 3087) [(3, 1), (12, 1), (13, 1), (15, 4)],
  term ((186880 : Rat) / 3087) [(3, 1), (12, 1), (14, 2), (15, 3)],
  term ((186880 : Rat) / 3087) [(3, 1), (12, 1), (15, 5)],
  term ((-373760 : Rat) / 3087) [(3, 1), (12, 2), (14, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 261 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0261_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0261
        rs_R009_ueqv_R009YNNNN_generator_27_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_27_0261 := by
  native_decide

/-- Coefficient term 262 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0262 : Poly :=
[
  term ((-721277507173216153 : Rat) / 208877130852768) [(3, 1), (13, 1)]
]

/-- Partial product 262 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0262 : Poly :=
[
  term ((721277507173216153 : Rat) / 104438565426384) [(0, 1), (3, 1), (12, 1), (13, 1)],
  term ((-721277507173216153 : Rat) / 208877130852768) [(0, 2), (3, 1), (13, 1)],
  term ((721277507173216153 : Rat) / 104438565426384) [(1, 1), (3, 1), (13, 2)],
  term ((-721277507173216153 : Rat) / 208877130852768) [(1, 2), (3, 1), (13, 1)],
  term ((-721277507173216153 : Rat) / 104438565426384) [(3, 1), (12, 1), (13, 1), (14, 1)],
  term ((721277507173216153 : Rat) / 208877130852768) [(3, 1), (13, 1), (14, 2)],
  term ((721277507173216153 : Rat) / 208877130852768) [(3, 1), (13, 1), (15, 2)],
  term ((-721277507173216153 : Rat) / 104438565426384) [(3, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 262 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0262_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0262
        rs_R009_ueqv_R009YNNNN_generator_27_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_27_0262 := by
  native_decide

/-- Coefficient term 263 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0263 : Poly :=
[
  term ((21646282034496587 : Rat) / 12788395766496) [(3, 1), (13, 1), (14, 1)]
]

/-- Partial product 263 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0263 : Poly :=
[
  term ((-21646282034496587 : Rat) / 6394197883248) [(0, 1), (3, 1), (12, 1), (13, 1), (14, 1)],
  term ((21646282034496587 : Rat) / 12788395766496) [(0, 2), (3, 1), (13, 1), (14, 1)],
  term ((-21646282034496587 : Rat) / 6394197883248) [(1, 1), (3, 1), (13, 2), (14, 1)],
  term ((21646282034496587 : Rat) / 12788395766496) [(1, 2), (3, 1), (13, 1), (14, 1)],
  term ((21646282034496587 : Rat) / 6394197883248) [(3, 1), (12, 1), (13, 1), (14, 2)],
  term ((-21646282034496587 : Rat) / 12788395766496) [(3, 1), (13, 1), (14, 1), (15, 2)],
  term ((-21646282034496587 : Rat) / 12788395766496) [(3, 1), (13, 1), (14, 3)],
  term ((21646282034496587 : Rat) / 6394197883248) [(3, 1), (13, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 263 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0263_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0263
        rs_R009_ueqv_R009YNNNN_generator_27_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_27_0263 := by
  native_decide

/-- Coefficient term 264 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0264 : Poly :=
[
  term ((186880 : Rat) / 3087) [(3, 1), (13, 1), (14, 1), (15, 2)]
]

/-- Partial product 264 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0264 : Poly :=
[
  term ((-373760 : Rat) / 3087) [(0, 1), (3, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((186880 : Rat) / 3087) [(0, 2), (3, 1), (13, 1), (14, 1), (15, 2)],
  term ((-373760 : Rat) / 3087) [(1, 1), (3, 1), (13, 2), (14, 1), (15, 2)],
  term ((186880 : Rat) / 3087) [(1, 2), (3, 1), (13, 1), (14, 1), (15, 2)],
  term ((373760 : Rat) / 3087) [(3, 1), (12, 1), (13, 1), (14, 2), (15, 2)],
  term ((-186880 : Rat) / 3087) [(3, 1), (13, 1), (14, 1), (15, 4)],
  term ((-186880 : Rat) / 3087) [(3, 1), (13, 1), (14, 3), (15, 2)],
  term ((373760 : Rat) / 3087) [(3, 1), (13, 2), (14, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 264 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0264_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0264
        rs_R009_ueqv_R009YNNNN_generator_27_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_27_0264 := by
  native_decide

/-- Coefficient term 265 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0265 : Poly :=
[
  term ((-1895 : Rat) / 1008) [(3, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 265 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0265 : Poly :=
[
  term ((1895 : Rat) / 504) [(0, 1), (3, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1895 : Rat) / 1008) [(0, 2), (3, 1), (13, 1), (14, 1), (16, 1)],
  term ((1895 : Rat) / 504) [(1, 1), (3, 1), (13, 2), (14, 1), (16, 1)],
  term ((-1895 : Rat) / 1008) [(1, 2), (3, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1895 : Rat) / 504) [(3, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((1895 : Rat) / 1008) [(3, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((1895 : Rat) / 1008) [(3, 1), (13, 1), (14, 3), (16, 1)],
  term ((-1895 : Rat) / 504) [(3, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 265 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0265_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0265
        rs_R009_ueqv_R009YNNNN_generator_27_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_27_0265 := by
  native_decide

/-- Coefficient term 266 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0266 : Poly :=
[
  term ((-186880 : Rat) / 3087) [(3, 1), (13, 1), (15, 2)]
]

/-- Partial product 266 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0266 : Poly :=
[
  term ((373760 : Rat) / 3087) [(0, 1), (3, 1), (12, 1), (13, 1), (15, 2)],
  term ((-186880 : Rat) / 3087) [(0, 2), (3, 1), (13, 1), (15, 2)],
  term ((373760 : Rat) / 3087) [(1, 1), (3, 1), (13, 2), (15, 2)],
  term ((-186880 : Rat) / 3087) [(1, 2), (3, 1), (13, 1), (15, 2)],
  term ((-373760 : Rat) / 3087) [(3, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((186880 : Rat) / 3087) [(3, 1), (13, 1), (14, 2), (15, 2)],
  term ((186880 : Rat) / 3087) [(3, 1), (13, 1), (15, 4)],
  term ((-373760 : Rat) / 3087) [(3, 1), (13, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 266 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0266_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0266
        rs_R009_ueqv_R009YNNNN_generator_27_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_27_0266 := by
  native_decide

/-- Coefficient term 267 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0267 : Poly :=
[
  term ((93715 : Rat) / 1008) [(3, 1), (13, 1), (16, 1)]
]

/-- Partial product 267 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0267 : Poly :=
[
  term ((-93715 : Rat) / 504) [(0, 1), (3, 1), (12, 1), (13, 1), (16, 1)],
  term ((93715 : Rat) / 1008) [(0, 2), (3, 1), (13, 1), (16, 1)],
  term ((-93715 : Rat) / 504) [(1, 1), (3, 1), (13, 2), (16, 1)],
  term ((93715 : Rat) / 1008) [(1, 2), (3, 1), (13, 1), (16, 1)],
  term ((93715 : Rat) / 504) [(3, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-93715 : Rat) / 1008) [(3, 1), (13, 1), (14, 2), (16, 1)],
  term ((-93715 : Rat) / 1008) [(3, 1), (13, 1), (15, 2), (16, 1)],
  term ((93715 : Rat) / 504) [(3, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 267 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0267_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0267
        rs_R009_ueqv_R009YNNNN_generator_27_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_27_0267 := by
  native_decide

/-- Coefficient term 268 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0268 : Poly :=
[
  term ((-197608266630175601 : Rat) / 156657848139576) [(3, 1), (14, 1), (15, 1)]
]

/-- Partial product 268 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0268 : Poly :=
[
  term ((197608266630175601 : Rat) / 78328924069788) [(0, 1), (3, 1), (12, 1), (14, 1), (15, 1)],
  term ((-197608266630175601 : Rat) / 156657848139576) [(0, 2), (3, 1), (14, 1), (15, 1)],
  term ((197608266630175601 : Rat) / 78328924069788) [(1, 1), (3, 1), (13, 1), (14, 1), (15, 1)],
  term ((-197608266630175601 : Rat) / 156657848139576) [(1, 2), (3, 1), (14, 1), (15, 1)],
  term ((-197608266630175601 : Rat) / 78328924069788) [(3, 1), (12, 1), (14, 2), (15, 1)],
  term ((-197608266630175601 : Rat) / 78328924069788) [(3, 1), (13, 1), (14, 1), (15, 2)],
  term ((197608266630175601 : Rat) / 156657848139576) [(3, 1), (14, 1), (15, 3)],
  term ((197608266630175601 : Rat) / 156657848139576) [(3, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 268 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0268_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0268
        rs_R009_ueqv_R009YNNNN_generator_27_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_27_0268 := by
  native_decide

/-- Coefficient term 269 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0269 : Poly :=
[
  term ((-361 : Rat) / 252) [(3, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 269 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0269 : Poly :=
[
  term ((361 : Rat) / 126) [(0, 1), (3, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-361 : Rat) / 252) [(0, 2), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((361 : Rat) / 126) [(1, 1), (3, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-361 : Rat) / 252) [(1, 2), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((-361 : Rat) / 126) [(3, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-361 : Rat) / 126) [(3, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((361 : Rat) / 252) [(3, 1), (14, 1), (15, 3), (16, 1)],
  term ((361 : Rat) / 252) [(3, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 269 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0269_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0269
        rs_R009_ueqv_R009YNNNN_generator_27_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_27_0269 := by
  native_decide

/-- Coefficient term 270 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0270 : Poly :=
[
  term ((21107476986721 : Rat) / 241755938487) [(3, 1), (14, 2), (15, 1)]
]

/-- Partial product 270 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0270 : Poly :=
[
  term ((-42214953973442 : Rat) / 241755938487) [(0, 1), (3, 1), (12, 1), (14, 2), (15, 1)],
  term ((21107476986721 : Rat) / 241755938487) [(0, 2), (3, 1), (14, 2), (15, 1)],
  term ((-42214953973442 : Rat) / 241755938487) [(1, 1), (3, 1), (13, 1), (14, 2), (15, 1)],
  term ((21107476986721 : Rat) / 241755938487) [(1, 2), (3, 1), (14, 2), (15, 1)],
  term ((42214953973442 : Rat) / 241755938487) [(3, 1), (12, 1), (14, 3), (15, 1)],
  term ((42214953973442 : Rat) / 241755938487) [(3, 1), (13, 1), (14, 2), (15, 2)],
  term ((-21107476986721 : Rat) / 241755938487) [(3, 1), (14, 2), (15, 3)],
  term ((-21107476986721 : Rat) / 241755938487) [(3, 1), (14, 4), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 270 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0270_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0270
        rs_R009_ueqv_R009YNNNN_generator_27_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_27_0270 := by
  native_decide

/-- Coefficient term 271 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0271 : Poly :=
[
  term ((33601888013861513 : Rat) / 5594923147842) [(3, 1), (15, 1)]
]

/-- Partial product 271 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0271 : Poly :=
[
  term ((-33601888013861513 : Rat) / 2797461573921) [(0, 1), (3, 1), (12, 1), (15, 1)],
  term ((33601888013861513 : Rat) / 5594923147842) [(0, 2), (3, 1), (15, 1)],
  term ((-33601888013861513 : Rat) / 2797461573921) [(1, 1), (3, 1), (13, 1), (15, 1)],
  term ((33601888013861513 : Rat) / 5594923147842) [(1, 2), (3, 1), (15, 1)],
  term ((33601888013861513 : Rat) / 2797461573921) [(3, 1), (12, 1), (14, 1), (15, 1)],
  term ((33601888013861513 : Rat) / 2797461573921) [(3, 1), (13, 1), (15, 2)],
  term ((-33601888013861513 : Rat) / 5594923147842) [(3, 1), (14, 2), (15, 1)],
  term ((-33601888013861513 : Rat) / 5594923147842) [(3, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 271 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0271_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0271
        rs_R009_ueqv_R009YNNNN_generator_27_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_27_0271 := by
  native_decide

/-- Coefficient term 272 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0272 : Poly :=
[
  term ((-18643 : Rat) / 252) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 272 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0272 : Poly :=
[
  term ((18643 : Rat) / 126) [(0, 1), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((-18643 : Rat) / 252) [(0, 2), (3, 1), (15, 1), (16, 1)],
  term ((18643 : Rat) / 126) [(1, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term ((-18643 : Rat) / 252) [(1, 2), (3, 1), (15, 1), (16, 1)],
  term ((-18643 : Rat) / 126) [(3, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-18643 : Rat) / 126) [(3, 1), (13, 1), (15, 2), (16, 1)],
  term ((18643 : Rat) / 252) [(3, 1), (14, 2), (15, 1), (16, 1)],
  term ((18643 : Rat) / 252) [(3, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 272 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0272_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0272
        rs_R009_ueqv_R009YNNNN_generator_27_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_27_0272 := by
  native_decide

/-- Coefficient term 273 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0273 : Poly :=
[
  term ((93440 : Rat) / 1029) [(3, 1), (15, 3)]
]

/-- Partial product 273 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0273 : Poly :=
[
  term ((-186880 : Rat) / 1029) [(0, 1), (3, 1), (12, 1), (15, 3)],
  term ((93440 : Rat) / 1029) [(0, 2), (3, 1), (15, 3)],
  term ((-186880 : Rat) / 1029) [(1, 1), (3, 1), (13, 1), (15, 3)],
  term ((93440 : Rat) / 1029) [(1, 2), (3, 1), (15, 3)],
  term ((186880 : Rat) / 1029) [(3, 1), (12, 1), (14, 1), (15, 3)],
  term ((186880 : Rat) / 1029) [(3, 1), (13, 1), (15, 4)],
  term ((-93440 : Rat) / 1029) [(3, 1), (14, 2), (15, 3)],
  term ((-93440 : Rat) / 1029) [(3, 1), (15, 5)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 273 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0273_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0273
        rs_R009_ueqv_R009YNNNN_generator_27_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_27_0273 := by
  native_decide

/-- Coefficient term 274 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0274 : Poly :=
[
  term ((-212387883800078305 : Rat) / 156657848139576) [(3, 2)]
]

/-- Partial product 274 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0274 : Poly :=
[
  term ((212387883800078305 : Rat) / 78328924069788) [(0, 1), (3, 2), (12, 1)],
  term ((-212387883800078305 : Rat) / 156657848139576) [(0, 2), (3, 2)],
  term ((212387883800078305 : Rat) / 78328924069788) [(1, 1), (3, 2), (13, 1)],
  term ((-212387883800078305 : Rat) / 156657848139576) [(1, 2), (3, 2)],
  term ((-212387883800078305 : Rat) / 78328924069788) [(3, 2), (12, 1), (14, 1)],
  term ((-212387883800078305 : Rat) / 78328924069788) [(3, 2), (13, 1), (15, 1)],
  term ((212387883800078305 : Rat) / 156657848139576) [(3, 2), (14, 2)],
  term ((212387883800078305 : Rat) / 156657848139576) [(3, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 274 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0274_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0274
        rs_R009_ueqv_R009YNNNN_generator_27_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_27_0274 := by
  native_decide

/-- Coefficient term 275 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0275 : Poly :=
[
  term ((5406607540071400 : Rat) / 6527410339149) [(3, 2), (6, 1)]
]

/-- Partial product 275 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0275 : Poly :=
[
  term ((-10813215080142800 : Rat) / 6527410339149) [(0, 1), (3, 2), (6, 1), (12, 1)],
  term ((5406607540071400 : Rat) / 6527410339149) [(0, 2), (3, 2), (6, 1)],
  term ((-10813215080142800 : Rat) / 6527410339149) [(1, 1), (3, 2), (6, 1), (13, 1)],
  term ((5406607540071400 : Rat) / 6527410339149) [(1, 2), (3, 2), (6, 1)],
  term ((10813215080142800 : Rat) / 6527410339149) [(3, 2), (6, 1), (12, 1), (14, 1)],
  term ((10813215080142800 : Rat) / 6527410339149) [(3, 2), (6, 1), (13, 1), (15, 1)],
  term ((-5406607540071400 : Rat) / 6527410339149) [(3, 2), (6, 1), (14, 2)],
  term ((-5406607540071400 : Rat) / 6527410339149) [(3, 2), (6, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 275 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0275_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0275
        rs_R009_ueqv_R009YNNNN_generator_27_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_27_0275 := by
  native_decide

/-- Coefficient term 276 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0276 : Poly :=
[
  term ((7127645796266305 : Rat) / 26109641356596) [(3, 2), (10, 1)]
]

/-- Partial product 276 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0276 : Poly :=
[
  term ((-7127645796266305 : Rat) / 13054820678298) [(0, 1), (3, 2), (10, 1), (12, 1)],
  term ((7127645796266305 : Rat) / 26109641356596) [(0, 2), (3, 2), (10, 1)],
  term ((-7127645796266305 : Rat) / 13054820678298) [(1, 1), (3, 2), (10, 1), (13, 1)],
  term ((7127645796266305 : Rat) / 26109641356596) [(1, 2), (3, 2), (10, 1)],
  term ((7127645796266305 : Rat) / 13054820678298) [(3, 2), (10, 1), (12, 1), (14, 1)],
  term ((7127645796266305 : Rat) / 13054820678298) [(3, 2), (10, 1), (13, 1), (15, 1)],
  term ((-7127645796266305 : Rat) / 26109641356596) [(3, 2), (10, 1), (14, 2)],
  term ((-7127645796266305 : Rat) / 26109641356596) [(3, 2), (10, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 276 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0276_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0276
        rs_R009_ueqv_R009YNNNN_generator_27_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_27_0276 := by
  native_decide

/-- Coefficient term 277 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0277 : Poly :=
[
  term ((30487378694759855 : Rat) / 39164462034894) [(3, 2), (14, 1)]
]

/-- Partial product 277 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0277 : Poly :=
[
  term ((-30487378694759855 : Rat) / 19582231017447) [(0, 1), (3, 2), (12, 1), (14, 1)],
  term ((30487378694759855 : Rat) / 39164462034894) [(0, 2), (3, 2), (14, 1)],
  term ((-30487378694759855 : Rat) / 19582231017447) [(1, 1), (3, 2), (13, 1), (14, 1)],
  term ((30487378694759855 : Rat) / 39164462034894) [(1, 2), (3, 2), (14, 1)],
  term ((30487378694759855 : Rat) / 19582231017447) [(3, 2), (12, 1), (14, 2)],
  term ((30487378694759855 : Rat) / 19582231017447) [(3, 2), (13, 1), (14, 1), (15, 1)],
  term ((-30487378694759855 : Rat) / 39164462034894) [(3, 2), (14, 1), (15, 2)],
  term ((-30487378694759855 : Rat) / 39164462034894) [(3, 2), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 277 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0277_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0277
        rs_R009_ueqv_R009YNNNN_generator_27_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_27_0277 := by
  native_decide

/-- Coefficient term 278 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0278 : Poly :=
[
  term ((-8 : Rat) / 3) [(5, 1), (15, 1)]
]

/-- Partial product 278 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0278 : Poly :=
[
  term ((16 : Rat) / 3) [(0, 1), (5, 1), (12, 1), (15, 1)],
  term ((-8 : Rat) / 3) [(0, 2), (5, 1), (15, 1)],
  term ((16 : Rat) / 3) [(1, 1), (5, 1), (13, 1), (15, 1)],
  term ((-8 : Rat) / 3) [(1, 2), (5, 1), (15, 1)],
  term ((-16 : Rat) / 3) [(5, 1), (12, 1), (14, 1), (15, 1)],
  term ((-16 : Rat) / 3) [(5, 1), (13, 1), (15, 2)],
  term ((8 : Rat) / 3) [(5, 1), (14, 2), (15, 1)],
  term ((8 : Rat) / 3) [(5, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 278 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0278_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0278
        rs_R009_ueqv_R009YNNNN_generator_27_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_27_0278 := by
  native_decide

/-- Coefficient term 279 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0279 : Poly :=
[
  term ((2 : Rat) / 3) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 279 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0279 : Poly :=
[
  term ((-4 : Rat) / 3) [(0, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((2 : Rat) / 3) [(0, 2), (5, 1), (15, 1), (16, 1)],
  term ((-4 : Rat) / 3) [(1, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((2 : Rat) / 3) [(1, 2), (5, 1), (15, 1), (16, 1)],
  term ((4 : Rat) / 3) [(5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((4 : Rat) / 3) [(5, 1), (13, 1), (15, 2), (16, 1)],
  term ((-2 : Rat) / 3) [(5, 1), (14, 2), (15, 1), (16, 1)],
  term ((-2 : Rat) / 3) [(5, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 279 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0279_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0279
        rs_R009_ueqv_R009YNNNN_generator_27_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_27_0279 := by
  native_decide

/-- Coefficient term 280 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0280 : Poly :=
[
  term ((3793620922735705 : Rat) / 17406427571064) [(6, 1)]
]

/-- Partial product 280 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0280 : Poly :=
[
  term ((-3793620922735705 : Rat) / 8703213785532) [(0, 1), (6, 1), (12, 1)],
  term ((3793620922735705 : Rat) / 17406427571064) [(0, 2), (6, 1)],
  term ((-3793620922735705 : Rat) / 8703213785532) [(1, 1), (6, 1), (13, 1)],
  term ((3793620922735705 : Rat) / 17406427571064) [(1, 2), (6, 1)],
  term ((3793620922735705 : Rat) / 8703213785532) [(6, 1), (12, 1), (14, 1)],
  term ((3793620922735705 : Rat) / 8703213785532) [(6, 1), (13, 1), (15, 1)],
  term ((-3793620922735705 : Rat) / 17406427571064) [(6, 1), (14, 2)],
  term ((-3793620922735705 : Rat) / 17406427571064) [(6, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 280 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0280_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0280
        rs_R009_ueqv_R009YNNNN_generator_27_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_27_0280 := by
  native_decide

/-- Coefficient term 281 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0281 : Poly :=
[
  term ((14069237787498655 : Rat) / 19582231017447) [(6, 1), (7, 1), (9, 1)]
]

/-- Partial product 281 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0281 : Poly :=
[
  term ((-28138475574997310 : Rat) / 19582231017447) [(0, 1), (6, 1), (7, 1), (9, 1), (12, 1)],
  term ((14069237787498655 : Rat) / 19582231017447) [(0, 2), (6, 1), (7, 1), (9, 1)],
  term ((-28138475574997310 : Rat) / 19582231017447) [(1, 1), (6, 1), (7, 1), (9, 1), (13, 1)],
  term ((14069237787498655 : Rat) / 19582231017447) [(1, 2), (6, 1), (7, 1), (9, 1)],
  term ((28138475574997310 : Rat) / 19582231017447) [(6, 1), (7, 1), (9, 1), (12, 1), (14, 1)],
  term ((28138475574997310 : Rat) / 19582231017447) [(6, 1), (7, 1), (9, 1), (13, 1), (15, 1)],
  term ((-14069237787498655 : Rat) / 19582231017447) [(6, 1), (7, 1), (9, 1), (14, 2)],
  term ((-14069237787498655 : Rat) / 19582231017447) [(6, 1), (7, 1), (9, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 281 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0281_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0281
        rs_R009_ueqv_R009YNNNN_generator_27_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_27_0281 := by
  native_decide

/-- Coefficient term 282 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0282 : Poly :=
[
  term ((-1532199782809 : Rat) / 161170625658) [(6, 1), (7, 1), (9, 1), (12, 1)]
]

/-- Partial product 282 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0282 : Poly :=
[
  term ((1532199782809 : Rat) / 80585312829) [(0, 1), (6, 1), (7, 1), (9, 1), (12, 2)],
  term ((-1532199782809 : Rat) / 161170625658) [(0, 2), (6, 1), (7, 1), (9, 1), (12, 1)],
  term ((1532199782809 : Rat) / 80585312829) [(1, 1), (6, 1), (7, 1), (9, 1), (12, 1), (13, 1)],
  term ((-1532199782809 : Rat) / 161170625658) [(1, 2), (6, 1), (7, 1), (9, 1), (12, 1)],
  term ((-1532199782809 : Rat) / 80585312829) [(6, 1), (7, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((1532199782809 : Rat) / 161170625658) [(6, 1), (7, 1), (9, 1), (12, 1), (14, 2)],
  term ((1532199782809 : Rat) / 161170625658) [(6, 1), (7, 1), (9, 1), (12, 1), (15, 2)],
  term ((-1532199782809 : Rat) / 80585312829) [(6, 1), (7, 1), (9, 1), (12, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 282 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0282_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0282
        rs_R009_ueqv_R009YNNNN_generator_27_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_27_0282 := by
  native_decide

/-- Coefficient term 283 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0283 : Poly :=
[
  term ((-15510895297041142 : Rat) / 6527410339149) [(6, 1), (7, 1), (11, 1)]
]

/-- Partial product 283 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0283 : Poly :=
[
  term ((31021790594082284 : Rat) / 6527410339149) [(0, 1), (6, 1), (7, 1), (11, 1), (12, 1)],
  term ((-15510895297041142 : Rat) / 6527410339149) [(0, 2), (6, 1), (7, 1), (11, 1)],
  term ((31021790594082284 : Rat) / 6527410339149) [(1, 1), (6, 1), (7, 1), (11, 1), (13, 1)],
  term ((-15510895297041142 : Rat) / 6527410339149) [(1, 2), (6, 1), (7, 1), (11, 1)],
  term ((-31021790594082284 : Rat) / 6527410339149) [(6, 1), (7, 1), (11, 1), (12, 1), (14, 1)],
  term ((-31021790594082284 : Rat) / 6527410339149) [(6, 1), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((15510895297041142 : Rat) / 6527410339149) [(6, 1), (7, 1), (11, 1), (14, 2)],
  term ((15510895297041142 : Rat) / 6527410339149) [(6, 1), (7, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 283 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0283_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0283
        rs_R009_ueqv_R009YNNNN_generator_27_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_27_0283 := by
  native_decide

/-- Coefficient term 284 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0284 : Poly :=
[
  term ((-4349915183394751 : Rat) / 13054820678298) [(6, 1), (7, 1), (12, 1), (15, 1)]
]

/-- Partial product 284 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0284 : Poly :=
[
  term ((4349915183394751 : Rat) / 6527410339149) [(0, 1), (6, 1), (7, 1), (12, 2), (15, 1)],
  term ((-4349915183394751 : Rat) / 13054820678298) [(0, 2), (6, 1), (7, 1), (12, 1), (15, 1)],
  term ((4349915183394751 : Rat) / 6527410339149) [(1, 1), (6, 1), (7, 1), (12, 1), (13, 1), (15, 1)],
  term ((-4349915183394751 : Rat) / 13054820678298) [(1, 2), (6, 1), (7, 1), (12, 1), (15, 1)],
  term ((-4349915183394751 : Rat) / 6527410339149) [(6, 1), (7, 1), (12, 1), (13, 1), (15, 2)],
  term ((4349915183394751 : Rat) / 13054820678298) [(6, 1), (7, 1), (12, 1), (14, 2), (15, 1)],
  term ((4349915183394751 : Rat) / 13054820678298) [(6, 1), (7, 1), (12, 1), (15, 3)],
  term ((-4349915183394751 : Rat) / 6527410339149) [(6, 1), (7, 1), (12, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 284 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0284_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0284
        rs_R009_ueqv_R009YNNNN_generator_27_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_27_0284 := by
  native_decide

/-- Coefficient term 285 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0285 : Poly :=
[
  term ((-20449747317017159 : Rat) / 19582231017447) [(6, 1), (7, 1), (13, 1)]
]

/-- Partial product 285 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0285 : Poly :=
[
  term ((40899494634034318 : Rat) / 19582231017447) [(0, 1), (6, 1), (7, 1), (12, 1), (13, 1)],
  term ((-20449747317017159 : Rat) / 19582231017447) [(0, 2), (6, 1), (7, 1), (13, 1)],
  term ((40899494634034318 : Rat) / 19582231017447) [(1, 1), (6, 1), (7, 1), (13, 2)],
  term ((-20449747317017159 : Rat) / 19582231017447) [(1, 2), (6, 1), (7, 1), (13, 1)],
  term ((-40899494634034318 : Rat) / 19582231017447) [(6, 1), (7, 1), (12, 1), (13, 1), (14, 1)],
  term ((20449747317017159 : Rat) / 19582231017447) [(6, 1), (7, 1), (13, 1), (14, 2)],
  term ((20449747317017159 : Rat) / 19582231017447) [(6, 1), (7, 1), (13, 1), (15, 2)],
  term ((-40899494634034318 : Rat) / 19582231017447) [(6, 1), (7, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 285 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0285_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0285
        rs_R009_ueqv_R009YNNNN_generator_27_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_27_0285 := by
  native_decide

/-- Coefficient term 286 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0286 : Poly :=
[
  term ((-170 : Rat) / 63) [(6, 1), (7, 1), (13, 1), (16, 1)]
]

/-- Partial product 286 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0286 : Poly :=
[
  term ((340 : Rat) / 63) [(0, 1), (6, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((-170 : Rat) / 63) [(0, 2), (6, 1), (7, 1), (13, 1), (16, 1)],
  term ((340 : Rat) / 63) [(1, 1), (6, 1), (7, 1), (13, 2), (16, 1)],
  term ((-170 : Rat) / 63) [(1, 2), (6, 1), (7, 1), (13, 1), (16, 1)],
  term ((-340 : Rat) / 63) [(6, 1), (7, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((170 : Rat) / 63) [(6, 1), (7, 1), (13, 1), (14, 2), (16, 1)],
  term ((170 : Rat) / 63) [(6, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-340 : Rat) / 63) [(6, 1), (7, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 286 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0286_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0286
        rs_R009_ueqv_R009YNNNN_generator_27_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_27_0286 := by
  native_decide

/-- Coefficient term 287 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0287 : Poly :=
[
  term ((16666832247991378 : Rat) / 6527410339149) [(6, 1), (7, 1), (15, 1)]
]

/-- Partial product 287 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0287 : Poly :=
[
  term ((-33333664495982756 : Rat) / 6527410339149) [(0, 1), (6, 1), (7, 1), (12, 1), (15, 1)],
  term ((16666832247991378 : Rat) / 6527410339149) [(0, 2), (6, 1), (7, 1), (15, 1)],
  term ((-33333664495982756 : Rat) / 6527410339149) [(1, 1), (6, 1), (7, 1), (13, 1), (15, 1)],
  term ((16666832247991378 : Rat) / 6527410339149) [(1, 2), (6, 1), (7, 1), (15, 1)],
  term ((33333664495982756 : Rat) / 6527410339149) [(6, 1), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((33333664495982756 : Rat) / 6527410339149) [(6, 1), (7, 1), (13, 1), (15, 2)],
  term ((-16666832247991378 : Rat) / 6527410339149) [(6, 1), (7, 1), (14, 2), (15, 1)],
  term ((-16666832247991378 : Rat) / 6527410339149) [(6, 1), (7, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 287 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0287_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0287
        rs_R009_ueqv_R009YNNNN_generator_27_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_27_0287 := by
  native_decide

/-- Coefficient term 288 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0288 : Poly :=
[
  term ((32 : Rat) / 9) [(6, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 288 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0288 : Poly :=
[
  term ((-64 : Rat) / 9) [(0, 1), (6, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((32 : Rat) / 9) [(0, 2), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-64 : Rat) / 9) [(1, 1), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((32 : Rat) / 9) [(1, 2), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((64 : Rat) / 9) [(6, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((64 : Rat) / 9) [(6, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-32 : Rat) / 9) [(6, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((-32 : Rat) / 9) [(6, 1), (7, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 288 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0288_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0288
        rs_R009_ueqv_R009YNNNN_generator_27_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_27_0288 := by
  native_decide

/-- Coefficient term 289 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0289 : Poly :=
[
  term ((691022102046859 : Rat) / 932487191307) [(6, 1), (7, 2)]
]

/-- Partial product 289 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0289 : Poly :=
[
  term ((-1382044204093718 : Rat) / 932487191307) [(0, 1), (6, 1), (7, 2), (12, 1)],
  term ((691022102046859 : Rat) / 932487191307) [(0, 2), (6, 1), (7, 2)],
  term ((-1382044204093718 : Rat) / 932487191307) [(1, 1), (6, 1), (7, 2), (13, 1)],
  term ((691022102046859 : Rat) / 932487191307) [(1, 2), (6, 1), (7, 2)],
  term ((1382044204093718 : Rat) / 932487191307) [(6, 1), (7, 2), (12, 1), (14, 1)],
  term ((1382044204093718 : Rat) / 932487191307) [(6, 1), (7, 2), (13, 1), (15, 1)],
  term ((-691022102046859 : Rat) / 932487191307) [(6, 1), (7, 2), (14, 2)],
  term ((-691022102046859 : Rat) / 932487191307) [(6, 1), (7, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 289 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0289_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0289
        rs_R009_ueqv_R009YNNNN_generator_27_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_27_0289 := by
  native_decide

/-- Coefficient term 290 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0290 : Poly :=
[
  term ((1738032546097067 : Rat) / 799274735406) [(6, 1), (9, 1), (11, 1)]
]

/-- Partial product 290 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0290 : Poly :=
[
  term ((-1738032546097067 : Rat) / 399637367703) [(0, 1), (6, 1), (9, 1), (11, 1), (12, 1)],
  term ((1738032546097067 : Rat) / 799274735406) [(0, 2), (6, 1), (9, 1), (11, 1)],
  term ((-1738032546097067 : Rat) / 399637367703) [(1, 1), (6, 1), (9, 1), (11, 1), (13, 1)],
  term ((1738032546097067 : Rat) / 799274735406) [(1, 2), (6, 1), (9, 1), (11, 1)],
  term ((1738032546097067 : Rat) / 399637367703) [(6, 1), (9, 1), (11, 1), (12, 1), (14, 1)],
  term ((1738032546097067 : Rat) / 399637367703) [(6, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-1738032546097067 : Rat) / 799274735406) [(6, 1), (9, 1), (11, 1), (14, 2)],
  term ((-1738032546097067 : Rat) / 799274735406) [(6, 1), (9, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 290 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0290_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0290
        rs_R009_ueqv_R009YNNNN_generator_27_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_27_0290 := by
  native_decide

/-- Coefficient term 291 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0291 : Poly :=
[
  term ((-119808 : Rat) / 553) [(6, 1), (9, 1), (11, 1), (12, 1)]
]

/-- Partial product 291 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0291 : Poly :=
[
  term ((239616 : Rat) / 553) [(0, 1), (6, 1), (9, 1), (11, 1), (12, 2)],
  term ((-119808 : Rat) / 553) [(0, 2), (6, 1), (9, 1), (11, 1), (12, 1)],
  term ((239616 : Rat) / 553) [(1, 1), (6, 1), (9, 1), (11, 1), (12, 1), (13, 1)],
  term ((-119808 : Rat) / 553) [(1, 2), (6, 1), (9, 1), (11, 1), (12, 1)],
  term ((-239616 : Rat) / 553) [(6, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((119808 : Rat) / 553) [(6, 1), (9, 1), (11, 1), (12, 1), (14, 2)],
  term ((119808 : Rat) / 553) [(6, 1), (9, 1), (11, 1), (12, 1), (15, 2)],
  term ((-239616 : Rat) / 553) [(6, 1), (9, 1), (11, 1), (12, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 291 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0291_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0291
        rs_R009_ueqv_R009YNNNN_generator_27_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_27_0291 := by
  native_decide

/-- Coefficient term 292 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0292 : Poly :=
[
  term ((-941242657 : Rat) / 166541592) [(6, 1), (9, 1), (12, 1), (13, 1)]
]

/-- Partial product 292 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0292 : Poly :=
[
  term ((941242657 : Rat) / 83270796) [(0, 1), (6, 1), (9, 1), (12, 2), (13, 1)],
  term ((-941242657 : Rat) / 166541592) [(0, 2), (6, 1), (9, 1), (12, 1), (13, 1)],
  term ((941242657 : Rat) / 83270796) [(1, 1), (6, 1), (9, 1), (12, 1), (13, 2)],
  term ((-941242657 : Rat) / 166541592) [(1, 2), (6, 1), (9, 1), (12, 1), (13, 1)],
  term ((941242657 : Rat) / 166541592) [(6, 1), (9, 1), (12, 1), (13, 1), (14, 2)],
  term ((941242657 : Rat) / 166541592) [(6, 1), (9, 1), (12, 1), (13, 1), (15, 2)],
  term ((-941242657 : Rat) / 83270796) [(6, 1), (9, 1), (12, 1), (13, 2), (15, 1)],
  term ((-941242657 : Rat) / 83270796) [(6, 1), (9, 1), (12, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 292 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0292_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0292
        rs_R009_ueqv_R009YNNNN_generator_27_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_27_0292 := by
  native_decide

/-- Coefficient term 293 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0293 : Poly :=
[
  term ((-725 : Rat) / 84) [(6, 1), (9, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 293 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0293 : Poly :=
[
  term ((725 : Rat) / 42) [(0, 1), (6, 1), (9, 1), (12, 2), (13, 1), (16, 1)],
  term ((-725 : Rat) / 84) [(0, 2), (6, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((725 : Rat) / 42) [(1, 1), (6, 1), (9, 1), (12, 1), (13, 2), (16, 1)],
  term ((-725 : Rat) / 84) [(1, 2), (6, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((725 : Rat) / 84) [(6, 1), (9, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((725 : Rat) / 84) [(6, 1), (9, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-725 : Rat) / 42) [(6, 1), (9, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-725 : Rat) / 42) [(6, 1), (9, 1), (12, 2), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 293 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0293_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0293
        rs_R009_ueqv_R009YNNNN_generator_27_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_27_0293 := by
  native_decide

/-- Coefficient term 294 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0294 : Poly :=
[
  term ((223016262790904647 : Rat) / 313315696279152) [(6, 1), (9, 1), (12, 1), (15, 1)]
]

/-- Partial product 294 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0294 : Poly :=
[
  term ((-223016262790904647 : Rat) / 156657848139576) [(0, 1), (6, 1), (9, 1), (12, 2), (15, 1)],
  term ((223016262790904647 : Rat) / 313315696279152) [(0, 2), (6, 1), (9, 1), (12, 1), (15, 1)],
  term ((-223016262790904647 : Rat) / 156657848139576) [(1, 1), (6, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((223016262790904647 : Rat) / 313315696279152) [(1, 2), (6, 1), (9, 1), (12, 1), (15, 1)],
  term ((223016262790904647 : Rat) / 156657848139576) [(6, 1), (9, 1), (12, 1), (13, 1), (15, 2)],
  term ((-223016262790904647 : Rat) / 313315696279152) [(6, 1), (9, 1), (12, 1), (14, 2), (15, 1)],
  term ((-223016262790904647 : Rat) / 313315696279152) [(6, 1), (9, 1), (12, 1), (15, 3)],
  term ((223016262790904647 : Rat) / 156657848139576) [(6, 1), (9, 1), (12, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 294 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0294_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0294
        rs_R009_ueqv_R009YNNNN_generator_27_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_27_0294 := by
  native_decide

/-- Coefficient term 295 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0295 : Poly :=
[
  term ((157 : Rat) / 21) [(6, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 295 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0295 : Poly :=
[
  term ((-314 : Rat) / 21) [(0, 1), (6, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((157 : Rat) / 21) [(0, 2), (6, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-314 : Rat) / 21) [(1, 1), (6, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((157 : Rat) / 21) [(1, 2), (6, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((314 : Rat) / 21) [(6, 1), (9, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-157 : Rat) / 21) [(6, 1), (9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-157 : Rat) / 21) [(6, 1), (9, 1), (12, 1), (15, 3), (16, 1)],
  term ((314 : Rat) / 21) [(6, 1), (9, 1), (12, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 295 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0295_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0295
        rs_R009_ueqv_R009YNNNN_generator_27_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_27_0295 := by
  native_decide

/-- Coefficient term 296 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0296 : Poly :=
[
  term ((28296131490755 : Rat) / 40469606856) [(6, 1), (9, 1), (13, 1)]
]

/-- Partial product 296 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0296 : Poly :=
[
  term ((-28296131490755 : Rat) / 20234803428) [(0, 1), (6, 1), (9, 1), (12, 1), (13, 1)],
  term ((28296131490755 : Rat) / 40469606856) [(0, 2), (6, 1), (9, 1), (13, 1)],
  term ((-28296131490755 : Rat) / 20234803428) [(1, 1), (6, 1), (9, 1), (13, 2)],
  term ((28296131490755 : Rat) / 40469606856) [(1, 2), (6, 1), (9, 1), (13, 1)],
  term ((28296131490755 : Rat) / 20234803428) [(6, 1), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((-28296131490755 : Rat) / 40469606856) [(6, 1), (9, 1), (13, 1), (14, 2)],
  term ((-28296131490755 : Rat) / 40469606856) [(6, 1), (9, 1), (13, 1), (15, 2)],
  term ((28296131490755 : Rat) / 20234803428) [(6, 1), (9, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 296 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0296_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0296
        rs_R009_ueqv_R009YNNNN_generator_27_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_27_0296 := by
  native_decide

/-- Coefficient term 297 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0297 : Poly :=
[
  term ((3625 : Rat) / 84) [(6, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 297 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0297 : Poly :=
[
  term ((-3625 : Rat) / 42) [(0, 1), (6, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((3625 : Rat) / 84) [(0, 2), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((-3625 : Rat) / 42) [(1, 1), (6, 1), (9, 1), (13, 2), (16, 1)],
  term ((3625 : Rat) / 84) [(1, 2), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((3625 : Rat) / 42) [(6, 1), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-3625 : Rat) / 84) [(6, 1), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((-3625 : Rat) / 84) [(6, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((3625 : Rat) / 42) [(6, 1), (9, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 297 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0297_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0297
        rs_R009_ueqv_R009YNNNN_generator_27_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_27_0297 := by
  native_decide

/-- Coefficient term 298 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0298 : Poly :=
[
  term ((-233428178880157183 : Rat) / 104438565426384) [(6, 1), (9, 1), (15, 1)]
]

/-- Partial product 298 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0298 : Poly :=
[
  term ((233428178880157183 : Rat) / 52219282713192) [(0, 1), (6, 1), (9, 1), (12, 1), (15, 1)],
  term ((-233428178880157183 : Rat) / 104438565426384) [(0, 2), (6, 1), (9, 1), (15, 1)],
  term ((233428178880157183 : Rat) / 52219282713192) [(1, 1), (6, 1), (9, 1), (13, 1), (15, 1)],
  term ((-233428178880157183 : Rat) / 104438565426384) [(1, 2), (6, 1), (9, 1), (15, 1)],
  term ((-233428178880157183 : Rat) / 52219282713192) [(6, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-233428178880157183 : Rat) / 52219282713192) [(6, 1), (9, 1), (13, 1), (15, 2)],
  term ((233428178880157183 : Rat) / 104438565426384) [(6, 1), (9, 1), (14, 2), (15, 1)],
  term ((233428178880157183 : Rat) / 104438565426384) [(6, 1), (9, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 298 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0298_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0298
        rs_R009_ueqv_R009YNNNN_generator_27_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_27_0298 := by
  native_decide

/-- Coefficient term 299 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009YNNNN_coefficient_27_0299 : Poly :=
[
  term ((-785 : Rat) / 21) [(6, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 299 for generator 27. -/
def rs_R009_ueqv_R009YNNNN_partial_27_0299 : Poly :=
[
  term ((1570 : Rat) / 21) [(0, 1), (6, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-785 : Rat) / 21) [(0, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((1570 : Rat) / 21) [(1, 1), (6, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-785 : Rat) / 21) [(1, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-1570 : Rat) / 21) [(6, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1570 : Rat) / 21) [(6, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((785 : Rat) / 21) [(6, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((785 : Rat) / 21) [(6, 1), (9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 299 for generator 27. -/
theorem rs_R009_ueqv_R009YNNNN_partial_27_0299_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_27_0299
        rs_R009_ueqv_R009YNNNN_generator_27_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_27_0299 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009YNNNN_partials_27_0200_0299 : List Poly :=
[
  rs_R009_ueqv_R009YNNNN_partial_27_0200,
  rs_R009_ueqv_R009YNNNN_partial_27_0201,
  rs_R009_ueqv_R009YNNNN_partial_27_0202,
  rs_R009_ueqv_R009YNNNN_partial_27_0203,
  rs_R009_ueqv_R009YNNNN_partial_27_0204,
  rs_R009_ueqv_R009YNNNN_partial_27_0205,
  rs_R009_ueqv_R009YNNNN_partial_27_0206,
  rs_R009_ueqv_R009YNNNN_partial_27_0207,
  rs_R009_ueqv_R009YNNNN_partial_27_0208,
  rs_R009_ueqv_R009YNNNN_partial_27_0209,
  rs_R009_ueqv_R009YNNNN_partial_27_0210,
  rs_R009_ueqv_R009YNNNN_partial_27_0211,
  rs_R009_ueqv_R009YNNNN_partial_27_0212,
  rs_R009_ueqv_R009YNNNN_partial_27_0213,
  rs_R009_ueqv_R009YNNNN_partial_27_0214,
  rs_R009_ueqv_R009YNNNN_partial_27_0215,
  rs_R009_ueqv_R009YNNNN_partial_27_0216,
  rs_R009_ueqv_R009YNNNN_partial_27_0217,
  rs_R009_ueqv_R009YNNNN_partial_27_0218,
  rs_R009_ueqv_R009YNNNN_partial_27_0219,
  rs_R009_ueqv_R009YNNNN_partial_27_0220,
  rs_R009_ueqv_R009YNNNN_partial_27_0221,
  rs_R009_ueqv_R009YNNNN_partial_27_0222,
  rs_R009_ueqv_R009YNNNN_partial_27_0223,
  rs_R009_ueqv_R009YNNNN_partial_27_0224,
  rs_R009_ueqv_R009YNNNN_partial_27_0225,
  rs_R009_ueqv_R009YNNNN_partial_27_0226,
  rs_R009_ueqv_R009YNNNN_partial_27_0227,
  rs_R009_ueqv_R009YNNNN_partial_27_0228,
  rs_R009_ueqv_R009YNNNN_partial_27_0229,
  rs_R009_ueqv_R009YNNNN_partial_27_0230,
  rs_R009_ueqv_R009YNNNN_partial_27_0231,
  rs_R009_ueqv_R009YNNNN_partial_27_0232,
  rs_R009_ueqv_R009YNNNN_partial_27_0233,
  rs_R009_ueqv_R009YNNNN_partial_27_0234,
  rs_R009_ueqv_R009YNNNN_partial_27_0235,
  rs_R009_ueqv_R009YNNNN_partial_27_0236,
  rs_R009_ueqv_R009YNNNN_partial_27_0237,
  rs_R009_ueqv_R009YNNNN_partial_27_0238,
  rs_R009_ueqv_R009YNNNN_partial_27_0239,
  rs_R009_ueqv_R009YNNNN_partial_27_0240,
  rs_R009_ueqv_R009YNNNN_partial_27_0241,
  rs_R009_ueqv_R009YNNNN_partial_27_0242,
  rs_R009_ueqv_R009YNNNN_partial_27_0243,
  rs_R009_ueqv_R009YNNNN_partial_27_0244,
  rs_R009_ueqv_R009YNNNN_partial_27_0245,
  rs_R009_ueqv_R009YNNNN_partial_27_0246,
  rs_R009_ueqv_R009YNNNN_partial_27_0247,
  rs_R009_ueqv_R009YNNNN_partial_27_0248,
  rs_R009_ueqv_R009YNNNN_partial_27_0249,
  rs_R009_ueqv_R009YNNNN_partial_27_0250,
  rs_R009_ueqv_R009YNNNN_partial_27_0251,
  rs_R009_ueqv_R009YNNNN_partial_27_0252,
  rs_R009_ueqv_R009YNNNN_partial_27_0253,
  rs_R009_ueqv_R009YNNNN_partial_27_0254,
  rs_R009_ueqv_R009YNNNN_partial_27_0255,
  rs_R009_ueqv_R009YNNNN_partial_27_0256,
  rs_R009_ueqv_R009YNNNN_partial_27_0257,
  rs_R009_ueqv_R009YNNNN_partial_27_0258,
  rs_R009_ueqv_R009YNNNN_partial_27_0259,
  rs_R009_ueqv_R009YNNNN_partial_27_0260,
  rs_R009_ueqv_R009YNNNN_partial_27_0261,
  rs_R009_ueqv_R009YNNNN_partial_27_0262,
  rs_R009_ueqv_R009YNNNN_partial_27_0263,
  rs_R009_ueqv_R009YNNNN_partial_27_0264,
  rs_R009_ueqv_R009YNNNN_partial_27_0265,
  rs_R009_ueqv_R009YNNNN_partial_27_0266,
  rs_R009_ueqv_R009YNNNN_partial_27_0267,
  rs_R009_ueqv_R009YNNNN_partial_27_0268,
  rs_R009_ueqv_R009YNNNN_partial_27_0269,
  rs_R009_ueqv_R009YNNNN_partial_27_0270,
  rs_R009_ueqv_R009YNNNN_partial_27_0271,
  rs_R009_ueqv_R009YNNNN_partial_27_0272,
  rs_R009_ueqv_R009YNNNN_partial_27_0273,
  rs_R009_ueqv_R009YNNNN_partial_27_0274,
  rs_R009_ueqv_R009YNNNN_partial_27_0275,
  rs_R009_ueqv_R009YNNNN_partial_27_0276,
  rs_R009_ueqv_R009YNNNN_partial_27_0277,
  rs_R009_ueqv_R009YNNNN_partial_27_0278,
  rs_R009_ueqv_R009YNNNN_partial_27_0279,
  rs_R009_ueqv_R009YNNNN_partial_27_0280,
  rs_R009_ueqv_R009YNNNN_partial_27_0281,
  rs_R009_ueqv_R009YNNNN_partial_27_0282,
  rs_R009_ueqv_R009YNNNN_partial_27_0283,
  rs_R009_ueqv_R009YNNNN_partial_27_0284,
  rs_R009_ueqv_R009YNNNN_partial_27_0285,
  rs_R009_ueqv_R009YNNNN_partial_27_0286,
  rs_R009_ueqv_R009YNNNN_partial_27_0287,
  rs_R009_ueqv_R009YNNNN_partial_27_0288,
  rs_R009_ueqv_R009YNNNN_partial_27_0289,
  rs_R009_ueqv_R009YNNNN_partial_27_0290,
  rs_R009_ueqv_R009YNNNN_partial_27_0291,
  rs_R009_ueqv_R009YNNNN_partial_27_0292,
  rs_R009_ueqv_R009YNNNN_partial_27_0293,
  rs_R009_ueqv_R009YNNNN_partial_27_0294,
  rs_R009_ueqv_R009YNNNN_partial_27_0295,
  rs_R009_ueqv_R009YNNNN_partial_27_0296,
  rs_R009_ueqv_R009YNNNN_partial_27_0297,
  rs_R009_ueqv_R009YNNNN_partial_27_0298,
  rs_R009_ueqv_R009YNNNN_partial_27_0299
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009YNNNN_block_27_0200_0299 : Poly :=
[
  term ((3064399565618 : Rat) / 26861770943) [(0, 1), (2, 1), (3, 1), (12, 1), (14, 1), (15, 1)],
  term ((231195579038557549 : Rat) / 39164462034894) [(0, 1), (2, 1), (3, 1), (12, 1), (15, 1)],
  term ((-3886 : Rat) / 63) [(0, 1), (2, 1), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((-43858889654176910 : Rat) / 19582231017447) [(0, 1), (2, 1), (3, 2), (12, 1)],
  term ((2576683275007571 : Rat) / 1450535630922) [(0, 1), (2, 1), (6, 1), (12, 1)],
  term ((-2488871127710291 : Rat) / 2901071261844) [(0, 1), (2, 1), (6, 1), (12, 1), (14, 1)],
  term ((-69282374274035 : Rat) / 40469606856) [(0, 1), (2, 1), (7, 1), (9, 1), (12, 1)],
  term ((1454632118436379 : Rat) / 1450535630922) [(0, 1), (2, 1), (7, 1), (11, 1), (12, 1)],
  term ((2796461151655097 : Rat) / 1598549470812) [(0, 1), (2, 1), (7, 1), (12, 1), (13, 1)],
  term ((-8525 : Rat) / 126) [(0, 1), (2, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((-67697594944644565 : Rat) / 13054820678298) [(0, 1), (2, 1), (7, 1), (12, 1), (15, 1)],
  term ((3466 : Rat) / 63) [(0, 1), (2, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-16224463500164501 : Rat) / 13054820678298) [(0, 1), (2, 1), (7, 2), (12, 1)],
  term ((67275259872743 : Rat) / 161878427424) [(0, 1), (2, 1), (9, 1), (11, 1), (12, 1)],
  term ((-581604841809017 : Rat) / 161878427424) [(0, 1), (2, 1), (9, 1), (12, 1), (15, 1)],
  term ((-395910373848515 : Rat) / 4351606892766) [(0, 1), (2, 1), (10, 1), (12, 1)],
  term ((-2972412027096341 : Rat) / 6394197883248) [(0, 1), (2, 1), (11, 1), (12, 1), (13, 1)],
  term ((28985 : Rat) / 504) [(0, 1), (2, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((19223968449686125 : Rat) / 2901071261844) [(0, 1), (2, 1), (11, 1), (12, 1), (15, 1)],
  term ((-6137 : Rat) / 126) [(0, 1), (2, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((51436413354355775 : Rat) / 13054820678298) [(0, 1), (2, 1), (11, 2), (12, 1)],
  term ((23975823582991883 : Rat) / 6394197883248) [(0, 1), (2, 1), (12, 1), (13, 1), (15, 1)],
  term ((-28775 : Rat) / 504) [(0, 1), (2, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3866078345790215 : Rat) / 2901071261844) [(0, 1), (2, 1), (12, 1), (14, 1)],
  term ((10143334851217007 : Rat) / 13054820678298) [(0, 1), (2, 1), (12, 1), (14, 2)],
  term ((-54794038719859987 : Rat) / 8703213785532) [(0, 1), (2, 1), (12, 1), (15, 2)],
  term ((5351 : Rat) / 126) [(0, 1), (2, 1), (12, 1), (15, 2), (16, 1)],
  term ((-1063033397773325 : Rat) / 13054820678298) [(0, 1), (2, 2), (12, 1)],
  term ((-1280 : Rat) / 21) [(0, 1), (3, 1), (5, 1), (12, 1)],
  term ((640 : Rat) / 7) [(0, 1), (3, 1), (5, 1), (12, 1), (14, 1)],
  term ((194560 : Rat) / 343) [(0, 1), (3, 1), (5, 1), (12, 1), (15, 2)],
  term ((62554550758679608 : Rat) / 19582231017447) [(0, 1), (3, 1), (6, 1), (7, 1), (12, 1)],
  term ((6788130415625 : Rat) / 3372467238) [(0, 1), (3, 1), (6, 1), (9, 1), (12, 1)],
  term ((-60097568987681768 : Rat) / 19582231017447) [(0, 1), (3, 1), (6, 1), (11, 1), (12, 1)],
  term ((-48487526969875909 : Rat) / 39164462034894) [(0, 1), (3, 1), (6, 1), (12, 1), (13, 1)],
  term ((373760 : Rat) / 3087) [(0, 1), (3, 1), (6, 1), (12, 1), (13, 1), (15, 2)],
  term ((-170 : Rat) / 21) [(0, 1), (3, 1), (6, 1), (12, 1), (13, 1), (16, 1)],
  term ((186880 : Rat) / 3087) [(0, 1), (3, 1), (6, 1), (12, 1), (14, 1), (15, 1)],
  term ((16716349441926325 : Rat) / 13054820678298) [(0, 1), (3, 1), (6, 1), (12, 1), (15, 1)],
  term ((32 : Rat) / 3) [(0, 1), (3, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-747520 : Rat) / 3087) [(0, 1), (3, 1), (6, 1), (12, 1), (15, 3)],
  term ((33944746640006525 : Rat) / 39164462034894) [(0, 1), (3, 1), (6, 1), (12, 2), (15, 1)],
  term ((25000068476225527 : Rat) / 39164462034894) [(0, 1), (3, 1), (7, 1), (10, 1), (12, 1)],
  term ((-480923310623753267 : Rat) / 78328924069788) [(0, 1), (3, 1), (7, 1), (12, 1)],
  term ((7341319116991847 : Rat) / 3729948765228) [(0, 1), (3, 1), (7, 1), (12, 1), (14, 1)],
  term ((747520 : Rat) / 3087) [(0, 1), (3, 1), (7, 1), (12, 1), (14, 1), (15, 2)],
  term ((-186880 : Rat) / 3087) [(0, 1), (3, 1), (7, 1), (12, 1), (15, 2)],
  term ((-33944746640006525 : Rat) / 39164462034894) [(0, 1), (3, 1), (7, 1), (12, 2), (14, 1)],
  term ((-373760 : Rat) / 3087) [(0, 1), (3, 1), (7, 1), (12, 2), (15, 2)],
  term ((10880558480597 : Rat) / 7708496544) [(0, 1), (3, 1), (9, 1), (10, 1), (12, 1)],
  term ((-1015569108576973 : Rat) / 161878427424) [(0, 1), (3, 1), (9, 1), (12, 1)],
  term ((519569467138361 : Rat) / 161878427424) [(0, 1), (3, 1), (9, 1), (12, 1), (14, 1)],
  term ((-97280 : Rat) / 343) [(0, 1), (3, 1), (9, 1), (12, 1), (15, 2)],
  term ((-3707981798324431 : Rat) / 4351606892766) [(0, 1), (3, 1), (10, 1), (11, 1), (12, 1)],
  term ((-3053922743221337 : Rat) / 2131399294416) [(0, 1), (3, 1), (10, 1), (12, 1), (13, 1)],
  term ((3725 : Rat) / 168) [(0, 1), (3, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((165940779078161915 : Rat) / 78328924069788) [(0, 1), (3, 1), (10, 1), (12, 1), (15, 1)],
  term ((-701 : Rat) / 42) [(0, 1), (3, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((174280011147021505 : Rat) / 39164462034894) [(0, 1), (3, 1), (11, 1), (12, 1)],
  term ((-24944916250237507 : Rat) / 5594923147842) [(0, 1), (3, 1), (11, 1), (12, 1), (14, 1)],
  term ((721277507173216153 : Rat) / 104438565426384) [(0, 1), (3, 1), (12, 1), (13, 1)],
  term ((-21646282034496587 : Rat) / 6394197883248) [(0, 1), (3, 1), (12, 1), (13, 1), (14, 1)],
  term ((-373760 : Rat) / 3087) [(0, 1), (3, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((1895 : Rat) / 504) [(0, 1), (3, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((373760 : Rat) / 3087) [(0, 1), (3, 1), (12, 1), (13, 1), (15, 2)],
  term ((-93715 : Rat) / 504) [(0, 1), (3, 1), (12, 1), (13, 1), (16, 1)],
  term ((197608266630175601 : Rat) / 78328924069788) [(0, 1), (3, 1), (12, 1), (14, 1), (15, 1)],
  term ((361 : Rat) / 126) [(0, 1), (3, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-42214953973442 : Rat) / 241755938487) [(0, 1), (3, 1), (12, 1), (14, 2), (15, 1)],
  term ((-33601888013861513 : Rat) / 2797461573921) [(0, 1), (3, 1), (12, 1), (15, 1)],
  term ((18643 : Rat) / 126) [(0, 1), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((-186880 : Rat) / 1029) [(0, 1), (3, 1), (12, 1), (15, 3)],
  term ((-640 : Rat) / 21) [(0, 1), (3, 1), (12, 2), (15, 1)],
  term ((373760 : Rat) / 3087) [(0, 1), (3, 1), (12, 2), (15, 3)],
  term ((-10813215080142800 : Rat) / 6527410339149) [(0, 1), (3, 2), (6, 1), (12, 1)],
  term ((-7127645796266305 : Rat) / 13054820678298) [(0, 1), (3, 2), (10, 1), (12, 1)],
  term ((212387883800078305 : Rat) / 78328924069788) [(0, 1), (3, 2), (12, 1)],
  term ((-30487378694759855 : Rat) / 19582231017447) [(0, 1), (3, 2), (12, 1), (14, 1)],
  term ((16 : Rat) / 3) [(0, 1), (5, 1), (12, 1), (15, 1)],
  term ((-4 : Rat) / 3) [(0, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-28138475574997310 : Rat) / 19582231017447) [(0, 1), (6, 1), (7, 1), (9, 1), (12, 1)],
  term ((1532199782809 : Rat) / 80585312829) [(0, 1), (6, 1), (7, 1), (9, 1), (12, 2)],
  term ((31021790594082284 : Rat) / 6527410339149) [(0, 1), (6, 1), (7, 1), (11, 1), (12, 1)],
  term ((40899494634034318 : Rat) / 19582231017447) [(0, 1), (6, 1), (7, 1), (12, 1), (13, 1)],
  term ((340 : Rat) / 63) [(0, 1), (6, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((-33333664495982756 : Rat) / 6527410339149) [(0, 1), (6, 1), (7, 1), (12, 1), (15, 1)],
  term ((-64 : Rat) / 9) [(0, 1), (6, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((4349915183394751 : Rat) / 6527410339149) [(0, 1), (6, 1), (7, 1), (12, 2), (15, 1)],
  term ((-1382044204093718 : Rat) / 932487191307) [(0, 1), (6, 1), (7, 2), (12, 1)],
  term ((-1738032546097067 : Rat) / 399637367703) [(0, 1), (6, 1), (9, 1), (11, 1), (12, 1)],
  term ((239616 : Rat) / 553) [(0, 1), (6, 1), (9, 1), (11, 1), (12, 2)],
  term ((-28296131490755 : Rat) / 20234803428) [(0, 1), (6, 1), (9, 1), (12, 1), (13, 1)],
  term ((-3625 : Rat) / 42) [(0, 1), (6, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((233428178880157183 : Rat) / 52219282713192) [(0, 1), (6, 1), (9, 1), (12, 1), (15, 1)],
  term ((1570 : Rat) / 21) [(0, 1), (6, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((941242657 : Rat) / 83270796) [(0, 1), (6, 1), (9, 1), (12, 2), (13, 1)],
  term ((725 : Rat) / 42) [(0, 1), (6, 1), (9, 1), (12, 2), (13, 1), (16, 1)],
  term ((-223016262790904647 : Rat) / 156657848139576) [(0, 1), (6, 1), (9, 1), (12, 2), (15, 1)],
  term ((-314 : Rat) / 21) [(0, 1), (6, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-3793620922735705 : Rat) / 8703213785532) [(0, 1), (6, 1), (12, 1)],
  term ((-1532199782809 : Rat) / 26861770943) [(0, 2), (2, 1), (3, 1), (14, 1), (15, 1)],
  term ((-231195579038557549 : Rat) / 78328924069788) [(0, 2), (2, 1), (3, 1), (15, 1)],
  term ((1943 : Rat) / 63) [(0, 2), (2, 1), (3, 1), (15, 1), (16, 1)],
  term ((21929444827088455 : Rat) / 19582231017447) [(0, 2), (2, 1), (3, 2)],
  term ((-2576683275007571 : Rat) / 2901071261844) [(0, 2), (2, 1), (6, 1)],
  term ((2488871127710291 : Rat) / 5802142523688) [(0, 2), (2, 1), (6, 1), (14, 1)],
  term ((69282374274035 : Rat) / 80939213712) [(0, 2), (2, 1), (7, 1), (9, 1)],
  term ((-1454632118436379 : Rat) / 2901071261844) [(0, 2), (2, 1), (7, 1), (11, 1)],
  term ((-2796461151655097 : Rat) / 3197098941624) [(0, 2), (2, 1), (7, 1), (13, 1)],
  term ((8525 : Rat) / 252) [(0, 2), (2, 1), (7, 1), (13, 1), (16, 1)],
  term ((67697594944644565 : Rat) / 26109641356596) [(0, 2), (2, 1), (7, 1), (15, 1)],
  term ((-1733 : Rat) / 63) [(0, 2), (2, 1), (7, 1), (15, 1), (16, 1)],
  term ((16224463500164501 : Rat) / 26109641356596) [(0, 2), (2, 1), (7, 2)],
  term ((-67275259872743 : Rat) / 323756854848) [(0, 2), (2, 1), (9, 1), (11, 1)],
  term ((581604841809017 : Rat) / 323756854848) [(0, 2), (2, 1), (9, 1), (15, 1)],
  term ((395910373848515 : Rat) / 8703213785532) [(0, 2), (2, 1), (10, 1)],
  term ((2972412027096341 : Rat) / 12788395766496) [(0, 2), (2, 1), (11, 1), (13, 1)],
  term ((-28985 : Rat) / 1008) [(0, 2), (2, 1), (11, 1), (13, 1), (16, 1)],
  term ((-19223968449686125 : Rat) / 5802142523688) [(0, 2), (2, 1), (11, 1), (15, 1)],
  term ((6137 : Rat) / 252) [(0, 2), (2, 1), (11, 1), (15, 1), (16, 1)],
  term ((-51436413354355775 : Rat) / 26109641356596) [(0, 2), (2, 1), (11, 2)],
  term ((-23975823582991883 : Rat) / 12788395766496) [(0, 2), (2, 1), (13, 1), (15, 1)],
  term ((28775 : Rat) / 1008) [(0, 2), (2, 1), (13, 1), (15, 1), (16, 1)],
  term ((3866078345790215 : Rat) / 5802142523688) [(0, 2), (2, 1), (14, 1)],
  term ((-10143334851217007 : Rat) / 26109641356596) [(0, 2), (2, 1), (14, 2)],
  term ((54794038719859987 : Rat) / 17406427571064) [(0, 2), (2, 1), (15, 2)],
  term ((-5351 : Rat) / 252) [(0, 2), (2, 1), (15, 2), (16, 1)],
  term ((1063033397773325 : Rat) / 26109641356596) [(0, 2), (2, 2)],
  term ((640 : Rat) / 21) [(0, 2), (3, 1), (5, 1)],
  term ((-320 : Rat) / 7) [(0, 2), (3, 1), (5, 1), (14, 1)],
  term ((-97280 : Rat) / 343) [(0, 2), (3, 1), (5, 1), (15, 2)],
  term ((-31277275379339804 : Rat) / 19582231017447) [(0, 2), (3, 1), (6, 1), (7, 1)],
  term ((-6788130415625 : Rat) / 6744934476) [(0, 2), (3, 1), (6, 1), (9, 1)],
  term ((30048784493840884 : Rat) / 19582231017447) [(0, 2), (3, 1), (6, 1), (11, 1)],
  term ((-33944746640006525 : Rat) / 78328924069788) [(0, 2), (3, 1), (6, 1), (12, 1), (15, 1)],
  term ((48487526969875909 : Rat) / 78328924069788) [(0, 2), (3, 1), (6, 1), (13, 1)],
  term ((-186880 : Rat) / 3087) [(0, 2), (3, 1), (6, 1), (13, 1), (15, 2)],
  term ((85 : Rat) / 21) [(0, 2), (3, 1), (6, 1), (13, 1), (16, 1)],
  term ((-93440 : Rat) / 3087) [(0, 2), (3, 1), (6, 1), (14, 1), (15, 1)],
  term ((-16716349441926325 : Rat) / 26109641356596) [(0, 2), (3, 1), (6, 1), (15, 1)],
  term ((-16 : Rat) / 3) [(0, 2), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((373760 : Rat) / 3087) [(0, 2), (3, 1), (6, 1), (15, 3)],
  term ((480923310623753267 : Rat) / 156657848139576) [(0, 2), (3, 1), (7, 1)],
  term ((-25000068476225527 : Rat) / 78328924069788) [(0, 2), (3, 1), (7, 1), (10, 1)],
  term ((33944746640006525 : Rat) / 78328924069788) [(0, 2), (3, 1), (7, 1), (12, 1), (14, 1)],
  term ((186880 : Rat) / 3087) [(0, 2), (3, 1), (7, 1), (12, 1), (15, 2)],
  term ((-7341319116991847 : Rat) / 7459897530456) [(0, 2), (3, 1), (7, 1), (14, 1)],
  term ((-373760 : Rat) / 3087) [(0, 2), (3, 1), (7, 1), (14, 1), (15, 2)],
  term ((93440 : Rat) / 3087) [(0, 2), (3, 1), (7, 1), (15, 2)],
  term ((1015569108576973 : Rat) / 323756854848) [(0, 2), (3, 1), (9, 1)],
  term ((-10880558480597 : Rat) / 15416993088) [(0, 2), (3, 1), (9, 1), (10, 1)],
  term ((-519569467138361 : Rat) / 323756854848) [(0, 2), (3, 1), (9, 1), (14, 1)],
  term ((48640 : Rat) / 343) [(0, 2), (3, 1), (9, 1), (15, 2)],
  term ((3707981798324431 : Rat) / 8703213785532) [(0, 2), (3, 1), (10, 1), (11, 1)],
  term ((3053922743221337 : Rat) / 4262798588832) [(0, 2), (3, 1), (10, 1), (13, 1)],
  term ((-3725 : Rat) / 336) [(0, 2), (3, 1), (10, 1), (13, 1), (16, 1)],
  term ((-165940779078161915 : Rat) / 156657848139576) [(0, 2), (3, 1), (10, 1), (15, 1)],
  term ((701 : Rat) / 84) [(0, 2), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((-174280011147021505 : Rat) / 78328924069788) [(0, 2), (3, 1), (11, 1)],
  term ((24944916250237507 : Rat) / 11189846295684) [(0, 2), (3, 1), (11, 1), (14, 1)],
  term ((320 : Rat) / 21) [(0, 2), (3, 1), (12, 1), (15, 1)],
  term ((-186880 : Rat) / 3087) [(0, 2), (3, 1), (12, 1), (15, 3)],
  term ((-721277507173216153 : Rat) / 208877130852768) [(0, 2), (3, 1), (13, 1)],
  term ((21646282034496587 : Rat) / 12788395766496) [(0, 2), (3, 1), (13, 1), (14, 1)],
  term ((186880 : Rat) / 3087) [(0, 2), (3, 1), (13, 1), (14, 1), (15, 2)],
  term ((-1895 : Rat) / 1008) [(0, 2), (3, 1), (13, 1), (14, 1), (16, 1)],
  term ((-186880 : Rat) / 3087) [(0, 2), (3, 1), (13, 1), (15, 2)],
  term ((93715 : Rat) / 1008) [(0, 2), (3, 1), (13, 1), (16, 1)],
  term ((-197608266630175601 : Rat) / 156657848139576) [(0, 2), (3, 1), (14, 1), (15, 1)],
  term ((-361 : Rat) / 252) [(0, 2), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((21107476986721 : Rat) / 241755938487) [(0, 2), (3, 1), (14, 2), (15, 1)],
  term ((33601888013861513 : Rat) / 5594923147842) [(0, 2), (3, 1), (15, 1)],
  term ((-18643 : Rat) / 252) [(0, 2), (3, 1), (15, 1), (16, 1)],
  term ((93440 : Rat) / 1029) [(0, 2), (3, 1), (15, 3)],
  term ((-212387883800078305 : Rat) / 156657848139576) [(0, 2), (3, 2)],
  term ((5406607540071400 : Rat) / 6527410339149) [(0, 2), (3, 2), (6, 1)],
  term ((7127645796266305 : Rat) / 26109641356596) [(0, 2), (3, 2), (10, 1)],
  term ((30487378694759855 : Rat) / 39164462034894) [(0, 2), (3, 2), (14, 1)],
  term ((-8 : Rat) / 3) [(0, 2), (5, 1), (15, 1)],
  term ((2 : Rat) / 3) [(0, 2), (5, 1), (15, 1), (16, 1)],
  term ((3793620922735705 : Rat) / 17406427571064) [(0, 2), (6, 1)],
  term ((14069237787498655 : Rat) / 19582231017447) [(0, 2), (6, 1), (7, 1), (9, 1)],
  term ((-1532199782809 : Rat) / 161170625658) [(0, 2), (6, 1), (7, 1), (9, 1), (12, 1)],
  term ((-15510895297041142 : Rat) / 6527410339149) [(0, 2), (6, 1), (7, 1), (11, 1)],
  term ((-4349915183394751 : Rat) / 13054820678298) [(0, 2), (6, 1), (7, 1), (12, 1), (15, 1)],
  term ((-20449747317017159 : Rat) / 19582231017447) [(0, 2), (6, 1), (7, 1), (13, 1)],
  term ((-170 : Rat) / 63) [(0, 2), (6, 1), (7, 1), (13, 1), (16, 1)],
  term ((16666832247991378 : Rat) / 6527410339149) [(0, 2), (6, 1), (7, 1), (15, 1)],
  term ((32 : Rat) / 9) [(0, 2), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((691022102046859 : Rat) / 932487191307) [(0, 2), (6, 1), (7, 2)],
  term ((1738032546097067 : Rat) / 799274735406) [(0, 2), (6, 1), (9, 1), (11, 1)],
  term ((-119808 : Rat) / 553) [(0, 2), (6, 1), (9, 1), (11, 1), (12, 1)],
  term ((-941242657 : Rat) / 166541592) [(0, 2), (6, 1), (9, 1), (12, 1), (13, 1)],
  term ((-725 : Rat) / 84) [(0, 2), (6, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((223016262790904647 : Rat) / 313315696279152) [(0, 2), (6, 1), (9, 1), (12, 1), (15, 1)],
  term ((157 : Rat) / 21) [(0, 2), (6, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((28296131490755 : Rat) / 40469606856) [(0, 2), (6, 1), (9, 1), (13, 1)],
  term ((3625 : Rat) / 84) [(0, 2), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((-233428178880157183 : Rat) / 104438565426384) [(0, 2), (6, 1), (9, 1), (15, 1)],
  term ((-785 : Rat) / 21) [(0, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(1, 1), (2, 1), (3, 1), (13, 1), (14, 1), (15, 1)],
  term ((231195579038557549 : Rat) / 39164462034894) [(1, 1), (2, 1), (3, 1), (13, 1), (15, 1)],
  term ((-3886 : Rat) / 63) [(1, 1), (2, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term ((-43858889654176910 : Rat) / 19582231017447) [(1, 1), (2, 1), (3, 2), (13, 1)],
  term ((2576683275007571 : Rat) / 1450535630922) [(1, 1), (2, 1), (6, 1), (13, 1)],
  term ((-2488871127710291 : Rat) / 2901071261844) [(1, 1), (2, 1), (6, 1), (13, 1), (14, 1)],
  term ((-69282374274035 : Rat) / 40469606856) [(1, 1), (2, 1), (7, 1), (9, 1), (13, 1)],
  term ((1454632118436379 : Rat) / 1450535630922) [(1, 1), (2, 1), (7, 1), (11, 1), (13, 1)],
  term ((-67697594944644565 : Rat) / 13054820678298) [(1, 1), (2, 1), (7, 1), (13, 1), (15, 1)],
  term ((3466 : Rat) / 63) [(1, 1), (2, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((2796461151655097 : Rat) / 1598549470812) [(1, 1), (2, 1), (7, 1), (13, 2)],
  term ((-8525 : Rat) / 126) [(1, 1), (2, 1), (7, 1), (13, 2), (16, 1)],
  term ((-16224463500164501 : Rat) / 13054820678298) [(1, 1), (2, 1), (7, 2), (13, 1)],
  term ((67275259872743 : Rat) / 161878427424) [(1, 1), (2, 1), (9, 1), (11, 1), (13, 1)],
  term ((-581604841809017 : Rat) / 161878427424) [(1, 1), (2, 1), (9, 1), (13, 1), (15, 1)],
  term ((-395910373848515 : Rat) / 4351606892766) [(1, 1), (2, 1), (10, 1), (13, 1)],
  term ((19223968449686125 : Rat) / 2901071261844) [(1, 1), (2, 1), (11, 1), (13, 1), (15, 1)],
  term ((-6137 : Rat) / 126) [(1, 1), (2, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2972412027096341 : Rat) / 6394197883248) [(1, 1), (2, 1), (11, 1), (13, 2)],
  term ((28985 : Rat) / 504) [(1, 1), (2, 1), (11, 1), (13, 2), (16, 1)],
  term ((51436413354355775 : Rat) / 13054820678298) [(1, 1), (2, 1), (11, 2), (13, 1)],
  term ((-3866078345790215 : Rat) / 2901071261844) [(1, 1), (2, 1), (13, 1), (14, 1)],
  term ((10143334851217007 : Rat) / 13054820678298) [(1, 1), (2, 1), (13, 1), (14, 2)],
  term ((-54794038719859987 : Rat) / 8703213785532) [(1, 1), (2, 1), (13, 1), (15, 2)],
  term ((5351 : Rat) / 126) [(1, 1), (2, 1), (13, 1), (15, 2), (16, 1)],
  term ((23975823582991883 : Rat) / 6394197883248) [(1, 1), (2, 1), (13, 2), (15, 1)],
  term ((-28775 : Rat) / 504) [(1, 1), (2, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1063033397773325 : Rat) / 13054820678298) [(1, 1), (2, 2), (13, 1)],
  term ((-1280 : Rat) / 21) [(1, 1), (3, 1), (5, 1), (13, 1)],
  term ((640 : Rat) / 7) [(1, 1), (3, 1), (5, 1), (13, 1), (14, 1)],
  term ((194560 : Rat) / 343) [(1, 1), (3, 1), (5, 1), (13, 1), (15, 2)],
  term ((62554550758679608 : Rat) / 19582231017447) [(1, 1), (3, 1), (6, 1), (7, 1), (13, 1)],
  term ((6788130415625 : Rat) / 3372467238) [(1, 1), (3, 1), (6, 1), (9, 1), (13, 1)],
  term ((-60097568987681768 : Rat) / 19582231017447) [(1, 1), (3, 1), (6, 1), (11, 1), (13, 1)],
  term ((33944746640006525 : Rat) / 39164462034894) [(1, 1), (3, 1), (6, 1), (12, 1), (13, 1), (15, 1)],
  term ((186880 : Rat) / 3087) [(1, 1), (3, 1), (6, 1), (13, 1), (14, 1), (15, 1)],
  term ((16716349441926325 : Rat) / 13054820678298) [(1, 1), (3, 1), (6, 1), (13, 1), (15, 1)],
  term ((32 : Rat) / 3) [(1, 1), (3, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-747520 : Rat) / 3087) [(1, 1), (3, 1), (6, 1), (13, 1), (15, 3)],
  term ((-48487526969875909 : Rat) / 39164462034894) [(1, 1), (3, 1), (6, 1), (13, 2)],
  term ((373760 : Rat) / 3087) [(1, 1), (3, 1), (6, 1), (13, 2), (15, 2)],
  term ((-170 : Rat) / 21) [(1, 1), (3, 1), (6, 1), (13, 2), (16, 1)],
  term ((25000068476225527 : Rat) / 39164462034894) [(1, 1), (3, 1), (7, 1), (10, 1), (13, 1)],
  term ((-33944746640006525 : Rat) / 39164462034894) [(1, 1), (3, 1), (7, 1), (12, 1), (13, 1), (14, 1)],
  term ((-373760 : Rat) / 3087) [(1, 1), (3, 1), (7, 1), (12, 1), (13, 1), (15, 2)],
  term ((-480923310623753267 : Rat) / 78328924069788) [(1, 1), (3, 1), (7, 1), (13, 1)],
  term ((7341319116991847 : Rat) / 3729948765228) [(1, 1), (3, 1), (7, 1), (13, 1), (14, 1)],
  term ((747520 : Rat) / 3087) [(1, 1), (3, 1), (7, 1), (13, 1), (14, 1), (15, 2)],
  term ((-186880 : Rat) / 3087) [(1, 1), (3, 1), (7, 1), (13, 1), (15, 2)],
  term ((10880558480597 : Rat) / 7708496544) [(1, 1), (3, 1), (9, 1), (10, 1), (13, 1)],
  term ((-1015569108576973 : Rat) / 161878427424) [(1, 1), (3, 1), (9, 1), (13, 1)],
  term ((519569467138361 : Rat) / 161878427424) [(1, 1), (3, 1), (9, 1), (13, 1), (14, 1)],
  term ((-97280 : Rat) / 343) [(1, 1), (3, 1), (9, 1), (13, 1), (15, 2)],
  term ((-3707981798324431 : Rat) / 4351606892766) [(1, 1), (3, 1), (10, 1), (11, 1), (13, 1)],
  term ((165940779078161915 : Rat) / 78328924069788) [(1, 1), (3, 1), (10, 1), (13, 1), (15, 1)],
  term ((-701 : Rat) / 42) [(1, 1), (3, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3053922743221337 : Rat) / 2131399294416) [(1, 1), (3, 1), (10, 1), (13, 2)],
  term ((3725 : Rat) / 168) [(1, 1), (3, 1), (10, 1), (13, 2), (16, 1)],
  term ((174280011147021505 : Rat) / 39164462034894) [(1, 1), (3, 1), (11, 1), (13, 1)],
  term ((-24944916250237507 : Rat) / 5594923147842) [(1, 1), (3, 1), (11, 1), (13, 1), (14, 1)],
  term ((-640 : Rat) / 21) [(1, 1), (3, 1), (12, 1), (13, 1), (15, 1)],
  term ((373760 : Rat) / 3087) [(1, 1), (3, 1), (12, 1), (13, 1), (15, 3)],
  term ((197608266630175601 : Rat) / 78328924069788) [(1, 1), (3, 1), (13, 1), (14, 1), (15, 1)],
  term ((361 : Rat) / 126) [(1, 1), (3, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-42214953973442 : Rat) / 241755938487) [(1, 1), (3, 1), (13, 1), (14, 2), (15, 1)],
  term ((-33601888013861513 : Rat) / 2797461573921) [(1, 1), (3, 1), (13, 1), (15, 1)],
  term ((18643 : Rat) / 126) [(1, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term ((-186880 : Rat) / 1029) [(1, 1), (3, 1), (13, 1), (15, 3)],
  term ((721277507173216153 : Rat) / 104438565426384) [(1, 1), (3, 1), (13, 2)],
  term ((-21646282034496587 : Rat) / 6394197883248) [(1, 1), (3, 1), (13, 2), (14, 1)],
  term ((-373760 : Rat) / 3087) [(1, 1), (3, 1), (13, 2), (14, 1), (15, 2)],
  term ((1895 : Rat) / 504) [(1, 1), (3, 1), (13, 2), (14, 1), (16, 1)],
  term ((373760 : Rat) / 3087) [(1, 1), (3, 1), (13, 2), (15, 2)],
  term ((-93715 : Rat) / 504) [(1, 1), (3, 1), (13, 2), (16, 1)],
  term ((-10813215080142800 : Rat) / 6527410339149) [(1, 1), (3, 2), (6, 1), (13, 1)],
  term ((-7127645796266305 : Rat) / 13054820678298) [(1, 1), (3, 2), (10, 1), (13, 1)],
  term ((212387883800078305 : Rat) / 78328924069788) [(1, 1), (3, 2), (13, 1)],
  term ((-30487378694759855 : Rat) / 19582231017447) [(1, 1), (3, 2), (13, 1), (14, 1)],
  term ((16 : Rat) / 3) [(1, 1), (5, 1), (13, 1), (15, 1)],
  term ((-4 : Rat) / 3) [(1, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((1532199782809 : Rat) / 80585312829) [(1, 1), (6, 1), (7, 1), (9, 1), (12, 1), (13, 1)],
  term ((-28138475574997310 : Rat) / 19582231017447) [(1, 1), (6, 1), (7, 1), (9, 1), (13, 1)],
  term ((31021790594082284 : Rat) / 6527410339149) [(1, 1), (6, 1), (7, 1), (11, 1), (13, 1)],
  term ((4349915183394751 : Rat) / 6527410339149) [(1, 1), (6, 1), (7, 1), (12, 1), (13, 1), (15, 1)],
  term ((-33333664495982756 : Rat) / 6527410339149) [(1, 1), (6, 1), (7, 1), (13, 1), (15, 1)],
  term ((-64 : Rat) / 9) [(1, 1), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((40899494634034318 : Rat) / 19582231017447) [(1, 1), (6, 1), (7, 1), (13, 2)],
  term ((340 : Rat) / 63) [(1, 1), (6, 1), (7, 1), (13, 2), (16, 1)],
  term ((-1382044204093718 : Rat) / 932487191307) [(1, 1), (6, 1), (7, 2), (13, 1)],
  term ((239616 : Rat) / 553) [(1, 1), (6, 1), (9, 1), (11, 1), (12, 1), (13, 1)],
  term ((-1738032546097067 : Rat) / 399637367703) [(1, 1), (6, 1), (9, 1), (11, 1), (13, 1)],
  term ((-223016262790904647 : Rat) / 156657848139576) [(1, 1), (6, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((-314 : Rat) / 21) [(1, 1), (6, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((941242657 : Rat) / 83270796) [(1, 1), (6, 1), (9, 1), (12, 1), (13, 2)],
  term ((725 : Rat) / 42) [(1, 1), (6, 1), (9, 1), (12, 1), (13, 2), (16, 1)],
  term ((233428178880157183 : Rat) / 52219282713192) [(1, 1), (6, 1), (9, 1), (13, 1), (15, 1)],
  term ((1570 : Rat) / 21) [(1, 1), (6, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-28296131490755 : Rat) / 20234803428) [(1, 1), (6, 1), (9, 1), (13, 2)],
  term ((-3625 : Rat) / 42) [(1, 1), (6, 1), (9, 1), (13, 2), (16, 1)],
  term ((-3793620922735705 : Rat) / 8703213785532) [(1, 1), (6, 1), (13, 1)],
  term ((-1532199782809 : Rat) / 26861770943) [(1, 2), (2, 1), (3, 1), (14, 1), (15, 1)],
  term ((-231195579038557549 : Rat) / 78328924069788) [(1, 2), (2, 1), (3, 1), (15, 1)],
  term ((1943 : Rat) / 63) [(1, 2), (2, 1), (3, 1), (15, 1), (16, 1)],
  term ((21929444827088455 : Rat) / 19582231017447) [(1, 2), (2, 1), (3, 2)],
  term ((-2576683275007571 : Rat) / 2901071261844) [(1, 2), (2, 1), (6, 1)],
  term ((2488871127710291 : Rat) / 5802142523688) [(1, 2), (2, 1), (6, 1), (14, 1)],
  term ((69282374274035 : Rat) / 80939213712) [(1, 2), (2, 1), (7, 1), (9, 1)],
  term ((-1454632118436379 : Rat) / 2901071261844) [(1, 2), (2, 1), (7, 1), (11, 1)],
  term ((-2796461151655097 : Rat) / 3197098941624) [(1, 2), (2, 1), (7, 1), (13, 1)],
  term ((8525 : Rat) / 252) [(1, 2), (2, 1), (7, 1), (13, 1), (16, 1)],
  term ((67697594944644565 : Rat) / 26109641356596) [(1, 2), (2, 1), (7, 1), (15, 1)],
  term ((-1733 : Rat) / 63) [(1, 2), (2, 1), (7, 1), (15, 1), (16, 1)],
  term ((16224463500164501 : Rat) / 26109641356596) [(1, 2), (2, 1), (7, 2)],
  term ((-67275259872743 : Rat) / 323756854848) [(1, 2), (2, 1), (9, 1), (11, 1)],
  term ((581604841809017 : Rat) / 323756854848) [(1, 2), (2, 1), (9, 1), (15, 1)],
  term ((395910373848515 : Rat) / 8703213785532) [(1, 2), (2, 1), (10, 1)],
  term ((2972412027096341 : Rat) / 12788395766496) [(1, 2), (2, 1), (11, 1), (13, 1)],
  term ((-28985 : Rat) / 1008) [(1, 2), (2, 1), (11, 1), (13, 1), (16, 1)],
  term ((-19223968449686125 : Rat) / 5802142523688) [(1, 2), (2, 1), (11, 1), (15, 1)],
  term ((6137 : Rat) / 252) [(1, 2), (2, 1), (11, 1), (15, 1), (16, 1)],
  term ((-51436413354355775 : Rat) / 26109641356596) [(1, 2), (2, 1), (11, 2)],
  term ((-23975823582991883 : Rat) / 12788395766496) [(1, 2), (2, 1), (13, 1), (15, 1)],
  term ((28775 : Rat) / 1008) [(1, 2), (2, 1), (13, 1), (15, 1), (16, 1)],
  term ((3866078345790215 : Rat) / 5802142523688) [(1, 2), (2, 1), (14, 1)],
  term ((-10143334851217007 : Rat) / 26109641356596) [(1, 2), (2, 1), (14, 2)],
  term ((54794038719859987 : Rat) / 17406427571064) [(1, 2), (2, 1), (15, 2)],
  term ((-5351 : Rat) / 252) [(1, 2), (2, 1), (15, 2), (16, 1)],
  term ((1063033397773325 : Rat) / 26109641356596) [(1, 2), (2, 2)],
  term ((640 : Rat) / 21) [(1, 2), (3, 1), (5, 1)],
  term ((-320 : Rat) / 7) [(1, 2), (3, 1), (5, 1), (14, 1)],
  term ((-97280 : Rat) / 343) [(1, 2), (3, 1), (5, 1), (15, 2)],
  term ((-31277275379339804 : Rat) / 19582231017447) [(1, 2), (3, 1), (6, 1), (7, 1)],
  term ((-6788130415625 : Rat) / 6744934476) [(1, 2), (3, 1), (6, 1), (9, 1)],
  term ((30048784493840884 : Rat) / 19582231017447) [(1, 2), (3, 1), (6, 1), (11, 1)],
  term ((-33944746640006525 : Rat) / 78328924069788) [(1, 2), (3, 1), (6, 1), (12, 1), (15, 1)],
  term ((48487526969875909 : Rat) / 78328924069788) [(1, 2), (3, 1), (6, 1), (13, 1)],
  term ((-186880 : Rat) / 3087) [(1, 2), (3, 1), (6, 1), (13, 1), (15, 2)],
  term ((85 : Rat) / 21) [(1, 2), (3, 1), (6, 1), (13, 1), (16, 1)],
  term ((-93440 : Rat) / 3087) [(1, 2), (3, 1), (6, 1), (14, 1), (15, 1)],
  term ((-16716349441926325 : Rat) / 26109641356596) [(1, 2), (3, 1), (6, 1), (15, 1)],
  term ((-16 : Rat) / 3) [(1, 2), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((373760 : Rat) / 3087) [(1, 2), (3, 1), (6, 1), (15, 3)],
  term ((480923310623753267 : Rat) / 156657848139576) [(1, 2), (3, 1), (7, 1)],
  term ((-25000068476225527 : Rat) / 78328924069788) [(1, 2), (3, 1), (7, 1), (10, 1)],
  term ((33944746640006525 : Rat) / 78328924069788) [(1, 2), (3, 1), (7, 1), (12, 1), (14, 1)],
  term ((186880 : Rat) / 3087) [(1, 2), (3, 1), (7, 1), (12, 1), (15, 2)],
  term ((-7341319116991847 : Rat) / 7459897530456) [(1, 2), (3, 1), (7, 1), (14, 1)],
  term ((-373760 : Rat) / 3087) [(1, 2), (3, 1), (7, 1), (14, 1), (15, 2)],
  term ((93440 : Rat) / 3087) [(1, 2), (3, 1), (7, 1), (15, 2)],
  term ((1015569108576973 : Rat) / 323756854848) [(1, 2), (3, 1), (9, 1)],
  term ((-10880558480597 : Rat) / 15416993088) [(1, 2), (3, 1), (9, 1), (10, 1)],
  term ((-519569467138361 : Rat) / 323756854848) [(1, 2), (3, 1), (9, 1), (14, 1)],
  term ((48640 : Rat) / 343) [(1, 2), (3, 1), (9, 1), (15, 2)],
  term ((3707981798324431 : Rat) / 8703213785532) [(1, 2), (3, 1), (10, 1), (11, 1)],
  term ((3053922743221337 : Rat) / 4262798588832) [(1, 2), (3, 1), (10, 1), (13, 1)],
  term ((-3725 : Rat) / 336) [(1, 2), (3, 1), (10, 1), (13, 1), (16, 1)],
  term ((-165940779078161915 : Rat) / 156657848139576) [(1, 2), (3, 1), (10, 1), (15, 1)],
  term ((701 : Rat) / 84) [(1, 2), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((-174280011147021505 : Rat) / 78328924069788) [(1, 2), (3, 1), (11, 1)],
  term ((24944916250237507 : Rat) / 11189846295684) [(1, 2), (3, 1), (11, 1), (14, 1)],
  term ((320 : Rat) / 21) [(1, 2), (3, 1), (12, 1), (15, 1)],
  term ((-186880 : Rat) / 3087) [(1, 2), (3, 1), (12, 1), (15, 3)],
  term ((-721277507173216153 : Rat) / 208877130852768) [(1, 2), (3, 1), (13, 1)],
  term ((21646282034496587 : Rat) / 12788395766496) [(1, 2), (3, 1), (13, 1), (14, 1)],
  term ((186880 : Rat) / 3087) [(1, 2), (3, 1), (13, 1), (14, 1), (15, 2)],
  term ((-1895 : Rat) / 1008) [(1, 2), (3, 1), (13, 1), (14, 1), (16, 1)],
  term ((-186880 : Rat) / 3087) [(1, 2), (3, 1), (13, 1), (15, 2)],
  term ((93715 : Rat) / 1008) [(1, 2), (3, 1), (13, 1), (16, 1)],
  term ((-197608266630175601 : Rat) / 156657848139576) [(1, 2), (3, 1), (14, 1), (15, 1)],
  term ((-361 : Rat) / 252) [(1, 2), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((21107476986721 : Rat) / 241755938487) [(1, 2), (3, 1), (14, 2), (15, 1)],
  term ((33601888013861513 : Rat) / 5594923147842) [(1, 2), (3, 1), (15, 1)],
  term ((-18643 : Rat) / 252) [(1, 2), (3, 1), (15, 1), (16, 1)],
  term ((93440 : Rat) / 1029) [(1, 2), (3, 1), (15, 3)],
  term ((-212387883800078305 : Rat) / 156657848139576) [(1, 2), (3, 2)],
  term ((5406607540071400 : Rat) / 6527410339149) [(1, 2), (3, 2), (6, 1)],
  term ((7127645796266305 : Rat) / 26109641356596) [(1, 2), (3, 2), (10, 1)],
  term ((30487378694759855 : Rat) / 39164462034894) [(1, 2), (3, 2), (14, 1)],
  term ((-8 : Rat) / 3) [(1, 2), (5, 1), (15, 1)],
  term ((2 : Rat) / 3) [(1, 2), (5, 1), (15, 1), (16, 1)],
  term ((3793620922735705 : Rat) / 17406427571064) [(1, 2), (6, 1)],
  term ((14069237787498655 : Rat) / 19582231017447) [(1, 2), (6, 1), (7, 1), (9, 1)],
  term ((-1532199782809 : Rat) / 161170625658) [(1, 2), (6, 1), (7, 1), (9, 1), (12, 1)],
  term ((-15510895297041142 : Rat) / 6527410339149) [(1, 2), (6, 1), (7, 1), (11, 1)],
  term ((-4349915183394751 : Rat) / 13054820678298) [(1, 2), (6, 1), (7, 1), (12, 1), (15, 1)],
  term ((-20449747317017159 : Rat) / 19582231017447) [(1, 2), (6, 1), (7, 1), (13, 1)],
  term ((-170 : Rat) / 63) [(1, 2), (6, 1), (7, 1), (13, 1), (16, 1)],
  term ((16666832247991378 : Rat) / 6527410339149) [(1, 2), (6, 1), (7, 1), (15, 1)],
  term ((32 : Rat) / 9) [(1, 2), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((691022102046859 : Rat) / 932487191307) [(1, 2), (6, 1), (7, 2)],
  term ((1738032546097067 : Rat) / 799274735406) [(1, 2), (6, 1), (9, 1), (11, 1)],
  term ((-119808 : Rat) / 553) [(1, 2), (6, 1), (9, 1), (11, 1), (12, 1)],
  term ((-941242657 : Rat) / 166541592) [(1, 2), (6, 1), (9, 1), (12, 1), (13, 1)],
  term ((-725 : Rat) / 84) [(1, 2), (6, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((223016262790904647 : Rat) / 313315696279152) [(1, 2), (6, 1), (9, 1), (12, 1), (15, 1)],
  term ((157 : Rat) / 21) [(1, 2), (6, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((28296131490755 : Rat) / 40469606856) [(1, 2), (6, 1), (9, 1), (13, 1)],
  term ((3625 : Rat) / 84) [(1, 2), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((-233428178880157183 : Rat) / 104438565426384) [(1, 2), (6, 1), (9, 1), (15, 1)],
  term ((-785 : Rat) / 21) [(1, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-231195579038557549 : Rat) / 39164462034894) [(2, 1), (3, 1), (12, 1), (14, 1), (15, 1)],
  term ((3886 : Rat) / 63) [(2, 1), (3, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(2, 1), (3, 1), (12, 1), (14, 2), (15, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(2, 1), (3, 1), (13, 1), (14, 1), (15, 2)],
  term ((-231195579038557549 : Rat) / 39164462034894) [(2, 1), (3, 1), (13, 1), (15, 2)],
  term ((3886 : Rat) / 63) [(2, 1), (3, 1), (13, 1), (15, 2), (16, 1)],
  term ((1532199782809 : Rat) / 26861770943) [(2, 1), (3, 1), (14, 1), (15, 3)],
  term ((231195579038557549 : Rat) / 78328924069788) [(2, 1), (3, 1), (14, 2), (15, 1)],
  term ((-1943 : Rat) / 63) [(2, 1), (3, 1), (14, 2), (15, 1), (16, 1)],
  term ((1532199782809 : Rat) / 26861770943) [(2, 1), (3, 1), (14, 3), (15, 1)],
  term ((231195579038557549 : Rat) / 78328924069788) [(2, 1), (3, 1), (15, 3)],
  term ((-1943 : Rat) / 63) [(2, 1), (3, 1), (15, 3), (16, 1)],
  term ((43858889654176910 : Rat) / 19582231017447) [(2, 1), (3, 2), (12, 1), (14, 1)],
  term ((43858889654176910 : Rat) / 19582231017447) [(2, 1), (3, 2), (13, 1), (15, 1)],
  term ((-21929444827088455 : Rat) / 19582231017447) [(2, 1), (3, 2), (14, 2)],
  term ((-21929444827088455 : Rat) / 19582231017447) [(2, 1), (3, 2), (15, 2)],
  term ((-2576683275007571 : Rat) / 1450535630922) [(2, 1), (6, 1), (12, 1), (14, 1)],
  term ((2488871127710291 : Rat) / 2901071261844) [(2, 1), (6, 1), (12, 1), (14, 2)],
  term ((2488871127710291 : Rat) / 2901071261844) [(2, 1), (6, 1), (13, 1), (14, 1), (15, 1)],
  term ((-2576683275007571 : Rat) / 1450535630922) [(2, 1), (6, 1), (13, 1), (15, 1)],
  term ((-2488871127710291 : Rat) / 5802142523688) [(2, 1), (6, 1), (14, 1), (15, 2)],
  term ((2576683275007571 : Rat) / 2901071261844) [(2, 1), (6, 1), (14, 2)],
  term ((-2488871127710291 : Rat) / 5802142523688) [(2, 1), (6, 1), (14, 3)],
  term ((2576683275007571 : Rat) / 2901071261844) [(2, 1), (6, 1), (15, 2)],
  term ((69282374274035 : Rat) / 40469606856) [(2, 1), (7, 1), (9, 1), (12, 1), (14, 1)],
  term ((69282374274035 : Rat) / 40469606856) [(2, 1), (7, 1), (9, 1), (13, 1), (15, 1)],
  term ((-69282374274035 : Rat) / 80939213712) [(2, 1), (7, 1), (9, 1), (14, 2)],
  term ((-69282374274035 : Rat) / 80939213712) [(2, 1), (7, 1), (9, 1), (15, 2)],
  term ((-1454632118436379 : Rat) / 1450535630922) [(2, 1), (7, 1), (11, 1), (12, 1), (14, 1)],
  term ((-1454632118436379 : Rat) / 1450535630922) [(2, 1), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((1454632118436379 : Rat) / 2901071261844) [(2, 1), (7, 1), (11, 1), (14, 2)],
  term ((1454632118436379 : Rat) / 2901071261844) [(2, 1), (7, 1), (11, 1), (15, 2)],
  term ((-2796461151655097 : Rat) / 1598549470812) [(2, 1), (7, 1), (12, 1), (13, 1), (14, 1)],
  term ((8525 : Rat) / 126) [(2, 1), (7, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((67697594944644565 : Rat) / 13054820678298) [(2, 1), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((-3466 : Rat) / 63) [(2, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((2796461151655097 : Rat) / 3197098941624) [(2, 1), (7, 1), (13, 1), (14, 2)],
  term ((-8525 : Rat) / 252) [(2, 1), (7, 1), (13, 1), (14, 2), (16, 1)],
  term ((949397735766834533 : Rat) / 156657848139576) [(2, 1), (7, 1), (13, 1), (15, 2)],
  term ((-7463 : Rat) / 84) [(2, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-2796461151655097 : Rat) / 1598549470812) [(2, 1), (7, 1), (13, 2), (15, 1)],
  term ((8525 : Rat) / 126) [(2, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-67697594944644565 : Rat) / 26109641356596) [(2, 1), (7, 1), (14, 2), (15, 1)],
  term ((1733 : Rat) / 63) [(2, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((-67697594944644565 : Rat) / 26109641356596) [(2, 1), (7, 1), (15, 3)],
  term ((1733 : Rat) / 63) [(2, 1), (7, 1), (15, 3), (16, 1)],
  term ((16224463500164501 : Rat) / 13054820678298) [(2, 1), (7, 2), (12, 1), (14, 1)],
  term ((16224463500164501 : Rat) / 13054820678298) [(2, 1), (7, 2), (13, 1), (15, 1)],
  term ((-16224463500164501 : Rat) / 26109641356596) [(2, 1), (7, 2), (14, 2)],
  term ((-16224463500164501 : Rat) / 26109641356596) [(2, 1), (7, 2), (15, 2)],
  term ((-67275259872743 : Rat) / 161878427424) [(2, 1), (9, 1), (11, 1), (12, 1), (14, 1)],
  term ((-67275259872743 : Rat) / 161878427424) [(2, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((67275259872743 : Rat) / 323756854848) [(2, 1), (9, 1), (11, 1), (14, 2)],
  term ((67275259872743 : Rat) / 323756854848) [(2, 1), (9, 1), (11, 1), (15, 2)],
  term ((581604841809017 : Rat) / 161878427424) [(2, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((581604841809017 : Rat) / 161878427424) [(2, 1), (9, 1), (13, 1), (15, 2)],
  term ((-581604841809017 : Rat) / 323756854848) [(2, 1), (9, 1), (14, 2), (15, 1)],
  term ((-581604841809017 : Rat) / 323756854848) [(2, 1), (9, 1), (15, 3)],
  term ((395910373848515 : Rat) / 4351606892766) [(2, 1), (10, 1), (12, 1), (14, 1)],
  term ((395910373848515 : Rat) / 4351606892766) [(2, 1), (10, 1), (13, 1), (15, 1)],
  term ((-395910373848515 : Rat) / 8703213785532) [(2, 1), (10, 1), (14, 2)],
  term ((-395910373848515 : Rat) / 8703213785532) [(2, 1), (10, 1), (15, 2)],
  term ((2972412027096341 : Rat) / 6394197883248) [(2, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-28985 : Rat) / 504) [(2, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-19223968449686125 : Rat) / 2901071261844) [(2, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((6137 : Rat) / 126) [(2, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2972412027096341 : Rat) / 12788395766496) [(2, 1), (11, 1), (13, 1), (14, 2)],
  term ((28985 : Rat) / 1008) [(2, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-4298025374459923709 : Rat) / 626631392558304) [(2, 1), (11, 1), (13, 1), (15, 2)],
  term ((26027 : Rat) / 336) [(2, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((2972412027096341 : Rat) / 6394197883248) [(2, 1), (11, 1), (13, 2), (15, 1)],
  term ((-28985 : Rat) / 504) [(2, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((19223968449686125 : Rat) / 5802142523688) [(2, 1), (11, 1), (14, 2), (15, 1)],
  term ((-6137 : Rat) / 252) [(2, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((19223968449686125 : Rat) / 5802142523688) [(2, 1), (11, 1), (15, 3)],
  term ((-6137 : Rat) / 252) [(2, 1), (11, 1), (15, 3), (16, 1)],
  term ((-51436413354355775 : Rat) / 13054820678298) [(2, 1), (11, 2), (12, 1), (14, 1)],
  term ((-51436413354355775 : Rat) / 13054820678298) [(2, 1), (11, 2), (13, 1), (15, 1)],
  term ((51436413354355775 : Rat) / 26109641356596) [(2, 1), (11, 2), (14, 2)],
  term ((51436413354355775 : Rat) / 26109641356596) [(2, 1), (11, 2), (15, 2)],
  term ((-23975823582991883 : Rat) / 6394197883248) [(2, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((28775 : Rat) / 504) [(2, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((54794038719859987 : Rat) / 8703213785532) [(2, 1), (12, 1), (14, 1), (15, 2)],
  term ((-5351 : Rat) / 126) [(2, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((3866078345790215 : Rat) / 2901071261844) [(2, 1), (12, 1), (14, 2)],
  term ((-10143334851217007 : Rat) / 13054820678298) [(2, 1), (12, 1), (14, 3)],
  term ((3866078345790215 : Rat) / 2901071261844) [(2, 1), (13, 1), (14, 1), (15, 1)],
  term ((687935282708185931 : Rat) / 626631392558304) [(2, 1), (13, 1), (14, 2), (15, 1)],
  term ((-28775 : Rat) / 1008) [(2, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((5119986143396521331 : Rat) / 626631392558304) [(2, 1), (13, 1), (15, 3)],
  term ((-23861 : Rat) / 336) [(2, 1), (13, 1), (15, 3), (16, 1)],
  term ((-23975823582991883 : Rat) / 6394197883248) [(2, 1), (13, 2), (15, 2)],
  term ((28775 : Rat) / 504) [(2, 1), (13, 2), (15, 2), (16, 1)],
  term ((-3866078345790215 : Rat) / 5802142523688) [(2, 1), (14, 1), (15, 2)],
  term ((-144095446457145947 : Rat) / 52219282713192) [(2, 1), (14, 2), (15, 2)],
  term ((5351 : Rat) / 252) [(2, 1), (14, 2), (15, 2), (16, 1)],
  term ((-3866078345790215 : Rat) / 5802142523688) [(2, 1), (14, 3)],
  term ((10143334851217007 : Rat) / 26109641356596) [(2, 1), (14, 4)],
  term ((-54794038719859987 : Rat) / 17406427571064) [(2, 1), (15, 4)],
  term ((5351 : Rat) / 252) [(2, 1), (15, 4), (16, 1)],
  term ((1063033397773325 : Rat) / 13054820678298) [(2, 2), (12, 1), (14, 1)],
  term ((1063033397773325 : Rat) / 13054820678298) [(2, 2), (13, 1), (15, 1)],
  term ((-1063033397773325 : Rat) / 26109641356596) [(2, 2), (14, 2)],
  term ((-1063033397773325 : Rat) / 26109641356596) [(2, 2), (15, 2)],
  term ((1280 : Rat) / 21) [(3, 1), (5, 1), (12, 1), (14, 1)],
  term ((-194560 : Rat) / 343) [(3, 1), (5, 1), (12, 1), (14, 1), (15, 2)],
  term ((-640 : Rat) / 7) [(3, 1), (5, 1), (12, 1), (14, 2)],
  term ((-640 : Rat) / 7) [(3, 1), (5, 1), (13, 1), (14, 1), (15, 1)],
  term ((1280 : Rat) / 21) [(3, 1), (5, 1), (13, 1), (15, 1)],
  term ((-194560 : Rat) / 343) [(3, 1), (5, 1), (13, 1), (15, 3)],
  term ((320 : Rat) / 7) [(3, 1), (5, 1), (14, 1), (15, 2)],
  term ((-640 : Rat) / 21) [(3, 1), (5, 1), (14, 2)],
  term ((97280 : Rat) / 343) [(3, 1), (5, 1), (14, 2), (15, 2)],
  term ((320 : Rat) / 7) [(3, 1), (5, 1), (14, 3)],
  term ((-640 : Rat) / 21) [(3, 1), (5, 1), (15, 2)],
  term ((97280 : Rat) / 343) [(3, 1), (5, 1), (15, 4)],
  term ((-62554550758679608 : Rat) / 19582231017447) [(3, 1), (6, 1), (7, 1), (12, 1), (14, 1)],
  term ((-62554550758679608 : Rat) / 19582231017447) [(3, 1), (6, 1), (7, 1), (13, 1), (15, 1)],
  term ((31277275379339804 : Rat) / 19582231017447) [(3, 1), (6, 1), (7, 1), (14, 2)],
  term ((31277275379339804 : Rat) / 19582231017447) [(3, 1), (6, 1), (7, 1), (15, 2)],
  term ((-6788130415625 : Rat) / 3372467238) [(3, 1), (6, 1), (9, 1), (12, 1), (14, 1)],
  term ((-6788130415625 : Rat) / 3372467238) [(3, 1), (6, 1), (9, 1), (13, 1), (15, 1)],
  term ((6788130415625 : Rat) / 6744934476) [(3, 1), (6, 1), (9, 1), (14, 2)],
  term ((6788130415625 : Rat) / 6744934476) [(3, 1), (6, 1), (9, 1), (15, 2)],
  term ((60097568987681768 : Rat) / 19582231017447) [(3, 1), (6, 1), (11, 1), (12, 1), (14, 1)],
  term ((60097568987681768 : Rat) / 19582231017447) [(3, 1), (6, 1), (11, 1), (13, 1), (15, 1)],
  term ((-30048784493840884 : Rat) / 19582231017447) [(3, 1), (6, 1), (11, 1), (14, 2)],
  term ((-30048784493840884 : Rat) / 19582231017447) [(3, 1), (6, 1), (11, 1), (15, 2)],
  term ((48487526969875909 : Rat) / 39164462034894) [(3, 1), (6, 1), (12, 1), (13, 1), (14, 1)],
  term ((-373760 : Rat) / 3087) [(3, 1), (6, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((170 : Rat) / 21) [(3, 1), (6, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-33944746640006525 : Rat) / 39164462034894) [(3, 1), (6, 1), (12, 1), (13, 1), (15, 2)],
  term ((-16716349441926325 : Rat) / 13054820678298) [(3, 1), (6, 1), (12, 1), (14, 1), (15, 1)],
  term ((-32 : Rat) / 3) [(3, 1), (6, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((747520 : Rat) / 3087) [(3, 1), (6, 1), (12, 1), (14, 1), (15, 3)],
  term ((29202890685953405 : Rat) / 78328924069788) [(3, 1), (6, 1), (12, 1), (14, 2), (15, 1)],
  term ((33944746640006525 : Rat) / 78328924069788) [(3, 1), (6, 1), (12, 1), (15, 3)],
  term ((-33944746640006525 : Rat) / 39164462034894) [(3, 1), (6, 1), (12, 2), (14, 1), (15, 1)],
  term ((-186880 : Rat) / 3087) [(3, 1), (6, 1), (13, 1), (14, 1), (15, 2)],
  term ((-48487526969875909 : Rat) / 78328924069788) [(3, 1), (6, 1), (13, 1), (14, 2)],
  term ((186880 : Rat) / 3087) [(3, 1), (6, 1), (13, 1), (14, 2), (15, 2)],
  term ((-85 : Rat) / 21) [(3, 1), (6, 1), (13, 1), (14, 2), (16, 1)],
  term ((-148785623621433859 : Rat) / 78328924069788) [(3, 1), (6, 1), (13, 1), (15, 2)],
  term ((-103 : Rat) / 7) [(3, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((934400 : Rat) / 3087) [(3, 1), (6, 1), (13, 1), (15, 4)],
  term ((48487526969875909 : Rat) / 39164462034894) [(3, 1), (6, 1), (13, 2), (15, 1)],
  term ((170 : Rat) / 21) [(3, 1), (6, 1), (13, 2), (15, 1), (16, 1)],
  term ((-373760 : Rat) / 3087) [(3, 1), (6, 1), (13, 2), (15, 3)],
  term ((93440 : Rat) / 3087) [(3, 1), (6, 1), (14, 1), (15, 3)],
  term ((16716349441926325 : Rat) / 26109641356596) [(3, 1), (6, 1), (14, 2), (15, 1)],
  term ((16 : Rat) / 3) [(3, 1), (6, 1), (14, 2), (15, 1), (16, 1)],
  term ((-373760 : Rat) / 3087) [(3, 1), (6, 1), (14, 2), (15, 3)],
  term ((93440 : Rat) / 3087) [(3, 1), (6, 1), (14, 3), (15, 1)],
  term ((16716349441926325 : Rat) / 26109641356596) [(3, 1), (6, 1), (15, 3)],
  term ((16 : Rat) / 3) [(3, 1), (6, 1), (15, 3), (16, 1)],
  term ((-373760 : Rat) / 3087) [(3, 1), (6, 1), (15, 5)],
  term ((-25000068476225527 : Rat) / 39164462034894) [(3, 1), (7, 1), (10, 1), (12, 1), (14, 1)],
  term ((-25000068476225527 : Rat) / 39164462034894) [(3, 1), (7, 1), (10, 1), (13, 1), (15, 1)],
  term ((25000068476225527 : Rat) / 78328924069788) [(3, 1), (7, 1), (10, 1), (14, 2)],
  term ((25000068476225527 : Rat) / 78328924069788) [(3, 1), (7, 1), (10, 1), (15, 2)],
  term ((33944746640006525 : Rat) / 39164462034894) [(3, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((373760 : Rat) / 3087) [(3, 1), (7, 1), (12, 1), (13, 1), (15, 3)],
  term ((480923310623753267 : Rat) / 78328924069788) [(3, 1), (7, 1), (12, 1), (14, 1)],
  term ((-29202890685953405 : Rat) / 78328924069788) [(3, 1), (7, 1), (12, 1), (14, 1), (15, 2)],
  term ((-7341319116991847 : Rat) / 3729948765228) [(3, 1), (7, 1), (12, 1), (14, 2)],
  term ((-934400 : Rat) / 3087) [(3, 1), (7, 1), (12, 1), (14, 2), (15, 2)],
  term ((-33944746640006525 : Rat) / 78328924069788) [(3, 1), (7, 1), (12, 1), (14, 3)],
  term ((-186880 : Rat) / 3087) [(3, 1), (7, 1), (12, 1), (15, 4)],
  term ((373760 : Rat) / 3087) [(3, 1), (7, 1), (12, 2), (14, 1), (15, 2)],
  term ((33944746640006525 : Rat) / 39164462034894) [(3, 1), (7, 1), (12, 2), (14, 2)],
  term ((-7341319116991847 : Rat) / 3729948765228) [(3, 1), (7, 1), (13, 1), (14, 1), (15, 1)],
  term ((-747520 : Rat) / 3087) [(3, 1), (7, 1), (13, 1), (14, 1), (15, 3)],
  term ((480923310623753267 : Rat) / 78328924069788) [(3, 1), (7, 1), (13, 1), (15, 1)],
  term ((186880 : Rat) / 3087) [(3, 1), (7, 1), (13, 1), (15, 3)],
  term ((7341319116991847 : Rat) / 7459897530456) [(3, 1), (7, 1), (14, 1), (15, 2)],
  term ((373760 : Rat) / 3087) [(3, 1), (7, 1), (14, 1), (15, 4)],
  term ((-480923310623753267 : Rat) / 156657848139576) [(3, 1), (7, 1), (14, 2)],
  term ((-93440 : Rat) / 3087) [(3, 1), (7, 1), (14, 2), (15, 2)],
  term ((7341319116991847 : Rat) / 7459897530456) [(3, 1), (7, 1), (14, 3)],
  term ((373760 : Rat) / 3087) [(3, 1), (7, 1), (14, 3), (15, 2)],
  term ((-480923310623753267 : Rat) / 156657848139576) [(3, 1), (7, 1), (15, 2)],
  term ((-93440 : Rat) / 3087) [(3, 1), (7, 1), (15, 4)],
  term ((-10880558480597 : Rat) / 7708496544) [(3, 1), (9, 1), (10, 1), (12, 1), (14, 1)],
  term ((-10880558480597 : Rat) / 7708496544) [(3, 1), (9, 1), (10, 1), (13, 1), (15, 1)],
  term ((10880558480597 : Rat) / 15416993088) [(3, 1), (9, 1), (10, 1), (14, 2)],
  term ((10880558480597 : Rat) / 15416993088) [(3, 1), (9, 1), (10, 1), (15, 2)],
  term ((1015569108576973 : Rat) / 161878427424) [(3, 1), (9, 1), (12, 1), (14, 1)],
  term ((97280 : Rat) / 343) [(3, 1), (9, 1), (12, 1), (14, 1), (15, 2)],
  term ((-519569467138361 : Rat) / 161878427424) [(3, 1), (9, 1), (12, 1), (14, 2)],
  term ((-519569467138361 : Rat) / 161878427424) [(3, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((1015569108576973 : Rat) / 161878427424) [(3, 1), (9, 1), (13, 1), (15, 1)],
  term ((97280 : Rat) / 343) [(3, 1), (9, 1), (13, 1), (15, 3)],
  term ((519569467138361 : Rat) / 323756854848) [(3, 1), (9, 1), (14, 1), (15, 2)],
  term ((-1015569108576973 : Rat) / 323756854848) [(3, 1), (9, 1), (14, 2)],
  term ((-48640 : Rat) / 343) [(3, 1), (9, 1), (14, 2), (15, 2)],
  term ((519569467138361 : Rat) / 323756854848) [(3, 1), (9, 1), (14, 3)],
  term ((-1015569108576973 : Rat) / 323756854848) [(3, 1), (9, 1), (15, 2)],
  term ((-48640 : Rat) / 343) [(3, 1), (9, 1), (15, 4)],
  term ((3707981798324431 : Rat) / 4351606892766) [(3, 1), (10, 1), (11, 1), (12, 1), (14, 1)],
  term ((3707981798324431 : Rat) / 4351606892766) [(3, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((-3707981798324431 : Rat) / 8703213785532) [(3, 1), (10, 1), (11, 1), (14, 2)],
  term ((-3707981798324431 : Rat) / 8703213785532) [(3, 1), (10, 1), (11, 1), (15, 2)],
  term ((3053922743221337 : Rat) / 2131399294416) [(3, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((-3725 : Rat) / 168) [(3, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-165940779078161915 : Rat) / 78328924069788) [(3, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((701 : Rat) / 42) [(3, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3053922743221337 : Rat) / 4262798588832) [(3, 1), (10, 1), (13, 1), (14, 2)],
  term ((3725 : Rat) / 336) [(3, 1), (10, 1), (13, 1), (14, 2), (16, 1)],
  term ((-1776452875878831859 : Rat) / 626631392558304) [(3, 1), (10, 1), (13, 1), (15, 2)],
  term ((3111 : Rat) / 112) [(3, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((3053922743221337 : Rat) / 2131399294416) [(3, 1), (10, 1), (13, 2), (15, 1)],
  term ((-3725 : Rat) / 168) [(3, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((165940779078161915 : Rat) / 156657848139576) [(3, 1), (10, 1), (14, 2), (15, 1)],
  term ((-701 : Rat) / 84) [(3, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((165940779078161915 : Rat) / 156657848139576) [(3, 1), (10, 1), (15, 3)],
  term ((-701 : Rat) / 84) [(3, 1), (10, 1), (15, 3), (16, 1)],
  term ((-174280011147021505 : Rat) / 39164462034894) [(3, 1), (11, 1), (12, 1), (14, 1)],
  term ((24944916250237507 : Rat) / 5594923147842) [(3, 1), (11, 1), (12, 1), (14, 2)],
  term ((24944916250237507 : Rat) / 5594923147842) [(3, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-174280011147021505 : Rat) / 39164462034894) [(3, 1), (11, 1), (13, 1), (15, 1)],
  term ((-24944916250237507 : Rat) / 11189846295684) [(3, 1), (11, 1), (14, 1), (15, 2)],
  term ((174280011147021505 : Rat) / 78328924069788) [(3, 1), (11, 1), (14, 2)],
  term ((-24944916250237507 : Rat) / 11189846295684) [(3, 1), (11, 1), (14, 3)],
  term ((174280011147021505 : Rat) / 78328924069788) [(3, 1), (11, 1), (15, 2)],
  term ((-721277507173216153 : Rat) / 104438565426384) [(3, 1), (12, 1), (13, 1), (14, 1)],
  term ((-373760 : Rat) / 3087) [(3, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((93715 : Rat) / 504) [(3, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((21646282034496587 : Rat) / 6394197883248) [(3, 1), (12, 1), (13, 1), (14, 2)],
  term ((373760 : Rat) / 3087) [(3, 1), (12, 1), (13, 1), (14, 2), (15, 2)],
  term ((-1895 : Rat) / 504) [(3, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((640 : Rat) / 21) [(3, 1), (12, 1), (13, 1), (15, 2)],
  term ((-373760 : Rat) / 3087) [(3, 1), (12, 1), (13, 1), (15, 4)],
  term ((33601888013861513 : Rat) / 2797461573921) [(3, 1), (12, 1), (14, 1), (15, 1)],
  term ((-18643 : Rat) / 126) [(3, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((186880 : Rat) / 1029) [(3, 1), (12, 1), (14, 1), (15, 3)],
  term ((-198801850235048561 : Rat) / 78328924069788) [(3, 1), (12, 1), (14, 2), (15, 1)],
  term ((-361 : Rat) / 126) [(3, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((186880 : Rat) / 3087) [(3, 1), (12, 1), (14, 2), (15, 3)],
  term ((42214953973442 : Rat) / 241755938487) [(3, 1), (12, 1), (14, 3), (15, 1)],
  term ((-320 : Rat) / 21) [(3, 1), (12, 1), (15, 3)],
  term ((186880 : Rat) / 3087) [(3, 1), (12, 1), (15, 5)],
  term ((640 : Rat) / 21) [(3, 1), (12, 2), (14, 1), (15, 1)],
  term ((-373760 : Rat) / 3087) [(3, 1), (12, 2), (14, 1), (15, 3)],
  term ((-293503772525748619 : Rat) / 69625710284256) [(3, 1), (13, 1), (14, 1), (15, 2)],
  term ((-331 : Rat) / 336) [(3, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-186880 : Rat) / 3087) [(3, 1), (13, 1), (14, 1), (15, 4)],
  term ((721277507173216153 : Rat) / 208877130852768) [(3, 1), (13, 1), (14, 2)],
  term ((56850311856322 : Rat) / 241755938487) [(3, 1), (13, 1), (14, 2), (15, 2)],
  term ((-93715 : Rat) / 1008) [(3, 1), (13, 1), (14, 2), (16, 1)],
  term ((-21646282034496587 : Rat) / 12788395766496) [(3, 1), (13, 1), (14, 3)],
  term ((-186880 : Rat) / 3087) [(3, 1), (13, 1), (14, 3), (15, 2)],
  term ((1895 : Rat) / 1008) [(3, 1), (13, 1), (14, 3), (16, 1)],
  term ((9690655436624627371 : Rat) / 626631392558304) [(3, 1), (13, 1), (15, 2)],
  term ((-80953 : Rat) / 336) [(3, 1), (13, 1), (15, 2), (16, 1)],
  term ((747520 : Rat) / 3087) [(3, 1), (13, 1), (15, 4)],
  term ((21646282034496587 : Rat) / 6394197883248) [(3, 1), (13, 2), (14, 1), (15, 1)],
  term ((-1895 : Rat) / 504) [(3, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((373760 : Rat) / 3087) [(3, 1), (13, 2), (14, 1), (15, 3)],
  term ((-721277507173216153 : Rat) / 104438565426384) [(3, 1), (13, 2), (15, 1)],
  term ((93715 : Rat) / 504) [(3, 1), (13, 2), (15, 1), (16, 1)],
  term ((-373760 : Rat) / 3087) [(3, 1), (13, 2), (15, 3)],
  term ((197608266630175601 : Rat) / 156657848139576) [(3, 1), (14, 1), (15, 3)],
  term ((361 : Rat) / 252) [(3, 1), (14, 1), (15, 3), (16, 1)],
  term ((-33601888013861513 : Rat) / 5594923147842) [(3, 1), (14, 2), (15, 1)],
  term ((18643 : Rat) / 252) [(3, 1), (14, 2), (15, 1), (16, 1)],
  term ((-43060513811041 : Rat) / 241755938487) [(3, 1), (14, 2), (15, 3)],
  term ((197608266630175601 : Rat) / 156657848139576) [(3, 1), (14, 3), (15, 1)],
  term ((361 : Rat) / 252) [(3, 1), (14, 3), (15, 1), (16, 1)],
  term ((-21107476986721 : Rat) / 241755938487) [(3, 1), (14, 4), (15, 1)],
  term ((-33601888013861513 : Rat) / 5594923147842) [(3, 1), (15, 3)],
  term ((18643 : Rat) / 252) [(3, 1), (15, 3), (16, 1)],
  term ((-93440 : Rat) / 1029) [(3, 1), (15, 5)],
  term ((10813215080142800 : Rat) / 6527410339149) [(3, 2), (6, 1), (12, 1), (14, 1)],
  term ((10813215080142800 : Rat) / 6527410339149) [(3, 2), (6, 1), (13, 1), (15, 1)],
  term ((-5406607540071400 : Rat) / 6527410339149) [(3, 2), (6, 1), (14, 2)],
  term ((-5406607540071400 : Rat) / 6527410339149) [(3, 2), (6, 1), (15, 2)],
  term ((7127645796266305 : Rat) / 13054820678298) [(3, 2), (10, 1), (12, 1), (14, 1)],
  term ((7127645796266305 : Rat) / 13054820678298) [(3, 2), (10, 1), (13, 1), (15, 1)],
  term ((-7127645796266305 : Rat) / 26109641356596) [(3, 2), (10, 1), (14, 2)],
  term ((-7127645796266305 : Rat) / 26109641356596) [(3, 2), (10, 1), (15, 2)],
  term ((-212387883800078305 : Rat) / 78328924069788) [(3, 2), (12, 1), (14, 1)],
  term ((30487378694759855 : Rat) / 19582231017447) [(3, 2), (12, 1), (14, 2)],
  term ((30487378694759855 : Rat) / 19582231017447) [(3, 2), (13, 1), (14, 1), (15, 1)],
  term ((-212387883800078305 : Rat) / 78328924069788) [(3, 2), (13, 1), (15, 1)],
  term ((-30487378694759855 : Rat) / 39164462034894) [(3, 2), (14, 1), (15, 2)],
  term ((212387883800078305 : Rat) / 156657848139576) [(3, 2), (14, 2)],
  term ((-30487378694759855 : Rat) / 39164462034894) [(3, 2), (14, 3)],
  term ((212387883800078305 : Rat) / 156657848139576) [(3, 2), (15, 2)],
  term ((-16 : Rat) / 3) [(5, 1), (12, 1), (14, 1), (15, 1)],
  term ((4 : Rat) / 3) [(5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-16 : Rat) / 3) [(5, 1), (13, 1), (15, 2)],
  term ((4 : Rat) / 3) [(5, 1), (13, 1), (15, 2), (16, 1)],
  term ((8 : Rat) / 3) [(5, 1), (14, 2), (15, 1)],
  term ((-2 : Rat) / 3) [(5, 1), (14, 2), (15, 1), (16, 1)],
  term ((8 : Rat) / 3) [(5, 1), (15, 3)],
  term ((-2 : Rat) / 3) [(5, 1), (15, 3), (16, 1)],
  term ((-1532199782809 : Rat) / 80585312829) [(6, 1), (7, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((28138475574997310 : Rat) / 19582231017447) [(6, 1), (7, 1), (9, 1), (12, 1), (14, 1)],
  term ((1532199782809 : Rat) / 161170625658) [(6, 1), (7, 1), (9, 1), (12, 1), (14, 2)],
  term ((1532199782809 : Rat) / 161170625658) [(6, 1), (7, 1), (9, 1), (12, 1), (15, 2)],
  term ((-1532199782809 : Rat) / 80585312829) [(6, 1), (7, 1), (9, 1), (12, 2), (14, 1)],
  term ((28138475574997310 : Rat) / 19582231017447) [(6, 1), (7, 1), (9, 1), (13, 1), (15, 1)],
  term ((-14069237787498655 : Rat) / 19582231017447) [(6, 1), (7, 1), (9, 1), (14, 2)],
  term ((-14069237787498655 : Rat) / 19582231017447) [(6, 1), (7, 1), (9, 1), (15, 2)],
  term ((-31021790594082284 : Rat) / 6527410339149) [(6, 1), (7, 1), (11, 1), (12, 1), (14, 1)],
  term ((-31021790594082284 : Rat) / 6527410339149) [(6, 1), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((15510895297041142 : Rat) / 6527410339149) [(6, 1), (7, 1), (11, 1), (14, 2)],
  term ((15510895297041142 : Rat) / 6527410339149) [(6, 1), (7, 1), (11, 1), (15, 2)],
  term ((-40899494634034318 : Rat) / 19582231017447) [(6, 1), (7, 1), (12, 1), (13, 1), (14, 1)],
  term ((-340 : Rat) / 63) [(6, 1), (7, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-4349915183394751 : Rat) / 6527410339149) [(6, 1), (7, 1), (12, 1), (13, 1), (15, 2)],
  term ((33333664495982756 : Rat) / 6527410339149) [(6, 1), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((64 : Rat) / 9) [(6, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((4349915183394751 : Rat) / 13054820678298) [(6, 1), (7, 1), (12, 1), (14, 2), (15, 1)],
  term ((4349915183394751 : Rat) / 13054820678298) [(6, 1), (7, 1), (12, 1), (15, 3)],
  term ((-4349915183394751 : Rat) / 6527410339149) [(6, 1), (7, 1), (12, 2), (14, 1), (15, 1)],
  term ((20449747317017159 : Rat) / 19582231017447) [(6, 1), (7, 1), (13, 1), (14, 2)],
  term ((170 : Rat) / 63) [(6, 1), (7, 1), (13, 1), (14, 2), (16, 1)],
  term ((120450740804965427 : Rat) / 19582231017447) [(6, 1), (7, 1), (13, 1), (15, 2)],
  term ((206 : Rat) / 21) [(6, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-40899494634034318 : Rat) / 19582231017447) [(6, 1), (7, 1), (13, 2), (15, 1)],
  term ((-340 : Rat) / 63) [(6, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-16666832247991378 : Rat) / 6527410339149) [(6, 1), (7, 1), (14, 2), (15, 1)],
  term ((-32 : Rat) / 9) [(6, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((-16666832247991378 : Rat) / 6527410339149) [(6, 1), (7, 1), (15, 3)],
  term ((-32 : Rat) / 9) [(6, 1), (7, 1), (15, 3), (16, 1)],
  term ((1382044204093718 : Rat) / 932487191307) [(6, 1), (7, 2), (12, 1), (14, 1)],
  term ((1382044204093718 : Rat) / 932487191307) [(6, 1), (7, 2), (13, 1), (15, 1)],
  term ((-691022102046859 : Rat) / 932487191307) [(6, 1), (7, 2), (14, 2)],
  term ((-691022102046859 : Rat) / 932487191307) [(6, 1), (7, 2), (15, 2)],
  term ((-239616 : Rat) / 553) [(6, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((1738032546097067 : Rat) / 399637367703) [(6, 1), (9, 1), (11, 1), (12, 1), (14, 1)],
  term ((119808 : Rat) / 553) [(6, 1), (9, 1), (11, 1), (12, 1), (14, 2)],
  term ((119808 : Rat) / 553) [(6, 1), (9, 1), (11, 1), (12, 1), (15, 2)],
  term ((-239616 : Rat) / 553) [(6, 1), (9, 1), (11, 1), (12, 2), (14, 1)],
  term ((1738032546097067 : Rat) / 399637367703) [(6, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-1738032546097067 : Rat) / 799274735406) [(6, 1), (9, 1), (11, 1), (14, 2)],
  term ((-1738032546097067 : Rat) / 799274735406) [(6, 1), (9, 1), (11, 1), (15, 2)],
  term ((28296131490755 : Rat) / 20234803428) [(6, 1), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((3625 : Rat) / 42) [(6, 1), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((941242657 : Rat) / 166541592) [(6, 1), (9, 1), (12, 1), (13, 1), (14, 2)],
  term ((725 : Rat) / 84) [(6, 1), (9, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((55975411379984917 : Rat) / 39164462034894) [(6, 1), (9, 1), (12, 1), (13, 1), (15, 2)],
  term ((283 : Rat) / 12) [(6, 1), (9, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-941242657 : Rat) / 83270796) [(6, 1), (9, 1), (12, 1), (13, 2), (15, 1)],
  term ((-725 : Rat) / 42) [(6, 1), (9, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-233428178880157183 : Rat) / 52219282713192) [(6, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-1570 : Rat) / 21) [(6, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-223016262790904647 : Rat) / 313315696279152) [(6, 1), (9, 1), (12, 1), (14, 2), (15, 1)],
  term ((-157 : Rat) / 21) [(6, 1), (9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-223016262790904647 : Rat) / 313315696279152) [(6, 1), (9, 1), (12, 1), (15, 3)],
  term ((-157 : Rat) / 21) [(6, 1), (9, 1), (12, 1), (15, 3), (16, 1)],
  term ((-941242657 : Rat) / 83270796) [(6, 1), (9, 1), (12, 2), (13, 1), (14, 1)],
  term ((-725 : Rat) / 42) [(6, 1), (9, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((223016262790904647 : Rat) / 156657848139576) [(6, 1), (9, 1), (12, 2), (14, 1), (15, 1)],
  term ((314 : Rat) / 21) [(6, 1), (9, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-28296131490755 : Rat) / 40469606856) [(6, 1), (9, 1), (13, 1), (14, 2)],
  term ((-3625 : Rat) / 84) [(6, 1), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((-404909430820592077 : Rat) / 78328924069788) [(6, 1), (9, 1), (13, 1), (15, 2)],
  term ((-1415 : Rat) / 12) [(6, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((28296131490755 : Rat) / 20234803428) [(6, 1), (9, 1), (13, 2), (15, 1)],
  term ((3625 : Rat) / 42) [(6, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((233428178880157183 : Rat) / 104438565426384) [(6, 1), (9, 1), (14, 2), (15, 1)],
  term ((785 : Rat) / 21) [(6, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((233428178880157183 : Rat) / 104438565426384) [(6, 1), (9, 1), (15, 3)],
  term ((785 : Rat) / 21) [(6, 1), (9, 1), (15, 3), (16, 1)],
  term ((3793620922735705 : Rat) / 8703213785532) [(6, 1), (12, 1), (14, 1)],
  term ((3793620922735705 : Rat) / 8703213785532) [(6, 1), (13, 1), (15, 1)],
  term ((-3793620922735705 : Rat) / 17406427571064) [(6, 1), (14, 2)],
  term ((-3793620922735705 : Rat) / 17406427571064) [(6, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 27, terms 200 through 299. -/
theorem rs_R009_ueqv_R009YNNNN_block_27_0200_0299_valid :
    checkProductSumEq rs_R009_ueqv_R009YNNNN_partials_27_0200_0299
      rs_R009_ueqv_R009YNNNN_block_27_0200_0299 = true := by
  native_decide

end R009UeqvR009YNNNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
