/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009YYYNN, term block 30:200-202

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009YYYNNTermShards

/-- Generator polynomial 30 for relaxed split surplus certificate `R009:u=v:R009YYYNN`. -/
def rs_R009_ueqv_R009YYYNN_generator_30_0200_0202 : Poly :=
[
  term (-2 : Rat) [(0, 1), (14, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (15, 1)],
  term (1 : Rat) [(1, 2)],
  term (2 : Rat) [(12, 1), (14, 1)],
  term (-1 : Rat) [(12, 2)],
  term (2 : Rat) [(13, 1), (15, 1)],
  term (-1 : Rat) [(13, 2)]
]

/-- Coefficient term 200 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YYYNN_coefficient_30_0200 : Poly :=
[
  term ((-209624895 : Rat) / 21337981) [(14, 3)]
]

/-- Partial product 200 for generator 30. -/
def rs_R009_ueqv_R009YYYNN_partial_30_0200 : Poly :=
[
  term ((419249790 : Rat) / 21337981) [(0, 1), (14, 4)],
  term ((-209624895 : Rat) / 21337981) [(0, 2), (14, 3)],
  term ((419249790 : Rat) / 21337981) [(1, 1), (14, 3), (15, 1)],
  term ((-209624895 : Rat) / 21337981) [(1, 2), (14, 3)],
  term ((-419249790 : Rat) / 21337981) [(12, 1), (14, 4)],
  term ((209624895 : Rat) / 21337981) [(12, 2), (14, 3)],
  term ((-419249790 : Rat) / 21337981) [(13, 1), (14, 3), (15, 1)],
  term ((209624895 : Rat) / 21337981) [(13, 2), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 200 for generator 30. -/
theorem rs_R009_ueqv_R009YYYNN_partial_30_0200_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_30_0200
        rs_R009_ueqv_R009YYYNN_generator_30_0200_0202 =
      rs_R009_ueqv_R009YYYNN_partial_30_0200 := by
  native_decide

/-- Coefficient term 201 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YYYNN_coefficient_30_0201 : Poly :=
[
  term ((-795765933 : Rat) / 85351924) [(15, 2)]
]

/-- Partial product 201 for generator 30. -/
def rs_R009_ueqv_R009YYYNN_partial_30_0201 : Poly :=
[
  term ((795765933 : Rat) / 42675962) [(0, 1), (14, 1), (15, 2)],
  term ((-795765933 : Rat) / 85351924) [(0, 2), (15, 2)],
  term ((795765933 : Rat) / 42675962) [(1, 1), (15, 3)],
  term ((-795765933 : Rat) / 85351924) [(1, 2), (15, 2)],
  term ((-795765933 : Rat) / 42675962) [(12, 1), (14, 1), (15, 2)],
  term ((795765933 : Rat) / 85351924) [(12, 2), (15, 2)],
  term ((-795765933 : Rat) / 42675962) [(13, 1), (15, 3)],
  term ((795765933 : Rat) / 85351924) [(13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 201 for generator 30. -/
theorem rs_R009_ueqv_R009YYYNN_partial_30_0201_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_30_0201
        rs_R009_ueqv_R009YYYNN_generator_30_0200_0202 =
      rs_R009_ueqv_R009YYYNN_partial_30_0201 := by
  native_decide

/-- Coefficient term 202 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009YYYNN_coefficient_30_0202 : Poly :=
[
  term ((-336111480 : Rat) / 21337981) [(15, 4)]
]

/-- Partial product 202 for generator 30. -/
def rs_R009_ueqv_R009YYYNN_partial_30_0202 : Poly :=
[
  term ((672222960 : Rat) / 21337981) [(0, 1), (14, 1), (15, 4)],
  term ((-336111480 : Rat) / 21337981) [(0, 2), (15, 4)],
  term ((672222960 : Rat) / 21337981) [(1, 1), (15, 5)],
  term ((-336111480 : Rat) / 21337981) [(1, 2), (15, 4)],
  term ((-672222960 : Rat) / 21337981) [(12, 1), (14, 1), (15, 4)],
  term ((336111480 : Rat) / 21337981) [(12, 2), (15, 4)],
  term ((-672222960 : Rat) / 21337981) [(13, 1), (15, 5)],
  term ((336111480 : Rat) / 21337981) [(13, 2), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 202 for generator 30. -/
theorem rs_R009_ueqv_R009YYYNN_partial_30_0202_valid :
    mulPoly rs_R009_ueqv_R009YYYNN_coefficient_30_0202
        rs_R009_ueqv_R009YYYNN_generator_30_0200_0202 =
      rs_R009_ueqv_R009YYYNN_partial_30_0202 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009YYYNN_partials_30_0200_0202 : List Poly :=
[
  rs_R009_ueqv_R009YYYNN_partial_30_0200,
  rs_R009_ueqv_R009YYYNN_partial_30_0201,
  rs_R009_ueqv_R009YYYNN_partial_30_0202
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009YYYNN_block_30_0200_0202 : Poly :=
[
  term ((795765933 : Rat) / 42675962) [(0, 1), (14, 1), (15, 2)],
  term ((672222960 : Rat) / 21337981) [(0, 1), (14, 1), (15, 4)],
  term ((419249790 : Rat) / 21337981) [(0, 1), (14, 4)],
  term ((-209624895 : Rat) / 21337981) [(0, 2), (14, 3)],
  term ((-795765933 : Rat) / 85351924) [(0, 2), (15, 2)],
  term ((-336111480 : Rat) / 21337981) [(0, 2), (15, 4)],
  term ((419249790 : Rat) / 21337981) [(1, 1), (14, 3), (15, 1)],
  term ((795765933 : Rat) / 42675962) [(1, 1), (15, 3)],
  term ((672222960 : Rat) / 21337981) [(1, 1), (15, 5)],
  term ((-209624895 : Rat) / 21337981) [(1, 2), (14, 3)],
  term ((-795765933 : Rat) / 85351924) [(1, 2), (15, 2)],
  term ((-336111480 : Rat) / 21337981) [(1, 2), (15, 4)],
  term ((-795765933 : Rat) / 42675962) [(12, 1), (14, 1), (15, 2)],
  term ((-672222960 : Rat) / 21337981) [(12, 1), (14, 1), (15, 4)],
  term ((-419249790 : Rat) / 21337981) [(12, 1), (14, 4)],
  term ((209624895 : Rat) / 21337981) [(12, 2), (14, 3)],
  term ((795765933 : Rat) / 85351924) [(12, 2), (15, 2)],
  term ((336111480 : Rat) / 21337981) [(12, 2), (15, 4)],
  term ((-419249790 : Rat) / 21337981) [(13, 1), (14, 3), (15, 1)],
  term ((-795765933 : Rat) / 42675962) [(13, 1), (15, 3)],
  term ((-672222960 : Rat) / 21337981) [(13, 1), (15, 5)],
  term ((209624895 : Rat) / 21337981) [(13, 2), (14, 3)],
  term ((795765933 : Rat) / 85351924) [(13, 2), (15, 2)],
  term ((336111480 : Rat) / 21337981) [(13, 2), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 30, terms 200 through 202. -/
theorem rs_R009_ueqv_R009YYYNN_block_30_0200_0202_valid :
    checkProductSumEq rs_R009_ueqv_R009YYYNN_partials_30_0200_0202
      rs_R009_ueqv_R009YYYNN_block_30_0200_0202 = true := by
  native_decide

end R009UeqvR009YYYNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
