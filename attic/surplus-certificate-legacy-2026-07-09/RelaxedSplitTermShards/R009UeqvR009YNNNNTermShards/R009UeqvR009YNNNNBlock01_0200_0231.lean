/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009YNNNN, term block 1:200-231

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009YNNNNTermShards

/-- Generator polynomial 1 for relaxed split surplus certificate `R009:u=v:R009YNNNN`. -/
def rs_R009_ueqv_R009YNNNN_generator_01_0200_0231 : Poly :=
[
  term (1 : Rat) [(0, 2)],
  term (1 : Rat) [(1, 2)],
  term (-1 : Rat) [(8, 2)],
  term (-1 : Rat) [(9, 2)]
]

/-- Coefficient term 200 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009YNNNN_coefficient_01_0200 : Poly :=
[
  term ((-37256425278503 : Rat) / 118411071912) [(11, 1), (13, 1)]
]

/-- Partial product 200 for generator 1. -/
def rs_R009_ueqv_R009YNNNN_partial_01_0200 : Poly :=
[
  term ((-37256425278503 : Rat) / 118411071912) [(0, 2), (11, 1), (13, 1)],
  term ((-37256425278503 : Rat) / 118411071912) [(1, 2), (11, 1), (13, 1)],
  term ((37256425278503 : Rat) / 118411071912) [(8, 2), (11, 1), (13, 1)],
  term ((37256425278503 : Rat) / 118411071912) [(9, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 200 for generator 1. -/
theorem rs_R009_ueqv_R009YNNNN_partial_01_0200_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_01_0200
        rs_R009_ueqv_R009YNNNN_generator_01_0200_0231 =
      rs_R009_ueqv_R009YNNNN_partial_01_0200 := by
  native_decide

/-- Coefficient term 201 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009YNNNN_coefficient_01_0201 : Poly :=
[
  term ((-480354093832929817 : Rat) / 626631392558304) [(11, 1), (13, 1), (14, 1)]
]

/-- Partial product 201 for generator 1. -/
def rs_R009_ueqv_R009YNNNN_partial_01_0201 : Poly :=
[
  term ((-480354093832929817 : Rat) / 626631392558304) [(0, 2), (11, 1), (13, 1), (14, 1)],
  term ((-480354093832929817 : Rat) / 626631392558304) [(1, 2), (11, 1), (13, 1), (14, 1)],
  term ((480354093832929817 : Rat) / 626631392558304) [(8, 2), (11, 1), (13, 1), (14, 1)],
  term ((480354093832929817 : Rat) / 626631392558304) [(9, 2), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 201 for generator 1. -/
theorem rs_R009_ueqv_R009YNNNN_partial_01_0201_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_01_0201
        rs_R009_ueqv_R009YNNNN_generator_01_0200_0231 =
      rs_R009_ueqv_R009YNNNN_partial_01_0201 := by
  native_decide

/-- Coefficient term 202 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009YNNNN_coefficient_01_0202 : Poly :=
[
  term ((28285 : Rat) / 1008) [(11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 202 for generator 1. -/
def rs_R009_ueqv_R009YNNNN_partial_01_0202 : Poly :=
[
  term ((28285 : Rat) / 1008) [(0, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((28285 : Rat) / 1008) [(1, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-28285 : Rat) / 1008) [(8, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-28285 : Rat) / 1008) [(9, 2), (11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 202 for generator 1. -/
theorem rs_R009_ueqv_R009YNNNN_partial_01_0202_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_01_0202
        rs_R009_ueqv_R009YNNNN_generator_01_0200_0231 =
      rs_R009_ueqv_R009YNNNN_partial_01_0202 := by
  native_decide

/-- Coefficient term 203 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009YNNNN_coefficient_01_0203 : Poly :=
[
  term ((-239616 : Rat) / 553) [(11, 1), (13, 1), (15, 2)]
]

/-- Partial product 203 for generator 1. -/
def rs_R009_ueqv_R009YNNNN_partial_01_0203 : Poly :=
[
  term ((-239616 : Rat) / 553) [(0, 2), (11, 1), (13, 1), (15, 2)],
  term ((-239616 : Rat) / 553) [(1, 2), (11, 1), (13, 1), (15, 2)],
  term ((239616 : Rat) / 553) [(8, 2), (11, 1), (13, 1), (15, 2)],
  term ((239616 : Rat) / 553) [(9, 2), (11, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 203 for generator 1. -/
theorem rs_R009_ueqv_R009YNNNN_partial_01_0203_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_01_0203
        rs_R009_ueqv_R009YNNNN_generator_01_0200_0231 =
      rs_R009_ueqv_R009YNNNN_partial_01_0203 := by
  native_decide

/-- Coefficient term 204 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009YNNNN_coefficient_01_0204 : Poly :=
[
  term ((-365 : Rat) / 84) [(11, 1), (13, 1), (16, 1)]
]

/-- Partial product 204 for generator 1. -/
def rs_R009_ueqv_R009YNNNN_partial_01_0204 : Poly :=
[
  term ((-365 : Rat) / 84) [(0, 2), (11, 1), (13, 1), (16, 1)],
  term ((-365 : Rat) / 84) [(1, 2), (11, 1), (13, 1), (16, 1)],
  term ((365 : Rat) / 84) [(8, 2), (11, 1), (13, 1), (16, 1)],
  term ((365 : Rat) / 84) [(9, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 204 for generator 1. -/
theorem rs_R009_ueqv_R009YNNNN_partial_01_0204_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_01_0204
        rs_R009_ueqv_R009YNNNN_generator_01_0200_0231 =
      rs_R009_ueqv_R009YNNNN_partial_01_0204 := by
  native_decide

/-- Coefficient term 205 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009YNNNN_coefficient_01_0205 : Poly :=
[
  term ((22660124892005771 : Rat) / 52219282713192) [(11, 1), (14, 1), (15, 1)]
]

/-- Partial product 205 for generator 1. -/
def rs_R009_ueqv_R009YNNNN_partial_01_0205 : Poly :=
[
  term ((22660124892005771 : Rat) / 52219282713192) [(0, 2), (11, 1), (14, 1), (15, 1)],
  term ((22660124892005771 : Rat) / 52219282713192) [(1, 2), (11, 1), (14, 1), (15, 1)],
  term ((-22660124892005771 : Rat) / 52219282713192) [(8, 2), (11, 1), (14, 1), (15, 1)],
  term ((-22660124892005771 : Rat) / 52219282713192) [(9, 2), (11, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 205 for generator 1. -/
theorem rs_R009_ueqv_R009YNNNN_partial_01_0205_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_01_0205
        rs_R009_ueqv_R009YNNNN_generator_01_0200_0231 =
      rs_R009_ueqv_R009YNNNN_partial_01_0205 := by
  native_decide

/-- Coefficient term 206 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009YNNNN_coefficient_01_0206 : Poly :=
[
  term ((-5773 : Rat) / 252) [(11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 206 for generator 1. -/
def rs_R009_ueqv_R009YNNNN_partial_01_0206 : Poly :=
[
  term ((-5773 : Rat) / 252) [(0, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5773 : Rat) / 252) [(1, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((5773 : Rat) / 252) [(8, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((5773 : Rat) / 252) [(9, 2), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 206 for generator 1. -/
theorem rs_R009_ueqv_R009YNNNN_partial_01_0206_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_01_0206
        rs_R009_ueqv_R009YNNNN_generator_01_0200_0231 =
      rs_R009_ueqv_R009YNNNN_partial_01_0206 := by
  native_decide

/-- Coefficient term 207 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009YNNNN_coefficient_01_0207 : Poly :=
[
  term ((-3064399565618 : Rat) / 26861770943) [(11, 1), (14, 2), (15, 1)]
]

/-- Partial product 207 for generator 1. -/
def rs_R009_ueqv_R009YNNNN_partial_01_0207 : Poly :=
[
  term ((-3064399565618 : Rat) / 26861770943) [(0, 2), (11, 1), (14, 2), (15, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(1, 2), (11, 1), (14, 2), (15, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(8, 2), (11, 1), (14, 2), (15, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(9, 2), (11, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 207 for generator 1. -/
theorem rs_R009_ueqv_R009YNNNN_partial_01_0207_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_01_0207
        rs_R009_ueqv_R009YNNNN_generator_01_0200_0231 =
      rs_R009_ueqv_R009YNNNN_partial_01_0207 := by
  native_decide

/-- Coefficient term 208 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009YNNNN_coefficient_01_0208 : Poly :=
[
  term ((-65669943616940867 : Rat) / 52219282713192) [(11, 1), (15, 1)]
]

/-- Partial product 208 for generator 1. -/
def rs_R009_ueqv_R009YNNNN_partial_01_0208 : Poly :=
[
  term ((-65669943616940867 : Rat) / 52219282713192) [(0, 2), (11, 1), (15, 1)],
  term ((-65669943616940867 : Rat) / 52219282713192) [(1, 2), (11, 1), (15, 1)],
  term ((65669943616940867 : Rat) / 52219282713192) [(8, 2), (11, 1), (15, 1)],
  term ((65669943616940867 : Rat) / 52219282713192) [(9, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 208 for generator 1. -/
theorem rs_R009_ueqv_R009YNNNN_partial_01_0208_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_01_0208
        rs_R009_ueqv_R009YNNNN_generator_01_0200_0231 =
      rs_R009_ueqv_R009YNNNN_partial_01_0208 := by
  native_decide

/-- Coefficient term 209 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009YNNNN_coefficient_01_0209 : Poly :=
[
  term ((83 : Rat) / 21) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 209 for generator 1. -/
def rs_R009_ueqv_R009YNNNN_partial_01_0209 : Poly :=
[
  term ((83 : Rat) / 21) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((83 : Rat) / 21) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((-83 : Rat) / 21) [(8, 2), (11, 1), (15, 1), (16, 1)],
  term ((-83 : Rat) / 21) [(9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 209 for generator 1. -/
theorem rs_R009_ueqv_R009YNNNN_partial_01_0209_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_01_0209
        rs_R009_ueqv_R009YNNNN_generator_01_0200_0231 =
      rs_R009_ueqv_R009YNNNN_partial_01_0209 := by
  native_decide

/-- Coefficient term 210 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009YNNNN_coefficient_01_0210 : Poly :=
[
  term ((-1643733960565 : Rat) / 44404151967) [(11, 2)]
]

/-- Partial product 210 for generator 1. -/
def rs_R009_ueqv_R009YNNNN_partial_01_0210 : Poly :=
[
  term ((-1643733960565 : Rat) / 44404151967) [(0, 2), (11, 2)],
  term ((-1643733960565 : Rat) / 44404151967) [(1, 2), (11, 2)],
  term ((1643733960565 : Rat) / 44404151967) [(8, 2), (11, 2)],
  term ((1643733960565 : Rat) / 44404151967) [(9, 2), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 210 for generator 1. -/
theorem rs_R009_ueqv_R009YNNNN_partial_01_0210_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_01_0210
        rs_R009_ueqv_R009YNNNN_generator_01_0200_0231 =
      rs_R009_ueqv_R009YNNNN_partial_01_0210 := by
  native_decide

/-- Coefficient term 211 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009YNNNN_coefficient_01_0211 : Poly :=
[
  term ((25721602787252083 : Rat) / 26109641356596) [(11, 2), (14, 1)]
]

/-- Partial product 211 for generator 1. -/
def rs_R009_ueqv_R009YNNNN_partial_01_0211 : Poly :=
[
  term ((25721602787252083 : Rat) / 26109641356596) [(0, 2), (11, 2), (14, 1)],
  term ((25721602787252083 : Rat) / 26109641356596) [(1, 2), (11, 2), (14, 1)],
  term ((-25721602787252083 : Rat) / 26109641356596) [(8, 2), (11, 2), (14, 1)],
  term ((-25721602787252083 : Rat) / 26109641356596) [(9, 2), (11, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 211 for generator 1. -/
theorem rs_R009_ueqv_R009YNNNN_partial_01_0211_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_01_0211
        rs_R009_ueqv_R009YNNNN_generator_01_0200_0231 =
      rs_R009_ueqv_R009YNNNN_partial_01_0211 := by
  native_decide

/-- Coefficient term 212 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009YNNNN_coefficient_01_0212 : Poly :=
[
  term ((33914372062054321 : Rat) / 104438565426384) [(13, 1), (14, 1), (15, 1)]
]

/-- Partial product 212 for generator 1. -/
def rs_R009_ueqv_R009YNNNN_partial_01_0212 : Poly :=
[
  term ((33914372062054321 : Rat) / 104438565426384) [(0, 2), (13, 1), (14, 1), (15, 1)],
  term ((33914372062054321 : Rat) / 104438565426384) [(1, 2), (13, 1), (14, 1), (15, 1)],
  term ((-33914372062054321 : Rat) / 104438565426384) [(8, 2), (13, 1), (14, 1), (15, 1)],
  term ((-33914372062054321 : Rat) / 104438565426384) [(9, 2), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 212 for generator 1. -/
theorem rs_R009_ueqv_R009YNNNN_partial_01_0212_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_01_0212
        rs_R009_ueqv_R009YNNNN_generator_01_0200_0231 =
      rs_R009_ueqv_R009YNNNN_partial_01_0212 := by
  native_decide

/-- Coefficient term 213 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009YNNNN_coefficient_01_0213 : Poly :=
[
  term ((-1331 : Rat) / 504) [(13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 213 for generator 1. -/
def rs_R009_ueqv_R009YNNNN_partial_01_0213 : Poly :=
[
  term ((-1331 : Rat) / 504) [(0, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1331 : Rat) / 504) [(1, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1331 : Rat) / 504) [(8, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1331 : Rat) / 504) [(9, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 213 for generator 1. -/
theorem rs_R009_ueqv_R009YNNNN_partial_01_0213_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_01_0213
        rs_R009_ueqv_R009YNNNN_generator_01_0200_0231 =
      rs_R009_ueqv_R009YNNNN_partial_01_0213 := by
  native_decide

/-- Coefficient term 214 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009YNNNN_coefficient_01_0214 : Poly :=
[
  term ((-1532199782809 : Rat) / 26861770943) [(13, 1), (14, 2), (15, 1)]
]

/-- Partial product 214 for generator 1. -/
def rs_R009_ueqv_R009YNNNN_partial_01_0214 : Poly :=
[
  term ((-1532199782809 : Rat) / 26861770943) [(0, 2), (13, 1), (14, 2), (15, 1)],
  term ((-1532199782809 : Rat) / 26861770943) [(1, 2), (13, 1), (14, 2), (15, 1)],
  term ((1532199782809 : Rat) / 26861770943) [(8, 2), (13, 1), (14, 2), (15, 1)],
  term ((1532199782809 : Rat) / 26861770943) [(9, 2), (13, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 214 for generator 1. -/
theorem rs_R009_ueqv_R009YNNNN_partial_01_0214_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_01_0214
        rs_R009_ueqv_R009YNNNN_generator_01_0200_0231 =
      rs_R009_ueqv_R009YNNNN_partial_01_0214 := by
  native_decide

/-- Coefficient term 215 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009YNNNN_coefficient_01_0215 : Poly :=
[
  term ((-51777851921837 : Rat) / 1133148991968) [(13, 1), (15, 1)]
]

/-- Partial product 215 for generator 1. -/
def rs_R009_ueqv_R009YNNNN_partial_01_0215 : Poly :=
[
  term ((-51777851921837 : Rat) / 1133148991968) [(0, 2), (13, 1), (15, 1)],
  term ((-51777851921837 : Rat) / 1133148991968) [(1, 2), (13, 1), (15, 1)],
  term ((51777851921837 : Rat) / 1133148991968) [(8, 2), (13, 1), (15, 1)],
  term ((51777851921837 : Rat) / 1133148991968) [(9, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 215 for generator 1. -/
theorem rs_R009_ueqv_R009YNNNN_partial_01_0215_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_01_0215
        rs_R009_ueqv_R009YNNNN_generator_01_0200_0231 =
      rs_R009_ueqv_R009YNNNN_partial_01_0215 := by
  native_decide

/-- Coefficient term 216 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009YNNNN_coefficient_01_0216 : Poly :=
[
  term ((5519 : Rat) / 1008) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 216 for generator 1. -/
def rs_R009_ueqv_R009YNNNN_partial_01_0216 : Poly :=
[
  term ((5519 : Rat) / 1008) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((5519 : Rat) / 1008) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((-5519 : Rat) / 1008) [(8, 2), (13, 1), (15, 1), (16, 1)],
  term ((-5519 : Rat) / 1008) [(9, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 216 for generator 1. -/
theorem rs_R009_ueqv_R009YNNNN_partial_01_0216_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_01_0216
        rs_R009_ueqv_R009YNNNN_generator_01_0200_0231 =
      rs_R009_ueqv_R009YNNNN_partial_01_0216 := by
  native_decide

/-- Coefficient term 217 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009YNNNN_coefficient_01_0217 : Poly :=
[
  term ((-3366906314273 : Rat) / 14801383989) [(13, 1), (15, 3)]
]

/-- Partial product 217 for generator 1. -/
def rs_R009_ueqv_R009YNNNN_partial_01_0217 : Poly :=
[
  term ((-3366906314273 : Rat) / 14801383989) [(0, 2), (13, 1), (15, 3)],
  term ((-3366906314273 : Rat) / 14801383989) [(1, 2), (13, 1), (15, 3)],
  term ((3366906314273 : Rat) / 14801383989) [(8, 2), (13, 1), (15, 3)],
  term ((3366906314273 : Rat) / 14801383989) [(9, 2), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 217 for generator 1. -/
theorem rs_R009_ueqv_R009YNNNN_partial_01_0217_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_01_0217
        rs_R009_ueqv_R009YNNNN_generator_01_0200_0231 =
      rs_R009_ueqv_R009YNNNN_partial_01_0217 := by
  native_decide

/-- Coefficient term 218 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009YNNNN_coefficient_01_0218 : Poly :=
[
  term ((130 : Rat) / 7) [(13, 1), (15, 3), (16, 1)]
]

/-- Partial product 218 for generator 1. -/
def rs_R009_ueqv_R009YNNNN_partial_01_0218 : Poly :=
[
  term ((130 : Rat) / 7) [(0, 2), (13, 1), (15, 3), (16, 1)],
  term ((130 : Rat) / 7) [(1, 2), (13, 1), (15, 3), (16, 1)],
  term ((-130 : Rat) / 7) [(8, 2), (13, 1), (15, 3), (16, 1)],
  term ((-130 : Rat) / 7) [(9, 2), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 218 for generator 1. -/
theorem rs_R009_ueqv_R009YNNNN_partial_01_0218_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_01_0218
        rs_R009_ueqv_R009YNNNN_generator_01_0200_0231 =
      rs_R009_ueqv_R009YNNNN_partial_01_0218 := by
  native_decide

/-- Coefficient term 219 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009YNNNN_coefficient_01_0219 : Poly :=
[
  term ((21237961691585 : Rat) / 1420932862944) [(13, 2)]
]

/-- Partial product 219 for generator 1. -/
def rs_R009_ueqv_R009YNNNN_partial_01_0219 : Poly :=
[
  term ((21237961691585 : Rat) / 1420932862944) [(0, 2), (13, 2)],
  term ((21237961691585 : Rat) / 1420932862944) [(1, 2), (13, 2)],
  term ((-21237961691585 : Rat) / 1420932862944) [(8, 2), (13, 2)],
  term ((-21237961691585 : Rat) / 1420932862944) [(9, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 219 for generator 1. -/
theorem rs_R009_ueqv_R009YNNNN_partial_01_0219_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_01_0219
        rs_R009_ueqv_R009YNNNN_generator_01_0200_0231 =
      rs_R009_ueqv_R009YNNNN_partial_01_0219 := by
  native_decide

/-- Coefficient term 220 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009YNNNN_coefficient_01_0220 : Poly :=
[
  term ((-4107634761925799 : Rat) / 6394197883248) [(13, 2), (14, 1)]
]

/-- Partial product 220 for generator 1. -/
def rs_R009_ueqv_R009YNNNN_partial_01_0220 : Poly :=
[
  term ((-4107634761925799 : Rat) / 6394197883248) [(0, 2), (13, 2), (14, 1)],
  term ((-4107634761925799 : Rat) / 6394197883248) [(1, 2), (13, 2), (14, 1)],
  term ((4107634761925799 : Rat) / 6394197883248) [(8, 2), (13, 2), (14, 1)],
  term ((4107634761925799 : Rat) / 6394197883248) [(9, 2), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 220 for generator 1. -/
theorem rs_R009_ueqv_R009YNNNN_partial_01_0220_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_01_0220
        rs_R009_ueqv_R009YNNNN_generator_01_0200_0231 =
      rs_R009_ueqv_R009YNNNN_partial_01_0220 := by
  native_decide

/-- Coefficient term 221 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009YNNNN_coefficient_01_0221 : Poly :=
[
  term ((725 : Rat) / 72) [(13, 2), (14, 1), (16, 1)]
]

/-- Partial product 221 for generator 1. -/
def rs_R009_ueqv_R009YNNNN_partial_01_0221 : Poly :=
[
  term ((725 : Rat) / 72) [(0, 2), (13, 2), (14, 1), (16, 1)],
  term ((725 : Rat) / 72) [(1, 2), (13, 2), (14, 1), (16, 1)],
  term ((-725 : Rat) / 72) [(8, 2), (13, 2), (14, 1), (16, 1)],
  term ((-725 : Rat) / 72) [(9, 2), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 221 for generator 1. -/
theorem rs_R009_ueqv_R009YNNNN_partial_01_0221_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_01_0221
        rs_R009_ueqv_R009YNNNN_generator_01_0200_0231 =
      rs_R009_ueqv_R009YNNNN_partial_01_0221 := by
  native_decide

/-- Coefficient term 222 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009YNNNN_coefficient_01_0222 : Poly :=
[
  term ((2954048478533 : Rat) / 19735178652) [(13, 2), (15, 2)]
]

/-- Partial product 222 for generator 1. -/
def rs_R009_ueqv_R009YNNNN_partial_01_0222 : Poly :=
[
  term ((2954048478533 : Rat) / 19735178652) [(0, 2), (13, 2), (15, 2)],
  term ((2954048478533 : Rat) / 19735178652) [(1, 2), (13, 2), (15, 2)],
  term ((-2954048478533 : Rat) / 19735178652) [(8, 2), (13, 2), (15, 2)],
  term ((-2954048478533 : Rat) / 19735178652) [(9, 2), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 222 for generator 1. -/
theorem rs_R009_ueqv_R009YNNNN_partial_01_0222_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_01_0222
        rs_R009_ueqv_R009YNNNN_generator_01_0200_0231 =
      rs_R009_ueqv_R009YNNNN_partial_01_0222 := by
  native_decide

/-- Coefficient term 223 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009YNNNN_coefficient_01_0223 : Poly :=
[
  term ((-305 : Rat) / 14) [(13, 2), (15, 2), (16, 1)]
]

/-- Partial product 223 for generator 1. -/
def rs_R009_ueqv_R009YNNNN_partial_01_0223 : Poly :=
[
  term ((-305 : Rat) / 14) [(0, 2), (13, 2), (15, 2), (16, 1)],
  term ((-305 : Rat) / 14) [(1, 2), (13, 2), (15, 2), (16, 1)],
  term ((305 : Rat) / 14) [(8, 2), (13, 2), (15, 2), (16, 1)],
  term ((305 : Rat) / 14) [(9, 2), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 223 for generator 1. -/
theorem rs_R009_ueqv_R009YNNNN_partial_01_0223_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_01_0223
        rs_R009_ueqv_R009YNNNN_generator_01_0200_0231 =
      rs_R009_ueqv_R009YNNNN_partial_01_0223 := by
  native_decide

/-- Coefficient term 224 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009YNNNN_coefficient_01_0224 : Poly :=
[
  term ((-3295 : Rat) / 336) [(13, 2), (16, 1)]
]

/-- Partial product 224 for generator 1. -/
def rs_R009_ueqv_R009YNNNN_partial_01_0224 : Poly :=
[
  term ((-3295 : Rat) / 336) [(0, 2), (13, 2), (16, 1)],
  term ((-3295 : Rat) / 336) [(1, 2), (13, 2), (16, 1)],
  term ((3295 : Rat) / 336) [(8, 2), (13, 2), (16, 1)],
  term ((3295 : Rat) / 336) [(9, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 224 for generator 1. -/
theorem rs_R009_ueqv_R009YNNNN_partial_01_0224_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_01_0224
        rs_R009_ueqv_R009YNNNN_generator_01_0200_0231 =
      rs_R009_ueqv_R009YNNNN_partial_01_0224 := by
  native_decide

/-- Coefficient term 225 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009YNNNN_coefficient_01_0225 : Poly :=
[
  term ((-36703819487341327 : Rat) / 208877130852768) [(14, 1)]
]

/-- Partial product 225 for generator 1. -/
def rs_R009_ueqv_R009YNNNN_partial_01_0225 : Poly :=
[
  term ((-36703819487341327 : Rat) / 208877130852768) [(0, 2), (14, 1)],
  term ((-36703819487341327 : Rat) / 208877130852768) [(1, 2), (14, 1)],
  term ((36703819487341327 : Rat) / 208877130852768) [(8, 2), (14, 1)],
  term ((36703819487341327 : Rat) / 208877130852768) [(9, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 225 for generator 1. -/
theorem rs_R009_ueqv_R009YNNNN_partial_01_0225_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_01_0225
        rs_R009_ueqv_R009YNNNN_generator_01_0200_0231 =
      rs_R009_ueqv_R009YNNNN_partial_01_0225 := by
  native_decide

/-- Coefficient term 226 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009YNNNN_coefficient_01_0226 : Poly :=
[
  term ((413194774214435 : Rat) / 2901071261844) [(14, 1), (15, 2)]
]

/-- Partial product 226 for generator 1. -/
def rs_R009_ueqv_R009YNNNN_partial_01_0226 : Poly :=
[
  term ((413194774214435 : Rat) / 2901071261844) [(0, 2), (14, 1), (15, 2)],
  term ((413194774214435 : Rat) / 2901071261844) [(1, 2), (14, 1), (15, 2)],
  term ((-413194774214435 : Rat) / 2901071261844) [(8, 2), (14, 1), (15, 2)],
  term ((-413194774214435 : Rat) / 2901071261844) [(9, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 226 for generator 1. -/
theorem rs_R009_ueqv_R009YNNNN_partial_01_0226_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_01_0226
        rs_R009_ueqv_R009YNNNN_generator_01_0200_0231 =
      rs_R009_ueqv_R009YNNNN_partial_01_0226 := by
  native_decide

/-- Coefficient term 227 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009YNNNN_coefficient_01_0227 : Poly :=
[
  term ((-65 : Rat) / 14) [(14, 1), (15, 2), (16, 1)]
]

/-- Partial product 227 for generator 1. -/
def rs_R009_ueqv_R009YNNNN_partial_01_0227 : Poly :=
[
  term ((-65 : Rat) / 14) [(0, 2), (14, 1), (15, 2), (16, 1)],
  term ((-65 : Rat) / 14) [(1, 2), (14, 1), (15, 2), (16, 1)],
  term ((65 : Rat) / 14) [(8, 2), (14, 1), (15, 2), (16, 1)],
  term ((65 : Rat) / 14) [(9, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 227 for generator 1. -/
theorem rs_R009_ueqv_R009YNNNN_partial_01_0227_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_01_0227
        rs_R009_ueqv_R009YNNNN_generator_01_0200_0231 =
      rs_R009_ueqv_R009YNNNN_partial_01_0227 := by
  native_decide

/-- Coefficient term 228 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009YNNNN_coefficient_01_0228 : Poly :=
[
  term ((16 : Rat) / 21) [(14, 1), (16, 1)]
]

/-- Partial product 228 for generator 1. -/
def rs_R009_ueqv_R009YNNNN_partial_01_0228 : Poly :=
[
  term ((16 : Rat) / 21) [(0, 2), (14, 1), (16, 1)],
  term ((16 : Rat) / 21) [(1, 2), (14, 1), (16, 1)],
  term ((-16 : Rat) / 21) [(8, 2), (14, 1), (16, 1)],
  term ((-16 : Rat) / 21) [(9, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 228 for generator 1. -/
theorem rs_R009_ueqv_R009YNNNN_partial_01_0228_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_01_0228
        rs_R009_ueqv_R009YNNNN_generator_01_0200_0231 =
      rs_R009_ueqv_R009YNNNN_partial_01_0228 := by
  native_decide

/-- Coefficient term 229 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009YNNNN_coefficient_01_0229 : Poly :=
[
  term ((122681445924503923 : Rat) / 208877130852768) [(14, 2)]
]

/-- Partial product 229 for generator 1. -/
def rs_R009_ueqv_R009YNNNN_partial_01_0229 : Poly :=
[
  term ((122681445924503923 : Rat) / 208877130852768) [(0, 2), (14, 2)],
  term ((122681445924503923 : Rat) / 208877130852768) [(1, 2), (14, 2)],
  term ((-122681445924503923 : Rat) / 208877130852768) [(8, 2), (14, 2)],
  term ((-122681445924503923 : Rat) / 208877130852768) [(9, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 229 for generator 1. -/
theorem rs_R009_ueqv_R009YNNNN_partial_01_0229_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_01_0229
        rs_R009_ueqv_R009YNNNN_generator_01_0200_0231 =
      rs_R009_ueqv_R009YNNNN_partial_01_0229 := by
  native_decide

/-- Coefficient term 230 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009YNNNN_coefficient_01_0230 : Poly :=
[
  term ((158982611033841695 : Rat) / 208877130852768) [(15, 2)]
]

/-- Partial product 230 for generator 1. -/
def rs_R009_ueqv_R009YNNNN_partial_01_0230 : Poly :=
[
  term ((158982611033841695 : Rat) / 208877130852768) [(0, 2), (15, 2)],
  term ((158982611033841695 : Rat) / 208877130852768) [(1, 2), (15, 2)],
  term ((-158982611033841695 : Rat) / 208877130852768) [(8, 2), (15, 2)],
  term ((-158982611033841695 : Rat) / 208877130852768) [(9, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 230 for generator 1. -/
theorem rs_R009_ueqv_R009YNNNN_partial_01_0230_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_01_0230
        rs_R009_ueqv_R009YNNNN_generator_01_0200_0231 =
      rs_R009_ueqv_R009YNNNN_partial_01_0230 := by
  native_decide

/-- Coefficient term 231 from coefficient polynomial 1. -/
def rs_R009_ueqv_R009YNNNN_coefficient_01_0231 : Poly :=
[
  term ((-407 : Rat) / 252) [(15, 2), (16, 1)]
]

/-- Partial product 231 for generator 1. -/
def rs_R009_ueqv_R009YNNNN_partial_01_0231 : Poly :=
[
  term ((-407 : Rat) / 252) [(0, 2), (15, 2), (16, 1)],
  term ((-407 : Rat) / 252) [(1, 2), (15, 2), (16, 1)],
  term ((407 : Rat) / 252) [(8, 2), (15, 2), (16, 1)],
  term ((407 : Rat) / 252) [(9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 231 for generator 1. -/
theorem rs_R009_ueqv_R009YNNNN_partial_01_0231_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_01_0231
        rs_R009_ueqv_R009YNNNN_generator_01_0200_0231 =
      rs_R009_ueqv_R009YNNNN_partial_01_0231 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009YNNNN_partials_01_0200_0231 : List Poly :=
[
  rs_R009_ueqv_R009YNNNN_partial_01_0200,
  rs_R009_ueqv_R009YNNNN_partial_01_0201,
  rs_R009_ueqv_R009YNNNN_partial_01_0202,
  rs_R009_ueqv_R009YNNNN_partial_01_0203,
  rs_R009_ueqv_R009YNNNN_partial_01_0204,
  rs_R009_ueqv_R009YNNNN_partial_01_0205,
  rs_R009_ueqv_R009YNNNN_partial_01_0206,
  rs_R009_ueqv_R009YNNNN_partial_01_0207,
  rs_R009_ueqv_R009YNNNN_partial_01_0208,
  rs_R009_ueqv_R009YNNNN_partial_01_0209,
  rs_R009_ueqv_R009YNNNN_partial_01_0210,
  rs_R009_ueqv_R009YNNNN_partial_01_0211,
  rs_R009_ueqv_R009YNNNN_partial_01_0212,
  rs_R009_ueqv_R009YNNNN_partial_01_0213,
  rs_R009_ueqv_R009YNNNN_partial_01_0214,
  rs_R009_ueqv_R009YNNNN_partial_01_0215,
  rs_R009_ueqv_R009YNNNN_partial_01_0216,
  rs_R009_ueqv_R009YNNNN_partial_01_0217,
  rs_R009_ueqv_R009YNNNN_partial_01_0218,
  rs_R009_ueqv_R009YNNNN_partial_01_0219,
  rs_R009_ueqv_R009YNNNN_partial_01_0220,
  rs_R009_ueqv_R009YNNNN_partial_01_0221,
  rs_R009_ueqv_R009YNNNN_partial_01_0222,
  rs_R009_ueqv_R009YNNNN_partial_01_0223,
  rs_R009_ueqv_R009YNNNN_partial_01_0224,
  rs_R009_ueqv_R009YNNNN_partial_01_0225,
  rs_R009_ueqv_R009YNNNN_partial_01_0226,
  rs_R009_ueqv_R009YNNNN_partial_01_0227,
  rs_R009_ueqv_R009YNNNN_partial_01_0228,
  rs_R009_ueqv_R009YNNNN_partial_01_0229,
  rs_R009_ueqv_R009YNNNN_partial_01_0230,
  rs_R009_ueqv_R009YNNNN_partial_01_0231
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009YNNNN_block_01_0200_0231 : Poly :=
[
  term ((-37256425278503 : Rat) / 118411071912) [(0, 2), (11, 1), (13, 1)],
  term ((-480354093832929817 : Rat) / 626631392558304) [(0, 2), (11, 1), (13, 1), (14, 1)],
  term ((28285 : Rat) / 1008) [(0, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-239616 : Rat) / 553) [(0, 2), (11, 1), (13, 1), (15, 2)],
  term ((-365 : Rat) / 84) [(0, 2), (11, 1), (13, 1), (16, 1)],
  term ((22660124892005771 : Rat) / 52219282713192) [(0, 2), (11, 1), (14, 1), (15, 1)],
  term ((-5773 : Rat) / 252) [(0, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(0, 2), (11, 1), (14, 2), (15, 1)],
  term ((-65669943616940867 : Rat) / 52219282713192) [(0, 2), (11, 1), (15, 1)],
  term ((83 : Rat) / 21) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((-1643733960565 : Rat) / 44404151967) [(0, 2), (11, 2)],
  term ((25721602787252083 : Rat) / 26109641356596) [(0, 2), (11, 2), (14, 1)],
  term ((33914372062054321 : Rat) / 104438565426384) [(0, 2), (13, 1), (14, 1), (15, 1)],
  term ((-1331 : Rat) / 504) [(0, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1532199782809 : Rat) / 26861770943) [(0, 2), (13, 1), (14, 2), (15, 1)],
  term ((-51777851921837 : Rat) / 1133148991968) [(0, 2), (13, 1), (15, 1)],
  term ((5519 : Rat) / 1008) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((-3366906314273 : Rat) / 14801383989) [(0, 2), (13, 1), (15, 3)],
  term ((130 : Rat) / 7) [(0, 2), (13, 1), (15, 3), (16, 1)],
  term ((21237961691585 : Rat) / 1420932862944) [(0, 2), (13, 2)],
  term ((-4107634761925799 : Rat) / 6394197883248) [(0, 2), (13, 2), (14, 1)],
  term ((725 : Rat) / 72) [(0, 2), (13, 2), (14, 1), (16, 1)],
  term ((2954048478533 : Rat) / 19735178652) [(0, 2), (13, 2), (15, 2)],
  term ((-305 : Rat) / 14) [(0, 2), (13, 2), (15, 2), (16, 1)],
  term ((-3295 : Rat) / 336) [(0, 2), (13, 2), (16, 1)],
  term ((-36703819487341327 : Rat) / 208877130852768) [(0, 2), (14, 1)],
  term ((413194774214435 : Rat) / 2901071261844) [(0, 2), (14, 1), (15, 2)],
  term ((-65 : Rat) / 14) [(0, 2), (14, 1), (15, 2), (16, 1)],
  term ((16 : Rat) / 21) [(0, 2), (14, 1), (16, 1)],
  term ((122681445924503923 : Rat) / 208877130852768) [(0, 2), (14, 2)],
  term ((158982611033841695 : Rat) / 208877130852768) [(0, 2), (15, 2)],
  term ((-407 : Rat) / 252) [(0, 2), (15, 2), (16, 1)],
  term ((-37256425278503 : Rat) / 118411071912) [(1, 2), (11, 1), (13, 1)],
  term ((-480354093832929817 : Rat) / 626631392558304) [(1, 2), (11, 1), (13, 1), (14, 1)],
  term ((28285 : Rat) / 1008) [(1, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-239616 : Rat) / 553) [(1, 2), (11, 1), (13, 1), (15, 2)],
  term ((-365 : Rat) / 84) [(1, 2), (11, 1), (13, 1), (16, 1)],
  term ((22660124892005771 : Rat) / 52219282713192) [(1, 2), (11, 1), (14, 1), (15, 1)],
  term ((-5773 : Rat) / 252) [(1, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(1, 2), (11, 1), (14, 2), (15, 1)],
  term ((-65669943616940867 : Rat) / 52219282713192) [(1, 2), (11, 1), (15, 1)],
  term ((83 : Rat) / 21) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((-1643733960565 : Rat) / 44404151967) [(1, 2), (11, 2)],
  term ((25721602787252083 : Rat) / 26109641356596) [(1, 2), (11, 2), (14, 1)],
  term ((33914372062054321 : Rat) / 104438565426384) [(1, 2), (13, 1), (14, 1), (15, 1)],
  term ((-1331 : Rat) / 504) [(1, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1532199782809 : Rat) / 26861770943) [(1, 2), (13, 1), (14, 2), (15, 1)],
  term ((-51777851921837 : Rat) / 1133148991968) [(1, 2), (13, 1), (15, 1)],
  term ((5519 : Rat) / 1008) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((-3366906314273 : Rat) / 14801383989) [(1, 2), (13, 1), (15, 3)],
  term ((130 : Rat) / 7) [(1, 2), (13, 1), (15, 3), (16, 1)],
  term ((21237961691585 : Rat) / 1420932862944) [(1, 2), (13, 2)],
  term ((-4107634761925799 : Rat) / 6394197883248) [(1, 2), (13, 2), (14, 1)],
  term ((725 : Rat) / 72) [(1, 2), (13, 2), (14, 1), (16, 1)],
  term ((2954048478533 : Rat) / 19735178652) [(1, 2), (13, 2), (15, 2)],
  term ((-305 : Rat) / 14) [(1, 2), (13, 2), (15, 2), (16, 1)],
  term ((-3295 : Rat) / 336) [(1, 2), (13, 2), (16, 1)],
  term ((-36703819487341327 : Rat) / 208877130852768) [(1, 2), (14, 1)],
  term ((413194774214435 : Rat) / 2901071261844) [(1, 2), (14, 1), (15, 2)],
  term ((-65 : Rat) / 14) [(1, 2), (14, 1), (15, 2), (16, 1)],
  term ((16 : Rat) / 21) [(1, 2), (14, 1), (16, 1)],
  term ((122681445924503923 : Rat) / 208877130852768) [(1, 2), (14, 2)],
  term ((158982611033841695 : Rat) / 208877130852768) [(1, 2), (15, 2)],
  term ((-407 : Rat) / 252) [(1, 2), (15, 2), (16, 1)],
  term ((37256425278503 : Rat) / 118411071912) [(8, 2), (11, 1), (13, 1)],
  term ((480354093832929817 : Rat) / 626631392558304) [(8, 2), (11, 1), (13, 1), (14, 1)],
  term ((-28285 : Rat) / 1008) [(8, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((239616 : Rat) / 553) [(8, 2), (11, 1), (13, 1), (15, 2)],
  term ((365 : Rat) / 84) [(8, 2), (11, 1), (13, 1), (16, 1)],
  term ((-22660124892005771 : Rat) / 52219282713192) [(8, 2), (11, 1), (14, 1), (15, 1)],
  term ((5773 : Rat) / 252) [(8, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(8, 2), (11, 1), (14, 2), (15, 1)],
  term ((65669943616940867 : Rat) / 52219282713192) [(8, 2), (11, 1), (15, 1)],
  term ((-83 : Rat) / 21) [(8, 2), (11, 1), (15, 1), (16, 1)],
  term ((1643733960565 : Rat) / 44404151967) [(8, 2), (11, 2)],
  term ((-25721602787252083 : Rat) / 26109641356596) [(8, 2), (11, 2), (14, 1)],
  term ((-33914372062054321 : Rat) / 104438565426384) [(8, 2), (13, 1), (14, 1), (15, 1)],
  term ((1331 : Rat) / 504) [(8, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1532199782809 : Rat) / 26861770943) [(8, 2), (13, 1), (14, 2), (15, 1)],
  term ((51777851921837 : Rat) / 1133148991968) [(8, 2), (13, 1), (15, 1)],
  term ((-5519 : Rat) / 1008) [(8, 2), (13, 1), (15, 1), (16, 1)],
  term ((3366906314273 : Rat) / 14801383989) [(8, 2), (13, 1), (15, 3)],
  term ((-130 : Rat) / 7) [(8, 2), (13, 1), (15, 3), (16, 1)],
  term ((-21237961691585 : Rat) / 1420932862944) [(8, 2), (13, 2)],
  term ((4107634761925799 : Rat) / 6394197883248) [(8, 2), (13, 2), (14, 1)],
  term ((-725 : Rat) / 72) [(8, 2), (13, 2), (14, 1), (16, 1)],
  term ((-2954048478533 : Rat) / 19735178652) [(8, 2), (13, 2), (15, 2)],
  term ((305 : Rat) / 14) [(8, 2), (13, 2), (15, 2), (16, 1)],
  term ((3295 : Rat) / 336) [(8, 2), (13, 2), (16, 1)],
  term ((36703819487341327 : Rat) / 208877130852768) [(8, 2), (14, 1)],
  term ((-413194774214435 : Rat) / 2901071261844) [(8, 2), (14, 1), (15, 2)],
  term ((65 : Rat) / 14) [(8, 2), (14, 1), (15, 2), (16, 1)],
  term ((-16 : Rat) / 21) [(8, 2), (14, 1), (16, 1)],
  term ((-122681445924503923 : Rat) / 208877130852768) [(8, 2), (14, 2)],
  term ((-158982611033841695 : Rat) / 208877130852768) [(8, 2), (15, 2)],
  term ((407 : Rat) / 252) [(8, 2), (15, 2), (16, 1)],
  term ((37256425278503 : Rat) / 118411071912) [(9, 2), (11, 1), (13, 1)],
  term ((480354093832929817 : Rat) / 626631392558304) [(9, 2), (11, 1), (13, 1), (14, 1)],
  term ((-28285 : Rat) / 1008) [(9, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((239616 : Rat) / 553) [(9, 2), (11, 1), (13, 1), (15, 2)],
  term ((365 : Rat) / 84) [(9, 2), (11, 1), (13, 1), (16, 1)],
  term ((-22660124892005771 : Rat) / 52219282713192) [(9, 2), (11, 1), (14, 1), (15, 1)],
  term ((5773 : Rat) / 252) [(9, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(9, 2), (11, 1), (14, 2), (15, 1)],
  term ((65669943616940867 : Rat) / 52219282713192) [(9, 2), (11, 1), (15, 1)],
  term ((-83 : Rat) / 21) [(9, 2), (11, 1), (15, 1), (16, 1)],
  term ((1643733960565 : Rat) / 44404151967) [(9, 2), (11, 2)],
  term ((-25721602787252083 : Rat) / 26109641356596) [(9, 2), (11, 2), (14, 1)],
  term ((-33914372062054321 : Rat) / 104438565426384) [(9, 2), (13, 1), (14, 1), (15, 1)],
  term ((1331 : Rat) / 504) [(9, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1532199782809 : Rat) / 26861770943) [(9, 2), (13, 1), (14, 2), (15, 1)],
  term ((51777851921837 : Rat) / 1133148991968) [(9, 2), (13, 1), (15, 1)],
  term ((-5519 : Rat) / 1008) [(9, 2), (13, 1), (15, 1), (16, 1)],
  term ((3366906314273 : Rat) / 14801383989) [(9, 2), (13, 1), (15, 3)],
  term ((-130 : Rat) / 7) [(9, 2), (13, 1), (15, 3), (16, 1)],
  term ((-21237961691585 : Rat) / 1420932862944) [(9, 2), (13, 2)],
  term ((4107634761925799 : Rat) / 6394197883248) [(9, 2), (13, 2), (14, 1)],
  term ((-725 : Rat) / 72) [(9, 2), (13, 2), (14, 1), (16, 1)],
  term ((-2954048478533 : Rat) / 19735178652) [(9, 2), (13, 2), (15, 2)],
  term ((305 : Rat) / 14) [(9, 2), (13, 2), (15, 2), (16, 1)],
  term ((3295 : Rat) / 336) [(9, 2), (13, 2), (16, 1)],
  term ((36703819487341327 : Rat) / 208877130852768) [(9, 2), (14, 1)],
  term ((-413194774214435 : Rat) / 2901071261844) [(9, 2), (14, 1), (15, 2)],
  term ((65 : Rat) / 14) [(9, 2), (14, 1), (15, 2), (16, 1)],
  term ((-16 : Rat) / 21) [(9, 2), (14, 1), (16, 1)],
  term ((-122681445924503923 : Rat) / 208877130852768) [(9, 2), (14, 2)],
  term ((-158982611033841695 : Rat) / 208877130852768) [(9, 2), (15, 2)],
  term ((407 : Rat) / 252) [(9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 1, terms 200 through 231. -/
theorem rs_R009_ueqv_R009YNNNN_block_01_0200_0231_valid :
    checkProductSumEq rs_R009_ueqv_R009YNNNN_partials_01_0200_0231
      rs_R009_ueqv_R009YNNNN_block_01_0200_0231 = true := by
  native_decide

end R009UeqvR009YNNNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
