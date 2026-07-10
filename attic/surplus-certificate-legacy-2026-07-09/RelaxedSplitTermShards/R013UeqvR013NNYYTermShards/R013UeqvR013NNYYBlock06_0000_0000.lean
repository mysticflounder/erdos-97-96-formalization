/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R013:u=v:R013NNYY, term block 6:0-0

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R013UeqvR013NNYYTermShards

/-- Generator polynomial 6 for relaxed split surplus certificate `R013:u=v:R013NNYY`. -/
def rs_R013_ueqv_R013NNYY_generator_06_0000_0000 : Poly :=
[
  term (-1 : Rat) [],
  term (1 : Rat) [(0, 2), (16, 1)],
  term (1 : Rat) [(1, 2), (16, 1)]
]

/-- Coefficient term 0 from coefficient polynomial 6. -/
def rs_R013_ueqv_R013NNYY_coefficient_06_0000 : Poly :=
[
  term (4 : Rat) [(15, 2)]
]

/-- Partial product 0 for generator 6. -/
def rs_R013_ueqv_R013NNYY_partial_06_0000 : Poly :=
[
  term (4 : Rat) [(0, 2), (15, 2), (16, 1)],
  term (4 : Rat) [(1, 2), (15, 2), (16, 1)],
  term (-4 : Rat) [(15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 6. -/
theorem rs_R013_ueqv_R013NNYY_partial_06_0000_valid :
    mulPoly rs_R013_ueqv_R013NNYY_coefficient_06_0000
        rs_R013_ueqv_R013NNYY_generator_06_0000_0000 =
      rs_R013_ueqv_R013NNYY_partial_06_0000 := by
  native_decide

/-- Partial products in this block. -/
def rs_R013_ueqv_R013NNYY_partials_06_0000_0000 : List Poly :=
[
  rs_R013_ueqv_R013NNYY_partial_06_0000
]

/-- Sum of partial products in this block. -/
def rs_R013_ueqv_R013NNYY_block_06_0000_0000 : Poly :=
[
  term (4 : Rat) [(0, 2), (15, 2), (16, 1)],
  term (4 : Rat) [(1, 2), (15, 2), (16, 1)],
  term (-4 : Rat) [(15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 6, terms 0 through 0. -/
theorem rs_R013_ueqv_R013NNYY_block_06_0000_0000_valid :
    checkProductSumEq rs_R013_ueqv_R013NNYY_partials_06_0000_0000
      rs_R013_ueqv_R013NNYY_block_06_0000_0000 = true := by
  native_decide

end R013UeqvR013NNYYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
