/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NNNYN, term block 26:100-100

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NNNYNTermShards

/-- Generator polynomial 26 for relaxed split surplus certificate `R009:u=v:R009NNNYN`. -/
def rs_R009_ueqv_R009NNNYN_generator_26_0100_0100 : Poly :=
[
  term (-2 : Rat) [(0, 1), (12, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (13, 1)],
  term (1 : Rat) [(1, 2)],
  term (2 : Rat) [(6, 1), (12, 1)],
  term (-1 : Rat) [(6, 2)],
  term (2 : Rat) [(7, 1), (13, 1)],
  term (-1 : Rat) [(7, 2)]
]

/-- Coefficient term 100 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NNNYN_coefficient_26_0100 : Poly :=
[
  term ((9145937840 : Rat) / 330679773) [(15, 2)]
]

/-- Partial product 100 for generator 26. -/
def rs_R009_ueqv_R009NNNYN_partial_26_0100 : Poly :=
[
  term ((-18291875680 : Rat) / 330679773) [(0, 1), (12, 1), (15, 2)],
  term ((9145937840 : Rat) / 330679773) [(0, 2), (15, 2)],
  term ((-18291875680 : Rat) / 330679773) [(1, 1), (13, 1), (15, 2)],
  term ((9145937840 : Rat) / 330679773) [(1, 2), (15, 2)],
  term ((18291875680 : Rat) / 330679773) [(6, 1), (12, 1), (15, 2)],
  term ((-9145937840 : Rat) / 330679773) [(6, 2), (15, 2)],
  term ((18291875680 : Rat) / 330679773) [(7, 1), (13, 1), (15, 2)],
  term ((-9145937840 : Rat) / 330679773) [(7, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 26. -/
theorem rs_R009_ueqv_R009NNNYN_partial_26_0100_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_26_0100
        rs_R009_ueqv_R009NNNYN_generator_26_0100_0100 =
      rs_R009_ueqv_R009NNNYN_partial_26_0100 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NNNYN_partials_26_0100_0100 : List Poly :=
[
  rs_R009_ueqv_R009NNNYN_partial_26_0100
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NNNYN_block_26_0100_0100 : Poly :=
[
  term ((-18291875680 : Rat) / 330679773) [(0, 1), (12, 1), (15, 2)],
  term ((9145937840 : Rat) / 330679773) [(0, 2), (15, 2)],
  term ((-18291875680 : Rat) / 330679773) [(1, 1), (13, 1), (15, 2)],
  term ((9145937840 : Rat) / 330679773) [(1, 2), (15, 2)],
  term ((18291875680 : Rat) / 330679773) [(6, 1), (12, 1), (15, 2)],
  term ((-9145937840 : Rat) / 330679773) [(6, 2), (15, 2)],
  term ((18291875680 : Rat) / 330679773) [(7, 1), (13, 1), (15, 2)],
  term ((-9145937840 : Rat) / 330679773) [(7, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 26, terms 100 through 100. -/
theorem rs_R009_ueqv_R009NNNYN_block_26_0100_0100_valid :
    checkProductSumEq rs_R009_ueqv_R009NNNYN_partials_26_0100_0100
      rs_R009_ueqv_R009NNNYN_block_26_0100_0100 = true := by
  native_decide

end R009UeqvR009NNNYNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
