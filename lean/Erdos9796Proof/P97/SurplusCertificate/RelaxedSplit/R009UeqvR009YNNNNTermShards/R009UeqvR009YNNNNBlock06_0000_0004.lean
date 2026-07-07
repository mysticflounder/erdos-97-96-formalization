/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009YNNNN, term block 6:0-4

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009YNNNNTermShards

/-- Generator polynomial 6 for relaxed split surplus certificate `R009:u=v:R009YNNNN`. -/
def rs_R009_ueqv_R009YNNNN_generator_06_0000_0004 : Poly :=
[
  term (-1 : Rat) [],
  term (1 : Rat) [(0, 2), (16, 1)],
  term (1 : Rat) [(1, 2), (16, 1)]
]

/-- Coefficient term 0 from coefficient polynomial 6. -/
def rs_R009_ueqv_R009YNNNN_coefficient_06_0000 : Poly :=
[
  term ((-4 : Rat) / 3) [(5, 1), (15, 1)]
]

/-- Partial product 0 for generator 6. -/
def rs_R009_ueqv_R009YNNNN_partial_06_0000 : Poly :=
[
  term ((-4 : Rat) / 3) [(0, 2), (5, 1), (15, 1), (16, 1)],
  term ((-4 : Rat) / 3) [(1, 2), (5, 1), (15, 1), (16, 1)],
  term ((4 : Rat) / 3) [(5, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 6. -/
theorem rs_R009_ueqv_R009YNNNN_partial_06_0000_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_06_0000
        rs_R009_ueqv_R009YNNNN_generator_06_0000_0004 =
      rs_R009_ueqv_R009YNNNN_partial_06_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 6. -/
def rs_R009_ueqv_R009YNNNN_coefficient_06_0001 : Poly :=
[
  term ((20 : Rat) / 21) [(11, 1), (13, 1)]
]

/-- Partial product 1 for generator 6. -/
def rs_R009_ueqv_R009YNNNN_partial_06_0001 : Poly :=
[
  term ((20 : Rat) / 21) [(0, 2), (11, 1), (13, 1), (16, 1)],
  term ((20 : Rat) / 21) [(1, 2), (11, 1), (13, 1), (16, 1)],
  term ((-20 : Rat) / 21) [(11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 6. -/
theorem rs_R009_ueqv_R009YNNNN_partial_06_0001_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_06_0001
        rs_R009_ueqv_R009YNNNN_generator_06_0000_0004 =
      rs_R009_ueqv_R009YNNNN_partial_06_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 6. -/
def rs_R009_ueqv_R009YNNNN_coefficient_06_0002 : Poly :=
[
  term ((-20 : Rat) / 21) [(11, 1), (15, 1)]
]

/-- Partial product 2 for generator 6. -/
def rs_R009_ueqv_R009YNNNN_partial_06_0002 : Poly :=
[
  term ((-20 : Rat) / 21) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((-20 : Rat) / 21) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((20 : Rat) / 21) [(11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 6. -/
theorem rs_R009_ueqv_R009YNNNN_partial_06_0002_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_06_0002
        rs_R009_ueqv_R009YNNNN_generator_06_0000_0004 =
      rs_R009_ueqv_R009YNNNN_partial_06_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 6. -/
def rs_R009_ueqv_R009YNNNN_coefficient_06_0003 : Poly :=
[
  term ((80 : Rat) / 21) [(13, 1), (15, 1)]
]

/-- Partial product 3 for generator 6. -/
def rs_R009_ueqv_R009YNNNN_partial_06_0003 : Poly :=
[
  term ((80 : Rat) / 21) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((80 : Rat) / 21) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((-80 : Rat) / 21) [(13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 6. -/
theorem rs_R009_ueqv_R009YNNNN_partial_06_0003_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_06_0003
        rs_R009_ueqv_R009YNNNN_generator_06_0000_0004 =
      rs_R009_ueqv_R009YNNNN_partial_06_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 6. -/
def rs_R009_ueqv_R009YNNNN_coefficient_06_0004 : Poly :=
[
  term ((-16 : Rat) / 21) [(14, 1)]
]

/-- Partial product 4 for generator 6. -/
def rs_R009_ueqv_R009YNNNN_partial_06_0004 : Poly :=
[
  term ((-16 : Rat) / 21) [(0, 2), (14, 1), (16, 1)],
  term ((-16 : Rat) / 21) [(1, 2), (14, 1), (16, 1)],
  term ((16 : Rat) / 21) [(14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 6. -/
theorem rs_R009_ueqv_R009YNNNN_partial_06_0004_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_06_0004
        rs_R009_ueqv_R009YNNNN_generator_06_0000_0004 =
      rs_R009_ueqv_R009YNNNN_partial_06_0004 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009YNNNN_partials_06_0000_0004 : List Poly :=
[
  rs_R009_ueqv_R009YNNNN_partial_06_0000,
  rs_R009_ueqv_R009YNNNN_partial_06_0001,
  rs_R009_ueqv_R009YNNNN_partial_06_0002,
  rs_R009_ueqv_R009YNNNN_partial_06_0003,
  rs_R009_ueqv_R009YNNNN_partial_06_0004
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009YNNNN_block_06_0000_0004 : Poly :=
[
  term ((-4 : Rat) / 3) [(0, 2), (5, 1), (15, 1), (16, 1)],
  term ((20 : Rat) / 21) [(0, 2), (11, 1), (13, 1), (16, 1)],
  term ((-20 : Rat) / 21) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((80 : Rat) / 21) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((-16 : Rat) / 21) [(0, 2), (14, 1), (16, 1)],
  term ((-4 : Rat) / 3) [(1, 2), (5, 1), (15, 1), (16, 1)],
  term ((20 : Rat) / 21) [(1, 2), (11, 1), (13, 1), (16, 1)],
  term ((-20 : Rat) / 21) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((80 : Rat) / 21) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((-16 : Rat) / 21) [(1, 2), (14, 1), (16, 1)],
  term ((4 : Rat) / 3) [(5, 1), (15, 1)],
  term ((-20 : Rat) / 21) [(11, 1), (13, 1)],
  term ((20 : Rat) / 21) [(11, 1), (15, 1)],
  term ((-80 : Rat) / 21) [(13, 1), (15, 1)],
  term ((16 : Rat) / 21) [(14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 6, terms 0 through 4. -/
theorem rs_R009_ueqv_R009YNNNN_block_06_0000_0004_valid :
    checkProductSumEq rs_R009_ueqv_R009YNNNN_partials_06_0000_0004
      rs_R009_ueqv_R009YNNNN_block_06_0000_0004 = true := by
  native_decide

end R009UeqvR009YNNNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
