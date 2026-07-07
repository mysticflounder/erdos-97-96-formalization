/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R010:u=v:R010NYY, term block 3:200-247

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R010UeqvR010NYYTermShards

/-- Generator polynomial 3 for relaxed split surplus certificate `R010:u=v:R010NYY`. -/
def rs_R010_ueqv_R010NYY_generator_03_0200_0247 : Poly :=
[
  term (-2 : Rat) [(6, 1)],
  term (1 : Rat) [(6, 2)],
  term (1 : Rat) [(7, 2)],
  term (2 : Rat) [(8, 1)],
  term (-1 : Rat) [(8, 2)],
  term (-1 : Rat) [(9, 2)]
]

/-- Coefficient term 200 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010NYY_coefficient_03_0200 : Poly :=
[
  term ((-23088038262747441 : Rat) / 2982837822886208) [(8, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 200 for generator 3. -/
def rs_R010_ueqv_R010NYY_partial_03_0200 : Poly :=
[
  term ((23088038262747441 : Rat) / 1491418911443104) [(6, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-23088038262747441 : Rat) / 2982837822886208) [(6, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-23088038262747441 : Rat) / 2982837822886208) [(7, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((23088038262747441 : Rat) / 2982837822886208) [(8, 1), (9, 3), (15, 1), (16, 1)],
  term ((-23088038262747441 : Rat) / 1491418911443104) [(8, 2), (9, 1), (15, 1), (16, 1)],
  term ((23088038262747441 : Rat) / 2982837822886208) [(8, 3), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 200 for generator 3. -/
theorem rs_R010_ueqv_R010NYY_partial_03_0200_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_03_0200
        rs_R010_ueqv_R010NYY_generator_03_0200_0247 =
      rs_R010_ueqv_R010NYY_partial_03_0200 := by
  native_decide

/-- Coefficient term 201 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010NYY_coefficient_03_0201 : Poly :=
[
  term ((349947488033723 : Rat) / 852239377967488) [(8, 1), (10, 1), (16, 1)]
]

/-- Partial product 201 for generator 3. -/
def rs_R010_ueqv_R010NYY_partial_03_0201 : Poly :=
[
  term ((-349947488033723 : Rat) / 426119688983744) [(6, 1), (8, 1), (10, 1), (16, 1)],
  term ((349947488033723 : Rat) / 852239377967488) [(6, 2), (8, 1), (10, 1), (16, 1)],
  term ((349947488033723 : Rat) / 852239377967488) [(7, 2), (8, 1), (10, 1), (16, 1)],
  term ((-349947488033723 : Rat) / 852239377967488) [(8, 1), (9, 2), (10, 1), (16, 1)],
  term ((349947488033723 : Rat) / 426119688983744) [(8, 2), (10, 1), (16, 1)],
  term ((-349947488033723 : Rat) / 852239377967488) [(8, 3), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 201 for generator 3. -/
theorem rs_R010_ueqv_R010NYY_partial_03_0201_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_03_0201
        rs_R010_ueqv_R010NYY_generator_03_0200_0247 =
      rs_R010_ueqv_R010NYY_partial_03_0201 := by
  native_decide

/-- Coefficient term 202 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010NYY_coefficient_03_0202 : Poly :=
[
  term ((2501989506380616351889 : Rat) / 75811806106475862528) [(8, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 202 for generator 3. -/
def rs_R010_ueqv_R010NYY_partial_03_0202 : Poly :=
[
  term ((-2501989506380616351889 : Rat) / 37905903053237931264) [(6, 1), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((2501989506380616351889 : Rat) / 75811806106475862528) [(6, 2), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((2501989506380616351889 : Rat) / 75811806106475862528) [(7, 2), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((-2501989506380616351889 : Rat) / 75811806106475862528) [(8, 1), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((2501989506380616351889 : Rat) / 37905903053237931264) [(8, 2), (11, 1), (13, 1), (16, 1)],
  term ((-2501989506380616351889 : Rat) / 75811806106475862528) [(8, 3), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 202 for generator 3. -/
theorem rs_R010_ueqv_R010NYY_partial_03_0202_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_03_0202
        rs_R010_ueqv_R010NYY_generator_03_0200_0247 =
      rs_R010_ueqv_R010NYY_partial_03_0202 := by
  native_decide

/-- Coefficient term 203 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010NYY_coefficient_03_0203 : Poly :=
[
  term ((-70504275386458221868411 : Rat) / 303247224425903450112) [(8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 203 for generator 3. -/
def rs_R010_ueqv_R010NYY_partial_03_0203 : Poly :=
[
  term ((70504275386458221868411 : Rat) / 151623612212951725056) [(6, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-70504275386458221868411 : Rat) / 303247224425903450112) [(6, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-70504275386458221868411 : Rat) / 303247224425903450112) [(7, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((70504275386458221868411 : Rat) / 303247224425903450112) [(8, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-70504275386458221868411 : Rat) / 151623612212951725056) [(8, 2), (11, 1), (15, 1), (16, 1)],
  term ((70504275386458221868411 : Rat) / 303247224425903450112) [(8, 3), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 203 for generator 3. -/
theorem rs_R010_ueqv_R010NYY_partial_03_0203_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_03_0203
        rs_R010_ueqv_R010NYY_generator_03_0200_0247 =
      rs_R010_ueqv_R010NYY_partial_03_0203 := by
  native_decide

/-- Coefficient term 204 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010NYY_coefficient_03_0204 : Poly :=
[
  term ((-562943367046585856495 : Rat) / 50541204070983908352) [(8, 1), (11, 2), (16, 1)]
]

/-- Partial product 204 for generator 3. -/
def rs_R010_ueqv_R010NYY_partial_03_0204 : Poly :=
[
  term ((562943367046585856495 : Rat) / 25270602035491954176) [(6, 1), (8, 1), (11, 2), (16, 1)],
  term ((-562943367046585856495 : Rat) / 50541204070983908352) [(6, 2), (8, 1), (11, 2), (16, 1)],
  term ((-562943367046585856495 : Rat) / 50541204070983908352) [(7, 2), (8, 1), (11, 2), (16, 1)],
  term ((562943367046585856495 : Rat) / 50541204070983908352) [(8, 1), (9, 2), (11, 2), (16, 1)],
  term ((-562943367046585856495 : Rat) / 25270602035491954176) [(8, 2), (11, 2), (16, 1)],
  term ((562943367046585856495 : Rat) / 50541204070983908352) [(8, 3), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 204 for generator 3. -/
theorem rs_R010_ueqv_R010NYY_partial_03_0204_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_03_0204
        rs_R010_ueqv_R010NYY_generator_03_0200_0247 =
      rs_R010_ueqv_R010NYY_partial_03_0204 := by
  native_decide

/-- Coefficient term 205 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010NYY_coefficient_03_0205 : Poly :=
[
  term ((54259707074511783 : Rat) / 23862702583089664) [(8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 205 for generator 3. -/
def rs_R010_ueqv_R010NYY_partial_03_0205 : Poly :=
[
  term ((-54259707074511783 : Rat) / 11931351291544832) [(6, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((54259707074511783 : Rat) / 23862702583089664) [(6, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((54259707074511783 : Rat) / 23862702583089664) [(7, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-54259707074511783 : Rat) / 23862702583089664) [(8, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((54259707074511783 : Rat) / 11931351291544832) [(8, 2), (13, 1), (15, 1), (16, 1)],
  term ((-54259707074511783 : Rat) / 23862702583089664) [(8, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 205 for generator 3. -/
theorem rs_R010_ueqv_R010NYY_partial_03_0205_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_03_0205
        rs_R010_ueqv_R010NYY_generator_03_0200_0247 =
      rs_R010_ueqv_R010NYY_partial_03_0205 := by
  native_decide

/-- Coefficient term 206 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010NYY_coefficient_03_0206 : Poly :=
[
  term ((-1894914691676530775 : Rat) / 47725405166179328) [(8, 1), (15, 2), (16, 1)]
]

/-- Partial product 206 for generator 3. -/
def rs_R010_ueqv_R010NYY_partial_03_0206 : Poly :=
[
  term ((1894914691676530775 : Rat) / 23862702583089664) [(6, 1), (8, 1), (15, 2), (16, 1)],
  term ((-1894914691676530775 : Rat) / 47725405166179328) [(6, 2), (8, 1), (15, 2), (16, 1)],
  term ((-1894914691676530775 : Rat) / 47725405166179328) [(7, 2), (8, 1), (15, 2), (16, 1)],
  term ((1894914691676530775 : Rat) / 47725405166179328) [(8, 1), (9, 2), (15, 2), (16, 1)],
  term ((-1894914691676530775 : Rat) / 23862702583089664) [(8, 2), (15, 2), (16, 1)],
  term ((1894914691676530775 : Rat) / 47725405166179328) [(8, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 206 for generator 3. -/
theorem rs_R010_ueqv_R010NYY_partial_03_0206_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_03_0206
        rs_R010_ueqv_R010NYY_generator_03_0200_0247 =
      rs_R010_ueqv_R010NYY_partial_03_0206 := by
  native_decide

/-- Coefficient term 207 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010NYY_coefficient_03_0207 : Poly :=
[
  term ((301259657481529 : Rat) / 1278359066951232) [(8, 1), (16, 1)]
]

/-- Partial product 207 for generator 3. -/
def rs_R010_ueqv_R010NYY_partial_03_0207 : Poly :=
[
  term ((-301259657481529 : Rat) / 639179533475616) [(6, 1), (8, 1), (16, 1)],
  term ((301259657481529 : Rat) / 1278359066951232) [(6, 2), (8, 1), (16, 1)],
  term ((301259657481529 : Rat) / 1278359066951232) [(7, 2), (8, 1), (16, 1)],
  term ((-301259657481529 : Rat) / 1278359066951232) [(8, 1), (9, 2), (16, 1)],
  term ((301259657481529 : Rat) / 639179533475616) [(8, 2), (16, 1)],
  term ((-301259657481529 : Rat) / 1278359066951232) [(8, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 207 for generator 3. -/
theorem rs_R010_ueqv_R010NYY_partial_03_0207_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_03_0207
        rs_R010_ueqv_R010NYY_generator_03_0200_0247 =
      rs_R010_ueqv_R010NYY_partial_03_0207 := by
  native_decide

/-- Coefficient term 208 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010NYY_coefficient_03_0208 : Poly :=
[
  term ((18658404945247128977 : Rat) / 1805043002535139584) [(9, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 208 for generator 3. -/
def rs_R010_ueqv_R010NYY_partial_03_0208 : Poly :=
[
  term ((-18658404945247128977 : Rat) / 902521501267569792) [(6, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((18658404945247128977 : Rat) / 1805043002535139584) [(6, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((18658404945247128977 : Rat) / 1805043002535139584) [(7, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((18658404945247128977 : Rat) / 902521501267569792) [(8, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-18658404945247128977 : Rat) / 1805043002535139584) [(8, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-18658404945247128977 : Rat) / 1805043002535139584) [(9, 3), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 208 for generator 3. -/
theorem rs_R010_ueqv_R010NYY_partial_03_0208_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_03_0208
        rs_R010_ueqv_R010NYY_generator_03_0200_0247 =
      rs_R010_ueqv_R010NYY_partial_03_0208 := by
  native_decide

/-- Coefficient term 209 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010NYY_coefficient_03_0209 : Poly :=
[
  term ((-349947488033723 : Rat) / 426119688983744) [(9, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 209 for generator 3. -/
def rs_R010_ueqv_R010NYY_partial_03_0209 : Poly :=
[
  term ((349947488033723 : Rat) / 213059844491872) [(6, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-349947488033723 : Rat) / 426119688983744) [(6, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-349947488033723 : Rat) / 426119688983744) [(7, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-349947488033723 : Rat) / 213059844491872) [(8, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((349947488033723 : Rat) / 426119688983744) [(8, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((349947488033723 : Rat) / 426119688983744) [(9, 3), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 209 for generator 3. -/
theorem rs_R010_ueqv_R010NYY_partial_03_0209_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_03_0209
        rs_R010_ueqv_R010NYY_generator_03_0200_0247 =
      rs_R010_ueqv_R010NYY_partial_03_0209 := by
  native_decide

/-- Coefficient term 210 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010NYY_coefficient_03_0210 : Poly :=
[
  term ((349947488033723 : Rat) / 213059844491872) [(9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 210 for generator 3. -/
def rs_R010_ueqv_R010NYY_partial_03_0210 : Poly :=
[
  term ((-349947488033723 : Rat) / 106529922245936) [(6, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((349947488033723 : Rat) / 213059844491872) [(6, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((349947488033723 : Rat) / 213059844491872) [(7, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((349947488033723 : Rat) / 106529922245936) [(8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-349947488033723 : Rat) / 213059844491872) [(8, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-349947488033723 : Rat) / 213059844491872) [(9, 3), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 210 for generator 3. -/
theorem rs_R010_ueqv_R010NYY_partial_03_0210_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_03_0210
        rs_R010_ueqv_R010NYY_generator_03_0200_0247 =
      rs_R010_ueqv_R010NYY_partial_03_0210 := by
  native_decide

/-- Coefficient term 211 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010NYY_coefficient_03_0211 : Poly :=
[
  term ((-40649921941699401545 : Rat) / 8423534011830651392) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 211 for generator 3. -/
def rs_R010_ueqv_R010NYY_partial_03_0211 : Poly :=
[
  term ((40649921941699401545 : Rat) / 4211767005915325696) [(6, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-40649921941699401545 : Rat) / 8423534011830651392) [(6, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-40649921941699401545 : Rat) / 8423534011830651392) [(7, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-40649921941699401545 : Rat) / 4211767005915325696) [(8, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((40649921941699401545 : Rat) / 8423534011830651392) [(8, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((40649921941699401545 : Rat) / 8423534011830651392) [(9, 3), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 211 for generator 3. -/
theorem rs_R010_ueqv_R010NYY_partial_03_0211_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_03_0211
        rs_R010_ueqv_R010NYY_generator_03_0200_0247 =
      rs_R010_ueqv_R010NYY_partial_03_0211 := by
  native_decide

/-- Coefficient term 212 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010NYY_coefficient_03_0212 : Poly :=
[
  term ((240937308571641895789 : Rat) / 6317650508872988544) [(9, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 212 for generator 3. -/
def rs_R010_ueqv_R010NYY_partial_03_0212 : Poly :=
[
  term ((-240937308571641895789 : Rat) / 3158825254436494272) [(6, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((240937308571641895789 : Rat) / 6317650508872988544) [(6, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((240937308571641895789 : Rat) / 6317650508872988544) [(7, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((240937308571641895789 : Rat) / 3158825254436494272) [(8, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-240937308571641895789 : Rat) / 6317650508872988544) [(8, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-240937308571641895789 : Rat) / 6317650508872988544) [(9, 3), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 212 for generator 3. -/
theorem rs_R010_ueqv_R010NYY_partial_03_0212_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_03_0212
        rs_R010_ueqv_R010NYY_generator_03_0200_0247 =
      rs_R010_ueqv_R010NYY_partial_03_0212 := by
  native_decide

/-- Coefficient term 213 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010NYY_coefficient_03_0213 : Poly :=
[
  term ((-3952067641481023102391 : Rat) / 101082408141967816704) [(9, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 213 for generator 3. -/
def rs_R010_ueqv_R010NYY_partial_03_0213 : Poly :=
[
  term ((3952067641481023102391 : Rat) / 50541204070983908352) [(6, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-3952067641481023102391 : Rat) / 101082408141967816704) [(6, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-3952067641481023102391 : Rat) / 101082408141967816704) [(7, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-3952067641481023102391 : Rat) / 50541204070983908352) [(8, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((3952067641481023102391 : Rat) / 101082408141967816704) [(8, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((3952067641481023102391 : Rat) / 101082408141967816704) [(9, 3), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 213 for generator 3. -/
theorem rs_R010_ueqv_R010NYY_partial_03_0213_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_03_0213
        rs_R010_ueqv_R010NYY_generator_03_0200_0247 =
      rs_R010_ueqv_R010NYY_partial_03_0213 := by
  native_decide

/-- Coefficient term 214 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010NYY_coefficient_03_0214 : Poly :=
[
  term ((27305026381874146883191 : Rat) / 404329632567871266816) [(9, 1), (11, 1), (16, 1)]
]

/-- Partial product 214 for generator 3. -/
def rs_R010_ueqv_R010NYY_partial_03_0214 : Poly :=
[
  term ((-27305026381874146883191 : Rat) / 202164816283935633408) [(6, 1), (9, 1), (11, 1), (16, 1)],
  term ((27305026381874146883191 : Rat) / 404329632567871266816) [(6, 2), (9, 1), (11, 1), (16, 1)],
  term ((27305026381874146883191 : Rat) / 404329632567871266816) [(7, 2), (9, 1), (11, 1), (16, 1)],
  term ((27305026381874146883191 : Rat) / 202164816283935633408) [(8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-27305026381874146883191 : Rat) / 404329632567871266816) [(8, 2), (9, 1), (11, 1), (16, 1)],
  term ((-27305026381874146883191 : Rat) / 404329632567871266816) [(9, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 214 for generator 3. -/
theorem rs_R010_ueqv_R010NYY_partial_03_0214_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_03_0214
        rs_R010_ueqv_R010NYY_generator_03_0200_0247 =
      rs_R010_ueqv_R010NYY_partial_03_0214 := by
  native_decide

/-- Coefficient term 215 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010NYY_coefficient_03_0215 : Poly :=
[
  term ((-7229145932057854327 : Rat) / 227663081400828416) [(9, 1), (11, 2), (13, 1), (16, 1)]
]

/-- Partial product 215 for generator 3. -/
def rs_R010_ueqv_R010NYY_partial_03_0215 : Poly :=
[
  term ((7229145932057854327 : Rat) / 113831540700414208) [(6, 1), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((-7229145932057854327 : Rat) / 227663081400828416) [(6, 2), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((-7229145932057854327 : Rat) / 227663081400828416) [(7, 2), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((-7229145932057854327 : Rat) / 113831540700414208) [(8, 1), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((7229145932057854327 : Rat) / 227663081400828416) [(8, 2), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((7229145932057854327 : Rat) / 227663081400828416) [(9, 3), (11, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 215 for generator 3. -/
theorem rs_R010_ueqv_R010NYY_partial_03_0215_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_03_0215
        rs_R010_ueqv_R010NYY_generator_03_0200_0247 =
      rs_R010_ueqv_R010NYY_partial_03_0215 := by
  native_decide

/-- Coefficient term 216 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010NYY_coefficient_03_0216 : Poly :=
[
  term ((-582785649347189790577 : Rat) / 12635301017745977088) [(9, 1), (11, 2), (15, 1), (16, 1)]
]

/-- Partial product 216 for generator 3. -/
def rs_R010_ueqv_R010NYY_partial_03_0216 : Poly :=
[
  term ((582785649347189790577 : Rat) / 6317650508872988544) [(6, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-582785649347189790577 : Rat) / 12635301017745977088) [(6, 2), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-582785649347189790577 : Rat) / 12635301017745977088) [(7, 2), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-582785649347189790577 : Rat) / 6317650508872988544) [(8, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((582785649347189790577 : Rat) / 12635301017745977088) [(8, 2), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((582785649347189790577 : Rat) / 12635301017745977088) [(9, 3), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 216 for generator 3. -/
theorem rs_R010_ueqv_R010NYY_partial_03_0216_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_03_0216
        rs_R010_ueqv_R010NYY_generator_03_0200_0247 =
      rs_R010_ueqv_R010NYY_partial_03_0216 := by
  native_decide

/-- Coefficient term 217 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010NYY_coefficient_03_0217 : Poly :=
[
  term ((-215268440529795673 : Rat) / 11931351291544832) [(9, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 217 for generator 3. -/
def rs_R010_ueqv_R010NYY_partial_03_0217 : Poly :=
[
  term ((215268440529795673 : Rat) / 5965675645772416) [(6, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-215268440529795673 : Rat) / 11931351291544832) [(6, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-215268440529795673 : Rat) / 11931351291544832) [(7, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-215268440529795673 : Rat) / 5965675645772416) [(8, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((215268440529795673 : Rat) / 11931351291544832) [(8, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((215268440529795673 : Rat) / 11931351291544832) [(9, 3), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 217 for generator 3. -/
theorem rs_R010_ueqv_R010NYY_partial_03_0217_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_03_0217
        rs_R010_ueqv_R010NYY_generator_03_0200_0247 =
      rs_R010_ueqv_R010NYY_partial_03_0217 := by
  native_decide

/-- Coefficient term 218 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010NYY_coefficient_03_0218 : Poly :=
[
  term ((311243831608273 : Rat) / 5113436267804928) [(9, 1), (13, 1), (16, 1)]
]

/-- Partial product 218 for generator 3. -/
def rs_R010_ueqv_R010NYY_partial_03_0218 : Poly :=
[
  term ((-311243831608273 : Rat) / 2556718133902464) [(6, 1), (9, 1), (13, 1), (16, 1)],
  term ((311243831608273 : Rat) / 5113436267804928) [(6, 2), (9, 1), (13, 1), (16, 1)],
  term ((311243831608273 : Rat) / 5113436267804928) [(7, 2), (9, 1), (13, 1), (16, 1)],
  term ((311243831608273 : Rat) / 2556718133902464) [(8, 1), (9, 1), (13, 1), (16, 1)],
  term ((-311243831608273 : Rat) / 5113436267804928) [(8, 2), (9, 1), (13, 1), (16, 1)],
  term ((-311243831608273 : Rat) / 5113436267804928) [(9, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 218 for generator 3. -/
theorem rs_R010_ueqv_R010NYY_partial_03_0218_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_03_0218
        rs_R010_ueqv_R010NYY_generator_03_0200_0247 =
      rs_R010_ueqv_R010NYY_partial_03_0218 := by
  native_decide

/-- Coefficient term 219 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010NYY_coefficient_03_0219 : Poly :=
[
  term ((70302592550481639 : Rat) / 5965675645772416) [(9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 219 for generator 3. -/
def rs_R010_ueqv_R010NYY_partial_03_0219 : Poly :=
[
  term ((-70302592550481639 : Rat) / 2982837822886208) [(6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((70302592550481639 : Rat) / 5965675645772416) [(6, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((70302592550481639 : Rat) / 5965675645772416) [(7, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((70302592550481639 : Rat) / 2982837822886208) [(8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-70302592550481639 : Rat) / 5965675645772416) [(8, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-70302592550481639 : Rat) / 5965675645772416) [(9, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 219 for generator 3. -/
theorem rs_R010_ueqv_R010NYY_partial_03_0219_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_03_0219
        rs_R010_ueqv_R010NYY_generator_03_0200_0247 =
      rs_R010_ueqv_R010NYY_partial_03_0219 := by
  native_decide

/-- Coefficient term 220 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010NYY_coefficient_03_0220 : Poly :=
[
  term ((4838514588303441949 : Rat) / 572704861994151936) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 220 for generator 3. -/
def rs_R010_ueqv_R010NYY_partial_03_0220 : Poly :=
[
  term ((-4838514588303441949 : Rat) / 286352430997075968) [(6, 1), (9, 1), (15, 1), (16, 1)],
  term ((4838514588303441949 : Rat) / 572704861994151936) [(6, 2), (9, 1), (15, 1), (16, 1)],
  term ((4838514588303441949 : Rat) / 572704861994151936) [(7, 2), (9, 1), (15, 1), (16, 1)],
  term ((4838514588303441949 : Rat) / 286352430997075968) [(8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-4838514588303441949 : Rat) / 572704861994151936) [(8, 2), (9, 1), (15, 1), (16, 1)],
  term ((-4838514588303441949 : Rat) / 572704861994151936) [(9, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 220 for generator 3. -/
theorem rs_R010_ueqv_R010NYY_partial_03_0220_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_03_0220
        rs_R010_ueqv_R010NYY_generator_03_0200_0247 =
      rs_R010_ueqv_R010NYY_partial_03_0220 := by
  native_decide

/-- Coefficient term 221 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010NYY_coefficient_03_0221 : Poly :=
[
  term ((786824010349137281 : Rat) / 47725405166179328) [(9, 1), (15, 3), (16, 1)]
]

/-- Partial product 221 for generator 3. -/
def rs_R010_ueqv_R010NYY_partial_03_0221 : Poly :=
[
  term ((-786824010349137281 : Rat) / 23862702583089664) [(6, 1), (9, 1), (15, 3), (16, 1)],
  term ((786824010349137281 : Rat) / 47725405166179328) [(6, 2), (9, 1), (15, 3), (16, 1)],
  term ((786824010349137281 : Rat) / 47725405166179328) [(7, 2), (9, 1), (15, 3), (16, 1)],
  term ((786824010349137281 : Rat) / 23862702583089664) [(8, 1), (9, 1), (15, 3), (16, 1)],
  term ((-786824010349137281 : Rat) / 47725405166179328) [(8, 2), (9, 1), (15, 3), (16, 1)],
  term ((-786824010349137281 : Rat) / 47725405166179328) [(9, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 221 for generator 3. -/
theorem rs_R010_ueqv_R010NYY_partial_03_0221_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_03_0221
        rs_R010_ueqv_R010NYY_generator_03_0200_0247 =
      rs_R010_ueqv_R010NYY_partial_03_0221 := by
  native_decide

/-- Coefficient term 222 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010NYY_coefficient_03_0222 : Poly :=
[
  term ((41469041122357166957 : Rat) / 1052941751478831424) [(9, 2), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 222 for generator 3. -/
def rs_R010_ueqv_R010NYY_partial_03_0222 : Poly :=
[
  term ((-41469041122357166957 : Rat) / 526470875739415712) [(6, 1), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((41469041122357166957 : Rat) / 1052941751478831424) [(6, 2), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((41469041122357166957 : Rat) / 1052941751478831424) [(7, 2), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((41469041122357166957 : Rat) / 526470875739415712) [(8, 1), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((-41469041122357166957 : Rat) / 1052941751478831424) [(8, 2), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((-41469041122357166957 : Rat) / 1052941751478831424) [(9, 4), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 222 for generator 3. -/
theorem rs_R010_ueqv_R010NYY_partial_03_0222_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_03_0222
        rs_R010_ueqv_R010NYY_generator_03_0200_0247 =
      rs_R010_ueqv_R010NYY_partial_03_0222 := by
  native_decide

/-- Coefficient term 223 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010NYY_coefficient_03_0223 : Poly :=
[
  term ((-41469041122357166957 : Rat) / 526470875739415712) [(9, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 223 for generator 3. -/
def rs_R010_ueqv_R010NYY_partial_03_0223 : Poly :=
[
  term ((41469041122357166957 : Rat) / 263235437869707856) [(6, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-41469041122357166957 : Rat) / 526470875739415712) [(6, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-41469041122357166957 : Rat) / 526470875739415712) [(7, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-41469041122357166957 : Rat) / 263235437869707856) [(8, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((41469041122357166957 : Rat) / 526470875739415712) [(8, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((41469041122357166957 : Rat) / 526470875739415712) [(9, 4), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 223 for generator 3. -/
theorem rs_R010_ueqv_R010NYY_partial_03_0223_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_03_0223
        rs_R010_ueqv_R010NYY_generator_03_0200_0247 =
      rs_R010_ueqv_R010NYY_partial_03_0223 := by
  native_decide

/-- Coefficient term 224 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010NYY_coefficient_03_0224 : Poly :=
[
  term ((23088038262747441 : Rat) / 1491418911443104) [(9, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 224 for generator 3. -/
def rs_R010_ueqv_R010NYY_partial_03_0224 : Poly :=
[
  term ((-23088038262747441 : Rat) / 745709455721552) [(6, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((23088038262747441 : Rat) / 1491418911443104) [(6, 2), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((23088038262747441 : Rat) / 1491418911443104) [(7, 2), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((23088038262747441 : Rat) / 745709455721552) [(8, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-23088038262747441 : Rat) / 1491418911443104) [(8, 2), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-23088038262747441 : Rat) / 1491418911443104) [(9, 4), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 224 for generator 3. -/
theorem rs_R010_ueqv_R010NYY_partial_03_0224_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_03_0224
        rs_R010_ueqv_R010NYY_generator_03_0200_0247 =
      rs_R010_ueqv_R010NYY_partial_03_0224 := by
  native_decide

/-- Coefficient term 225 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010NYY_coefficient_03_0225 : Poly :=
[
  term ((-23088038262747441 : Rat) / 745709455721552) [(9, 2), (15, 2), (16, 1)]
]

/-- Partial product 225 for generator 3. -/
def rs_R010_ueqv_R010NYY_partial_03_0225 : Poly :=
[
  term ((23088038262747441 : Rat) / 372854727860776) [(6, 1), (9, 2), (15, 2), (16, 1)],
  term ((-23088038262747441 : Rat) / 745709455721552) [(6, 2), (9, 2), (15, 2), (16, 1)],
  term ((-23088038262747441 : Rat) / 745709455721552) [(7, 2), (9, 2), (15, 2), (16, 1)],
  term ((-23088038262747441 : Rat) / 372854727860776) [(8, 1), (9, 2), (15, 2), (16, 1)],
  term ((23088038262747441 : Rat) / 745709455721552) [(8, 2), (9, 2), (15, 2), (16, 1)],
  term ((23088038262747441 : Rat) / 745709455721552) [(9, 4), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 225 for generator 3. -/
theorem rs_R010_ueqv_R010NYY_partial_03_0225_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_03_0225
        rs_R010_ueqv_R010NYY_generator_03_0200_0247 =
      rs_R010_ueqv_R010NYY_partial_03_0225 := by
  native_decide

/-- Coefficient term 226 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010NYY_coefficient_03_0226 : Poly :=
[
  term ((1952880645780243182111 : Rat) / 25270602035491954176) [(10, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 226 for generator 3. -/
def rs_R010_ueqv_R010NYY_partial_03_0226 : Poly :=
[
  term ((-1952880645780243182111 : Rat) / 12635301017745977088) [(6, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((1952880645780243182111 : Rat) / 25270602035491954176) [(6, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((1952880645780243182111 : Rat) / 25270602035491954176) [(7, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((1952880645780243182111 : Rat) / 12635301017745977088) [(8, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-1952880645780243182111 : Rat) / 25270602035491954176) [(8, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-1952880645780243182111 : Rat) / 25270602035491954176) [(9, 2), (10, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 226 for generator 3. -/
theorem rs_R010_ueqv_R010NYY_partial_03_0226_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_03_0226
        rs_R010_ueqv_R010NYY_generator_03_0200_0247 =
      rs_R010_ueqv_R010NYY_partial_03_0226 := by
  native_decide

/-- Coefficient term 227 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010NYY_coefficient_03_0227 : Poly :=
[
  term ((-1962752665438333421 : Rat) / 49356644600570223) [(10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 227 for generator 3. -/
def rs_R010_ueqv_R010NYY_partial_03_0227 : Poly :=
[
  term ((3925505330876666842 : Rat) / 49356644600570223) [(6, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1962752665438333421 : Rat) / 49356644600570223) [(6, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1962752665438333421 : Rat) / 49356644600570223) [(7, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-3925505330876666842 : Rat) / 49356644600570223) [(8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((1962752665438333421 : Rat) / 49356644600570223) [(8, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((1962752665438333421 : Rat) / 49356644600570223) [(9, 2), (10, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 227 for generator 3. -/
theorem rs_R010_ueqv_R010NYY_partial_03_0227_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_03_0227
        rs_R010_ueqv_R010NYY_generator_03_0200_0247 =
      rs_R010_ueqv_R010NYY_partial_03_0227 := by
  native_decide

/-- Coefficient term 228 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010NYY_coefficient_03_0228 : Poly :=
[
  term ((104711860146981725 : Rat) / 5965675645772416) [(10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 228 for generator 3. -/
def rs_R010_ueqv_R010NYY_partial_03_0228 : Poly :=
[
  term ((-104711860146981725 : Rat) / 2982837822886208) [(6, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((104711860146981725 : Rat) / 5965675645772416) [(6, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((104711860146981725 : Rat) / 5965675645772416) [(7, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((104711860146981725 : Rat) / 2982837822886208) [(8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-104711860146981725 : Rat) / 5965675645772416) [(8, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-104711860146981725 : Rat) / 5965675645772416) [(9, 2), (10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 228 for generator 3. -/
theorem rs_R010_ueqv_R010NYY_partial_03_0228_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_03_0228
        rs_R010_ueqv_R010NYY_generator_03_0200_0247 =
      rs_R010_ueqv_R010NYY_partial_03_0228 := by
  native_decide

/-- Coefficient term 229 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010NYY_coefficient_03_0229 : Poly :=
[
  term ((724990340615301 : Rat) / 213059844491872) [(10, 1), (14, 1), (16, 1)]
]

/-- Partial product 229 for generator 3. -/
def rs_R010_ueqv_R010NYY_partial_03_0229 : Poly :=
[
  term ((-724990340615301 : Rat) / 106529922245936) [(6, 1), (10, 1), (14, 1), (16, 1)],
  term ((724990340615301 : Rat) / 213059844491872) [(6, 2), (10, 1), (14, 1), (16, 1)],
  term ((724990340615301 : Rat) / 213059844491872) [(7, 2), (10, 1), (14, 1), (16, 1)],
  term ((724990340615301 : Rat) / 106529922245936) [(8, 1), (10, 1), (14, 1), (16, 1)],
  term ((-724990340615301 : Rat) / 213059844491872) [(8, 2), (10, 1), (14, 1), (16, 1)],
  term ((-724990340615301 : Rat) / 213059844491872) [(9, 2), (10, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 229 for generator 3. -/
theorem rs_R010_ueqv_R010NYY_partial_03_0229_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_03_0229
        rs_R010_ueqv_R010NYY_generator_03_0200_0247 =
      rs_R010_ueqv_R010NYY_partial_03_0229 := by
  native_decide

/-- Coefficient term 230 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010NYY_coefficient_03_0230 : Poly :=
[
  term ((-107518019144133387 : Rat) / 11931351291544832) [(10, 1), (15, 2), (16, 1)]
]

/-- Partial product 230 for generator 3. -/
def rs_R010_ueqv_R010NYY_partial_03_0230 : Poly :=
[
  term ((107518019144133387 : Rat) / 5965675645772416) [(6, 1), (10, 1), (15, 2), (16, 1)],
  term ((-107518019144133387 : Rat) / 11931351291544832) [(6, 2), (10, 1), (15, 2), (16, 1)],
  term ((-107518019144133387 : Rat) / 11931351291544832) [(7, 2), (10, 1), (15, 2), (16, 1)],
  term ((-107518019144133387 : Rat) / 5965675645772416) [(8, 1), (10, 1), (15, 2), (16, 1)],
  term ((107518019144133387 : Rat) / 11931351291544832) [(8, 2), (10, 1), (15, 2), (16, 1)],
  term ((107518019144133387 : Rat) / 11931351291544832) [(9, 2), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 230 for generator 3. -/
theorem rs_R010_ueqv_R010NYY_partial_03_0230_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_03_0230
        rs_R010_ueqv_R010NYY_generator_03_0200_0247 =
      rs_R010_ueqv_R010NYY_partial_03_0230 := by
  native_decide

/-- Coefficient term 231 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010NYY_coefficient_03_0231 : Poly :=
[
  term ((-13481761793411253 : Rat) / 6817915023739904) [(10, 1), (16, 1)]
]

/-- Partial product 231 for generator 3. -/
def rs_R010_ueqv_R010NYY_partial_03_0231 : Poly :=
[
  term ((13481761793411253 : Rat) / 3408957511869952) [(6, 1), (10, 1), (16, 1)],
  term ((-13481761793411253 : Rat) / 6817915023739904) [(6, 2), (10, 1), (16, 1)],
  term ((-13481761793411253 : Rat) / 6817915023739904) [(7, 2), (10, 1), (16, 1)],
  term ((-13481761793411253 : Rat) / 3408957511869952) [(8, 1), (10, 1), (16, 1)],
  term ((13481761793411253 : Rat) / 6817915023739904) [(8, 2), (10, 1), (16, 1)],
  term ((13481761793411253 : Rat) / 6817915023739904) [(9, 2), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 231 for generator 3. -/
theorem rs_R010_ueqv_R010NYY_partial_03_0231_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_03_0231
        rs_R010_ueqv_R010NYY_generator_03_0200_0247 =
      rs_R010_ueqv_R010NYY_partial_03_0231 := by
  native_decide

/-- Coefficient term 232 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010NYY_coefficient_03_0232 : Poly :=
[
  term ((-3249908850494927 : Rat) / 1704478755934976) [(10, 2), (16, 1)]
]

/-- Partial product 232 for generator 3. -/
def rs_R010_ueqv_R010NYY_partial_03_0232 : Poly :=
[
  term ((3249908850494927 : Rat) / 852239377967488) [(6, 1), (10, 2), (16, 1)],
  term ((-3249908850494927 : Rat) / 1704478755934976) [(6, 2), (10, 2), (16, 1)],
  term ((-3249908850494927 : Rat) / 1704478755934976) [(7, 2), (10, 2), (16, 1)],
  term ((-3249908850494927 : Rat) / 852239377967488) [(8, 1), (10, 2), (16, 1)],
  term ((3249908850494927 : Rat) / 1704478755934976) [(8, 2), (10, 2), (16, 1)],
  term ((3249908850494927 : Rat) / 1704478755934976) [(9, 2), (10, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 232 for generator 3. -/
theorem rs_R010_ueqv_R010NYY_partial_03_0232_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_03_0232
        rs_R010_ueqv_R010NYY_generator_03_0200_0247 =
      rs_R010_ueqv_R010NYY_partial_03_0232 := by
  native_decide

/-- Coefficient term 233 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010NYY_coefficient_03_0233 : Poly :=
[
  term ((-101644522824340659 : Rat) / 11931351291544832) [(11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 233 for generator 3. -/
def rs_R010_ueqv_R010NYY_partial_03_0233 : Poly :=
[
  term ((101644522824340659 : Rat) / 5965675645772416) [(6, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-101644522824340659 : Rat) / 11931351291544832) [(6, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-101644522824340659 : Rat) / 11931351291544832) [(7, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-101644522824340659 : Rat) / 5965675645772416) [(8, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((101644522824340659 : Rat) / 11931351291544832) [(8, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((101644522824340659 : Rat) / 11931351291544832) [(9, 2), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 233 for generator 3. -/
theorem rs_R010_ueqv_R010NYY_partial_03_0233_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_03_0233
        rs_R010_ueqv_R010NYY_generator_03_0200_0247 =
      rs_R010_ueqv_R010NYY_partial_03_0233 := by
  native_decide

/-- Coefficient term 234 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010NYY_coefficient_03_0234 : Poly :=
[
  term ((-4027869958751453258449 : Rat) / 75811806106475862528) [(11, 1), (13, 1), (16, 1)]
]

/-- Partial product 234 for generator 3. -/
def rs_R010_ueqv_R010NYY_partial_03_0234 : Poly :=
[
  term ((4027869958751453258449 : Rat) / 37905903053237931264) [(6, 1), (11, 1), (13, 1), (16, 1)],
  term ((-4027869958751453258449 : Rat) / 75811806106475862528) [(6, 2), (11, 1), (13, 1), (16, 1)],
  term ((-4027869958751453258449 : Rat) / 75811806106475862528) [(7, 2), (11, 1), (13, 1), (16, 1)],
  term ((-4027869958751453258449 : Rat) / 37905903053237931264) [(8, 1), (11, 1), (13, 1), (16, 1)],
  term ((4027869958751453258449 : Rat) / 75811806106475862528) [(8, 2), (11, 1), (13, 1), (16, 1)],
  term ((4027869958751453258449 : Rat) / 75811806106475862528) [(9, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 234 for generator 3. -/
theorem rs_R010_ueqv_R010NYY_partial_03_0234_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_03_0234
        rs_R010_ueqv_R010NYY_generator_03_0200_0247 =
      rs_R010_ueqv_R010NYY_partial_03_0234 := by
  native_decide

/-- Coefficient term 235 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010NYY_coefficient_03_0235 : Poly :=
[
  term ((-39023555492874908592505 : Rat) / 303247224425903450112) [(11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 235 for generator 3. -/
def rs_R010_ueqv_R010NYY_partial_03_0235 : Poly :=
[
  term ((39023555492874908592505 : Rat) / 151623612212951725056) [(6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-39023555492874908592505 : Rat) / 303247224425903450112) [(6, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-39023555492874908592505 : Rat) / 303247224425903450112) [(7, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-39023555492874908592505 : Rat) / 151623612212951725056) [(8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((39023555492874908592505 : Rat) / 303247224425903450112) [(8, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((39023555492874908592505 : Rat) / 303247224425903450112) [(9, 2), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 235 for generator 3. -/
theorem rs_R010_ueqv_R010NYY_partial_03_0235_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_03_0235
        rs_R010_ueqv_R010NYY_generator_03_0200_0247 =
      rs_R010_ueqv_R010NYY_partial_03_0235 := by
  native_decide

/-- Coefficient term 236 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010NYY_coefficient_03_0236 : Poly :=
[
  term ((963710658634631626205 : Rat) / 5463913953619881984) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 236 for generator 3. -/
def rs_R010_ueqv_R010NYY_partial_03_0236 : Poly :=
[
  term ((-963710658634631626205 : Rat) / 2731956976809940992) [(6, 1), (11, 1), (15, 1), (16, 1)],
  term ((963710658634631626205 : Rat) / 5463913953619881984) [(6, 2), (11, 1), (15, 1), (16, 1)],
  term ((963710658634631626205 : Rat) / 5463913953619881984) [(7, 2), (11, 1), (15, 1), (16, 1)],
  term ((963710658634631626205 : Rat) / 2731956976809940992) [(8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-963710658634631626205 : Rat) / 5463913953619881984) [(8, 2), (11, 1), (15, 1), (16, 1)],
  term ((-963710658634631626205 : Rat) / 5463913953619881984) [(9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 236 for generator 3. -/
theorem rs_R010_ueqv_R010NYY_partial_03_0236_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_03_0236
        rs_R010_ueqv_R010NYY_generator_03_0200_0247 =
      rs_R010_ueqv_R010NYY_partial_03_0236 := by
  native_decide

/-- Coefficient term 237 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010NYY_coefficient_03_0237 : Poly :=
[
  term ((68188688124198791 : Rat) / 1255931714899456) [(11, 1), (15, 3), (16, 1)]
]

/-- Partial product 237 for generator 3. -/
def rs_R010_ueqv_R010NYY_partial_03_0237 : Poly :=
[
  term ((-68188688124198791 : Rat) / 627965857449728) [(6, 1), (11, 1), (15, 3), (16, 1)],
  term ((68188688124198791 : Rat) / 1255931714899456) [(6, 2), (11, 1), (15, 3), (16, 1)],
  term ((68188688124198791 : Rat) / 1255931714899456) [(7, 2), (11, 1), (15, 3), (16, 1)],
  term ((68188688124198791 : Rat) / 627965857449728) [(8, 1), (11, 1), (15, 3), (16, 1)],
  term ((-68188688124198791 : Rat) / 1255931714899456) [(8, 2), (11, 1), (15, 3), (16, 1)],
  term ((-68188688124198791 : Rat) / 1255931714899456) [(9, 2), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 237 for generator 3. -/
theorem rs_R010_ueqv_R010NYY_partial_03_0237_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_03_0237
        rs_R010_ueqv_R010NYY_generator_03_0200_0247 =
      rs_R010_ueqv_R010NYY_partial_03_0237 := by
  native_decide

/-- Coefficient term 238 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010NYY_coefficient_03_0238 : Poly :=
[
  term ((-833860523506862349991 : Rat) / 25270602035491954176) [(11, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 238 for generator 3. -/
def rs_R010_ueqv_R010NYY_partial_03_0238 : Poly :=
[
  term ((833860523506862349991 : Rat) / 12635301017745977088) [(6, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-833860523506862349991 : Rat) / 25270602035491954176) [(6, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-833860523506862349991 : Rat) / 25270602035491954176) [(7, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-833860523506862349991 : Rat) / 12635301017745977088) [(8, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((833860523506862349991 : Rat) / 25270602035491954176) [(8, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((833860523506862349991 : Rat) / 25270602035491954176) [(9, 2), (11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 238 for generator 3. -/
theorem rs_R010_ueqv_R010NYY_partial_03_0238_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_03_0238
        rs_R010_ueqv_R010NYY_generator_03_0200_0247 =
      rs_R010_ueqv_R010NYY_partial_03_0238 := by
  native_decide

/-- Coefficient term 239 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010NYY_coefficient_03_0239 : Poly :=
[
  term ((91053481365332478871 : Rat) / 6317650508872988544) [(11, 2), (14, 1), (16, 1)]
]

/-- Partial product 239 for generator 3. -/
def rs_R010_ueqv_R010NYY_partial_03_0239 : Poly :=
[
  term ((-91053481365332478871 : Rat) / 3158825254436494272) [(6, 1), (11, 2), (14, 1), (16, 1)],
  term ((91053481365332478871 : Rat) / 6317650508872988544) [(6, 2), (11, 2), (14, 1), (16, 1)],
  term ((91053481365332478871 : Rat) / 6317650508872988544) [(7, 2), (11, 2), (14, 1), (16, 1)],
  term ((91053481365332478871 : Rat) / 3158825254436494272) [(8, 1), (11, 2), (14, 1), (16, 1)],
  term ((-91053481365332478871 : Rat) / 6317650508872988544) [(8, 2), (11, 2), (14, 1), (16, 1)],
  term ((-91053481365332478871 : Rat) / 6317650508872988544) [(9, 2), (11, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 239 for generator 3. -/
theorem rs_R010_ueqv_R010NYY_partial_03_0239_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_03_0239
        rs_R010_ueqv_R010NYY_generator_03_0200_0247 =
      rs_R010_ueqv_R010NYY_partial_03_0239 := by
  native_decide

/-- Coefficient term 240 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010NYY_coefficient_03_0240 : Poly :=
[
  term ((39443202746396945392465 : Rat) / 151623612212951725056) [(11, 2), (15, 2), (16, 1)]
]

/-- Partial product 240 for generator 3. -/
def rs_R010_ueqv_R010NYY_partial_03_0240 : Poly :=
[
  term ((-39443202746396945392465 : Rat) / 75811806106475862528) [(6, 1), (11, 2), (15, 2), (16, 1)],
  term ((39443202746396945392465 : Rat) / 151623612212951725056) [(6, 2), (11, 2), (15, 2), (16, 1)],
  term ((39443202746396945392465 : Rat) / 151623612212951725056) [(7, 2), (11, 2), (15, 2), (16, 1)],
  term ((39443202746396945392465 : Rat) / 75811806106475862528) [(8, 1), (11, 2), (15, 2), (16, 1)],
  term ((-39443202746396945392465 : Rat) / 151623612212951725056) [(8, 2), (11, 2), (15, 2), (16, 1)],
  term ((-39443202746396945392465 : Rat) / 151623612212951725056) [(9, 2), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 240 for generator 3. -/
theorem rs_R010_ueqv_R010NYY_partial_03_0240_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_03_0240
        rs_R010_ueqv_R010NYY_generator_03_0200_0247 =
      rs_R010_ueqv_R010NYY_partial_03_0240 := by
  native_decide

/-- Coefficient term 241 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010NYY_coefficient_03_0241 : Poly :=
[
  term ((-222886642319576138825 : Rat) / 4813448006760372224) [(11, 2), (16, 1)]
]

/-- Partial product 241 for generator 3. -/
def rs_R010_ueqv_R010NYY_partial_03_0241 : Poly :=
[
  term ((222886642319576138825 : Rat) / 2406724003380186112) [(6, 1), (11, 2), (16, 1)],
  term ((-222886642319576138825 : Rat) / 4813448006760372224) [(6, 2), (11, 2), (16, 1)],
  term ((-222886642319576138825 : Rat) / 4813448006760372224) [(7, 2), (11, 2), (16, 1)],
  term ((-222886642319576138825 : Rat) / 2406724003380186112) [(8, 1), (11, 2), (16, 1)],
  term ((222886642319576138825 : Rat) / 4813448006760372224) [(8, 2), (11, 2), (16, 1)],
  term ((222886642319576138825 : Rat) / 4813448006760372224) [(9, 2), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 241 for generator 3. -/
theorem rs_R010_ueqv_R010NYY_partial_03_0241_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_03_0241
        rs_R010_ueqv_R010NYY_generator_03_0200_0247 =
      rs_R010_ueqv_R010NYY_partial_03_0241 := by
  native_decide

/-- Coefficient term 242 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010NYY_coefficient_03_0242 : Poly :=
[
  term ((-69556067785407573619 : Rat) / 3158825254436494272) [(11, 3), (15, 1), (16, 1)]
]

/-- Partial product 242 for generator 3. -/
def rs_R010_ueqv_R010NYY_partial_03_0242 : Poly :=
[
  term ((69556067785407573619 : Rat) / 1579412627218247136) [(6, 1), (11, 3), (15, 1), (16, 1)],
  term ((-69556067785407573619 : Rat) / 3158825254436494272) [(6, 2), (11, 3), (15, 1), (16, 1)],
  term ((-69556067785407573619 : Rat) / 3158825254436494272) [(7, 2), (11, 3), (15, 1), (16, 1)],
  term ((-69556067785407573619 : Rat) / 1579412627218247136) [(8, 1), (11, 3), (15, 1), (16, 1)],
  term ((69556067785407573619 : Rat) / 3158825254436494272) [(8, 2), (11, 3), (15, 1), (16, 1)],
  term ((69556067785407573619 : Rat) / 3158825254436494272) [(9, 2), (11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 242 for generator 3. -/
theorem rs_R010_ueqv_R010NYY_partial_03_0242_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_03_0242
        rs_R010_ueqv_R010NYY_generator_03_0200_0247 =
      rs_R010_ueqv_R010NYY_partial_03_0242 := by
  native_decide

/-- Coefficient term 243 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010NYY_coefficient_03_0243 : Poly :=
[
  term ((-990168542659140647 : Rat) / 53691080811951744) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 243 for generator 3. -/
def rs_R010_ueqv_R010NYY_partial_03_0243 : Poly :=
[
  term ((990168542659140647 : Rat) / 26845540405975872) [(6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-990168542659140647 : Rat) / 53691080811951744) [(6, 2), (13, 1), (15, 1), (16, 1)],
  term ((-990168542659140647 : Rat) / 53691080811951744) [(7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-990168542659140647 : Rat) / 26845540405975872) [(8, 1), (13, 1), (15, 1), (16, 1)],
  term ((990168542659140647 : Rat) / 53691080811951744) [(8, 2), (13, 1), (15, 1), (16, 1)],
  term ((990168542659140647 : Rat) / 53691080811951744) [(9, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 243 for generator 3. -/
theorem rs_R010_ueqv_R010NYY_partial_03_0243_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_03_0243
        rs_R010_ueqv_R010NYY_generator_03_0200_0247 =
      rs_R010_ueqv_R010NYY_partial_03_0243 := by
  native_decide

/-- Coefficient term 244 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010NYY_coefficient_03_0244 : Poly :=
[
  term ((-1515717678024195473 : Rat) / 47725405166179328) [(14, 1), (15, 2), (16, 1)]
]

/-- Partial product 244 for generator 3. -/
def rs_R010_ueqv_R010NYY_partial_03_0244 : Poly :=
[
  term ((1515717678024195473 : Rat) / 23862702583089664) [(6, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1515717678024195473 : Rat) / 47725405166179328) [(6, 2), (14, 1), (15, 2), (16, 1)],
  term ((-1515717678024195473 : Rat) / 47725405166179328) [(7, 2), (14, 1), (15, 2), (16, 1)],
  term ((-1515717678024195473 : Rat) / 23862702583089664) [(8, 1), (14, 1), (15, 2), (16, 1)],
  term ((1515717678024195473 : Rat) / 47725405166179328) [(8, 2), (14, 1), (15, 2), (16, 1)],
  term ((1515717678024195473 : Rat) / 47725405166179328) [(9, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 244 for generator 3. -/
theorem rs_R010_ueqv_R010NYY_partial_03_0244_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_03_0244
        rs_R010_ueqv_R010NYY_generator_03_0200_0247 =
      rs_R010_ueqv_R010NYY_partial_03_0244 := by
  native_decide

/-- Coefficient term 245 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010NYY_coefficient_03_0245 : Poly :=
[
  term ((1619091078462659 : Rat) / 1278359066951232) [(14, 1), (16, 1)]
]

/-- Partial product 245 for generator 3. -/
def rs_R010_ueqv_R010NYY_partial_03_0245 : Poly :=
[
  term ((-1619091078462659 : Rat) / 639179533475616) [(6, 1), (14, 1), (16, 1)],
  term ((1619091078462659 : Rat) / 1278359066951232) [(6, 2), (14, 1), (16, 1)],
  term ((1619091078462659 : Rat) / 1278359066951232) [(7, 2), (14, 1), (16, 1)],
  term ((1619091078462659 : Rat) / 639179533475616) [(8, 1), (14, 1), (16, 1)],
  term ((-1619091078462659 : Rat) / 1278359066951232) [(8, 2), (14, 1), (16, 1)],
  term ((-1619091078462659 : Rat) / 1278359066951232) [(9, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 245 for generator 3. -/
theorem rs_R010_ueqv_R010NYY_partial_03_0245_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_03_0245
        rs_R010_ueqv_R010NYY_generator_03_0200_0247 =
      rs_R010_ueqv_R010NYY_partial_03_0245 := by
  native_decide

/-- Coefficient term 246 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010NYY_coefficient_03_0246 : Poly :=
[
  term ((43894136505668560243 : Rat) / 859057292991227904) [(15, 2), (16, 1)]
]

/-- Partial product 246 for generator 3. -/
def rs_R010_ueqv_R010NYY_partial_03_0246 : Poly :=
[
  term ((-43894136505668560243 : Rat) / 429528646495613952) [(6, 1), (15, 2), (16, 1)],
  term ((43894136505668560243 : Rat) / 859057292991227904) [(6, 2), (15, 2), (16, 1)],
  term ((43894136505668560243 : Rat) / 859057292991227904) [(7, 2), (15, 2), (16, 1)],
  term ((43894136505668560243 : Rat) / 429528646495613952) [(8, 1), (15, 2), (16, 1)],
  term ((-43894136505668560243 : Rat) / 859057292991227904) [(8, 2), (15, 2), (16, 1)],
  term ((-43894136505668560243 : Rat) / 859057292991227904) [(9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 246 for generator 3. -/
theorem rs_R010_ueqv_R010NYY_partial_03_0246_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_03_0246
        rs_R010_ueqv_R010NYY_generator_03_0200_0247 =
      rs_R010_ueqv_R010NYY_partial_03_0246 := by
  native_decide

/-- Coefficient term 247 from coefficient polynomial 3. -/
def rs_R010_ueqv_R010NYY_coefficient_03_0247 : Poly :=
[
  term ((102463187762386163 : Rat) / 122722470427318272) [(16, 1)]
]

/-- Partial product 247 for generator 3. -/
def rs_R010_ueqv_R010NYY_partial_03_0247 : Poly :=
[
  term ((-102463187762386163 : Rat) / 61361235213659136) [(6, 1), (16, 1)],
  term ((102463187762386163 : Rat) / 122722470427318272) [(6, 2), (16, 1)],
  term ((102463187762386163 : Rat) / 122722470427318272) [(7, 2), (16, 1)],
  term ((102463187762386163 : Rat) / 61361235213659136) [(8, 1), (16, 1)],
  term ((-102463187762386163 : Rat) / 122722470427318272) [(8, 2), (16, 1)],
  term ((-102463187762386163 : Rat) / 122722470427318272) [(9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 247 for generator 3. -/
theorem rs_R010_ueqv_R010NYY_partial_03_0247_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_03_0247
        rs_R010_ueqv_R010NYY_generator_03_0200_0247 =
      rs_R010_ueqv_R010NYY_partial_03_0247 := by
  native_decide

/-- Partial products in this block. -/
def rs_R010_ueqv_R010NYY_partials_03_0200_0247 : List Poly :=
[
  rs_R010_ueqv_R010NYY_partial_03_0200,
  rs_R010_ueqv_R010NYY_partial_03_0201,
  rs_R010_ueqv_R010NYY_partial_03_0202,
  rs_R010_ueqv_R010NYY_partial_03_0203,
  rs_R010_ueqv_R010NYY_partial_03_0204,
  rs_R010_ueqv_R010NYY_partial_03_0205,
  rs_R010_ueqv_R010NYY_partial_03_0206,
  rs_R010_ueqv_R010NYY_partial_03_0207,
  rs_R010_ueqv_R010NYY_partial_03_0208,
  rs_R010_ueqv_R010NYY_partial_03_0209,
  rs_R010_ueqv_R010NYY_partial_03_0210,
  rs_R010_ueqv_R010NYY_partial_03_0211,
  rs_R010_ueqv_R010NYY_partial_03_0212,
  rs_R010_ueqv_R010NYY_partial_03_0213,
  rs_R010_ueqv_R010NYY_partial_03_0214,
  rs_R010_ueqv_R010NYY_partial_03_0215,
  rs_R010_ueqv_R010NYY_partial_03_0216,
  rs_R010_ueqv_R010NYY_partial_03_0217,
  rs_R010_ueqv_R010NYY_partial_03_0218,
  rs_R010_ueqv_R010NYY_partial_03_0219,
  rs_R010_ueqv_R010NYY_partial_03_0220,
  rs_R010_ueqv_R010NYY_partial_03_0221,
  rs_R010_ueqv_R010NYY_partial_03_0222,
  rs_R010_ueqv_R010NYY_partial_03_0223,
  rs_R010_ueqv_R010NYY_partial_03_0224,
  rs_R010_ueqv_R010NYY_partial_03_0225,
  rs_R010_ueqv_R010NYY_partial_03_0226,
  rs_R010_ueqv_R010NYY_partial_03_0227,
  rs_R010_ueqv_R010NYY_partial_03_0228,
  rs_R010_ueqv_R010NYY_partial_03_0229,
  rs_R010_ueqv_R010NYY_partial_03_0230,
  rs_R010_ueqv_R010NYY_partial_03_0231,
  rs_R010_ueqv_R010NYY_partial_03_0232,
  rs_R010_ueqv_R010NYY_partial_03_0233,
  rs_R010_ueqv_R010NYY_partial_03_0234,
  rs_R010_ueqv_R010NYY_partial_03_0235,
  rs_R010_ueqv_R010NYY_partial_03_0236,
  rs_R010_ueqv_R010NYY_partial_03_0237,
  rs_R010_ueqv_R010NYY_partial_03_0238,
  rs_R010_ueqv_R010NYY_partial_03_0239,
  rs_R010_ueqv_R010NYY_partial_03_0240,
  rs_R010_ueqv_R010NYY_partial_03_0241,
  rs_R010_ueqv_R010NYY_partial_03_0242,
  rs_R010_ueqv_R010NYY_partial_03_0243,
  rs_R010_ueqv_R010NYY_partial_03_0244,
  rs_R010_ueqv_R010NYY_partial_03_0245,
  rs_R010_ueqv_R010NYY_partial_03_0246,
  rs_R010_ueqv_R010NYY_partial_03_0247
]

/-- Sum of partial products in this block. -/
def rs_R010_ueqv_R010NYY_block_03_0200_0247 : Poly :=
[
  term ((23088038262747441 : Rat) / 1491418911443104) [(6, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-349947488033723 : Rat) / 426119688983744) [(6, 1), (8, 1), (10, 1), (16, 1)],
  term ((-2501989506380616351889 : Rat) / 37905903053237931264) [(6, 1), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((70504275386458221868411 : Rat) / 151623612212951725056) [(6, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((562943367046585856495 : Rat) / 25270602035491954176) [(6, 1), (8, 1), (11, 2), (16, 1)],
  term ((-54259707074511783 : Rat) / 11931351291544832) [(6, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((1894914691676530775 : Rat) / 23862702583089664) [(6, 1), (8, 1), (15, 2), (16, 1)],
  term ((-301259657481529 : Rat) / 639179533475616) [(6, 1), (8, 1), (16, 1)],
  term ((-18658404945247128977 : Rat) / 902521501267569792) [(6, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((349947488033723 : Rat) / 213059844491872) [(6, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-349947488033723 : Rat) / 106529922245936) [(6, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((40649921941699401545 : Rat) / 4211767005915325696) [(6, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-240937308571641895789 : Rat) / 3158825254436494272) [(6, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((3952067641481023102391 : Rat) / 50541204070983908352) [(6, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-27305026381874146883191 : Rat) / 202164816283935633408) [(6, 1), (9, 1), (11, 1), (16, 1)],
  term ((7229145932057854327 : Rat) / 113831540700414208) [(6, 1), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((582785649347189790577 : Rat) / 6317650508872988544) [(6, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((215268440529795673 : Rat) / 5965675645772416) [(6, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-311243831608273 : Rat) / 2556718133902464) [(6, 1), (9, 1), (13, 1), (16, 1)],
  term ((-70302592550481639 : Rat) / 2982837822886208) [(6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4838514588303441949 : Rat) / 286352430997075968) [(6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-786824010349137281 : Rat) / 23862702583089664) [(6, 1), (9, 1), (15, 3), (16, 1)],
  term ((-41469041122357166957 : Rat) / 526470875739415712) [(6, 1), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((41469041122357166957 : Rat) / 263235437869707856) [(6, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-23088038262747441 : Rat) / 745709455721552) [(6, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((23088038262747441 : Rat) / 372854727860776) [(6, 1), (9, 2), (15, 2), (16, 1)],
  term ((-1952880645780243182111 : Rat) / 12635301017745977088) [(6, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((3925505330876666842 : Rat) / 49356644600570223) [(6, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-104711860146981725 : Rat) / 2982837822886208) [(6, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-724990340615301 : Rat) / 106529922245936) [(6, 1), (10, 1), (14, 1), (16, 1)],
  term ((107518019144133387 : Rat) / 5965675645772416) [(6, 1), (10, 1), (15, 2), (16, 1)],
  term ((13481761793411253 : Rat) / 3408957511869952) [(6, 1), (10, 1), (16, 1)],
  term ((3249908850494927 : Rat) / 852239377967488) [(6, 1), (10, 2), (16, 1)],
  term ((101644522824340659 : Rat) / 5965675645772416) [(6, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((4027869958751453258449 : Rat) / 37905903053237931264) [(6, 1), (11, 1), (13, 1), (16, 1)],
  term ((39023555492874908592505 : Rat) / 151623612212951725056) [(6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-963710658634631626205 : Rat) / 2731956976809940992) [(6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-68188688124198791 : Rat) / 627965857449728) [(6, 1), (11, 1), (15, 3), (16, 1)],
  term ((833860523506862349991 : Rat) / 12635301017745977088) [(6, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-91053481365332478871 : Rat) / 3158825254436494272) [(6, 1), (11, 2), (14, 1), (16, 1)],
  term ((-39443202746396945392465 : Rat) / 75811806106475862528) [(6, 1), (11, 2), (15, 2), (16, 1)],
  term ((222886642319576138825 : Rat) / 2406724003380186112) [(6, 1), (11, 2), (16, 1)],
  term ((69556067785407573619 : Rat) / 1579412627218247136) [(6, 1), (11, 3), (15, 1), (16, 1)],
  term ((990168542659140647 : Rat) / 26845540405975872) [(6, 1), (13, 1), (15, 1), (16, 1)],
  term ((1515717678024195473 : Rat) / 23862702583089664) [(6, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1619091078462659 : Rat) / 639179533475616) [(6, 1), (14, 1), (16, 1)],
  term ((-43894136505668560243 : Rat) / 429528646495613952) [(6, 1), (15, 2), (16, 1)],
  term ((-102463187762386163 : Rat) / 61361235213659136) [(6, 1), (16, 1)],
  term ((-23088038262747441 : Rat) / 2982837822886208) [(6, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((349947488033723 : Rat) / 852239377967488) [(6, 2), (8, 1), (10, 1), (16, 1)],
  term ((2501989506380616351889 : Rat) / 75811806106475862528) [(6, 2), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((-70504275386458221868411 : Rat) / 303247224425903450112) [(6, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-562943367046585856495 : Rat) / 50541204070983908352) [(6, 2), (8, 1), (11, 2), (16, 1)],
  term ((54259707074511783 : Rat) / 23862702583089664) [(6, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1894914691676530775 : Rat) / 47725405166179328) [(6, 2), (8, 1), (15, 2), (16, 1)],
  term ((301259657481529 : Rat) / 1278359066951232) [(6, 2), (8, 1), (16, 1)],
  term ((18658404945247128977 : Rat) / 1805043002535139584) [(6, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-349947488033723 : Rat) / 426119688983744) [(6, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((349947488033723 : Rat) / 213059844491872) [(6, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-40649921941699401545 : Rat) / 8423534011830651392) [(6, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((240937308571641895789 : Rat) / 6317650508872988544) [(6, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-3952067641481023102391 : Rat) / 101082408141967816704) [(6, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((27305026381874146883191 : Rat) / 404329632567871266816) [(6, 2), (9, 1), (11, 1), (16, 1)],
  term ((-7229145932057854327 : Rat) / 227663081400828416) [(6, 2), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((-582785649347189790577 : Rat) / 12635301017745977088) [(6, 2), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-215268440529795673 : Rat) / 11931351291544832) [(6, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((311243831608273 : Rat) / 5113436267804928) [(6, 2), (9, 1), (13, 1), (16, 1)],
  term ((70302592550481639 : Rat) / 5965675645772416) [(6, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((4838514588303441949 : Rat) / 572704861994151936) [(6, 2), (9, 1), (15, 1), (16, 1)],
  term ((786824010349137281 : Rat) / 47725405166179328) [(6, 2), (9, 1), (15, 3), (16, 1)],
  term ((41469041122357166957 : Rat) / 1052941751478831424) [(6, 2), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((-41469041122357166957 : Rat) / 526470875739415712) [(6, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((23088038262747441 : Rat) / 1491418911443104) [(6, 2), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-23088038262747441 : Rat) / 745709455721552) [(6, 2), (9, 2), (15, 2), (16, 1)],
  term ((1952880645780243182111 : Rat) / 25270602035491954176) [(6, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-1962752665438333421 : Rat) / 49356644600570223) [(6, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((104711860146981725 : Rat) / 5965675645772416) [(6, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((724990340615301 : Rat) / 213059844491872) [(6, 2), (10, 1), (14, 1), (16, 1)],
  term ((-107518019144133387 : Rat) / 11931351291544832) [(6, 2), (10, 1), (15, 2), (16, 1)],
  term ((-13481761793411253 : Rat) / 6817915023739904) [(6, 2), (10, 1), (16, 1)],
  term ((-3249908850494927 : Rat) / 1704478755934976) [(6, 2), (10, 2), (16, 1)],
  term ((-101644522824340659 : Rat) / 11931351291544832) [(6, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-4027869958751453258449 : Rat) / 75811806106475862528) [(6, 2), (11, 1), (13, 1), (16, 1)],
  term ((-39023555492874908592505 : Rat) / 303247224425903450112) [(6, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((963710658634631626205 : Rat) / 5463913953619881984) [(6, 2), (11, 1), (15, 1), (16, 1)],
  term ((68188688124198791 : Rat) / 1255931714899456) [(6, 2), (11, 1), (15, 3), (16, 1)],
  term ((-833860523506862349991 : Rat) / 25270602035491954176) [(6, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((91053481365332478871 : Rat) / 6317650508872988544) [(6, 2), (11, 2), (14, 1), (16, 1)],
  term ((39443202746396945392465 : Rat) / 151623612212951725056) [(6, 2), (11, 2), (15, 2), (16, 1)],
  term ((-222886642319576138825 : Rat) / 4813448006760372224) [(6, 2), (11, 2), (16, 1)],
  term ((-69556067785407573619 : Rat) / 3158825254436494272) [(6, 2), (11, 3), (15, 1), (16, 1)],
  term ((-990168542659140647 : Rat) / 53691080811951744) [(6, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1515717678024195473 : Rat) / 47725405166179328) [(6, 2), (14, 1), (15, 2), (16, 1)],
  term ((1619091078462659 : Rat) / 1278359066951232) [(6, 2), (14, 1), (16, 1)],
  term ((43894136505668560243 : Rat) / 859057292991227904) [(6, 2), (15, 2), (16, 1)],
  term ((102463187762386163 : Rat) / 122722470427318272) [(6, 2), (16, 1)],
  term ((-23088038262747441 : Rat) / 2982837822886208) [(7, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((349947488033723 : Rat) / 852239377967488) [(7, 2), (8, 1), (10, 1), (16, 1)],
  term ((2501989506380616351889 : Rat) / 75811806106475862528) [(7, 2), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((-70504275386458221868411 : Rat) / 303247224425903450112) [(7, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-562943367046585856495 : Rat) / 50541204070983908352) [(7, 2), (8, 1), (11, 2), (16, 1)],
  term ((54259707074511783 : Rat) / 23862702583089664) [(7, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1894914691676530775 : Rat) / 47725405166179328) [(7, 2), (8, 1), (15, 2), (16, 1)],
  term ((301259657481529 : Rat) / 1278359066951232) [(7, 2), (8, 1), (16, 1)],
  term ((18658404945247128977 : Rat) / 1805043002535139584) [(7, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-349947488033723 : Rat) / 426119688983744) [(7, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((349947488033723 : Rat) / 213059844491872) [(7, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-40649921941699401545 : Rat) / 8423534011830651392) [(7, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((240937308571641895789 : Rat) / 6317650508872988544) [(7, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-3952067641481023102391 : Rat) / 101082408141967816704) [(7, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((27305026381874146883191 : Rat) / 404329632567871266816) [(7, 2), (9, 1), (11, 1), (16, 1)],
  term ((-7229145932057854327 : Rat) / 227663081400828416) [(7, 2), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((-582785649347189790577 : Rat) / 12635301017745977088) [(7, 2), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-215268440529795673 : Rat) / 11931351291544832) [(7, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((311243831608273 : Rat) / 5113436267804928) [(7, 2), (9, 1), (13, 1), (16, 1)],
  term ((70302592550481639 : Rat) / 5965675645772416) [(7, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((4838514588303441949 : Rat) / 572704861994151936) [(7, 2), (9, 1), (15, 1), (16, 1)],
  term ((786824010349137281 : Rat) / 47725405166179328) [(7, 2), (9, 1), (15, 3), (16, 1)],
  term ((41469041122357166957 : Rat) / 1052941751478831424) [(7, 2), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((-41469041122357166957 : Rat) / 526470875739415712) [(7, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((23088038262747441 : Rat) / 1491418911443104) [(7, 2), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-23088038262747441 : Rat) / 745709455721552) [(7, 2), (9, 2), (15, 2), (16, 1)],
  term ((1952880645780243182111 : Rat) / 25270602035491954176) [(7, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-1962752665438333421 : Rat) / 49356644600570223) [(7, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((104711860146981725 : Rat) / 5965675645772416) [(7, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((724990340615301 : Rat) / 213059844491872) [(7, 2), (10, 1), (14, 1), (16, 1)],
  term ((-107518019144133387 : Rat) / 11931351291544832) [(7, 2), (10, 1), (15, 2), (16, 1)],
  term ((-13481761793411253 : Rat) / 6817915023739904) [(7, 2), (10, 1), (16, 1)],
  term ((-3249908850494927 : Rat) / 1704478755934976) [(7, 2), (10, 2), (16, 1)],
  term ((-101644522824340659 : Rat) / 11931351291544832) [(7, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-4027869958751453258449 : Rat) / 75811806106475862528) [(7, 2), (11, 1), (13, 1), (16, 1)],
  term ((-39023555492874908592505 : Rat) / 303247224425903450112) [(7, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((963710658634631626205 : Rat) / 5463913953619881984) [(7, 2), (11, 1), (15, 1), (16, 1)],
  term ((68188688124198791 : Rat) / 1255931714899456) [(7, 2), (11, 1), (15, 3), (16, 1)],
  term ((-833860523506862349991 : Rat) / 25270602035491954176) [(7, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((91053481365332478871 : Rat) / 6317650508872988544) [(7, 2), (11, 2), (14, 1), (16, 1)],
  term ((39443202746396945392465 : Rat) / 151623612212951725056) [(7, 2), (11, 2), (15, 2), (16, 1)],
  term ((-222886642319576138825 : Rat) / 4813448006760372224) [(7, 2), (11, 2), (16, 1)],
  term ((-69556067785407573619 : Rat) / 3158825254436494272) [(7, 2), (11, 3), (15, 1), (16, 1)],
  term ((-990168542659140647 : Rat) / 53691080811951744) [(7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1515717678024195473 : Rat) / 47725405166179328) [(7, 2), (14, 1), (15, 2), (16, 1)],
  term ((1619091078462659 : Rat) / 1278359066951232) [(7, 2), (14, 1), (16, 1)],
  term ((43894136505668560243 : Rat) / 859057292991227904) [(7, 2), (15, 2), (16, 1)],
  term ((102463187762386163 : Rat) / 122722470427318272) [(7, 2), (16, 1)],
  term ((18658404945247128977 : Rat) / 902521501267569792) [(8, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-349947488033723 : Rat) / 213059844491872) [(8, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((349947488033723 : Rat) / 106529922245936) [(8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-40649921941699401545 : Rat) / 4211767005915325696) [(8, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((240937308571641895789 : Rat) / 3158825254436494272) [(8, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-3952067641481023102391 : Rat) / 50541204070983908352) [(8, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((27305026381874146883191 : Rat) / 202164816283935633408) [(8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-7229145932057854327 : Rat) / 113831540700414208) [(8, 1), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((-582785649347189790577 : Rat) / 6317650508872988544) [(8, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-215268440529795673 : Rat) / 5965675645772416) [(8, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((311243831608273 : Rat) / 2556718133902464) [(8, 1), (9, 1), (13, 1), (16, 1)],
  term ((70302592550481639 : Rat) / 2982837822886208) [(8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((4838514588303441949 : Rat) / 286352430997075968) [(8, 1), (9, 1), (15, 1), (16, 1)],
  term ((786824010349137281 : Rat) / 23862702583089664) [(8, 1), (9, 1), (15, 3), (16, 1)],
  term ((-349947488033723 : Rat) / 852239377967488) [(8, 1), (9, 2), (10, 1), (16, 1)],
  term ((3469552415238815689919 : Rat) / 75811806106475862528) [(8, 1), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((22731940013502765533947 : Rat) / 303247224425903450112) [(8, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((562943367046585856495 : Rat) / 50541204070983908352) [(8, 1), (9, 2), (11, 2), (16, 1)],
  term ((684557517333406329 : Rat) / 23862702583089664) [(8, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1060354205955141673 : Rat) / 47725405166179328) [(8, 1), (9, 2), (15, 2), (16, 1)],
  term ((-301259657481529 : Rat) / 1278359066951232) [(8, 1), (9, 2), (16, 1)],
  term ((23088038262747441 : Rat) / 2982837822886208) [(8, 1), (9, 3), (15, 1), (16, 1)],
  term ((1952880645780243182111 : Rat) / 12635301017745977088) [(8, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-3925505330876666842 : Rat) / 49356644600570223) [(8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((104711860146981725 : Rat) / 2982837822886208) [(8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((724990340615301 : Rat) / 106529922245936) [(8, 1), (10, 1), (14, 1), (16, 1)],
  term ((-107518019144133387 : Rat) / 5965675645772416) [(8, 1), (10, 1), (15, 2), (16, 1)],
  term ((-13481761793411253 : Rat) / 3408957511869952) [(8, 1), (10, 1), (16, 1)],
  term ((-3249908850494927 : Rat) / 852239377967488) [(8, 1), (10, 2), (16, 1)],
  term ((-101644522824340659 : Rat) / 5965675645772416) [(8, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-4027869958751453258449 : Rat) / 37905903053237931264) [(8, 1), (11, 1), (13, 1), (16, 1)],
  term ((-39023555492874908592505 : Rat) / 151623612212951725056) [(8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((963710658634631626205 : Rat) / 2731956976809940992) [(8, 1), (11, 1), (15, 1), (16, 1)],
  term ((68188688124198791 : Rat) / 627965857449728) [(8, 1), (11, 1), (15, 3), (16, 1)],
  term ((-833860523506862349991 : Rat) / 12635301017745977088) [(8, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((91053481365332478871 : Rat) / 3158825254436494272) [(8, 1), (11, 2), (14, 1), (16, 1)],
  term ((39443202746396945392465 : Rat) / 75811806106475862528) [(8, 1), (11, 2), (15, 2), (16, 1)],
  term ((-222886642319576138825 : Rat) / 2406724003380186112) [(8, 1), (11, 2), (16, 1)],
  term ((-69556067785407573619 : Rat) / 1579412627218247136) [(8, 1), (11, 3), (15, 1), (16, 1)],
  term ((-990168542659140647 : Rat) / 26845540405975872) [(8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1515717678024195473 : Rat) / 23862702583089664) [(8, 1), (14, 1), (15, 2), (16, 1)],
  term ((1619091078462659 : Rat) / 639179533475616) [(8, 1), (14, 1), (16, 1)],
  term ((43894136505668560243 : Rat) / 429528646495613952) [(8, 1), (15, 2), (16, 1)],
  term ((102463187762386163 : Rat) / 61361235213659136) [(8, 1), (16, 1)],
  term ((-18658404945247128977 : Rat) / 1805043002535139584) [(8, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((349947488033723 : Rat) / 426119688983744) [(8, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-349947488033723 : Rat) / 213059844491872) [(8, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((40649921941699401545 : Rat) / 8423534011830651392) [(8, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-240937308571641895789 : Rat) / 6317650508872988544) [(8, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((3952067641481023102391 : Rat) / 101082408141967816704) [(8, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-27305026381874146883191 : Rat) / 404329632567871266816) [(8, 2), (9, 1), (11, 1), (16, 1)],
  term ((7229145932057854327 : Rat) / 227663081400828416) [(8, 2), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((582785649347189790577 : Rat) / 12635301017745977088) [(8, 2), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((215268440529795673 : Rat) / 11931351291544832) [(8, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-311243831608273 : Rat) / 5113436267804928) [(8, 2), (9, 1), (13, 1), (16, 1)],
  term ((-70302592550481639 : Rat) / 5965675645772416) [(8, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-13704321281198459293 : Rat) / 572704861994151936) [(8, 2), (9, 1), (15, 1), (16, 1)],
  term ((-786824010349137281 : Rat) / 47725405166179328) [(8, 2), (9, 1), (15, 3), (16, 1)],
  term ((-41469041122357166957 : Rat) / 1052941751478831424) [(8, 2), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((41469041122357166957 : Rat) / 526470875739415712) [(8, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-23088038262747441 : Rat) / 1491418911443104) [(8, 2), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((23088038262747441 : Rat) / 745709455721552) [(8, 2), (9, 2), (15, 2), (16, 1)],
  term ((-1952880645780243182111 : Rat) / 25270602035491954176) [(8, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((1962752665438333421 : Rat) / 49356644600570223) [(8, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-104711860146981725 : Rat) / 5965675645772416) [(8, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-724990340615301 : Rat) / 213059844491872) [(8, 2), (10, 1), (14, 1), (16, 1)],
  term ((107518019144133387 : Rat) / 11931351291544832) [(8, 2), (10, 1), (15, 2), (16, 1)],
  term ((19080921601950821 : Rat) / 6817915023739904) [(8, 2), (10, 1), (16, 1)],
  term ((3249908850494927 : Rat) / 1704478755934976) [(8, 2), (10, 2), (16, 1)],
  term ((101644522824340659 : Rat) / 11931351291544832) [(8, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((3010616323837561987409 : Rat) / 25270602035491954176) [(8, 2), (11, 1), (13, 1), (16, 1)],
  term ((39023555492874908592505 : Rat) / 303247224425903450112) [(8, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-388988984654276997982399 : Rat) / 606494448851806900224) [(8, 2), (11, 1), (15, 1), (16, 1)],
  term ((-68188688124198791 : Rat) / 1255931714899456) [(8, 2), (11, 1), (15, 3), (16, 1)],
  term ((833860523506862349991 : Rat) / 25270602035491954176) [(8, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-91053481365332478871 : Rat) / 6317650508872988544) [(8, 2), (11, 2), (14, 1), (16, 1)],
  term ((-39443202746396945392465 : Rat) / 151623612212951725056) [(8, 2), (11, 2), (15, 2), (16, 1)],
  term ((2428846020524755489345 : Rat) / 101082408141967816704) [(8, 2), (11, 2), (16, 1)],
  term ((69556067785407573619 : Rat) / 3158825254436494272) [(8, 2), (11, 3), (15, 1), (16, 1)],
  term ((2468674448988887341 : Rat) / 107382161623903488) [(8, 2), (13, 1), (15, 1), (16, 1)],
  term ((1515717678024195473 : Rat) / 47725405166179328) [(8, 2), (14, 1), (15, 2), (16, 1)],
  term ((-1619091078462659 : Rat) / 1278359066951232) [(8, 2), (14, 1), (16, 1)],
  term ((-112111065406023668143 : Rat) / 859057292991227904) [(8, 2), (15, 2), (16, 1)],
  term ((-44621333525932595 : Rat) / 122722470427318272) [(8, 2), (16, 1)],
  term ((23088038262747441 : Rat) / 2982837822886208) [(8, 3), (9, 1), (15, 1), (16, 1)],
  term ((-349947488033723 : Rat) / 852239377967488) [(8, 3), (10, 1), (16, 1)],
  term ((-2501989506380616351889 : Rat) / 75811806106475862528) [(8, 3), (11, 1), (13, 1), (16, 1)],
  term ((70504275386458221868411 : Rat) / 303247224425903450112) [(8, 3), (11, 1), (15, 1), (16, 1)],
  term ((562943367046585856495 : Rat) / 50541204070983908352) [(8, 3), (11, 2), (16, 1)],
  term ((-54259707074511783 : Rat) / 23862702583089664) [(8, 3), (13, 1), (15, 1), (16, 1)],
  term ((1894914691676530775 : Rat) / 47725405166179328) [(8, 3), (15, 2), (16, 1)],
  term ((-301259657481529 : Rat) / 1278359066951232) [(8, 3), (16, 1)],
  term ((-1952880645780243182111 : Rat) / 25270602035491954176) [(9, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((1962752665438333421 : Rat) / 49356644600570223) [(9, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-104711860146981725 : Rat) / 5965675645772416) [(9, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-724990340615301 : Rat) / 213059844491872) [(9, 2), (10, 1), (14, 1), (16, 1)],
  term ((107518019144133387 : Rat) / 11931351291544832) [(9, 2), (10, 1), (15, 2), (16, 1)],
  term ((13481761793411253 : Rat) / 6817915023739904) [(9, 2), (10, 1), (16, 1)],
  term ((3249908850494927 : Rat) / 1704478755934976) [(9, 2), (10, 2), (16, 1)],
  term ((101644522824340659 : Rat) / 11931351291544832) [(9, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((4027869958751453258449 : Rat) / 75811806106475862528) [(9, 2), (11, 1), (13, 1), (16, 1)],
  term ((39023555492874908592505 : Rat) / 303247224425903450112) [(9, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-963710658634631626205 : Rat) / 5463913953619881984) [(9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-68188688124198791 : Rat) / 1255931714899456) [(9, 2), (11, 1), (15, 3), (16, 1)],
  term ((833860523506862349991 : Rat) / 25270602035491954176) [(9, 2), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-91053481365332478871 : Rat) / 6317650508872988544) [(9, 2), (11, 2), (14, 1), (16, 1)],
  term ((-39443202746396945392465 : Rat) / 151623612212951725056) [(9, 2), (11, 2), (15, 2), (16, 1)],
  term ((222886642319576138825 : Rat) / 4813448006760372224) [(9, 2), (11, 2), (16, 1)],
  term ((69556067785407573619 : Rat) / 3158825254436494272) [(9, 2), (11, 3), (15, 1), (16, 1)],
  term ((990168542659140647 : Rat) / 53691080811951744) [(9, 2), (13, 1), (15, 1), (16, 1)],
  term ((1515717678024195473 : Rat) / 47725405166179328) [(9, 2), (14, 1), (15, 2), (16, 1)],
  term ((-1619091078462659 : Rat) / 1278359066951232) [(9, 2), (14, 1), (16, 1)],
  term ((-43894136505668560243 : Rat) / 859057292991227904) [(9, 2), (15, 2), (16, 1)],
  term ((-102463187762386163 : Rat) / 122722470427318272) [(9, 2), (16, 1)],
  term ((-18658404945247128977 : Rat) / 1805043002535139584) [(9, 3), (10, 1), (11, 1), (16, 1)],
  term ((349947488033723 : Rat) / 426119688983744) [(9, 3), (10, 1), (13, 1), (16, 1)],
  term ((-349947488033723 : Rat) / 213059844491872) [(9, 3), (10, 1), (15, 1), (16, 1)],
  term ((40649921941699401545 : Rat) / 8423534011830651392) [(9, 3), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-240937308571641895789 : Rat) / 6317650508872988544) [(9, 3), (11, 1), (14, 1), (16, 1)],
  term ((3952067641481023102391 : Rat) / 101082408141967816704) [(9, 3), (11, 1), (15, 2), (16, 1)],
  term ((-27305026381874146883191 : Rat) / 404329632567871266816) [(9, 3), (11, 1), (16, 1)],
  term ((7229145932057854327 : Rat) / 227663081400828416) [(9, 3), (11, 2), (13, 1), (16, 1)],
  term ((582785649347189790577 : Rat) / 12635301017745977088) [(9, 3), (11, 2), (15, 1), (16, 1)],
  term ((215268440529795673 : Rat) / 11931351291544832) [(9, 3), (13, 1), (15, 2), (16, 1)],
  term ((-311243831608273 : Rat) / 5113436267804928) [(9, 3), (13, 1), (16, 1)],
  term ((-70302592550481639 : Rat) / 5965675645772416) [(9, 3), (14, 1), (15, 1), (16, 1)],
  term ((-4838514588303441949 : Rat) / 572704861994151936) [(9, 3), (15, 1), (16, 1)],
  term ((-786824010349137281 : Rat) / 47725405166179328) [(9, 3), (15, 3), (16, 1)],
  term ((-41469041122357166957 : Rat) / 1052941751478831424) [(9, 4), (11, 1), (13, 1), (16, 1)],
  term ((41469041122357166957 : Rat) / 526470875739415712) [(9, 4), (11, 1), (15, 1), (16, 1)],
  term ((-23088038262747441 : Rat) / 1491418911443104) [(9, 4), (13, 1), (15, 1), (16, 1)],
  term ((23088038262747441 : Rat) / 745709455721552) [(9, 4), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 3, terms 200 through 247. -/
theorem rs_R010_ueqv_R010NYY_block_03_0200_0247_valid :
    checkProductSumEq rs_R010_ueqv_R010NYY_partials_03_0200_0247
      rs_R010_ueqv_R010NYY_block_03_0200_0247 = true := by
  native_decide

end R010UeqvR010NYYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
