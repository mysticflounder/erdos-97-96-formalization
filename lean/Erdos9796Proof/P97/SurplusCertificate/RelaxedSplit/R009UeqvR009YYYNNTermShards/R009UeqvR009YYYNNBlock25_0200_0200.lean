/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009YYYNN, term block 25:200-200

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009YYYNNTermShards

/-- Generator polynomial 25 for relaxed split surplus certificate `R009:u=v:R009YYYNN`. -/
def rs_R009_ueqv_R009YYYNN_generator_25_0200_0200 : Poly :=
[
  term (-2 : Rat) [(0, 1), (12, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (13, 1)],
  term (1 : Rat) [(1, 2)]
]

/-- Coefficient term 200 from coefficient polynomial 25. -/
def rs_R009_ueqv_R009YYYNN_coefficient_25_0200 : Poly :=
[
  term ((-51081588 : Rat) / 21337981) [(15, 4)]
]

/-- Partial product 200 for generator 25. -/
def rs_R009_ueqv_R009YYYNN_partial_25_0200 : Poly :=
[
  term ((102163176 : Rat) / 21337981) [(0, 1), (12, 1), (15, 4)],
  term ((-51081588 : Rat) / 21337981) [(0, 2), (15, 4)],
  term ((102163176 : Rat) / 21337981) [(1, 1), (13, 1), (15, 4)],
  term ((-51081588 : Rat) / 21337981) [(1, 2), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 200 for generator 25. -/
theorem rs_R009_ueqv_R009YYYNN_partial_25_0200_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_25_0200
        rs_R009_ueqv_R009YYYNN_generator_25_0200_0200 =
      rs_R009_ueqv_R009YYYNN_partial_25_0200 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009YYYNN_partials_25_0200_0200 : List Poly :=
[
  rs_R009_ueqv_R009YYYNN_partial_25_0200
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009YYYNN_block_25_0200_0200 : Poly :=
[
  term ((102163176 : Rat) / 21337981) [(0, 1), (12, 1), (15, 4)],
  term ((-51081588 : Rat) / 21337981) [(0, 2), (15, 4)],
  term ((102163176 : Rat) / 21337981) [(1, 1), (13, 1), (15, 4)],
  term ((-51081588 : Rat) / 21337981) [(1, 2), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 25, terms 200 through 200. -/
theorem rs_R009_ueqv_R009YYYNN_block_25_0200_0200_valid :
    checkProductSumEq rs_R009_ueqv_R009YYYNN_partials_25_0200_0200
      rs_R009_ueqv_R009YYYNN_block_25_0200_0200 = true := by
  native_decide

end R009UeqvR009YYYNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
