/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R011:u=v:R011NNNY, term block 16:300-311

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R011UeqvR011NNNYTermShards

/-- Generator polynomial 16 for relaxed split surplus certificate `R011:u=v:R011NNNY`. -/
def rs_R011_ueqv_R011NNNY_generator_16_0300_0311 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(6, 1)]
]

/-- Coefficient term 300 from coefficient polynomial 16. -/
def rs_R011_ueqv_R011NNNY_coefficient_16_0300 : Poly :=
[
  term ((-68 : Rat) / 7) [(9, 3), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 300 for generator 16. -/
def rs_R011_ueqv_R011NNNY_partial_16_0300 : Poly :=
[
  term ((-136 : Rat) / 7) [(6, 1), (9, 3), (10, 1), (15, 1), (16, 1)],
  term ((68 : Rat) / 7) [(9, 3), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 300 for generator 16. -/
theorem rs_R011_ueqv_R011NNNY_partial_16_0300_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_16_0300
        rs_R011_ueqv_R011NNNY_generator_16_0300_0311 =
      rs_R011_ueqv_R011NNNY_partial_16_0300 := by
  native_decide

/-- Coefficient term 301 from coefficient polynomial 16. -/
def rs_R011_ueqv_R011NNNY_coefficient_16_0301 : Poly :=
[
  term ((-384 : Rat) / 7) [(9, 3), (10, 1), (15, 3), (16, 1)]
]

/-- Partial product 301 for generator 16. -/
def rs_R011_ueqv_R011NNNY_partial_16_0301 : Poly :=
[
  term ((-768 : Rat) / 7) [(6, 1), (9, 3), (10, 1), (15, 3), (16, 1)],
  term ((384 : Rat) / 7) [(9, 3), (10, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 301 for generator 16. -/
theorem rs_R011_ueqv_R011NNNY_partial_16_0301_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_16_0301
        rs_R011_ueqv_R011NNNY_generator_16_0300_0311 =
      rs_R011_ueqv_R011NNNY_partial_16_0301 := by
  native_decide

/-- Coefficient term 302 from coefficient polynomial 16. -/
def rs_R011_ueqv_R011NNNY_coefficient_16_0302 : Poly :=
[
  term ((17 : Rat) / 7) [(9, 3), (15, 1), (16, 1)]
]

/-- Partial product 302 for generator 16. -/
def rs_R011_ueqv_R011NNNY_partial_16_0302 : Poly :=
[
  term ((34 : Rat) / 7) [(6, 1), (9, 3), (15, 1), (16, 1)],
  term ((-17 : Rat) / 7) [(9, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 302 for generator 16. -/
theorem rs_R011_ueqv_R011NNNY_partial_16_0302_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_16_0302
        rs_R011_ueqv_R011NNNY_generator_16_0300_0311 =
      rs_R011_ueqv_R011NNNY_partial_16_0302 := by
  native_decide

/-- Coefficient term 303 from coefficient polynomial 16. -/
def rs_R011_ueqv_R011NNNY_coefficient_16_0303 : Poly :=
[
  term ((96 : Rat) / 7) [(9, 3), (15, 3), (16, 1)]
]

/-- Partial product 303 for generator 16. -/
def rs_R011_ueqv_R011NNNY_partial_16_0303 : Poly :=
[
  term ((192 : Rat) / 7) [(6, 1), (9, 3), (15, 3), (16, 1)],
  term ((-96 : Rat) / 7) [(9, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 303 for generator 16. -/
theorem rs_R011_ueqv_R011NNNY_partial_16_0303_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_16_0303
        rs_R011_ueqv_R011NNNY_generator_16_0300_0311 =
      rs_R011_ueqv_R011NNNY_partial_16_0303 := by
  native_decide

/-- Coefficient term 304 from coefficient polynomial 16. -/
def rs_R011_ueqv_R011NNNY_coefficient_16_0304 : Poly :=
[
  term ((40 : Rat) / 7) [(10, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 304 for generator 16. -/
def rs_R011_ueqv_R011NNNY_partial_16_0304 : Poly :=
[
  term ((80 : Rat) / 7) [(6, 1), (10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-40 : Rat) / 7) [(10, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 304 for generator 16. -/
theorem rs_R011_ueqv_R011NNNY_partial_16_0304_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_16_0304
        rs_R011_ueqv_R011NNNY_generator_16_0300_0311 =
      rs_R011_ueqv_R011NNNY_partial_16_0304 := by
  native_decide

/-- Coefficient term 305 from coefficient polynomial 16. -/
def rs_R011_ueqv_R011NNNY_coefficient_16_0305 : Poly :=
[
  term ((-10 : Rat) / 7) [(10, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 305 for generator 16. -/
def rs_R011_ueqv_R011NNNY_partial_16_0305 : Poly :=
[
  term ((-20 : Rat) / 7) [(6, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((10 : Rat) / 7) [(10, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 305 for generator 16. -/
theorem rs_R011_ueqv_R011NNNY_partial_16_0305_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_16_0305
        rs_R011_ueqv_R011NNNY_generator_16_0300_0311 =
      rs_R011_ueqv_R011NNNY_partial_16_0305 := by
  native_decide

/-- Coefficient term 306 from coefficient polynomial 16. -/
def rs_R011_ueqv_R011NNNY_coefficient_16_0306 : Poly :=
[
  term ((89 : Rat) / 56) [(10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 306 for generator 16. -/
def rs_R011_ueqv_R011NNNY_partial_16_0306 : Poly :=
[
  term ((89 : Rat) / 28) [(6, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-89 : Rat) / 56) [(10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 306 for generator 16. -/
theorem rs_R011_ueqv_R011NNNY_partial_16_0306_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_16_0306
        rs_R011_ueqv_R011NNNY_generator_16_0300_0311 =
      rs_R011_ueqv_R011NNNY_partial_16_0306 := by
  native_decide

/-- Coefficient term 307 from coefficient polynomial 16. -/
def rs_R011_ueqv_R011NNNY_coefficient_16_0307 : Poly :=
[
  term ((89 : Rat) / 56) [(10, 1), (13, 2), (16, 1)]
]

/-- Partial product 307 for generator 16. -/
def rs_R011_ueqv_R011NNNY_partial_16_0307 : Poly :=
[
  term ((89 : Rat) / 28) [(6, 1), (10, 1), (13, 2), (16, 1)],
  term ((-89 : Rat) / 56) [(10, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 307 for generator 16. -/
theorem rs_R011_ueqv_R011NNNY_partial_16_0307_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_16_0307
        rs_R011_ueqv_R011NNNY_generator_16_0300_0311 =
      rs_R011_ueqv_R011NNNY_partial_16_0307 := by
  native_decide

/-- Coefficient term 308 from coefficient polynomial 16. -/
def rs_R011_ueqv_R011NNNY_coefficient_16_0308 : Poly :=
[
  term ((-1 : Rat) / 14) [(10, 1), (16, 1)]
]

/-- Partial product 308 for generator 16. -/
def rs_R011_ueqv_R011NNNY_partial_16_0308 : Poly :=
[
  term ((-1 : Rat) / 7) [(6, 1), (10, 1), (16, 1)],
  term ((1 : Rat) / 14) [(10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 308 for generator 16. -/
theorem rs_R011_ueqv_R011NNNY_partial_16_0308_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_16_0308
        rs_R011_ueqv_R011NNNY_generator_16_0300_0311 =
      rs_R011_ueqv_R011NNNY_partial_16_0308 := by
  native_decide

/-- Coefficient term 309 from coefficient polynomial 16. -/
def rs_R011_ueqv_R011NNNY_coefficient_16_0309 : Poly :=
[
  term ((-13 : Rat) / 28) [(10, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 309 for generator 16. -/
def rs_R011_ueqv_R011NNNY_partial_16_0309 : Poly :=
[
  term ((-13 : Rat) / 14) [(6, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((13 : Rat) / 28) [(10, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 309 for generator 16. -/
theorem rs_R011_ueqv_R011NNNY_partial_16_0309_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_16_0309
        rs_R011_ueqv_R011NNNY_generator_16_0300_0311 =
      rs_R011_ueqv_R011NNNY_partial_16_0309 := by
  native_decide

/-- Coefficient term 310 from coefficient polynomial 16. -/
def rs_R011_ueqv_R011NNNY_coefficient_16_0310 : Poly :=
[
  term ((-3 : Rat) / 7) [(11, 1), (13, 1), (16, 1)]
]

/-- Partial product 310 for generator 16. -/
def rs_R011_ueqv_R011NNNY_partial_16_0310 : Poly :=
[
  term ((-6 : Rat) / 7) [(6, 1), (11, 1), (13, 1), (16, 1)],
  term ((3 : Rat) / 7) [(11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 310 for generator 16. -/
theorem rs_R011_ueqv_R011NNNY_partial_16_0310_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_16_0310
        rs_R011_ueqv_R011NNNY_generator_16_0300_0311 =
      rs_R011_ueqv_R011NNNY_partial_16_0310 := by
  native_decide

/-- Coefficient term 311 from coefficient polynomial 16. -/
def rs_R011_ueqv_R011NNNY_coefficient_16_0311 : Poly :=
[
  term ((6 : Rat) / 7) [(11, 2), (16, 1)]
]

/-- Partial product 311 for generator 16. -/
def rs_R011_ueqv_R011NNNY_partial_16_0311 : Poly :=
[
  term ((12 : Rat) / 7) [(6, 1), (11, 2), (16, 1)],
  term ((-6 : Rat) / 7) [(11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 311 for generator 16. -/
theorem rs_R011_ueqv_R011NNNY_partial_16_0311_valid :
    mulPoly rs_R011_ueqv_R011NNNY_coefficient_16_0311
        rs_R011_ueqv_R011NNNY_generator_16_0300_0311 =
      rs_R011_ueqv_R011NNNY_partial_16_0311 := by
  native_decide

/-- Partial products in this block. -/
def rs_R011_ueqv_R011NNNY_partials_16_0300_0311 : List Poly :=
[
  rs_R011_ueqv_R011NNNY_partial_16_0300,
  rs_R011_ueqv_R011NNNY_partial_16_0301,
  rs_R011_ueqv_R011NNNY_partial_16_0302,
  rs_R011_ueqv_R011NNNY_partial_16_0303,
  rs_R011_ueqv_R011NNNY_partial_16_0304,
  rs_R011_ueqv_R011NNNY_partial_16_0305,
  rs_R011_ueqv_R011NNNY_partial_16_0306,
  rs_R011_ueqv_R011NNNY_partial_16_0307,
  rs_R011_ueqv_R011NNNY_partial_16_0308,
  rs_R011_ueqv_R011NNNY_partial_16_0309,
  rs_R011_ueqv_R011NNNY_partial_16_0310,
  rs_R011_ueqv_R011NNNY_partial_16_0311
]

/-- Sum of partial products in this block. -/
def rs_R011_ueqv_R011NNNY_block_16_0300_0311 : Poly :=
[
  term ((-136 : Rat) / 7) [(6, 1), (9, 3), (10, 1), (15, 1), (16, 1)],
  term ((-768 : Rat) / 7) [(6, 1), (9, 3), (10, 1), (15, 3), (16, 1)],
  term ((34 : Rat) / 7) [(6, 1), (9, 3), (15, 1), (16, 1)],
  term ((192 : Rat) / 7) [(6, 1), (9, 3), (15, 3), (16, 1)],
  term ((80 : Rat) / 7) [(6, 1), (10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-20 : Rat) / 7) [(6, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((89 : Rat) / 28) [(6, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((89 : Rat) / 28) [(6, 1), (10, 1), (13, 2), (16, 1)],
  term ((-1 : Rat) / 7) [(6, 1), (10, 1), (16, 1)],
  term ((-13 : Rat) / 14) [(6, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-6 : Rat) / 7) [(6, 1), (11, 1), (13, 1), (16, 1)],
  term ((12 : Rat) / 7) [(6, 1), (11, 2), (16, 1)],
  term ((68 : Rat) / 7) [(9, 3), (10, 1), (15, 1), (16, 1)],
  term ((384 : Rat) / 7) [(9, 3), (10, 1), (15, 3), (16, 1)],
  term ((-17 : Rat) / 7) [(9, 3), (15, 1), (16, 1)],
  term ((-96 : Rat) / 7) [(9, 3), (15, 3), (16, 1)],
  term ((-40 : Rat) / 7) [(10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((10 : Rat) / 7) [(10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-89 : Rat) / 56) [(10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-89 : Rat) / 56) [(10, 1), (13, 2), (16, 1)],
  term ((1 : Rat) / 14) [(10, 1), (16, 1)],
  term ((13 : Rat) / 28) [(10, 2), (13, 1), (15, 1), (16, 1)],
  term ((3 : Rat) / 7) [(11, 1), (13, 1), (16, 1)],
  term ((-6 : Rat) / 7) [(11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 16, terms 300 through 311. -/
theorem rs_R011_ueqv_R011NNNY_block_16_0300_0311_valid :
    checkProductSumEq rs_R011_ueqv_R011NNNY_partials_16_0300_0311
      rs_R011_ueqv_R011NNNY_block_16_0300_0311 = true := by
  native_decide

end R011UeqvR011NNNYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
