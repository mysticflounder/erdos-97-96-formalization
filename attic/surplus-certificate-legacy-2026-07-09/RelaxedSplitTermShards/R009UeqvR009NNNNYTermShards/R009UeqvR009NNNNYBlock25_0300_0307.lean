/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NNNNY, term block 25:300-307

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NNNNYTermShards

/-- Generator polynomial 25 for relaxed split surplus certificate `R009:u=v:R009NNNNY`. -/
def rs_R009_ueqv_R009NNNNY_generator_25_0300_0307 : Poly :=
[
  term (-1 : Rat) [],
  term (-2 : Rat) [(0, 1), (12, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (13, 1)],
  term (1 : Rat) [(1, 2)],
  term (2 : Rat) [(12, 1)]
]

/-- Coefficient term 300 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009NNNNY_coefficient_25_0300 : Poly :=
[
  term ((100 : Rat) / 93) [(13, 2), (14, 1), (16, 1)]
]

/-- Partial product 300 for generator 25. -/
def rs_R009_ueqv_R009NNNNY_partial_25_0300 : Poly :=
[
  term ((-200 : Rat) / 93) [(0, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((100 : Rat) / 93) [(0, 2), (13, 2), (14, 1), (16, 1)],
  term ((-200 : Rat) / 93) [(1, 1), (13, 3), (14, 1), (16, 1)],
  term ((100 : Rat) / 93) [(1, 2), (13, 2), (14, 1), (16, 1)],
  term ((200 : Rat) / 93) [(12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-100 : Rat) / 93) [(13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 300 for generator 25. -/
theorem rs_R009_ueqv_R009NNNNY_partial_25_0300_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_25_0300
        rs_R009_ueqv_R009NNNNY_generator_25_0300_0307 =
      rs_R009_ueqv_R009NNNNY_partial_25_0300 := by
  native_decide

/-- Coefficient term 301 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009NNNNY_coefficient_25_0301 : Poly :=
[
  term ((50 : Rat) / 93) [(13, 2), (16, 1)]
]

/-- Partial product 301 for generator 25. -/
def rs_R009_ueqv_R009NNNNY_partial_25_0301 : Poly :=
[
  term ((-100 : Rat) / 93) [(0, 1), (12, 1), (13, 2), (16, 1)],
  term ((50 : Rat) / 93) [(0, 2), (13, 2), (16, 1)],
  term ((-100 : Rat) / 93) [(1, 1), (13, 3), (16, 1)],
  term ((50 : Rat) / 93) [(1, 2), (13, 2), (16, 1)],
  term ((100 : Rat) / 93) [(12, 1), (13, 2), (16, 1)],
  term ((-50 : Rat) / 93) [(13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 301 for generator 25. -/
theorem rs_R009_ueqv_R009NNNNY_partial_25_0301_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_25_0301
        rs_R009_ueqv_R009NNNNY_generator_25_0300_0307 =
      rs_R009_ueqv_R009NNNNY_partial_25_0301 := by
  native_decide

/-- Coefficient term 302 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009NNNNY_coefficient_25_0302 : Poly :=
[
  term ((12 : Rat) / 31) [(14, 1), (15, 2), (16, 1)]
]

/-- Partial product 302 for generator 25. -/
def rs_R009_ueqv_R009NNNNY_partial_25_0302 : Poly :=
[
  term ((-24 : Rat) / 31) [(0, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((12 : Rat) / 31) [(0, 2), (14, 1), (15, 2), (16, 1)],
  term ((-24 : Rat) / 31) [(1, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((12 : Rat) / 31) [(1, 2), (14, 1), (15, 2), (16, 1)],
  term ((24 : Rat) / 31) [(12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-12 : Rat) / 31) [(14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 302 for generator 25. -/
theorem rs_R009_ueqv_R009NNNNY_partial_25_0302_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_25_0302
        rs_R009_ueqv_R009NNNNY_generator_25_0300_0307 =
      rs_R009_ueqv_R009NNNNY_partial_25_0302 := by
  native_decide

/-- Coefficient term 303 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009NNNNY_coefficient_25_0303 : Poly :=
[
  term ((-489 : Rat) / 31) [(14, 1), (16, 1)]
]

/-- Partial product 303 for generator 25. -/
def rs_R009_ueqv_R009NNNNY_partial_25_0303 : Poly :=
[
  term ((978 : Rat) / 31) [(0, 1), (12, 1), (14, 1), (16, 1)],
  term ((-489 : Rat) / 31) [(0, 2), (14, 1), (16, 1)],
  term ((978 : Rat) / 31) [(1, 1), (13, 1), (14, 1), (16, 1)],
  term ((-489 : Rat) / 31) [(1, 2), (14, 1), (16, 1)],
  term ((-978 : Rat) / 31) [(12, 1), (14, 1), (16, 1)],
  term ((489 : Rat) / 31) [(14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 303 for generator 25. -/
theorem rs_R009_ueqv_R009NNNNY_partial_25_0303_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_25_0303
        rs_R009_ueqv_R009NNNNY_generator_25_0300_0307 =
      rs_R009_ueqv_R009NNNNY_partial_25_0303 := by
  native_decide

/-- Coefficient term 304 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009NNNNY_coefficient_25_0304 : Poly :=
[
  term ((-8 : Rat) / 31) [(14, 2), (15, 2), (16, 1)]
]

/-- Partial product 304 for generator 25. -/
def rs_R009_ueqv_R009NNNNY_partial_25_0304 : Poly :=
[
  term ((16 : Rat) / 31) [(0, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((-8 : Rat) / 31) [(0, 2), (14, 2), (15, 2), (16, 1)],
  term ((16 : Rat) / 31) [(1, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-8 : Rat) / 31) [(1, 2), (14, 2), (15, 2), (16, 1)],
  term ((-16 : Rat) / 31) [(12, 1), (14, 2), (15, 2), (16, 1)],
  term ((8 : Rat) / 31) [(14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 304 for generator 25. -/
theorem rs_R009_ueqv_R009NNNNY_partial_25_0304_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_25_0304
        rs_R009_ueqv_R009NNNNY_generator_25_0300_0307 =
      rs_R009_ueqv_R009NNNNY_partial_25_0304 := by
  native_decide

/-- Coefficient term 305 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009NNNNY_coefficient_25_0305 : Poly :=
[
  term ((2149 : Rat) / 186) [(14, 2), (16, 1)]
]

/-- Partial product 305 for generator 25. -/
def rs_R009_ueqv_R009NNNNY_partial_25_0305 : Poly :=
[
  term ((-2149 : Rat) / 93) [(0, 1), (12, 1), (14, 2), (16, 1)],
  term ((2149 : Rat) / 186) [(0, 2), (14, 2), (16, 1)],
  term ((-2149 : Rat) / 93) [(1, 1), (13, 1), (14, 2), (16, 1)],
  term ((2149 : Rat) / 186) [(1, 2), (14, 2), (16, 1)],
  term ((2149 : Rat) / 93) [(12, 1), (14, 2), (16, 1)],
  term ((-2149 : Rat) / 186) [(14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 305 for generator 25. -/
theorem rs_R009_ueqv_R009NNNNY_partial_25_0305_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_25_0305
        rs_R009_ueqv_R009NNNNY_generator_25_0300_0307 =
      rs_R009_ueqv_R009NNNNY_partial_25_0305 := by
  native_decide

/-- Coefficient term 306 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009NNNNY_coefficient_25_0306 : Poly :=
[
  term ((2005 : Rat) / 93) [(15, 2), (16, 1)]
]

/-- Partial product 306 for generator 25. -/
def rs_R009_ueqv_R009NNNNY_partial_25_0306 : Poly :=
[
  term ((-4010 : Rat) / 93) [(0, 1), (12, 1), (15, 2), (16, 1)],
  term ((2005 : Rat) / 93) [(0, 2), (15, 2), (16, 1)],
  term ((-4010 : Rat) / 93) [(1, 1), (13, 1), (15, 2), (16, 1)],
  term ((2005 : Rat) / 93) [(1, 2), (15, 2), (16, 1)],
  term ((4010 : Rat) / 93) [(12, 1), (15, 2), (16, 1)],
  term ((-2005 : Rat) / 93) [(15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 306 for generator 25. -/
theorem rs_R009_ueqv_R009NNNNY_partial_25_0306_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_25_0306
        rs_R009_ueqv_R009NNNNY_generator_25_0300_0307 =
      rs_R009_ueqv_R009NNNNY_partial_25_0306 := by
  native_decide

/-- Coefficient term 307 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009NNNNY_coefficient_25_0307 : Poly :=
[
  term ((-8 : Rat) / 31) [(15, 4), (16, 1)]
]

/-- Partial product 307 for generator 25. -/
def rs_R009_ueqv_R009NNNNY_partial_25_0307 : Poly :=
[
  term ((16 : Rat) / 31) [(0, 1), (12, 1), (15, 4), (16, 1)],
  term ((-8 : Rat) / 31) [(0, 2), (15, 4), (16, 1)],
  term ((16 : Rat) / 31) [(1, 1), (13, 1), (15, 4), (16, 1)],
  term ((-8 : Rat) / 31) [(1, 2), (15, 4), (16, 1)],
  term ((-16 : Rat) / 31) [(12, 1), (15, 4), (16, 1)],
  term ((8 : Rat) / 31) [(15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 307 for generator 25. -/
theorem rs_R009_ueqv_R009NNNNY_partial_25_0307_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_25_0307
        rs_R009_ueqv_R009NNNNY_generator_25_0300_0307 =
      rs_R009_ueqv_R009NNNNY_partial_25_0307 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NNNNY_partials_25_0300_0307 : List Poly :=
[
  rs_R009_ueqv_R009NNNNY_partial_25_0300,
  rs_R009_ueqv_R009NNNNY_partial_25_0301,
  rs_R009_ueqv_R009NNNNY_partial_25_0302,
  rs_R009_ueqv_R009NNNNY_partial_25_0303,
  rs_R009_ueqv_R009NNNNY_partial_25_0304,
  rs_R009_ueqv_R009NNNNY_partial_25_0305,
  rs_R009_ueqv_R009NNNNY_partial_25_0306,
  rs_R009_ueqv_R009NNNNY_partial_25_0307
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NNNNY_block_25_0300_0307 : Poly :=
[
  term ((-200 : Rat) / 93) [(0, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-100 : Rat) / 93) [(0, 1), (12, 1), (13, 2), (16, 1)],
  term ((-24 : Rat) / 31) [(0, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((978 : Rat) / 31) [(0, 1), (12, 1), (14, 1), (16, 1)],
  term ((16 : Rat) / 31) [(0, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((-2149 : Rat) / 93) [(0, 1), (12, 1), (14, 2), (16, 1)],
  term ((-4010 : Rat) / 93) [(0, 1), (12, 1), (15, 2), (16, 1)],
  term ((16 : Rat) / 31) [(0, 1), (12, 1), (15, 4), (16, 1)],
  term ((100 : Rat) / 93) [(0, 2), (13, 2), (14, 1), (16, 1)],
  term ((50 : Rat) / 93) [(0, 2), (13, 2), (16, 1)],
  term ((12 : Rat) / 31) [(0, 2), (14, 1), (15, 2), (16, 1)],
  term ((-489 : Rat) / 31) [(0, 2), (14, 1), (16, 1)],
  term ((-8 : Rat) / 31) [(0, 2), (14, 2), (15, 2), (16, 1)],
  term ((2149 : Rat) / 186) [(0, 2), (14, 2), (16, 1)],
  term ((2005 : Rat) / 93) [(0, 2), (15, 2), (16, 1)],
  term ((-8 : Rat) / 31) [(0, 2), (15, 4), (16, 1)],
  term ((-24 : Rat) / 31) [(1, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((978 : Rat) / 31) [(1, 1), (13, 1), (14, 1), (16, 1)],
  term ((16 : Rat) / 31) [(1, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-2149 : Rat) / 93) [(1, 1), (13, 1), (14, 2), (16, 1)],
  term ((-4010 : Rat) / 93) [(1, 1), (13, 1), (15, 2), (16, 1)],
  term ((16 : Rat) / 31) [(1, 1), (13, 1), (15, 4), (16, 1)],
  term ((-200 : Rat) / 93) [(1, 1), (13, 3), (14, 1), (16, 1)],
  term ((-100 : Rat) / 93) [(1, 1), (13, 3), (16, 1)],
  term ((100 : Rat) / 93) [(1, 2), (13, 2), (14, 1), (16, 1)],
  term ((50 : Rat) / 93) [(1, 2), (13, 2), (16, 1)],
  term ((12 : Rat) / 31) [(1, 2), (14, 1), (15, 2), (16, 1)],
  term ((-489 : Rat) / 31) [(1, 2), (14, 1), (16, 1)],
  term ((-8 : Rat) / 31) [(1, 2), (14, 2), (15, 2), (16, 1)],
  term ((2149 : Rat) / 186) [(1, 2), (14, 2), (16, 1)],
  term ((2005 : Rat) / 93) [(1, 2), (15, 2), (16, 1)],
  term ((-8 : Rat) / 31) [(1, 2), (15, 4), (16, 1)],
  term ((200 : Rat) / 93) [(12, 1), (13, 2), (14, 1), (16, 1)],
  term ((100 : Rat) / 93) [(12, 1), (13, 2), (16, 1)],
  term ((24 : Rat) / 31) [(12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-978 : Rat) / 31) [(12, 1), (14, 1), (16, 1)],
  term ((-16 : Rat) / 31) [(12, 1), (14, 2), (15, 2), (16, 1)],
  term ((2149 : Rat) / 93) [(12, 1), (14, 2), (16, 1)],
  term ((4010 : Rat) / 93) [(12, 1), (15, 2), (16, 1)],
  term ((-16 : Rat) / 31) [(12, 1), (15, 4), (16, 1)],
  term ((-100 : Rat) / 93) [(13, 2), (14, 1), (16, 1)],
  term ((-50 : Rat) / 93) [(13, 2), (16, 1)],
  term ((-12 : Rat) / 31) [(14, 1), (15, 2), (16, 1)],
  term ((489 : Rat) / 31) [(14, 1), (16, 1)],
  term ((8 : Rat) / 31) [(14, 2), (15, 2), (16, 1)],
  term ((-2149 : Rat) / 186) [(14, 2), (16, 1)],
  term ((-2005 : Rat) / 93) [(15, 2), (16, 1)],
  term ((8 : Rat) / 31) [(15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 25, terms 300 through 307. -/
theorem rs_R009_ueqv_R009NNNNY_block_25_0300_0307_valid :
    checkProductSumEq rs_R009_ueqv_R009NNNNY_partials_25_0300_0307
      rs_R009_ueqv_R009NNNNY_block_25_0300_0307 = true := by
  native_decide

end R009UeqvR009NNNNYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
