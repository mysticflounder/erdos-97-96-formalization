/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R010:u=v:R010YNN, term block 12:400-403

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R010UeqvR010YNNTermShards

/-- Generator polynomial 12 for relaxed split surplus certificate `R010:u=v:R010YNN`. -/
def rs_R010_ueqv_R010YNN_generator_12_0400_0403 : Poly :=
[
  term (2 : Rat) [(2, 1), (12, 1)],
  term (2 : Rat) [(3, 1), (13, 1)],
  term (-1 : Rat) [(12, 2)],
  term (-1 : Rat) [(13, 2)]
]

/-- Coefficient term 400 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0400 : Poly :=
[
  term ((-9412538015673267200 : Rat) / 17966088315235317) [(5, 4), (9, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 400 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0400 : Poly :=
[
  term ((-18825076031346534400 : Rat) / 17966088315235317) [(2, 1), (5, 4), (9, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-18825076031346534400 : Rat) / 17966088315235317) [(3, 1), (5, 4), (9, 2), (13, 2), (15, 1), (16, 1)],
  term ((9412538015673267200 : Rat) / 17966088315235317) [(5, 4), (9, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((9412538015673267200 : Rat) / 17966088315235317) [(5, 4), (9, 2), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 400 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0400_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0400
        rs_R010_ueqv_R010YNN_generator_12_0400_0403 =
      rs_R010_ueqv_R010YNN_partial_12_0400 := by
  native_decide

/-- Coefficient term 401 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0401 : Poly :=
[
  term ((18825076031346534400 : Rat) / 17966088315235317) [(5, 4), (9, 2), (15, 2), (16, 1)]
]

/-- Partial product 401 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0401 : Poly :=
[
  term ((37650152062693068800 : Rat) / 17966088315235317) [(2, 1), (5, 4), (9, 2), (12, 1), (15, 2), (16, 1)],
  term ((37650152062693068800 : Rat) / 17966088315235317) [(3, 1), (5, 4), (9, 2), (13, 1), (15, 2), (16, 1)],
  term ((-18825076031346534400 : Rat) / 17966088315235317) [(5, 4), (9, 2), (12, 2), (15, 2), (16, 1)],
  term ((-18825076031346534400 : Rat) / 17966088315235317) [(5, 4), (9, 2), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 401 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0401_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0401
        rs_R010_ueqv_R010YNN_generator_12_0400_0403 =
      rs_R010_ueqv_R010YNN_partial_12_0401 := by
  native_decide

/-- Coefficient term 402 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0402 : Poly :=
[
  term (-4 : Rat) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 402 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0402 : Poly :=
[
  term (-8 : Rat) [(2, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(3, 1), (13, 2), (15, 1), (16, 1)],
  term (4 : Rat) [(12, 2), (13, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 402 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0402_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0402
        rs_R010_ueqv_R010YNN_generator_12_0400_0403 =
      rs_R010_ueqv_R010YNN_partial_12_0402 := by
  native_decide

/-- Coefficient term 403 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0403 : Poly :=
[
  term (8 : Rat) [(15, 2), (16, 1)]
]

/-- Partial product 403 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0403 : Poly :=
[
  term (16 : Rat) [(2, 1), (12, 1), (15, 2), (16, 1)],
  term (16 : Rat) [(3, 1), (13, 1), (15, 2), (16, 1)],
  term (-8 : Rat) [(12, 2), (15, 2), (16, 1)],
  term (-8 : Rat) [(13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 403 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0403_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0403
        rs_R010_ueqv_R010YNN_generator_12_0400_0403 =
      rs_R010_ueqv_R010YNN_partial_12_0403 := by
  native_decide

/-- Partial products in this block. -/
def rs_R010_ueqv_R010YNN_partials_12_0400_0403 : List Poly :=
[
  rs_R010_ueqv_R010YNN_partial_12_0400,
  rs_R010_ueqv_R010YNN_partial_12_0401,
  rs_R010_ueqv_R010YNN_partial_12_0402,
  rs_R010_ueqv_R010YNN_partial_12_0403
]

/-- Sum of partial products in this block. -/
def rs_R010_ueqv_R010YNN_block_12_0400_0403 : Poly :=
[
  term ((-18825076031346534400 : Rat) / 17966088315235317) [(2, 1), (5, 4), (9, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((37650152062693068800 : Rat) / 17966088315235317) [(2, 1), (5, 4), (9, 2), (12, 1), (15, 2), (16, 1)],
  term (-8 : Rat) [(2, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term (16 : Rat) [(2, 1), (12, 1), (15, 2), (16, 1)],
  term ((37650152062693068800 : Rat) / 17966088315235317) [(3, 1), (5, 4), (9, 2), (13, 1), (15, 2), (16, 1)],
  term ((-18825076031346534400 : Rat) / 17966088315235317) [(3, 1), (5, 4), (9, 2), (13, 2), (15, 1), (16, 1)],
  term (16 : Rat) [(3, 1), (13, 1), (15, 2), (16, 1)],
  term (-8 : Rat) [(3, 1), (13, 2), (15, 1), (16, 1)],
  term ((9412538015673267200 : Rat) / 17966088315235317) [(5, 4), (9, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-18825076031346534400 : Rat) / 17966088315235317) [(5, 4), (9, 2), (12, 2), (15, 2), (16, 1)],
  term ((-18825076031346534400 : Rat) / 17966088315235317) [(5, 4), (9, 2), (13, 2), (15, 2), (16, 1)],
  term ((9412538015673267200 : Rat) / 17966088315235317) [(5, 4), (9, 2), (13, 3), (15, 1), (16, 1)],
  term (4 : Rat) [(12, 2), (13, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(12, 2), (15, 2), (16, 1)],
  term (-8 : Rat) [(13, 2), (15, 2), (16, 1)],
  term (4 : Rat) [(13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 12, terms 400 through 403. -/
theorem rs_R010_ueqv_R010YNN_block_12_0400_0403_valid :
    checkProductSumEq rs_R010_ueqv_R010YNN_partials_12_0400_0403
      rs_R010_ueqv_R010YNN_block_12_0400_0403 = true := by
  native_decide

end R010UeqvR010YNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
