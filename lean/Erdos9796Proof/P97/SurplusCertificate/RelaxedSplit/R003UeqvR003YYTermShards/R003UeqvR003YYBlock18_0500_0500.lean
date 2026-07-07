/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R003:u=v:R003YY, term block 18:500-500

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R003UeqvR003YYTermShards

/-- Generator polynomial 18 for relaxed split surplus certificate `R003:u=v:R003YY`. -/
def rs_R003_ueqv_R003YY_generator_18_0500_0500 : Poly :=
[
  term (2 : Rat) [(6, 1), (8, 1)],
  term (2 : Rat) [(7, 1), (9, 1)],
  term (-1 : Rat) [(8, 2)],
  term (-1 : Rat) [(9, 2)]
]

/-- Coefficient term 500 from coefficient polynomial 18. -/
def rs_R003_ueqv_R003YY_coefficient_18_0500 : Poly :=
[
  term ((-3 : Rat) / 10) [(16, 1)]
]

/-- Partial product 500 for generator 18. -/
def rs_R003_ueqv_R003YY_partial_18_0500 : Poly :=
[
  term ((-3 : Rat) / 5) [(6, 1), (8, 1), (16, 1)],
  term ((-3 : Rat) / 5) [(7, 1), (9, 1), (16, 1)],
  term ((3 : Rat) / 10) [(8, 2), (16, 1)],
  term ((3 : Rat) / 10) [(9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 500 for generator 18. -/
theorem rs_R003_ueqv_R003YY_partial_18_0500_valid :
    mulPoly rs_R003_ueqv_R003YY_coefficient_18_0500
        rs_R003_ueqv_R003YY_generator_18_0500_0500 =
      rs_R003_ueqv_R003YY_partial_18_0500 := by
  native_decide

/-- Partial products in this block. -/
def rs_R003_ueqv_R003YY_partials_18_0500_0500 : List Poly :=
[
  rs_R003_ueqv_R003YY_partial_18_0500
]

/-- Sum of partial products in this block. -/
def rs_R003_ueqv_R003YY_block_18_0500_0500 : Poly :=
[
  term ((-3 : Rat) / 5) [(6, 1), (8, 1), (16, 1)],
  term ((-3 : Rat) / 5) [(7, 1), (9, 1), (16, 1)],
  term ((3 : Rat) / 10) [(8, 2), (16, 1)],
  term ((3 : Rat) / 10) [(9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 18, terms 500 through 500. -/
theorem rs_R003_ueqv_R003YY_block_18_0500_0500_valid :
    checkProductSumEq rs_R003_ueqv_R003YY_partials_18_0500_0500
      rs_R003_ueqv_R003YY_block_18_0500_0500 = true := by
  native_decide

end R003UeqvR003YYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
