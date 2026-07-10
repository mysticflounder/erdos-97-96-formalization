/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009YYYNN, term block 28:200-216

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009YYYNNTermShards

/-- Generator polynomial 28 for relaxed split surplus certificate `R009:u=v:R009YYYNN`. -/
def rs_R009_ueqv_R009YYYNN_generator_28_0200_0216 : Poly :=
[
  term (-1 : Rat) [],
  term (-2 : Rat) [(0, 1), (14, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (15, 1)],
  term (1 : Rat) [(1, 2)],
  term (2 : Rat) [(14, 1)]
]

/-- Coefficient term 200 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YYYNN_coefficient_28_0200 : Poly :=
[
  term ((-17753203 : Rat) / 85351924) [(12, 1)]
]

/-- Partial product 200 for generator 28. -/
def rs_R009_ueqv_R009YYYNN_partial_28_0200 : Poly :=
[
  term ((17753203 : Rat) / 42675962) [(0, 1), (12, 1), (14, 1)],
  term ((-17753203 : Rat) / 85351924) [(0, 2), (12, 1)],
  term ((17753203 : Rat) / 42675962) [(1, 1), (12, 1), (15, 1)],
  term ((-17753203 : Rat) / 85351924) [(1, 2), (12, 1)],
  term ((17753203 : Rat) / 85351924) [(12, 1)],
  term ((-17753203 : Rat) / 42675962) [(12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 200 for generator 28. -/
theorem rs_R009_ueqv_R009YYYNN_partial_28_0200_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_28_0200
        rs_R009_ueqv_R009YYYNN_generator_28_0200_0216 =
      rs_R009_ueqv_R009YYYNN_partial_28_0200 := by
  native_decide

/-- Coefficient term 201 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YYYNN_coefficient_28_0201 : Poly :=
[
  term ((309826278 : Rat) / 21337981) [(12, 1), (14, 1), (15, 2)]
]

/-- Partial product 201 for generator 28. -/
def rs_R009_ueqv_R009YYYNN_partial_28_0201 : Poly :=
[
  term ((-619652556 : Rat) / 21337981) [(0, 1), (12, 1), (14, 2), (15, 2)],
  term ((309826278 : Rat) / 21337981) [(0, 2), (12, 1), (14, 1), (15, 2)],
  term ((-619652556 : Rat) / 21337981) [(1, 1), (12, 1), (14, 1), (15, 3)],
  term ((309826278 : Rat) / 21337981) [(1, 2), (12, 1), (14, 1), (15, 2)],
  term ((-309826278 : Rat) / 21337981) [(12, 1), (14, 1), (15, 2)],
  term ((619652556 : Rat) / 21337981) [(12, 1), (14, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 201 for generator 28. -/
theorem rs_R009_ueqv_R009YYYNN_partial_28_0201_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_28_0201
        rs_R009_ueqv_R009YYYNN_generator_28_0200_0216 =
      rs_R009_ueqv_R009YYYNN_partial_28_0201 := by
  native_decide

/-- Coefficient term 202 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YYYNN_coefficient_28_0202 : Poly :=
[
  term ((12849597 : Rat) / 42675962) [(12, 1), (15, 2)]
]

/-- Partial product 202 for generator 28. -/
def rs_R009_ueqv_R009YYYNN_partial_28_0202 : Poly :=
[
  term ((-12849597 : Rat) / 21337981) [(0, 1), (12, 1), (14, 1), (15, 2)],
  term ((12849597 : Rat) / 42675962) [(0, 2), (12, 1), (15, 2)],
  term ((-12849597 : Rat) / 21337981) [(1, 1), (12, 1), (15, 3)],
  term ((12849597 : Rat) / 42675962) [(1, 2), (12, 1), (15, 2)],
  term ((12849597 : Rat) / 21337981) [(12, 1), (14, 1), (15, 2)],
  term ((-12849597 : Rat) / 42675962) [(12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 202 for generator 28. -/
theorem rs_R009_ueqv_R009YYYNN_partial_28_0202_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_28_0202
        rs_R009_ueqv_R009YYYNN_generator_28_0200_0216 =
      rs_R009_ueqv_R009YYYNN_partial_28_0202 := by
  native_decide

/-- Coefficient term 203 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YYYNN_coefficient_28_0203 : Poly :=
[
  term ((14818329 : Rat) / 42675962) [(13, 1), (14, 1), (15, 1)]
]

/-- Partial product 203 for generator 28. -/
def rs_R009_ueqv_R009YYYNN_partial_28_0203 : Poly :=
[
  term ((-14818329 : Rat) / 21337981) [(0, 1), (13, 1), (14, 2), (15, 1)],
  term ((14818329 : Rat) / 42675962) [(0, 2), (13, 1), (14, 1), (15, 1)],
  term ((-14818329 : Rat) / 21337981) [(1, 1), (13, 1), (14, 1), (15, 2)],
  term ((14818329 : Rat) / 42675962) [(1, 2), (13, 1), (14, 1), (15, 1)],
  term ((-14818329 : Rat) / 42675962) [(13, 1), (14, 1), (15, 1)],
  term ((14818329 : Rat) / 21337981) [(13, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 203 for generator 28. -/
theorem rs_R009_ueqv_R009YYYNN_partial_28_0203_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_28_0203
        rs_R009_ueqv_R009YYYNN_generator_28_0200_0216 =
      rs_R009_ueqv_R009YYYNN_partial_28_0203 := by
  native_decide

/-- Coefficient term 204 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YYYNN_coefficient_28_0204 : Poly :=
[
  term ((-386370045 : Rat) / 21337981) [(13, 1), (14, 2), (15, 1)]
]

/-- Partial product 204 for generator 28. -/
def rs_R009_ueqv_R009YYYNN_partial_28_0204 : Poly :=
[
  term ((772740090 : Rat) / 21337981) [(0, 1), (13, 1), (14, 3), (15, 1)],
  term ((-386370045 : Rat) / 21337981) [(0, 2), (13, 1), (14, 2), (15, 1)],
  term ((772740090 : Rat) / 21337981) [(1, 1), (13, 1), (14, 2), (15, 2)],
  term ((-386370045 : Rat) / 21337981) [(1, 2), (13, 1), (14, 2), (15, 1)],
  term ((386370045 : Rat) / 21337981) [(13, 1), (14, 2), (15, 1)],
  term ((-772740090 : Rat) / 21337981) [(13, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 204 for generator 28. -/
theorem rs_R009_ueqv_R009YYYNN_partial_28_0204_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_28_0204
        rs_R009_ueqv_R009YYYNN_generator_28_0200_0216 =
      rs_R009_ueqv_R009YYYNN_partial_28_0204 := by
  native_decide

/-- Coefficient term 205 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YYYNN_coefficient_28_0205 : Poly :=
[
  term ((-2777614977 : Rat) / 85351924) [(13, 1), (15, 1)]
]

/-- Partial product 205 for generator 28. -/
def rs_R009_ueqv_R009YYYNN_partial_28_0205 : Poly :=
[
  term ((2777614977 : Rat) / 42675962) [(0, 1), (13, 1), (14, 1), (15, 1)],
  term ((-2777614977 : Rat) / 85351924) [(0, 2), (13, 1), (15, 1)],
  term ((2777614977 : Rat) / 42675962) [(1, 1), (13, 1), (15, 2)],
  term ((-2777614977 : Rat) / 85351924) [(1, 2), (13, 1), (15, 1)],
  term ((-2777614977 : Rat) / 42675962) [(13, 1), (14, 1), (15, 1)],
  term ((2777614977 : Rat) / 85351924) [(13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 205 for generator 28. -/
theorem rs_R009_ueqv_R009YYYNN_partial_28_0205_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_28_0205
        rs_R009_ueqv_R009YYYNN_generator_28_0200_0216 =
      rs_R009_ueqv_R009YYYNN_partial_28_0205 := by
  native_decide

/-- Coefficient term 206 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YYYNN_coefficient_28_0206 : Poly :=
[
  term ((142964775 : Rat) / 42675962) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 206 for generator 28. -/
def rs_R009_ueqv_R009YYYNN_partial_28_0206 : Poly :=
[
  term ((-142964775 : Rat) / 21337981) [(0, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((142964775 : Rat) / 42675962) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((-142964775 : Rat) / 21337981) [(1, 1), (13, 1), (15, 2), (16, 1)],
  term ((142964775 : Rat) / 42675962) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((142964775 : Rat) / 21337981) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-142964775 : Rat) / 42675962) [(13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 206 for generator 28. -/
theorem rs_R009_ueqv_R009YYYNN_partial_28_0206_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_28_0206
        rs_R009_ueqv_R009YYYNN_generator_28_0200_0216 =
      rs_R009_ueqv_R009YYYNN_partial_28_0206 := by
  native_decide

/-- Coefficient term 207 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YYYNN_coefficient_28_0207 : Poly :=
[
  term ((392542344 : Rat) / 3048283) [(13, 1), (15, 3)]
]

/-- Partial product 207 for generator 28. -/
def rs_R009_ueqv_R009YYYNN_partial_28_0207 : Poly :=
[
  term ((-785084688 : Rat) / 3048283) [(0, 1), (13, 1), (14, 1), (15, 3)],
  term ((392542344 : Rat) / 3048283) [(0, 2), (13, 1), (15, 3)],
  term ((-785084688 : Rat) / 3048283) [(1, 1), (13, 1), (15, 4)],
  term ((392542344 : Rat) / 3048283) [(1, 2), (13, 1), (15, 3)],
  term ((785084688 : Rat) / 3048283) [(13, 1), (14, 1), (15, 3)],
  term ((-392542344 : Rat) / 3048283) [(13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 207 for generator 28. -/
theorem rs_R009_ueqv_R009YYYNN_partial_28_0207_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_28_0207
        rs_R009_ueqv_R009YYYNN_generator_28_0200_0216 =
      rs_R009_ueqv_R009YYYNN_partial_28_0207 := by
  native_decide

/-- Coefficient term 208 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YYYNN_coefficient_28_0208 : Poly :=
[
  term ((17753203 : Rat) / 21337981) [(13, 2)]
]

/-- Partial product 208 for generator 28. -/
def rs_R009_ueqv_R009YYYNN_partial_28_0208 : Poly :=
[
  term ((-35506406 : Rat) / 21337981) [(0, 1), (13, 2), (14, 1)],
  term ((17753203 : Rat) / 21337981) [(0, 2), (13, 2)],
  term ((-35506406 : Rat) / 21337981) [(1, 1), (13, 2), (15, 1)],
  term ((17753203 : Rat) / 21337981) [(1, 2), (13, 2)],
  term ((-17753203 : Rat) / 21337981) [(13, 2)],
  term ((35506406 : Rat) / 21337981) [(13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 208 for generator 28. -/
theorem rs_R009_ueqv_R009YYYNN_partial_28_0208_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_28_0208
        rs_R009_ueqv_R009YYYNN_generator_28_0200_0216 =
      rs_R009_ueqv_R009YYYNN_partial_28_0208 := by
  native_decide

/-- Coefficient term 209 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YYYNN_coefficient_28_0209 : Poly :=
[
  term ((-17753203 : Rat) / 42675962) [(13, 2), (16, 1)]
]

/-- Partial product 209 for generator 28. -/
def rs_R009_ueqv_R009YYYNN_partial_28_0209 : Poly :=
[
  term ((17753203 : Rat) / 21337981) [(0, 1), (13, 2), (14, 1), (16, 1)],
  term ((-17753203 : Rat) / 42675962) [(0, 2), (13, 2), (16, 1)],
  term ((17753203 : Rat) / 21337981) [(1, 1), (13, 2), (15, 1), (16, 1)],
  term ((-17753203 : Rat) / 42675962) [(1, 2), (13, 2), (16, 1)],
  term ((-17753203 : Rat) / 21337981) [(13, 2), (14, 1), (16, 1)],
  term ((17753203 : Rat) / 42675962) [(13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 209 for generator 28. -/
theorem rs_R009_ueqv_R009YYYNN_partial_28_0209_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_28_0209
        rs_R009_ueqv_R009YYYNN_generator_28_0200_0216 =
      rs_R009_ueqv_R009YYYNN_partial_28_0209 := by
  native_decide

/-- Coefficient term 210 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YYYNN_coefficient_28_0210 : Poly :=
[
  term ((-1831774047 : Rat) / 85351924) [(14, 1)]
]

/-- Partial product 210 for generator 28. -/
def rs_R009_ueqv_R009YYYNN_partial_28_0210 : Poly :=
[
  term ((1831774047 : Rat) / 42675962) [(0, 1), (14, 2)],
  term ((-1831774047 : Rat) / 85351924) [(0, 2), (14, 1)],
  term ((1831774047 : Rat) / 42675962) [(1, 1), (14, 1), (15, 1)],
  term ((-1831774047 : Rat) / 85351924) [(1, 2), (14, 1)],
  term ((1831774047 : Rat) / 85351924) [(14, 1)],
  term ((-1831774047 : Rat) / 42675962) [(14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 210 for generator 28. -/
theorem rs_R009_ueqv_R009YYYNN_partial_28_0210_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_28_0210
        rs_R009_ueqv_R009YYYNN_generator_28_0200_0216 =
      rs_R009_ueqv_R009YYYNN_partial_28_0210 := by
  native_decide

/-- Coefficient term 211 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YYYNN_coefficient_28_0211 : Poly :=
[
  term ((168984801 : Rat) / 21337981) [(14, 1), (15, 2)]
]

/-- Partial product 211 for generator 28. -/
def rs_R009_ueqv_R009YYYNN_partial_28_0211 : Poly :=
[
  term ((-337969602 : Rat) / 21337981) [(0, 1), (14, 2), (15, 2)],
  term ((168984801 : Rat) / 21337981) [(0, 2), (14, 1), (15, 2)],
  term ((-337969602 : Rat) / 21337981) [(1, 1), (14, 1), (15, 3)],
  term ((168984801 : Rat) / 21337981) [(1, 2), (14, 1), (15, 2)],
  term ((-168984801 : Rat) / 21337981) [(14, 1), (15, 2)],
  term ((337969602 : Rat) / 21337981) [(14, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 211 for generator 28. -/
theorem rs_R009_ueqv_R009YYYNN_partial_28_0211_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_28_0211
        rs_R009_ueqv_R009YYYNN_generator_28_0200_0216 =
      rs_R009_ueqv_R009YYYNN_partial_28_0211 := by
  native_decide

/-- Coefficient term 212 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YYYNN_coefficient_28_0212 : Poly :=
[
  term ((624141909 : Rat) / 85351924) [(14, 2)]
]

/-- Partial product 212 for generator 28. -/
def rs_R009_ueqv_R009YYYNN_partial_28_0212 : Poly :=
[
  term ((-624141909 : Rat) / 42675962) [(0, 1), (14, 3)],
  term ((624141909 : Rat) / 85351924) [(0, 2), (14, 2)],
  term ((-624141909 : Rat) / 42675962) [(1, 1), (14, 2), (15, 1)],
  term ((624141909 : Rat) / 85351924) [(1, 2), (14, 2)],
  term ((-624141909 : Rat) / 85351924) [(14, 2)],
  term ((624141909 : Rat) / 42675962) [(14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 212 for generator 28. -/
theorem rs_R009_ueqv_R009YYYNN_partial_28_0212_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_28_0212
        rs_R009_ueqv_R009YYYNN_generator_28_0200_0216 =
      rs_R009_ueqv_R009YYYNN_partial_28_0212 := by
  native_decide

/-- Coefficient term 213 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YYYNN_coefficient_28_0213 : Poly :=
[
  term ((336111480 : Rat) / 21337981) [(14, 2), (15, 2)]
]

/-- Partial product 213 for generator 28. -/
def rs_R009_ueqv_R009YYYNN_partial_28_0213 : Poly :=
[
  term ((-672222960 : Rat) / 21337981) [(0, 1), (14, 3), (15, 2)],
  term ((336111480 : Rat) / 21337981) [(0, 2), (14, 2), (15, 2)],
  term ((-672222960 : Rat) / 21337981) [(1, 1), (14, 2), (15, 3)],
  term ((336111480 : Rat) / 21337981) [(1, 2), (14, 2), (15, 2)],
  term ((-336111480 : Rat) / 21337981) [(14, 2), (15, 2)],
  term ((672222960 : Rat) / 21337981) [(14, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 213 for generator 28. -/
theorem rs_R009_ueqv_R009YYYNN_partial_28_0213_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_28_0213
        rs_R009_ueqv_R009YYYNN_generator_28_0200_0216 =
      rs_R009_ueqv_R009YYYNN_partial_28_0213 := by
  native_decide

/-- Coefficient term 214 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YYYNN_coefficient_28_0214 : Poly :=
[
  term ((209624895 : Rat) / 21337981) [(14, 3)]
]

/-- Partial product 214 for generator 28. -/
def rs_R009_ueqv_R009YYYNN_partial_28_0214 : Poly :=
[
  term ((-419249790 : Rat) / 21337981) [(0, 1), (14, 4)],
  term ((209624895 : Rat) / 21337981) [(0, 2), (14, 3)],
  term ((-419249790 : Rat) / 21337981) [(1, 1), (14, 3), (15, 1)],
  term ((209624895 : Rat) / 21337981) [(1, 2), (14, 3)],
  term ((-209624895 : Rat) / 21337981) [(14, 3)],
  term ((419249790 : Rat) / 21337981) [(14, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 214 for generator 28. -/
theorem rs_R009_ueqv_R009YYYNN_partial_28_0214_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_28_0214
        rs_R009_ueqv_R009YYYNN_generator_28_0200_0216 =
      rs_R009_ueqv_R009YYYNN_partial_28_0214 := by
  native_decide

/-- Coefficient term 215 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YYYNN_coefficient_28_0215 : Poly :=
[
  term ((-2429129709 : Rat) / 85351924) [(15, 2)]
]

/-- Partial product 215 for generator 28. -/
def rs_R009_ueqv_R009YYYNN_partial_28_0215 : Poly :=
[
  term ((2429129709 : Rat) / 42675962) [(0, 1), (14, 1), (15, 2)],
  term ((-2429129709 : Rat) / 85351924) [(0, 2), (15, 2)],
  term ((2429129709 : Rat) / 42675962) [(1, 1), (15, 3)],
  term ((-2429129709 : Rat) / 85351924) [(1, 2), (15, 2)],
  term ((-2429129709 : Rat) / 42675962) [(14, 1), (15, 2)],
  term ((2429129709 : Rat) / 85351924) [(15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 215 for generator 28. -/
theorem rs_R009_ueqv_R009YYYNN_partial_28_0215_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_28_0215
        rs_R009_ueqv_R009YYYNN_generator_28_0200_0216 =
      rs_R009_ueqv_R009YYYNN_partial_28_0215 := by
  native_decide

/-- Coefficient term 216 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009YYYNN_coefficient_28_0216 : Poly :=
[
  term ((336111480 : Rat) / 21337981) [(15, 4)]
]

/-- Partial product 216 for generator 28. -/
def rs_R009_ueqv_R009YYYNN_partial_28_0216 : Poly :=
[
  term ((-672222960 : Rat) / 21337981) [(0, 1), (14, 1), (15, 4)],
  term ((336111480 : Rat) / 21337981) [(0, 2), (15, 4)],
  term ((-672222960 : Rat) / 21337981) [(1, 1), (15, 5)],
  term ((336111480 : Rat) / 21337981) [(1, 2), (15, 4)],
  term ((672222960 : Rat) / 21337981) [(14, 1), (15, 4)],
  term ((-336111480 : Rat) / 21337981) [(15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 216 for generator 28. -/
theorem rs_R009_ueqv_R009YYYNN_partial_28_0216_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_28_0216
        rs_R009_ueqv_R009YYYNN_generator_28_0200_0216 =
      rs_R009_ueqv_R009YYYNN_partial_28_0216 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009YYYNN_partials_28_0200_0216 : List Poly :=
[
  rs_R009_ueqv_R009YYYNN_partial_28_0200,
  rs_R009_ueqv_R009YYYNN_partial_28_0201,
  rs_R009_ueqv_R009YYYNN_partial_28_0202,
  rs_R009_ueqv_R009YYYNN_partial_28_0203,
  rs_R009_ueqv_R009YYYNN_partial_28_0204,
  rs_R009_ueqv_R009YYYNN_partial_28_0205,
  rs_R009_ueqv_R009YYYNN_partial_28_0206,
  rs_R009_ueqv_R009YYYNN_partial_28_0207,
  rs_R009_ueqv_R009YYYNN_partial_28_0208,
  rs_R009_ueqv_R009YYYNN_partial_28_0209,
  rs_R009_ueqv_R009YYYNN_partial_28_0210,
  rs_R009_ueqv_R009YYYNN_partial_28_0211,
  rs_R009_ueqv_R009YYYNN_partial_28_0212,
  rs_R009_ueqv_R009YYYNN_partial_28_0213,
  rs_R009_ueqv_R009YYYNN_partial_28_0214,
  rs_R009_ueqv_R009YYYNN_partial_28_0215,
  rs_R009_ueqv_R009YYYNN_partial_28_0216
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009YYYNN_block_28_0200_0216 : Poly :=
[
  term ((17753203 : Rat) / 42675962) [(0, 1), (12, 1), (14, 1)],
  term ((-12849597 : Rat) / 21337981) [(0, 1), (12, 1), (14, 1), (15, 2)],
  term ((-619652556 : Rat) / 21337981) [(0, 1), (12, 1), (14, 2), (15, 2)],
  term ((2777614977 : Rat) / 42675962) [(0, 1), (13, 1), (14, 1), (15, 1)],
  term ((-142964775 : Rat) / 21337981) [(0, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-785084688 : Rat) / 3048283) [(0, 1), (13, 1), (14, 1), (15, 3)],
  term ((-14818329 : Rat) / 21337981) [(0, 1), (13, 1), (14, 2), (15, 1)],
  term ((772740090 : Rat) / 21337981) [(0, 1), (13, 1), (14, 3), (15, 1)],
  term ((-35506406 : Rat) / 21337981) [(0, 1), (13, 2), (14, 1)],
  term ((17753203 : Rat) / 21337981) [(0, 1), (13, 2), (14, 1), (16, 1)],
  term ((2429129709 : Rat) / 42675962) [(0, 1), (14, 1), (15, 2)],
  term ((-672222960 : Rat) / 21337981) [(0, 1), (14, 1), (15, 4)],
  term ((1831774047 : Rat) / 42675962) [(0, 1), (14, 2)],
  term ((-337969602 : Rat) / 21337981) [(0, 1), (14, 2), (15, 2)],
  term ((-624141909 : Rat) / 42675962) [(0, 1), (14, 3)],
  term ((-672222960 : Rat) / 21337981) [(0, 1), (14, 3), (15, 2)],
  term ((-419249790 : Rat) / 21337981) [(0, 1), (14, 4)],
  term ((-17753203 : Rat) / 85351924) [(0, 2), (12, 1)],
  term ((309826278 : Rat) / 21337981) [(0, 2), (12, 1), (14, 1), (15, 2)],
  term ((12849597 : Rat) / 42675962) [(0, 2), (12, 1), (15, 2)],
  term ((14818329 : Rat) / 42675962) [(0, 2), (13, 1), (14, 1), (15, 1)],
  term ((-386370045 : Rat) / 21337981) [(0, 2), (13, 1), (14, 2), (15, 1)],
  term ((-2777614977 : Rat) / 85351924) [(0, 2), (13, 1), (15, 1)],
  term ((142964775 : Rat) / 42675962) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((392542344 : Rat) / 3048283) [(0, 2), (13, 1), (15, 3)],
  term ((17753203 : Rat) / 21337981) [(0, 2), (13, 2)],
  term ((-17753203 : Rat) / 42675962) [(0, 2), (13, 2), (16, 1)],
  term ((-1831774047 : Rat) / 85351924) [(0, 2), (14, 1)],
  term ((168984801 : Rat) / 21337981) [(0, 2), (14, 1), (15, 2)],
  term ((624141909 : Rat) / 85351924) [(0, 2), (14, 2)],
  term ((336111480 : Rat) / 21337981) [(0, 2), (14, 2), (15, 2)],
  term ((209624895 : Rat) / 21337981) [(0, 2), (14, 3)],
  term ((-2429129709 : Rat) / 85351924) [(0, 2), (15, 2)],
  term ((336111480 : Rat) / 21337981) [(0, 2), (15, 4)],
  term ((-619652556 : Rat) / 21337981) [(1, 1), (12, 1), (14, 1), (15, 3)],
  term ((17753203 : Rat) / 42675962) [(1, 1), (12, 1), (15, 1)],
  term ((-12849597 : Rat) / 21337981) [(1, 1), (12, 1), (15, 3)],
  term ((-14818329 : Rat) / 21337981) [(1, 1), (13, 1), (14, 1), (15, 2)],
  term ((772740090 : Rat) / 21337981) [(1, 1), (13, 1), (14, 2), (15, 2)],
  term ((2777614977 : Rat) / 42675962) [(1, 1), (13, 1), (15, 2)],
  term ((-142964775 : Rat) / 21337981) [(1, 1), (13, 1), (15, 2), (16, 1)],
  term ((-785084688 : Rat) / 3048283) [(1, 1), (13, 1), (15, 4)],
  term ((-35506406 : Rat) / 21337981) [(1, 1), (13, 2), (15, 1)],
  term ((17753203 : Rat) / 21337981) [(1, 1), (13, 2), (15, 1), (16, 1)],
  term ((1831774047 : Rat) / 42675962) [(1, 1), (14, 1), (15, 1)],
  term ((-337969602 : Rat) / 21337981) [(1, 1), (14, 1), (15, 3)],
  term ((-624141909 : Rat) / 42675962) [(1, 1), (14, 2), (15, 1)],
  term ((-672222960 : Rat) / 21337981) [(1, 1), (14, 2), (15, 3)],
  term ((-419249790 : Rat) / 21337981) [(1, 1), (14, 3), (15, 1)],
  term ((2429129709 : Rat) / 42675962) [(1, 1), (15, 3)],
  term ((-672222960 : Rat) / 21337981) [(1, 1), (15, 5)],
  term ((-17753203 : Rat) / 85351924) [(1, 2), (12, 1)],
  term ((309826278 : Rat) / 21337981) [(1, 2), (12, 1), (14, 1), (15, 2)],
  term ((12849597 : Rat) / 42675962) [(1, 2), (12, 1), (15, 2)],
  term ((14818329 : Rat) / 42675962) [(1, 2), (13, 1), (14, 1), (15, 1)],
  term ((-386370045 : Rat) / 21337981) [(1, 2), (13, 1), (14, 2), (15, 1)],
  term ((-2777614977 : Rat) / 85351924) [(1, 2), (13, 1), (15, 1)],
  term ((142964775 : Rat) / 42675962) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((392542344 : Rat) / 3048283) [(1, 2), (13, 1), (15, 3)],
  term ((17753203 : Rat) / 21337981) [(1, 2), (13, 2)],
  term ((-17753203 : Rat) / 42675962) [(1, 2), (13, 2), (16, 1)],
  term ((-1831774047 : Rat) / 85351924) [(1, 2), (14, 1)],
  term ((168984801 : Rat) / 21337981) [(1, 2), (14, 1), (15, 2)],
  term ((624141909 : Rat) / 85351924) [(1, 2), (14, 2)],
  term ((336111480 : Rat) / 21337981) [(1, 2), (14, 2), (15, 2)],
  term ((209624895 : Rat) / 21337981) [(1, 2), (14, 3)],
  term ((-2429129709 : Rat) / 85351924) [(1, 2), (15, 2)],
  term ((336111480 : Rat) / 21337981) [(1, 2), (15, 4)],
  term ((17753203 : Rat) / 85351924) [(12, 1)],
  term ((-17753203 : Rat) / 42675962) [(12, 1), (14, 1)],
  term ((-296976681 : Rat) / 21337981) [(12, 1), (14, 1), (15, 2)],
  term ((619652556 : Rat) / 21337981) [(12, 1), (14, 2), (15, 2)],
  term ((-12849597 : Rat) / 42675962) [(12, 1), (15, 2)],
  term ((-1396216653 : Rat) / 21337981) [(13, 1), (14, 1), (15, 1)],
  term ((142964775 : Rat) / 21337981) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term ((785084688 : Rat) / 3048283) [(13, 1), (14, 1), (15, 3)],
  term ((401188374 : Rat) / 21337981) [(13, 1), (14, 2), (15, 1)],
  term ((-772740090 : Rat) / 21337981) [(13, 1), (14, 3), (15, 1)],
  term ((2777614977 : Rat) / 85351924) [(13, 1), (15, 1)],
  term ((-142964775 : Rat) / 42675962) [(13, 1), (15, 1), (16, 1)],
  term ((-392542344 : Rat) / 3048283) [(13, 1), (15, 3)],
  term ((-17753203 : Rat) / 21337981) [(13, 2)],
  term ((35506406 : Rat) / 21337981) [(13, 2), (14, 1)],
  term ((-17753203 : Rat) / 21337981) [(13, 2), (14, 1), (16, 1)],
  term ((17753203 : Rat) / 42675962) [(13, 2), (16, 1)],
  term ((1831774047 : Rat) / 85351924) [(14, 1)],
  term ((-2767099311 : Rat) / 42675962) [(14, 1), (15, 2)],
  term ((672222960 : Rat) / 21337981) [(14, 1), (15, 4)],
  term ((-4287690003 : Rat) / 85351924) [(14, 2)],
  term ((265446 : Rat) / 3048283) [(14, 2), (15, 2)],
  term ((204892119 : Rat) / 42675962) [(14, 3)],
  term ((672222960 : Rat) / 21337981) [(14, 3), (15, 2)],
  term ((419249790 : Rat) / 21337981) [(14, 4)],
  term ((2429129709 : Rat) / 85351924) [(15, 2)],
  term ((-336111480 : Rat) / 21337981) [(15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 28, terms 200 through 216. -/
theorem rs_R009_ueqv_R009YYYNN_block_28_0200_0216_valid :
    checkProductSumEq rs_R009_ueqv_R009YYYNN_partials_28_0200_0216
      rs_R009_ueqv_R009YYYNN_block_28_0200_0216 = true := by
  native_decide

end R009UeqvR009YYYNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
