/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009YYYNN, term block 5:200-216

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009YYYNNTermShards

/-- Generator polynomial 5 for relaxed split surplus certificate `R009:u=v:R009YYYNN`. -/
def rs_R009_ueqv_R009YYYNN_generator_05_0200_0216 : Poly :=
[
  term (-2 : Rat) [(4, 1)],
  term (1 : Rat) [(4, 2)],
  term (1 : Rat) [(5, 2)],
  term (2 : Rat) [(14, 1)],
  term (-1 : Rat) [(14, 2)],
  term (-1 : Rat) [(15, 2)]
]

/-- Coefficient term 200 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YYYNN_coefficient_05_0200 : Poly :=
[
  term ((17753203 : Rat) / 85351924) [(12, 1)]
]

/-- Partial product 200 for generator 5. -/
def rs_R009_ueqv_R009YYYNN_partial_05_0200 : Poly :=
[
  term ((-17753203 : Rat) / 42675962) [(4, 1), (12, 1)],
  term ((17753203 : Rat) / 85351924) [(4, 2), (12, 1)],
  term ((17753203 : Rat) / 85351924) [(5, 2), (12, 1)],
  term ((17753203 : Rat) / 42675962) [(12, 1), (14, 1)],
  term ((-17753203 : Rat) / 85351924) [(12, 1), (14, 2)],
  term ((-17753203 : Rat) / 85351924) [(12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 200 for generator 5. -/
theorem rs_R009_ueqv_R009YYYNN_partial_05_0200_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_05_0200
        rs_R009_ueqv_R009YYYNN_generator_05_0200_0216 =
      rs_R009_ueqv_R009YYYNN_partial_05_0200 := by
  native_decide

/-- Coefficient term 201 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YYYNN_coefficient_05_0201 : Poly :=
[
  term ((-309826278 : Rat) / 21337981) [(12, 1), (14, 1), (15, 2)]
]

/-- Partial product 201 for generator 5. -/
def rs_R009_ueqv_R009YYYNN_partial_05_0201 : Poly :=
[
  term ((619652556 : Rat) / 21337981) [(4, 1), (12, 1), (14, 1), (15, 2)],
  term ((-309826278 : Rat) / 21337981) [(4, 2), (12, 1), (14, 1), (15, 2)],
  term ((-309826278 : Rat) / 21337981) [(5, 2), (12, 1), (14, 1), (15, 2)],
  term ((309826278 : Rat) / 21337981) [(12, 1), (14, 1), (15, 4)],
  term ((-619652556 : Rat) / 21337981) [(12, 1), (14, 2), (15, 2)],
  term ((309826278 : Rat) / 21337981) [(12, 1), (14, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 201 for generator 5. -/
theorem rs_R009_ueqv_R009YYYNN_partial_05_0201_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_05_0201
        rs_R009_ueqv_R009YYYNN_generator_05_0200_0216 =
      rs_R009_ueqv_R009YYYNN_partial_05_0201 := by
  native_decide

/-- Coefficient term 202 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YYYNN_coefficient_05_0202 : Poly :=
[
  term ((-12849597 : Rat) / 42675962) [(12, 1), (15, 2)]
]

/-- Partial product 202 for generator 5. -/
def rs_R009_ueqv_R009YYYNN_partial_05_0202 : Poly :=
[
  term ((12849597 : Rat) / 21337981) [(4, 1), (12, 1), (15, 2)],
  term ((-12849597 : Rat) / 42675962) [(4, 2), (12, 1), (15, 2)],
  term ((-12849597 : Rat) / 42675962) [(5, 2), (12, 1), (15, 2)],
  term ((-12849597 : Rat) / 21337981) [(12, 1), (14, 1), (15, 2)],
  term ((12849597 : Rat) / 42675962) [(12, 1), (14, 2), (15, 2)],
  term ((12849597 : Rat) / 42675962) [(12, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 202 for generator 5. -/
theorem rs_R009_ueqv_R009YYYNN_partial_05_0202_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_05_0202
        rs_R009_ueqv_R009YYYNN_generator_05_0200_0216 =
      rs_R009_ueqv_R009YYYNN_partial_05_0202 := by
  native_decide

/-- Coefficient term 203 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YYYNN_coefficient_05_0203 : Poly :=
[
  term ((-481383351 : Rat) / 42675962) [(13, 1), (14, 1), (15, 1)]
]

/-- Partial product 203 for generator 5. -/
def rs_R009_ueqv_R009YYYNN_partial_05_0203 : Poly :=
[
  term ((481383351 : Rat) / 21337981) [(4, 1), (13, 1), (14, 1), (15, 1)],
  term ((-481383351 : Rat) / 42675962) [(4, 2), (13, 1), (14, 1), (15, 1)],
  term ((-481383351 : Rat) / 42675962) [(5, 2), (13, 1), (14, 1), (15, 1)],
  term ((481383351 : Rat) / 42675962) [(13, 1), (14, 1), (15, 3)],
  term ((-481383351 : Rat) / 21337981) [(13, 1), (14, 2), (15, 1)],
  term ((481383351 : Rat) / 42675962) [(13, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 203 for generator 5. -/
theorem rs_R009_ueqv_R009YYYNN_partial_05_0203_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_05_0203
        rs_R009_ueqv_R009YYYNN_generator_05_0200_0216 =
      rs_R009_ueqv_R009YYYNN_partial_05_0203 := by
  native_decide

/-- Coefficient term 204 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YYYNN_coefficient_05_0204 : Poly :=
[
  term ((386370045 : Rat) / 21337981) [(13, 1), (14, 2), (15, 1)]
]

/-- Partial product 204 for generator 5. -/
def rs_R009_ueqv_R009YYYNN_partial_05_0204 : Poly :=
[
  term ((-772740090 : Rat) / 21337981) [(4, 1), (13, 1), (14, 2), (15, 1)],
  term ((386370045 : Rat) / 21337981) [(4, 2), (13, 1), (14, 2), (15, 1)],
  term ((386370045 : Rat) / 21337981) [(5, 2), (13, 1), (14, 2), (15, 1)],
  term ((-386370045 : Rat) / 21337981) [(13, 1), (14, 2), (15, 3)],
  term ((772740090 : Rat) / 21337981) [(13, 1), (14, 3), (15, 1)],
  term ((-386370045 : Rat) / 21337981) [(13, 1), (14, 4), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 204 for generator 5. -/
theorem rs_R009_ueqv_R009YYYNN_partial_05_0204_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_05_0204
        rs_R009_ueqv_R009YYYNN_generator_05_0200_0216 =
      rs_R009_ueqv_R009YYYNN_partial_05_0204 := by
  native_decide

/-- Coefficient term 205 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YYYNN_coefficient_05_0205 : Poly :=
[
  term ((1203771225 : Rat) / 85351924) [(13, 1), (15, 1)]
]

/-- Partial product 205 for generator 5. -/
def rs_R009_ueqv_R009YYYNN_partial_05_0205 : Poly :=
[
  term ((-1203771225 : Rat) / 42675962) [(4, 1), (13, 1), (15, 1)],
  term ((1203771225 : Rat) / 85351924) [(4, 2), (13, 1), (15, 1)],
  term ((1203771225 : Rat) / 85351924) [(5, 2), (13, 1), (15, 1)],
  term ((1203771225 : Rat) / 42675962) [(13, 1), (14, 1), (15, 1)],
  term ((-1203771225 : Rat) / 85351924) [(13, 1), (14, 2), (15, 1)],
  term ((-1203771225 : Rat) / 85351924) [(13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 205 for generator 5. -/
theorem rs_R009_ueqv_R009YYYNN_partial_05_0205_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_05_0205
        rs_R009_ueqv_R009YYYNN_generator_05_0200_0216 =
      rs_R009_ueqv_R009YYYNN_partial_05_0205 := by
  native_decide

/-- Coefficient term 206 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YYYNN_coefficient_05_0206 : Poly :=
[
  term ((-142964775 : Rat) / 42675962) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 206 for generator 5. -/
def rs_R009_ueqv_R009YYYNN_partial_05_0206 : Poly :=
[
  term ((142964775 : Rat) / 21337981) [(4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-142964775 : Rat) / 42675962) [(4, 2), (13, 1), (15, 1), (16, 1)],
  term ((-142964775 : Rat) / 42675962) [(5, 2), (13, 1), (15, 1), (16, 1)],
  term ((-142964775 : Rat) / 21337981) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term ((142964775 : Rat) / 42675962) [(13, 1), (14, 2), (15, 1), (16, 1)],
  term ((142964775 : Rat) / 42675962) [(13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 206 for generator 5. -/
theorem rs_R009_ueqv_R009YYYNN_partial_05_0206_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_05_0206
        rs_R009_ueqv_R009YYYNN_generator_05_0200_0216 =
      rs_R009_ueqv_R009YYYNN_partial_05_0206 := by
  native_decide

/-- Coefficient term 207 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YYYNN_coefficient_05_0207 : Poly :=
[
  term ((-392542344 : Rat) / 3048283) [(13, 1), (15, 3)]
]

/-- Partial product 207 for generator 5. -/
def rs_R009_ueqv_R009YYYNN_partial_05_0207 : Poly :=
[
  term ((785084688 : Rat) / 3048283) [(4, 1), (13, 1), (15, 3)],
  term ((-392542344 : Rat) / 3048283) [(4, 2), (13, 1), (15, 3)],
  term ((-392542344 : Rat) / 3048283) [(5, 2), (13, 1), (15, 3)],
  term ((-785084688 : Rat) / 3048283) [(13, 1), (14, 1), (15, 3)],
  term ((392542344 : Rat) / 3048283) [(13, 1), (14, 2), (15, 3)],
  term ((392542344 : Rat) / 3048283) [(13, 1), (15, 5)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 207 for generator 5. -/
theorem rs_R009_ueqv_R009YYYNN_partial_05_0207_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_05_0207
        rs_R009_ueqv_R009YYYNN_generator_05_0200_0216 =
      rs_R009_ueqv_R009YYYNN_partial_05_0207 := by
  native_decide

/-- Coefficient term 208 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YYYNN_coefficient_05_0208 : Poly :=
[
  term ((-17753203 : Rat) / 21337981) [(13, 2)]
]

/-- Partial product 208 for generator 5. -/
def rs_R009_ueqv_R009YYYNN_partial_05_0208 : Poly :=
[
  term ((35506406 : Rat) / 21337981) [(4, 1), (13, 2)],
  term ((-17753203 : Rat) / 21337981) [(4, 2), (13, 2)],
  term ((-17753203 : Rat) / 21337981) [(5, 2), (13, 2)],
  term ((-35506406 : Rat) / 21337981) [(13, 2), (14, 1)],
  term ((17753203 : Rat) / 21337981) [(13, 2), (14, 2)],
  term ((17753203 : Rat) / 21337981) [(13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 208 for generator 5. -/
theorem rs_R009_ueqv_R009YYYNN_partial_05_0208_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_05_0208
        rs_R009_ueqv_R009YYYNN_generator_05_0200_0216 =
      rs_R009_ueqv_R009YYYNN_partial_05_0208 := by
  native_decide

/-- Coefficient term 209 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YYYNN_coefficient_05_0209 : Poly :=
[
  term ((17753203 : Rat) / 42675962) [(13, 2), (16, 1)]
]

/-- Partial product 209 for generator 5. -/
def rs_R009_ueqv_R009YYYNN_partial_05_0209 : Poly :=
[
  term ((-17753203 : Rat) / 21337981) [(4, 1), (13, 2), (16, 1)],
  term ((17753203 : Rat) / 42675962) [(4, 2), (13, 2), (16, 1)],
  term ((17753203 : Rat) / 42675962) [(5, 2), (13, 2), (16, 1)],
  term ((17753203 : Rat) / 21337981) [(13, 2), (14, 1), (16, 1)],
  term ((-17753203 : Rat) / 42675962) [(13, 2), (14, 2), (16, 1)],
  term ((-17753203 : Rat) / 42675962) [(13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 209 for generator 5. -/
theorem rs_R009_ueqv_R009YYYNN_partial_05_0209_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_05_0209
        rs_R009_ueqv_R009YYYNN_generator_05_0200_0216 =
      rs_R009_ueqv_R009YYYNN_partial_05_0209 := by
  native_decide

/-- Coefficient term 210 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YYYNN_coefficient_05_0210 : Poly :=
[
  term ((538372155 : Rat) / 42675962) [(14, 1)]
]

/-- Partial product 210 for generator 5. -/
def rs_R009_ueqv_R009YYYNN_partial_05_0210 : Poly :=
[
  term ((-538372155 : Rat) / 21337981) [(4, 1), (14, 1)],
  term ((538372155 : Rat) / 42675962) [(4, 2), (14, 1)],
  term ((538372155 : Rat) / 42675962) [(5, 2), (14, 1)],
  term ((-538372155 : Rat) / 42675962) [(14, 1), (15, 2)],
  term ((538372155 : Rat) / 21337981) [(14, 2)],
  term ((-538372155 : Rat) / 42675962) [(14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 210 for generator 5. -/
theorem rs_R009_ueqv_R009YYYNN_partial_05_0210_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_05_0210
        rs_R009_ueqv_R009YYYNN_generator_05_0200_0216 =
      rs_R009_ueqv_R009YYYNN_partial_05_0210 := by
  native_decide

/-- Coefficient term 211 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YYYNN_coefficient_05_0211 : Poly :=
[
  term ((-168984801 : Rat) / 21337981) [(14, 1), (15, 2)]
]

/-- Partial product 211 for generator 5. -/
def rs_R009_ueqv_R009YYYNN_partial_05_0211 : Poly :=
[
  term ((337969602 : Rat) / 21337981) [(4, 1), (14, 1), (15, 2)],
  term ((-168984801 : Rat) / 21337981) [(4, 2), (14, 1), (15, 2)],
  term ((-168984801 : Rat) / 21337981) [(5, 2), (14, 1), (15, 2)],
  term ((168984801 : Rat) / 21337981) [(14, 1), (15, 4)],
  term ((-337969602 : Rat) / 21337981) [(14, 2), (15, 2)],
  term ((168984801 : Rat) / 21337981) [(14, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 211 for generator 5. -/
theorem rs_R009_ueqv_R009YYYNN_partial_05_0211_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_05_0211
        rs_R009_ueqv_R009YYYNN_generator_05_0200_0216 =
      rs_R009_ueqv_R009YYYNN_partial_05_0211 := by
  native_decide

/-- Coefficient term 212 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YYYNN_coefficient_05_0212 : Poly :=
[
  term ((382057587 : Rat) / 85351924) [(14, 2)]
]

/-- Partial product 212 for generator 5. -/
def rs_R009_ueqv_R009YYYNN_partial_05_0212 : Poly :=
[
  term ((-382057587 : Rat) / 42675962) [(4, 1), (14, 2)],
  term ((382057587 : Rat) / 85351924) [(4, 2), (14, 2)],
  term ((382057587 : Rat) / 85351924) [(5, 2), (14, 2)],
  term ((-382057587 : Rat) / 85351924) [(14, 2), (15, 2)],
  term ((382057587 : Rat) / 42675962) [(14, 3)],
  term ((-382057587 : Rat) / 85351924) [(14, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 212 for generator 5. -/
theorem rs_R009_ueqv_R009YYYNN_partial_05_0212_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_05_0212
        rs_R009_ueqv_R009YYYNN_generator_05_0200_0216 =
      rs_R009_ueqv_R009YYYNN_partial_05_0212 := by
  native_decide

/-- Coefficient term 213 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YYYNN_coefficient_05_0213 : Poly :=
[
  term ((-336111480 : Rat) / 21337981) [(14, 2), (15, 2)]
]

/-- Partial product 213 for generator 5. -/
def rs_R009_ueqv_R009YYYNN_partial_05_0213 : Poly :=
[
  term ((672222960 : Rat) / 21337981) [(4, 1), (14, 2), (15, 2)],
  term ((-336111480 : Rat) / 21337981) [(4, 2), (14, 2), (15, 2)],
  term ((-336111480 : Rat) / 21337981) [(5, 2), (14, 2), (15, 2)],
  term ((336111480 : Rat) / 21337981) [(14, 2), (15, 4)],
  term ((-672222960 : Rat) / 21337981) [(14, 3), (15, 2)],
  term ((336111480 : Rat) / 21337981) [(14, 4), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 213 for generator 5. -/
theorem rs_R009_ueqv_R009YYYNN_partial_05_0213_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_05_0213
        rs_R009_ueqv_R009YYYNN_generator_05_0200_0216 =
      rs_R009_ueqv_R009YYYNN_partial_05_0213 := by
  native_decide

/-- Coefficient term 214 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YYYNN_coefficient_05_0214 : Poly :=
[
  term ((-209624895 : Rat) / 21337981) [(14, 3)]
]

/-- Partial product 214 for generator 5. -/
def rs_R009_ueqv_R009YYYNN_partial_05_0214 : Poly :=
[
  term ((419249790 : Rat) / 21337981) [(4, 1), (14, 3)],
  term ((-209624895 : Rat) / 21337981) [(4, 2), (14, 3)],
  term ((-209624895 : Rat) / 21337981) [(5, 2), (14, 3)],
  term ((209624895 : Rat) / 21337981) [(14, 3), (15, 2)],
  term ((-419249790 : Rat) / 21337981) [(14, 4)],
  term ((209624895 : Rat) / 21337981) [(14, 5)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 214 for generator 5. -/
theorem rs_R009_ueqv_R009YYYNN_partial_05_0214_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_05_0214
        rs_R009_ueqv_R009YYYNN_generator_05_0200_0216 =
      rs_R009_ueqv_R009YYYNN_partial_05_0214 := by
  native_decide

/-- Coefficient term 215 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YYYNN_coefficient_05_0215 : Poly :=
[
  term ((1022312691 : Rat) / 85351924) [(15, 2)]
]

/-- Partial product 215 for generator 5. -/
def rs_R009_ueqv_R009YYYNN_partial_05_0215 : Poly :=
[
  term ((-1022312691 : Rat) / 42675962) [(4, 1), (15, 2)],
  term ((1022312691 : Rat) / 85351924) [(4, 2), (15, 2)],
  term ((1022312691 : Rat) / 85351924) [(5, 2), (15, 2)],
  term ((1022312691 : Rat) / 42675962) [(14, 1), (15, 2)],
  term ((-1022312691 : Rat) / 85351924) [(14, 2), (15, 2)],
  term ((-1022312691 : Rat) / 85351924) [(15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 215 for generator 5. -/
theorem rs_R009_ueqv_R009YYYNN_partial_05_0215_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_05_0215
        rs_R009_ueqv_R009YYYNN_generator_05_0200_0216 =
      rs_R009_ueqv_R009YYYNN_partial_05_0215 := by
  native_decide

/-- Coefficient term 216 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009YYYNN_coefficient_05_0216 : Poly :=
[
  term ((-336111480 : Rat) / 21337981) [(15, 4)]
]

/-- Partial product 216 for generator 5. -/
def rs_R009_ueqv_R009YYYNN_partial_05_0216 : Poly :=
[
  term ((672222960 : Rat) / 21337981) [(4, 1), (15, 4)],
  term ((-336111480 : Rat) / 21337981) [(4, 2), (15, 4)],
  term ((-336111480 : Rat) / 21337981) [(5, 2), (15, 4)],
  term ((-672222960 : Rat) / 21337981) [(14, 1), (15, 4)],
  term ((336111480 : Rat) / 21337981) [(14, 2), (15, 4)],
  term ((336111480 : Rat) / 21337981) [(15, 6)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 216 for generator 5. -/
theorem rs_R009_ueqv_R009YYYNN_partial_05_0216_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_05_0216
        rs_R009_ueqv_R009YYYNN_generator_05_0200_0216 =
      rs_R009_ueqv_R009YYYNN_partial_05_0216 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009YYYNN_partials_05_0200_0216 : List Poly :=
[
  rs_R009_ueqv_R009YYYNN_partial_05_0200,
  rs_R009_ueqv_R009YYYNN_partial_05_0201,
  rs_R009_ueqv_R009YYYNN_partial_05_0202,
  rs_R009_ueqv_R009YYYNN_partial_05_0203,
  rs_R009_ueqv_R009YYYNN_partial_05_0204,
  rs_R009_ueqv_R009YYYNN_partial_05_0205,
  rs_R009_ueqv_R009YYYNN_partial_05_0206,
  rs_R009_ueqv_R009YYYNN_partial_05_0207,
  rs_R009_ueqv_R009YYYNN_partial_05_0208,
  rs_R009_ueqv_R009YYYNN_partial_05_0209,
  rs_R009_ueqv_R009YYYNN_partial_05_0210,
  rs_R009_ueqv_R009YYYNN_partial_05_0211,
  rs_R009_ueqv_R009YYYNN_partial_05_0212,
  rs_R009_ueqv_R009YYYNN_partial_05_0213,
  rs_R009_ueqv_R009YYYNN_partial_05_0214,
  rs_R009_ueqv_R009YYYNN_partial_05_0215,
  rs_R009_ueqv_R009YYYNN_partial_05_0216
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009YYYNN_block_05_0200_0216 : Poly :=
[
  term ((-17753203 : Rat) / 42675962) [(4, 1), (12, 1)],
  term ((619652556 : Rat) / 21337981) [(4, 1), (12, 1), (14, 1), (15, 2)],
  term ((12849597 : Rat) / 21337981) [(4, 1), (12, 1), (15, 2)],
  term ((481383351 : Rat) / 21337981) [(4, 1), (13, 1), (14, 1), (15, 1)],
  term ((-772740090 : Rat) / 21337981) [(4, 1), (13, 1), (14, 2), (15, 1)],
  term ((-1203771225 : Rat) / 42675962) [(4, 1), (13, 1), (15, 1)],
  term ((142964775 : Rat) / 21337981) [(4, 1), (13, 1), (15, 1), (16, 1)],
  term ((785084688 : Rat) / 3048283) [(4, 1), (13, 1), (15, 3)],
  term ((35506406 : Rat) / 21337981) [(4, 1), (13, 2)],
  term ((-17753203 : Rat) / 21337981) [(4, 1), (13, 2), (16, 1)],
  term ((-538372155 : Rat) / 21337981) [(4, 1), (14, 1)],
  term ((337969602 : Rat) / 21337981) [(4, 1), (14, 1), (15, 2)],
  term ((-382057587 : Rat) / 42675962) [(4, 1), (14, 2)],
  term ((672222960 : Rat) / 21337981) [(4, 1), (14, 2), (15, 2)],
  term ((419249790 : Rat) / 21337981) [(4, 1), (14, 3)],
  term ((-1022312691 : Rat) / 42675962) [(4, 1), (15, 2)],
  term ((672222960 : Rat) / 21337981) [(4, 1), (15, 4)],
  term ((17753203 : Rat) / 85351924) [(4, 2), (12, 1)],
  term ((-309826278 : Rat) / 21337981) [(4, 2), (12, 1), (14, 1), (15, 2)],
  term ((-12849597 : Rat) / 42675962) [(4, 2), (12, 1), (15, 2)],
  term ((-481383351 : Rat) / 42675962) [(4, 2), (13, 1), (14, 1), (15, 1)],
  term ((386370045 : Rat) / 21337981) [(4, 2), (13, 1), (14, 2), (15, 1)],
  term ((1203771225 : Rat) / 85351924) [(4, 2), (13, 1), (15, 1)],
  term ((-142964775 : Rat) / 42675962) [(4, 2), (13, 1), (15, 1), (16, 1)],
  term ((-392542344 : Rat) / 3048283) [(4, 2), (13, 1), (15, 3)],
  term ((-17753203 : Rat) / 21337981) [(4, 2), (13, 2)],
  term ((17753203 : Rat) / 42675962) [(4, 2), (13, 2), (16, 1)],
  term ((538372155 : Rat) / 42675962) [(4, 2), (14, 1)],
  term ((-168984801 : Rat) / 21337981) [(4, 2), (14, 1), (15, 2)],
  term ((382057587 : Rat) / 85351924) [(4, 2), (14, 2)],
  term ((-336111480 : Rat) / 21337981) [(4, 2), (14, 2), (15, 2)],
  term ((-209624895 : Rat) / 21337981) [(4, 2), (14, 3)],
  term ((1022312691 : Rat) / 85351924) [(4, 2), (15, 2)],
  term ((-336111480 : Rat) / 21337981) [(4, 2), (15, 4)],
  term ((17753203 : Rat) / 85351924) [(5, 2), (12, 1)],
  term ((-309826278 : Rat) / 21337981) [(5, 2), (12, 1), (14, 1), (15, 2)],
  term ((-12849597 : Rat) / 42675962) [(5, 2), (12, 1), (15, 2)],
  term ((-481383351 : Rat) / 42675962) [(5, 2), (13, 1), (14, 1), (15, 1)],
  term ((386370045 : Rat) / 21337981) [(5, 2), (13, 1), (14, 2), (15, 1)],
  term ((1203771225 : Rat) / 85351924) [(5, 2), (13, 1), (15, 1)],
  term ((-142964775 : Rat) / 42675962) [(5, 2), (13, 1), (15, 1), (16, 1)],
  term ((-392542344 : Rat) / 3048283) [(5, 2), (13, 1), (15, 3)],
  term ((-17753203 : Rat) / 21337981) [(5, 2), (13, 2)],
  term ((17753203 : Rat) / 42675962) [(5, 2), (13, 2), (16, 1)],
  term ((538372155 : Rat) / 42675962) [(5, 2), (14, 1)],
  term ((-168984801 : Rat) / 21337981) [(5, 2), (14, 1), (15, 2)],
  term ((382057587 : Rat) / 85351924) [(5, 2), (14, 2)],
  term ((-336111480 : Rat) / 21337981) [(5, 2), (14, 2), (15, 2)],
  term ((-209624895 : Rat) / 21337981) [(5, 2), (14, 3)],
  term ((1022312691 : Rat) / 85351924) [(5, 2), (15, 2)],
  term ((-336111480 : Rat) / 21337981) [(5, 2), (15, 4)],
  term ((17753203 : Rat) / 42675962) [(12, 1), (14, 1)],
  term ((-12849597 : Rat) / 21337981) [(12, 1), (14, 1), (15, 2)],
  term ((309826278 : Rat) / 21337981) [(12, 1), (14, 1), (15, 4)],
  term ((-17753203 : Rat) / 85351924) [(12, 1), (14, 2)],
  term ((-1226455515 : Rat) / 42675962) [(12, 1), (14, 2), (15, 2)],
  term ((309826278 : Rat) / 21337981) [(12, 1), (14, 3), (15, 2)],
  term ((-17753203 : Rat) / 85351924) [(12, 1), (15, 2)],
  term ((12849597 : Rat) / 42675962) [(12, 1), (15, 4)],
  term ((1203771225 : Rat) / 42675962) [(13, 1), (14, 1), (15, 1)],
  term ((-142964775 : Rat) / 21337981) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-10509802281 : Rat) / 42675962) [(13, 1), (14, 1), (15, 3)],
  term ((-3129304629 : Rat) / 85351924) [(13, 1), (14, 2), (15, 1)],
  term ((142964775 : Rat) / 42675962) [(13, 1), (14, 2), (15, 1), (16, 1)],
  term ((2361426363 : Rat) / 21337981) [(13, 1), (14, 2), (15, 3)],
  term ((289551933 : Rat) / 6096566) [(13, 1), (14, 3), (15, 1)],
  term ((-386370045 : Rat) / 21337981) [(13, 1), (14, 4), (15, 1)],
  term ((-1203771225 : Rat) / 85351924) [(13, 1), (15, 3)],
  term ((142964775 : Rat) / 42675962) [(13, 1), (15, 3), (16, 1)],
  term ((392542344 : Rat) / 3048283) [(13, 1), (15, 5)],
  term ((-35506406 : Rat) / 21337981) [(13, 2), (14, 1)],
  term ((17753203 : Rat) / 21337981) [(13, 2), (14, 1), (16, 1)],
  term ((17753203 : Rat) / 21337981) [(13, 2), (14, 2)],
  term ((-17753203 : Rat) / 42675962) [(13, 2), (14, 2), (16, 1)],
  term ((17753203 : Rat) / 21337981) [(13, 2), (15, 2)],
  term ((-17753203 : Rat) / 42675962) [(13, 2), (15, 2), (16, 1)],
  term ((241970268 : Rat) / 21337981) [(14, 1), (15, 2)],
  term ((-503238159 : Rat) / 21337981) [(14, 1), (15, 4)],
  term ((538372155 : Rat) / 21337981) [(14, 2)],
  term ((-1378124343 : Rat) / 42675962) [(14, 2), (15, 2)],
  term ((672222960 : Rat) / 21337981) [(14, 2), (15, 4)],
  term ((-78157284 : Rat) / 21337981) [(14, 3)],
  term ((-41944752 : Rat) / 3048283) [(14, 3), (15, 2)],
  term ((-2059056747 : Rat) / 85351924) [(14, 4)],
  term ((336111480 : Rat) / 21337981) [(14, 4), (15, 2)],
  term ((209624895 : Rat) / 21337981) [(14, 5)],
  term ((-1022312691 : Rat) / 85351924) [(15, 4)],
  term ((336111480 : Rat) / 21337981) [(15, 6)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 5, terms 200 through 216. -/
theorem rs_R009_ueqv_R009YYYNN_block_05_0200_0216_valid :
    checkProductSumEq rs_R009_ueqv_R009YYYNN_partials_05_0200_0216
      rs_R009_ueqv_R009YYYNN_block_05_0200_0216 = true := by
  native_decide

end R009UeqvR009YYYNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
