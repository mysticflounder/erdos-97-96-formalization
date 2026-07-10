/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R005:u=v:R005YNY, term block 15:0-2

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R005UeqvR005YNYTermShards

/-- Generator polynomial 15 for relaxed split surplus certificate `R005:u=v:R005YNY`. -/
def rs_R005_ueqv_R005YNY_generator_15_0000_0002 : Poly :=
[
  term (2 : Rat) [(4, 1), (8, 1)],
  term (2 : Rat) [(5, 1), (9, 1)],
  term (-1 : Rat) [(8, 2)],
  term (-1 : Rat) [(9, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 15. -/
def rs_R005_ueqv_R005YNY_coefficient_15_0000 : Poly :=
[
  term ((103320 : Rat) / 3749) [(2, 1), (16, 1)]
]

/-- Partial product 0 for generator 15. -/
def rs_R005_ueqv_R005YNY_partial_15_0000 : Poly :=
[
  term ((206640 : Rat) / 3749) [(2, 1), (4, 1), (8, 1), (16, 1)],
  term ((206640 : Rat) / 3749) [(2, 1), (5, 1), (9, 1), (16, 1)],
  term ((-103320 : Rat) / 3749) [(2, 1), (8, 2), (16, 1)],
  term ((-103320 : Rat) / 3749) [(2, 1), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 15. -/
theorem rs_R005_ueqv_R005YNY_partial_15_0000_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_15_0000
        rs_R005_ueqv_R005YNY_generator_15_0000_0002 =
      rs_R005_ueqv_R005YNY_partial_15_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 15. -/
def rs_R005_ueqv_R005YNY_coefficient_15_0001 : Poly :=
[
  term ((37170 : Rat) / 3749) [(8, 1), (16, 1)]
]

/-- Partial product 1 for generator 15. -/
def rs_R005_ueqv_R005YNY_partial_15_0001 : Poly :=
[
  term ((74340 : Rat) / 3749) [(4, 1), (8, 2), (16, 1)],
  term ((74340 : Rat) / 3749) [(5, 1), (8, 1), (9, 1), (16, 1)],
  term ((-37170 : Rat) / 3749) [(8, 1), (9, 2), (16, 1)],
  term ((-37170 : Rat) / 3749) [(8, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 15. -/
theorem rs_R005_ueqv_R005YNY_partial_15_0001_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_15_0001
        rs_R005_ueqv_R005YNY_generator_15_0000_0002 =
      rs_R005_ueqv_R005YNY_partial_15_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 15. -/
def rs_R005_ueqv_R005YNY_coefficient_15_0002 : Poly :=
[
  term ((-58968 : Rat) / 3749) [(16, 1)]
]

/-- Partial product 2 for generator 15. -/
def rs_R005_ueqv_R005YNY_partial_15_0002 : Poly :=
[
  term ((-117936 : Rat) / 3749) [(4, 1), (8, 1), (16, 1)],
  term ((-117936 : Rat) / 3749) [(5, 1), (9, 1), (16, 1)],
  term ((58968 : Rat) / 3749) [(8, 2), (16, 1)],
  term ((58968 : Rat) / 3749) [(9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 15. -/
theorem rs_R005_ueqv_R005YNY_partial_15_0002_valid :
    mulPoly rs_R005_ueqv_R005YNY_coefficient_15_0002
        rs_R005_ueqv_R005YNY_generator_15_0000_0002 =
      rs_R005_ueqv_R005YNY_partial_15_0002 := by
  native_decide

/-- Partial products in this block. -/
def rs_R005_ueqv_R005YNY_partials_15_0000_0002 : List Poly :=
[
  rs_R005_ueqv_R005YNY_partial_15_0000,
  rs_R005_ueqv_R005YNY_partial_15_0001,
  rs_R005_ueqv_R005YNY_partial_15_0002
]

/-- Sum of partial products in this block. -/
def rs_R005_ueqv_R005YNY_block_15_0000_0002 : Poly :=
[
  term ((206640 : Rat) / 3749) [(2, 1), (4, 1), (8, 1), (16, 1)],
  term ((206640 : Rat) / 3749) [(2, 1), (5, 1), (9, 1), (16, 1)],
  term ((-103320 : Rat) / 3749) [(2, 1), (8, 2), (16, 1)],
  term ((-103320 : Rat) / 3749) [(2, 1), (9, 2), (16, 1)],
  term ((-117936 : Rat) / 3749) [(4, 1), (8, 1), (16, 1)],
  term ((74340 : Rat) / 3749) [(4, 1), (8, 2), (16, 1)],
  term ((74340 : Rat) / 3749) [(5, 1), (8, 1), (9, 1), (16, 1)],
  term ((-117936 : Rat) / 3749) [(5, 1), (9, 1), (16, 1)],
  term ((-37170 : Rat) / 3749) [(8, 1), (9, 2), (16, 1)],
  term ((58968 : Rat) / 3749) [(8, 2), (16, 1)],
  term ((-37170 : Rat) / 3749) [(8, 3), (16, 1)],
  term ((58968 : Rat) / 3749) [(9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 15, terms 0 through 2. -/
theorem rs_R005_ueqv_R005YNY_block_15_0000_0002_valid :
    checkProductSumEq rs_R005_ueqv_R005YNY_partials_15_0000_0002
      rs_R005_ueqv_R005YNY_block_15_0000_0002 = true := by
  native_decide

end R005UeqvR005YNYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
