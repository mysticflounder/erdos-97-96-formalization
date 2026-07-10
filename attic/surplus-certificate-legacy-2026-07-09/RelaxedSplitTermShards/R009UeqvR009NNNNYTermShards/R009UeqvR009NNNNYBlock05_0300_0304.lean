/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NNNNY, term block 5:300-304

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NNNNYTermShards

/-- Generator polynomial 5 for relaxed split surplus certificate `R009:u=v:R009NNNNY`. -/
def rs_R009_ueqv_R009NNNNY_generator_05_0300_0304 : Poly :=
[
  term (-2 : Rat) [(4, 1)],
  term (1 : Rat) [(4, 2)],
  term (1 : Rat) [(5, 2)],
  term (2 : Rat) [(14, 1)],
  term (-1 : Rat) [(14, 2)],
  term (-1 : Rat) [(15, 2)]
]

/-- Coefficient term 300 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NNNNY_coefficient_05_0300 : Poly :=
[
  term ((-8 : Rat) / 31) [(14, 2), (15, 2), (16, 1)]
]

/-- Partial product 300 for generator 5. -/
def rs_R009_ueqv_R009NNNNY_partial_05_0300 : Poly :=
[
  term ((16 : Rat) / 31) [(4, 1), (14, 2), (15, 2), (16, 1)],
  term ((-8 : Rat) / 31) [(4, 2), (14, 2), (15, 2), (16, 1)],
  term ((-8 : Rat) / 31) [(5, 2), (14, 2), (15, 2), (16, 1)],
  term ((8 : Rat) / 31) [(14, 2), (15, 4), (16, 1)],
  term ((-16 : Rat) / 31) [(14, 3), (15, 2), (16, 1)],
  term ((8 : Rat) / 31) [(14, 4), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 300 for generator 5. -/
theorem rs_R009_ueqv_R009NNNNY_partial_05_0300_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_05_0300
        rs_R009_ueqv_R009NNNNY_generator_05_0300_0304 =
      rs_R009_ueqv_R009NNNNY_partial_05_0300 := by
  native_decide

/-- Coefficient term 301 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NNNNY_coefficient_05_0301 : Poly :=
[
  term ((2149 : Rat) / 186) [(14, 2), (16, 1)]
]

/-- Partial product 301 for generator 5. -/
def rs_R009_ueqv_R009NNNNY_partial_05_0301 : Poly :=
[
  term ((-2149 : Rat) / 93) [(4, 1), (14, 2), (16, 1)],
  term ((2149 : Rat) / 186) [(4, 2), (14, 2), (16, 1)],
  term ((2149 : Rat) / 186) [(5, 2), (14, 2), (16, 1)],
  term ((-2149 : Rat) / 186) [(14, 2), (15, 2), (16, 1)],
  term ((2149 : Rat) / 93) [(14, 3), (16, 1)],
  term ((-2149 : Rat) / 186) [(14, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 301 for generator 5. -/
theorem rs_R009_ueqv_R009NNNNY_partial_05_0301_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_05_0301
        rs_R009_ueqv_R009NNNNY_generator_05_0300_0304 =
      rs_R009_ueqv_R009NNNNY_partial_05_0301 := by
  native_decide

/-- Coefficient term 302 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NNNNY_coefficient_05_0302 : Poly :=
[
  term ((2185 : Rat) / 186) [(15, 2), (16, 1)]
]

/-- Partial product 302 for generator 5. -/
def rs_R009_ueqv_R009NNNNY_partial_05_0302 : Poly :=
[
  term ((-2185 : Rat) / 93) [(4, 1), (15, 2), (16, 1)],
  term ((2185 : Rat) / 186) [(4, 2), (15, 2), (16, 1)],
  term ((2185 : Rat) / 186) [(5, 2), (15, 2), (16, 1)],
  term ((2185 : Rat) / 93) [(14, 1), (15, 2), (16, 1)],
  term ((-2185 : Rat) / 186) [(14, 2), (15, 2), (16, 1)],
  term ((-2185 : Rat) / 186) [(15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 302 for generator 5. -/
theorem rs_R009_ueqv_R009NNNNY_partial_05_0302_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_05_0302
        rs_R009_ueqv_R009NNNNY_generator_05_0300_0304 =
      rs_R009_ueqv_R009NNNNY_partial_05_0302 := by
  native_decide

/-- Coefficient term 303 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NNNNY_coefficient_05_0303 : Poly :=
[
  term ((-8 : Rat) / 31) [(15, 4), (16, 1)]
]

/-- Partial product 303 for generator 5. -/
def rs_R009_ueqv_R009NNNNY_partial_05_0303 : Poly :=
[
  term ((16 : Rat) / 31) [(4, 1), (15, 4), (16, 1)],
  term ((-8 : Rat) / 31) [(4, 2), (15, 4), (16, 1)],
  term ((-8 : Rat) / 31) [(5, 2), (15, 4), (16, 1)],
  term ((-16 : Rat) / 31) [(14, 1), (15, 4), (16, 1)],
  term ((8 : Rat) / 31) [(14, 2), (15, 4), (16, 1)],
  term ((8 : Rat) / 31) [(15, 6), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 303 for generator 5. -/
theorem rs_R009_ueqv_R009NNNNY_partial_05_0303_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_05_0303
        rs_R009_ueqv_R009NNNNY_generator_05_0300_0304 =
      rs_R009_ueqv_R009NNNNY_partial_05_0303 := by
  native_decide

/-- Coefficient term 304 from coefficient polynomial 5. -/
def rs_R009_ueqv_R009NNNNY_coefficient_05_0304 : Poly :=
[
  term ((-489 : Rat) / 62) [(16, 1)]
]

/-- Partial product 304 for generator 5. -/
def rs_R009_ueqv_R009NNNNY_partial_05_0304 : Poly :=
[
  term ((489 : Rat) / 31) [(4, 1), (16, 1)],
  term ((-489 : Rat) / 62) [(4, 2), (16, 1)],
  term ((-489 : Rat) / 62) [(5, 2), (16, 1)],
  term ((-489 : Rat) / 31) [(14, 1), (16, 1)],
  term ((489 : Rat) / 62) [(14, 2), (16, 1)],
  term ((489 : Rat) / 62) [(15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 304 for generator 5. -/
theorem rs_R009_ueqv_R009NNNNY_partial_05_0304_valid :
    mulPoly rs_R009_ueqv_R009NNNNY_coefficient_05_0304
        rs_R009_ueqv_R009NNNNY_generator_05_0300_0304 =
      rs_R009_ueqv_R009NNNNY_partial_05_0304 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NNNNY_partials_05_0300_0304 : List Poly :=
[
  rs_R009_ueqv_R009NNNNY_partial_05_0300,
  rs_R009_ueqv_R009NNNNY_partial_05_0301,
  rs_R009_ueqv_R009NNNNY_partial_05_0302,
  rs_R009_ueqv_R009NNNNY_partial_05_0303,
  rs_R009_ueqv_R009NNNNY_partial_05_0304
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NNNNY_block_05_0300_0304 : Poly :=
[
  term ((16 : Rat) / 31) [(4, 1), (14, 2), (15, 2), (16, 1)],
  term ((-2149 : Rat) / 93) [(4, 1), (14, 2), (16, 1)],
  term ((-2185 : Rat) / 93) [(4, 1), (15, 2), (16, 1)],
  term ((16 : Rat) / 31) [(4, 1), (15, 4), (16, 1)],
  term ((489 : Rat) / 31) [(4, 1), (16, 1)],
  term ((-8 : Rat) / 31) [(4, 2), (14, 2), (15, 2), (16, 1)],
  term ((2149 : Rat) / 186) [(4, 2), (14, 2), (16, 1)],
  term ((2185 : Rat) / 186) [(4, 2), (15, 2), (16, 1)],
  term ((-8 : Rat) / 31) [(4, 2), (15, 4), (16, 1)],
  term ((-489 : Rat) / 62) [(4, 2), (16, 1)],
  term ((-8 : Rat) / 31) [(5, 2), (14, 2), (15, 2), (16, 1)],
  term ((2149 : Rat) / 186) [(5, 2), (14, 2), (16, 1)],
  term ((2185 : Rat) / 186) [(5, 2), (15, 2), (16, 1)],
  term ((-8 : Rat) / 31) [(5, 2), (15, 4), (16, 1)],
  term ((-489 : Rat) / 62) [(5, 2), (16, 1)],
  term ((2185 : Rat) / 93) [(14, 1), (15, 2), (16, 1)],
  term ((-16 : Rat) / 31) [(14, 1), (15, 4), (16, 1)],
  term ((-489 : Rat) / 31) [(14, 1), (16, 1)],
  term ((-2167 : Rat) / 93) [(14, 2), (15, 2), (16, 1)],
  term ((16 : Rat) / 31) [(14, 2), (15, 4), (16, 1)],
  term ((489 : Rat) / 62) [(14, 2), (16, 1)],
  term ((-16 : Rat) / 31) [(14, 3), (15, 2), (16, 1)],
  term ((2149 : Rat) / 93) [(14, 3), (16, 1)],
  term ((8 : Rat) / 31) [(14, 4), (15, 2), (16, 1)],
  term ((-2149 : Rat) / 186) [(14, 4), (16, 1)],
  term ((489 : Rat) / 62) [(15, 2), (16, 1)],
  term ((-2185 : Rat) / 186) [(15, 4), (16, 1)],
  term ((8 : Rat) / 31) [(15, 6), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 5, terms 300 through 304. -/
theorem rs_R009_ueqv_R009NNNNY_block_05_0300_0304_valid :
    checkProductSumEq rs_R009_ueqv_R009NNNNY_partials_05_0300_0304
      rs_R009_ueqv_R009NNNNY_block_05_0300_0304 = true := by
  native_decide

end R009UeqvR009NNNNYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
