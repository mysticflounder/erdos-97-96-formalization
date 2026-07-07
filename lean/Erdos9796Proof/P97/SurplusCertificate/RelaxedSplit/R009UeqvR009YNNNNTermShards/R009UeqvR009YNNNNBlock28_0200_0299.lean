/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009YNNNN, term block 28:200-299

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009YNNNNTermShards

/-- Generator polynomial 28 for relaxed split surplus certificate `R009:u=v:R009YNNNN`. -/
def rs_R009_ueqv_R009YNNNN_generator_28_0200_0299 : Poly :=
[
  term (-1 : Rat) [],
  term (-2 : Rat) [(0, 1), (14, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (15, 1)],
  term (1 : Rat) [(1, 2)],
  term (2 : Rat) [(14, 1)]
]

/-- Coefficient term 200 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0200 : Poly :=
[
  term ((-33944746640006525 : Rat) / 78328924069788) [(2, 1), (3, 2)]
]

/-- Partial product 200 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0200 : Poly :=
[
  term ((33944746640006525 : Rat) / 39164462034894) [(0, 1), (2, 1), (3, 2), (14, 1)],
  term ((-33944746640006525 : Rat) / 78328924069788) [(0, 2), (2, 1), (3, 2)],
  term ((33944746640006525 : Rat) / 39164462034894) [(1, 1), (2, 1), (3, 2), (15, 1)],
  term ((-33944746640006525 : Rat) / 78328924069788) [(1, 2), (2, 1), (3, 2)],
  term ((33944746640006525 : Rat) / 78328924069788) [(2, 1), (3, 2)],
  term ((-33944746640006525 : Rat) / 39164462034894) [(2, 1), (3, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 200 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0200_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0200
        rs_R009_ueqv_R009YNNNN_generator_28_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_28_0200 := by
  native_decide

/-- Coefficient term 201 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0201 : Poly :=
[
  term ((-2664495422304851 : Rat) / 5802142523688) [(2, 1), (6, 1)]
]

/-- Partial product 201 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0201 : Poly :=
[
  term ((2664495422304851 : Rat) / 2901071261844) [(0, 1), (2, 1), (6, 1), (14, 1)],
  term ((-2664495422304851 : Rat) / 5802142523688) [(0, 2), (2, 1), (6, 1)],
  term ((2664495422304851 : Rat) / 2901071261844) [(1, 1), (2, 1), (6, 1), (15, 1)],
  term ((-2664495422304851 : Rat) / 5802142523688) [(1, 2), (2, 1), (6, 1)],
  term ((2664495422304851 : Rat) / 5802142523688) [(2, 1), (6, 1)],
  term ((-2664495422304851 : Rat) / 2901071261844) [(2, 1), (6, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 201 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0201_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0201
        rs_R009_ueqv_R009YNNNN_generator_28_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_28_0201 := by
  native_decide

/-- Coefficient term 202 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0202 : Poly :=
[
  term ((2488871127710291 : Rat) / 5802142523688) [(2, 1), (6, 1), (14, 1)]
]

/-- Partial product 202 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0202 : Poly :=
[
  term ((-2488871127710291 : Rat) / 2901071261844) [(0, 1), (2, 1), (6, 1), (14, 2)],
  term ((2488871127710291 : Rat) / 5802142523688) [(0, 2), (2, 1), (6, 1), (14, 1)],
  term ((-2488871127710291 : Rat) / 2901071261844) [(1, 1), (2, 1), (6, 1), (14, 1), (15, 1)],
  term ((2488871127710291 : Rat) / 5802142523688) [(1, 2), (2, 1), (6, 1), (14, 1)],
  term ((-2488871127710291 : Rat) / 5802142523688) [(2, 1), (6, 1), (14, 1)],
  term ((2488871127710291 : Rat) / 2901071261844) [(2, 1), (6, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 202 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0202_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0202
        rs_R009_ueqv_R009YNNNN_generator_28_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_28_0202 := by
  native_decide

/-- Coefficient term 203 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0203 : Poly :=
[
  term ((-6788130415625 : Rat) / 6744934476) [(2, 1), (7, 1), (9, 1)]
]

/-- Partial product 203 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0203 : Poly :=
[
  term ((6788130415625 : Rat) / 3372467238) [(0, 1), (2, 1), (7, 1), (9, 1), (14, 1)],
  term ((-6788130415625 : Rat) / 6744934476) [(0, 2), (2, 1), (7, 1), (9, 1)],
  term ((6788130415625 : Rat) / 3372467238) [(1, 1), (2, 1), (7, 1), (9, 1), (15, 1)],
  term ((-6788130415625 : Rat) / 6744934476) [(1, 2), (2, 1), (7, 1), (9, 1)],
  term ((6788130415625 : Rat) / 6744934476) [(2, 1), (7, 1), (9, 1)],
  term ((-6788130415625 : Rat) / 3372467238) [(2, 1), (7, 1), (9, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 203 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0203_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0203
        rs_R009_ueqv_R009YNNNN_generator_28_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_28_0203 := by
  native_decide

/-- Coefficient term 204 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0204 : Poly :=
[
  term ((186916352335247 : Rat) / 73444842072) [(2, 1), (7, 1), (11, 1)]
]

/-- Partial product 204 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0204 : Poly :=
[
  term ((-186916352335247 : Rat) / 36722421036) [(0, 1), (2, 1), (7, 1), (11, 1), (14, 1)],
  term ((186916352335247 : Rat) / 73444842072) [(0, 2), (2, 1), (7, 1), (11, 1)],
  term ((-186916352335247 : Rat) / 36722421036) [(1, 1), (2, 1), (7, 1), (11, 1), (15, 1)],
  term ((186916352335247 : Rat) / 73444842072) [(1, 2), (2, 1), (7, 1), (11, 1)],
  term ((-186916352335247 : Rat) / 73444842072) [(2, 1), (7, 1), (11, 1)],
  term ((186916352335247 : Rat) / 36722421036) [(2, 1), (7, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 204 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0204_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0204
        rs_R009_ueqv_R009YNNNN_generator_28_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_28_0204 := by
  native_decide

/-- Coefficient term 205 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0205 : Poly :=
[
  term ((280381883026811 : Rat) / 266424911802) [(2, 1), (7, 1), (13, 1)]
]

/-- Partial product 205 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0205 : Poly :=
[
  term ((-280381883026811 : Rat) / 133212455901) [(0, 1), (2, 1), (7, 1), (13, 1), (14, 1)],
  term ((280381883026811 : Rat) / 266424911802) [(0, 2), (2, 1), (7, 1), (13, 1)],
  term ((-280381883026811 : Rat) / 133212455901) [(1, 1), (2, 1), (7, 1), (13, 1), (15, 1)],
  term ((280381883026811 : Rat) / 266424911802) [(1, 2), (2, 1), (7, 1), (13, 1)],
  term ((-280381883026811 : Rat) / 266424911802) [(2, 1), (7, 1), (13, 1)],
  term ((280381883026811 : Rat) / 133212455901) [(2, 1), (7, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 205 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0205_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0205
        rs_R009_ueqv_R009YNNNN_generator_28_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_28_0205 := by
  native_decide

/-- Coefficient term 206 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0206 : Poly :=
[
  term ((85 : Rat) / 21) [(2, 1), (7, 1), (13, 1), (16, 1)]
]

/-- Partial product 206 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0206 : Poly :=
[
  term ((-170 : Rat) / 21) [(0, 1), (2, 1), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((85 : Rat) / 21) [(0, 2), (2, 1), (7, 1), (13, 1), (16, 1)],
  term ((-170 : Rat) / 21) [(1, 1), (2, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((85 : Rat) / 21) [(1, 2), (2, 1), (7, 1), (13, 1), (16, 1)],
  term ((170 : Rat) / 21) [(2, 1), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((-85 : Rat) / 21) [(2, 1), (7, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 206 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0206_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0206
        rs_R009_ueqv_R009YNNNN_generator_28_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_28_0206 := by
  native_decide

/-- Coefficient term 207 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0207 : Poly :=
[
  term ((-21696170156143477 : Rat) / 13054820678298) [(2, 1), (7, 1), (15, 1)]
]

/-- Partial product 207 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0207 : Poly :=
[
  term ((21696170156143477 : Rat) / 6527410339149) [(0, 1), (2, 1), (7, 1), (14, 1), (15, 1)],
  term ((-21696170156143477 : Rat) / 13054820678298) [(0, 2), (2, 1), (7, 1), (15, 1)],
  term ((21696170156143477 : Rat) / 6527410339149) [(1, 1), (2, 1), (7, 1), (15, 2)],
  term ((-21696170156143477 : Rat) / 13054820678298) [(1, 2), (2, 1), (7, 1), (15, 1)],
  term ((-21696170156143477 : Rat) / 6527410339149) [(2, 1), (7, 1), (14, 1), (15, 1)],
  term ((21696170156143477 : Rat) / 13054820678298) [(2, 1), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 207 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0207_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0207
        rs_R009_ueqv_R009YNNNN_generator_28_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_28_0207 := by
  native_decide

/-- Coefficient term 208 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0208 : Poly :=
[
  term ((-16 : Rat) / 3) [(2, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 208 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0208 : Poly :=
[
  term ((32 : Rat) / 3) [(0, 1), (2, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-16 : Rat) / 3) [(0, 2), (2, 1), (7, 1), (15, 1), (16, 1)],
  term ((32 : Rat) / 3) [(1, 1), (2, 1), (7, 1), (15, 2), (16, 1)],
  term ((-16 : Rat) / 3) [(1, 2), (2, 1), (7, 1), (15, 1), (16, 1)],
  term ((-32 : Rat) / 3) [(2, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((16 : Rat) / 3) [(2, 1), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 208 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0208_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0208
        rs_R009_ueqv_R009YNNNN_generator_28_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_28_0208 := by
  native_decide

/-- Coefficient term 209 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0209 : Poly :=
[
  term ((-691022102046859 : Rat) / 621658127538) [(2, 1), (7, 2)]
]

/-- Partial product 209 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0209 : Poly :=
[
  term ((691022102046859 : Rat) / 310829063769) [(0, 1), (2, 1), (7, 2), (14, 1)],
  term ((-691022102046859 : Rat) / 621658127538) [(0, 2), (2, 1), (7, 2)],
  term ((691022102046859 : Rat) / 310829063769) [(1, 1), (2, 1), (7, 2), (15, 1)],
  term ((-691022102046859 : Rat) / 621658127538) [(1, 2), (2, 1), (7, 2)],
  term ((691022102046859 : Rat) / 621658127538) [(2, 1), (7, 2)],
  term ((-691022102046859 : Rat) / 310829063769) [(2, 1), (7, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 209 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0209_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0209
        rs_R009_ueqv_R009YNNNN_generator_28_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_28_0209 := by
  native_decide

/-- Coefficient term 210 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0210 : Poly :=
[
  term ((-201665036689987 : Rat) / 107918951616) [(2, 1), (9, 1), (11, 1)]
]

/-- Partial product 210 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0210 : Poly :=
[
  term ((201665036689987 : Rat) / 53959475808) [(0, 1), (2, 1), (9, 1), (11, 1), (14, 1)],
  term ((-201665036689987 : Rat) / 107918951616) [(0, 2), (2, 1), (9, 1), (11, 1)],
  term ((201665036689987 : Rat) / 53959475808) [(1, 1), (2, 1), (9, 1), (11, 1), (15, 1)],
  term ((-201665036689987 : Rat) / 107918951616) [(1, 2), (2, 1), (9, 1), (11, 1)],
  term ((201665036689987 : Rat) / 107918951616) [(2, 1), (9, 1), (11, 1)],
  term ((-201665036689987 : Rat) / 53959475808) [(2, 1), (9, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 210 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0210_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0210
        rs_R009_ueqv_R009YNNNN_generator_28_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_28_0210 := by
  native_decide

/-- Coefficient term 211 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0211 : Poly :=
[
  term ((6788130415625 : Rat) / 10117401714) [(2, 1), (9, 1), (15, 1)]
]

/-- Partial product 211 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0211 : Poly :=
[
  term ((-6788130415625 : Rat) / 5058700857) [(0, 1), (2, 1), (9, 1), (14, 1), (15, 1)],
  term ((6788130415625 : Rat) / 10117401714) [(0, 2), (2, 1), (9, 1), (15, 1)],
  term ((-6788130415625 : Rat) / 5058700857) [(1, 1), (2, 1), (9, 1), (15, 2)],
  term ((6788130415625 : Rat) / 10117401714) [(1, 2), (2, 1), (9, 1), (15, 1)],
  term ((6788130415625 : Rat) / 5058700857) [(2, 1), (9, 1), (14, 1), (15, 1)],
  term ((-6788130415625 : Rat) / 10117401714) [(2, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 211 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0211_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0211
        rs_R009_ueqv_R009YNNNN_generator_28_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_28_0211 := by
  native_decide

/-- Coefficient term 212 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0212 : Poly :=
[
  term ((395910373848515 : Rat) / 8703213785532) [(2, 1), (10, 1)]
]

/-- Partial product 212 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0212 : Poly :=
[
  term ((-395910373848515 : Rat) / 4351606892766) [(0, 1), (2, 1), (10, 1), (14, 1)],
  term ((395910373848515 : Rat) / 8703213785532) [(0, 2), (2, 1), (10, 1)],
  term ((-395910373848515 : Rat) / 4351606892766) [(1, 1), (2, 1), (10, 1), (15, 1)],
  term ((395910373848515 : Rat) / 8703213785532) [(1, 2), (2, 1), (10, 1)],
  term ((-395910373848515 : Rat) / 8703213785532) [(2, 1), (10, 1)],
  term ((395910373848515 : Rat) / 4351606892766) [(2, 1), (10, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 212 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0212_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0212
        rs_R009_ueqv_R009YNNNN_generator_28_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_28_0212 := by
  native_decide

/-- Coefficient term 213 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0213 : Poly :=
[
  term ((8328205440429481 : Rat) / 4262798588832) [(2, 1), (11, 1), (13, 1)]
]

/-- Partial product 213 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0213 : Poly :=
[
  term ((-8328205440429481 : Rat) / 2131399294416) [(0, 1), (2, 1), (11, 1), (13, 1), (14, 1)],
  term ((8328205440429481 : Rat) / 4262798588832) [(0, 2), (2, 1), (11, 1), (13, 1)],
  term ((-8328205440429481 : Rat) / 2131399294416) [(1, 1), (2, 1), (11, 1), (13, 1), (15, 1)],
  term ((8328205440429481 : Rat) / 4262798588832) [(1, 2), (2, 1), (11, 1), (13, 1)],
  term ((-8328205440429481 : Rat) / 4262798588832) [(2, 1), (11, 1), (13, 1)],
  term ((8328205440429481 : Rat) / 2131399294416) [(2, 1), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 213 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0213_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0213
        rs_R009_ueqv_R009YNNNN_generator_28_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_28_0213 := by
  native_decide

/-- Coefficient term 214 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0214 : Poly :=
[
  term ((-8605 : Rat) / 336) [(2, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 214 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0214 : Poly :=
[
  term ((8605 : Rat) / 168) [(0, 1), (2, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-8605 : Rat) / 336) [(0, 2), (2, 1), (11, 1), (13, 1), (16, 1)],
  term ((8605 : Rat) / 168) [(1, 1), (2, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-8605 : Rat) / 336) [(1, 2), (2, 1), (11, 1), (13, 1), (16, 1)],
  term ((-8605 : Rat) / 168) [(2, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((8605 : Rat) / 336) [(2, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 214 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0214_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0214
        rs_R009_ueqv_R009YNNNN_generator_28_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_28_0214 := by
  native_decide

/-- Coefficient term 215 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0215 : Poly :=
[
  term ((1532199782809 : Rat) / 26861770943) [(2, 1), (11, 1), (14, 1), (15, 1)]
]

/-- Partial product 215 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0215 : Poly :=
[
  term ((-3064399565618 : Rat) / 26861770943) [(0, 1), (2, 1), (11, 1), (14, 2), (15, 1)],
  term ((1532199782809 : Rat) / 26861770943) [(0, 2), (2, 1), (11, 1), (14, 1), (15, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(1, 1), (2, 1), (11, 1), (14, 1), (15, 2)],
  term ((1532199782809 : Rat) / 26861770943) [(1, 2), (2, 1), (11, 1), (14, 1), (15, 1)],
  term ((-1532199782809 : Rat) / 26861770943) [(2, 1), (11, 1), (14, 1), (15, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(2, 1), (11, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 215 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0215_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0215
        rs_R009_ueqv_R009YNNNN_generator_28_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_28_0215 := by
  native_decide

/-- Coefficient term 216 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0216 : Poly :=
[
  term ((-221279613094576105 : Rat) / 52219282713192) [(2, 1), (11, 1), (15, 1)]
]

/-- Partial product 216 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0216 : Poly :=
[
  term ((221279613094576105 : Rat) / 26109641356596) [(0, 1), (2, 1), (11, 1), (14, 1), (15, 1)],
  term ((-221279613094576105 : Rat) / 52219282713192) [(0, 2), (2, 1), (11, 1), (15, 1)],
  term ((221279613094576105 : Rat) / 26109641356596) [(1, 1), (2, 1), (11, 1), (15, 2)],
  term ((-221279613094576105 : Rat) / 52219282713192) [(1, 2), (2, 1), (11, 1), (15, 1)],
  term ((-221279613094576105 : Rat) / 26109641356596) [(2, 1), (11, 1), (14, 1), (15, 1)],
  term ((221279613094576105 : Rat) / 52219282713192) [(2, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 216 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0216_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0216
        rs_R009_ueqv_R009YNNNN_generator_28_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_28_0216 := by
  native_decide

/-- Coefficient term 217 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0217 : Poly :=
[
  term ((1549 : Rat) / 84) [(2, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 217 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0217 : Poly :=
[
  term ((-1549 : Rat) / 42) [(0, 1), (2, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((1549 : Rat) / 84) [(0, 2), (2, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1549 : Rat) / 42) [(1, 1), (2, 1), (11, 1), (15, 2), (16, 1)],
  term ((1549 : Rat) / 84) [(1, 2), (2, 1), (11, 1), (15, 1), (16, 1)],
  term ((1549 : Rat) / 42) [(2, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1549 : Rat) / 84) [(2, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 217 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0217_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0217
        rs_R009_ueqv_R009YNNNN_generator_28_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_28_0217 := by
  native_decide

/-- Coefficient term 218 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0218 : Poly :=
[
  term ((20254808239762003 : Rat) / 17406427571064) [(2, 1), (11, 2)]
]

/-- Partial product 218 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0218 : Poly :=
[
  term ((-20254808239762003 : Rat) / 8703213785532) [(0, 1), (2, 1), (11, 2), (14, 1)],
  term ((20254808239762003 : Rat) / 17406427571064) [(0, 2), (2, 1), (11, 2)],
  term ((-20254808239762003 : Rat) / 8703213785532) [(1, 1), (2, 1), (11, 2), (15, 1)],
  term ((20254808239762003 : Rat) / 17406427571064) [(1, 2), (2, 1), (11, 2)],
  term ((-20254808239762003 : Rat) / 17406427571064) [(2, 1), (11, 2)],
  term ((20254808239762003 : Rat) / 8703213785532) [(2, 1), (11, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 218 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0218_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0218
        rs_R009_ueqv_R009YNNNN_generator_28_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_28_0218 := by
  native_decide

/-- Coefficient term 219 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0219 : Poly :=
[
  term ((-286471595296571 : Rat) / 399637367703) [(2, 1), (13, 1), (15, 1)]
]

/-- Partial product 219 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0219 : Poly :=
[
  term ((572943190593142 : Rat) / 399637367703) [(0, 1), (2, 1), (13, 1), (14, 1), (15, 1)],
  term ((-286471595296571 : Rat) / 399637367703) [(0, 2), (2, 1), (13, 1), (15, 1)],
  term ((572943190593142 : Rat) / 399637367703) [(1, 1), (2, 1), (13, 1), (15, 2)],
  term ((-286471595296571 : Rat) / 399637367703) [(1, 2), (2, 1), (13, 1), (15, 1)],
  term ((-572943190593142 : Rat) / 399637367703) [(2, 1), (13, 1), (14, 1), (15, 1)],
  term ((286471595296571 : Rat) / 399637367703) [(2, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 219 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0219_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0219
        rs_R009_ueqv_R009YNNNN_generator_28_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_28_0219 := by
  native_decide

/-- Coefficient term 220 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0220 : Poly :=
[
  term ((-170 : Rat) / 63) [(2, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 220 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0220 : Poly :=
[
  term ((340 : Rat) / 63) [(0, 1), (2, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-170 : Rat) / 63) [(0, 2), (2, 1), (13, 1), (15, 1), (16, 1)],
  term ((340 : Rat) / 63) [(1, 1), (2, 1), (13, 1), (15, 2), (16, 1)],
  term ((-170 : Rat) / 63) [(1, 2), (2, 1), (13, 1), (15, 1), (16, 1)],
  term ((-340 : Rat) / 63) [(2, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((170 : Rat) / 63) [(2, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 220 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0220_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0220
        rs_R009_ueqv_R009YNNNN_generator_28_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_28_0220 := by
  native_decide

/-- Coefficient term 221 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0221 : Poly :=
[
  term ((524228088584140 : Rat) / 2175803446383) [(2, 1), (14, 1)]
]

/-- Partial product 221 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0221 : Poly :=
[
  term ((-1048456177168280 : Rat) / 2175803446383) [(0, 1), (2, 1), (14, 2)],
  term ((524228088584140 : Rat) / 2175803446383) [(0, 2), (2, 1), (14, 1)],
  term ((-1048456177168280 : Rat) / 2175803446383) [(1, 1), (2, 1), (14, 1), (15, 1)],
  term ((524228088584140 : Rat) / 2175803446383) [(1, 2), (2, 1), (14, 1)],
  term ((-524228088584140 : Rat) / 2175803446383) [(2, 1), (14, 1)],
  term ((1048456177168280 : Rat) / 2175803446383) [(2, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 221 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0221_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0221
        rs_R009_ueqv_R009YNNNN_generator_28_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_28_0221 := by
  native_decide

/-- Coefficient term 222 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0222 : Poly :=
[
  term ((-10143334851217007 : Rat) / 26109641356596) [(2, 1), (14, 2)]
]

/-- Partial product 222 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0222 : Poly :=
[
  term ((10143334851217007 : Rat) / 13054820678298) [(0, 1), (2, 1), (14, 3)],
  term ((-10143334851217007 : Rat) / 26109641356596) [(0, 2), (2, 1), (14, 2)],
  term ((10143334851217007 : Rat) / 13054820678298) [(1, 1), (2, 1), (14, 2), (15, 1)],
  term ((-10143334851217007 : Rat) / 26109641356596) [(1, 2), (2, 1), (14, 2)],
  term ((10143334851217007 : Rat) / 26109641356596) [(2, 1), (14, 2)],
  term ((-10143334851217007 : Rat) / 13054820678298) [(2, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 222 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0222_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0222
        rs_R009_ueqv_R009YNNNN_generator_28_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_28_0222 := by
  native_decide

/-- Coefficient term 223 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0223 : Poly :=
[
  term ((36830853064497271 : Rat) / 26109641356596) [(2, 1), (15, 2)]
]

/-- Partial product 223 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0223 : Poly :=
[
  term ((-36830853064497271 : Rat) / 13054820678298) [(0, 1), (2, 1), (14, 1), (15, 2)],
  term ((36830853064497271 : Rat) / 26109641356596) [(0, 2), (2, 1), (15, 2)],
  term ((-36830853064497271 : Rat) / 13054820678298) [(1, 1), (2, 1), (15, 3)],
  term ((36830853064497271 : Rat) / 26109641356596) [(1, 2), (2, 1), (15, 2)],
  term ((36830853064497271 : Rat) / 13054820678298) [(2, 1), (14, 1), (15, 2)],
  term ((-36830853064497271 : Rat) / 26109641356596) [(2, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 223 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0223_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0223
        rs_R009_ueqv_R009YNNNN_generator_28_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_28_0223 := by
  native_decide

/-- Coefficient term 224 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0224 : Poly :=
[
  term ((32 : Rat) / 9) [(2, 1), (15, 2), (16, 1)]
]

/-- Partial product 224 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0224 : Poly :=
[
  term ((-64 : Rat) / 9) [(0, 1), (2, 1), (14, 1), (15, 2), (16, 1)],
  term ((32 : Rat) / 9) [(0, 2), (2, 1), (15, 2), (16, 1)],
  term ((-64 : Rat) / 9) [(1, 1), (2, 1), (15, 3), (16, 1)],
  term ((32 : Rat) / 9) [(1, 2), (2, 1), (15, 2), (16, 1)],
  term ((64 : Rat) / 9) [(2, 1), (14, 1), (15, 2), (16, 1)],
  term ((-32 : Rat) / 9) [(2, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 224 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0224_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0224
        rs_R009_ueqv_R009YNNNN_generator_28_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_28_0224 := by
  native_decide

/-- Coefficient term 225 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0225 : Poly :=
[
  term ((1063033397773325 : Rat) / 26109641356596) [(2, 2)]
]

/-- Partial product 225 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0225 : Poly :=
[
  term ((-1063033397773325 : Rat) / 13054820678298) [(0, 1), (2, 2), (14, 1)],
  term ((1063033397773325 : Rat) / 26109641356596) [(0, 2), (2, 2)],
  term ((-1063033397773325 : Rat) / 13054820678298) [(1, 1), (2, 2), (15, 1)],
  term ((1063033397773325 : Rat) / 26109641356596) [(1, 2), (2, 2)],
  term ((-1063033397773325 : Rat) / 26109641356596) [(2, 2)],
  term ((1063033397773325 : Rat) / 13054820678298) [(2, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 225 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0225_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0225
        rs_R009_ueqv_R009YNNNN_generator_28_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_28_0225 := by
  native_decide

/-- Coefficient term 226 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0226 : Poly :=
[
  term ((640 : Rat) / 21) [(3, 1), (5, 1)]
]

/-- Partial product 226 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0226 : Poly :=
[
  term ((-1280 : Rat) / 21) [(0, 1), (3, 1), (5, 1), (14, 1)],
  term ((640 : Rat) / 21) [(0, 2), (3, 1), (5, 1)],
  term ((-1280 : Rat) / 21) [(1, 1), (3, 1), (5, 1), (15, 1)],
  term ((640 : Rat) / 21) [(1, 2), (3, 1), (5, 1)],
  term ((-640 : Rat) / 21) [(3, 1), (5, 1)],
  term ((1280 : Rat) / 21) [(3, 1), (5, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 226 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0226_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0226
        rs_R009_ueqv_R009YNNNN_generator_28_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_28_0226 := by
  native_decide

/-- Coefficient term 227 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0227 : Poly :=
[
  term ((-320 : Rat) / 7) [(3, 1), (5, 1), (14, 1)]
]

/-- Partial product 227 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0227 : Poly :=
[
  term ((640 : Rat) / 7) [(0, 1), (3, 1), (5, 1), (14, 2)],
  term ((-320 : Rat) / 7) [(0, 2), (3, 1), (5, 1), (14, 1)],
  term ((640 : Rat) / 7) [(1, 1), (3, 1), (5, 1), (14, 1), (15, 1)],
  term ((-320 : Rat) / 7) [(1, 2), (3, 1), (5, 1), (14, 1)],
  term ((320 : Rat) / 7) [(3, 1), (5, 1), (14, 1)],
  term ((-640 : Rat) / 7) [(3, 1), (5, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 227 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0227_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0227
        rs_R009_ueqv_R009YNNNN_generator_28_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_28_0227 := by
  native_decide

/-- Coefficient term 228 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0228 : Poly :=
[
  term ((-97280 : Rat) / 343) [(3, 1), (5, 1), (15, 2)]
]

/-- Partial product 228 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0228 : Poly :=
[
  term ((194560 : Rat) / 343) [(0, 1), (3, 1), (5, 1), (14, 1), (15, 2)],
  term ((-97280 : Rat) / 343) [(0, 2), (3, 1), (5, 1), (15, 2)],
  term ((194560 : Rat) / 343) [(1, 1), (3, 1), (5, 1), (15, 3)],
  term ((-97280 : Rat) / 343) [(1, 2), (3, 1), (5, 1), (15, 2)],
  term ((-194560 : Rat) / 343) [(3, 1), (5, 1), (14, 1), (15, 2)],
  term ((97280 : Rat) / 343) [(3, 1), (5, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 228 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0228_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0228
        rs_R009_ueqv_R009YNNNN_generator_28_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_28_0228 := by
  native_decide

/-- Coefficient term 229 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0229 : Poly :=
[
  term ((9311178080130293 : Rat) / 13054820678298) [(3, 1), (6, 1), (7, 1)]
]

/-- Partial product 229 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0229 : Poly :=
[
  term ((-9311178080130293 : Rat) / 6527410339149) [(0, 1), (3, 1), (6, 1), (7, 1), (14, 1)],
  term ((9311178080130293 : Rat) / 13054820678298) [(0, 2), (3, 1), (6, 1), (7, 1)],
  term ((-9311178080130293 : Rat) / 6527410339149) [(1, 1), (3, 1), (6, 1), (7, 1), (15, 1)],
  term ((9311178080130293 : Rat) / 13054820678298) [(1, 2), (3, 1), (6, 1), (7, 1)],
  term ((-9311178080130293 : Rat) / 13054820678298) [(3, 1), (6, 1), (7, 1)],
  term ((9311178080130293 : Rat) / 6527410339149) [(3, 1), (6, 1), (7, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 229 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0229_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0229
        rs_R009_ueqv_R009YNNNN_generator_28_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_28_0229 := by
  native_decide

/-- Coefficient term 230 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0230 : Poly :=
[
  term ((-6788130415625 : Rat) / 20234803428) [(3, 1), (6, 1), (9, 1)]
]

/-- Partial product 230 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0230 : Poly :=
[
  term ((6788130415625 : Rat) / 10117401714) [(0, 1), (3, 1), (6, 1), (9, 1), (14, 1)],
  term ((-6788130415625 : Rat) / 20234803428) [(0, 2), (3, 1), (6, 1), (9, 1)],
  term ((6788130415625 : Rat) / 10117401714) [(1, 1), (3, 1), (6, 1), (9, 1), (15, 1)],
  term ((-6788130415625 : Rat) / 20234803428) [(1, 2), (3, 1), (6, 1), (9, 1)],
  term ((6788130415625 : Rat) / 20234803428) [(3, 1), (6, 1), (9, 1)],
  term ((-6788130415625 : Rat) / 10117401714) [(3, 1), (6, 1), (9, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 230 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0230_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0230
        rs_R009_ueqv_R009YNNNN_generator_28_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_28_0230 := by
  native_decide

/-- Coefficient term 231 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0231 : Poly :=
[
  term ((-173351835750269089 : Rat) / 78328924069788) [(3, 1), (6, 1), (11, 1)]
]

/-- Partial product 231 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0231 : Poly :=
[
  term ((173351835750269089 : Rat) / 39164462034894) [(0, 1), (3, 1), (6, 1), (11, 1), (14, 1)],
  term ((-173351835750269089 : Rat) / 78328924069788) [(0, 2), (3, 1), (6, 1), (11, 1)],
  term ((173351835750269089 : Rat) / 39164462034894) [(1, 1), (3, 1), (6, 1), (11, 1), (15, 1)],
  term ((-173351835750269089 : Rat) / 78328924069788) [(1, 2), (3, 1), (6, 1), (11, 1)],
  term ((173351835750269089 : Rat) / 78328924069788) [(3, 1), (6, 1), (11, 1)],
  term ((-173351835750269089 : Rat) / 39164462034894) [(3, 1), (6, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 231 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0231_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0231
        rs_R009_ueqv_R009YNNNN_generator_28_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_28_0231 := by
  native_decide

/-- Coefficient term 232 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0232 : Poly :=
[
  term ((-33944746640006525 : Rat) / 78328924069788) [(3, 1), (6, 1), (12, 1), (15, 1)]
]

/-- Partial product 232 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0232 : Poly :=
[
  term ((33944746640006525 : Rat) / 39164462034894) [(0, 1), (3, 1), (6, 1), (12, 1), (14, 1), (15, 1)],
  term ((-33944746640006525 : Rat) / 78328924069788) [(0, 2), (3, 1), (6, 1), (12, 1), (15, 1)],
  term ((33944746640006525 : Rat) / 39164462034894) [(1, 1), (3, 1), (6, 1), (12, 1), (15, 2)],
  term ((-33944746640006525 : Rat) / 78328924069788) [(1, 2), (3, 1), (6, 1), (12, 1), (15, 1)],
  term ((-33944746640006525 : Rat) / 39164462034894) [(3, 1), (6, 1), (12, 1), (14, 1), (15, 1)],
  term ((33944746640006525 : Rat) / 78328924069788) [(3, 1), (6, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 232 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0232_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0232
        rs_R009_ueqv_R009YNNNN_generator_28_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_28_0232 := by
  native_decide

/-- Coefficient term 233 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0233 : Poly :=
[
  term ((280381883026811 : Rat) / 799274735406) [(3, 1), (6, 1), (13, 1)]
]

/-- Partial product 233 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0233 : Poly :=
[
  term ((-280381883026811 : Rat) / 399637367703) [(0, 1), (3, 1), (6, 1), (13, 1), (14, 1)],
  term ((280381883026811 : Rat) / 799274735406) [(0, 2), (3, 1), (6, 1), (13, 1)],
  term ((-280381883026811 : Rat) / 399637367703) [(1, 1), (3, 1), (6, 1), (13, 1), (15, 1)],
  term ((280381883026811 : Rat) / 799274735406) [(1, 2), (3, 1), (6, 1), (13, 1)],
  term ((-280381883026811 : Rat) / 799274735406) [(3, 1), (6, 1), (13, 1)],
  term ((280381883026811 : Rat) / 399637367703) [(3, 1), (6, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 233 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0233_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0233
        rs_R009_ueqv_R009YNNNN_generator_28_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_28_0233 := by
  native_decide

/-- Coefficient term 234 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0234 : Poly :=
[
  term ((-186880 : Rat) / 3087) [(3, 1), (6, 1), (13, 1), (15, 2)]
]

/-- Partial product 234 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0234 : Poly :=
[
  term ((373760 : Rat) / 3087) [(0, 1), (3, 1), (6, 1), (13, 1), (14, 1), (15, 2)],
  term ((-186880 : Rat) / 3087) [(0, 2), (3, 1), (6, 1), (13, 1), (15, 2)],
  term ((373760 : Rat) / 3087) [(1, 1), (3, 1), (6, 1), (13, 1), (15, 3)],
  term ((-186880 : Rat) / 3087) [(1, 2), (3, 1), (6, 1), (13, 1), (15, 2)],
  term ((-373760 : Rat) / 3087) [(3, 1), (6, 1), (13, 1), (14, 1), (15, 2)],
  term ((186880 : Rat) / 3087) [(3, 1), (6, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 234 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0234_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0234
        rs_R009_ueqv_R009YNNNN_generator_28_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_28_0234 := by
  native_decide

/-- Coefficient term 235 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0235 : Poly :=
[
  term ((85 : Rat) / 63) [(3, 1), (6, 1), (13, 1), (16, 1)]
]

/-- Partial product 235 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0235 : Poly :=
[
  term ((-170 : Rat) / 63) [(0, 1), (3, 1), (6, 1), (13, 1), (14, 1), (16, 1)],
  term ((85 : Rat) / 63) [(0, 2), (3, 1), (6, 1), (13, 1), (16, 1)],
  term ((-170 : Rat) / 63) [(1, 1), (3, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((85 : Rat) / 63) [(1, 2), (3, 1), (6, 1), (13, 1), (16, 1)],
  term ((170 : Rat) / 63) [(3, 1), (6, 1), (13, 1), (14, 1), (16, 1)],
  term ((-85 : Rat) / 63) [(3, 1), (6, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 235 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0235_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0235
        rs_R009_ueqv_R009YNNNN_generator_28_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_28_0235 := by
  native_decide

/-- Coefficient term 236 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0236 : Poly :=
[
  term ((6472119103841 : Rat) / 241755938487) [(3, 1), (6, 1), (14, 1), (15, 1)]
]

/-- Partial product 236 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0236 : Poly :=
[
  term ((-12944238207682 : Rat) / 241755938487) [(0, 1), (3, 1), (6, 1), (14, 2), (15, 1)],
  term ((6472119103841 : Rat) / 241755938487) [(0, 2), (3, 1), (6, 1), (14, 1), (15, 1)],
  term ((-12944238207682 : Rat) / 241755938487) [(1, 1), (3, 1), (6, 1), (14, 1), (15, 2)],
  term ((6472119103841 : Rat) / 241755938487) [(1, 2), (3, 1), (6, 1), (14, 1), (15, 1)],
  term ((-6472119103841 : Rat) / 241755938487) [(3, 1), (6, 1), (14, 1), (15, 1)],
  term ((12944238207682 : Rat) / 241755938487) [(3, 1), (6, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 236 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0236_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0236
        rs_R009_ueqv_R009YNNNN_generator_28_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_28_0236 := by
  native_decide

/-- Coefficient term 237 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0237 : Poly :=
[
  term ((7054254498875453 : Rat) / 4351606892766) [(3, 1), (6, 1), (15, 1)]
]

/-- Partial product 237 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0237 : Poly :=
[
  term ((-7054254498875453 : Rat) / 2175803446383) [(0, 1), (3, 1), (6, 1), (14, 1), (15, 1)],
  term ((7054254498875453 : Rat) / 4351606892766) [(0, 2), (3, 1), (6, 1), (15, 1)],
  term ((-7054254498875453 : Rat) / 2175803446383) [(1, 1), (3, 1), (6, 1), (15, 2)],
  term ((7054254498875453 : Rat) / 4351606892766) [(1, 2), (3, 1), (6, 1), (15, 1)],
  term ((7054254498875453 : Rat) / 2175803446383) [(3, 1), (6, 1), (14, 1), (15, 1)],
  term ((-7054254498875453 : Rat) / 4351606892766) [(3, 1), (6, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 237 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0237_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0237
        rs_R009_ueqv_R009YNNNN_generator_28_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_28_0237 := by
  native_decide

/-- Coefficient term 238 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0238 : Poly :=
[
  term ((-16 : Rat) / 9) [(3, 1), (6, 1), (15, 1), (16, 1)]
]

/-- Partial product 238 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0238 : Poly :=
[
  term ((32 : Rat) / 9) [(0, 1), (3, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((-16 : Rat) / 9) [(0, 2), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((32 : Rat) / 9) [(1, 1), (3, 1), (6, 1), (15, 2), (16, 1)],
  term ((-16 : Rat) / 9) [(1, 2), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((-32 : Rat) / 9) [(3, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((16 : Rat) / 9) [(3, 1), (6, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 238 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0238_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0238
        rs_R009_ueqv_R009YNNNN_generator_28_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_28_0238 := by
  native_decide

/-- Coefficient term 239 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0239 : Poly :=
[
  term ((373760 : Rat) / 3087) [(3, 1), (6, 1), (15, 3)]
]

/-- Partial product 239 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0239 : Poly :=
[
  term ((-747520 : Rat) / 3087) [(0, 1), (3, 1), (6, 1), (14, 1), (15, 3)],
  term ((373760 : Rat) / 3087) [(0, 2), (3, 1), (6, 1), (15, 3)],
  term ((-747520 : Rat) / 3087) [(1, 1), (3, 1), (6, 1), (15, 4)],
  term ((373760 : Rat) / 3087) [(1, 2), (3, 1), (6, 1), (15, 3)],
  term ((747520 : Rat) / 3087) [(3, 1), (6, 1), (14, 1), (15, 3)],
  term ((-373760 : Rat) / 3087) [(3, 1), (6, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 239 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0239_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0239
        rs_R009_ueqv_R009YNNNN_generator_28_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_28_0239 := by
  native_decide

/-- Coefficient term 240 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0240 : Poly :=
[
  term ((-249611075209385 : Rat) / 11189846295684) [(3, 1), (7, 1)]
]

/-- Partial product 240 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0240 : Poly :=
[
  term ((249611075209385 : Rat) / 5594923147842) [(0, 1), (3, 1), (7, 1), (14, 1)],
  term ((-249611075209385 : Rat) / 11189846295684) [(0, 2), (3, 1), (7, 1)],
  term ((249611075209385 : Rat) / 5594923147842) [(1, 1), (3, 1), (7, 1), (15, 1)],
  term ((-249611075209385 : Rat) / 11189846295684) [(1, 2), (3, 1), (7, 1)],
  term ((249611075209385 : Rat) / 11189846295684) [(3, 1), (7, 1)],
  term ((-249611075209385 : Rat) / 5594923147842) [(3, 1), (7, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 240 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0240_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0240
        rs_R009_ueqv_R009YNNNN_generator_28_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_28_0240 := by
  native_decide

/-- Coefficient term 241 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0241 : Poly :=
[
  term ((129097240585215053 : Rat) / 156657848139576) [(3, 1), (7, 1), (10, 1)]
]

/-- Partial product 241 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0241 : Poly :=
[
  term ((-129097240585215053 : Rat) / 78328924069788) [(0, 1), (3, 1), (7, 1), (10, 1), (14, 1)],
  term ((129097240585215053 : Rat) / 156657848139576) [(0, 2), (3, 1), (7, 1), (10, 1)],
  term ((-129097240585215053 : Rat) / 78328924069788) [(1, 1), (3, 1), (7, 1), (10, 1), (15, 1)],
  term ((129097240585215053 : Rat) / 156657848139576) [(1, 2), (3, 1), (7, 1), (10, 1)],
  term ((-129097240585215053 : Rat) / 156657848139576) [(3, 1), (7, 1), (10, 1)],
  term ((129097240585215053 : Rat) / 78328924069788) [(3, 1), (7, 1), (10, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 241 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0241_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0241
        rs_R009_ueqv_R009YNNNN_generator_28_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_28_0241 := by
  native_decide

/-- Coefficient term 242 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0242 : Poly :=
[
  term ((33944746640006525 : Rat) / 78328924069788) [(3, 1), (7, 1), (12, 1), (14, 1)]
]

/-- Partial product 242 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0242 : Poly :=
[
  term ((-33944746640006525 : Rat) / 39164462034894) [(0, 1), (3, 1), (7, 1), (12, 1), (14, 2)],
  term ((33944746640006525 : Rat) / 78328924069788) [(0, 2), (3, 1), (7, 1), (12, 1), (14, 1)],
  term ((-33944746640006525 : Rat) / 39164462034894) [(1, 1), (3, 1), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((33944746640006525 : Rat) / 78328924069788) [(1, 2), (3, 1), (7, 1), (12, 1), (14, 1)],
  term ((-33944746640006525 : Rat) / 78328924069788) [(3, 1), (7, 1), (12, 1), (14, 1)],
  term ((33944746640006525 : Rat) / 39164462034894) [(3, 1), (7, 1), (12, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 242 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0242_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0242
        rs_R009_ueqv_R009YNNNN_generator_28_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_28_0242 := by
  native_decide

/-- Coefficient term 243 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0243 : Poly :=
[
  term ((186880 : Rat) / 3087) [(3, 1), (7, 1), (12, 1), (15, 2)]
]

/-- Partial product 243 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0243 : Poly :=
[
  term ((-373760 : Rat) / 3087) [(0, 1), (3, 1), (7, 1), (12, 1), (14, 1), (15, 2)],
  term ((186880 : Rat) / 3087) [(0, 2), (3, 1), (7, 1), (12, 1), (15, 2)],
  term ((-373760 : Rat) / 3087) [(1, 1), (3, 1), (7, 1), (12, 1), (15, 3)],
  term ((186880 : Rat) / 3087) [(1, 2), (3, 1), (7, 1), (12, 1), (15, 2)],
  term ((373760 : Rat) / 3087) [(3, 1), (7, 1), (12, 1), (14, 1), (15, 2)],
  term ((-186880 : Rat) / 3087) [(3, 1), (7, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 243 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0243_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0243
        rs_R009_ueqv_R009YNNNN_generator_28_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_28_0243 := by
  native_decide

/-- Coefficient term 244 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0244 : Poly :=
[
  term ((-52982721593064289 : Rat) / 52219282713192) [(3, 1), (7, 1), (14, 1)]
]

/-- Partial product 244 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0244 : Poly :=
[
  term ((52982721593064289 : Rat) / 26109641356596) [(0, 1), (3, 1), (7, 1), (14, 2)],
  term ((-52982721593064289 : Rat) / 52219282713192) [(0, 2), (3, 1), (7, 1), (14, 1)],
  term ((52982721593064289 : Rat) / 26109641356596) [(1, 1), (3, 1), (7, 1), (14, 1), (15, 1)],
  term ((-52982721593064289 : Rat) / 52219282713192) [(1, 2), (3, 1), (7, 1), (14, 1)],
  term ((52982721593064289 : Rat) / 52219282713192) [(3, 1), (7, 1), (14, 1)],
  term ((-52982721593064289 : Rat) / 26109641356596) [(3, 1), (7, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 244 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0244_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0244
        rs_R009_ueqv_R009YNNNN_generator_28_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_28_0244 := by
  native_decide

/-- Coefficient term 245 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0245 : Poly :=
[
  term ((-373760 : Rat) / 3087) [(3, 1), (7, 1), (14, 1), (15, 2)]
]

/-- Partial product 245 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0245 : Poly :=
[
  term ((747520 : Rat) / 3087) [(0, 1), (3, 1), (7, 1), (14, 2), (15, 2)],
  term ((-373760 : Rat) / 3087) [(0, 2), (3, 1), (7, 1), (14, 1), (15, 2)],
  term ((747520 : Rat) / 3087) [(1, 1), (3, 1), (7, 1), (14, 1), (15, 3)],
  term ((-373760 : Rat) / 3087) [(1, 2), (3, 1), (7, 1), (14, 1), (15, 2)],
  term ((373760 : Rat) / 3087) [(3, 1), (7, 1), (14, 1), (15, 2)],
  term ((-747520 : Rat) / 3087) [(3, 1), (7, 1), (14, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 245 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0245_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0245
        rs_R009_ueqv_R009YNNNN_generator_28_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_28_0245 := by
  native_decide

/-- Coefficient term 246 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0246 : Poly :=
[
  term ((-93440 : Rat) / 1029) [(3, 1), (7, 1), (15, 2)]
]

/-- Partial product 246 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0246 : Poly :=
[
  term ((186880 : Rat) / 1029) [(0, 1), (3, 1), (7, 1), (14, 1), (15, 2)],
  term ((-93440 : Rat) / 1029) [(0, 2), (3, 1), (7, 1), (15, 2)],
  term ((186880 : Rat) / 1029) [(1, 1), (3, 1), (7, 1), (15, 3)],
  term ((-93440 : Rat) / 1029) [(1, 2), (3, 1), (7, 1), (15, 2)],
  term ((-186880 : Rat) / 1029) [(3, 1), (7, 1), (14, 1), (15, 2)],
  term ((93440 : Rat) / 1029) [(3, 1), (7, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 246 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0246_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0246
        rs_R009_ueqv_R009YNNNN_generator_28_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_28_0246 := by
  native_decide

/-- Coefficient term 247 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0247 : Poly :=
[
  term ((-640 : Rat) / 21) [(3, 1), (9, 1)]
]

/-- Partial product 247 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0247 : Poly :=
[
  term ((1280 : Rat) / 21) [(0, 1), (3, 1), (9, 1), (14, 1)],
  term ((-640 : Rat) / 21) [(0, 2), (3, 1), (9, 1)],
  term ((1280 : Rat) / 21) [(1, 1), (3, 1), (9, 1), (15, 1)],
  term ((-640 : Rat) / 21) [(1, 2), (3, 1), (9, 1)],
  term ((640 : Rat) / 21) [(3, 1), (9, 1)],
  term ((-1280 : Rat) / 21) [(3, 1), (9, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 247 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0247_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0247
        rs_R009_ueqv_R009YNNNN_generator_28_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_28_0247 := by
  native_decide

/-- Coefficient term 248 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0248 : Poly :=
[
  term ((275055044441125 : Rat) / 323756854848) [(3, 1), (9, 1), (10, 1)]
]

/-- Partial product 248 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0248 : Poly :=
[
  term ((-275055044441125 : Rat) / 161878427424) [(0, 1), (3, 1), (9, 1), (10, 1), (14, 1)],
  term ((275055044441125 : Rat) / 323756854848) [(0, 2), (3, 1), (9, 1), (10, 1)],
  term ((-275055044441125 : Rat) / 161878427424) [(1, 1), (3, 1), (9, 1), (10, 1), (15, 1)],
  term ((275055044441125 : Rat) / 323756854848) [(1, 2), (3, 1), (9, 1), (10, 1)],
  term ((-275055044441125 : Rat) / 323756854848) [(3, 1), (9, 1), (10, 1)],
  term ((275055044441125 : Rat) / 161878427424) [(3, 1), (9, 1), (10, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 248 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0248_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0248
        rs_R009_ueqv_R009YNNNN_generator_28_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_28_0248 := by
  native_decide

/-- Coefficient term 249 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0249 : Poly :=
[
  term ((320 : Rat) / 7) [(3, 1), (9, 1), (14, 1)]
]

/-- Partial product 249 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0249 : Poly :=
[
  term ((-640 : Rat) / 7) [(0, 1), (3, 1), (9, 1), (14, 2)],
  term ((320 : Rat) / 7) [(0, 2), (3, 1), (9, 1), (14, 1)],
  term ((-640 : Rat) / 7) [(1, 1), (3, 1), (9, 1), (14, 1), (15, 1)],
  term ((320 : Rat) / 7) [(1, 2), (3, 1), (9, 1), (14, 1)],
  term ((-320 : Rat) / 7) [(3, 1), (9, 1), (14, 1)],
  term ((640 : Rat) / 7) [(3, 1), (9, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 249 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0249_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0249
        rs_R009_ueqv_R009YNNNN_generator_28_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_28_0249 := by
  native_decide

/-- Coefficient term 250 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0250 : Poly :=
[
  term ((97280 : Rat) / 343) [(3, 1), (9, 1), (15, 2)]
]

/-- Partial product 250 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0250 : Poly :=
[
  term ((-194560 : Rat) / 343) [(0, 1), (3, 1), (9, 1), (14, 1), (15, 2)],
  term ((97280 : Rat) / 343) [(0, 2), (3, 1), (9, 1), (15, 2)],
  term ((-194560 : Rat) / 343) [(1, 1), (3, 1), (9, 1), (15, 3)],
  term ((97280 : Rat) / 343) [(1, 2), (3, 1), (9, 1), (15, 2)],
  term ((194560 : Rat) / 343) [(3, 1), (9, 1), (14, 1), (15, 2)],
  term ((-97280 : Rat) / 343) [(3, 1), (9, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 250 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0250_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0250
        rs_R009_ueqv_R009YNNNN_generator_28_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_28_0250 := by
  native_decide

/-- Coefficient term 251 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0251 : Poly :=
[
  term ((-9822679084795405 : Rat) / 52219282713192) [(3, 1), (10, 1), (11, 1)]
]

/-- Partial product 251 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0251 : Poly :=
[
  term ((9822679084795405 : Rat) / 26109641356596) [(0, 1), (3, 1), (10, 1), (11, 1), (14, 1)],
  term ((-9822679084795405 : Rat) / 52219282713192) [(0, 2), (3, 1), (10, 1), (11, 1)],
  term ((9822679084795405 : Rat) / 26109641356596) [(1, 1), (3, 1), (10, 1), (11, 1), (15, 1)],
  term ((-9822679084795405 : Rat) / 52219282713192) [(1, 2), (3, 1), (10, 1), (11, 1)],
  term ((9822679084795405 : Rat) / 52219282713192) [(3, 1), (10, 1), (11, 1)],
  term ((-9822679084795405 : Rat) / 26109641356596) [(3, 1), (10, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 251 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0251_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0251
        rs_R009_ueqv_R009YNNNN_generator_28_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_28_0251 := by
  native_decide

/-- Coefficient term 252 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0252 : Poly :=
[
  term ((-11186576839603855 : Rat) / 12788395766496) [(3, 1), (10, 1), (13, 1)]
]

/-- Partial product 252 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0252 : Poly :=
[
  term ((11186576839603855 : Rat) / 6394197883248) [(0, 1), (3, 1), (10, 1), (13, 1), (14, 1)],
  term ((-11186576839603855 : Rat) / 12788395766496) [(0, 2), (3, 1), (10, 1), (13, 1)],
  term ((11186576839603855 : Rat) / 6394197883248) [(1, 1), (3, 1), (10, 1), (13, 1), (15, 1)],
  term ((-11186576839603855 : Rat) / 12788395766496) [(1, 2), (3, 1), (10, 1), (13, 1)],
  term ((11186576839603855 : Rat) / 12788395766496) [(3, 1), (10, 1), (13, 1)],
  term ((-11186576839603855 : Rat) / 6394197883248) [(3, 1), (10, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 252 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0252_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0252
        rs_R009_ueqv_R009YNNNN_generator_28_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_28_0252 := by
  native_decide

/-- Coefficient term 253 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0253 : Poly :=
[
  term ((5485 : Rat) / 144) [(3, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 253 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0253 : Poly :=
[
  term ((-5485 : Rat) / 72) [(0, 1), (3, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((5485 : Rat) / 144) [(0, 2), (3, 1), (10, 1), (13, 1), (16, 1)],
  term ((-5485 : Rat) / 72) [(1, 1), (3, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((5485 : Rat) / 144) [(1, 2), (3, 1), (10, 1), (13, 1), (16, 1)],
  term ((5485 : Rat) / 72) [(3, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-5485 : Rat) / 144) [(3, 1), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 253 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0253_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0253
        rs_R009_ueqv_R009YNNNN_generator_28_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_28_0253 := by
  native_decide

/-- Coefficient term 254 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0254 : Poly :=
[
  term ((28705177706595329 : Rat) / 26109641356596) [(3, 1), (10, 1), (15, 1)]
]

/-- Partial product 254 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0254 : Poly :=
[
  term ((-28705177706595329 : Rat) / 13054820678298) [(0, 1), (3, 1), (10, 1), (14, 1), (15, 1)],
  term ((28705177706595329 : Rat) / 26109641356596) [(0, 2), (3, 1), (10, 1), (15, 1)],
  term ((-28705177706595329 : Rat) / 13054820678298) [(1, 1), (3, 1), (10, 1), (15, 2)],
  term ((28705177706595329 : Rat) / 26109641356596) [(1, 2), (3, 1), (10, 1), (15, 1)],
  term ((28705177706595329 : Rat) / 13054820678298) [(3, 1), (10, 1), (14, 1), (15, 1)],
  term ((-28705177706595329 : Rat) / 26109641356596) [(3, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 254 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0254_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0254
        rs_R009_ueqv_R009YNNNN_generator_28_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_28_0254 := by
  native_decide

/-- Coefficient term 255 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0255 : Poly :=
[
  term ((-1117 : Rat) / 36) [(3, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 255 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0255 : Poly :=
[
  term ((1117 : Rat) / 18) [(0, 1), (3, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1117 : Rat) / 36) [(0, 2), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((1117 : Rat) / 18) [(1, 1), (3, 1), (10, 1), (15, 2), (16, 1)],
  term ((-1117 : Rat) / 36) [(1, 2), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((-1117 : Rat) / 18) [(3, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((1117 : Rat) / 36) [(3, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 255 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0255_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0255
        rs_R009_ueqv_R009YNNNN_generator_28_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_28_0255 := by
  native_decide

/-- Coefficient term 256 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0256 : Poly :=
[
  term ((23275627879084669 : Rat) / 156657848139576) [(3, 1), (11, 1)]
]

/-- Partial product 256 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0256 : Poly :=
[
  term ((-23275627879084669 : Rat) / 78328924069788) [(0, 1), (3, 1), (11, 1), (14, 1)],
  term ((23275627879084669 : Rat) / 156657848139576) [(0, 2), (3, 1), (11, 1)],
  term ((-23275627879084669 : Rat) / 78328924069788) [(1, 1), (3, 1), (11, 1), (15, 1)],
  term ((23275627879084669 : Rat) / 156657848139576) [(1, 2), (3, 1), (11, 1)],
  term ((-23275627879084669 : Rat) / 156657848139576) [(3, 1), (11, 1)],
  term ((23275627879084669 : Rat) / 78328924069788) [(3, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 256 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0256_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0256
        rs_R009_ueqv_R009YNNNN_generator_28_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_28_0256 := by
  native_decide

/-- Coefficient term 257 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0257 : Poly :=
[
  term ((7738260225025805 : Rat) / 156657848139576) [(3, 1), (11, 1), (14, 1)]
]

/-- Partial product 257 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0257 : Poly :=
[
  term ((-7738260225025805 : Rat) / 78328924069788) [(0, 1), (3, 1), (11, 1), (14, 2)],
  term ((7738260225025805 : Rat) / 156657848139576) [(0, 2), (3, 1), (11, 1), (14, 1)],
  term ((-7738260225025805 : Rat) / 78328924069788) [(1, 1), (3, 1), (11, 1), (14, 1), (15, 1)],
  term ((7738260225025805 : Rat) / 156657848139576) [(1, 2), (3, 1), (11, 1), (14, 1)],
  term ((-7738260225025805 : Rat) / 156657848139576) [(3, 1), (11, 1), (14, 1)],
  term ((7738260225025805 : Rat) / 78328924069788) [(3, 1), (11, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 257 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0257_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0257
        rs_R009_ueqv_R009YNNNN_generator_28_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_28_0257 := by
  native_decide

/-- Coefficient term 258 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0258 : Poly :=
[
  term ((320 : Rat) / 21) [(3, 1), (12, 1), (15, 1)]
]

/-- Partial product 258 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0258 : Poly :=
[
  term ((-640 : Rat) / 21) [(0, 1), (3, 1), (12, 1), (14, 1), (15, 1)],
  term ((320 : Rat) / 21) [(0, 2), (3, 1), (12, 1), (15, 1)],
  term ((-640 : Rat) / 21) [(1, 1), (3, 1), (12, 1), (15, 2)],
  term ((320 : Rat) / 21) [(1, 2), (3, 1), (12, 1), (15, 1)],
  term ((640 : Rat) / 21) [(3, 1), (12, 1), (14, 1), (15, 1)],
  term ((-320 : Rat) / 21) [(3, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 258 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0258_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0258
        rs_R009_ueqv_R009YNNNN_generator_28_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_28_0258 := by
  native_decide

/-- Coefficient term 259 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0259 : Poly :=
[
  term ((-186880 : Rat) / 3087) [(3, 1), (12, 1), (15, 3)]
]

/-- Partial product 259 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0259 : Poly :=
[
  term ((373760 : Rat) / 3087) [(0, 1), (3, 1), (12, 1), (14, 1), (15, 3)],
  term ((-186880 : Rat) / 3087) [(0, 2), (3, 1), (12, 1), (15, 3)],
  term ((373760 : Rat) / 3087) [(1, 1), (3, 1), (12, 1), (15, 4)],
  term ((-186880 : Rat) / 3087) [(1, 2), (3, 1), (12, 1), (15, 3)],
  term ((-373760 : Rat) / 3087) [(3, 1), (12, 1), (14, 1), (15, 3)],
  term ((186880 : Rat) / 3087) [(3, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 259 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0259_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0259
        rs_R009_ueqv_R009YNNNN_generator_28_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_28_0259 := by
  native_decide

/-- Coefficient term 260 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0260 : Poly :=
[
  term ((-31557579430260605 : Rat) / 156657848139576) [(3, 1), (13, 1)]
]

/-- Partial product 260 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0260 : Poly :=
[
  term ((31557579430260605 : Rat) / 78328924069788) [(0, 1), (3, 1), (13, 1), (14, 1)],
  term ((-31557579430260605 : Rat) / 156657848139576) [(0, 2), (3, 1), (13, 1)],
  term ((31557579430260605 : Rat) / 78328924069788) [(1, 1), (3, 1), (13, 1), (15, 1)],
  term ((-31557579430260605 : Rat) / 156657848139576) [(1, 2), (3, 1), (13, 1)],
  term ((31557579430260605 : Rat) / 156657848139576) [(3, 1), (13, 1)],
  term ((-31557579430260605 : Rat) / 78328924069788) [(3, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 260 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0260_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0260
        rs_R009_ueqv_R009YNNNN_generator_28_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_28_0260 := by
  native_decide

/-- Coefficient term 261 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0261 : Poly :=
[
  term ((30363995825387645 : Rat) / 78328924069788) [(3, 1), (13, 1), (14, 1)]
]

/-- Partial product 261 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0261 : Poly :=
[
  term ((-30363995825387645 : Rat) / 39164462034894) [(0, 1), (3, 1), (13, 1), (14, 2)],
  term ((30363995825387645 : Rat) / 78328924069788) [(0, 2), (3, 1), (13, 1), (14, 1)],
  term ((-30363995825387645 : Rat) / 39164462034894) [(1, 1), (3, 1), (13, 1), (14, 1), (15, 1)],
  term ((30363995825387645 : Rat) / 78328924069788) [(1, 2), (3, 1), (13, 1), (14, 1)],
  term ((-30363995825387645 : Rat) / 78328924069788) [(3, 1), (13, 1), (14, 1)],
  term ((30363995825387645 : Rat) / 39164462034894) [(3, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 261 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0261_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0261
        rs_R009_ueqv_R009YNNNN_generator_28_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_28_0261 := by
  native_decide

/-- Coefficient term 262 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0262 : Poly :=
[
  term ((186880 : Rat) / 3087) [(3, 1), (13, 1), (14, 1), (15, 2)]
]

/-- Partial product 262 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0262 : Poly :=
[
  term ((-373760 : Rat) / 3087) [(0, 1), (3, 1), (13, 1), (14, 2), (15, 2)],
  term ((186880 : Rat) / 3087) [(0, 2), (3, 1), (13, 1), (14, 1), (15, 2)],
  term ((-373760 : Rat) / 3087) [(1, 1), (3, 1), (13, 1), (14, 1), (15, 3)],
  term ((186880 : Rat) / 3087) [(1, 2), (3, 1), (13, 1), (14, 1), (15, 2)],
  term ((-186880 : Rat) / 3087) [(3, 1), (13, 1), (14, 1), (15, 2)],
  term ((373760 : Rat) / 3087) [(3, 1), (13, 1), (14, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 262 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0262_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0262
        rs_R009_ueqv_R009YNNNN_generator_28_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_28_0262 := by
  native_decide

/-- Coefficient term 263 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0263 : Poly :=
[
  term ((-688640 : Rat) / 3087) [(3, 1), (13, 1), (15, 2)]
]

/-- Partial product 263 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0263 : Poly :=
[
  term ((1377280 : Rat) / 3087) [(0, 1), (3, 1), (13, 1), (14, 1), (15, 2)],
  term ((-688640 : Rat) / 3087) [(0, 2), (3, 1), (13, 1), (15, 2)],
  term ((1377280 : Rat) / 3087) [(1, 1), (3, 1), (13, 1), (15, 3)],
  term ((-688640 : Rat) / 3087) [(1, 2), (3, 1), (13, 1), (15, 2)],
  term ((-1377280 : Rat) / 3087) [(3, 1), (13, 1), (14, 1), (15, 2)],
  term ((688640 : Rat) / 3087) [(3, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 263 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0263_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0263
        rs_R009_ueqv_R009YNNNN_generator_28_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_28_0263 := by
  native_decide

/-- Coefficient term 264 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0264 : Poly :=
[
  term ((-1404010174610438 : Rat) / 6527410339149) [(3, 1), (14, 1), (15, 1)]
]

/-- Partial product 264 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0264 : Poly :=
[
  term ((2808020349220876 : Rat) / 6527410339149) [(0, 1), (3, 1), (14, 2), (15, 1)],
  term ((-1404010174610438 : Rat) / 6527410339149) [(0, 2), (3, 1), (14, 1), (15, 1)],
  term ((2808020349220876 : Rat) / 6527410339149) [(1, 1), (3, 1), (14, 1), (15, 2)],
  term ((-1404010174610438 : Rat) / 6527410339149) [(1, 2), (3, 1), (14, 1), (15, 1)],
  term ((1404010174610438 : Rat) / 6527410339149) [(3, 1), (14, 1), (15, 1)],
  term ((-2808020349220876 : Rat) / 6527410339149) [(3, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 264 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0264_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0264
        rs_R009_ueqv_R009YNNNN_generator_28_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_28_0264 := by
  native_decide

/-- Coefficient term 265 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0265 : Poly :=
[
  term ((93440 : Rat) / 3087) [(3, 1), (14, 2), (15, 1)]
]

/-- Partial product 265 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0265 : Poly :=
[
  term ((-186880 : Rat) / 3087) [(0, 1), (3, 1), (14, 3), (15, 1)],
  term ((93440 : Rat) / 3087) [(0, 2), (3, 1), (14, 2), (15, 1)],
  term ((-186880 : Rat) / 3087) [(1, 1), (3, 1), (14, 2), (15, 2)],
  term ((93440 : Rat) / 3087) [(1, 2), (3, 1), (14, 2), (15, 1)],
  term ((-93440 : Rat) / 3087) [(3, 1), (14, 2), (15, 1)],
  term ((186880 : Rat) / 3087) [(3, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 265 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0265_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0265
        rs_R009_ueqv_R009YNNNN_generator_28_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_28_0265 := by
  native_decide

/-- Coefficient term 266 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0266 : Poly :=
[
  term ((1885268082658595 : Rat) / 2797461573921) [(3, 1), (15, 1)]
]

/-- Partial product 266 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0266 : Poly :=
[
  term ((-3770536165317190 : Rat) / 2797461573921) [(0, 1), (3, 1), (14, 1), (15, 1)],
  term ((1885268082658595 : Rat) / 2797461573921) [(0, 2), (3, 1), (15, 1)],
  term ((-3770536165317190 : Rat) / 2797461573921) [(1, 1), (3, 1), (15, 2)],
  term ((1885268082658595 : Rat) / 2797461573921) [(1, 2), (3, 1), (15, 1)],
  term ((3770536165317190 : Rat) / 2797461573921) [(3, 1), (14, 1), (15, 1)],
  term ((-1885268082658595 : Rat) / 2797461573921) [(3, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 266 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0266_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0266
        rs_R009_ueqv_R009YNNNN_generator_28_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_28_0266 := by
  native_decide

/-- Coefficient term 267 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0267 : Poly :=
[
  term ((-93440 : Rat) / 3087) [(3, 1), (15, 3)]
]

/-- Partial product 267 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0267 : Poly :=
[
  term ((186880 : Rat) / 3087) [(0, 1), (3, 1), (14, 1), (15, 3)],
  term ((-93440 : Rat) / 3087) [(0, 2), (3, 1), (15, 3)],
  term ((186880 : Rat) / 3087) [(1, 1), (3, 1), (15, 4)],
  term ((-93440 : Rat) / 3087) [(1, 2), (3, 1), (15, 3)],
  term ((-186880 : Rat) / 3087) [(3, 1), (14, 1), (15, 3)],
  term ((93440 : Rat) / 3087) [(3, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 267 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0267_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0267
        rs_R009_ueqv_R009YNNNN_generator_28_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_28_0267 := by
  native_decide

/-- Coefficient term 268 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0268 : Poly :=
[
  term ((1858755801021965 : Rat) / 26109641356596) [(3, 2)]
]

/-- Partial product 268 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0268 : Poly :=
[
  term ((-1858755801021965 : Rat) / 13054820678298) [(0, 1), (3, 2), (14, 1)],
  term ((1858755801021965 : Rat) / 26109641356596) [(0, 2), (3, 2)],
  term ((-1858755801021965 : Rat) / 13054820678298) [(1, 1), (3, 2), (15, 1)],
  term ((1858755801021965 : Rat) / 26109641356596) [(1, 2), (3, 2)],
  term ((-1858755801021965 : Rat) / 26109641356596) [(3, 2)],
  term ((1858755801021965 : Rat) / 13054820678298) [(3, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 268 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0268_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0268
        rs_R009_ueqv_R009YNNNN_generator_28_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_28_0268 := by
  native_decide

/-- Coefficient term 269 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0269 : Poly :=
[
  term ((-6297910881408425 : Rat) / 78328924069788) [(3, 2), (6, 1)]
]

/-- Partial product 269 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0269 : Poly :=
[
  term ((6297910881408425 : Rat) / 39164462034894) [(0, 1), (3, 2), (6, 1), (14, 1)],
  term ((-6297910881408425 : Rat) / 78328924069788) [(0, 2), (3, 2), (6, 1)],
  term ((6297910881408425 : Rat) / 39164462034894) [(1, 1), (3, 2), (6, 1), (15, 1)],
  term ((-6297910881408425 : Rat) / 78328924069788) [(1, 2), (3, 2), (6, 1)],
  term ((6297910881408425 : Rat) / 78328924069788) [(3, 2), (6, 1)],
  term ((-6297910881408425 : Rat) / 39164462034894) [(3, 2), (6, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 269 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0269_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0269
        rs_R009_ueqv_R009YNNNN_generator_28_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_28_0269 := by
  native_decide

/-- Coefficient term 270 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0270 : Poly :=
[
  term ((-36402876486038605 : Rat) / 156657848139576) [(3, 2), (10, 1)]
]

/-- Partial product 270 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0270 : Poly :=
[
  term ((36402876486038605 : Rat) / 78328924069788) [(0, 1), (3, 2), (10, 1), (14, 1)],
  term ((-36402876486038605 : Rat) / 156657848139576) [(0, 2), (3, 2), (10, 1)],
  term ((36402876486038605 : Rat) / 78328924069788) [(1, 1), (3, 2), (10, 1), (15, 1)],
  term ((-36402876486038605 : Rat) / 156657848139576) [(1, 2), (3, 2), (10, 1)],
  term ((36402876486038605 : Rat) / 156657848139576) [(3, 2), (10, 1)],
  term ((-36402876486038605 : Rat) / 78328924069788) [(3, 2), (10, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 270 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0270_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0270
        rs_R009_ueqv_R009YNNNN_generator_28_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_28_0270 := by
  native_decide

/-- Coefficient term 271 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0271 : Poly :=
[
  term ((-2560 : Rat) / 63) [(3, 2), (14, 1)]
]

/-- Partial product 271 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0271 : Poly :=
[
  term ((5120 : Rat) / 63) [(0, 1), (3, 2), (14, 2)],
  term ((-2560 : Rat) / 63) [(0, 2), (3, 2), (14, 1)],
  term ((5120 : Rat) / 63) [(1, 1), (3, 2), (14, 1), (15, 1)],
  term ((-2560 : Rat) / 63) [(1, 2), (3, 2), (14, 1)],
  term ((2560 : Rat) / 63) [(3, 2), (14, 1)],
  term ((-5120 : Rat) / 63) [(3, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 271 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0271_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0271
        rs_R009_ueqv_R009YNNNN_generator_28_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_28_0271 := by
  native_decide

/-- Coefficient term 272 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0272 : Poly :=
[
  term ((-8 : Rat) / 3) [(5, 1), (15, 1)]
]

/-- Partial product 272 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0272 : Poly :=
[
  term ((16 : Rat) / 3) [(0, 1), (5, 1), (14, 1), (15, 1)],
  term ((-8 : Rat) / 3) [(0, 2), (5, 1), (15, 1)],
  term ((16 : Rat) / 3) [(1, 1), (5, 1), (15, 2)],
  term ((-8 : Rat) / 3) [(1, 2), (5, 1), (15, 1)],
  term ((-16 : Rat) / 3) [(5, 1), (14, 1), (15, 1)],
  term ((8 : Rat) / 3) [(5, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 272 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0272_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0272
        rs_R009_ueqv_R009YNNNN_generator_28_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_28_0272 := by
  native_decide

/-- Coefficient term 273 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0273 : Poly :=
[
  term ((2 : Rat) / 3) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 273 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0273 : Poly :=
[
  term ((-4 : Rat) / 3) [(0, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((2 : Rat) / 3) [(0, 2), (5, 1), (15, 1), (16, 1)],
  term ((-4 : Rat) / 3) [(1, 1), (5, 1), (15, 2), (16, 1)],
  term ((2 : Rat) / 3) [(1, 2), (5, 1), (15, 1), (16, 1)],
  term ((4 : Rat) / 3) [(5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2 : Rat) / 3) [(5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 273 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0273_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0273
        rs_R009_ueqv_R009YNNNN_generator_28_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_28_0273 := by
  native_decide

/-- Coefficient term 274 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0274 : Poly :=
[
  term ((-1989973971600233 : Rat) / 5802142523688) [(6, 1)]
]

/-- Partial product 274 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0274 : Poly :=
[
  term ((1989973971600233 : Rat) / 2901071261844) [(0, 1), (6, 1), (14, 1)],
  term ((-1989973971600233 : Rat) / 5802142523688) [(0, 2), (6, 1)],
  term ((1989973971600233 : Rat) / 2901071261844) [(1, 1), (6, 1), (15, 1)],
  term ((-1989973971600233 : Rat) / 5802142523688) [(1, 2), (6, 1)],
  term ((1989973971600233 : Rat) / 5802142523688) [(6, 1)],
  term ((-1989973971600233 : Rat) / 2901071261844) [(6, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 274 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0274_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0274
        rs_R009_ueqv_R009YNNNN_generator_28_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_28_0274 := by
  native_decide

/-- Coefficient term 275 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0275 : Poly :=
[
  term ((7660998914045 : Rat) / 161170625658) [(6, 1), (7, 1), (9, 1)]
]

/-- Partial product 275 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0275 : Poly :=
[
  term ((-7660998914045 : Rat) / 80585312829) [(0, 1), (6, 1), (7, 1), (9, 1), (14, 1)],
  term ((7660998914045 : Rat) / 161170625658) [(0, 2), (6, 1), (7, 1), (9, 1)],
  term ((-7660998914045 : Rat) / 80585312829) [(1, 1), (6, 1), (7, 1), (9, 1), (15, 1)],
  term ((7660998914045 : Rat) / 161170625658) [(1, 2), (6, 1), (7, 1), (9, 1)],
  term ((-7660998914045 : Rat) / 161170625658) [(6, 1), (7, 1), (9, 1)],
  term ((7660998914045 : Rat) / 80585312829) [(6, 1), (7, 1), (9, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 275 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0275_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0275
        rs_R009_ueqv_R009YNNNN_generator_28_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_28_0275 := by
  native_decide

/-- Coefficient term 276 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0276 : Poly :=
[
  term ((-1532199782809 : Rat) / 161170625658) [(6, 1), (7, 1), (9, 1), (12, 1)]
]

/-- Partial product 276 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0276 : Poly :=
[
  term ((1532199782809 : Rat) / 80585312829) [(0, 1), (6, 1), (7, 1), (9, 1), (12, 1), (14, 1)],
  term ((-1532199782809 : Rat) / 161170625658) [(0, 2), (6, 1), (7, 1), (9, 1), (12, 1)],
  term ((1532199782809 : Rat) / 80585312829) [(1, 1), (6, 1), (7, 1), (9, 1), (12, 1), (15, 1)],
  term ((-1532199782809 : Rat) / 161170625658) [(1, 2), (6, 1), (7, 1), (9, 1), (12, 1)],
  term ((1532199782809 : Rat) / 161170625658) [(6, 1), (7, 1), (9, 1), (12, 1)],
  term ((-1532199782809 : Rat) / 80585312829) [(6, 1), (7, 1), (9, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 276 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0276_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0276
        rs_R009_ueqv_R009YNNNN_generator_28_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_28_0276 := by
  native_decide

/-- Coefficient term 277 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0277 : Poly :=
[
  term ((-14903707287383143 : Rat) / 6527410339149) [(6, 1), (7, 1), (11, 1)]
]

/-- Partial product 277 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0277 : Poly :=
[
  term ((29807414574766286 : Rat) / 6527410339149) [(0, 1), (6, 1), (7, 1), (11, 1), (14, 1)],
  term ((-14903707287383143 : Rat) / 6527410339149) [(0, 2), (6, 1), (7, 1), (11, 1)],
  term ((29807414574766286 : Rat) / 6527410339149) [(1, 1), (6, 1), (7, 1), (11, 1), (15, 1)],
  term ((-14903707287383143 : Rat) / 6527410339149) [(1, 2), (6, 1), (7, 1), (11, 1)],
  term ((14903707287383143 : Rat) / 6527410339149) [(6, 1), (7, 1), (11, 1)],
  term ((-29807414574766286 : Rat) / 6527410339149) [(6, 1), (7, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 277 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0277_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0277
        rs_R009_ueqv_R009YNNNN_generator_28_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_28_0277 := by
  native_decide

/-- Coefficient term 278 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0278 : Poly :=
[
  term ((-4349915183394751 : Rat) / 13054820678298) [(6, 1), (7, 1), (12, 1), (15, 1)]
]

/-- Partial product 278 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0278 : Poly :=
[
  term ((4349915183394751 : Rat) / 6527410339149) [(0, 1), (6, 1), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((-4349915183394751 : Rat) / 13054820678298) [(0, 2), (6, 1), (7, 1), (12, 1), (15, 1)],
  term ((4349915183394751 : Rat) / 6527410339149) [(1, 1), (6, 1), (7, 1), (12, 1), (15, 2)],
  term ((-4349915183394751 : Rat) / 13054820678298) [(1, 2), (6, 1), (7, 1), (12, 1), (15, 1)],
  term ((-4349915183394751 : Rat) / 6527410339149) [(6, 1), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((4349915183394751 : Rat) / 13054820678298) [(6, 1), (7, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 278 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0278_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0278
        rs_R009_ueqv_R009YNNNN_generator_28_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_28_0278 := by
  native_decide

/-- Coefficient term 279 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0279 : Poly :=
[
  term ((-1532199782809 : Rat) / 161170625658) [(6, 1), (7, 1), (13, 1)]
]

/-- Partial product 279 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0279 : Poly :=
[
  term ((1532199782809 : Rat) / 80585312829) [(0, 1), (6, 1), (7, 1), (13, 1), (14, 1)],
  term ((-1532199782809 : Rat) / 161170625658) [(0, 2), (6, 1), (7, 1), (13, 1)],
  term ((1532199782809 : Rat) / 80585312829) [(1, 1), (6, 1), (7, 1), (13, 1), (15, 1)],
  term ((-1532199782809 : Rat) / 161170625658) [(1, 2), (6, 1), (7, 1), (13, 1)],
  term ((1532199782809 : Rat) / 161170625658) [(6, 1), (7, 1), (13, 1)],
  term ((-1532199782809 : Rat) / 80585312829) [(6, 1), (7, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 279 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0279_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0279
        rs_R009_ueqv_R009YNNNN_generator_28_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_28_0279 := by
  native_decide

/-- Coefficient term 280 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0280 : Poly :=
[
  term ((4349915183394751 : Rat) / 4351606892766) [(6, 1), (7, 1), (15, 1)]
]

/-- Partial product 280 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0280 : Poly :=
[
  term ((-4349915183394751 : Rat) / 2175803446383) [(0, 1), (6, 1), (7, 1), (14, 1), (15, 1)],
  term ((4349915183394751 : Rat) / 4351606892766) [(0, 2), (6, 1), (7, 1), (15, 1)],
  term ((-4349915183394751 : Rat) / 2175803446383) [(1, 1), (6, 1), (7, 1), (15, 2)],
  term ((4349915183394751 : Rat) / 4351606892766) [(1, 2), (6, 1), (7, 1), (15, 1)],
  term ((4349915183394751 : Rat) / 2175803446383) [(6, 1), (7, 1), (14, 1), (15, 1)],
  term ((-4349915183394751 : Rat) / 4351606892766) [(6, 1), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 280 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0280_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0280
        rs_R009_ueqv_R009YNNNN_generator_28_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_28_0280 := by
  native_decide

/-- Coefficient term 281 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0281 : Poly :=
[
  term ((6157376606366009 : Rat) / 1598549470812) [(6, 1), (9, 1), (11, 1)]
]

/-- Partial product 281 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0281 : Poly :=
[
  term ((-6157376606366009 : Rat) / 799274735406) [(0, 1), (6, 1), (9, 1), (11, 1), (14, 1)],
  term ((6157376606366009 : Rat) / 1598549470812) [(0, 2), (6, 1), (9, 1), (11, 1)],
  term ((-6157376606366009 : Rat) / 799274735406) [(1, 1), (6, 1), (9, 1), (11, 1), (15, 1)],
  term ((6157376606366009 : Rat) / 1598549470812) [(1, 2), (6, 1), (9, 1), (11, 1)],
  term ((-6157376606366009 : Rat) / 1598549470812) [(6, 1), (9, 1), (11, 1)],
  term ((6157376606366009 : Rat) / 799274735406) [(6, 1), (9, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 281 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0281_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0281
        rs_R009_ueqv_R009YNNNN_generator_28_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_28_0281 := by
  native_decide

/-- Coefficient term 282 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0282 : Poly :=
[
  term ((-119808 : Rat) / 553) [(6, 1), (9, 1), (11, 1), (12, 1)]
]

/-- Partial product 282 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0282 : Poly :=
[
  term ((239616 : Rat) / 553) [(0, 1), (6, 1), (9, 1), (11, 1), (12, 1), (14, 1)],
  term ((-119808 : Rat) / 553) [(0, 2), (6, 1), (9, 1), (11, 1), (12, 1)],
  term ((239616 : Rat) / 553) [(1, 1), (6, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((-119808 : Rat) / 553) [(1, 2), (6, 1), (9, 1), (11, 1), (12, 1)],
  term ((119808 : Rat) / 553) [(6, 1), (9, 1), (11, 1), (12, 1)],
  term ((-239616 : Rat) / 553) [(6, 1), (9, 1), (11, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 282 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0282_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0282
        rs_R009_ueqv_R009YNNNN_generator_28_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_28_0282 := by
  native_decide

/-- Coefficient term 283 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0283 : Poly :=
[
  term ((-941242657 : Rat) / 166541592) [(6, 1), (9, 1), (12, 1), (13, 1)]
]

/-- Partial product 283 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0283 : Poly :=
[
  term ((941242657 : Rat) / 83270796) [(0, 1), (6, 1), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((-941242657 : Rat) / 166541592) [(0, 2), (6, 1), (9, 1), (12, 1), (13, 1)],
  term ((941242657 : Rat) / 83270796) [(1, 1), (6, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((-941242657 : Rat) / 166541592) [(1, 2), (6, 1), (9, 1), (12, 1), (13, 1)],
  term ((941242657 : Rat) / 166541592) [(6, 1), (9, 1), (12, 1), (13, 1)],
  term ((-941242657 : Rat) / 83270796) [(6, 1), (9, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 283 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0283_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0283
        rs_R009_ueqv_R009YNNNN_generator_28_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_28_0283 := by
  native_decide

/-- Coefficient term 284 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0284 : Poly :=
[
  term ((-725 : Rat) / 84) [(6, 1), (9, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 284 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0284 : Poly :=
[
  term ((725 : Rat) / 42) [(0, 1), (6, 1), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-725 : Rat) / 84) [(0, 2), (6, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((725 : Rat) / 42) [(1, 1), (6, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-725 : Rat) / 84) [(1, 2), (6, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-725 : Rat) / 42) [(6, 1), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((725 : Rat) / 84) [(6, 1), (9, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 284 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0284_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0284
        rs_R009_ueqv_R009YNNNN_generator_28_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_28_0284 := by
  native_decide

/-- Coefficient term 285 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0285 : Poly :=
[
  term ((223016262790904647 : Rat) / 313315696279152) [(6, 1), (9, 1), (12, 1), (15, 1)]
]

/-- Partial product 285 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0285 : Poly :=
[
  term ((-223016262790904647 : Rat) / 156657848139576) [(0, 1), (6, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((223016262790904647 : Rat) / 313315696279152) [(0, 2), (6, 1), (9, 1), (12, 1), (15, 1)],
  term ((-223016262790904647 : Rat) / 156657848139576) [(1, 1), (6, 1), (9, 1), (12, 1), (15, 2)],
  term ((223016262790904647 : Rat) / 313315696279152) [(1, 2), (6, 1), (9, 1), (12, 1), (15, 1)],
  term ((223016262790904647 : Rat) / 156657848139576) [(6, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-223016262790904647 : Rat) / 313315696279152) [(6, 1), (9, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 285 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0285_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0285
        rs_R009_ueqv_R009YNNNN_generator_28_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_28_0285 := by
  native_decide

/-- Coefficient term 286 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0286 : Poly :=
[
  term ((157 : Rat) / 21) [(6, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 286 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0286 : Poly :=
[
  term ((-314 : Rat) / 21) [(0, 1), (6, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((157 : Rat) / 21) [(0, 2), (6, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-314 : Rat) / 21) [(1, 1), (6, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((157 : Rat) / 21) [(1, 2), (6, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((314 : Rat) / 21) [(6, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-157 : Rat) / 21) [(6, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 286 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0286_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0286
        rs_R009_ueqv_R009YNNNN_generator_28_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_28_0286 := by
  native_decide

/-- Coefficient term 287 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0287 : Poly :=
[
  term ((11584628303 : Rat) / 333083184) [(6, 1), (9, 1), (13, 1)]
]

/-- Partial product 287 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0287 : Poly :=
[
  term ((-11584628303 : Rat) / 166541592) [(0, 1), (6, 1), (9, 1), (13, 1), (14, 1)],
  term ((11584628303 : Rat) / 333083184) [(0, 2), (6, 1), (9, 1), (13, 1)],
  term ((-11584628303 : Rat) / 166541592) [(1, 1), (6, 1), (9, 1), (13, 1), (15, 1)],
  term ((11584628303 : Rat) / 333083184) [(1, 2), (6, 1), (9, 1), (13, 1)],
  term ((-11584628303 : Rat) / 333083184) [(6, 1), (9, 1), (13, 1)],
  term ((11584628303 : Rat) / 166541592) [(6, 1), (9, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 287 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0287_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0287
        rs_R009_ueqv_R009YNNNN_generator_28_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_28_0287 := by
  native_decide

/-- Coefficient term 288 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0288 : Poly :=
[
  term ((3625 : Rat) / 84) [(6, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 288 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0288 : Poly :=
[
  term ((-3625 : Rat) / 42) [(0, 1), (6, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((3625 : Rat) / 84) [(0, 2), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((-3625 : Rat) / 42) [(1, 1), (6, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((3625 : Rat) / 84) [(1, 2), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((3625 : Rat) / 42) [(6, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-3625 : Rat) / 84) [(6, 1), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 288 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0288_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0288
        rs_R009_ueqv_R009YNNNN_generator_28_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_28_0288 := by
  native_decide

/-- Coefficient term 289 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0289 : Poly :=
[
  term ((-233428178880157183 : Rat) / 104438565426384) [(6, 1), (9, 1), (15, 1)]
]

/-- Partial product 289 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0289 : Poly :=
[
  term ((233428178880157183 : Rat) / 52219282713192) [(0, 1), (6, 1), (9, 1), (14, 1), (15, 1)],
  term ((-233428178880157183 : Rat) / 104438565426384) [(0, 2), (6, 1), (9, 1), (15, 1)],
  term ((233428178880157183 : Rat) / 52219282713192) [(1, 1), (6, 1), (9, 1), (15, 2)],
  term ((-233428178880157183 : Rat) / 104438565426384) [(1, 2), (6, 1), (9, 1), (15, 1)],
  term ((-233428178880157183 : Rat) / 52219282713192) [(6, 1), (9, 1), (14, 1), (15, 1)],
  term ((233428178880157183 : Rat) / 104438565426384) [(6, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 289 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0289_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0289
        rs_R009_ueqv_R009YNNNN_generator_28_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_28_0289 := by
  native_decide

/-- Coefficient term 290 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0290 : Poly :=
[
  term ((-785 : Rat) / 21) [(6, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 290 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0290 : Poly :=
[
  term ((1570 : Rat) / 21) [(0, 1), (6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-785 : Rat) / 21) [(0, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((1570 : Rat) / 21) [(1, 1), (6, 1), (9, 1), (15, 2), (16, 1)],
  term ((-785 : Rat) / 21) [(1, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-1570 : Rat) / 21) [(6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((785 : Rat) / 21) [(6, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 290 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0290_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0290
        rs_R009_ueqv_R009YNNNN_generator_28_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_28_0290 := by
  native_decide

/-- Coefficient term 291 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0291 : Poly :=
[
  term ((-71946724318135 : Rat) / 11604285047376) [(6, 1), (9, 2)]
]

/-- Partial product 291 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0291 : Poly :=
[
  term ((71946724318135 : Rat) / 5802142523688) [(0, 1), (6, 1), (9, 2), (14, 1)],
  term ((-71946724318135 : Rat) / 11604285047376) [(0, 2), (6, 1), (9, 2)],
  term ((71946724318135 : Rat) / 5802142523688) [(1, 1), (6, 1), (9, 2), (15, 1)],
  term ((-71946724318135 : Rat) / 11604285047376) [(1, 2), (6, 1), (9, 2)],
  term ((71946724318135 : Rat) / 11604285047376) [(6, 1), (9, 2)],
  term ((-71946724318135 : Rat) / 5802142523688) [(6, 1), (9, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 291 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0291_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0291
        rs_R009_ueqv_R009YNNNN_generator_28_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_28_0291 := by
  native_decide

/-- Coefficient term 292 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0292 : Poly :=
[
  term ((2172201733 : Rat) / 333083184) [(6, 1), (9, 2), (12, 1)]
]

/-- Partial product 292 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0292 : Poly :=
[
  term ((-2172201733 : Rat) / 166541592) [(0, 1), (6, 1), (9, 2), (12, 1), (14, 1)],
  term ((2172201733 : Rat) / 333083184) [(0, 2), (6, 1), (9, 2), (12, 1)],
  term ((-2172201733 : Rat) / 166541592) [(1, 1), (6, 1), (9, 2), (12, 1), (15, 1)],
  term ((2172201733 : Rat) / 333083184) [(1, 2), (6, 1), (9, 2), (12, 1)],
  term ((-2172201733 : Rat) / 333083184) [(6, 1), (9, 2), (12, 1)],
  term ((2172201733 : Rat) / 166541592) [(6, 1), (9, 2), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 292 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0292_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0292
        rs_R009_ueqv_R009YNNNN_generator_28_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_28_0292 := by
  native_decide

/-- Coefficient term 293 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0293 : Poly :=
[
  term ((4125005306867285 : Rat) / 8703213785532) [(6, 1), (10, 1)]
]

/-- Partial product 293 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0293 : Poly :=
[
  term ((-4125005306867285 : Rat) / 4351606892766) [(0, 1), (6, 1), (10, 1), (14, 1)],
  term ((4125005306867285 : Rat) / 8703213785532) [(0, 2), (6, 1), (10, 1)],
  term ((-4125005306867285 : Rat) / 4351606892766) [(1, 1), (6, 1), (10, 1), (15, 1)],
  term ((4125005306867285 : Rat) / 8703213785532) [(1, 2), (6, 1), (10, 1)],
  term ((-4125005306867285 : Rat) / 8703213785532) [(6, 1), (10, 1)],
  term ((4125005306867285 : Rat) / 4351606892766) [(6, 1), (10, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 293 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0293_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0293
        rs_R009_ueqv_R009YNNNN_generator_28_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_28_0293 := by
  native_decide

/-- Coefficient term 294 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0294 : Poly :=
[
  term ((1005180329591 : Rat) / 29602767978) [(6, 1), (10, 1), (14, 1)]
]

/-- Partial product 294 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0294 : Poly :=
[
  term ((-1005180329591 : Rat) / 14801383989) [(0, 1), (6, 1), (10, 1), (14, 2)],
  term ((1005180329591 : Rat) / 29602767978) [(0, 2), (6, 1), (10, 1), (14, 1)],
  term ((-1005180329591 : Rat) / 14801383989) [(1, 1), (6, 1), (10, 1), (14, 1), (15, 1)],
  term ((1005180329591 : Rat) / 29602767978) [(1, 2), (6, 1), (10, 1), (14, 1)],
  term ((-1005180329591 : Rat) / 29602767978) [(6, 1), (10, 1), (14, 1)],
  term ((1005180329591 : Rat) / 14801383989) [(6, 1), (10, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 294 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0294_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0294
        rs_R009_ueqv_R009YNNNN_generator_28_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_28_0294 := by
  native_decide

/-- Coefficient term 295 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0295 : Poly :=
[
  term ((-353060918012465 : Rat) / 6527410339149) [(6, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 295 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0295 : Poly :=
[
  term ((706121836024930 : Rat) / 6527410339149) [(0, 1), (6, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-353060918012465 : Rat) / 6527410339149) [(0, 2), (6, 1), (11, 1), (12, 1), (15, 1)],
  term ((706121836024930 : Rat) / 6527410339149) [(1, 1), (6, 1), (11, 1), (12, 1), (15, 2)],
  term ((-353060918012465 : Rat) / 6527410339149) [(1, 2), (6, 1), (11, 1), (12, 1), (15, 1)],
  term ((-706121836024930 : Rat) / 6527410339149) [(6, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((353060918012465 : Rat) / 6527410339149) [(6, 1), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 295 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0295_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0295
        rs_R009_ueqv_R009YNNNN_generator_28_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_28_0295 := by
  native_decide

/-- Coefficient term 296 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0296 : Poly :=
[
  term ((-327140384197199 : Rat) / 114182105058) [(6, 1), (11, 1), (13, 1)]
]

/-- Partial product 296 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0296 : Poly :=
[
  term ((327140384197199 : Rat) / 57091052529) [(0, 1), (6, 1), (11, 1), (13, 1), (14, 1)],
  term ((-327140384197199 : Rat) / 114182105058) [(0, 2), (6, 1), (11, 1), (13, 1)],
  term ((327140384197199 : Rat) / 57091052529) [(1, 1), (6, 1), (11, 1), (13, 1), (15, 1)],
  term ((-327140384197199 : Rat) / 114182105058) [(1, 2), (6, 1), (11, 1), (13, 1)],
  term ((327140384197199 : Rat) / 114182105058) [(6, 1), (11, 1), (13, 1)],
  term ((-327140384197199 : Rat) / 57091052529) [(6, 1), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 296 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0296_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0296
        rs_R009_ueqv_R009YNNNN_generator_28_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_28_0296 := by
  native_decide

/-- Coefficient term 297 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0297 : Poly :=
[
  term ((-85 : Rat) / 9) [(6, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 297 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0297 : Poly :=
[
  term ((170 : Rat) / 9) [(0, 1), (6, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-85 : Rat) / 9) [(0, 2), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((170 : Rat) / 9) [(1, 1), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-85 : Rat) / 9) [(1, 2), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((-170 : Rat) / 9) [(6, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((85 : Rat) / 9) [(6, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 297 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0297_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0297
        rs_R009_ueqv_R009YNNNN_generator_28_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_28_0297 := by
  native_decide

/-- Coefficient term 298 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0298 : Poly :=
[
  term ((-7660998914045 : Rat) / 26861770943) [(6, 1), (11, 1), (14, 1), (15, 1)]
]

/-- Partial product 298 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0298 : Poly :=
[
  term ((15321997828090 : Rat) / 26861770943) [(0, 1), (6, 1), (11, 1), (14, 2), (15, 1)],
  term ((-7660998914045 : Rat) / 26861770943) [(0, 2), (6, 1), (11, 1), (14, 1), (15, 1)],
  term ((15321997828090 : Rat) / 26861770943) [(1, 1), (6, 1), (11, 1), (14, 1), (15, 2)],
  term ((-7660998914045 : Rat) / 26861770943) [(1, 2), (6, 1), (11, 1), (14, 1), (15, 1)],
  term ((7660998914045 : Rat) / 26861770943) [(6, 1), (11, 1), (14, 1), (15, 1)],
  term ((-15321997828090 : Rat) / 26861770943) [(6, 1), (11, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 298 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0298_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0298
        rs_R009_ueqv_R009YNNNN_generator_28_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_28_0298 := by
  native_decide

/-- Coefficient term 299 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YNNNN_coefficient_28_0299 : Poly :=
[
  term ((21760729494915749 : Rat) / 26109641356596) [(6, 1), (11, 1), (15, 1)]
]

/-- Partial product 299 for generator 28. -/
def rs_R009_ueqv_R009YNNNN_partial_28_0299 : Poly :=
[
  term ((-21760729494915749 : Rat) / 13054820678298) [(0, 1), (6, 1), (11, 1), (14, 1), (15, 1)],
  term ((21760729494915749 : Rat) / 26109641356596) [(0, 2), (6, 1), (11, 1), (15, 1)],
  term ((-21760729494915749 : Rat) / 13054820678298) [(1, 1), (6, 1), (11, 1), (15, 2)],
  term ((21760729494915749 : Rat) / 26109641356596) [(1, 2), (6, 1), (11, 1), (15, 1)],
  term ((21760729494915749 : Rat) / 13054820678298) [(6, 1), (11, 1), (14, 1), (15, 1)],
  term ((-21760729494915749 : Rat) / 26109641356596) [(6, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 299 for generator 28. -/
theorem rs_R009_ueqv_R009YNNNN_partial_28_0299_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_28_0299
        rs_R009_ueqv_R009YNNNN_generator_28_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_28_0299 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009YNNNN_partials_28_0200_0299 : List Poly :=
[
  rs_R009_ueqv_R009YNNNN_partial_28_0200,
  rs_R009_ueqv_R009YNNNN_partial_28_0201,
  rs_R009_ueqv_R009YNNNN_partial_28_0202,
  rs_R009_ueqv_R009YNNNN_partial_28_0203,
  rs_R009_ueqv_R009YNNNN_partial_28_0204,
  rs_R009_ueqv_R009YNNNN_partial_28_0205,
  rs_R009_ueqv_R009YNNNN_partial_28_0206,
  rs_R009_ueqv_R009YNNNN_partial_28_0207,
  rs_R009_ueqv_R009YNNNN_partial_28_0208,
  rs_R009_ueqv_R009YNNNN_partial_28_0209,
  rs_R009_ueqv_R009YNNNN_partial_28_0210,
  rs_R009_ueqv_R009YNNNN_partial_28_0211,
  rs_R009_ueqv_R009YNNNN_partial_28_0212,
  rs_R009_ueqv_R009YNNNN_partial_28_0213,
  rs_R009_ueqv_R009YNNNN_partial_28_0214,
  rs_R009_ueqv_R009YNNNN_partial_28_0215,
  rs_R009_ueqv_R009YNNNN_partial_28_0216,
  rs_R009_ueqv_R009YNNNN_partial_28_0217,
  rs_R009_ueqv_R009YNNNN_partial_28_0218,
  rs_R009_ueqv_R009YNNNN_partial_28_0219,
  rs_R009_ueqv_R009YNNNN_partial_28_0220,
  rs_R009_ueqv_R009YNNNN_partial_28_0221,
  rs_R009_ueqv_R009YNNNN_partial_28_0222,
  rs_R009_ueqv_R009YNNNN_partial_28_0223,
  rs_R009_ueqv_R009YNNNN_partial_28_0224,
  rs_R009_ueqv_R009YNNNN_partial_28_0225,
  rs_R009_ueqv_R009YNNNN_partial_28_0226,
  rs_R009_ueqv_R009YNNNN_partial_28_0227,
  rs_R009_ueqv_R009YNNNN_partial_28_0228,
  rs_R009_ueqv_R009YNNNN_partial_28_0229,
  rs_R009_ueqv_R009YNNNN_partial_28_0230,
  rs_R009_ueqv_R009YNNNN_partial_28_0231,
  rs_R009_ueqv_R009YNNNN_partial_28_0232,
  rs_R009_ueqv_R009YNNNN_partial_28_0233,
  rs_R009_ueqv_R009YNNNN_partial_28_0234,
  rs_R009_ueqv_R009YNNNN_partial_28_0235,
  rs_R009_ueqv_R009YNNNN_partial_28_0236,
  rs_R009_ueqv_R009YNNNN_partial_28_0237,
  rs_R009_ueqv_R009YNNNN_partial_28_0238,
  rs_R009_ueqv_R009YNNNN_partial_28_0239,
  rs_R009_ueqv_R009YNNNN_partial_28_0240,
  rs_R009_ueqv_R009YNNNN_partial_28_0241,
  rs_R009_ueqv_R009YNNNN_partial_28_0242,
  rs_R009_ueqv_R009YNNNN_partial_28_0243,
  rs_R009_ueqv_R009YNNNN_partial_28_0244,
  rs_R009_ueqv_R009YNNNN_partial_28_0245,
  rs_R009_ueqv_R009YNNNN_partial_28_0246,
  rs_R009_ueqv_R009YNNNN_partial_28_0247,
  rs_R009_ueqv_R009YNNNN_partial_28_0248,
  rs_R009_ueqv_R009YNNNN_partial_28_0249,
  rs_R009_ueqv_R009YNNNN_partial_28_0250,
  rs_R009_ueqv_R009YNNNN_partial_28_0251,
  rs_R009_ueqv_R009YNNNN_partial_28_0252,
  rs_R009_ueqv_R009YNNNN_partial_28_0253,
  rs_R009_ueqv_R009YNNNN_partial_28_0254,
  rs_R009_ueqv_R009YNNNN_partial_28_0255,
  rs_R009_ueqv_R009YNNNN_partial_28_0256,
  rs_R009_ueqv_R009YNNNN_partial_28_0257,
  rs_R009_ueqv_R009YNNNN_partial_28_0258,
  rs_R009_ueqv_R009YNNNN_partial_28_0259,
  rs_R009_ueqv_R009YNNNN_partial_28_0260,
  rs_R009_ueqv_R009YNNNN_partial_28_0261,
  rs_R009_ueqv_R009YNNNN_partial_28_0262,
  rs_R009_ueqv_R009YNNNN_partial_28_0263,
  rs_R009_ueqv_R009YNNNN_partial_28_0264,
  rs_R009_ueqv_R009YNNNN_partial_28_0265,
  rs_R009_ueqv_R009YNNNN_partial_28_0266,
  rs_R009_ueqv_R009YNNNN_partial_28_0267,
  rs_R009_ueqv_R009YNNNN_partial_28_0268,
  rs_R009_ueqv_R009YNNNN_partial_28_0269,
  rs_R009_ueqv_R009YNNNN_partial_28_0270,
  rs_R009_ueqv_R009YNNNN_partial_28_0271,
  rs_R009_ueqv_R009YNNNN_partial_28_0272,
  rs_R009_ueqv_R009YNNNN_partial_28_0273,
  rs_R009_ueqv_R009YNNNN_partial_28_0274,
  rs_R009_ueqv_R009YNNNN_partial_28_0275,
  rs_R009_ueqv_R009YNNNN_partial_28_0276,
  rs_R009_ueqv_R009YNNNN_partial_28_0277,
  rs_R009_ueqv_R009YNNNN_partial_28_0278,
  rs_R009_ueqv_R009YNNNN_partial_28_0279,
  rs_R009_ueqv_R009YNNNN_partial_28_0280,
  rs_R009_ueqv_R009YNNNN_partial_28_0281,
  rs_R009_ueqv_R009YNNNN_partial_28_0282,
  rs_R009_ueqv_R009YNNNN_partial_28_0283,
  rs_R009_ueqv_R009YNNNN_partial_28_0284,
  rs_R009_ueqv_R009YNNNN_partial_28_0285,
  rs_R009_ueqv_R009YNNNN_partial_28_0286,
  rs_R009_ueqv_R009YNNNN_partial_28_0287,
  rs_R009_ueqv_R009YNNNN_partial_28_0288,
  rs_R009_ueqv_R009YNNNN_partial_28_0289,
  rs_R009_ueqv_R009YNNNN_partial_28_0290,
  rs_R009_ueqv_R009YNNNN_partial_28_0291,
  rs_R009_ueqv_R009YNNNN_partial_28_0292,
  rs_R009_ueqv_R009YNNNN_partial_28_0293,
  rs_R009_ueqv_R009YNNNN_partial_28_0294,
  rs_R009_ueqv_R009YNNNN_partial_28_0295,
  rs_R009_ueqv_R009YNNNN_partial_28_0296,
  rs_R009_ueqv_R009YNNNN_partial_28_0297,
  rs_R009_ueqv_R009YNNNN_partial_28_0298,
  rs_R009_ueqv_R009YNNNN_partial_28_0299
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009YNNNN_block_28_0200_0299 : Poly :=
[
  term ((33944746640006525 : Rat) / 39164462034894) [(0, 1), (2, 1), (3, 2), (14, 1)],
  term ((2664495422304851 : Rat) / 2901071261844) [(0, 1), (2, 1), (6, 1), (14, 1)],
  term ((-2488871127710291 : Rat) / 2901071261844) [(0, 1), (2, 1), (6, 1), (14, 2)],
  term ((6788130415625 : Rat) / 3372467238) [(0, 1), (2, 1), (7, 1), (9, 1), (14, 1)],
  term ((-186916352335247 : Rat) / 36722421036) [(0, 1), (2, 1), (7, 1), (11, 1), (14, 1)],
  term ((-280381883026811 : Rat) / 133212455901) [(0, 1), (2, 1), (7, 1), (13, 1), (14, 1)],
  term ((-170 : Rat) / 21) [(0, 1), (2, 1), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((21696170156143477 : Rat) / 6527410339149) [(0, 1), (2, 1), (7, 1), (14, 1), (15, 1)],
  term ((32 : Rat) / 3) [(0, 1), (2, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((691022102046859 : Rat) / 310829063769) [(0, 1), (2, 1), (7, 2), (14, 1)],
  term ((201665036689987 : Rat) / 53959475808) [(0, 1), (2, 1), (9, 1), (11, 1), (14, 1)],
  term ((-6788130415625 : Rat) / 5058700857) [(0, 1), (2, 1), (9, 1), (14, 1), (15, 1)],
  term ((-395910373848515 : Rat) / 4351606892766) [(0, 1), (2, 1), (10, 1), (14, 1)],
  term ((-8328205440429481 : Rat) / 2131399294416) [(0, 1), (2, 1), (11, 1), (13, 1), (14, 1)],
  term ((8605 : Rat) / 168) [(0, 1), (2, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((221279613094576105 : Rat) / 26109641356596) [(0, 1), (2, 1), (11, 1), (14, 1), (15, 1)],
  term ((-1549 : Rat) / 42) [(0, 1), (2, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(0, 1), (2, 1), (11, 1), (14, 2), (15, 1)],
  term ((-20254808239762003 : Rat) / 8703213785532) [(0, 1), (2, 1), (11, 2), (14, 1)],
  term ((572943190593142 : Rat) / 399637367703) [(0, 1), (2, 1), (13, 1), (14, 1), (15, 1)],
  term ((340 : Rat) / 63) [(0, 1), (2, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-36830853064497271 : Rat) / 13054820678298) [(0, 1), (2, 1), (14, 1), (15, 2)],
  term ((-64 : Rat) / 9) [(0, 1), (2, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1048456177168280 : Rat) / 2175803446383) [(0, 1), (2, 1), (14, 2)],
  term ((10143334851217007 : Rat) / 13054820678298) [(0, 1), (2, 1), (14, 3)],
  term ((-1063033397773325 : Rat) / 13054820678298) [(0, 1), (2, 2), (14, 1)],
  term ((-1280 : Rat) / 21) [(0, 1), (3, 1), (5, 1), (14, 1)],
  term ((194560 : Rat) / 343) [(0, 1), (3, 1), (5, 1), (14, 1), (15, 2)],
  term ((640 : Rat) / 7) [(0, 1), (3, 1), (5, 1), (14, 2)],
  term ((-9311178080130293 : Rat) / 6527410339149) [(0, 1), (3, 1), (6, 1), (7, 1), (14, 1)],
  term ((6788130415625 : Rat) / 10117401714) [(0, 1), (3, 1), (6, 1), (9, 1), (14, 1)],
  term ((173351835750269089 : Rat) / 39164462034894) [(0, 1), (3, 1), (6, 1), (11, 1), (14, 1)],
  term ((33944746640006525 : Rat) / 39164462034894) [(0, 1), (3, 1), (6, 1), (12, 1), (14, 1), (15, 1)],
  term ((-280381883026811 : Rat) / 399637367703) [(0, 1), (3, 1), (6, 1), (13, 1), (14, 1)],
  term ((373760 : Rat) / 3087) [(0, 1), (3, 1), (6, 1), (13, 1), (14, 1), (15, 2)],
  term ((-170 : Rat) / 63) [(0, 1), (3, 1), (6, 1), (13, 1), (14, 1), (16, 1)],
  term ((-7054254498875453 : Rat) / 2175803446383) [(0, 1), (3, 1), (6, 1), (14, 1), (15, 1)],
  term ((32 : Rat) / 9) [(0, 1), (3, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((-747520 : Rat) / 3087) [(0, 1), (3, 1), (6, 1), (14, 1), (15, 3)],
  term ((-12944238207682 : Rat) / 241755938487) [(0, 1), (3, 1), (6, 1), (14, 2), (15, 1)],
  term ((-129097240585215053 : Rat) / 78328924069788) [(0, 1), (3, 1), (7, 1), (10, 1), (14, 1)],
  term ((-373760 : Rat) / 3087) [(0, 1), (3, 1), (7, 1), (12, 1), (14, 1), (15, 2)],
  term ((-33944746640006525 : Rat) / 39164462034894) [(0, 1), (3, 1), (7, 1), (12, 1), (14, 2)],
  term ((249611075209385 : Rat) / 5594923147842) [(0, 1), (3, 1), (7, 1), (14, 1)],
  term ((186880 : Rat) / 1029) [(0, 1), (3, 1), (7, 1), (14, 1), (15, 2)],
  term ((52982721593064289 : Rat) / 26109641356596) [(0, 1), (3, 1), (7, 1), (14, 2)],
  term ((747520 : Rat) / 3087) [(0, 1), (3, 1), (7, 1), (14, 2), (15, 2)],
  term ((-275055044441125 : Rat) / 161878427424) [(0, 1), (3, 1), (9, 1), (10, 1), (14, 1)],
  term ((1280 : Rat) / 21) [(0, 1), (3, 1), (9, 1), (14, 1)],
  term ((-194560 : Rat) / 343) [(0, 1), (3, 1), (9, 1), (14, 1), (15, 2)],
  term ((-640 : Rat) / 7) [(0, 1), (3, 1), (9, 1), (14, 2)],
  term ((9822679084795405 : Rat) / 26109641356596) [(0, 1), (3, 1), (10, 1), (11, 1), (14, 1)],
  term ((11186576839603855 : Rat) / 6394197883248) [(0, 1), (3, 1), (10, 1), (13, 1), (14, 1)],
  term ((-5485 : Rat) / 72) [(0, 1), (3, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-28705177706595329 : Rat) / 13054820678298) [(0, 1), (3, 1), (10, 1), (14, 1), (15, 1)],
  term ((1117 : Rat) / 18) [(0, 1), (3, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-23275627879084669 : Rat) / 78328924069788) [(0, 1), (3, 1), (11, 1), (14, 1)],
  term ((-7738260225025805 : Rat) / 78328924069788) [(0, 1), (3, 1), (11, 1), (14, 2)],
  term ((-640 : Rat) / 21) [(0, 1), (3, 1), (12, 1), (14, 1), (15, 1)],
  term ((373760 : Rat) / 3087) [(0, 1), (3, 1), (12, 1), (14, 1), (15, 3)],
  term ((31557579430260605 : Rat) / 78328924069788) [(0, 1), (3, 1), (13, 1), (14, 1)],
  term ((1377280 : Rat) / 3087) [(0, 1), (3, 1), (13, 1), (14, 1), (15, 2)],
  term ((-30363995825387645 : Rat) / 39164462034894) [(0, 1), (3, 1), (13, 1), (14, 2)],
  term ((-373760 : Rat) / 3087) [(0, 1), (3, 1), (13, 1), (14, 2), (15, 2)],
  term ((-3770536165317190 : Rat) / 2797461573921) [(0, 1), (3, 1), (14, 1), (15, 1)],
  term ((186880 : Rat) / 3087) [(0, 1), (3, 1), (14, 1), (15, 3)],
  term ((2808020349220876 : Rat) / 6527410339149) [(0, 1), (3, 1), (14, 2), (15, 1)],
  term ((-186880 : Rat) / 3087) [(0, 1), (3, 1), (14, 3), (15, 1)],
  term ((6297910881408425 : Rat) / 39164462034894) [(0, 1), (3, 2), (6, 1), (14, 1)],
  term ((36402876486038605 : Rat) / 78328924069788) [(0, 1), (3, 2), (10, 1), (14, 1)],
  term ((-1858755801021965 : Rat) / 13054820678298) [(0, 1), (3, 2), (14, 1)],
  term ((5120 : Rat) / 63) [(0, 1), (3, 2), (14, 2)],
  term ((16 : Rat) / 3) [(0, 1), (5, 1), (14, 1), (15, 1)],
  term ((-4 : Rat) / 3) [(0, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((1532199782809 : Rat) / 80585312829) [(0, 1), (6, 1), (7, 1), (9, 1), (12, 1), (14, 1)],
  term ((-7660998914045 : Rat) / 80585312829) [(0, 1), (6, 1), (7, 1), (9, 1), (14, 1)],
  term ((29807414574766286 : Rat) / 6527410339149) [(0, 1), (6, 1), (7, 1), (11, 1), (14, 1)],
  term ((4349915183394751 : Rat) / 6527410339149) [(0, 1), (6, 1), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((1532199782809 : Rat) / 80585312829) [(0, 1), (6, 1), (7, 1), (13, 1), (14, 1)],
  term ((-4349915183394751 : Rat) / 2175803446383) [(0, 1), (6, 1), (7, 1), (14, 1), (15, 1)],
  term ((239616 : Rat) / 553) [(0, 1), (6, 1), (9, 1), (11, 1), (12, 1), (14, 1)],
  term ((-6157376606366009 : Rat) / 799274735406) [(0, 1), (6, 1), (9, 1), (11, 1), (14, 1)],
  term ((941242657 : Rat) / 83270796) [(0, 1), (6, 1), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((725 : Rat) / 42) [(0, 1), (6, 1), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-223016262790904647 : Rat) / 156657848139576) [(0, 1), (6, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-314 : Rat) / 21) [(0, 1), (6, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-11584628303 : Rat) / 166541592) [(0, 1), (6, 1), (9, 1), (13, 1), (14, 1)],
  term ((-3625 : Rat) / 42) [(0, 1), (6, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((233428178880157183 : Rat) / 52219282713192) [(0, 1), (6, 1), (9, 1), (14, 1), (15, 1)],
  term ((1570 : Rat) / 21) [(0, 1), (6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2172201733 : Rat) / 166541592) [(0, 1), (6, 1), (9, 2), (12, 1), (14, 1)],
  term ((71946724318135 : Rat) / 5802142523688) [(0, 1), (6, 1), (9, 2), (14, 1)],
  term ((-4125005306867285 : Rat) / 4351606892766) [(0, 1), (6, 1), (10, 1), (14, 1)],
  term ((-1005180329591 : Rat) / 14801383989) [(0, 1), (6, 1), (10, 1), (14, 2)],
  term ((706121836024930 : Rat) / 6527410339149) [(0, 1), (6, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((327140384197199 : Rat) / 57091052529) [(0, 1), (6, 1), (11, 1), (13, 1), (14, 1)],
  term ((170 : Rat) / 9) [(0, 1), (6, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-21760729494915749 : Rat) / 13054820678298) [(0, 1), (6, 1), (11, 1), (14, 1), (15, 1)],
  term ((15321997828090 : Rat) / 26861770943) [(0, 1), (6, 1), (11, 1), (14, 2), (15, 1)],
  term ((1989973971600233 : Rat) / 2901071261844) [(0, 1), (6, 1), (14, 1)],
  term ((-33944746640006525 : Rat) / 78328924069788) [(0, 2), (2, 1), (3, 2)],
  term ((-2664495422304851 : Rat) / 5802142523688) [(0, 2), (2, 1), (6, 1)],
  term ((2488871127710291 : Rat) / 5802142523688) [(0, 2), (2, 1), (6, 1), (14, 1)],
  term ((-6788130415625 : Rat) / 6744934476) [(0, 2), (2, 1), (7, 1), (9, 1)],
  term ((186916352335247 : Rat) / 73444842072) [(0, 2), (2, 1), (7, 1), (11, 1)],
  term ((280381883026811 : Rat) / 266424911802) [(0, 2), (2, 1), (7, 1), (13, 1)],
  term ((85 : Rat) / 21) [(0, 2), (2, 1), (7, 1), (13, 1), (16, 1)],
  term ((-21696170156143477 : Rat) / 13054820678298) [(0, 2), (2, 1), (7, 1), (15, 1)],
  term ((-16 : Rat) / 3) [(0, 2), (2, 1), (7, 1), (15, 1), (16, 1)],
  term ((-691022102046859 : Rat) / 621658127538) [(0, 2), (2, 1), (7, 2)],
  term ((-201665036689987 : Rat) / 107918951616) [(0, 2), (2, 1), (9, 1), (11, 1)],
  term ((6788130415625 : Rat) / 10117401714) [(0, 2), (2, 1), (9, 1), (15, 1)],
  term ((395910373848515 : Rat) / 8703213785532) [(0, 2), (2, 1), (10, 1)],
  term ((8328205440429481 : Rat) / 4262798588832) [(0, 2), (2, 1), (11, 1), (13, 1)],
  term ((-8605 : Rat) / 336) [(0, 2), (2, 1), (11, 1), (13, 1), (16, 1)],
  term ((1532199782809 : Rat) / 26861770943) [(0, 2), (2, 1), (11, 1), (14, 1), (15, 1)],
  term ((-221279613094576105 : Rat) / 52219282713192) [(0, 2), (2, 1), (11, 1), (15, 1)],
  term ((1549 : Rat) / 84) [(0, 2), (2, 1), (11, 1), (15, 1), (16, 1)],
  term ((20254808239762003 : Rat) / 17406427571064) [(0, 2), (2, 1), (11, 2)],
  term ((-286471595296571 : Rat) / 399637367703) [(0, 2), (2, 1), (13, 1), (15, 1)],
  term ((-170 : Rat) / 63) [(0, 2), (2, 1), (13, 1), (15, 1), (16, 1)],
  term ((524228088584140 : Rat) / 2175803446383) [(0, 2), (2, 1), (14, 1)],
  term ((-10143334851217007 : Rat) / 26109641356596) [(0, 2), (2, 1), (14, 2)],
  term ((36830853064497271 : Rat) / 26109641356596) [(0, 2), (2, 1), (15, 2)],
  term ((32 : Rat) / 9) [(0, 2), (2, 1), (15, 2), (16, 1)],
  term ((1063033397773325 : Rat) / 26109641356596) [(0, 2), (2, 2)],
  term ((640 : Rat) / 21) [(0, 2), (3, 1), (5, 1)],
  term ((-320 : Rat) / 7) [(0, 2), (3, 1), (5, 1), (14, 1)],
  term ((-97280 : Rat) / 343) [(0, 2), (3, 1), (5, 1), (15, 2)],
  term ((9311178080130293 : Rat) / 13054820678298) [(0, 2), (3, 1), (6, 1), (7, 1)],
  term ((-6788130415625 : Rat) / 20234803428) [(0, 2), (3, 1), (6, 1), (9, 1)],
  term ((-173351835750269089 : Rat) / 78328924069788) [(0, 2), (3, 1), (6, 1), (11, 1)],
  term ((-33944746640006525 : Rat) / 78328924069788) [(0, 2), (3, 1), (6, 1), (12, 1), (15, 1)],
  term ((280381883026811 : Rat) / 799274735406) [(0, 2), (3, 1), (6, 1), (13, 1)],
  term ((-186880 : Rat) / 3087) [(0, 2), (3, 1), (6, 1), (13, 1), (15, 2)],
  term ((85 : Rat) / 63) [(0, 2), (3, 1), (6, 1), (13, 1), (16, 1)],
  term ((6472119103841 : Rat) / 241755938487) [(0, 2), (3, 1), (6, 1), (14, 1), (15, 1)],
  term ((7054254498875453 : Rat) / 4351606892766) [(0, 2), (3, 1), (6, 1), (15, 1)],
  term ((-16 : Rat) / 9) [(0, 2), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((373760 : Rat) / 3087) [(0, 2), (3, 1), (6, 1), (15, 3)],
  term ((-249611075209385 : Rat) / 11189846295684) [(0, 2), (3, 1), (7, 1)],
  term ((129097240585215053 : Rat) / 156657848139576) [(0, 2), (3, 1), (7, 1), (10, 1)],
  term ((33944746640006525 : Rat) / 78328924069788) [(0, 2), (3, 1), (7, 1), (12, 1), (14, 1)],
  term ((186880 : Rat) / 3087) [(0, 2), (3, 1), (7, 1), (12, 1), (15, 2)],
  term ((-52982721593064289 : Rat) / 52219282713192) [(0, 2), (3, 1), (7, 1), (14, 1)],
  term ((-373760 : Rat) / 3087) [(0, 2), (3, 1), (7, 1), (14, 1), (15, 2)],
  term ((-93440 : Rat) / 1029) [(0, 2), (3, 1), (7, 1), (15, 2)],
  term ((-640 : Rat) / 21) [(0, 2), (3, 1), (9, 1)],
  term ((275055044441125 : Rat) / 323756854848) [(0, 2), (3, 1), (9, 1), (10, 1)],
  term ((320 : Rat) / 7) [(0, 2), (3, 1), (9, 1), (14, 1)],
  term ((97280 : Rat) / 343) [(0, 2), (3, 1), (9, 1), (15, 2)],
  term ((-9822679084795405 : Rat) / 52219282713192) [(0, 2), (3, 1), (10, 1), (11, 1)],
  term ((-11186576839603855 : Rat) / 12788395766496) [(0, 2), (3, 1), (10, 1), (13, 1)],
  term ((5485 : Rat) / 144) [(0, 2), (3, 1), (10, 1), (13, 1), (16, 1)],
  term ((28705177706595329 : Rat) / 26109641356596) [(0, 2), (3, 1), (10, 1), (15, 1)],
  term ((-1117 : Rat) / 36) [(0, 2), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((23275627879084669 : Rat) / 156657848139576) [(0, 2), (3, 1), (11, 1)],
  term ((7738260225025805 : Rat) / 156657848139576) [(0, 2), (3, 1), (11, 1), (14, 1)],
  term ((320 : Rat) / 21) [(0, 2), (3, 1), (12, 1), (15, 1)],
  term ((-186880 : Rat) / 3087) [(0, 2), (3, 1), (12, 1), (15, 3)],
  term ((-31557579430260605 : Rat) / 156657848139576) [(0, 2), (3, 1), (13, 1)],
  term ((30363995825387645 : Rat) / 78328924069788) [(0, 2), (3, 1), (13, 1), (14, 1)],
  term ((186880 : Rat) / 3087) [(0, 2), (3, 1), (13, 1), (14, 1), (15, 2)],
  term ((-688640 : Rat) / 3087) [(0, 2), (3, 1), (13, 1), (15, 2)],
  term ((-1404010174610438 : Rat) / 6527410339149) [(0, 2), (3, 1), (14, 1), (15, 1)],
  term ((93440 : Rat) / 3087) [(0, 2), (3, 1), (14, 2), (15, 1)],
  term ((1885268082658595 : Rat) / 2797461573921) [(0, 2), (3, 1), (15, 1)],
  term ((-93440 : Rat) / 3087) [(0, 2), (3, 1), (15, 3)],
  term ((1858755801021965 : Rat) / 26109641356596) [(0, 2), (3, 2)],
  term ((-6297910881408425 : Rat) / 78328924069788) [(0, 2), (3, 2), (6, 1)],
  term ((-36402876486038605 : Rat) / 156657848139576) [(0, 2), (3, 2), (10, 1)],
  term ((-2560 : Rat) / 63) [(0, 2), (3, 2), (14, 1)],
  term ((-8 : Rat) / 3) [(0, 2), (5, 1), (15, 1)],
  term ((2 : Rat) / 3) [(0, 2), (5, 1), (15, 1), (16, 1)],
  term ((-1989973971600233 : Rat) / 5802142523688) [(0, 2), (6, 1)],
  term ((7660998914045 : Rat) / 161170625658) [(0, 2), (6, 1), (7, 1), (9, 1)],
  term ((-1532199782809 : Rat) / 161170625658) [(0, 2), (6, 1), (7, 1), (9, 1), (12, 1)],
  term ((-14903707287383143 : Rat) / 6527410339149) [(0, 2), (6, 1), (7, 1), (11, 1)],
  term ((-4349915183394751 : Rat) / 13054820678298) [(0, 2), (6, 1), (7, 1), (12, 1), (15, 1)],
  term ((-1532199782809 : Rat) / 161170625658) [(0, 2), (6, 1), (7, 1), (13, 1)],
  term ((4349915183394751 : Rat) / 4351606892766) [(0, 2), (6, 1), (7, 1), (15, 1)],
  term ((6157376606366009 : Rat) / 1598549470812) [(0, 2), (6, 1), (9, 1), (11, 1)],
  term ((-119808 : Rat) / 553) [(0, 2), (6, 1), (9, 1), (11, 1), (12, 1)],
  term ((-941242657 : Rat) / 166541592) [(0, 2), (6, 1), (9, 1), (12, 1), (13, 1)],
  term ((-725 : Rat) / 84) [(0, 2), (6, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((223016262790904647 : Rat) / 313315696279152) [(0, 2), (6, 1), (9, 1), (12, 1), (15, 1)],
  term ((157 : Rat) / 21) [(0, 2), (6, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((11584628303 : Rat) / 333083184) [(0, 2), (6, 1), (9, 1), (13, 1)],
  term ((3625 : Rat) / 84) [(0, 2), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((-233428178880157183 : Rat) / 104438565426384) [(0, 2), (6, 1), (9, 1), (15, 1)],
  term ((-785 : Rat) / 21) [(0, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-71946724318135 : Rat) / 11604285047376) [(0, 2), (6, 1), (9, 2)],
  term ((2172201733 : Rat) / 333083184) [(0, 2), (6, 1), (9, 2), (12, 1)],
  term ((4125005306867285 : Rat) / 8703213785532) [(0, 2), (6, 1), (10, 1)],
  term ((1005180329591 : Rat) / 29602767978) [(0, 2), (6, 1), (10, 1), (14, 1)],
  term ((-353060918012465 : Rat) / 6527410339149) [(0, 2), (6, 1), (11, 1), (12, 1), (15, 1)],
  term ((-327140384197199 : Rat) / 114182105058) [(0, 2), (6, 1), (11, 1), (13, 1)],
  term ((-85 : Rat) / 9) [(0, 2), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((-7660998914045 : Rat) / 26861770943) [(0, 2), (6, 1), (11, 1), (14, 1), (15, 1)],
  term ((21760729494915749 : Rat) / 26109641356596) [(0, 2), (6, 1), (11, 1), (15, 1)],
  term ((33944746640006525 : Rat) / 39164462034894) [(1, 1), (2, 1), (3, 2), (15, 1)],
  term ((-2488871127710291 : Rat) / 2901071261844) [(1, 1), (2, 1), (6, 1), (14, 1), (15, 1)],
  term ((2664495422304851 : Rat) / 2901071261844) [(1, 1), (2, 1), (6, 1), (15, 1)],
  term ((6788130415625 : Rat) / 3372467238) [(1, 1), (2, 1), (7, 1), (9, 1), (15, 1)],
  term ((-186916352335247 : Rat) / 36722421036) [(1, 1), (2, 1), (7, 1), (11, 1), (15, 1)],
  term ((-280381883026811 : Rat) / 133212455901) [(1, 1), (2, 1), (7, 1), (13, 1), (15, 1)],
  term ((-170 : Rat) / 21) [(1, 1), (2, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((21696170156143477 : Rat) / 6527410339149) [(1, 1), (2, 1), (7, 1), (15, 2)],
  term ((32 : Rat) / 3) [(1, 1), (2, 1), (7, 1), (15, 2), (16, 1)],
  term ((691022102046859 : Rat) / 310829063769) [(1, 1), (2, 1), (7, 2), (15, 1)],
  term ((201665036689987 : Rat) / 53959475808) [(1, 1), (2, 1), (9, 1), (11, 1), (15, 1)],
  term ((-6788130415625 : Rat) / 5058700857) [(1, 1), (2, 1), (9, 1), (15, 2)],
  term ((-395910373848515 : Rat) / 4351606892766) [(1, 1), (2, 1), (10, 1), (15, 1)],
  term ((-8328205440429481 : Rat) / 2131399294416) [(1, 1), (2, 1), (11, 1), (13, 1), (15, 1)],
  term ((8605 : Rat) / 168) [(1, 1), (2, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(1, 1), (2, 1), (11, 1), (14, 1), (15, 2)],
  term ((221279613094576105 : Rat) / 26109641356596) [(1, 1), (2, 1), (11, 1), (15, 2)],
  term ((-1549 : Rat) / 42) [(1, 1), (2, 1), (11, 1), (15, 2), (16, 1)],
  term ((-20254808239762003 : Rat) / 8703213785532) [(1, 1), (2, 1), (11, 2), (15, 1)],
  term ((572943190593142 : Rat) / 399637367703) [(1, 1), (2, 1), (13, 1), (15, 2)],
  term ((340 : Rat) / 63) [(1, 1), (2, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1048456177168280 : Rat) / 2175803446383) [(1, 1), (2, 1), (14, 1), (15, 1)],
  term ((10143334851217007 : Rat) / 13054820678298) [(1, 1), (2, 1), (14, 2), (15, 1)],
  term ((-36830853064497271 : Rat) / 13054820678298) [(1, 1), (2, 1), (15, 3)],
  term ((-64 : Rat) / 9) [(1, 1), (2, 1), (15, 3), (16, 1)],
  term ((-1063033397773325 : Rat) / 13054820678298) [(1, 1), (2, 2), (15, 1)],
  term ((640 : Rat) / 7) [(1, 1), (3, 1), (5, 1), (14, 1), (15, 1)],
  term ((-1280 : Rat) / 21) [(1, 1), (3, 1), (5, 1), (15, 1)],
  term ((194560 : Rat) / 343) [(1, 1), (3, 1), (5, 1), (15, 3)],
  term ((-9311178080130293 : Rat) / 6527410339149) [(1, 1), (3, 1), (6, 1), (7, 1), (15, 1)],
  term ((6788130415625 : Rat) / 10117401714) [(1, 1), (3, 1), (6, 1), (9, 1), (15, 1)],
  term ((173351835750269089 : Rat) / 39164462034894) [(1, 1), (3, 1), (6, 1), (11, 1), (15, 1)],
  term ((33944746640006525 : Rat) / 39164462034894) [(1, 1), (3, 1), (6, 1), (12, 1), (15, 2)],
  term ((-280381883026811 : Rat) / 399637367703) [(1, 1), (3, 1), (6, 1), (13, 1), (15, 1)],
  term ((-170 : Rat) / 63) [(1, 1), (3, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((373760 : Rat) / 3087) [(1, 1), (3, 1), (6, 1), (13, 1), (15, 3)],
  term ((-12944238207682 : Rat) / 241755938487) [(1, 1), (3, 1), (6, 1), (14, 1), (15, 2)],
  term ((-7054254498875453 : Rat) / 2175803446383) [(1, 1), (3, 1), (6, 1), (15, 2)],
  term ((32 : Rat) / 9) [(1, 1), (3, 1), (6, 1), (15, 2), (16, 1)],
  term ((-747520 : Rat) / 3087) [(1, 1), (3, 1), (6, 1), (15, 4)],
  term ((-129097240585215053 : Rat) / 78328924069788) [(1, 1), (3, 1), (7, 1), (10, 1), (15, 1)],
  term ((-33944746640006525 : Rat) / 39164462034894) [(1, 1), (3, 1), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((-373760 : Rat) / 3087) [(1, 1), (3, 1), (7, 1), (12, 1), (15, 3)],
  term ((52982721593064289 : Rat) / 26109641356596) [(1, 1), (3, 1), (7, 1), (14, 1), (15, 1)],
  term ((747520 : Rat) / 3087) [(1, 1), (3, 1), (7, 1), (14, 1), (15, 3)],
  term ((249611075209385 : Rat) / 5594923147842) [(1, 1), (3, 1), (7, 1), (15, 1)],
  term ((186880 : Rat) / 1029) [(1, 1), (3, 1), (7, 1), (15, 3)],
  term ((-275055044441125 : Rat) / 161878427424) [(1, 1), (3, 1), (9, 1), (10, 1), (15, 1)],
  term ((-640 : Rat) / 7) [(1, 1), (3, 1), (9, 1), (14, 1), (15, 1)],
  term ((1280 : Rat) / 21) [(1, 1), (3, 1), (9, 1), (15, 1)],
  term ((-194560 : Rat) / 343) [(1, 1), (3, 1), (9, 1), (15, 3)],
  term ((9822679084795405 : Rat) / 26109641356596) [(1, 1), (3, 1), (10, 1), (11, 1), (15, 1)],
  term ((11186576839603855 : Rat) / 6394197883248) [(1, 1), (3, 1), (10, 1), (13, 1), (15, 1)],
  term ((-5485 : Rat) / 72) [(1, 1), (3, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-28705177706595329 : Rat) / 13054820678298) [(1, 1), (3, 1), (10, 1), (15, 2)],
  term ((1117 : Rat) / 18) [(1, 1), (3, 1), (10, 1), (15, 2), (16, 1)],
  term ((-7738260225025805 : Rat) / 78328924069788) [(1, 1), (3, 1), (11, 1), (14, 1), (15, 1)],
  term ((-23275627879084669 : Rat) / 78328924069788) [(1, 1), (3, 1), (11, 1), (15, 1)],
  term ((-640 : Rat) / 21) [(1, 1), (3, 1), (12, 1), (15, 2)],
  term ((373760 : Rat) / 3087) [(1, 1), (3, 1), (12, 1), (15, 4)],
  term ((-30363995825387645 : Rat) / 39164462034894) [(1, 1), (3, 1), (13, 1), (14, 1), (15, 1)],
  term ((-373760 : Rat) / 3087) [(1, 1), (3, 1), (13, 1), (14, 1), (15, 3)],
  term ((31557579430260605 : Rat) / 78328924069788) [(1, 1), (3, 1), (13, 1), (15, 1)],
  term ((1377280 : Rat) / 3087) [(1, 1), (3, 1), (13, 1), (15, 3)],
  term ((2808020349220876 : Rat) / 6527410339149) [(1, 1), (3, 1), (14, 1), (15, 2)],
  term ((-186880 : Rat) / 3087) [(1, 1), (3, 1), (14, 2), (15, 2)],
  term ((-3770536165317190 : Rat) / 2797461573921) [(1, 1), (3, 1), (15, 2)],
  term ((186880 : Rat) / 3087) [(1, 1), (3, 1), (15, 4)],
  term ((6297910881408425 : Rat) / 39164462034894) [(1, 1), (3, 2), (6, 1), (15, 1)],
  term ((36402876486038605 : Rat) / 78328924069788) [(1, 1), (3, 2), (10, 1), (15, 1)],
  term ((5120 : Rat) / 63) [(1, 1), (3, 2), (14, 1), (15, 1)],
  term ((-1858755801021965 : Rat) / 13054820678298) [(1, 1), (3, 2), (15, 1)],
  term ((16 : Rat) / 3) [(1, 1), (5, 1), (15, 2)],
  term ((-4 : Rat) / 3) [(1, 1), (5, 1), (15, 2), (16, 1)],
  term ((1532199782809 : Rat) / 80585312829) [(1, 1), (6, 1), (7, 1), (9, 1), (12, 1), (15, 1)],
  term ((-7660998914045 : Rat) / 80585312829) [(1, 1), (6, 1), (7, 1), (9, 1), (15, 1)],
  term ((29807414574766286 : Rat) / 6527410339149) [(1, 1), (6, 1), (7, 1), (11, 1), (15, 1)],
  term ((4349915183394751 : Rat) / 6527410339149) [(1, 1), (6, 1), (7, 1), (12, 1), (15, 2)],
  term ((1532199782809 : Rat) / 80585312829) [(1, 1), (6, 1), (7, 1), (13, 1), (15, 1)],
  term ((-4349915183394751 : Rat) / 2175803446383) [(1, 1), (6, 1), (7, 1), (15, 2)],
  term ((239616 : Rat) / 553) [(1, 1), (6, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((-6157376606366009 : Rat) / 799274735406) [(1, 1), (6, 1), (9, 1), (11, 1), (15, 1)],
  term ((941242657 : Rat) / 83270796) [(1, 1), (6, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((725 : Rat) / 42) [(1, 1), (6, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-223016262790904647 : Rat) / 156657848139576) [(1, 1), (6, 1), (9, 1), (12, 1), (15, 2)],
  term ((-314 : Rat) / 21) [(1, 1), (6, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((-11584628303 : Rat) / 166541592) [(1, 1), (6, 1), (9, 1), (13, 1), (15, 1)],
  term ((-3625 : Rat) / 42) [(1, 1), (6, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((233428178880157183 : Rat) / 52219282713192) [(1, 1), (6, 1), (9, 1), (15, 2)],
  term ((1570 : Rat) / 21) [(1, 1), (6, 1), (9, 1), (15, 2), (16, 1)],
  term ((-2172201733 : Rat) / 166541592) [(1, 1), (6, 1), (9, 2), (12, 1), (15, 1)],
  term ((71946724318135 : Rat) / 5802142523688) [(1, 1), (6, 1), (9, 2), (15, 1)],
  term ((-1005180329591 : Rat) / 14801383989) [(1, 1), (6, 1), (10, 1), (14, 1), (15, 1)],
  term ((-4125005306867285 : Rat) / 4351606892766) [(1, 1), (6, 1), (10, 1), (15, 1)],
  term ((706121836024930 : Rat) / 6527410339149) [(1, 1), (6, 1), (11, 1), (12, 1), (15, 2)],
  term ((327140384197199 : Rat) / 57091052529) [(1, 1), (6, 1), (11, 1), (13, 1), (15, 1)],
  term ((170 : Rat) / 9) [(1, 1), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((15321997828090 : Rat) / 26861770943) [(1, 1), (6, 1), (11, 1), (14, 1), (15, 2)],
  term ((-21760729494915749 : Rat) / 13054820678298) [(1, 1), (6, 1), (11, 1), (15, 2)],
  term ((1989973971600233 : Rat) / 2901071261844) [(1, 1), (6, 1), (15, 1)],
  term ((-33944746640006525 : Rat) / 78328924069788) [(1, 2), (2, 1), (3, 2)],
  term ((-2664495422304851 : Rat) / 5802142523688) [(1, 2), (2, 1), (6, 1)],
  term ((2488871127710291 : Rat) / 5802142523688) [(1, 2), (2, 1), (6, 1), (14, 1)],
  term ((-6788130415625 : Rat) / 6744934476) [(1, 2), (2, 1), (7, 1), (9, 1)],
  term ((186916352335247 : Rat) / 73444842072) [(1, 2), (2, 1), (7, 1), (11, 1)],
  term ((280381883026811 : Rat) / 266424911802) [(1, 2), (2, 1), (7, 1), (13, 1)],
  term ((85 : Rat) / 21) [(1, 2), (2, 1), (7, 1), (13, 1), (16, 1)],
  term ((-21696170156143477 : Rat) / 13054820678298) [(1, 2), (2, 1), (7, 1), (15, 1)],
  term ((-16 : Rat) / 3) [(1, 2), (2, 1), (7, 1), (15, 1), (16, 1)],
  term ((-691022102046859 : Rat) / 621658127538) [(1, 2), (2, 1), (7, 2)],
  term ((-201665036689987 : Rat) / 107918951616) [(1, 2), (2, 1), (9, 1), (11, 1)],
  term ((6788130415625 : Rat) / 10117401714) [(1, 2), (2, 1), (9, 1), (15, 1)],
  term ((395910373848515 : Rat) / 8703213785532) [(1, 2), (2, 1), (10, 1)],
  term ((8328205440429481 : Rat) / 4262798588832) [(1, 2), (2, 1), (11, 1), (13, 1)],
  term ((-8605 : Rat) / 336) [(1, 2), (2, 1), (11, 1), (13, 1), (16, 1)],
  term ((1532199782809 : Rat) / 26861770943) [(1, 2), (2, 1), (11, 1), (14, 1), (15, 1)],
  term ((-221279613094576105 : Rat) / 52219282713192) [(1, 2), (2, 1), (11, 1), (15, 1)],
  term ((1549 : Rat) / 84) [(1, 2), (2, 1), (11, 1), (15, 1), (16, 1)],
  term ((20254808239762003 : Rat) / 17406427571064) [(1, 2), (2, 1), (11, 2)],
  term ((-286471595296571 : Rat) / 399637367703) [(1, 2), (2, 1), (13, 1), (15, 1)],
  term ((-170 : Rat) / 63) [(1, 2), (2, 1), (13, 1), (15, 1), (16, 1)],
  term ((524228088584140 : Rat) / 2175803446383) [(1, 2), (2, 1), (14, 1)],
  term ((-10143334851217007 : Rat) / 26109641356596) [(1, 2), (2, 1), (14, 2)],
  term ((36830853064497271 : Rat) / 26109641356596) [(1, 2), (2, 1), (15, 2)],
  term ((32 : Rat) / 9) [(1, 2), (2, 1), (15, 2), (16, 1)],
  term ((1063033397773325 : Rat) / 26109641356596) [(1, 2), (2, 2)],
  term ((640 : Rat) / 21) [(1, 2), (3, 1), (5, 1)],
  term ((-320 : Rat) / 7) [(1, 2), (3, 1), (5, 1), (14, 1)],
  term ((-97280 : Rat) / 343) [(1, 2), (3, 1), (5, 1), (15, 2)],
  term ((9311178080130293 : Rat) / 13054820678298) [(1, 2), (3, 1), (6, 1), (7, 1)],
  term ((-6788130415625 : Rat) / 20234803428) [(1, 2), (3, 1), (6, 1), (9, 1)],
  term ((-173351835750269089 : Rat) / 78328924069788) [(1, 2), (3, 1), (6, 1), (11, 1)],
  term ((-33944746640006525 : Rat) / 78328924069788) [(1, 2), (3, 1), (6, 1), (12, 1), (15, 1)],
  term ((280381883026811 : Rat) / 799274735406) [(1, 2), (3, 1), (6, 1), (13, 1)],
  term ((-186880 : Rat) / 3087) [(1, 2), (3, 1), (6, 1), (13, 1), (15, 2)],
  term ((85 : Rat) / 63) [(1, 2), (3, 1), (6, 1), (13, 1), (16, 1)],
  term ((6472119103841 : Rat) / 241755938487) [(1, 2), (3, 1), (6, 1), (14, 1), (15, 1)],
  term ((7054254498875453 : Rat) / 4351606892766) [(1, 2), (3, 1), (6, 1), (15, 1)],
  term ((-16 : Rat) / 9) [(1, 2), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((373760 : Rat) / 3087) [(1, 2), (3, 1), (6, 1), (15, 3)],
  term ((-249611075209385 : Rat) / 11189846295684) [(1, 2), (3, 1), (7, 1)],
  term ((129097240585215053 : Rat) / 156657848139576) [(1, 2), (3, 1), (7, 1), (10, 1)],
  term ((33944746640006525 : Rat) / 78328924069788) [(1, 2), (3, 1), (7, 1), (12, 1), (14, 1)],
  term ((186880 : Rat) / 3087) [(1, 2), (3, 1), (7, 1), (12, 1), (15, 2)],
  term ((-52982721593064289 : Rat) / 52219282713192) [(1, 2), (3, 1), (7, 1), (14, 1)],
  term ((-373760 : Rat) / 3087) [(1, 2), (3, 1), (7, 1), (14, 1), (15, 2)],
  term ((-93440 : Rat) / 1029) [(1, 2), (3, 1), (7, 1), (15, 2)],
  term ((-640 : Rat) / 21) [(1, 2), (3, 1), (9, 1)],
  term ((275055044441125 : Rat) / 323756854848) [(1, 2), (3, 1), (9, 1), (10, 1)],
  term ((320 : Rat) / 7) [(1, 2), (3, 1), (9, 1), (14, 1)],
  term ((97280 : Rat) / 343) [(1, 2), (3, 1), (9, 1), (15, 2)],
  term ((-9822679084795405 : Rat) / 52219282713192) [(1, 2), (3, 1), (10, 1), (11, 1)],
  term ((-11186576839603855 : Rat) / 12788395766496) [(1, 2), (3, 1), (10, 1), (13, 1)],
  term ((5485 : Rat) / 144) [(1, 2), (3, 1), (10, 1), (13, 1), (16, 1)],
  term ((28705177706595329 : Rat) / 26109641356596) [(1, 2), (3, 1), (10, 1), (15, 1)],
  term ((-1117 : Rat) / 36) [(1, 2), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((23275627879084669 : Rat) / 156657848139576) [(1, 2), (3, 1), (11, 1)],
  term ((7738260225025805 : Rat) / 156657848139576) [(1, 2), (3, 1), (11, 1), (14, 1)],
  term ((320 : Rat) / 21) [(1, 2), (3, 1), (12, 1), (15, 1)],
  term ((-186880 : Rat) / 3087) [(1, 2), (3, 1), (12, 1), (15, 3)],
  term ((-31557579430260605 : Rat) / 156657848139576) [(1, 2), (3, 1), (13, 1)],
  term ((30363995825387645 : Rat) / 78328924069788) [(1, 2), (3, 1), (13, 1), (14, 1)],
  term ((186880 : Rat) / 3087) [(1, 2), (3, 1), (13, 1), (14, 1), (15, 2)],
  term ((-688640 : Rat) / 3087) [(1, 2), (3, 1), (13, 1), (15, 2)],
  term ((-1404010174610438 : Rat) / 6527410339149) [(1, 2), (3, 1), (14, 1), (15, 1)],
  term ((93440 : Rat) / 3087) [(1, 2), (3, 1), (14, 2), (15, 1)],
  term ((1885268082658595 : Rat) / 2797461573921) [(1, 2), (3, 1), (15, 1)],
  term ((-93440 : Rat) / 3087) [(1, 2), (3, 1), (15, 3)],
  term ((1858755801021965 : Rat) / 26109641356596) [(1, 2), (3, 2)],
  term ((-6297910881408425 : Rat) / 78328924069788) [(1, 2), (3, 2), (6, 1)],
  term ((-36402876486038605 : Rat) / 156657848139576) [(1, 2), (3, 2), (10, 1)],
  term ((-2560 : Rat) / 63) [(1, 2), (3, 2), (14, 1)],
  term ((-8 : Rat) / 3) [(1, 2), (5, 1), (15, 1)],
  term ((2 : Rat) / 3) [(1, 2), (5, 1), (15, 1), (16, 1)],
  term ((-1989973971600233 : Rat) / 5802142523688) [(1, 2), (6, 1)],
  term ((7660998914045 : Rat) / 161170625658) [(1, 2), (6, 1), (7, 1), (9, 1)],
  term ((-1532199782809 : Rat) / 161170625658) [(1, 2), (6, 1), (7, 1), (9, 1), (12, 1)],
  term ((-14903707287383143 : Rat) / 6527410339149) [(1, 2), (6, 1), (7, 1), (11, 1)],
  term ((-4349915183394751 : Rat) / 13054820678298) [(1, 2), (6, 1), (7, 1), (12, 1), (15, 1)],
  term ((-1532199782809 : Rat) / 161170625658) [(1, 2), (6, 1), (7, 1), (13, 1)],
  term ((4349915183394751 : Rat) / 4351606892766) [(1, 2), (6, 1), (7, 1), (15, 1)],
  term ((6157376606366009 : Rat) / 1598549470812) [(1, 2), (6, 1), (9, 1), (11, 1)],
  term ((-119808 : Rat) / 553) [(1, 2), (6, 1), (9, 1), (11, 1), (12, 1)],
  term ((-941242657 : Rat) / 166541592) [(1, 2), (6, 1), (9, 1), (12, 1), (13, 1)],
  term ((-725 : Rat) / 84) [(1, 2), (6, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((223016262790904647 : Rat) / 313315696279152) [(1, 2), (6, 1), (9, 1), (12, 1), (15, 1)],
  term ((157 : Rat) / 21) [(1, 2), (6, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((11584628303 : Rat) / 333083184) [(1, 2), (6, 1), (9, 1), (13, 1)],
  term ((3625 : Rat) / 84) [(1, 2), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((-233428178880157183 : Rat) / 104438565426384) [(1, 2), (6, 1), (9, 1), (15, 1)],
  term ((-785 : Rat) / 21) [(1, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-71946724318135 : Rat) / 11604285047376) [(1, 2), (6, 1), (9, 2)],
  term ((2172201733 : Rat) / 333083184) [(1, 2), (6, 1), (9, 2), (12, 1)],
  term ((4125005306867285 : Rat) / 8703213785532) [(1, 2), (6, 1), (10, 1)],
  term ((1005180329591 : Rat) / 29602767978) [(1, 2), (6, 1), (10, 1), (14, 1)],
  term ((-353060918012465 : Rat) / 6527410339149) [(1, 2), (6, 1), (11, 1), (12, 1), (15, 1)],
  term ((-327140384197199 : Rat) / 114182105058) [(1, 2), (6, 1), (11, 1), (13, 1)],
  term ((-85 : Rat) / 9) [(1, 2), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((-7660998914045 : Rat) / 26861770943) [(1, 2), (6, 1), (11, 1), (14, 1), (15, 1)],
  term ((21760729494915749 : Rat) / 26109641356596) [(1, 2), (6, 1), (11, 1), (15, 1)],
  term ((33944746640006525 : Rat) / 78328924069788) [(2, 1), (3, 2)],
  term ((-33944746640006525 : Rat) / 39164462034894) [(2, 1), (3, 2), (14, 1)],
  term ((2664495422304851 : Rat) / 5802142523688) [(2, 1), (6, 1)],
  term ((-289550443419259 : Rat) / 214894167544) [(2, 1), (6, 1), (14, 1)],
  term ((2488871127710291 : Rat) / 2901071261844) [(2, 1), (6, 1), (14, 2)],
  term ((6788130415625 : Rat) / 6744934476) [(2, 1), (7, 1), (9, 1)],
  term ((-6788130415625 : Rat) / 3372467238) [(2, 1), (7, 1), (9, 1), (14, 1)],
  term ((-186916352335247 : Rat) / 73444842072) [(2, 1), (7, 1), (11, 1)],
  term ((186916352335247 : Rat) / 36722421036) [(2, 1), (7, 1), (11, 1), (14, 1)],
  term ((-280381883026811 : Rat) / 266424911802) [(2, 1), (7, 1), (13, 1)],
  term ((280381883026811 : Rat) / 133212455901) [(2, 1), (7, 1), (13, 1), (14, 1)],
  term ((170 : Rat) / 21) [(2, 1), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((-85 : Rat) / 21) [(2, 1), (7, 1), (13, 1), (16, 1)],
  term ((-21696170156143477 : Rat) / 6527410339149) [(2, 1), (7, 1), (14, 1), (15, 1)],
  term ((-32 : Rat) / 3) [(2, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((21696170156143477 : Rat) / 13054820678298) [(2, 1), (7, 1), (15, 1)],
  term ((16 : Rat) / 3) [(2, 1), (7, 1), (15, 1), (16, 1)],
  term ((691022102046859 : Rat) / 621658127538) [(2, 1), (7, 2)],
  term ((-691022102046859 : Rat) / 310829063769) [(2, 1), (7, 2), (14, 1)],
  term ((201665036689987 : Rat) / 107918951616) [(2, 1), (9, 1), (11, 1)],
  term ((-201665036689987 : Rat) / 53959475808) [(2, 1), (9, 1), (11, 1), (14, 1)],
  term ((6788130415625 : Rat) / 5058700857) [(2, 1), (9, 1), (14, 1), (15, 1)],
  term ((-6788130415625 : Rat) / 10117401714) [(2, 1), (9, 1), (15, 1)],
  term ((-395910373848515 : Rat) / 8703213785532) [(2, 1), (10, 1)],
  term ((395910373848515 : Rat) / 4351606892766) [(2, 1), (10, 1), (14, 1)],
  term ((-8328205440429481 : Rat) / 4262798588832) [(2, 1), (11, 1), (13, 1)],
  term ((8328205440429481 : Rat) / 2131399294416) [(2, 1), (11, 1), (13, 1), (14, 1)],
  term ((-8605 : Rat) / 168) [(2, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((8605 : Rat) / 336) [(2, 1), (11, 1), (13, 1), (16, 1)],
  term ((-222768911283466453 : Rat) / 26109641356596) [(2, 1), (11, 1), (14, 1), (15, 1)],
  term ((1549 : Rat) / 42) [(2, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(2, 1), (11, 1), (14, 2), (15, 1)],
  term ((221279613094576105 : Rat) / 52219282713192) [(2, 1), (11, 1), (15, 1)],
  term ((-1549 : Rat) / 84) [(2, 1), (11, 1), (15, 1), (16, 1)],
  term ((-20254808239762003 : Rat) / 17406427571064) [(2, 1), (11, 2)],
  term ((20254808239762003 : Rat) / 8703213785532) [(2, 1), (11, 2), (14, 1)],
  term ((-572943190593142 : Rat) / 399637367703) [(2, 1), (13, 1), (14, 1), (15, 1)],
  term ((-340 : Rat) / 63) [(2, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((286471595296571 : Rat) / 399637367703) [(2, 1), (13, 1), (15, 1)],
  term ((170 : Rat) / 63) [(2, 1), (13, 1), (15, 1), (16, 1)],
  term ((-524228088584140 : Rat) / 2175803446383) [(2, 1), (14, 1)],
  term ((36830853064497271 : Rat) / 13054820678298) [(2, 1), (14, 1), (15, 2)],
  term ((64 : Rat) / 9) [(2, 1), (14, 1), (15, 2), (16, 1)],
  term ((22724808977236367 : Rat) / 26109641356596) [(2, 1), (14, 2)],
  term ((-10143334851217007 : Rat) / 13054820678298) [(2, 1), (14, 3)],
  term ((-36830853064497271 : Rat) / 26109641356596) [(2, 1), (15, 2)],
  term ((-32 : Rat) / 9) [(2, 1), (15, 2), (16, 1)],
  term ((-1063033397773325 : Rat) / 26109641356596) [(2, 2)],
  term ((1063033397773325 : Rat) / 13054820678298) [(2, 2), (14, 1)],
  term ((-640 : Rat) / 21) [(3, 1), (5, 1)],
  term ((320 : Rat) / 3) [(3, 1), (5, 1), (14, 1)],
  term ((-194560 : Rat) / 343) [(3, 1), (5, 1), (14, 1), (15, 2)],
  term ((-640 : Rat) / 7) [(3, 1), (5, 1), (14, 2)],
  term ((97280 : Rat) / 343) [(3, 1), (5, 1), (15, 2)],
  term ((-9311178080130293 : Rat) / 13054820678298) [(3, 1), (6, 1), (7, 1)],
  term ((9311178080130293 : Rat) / 6527410339149) [(3, 1), (6, 1), (7, 1), (14, 1)],
  term ((6788130415625 : Rat) / 20234803428) [(3, 1), (6, 1), (9, 1)],
  term ((-6788130415625 : Rat) / 10117401714) [(3, 1), (6, 1), (9, 1), (14, 1)],
  term ((173351835750269089 : Rat) / 78328924069788) [(3, 1), (6, 1), (11, 1)],
  term ((-173351835750269089 : Rat) / 39164462034894) [(3, 1), (6, 1), (11, 1), (14, 1)],
  term ((-33944746640006525 : Rat) / 39164462034894) [(3, 1), (6, 1), (12, 1), (14, 1), (15, 1)],
  term ((33944746640006525 : Rat) / 78328924069788) [(3, 1), (6, 1), (12, 1), (15, 1)],
  term ((-280381883026811 : Rat) / 799274735406) [(3, 1), (6, 1), (13, 1)],
  term ((280381883026811 : Rat) / 399637367703) [(3, 1), (6, 1), (13, 1), (14, 1)],
  term ((-373760 : Rat) / 3087) [(3, 1), (6, 1), (13, 1), (14, 1), (15, 2)],
  term ((170 : Rat) / 63) [(3, 1), (6, 1), (13, 1), (14, 1), (16, 1)],
  term ((186880 : Rat) / 3087) [(3, 1), (6, 1), (13, 1), (15, 2)],
  term ((-85 : Rat) / 63) [(3, 1), (6, 1), (13, 1), (16, 1)],
  term ((6996005426940884 : Rat) / 2175803446383) [(3, 1), (6, 1), (14, 1), (15, 1)],
  term ((-32 : Rat) / 9) [(3, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((747520 : Rat) / 3087) [(3, 1), (6, 1), (14, 1), (15, 3)],
  term ((12944238207682 : Rat) / 241755938487) [(3, 1), (6, 1), (14, 2), (15, 1)],
  term ((-7054254498875453 : Rat) / 4351606892766) [(3, 1), (6, 1), (15, 1)],
  term ((16 : Rat) / 9) [(3, 1), (6, 1), (15, 1), (16, 1)],
  term ((-373760 : Rat) / 3087) [(3, 1), (6, 1), (15, 3)],
  term ((249611075209385 : Rat) / 11189846295684) [(3, 1), (7, 1)],
  term ((-129097240585215053 : Rat) / 156657848139576) [(3, 1), (7, 1), (10, 1)],
  term ((129097240585215053 : Rat) / 78328924069788) [(3, 1), (7, 1), (10, 1), (14, 1)],
  term ((-33944746640006525 : Rat) / 78328924069788) [(3, 1), (7, 1), (12, 1), (14, 1)],
  term ((373760 : Rat) / 3087) [(3, 1), (7, 1), (12, 1), (14, 1), (15, 2)],
  term ((33944746640006525 : Rat) / 39164462034894) [(3, 1), (7, 1), (12, 1), (14, 2)],
  term ((-186880 : Rat) / 3087) [(3, 1), (7, 1), (12, 1), (15, 2)],
  term ((151959054673330087 : Rat) / 156657848139576) [(3, 1), (7, 1), (14, 1)],
  term ((-186880 : Rat) / 3087) [(3, 1), (7, 1), (14, 1), (15, 2)],
  term ((-52982721593064289 : Rat) / 26109641356596) [(3, 1), (7, 1), (14, 2)],
  term ((-747520 : Rat) / 3087) [(3, 1), (7, 1), (14, 2), (15, 2)],
  term ((93440 : Rat) / 1029) [(3, 1), (7, 1), (15, 2)],
  term ((640 : Rat) / 21) [(3, 1), (9, 1)],
  term ((-275055044441125 : Rat) / 323756854848) [(3, 1), (9, 1), (10, 1)],
  term ((275055044441125 : Rat) / 161878427424) [(3, 1), (9, 1), (10, 1), (14, 1)],
  term ((-320 : Rat) / 3) [(3, 1), (9, 1), (14, 1)],
  term ((194560 : Rat) / 343) [(3, 1), (9, 1), (14, 1), (15, 2)],
  term ((640 : Rat) / 7) [(3, 1), (9, 1), (14, 2)],
  term ((-97280 : Rat) / 343) [(3, 1), (9, 1), (15, 2)],
  term ((9822679084795405 : Rat) / 52219282713192) [(3, 1), (10, 1), (11, 1)],
  term ((-9822679084795405 : Rat) / 26109641356596) [(3, 1), (10, 1), (11, 1), (14, 1)],
  term ((11186576839603855 : Rat) / 12788395766496) [(3, 1), (10, 1), (13, 1)],
  term ((-11186576839603855 : Rat) / 6394197883248) [(3, 1), (10, 1), (13, 1), (14, 1)],
  term ((5485 : Rat) / 72) [(3, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-5485 : Rat) / 144) [(3, 1), (10, 1), (13, 1), (16, 1)],
  term ((28705177706595329 : Rat) / 13054820678298) [(3, 1), (10, 1), (14, 1), (15, 1)],
  term ((-1117 : Rat) / 18) [(3, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-28705177706595329 : Rat) / 26109641356596) [(3, 1), (10, 1), (15, 1)],
  term ((1117 : Rat) / 36) [(3, 1), (10, 1), (15, 1), (16, 1)],
  term ((-23275627879084669 : Rat) / 156657848139576) [(3, 1), (11, 1)],
  term ((12937665177714511 : Rat) / 52219282713192) [(3, 1), (11, 1), (14, 1)],
  term ((7738260225025805 : Rat) / 78328924069788) [(3, 1), (11, 1), (14, 2)],
  term ((640 : Rat) / 21) [(3, 1), (12, 1), (14, 1), (15, 1)],
  term ((-373760 : Rat) / 3087) [(3, 1), (12, 1), (14, 1), (15, 3)],
  term ((-320 : Rat) / 21) [(3, 1), (12, 1), (15, 1)],
  term ((186880 : Rat) / 3087) [(3, 1), (12, 1), (15, 3)],
  term ((31557579430260605 : Rat) / 156657848139576) [(3, 1), (13, 1)],
  term ((-30960787627824125 : Rat) / 39164462034894) [(3, 1), (13, 1), (14, 1)],
  term ((-1564160 : Rat) / 3087) [(3, 1), (13, 1), (14, 1), (15, 2)],
  term ((30363995825387645 : Rat) / 39164462034894) [(3, 1), (13, 1), (14, 2)],
  term ((373760 : Rat) / 3087) [(3, 1), (13, 1), (14, 2), (15, 2)],
  term ((688640 : Rat) / 3087) [(3, 1), (13, 1), (15, 2)],
  term ((30605783681051644 : Rat) / 19582231017447) [(3, 1), (14, 1), (15, 1)],
  term ((-186880 : Rat) / 3087) [(3, 1), (14, 1), (15, 3)],
  term ((-3005597680639756 : Rat) / 6527410339149) [(3, 1), (14, 2), (15, 1)],
  term ((186880 : Rat) / 3087) [(3, 1), (14, 3), (15, 1)],
  term ((-1885268082658595 : Rat) / 2797461573921) [(3, 1), (15, 1)],
  term ((93440 : Rat) / 3087) [(3, 1), (15, 3)],
  term ((-1858755801021965 : Rat) / 26109641356596) [(3, 2)],
  term ((6297910881408425 : Rat) / 78328924069788) [(3, 2), (6, 1)],
  term ((-6297910881408425 : Rat) / 39164462034894) [(3, 2), (6, 1), (14, 1)],
  term ((36402876486038605 : Rat) / 156657848139576) [(3, 2), (10, 1)],
  term ((-36402876486038605 : Rat) / 78328924069788) [(3, 2), (10, 1), (14, 1)],
  term ((2389237403187725 : Rat) / 13054820678298) [(3, 2), (14, 1)],
  term ((-5120 : Rat) / 63) [(3, 2), (14, 2)],
  term ((-16 : Rat) / 3) [(5, 1), (14, 1), (15, 1)],
  term ((4 : Rat) / 3) [(5, 1), (14, 1), (15, 1), (16, 1)],
  term ((8 : Rat) / 3) [(5, 1), (15, 1)],
  term ((-2 : Rat) / 3) [(5, 1), (15, 1), (16, 1)],
  term ((1989973971600233 : Rat) / 5802142523688) [(6, 1)],
  term ((-7660998914045 : Rat) / 161170625658) [(6, 1), (7, 1), (9, 1)],
  term ((1532199782809 : Rat) / 161170625658) [(6, 1), (7, 1), (9, 1), (12, 1)],
  term ((-1532199782809 : Rat) / 80585312829) [(6, 1), (7, 1), (9, 1), (12, 1), (14, 1)],
  term ((7660998914045 : Rat) / 80585312829) [(6, 1), (7, 1), (9, 1), (14, 1)],
  term ((14903707287383143 : Rat) / 6527410339149) [(6, 1), (7, 1), (11, 1)],
  term ((-29807414574766286 : Rat) / 6527410339149) [(6, 1), (7, 1), (11, 1), (14, 1)],
  term ((-4349915183394751 : Rat) / 6527410339149) [(6, 1), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((4349915183394751 : Rat) / 13054820678298) [(6, 1), (7, 1), (12, 1), (15, 1)],
  term ((1532199782809 : Rat) / 161170625658) [(6, 1), (7, 1), (13, 1)],
  term ((-1532199782809 : Rat) / 80585312829) [(6, 1), (7, 1), (13, 1), (14, 1)],
  term ((4349915183394751 : Rat) / 2175803446383) [(6, 1), (7, 1), (14, 1), (15, 1)],
  term ((-4349915183394751 : Rat) / 4351606892766) [(6, 1), (7, 1), (15, 1)],
  term ((-6157376606366009 : Rat) / 1598549470812) [(6, 1), (9, 1), (11, 1)],
  term ((119808 : Rat) / 553) [(6, 1), (9, 1), (11, 1), (12, 1)],
  term ((-239616 : Rat) / 553) [(6, 1), (9, 1), (11, 1), (12, 1), (14, 1)],
  term ((6157376606366009 : Rat) / 799274735406) [(6, 1), (9, 1), (11, 1), (14, 1)],
  term ((941242657 : Rat) / 166541592) [(6, 1), (9, 1), (12, 1), (13, 1)],
  term ((-941242657 : Rat) / 83270796) [(6, 1), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((-725 : Rat) / 42) [(6, 1), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((725 : Rat) / 84) [(6, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((223016262790904647 : Rat) / 156657848139576) [(6, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((314 : Rat) / 21) [(6, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-223016262790904647 : Rat) / 313315696279152) [(6, 1), (9, 1), (12, 1), (15, 1)],
  term ((-157 : Rat) / 21) [(6, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-11584628303 : Rat) / 333083184) [(6, 1), (9, 1), (13, 1)],
  term ((11584628303 : Rat) / 166541592) [(6, 1), (9, 1), (13, 1), (14, 1)],
  term ((3625 : Rat) / 42) [(6, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-3625 : Rat) / 84) [(6, 1), (9, 1), (13, 1), (16, 1)],
  term ((-233428178880157183 : Rat) / 52219282713192) [(6, 1), (9, 1), (14, 1), (15, 1)],
  term ((-1570 : Rat) / 21) [(6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((233428178880157183 : Rat) / 104438565426384) [(6, 1), (9, 1), (15, 1)],
  term ((785 : Rat) / 21) [(6, 1), (9, 1), (15, 1), (16, 1)],
  term ((71946724318135 : Rat) / 11604285047376) [(6, 1), (9, 2)],
  term ((-2172201733 : Rat) / 333083184) [(6, 1), (9, 2), (12, 1)],
  term ((2172201733 : Rat) / 166541592) [(6, 1), (9, 2), (12, 1), (14, 1)],
  term ((-71946724318135 : Rat) / 5802142523688) [(6, 1), (9, 2), (14, 1)],
  term ((-4125005306867285 : Rat) / 8703213785532) [(6, 1), (10, 1)],
  term ((1988621899208704 : Rat) / 2175803446383) [(6, 1), (10, 1), (14, 1)],
  term ((1005180329591 : Rat) / 14801383989) [(6, 1), (10, 1), (14, 2)],
  term ((-706121836024930 : Rat) / 6527410339149) [(6, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((353060918012465 : Rat) / 6527410339149) [(6, 1), (11, 1), (12, 1), (15, 1)],
  term ((327140384197199 : Rat) / 114182105058) [(6, 1), (11, 1), (13, 1)],
  term ((-327140384197199 : Rat) / 57091052529) [(6, 1), (11, 1), (13, 1), (14, 1)],
  term ((-170 : Rat) / 9) [(6, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((85 : Rat) / 9) [(6, 1), (11, 1), (13, 1), (16, 1)],
  term ((25483974967141619 : Rat) / 13054820678298) [(6, 1), (11, 1), (14, 1), (15, 1)],
  term ((-15321997828090 : Rat) / 26861770943) [(6, 1), (11, 1), (14, 2), (15, 1)],
  term ((-21760729494915749 : Rat) / 26109641356596) [(6, 1), (11, 1), (15, 1)],
  term ((-1989973971600233 : Rat) / 2901071261844) [(6, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 28, terms 200 through 299. -/
theorem rs_R009_ueqv_R009YNNNN_block_28_0200_0299_valid :
    checkProductSumEq rs_R009_ueqv_R009YNNNN_partials_28_0200_0299
      rs_R009_ueqv_R009YNNNN_block_28_0200_0299 = true := by
  native_decide

end R009UeqvR009YNNNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
