/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NYNYN, term block 14:200-299

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NYNYNTermShards

/-- Generator polynomial 14 for relaxed split surplus certificate `R009:u=v:R009NYNYN`. -/
def rs_R009_ueqv_R009NYNYN_generator_14_0200_0299 : Poly :=
[
  term (2 : Rat) [(4, 1), (6, 1)],
  term (2 : Rat) [(5, 1), (7, 1)],
  term (-1 : Rat) [(6, 2)],
  term (-1 : Rat) [(7, 2)]
]

/-- Coefficient term 200 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0200 : Poly :=
[
  term ((-3149149553489948 : Rat) / 3146696864482101) [(7, 1), (8, 1), (15, 1)]
]

/-- Partial product 200 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0200 : Poly :=
[
  term ((-6298299106979896 : Rat) / 3146696864482101) [(4, 1), (6, 1), (7, 1), (8, 1), (15, 1)],
  term ((-6298299106979896 : Rat) / 3146696864482101) [(5, 1), (7, 2), (8, 1), (15, 1)],
  term ((3149149553489948 : Rat) / 3146696864482101) [(6, 2), (7, 1), (8, 1), (15, 1)],
  term ((3149149553489948 : Rat) / 3146696864482101) [(7, 3), (8, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 200 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0200_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0200
        rs_R009_ueqv_R009NYNYN_generator_14_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_14_0200 := by
  native_decide

/-- Coefficient term 201 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0201 : Poly :=
[
  term ((-12596598213959792 : Rat) / 3146696864482101) [(7, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 201 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0201 : Poly :=
[
  term ((-25193196427919584 : Rat) / 3146696864482101) [(4, 1), (6, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-25193196427919584 : Rat) / 3146696864482101) [(5, 1), (7, 2), (8, 1), (15, 1), (16, 1)],
  term ((12596598213959792 : Rat) / 3146696864482101) [(6, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((12596598213959792 : Rat) / 3146696864482101) [(7, 3), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 201 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0201_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0201
        rs_R009_ueqv_R009NYNYN_generator_14_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_14_0201 := by
  native_decide

/-- Coefficient term 202 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0202 : Poly :=
[
  term ((6298299106979896 : Rat) / 3146696864482101) [(7, 1), (8, 2), (15, 1), (16, 1)]
]

/-- Partial product 202 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0202 : Poly :=
[
  term ((12596598213959792 : Rat) / 3146696864482101) [(4, 1), (6, 1), (7, 1), (8, 2), (15, 1), (16, 1)],
  term ((12596598213959792 : Rat) / 3146696864482101) [(5, 1), (7, 2), (8, 2), (15, 1), (16, 1)],
  term ((-6298299106979896 : Rat) / 3146696864482101) [(6, 2), (7, 1), (8, 2), (15, 1), (16, 1)],
  term ((-6298299106979896 : Rat) / 3146696864482101) [(7, 3), (8, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 202 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0202_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0202
        rs_R009_ueqv_R009NYNYN_generator_14_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_14_0202 := by
  native_decide

/-- Coefficient term 203 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0203 : Poly :=
[
  term ((3149149553489948 : Rat) / 1048898954827367) [(7, 1), (9, 1)]
]

/-- Partial product 203 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0203 : Poly :=
[
  term ((6298299106979896 : Rat) / 1048898954827367) [(4, 1), (6, 1), (7, 1), (9, 1)],
  term ((6298299106979896 : Rat) / 1048898954827367) [(5, 1), (7, 2), (9, 1)],
  term ((-3149149553489948 : Rat) / 1048898954827367) [(6, 2), (7, 1), (9, 1)],
  term ((-3149149553489948 : Rat) / 1048898954827367) [(7, 3), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 203 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0203_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0203
        rs_R009_ueqv_R009NYNYN_generator_14_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_14_0203 := by
  native_decide

/-- Coefficient term 204 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0204 : Poly :=
[
  term ((-6298299106979896 : Rat) / 3146696864482101) [(7, 1), (15, 1)]
]

/-- Partial product 204 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0204 : Poly :=
[
  term ((-12596598213959792 : Rat) / 3146696864482101) [(4, 1), (6, 1), (7, 1), (15, 1)],
  term ((-12596598213959792 : Rat) / 3146696864482101) [(5, 1), (7, 2), (15, 1)],
  term ((6298299106979896 : Rat) / 3146696864482101) [(6, 2), (7, 1), (15, 1)],
  term ((6298299106979896 : Rat) / 3146696864482101) [(7, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 204 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0204_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0204
        rs_R009_ueqv_R009NYNYN_generator_14_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_14_0204 := by
  native_decide

/-- Coefficient term 205 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0205 : Poly :=
[
  term ((25569837390091601182999339401177806029551201919155052135341825386339222462070049 : Rat) / 16322999980665035247665467556467790932934207290180248180600555511945282752000) [(7, 2)]
]

/-- Partial product 205 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0205 : Poly :=
[
  term ((25569837390091601182999339401177806029551201919155052135341825386339222462070049 : Rat) / 8161499990332517623832733778233895466467103645090124090300277755972641376000) [(4, 1), (6, 1), (7, 2)],
  term ((25569837390091601182999339401177806029551201919155052135341825386339222462070049 : Rat) / 8161499990332517623832733778233895466467103645090124090300277755972641376000) [(5, 1), (7, 3)],
  term ((-25569837390091601182999339401177806029551201919155052135341825386339222462070049 : Rat) / 16322999980665035247665467556467790932934207290180248180600555511945282752000) [(6, 2), (7, 2)],
  term ((-25569837390091601182999339401177806029551201919155052135341825386339222462070049 : Rat) / 16322999980665035247665467556467790932934207290180248180600555511945282752000) [(7, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 205 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0205_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0205
        rs_R009_ueqv_R009NYNYN_generator_14_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_14_0205 := by
  native_decide

/-- Coefficient term 206 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0206 : Poly :=
[
  term ((3149149553489948 : Rat) / 1048898954827367) [(7, 2), (8, 1)]
]

/-- Partial product 206 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0206 : Poly :=
[
  term ((6298299106979896 : Rat) / 1048898954827367) [(4, 1), (6, 1), (7, 2), (8, 1)],
  term ((6298299106979896 : Rat) / 1048898954827367) [(5, 1), (7, 3), (8, 1)],
  term ((-3149149553489948 : Rat) / 1048898954827367) [(6, 2), (7, 2), (8, 1)],
  term ((-3149149553489948 : Rat) / 1048898954827367) [(7, 4), (8, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 206 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0206_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0206
        rs_R009_ueqv_R009NYNYN_generator_14_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_14_0206 := by
  native_decide

/-- Coefficient term 207 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0207 : Poly :=
[
  term ((1063271254698166725818 : Rat) / 32049107564750198685) [(7, 2), (16, 1)]
]

/-- Partial product 207 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0207 : Poly :=
[
  term ((2126542509396333451636 : Rat) / 32049107564750198685) [(4, 1), (6, 1), (7, 2), (16, 1)],
  term ((2126542509396333451636 : Rat) / 32049107564750198685) [(5, 1), (7, 3), (16, 1)],
  term ((-1063271254698166725818 : Rat) / 32049107564750198685) [(6, 2), (7, 2), (16, 1)],
  term ((-1063271254698166725818 : Rat) / 32049107564750198685) [(7, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 207 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0207_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0207
        rs_R009_ueqv_R009NYNYN_generator_14_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_14_0207 := by
  native_decide

/-- Coefficient term 208 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0208 : Poly :=
[
  term ((-4923148146660715477585926797324420512468877042440283661957961476992307662702081 : Rat) / 1450933331614669799792486005019359194038596203571577616053382712172914022400) [(8, 1)]
]

/-- Partial product 208 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0208 : Poly :=
[
  term ((-4923148146660715477585926797324420512468877042440283661957961476992307662702081 : Rat) / 725466665807334899896243002509679597019298101785788808026691356086457011200) [(4, 1), (6, 1), (8, 1)],
  term ((-4923148146660715477585926797324420512468877042440283661957961476992307662702081 : Rat) / 725466665807334899896243002509679597019298101785788808026691356086457011200) [(5, 1), (7, 1), (8, 1)],
  term ((4923148146660715477585926797324420512468877042440283661957961476992307662702081 : Rat) / 1450933331614669799792486005019359194038596203571577616053382712172914022400) [(6, 2), (8, 1)],
  term ((4923148146660715477585926797324420512468877042440283661957961476992307662702081 : Rat) / 1450933331614669799792486005019359194038596203571577616053382712172914022400) [(7, 2), (8, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 208 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0208_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0208
        rs_R009_ueqv_R009NYNYN_generator_14_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_14_0208 := by
  native_decide

/-- Coefficient term 209 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0209 : Poly :=
[
  term ((145278151340587786739123651173532601518873 : Rat) / 26378116650431965445475245450910532857000) [(8, 1), (9, 1), (11, 1)]
]

/-- Partial product 209 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0209 : Poly :=
[
  term ((145278151340587786739123651173532601518873 : Rat) / 13189058325215982722737622725455266428500) [(4, 1), (6, 1), (8, 1), (9, 1), (11, 1)],
  term ((145278151340587786739123651173532601518873 : Rat) / 13189058325215982722737622725455266428500) [(5, 1), (7, 1), (8, 1), (9, 1), (11, 1)],
  term ((-145278151340587786739123651173532601518873 : Rat) / 26378116650431965445475245450910532857000) [(6, 2), (8, 1), (9, 1), (11, 1)],
  term ((-145278151340587786739123651173532601518873 : Rat) / 26378116650431965445475245450910532857000) [(7, 2), (8, 1), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 209 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0209_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0209
        rs_R009_ueqv_R009NYNYN_generator_14_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_14_0209 := by
  native_decide

/-- Coefficient term 210 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0210 : Poly :=
[
  term ((-185373113891409044046 : Rat) / 4339258264657398321155) [(8, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 210 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0210 : Poly :=
[
  term ((-370746227782818088092 : Rat) / 4339258264657398321155) [(4, 1), (6, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-370746227782818088092 : Rat) / 4339258264657398321155) [(5, 1), (7, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((185373113891409044046 : Rat) / 4339258264657398321155) [(6, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((185373113891409044046 : Rat) / 4339258264657398321155) [(7, 2), (8, 1), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 210 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0210_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0210
        rs_R009_ueqv_R009NYNYN_generator_14_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_14_0210 := by
  native_decide

/-- Coefficient term 211 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0211 : Poly :=
[
  term ((176341754222601703068863644471626836397574 : Rat) / 9891793743911987042053217044091449821375) [(8, 1), (9, 1), (13, 1)]
]

/-- Partial product 211 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0211 : Poly :=
[
  term ((352683508445203406137727288943253672795148 : Rat) / 9891793743911987042053217044091449821375) [(4, 1), (6, 1), (8, 1), (9, 1), (13, 1)],
  term ((352683508445203406137727288943253672795148 : Rat) / 9891793743911987042053217044091449821375) [(5, 1), (7, 1), (8, 1), (9, 1), (13, 1)],
  term ((-176341754222601703068863644471626836397574 : Rat) / 9891793743911987042053217044091449821375) [(6, 2), (8, 1), (9, 1), (13, 1)],
  term ((-176341754222601703068863644471626836397574 : Rat) / 9891793743911987042053217044091449821375) [(7, 2), (8, 1), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 211 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0211_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0211
        rs_R009_ueqv_R009NYNYN_generator_14_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_14_0211 := by
  native_decide

/-- Coefficient term 212 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0212 : Poly :=
[
  term ((-600026359323760732128 : Rat) / 4339258264657398321155) [(8, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 212 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0212 : Poly :=
[
  term ((-1200052718647521464256 : Rat) / 4339258264657398321155) [(4, 1), (6, 1), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((-1200052718647521464256 : Rat) / 4339258264657398321155) [(5, 1), (7, 1), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((600026359323760732128 : Rat) / 4339258264657398321155) [(6, 2), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((600026359323760732128 : Rat) / 4339258264657398321155) [(7, 2), (8, 1), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 212 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0212_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0212
        rs_R009_ueqv_R009NYNYN_generator_14_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_14_0212 := by
  native_decide

/-- Coefficient term 213 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0213 : Poly :=
[
  term ((-88170877111300851534431822235813418198787 : Rat) / 9891793743911987042053217044091449821375) [(8, 1), (9, 1), (15, 1)]
]

/-- Partial product 213 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0213 : Poly :=
[
  term ((-176341754222601703068863644471626836397574 : Rat) / 9891793743911987042053217044091449821375) [(4, 1), (6, 1), (8, 1), (9, 1), (15, 1)],
  term ((-176341754222601703068863644471626836397574 : Rat) / 9891793743911987042053217044091449821375) [(5, 1), (7, 1), (8, 1), (9, 1), (15, 1)],
  term ((88170877111300851534431822235813418198787 : Rat) / 9891793743911987042053217044091449821375) [(6, 2), (8, 1), (9, 1), (15, 1)],
  term ((88170877111300851534431822235813418198787 : Rat) / 9891793743911987042053217044091449821375) [(7, 2), (8, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 213 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0213_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0213
        rs_R009_ueqv_R009NYNYN_generator_14_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_14_0213 := by
  native_decide

/-- Coefficient term 214 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0214 : Poly :=
[
  term ((26955882504092726553832 : Rat) / 13017774793972194963465) [(8, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 214 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0214 : Poly :=
[
  term ((53911765008185453107664 : Rat) / 13017774793972194963465) [(4, 1), (6, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((53911765008185453107664 : Rat) / 13017774793972194963465) [(5, 1), (7, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-26955882504092726553832 : Rat) / 13017774793972194963465) [(6, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-26955882504092726553832 : Rat) / 13017774793972194963465) [(7, 2), (8, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 214 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0214_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0214
        rs_R009_ueqv_R009NYNYN_generator_14_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_14_0214 := by
  native_decide

/-- Coefficient term 215 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0215 : Poly :=
[
  term ((19404446592800596025157126058687617591458810931200 : Rat) / 4063562337142509348624007334568541033400269394457) [(8, 1), (10, 1)]
]

/-- Partial product 215 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0215 : Poly :=
[
  term ((38808893185601192050314252117375235182917621862400 : Rat) / 4063562337142509348624007334568541033400269394457) [(4, 1), (6, 1), (8, 1), (10, 1)],
  term ((38808893185601192050314252117375235182917621862400 : Rat) / 4063562337142509348624007334568541033400269394457) [(5, 1), (7, 1), (8, 1), (10, 1)],
  term ((-19404446592800596025157126058687617591458810931200 : Rat) / 4063562337142509348624007334568541033400269394457) [(6, 2), (8, 1), (10, 1)],
  term ((-19404446592800596025157126058687617591458810931200 : Rat) / 4063562337142509348624007334568541033400269394457) [(7, 2), (8, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 215 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0215_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0215
        rs_R009_ueqv_R009NYNYN_generator_14_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_14_0215 := by
  native_decide

/-- Coefficient term 216 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0216 : Poly :=
[
  term ((8932095311065397632557927744667245019630513 : Rat) / 79134349951295896336425736352731598571000) [(8, 1), (11, 1), (13, 1)]
]

/-- Partial product 216 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0216 : Poly :=
[
  term ((8932095311065397632557927744667245019630513 : Rat) / 39567174975647948168212868176365799285500) [(4, 1), (6, 1), (8, 1), (11, 1), (13, 1)],
  term ((8932095311065397632557927744667245019630513 : Rat) / 39567174975647948168212868176365799285500) [(5, 1), (7, 1), (8, 1), (11, 1), (13, 1)],
  term ((-8932095311065397632557927744667245019630513 : Rat) / 79134349951295896336425736352731598571000) [(6, 2), (8, 1), (11, 1), (13, 1)],
  term ((-8932095311065397632557927744667245019630513 : Rat) / 79134349951295896336425736352731598571000) [(7, 2), (8, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 216 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0216_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0216
        rs_R009_ueqv_R009NYNYN_generator_14_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_14_0216 := by
  native_decide

/-- Coefficient term 217 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0217 : Poly :=
[
  term ((469290388437079962962 : Rat) / 867851652931479664231) [(8, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 217 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0217 : Poly :=
[
  term ((938580776874159925924 : Rat) / 867851652931479664231) [(4, 1), (6, 1), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((938580776874159925924 : Rat) / 867851652931479664231) [(5, 1), (7, 1), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((-469290388437079962962 : Rat) / 867851652931479664231) [(6, 2), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((-469290388437079962962 : Rat) / 867851652931479664231) [(7, 2), (8, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 217 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0217_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0217
        rs_R009_ueqv_R009NYNYN_generator_14_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_14_0217 := by
  native_decide

/-- Coefficient term 218 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0218 : Poly :=
[
  term ((-1250170643358871697578796790989985352407695667020255431793609621783698774781 : Rat) / 47078156311578732234171108597500695437118769464394981759329657313815854000) [(8, 1), (11, 1), (15, 1)]
]

/-- Partial product 218 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0218 : Poly :=
[
  term ((-1250170643358871697578796790989985352407695667020255431793609621783698774781 : Rat) / 23539078155789366117085554298750347718559384732197490879664828656907927000) [(4, 1), (6, 1), (8, 1), (11, 1), (15, 1)],
  term ((-1250170643358871697578796790989985352407695667020255431793609621783698774781 : Rat) / 23539078155789366117085554298750347718559384732197490879664828656907927000) [(5, 1), (7, 1), (8, 1), (11, 1), (15, 1)],
  term ((1250170643358871697578796790989985352407695667020255431793609621783698774781 : Rat) / 47078156311578732234171108597500695437118769464394981759329657313815854000) [(6, 2), (8, 1), (11, 1), (15, 1)],
  term ((1250170643358871697578796790989985352407695667020255431793609621783698774781 : Rat) / 47078156311578732234171108597500695437118769464394981759329657313815854000) [(7, 2), (8, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 218 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0218_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0218
        rs_R009_ueqv_R009NYNYN_generator_14_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_14_0218 := by
  native_decide

/-- Coefficient term 219 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0219 : Poly :=
[
  term ((-166838927379011499814 : Rat) / 619894037808199760165) [(8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 219 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0219 : Poly :=
[
  term ((-333677854758022999628 : Rat) / 619894037808199760165) [(4, 1), (6, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-333677854758022999628 : Rat) / 619894037808199760165) [(5, 1), (7, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((166838927379011499814 : Rat) / 619894037808199760165) [(6, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((166838927379011499814 : Rat) / 619894037808199760165) [(7, 2), (8, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 219 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0219_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0219
        rs_R009_ueqv_R009NYNYN_generator_14_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_14_0219 := by
  native_decide

/-- Coefficient term 220 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0220 : Poly :=
[
  term ((-1279185792353241200267644851736962251489018316185327928642044753 : Rat) / 102898219117181237378634408049270545470704491877698531631322625) [(8, 1), (11, 2)]
]

/-- Partial product 220 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0220 : Poly :=
[
  term ((-2558371584706482400535289703473924502978036632370655857284089506 : Rat) / 102898219117181237378634408049270545470704491877698531631322625) [(4, 1), (6, 1), (8, 1), (11, 2)],
  term ((-2558371584706482400535289703473924502978036632370655857284089506 : Rat) / 102898219117181237378634408049270545470704491877698531631322625) [(5, 1), (7, 1), (8, 1), (11, 2)],
  term ((1279185792353241200267644851736962251489018316185327928642044753 : Rat) / 102898219117181237378634408049270545470704491877698531631322625) [(6, 2), (8, 1), (11, 2)],
  term ((1279185792353241200267644851736962251489018316185327928642044753 : Rat) / 102898219117181237378634408049270545470704491877698531631322625) [(7, 2), (8, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 220 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0220_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0220
        rs_R009_ueqv_R009NYNYN_generator_14_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_14_0220 := by
  native_decide

/-- Coefficient term 221 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0221 : Poly :=
[
  term ((140112162516648874056 : Rat) / 619894037808199760165) [(8, 1), (11, 2), (16, 1)]
]

/-- Partial product 221 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0221 : Poly :=
[
  term ((280224325033297748112 : Rat) / 619894037808199760165) [(4, 1), (6, 1), (8, 1), (11, 2), (16, 1)],
  term ((280224325033297748112 : Rat) / 619894037808199760165) [(5, 1), (7, 1), (8, 1), (11, 2), (16, 1)],
  term ((-140112162516648874056 : Rat) / 619894037808199760165) [(6, 2), (8, 1), (11, 2), (16, 1)],
  term ((-140112162516648874056 : Rat) / 619894037808199760165) [(7, 2), (8, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 221 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0221_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0221
        rs_R009_ueqv_R009NYNYN_generator_14_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_14_0221 := by
  native_decide

/-- Coefficient term 222 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0222 : Poly :=
[
  term ((-665726243658694139119516632846039818889152017747993773855678576008910787 : Rat) / 3141977415156222136949921533616789037463929200348219600141469927244500) [(8, 1), (12, 1)]
]

/-- Partial product 222 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0222 : Poly :=
[
  term ((-665726243658694139119516632846039818889152017747993773855678576008910787 : Rat) / 1570988707578111068474960766808394518731964600174109800070734963622250) [(4, 1), (6, 1), (8, 1), (12, 1)],
  term ((-665726243658694139119516632846039818889152017747993773855678576008910787 : Rat) / 1570988707578111068474960766808394518731964600174109800070734963622250) [(5, 1), (7, 1), (8, 1), (12, 1)],
  term ((665726243658694139119516632846039818889152017747993773855678576008910787 : Rat) / 3141977415156222136949921533616789037463929200348219600141469927244500) [(6, 2), (8, 1), (12, 1)],
  term ((665726243658694139119516632846039818889152017747993773855678576008910787 : Rat) / 3141977415156222136949921533616789037463929200348219600141469927244500) [(7, 2), (8, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 222 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0222_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0222
        rs_R009_ueqv_R009NYNYN_generator_14_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_14_0222 := by
  native_decide

/-- Coefficient term 223 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0223 : Poly :=
[
  term ((5172204066371695792 : Rat) / 10683035854916732895) [(8, 1), (12, 1), (16, 1)]
]

/-- Partial product 223 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0223 : Poly :=
[
  term ((10344408132743391584 : Rat) / 10683035854916732895) [(4, 1), (6, 1), (8, 1), (12, 1), (16, 1)],
  term ((10344408132743391584 : Rat) / 10683035854916732895) [(5, 1), (7, 1), (8, 1), (12, 1), (16, 1)],
  term ((-5172204066371695792 : Rat) / 10683035854916732895) [(6, 2), (8, 1), (12, 1), (16, 1)],
  term ((-5172204066371695792 : Rat) / 10683035854916732895) [(7, 2), (8, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 223 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0223_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0223
        rs_R009_ueqv_R009NYNYN_generator_14_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_14_0223 := by
  native_decide

/-- Coefficient term 224 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0224 : Poly :=
[
  term ((-3066164094241343809320335083175567651738618308675279783300335411150017 : Rat) / 1237933599934384271837378196467197873784774810614203844470102013510935) [(8, 1), (13, 1), (15, 1)]
]

/-- Partial product 224 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0224 : Poly :=
[
  term ((-6132328188482687618640670166351135303477236617350559566600670822300034 : Rat) / 1237933599934384271837378196467197873784774810614203844470102013510935) [(4, 1), (6, 1), (8, 1), (13, 1), (15, 1)],
  term ((-6132328188482687618640670166351135303477236617350559566600670822300034 : Rat) / 1237933599934384271837378196467197873784774810614203844470102013510935) [(5, 1), (7, 1), (8, 1), (13, 1), (15, 1)],
  term ((3066164094241343809320335083175567651738618308675279783300335411150017 : Rat) / 1237933599934384271837378196467197873784774810614203844470102013510935) [(6, 2), (8, 1), (13, 1), (15, 1)],
  term ((3066164094241343809320335083175567651738618308675279783300335411150017 : Rat) / 1237933599934384271837378196467197873784774810614203844470102013510935) [(7, 2), (8, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 224 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0224_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0224
        rs_R009_ueqv_R009NYNYN_generator_14_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_14_0224 := by
  native_decide

/-- Coefficient term 225 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0225 : Poly :=
[
  term ((4021195760521126859792 : Rat) / 13017774793972194963465) [(8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 225 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0225 : Poly :=
[
  term ((8042391521042253719584 : Rat) / 13017774793972194963465) [(4, 1), (6, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((8042391521042253719584 : Rat) / 13017774793972194963465) [(5, 1), (7, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4021195760521126859792 : Rat) / 13017774793972194963465) [(6, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4021195760521126859792 : Rat) / 13017774793972194963465) [(7, 2), (8, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 225 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0225_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0225
        rs_R009_ueqv_R009NYNYN_generator_14_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_14_0225 := by
  native_decide

/-- Coefficient term 226 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0226 : Poly :=
[
  term ((-48703879239951079549238805141693391834234 : Rat) / 1187015249269438445046386045290973978565) [(8, 1), (13, 2)]
]

/-- Partial product 226 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0226 : Poly :=
[
  term ((-97407758479902159098477610283386783668468 : Rat) / 1187015249269438445046386045290973978565) [(4, 1), (6, 1), (8, 1), (13, 2)],
  term ((-97407758479902159098477610283386783668468 : Rat) / 1187015249269438445046386045290973978565) [(5, 1), (7, 1), (8, 1), (13, 2)],
  term ((48703879239951079549238805141693391834234 : Rat) / 1187015249269438445046386045290973978565) [(6, 2), (8, 1), (13, 2)],
  term ((48703879239951079549238805141693391834234 : Rat) / 1187015249269438445046386045290973978565) [(7, 2), (8, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 226 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0226_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0226
        rs_R009_ueqv_R009NYNYN_generator_14_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_14_0226 := by
  native_decide

/-- Coefficient term 227 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0227 : Poly :=
[
  term ((-8042391521042253719584 : Rat) / 13017774793972194963465) [(8, 1), (13, 2), (16, 1)]
]

/-- Partial product 227 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0227 : Poly :=
[
  term ((-16084783042084507439168 : Rat) / 13017774793972194963465) [(4, 1), (6, 1), (8, 1), (13, 2), (16, 1)],
  term ((-16084783042084507439168 : Rat) / 13017774793972194963465) [(5, 1), (7, 1), (8, 1), (13, 2), (16, 1)],
  term ((8042391521042253719584 : Rat) / 13017774793972194963465) [(6, 2), (8, 1), (13, 2), (16, 1)],
  term ((8042391521042253719584 : Rat) / 13017774793972194963465) [(7, 2), (8, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 227 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0227_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0227
        rs_R009_ueqv_R009NYNYN_generator_14_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_14_0227 := by
  native_decide

/-- Coefficient term 228 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0228 : Poly :=
[
  term ((-478906748257539652454652361666933543562542050155236249600 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(8, 1), (15, 2)]
]

/-- Partial product 228 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0228 : Poly :=
[
  term ((-957813496515079304909304723333867087125084100310472499200 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(4, 1), (6, 1), (8, 1), (15, 2)],
  term ((-957813496515079304909304723333867087125084100310472499200 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 1), (7, 1), (8, 1), (15, 2)],
  term ((478906748257539652454652361666933543562542050155236249600 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(6, 2), (8, 1), (15, 2)],
  term ((478906748257539652454652361666933543562542050155236249600 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(7, 2), (8, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 228 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0228_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0228
        rs_R009_ueqv_R009NYNYN_generator_14_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_14_0228 := by
  native_decide

/-- Coefficient term 229 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0229 : Poly :=
[
  term ((-107867865275482579117 : Rat) / 1424404780655564386) [(8, 1), (16, 1)]
]

/-- Partial product 229 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0229 : Poly :=
[
  term ((-107867865275482579117 : Rat) / 712202390327782193) [(4, 1), (6, 1), (8, 1), (16, 1)],
  term ((-107867865275482579117 : Rat) / 712202390327782193) [(5, 1), (7, 1), (8, 1), (16, 1)],
  term ((107867865275482579117 : Rat) / 1424404780655564386) [(6, 2), (8, 1), (16, 1)],
  term ((107867865275482579117 : Rat) / 1424404780655564386) [(7, 2), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 229 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0229_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0229
        rs_R009_ueqv_R009NYNYN_generator_14_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_14_0229 := by
  native_decide

/-- Coefficient term 230 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0230 : Poly :=
[
  term ((-38808893185601192050314252117375235182917621862400 : Rat) / 4063562337142509348624007334568541033400269394457) [(8, 2)]
]

/-- Partial product 230 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0230 : Poly :=
[
  term ((-77617786371202384100628504234750470365835243724800 : Rat) / 4063562337142509348624007334568541033400269394457) [(4, 1), (6, 1), (8, 2)],
  term ((-77617786371202384100628504234750470365835243724800 : Rat) / 4063562337142509348624007334568541033400269394457) [(5, 1), (7, 1), (8, 2)],
  term ((38808893185601192050314252117375235182917621862400 : Rat) / 4063562337142509348624007334568541033400269394457) [(6, 2), (8, 2)],
  term ((38808893185601192050314252117375235182917621862400 : Rat) / 4063562337142509348624007334568541033400269394457) [(7, 2), (8, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 230 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0230_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0230
        rs_R009_ueqv_R009NYNYN_generator_14_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_14_0230 := by
  native_decide

/-- Coefficient term 231 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0231 : Poly :=
[
  term ((-9054328418831706032809011351666946314309483279274482637565433559 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(9, 1), (10, 1), (11, 1)]
]

/-- Partial product 231 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0231 : Poly :=
[
  term ((-18108656837663412065618022703333892628618966558548965275130867118 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(4, 1), (6, 1), (9, 1), (10, 1), (11, 1)],
  term ((-18108656837663412065618022703333892628618966558548965275130867118 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(5, 1), (7, 1), (9, 1), (10, 1), (11, 1)],
  term ((9054328418831706032809011351666946314309483279274482637565433559 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(6, 2), (9, 1), (10, 1), (11, 1)],
  term ((9054328418831706032809011351666946314309483279274482637565433559 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(7, 2), (9, 1), (10, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 231 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0231_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0231
        rs_R009_ueqv_R009NYNYN_generator_14_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_14_0231 := by
  native_decide

/-- Coefficient term 232 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0232 : Poly :=
[
  term ((-39099158874699228392 : Rat) / 88556291115457108595) [(9, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 232 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0232 : Poly :=
[
  term ((-78198317749398456784 : Rat) / 88556291115457108595) [(4, 1), (6, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-78198317749398456784 : Rat) / 88556291115457108595) [(5, 1), (7, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((39099158874699228392 : Rat) / 88556291115457108595) [(6, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((39099158874699228392 : Rat) / 88556291115457108595) [(7, 2), (9, 1), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 232 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0232_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0232
        rs_R009_ueqv_R009NYNYN_generator_14_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_14_0232 := by
  native_decide

/-- Coefficient term 233 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0233 : Poly :=
[
  term ((-1396773737455217810168898726178554750800711 : Rat) / 19783587487823974084106434088182899642750) [(9, 1), (10, 1), (12, 1), (13, 1)]
]

/-- Partial product 233 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0233 : Poly :=
[
  term ((-1396773737455217810168898726178554750800711 : Rat) / 9891793743911987042053217044091449821375) [(4, 1), (6, 1), (9, 1), (10, 1), (12, 1), (13, 1)],
  term ((-1396773737455217810168898726178554750800711 : Rat) / 9891793743911987042053217044091449821375) [(5, 1), (7, 1), (9, 1), (10, 1), (12, 1), (13, 1)],
  term ((1396773737455217810168898726178554750800711 : Rat) / 19783587487823974084106434088182899642750) [(6, 2), (9, 1), (10, 1), (12, 1), (13, 1)],
  term ((1396773737455217810168898726178554750800711 : Rat) / 19783587487823974084106434088182899642750) [(7, 2), (9, 1), (10, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 233 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0233_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0233
        rs_R009_ueqv_R009NYNYN_generator_14_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_14_0233 := by
  native_decide

/-- Coefficient term 234 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0234 : Poly :=
[
  term ((2376354551362621740696 : Rat) / 4339258264657398321155) [(9, 1), (10, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 234 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0234 : Poly :=
[
  term ((4752709102725243481392 : Rat) / 4339258264657398321155) [(4, 1), (6, 1), (9, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((4752709102725243481392 : Rat) / 4339258264657398321155) [(5, 1), (7, 1), (9, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-2376354551362621740696 : Rat) / 4339258264657398321155) [(6, 2), (9, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-2376354551362621740696 : Rat) / 4339258264657398321155) [(7, 2), (9, 1), (10, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 234 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0234_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0234
        rs_R009_ueqv_R009NYNYN_generator_14_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_14_0234 := by
  native_decide

/-- Coefficient term 235 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0235 : Poly :=
[
  term ((1396773737455217810168898726178554750800711 : Rat) / 39567174975647948168212868176365799285500) [(9, 1), (10, 1), (12, 1), (15, 1)]
]

/-- Partial product 235 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0235 : Poly :=
[
  term ((1396773737455217810168898726178554750800711 : Rat) / 19783587487823974084106434088182899642750) [(4, 1), (6, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((1396773737455217810168898726178554750800711 : Rat) / 19783587487823974084106434088182899642750) [(5, 1), (7, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((-1396773737455217810168898726178554750800711 : Rat) / 39567174975647948168212868176365799285500) [(6, 2), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((-1396773737455217810168898726178554750800711 : Rat) / 39567174975647948168212868176365799285500) [(7, 2), (9, 1), (10, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 235 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0235_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0235
        rs_R009_ueqv_R009NYNYN_generator_14_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_14_0235 := by
  native_decide

/-- Coefficient term 236 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0236 : Poly :=
[
  term ((-1188177275681310870348 : Rat) / 4339258264657398321155) [(9, 1), (10, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 236 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0236 : Poly :=
[
  term ((-2376354551362621740696 : Rat) / 4339258264657398321155) [(4, 1), (6, 1), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-2376354551362621740696 : Rat) / 4339258264657398321155) [(5, 1), (7, 1), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((1188177275681310870348 : Rat) / 4339258264657398321155) [(6, 2), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((1188177275681310870348 : Rat) / 4339258264657398321155) [(7, 2), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 236 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0236_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0236
        rs_R009_ueqv_R009NYNYN_generator_14_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_14_0236 := by
  native_decide

/-- Coefficient term 237 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0237 : Poly :=
[
  term ((9376185267000648960850828862774639123683163 : Rat) / 59350762463471922252319302264548698928250) [(9, 1), (10, 1), (13, 1)]
]

/-- Partial product 237 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0237 : Poly :=
[
  term ((9376185267000648960850828862774639123683163 : Rat) / 29675381231735961126159651132274349464125) [(4, 1), (6, 1), (9, 1), (10, 1), (13, 1)],
  term ((9376185267000648960850828862774639123683163 : Rat) / 29675381231735961126159651132274349464125) [(5, 1), (7, 1), (9, 1), (10, 1), (13, 1)],
  term ((-9376185267000648960850828862774639123683163 : Rat) / 59350762463471922252319302264548698928250) [(6, 2), (9, 1), (10, 1), (13, 1)],
  term ((-9376185267000648960850828862774639123683163 : Rat) / 59350762463471922252319302264548698928250) [(7, 2), (9, 1), (10, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 237 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0237_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0237
        rs_R009_ueqv_R009NYNYN_generator_14_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_14_0237 := by
  native_decide

/-- Coefficient term 238 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0238 : Poly :=
[
  term ((-8598145671688801776956 : Rat) / 13017774793972194963465) [(9, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 238 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0238 : Poly :=
[
  term ((-17196291343377603553912 : Rat) / 13017774793972194963465) [(4, 1), (6, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-17196291343377603553912 : Rat) / 13017774793972194963465) [(5, 1), (7, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((8598145671688801776956 : Rat) / 13017774793972194963465) [(6, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((8598145671688801776956 : Rat) / 13017774793972194963465) [(7, 2), (9, 1), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 238 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0238_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0238
        rs_R009_ueqv_R009NYNYN_generator_14_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_14_0238 := by
  native_decide

/-- Coefficient term 239 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0239 : Poly :=
[
  term ((-7926656721459394053556654870707033423082162565108391928966708404983305969 : Rat) / 4323504151063352960281020177321492438102744134485253426877213426779007000) [(9, 1), (10, 1), (15, 1)]
]

/-- Partial product 239 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0239 : Poly :=
[
  term ((-7926656721459394053556654870707033423082162565108391928966708404983305969 : Rat) / 2161752075531676480140510088660746219051372067242626713438606713389503500) [(4, 1), (6, 1), (9, 1), (10, 1), (15, 1)],
  term ((-7926656721459394053556654870707033423082162565108391928966708404983305969 : Rat) / 2161752075531676480140510088660746219051372067242626713438606713389503500) [(5, 1), (7, 1), (9, 1), (10, 1), (15, 1)],
  term ((7926656721459394053556654870707033423082162565108391928966708404983305969 : Rat) / 4323504151063352960281020177321492438102744134485253426877213426779007000) [(6, 2), (9, 1), (10, 1), (15, 1)],
  term ((7926656721459394053556654870707033423082162565108391928966708404983305969 : Rat) / 4323504151063352960281020177321492438102744134485253426877213426779007000) [(7, 2), (9, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 239 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0239_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0239
        rs_R009_ueqv_R009NYNYN_generator_14_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_14_0239 := by
  native_decide

/-- Coefficient term 240 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0240 : Poly :=
[
  term ((239856450547616791143 : Rat) / 4339258264657398321155) [(9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 240 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0240 : Poly :=
[
  term ((479712901095233582286 : Rat) / 4339258264657398321155) [(4, 1), (6, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((479712901095233582286 : Rat) / 4339258264657398321155) [(5, 1), (7, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-239856450547616791143 : Rat) / 4339258264657398321155) [(6, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-239856450547616791143 : Rat) / 4339258264657398321155) [(7, 2), (9, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 240 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0240_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0240
        rs_R009_ueqv_R009NYNYN_generator_14_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_14_0240 := by
  native_decide

/-- Coefficient term 241 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0241 : Poly :=
[
  term ((-32833809011363210958547928968441139124964315670811560125911054657919 : Rat) / 88904061317244589095140128554569751286688680982331531329462748000) [(9, 1), (11, 1)]
]

/-- Partial product 241 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0241 : Poly :=
[
  term ((-32833809011363210958547928968441139124964315670811560125911054657919 : Rat) / 44452030658622294547570064277284875643344340491165765664731374000) [(4, 1), (6, 1), (9, 1), (11, 1)],
  term ((-32833809011363210958547928968441139124964315670811560125911054657919 : Rat) / 44452030658622294547570064277284875643344340491165765664731374000) [(5, 1), (7, 1), (9, 1), (11, 1)],
  term ((32833809011363210958547928968441139124964315670811560125911054657919 : Rat) / 88904061317244589095140128554569751286688680982331531329462748000) [(6, 2), (9, 1), (11, 1)],
  term ((32833809011363210958547928968441139124964315670811560125911054657919 : Rat) / 88904061317244589095140128554569751286688680982331531329462748000) [(7, 2), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 241 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0241_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0241
        rs_R009_ueqv_R009NYNYN_generator_14_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_14_0241 := by
  native_decide

/-- Coefficient term 242 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0242 : Poly :=
[
  term ((70851384689716574503106702327839157370151427338273764929044838099 : Rat) / 1852167944109262272815419344886869818472680853798573569363807250) [(9, 1), (11, 1), (12, 1)]
]

/-- Partial product 242 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0242 : Poly :=
[
  term ((70851384689716574503106702327839157370151427338273764929044838099 : Rat) / 926083972054631136407709672443434909236340426899286784681903625) [(4, 1), (6, 1), (9, 1), (11, 1), (12, 1)],
  term ((70851384689716574503106702327839157370151427338273764929044838099 : Rat) / 926083972054631136407709672443434909236340426899286784681903625) [(5, 1), (7, 1), (9, 1), (11, 1), (12, 1)],
  term ((-70851384689716574503106702327839157370151427338273764929044838099 : Rat) / 1852167944109262272815419344886869818472680853798573569363807250) [(6, 2), (9, 1), (11, 1), (12, 1)],
  term ((-70851384689716574503106702327839157370151427338273764929044838099 : Rat) / 1852167944109262272815419344886869818472680853798573569363807250) [(7, 2), (9, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 242 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0242_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0242
        rs_R009_ueqv_R009NYNYN_generator_14_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_14_0242 := by
  native_decide

/-- Coefficient term 243 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0243 : Poly :=
[
  term ((-912624703981476754712 : Rat) / 4339258264657398321155) [(9, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 243 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0243 : Poly :=
[
  term ((-1825249407962953509424 : Rat) / 4339258264657398321155) [(4, 1), (6, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-1825249407962953509424 : Rat) / 4339258264657398321155) [(5, 1), (7, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((912624703981476754712 : Rat) / 4339258264657398321155) [(6, 2), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((912624703981476754712 : Rat) / 4339258264657398321155) [(7, 2), (9, 1), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 243 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0243_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0243
        rs_R009_ueqv_R009NYNYN_generator_14_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_14_0243 := by
  native_decide

/-- Coefficient term 244 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0244 : Poly :=
[
  term ((-23452789857724826688073 : Rat) / 8678516529314796642310) [(9, 1), (11, 1), (16, 1)]
]

/-- Partial product 244 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0244 : Poly :=
[
  term ((-23452789857724826688073 : Rat) / 4339258264657398321155) [(4, 1), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((-23452789857724826688073 : Rat) / 4339258264657398321155) [(5, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((23452789857724826688073 : Rat) / 8678516529314796642310) [(6, 2), (9, 1), (11, 1), (16, 1)],
  term ((23452789857724826688073 : Rat) / 8678516529314796642310) [(7, 2), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 244 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0244_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0244
        rs_R009_ueqv_R009NYNYN_generator_14_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_14_0244 := by
  native_decide

/-- Coefficient term 245 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0245 : Poly :=
[
  term ((-63538774169698814346408849637367445274067849 : Rat) / 118701524926943844504638604529097397856500) [(9, 1), (12, 1), (13, 1)]
]

/-- Partial product 245 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0245 : Poly :=
[
  term ((-63538774169698814346408849637367445274067849 : Rat) / 59350762463471922252319302264548698928250) [(4, 1), (6, 1), (9, 1), (12, 1), (13, 1)],
  term ((-63538774169698814346408849637367445274067849 : Rat) / 59350762463471922252319302264548698928250) [(5, 1), (7, 1), (9, 1), (12, 1), (13, 1)],
  term ((63538774169698814346408849637367445274067849 : Rat) / 118701524926943844504638604529097397856500) [(6, 2), (9, 1), (12, 1), (13, 1)],
  term ((63538774169698814346408849637367445274067849 : Rat) / 118701524926943844504638604529097397856500) [(7, 2), (9, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 245 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0245_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0245
        rs_R009_ueqv_R009NYNYN_generator_14_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_14_0245 := by
  native_decide

/-- Coefficient term 246 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0246 : Poly :=
[
  term ((10308013288870050027788 : Rat) / 2603554958794438992693) [(9, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 246 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0246 : Poly :=
[
  term ((20616026577740100055576 : Rat) / 2603554958794438992693) [(4, 1), (6, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((20616026577740100055576 : Rat) / 2603554958794438992693) [(5, 1), (7, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-10308013288870050027788 : Rat) / 2603554958794438992693) [(6, 2), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-10308013288870050027788 : Rat) / 2603554958794438992693) [(7, 2), (9, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 246 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0246_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0246
        rs_R009_ueqv_R009NYNYN_generator_14_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_14_0246 := by
  native_decide

/-- Coefficient term 247 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0247 : Poly :=
[
  term ((120179829634567301843388550922161977126711471104778074193604655915144332559 : Rat) / 576467220141780394704136023642865658413699217931367123583628456903867600) [(9, 1), (12, 1), (15, 1)]
]

/-- Partial product 247 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0247 : Poly :=
[
  term ((120179829634567301843388550922161977126711471104778074193604655915144332559 : Rat) / 288233610070890197352068011821432829206849608965683561791814228451933800) [(4, 1), (6, 1), (9, 1), (12, 1), (15, 1)],
  term ((120179829634567301843388550922161977126711471104778074193604655915144332559 : Rat) / 288233610070890197352068011821432829206849608965683561791814228451933800) [(5, 1), (7, 1), (9, 1), (12, 1), (15, 1)],
  term ((-120179829634567301843388550922161977126711471104778074193604655915144332559 : Rat) / 576467220141780394704136023642865658413699217931367123583628456903867600) [(6, 2), (9, 1), (12, 1), (15, 1)],
  term ((-120179829634567301843388550922161977126711471104778074193604655915144332559 : Rat) / 576467220141780394704136023642865658413699217931367123583628456903867600) [(7, 2), (9, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 247 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0247_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0247
        rs_R009_ueqv_R009NYNYN_generator_14_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_14_0247 := by
  native_decide

/-- Coefficient term 248 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0248 : Poly :=
[
  term ((-1334904997908941109065 : Rat) / 2603554958794438992693) [(9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 248 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0248 : Poly :=
[
  term ((-2669809995817882218130 : Rat) / 2603554958794438992693) [(4, 1), (6, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-2669809995817882218130 : Rat) / 2603554958794438992693) [(5, 1), (7, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((1334904997908941109065 : Rat) / 2603554958794438992693) [(6, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((1334904997908941109065 : Rat) / 2603554958794438992693) [(7, 2), (9, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 248 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0248_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0248
        rs_R009_ueqv_R009NYNYN_generator_14_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_14_0248 := by
  native_decide

/-- Coefficient term 249 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0249 : Poly :=
[
  term ((1399855697661371049412760037343517301828689255904660835366418148226872723877376039 : Rat) / 2959144593120592793311059202004503712395537373454010973464424940117209319024000) [(9, 1), (13, 1)]
]

/-- Partial product 249 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0249 : Poly :=
[
  term ((1399855697661371049412760037343517301828689255904660835366418148226872723877376039 : Rat) / 1479572296560296396655529601002251856197768686727005486732212470058604659512000) [(4, 1), (6, 1), (9, 1), (13, 1)],
  term ((1399855697661371049412760037343517301828689255904660835366418148226872723877376039 : Rat) / 1479572296560296396655529601002251856197768686727005486732212470058604659512000) [(5, 1), (7, 1), (9, 1), (13, 1)],
  term ((-1399855697661371049412760037343517301828689255904660835366418148226872723877376039 : Rat) / 2959144593120592793311059202004503712395537373454010973464424940117209319024000) [(6, 2), (9, 1), (13, 1)],
  term ((-1399855697661371049412760037343517301828689255904660835366418148226872723877376039 : Rat) / 2959144593120592793311059202004503712395537373454010973464424940117209319024000) [(7, 2), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 249 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0249_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0249
        rs_R009_ueqv_R009NYNYN_generator_14_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_14_0249 := by
  native_decide

/-- Coefficient term 250 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0250 : Poly :=
[
  term ((-21504069983370457353150253 : Rat) / 7576344930091817468736630) [(9, 1), (13, 1), (16, 1)]
]

/-- Partial product 250 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0250 : Poly :=
[
  term ((-21504069983370457353150253 : Rat) / 3788172465045908734368315) [(4, 1), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((-21504069983370457353150253 : Rat) / 3788172465045908734368315) [(5, 1), (7, 1), (9, 1), (13, 1), (16, 1)],
  term ((21504069983370457353150253 : Rat) / 7576344930091817468736630) [(6, 2), (9, 1), (13, 1), (16, 1)],
  term ((21504069983370457353150253 : Rat) / 7576344930091817468736630) [(7, 2), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 250 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0250_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0250
        rs_R009_ueqv_R009NYNYN_generator_14_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_14_0250 := by
  native_decide

/-- Coefficient term 251 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0251 : Poly :=
[
  term ((-2284349240033664744839110490001324240224091790050988564977198868408362510378323447893 : Rat) / 1286241516476417667492540399804624280321260244994676769799203373970946984002432000) [(9, 1), (15, 1)]
]

/-- Partial product 251 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0251 : Poly :=
[
  term ((-2284349240033664744839110490001324240224091790050988564977198868408362510378323447893 : Rat) / 643120758238208833746270199902312140160630122497338384899601686985473492001216000) [(4, 1), (6, 1), (9, 1), (15, 1)],
  term ((-2284349240033664744839110490001324240224091790050988564977198868408362510378323447893 : Rat) / 643120758238208833746270199902312140160630122497338384899601686985473492001216000) [(5, 1), (7, 1), (9, 1), (15, 1)],
  term ((2284349240033664744839110490001324240224091790050988564977198868408362510378323447893 : Rat) / 1286241516476417667492540399804624280321260244994676769799203373970946984002432000) [(6, 2), (9, 1), (15, 1)],
  term ((2284349240033664744839110490001324240224091790050988564977198868408362510378323447893 : Rat) / 1286241516476417667492540399804624280321260244994676769799203373970946984002432000) [(7, 2), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 251 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0251_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0251
        rs_R009_ueqv_R009NYNYN_generator_14_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_14_0251 := by
  native_decide

/-- Coefficient term 252 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0252 : Poly :=
[
  term ((-16237484691949992082887146 : Rat) / 420908051671767637152035) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 252 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0252 : Poly :=
[
  term ((-32474969383899984165774292 : Rat) / 420908051671767637152035) [(4, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-32474969383899984165774292 : Rat) / 420908051671767637152035) [(5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((16237484691949992082887146 : Rat) / 420908051671767637152035) [(6, 2), (9, 1), (15, 1), (16, 1)],
  term ((16237484691949992082887146 : Rat) / 420908051671767637152035) [(7, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 252 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0252_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0252
        rs_R009_ueqv_R009NYNYN_generator_14_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_14_0252 := by
  native_decide

/-- Coefficient term 253 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0253 : Poly :=
[
  term ((-569062548470329302402412412084751698587687 : Rat) / 8329931573820620666992182773971747218000) [(9, 2)]
]

/-- Partial product 253 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0253 : Poly :=
[
  term ((-569062548470329302402412412084751698587687 : Rat) / 4164965786910310333496091386985873609000) [(4, 1), (6, 1), (9, 2)],
  term ((-569062548470329302402412412084751698587687 : Rat) / 4164965786910310333496091386985873609000) [(5, 1), (7, 1), (9, 2)],
  term ((569062548470329302402412412084751698587687 : Rat) / 8329931573820620666992182773971747218000) [(6, 2), (9, 2)],
  term ((569062548470329302402412412084751698587687 : Rat) / 8329931573820620666992182773971747218000) [(7, 2), (9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 253 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0253_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0253
        rs_R009_ueqv_R009NYNYN_generator_14_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_14_0253 := by
  native_decide

/-- Coefficient term 254 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0254 : Poly :=
[
  term ((-121622279285282230149082111765259194192583 : Rat) / 11304907135899413762346533764675942653000) [(9, 2), (10, 1)]
]

/-- Partial product 254 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0254 : Poly :=
[
  term ((-121622279285282230149082111765259194192583 : Rat) / 5652453567949706881173266882337971326500) [(4, 1), (6, 1), (9, 2), (10, 1)],
  term ((-121622279285282230149082111765259194192583 : Rat) / 5652453567949706881173266882337971326500) [(5, 1), (7, 1), (9, 2), (10, 1)],
  term ((121622279285282230149082111765259194192583 : Rat) / 11304907135899413762346533764675942653000) [(6, 2), (9, 2), (10, 1)],
  term ((121622279285282230149082111765259194192583 : Rat) / 11304907135899413762346533764675942653000) [(7, 2), (9, 2), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 254 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0254_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0254
        rs_R009_ueqv_R009NYNYN_generator_14_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_14_0254 := by
  native_decide

/-- Coefficient term 255 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0255 : Poly :=
[
  term ((51729505140402630822 : Rat) / 619894037808199760165) [(9, 2), (10, 1), (16, 1)]
]

/-- Partial product 255 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0255 : Poly :=
[
  term ((103459010280805261644 : Rat) / 619894037808199760165) [(4, 1), (6, 1), (9, 2), (10, 1), (16, 1)],
  term ((103459010280805261644 : Rat) / 619894037808199760165) [(5, 1), (7, 1), (9, 2), (10, 1), (16, 1)],
  term ((-51729505140402630822 : Rat) / 619894037808199760165) [(6, 2), (9, 2), (10, 1), (16, 1)],
  term ((-51729505140402630822 : Rat) / 619894037808199760165) [(7, 2), (9, 2), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 255 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0255_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0255
        rs_R009_ueqv_R009NYNYN_generator_14_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_14_0255 := by
  native_decide

/-- Coefficient term 256 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0256 : Poly :=
[
  term ((145278151340587786739123651173532601518873 : Rat) / 39567174975647948168212868176365799285500) [(9, 2), (12, 1)]
]

/-- Partial product 256 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0256 : Poly :=
[
  term ((145278151340587786739123651173532601518873 : Rat) / 19783587487823974084106434088182899642750) [(4, 1), (6, 1), (9, 2), (12, 1)],
  term ((145278151340587786739123651173532601518873 : Rat) / 19783587487823974084106434088182899642750) [(5, 1), (7, 1), (9, 2), (12, 1)],
  term ((-145278151340587786739123651173532601518873 : Rat) / 39567174975647948168212868176365799285500) [(6, 2), (9, 2), (12, 1)],
  term ((-145278151340587786739123651173532601518873 : Rat) / 39567174975647948168212868176365799285500) [(7, 2), (9, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 256 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0256_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0256
        rs_R009_ueqv_R009NYNYN_generator_14_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_14_0256 := by
  native_decide

/-- Coefficient term 257 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0257 : Poly :=
[
  term ((-123582075927606029364 : Rat) / 4339258264657398321155) [(9, 2), (12, 1), (16, 1)]
]

/-- Partial product 257 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0257 : Poly :=
[
  term ((-247164151855212058728 : Rat) / 4339258264657398321155) [(4, 1), (6, 1), (9, 2), (12, 1), (16, 1)],
  term ((-247164151855212058728 : Rat) / 4339258264657398321155) [(5, 1), (7, 1), (9, 2), (12, 1), (16, 1)],
  term ((123582075927606029364 : Rat) / 4339258264657398321155) [(6, 2), (9, 2), (12, 1), (16, 1)],
  term ((123582075927606029364 : Rat) / 4339258264657398321155) [(7, 2), (9, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 257 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0257_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0257
        rs_R009_ueqv_R009NYNYN_generator_14_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_14_0257 := by
  native_decide

/-- Coefficient term 258 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0258 : Poly :=
[
  term ((1048738444464494580317 : Rat) / 685146041788010261235) [(9, 2), (16, 1)]
]

/-- Partial product 258 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0258 : Poly :=
[
  term ((2097476888928989160634 : Rat) / 685146041788010261235) [(4, 1), (6, 1), (9, 2), (16, 1)],
  term ((2097476888928989160634 : Rat) / 685146041788010261235) [(5, 1), (7, 1), (9, 2), (16, 1)],
  term ((-1048738444464494580317 : Rat) / 685146041788010261235) [(6, 2), (9, 2), (16, 1)],
  term ((-1048738444464494580317 : Rat) / 685146041788010261235) [(7, 2), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 258 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0258_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0258
        rs_R009_ueqv_R009NYNYN_generator_14_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_14_0258 := by
  native_decide

/-- Coefficient term 259 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0259 : Poly :=
[
  term ((2731440526610231817785808802648150164958458947500129069956530764413263742419 : Rat) / 22253578705746469321970644248763177822677855882999656687935317671363712000) [(10, 1)]
]

/-- Partial product 259 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0259 : Poly :=
[
  term ((2731440526610231817785808802648150164958458947500129069956530764413263742419 : Rat) / 11126789352873234660985322124381588911338927941499828343967658835681856000) [(4, 1), (6, 1), (10, 1)],
  term ((2731440526610231817785808802648150164958458947500129069956530764413263742419 : Rat) / 11126789352873234660985322124381588911338927941499828343967658835681856000) [(5, 1), (7, 1), (10, 1)],
  term ((-2731440526610231817785808802648150164958458947500129069956530764413263742419 : Rat) / 22253578705746469321970644248763177822677855882999656687935317671363712000) [(6, 2), (10, 1)],
  term ((-2731440526610231817785808802648150164958458947500129069956530764413263742419 : Rat) / 22253578705746469321970644248763177822677855882999656687935317671363712000) [(7, 2), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 259 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0259_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0259
        rs_R009_ueqv_R009NYNYN_generator_14_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_14_0259 := by
  native_decide

/-- Coefficient term 260 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0260 : Poly :=
[
  term ((8612590640195854960793353557919213597396 : Rat) / 157012599109714080032590746731610314625) [(10, 1), (11, 1), (12, 1), (13, 1)]
]

/-- Partial product 260 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0260 : Poly :=
[
  term ((17225181280391709921586707115838427194792 : Rat) / 157012599109714080032590746731610314625) [(4, 1), (6, 1), (10, 1), (11, 1), (12, 1), (13, 1)],
  term ((17225181280391709921586707115838427194792 : Rat) / 157012599109714080032590746731610314625) [(5, 1), (7, 1), (10, 1), (11, 1), (12, 1), (13, 1)],
  term ((-8612590640195854960793353557919213597396 : Rat) / 157012599109714080032590746731610314625) [(6, 2), (10, 1), (11, 1), (12, 1), (13, 1)],
  term ((-8612590640195854960793353557919213597396 : Rat) / 157012599109714080032590746731610314625) [(7, 2), (10, 1), (11, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 260 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0260_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0260
        rs_R009_ueqv_R009NYNYN_generator_14_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_14_0260 := by
  native_decide

/-- Coefficient term 261 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0261 : Poly :=
[
  term ((-1796140595085123863456 : Rat) / 619894037808199760165) [(10, 1), (11, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 261 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0261 : Poly :=
[
  term ((-3592281190170247726912 : Rat) / 619894037808199760165) [(4, 1), (6, 1), (10, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-3592281190170247726912 : Rat) / 619894037808199760165) [(5, 1), (7, 1), (10, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((1796140595085123863456 : Rat) / 619894037808199760165) [(6, 2), (10, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((1796140595085123863456 : Rat) / 619894037808199760165) [(7, 2), (10, 1), (11, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 261 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0261_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0261
        rs_R009_ueqv_R009NYNYN_generator_14_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_14_0261 := by
  native_decide

/-- Coefficient term 262 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0262 : Poly :=
[
  term ((-4306295320097927480396676778959606798698 : Rat) / 157012599109714080032590746731610314625) [(10, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 262 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0262 : Poly :=
[
  term ((-8612590640195854960793353557919213597396 : Rat) / 157012599109714080032590746731610314625) [(4, 1), (6, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-8612590640195854960793353557919213597396 : Rat) / 157012599109714080032590746731610314625) [(5, 1), (7, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((4306295320097927480396676778959606798698 : Rat) / 157012599109714080032590746731610314625) [(6, 2), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((4306295320097927480396676778959606798698 : Rat) / 157012599109714080032590746731610314625) [(7, 2), (10, 1), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 262 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0262_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0262
        rs_R009_ueqv_R009NYNYN_generator_14_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_14_0262 := by
  native_decide

/-- Coefficient term 263 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0263 : Poly :=
[
  term ((898070297542561931728 : Rat) / 619894037808199760165) [(10, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 263 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0263 : Poly :=
[
  term ((1796140595085123863456 : Rat) / 619894037808199760165) [(4, 1), (6, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((1796140595085123863456 : Rat) / 619894037808199760165) [(5, 1), (7, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-898070297542561931728 : Rat) / 619894037808199760165) [(6, 2), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-898070297542561931728 : Rat) / 619894037808199760165) [(7, 2), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 263 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0263_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0263
        rs_R009_ueqv_R009NYNYN_generator_14_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_14_0263 := by
  native_decide

/-- Coefficient term 264 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0264 : Poly :=
[
  term ((-254388247805210300834503593439774650485267 : Rat) / 1099088193767998560228135227121272202375) [(10, 1), (11, 1), (13, 1)]
]

/-- Partial product 264 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0264 : Poly :=
[
  term ((-508776495610420601669007186879549300970534 : Rat) / 1099088193767998560228135227121272202375) [(4, 1), (6, 1), (10, 1), (11, 1), (13, 1)],
  term ((-508776495610420601669007186879549300970534 : Rat) / 1099088193767998560228135227121272202375) [(5, 1), (7, 1), (10, 1), (11, 1), (13, 1)],
  term ((254388247805210300834503593439774650485267 : Rat) / 1099088193767998560228135227121272202375) [(6, 2), (10, 1), (11, 1), (13, 1)],
  term ((254388247805210300834503593439774650485267 : Rat) / 1099088193767998560228135227121272202375) [(7, 2), (10, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 264 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0264_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0264
        rs_R009_ueqv_R009NYNYN_generator_14_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_14_0264 := by
  native_decide

/-- Coefficient term 265 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0265 : Poly :=
[
  term ((3389080530044619274216 : Rat) / 619894037808199760165) [(10, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 265 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0265 : Poly :=
[
  term ((6778161060089238548432 : Rat) / 619894037808199760165) [(4, 1), (6, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((6778161060089238548432 : Rat) / 619894037808199760165) [(5, 1), (7, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-3389080530044619274216 : Rat) / 619894037808199760165) [(6, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-3389080530044619274216 : Rat) / 619894037808199760165) [(7, 2), (10, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 265 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0265_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0265
        rs_R009_ueqv_R009NYNYN_generator_14_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_14_0265 := by
  native_decide

/-- Coefficient term 266 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0266 : Poly :=
[
  term ((20158181568752419619071967836108826507140386416608751229270112229 : Rat) / 617389314703087424271806448295623272824226951266191189787935750) [(10, 1), (11, 1), (15, 1)]
]

/-- Partial product 266 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0266 : Poly :=
[
  term ((20158181568752419619071967836108826507140386416608751229270112229 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(4, 1), (6, 1), (10, 1), (11, 1), (15, 1)],
  term ((20158181568752419619071967836108826507140386416608751229270112229 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(5, 1), (7, 1), (10, 1), (11, 1), (15, 1)],
  term ((-20158181568752419619071967836108826507140386416608751229270112229 : Rat) / 617389314703087424271806448295623272824226951266191189787935750) [(6, 2), (10, 1), (11, 1), (15, 1)],
  term ((-20158181568752419619071967836108826507140386416608751229270112229 : Rat) / 617389314703087424271806448295623272824226951266191189787935750) [(7, 2), (10, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 266 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0266_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0266
        rs_R009_ueqv_R009NYNYN_generator_14_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_14_0266 := by
  native_decide

/-- Coefficient term 267 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0267 : Poly :=
[
  term ((-265873209235941018268 : Rat) / 619894037808199760165) [(10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 267 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0267 : Poly :=
[
  term ((-531746418471882036536 : Rat) / 619894037808199760165) [(4, 1), (6, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-531746418471882036536 : Rat) / 619894037808199760165) [(5, 1), (7, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((265873209235941018268 : Rat) / 619894037808199760165) [(6, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((265873209235941018268 : Rat) / 619894037808199760165) [(7, 2), (10, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 267 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0267_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0267
        rs_R009_ueqv_R009NYNYN_generator_14_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_14_0267 := by
  native_decide

/-- Coefficient term 268 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0268 : Poly :=
[
  term ((-15343261876519929640746959278573080381737811215405627852314837894966510239809 : Rat) / 50070552087929555974433949559717150101025175736749227547854464760568352000) [(10, 1), (12, 1)]
]

/-- Partial product 268 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0268 : Poly :=
[
  term ((-15343261876519929640746959278573080381737811215405627852314837894966510239809 : Rat) / 25035276043964777987216974779858575050512587868374613773927232380284176000) [(4, 1), (6, 1), (10, 1), (12, 1)],
  term ((-15343261876519929640746959278573080381737811215405627852314837894966510239809 : Rat) / 25035276043964777987216974779858575050512587868374613773927232380284176000) [(5, 1), (7, 1), (10, 1), (12, 1)],
  term ((15343261876519929640746959278573080381737811215405627852314837894966510239809 : Rat) / 50070552087929555974433949559717150101025175736749227547854464760568352000) [(6, 2), (10, 1), (12, 1)],
  term ((15343261876519929640746959278573080381737811215405627852314837894966510239809 : Rat) / 50070552087929555974433949559717150101025175736749227547854464760568352000) [(7, 2), (10, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 268 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0268_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0268
        rs_R009_ueqv_R009NYNYN_generator_14_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_14_0268 := by
  native_decide

/-- Coefficient term 269 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0269 : Poly :=
[
  term ((923429963551842515366118497986774856256857000875796596876236664734207727391 : Rat) / 6355551102063128851613099660662593884011033877693322537509503737365140290) [(10, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 269 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0269 : Poly :=
[
  term ((923429963551842515366118497986774856256857000875796596876236664734207727391 : Rat) / 3177775551031564425806549830331296942005516938846661268754751868682570145) [(4, 1), (6, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((923429963551842515366118497986774856256857000875796596876236664734207727391 : Rat) / 3177775551031564425806549830331296942005516938846661268754751868682570145) [(5, 1), (7, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((-923429963551842515366118497986774856256857000875796596876236664734207727391 : Rat) / 6355551102063128851613099660662593884011033877693322537509503737365140290) [(6, 2), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((-923429963551842515366118497986774856256857000875796596876236664734207727391 : Rat) / 6355551102063128851613099660662593884011033877693322537509503737365140290) [(7, 2), (10, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 269 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0269_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0269
        rs_R009_ueqv_R009NYNYN_generator_14_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_14_0269 := by
  native_decide

/-- Coefficient term 270 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0270 : Poly :=
[
  term ((-294241217500957067036 : Rat) / 265668873346371325785) [(10, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 270 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0270 : Poly :=
[
  term ((-588482435001914134072 : Rat) / 265668873346371325785) [(4, 1), (6, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-588482435001914134072 : Rat) / 265668873346371325785) [(5, 1), (7, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((294241217500957067036 : Rat) / 265668873346371325785) [(6, 2), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((294241217500957067036 : Rat) / 265668873346371325785) [(7, 2), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 270 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0270_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0270
        rs_R009_ueqv_R009NYNYN_generator_14_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_14_0270 := by
  native_decide

/-- Coefficient term 271 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0271 : Poly :=
[
  term ((385775335707956129340541428785448596222201 : Rat) / 2374030498538876890092772090581947957130) [(10, 1), (12, 1), (13, 2)]
]

/-- Partial product 271 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0271 : Poly :=
[
  term ((385775335707956129340541428785448596222201 : Rat) / 1187015249269438445046386045290973978565) [(4, 1), (6, 1), (10, 1), (12, 1), (13, 2)],
  term ((385775335707956129340541428785448596222201 : Rat) / 1187015249269438445046386045290973978565) [(5, 1), (7, 1), (10, 1), (12, 1), (13, 2)],
  term ((-385775335707956129340541428785448596222201 : Rat) / 2374030498538876890092772090581947957130) [(6, 2), (10, 1), (12, 1), (13, 2)],
  term ((-385775335707956129340541428785448596222201 : Rat) / 2374030498538876890092772090581947957130) [(7, 2), (10, 1), (12, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 271 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0271_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0271
        rs_R009_ueqv_R009NYNYN_generator_14_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_14_0271 := by
  native_decide

/-- Coefficient term 272 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0272 : Poly :=
[
  term ((31851223530259513904488 : Rat) / 13017774793972194963465) [(10, 1), (12, 1), (13, 2), (16, 1)]
]

/-- Partial product 272 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0272 : Poly :=
[
  term ((63702447060519027808976 : Rat) / 13017774793972194963465) [(4, 1), (6, 1), (10, 1), (12, 1), (13, 2), (16, 1)],
  term ((63702447060519027808976 : Rat) / 13017774793972194963465) [(5, 1), (7, 1), (10, 1), (12, 1), (13, 2), (16, 1)],
  term ((-31851223530259513904488 : Rat) / 13017774793972194963465) [(6, 2), (10, 1), (12, 1), (13, 2), (16, 1)],
  term ((-31851223530259513904488 : Rat) / 13017774793972194963465) [(7, 2), (10, 1), (12, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 272 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0272_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0272
        rs_R009_ueqv_R009NYNYN_generator_14_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_14_0272 := by
  native_decide

/-- Coefficient term 273 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0273 : Poly :=
[
  term ((-6522761037647867856524889904397029447463093679903955068482920937011 : Rat) / 57584923989117473300342204510731528750770752812796693702478257544) [(10, 1), (12, 1), (15, 2)]
]

/-- Partial product 273 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0273 : Poly :=
[
  term ((-6522761037647867856524889904397029447463093679903955068482920937011 : Rat) / 28792461994558736650171102255365764375385376406398346851239128772) [(4, 1), (6, 1), (10, 1), (12, 1), (15, 2)],
  term ((-6522761037647867856524889904397029447463093679903955068482920937011 : Rat) / 28792461994558736650171102255365764375385376406398346851239128772) [(5, 1), (7, 1), (10, 1), (12, 1), (15, 2)],
  term ((6522761037647867856524889904397029447463093679903955068482920937011 : Rat) / 57584923989117473300342204510731528750770752812796693702478257544) [(6, 2), (10, 1), (12, 1), (15, 2)],
  term ((6522761037647867856524889904397029447463093679903955068482920937011 : Rat) / 57584923989117473300342204510731528750770752812796693702478257544) [(7, 2), (10, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 273 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0273_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0273
        rs_R009_ueqv_R009NYNYN_generator_14_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_14_0273 := by
  native_decide

/-- Coefficient term 274 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0274 : Poly :=
[
  term ((-425212877599884 : Rat) / 7342292683791569) [(10, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 274 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0274 : Poly :=
[
  term ((-850425755199768 : Rat) / 7342292683791569) [(4, 1), (6, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-850425755199768 : Rat) / 7342292683791569) [(5, 1), (7, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((425212877599884 : Rat) / 7342292683791569) [(6, 2), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((425212877599884 : Rat) / 7342292683791569) [(7, 2), (10, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 274 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0274_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0274
        rs_R009_ueqv_R009NYNYN_generator_14_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_14_0274 := by
  native_decide

/-- Coefficient term 275 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0275 : Poly :=
[
  term ((-180357882398208471038 : Rat) / 32049107564750198685) [(10, 1), (12, 1), (16, 1)]
]

/-- Partial product 275 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0275 : Poly :=
[
  term ((-360715764796416942076 : Rat) / 32049107564750198685) [(4, 1), (6, 1), (10, 1), (12, 1), (16, 1)],
  term ((-360715764796416942076 : Rat) / 32049107564750198685) [(5, 1), (7, 1), (10, 1), (12, 1), (16, 1)],
  term ((180357882398208471038 : Rat) / 32049107564750198685) [(6, 2), (10, 1), (12, 1), (16, 1)],
  term ((180357882398208471038 : Rat) / 32049107564750198685) [(7, 2), (10, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 275 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0275_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0275
        rs_R009_ueqv_R009NYNYN_generator_14_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_14_0275 := by
  native_decide

/-- Coefficient term 276 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0276 : Poly :=
[
  term ((-1895605129596112038525694821442261445252221276249510495656791466932091512737 : Rat) / 12711102204126257703226199321325187768022067755386645075019007474730280580) [(10, 1), (13, 1), (15, 1)]
]

/-- Partial product 276 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0276 : Poly :=
[
  term ((-1895605129596112038525694821442261445252221276249510495656791466932091512737 : Rat) / 6355551102063128851613099660662593884011033877693322537509503737365140290) [(4, 1), (6, 1), (10, 1), (13, 1), (15, 1)],
  term ((-1895605129596112038525694821442261445252221276249510495656791466932091512737 : Rat) / 6355551102063128851613099660662593884011033877693322537509503737365140290) [(5, 1), (7, 1), (10, 1), (13, 1), (15, 1)],
  term ((1895605129596112038525694821442261445252221276249510495656791466932091512737 : Rat) / 12711102204126257703226199321325187768022067755386645075019007474730280580) [(6, 2), (10, 1), (13, 1), (15, 1)],
  term ((1895605129596112038525694821442261445252221276249510495656791466932091512737 : Rat) / 12711102204126257703226199321325187768022067755386645075019007474730280580) [(7, 2), (10, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 276 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0276_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0276
        rs_R009_ueqv_R009NYNYN_generator_14_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_14_0276 := by
  native_decide

/-- Coefficient term 277 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0277 : Poly :=
[
  term ((17177503892073718576769 : Rat) / 13017774793972194963465) [(10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 277 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0277 : Poly :=
[
  term ((34355007784147437153538 : Rat) / 13017774793972194963465) [(4, 1), (6, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((34355007784147437153538 : Rat) / 13017774793972194963465) [(5, 1), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-17177503892073718576769 : Rat) / 13017774793972194963465) [(6, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-17177503892073718576769 : Rat) / 13017774793972194963465) [(7, 2), (10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 277 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0277_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0277
        rs_R009_ueqv_R009NYNYN_generator_14_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_14_0277 := by
  native_decide

/-- Coefficient term 278 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0278 : Poly :=
[
  term ((-2911628817469711776229191732775766877255769 : Rat) / 9496121994155507560371088362327791828520) [(10, 1), (13, 2)]
]

/-- Partial product 278 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0278 : Poly :=
[
  term ((-2911628817469711776229191732775766877255769 : Rat) / 4748060997077753780185544181163895914260) [(4, 1), (6, 1), (10, 1), (13, 2)],
  term ((-2911628817469711776229191732775766877255769 : Rat) / 4748060997077753780185544181163895914260) [(5, 1), (7, 1), (10, 1), (13, 2)],
  term ((2911628817469711776229191732775766877255769 : Rat) / 9496121994155507560371088362327791828520) [(6, 2), (10, 1), (13, 2)],
  term ((2911628817469711776229191732775766877255769 : Rat) / 9496121994155507560371088362327791828520) [(7, 2), (10, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 278 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0278_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0278
        rs_R009_ueqv_R009NYNYN_generator_14_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_14_0278 := by
  native_decide

/-- Coefficient term 279 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0279 : Poly :=
[
  term ((-60099060073515959208218 : Rat) / 13017774793972194963465) [(10, 1), (13, 2), (16, 1)]
]

/-- Partial product 279 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0279 : Poly :=
[
  term ((-120198120147031918416436 : Rat) / 13017774793972194963465) [(4, 1), (6, 1), (10, 1), (13, 2), (16, 1)],
  term ((-120198120147031918416436 : Rat) / 13017774793972194963465) [(5, 1), (7, 1), (10, 1), (13, 2), (16, 1)],
  term ((60099060073515959208218 : Rat) / 13017774793972194963465) [(6, 2), (10, 1), (13, 2), (16, 1)],
  term ((60099060073515959208218 : Rat) / 13017774793972194963465) [(7, 2), (10, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 279 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0279_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0279
        rs_R009_ueqv_R009NYNYN_generator_14_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_14_0279 := by
  native_decide

/-- Coefficient term 280 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0280 : Poly :=
[
  term ((235984616619960021981450898650721039762448176190449642345445786857 : Rat) / 25593299550718877022374313115880679444787001250131863867768114464) [(10, 1), (15, 2)]
]

/-- Partial product 280 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0280 : Poly :=
[
  term ((235984616619960021981450898650721039762448176190449642345445786857 : Rat) / 12796649775359438511187156557940339722393500625065931933884057232) [(4, 1), (6, 1), (10, 1), (15, 2)],
  term ((235984616619960021981450898650721039762448176190449642345445786857 : Rat) / 12796649775359438511187156557940339722393500625065931933884057232) [(5, 1), (7, 1), (10, 1), (15, 2)],
  term ((-235984616619960021981450898650721039762448176190449642345445786857 : Rat) / 25593299550718877022374313115880679444787001250131863867768114464) [(6, 2), (10, 1), (15, 2)],
  term ((-235984616619960021981450898650721039762448176190449642345445786857 : Rat) / 25593299550718877022374313115880679444787001250131863867768114464) [(7, 2), (10, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 280 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0280_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0280
        rs_R009_ueqv_R009NYNYN_generator_14_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_14_0280 := by
  native_decide

/-- Coefficient term 281 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0281 : Poly :=
[
  term ((-642853742273919 : Rat) / 7342292683791569) [(10, 1), (15, 2), (16, 1)]
]

/-- Partial product 281 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0281 : Poly :=
[
  term ((-1285707484547838 : Rat) / 7342292683791569) [(4, 1), (6, 1), (10, 1), (15, 2), (16, 1)],
  term ((-1285707484547838 : Rat) / 7342292683791569) [(5, 1), (7, 1), (10, 1), (15, 2), (16, 1)],
  term ((642853742273919 : Rat) / 7342292683791569) [(6, 2), (10, 1), (15, 2), (16, 1)],
  term ((642853742273919 : Rat) / 7342292683791569) [(7, 2), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 281 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0281_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0281
        rs_R009_ueqv_R009NYNYN_generator_14_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_14_0281 := by
  native_decide

/-- Coefficient term 282 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0282 : Poly :=
[
  term ((6640659926867398322 : Rat) / 3561011951638910965) [(10, 1), (16, 1)]
]

/-- Partial product 282 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0282 : Poly :=
[
  term ((13281319853734796644 : Rat) / 3561011951638910965) [(4, 1), (6, 1), (10, 1), (16, 1)],
  term ((13281319853734796644 : Rat) / 3561011951638910965) [(5, 1), (7, 1), (10, 1), (16, 1)],
  term ((-6640659926867398322 : Rat) / 3561011951638910965) [(6, 2), (10, 1), (16, 1)],
  term ((-6640659926867398322 : Rat) / 3561011951638910965) [(7, 2), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 282 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0282_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0282
        rs_R009_ueqv_R009NYNYN_generator_14_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_14_0282 := by
  native_decide

/-- Coefficient term 283 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0283 : Poly :=
[
  term ((-598200004808862375621286823176063415334469512912881517954807237388 : Rat) / 396893130880556201317589859618614961101288754385408622006530125) [(11, 1), (12, 1), (13, 1)]
]

/-- Partial product 283 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0283 : Poly :=
[
  term ((-1196400009617724751242573646352126830668939025825763035909614474776 : Rat) / 396893130880556201317589859618614961101288754385408622006530125) [(4, 1), (6, 1), (11, 1), (12, 1), (13, 1)],
  term ((-1196400009617724751242573646352126830668939025825763035909614474776 : Rat) / 396893130880556201317589859618614961101288754385408622006530125) [(5, 1), (7, 1), (11, 1), (12, 1), (13, 1)],
  term ((598200004808862375621286823176063415334469512912881517954807237388 : Rat) / 396893130880556201317589859618614961101288754385408622006530125) [(6, 2), (11, 1), (12, 1), (13, 1)],
  term ((598200004808862375621286823176063415334469512912881517954807237388 : Rat) / 396893130880556201317589859618614961101288754385408622006530125) [(7, 2), (11, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 283 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0283_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0283
        rs_R009_ueqv_R009NYNYN_generator_14_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_14_0283 := by
  native_decide

/-- Coefficient term 284 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0284 : Poly :=
[
  term ((-100817297075197117213928 : Rat) / 4339258264657398321155) [(11, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 284 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0284 : Poly :=
[
  term ((-201634594150394234427856 : Rat) / 4339258264657398321155) [(4, 1), (6, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-201634594150394234427856 : Rat) / 4339258264657398321155) [(5, 1), (7, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((100817297075197117213928 : Rat) / 4339258264657398321155) [(6, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((100817297075197117213928 : Rat) / 4339258264657398321155) [(7, 2), (11, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 284 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0284_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0284
        rs_R009_ueqv_R009NYNYN_generator_14_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_14_0284 := by
  native_decide

/-- Coefficient term 285 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0285 : Poly :=
[
  term ((729256040589563709493550253279629225254643559817559019566892384828066810551 : Rat) / 1176953907789468305854277714937517385927969236609874543983241432845396350) [(11, 1), (12, 1), (15, 1)]
]

/-- Partial product 285 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0285 : Poly :=
[
  term ((729256040589563709493550253279629225254643559817559019566892384828066810551 : Rat) / 588476953894734152927138857468758692963984618304937271991620716422698175) [(4, 1), (6, 1), (11, 1), (12, 1), (15, 1)],
  term ((729256040589563709493550253279629225254643559817559019566892384828066810551 : Rat) / 588476953894734152927138857468758692963984618304937271991620716422698175) [(5, 1), (7, 1), (11, 1), (12, 1), (15, 1)],
  term ((-729256040589563709493550253279629225254643559817559019566892384828066810551 : Rat) / 1176953907789468305854277714937517385927969236609874543983241432845396350) [(6, 2), (11, 1), (12, 1), (15, 1)],
  term ((-729256040589563709493550253279629225254643559817559019566892384828066810551 : Rat) / 1176953907789468305854277714937517385927969236609874543983241432845396350) [(7, 2), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 285 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0285_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0285
        rs_R009_ueqv_R009NYNYN_generator_14_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_14_0285 := by
  native_decide

/-- Coefficient term 286 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0286 : Poly :=
[
  term ((7672300823653152858324 : Rat) / 867851652931479664231) [(11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 286 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0286 : Poly :=
[
  term ((15344601647306305716648 : Rat) / 867851652931479664231) [(4, 1), (6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((15344601647306305716648 : Rat) / 867851652931479664231) [(5, 1), (7, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-7672300823653152858324 : Rat) / 867851652931479664231) [(6, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-7672300823653152858324 : Rat) / 867851652931479664231) [(7, 2), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 286 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0286_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0286
        rs_R009_ueqv_R009NYNYN_generator_14_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_14_0286 := by
  native_decide

/-- Coefficient term 287 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0287 : Poly :=
[
  term ((15396894348391503629797045076231355536991891776585236269495954347762190995309790409 : Rat) / 5918289186241185586622118404009007424791074746908021946928849880234418638048000) [(11, 1), (13, 1)]
]

/-- Partial product 287 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0287 : Poly :=
[
  term ((15396894348391503629797045076231355536991891776585236269495954347762190995309790409 : Rat) / 2959144593120592793311059202004503712395537373454010973464424940117209319024000) [(4, 1), (6, 1), (11, 1), (13, 1)],
  term ((15396894348391503629797045076231355536991891776585236269495954347762190995309790409 : Rat) / 2959144593120592793311059202004503712395537373454010973464424940117209319024000) [(5, 1), (7, 1), (11, 1), (13, 1)],
  term ((-15396894348391503629797045076231355536991891776585236269495954347762190995309790409 : Rat) / 5918289186241185586622118404009007424791074746908021946928849880234418638048000) [(6, 2), (11, 1), (13, 1)],
  term ((-15396894348391503629797045076231355536991891776585236269495954347762190995309790409 : Rat) / 5918289186241185586622118404009007424791074746908021946928849880234418638048000) [(7, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 287 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0287_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0287
        rs_R009_ueqv_R009NYNYN_generator_14_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_14_0287 := by
  native_decide

/-- Coefficient term 288 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0288 : Poly :=
[
  term ((311983928259755751459627059 : Rat) / 7576344930091817468736630) [(11, 1), (13, 1), (16, 1)]
]

/-- Partial product 288 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0288 : Poly :=
[
  term ((311983928259755751459627059 : Rat) / 3788172465045908734368315) [(4, 1), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((311983928259755751459627059 : Rat) / 3788172465045908734368315) [(5, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((-311983928259755751459627059 : Rat) / 7576344930091817468736630) [(6, 2), (11, 1), (13, 1), (16, 1)],
  term ((-311983928259755751459627059 : Rat) / 7576344930091817468736630) [(7, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 288 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0288_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0288
        rs_R009_ueqv_R009NYNYN_generator_14_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_14_0288 := by
  native_decide

/-- Coefficient term 289 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0289 : Poly :=
[
  term ((-6580203510109664462116261068054844212244843121820430981702962611121277030999257067 : Rat) / 11836578372482371173244236808018014849582149493816043893857699760468837276096000) [(11, 1), (15, 1)]
]

/-- Partial product 289 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0289 : Poly :=
[
  term ((-6580203510109664462116261068054844212244843121820430981702962611121277030999257067 : Rat) / 5918289186241185586622118404009007424791074746908021946928849880234418638048000) [(4, 1), (6, 1), (11, 1), (15, 1)],
  term ((-6580203510109664462116261068054844212244843121820430981702962611121277030999257067 : Rat) / 5918289186241185586622118404009007424791074746908021946928849880234418638048000) [(5, 1), (7, 1), (11, 1), (15, 1)],
  term ((6580203510109664462116261068054844212244843121820430981702962611121277030999257067 : Rat) / 11836578372482371173244236808018014849582149493816043893857699760468837276096000) [(6, 2), (11, 1), (15, 1)],
  term ((6580203510109664462116261068054844212244843121820430981702962611121277030999257067 : Rat) / 11836578372482371173244236808018014849582149493816043893857699760468837276096000) [(7, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 289 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0289_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0289
        rs_R009_ueqv_R009NYNYN_generator_14_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_14_0289 := by
  native_decide

/-- Coefficient term 290 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0290 : Poly :=
[
  term ((-10641970077735154473528757 : Rat) / 1082334990013116781248090) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 290 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0290 : Poly :=
[
  term ((-10641970077735154473528757 : Rat) / 541167495006558390624045) [(4, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-10641970077735154473528757 : Rat) / 541167495006558390624045) [(5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((10641970077735154473528757 : Rat) / 1082334990013116781248090) [(6, 2), (11, 1), (15, 1), (16, 1)],
  term ((10641970077735154473528757 : Rat) / 1082334990013116781248090) [(7, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 290 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0290_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0290
        rs_R009_ueqv_R009NYNYN_generator_14_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_14_0290 := by
  native_decide

/-- Coefficient term 291 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0291 : Poly :=
[
  term ((89206492550836625184816186814095036498288640156029615420540672323 : Rat) / 1234778629406174848543612896591246545648453902532382379575871500) [(11, 2)]
]

/-- Partial product 291 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0291 : Poly :=
[
  term ((89206492550836625184816186814095036498288640156029615420540672323 : Rat) / 617389314703087424271806448295623272824226951266191189787935750) [(4, 1), (6, 1), (11, 2)],
  term ((89206492550836625184816186814095036498288640156029615420540672323 : Rat) / 617389314703087424271806448295623272824226951266191189787935750) [(5, 1), (7, 1), (11, 2)],
  term ((-89206492550836625184816186814095036498288640156029615420540672323 : Rat) / 1234778629406174848543612896591246545648453902532382379575871500) [(6, 2), (11, 2)],
  term ((-89206492550836625184816186814095036498288640156029615420540672323 : Rat) / 1234778629406174848543612896591246545648453902532382379575871500) [(7, 2), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 291 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0291_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0291
        rs_R009_ueqv_R009NYNYN_generator_14_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_14_0291 := by
  native_decide

/-- Coefficient term 292 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0292 : Poly :=
[
  term ((-1907546431823286301332854651704376028216419922581209642395737804 : Rat) / 20579643823436247475726881609854109094140898375539706326264525) [(11, 2), (12, 1)]
]

/-- Partial product 292 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0292 : Poly :=
[
  term ((-3815092863646572602665709303408752056432839845162419284791475608 : Rat) / 20579643823436247475726881609854109094140898375539706326264525) [(4, 1), (6, 1), (11, 2), (12, 1)],
  term ((-3815092863646572602665709303408752056432839845162419284791475608 : Rat) / 20579643823436247475726881609854109094140898375539706326264525) [(5, 1), (7, 1), (11, 2), (12, 1)],
  term ((1907546431823286301332854651704376028216419922581209642395737804 : Rat) / 20579643823436247475726881609854109094140898375539706326264525) [(6, 2), (11, 2), (12, 1)],
  term ((1907546431823286301332854651704376028216419922581209642395737804 : Rat) / 20579643823436247475726881609854109094140898375539706326264525) [(7, 2), (11, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 292 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0292_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0292
        rs_R009_ueqv_R009NYNYN_generator_14_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_14_0292 := by
  native_decide

/-- Coefficient term 293 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0293 : Poly :=
[
  term ((236801443996489053408 : Rat) / 123978807561639952033) [(11, 2), (12, 1), (16, 1)]
]

/-- Partial product 293 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0293 : Poly :=
[
  term ((473602887992978106816 : Rat) / 123978807561639952033) [(4, 1), (6, 1), (11, 2), (12, 1), (16, 1)],
  term ((473602887992978106816 : Rat) / 123978807561639952033) [(5, 1), (7, 1), (11, 2), (12, 1), (16, 1)],
  term ((-236801443996489053408 : Rat) / 123978807561639952033) [(6, 2), (11, 2), (12, 1), (16, 1)],
  term ((-236801443996489053408 : Rat) / 123978807561639952033) [(7, 2), (11, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 293 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0293_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0293
        rs_R009_ueqv_R009NYNYN_generator_14_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_14_0293 := by
  native_decide

/-- Coefficient term 294 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0294 : Poly :=
[
  term ((-332018839050788665058 : Rat) / 619894037808199760165) [(11, 2), (16, 1)]
]

/-- Partial product 294 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0294 : Poly :=
[
  term ((-664037678101577330116 : Rat) / 619894037808199760165) [(4, 1), (6, 1), (11, 2), (16, 1)],
  term ((-664037678101577330116 : Rat) / 619894037808199760165) [(5, 1), (7, 1), (11, 2), (16, 1)],
  term ((332018839050788665058 : Rat) / 619894037808199760165) [(6, 2), (11, 2), (16, 1)],
  term ((332018839050788665058 : Rat) / 619894037808199760165) [(7, 2), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 294 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0294_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0294
        rs_R009_ueqv_R009NYNYN_generator_14_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_14_0294 := by
  native_decide

/-- Coefficient term 295 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0295 : Poly :=
[
  term ((-292888862170297680991699078971329934174727431199500672389086484361991354377656399 : Rat) / 261167999690640563962647480903484654926947316642883970889608888191124524032000) [(12, 1)]
]

/-- Partial product 295 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0295 : Poly :=
[
  term ((-292888862170297680991699078971329934174727431199500672389086484361991354377656399 : Rat) / 130583999845320281981323740451742327463473658321441985444804444095562262016000) [(4, 1), (6, 1), (12, 1)],
  term ((-292888862170297680991699078971329934174727431199500672389086484361991354377656399 : Rat) / 130583999845320281981323740451742327463473658321441985444804444095562262016000) [(5, 1), (7, 1), (12, 1)],
  term ((292888862170297680991699078971329934174727431199500672389086484361991354377656399 : Rat) / 261167999690640563962647480903484654926947316642883970889608888191124524032000) [(6, 2), (12, 1)],
  term ((292888862170297680991699078971329934174727431199500672389086484361991354377656399 : Rat) / 261167999690640563962647480903484654926947316642883970889608888191124524032000) [(7, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 295 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0295_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0295
        rs_R009_ueqv_R009NYNYN_generator_14_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_14_0295 := by
  native_decide

/-- Coefficient term 296 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0296 : Poly :=
[
  term ((-4463852145420803622749772805035124915378261035102117072296689209101482781731 : Rat) / 3389627254433668720860319819020050071472551401436438686671735326594741488) [(12, 1), (13, 1), (15, 1)]
]

/-- Partial product 296 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0296 : Poly :=
[
  term ((-4463852145420803622749772805035124915378261035102117072296689209101482781731 : Rat) / 1694813627216834360430159909510025035736275700718219343335867663297370744) [(4, 1), (6, 1), (12, 1), (13, 1), (15, 1)],
  term ((-4463852145420803622749772805035124915378261035102117072296689209101482781731 : Rat) / 1694813627216834360430159909510025035736275700718219343335867663297370744) [(5, 1), (7, 1), (12, 1), (13, 1), (15, 1)],
  term ((4463852145420803622749772805035124915378261035102117072296689209101482781731 : Rat) / 3389627254433668720860319819020050071472551401436438686671735326594741488) [(6, 2), (12, 1), (13, 1), (15, 1)],
  term ((4463852145420803622749772805035124915378261035102117072296689209101482781731 : Rat) / 3389627254433668720860319819020050071472551401436438686671735326594741488) [(7, 2), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 296 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0296_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0296
        rs_R009_ueqv_R009NYNYN_generator_14_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_14_0296 := by
  native_decide

/-- Coefficient term 297 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0297 : Poly :=
[
  term ((-1697620777324149364377 : Rat) / 123978807561639952033) [(12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 297 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0297 : Poly :=
[
  term ((-3395241554648298728754 : Rat) / 123978807561639952033) [(4, 1), (6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3395241554648298728754 : Rat) / 123978807561639952033) [(5, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1697620777324149364377 : Rat) / 123978807561639952033) [(6, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1697620777324149364377 : Rat) / 123978807561639952033) [(7, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 297 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0297_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0297
        rs_R009_ueqv_R009NYNYN_generator_14_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_14_0297 := by
  native_decide

/-- Coefficient term 298 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0298 : Poly :=
[
  term ((268915831987638908128696572149047438646508089054720179592127311111 : Rat) / 222260153293111472737850321386424378216721702455828828323656870) [(12, 1), (13, 2)]
]

/-- Partial product 298 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0298 : Poly :=
[
  term ((268915831987638908128696572149047438646508089054720179592127311111 : Rat) / 111130076646555736368925160693212189108360851227914414161828435) [(4, 1), (6, 1), (12, 1), (13, 2)],
  term ((268915831987638908128696572149047438646508089054720179592127311111 : Rat) / 111130076646555736368925160693212189108360851227914414161828435) [(5, 1), (7, 1), (12, 1), (13, 2)],
  term ((-268915831987638908128696572149047438646508089054720179592127311111 : Rat) / 222260153293111472737850321386424378216721702455828828323656870) [(6, 2), (12, 1), (13, 2)],
  term ((-268915831987638908128696572149047438646508089054720179592127311111 : Rat) / 222260153293111472737850321386424378216721702455828828323656870) [(7, 2), (12, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 298 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0298_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0298
        rs_R009_ueqv_R009NYNYN_generator_14_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_14_0298 := by
  native_decide

/-- Coefficient term 299 from coefficient polynomial 14. -/
def rs_R009_ueqv_R009NYNYN_coefficient_14_0299 : Poly :=
[
  term ((79223735924044553810744 : Rat) / 4339258264657398321155) [(12, 1), (13, 2), (16, 1)]
]

/-- Partial product 299 for generator 14. -/
def rs_R009_ueqv_R009NYNYN_partial_14_0299 : Poly :=
[
  term ((158447471848089107621488 : Rat) / 4339258264657398321155) [(4, 1), (6, 1), (12, 1), (13, 2), (16, 1)],
  term ((158447471848089107621488 : Rat) / 4339258264657398321155) [(5, 1), (7, 1), (12, 1), (13, 2), (16, 1)],
  term ((-79223735924044553810744 : Rat) / 4339258264657398321155) [(6, 2), (12, 1), (13, 2), (16, 1)],
  term ((-79223735924044553810744 : Rat) / 4339258264657398321155) [(7, 2), (12, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 299 for generator 14. -/
theorem rs_R009_ueqv_R009NYNYN_partial_14_0299_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_14_0299
        rs_R009_ueqv_R009NYNYN_generator_14_0200_0299 =
      rs_R009_ueqv_R009NYNYN_partial_14_0299 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NYNYN_partials_14_0200_0299 : List Poly :=
[
  rs_R009_ueqv_R009NYNYN_partial_14_0200,
  rs_R009_ueqv_R009NYNYN_partial_14_0201,
  rs_R009_ueqv_R009NYNYN_partial_14_0202,
  rs_R009_ueqv_R009NYNYN_partial_14_0203,
  rs_R009_ueqv_R009NYNYN_partial_14_0204,
  rs_R009_ueqv_R009NYNYN_partial_14_0205,
  rs_R009_ueqv_R009NYNYN_partial_14_0206,
  rs_R009_ueqv_R009NYNYN_partial_14_0207,
  rs_R009_ueqv_R009NYNYN_partial_14_0208,
  rs_R009_ueqv_R009NYNYN_partial_14_0209,
  rs_R009_ueqv_R009NYNYN_partial_14_0210,
  rs_R009_ueqv_R009NYNYN_partial_14_0211,
  rs_R009_ueqv_R009NYNYN_partial_14_0212,
  rs_R009_ueqv_R009NYNYN_partial_14_0213,
  rs_R009_ueqv_R009NYNYN_partial_14_0214,
  rs_R009_ueqv_R009NYNYN_partial_14_0215,
  rs_R009_ueqv_R009NYNYN_partial_14_0216,
  rs_R009_ueqv_R009NYNYN_partial_14_0217,
  rs_R009_ueqv_R009NYNYN_partial_14_0218,
  rs_R009_ueqv_R009NYNYN_partial_14_0219,
  rs_R009_ueqv_R009NYNYN_partial_14_0220,
  rs_R009_ueqv_R009NYNYN_partial_14_0221,
  rs_R009_ueqv_R009NYNYN_partial_14_0222,
  rs_R009_ueqv_R009NYNYN_partial_14_0223,
  rs_R009_ueqv_R009NYNYN_partial_14_0224,
  rs_R009_ueqv_R009NYNYN_partial_14_0225,
  rs_R009_ueqv_R009NYNYN_partial_14_0226,
  rs_R009_ueqv_R009NYNYN_partial_14_0227,
  rs_R009_ueqv_R009NYNYN_partial_14_0228,
  rs_R009_ueqv_R009NYNYN_partial_14_0229,
  rs_R009_ueqv_R009NYNYN_partial_14_0230,
  rs_R009_ueqv_R009NYNYN_partial_14_0231,
  rs_R009_ueqv_R009NYNYN_partial_14_0232,
  rs_R009_ueqv_R009NYNYN_partial_14_0233,
  rs_R009_ueqv_R009NYNYN_partial_14_0234,
  rs_R009_ueqv_R009NYNYN_partial_14_0235,
  rs_R009_ueqv_R009NYNYN_partial_14_0236,
  rs_R009_ueqv_R009NYNYN_partial_14_0237,
  rs_R009_ueqv_R009NYNYN_partial_14_0238,
  rs_R009_ueqv_R009NYNYN_partial_14_0239,
  rs_R009_ueqv_R009NYNYN_partial_14_0240,
  rs_R009_ueqv_R009NYNYN_partial_14_0241,
  rs_R009_ueqv_R009NYNYN_partial_14_0242,
  rs_R009_ueqv_R009NYNYN_partial_14_0243,
  rs_R009_ueqv_R009NYNYN_partial_14_0244,
  rs_R009_ueqv_R009NYNYN_partial_14_0245,
  rs_R009_ueqv_R009NYNYN_partial_14_0246,
  rs_R009_ueqv_R009NYNYN_partial_14_0247,
  rs_R009_ueqv_R009NYNYN_partial_14_0248,
  rs_R009_ueqv_R009NYNYN_partial_14_0249,
  rs_R009_ueqv_R009NYNYN_partial_14_0250,
  rs_R009_ueqv_R009NYNYN_partial_14_0251,
  rs_R009_ueqv_R009NYNYN_partial_14_0252,
  rs_R009_ueqv_R009NYNYN_partial_14_0253,
  rs_R009_ueqv_R009NYNYN_partial_14_0254,
  rs_R009_ueqv_R009NYNYN_partial_14_0255,
  rs_R009_ueqv_R009NYNYN_partial_14_0256,
  rs_R009_ueqv_R009NYNYN_partial_14_0257,
  rs_R009_ueqv_R009NYNYN_partial_14_0258,
  rs_R009_ueqv_R009NYNYN_partial_14_0259,
  rs_R009_ueqv_R009NYNYN_partial_14_0260,
  rs_R009_ueqv_R009NYNYN_partial_14_0261,
  rs_R009_ueqv_R009NYNYN_partial_14_0262,
  rs_R009_ueqv_R009NYNYN_partial_14_0263,
  rs_R009_ueqv_R009NYNYN_partial_14_0264,
  rs_R009_ueqv_R009NYNYN_partial_14_0265,
  rs_R009_ueqv_R009NYNYN_partial_14_0266,
  rs_R009_ueqv_R009NYNYN_partial_14_0267,
  rs_R009_ueqv_R009NYNYN_partial_14_0268,
  rs_R009_ueqv_R009NYNYN_partial_14_0269,
  rs_R009_ueqv_R009NYNYN_partial_14_0270,
  rs_R009_ueqv_R009NYNYN_partial_14_0271,
  rs_R009_ueqv_R009NYNYN_partial_14_0272,
  rs_R009_ueqv_R009NYNYN_partial_14_0273,
  rs_R009_ueqv_R009NYNYN_partial_14_0274,
  rs_R009_ueqv_R009NYNYN_partial_14_0275,
  rs_R009_ueqv_R009NYNYN_partial_14_0276,
  rs_R009_ueqv_R009NYNYN_partial_14_0277,
  rs_R009_ueqv_R009NYNYN_partial_14_0278,
  rs_R009_ueqv_R009NYNYN_partial_14_0279,
  rs_R009_ueqv_R009NYNYN_partial_14_0280,
  rs_R009_ueqv_R009NYNYN_partial_14_0281,
  rs_R009_ueqv_R009NYNYN_partial_14_0282,
  rs_R009_ueqv_R009NYNYN_partial_14_0283,
  rs_R009_ueqv_R009NYNYN_partial_14_0284,
  rs_R009_ueqv_R009NYNYN_partial_14_0285,
  rs_R009_ueqv_R009NYNYN_partial_14_0286,
  rs_R009_ueqv_R009NYNYN_partial_14_0287,
  rs_R009_ueqv_R009NYNYN_partial_14_0288,
  rs_R009_ueqv_R009NYNYN_partial_14_0289,
  rs_R009_ueqv_R009NYNYN_partial_14_0290,
  rs_R009_ueqv_R009NYNYN_partial_14_0291,
  rs_R009_ueqv_R009NYNYN_partial_14_0292,
  rs_R009_ueqv_R009NYNYN_partial_14_0293,
  rs_R009_ueqv_R009NYNYN_partial_14_0294,
  rs_R009_ueqv_R009NYNYN_partial_14_0295,
  rs_R009_ueqv_R009NYNYN_partial_14_0296,
  rs_R009_ueqv_R009NYNYN_partial_14_0297,
  rs_R009_ueqv_R009NYNYN_partial_14_0298,
  rs_R009_ueqv_R009NYNYN_partial_14_0299
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NYNYN_block_14_0200_0299 : Poly :=
[
  term ((-6298299106979896 : Rat) / 3146696864482101) [(4, 1), (6, 1), (7, 1), (8, 1), (15, 1)],
  term ((-25193196427919584 : Rat) / 3146696864482101) [(4, 1), (6, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((12596598213959792 : Rat) / 3146696864482101) [(4, 1), (6, 1), (7, 1), (8, 2), (15, 1), (16, 1)],
  term ((6298299106979896 : Rat) / 1048898954827367) [(4, 1), (6, 1), (7, 1), (9, 1)],
  term ((-12596598213959792 : Rat) / 3146696864482101) [(4, 1), (6, 1), (7, 1), (15, 1)],
  term ((25569837390091601182999339401177806029551201919155052135341825386339222462070049 : Rat) / 8161499990332517623832733778233895466467103645090124090300277755972641376000) [(4, 1), (6, 1), (7, 2)],
  term ((6298299106979896 : Rat) / 1048898954827367) [(4, 1), (6, 1), (7, 2), (8, 1)],
  term ((2126542509396333451636 : Rat) / 32049107564750198685) [(4, 1), (6, 1), (7, 2), (16, 1)],
  term ((-4923148146660715477585926797324420512468877042440283661957961476992307662702081 : Rat) / 725466665807334899896243002509679597019298101785788808026691356086457011200) [(4, 1), (6, 1), (8, 1)],
  term ((145278151340587786739123651173532601518873 : Rat) / 13189058325215982722737622725455266428500) [(4, 1), (6, 1), (8, 1), (9, 1), (11, 1)],
  term ((-370746227782818088092 : Rat) / 4339258264657398321155) [(4, 1), (6, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((352683508445203406137727288943253672795148 : Rat) / 9891793743911987042053217044091449821375) [(4, 1), (6, 1), (8, 1), (9, 1), (13, 1)],
  term ((-1200052718647521464256 : Rat) / 4339258264657398321155) [(4, 1), (6, 1), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((-176341754222601703068863644471626836397574 : Rat) / 9891793743911987042053217044091449821375) [(4, 1), (6, 1), (8, 1), (9, 1), (15, 1)],
  term ((53911765008185453107664 : Rat) / 13017774793972194963465) [(4, 1), (6, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((38808893185601192050314252117375235182917621862400 : Rat) / 4063562337142509348624007334568541033400269394457) [(4, 1), (6, 1), (8, 1), (10, 1)],
  term ((8932095311065397632557927744667245019630513 : Rat) / 39567174975647948168212868176365799285500) [(4, 1), (6, 1), (8, 1), (11, 1), (13, 1)],
  term ((938580776874159925924 : Rat) / 867851652931479664231) [(4, 1), (6, 1), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((-1250170643358871697578796790989985352407695667020255431793609621783698774781 : Rat) / 23539078155789366117085554298750347718559384732197490879664828656907927000) [(4, 1), (6, 1), (8, 1), (11, 1), (15, 1)],
  term ((-333677854758022999628 : Rat) / 619894037808199760165) [(4, 1), (6, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-2558371584706482400535289703473924502978036632370655857284089506 : Rat) / 102898219117181237378634408049270545470704491877698531631322625) [(4, 1), (6, 1), (8, 1), (11, 2)],
  term ((280224325033297748112 : Rat) / 619894037808199760165) [(4, 1), (6, 1), (8, 1), (11, 2), (16, 1)],
  term ((-665726243658694139119516632846039818889152017747993773855678576008910787 : Rat) / 1570988707578111068474960766808394518731964600174109800070734963622250) [(4, 1), (6, 1), (8, 1), (12, 1)],
  term ((10344408132743391584 : Rat) / 10683035854916732895) [(4, 1), (6, 1), (8, 1), (12, 1), (16, 1)],
  term ((-6132328188482687618640670166351135303477236617350559566600670822300034 : Rat) / 1237933599934384271837378196467197873784774810614203844470102013510935) [(4, 1), (6, 1), (8, 1), (13, 1), (15, 1)],
  term ((8042391521042253719584 : Rat) / 13017774793972194963465) [(4, 1), (6, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-97407758479902159098477610283386783668468 : Rat) / 1187015249269438445046386045290973978565) [(4, 1), (6, 1), (8, 1), (13, 2)],
  term ((-16084783042084507439168 : Rat) / 13017774793972194963465) [(4, 1), (6, 1), (8, 1), (13, 2), (16, 1)],
  term ((-957813496515079304909304723333867087125084100310472499200 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(4, 1), (6, 1), (8, 1), (15, 2)],
  term ((-107867865275482579117 : Rat) / 712202390327782193) [(4, 1), (6, 1), (8, 1), (16, 1)],
  term ((-77617786371202384100628504234750470365835243724800 : Rat) / 4063562337142509348624007334568541033400269394457) [(4, 1), (6, 1), (8, 2)],
  term ((-18108656837663412065618022703333892628618966558548965275130867118 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(4, 1), (6, 1), (9, 1), (10, 1), (11, 1)],
  term ((-78198317749398456784 : Rat) / 88556291115457108595) [(4, 1), (6, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-1396773737455217810168898726178554750800711 : Rat) / 9891793743911987042053217044091449821375) [(4, 1), (6, 1), (9, 1), (10, 1), (12, 1), (13, 1)],
  term ((4752709102725243481392 : Rat) / 4339258264657398321155) [(4, 1), (6, 1), (9, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((1396773737455217810168898726178554750800711 : Rat) / 19783587487823974084106434088182899642750) [(4, 1), (6, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((-2376354551362621740696 : Rat) / 4339258264657398321155) [(4, 1), (6, 1), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((9376185267000648960850828862774639123683163 : Rat) / 29675381231735961126159651132274349464125) [(4, 1), (6, 1), (9, 1), (10, 1), (13, 1)],
  term ((-17196291343377603553912 : Rat) / 13017774793972194963465) [(4, 1), (6, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-7926656721459394053556654870707033423082162565108391928966708404983305969 : Rat) / 2161752075531676480140510088660746219051372067242626713438606713389503500) [(4, 1), (6, 1), (9, 1), (10, 1), (15, 1)],
  term ((479712901095233582286 : Rat) / 4339258264657398321155) [(4, 1), (6, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-32833809011363210958547928968441139124964315670811560125911054657919 : Rat) / 44452030658622294547570064277284875643344340491165765664731374000) [(4, 1), (6, 1), (9, 1), (11, 1)],
  term ((70851384689716574503106702327839157370151427338273764929044838099 : Rat) / 926083972054631136407709672443434909236340426899286784681903625) [(4, 1), (6, 1), (9, 1), (11, 1), (12, 1)],
  term ((-1825249407962953509424 : Rat) / 4339258264657398321155) [(4, 1), (6, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-23452789857724826688073 : Rat) / 4339258264657398321155) [(4, 1), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((-63538774169698814346408849637367445274067849 : Rat) / 59350762463471922252319302264548698928250) [(4, 1), (6, 1), (9, 1), (12, 1), (13, 1)],
  term ((20616026577740100055576 : Rat) / 2603554958794438992693) [(4, 1), (6, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((120179829634567301843388550922161977126711471104778074193604655915144332559 : Rat) / 288233610070890197352068011821432829206849608965683561791814228451933800) [(4, 1), (6, 1), (9, 1), (12, 1), (15, 1)],
  term ((-2669809995817882218130 : Rat) / 2603554958794438992693) [(4, 1), (6, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((1399855697661371049412760037343517301828689255904660835366418148226872723877376039 : Rat) / 1479572296560296396655529601002251856197768686727005486732212470058604659512000) [(4, 1), (6, 1), (9, 1), (13, 1)],
  term ((-21504069983370457353150253 : Rat) / 3788172465045908734368315) [(4, 1), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((-2284349240033664744839110490001324240224091790050988564977198868408362510378323447893 : Rat) / 643120758238208833746270199902312140160630122497338384899601686985473492001216000) [(4, 1), (6, 1), (9, 1), (15, 1)],
  term ((-32474969383899984165774292 : Rat) / 420908051671767637152035) [(4, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-569062548470329302402412412084751698587687 : Rat) / 4164965786910310333496091386985873609000) [(4, 1), (6, 1), (9, 2)],
  term ((-121622279285282230149082111765259194192583 : Rat) / 5652453567949706881173266882337971326500) [(4, 1), (6, 1), (9, 2), (10, 1)],
  term ((103459010280805261644 : Rat) / 619894037808199760165) [(4, 1), (6, 1), (9, 2), (10, 1), (16, 1)],
  term ((145278151340587786739123651173532601518873 : Rat) / 19783587487823974084106434088182899642750) [(4, 1), (6, 1), (9, 2), (12, 1)],
  term ((-247164151855212058728 : Rat) / 4339258264657398321155) [(4, 1), (6, 1), (9, 2), (12, 1), (16, 1)],
  term ((2097476888928989160634 : Rat) / 685146041788010261235) [(4, 1), (6, 1), (9, 2), (16, 1)],
  term ((2731440526610231817785808802648150164958458947500129069956530764413263742419 : Rat) / 11126789352873234660985322124381588911338927941499828343967658835681856000) [(4, 1), (6, 1), (10, 1)],
  term ((17225181280391709921586707115838427194792 : Rat) / 157012599109714080032590746731610314625) [(4, 1), (6, 1), (10, 1), (11, 1), (12, 1), (13, 1)],
  term ((-3592281190170247726912 : Rat) / 619894037808199760165) [(4, 1), (6, 1), (10, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-8612590640195854960793353557919213597396 : Rat) / 157012599109714080032590746731610314625) [(4, 1), (6, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((1796140595085123863456 : Rat) / 619894037808199760165) [(4, 1), (6, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-508776495610420601669007186879549300970534 : Rat) / 1099088193767998560228135227121272202375) [(4, 1), (6, 1), (10, 1), (11, 1), (13, 1)],
  term ((6778161060089238548432 : Rat) / 619894037808199760165) [(4, 1), (6, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((20158181568752419619071967836108826507140386416608751229270112229 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(4, 1), (6, 1), (10, 1), (11, 1), (15, 1)],
  term ((-531746418471882036536 : Rat) / 619894037808199760165) [(4, 1), (6, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-15343261876519929640746959278573080381737811215405627852314837894966510239809 : Rat) / 25035276043964777987216974779858575050512587868374613773927232380284176000) [(4, 1), (6, 1), (10, 1), (12, 1)],
  term ((923429963551842515366118497986774856256857000875796596876236664734207727391 : Rat) / 3177775551031564425806549830331296942005516938846661268754751868682570145) [(4, 1), (6, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((-588482435001914134072 : Rat) / 265668873346371325785) [(4, 1), (6, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((385775335707956129340541428785448596222201 : Rat) / 1187015249269438445046386045290973978565) [(4, 1), (6, 1), (10, 1), (12, 1), (13, 2)],
  term ((63702447060519027808976 : Rat) / 13017774793972194963465) [(4, 1), (6, 1), (10, 1), (12, 1), (13, 2), (16, 1)],
  term ((-6522761037647867856524889904397029447463093679903955068482920937011 : Rat) / 28792461994558736650171102255365764375385376406398346851239128772) [(4, 1), (6, 1), (10, 1), (12, 1), (15, 2)],
  term ((-850425755199768 : Rat) / 7342292683791569) [(4, 1), (6, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-360715764796416942076 : Rat) / 32049107564750198685) [(4, 1), (6, 1), (10, 1), (12, 1), (16, 1)],
  term ((-1895605129596112038525694821442261445252221276249510495656791466932091512737 : Rat) / 6355551102063128851613099660662593884011033877693322537509503737365140290) [(4, 1), (6, 1), (10, 1), (13, 1), (15, 1)],
  term ((34355007784147437153538 : Rat) / 13017774793972194963465) [(4, 1), (6, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2911628817469711776229191732775766877255769 : Rat) / 4748060997077753780185544181163895914260) [(4, 1), (6, 1), (10, 1), (13, 2)],
  term ((-120198120147031918416436 : Rat) / 13017774793972194963465) [(4, 1), (6, 1), (10, 1), (13, 2), (16, 1)],
  term ((235984616619960021981450898650721039762448176190449642345445786857 : Rat) / 12796649775359438511187156557940339722393500625065931933884057232) [(4, 1), (6, 1), (10, 1), (15, 2)],
  term ((-1285707484547838 : Rat) / 7342292683791569) [(4, 1), (6, 1), (10, 1), (15, 2), (16, 1)],
  term ((13281319853734796644 : Rat) / 3561011951638910965) [(4, 1), (6, 1), (10, 1), (16, 1)],
  term ((-1196400009617724751242573646352126830668939025825763035909614474776 : Rat) / 396893130880556201317589859618614961101288754385408622006530125) [(4, 1), (6, 1), (11, 1), (12, 1), (13, 1)],
  term ((-201634594150394234427856 : Rat) / 4339258264657398321155) [(4, 1), (6, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((729256040589563709493550253279629225254643559817559019566892384828066810551 : Rat) / 588476953894734152927138857468758692963984618304937271991620716422698175) [(4, 1), (6, 1), (11, 1), (12, 1), (15, 1)],
  term ((15344601647306305716648 : Rat) / 867851652931479664231) [(4, 1), (6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((15396894348391503629797045076231355536991891776585236269495954347762190995309790409 : Rat) / 2959144593120592793311059202004503712395537373454010973464424940117209319024000) [(4, 1), (6, 1), (11, 1), (13, 1)],
  term ((311983928259755751459627059 : Rat) / 3788172465045908734368315) [(4, 1), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((-6580203510109664462116261068054844212244843121820430981702962611121277030999257067 : Rat) / 5918289186241185586622118404009007424791074746908021946928849880234418638048000) [(4, 1), (6, 1), (11, 1), (15, 1)],
  term ((-10641970077735154473528757 : Rat) / 541167495006558390624045) [(4, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((89206492550836625184816186814095036498288640156029615420540672323 : Rat) / 617389314703087424271806448295623272824226951266191189787935750) [(4, 1), (6, 1), (11, 2)],
  term ((-3815092863646572602665709303408752056432839845162419284791475608 : Rat) / 20579643823436247475726881609854109094140898375539706326264525) [(4, 1), (6, 1), (11, 2), (12, 1)],
  term ((473602887992978106816 : Rat) / 123978807561639952033) [(4, 1), (6, 1), (11, 2), (12, 1), (16, 1)],
  term ((-664037678101577330116 : Rat) / 619894037808199760165) [(4, 1), (6, 1), (11, 2), (16, 1)],
  term ((-292888862170297680991699078971329934174727431199500672389086484361991354377656399 : Rat) / 130583999845320281981323740451742327463473658321441985444804444095562262016000) [(4, 1), (6, 1), (12, 1)],
  term ((-4463852145420803622749772805035124915378261035102117072296689209101482781731 : Rat) / 1694813627216834360430159909510025035736275700718219343335867663297370744) [(4, 1), (6, 1), (12, 1), (13, 1), (15, 1)],
  term ((-3395241554648298728754 : Rat) / 123978807561639952033) [(4, 1), (6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((268915831987638908128696572149047438646508089054720179592127311111 : Rat) / 111130076646555736368925160693212189108360851227914414161828435) [(4, 1), (6, 1), (12, 1), (13, 2)],
  term ((158447471848089107621488 : Rat) / 4339258264657398321155) [(4, 1), (6, 1), (12, 1), (13, 2), (16, 1)],
  term ((-4923148146660715477585926797324420512468877042440283661957961476992307662702081 : Rat) / 725466665807334899896243002509679597019298101785788808026691356086457011200) [(5, 1), (7, 1), (8, 1)],
  term ((145278151340587786739123651173532601518873 : Rat) / 13189058325215982722737622725455266428500) [(5, 1), (7, 1), (8, 1), (9, 1), (11, 1)],
  term ((-370746227782818088092 : Rat) / 4339258264657398321155) [(5, 1), (7, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((352683508445203406137727288943253672795148 : Rat) / 9891793743911987042053217044091449821375) [(5, 1), (7, 1), (8, 1), (9, 1), (13, 1)],
  term ((-1200052718647521464256 : Rat) / 4339258264657398321155) [(5, 1), (7, 1), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((-176341754222601703068863644471626836397574 : Rat) / 9891793743911987042053217044091449821375) [(5, 1), (7, 1), (8, 1), (9, 1), (15, 1)],
  term ((53911765008185453107664 : Rat) / 13017774793972194963465) [(5, 1), (7, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((38808893185601192050314252117375235182917621862400 : Rat) / 4063562337142509348624007334568541033400269394457) [(5, 1), (7, 1), (8, 1), (10, 1)],
  term ((8932095311065397632557927744667245019630513 : Rat) / 39567174975647948168212868176365799285500) [(5, 1), (7, 1), (8, 1), (11, 1), (13, 1)],
  term ((938580776874159925924 : Rat) / 867851652931479664231) [(5, 1), (7, 1), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((-1250170643358871697578796790989985352407695667020255431793609621783698774781 : Rat) / 23539078155789366117085554298750347718559384732197490879664828656907927000) [(5, 1), (7, 1), (8, 1), (11, 1), (15, 1)],
  term ((-333677854758022999628 : Rat) / 619894037808199760165) [(5, 1), (7, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-2558371584706482400535289703473924502978036632370655857284089506 : Rat) / 102898219117181237378634408049270545470704491877698531631322625) [(5, 1), (7, 1), (8, 1), (11, 2)],
  term ((280224325033297748112 : Rat) / 619894037808199760165) [(5, 1), (7, 1), (8, 1), (11, 2), (16, 1)],
  term ((-665726243658694139119516632846039818889152017747993773855678576008910787 : Rat) / 1570988707578111068474960766808394518731964600174109800070734963622250) [(5, 1), (7, 1), (8, 1), (12, 1)],
  term ((10344408132743391584 : Rat) / 10683035854916732895) [(5, 1), (7, 1), (8, 1), (12, 1), (16, 1)],
  term ((-6132328188482687618640670166351135303477236617350559566600670822300034 : Rat) / 1237933599934384271837378196467197873784774810614203844470102013510935) [(5, 1), (7, 1), (8, 1), (13, 1), (15, 1)],
  term ((8042391521042253719584 : Rat) / 13017774793972194963465) [(5, 1), (7, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-97407758479902159098477610283386783668468 : Rat) / 1187015249269438445046386045290973978565) [(5, 1), (7, 1), (8, 1), (13, 2)],
  term ((-16084783042084507439168 : Rat) / 13017774793972194963465) [(5, 1), (7, 1), (8, 1), (13, 2), (16, 1)],
  term ((-957813496515079304909304723333867087125084100310472499200 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(5, 1), (7, 1), (8, 1), (15, 2)],
  term ((-107867865275482579117 : Rat) / 712202390327782193) [(5, 1), (7, 1), (8, 1), (16, 1)],
  term ((-77617786371202384100628504234750470365835243724800 : Rat) / 4063562337142509348624007334568541033400269394457) [(5, 1), (7, 1), (8, 2)],
  term ((-18108656837663412065618022703333892628618966558548965275130867118 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(5, 1), (7, 1), (9, 1), (10, 1), (11, 1)],
  term ((-78198317749398456784 : Rat) / 88556291115457108595) [(5, 1), (7, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-1396773737455217810168898726178554750800711 : Rat) / 9891793743911987042053217044091449821375) [(5, 1), (7, 1), (9, 1), (10, 1), (12, 1), (13, 1)],
  term ((4752709102725243481392 : Rat) / 4339258264657398321155) [(5, 1), (7, 1), (9, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((1396773737455217810168898726178554750800711 : Rat) / 19783587487823974084106434088182899642750) [(5, 1), (7, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((-2376354551362621740696 : Rat) / 4339258264657398321155) [(5, 1), (7, 1), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((9376185267000648960850828862774639123683163 : Rat) / 29675381231735961126159651132274349464125) [(5, 1), (7, 1), (9, 1), (10, 1), (13, 1)],
  term ((-17196291343377603553912 : Rat) / 13017774793972194963465) [(5, 1), (7, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-7926656721459394053556654870707033423082162565108391928966708404983305969 : Rat) / 2161752075531676480140510088660746219051372067242626713438606713389503500) [(5, 1), (7, 1), (9, 1), (10, 1), (15, 1)],
  term ((479712901095233582286 : Rat) / 4339258264657398321155) [(5, 1), (7, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-32833809011363210958547928968441139124964315670811560125911054657919 : Rat) / 44452030658622294547570064277284875643344340491165765664731374000) [(5, 1), (7, 1), (9, 1), (11, 1)],
  term ((70851384689716574503106702327839157370151427338273764929044838099 : Rat) / 926083972054631136407709672443434909236340426899286784681903625) [(5, 1), (7, 1), (9, 1), (11, 1), (12, 1)],
  term ((-1825249407962953509424 : Rat) / 4339258264657398321155) [(5, 1), (7, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-23452789857724826688073 : Rat) / 4339258264657398321155) [(5, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((-63538774169698814346408849637367445274067849 : Rat) / 59350762463471922252319302264548698928250) [(5, 1), (7, 1), (9, 1), (12, 1), (13, 1)],
  term ((20616026577740100055576 : Rat) / 2603554958794438992693) [(5, 1), (7, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((120179829634567301843388550922161977126711471104778074193604655915144332559 : Rat) / 288233610070890197352068011821432829206849608965683561791814228451933800) [(5, 1), (7, 1), (9, 1), (12, 1), (15, 1)],
  term ((-2669809995817882218130 : Rat) / 2603554958794438992693) [(5, 1), (7, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((1399855697661371049412760037343517301828689255904660835366418148226872723877376039 : Rat) / 1479572296560296396655529601002251856197768686727005486732212470058604659512000) [(5, 1), (7, 1), (9, 1), (13, 1)],
  term ((-21504069983370457353150253 : Rat) / 3788172465045908734368315) [(5, 1), (7, 1), (9, 1), (13, 1), (16, 1)],
  term ((-2284349240033664744839110490001324240224091790050988564977198868408362510378323447893 : Rat) / 643120758238208833746270199902312140160630122497338384899601686985473492001216000) [(5, 1), (7, 1), (9, 1), (15, 1)],
  term ((-32474969383899984165774292 : Rat) / 420908051671767637152035) [(5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-569062548470329302402412412084751698587687 : Rat) / 4164965786910310333496091386985873609000) [(5, 1), (7, 1), (9, 2)],
  term ((-121622279285282230149082111765259194192583 : Rat) / 5652453567949706881173266882337971326500) [(5, 1), (7, 1), (9, 2), (10, 1)],
  term ((103459010280805261644 : Rat) / 619894037808199760165) [(5, 1), (7, 1), (9, 2), (10, 1), (16, 1)],
  term ((145278151340587786739123651173532601518873 : Rat) / 19783587487823974084106434088182899642750) [(5, 1), (7, 1), (9, 2), (12, 1)],
  term ((-247164151855212058728 : Rat) / 4339258264657398321155) [(5, 1), (7, 1), (9, 2), (12, 1), (16, 1)],
  term ((2097476888928989160634 : Rat) / 685146041788010261235) [(5, 1), (7, 1), (9, 2), (16, 1)],
  term ((2731440526610231817785808802648150164958458947500129069956530764413263742419 : Rat) / 11126789352873234660985322124381588911338927941499828343967658835681856000) [(5, 1), (7, 1), (10, 1)],
  term ((17225181280391709921586707115838427194792 : Rat) / 157012599109714080032590746731610314625) [(5, 1), (7, 1), (10, 1), (11, 1), (12, 1), (13, 1)],
  term ((-3592281190170247726912 : Rat) / 619894037808199760165) [(5, 1), (7, 1), (10, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-8612590640195854960793353557919213597396 : Rat) / 157012599109714080032590746731610314625) [(5, 1), (7, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((1796140595085123863456 : Rat) / 619894037808199760165) [(5, 1), (7, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-508776495610420601669007186879549300970534 : Rat) / 1099088193767998560228135227121272202375) [(5, 1), (7, 1), (10, 1), (11, 1), (13, 1)],
  term ((6778161060089238548432 : Rat) / 619894037808199760165) [(5, 1), (7, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((20158181568752419619071967836108826507140386416608751229270112229 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(5, 1), (7, 1), (10, 1), (11, 1), (15, 1)],
  term ((-531746418471882036536 : Rat) / 619894037808199760165) [(5, 1), (7, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-15343261876519929640746959278573080381737811215405627852314837894966510239809 : Rat) / 25035276043964777987216974779858575050512587868374613773927232380284176000) [(5, 1), (7, 1), (10, 1), (12, 1)],
  term ((923429963551842515366118497986774856256857000875796596876236664734207727391 : Rat) / 3177775551031564425806549830331296942005516938846661268754751868682570145) [(5, 1), (7, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((-588482435001914134072 : Rat) / 265668873346371325785) [(5, 1), (7, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((385775335707956129340541428785448596222201 : Rat) / 1187015249269438445046386045290973978565) [(5, 1), (7, 1), (10, 1), (12, 1), (13, 2)],
  term ((63702447060519027808976 : Rat) / 13017774793972194963465) [(5, 1), (7, 1), (10, 1), (12, 1), (13, 2), (16, 1)],
  term ((-6522761037647867856524889904397029447463093679903955068482920937011 : Rat) / 28792461994558736650171102255365764375385376406398346851239128772) [(5, 1), (7, 1), (10, 1), (12, 1), (15, 2)],
  term ((-850425755199768 : Rat) / 7342292683791569) [(5, 1), (7, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-360715764796416942076 : Rat) / 32049107564750198685) [(5, 1), (7, 1), (10, 1), (12, 1), (16, 1)],
  term ((-1895605129596112038525694821442261445252221276249510495656791466932091512737 : Rat) / 6355551102063128851613099660662593884011033877693322537509503737365140290) [(5, 1), (7, 1), (10, 1), (13, 1), (15, 1)],
  term ((34355007784147437153538 : Rat) / 13017774793972194963465) [(5, 1), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2911628817469711776229191732775766877255769 : Rat) / 4748060997077753780185544181163895914260) [(5, 1), (7, 1), (10, 1), (13, 2)],
  term ((-120198120147031918416436 : Rat) / 13017774793972194963465) [(5, 1), (7, 1), (10, 1), (13, 2), (16, 1)],
  term ((235984616619960021981450898650721039762448176190449642345445786857 : Rat) / 12796649775359438511187156557940339722393500625065931933884057232) [(5, 1), (7, 1), (10, 1), (15, 2)],
  term ((-1285707484547838 : Rat) / 7342292683791569) [(5, 1), (7, 1), (10, 1), (15, 2), (16, 1)],
  term ((13281319853734796644 : Rat) / 3561011951638910965) [(5, 1), (7, 1), (10, 1), (16, 1)],
  term ((-1196400009617724751242573646352126830668939025825763035909614474776 : Rat) / 396893130880556201317589859618614961101288754385408622006530125) [(5, 1), (7, 1), (11, 1), (12, 1), (13, 1)],
  term ((-201634594150394234427856 : Rat) / 4339258264657398321155) [(5, 1), (7, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((729256040589563709493550253279629225254643559817559019566892384828066810551 : Rat) / 588476953894734152927138857468758692963984618304937271991620716422698175) [(5, 1), (7, 1), (11, 1), (12, 1), (15, 1)],
  term ((15344601647306305716648 : Rat) / 867851652931479664231) [(5, 1), (7, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((15396894348391503629797045076231355536991891776585236269495954347762190995309790409 : Rat) / 2959144593120592793311059202004503712395537373454010973464424940117209319024000) [(5, 1), (7, 1), (11, 1), (13, 1)],
  term ((311983928259755751459627059 : Rat) / 3788172465045908734368315) [(5, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((-6580203510109664462116261068054844212244843121820430981702962611121277030999257067 : Rat) / 5918289186241185586622118404009007424791074746908021946928849880234418638048000) [(5, 1), (7, 1), (11, 1), (15, 1)],
  term ((-10641970077735154473528757 : Rat) / 541167495006558390624045) [(5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((89206492550836625184816186814095036498288640156029615420540672323 : Rat) / 617389314703087424271806448295623272824226951266191189787935750) [(5, 1), (7, 1), (11, 2)],
  term ((-3815092863646572602665709303408752056432839845162419284791475608 : Rat) / 20579643823436247475726881609854109094140898375539706326264525) [(5, 1), (7, 1), (11, 2), (12, 1)],
  term ((473602887992978106816 : Rat) / 123978807561639952033) [(5, 1), (7, 1), (11, 2), (12, 1), (16, 1)],
  term ((-664037678101577330116 : Rat) / 619894037808199760165) [(5, 1), (7, 1), (11, 2), (16, 1)],
  term ((-292888862170297680991699078971329934174727431199500672389086484361991354377656399 : Rat) / 130583999845320281981323740451742327463473658321441985444804444095562262016000) [(5, 1), (7, 1), (12, 1)],
  term ((-4463852145420803622749772805035124915378261035102117072296689209101482781731 : Rat) / 1694813627216834360430159909510025035736275700718219343335867663297370744) [(5, 1), (7, 1), (12, 1), (13, 1), (15, 1)],
  term ((-3395241554648298728754 : Rat) / 123978807561639952033) [(5, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((268915831987638908128696572149047438646508089054720179592127311111 : Rat) / 111130076646555736368925160693212189108360851227914414161828435) [(5, 1), (7, 1), (12, 1), (13, 2)],
  term ((158447471848089107621488 : Rat) / 4339258264657398321155) [(5, 1), (7, 1), (12, 1), (13, 2), (16, 1)],
  term ((-6298299106979896 : Rat) / 3146696864482101) [(5, 1), (7, 2), (8, 1), (15, 1)],
  term ((-25193196427919584 : Rat) / 3146696864482101) [(5, 1), (7, 2), (8, 1), (15, 1), (16, 1)],
  term ((12596598213959792 : Rat) / 3146696864482101) [(5, 1), (7, 2), (8, 2), (15, 1), (16, 1)],
  term ((6298299106979896 : Rat) / 1048898954827367) [(5, 1), (7, 2), (9, 1)],
  term ((-12596598213959792 : Rat) / 3146696864482101) [(5, 1), (7, 2), (15, 1)],
  term ((25569837390091601182999339401177806029551201919155052135341825386339222462070049 : Rat) / 8161499990332517623832733778233895466467103645090124090300277755972641376000) [(5, 1), (7, 3)],
  term ((6298299106979896 : Rat) / 1048898954827367) [(5, 1), (7, 3), (8, 1)],
  term ((2126542509396333451636 : Rat) / 32049107564750198685) [(5, 1), (7, 3), (16, 1)],
  term ((3149149553489948 : Rat) / 3146696864482101) [(6, 2), (7, 1), (8, 1), (15, 1)],
  term ((12596598213959792 : Rat) / 3146696864482101) [(6, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-6298299106979896 : Rat) / 3146696864482101) [(6, 2), (7, 1), (8, 2), (15, 1), (16, 1)],
  term ((-3149149553489948 : Rat) / 1048898954827367) [(6, 2), (7, 1), (9, 1)],
  term ((6298299106979896 : Rat) / 3146696864482101) [(6, 2), (7, 1), (15, 1)],
  term ((-25569837390091601182999339401177806029551201919155052135341825386339222462070049 : Rat) / 16322999980665035247665467556467790932934207290180248180600555511945282752000) [(6, 2), (7, 2)],
  term ((-3149149553489948 : Rat) / 1048898954827367) [(6, 2), (7, 2), (8, 1)],
  term ((-1063271254698166725818 : Rat) / 32049107564750198685) [(6, 2), (7, 2), (16, 1)],
  term ((4923148146660715477585926797324420512468877042440283661957961476992307662702081 : Rat) / 1450933331614669799792486005019359194038596203571577616053382712172914022400) [(6, 2), (8, 1)],
  term ((-145278151340587786739123651173532601518873 : Rat) / 26378116650431965445475245450910532857000) [(6, 2), (8, 1), (9, 1), (11, 1)],
  term ((185373113891409044046 : Rat) / 4339258264657398321155) [(6, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-176341754222601703068863644471626836397574 : Rat) / 9891793743911987042053217044091449821375) [(6, 2), (8, 1), (9, 1), (13, 1)],
  term ((600026359323760732128 : Rat) / 4339258264657398321155) [(6, 2), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((88170877111300851534431822235813418198787 : Rat) / 9891793743911987042053217044091449821375) [(6, 2), (8, 1), (9, 1), (15, 1)],
  term ((-26955882504092726553832 : Rat) / 13017774793972194963465) [(6, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-19404446592800596025157126058687617591458810931200 : Rat) / 4063562337142509348624007334568541033400269394457) [(6, 2), (8, 1), (10, 1)],
  term ((-8932095311065397632557927744667245019630513 : Rat) / 79134349951295896336425736352731598571000) [(6, 2), (8, 1), (11, 1), (13, 1)],
  term ((-469290388437079962962 : Rat) / 867851652931479664231) [(6, 2), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((1250170643358871697578796790989985352407695667020255431793609621783698774781 : Rat) / 47078156311578732234171108597500695437118769464394981759329657313815854000) [(6, 2), (8, 1), (11, 1), (15, 1)],
  term ((166838927379011499814 : Rat) / 619894037808199760165) [(6, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((1279185792353241200267644851736962251489018316185327928642044753 : Rat) / 102898219117181237378634408049270545470704491877698531631322625) [(6, 2), (8, 1), (11, 2)],
  term ((-140112162516648874056 : Rat) / 619894037808199760165) [(6, 2), (8, 1), (11, 2), (16, 1)],
  term ((665726243658694139119516632846039818889152017747993773855678576008910787 : Rat) / 3141977415156222136949921533616789037463929200348219600141469927244500) [(6, 2), (8, 1), (12, 1)],
  term ((-5172204066371695792 : Rat) / 10683035854916732895) [(6, 2), (8, 1), (12, 1), (16, 1)],
  term ((3066164094241343809320335083175567651738618308675279783300335411150017 : Rat) / 1237933599934384271837378196467197873784774810614203844470102013510935) [(6, 2), (8, 1), (13, 1), (15, 1)],
  term ((-4021195760521126859792 : Rat) / 13017774793972194963465) [(6, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((48703879239951079549238805141693391834234 : Rat) / 1187015249269438445046386045290973978565) [(6, 2), (8, 1), (13, 2)],
  term ((8042391521042253719584 : Rat) / 13017774793972194963465) [(6, 2), (8, 1), (13, 2), (16, 1)],
  term ((478906748257539652454652361666933543562542050155236249600 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(6, 2), (8, 1), (15, 2)],
  term ((107867865275482579117 : Rat) / 1424404780655564386) [(6, 2), (8, 1), (16, 1)],
  term ((38808893185601192050314252117375235182917621862400 : Rat) / 4063562337142509348624007334568541033400269394457) [(6, 2), (8, 2)],
  term ((9054328418831706032809011351666946314309483279274482637565433559 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(6, 2), (9, 1), (10, 1), (11, 1)],
  term ((39099158874699228392 : Rat) / 88556291115457108595) [(6, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((1396773737455217810168898726178554750800711 : Rat) / 19783587487823974084106434088182899642750) [(6, 2), (9, 1), (10, 1), (12, 1), (13, 1)],
  term ((-2376354551362621740696 : Rat) / 4339258264657398321155) [(6, 2), (9, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-1396773737455217810168898726178554750800711 : Rat) / 39567174975647948168212868176365799285500) [(6, 2), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((1188177275681310870348 : Rat) / 4339258264657398321155) [(6, 2), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-9376185267000648960850828862774639123683163 : Rat) / 59350762463471922252319302264548698928250) [(6, 2), (9, 1), (10, 1), (13, 1)],
  term ((8598145671688801776956 : Rat) / 13017774793972194963465) [(6, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((7926656721459394053556654870707033423082162565108391928966708404983305969 : Rat) / 4323504151063352960281020177321492438102744134485253426877213426779007000) [(6, 2), (9, 1), (10, 1), (15, 1)],
  term ((-239856450547616791143 : Rat) / 4339258264657398321155) [(6, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((32833809011363210958547928968441139124964315670811560125911054657919 : Rat) / 88904061317244589095140128554569751286688680982331531329462748000) [(6, 2), (9, 1), (11, 1)],
  term ((-70851384689716574503106702327839157370151427338273764929044838099 : Rat) / 1852167944109262272815419344886869818472680853798573569363807250) [(6, 2), (9, 1), (11, 1), (12, 1)],
  term ((912624703981476754712 : Rat) / 4339258264657398321155) [(6, 2), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((23452789857724826688073 : Rat) / 8678516529314796642310) [(6, 2), (9, 1), (11, 1), (16, 1)],
  term ((63538774169698814346408849637367445274067849 : Rat) / 118701524926943844504638604529097397856500) [(6, 2), (9, 1), (12, 1), (13, 1)],
  term ((-10308013288870050027788 : Rat) / 2603554958794438992693) [(6, 2), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-120179829634567301843388550922161977126711471104778074193604655915144332559 : Rat) / 576467220141780394704136023642865658413699217931367123583628456903867600) [(6, 2), (9, 1), (12, 1), (15, 1)],
  term ((1334904997908941109065 : Rat) / 2603554958794438992693) [(6, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1399855697661371049412760037343517301828689255904660835366418148226872723877376039 : Rat) / 2959144593120592793311059202004503712395537373454010973464424940117209319024000) [(6, 2), (9, 1), (13, 1)],
  term ((21504069983370457353150253 : Rat) / 7576344930091817468736630) [(6, 2), (9, 1), (13, 1), (16, 1)],
  term ((2284349240033664744839110490001324240224091790050988564977198868408362510378323447893 : Rat) / 1286241516476417667492540399804624280321260244994676769799203373970946984002432000) [(6, 2), (9, 1), (15, 1)],
  term ((16237484691949992082887146 : Rat) / 420908051671767637152035) [(6, 2), (9, 1), (15, 1), (16, 1)],
  term ((569062548470329302402412412084751698587687 : Rat) / 8329931573820620666992182773971747218000) [(6, 2), (9, 2)],
  term ((121622279285282230149082111765259194192583 : Rat) / 11304907135899413762346533764675942653000) [(6, 2), (9, 2), (10, 1)],
  term ((-51729505140402630822 : Rat) / 619894037808199760165) [(6, 2), (9, 2), (10, 1), (16, 1)],
  term ((-145278151340587786739123651173532601518873 : Rat) / 39567174975647948168212868176365799285500) [(6, 2), (9, 2), (12, 1)],
  term ((123582075927606029364 : Rat) / 4339258264657398321155) [(6, 2), (9, 2), (12, 1), (16, 1)],
  term ((-1048738444464494580317 : Rat) / 685146041788010261235) [(6, 2), (9, 2), (16, 1)],
  term ((-2731440526610231817785808802648150164958458947500129069956530764413263742419 : Rat) / 22253578705746469321970644248763177822677855882999656687935317671363712000) [(6, 2), (10, 1)],
  term ((-8612590640195854960793353557919213597396 : Rat) / 157012599109714080032590746731610314625) [(6, 2), (10, 1), (11, 1), (12, 1), (13, 1)],
  term ((1796140595085123863456 : Rat) / 619894037808199760165) [(6, 2), (10, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((4306295320097927480396676778959606798698 : Rat) / 157012599109714080032590746731610314625) [(6, 2), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-898070297542561931728 : Rat) / 619894037808199760165) [(6, 2), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((254388247805210300834503593439774650485267 : Rat) / 1099088193767998560228135227121272202375) [(6, 2), (10, 1), (11, 1), (13, 1)],
  term ((-3389080530044619274216 : Rat) / 619894037808199760165) [(6, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-20158181568752419619071967836108826507140386416608751229270112229 : Rat) / 617389314703087424271806448295623272824226951266191189787935750) [(6, 2), (10, 1), (11, 1), (15, 1)],
  term ((265873209235941018268 : Rat) / 619894037808199760165) [(6, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((15343261876519929640746959278573080381737811215405627852314837894966510239809 : Rat) / 50070552087929555974433949559717150101025175736749227547854464760568352000) [(6, 2), (10, 1), (12, 1)],
  term ((-923429963551842515366118497986774856256857000875796596876236664734207727391 : Rat) / 6355551102063128851613099660662593884011033877693322537509503737365140290) [(6, 2), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((294241217500957067036 : Rat) / 265668873346371325785) [(6, 2), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-385775335707956129340541428785448596222201 : Rat) / 2374030498538876890092772090581947957130) [(6, 2), (10, 1), (12, 1), (13, 2)],
  term ((-31851223530259513904488 : Rat) / 13017774793972194963465) [(6, 2), (10, 1), (12, 1), (13, 2), (16, 1)],
  term ((6522761037647867856524889904397029447463093679903955068482920937011 : Rat) / 57584923989117473300342204510731528750770752812796693702478257544) [(6, 2), (10, 1), (12, 1), (15, 2)],
  term ((425212877599884 : Rat) / 7342292683791569) [(6, 2), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((180357882398208471038 : Rat) / 32049107564750198685) [(6, 2), (10, 1), (12, 1), (16, 1)],
  term ((1895605129596112038525694821442261445252221276249510495656791466932091512737 : Rat) / 12711102204126257703226199321325187768022067755386645075019007474730280580) [(6, 2), (10, 1), (13, 1), (15, 1)],
  term ((-17177503892073718576769 : Rat) / 13017774793972194963465) [(6, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((2911628817469711776229191732775766877255769 : Rat) / 9496121994155507560371088362327791828520) [(6, 2), (10, 1), (13, 2)],
  term ((60099060073515959208218 : Rat) / 13017774793972194963465) [(6, 2), (10, 1), (13, 2), (16, 1)],
  term ((-235984616619960021981450898650721039762448176190449642345445786857 : Rat) / 25593299550718877022374313115880679444787001250131863867768114464) [(6, 2), (10, 1), (15, 2)],
  term ((642853742273919 : Rat) / 7342292683791569) [(6, 2), (10, 1), (15, 2), (16, 1)],
  term ((-6640659926867398322 : Rat) / 3561011951638910965) [(6, 2), (10, 1), (16, 1)],
  term ((598200004808862375621286823176063415334469512912881517954807237388 : Rat) / 396893130880556201317589859618614961101288754385408622006530125) [(6, 2), (11, 1), (12, 1), (13, 1)],
  term ((100817297075197117213928 : Rat) / 4339258264657398321155) [(6, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-729256040589563709493550253279629225254643559817559019566892384828066810551 : Rat) / 1176953907789468305854277714937517385927969236609874543983241432845396350) [(6, 2), (11, 1), (12, 1), (15, 1)],
  term ((-7672300823653152858324 : Rat) / 867851652931479664231) [(6, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-15396894348391503629797045076231355536991891776585236269495954347762190995309790409 : Rat) / 5918289186241185586622118404009007424791074746908021946928849880234418638048000) [(6, 2), (11, 1), (13, 1)],
  term ((-311983928259755751459627059 : Rat) / 7576344930091817468736630) [(6, 2), (11, 1), (13, 1), (16, 1)],
  term ((6580203510109664462116261068054844212244843121820430981702962611121277030999257067 : Rat) / 11836578372482371173244236808018014849582149493816043893857699760468837276096000) [(6, 2), (11, 1), (15, 1)],
  term ((10641970077735154473528757 : Rat) / 1082334990013116781248090) [(6, 2), (11, 1), (15, 1), (16, 1)],
  term ((-89206492550836625184816186814095036498288640156029615420540672323 : Rat) / 1234778629406174848543612896591246545648453902532382379575871500) [(6, 2), (11, 2)],
  term ((1907546431823286301332854651704376028216419922581209642395737804 : Rat) / 20579643823436247475726881609854109094140898375539706326264525) [(6, 2), (11, 2), (12, 1)],
  term ((-236801443996489053408 : Rat) / 123978807561639952033) [(6, 2), (11, 2), (12, 1), (16, 1)],
  term ((332018839050788665058 : Rat) / 619894037808199760165) [(6, 2), (11, 2), (16, 1)],
  term ((292888862170297680991699078971329934174727431199500672389086484361991354377656399 : Rat) / 261167999690640563962647480903484654926947316642883970889608888191124524032000) [(6, 2), (12, 1)],
  term ((4463852145420803622749772805035124915378261035102117072296689209101482781731 : Rat) / 3389627254433668720860319819020050071472551401436438686671735326594741488) [(6, 2), (12, 1), (13, 1), (15, 1)],
  term ((1697620777324149364377 : Rat) / 123978807561639952033) [(6, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-268915831987638908128696572149047438646508089054720179592127311111 : Rat) / 222260153293111472737850321386424378216721702455828828323656870) [(6, 2), (12, 1), (13, 2)],
  term ((-79223735924044553810744 : Rat) / 4339258264657398321155) [(6, 2), (12, 1), (13, 2), (16, 1)],
  term ((4923148146660715477585926797324420512468877042440283661957961476992307662702081 : Rat) / 1450933331614669799792486005019359194038596203571577616053382712172914022400) [(7, 2), (8, 1)],
  term ((-145278151340587786739123651173532601518873 : Rat) / 26378116650431965445475245450910532857000) [(7, 2), (8, 1), (9, 1), (11, 1)],
  term ((185373113891409044046 : Rat) / 4339258264657398321155) [(7, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-176341754222601703068863644471626836397574 : Rat) / 9891793743911987042053217044091449821375) [(7, 2), (8, 1), (9, 1), (13, 1)],
  term ((600026359323760732128 : Rat) / 4339258264657398321155) [(7, 2), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((88170877111300851534431822235813418198787 : Rat) / 9891793743911987042053217044091449821375) [(7, 2), (8, 1), (9, 1), (15, 1)],
  term ((-26955882504092726553832 : Rat) / 13017774793972194963465) [(7, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-19404446592800596025157126058687617591458810931200 : Rat) / 4063562337142509348624007334568541033400269394457) [(7, 2), (8, 1), (10, 1)],
  term ((-8932095311065397632557927744667245019630513 : Rat) / 79134349951295896336425736352731598571000) [(7, 2), (8, 1), (11, 1), (13, 1)],
  term ((-469290388437079962962 : Rat) / 867851652931479664231) [(7, 2), (8, 1), (11, 1), (13, 1), (16, 1)],
  term ((1250170643358871697578796790989985352407695667020255431793609621783698774781 : Rat) / 47078156311578732234171108597500695437118769464394981759329657313815854000) [(7, 2), (8, 1), (11, 1), (15, 1)],
  term ((166838927379011499814 : Rat) / 619894037808199760165) [(7, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((1279185792353241200267644851736962251489018316185327928642044753 : Rat) / 102898219117181237378634408049270545470704491877698531631322625) [(7, 2), (8, 1), (11, 2)],
  term ((-140112162516648874056 : Rat) / 619894037808199760165) [(7, 2), (8, 1), (11, 2), (16, 1)],
  term ((665726243658694139119516632846039818889152017747993773855678576008910787 : Rat) / 3141977415156222136949921533616789037463929200348219600141469927244500) [(7, 2), (8, 1), (12, 1)],
  term ((-5172204066371695792 : Rat) / 10683035854916732895) [(7, 2), (8, 1), (12, 1), (16, 1)],
  term ((3066164094241343809320335083175567651738618308675279783300335411150017 : Rat) / 1237933599934384271837378196467197873784774810614203844470102013510935) [(7, 2), (8, 1), (13, 1), (15, 1)],
  term ((-4021195760521126859792 : Rat) / 13017774793972194963465) [(7, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((48703879239951079549238805141693391834234 : Rat) / 1187015249269438445046386045290973978565) [(7, 2), (8, 1), (13, 2)],
  term ((8042391521042253719584 : Rat) / 13017774793972194963465) [(7, 2), (8, 1), (13, 2), (16, 1)],
  term ((478906748257539652454652361666933543562542050155236249600 : Rat) / 45266056718161320031506478327433597410103334319823145957) [(7, 2), (8, 1), (15, 2)],
  term ((107867865275482579117 : Rat) / 1424404780655564386) [(7, 2), (8, 1), (16, 1)],
  term ((38808893185601192050314252117375235182917621862400 : Rat) / 4063562337142509348624007334568541033400269394457) [(7, 2), (8, 2)],
  term ((9054328418831706032809011351666946314309483279274482637565433559 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(7, 2), (9, 1), (10, 1), (11, 1)],
  term ((39099158874699228392 : Rat) / 88556291115457108595) [(7, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((1396773737455217810168898726178554750800711 : Rat) / 19783587487823974084106434088182899642750) [(7, 2), (9, 1), (10, 1), (12, 1), (13, 1)],
  term ((-2376354551362621740696 : Rat) / 4339258264657398321155) [(7, 2), (9, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-1396773737455217810168898726178554750800711 : Rat) / 39567174975647948168212868176365799285500) [(7, 2), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((1188177275681310870348 : Rat) / 4339258264657398321155) [(7, 2), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-9376185267000648960850828862774639123683163 : Rat) / 59350762463471922252319302264548698928250) [(7, 2), (9, 1), (10, 1), (13, 1)],
  term ((8598145671688801776956 : Rat) / 13017774793972194963465) [(7, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((7926656721459394053556654870707033423082162565108391928966708404983305969 : Rat) / 4323504151063352960281020177321492438102744134485253426877213426779007000) [(7, 2), (9, 1), (10, 1), (15, 1)],
  term ((-239856450547616791143 : Rat) / 4339258264657398321155) [(7, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((32833809011363210958547928968441139124964315670811560125911054657919 : Rat) / 88904061317244589095140128554569751286688680982331531329462748000) [(7, 2), (9, 1), (11, 1)],
  term ((-70851384689716574503106702327839157370151427338273764929044838099 : Rat) / 1852167944109262272815419344886869818472680853798573569363807250) [(7, 2), (9, 1), (11, 1), (12, 1)],
  term ((912624703981476754712 : Rat) / 4339258264657398321155) [(7, 2), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((23452789857724826688073 : Rat) / 8678516529314796642310) [(7, 2), (9, 1), (11, 1), (16, 1)],
  term ((63538774169698814346408849637367445274067849 : Rat) / 118701524926943844504638604529097397856500) [(7, 2), (9, 1), (12, 1), (13, 1)],
  term ((-10308013288870050027788 : Rat) / 2603554958794438992693) [(7, 2), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-120179829634567301843388550922161977126711471104778074193604655915144332559 : Rat) / 576467220141780394704136023642865658413699217931367123583628456903867600) [(7, 2), (9, 1), (12, 1), (15, 1)],
  term ((1334904997908941109065 : Rat) / 2603554958794438992693) [(7, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1399855697661371049412760037343517301828689255904660835366418148226872723877376039 : Rat) / 2959144593120592793311059202004503712395537373454010973464424940117209319024000) [(7, 2), (9, 1), (13, 1)],
  term ((21504069983370457353150253 : Rat) / 7576344930091817468736630) [(7, 2), (9, 1), (13, 1), (16, 1)],
  term ((2284349240033664744839110490001324240224091790050988564977198868408362510378323447893 : Rat) / 1286241516476417667492540399804624280321260244994676769799203373970946984002432000) [(7, 2), (9, 1), (15, 1)],
  term ((16237484691949992082887146 : Rat) / 420908051671767637152035) [(7, 2), (9, 1), (15, 1), (16, 1)],
  term ((569062548470329302402412412084751698587687 : Rat) / 8329931573820620666992182773971747218000) [(7, 2), (9, 2)],
  term ((121622279285282230149082111765259194192583 : Rat) / 11304907135899413762346533764675942653000) [(7, 2), (9, 2), (10, 1)],
  term ((-51729505140402630822 : Rat) / 619894037808199760165) [(7, 2), (9, 2), (10, 1), (16, 1)],
  term ((-145278151340587786739123651173532601518873 : Rat) / 39567174975647948168212868176365799285500) [(7, 2), (9, 2), (12, 1)],
  term ((123582075927606029364 : Rat) / 4339258264657398321155) [(7, 2), (9, 2), (12, 1), (16, 1)],
  term ((-1048738444464494580317 : Rat) / 685146041788010261235) [(7, 2), (9, 2), (16, 1)],
  term ((-2731440526610231817785808802648150164958458947500129069956530764413263742419 : Rat) / 22253578705746469321970644248763177822677855882999656687935317671363712000) [(7, 2), (10, 1)],
  term ((-8612590640195854960793353557919213597396 : Rat) / 157012599109714080032590746731610314625) [(7, 2), (10, 1), (11, 1), (12, 1), (13, 1)],
  term ((1796140595085123863456 : Rat) / 619894037808199760165) [(7, 2), (10, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((4306295320097927480396676778959606798698 : Rat) / 157012599109714080032590746731610314625) [(7, 2), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-898070297542561931728 : Rat) / 619894037808199760165) [(7, 2), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((254388247805210300834503593439774650485267 : Rat) / 1099088193767998560228135227121272202375) [(7, 2), (10, 1), (11, 1), (13, 1)],
  term ((-3389080530044619274216 : Rat) / 619894037808199760165) [(7, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-20158181568752419619071967836108826507140386416608751229270112229 : Rat) / 617389314703087424271806448295623272824226951266191189787935750) [(7, 2), (10, 1), (11, 1), (15, 1)],
  term ((265873209235941018268 : Rat) / 619894037808199760165) [(7, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((15343261876519929640746959278573080381737811215405627852314837894966510239809 : Rat) / 50070552087929555974433949559717150101025175736749227547854464760568352000) [(7, 2), (10, 1), (12, 1)],
  term ((-923429963551842515366118497986774856256857000875796596876236664734207727391 : Rat) / 6355551102063128851613099660662593884011033877693322537509503737365140290) [(7, 2), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((294241217500957067036 : Rat) / 265668873346371325785) [(7, 2), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-385775335707956129340541428785448596222201 : Rat) / 2374030498538876890092772090581947957130) [(7, 2), (10, 1), (12, 1), (13, 2)],
  term ((-31851223530259513904488 : Rat) / 13017774793972194963465) [(7, 2), (10, 1), (12, 1), (13, 2), (16, 1)],
  term ((6522761037647867856524889904397029447463093679903955068482920937011 : Rat) / 57584923989117473300342204510731528750770752812796693702478257544) [(7, 2), (10, 1), (12, 1), (15, 2)],
  term ((425212877599884 : Rat) / 7342292683791569) [(7, 2), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((180357882398208471038 : Rat) / 32049107564750198685) [(7, 2), (10, 1), (12, 1), (16, 1)],
  term ((1895605129596112038525694821442261445252221276249510495656791466932091512737 : Rat) / 12711102204126257703226199321325187768022067755386645075019007474730280580) [(7, 2), (10, 1), (13, 1), (15, 1)],
  term ((-17177503892073718576769 : Rat) / 13017774793972194963465) [(7, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((2911628817469711776229191732775766877255769 : Rat) / 9496121994155507560371088362327791828520) [(7, 2), (10, 1), (13, 2)],
  term ((60099060073515959208218 : Rat) / 13017774793972194963465) [(7, 2), (10, 1), (13, 2), (16, 1)],
  term ((-235984616619960021981450898650721039762448176190449642345445786857 : Rat) / 25593299550718877022374313115880679444787001250131863867768114464) [(7, 2), (10, 1), (15, 2)],
  term ((642853742273919 : Rat) / 7342292683791569) [(7, 2), (10, 1), (15, 2), (16, 1)],
  term ((-6640659926867398322 : Rat) / 3561011951638910965) [(7, 2), (10, 1), (16, 1)],
  term ((598200004808862375621286823176063415334469512912881517954807237388 : Rat) / 396893130880556201317589859618614961101288754385408622006530125) [(7, 2), (11, 1), (12, 1), (13, 1)],
  term ((100817297075197117213928 : Rat) / 4339258264657398321155) [(7, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-729256040589563709493550253279629225254643559817559019566892384828066810551 : Rat) / 1176953907789468305854277714937517385927969236609874543983241432845396350) [(7, 2), (11, 1), (12, 1), (15, 1)],
  term ((-7672300823653152858324 : Rat) / 867851652931479664231) [(7, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-15396894348391503629797045076231355536991891776585236269495954347762190995309790409 : Rat) / 5918289186241185586622118404009007424791074746908021946928849880234418638048000) [(7, 2), (11, 1), (13, 1)],
  term ((-311983928259755751459627059 : Rat) / 7576344930091817468736630) [(7, 2), (11, 1), (13, 1), (16, 1)],
  term ((6580203510109664462116261068054844212244843121820430981702962611121277030999257067 : Rat) / 11836578372482371173244236808018014849582149493816043893857699760468837276096000) [(7, 2), (11, 1), (15, 1)],
  term ((10641970077735154473528757 : Rat) / 1082334990013116781248090) [(7, 2), (11, 1), (15, 1), (16, 1)],
  term ((-89206492550836625184816186814095036498288640156029615420540672323 : Rat) / 1234778629406174848543612896591246545648453902532382379575871500) [(7, 2), (11, 2)],
  term ((1907546431823286301332854651704376028216419922581209642395737804 : Rat) / 20579643823436247475726881609854109094140898375539706326264525) [(7, 2), (11, 2), (12, 1)],
  term ((-236801443996489053408 : Rat) / 123978807561639952033) [(7, 2), (11, 2), (12, 1), (16, 1)],
  term ((332018839050788665058 : Rat) / 619894037808199760165) [(7, 2), (11, 2), (16, 1)],
  term ((292888862170297680991699078971329934174727431199500672389086484361991354377656399 : Rat) / 261167999690640563962647480903484654926947316642883970889608888191124524032000) [(7, 2), (12, 1)],
  term ((4463852145420803622749772805035124915378261035102117072296689209101482781731 : Rat) / 3389627254433668720860319819020050071472551401436438686671735326594741488) [(7, 2), (12, 1), (13, 1), (15, 1)],
  term ((1697620777324149364377 : Rat) / 123978807561639952033) [(7, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-268915831987638908128696572149047438646508089054720179592127311111 : Rat) / 222260153293111472737850321386424378216721702455828828323656870) [(7, 2), (12, 1), (13, 2)],
  term ((-79223735924044553810744 : Rat) / 4339258264657398321155) [(7, 2), (12, 1), (13, 2), (16, 1)],
  term ((3149149553489948 : Rat) / 3146696864482101) [(7, 3), (8, 1), (15, 1)],
  term ((12596598213959792 : Rat) / 3146696864482101) [(7, 3), (8, 1), (15, 1), (16, 1)],
  term ((-6298299106979896 : Rat) / 3146696864482101) [(7, 3), (8, 2), (15, 1), (16, 1)],
  term ((-3149149553489948 : Rat) / 1048898954827367) [(7, 3), (9, 1)],
  term ((6298299106979896 : Rat) / 3146696864482101) [(7, 3), (15, 1)],
  term ((-25569837390091601182999339401177806029551201919155052135341825386339222462070049 : Rat) / 16322999980665035247665467556467790932934207290180248180600555511945282752000) [(7, 4)],
  term ((-3149149553489948 : Rat) / 1048898954827367) [(7, 4), (8, 1)],
  term ((-1063271254698166725818 : Rat) / 32049107564750198685) [(7, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 14, terms 200 through 299. -/
theorem rs_R009_ueqv_R009NYNYN_block_14_0200_0299_valid :
    checkProductSumEq rs_R009_ueqv_R009NYNYN_partials_14_0200_0299
      rs_R009_ueqv_R009NYNYN_block_14_0200_0299 = true := by
  native_decide

end R009UeqvR009NYNYNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
