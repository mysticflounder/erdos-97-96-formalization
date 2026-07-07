/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R005:u=v:R005NYN, term block 10:800-801

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R005UeqvR005NYNTermShards

/-- Generator polynomial 10 for relaxed split surplus certificate `R005:u=v:R005NYN`. -/
def rs_R005_ueqv_R005NYN_generator_10_0800_0801 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(2, 1)]
]

/-- Coefficient term 800 from coefficient polynomial 10. -/
def rs_R005_ueqv_R005NYN_coefficient_10_0800 : Poly :=
[
  term ((-2007040 : Rat) / 158397) [(15, 4)]
]

/-- Partial product 800 for generator 10. -/
def rs_R005_ueqv_R005NYN_partial_10_0800 : Poly :=
[
  term ((-4014080 : Rat) / 158397) [(2, 1), (15, 4)],
  term ((2007040 : Rat) / 158397) [(15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 800 for generator 10. -/
theorem rs_R005_ueqv_R005NYN_partial_10_0800_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_10_0800
        rs_R005_ueqv_R005NYN_generator_10_0800_0801 =
      rs_R005_ueqv_R005NYN_partial_10_0800 := by
  native_decide

/-- Coefficient term 801 from coefficient polynomial 10. -/
def rs_R005_ueqv_R005NYN_coefficient_10_0801 : Poly :=
[
  term ((9973120 : Rat) / 385571) [(15, 4), (16, 1)]
]

/-- Partial product 801 for generator 10. -/
def rs_R005_ueqv_R005NYN_partial_10_0801 : Poly :=
[
  term ((19946240 : Rat) / 385571) [(2, 1), (15, 4), (16, 1)],
  term ((-9973120 : Rat) / 385571) [(15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 801 for generator 10. -/
theorem rs_R005_ueqv_R005NYN_partial_10_0801_valid :
    mulPoly rs_R005_ueqv_R005NYN_coefficient_10_0801
        rs_R005_ueqv_R005NYN_generator_10_0800_0801 =
      rs_R005_ueqv_R005NYN_partial_10_0801 := by
  native_decide

/-- Partial products in this block. -/
def rs_R005_ueqv_R005NYN_partials_10_0800_0801 : List Poly :=
[
  rs_R005_ueqv_R005NYN_partial_10_0800,
  rs_R005_ueqv_R005NYN_partial_10_0801
]

/-- Sum of partial products in this block. -/
def rs_R005_ueqv_R005NYN_block_10_0800_0801 : Poly :=
[
  term ((-4014080 : Rat) / 158397) [(2, 1), (15, 4)],
  term ((19946240 : Rat) / 385571) [(2, 1), (15, 4), (16, 1)],
  term ((2007040 : Rat) / 158397) [(15, 4)],
  term ((-9973120 : Rat) / 385571) [(15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 10, terms 800 through 801. -/
theorem rs_R005_ueqv_R005NYN_block_10_0800_0801_valid :
    checkProductSumEq rs_R005_ueqv_R005NYN_partials_10_0800_0801
      rs_R005_ueqv_R005NYN_block_10_0800_0801 = true := by
  native_decide

end R005UeqvR005NYNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
