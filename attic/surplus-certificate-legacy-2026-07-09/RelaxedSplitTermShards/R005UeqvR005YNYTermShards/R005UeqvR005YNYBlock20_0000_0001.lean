/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R005:u=v:R005YNY, term block 20:0-1

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R005UeqvR005YNYTermShards

/-- Generator polynomial 20 for relaxed split surplus certificate `R005:u=v:R005YNY`. -/
def rs_R005_ueqv_R005YNY_generator_20_0000_0001 : Poly :=
[
  term (-2 : Rat) [(0, 1), (8, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (9, 1)],
  term (1 : Rat) [(1, 2)],
  term (2 : Rat) [(2, 1), (8, 1)],
  term (-1 : Rat) [(2, 2)],
  term (2 : Rat) [(3, 1), (9, 1)],
  term (-1 : Rat) [(3, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 20. -/
def rs_R005_ueqv_R005YNY_coefficient_20_0000 : Poly :=
[
  term ((-51660 : Rat) / 3749) [(4, 1), (16, 1)]
]

/-- Partial product 0 for generator 20. -/
def rs_R005_ueqv_R005YNY_partial_20_0000 : Poly :=
[
  term ((103320 : Rat) / 3749) [(0, 1), (4, 1), (8, 1), (16, 1)],
  term ((-51660 : Rat) / 3749) [(0, 2), (4, 1), (16, 1)],
  term ((103320 : Rat) / 3749) [(1, 1), (4, 1), (9, 1), (16, 1)],
  term ((-51660 : Rat) / 3749) [(1, 2), (4, 1), (16, 1)],
  term ((-103320 : Rat) / 3749) [(2, 1), (4, 1), (8, 1), (16, 1)],
  term ((51660 : Rat) / 3749) [(2, 2), (4, 1), (16, 1)],
  term ((-103320 : Rat) / 3749) [(3, 1), (4, 1), (9, 1), (16, 1)],
  term ((51660 : Rat) / 3749) [(3, 2), (4, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 20. -/
theorem rs_R005_ueqv_R005YNY_partial_20_0000_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_20_0000
        rs_R005_ueqv_R005YNY_generator_20_0000_0001 =
      rs_R005_ueqv_R005YNY_partial_20_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 20. -/
def rs_R005_ueqv_R005YNY_coefficient_20_0001 : Poly :=
[
  term ((25830 : Rat) / 3749) [(16, 1)]
]

/-- Partial product 1 for generator 20. -/
def rs_R005_ueqv_R005YNY_partial_20_0001 : Poly :=
[
  term ((-51660 : Rat) / 3749) [(0, 1), (8, 1), (16, 1)],
  term ((25830 : Rat) / 3749) [(0, 2), (16, 1)],
  term ((-51660 : Rat) / 3749) [(1, 1), (9, 1), (16, 1)],
  term ((25830 : Rat) / 3749) [(1, 2), (16, 1)],
  term ((51660 : Rat) / 3749) [(2, 1), (8, 1), (16, 1)],
  term ((-25830 : Rat) / 3749) [(2, 2), (16, 1)],
  term ((51660 : Rat) / 3749) [(3, 1), (9, 1), (16, 1)],
  term ((-25830 : Rat) / 3749) [(3, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 20. -/
theorem rs_R005_ueqv_R005YNY_partial_20_0001_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_20_0001
        rs_R005_ueqv_R005YNY_generator_20_0000_0001 =
      rs_R005_ueqv_R005YNY_partial_20_0001 := by
  native_decide

/-- Partial products in this block. -/
def rs_R005_ueqv_R005YNY_partials_20_0000_0001 : List Poly :=
[
  rs_R005_ueqv_R005YNY_partial_20_0000,
  rs_R005_ueqv_R005YNY_partial_20_0001
]

/-- Sum of partial products in this block. -/
def rs_R005_ueqv_R005YNY_block_20_0000_0001 : Poly :=
[
  term ((103320 : Rat) / 3749) [(0, 1), (4, 1), (8, 1), (16, 1)],
  term ((-51660 : Rat) / 3749) [(0, 1), (8, 1), (16, 1)],
  term ((-51660 : Rat) / 3749) [(0, 2), (4, 1), (16, 1)],
  term ((25830 : Rat) / 3749) [(0, 2), (16, 1)],
  term ((103320 : Rat) / 3749) [(1, 1), (4, 1), (9, 1), (16, 1)],
  term ((-51660 : Rat) / 3749) [(1, 1), (9, 1), (16, 1)],
  term ((-51660 : Rat) / 3749) [(1, 2), (4, 1), (16, 1)],
  term ((25830 : Rat) / 3749) [(1, 2), (16, 1)],
  term ((-103320 : Rat) / 3749) [(2, 1), (4, 1), (8, 1), (16, 1)],
  term ((51660 : Rat) / 3749) [(2, 1), (8, 1), (16, 1)],
  term ((51660 : Rat) / 3749) [(2, 2), (4, 1), (16, 1)],
  term ((-25830 : Rat) / 3749) [(2, 2), (16, 1)],
  term ((-103320 : Rat) / 3749) [(3, 1), (4, 1), (9, 1), (16, 1)],
  term ((51660 : Rat) / 3749) [(3, 1), (9, 1), (16, 1)],
  term ((51660 : Rat) / 3749) [(3, 2), (4, 1), (16, 1)],
  term ((-25830 : Rat) / 3749) [(3, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 20, terms 0 through 1. -/
theorem rs_R005_ueqv_R005YNY_block_20_0000_0001_valid :
    checkProductSumEq rs_R005_ueqv_R005YNY_partials_20_0000_0001
      rs_R005_ueqv_R005YNY_block_20_0000_0001 = true := by
  native_decide

end R005UeqvR005YNYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
