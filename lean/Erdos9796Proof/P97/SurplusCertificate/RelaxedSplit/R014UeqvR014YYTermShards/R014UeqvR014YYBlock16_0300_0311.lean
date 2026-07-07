/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R014:u=v:R014YY, term block 16:300-311

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R014UeqvR014YYTermShards

/-- Generator polynomial 16 for relaxed split surplus certificate `R014:u=v:R014YY`. -/
def rs_R014_ueqv_R014YY_generator_16_0300_0311 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(6, 1)]
]

/-- Coefficient term 300 from coefficient polynomial 16. -/
def rs_R014_ueqv_R014YY_coefficient_16_0300 : Poly :=
[
  term ((9 : Rat) / 2) [(13, 2), (15, 2), (16, 1)]
]

/-- Partial product 300 for generator 16. -/
def rs_R014_ueqv_R014YY_partial_16_0300 : Poly :=
[
  term (9 : Rat) [(6, 1), (13, 2), (15, 2), (16, 1)],
  term ((-9 : Rat) / 2) [(13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 300 for generator 16. -/
theorem rs_R014_ueqv_R014YY_partial_16_0300_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_16_0300
        rs_R014_ueqv_R014YY_generator_16_0300_0311 =
      rs_R014_ueqv_R014YY_partial_16_0300 := by
  native_decide

/-- Coefficient term 301 from coefficient polynomial 16. -/
def rs_R014_ueqv_R014YY_coefficient_16_0301 : Poly :=
[
  term ((1122283 : Rat) / 55440) [(14, 1)]
]

/-- Partial product 301 for generator 16. -/
def rs_R014_ueqv_R014YY_partial_16_0301 : Poly :=
[
  term ((1122283 : Rat) / 27720) [(6, 1), (14, 1)],
  term ((-1122283 : Rat) / 55440) [(14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 301 for generator 16. -/
theorem rs_R014_ueqv_R014YY_partial_16_0301_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_16_0301
        rs_R014_ueqv_R014YY_generator_16_0300_0311 =
      rs_R014_ueqv_R014YY_partial_16_0301 := by
  native_decide

/-- Coefficient term 302 from coefficient polynomial 16. -/
def rs_R014_ueqv_R014YY_coefficient_16_0302 : Poly :=
[
  term ((-439189 : Rat) / 9240) [(14, 1), (15, 2)]
]

/-- Partial product 302 for generator 16. -/
def rs_R014_ueqv_R014YY_partial_16_0302 : Poly :=
[
  term ((-439189 : Rat) / 4620) [(6, 1), (14, 1), (15, 2)],
  term ((439189 : Rat) / 9240) [(14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 302 for generator 16. -/
theorem rs_R014_ueqv_R014YY_partial_16_0302_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_16_0302
        rs_R014_ueqv_R014YY_generator_16_0300_0311 =
      rs_R014_ueqv_R014YY_partial_16_0302 := by
  native_decide

/-- Coefficient term 303 from coefficient polynomial 16. -/
def rs_R014_ueqv_R014YY_coefficient_16_0303 : Poly :=
[
  term ((31 : Rat) / 20) [(14, 1), (15, 2), (16, 1)]
]

/-- Partial product 303 for generator 16. -/
def rs_R014_ueqv_R014YY_partial_16_0303 : Poly :=
[
  term ((31 : Rat) / 10) [(6, 1), (14, 1), (15, 2), (16, 1)],
  term ((-31 : Rat) / 20) [(14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 303 for generator 16. -/
theorem rs_R014_ueqv_R014YY_partial_16_0303_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_16_0303
        rs_R014_ueqv_R014YY_generator_16_0300_0311 =
      rs_R014_ueqv_R014YY_partial_16_0303 := by
  native_decide

/-- Coefficient term 304 from coefficient polynomial 16. -/
def rs_R014_ueqv_R014YY_coefficient_16_0304 : Poly :=
[
  term ((-20733499 : Rat) / 110880) [(14, 2)]
]

/-- Partial product 304 for generator 16. -/
def rs_R014_ueqv_R014YY_partial_16_0304 : Poly :=
[
  term ((-20733499 : Rat) / 55440) [(6, 1), (14, 2)],
  term ((20733499 : Rat) / 110880) [(14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 304 for generator 16. -/
theorem rs_R014_ueqv_R014YY_partial_16_0304_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_16_0304
        rs_R014_ueqv_R014YY_generator_16_0300_0311 =
      rs_R014_ueqv_R014YY_partial_16_0304 := by
  native_decide

/-- Coefficient term 305 from coefficient polynomial 16. -/
def rs_R014_ueqv_R014YY_coefficient_16_0305 : Poly :=
[
  term (-2 : Rat) [(14, 2), (15, 2)]
]

/-- Partial product 305 for generator 16. -/
def rs_R014_ueqv_R014YY_partial_16_0305 : Poly :=
[
  term (-4 : Rat) [(6, 1), (14, 2), (15, 2)],
  term (2 : Rat) [(14, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 305 for generator 16. -/
theorem rs_R014_ueqv_R014YY_partial_16_0305_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_16_0305
        rs_R014_ueqv_R014YY_generator_16_0300_0311 =
      rs_R014_ueqv_R014YY_partial_16_0305 := by
  native_decide

/-- Coefficient term 306 from coefficient polynomial 16. -/
def rs_R014_ueqv_R014YY_coefficient_16_0306 : Poly :=
[
  term (-6 : Rat) [(14, 2), (15, 2), (16, 1)]
]

/-- Partial product 306 for generator 16. -/
def rs_R014_ueqv_R014YY_partial_16_0306 : Poly :=
[
  term (-12 : Rat) [(6, 1), (14, 2), (15, 2), (16, 1)],
  term (6 : Rat) [(14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 306 for generator 16. -/
theorem rs_R014_ueqv_R014YY_partial_16_0306_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_16_0306
        rs_R014_ueqv_R014YY_generator_16_0300_0311 =
      rs_R014_ueqv_R014YY_partial_16_0306 := by
  native_decide

/-- Coefficient term 307 from coefficient polynomial 16. -/
def rs_R014_ueqv_R014YY_coefficient_16_0307 : Poly :=
[
  term ((-231337 : Rat) / 4620) [(14, 3)]
]

/-- Partial product 307 for generator 16. -/
def rs_R014_ueqv_R014YY_partial_16_0307 : Poly :=
[
  term ((-231337 : Rat) / 2310) [(6, 1), (14, 3)],
  term ((231337 : Rat) / 4620) [(14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 307 for generator 16. -/
theorem rs_R014_ueqv_R014YY_partial_16_0307_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_16_0307
        rs_R014_ueqv_R014YY_generator_16_0300_0311 =
      rs_R014_ueqv_R014YY_partial_16_0307 := by
  native_decide

/-- Coefficient term 308 from coefficient polynomial 16. -/
def rs_R014_ueqv_R014YY_coefficient_16_0308 : Poly :=
[
  term ((-6342173 : Rat) / 110880) [(15, 2)]
]

/-- Partial product 308 for generator 16. -/
def rs_R014_ueqv_R014YY_partial_16_0308 : Poly :=
[
  term ((-6342173 : Rat) / 55440) [(6, 1), (15, 2)],
  term ((6342173 : Rat) / 110880) [(15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 308 for generator 16. -/
theorem rs_R014_ueqv_R014YY_partial_16_0308_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_16_0308
        rs_R014_ueqv_R014YY_generator_16_0300_0311 =
      rs_R014_ueqv_R014YY_partial_16_0308 := by
  native_decide

/-- Coefficient term 309 from coefficient polynomial 16. -/
def rs_R014_ueqv_R014YY_coefficient_16_0309 : Poly :=
[
  term ((37 : Rat) / 5) [(15, 2), (16, 1)]
]

/-- Partial product 309 for generator 16. -/
def rs_R014_ueqv_R014YY_partial_16_0309 : Poly :=
[
  term ((74 : Rat) / 5) [(6, 1), (15, 2), (16, 1)],
  term ((-37 : Rat) / 5) [(15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 309 for generator 16. -/
theorem rs_R014_ueqv_R014YY_partial_16_0309_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_16_0309
        rs_R014_ueqv_R014YY_generator_16_0300_0311 =
      rs_R014_ueqv_R014YY_partial_16_0309 := by
  native_decide

/-- Coefficient term 310 from coefficient polynomial 16. -/
def rs_R014_ueqv_R014YY_coefficient_16_0310 : Poly :=
[
  term (-2 : Rat) [(15, 4)]
]

/-- Partial product 310 for generator 16. -/
def rs_R014_ueqv_R014YY_partial_16_0310 : Poly :=
[
  term (-4 : Rat) [(6, 1), (15, 4)],
  term (2 : Rat) [(15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 310 for generator 16. -/
theorem rs_R014_ueqv_R014YY_partial_16_0310_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_16_0310
        rs_R014_ueqv_R014YY_generator_16_0300_0311 =
      rs_R014_ueqv_R014YY_partial_16_0310 := by
  native_decide

/-- Coefficient term 311 from coefficient polynomial 16. -/
def rs_R014_ueqv_R014YY_coefficient_16_0311 : Poly :=
[
  term (-6 : Rat) [(15, 4), (16, 1)]
]

/-- Partial product 311 for generator 16. -/
def rs_R014_ueqv_R014YY_partial_16_0311 : Poly :=
[
  term (-12 : Rat) [(6, 1), (15, 4), (16, 1)],
  term (6 : Rat) [(15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 311 for generator 16. -/
theorem rs_R014_ueqv_R014YY_partial_16_0311_valid :
    mulPoly rs_R014_ueqv_R014YY_coefficient_16_0311
        rs_R014_ueqv_R014YY_generator_16_0300_0311 =
      rs_R014_ueqv_R014YY_partial_16_0311 := by
  native_decide

/-- Partial products in this block. -/
def rs_R014_ueqv_R014YY_partials_16_0300_0311 : List Poly :=
[
  rs_R014_ueqv_R014YY_partial_16_0300,
  rs_R014_ueqv_R014YY_partial_16_0301,
  rs_R014_ueqv_R014YY_partial_16_0302,
  rs_R014_ueqv_R014YY_partial_16_0303,
  rs_R014_ueqv_R014YY_partial_16_0304,
  rs_R014_ueqv_R014YY_partial_16_0305,
  rs_R014_ueqv_R014YY_partial_16_0306,
  rs_R014_ueqv_R014YY_partial_16_0307,
  rs_R014_ueqv_R014YY_partial_16_0308,
  rs_R014_ueqv_R014YY_partial_16_0309,
  rs_R014_ueqv_R014YY_partial_16_0310,
  rs_R014_ueqv_R014YY_partial_16_0311
]

/-- Sum of partial products in this block. -/
def rs_R014_ueqv_R014YY_block_16_0300_0311 : Poly :=
[
  term (9 : Rat) [(6, 1), (13, 2), (15, 2), (16, 1)],
  term ((1122283 : Rat) / 27720) [(6, 1), (14, 1)],
  term ((-439189 : Rat) / 4620) [(6, 1), (14, 1), (15, 2)],
  term ((31 : Rat) / 10) [(6, 1), (14, 1), (15, 2), (16, 1)],
  term ((-20733499 : Rat) / 55440) [(6, 1), (14, 2)],
  term (-4 : Rat) [(6, 1), (14, 2), (15, 2)],
  term (-12 : Rat) [(6, 1), (14, 2), (15, 2), (16, 1)],
  term ((-231337 : Rat) / 2310) [(6, 1), (14, 3)],
  term ((-6342173 : Rat) / 55440) [(6, 1), (15, 2)],
  term ((74 : Rat) / 5) [(6, 1), (15, 2), (16, 1)],
  term (-4 : Rat) [(6, 1), (15, 4)],
  term (-12 : Rat) [(6, 1), (15, 4), (16, 1)],
  term ((-9 : Rat) / 2) [(13, 2), (15, 2), (16, 1)],
  term ((-1122283 : Rat) / 55440) [(14, 1)],
  term ((439189 : Rat) / 9240) [(14, 1), (15, 2)],
  term ((-31 : Rat) / 20) [(14, 1), (15, 2), (16, 1)],
  term ((20733499 : Rat) / 110880) [(14, 2)],
  term (2 : Rat) [(14, 2), (15, 2)],
  term (6 : Rat) [(14, 2), (15, 2), (16, 1)],
  term ((231337 : Rat) / 4620) [(14, 3)],
  term ((6342173 : Rat) / 110880) [(15, 2)],
  term ((-37 : Rat) / 5) [(15, 2), (16, 1)],
  term (2 : Rat) [(15, 4)],
  term (6 : Rat) [(15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 16, terms 300 through 311. -/
theorem rs_R014_ueqv_R014YY_block_16_0300_0311_valid :
    checkProductSumEq rs_R014_ueqv_R014YY_partials_16_0300_0311
      rs_R014_ueqv_R014YY_block_16_0300_0311 = true := by
  native_decide

end R014UeqvR014YYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
