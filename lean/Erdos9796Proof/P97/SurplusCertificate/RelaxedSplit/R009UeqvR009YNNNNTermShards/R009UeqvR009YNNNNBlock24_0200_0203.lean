/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009YNNNN, term block 24:200-203

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009YNNNNTermShards

/-- Generator polynomial 24 for relaxed split surplus certificate `R009:u=v:R009YNNNN`. -/
def rs_R009_ueqv_R009YNNNN_generator_24_0200_0203 : Poly :=
[
  term (-2 : Rat) [(0, 1), (10, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (11, 1)],
  term (1 : Rat) [(1, 2)],
  term (2 : Rat) [(10, 1), (14, 1)],
  term (2 : Rat) [(11, 1), (15, 1)],
  term (-1 : Rat) [(14, 2)],
  term (-1 : Rat) [(15, 2)]
]

/-- Coefficient term 200 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0200 : Poly :=
[
  term ((34161303145484309 : Rat) / 104438565426384) [(14, 1)]
]

/-- Partial product 200 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0200 : Poly :=
[
  term ((-34161303145484309 : Rat) / 52219282713192) [(0, 1), (10, 1), (14, 1)],
  term ((34161303145484309 : Rat) / 104438565426384) [(0, 2), (14, 1)],
  term ((-34161303145484309 : Rat) / 52219282713192) [(1, 1), (11, 1), (14, 1)],
  term ((34161303145484309 : Rat) / 104438565426384) [(1, 2), (14, 1)],
  term ((34161303145484309 : Rat) / 52219282713192) [(10, 1), (14, 2)],
  term ((34161303145484309 : Rat) / 52219282713192) [(11, 1), (14, 1), (15, 1)],
  term ((-34161303145484309 : Rat) / 104438565426384) [(14, 1), (15, 2)],
  term ((-34161303145484309 : Rat) / 104438565426384) [(14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 200 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0200_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0200
        rs_R009_ueqv_R009YNNNN_generator_24_0200_0203 =
      rs_R009_ueqv_R009YNNNN_partial_24_0200 := by
  native_decide

/-- Coefficient term 201 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0201 : Poly :=
[
  term ((-3968051523467 : Rat) / 177616607868) [(14, 2)]
]

/-- Partial product 201 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0201 : Poly :=
[
  term ((3968051523467 : Rat) / 88808303934) [(0, 1), (10, 1), (14, 2)],
  term ((-3968051523467 : Rat) / 177616607868) [(0, 2), (14, 2)],
  term ((3968051523467 : Rat) / 88808303934) [(1, 1), (11, 1), (14, 2)],
  term ((-3968051523467 : Rat) / 177616607868) [(1, 2), (14, 2)],
  term ((-3968051523467 : Rat) / 88808303934) [(10, 1), (14, 3)],
  term ((-3968051523467 : Rat) / 88808303934) [(11, 1), (14, 2), (15, 1)],
  term ((3968051523467 : Rat) / 177616607868) [(14, 2), (15, 2)],
  term ((3968051523467 : Rat) / 177616607868) [(14, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 201 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0201_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0201
        rs_R009_ueqv_R009YNNNN_generator_24_0200_0203 =
      rs_R009_ueqv_R009YNNNN_partial_24_0201 := by
  native_decide

/-- Coefficient term 202 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0202 : Poly :=
[
  term ((14936227071981925 : Rat) / 17406427571064) [(15, 2)]
]

/-- Partial product 202 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0202 : Poly :=
[
  term ((-14936227071981925 : Rat) / 8703213785532) [(0, 1), (10, 1), (15, 2)],
  term ((14936227071981925 : Rat) / 17406427571064) [(0, 2), (15, 2)],
  term ((-14936227071981925 : Rat) / 8703213785532) [(1, 1), (11, 1), (15, 2)],
  term ((14936227071981925 : Rat) / 17406427571064) [(1, 2), (15, 2)],
  term ((14936227071981925 : Rat) / 8703213785532) [(10, 1), (14, 1), (15, 2)],
  term ((14936227071981925 : Rat) / 8703213785532) [(11, 1), (15, 3)],
  term ((-14936227071981925 : Rat) / 17406427571064) [(14, 2), (15, 2)],
  term ((-14936227071981925 : Rat) / 17406427571064) [(15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 202 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0202_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0202
        rs_R009_ueqv_R009YNNNN_generator_24_0200_0203 =
      rs_R009_ueqv_R009YNNNN_partial_24_0202 := by
  native_decide

/-- Coefficient term 203 from coefficient polynomial 24. -/
def rs_R009_ueqv_R009YNNNN_coefficient_24_0203 : Poly :=
[
  term ((-563 : Rat) / 252) [(15, 2), (16, 1)]
]

/-- Partial product 203 for generator 24. -/
def rs_R009_ueqv_R009YNNNN_partial_24_0203 : Poly :=
[
  term ((563 : Rat) / 126) [(0, 1), (10, 1), (15, 2), (16, 1)],
  term ((-563 : Rat) / 252) [(0, 2), (15, 2), (16, 1)],
  term ((563 : Rat) / 126) [(1, 1), (11, 1), (15, 2), (16, 1)],
  term ((-563 : Rat) / 252) [(1, 2), (15, 2), (16, 1)],
  term ((-563 : Rat) / 126) [(10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-563 : Rat) / 126) [(11, 1), (15, 3), (16, 1)],
  term ((563 : Rat) / 252) [(14, 2), (15, 2), (16, 1)],
  term ((563 : Rat) / 252) [(15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 203 for generator 24. -/
theorem rs_R009_ueqv_R009YNNNN_partial_24_0203_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_24_0203
        rs_R009_ueqv_R009YNNNN_generator_24_0200_0203 =
      rs_R009_ueqv_R009YNNNN_partial_24_0203 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009YNNNN_partials_24_0200_0203 : List Poly :=
[
  rs_R009_ueqv_R009YNNNN_partial_24_0200,
  rs_R009_ueqv_R009YNNNN_partial_24_0201,
  rs_R009_ueqv_R009YNNNN_partial_24_0202,
  rs_R009_ueqv_R009YNNNN_partial_24_0203
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009YNNNN_block_24_0200_0203 : Poly :=
[
  term ((-34161303145484309 : Rat) / 52219282713192) [(0, 1), (10, 1), (14, 1)],
  term ((3968051523467 : Rat) / 88808303934) [(0, 1), (10, 1), (14, 2)],
  term ((-14936227071981925 : Rat) / 8703213785532) [(0, 1), (10, 1), (15, 2)],
  term ((563 : Rat) / 126) [(0, 1), (10, 1), (15, 2), (16, 1)],
  term ((34161303145484309 : Rat) / 104438565426384) [(0, 2), (14, 1)],
  term ((-3968051523467 : Rat) / 177616607868) [(0, 2), (14, 2)],
  term ((14936227071981925 : Rat) / 17406427571064) [(0, 2), (15, 2)],
  term ((-563 : Rat) / 252) [(0, 2), (15, 2), (16, 1)],
  term ((-34161303145484309 : Rat) / 52219282713192) [(1, 1), (11, 1), (14, 1)],
  term ((3968051523467 : Rat) / 88808303934) [(1, 1), (11, 1), (14, 2)],
  term ((-14936227071981925 : Rat) / 8703213785532) [(1, 1), (11, 1), (15, 2)],
  term ((563 : Rat) / 126) [(1, 1), (11, 1), (15, 2), (16, 1)],
  term ((34161303145484309 : Rat) / 104438565426384) [(1, 2), (14, 1)],
  term ((-3968051523467 : Rat) / 177616607868) [(1, 2), (14, 2)],
  term ((14936227071981925 : Rat) / 17406427571064) [(1, 2), (15, 2)],
  term ((-563 : Rat) / 252) [(1, 2), (15, 2), (16, 1)],
  term ((14936227071981925 : Rat) / 8703213785532) [(10, 1), (14, 1), (15, 2)],
  term ((-563 : Rat) / 126) [(10, 1), (14, 1), (15, 2), (16, 1)],
  term ((34161303145484309 : Rat) / 52219282713192) [(10, 1), (14, 2)],
  term ((-3968051523467 : Rat) / 88808303934) [(10, 1), (14, 3)],
  term ((34161303145484309 : Rat) / 52219282713192) [(11, 1), (14, 1), (15, 1)],
  term ((-3968051523467 : Rat) / 88808303934) [(11, 1), (14, 2), (15, 1)],
  term ((14936227071981925 : Rat) / 8703213785532) [(11, 1), (15, 3)],
  term ((-563 : Rat) / 126) [(11, 1), (15, 3), (16, 1)],
  term ((-34161303145484309 : Rat) / 104438565426384) [(14, 1), (15, 2)],
  term ((-538791037877117 : Rat) / 644682502632) [(14, 2), (15, 2)],
  term ((563 : Rat) / 252) [(14, 2), (15, 2), (16, 1)],
  term ((-34161303145484309 : Rat) / 104438565426384) [(14, 3)],
  term ((3968051523467 : Rat) / 177616607868) [(14, 4)],
  term ((-14936227071981925 : Rat) / 17406427571064) [(15, 4)],
  term ((563 : Rat) / 252) [(15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 24, terms 200 through 203. -/
theorem rs_R009_ueqv_R009YNNNN_block_24_0200_0203_valid :
    checkProductSumEq rs_R009_ueqv_R009YNNNN_partials_24_0200_0203
      rs_R009_ueqv_R009YNNNN_block_24_0200_0203 = true := by
  native_decide

end R009UeqvR009YNNNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
