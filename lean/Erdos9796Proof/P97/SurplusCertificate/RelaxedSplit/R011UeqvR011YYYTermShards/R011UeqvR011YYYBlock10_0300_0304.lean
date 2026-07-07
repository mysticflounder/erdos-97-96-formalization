/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R011:u=v:R011YYY, term block 10:300-304

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R011UeqvR011YYYTermShards

/-- Generator polynomial 10 for relaxed split surplus certificate `R011:u=v:R011YYY`. -/
def rs_R011_ueqv_R011YYY_generator_10_0300_0304 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(2, 1)]
]

/-- Coefficient term 300 from coefficient polynomial 10. -/
def rs_R011_ueqv_R011YYY_coefficient_10_0300 : Poly :=
[
  term (5 : Rat) [(13, 2), (16, 1)]
]

/-- Partial product 300 for generator 10. -/
def rs_R011_ueqv_R011YYY_partial_10_0300 : Poly :=
[
  term (10 : Rat) [(2, 1), (13, 2), (16, 1)],
  term (-5 : Rat) [(13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 300 for generator 10. -/
theorem rs_R011_ueqv_R011YYY_partial_10_0300_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_10_0300
        rs_R011_ueqv_R011YYY_generator_10_0300_0304 =
      rs_R011_ueqv_R011YYY_partial_10_0300 := by
  native_decide

/-- Coefficient term 301 from coefficient polynomial 10. -/
def rs_R011_ueqv_R011YYY_coefficient_10_0301 : Poly :=
[
  term (4 : Rat) [(13, 3), (15, 1), (16, 1)]
]

/-- Partial product 301 for generator 10. -/
def rs_R011_ueqv_R011YYY_partial_10_0301 : Poly :=
[
  term (8 : Rat) [(2, 1), (13, 3), (15, 1), (16, 1)],
  term (-4 : Rat) [(13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 301 for generator 10. -/
theorem rs_R011_ueqv_R011YYY_partial_10_0301_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_10_0301
        rs_R011_ueqv_R011YYY_generator_10_0300_0304 =
      rs_R011_ueqv_R011YYY_partial_10_0301 := by
  native_decide

/-- Coefficient term 302 from coefficient polynomial 10. -/
def rs_R011_ueqv_R011YYY_coefficient_10_0302 : Poly :=
[
  term ((-660 : Rat) / 227) [(14, 1), (15, 2), (16, 1)]
]

/-- Partial product 302 for generator 10. -/
def rs_R011_ueqv_R011YYY_partial_10_0302 : Poly :=
[
  term ((-1320 : Rat) / 227) [(2, 1), (14, 1), (15, 2), (16, 1)],
  term ((660 : Rat) / 227) [(14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 302 for generator 10. -/
theorem rs_R011_ueqv_R011YYY_partial_10_0302_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_10_0302
        rs_R011_ueqv_R011YYY_generator_10_0300_0304 =
      rs_R011_ueqv_R011YYY_partial_10_0302 := by
  native_decide

/-- Coefficient term 303 from coefficient polynomial 10. -/
def rs_R011_ueqv_R011YYY_coefficient_10_0303 : Poly :=
[
  term ((1796 : Rat) / 1135) [(14, 1), (16, 1)]
]

/-- Partial product 303 for generator 10. -/
def rs_R011_ueqv_R011YYY_partial_10_0303 : Poly :=
[
  term ((3592 : Rat) / 1135) [(2, 1), (14, 1), (16, 1)],
  term ((-1796 : Rat) / 1135) [(14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 303 for generator 10. -/
theorem rs_R011_ueqv_R011YYY_partial_10_0303_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_10_0303
        rs_R011_ueqv_R011YYY_generator_10_0300_0304 =
      rs_R011_ueqv_R011YYY_partial_10_0303 := by
  native_decide

/-- Coefficient term 304 from coefficient polynomial 10. -/
def rs_R011_ueqv_R011YYY_coefficient_10_0304 : Poly :=
[
  term ((258 : Rat) / 1135) [(15, 2), (16, 1)]
]

/-- Partial product 304 for generator 10. -/
def rs_R011_ueqv_R011YYY_partial_10_0304 : Poly :=
[
  term ((516 : Rat) / 1135) [(2, 1), (15, 2), (16, 1)],
  term ((-258 : Rat) / 1135) [(15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 304 for generator 10. -/
theorem rs_R011_ueqv_R011YYY_partial_10_0304_valid :
    mulPoly rs_R011_ueqv_R011YYY_coefficient_10_0304
        rs_R011_ueqv_R011YYY_generator_10_0300_0304 =
      rs_R011_ueqv_R011YYY_partial_10_0304 := by
  native_decide

/-- Partial products in this block. -/
def rs_R011_ueqv_R011YYY_partials_10_0300_0304 : List Poly :=
[
  rs_R011_ueqv_R011YYY_partial_10_0300,
  rs_R011_ueqv_R011YYY_partial_10_0301,
  rs_R011_ueqv_R011YYY_partial_10_0302,
  rs_R011_ueqv_R011YYY_partial_10_0303,
  rs_R011_ueqv_R011YYY_partial_10_0304
]

/-- Sum of partial products in this block. -/
def rs_R011_ueqv_R011YYY_block_10_0300_0304 : Poly :=
[
  term (10 : Rat) [(2, 1), (13, 2), (16, 1)],
  term (8 : Rat) [(2, 1), (13, 3), (15, 1), (16, 1)],
  term ((-1320 : Rat) / 227) [(2, 1), (14, 1), (15, 2), (16, 1)],
  term ((3592 : Rat) / 1135) [(2, 1), (14, 1), (16, 1)],
  term ((516 : Rat) / 1135) [(2, 1), (15, 2), (16, 1)],
  term (-5 : Rat) [(13, 2), (16, 1)],
  term (-4 : Rat) [(13, 3), (15, 1), (16, 1)],
  term ((660 : Rat) / 227) [(14, 1), (15, 2), (16, 1)],
  term ((-1796 : Rat) / 1135) [(14, 1), (16, 1)],
  term ((-258 : Rat) / 1135) [(15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 10, terms 300 through 304. -/
theorem rs_R011_ueqv_R011YYY_block_10_0300_0304_valid :
    checkProductSumEq rs_R011_ueqv_R011YYY_partials_10_0300_0304
      rs_R011_ueqv_R011YYY_block_10_0300_0304 = true := by
  native_decide

end R011UeqvR011YYYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
