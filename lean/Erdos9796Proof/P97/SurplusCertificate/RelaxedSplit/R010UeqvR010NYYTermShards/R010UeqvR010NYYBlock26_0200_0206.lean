/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R010:u=v:R010NYY, term block 26:200-206

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R010UeqvR010NYYTermShards

/-- Generator polynomial 26 for relaxed split surplus certificate `R010:u=v:R010NYY`. -/
def rs_R010_ueqv_R010NYY_generator_26_0200_0206 : Poly :=
[
  term (2 : Rat) [(8, 1), (12, 1)],
  term (-1 : Rat) [(8, 2)],
  term (2 : Rat) [(9, 1), (13, 1)],
  term (-1 : Rat) [(9, 2)]
]

/-- Coefficient term 200 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010NYY_coefficient_26_0200 : Poly :=
[
  term ((833860523506862349991 : Rat) / 25270602035491954176) [(11, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 200 for generator 26. -/
def rs_R010_ueqv_R010NYY_partial_26_0200 : Poly :=
[
  term ((833860523506862349991 : Rat) / 12635301017745977088) [(8, 1), (11, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-833860523506862349991 : Rat) / 25270602035491954176) [(8, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((833860523506862349991 : Rat) / 12635301017745977088) [(9, 1), (11, 2), (13, 2), (15, 1), (16, 1)],
  term ((-833860523506862349991 : Rat) / 25270602035491954176) [(9, 2), (11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 200 for generator 26. -/
theorem rs_R010_ueqv_R010NYY_partial_26_0200_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_26_0200
        rs_R010_ueqv_R010NYY_generator_26_0200_0206 =
      rs_R010_ueqv_R010NYY_partial_26_0200 := by
  native_decide

/-- Coefficient term 201 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010NYY_coefficient_26_0201 : Poly :=
[
  term ((-34020392351833734492559 : Rat) / 151623612212951725056) [(11, 2), (15, 2), (16, 1)]
]

/-- Partial product 201 for generator 26. -/
def rs_R010_ueqv_R010NYY_partial_26_0201 : Poly :=
[
  term ((-34020392351833734492559 : Rat) / 75811806106475862528) [(8, 1), (11, 2), (12, 1), (15, 2), (16, 1)],
  term ((34020392351833734492559 : Rat) / 151623612212951725056) [(8, 2), (11, 2), (15, 2), (16, 1)],
  term ((-34020392351833734492559 : Rat) / 75811806106475862528) [(9, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((34020392351833734492559 : Rat) / 151623612212951725056) [(9, 2), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 201 for generator 26. -/
theorem rs_R010_ueqv_R010NYY_partial_26_0201_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_26_0201
        rs_R010_ueqv_R010NYY_generator_26_0200_0206 =
      rs_R010_ueqv_R010NYY_partial_26_0201 := by
  native_decide

/-- Coefficient term 202 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010NYY_coefficient_26_0202 : Poly :=
[
  term ((59829091057049205625 : Rat) / 1805043002535139584) [(11, 2), (16, 1)]
]

/-- Partial product 202 for generator 26. -/
def rs_R010_ueqv_R010NYY_partial_26_0202 : Poly :=
[
  term ((59829091057049205625 : Rat) / 902521501267569792) [(8, 1), (11, 2), (12, 1), (16, 1)],
  term ((-59829091057049205625 : Rat) / 1805043002535139584) [(8, 2), (11, 2), (16, 1)],
  term ((59829091057049205625 : Rat) / 902521501267569792) [(9, 1), (11, 2), (13, 1), (16, 1)],
  term ((-59829091057049205625 : Rat) / 1805043002535139584) [(9, 2), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 202 for generator 26. -/
theorem rs_R010_ueqv_R010NYY_partial_26_0202_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_26_0202
        rs_R010_ueqv_R010NYY_generator_26_0200_0206 =
      rs_R010_ueqv_R010NYY_partial_26_0202 := by
  native_decide

/-- Coefficient term 203 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010NYY_coefficient_26_0203 : Poly :=
[
  term ((69556067785407573619 : Rat) / 3158825254436494272) [(11, 3), (15, 1), (16, 1)]
]

/-- Partial product 203 for generator 26. -/
def rs_R010_ueqv_R010NYY_partial_26_0203 : Poly :=
[
  term ((69556067785407573619 : Rat) / 1579412627218247136) [(8, 1), (11, 3), (12, 1), (15, 1), (16, 1)],
  term ((-69556067785407573619 : Rat) / 3158825254436494272) [(8, 2), (11, 3), (15, 1), (16, 1)],
  term ((69556067785407573619 : Rat) / 1579412627218247136) [(9, 1), (11, 3), (13, 1), (15, 1), (16, 1)],
  term ((-69556067785407573619 : Rat) / 3158825254436494272) [(9, 2), (11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 203 for generator 26. -/
theorem rs_R010_ueqv_R010NYY_partial_26_0203_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_26_0203
        rs_R010_ueqv_R010NYY_generator_26_0200_0206 =
      rs_R010_ueqv_R010NYY_partial_26_0203 := by
  native_decide

/-- Coefficient term 204 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010NYY_coefficient_26_0204 : Poly :=
[
  term ((938905485519063381 : Rat) / 47725405166179328) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 204 for generator 26. -/
def rs_R010_ueqv_R010NYY_partial_26_0204 : Poly :=
[
  term ((938905485519063381 : Rat) / 23862702583089664) [(8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-938905485519063381 : Rat) / 47725405166179328) [(8, 2), (13, 1), (15, 1), (16, 1)],
  term ((938905485519063381 : Rat) / 23862702583089664) [(9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-938905485519063381 : Rat) / 47725405166179328) [(9, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 204 for generator 26. -/
theorem rs_R010_ueqv_R010NYY_partial_26_0204_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_26_0204
        rs_R010_ueqv_R010NYY_generator_26_0200_0206 =
      rs_R010_ueqv_R010NYY_partial_26_0204 := by
  native_decide

/-- Coefficient term 205 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010NYY_coefficient_26_0205 : Poly :=
[
  term ((-80157890929827559 : Rat) / 967406861476608) [(15, 2), (16, 1)]
]

/-- Partial product 205 for generator 26. -/
def rs_R010_ueqv_R010NYY_partial_26_0205 : Poly :=
[
  term ((-80157890929827559 : Rat) / 483703430738304) [(8, 1), (12, 1), (15, 2), (16, 1)],
  term ((80157890929827559 : Rat) / 967406861476608) [(8, 2), (15, 2), (16, 1)],
  term ((-80157890929827559 : Rat) / 483703430738304) [(9, 1), (13, 1), (15, 2), (16, 1)],
  term ((80157890929827559 : Rat) / 967406861476608) [(9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 205 for generator 26. -/
theorem rs_R010_ueqv_R010NYY_partial_26_0205_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_26_0205
        rs_R010_ueqv_R010NYY_generator_26_0200_0206 =
      rs_R010_ueqv_R010NYY_partial_26_0205 := by
  native_decide

/-- Coefficient term 206 from coefficient polynomial 26. -/
def rs_R010_ueqv_R010NYY_coefficient_26_0206 : Poly :=
[
  term ((191524906825139 : Rat) / 486993930267136) [(16, 1)]
]

/-- Partial product 206 for generator 26. -/
def rs_R010_ueqv_R010NYY_partial_26_0206 : Poly :=
[
  term ((191524906825139 : Rat) / 243496965133568) [(8, 1), (12, 1), (16, 1)],
  term ((-191524906825139 : Rat) / 486993930267136) [(8, 2), (16, 1)],
  term ((191524906825139 : Rat) / 243496965133568) [(9, 1), (13, 1), (16, 1)],
  term ((-191524906825139 : Rat) / 486993930267136) [(9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 206 for generator 26. -/
theorem rs_R010_ueqv_R010NYY_partial_26_0206_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_26_0206
        rs_R010_ueqv_R010NYY_generator_26_0200_0206 =
      rs_R010_ueqv_R010NYY_partial_26_0206 := by
  native_decide

/-- Partial products in this block. -/
def rs_R010_ueqv_R010NYY_partials_26_0200_0206 : List Poly :=
[
  rs_R010_ueqv_R010NYY_partial_26_0200,
  rs_R010_ueqv_R010NYY_partial_26_0201,
  rs_R010_ueqv_R010NYY_partial_26_0202,
  rs_R010_ueqv_R010NYY_partial_26_0203,
  rs_R010_ueqv_R010NYY_partial_26_0204,
  rs_R010_ueqv_R010NYY_partial_26_0205,
  rs_R010_ueqv_R010NYY_partial_26_0206
]

/-- Sum of partial products in this block. -/
def rs_R010_ueqv_R010NYY_block_26_0200_0206 : Poly :=
[
  term ((833860523506862349991 : Rat) / 12635301017745977088) [(8, 1), (11, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-34020392351833734492559 : Rat) / 75811806106475862528) [(8, 1), (11, 2), (12, 1), (15, 2), (16, 1)],
  term ((59829091057049205625 : Rat) / 902521501267569792) [(8, 1), (11, 2), (12, 1), (16, 1)],
  term ((69556067785407573619 : Rat) / 1579412627218247136) [(8, 1), (11, 3), (12, 1), (15, 1), (16, 1)],
  term ((938905485519063381 : Rat) / 23862702583089664) [(8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-80157890929827559 : Rat) / 483703430738304) [(8, 1), (12, 1), (15, 2), (16, 1)],
  term ((191524906825139 : Rat) / 243496965133568) [(8, 1), (12, 1), (16, 1)],
  term ((-833860523506862349991 : Rat) / 25270602035491954176) [(8, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((34020392351833734492559 : Rat) / 151623612212951725056) [(8, 2), (11, 2), (15, 2), (16, 1)],
  term ((-59829091057049205625 : Rat) / 1805043002535139584) [(8, 2), (11, 2), (16, 1)],
  term ((-69556067785407573619 : Rat) / 3158825254436494272) [(8, 2), (11, 3), (15, 1), (16, 1)],
  term ((-938905485519063381 : Rat) / 47725405166179328) [(8, 2), (13, 1), (15, 1), (16, 1)],
  term ((80157890929827559 : Rat) / 967406861476608) [(8, 2), (15, 2), (16, 1)],
  term ((-191524906825139 : Rat) / 486993930267136) [(8, 2), (16, 1)],
  term ((-34020392351833734492559 : Rat) / 75811806106475862528) [(9, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((59829091057049205625 : Rat) / 902521501267569792) [(9, 1), (11, 2), (13, 1), (16, 1)],
  term ((833860523506862349991 : Rat) / 12635301017745977088) [(9, 1), (11, 2), (13, 2), (15, 1), (16, 1)],
  term ((69556067785407573619 : Rat) / 1579412627218247136) [(9, 1), (11, 3), (13, 1), (15, 1), (16, 1)],
  term ((-80157890929827559 : Rat) / 483703430738304) [(9, 1), (13, 1), (15, 2), (16, 1)],
  term ((191524906825139 : Rat) / 243496965133568) [(9, 1), (13, 1), (16, 1)],
  term ((938905485519063381 : Rat) / 23862702583089664) [(9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-833860523506862349991 : Rat) / 25270602035491954176) [(9, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((34020392351833734492559 : Rat) / 151623612212951725056) [(9, 2), (11, 2), (15, 2), (16, 1)],
  term ((-59829091057049205625 : Rat) / 1805043002535139584) [(9, 2), (11, 2), (16, 1)],
  term ((-69556067785407573619 : Rat) / 3158825254436494272) [(9, 2), (11, 3), (15, 1), (16, 1)],
  term ((-938905485519063381 : Rat) / 47725405166179328) [(9, 2), (13, 1), (15, 1), (16, 1)],
  term ((80157890929827559 : Rat) / 967406861476608) [(9, 2), (15, 2), (16, 1)],
  term ((-191524906825139 : Rat) / 486993930267136) [(9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 26, terms 200 through 206. -/
theorem rs_R010_ueqv_R010NYY_block_26_0200_0206_valid :
    checkProductSumEq rs_R010_ueqv_R010NYY_partials_26_0200_0206
      rs_R010_ueqv_R010NYY_block_26_0200_0206 = true := by
  native_decide

end R010UeqvR010NYYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
