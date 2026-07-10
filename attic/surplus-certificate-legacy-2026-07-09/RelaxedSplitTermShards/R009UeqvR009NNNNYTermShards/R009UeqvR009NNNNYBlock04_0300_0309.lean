/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NNNNY, term block 4:300-309

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NNNNYTermShards

/-- Generator polynomial 4 for relaxed split surplus certificate `R009:u=v:R009NNNNY`. -/
def rs_R009_ueqv_R009NNNNY_generator_04_0300_0309 : Poly :=
[
  term (-2 : Rat) [(4, 1)],
  term (1 : Rat) [(4, 2)],
  term (1 : Rat) [(5, 2)],
  term (2 : Rat) [(12, 1)],
  term (-1 : Rat) [(12, 2)],
  term (-1 : Rat) [(13, 2)]
]

/-- Coefficient term 300 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009NNNNY_coefficient_04_0300 : Poly :=
[
  term ((-16 : Rat) / 31) [(13, 1), (15, 3), (16, 1)]
]

/-- Partial product 300 for generator 4. -/
def rs_R009_ueqv_R009NNNNY_partial_04_0300 : Poly :=
[
  term ((32 : Rat) / 31) [(4, 1), (13, 1), (15, 3), (16, 1)],
  term ((-16 : Rat) / 31) [(4, 2), (13, 1), (15, 3), (16, 1)],
  term ((-16 : Rat) / 31) [(5, 2), (13, 1), (15, 3), (16, 1)],
  term ((-32 : Rat) / 31) [(12, 1), (13, 1), (15, 3), (16, 1)],
  term ((16 : Rat) / 31) [(12, 2), (13, 1), (15, 3), (16, 1)],
  term ((16 : Rat) / 31) [(13, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 300 for generator 4. -/
theorem rs_R009_ueqv_R009NNNNY_partial_04_0300_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_04_0300
        rs_R009_ueqv_R009NNNNY_generator_04_0300_0309 =
      rs_R009_ueqv_R009NNNNY_partial_04_0300 := by
  native_decide

/-- Coefficient term 301 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009NNNNY_coefficient_04_0301 : Poly :=
[
  term ((-100 : Rat) / 93) [(13, 2), (14, 1), (16, 1)]
]

/-- Partial product 301 for generator 4. -/
def rs_R009_ueqv_R009NNNNY_partial_04_0301 : Poly :=
[
  term ((200 : Rat) / 93) [(4, 1), (13, 2), (14, 1), (16, 1)],
  term ((-100 : Rat) / 93) [(4, 2), (13, 2), (14, 1), (16, 1)],
  term ((-100 : Rat) / 93) [(5, 2), (13, 2), (14, 1), (16, 1)],
  term ((-200 : Rat) / 93) [(12, 1), (13, 2), (14, 1), (16, 1)],
  term ((100 : Rat) / 93) [(12, 2), (13, 2), (14, 1), (16, 1)],
  term ((100 : Rat) / 93) [(13, 4), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 301 for generator 4. -/
theorem rs_R009_ueqv_R009NNNNY_partial_04_0301_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_04_0301
        rs_R009_ueqv_R009NNNNY_generator_04_0300_0309 =
      rs_R009_ueqv_R009NNNNY_partial_04_0301 := by
  native_decide

/-- Coefficient term 302 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009NNNNY_coefficient_04_0302 : Poly :=
[
  term ((-50 : Rat) / 93) [(13, 2), (16, 1)]
]

/-- Partial product 302 for generator 4. -/
def rs_R009_ueqv_R009NNNNY_partial_04_0302 : Poly :=
[
  term ((100 : Rat) / 93) [(4, 1), (13, 2), (16, 1)],
  term ((-50 : Rat) / 93) [(4, 2), (13, 2), (16, 1)],
  term ((-50 : Rat) / 93) [(5, 2), (13, 2), (16, 1)],
  term ((-100 : Rat) / 93) [(12, 1), (13, 2), (16, 1)],
  term ((50 : Rat) / 93) [(12, 2), (13, 2), (16, 1)],
  term ((50 : Rat) / 93) [(13, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 302 for generator 4. -/
theorem rs_R009_ueqv_R009NNNNY_partial_04_0302_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_04_0302
        rs_R009_ueqv_R009NNNNY_generator_04_0300_0309 =
      rs_R009_ueqv_R009NNNNY_partial_04_0302 := by
  native_decide

/-- Coefficient term 303 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009NNNNY_coefficient_04_0303 : Poly :=
[
  term ((-44 : Rat) / 93) [(14, 1), (15, 2), (16, 1)]
]

/-- Partial product 303 for generator 4. -/
def rs_R009_ueqv_R009NNNNY_partial_04_0303 : Poly :=
[
  term ((88 : Rat) / 93) [(4, 1), (14, 1), (15, 2), (16, 1)],
  term ((-44 : Rat) / 93) [(4, 2), (14, 1), (15, 2), (16, 1)],
  term ((-44 : Rat) / 93) [(5, 2), (14, 1), (15, 2), (16, 1)],
  term ((-88 : Rat) / 93) [(12, 1), (14, 1), (15, 2), (16, 1)],
  term ((44 : Rat) / 93) [(12, 2), (14, 1), (15, 2), (16, 1)],
  term ((44 : Rat) / 93) [(13, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 303 for generator 4. -/
theorem rs_R009_ueqv_R009NNNNY_partial_04_0303_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_04_0303
        rs_R009_ueqv_R009NNNNY_generator_04_0300_0309 =
      rs_R009_ueqv_R009NNNNY_partial_04_0303 := by
  native_decide

/-- Coefficient term 304 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009NNNNY_coefficient_04_0304 : Poly :=
[
  term ((197 : Rat) / 31) [(14, 1), (16, 1)]
]

/-- Partial product 304 for generator 4. -/
def rs_R009_ueqv_R009NNNNY_partial_04_0304 : Poly :=
[
  term ((-394 : Rat) / 31) [(4, 1), (14, 1), (16, 1)],
  term ((197 : Rat) / 31) [(4, 2), (14, 1), (16, 1)],
  term ((197 : Rat) / 31) [(5, 2), (14, 1), (16, 1)],
  term ((394 : Rat) / 31) [(12, 1), (14, 1), (16, 1)],
  term ((-197 : Rat) / 31) [(12, 2), (14, 1), (16, 1)],
  term ((-197 : Rat) / 31) [(13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 304 for generator 4. -/
theorem rs_R009_ueqv_R009NNNNY_partial_04_0304_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_04_0304
        rs_R009_ueqv_R009NNNNY_generator_04_0300_0309 =
      rs_R009_ueqv_R009NNNNY_partial_04_0304 := by
  native_decide

/-- Coefficient term 305 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009NNNNY_coefficient_04_0305 : Poly :=
[
  term ((8 : Rat) / 31) [(14, 2), (15, 2), (16, 1)]
]

/-- Partial product 305 for generator 4. -/
def rs_R009_ueqv_R009NNNNY_partial_04_0305 : Poly :=
[
  term ((-16 : Rat) / 31) [(4, 1), (14, 2), (15, 2), (16, 1)],
  term ((8 : Rat) / 31) [(4, 2), (14, 2), (15, 2), (16, 1)],
  term ((8 : Rat) / 31) [(5, 2), (14, 2), (15, 2), (16, 1)],
  term ((16 : Rat) / 31) [(12, 1), (14, 2), (15, 2), (16, 1)],
  term ((-8 : Rat) / 31) [(12, 2), (14, 2), (15, 2), (16, 1)],
  term ((-8 : Rat) / 31) [(13, 2), (14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 305 for generator 4. -/
theorem rs_R009_ueqv_R009NNNNY_partial_04_0305_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_04_0305
        rs_R009_ueqv_R009NNNNY_generator_04_0300_0309 =
      rs_R009_ueqv_R009NNNNY_partial_04_0305 := by
  native_decide

/-- Coefficient term 306 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009NNNNY_coefficient_04_0306 : Poly :=
[
  term ((-2149 : Rat) / 186) [(14, 2), (16, 1)]
]

/-- Partial product 306 for generator 4. -/
def rs_R009_ueqv_R009NNNNY_partial_04_0306 : Poly :=
[
  term ((2149 : Rat) / 93) [(4, 1), (14, 2), (16, 1)],
  term ((-2149 : Rat) / 186) [(4, 2), (14, 2), (16, 1)],
  term ((-2149 : Rat) / 186) [(5, 2), (14, 2), (16, 1)],
  term ((-2149 : Rat) / 93) [(12, 1), (14, 2), (16, 1)],
  term ((2149 : Rat) / 186) [(12, 2), (14, 2), (16, 1)],
  term ((2149 : Rat) / 186) [(13, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 306 for generator 4. -/
theorem rs_R009_ueqv_R009NNNNY_partial_04_0306_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_04_0306
        rs_R009_ueqv_R009NNNNY_generator_04_0300_0309 =
      rs_R009_ueqv_R009NNNNY_partial_04_0306 := by
  native_decide

/-- Coefficient term 307 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009NNNNY_coefficient_04_0307 : Poly :=
[
  term ((-47 : Rat) / 6) [(15, 2), (16, 1)]
]

/-- Partial product 307 for generator 4. -/
def rs_R009_ueqv_R009NNNNY_partial_04_0307 : Poly :=
[
  term ((47 : Rat) / 3) [(4, 1), (15, 2), (16, 1)],
  term ((-47 : Rat) / 6) [(4, 2), (15, 2), (16, 1)],
  term ((-47 : Rat) / 6) [(5, 2), (15, 2), (16, 1)],
  term ((-47 : Rat) / 3) [(12, 1), (15, 2), (16, 1)],
  term ((47 : Rat) / 6) [(12, 2), (15, 2), (16, 1)],
  term ((47 : Rat) / 6) [(13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 307 for generator 4. -/
theorem rs_R009_ueqv_R009NNNNY_partial_04_0307_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_04_0307
        rs_R009_ueqv_R009NNNNY_generator_04_0300_0309 =
      rs_R009_ueqv_R009NNNNY_partial_04_0307 := by
  native_decide

/-- Coefficient term 308 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009NNNNY_coefficient_04_0308 : Poly :=
[
  term ((8 : Rat) / 31) [(15, 4), (16, 1)]
]

/-- Partial product 308 for generator 4. -/
def rs_R009_ueqv_R009NNNNY_partial_04_0308 : Poly :=
[
  term ((-16 : Rat) / 31) [(4, 1), (15, 4), (16, 1)],
  term ((8 : Rat) / 31) [(4, 2), (15, 4), (16, 1)],
  term ((8 : Rat) / 31) [(5, 2), (15, 4), (16, 1)],
  term ((16 : Rat) / 31) [(12, 1), (15, 4), (16, 1)],
  term ((-8 : Rat) / 31) [(12, 2), (15, 4), (16, 1)],
  term ((-8 : Rat) / 31) [(13, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 308 for generator 4. -/
theorem rs_R009_ueqv_R009NNNNY_partial_04_0308_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_04_0308
        rs_R009_ueqv_R009NNNNY_generator_04_0300_0309 =
      rs_R009_ueqv_R009NNNNY_partial_04_0308 := by
  native_decide

/-- Coefficient term 309 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009NNNNY_coefficient_04_0309 : Poly :=
[
  term ((1955 : Rat) / 744) [(16, 1)]
]

/-- Partial product 309 for generator 4. -/
def rs_R009_ueqv_R009NNNNY_partial_04_0309 : Poly :=
[
  term ((-1955 : Rat) / 372) [(4, 1), (16, 1)],
  term ((1955 : Rat) / 744) [(4, 2), (16, 1)],
  term ((1955 : Rat) / 744) [(5, 2), (16, 1)],
  term ((1955 : Rat) / 372) [(12, 1), (16, 1)],
  term ((-1955 : Rat) / 744) [(12, 2), (16, 1)],
  term ((-1955 : Rat) / 744) [(13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 309 for generator 4. -/
theorem rs_R009_ueqv_R009NNNNY_partial_04_0309_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_04_0309
        rs_R009_ueqv_R009NNNNY_generator_04_0300_0309 =
      rs_R009_ueqv_R009NNNNY_partial_04_0309 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NNNNY_partials_04_0300_0309 : List Poly :=
[
  rs_R009_ueqv_R009NNNNY_partial_04_0300,
  rs_R009_ueqv_R009NNNNY_partial_04_0301,
  rs_R009_ueqv_R009NNNNY_partial_04_0302,
  rs_R009_ueqv_R009NNNNY_partial_04_0303,
  rs_R009_ueqv_R009NNNNY_partial_04_0304,
  rs_R009_ueqv_R009NNNNY_partial_04_0305,
  rs_R009_ueqv_R009NNNNY_partial_04_0306,
  rs_R009_ueqv_R009NNNNY_partial_04_0307,
  rs_R009_ueqv_R009NNNNY_partial_04_0308,
  rs_R009_ueqv_R009NNNNY_partial_04_0309
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NNNNY_block_04_0300_0309 : Poly :=
[
  term ((32 : Rat) / 31) [(4, 1), (13, 1), (15, 3), (16, 1)],
  term ((200 : Rat) / 93) [(4, 1), (13, 2), (14, 1), (16, 1)],
  term ((100 : Rat) / 93) [(4, 1), (13, 2), (16, 1)],
  term ((88 : Rat) / 93) [(4, 1), (14, 1), (15, 2), (16, 1)],
  term ((-394 : Rat) / 31) [(4, 1), (14, 1), (16, 1)],
  term ((-16 : Rat) / 31) [(4, 1), (14, 2), (15, 2), (16, 1)],
  term ((2149 : Rat) / 93) [(4, 1), (14, 2), (16, 1)],
  term ((47 : Rat) / 3) [(4, 1), (15, 2), (16, 1)],
  term ((-16 : Rat) / 31) [(4, 1), (15, 4), (16, 1)],
  term ((-1955 : Rat) / 372) [(4, 1), (16, 1)],
  term ((-16 : Rat) / 31) [(4, 2), (13, 1), (15, 3), (16, 1)],
  term ((-100 : Rat) / 93) [(4, 2), (13, 2), (14, 1), (16, 1)],
  term ((-50 : Rat) / 93) [(4, 2), (13, 2), (16, 1)],
  term ((-44 : Rat) / 93) [(4, 2), (14, 1), (15, 2), (16, 1)],
  term ((197 : Rat) / 31) [(4, 2), (14, 1), (16, 1)],
  term ((8 : Rat) / 31) [(4, 2), (14, 2), (15, 2), (16, 1)],
  term ((-2149 : Rat) / 186) [(4, 2), (14, 2), (16, 1)],
  term ((-47 : Rat) / 6) [(4, 2), (15, 2), (16, 1)],
  term ((8 : Rat) / 31) [(4, 2), (15, 4), (16, 1)],
  term ((1955 : Rat) / 744) [(4, 2), (16, 1)],
  term ((-16 : Rat) / 31) [(5, 2), (13, 1), (15, 3), (16, 1)],
  term ((-100 : Rat) / 93) [(5, 2), (13, 2), (14, 1), (16, 1)],
  term ((-50 : Rat) / 93) [(5, 2), (13, 2), (16, 1)],
  term ((-44 : Rat) / 93) [(5, 2), (14, 1), (15, 2), (16, 1)],
  term ((197 : Rat) / 31) [(5, 2), (14, 1), (16, 1)],
  term ((8 : Rat) / 31) [(5, 2), (14, 2), (15, 2), (16, 1)],
  term ((-2149 : Rat) / 186) [(5, 2), (14, 2), (16, 1)],
  term ((-47 : Rat) / 6) [(5, 2), (15, 2), (16, 1)],
  term ((8 : Rat) / 31) [(5, 2), (15, 4), (16, 1)],
  term ((1955 : Rat) / 744) [(5, 2), (16, 1)],
  term ((-32 : Rat) / 31) [(12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-200 : Rat) / 93) [(12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-100 : Rat) / 93) [(12, 1), (13, 2), (16, 1)],
  term ((-88 : Rat) / 93) [(12, 1), (14, 1), (15, 2), (16, 1)],
  term ((394 : Rat) / 31) [(12, 1), (14, 1), (16, 1)],
  term ((16 : Rat) / 31) [(12, 1), (14, 2), (15, 2), (16, 1)],
  term ((-2149 : Rat) / 93) [(12, 1), (14, 2), (16, 1)],
  term ((-47 : Rat) / 3) [(12, 1), (15, 2), (16, 1)],
  term ((16 : Rat) / 31) [(12, 1), (15, 4), (16, 1)],
  term ((1955 : Rat) / 372) [(12, 1), (16, 1)],
  term ((16 : Rat) / 31) [(12, 2), (13, 1), (15, 3), (16, 1)],
  term ((100 : Rat) / 93) [(12, 2), (13, 2), (14, 1), (16, 1)],
  term ((50 : Rat) / 93) [(12, 2), (13, 2), (16, 1)],
  term ((44 : Rat) / 93) [(12, 2), (14, 1), (15, 2), (16, 1)],
  term ((-197 : Rat) / 31) [(12, 2), (14, 1), (16, 1)],
  term ((-8 : Rat) / 31) [(12, 2), (14, 2), (15, 2), (16, 1)],
  term ((2149 : Rat) / 186) [(12, 2), (14, 2), (16, 1)],
  term ((47 : Rat) / 6) [(12, 2), (15, 2), (16, 1)],
  term ((-8 : Rat) / 31) [(12, 2), (15, 4), (16, 1)],
  term ((-1955 : Rat) / 744) [(12, 2), (16, 1)],
  term ((44 : Rat) / 93) [(13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-197 : Rat) / 31) [(13, 2), (14, 1), (16, 1)],
  term ((-8 : Rat) / 31) [(13, 2), (14, 2), (15, 2), (16, 1)],
  term ((2149 : Rat) / 186) [(13, 2), (14, 2), (16, 1)],
  term ((47 : Rat) / 6) [(13, 2), (15, 2), (16, 1)],
  term ((-8 : Rat) / 31) [(13, 2), (15, 4), (16, 1)],
  term ((-1955 : Rat) / 744) [(13, 2), (16, 1)],
  term ((16 : Rat) / 31) [(13, 3), (15, 3), (16, 1)],
  term ((100 : Rat) / 93) [(13, 4), (14, 1), (16, 1)],
  term ((50 : Rat) / 93) [(13, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 4, terms 300 through 309. -/
theorem rs_R009_ueqv_R009NNNNY_block_04_0300_0309_valid :
    checkProductSumEq rs_R009_ueqv_R009NNNNY_partials_04_0300_0309
      rs_R009_ueqv_R009NNNNY_block_04_0300_0309 = true := by
  native_decide

end R009UeqvR009NNNNYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
