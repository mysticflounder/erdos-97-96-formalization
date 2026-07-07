/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009YNNNN, term block 10:0-2

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009YNNNNTermShards

/-- Generator polynomial 10 for relaxed split surplus certificate `R009:u=v:R009YNNNN`. -/
def rs_R009_ueqv_R009YNNNN_generator_10_0000_0002 : Poly :=
[
  term (1 : Rat) [],
  term (-2 : Rat) [(2, 1)],
  term (2 : Rat) [(2, 1), (4, 1)],
  term (2 : Rat) [(3, 1), (5, 1)],
  term (-1 : Rat) [(4, 2)],
  term (-1 : Rat) [(5, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009YNNNN_coefficient_10_0000 : Poly :=
[
  term ((-160 : Rat) / 21) []
]

/-- Partial product 0 for generator 10. -/
def rs_R009_ueqv_R009YNNNN_partial_10_0000 : Poly :=
[
  term ((-160 : Rat) / 21) [],
  term ((320 : Rat) / 21) [(2, 1)],
  term ((-320 : Rat) / 21) [(2, 1), (4, 1)],
  term ((-320 : Rat) / 21) [(3, 1), (5, 1)],
  term ((160 : Rat) / 21) [(4, 2)],
  term ((160 : Rat) / 21) [(5, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 10. -/
theorem rs_R009_ueqv_R009YNNNN_partial_10_0000_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_10_0000
        rs_R009_ueqv_R009YNNNN_generator_10_0000_0002 =
      rs_R009_ueqv_R009YNNNN_partial_10_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009YNNNN_coefficient_10_0001 : Poly :=
[
  term ((80 : Rat) / 7) [(14, 1)]
]

/-- Partial product 1 for generator 10. -/
def rs_R009_ueqv_R009YNNNN_partial_10_0001 : Poly :=
[
  term ((160 : Rat) / 7) [(2, 1), (4, 1), (14, 1)],
  term ((-160 : Rat) / 7) [(2, 1), (14, 1)],
  term ((160 : Rat) / 7) [(3, 1), (5, 1), (14, 1)],
  term ((-80 : Rat) / 7) [(4, 2), (14, 1)],
  term ((-80 : Rat) / 7) [(5, 2), (14, 1)],
  term ((80 : Rat) / 7) [(14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 10. -/
theorem rs_R009_ueqv_R009YNNNN_partial_10_0001_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_10_0001
        rs_R009_ueqv_R009YNNNN_generator_10_0000_0002 =
      rs_R009_ueqv_R009YNNNN_partial_10_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 10. -/
def rs_R009_ueqv_R009YNNNN_coefficient_10_0002 : Poly :=
[
  term ((24320 : Rat) / 343) [(15, 2)]
]

/-- Partial product 2 for generator 10. -/
def rs_R009_ueqv_R009YNNNN_partial_10_0002 : Poly :=
[
  term ((48640 : Rat) / 343) [(2, 1), (4, 1), (15, 2)],
  term ((-48640 : Rat) / 343) [(2, 1), (15, 2)],
  term ((48640 : Rat) / 343) [(3, 1), (5, 1), (15, 2)],
  term ((-24320 : Rat) / 343) [(4, 2), (15, 2)],
  term ((-24320 : Rat) / 343) [(5, 2), (15, 2)],
  term ((24320 : Rat) / 343) [(15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 10. -/
theorem rs_R009_ueqv_R009YNNNN_partial_10_0002_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_10_0002
        rs_R009_ueqv_R009YNNNN_generator_10_0000_0002 =
      rs_R009_ueqv_R009YNNNN_partial_10_0002 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009YNNNN_partials_10_0000_0002 : List Poly :=
[
  rs_R009_ueqv_R009YNNNN_partial_10_0000,
  rs_R009_ueqv_R009YNNNN_partial_10_0001,
  rs_R009_ueqv_R009YNNNN_partial_10_0002
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009YNNNN_block_10_0000_0002 : Poly :=
[
  term ((-160 : Rat) / 21) [],
  term ((320 : Rat) / 21) [(2, 1)],
  term ((-320 : Rat) / 21) [(2, 1), (4, 1)],
  term ((160 : Rat) / 7) [(2, 1), (4, 1), (14, 1)],
  term ((48640 : Rat) / 343) [(2, 1), (4, 1), (15, 2)],
  term ((-160 : Rat) / 7) [(2, 1), (14, 1)],
  term ((-48640 : Rat) / 343) [(2, 1), (15, 2)],
  term ((-320 : Rat) / 21) [(3, 1), (5, 1)],
  term ((160 : Rat) / 7) [(3, 1), (5, 1), (14, 1)],
  term ((48640 : Rat) / 343) [(3, 1), (5, 1), (15, 2)],
  term ((160 : Rat) / 21) [(4, 2)],
  term ((-80 : Rat) / 7) [(4, 2), (14, 1)],
  term ((-24320 : Rat) / 343) [(4, 2), (15, 2)],
  term ((160 : Rat) / 21) [(5, 2)],
  term ((-80 : Rat) / 7) [(5, 2), (14, 1)],
  term ((-24320 : Rat) / 343) [(5, 2), (15, 2)],
  term ((80 : Rat) / 7) [(14, 1)],
  term ((24320 : Rat) / 343) [(15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 10, terms 0 through 2. -/
theorem rs_R009_ueqv_R009YNNNN_block_10_0000_0002_valid :
    checkProductSumEq rs_R009_ueqv_R009YNNNN_partials_10_0000_0002
      rs_R009_ueqv_R009YNNNN_block_10_0000_0002 = true := by
  native_decide

end R009UeqvR009YNNNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
