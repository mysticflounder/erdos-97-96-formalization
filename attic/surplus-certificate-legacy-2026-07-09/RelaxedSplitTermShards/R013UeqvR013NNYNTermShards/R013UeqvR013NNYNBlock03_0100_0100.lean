/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R013:u=v:R013NNYN, term block 3:100-100

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R013UeqvR013NNYNTermShards

/-- Generator polynomial 3 for relaxed split surplus certificate `R013:u=v:R013NNYN`. -/
def rs_R013_ueqv_R013NNYN_generator_03_0100_0100 : Poly :=
[
  term (-2 : Rat) [(6, 1)],
  term (1 : Rat) [(6, 2)],
  term (1 : Rat) [(7, 2)],
  term (2 : Rat) [(8, 1)],
  term (-1 : Rat) [(8, 2)],
  term (-1 : Rat) [(9, 2)]
]

/-- Coefficient term 100 from coefficient polynomial 3. -/
def rs_R013_ueqv_R013NNYN_coefficient_03_0100 : Poly :=
[
  term ((-688 : Rat) / 103) [(16, 1)]
]

/-- Partial product 100 for generator 3. -/
def rs_R013_ueqv_R013NNYN_partial_03_0100 : Poly :=
[
  term ((1376 : Rat) / 103) [(6, 1), (16, 1)],
  term ((-688 : Rat) / 103) [(6, 2), (16, 1)],
  term ((-688 : Rat) / 103) [(7, 2), (16, 1)],
  term ((-1376 : Rat) / 103) [(8, 1), (16, 1)],
  term ((688 : Rat) / 103) [(8, 2), (16, 1)],
  term ((688 : Rat) / 103) [(9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 3. -/
theorem rs_R013_ueqv_R013NNYN_partial_03_0100_valid :
    mulPoly rs_R013_ueqv_R013NNYN_coefficient_03_0100
        rs_R013_ueqv_R013NNYN_generator_03_0100_0100 =
      rs_R013_ueqv_R013NNYN_partial_03_0100 := by
  native_decide

/-- Partial products in this block. -/
def rs_R013_ueqv_R013NNYN_partials_03_0100_0100 : List Poly :=
[
  rs_R013_ueqv_R013NNYN_partial_03_0100
]

/-- Sum of partial products in this block. -/
def rs_R013_ueqv_R013NNYN_block_03_0100_0100 : Poly :=
[
  term ((1376 : Rat) / 103) [(6, 1), (16, 1)],
  term ((-688 : Rat) / 103) [(6, 2), (16, 1)],
  term ((-688 : Rat) / 103) [(7, 2), (16, 1)],
  term ((-1376 : Rat) / 103) [(8, 1), (16, 1)],
  term ((688 : Rat) / 103) [(8, 2), (16, 1)],
  term ((688 : Rat) / 103) [(9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 3, terms 100 through 100. -/
theorem rs_R013_ueqv_R013NNYN_block_03_0100_0100_valid :
    checkProductSumEq rs_R013_ueqv_R013NNYN_partials_03_0100_0100
      rs_R013_ueqv_R013NNYN_block_03_0100_0100 = true := by
  native_decide

end R013UeqvR013NNYNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
