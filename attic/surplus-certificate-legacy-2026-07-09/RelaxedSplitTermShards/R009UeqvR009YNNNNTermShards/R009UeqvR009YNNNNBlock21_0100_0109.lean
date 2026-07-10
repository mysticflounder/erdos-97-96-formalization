/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009YNNNN, term block 21:100-109

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009YNNNNTermShards

/-- Generator polynomial 21 for relaxed split surplus certificate `R009:u=v:R009YNNNN`. -/
def rs_R009_ueqv_R009YNNNN_generator_21_0100_0109 : Poly :=
[
  term (2 : Rat) [(8, 1), (12, 1)],
  term (2 : Rat) [(9, 1), (13, 1)],
  term (-1 : Rat) [(12, 2)],
  term (-1 : Rat) [(13, 2)]
]

/-- Coefficient term 100 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YNNNN_coefficient_21_0100 : Poly :=
[
  term ((305 : Rat) / 56) [(13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 100 for generator 21. -/
def rs_R009_ueqv_R009YNNNN_partial_21_0100 : Poly :=
[
  term ((305 : Rat) / 28) [(8, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((305 : Rat) / 28) [(9, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-305 : Rat) / 56) [(12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-305 : Rat) / 56) [(13, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 21. -/
theorem rs_R009_ueqv_R009YNNNN_partial_21_0100_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_21_0100
        rs_R009_ueqv_R009YNNNN_generator_21_0100_0109 =
      rs_R009_ueqv_R009YNNNN_partial_21_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YNNNN_coefficient_21_0101 : Poly :=
[
  term ((-46953690839072645 : Rat) / 208877130852768) [(13, 1), (15, 1)]
]

/-- Partial product 101 for generator 21. -/
def rs_R009_ueqv_R009YNNNN_partial_21_0101 : Poly :=
[
  term ((-46953690839072645 : Rat) / 104438565426384) [(8, 1), (12, 1), (13, 1), (15, 1)],
  term ((-46953690839072645 : Rat) / 104438565426384) [(9, 1), (13, 2), (15, 1)],
  term ((46953690839072645 : Rat) / 208877130852768) [(12, 2), (13, 1), (15, 1)],
  term ((46953690839072645 : Rat) / 208877130852768) [(13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 21. -/
theorem rs_R009_ueqv_R009YNNNN_partial_21_0101_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_21_0101
        rs_R009_ueqv_R009YNNNN_generator_21_0100_0109 =
      rs_R009_ueqv_R009YNNNN_partial_21_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YNNNN_coefficient_21_0102 : Poly :=
[
  term ((841 : Rat) / 336) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 102 for generator 21. -/
def rs_R009_ueqv_R009YNNNN_partial_21_0102 : Poly :=
[
  term ((841 : Rat) / 168) [(8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((841 : Rat) / 168) [(9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-841 : Rat) / 336) [(12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-841 : Rat) / 336) [(13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 21. -/
theorem rs_R009_ueqv_R009YNNNN_partial_21_0102_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_21_0102
        rs_R009_ueqv_R009YNNNN_generator_21_0100_0109 =
      rs_R009_ueqv_R009YNNNN_partial_21_0102 := by
  native_decide

/-- Coefficient term 103 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YNNNN_coefficient_21_0103 : Poly :=
[
  term ((97923607474811 : Rat) / 1065699647208) [(13, 2)]
]

/-- Partial product 103 for generator 21. -/
def rs_R009_ueqv_R009YNNNN_partial_21_0103 : Poly :=
[
  term ((97923607474811 : Rat) / 532849823604) [(8, 1), (12, 1), (13, 2)],
  term ((97923607474811 : Rat) / 532849823604) [(9, 1), (13, 3)],
  term ((-97923607474811 : Rat) / 1065699647208) [(12, 2), (13, 2)],
  term ((-97923607474811 : Rat) / 1065699647208) [(13, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 103 for generator 21. -/
theorem rs_R009_ueqv_R009YNNNN_partial_21_0103_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_21_0103
        rs_R009_ueqv_R009YNNNN_generator_21_0100_0109 =
      rs_R009_ueqv_R009YNNNN_partial_21_0103 := by
  native_decide

/-- Coefficient term 104 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YNNNN_coefficient_21_0104 : Poly :=
[
  term ((-475 : Rat) / 84) [(13, 2), (16, 1)]
]

/-- Partial product 104 for generator 21. -/
def rs_R009_ueqv_R009YNNNN_partial_21_0104 : Poly :=
[
  term ((-475 : Rat) / 42) [(8, 1), (12, 1), (13, 2), (16, 1)],
  term ((-475 : Rat) / 42) [(9, 1), (13, 3), (16, 1)],
  term ((475 : Rat) / 84) [(12, 2), (13, 2), (16, 1)],
  term ((475 : Rat) / 84) [(13, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 104 for generator 21. -/
theorem rs_R009_ueqv_R009YNNNN_partial_21_0104_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_21_0104
        rs_R009_ueqv_R009YNNNN_generator_21_0100_0109 =
      rs_R009_ueqv_R009YNNNN_partial_21_0104 := by
  native_decide

/-- Coefficient term 105 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YNNNN_coefficient_21_0105 : Poly :=
[
  term ((32516523481 : Rat) / 5638622472) [(14, 1)]
]

/-- Partial product 105 for generator 21. -/
def rs_R009_ueqv_R009YNNNN_partial_21_0105 : Poly :=
[
  term ((32516523481 : Rat) / 2819311236) [(8, 1), (12, 1), (14, 1)],
  term ((32516523481 : Rat) / 2819311236) [(9, 1), (13, 1), (14, 1)],
  term ((-32516523481 : Rat) / 5638622472) [(12, 2), (14, 1)],
  term ((-32516523481 : Rat) / 5638622472) [(13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 105 for generator 21. -/
theorem rs_R009_ueqv_R009YNNNN_partial_21_0105_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_21_0105
        rs_R009_ueqv_R009YNNNN_generator_21_0100_0109 =
      rs_R009_ueqv_R009YNNNN_partial_21_0105 := by
  native_decide

/-- Coefficient term 106 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YNNNN_coefficient_21_0106 : Poly :=
[
  term ((3366906314273 : Rat) / 59205535956) [(14, 1), (15, 2)]
]

/-- Partial product 106 for generator 21. -/
def rs_R009_ueqv_R009YNNNN_partial_21_0106 : Poly :=
[
  term ((3366906314273 : Rat) / 29602767978) [(8, 1), (12, 1), (14, 1), (15, 2)],
  term ((3366906314273 : Rat) / 29602767978) [(9, 1), (13, 1), (14, 1), (15, 2)],
  term ((-3366906314273 : Rat) / 59205535956) [(12, 2), (14, 1), (15, 2)],
  term ((-3366906314273 : Rat) / 59205535956) [(13, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 106 for generator 21. -/
theorem rs_R009_ueqv_R009YNNNN_partial_21_0106_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_21_0106
        rs_R009_ueqv_R009YNNNN_generator_21_0100_0109 =
      rs_R009_ueqv_R009YNNNN_partial_21_0106 := by
  native_decide

/-- Coefficient term 107 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YNNNN_coefficient_21_0107 : Poly :=
[
  term ((-65 : Rat) / 14) [(14, 1), (15, 2), (16, 1)]
]

/-- Partial product 107 for generator 21. -/
def rs_R009_ueqv_R009YNNNN_partial_21_0107 : Poly :=
[
  term ((-65 : Rat) / 7) [(8, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-65 : Rat) / 7) [(9, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((65 : Rat) / 14) [(12, 2), (14, 1), (15, 2), (16, 1)],
  term ((65 : Rat) / 14) [(13, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 107 for generator 21. -/
theorem rs_R009_ueqv_R009YNNNN_partial_21_0107_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_21_0107
        rs_R009_ueqv_R009YNNNN_generator_21_0100_0109 =
      rs_R009_ueqv_R009YNNNN_partial_21_0107 := by
  native_decide

/-- Coefficient term 108 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YNNNN_coefficient_21_0108 : Poly :=
[
  term ((496223218750097 : Rat) / 8703213785532) [(15, 2)]
]

/-- Partial product 108 for generator 21. -/
def rs_R009_ueqv_R009YNNNN_partial_21_0108 : Poly :=
[
  term ((496223218750097 : Rat) / 4351606892766) [(8, 1), (12, 1), (15, 2)],
  term ((496223218750097 : Rat) / 4351606892766) [(9, 1), (13, 1), (15, 2)],
  term ((-496223218750097 : Rat) / 8703213785532) [(12, 2), (15, 2)],
  term ((-496223218750097 : Rat) / 8703213785532) [(13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 108 for generator 21. -/
theorem rs_R009_ueqv_R009YNNNN_partial_21_0108_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_21_0108
        rs_R009_ueqv_R009YNNNN_generator_21_0100_0109 =
      rs_R009_ueqv_R009YNNNN_partial_21_0108 := by
  native_decide

/-- Coefficient term 109 from coefficient polynomial 21. -/
def rs_R009_ueqv_R009YNNNN_coefficient_21_0109 : Poly :=
[
  term ((163 : Rat) / 84) [(15, 2), (16, 1)]
]

/-- Partial product 109 for generator 21. -/
def rs_R009_ueqv_R009YNNNN_partial_21_0109 : Poly :=
[
  term ((163 : Rat) / 42) [(8, 1), (12, 1), (15, 2), (16, 1)],
  term ((163 : Rat) / 42) [(9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-163 : Rat) / 84) [(12, 2), (15, 2), (16, 1)],
  term ((-163 : Rat) / 84) [(13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 109 for generator 21. -/
theorem rs_R009_ueqv_R009YNNNN_partial_21_0109_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_21_0109
        rs_R009_ueqv_R009YNNNN_generator_21_0100_0109 =
      rs_R009_ueqv_R009YNNNN_partial_21_0109 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009YNNNN_partials_21_0100_0109 : List Poly :=
[
  rs_R009_ueqv_R009YNNNN_partial_21_0100,
  rs_R009_ueqv_R009YNNNN_partial_21_0101,
  rs_R009_ueqv_R009YNNNN_partial_21_0102,
  rs_R009_ueqv_R009YNNNN_partial_21_0103,
  rs_R009_ueqv_R009YNNNN_partial_21_0104,
  rs_R009_ueqv_R009YNNNN_partial_21_0105,
  rs_R009_ueqv_R009YNNNN_partial_21_0106,
  rs_R009_ueqv_R009YNNNN_partial_21_0107,
  rs_R009_ueqv_R009YNNNN_partial_21_0108,
  rs_R009_ueqv_R009YNNNN_partial_21_0109
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009YNNNN_block_21_0100_0109 : Poly :=
[
  term ((305 : Rat) / 28) [(8, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-46953690839072645 : Rat) / 104438565426384) [(8, 1), (12, 1), (13, 1), (15, 1)],
  term ((841 : Rat) / 168) [(8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((97923607474811 : Rat) / 532849823604) [(8, 1), (12, 1), (13, 2)],
  term ((-475 : Rat) / 42) [(8, 1), (12, 1), (13, 2), (16, 1)],
  term ((32516523481 : Rat) / 2819311236) [(8, 1), (12, 1), (14, 1)],
  term ((3366906314273 : Rat) / 29602767978) [(8, 1), (12, 1), (14, 1), (15, 2)],
  term ((-65 : Rat) / 7) [(8, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((496223218750097 : Rat) / 4351606892766) [(8, 1), (12, 1), (15, 2)],
  term ((163 : Rat) / 42) [(8, 1), (12, 1), (15, 2), (16, 1)],
  term ((32516523481 : Rat) / 2819311236) [(9, 1), (13, 1), (14, 1)],
  term ((3366906314273 : Rat) / 29602767978) [(9, 1), (13, 1), (14, 1), (15, 2)],
  term ((-65 : Rat) / 7) [(9, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((496223218750097 : Rat) / 4351606892766) [(9, 1), (13, 1), (15, 2)],
  term ((163 : Rat) / 42) [(9, 1), (13, 1), (15, 2), (16, 1)],
  term ((305 : Rat) / 28) [(9, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-46953690839072645 : Rat) / 104438565426384) [(9, 1), (13, 2), (15, 1)],
  term ((841 : Rat) / 168) [(9, 1), (13, 2), (15, 1), (16, 1)],
  term ((97923607474811 : Rat) / 532849823604) [(9, 1), (13, 3)],
  term ((-475 : Rat) / 42) [(9, 1), (13, 3), (16, 1)],
  term ((-305 : Rat) / 56) [(12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((46953690839072645 : Rat) / 208877130852768) [(12, 2), (13, 1), (15, 1)],
  term ((-841 : Rat) / 336) [(12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-97923607474811 : Rat) / 1065699647208) [(12, 2), (13, 2)],
  term ((475 : Rat) / 84) [(12, 2), (13, 2), (16, 1)],
  term ((-32516523481 : Rat) / 5638622472) [(12, 2), (14, 1)],
  term ((-3366906314273 : Rat) / 59205535956) [(12, 2), (14, 1), (15, 2)],
  term ((65 : Rat) / 14) [(12, 2), (14, 1), (15, 2), (16, 1)],
  term ((-496223218750097 : Rat) / 8703213785532) [(12, 2), (15, 2)],
  term ((-163 : Rat) / 84) [(12, 2), (15, 2), (16, 1)],
  term ((-32516523481 : Rat) / 5638622472) [(13, 2), (14, 1)],
  term ((-3366906314273 : Rat) / 59205535956) [(13, 2), (14, 1), (15, 2)],
  term ((65 : Rat) / 14) [(13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-496223218750097 : Rat) / 8703213785532) [(13, 2), (15, 2)],
  term ((-163 : Rat) / 84) [(13, 2), (15, 2), (16, 1)],
  term ((-305 : Rat) / 56) [(13, 3), (14, 1), (15, 1), (16, 1)],
  term ((46953690839072645 : Rat) / 208877130852768) [(13, 3), (15, 1)],
  term ((-841 : Rat) / 336) [(13, 3), (15, 1), (16, 1)],
  term ((-97923607474811 : Rat) / 1065699647208) [(13, 4)],
  term ((475 : Rat) / 84) [(13, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 21, terms 100 through 109. -/
theorem rs_R009_ueqv_R009YNNNN_block_21_0100_0109_valid :
    checkProductSumEq rs_R009_ueqv_R009YNNNN_partials_21_0100_0109
      rs_R009_ueqv_R009YNNNN_block_21_0100_0109 = true := by
  native_decide

end R009UeqvR009YNNNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
