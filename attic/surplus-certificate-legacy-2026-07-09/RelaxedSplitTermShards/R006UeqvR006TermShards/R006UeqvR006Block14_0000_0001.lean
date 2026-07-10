/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R006:u=v:R006, term block 14:0-1

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R006UeqvR006TermShards

/-- Generator polynomial 14 for relaxed split surplus certificate `R006:u=v:R006`. -/
def rs_R006_ueqv_R006_generator_14_0000_0001 : Poly :=
[
  term (-2 : Rat) [(2, 1), (4, 1)],
  term (1 : Rat) [(2, 2)],
  term (-2 : Rat) [(3, 1), (5, 1)],
  term (1 : Rat) [(3, 2)],
  term (2 : Rat) [(4, 1), (8, 1)],
  term (2 : Rat) [(5, 1), (9, 1)],
  term (-1 : Rat) [(8, 2)],
  term (-1 : Rat) [(9, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 14. -/
def rs_R006_ueqv_R006_coefficient_14_0000 : Poly :=
[
  term ((-72 : Rat) / 35) [(1, 1), (13, 1)]
]

/-- Partial product 0 for generator 14. -/
def rs_R006_ueqv_R006_partial_14_0000 : Poly :=
[
  term ((144 : Rat) / 35) [(1, 1), (2, 1), (4, 1), (13, 1)],
  term ((-72 : Rat) / 35) [(1, 1), (2, 2), (13, 1)],
  term ((144 : Rat) / 35) [(1, 1), (3, 1), (5, 1), (13, 1)],
  term ((-72 : Rat) / 35) [(1, 1), (3, 2), (13, 1)],
  term ((-144 : Rat) / 35) [(1, 1), (4, 1), (8, 1), (13, 1)],
  term ((-144 : Rat) / 35) [(1, 1), (5, 1), (9, 1), (13, 1)],
  term ((72 : Rat) / 35) [(1, 1), (8, 2), (13, 1)],
  term ((72 : Rat) / 35) [(1, 1), (9, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 14. -/
theorem rs_R006_ueqv_R006_partial_14_0000_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_14_0000
        rs_R006_ueqv_R006_generator_14_0000_0001 =
      rs_R006_ueqv_R006_partial_14_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 14. -/
def rs_R006_ueqv_R006_coefficient_14_0001 : Poly :=
[
  term ((72 : Rat) / 35) [(11, 1), (13, 1)]
]

/-- Partial product 1 for generator 14. -/
def rs_R006_ueqv_R006_partial_14_0001 : Poly :=
[
  term ((-144 : Rat) / 35) [(2, 1), (4, 1), (11, 1), (13, 1)],
  term ((72 : Rat) / 35) [(2, 2), (11, 1), (13, 1)],
  term ((-144 : Rat) / 35) [(3, 1), (5, 1), (11, 1), (13, 1)],
  term ((72 : Rat) / 35) [(3, 2), (11, 1), (13, 1)],
  term ((144 : Rat) / 35) [(4, 1), (8, 1), (11, 1), (13, 1)],
  term ((144 : Rat) / 35) [(5, 1), (9, 1), (11, 1), (13, 1)],
  term ((-72 : Rat) / 35) [(8, 2), (11, 1), (13, 1)],
  term ((-72 : Rat) / 35) [(9, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 14. -/
theorem rs_R006_ueqv_R006_partial_14_0001_valid :
    mulPoly rs_R006_ueqv_R006_coefficient_14_0001
        rs_R006_ueqv_R006_generator_14_0000_0001 =
      rs_R006_ueqv_R006_partial_14_0001 := by
  native_decide

/-- Partial products in this block. -/
def rs_R006_ueqv_R006_partials_14_0000_0001 : List Poly :=
[
  rs_R006_ueqv_R006_partial_14_0000,
  rs_R006_ueqv_R006_partial_14_0001
]

/-- Sum of partial products in this block. -/
def rs_R006_ueqv_R006_block_14_0000_0001 : Poly :=
[
  term ((144 : Rat) / 35) [(1, 1), (2, 1), (4, 1), (13, 1)],
  term ((-72 : Rat) / 35) [(1, 1), (2, 2), (13, 1)],
  term ((144 : Rat) / 35) [(1, 1), (3, 1), (5, 1), (13, 1)],
  term ((-72 : Rat) / 35) [(1, 1), (3, 2), (13, 1)],
  term ((-144 : Rat) / 35) [(1, 1), (4, 1), (8, 1), (13, 1)],
  term ((-144 : Rat) / 35) [(1, 1), (5, 1), (9, 1), (13, 1)],
  term ((72 : Rat) / 35) [(1, 1), (8, 2), (13, 1)],
  term ((72 : Rat) / 35) [(1, 1), (9, 2), (13, 1)],
  term ((-144 : Rat) / 35) [(2, 1), (4, 1), (11, 1), (13, 1)],
  term ((72 : Rat) / 35) [(2, 2), (11, 1), (13, 1)],
  term ((-144 : Rat) / 35) [(3, 1), (5, 1), (11, 1), (13, 1)],
  term ((72 : Rat) / 35) [(3, 2), (11, 1), (13, 1)],
  term ((144 : Rat) / 35) [(4, 1), (8, 1), (11, 1), (13, 1)],
  term ((144 : Rat) / 35) [(5, 1), (9, 1), (11, 1), (13, 1)],
  term ((-72 : Rat) / 35) [(8, 2), (11, 1), (13, 1)],
  term ((-72 : Rat) / 35) [(9, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 14, terms 0 through 1. -/
theorem rs_R006_ueqv_R006_block_14_0000_0001_valid :
    checkProductSumEq rs_R006_ueqv_R006_partials_14_0000_0001
      rs_R006_ueqv_R006_block_14_0000_0001 = true := by
  native_decide

end R006UeqvR006TermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
