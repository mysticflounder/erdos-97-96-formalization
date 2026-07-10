/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R005:u=v:R005YNY, term block 22:0-1

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R005UeqvR005YNYTermShards

/-- Generator polynomial 22 for relaxed split surplus certificate `R005:u=v:R005YNY`. -/
def rs_R005_ueqv_R005YNY_generator_22_0000_0001 : Poly :=
[
  term (-2 : Rat) [(0, 1), (10, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (11, 1)],
  term (1 : Rat) [(1, 2)],
  term (2 : Rat) [(4, 1), (10, 1)],
  term (-1 : Rat) [(4, 2)],
  term (2 : Rat) [(5, 1), (11, 1)],
  term (-1 : Rat) [(5, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 22. -/
def rs_R005_ueqv_R005YNY_coefficient_22_0000 : Poly :=
[
  term ((-148302 : Rat) / 3749) [(8, 1), (16, 1)]
]

/-- Partial product 0 for generator 22. -/
def rs_R005_ueqv_R005YNY_partial_22_0000 : Poly :=
[
  term ((296604 : Rat) / 3749) [(0, 1), (8, 1), (10, 1), (16, 1)],
  term ((-148302 : Rat) / 3749) [(0, 2), (8, 1), (16, 1)],
  term ((296604 : Rat) / 3749) [(1, 1), (8, 1), (11, 1), (16, 1)],
  term ((-148302 : Rat) / 3749) [(1, 2), (8, 1), (16, 1)],
  term ((-296604 : Rat) / 3749) [(4, 1), (8, 1), (10, 1), (16, 1)],
  term ((148302 : Rat) / 3749) [(4, 2), (8, 1), (16, 1)],
  term ((-296604 : Rat) / 3749) [(5, 1), (8, 1), (11, 1), (16, 1)],
  term ((148302 : Rat) / 3749) [(5, 2), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 22. -/
theorem rs_R005_ueqv_R005YNY_partial_22_0000_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_22_0000
        rs_R005_ueqv_R005YNY_generator_22_0000_0001 =
      rs_R005_ueqv_R005YNY_partial_22_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 22. -/
def rs_R005_ueqv_R005YNY_coefficient_22_0001 : Poly :=
[
  term ((64050 : Rat) / 3749) [(16, 1)]
]

/-- Partial product 1 for generator 22. -/
def rs_R005_ueqv_R005YNY_partial_22_0001 : Poly :=
[
  term ((-128100 : Rat) / 3749) [(0, 1), (10, 1), (16, 1)],
  term ((64050 : Rat) / 3749) [(0, 2), (16, 1)],
  term ((-128100 : Rat) / 3749) [(1, 1), (11, 1), (16, 1)],
  term ((64050 : Rat) / 3749) [(1, 2), (16, 1)],
  term ((128100 : Rat) / 3749) [(4, 1), (10, 1), (16, 1)],
  term ((-64050 : Rat) / 3749) [(4, 2), (16, 1)],
  term ((128100 : Rat) / 3749) [(5, 1), (11, 1), (16, 1)],
  term ((-64050 : Rat) / 3749) [(5, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 22. -/
theorem rs_R005_ueqv_R005YNY_partial_22_0001_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_22_0001
        rs_R005_ueqv_R005YNY_generator_22_0000_0001 =
      rs_R005_ueqv_R005YNY_partial_22_0001 := by
  native_decide

/-- Partial products in this block. -/
def rs_R005_ueqv_R005YNY_partials_22_0000_0001 : List Poly :=
[
  rs_R005_ueqv_R005YNY_partial_22_0000,
  rs_R005_ueqv_R005YNY_partial_22_0001
]

/-- Sum of partial products in this block. -/
def rs_R005_ueqv_R005YNY_block_22_0000_0001 : Poly :=
[
  term ((296604 : Rat) / 3749) [(0, 1), (8, 1), (10, 1), (16, 1)],
  term ((-128100 : Rat) / 3749) [(0, 1), (10, 1), (16, 1)],
  term ((-148302 : Rat) / 3749) [(0, 2), (8, 1), (16, 1)],
  term ((64050 : Rat) / 3749) [(0, 2), (16, 1)],
  term ((296604 : Rat) / 3749) [(1, 1), (8, 1), (11, 1), (16, 1)],
  term ((-128100 : Rat) / 3749) [(1, 1), (11, 1), (16, 1)],
  term ((-148302 : Rat) / 3749) [(1, 2), (8, 1), (16, 1)],
  term ((64050 : Rat) / 3749) [(1, 2), (16, 1)],
  term ((-296604 : Rat) / 3749) [(4, 1), (8, 1), (10, 1), (16, 1)],
  term ((128100 : Rat) / 3749) [(4, 1), (10, 1), (16, 1)],
  term ((148302 : Rat) / 3749) [(4, 2), (8, 1), (16, 1)],
  term ((-64050 : Rat) / 3749) [(4, 2), (16, 1)],
  term ((-296604 : Rat) / 3749) [(5, 1), (8, 1), (11, 1), (16, 1)],
  term ((128100 : Rat) / 3749) [(5, 1), (11, 1), (16, 1)],
  term ((148302 : Rat) / 3749) [(5, 2), (8, 1), (16, 1)],
  term ((-64050 : Rat) / 3749) [(5, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 22, terms 0 through 1. -/
theorem rs_R005_ueqv_R005YNY_block_22_0000_0001_valid :
    checkProductSumEq rs_R005_ueqv_R005YNY_partials_22_0000_0001
      rs_R005_ueqv_R005YNY_block_22_0000_0001 = true := by
  native_decide

end R005UeqvR005YNYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
