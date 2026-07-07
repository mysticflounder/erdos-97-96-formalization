/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NYYYY, term block 11:200-206

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NYYYYTermShards

/-- Generator polynomial 11 for relaxed split surplus certificate `R009:u=v:R009NYYYY`. -/
def rs_R009_ueqv_R009NYYYY_generator_11_0200_0206 : Poly :=
[
  term (2 : Rat) [(2, 1), (4, 1)],
  term (2 : Rat) [(3, 1), (5, 1)],
  term (-1 : Rat) [(4, 2)],
  term (-1 : Rat) [(5, 2)]
]

/-- Coefficient term 200 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009NYYYY_coefficient_11_0200 : Poly :=
[
  term ((-41 : Rat) / 20) [(13, 2)]
]

/-- Partial product 200 for generator 11. -/
def rs_R009_ueqv_R009NYYYY_partial_11_0200 : Poly :=
[
  term ((-41 : Rat) / 10) [(2, 1), (4, 1), (13, 2)],
  term ((-41 : Rat) / 10) [(3, 1), (5, 1), (13, 2)],
  term ((41 : Rat) / 20) [(4, 2), (13, 2)],
  term ((41 : Rat) / 20) [(5, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 200 for generator 11. -/
theorem rs_R009_ueqv_R009NYYYY_partial_11_0200_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_11_0200
        rs_R009_ueqv_R009NYYYY_generator_11_0200_0206 =
      rs_R009_ueqv_R009NYYYY_partial_11_0200 := by
  native_decide

/-- Coefficient term 201 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009NYYYY_coefficient_11_0201 : Poly :=
[
  term ((28926825741 : Rat) / 9482710) [(13, 2), (15, 2)]
]

/-- Partial product 201 for generator 11. -/
def rs_R009_ueqv_R009NYYYY_partial_11_0201 : Poly :=
[
  term ((28926825741 : Rat) / 4741355) [(2, 1), (4, 1), (13, 2), (15, 2)],
  term ((28926825741 : Rat) / 4741355) [(3, 1), (5, 1), (13, 2), (15, 2)],
  term ((-28926825741 : Rat) / 9482710) [(4, 2), (13, 2), (15, 2)],
  term ((-28926825741 : Rat) / 9482710) [(5, 2), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 201 for generator 11. -/
theorem rs_R009_ueqv_R009NYYYY_partial_11_0201_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_11_0201
        rs_R009_ueqv_R009NYYYY_generator_11_0200_0206 =
      rs_R009_ueqv_R009NYYYY_partial_11_0201 := by
  native_decide

/-- Coefficient term 202 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009NYYYY_coefficient_11_0202 : Poly :=
[
  term ((-19233532 : Rat) / 32699) [(13, 2), (15, 2), (16, 1)]
]

/-- Partial product 202 for generator 11. -/
def rs_R009_ueqv_R009NYYYY_partial_11_0202 : Poly :=
[
  term ((-38467064 : Rat) / 32699) [(2, 1), (4, 1), (13, 2), (15, 2), (16, 1)],
  term ((-38467064 : Rat) / 32699) [(3, 1), (5, 1), (13, 2), (15, 2), (16, 1)],
  term ((19233532 : Rat) / 32699) [(4, 2), (13, 2), (15, 2), (16, 1)],
  term ((19233532 : Rat) / 32699) [(5, 2), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 202 for generator 11. -/
theorem rs_R009_ueqv_R009NYYYY_partial_11_0202_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_11_0202
        rs_R009_ueqv_R009NYYYY_generator_11_0200_0206 =
      rs_R009_ueqv_R009NYYYY_partial_11_0202 := by
  native_decide

/-- Coefficient term 203 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009NYYYY_coefficient_11_0203 : Poly :=
[
  term ((-477719049503 : Rat) / 637238112) [(15, 2)]
]

/-- Partial product 203 for generator 11. -/
def rs_R009_ueqv_R009NYYYY_partial_11_0203 : Poly :=
[
  term ((-477719049503 : Rat) / 318619056) [(2, 1), (4, 1), (15, 2)],
  term ((-477719049503 : Rat) / 318619056) [(3, 1), (5, 1), (15, 2)],
  term ((477719049503 : Rat) / 637238112) [(4, 2), (15, 2)],
  term ((477719049503 : Rat) / 637238112) [(5, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 203 for generator 11. -/
theorem rs_R009_ueqv_R009NYYYY_partial_11_0203_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_11_0203
        rs_R009_ueqv_R009NYYYY_generator_11_0200_0206 =
      rs_R009_ueqv_R009NYYYY_partial_11_0203 := by
  native_decide

/-- Coefficient term 204 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009NYYYY_coefficient_11_0204 : Poly :=
[
  term ((54053573 : Rat) / 392388) [(15, 2), (16, 1)]
]

/-- Partial product 204 for generator 11. -/
def rs_R009_ueqv_R009NYYYY_partial_11_0204 : Poly :=
[
  term ((54053573 : Rat) / 196194) [(2, 1), (4, 1), (15, 2), (16, 1)],
  term ((54053573 : Rat) / 196194) [(3, 1), (5, 1), (15, 2), (16, 1)],
  term ((-54053573 : Rat) / 392388) [(4, 2), (15, 2), (16, 1)],
  term ((-54053573 : Rat) / 392388) [(5, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 204 for generator 11. -/
theorem rs_R009_ueqv_R009NYYYY_partial_11_0204_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_11_0204
        rs_R009_ueqv_R009NYYYY_generator_11_0200_0206 =
      rs_R009_ueqv_R009NYYYY_partial_11_0204 := by
  native_decide

/-- Coefficient term 205 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009NYYYY_coefficient_11_0205 : Poly :=
[
  term ((713886046843 : Rat) / 796547640) [(15, 4)]
]

/-- Partial product 205 for generator 11. -/
def rs_R009_ueqv_R009NYYYY_partial_11_0205 : Poly :=
[
  term ((713886046843 : Rat) / 398273820) [(2, 1), (4, 1), (15, 4)],
  term ((713886046843 : Rat) / 398273820) [(3, 1), (5, 1), (15, 4)],
  term ((-713886046843 : Rat) / 796547640) [(4, 2), (15, 4)],
  term ((-713886046843 : Rat) / 796547640) [(5, 2), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 205 for generator 11. -/
theorem rs_R009_ueqv_R009NYYYY_partial_11_0205_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_11_0205
        rs_R009_ueqv_R009NYYYY_generator_11_0200_0206 =
      rs_R009_ueqv_R009NYYYY_partial_11_0205 := by
  native_decide

/-- Coefficient term 206 from coefficient polynomial 11. -/
def rs_R009_ueqv_R009NYYYY_coefficient_11_0206 : Poly :=
[
  term ((-17064581 : Rat) / 98097) [(15, 4), (16, 1)]
]

/-- Partial product 206 for generator 11. -/
def rs_R009_ueqv_R009NYYYY_partial_11_0206 : Poly :=
[
  term ((-34129162 : Rat) / 98097) [(2, 1), (4, 1), (15, 4), (16, 1)],
  term ((-34129162 : Rat) / 98097) [(3, 1), (5, 1), (15, 4), (16, 1)],
  term ((17064581 : Rat) / 98097) [(4, 2), (15, 4), (16, 1)],
  term ((17064581 : Rat) / 98097) [(5, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 206 for generator 11. -/
theorem rs_R009_ueqv_R009NYYYY_partial_11_0206_valid :
    mulPoly rs_R009_ueqv_R009NYYYY_coefficient_11_0206
        rs_R009_ueqv_R009NYYYY_generator_11_0200_0206 =
      rs_R009_ueqv_R009NYYYY_partial_11_0206 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NYYYY_partials_11_0200_0206 : List Poly :=
[
  rs_R009_ueqv_R009NYYYY_partial_11_0200,
  rs_R009_ueqv_R009NYYYY_partial_11_0201,
  rs_R009_ueqv_R009NYYYY_partial_11_0202,
  rs_R009_ueqv_R009NYYYY_partial_11_0203,
  rs_R009_ueqv_R009NYYYY_partial_11_0204,
  rs_R009_ueqv_R009NYYYY_partial_11_0205,
  rs_R009_ueqv_R009NYYYY_partial_11_0206
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NYYYY_block_11_0200_0206 : Poly :=
[
  term ((-41 : Rat) / 10) [(2, 1), (4, 1), (13, 2)],
  term ((28926825741 : Rat) / 4741355) [(2, 1), (4, 1), (13, 2), (15, 2)],
  term ((-38467064 : Rat) / 32699) [(2, 1), (4, 1), (13, 2), (15, 2), (16, 1)],
  term ((-477719049503 : Rat) / 318619056) [(2, 1), (4, 1), (15, 2)],
  term ((54053573 : Rat) / 196194) [(2, 1), (4, 1), (15, 2), (16, 1)],
  term ((713886046843 : Rat) / 398273820) [(2, 1), (4, 1), (15, 4)],
  term ((-34129162 : Rat) / 98097) [(2, 1), (4, 1), (15, 4), (16, 1)],
  term ((-41 : Rat) / 10) [(3, 1), (5, 1), (13, 2)],
  term ((28926825741 : Rat) / 4741355) [(3, 1), (5, 1), (13, 2), (15, 2)],
  term ((-38467064 : Rat) / 32699) [(3, 1), (5, 1), (13, 2), (15, 2), (16, 1)],
  term ((-477719049503 : Rat) / 318619056) [(3, 1), (5, 1), (15, 2)],
  term ((54053573 : Rat) / 196194) [(3, 1), (5, 1), (15, 2), (16, 1)],
  term ((713886046843 : Rat) / 398273820) [(3, 1), (5, 1), (15, 4)],
  term ((-34129162 : Rat) / 98097) [(3, 1), (5, 1), (15, 4), (16, 1)],
  term ((41 : Rat) / 20) [(4, 2), (13, 2)],
  term ((-28926825741 : Rat) / 9482710) [(4, 2), (13, 2), (15, 2)],
  term ((19233532 : Rat) / 32699) [(4, 2), (13, 2), (15, 2), (16, 1)],
  term ((477719049503 : Rat) / 637238112) [(4, 2), (15, 2)],
  term ((-54053573 : Rat) / 392388) [(4, 2), (15, 2), (16, 1)],
  term ((-713886046843 : Rat) / 796547640) [(4, 2), (15, 4)],
  term ((17064581 : Rat) / 98097) [(4, 2), (15, 4), (16, 1)],
  term ((41 : Rat) / 20) [(5, 2), (13, 2)],
  term ((-28926825741 : Rat) / 9482710) [(5, 2), (13, 2), (15, 2)],
  term ((19233532 : Rat) / 32699) [(5, 2), (13, 2), (15, 2), (16, 1)],
  term ((477719049503 : Rat) / 637238112) [(5, 2), (15, 2)],
  term ((-54053573 : Rat) / 392388) [(5, 2), (15, 2), (16, 1)],
  term ((-713886046843 : Rat) / 796547640) [(5, 2), (15, 4)],
  term ((17064581 : Rat) / 98097) [(5, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 11, terms 200 through 206. -/
theorem rs_R009_ueqv_R009NYYYY_block_11_0200_0206_valid :
    checkProductSumEq rs_R009_ueqv_R009NYYYY_partials_11_0200_0206
      rs_R009_ueqv_R009NYYYY_block_11_0200_0206 = true := by
  native_decide

end R009UeqvR009NYYYYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
